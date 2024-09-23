@implementation _UITabBarLayoutData

- (UIColor)selectionIndicatorTintColor
{
  return self->_selectionIndicatorTintColor;
}

- (UIImage)selectionIndicatorImage
{
  return self->_selectionIndicatorImage;
}

- (double)itemWidth
{
  return self->_itemWidth;
}

- (double)itemSpacing
{
  return self->_itemSpacing;
}

- (int64_t)itemPositioning
{
  return self->_itemPositioning;
}

+ (id)standardLayoutData
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)_UITabBarLayoutStandard;
  if (!_UITabBarLayoutStandard)
  {
    v3 = objc_opt_new();
    v4 = (void *)_UITabBarLayoutStandard;
    _UITabBarLayoutStandard = v3;

    v5 = (id)objc_msgSend((id)_UITabBarLayoutStandard, "markReadOnly");
    v2 = (void *)_UITabBarLayoutStandard;
  }
  return v2;
}

+ (id)decodeFromCoder:(id)a3 prefix:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("SelectionIndicatorTintColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("SelectionIndicatorImage"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Positioning"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "containsValueForKey:", v13) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Positioning"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v5, "decodeIntegerForKey:", v14);

    }
    else
    {
      v15 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Width"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0.0;
    v18 = 0.0;
    if ((objc_msgSend(v5, "containsValueForKey:", v16) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Width"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "decodeDoubleForKey:", v19);
      v18 = v20;

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Spacing"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "containsValueForKey:", v21) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Spacing"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "decodeDoubleForKey:", v22);
      v17 = v23;

    }
  }
  else
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", v7, CFSTR("SelectionIndicatorTintColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SelectionIndicatorImage"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("Positioning")))
      v15 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("Positioning"));
    else
      v15 = 0;
    v17 = 0.0;
    v18 = 0.0;
    if ((objc_msgSend(v5, "containsValueForKey:", CFSTR("Width")) & 1) != 0)
    {
      objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("Width"));
      v18 = v24;
    }
    if ((objc_msgSend(v5, "containsValueForKey:", CFSTR("Spacing")) & 1) != 0)
    {
      objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("Spacing"));
      v17 = v25;
    }
  }
  if (v9 || v12 || v15 || v18 != 0.0 || v17 != 0.0)
  {
    v26 = objc_opt_new();
    objc_storeStrong((id *)(v26 + 16), v9);
    objc_storeStrong((id *)(v26 + 24), v12);
    *(_QWORD *)(v26 + 32) = v15;
    *(double *)(v26 + 40) = v18;
    *(double *)(v26 + 48) = v17;
  }
  else
  {
    v26 = 0;
  }

  return (id)v26;
}

- (void)encodeToCoder:(id)a3 prefix:(id)a4
{
  id v6;
  void *v7;
  UIColor *selectionIndicatorTintColor;
  void *v9;
  UIImage *selectionIndicatorImage;
  void *v11;
  UIImage *v12;
  void *v13;
  int64_t itemPositioning;
  void *v15;
  double itemWidth;
  void *v17;
  double v18;
  void *v19;
  double itemSpacing;
  void *v21;
  id v22;

  v22 = a3;
  v6 = a4;
  v7 = v6;
  if ((_UITabBarLayoutData *)_UITabBarLayoutStandard == self)
    goto LABEL_26;
  selectionIndicatorTintColor = self->_selectionIndicatorTintColor;
  if (!selectionIndicatorTintColor)
    goto LABEL_5;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("SelectionIndicatorTintColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "encodeObject:forKey:", selectionIndicatorTintColor, v9);

LABEL_5:
    selectionIndicatorImage = self->_selectionIndicatorImage;
    if (!selectionIndicatorImage)
      goto LABEL_12;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("SelectionIndicatorImage"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "encodeObject:forKey:", selectionIndicatorImage, v11);

      goto LABEL_12;
    }
    v13 = v22;
    v12 = self->_selectionIndicatorImage;
    goto LABEL_11;
  }
  objc_msgSend(v22, "encodeObject:forKey:", self->_selectionIndicatorTintColor, CFSTR("SelectionIndicatorTintColor"));
  v12 = self->_selectionIndicatorImage;
  if (!v12)
    goto LABEL_12;
  v13 = v22;
LABEL_11:
  objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("SelectionIndicatorImage"));
LABEL_12:
  itemPositioning = self->_itemPositioning;
  if (!itemPositioning)
  {
LABEL_15:
    itemWidth = self->_itemWidth;
    if (itemWidth == 0.0)
      goto LABEL_22;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Width"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "encodeDouble:forKey:", v17, itemWidth);

      goto LABEL_22;
    }
    v19 = v22;
    v18 = self->_itemWidth;
    goto LABEL_21;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Positioning"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "encodeInteger:forKey:", itemPositioning, v15);

    goto LABEL_15;
  }
  objc_msgSend(v22, "encodeInteger:forKey:", self->_itemPositioning, CFSTR("Positioning"));
  v18 = self->_itemWidth;
  if (v18 == 0.0)
    goto LABEL_22;
  v19 = v22;
LABEL_21:
  objc_msgSend(v19, "encodeDouble:forKey:", CFSTR("Width"), v18);
LABEL_22:
  itemSpacing = self->_itemSpacing;
  if (itemSpacing != 0.0)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Spacing"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "encodeDouble:forKey:", v21, itemSpacing);

    }
    else
    {
      objc_msgSend(v22, "encodeDouble:forKey:", CFSTR("Spacing"), self->_itemSpacing);
    }
  }
LABEL_26:

}

- (void)describeInto:(id)a3
{
  id v4;
  int64_t itemPositioning;
  const __CFString *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UITabBarLayoutData;
  -[_UIBarAppearanceData describeInto:](&v7, sel_describeInto_, v4);
  objc_msgSend(v4, "appendString:", CFSTR(" positioning="));
  itemPositioning = self->_itemPositioning;
  switch(itemPositioning)
  {
    case 2:
      v6 = CFSTR("centered");
      goto LABEL_7;
    case 1:
      v6 = CFSTR("fill");
      goto LABEL_7;
    case 0:
      v6 = CFSTR("automatic");
LABEL_7:
      objc_msgSend(v4, "appendString:", v6);
      goto LABEL_9;
  }
  objc_msgSend(v4, "appendFormat:", CFSTR("unknown(%li)"), self->_itemPositioning);
LABEL_9:
  if (self->_selectionIndicatorImage)
    objc_msgSend(v4, "appendFormat:", CFSTR(" selectionIndicatorImage=%@"), self->_selectionIndicatorImage);
  if (self->_selectionIndicatorTintColor)
    objc_msgSend(v4, "appendFormat:", CFSTR(" selectionIndicatorTintColor=%@"), self->_selectionIndicatorTintColor);
  if (self->_itemWidth > 0.0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" itemWidth=%f"), *(_QWORD *)&self->_itemWidth);
  if (self->_itemSpacing > 0.0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" itemSpacing=%f"), *(_QWORD *)&self->_itemSpacing);

}

- (int64_t)hashInto:(int64_t)a3
{
  id v4;
  uint64_t itemWidth;
  uint64_t itemSpacing;
  unint64_t v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UITabBarLayoutData;
  v4 = -[_UIBarAppearanceData hashInto:](&v10, sel_hashInto_, a3);
  itemWidth = (uint64_t)self->_itemWidth;
  itemSpacing = (uint64_t)self->_itemSpacing;
  v7 = -[UIImage hash](self->_selectionIndicatorImage, "hash");
  v8 = -[UIColor hash](self->_selectionIndicatorTintColor, "hash");
  return (int64_t)v4
       + itemWidth
       + itemSpacing
       + v7
       + v8
       + ((_QWORD)v4 + itemWidth + itemSpacing + v7 + v8) * self->_itemPositioning;
}

- (BOOL)checkEqualTo:(id)a3
{
  double *v4;
  void *v5;
  UIImage *v6;
  UIImage *v7;
  UIImage *v8;
  BOOL v9;
  char v10;
  _BOOL4 v11;
  UIColor *selectionIndicatorTintColor;
  void *v13;
  UIImage *v14;
  objc_super v16;

  v4 = (double *)a3;
  v16.receiver = self;
  v16.super_class = (Class)_UITabBarLayoutData;
  if (-[_UIBarAppearanceData checkEqualTo:](&v16, sel_checkEqualTo_, v4)
    && self->_itemPositioning == *((_QWORD *)v4 + 4)
    && self->_itemWidth == v4[5]
    && self->_itemSpacing == v4[6])
  {
    v5 = (void *)*((_QWORD *)v4 + 3);
    v6 = self->_selectionIndicatorImage;
    v7 = v5;
    if (v6 == v7)
    {

      goto LABEL_14;
    }
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
    {
      v10 = 0;
LABEL_21:

      goto LABEL_19;
    }
    v11 = -[UIImage isEqual:](v6, "isEqual:", v7);

    if (v11)
    {
LABEL_14:
      selectionIndicatorTintColor = self->_selectionIndicatorTintColor;
      v13 = (void *)*((_QWORD *)v4 + 2);
      v6 = selectionIndicatorTintColor;
      v14 = v13;
      if (v6 == v14)
      {
        v10 = 1;
        v8 = v6;
      }
      else
      {
        v8 = v14;
        v10 = 0;
        if (v6 && v14)
          v10 = -[UIImage isEqual:](v6, "isEqual:", v14);
      }
      goto LABEL_21;
    }
  }
  v10 = 0;
LABEL_19:

  return v10;
}

- (id)replicate
{
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITabBarLayoutData;
  -[_UIBarAppearanceData replicate](&v5, sel_replicate);
  v3 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 24), self->_selectionIndicatorImage);
  objc_storeStrong((id *)(v3 + 16), self->_selectionIndicatorTintColor);
  *(_QWORD *)(v3 + 32) = self->_itemPositioning;
  *(double *)(v3 + 40) = self->_itemWidth;
  *(double *)(v3 + 48) = self->_itemSpacing;
  return (id)v3;
}

- (void)setItemPositioning:(int64_t)a3
{
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  self->_itemPositioning = a3;
}

- (void)setItemWidth:(double)a3
{
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  self->_itemWidth = a3;
}

- (void)setItemSpacing:(double)a3
{
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  self->_itemSpacing = a3;
}

- (void)setSelectionIndicatorTintColor:(id)a3
{
  id v5;
  void *v6;
  char v7;
  UIColor *v8;
  UIColor *selectionIndicatorTintColor;
  id v10;

  v5 = a3;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  v10 = v5;
  if (v10
    && (+[UIColor clearColor](UIColor, "clearColor"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v10, "isEqual:", v6),
        v6,
        (v7 & 1) == 0))
  {
    v8 = (UIColor *)v10;
  }
  else
  {
    v8 = 0;
  }

  selectionIndicatorTintColor = self->_selectionIndicatorTintColor;
  self->_selectionIndicatorTintColor = v8;

}

- (void)setSelectionIndicatorImage:(id)a3
{
  id v5;
  id v6;
  double v7;
  UIImage *v8;
  double v9;
  UIImage *selectionIndicatorImage;
  id v11;

  v5 = a3;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  v6 = v5;
  v11 = v6;
  if (v6)
  {
    objc_msgSend(v6, "size");
    v8 = 0;
    if (v9 != 0.0 && v7 != 0.0)
      v8 = (UIImage *)v11;
  }
  else
  {
    v8 = 0;
  }

  selectionIndicatorImage = self->_selectionIndicatorImage;
  self->_selectionIndicatorImage = v8;

}

- (int64_t)positioningForTraitCollection:(id)a3
{
  if (!self->_itemPositioning)
    return 0;
  if (objc_msgSend(a3, "horizontalSizeClass") == 2)
    return 2;
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionIndicatorImage, 0);
  objc_storeStrong((id *)&self->_selectionIndicatorTintColor, 0);
}

@end
