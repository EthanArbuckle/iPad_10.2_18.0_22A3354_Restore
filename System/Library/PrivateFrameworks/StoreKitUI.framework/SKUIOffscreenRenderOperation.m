@implementation SKUIOffscreenRenderOperation

- (SKUIOffscreenRenderOperation)init
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SKUIOffscreenRenderOperation *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *accessQueue;
  objc_super v15;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIOffscreenRenderOperation init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIOffscreenRenderOperation;
  v11 = -[SKUIOffscreenRenderOperation init](&v15, sel_init);
  if (v11)
  {
    v12 = dispatch_queue_create("com.apple.StoreKitUI.SKUIOffscreenRenderOperation.accessQueu", MEMORY[0x1E0C80D50]);
    accessQueue = v11->_accessQueue;
    v11->_accessQueue = (OS_dispatch_queue *)v12;

  }
  return v11;
}

- (void)main
{
  double v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;
  id v6;
  void *v7;
  CGSize v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id *v25;
  void *v26;
  id *v27;
  void *v28;
  id v29;
  void *v30;
  id *v31;
  void *v32;
  id v33;
  id *v34;
  void *v35;
  id v36;
  id *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  const void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  const char *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  const char *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  const char *v87;
  void *v88;
  void *v89;
  NSObject *accessQueue;
  uint64_t Error;
  const char *v92;
  CFTimeInterval v93;
  uint64_t v94;
  id v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  id v101;
  _QWORD block[5];
  id v103;
  uint64_t v104;
  CATransform3D v105;
  CATransform3D v106;
  CGRect v107;
  id v108;
  id v109;
  uint64_t v110;
  _QWORD v111[5];
  _QWORD v112[8];
  CGRect v113;
  CGRect v114;

  v112[5] = *MEMORY[0x1E0C80C00];
  if ((-[SKUIOffscreenRenderOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v3 = CACurrentMediaTime();
    -[SKUIOffscreenRenderOperation createLayerBlock](self, "createLayerBlock");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v108 = 0;
    v109 = 0;
    _SKUIOffscreenRenderOperationPopRenderingContext(&v109, &v108);
    v5 = v109;
    v6 = v108;
    v7 = v6;
    if (!v5 || !v6)
      goto LABEL_148;
    objc_msgSend(getEAGLContextClass(), "currentContext");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getEAGLContextClass(), "setCurrentContext:", v7);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v8 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v107.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v107.size = v8;
    if (!v4
      || (((void (**)(_QWORD, CGRect *))v4)[2](v4, &v107),
          v101 = (id)objc_claimAutoreleasedReturnValue(),
          v101,
          !v101))
    {
LABEL_147:
      objc_msgSend(getEAGLContextClass(), "setCurrentContext:", v100);
      _SKUIOffscreenRenderOperationPushRenderingContext(v5, v7);

LABEL_148:
      v93 = CACurrentMediaTime();
      NSLog(CFSTR("[SKUIOffscreenRenderOperation] Offscreen render operation took %f seconds"), v93 - v3);

      return;
    }
    if (CGRectIsNull(v107))
    {
      objc_msgSend(v101, "bounds");
      v107.origin.x = v9;
      v107.origin.y = v10;
      v107.size.width = v11;
      v107.size.height = v12;
    }
    objc_msgSend(v101, "contentsScale");
    v14 = v13;
    objc_msgSend(v101, "rasterizationScale");
    v16 = v15;
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setContentsScale:", v14);
    objc_msgSend(v99, "addSublayer:", v101);
    objc_msgSend(v99, "convertRect:fromLayer:", v101, *(_OWORD *)&v107.origin, *(_OWORD *)&v107.size);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    memset(&v106, 0, sizeof(v106));
    CATransform3DMakeScale(&v106, 1.0, -1.0, 1.0);
    v105 = v106;
    objc_msgSend(v99, "setTransform:", &v105);
    objc_msgSend(v5, "setLayer:", v99);
    objc_msgSend(v5, "setBounds:", v18, v20, v22, v24);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
    if ((-[SKUIOffscreenRenderOperation isCancelled](self, "isCancelled") & 1) != 0)
    {
LABEL_146:

      goto LABEL_147;
    }
    v105.m11 = 0.0;
    *(_QWORD *)&v105.m12 = &v105;
    *(_QWORD *)&v105.m13 = 0x2020000000;
    v25 = (id *)getkIOSurfaceWidthSymbolLoc_ptr;
    *(_QWORD *)&v105.m14 = getkIOSurfaceWidthSymbolLoc_ptr;
    if (!getkIOSurfaceWidthSymbolLoc_ptr)
    {
      v26 = (void *)IOSurfaceLibrary();
      v25 = (id *)dlsym(v26, "kIOSurfaceWidth");
      *(_QWORD *)(*(_QWORD *)&v105.m12 + 24) = v25;
      getkIOSurfaceWidthSymbolLoc_ptr = (uint64_t)v25;
    }
    _Block_object_dispose(&v105, 8);
    if (!v25)
      goto LABEL_150;
    v95 = *v25;
    v111[0] = v95;
    v113.origin.x = v18;
    v113.origin.y = v20;
    v113.size.width = v22;
    v113.size.height = v24;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 * CGRectGetWidth(v113));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v112[0] = v97;
    v105.m11 = 0.0;
    *(_QWORD *)&v105.m12 = &v105;
    *(_QWORD *)&v105.m13 = 0x2020000000;
    v27 = (id *)getkIOSurfaceHeightSymbolLoc_ptr;
    *(_QWORD *)&v105.m14 = getkIOSurfaceHeightSymbolLoc_ptr;
    if (!getkIOSurfaceHeightSymbolLoc_ptr)
    {
      v28 = (void *)IOSurfaceLibrary();
      v27 = (id *)dlsym(v28, "kIOSurfaceHeight");
      *(_QWORD *)(*(_QWORD *)&v105.m12 + 24) = v27;
      getkIOSurfaceHeightSymbolLoc_ptr = (uint64_t)v27;
    }
    _Block_object_dispose(&v105, 8);
    if (!v27)
      goto LABEL_150;
    v29 = *v27;
    v111[1] = v29;
    v114.origin.x = v18;
    v114.origin.y = v20;
    v114.size.width = v22;
    v114.size.height = v24;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 * CGRectGetHeight(v114));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v112[1] = v30;
    v105.m11 = 0.0;
    *(_QWORD *)&v105.m12 = &v105;
    *(_QWORD *)&v105.m13 = 0x2020000000;
    v31 = (id *)getkIOSurfaceBytesPerElementSymbolLoc_ptr;
    *(_QWORD *)&v105.m14 = getkIOSurfaceBytesPerElementSymbolLoc_ptr;
    if (!getkIOSurfaceBytesPerElementSymbolLoc_ptr)
    {
      v32 = (void *)IOSurfaceLibrary();
      v31 = (id *)dlsym(v32, "kIOSurfaceBytesPerElement");
      *(_QWORD *)(*(_QWORD *)&v105.m12 + 24) = v31;
      getkIOSurfaceBytesPerElementSymbolLoc_ptr = (uint64_t)v31;
    }
    _Block_object_dispose(&v105, 8);
    if (!v31)
      goto LABEL_150;
    v33 = *v31;
    v111[2] = v33;
    v112[2] = &unk_1E749B630;
    v105.m11 = 0.0;
    *(_QWORD *)&v105.m12 = &v105;
    *(_QWORD *)&v105.m13 = 0x2020000000;
    v34 = (id *)getkIOSurfacePixelFormatSymbolLoc_ptr;
    *(_QWORD *)&v105.m14 = getkIOSurfacePixelFormatSymbolLoc_ptr;
    if (!getkIOSurfacePixelFormatSymbolLoc_ptr)
    {
      v35 = (void *)IOSurfaceLibrary();
      v34 = (id *)dlsym(v35, "kIOSurfacePixelFormat");
      *(_QWORD *)(*(_QWORD *)&v105.m12 + 24) = v34;
      getkIOSurfacePixelFormatSymbolLoc_ptr = (uint64_t)v34;
    }
    _Block_object_dispose(&v105, 8);
    if (!v34)
      goto LABEL_150;
    v36 = *v34;
    v111[3] = v36;
    v112[3] = &unk_1E749B648;
    v105.m11 = 0.0;
    *(_QWORD *)&v105.m12 = &v105;
    *(_QWORD *)&v105.m13 = 0x2020000000;
    v37 = (id *)getkIOSurfaceIsGlobalSymbolLoc_ptr;
    *(_QWORD *)&v105.m14 = getkIOSurfaceIsGlobalSymbolLoc_ptr;
    if (!getkIOSurfaceIsGlobalSymbolLoc_ptr)
    {
      v38 = (void *)IOSurfaceLibrary();
      v37 = (id *)dlsym(v38, "kIOSurfaceIsGlobal");
      *(_QWORD *)(*(_QWORD *)&v105.m12 + 24) = v37;
      getkIOSurfaceIsGlobalSymbolLoc_ptr = (uint64_t)v37;
    }
    _Block_object_dispose(&v105, 8);
    if (!v37)
      goto LABEL_150;
    v39 = *v37;
    v111[4] = v39;
    v112[4] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 5);
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    v105.m11 = 0.0;
    *(_QWORD *)&v105.m12 = &v105;
    *(_QWORD *)&v105.m13 = 0x2020000000;
    v40 = getIOSurfaceCreateSymbolLoc_ptr;
    *(_QWORD *)&v105.m14 = getIOSurfaceCreateSymbolLoc_ptr;
    if (!getIOSurfaceCreateSymbolLoc_ptr)
    {
      v41 = (void *)IOSurfaceLibrary();
      v40 = dlsym(v41, "IOSurfaceCreate");
      *(_QWORD *)(*(_QWORD *)&v105.m12 + 24) = v40;
      getIOSurfaceCreateSymbolLoc_ptr = v40;
    }
    _Block_object_dispose(&v105, 8);
    if (!v40)
      goto LABEL_150;
    v42 = (const void *)((uint64_t (*)(void *))v40)(v96);
    if (!v42)
    {
LABEL_138:
      Error = _SKUIglGetError();
      v92 = "invalid operation";
      switch((int)Error)
      {
        case 1280:
          v92 = "invalid enum";
          goto LABEL_144;
        case 1281:
          v92 = "invalid value";
          goto LABEL_144;
        case 1282:
          goto LABEL_144;
        case 1283:
        case 1284:
          goto LABEL_141;
        case 1285:
          v92 = "out of memory";
          goto LABEL_144;
        default:
          if ((_DWORD)Error)
          {
LABEL_141:
            v92 = "unknown error";
LABEL_144:
            NSLog(CFSTR("[SKUIOffscreenRenderOperation] %s:%d glError %x (%s)"), "-[SKUIOffscreenRenderOperation main]", 168, Error, v92);
          }

          break;
      }
      goto LABEL_146;
    }
    v104 = 0;
    v98 = v7;
    HIDWORD(v110) = 0;
    v105.m11 = 0.0;
    *(_QWORD *)&v105.m12 = &v105;
    *(_QWORD *)&v105.m13 = 0x2020000000;
    v43 = getglGenTexturesSymbolLoc_ptr;
    *(_QWORD *)&v105.m14 = getglGenTexturesSymbolLoc_ptr;
    if (!getglGenTexturesSymbolLoc_ptr)
    {
      v44 = (void *)OpenGLESLibrary();
      v43 = dlsym(v44, "glGenTextures");
      *(_QWORD *)(*(_QWORD *)&v105.m12 + 24) = v43;
      getglGenTexturesSymbolLoc_ptr = v43;
    }
    _Block_object_dispose(&v105, 8);
    if (v43)
    {
      ((void (*)(uint64_t, char *))v43)(1, (char *)&v110 + 4);
      v45 = _SKUIglGetError();
      v46 = "invalid operation";
      switch((int)v45)
      {
        case 1280:
          v46 = "invalid enum";
          goto LABEL_37;
        case 1281:
          v46 = "invalid value";
          goto LABEL_37;
        case 1282:
          goto LABEL_37;
        case 1283:
        case 1284:
          goto LABEL_34;
        case 1285:
          v46 = "out of memory";
          goto LABEL_37;
        default:
          if ((_DWORD)v45)
          {
LABEL_34:
            v46 = "unknown error";
LABEL_37:
            NSLog(CFSTR("[SKUIOffscreenRenderOperation] %s:%d glError %x (%s)"), "_SKUIOffscreenRenderOperationBindSurfaceToFramebuffer", 248, v45, v46);
          }
          _SKUIglBindTexture(HIDWORD(v110));
          v47 = _SKUIglGetError();
          v48 = "invalid operation";
          switch((int)v47)
          {
            case 1280:
              v48 = "invalid enum";
              goto LABEL_44;
            case 1281:
              v48 = "invalid value";
              goto LABEL_44;
            case 1282:
              goto LABEL_44;
            case 1283:
            case 1284:
              goto LABEL_41;
            case 1285:
              v48 = "out of memory";
              goto LABEL_44;
            default:
              if ((_DWORD)v47)
              {
LABEL_41:
                v48 = "unknown error";
LABEL_44:
                NSLog(CFSTR("[SKUIOffscreenRenderOperation] %s:%d glError %x (%s)"), "_SKUIOffscreenRenderOperationBindSurfaceToFramebuffer", 252, v47, v48);
              }
              v105.m11 = 0.0;
              *(_QWORD *)&v105.m12 = &v105;
              *(_QWORD *)&v105.m13 = 0x2020000000;
              v49 = getIOSurfaceGetWidthSymbolLoc_ptr;
              *(_QWORD *)&v105.m14 = getIOSurfaceGetWidthSymbolLoc_ptr;
              if (!getIOSurfaceGetWidthSymbolLoc_ptr)
              {
                v50 = (void *)IOSurfaceLibrary();
                v49 = dlsym(v50, "IOSurfaceGetWidth");
                *(_QWORD *)(*(_QWORD *)&v105.m12 + 24) = v49;
                getIOSurfaceGetWidthSymbolLoc_ptr = v49;
              }
              _Block_object_dispose(&v105, 8);
              if (!v49)
                goto LABEL_150;
              v51 = ((uint64_t (*)(const void *))v49)(v42);
              v105.m11 = 0.0;
              *(_QWORD *)&v105.m12 = &v105;
              *(_QWORD *)&v105.m13 = 0x2020000000;
              v52 = getIOSurfaceGetHeightSymbolLoc_ptr;
              *(_QWORD *)&v105.m14 = getIOSurfaceGetHeightSymbolLoc_ptr;
              if (!getIOSurfaceGetHeightSymbolLoc_ptr)
              {
                v53 = (void *)IOSurfaceLibrary();
                v52 = dlsym(v53, "IOSurfaceGetHeight");
                *(_QWORD *)(*(_QWORD *)&v105.m12 + 24) = v52;
                getIOSurfaceGetHeightSymbolLoc_ptr = v52;
              }
              _Block_object_dispose(&v105, 8);
              if (!v52)
                goto LABEL_150;
              v54 = ((uint64_t (*)(const void *))v52)(v42);
              BYTE4(v94) = 0;
              LODWORD(v94) = 0;
              objc_msgSend(v98, "texImageIOSurface:target:internalFormat:width:height:format:type:plane:invert:", v42, 3553, 6408, v51, v54, 32993, 33639, v94);
              v55 = _SKUIglGetError();
              v56 = "invalid operation";
              switch((int)v55)
              {
                case 1280:
                  v56 = "invalid enum";
                  goto LABEL_57;
                case 1281:
                  v56 = "invalid value";
                  goto LABEL_57;
                case 1282:
                  goto LABEL_57;
                case 1283:
                case 1284:
                  goto LABEL_54;
                case 1285:
                  v56 = "out of memory";
                  goto LABEL_57;
                default:
                  if ((_DWORD)v55)
                  {
LABEL_54:
                    v56 = "unknown error";
LABEL_57:
                    NSLog(CFSTR("[SKUIOffscreenRenderOperation] %s:%d glError %x (%s)"), "_SKUIOffscreenRenderOperationBindSurfaceToFramebuffer", 257, v55, v56);
                  }
                  _SKUIglTexParameteri(10241, 9728);
                  _SKUIglTexParameteri(10240, 9728);
                  _SKUIglTexParameteri(10242, 33071);
                  _SKUIglTexParameteri(10243, 33071);
                  v57 = _SKUIglGetError();
                  v58 = "invalid operation";
                  switch((int)v57)
                  {
                    case 1280:
                      v58 = "invalid enum";
                      goto LABEL_64;
                    case 1281:
                      v58 = "invalid value";
                      goto LABEL_64;
                    case 1282:
                      goto LABEL_64;
                    case 1283:
                    case 1284:
                      goto LABEL_61;
                    case 1285:
                      v58 = "out of memory";
                      goto LABEL_64;
                    default:
                      if ((_DWORD)v57)
                      {
LABEL_61:
                        v58 = "unknown error";
LABEL_64:
                        NSLog(CFSTR("[SKUIOffscreenRenderOperation] %s:%d glError %x (%s)"), "_SKUIOffscreenRenderOperationBindSurfaceToFramebuffer", 263, v57, v58);
                      }
                      _SKUIglBindTexture(0);
                      v59 = _SKUIglGetError();
                      v60 = "invalid operation";
                      switch((int)v59)
                      {
                        case 1280:
                          v60 = "invalid enum";
                          goto LABEL_71;
                        case 1281:
                          v60 = "invalid value";
                          goto LABEL_71;
                        case 1282:
                          goto LABEL_71;
                        case 1283:
                        case 1284:
                          goto LABEL_68;
                        case 1285:
                          v60 = "out of memory";
                          goto LABEL_71;
                        default:
                          if ((_DWORD)v59)
                          {
LABEL_68:
                            v60 = "unknown error";
LABEL_71:
                            NSLog(CFSTR("[SKUIOffscreenRenderOperation] %s:%d glError %x (%s)"), "_SKUIOffscreenRenderOperationBindSurfaceToFramebuffer", 266, v59, v60);
                          }
                          LODWORD(v110) = 0;
                          v105.m11 = 0.0;
                          *(_QWORD *)&v105.m12 = &v105;
                          *(_QWORD *)&v105.m13 = 0x2020000000;
                          v61 = getglGenFramebuffersSymbolLoc_ptr;
                          *(_QWORD *)&v105.m14 = getglGenFramebuffersSymbolLoc_ptr;
                          if (!getglGenFramebuffersSymbolLoc_ptr)
                          {
                            v62 = (void *)OpenGLESLibrary();
                            v61 = dlsym(v62, "glGenFramebuffers");
                            *(_QWORD *)(*(_QWORD *)&v105.m12 + 24) = v61;
                            getglGenFramebuffersSymbolLoc_ptr = v61;
                          }
                          _Block_object_dispose(&v105, 8);
                          if (!v61)
                            goto LABEL_150;
                          ((void (*)(uint64_t, uint64_t *))v61)(1, &v110);
                          _SKUIglBindFramebuffer(v110);
                          v63 = HIDWORD(v110);
                          v105.m11 = 0.0;
                          *(_QWORD *)&v105.m12 = &v105;
                          *(_QWORD *)&v105.m13 = 0x2020000000;
                          v64 = getglFramebufferTexture2DSymbolLoc_ptr;
                          *(_QWORD *)&v105.m14 = getglFramebufferTexture2DSymbolLoc_ptr;
                          if (!getglFramebufferTexture2DSymbolLoc_ptr)
                          {
                            v65 = (void *)OpenGLESLibrary();
                            v64 = dlsym(v65, "glFramebufferTexture2D");
                            *(_QWORD *)(*(_QWORD *)&v105.m12 + 24) = v64;
                            getglFramebufferTexture2DSymbolLoc_ptr = v64;
                          }
                          _Block_object_dispose(&v105, 8);
                          if (!v64)
                            goto LABEL_150;
                          ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))v64)(36160, 36064, 3553, v63, 0);
                          v66 = _SKUIglGetError();
                          v67 = "invalid operation";
                          switch((int)v66)
                          {
                            case 1280:
                              v67 = "invalid enum";
                              goto LABEL_84;
                            case 1281:
                              v67 = "invalid value";
                              goto LABEL_84;
                            case 1282:
                              goto LABEL_84;
                            case 1283:
                            case 1284:
                              goto LABEL_81;
                            case 1285:
                              v67 = "out of memory";
                              goto LABEL_84;
                            default:
                              if ((_DWORD)v66)
                              {
LABEL_81:
                                v67 = "unknown error";
LABEL_84:
                                NSLog(CFSTR("[SKUIOffscreenRenderOperation] %s:%d glError %x (%s)"), "_SKUIOffscreenRenderOperationBindSurfaceToFramebuffer", 273, v66, v67);
                              }
                              v105.m11 = 0.0;
                              *(_QWORD *)&v105.m12 = &v105;
                              *(_QWORD *)&v105.m13 = 0x2020000000;
                              v68 = getglViewportSymbolLoc_ptr;
                              *(_QWORD *)&v105.m14 = getglViewportSymbolLoc_ptr;
                              if (!getglViewportSymbolLoc_ptr)
                              {
                                v69 = (void *)OpenGLESLibrary();
                                v68 = dlsym(v69, "glViewport");
                                *(_QWORD *)(*(_QWORD *)&v105.m12 + 24) = v68;
                                getglViewportSymbolLoc_ptr = v68;
                              }
                              _Block_object_dispose(&v105, 8);
                              if (!v68)
                                goto LABEL_150;
                              ((void (*)(_QWORD, _QWORD, uint64_t, uint64_t))v68)(0, 0, v51, v54);
                              v70 = _SKUIglGetError();
                              v71 = "invalid operation";
                              switch((int)v70)
                              {
                                case 1280:
                                  v71 = "invalid enum";
                                  goto LABEL_94;
                                case 1281:
                                  v71 = "invalid value";
                                  goto LABEL_94;
                                case 1282:
                                  goto LABEL_94;
                                case 1283:
                                case 1284:
                                  goto LABEL_91;
                                case 1285:
                                  v71 = "out of memory";
                                  goto LABEL_94;
                                default:
                                  if ((_DWORD)v70)
                                  {
LABEL_91:
                                    v71 = "unknown error";
LABEL_94:
                                    NSLog(CFSTR("[SKUIOffscreenRenderOperation] %s:%d glError %x (%s)"), "_SKUIOffscreenRenderOperationBindSurfaceToFramebuffer", 276, v70, v71);
                                  }
                                  v104 = v110;

                                  v105.m11 = 0.0;
                                  *(_QWORD *)&v105.m12 = &v105;
                                  *(_QWORD *)&v105.m13 = 0x2020000000;
                                  v72 = getglClearColorSymbolLoc_ptr;
                                  *(_QWORD *)&v105.m14 = getglClearColorSymbolLoc_ptr;
                                  if (!getglClearColorSymbolLoc_ptr)
                                  {
                                    v73 = (void *)OpenGLESLibrary();
                                    v72 = dlsym(v73, "glClearColor");
                                    *(_QWORD *)(*(_QWORD *)&v105.m12 + 24) = v72;
                                    getglClearColorSymbolLoc_ptr = v72;
                                  }
                                  _Block_object_dispose(&v105, 8);
                                  if (!v72)
                                    goto LABEL_150;
                                  ((void (*)(float, float, float, float))v72)(0.0, 0.0, 0.0, 0.0);
                                  v105.m11 = 0.0;
                                  *(_QWORD *)&v105.m12 = &v105;
                                  *(_QWORD *)&v105.m13 = 0x2020000000;
                                  v74 = getglClearSymbolLoc_ptr;
                                  *(_QWORD *)&v105.m14 = getglClearSymbolLoc_ptr;
                                  if (!getglClearSymbolLoc_ptr)
                                  {
                                    v75 = (void *)OpenGLESLibrary();
                                    v74 = dlsym(v75, "glClear");
                                    *(_QWORD *)(*(_QWORD *)&v105.m12 + 24) = v74;
                                    getglClearSymbolLoc_ptr = v74;
                                  }
                                  _Block_object_dispose(&v105, 8);
                                  if (!v74)
                                    goto LABEL_150;
                                  ((void (*)(uint64_t))v74)(0x4000);
                                  objc_msgSend(v5, "beginFrameAtTime:timeStamp:", 0, 0.0);
                                  v76 = _SKUIglGetError();
                                  v77 = "invalid operation";
                                  switch((int)v76)
                                  {
                                    case 1280:
                                      v77 = "invalid enum";
                                      goto LABEL_107;
                                    case 1281:
                                      v77 = "invalid value";
                                      goto LABEL_107;
                                    case 1282:
                                      goto LABEL_107;
                                    case 1283:
                                    case 1284:
                                      goto LABEL_104;
                                    case 1285:
                                      v77 = "out of memory";
                                      goto LABEL_107;
                                    default:
                                      if ((_DWORD)v76)
                                      {
LABEL_104:
                                        v77 = "unknown error";
LABEL_107:
                                        NSLog(CFSTR("[SKUIOffscreenRenderOperation] %s:%d glError %x (%s)"), "-[SKUIOffscreenRenderOperation main]", 147, v76, v77);
                                      }
                                      objc_msgSend(v5, "render");
                                      v78 = _SKUIglGetError();
                                      v79 = "invalid operation";
                                      switch((int)v78)
                                      {
                                        case 1280:
                                          v79 = "invalid enum";
                                          goto LABEL_114;
                                        case 1281:
                                          v79 = "invalid value";
                                          goto LABEL_114;
                                        case 1282:
                                          goto LABEL_114;
                                        case 1283:
                                        case 1284:
                                          goto LABEL_111;
                                        case 1285:
                                          v79 = "out of memory";
                                          goto LABEL_114;
                                        default:
                                          if ((_DWORD)v78)
                                          {
LABEL_111:
                                            v79 = "unknown error";
LABEL_114:
                                            NSLog(CFSTR("[SKUIOffscreenRenderOperation] %s:%d glError %x (%s)"), "-[SKUIOffscreenRenderOperation main]", 149, v78, v79);
                                          }
                                          break;
                                      }
                                      break;
                                  }
                                  break;
                              }
                              break;
                          }
                          break;
                      }
                      break;
                  }
                  break;
              }
              break;
          }
          break;
      }
      objc_msgSend(v5, "endFrame");
      v80 = _SKUIglGetError();
      v81 = "invalid operation";
      switch((int)v80)
      {
        case 1280:
          v81 = "invalid enum";
          goto LABEL_121;
        case 1281:
          v81 = "invalid value";
          goto LABEL_121;
        case 1282:
          goto LABEL_121;
        case 1283:
        case 1284:
          goto LABEL_118;
        case 1285:
          v81 = "out of memory";
          goto LABEL_121;
        default:
          if ((_DWORD)v80)
          {
LABEL_118:
            v81 = "unknown error";
LABEL_121:
            NSLog(CFSTR("[SKUIOffscreenRenderOperation] %s:%d glError %x (%s)"), "-[SKUIOffscreenRenderOperation main]", 151, v80, v81);
          }
          objc_msgSend(v5, "setLayer:", 0);
          _SKUIglBindFramebuffer(0);
          v105.m11 = 0.0;
          *(_QWORD *)&v105.m12 = &v105;
          *(_QWORD *)&v105.m13 = 0x2020000000;
          v82 = getglDeleteFramebuffersSymbolLoc_ptr;
          *(_QWORD *)&v105.m14 = getglDeleteFramebuffersSymbolLoc_ptr;
          if (!getglDeleteFramebuffersSymbolLoc_ptr)
          {
            v83 = (void *)OpenGLESLibrary();
            v82 = dlsym(v83, "glDeleteFramebuffers");
            *(_QWORD *)(*(_QWORD *)&v105.m12 + 24) = v82;
            getglDeleteFramebuffersSymbolLoc_ptr = v82;
          }
          _Block_object_dispose(&v105, 8);
          if (!v82)
            goto LABEL_150;
          ((void (*)(uint64_t, uint64_t *))v82)(1, &v104);
          v105.m11 = 0.0;
          *(_QWORD *)&v105.m12 = &v105;
          *(_QWORD *)&v105.m13 = 0x2020000000;
          v84 = getglDeleteTexturesSymbolLoc_ptr;
          *(_QWORD *)&v105.m14 = getglDeleteTexturesSymbolLoc_ptr;
          if (!getglDeleteTexturesSymbolLoc_ptr)
          {
            v85 = (void *)OpenGLESLibrary();
            v84 = dlsym(v85, "glDeleteTextures");
            *(_QWORD *)(*(_QWORD *)&v105.m12 + 24) = v84;
            getglDeleteTexturesSymbolLoc_ptr = v84;
          }
          _Block_object_dispose(&v105, 8);
          if (v84)
          {
            ((void (*)(uint64_t, char *))v84)(1, (char *)&v104 + 4);
            v86 = _SKUIglGetError();
            v87 = "invalid operation";
            switch((int)v86)
            {
              case 1280:
                v87 = "invalid enum";
                goto LABEL_134;
              case 1281:
                v87 = "invalid value";
                goto LABEL_134;
              case 1282:
                goto LABEL_134;
              case 1283:
              case 1284:
                goto LABEL_131;
              case 1285:
                v87 = "out of memory";
                goto LABEL_134;
              default:
                if ((_DWORD)v86)
                {
LABEL_131:
                  v87 = "unknown error";
LABEL_134:
                  NSLog(CFSTR("[SKUIOffscreenRenderOperation] %s:%d glError %x (%s)"), "-[SKUIOffscreenRenderOperation main]", 158, v86, v87);
                }
                v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "_initWithIOSurface:scale:orientation:", v42, 0, v16);
                v89 = v88;
                if (v88)
                {
                  accessQueue = self->_accessQueue;
                  block[0] = MEMORY[0x1E0C809B0];
                  block[1] = 3221225472;
                  block[2] = __36__SKUIOffscreenRenderOperation_main__block_invoke;
                  block[3] = &unk_1E739FD10;
                  block[4] = self;
                  v103 = v88;
                  dispatch_barrier_async(accessQueue, block);

                }
                CFRelease(v42);

                break;
            }
            goto LABEL_138;
          }
          getCNComposeRecipientViewDidChangeNotification_cold_1();
          break;
      }
    }
    else
    {
LABEL_150:
      getCNComposeRecipientViewDidChangeNotification_cold_1();
    }
    __break(1u);
  }
}

void __36__SKUIOffscreenRenderOperation_main__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 264), *(id *)(a1 + 40));
}

- (id)createLayerBlock
{
  NSObject *accessQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *(*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__44;
  v10 = __Block_byref_object_dispose__44;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__SKUIOffscreenRenderOperation_createLayerBlock__block_invoke;
  v5[3] = &unk_1E73A0270;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__SKUIOffscreenRenderOperation_createLayerBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (UIImage)outputImage
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__15;
  v10 = __Block_byref_object_dispose__16;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__SKUIOffscreenRenderOperation_outputImage__block_invoke;
  v5[3] = &unk_1E73A0270;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (UIImage *)v3;
}

void __43__SKUIOffscreenRenderOperation_outputImage__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 264));
}

- (void)setCreateLayerBlock:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SKUIOffscreenRenderOperation_setCreateLayerBlock___block_invoke;
  v7[3] = &unk_1E73A1578;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

void __52__SKUIOffscreenRenderOperation_setCreateLayerBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 256);
  *(_QWORD *)(v3 + 256) = v2;

}

+ (void)preheatOffscreenRenderOperations
{
}

void __64__SKUIOffscreenRenderOperation_preheatOffscreenRenderOperations__block_invoke()
{
  void *v0;
  char v1;
  double v2;
  char v3;
  id v4;
  id v5;
  BOOL v6;
  unint64_t v7;
  void *v8;
  void *v9;
  CFTimeInterval v10;
  NSObject *v11;
  id v12;
  id v13;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  NSLog(CFSTR("[SKUIOffscreenRenderOperation] Starting preheat of %i rendering contexts..."), 2);
  v1 = 1;
  v2 = CACurrentMediaTime();
  do
  {
    v3 = v1;
    v12 = 0;
    v13 = 0;
    _SKUIOffscreenRenderOperationPopRenderingContext(&v13, &v12);
    v4 = v13;
    v5 = v12;
    if (v5)
      v6 = v4 == 0;
    else
      v6 = 1;
    if (!v6)
    {
      objc_msgSend(v0, "addObject:", v4);
      objc_msgSend(v0, "addObject:", v5);
    }

    v1 = 0;
  }
  while ((v3 & 1) != 0);
  if ((unint64_t)objc_msgSend(v0, "count") >= 2)
  {
    v7 = 1;
    do
    {
      objc_msgSend(v0, "objectAtIndex:", v7 - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _SKUIOffscreenRenderOperationPushRenderingContext(v8, v9);

      v7 += 2;
    }
    while (v7 < objc_msgSend(v0, "count"));
  }
  v10 = CACurrentMediaTime();
  NSLog(CFSTR("[SKUIOffscreenRenderOperation] Finished preheat of %i rendering contexts, took %f seconds."), 2, v10 - v2);
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v11, &__block_literal_global_22);

}

void __64__SKUIOffscreenRenderOperation_preheatOffscreenRenderOperations__block_invoke_2()
{
  double v0;
  CFTimeInterval v1;

  NSLog(CFSTR("[SKUIOffscreenRenderOperation] Starting preheat of dependent weak-linked libraries."));
  v0 = CACurrentMediaTime();
  IOSurfaceLibrary();
  OpenGLESLibrary();
  v1 = CACurrentMediaTime();
  NSLog(CFSTR("[SKUIOffscreenRenderOperation] Finished preheat of dependent weak-linked libraries, took %f seconds."), v1 - v0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputImage, 0);
  objc_storeStrong(&self->_createLayerBlock, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)init
{
}

@end
