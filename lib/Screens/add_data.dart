import 'dart:io';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:path/path.dart' as document_path;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listing_project/Custom%20Widgets/icon_heading.dart';
import 'package:listing_project/Data/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddData extends StatelessWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Data',
          style: GoogleFonts.nunito(
            color: Data.secondaryColor,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Data.primaryColor,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Data.secondaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.share_outlined,
              color: Data.secondaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Data.primaryColor,
      body: const AddDataBody(),
    );
  }
}

class AddDataBody extends StatefulWidget {
  const AddDataBody({Key? key}) : super(key: key);

  @override
  State<AddDataBody> createState() => _AddDataBodyState();
}

class _AddDataBodyState extends State<AddDataBody> {
  File? selectedImage;
  bool? isLoading = false;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final key = GlobalKey<FormState>();
  
  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading!,
      child: SafeArea(
        child: Form(
          key: key,
          child: Container(
            margin: const EdgeInsets.only(
              top: 50,
            ),
            height: double.maxFinite,
            decoration: const BoxDecoration(
              color: Color(0xfff2f0e6),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(
                  35,
                ),
                topLeft: Radius.circular(
                  35,
                ),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const IconHeading(
                    icon: CupertinoIcons.text_cursor,
                    text: 'Title',
                    topMargin: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      top: 10,
                    ),
                    child: TextFormField(
                      controller: titleController,
                      validator: (String? title) {
                        if (title!.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        fillColor: Data.secondaryColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          borderSide: BorderSide(
                            color: Data.secondaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          borderSide: BorderSide(
                            color: Data.secondaryColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          borderSide: BorderSide(
                            color: Data.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const IconHeading(
                    text: 'Description',
                    icon: CupertinoIcons.text_justifyleft,
                    topMargin: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      top: 10,
                    ),
                    child: TextFormField(
                      controller: descController,
                      validator: (String? description) {
                        if (description!.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      minLines: 8,
                      maxLines: 8,
                      decoration: InputDecoration(
                        fillColor: Data.secondaryColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          borderSide: BorderSide(
                            color: Data.secondaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          borderSide: BorderSide(
                            color: Data.secondaryColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          borderSide: BorderSide(
                            color: Data.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const IconHeading(
                    icon: CupertinoIcons.photo,
                    text: 'Photo',
                    topMargin: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      final ImagePicker _picker = ImagePicker();
                      setState(() {
                        isLoading = true;
                      });
                      final XFile? image =
                          await _picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        isLoading = false;
                        selectedImage = File(image!.path);
                      });
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Data.primaryColor,
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: (selectedImage == null)
                          ? Icon(
                              Icons.add,
                              color: Data.secondaryColor,
                              size: 40,
                            )
                          : Image.file(
                            File(
                              selectedImage!.path,
                            ),
                            fit: BoxFit.fill,
                          ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 15,
                      left: 25,
                      right: 25,
                      bottom: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.nunito(
                              color: Data.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Data.secondaryColor),
                            minimumSize: MaterialStateProperty.all(const Size(150,55)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10,),
                                side: BorderSide(
                                  color: Data.primaryColor,
                                ),
                              ),
                            )
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        ElevatedButton(
                          child: Text(
                            'Submit',
                            style: GoogleFonts.nunito(
                              color: Data.secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Data.primaryColor),
                              minimumSize: MaterialStateProperty.all(const Size(150,55)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10,),
                                  side: BorderSide(
                                    color: Data.primaryColor,
                                  ),
                                ),
                              )
                          ),
                          onPressed: () async {
                            if (key.currentState!.validate() && selectedImage != null) {
                              setState(() {
                                isLoading = true;
                              });
                              int imageCounter = 0;
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              final Directory? directory =
                              await getApplicationDocumentsDirectory();
                              final String? path = directory!.path;
                              final String? fileName = document_path.basename(selectedImage!.path);
                              final String? fileExtension = document_path.extension(selectedImage!.path);
                              selectedImage =
                              await selectedImage!.copy('$path/$fileName$fileExtension');
                              while (true) {
                                if (prefs.getString('image$imageCounter') == null) {
                                  prefs.setString('image$imageCounter', '$path/$fileName$fileExtension');
                                  prefs.setString('imageTitle$imageCounter', titleController.text);
                                  prefs.setString('imageDesc$imageCounter', descController.text);
                                  print('Data Saved!');
                                  break;
                                }
                                else {
                                  imageCounter++;
                                }
                              }
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
