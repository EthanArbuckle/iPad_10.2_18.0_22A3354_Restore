@implementation STSegmentItem

- (STSegmentItem)initWithTitleText:(id)a3 detailText:(id)a4 titleColor:(id)a5 detailImage:(id)a6 detailImageTintColor:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  STSegmentItem *v17;
  uint64_t v18;
  NSString *titleText;
  uint64_t v20;
  NSString *detailText;
  uint64_t v22;
  UIColor *detailImageTintColor;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)STSegmentItem;
  v17 = -[STSegmentItem init](&v25, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    titleText = v17->_titleText;
    v17->_titleText = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    detailText = v17->_detailText;
    v17->_detailText = (NSString *)v20;

    objc_storeStrong((id *)&v17->_titleColor, a5);
    objc_storeStrong((id *)&v17->_detailImage, a6);
    v22 = objc_msgSend(v16, "copy");
    detailImageTintColor = v17->_detailImageTintColor;
    v17->_detailImageTintColor = (UIColor *)v22;

  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[STSegmentItem titleText](self, "titleText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "titleText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqualToString:", v7))
    {
      v14 = 0;
LABEL_22:

      goto LABEL_23;
    }
    -[STSegmentItem detailText](self, "detailText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "detailText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqualToString:", v9))
    {
      v14 = 0;
LABEL_21:

      goto LABEL_22;
    }
    -[STSegmentItem titleColor](self, "titleColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "titleColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "isEqual:", v11))
    {
      v14 = 0;
LABEL_20:

      goto LABEL_21;
    }
    -[STSegmentItem detailImage](self, "detailImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "detailImage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == v26)
    {
      v23 = v12;
    }
    else
    {
      v21 = v11;
      -[STSegmentItem detailImage](self, "detailImage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "detailImage");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v13;
      if (!objc_msgSend(v13, "isEqual:"))
      {
        v14 = 0;
        v11 = v21;
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      v23 = v12;
      v11 = v21;
    }
    -[STSegmentItem detailImageTintColor](self, "detailImageTintColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "detailImageTintColor");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v15 == (void *)v16)
    {

      v14 = 1;
    }
    else
    {
      v20 = (void *)v16;
      -[STSegmentItem detailImageTintColor](self, "detailImageTintColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "detailImageTintColor");
      v22 = v10;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v19, "isEqual:", v17);

      v10 = v22;
    }
    v12 = v23;
    if (v23 == v26)
      goto LABEL_19;
    goto LABEL_18;
  }
  v14 = 0;
LABEL_23:

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[STSegmentItem titleText](self, "titleText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[STSegmentItem detailText](self, "detailText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[STSegmentItem titleColor](self, "titleColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[STSegmentItem detailImage](self, "detailImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[STSegmentItem detailImageTintColor](self, "detailImageTintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (NSString)accessibilityText
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccessibilityText:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (UIImage)detailImage
{
  return self->_detailImage;
}

- (UIColor)detailImageTintColor
{
  return (UIColor *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailImageTintColor, 0);
  objc_storeStrong((id *)&self->_detailImage, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_accessibilityText, 0);
}

@end
