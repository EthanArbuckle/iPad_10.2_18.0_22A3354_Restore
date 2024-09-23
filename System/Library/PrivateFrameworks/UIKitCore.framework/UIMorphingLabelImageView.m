@implementation UIMorphingLabelImageView

- (UIMorphingLabelImageView)initWithImage:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  UIMorphingLabelImageView *v8;
  UIMorphingLabelImageView *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "size");
  v6 = v5;
  objc_msgSend(v4, "size");
  v11.receiver = self;
  v11.super_class = (Class)UIMorphingLabelImageView;
  v8 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, 0.0, 0.0, v6, v7);
  v9 = v8;
  if (v8)
    -[UIMorphingLabelImageView setImage:](v8, "setImage:", v4);

  return v9;
}

- (void)setImage:(id)a3
{
  UIMorphingLabelImage *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIMorphingLabelImage *v21;

  v5 = (UIMorphingLabelImage *)a3;
  if (self->_image != v5)
  {
    v21 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[UIView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIMorphingLabelImage image](v21, "image");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "setContents:", objc_msgSend(v7, "CGImage"));

    if (v21)
    {
      -[UIMorphingLabelImage contentsRect](v21, "contentsRect");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      -[UIMorphingLabelImage image](v21, "image");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "size");
      v18 = v17;
      v20 = v19;

      objc_msgSend(v6, "setContentsRect:", v9 / v18, v11 / v20, v13 / v18, v15 / v20);
    }

    v5 = v21;
  }

}

- (UIMorphingLabelImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
