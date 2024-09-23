@implementation BKThumbnailDirectoryCellAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKThumbnailDirectoryCell");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)BKThumbnailDirectoryCellAccessibility;
  v3 = -[BKThumbnailDirectoryCellAccessibility accessibilityLabel](&v18, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailDirectoryCellAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("pageView")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imaxValueForKey:", CFSTR("pageNumber")));
  v7 = objc_msgSend(v6, "intValue");

  if ((int)v7 >= 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Page %d"), &stru_10091C438, 0));

    v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v7));
    v4 = (void *)v10;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailDirectoryCellAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("hasRibbon")));
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12)
  {
    v13 = sub_10009A13C(CFSTR("has.bookmark"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v14 = __IMAccessibilityStringForVariables(v4);
    v15 = objc_claimAutoreleasedReturnValue(v14);

    v4 = (void *)v15;
  }

  return v4;
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _QWORD v32[10];
  uint64_t v33;
  double *v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  CGRect v40;
  CGRect result;
  CGRect v42;

  v39.receiver = self;
  v39.super_class = (Class)BKThumbnailDirectoryCellAccessibility;
  -[BKThumbnailDirectoryCellAccessibility accessibilityFrame](&v39, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  LOBYTE(v33) = 0;
  v11 = objc_opt_class(UIView);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailDirectoryCellAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("contentView")));
  v13 = __IMAccessibilityCastAsClass(v11, v12, 1, &v33);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if ((_BYTE)v33)
    abort();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v33 = 0;
  v34 = (double *)&v33;
  v35 = 0x4010000000;
  v36 = &unk_1007DCE8E;
  v37 = 0u;
  v38 = 0u;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000F0384;
  v32[3] = &unk_1008EAAC0;
  v32[4] = self;
  v32[5] = &v33;
  v32[6] = v16;
  v32[7] = v18;
  v32[8] = v20;
  v32[9] = v22;
  if (__IMAccessibilityPerformSafeBlock(v32, v23))
    abort();
  v24 = v34[4];
  v25 = v34[5];
  v27 = v34[6];
  v26 = v34[7];
  _Block_object_dispose(&v33, 8);
  v42.origin.x = CGRectZero.origin.x;
  v42.origin.y = CGRectZero.origin.y;
  v42.size.width = CGRectZero.size.width;
  v42.size.height = CGRectZero.size.height;
  v40.origin.x = v24;
  v40.origin.y = v25;
  v40.size.width = v27;
  v40.size.height = v26;
  if (CGRectEqualToRect(v40, v42))
  {
    v26 = v10;
    v27 = v8;
  }
  else
  {
    v4 = v4 + v24;
    v6 = v6 + v25;
  }
  v28 = v4;
  v29 = v6;
  v30 = v27;
  v31 = v26;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

@end
