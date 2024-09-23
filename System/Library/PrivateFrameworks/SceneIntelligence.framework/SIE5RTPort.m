@implementation SIE5RTPort

- (id)initPortWithE5RTStreamOperation:(e5rt_execution_stream_operation *)a3 blobName:(id)a4 portType:(int64_t)a5
{
  id v8;
  SIE5RTPort *v9;
  SIE5RTPort *v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  void *v23;
  objc_super v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)SIE5RTPort;
  v9 = -[SIE5RTPort init](&v25, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_27;
  objc_storeStrong((id *)&v9->_name, a4);
  v10->_portType = a5;
  v11 = objc_retainAutorelease(v8);
  objc_msgSend(v11, "UTF8String");
  if (a5)
  {
    if (e5rt_execution_stream_operation_retain_output_port())
    {
      __SceneIntelligenceLogSharedInstance();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m", 47);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136381187;
        v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m";
        v28 = 1025;
        v29 = 47;
        v30 = 2113;
        v31 = v13;
        _os_log_impl(&dword_21071A000, v12, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

      }
      __SceneIntelligenceLogSharedInstance();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136381187;
        v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m";
        v28 = 1025;
        v29 = 47;
        v30 = 2113;
        v31 = v11;
        _os_log_impl(&dword_21071A000, v14, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to retain the output port for blob: %{private}@ ***", buf, 0x1Cu);
      }

      goto LABEL_27;
    }
LABEL_15:
    if (e5rt_io_port_is_tensor())
    {
      __SceneIntelligenceLogSharedInstance();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m", 54);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136381187;
        v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m";
        v28 = 1025;
        v29 = 54;
        v30 = 2113;
        v31 = v19;
        _os_log_impl(&dword_21071A000, v18, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

      }
      __SceneIntelligenceLogSharedInstance();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_26;
      *(_DWORD *)buf = 136380931;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m";
      v28 = 1025;
      v29 = 54;
      v21 = " %{private}s:%{private}d *** Failed to check the port type - tensor ***";
    }
    else if (e5rt_io_port_is_surface())
    {
      __SceneIntelligenceLogSharedInstance();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m", 57);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136381187;
        v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m";
        v28 = 1025;
        v29 = 57;
        v30 = 2113;
        v31 = v23;
        _os_log_impl(&dword_21071A000, v22, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

      }
      __SceneIntelligenceLogSharedInstance();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_26;
      *(_DWORD *)buf = 136380931;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m";
      v28 = 1025;
      v29 = 57;
      v21 = " %{private}s:%{private}d *** Failed to check the port type - surface ***";
    }
    else
    {
      __SceneIntelligenceLogSharedInstance();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_26;
      *(_DWORD *)buf = 136380931;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m";
      v28 = 1025;
      v29 = 66;
      v21 = " %{private}s:%{private}d *** Failed to initialize io port: Unknown port descriptor ***";
    }
    _os_log_impl(&dword_21071A000, v20, OS_LOG_TYPE_ERROR, v21, buf, 0x12u);
LABEL_26:

    goto LABEL_27;
  }
  if (!e5rt_execution_stream_operation_retain_input_port())
    goto LABEL_15;
  __SceneIntelligenceLogSharedInstance();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m", 43);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136381187;
    v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m";
    v28 = 1025;
    v29 = 43;
    v30 = 2113;
    v31 = v16;
    _os_log_impl(&dword_21071A000, v15, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

  }
  __SceneIntelligenceLogSharedInstance();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136381187;
    v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTPort.m";
    v28 = 1025;
    v29 = 43;
    v30 = 2113;
    v31 = v11;
    _os_log_impl(&dword_21071A000, v17, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to retain the input port for blob: %{private}@ ***", buf, 0x1Cu);
  }

LABEL_27:
  return 0;
}

- (int64_t)bindIOSurface:(__IOSurface *)a3
{
  return -[SIE5RTPortDescriptor bindIOSurface:](self->_desc, "bindIOSurface:", a3);
}

- (int64_t)bindPixelBuffer:(__CVBuffer *)a3
{
  return -[SIE5RTPortDescriptor bindIOSurface:](self->_desc, "bindIOSurface:", CVPixelBufferGetIOSurface(a3));
}

- (int64_t)bindRawPointer:(const void *)a3
{
  -[SIE5RTPortDescriptor bindRawPointer:](self->_desc, "bindRawPointer:", a3);
  return 0;
}

- (unint64_t)getWidth
{
  return -[SIE5RTPortDescriptor getWidth](self->_desc, "getWidth");
}

- (unint64_t)getHeight
{
  return -[SIE5RTPortDescriptor getHeight](self->_desc, "getHeight");
}

- (unint64_t)getChannels
{
  return -[SIE5RTPortDescriptor getChannels](self->_desc, "getChannels");
}

- (unint64_t)getNumberOfElements
{
  return -[SIE5RTPortDescriptor getNumberOfElements](self->_desc, "getNumberOfElements");
}

- (unint64_t)getRowElements
{
  return -[SIE5RTPortDescriptor getRowElements](self->_desc, "getRowElements");
}

- (unint64_t)getBatchnum
{
  return -[SIE5RTPortDescriptor getBatchnum](self->_desc, "getBatchnum");
}

- (const)getShape
{
  return (const unint64_t *)-[SIE5RTPortDescriptor getShape](self->_desc, "getShape");
}

- (void)getDataPtr
{
  return (void *)-[SIE5RTPortDescriptor getDataPtr](self->_desc, "getDataPtr");
}

- (unint64_t)getBytePerRow
{
  return -[SIE5RTPortDescriptor getBytePerRow](self->_desc, "getBytePerRow");
}

- (unint64_t)getComponentSize
{
  return -[SIE5RTPortDescriptor getComponentSize](self->_desc, "getComponentSize");
}

- (__IOSurface)getIOSurface
{
  return (__IOSurface *)-[SIE5RTPortDescriptor getIOSurface](self->_desc, "getIOSurface");
}

- (e5rt_io_port)port
{
  return self->_port;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_desc, 0);
}

@end
