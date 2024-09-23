@implementation RAPEntryPointViewControllerFactory

+ (void)createViewControllerWithEntryPointProvider:(id)a3 appStateCreator:(id)a4 completion:(id)a5 wasCancelled:(id)a6 willSend:(id)a7 wasSent:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (v13)
  {
    v18 = a4;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100374020;
    v20[3] = &unk_1011B3108;
    v21 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v23 = v15;
    v22 = v13;
    v24 = v16;
    v25 = v17;
    v26 = v14;
    v19 = v21;
    objc_msgSend(v18, "createReportAProblemAppStateWithCompletion:", v20);

  }
}

@end
