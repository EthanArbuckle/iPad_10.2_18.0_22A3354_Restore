@implementation DMDDeclarationActionOperation

- (void)endOperationMarkingPayloadMetadata:(id)a3 failedWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];

  v11[0] = DMFDeclarationStatusFailed;
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
