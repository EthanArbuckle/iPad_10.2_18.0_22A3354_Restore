@implementation AEAnnotationThemeGreen

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
      block[2] = sub_D76D4;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30DD28 != -1)
        dispatch_once(&qword_30DD28, block);
      v3 = &qword_30DD30;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_D7728;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30DD38 != -1)
        dispatch_once(&qword_30DD38, v20);
      v3 = &qword_30DD40;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_D777C;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30DD48 != -1)
        dispatch_once(&qword_30DD48, v19);
      v3 = &qword_30DD50;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_D77D0;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30DD58 != -1)
        dispatch_once(&qword_30DD58, v18);
      v3 = &qword_30DD60;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_D7824;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30DD68 != -1)
        dispatch_once(&qword_30DD68, v17);
      v3 = &qword_30DD70;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_D7878;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30DD78 != -1)
        dispatch_once(&qword_30DD78, v16);
      v3 = &qword_30DD80;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_D78CC;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30DD88 != -1)
        dispatch_once(&qword_30DD88, v15);
      v3 = &qword_30DD90;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_D7920;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30DD98 != -1)
        dispatch_once(&qword_30DD98, v14);
      v3 = &qword_30DDA0;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_D7974;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30DDA8 != -1)
        dispatch_once(&qword_30DDA8, v13);
      v3 = &qword_30DDB0;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_D79C8;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30DDB8 != -1)
        dispatch_once(&qword_30DDB8, v12);
      v3 = &qword_30DDC0;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_D7A1C;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30DDC8 != -1)
        dispatch_once(&qword_30DDC8, v11);
      v3 = &qword_30DDD0;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_D7A70;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30DDD8 != -1)
        dispatch_once(&qword_30DDD8, v10);
      v3 = &qword_30DDE0;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_D7AC4;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30DDE8 != -1)
        dispatch_once(&qword_30DDE8, v9);
      v3 = &qword_30DDF0;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_D7B18;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30DDF8 != -1)
        dispatch_once(&qword_30DDF8, v8);
      v3 = &qword_30DE00;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_D7B6C;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30DE08 != -1)
        dispatch_once(&qword_30DE08, v7);
      v3 = &qword_30DE10;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_D7BC0;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30DE18 != -1)
        dispatch_once(&qword_30DE18, v6);
      v3 = &qword_30DE20;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_D7C14;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30DE28 != -1)
        dispatch_once(&qword_30DE28, v5);
      v3 = &qword_30DE30;
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
      block[2] = sub_D83AC;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30DE38 != -1)
        dispatch_once(&qword_30DE38, block);
      v3 = &qword_30DE40;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_D8400;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30DE48 != -1)
        dispatch_once(&qword_30DE48, v20);
      v3 = &qword_30DE50;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_D8454;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30DE58 != -1)
        dispatch_once(&qword_30DE58, v19);
      v3 = &qword_30DE60;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_D84A8;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30DE68 != -1)
        dispatch_once(&qword_30DE68, v18);
      v3 = &qword_30DE70;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_D84FC;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30DE78 != -1)
        dispatch_once(&qword_30DE78, v17);
      v3 = &qword_30DE80;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_D8550;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30DE88 != -1)
        dispatch_once(&qword_30DE88, v16);
      v3 = &qword_30DE90;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_D85A4;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30DE98 != -1)
        dispatch_once(&qword_30DE98, v15);
      v3 = &qword_30DEA0;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_D85F8;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30DEA8 != -1)
        dispatch_once(&qword_30DEA8, v14);
      v3 = &qword_30DEB0;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_D864C;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30DEB8 != -1)
        dispatch_once(&qword_30DEB8, v13);
      v3 = &qword_30DEC0;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_D86A0;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30DEC8 != -1)
        dispatch_once(&qword_30DEC8, v12);
      v3 = &qword_30DED0;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_D86F4;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30DED8 != -1)
        dispatch_once(&qword_30DED8, v11);
      v3 = &qword_30DEE0;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_D8748;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30DEE8 != -1)
        dispatch_once(&qword_30DEE8, v10);
      v3 = &qword_30DEF0;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_D879C;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30DEF8 != -1)
        dispatch_once(&qword_30DEF8, v9);
      v3 = &qword_30DF00;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_D87F0;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30DF08 != -1)
        dispatch_once(&qword_30DF08, v8);
      v3 = &qword_30DF10;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_D8844;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30DF18 != -1)
        dispatch_once(&qword_30DF18, v7);
      v3 = &qword_30DF20;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_D8898;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30DF28 != -1)
        dispatch_once(&qword_30DF28, v6);
      v3 = &qword_30DF30;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_D88EC;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30DF38 != -1)
        dispatch_once(&qword_30DF38, v5);
      v3 = &qword_30DF40;
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
      block[2] = sub_D9084;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30DF48 != -1)
        dispatch_once(&qword_30DF48, block);
      v3 = &qword_30DF50;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_D90D8;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30DF58 != -1)
        dispatch_once(&qword_30DF58, v20);
      v3 = &qword_30DF60;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_D912C;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30DF68 != -1)
        dispatch_once(&qword_30DF68, v19);
      v3 = &qword_30DF70;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_D9180;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30DF78 != -1)
        dispatch_once(&qword_30DF78, v18);
      v3 = &qword_30DF80;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_D91D4;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30DF88 != -1)
        dispatch_once(&qword_30DF88, v17);
      v3 = &qword_30DF90;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_D9228;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30DF98 != -1)
        dispatch_once(&qword_30DF98, v16);
      v3 = &qword_30DFA0;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_D927C;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30DFA8 != -1)
        dispatch_once(&qword_30DFA8, v15);
      v3 = &qword_30DFB0;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_D92D0;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30DFB8 != -1)
        dispatch_once(&qword_30DFB8, v14);
      v3 = &qword_30DFC0;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_D9324;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30DFC8 != -1)
        dispatch_once(&qword_30DFC8, v13);
      v3 = &qword_30DFD0;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_D9378;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30DFD8 != -1)
        dispatch_once(&qword_30DFD8, v12);
      v3 = &qword_30DFE0;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_D93CC;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30DFE8 != -1)
        dispatch_once(&qword_30DFE8, v11);
      v3 = &qword_30DFF0;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_D9420;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30DFF8 != -1)
        dispatch_once(&qword_30DFF8, v10);
      v3 = &qword_30E000;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_D9474;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30E008 != -1)
        dispatch_once(&qword_30E008, v9);
      v3 = &qword_30E010;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_D94C8;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30E018 != -1)
        dispatch_once(&qword_30E018, v8);
      v3 = &qword_30E020;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_D951C;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30E028 != -1)
        dispatch_once(&qword_30E028, v7);
      v3 = &qword_30E030;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_D9570;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30E038 != -1)
        dispatch_once(&qword_30E038, v6);
      v3 = &qword_30E040;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_D95C4;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30E048 != -1)
        dispatch_once(&qword_30E048, v5);
      v3 = &qword_30E050;
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
      block[2] = sub_D9D5C;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30E058 != -1)
        dispatch_once(&qword_30E058, block);
      v3 = &qword_30E060;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_D9DB0;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30E068 != -1)
        dispatch_once(&qword_30E068, v20);
      v3 = &qword_30E070;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_D9E04;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30E078 != -1)
        dispatch_once(&qword_30E078, v19);
      v3 = &qword_30E080;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_D9E58;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30E088 != -1)
        dispatch_once(&qword_30E088, v18);
      v3 = &qword_30E090;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_D9EAC;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30E098 != -1)
        dispatch_once(&qword_30E098, v17);
      v3 = &qword_30E0A0;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_D9F00;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30E0A8 != -1)
        dispatch_once(&qword_30E0A8, v16);
      v3 = &qword_30E0B0;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_D9F54;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30E0B8 != -1)
        dispatch_once(&qword_30E0B8, v15);
      v3 = &qword_30E0C0;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_D9FA8;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30E0C8 != -1)
        dispatch_once(&qword_30E0C8, v14);
      v3 = &qword_30E0D0;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_D9FFC;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30E0D8 != -1)
        dispatch_once(&qword_30E0D8, v13);
      v3 = &qword_30E0E0;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_DA050;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30E0E8 != -1)
        dispatch_once(&qword_30E0E8, v12);
      v3 = &qword_30E0F0;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_DA0A4;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30E0F8 != -1)
        dispatch_once(&qword_30E0F8, v11);
      v3 = &qword_30E100;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_DA0F8;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30E108 != -1)
        dispatch_once(&qword_30E108, v10);
      v3 = &qword_30E110;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_DA14C;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30E118 != -1)
        dispatch_once(&qword_30E118, v9);
      v3 = &qword_30E120;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_DA1A0;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30E128 != -1)
        dispatch_once(&qword_30E128, v8);
      v3 = &qword_30E130;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_DA1F4;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30E138 != -1)
        dispatch_once(&qword_30E138, v7);
      v3 = &qword_30E140;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_DA248;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30E148 != -1)
        dispatch_once(&qword_30E148, v6);
      v3 = &qword_30E150;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_DA29C;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30E158 != -1)
        dispatch_once(&qword_30E158, v5);
      v3 = &qword_30E160;
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
      block[2] = sub_DAA34;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30E168 != -1)
        dispatch_once(&qword_30E168, block);
      v3 = &qword_30E170;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_DAA88;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30E178 != -1)
        dispatch_once(&qword_30E178, v20);
      v3 = &qword_30E180;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_DAADC;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30E188 != -1)
        dispatch_once(&qword_30E188, v19);
      v3 = &qword_30E190;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_DAB30;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30E198 != -1)
        dispatch_once(&qword_30E198, v18);
      v3 = &qword_30E1A0;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_DAB84;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30E1A8 != -1)
        dispatch_once(&qword_30E1A8, v17);
      v3 = &qword_30E1B0;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_DABD8;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30E1B8 != -1)
        dispatch_once(&qword_30E1B8, v16);
      v3 = &qword_30E1C0;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_DAC2C;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30E1C8 != -1)
        dispatch_once(&qword_30E1C8, v15);
      v3 = &qword_30E1D0;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_DAC80;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30E1D8 != -1)
        dispatch_once(&qword_30E1D8, v14);
      v3 = &qword_30E1E0;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_DACD4;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30E1E8 != -1)
        dispatch_once(&qword_30E1E8, v13);
      v3 = &qword_30E1F0;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_DAD28;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30E1F8 != -1)
        dispatch_once(&qword_30E1F8, v12);
      v3 = &qword_30E200;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_DAD7C;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30E208 != -1)
        dispatch_once(&qword_30E208, v11);
      v3 = &qword_30E210;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_DADD0;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30E218 != -1)
        dispatch_once(&qword_30E218, v10);
      v3 = &qword_30E220;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_DAE24;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30E228 != -1)
        dispatch_once(&qword_30E228, v9);
      v3 = &qword_30E230;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_DAE78;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30E238 != -1)
        dispatch_once(&qword_30E238, v8);
      v3 = &qword_30E240;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_DAECC;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30E248 != -1)
        dispatch_once(&qword_30E248, v7);
      v3 = &qword_30E250;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_DAF20;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30E258 != -1)
        dispatch_once(&qword_30E258, v6);
      v3 = &qword_30E260;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_DAF74;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30E268 != -1)
        dispatch_once(&qword_30E268, v5);
      v3 = &qword_30E270;
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
      block[2] = sub_DB70C;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30E278 != -1)
        dispatch_once(&qword_30E278, block);
      v3 = &qword_30E280;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_DB760;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30E288 != -1)
        dispatch_once(&qword_30E288, v20);
      v3 = &qword_30E290;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_DB7B4;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30E298 != -1)
        dispatch_once(&qword_30E298, v19);
      v3 = &qword_30E2A0;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_DB808;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30E2A8 != -1)
        dispatch_once(&qword_30E2A8, v18);
      v3 = &qword_30E2B0;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_DB85C;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30E2B8 != -1)
        dispatch_once(&qword_30E2B8, v17);
      v3 = &qword_30E2C0;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_DB8B0;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30E2C8 != -1)
        dispatch_once(&qword_30E2C8, v16);
      v3 = &qword_30E2D0;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_DB904;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30E2D8 != -1)
        dispatch_once(&qword_30E2D8, v15);
      v3 = &qword_30E2E0;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_DB958;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30E2E8 != -1)
        dispatch_once(&qword_30E2E8, v14);
      v3 = &qword_30E2F0;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_DB9AC;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30E2F8 != -1)
        dispatch_once(&qword_30E2F8, v13);
      v3 = &qword_30E300;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_DBA00;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30E308 != -1)
        dispatch_once(&qword_30E308, v12);
      v3 = &qword_30E310;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_DBA54;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30E318 != -1)
        dispatch_once(&qword_30E318, v11);
      v3 = &qword_30E320;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_DBAA8;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30E328 != -1)
        dispatch_once(&qword_30E328, v10);
      v3 = &qword_30E330;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_DBAFC;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30E338 != -1)
        dispatch_once(&qword_30E338, v9);
      v3 = &qword_30E340;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_DBB50;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30E348 != -1)
        dispatch_once(&qword_30E348, v8);
      v3 = &qword_30E350;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_DBBA4;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30E358 != -1)
        dispatch_once(&qword_30E358, v7);
      v3 = &qword_30E360;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_DBBF8;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30E368 != -1)
        dispatch_once(&qword_30E368, v6);
      v3 = &qword_30E370;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_DBC4C;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30E378 != -1)
        dispatch_once(&qword_30E378, v5);
      v3 = &qword_30E380;
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
      block[2] = sub_DC3E4;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30E388 != -1)
        dispatch_once(&qword_30E388, block);
      v3 = &qword_30E390;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_DC438;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30E398 != -1)
        dispatch_once(&qword_30E398, v20);
      v3 = &qword_30E3A0;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_DC48C;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30E3A8 != -1)
        dispatch_once(&qword_30E3A8, v19);
      v3 = &qword_30E3B0;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_DC4E0;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30E3B8 != -1)
        dispatch_once(&qword_30E3B8, v18);
      v3 = &qword_30E3C0;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_DC534;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30E3C8 != -1)
        dispatch_once(&qword_30E3C8, v17);
      v3 = &qword_30E3D0;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_DC588;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30E3D8 != -1)
        dispatch_once(&qword_30E3D8, v16);
      v3 = &qword_30E3E0;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_DC5DC;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30E3E8 != -1)
        dispatch_once(&qword_30E3E8, v15);
      v3 = &qword_30E3F0;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_DC630;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30E3F8 != -1)
        dispatch_once(&qword_30E3F8, v14);
      v3 = &qword_30E400;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_DC684;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30E408 != -1)
        dispatch_once(&qword_30E408, v13);
      v3 = &qword_30E410;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_DC6D8;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30E418 != -1)
        dispatch_once(&qword_30E418, v12);
      v3 = &qword_30E420;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_DC72C;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30E428 != -1)
        dispatch_once(&qword_30E428, v11);
      v3 = &qword_30E430;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_DC780;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30E438 != -1)
        dispatch_once(&qword_30E438, v10);
      v3 = &qword_30E440;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_DC7D4;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30E448 != -1)
        dispatch_once(&qword_30E448, v9);
      v3 = &qword_30E450;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_DC828;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30E458 != -1)
        dispatch_once(&qword_30E458, v8);
      v3 = &qword_30E460;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_DC87C;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30E468 != -1)
        dispatch_once(&qword_30E468, v7);
      v3 = &qword_30E470;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_DC8D0;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30E478 != -1)
        dispatch_once(&qword_30E478, v6);
      v3 = &qword_30E480;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_DC924;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30E488 != -1)
        dispatch_once(&qword_30E488, v5);
      v3 = &qword_30E490;
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
  block[2] = sub_DC9EC;
  block[3] = &unk_28B960;
  block[4] = self;
  if (qword_30E498 != -1)
    dispatch_once(&qword_30E498, block);
  return byte_30E4A0;
}

- (int)annotationStyle
{
  return 1;
}

@end
