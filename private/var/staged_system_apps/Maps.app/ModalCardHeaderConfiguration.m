@implementation ModalCardHeaderConfiguration

+ (id)defaultModalCardHeaderConfiguration
{
  ModalCardHeaderConfiguration *v2;
  _QWORD *v3;
  id titleFontProvider;
  _QWORD *v5;
  id adaptiveTitleFontProvider;
  _QWORD *v7;
  id leadingButtonFontProvider;
  _QWORD *v9;
  id adaptiveLeadingButtonFontProvider;
  _QWORD *v11;
  id trailingButtonFontProvider;
  _QWORD *v13;
  id adaptiveTrailingButtonFontProvider;
  _QWORD *v15;
  id baselineDistanceFontProvider;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];

  v2 = objc_alloc_init(ModalCardHeaderConfiguration);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1009AAA38;
  v24[3] = &unk_1011DD9E0;
  v24[4] = 0x4031000000000000;
  v3 = objc_retainBlock(v24);
  titleFontProvider = v2->_titleFontProvider;
  v2->_titleFontProvider = v3;

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1009AAA4C;
  v23[3] = &unk_1011DD9E0;
  v23[4] = 0x4031000000000000;
  v5 = objc_retainBlock(v23);
  adaptiveTitleFontProvider = v2->_adaptiveTitleFontProvider;
  v2->_adaptiveTitleFontProvider = v5;

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1009AAA64;
  v22[3] = &unk_1011DD9E0;
  v22[4] = 0x4031000000000000;
  v7 = objc_retainBlock(v22);
  leadingButtonFontProvider = v2->_leadingButtonFontProvider;
  v2->_leadingButtonFontProvider = v7;

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1009AAA78;
  v21[3] = &unk_1011DD9E0;
  v21[4] = 0x4031000000000000;
  v9 = objc_retainBlock(v21);
  adaptiveLeadingButtonFontProvider = v2->_adaptiveLeadingButtonFontProvider;
  v2->_adaptiveLeadingButtonFontProvider = v9;

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1009AAA90;
  v20[3] = &unk_1011DD9E0;
  v20[4] = 0x4031000000000000;
  v11 = objc_retainBlock(v20);
  trailingButtonFontProvider = v2->_trailingButtonFontProvider;
  v2->_trailingButtonFontProvider = v11;

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1009AAAA4;
  v19[3] = &unk_1011DD9E0;
  v19[4] = 0x4031000000000000;
  v13 = objc_retainBlock(v19);
  adaptiveTrailingButtonFontProvider = v2->_adaptiveTrailingButtonFontProvider;
  v2->_adaptiveTrailingButtonFontProvider = v13;

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1009AAABC;
  v18[3] = &unk_1011DD9E0;
  v18[4] = 0x4031000000000000;
  v15 = objc_retainBlock(v18);
  baselineDistanceFontProvider = v2->_baselineDistanceFontProvider;
  v2->_baselineDistanceFontProvider = v15;

  v2->_topToTitleBaselineUnscaledDistance = 37.0;
  v2->_baselineToBottomDistance = 23.0;
  return v2;
}

+ (id)leadingAlignedTitleModalCardHeaderConfiguration
{
  id result;

  result = +[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration](ModalCardHeaderConfiguration, "defaultModalCardHeaderConfiguration");
  *((_BYTE *)result + 8) = 1;
  return result;
}

+ (id)navigationModalCardHeaderConfiguration
{
  ModalCardHeaderConfiguration *v2;
  id titleFontProvider;
  id adaptiveTitleFontProvider;
  id leadingButtonFontProvider;
  id adaptiveLeadingButtonFontProvider;
  id trailingButtonFontProvider;
  id adaptiveTrailingButtonFontProvider;
  id baselineDistanceFontProvider;

  v2 = objc_alloc_init(ModalCardHeaderConfiguration);
  titleFontProvider = v2->_titleFontProvider;
  v2->_titleFontProvider = &stru_1011DDA00;

  adaptiveTitleFontProvider = v2->_adaptiveTitleFontProvider;
  v2->_adaptiveTitleFontProvider = 0;

  leadingButtonFontProvider = v2->_leadingButtonFontProvider;
  v2->_leadingButtonFontProvider = &stru_1011DDA20;

  adaptiveLeadingButtonFontProvider = v2->_adaptiveLeadingButtonFontProvider;
  v2->_adaptiveLeadingButtonFontProvider = 0;

  trailingButtonFontProvider = v2->_trailingButtonFontProvider;
  v2->_trailingButtonFontProvider = &stru_1011DDA40;

  adaptiveTrailingButtonFontProvider = v2->_adaptiveTrailingButtonFontProvider;
  v2->_adaptiveTrailingButtonFontProvider = 0;

  baselineDistanceFontProvider = v2->_baselineDistanceFontProvider;
  v2->_baselineDistanceFontProvider = &stru_1011DDA60;

  v2->_topToTitleBaselineUnscaledDistance = 46.0;
  v2->_baselineToBottomDistance = 29.0;
  return v2;
}

+ (id)navigationModalCardHeaderCompactConfiguration
{
  ModalCardHeaderConfiguration *v2;
  id titleFontProvider;
  id adaptiveTitleFontProvider;
  id leadingButtonFontProvider;
  id adaptiveLeadingButtonFontProvider;
  id trailingButtonFontProvider;
  id adaptiveTrailingButtonFontProvider;
  id baselineDistanceFontProvider;

  v2 = objc_alloc_init(ModalCardHeaderConfiguration);
  titleFontProvider = v2->_titleFontProvider;
  v2->_titleFontProvider = &stru_1011DDA80;

  adaptiveTitleFontProvider = v2->_adaptiveTitleFontProvider;
  v2->_adaptiveTitleFontProvider = 0;

  leadingButtonFontProvider = v2->_leadingButtonFontProvider;
  v2->_leadingButtonFontProvider = &stru_1011DDAA0;

  adaptiveLeadingButtonFontProvider = v2->_adaptiveLeadingButtonFontProvider;
  v2->_adaptiveLeadingButtonFontProvider = 0;

  trailingButtonFontProvider = v2->_trailingButtonFontProvider;
  v2->_trailingButtonFontProvider = &stru_1011DDAC0;

  adaptiveTrailingButtonFontProvider = v2->_adaptiveTrailingButtonFontProvider;
  v2->_adaptiveTrailingButtonFontProvider = 0;

  baselineDistanceFontProvider = v2->_baselineDistanceFontProvider;
  v2->_baselineDistanceFontProvider = &stru_1011DDAE0;

  v2->_topToTitleBaselineUnscaledDistance = 36.0;
  v2->_baselineToBottomDistance = 17.0;
  return v2;
}

+ (id)leadingNavigationModalCardHeaderCompactConfiguration
{
  ModalCardHeaderConfiguration *v2;
  id titleFontProvider;
  id adaptiveTitleFontProvider;
  id trailingButtonFontProvider;
  id adaptiveTrailingButtonFontProvider;
  id baselineDistanceFontProvider;

  v2 = objc_alloc_init(ModalCardHeaderConfiguration);
  titleFontProvider = v2->_titleFontProvider;
  v2->_titleFontProvider = &stru_1011DDB00;

  adaptiveTitleFontProvider = v2->_adaptiveTitleFontProvider;
  v2->_adaptiveTitleFontProvider = 0;

  trailingButtonFontProvider = v2->_trailingButtonFontProvider;
  v2->_trailingButtonFontProvider = &stru_1011DDB20;

  adaptiveTrailingButtonFontProvider = v2->_adaptiveTrailingButtonFontProvider;
  v2->_adaptiveTrailingButtonFontProvider = 0;

  baselineDistanceFontProvider = v2->_baselineDistanceFontProvider;
  v2->_baselineDistanceFontProvider = &stru_1011DDB40;

  v2->_topToTitleBaselineUnscaledDistance = 40.0;
  v2->_baselineToBottomDistance = 9.0;
  v2->_leadingAlignedTitle = 1;
  return v2;
}

+ (id)popoverCardHeaderConfiguration
{
  ModalCardHeaderConfiguration *v2;
  _QWORD *v3;
  id titleFontProvider;
  _QWORD *v5;
  id adaptiveTitleFontProvider;
  _QWORD *v7;
  id leadingButtonFontProvider;
  _QWORD *v9;
  id adaptiveLeadingButtonFontProvider;
  _QWORD *v11;
  id trailingButtonFontProvider;
  _QWORD *v13;
  id adaptiveTrailingButtonFontProvider;
  _QWORD *v15;
  id baselineDistanceFontProvider;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];

  v2 = objc_alloc_init(ModalCardHeaderConfiguration);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1009AAF50;
  v24[3] = &unk_1011DD9E0;
  v24[4] = 0x4034000000000000;
  v3 = objc_retainBlock(v24);
  titleFontProvider = v2->_titleFontProvider;
  v2->_titleFontProvider = v3;

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1009AAF64;
  v23[3] = &unk_1011DD9E0;
  v23[4] = 0x4034000000000000;
  v5 = objc_retainBlock(v23);
  adaptiveTitleFontProvider = v2->_adaptiveTitleFontProvider;
  v2->_adaptiveTitleFontProvider = v5;

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1009AAF7C;
  v22[3] = &unk_1011DD9E0;
  v22[4] = 0x4034000000000000;
  v7 = objc_retainBlock(v22);
  leadingButtonFontProvider = v2->_leadingButtonFontProvider;
  v2->_leadingButtonFontProvider = v7;

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1009AAF90;
  v21[3] = &unk_1011DD9E0;
  v21[4] = 0x4034000000000000;
  v9 = objc_retainBlock(v21);
  adaptiveLeadingButtonFontProvider = v2->_adaptiveLeadingButtonFontProvider;
  v2->_adaptiveLeadingButtonFontProvider = v9;

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1009AAFA8;
  v20[3] = &unk_1011DD9E0;
  v20[4] = 0x4034000000000000;
  v11 = objc_retainBlock(v20);
  trailingButtonFontProvider = v2->_trailingButtonFontProvider;
  v2->_trailingButtonFontProvider = v11;

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1009AAFBC;
  v19[3] = &unk_1011DD9E0;
  v19[4] = 0x4034000000000000;
  v13 = objc_retainBlock(v19);
  adaptiveTrailingButtonFontProvider = v2->_adaptiveTrailingButtonFontProvider;
  v2->_adaptiveTrailingButtonFontProvider = v13;

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1009AAFD4;
  v18[3] = &unk_1011DD9E0;
  v18[4] = 0x4034000000000000;
  v15 = objc_retainBlock(v18);
  baselineDistanceFontProvider = v2->_baselineDistanceFontProvider;
  v2->_baselineDistanceFontProvider = v15;

  v2->_topToTitleBaselineUnscaledDistance = 32.0;
  v2->_baselineToBottomDistance = 12.0;
  v2->_leadingAlignedTitle = 1;
  return v2;
}

+ (id)leadingInsetConfiguration
{
  id result;

  result = +[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration](ModalCardHeaderConfiguration, "defaultModalCardHeaderConfiguration");
  *((_QWORD *)result + 11) = 0x4030000000000000;
  return result;
}

+ (id)routePlanningTimingPickerConfiguration
{
  _QWORD *v2;
  void *v3;
  void *v4;

  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "leadingInsetConfiguration"));
  v3 = (void *)v2[7];
  v2[7] = &stru_1011DDB60;

  v4 = (void *)v2[8];
  v2[8] = 0;

  return v2;
}

+ (id)libraryCenteredConfiguration
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultModalCardHeaderConfiguration"));
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = &stru_1011DDB80;

  v4 = objc_retainBlock(*(id *)(v2 + 56));
  v5 = *(void **)(v2 + 64);
  *(_QWORD *)(v2 + 64) = v4;

  return (id)v2;
}

- (BOOL)leadingAlignedTitle
{
  return self->_leadingAlignedTitle;
}

- (double)topToTitleBaselineUnscaledDistance
{
  return self->_topToTitleBaselineUnscaledDistance;
}

- (id)baselineDistanceFontProvider
{
  return self->_baselineDistanceFontProvider;
}

- (double)baselineToBottomDistance
{
  return self->_baselineToBottomDistance;
}

- (id)leadingButtonFontProvider
{
  return self->_leadingButtonFontProvider;
}

- (id)adaptiveLeadingButtonFontProvider
{
  return self->_adaptiveLeadingButtonFontProvider;
}

- (id)titleFontProvider
{
  return self->_titleFontProvider;
}

- (id)adaptiveTitleFontProvider
{
  return self->_adaptiveTitleFontProvider;
}

- (id)trailingButtonFontProvider
{
  return self->_trailingButtonFontProvider;
}

- (id)adaptiveTrailingButtonFontProvider
{
  return self->_adaptiveTrailingButtonFontProvider;
}

- (double)hairlineLeadingInset
{
  return self->_hairlineLeadingInset;
}

- (double)hairlineTrailingInset
{
  return self->_hairlineTrailingInset;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_adaptiveTrailingButtonFontProvider, 0);
  objc_storeStrong(&self->_trailingButtonFontProvider, 0);
  objc_storeStrong(&self->_adaptiveTitleFontProvider, 0);
  objc_storeStrong(&self->_titleFontProvider, 0);
  objc_storeStrong(&self->_adaptiveLeadingButtonFontProvider, 0);
  objc_storeStrong(&self->_leadingButtonFontProvider, 0);
  objc_storeStrong(&self->_baselineDistanceFontProvider, 0);
}

@end
