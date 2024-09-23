@implementation SBUISystemApertureImageContentProvider

- (SBUISystemApertureImageContentProvider)initWithSystemImageName:(id)a3
{
  void *v4;
  SBUISystemApertureImageContentProvider *v5;

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBUISystemApertureImageContentProvider initWithImage:](self, "initWithImage:", v4);

  return v5;
}

- (SBUISystemApertureImageContentProvider)initWithImage:(id)a3
{
  objc_class *v4;
  id v5;
  UIImageView *v6;
  UIImageView *imageView;
  UIImageView *v8;
  SBUISystemApertureImageContentProvider *v9;
  objc_super v11;

  v4 = (objc_class *)MEMORY[0x1E0CEA658];
  v5 = a3;
  v6 = (UIImageView *)objc_msgSend([v4 alloc], "initWithImage:", v5);

  -[UIImageView setContentMode:](v6, "setContentMode:", 1);
  imageView = self->_imageView;
  self->_imageView = v6;
  v8 = v6;

  v11.receiver = self;
  v11.super_class = (Class)SBUISystemApertureImageContentProvider;
  v9 = -[SBUISystemApertureAspectFittingContentProvider initWithView:](&v11, sel_initWithView_, v8);

  return v9;
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
