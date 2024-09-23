@implementation PUIProgressWindow

+ (void)setUsesPreBoardAppearance
{
  sem_t *v2;
  int *v3;

  v2 = sem_open("puiprogresswindow.pba", 512, 256, 0);
  if (v2 == (sem_t *)-1)
  {
    v3 = __error();
    strerror(*v3);
  }
  else
  {
    sem_close(v2);
  }
  _DMLogFunc();
}

+ (BOOL)_usesPreBoardAppearance
{
  sem_t *v2;
  sem_t *v3;

  v2 = sem_open("puiprogresswindow.pba", 0);
  v3 = v2;
  if (v2 != (sem_t *)-1)
    sem_close(v2);
  _DMLogFunc();
  return v3 != (sem_t *)-1;
}

- (PUIProgressWindow)init
{
  double v2;

  LODWORD(v2) = 1161527296;
  return -[PUIProgressWindow initWithProgressBarVisibility:level:forceInverted:](self, "initWithProgressBarVisibility:level:forceInverted:", 1, 0, v2);
}

- (PUIProgressWindow)initWithForceInverted:(BOOL)a3
{
  double v3;

  LODWORD(v3) = 1161527296;
  return -[PUIProgressWindow initWithProgressBarVisibility:level:forceInverted:](self, "initWithProgressBarVisibility:level:forceInverted:", 1, a3, v3);
}

- (PUIProgressWindow)initWithProgressBarVisibility:(BOOL)a3
{
  double v3;

  LODWORD(v3) = 1161527296;
  return -[PUIProgressWindow initWithProgressBarVisibility:level:forceInverted:](self, "initWithProgressBarVisibility:level:forceInverted:", a3, 0, v3);
}

- (PUIProgressWindow)initWithProgressBarVisibility:(BOOL)a3 level:(float)a4
{
  return -[PUIProgressWindow initWithProgressBarVisibility:level:forceInverted:](self, "initWithProgressBarVisibility:level:forceInverted:", a3, 0);
}

- (PUIProgressWindow)initWithProgressBarVisibility:(BOOL)a3 context:(id)a4
{
  double v4;

  LODWORD(v4) = 0;
  return -[PUIProgressWindow initWithProgressBarVisibility:createContext:contextLevel:appearance:](self, "initWithProgressBarVisibility:createContext:contextLevel:appearance:", a3, 0, 0, v4);
}

- (PUIProgressWindow)initWithProgressBarVisibility:(BOOL)a3 level:(float)a4 forceInverted:(BOOL)a5
{
  return -[PUIProgressWindow initWithProgressBarVisibility:createContext:contextLevel:appearance:](self, "initWithProgressBarVisibility:createContext:contextLevel:appearance:", a3, 1, a5);
}

- (PUIProgressWindow)initWithProgressBarVisibility:(BOOL)a3 createContext:(BOOL)a4 contextLevel:(float)a5 appearance:(int64_t)a6
{
  if (a4)
    *(_QWORD *)&a3 = a3 | 4;
  else
    *(_QWORD *)&a3 = a3;
  return -[PUIProgressWindow initWithOptions:contextLevel:appearance:](self, "initWithOptions:contextLevel:appearance:", a3, a6);
}

- (PUIProgressWindow)initWithOptions:(unint64_t)a3 contextLevel:(float)a4 appearance:(int64_t)a5
{
  PUIEnvironment *v9;
  double v10;
  PUIProgressWindow *v11;

  v9 = objc_alloc_init(PUIEnvironment);
  *(float *)&v10 = a4;
  v11 = -[PUIProgressWindow _initWithOptions:contextLevel:appearance:environment:](self, "_initWithOptions:contextLevel:appearance:environment:", a3, a5, v9, v10);

  return v11;
}

- (id)_initWithOptions:(unint64_t)a3 contextLevel:(float)a4 appearance:(int64_t)a5 environment:(id)a6
{
  id v11;
  void *v12;
  double v13;
  void *v14;
  PUIProgressWindow *v15;
  PUIProgressWindow *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  CAContext *context;
  double v22;
  CAContext *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v11 = a6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v13 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  _DMLogFunc();

  v30.receiver = self;
  v30.super_class = (Class)PUIProgressWindow;
  v15 = -[PUIProgressWindow init](&v30, sel_init, v12, v14, v29);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_environment, a6);
    BYTE2(v16->_progressLayer) = a3 & 1;
    LOWORD(v16->_progressLayer) = a5 == 1;
    *(_QWORD *)&v16->_productType = -[PUIEnvironment productType](v16->_environment, "productType");
    v17 = -[PUIEnvironment deviceClass](v16->_environment, "deviceClass");
    v16->_screenClass = v17;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _DMLogFunc();

    if (v16->_screenClass == -1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0xFFFFFFFFLL, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      _DMLogFunc();

      +[PUIProgressWindow _errorDescriptionForUnknownDeviceClass](PUIProgressWindow, "_errorDescriptionForUnknownDeviceClass", v26);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIProgressWindow _appendErrorDescriptionWithString:](v16, "_appendErrorDescriptionWithString:", v18);

    }
    v19 = -[PUIEnvironment mainScreenClass](v16->_environment, "mainScreenClass", v25);
    *(_DWORD *)&v16->_isSecurityResearchDevice = v19;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v19);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _DMLogFunc();

    v20 = MGGetBoolAnswer();
    LOBYTE(v16->_displaySize.width) = v20;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v20, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _DMLogFunc();

    -[PUIProgressWindow _collectDisplayInfo](v16, "_collectDisplayInfo", v28);
    if ((a3 & 4) == 0)
    {
      v16->_weCreatedTheContext = 0;
      context = v16->_context;
      v16->_context = 0;

LABEL_8:
      -[PUIProgressWindow _createLayer](v16, "_createLayer");
      goto LABEL_9;
    }
    -[PUIProgressWindow _createContext](v16, "_createContext");
    v23 = v16->_context;
    if (v23)
    {
      *(float *)&v22 = a4;
      -[CAContext setLevel:](v23, "setLevel:", v22);
      goto LABEL_8;
    }
  }
LABEL_9:

  return v16;
}

- (BOOL)_currentDeviceShouldMuteErrors
{
  return self->_screenClass == 7;
}

- (void)_appendErrorDescriptionWithString:(id)a3
{
  CALayer *layer;
  CALayer *v5;
  CALayer *v6;
  CALayer *v7;
  CALayer *v8;
  id v9;

  v9 = a3;
  if (!-[PUIProgressWindow _currentDeviceShouldMuteErrors](self, "_currentDeviceShouldMuteErrors"))
  {
    layer = self->_layer;
    if (layer)
    {
      -[CALayer stringByAppendingString:](layer, "stringByAppendingString:", CFSTR(", "));
      v5 = (CALayer *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (CALayer *)&stru_24C454820;
    }
    v6 = self->_layer;
    self->_layer = v5;

    -[CALayer stringByAppendingString:](self->_layer, "stringByAppendingString:", v9);
    v7 = (CALayer *)objc_claimAutoreleasedReturnValue();
    v8 = self->_layer;
    self->_layer = v7;

  }
}

+ (id)_errorDescriptionForUnknownDeviceClass
{
  return CFSTR("unknown device class");
}

+ (id)_errorDescriptionForUnsupportedScreenClass
{
  return CFSTR("unsupported screen class");
}

+ (id)_errorDescriptionForAppleLogoNotFound
{
  return CFSTR("no apple logo found");
}

- (void)_unsupportedScreenClass
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)&self->_isSecurityResearchDevice);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _DMLogFunc();

  +[PUIProgressWindow _errorDescriptionForUnsupportedScreenClass](PUIProgressWindow, "_errorDescriptionForUnsupportedScreenClass", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUIProgressWindow _appendErrorDescriptionWithString:](self, "_appendErrorDescriptionWithString:", v4);

}

- (void)dealloc
{
  void *v3;
  double progressXDelta;
  CALayer *ioSurfaceLayer;
  objc_super v6;

  if (*(_QWORD *)&self->_currentProgress)
  {
    +[PUIFramebufferSizeChangeNotifier sharedInstance](PUIFramebufferSizeChangeNotifier, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeListener:", *(_QWORD *)&self->_currentProgress);

  }
  if (self->_weCreatedTheContext)
    -[CAContext invalidate](self->_context, "invalidate");
  progressXDelta = self->_progressXDelta;
  if (progressXDelta != 0.0)
    CFRelease(*(CFTypeRef *)&progressXDelta);
  -[NSString setContents:](self->_errorDescription, "setContents:", 0);
  ioSurfaceLayer = self->_ioSurfaceLayer;
  if (ioSurfaceLayer)
    CFRelease(ioSurfaceLayer);
  -[CATextLayer setDelegate:](self->_statusTextLayer, "setDelegate:", 0);
  v6.receiver = self;
  v6.super_class = (Class)PUIProgressWindow;
  -[PUIProgressWindow dealloc](&v6, sel_dealloc);
}

- (void)_collectDisplayInfo
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat *p_height;
  float v10;
  void *v11;
  void *v12;
  int v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  const __CFNumber *v19;
  const __CFNumber *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  float v24;
  const __CFNumber *v25;
  const __CFNumber *v26;
  void *v27;
  void *v28;
  float v29;
  float v30;
  double v31;
  double v32;
  float v33;
  float v34;
  float v35;
  float v36;
  double v37;
  double v38;
  BOOL v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  id valuePtr;

  if (self->_screenClass == 4)
  {
    *(_DWORD *)(&self->_renderWithIOSurface + 3) = 0;
    LOBYTE(self->_framebufferListenerToken) = 0;
    objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (!v3 || (objc_msgSend(v3, "bounds"), v5 == 0.0) || (objc_msgSend(v4, "bounds"), v6 == 0.0))
    {
      _DMLogFunc();
      *(_OWORD *)&self->_displaySize.height = xmmword_20B7E97B0;
      *(_OWORD *)&self->_framebufferSize.height = *(_OWORD *)&self->_displaySize.height;
    }
    else
    {
      objc_msgSend(v4, "bounds");
      self->_framebufferSize.height = v7;
      self->_layerPositioningSize.width = v8;
      p_height = &self->_displaySize.height;
      if (v7 > 1920.0)
      {
        *(_OWORD *)p_height = xmmword_20B7E97B0;
        v10 = v7 / 1920.0;
LABEL_15:
        *(float *)&self->_sideways = v10;
        objc_initWeak(&valuePtr, self);
        +[PUIFramebufferSizeChangeNotifier sharedInstance](PUIFramebufferSizeChangeNotifier, "sharedInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = MEMORY[0x24BDAC760];
        v54[1] = 3221225472;
        v54[2] = __40__PUIProgressWindow__collectDisplayInfo__block_invoke;
        v54[3] = &unk_24C454660;
        objc_copyWeak(&v55, &valuePtr);
        objc_msgSend(v21, "addListener:", v54);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = *(void **)&self->_currentProgress;
        *(_QWORD *)&self->_currentProgress = v22;

        objc_destroyWeak(&v55);
        objc_destroyWeak(&valuePtr);

        v24 = 0.0;
        goto LABEL_45;
      }
      *(_OWORD *)p_height = *(_OWORD *)&self->_framebufferSize.height;
    }
    v10 = 1.0;
    goto LABEL_15;
  }
  LODWORD(valuePtr) = 0;
  -[PUIEnvironment mainScreenScale](self->_environment, "mainScreenScale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "floatValue");
    *(_DWORD *)&self->_sideways = v13;
  }
  v14 = (const __CFNumber *)MGCopyAnswer();
  if (v14)
  {
    v15 = v14;
    CFNumberGetValue(v14, kCFNumberFloat32Type, &valuePtr);
    *(_DWORD *)(&self->_renderWithIOSurface + 3) = (_DWORD)valuePtr;
    CFRelease(v15);
  }
  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  self->_framebufferSize.height = v17;
  self->_layerPositioningSize.width = v18;

  v19 = (const __CFNumber *)MGCopyAnswer();
  if (v19)
  {
    v20 = v19;
    CFNumberGetValue(v19, kCFNumberFloat32Type, &valuePtr);
    self->_displaySize.height = *(float *)&valuePtr;
    CFRelease(v20);
  }
  else
  {
    self->_displaySize.height = self->_framebufferSize.height;
  }
  v25 = (const __CFNumber *)MGCopyAnswer();
  if (v25)
  {
    v26 = v25;
    CFNumberGetValue(v25, kCFNumberFloat32Type, &valuePtr);
    self->_framebufferSize.width = *(float *)&valuePtr;
    CFRelease(v26);
  }
  else
  {
    self->_framebufferSize.width = self->_layerPositioningSize.width;
  }
  v27 = (void *)MGCopyAnswer();
  v28 = v27;
  if (v27)
  {
    objc_msgSend(v27, "floatValue");
    v24 = v29;
    if (v29 != 0.0)
    {
      v30 = v29 + -90.0;
      if ((float)(v24 + -90.0) < 0.0)
        v30 = -(float)(v24 + -90.0);
      if (v30 >= 0.01)
      {
        v34 = v24 + -180.0;
        if ((float)(v24 + -180.0) < 0.0)
          v34 = -(float)(v24 + -180.0);
        if (v34 < 0.01)
        {
          v35 = *(float *)(&self->_renderWithIOSurface + 3) + 3.14159265;
          *(float *)(&self->_renderWithIOSurface + 3) = v35;
          goto LABEL_37;
        }
        v36 = v24 + -270.0;
        if ((float)(v24 + -270.0) < 0.0)
          v36 = -(float)(v24 + -270.0);
        if (v36 >= 0.01)
          goto LABEL_37;
        v31 = *(float *)(&self->_renderWithIOSurface + 3);
        v32 = 1.57079633;
      }
      else
      {
        v31 = *(float *)(&self->_renderWithIOSurface + 3);
        v32 = 4.71238898;
      }
      v33 = v31 + v32;
      *(float *)(&self->_renderWithIOSurface + 3) = v33;
      *(int8x16_t *)&self->_displaySize.height = vextq_s8(*(int8x16_t *)&self->_displaySize.height, *(int8x16_t *)&self->_displaySize.height, 8uLL);
    }
  }
  else
  {
    v24 = 0.0;
  }
LABEL_37:
  v37 = *(float *)(&self->_renderWithIOSurface + 3);
  v38 = -(v37 + -1.57079633);
  if (v37 + -1.57079633 >= 0.0)
    v38 = v37 + -1.57079633;
  if (v38 >= 0.01)
  {
    v40 = v37 + -4.71238898;
    if (v40 < 0.0)
      v40 = -v40;
    v39 = v40 < 0.01;
  }
  else
  {
    v39 = 1;
  }
  LOBYTE(self->_framebufferListenerToken) = v39;

LABEL_45:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_displaySize.height);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_framebufferSize.width);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_framebufferSize.height);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_layerPositioningSize.width);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v44) = *(_DWORD *)&self->_sideways;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v46) = *(_DWORD *)(&self->_renderWithIOSurface + 3);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", LOBYTE(self->_framebufferListenerToken));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v49 = v24;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v49);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v53;
  _DMLogFunc();

  if (MGGetSInt32Answer() == 1
    || !BYTE1(self->_progressLayer)
    && objc_msgSend((id)objc_opt_class(), "_usesPreBoardAppearance", v53, v41, v42, v43, v45, v47, v48, v52))
  {
    _DMLogFunc();
    BYTE1(self->_progressLayer) = 1;
  }
  if (LOBYTE(self->_progressLayer))
    BYTE1(self->_progressLayer) ^= 1u;
  *(_OWORD *)&self->_layerPositioningSize.height = *(_OWORD *)&self->_framebufferSize.height;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", BYTE1(self->_framebufferListenerToken), v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  _DMLogFunc();

}

void __40__PUIProgressWindow__collectDisplayInfo__block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateLayerForFramebufferSize:", a2, a3);

}

- (void)_createContext
{
  id v3;
  uint64_t v4;
  int v5;
  CAContext *v6;
  CAContext *context;
  CAContext *v8;
  id v9;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = *MEMORY[0x24BDBD270];
  v9 = v3;
  if (*(float *)&self->_sideways == 2.0)
  {
    objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x24BDE58C0]);
    objc_msgSend(v9, "setObject:forKey:", v4, *MEMORY[0x24BDE58C8]);
    v3 = v9;
  }
  objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x24BDE58B8]);
  v5 = 3;
  while (1)
  {
    objc_msgSend(MEMORY[0x24BDE5658], "remoteContextWithOptions:", v9);
    v6 = (CAContext *)objc_claimAutoreleasedReturnValue();
    context = self->_context;
    self->_context = v6;

    v8 = self->_context;
    if (v8)
      break;
    _DMLogFunc();
    sleep(2u);
    if (!--v5)
      goto LABEL_8;
  }
  -[CAContext setSecure:](v8, "setSecure:", 1);
  self->_weCreatedTheContext = 1;
LABEL_8:
  if (!self->_context)
    _DMLogFunc();

}

- (CGColor)_copyCGColorRefWithComponents:(const double *)a3
{
  CGColor *result;
  CGColor *v5;
  CGColor *v6;

  result = CGColorSpaceCreateDeviceRGB();
  if (result)
  {
    v5 = result;
    v6 = CGColorCreate(result, a3);
    CFRelease(v5);
    return v6;
  }
  return result;
}

- (CGColor)_copyWhiteCGColorRef
{
  return -[PUIProgressWindow _copyCGColorRefWithComponents:](self, "_copyCGColorRefWithComponents:", &_copyWhiteCGColorRef_white);
}

- (CGColor)_copyBlackCGColorRef
{
  return -[PUIProgressWindow _copyCGColorRefWithComponents:](self, "_copyCGColorRefWithComponents:", &_copyBlackCGColorRef_black);
}

- (void)_createLayer
{
  void *v3;
  CGColor *v4;
  CGColor *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  PUIProgressWindow *v21;
  CAContext *context;
  const __CFDictionary *v23;
  NSString *v24;
  NSString *errorDescription;
  NSString *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  Class isa;
  Class v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  void *v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  CGAffineTransform v86;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v89;
  CGAffineTransform v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  CGAffineTransform v109;
  CGAffineTransform v110;
  CGAffineTransform v111;
  CGAffineTransform v112;

  objc_msgSend(MEMORY[0x24BDE56D0], "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisableUpdateMask:", 16);
  if (BYTE1(self->_progressLayer))
    v4 = -[PUIProgressWindow _copyWhiteCGColorRef](self, "_copyWhiteCGColorRef");
  else
    v4 = -[PUIProgressWindow _copyBlackCGColorRef](self, "_copyBlackCGColorRef");
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v3, "setBackgroundColor:", v4);
    CFRelease(v5);
  }
  CGAffineTransformMakeRotation(&v112, (float)-*(float *)(&self->_renderWithIOSurface + 3));
  v111 = v112;
  objc_msgSend(v3, "setAffineTransform:", &v111);
  objc_msgSend(v3, "setPosition:", self->_layerPositioningSize.height * 0.5, *(double *)&self->_displayScale * 0.5);
  objc_msgSend(v3, "setBounds:", 0.0, 0.0, self->_displaySize.height, self->_framebufferSize.width);
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "position");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "position");
  objc_msgSend(v8, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "bounds");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "bounds");
  objc_msgSend(v13, "numberWithDouble:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "bounds");
  objc_msgSend(v16, "numberWithDouble:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "bounds");
  objc_msgSend(v19, "numberWithDouble:", v20);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  _DMLogFunc();

  objc_msgSend(v3, "setHidden:", 1, v7, v10, v12, v15, v18, v77);
  v21 = self + 1;
  objc_storeStrong((id *)&self[1].super.isa, v3);
  context = self->_context;
  if (context)
    -[CAContext setLayer:](context, "setLayer:", v3);
  if (BYTE1(self->_framebufferListenerToken))
  {
    _IOSurfacePropertyDictionaryForRect(0.0, 0.0, self->_displaySize.height, self->_framebufferSize.width);
    v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    self->_ioSurfaceLayer = (CALayer *)IOSurfaceCreate(v23);
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    errorDescription = self->_errorDescription;
    self->_errorDescription = v24;

    -[NSString setAllowsDisplayCompositing:](self->_errorDescription, "setAllowsDisplayCompositing:", 1);
    CGAffineTransformMakeRotation(&v110, (float)-*(float *)(&self->_renderWithIOSurface + 3));
    v26 = self->_errorDescription;
    v109 = v110;
    -[NSString setAffineTransform:](v26, "setAffineTransform:", &v109);
    -[NSString setFrame:](self->_errorDescription, "setFrame:", 0.0, 0.0, self->_framebufferSize.height, self->_layerPositioningSize.width);
    -[NSString setContents:](self->_errorDescription, "setContents:", self->_ioSurfaceLayer);
    -[NSString setHidden:](self->_errorDescription, "setHidden:", 1);
    -[CAContext setLayer:](self->_context, "setLayer:", self->_errorDescription);

  }
  v27 = 80;
  if (LOBYTE(self->_framebufferListenerToken))
    v28 = 80;
  else
    v28 = 72;
  if (LOBYTE(self->_framebufferListenerToken))
    v27 = 72;
  v29 = *(double *)((char *)&self->super.isa + v27);
  v30 = *(double *)((char *)&self->super.isa + v28);
  if (v30 != self->_displaySize.height || v29 != self->_framebufferSize.width)
  {
    v31 = (void *)MEMORY[0x24BDD16E0];
    if (v21->super.isa)
    {
      -[objc_class affineTransform](v21->super.isa, "affineTransform");
      v32 = *(double *)&v108;
    }
    else
    {
      v107 = 0u;
      v108 = 0u;
      v106 = 0u;
      v32 = 0.0;
    }
    objc_msgSend(v31, "numberWithDouble:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)MEMORY[0x24BDD16E0];
    if (v21->super.isa)
    {
      -[objc_class affineTransform](v21->super.isa, "affineTransform");
      v35 = *((double *)&v105 + 1);
    }
    else
    {
      v104 = 0u;
      v105 = 0u;
      v103 = 0u;
      v35 = 0.0;
    }
    objc_msgSend(v34, "numberWithDouble:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)MEMORY[0x24BDD16E0];
    if (v21->super.isa)
    {
      -[objc_class affineTransform](v21->super.isa, "affineTransform");
      v38 = *(double *)&v100;
    }
    else
    {
      v101 = 0u;
      v102 = 0u;
      v100 = 0u;
      v38 = 0.0;
    }
    objc_msgSend(v37, "numberWithDouble:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x24BDD16E0];
    if (v21->super.isa)
    {
      -[objc_class affineTransform](v21->super.isa, "affineTransform");
      v41 = *((double *)&v97 + 1);
    }
    else
    {
      v98 = 0u;
      v99 = 0u;
      v97 = 0u;
      v41 = 0.0;
    }
    objc_msgSend(v40, "numberWithDouble:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)MEMORY[0x24BDD16E0];
    if (v21->super.isa)
    {
      -[objc_class affineTransform](v21->super.isa, "affineTransform");
      v44 = *(double *)&v95;
    }
    else
    {
      v95 = 0u;
      v96 = 0u;
      v94 = 0u;
      v44 = 0.0;
    }
    objc_msgSend(v43, "numberWithDouble:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)MEMORY[0x24BDD16E0];
    if (v21->super.isa)
    {
      -[objc_class affineTransform](v21->super.isa, "affineTransform");
      v47 = *((double *)&v92 + 1);
    }
    else
    {
      v92 = 0u;
      v93 = 0u;
      v91 = 0u;
      v47 = 0.0;
    }
    objc_msgSend(v46, "numberWithDouble:", v47);
    v76 = v45;
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v39;
    v74 = v42;
    v68 = v33;
    v70 = v36;
    _DMLogFunc();

    memset(&v90, 0, sizeof(v90));
    CGAffineTransformMakeScale(&v90, v30 / self->_displaySize.height, v29 / self->_framebufferSize.width);
    isa = self[1].super.isa;
    if (isa)
    {
      -[objc_class affineTransform](isa, "affineTransform", v33, v36, v39, v42, v45, v79);
      v49 = v21->super.isa;
    }
    else
    {
      v49 = 0;
      memset(&t1, 0, sizeof(t1));
    }
    t2 = v90;
    CGAffineTransformConcat(&v89, &t1, &t2);
    v86 = v89;
    -[objc_class setAffineTransform:](v49, "setAffineTransform:", &v86);
    v50 = (void *)MEMORY[0x24BDD16E0];
    if (v21->super.isa)
    {
      -[objc_class affineTransform](v21->super.isa, "affineTransform");
      v51 = v85;
    }
    else
    {
      v51 = 0.0;
    }
    objc_msgSend(v50, "numberWithDouble:", v51, v68, v70, v72, v74, v76, v79);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)MEMORY[0x24BDD16E0];
    if (v21->super.isa)
    {
      -[objc_class affineTransform](v21->super.isa, "affineTransform");
      v54 = v84;
    }
    else
    {
      v54 = 0.0;
    }
    objc_msgSend(v53, "numberWithDouble:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)MEMORY[0x24BDD16E0];
    if (v21->super.isa)
    {
      -[objc_class affineTransform](v21->super.isa, "affineTransform");
      v57 = v83;
    }
    else
    {
      v57 = 0.0;
    }
    objc_msgSend(v56, "numberWithDouble:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)MEMORY[0x24BDD16E0];
    if (v21->super.isa)
    {
      -[objc_class affineTransform](v21->super.isa, "affineTransform");
      v60 = v82;
    }
    else
    {
      v60 = 0.0;
    }
    objc_msgSend(v59, "numberWithDouble:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)MEMORY[0x24BDD16E0];
    if (v21->super.isa)
    {
      -[objc_class affineTransform](v21->super.isa, "affineTransform");
      v63 = v81;
    }
    else
    {
      v63 = 0.0;
    }
    objc_msgSend(v62, "numberWithDouble:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)MEMORY[0x24BDD16E0];
    if (v21->super.isa)
    {
      -[objc_class affineTransform](v21->super.isa, "affineTransform");
      v66 = v80;
    }
    else
    {
      v66 = 0.0;
    }
    objc_msgSend(v65, "numberWithDouble:", v66);
    v75 = v64;
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v58;
    v73 = v61;
    v67 = v52;
    v69 = v55;
    _DMLogFunc();

  }
  -[PUIProgressWindow _layoutScreen](self, "_layoutScreen", v67, v69, v71, v73, v75, v78);

}

- (void)_updateIOSurface
{
  void *BaseAddress;
  size_t Width;
  unint64_t Height;
  size_t BytesPerRow;
  CGColorSpace *DeviceRGB;
  CGContext *v8;
  uint64_t v9;
  CGAffineTransform v10;

  IOSurfaceLock((IOSurfaceRef)self->_ioSurfaceLayer, 0, 0);
  BaseAddress = IOSurfaceGetBaseAddress((IOSurfaceRef)self->_ioSurfaceLayer);
  Width = IOSurfaceGetWidth((IOSurfaceRef)self->_ioSurfaceLayer);
  Height = IOSurfaceGetHeight((IOSurfaceRef)self->_ioSurfaceLayer);
  BytesPerRow = IOSurfaceGetBytesPerRow((IOSurfaceRef)self->_ioSurfaceLayer);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v8 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, BytesPerRow, DeviceRGB, 0x2002u);
  CGColorSpaceRelease(DeviceRGB);
  if (v8)
  {
    CGContextTranslateCTM(v8, 0.0, (double)Height);
    CGContextScaleCTM(v8, 1.0, -1.0);
    CGAffineTransformMakeScale(&v10, 1.0, -1.0);
    CGContextSetBaseCTM();
    v9 = -[objc_class isHidden](self[1].super.isa, "isHidden");
    -[objc_class setHidden:](self[1].super.isa, "setHidden:", 0);
    -[objc_class renderInContext:](self[1].super.isa, "renderInContext:", v8);
    -[objc_class setHidden:](self[1].super.isa, "setHidden:", v9);
    CGContextRelease(v8);
  }
  IOSurfaceUnlock((IOSurfaceRef)self->_ioSurfaceLayer, 0, 0);
  -[NSString setContents:](self->_errorDescription, "setContents:", 0);
  -[NSString setContents:](self->_errorDescription, "setContents:", self->_ioSurfaceLayer);
}

- (void)setVisible:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  -[objc_class setHidden:](self[1].super.isa, "setHidden:", !v3);
  -[NSString setHidden:](self->_errorDescription, "setHidden:", !v3);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  _DMLogFunc();
}

- (void)setProgressValue:(float)a3
{
  *(float *)&self->_appleLogo = a3;
  -[CATextLayer setNeedsDisplay](self->_statusTextLayer, "setNeedsDisplay");
  if (BYTE1(self->_framebufferListenerToken))
    -[PUIProgressWindow _updateIOSurface](self, "_updateIOSurface");
}

- (void)setStatusText:(id)a3
{
  id v4;
  __IOSurface *v5;
  __IOSurface *ioSurface;
  double height;
  double v8;
  CGColor *v9;
  CGColor *v10;
  __IOSurface *v11;
  id v12;
  void *v13;
  char v14;
  id v15;

  v4 = a3;
  v15 = v4;
  if (v4 && !self->_ioSurface)
  {
    v5 = (__IOSurface *)objc_alloc_init(MEMORY[0x24BDE57C0]);
    ioSurface = self->_ioSurface;
    self->_ioSurface = v5;

    -[__IOSurface setString:](self->_ioSurface, "setString:", 0);
    -[__IOSurface setFontSize:](self->_ioSurface, "setFontSize:", 50.0);
    height = self->_displaySize.height;
    v8 = 1000.0;
    if (height + -200.0 <= 1000.0)
      v8 = height + -200.0;
    -[__IOSurface setFrame:](self->_ioSurface, "setFrame:", (height - v8) * 0.5, self->_framebufferSize.width + -300.0, v8, 300.0);
    -[__IOSurface setWrapped:](self->_ioSurface, "setWrapped:", 1);
    -[__IOSurface setAlignmentMode:](self->_ioSurface, "setAlignmentMode:", CFSTR("center"));
    if (BYTE1(self->_progressLayer))
      v9 = -[PUIProgressWindow _copyBlackCGColorRef](self, "_copyBlackCGColorRef");
    else
      v9 = -[PUIProgressWindow _copyWhiteCGColorRef](self, "_copyWhiteCGColorRef");
    v10 = v9;
    if (v9)
    {
      -[__IOSurface setForegroundColor:](self->_ioSurface, "setForegroundColor:", v9);
      CFRelease(v10);
    }
    -[objc_class addSublayer:](self[1].super.isa, "addSublayer:", self->_ioSurface);
    v4 = v15;
  }
  v11 = self->_ioSurface;
  if (v11)
  {
    -[__IOSurface string](v11, "string");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12 == v15)
    {

      goto LABEL_17;
    }
    -[__IOSurface string](self->_ioSurface, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "isEqualToString:", v13);

    v4 = v15;
    if ((v14 & 1) == 0)
    {
      -[__IOSurface setString:](self->_ioSurface, "setString:", v15);
      v4 = v15;
      if (BYTE1(self->_framebufferListenerToken))
      {
        -[PUIProgressWindow _updateIOSurface](self, "_updateIOSurface");
LABEL_17:
        v4 = v15;
      }
    }
  }

}

- (const)_productSuffix
{
  const char *result;
  int v4;

  result = 0;
  switch(self->_screenClass)
  {
    case 1:
    case 2:
      result = "iphone";
      break;
    case 3:
      result = "ipad";
      break;
    case 4:
      result = "appletv";
      break;
    case 6:
      v4 = *(_DWORD *)&self->_isSecurityResearchDevice;
      if (v4 <= 25)
      {
        switch(v4)
        {
          case 13:
            result = "watch-compact";
            break;
          case 16:
            result = "watch-394h";
            break;
          case 17:
            result = "watch-448h";
            break;
          default:
LABEL_18:
            result = "watch-regular";
            break;
        }
      }
      else
      {
        switch(v4)
        {
          case 26:
            result = "watch-484h";
            break;
          case 27:
            result = "watch-430h";
            break;
          case 29:
            result = "watch-502h";
            break;
          case 34:
            result = "watch-446h";
            break;
          case 35:
            result = "watch-496h";
            break;
          default:
            goto LABEL_18;
        }
      }
      break;
    default:
      return result;
  }
  return result;
}

- (const)_appleTVProductSuffix
{
  return "appletv";
}

- (void)_layoutScreen
{
  int v3;
  const char *v4;
  double v5;
  double v6;
  int v7;
  const char *v8;
  const char *v9;
  int v10;
  unsigned int v11;
  const char *v12;
  const char *v13;
  CGImage *v14;
  int screenClass;
  int v16;
  double v17;
  double v18;
  float v19;
  double height;
  double v21;
  double width;
  double v23;
  size_t v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  size_t v30;
  float64x2_t v31;
  double v32;
  double v33;
  CATextLayer *v34;
  CATextLayer *statusTextLayer;
  double progressHeight;
  double progressWidth;
  CATextLayer *v38;
  double progressYDelta;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;

  v3 = 0;
  if (BYTE1(self->_progressLayer))
    v4 = "apple-logo-black";
  else
    v4 = "apple-logo";
  v5 = 0.0;
  v6 = 0.0;
  switch(self->_screenClass)
  {
    case 1:
    case 2:
      v7 = *(_DWORD *)&self->_isSecurityResearchDevice;
      switch(v7)
      {
        case 18:
          v8 = "apple-logo-black-d3x";
          v9 = "apple-logo-d3x";
          goto LABEL_7;
        case 19:
          v12 = "apple-logo-black-n84";
          if (BYTE1(self->_progressLayer))
          {
            v13 = "apple-logo-black-1792-SRD";
          }
          else
          {
            v12 = "apple-logo-n84";
            v13 = "apple-logo-1792-SRD";
          }
          if (LOBYTE(self->_displaySize.width))
            v4 = v13;
          else
            v4 = v12;
          if (LOBYTE(self->_displaySize.width))
            v5 = -38.0;
          else
            v5 = 0.0;
          v3 = 1;
          goto LABEL_53;
        case 20:
        case 21:
        case 23:
        case 26:
        case 27:
        case 28:
        case 29:
        case 32:
        case 33:
        case 34:
        case 35:
          goto LABEL_31;
        case 22:
        case 25:
        case 30:
        case 31:
        case 36:
        case 37:
          goto LABEL_6;
        case 24:
          if (LOBYTE(self->_displaySize.width))
          {
            if (BYTE1(self->_progressLayer))
              v4 = "apple-logo-black-2532-SRD";
            else
              v4 = "apple-logo-2532-SRD";
            v3 = 1;
            v5 = -54.0;
          }
          else
          {
LABEL_6:
            v8 = "apple-logo-black-d5x";
            v9 = "apple-logo-d5x";
LABEL_7:
            if (BYTE1(self->_progressLayer))
              v4 = v8;
            else
              v4 = v9;
            v3 = 1;
          }
          goto LABEL_53;
        default:
          if (v7 == -1)
            goto LABEL_32;
LABEL_31:
          if (v7 >= 18)
            goto LABEL_32;
          goto LABEL_33;
      }
    case 3:
    case 5:
      v10 = *(_DWORD *)&self->_isSecurityResearchDevice;
      if (v10 != 11)
      {
        if (v10 == 33 || v10 == 20)
        {
          v3 = 0;
          if (BYTE1(self->_progressLayer))
            v4 = "apple-logo-black-j317";
          else
            v4 = "apple-logo-j317";
          v6 = 254.0;
          goto LABEL_53;
        }
        goto LABEL_24;
      }
      if ((MGGetBoolAnswer() & 1) == 0)
      {
        v10 = *(_DWORD *)&self->_isSecurityResearchDevice;
LABEL_24:
        if (v10 == -1)
          goto LABEL_35;
        if (v10 == 32)
          goto LABEL_26;
        if (v10 >= 29)
LABEL_35:
          -[PUIProgressWindow _unsupportedScreenClass](self, "_unsupportedScreenClass");
        v3 = 0;
        v6 = 224.0;
        goto LABEL_53;
      }
LABEL_26:
      v3 = 0;
      if (BYTE1(self->_progressLayer))
        v4 = "apple-logo-black-j320";
      else
        v4 = "apple-logo-j320";
      v6 = 286.0;
LABEL_53:
      v14 = -[PUIProgressWindow _createImageWithName:scale:displayHeight:](self, "_createImageWithName:scale:displayHeight:", v4, (int)*(float *)&self->_sideways, (int)self->_framebufferSize.width);
      *(_QWORD *)&self->_progressXDelta = v14;
      screenClass = self->_screenClass;
      if ((screenClass - 1) < 2)
      {
        v19 = *(float *)&self->_sideways;
        height = self->_displaySize.height;
        v21 = (height - (double)CGImageGetWidth(v14)) * 0.5;
        width = self->_framebufferSize.width;
        self->_progressYDelta = ceil(self->_displaySize.height * 0.192647059);
        if (v3)
        {
          v18 = floor((width - (double)CGImageGetHeight(*(CGImageRef *)&self->_progressXDelta)) * 0.5);
          v23 = v5
              + v18
              + (double)CGImageGetHeight(*(CGImageRef *)&self->_progressXDelta)
              + (float)(*(float *)&self->_sideways * -12.0);
        }
        else
        {
          if (width <= 1136.0)
          {
            if (width <= 960.0)
            {
              self->_progressWidth = 592.0;
              v18 = 364.0;
            }
            else
            {
              self->_progressWidth = 680.0;
              v18 = 452.0;
            }
            goto LABEL_65;
          }
          v18 = floor((double)(int)v19 * -18.5)
              + floor((width - (double)CGImageGetHeight(*(CGImageRef *)&self->_progressXDelta)) * 0.5);
          v23 = v18
              + (double)CGImageGetHeight(*(CGImageRef *)&self->_progressXDelta)
              + (float)(*(float *)&self->_sideways * 35.0);
        }
        self->_progressWidth = ceil(v23);
LABEL_65:
        v17 = ceil(v21);
        v33 = (float)(*(float *)&self->_sideways * 4.0);
        self->_progressHeight = self->_displaySize.height + self->_progressYDelta * -2.0;
        *(double *)&self->_forceInverted = v33;
        goto LABEL_66;
      }
      if (screenClass == 4)
      {
        v17 = ceil((self->_displaySize.height - (double)CGImageGetWidth(v14)) * 0.5);
        v18 = ceil((self->_framebufferSize.width - (double)CGImageGetHeight(*(CGImageRef *)&self->_progressXDelta)) * 0.5);
        self->_progressYDelta = ceil(self->_displaySize.height * 0.15625);
        v24 = CGImageGetHeight(*(CGImageRef *)&self->_progressXDelta);
        v25 = self->_displaySize.height + self->_progressYDelta * -2.0;
        self->_progressWidth = v18 + (double)v24 + ceil(self->_framebufferSize.width * 0.037037037);
        self->_progressHeight = v25;
        *(double *)&self->_forceInverted = (float)(*(float *)&self->_sideways * 4.0);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_progressWidth);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_progressHeight);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&self->_forceInverted);
        v44 = v28;
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v26;
        v43 = v27;
        _DMLogFunc();

      }
      else if (screenClass == 6)
      {
        v16 = *(_DWORD *)&self->_isSecurityResearchDevice;
        switch(v16)
        {
          case 26:
            v17 = 147.0;
            v18 = 173.0;
            break;
          case 27:
            v17 = 131.0;
            v18 = 153.0;
            break;
          case 28:
          case 30:
          case 31:
          case 32:
          case 33:
LABEL_81:
            _DMLogFunc();
            goto LABEL_82;
          case 29:
            v17 = 155.0;
            v18 = 190.0;
            break;
          case 34:
          case 35:
LABEL_82:
            v18 = 0.0;
            v17 = 0.0;
            break;
          default:
            v17 = 99.0;
            v18 = 119.0;
            switch(v16)
            {
              case 12:
                v17 = 113.0;
                goto LABEL_84;
              case 13:
                goto LABEL_66;
              case 16:
                v17 = 122.0;
LABEL_84:
                v18 = 137.0;
                break;
              case 17:
                v17 = 135.0;
                v18 = 155.0;
                break;
              default:
                goto LABEL_81;
            }
            break;
        }
      }
      else
      {
        v17 = ceil((self->_displaySize.height - (double)CGImageGetWidth(v14)) * 0.5);
        v29 = self->_framebufferSize.width;
        v30 = CGImageGetHeight(*(CGImageRef *)&self->_progressXDelta);
        v31 = vcvtq_f64_f32(vmul_n_f32((float32x2_t)0x40800000436F0000, *(float *)&self->_sideways));
        *(float64x2_t *)&self->_progressHeight = v31;
        v18 = ceil((v29 - (double)v30) * 0.5);
        v32 = ceil((self->_displaySize.height - v31.f64[0]) * 0.5);
        v31.f64[0] = v6 + ceil(self->_framebufferSize.width * 0.5);
        self->_progressYDelta = v32;
        self->_progressWidth = v31.f64[0];
      }
LABEL_66:
      if (BYTE2(self->_progressLayer))
      {
        v34 = (CATextLayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
        statusTextLayer = self->_statusTextLayer;
        self->_statusTextLayer = v34;

        if (self->_screenClass == 6)
        {
          progressHeight = self->_displaySize.height;
          progressWidth = self->_framebufferSize.width * 0.5 - progressHeight * 0.5;
          v38 = self->_statusTextLayer;
          progressYDelta = 0.0;
          v40 = progressHeight;
        }
        else
        {
          progressYDelta = self->_progressYDelta;
          progressWidth = self->_progressWidth;
          progressHeight = self->_progressHeight;
          v40 = *(double *)&self->_forceInverted;
          v38 = self->_statusTextLayer;
        }
        -[CATextLayer setFrame:](v38, "setFrame:", progressYDelta, progressWidth, progressHeight, v40, v42, v43, v44, v45);
        -[CATextLayer setDelegate:](self->_statusTextLayer, "setDelegate:", self);
        -[CATextLayer setNeedsDisplay](self->_statusTextLayer, "setNeedsDisplay");
        -[objc_class addSublayer:](self[1].super.isa, "addSublayer:", self->_statusTextLayer);
      }
      objc_msgSend(MEMORY[0x24BDE56D0], "layer", v42, v43, v44, v45);
      v46 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setContents:", *(_QWORD *)&self->_progressXDelta);
      v41 = (double)CGImageGetWidth(*(CGImageRef *)&self->_progressXDelta);
      objc_msgSend(v46, "setFrame:", v17, v18, v41, (double)CGImageGetHeight(*(CGImageRef *)&self->_progressXDelta));
      -[objc_class addSublayer:](self[1].super.isa, "addSublayer:", v46);
      if (BYTE1(self->_framebufferListenerToken))
        -[PUIProgressWindow _updateIOSurface](self, "_updateIOSurface");

      return;
    case 4:
      goto LABEL_53;
    case 6:
      v11 = *(_DWORD *)&self->_isSecurityResearchDevice;
      if (v11 > 0x23 || ((1 << v11) & 0xC2C033000) == 0)
LABEL_32:
        -[PUIProgressWindow _unsupportedScreenClass](self, "_unsupportedScreenClass");
LABEL_33:
      v3 = 0;
      goto LABEL_53;
    default:
      v6 = 0.0;
      goto LABEL_53;
  }
}

- (void)_drawProgressLayerInContext:(CGContext *)a3
{
  double v5;
  unsigned int v6;
  double v7;
  BOOL v8;
  uint64_t v9;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  signed int v15;
  signed int v16;
  char v17;
  double v18;
  double progressHeight;
  const CGPath *v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  _OWORD v30[2];
  CGFloat components[2];
  __int128 v32;
  uint64_t v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v33 = *MEMORY[0x24BDAC8D0];
  if (self->_screenClass == 6)
  {
    v5 = self->_displaySize.height * 0.5;
    v6 = *(_DWORD *)&self->_isSecurityResearchDevice;
    v7 = 5.5;
    v8 = v6 > 0x22;
    v9 = (1 << v6) & 0x408012000;
    if (v8 || v9 == 0)
      v7 = 6.0;
    v11 = v5 - v7 * *(float *)&self->_sideways;
    CGContextSaveGState(a3);
    *(_OWORD *)components = xmmword_20B7E9808;
    v32 = unk_20B7E9818;
    v30[0] = xmmword_20B7E9828;
    v30[1] = unk_20B7E9838;
    CGContextSetLineWidth(a3, *(float *)&self->_sideways);
    -[CATextLayer bounds](self->_statusTextLayer, "bounds", xmmword_20B7E9828, unk_20B7E9838, 0x3FE6666666666666, 0x3FE6666666666666, unk_20B7E9818);
    v13 = v12 * 0.5;
    -[CATextLayer bounds](self->_statusTextLayer, "bounds");
    CGContextTranslateCTM(a3, v13, v14 * 0.5);
    CGContextRotateCTM(a3, 3.14159265);
    v15 = llroundf(*(float *)&self->_appleLogo * 100.0);
    CGContextSetStrokeColor(a3, components);
    v16 = 0;
    v17 = 0;
    do
    {
      if (v16 > v15 && (v17 & 1) == 0)
      {
        CGContextSetStrokeColor(a3, (const CGFloat *)v30);
        v17 = 1;
      }
      CGContextMoveToPoint(a3, 0.0, v11);
      CGContextAddLineToPoint(a3, 0.0, v5);
      CGContextStrokePath(a3);
      CGContextRotateCTM(a3, 0.0628318531);
      ++v16;
    }
    while (v16 != 100);
    CGContextRestoreGState(a3);
  }
  else
  {
    progressHeight = self->_progressHeight;
    v18 = *(double *)&self->_forceInverted;
    v34.origin.x = 0.0;
    v34.origin.y = 0.0;
    v34.size.width = progressHeight;
    v34.size.height = v18;
    v20 = CGPathCreateWithRoundedRect(v34, v18 * 0.5, v18 * 0.5, 0);
    v21 = floor(self->_progressHeight * *(float *)&self->_appleLogo);
    if (*(float *)&self->_sideways == 1.0)
      v22 = v21;
    else
      v22 = self->_progressHeight * *(float *)&self->_appleLogo;
    CGContextSaveGState(a3);
    v35.origin.x = 0.0;
    v35.origin.y = 0.0;
    v35.size.width = v22;
    v35.size.height = v18;
    CGContextClipToRect(a3, v35);
    CGContextAddPath(a3, v20);
    if (BYTE1(self->_progressLayer))
    {
      v23 = 0.0;
      v24 = 0.0;
      v25 = 0.0;
    }
    else
    {
      v23 = 1.0;
      v24 = 1.0;
      v25 = 1.0;
    }
    CGContextSetRGBFillColor(a3, v23, v24, v25, 1.0);
    CGContextFillPath(a3);
    CGContextRestoreGState(a3);
    v36.size.width = progressHeight - v22;
    v36.origin.y = 0.0;
    v36.origin.x = v22;
    v36.size.height = v18;
    CGContextClipToRect(a3, v36);
    CGContextAddPath(a3, v20);
    if (BYTE1(self->_progressLayer))
    {
      v26 = 0.2;
      v27 = 0.0;
      v28 = 0.0;
      v29 = 0.0;
    }
    else
    {
      v26 = 0.3;
      v27 = 1.0;
      v28 = 1.0;
      v29 = 1.0;
    }
    CGContextSetRGBFillColor(a3, v27, v28, v29, v26);
    CGContextFillPath(a3);
    CGPathRelease(v20);
  }
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  if (self->_statusTextLayer == a3)
    -[PUIProgressWindow _drawProgressLayerInContext:](self, "_drawProgressLayerInContext:", a4);
}

- (CGImage)_createImageWithName:(const char *)a3 scale:(int)a4 displayHeight:(int)a5
{
  const char *v7;
  _BOOL4 v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  size_t v13;
  const __CFURL *v14;
  const __CFURL *v15;
  CGImageSource *v16;
  CGImageSource *v17;
  CGImage *ImageAtIndex;
  uint64_t v20;
  uint64_t v21;
  char __str[1024];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = -[PUIProgressWindow _productSuffix](self, "_productSuffix");
  if (v7)
    v8 = strcmp(v7, -[PUIProgressWindow _appleTVProductSuffix](self, "_appleTVProductSuffix")) == 0;
  else
    v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resourcePath");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (const char *)objc_msgSend(v10, "UTF8String");

  if (!v7)
    goto LABEL_27;
  if (v8)
    snprintf(__str, 0x400uLL, "%s/%s@%d~%s.png");
  else
    snprintf(__str, 0x400uLL, "%s/%s@%dx~%s.png");
  if (access(__str, 0))
  {
LABEL_27:
    if (v8)
      snprintf(__str, 0x400uLL, "%s/%s@%d.png");
    else
      snprintf(__str, 0x400uLL, "%s/%s@%dx.png");
    if (access(__str, 0))
    {
      snprintf(__str, 0x400uLL, "%s/%s~%s.png", v11, a3, v7);
      if (access(__str, 0))
      {
        _DMLogFunc();
        +[PUIProgressWindow _errorDescriptionForAppleLogoNotFound](PUIProgressWindow, "_errorDescriptionForAppleLogoNotFound", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUIProgressWindow _appendErrorDescriptionWithString:](self, "_appendErrorDescriptionWithString:", v12);

LABEL_21:
        ImageAtIndex = 0;
        goto LABEL_24;
      }
    }
  }
  _DMLogFunc();
  v13 = strlen(__str);
  v14 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)__str, v13, 0);
  if (!v14)
  {
    _DMLogFunc();
    goto LABEL_21;
  }
  v15 = v14;
  v20 = *MEMORY[0x24BDD97D0];
  v21 = *MEMORY[0x24BDBD270];
  v16 = CGImageSourceCreateWithURL(v14, (CFDictionaryRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1, __str));
  if (v16)
  {
    v17 = v16;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v16, 0, 0);
    if (!ImageAtIndex)
      _DMLogFunc();
    CFRelease(v17);
  }
  else
  {
    _DMLogFunc();
    ImageAtIndex = 0;
  }
  CFRelease(v15);
LABEL_24:

  return ImageAtIndex;
}

- (NSString)errorDescription
{
  return (NSString *)&self->_layer->super.isa;
}

- (CALayer)layer
{
  return (CALayer *)self[1].super.isa;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self[1].super.isa, 0);
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_ioSurface, 0);
  objc_storeStrong((id *)&self->_statusTextLayer, 0);
  objc_storeStrong((id *)&self->_currentProgress, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
