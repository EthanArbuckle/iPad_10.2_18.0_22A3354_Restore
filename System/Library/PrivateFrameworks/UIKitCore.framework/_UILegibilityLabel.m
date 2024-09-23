@implementation _UILegibilityLabel

- (_UILegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 string:(id)a5 font:(id)a6
{
  return -[_UILegibilityLabel initWithSettings:strength:string:font:options:](self, "initWithSettings:strength:string:font:options:", a3, a5, a6, 0, a4);
}

- (_UILegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 string:(id)a5 font:(id)a6 options:(int64_t)a7
{
  double v13;
  double v14;
  _UILegibilityLabel *v15;
  _UILegibilityLabel *v16;
  objc_super v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v19 = *(_QWORD *)off_1E1678D90;
  v20[0] = a6;
  objc_msgSend(a5, "sizeWithAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1));
  v18.receiver = self;
  v18.super_class = (Class)_UILegibilityLabel;
  v15 = -[UIView initWithFrame:](&v18, sel_initWithFrame_, 0.0, 0.0, v13, v14);
  v16 = v15;
  if (v15)
  {
    -[CALayer setAllowsGroupBlending:](-[UIView layer](v15, "layer"), "setAllowsGroupBlending:", 0);
    -[CALayer setAllowsGroupOpacity:](-[UIView layer](v16, "layer"), "setAllowsGroupOpacity:", 0);
    -[_UILegibilityView setStrength:](v16, "setStrength:", a4);
    v16->_string = (NSString *)objc_msgSend(a5, "copy");
    v16->_font = (UIFont *)a6;
    -[_UILegibilityView setOptions:](v16, "setOptions:", a7);
    -[_UILegibilityView updateForChangedSettings:](v16, "updateForChangedSettings:", a3);
  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  self->_string = 0;
  self->_font = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UILegibilityLabel;
  -[_UILegibilityView dealloc](&v3, sel_dealloc);
}

- (void)setString:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", self->_string) & 1) == 0)
  {

    self->_string = (NSString *)objc_msgSend(a3, "copy");
    -[_UILegibilityView setImage:](self, "setImage:", 0);
    -[_UILegibilityView setShadowImage:](self, "setShadowImage:", 0);
    -[_UILegibilityLabel updateImage](self, "updateImage");
    -[_UILegibilityView setSettings:image:shadowImage:](self, "setSettings:image:shadowImage:", -[_UILegibilityView settings](self, "settings"), -[_UILegibilityView image](self, "image"), -[_UILegibilityView shadowImage](self, "shadowImage"));
  }
}

- (void)setFont:(id)a3
{
  if ((-[UIFont isEqual:](-[_UILegibilityLabel font](self, "font"), "isEqual:", a3) & 1) == 0)
  {

    self->_font = (UIFont *)a3;
    -[UIView sizeToFit](self, "sizeToFit");
    -[_UILegibilityView setImage:](self, "setImage:", 0);
    -[_UILegibilityView setShadowImage:](self, "setShadowImage:", 0);
    -[_UILegibilityLabel updateImage](self, "updateImage");
    -[_UILegibilityView setSettings:image:shadowImage:](self, "setSettings:image:shadowImage:", -[_UILegibilityView settings](self, "settings"), -[_UILegibilityView image](self, "image"), -[_UILegibilityView shadowImage](self, "shadowImage"));
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  _QWORD v9[2];
  CGSize result;

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *(_QWORD *)off_1E1678D90;
  v9[0] = -[_UILegibilityLabel font](self, "font", a3.width, a3.height);
  -[NSString sizeWithAttributes:](-[_UILegibilityLabel string](self, "string"), "sizeWithAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1));
  *(float *)&v4 = v4;
  v5 = ceilf(*(float *)&v4);
  *(float *)&v6 = v6;
  v7 = ceilf(*(float *)&v6);
  result.height = v7;
  result.width = v5;
  return result;
}

- (double)baselineOffset
{
  UILabel *v3;
  UILabel *v4;
  double v5;
  double v6;

  v3 = [UILabel alloc];
  -[UIView bounds](self, "bounds");
  v4 = -[UILabel initWithFrame:](v3, "initWithFrame:");
  -[UILabel setText:](v4, "setText:", -[_UILegibilityLabel string](self, "string"));
  -[UILabel setFont:](v4, "setFont:", -[_UILegibilityLabel font](self, "font"));
  -[UILabel _baselineOffsetFromBottom](v4, "_baselineOffsetFromBottom");
  v6 = v5;

  return v6;
}

- (void)updateImage
{
  UIColor *v3;
  UIFont *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _QWORD v17[10];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if (-[_UILegibilityView settings](self, "settings")
    && -[NSString length](-[_UILegibilityLabel string](self, "string"), "length")
    && -[_UILegibilityLabel font](self, "font"))
  {
    v3 = -[_UILegibilityView drawingColor](self, "drawingColor");
    if (-[_UILegibilityView usesColorFilters](self, "usesColorFilters"))
      v3 = +[UIColor whiteColor](UIColor, "whiteColor");
    v4 = -[_UILegibilityLabel font](self, "font");
    v5 = *(_QWORD *)off_1E1678D98;
    v18[0] = *(_QWORD *)off_1E1678D90;
    v18[1] = v5;
    v19[0] = v4;
    v19[1] = v3;
    v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", -[_UILegibilityLabel string](self, "string"), v6);
    -[UIView bounds](self, "bounds");
    +[UILabel _insetRect:forAttributedString:withDefaultFont:inView:](UILabel, "_insetRect:forAttributedString:withDefaultFont:inView:", v7, v4, self);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __33___UILegibilityLabel_updateImage__block_invoke;
    v17[3] = &unk_1E16CB3A8;
    v17[6] = v9;
    v17[7] = v11;
    *(double *)&v17[8] = v13;
    *(double *)&v17[9] = v15;
    v17[4] = self;
    v17[5] = v7;
    -[_UILegibilityView setImage:](self, "setImage:", _UIGraphicsDrawIntoImageContextWithMoreOptions(0, 0, v17, v13, v15, v16));

    -[_UILegibilityView setShadowImage:](self, "setShadowImage:", 0);
  }
  else
  {
    -[_UILegibilityView setImage:](self, "setImage:", 0);
    -[_UILegibilityView setShadowImage:](self, "setShadowImage:", 0);
  }
}

- (NSString)string
{
  return self->_string;
}

- (UIFont)font
{
  return self->_font;
}

- (BOOL)usesSecondaryColor
{
  return self->_usesSecondaryColor;
}

@end
