@implementation AEAnnotationThemeUnderline

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
      block[2] = sub_F3C94;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_3102A8 != -1)
        dispatch_once(&qword_3102A8, block);
      v3 = &qword_3102B0;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_F3CE8;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_3102B8 != -1)
        dispatch_once(&qword_3102B8, v20);
      v3 = &qword_3102C0;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_F3D3C;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_3102C8 != -1)
        dispatch_once(&qword_3102C8, v19);
      v3 = &qword_3102D0;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_F3D90;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_3102D8 != -1)
        dispatch_once(&qword_3102D8, v18);
      v3 = &qword_3102E0;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_F3DE4;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_3102E8 != -1)
        dispatch_once(&qword_3102E8, v17);
      v3 = &qword_3102F0;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_F3E38;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_3102F8 != -1)
        dispatch_once(&qword_3102F8, v16);
      v3 = &qword_310300;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_F3E8C;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_310308 != -1)
        dispatch_once(&qword_310308, v15);
      v3 = &qword_310310;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F3EE0;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_310318 != -1)
        dispatch_once(&qword_310318, v14);
      v3 = &qword_310320;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_F3F34;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_310328 != -1)
        dispatch_once(&qword_310328, v13);
      v3 = &qword_310330;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F3F88;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_310338 != -1)
        dispatch_once(&qword_310338, v12);
      v3 = &qword_310340;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_F3FDC;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_310348 != -1)
        dispatch_once(&qword_310348, v11);
      v3 = &qword_310350;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_F4030;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_310358 != -1)
        dispatch_once(&qword_310358, v10);
      v3 = &qword_310360;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_F4084;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_310368 != -1)
        dispatch_once(&qword_310368, v9);
      v3 = &qword_310370;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_F40D8;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_310378 != -1)
        dispatch_once(&qword_310378, v8);
      v3 = &qword_310380;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_F412C;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_310388 != -1)
        dispatch_once(&qword_310388, v7);
      v3 = &qword_310390;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_F4180;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_310398 != -1)
        dispatch_once(&qword_310398, v6);
      v3 = &qword_3103A0;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_F41D4;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_3103A8 != -1)
        dispatch_once(&qword_3103A8, v5);
      v3 = &qword_3103B0;
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
      block[2] = sub_F496C;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_3103B8 != -1)
        dispatch_once(&qword_3103B8, block);
      v3 = &qword_3103C0;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_F49C0;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_3103C8 != -1)
        dispatch_once(&qword_3103C8, v20);
      v3 = &qword_3103D0;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_F4A14;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_3103D8 != -1)
        dispatch_once(&qword_3103D8, v19);
      v3 = &qword_3103E0;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_F4A68;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_3103E8 != -1)
        dispatch_once(&qword_3103E8, v18);
      v3 = &qword_3103F0;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_F4ABC;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_3103F8 != -1)
        dispatch_once(&qword_3103F8, v17);
      v3 = &qword_310400;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_F4B10;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_310408 != -1)
        dispatch_once(&qword_310408, v16);
      v3 = &qword_310410;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_F4B64;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_310418 != -1)
        dispatch_once(&qword_310418, v15);
      v3 = &qword_310420;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F4BB8;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_310428 != -1)
        dispatch_once(&qword_310428, v14);
      v3 = &qword_310430;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_F4C0C;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_310438 != -1)
        dispatch_once(&qword_310438, v13);
      v3 = &qword_310440;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F4C60;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_310448 != -1)
        dispatch_once(&qword_310448, v12);
      v3 = &qword_310450;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_F4CB4;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_310458 != -1)
        dispatch_once(&qword_310458, v11);
      v3 = &qword_310460;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_F4D08;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_310468 != -1)
        dispatch_once(&qword_310468, v10);
      v3 = &qword_310470;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_F4D5C;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_310478 != -1)
        dispatch_once(&qword_310478, v9);
      v3 = &qword_310480;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_F4DB0;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_310488 != -1)
        dispatch_once(&qword_310488, v8);
      v3 = &qword_310490;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_F4E04;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_310498 != -1)
        dispatch_once(&qword_310498, v7);
      v3 = &qword_3104A0;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_F4E58;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_3104A8 != -1)
        dispatch_once(&qword_3104A8, v6);
      v3 = &qword_3104B0;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_F4EAC;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_3104B8 != -1)
        dispatch_once(&qword_3104B8, v5);
      v3 = &qword_3104C0;
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
      block[2] = sub_F5644;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_3104C8 != -1)
        dispatch_once(&qword_3104C8, block);
      v3 = &qword_3104D0;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_F5698;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_3104D8 != -1)
        dispatch_once(&qword_3104D8, v20);
      v3 = &qword_3104E0;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_F56EC;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_3104E8 != -1)
        dispatch_once(&qword_3104E8, v19);
      v3 = &qword_3104F0;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_F5740;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_3104F8 != -1)
        dispatch_once(&qword_3104F8, v18);
      v3 = &qword_310500;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_F5794;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_310508 != -1)
        dispatch_once(&qword_310508, v17);
      v3 = &qword_310510;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_F57E8;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_310518 != -1)
        dispatch_once(&qword_310518, v16);
      v3 = &qword_310520;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_F583C;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_310528 != -1)
        dispatch_once(&qword_310528, v15);
      v3 = &qword_310530;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F5890;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_310538 != -1)
        dispatch_once(&qword_310538, v14);
      v3 = &qword_310540;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_F58E4;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_310548 != -1)
        dispatch_once(&qword_310548, v13);
      v3 = &qword_310550;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F5938;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_310558 != -1)
        dispatch_once(&qword_310558, v12);
      v3 = &qword_310560;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_F598C;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_310568 != -1)
        dispatch_once(&qword_310568, v11);
      v3 = &qword_310570;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_F59E0;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_310578 != -1)
        dispatch_once(&qword_310578, v10);
      v3 = &qword_310580;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_F5A34;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_310588 != -1)
        dispatch_once(&qword_310588, v9);
      v3 = &qword_310590;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_F5A88;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_310598 != -1)
        dispatch_once(&qword_310598, v8);
      v3 = &qword_3105A0;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_F5ADC;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_3105A8 != -1)
        dispatch_once(&qword_3105A8, v7);
      v3 = &qword_3105B0;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_F5B30;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_3105B8 != -1)
        dispatch_once(&qword_3105B8, v6);
      v3 = &qword_3105C0;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_F5B84;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_3105C8 != -1)
        dispatch_once(&qword_3105C8, v5);
      v3 = &qword_3105D0;
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
      block[2] = sub_F631C;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_3105D8 != -1)
        dispatch_once(&qword_3105D8, block);
      v3 = &qword_3105E0;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_F6370;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_3105E8 != -1)
        dispatch_once(&qword_3105E8, v20);
      v3 = &qword_3105F0;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_F63C4;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_3105F8 != -1)
        dispatch_once(&qword_3105F8, v19);
      v3 = &qword_310600;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_F6418;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_310608 != -1)
        dispatch_once(&qword_310608, v18);
      v3 = &qword_310610;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_F646C;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_310618 != -1)
        dispatch_once(&qword_310618, v17);
      v3 = &qword_310620;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_F64C0;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_310628 != -1)
        dispatch_once(&qword_310628, v16);
      v3 = &qword_310630;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_F6514;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_310638 != -1)
        dispatch_once(&qword_310638, v15);
      v3 = &qword_310640;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F6568;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_310648 != -1)
        dispatch_once(&qword_310648, v14);
      v3 = &qword_310650;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_F65BC;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_310658 != -1)
        dispatch_once(&qword_310658, v13);
      v3 = &qword_310660;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F6610;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_310668 != -1)
        dispatch_once(&qword_310668, v12);
      v3 = &qword_310670;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_F6664;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_310678 != -1)
        dispatch_once(&qword_310678, v11);
      v3 = &qword_310680;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_F66B8;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_310688 != -1)
        dispatch_once(&qword_310688, v10);
      v3 = &qword_310690;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_F670C;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_310698 != -1)
        dispatch_once(&qword_310698, v9);
      v3 = &qword_3106A0;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_F6760;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_3106A8 != -1)
        dispatch_once(&qword_3106A8, v8);
      v3 = &qword_3106B0;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_F67B4;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_3106B8 != -1)
        dispatch_once(&qword_3106B8, v7);
      v3 = &qword_3106C0;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_F6808;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_3106C8 != -1)
        dispatch_once(&qword_3106C8, v6);
      v3 = &qword_3106D0;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_F685C;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_3106D8 != -1)
        dispatch_once(&qword_3106D8, v5);
      v3 = &qword_3106E0;
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
      block[2] = sub_F6FF4;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_3106E8 != -1)
        dispatch_once(&qword_3106E8, block);
      v3 = &qword_3106F0;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_F7048;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_3106F8 != -1)
        dispatch_once(&qword_3106F8, v20);
      v3 = &qword_310700;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_F709C;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_310708 != -1)
        dispatch_once(&qword_310708, v19);
      v3 = &qword_310710;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_F70F0;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_310718 != -1)
        dispatch_once(&qword_310718, v18);
      v3 = &qword_310720;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_F7144;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_310728 != -1)
        dispatch_once(&qword_310728, v17);
      v3 = &qword_310730;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_F7198;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_310738 != -1)
        dispatch_once(&qword_310738, v16);
      v3 = &qword_310740;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_F71EC;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_310748 != -1)
        dispatch_once(&qword_310748, v15);
      v3 = &qword_310750;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F7240;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_310758 != -1)
        dispatch_once(&qword_310758, v14);
      v3 = &qword_310760;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_F7294;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_310768 != -1)
        dispatch_once(&qword_310768, v13);
      v3 = &qword_310770;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F72E8;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_310778 != -1)
        dispatch_once(&qword_310778, v12);
      v3 = &qword_310780;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_F733C;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_310788 != -1)
        dispatch_once(&qword_310788, v11);
      v3 = &qword_310790;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_F7390;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_310798 != -1)
        dispatch_once(&qword_310798, v10);
      v3 = &qword_3107A0;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_F73E4;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_3107A8 != -1)
        dispatch_once(&qword_3107A8, v9);
      v3 = &qword_3107B0;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_F7438;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_3107B8 != -1)
        dispatch_once(&qword_3107B8, v8);
      v3 = &qword_3107C0;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_F748C;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_3107C8 != -1)
        dispatch_once(&qword_3107C8, v7);
      v3 = &qword_3107D0;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_F74E0;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_3107D8 != -1)
        dispatch_once(&qword_3107D8, v6);
      v3 = &qword_3107E0;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_F7534;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_3107E8 != -1)
        dispatch_once(&qword_3107E8, v5);
      v3 = &qword_3107F0;
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
      block[2] = sub_F7CCC;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_3107F8 != -1)
        dispatch_once(&qword_3107F8, block);
      v3 = &qword_310800;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_F7D20;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_310808 != -1)
        dispatch_once(&qword_310808, v20);
      v3 = &qword_310810;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_F7D74;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_310818 != -1)
        dispatch_once(&qword_310818, v19);
      v3 = &qword_310820;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_F7DC8;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_310828 != -1)
        dispatch_once(&qword_310828, v18);
      v3 = &qword_310830;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_F7E1C;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_310838 != -1)
        dispatch_once(&qword_310838, v17);
      v3 = &qword_310840;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_F7E70;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_310848 != -1)
        dispatch_once(&qword_310848, v16);
      v3 = &qword_310850;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_F7EC4;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_310858 != -1)
        dispatch_once(&qword_310858, v15);
      v3 = &qword_310860;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F7F18;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_310868 != -1)
        dispatch_once(&qword_310868, v14);
      v3 = &qword_310870;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_F7F6C;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_310878 != -1)
        dispatch_once(&qword_310878, v13);
      v3 = &qword_310880;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F7FC0;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_310888 != -1)
        dispatch_once(&qword_310888, v12);
      v3 = &qword_310890;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_F8014;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_310898 != -1)
        dispatch_once(&qword_310898, v11);
      v3 = &qword_3108A0;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_F8068;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_3108A8 != -1)
        dispatch_once(&qword_3108A8, v10);
      v3 = &qword_3108B0;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_F80BC;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_3108B8 != -1)
        dispatch_once(&qword_3108B8, v9);
      v3 = &qword_3108C0;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_F8110;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_3108C8 != -1)
        dispatch_once(&qword_3108C8, v8);
      v3 = &qword_3108D0;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_F8164;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_3108D8 != -1)
        dispatch_once(&qword_3108D8, v7);
      v3 = &qword_3108E0;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_F81B8;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_3108E8 != -1)
        dispatch_once(&qword_3108E8, v6);
      v3 = &qword_3108F0;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_F820C;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_3108F8 != -1)
        dispatch_once(&qword_3108F8, v5);
      v3 = &qword_310900;
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
      block[2] = sub_F89A4;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_310908 != -1)
        dispatch_once(&qword_310908, block);
      v3 = &qword_310910;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_F89F8;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_310918 != -1)
        dispatch_once(&qword_310918, v20);
      v3 = &qword_310920;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_F8A4C;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_310928 != -1)
        dispatch_once(&qword_310928, v19);
      v3 = &qword_310930;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_F8AA0;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_310938 != -1)
        dispatch_once(&qword_310938, v18);
      v3 = &qword_310940;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_F8AF4;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_310948 != -1)
        dispatch_once(&qword_310948, v17);
      v3 = &qword_310950;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_F8B48;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_310958 != -1)
        dispatch_once(&qword_310958, v16);
      v3 = &qword_310960;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_F8B9C;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_310968 != -1)
        dispatch_once(&qword_310968, v15);
      v3 = &qword_310970;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F8BF0;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_310978 != -1)
        dispatch_once(&qword_310978, v14);
      v3 = &qword_310980;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_F8C44;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_310988 != -1)
        dispatch_once(&qword_310988, v13);
      v3 = &qword_310990;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F8C98;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_310998 != -1)
        dispatch_once(&qword_310998, v12);
      v3 = &qword_3109A0;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_F8CEC;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_3109A8 != -1)
        dispatch_once(&qword_3109A8, v11);
      v3 = &qword_3109B0;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_F8D40;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_3109B8 != -1)
        dispatch_once(&qword_3109B8, v10);
      v3 = &qword_3109C0;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_F8D94;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_3109C8 != -1)
        dispatch_once(&qword_3109C8, v9);
      v3 = &qword_3109D0;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_F8DE8;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_3109D8 != -1)
        dispatch_once(&qword_3109D8, v8);
      v3 = &qword_3109E0;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_F8E3C;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_3109E8 != -1)
        dispatch_once(&qword_3109E8, v7);
      v3 = &qword_3109F0;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_F8E90;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_3109F8 != -1)
        dispatch_once(&qword_3109F8, v6);
      v3 = &qword_310A00;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_F8EE4;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_310A08 != -1)
        dispatch_once(&qword_310A08, v5);
      v3 = &qword_310A10;
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
  block[2] = sub_F8FAC;
  block[3] = &unk_28B960;
  block[4] = self;
  if (qword_310A18 != -1)
    dispatch_once(&qword_310A18, block);
  return byte_310A20;
}

- (int)annotationStyle
{
  return 6;
}

@end
