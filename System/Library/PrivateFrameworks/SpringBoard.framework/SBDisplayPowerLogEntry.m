@implementation SBDisplayPowerLogEntry

+ (id)forDisplay:(id)a3 mode:(unint64_t)a4 zoom:(unint64_t)a5
{
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  SBDisplayPowerLogEntry *v23;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "CADisplay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    SBLogDisplayControlling();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      +[SBDisplayPowerLogEntry forDisplay:mode:zoom:].cold.1((uint64_t)a1, (uint64_t)a2, v22);
    goto LABEL_6;
  }
  objc_msgSend(v9, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "name");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v11)
  {

    if (v13)
      goto LABEL_8;
    SBLogDisplayControlling();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      _SBFLoggingMethodProem();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v25;
      v28 = 2114;
      v29 = v10;
      _os_log_fault_impl(&dword_1D0540000, v22, OS_LOG_TYPE_FAULT, "%{public}@ we received a CADisplay with a nil name. garbage in garbage out. caDisplay: %{public}@", (uint8_t *)&v26, 0x16u);

    }
LABEL_6:

LABEL_8:
    v19 = *MEMORY[0x1E0C9D820];
    v21 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v13 = CFSTR("<Invalid>");
    v17 = v21;
    v15 = *MEMORY[0x1E0C9D820];
    goto LABEL_9;
  }
  objc_msgSend(v10, "bounds");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v10, "nativeSize");
  v19 = v18;
  v21 = v20;
LABEL_9:
  v23 = objc_alloc_init(SBDisplayPowerLogEntry);
  -[SBDisplayPowerLogEntry setDisplayName:](v23, "setDisplayName:", v13);
  -[SBDisplayPowerLogEntry setCanvasSize:](v23, "setCanvasSize:", v15, v17);
  -[SBDisplayPowerLogEntry setNativeSize:](v23, "setNativeSize:", v19, v21);
  -[SBDisplayPowerLogEntry setWindowingMode:](v23, "setWindowingMode:", a4);
  -[SBDisplayPowerLogEntry setZoomLevel:](v23, "setZoomLevel:", a5);

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SBDisplayPowerLogEntry *v4;

  v4 = objc_alloc_init(SBDisplayPowerLogEntry);
  -[SBDisplayPowerLogEntry setDisplayName:](v4, "setDisplayName:", self->_displayName);
  -[SBDisplayPowerLogEntry setCanvasSize:](v4, "setCanvasSize:", self->_canvasSize.width, self->_canvasSize.height);
  -[SBDisplayPowerLogEntry setNativeSize:](v4, "setNativeSize:", self->_nativeSize.width, self->_nativeSize.height);
  -[SBDisplayPowerLogEntry setWindowingMode:](v4, "setWindowingMode:", self->_windowingMode);
  -[SBDisplayPowerLogEntry setZoomLevel:](v4, "setZoomLevel:", self->_zoomLevel);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SBDisplayPowerLogEntry *v4;
  SBDisplayPowerLogEntry *v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;

  v4 = (SBDisplayPowerLogEntry *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v8 = -[NSString isEqualToString:](self->_displayName, "isEqualToString:", v5->_displayName)
        && (self->_canvasSize.width == v5->_canvasSize.width
          ? (v6 = self->_canvasSize.height == v5->_canvasSize.height)
          : (v6 = 0),
            v6
         && (self->_nativeSize.width == v5->_nativeSize.width
           ? (v7 = self->_nativeSize.height == v5->_nativeSize.height)
           : (v7 = 0),
             v7 && self->_windowingMode == v5->_windowingMode))
        && self->_zoomLevel == v5->_zoomLevel;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendString:", self->_displayName);
  v5 = (id)objc_msgSend(v3, "appendCGSize:", self->_canvasSize.width, self->_canvasSize.height);
  v6 = (id)objc_msgSend(v3, "appendCGSize:", self->_nativeSize.width, self->_nativeSize.height);
  v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_windowingMode);
  v8 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_zoomLevel);
  v9 = objc_msgSend(v3, "hash");

  return v9;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;
  const __CFString *v7;
  unint64_t v8;
  const __CFString *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_displayName, CFSTR("displayName"));
  v4 = (id)objc_msgSend(v3, "appendSize:withName:", CFSTR("canvasSize"), self->_canvasSize.width, self->_canvasSize.height);
  v5 = (id)objc_msgSend(v3, "appendSize:withName:", CFSTR("nativeSize"), self->_nativeSize.width, self->_nativeSize.height);
  v6 = self->_windowingMode - 1;
  if (v6 > 4)
    v7 = CFSTR("Invalid");
  else
    v7 = off_1E8EBB578[v6];
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("windowingMode"));
  v8 = self->_zoomLevel - 1;
  if (v8 > 3)
    v9 = CFSTR("Invalid");
  else
    v9 = off_1E8EBB5A0[v8];
  objc_msgSend(v3, "appendString:withName:", v9, CFSTR("zoomLevel"));
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)logPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;
  _QWORD v13[7];
  _QWORD v14[8];

  v14[7] = *MEMORY[0x1E0C80C00];
  v14[0] = self->_displayName;
  v13[0] = CFSTR("displayName");
  v13[1] = CFSTR("canvasSizeWidth");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_canvasSize.width);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v3;
  v13[2] = CFSTR("canvasSizeHeight");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_canvasSize.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v4;
  v13[3] = CFSTR("nativeSizeWidth");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_nativeSize.width);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v5;
  v13[4] = CFSTR("nativeSizeHeight");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_nativeSize.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v6;
  v13[5] = CFSTR("windowingMode");
  v7 = self->_windowingMode - 1;
  if (v7 > 4)
    v8 = CFSTR("Invalid");
  else
    v8 = off_1E8EBB578[v7];
  v14[5] = v8;
  v13[6] = CFSTR("zoomLevel");
  v9 = self->_zoomLevel - 1;
  if (v9 > 3)
    v10 = CFSTR("Invalid");
  else
    v10 = off_1E8EBB5A0[v9];
  v14[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)windowingMode
{
  return self->_windowingMode;
}

- (void)setWindowingMode:(unint64_t)a3
{
  self->_windowingMode = a3;
}

- (unint64_t)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setZoomLevel:(unint64_t)a3
{
  self->_zoomLevel = a3;
}

- (CGSize)canvasSize
{
  double width;
  double height;
  CGSize result;

  width = self->_canvasSize.width;
  height = self->_canvasSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCanvasSize:(CGSize)a3
{
  self->_canvasSize = a3;
}

- (CGSize)nativeSize
{
  double width;
  double height;
  CGSize result;

  width = self->_nativeSize.width;
  height = self->_nativeSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setNativeSize:(CGSize)a3
{
  self->_nativeSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
}

+ (void)forDisplay:(uint64_t)a1 mode:(uint64_t)a2 zoom:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _SBFLoggingMethodProem();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_fault_impl(&dword_1D0540000, a3, OS_LOG_TYPE_FAULT, "%{public}@ we received a nil CADisplay. garbage in garbage out", (uint8_t *)&v5, 0xCu);

}

@end
