@implementation VUIScoreboardRowLayout

+ (id)_backgroundColorForIdiom:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", a3, 0.745098039, 0.745098039, 0.745098039, 0.45);
}

+ (int)_backgroundColorBlendMode
{
  return 26;
}

+ (id)_topRowLayoutForIdiom:(int64_t)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_opt_new();
  objc_msgSend(a1, "_backgroundColorForIdiom:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSeparatorColor:", v6);

  objc_msgSend(v5, "setSeparatorBlendMode:", objc_msgSend(a1, "_backgroundColorBlendMode"));
  return v5;
}

+ (id)_bottomLayoutForIdiom:(int64_t)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_opt_new();
  objc_msgSend(a1, "_backgroundColorForIdiom:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(v5, "setBackgroundBlendMode:", objc_msgSend(a1, "_backgroundColorBlendMode"));
  return v5;
}

- (int)backgroundBlendMode
{
  return self->_backgroundBlendMode;
}

- (void)setBackgroundBlendMode:(int)a3
{
  self->_backgroundBlendMode = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (int)separatorBlendMode
{
  return self->_separatorBlendMode;
}

- (void)setSeparatorBlendMode:(int)a3
{
  self->_separatorBlendMode = a3;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (void)setSeparatorColor:(id)a3
{
  objc_storeStrong((id *)&self->_separatorColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
