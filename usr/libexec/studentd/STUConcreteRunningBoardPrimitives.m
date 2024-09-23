@implementation STUConcreteRunningBoardPrimitives

- (id)subscribeToLaunchEventsForBundleIdentifier:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessMonitor monitor](RBSProcessMonitor, "monitor"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100047F14;
  v15[3] = &unk_1000CAFC0;
  v16 = v5;
  v17 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "updateConfiguration:", v15);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100048148;
  v13[3] = &unk_1000C97E8;
  v14 = v7;
  v10 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRKBlockCancelable cancelableWithBlock:](CRKBlockCancelable, "cancelableWithBlock:", v13));

  return v11;
}

@end
