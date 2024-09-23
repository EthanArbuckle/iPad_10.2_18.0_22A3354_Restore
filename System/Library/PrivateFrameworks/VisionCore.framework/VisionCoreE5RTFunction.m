@implementation VisionCoreE5RTFunction

- (void)dealloc
{
  objc_super v3;

  if (self->_functionHandle)
    e5rt_program_function_release();
  v3.receiver = self;
  v3.super_class = (Class)VisionCoreE5RTFunction;
  -[VisionCoreE5RTFunction dealloc](&v3, sel_dealloc);
}

- (NSDictionary)metadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSDictionary *v7;

  -[VisionCoreE5RTFunction programLibrary](self, "programLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VisionCoreE5RTFunction name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadataForFunctionNamed:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = (void *)MEMORY[0x24BDBD1B8];
  v7 = v6;

  return v7;
}

- (NSArray)inputs
{
  NSArray *lazyInputNames;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  lazyInputNames = self->_lazyInputNames;
  if (!lazyInputNames)
  {
    +[VisionCoreE5RTUtils stringsForHandle:fromCountProc:stringsProc:error:](VisionCoreE5RTUtils, "stringsForHandle:fromCountProc:stringsProc:error:", self->_functionHandle, MEMORY[0x24BE2F938], MEMORY[0x24BE2F928], 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    v6 = self->_lazyInputNames;
    self->_lazyInputNames = v5;

    lazyInputNames = self->_lazyInputNames;
  }
  return lazyInputNames;
}

- (NSArray)outputs
{
  NSArray *lazyOutputNames;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  lazyOutputNames = self->_lazyOutputNames;
  if (!lazyOutputNames)
  {
    +[VisionCoreE5RTUtils stringsForHandle:fromCountProc:stringsProc:error:](VisionCoreE5RTUtils, "stringsForHandle:fromCountProc:stringsProc:error:", self->_functionHandle, MEMORY[0x24BE2F940], MEMORY[0x24BE2F930], 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    v6 = self->_lazyOutputNames;
    self->_lazyOutputNames = v5;

    lazyOutputNames = self->_lazyOutputNames;
  }
  return lazyOutputNames;
}

- (id)descriptorForInput:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a3;
  -[VisionCoreE5RTFunction _buildDescriptorsCaches](self);
  -[NSDictionary objectForKey:](self->_cachedInputDescriptors, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else if (a4)
  {
    v10 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[VisionCoreE5RTFunction name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("Could not provide a descriptor for %@ input %@"), v11, v6);

    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)descriptorOfClass:(Class)a3 forInput:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v8 = a4;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__VisionCoreE5RTFunction_descriptorOfClass_forInput_error___block_invoke;
  v13[3] = &unk_24E1DBE40;
  v13[4] = self;
  v14 = v8;
  v9 = v8;
  v10 = (void *)MEMORY[0x2207A662C](v13);
  -[VisionCoreE5RTFunction _tensorDescriptorOfClass:providedByBlock:error:]((uint64_t)self, (uint64_t)a3, (uint64_t)v10, (uint64_t)a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)descriptorsForInputs:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        -[VisionCoreE5RTFunction descriptorForInput:error:](self, "descriptorForInput:error:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12), a4, (_QWORD)v17);
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

          v15 = 0;
          goto LABEL_11;
        }
        v14 = (void *)v13;
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }

  v15 = v7;
LABEL_11:

  return v15;
}

- (id)descriptorForOutput:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a3;
  -[VisionCoreE5RTFunction _buildDescriptorsCaches](self);
  -[NSDictionary objectForKey:](self->_cachedOutputDescriptors, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else if (a4)
  {
    v10 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[VisionCoreE5RTFunction name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("Could not provide a descriptor for %@ output %@"), v11, v6);

    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)descriptorOfClass:(Class)a3 forOutput:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v8 = a4;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__VisionCoreE5RTFunction_descriptorOfClass_forOutput_error___block_invoke;
  v13[3] = &unk_24E1DBE40;
  v13[4] = self;
  v14 = v8;
  v9 = v8;
  v10 = (void *)MEMORY[0x2207A662C](v13);
  -[VisionCoreE5RTFunction _tensorDescriptorOfClass:providedByBlock:error:]((uint64_t)self, (uint64_t)a3, (uint64_t)v10, (uint64_t)a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)descriptorsForOutputs:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        -[VisionCoreE5RTFunction descriptorForOutput:error:](self, "descriptorForOutput:error:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12), a4, (_QWORD)v17);
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

          v15 = 0;
          goto LABEL_11;
        }
        v14 = (void *)v13;
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }

  v15 = v7;
LABEL_11:

  return v15;
}

- (NSArray)inputDescriptors
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[VisionCoreE5RTFunction inputs](self, "inputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[VisionCoreE5RTFunction descriptorForInput:error:](self, "descriptorForInput:error:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), 0, (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (NSArray)outputDescriptors
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[VisionCoreE5RTFunction outputs](self, "outputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[VisionCoreE5RTFunction descriptorForOutput:error:](self, "descriptorForOutput:error:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), 0, (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (id)newExecutionContextWithConfiguration:(id)a3 error:(id *)a4
{
  return +[VisionCoreE5RTExecutionContext newContextForFunction:withConfiguration:error:](VisionCoreE5RTExecutionContext, "newContextForFunction:withConfiguration:error:", self, a3, a4);
}

- (id)prepareForExecutionWithError:(id *)a3
{
  return -[VisionCoreE5RTExecutionPrewarmedState initWithExecutionStreamOperation:]([VisionCoreE5RTExecutionPrewarmedState alloc], "initWithExecutionStreamOperation:", -[VisionCoreE5RTFunction createOperationExecutionStreamWithError:](self, "createOperationExecutionStreamWithError:", a3));
}

- (VisionCoreE5RTFunction)initWithProgramLibrary:(id)a3 name:(id)a4 ownedFunctionHandle:(e5rt_program_function *)a5
{
  id v9;
  id v10;
  VisionCoreE5RTFunction *v11;
  VisionCoreE5RTFunction *v12;
  uint64_t v13;
  NSString *name;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VisionCoreE5RTFunction;
  v11 = -[VisionCoreE5RTFunction init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_programLibrary, a3);
    v13 = objc_msgSend(v10, "copy");
    name = v12->_name;
    v12->_name = (NSString *)v13;

    v12->_functionHandle = *a5;
    *a5 = 0;
  }

  return v12;
}

- (e5rt_execution_stream_operation)createOperationExecutionStreamWithError:(id *)a3
{
  NSObject *v4;
  uint64_t v5;
  e5rt_execution_stream_operation *v6;
  uint64_t precompiled_compute_operation_with_options;
  NSObject *v8;
  e5rt_execution_stream_operation *v10;
  uint8_t buf[16];

  _VisionCoreSignpostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21DED3000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionCoreE5RTCreateExecutionStreamOperation", (const char *)&unk_21DF063BD, buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v5 = e5rt_precompiled_compute_op_create_options_create_with_program_function();
  if ((_DWORD)v5)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v5);
      v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v10 = 0;
    precompiled_compute_operation_with_options = e5rt_execution_stream_operation_create_precompiled_compute_operation_with_options();
    if ((_DWORD)precompiled_compute_operation_with_options)
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", precompiled_compute_operation_with_options);
        v6 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
    }
    else
    {
      v6 = v10;
    }
    e5rt_precompiled_compute_op_create_options_release();
    _VisionCoreSignpostLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_21DED3000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionCoreE5RTCreateExecutionStreamOperation", (const char *)&unk_21DF063BD, (uint8_t *)&v10, 2u);
    }

  }
  return v6;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)VisionCoreE5RTFunction;
  -[VisionCoreE5RTFunction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VisionCoreE5RTFunction name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@"), v4, v5);

  return v6;
}

- (VisionCoreE5RTProgramLibrary)programLibrary
{
  return self->_programLibrary;
}

- (e5rt_program_function)functionHandle
{
  return self->_functionHandle;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedOutputDescriptors, 0);
  objc_storeStrong((id *)&self->_cachedInputDescriptors, 0);
  objc_storeStrong((id *)&self->_lazyOutputNames, 0);
  objc_storeStrong((id *)&self->_lazyInputNames, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_programLibrary, 0);
}

uint64_t __60__VisionCoreE5RTFunction_descriptorOfClass_forOutput_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "descriptorForOutput:error:", *(_QWORD *)(a1 + 40), a2);
}

- (id)_tensorDescriptorOfClass:(uint64_t)a3 providedByBlock:(uint64_t)a4 error:
{
  void *v6;
  id v7;

  if (a1)
  {
    (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      && +[VisionCoreValidationUtilities validateObject:isKindOfClass:basedOnClass:error:](VisionCoreValidationUtilities, "validateObject:isKindOfClass:basedOnClass:error:", v6, a2, objc_opt_class(), a4))
    {
      v7 = v6;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_buildDescriptorsCaches
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t (**v12)(id, uint64_t, id *);
  uint64_t v13;
  char v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    if (!v1[6])
    {
      objc_msgSend(v1, "inputs");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v2, "count"));
      objc_msgSend(v1, "outputs");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v4, "count"));
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __49__VisionCoreE5RTFunction__buildDescriptorsCaches__block_invoke;
      v24[3] = &unk_24E1DBE18;
      v6 = v2;
      v25 = v6;
      v26 = v1;
      v7 = v3;
      v27 = v7;
      v8 = v4;
      v28 = v8;
      v9 = v5;
      v29 = v9;
      v10 = (void *)MEMORY[0x2207A662C](v24);
      NSStringFromSelector(sel__buildDescriptorsCaches);
      v23 = 0;
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = v10;
      v13 = objc_msgSend(v1, "createOperationExecutionStreamWithError:", &v23);
      v30 = v13;
      if (v13)
      {
        v14 = v12[2](v12, v13, &v23);
        e5rt_execution_stream_operation_release();
      }
      else
      {
        v14 = 0;
      }

      v15 = v23;
      if ((v14 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", sel__buildDescriptorsCaches, v1, CFSTR("VisionCoreE5RTFunction.m"), 296, CFSTR("could not build descriptors for %@: %@"), v20, v21);

      }
      v16 = objc_msgSend(v7, "copy");
      v17 = (void *)v1[6];
      v1[6] = v16;

      v18 = objc_msgSend(v9, "copy");
      v19 = (void *)v1[7];
      v1[7] = v18;

    }
    objc_sync_exit(v1);

  }
}

uint64_t __49__VisionCoreE5RTFunction__buildDescriptorsCaches__block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v31;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
      v29 = 0;
      v10 = objc_retainAutorelease(v9);
      objc_msgSend(v10, "UTF8String");
      v11 = e5rt_execution_stream_operation_retain_input_port();
      if ((_DWORD)v11)
        break;
      v12 = (void *)-[VisionCoreE5RTFunction _newDescriptorForIOPort:named:error:](*(_QWORD *)(a1 + 40), v29, v10, a3);
      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v12, v10);
        v13 = 0;
      }
      else
      {
        v13 = 1;
      }

      e5rt_io_port_release();
      if (v13)
        goto LABEL_32;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
    if (!a3)
      goto LABEL_32;
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v11);
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_13:

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v5 = *(id *)(a1 + 56);
    v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (!v14)
    {
      v22 = 1;
      goto LABEL_33;
    }
    v15 = *(_QWORD *)v26;
LABEL_15:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v15)
        objc_enumerationMutation(v5);
      v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v16);
      v29 = 0;
      v18 = objc_retainAutorelease(v17);
      objc_msgSend(v18, "UTF8String", (_QWORD)v25);
      v19 = e5rt_execution_stream_operation_retain_output_port();
      if ((_DWORD)v19)
        break;
      v20 = (void *)-[VisionCoreE5RTFunction _newDescriptorForIOPort:named:error:](*(_QWORD *)(a1 + 40), v29, v18, a3);
      if (v20)
      {
        objc_msgSend(*(id *)(a1 + 64), "setObject:forKey:", v20, v18);
        v21 = 0;
      }
      else
      {
        v21 = 1;
      }

      e5rt_io_port_release();
      if (v21)
        goto LABEL_32;
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
        v22 = 1;
        if (v14)
          goto LABEL_15;
        goto LABEL_33;
      }
    }
    if (!a3)
      goto LABEL_32;
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v19);
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  *a3 = v23;
LABEL_32:
  v22 = 0;
LABEL_33:

  return v22;
}

- (uint64_t)_newDescriptorForIOPort:(void *)a3 named:(_QWORD *)a4 error:
{
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  const __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t shape;
  uint64_t width;
  VisionCoreTensorShape *v18;
  VisionCoreTensorShape *v19;
  uint64_t strides;
  VisionCoreTensorStrides *v21;
  VisionCoreTensorStrides *v22;
  VisionCoreTensorDescriptor *v23;
  VisionCoreImageTensorDescriptor *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v7 = a3;
  if (!a1)
  {
LABEL_19:
    v8 = 0;
    goto LABEL_46;
  }
  v26 = 0;
  v8 = 0;
  if (+[VisionCoreE5RTUtils getType:ofIOPort:error:](VisionCoreE5RTUtils, "getType:ofIOPort:error:", &v26, a2, a4))
  {
    if (v26 != 2)
    {
      if (v26 == 1)
      {
        v9 = v7;
        v31 = 0;
        v10 = e5rt_io_port_retain_tensor_desc();
        if ((_DWORD)v10)
        {
          if (a4)
          {
LABEL_7:
            objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
            v8 = 0;
            *a4 = v11;
            goto LABEL_45;
          }
LABEL_10:
          v8 = 0;
LABEL_45:

          goto LABEL_46;
        }
        v30 = 0;
        if (!+[VisionCoreE5RTUtils getTensorDataType:forTensorDescriptor:error:](VisionCoreE5RTUtils, "getTensorDataType:forTensorDescriptor:error:", &v30, v31, a4))goto LABEL_27;
        v28 = 0;
        v29 = 0;
        shape = e5rt_tensor_desc_get_shape();
        if (!(_DWORD)shape)
        {
          v18 = [VisionCoreTensorShape alloc];
          v19 = -[VisionCoreTensorShape initWithSizes:rank:](v18, "initWithSizes:rank:", v28, v29);
          v27 = 0;
          strides = e5rt_tensor_desc_get_strides();
          if ((_DWORD)strides)
          {
            if (a4)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", strides);
              v8 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v8 = 0;
            }
          }
          else
          {
            v21 = [VisionCoreTensorStrides alloc];
            v22 = -[VisionCoreTensorStrides initWithByteOffsets:rank:](v21, "initWithByteOffsets:rank:", v27, v29);
            v23 = [VisionCoreTensorDescriptor alloc];
            v8 = -[VisionCoreTensorDescriptor initWithName:dataType:shape:strides:](v23, "initWithName:dataType:shape:strides:", v9, v30, v19, v22);

          }
          goto LABEL_44;
        }
        if (a4)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", shape);
          v8 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_27:
          v8 = 0;
        }
LABEL_44:
        e5rt_tensor_desc_release();
        goto LABEL_45;
      }
      if (a4)
      {
        v12 = objc_alloc(MEMORY[0x24BDD17C8]);
        v13 = CFSTR("VisionCoreE5RTIOPortTypeUnknown");
        if (v26 == 1)
          v13 = CFSTR("VisionCoreE5RTIOPortTypeTensor");
        if (v26 == 2)
          v14 = CFSTR("VisionCoreE5RTIOPortTypeSurface");
        else
          v14 = (__CFString *)v13;
        v15 = v14;
        v9 = (id)objc_msgSend(v12, "initWithFormat:", CFSTR("unsupported I/O port handle type %@"), v15);

        objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInternalErrorWithLocalizedDescription:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      goto LABEL_19;
    }
    v9 = v7;
    v31 = 0;
    v10 = e5rt_io_port_retain_surface_desc();
    if ((_DWORD)v10)
    {
      if (a4)
        goto LABEL_7;
      goto LABEL_10;
    }
    v30 = 0;
    width = e5rt_surface_desc_get_width();
    if ((_DWORD)width)
    {
      if (a4)
        goto LABEL_36;
    }
    else
    {
      v29 = 0;
      width = e5rt_surface_desc_get_height();
      if ((_DWORD)width)
      {
        if (a4)
          goto LABEL_36;
      }
      else
      {
        LODWORD(v28) = 0;
        width = e5rt_surface_desc_get_format();
        if ((_DWORD)width)
        {
          if (a4)
          {
LABEL_36:
            objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", width);
            v8 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_41:
            e5rt_surface_desc_release();
            goto LABEL_45;
          }
        }
        else
        {
          LODWORD(v27) = 0;
          if (+[VisionCoreE5RTUtils getPixelFormatType:forSurfaceFormat:error:](VisionCoreE5RTUtils, "getPixelFormatType:forSurfaceFormat:error:", &v27, v28, a4))
          {
            v24 = [VisionCoreImageTensorDescriptor alloc];
            v8 = -[VisionCoreImageTensorDescriptor initWithName:pixelFormatType:pixelWidth:pixelHeight:](v24, "initWithName:pixelFormatType:pixelWidth:pixelHeight:", v9, v27, v30, v29);
            goto LABEL_41;
          }
        }
      }
    }
    v8 = 0;
    goto LABEL_41;
  }
LABEL_46:

  return v8;
}

uint64_t __59__VisionCoreE5RTFunction_descriptorOfClass_forInput_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "descriptorForInput:error:", *(_QWORD *)(a1 + 40), a2);
}

@end
