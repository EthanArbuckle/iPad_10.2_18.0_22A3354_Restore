@implementation UILabel

+ (id)newStandardTextLabelWithFont:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v4, "setFont:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v4, "setBackgroundColor:", v5);

  return v4;
}

+ (double)_maps_maximumHeightWithFont:(id)a3 numberOfLines:(int64_t)a4 displayScale:(double)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  double v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v7 = a3;
  v8 = v7;
  if (a4 < 1)
  {
    v22 = 1.79769313e308;
  }
  else
  {
    objc_msgSend(v7, "lineHeight");
    v10 = v9;
    objc_msgSend(v8, "leading");
    v12 = v11 * (double)(a4 - 1) + v10 * (double)a4;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v14 = objc_msgSend(v13, "userInterfaceIdiom");

    if (v14 == (id)5)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fontDescriptor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fontAttributes"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", UIFontDescriptorTextStyleAttribute));

      if (v17)
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v18 = objc_msgSend(&off_101273008, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v25;
          while (2)
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(_QWORD *)v25 != v20)
                objc_enumerationMutation(&off_101273008);
              if (objc_msgSend(v17, "containsString:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i)))
              {
                v12 = v12 + 1.0;
                goto LABEL_15;
              }
            }
            v19 = objc_msgSend(&off_101273008, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
            if (v19)
              continue;
            break;
          }
        }
      }
LABEL_15:

      a5 = 1.0;
    }
    v22 = UICeilToScale(v12, a5);
  }

  return v22;
}

- (BOOL)isTextTruncated
{
  return -[UILabel isTextTruncatedIgnoringLeading:](self, "isTextTruncatedIgnoringLeading:", 0);
}

- (BOOL)isTextTruncatedIgnoringLeading:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  void *v18;
  double v19;
  double Width;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  NSAttributedStringKey v27;
  void *v28;
  CGRect v29;

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[UILabel text](self, "text"));
  if (!v5)
    return 0;
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self, "text"));
  v8 = objc_msgSend(v7, "length");

  if (!v8)
    return 0;
  v27 = NSFontAttributeName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self, "font"));
  v28 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));

  if (-[UILabel numberOfLines](self, "numberOfLines") < 1)
  {
    v17 = 1.79769313e308;
  }
  else
  {
    v11 = (double)-[UILabel numberOfLines](self, "numberOfLines");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self, "font"));
    objc_msgSend(v12, "lineHeight");
    v14 = v13;
    if (v3)
    {
      v15 = v13 + 0.0;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self, "font"));
      objc_msgSend(v18, "leading");
      v15 = v14 + v19;

    }
    v17 = v15 * v11;

  }
  -[UILabel bounds](self, "bounds");
  Width = CGRectGetWidth(v29);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self, "text"));
  v22 = v21;
  if (v3)
    v23 = 33;
  else
    v23 = 35;
  objc_msgSend(v21, "boundingRectWithSize:options:attributes:context:", v23, v10, 0, Width, 1.79769313e308);
  v25 = v24;

  v16 = v25 > v17;
  return v16;
}

@end
