@implementation _PXTapToRadarDiagnosticCollectionOperation

- (_PXTapToRadarDiagnosticCollectionOperation)initWithName:(id)a3 timeout:(double)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  dispatch_group_t v10;
  void *v11;
  dispatch_time_t v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_PXTapToRadarDiagnosticCollectionOperation;
  v7 = -[_PXTapToRadarDiagnosticCollectionOperation init](&v17, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    v9 = (void *)*((_QWORD *)v7 + 4);
    *((_QWORD *)v7 + 4) = v8;

    v10 = dispatch_group_create();
    v11 = (void *)*((_QWORD *)v7 + 1);
    *((_QWORD *)v7 + 1) = v10;

    dispatch_group_enter(*((dispatch_group_t *)v7 + 1));
    objc_initWeak(&location, v7);
    v12 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __67___PXTapToRadarDiagnosticCollectionOperation_initWithName_timeout___block_invoke;
    v14[3] = &unk_1E5148D30;
    objc_copyWeak(&v15, &location);
    dispatch_after(v12, MEMORY[0x1E0C80D38], v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return (_PXTapToRadarDiagnosticCollectionOperation *)v7;
}

- (void)installCompletionHandler:(id)a3
{
  id v4;
  NSObject *completionGroup;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  completionGroup = self->_completionGroup;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71___PXTapToRadarDiagnosticCollectionOperation_installCompletionHandler___block_invoke;
  v7[3] = &unk_1E5148CE0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_group_notify(completionGroup, MEMORY[0x1E0C80D38], v7);

}

- (void)_timedOut
{
  uint64_t v2;
  NSError *error;
  _PXTapToRadarDiagnosticCollectionOperation *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!obj->_ended)
  {
    obj->_timedOut = 1;
    obj->_success = 0;
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Diagnostic collection operation “%@” timed out"), obj->_name);
    v2 = objc_claimAutoreleasedReturnValue();
    error = obj->_error;
    obj->_error = (NSError *)v2;

    dispatch_group_leave((dispatch_group_t)obj->_completionGroup);
  }
  objc_sync_exit(obj);

}

- (void)endWithSuccess:(BOOL)a3 error:(id)a4
{
  id v7;
  _PXTapToRadarDiagnosticCollectionOperation *v8;
  NSObject *v9;
  int v10;
  _PXTapToRadarDiagnosticCollectionOperation *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (v8->_ended)
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v8;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "%@ unexpectedly ended more than once", (uint8_t *)&v10, 0xCu);
    }

  }
  v8->_ended = 1;
  if (!v8->_timedOut)
  {
    v8->_success = a3;
    objc_storeStrong((id *)&v8->_error, a4);
    dispatch_group_leave((dispatch_group_t)v8->_completionGroup);
  }
  objc_sync_exit(v8);

}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_completionGroup, 0);
}

@end
