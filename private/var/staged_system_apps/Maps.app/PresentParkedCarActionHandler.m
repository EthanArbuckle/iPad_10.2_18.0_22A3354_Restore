@implementation PresentParkedCarActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class(PresentParkedCarAction);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v8 = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chrome"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ParkedCarManager sharedManager](ParkedCarManager, "sharedManager"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1002B80F0;
    v13[3] = &unk_1011AFBC8;
    v14 = v6;
    v15 = v9;
    v16 = v8;
    v11 = v8;
    v12 = v9;
    objc_msgSend(v10, "fetchParkedCar:", v13);

  }
}

@end
