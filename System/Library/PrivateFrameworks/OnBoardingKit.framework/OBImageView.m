@implementation OBImageView

- (OBImageView)initWithImage:(id)a3
{
  id v4;
  OBImageView *v5;
  OBImageView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OBImageView;
  v5 = -[OBImageView initWithImage:](&v8, sel_initWithImage_, v4);
  v6 = v5;
  if (v5)
    -[OBImageView setImage:](v5, "setImage:", v4);

  return v6;
}

- (OBImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v6;
  id v7;
  OBImageView *v8;
  OBImageView *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[OBImageView initWithImage:](self, "initWithImage:", v6);
  v9 = v8;
  if (v8)
  {
    -[OBImageView setImage:](v8, "setImage:", v6);
    -[OBImageView setHighlightedImage:](v9, "setHighlightedImage:", v7);
  }

  return v9;
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[OBImageView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBImageView _image:forUserInterfaceStyle:](self, "_image:forUserInterfaceStyle:", v4, objc_msgSend(v5, "userInterfaceStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7.receiver = self;
  v7.super_class = (Class)OBImageView;
  -[OBImageView setImage:](&v7, sel_setImage_, v6);

}

- (void)setHighlightedImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[OBImageView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBImageView _image:forUserInterfaceStyle:](self, "_image:forUserInterfaceStyle:", v4, objc_msgSend(v5, "userInterfaceStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7.receiver = self;
  v7.super_class = (Class)OBImageView;
  -[OBImageView setHighlightedImage:](&v7, sel_setHighlightedImage_, v6);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)OBImageView;
  v4 = a3;
  -[OBImageView traitCollectionDidChange:](&v18, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v18.receiver, v18.super_class);

  -[OBImageView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
  {
    -[OBImageView image](self, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[OBImageView image](self, "image");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBImageView traitCollection](self, "traitCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "imageForUserInterfaceStyle:", objc_msgSend(v11, "userInterfaceStyle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[OBImageView setImage:](self, "setImage:", v12);
    }
    -[OBImageView highlightedImage](self, "highlightedImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v14 = objc_opt_isKindOfClass();

    if ((v14 & 1) != 0)
    {
      -[OBImageView highlightedImage](self, "highlightedImage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBImageView traitCollection](self, "traitCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "imageForUserInterfaceStyle:", objc_msgSend(v16, "userInterfaceStyle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[OBImageView setHighlightedImage:](self, "setHighlightedImage:", v17);
    }
  }
}

- (id)_image:(id)a3 forUserInterfaceStyle:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[OBImageView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageForUserInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v5;
  }

  return v7;
}

@end
