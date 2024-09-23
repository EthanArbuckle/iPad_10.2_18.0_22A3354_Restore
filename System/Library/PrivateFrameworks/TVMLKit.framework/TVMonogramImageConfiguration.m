@implementation TVMonogramImageConfiguration

- (TVMonogramImageConfiguration)initWithStyle:(int64_t)a3
{
  TVMonogramImageConfiguration *v4;
  TVMonogramImageConfiguration *v5;
  uint64_t v6;
  UIFont *font;
  void *v8;
  double v9;
  uint64_t v10;
  UIColor *bgColor;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TVMonogramImageConfiguration;
  v4 = -[TVMonogramImageConfiguration init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 106.0, *MEMORY[0x24BDF7878]);
    v6 = objc_claimAutoreleasedReturnValue();
    font = v5->_font;
    v5->_font = (UIFont *)v6;

    *(_OWORD *)&v5->_diameter = xmmword_222E76FE0;
    if (a3 == 2)
    {
      v8 = (void *)MEMORY[0x24BDF6950];
      v9 = 0.6;
      goto LABEL_6;
    }
    if (a3 == 1)
    {
      v8 = (void *)MEMORY[0x24BDF6950];
      v9 = 0.9;
LABEL_6:
      objc_msgSend(v8, "colorWithWhite:alpha:", 1.0, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      bgColor = v5->_bgColor;
      v5->_bgColor = (UIColor *)v10;

    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_text, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_firstName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_lastName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  *(_QWORD *)(v5 + 8) = self->_style;
  v12 = -[UIFont copyWithZone:](self->_font, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  *(double *)(v5 + 56) = self->_diameter;
  *(double *)(v5 + 64) = self->_focusedSizeIncrease;
  v14 = -[UIColor copyWithZone:](self->_bgColor, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  v16 = -[UIColor copyWithZone:](self->_textColor, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v16;

  return (id)v5;
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (UIColor)bgColor
{
  return self->_bgColor;
}

- (void)setBgColor:(id)a3
{
  objc_storeStrong((id *)&self->_bgColor, a3);
}

- (double)diameter
{
  return self->_diameter;
}

- (void)setDiameter:(double)a3
{
  self->_diameter = a3;
}

- (double)focusedSizeIncrease
{
  return self->_focusedSizeIncrease;
}

- (void)setFocusedSizeIncrease:(double)a3
{
  self->_focusedSizeIncrease = a3;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_bgColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end
