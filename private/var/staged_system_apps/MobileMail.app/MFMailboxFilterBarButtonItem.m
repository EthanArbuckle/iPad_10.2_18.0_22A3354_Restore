@implementation MFMailboxFilterBarButtonItem

- (MFMailboxFilterBarButtonItem)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  UIImage *v7;
  UIImage *notSelectedImage;
  UIImage *v9;
  MFMailboxFilterBarButtonItem *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  UIImage *selectedImage;
  objc_super v16;

  v6 = a3;
  v7 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphFilterDisabled));
  notSelectedImage = self->_notSelectedImage;
  self->_notSelectedImage = v7;

  v9 = self->_notSelectedImage;
  v16.receiver = self;
  v16.super_class = (Class)MFMailboxFilterBarButtonItem;
  v10 = -[MFMailboxFilterBarButtonItem initWithImage:style:target:action:](&v16, "initWithImage:style:target:action:", v9, 0, v6, a4);
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TOGGLE_FILTERING"), &stru_100531B00, CFSTR("Main")));
    -[MFMailboxFilterBarButtonItem setTitle:](v10, "setTitle:", v12);

    v13 = objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphFilterEnabled));
    selectedImage = v10->_selectedImage;
    v10->_selectedImage = (UIImage *)v13;

  }
  return v10;
}

- (void)setFilterEnabled:(BOOL)a3
{
  uint64_t v4;
  id v5;

  self->_filterEnabled = a3;
  if (a3)
    v4 = objc_claimAutoreleasedReturnValue(-[MFMailboxFilterBarButtonItem selectedImage](self, "selectedImage"));
  else
    v4 = objc_claimAutoreleasedReturnValue(-[MFMailboxFilterBarButtonItem notSelectedImage](self, "notSelectedImage"));
  v5 = (id)v4;
  -[MFMailboxFilterBarButtonItem setImage:](self, "setImage:", v4);

}

- (UIImage)notSelectedImage
{
  return self->_notSelectedImage;
}

- (BOOL)isFilterEnabled
{
  return self->_filterEnabled;
}

- (void)setNotSelectedImage:(id)a3
{
  objc_storeStrong((id *)&self->_notSelectedImage, a3);
}

- (UIImage)selectedImage
{
  return self->_selectedImage;
}

- (void)setSelectedImage:(id)a3
{
  objc_storeStrong((id *)&self->_selectedImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedImage, 0);
  objc_storeStrong((id *)&self->_notSelectedImage, 0);
}

@end
