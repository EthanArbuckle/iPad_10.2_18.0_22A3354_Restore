@implementation PHAGraphConsistencyTask

- (NSString)name
{
  return (NSString *)CFSTR("PHAGraphConsistencyTask");
}

- (double)period
{
  return 3600.0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (id)incrementalKey
{
  return 0;
}

- (id)taskClassDependencies
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)priority
{
  return 1;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D76298], "suppressGraphLiveUpdate") & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isReady");

  return v4;
}

- (void)markTaskAsCompleted
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  OS_dispatch_semaphore *v10;
  OS_dispatch_semaphore *semaphore;
  PGGraphUpdateManager *v12;
  PGGraphUpdateManager *updateManager;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  BOOL v17;
  PGGraphUpdateManager *v18;
  uint8_t v20[16];

  v8 = a3;
  v9 = a4;
  v10 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  semaphore = self->_semaphore;
  self->_semaphore = v10;

  objc_storeStrong((id *)&self->_progressReporter, a4);
  v12 = (PGGraphUpdateManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76020]), "initWithGraphManager:", v8);
  updateManager = self->_updateManager;
  self->_updateManager = v12;

  -[PGGraphUpdateManager addListener:](self->_updateManager, "addListener:", self);
  if (!-[PGGraphUpdateManager startListening](self->_updateManager, "startListening"))
  {
    objc_msgSend(v8, "workingContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "loggingConnection");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_error_impl(&dword_1CAC16000, v16, OS_LOG_TYPE_ERROR, "PHAGraphConsistencyTask failed to start listening for changes", v20, 2u);
    }

    if (a5)
    {
      v14 = 14;
      goto LABEL_9;
    }
LABEL_10:
    v17 = 0;
    goto LABEL_12;
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (!-[MAProgressReporter isCancelled](self->_progressReporter, "isCancelled"))
  {
    v17 = 1;
    goto LABEL_12;
  }
  if (!a5)
    goto LABEL_10;
  v14 = 16;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", v14);
  v17 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
  -[PGGraphUpdateManager stopListening](self->_updateManager, "stopListening");
  v18 = self->_updateManager;
  self->_updateManager = 0;

  return v17;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHAGraphConsistencyTask timeoutFatal:]", "PHAGraphConsistencyTask.m", 100, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHAGraphConsistencyTask is stuck", v3, 2u);
  }
}

- (void)graphUpdateMadeProgress:(double)a3
{
  if (-[MAProgressReporter isCancelledWithProgress:](self->_progressReporter, "isCancelledWithProgress:", a3))-[PHAGraphConsistencyTask markTaskAsCompleted](self, "markTaskAsCompleted");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_progressReporter, 0);
  objc_storeStrong((id *)&self->_updateManager, 0);
}

@end
