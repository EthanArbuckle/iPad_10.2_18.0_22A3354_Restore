@implementation JSAParentalApproval

+ (void)approveInPerson:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v6 = a3;
  if (a4)
  {
    v7 = a4;
    a4 = (id)objc_claimAutoreleasedReturnValue(+[JSManagedValue managedValueWithValue:andOwner:](JSManagedValue, "managedValueWithValue:andOwner:", v7, a1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "context"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "virtualMachine"));
  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_756C;
  v14[3] = &unk_9DEC8;
  v15 = a4;
  v16 = v6;
  v17 = v9;
  v18 = a1;
  v11 = v9;
  v12 = v6;
  v13 = a4;
  +[APRequestHandler localApproveRequestWithItemIdentifier:completion:](APRequestHandler, "localApproveRequestWithItemIdentifier:completion:", v10, v14);

}

+ (void)approveCurrentRequest
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("kJSAParentalApprovalApprovedRequestNotificationName"), a1);

}

+ (void)declineCurrentRequest
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("kJSAParentalApprovalDeclinedRequestNotificationName"), a1);

}

@end
