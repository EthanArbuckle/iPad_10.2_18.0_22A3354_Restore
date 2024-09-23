@implementation PMLMultiLabelE5Classifier

- (void)dealloc
{
  objc_super v3;

  if (self->_main_esop)
    e5rt_execution_stream_operation_release();
  if (self->_input_port)
    e5rt_io_port_release();
  if (self->_input_tensor)
    e5rt_tensor_desc_release();
  if (self->_input_tensor_dtype)
    e5rt_tensor_desc_dtype_release();
  if (self->_input_buffer)
    e5rt_buffer_object_release();
  if (self->_output_port)
    e5rt_io_port_release();
  if (self->_output_tensor)
    e5rt_tensor_desc_release();
  if (self->_output_tensor_dtype)
    e5rt_tensor_desc_dtype_release();
  if (self->_output_buffer)
    e5rt_buffer_object_release();
  if (self->_execution_stream)
    e5rt_execution_stream_release();
  v3.receiver = self;
  v3.super_class = (Class)PMLMultiLabelE5Classifier;
  -[PMLMultiLabelE5Classifier dealloc](&v3, sel_dealloc);
}

- (PMLMultiLabelE5Classifier)initWithE5File:(id)a3
{
  id v3;
  PMLMultiLabelE5Classifier *v4;
  _BOOL4 v5;
  PMLMultiLabelE5Classifier *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PMLMultiLabelE5Classifier;
  v3 = a3;
  v4 = -[PMLMultiLabelE5Classifier init](&v8, sel_init);
  v5 = -[PMLMultiLabelE5Classifier initializeNetworkWithE5File:](v4, "initializeNetworkWithE5File:", v3, v8.receiver, v8.super_class);

  if (v5)
    v6 = v4;
  else
    v6 = 0;

  return v6;
}

- (BOOL)initializeNetworkWithE5File:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  __CFString *v6;
  uint64_t last_error_message;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint32_t v18;
  BOOL v19;
  int v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  int v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  int v45;
  const __CFString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  PML_LogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v45 = 138412290;
    v46 = v4;
    _os_log_impl(&dword_2159BB000, v5, OS_LOG_TYPE_DEFAULT, "Initializing E5 model using %@", (uint8_t *)&v45, 0xCu);
  }

  v6 = objc_retainAutorelease(v4);
  -[__CFString UTF8String](v6, "UTF8String");
  if (e5rt_execution_stream_operation_create_precompiled_compute_operation())
  {
    last_error_message = e5rt_get_last_error_message();
    PML_LogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2159BB000, v8, OS_LOG_TYPE_ERROR, "Failed to create execution stream operation", (uint8_t *)&v45, 2u);
    }

    PML_LogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    v45 = 136315138;
    v46 = (const __CFString *)last_error_message;
    v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  objc_msgSend(CFSTR("inputSequence"), "UTF8String");
  if (e5rt_execution_stream_operation_retain_input_port())
  {
    v11 = e5rt_get_last_error_message();
    PML_LogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v45 = 138412290;
      v46 = CFSTR("inputSequence");
      _os_log_error_impl(&dword_2159BB000, v12, OS_LOG_TYPE_ERROR, "Failed to retain handle to input port %@", (uint8_t *)&v45, 0xCu);
    }

    PML_LogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    v45 = 136315138;
    v46 = (const __CFString *)v11;
    v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  if (e5rt_io_port_retain_tensor_desc())
  {
    v13 = e5rt_get_last_error_message();
    PML_LogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2159BB000, v14, OS_LOG_TYPE_ERROR, "Unable to retain E5 input tensor descriptor", (uint8_t *)&v45, 2u);
    }

    PML_LogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    v45 = 136315138;
    v46 = (const __CFString *)v13;
    v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  if (e5rt_tensor_desc_retain_dtype())
  {
    v15 = e5rt_get_last_error_message();
    PML_LogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2159BB000, v16, OS_LOG_TYPE_ERROR, "Unable to retain E5 input tensor dtype", (uint8_t *)&v45, 2u);
    }

    PML_LogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    v45 = 136315138;
    v46 = (const __CFString *)v15;
    v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  v21 = DescribeTensorDescriptor(objc_msgSend(CFSTR("inputSequence"), "UTF8String"));
  if (v21 == -1)
  {
    PML_LogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    LOWORD(v45) = 0;
    v10 = "Something went wrong while trying to introspect the E5 input tensor";
    goto LABEL_35;
  }
  self->_inputNumParameters = v21;
  if (e5rt_tensor_desc_alloc_buffer_object())
  {
    v22 = e5rt_get_last_error_message();
    PML_LogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2159BB000, v23, OS_LOG_TYPE_ERROR, "Unable to allocate E5 input buffer object", (uint8_t *)&v45, 2u);
    }

    PML_LogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    v45 = 136315138;
    v46 = (const __CFString *)v22;
    v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  if (e5rt_io_port_bind_buffer_object())
  {
    v24 = e5rt_get_last_error_message();
    PML_LogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2159BB000, v25, OS_LOG_TYPE_ERROR, "Unable to bind E5 input buffer to input port", (uint8_t *)&v45, 2u);
    }

    PML_LogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    v45 = 136315138;
    v46 = (const __CFString *)v24;
    v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  objc_msgSend(CFSTR("outputLabels"), "UTF8String");
  if (e5rt_execution_stream_operation_retain_output_port())
  {
    v26 = e5rt_get_last_error_message();
    PML_LogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2159BB000, v27, OS_LOG_TYPE_ERROR, "Unable to retain E5 output port", (uint8_t *)&v45, 2u);
    }

    PML_LogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    v45 = 136315138;
    v46 = (const __CFString *)v26;
    v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  if (e5rt_io_port_retain_tensor_desc())
  {
    v28 = e5rt_get_last_error_message();
    PML_LogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2159BB000, v29, OS_LOG_TYPE_ERROR, "Unable to retain E5 output tensor descriptor", (uint8_t *)&v45, 2u);
    }

    PML_LogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    v45 = 136315138;
    v46 = (const __CFString *)v28;
    v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  if (e5rt_tensor_desc_retain_dtype())
  {
    v30 = e5rt_get_last_error_message();
    PML_LogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2159BB000, v31, OS_LOG_TYPE_ERROR, "Unable to retain E5 output tensor dtype", (uint8_t *)&v45, 2u);
    }

    PML_LogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    v45 = 136315138;
    v46 = (const __CFString *)v30;
    v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  v32 = DescribeTensorDescriptor(objc_msgSend(CFSTR("outputLabels"), "UTF8String"));
  if (v32 == -1)
  {
    PML_LogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    LOWORD(v45) = 0;
    v10 = "Something went wrong while trying to introspect the E5 output tensor";
LABEL_35:
    v17 = v9;
    v18 = 2;
    goto LABEL_24;
  }
  self->_outputNumParameters = v32;
  if (e5rt_tensor_desc_alloc_buffer_object())
  {
    v33 = e5rt_get_last_error_message();
    PML_LogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2159BB000, v34, OS_LOG_TYPE_ERROR, "Unable to allocate E5 output buffer object", (uint8_t *)&v45, 2u);
    }

    PML_LogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    v45 = 136315138;
    v46 = (const __CFString *)v33;
    v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  if (e5rt_io_port_bind_buffer_object())
  {
    v35 = e5rt_get_last_error_message();
    PML_LogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2159BB000, v36, OS_LOG_TYPE_ERROR, "Unable to bind E5 output buffer to output port", (uint8_t *)&v45, 2u);
    }

    PML_LogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    v45 = 136315138;
    v46 = (const __CFString *)v35;
    v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  if (e5rt_execution_stream_create())
  {
    v37 = e5rt_get_last_error_message();
    PML_LogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2159BB000, v38, OS_LOG_TYPE_ERROR, "Unable to create E5 execution handle", (uint8_t *)&v45, 2u);
    }

    PML_LogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    v45 = 136315138;
    v46 = (const __CFString *)v37;
    v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  if (e5rt_execution_stream_encode_operation())
  {
    v39 = e5rt_get_last_error_message();
    PML_LogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2159BB000, v40, OS_LOG_TYPE_ERROR, "Unable to encode E5 execution stream", (uint8_t *)&v45, 2u);
    }

    PML_LogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    v45 = 136315138;
    v46 = (const __CFString *)v39;
    v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  if (e5rt_buffer_object_get_data_ptr())
  {
    v41 = e5rt_get_last_error_message();
    PML_LogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_2159BB000, v42, OS_LOG_TYPE_ERROR, "Unable to get data pointer to input buffer", (uint8_t *)&v45, 2u);
    }

    PML_LogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    v45 = 136315138;
    v46 = (const __CFString *)v41;
    v10 = "E5RT operation failed with message: %s";
    goto LABEL_23;
  }
  if (!e5rt_buffer_object_get_data_ptr())
  {
    v19 = 1;
    goto LABEL_26;
  }
  v43 = e5rt_get_last_error_message();
  PML_LogHandle();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v45) = 0;
    _os_log_error_impl(&dword_2159BB000, v44, OS_LOG_TYPE_ERROR, "Unable to get data pointer to output buffer", (uint8_t *)&v45, 2u);
  }

  PML_LogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    v45 = 136315138;
    v46 = (const __CFString *)v43;
    v10 = "E5RT operation failed with message: %s";
LABEL_23:
    v17 = v9;
    v18 = 12;
LABEL_24:
    _os_log_fault_impl(&dword_2159BB000, v17, OS_LOG_TYPE_FAULT, v10, (uint8_t *)&v45, v18);
  }
LABEL_25:

  v19 = 0;
LABEL_26:

  return v19;
}

- (id)predict:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v9;
  double v10;
  unint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "sparseVectorToDense:length:", self->_input_ids, self->_inputNumParameters);
  v4 = e5rt_execution_stream_execute_sync();
  if ((_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", e5rt_get_last_error_message());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PML_LogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v13 = 138412546;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      _os_log_fault_impl(&dword_2159BB000, v7, OS_LOG_TYPE_FAULT, "Unable to execute E5 stream w/ error code %@: %@", (uint8_t *)&v13, 0x16u);
    }

    return 0;
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", self->_outputNumParameters);
    if (self->_outputNumParameters)
    {
      v11 = 0;
      do
      {
        *(float *)&v10 = self->_output_scores[v11];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:atIndexedSubscript:", v12, v11);

        ++v11;
      }
      while (v11 < self->_outputNumParameters);
    }
    return v9;
  }
}

- (unint64_t)outputDimension
{
  return self->_outputNumParameters;
}

+ (id)classifierWithE5File:(id)a3
{
  id v3;
  PMLMultiLabelE5Classifier *v4;

  v3 = a3;
  v4 = -[PMLMultiLabelE5Classifier initWithE5File:]([PMLMultiLabelE5Classifier alloc], "initWithE5File:", v3);

  return v4;
}

@end
