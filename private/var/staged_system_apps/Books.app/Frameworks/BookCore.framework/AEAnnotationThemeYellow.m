@implementation AEAnnotationThemeYellow

- (id)noteFillColor
{
  uint64_t *v3;
  id result;
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
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
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD block[6];

  switch(-[AEAnnotationTheme pageTheme](self, "pageTheme"))
  {
    case 0:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_E2C54;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30EC28 != -1)
        dispatch_once(&qword_30EC28, block);
      v3 = &qword_30EC30;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_E2CA8;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30EC38 != -1)
        dispatch_once(&qword_30EC38, v20);
      v3 = &qword_30EC40;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_E2CFC;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30EC48 != -1)
        dispatch_once(&qword_30EC48, v19);
      v3 = &qword_30EC50;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_E2D50;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30EC58 != -1)
        dispatch_once(&qword_30EC58, v18);
      v3 = &qword_30EC60;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_E2DA4;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30EC68 != -1)
        dispatch_once(&qword_30EC68, v17);
      v3 = &qword_30EC70;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_E2DF8;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30EC78 != -1)
        dispatch_once(&qword_30EC78, v16);
      v3 = &qword_30EC80;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_E2E4C;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30EC88 != -1)
        dispatch_once(&qword_30EC88, v15);
      v3 = &qword_30EC90;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_E2EA0;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30EC98 != -1)
        dispatch_once(&qword_30EC98, v14);
      v3 = &qword_30ECA0;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_E2EF4;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30ECA8 != -1)
        dispatch_once(&qword_30ECA8, v13);
      v3 = &qword_30ECB0;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_E2F48;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30ECB8 != -1)
        dispatch_once(&qword_30ECB8, v12);
      v3 = &qword_30ECC0;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_E2F9C;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30ECC8 != -1)
        dispatch_once(&qword_30ECC8, v11);
      v3 = &qword_30ECD0;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_E2FF0;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30ECD8 != -1)
        dispatch_once(&qword_30ECD8, v10);
      v3 = &qword_30ECE0;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_E3044;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30ECE8 != -1)
        dispatch_once(&qword_30ECE8, v9);
      v3 = &qword_30ECF0;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_E3098;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30ECF8 != -1)
        dispatch_once(&qword_30ECF8, v8);
      v3 = &qword_30ED00;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_E30EC;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30ED08 != -1)
        dispatch_once(&qword_30ED08, v7);
      v3 = &qword_30ED10;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_E3140;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30ED18 != -1)
        dispatch_once(&qword_30ED18, v6);
      v3 = &qword_30ED20;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_E3194;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30ED28 != -1)
        dispatch_once(&qword_30ED28, v5);
      v3 = &qword_30ED30;
LABEL_54:
      result = (id)*v3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)noteBorderColor
{
  uint64_t *v3;
  id result;
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
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
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD block[6];

  switch(-[AEAnnotationTheme pageTheme](self, "pageTheme"))
  {
    case 0:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_E392C;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30ED38 != -1)
        dispatch_once(&qword_30ED38, block);
      v3 = &qword_30ED40;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_E3980;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30ED48 != -1)
        dispatch_once(&qword_30ED48, v20);
      v3 = &qword_30ED50;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_E39D4;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30ED58 != -1)
        dispatch_once(&qword_30ED58, v19);
      v3 = &qword_30ED60;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_E3A28;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30ED68 != -1)
        dispatch_once(&qword_30ED68, v18);
      v3 = &qword_30ED70;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_E3A7C;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30ED78 != -1)
        dispatch_once(&qword_30ED78, v17);
      v3 = &qword_30ED80;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_E3AD0;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30ED88 != -1)
        dispatch_once(&qword_30ED88, v16);
      v3 = &qword_30ED90;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_E3B24;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30ED98 != -1)
        dispatch_once(&qword_30ED98, v15);
      v3 = &qword_30EDA0;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_E3B78;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30EDA8 != -1)
        dispatch_once(&qword_30EDA8, v14);
      v3 = &qword_30EDB0;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_E3BCC;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30EDB8 != -1)
        dispatch_once(&qword_30EDB8, v13);
      v3 = &qword_30EDC0;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_E3C20;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30EDC8 != -1)
        dispatch_once(&qword_30EDC8, v12);
      v3 = &qword_30EDD0;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_E3C74;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30EDD8 != -1)
        dispatch_once(&qword_30EDD8, v11);
      v3 = &qword_30EDE0;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_E3CC8;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30EDE8 != -1)
        dispatch_once(&qword_30EDE8, v10);
      v3 = &qword_30EDF0;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_E3D1C;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30EDF8 != -1)
        dispatch_once(&qword_30EDF8, v9);
      v3 = &qword_30EE00;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_E3D70;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30EE08 != -1)
        dispatch_once(&qword_30EE08, v8);
      v3 = &qword_30EE10;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_E3DC4;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30EE18 != -1)
        dispatch_once(&qword_30EE18, v7);
      v3 = &qword_30EE20;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_E3E18;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30EE28 != -1)
        dispatch_once(&qword_30EE28, v6);
      v3 = &qword_30EE30;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_E3E6C;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30EE38 != -1)
        dispatch_once(&qword_30EE38, v5);
      v3 = &qword_30EE40;
LABEL_54:
      result = (id)*v3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)noteTextColor
{
  uint64_t *v3;
  id result;
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
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
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD block[6];

  switch(-[AEAnnotationTheme pageTheme](self, "pageTheme"))
  {
    case 0:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_E4604;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30EE48 != -1)
        dispatch_once(&qword_30EE48, block);
      v3 = &qword_30EE50;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_E4658;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30EE58 != -1)
        dispatch_once(&qword_30EE58, v20);
      v3 = &qword_30EE60;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_E46AC;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30EE68 != -1)
        dispatch_once(&qword_30EE68, v19);
      v3 = &qword_30EE70;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_E4700;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30EE78 != -1)
        dispatch_once(&qword_30EE78, v18);
      v3 = &qword_30EE80;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_E4754;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30EE88 != -1)
        dispatch_once(&qword_30EE88, v17);
      v3 = &qword_30EE90;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_E47A8;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30EE98 != -1)
        dispatch_once(&qword_30EE98, v16);
      v3 = &qword_30EEA0;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_E47FC;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30EEA8 != -1)
        dispatch_once(&qword_30EEA8, v15);
      v3 = &qword_30EEB0;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_E4850;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30EEB8 != -1)
        dispatch_once(&qword_30EEB8, v14);
      v3 = &qword_30EEC0;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_E48A4;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30EEC8 != -1)
        dispatch_once(&qword_30EEC8, v13);
      v3 = &qword_30EED0;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_E48F8;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30EED8 != -1)
        dispatch_once(&qword_30EED8, v12);
      v3 = &qword_30EEE0;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_E494C;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30EEE8 != -1)
        dispatch_once(&qword_30EEE8, v11);
      v3 = &qword_30EEF0;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_E49A0;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30EEF8 != -1)
        dispatch_once(&qword_30EEF8, v10);
      v3 = &qword_30EF00;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_E49F4;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30EF08 != -1)
        dispatch_once(&qword_30EF08, v9);
      v3 = &qword_30EF10;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_E4A48;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30EF18 != -1)
        dispatch_once(&qword_30EF18, v8);
      v3 = &qword_30EF20;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_E4A9C;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30EF28 != -1)
        dispatch_once(&qword_30EF28, v7);
      v3 = &qword_30EF30;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_E4AF0;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30EF38 != -1)
        dispatch_once(&qword_30EF38, v6);
      v3 = &qword_30EF40;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_E4B44;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30EF48 != -1)
        dispatch_once(&qword_30EF48, v5);
      v3 = &qword_30EF50;
LABEL_54:
      result = (id)*v3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)highlightColor
{
  uint64_t *v3;
  id result;
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
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
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD block[6];

  switch(-[AEAnnotationTheme pageTheme](self, "pageTheme"))
  {
    case 0:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_E52DC;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30EF58 != -1)
        dispatch_once(&qword_30EF58, block);
      v3 = &qword_30EF60;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_E5330;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30EF68 != -1)
        dispatch_once(&qword_30EF68, v20);
      v3 = &qword_30EF70;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_E5384;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30EF78 != -1)
        dispatch_once(&qword_30EF78, v19);
      v3 = &qword_30EF80;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_E53D8;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30EF88 != -1)
        dispatch_once(&qword_30EF88, v18);
      v3 = &qword_30EF90;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_E542C;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30EF98 != -1)
        dispatch_once(&qword_30EF98, v17);
      v3 = &qword_30EFA0;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_E5480;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30EFA8 != -1)
        dispatch_once(&qword_30EFA8, v16);
      v3 = &qword_30EFB0;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_E54D4;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30EFB8 != -1)
        dispatch_once(&qword_30EFB8, v15);
      v3 = &qword_30EFC0;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_E5528;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30EFC8 != -1)
        dispatch_once(&qword_30EFC8, v14);
      v3 = &qword_30EFD0;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_E557C;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30EFD8 != -1)
        dispatch_once(&qword_30EFD8, v13);
      v3 = &qword_30EFE0;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_E55D0;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30EFE8 != -1)
        dispatch_once(&qword_30EFE8, v12);
      v3 = &qword_30EFF0;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_E5624;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30EFF8 != -1)
        dispatch_once(&qword_30EFF8, v11);
      v3 = &qword_30F000;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_E5678;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30F008 != -1)
        dispatch_once(&qword_30F008, v10);
      v3 = &qword_30F010;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_E56CC;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30F018 != -1)
        dispatch_once(&qword_30F018, v9);
      v3 = &qword_30F020;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_E5720;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30F028 != -1)
        dispatch_once(&qword_30F028, v8);
      v3 = &qword_30F030;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_E5774;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30F038 != -1)
        dispatch_once(&qword_30F038, v7);
      v3 = &qword_30F040;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_E57C8;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30F048 != -1)
        dispatch_once(&qword_30F048, v6);
      v3 = &qword_30F050;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_E581C;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30F058 != -1)
        dispatch_once(&qword_30F058, v5);
      v3 = &qword_30F060;
LABEL_54:
      result = (id)*v3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)noteMarkerFillColor
{
  uint64_t *v3;
  id result;
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
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
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD block[6];

  switch(-[AEAnnotationTheme pageTheme](self, "pageTheme"))
  {
    case 0:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_E5FB4;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30F068 != -1)
        dispatch_once(&qword_30F068, block);
      v3 = &qword_30F070;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_E6008;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30F078 != -1)
        dispatch_once(&qword_30F078, v20);
      v3 = &qword_30F080;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_E605C;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30F088 != -1)
        dispatch_once(&qword_30F088, v19);
      v3 = &qword_30F090;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_E60B0;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30F098 != -1)
        dispatch_once(&qword_30F098, v18);
      v3 = &qword_30F0A0;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_E6104;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30F0A8 != -1)
        dispatch_once(&qword_30F0A8, v17);
      v3 = &qword_30F0B0;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_E6158;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30F0B8 != -1)
        dispatch_once(&qword_30F0B8, v16);
      v3 = &qword_30F0C0;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_E61AC;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30F0C8 != -1)
        dispatch_once(&qword_30F0C8, v15);
      v3 = &qword_30F0D0;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_E6200;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30F0D8 != -1)
        dispatch_once(&qword_30F0D8, v14);
      v3 = &qword_30F0E0;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_E6254;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30F0E8 != -1)
        dispatch_once(&qword_30F0E8, v13);
      v3 = &qword_30F0F0;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_E62A8;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30F0F8 != -1)
        dispatch_once(&qword_30F0F8, v12);
      v3 = &qword_30F100;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_E62FC;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30F108 != -1)
        dispatch_once(&qword_30F108, v11);
      v3 = &qword_30F110;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_E6350;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30F118 != -1)
        dispatch_once(&qword_30F118, v10);
      v3 = &qword_30F120;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_E63A4;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30F128 != -1)
        dispatch_once(&qword_30F128, v9);
      v3 = &qword_30F130;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_E63F8;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30F138 != -1)
        dispatch_once(&qword_30F138, v8);
      v3 = &qword_30F140;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_E644C;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30F148 != -1)
        dispatch_once(&qword_30F148, v7);
      v3 = &qword_30F150;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_E64A0;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30F158 != -1)
        dispatch_once(&qword_30F158, v6);
      v3 = &qword_30F160;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_E64F4;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30F168 != -1)
        dispatch_once(&qword_30F168, v5);
      v3 = &qword_30F170;
LABEL_54:
      result = (id)*v3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)noteMarkerBorderColor
{
  uint64_t *v3;
  id result;
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
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
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD block[6];

  switch(-[AEAnnotationTheme pageTheme](self, "pageTheme"))
  {
    case 0:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_E6C8C;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30F178 != -1)
        dispatch_once(&qword_30F178, block);
      v3 = &qword_30F180;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_E6CE0;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30F188 != -1)
        dispatch_once(&qword_30F188, v20);
      v3 = &qword_30F190;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_E6D34;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30F198 != -1)
        dispatch_once(&qword_30F198, v19);
      v3 = &qword_30F1A0;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_E6D88;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30F1A8 != -1)
        dispatch_once(&qword_30F1A8, v18);
      v3 = &qword_30F1B0;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_E6DDC;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30F1B8 != -1)
        dispatch_once(&qword_30F1B8, v17);
      v3 = &qword_30F1C0;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_E6E30;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30F1C8 != -1)
        dispatch_once(&qword_30F1C8, v16);
      v3 = &qword_30F1D0;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_E6E84;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30F1D8 != -1)
        dispatch_once(&qword_30F1D8, v15);
      v3 = &qword_30F1E0;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_E6ED8;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30F1E8 != -1)
        dispatch_once(&qword_30F1E8, v14);
      v3 = &qword_30F1F0;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_E6F2C;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30F1F8 != -1)
        dispatch_once(&qword_30F1F8, v13);
      v3 = &qword_30F200;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_E6F80;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30F208 != -1)
        dispatch_once(&qword_30F208, v12);
      v3 = &qword_30F210;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_E6FD4;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30F218 != -1)
        dispatch_once(&qword_30F218, v11);
      v3 = &qword_30F220;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_E7028;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30F228 != -1)
        dispatch_once(&qword_30F228, v10);
      v3 = &qword_30F230;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_E707C;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30F238 != -1)
        dispatch_once(&qword_30F238, v9);
      v3 = &qword_30F240;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_E70D0;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30F248 != -1)
        dispatch_once(&qword_30F248, v8);
      v3 = &qword_30F250;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_E7124;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30F258 != -1)
        dispatch_once(&qword_30F258, v7);
      v3 = &qword_30F260;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_E7178;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30F268 != -1)
        dispatch_once(&qword_30F268, v6);
      v3 = &qword_30F270;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_E71CC;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30F278 != -1)
        dispatch_once(&qword_30F278, v5);
      v3 = &qword_30F280;
LABEL_54:
      result = (id)*v3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)notesSidebarBarColor
{
  uint64_t *v3;
  id result;
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
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
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD block[6];

  switch(-[AEAnnotationTheme pageTheme](self, "pageTheme"))
  {
    case 0:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_E7964;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30F288 != -1)
        dispatch_once(&qword_30F288, block);
      v3 = &qword_30F290;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_E79B8;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30F298 != -1)
        dispatch_once(&qword_30F298, v20);
      v3 = &qword_30F2A0;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_E7A0C;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30F2A8 != -1)
        dispatch_once(&qword_30F2A8, v19);
      v3 = &qword_30F2B0;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_E7A60;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30F2B8 != -1)
        dispatch_once(&qword_30F2B8, v18);
      v3 = &qword_30F2C0;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_E7AB4;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30F2C8 != -1)
        dispatch_once(&qword_30F2C8, v17);
      v3 = &qword_30F2D0;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_E7B08;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30F2D8 != -1)
        dispatch_once(&qword_30F2D8, v16);
      v3 = &qword_30F2E0;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_E7B5C;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30F2E8 != -1)
        dispatch_once(&qword_30F2E8, v15);
      v3 = &qword_30F2F0;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_E7BB0;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30F2F8 != -1)
        dispatch_once(&qword_30F2F8, v14);
      v3 = &qword_30F300;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_E7C04;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30F308 != -1)
        dispatch_once(&qword_30F308, v13);
      v3 = &qword_30F310;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_E7C58;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30F318 != -1)
        dispatch_once(&qword_30F318, v12);
      v3 = &qword_30F320;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_E7CAC;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30F328 != -1)
        dispatch_once(&qword_30F328, v11);
      v3 = &qword_30F330;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_E7D00;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30F338 != -1)
        dispatch_once(&qword_30F338, v10);
      v3 = &qword_30F340;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_E7D54;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30F348 != -1)
        dispatch_once(&qword_30F348, v9);
      v3 = &qword_30F350;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_E7DA8;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30F358 != -1)
        dispatch_once(&qword_30F358, v8);
      v3 = &qword_30F360;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_E7DFC;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30F368 != -1)
        dispatch_once(&qword_30F368, v7);
      v3 = &qword_30F370;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_E7E50;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30F378 != -1)
        dispatch_once(&qword_30F378, v6);
      v3 = &qword_30F380;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_E7EA4;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30F388 != -1)
        dispatch_once(&qword_30F388, v5);
      v3 = &qword_30F390;
LABEL_54:
      result = (id)*v3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)isUnderline
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E7F6C;
  block[3] = &unk_28B960;
  block[4] = self;
  if (qword_30F398 != -1)
    dispatch_once(&qword_30F398, block);
  return byte_30F3A0;
}

- (int)annotationStyle
{
  return 3;
}

@end
