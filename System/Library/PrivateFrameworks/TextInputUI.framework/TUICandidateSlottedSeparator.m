@implementation TUICandidateSlottedSeparator

- (void)setStyle:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  -[TUICandidateLine style](self, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)TUICandidateSlottedSeparator;
    -[TUICandidateLine setStyle:](&v14, sel_setStyle_, v4);
    -[TUICandidateSlottedSeparator setBackgroundColor:](self, "setBackgroundColor:", 0);
    -[TUICandidateSlottedSeparator imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0DC3890]);
      -[TUICandidateSlottedSeparator bounds](self, "bounds");
      v9 = (void *)objc_msgSend(v8, "initWithFrame:");
      -[TUICandidateSlottedSeparator setImageView:](self, "setImageView:", v9);

      -[TUICandidateSlottedSeparator imageView](self, "imageView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAutoresizingMask:", 18);

      -[TUICandidateSlottedSeparator imageView](self, "imageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUICandidateSlottedSeparator addSubview:](self, "addSubview:", v11);

    }
    objc_msgSend(v4, "slottedCellSeparatorImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateSlottedSeparator imageView](self, "imageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setImage:", v12);

  }
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

+ (id)reuseIdentifier
{
  return CFSTR("TUICandidateSlottedSeparator");
}

@end
