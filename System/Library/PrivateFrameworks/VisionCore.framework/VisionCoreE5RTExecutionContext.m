@implementation VisionCoreE5RTExecutionContext

- (id)_initWithOwnedOperationHandle:(e5rt_execution_stream_operation *)a3 function:(id)a4 inputs:(id)a5 outputs:(id)a6
{
  id v11;
  id v12;
  id v13;
  VisionCoreE5RTExecutionContext *v14;
  uint64_t v15;
  VisionCoreNamedObjects *boundInputObjects;
  uint64_t v17;
  VisionCoreNamedObjects *boundOutputObjects;
  VisionCoreNamedObjects *v19;
  objc_super v21;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)VisionCoreE5RTExecutionContext;
  v14 = -[VisionCoreE5RTExecutionContext init](&v21, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    boundInputObjects = v14->_boundInputObjects;
    v14->_boundInputObjects = (VisionCoreNamedObjects *)v15;

    v17 = objc_msgSend(v13, "copy");
    boundOutputObjects = v14->_boundOutputObjects;
    v14->_boundOutputObjects = (VisionCoreNamedObjects *)v17;

    v19 = v14->_boundInputObjects;
    if (v19)
      LOBYTE(v19) = v14->_boundOutputObjects != 0;
    v14->_isPrebound = (char)v19;
    objc_storeStrong((id *)&v14->_function, a4);
    v14->_executionStreamOperationHandle = *a3;
    *a3 = 0;
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_executionStreamHandle)
  {
    e5rt_execution_stream_reset();
    e5rt_execution_stream_release();
  }
  if (self->_executionStreamOperationHandle)
    e5rt_execution_stream_operation_release();
  v3.receiver = self;
  v3.super_class = (Class)VisionCoreE5RTExecutionContext;
  -[VisionCoreE5RTExecutionContext dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[VisionCoreE5RTExecutionContext function](self, "function");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "programLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v3, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@.%@"), v6, v7);

  return (NSString *)v8;
}

- (NSArray)inputs
{
  void *v2;
  void *v3;

  -[VisionCoreE5RTExecutionContext function](self, "function");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)outputs
{
  void *v2;
  void *v3;

  -[VisionCoreE5RTExecutionContext function](self, "function");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)executeAndReturnError:(id *)a3
{
  int v4;
  int v5;
  id v6;

  v4 = -[VisionCoreE5RTExecutionContext _validateIsPreboundAndReturnError:]((uint64_t)self, a3);
  if (v4)
  {
    v5 = e5rt_execution_stream_execute_sync();
    LOBYTE(v4) = v5 == 0;
    if (a3)
    {
      if (v5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        LOBYTE(v4) = 0;
        *a3 = v6;
      }
    }
  }
  return v4;
}

- (void)executeWithCompletionHandler:(id)a3
{
  id v4;
  char v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(id *, uint64_t, uint64_t, uint64_t);
  void *v16;
  VisionCoreE5RTExecutionContext *v17;
  id v18;
  id v19;
  id v20;

  v4 = a3;
  v20 = 0;
  v5 = -[VisionCoreE5RTExecutionContext _validateIsPreboundAndReturnError:]((uint64_t)self, &v20);
  v6 = v20;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)-[VisionCoreNamedObjects copy](self->_boundOutputObjects, "copy");
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __63__VisionCoreE5RTExecutionContext_executeWithCompletionHandler___block_invoke;
    v16 = &unk_24E1DBB58;
    v17 = self;
    v8 = v7;
    v18 = v8;
    v9 = v4;
    v19 = v9;
    v10 = (void *)MEMORY[0x2207A662C](&v13);
    v11 = e5rt_execution_stream_submit_async();
    if ((_DWORD)v11)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v11, v13, v14, v15, v16, v17, v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[VisionCoreE5RTExecutionContext _reportError:toCompletionHandler:]((uint64_t)self, v12, v9);
      v6 = v12;
    }

  }
  else
  {
    -[VisionCoreE5RTExecutionContext _reportError:toCompletionHandler:]((uint64_t)self, v6, v4);
  }

}

- (id)executeWithInputObjects:(id)a3 error:(id *)a4
{
  id v6;
  VisionCoreE5RTExecutionBoundPorts *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = a3;
  v7 = objc_alloc_init(VisionCoreE5RTExecutionBoundPorts);
  -[VisionCoreE5RTExecutionContext _executePreflightBindingsWithInputObjects:recordingIOPortHandlesIn:error:]((VisionCoreMutableNamedObjects *)self, v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_5;
  v9 = e5rt_execution_stream_execute_sync();
  if (!(_DWORD)v9)
  {
    v10 = v8;
    goto LABEL_7;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v9);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_5:
    v10 = 0;
  }
LABEL_7:

  return v10;
}

- (void)executeWithInputObjects:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  VisionCoreE5RTExecutionBoundPorts *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  VisionCoreE5RTExecutionBoundPorts *v16;
  VisionCoreE5RTExecutionContext *v17;
  id v18;
  id v19;
  id v20;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(VisionCoreE5RTExecutionBoundPorts);
  v20 = 0;
  -[VisionCoreE5RTExecutionContext _executePreflightBindingsWithInputObjects:recordingIOPortHandlesIn:error:]((VisionCoreMutableNamedObjects *)self, v7, v8, &v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v20;
  if (v9)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __76__VisionCoreE5RTExecutionContext_executeWithInputObjects_completionHandler___block_invoke;
    v15[3] = &unk_24E1DBB80;
    v16 = v8;
    v17 = self;
    v18 = v9;
    v11 = v6;
    v19 = v11;
    v12 = (void *)MEMORY[0x2207A662C](v15);
    v13 = e5rt_execution_stream_submit_async();
    if ((_DWORD)v13)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[VisionCoreE5RTExecutionContext _reportError:toCompletionHandler:]((uint64_t)self, v14, v11);
      v10 = v14;
    }

  }
  else
  {
    -[VisionCoreE5RTExecutionContext _reportError:toCompletionHandler:]((uint64_t)self, v10, v6);
  }

}

- (BOOL)isPrebound
{
  return self->_isPrebound;
}

- (VisionCoreNamedObjects)boundInputObjects
{
  return self->_boundInputObjects;
}

- (VisionCoreNamedObjects)boundOutputObjects
{
  return self->_boundOutputObjects;
}

- (VisionCoreE5RTFunction)function
{
  return self->_function;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationProvidedCompletionQueue, 0);
  objc_storeStrong((id *)&self->_boundOutputPorts, 0);
  objc_storeStrong((id *)&self->_boundInputPorts, 0);
  objc_storeStrong((id *)&self->_boundOutputObjects, 0);
  objc_storeStrong((id *)&self->_boundInputObjects, 0);
  objc_storeStrong((id *)&self->_function, 0);
}

- (VisionCoreMutableNamedObjects)_executePreflightBindingsWithInputObjects:(void *)a3 recordingIOPortHandlesIn:(_QWORD *)a4 error:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  void *v12;
  VisionCoreMutableNamedObjects *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    if (LOBYTE(a1[3].super.super.isa))
    {
      if (a4)
      {
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@ has pre-bound inputs and outputs"), a1);
        objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidOperationWithLocalizedDescription:", v9);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_5:
      a1 = 0;
      goto LABEL_6;
    }
    v11 = e5rt_execution_stream_reset();
    if ((_DWORD)v11)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v11);
        a1 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }
      goto LABEL_5;
    }
    v29 = v7;
    -[VisionCoreMutableNamedObjects function](a1, "function");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "outputs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[VisionCoreMutableNamedObjects initWithCapacity:]([VisionCoreMutableNamedObjects alloc], "initWithCapacity:", objc_msgSend(v12, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v36 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v30, "descriptorForOutput:error:", v19, a4);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (!v20
            || !objc_msgSend(v20, "E5RTExecutionContextAssignNewTensorInstanceToNamedObjects:error:", v13, a4))
          {

LABEL_32:
            a1 = 0;
            goto LABEL_35;
          }
          v22 = -[VisionCoreE5RTExecutionContext _bindOutput:ofOutputObjects:recordingPortHandleIn:error:]((uint64_t)a1, v19, v13, v8, a4);

          if (!v22)
            goto LABEL_32;
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v16)
          continue;
        break;
      }
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v23 = v29;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v32;
      while (2)
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v32 != v26)
            objc_enumerationMutation(v23);
          if (!-[VisionCoreE5RTExecutionContext _bindInput:ofInputObjects:recordingPortHandleIn:error:]((uint64_t)a1, *(void **)(*((_QWORD *)&v31 + 1) + 8 * j), v23, v8, a4))
          {

            goto LABEL_34;
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v25)
          continue;
        break;
      }
    }

    v28 = e5rt_execution_stream_encode_operation();
    if ((_DWORD)v28)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v28);
        a1 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_34:
        a1 = 0;
      }
    }
    else
    {
      a1 = v13;
    }
LABEL_35:
    v7 = v29;

  }
LABEL_6:

  return a1;
}

- (void)_reportError:(void *)a3 toCompletionHandler:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1 && v6)
  {
    -[VisionCoreE5RTExecutionContext _resolvedCompletionQueue](a1);
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __67__VisionCoreE5RTExecutionContext__reportError_toCompletionHandler___block_invoke;
    v9[3] = &unk_24E1DBB30;
    v11 = v7;
    v10 = v5;
    dispatch_async(v8, v9);

  }
}

void __76__VisionCoreE5RTExecutionContext_executeWithInputObjects_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v5 = *(void **)(a1 + 32);
  v17 = v5;
  if ((_DWORD)a4)
  {
    v7 = (objc_class *)MEMORY[0x24BDD17C8];
    v8 = v5;
    v9 = [v7 alloc];
    objc_msgSend(*(id *)(a1 + 40), "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@ failed execution"), v10, v17);

    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTErrorCode:localizedDescription:", a4, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VisionCoreE5RTExecutionContext _reportError:toCompletionHandler:](*(_QWORD *)(a1 + 40), v12, *(void **)(a1 + 56));

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(void **)(a1 + 48);
    v15 = *(void **)(a1 + 56);
    v16 = v5;
    -[VisionCoreE5RTExecutionContext _reportOutput:toCompletionHandler:](v13, v14, v15);
  }

}

- (void)_reportOutput:(void *)a3 toCompletionHandler:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1 && v6)
  {
    -[VisionCoreE5RTExecutionContext _resolvedCompletionQueue](a1);
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __68__VisionCoreE5RTExecutionContext__reportOutput_toCompletionHandler___block_invoke;
    v9[3] = &unk_24E1DBB30;
    v11 = v7;
    v10 = v5;
    dispatch_async(v8, v9);

  }
}

- (id)_resolvedCompletionQueue
{
  void *v1;
  qos_class_t v3;

  v1 = *(void **)(a1 + 72);
  if (v1)
    return v1;
  v3 = qos_class_self();
  dispatch_get_global_queue(v3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __68__VisionCoreE5RTExecutionContext__reportOutput_toCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __67__VisionCoreE5RTExecutionContext__reportError_toCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (uint64_t)_bindOutput:(void *)a3 ofOutputObjects:(void *)a4 recordingPortHandleIn:(_QWORD *)a5 error:
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  v23 = 0;
  v11 = objc_retainAutorelease(v8);
  objc_msgSend(v11, "UTF8String");
  v12 = e5rt_execution_stream_operation_retain_output_port();
  if (!(_DWORD)v12)
  {
    if ((objc_msgSend(v10, "recordPort:named:error:", v23, v11, a5) & 1) == 0)
    {
      e5rt_io_port_release();
      goto LABEL_16;
    }
    v22 = 0;
    if (+[VisionCoreE5RTUtils getType:ofIOPort:error:](VisionCoreE5RTUtils, "getType:ofIOPort:error:", &v22, v23, a5))
    {
      if (v22 == 2)
      {
        v15 = v11;
        v16 = v9;
        if (!objc_msgSend(v16, "surfaceAssociatedWithName:error:", v15, a5))
          goto LABEL_22;
        v24 = 0;
        v17 = e5rt_surface_object_create_from_iosurface();
        if (!(_DWORD)v17)
        {
          v21 = e5rt_io_port_bind_surface_object();
          if ((_DWORD)v21)
          {
            if (a5)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v21);
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }
            v19 = 0;
            v25 = 0;
          }
          else
          {
            v19 = 1;
          }
          e5rt_surface_object_release();
          goto LABEL_33;
        }
        goto LABEL_20;
      }
      if (v22 == 1)
      {
        v15 = v11;
        v16 = v9;
        if (!objc_msgSend(v16, "surfaceAssociatedWithName:error:", v15, a5))
          goto LABEL_22;
        v24 = 0;
        v17 = e5rt_buffer_object_create_from_iosurface();
        if (!(_DWORD)v17)
        {
          v18 = e5rt_io_port_bind_buffer_object();
          if ((_DWORD)v18)
          {
            if (a5)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v18);
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }
            v19 = 0;
            v25 = 0;
          }
          else
          {
            v19 = 1;
          }
          e5rt_buffer_object_release();
LABEL_33:
          v14 = v19 | v25;
          goto LABEL_34;
        }
LABEL_20:
        if (a5)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v17);
          v14 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:

          goto LABEL_17;
        }
LABEL_22:
        v14 = 0;
        goto LABEL_34;
      }
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnsupportedE5RTIOPortType:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      }
    }
LABEL_16:
    v14 = 0;
    goto LABEL_17;
  }
  if (!a5)
    goto LABEL_16;
  objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:
  v14 = 0;
  *a5 = v13;
LABEL_17:

  return v14 & 1;
}

- (uint64_t)_bindInput:(void *)a3 ofInputObjects:(void *)a4 recordingPortHandleIn:(_QWORD *)a5 error:
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  v22 = 0;
  v11 = objc_retainAutorelease(v8);
  objc_msgSend(v11, "UTF8String");
  v12 = e5rt_execution_stream_operation_retain_input_port();
  if ((_DWORD)v12)
  {
LABEL_2:
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:
      v14 = 0;
      *a5 = v13;
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if ((objc_msgSend(v10, "recordPort:named:error:", v22, v11, a5) & 1) == 0)
  {
    e5rt_io_port_release();
    goto LABEL_16;
  }
  v21 = 0;
  if (!+[VisionCoreE5RTUtils getType:ofIOPort:error:](VisionCoreE5RTUtils, "getType:ofIOPort:error:", &v21, v22, a5))
  {
LABEL_16:
    v14 = 0;
    goto LABEL_17;
  }
  if (v21 == 1)
  {
    v18 = objc_msgSend(v9, "surfaceAssociatedWithName:error:", v11, a5);
    if (v18)
    {
      v14 = -[VisionCoreE5RTExecutionContext _bindIOSurface:toBufferInputPort:error:](v18, v22, a5);
    }
    else
    {
      objc_msgSend(v9, "dataForName:error:", v11, a5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
        v14 = -[VisionCoreE5RTExecutionContext _bindData:toBufferInputPort:error:](v19, v22, (unint64_t)a5);
      else
        v14 = 0;

    }
    goto LABEL_17;
  }
  if (v21 != 2)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnsupportedE5RTIOPortType:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    goto LABEL_16;
  }
  if (!objc_msgSend(v9, "surfaceAssociatedWithName:error:", v11, a5))
    goto LABEL_16;
  v23 = 0;
  v12 = e5rt_surface_object_create_from_iosurface();
  if ((_DWORD)v12)
    goto LABEL_2;
  v15 = e5rt_io_port_bind_surface_object();
  if ((_DWORD)v15)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = 0;
    v24 = 0;
  }
  else
  {
    v16 = 1;
  }
  e5rt_surface_object_release();
  v14 = v16 | v24;
LABEL_17:

  return v14 & 1;
}

- (uint64_t)_bindIOSurface:(uint64_t)a1 toBufferInputPort:(uint64_t)a2 error:(_QWORD *)a3
{
  uint64_t v4;
  id v5;
  char v6;
  uint64_t v7;
  char v8;
  char v10;

  v4 = e5rt_buffer_object_create_from_iosurface();
  if ((_DWORD)v4)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v4, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      *a3 = v5;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v7 = e5rt_io_port_bind_buffer_object();
    if ((_DWORD)v7)
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v7, 0);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      v8 = 0;
      v10 = 0;
    }
    else
    {
      v8 = 1;
    }
    e5rt_buffer_object_release();
    v6 = v8 | v10;
  }
  return v6 & 1;
}

- (unint64_t)_bindData:(void *)a1 toBufferInputPort:(uint64_t)a2 error:(unint64_t)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  const __CFDictionary *v8;
  __IOSurface *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  unsigned __int8 v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = objc_msgSend(v5, "length");
  v18 = *MEMORY[0x24BDD8E18];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v9 = IOSurfaceCreate(v8);
  if (v9)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __68__VisionCoreE5RTExecutionContext__bindData_toBufferInputPort_error___block_invoke;
    v14[3] = &unk_24E1DBB08;
    v15 = v5;
    v16 = v6;
    v10 = (void *)MEMORY[0x2207A662C](v14);
    if ((VisionCorePerformWithLockedIOSurface(v9, 0, v10, (_QWORD *)a3) & 1) != 0)
      v11 = -[VisionCoreE5RTExecutionContext _bindIOSurface:toBufferInputPort:error:]((uint64_t)v9, a2, (_QWORD *)a3);
    else
      v11 = 0;
    v17 = v11;

    CFRelease(v9);
    a3 = v17;
  }
  else if (a3)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Could not create IOSurfaceRef with properties %@"), v8);
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidOperationWithLocalizedDescription:", v12);
    *(_QWORD *)a3 = (id)objc_claimAutoreleasedReturnValue();

    a3 = 0;
  }

  return a3;
}

uint64_t __68__VisionCoreE5RTExecutionContext__bindData_toBufferInputPort_error___block_invoke(uint64_t a1, IOSurfaceRef buffer)
{
  void *BaseAddress;

  BaseAddress = IOSurfaceGetBaseAddress(buffer);
  memcpy(BaseAddress, (const void *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes"), *(_QWORD *)(a1 + 40));
  return 1;
}

- (uint64_t)_validateIsPreboundAndReturnError:(uint64_t)result
{
  void *v3;

  if (result)
  {
    if (*(_BYTE *)(result + 48))
    {
      return 1;
    }
    else
    {
      if (a2)
      {
        v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@ does not have pre-bound inputs and outputs"), result);
        objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidOperationWithLocalizedDescription:", v3);
        *a2 = (id)objc_claimAutoreleasedReturnValue();

      }
      return 0;
    }
  }
  return result;
}

void __63__VisionCoreE5RTExecutionContext_executeWithCompletionHandler___block_invoke(id *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  if ((_DWORD)a4)
  {
    v6 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(a1[4], "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v6, "initWithFormat:", CFSTR("%@ failed execution"), v7);

    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTErrorCode:localizedDescription:", a4, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VisionCoreE5RTExecutionContext _reportError:toCompletionHandler:]((uint64_t)a1[4], v8, a1[6]);

  }
  else
  {
    -[VisionCoreE5RTExecutionContext _reportOutput:toCompletionHandler:]((uint64_t)a1[4], a1[5], a1[6]);
  }
}

+ (id)newContextForFunction:(id)a3 withConfiguration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  VisionCoreE5RTExecutionBoundPorts *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  VisionCoreE5RTExecutionBoundPorts *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  id v37;
  uint8_t v38[8];
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  _VisionCoreSignpostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21DED3000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionCoreE5RTCreateFunctionExecutionContext", (const char *)&unk_21DF063BD, buf, 2u);
  }

  objc_msgSend(v9, "boundInputObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "boundOutputObjects");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!v11 && v12 || v11 && !v12)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", CFSTR("bound input and output objects must be both defined or both nil"));
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_51;
    }
LABEL_35:
    v14 = 0;
    goto LABEL_51;
  }
  v39 = 0;
  objc_msgSend(v9, "prewarmedState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (!v16)
  {
    objc_msgSend(v9, "prewarmedState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v17, "acquireExecutionStreamOperationHandle");

  }
  if (!v39)
  {
    v39 = objc_msgSend(v8, "createOperationExecutionStreamWithError:", a5);
    if (!v39)
      goto LABEL_35;
  }
  v18 = objc_msgSend(objc_alloc((Class)a1), "_initWithOwnedOperationHandle:function:inputs:outputs:", &v39, v8, v11, v13);
  if (!v18)
  {
    if (a5)
    {
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("unable to create execution context for %@"), v8);
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForMemoryAllocationFailureWithLocalizedDescription:", v34);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_45;
  }
  v19 = v9;
  objc_msgSend(v19, "completionQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(void **)(v18 + 72);
  *(_QWORD *)(v18 + 72) = v20;

  if (*(_BYTE *)(v18 + 48))
  {
    v22 = objc_alloc_init(VisionCoreE5RTExecutionBoundPorts);
    v23 = *(void **)(v18 + 56);
    *(_QWORD *)(v18 + 56) = v22;

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v24 = *(id *)(v18 + 32);
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, buf, 16);
    v37 = v19;
    if (v25)
    {
      v26 = *(_QWORD *)v45;
LABEL_17:
      v27 = 0;
      while (1)
      {
        if (*(_QWORD *)v45 != v26)
          objc_enumerationMutation(v24);
        if ((-[VisionCoreE5RTExecutionContext _bindInput:ofInputObjects:recordingPortHandleIn:error:](v18, *(void **)(*((_QWORD *)&v44 + 1) + 8 * v27), *(void **)(v18 + 32), *(void **)(v18 + 56), a5) & 1) == 0)goto LABEL_43;
        if (v25 == ++v27)
        {
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, buf, 16);
          if (v25)
            goto LABEL_17;
          break;
        }
      }
    }

    v28 = objc_alloc_init(VisionCoreE5RTExecutionBoundPorts);
    v29 = *(void **)(v18 + 64);
    *(_QWORD *)(v18 + 64) = v28;

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v24 = *(id *)(v18 + 40);
    v30 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v41;
LABEL_25:
      v32 = 0;
      while (1)
      {
        if (*(_QWORD *)v41 != v31)
          objc_enumerationMutation(v24);
        if ((-[VisionCoreE5RTExecutionContext _bindOutput:ofOutputObjects:recordingPortHandleIn:error:](v18, *(void **)(*((_QWORD *)&v40 + 1) + 8 * v32), *(void **)(v18 + 40), *(void **)(v18 + 64), a5) & 1) == 0)break;
        if (v30 == ++v32)
        {
          v30 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          if (v30)
            goto LABEL_25;
          goto LABEL_31;
        }
      }
LABEL_43:

      v19 = v37;
      goto LABEL_44;
    }
LABEL_31:

    v19 = v37;
  }
  v33 = e5rt_execution_stream_create();
  if (!(_DWORD)v33)
  {
    if (!*(_BYTE *)(v18 + 48))
      goto LABEL_56;
    v33 = e5rt_execution_stream_encode_operation();
    if ((_DWORD)v33)
    {
      if (!a5)
        goto LABEL_44;
      goto LABEL_34;
    }
    if (!objc_msgSend(v19, "prewireInUseAllocations", v33)
      || (v33 = e5rt_execution_stream_prewire_in_use_allocations(), !(_DWORD)v33))
    {
LABEL_56:

      v14 = (id)v18;
      goto LABEL_46;
    }
    if (!a5)
      goto LABEL_44;
LABEL_34:
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v33);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_44;
  }
  if (a5)
    goto LABEL_34;
LABEL_44:

LABEL_45:
  v14 = 0;
LABEL_46:

  if (v39)
    e5rt_execution_stream_operation_release();
  _VisionCoreSignpostLog();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v35))
  {
    *(_WORD *)v38 = 0;
    _os_signpost_emit_with_name_impl(&dword_21DED3000, v35, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionCoreE5RTCreateFunctionExecutionContext", (const char *)&unk_21DF063BD, v38, 2u);
  }

LABEL_51:
  return v14;
}

@end
