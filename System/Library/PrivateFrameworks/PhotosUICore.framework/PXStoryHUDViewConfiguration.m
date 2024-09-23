@implementation PXStoryHUDViewConfiguration

- (PXStoryHUDViewConfiguration)init
{
  PXStoryHUDViewConfiguration *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXStoryHUDViewConfiguration;
  result = -[PXStoryHUDViewConfiguration init](&v8, sel_init);
  if (result)
  {
    __asm { FMOV            V0.2D, #5.0 }
    result->_textInsets = _Q0;
    result->_fontSize = 11.0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 1, self->_text);
  *((_OWORD *)v4 + 3) = self->_textRelativePosition;
  *((_OWORD *)v4 + 4) = self->_textInsets;
  v4[3] = *(id *)&self->_fontSize;
  objc_storeStrong(v4 + 4, self->_tintColor);
  v4[5] = *(id *)&self->_borderWidth;
  objc_storeStrong(v4 + 2, self->_title);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PXStoryHUDViewConfiguration *v4;
  PXStoryHUDViewConfiguration *v5;
  id v6;
  id v7;
  int v8;
  int v9;
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  id v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;

  v4 = (PXStoryHUDViewConfiguration *)a3;
  if (v4 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXStoryHUDViewConfiguration text](self, "text");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryHUDViewConfiguration text](v5, "text");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

      }
      else
      {
        v8 = objc_msgSend(v6, "isEqualToString:", v7);

        if (!v8)
        {
LABEL_5:
          LOBYTE(v9) = 0;
LABEL_25:

          goto LABEL_26;
        }
      }
      -[PXStoryHUDViewConfiguration textRelativePosition](self, "textRelativePosition");
      v11 = v10;
      v13 = v12;
      -[PXStoryHUDViewConfiguration textRelativePosition](v5, "textRelativePosition");
      LOBYTE(v9) = 0;
      if (v11 != v15)
        goto LABEL_25;
      if (v13 != v14)
        goto LABEL_25;
      -[PXStoryHUDViewConfiguration textInsets](self, "textInsets");
      v17 = v16;
      v19 = v18;
      -[PXStoryHUDViewConfiguration textInsets](v5, "textInsets");
      LOBYTE(v9) = 0;
      if (v17 != v21 || v19 != v20)
        goto LABEL_25;
      -[PXStoryHUDViewConfiguration fontSize](self, "fontSize");
      v23 = v22;
      -[PXStoryHUDViewConfiguration fontSize](v5, "fontSize");
      if (v23 != v24)
        goto LABEL_5;
      -[PXStoryHUDViewConfiguration tintColor](self, "tintColor");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryHUDViewConfiguration tintColor](v5, "tintColor");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      if (v25 == v26)
      {

      }
      else
      {
        v9 = objc_msgSend(v25, "isEqual:", v26);

        if (!v9)
        {
LABEL_24:

          goto LABEL_25;
        }
      }
      -[PXStoryHUDViewConfiguration borderWidth](self, "borderWidth");
      v28 = v27;
      -[PXStoryHUDViewConfiguration borderWidth](v5, "borderWidth");
      if (v28 == v29)
      {
        -[PXStoryHUDViewConfiguration title](self, "title");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXStoryHUDViewConfiguration title](v5, "title");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30 == v31)
          LOBYTE(v9) = 1;
        else
          LOBYTE(v9) = objc_msgSend(v30, "isEqualToString:", v31);

      }
      else
      {
        LOBYTE(v9) = 0;
      }
      goto LABEL_24;
    }
    LOBYTE(v9) = 0;
  }
LABEL_26:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PXStoryHUDViewConfiguration text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PXStoryHUDViewConfiguration title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CGPoint)textRelativePosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_textRelativePosition.x;
  y = self->_textRelativePosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTextRelativePosition:(CGPoint)a3
{
  self->_textRelativePosition = a3;
}

- (CGPoint)textInsets
{
  double x;
  double y;
  CGPoint result;

  x = self->_textInsets.x;
  y = self->_textInsets.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTextInsets:(CGPoint)a3
{
  self->_textInsets = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
