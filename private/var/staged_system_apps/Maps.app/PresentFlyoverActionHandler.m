@implementation PresentFlyoverActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class(PresentFlyoverAction);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100B83534;
    v8[3] = &unk_1011E7438;
    v9 = v6;
    objc_msgSend(v5, "resolveFlyoverWithCompletion:", v8);

  }
}

@end
