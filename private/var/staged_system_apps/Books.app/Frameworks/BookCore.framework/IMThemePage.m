@implementation IMThemePage

+ (id)themeForEPUBTheme:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 > 5)
    return 0;
  else
    return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "themeWithIdentifier:", *off_28E430[a3], v3, v4));
}

- (IMThemePage)init
{
  IMThemePage *v2;
  IMThemePage *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMThemePage;
  v2 = -[IMTheme init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[IMTheme setContentStatusBarStyle:](v2, "setContentStatusBarStyle:", 3);
    -[IMTheme setImageMultiplyExpandedContentMode:](v3, "setImageMultiplyExpandedContentMode:", 1);
  }
  return v3;
}

- (id)stableIdentifier
{
  return CFSTR("epub-default");
}

- (id)colorForElement:(unint64_t)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_65268;
  v15 = sub_65278;
  v16 = 0;
  if (-[IMThemePage _wantsComputedColors](self, "_wantsComputedColors"))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_65280;
    v10[3] = &unk_28E3D0;
    v10[5] = &v11;
    v10[6] = a3;
    v10[4] = self;
    -[IMThemePage _colorsInTraitCollectionContext:block:](self, "_colorsInTraitCollectionContext:block:", 0, v10);
  }
  else
  {
    v5 = sub_65324(a3, -[IMThemePage epubTheme](self, "epubTheme"));
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)v12[5];
    v12[5] = v6;

  }
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)backgroundColorForTraitEnvironment:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "traitCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMThemePage backgroundColorForTraitCollection:](self, "backgroundColorForTraitCollection:", v4));

  return v5;
}

- (id)backgroundColorForTraitCollection:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_65268;
  v12 = sub_65278;
  v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_65C8C;
  v7[3] = &unk_28B700;
  v7[4] = self;
  v7[5] = &v8;
  -[IMThemePage _colorsInTraitCollectionContext:block:](self, "_colorsInTraitCollectionContext:block:", v4, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (int64_t)userInterfaceStyle
{
  int64_t v2;

  v2 = -[IMThemePage epubTheme](self, "epubTheme");
  if ((unint64_t)(v2 - 2) > 3)
    return 0;
  else
    return qword_26A200[v2 - 2];
}

- (BOOL)_wantsComputedColors
{
  return (char *)-[IMThemePage epubTheme](self, "epubTheme") - 2 < (char *)&dword_4;
}

- (void)stylizeSegmentedControl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSAttributedStringKey v10;
  void *v11;
  NSAttributedStringKey v12;
  void *v13;

  v12 = NSForegroundColorAttributeName;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMThemePage primaryTextColor](self, "primaryTextColor"));
  v13 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  objc_msgSend(v4, "setTitleTextAttributes:forState:", v6, 0);

  v10 = NSForegroundColorAttributeName;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"));
  v11 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  objc_msgSend(v4, "setTitleTextAttributes:forState:", v8, 4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMThemePage tintColor](self, "tintColor"));
  objc_msgSend(v4, "setTintColor:", v9);

}

- (void)styleMenuCell:(id)a3 withTraitCollection:(id)a4
{
  id v5;
  _QWORD v6[4];
  IMThemePage *v7;
  id v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_65F38;
  v6[3] = &unk_28B808;
  v7 = self;
  v8 = a3;
  v5 = v8;
  -[IMThemePage _colorsInTraitCollectionContext:block:](v7, "_colorsInTraitCollectionContext:block:", a4, v6);

}

- (id)_themeNormalizedTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v4 = a3;
  if (!v4)
    return (id)objc_claimAutoreleasedReturnValue(-[IMThemePage _traitCollection](self, "_traitCollection"));
  v5 = v4;
  v10[0] = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMThemePage _traitCollection](self, "_traitCollection"));
  v10[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithTraitsFromCollections:](UITraitCollection, "traitCollectionWithTraitsFromCollections:", v7));

  return v8;
}

- (void)_colorsInTraitCollectionContext:(id)a3 block:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[IMThemePage _themeNormalizedTraitCollection:](self, "_themeNormalizedTraitCollection:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection _currentTraitCollection](UITraitCollection, "_currentTraitCollection"));
  if (v10)
    +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v10);
  v8 = objc_retainBlock(v6);
  v9 = v8;
  if (v8)
    (*((void (**)(id))v8 + 2))(v8);

  if (v10)
    +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v7);

}

- (UITraitCollection)_traitCollection
{
  UITraitCollection *v3;
  UITraitCollection *traitCollection;

  if (!self->__traitCollection)
  {
    if (-[IMThemePage userInterfaceStyle](self, "userInterfaceStyle"))
      v3 = (UITraitCollection *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:"));
    else
      v3 = (UITraitCollection *)objc_alloc_init((Class)UITraitCollection);
    traitCollection = self->__traitCollection;
    self->__traitCollection = v3;

  }
  return self->__traitCollection;
}

+ (id)colorForElement:(unint64_t)a3 theme:(int64_t)a4
{
  return sub_65324(a3, a4);
}

- (id)buyButtonColor
{
  return -[IMThemePage buttonColor](self, "buttonColor");
}

- (id)finishedButtonBackgroundColor
{
  return -[IMThemePage buttonColor](self, "buttonColor");
}

- (id)finishedCheckmarkColor
{
  id v2;
  void *v3;

  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksGreen](UIColor, "bc_booksGreen")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", objc_msgSend(v2, "CGColor")));

  return v3;
}

- (id)pageCurlBackPageColor
{
  return -[IMThemePage backPageTintColor](self, "backPageTintColor");
}

- (id)popoverBackgroundColor
{
  return -[IMThemePage groupedBackgroundColor](self, "groupedBackgroundColor");
}

- (UIColor)tableViewBackgroundColor
{
  return -[IMThemePage groupedBackgroundColor](self, "groupedBackgroundColor");
}

- (id)tableViewCellBackgroundColor
{
  return -[IMThemePage secondaryGroupedBackgroundColor](self, "secondaryGroupedBackgroundColor");
}

- (id)tableViewHeaderViewColor
{
  return -[IMThemePage popoverBackgroundColor](self, "popoverBackgroundColor");
}

- (id)tableViewCellSelectedColor
{
  return -[IMThemePage colorForElement:](self, "colorForElement:", 18);
}

- (id)tableViewSeparatorColor
{
  void *v2;
  char v3;
  double v4;
  double v5;

  v2 = -[IMThemePage epubTheme](self, "epubTheme");
  v3 = (_BYTE)v2 + 1;
  if ((unint64_t)v2 + 1 <= 6)
  {
    if (((1 << v3) & 7) != 0)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSeparatorColor](UIColor, "bc_booksSeparatorColor"));
    }
    else
    {
      if (((1 << v3) & 0x18) != 0)
      {
        v4 = 0.12;
        v5 = 0.0;
      }
      else
      {
        v4 = 0.15;
        v5 = 1.0;
      }
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v5, v4));
    }
  }
  return v2;
}

- (UIColor)secondaryBackgroundColor
{
  return (UIColor *)-[IMThemePage colorForElement:](self, "colorForElement:", 1);
}

- (UIColor)groupedBackgroundColor
{
  return (UIColor *)-[IMThemePage colorForElement:](self, "colorForElement:", 2);
}

- (UIColor)secondaryGroupedBackgroundColor
{
  return (UIColor *)-[IMThemePage colorForElement:](self, "colorForElement:", 3);
}

- (UIColor)backPageTintColor
{
  return (UIColor *)-[IMThemePage colorForElement:](self, "colorForElement:", 4);
}

- (UIColor)primaryTextColor
{
  return (UIColor *)-[IMThemePage colorForElement:](self, "colorForElement:", 5);
}

- (UIColor)secondaryTextColor
{
  return (UIColor *)-[IMThemePage colorForElement:](self, "colorForElement:", 6);
}

- (UIColor)tertiaryTextColor
{
  return (UIColor *)-[IMThemePage colorForElement:](self, "colorForElement:", 7);
}

- (UIColor)quarternaryTextColor
{
  return (UIColor *)-[IMThemePage colorForElement:](self, "colorForElement:", 8);
}

- (UIColor)separatorColor
{
  return (UIColor *)-[IMThemePage colorForElement:](self, "colorForElement:", 9);
}

- (UIColor)chevronColor
{
  return (UIColor *)-[IMThemePage colorForElement:](self, "colorForElement:", 10);
}

- (UIColor)switchColor
{
  return (UIColor *)-[IMThemePage colorForElement:](self, "colorForElement:", 11);
}

- (id)linkColor
{
  return -[IMThemePage colorForElement:](self, "colorForElement:", 12);
}

- (id)keyColor
{
  return -[IMThemePage colorForElement:](self, "colorForElement:", 13);
}

- (UIColor)HUDBackgroundColor
{
  return (UIColor *)-[IMThemePage colorForElement:](self, "colorForElement:", 14);
}

- (UIColor)HUDTextColor
{
  return (UIColor *)-[IMThemePage colorForElement:](self, "colorForElement:", 15);
}

- (UIColor)buttonColor
{
  return (UIColor *)-[IMThemePage colorForElement:](self, "colorForElement:", 16);
}

- (UIColor)buttonFillColor
{
  return (UIColor *)-[IMThemePage colorForElement:](self, "colorForElement:", 17);
}

- (int64_t)epubTheme
{
  return -1;
}

- (NSDictionary)backgroundsByLevel
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[2];
  _QWORD v25[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", -[IMThemePage userInterfaceStyle](self, "userInterfaceStyle")));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollectionByModifyingTraits:", &stru_28E3F0));
  v5 = v4;
  if ((char *)-[IMThemePage userInterfaceStyle](self, "userInterfaceStyle") == (char *)&dword_0 + 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollectionByModifyingTraits:", &stru_28E410));

  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_65268;
  v22 = sub_65278;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_65268;
  v16 = sub_65278;
  v17 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_665BC;
  v11[3] = &unk_28B700;
  v11[4] = self;
  v11[5] = &v18;
  -[IMThemePage _colorsInTraitCollectionContext:block:](self, "_colorsInTraitCollectionContext:block:", v4, v11);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_6665C;
  v10[3] = &unk_28B700;
  v10[4] = self;
  v10[5] = &v12;
  -[IMThemePage _colorsInTraitCollectionContext:block:](self, "_colorsInTraitCollectionContext:block:", v5, v10);
  v6 = v19[5];
  v24[0] = &off_2A9500;
  v24[1] = &off_2A9518;
  v7 = v13[5];
  v25[0] = v6;
  v25[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return (NSDictionary *)v8;
}

- (UIColor)searchBackgroundColor
{
  return self->_searchBackgroundColor;
}

- (void)set_traitCollection:(id)a3
{
  objc_storeStrong((id *)&self->__traitCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__traitCollection, 0);
  objc_storeStrong((id *)&self->_searchBackgroundColor, 0);
}

@end
