@implementation SIE5RTTensorPortDescriptor

- (SIE5RTTensorPortDescriptor)initWithE5RTPort:(e5rt_io_port *)a3 portType:(int64_t)a4
{
  SIE5RTTensorPortDescriptor *v6;
  SIE5RTTensorPortDescriptor *v7;
  e5rt_tensor_desc **p_desc;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  e5rt_tensor_desc *v13;
  SIE5RTTensorPortDescriptor *v14;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  IOSurfaceID ID;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  OSType PixelFormat;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  objc_super v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  _BYTE v52[14];
  __int16 v53;
  size_t v54;
  __int16 v55;
  size_t v56;
  __int16 v57;
  void *v58;
  _QWORD v59[4];
  _QWORD v60[5];

  v60[4] = *MEMORY[0x24BDAC8D0];
  v46.receiver = self;
  v46.super_class = (Class)SIE5RTTensorPortDescriptor;
  v6 = -[SIE5RTTensorPortDescriptor init](&v46, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_10;
  p_desc = &v6->_desc;
  if (!e5rt_io_port_retain_tensor_desc())
  {
    v7->_port = a3;
    if (-[SIE5RTTensorPortDescriptor getComponentType](v7, "getComponentType"))
      v16 = 0;
    else
      v16 = -[SIE5RTTensorPortDescriptor getNumComponents](v7, "getNumComponents") == 4;
    v7->_isFP32 = -[SIE5RTTensorPortDescriptor isPackedFP32](v7, "isPackedFP32") || v16;
    v7->_isFP16_ANE = -[SIE5RTTensorPortDescriptor isFP16_ANE](v7, "isFP16_ANE");
    v7->_isS8_ANE = -[SIE5RTTensorPortDescriptor isS8_ANE](v7, "isS8_ANE");
    v7->_isU8_ANE = -[SIE5RTTensorPortDescriptor isU8_ANE](v7, "isU8_ANE");
    v7->_client_desc = -[SIE5RTTensorPortDescriptor createPackedFP32TensorDescriptor](v7, "createPackedFP32TensorDescriptor");
    if (a4 == 1)
    {
      v17 = -[SIE5RTTensorPortDescriptor getWidth](v7, "getWidth");
      v18 = -[SIE5RTTensorPortDescriptor getHeight](v7, "getHeight");
      if (-[SIE5RTTensorPortDescriptor getChannels](v7, "getChannels") == 1)
      {
        v19 = 1278226488;
        if (v7->_isFP32)
        {
          v19 = 1278226534;
        }
        else if (v7->_isFP16_ANE)
        {
          v19 = 1278226536;
        }
        else if (!v7->_isU8_ANE)
        {
          if (v7->_isS8_ANE)
            v19 = 1278226488;
          else
            v19 = 1111970369;
        }
        v59[0] = *MEMORY[0x24BDD8FD0];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v17);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v60[0] = v30;
        v59[1] = *MEMORY[0x24BDD8EB0];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v18);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v60[1] = v31;
        v59[2] = *MEMORY[0x24BDD8E30];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", SIBytesPerElementForPixelFormat(v19));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v60[2] = v32;
        v59[3] = *MEMORY[0x24BDD8EF8];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v19);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v60[3] = v33;
        v7->_memory_iosurface = IOSurfaceCreate((CFDictionaryRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 4));

        if (e5rt_buffer_object_create_from_iosurface())
        {
          __SceneIntelligenceLogSharedInstance();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 120);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136381187;
            v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
            v49 = 1025;
            v50 = 120;
            v51 = 2113;
            *(_QWORD *)v52 = v35;
            _os_log_impl(&dword_21071A000, v34, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

          }
          __SceneIntelligenceLogSharedInstance();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            ID = IOSurfaceGetID(v7->_memory_iosurface);
            Width = IOSurfaceGetWidth(v7->_memory_iosurface);
            Height = IOSurfaceGetHeight(v7->_memory_iosurface);
            BytesPerRow = IOSurfaceGetBytesPerRow(v7->_memory_iosurface);
            PixelFormat = IOSurfaceGetPixelFormat(v7->_memory_iosurface);
            SIPixelFormatToStr(PixelFormat);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136382211;
            v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
            v49 = 1025;
            v50 = 120;
            v51 = 1024;
            *(_DWORD *)v52 = ID;
            *(_WORD *)&v52[4] = 2049;
            *(_QWORD *)&v52[6] = Width;
            v53 = 2049;
            v54 = Height;
            v55 = 2049;
            v56 = BytesPerRow;
            v57 = 2113;
            v58 = v41;
            _os_log_impl(&dword_21071A000, v11, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to create the e5rt buffer from an existing iosurface: id=%d, width=%{private}lu, height=%{private}lu, stride=%{private}lu, format=%{private}@ ***", buf, 0x40u);

          }
          goto LABEL_9;
        }
        if (e5rt_io_port_bind_buffer_object())
        {
          __SceneIntelligenceLogSharedInstance();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 123);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136381187;
            v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
            v49 = 1025;
            v50 = 123;
            v51 = 2113;
            *(_QWORD *)v52 = v43;
            _os_log_impl(&dword_21071A000, v42, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

          }
          __SceneIntelligenceLogSharedInstance();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136380931;
            v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
            v49 = 1025;
            v50 = 123;
            _os_log_impl(&dword_21071A000, v20, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to bind the internal iosurface for output port. ***", buf, 0x12u);
          }
          goto LABEL_83;
        }
        v7->_support_zero_copy = 1;
      }
      else
      {
        if (e5rt_tensor_desc_alloc_buffer_object())
        {
          __SceneIntelligenceLogSharedInstance();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 83);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136381187;
            v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
            v49 = 1025;
            v50 = 83;
            v51 = 2113;
            *(_QWORD *)v52 = v22;
            _os_log_impl(&dword_21071A000, v21, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

          }
          __SceneIntelligenceLogSharedInstance();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136380931;
            v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
            v49 = 1025;
            v50 = 83;
            _os_log_impl(&dword_21071A000, v20, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to alloc the internal iosurface for output port. ***", buf, 0x12u);
          }
          goto LABEL_83;
        }
        if (e5rt_io_port_bind_buffer_object())
        {
          __SceneIntelligenceLogSharedInstance();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 86);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136381187;
            v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
            v49 = 1025;
            v50 = 86;
            v51 = 2113;
            *(_QWORD *)v52 = v27;
            _os_log_impl(&dword_21071A000, v26, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

          }
          __SceneIntelligenceLogSharedInstance();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136380931;
            v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
            v49 = 1025;
            v50 = 86;
            _os_log_impl(&dword_21071A000, v20, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to bind the internal iosurface for output port. ***", buf, 0x12u);
          }
          goto LABEL_83;
        }
        if (e5rt_buffer_object_get_iosurface())
        {
          __SceneIntelligenceLogSharedInstance();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 90);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136381187;
            v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
            v49 = 1025;
            v50 = 90;
            v51 = 2113;
            *(_QWORD *)v52 = v45;
            _os_log_impl(&dword_21071A000, v44, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

          }
          __SceneIntelligenceLogSharedInstance();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136380931;
            v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
            v49 = 1025;
            v50 = 90;
            _os_log_impl(&dword_21071A000, v20, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to get the internal iosurface from output port. ***", buf, 0x12u);
          }
          goto LABEL_83;
        }
        v7->_memory_iosurface = (__IOSurface *)CFRetain(0);
        v7->_support_zero_copy = 0;
      }
    }
    else
    {
      if (a4)
        goto LABEL_19;
      if (v7->_isFP32)
        goto LABEL_18;
      if (!v7->_isFP16_ANE)
      {
        if (v7->_isU8_ANE)
        {
LABEL_18:
          v7->_buffer = 0;
          goto LABEL_19;
        }
        __SceneIntelligenceLogSharedInstance();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136380931;
          v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
          v49 = 1025;
          v50 = 72;
          _os_log_impl(&dword_21071A000, v20, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Input tensor type not supported! ***", buf, 0x12u);
        }
LABEL_83:

        goto LABEL_10;
      }
      if (e5rt_tensor_desc_alloc_buffer_object())
      {
        __SceneIntelligenceLogSharedInstance();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 64);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136381187;
          v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
          v49 = 1025;
          v50 = 64;
          v51 = 2113;
          *(_QWORD *)v52 = v24;
          _os_log_impl(&dword_21071A000, v23, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

        }
        __SceneIntelligenceLogSharedInstance();
        v20 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          goto LABEL_83;
        *(_DWORD *)buf = 136380931;
        v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
        v49 = 1025;
        v50 = 64;
        v25 = " %{private}s:%{private}d *** Failed to alloc the internal iosurface for FP16_ANE input port. ***";
        goto LABEL_60;
      }
      if (e5rt_io_port_bind_buffer_object())
      {
        __SceneIntelligenceLogSharedInstance();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 67);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136381187;
          v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
          v49 = 1025;
          v50 = 67;
          v51 = 2113;
          *(_QWORD *)v52 = v29;
          _os_log_impl(&dword_21071A000, v28, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

        }
        __SceneIntelligenceLogSharedInstance();
        v20 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          goto LABEL_83;
        *(_DWORD *)buf = 136380931;
        v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
        v49 = 1025;
        v50 = 67;
        v25 = " %{private}s:%{private}d *** Failed to bind the internal iosurface for FP16_ANE input port. ***";
LABEL_60:
        _os_log_impl(&dword_21071A000, v20, OS_LOG_TYPE_ERROR, v25, buf, 0x12u);
        goto LABEL_83;
      }
    }
    v7->_buffer = 0;
LABEL_19:
    if (*p_desc)
    {
      if (v7->_client_desc)
      {
        v14 = v7;
        goto LABEL_11;
      }
      __SceneIntelligenceLogSharedInstance();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
        v49 = 1025;
        v50 = 137;
        _os_log_impl(&dword_21071A000, v20, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** client tensor descriptor is nil in tesnor port descriptor ***", buf, 0x12u);
      }
    }
    else
    {
      __SceneIntelligenceLogSharedInstance();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
        v49 = 1025;
        v50 = 132;
        _os_log_impl(&dword_21071A000, v20, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** tensor descriptor is nil in tesnor port descriptor ***", buf, 0x12u);
      }
    }
    goto LABEL_83;
  }
  __SceneIntelligenceLogSharedInstance();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 45);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136381187;
    v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
    v49 = 1025;
    v50 = 45;
    v51 = 2113;
    *(_QWORD *)v52 = v10;
    _os_log_impl(&dword_21071A000, v9, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

  }
  __SceneIntelligenceLogSharedInstance();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = "YES";
    v13 = *p_desc;
    v48 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
    *(_DWORD *)buf = 136381187;
    if (!v13)
      v12 = "NO";
    v49 = 1025;
    v50 = 45;
    v51 = 2081;
    *(_QWORD *)v52 = v12;
    _os_log_impl(&dword_21071A000, v11, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to retain the tensor descriptor: desc has been init: %{private}s ***", buf, 0x1Cu);
  }
LABEL_9:

LABEL_10:
  v14 = 0;
LABEL_11:

  return v14;
}

- (void)dealloc
{
  __IOSurface *memory_iosurface;
  objc_super v4;

  if (self->_port)
    e5rt_io_port_release();
  if (self->_client_desc)
    e5rt_tensor_desc_release();
  if (self->_desc)
    e5rt_tensor_desc_release();
  if (self->_buffer)
    e5rt_buffer_object_release();
  memory_iosurface = self->_memory_iosurface;
  if (memory_iosurface)
    CFRelease(memory_iosurface);
  v4.receiver = self;
  v4.super_class = (Class)SIE5RTTensorPortDescriptor;
  -[SIE5RTTensorPortDescriptor dealloc](&v4, sel_dealloc);
}

- (int64_t)bindIOSurface:(__IOSurface *)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  IOSurfaceID ID;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  OSType PixelFormat;
  void *v13;
  int64_t result;
  OSType v15;
  NSObject *v16;
  void *v17;
  e5rt_buffer_object *buffer;
  const char *v19;
  const char *v20;
  const char *v21;
  __IOSurface *memory_iosurface;
  __IOSurface *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  _BYTE v29[44];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (e5rt_buffer_object_create_from_iosurface())
  {
    __SceneIntelligenceLogSharedInstance();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 174);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136381187;
      v25 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
      v26 = 1025;
      v27 = 174;
      v28 = 2113;
      *(_QWORD *)v29 = v6;
      _os_log_impl(&dword_21071A000, v5, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

    }
    __SceneIntelligenceLogSharedInstance();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      ID = IOSurfaceGetID(a3);
      Width = IOSurfaceGetWidth(a3);
      Height = IOSurfaceGetHeight(a3);
      BytesPerRow = IOSurfaceGetBytesPerRow(a3);
      PixelFormat = IOSurfaceGetPixelFormat(a3);
      SIPixelFormatToStr(PixelFormat);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136382211;
      v25 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
      v26 = 1025;
      v27 = 174;
      v28 = 1024;
      *(_DWORD *)v29 = ID;
      *(_WORD *)&v29[4] = 2049;
      *(_QWORD *)&v29[6] = Width;
      *(_WORD *)&v29[14] = 2049;
      *(_QWORD *)&v29[16] = Height;
      *(_WORD *)&v29[24] = 2049;
      *(_QWORD *)&v29[26] = BytesPerRow;
      *(_WORD *)&v29[34] = 2113;
      *(_QWORD *)&v29[36] = v13;
      _os_log_impl(&dword_21071A000, v7, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to create the e5rt buffer from an existing iosurface: id=%d, width=%{private}lu, height=%{private}lu, stride=%{private}lu, format=%{private}@ ***", buf, 0x40u);

    }
LABEL_6:

    return 7;
  }
  v15 = IOSurfaceGetPixelFormat(a3);
  if (self->_isFP16_ANE && (v15 == 1717855600 || v15 == 1278226534))
  {
    if (e5rt_tensor_utils_cast_from_fp32_to_fp16())
    {
      __SceneIntelligenceLogSharedInstance();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 184);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136381187;
        v25 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
        v26 = 1025;
        v27 = 184;
        v28 = 2113;
        *(_QWORD *)v29 = v17;
        _os_log_impl(&dword_21071A000, v16, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

      }
      __SceneIntelligenceLogSharedInstance();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        buffer = self->_buffer;
        if (self->_client_desc)
          v19 = "YES";
        else
          v19 = "NO";
        if (self->_desc)
          v20 = "YES";
        else
          v20 = "NO";
        v25 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm";
        if (buffer)
          v21 = "YES";
        else
          v21 = "NO";
        *(_DWORD *)buf = 136381955;
        v26 = 1025;
        v27 = 184;
        v28 = 2081;
        *(_QWORD *)v29 = v19;
        *(_WORD *)&v29[8] = 2081;
        *(_QWORD *)&v29[10] = v20;
        *(_WORD *)&v29[18] = 2081;
        *(_QWORD *)&v29[20] = v21;
        *(_WORD *)&v29[28] = 2081;
        *(_QWORD *)&v29[30] = "NO";
        _os_log_impl(&dword_21071A000, v7, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to cast fp32 buffer to fp16. clientDescriptorInit:%{private}s descriptorInit:%{private}s srcBufferInit:%{private}s, dstBufferInit:%{private}s ***", buf, 0x3Au);
      }
      goto LABEL_6;
    }
    e5rt_buffer_object_release();
  }
  else
  {
    e5rt_io_port_bind_buffer_object();
    if (self->_buffer)
      e5rt_buffer_object_release();
    self->_buffer = 0;
  }
  memory_iosurface = self->_memory_iosurface;
  if (memory_iosurface)
    CFRelease(memory_iosurface);
  v23 = (__IOSurface *)CFRetain(a3);
  result = 0;
  self->_memory_iosurface = v23;
  return result;
}

- (void)bindRawPointer:(const void *)a3
{
  uint64_t v4;
  e5rt_buffer_object **p_buffer;
  e5rt_buffer_object *buffer;
  id v7;

  if (e5rt_tensor_desc_alloc_buffer_object())
  {
    v4 = 204;
    goto LABEL_20;
  }
  if (e5rt_tensor_desc_get_size())
  {
    v4 = 207;
    goto LABEL_20;
  }
  if (e5rt_buffer_object_get_data_ptr())
  {
    v4 = 211;
    goto LABEL_20;
  }
  if (!self->_isFP16_ANE)
  {
    if (!self->_isFP32)
      return;
    if (e5rt_io_port_bind_buffer_object())
    {
      v4 = 219;
    }
    else
    {
      buffer = self->_buffer;
      p_buffer = &self->_buffer;
      if (!buffer || !e5rt_buffer_object_release())
      {
        *p_buffer = 0;
        return;
      }
      v4 = 221;
    }
LABEL_20:
    createE5RTException((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  if (e5rt_tensor_utils_cast_from_fp32_to_fp16())
  {
    v4 = 215;
    goto LABEL_20;
  }
  if (e5rt_buffer_object_release())
  {
    v4 = 216;
    goto LABEL_20;
  }
}

- (void)getDataPtr
{
  id v3;

  if (e5rt_buffer_object_get_data_ptr())
  {
    createE5RTException((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 230);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  return 0;
}

- (int)getComponentType
{
  uint64_t v3;
  id v4;

  if (e5rt_tensor_desc_retain_dtype())
  {
    v3 = 237;
    goto LABEL_8;
  }
  if (e5rt_tensor_desc_dtype_get_component_dtype())
  {
    v3 = 239;
    goto LABEL_8;
  }
  if (e5rt_tensor_desc_dtype_release())
  {
    v3 = 240;
LABEL_8:
    createE5RTException((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return 0;
}

- (unsigned)getNumComponents
{
  uint64_t v3;
  id v4;

  if (e5rt_tensor_desc_retain_dtype())
  {
    v3 = 247;
    goto LABEL_8;
  }
  if (e5rt_tensor_desc_dtype_get_num_components())
  {
    v3 = 249;
    goto LABEL_8;
  }
  if (e5rt_tensor_desc_dtype_release())
  {
    v3 = 250;
LABEL_8:
    createE5RTException((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return 0;
}

- (unint64_t)getComponentSize
{
  uint64_t v3;
  id v4;

  if (e5rt_tensor_desc_retain_dtype())
  {
    v3 = 257;
    goto LABEL_8;
  }
  if (e5rt_tensor_desc_dtype_get_component_size())
  {
    v3 = 259;
    goto LABEL_8;
  }
  if (e5rt_tensor_desc_dtype_release())
  {
    v3 = 260;
LABEL_8:
    createE5RTException((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return 0;
}

- (unint64_t)getRank
{
  id v3;

  if (e5rt_tensor_desc_get_rank())
  {
    createE5RTException((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 267);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  return 0;
}

- (const)getShape
{
  id v3;

  if (e5rt_tensor_desc_get_shape())
  {
    createE5RTException((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 275);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  return 0;
}

- (const)getStrides
{
  id v3;

  if (e5rt_tensor_desc_get_strides())
  {
    createE5RTException((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 283);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  return 0;
}

- (unint64_t)getWidth
{
  unint64_t v3;

  v3 = -[SIE5RTTensorPortDescriptor getRank](self, "getRank");
  return *(-[SIE5RTTensorPortDescriptor getShape](self, "getShape") + 8 * v3 - 8);
}

- (unint64_t)getHeight
{
  unint64_t v3;

  v3 = -[SIE5RTTensorPortDescriptor getRank](self, "getRank");
  return *(-[SIE5RTTensorPortDescriptor getShape](self, "getShape") + 8 * v3 - 16);
}

- (unint64_t)getChannels
{
  unint64_t v3;

  v3 = -[SIE5RTTensorPortDescriptor getRank](self, "getRank");
  return *(-[SIE5RTTensorPortDescriptor getShape](self, "getShape") + 8 * v3 - 24);
}

- (unint64_t)getBatchnum
{
  unint64_t v3;

  v3 = -[SIE5RTTensorPortDescriptor getRank](self, "getRank");
  return *(-[SIE5RTTensorPortDescriptor getShape](self, "getShape") + 8 * v3 - 32);
}

- (unint64_t)getBytePerRow
{
  return -[SIE5RTTensorPortDescriptor getStrides](self, "getStrides")[16];
}

- (unint64_t)getRowElements
{
  unint64_t v3;

  v3 = -[SIE5RTTensorPortDescriptor getBytePerRow](self, "getBytePerRow");
  return v3 / -[SIE5RTTensorPortDescriptor getComponentSize](self, "getComponentSize");
}

- (__IOSurface)getIOSurface
{
  return self->_memory_iosurface;
}

- (BOOL)isPacked
{
  const int64_t *v3;
  const unint64_t *v4;
  unint64_t v5;
  const int64_t *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v3 = -[SIE5RTTensorPortDescriptor getStrides](self, "getStrides");
  v4 = -[SIE5RTTensorPortDescriptor getShape](self, "getShape");
  v5 = -[SIE5RTTensorPortDescriptor getRank](self, "getRank");
  v6 = &v3[v5 - 1];
  v7 = v5 - 1;
  do
  {
    v8 = v7;
    if (!v7)
      break;
    v9 = v4[v7] * *v6;
    v10 = *--v6;
    --v7;
  }
  while (v9 == v10);
  return v8 == 0;
}

- (BOOL)isPackedFP32
{
  return -[SIE5RTTensorPortDescriptor getComponentType](self, "getComponentType") == 4
      && -[SIE5RTTensorPortDescriptor getComponentSize](self, "getComponentSize") == 4
      && -[SIE5RTTensorPortDescriptor isPacked](self, "isPacked");
}

- (BOOL)isFP16_ANE
{
  unint64_t v3;

  if (-[SIE5RTTensorPortDescriptor getComponentType](self, "getComponentType") != 4
    || -[SIE5RTTensorPortDescriptor getComponentSize](self, "getComponentSize") != 2)
  {
    return 0;
  }
  v3 = -[SIE5RTTensorPortDescriptor getRank](self, "getRank");
  return (*(-[SIE5RTTensorPortDescriptor getStrides](self, "getStrides") + 8 * v3 - 16) & 0x3F) == 0;
}

- (BOOL)isS8_ANE
{
  unint64_t v3;

  if (-[SIE5RTTensorPortDescriptor getComponentType](self, "getComponentType") != 1
    || -[SIE5RTTensorPortDescriptor getComponentSize](self, "getComponentSize") != 1)
  {
    return 0;
  }
  v3 = -[SIE5RTTensorPortDescriptor getRank](self, "getRank");
  return (*(-[SIE5RTTensorPortDescriptor getStrides](self, "getStrides") + 8 * v3 - 16) & 0x3F) == 0;
}

- (BOOL)isU8_ANE
{
  unint64_t v3;

  if (-[SIE5RTTensorPortDescriptor getComponentType](self, "getComponentType")
    || -[SIE5RTTensorPortDescriptor getComponentSize](self, "getComponentSize") != 1)
  {
    return 0;
  }
  v3 = -[SIE5RTTensorPortDescriptor getRank](self, "getRank");
  return (*(-[SIE5RTTensorPortDescriptor getStrides](self, "getStrides") + 8 * v3 - 16) & 0x3F) == 0;
}

- (e5rt_tensor_desc)createPackedFP32TensorDescriptor
{
  uint64_t v3;
  id v5;

  if (!-[SIE5RTTensorPortDescriptor isPackedFP32](self, "isPackedFP32"))
  {
    -[SIE5RTTensorPortDescriptor getNumComponents](self, "getNumComponents", 0);
    if (e5rt_tensor_desc_dtype_create())
    {
      v3 = 416;
    }
    else
    {
      -[SIE5RTTensorPortDescriptor getShape](self, "getShape");
      -[SIE5RTTensorPortDescriptor getRank](self, "getRank");
      if (e5rt_tensor_desc_create())
      {
        v3 = 421;
      }
      else
      {
        if (!e5rt_tensor_desc_dtype_release())
          return 0;
        v3 = 422;
      }
    }
LABEL_11:
    createE5RTException((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
  if (e5rt_io_port_retain_tensor_desc())
  {
    v3 = 399;
    goto LABEL_11;
  }
  return 0;
}

- (unint64_t)getNumberOfElements
{
  id v3;

  if (e5rt_tensor_desc_get_shape())
  {
    createE5RTException((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTTensorPortDescriptor.mm", 430);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  return 1;
}

@end
