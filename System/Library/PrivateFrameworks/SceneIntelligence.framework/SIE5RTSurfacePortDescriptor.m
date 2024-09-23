@implementation SIE5RTSurfacePortDescriptor

- (SIE5RTSurfacePortDescriptor)initWithE5RTPort:(e5rt_io_port *)a3 portType:(int64_t)a4
{
  SIE5RTSurfacePortDescriptor *v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  char *v11;
  NSObject *v12;
  NSObject *v13;
  char *v14;
  NSObject *v15;
  char *v16;
  SIE5RTSurfacePortDescriptor *v17;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)SIE5RTSurfacePortDescriptor;
  v5 = -[SIE5RTSurfacePortDescriptor init](&v19, sel_init, a3, a4);
  if (v5)
  {
    if (e5rt_io_port_retain_surface_desc())
    {
      __SceneIntelligenceLogSharedInstance();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm", 39);
        v7 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136381187;
        v21 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
        v22 = 1025;
        v23 = 39;
        v24 = 2113;
        v25 = v7;
        _os_log_impl(&dword_21071A000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

      }
      __SceneIntelligenceLogSharedInstance();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = "YES";
        v21 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
        *(_DWORD *)buf = 136381187;
        if (!a3)
          v9 = "NO";
        v22 = 1025;
        v23 = 39;
        v24 = 2081;
        v25 = v9;
        _os_log_impl(&dword_21071A000, v8, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to get the descriptor for surface port. port is init: %{private}s ***", buf, 0x1Cu);
      }

    }
    else
    {
      v5->_port = a3;
      if (e5rt_surface_desc_get_width())
      {
        __SceneIntelligenceLogSharedInstance();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm", 44);
          v11 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136381187;
          v21 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
          v22 = 1025;
          v23 = 44;
          v24 = 2113;
          v25 = v11;
          _os_log_impl(&dword_21071A000, v10, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

        }
        __SceneIntelligenceLogSharedInstance();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136380931;
          v21 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
          v22 = 1025;
          v23 = 44;
          _os_log_impl(&dword_21071A000, v12, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to get the width surface port. ***", buf, 0x12u);
        }
      }
      else if (e5rt_surface_desc_get_height())
      {
        __SceneIntelligenceLogSharedInstance();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm", 47);
          v14 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136381187;
          v21 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
          v22 = 1025;
          v23 = 47;
          v24 = 2113;
          v25 = v14;
          _os_log_impl(&dword_21071A000, v13, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

        }
        __SceneIntelligenceLogSharedInstance();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136380931;
          v21 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
          v22 = 1025;
          v23 = 47;
          _os_log_impl(&dword_21071A000, v12, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to get the height surface port. ***", buf, 0x12u);
        }
      }
      else
      {
        if (!e5rt_surface_desc_get_format())
        {
          v17 = v5;
          goto LABEL_29;
        }
        __SceneIntelligenceLogSharedInstance();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm", 50);
          v16 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136381187;
          v21 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
          v22 = 1025;
          v23 = 50;
          v24 = 2113;
          v25 = v16;
          _os_log_impl(&dword_21071A000, v15, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

        }
        __SceneIntelligenceLogSharedInstance();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136380931;
          v21 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
          v22 = 1025;
          v23 = 50;
          _os_log_impl(&dword_21071A000, v12, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to get the format surface port. ***", buf, 0x12u);
        }
      }

    }
  }
  v17 = 0;
LABEL_29:

  return v17;
}

- (int64_t)bindIOSurface:(__IOSurface *)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  IOSurfaceID ID;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  OSType PixelFormat;
  void *v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _BYTE v21[14];
  __int16 v22;
  size_t v23;
  __int16 v24;
  size_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (e5rt_surface_object_create_from_iosurface())
  {
    __SceneIntelligenceLogSharedInstance();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm", 65);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136381187;
      v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
      v18 = 1025;
      v19 = 65;
      v20 = 2113;
      *(_QWORD *)v21 = v5;
      _os_log_impl(&dword_21071A000, v4, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

    }
    __SceneIntelligenceLogSharedInstance();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      ID = IOSurfaceGetID(a3);
      Width = IOSurfaceGetWidth(a3);
      Height = IOSurfaceGetHeight(a3);
      BytesPerRow = IOSurfaceGetBytesPerRow(a3);
      PixelFormat = IOSurfaceGetPixelFormat(a3);
      SIPixelFormatToStr(PixelFormat);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136382211;
      v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
      v18 = 1025;
      v19 = 65;
      v20 = 1024;
      *(_DWORD *)v21 = ID;
      *(_WORD *)&v21[4] = 2049;
      *(_QWORD *)&v21[6] = Width;
      v22 = 2049;
      v23 = Height;
      v24 = 2049;
      v25 = BytesPerRow;
      v26 = 2113;
      v27 = v12;
      _os_log_impl(&dword_21071A000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to create the e5rt buffer from an existing iosurface: id=%d, width=%{private}lu, height=%{private}lu, stride=%{private}lu, format=%{private}@ ***", buf, 0x40u);

    }
LABEL_12:

    return 7;
  }
  if (e5rt_io_port_bind_surface_object())
  {
    __SceneIntelligenceLogSharedInstance();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      createE5RTExceptionMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm", 68);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136381187;
      v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
      v18 = 1025;
      v19 = 68;
      v20 = 2113;
      *(_QWORD *)v21 = v14;
      _os_log_impl(&dword_21071A000, v13, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** E5RT error message: %{private}@ ***", buf, 0x1Cu);

    }
    __SceneIntelligenceLogSharedInstance();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
      v18 = 1025;
      v19 = 68;
      _os_log_impl(&dword_21071A000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to bind the internal iosurface for output port. ***", buf, 0x12u);
    }
    goto LABEL_12;
  }
  e5rt_surface_object_release();
  return 0;
}

- (unint64_t)getWidth
{
  return self->_width;
}

- (unint64_t)getHeight
{
  return self->_height;
}

- (void)bindRawPointer:(const void *)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
    v6 = 1025;
    v7 = 84;
    _os_log_impl(&dword_21071A000, v3, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Low-level attribute access is not allowed in surface descriptor ***", (uint8_t *)&v4, 0x12u);
  }

}

- (unint64_t)getBatchnum
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
    v6 = 1025;
    v7 = 90;
    _os_log_impl(&dword_21071A000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Low-level attribute access is not allowed in surface descriptor ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (unint64_t)getChannels
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
    v6 = 1025;
    v7 = 96;
    _os_log_impl(&dword_21071A000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Low-level attribute access is not allowed in surface descriptor ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (void)getDataPtr
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
    v6 = 1025;
    v7 = 102;
    _os_log_impl(&dword_21071A000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Low-level attribute access is not allowed in surface descriptor ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (unint64_t)getNumberOfElements
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
    v6 = 1025;
    v7 = 108;
    _os_log_impl(&dword_21071A000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Low-level attribute access is not allowed in surface descriptor ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (unint64_t)getRank
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
    v6 = 1025;
    v7 = 114;
    _os_log_impl(&dword_21071A000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Low-level attribute access is not allowed in surface descriptor ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (unint64_t)getRowElements
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
    v6 = 1025;
    v7 = 120;
    _os_log_impl(&dword_21071A000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Low-level attribute access is not allowed in surface descriptor ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (const)getShape
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
    v6 = 1025;
    v7 = 126;
    _os_log_impl(&dword_21071A000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Low-level attribute access is not allowed in surface descriptor ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (unint64_t)getBytePerRow
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
    v6 = 1025;
    v7 = 131;
    _os_log_impl(&dword_21071A000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Low-level attribute access is not allowed in surface descriptor ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (unint64_t)getComponentSize
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
    v6 = 1025;
    v7 = 137;
    _os_log_impl(&dword_21071A000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Low-level attribute access is not allowed in surface descriptor ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (__IOSurface)getIOSurface
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/E5RT/SIE5RTSurfacePortDescriptor.mm";
    v6 = 1025;
    v7 = 142;
    _os_log_impl(&dword_21071A000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Low-level attribute access is not allowed in surface descriptor ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_port)
    e5rt_io_port_release();
  if (self->_desc)
    e5rt_surface_desc_release();
  v3.receiver = self;
  v3.super_class = (Class)SIE5RTSurfacePortDescriptor;
  -[SIE5RTSurfacePortDescriptor dealloc](&v3, sel_dealloc);
}

@end
