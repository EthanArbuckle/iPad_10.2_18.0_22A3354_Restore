@implementation VUIActionPromise

- (VUIActionPromise)initWithContextData:(id)a3 appContext:(id)a4
{
  id v7;
  id v8;
  VUIActionPromise *v9;
  VUIActionPromise *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VUIActionPromise;
  v9 = -[VUIActionPromise init](&v12, sel_init);
  v10 = v9;
  if (v7 && v9)
  {
    objc_storeStrong((id *)&v9->_contextDataDictionary, a3);
    objc_storeWeak((id *)&v10->_appContext, v8);
  }
  else
  {

    v10 = 0;
  }

  return v10;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, uint64_t);
  id WeakRetained;
  void *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  void *v11;

  v5 = (void (**)(id, uint64_t))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  v7 = WeakRetained;
  if (self->_contextDataDictionary)
    v8 = WeakRetained == 0;
  else
    v8 = 1;
  if (v8)
  {
    VUIDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[VUIActionPromise performWithTargetResponder:completionHandler:].cold.1(v9);

    if (v5)
      goto LABEL_11;
  }
  else
  {
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "openURLHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "processEntityWithContextData:appContext:", self->_contextDataDictionary, v7);

    if (v5)
LABEL_11:
      v5[2](v5, 1);
  }

}

- (NSDictionary)contextDataDictionary
{
  return self->_contextDataDictionary;
}

- (VUIAppContext)appContext
{
  return (VUIAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (void)setAppContext:(id)a3
{
  objc_storeWeak((id *)&self->_appContext, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_contextDataDictionary, 0);
}

- (void)performWithTargetResponder:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "VUIActionPromise failed", v1, 2u);
}

@end
