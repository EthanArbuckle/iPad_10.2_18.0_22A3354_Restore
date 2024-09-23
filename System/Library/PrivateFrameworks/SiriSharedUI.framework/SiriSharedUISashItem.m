@implementation SiriSharedUISashItem

- (SiriSharedUISashItem)initWithTitle:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  SiriSharedUISashItem *v8;
  uint64_t v9;
  NSString *title;

  v6 = a3;
  v7 = a4;
  v8 = -[SiriSharedUISashItem init](self, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v9;

    -[SiriSharedUISashItem setImage:](v8, "setImage:", v7);
  }

  return v8;
}

- (SiriSharedUISashItem)initWithApplicationBundleIdentifier:(id)a3
{
  id v4;
  SiriSharedUISashItem *v5;
  NSString *v6;
  NSString *applicationBundleIdentifier;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *title;
  SiriSharedUISashItem *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SiriSharedUISashItem init](self, "init");
  if (v5)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.SiriViewService")) & 1) != 0
      || !objc_msgSend(v4, "length"))
    {
      applicationBundleIdentifier = v5->_applicationBundleIdentifier;
      v5->_applicationBundleIdentifier = (NSString *)CFSTR("com.apple.siri");
    }
    else
    {
      v6 = (NSString *)v4;
      applicationBundleIdentifier = v5->_applicationBundleIdentifier;
      v5->_applicationBundleIdentifier = v6;
    }

    v5->_siriImage = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.siri"));
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v5->_applicationBundleIdentifier);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isValid");

    if ((v10 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForSystemPlaceholder:", v5->_applicationBundleIdentifier);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "appState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isValid");

      if (!v13)
      {

        v20 = 0;
        goto LABEL_14;
      }
      v8 = v11;
    }
    -[SiriSharedUISashItem _configureIconForAppProxy:](v5, "_configureIconForAppProxy:", v8);
    objc_msgSend((id)objc_opt_class(), "languageCode");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
    {
      v22[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedNameForContext:preferredLocalizations:", 0, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v8, "localizedName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = objc_msgSend(v17, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v18;

    v5->_canPunchout = !-[NSString isEqualToString:](v5->_applicationBundleIdentifier, "isEqualToString:", CFSTR("com.apple.siri"));
  }
  v20 = v5;
LABEL_14:

  return v20;
}

- (SiriSharedUISashItem)init
{
  SiriSharedUISashItem *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SiriSharedUISashItem;
  result = -[SiriSharedUISashItem init](&v3, sel_init);
  if (result)
    result->_canPunchout = 1;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *title;
  void *v6;
  UIImage *image;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    title = self->_title;
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](title, "isEqualToString:", v6))
    {
      image = self->_image;
      objc_msgSend(v4, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[UIImage isEqual:](image, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setImage:(id)a3
{
  void *v4;
  id v5;
  UIImage *v6;
  UIImage *image;
  id v8;

  v4 = (void *)MEMORY[0x1E0DC3BF8];
  v5 = a3;
  objc_msgSend(v4, "mainScreen");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  objc_msgSend(v5, "_applicationIconImageForFormat:precomposed:scale:", 5, 0);
  v6 = (UIImage *)objc_claimAutoreleasedReturnValue();

  image = self->_image;
  self->_image = v6;

}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

}

- (BOOL)canPunchout
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL result;

  -[SiriSharedUISashItem commands](self, "commands");
  v3 = objc_claimAutoreleasedReturnValue();
  result = (!v3
         || (v4 = (void *)v3,
             -[SiriSharedUISashItem commands](self, "commands"),
             v5 = (void *)objc_claimAutoreleasedReturnValue(),
             v6 = objc_msgSend(v5, "count"),
             v5,
             v4,
             v6))
        && self->_canPunchout;
  return result;
}

- (void)_configureIconForAppProxy:(id)a3
{
  UIImage *v4;
  UIImage *image;

  objc_msgSend(MEMORY[0x1E0DC3870], "_iconForResourceProxy:format:", a3, 5);
  v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  image = self->_image;
  self->_image = v4;

}

+ (id)languageCode
{
  return (id)_languageCode;
}

+ (void)setLanguageCode:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "copy");
  v4 = (void *)_languageCode;
  _languageCode = v3;

}

- (SiriSharedUISashItemDelegate)delegate
{
  return (SiriSharedUISashItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)isSiriImage
{
  return self->_siriImage;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSArray)commands
{
  return self->_commands;
}

- (void)setCommands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)requestsExtraPadding
{
  return self->_requestsExtraPadding;
}

- (void)setRequestsExtraPadding:(BOOL)a3
{
  self->_requestsExtraPadding = a3;
}

- (BOOL)isPlaceHolderImage
{
  return self->_placeHolderImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
