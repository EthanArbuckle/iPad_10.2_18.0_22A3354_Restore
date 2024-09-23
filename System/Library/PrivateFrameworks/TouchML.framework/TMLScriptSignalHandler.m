@implementation TMLScriptSignalHandler

- (TMLScriptSignalHandler)initWithFunctionName:(id)a3 returnType:(unint64_t)a4 target:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  TMLScriptSignalHandler *v13;
  const char *v14;
  double v15;
  TMLScriptSignalHandler *v16;
  uint64_t v17;
  NSString *functionName;
  objc_super v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)TMLScriptSignalHandler;
  v13 = -[TMLScriptSignalHandler init](&v20, sel_init);
  v16 = v13;
  if (v13)
  {
    v13->_returnType = a4;
    v17 = objc_msgSend_copy(v10, v14, v15);
    functionName = v16->_functionName;
    v16->_functionName = (NSString *)v17;

    objc_storeWeak(&v16->_target, v11);
    objc_storeWeak((id *)&v16->_context, v12);
  }

  return v16;
}

- (id)callWithArguments:(id)a3
{
  const char *v4;
  id v5;
  double v6;
  int *p_flags;
  unsigned __int8 v8;
  id WeakRetained;
  const char *v10;
  double v11;
  void *v12;
  unsigned __int8 v13;
  TMLValue *v14;
  const char *v15;
  double v16;
  void *v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;

  v5 = a3;
  p_flags = &self->_flags;
  do
    v8 = __ldaxr((unsigned __int8 *)p_flags);
  while (__stlxr(v8 | 0x40, (unsigned __int8 *)p_flags));
  if ((v8 & 0x40) != 0)
  {
    v18 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v4, v6, CFSTR("Nested signal triggered '%@'"), self->_functionName);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v18, v19, v20, CFSTR("TMLRuntimeException"), v12, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raiseException_(TMLExceptionHandler, v22, v23, v21);

LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend_callFunction_arguments_returnType_(WeakRetained, v10, v11, self->_functionName, v5, self->_returnType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  do
    v13 = __ldxr((unsigned __int8 *)p_flags);
  while (__stxr(v13 & 0xBF, (unsigned __int8 *)p_flags));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v12 = 0;
  }
  if (self->_returnType == 1)
    goto LABEL_11;
  v14 = [TMLValue alloc];
  v17 = (void *)objc_msgSend_initWithValue_valueType_(v14, v15, v16, v12, self->_returnType);
LABEL_12:

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_destroyWeak(&self->_target);
  objc_destroyWeak((id *)&self->_context);
}

@end
