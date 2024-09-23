@implementation RouteStepLabelListView

+ (id)voiceOverStringsForRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5
{
  return 0;
}

+ (id)stringsForRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5
{
  return 0;
}

+ (id)stringsForRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5 isPrinting:(BOOL)a6
{
  return 0;
}

+ (id)fontsForStrings:(id)a3 route:(id)a4 step:(id)a5 tableMode:(BOOL)a6
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v13;
  unint64_t v14;
  void *v15;

  v6 = objc_msgSend(a3, "count");
  if (!v6)
    return 0;
  v7 = (unint64_t)v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (v10 == (id)5)
  {
    do
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
      objc_msgSend(v8, "addObject:", v11);

      --v7;
    }
    while (v7);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17Bold](UIFont, "system17Bold"));
    objc_msgSend(v8, "addObject:", v13);

    if (v7 >= 2)
    {
      v14 = v7 - 1;
      do
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
        objc_msgSend(v8, "addObject:", v15);

        --v14;
      }
      while (v14);
    }
  }
  return v8;
}

+ (id)colorsForStrings:(id)a3 route:(id)a4 step:(id)a5 tableMode:(BOOL)a6
{
  char *v6;
  char *v7;
  void *v8;
  void *v9;
  char *v10;
  void *v11;

  v6 = (char *)objc_msgSend(a3, "count");
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    objc_msgSend(v8, "addObject:", v9);

    v10 = v7 - 1;
    if (v7 != (char *)1)
    {
      do
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.501960814, 1.0));
        objc_msgSend(v8, "addObject:", v11);

        --v10;
      }
      while (v10);
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)attributedStringForString:(id)a3 inStrings:(id)a4 forStep:(id)a5 font:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (objc_msgSend(a5, "isEVChargerStep")
    && (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject")),
        v13 = objc_msgSend(v9, "isEqualToString:", v12),
        v12,
        v13))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("bolt.circle.fill")));
    objc_msgSend(v11, "pointSize");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 4, 2));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageWithConfiguration:", v15));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imageWithRenderingMode:", 2));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_flatImageWithColor:", v18));

    if (v19)
    {
      v20 = objc_alloc_init((Class)NSTextAttachment);
      objc_msgSend(v20, "setImage:", v19);
      objc_msgSend(v11, "capHeight");
      v22 = v21;
      objc_msgSend(v19, "size");
      v24 = (v22 - v23) * 0.5;
      objc_msgSend(v19, "size");
      v26 = v25;
      objc_msgSend(v19, "size");
      objc_msgSend(v20, "setBounds:", 0.0, v24, v26, v27);
      v28 = objc_alloc((Class)NSMutableAttributedString);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v20));
      v30 = objc_msgSend(v28, "initWithAttributedString:", v29);

      v31 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR(" "));
      objc_msgSend(v30, "appendAttributedString:", v31);
      v32 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v9);
      objc_msgSend(v30, "appendAttributedString:", v32);
      v33 = objc_msgSend(v30, "copy");

    }
    else
    {
      v33 = 0;
    }

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

+ (double)heightForWidth:(double)a3 route:(id)a4 step:(id)a5 idiom:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;

  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringsForRoute:step:tableMode:", v10, v9, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fontsForStrings:route:step:tableMode:", v11, v10, v9, 0));

  v13 = objc_msgSend(v11, "count");
  v14 = objc_msgSend(v9, "isEVChargerStep");

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_spacingForNumberOfStrings:isEVStep:", v13, v14));
  objc_msgSend(a1, "heightForWidth:strings:fonts:spacings:", v11, v12, v15, a3);
  v17 = v16;

  return v17;
}

+ (id)_spacingForNumberOfStrings:(unint64_t)a3 isEVStep:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "spacingForNumberOfStrings:", a3));
  v6 = v5;
  if (v4 && objc_msgSend(v5, "count"))
  {
    v7 = objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v7, "replaceObjectAtIndex:withObject:", (char *)objc_msgSend(v7, "count") - 1, &off_10126CB38);
    v8 = objc_msgSend(v7, "copy");

  }
  else
  {
    v8 = v6;
  }

  return v8;
}

- (RouteStepLabelListView)initWithRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  RouteStepLabelListView *v10;
  RouteStepLabelListView *v11;
  void *v12;
  void *v13;
  char *v14;
  char *v15;
  char *v16;
  _UNKNOWN **v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  RouteStepLabelListView *v26;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  RouteStepLabelListView *v32;
  objc_super v33;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v33.receiver = self;
  v33.super_class = (Class)RouteStepLabelListView;
  v10 = -[LabelListView initWithFrame:](&v33, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v11 = v10;
  if (v10)
  {
    -[RouteStepLabelListView setAccessibilityIdentifier:](v10, "setAccessibilityIdentifier:", CFSTR("RouteStepLabelList"));
    v11->_isEVStep = objc_msgSend(v9, "isEVChargerStep");
    v12 = (void *)objc_opt_class(v11);
    v32 = v11;
    -[RouteStepLabelListView setTableMode:](v11, "setTableMode:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringsForRoute:step:tableMode:", v8, v9, v5));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "voiceOverStringsForRoute:step:tableMode:", v8, v9, v5));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fontsForStrings:route:step:tableMode:", v13, v8, v9, v5));
    v28 = v8;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "colorsForStrings:route:step:tableMode:", v13, v8, v9, v5));
    v14 = (char *)objc_msgSend(v13, "count");
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = MKPlaceCollectionsLogicController_ptr;
      do
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v16));
        v19 = objc_opt_class(v17[390]);
        if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndexedSubscript:", v16));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepLabelListView attributedStringForString:inStrings:forStep:font:](v32, "attributedStringForString:inStrings:forStep:font:", v18, v13, v9, v20));

          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndexedSubscript:", v16));
          v23 = v9;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndexedSubscript:", v16));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", v16));
          -[LabelListView addLabelWithText:attributedText:accessibilityText:font:color:](v32, "addLabelWithText:attributedText:accessibilityText:font:color:", v18, v21, v22, v24, v25);

          v9 = v23;
          v17 = MKPlaceCollectionsLogicController_ptr;

        }
        ++v16;
      }
      while (v15 != v16);
    }
    v11 = v32;
    v26 = v32;

    v8 = v28;
  }

  return v11;
}

- (void)setRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  char *v14;
  void *v15;
  void *v16;
  _UNKNOWN **v17;
  char *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _UNKNOWN **v25;
  void *v26;
  char *v27;
  char *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;

  v5 = a5;
  v39 = a3;
  v8 = a4;
  self->_isEVStep = objc_msgSend(v8, "isEVChargerStep");
  -[RouteStepLabelListView setTableMode:](self, "setTableMode:", v5);
  v9 = (char *)-[NSMutableArray count](self->super._labels, "count");
  v10 = (void *)objc_opt_class(self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringsForRoute:step:tableMode:", v39, v8, v5));
  v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "voiceOverStringsForRoute:step:tableMode:", v39, v8, v5));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fontsForStrings:route:step:tableMode:", v11, v39, v8, v5));
  v40 = v8;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "colorsForStrings:route:step:tableMode:", v11, v39, v8, v5));
  v13 = (char *)objc_msgSend(v11, "count");
  v14 = v13;
  v42 = v12;
  if (v13 >= v9)
  {
    v16 = (void *)v38;
    if (v13 > v9)
    {
      v17 = MKPlaceCollectionsLogicController_ptr;
      v18 = v9;
      v37 = v13;
      do
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v18));
        v20 = objc_opt_class(v17[390]);
        if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v18));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepLabelListView attributedStringForString:inStrings:forStep:font:](self, "attributedStringForString:inStrings:forStep:font:", v19, v11, v40, v21));

          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", v18));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndexedSubscript:", v18));
          v25 = v17;
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectAtIndexedSubscript:", v18));
          -[LabelListView addLabelWithText:attributedText:accessibilityText:font:color:](self, "addLabelWithText:attributedText:accessibilityText:font:color:", v19, v22, v23, v24, v26);

          v17 = v25;
          v16 = (void *)v38;

          v12 = v42;
          v14 = v37;
        }

        ++v18;
      }
      while (v14 != v18);
      v14 = v9;
    }
  }
  else
  {
    do
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->super._labels, "lastObject"));
      objc_msgSend(v15, "removeFromSuperview");
      -[NSMutableArray removeLastObject](self->super._labels, "removeLastObject");

      --v9;
    }
    while (v9 > v14);
    v16 = (void *)v38;
  }
  if (v14)
  {
    v27 = 0;
    do
    {
      v28 = v14;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->super._labels, "objectAtIndexedSubscript:", v27));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v27));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v27));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepLabelListView attributedStringForString:inStrings:forStep:font:](self, "attributedStringForString:inStrings:forStep:font:", v30, v11, v40, v31));

      if (v32)
      {
        objc_msgSend(v29, "setAttributedText:", v32);
      }
      else
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v27));
        objc_msgSend(v29, "setText:", v33);

      }
      v12 = v42;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", v27));
      objc_msgSend(v29, "setAccessibilityLabel:", v34);

      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndexedSubscript:", v27));
      objc_msgSend(v29, "setFont:", v35);

      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectAtIndexedSubscript:", v27));
      objc_msgSend(v29, "setTextColor:", v36);

      ++v27;
      v14 = v28;
    }
    while (v28 != v27);
  }

}

- (void)layoutToFitSize:(CGSize)a3
{
  double height;
  double width;
  id v6;
  void *v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v6 = objc_msgSend((id)objc_opt_class(self), "_spacingForNumberOfStrings:isEVStep:", -[NSMutableArray count](self->super._labels, "count"), self->_isEVStep);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8.receiver = self;
  v8.super_class = (Class)RouteStepLabelListView;
  -[LabelListView layoutToFitSize:spacings:](&v8, "layoutToFitSize:spacings:", v7, width, height);

}

- (BOOL)tableMode
{
  return self->_tableMode;
}

- (void)setTableMode:(BOOL)a3
{
  self->_tableMode = a3;
}

@end
