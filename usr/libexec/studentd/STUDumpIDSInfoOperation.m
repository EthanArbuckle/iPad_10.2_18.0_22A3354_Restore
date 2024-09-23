@implementation STUDumpIDSInfoOperation

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = objc_alloc((Class)CRKDumpIDSInfoResultObject);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[STUEnvironment shared](STUEnvironment, "shared"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "whiteboard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "IDSPrimitives"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "debugInfo"));
  v9 = objc_msgSend(v4, "initWithInfo:", v8);

  -[STUDumpIDSInfoOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v9);
}

@end
