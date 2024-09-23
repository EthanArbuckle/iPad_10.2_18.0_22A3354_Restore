@implementation BKLibraryLayoutAttributes

+ (void)initialize
{
  uint64_t v3;
  void *v4;
  unsigned int v5;
  int v6;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___BKLibraryLayoutAttributes;
  objc_msgSendSuper2(&v7, "initialize");
  v3 = objc_opt_class(a1);
  if (v3 == objc_opt_class(BKLibraryLayoutAttributes))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("BKLibraryBookshelfLayoutDebugEnabledUserDefaultsKey"));

    if (v5)
      v6 = 2;
    else
      v6 = 0;
    dword_1009F4DF0 = v6;
  }
}

+ (void)setGlobalLayoutDebugMode:(int)a3
{
  void *v3;
  id v4;

  dword_1009F4DF0 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "setBool:forKey:", dword_1009F4DF0 == 2, CFSTR("BKLibraryBookshelfLayoutDebugEnabledUserDefaultsKey"));

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "synchronize");

}

- (int)layoutDebugMode
{
  return dword_1009F4DF0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKLibraryLayoutAttributes;
  v4 = -[BKLibraryLayoutAttributes copyWithZone:](&v8, "copyWithZone:", a3);
  objc_storeStrong(v4 + 2, self->_foregroundColor);
  v5 = -[NSDictionary copy](self->_fontAttrs, "copy");
  v6 = v4[3];
  v4[3] = v5;

  *((_BYTE *)v4 + 8) = self->_editable;
  objc_storeStrong(v4 + 5, self->_cellMetrics);
  objc_storeStrong(v4 + 4, self->_columnMetrics);
  objc_storeStrong(v4 + 6, self->_mainHeaderMetrics);
  *((_BYTE *)v4 + 9) = self->_rtlLayout;
  *((_BYTE *)v4 + 10) = self->_compactLayout;
  *((_BYTE *)v4 + 11) = self->_verticalStackedLayout;
  *((_BYTE *)v4 + 12) = self->_editMode;
  *((_BYTE *)v4 + 13) = self->_firstItem;
  *((_BYTE *)v4 + 14) = self->_lastItem;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  char v31;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)BKLibraryLayoutAttributes;
  if (-[BKLibraryLayoutAttributes isEqual:](&v48, "isEqual:"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryLayoutAttributes foregroundColor](self, "foregroundColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "foregroundColor"));
    if (v8 != v9)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryLayoutAttributes foregroundColor](self, "foregroundColor"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "foregroundColor"));
      if (!objc_msgSend(v3, "isEqual:", v4))
      {
        LOBYTE(v10) = 0;
        goto LABEL_40;
      }
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryLayoutAttributes fontAttrs](self, "fontAttrs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "fontAttrs"));
    if (v11 != v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryLayoutAttributes fontAttrs](self, "fontAttrs"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "fontAttrs"));
      if (!objc_msgSend(v13, "isEqual:", v5))
      {
        LOBYTE(v10) = 0;
        goto LABEL_38;
      }
      v47 = v13;
    }
    v14 = -[BKLibraryLayoutAttributes editable](self, "editable");
    if (v14 != objc_msgSend(a3, "editable"))
    {
      LOBYTE(v10) = 0;
      v13 = v47;
      if (v11 == v12)
      {
LABEL_39:

        if (v8 == v9)
        {
LABEL_41:

          return v10;
        }
LABEL_40:

        goto LABEL_41;
      }
LABEL_38:

      goto LABEL_39;
    }
    v46 = v5;
    v15 = objc_claimAutoreleasedReturnValue(-[BKLibraryLayoutAttributes cellMetrics](self, "cellMetrics"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellMetrics"));
    v17 = (void *)v16;
    v45 = (void *)v15;
    if (v15 == v16)
    {
      v44 = (void *)v16;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryLayoutAttributes cellMetrics](self, "cellMetrics"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellMetrics"));
      v40 = v18;
      if (!objc_msgSend(v18, "isEqual:"))
      {
        LOBYTE(v10) = 0;
        v13 = v47;
        v20 = v45;
LABEL_36:

LABEL_37:
        v5 = v46;
        if (v11 == v12)
          goto LABEL_39;
        goto LABEL_38;
      }
      v44 = v17;
    }
    v42 = objc_claimAutoreleasedReturnValue(-[BKLibraryLayoutAttributes columnMetrics](self, "columnMetrics"));
    v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "columnMetrics"));
    v13 = v47;
    v41 = v3;
    if (v42 != v43)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryLayoutAttributes columnMetrics](self, "columnMetrics"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "columnMetrics"));
      v37 = v19;
      if (!objc_msgSend(v19, "isEqual:"))
      {
        LOBYTE(v10) = 0;
        v20 = v45;
        v21 = (void *)v42;
        v22 = (void *)v43;
LABEL_34:

LABEL_35:
        v17 = v44;
        v3 = v41;
        if (v20 == v44)
          goto LABEL_37;
        goto LABEL_36;
      }
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryLayoutAttributes mainHeaderMetrics](self, "mainHeaderMetrics"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mainHeaderMetrics"));
    if (v23 == v38
      || (v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryLayoutAttributes mainHeaderMetrics](self, "mainHeaderMetrics")),
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mainHeaderMetrics")),
          v35 = v24,
          objc_msgSend(v24, "isEqual:")))
    {
      v26 = -[BKLibraryLayoutAttributes rtlLayout](self, "rtlLayout");
      if (v26 == objc_msgSend(a3, "rtlLayout")
        && (v27 = -[BKLibraryLayoutAttributes compactLayout](self, "compactLayout"),
            v27 == objc_msgSend(a3, "compactLayout"))
        && (v28 = -[BKLibraryLayoutAttributes verticalStackedLayout](self, "verticalStackedLayout"),
            v28 == objc_msgSend(a3, "verticalStackedLayout"))
        && (v29 = -[BKLibraryLayoutAttributes editMode](self, "editMode"),
            v29 == objc_msgSend(a3, "editMode"))
        && (v30 = -[BKLibraryLayoutAttributes firstItem](self, "firstItem"),
            v30 == objc_msgSend(a3, "firstItem")))
      {
        v33 = -[BKLibraryLayoutAttributes lastItem](self, "lastItem");
        v10 = v33 ^ objc_msgSend(a3, "lastItem") ^ 1;
        v31 = v10;
      }
      else
      {
        LOBYTE(v10) = 0;
        v31 = 0;
      }
      v25 = v38;
      if (v23 == v38)
      {

        LOBYTE(v10) = v31;
LABEL_33:
        v21 = (void *)v42;
        v22 = (void *)v43;
        v13 = v47;
        v20 = v45;
        if (v42 == v43)
          goto LABEL_35;
        goto LABEL_34;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
      v25 = v38;
    }

    goto LABEL_33;
  }
  LOBYTE(v10) = 0;
  return v10;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKLibraryLayoutAttributes;
  v3 = -[BKLibraryLayoutAttributes description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("%@ "), v4));

  if (self->_cellMetrics)
    objc_msgSend(v5, "appendFormat:", CFSTR("cellMetrics: (%@); "), self->_cellMetrics);
  return v5;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundColor, a3);
}

- (NSDictionary)fontAttrs
{
  return self->_fontAttrs;
}

- (void)setFontAttrs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)editable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (BKLibraryBookshelfColumnMetrics)columnMetrics
{
  return self->_columnMetrics;
}

- (void)setColumnMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_columnMetrics, a3);
}

- (BKLibraryBookshelfCellMetrics)cellMetrics
{
  return self->_cellMetrics;
}

- (void)setCellMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_cellMetrics, a3);
}

- (BKLibraryBookshelfMainHeaderMetrics)mainHeaderMetrics
{
  return self->_mainHeaderMetrics;
}

- (void)setMainHeaderMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_mainHeaderMetrics, a3);
}

- (BOOL)rtlLayout
{
  return self->_rtlLayout;
}

- (void)setRtlLayout:(BOOL)a3
{
  self->_rtlLayout = a3;
}

- (BOOL)compactLayout
{
  return self->_compactLayout;
}

- (void)setCompactLayout:(BOOL)a3
{
  self->_compactLayout = a3;
}

- (BOOL)verticalStackedLayout
{
  return self->_verticalStackedLayout;
}

- (void)setVerticalStackedLayout:(BOOL)a3
{
  self->_verticalStackedLayout = a3;
}

- (BOOL)editMode
{
  return self->_editMode;
}

- (void)setEditMode:(BOOL)a3
{
  self->_editMode = a3;
}

- (BOOL)firstItem
{
  return self->_firstItem;
}

- (void)setFirstItem:(BOOL)a3
{
  self->_firstItem = a3;
}

- (BOOL)lastItem
{
  return self->_lastItem;
}

- (void)setLastItem:(BOOL)a3
{
  self->_lastItem = a3;
}

- (BOOL)useAllCaps
{
  return self->_useAllCaps;
}

- (void)setUseAllCaps:(BOOL)a3
{
  self->_useAllCaps = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainHeaderMetrics, 0);
  objc_storeStrong((id *)&self->_cellMetrics, 0);
  objc_storeStrong((id *)&self->_columnMetrics, 0);
  objc_storeStrong((id *)&self->_fontAttrs, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
}

@end
