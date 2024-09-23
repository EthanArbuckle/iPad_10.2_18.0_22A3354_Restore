@implementation BSUIReportIssueNetworkManager

- (void)reportConcern:(id)a3 completion:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4FFE4;
  v7[3] = &unk_2E5F40;
  v8 = a4;
  v6 = v8;
  -[BSUIReportIssueNetworkManager _callOnJSBridge:options:completionHandler:](self, "_callOnJSBridge:options:completionHandler:", CFSTR("reportConcern"), a3, v7);

}

- (void)_callOnJSBridge:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_5019C;
  v14[3] = &unk_2E5008;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  objc_msgSend(v10, "enqueueBlock:file:line:", v14, CFSTR("BSUIReportIssueNetworkManager.m"), 48);

}

@end
