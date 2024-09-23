@implementation SKUIProfileImagePicker

- (SKUIProfileImagePicker)initWithClientContext:(id)a3
{
  id v5;
  SKUIProfileImagePicker *v6;
  SKUIProfileImagePicker *v7;
  objc_super v9;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProfileImagePicker initWithClientContext:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIProfileImagePicker;
  v6 = -[SKUIProfileImagePicker init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[SKUIProfileImagePicker setModalPresentationStyle:](v6, "setModalPresentationStyle:", 4);
    objc_storeStrong((id *)&v7->_clientContext, a3);
    v7->_firstApperance = 0;
  }

  return v7;
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  -[SKUIProfileImagePicker dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[SKUIProfileImagePicker _didCancel](self, "_didCancel");
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  id WeakRetained;
  char v10;
  id v11;
  id v12;

  v5 = a4;
  -[SKUIProfileImagePicker dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4CA0]);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4C70]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v12 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    objc_msgSend((id)objc_opt_class(), "_fixCropRect:forOriginalImage:", v6, v12);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "profileImagePicker:didPickProfileImage:withCropRect:", self, v12, v6);

  }
}

- (void)loadView
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[SKUIProfileImagePicker setView:](self, "setView:", v4);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIProfileImagePicker;
  -[SKUIProfileImagePicker viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (!self->_firstApperance)
  {
    self->_firstApperance = 1;
    -[SKUIProfileImagePicker _showImagePicker](self, "_showImagePicker");
  }
}

+ (id)_fixCropRect:(id)a3 forOriginalImage:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  uint64_t v26;
  CGRect v28;
  CGRect v29;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "CGRectValue");
  v10 = v9;
  v12 = v11;
  v13 = -0.0;
  if (v7 < 0.0)
    v13 = v7;
  v14 = v8 + v13;
  if (v7 >= 0.0)
    v15 = v7;
  else
    v15 = 0.0;
  objc_msgSend(v6, "size");
  if (v15 + v14 > v16)
  {
    objc_msgSend(v6, "size");
    v14 = v17 - v15;
  }
  v18 = -0.0;
  if (v10 < 0.0)
    v18 = v10;
  v19 = v12 + v18;
  if (v10 < 0.0)
    v10 = 0.0;
  objc_msgSend(v6, "size");
  if (v10 + v19 > v20)
  {
    objc_msgSend(v6, "size");
    v19 = v21 - v10;
  }
  objc_msgSend(v5, "CGRectValue");
  v29.origin.x = v22;
  v29.origin.y = v23;
  v29.size.width = v24;
  v29.size.height = v25;
  v28.origin.x = v15;
  v28.origin.y = v10;
  v28.size.width = v14;
  v28.size.height = v19;
  if (!CGRectEqualToRect(v28, v29))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v15, v10, v14, v19);
    v26 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v26;
  }

  return v5;
}

- (void)_didCancel
{
  SKUIProfileImagePickerDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "profileImagePickerDidCancel:", self);

  }
}

- (void)_presentImagePickerWithSourceType:(int64_t)a3
{
  UIImagePickerController *v5;
  UIImagePickerController *imagePicker;
  void *v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  v5 = (UIImagePickerController *)objc_alloc_init(MEMORY[0x1E0DC3880]);
  imagePicker = self->_imagePicker;
  self->_imagePicker = v5;

  -[UIImagePickerController setSourceType:](self->_imagePicker, "setSourceType:", a3);
  v7 = (void *)SKUIMobileCoreServicesFramework();
  v8 = (id *)SKUIWeakLinkedSymbolForString("kUTTypeImage", v7);
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = *v8;
  objc_msgSend(v9, "arrayWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImagePickerController setMediaTypes:](self->_imagePicker, "setMediaTypes:", v11);
  -[UIImagePickerController setDelegate:](self->_imagePicker, "setDelegate:", self);
  -[UIImagePickerController _setImagePickerSavingOptions:](self->_imagePicker, "_setImagePickerSavingOptions:", 3);
  v12 = (void *)MEMORY[0x1E0C99E08];
  -[UIImagePickerController _properties](self->_imagePicker, "_properties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *MEMORY[0x1E0DC5910];
  v18[0] = *MEMORY[0x1E0DC4C68];
  v18[1] = v15;
  v19[0] = MEMORY[0x1E0C9AAB0];
  v19[1] = MEMORY[0x1E0C9AAB0];
  v16 = *MEMORY[0x1E0DC58C8];
  v18[2] = *MEMORY[0x1E0DC5860];
  v18[3] = v16;
  v19[2] = MEMORY[0x1E0C9AAB0];
  v19[3] = MEMORY[0x1E0C9AAB0];
  v18[4] = *MEMORY[0x1E0DC5858];
  v19[4] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addEntriesFromDictionary:", v17);

  -[UIImagePickerController _setProperties:](self->_imagePicker, "_setProperties:", v14);
  -[SKUIProfileImagePicker presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_imagePicker, 1, 0);

}

- (void)_showImagePicker
{
  int v3;
  int v4;
  void *v5;
  id v6;

  v3 = objc_msgSend(MEMORY[0x1E0DC3880], "isSourceTypeAvailable:", 1);
  v4 = objc_msgSend(MEMORY[0x1E0DC3880], "isSourceTypeAvailable:", 0);
  if ((v3 & 1) != 0 || (v4 & 1) != 0)
  {
    if ((v3 & v4) == 1)
      -[SKUIProfileImagePicker _showImageSourcePicker](self, "_showImageSourcePicker");
    else
      -[SKUIProfileImagePicker _presentImagePickerWithSourceType:](self, "_presentImagePickerWithSourceType:", v3 != 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 1, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("PROFILE_NO_PHOTO_SOURCE"), 0, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v6);
    -[SKUIProfileImagePicker presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

  }
}

- (void)_showImageSourcePicker
{
  SKUIClientContext *clientContext;
  void *v4;
  uint64_t v5;
  void *v6;
  SKUIClientContext *v7;
  void *v8;
  void *v9;
  SKUIClientContext *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];

  clientContext = self->_clientContext;
  if (clientContext)
    -[SKUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("SETTINGS_PROFILE_CANCEL"), CFSTR("Settings"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("SETTINGS_PROFILE_CANCEL"), 0, CFSTR("Settings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __48__SKUIProfileImagePicker__showImageSourcePicker__block_invoke;
  v18[3] = &unk_1E73A3B38;
  v18[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v4, 1, v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_clientContext;
  if (v7)
    -[SKUIClientContext localizedStringForKey:inTable:](v7, "localizedStringForKey:inTable:", CFSTR("SETTINGS_PROFILE_TAKE_PHOTO"), CFSTR("Settings"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("SETTINGS_PROFILE_TAKE_PHOTO"), 0, CFSTR("Settings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __48__SKUIProfileImagePicker__showImageSourcePicker__block_invoke_2;
  v17[3] = &unk_1E73A3B38;
  v17[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v8, 0, v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_clientContext;
  if (v10)
    -[SKUIClientContext localizedStringForKey:inTable:](v10, "localizedStringForKey:inTable:", CFSTR("SETTINGS_PROFILE_CHOOSE_PHOTO"), CFSTR("Settings"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("SETTINGS_PROFILE_CHOOSE_PHOTO"), 0, CFSTR("Settings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __48__SKUIProfileImagePicker__showImageSourcePicker__block_invoke_3;
  v16[3] = &unk_1E73A3B38;
  v16[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v11, 0, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, (v14 & 0xFFFFFFFFFFFFFFFBLL) == 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v6);
  objc_msgSend(v15, "addAction:", v9);
  objc_msgSend(v15, "addAction:", v12);
  -[SKUIProfileImagePicker presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);

}

uint64_t __48__SKUIProfileImagePicker__showImageSourcePicker__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didCancel");
}

uint64_t __48__SKUIProfileImagePicker__showImageSourcePicker__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentImagePickerWithSourceType:", 1);
}

uint64_t __48__SKUIProfileImagePicker__showImageSourcePicker__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentImagePickerWithSourceType:", 0);
}

- (SKUIProfileImagePickerDelegate)delegate
{
  return (SKUIProfileImagePickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_imagePicker, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithClientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIProfileImagePicker initWithClientContext:]";
}

@end
