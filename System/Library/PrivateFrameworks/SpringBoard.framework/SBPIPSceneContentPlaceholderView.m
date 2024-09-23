@implementation SBPIPSceneContentPlaceholderView

- (SBPIPSceneContentPlaceholderView)initWithImage:(id)a3
{
  id v4;
  SBPIPSceneContentPlaceholderView *v5;
  UIImageView *v6;
  UIImageView *imageView;
  UIImageView *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBPIPSceneContentPlaceholderView;
  v5 = -[SBPIPSceneContentPlaceholderView init](&v10, sel_init);
  if (v5)
  {
    v6 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v4);
    -[UIImageView setContentMode:](v6, "setContentMode:", 2);
    imageView = v5->_imageView;
    v5->_imageView = v6;
    v8 = v6;

    -[SBPIPSceneContentPlaceholderView addSubview:](v5, "addSubview:", v5->_imageView);
  }

  return v5;
}

- (void)layoutSubviews
{
  UIImageView *imageView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBPIPSceneContentPlaceholderView;
  -[SBPIPSceneContentPlaceholderView layoutSubviews](&v4, sel_layoutSubviews);
  imageView = self->_imageView;
  -[SBPIPSceneContentPlaceholderView bounds](self, "bounds");
  -[UIImageView setFrame:](imageView, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
