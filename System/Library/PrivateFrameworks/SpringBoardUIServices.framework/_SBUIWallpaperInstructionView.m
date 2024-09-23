@implementation _SBUIWallpaperInstructionView

- (_SBUIWallpaperInstructionView)initWithImage:(id)a3 text:(id)a4 font:(id)a5
{
  id v8;
  id v9;
  id v10;
  _SBUIWallpaperInstructionView *v11;
  uint64_t v12;
  UIImageView *imageView;
  UILabel *v14;
  UILabel *textLabel;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_SBUIWallpaperInstructionView;
  v11 = -[_SBUIWallpaperInstructionView init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v8);
    imageView = v11->_imageView;
    v11->_imageView = (UIImageView *)v12;

    -[_SBUIWallpaperInstructionView addSubview:](v11, "addSubview:", v11->_imageView);
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    textLabel = v11->_textLabel;
    v11->_textLabel = v14;

    -[UILabel setText:](v11->_textLabel, "setText:", v9);
    -[UILabel setFont:](v11->_textLabel, "setFont:", v10);
    -[UILabel setNumberOfLines:](v11->_textLabel, "setNumberOfLines:", 0);
    -[_SBUIWallpaperInstructionView addSubview:](v11, "addSubview:", v11->_textLabel);
  }

  return v11;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:");
  v7 = v6;
  v9 = v8 + 5.0;
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", width - (v8 + 5.0), height);
  v12 = v9 + v11;
  if (v7 >= v10)
    v10 = v7;
  result.height = v10;
  result.width = v12;
  return result;
}

- (void)setTintColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SBUIWallpaperInstructionView;
  v4 = a3;
  -[_SBUIWallpaperInstructionView setTintColor:](&v5, sel_setTintColor_, v4);
  -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v4, v5.receiver, v5.super_class);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
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
  CGFloat v20;
  CGRect v21;

  -[_SBUIWallpaperInstructionView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v3, v5);
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", v4 - (v7 + 5.0), v6);
  BSRectWithSize();
  UIRectCenteredYInRectScale();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  BSRectWithSize();
  UIRectCenteredYInRectScale();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21.origin.x = 0.0;
  v21.origin.y = v9;
  v21.size.width = v11;
  v21.size.height = v13;
  v20 = CGRectGetMaxX(v21) + 5.0;
  -[UIImageView setFrame:](self->_imageView, "setFrame:", 0.0, v9, v11, v13, 0);
  -[UILabel setFrame:](self->_textLabel, "setFrame:", v20, v15, v17, v19);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
