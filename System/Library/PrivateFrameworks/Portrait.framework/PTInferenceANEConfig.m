@implementation PTInferenceANEConfig

- (PTInferenceANEConfig)initWithEspressoPlanPriority:(int)a3 espressoEngine:(int)a4
{
  PTInferenceANEConfig *v6;
  PTInferenceANEConfig *v7;
  PTInferenceANEConfig *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PTInferenceANEConfig;
  v6 = -[PTInferenceANEConfig init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_espressoPlanPriority = a3;
    v6->_espressoEngine = a4;
    v8 = v6;
  }

  return v7;
}

- (id)MLANEExecutionPriority
{
  int espressoPlanPriority;
  int *p_espressoPlanPriority;
  id *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  p_espressoPlanPriority = &self->_espressoPlanPriority;
  espressoPlanPriority = self->_espressoPlanPriority;
  if (espressoPlanPriority == 1)
  {
    v4 = (id *)MEMORY[0x1E0C9E840];
  }
  else if (espressoPlanPriority == 0x2000)
  {
    v4 = (id *)MEMORY[0x1E0C9E848];
  }
  else
  {
    _PTLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[PTInferenceANEConfig MLANEExecutionPriority].cold.1((uint64_t)p_espressoPlanPriority, v5, v6, v7, v8, v9, v10, v11);

    v4 = (id *)MEMORY[0x1E0C9E850];
  }
  return *v4;
}

- (unint64_t)VNRequestModelExecutionPriority
{
  unint64_t result;
  int *p_espressoPlanPriority;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  p_espressoPlanPriority = &self->_espressoPlanPriority;
  result = self->_espressoPlanPriority;
  if ((_DWORD)result != 1)
  {
    if ((_DWORD)result == 0x2000)
    {
      return 2;
    }
    else
    {
      _PTLogSystem();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[PTInferenceANEConfig MLANEExecutionPriority].cold.1((uint64_t)p_espressoPlanPriority, v4, v5, v6, v7, v8, v9, v10);

      return 0;
    }
  }
  return result;
}

- (int)espressoPlanPriority
{
  return self->_espressoPlanPriority;
}

- (int)espressoEngine
{
  return self->_espressoEngine;
}

- (void)MLANEExecutionPriority
{
  OUTLINED_FUNCTION_15(&dword_1C9281000, a2, a3, "Unsupported priority %i", a5, a6, a7, a8, 0);
}

@end
