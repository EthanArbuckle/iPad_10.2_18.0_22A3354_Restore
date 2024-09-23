@implementation RefineMapItemActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class(RefineMapItemAction);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v8 = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chrome"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentTraits"));

    objc_msgSend(v10, "setSource:", 1);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100874BF0;
    v11[3] = &unk_1011B21D0;
    v12 = v6;
    objc_msgSend(v8, "resolveMapItemWithTraits:completion:", v10, v11);

  }
}

@end
