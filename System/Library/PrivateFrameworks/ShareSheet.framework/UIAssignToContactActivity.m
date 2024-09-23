@implementation UIAssignToContactActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    return 3;
  else
    return 0;
}

+ (BOOL)_isCapabilityBasedActivity
{
  return 1;
}

- (id)activityType
{
  return CFSTR("com.apple.UIKit.activity.AssignToContact");
}

- (id)_systemImageName
{
  return CFSTR("person.crop.circle");
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  _ShareSheetBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Assign to Contact[Activity]"), CFSTR("Assign to Contact"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v3;
  _BOOL4 v4;

  v3 = a3;
  if ((_UIActivityItemTypes() & 0x42) == 0 || (_UIActivityItemTypes() & 0x40) != 0)
    LOBYTE(v4) = 0;
  else
    v4 = !_UIActivityHasAtMoreThan(v3, 2, 1);

  return v4;
}

- (void)prepareWithActivityItems:(id)a3
{
  Class (__cdecl *v4)();
  id v5;
  CNContactPickerViewController *v6;
  CNContactPickerViewController *peoplePicker;
  void *v8;
  UIImage *v9;
  UIImage *image;
  id v11;

  v4 = (Class (__cdecl *)())getCNContactPickerViewControllerClass;
  v5 = a3;
  v6 = (CNContactPickerViewController *)objc_alloc_init(v4());
  peoplePicker = self->_peoplePicker;
  self->_peoplePicker = v6;

  -[CNContactPickerViewController setPreferredContentSize:](self->_peoplePicker, "setPreferredContentSize:", 320.0, 426.0);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerViewController setAllowsCancel:](self->_peoplePicker, "setAllowsCancel:", objc_msgSend(v8, "userInterfaceIdiom") == 0);

  -[CNContactPickerViewController setDelegate:](self->_peoplePicker, "setDelegate:", self);
  -[CNContactPickerViewController setAutocloses:](self->_peoplePicker, "setAutocloses:", 0);
  _UIActivityItemsGetImages(v5, 0, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "firstObject");
  v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
  image = self->_image;
  self->_image = v9;

}

- (id)_embeddedActivityViewController
{
  void *v3;
  uint64_t v4;
  CNContactPickerViewController *v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4)
    v5 = self->_peoplePicker;
  else
    v5 = 0;
  return v5;
}

- (void)_willPresentAsFormSheet
{
  -[CNContactPickerViewController setAllowsCancel:](self->_peoplePicker, "setAllowsCancel:", 1);
}

- (id)activityViewController
{
  void *v3;
  uint64_t v4;
  CNContactPickerViewController *v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
    v5 = 0;
  else
    v5 = self->_peoplePicker;
  return v5;
}

- (void)_cleanup
{
  void *v3;
  void *v4;

  -[UIAssignToContactActivity peoplePicker](self, "peoplePicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[UIAssignToContactActivity setPeoplePicker:](self, "setPeoplePicker:", 0);
  -[UIAssignToContactActivity imagePickerController](self, "imagePickerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  -[UIAssignToContactActivity setImagePickerController:](self, "setImagePickerController:", 0);
  -[UIAssignToContactActivity setImage:](self, "setImage:", 0);
  -[UIAssignToContactActivity setPerson:](self, "setPerson:", 0);
}

- (void)contactPickerDidCancel:(id)a3
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 0);
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  UIImagePickerController *v9;
  UIImagePickerController *imagePickerController;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)&self->_person, a4);
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0DC3880]);
  UIImageJPEGRepresentation(self->_image, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (UIImagePickerController *)objc_msgSend(v7, "_initWithSourceImageData:cropRect:", v8, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  imagePickerController = self->_imagePickerController;
  self->_imagePickerController = v9;

  -[UIImagePickerController setDelegate:](self->_imagePickerController, "setDelegate:", self);
  -[UIImagePickerController setModalPresentationStyle:](self->_imagePickerController, "setModalPresentationStyle:", 3);
  -[UIImagePickerController _setImagePickerSavingOptions:](self->_imagePickerController, "_setImagePickerSavingOptions:", 5);
  v11 = (void *)MEMORY[0x1E0C99E08];
  -[UIImagePickerController _properties](self->_imagePickerController, "_properties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithDictionary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *MEMORY[0x1E0DC5860];
  v17[0] = *MEMORY[0x1E0DC4C68];
  v17[1] = v14;
  v18[0] = MEMORY[0x1E0C9AAB0];
  v18[1] = MEMORY[0x1E0C9AAB0];
  v15 = *MEMORY[0x1E0DC5910];
  v17[2] = *MEMORY[0x1E0DC58C8];
  v17[3] = v15;
  v18[2] = MEMORY[0x1E0C9AAB0];
  v18[3] = MEMORY[0x1E0C9AAB0];
  v17[4] = *MEMORY[0x1E0DC5858];
  v18[4] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addEntriesFromDictionary:", v16);

  -[UIImagePickerController _setProperties:](self->_imagePickerController, "_setProperties:", v13);
  -[CNContactPickerViewController setModalPresentationStyle:](self->_peoplePicker, "setModalPresentationStyle:", 16);
  -[CNContactPickerViewController presentViewController:withTransition:completion:](self->_peoplePicker, "presentViewController:withTransition:completion:", self->_imagePickerController, 1, 0);

}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  CNContact *v5;
  UIImage *v6;
  void *v7;
  UIImage *v8;
  void *v9;
  void *v10;
  UIImage *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a4;
  v5 = self->_person;
  objc_msgSend(v30, "objectForKey:", *MEMORY[0x1E0DC4C78]);
  v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImageJPEGRepresentation(v6, 0.8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "objectForKey:", *MEMORY[0x1E0DC58D0]);
  v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImageJPEGRepresentation(v8, 0.8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "objectForKey:", *MEMORY[0x1E0DC58E8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v30, "objectForKey:", *MEMORY[0x1E0DC4CA0]);
    v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIImageJPEGRepresentation(v11, 0.8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v30, "objectForKey:", *MEMORY[0x1E0DC4C70]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "CGRectValue");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
  }
  else
  {
    v15 = *MEMORY[0x1E0C9D648];
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v22 = (void *)-[CNContact mutableCopy](v5, "mutableCopy");
  v23 = v22;
  if (v10)
    objc_msgSend(v22, "setImageData:", v10);
  if (v7)
  {
    getCNContactThumbnailImageDataKey();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setValue:forKey:", v7, v24);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v15, v17, v19, v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    getCNContactCropRectKey();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setValue:forKey:", v25, v26);

  }
  if (v9)
  {
    getCNContactFullscreenImageDataKey();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setValue:forKey:", v9, v27);

  }
  -[objc_class viewControllerForUpdatingContact:withPropertiesFromContact:](getCNContactViewControllerClass(), "viewControllerForUpdatingContact:withPropertiesFromContact:", v23, v23);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setDelegate:", self);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v28);
  objc_msgSend(v29, "setModalPresentationStyle:", 3);
  -[UIImagePickerController presentViewController:animated:completion:](self->_imagePickerController, "presentViewController:animated:completion:", v29, 1, 0);

}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  return 1;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", a4 != 0);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (CNContactPickerViewController)peoplePicker
{
  return self->_peoplePicker;
}

- (void)setPeoplePicker:(id)a3
{
  objc_storeStrong((id *)&self->_peoplePicker, a3);
}

- (CNContact)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (UIImagePickerController)imagePickerController
{
  return self->_imagePickerController;
}

- (void)setImagePickerController:(id)a3
{
  objc_storeStrong((id *)&self->_imagePickerController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagePickerController, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_peoplePicker, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
