@implementation SFAirDropIconView

- (SFAirDropIconView)initWithFrame:(CGRect)a3
{
  SFAirDropIconView *v3;
  id v4;
  uint64_t v5;
  UIImageView *imageView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SFAirDropIconView;
  v3 = -[SFAirDropIconView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD668]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v5;

    -[UIImageView setUserInteractionEnabled:](v3->_imageView, "setUserInteractionEnabled:", 0);
    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFAirDropIconView addSubview:](v3, "addSubview:", v3->_imageView);
    v7 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("_imageView"), v3->_imageView, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_imageView]|"), 0, 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropIconView addConstraints:](v3, "addConstraints:", v9);

    v10 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("_imageView"), v3->_imageView, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_imageView]|"), 0, 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropIconView addConstraints:](v3, "addConstraints:", v12);

  }
  return v3;
}

- (void)loadImageIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[UIImageView image](self->_imageView, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleURL");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", "AirDrop-inactive.png", 0, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithContentsOfFile:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE8F640], "_activityImageForActionRepresentationImage:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_imageView, "setImage:", v9);

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  -[SFAirDropIconView bounds](self, "bounds");
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  v3.receiver = self;
  v3.super_class = (Class)SFAirDropIconView;
  -[SFAirDropIconView layoutSubviews](&v3, sel_layoutSubviews);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SFAirDropIconView;
  -[SFAirDropIconView setHighlighted:](&v6, sel_setHighlighted_);
  if (v3)
    v5 = 2;
  else
    v5 = 0;
  -[UIImageView setDrawMode:](self->_imageView, "setDrawMode:", v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
