@implementation PXLabelSpec

- (void)setTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setTextAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setNumberOfLines:(unint64_t)a3
{
  self->_numberOfLines = a3;
}

- (void)setVerticalAlignment:(int64_t)a3
{
  self->_verticalAlignment = a3;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (void)setCapitalization:(int64_t)a3
{
  self->_capitalization = a3;
}

- (void)setAllowTruncation:(BOOL)a3
{
  self->_allowTruncation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackTextAttributes, 0);
  objc_storeStrong((id *)&self->_textAttributes, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  __int128 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXLabelSpec;
  v4 = -[PXViewSpec copyWithZone:](&v7, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 14, self->_font);
  objc_storeStrong(v4 + 13, self->_textColor);
  objc_storeStrong(v4 + 15, self->_textAttributes);
  objc_storeStrong(v4 + 16, self->_fallbackTextAttributes);
  v4[17] = (id)self->_textAlignment;
  v4[18] = (id)self->_numberOfLines;
  v4[19] = (id)self->_verticalAlignment;
  v4[20] = (id)self->_capitalization;
  v4[21] = (id)self->_fallbackCapitalization;
  v5 = *(_OWORD *)&self->_contentInsets.bottom;
  *((_OWORD *)v4 + 12) = *(_OWORD *)&self->_contentInsets.top;
  *((_OWORD *)v4 + 13) = v5;
  *((_BYTE *)v4 + 96) = self->_adjustsFontSizeToFitWidth;
  v4[22] = *(id *)&self->_minimumScaleFactor;
  *((_BYTE *)v4 + 97) = self->_allowTruncation;
  v4[23] = *(id *)&self->_minimumTruncatedScaleFactor;
  return v4;
}

- (PXLabelSpec)init
{
  PXLabelSpec *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXLabelSpec;
  result = -[PXViewSpec init](&v3, sel_init);
  if (result)
  {
    result->_textAlignment = 4;
    result->_verticalAlignment = 0;
  }
  return result;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PXLabelSpec;
  v3 = -[PXViewSpec hash](&v17, sel_hash);
  -[PXLabelSpec font](self, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[PXLabelSpec textColor](self, "textColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  -[PXLabelSpec textAttributes](self, "textAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash") ^ v3;

  v10 = v9 ^ (2 * -[PXLabelSpec textAlignment](self, "textAlignment"));
  v11 = v10 ^ (4 * -[PXLabelSpec capitalization](self, "capitalization"));
  v12 = v11 ^ (8 * -[PXLabelSpec numberOfLines](self, "numberOfLines"));
  if (-[PXLabelSpec adjustsFontSizeToFitWidth](self, "adjustsFontSizeToFitWidth"))
    v13 = 16;
  else
    v13 = 0;
  v14 = -[PXLabelSpec allowTruncation](self, "allowTruncation");
  v15 = 32;
  if (!v14)
    v15 = 0;
  return v12 ^ v13 ^ v15;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (NSDictionary)textAttributes
{
  return self->_textAttributes;
}

- (int64_t)capitalization
{
  return self->_capitalization;
}

- (BOOL)allowTruncation
{
  return self->_allowTruncation;
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return self->_adjustsFontSizeToFitWidth;
}

- (void)setFallbackCapitalization:(int64_t)a3
{
  self->_fallbackCapitalization = a3;
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  self->_adjustsFontSizeToFitWidth = a3;
}

- (int64_t)verticalAlignment
{
  return self->_verticalAlignment;
}

- (double)minimumTruncatedScaleFactor
{
  return self->_minimumTruncatedScaleFactor;
}

- (double)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (NSDictionary)fallbackTextAttributes
{
  return self->_fallbackTextAttributes;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  int v37;
  double v38;
  double v39;
  double v40;
  int v41;
  double v43;
  double v44;
  double v45;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PXLabelSpec;
  v5 = -[PXViewSpec isEqual:](&v46, sel_isEqual_, v4);
  v6 = v4;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "font");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[PXLabelSpec font](self, "font");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v8 == v9)
    {

    }
    else
    {
      v10 = v9;
      v11 = objc_msgSend(v8, "isEqual:", v9);

      if ((v11 & 1) == 0)
      {
LABEL_26:
        LOBYTE(v5) = 0;
        goto LABEL_27;
      }
    }
    objc_msgSend(v7, "textColor");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[PXLabelSpec textColor](self, "textColor");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v12 == v13)
    {

    }
    else
    {
      v14 = v13;
      v15 = objc_msgSend(v12, "isEqual:", v13);

      if ((v15 & 1) == 0)
        goto LABEL_26;
    }
    objc_msgSend(v7, "textAttributes");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[PXLabelSpec textAttributes](self, "textAttributes");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v16 == v17)
    {

    }
    else
    {
      v18 = v17;
      v19 = objc_msgSend(v16, "isEqual:", v17);

      if ((v19 & 1) == 0)
        goto LABEL_26;
    }
    v20 = objc_msgSend(v7, "textAlignment");
    if (v20 != -[PXLabelSpec textAlignment](self, "textAlignment"))
      goto LABEL_26;
    v21 = objc_msgSend(v7, "verticalAlignment");
    if (v21 != -[PXLabelSpec verticalAlignment](self, "verticalAlignment"))
      goto LABEL_26;
    v22 = objc_msgSend(v7, "capitalization");
    if (v22 != -[PXLabelSpec capitalization](self, "capitalization"))
      goto LABEL_26;
    v23 = objc_msgSend(v7, "fallbackCapitalization");
    if (v23 != -[PXLabelSpec fallbackCapitalization](self, "fallbackCapitalization"))
      goto LABEL_26;
    v24 = objc_msgSend(v7, "numberOfLines");
    if (v24 != -[PXLabelSpec numberOfLines](self, "numberOfLines"))
      goto LABEL_26;
    objc_msgSend(v7, "contentInsets");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    -[PXLabelSpec contentInsets](self, "contentInsets");
    LOBYTE(v5) = 0;
    if (v28 == v36 && v26 == v33 && v32 == v35 && v30 == v34)
    {
      v37 = objc_msgSend(v7, "adjustsFontSizeToFitWidth");
      if (v37 == -[PXLabelSpec adjustsFontSizeToFitWidth](self, "adjustsFontSizeToFitWidth"))
      {
        objc_msgSend(v7, "minimumScaleFactor");
        v39 = v38;
        -[PXLabelSpec minimumScaleFactor](self, "minimumScaleFactor");
        if (v39 == v40)
        {
          v41 = objc_msgSend(v7, "allowTruncation");
          if (v41 == -[PXLabelSpec allowTruncation](self, "allowTruncation"))
          {
            objc_msgSend(v7, "minimumTruncatedScaleFactor");
            v44 = v43;
            -[PXLabelSpec minimumTruncatedScaleFactor](self, "minimumTruncatedScaleFactor");
            LOBYTE(v5) = v44 == v45;
            goto LABEL_27;
          }
        }
      }
      goto LABEL_26;
    }
  }
LABEL_27:

  return v5;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIFont)font
{
  return self->_font;
}

- (unint64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setFallbackTextAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (int64_t)fallbackCapitalization
{
  return self->_fallbackCapitalization;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (void)setMinimumScaleFactor:(double)a3
{
  self->_minimumScaleFactor = a3;
}

- (void)setMinimumTruncatedScaleFactor:(double)a3
{
  self->_minimumTruncatedScaleFactor = a3;
}

@end
