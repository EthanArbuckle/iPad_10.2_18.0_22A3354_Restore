@implementation VIE5Runner

- (VIE5Runner)initWithBundleURL:(id)a3 mainFunctionName:(id)a4
{
  id v7;
  id v8;
  VIE5Runner *v9;
  VIE5Runner *v10;
  NSDictionary *v11;
  NSDictionary *outputPorts;
  NSDictionary *boundInputs;
  NSDictionary *boundOutputs;
  VIE5Runner *v15;
  VIE5Runner *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VIE5Runner;
  v9 = -[VIE5Runner init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_bundleURL, a3);
    objc_storeStrong((id *)&v10->_mainFunctionName, a4);
    v11 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    outputPorts = v10->_outputPorts;
    v10->_outputPorts = v11;

    *(_WORD *)&v10->_allocateInputs = 257;
    boundInputs = v10->_boundInputs;
    v10->_boundInputs = 0;

    boundOutputs = v10->_boundOutputs;
    v10->_boundOutputs = 0;

    if (-[VIE5Runner initNetworks](v10, "initNetworks"))
      v15 = 0;
    else
      v15 = v10;
    v16 = v15;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[VIE5Runner releaseNetworks](self, "releaseNetworks");
  v3.receiver = self;
  v3.super_class = (Class)VIE5Runner;
  -[VIE5Runner dealloc](&v3, sel_dealloc);
}

- (__CVBuffer)getInputImageBuffer:(id)a3
{
  void *v3;
  __CVBuffer *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_boundInputs, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (__CVBuffer *)objc_msgSend(v3, "pointerValue");

  return v4;
}

+ (int)surfaceTypeE5rtType:(int)a3 toVIType:(unint64_t *)a4
{
  int result;

  if (a3 > 5)
    return 5;
  result = 0;
  *a4 = a3;
  return result;
}

+ (int)tensorDTypeE5rtType:(int)a3 toVIType:(unint64_t *)a4
{
  int result;

  if (a3 > 4)
    return 5;
  result = 0;
  *a4 = a3;
  return result;
}

+ (int)getPort:(e5rt_io_port *)a3 description:(id *)a4
{
  int is_surface;
  int v6;
  uint64_t last_error_message;
  NSObject *v8;
  int is_tensor;
  uint64_t v10;
  NSObject *v12;
  int v13;
  uint64_t v14;
  int width;
  uint64_t v16;
  int height;
  uint64_t v18;
  int format;
  uint64_t v20;
  int plane_count;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  VIE5RunnerPortDesc *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int16 v39;
  _QWORD v40[2];
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v39 = 0;
  is_surface = e5rt_io_port_is_surface();
  if (is_surface)
  {
    v6 = is_surface;
    last_error_message = e5rt_get_last_error_message();
    if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
    {
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v42 = last_error_message;
LABEL_9:
        _os_log_impl(&dword_1D467C000, v8, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", buf, 0xCu);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    return v6;
  }
  is_tensor = e5rt_io_port_is_tensor();
  if (!is_tensor)
  {
    if (v39 == HIBYTE(v39))
    {
      if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
      {
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D467C000, v12, OS_LOG_TYPE_ERROR, "VI5ERunner: only surface/tensor ports are supported", buf, 2u);
        }

      }
      return 5;
    }
    v38 = 0;
    v13 = e5rt_io_port_retain_surface_desc();
    if (v13)
    {
      v6 = v13;
      v14 = e5rt_get_last_error_message();
      if (!+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
        return v6;
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      *(_DWORD *)buf = 136446210;
      v42 = v14;
      goto LABEL_9;
    }
    v37 = 0;
    v36 = 0;
    width = e5rt_surface_desc_get_width();
    if (width)
    {
      v6 = width;
      v16 = e5rt_get_last_error_message();
      if (!+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
        return v6;
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      *(_DWORD *)buf = 136446210;
      v42 = v16;
      goto LABEL_9;
    }
    height = e5rt_surface_desc_get_height();
    if (height)
    {
      v6 = height;
      v18 = e5rt_get_last_error_message();
      if (!+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
        return v6;
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      *(_DWORD *)buf = 136446210;
      v42 = v18;
      goto LABEL_9;
    }
    LODWORD(v33) = 0;
    format = e5rt_surface_desc_get_format();
    if (format)
    {
      v6 = format;
      v20 = e5rt_get_last_error_message();
      if (!+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
        return v6;
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      *(_DWORD *)buf = 136446210;
      v42 = v20;
      goto LABEL_9;
    }
    v35 = 0;
    plane_count = e5rt_surface_desc_get_plane_count();
    if (plane_count)
    {
      v6 = plane_count;
      v22 = e5rt_get_last_error_message();
      if (!+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
        return v6;
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      *(_DWORD *)buf = 136446210;
      v42 = v22;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v36);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v23;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v37);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0;
    v26 = +[VIE5Runner surfaceTypeE5rtType:toVIType:](VIE5Runner, "surfaceTypeE5rtType:toVIType:", v33, &v34);
    if (v26)
    {
      v6 = v26;
      v27 = e5rt_get_last_error_message();
      if (!+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
      {
LABEL_48:

        return v6;
      }
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
LABEL_47:

        goto LABEL_48;
      }
      *(_DWORD *)buf = 136446210;
      v42 = v27;
    }
    else
    {
      v29 = v34;
      v30 = [VIE5RunnerPortDesc alloc];
      v31 = (void *)objc_msgSend(v25, "copy");
      *a4 = -[VIE5RunnerPortDesc initWithShape:type:dtype:csize:strides:](v30, "initWithShape:type:dtype:csize:strides:", v31, 0, v29, v35, MEMORY[0x1E0C9AA60]);

      v6 = e5rt_surface_desc_release();
      if (!v6)
        goto LABEL_48;
      v32 = e5rt_get_last_error_message();
      if (!+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
        goto LABEL_48;
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        goto LABEL_47;
      *(_DWORD *)buf = 136446210;
      v42 = v32;
    }
    _os_log_impl(&dword_1D467C000, v28, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", buf, 0xCu);
    goto LABEL_47;
  }
  v6 = is_tensor;
  v10 = e5rt_get_last_error_message();
  if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
  {
    +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v42 = v10;
      goto LABEL_9;
    }
LABEL_10:

  }
  return v6;
}

+ (int)allocatePort:(e5rt_io_port *)a3 description:(id)a4 io:(id *)a5
{
  id v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  size_t v11;
  void *v12;
  void *v13;
  size_t v14;
  __CVBuffer *v15;
  int v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  uint64_t last_error_message;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int data_ptr;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (objc_msgSend(v6, "type"))
  {
    if (objc_msgSend(v6, "type") == 1)
    {
      if (objc_msgSend(v6, "dtype") != 4 && objc_msgSend(v6, "csize") == 4)
      {
        if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
        {
          +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v8 = "VI5ERunner: only float32 output tensors are supported at the moment, specify io_bind_info to add conversion ops";
LABEL_25:
            _os_log_impl(&dword_1D467C000, v7, OS_LOG_TYPE_ERROR, v8, buf, 2u);
            goto LABEL_26;
          }
          goto LABEL_26;
        }
        goto LABEL_27;
      }
      v21 = e5rt_io_port_retain_tensor_desc();
      if (v21)
      {
        v17 = v21;
        last_error_message = e5rt_get_last_error_message();
        if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
        {
          +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            v37 = last_error_message;
            goto LABEL_56;
          }
          goto LABEL_57;
        }
      }
      else
      {
        v23 = e5rt_tensor_desc_alloc_buffer_object();
        if (v23)
        {
          v17 = v23;
          v24 = e5rt_get_last_error_message();
          if (!+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
            goto LABEL_58;
          +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            v37 = v24;
            goto LABEL_56;
          }
          goto LABEL_57;
        }
        v27 = e5rt_io_port_bind_buffer_object();
        if (v27)
        {
          v17 = v27;
          v28 = e5rt_get_last_error_message();
          if (!+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
            goto LABEL_58;
          +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            v37 = v28;
            goto LABEL_56;
          }
          goto LABEL_57;
        }
        data_ptr = e5rt_buffer_object_get_data_ptr();
        if (data_ptr)
        {
          v17 = data_ptr;
          v31 = e5rt_get_last_error_message();
          if (!+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
            goto LABEL_58;
          +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            v37 = v31;
            goto LABEL_56;
          }
          goto LABEL_57;
        }
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        v32 = e5rt_tensor_desc_release();
        if (v32)
        {
          v17 = v32;
          v33 = e5rt_get_last_error_message();
          if (!+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
            goto LABEL_58;
          +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            v37 = v33;
            goto LABEL_56;
          }
          goto LABEL_57;
        }
        v17 = e5rt_buffer_object_release();
        if (v17)
        {
          v34 = e5rt_get_last_error_message();
          if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
          {
            +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446210;
              v37 = v34;
              goto LABEL_56;
            }
            goto LABEL_57;
          }
        }
      }
    }
    else
    {
      if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
      {
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D467C000, v20, OS_LOG_TYPE_ERROR, "unsupported port type", buf, 2u);
        }

      }
      v17 = 5;
    }
  }
  else
  {
    if (objc_msgSend(v6, "dtype") != 2)
    {
      if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
      {
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v8 = "VI5ERunner: only 32BGRA input format is supported at the moment";
          goto LABEL_25;
        }
LABEL_26:

      }
LABEL_27:
      v17 = 0;
      goto LABEL_58;
    }
    objc_msgSend(v6, "shape");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedLongValue");

    objc_msgSend(v6, "shape");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedLongValue");

    v15 = VICreateCVPixelBufferWithFormat(v11, v14, 0x42475241u);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    CVPixelBufferGetIOSurface(v15);
    v16 = e5rt_surface_object_create_from_iosurface();
    if (v16)
    {
      v17 = v16;
      v18 = e5rt_get_last_error_message();
      if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
      {
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v37 = v18;
LABEL_56:
          _os_log_impl(&dword_1D467C000, v19, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", buf, 0xCu);
        }
LABEL_57:

      }
    }
    else
    {
      v25 = e5rt_io_port_bind_surface_object();
      if (v25)
      {
        v17 = v25;
        v26 = e5rt_get_last_error_message();
        if (!+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
          goto LABEL_58;
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v37 = v26;
          goto LABEL_56;
        }
        goto LABEL_57;
      }
      v17 = e5rt_surface_object_release();
      if (v17)
      {
        v29 = e5rt_get_last_error_message();
        if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
        {
          +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            v37 = v29;
            goto LABEL_56;
          }
          goto LABEL_57;
        }
      }
    }
  }
LABEL_58:

  return v17;
}

- (int)initNetworks
{
  int v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  int num_inputs;
  uint64_t last_error_message;
  NSObject *v11;
  char *v12;
  size_t v13;
  int input_names;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSDictionary *v24;
  NSDictionary *inputs;
  NSDictionary *v26;
  NSDictionary *inputPorts;
  NSArray *v28;
  NSArray *inputNames;
  int num_outputs;
  uint64_t v31;
  NSObject *v32;
  char *v33;
  size_t v34;
  int output_names;
  uint64_t v36;
  uint64_t v38;
  _BOOL4 v39;
  uint64_t v40;
  _BOOL4 v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  NSDictionary *v50;
  NSDictionary *outputs;
  NSDictionary *v52;
  NSDictionary *outputPorts;
  NSArray *v54;
  NSArray *outputNames;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  id v65;
  NSDictionary *v66;
  NSDictionary *boundInputs;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  id v76;
  NSDictionary *v77;
  NSDictionary *boundOutputs;
  int v79;
  uint64_t v80;
  _BOOL4 v81;
  uint64_t v82;
  _BOOL4 v83;
  NSObject *v84;
  uint64_t v85;
  _BOOL4 v86;
  uint64_t v87;
  _BOOL4 v88;
  NSObject *v89;
  uint64_t v90;
  _BOOL4 v91;
  uint64_t v92;
  NSDictionary *v93;
  id v94;
  id v95;
  id v96;
  id v97;
  NSDictionary **v98;
  id v99;
  NSObject *v100;
  id v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  id v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  id v112;
  uint64_t v113;
  id v114;
  unint64_t v115;
  unint64_t v116;
  _BYTE v117[128];
  uint8_t v118[128];
  uint8_t buf[4];
  uint64_t v120;
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v3 = -[VIE5Runner loadPrecompiledNetwork](self, "loadPrecompiledNetwork");
  if (!v3)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v116 = 0;
    num_inputs = e5rt_execution_stream_operation_get_num_inputs();
    if (num_inputs)
    {
      v4 = num_inputs;
      last_error_message = e5rt_get_last_error_message();
      if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
      {
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v120 = last_error_message;
          _os_log_impl(&dword_1D467C000, v11, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", buf, 0xCu);
        }

      }
      goto LABEL_39;
    }
    v98 = &v93;
    v12 = (char *)&v93 - ((8 * v116 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (8 * v116 >= 0x200)
      v13 = 512;
    else
      v13 = 8 * v116;
    bzero((char *)&v93 - ((8 * v116 + 15) & 0xFFFFFFFFFFFFFFF0), v13);
    input_names = e5rt_execution_stream_operation_get_input_names();
    if (input_names)
    {
      v4 = input_names;
      v15 = e5rt_get_last_error_message();
      if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
      {
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v120 = v15;
LABEL_17:
          _os_log_impl(&dword_1D467C000, v16, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", buf, 0xCu);
        }
LABEL_18:

      }
LABEL_39:

LABEL_40:
      return v4;
    }
    v100 = v6;
    v101 = v8;
    v99 = v7;
    if (v116)
    {
      v17 = 0;
      while (1)
      {
        v18 = *(_QWORD *)&v12[8 * v17];
        v115 = 0;
        v19 = e5rt_execution_stream_operation_retain_input_port();
        if (v19)
          break;
        v114 = 0;
        v4 = +[VIE5Runner getPort:description:](VIE5Runner, "getPort:description:", v115, &v114);
        v20 = v114;
        if (v4)
        {
          v40 = e5rt_get_last_error_message();
          v41 = +[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage");
          v7 = v99;
          v6 = v100;
          if (v41)
          {
            +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446210;
              v120 = v40;
              _os_log_impl(&dword_1D467C000, v42, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", buf, 0xCu);
            }

          }
          v8 = v101;
          goto LABEL_39;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v18, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v100, "setObject:forKeyedSubscript:", v20, v21);

        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v18);
        objc_msgSend(v101, "addObject:", v22);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v115);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "setObject:forKey:", v23, v22);

        if (++v17 >= v116)
          goto LABEL_25;
      }
      v4 = v19;
      v38 = e5rt_get_last_error_message();
      v39 = +[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage");
      v7 = v99;
      v6 = v100;
      v8 = v101;
      if (!v39)
        goto LABEL_39;
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v120 = v38;
        goto LABEL_17;
      }
      goto LABEL_18;
    }
LABEL_25:
    v6 = v100;
    v24 = -[NSObject copy](v100, "copy");
    inputs = self->_inputs;
    self->_inputs = v24;

    v7 = v99;
    v26 = (NSDictionary *)objc_msgSend(v99, "copy");
    inputPorts = self->_inputPorts;
    self->_inputPorts = v26;

    v8 = v101;
    v28 = (NSArray *)objc_msgSend(v101, "copy");
    inputNames = self->_inputNames;
    self->_inputNames = v28;

    v97 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v96 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v95 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v115 = 0;
    num_outputs = e5rt_execution_stream_operation_get_num_outputs();
    if (num_outputs)
    {
      v4 = num_outputs;
      v31 = e5rt_get_last_error_message();
      if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
      {
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v120 = v31;
LABEL_36:
          _os_log_impl(&dword_1D467C000, v32, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", buf, 0xCu);
          goto LABEL_37;
        }
        goto LABEL_37;
      }
      goto LABEL_38;
    }
    v33 = (char *)&v93 - ((8 * v115 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (8 * v115 >= 0x200)
      v34 = 512;
    else
      v34 = 8 * v115;
    bzero((char *)&v93 - ((8 * v115 + 15) & 0xFFFFFFFFFFFFFFF0), v34);
    output_names = e5rt_execution_stream_operation_get_output_names();
    if (output_names)
    {
      v4 = output_names;
      v36 = e5rt_get_last_error_message();
      if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
      {
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v120 = v36;
          goto LABEL_36;
        }
LABEL_37:

      }
LABEL_38:

      goto LABEL_39;
    }
    if (v115)
    {
      v43 = 0;
      while (1)
      {
        v44 = *(_QWORD *)&v33[8 * v43];
        v113 = 0;
        v45 = e5rt_execution_stream_operation_retain_output_port();
        if (v45)
          break;
        v112 = 0;
        v4 = +[VIE5Runner getPort:description:](VIE5Runner, "getPort:description:", v113, &v112);
        v46 = v112;
        if (v4)
        {
          v87 = e5rt_get_last_error_message();
          v88 = +[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage");
          v7 = v99;
          v6 = v100;
          if (v88)
          {
            +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
            v89 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446210;
              v120 = v87;
              _os_log_impl(&dword_1D467C000, v89, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", buf, 0xCu);
            }

          }
          goto LABEL_38;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v44, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "setObject:forKeyedSubscript:", v46, v47);

        v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v44);
        objc_msgSend(v95, "addObject:", v48);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v113);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "setObject:forKey:", v49, v48);

        v8 = v101;
        if (++v43 >= v115)
          goto LABEL_55;
      }
      v4 = v45;
      v85 = e5rt_get_last_error_message();
      v86 = +[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage");
      v7 = v99;
      v6 = v100;
      if (!v86)
        goto LABEL_38;
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v120 = v85;
        goto LABEL_36;
      }
      goto LABEL_37;
    }
LABEL_55:
    v50 = (NSDictionary *)objc_msgSend(v97, "copy");
    outputs = self->_outputs;
    self->_outputs = v50;

    v52 = (NSDictionary *)objc_msgSend(v96, "copy");
    outputPorts = self->_outputPorts;
    self->_outputPorts = v52;

    v54 = (NSArray *)objc_msgSend(v95, "copy");
    outputNames = self->_outputNames;
    self->_outputNames = v54;

    if (self->_allocateInputs)
    {
      v94 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v108 = 0u;
      v109 = 0u;
      v110 = 0u;
      v111 = 0u;
      v93 = self->_inputPorts;
      v56 = -[NSDictionary countByEnumeratingWithState:objects:count:](v93, "countByEnumeratingWithState:objects:count:", &v108, v118, 16);
      if (v56)
      {
        v57 = v56;
        v58 = *(_QWORD *)v109;
LABEL_58:
        v59 = 0;
        while (1)
        {
          if (*(_QWORD *)v109 != v58)
            objc_enumerationMutation(v93);
          v60 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * v59);
          -[NSDictionary objectForKeyedSubscript:](self->_inputPorts, "objectForKeyedSubscript:", v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v61, "pointerValue");
          -[NSDictionary objectForKeyedSubscript:](self->_inputs, "objectForKeyedSubscript:", v60);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = 0;
          v4 = +[VIE5Runner allocatePort:description:io:](VIE5Runner, "allocatePort:description:io:", v62, v63, &v107);
          v64 = v107;

          if (v4)
            break;
          objc_msgSend(v94, "setValue:forKey:", v64, v60);

          if (v57 == ++v59)
          {
            v57 = -[NSDictionary countByEnumeratingWithState:objects:count:](v93, "countByEnumeratingWithState:objects:count:", &v108, v118, 16);
            if (v57)
              goto LABEL_58;
            goto LABEL_64;
          }
        }
        v82 = e5rt_get_last_error_message();
        v83 = +[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage");
        v7 = v99;
        v6 = v100;
        if (!v83)
          goto LABEL_95;
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v120 = v82;
LABEL_93:
          _os_log_impl(&dword_1D467C000, v84, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", buf, 0xCu);
        }
        goto LABEL_94;
      }
LABEL_64:

      v65 = v94;
      v66 = (NSDictionary *)objc_msgSend(v94, "copy");
      boundInputs = self->_boundInputs;
      self->_boundInputs = v66;

      v8 = v101;
    }
    if (self->_allocateOutputs)
    {
      v94 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v103 = 0u;
      v104 = 0u;
      v105 = 0u;
      v106 = 0u;
      v93 = self->_outputPorts;
      v68 = -[NSDictionary countByEnumeratingWithState:objects:count:](v93, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
      if (v68)
      {
        v69 = v68;
        v70 = *(_QWORD *)v104;
LABEL_68:
        v71 = 0;
        while (1)
        {
          if (*(_QWORD *)v104 != v70)
            objc_enumerationMutation(v93);
          v72 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * v71);
          -[NSDictionary objectForKeyedSubscript:](self->_outputPorts, "objectForKeyedSubscript:", v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = objc_msgSend(v73, "pointerValue");
          -[NSDictionary objectForKeyedSubscript:](self->_outputs, "objectForKeyedSubscript:", v72);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = 0;
          v4 = +[VIE5Runner allocatePort:description:io:](VIE5Runner, "allocatePort:description:io:", v74, v75, &v102);
          v64 = v102;

          if (v4)
            break;
          objc_msgSend(v94, "setValue:forKey:", v64, v72);

          if (v69 == ++v71)
          {
            v69 = -[NSDictionary countByEnumeratingWithState:objects:count:](v93, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
            if (v69)
              goto LABEL_68;
            goto LABEL_74;
          }
        }
        v90 = e5rt_get_last_error_message();
        v91 = +[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage");
        v7 = v99;
        v6 = v100;
        if (!v91)
          goto LABEL_95;
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v120 = v90;
          goto LABEL_93;
        }
LABEL_94:

LABEL_95:
        v8 = v101;
        goto LABEL_38;
      }
LABEL_74:

      v76 = v94;
      v77 = (NSDictionary *)objc_msgSend(v94, "copy");
      boundOutputs = self->_boundOutputs;
      self->_boundOutputs = v77;

      v8 = v101;
    }
    v79 = e5rt_execution_stream_create();
    if (v79)
    {
      v4 = v79;
      v80 = e5rt_get_last_error_message();
      v81 = +[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage");
      v7 = v99;
      v6 = v100;
      if (!v81)
        goto LABEL_38;
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v32 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        goto LABEL_37;
      *(_DWORD *)buf = 136446210;
      v120 = v80;
    }
    else
    {
      v4 = e5rt_execution_stream_encode_operation();
      v7 = v99;
      v6 = v100;
      if (!v4)
        goto LABEL_38;
      v92 = e5rt_get_last_error_message();
      if (!+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
        goto LABEL_38;
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v32 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        goto LABEL_37;
      *(_DWORD *)buf = 136446210;
      v120 = v92;
    }
    goto LABEL_36;
  }
  v4 = v3;
  v5 = e5rt_get_last_error_message();
  if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
  {
    +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v120 = v5;
      _os_log_impl(&dword_1D467C000, v6, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", buf, 0xCu);
    }
    goto LABEL_40;
  }
  return v4;
}

- (int)loadPrecompiledNetwork
{
  id v3;
  int precompiled_compute_operation;
  uint64_t last_error_message;
  NSObject *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[NSURL path](self->_bundleURL, "path");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "UTF8String");
  -[NSString UTF8String](self->_mainFunctionName, "UTF8String");
  precompiled_compute_operation = e5rt_execution_stream_operation_create_precompiled_compute_operation();

  if (precompiled_compute_operation)
  {
    last_error_message = e5rt_get_last_error_message();
    if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
    {
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v8 = 136446210;
        v9 = last_error_message;
        _os_log_impl(&dword_1D467C000, v6, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", (uint8_t *)&v8, 0xCu);
      }

    }
  }
  return precompiled_compute_operation;
}

- (int)compileNetworksOnDevice
{
  int v3;
  int precompiled_compute_operation_with_options;
  uint64_t last_error_message;
  NSObject *v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  char v12;
  BOOL v13;
  int v14;
  id v15;
  int v16;
  int v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = e5rt_e5_compiler_options_create();
  if (v3)
  {
    precompiled_compute_operation_with_options = v3;
    last_error_message = e5rt_get_last_error_message();
    if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
    {
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v24 = last_error_message;
LABEL_13:
        _os_log_impl(&dword_1D467C000, v6, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", buf, 0xCu);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
  else
  {
    v7 = e5rt_e5_compiler_options_set_compute_device_types_mask();
    if (v7)
    {
      precompiled_compute_operation_with_options = v7;
      v8 = e5rt_get_last_error_message();
      if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
      {
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v24 = v8;
          goto LABEL_13;
        }
LABEL_14:

      }
    }
    else
    {
      v9 = e5rt_e5_compiler_create();
      if (!v9)
      {
        v12 = 0;
        v13 = 0;
        while (1)
        {
          if (v13)
          {
            v14 = e5rt_e5_compiler_options_set_force_recompilation();
            if (v14)
              break;
          }
          -[NSURL path](self->_bundleURL, "path");
          v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v15, "UTF8String");
          precompiled_compute_operation_with_options = e5rt_e5_compiler_compile();

          if (precompiled_compute_operation_with_options)
          {
            v19 = e5rt_get_last_error_message();
            if (!+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
              return precompiled_compute_operation_with_options;
            +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
            v6 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446210;
              v24 = v19;
              goto LABEL_13;
            }
            goto LABEL_14;
          }
          -[NSString UTF8String](self->_mainFunctionName, "UTF8String");
          v16 = e5rt_program_library_retain_program_function();
          if (v16)
          {
            precompiled_compute_operation_with_options = v16;
            v20 = e5rt_get_last_error_message();
            if (!+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
              return precompiled_compute_operation_with_options;
            +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
            v6 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446210;
              v24 = v20;
              goto LABEL_13;
            }
            goto LABEL_14;
          }
          v17 = e5rt_precompiled_compute_op_create_options_create_with_program_function();
          if (v17)
          {
            precompiled_compute_operation_with_options = v17;
            v21 = e5rt_get_last_error_message();
            if (!+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
              return precompiled_compute_operation_with_options;
            +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
            v6 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446210;
              v24 = v21;
              goto LABEL_13;
            }
            goto LABEL_14;
          }
          precompiled_compute_operation_with_options = e5rt_execution_stream_operation_create_precompiled_compute_operation_with_options();
          e5rt_precompiled_compute_op_create_options_release();
          e5rt_program_function_release();
          e5rt_program_library_release();
          v13 = precompiled_compute_operation_with_options == 13;
          v18 = v12 | (precompiled_compute_operation_with_options != 13);
          v12 = 1;
          if ((v18 & 1) != 0)
          {
            e5rt_e5_compiler_release();
            e5rt_e5_compiler_options_release();
            return precompiled_compute_operation_with_options;
          }
        }
        precompiled_compute_operation_with_options = v14;
        v22 = e5rt_get_last_error_message();
        if (!+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
          return precompiled_compute_operation_with_options;
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v24 = v22;
          goto LABEL_13;
        }
        goto LABEL_14;
      }
      precompiled_compute_operation_with_options = v9;
      v10 = e5rt_get_last_error_message();
      if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
      {
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v24 = v10;
          goto LABEL_13;
        }
        goto LABEL_14;
      }
    }
  }
  return precompiled_compute_operation_with_options;
}

+ (void)releasePorts:(id)a3 descriptions:(id)a4 boundedIOs:(id)a5 wasBound:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v6 = a6;
  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(v9);
        objc_msgSend(v9, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          v31 = objc_msgSend(v16, "pointerValue");
          e5rt_io_port_release();
        }

      }
      v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v13);
  }
  if (v6)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v18 = v11;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
          objc_msgSend(v18, "objectForKey:", v23, (_QWORD)v27);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "type");

            if (!v26)
              CVPixelBufferRelease((CVPixelBufferRef)objc_msgSend(v24, "pointerValue"));
          }

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v20);
    }

  }
}

- (void)releaseNetworks
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  e5rt_execution_stream_operation_release();
  e5rt_execution_stream_release();
  +[VIE5Runner releasePorts:descriptions:boundedIOs:wasBound:](VIE5Runner, "releasePorts:descriptions:boundedIOs:wasBound:", self->_inputPorts, self->_inputs, self->_boundInputs, self->_allocateInputs);
  +[VIE5Runner releasePorts:descriptions:boundedIOs:wasBound:](VIE5Runner, "releasePorts:descriptions:boundedIOs:wasBound:", self->_outputPorts, self->_outputs, self->_boundOutputs, self->_allocateOutputs);
  os_unfair_lock_unlock(p_lock);
}

- (int)execute
{
  int v2;
  uint64_t last_error_message;
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = e5rt_execution_stream_execute_sync();
  if (v2)
  {
    last_error_message = e5rt_get_last_error_message();
    if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
    {
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v6 = 136446210;
        v7 = last_error_message;
        _os_log_impl(&dword_1D467C000, v4, OS_LOG_TYPE_ERROR, "!!! E5RT operation failed with message = %{public}s", (uint8_t *)&v6, 0xCu);
      }

    }
  }
  return v2;
}

- (id)executeAndGet:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  const void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  __CFString *v24;
  NSObject *v25;
  os_unfair_lock_t lock;
  id v27;
  id obj;
  id *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  __CFString *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v6)
  {
    os_unfair_lock_lock(&self->_lock);
    if (-[VIE5Runner execute](self, "execute"))
    {
      if (a4)
      {
        v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
        *a4 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("com.apple.argos.e5rt"), 0, MEMORY[0x1E0C9AA70]);
      }
      os_unfair_lock_unlock(&self->_lock);
      v9 = v7;
      goto LABEL_16;
    }
    v29 = a4;
    lock = &self->_lock;
    v27 = v6;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v6;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          -[NSDictionary objectForKeyedSubscript:](self->_boundOutputs, "objectForKeyedSubscript:", v14, lock);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (const void *)objc_msgSend(v15, "pointerValue");

          v17 = objc_alloc(MEMORY[0x1E0C9E970]);
          -[NSDictionary objectForKeyedSubscript:](self->_outputs, "objectForKeyedSubscript:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "shape");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v17, "initWithShape:dataType:error:", v19, 65568, v29);

          if (!v20)
          {
            if (v29)
            {
              objc_msgSend(*v29, "localizedDescription");
              v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v24 = CFSTR("unknown");
            }
            v6 = v27;
            if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
            {
              +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v35 = v24;
                _os_log_impl(&dword_1D467C000, v25, OS_LOG_TYPE_ERROR, "VIE5Runner: unable to allocate output array: %{public}@", buf, 0xCu);
              }

            }
            os_unfair_lock_unlock(lock);
            v22 = v7;

            goto LABEL_17;
          }
          v21 = objc_retainAutorelease(v20);
          memcpy((void *)objc_msgSend(v21, "dataPointer"), v16, 4 * objc_msgSend(v21, "count"));
          objc_msgSend(v7, "setValue:forKey:", v21, v14);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        if (v11)
          continue;
        break;
      }
    }

    os_unfair_lock_unlock(lock);
    v6 = v27;
  }
  v9 = (id)objc_msgSend(v7, "copy", lock);
LABEL_16:
  v22 = v9;
LABEL_17:

  return v22;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSString)mainFunctionName
{
  return self->_mainFunctionName;
}

- (NSArray)inputNames
{
  return self->_inputNames;
}

- (NSArray)outputNames
{
  return self->_outputNames;
}

- (NSDictionary)inputs
{
  return self->_inputs;
}

- (NSDictionary)outputs
{
  return self->_outputs;
}

- (NSDictionary)boundInputs
{
  return self->_boundInputs;
}

- (NSDictionary)boundOutputs
{
  return self->_boundOutputs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundOutputs, 0);
  objc_storeStrong((id *)&self->_boundInputs, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_inputNames, 0);
  objc_storeStrong((id *)&self->_mainFunctionName, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_inputPorts, 0);
  objc_storeStrong((id *)&self->_outputPorts, 0);
}

@end
