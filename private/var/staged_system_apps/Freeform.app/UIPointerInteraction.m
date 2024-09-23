@implementation UIPointerInteraction

+ (id)crl_toolbarPointerStyleProvider
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(a1, "crl_toolbarRoundedRectWidth");
  v4 = v3;
  objc_msgSend(a1, "crl_toolbarRoundedRectHeight");
  v6 = v5;
  objc_msgSend(a1, "crl_toolbarRoundedRectCornerRadius");
  return _objc_msgSend(a1, "p_roundedRectProviderWithSize:cornerRadius:", v4, v6, v7);
}

+ (double)crl_toolbarRoundedRectWidth
{
  return 51.0;
}

+ (double)crl_toolbarRoundedRectHeight
{
  return 37.0;
}

+ (double)crl_toolbarRoundedRectCornerRadius
{
  return 8.0;
}

+ (id)p_roundedRectProviderWithSize:(CGSize)a3 cornerRadius:(double)a4
{
  _QWORD v5[4];
  CGSize v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100258234;
  v5[3] = &unk_101248420;
  v6 = a3;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_roundedRectProviderWithCornerRadius:width:heightBlock:", v5, a4, a3.width));
}

+ (id)p_roundedRectProviderWithCornerRadius:(double)a3 width:(double)a4 heightBlock:(id)a5
{
  id v7;
  _QWORD *v8;
  _QWORD v10[4];
  id v11;
  double v12;
  double v13;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002582C8;
  v10[3] = &unk_101248448;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v7 = v11;
  v8 = objc_retainBlock(v10);

  return v8;
}

@end
