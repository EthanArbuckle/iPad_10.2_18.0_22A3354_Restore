@implementation TUIButtonBoxLayout

- (id)collectLinkEntities
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "linkEntities"));

  return v3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  void *v4;
  void *v5;
  double v6;
  BOOL v7;
  float v8;
  uint64_t v9;
  objc_super v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUIButtonBox _metricsForButtonType:](TUIButtonBox, "_metricsForButtonType:", objc_msgSend(v4, "effectiveButtonTypeForLayout")));

  if (v5)
  {
    objc_msgSend(v5, "contentHeight");
    if (v6 <= -3.40282347e38)
    {
      v9 = 0x7FC00000FF7FFFFFLL;
    }
    else
    {
      v7 = v6 < 3.40282347e38;
      v8 = v6;
      if (v7)
        v9 = LODWORD(v8) | 0x7FC0000000000000;
      else
        v9 = 0x7FC000007F7FFFFFLL;
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TUIButtonBoxLayout;
    v9 = (uint64_t)-[$881BB7C90C7D0DFCC1492E3DC022A30F computeIntrinsicHeight](&v11, "computeIntrinsicHeight");
  }

  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)v9;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  unsigned int v14;
  objc_super v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v5 = objc_msgSend(v4, "effectiveButtonTypeForLayout");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUIButtonBox _metricsForButtonType:](TUIButtonBox, "_metricsForButtonType:", v5));
  objc_msgSend(v6, "contentWidthPadding");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stateButtonAttributesMap"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("default")));

  if (v6 && v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
    objc_msgSend(v11, "tui_widthAsTitle");
    v13 = v12;

    if (v13 <= -3.40282347e38)
    {
      v10 = 0x7FC00000FF7FFFFFLL;
    }
    else if (v13 < 3.40282347e38)
    {
      *(float *)&v14 = v13;
      v10 = v14 | 0x7FC0000000000000;
    }
    else
    {
      v10 = 0x7FC000007F7FFFFFLL;
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)TUIButtonBoxLayout;
    v10 = (uint64_t)-[$881BB7C90C7D0DFCC1492E3DC022A30F computeIntrinsicWidth](&v16, "computeIntrinsicWidth");
  }

  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)v10;
}

@end
