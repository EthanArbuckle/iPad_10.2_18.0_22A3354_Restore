@implementation AEAnnotationThemeBlue

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
      block[2] = sub_DD194;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30E4A8 != -1)
        dispatch_once(&qword_30E4A8, block);
      v3 = &qword_30E4B0;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_DD1E8;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30E4B8 != -1)
        dispatch_once(&qword_30E4B8, v20);
      v3 = &qword_30E4C0;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_DD23C;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30E4C8 != -1)
        dispatch_once(&qword_30E4C8, v19);
      v3 = &qword_30E4D0;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_DD290;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30E4D8 != -1)
        dispatch_once(&qword_30E4D8, v18);
      v3 = &qword_30E4E0;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_DD2E4;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30E4E8 != -1)
        dispatch_once(&qword_30E4E8, v17);
      v3 = &qword_30E4F0;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_DD338;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30E4F8 != -1)
        dispatch_once(&qword_30E4F8, v16);
      v3 = &qword_30E500;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_DD38C;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30E508 != -1)
        dispatch_once(&qword_30E508, v15);
      v3 = &qword_30E510;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_DD3E0;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30E518 != -1)
        dispatch_once(&qword_30E518, v14);
      v3 = &qword_30E520;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_DD434;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30E528 != -1)
        dispatch_once(&qword_30E528, v13);
      v3 = &qword_30E530;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_DD488;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30E538 != -1)
        dispatch_once(&qword_30E538, v12);
      v3 = &qword_30E540;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_DD4DC;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30E548 != -1)
        dispatch_once(&qword_30E548, v11);
      v3 = &qword_30E550;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_DD530;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30E558 != -1)
        dispatch_once(&qword_30E558, v10);
      v3 = &qword_30E560;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_DD584;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30E568 != -1)
        dispatch_once(&qword_30E568, v9);
      v3 = &qword_30E570;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_DD5D8;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30E578 != -1)
        dispatch_once(&qword_30E578, v8);
      v3 = &qword_30E580;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_DD62C;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30E588 != -1)
        dispatch_once(&qword_30E588, v7);
      v3 = &qword_30E590;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_DD680;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30E598 != -1)
        dispatch_once(&qword_30E598, v6);
      v3 = &qword_30E5A0;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_DD6D4;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30E5A8 != -1)
        dispatch_once(&qword_30E5A8, v5);
      v3 = &qword_30E5B0;
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
      block[2] = sub_DDE6C;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30E5B8 != -1)
        dispatch_once(&qword_30E5B8, block);
      v3 = &qword_30E5C0;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_DDEC0;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30E5C8 != -1)
        dispatch_once(&qword_30E5C8, v20);
      v3 = &qword_30E5D0;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_DDF14;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30E5D8 != -1)
        dispatch_once(&qword_30E5D8, v19);
      v3 = &qword_30E5E0;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_DDF68;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30E5E8 != -1)
        dispatch_once(&qword_30E5E8, v18);
      v3 = &qword_30E5F0;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_DDFBC;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30E5F8 != -1)
        dispatch_once(&qword_30E5F8, v17);
      v3 = &qword_30E600;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_DE010;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30E608 != -1)
        dispatch_once(&qword_30E608, v16);
      v3 = &qword_30E610;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_DE064;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30E618 != -1)
        dispatch_once(&qword_30E618, v15);
      v3 = &qword_30E620;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_DE0B8;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30E628 != -1)
        dispatch_once(&qword_30E628, v14);
      v3 = &qword_30E630;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_DE10C;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30E638 != -1)
        dispatch_once(&qword_30E638, v13);
      v3 = &qword_30E640;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_DE160;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30E648 != -1)
        dispatch_once(&qword_30E648, v12);
      v3 = &qword_30E650;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_DE1B4;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30E658 != -1)
        dispatch_once(&qword_30E658, v11);
      v3 = &qword_30E660;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_DE208;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30E668 != -1)
        dispatch_once(&qword_30E668, v10);
      v3 = &qword_30E670;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_DE25C;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30E678 != -1)
        dispatch_once(&qword_30E678, v9);
      v3 = &qword_30E680;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_DE2B0;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30E688 != -1)
        dispatch_once(&qword_30E688, v8);
      v3 = &qword_30E690;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_DE304;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30E698 != -1)
        dispatch_once(&qword_30E698, v7);
      v3 = &qword_30E6A0;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_DE358;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30E6A8 != -1)
        dispatch_once(&qword_30E6A8, v6);
      v3 = &qword_30E6B0;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_DE3AC;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30E6B8 != -1)
        dispatch_once(&qword_30E6B8, v5);
      v3 = &qword_30E6C0;
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
      block[2] = sub_DEB44;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30E6C8 != -1)
        dispatch_once(&qword_30E6C8, block);
      v3 = &qword_30E6D0;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_DEB98;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30E6D8 != -1)
        dispatch_once(&qword_30E6D8, v20);
      v3 = &qword_30E6E0;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_DEBEC;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30E6E8 != -1)
        dispatch_once(&qword_30E6E8, v19);
      v3 = &qword_30E6F0;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_DEC40;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30E6F8 != -1)
        dispatch_once(&qword_30E6F8, v18);
      v3 = &qword_30E700;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_DEC94;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30E708 != -1)
        dispatch_once(&qword_30E708, v17);
      v3 = &qword_30E710;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_DECE8;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30E718 != -1)
        dispatch_once(&qword_30E718, v16);
      v3 = &qword_30E720;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_DED3C;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30E728 != -1)
        dispatch_once(&qword_30E728, v15);
      v3 = &qword_30E730;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_DED90;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30E738 != -1)
        dispatch_once(&qword_30E738, v14);
      v3 = &qword_30E740;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_DEDE4;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30E748 != -1)
        dispatch_once(&qword_30E748, v13);
      v3 = &qword_30E750;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_DEE38;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30E758 != -1)
        dispatch_once(&qword_30E758, v12);
      v3 = &qword_30E760;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_DEE8C;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30E768 != -1)
        dispatch_once(&qword_30E768, v11);
      v3 = &qword_30E770;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_DEEE0;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30E778 != -1)
        dispatch_once(&qword_30E778, v10);
      v3 = &qword_30E780;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_DEF34;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30E788 != -1)
        dispatch_once(&qword_30E788, v9);
      v3 = &qword_30E790;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_DEF88;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30E798 != -1)
        dispatch_once(&qword_30E798, v8);
      v3 = &qword_30E7A0;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_DEFDC;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30E7A8 != -1)
        dispatch_once(&qword_30E7A8, v7);
      v3 = &qword_30E7B0;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_DF030;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30E7B8 != -1)
        dispatch_once(&qword_30E7B8, v6);
      v3 = &qword_30E7C0;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_DF084;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30E7C8 != -1)
        dispatch_once(&qword_30E7C8, v5);
      v3 = &qword_30E7D0;
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
      block[2] = sub_DF81C;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30E7D8 != -1)
        dispatch_once(&qword_30E7D8, block);
      v3 = &qword_30E7E0;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_DF870;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30E7E8 != -1)
        dispatch_once(&qword_30E7E8, v20);
      v3 = &qword_30E7F0;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_DF8C4;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30E7F8 != -1)
        dispatch_once(&qword_30E7F8, v19);
      v3 = &qword_30E800;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_DF918;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30E808 != -1)
        dispatch_once(&qword_30E808, v18);
      v3 = &qword_30E810;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_DF96C;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30E818 != -1)
        dispatch_once(&qword_30E818, v17);
      v3 = &qword_30E820;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_DF9C0;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30E828 != -1)
        dispatch_once(&qword_30E828, v16);
      v3 = &qword_30E830;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_DFA14;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30E838 != -1)
        dispatch_once(&qword_30E838, v15);
      v3 = &qword_30E840;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_DFA68;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30E848 != -1)
        dispatch_once(&qword_30E848, v14);
      v3 = &qword_30E850;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_DFABC;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30E858 != -1)
        dispatch_once(&qword_30E858, v13);
      v3 = &qword_30E860;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_DFB10;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30E868 != -1)
        dispatch_once(&qword_30E868, v12);
      v3 = &qword_30E870;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_DFB64;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30E878 != -1)
        dispatch_once(&qword_30E878, v11);
      v3 = &qword_30E880;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_DFBB8;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30E888 != -1)
        dispatch_once(&qword_30E888, v10);
      v3 = &qword_30E890;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_DFC0C;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30E898 != -1)
        dispatch_once(&qword_30E898, v9);
      v3 = &qword_30E8A0;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_DFC60;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30E8A8 != -1)
        dispatch_once(&qword_30E8A8, v8);
      v3 = &qword_30E8B0;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_DFCB4;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30E8B8 != -1)
        dispatch_once(&qword_30E8B8, v7);
      v3 = &qword_30E8C0;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_DFD08;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30E8C8 != -1)
        dispatch_once(&qword_30E8C8, v6);
      v3 = &qword_30E8D0;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_DFD5C;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30E8D8 != -1)
        dispatch_once(&qword_30E8D8, v5);
      v3 = &qword_30E8E0;
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
      block[2] = sub_E04F4;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30E8E8 != -1)
        dispatch_once(&qword_30E8E8, block);
      v3 = &qword_30E8F0;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_E0548;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30E8F8 != -1)
        dispatch_once(&qword_30E8F8, v20);
      v3 = &qword_30E900;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_E059C;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30E908 != -1)
        dispatch_once(&qword_30E908, v19);
      v3 = &qword_30E910;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_E05F0;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30E918 != -1)
        dispatch_once(&qword_30E918, v18);
      v3 = &qword_30E920;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_E0644;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30E928 != -1)
        dispatch_once(&qword_30E928, v17);
      v3 = &qword_30E930;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_E0698;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30E938 != -1)
        dispatch_once(&qword_30E938, v16);
      v3 = &qword_30E940;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_E06EC;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30E948 != -1)
        dispatch_once(&qword_30E948, v15);
      v3 = &qword_30E950;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_E0740;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30E958 != -1)
        dispatch_once(&qword_30E958, v14);
      v3 = &qword_30E960;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_E0794;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30E968 != -1)
        dispatch_once(&qword_30E968, v13);
      v3 = &qword_30E970;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_E07E8;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30E978 != -1)
        dispatch_once(&qword_30E978, v12);
      v3 = &qword_30E980;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_E083C;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30E988 != -1)
        dispatch_once(&qword_30E988, v11);
      v3 = &qword_30E990;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_E0890;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30E998 != -1)
        dispatch_once(&qword_30E998, v10);
      v3 = &qword_30E9A0;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_E08E4;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30E9A8 != -1)
        dispatch_once(&qword_30E9A8, v9);
      v3 = &qword_30E9B0;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_E0938;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30E9B8 != -1)
        dispatch_once(&qword_30E9B8, v8);
      v3 = &qword_30E9C0;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_E098C;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30E9C8 != -1)
        dispatch_once(&qword_30E9C8, v7);
      v3 = &qword_30E9D0;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_E09E0;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30E9D8 != -1)
        dispatch_once(&qword_30E9D8, v6);
      v3 = &qword_30E9E0;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_E0A34;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30E9E8 != -1)
        dispatch_once(&qword_30E9E8, v5);
      v3 = &qword_30E9F0;
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
      block[2] = sub_E11CC;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30E9F8 != -1)
        dispatch_once(&qword_30E9F8, block);
      v3 = &qword_30EA00;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_E1220;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30EA08 != -1)
        dispatch_once(&qword_30EA08, v20);
      v3 = &qword_30EA10;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_E1274;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30EA18 != -1)
        dispatch_once(&qword_30EA18, v19);
      v3 = &qword_30EA20;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_E12C8;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30EA28 != -1)
        dispatch_once(&qword_30EA28, v18);
      v3 = &qword_30EA30;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_E131C;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30EA38 != -1)
        dispatch_once(&qword_30EA38, v17);
      v3 = &qword_30EA40;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_E1370;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30EA48 != -1)
        dispatch_once(&qword_30EA48, v16);
      v3 = &qword_30EA50;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_E13C4;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30EA58 != -1)
        dispatch_once(&qword_30EA58, v15);
      v3 = &qword_30EA60;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_E1418;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30EA68 != -1)
        dispatch_once(&qword_30EA68, v14);
      v3 = &qword_30EA70;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_E146C;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30EA78 != -1)
        dispatch_once(&qword_30EA78, v13);
      v3 = &qword_30EA80;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_E14C0;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30EA88 != -1)
        dispatch_once(&qword_30EA88, v12);
      v3 = &qword_30EA90;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_E1514;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30EA98 != -1)
        dispatch_once(&qword_30EA98, v11);
      v3 = &qword_30EAA0;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_E1568;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30EAA8 != -1)
        dispatch_once(&qword_30EAA8, v10);
      v3 = &qword_30EAB0;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_E15BC;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30EAB8 != -1)
        dispatch_once(&qword_30EAB8, v9);
      v3 = &qword_30EAC0;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_E1610;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30EAC8 != -1)
        dispatch_once(&qword_30EAC8, v8);
      v3 = &qword_30EAD0;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_E1664;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30EAD8 != -1)
        dispatch_once(&qword_30EAD8, v7);
      v3 = &qword_30EAE0;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_E16B8;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30EAE8 != -1)
        dispatch_once(&qword_30EAE8, v6);
      v3 = &qword_30EAF0;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_E170C;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30EAF8 != -1)
        dispatch_once(&qword_30EAF8, v5);
      v3 = &qword_30EB00;
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
      block[2] = sub_E1EA4;
      block[3] = &unk_28B938;
      block[4] = self;
      block[5] = 0;
      if (qword_30EB08 != -1)
        dispatch_once(&qword_30EB08, block);
      v3 = &qword_30EB10;
      goto LABEL_54;
    case 1:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_E1EF8;
      v20[3] = &unk_28B938;
      v20[4] = self;
      v20[5] = 1;
      if (qword_30EB18 != -1)
        dispatch_once(&qword_30EB18, v20);
      v3 = &qword_30EB20;
      goto LABEL_54;
    case 2:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_E1F4C;
      v19[3] = &unk_28B938;
      v19[4] = self;
      v19[5] = 2;
      if (qword_30EB28 != -1)
        dispatch_once(&qword_30EB28, v19);
      v3 = &qword_30EB30;
      goto LABEL_54;
    case 3:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_E1FA0;
      v18[3] = &unk_28B938;
      v18[4] = self;
      v18[5] = 3;
      if (qword_30EB38 != -1)
        dispatch_once(&qword_30EB38, v18);
      v3 = &qword_30EB40;
      goto LABEL_54;
    case 4:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_E1FF4;
      v17[3] = &unk_28B938;
      v17[4] = self;
      v17[5] = 4;
      if (qword_30EB48 != -1)
        dispatch_once(&qword_30EB48, v17);
      v3 = &qword_30EB50;
      goto LABEL_54;
    case 5:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_E2048;
      v16[3] = &unk_28B938;
      v16[4] = self;
      v16[5] = 5;
      if (qword_30EB58 != -1)
        dispatch_once(&qword_30EB58, v16);
      v3 = &qword_30EB60;
      goto LABEL_54;
    case 6:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_E209C;
      v15[3] = &unk_28B938;
      v15[4] = self;
      v15[5] = 6;
      if (qword_30EB68 != -1)
        dispatch_once(&qword_30EB68, v15);
      v3 = &qword_30EB70;
      goto LABEL_54;
    case 7:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_E20F0;
      v14[3] = &unk_28B938;
      v14[4] = self;
      v14[5] = 7;
      if (qword_30EB78 != -1)
        dispatch_once(&qword_30EB78, v14);
      v3 = &qword_30EB80;
      goto LABEL_54;
    case 8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_E2144;
      v13[3] = &unk_28B938;
      v13[4] = self;
      v13[5] = 8;
      if (qword_30EB88 != -1)
        dispatch_once(&qword_30EB88, v13);
      v3 = &qword_30EB90;
      goto LABEL_54;
    case 9:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_E2198;
      v12[3] = &unk_28B938;
      v12[4] = self;
      v12[5] = 9;
      if (qword_30EB98 != -1)
        dispatch_once(&qword_30EB98, v12);
      v3 = &qword_30EBA0;
      goto LABEL_54;
    case 0xALL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_E21EC;
      v11[3] = &unk_28B938;
      v11[4] = self;
      v11[5] = 10;
      if (qword_30EBA8 != -1)
        dispatch_once(&qword_30EBA8, v11);
      v3 = &qword_30EBB0;
      goto LABEL_54;
    case 0xBLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_E2240;
      v10[3] = &unk_28B938;
      v10[4] = self;
      v10[5] = 11;
      if (qword_30EBB8 != -1)
        dispatch_once(&qword_30EBB8, v10);
      v3 = &qword_30EBC0;
      goto LABEL_54;
    case 0xCLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_E2294;
      v9[3] = &unk_28B938;
      v9[4] = self;
      v9[5] = 12;
      if (qword_30EBC8 != -1)
        dispatch_once(&qword_30EBC8, v9);
      v3 = &qword_30EBD0;
      goto LABEL_54;
    case 0xDLL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_E22E8;
      v8[3] = &unk_28B938;
      v8[4] = self;
      v8[5] = 13;
      if (qword_30EBD8 != -1)
        dispatch_once(&qword_30EBD8, v8);
      v3 = &qword_30EBE0;
      goto LABEL_54;
    case 0xELL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_E233C;
      v7[3] = &unk_28B938;
      v7[4] = self;
      v7[5] = 14;
      if (qword_30EBE8 != -1)
        dispatch_once(&qword_30EBE8, v7);
      v3 = &qword_30EBF0;
      goto LABEL_54;
    case 0xFLL:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_E2390;
      v6[3] = &unk_28B938;
      v6[4] = self;
      v6[5] = 15;
      if (qword_30EBF8 != -1)
        dispatch_once(&qword_30EBF8, v6);
      v3 = &qword_30EC00;
      goto LABEL_54;
    case 0x10:
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_E23E4;
      v5[3] = &unk_28B938;
      v5[4] = self;
      v5[5] = 16;
      if (qword_30EC08 != -1)
        dispatch_once(&qword_30EC08, v5);
      v3 = &qword_30EC10;
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
  block[2] = sub_E24AC;
  block[3] = &unk_28B960;
  block[4] = self;
  if (qword_30EC18 != -1)
    dispatch_once(&qword_30EC18, block);
  return byte_30EC20;
}

- (int)annotationStyle
{
  return 2;
}

@end
