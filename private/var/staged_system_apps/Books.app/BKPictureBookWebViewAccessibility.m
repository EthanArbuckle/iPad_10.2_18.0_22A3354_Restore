@implementation BKPictureBookWebViewAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKPictureBookWebView");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (BKPictureBookWebViewAccessibility)initWithFrame:(CGRect)a3
{
  BKPictureBookWebViewAccessibility *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BKPictureBookWebViewAccessibility;
  v3 = -[BKPictureBookWebViewAccessibility initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookWebViewAccessibility imaxValueForKey:](v3, "imaxValueForKey:", CFSTR("_internal")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imaxValueForKey:", CFSTR("browserView")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookWebViewAccessibility imaxValueForKey:](v3, "imaxValueForKey:", CFSTR("_internal")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imaxValueForKey:", CFSTR("scroller")));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001133A4;
  v11[3] = &unk_1008E7338;
  v12 = v5;
  v13 = v7;
  v8 = v7;
  v9 = v5;
  sub_100099F24(v11);

  return v3;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  int64_t v13;
  char *v14;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[9];
  _QWORD v22[9];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  LOBYTE(v23) = 0;
  v5 = objc_opt_class(UIViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookWebViewAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("bkWebViewDelegate")));
  v7 = __IMAccessibilityCastAsClass(v5, v6, 1, &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if ((_BYTE)v23)
    abort();
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parentViewController"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewIfLoaded"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));

    v12 = (char *)objc_msgSend(v9, "safeIntegerForKey:", CFSTR("pageOffset"));
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = sub_10004E3D0;
    v27 = sub_10004E268;
    v28 = 0;
    v13 = a3 - 1;
    v14 = v12 + 1;
    switch(v13)
    {
      case 0:
      case 5:
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1001136A0;
        v21[3] = &unk_1008EB1C0;
        v15 = v21;
        v21[7] = &v23;
        v21[4] = self;
        v21[5] = v11;
        v21[6] = v9;
        v21[8] = v14;
        if (__IMAccessibilityPerformSafeBlock(v21, v16))
          abort();
        goto LABEL_8;
      case 1:
      case 4:
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_10011364C;
        v22[3] = &unk_1008EB1C0;
        v15 = v22;
        v22[7] = &v23;
        v22[4] = self;
        v22[5] = v11;
        v22[6] = v9;
        v22[8] = v14;
        if (__IMAccessibilityPerformSafeBlock(v22, v18))
          abort();
LABEL_8:

        break;
      default:
        break;
    }
    v19 = (void *)v24[5];
    v17 = v19 != 0;
    if (v19)
      UIAccessibilityPostNotification(UIAccessibilityPageScrolledNotification, v19);
    _Block_object_dispose(&v23, 8);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_imaxPageStatus:(BOOL)a3 window:(id)a4
{
  int v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  int v14;
  void *v15;
  char *v16;
  void *v17;
  char *v18;
  void *v19;
  id v20;
  BOOL v21;
  uint64_t v22;
  char *v23;
  __CFString *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  __CFString *v29;
  id v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v4 = a3;
  v5 = a4;
  v6 = sub_100099FA8(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imaxValueForKey:", CFSTR("paginationController")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "imaxValueForKey:", CFSTR("_chapterInfo")));
  v9 = (char *)sub_10009A0C0(v5);
  v34 = v8;
  if (objc_msgSend(v8, "count"))
  {
    v10 = 0;
    while (1)
    {
      v43 = 0;
      v44 = &v43;
      v45 = 0x3010000000;
      v46 = (uint64_t (*)(uint64_t, uint64_t))&unk_1007DCE8E;
      v47 = 0;
      v48 = 0;
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_100113ACC;
      v39[3] = &unk_1008EB1E8;
      v41 = &v43;
      v40 = v35;
      v42 = v10;
      if (__IMAccessibilityPerformSafeBlock(v39, v11))
        abort();

      v12 = (char *)v44[4];
      v13 = v44[5];
      _Block_object_dispose(&v43, 8);
      if (v9 >= v12 && v9 < &v12[v13])
        break;
      if (++v10 >= (unint64_t)objc_msgSend(v34, "count"))
      {
        v12 = 0;
        v13 = 0;
        break;
      }
    }
    if (!v4)
      goto LABEL_13;
  }
  else
  {
    v12 = 0;
    v13 = 0;
    if (!v4)
    {
LABEL_13:
      v14 = (v12 == v9) & ~v4;
      goto LABEL_14;
    }
  }
  if (&v12[v13] != v9 + 1)
    goto LABEL_13;
  v14 = 1;
LABEL_14:
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imaxValueForKey:", CFSTR("pageCountIncludingUpsell")));
  v16 = (char *)objc_msgSend(v15, "unsignedIntegerValue");

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windowScene"));
  v18 = (char *)objc_msgSend(v17, "interfaceOrientation");

  if ((unint64_t)(v18 - 3) <= 1
    && (v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice")),
        v20 = objc_msgSend(v19, "userInterfaceIdiom"),
        v19,
        v20 == (id)1))
  {
    v21 = v4 == 0;
    v22 = 2;
  }
  else
  {
    v21 = v4 == 0;
    v22 = 1;
  }
  if (v21)
    v22 = -v22;
  v23 = &v9[v22];
  if (v23 >= v16)
  {
    v29 = CFSTR(" ");
  }
  else
  {
    if (v14)
    {
      if (v4)
        v24 = CFSTR("chapter.change.next");
      else
        v24 = CFSTR("chapter.change.previous");
      v25 = sub_10009A13C(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v43 = 0;
      v44 = &v43;
      v45 = 0x3032000000;
      v46 = sub_10004E3D0;
      v47 = sub_10004E268;
      v48 = 0;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100113B00;
      v36[3] = &unk_1008E76D0;
      v27 = v26;
      v37 = v27;
      v38 = &v43;
      if (__IMAccessibilityPerformSafeBlock(v36, v28))
        abort();

      v29 = (__CFString *)(id)v44[5];
      _Block_object_dispose(&v43, 8);

    }
    else
    {
      v30 = sub_10009A13C(CFSTR("page.num.of %@ %@"));
      v27 = (id)objc_claimAutoreleasedReturnValue(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v23));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v16));
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v31, v32));

    }
  }

  return v29;
}

@end
