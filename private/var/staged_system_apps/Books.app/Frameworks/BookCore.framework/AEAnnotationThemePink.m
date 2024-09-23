@implementation AEAnnotationThemePink

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
      block[2] = sub_EE1D4;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30FB28 != -1)
        dispatch_once(&qword_30FB28, block);
      v3 = &qword_30FB30;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_EE228;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30FB38 != -1)
        dispatch_once(&qword_30FB38, v20);
      v3 = &qword_30FB40;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_EE27C;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30FB48 != -1)
        dispatch_once(&qword_30FB48, v19);
      v3 = &qword_30FB50;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_EE2D0;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30FB58 != -1)
        dispatch_once(&qword_30FB58, v18);
      v3 = &qword_30FB60;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_EE324;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30FB68 != -1)
        dispatch_once(&qword_30FB68, v17);
      v3 = &qword_30FB70;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_EE378;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30FB78 != -1)
        dispatch_once(&qword_30FB78, v16);
      v3 = &qword_30FB80;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_EE3CC;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30FB88 != -1)
        dispatch_once(&qword_30FB88, v15);
      v3 = &qword_30FB90;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_EE420;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30FB98 != -1)
        dispatch_once(&qword_30FB98, v14);
      v3 = &qword_30FBA0;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_EE474;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30FBA8 != -1)
        dispatch_once(&qword_30FBA8, v13);
      v3 = &qword_30FBB0;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_EE4C8;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30FBB8 != -1)
        dispatch_once(&qword_30FBB8, v12);
      v3 = &qword_30FBC0;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_EE51C;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30FBC8 != -1)
        dispatch_once(&qword_30FBC8, v11);
      v3 = &qword_30FBD0;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_EE570;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30FBD8 != -1)
        dispatch_once(&qword_30FBD8, v10);
      v3 = &qword_30FBE0;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_EE5C4;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30FBE8 != -1)
        dispatch_once(&qword_30FBE8, v9);
      v3 = &qword_30FBF0;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_EE618;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30FBF8 != -1)
        dispatch_once(&qword_30FBF8, v8);
      v3 = &qword_30FC00;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_EE66C;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30FC08 != -1)
        dispatch_once(&qword_30FC08, v7);
      v3 = &qword_30FC10;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_EE6C0;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30FC18 != -1)
        dispatch_once(&qword_30FC18, v6);
      v3 = &qword_30FC20;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_EE714;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30FC28 != -1)
        dispatch_once(&qword_30FC28, v5);
      v3 = &qword_30FC30;
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
      block[2] = sub_EEEAC;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30FC38 != -1)
        dispatch_once(&qword_30FC38, block);
      v3 = &qword_30FC40;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_EEF00;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30FC48 != -1)
        dispatch_once(&qword_30FC48, v20);
      v3 = &qword_30FC50;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_EEF54;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30FC58 != -1)
        dispatch_once(&qword_30FC58, v19);
      v3 = &qword_30FC60;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_EEFA8;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30FC68 != -1)
        dispatch_once(&qword_30FC68, v18);
      v3 = &qword_30FC70;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_EEFFC;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30FC78 != -1)
        dispatch_once(&qword_30FC78, v17);
      v3 = &qword_30FC80;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_EF050;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30FC88 != -1)
        dispatch_once(&qword_30FC88, v16);
      v3 = &qword_30FC90;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_EF0A4;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30FC98 != -1)
        dispatch_once(&qword_30FC98, v15);
      v3 = &qword_30FCA0;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_EF0F8;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30FCA8 != -1)
        dispatch_once(&qword_30FCA8, v14);
      v3 = &qword_30FCB0;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_EF14C;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30FCB8 != -1)
        dispatch_once(&qword_30FCB8, v13);
      v3 = &qword_30FCC0;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_EF1A0;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30FCC8 != -1)
        dispatch_once(&qword_30FCC8, v12);
      v3 = &qword_30FCD0;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_EF1F4;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30FCD8 != -1)
        dispatch_once(&qword_30FCD8, v11);
      v3 = &qword_30FCE0;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_EF248;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30FCE8 != -1)
        dispatch_once(&qword_30FCE8, v10);
      v3 = &qword_30FCF0;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_EF29C;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30FCF8 != -1)
        dispatch_once(&qword_30FCF8, v9);
      v3 = &qword_30FD00;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_EF2F0;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30FD08 != -1)
        dispatch_once(&qword_30FD08, v8);
      v3 = &qword_30FD10;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_EF344;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30FD18 != -1)
        dispatch_once(&qword_30FD18, v7);
      v3 = &qword_30FD20;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_EF398;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30FD28 != -1)
        dispatch_once(&qword_30FD28, v6);
      v3 = &qword_30FD30;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_EF3EC;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30FD38 != -1)
        dispatch_once(&qword_30FD38, v5);
      v3 = &qword_30FD40;
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
      block[2] = sub_EFB84;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30FD48 != -1)
        dispatch_once(&qword_30FD48, block);
      v3 = &qword_30FD50;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_EFBD8;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30FD58 != -1)
        dispatch_once(&qword_30FD58, v20);
      v3 = &qword_30FD60;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_EFC2C;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30FD68 != -1)
        dispatch_once(&qword_30FD68, v19);
      v3 = &qword_30FD70;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_EFC80;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30FD78 != -1)
        dispatch_once(&qword_30FD78, v18);
      v3 = &qword_30FD80;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_EFCD4;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30FD88 != -1)
        dispatch_once(&qword_30FD88, v17);
      v3 = &qword_30FD90;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_EFD28;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30FD98 != -1)
        dispatch_once(&qword_30FD98, v16);
      v3 = &qword_30FDA0;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_EFD7C;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30FDA8 != -1)
        dispatch_once(&qword_30FDA8, v15);
      v3 = &qword_30FDB0;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_EFDD0;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30FDB8 != -1)
        dispatch_once(&qword_30FDB8, v14);
      v3 = &qword_30FDC0;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_EFE24;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30FDC8 != -1)
        dispatch_once(&qword_30FDC8, v13);
      v3 = &qword_30FDD0;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_EFE78;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30FDD8 != -1)
        dispatch_once(&qword_30FDD8, v12);
      v3 = &qword_30FDE0;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_EFECC;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30FDE8 != -1)
        dispatch_once(&qword_30FDE8, v11);
      v3 = &qword_30FDF0;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_EFF20;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30FDF8 != -1)
        dispatch_once(&qword_30FDF8, v10);
      v3 = &qword_30FE00;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_EFF74;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30FE08 != -1)
        dispatch_once(&qword_30FE08, v9);
      v3 = &qword_30FE10;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_EFFC8;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30FE18 != -1)
        dispatch_once(&qword_30FE18, v8);
      v3 = &qword_30FE20;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_F001C;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30FE28 != -1)
        dispatch_once(&qword_30FE28, v7);
      v3 = &qword_30FE30;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_F0070;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30FE38 != -1)
        dispatch_once(&qword_30FE38, v6);
      v3 = &qword_30FE40;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_F00C4;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30FE48 != -1)
        dispatch_once(&qword_30FE48, v5);
      v3 = &qword_30FE50;
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
      block[2] = sub_F085C;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30FE58 != -1)
        dispatch_once(&qword_30FE58, block);
      v3 = &qword_30FE60;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_F08B0;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30FE68 != -1)
        dispatch_once(&qword_30FE68, v20);
      v3 = &qword_30FE70;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_F0904;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30FE78 != -1)
        dispatch_once(&qword_30FE78, v19);
      v3 = &qword_30FE80;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_F0958;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30FE88 != -1)
        dispatch_once(&qword_30FE88, v18);
      v3 = &qword_30FE90;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_F09AC;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30FE98 != -1)
        dispatch_once(&qword_30FE98, v17);
      v3 = &qword_30FEA0;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_F0A00;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30FEA8 != -1)
        dispatch_once(&qword_30FEA8, v16);
      v3 = &qword_30FEB0;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_F0A54;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30FEB8 != -1)
        dispatch_once(&qword_30FEB8, v15);
      v3 = &qword_30FEC0;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F0AA8;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30FEC8 != -1)
        dispatch_once(&qword_30FEC8, v14);
      v3 = &qword_30FED0;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_F0AFC;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30FED8 != -1)
        dispatch_once(&qword_30FED8, v13);
      v3 = &qword_30FEE0;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F0B50;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30FEE8 != -1)
        dispatch_once(&qword_30FEE8, v12);
      v3 = &qword_30FEF0;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_F0BA4;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30FEF8 != -1)
        dispatch_once(&qword_30FEF8, v11);
      v3 = &qword_30FF00;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_F0BF8;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30FF08 != -1)
        dispatch_once(&qword_30FF08, v10);
      v3 = &qword_30FF10;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_F0C4C;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30FF18 != -1)
        dispatch_once(&qword_30FF18, v9);
      v3 = &qword_30FF20;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_F0CA0;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30FF28 != -1)
        dispatch_once(&qword_30FF28, v8);
      v3 = &qword_30FF30;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_F0CF4;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30FF38 != -1)
        dispatch_once(&qword_30FF38, v7);
      v3 = &qword_30FF40;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_F0D48;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30FF48 != -1)
        dispatch_once(&qword_30FF48, v6);
      v3 = &qword_30FF50;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_F0D9C;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30FF58 != -1)
        dispatch_once(&qword_30FF58, v5);
      v3 = &qword_30FF60;
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
      block[2] = sub_F1534;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30FF68 != -1)
        dispatch_once(&qword_30FF68, block);
      v3 = &qword_30FF70;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_F1588;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30FF78 != -1)
        dispatch_once(&qword_30FF78, v20);
      v3 = &qword_30FF80;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_F15DC;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30FF88 != -1)
        dispatch_once(&qword_30FF88, v19);
      v3 = &qword_30FF90;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_F1630;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30FF98 != -1)
        dispatch_once(&qword_30FF98, v18);
      v3 = &qword_30FFA0;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_F1684;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30FFA8 != -1)
        dispatch_once(&qword_30FFA8, v17);
      v3 = &qword_30FFB0;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_F16D8;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30FFB8 != -1)
        dispatch_once(&qword_30FFB8, v16);
      v3 = &qword_30FFC0;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_F172C;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30FFC8 != -1)
        dispatch_once(&qword_30FFC8, v15);
      v3 = &qword_30FFD0;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F1780;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30FFD8 != -1)
        dispatch_once(&qword_30FFD8, v14);
      v3 = &qword_30FFE0;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_F17D4;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30FFE8 != -1)
        dispatch_once(&qword_30FFE8, v13);
      v3 = &qword_30FFF0;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F1828;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30FFF8 != -1)
        dispatch_once(&qword_30FFF8, v12);
      v3 = &qword_310000;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_F187C;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_310008 != -1)
        dispatch_once(&qword_310008, v11);
      v3 = &qword_310010;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_F18D0;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_310018 != -1)
        dispatch_once(&qword_310018, v10);
      v3 = &qword_310020;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_F1924;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_310028 != -1)
        dispatch_once(&qword_310028, v9);
      v3 = &qword_310030;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_F1978;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_310038 != -1)
        dispatch_once(&qword_310038, v8);
      v3 = &qword_310040;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_F19CC;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_310048 != -1)
        dispatch_once(&qword_310048, v7);
      v3 = &qword_310050;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_F1A20;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_310058 != -1)
        dispatch_once(&qword_310058, v6);
      v3 = &qword_310060;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_F1A74;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_310068 != -1)
        dispatch_once(&qword_310068, v5);
      v3 = &qword_310070;
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
      block[2] = sub_F220C;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_310078 != -1)
        dispatch_once(&qword_310078, block);
      v3 = &qword_310080;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_F2260;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_310088 != -1)
        dispatch_once(&qword_310088, v20);
      v3 = &qword_310090;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_F22B4;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_310098 != -1)
        dispatch_once(&qword_310098, v19);
      v3 = &qword_3100A0;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_F2308;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_3100A8 != -1)
        dispatch_once(&qword_3100A8, v18);
      v3 = &qword_3100B0;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_F235C;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_3100B8 != -1)
        dispatch_once(&qword_3100B8, v17);
      v3 = &qword_3100C0;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_F23B0;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_3100C8 != -1)
        dispatch_once(&qword_3100C8, v16);
      v3 = &qword_3100D0;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_F2404;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_3100D8 != -1)
        dispatch_once(&qword_3100D8, v15);
      v3 = &qword_3100E0;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F2458;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_3100E8 != -1)
        dispatch_once(&qword_3100E8, v14);
      v3 = &qword_3100F0;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_F24AC;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_3100F8 != -1)
        dispatch_once(&qword_3100F8, v13);
      v3 = &qword_310100;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F2500;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_310108 != -1)
        dispatch_once(&qword_310108, v12);
      v3 = &qword_310110;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_F2554;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_310118 != -1)
        dispatch_once(&qword_310118, v11);
      v3 = &qword_310120;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_F25A8;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_310128 != -1)
        dispatch_once(&qword_310128, v10);
      v3 = &qword_310130;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_F25FC;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_310138 != -1)
        dispatch_once(&qword_310138, v9);
      v3 = &qword_310140;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_F2650;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_310148 != -1)
        dispatch_once(&qword_310148, v8);
      v3 = &qword_310150;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_F26A4;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_310158 != -1)
        dispatch_once(&qword_310158, v7);
      v3 = &qword_310160;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_F26F8;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_310168 != -1)
        dispatch_once(&qword_310168, v6);
      v3 = &qword_310170;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_F274C;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_310178 != -1)
        dispatch_once(&qword_310178, v5);
      v3 = &qword_310180;
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
      block[2] = sub_F2EE4;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_310188 != -1)
        dispatch_once(&qword_310188, block);
      v3 = &qword_310190;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_F2F38;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_310198 != -1)
        dispatch_once(&qword_310198, v20);
      v3 = &qword_3101A0;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_F2F8C;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_3101A8 != -1)
        dispatch_once(&qword_3101A8, v19);
      v3 = &qword_3101B0;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_F2FE0;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_3101B8 != -1)
        dispatch_once(&qword_3101B8, v18);
      v3 = &qword_3101C0;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_F3034;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_3101C8 != -1)
        dispatch_once(&qword_3101C8, v17);
      v3 = &qword_3101D0;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_F3088;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_3101D8 != -1)
        dispatch_once(&qword_3101D8, v16);
      v3 = &qword_3101E0;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_F30DC;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_3101E8 != -1)
        dispatch_once(&qword_3101E8, v15);
      v3 = &qword_3101F0;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F3130;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_3101F8 != -1)
        dispatch_once(&qword_3101F8, v14);
      v3 = &qword_310200;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_F3184;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_310208 != -1)
        dispatch_once(&qword_310208, v13);
      v3 = &qword_310210;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F31D8;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_310218 != -1)
        dispatch_once(&qword_310218, v12);
      v3 = &qword_310220;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_F322C;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_310228 != -1)
        dispatch_once(&qword_310228, v11);
      v3 = &qword_310230;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_F3280;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_310238 != -1)
        dispatch_once(&qword_310238, v10);
      v3 = &qword_310240;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_F32D4;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_310248 != -1)
        dispatch_once(&qword_310248, v9);
      v3 = &qword_310250;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_F3328;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_310258 != -1)
        dispatch_once(&qword_310258, v8);
      v3 = &qword_310260;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_F337C;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_310268 != -1)
        dispatch_once(&qword_310268, v7);
      v3 = &qword_310270;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_F33D0;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_310278 != -1)
        dispatch_once(&qword_310278, v6);
      v3 = &qword_310280;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_F3424;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_310288 != -1)
        dispatch_once(&qword_310288, v5);
      v3 = &qword_310290;
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
  block[2] = sub_F34EC;
  block[3] = &unk_28B960;
  block[4] = self;
  if (qword_310298 != -1)
    dispatch_once(&qword_310298, block);
  return byte_3102A0;
}

- (int)annotationStyle
{
  return 4;
}

@end
