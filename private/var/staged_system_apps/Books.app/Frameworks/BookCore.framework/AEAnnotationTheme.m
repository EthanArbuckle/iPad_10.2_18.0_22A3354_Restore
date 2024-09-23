@implementation AEAnnotationTheme

+ (id)themeDescriptions
{
  if (qword_30DD18 != -1)
    dispatch_once(&qword_30DD18, &stru_290F78);
  return (id)qword_30DD20;
}

+ (id)themeItemForAnnotationStyle:(int)a3 propertyName:(id)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = 0;
  if (v6 && a3 <= 6)
  {
    v8 = off_2910B8[a3];
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "themeDescriptions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("themes")));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v8));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v6));

  }
  return v7;
}

+ (id)objectForThemeItem:(id)a3 pageTheme:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = v5;
  if ((unint64_t)a4 > 0x10)
    v7 = 0;
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", off_2910F0[a4]));
  if (a4 != 4 && !v7)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("default")));

  return v7;
}

+ (id)colorForThemeItem:(id)a3 pageTheme:(int64_t)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForThemeItem:pageTheme:", a3, a4));
  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_colorWithSRGBDescription:](UIColor, "bc_colorWithSRGBDescription:", v4));
  else
    v5 = 0;

  return v5;
}

+ (id)objectForAnnotationStyle:(int)a3 propertyName:(id)a4 pageTheme:(int64_t)a5
{
  void *v7;
  void *v8;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "themeItemForAnnotationStyle:propertyName:", *(_QWORD *)&a3, a4));
  if (v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForThemeItem:pageTheme:", v7, a5));
  else
    v8 = 0;

  return v8;
}

+ (id)colorForAnnotationStyle:(int)a3 propertyName:(id)a4 pageTheme:(int64_t)a5
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForAnnotationStyle:propertyName:pageTheme:", *(_QWORD *)&a3, a4, a5));
  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_colorWithSRGBDescription:](UIColor, "bc_colorWithSRGBDescription:", v5));
  else
    v6 = 0;

  return v6;
}

- (UIColor)noteFillColor
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t vars0;

  BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationTheme.m", 532, (uint64_t)"-[AEAnnotationTheme noteFillColor]", (uint64_t)"NO", CFSTR("Abstract method noteFillColor: was called!"), v2, v3, v4, vars0);
  return +[UIColor blackColor](UIColor, "blackColor");
}

- (UIColor)noteBorderColor
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t vars0;

  BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationTheme.m", 533, (uint64_t)"-[AEAnnotationTheme noteBorderColor]", (uint64_t)"NO", CFSTR("Abstract method noteBorderColor: was called!"), v2, v3, v4, vars0);
  return +[UIColor blackColor](UIColor, "blackColor");
}

- (UIColor)noteTextColor
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t vars0;

  BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationTheme.m", 534, (uint64_t)"-[AEAnnotationTheme noteTextColor]", (uint64_t)"NO", CFSTR("Abstract method noteTextColor: was called!"), v2, v3, v4, vars0);
  return +[UIColor blackColor](UIColor, "blackColor");
}

- (UIColor)highlightColor
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t vars0;

  BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationTheme.m", 535, (uint64_t)"-[AEAnnotationTheme highlightColor]", (uint64_t)"NO", CFSTR("Abstract method highlightColor: was called!"), v2, v3, v4, vars0);
  return +[UIColor blackColor](UIColor, "blackColor");
}

- (UIColor)noteMarkerFillColor
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t vars0;

  BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationTheme.m", 536, (uint64_t)"-[AEAnnotationTheme noteMarkerFillColor]", (uint64_t)"NO", CFSTR("Abstract method noteMarkerFillColor: was called!"), v2, v3, v4, vars0);
  return +[UIColor blackColor](UIColor, "blackColor");
}

- (UIColor)noteMarkerBorderColor
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t vars0;

  BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationTheme.m", 537, (uint64_t)"-[AEAnnotationTheme noteMarkerBorderColor]", (uint64_t)"NO", CFSTR("Abstract method noteMarkerBorderColor: was called!"), v2, v3, v4, vars0);
  return +[UIColor blackColor](UIColor, "blackColor");
}

- (UIColor)notesSidebarBarColor
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t vars0;

  BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationTheme.m", 538, (uint64_t)"-[AEAnnotationTheme notesSidebarBarColor]", (uint64_t)"NO", CFSTR("Abstract method notesSidebarBarColor: was called!"), v2, v3, v4, vars0);
  return +[UIColor blackColor](UIColor, "blackColor");
}

- (UIColor)noteMarkerStrikethroughColor
{
  if (qword_310A28 != -1)
    dispatch_once(&qword_310A28, &stru_290F98);
  return (UIColor *)(id)qword_310A30;
}

- (UIColor)notesSidebarTextColor
{
  if (qword_310A38 != -1)
    dispatch_once(&qword_310A38, &stru_290FB8);
  return (UIColor *)(id)qword_310A40;
}

+ (id)greenTheme:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD block[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t v26;

  v25 = v3;
  v26 = v4;
  switch(a3)
  {
    case 0:
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_F9A90;
      v24[3] = &unk_28B8C8;
      v24[4] = 0;
      if (qword_310A48 != -1)
        dispatch_once(&qword_310A48, v24);
      v5 = &qword_310A50;
      goto LABEL_55;
    case 1:
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_F9AD0;
      v23[3] = &unk_28B8C8;
      v23[4] = 1;
      if (qword_310A58 != -1)
        dispatch_once(&qword_310A58, v23);
      v5 = &qword_310A60;
      goto LABEL_55;
    case 2:
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_F9B10;
      v22[3] = &unk_28B8C8;
      v22[4] = 2;
      if (qword_310A68 != -1)
        dispatch_once(&qword_310A68, v22);
      v5 = &qword_310A70;
      goto LABEL_55;
    case 3:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_F9B50;
      v21[3] = &unk_28B8C8;
      v21[4] = 3;
      if (qword_310A78 != -1)
        dispatch_once(&qword_310A78, v21);
      v5 = &qword_310A80;
      goto LABEL_55;
    case 4:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_F9B90;
      v20[3] = &unk_28B8C8;
      v20[4] = 4;
      if (qword_310A88 != -1)
        dispatch_once(&qword_310A88, v20);
      v5 = &qword_310A90;
      goto LABEL_55;
    case 5:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_F9BD0;
      v19[3] = &unk_28B8C8;
      v19[4] = 5;
      if (qword_310A98 != -1)
        dispatch_once(&qword_310A98, v19);
      v5 = &qword_310AA0;
      goto LABEL_55;
    case 6:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_F9C10;
      block[3] = &unk_28B8C8;
      block[4] = 6;
      if (qword_310AA8 != -1)
        dispatch_once(&qword_310AA8, block);
      v5 = &qword_310AB0;
      goto LABEL_55;
    case 7:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_F9C50;
      v17[3] = &unk_28B8C8;
      v17[4] = 7;
      if (qword_310AB8 != -1)
        dispatch_once(&qword_310AB8, v17);
      v5 = &qword_310AC0;
      goto LABEL_55;
    case 8:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_F9C90;
      v16[3] = &unk_28B8C8;
      v16[4] = 8;
      if (qword_310AC8 != -1)
        dispatch_once(&qword_310AC8, v16);
      v5 = &qword_310AD0;
      goto LABEL_55;
    case 9:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_F9CD0;
      v15[3] = &unk_28B8C8;
      v15[4] = 9;
      if (qword_310AD8 != -1)
        dispatch_once(&qword_310AD8, v15);
      v5 = &qword_310AE0;
      goto LABEL_55;
    case 10:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F9D10;
      v14[3] = &unk_28B8C8;
      v14[4] = 10;
      if (qword_310AE8 != -1)
        dispatch_once(&qword_310AE8, v14);
      v5 = &qword_310AF0;
      goto LABEL_55;
    case 11:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_F9D50;
      v13[3] = &unk_28B8C8;
      v13[4] = 11;
      if (qword_310AF8 != -1)
        dispatch_once(&qword_310AF8, v13);
      v5 = &qword_310B00;
      goto LABEL_55;
    case 12:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F9D90;
      v12[3] = &unk_28B8C8;
      v12[4] = 12;
      if (qword_310B08 != -1)
        dispatch_once(&qword_310B08, v12);
      v5 = &qword_310B10;
      goto LABEL_55;
    case 13:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_F9DD0;
      v11[3] = &unk_28B8C8;
      v11[4] = 13;
      if (qword_310B18 != -1)
        dispatch_once(&qword_310B18, v11);
      v5 = &qword_310B20;
      goto LABEL_55;
    case 14:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_F9E10;
      v10[3] = &unk_28B8C8;
      v10[4] = 14;
      if (qword_310B28 != -1)
        dispatch_once(&qword_310B28, v10);
      v5 = &qword_310B30;
      goto LABEL_55;
    case 15:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_F9E50;
      v9[3] = &unk_28B8C8;
      v9[4] = 15;
      if (qword_310B38 != -1)
        dispatch_once(&qword_310B38, v9);
      v5 = &qword_310B40;
      goto LABEL_55;
    case 16:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_F9E90;
      v8[3] = &unk_28B8C8;
      v8[4] = 16;
      if (qword_310B48 != -1)
        dispatch_once(&qword_310B48, v8);
      v5 = &qword_310B50;
LABEL_55:
      v6 = (id)*v5;
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)blueTheme:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD block[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t v26;

  v25 = v3;
  v26 = v4;
  switch(a3)
  {
    case 0:
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_FA600;
      v24[3] = &unk_28B8C8;
      v24[4] = 0;
      if (qword_310B58 != -1)
        dispatch_once(&qword_310B58, v24);
      v5 = &qword_310B60;
      goto LABEL_55;
    case 1:
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_FA640;
      v23[3] = &unk_28B8C8;
      v23[4] = 1;
      if (qword_310B68 != -1)
        dispatch_once(&qword_310B68, v23);
      v5 = &qword_310B70;
      goto LABEL_55;
    case 2:
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_FA680;
      v22[3] = &unk_28B8C8;
      v22[4] = 2;
      if (qword_310B78 != -1)
        dispatch_once(&qword_310B78, v22);
      v5 = &qword_310B80;
      goto LABEL_55;
    case 3:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_FA6C0;
      v21[3] = &unk_28B8C8;
      v21[4] = 3;
      if (qword_310B88 != -1)
        dispatch_once(&qword_310B88, v21);
      v5 = &qword_310B90;
      goto LABEL_55;
    case 4:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_FA700;
      v20[3] = &unk_28B8C8;
      v20[4] = 4;
      if (qword_310B98 != -1)
        dispatch_once(&qword_310B98, v20);
      v5 = &qword_310BA0;
      goto LABEL_55;
    case 5:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_FA740;
      v19[3] = &unk_28B8C8;
      v19[4] = 5;
      if (qword_310BA8 != -1)
        dispatch_once(&qword_310BA8, v19);
      v5 = &qword_310BB0;
      goto LABEL_55;
    case 6:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_FA780;
      block[3] = &unk_28B8C8;
      block[4] = 6;
      if (qword_310BB8 != -1)
        dispatch_once(&qword_310BB8, block);
      v5 = &qword_310BC0;
      goto LABEL_55;
    case 7:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_FA7C0;
      v17[3] = &unk_28B8C8;
      v17[4] = 7;
      if (qword_310BC8 != -1)
        dispatch_once(&qword_310BC8, v17);
      v5 = &qword_310BD0;
      goto LABEL_55;
    case 8:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_FA800;
      v16[3] = &unk_28B8C8;
      v16[4] = 8;
      if (qword_310BD8 != -1)
        dispatch_once(&qword_310BD8, v16);
      v5 = &qword_310BE0;
      goto LABEL_55;
    case 9:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_FA840;
      v15[3] = &unk_28B8C8;
      v15[4] = 9;
      if (qword_310BE8 != -1)
        dispatch_once(&qword_310BE8, v15);
      v5 = &qword_310BF0;
      goto LABEL_55;
    case 10:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_FA880;
      v14[3] = &unk_28B8C8;
      v14[4] = 10;
      if (qword_310BF8 != -1)
        dispatch_once(&qword_310BF8, v14);
      v5 = &qword_310C00;
      goto LABEL_55;
    case 11:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_FA8C0;
      v13[3] = &unk_28B8C8;
      v13[4] = 11;
      if (qword_310C08 != -1)
        dispatch_once(&qword_310C08, v13);
      v5 = &qword_310C10;
      goto LABEL_55;
    case 12:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_FA900;
      v12[3] = &unk_28B8C8;
      v12[4] = 12;
      if (qword_310C18 != -1)
        dispatch_once(&qword_310C18, v12);
      v5 = &qword_310C20;
      goto LABEL_55;
    case 13:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_FA940;
      v11[3] = &unk_28B8C8;
      v11[4] = 13;
      if (qword_310C28 != -1)
        dispatch_once(&qword_310C28, v11);
      v5 = &qword_310C30;
      goto LABEL_55;
    case 14:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_FA980;
      v10[3] = &unk_28B8C8;
      v10[4] = 14;
      if (qword_310C38 != -1)
        dispatch_once(&qword_310C38, v10);
      v5 = &qword_310C40;
      goto LABEL_55;
    case 15:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_FA9C0;
      v9[3] = &unk_28B8C8;
      v9[4] = 15;
      if (qword_310C48 != -1)
        dispatch_once(&qword_310C48, v9);
      v5 = &qword_310C50;
      goto LABEL_55;
    case 16:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_FAA00;
      v8[3] = &unk_28B8C8;
      v8[4] = 16;
      if (qword_310C58 != -1)
        dispatch_once(&qword_310C58, v8);
      v5 = &qword_310C60;
LABEL_55:
      v6 = (id)*v5;
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)yellowTheme:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD block[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t v26;

  v25 = v3;
  v26 = v4;
  switch(a3)
  {
    case 0:
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_FB170;
      v24[3] = &unk_28B8C8;
      v24[4] = 0;
      if (qword_310C68 != -1)
        dispatch_once(&qword_310C68, v24);
      v5 = &qword_310C70;
      goto LABEL_55;
    case 1:
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_FB1B0;
      v23[3] = &unk_28B8C8;
      v23[4] = 1;
      if (qword_310C78 != -1)
        dispatch_once(&qword_310C78, v23);
      v5 = &qword_310C80;
      goto LABEL_55;
    case 2:
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_FB1F0;
      v22[3] = &unk_28B8C8;
      v22[4] = 2;
      if (qword_310C88 != -1)
        dispatch_once(&qword_310C88, v22);
      v5 = &qword_310C90;
      goto LABEL_55;
    case 3:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_FB230;
      v21[3] = &unk_28B8C8;
      v21[4] = 3;
      if (qword_310C98 != -1)
        dispatch_once(&qword_310C98, v21);
      v5 = &qword_310CA0;
      goto LABEL_55;
    case 4:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_FB270;
      v20[3] = &unk_28B8C8;
      v20[4] = 4;
      if (qword_310CA8 != -1)
        dispatch_once(&qword_310CA8, v20);
      v5 = &qword_310CB0;
      goto LABEL_55;
    case 5:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_FB2B0;
      v19[3] = &unk_28B8C8;
      v19[4] = 5;
      if (qword_310CB8 != -1)
        dispatch_once(&qword_310CB8, v19);
      v5 = &qword_310CC0;
      goto LABEL_55;
    case 6:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_FB2F0;
      block[3] = &unk_28B8C8;
      block[4] = 6;
      if (qword_310CC8 != -1)
        dispatch_once(&qword_310CC8, block);
      v5 = &qword_310CD0;
      goto LABEL_55;
    case 7:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_FB330;
      v17[3] = &unk_28B8C8;
      v17[4] = 7;
      if (qword_310CD8 != -1)
        dispatch_once(&qword_310CD8, v17);
      v5 = &qword_310CE0;
      goto LABEL_55;
    case 8:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_FB370;
      v16[3] = &unk_28B8C8;
      v16[4] = 8;
      if (qword_310CE8 != -1)
        dispatch_once(&qword_310CE8, v16);
      v5 = &qword_310CF0;
      goto LABEL_55;
    case 9:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_FB3B0;
      v15[3] = &unk_28B8C8;
      v15[4] = 9;
      if (qword_310CF8 != -1)
        dispatch_once(&qword_310CF8, v15);
      v5 = &qword_310D00;
      goto LABEL_55;
    case 10:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_FB3F0;
      v14[3] = &unk_28B8C8;
      v14[4] = 10;
      if (qword_310D08 != -1)
        dispatch_once(&qword_310D08, v14);
      v5 = &qword_310D10;
      goto LABEL_55;
    case 11:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_FB430;
      v13[3] = &unk_28B8C8;
      v13[4] = 11;
      if (qword_310D18 != -1)
        dispatch_once(&qword_310D18, v13);
      v5 = &qword_310D20;
      goto LABEL_55;
    case 12:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_FB470;
      v12[3] = &unk_28B8C8;
      v12[4] = 12;
      if (qword_310D28 != -1)
        dispatch_once(&qword_310D28, v12);
      v5 = &qword_310D30;
      goto LABEL_55;
    case 13:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_FB4B0;
      v11[3] = &unk_28B8C8;
      v11[4] = 13;
      if (qword_310D38 != -1)
        dispatch_once(&qword_310D38, v11);
      v5 = &qword_310D40;
      goto LABEL_55;
    case 14:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_FB4F0;
      v10[3] = &unk_28B8C8;
      v10[4] = 14;
      if (qword_310D48 != -1)
        dispatch_once(&qword_310D48, v10);
      v5 = &qword_310D50;
      goto LABEL_55;
    case 15:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_FB530;
      v9[3] = &unk_28B8C8;
      v9[4] = 15;
      if (qword_310D58 != -1)
        dispatch_once(&qword_310D58, v9);
      v5 = &qword_310D60;
      goto LABEL_55;
    case 16:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_FB570;
      v8[3] = &unk_28B8C8;
      v8[4] = 16;
      if (qword_310D68 != -1)
        dispatch_once(&qword_310D68, v8);
      v5 = &qword_310D70;
LABEL_55:
      v6 = (id)*v5;
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)pinkTheme:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD block[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t v26;

  v25 = v3;
  v26 = v4;
  switch(a3)
  {
    case 0:
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_FBCE0;
      v24[3] = &unk_28B8C8;
      v24[4] = 0;
      if (qword_310D78 != -1)
        dispatch_once(&qword_310D78, v24);
      v5 = &qword_310D80;
      goto LABEL_55;
    case 1:
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_FBD20;
      v23[3] = &unk_28B8C8;
      v23[4] = 1;
      if (qword_310D88 != -1)
        dispatch_once(&qword_310D88, v23);
      v5 = &qword_310D90;
      goto LABEL_55;
    case 2:
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_FBD60;
      v22[3] = &unk_28B8C8;
      v22[4] = 2;
      if (qword_310D98 != -1)
        dispatch_once(&qword_310D98, v22);
      v5 = &qword_310DA0;
      goto LABEL_55;
    case 3:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_FBDA0;
      v21[3] = &unk_28B8C8;
      v21[4] = 3;
      if (qword_310DA8 != -1)
        dispatch_once(&qword_310DA8, v21);
      v5 = &qword_310DB0;
      goto LABEL_55;
    case 4:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_FBDE0;
      v20[3] = &unk_28B8C8;
      v20[4] = 4;
      if (qword_310DB8 != -1)
        dispatch_once(&qword_310DB8, v20);
      v5 = &qword_310DC0;
      goto LABEL_55;
    case 5:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_FBE20;
      v19[3] = &unk_28B8C8;
      v19[4] = 5;
      if (qword_310DC8 != -1)
        dispatch_once(&qword_310DC8, v19);
      v5 = &qword_310DD0;
      goto LABEL_55;
    case 6:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_FBE60;
      block[3] = &unk_28B8C8;
      block[4] = 6;
      if (qword_310DD8 != -1)
        dispatch_once(&qword_310DD8, block);
      v5 = &qword_310DE0;
      goto LABEL_55;
    case 7:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_FBEA0;
      v17[3] = &unk_28B8C8;
      v17[4] = 7;
      if (qword_310DE8 != -1)
        dispatch_once(&qword_310DE8, v17);
      v5 = &qword_310DF0;
      goto LABEL_55;
    case 8:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_FBEE0;
      v16[3] = &unk_28B8C8;
      v16[4] = 8;
      if (qword_310DF8 != -1)
        dispatch_once(&qword_310DF8, v16);
      v5 = &qword_310E00;
      goto LABEL_55;
    case 9:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_FBF20;
      v15[3] = &unk_28B8C8;
      v15[4] = 9;
      if (qword_310E08 != -1)
        dispatch_once(&qword_310E08, v15);
      v5 = &qword_310E10;
      goto LABEL_55;
    case 10:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_FBF60;
      v14[3] = &unk_28B8C8;
      v14[4] = 10;
      if (qword_310E18 != -1)
        dispatch_once(&qword_310E18, v14);
      v5 = &qword_310E20;
      goto LABEL_55;
    case 11:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_FBFA0;
      v13[3] = &unk_28B8C8;
      v13[4] = 11;
      if (qword_310E28 != -1)
        dispatch_once(&qword_310E28, v13);
      v5 = &qword_310E30;
      goto LABEL_55;
    case 12:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_FBFE0;
      v12[3] = &unk_28B8C8;
      v12[4] = 12;
      if (qword_310E38 != -1)
        dispatch_once(&qword_310E38, v12);
      v5 = &qword_310E40;
      goto LABEL_55;
    case 13:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_FC020;
      v11[3] = &unk_28B8C8;
      v11[4] = 13;
      if (qword_310E48 != -1)
        dispatch_once(&qword_310E48, v11);
      v5 = &qword_310E50;
      goto LABEL_55;
    case 14:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_FC060;
      v10[3] = &unk_28B8C8;
      v10[4] = 14;
      if (qword_310E58 != -1)
        dispatch_once(&qword_310E58, v10);
      v5 = &qword_310E60;
      goto LABEL_55;
    case 15:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_FC0A0;
      v9[3] = &unk_28B8C8;
      v9[4] = 15;
      if (qword_310E68 != -1)
        dispatch_once(&qword_310E68, v9);
      v5 = &qword_310E70;
      goto LABEL_55;
    case 16:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_FC0E0;
      v8[3] = &unk_28B8C8;
      v8[4] = 16;
      if (qword_310E78 != -1)
        dispatch_once(&qword_310E78, v8);
      v5 = &qword_310E80;
LABEL_55:
      v6 = (id)*v5;
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)purpleTheme:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD block[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t v26;

  v25 = v3;
  v26 = v4;
  switch(a3)
  {
    case 0:
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_FC850;
      v24[3] = &unk_28B8C8;
      v24[4] = 0;
      if (qword_310E88 != -1)
        dispatch_once(&qword_310E88, v24);
      v5 = &qword_310E90;
      goto LABEL_55;
    case 1:
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_FC890;
      v23[3] = &unk_28B8C8;
      v23[4] = 1;
      if (qword_310E98 != -1)
        dispatch_once(&qword_310E98, v23);
      v5 = &qword_310EA0;
      goto LABEL_55;
    case 2:
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_FC8D0;
      v22[3] = &unk_28B8C8;
      v22[4] = 2;
      if (qword_310EA8 != -1)
        dispatch_once(&qword_310EA8, v22);
      v5 = &qword_310EB0;
      goto LABEL_55;
    case 3:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_FC910;
      v21[3] = &unk_28B8C8;
      v21[4] = 3;
      if (qword_310EB8 != -1)
        dispatch_once(&qword_310EB8, v21);
      v5 = &qword_310EC0;
      goto LABEL_55;
    case 4:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_FC950;
      v20[3] = &unk_28B8C8;
      v20[4] = 4;
      if (qword_310EC8 != -1)
        dispatch_once(&qword_310EC8, v20);
      v5 = &qword_310ED0;
      goto LABEL_55;
    case 5:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_FC990;
      v19[3] = &unk_28B8C8;
      v19[4] = 5;
      if (qword_310ED8 != -1)
        dispatch_once(&qword_310ED8, v19);
      v5 = &qword_310EE0;
      goto LABEL_55;
    case 6:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_FC9D0;
      block[3] = &unk_28B8C8;
      block[4] = 6;
      if (qword_310EE8 != -1)
        dispatch_once(&qword_310EE8, block);
      v5 = &qword_310EF0;
      goto LABEL_55;
    case 7:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_FCA10;
      v17[3] = &unk_28B8C8;
      v17[4] = 7;
      if (qword_310EF8 != -1)
        dispatch_once(&qword_310EF8, v17);
      v5 = &qword_310F00;
      goto LABEL_55;
    case 8:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_FCA50;
      v16[3] = &unk_28B8C8;
      v16[4] = 8;
      if (qword_310F08 != -1)
        dispatch_once(&qword_310F08, v16);
      v5 = &qword_310F10;
      goto LABEL_55;
    case 9:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_FCA90;
      v15[3] = &unk_28B8C8;
      v15[4] = 9;
      if (qword_310F18 != -1)
        dispatch_once(&qword_310F18, v15);
      v5 = &qword_310F20;
      goto LABEL_55;
    case 10:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_FCAD0;
      v14[3] = &unk_28B8C8;
      v14[4] = 10;
      if (qword_310F28 != -1)
        dispatch_once(&qword_310F28, v14);
      v5 = &qword_310F30;
      goto LABEL_55;
    case 11:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_FCB10;
      v13[3] = &unk_28B8C8;
      v13[4] = 11;
      if (qword_310F38 != -1)
        dispatch_once(&qword_310F38, v13);
      v5 = &qword_310F40;
      goto LABEL_55;
    case 12:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_FCB50;
      v12[3] = &unk_28B8C8;
      v12[4] = 12;
      if (qword_310F48 != -1)
        dispatch_once(&qword_310F48, v12);
      v5 = &qword_310F50;
      goto LABEL_55;
    case 13:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_FCB90;
      v11[3] = &unk_28B8C8;
      v11[4] = 13;
      if (qword_310F58 != -1)
        dispatch_once(&qword_310F58, v11);
      v5 = &qword_310F60;
      goto LABEL_55;
    case 14:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_FCBD0;
      v10[3] = &unk_28B8C8;
      v10[4] = 14;
      if (qword_310F68 != -1)
        dispatch_once(&qword_310F68, v10);
      v5 = &qword_310F70;
      goto LABEL_55;
    case 15:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_FCC10;
      v9[3] = &unk_28B8C8;
      v9[4] = 15;
      if (qword_310F78 != -1)
        dispatch_once(&qword_310F78, v9);
      v5 = &qword_310F80;
      goto LABEL_55;
    case 16:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_FCC50;
      v8[3] = &unk_28B8C8;
      v8[4] = 16;
      if (qword_310F88 != -1)
        dispatch_once(&qword_310F88, v8);
      v5 = &qword_310F90;
LABEL_55:
      v6 = (id)*v5;
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)underlineTheme:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD block[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t v26;

  v25 = v3;
  v26 = v4;
  switch(a3)
  {
    case 0:
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_FD3C0;
      v24[3] = &unk_28B8C8;
      v24[4] = 0;
      if (qword_310F98 != -1)
        dispatch_once(&qword_310F98, v24);
      v5 = &qword_310FA0;
      goto LABEL_55;
    case 1:
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_FD400;
      v23[3] = &unk_28B8C8;
      v23[4] = 1;
      if (qword_310FA8 != -1)
        dispatch_once(&qword_310FA8, v23);
      v5 = &qword_310FB0;
      goto LABEL_55;
    case 2:
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_FD440;
      v22[3] = &unk_28B8C8;
      v22[4] = 2;
      if (qword_310FB8 != -1)
        dispatch_once(&qword_310FB8, v22);
      v5 = &qword_310FC0;
      goto LABEL_55;
    case 3:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_FD480;
      v21[3] = &unk_28B8C8;
      v21[4] = 3;
      if (qword_310FC8 != -1)
        dispatch_once(&qword_310FC8, v21);
      v5 = &qword_310FD0;
      goto LABEL_55;
    case 4:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_FD4C0;
      v20[3] = &unk_28B8C8;
      v20[4] = 4;
      if (qword_310FD8 != -1)
        dispatch_once(&qword_310FD8, v20);
      v5 = &qword_310FE0;
      goto LABEL_55;
    case 5:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_FD500;
      v19[3] = &unk_28B8C8;
      v19[4] = 5;
      if (qword_310FE8 != -1)
        dispatch_once(&qword_310FE8, v19);
      v5 = &qword_310FF0;
      goto LABEL_55;
    case 6:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_FD540;
      block[3] = &unk_28B8C8;
      block[4] = 6;
      if (qword_310FF8 != -1)
        dispatch_once(&qword_310FF8, block);
      v5 = &qword_311000;
      goto LABEL_55;
    case 7:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_FD580;
      v17[3] = &unk_28B8C8;
      v17[4] = 7;
      if (qword_311008 != -1)
        dispatch_once(&qword_311008, v17);
      v5 = &qword_311010;
      goto LABEL_55;
    case 8:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_FD5C0;
      v16[3] = &unk_28B8C8;
      v16[4] = 8;
      if (qword_311018 != -1)
        dispatch_once(&qword_311018, v16);
      v5 = &qword_311020;
      goto LABEL_55;
    case 9:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_FD600;
      v15[3] = &unk_28B8C8;
      v15[4] = 9;
      if (qword_311028 != -1)
        dispatch_once(&qword_311028, v15);
      v5 = &qword_311030;
      goto LABEL_55;
    case 10:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_FD640;
      v14[3] = &unk_28B8C8;
      v14[4] = 10;
      if (qword_311038 != -1)
        dispatch_once(&qword_311038, v14);
      v5 = &qword_311040;
      goto LABEL_55;
    case 11:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_FD680;
      v13[3] = &unk_28B8C8;
      v13[4] = 11;
      if (qword_311048 != -1)
        dispatch_once(&qword_311048, v13);
      v5 = &qword_311050;
      goto LABEL_55;
    case 12:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_FD6C0;
      v12[3] = &unk_28B8C8;
      v12[4] = 12;
      if (qword_311058 != -1)
        dispatch_once(&qword_311058, v12);
      v5 = &qword_311060;
      goto LABEL_55;
    case 13:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_FD700;
      v11[3] = &unk_28B8C8;
      v11[4] = 13;
      if (qword_311068 != -1)
        dispatch_once(&qword_311068, v11);
      v5 = &qword_311070;
      goto LABEL_55;
    case 14:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_FD740;
      v10[3] = &unk_28B8C8;
      v10[4] = 14;
      if (qword_311078 != -1)
        dispatch_once(&qword_311078, v10);
      v5 = &qword_311080;
      goto LABEL_55;
    case 15:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_FD780;
      v9[3] = &unk_28B8C8;
      v9[4] = 15;
      if (qword_311088 != -1)
        dispatch_once(&qword_311088, v9);
      v5 = &qword_311090;
      goto LABEL_55;
    case 16:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_FD7C0;
      v8[3] = &unk_28B8C8;
      v8[4] = 16;
      if (qword_311098 != -1)
        dispatch_once(&qword_311098, v8);
      v5 = &qword_3110A0;
LABEL_55:
      v6 = (id)*v5;
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)theme:(int64_t)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setPageTheme:", a3);
  return v4;
}

+ (id)themeForAnnotationStyle:(int)a3 pageTheme:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  switch(a3)
  {
    case 1:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme greenTheme:](AEAnnotationTheme, "greenTheme:", a4, v4, v5));
      break;
    case 2:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme blueTheme:](AEAnnotationTheme, "blueTheme:", a4, v4, v5));
      break;
    case 3:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme yellowTheme:](AEAnnotationTheme, "yellowTheme:", a4, v4, v5));
      break;
    case 4:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme pinkTheme:](AEAnnotationTheme, "pinkTheme:", a4, v4, v5));
      break;
    case 5:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme purpleTheme:](AEAnnotationTheme, "purpleTheme:", a4, v4, v5));
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)themeForAnnotationStyle:(int)a3 pageTheme:(int64_t)a4 isUnderline:(BOOL)a5
{
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "themeForAnnotationStyle:pageTheme:", *(_QWORD *)&a3));
  v8 = v7;
  if (v7 || !a5)
    v9 = v7;
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme underlineTheme:](AEAnnotationTheme, "underlineTheme:", a4));
  v10 = v9;

  return v10;
}

+ (double)highlightOpacityForPageTheme:(int64_t)a3
{
  double result;

  result = 1.0;
  if ((unint64_t)a3 <= 0x10)
    return dbl_26A6B0[a3];
  return result;
}

+ (id)highlightTextColor:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  id v6;
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[6];
  _QWORD v14[6];
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[6];
  _QWORD v18[6];
  _QWORD block[6];
  _QWORD v20[6];
  _QWORD v21[6];
  _QWORD v22[6];
  _QWORD v23[6];
  _QWORD v24[6];
  uint64_t v25;
  uint64_t v26;

  v25 = v3;
  v26 = v4;
  switch(a3)
  {
    case 0:
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_FE13C;
      v23[3] = &unk_290FD8;
      v23[4] = a1;
      v23[5] = 0;
      if (qword_3110B8 != -1)
        dispatch_once(&qword_3110B8, v23);
      v5 = &qword_3110C0;
      goto LABEL_55;
    case 1:
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_FE1DC;
      v22[3] = &unk_290FD8;
      v22[4] = a1;
      v22[5] = 1;
      if (qword_3110C8 != -1)
        dispatch_once(&qword_3110C8, v22);
      v5 = &qword_3110D0;
      goto LABEL_55;
    case 2:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_FE27C;
      v21[3] = &unk_290FD8;
      v21[4] = a1;
      v21[5] = 2;
      if (qword_3110D8 != -1)
        dispatch_once(&qword_3110D8, v21);
      v5 = &qword_3110E0;
      goto LABEL_55;
    case 3:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_FE31C;
      v20[3] = &unk_290FD8;
      v20[4] = a1;
      v20[5] = 3;
      if (qword_3110E8 != -1)
        dispatch_once(&qword_3110E8, v20);
      v5 = &qword_3110F0;
      goto LABEL_55;
    case 4:
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_FE09C;
      v24[3] = &unk_290FD8;
      v24[4] = a1;
      v24[5] = 4;
      if (qword_3110A8 != -1)
        dispatch_once(&qword_3110A8, v24);
      v5 = &qword_3110B0;
      goto LABEL_55;
    case 5:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_FE3BC;
      block[3] = &unk_290FD8;
      block[4] = a1;
      block[5] = 5;
      if (qword_3110F8 != -1)
        dispatch_once(&qword_3110F8, block);
      v5 = &qword_311100;
      goto LABEL_55;
    case 6:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_FE45C;
      v18[3] = &unk_290FD8;
      v18[4] = a1;
      v18[5] = 6;
      if (qword_311108 != -1)
        dispatch_once(&qword_311108, v18);
      v5 = &qword_311110;
      goto LABEL_55;
    case 7:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_FE4FC;
      v17[3] = &unk_290FD8;
      v17[4] = a1;
      v17[5] = 7;
      if (qword_311118 != -1)
        dispatch_once(&qword_311118, v17);
      v5 = &qword_311120;
      goto LABEL_55;
    case 8:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_FE59C;
      v16[3] = &unk_290FD8;
      v16[4] = a1;
      v16[5] = 8;
      if (qword_311128 != -1)
        dispatch_once(&qword_311128, v16);
      v5 = &qword_311130;
      goto LABEL_55;
    case 9:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_FE63C;
      v15[3] = &unk_290FD8;
      v15[4] = a1;
      v15[5] = 9;
      if (qword_311138 != -1)
        dispatch_once(&qword_311138, v15);
      v5 = &qword_311140;
      goto LABEL_55;
    case 10:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_FE6DC;
      v14[3] = &unk_290FD8;
      v14[4] = a1;
      v14[5] = 10;
      if (qword_311148 != -1)
        dispatch_once(&qword_311148, v14);
      v5 = &qword_311150;
      goto LABEL_55;
    case 11:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_FE77C;
      v13[3] = &unk_290FD8;
      v13[4] = a1;
      v13[5] = 11;
      if (qword_311158 != -1)
        dispatch_once(&qword_311158, v13);
      v5 = &qword_311160;
      goto LABEL_55;
    case 12:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_FE81C;
      v12[3] = &unk_290FD8;
      v12[4] = a1;
      v12[5] = 12;
      if (qword_311168 != -1)
        dispatch_once(&qword_311168, v12);
      v5 = &qword_311170;
      goto LABEL_55;
    case 13:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_FE8BC;
      v11[3] = &unk_290FD8;
      v11[4] = a1;
      v11[5] = 13;
      if (qword_311178 != -1)
        dispatch_once(&qword_311178, v11);
      v5 = &qword_311180;
      goto LABEL_55;
    case 14:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_FE95C;
      v10[3] = &unk_290FD8;
      v10[4] = a1;
      v10[5] = 14;
      if (qword_311188 != -1)
        dispatch_once(&qword_311188, v10);
      v5 = &qword_311190;
      goto LABEL_55;
    case 15:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_FE9FC;
      v9[3] = &unk_290FD8;
      v9[4] = a1;
      v9[5] = 15;
      if (qword_311198 != -1)
        dispatch_once(&qword_311198, v9);
      v5 = &qword_3111A0;
      goto LABEL_55;
    case 16:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_FEA9C;
      v8[3] = &unk_290FD8;
      v8[4] = a1;
      v8[5] = 16;
      if (qword_3111A8 != -1)
        dispatch_once(&qword_3111A8, v8);
      v5 = &qword_3111B0;
LABEL_55:
      v6 = (id)*v5;
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

- (UIColor)noteColorPickerFillColor
{
  return +[UIColor blackColor](UIColor, "blackColor");
}

- (UIColor)noteColorPickerBorderColor
{
  return +[UIColor blackColor](UIColor, "blackColor");
}

- (double)noteShadowRadius
{
  if (qword_3111B8 != -1)
    dispatch_once(&qword_3111B8, &stru_290FF8);
  return *(double *)&qword_3111C0;
}

- (double)noteShadowOpacity
{
  if (qword_3111C8 != -1)
    dispatch_once(&qword_3111C8, &stru_291018);
  return *(double *)&qword_3111D0;
}

- (UIColor)noteShadowColor
{
  if (qword_3111D8 != -1)
    dispatch_once(&qword_3111D8, &stru_291038);
  return (UIColor *)(id)qword_3111E0;
}

- (CGSize)noteShadowOffset
{
  double v2;
  double v3;
  CGSize result;

  if (qword_3111E8 != -1)
    dispatch_once(&qword_3111E8, &stru_291058);
  v2 = *(double *)&qword_3111F0;
  v3 = *(double *)&qword_3111F8;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIFont)noteTextFont
{
  if (qword_311200 != -1)
    dispatch_once(&qword_311200, &stru_291078);
  return (UIFont *)(id)qword_311208;
}

- (UIFont)noteTextFontInTable
{
  if (qword_311210 != -1)
    dispatch_once(&qword_311210, &stru_291098);
  return (UIFont *)(id)qword_311218;
}

- (BOOL)isUnderline
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t vars0;

  BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationTheme.m", 852, (uint64_t)"-[AEAnnotationTheme isUnderline]", (uint64_t)"NO", CFSTR("Abstract method isUnderline was called!"), v2, v3, v4, vars0);
  return 0;
}

- (int)annotationStyle
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t vars0;

  BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationTheme.m", 858, (uint64_t)"-[AEAnnotationTheme annotationStyle]", (uint64_t)"NO", CFSTR("Abstract method annotationStyle was called!"), v2, v3, v4, vars0);
  return 1;
}

- (BOOL)noteHasBorder
{
  return (char *)-[AEAnnotationTheme pageTheme](self, "pageTheme") != (char *)&dword_0 + 2
      && (char *)-[AEAnnotationTheme pageTheme](self, "pageTheme") != (char *)&dword_0 + 3;
}

- (BOOL)noteMarkerHasBorder
{
  return -[AEAnnotationTheme noteHasBorder](self, "noteHasBorder");
}

- (int64_t)pageTheme
{
  return self->_pageTheme;
}

- (void)setPageTheme:(int64_t)a3
{
  self->_pageTheme = a3;
}

@end
