@implementation BKSpreadThumbnailDirectoryCellAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKSpreadThumbnailDirectoryCell");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v15;
  id v16;
  void *v17;
  NSString *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSpreadThumbnailDirectoryCellAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("spreadView")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imaxValueForKey:", CFSTR("leftPageView")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imaxValueForKey:", CFSTR("rightPageView")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imaxValueForKey:", CFSTR("pageNumber")));
  v7 = objc_msgSend(v6, "integerValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imaxValueForKey:", CFSTR("pageNumber")));
  v9 = objc_msgSend(v8, "integerValue");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedNumber:](NSNumberFormatter, "imaxLocalizedNumber:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v9));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedNumber:](NSNumberFormatter, "imaxLocalizedNumber:", v12));

  v15 = v7 == (id)0x7FFFFFFFFFFFFFFFLL || v4 == 0;
  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL || !v5)
  {
    if (v15)
    {
      v19 = 0;
      goto LABEL_18;
    }
    v20 = sub_10009A13C(CFSTR("page.num %@"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v11);
LABEL_14:
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    if (v19)
      goto LABEL_16;
    goto LABEL_15;
  }
  if (v15)
  {
    v16 = sub_10009A13C(CFSTR("page.num %@"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v13);
    goto LABEL_14;
  }
LABEL_15:
  v21 = sub_10009A13C(CFSTR("spread.page %@ %@"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v11, v13));

LABEL_16:
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKSpreadThumbnailDirectoryCellAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("hasRibbon")));
  v24 = objc_msgSend(v23, "BOOLValue");

  if (v24)
  {
    v25 = sub_10009A13C(CFSTR("has.bookmark"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v26 = __IMAccessibilityStringForVariables(v19);
    v27 = objc_claimAutoreleasedReturnValue(v26);

    v19 = (void *)v27;
  }
LABEL_18:

  return v19;
}

@end
