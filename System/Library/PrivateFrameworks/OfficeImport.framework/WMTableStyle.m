@implementation WMTableStyle

- (WMTableStyle)initWithWDTableProperties:(id)a3
{
  id v5;
  WMTableStyle *v6;
  WMTableStyle *v7;
  WMTableStyle *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WMTableStyle;
  v6 = -[CMStyle init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mWdTableProperties, a3);
    -[WMTableStyle addTableProperties:](v7, "addTableProperties:", v5);
    v8 = v7;
  }

  return v7;
}

- (void)addTableProperties:(id)a3
{
  WMBordersProperty *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  WMBordersProperty *v12;
  WMBordersProperty *v13;
  id v14;

  v14 = a3;
  if ((objc_msgSend(v14, "isTopBorderOverridden") & 1) != 0
    || (objc_msgSend(v14, "isLeftBorderOverridden") & 1) != 0
    || (objc_msgSend(v14, "isBottomBorderOverridden") & 1) != 0
    || objc_msgSend(v14, "isRightBorderOverridden"))
  {
    v4 = objc_alloc_init(WMBordersProperty);
    if (objc_msgSend(v14, "isTopBorderOverridden"))
    {
      objc_msgSend(v14, "topBorder");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WMBordersProperty setBorder:location:](v4, "setBorder:location:", v5, 1);

    }
    if (objc_msgSend(v14, "isLeftBorderOverridden"))
    {
      objc_msgSend(v14, "leftBorder");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WMBordersProperty setBorder:location:](v4, "setBorder:location:", v6, 2);

    }
    if (objc_msgSend(v14, "isBottomBorderOverridden"))
    {
      objc_msgSend(v14, "bottomBorder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WMBordersProperty setBorder:location:](v4, "setBorder:location:", v7, 3);

    }
    if (objc_msgSend(v14, "isRightBorderOverridden"))
    {
      objc_msgSend(v14, "rightBorder");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WMBordersProperty setBorder:location:](v4, "setBorder:location:", v8, 4);

    }
    -[CMBordersProperty adjustValues](v4, "adjustValues");
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v4, CFSTR("outsideBoders"));

  }
  v9 = objc_msgSend(v14, "isInsideHorizontalBorderOverridden");
  if (v9)
  {
    objc_msgSend(v14, "insideHorizontalBorder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend(v14, "isInsideVerticalBorderOverridden"))
  {
    objc_msgSend(v14, "insideVerticalBorder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v9)
      goto LABEL_26;
    v11 = 0;
  }
  v12 = objc_alloc_init(WMBordersProperty);
  v13 = v12;
  if (v10)
  {
    -[WMBordersProperty setBorder:location:](v12, "setBorder:location:", v10, 1);
    -[WMBordersProperty setBorder:location:](v13, "setBorder:location:", v10, 3);
  }
  if (v11)
  {
    -[WMBordersProperty setBorder:location:](v13, "setBorder:location:", v11, 4);
    -[WMBordersProperty setBorder:location:](v13, "setBorder:location:", v11, 2);
  }
  -[CMBordersProperty adjustValues](v13, "adjustValues");
  -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v13, 0x24F3E71B8);

LABEL_26:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mWdTableProperties, 0);
}

@end
