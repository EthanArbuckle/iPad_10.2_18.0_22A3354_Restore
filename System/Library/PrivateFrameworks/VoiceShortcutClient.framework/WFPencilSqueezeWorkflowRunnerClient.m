@implementation WFPencilSqueezeWorkflowRunnerClient

- (WFPencilSqueezeWorkflowRunnerClient)initWithSystemAction:(id)a3 preciseTimeStamp:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  WFPencilSqueezeWorkflowRunnerClient *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v19;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFPencilSqueezeWorkflowRunnerClient.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("systemAction"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFPencilSqueezeWorkflowRunnerClient.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preciseTimestamp"));

LABEL_3:
  getWFStaccatoLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "-[WFPencilSqueezeWorkflowRunnerClient initWithSystemAction:preciseTimeStamp:]";
    v24 = 2048;
    v25 = v9;
    v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_1AF681000, v10, OS_LOG_TYPE_DEFAULT, "%s Initializing B532 runner - preciseTimestamp: %p, action: %@", buf, 0x20u);
  }

  v21.receiver = self;
  v21.super_class = (Class)WFPencilSqueezeWorkflowRunnerClient;
  v11 = -[WFSystemActionRunnerClient initWithSystemAction:](&v21, sel_initWithSystemAction_, v7);
  -[WFWorkflowRunnerClient runRequest](v11, "runRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRunSource:", CFSTR("pencil-squeeze"));

  -[WFSystemActionRunnerClient actionContext](v11, "actionContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSurface:", 13);

  -[WFSystemActionRunnerClient actionContext](v11, "actionContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPreciseTimestamp:", v9);

  -[WFWorkflowRunnerClient runRequest](v11, "runRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunnerClient descriptor](v11, "descriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[WFWorkflowRunnerClient createRunningContextFromRequestIfNecessary:descriptor:](v11, "createRunningContextFromRequestIfNecessary:descriptor:", v15, v16);

  return v11;
}

- (void)startWithPreciseTimeStamp:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[WFSystemActionRunnerClient actionContext](self, "actionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFSystemActionRunnerClient actionContext](self, "actionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPreciseTimestamp:", v6);

  }
  if (!-[WFPencilSqueezeWorkflowRunnerClient hasStartedRun](self, "hasStartedRun"))
    -[WFPencilSqueezeWorkflowRunnerClient start](self, "start");

}

- (void)start
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFPencilSqueezeWorkflowRunnerClient;
  -[WFSystemActionRunnerClient start](&v3, sel_start);
  -[WFPencilSqueezeWorkflowRunnerClient setHasStartedRun:](self, "setHasStartedRun:", 1);
}

- (BOOL)hasCompletedRun
{
  _BOOL4 v3;

  v3 = -[WFPencilSqueezeWorkflowRunnerClient hasStartedRun](self, "hasStartedRun");
  if (v3)
    LOBYTE(v3) = !-[WFWorkflowRunnerClient isRunning](self, "isRunning");
  return v3;
}

- (BOOL)hasStartedRun
{
  return self->_hasStartedRun;
}

- (void)setHasStartedRun:(BOOL)a3
{
  self->_hasStartedRun = a3;
}

+ (id)defaultContextualActionContext
{
  return -[WFContextualActionContext initWithSurface:]([WFContextualActionContext alloc], "initWithSurface:", 13);
}

@end
