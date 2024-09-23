@implementation PXCuratedLibraryLabelConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[PXCuratedLibraryLabelConfiguration text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

  objc_msgSend(v4, "setTextAlignment:", -[PXCuratedLibraryLabelConfiguration textAlignment](self, "textAlignment"));
  -[PXCuratedLibraryLabelConfiguration textColor](self, "textColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PXCuratedLibraryLabelConfiguration *v4;
  PXCuratedLibraryLabelConfiguration *v5;
  id v6;
  id v7;
  int v8;
  BOOL v9;
  int64_t v10;
  void *v11;
  void *v12;

  v4 = (PXCuratedLibraryLabelConfiguration *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXCuratedLibraryLabelConfiguration text](self, "text");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibraryLabelConfiguration text](v5, "text");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

      }
      else
      {
        v8 = objc_msgSend(v6, "isEqualToString:", v7);

        if (!v8)
          goto LABEL_11;
      }
      v10 = -[PXCuratedLibraryLabelConfiguration textAlignment](self, "textAlignment");
      if (v10 == -[PXCuratedLibraryLabelConfiguration textAlignment](v5, "textAlignment"))
      {
        -[PXCuratedLibraryLabelConfiguration textColor](self, "textColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXCuratedLibraryLabelConfiguration textColor](v5, "textColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v11 == v12;

LABEL_12:
        goto LABEL_13;
      }
LABEL_11:
      v9 = 0;
      goto LABEL_12;
    }
    v9 = 0;
  }
LABEL_13:

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXCuratedLibraryLabelConfiguration text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
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
  objc_storeStrong((id *)&self->_text, 0);
}

@end
