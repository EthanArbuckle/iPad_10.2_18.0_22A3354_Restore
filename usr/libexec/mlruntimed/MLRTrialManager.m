@implementation MLRTrialManager

- (MLRTrialManager)init
{
  void *v3;
  MLRTrialManager *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TRIEvaluationStatus freshProvider](TRIEvaluationStatus, "freshProvider"));
  v4 = -[MLRTrialManager initWithProvider:](self, "initWithProvider:", v3);

  return v4;
}

- (MLRTrialManager)initWithProvider:(id)a3
{
  id v4;
  MLRTrialManager *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *v15;
  unsigned __int8 v16;
  id v17;
  NSObject *v18;
  NSMutableDictionary *shadowExperimentTasks;
  NSMutableDictionary *v20;
  MLRTrialManager *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void **v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *, void *, _BYTE *);
  void *v34;
  NSMutableDictionary *v35;
  id v36;
  objc_super v37;

  v4 = a3;
  if (objc_opt_class(TRIClient))
  {
    v37.receiver = self;
    v37.super_class = (Class)MLRTrialManager;
    v5 = -[MLRTrialManager init](&v37, "init");
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      if (!v4)
      {
        v7 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          sub_100005D38(v7, v8, v9, v10, v11, v12, v13, v14);

      }
      v36 = 0;
      v31 = _NSConcreteStackBlock;
      v32 = 3221225472;
      v33 = sub_100005A58;
      v34 = &unk_100018648;
      v15 = v6;
      v35 = v15;
      v16 = objc_msgSend(v4, "enumerateActiveEvaluationsForMLRuntimeWithError:block:", &v36, &v31);
      v17 = v36;
      if ((v16 & 1) == 0)
      {
        v18 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel", v31, v32, v33, v34));
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_100005CC4((uint64_t)v17, v18);

      }
      shadowExperimentTasks = v5->_shadowExperimentTasks;
      v5->_shadowExperimentTasks = v15;
      v20 = v15;

    }
    self = v5;
    v21 = self;
  }
  else
  {
    v22 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_100005C90(v22, v23, v24, v25, v26, v27, v28, v29);

    v21 = 0;
  }

  return v21;
}

- (id)shadowExperimentTasksForPluginID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v8;

  v4 = a3;
  if (!v4)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("Nil pluginID"), 0));
    objc_exception_throw(v8);
  }
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_shadowExperimentTasks, "objectForKeyedSubscript:", v4));

  return v6;
}

- (NSMutableDictionary)shadowExperimentTasks
{
  return self->_shadowExperimentTasks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowExperimentTasks, 0);
}

@end
