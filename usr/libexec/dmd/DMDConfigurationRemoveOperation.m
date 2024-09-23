@implementation DMDConfigurationRemoveOperation

- (void)main
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10002F50C;
  v2[3] = &unk_1000BA528;
  v2[4] = self;
  -[DMDPayloadActionOperation performBackgroundContextBlock:](self, "performBackgroundContextBlock:", v2);
}

- (void)removalOperationDidFinish:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002FC48;
  v11[3] = &unk_1000BA5F8;
  v11[4] = self;
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
  v13 = v7;
  v14 = v6;
  v8 = v6;
  v9 = v7;
  v10 = v12;
  -[DMDPayloadActionOperation performBackgroundContextBlock:](self, "performBackgroundContextBlock:", v11);

}

- (void)endOperationMarkingPayloadMetadata:(id)a3 failedWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];

  v11[0] = DMFDeclarationStatusFailedRemove;
  v10[0] = DMFDeclarationStateStatusKey;
  v10[1] = DMFDeclarationStateErrorChainKey;
  v6 = a3;
  v7 = DMDErrorChainFromError(a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v11[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
  -[DMDPayloadActionOperation addStatusEntriesFromDictionary:](self, "addStatusEntriesFromDictionary:", v9);

  objc_msgSend(v6, "setFailed:", 1);
  -[DMDPayloadActionOperation endOperationWithPayloadMetadata:](self, "endOperationWithPayloadMetadata:", v6);

}

@end
