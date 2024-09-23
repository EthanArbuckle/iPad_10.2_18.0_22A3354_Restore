@implementation APMetricPreparedUnsignedDataProcessor

- (void)_processNextFile:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_alloc((Class)APSigningAuthority);
  v9 = (objc_class *)objc_opt_class(self);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_msgSend(v8, "initWithPoolName:", v11);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100125508;
  v15[3] = &unk_1002158F8;
  objc_copyWeak(&v18, &location);
  v13 = v6;
  v16 = v13;
  v14 = v7;
  v17 = v14;
  objc_msgSend(v12, "setupWithCompletion:completion:", 1, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)_signFile:(id)a3 usingSigningAuthority:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  id v38;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = (void *)os_transaction_create("com.apple.ap.prepareunsigneddata");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricPreparedUnsignedDataProcessor metricsFileManager](self, "metricsFileManager"));
  v36 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fileForReadingAtKeyPath:error:", v8, &v36));
  v14 = v36;

  if (!v14)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nextObject"));
    v18 = v17;
    if (v17)
    {
      v35 = 0;
      v19 = objc_msgSend(v17, "buildSignatureUsingSigningAuthority:error:", v9, &v35);
      v20 = v35;
      if (v20
        || (v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "signature")),
            v25 = objc_msgSend(v24, "length"),
            v24,
            !v25))
      {
        APSimulateCrashNoKillProcess(5, CFSTR("Failed to generate a signature: %@"));
      }
      else
      {
        v26 = objc_claimAutoreleasedReturnValue(+[APMetricStorage_private signedPathFromUnsigned:](APMetricStorage_private, "signedPathFromUnsigned:", v8));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricPreparedUnsignedDataProcessor metricsFileManager](self, "metricsFileManager"));
        v34 = 0;
        v32 = (void *)v26;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "fileForWritingAtKeyPath:error:", v26, &v34));
        v29 = v34;

        v33 = v29;
        objc_msgSend(v28, "addObject:error:", v18, &v33);
        v20 = v33;

        objc_msgSend(v28, "close");
        if (self && self->_fileProcessedBlock)
          (*((void (**)(void))self->_fileProcessedBlock + 2))();
        if (v20)
        {
          v30 = APLogForCategory(29);
          v31 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v38 = v20;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to save a file: %{public}@", buf, 0xCu);
          }
        }
        else
        {
          v31 = objc_claimAutoreleasedReturnValue(-[APMetricPreparedUnsignedDataProcessor metricsFileManager](self, "metricsFileManager"));
          -[NSObject removeObjectAtPath:error:](v31, "removeObjectAtPath:error:", v8, 0);
        }

      }
      v14 = v20;
      if (!v10)
        goto LABEL_24;
    }
    else
    {
      v21 = APLogForCategory(29);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v38 = v8;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to read data from %{public}@", buf, 0xCu);
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricPreparedUnsignedDataProcessor metricsFileManager](self, "metricsFileManager"));
      objc_msgSend(v23, "removeObjectAtPath:error:", v8, 0);

      v20 = 0;
      v14 = 0;
      if (!v10)
        goto LABEL_24;
    }
    v10[2](v10);
    v14 = v20;
LABEL_24:

    goto LABEL_25;
  }
  v15 = APLogForCategory(29);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v38 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to open metrics data file: %{public}@", buf, 0xCu);
  }

  if (v10)
    v10[2](v10);
LABEL_25:

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (APMetricStoringEC)storage
{
  return (APMetricStoringEC *)objc_loadWeakRetained((id *)&self->_storage);
}

- (void)setStorage:(id)a3
{
  objc_storeWeak((id *)&self->_storage, a3);
}

- (APSequentialProcessor)processor
{
  return self->_processor;
}

- (void)setProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_processor, a3);
}

- (APStorageManager)metricsFileManager
{
  return self->_metricsFileManager;
}

- (void)setMetricsFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_metricsFileManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsFileManager, 0);
  objc_storeStrong((id *)&self->_processor, 0);
  objc_destroyWeak((id *)&self->_storage);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_fileProcessedBlock, 0);
}

@end
