@implementation WebAVPlayerLayer

- (WebAVPlayerLayer)init
{
  WebAVPlayerLayer *v2;
  WebAVPlayerLayer *v3;
  void *AVFoundation_AVLayerVideoGravityResizeAspect;
  void *v5;
  void *m_ptr;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  WebAVPlayerLayerPresentationModelClient *value;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WebAVPlayerLayer;
  v2 = -[WebAVPlayerLayer init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WebAVPlayerLayer setMasksToBounds:](v2, "setMasksToBounds:", 1);
    AVFoundation_AVLayerVideoGravityResizeAspect = (void *)PAL::get_AVFoundation_AVLayerVideoGravityResizeAspect((PAL *)-[WebAVPlayerLayer setAllowsHitTesting:](v3, "setAllowsHitTesting:", 0));
    v5 = AVFoundation_AVLayerVideoGravityResizeAspect;
    if (AVFoundation_AVLayerVideoGravityResizeAspect)
      CFRetain(AVFoundation_AVLayerVideoGravityResizeAspect);
    m_ptr = v3->_videoGravity.m_ptr;
    v3->_videoGravity.m_ptr = v5;
    if (m_ptr)
      CFRelease(m_ptr);
    v7 = (void *)PAL::get_AVFoundation_AVLayerVideoGravityResizeAspect((PAL *)m_ptr);
    v8 = v7;
    if (v7)
      CFRetain(v7);
    v9 = v3->_previousVideoGravity.m_ptr;
    v3->_previousVideoGravity.m_ptr = v8;
    if (v9)
      CFRelease(v9);
    -[WebAVPlayerLayer setName:](v3, "setName:", CFSTR("WebAVPlayerLayer"));
    v10 = WTF::fastMalloc((WTF *)0x20);
    *(_DWORD *)(v10 + 16) = 0;
    *(_QWORD *)v10 = off_1E3485950;
    *(_QWORD *)(v10 + 8) = 0;
    *(_QWORD *)(v10 + 24) = 0;
    objc_initWeak((id *)(v10 + 24), v3);
    value = v3->_presentationModelClient.__ptr_.__value_;
    v3->_presentationModelClient.__ptr_.__value_ = (WebAVPlayerLayerPresentationModelClient *)v10;
    if (value)
      (*(void (**)(WebAVPlayerLayerPresentationModelClient *))(*(_QWORD *)value + 8))(value);
  }
  return v3;
}

- (void)dealloc
{
  ThreadSafeWeakPtrControlBlock *m_ptr;
  VideoPresentationModel *m_objectOfCorrectType;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  int v14;
  uint64_t v15;
  objc_super v16;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_resolveBounds, 0);

  m_ptr = self->_presentationModel.m_controlBlock.m_ptr;
  if (!m_ptr)
    goto LABEL_31;
  m_objectOfCorrectType = self->_presentationModel.m_objectOfCorrectType;
  if (__ldaxr((unsigned __int8 *)m_ptr))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](m_ptr);
LABEL_6:
  if (*((_QWORD *)m_ptr + 3))
    ++*((_QWORD *)m_ptr + 1);
  else
    m_objectOfCorrectType = 0;
  v6 = __ldxr((unsigned __int8 *)m_ptr);
  if (v6 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)m_ptr))
    {
      if (!m_objectOfCorrectType)
        goto LABEL_31;
      goto LABEL_15;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
  if (!m_objectOfCorrectType)
    goto LABEL_31;
LABEL_15:
  (*(void (**)(VideoPresentationModel *, WebAVPlayerLayerPresentationModelClient *))(*(_QWORD *)m_objectOfCorrectType
                                                                                              + 24))(m_objectOfCorrectType, self->_presentationModelClient.__ptr_.__value_);
  v8 = *((_QWORD *)m_objectOfCorrectType + 1);
  if (__ldaxr((unsigned __int8 *)v8))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v8))
  {
    goto LABEL_19;
  }
  MEMORY[0x19AEA534C](v8);
LABEL_19:
  v10 = *(_QWORD *)(v8 + 8);
  v11 = v10 - 1;
  *(_QWORD *)(v8 + 8) = v10 - 1;
  if (v10 == 1)
  {
    v15 = *(_QWORD *)(v8 + 16);
    v12 = *(_QWORD *)(v8 + 24);
    *(_QWORD *)(v8 + 24) = 0;
    v13 = v15 != 0;
  }
  else
  {
    v12 = 0;
    v13 = 1;
  }
  v14 = __ldxr((unsigned __int8 *)v8);
  if (v14 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v8))
    {
      if (v11)
        goto LABEL_31;
      goto LABEL_27;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)v8);
  if (v11)
    goto LABEL_31;
LABEL_27:
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  if (!v13)
    WTF::fastFree((WTF *)v8, v7);
LABEL_31:
  v16.receiver = self;
  v16.super_class = (Class)WebAVPlayerLayer;
  -[WebAVPlayerLayer dealloc](&v16, sel_dealloc);
}

- (void)presentationModel
{
  ThreadSafeWeakPtrControlBlock *m_ptr;
  VideoPresentationModel *m_objectOfCorrectType;
  int v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  int v12;
  uint64_t v14;

  m_ptr = self->_presentationModel.m_controlBlock.m_ptr;
  if (!m_ptr)
    return 0;
  m_objectOfCorrectType = self->_presentationModel.m_objectOfCorrectType;
  if (__ldaxr((unsigned __int8 *)m_ptr))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
  {
    goto LABEL_7;
  }
  MEMORY[0x19AEA534C](m_ptr, a2);
LABEL_7:
  if (*((_QWORD *)m_ptr + 3))
    ++*((_QWORD *)m_ptr + 1);
  else
    m_objectOfCorrectType = 0;
  v5 = __ldxr((unsigned __int8 *)m_ptr);
  if (v5 != 1)
  {
    __clrex();
    goto LABEL_14;
  }
  if (__stlxr(0, (unsigned __int8 *)m_ptr))
LABEL_14:
    WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
  if (!m_objectOfCorrectType)
    return m_objectOfCorrectType;
  v6 = *((_QWORD *)m_objectOfCorrectType + 1);
  if (__ldaxr((unsigned __int8 *)v6))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v6))
  {
    goto LABEL_20;
  }
  MEMORY[0x19AEA534C](v6, a2);
LABEL_20:
  v8 = *(_QWORD *)(v6 + 8);
  v9 = v8 - 1;
  *(_QWORD *)(v6 + 8) = v8 - 1;
  if (v8 == 1)
  {
    v14 = *(_QWORD *)(v6 + 16);
    v10 = *(_QWORD *)(v6 + 24);
    *(_QWORD *)(v6 + 24) = 0;
    v11 = v14 != 0;
  }
  else
  {
    v10 = 0;
    v11 = 1;
  }
  v12 = __ldxr((unsigned __int8 *)v6);
  if (v12 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v6))
    {
      if (v9)
        return m_objectOfCorrectType;
      goto LABEL_28;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)v6);
  if (v9)
    return m_objectOfCorrectType;
LABEL_28:
  if (v10)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v10 + 8))(v10, a2);
  if (!v11)
    WTF::fastFree((WTF *)v6, (void *)a2);
  return m_objectOfCorrectType;
}

- (void)setPresentationModel:(void *)a3
{
  VideoPresentationModel *v3;
  uint64_t *p_presentationModel;
  ThreadSafeWeakPtrControlBlock *m_ptr;
  VideoPresentationModel *m_objectOfCorrectType;
  int v9;
  double v10;
  float v11;
  double v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  int v19;
  uint64_t v20;

  v3 = (VideoPresentationModel *)a3;
  p_presentationModel = (uint64_t *)&self->_presentationModel;
  m_ptr = self->_presentationModel.m_controlBlock.m_ptr;
  if (!m_ptr)
  {
    if (!a3)
      return;
    m_objectOfCorrectType = 0;
    goto LABEL_19;
  }
  m_objectOfCorrectType = self->_presentationModel.m_objectOfCorrectType;
  if (__ldaxr((unsigned __int8 *)m_ptr))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
  {
    goto LABEL_8;
  }
  MEMORY[0x19AEA534C](m_ptr, a2);
LABEL_8:
  if (*((_QWORD *)m_ptr + 3))
    ++*((_QWORD *)m_ptr + 1);
  else
    m_objectOfCorrectType = 0;
  v9 = __ldxr((unsigned __int8 *)m_ptr);
  if (v9 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)m_ptr))
      goto LABEL_16;
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
LABEL_16:
  if (m_objectOfCorrectType == v3)
    goto LABEL_23;
  if (m_objectOfCorrectType)
    (*(void (**)(VideoPresentationModel *, WebAVPlayerLayerPresentationModelClient *))(*(_QWORD *)m_objectOfCorrectType
                                                                                                + 24))(m_objectOfCorrectType, self->_presentationModelClient.__ptr_.__value_);
LABEL_19:
  WTF::ThreadSafeWeakPtr<WebCore::VideoPresentationModel>::operator=<WebCore::VideoPresentationModel>(p_presentationModel, v3);
  if (v3)
  {
    self->_logIdentifier = (const void *)(*(uint64_t (**)(VideoPresentationModel *))(*(_QWORD *)v3 + 264))(v3);
    (*(void (**)(VideoPresentationModel *, WebAVPlayerLayerPresentationModelClient *))(*(_QWORD *)v3 + 16))(v3, self->_presentationModelClient.__ptr_.__value_);
    v10 = (*(float (**)(VideoPresentationModel *))(*(_QWORD *)v3 + 72))(v3);
    v12 = v11;
  }
  else
  {
    self->_logIdentifier = 0;
    v10 = *MEMORY[0x1E0C9D820];
    v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  -[WebAVPlayerLayer setVideoDimensions:](self, "setVideoDimensions:", v10, v12);
  v3 = m_objectOfCorrectType;
LABEL_23:
  if (!v3)
    return;
  v13 = *((_QWORD *)v3 + 1);
  if (__ldaxr((unsigned __int8 *)v13))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v13))
  {
    goto LABEL_28;
  }
  MEMORY[0x19AEA534C](v13);
LABEL_28:
  v15 = *(_QWORD *)(v13 + 8);
  v16 = v15 - 1;
  *(_QWORD *)(v13 + 8) = v15 - 1;
  if (v15 == 1)
  {
    v20 = *(_QWORD *)(v13 + 16);
    v17 = *(_QWORD *)(v13 + 24);
    *(_QWORD *)(v13 + 24) = 0;
    v18 = v20 != 0;
  }
  else
  {
    v17 = 0;
    v18 = 1;
  }
  v19 = __ldxr((unsigned __int8 *)v13);
  if (v19 != 1)
  {
    __clrex();
LABEL_35:
    WTF::Lock::unlockSlow((WTF::Lock *)v13);
    if (v16)
      return;
    goto LABEL_36;
  }
  if (__stlxr(0, (unsigned __int8 *)v13))
    goto LABEL_35;
  if (v16)
    return;
LABEL_36:
  if (v17)
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
  if (!v18)
    WTF::fastFree((WTF *)v13, (void *)a2);
}

- (AVPlayerController)playerController
{
  return (AVPlayerController *)self->_playerController.m_ptr;
}

- (void)setPlayerController:(id)a3
{
  void *m_ptr;

  if (a3)
    CFRetain(a3);
  m_ptr = self->_playerController.m_ptr;
  self->_playerController.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (void)setVideoSublayer:(id)a3
{
  void *m_ptr;

  if (a3)
    CFRetain(a3);
  m_ptr = self->_videoSublayer.m_ptr;
  self->_videoSublayer.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (CALayer)videoSublayer
{
  return (CALayer *)self->_videoSublayer.m_ptr;
}

- (void)setCaptionsLayer:(id)a3
{
  void *m_ptr;
  void *v6;

  m_ptr = self->_captionsLayer.m_ptr;
  if (m_ptr)
    objc_msgSend(m_ptr, "removeFromSuperlayer");
  if (a3)
    CFRetain(a3);
  v6 = self->_captionsLayer.m_ptr;
  self->_captionsLayer.m_ptr = a3;
  if (!v6)
  {
    if (!a3)
      return;
    goto LABEL_7;
  }
  CFRelease(v6);
  a3 = self->_captionsLayer.m_ptr;
  if (a3)
  {
LABEL_7:
    -[WebAVPlayerLayer addSublayer:](self, "addSublayer:", a3);
    -[WebAVPlayerLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CALayer)captionsLayer
{
  return (CALayer *)self->_captionsLayer.m_ptr;
}

- (CGSize)videoDimensions
{
  double width;
  double height;
  CGSize result;

  width = self->_videoDimensions.width;
  height = self->_videoDimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setVideoDimensions:(CGSize)a3
{
  double height;
  double width;
  CGSize *p_videoDimensions;
  _BYTE *v8;
  $F9635BD25436628440684A9CD771B596 *v9;
  float v10;
  float v11;
  _DWORD v12[2];
  _QWORD v13[4];

  height = a3.height;
  width = a3.width;
  p_videoDimensions = &self->_videoDimensions;
  if (self->_videoDimensions.width != a3.width || self->_videoDimensions.height != a3.height)
  {
    if (-[WebAVPlayerLayer loggerPtr](self, "loggerPtr") && -[WebAVPlayerLayer logChannel](self, "logChannel"))
    {
      v8 = -[WebAVPlayerLayer loggerPtr](self, "loggerPtr");
      v9 = -[WebAVPlayerLayer logChannel](self, "logChannel");
      v13[0] = 0;
      v13[1] = 0;
      v13[2] = "-[WebAVPlayerLayer setVideoDimensions:]";
      v13[3] = -[WebAVPlayerLayer logIdentifier](self, "logIdentifier");
      v10 = width;
      v11 = height;
      *(float *)v12 = v10;
      *(float *)&v12[1] = v11;
      if (v8[12])
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier,WebCore::FloatSize>((uint64_t)v9, 0, (WTF::Logger::LogSiteIdentifier *)v13, (WebCore::FloatSize *)v12);
    }
    p_videoDimensions->width = width;
    p_videoDimensions->height = height;
    -[WebAVPlayerLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (FloatRect)calculateTargetVideoFrame
{
  double v3;
  double v4;
  PAL *v5;
  double v6;
  double v7;
  PAL *v8;
  int v9;
  float v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  PAL *v17;
  double v18;
  double v19;
  float v20;
  int v21;
  double v22;
  double v23;
  float v24;
  double v25;
  int v26;
  double v27;
  int v28;
  double v29;
  int v30;
  double v31;
  int v32;
  int v33;
  unsigned int v34;
  int v35;
  unsigned int v36;
  BOOL v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  float v43;
  float v44;
  float v45;
  float v46;
  FloatRect result;

  -[WebAVPlayerLayer videoDimensions](self, "videoDimensions");
  v4 = v3;
  v5 = (PAL *)-[WebAVPlayerLayer videoDimensions](self, "videoDimensions");
  v7 = v6;
  v8 = (PAL *)objc_msgSend((id)PAL::get_AVFoundation_AVLayerVideoGravityResize(v5), "isEqualToString:", -[WebAVPlayerLayer videoGravity](self, "videoGravity"));
  if ((_DWORD)v8)
  {
    -[WebAVPlayerLayer bounds](self, "bounds");
    v10 = v15;
    v11 = v13;
    *(float *)&v13 = v12;
    *(float *)&v15 = v14;
    goto LABEL_9;
  }
  v16 = v4 / v7;
  v17 = (PAL *)objc_msgSend((id)PAL::get_AVFoundation_AVLayerVideoGravityResizeAspect(v8), "isEqualToString:", -[WebAVPlayerLayer videoGravity](self, "videoGravity"));
  if ((_DWORD)v17)
  {
    -[WebAVPlayerLayer bounds](self, "bounds");
    v10 = v15;
    v11 = v13;
    *(float *)&v13 = v18;
    *(float *)&v15 = v19;
    if ((float)(*(float *)&v13 / *(float *)&v15) < v16)
    {
LABEL_5:
      v20 = (float)((float)(*(float *)&v13 / v16) - *(float *)&v15) * 0.5;
      v11 = v11 - v20;
      *(float *)&v15 = v20 + (float)(v20 + *(float *)&v15);
      goto LABEL_9;
    }
  }
  else
  {
    v21 = objc_msgSend((id)PAL::get_AVFoundation_AVLayerVideoGravityResizeAspectFill(v17), "isEqualToString:", -[WebAVPlayerLayer videoGravity](self, "videoGravity"));
    LODWORD(v15) = 0;
    LODWORD(v13) = 0;
    v11 = 0.0;
    v10 = 0.0;
    if (!v21)
      goto LABEL_9;
    -[WebAVPlayerLayer bounds](self, "bounds", v15, v13);
    v10 = v15;
    v11 = v13;
    *(float *)&v13 = v22;
    *(float *)&v15 = v23;
    if ((float)(*(float *)&v13 / *(float *)&v15) > v16)
      goto LABEL_5;
  }
  v24 = (float)-(float)(*(float *)&v13 - (float)(*(float *)&v15 * v16)) * 0.5;
  v10 = v10 - v24;
  *(float *)&v13 = v24 + (float)(v24 + *(float *)&v13);
LABEL_9:
  v25 = v10 * 64.0;
  if (v25 >= 2147483650.0)
  {
    v26 = 0x7FFFFFFF;
  }
  else if (v25 <= -2147483650.0)
  {
    v26 = 0x80000000;
  }
  else
  {
    v26 = (int)v25;
  }
  v27 = v11 * 64.0;
  if (v27 >= 2147483650.0)
  {
    v28 = 0x7FFFFFFF;
  }
  else if (v27 <= -2147483650.0)
  {
    v28 = 0x80000000;
  }
  else
  {
    v28 = (int)v27;
  }
  v29 = *(float *)&v13 * 64.0;
  if (v29 >= 2147483650.0)
  {
    v30 = 0x7FFFFFFF;
  }
  else if (v29 <= -2147483650.0)
  {
    v30 = 0x80000000;
  }
  else
  {
    v30 = (int)v29;
  }
  v31 = *(float *)&v15 * 64.0;
  if (v31 >= 2147483650.0)
  {
    v32 = 0x7FFFFFFF;
  }
  else if (v31 <= -2147483650.0)
  {
    v32 = 0x80000000;
  }
  else
  {
    v32 = (int)v31;
  }
  v33 = v26 / 64;
  v34 = v26 - (v9 & 0xFFFFFFC0);
  v35 = v28 / 64;
  v36 = v28 - (v9 & 0xFFFFFFC0);
  v37 = __OFADD__(v34, v30);
  v38 = v34 + v30;
  if (v37)
    v38 = (v34 >> 31) + 0x7FFFFFFF;
  v37 = __OFADD__(v36, v32);
  v39 = v36 + v32;
  v40 = (v36 >> 31) + 0x7FFFFFFF;
  if (!v37)
    v40 = v39;
  v41 = v36 + 32;
  v42 = v34 + 32;
  v43 = (float)(v33 + (v42 >> 6));
  v44 = (float)(v35 + (v41 >> 6));
  v45 = (float)(v38 / 64 - (v42 >> 6) + ((int)(v38 - (v33 & 0xFFFFFFC0) + 32) >> 6));
  v46 = (float)(v40 / 64 - (v41 >> 6) + ((int)(v40 - (v38 & 0xFFFFFFC0) + 32) >> 6));
  result.m_size.m_height = v46;
  result.m_size.m_width = v45;
  result.m_location.m_y = v44;
  result.m_location.m_x = v43;
  return result;
}

- (void)layoutSublayers
{
  _BYTE *v3;
  $F9635BD25436628440684A9CD771B596 *v4;
  double v5;
  double v6;
  double v7;
  WTF::String *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  float v14;
  float v15;
  float v16;
  FloatRect *p_targetVideoFrame;
  float v18;
  float v19;
  float v20;
  float v21;
  double v22;
  float v23;
  double v24;
  float v25;
  double v26;
  float v27;
  double v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  BOOL v34;
  float v35;
  float v36;
  ThreadSafeWeakPtrControlBlock *m_ptr;
  VideoPresentationModel *m_objectOfCorrectType;
  _BYTE *v40;
  $F9635BD25436628440684A9CD771B596 *v41;
  int v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  uint64_t v52;
  unint64_t v53;
  float v54;
  float v55;
  uint64_t v56;
  unint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  int v65;
  double v66;
  double v67;
  PAL *v68;
  double v69;
  double v70;
  PAL *v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  void *v81;
  _BYTE *v82;
  $F9635BD25436628440684A9CD771B596 *v83;
  void *v84;
  _BYTE *v85;
  $F9635BD25436628440684A9CD771B596 *v86;
  _DWORD *v87;
  WTF::StringImpl *v88;
  WTF::StringImpl *v89;
  WTF::StringImpl *v90;
  WTF::StringImpl *v91;
  WTF::StringImpl *v92;
  NSObject *var4;
  uint64_t v94;
  void *v95;
  char *v96;
  unsigned __int8 *v97;
  int v98;
  int v99;
  double v100;
  double v101;
  double v102;
  double v103;
  float v104;
  float m_width;
  float m_height;
  float v107;
  float v108;
  float v109;
  _BYTE *v110;
  $F9635BD25436628440684A9CD771B596 *v111;
  _DWORD *v112;
  WTF::StringImpl *v113;
  WTF::StringImpl *v114;
  WTF::StringImpl *v115;
  WTF::StringImpl *v116;
  WTF::StringImpl *v117;
  NSObject *v118;
  uint64_t v119;
  char *v120;
  int v121;
  int v122;
  void *v123;
  void *v124;
  double MidX;
  _BYTE *v126;
  $F9635BD25436628440684A9CD771B596 *v127;
  double v128;
  double v129;
  double v130;
  double v131;
  _DWORD *v132;
  _DWORD *v133;
  WTF::String *v134;
  WTF::String *v135;
  WTF::StringImpl *v136;
  WTF::StringImpl *v137;
  WTF::StringImpl *v138;
  WTF::StringImpl *v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;
  int v145;
  int v146;
  int v147;
  WTF::StringImpl *v148;
  WTF::StringImpl *v149;
  int v150;
  int v151;
  BOOL v152;
  int v153;
  BOOL v154;
  int v155;
  BOOL v156;
  int v157;
  BOOL v158;
  int v159;
  BOOL v160;
  int v161;
  BOOL v162;
  int v163;
  BOOL v164;
  int v165;
  BOOL v166;
  int v167;
  BOOL v168;
  unsigned int v169;
  uint64_t v170;
  uint64_t v171;
  WTF::StringImpl *v172;
  char *v173;
  WTF::Logger *v174;
  char *v175;
  uint64_t v176;
  WTF::StringImpl *v177;
  $F9635BD25436628440684A9CD771B596 *v178;
  WTF::StringImpl *v179;
  WTF::StringImpl *v180;
  WTF::StringImpl *v181;
  WTF::StringImpl *v182;
  WTF::StringImpl *v183;
  WTF::StringImpl *v184;
  WTF::StringImpl *v185;
  WTF::StringImpl *v186;
  WTF::StringImpl *v187;
  NSObject *v188;
  uint64_t v189;
  void *v190;
  char *v191;
  unsigned __int8 *v192;
  int v193;
  int v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t *v197;
  uint64_t v198;
  WTF::StringImpl *v199;
  WTF::StringImpl *v200;
  WTF::String *v201;
  WTF::String *v202;
  WTF::Logger *v203;
  uint64_t v204;
  uint64_t v205;
  WTF::StringImpl *v206;
  WTF::StringImpl *v207;
  WTF::StringImpl *v208;
  WTF::StringImpl *v209;
  WTF::StringImpl *v210;
  WTF::StringImpl *v211;
  WTF::StringImpl *v212;
  WTF::StringImpl *v213;
  WTF::StringImpl *v214;
  WTF::Logger *v215;
  uint64_t v216;
  WTF::StringImpl **v217;
  WTF::StringImpl *v218;
  WTF::StringImpl *v219;
  WTF::StringImpl *v220;
  WTF::StringImpl *v221;
  WTF::StringImpl *v222;
  WTF::StringImpl *v223;
  WTF::StringImpl *v224;
  WTF::StringImpl *v225;
  WTF::StringImpl *v226;
  WTF::StringImpl *v227;
  WTF::StringImpl *v228;
  int v229;
  WTF::StringImpl *v230;
  WTF::RunLoop *v231;
  uint64_t v232;
  uint64_t v233;
  _QWORD *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  WTF::String *v238;
  uint64_t v239;
  WTF::Logger *v240;
  WTF::Logger *v241;
  uint64_t v242;
  uint64_t v243;
  WTF::StringImpl *v244;
  WTF::StringImpl *v245;
  WTF::StringImpl *v246;
  WTF::Logger *v247;
  uint64_t v248;
  WTF::StringImpl **v249;
  WTF::StringImpl *v250;
  WTF::StringImpl *v251;
  WTF::StringImpl *v252;
  WTF::StringImpl *v253;
  WTF::StringImpl *v254;
  uint64_t v255;
  uint64_t v256;
  WTF::String *v257;
  uint64_t v258;
  WTF::Logger *v259;
  WTF::Logger *v260;
  uint64_t v261;
  uint64_t v262;
  WTF::StringImpl *v263;
  WTF::StringImpl *v264;
  WTF::StringImpl *v265;
  WTF::Logger *v266;
  uint64_t v267;
  WTF::StringImpl **v268;
  WTF::StringImpl *v269;
  WTF::StringImpl *v270;
  WTF::StringImpl *v271;
  WTF::StringImpl *v272;
  WTF::StringImpl *v273;
  int v274;
  WTF::StringImpl *v275;
  int v276;
  _BOOL4 v277;
  _BYTE *v278;
  _BYTE *v279;
  size_t v280;
  uint64_t v281;
  _BYTE *v282;
  _BYTE *v283;
  size_t v284;
  uint64_t v285;
  uint64_t v286;
  unsigned __int128 *v287;
  unsigned __int128 *v288;
  unsigned __int128 v289;
  unsigned __int128 *v290;
  unsigned __int128 *v291;
  unsigned __int128 v292;
  char v293;
  char v294;
  $F9635BD25436628440684A9CD771B596 *v295;
  uint64_t v296;
  WTF::StringImpl *v297;
  WTF::String *v298;
  WTF::StringImpl *v299;
  WTF::String *v300;
  WTF::String *v301;
  WTF::String *v302;
  WTF::String *v303;
  double v304;
  WTF::StringImpl *v305;
  WTF::StringImpl *v306;
  int v307;
  int v308;
  WTF::Logger *v309;
  uint64_t v310;
  const char *v311;
  const void *v312;
  CGAffineTransform v313;
  CGAffineTransform v314;
  CGAffineTransform v315;
  WTF::Logger *v316;
  uint64_t v317;
  WTF::StringImpl *v318;
  WTF::StringImpl *v319;
  WTF::StringImpl *v320;
  WTF::StringImpl *v321;
  WTF::StringImpl *v322;
  WTF::StringImpl *v323;
  WTF::StringImpl *v324;
  WTF::StringImpl *v325;
  WTF::StringImpl *v326;
  WTF::StringImpl *v327;
  WTF::StringImpl *v328;
  WTF::StringImpl *v329;
  __int128 buf;
  const char *v331;
  WTF::StringImpl *v332;
  int v333;
  WTF::StringImpl *v334;
  int v335;
  WTF::StringImpl *v336;
  int v337;
  WTF::StringImpl *v338;
  int v339;
  WTF::StringImpl *v340;
  int v341;
  WTF::StringImpl *v342;
  int v343;
  WTF::StringImpl *v344;
  int v345;
  WTF::StringImpl *v346;
  int v347;
  WTF::StringImpl *v348[5];
  CGRect v349;
  CGRect v350;

  v348[2] = *(WTF::StringImpl **)MEMORY[0x1E0C80C00];
  if ((WebAVPlayerLayer *)objc_msgSend(self->_videoSublayer.m_ptr, "superlayer") != self)
  {
    if (-[WebAVPlayerLayer loggerPtr](self, "loggerPtr"))
    {
      if (-[WebAVPlayerLayer logChannel](self, "logChannel"))
      {
        v3 = -[WebAVPlayerLayer loggerPtr](self, "loggerPtr");
        v4 = -[WebAVPlayerLayer logChannel](self, "logChannel");
        buf = 0uLL;
        v331 = "-[WebAVPlayerLayer layoutSublayers]";
        v332 = -[WebAVPlayerLayer logIdentifier](self, "logIdentifier");
        if (v3[12])
        {
          if (v4->var0)
          {
            if (v4->var2 >= 3u)
              WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [49]>((uint64_t)v4, 3u, (WTF::Logger::LogSiteIdentifier *)&buf, "videoSublayer is has another superlayer, bailing");
          }
        }
      }
    }
    return;
  }
  -[WebAVPlayerLayer videoDimensions](self, "videoDimensions");
  if (v5 <= 0.0 || (-[WebAVPlayerLayer videoDimensions](self, "videoDimensions"), v6 <= 0.0))
  {
    if (-[WebAVPlayerLayer loggerPtr](self, "loggerPtr"))
    {
      if (-[WebAVPlayerLayer logChannel](self, "logChannel"))
      {
        v40 = -[WebAVPlayerLayer loggerPtr](self, "loggerPtr");
        v41 = -[WebAVPlayerLayer logChannel](self, "logChannel");
        buf = 0uLL;
        v331 = "-[WebAVPlayerLayer layoutSublayers]";
        v332 = -[WebAVPlayerLayer logIdentifier](self, "logIdentifier");
        if (v40[12])
        {
          if (v41->var0 && v41->var2 >= 3u)
            WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [35]>((uint64_t)v41, 3u, (WTF::Logger::LogSiteIdentifier *)&buf, "videoDimensions are empty, bailing");
        }
      }
    }
    return;
  }
  -[CALayer bounds](-[WebAVPlayerLayer videoSublayer](self, "videoSublayer"), "bounds");
  v300 = v8;
  v304 = v7;
  v10 = v9;
  v12 = v11;
  -[WebAVPlayerLayer calculateTargetVideoFrame](self, "calculateTargetVideoFrame");
  p_targetVideoFrame = &self->_targetVideoFrame;
  self->_targetVideoFrame.m_location.m_x = v13;
  self->_targetVideoFrame.m_location.m_y = v14;
  self->_targetVideoFrame.m_size.m_width = v15;
  self->_targetVideoFrame.m_size.m_height = v16;
  if (self->_captionsLayer.m_ptr)
  {
    v18 = v13;
    v19 = v14;
    v20 = v15;
    v21 = v16;
    -[WebAVPlayerLayer bounds](self, "bounds");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    if (v18 >= v23)
      v30 = v18;
    else
      v30 = v23;
    if (v19 >= v25)
      v31 = v19;
    else
      v31 = v25;
    v32 = v23 + v27;
    if (v32 >= (float)(v18 + v20))
      v32 = v18 + v20;
    v33 = v25 + v29;
    if (v33 >= (float)(v19 + v21))
      v33 = v19 + v21;
    v34 = v30 < v32 && v31 < v33;
    if (!v34)
    {
      v30 = 0.0;
      v31 = 0.0;
      v32 = 0.0;
      v33 = 0.0;
    }
    v35 = v32 - v30;
    v36 = v33 - v31;
    objc_msgSend(self->_captionsLayer.m_ptr, "setFrame:", v30, v31, (float)(v32 - v30), (float)(v33 - v31));
    m_ptr = self->_presentationModel.m_controlBlock.m_ptr;
    if (m_ptr)
    {
      m_objectOfCorrectType = self->_presentationModel.m_objectOfCorrectType;
      if (__ldaxr((unsigned __int8 *)m_ptr))
      {
        __clrex();
      }
      else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
      {
        goto LABEL_37;
      }
      MEMORY[0x19AEA534C](m_ptr);
LABEL_37:
      if (*((_QWORD *)m_ptr + 3))
        ++*((_QWORD *)m_ptr + 1);
      else
        m_objectOfCorrectType = 0;
      v42 = __ldxr((unsigned __int8 *)m_ptr);
      if (v42 == 1)
      {
        if (!__stlxr(0, (unsigned __int8 *)m_ptr))
        {
LABEL_45:
          if (!m_objectOfCorrectType)
            goto LABEL_86;
          v43 = floorf(v30);
          v44 = 2147500000.0;
          if (v43 < 2147500000.0)
          {
            v44 = -2147500000.0;
            v34 = v43 <= -2147500000.0;
            v45 = (float)(int)v43;
            if (!v34)
              v44 = v45;
          }
          v46 = floorf(v31);
          v47 = 2147500000.0;
          if (v46 < 2147500000.0)
          {
            v47 = -2147500000.0;
            if (v46 > -2147500000.0)
              v47 = (float)(int)v46;
          }
          v48 = ceilf(v30 + v35);
          v49 = 2147500000.0;
          if (v48 < 2147500000.0)
          {
            v49 = -2147500000.0;
            if (v48 > -2147500000.0)
              v49 = (float)(int)v48;
          }
          v50 = ceilf(v31 + v36);
          v51 = 2147500000.0;
          if (v50 < 2147500000.0)
          {
            v51 = -2147500000.0;
            if (v50 > -2147500000.0)
              v51 = (float)(int)v50;
          }
          if (v44 >= 2147500000.0)
          {
            v52 = 0x7FFFFFFFLL;
          }
          else if (v44 <= -2147500000.0)
          {
            v52 = 0x80000000;
          }
          else
          {
            v52 = (int)v44;
          }
          if (v47 >= 2147500000.0)
          {
            v53 = 0x7FFFFFFF00000000;
          }
          else if (v47 <= -2147500000.0)
          {
            v53 = 0x8000000000000000;
          }
          else
          {
            v53 = (unint64_t)(int)v47 << 32;
          }
          v54 = v49 - v44;
          v55 = v51 - v47;
          if (v54 >= 2147500000.0)
          {
            v56 = 0x7FFFFFFFLL;
          }
          else if (v54 <= -2147500000.0)
          {
            v56 = 0x80000000;
          }
          else
          {
            v56 = (int)v54;
          }
          if (v55 >= 2147500000.0)
          {
            v57 = 0x7FFFFFFF00000000;
          }
          else if (v55 <= -2147500000.0)
          {
            v57 = 0x8000000000000000;
          }
          else
          {
            v57 = (unint64_t)(int)v55 << 32;
          }
          *(_QWORD *)&buf = v53 | v52;
          *((_QWORD *)&buf + 1) = v57 | v56;
          (*(void (**)(VideoPresentationModel *, __int128 *))(*(_QWORD *)m_objectOfCorrectType + 224))(m_objectOfCorrectType, &buf);
          v59 = *((_QWORD *)m_objectOfCorrectType + 1);
          if (__ldaxr((unsigned __int8 *)v59))
          {
            __clrex();
          }
          else if (!__stxr(1u, (unsigned __int8 *)v59))
          {
            goto LABEL_74;
          }
          MEMORY[0x19AEA534C](v59);
LABEL_74:
          v61 = *(_QWORD *)(v59 + 8);
          v62 = v61 - 1;
          *(_QWORD *)(v59 + 8) = v61 - 1;
          if (v61 == 1)
          {
            v286 = *(_QWORD *)(v59 + 16);
            v63 = *(_QWORD *)(v59 + 24);
            *(_QWORD *)(v59 + 24) = 0;
            v64 = v286 != 0;
          }
          else
          {
            v63 = 0;
            v64 = 1;
          }
          v65 = __ldxr((unsigned __int8 *)v59);
          if (v65 == 1)
          {
            if (!__stlxr(0, (unsigned __int8 *)v59))
            {
LABEL_81:
              if (!v62)
              {
                if (v63)
                  (*(void (**)(uint64_t))(*(_QWORD *)v63 + 8))(v63);
                if (!v64)
                  WTF::fastFree((WTF *)v59, v58);
              }
              goto LABEL_86;
            }
          }
          else
          {
            __clrex();
          }
          WTF::Lock::unlockSlow((WTF::Lock *)v59);
          goto LABEL_81;
        }
      }
      else
      {
        __clrex();
      }
      WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
      goto LABEL_45;
    }
  }
LABEL_86:
  -[WebAVPlayerLayer videoDimensions](self, "videoDimensions");
  v67 = v66;
  v68 = (PAL *)-[WebAVPlayerLayer videoDimensions](self, "videoDimensions");
  v70 = v69;
  v71 = (PAL *)objc_msgSend((id)PAL::get_AVFoundation_AVLayerVideoGravityResizeAspect(v68), "isEqualToString:", self->_previousVideoGravity.m_ptr);
  v72 = v304;
  v73 = *(double *)&v300;
  v74 = v10;
  v75 = v12;
  v76 = v67 / v70;
  if ((_DWORD)v71)
  {
    if ((float)(v74 / v75) < v76)
    {
LABEL_88:
      v77 = (float)((float)(v74 / v76) - v75) * 0.5;
      v73 = v73 - v77;
      v75 = v77 + (float)(v77 + v75);
      goto LABEL_92;
    }
  }
  else
  {
    if (!objc_msgSend((id)PAL::get_AVFoundation_AVLayerVideoGravityResizeAspectFill(v71), "isEqualToString:", self->_previousVideoGravity.m_ptr))goto LABEL_92;
    if ((float)(v74 / v75) > v76)
      goto LABEL_88;
  }
  v78 = (float)-(float)(v74 - (float)(v75 * v76)) * 0.5;
  v72 = v72 - v78;
  v74 = v78 + (float)(v78 + v74);
LABEL_92:
  if (v74 > 0.0 && v75 > 0.0)
  {
    if (v72 == p_targetVideoFrame->m_location.m_x
      && v73 == self->_targetVideoFrame.m_location.m_y
      && v74 == self->_targetVideoFrame.m_size.m_width
      && v75 == self->_targetVideoFrame.m_size.m_height)
    {
      v81 = self->_videoSublayer.m_ptr;
      if (v81)
        objc_msgSend(v81, "affineTransform");
      else
        memset(&v315, 0, sizeof(v315));
      if (CGAffineTransformIsIdentity(&v315))
      {
        if (!-[WebAVPlayerLayer loggerPtr](self, "loggerPtr"))
          return;
        if (!-[WebAVPlayerLayer logChannel](self, "logChannel"))
          return;
        v85 = -[WebAVPlayerLayer loggerPtr](self, "loggerPtr");
        v86 = -[WebAVPlayerLayer logChannel](self, "logChannel");
        v314.a = 0.0;
        v314.b = 0.0;
        *(_QWORD *)&v314.c = "-[WebAVPlayerLayer layoutSublayers]";
        *(_QWORD *)&v314.d = -[WebAVPlayerLayer logIdentifier](self, "logIdentifier");
        if (!v85[12] || !v86->var0 || v86->var2 < 4u)
          return;
        WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)&v314);
        WTF::String::String((WTF::String *)&v327, "targetVideoFrame (");
        WebCore::FloatRect::toJSONObject((WebCore::FloatRect *)&self->_targetVideoFrame, (uint64_t *)&buf);
        WTF::JSONImpl::Value::toJSONString((WTF::JSONImpl::Value *)buf);
        v87 = (_DWORD *)buf;
        *(_QWORD *)&buf = 0;
        if (v87)
        {
          if (*v87 == 1)
            WTF::JSONImpl::Value::operator delete();
          else
            --*v87;
        }
        WTF::String::String((WTF::String *)&v325, ") is equal to sourceVideoFrame, and affineTransform is identity, bailing");
        *(_QWORD *)&buf = v328;
        v309 = v327;
        v316 = v326;
        v306 = v325;
        WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)&buf, (uint64_t *)&v309, (uint64_t *)&v316, (uint64_t *)&v306, &v329);
        if (!v329)
        {
          __break(0xC471u);
          JUMPOUT(0x196837984);
        }
        v89 = v325;
        v325 = 0;
        if (v89)
        {
          if (*(_DWORD *)v89 == 2)
            WTF::StringImpl::destroy(v89, v88);
          else
            *(_DWORD *)v89 -= 2;
        }
        v90 = v326;
        v326 = 0;
        if (v90)
        {
          if (*(_DWORD *)v90 == 2)
            WTF::StringImpl::destroy(v90, v88);
          else
            *(_DWORD *)v90 -= 2;
        }
        v91 = v327;
        v327 = 0;
        if (v91)
        {
          if (*(_DWORD *)v91 == 2)
            WTF::StringImpl::destroy(v91, v88);
          else
            *(_DWORD *)v91 -= 2;
        }
        v92 = v328;
        v328 = 0;
        if (v92)
        {
          if (*(_DWORD *)v92 == 2)
            WTF::StringImpl::destroy(v92, v88);
          else
            *(_DWORD *)v92 -= 2;
        }
        var4 = v86->var4;
        v94 = os_log_type_enabled(var4, OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)v94)
        {
          WTF::String::utf8();
          v96 = v309 ? (char *)v309 + 16 : 0;
          LODWORD(buf) = 136446210;
          *(_QWORD *)((char *)&buf + 4) = v96;
          _os_log_impl(&dword_1940B8000, var4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
          v94 = (uint64_t)v309;
          v309 = 0;
          if (v94)
          {
            if (*(_DWORD *)v94 == 1)
              v94 = WTF::fastFree((WTF *)v94, v95);
            else
              --*(_DWORD *)v94;
          }
        }
        if (v86->var0 && v86->var2 >= 4u)
        {
          v97 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
          while (1)
          {
            v98 = *v97;
            if ((v98 & 1) != 0)
              break;
            v99 = __ldaxr(v97);
            if (v99 == v98)
            {
              if (!__stxr(v98 | 1, v97))
              {
                v236 = WTF::Logger::observers((WTF::Logger *)v94);
                v237 = *(unsigned int *)(v236 + 12);
                if ((_DWORD)v237)
                {
                  v238 = *(WTF::String **)v236;
                  v302 = (WTF::String *)(*(_QWORD *)v236 + 8 * v237);
                  do
                  {
                    v239 = *(_QWORD *)v238;
                    LODWORD(buf) = 0;
                    WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)&v314);
                    LODWORD(v331) = 0;
                    WTF::String::String((WTF::String *)&v332, "targetVideoFrame (");
                    v333 = 1;
                    WebCore::FloatRect::toJSONObject((WebCore::FloatRect *)p_targetVideoFrame, (uint64_t *)&v316);
                    WTF::JSONImpl::Value::toJSONString(v316);
                    v240 = v316;
                    v316 = 0;
                    if (v240)
                    {
                      if (*(_DWORD *)v240 == 1)
                        WTF::JSONImpl::Value::operator delete();
                      else
                        --*(_DWORD *)v240;
                    }
                    v335 = 0;
                    WTF::String::String((WTF::String *)&v336, ") is equal to sourceVideoFrame, and affineTransform is identity, bailing");
                    v309 = 0;
                    v310 = 0;
                    v241 = (WTF::Logger *)WTF::fastMalloc((WTF *)0x40);
                    LODWORD(v310) = 4;
                    v309 = v241;
                    v242 = HIDWORD(v310);
                    *((_DWORD *)v241 + 4 * HIDWORD(v310)) = buf;
                    v243 = *((_QWORD *)&buf + 1);
                    if (*((_QWORD *)&buf + 1))
                      **((_DWORD **)&buf + 1) += 2;
                    *((_QWORD *)v241 + 2 * v242 + 1) = v243;
                    *((_DWORD *)v241 + 4 * (v242 + 1)) = (_DWORD)v331;
                    v244 = v332;
                    if (v332)
                      *(_DWORD *)v332 += 2;
                    *((_QWORD *)v241 + 2 * (v242 + 1) + 1) = v244;
                    *((_DWORD *)v241 + 4 * (v242 + 2)) = v333;
                    v245 = v334;
                    if (v334)
                      *(_DWORD *)v334 += 2;
                    *((_QWORD *)v241 + 2 * (v242 + 2) + 1) = v245;
                    *((_DWORD *)v241 + 4 * (v242 + 3)) = v335;
                    v246 = v336;
                    if (v336)
                      *(_DWORD *)v336 += 2;
                    *((_QWORD *)v241 + 2 * (v242 + 3) + 1) = v246;
                    HIDWORD(v310) = v242 + 4;
                    (*(void (**)(uint64_t, $F9635BD25436628440684A9CD771B596 *, uint64_t, WTF::Logger **))(*(_QWORD *)v239 + 16))(v239, v86, 4, &v309);
                    v247 = v309;
                    if (HIDWORD(v310))
                    {
                      v248 = 16 * HIDWORD(v310);
                      v249 = (WTF::StringImpl **)((char *)v309 + 8);
                      do
                      {
                        v250 = *v249;
                        *v249 = 0;
                        if (v250)
                        {
                          if (*(_DWORD *)v250 == 2)
                            WTF::StringImpl::destroy(v250, (WTF::StringImpl *)v95);
                          else
                            *(_DWORD *)v250 -= 2;
                        }
                        v249 += 2;
                        v248 -= 16;
                      }
                      while (v248);
                      v247 = v309;
                    }
                    if (v247)
                    {
                      v309 = 0;
                      LODWORD(v310) = 0;
                      WTF::fastFree(v247, v95);
                    }
                    v251 = v336;
                    v336 = 0;
                    if (v251)
                    {
                      if (*(_DWORD *)v251 == 2)
                        WTF::StringImpl::destroy(v251, (WTF::StringImpl *)v95);
                      else
                        *(_DWORD *)v251 -= 2;
                    }
                    v252 = v334;
                    v334 = 0;
                    if (v252)
                    {
                      if (*(_DWORD *)v252 == 2)
                        WTF::StringImpl::destroy(v252, (WTF::StringImpl *)v95);
                      else
                        *(_DWORD *)v252 -= 2;
                    }
                    v253 = v332;
                    v332 = 0;
                    if (v253)
                    {
                      if (*(_DWORD *)v253 == 2)
                        WTF::StringImpl::destroy(v253, (WTF::StringImpl *)v95);
                      else
                        *(_DWORD *)v253 -= 2;
                    }
                    v254 = (WTF::StringImpl *)*((_QWORD *)&buf + 1);
                    *((_QWORD *)&buf + 1) = 0;
                    if (v254)
                    {
                      if (*(_DWORD *)v254 == 2)
                        WTF::StringImpl::destroy(v254, (WTF::StringImpl *)v95);
                      else
                        *(_DWORD *)v254 -= 2;
                    }
                    v238 = (WTF::String *)((char *)v238 + 8);
                  }
                  while (v238 != v302);
                }
                goto LABEL_531;
              }
            }
            else
            {
              __clrex();
            }
          }
        }
        goto LABEL_536;
      }
    }
    -[CALayer frame](-[WebAVPlayerLayer videoSublayer](self, "videoSublayer"), "frame");
    v104 = v103;
    m_width = self->_targetVideoFrame.m_size.m_width;
    m_height = self->_targetVideoFrame.m_size.m_height;
    if (vabds_f32(v104, p_targetVideoFrame->m_location.m_x) < 0.01)
    {
      v107 = v100;
      if (vabds_f32(v107, self->_targetVideoFrame.m_location.m_y) < 0.01)
      {
        v108 = v101;
        if (fabsf(v108 - m_width) < 0.01)
        {
          v109 = v102;
          if (fabsf(v109 - m_height) < 0.01)
          {
            if (!-[WebAVPlayerLayer loggerPtr](self, "loggerPtr"))
              return;
            if (!-[WebAVPlayerLayer logChannel](self, "logChannel"))
              return;
            v110 = -[WebAVPlayerLayer loggerPtr](self, "loggerPtr");
            v111 = -[WebAVPlayerLayer logChannel](self, "logChannel");
            v314.a = 0.0;
            v314.b = 0.0;
            *(_QWORD *)&v314.c = "-[WebAVPlayerLayer layoutSublayers]";
            *(_QWORD *)&v314.d = -[WebAVPlayerLayer logIdentifier](self, "logIdentifier");
            if (!v110[12] || !v111->var0 || v111->var2 < 4u)
              return;
            WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)&v314);
            WTF::String::String((WTF::String *)&v327, "targetVideoFrame (");
            WebCore::FloatRect::toJSONObject((WebCore::FloatRect *)&self->_targetVideoFrame, (uint64_t *)&buf);
            WTF::JSONImpl::Value::toJSONString((WTF::JSONImpl::Value *)buf);
            v112 = (_DWORD *)buf;
            *(_QWORD *)&buf = 0;
            if (v112)
            {
              if (*v112 == 1)
                WTF::JSONImpl::Value::operator delete();
              else
                --*v112;
            }
            WTF::String::String((WTF::String *)&v325, ") is essentially equal to videoSublayer.frame, bailing");
            *(_QWORD *)&buf = v328;
            v309 = v327;
            v316 = v326;
            v306 = v325;
            WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)&buf, (uint64_t *)&v309, (uint64_t *)&v316, (uint64_t *)&v306, &v329);
            if (v329)
            {
              v114 = v325;
              v325 = 0;
              if (v114)
              {
                if (*(_DWORD *)v114 == 2)
                  WTF::StringImpl::destroy(v114, v113);
                else
                  *(_DWORD *)v114 -= 2;
              }
              v115 = v326;
              v326 = 0;
              if (v115)
              {
                if (*(_DWORD *)v115 == 2)
                  WTF::StringImpl::destroy(v115, v113);
                else
                  *(_DWORD *)v115 -= 2;
              }
              v116 = v327;
              v327 = 0;
              if (v116)
              {
                if (*(_DWORD *)v116 == 2)
                  WTF::StringImpl::destroy(v116, v113);
                else
                  *(_DWORD *)v116 -= 2;
              }
              v117 = v328;
              v328 = 0;
              if (v117)
              {
                if (*(_DWORD *)v117 == 2)
                  WTF::StringImpl::destroy(v117, v113);
                else
                  *(_DWORD *)v117 -= 2;
              }
              v118 = v111->var4;
              v119 = os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT);
              if ((_DWORD)v119)
              {
                WTF::String::utf8();
                v120 = v309 ? (char *)v309 + 16 : 0;
                LODWORD(buf) = 136446210;
                *(_QWORD *)((char *)&buf + 4) = v120;
                _os_log_impl(&dword_1940B8000, v118, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
                v119 = (uint64_t)v309;
                v309 = 0;
                if (v119)
                {
                  if (*(_DWORD *)v119 == 1)
                    v119 = WTF::fastFree((WTF *)v119, v95);
                  else
                    --*(_DWORD *)v119;
                }
              }
              if (v111->var0 && v111->var2 >= 4u)
              {
                v97 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
                while (1)
                {
                  v121 = *v97;
                  if ((v121 & 1) != 0)
                    break;
                  v122 = __ldaxr(v97);
                  if (v122 == v121)
                  {
                    if (!__stxr(v121 | 1, v97))
                    {
                      v255 = WTF::Logger::observers((WTF::Logger *)v119);
                      v256 = *(unsigned int *)(v255 + 12);
                      if ((_DWORD)v256)
                      {
                        v257 = *(WTF::String **)v255;
                        v303 = (WTF::String *)(*(_QWORD *)v255 + 8 * v256);
                        do
                        {
                          v258 = *(_QWORD *)v257;
                          LODWORD(buf) = 0;
                          WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)&v314);
                          LODWORD(v331) = 0;
                          WTF::String::String((WTF::String *)&v332, "targetVideoFrame (");
                          v333 = 1;
                          WebCore::FloatRect::toJSONObject((WebCore::FloatRect *)p_targetVideoFrame, (uint64_t *)&v316);
                          WTF::JSONImpl::Value::toJSONString(v316);
                          v259 = v316;
                          v316 = 0;
                          if (v259)
                          {
                            if (*(_DWORD *)v259 == 1)
                              WTF::JSONImpl::Value::operator delete();
                            else
                              --*(_DWORD *)v259;
                          }
                          v335 = 0;
                          WTF::String::String((WTF::String *)&v336, ") is essentially equal to videoSublayer.frame, bailing");
                          v309 = 0;
                          v310 = 0;
                          v260 = (WTF::Logger *)WTF::fastMalloc((WTF *)0x40);
                          LODWORD(v310) = 4;
                          v309 = v260;
                          v261 = HIDWORD(v310);
                          *((_DWORD *)v260 + 4 * HIDWORD(v310)) = buf;
                          v262 = *((_QWORD *)&buf + 1);
                          if (*((_QWORD *)&buf + 1))
                            **((_DWORD **)&buf + 1) += 2;
                          *((_QWORD *)v260 + 2 * v261 + 1) = v262;
                          *((_DWORD *)v260 + 4 * (v261 + 1)) = (_DWORD)v331;
                          v263 = v332;
                          if (v332)
                            *(_DWORD *)v332 += 2;
                          *((_QWORD *)v260 + 2 * (v261 + 1) + 1) = v263;
                          *((_DWORD *)v260 + 4 * (v261 + 2)) = v333;
                          v264 = v334;
                          if (v334)
                            *(_DWORD *)v334 += 2;
                          *((_QWORD *)v260 + 2 * (v261 + 2) + 1) = v264;
                          *((_DWORD *)v260 + 4 * (v261 + 3)) = v335;
                          v265 = v336;
                          if (v336)
                            *(_DWORD *)v336 += 2;
                          *((_QWORD *)v260 + 2 * (v261 + 3) + 1) = v265;
                          HIDWORD(v310) = v261 + 4;
                          (*(void (**)(uint64_t, $F9635BD25436628440684A9CD771B596 *, uint64_t, WTF::Logger **))(*(_QWORD *)v258 + 16))(v258, v111, 4, &v309);
                          v266 = v309;
                          if (HIDWORD(v310))
                          {
                            v267 = 16 * HIDWORD(v310);
                            v268 = (WTF::StringImpl **)((char *)v309 + 8);
                            do
                            {
                              v269 = *v268;
                              *v268 = 0;
                              if (v269)
                              {
                                if (*(_DWORD *)v269 == 2)
                                  WTF::StringImpl::destroy(v269, (WTF::StringImpl *)v95);
                                else
                                  *(_DWORD *)v269 -= 2;
                              }
                              v268 += 2;
                              v267 -= 16;
                            }
                            while (v267);
                            v266 = v309;
                          }
                          if (v266)
                          {
                            v309 = 0;
                            LODWORD(v310) = 0;
                            WTF::fastFree(v266, v95);
                          }
                          v270 = v336;
                          v336 = 0;
                          if (v270)
                          {
                            if (*(_DWORD *)v270 == 2)
                              WTF::StringImpl::destroy(v270, (WTF::StringImpl *)v95);
                            else
                              *(_DWORD *)v270 -= 2;
                          }
                          v271 = v334;
                          v334 = 0;
                          if (v271)
                          {
                            if (*(_DWORD *)v271 == 2)
                              WTF::StringImpl::destroy(v271, (WTF::StringImpl *)v95);
                            else
                              *(_DWORD *)v271 -= 2;
                          }
                          v272 = v332;
                          v332 = 0;
                          if (v272)
                          {
                            if (*(_DWORD *)v272 == 2)
                              WTF::StringImpl::destroy(v272, (WTF::StringImpl *)v95);
                            else
                              *(_DWORD *)v272 -= 2;
                          }
                          v273 = (WTF::StringImpl *)*((_QWORD *)&buf + 1);
                          *((_QWORD *)&buf + 1) = 0;
                          if (v273)
                          {
                            if (*(_DWORD *)v273 == 2)
                              WTF::StringImpl::destroy(v273, (WTF::StringImpl *)v95);
                            else
                              *(_DWORD *)v273 -= 2;
                          }
                          v257 = (WTF::String *)((char *)v257 + 8);
                        }
                        while (v257 != v303);
                      }
LABEL_531:
                      v274 = __ldxr(v97);
                      if (v274 == 1)
                      {
                        if (!__stlxr(0, v97))
                          break;
                      }
                      else
                      {
                        __clrex();
                      }
                      WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
                      break;
                    }
                  }
                  else
                  {
                    __clrex();
                  }
                }
              }
LABEL_536:
              v275 = v329;
              v329 = 0;
              if (v275)
              {
                if (*(_DWORD *)v275 == 2)
                  WTF::StringImpl::destroy(v275, (WTF::StringImpl *)v95);
                else
                  *(_DWORD *)v275 -= 2;
              }
              return;
            }
            __break(0xC471u);
LABEL_610:
            JUMPOUT(0x196837884);
          }
        }
      }
    }
    memset(&v314, 0, sizeof(v314));
    CGAffineTransformMakeScale(&v314, (float)(m_width / v74), (float)(m_height / v75));
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(self->_videoSublayer.m_ptr, "setAnchorPoint:", 0.5, 0.5);
    v123 = self->_videoSublayer.m_ptr;
    v313 = v314;
    objc_msgSend(v123, "setAffineTransform:", &v313);
    v124 = self->_videoSublayer.m_ptr;
    -[WebAVPlayerLayer bounds](self, "bounds");
    MidX = CGRectGetMidX(v349);
    -[WebAVPlayerLayer bounds](self, "bounds");
    objc_msgSend(v124, "setPosition:", MidX, CGRectGetMidY(v350));
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    if (!-[WebAVPlayerLayer loggerPtr](self, "loggerPtr"))
      goto LABEL_425;
    if (!-[WebAVPlayerLayer logChannel](self, "logChannel"))
      goto LABEL_425;
    v126 = -[WebAVPlayerLayer loggerPtr](self, "loggerPtr");
    v127 = -[WebAVPlayerLayer logChannel](self, "logChannel");
    v309 = 0;
    v310 = 0;
    v311 = "-[WebAVPlayerLayer layoutSublayers]";
    v312 = -[WebAVPlayerLayer logIdentifier](self, "logIdentifier");
    -[WebAVPlayerLayer bounds](self, "bounds");
    *(float *)&v128 = v128;
    *(float *)&v129 = v129;
    v306 = (WTF::StringImpl *)__PAIR64__(LODWORD(v129), LODWORD(v128));
    *(float *)&v128 = v130;
    *(float *)&v129 = v131;
    v307 = LODWORD(v128);
    v308 = LODWORD(v129);
    if (!v126[12] || !v127->var0 || v127->var2 < 4u)
      goto LABEL_425;
    WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)&v309);
    WTF::String::String((WTF::String *)&v326, "self.bounds: ");
    WebCore::FloatRect::toJSONObject((WebCore::FloatRect *)&v306, (uint64_t *)&buf);
    WTF::JSONImpl::Value::toJSONString((WTF::JSONImpl::Value *)buf);
    v132 = (_DWORD *)buf;
    *(_QWORD *)&buf = 0;
    if (v132)
    {
      if (*v132 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v132;
    }
    WTF::String::String((WTF::String *)&v324, ", targetVideoFrame: ");
    WebCore::FloatRect::toJSONObject((WebCore::FloatRect *)&self->_targetVideoFrame, (uint64_t *)&buf);
    WTF::JSONImpl::Value::toJSONString((WTF::JSONImpl::Value *)buf);
    v133 = (_DWORD *)buf;
    *(_QWORD *)&buf = 0;
    if (v133)
    {
      if (*v133 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v133;
    }
    v134 = (WTF::String *)WTF::String::String((WTF::String *)&v322, ", transform: [");
    WTF::String::number(v134, v314.a);
    v135 = (WTF::String *)WTF::String::String((WTF::String *)&v320, ", ");
    WTF::String::number(v135, v314.d);
    WTF::String::String((WTF::String *)&v318, "]");
    v138 = v326;
    v137 = v327;
    v139 = v325;
    if (v327)
      v140 = *((_DWORD *)v327 + 1);
    else
      v140 = 0;
    v141 = (int)v324;
    if (v326)
      v142 = *((_DWORD *)v326 + 1);
    else
      v142 = 0;
    v143 = (int)v323;
    if (v325)
      v144 = *((_DWORD *)v325 + 1);
    else
      v144 = 0;
    v145 = (int)v322;
    v305 = v324;
    if (v324)
      v141 = *((_DWORD *)v324 + 1);
    v146 = (int)v321;
    v301 = v323;
    if (v323)
      v143 = *((_DWORD *)v323 + 1);
    v147 = (int)v320;
    v299 = v322;
    if (v322)
      v145 = *((_DWORD *)v322 + 1);
    v148 = v319;
    v295 = v127;
    v298 = v321;
    if (v321)
      v146 = *((_DWORD *)v321 + 1);
    v149 = v318;
    v297 = v320;
    if (v320)
      v147 = *((_DWORD *)v320 + 1);
    if (v319)
    {
      v150 = *((_DWORD *)v319 + 1);
      if (v318)
      {
LABEL_220:
        v151 = *((_DWORD *)v318 + 1);
LABEL_221:
        if ((v151 | v150) < 0)
          goto LABEL_579;
        v152 = __OFADD__(v150, v151);
        v153 = v150 + v151;
        v154 = v152;
        if (v147 < 0 || v154)
          goto LABEL_579;
        v152 = __OFADD__(v147, v153);
        v155 = v147 + v153;
        v156 = v152;
        if (v146 < 0 || v156)
          goto LABEL_579;
        v152 = __OFADD__(v146, v155);
        v157 = v146 + v155;
        v158 = v152;
        if (v145 < 0 || v158)
          goto LABEL_579;
        v152 = __OFADD__(v145, v157);
        v159 = v145 + v157;
        v160 = v152;
        if (v143 < 0 || v160)
          goto LABEL_579;
        v152 = __OFADD__(v143, v159);
        v161 = v143 + v159;
        v162 = v152;
        if (v141 < 0 || v162)
          goto LABEL_579;
        v152 = __OFADD__(v141, v161);
        v163 = v141 + v161;
        v164 = v152;
        if (v144 < 0 || v164)
          goto LABEL_579;
        v152 = __OFADD__(v144, v163);
        v165 = v144 + v163;
        v166 = v152;
        if (v142 < 0 || v166)
          goto LABEL_579;
        v152 = __OFADD__(v142, v165);
        v167 = v142 + v165;
        v168 = v152;
        if (v140 < 0)
          goto LABEL_579;
        if (v168)
          goto LABEL_579;
        v169 = v140 + v167;
        if (__OFADD__(v140, v167))
          goto LABEL_579;
        if (v327 && (*((_BYTE *)v327 + 16) & 4) == 0
          || v326 && (*((_BYTE *)v326 + 16) & 4) == 0
          || v325 && (*((_BYTE *)v325 + 16) & 4) == 0
          || v324 && (*((_BYTE *)v324 + 16) & 4) == 0
          || v323 && (*((_BYTE *)v323 + 16) & 4) == 0
          || v322 && (*((_BYTE *)v322 + 16) & 4) == 0
          || v321 && (*((_BYTE *)v321 + 16) & 4) == 0
          || v320 && (*((_BYTE *)v320 + 16) & 4) == 0)
        {
          if (v169)
          {
            v170 = v169;
LABEL_281:
            if (v169 <= 0x7FFFFFEF)
            {
              WTF::tryFastCompactMalloc((WTF *)(2 * v170 + 20));
              v171 = buf;
              if ((_QWORD)buf)
              {
                *(_DWORD *)buf = 2;
                *(_DWORD *)(v171 + 4) = v169;
                *(_QWORD *)(v171 + 8) = v171 + 20;
                *(_DWORD *)(v171 + 16) = 0;
                v329 = v137;
                WTF::StringTypeAdapter<WTF::StringImpl *,void>::writeTo<char16_t>((uint64_t *)&v329, (char *)(v171 + 20));
                v172 = v329;
                if (v329)
                  v172 = (WTF::StringImpl *)*((unsigned int *)v329 + 1);
                v173 = (char *)(v171 + 20 + 2 * (_QWORD)v172);
                v316 = v138;
                WTF::StringTypeAdapter<WTF::StringImpl *,void>::writeTo<char16_t>((uint64_t *)&v316, v173);
                v174 = v316;
                if (v316)
                  v174 = (WTF::Logger *)*((unsigned int *)v316 + 1);
                v175 = &v173[2 * (_QWORD)v174];
                *(_QWORD *)&buf = v139;
                WTF::StringTypeAdapter<WTF::StringImpl *,void>::writeTo<char16_t>((uint64_t *)&buf, v175);
                v176 = buf;
                if ((_QWORD)buf)
                  v176 = *(unsigned int *)(buf + 4);
                WTF::stringTypeAdapterAccumulator<char16_t,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>(&v175[2 * v176], (uint64_t)v305, (uint64_t)v301, (uint64_t)v299, (uint64_t)v298, (uint64_t)v297, (uint64_t)v148, (uint64_t)v149);
                goto LABEL_290;
              }
            }
LABEL_579:
            v328 = 0;
            __break(0xC471u);
            goto LABEL_610;
          }
LABEL_575:
          v171 = MEMORY[0x1E0CBEF70];
          *MEMORY[0x1E0CBEF70] += 2;
LABEL_290:
          v328 = (WTF::StringImpl *)v171;
          v177 = v318;
          v318 = 0;
          v178 = v295;
          if (v177)
          {
            if (*(_DWORD *)v177 == 2)
              WTF::StringImpl::destroy(v177, v136);
            else
              *(_DWORD *)v177 -= 2;
          }
          v179 = v319;
          v319 = 0;
          if (v179)
          {
            if (*(_DWORD *)v179 == 2)
              WTF::StringImpl::destroy(v179, v136);
            else
              *(_DWORD *)v179 -= 2;
          }
          v180 = v320;
          v320 = 0;
          if (v180)
          {
            if (*(_DWORD *)v180 == 2)
              WTF::StringImpl::destroy(v180, v136);
            else
              *(_DWORD *)v180 -= 2;
          }
          v181 = v321;
          v321 = 0;
          if (v181)
          {
            if (*(_DWORD *)v181 == 2)
              WTF::StringImpl::destroy(v181, v136);
            else
              *(_DWORD *)v181 -= 2;
          }
          v182 = v322;
          v322 = 0;
          if (v182)
          {
            if (*(_DWORD *)v182 == 2)
              WTF::StringImpl::destroy(v182, v136);
            else
              *(_DWORD *)v182 -= 2;
          }
          v183 = v323;
          v323 = 0;
          if (v183)
          {
            if (*(_DWORD *)v183 == 2)
              WTF::StringImpl::destroy(v183, v136);
            else
              *(_DWORD *)v183 -= 2;
          }
          v184 = v324;
          v324 = 0;
          if (v184)
          {
            if (*(_DWORD *)v184 == 2)
              WTF::StringImpl::destroy(v184, v136);
            else
              *(_DWORD *)v184 -= 2;
          }
          v185 = v325;
          v325 = 0;
          if (v185)
          {
            if (*(_DWORD *)v185 == 2)
              WTF::StringImpl::destroy(v185, v136);
            else
              *(_DWORD *)v185 -= 2;
          }
          v186 = v326;
          v326 = 0;
          if (v186)
          {
            if (*(_DWORD *)v186 == 2)
              WTF::StringImpl::destroy(v186, v136);
            else
              *(_DWORD *)v186 -= 2;
          }
          v187 = v327;
          v327 = 0;
          if (v187)
          {
            if (*(_DWORD *)v187 == 2)
              WTF::StringImpl::destroy(v187, v136);
            else
              *(_DWORD *)v187 -= 2;
          }
          v188 = v295->var4;
          v189 = os_log_type_enabled(v188, OS_LOG_TYPE_DEFAULT);
          if ((_DWORD)v189)
          {
            WTF::String::utf8();
            v191 = v316 ? (char *)v316 + 16 : 0;
            LODWORD(buf) = 136446210;
            *(_QWORD *)((char *)&buf + 4) = v191;
            _os_log_impl(&dword_1940B8000, v188, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
            v189 = (uint64_t)v316;
            v316 = 0;
            if (v189)
            {
              if (*(_DWORD *)v189 == 1)
                v189 = WTF::fastFree((WTF *)v189, v190);
              else
                --*(_DWORD *)v189;
            }
          }
          if (v295->var0 && v295->var2 >= 4u)
          {
            v192 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
            while (1)
            {
              v193 = *v192;
              if ((v193 & 1) != 0)
                break;
              v194 = __ldaxr(v192);
              if (v194 == v193)
              {
                if (!__stxr(v193 | 1, v192))
                {
                  v195 = WTF::Logger::observers((WTF::Logger *)v189);
                  v196 = *(unsigned int *)(v195 + 12);
                  if ((_DWORD)v196)
                  {
                    v197 = *(uint64_t **)v195;
                    v296 = *(_QWORD *)v195 + 8 * v196;
                    do
                    {
                      v198 = *v197;
                      LODWORD(buf) = 0;
                      WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)&v309);
                      LODWORD(v331) = 0;
                      WTF::String::String((WTF::String *)&v332, "self.bounds: ");
                      v333 = 1;
                      WebCore::FloatRect::toJSONObject((WebCore::FloatRect *)&v306, (uint64_t *)&v329);
                      WTF::JSONImpl::Value::toJSONString(v329);
                      v199 = v329;
                      v329 = 0;
                      if (v199)
                      {
                        if (*(_DWORD *)v199 == 1)
                          WTF::JSONImpl::Value::operator delete();
                        else
                          --*(_DWORD *)v199;
                      }
                      v335 = 0;
                      WTF::String::String((WTF::String *)&v336, ", targetVideoFrame: ");
                      v337 = 1;
                      WebCore::FloatRect::toJSONObject((WebCore::FloatRect *)&self->_targetVideoFrame, (uint64_t *)&v329);
                      WTF::JSONImpl::Value::toJSONString(v329);
                      v200 = v329;
                      v329 = 0;
                      if (v200)
                      {
                        if (*(_DWORD *)v200 == 1)
                          WTF::JSONImpl::Value::operator delete();
                        else
                          --*(_DWORD *)v200;
                      }
                      v339 = 0;
                      v201 = (WTF::String *)WTF::String::String((WTF::String *)&v340, ", transform: [");
                      v341 = 0;
                      WTF::String::number(v201, v314.a);
                      v343 = 0;
                      v202 = (WTF::String *)WTF::String::String((WTF::String *)&v344, ", ");
                      v345 = 0;
                      WTF::String::number(v202, v314.d);
                      v347 = 0;
                      WTF::String::String((WTF::String *)v348, "]");
                      v316 = 0;
                      v317 = 0;
                      v203 = (WTF::Logger *)WTF::fastMalloc((WTF *)0xA0);
                      LODWORD(v317) = 10;
                      v316 = v203;
                      v204 = HIDWORD(v317);
                      *((_DWORD *)v203 + 4 * HIDWORD(v317)) = buf;
                      v205 = *((_QWORD *)&buf + 1);
                      if (*((_QWORD *)&buf + 1))
                        **((_DWORD **)&buf + 1) += 2;
                      *((_QWORD *)v203 + 2 * v204 + 1) = v205;
                      *((_DWORD *)v203 + 4 * (v204 + 1)) = (_DWORD)v331;
                      v206 = v332;
                      if (v332)
                        *(_DWORD *)v332 += 2;
                      *((_QWORD *)v203 + 2 * (v204 + 1) + 1) = v206;
                      *((_DWORD *)v203 + 4 * (v204 + 2)) = v333;
                      v207 = v334;
                      if (v334)
                        *(_DWORD *)v334 += 2;
                      *((_QWORD *)v203 + 2 * (v204 + 2) + 1) = v207;
                      *((_DWORD *)v203 + 4 * (v204 + 3)) = v335;
                      v208 = v336;
                      if (v336)
                        *(_DWORD *)v336 += 2;
                      *((_QWORD *)v203 + 2 * (v204 + 3) + 1) = v208;
                      *((_DWORD *)v203 + 4 * (v204 + 4)) = v337;
                      v209 = v338;
                      if (v338)
                        *(_DWORD *)v338 += 2;
                      *((_QWORD *)v203 + 2 * (v204 + 4) + 1) = v209;
                      *((_DWORD *)v203 + 4 * (v204 + 5)) = v339;
                      v210 = v340;
                      if (v340)
                        *(_DWORD *)v340 += 2;
                      *((_QWORD *)v203 + 2 * (v204 + 5) + 1) = v210;
                      *((_DWORD *)v203 + 4 * (v204 + 6)) = v341;
                      v211 = v342;
                      if (v342)
                        *(_DWORD *)v342 += 2;
                      *((_QWORD *)v203 + 2 * (v204 + 6) + 1) = v211;
                      *((_DWORD *)v203 + 4 * (v204 + 7)) = v343;
                      v212 = v344;
                      if (v344)
                        *(_DWORD *)v344 += 2;
                      *((_QWORD *)v203 + 2 * (v204 + 7) + 1) = v212;
                      *((_DWORD *)v203 + 4 * (v204 + 8)) = v345;
                      v213 = v346;
                      if (v346)
                        *(_DWORD *)v346 += 2;
                      *((_QWORD *)v203 + 2 * (v204 + 8) + 1) = v213;
                      *((_DWORD *)v203 + 4 * (v204 + 9)) = v347;
                      v214 = v348[0];
                      if (v348[0])
                        *(_DWORD *)v348[0] += 2;
                      *((_QWORD *)v203 + 2 * (v204 + 9) + 1) = v214;
                      HIDWORD(v317) = v204 + 10;
                      (*(void (**)(uint64_t, $F9635BD25436628440684A9CD771B596 *, uint64_t, WTF::Logger **))(*(_QWORD *)v198 + 16))(v198, v178, 4, &v316);
                      v215 = v316;
                      if (HIDWORD(v317))
                      {
                        v216 = 16 * HIDWORD(v317);
                        v217 = (WTF::StringImpl **)((char *)v316 + 8);
                        do
                        {
                          v218 = *v217;
                          *v217 = 0;
                          if (v218)
                          {
                            if (*(_DWORD *)v218 == 2)
                              WTF::StringImpl::destroy(v218, (WTF::StringImpl *)v190);
                            else
                              *(_DWORD *)v218 -= 2;
                          }
                          v217 += 2;
                          v216 -= 16;
                        }
                        while (v216);
                        v215 = v316;
                        v178 = v295;
                      }
                      if (v215)
                      {
                        v316 = 0;
                        LODWORD(v317) = 0;
                        WTF::fastFree(v215, v190);
                      }
                      v219 = v348[0];
                      v348[0] = 0;
                      if (v219)
                      {
                        if (*(_DWORD *)v219 == 2)
                          WTF::StringImpl::destroy(v219, (WTF::StringImpl *)v190);
                        else
                          *(_DWORD *)v219 -= 2;
                      }
                      v220 = v346;
                      v346 = 0;
                      if (v220)
                      {
                        if (*(_DWORD *)v220 == 2)
                          WTF::StringImpl::destroy(v220, (WTF::StringImpl *)v190);
                        else
                          *(_DWORD *)v220 -= 2;
                      }
                      v221 = v344;
                      v344 = 0;
                      if (v221)
                      {
                        if (*(_DWORD *)v221 == 2)
                          WTF::StringImpl::destroy(v221, (WTF::StringImpl *)v190);
                        else
                          *(_DWORD *)v221 -= 2;
                      }
                      v222 = v342;
                      v342 = 0;
                      if (v222)
                      {
                        if (*(_DWORD *)v222 == 2)
                          WTF::StringImpl::destroy(v222, (WTF::StringImpl *)v190);
                        else
                          *(_DWORD *)v222 -= 2;
                      }
                      v223 = v340;
                      v340 = 0;
                      if (v223)
                      {
                        if (*(_DWORD *)v223 == 2)
                          WTF::StringImpl::destroy(v223, (WTF::StringImpl *)v190);
                        else
                          *(_DWORD *)v223 -= 2;
                      }
                      v224 = v338;
                      v338 = 0;
                      if (v224)
                      {
                        if (*(_DWORD *)v224 == 2)
                          WTF::StringImpl::destroy(v224, (WTF::StringImpl *)v190);
                        else
                          *(_DWORD *)v224 -= 2;
                      }
                      v225 = v336;
                      v336 = 0;
                      if (v225)
                      {
                        if (*(_DWORD *)v225 == 2)
                          WTF::StringImpl::destroy(v225, (WTF::StringImpl *)v190);
                        else
                          *(_DWORD *)v225 -= 2;
                      }
                      v226 = v334;
                      v334 = 0;
                      if (v226)
                      {
                        if (*(_DWORD *)v226 == 2)
                          WTF::StringImpl::destroy(v226, (WTF::StringImpl *)v190);
                        else
                          *(_DWORD *)v226 -= 2;
                      }
                      v227 = v332;
                      v332 = 0;
                      if (v227)
                      {
                        if (*(_DWORD *)v227 == 2)
                          WTF::StringImpl::destroy(v227, (WTF::StringImpl *)v190);
                        else
                          *(_DWORD *)v227 -= 2;
                      }
                      v228 = (WTF::StringImpl *)*((_QWORD *)&buf + 1);
                      *((_QWORD *)&buf + 1) = 0;
                      if (v228)
                      {
                        if (*(_DWORD *)v228 == 2)
                          WTF::StringImpl::destroy(v228, (WTF::StringImpl *)v190);
                        else
                          *(_DWORD *)v228 -= 2;
                      }
                      ++v197;
                    }
                    while (v197 != (uint64_t *)v296);
                  }
                  v229 = __ldxr(v192);
                  if (v229 == 1)
                  {
                    if (!__stlxr(0, v192))
                      break;
                  }
                  else
                  {
                    __clrex();
                  }
                  WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
                  break;
                }
              }
              else
              {
                __clrex();
              }
            }
          }
          v230 = v328;
          v328 = 0;
          if (v230)
          {
            if (*(_DWORD *)v230 == 2)
              WTF::StringImpl::destroy(v230, (WTF::StringImpl *)v190);
            else
              *(_DWORD *)v230 -= 2;
          }
LABEL_425:
          v231 = (WTF::RunLoop *)objc_msgSend(MEMORY[0x1E0CD28B0], "animationDuration");
          v233 = v232;
          WTF::RunLoop::main(v231);
          CFRetain(self);
          v234 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
          *v234 = &off_1E34859D8;
          v234[1] = self;
          v234[2] = self;
          v234[3] = v233;
          *(_QWORD *)&buf = v234;
          WTF::RunLoop::dispatch();
          v235 = buf;
          *(_QWORD *)&buf = 0;
          if (v235)
            (*(void (**)(uint64_t))(*(_QWORD *)v235 + 8))(v235);
          return;
        }
        if (v319)
        {
          v276 = *((_DWORD *)v319 + 4);
          if (!v318 || (v276 & 4) == 0)
          {
            v170 = v169;
            v277 = v169 == 0;
            if ((v276 & 4) != 0)
              goto LABEL_550;
            goto LABEL_574;
          }
        }
        else if (!v318)
        {
          if (!v169)
            goto LABEL_575;
          v148 = 0;
          v149 = 0;
          v170 = v169;
          if ((v169 & 0x80000000) != 0)
            goto LABEL_579;
          goto LABEL_552;
        }
        v170 = v169;
        v277 = v169 == 0;
        if ((*((_BYTE *)v318 + 16) & 4) != 0)
        {
LABEL_550:
          if (v277)
            goto LABEL_575;
          if ((v169 & 0x80000000) != 0)
            goto LABEL_579;
LABEL_552:
          WTF::tryFastCompactMalloc((WTF *)(v170 + 20));
          v171 = buf;
          if ((_QWORD)buf)
          {
            v278 = (_BYTE *)(buf + 20);
            *(_DWORD *)buf = 2;
            *(_DWORD *)(v171 + 4) = v169;
            *(_QWORD *)(v171 + 8) = v171 + 20;
            *(_DWORD *)(v171 + 16) = 4;
            if (v137)
            {
              v279 = (_BYTE *)*((_QWORD *)v137 + 1);
              v280 = *((unsigned int *)v137 + 1);
              if ((*((_BYTE *)v137 + 16) & 4) != 0)
              {
                if ((_DWORD)v280)
                {
                  if ((_DWORD)v280 == 1)
                    *v278 = *v279;
                  else
                    memcpy((void *)(v171 + 20), v279, v280);
                }
              }
              else
              {
                if (v280 < 0x10)
                {
                  v287 = (unsigned __int128 *)(v171 + 20);
                }
                else
                {
                  v287 = (unsigned __int128 *)&v278[v280 & 0xFFFFFFF0];
                  v288 = (unsigned __int128 *)(v171 + 20);
                  do
                  {
                    v289 = (unsigned __int128)vld2q_s8(v279);
                    v279 += 32;
                    *v288++ = v289;
                  }
                  while (v288 != v287);
                }
                while (v287 != (unsigned __int128 *)&v278[v280])
                {
                  v293 = *v279;
                  v279 += 2;
                  *(_BYTE *)v287 = v293;
                  v287 = (unsigned __int128 *)((char *)v287 + 1);
                }
              }
              v281 = *((unsigned int *)v137 + 1);
            }
            else
            {
              v281 = 0;
            }
            v282 = &v278[v281];
            if (v138)
            {
              v283 = (_BYTE *)*((_QWORD *)v138 + 1);
              v284 = *((unsigned int *)v138 + 1);
              if ((*((_BYTE *)v138 + 16) & 4) != 0)
              {
                if ((_DWORD)v284)
                {
                  if ((_DWORD)v284 == 1)
                    *v282 = *v283;
                  else
                    memcpy(v282, v283, v284);
                }
              }
              else
              {
                if (v284 < 0x10)
                {
                  v290 = (unsigned __int128 *)&v278[v281];
                }
                else
                {
                  v290 = (unsigned __int128 *)&v282[v284 & 0xFFFFFFF0];
                  v291 = (unsigned __int128 *)&v278[v281];
                  do
                  {
                    v292 = (unsigned __int128)vld2q_s8(v283);
                    v283 += 32;
                    *v291++ = v292;
                  }
                  while (v291 != v290);
                }
                while (v290 != (unsigned __int128 *)&v282[v284])
                {
                  v294 = *v283;
                  v283 += 2;
                  *(_BYTE *)v290 = v294;
                  v290 = (unsigned __int128 *)((char *)v290 + 1);
                }
              }
              v285 = *((unsigned int *)v138 + 1);
            }
            else
            {
              v285 = 0;
            }
            WTF::stringTypeAdapterAccumulator<unsigned char,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>(&v282[v285], (uint64_t)v139, (uint64_t)v305, (uint64_t)v301, (uint64_t)v299, (uint64_t)v298, (uint64_t)v297, (uint64_t)v148, (uint64_t)v149);
            goto LABEL_290;
          }
          goto LABEL_579;
        }
LABEL_574:
        if (!v277)
          goto LABEL_281;
        goto LABEL_575;
      }
    }
    else
    {
      v150 = 0;
      if (v318)
        goto LABEL_220;
    }
    v151 = 0;
    goto LABEL_221;
  }
  if (-[WebAVPlayerLayer loggerPtr](self, "loggerPtr"))
  {
    if (-[WebAVPlayerLayer logChannel](self, "logChannel"))
    {
      v82 = -[WebAVPlayerLayer loggerPtr](self, "loggerPtr");
      v83 = -[WebAVPlayerLayer logChannel](self, "logChannel");
      v84 = -[WebAVPlayerLayer logIdentifier](self, "logIdentifier");
      buf = 0uLL;
      v331 = "-[WebAVPlayerLayer layoutSublayers]";
      v332 = (WTF::StringImpl *)v84;
      if (v82[12])
      {
        if (v83->var0 && v83->var2 >= 3u)
          WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [50]>((uint64_t)v83, 3u, (WTF::Logger::LogSiteIdentifier *)&buf, "sourceVideoFrame is empty; calling -resolveBounds");
      }
    }
  }
  -[WebAVPlayerLayer resolveBounds](self, "resolveBounds");
}

- (void)resolveBounds
{
  _BYTE *v3;
  $F9635BD25436628440684A9CD771B596 *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  FloatRect *p_targetVideoFrame;
  float v10;
  float v11;
  float v12;
  void *m_ptr;
  _BYTE *v14;
  $F9635BD25436628440684A9CD771B596 *v15;
  _DWORD *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  char *v25;
  unsigned __int8 *v26;
  int v27;
  int v28;
  unint64_t v29;
  _BYTE *v30;
  $F9635BD25436628440684A9CD771B596 *v31;
  _DWORD *v32;
  int v33;
  int v34;
  uint64_t v35;
  unsigned int v36;
  int v37;
  WTF::StringImpl *v38;
  WTF::StringImpl *v39;
  WTF::StringImpl *v40;
  NSObject *var4;
  uint64_t v42;
  void *v43;
  char *v44;
  unsigned __int8 *v45;
  int v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  WTF::JSONImpl::Value *v52;
  WTF::Logger *v53;
  uint64_t v54;
  uint64_t v55;
  _DWORD *v56;
  WTF::Logger *v57;
  $F9635BD25436628440684A9CD771B596 *v58;
  uint64_t v59;
  WTF::StringImpl **v60;
  WTF::StringImpl *v61;
  WTF::StringImpl *v62;
  WTF::StringImpl *v63;
  int v64;
  WTF::StringImpl *v65;
  ThreadSafeWeakPtrControlBlock *v66;
  VideoPresentationModel *m_objectOfCorrectType;
  int v69;
  void *v70;
  uint64_t v71;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  BOOL v76;
  int v77;
  void *v78;
  void *v79;
  RetainPtr<CALayer> *p_videoSublayer;
  id v81;
  __int128 v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  WTF::JSONImpl::Value *v87;
  WTF::Logger *v88;
  uint64_t v89;
  uint64_t v90;
  _DWORD *v91;
  WTF::StringImpl *v92;
  uint64_t v93;
  WTF::Logger *v94;
  uint64_t v95;
  WTF::StringImpl **v96;
  WTF::StringImpl *v97;
  WTF::StringImpl *v98;
  WTF::StringImpl *v99;
  WTF::StringImpl *v100;
  WTF::StringImpl *v101;
  int v102;
  WTF::StringImpl *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _OWORD v107[3];
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  const void *v111;
  CGAffineTransform v112;
  WTF::StringImpl *v113;
  WTF::StringImpl *v114;
  WTF::StringImpl *v115;
  WTF::Logger *v116;
  uint64_t v117;
  WTF::StringImpl *v118;
  WTF::StringImpl *v119;
  WTF::StringImpl *v120;
  WTF::JSONImpl::Value *v121;
  __int128 buf;
  const char *v123;
  _DWORD *v124;
  int v125;
  WTF::StringImpl *v126;
  int v127;
  _QWORD v128[5];

  v128[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_resolveBounds, 0);
  if ((WebAVPlayerLayer *)objc_msgSend(self->_videoSublayer.m_ptr, "superlayer") != self)
  {
    if (-[WebAVPlayerLayer loggerPtr](self, "loggerPtr") && -[WebAVPlayerLayer logChannel](self, "logChannel"))
    {
      v3 = -[WebAVPlayerLayer loggerPtr](self, "loggerPtr");
      v4 = -[WebAVPlayerLayer logChannel](self, "logChannel");
      buf = 0uLL;
      v123 = "-[WebAVPlayerLayer resolveBounds]";
      v124 = -[WebAVPlayerLayer logIdentifier](self, "logIdentifier");
      if (v3[12])
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [49]>((uint64_t)v4, 1u, (WTF::Logger::LogSiteIdentifier *)&buf, "videoSublayer is has another superlayer, bailing");
    }
    return;
  }
  -[CALayer frame](-[WebAVPlayerLayer videoSublayer](self, "videoSublayer"), "frame");
  *(float *)&v8 = v8;
  p_targetVideoFrame = &self->_targetVideoFrame;
  if (vabds_f32(*(float *)&v8, self->_targetVideoFrame.m_location.m_x) >= 0.01)
    goto LABEL_50;
  v10 = v5;
  if (vabds_f32(v10, self->_targetVideoFrame.m_location.m_y) >= 0.01)
    goto LABEL_50;
  v11 = v6;
  if (fabsf(v11 - self->_targetVideoFrame.m_size.m_width) >= 0.01)
    goto LABEL_50;
  v12 = v7;
  if (fabsf(v12 - self->_targetVideoFrame.m_size.m_height) >= 0.01)
    goto LABEL_50;
  m_ptr = self->_videoSublayer.m_ptr;
  if (m_ptr)
    objc_msgSend(m_ptr, "affineTransform");
  else
    memset(&v112, 0, sizeof(v112));
  if (!CGAffineTransformIsIdentity(&v112))
  {
LABEL_50:
    v29 = 0x1E0CD2000uLL;
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.0);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    if (!-[WebAVPlayerLayer loggerPtr](self, "loggerPtr"))
      goto LABEL_127;
    if (!-[WebAVPlayerLayer logChannel](self, "logChannel"))
      goto LABEL_127;
    v30 = -[WebAVPlayerLayer loggerPtr](self, "loggerPtr");
    v31 = -[WebAVPlayerLayer logChannel](self, "logChannel");
    v108 = 0;
    v109 = 0;
    v110 = "-[WebAVPlayerLayer resolveBounds]";
    v111 = -[WebAVPlayerLayer logIdentifier](self, "logIdentifier");
    if (!v30[12] || !v31->var0 || v31->var2 < 4u)
      goto LABEL_127;
    WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)&v108);
    WebCore::FloatRect::toJSONObject((WebCore::FloatRect *)&self->_targetVideoFrame, (uint64_t *)&buf);
    WTF::JSONImpl::Value::toJSONString((WTF::JSONImpl::Value *)buf);
    v32 = (_DWORD *)buf;
    *(_QWORD *)&buf = 0;
    if (v32)
    {
      if (*v32 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v32;
    }
    if (v119)
    {
      v33 = *((_DWORD *)v119 + 1);
      if (v118)
      {
LABEL_60:
        v34 = *((_DWORD *)v118 + 1);
LABEL_61:
        if ((v34 | v33) < 0)
          goto LABEL_230;
        v35 = (v33 + v34);
        if (__OFADD__(v33, v34))
          goto LABEL_230;
        if (v119)
        {
          v36 = *((_DWORD *)v119 + 4);
          v37 = (v36 >> 2) & 1;
          if (!v118 || (v36 & 4) == 0)
            goto LABEL_67;
        }
        else if (!v118)
        {
          v37 = 1;
          goto LABEL_67;
        }
        v37 = (*((unsigned __int8 *)v118 + 16) >> 2) & 1;
LABEL_67:
        WTF::tryMakeStringImplFromAdaptersInternal<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>(v35, v37, (uint64_t)v119, (uint64_t)v118, &buf);
        v120 = (WTF::StringImpl *)buf;
        if (!(_QWORD)buf)
          goto LABEL_230;
        v39 = v118;
        v118 = 0;
        if (v39)
        {
          if (*(_DWORD *)v39 == 2)
            WTF::StringImpl::destroy(v39, v38);
          else
            *(_DWORD *)v39 -= 2;
        }
        v40 = v119;
        v119 = 0;
        if (v40)
        {
          if (*(_DWORD *)v40 == 2)
            WTF::StringImpl::destroy(v40, v38);
          else
            *(_DWORD *)v40 -= 2;
        }
        var4 = v31->var4;
        v42 = os_log_type_enabled(var4, OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)v42)
        {
          WTF::String::utf8();
          v44 = v116 ? (char *)v116 + 16 : 0;
          LODWORD(buf) = 136446210;
          *(_QWORD *)((char *)&buf + 4) = v44;
          _os_log_impl(&dword_1940B8000, var4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
          v42 = (uint64_t)v116;
          v116 = 0;
          if (v42)
          {
            if (*(_DWORD *)v42 == 1)
              v42 = WTF::fastFree((WTF *)v42, v43);
            else
              --*(_DWORD *)v42;
          }
        }
        if (v31->var0 && v31->var2 >= 4u)
        {
          v45 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
          while (1)
          {
            v46 = *v45;
            if ((v46 & 1) != 0)
              break;
            v47 = __ldaxr(v45);
            if (v47 == v46)
            {
              if (!__stxr(v46 | 1, v45))
              {
                v48 = WTF::Logger::observers((WTF::Logger *)v42);
                v49 = *(unsigned int *)(v48 + 12);
                if ((_DWORD)v49)
                {
                  v50 = *(uint64_t **)v48;
                  v106 = *(_QWORD *)v48 + 8 * v49;
                  do
                  {
                    v51 = *v50;
                    LODWORD(buf) = 0;
                    WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)&v108);
                    LODWORD(v123) = 1;
                    WebCore::FloatRect::toJSONObject((WebCore::FloatRect *)&self->_targetVideoFrame, (uint64_t *)&v121);
                    WTF::JSONImpl::Value::toJSONString(v121);
                    v52 = v121;
                    v121 = 0;
                    if (v52)
                    {
                      if (*(_DWORD *)v52 == 1)
                        WTF::JSONImpl::Value::operator delete();
                      else
                        --*(_DWORD *)v52;
                    }
                    v116 = 0;
                    v117 = 0;
                    v53 = (WTF::Logger *)WTF::fastMalloc((WTF *)0x20);
                    LODWORD(v117) = 2;
                    v116 = v53;
                    v54 = HIDWORD(v117);
                    *((_DWORD *)v53 + 4 * HIDWORD(v117)) = buf;
                    v55 = *((_QWORD *)&buf + 1);
                    if (*((_QWORD *)&buf + 1))
                      **((_DWORD **)&buf + 1) += 2;
                    *((_QWORD *)v53 + 2 * v54 + 1) = v55;
                    *((_DWORD *)v53 + 4 * (v54 + 1)) = (_DWORD)v123;
                    v56 = v124;
                    if (v124)
                      *v124 += 2;
                    *((_QWORD *)v53 + 2 * (v54 + 1) + 1) = v56;
                    HIDWORD(v117) = v54 + 2;
                    (*(void (**)(uint64_t, $F9635BD25436628440684A9CD771B596 *, uint64_t, WTF::Logger **))(*(_QWORD *)v51 + 16))(v51, v31, 4, &v116);
                    v57 = v116;
                    if (HIDWORD(v117))
                    {
                      v58 = v31;
                      v59 = 16 * HIDWORD(v117);
                      v60 = (WTF::StringImpl **)((char *)v116 + 8);
                      do
                      {
                        v61 = *v60;
                        *v60 = 0;
                        if (v61)
                        {
                          if (*(_DWORD *)v61 == 2)
                            WTF::StringImpl::destroy(v61, (WTF::StringImpl *)v43);
                          else
                            *(_DWORD *)v61 -= 2;
                        }
                        v60 += 2;
                        v59 -= 16;
                      }
                      while (v59);
                      v57 = v116;
                      v31 = v58;
                    }
                    if (v57)
                    {
                      v116 = 0;
                      LODWORD(v117) = 0;
                      WTF::fastFree(v57, v43);
                    }
                    v62 = (WTF::StringImpl *)v124;
                    v124 = 0;
                    if (v62)
                    {
                      if (*(_DWORD *)v62 == 2)
                        WTF::StringImpl::destroy(v62, (WTF::StringImpl *)v43);
                      else
                        *(_DWORD *)v62 -= 2;
                    }
                    v63 = (WTF::StringImpl *)*((_QWORD *)&buf + 1);
                    *((_QWORD *)&buf + 1) = 0;
                    if (v63)
                    {
                      if (*(_DWORD *)v63 == 2)
                        WTF::StringImpl::destroy(v63, (WTF::StringImpl *)v43);
                      else
                        *(_DWORD *)v63 -= 2;
                    }
                    ++v50;
                  }
                  while (v50 != (uint64_t *)v106);
                }
                v64 = __ldxr(v45);
                if (v64 == 1)
                {
                  v29 = 0x1E0CD2000;
                  if (!__stlxr(0, v45))
                    break;
                }
                else
                {
                  __clrex();
                  v29 = 0x1E0CD2000uLL;
                }
                WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
                break;
              }
            }
            else
            {
              __clrex();
            }
          }
        }
        v65 = v120;
        v120 = 0;
        if (v65)
        {
          if (*(_DWORD *)v65 == 2)
            WTF::StringImpl::destroy(v65, (WTF::StringImpl *)v43);
          else
            *(_DWORD *)v65 -= 2;
        }
LABEL_127:
        v66 = self->_presentationModel.m_controlBlock.m_ptr;
        if (!v66)
          goto LABEL_157;
        m_objectOfCorrectType = self->_presentationModel.m_objectOfCorrectType;
        if (__ldaxr((unsigned __int8 *)v66))
        {
          __clrex();
        }
        else if (!__stxr(1u, (unsigned __int8 *)v66))
        {
LABEL_132:
          if (*((_QWORD *)v66 + 3))
            ++*((_QWORD *)v66 + 1);
          else
            m_objectOfCorrectType = 0;
          v69 = __ldxr((unsigned __int8 *)v66);
          if (v69 == 1)
          {
            if (!__stlxr(0, (unsigned __int8 *)v66))
            {
              if (!m_objectOfCorrectType)
                goto LABEL_157;
LABEL_141:
              (*(void (**)(VideoPresentationModel *, float, float, float, float))(*(_QWORD *)m_objectOfCorrectType
                                                                                           + 40))(m_objectOfCorrectType, 0.0, 0.0, self->_targetVideoFrame.m_size.m_width, self->_targetVideoFrame.m_size.m_height);
              v71 = *((_QWORD *)m_objectOfCorrectType + 1);
              if (__ldaxr((unsigned __int8 *)v71))
              {
                __clrex();
              }
              else if (!__stxr(1u, (unsigned __int8 *)v71))
              {
                goto LABEL_145;
              }
              MEMORY[0x19AEA534C](v71);
LABEL_145:
              v73 = *(_QWORD *)(v71 + 8);
              v74 = v73 - 1;
              *(_QWORD *)(v71 + 8) = v73 - 1;
              if (v73 == 1)
              {
                v104 = *(_QWORD *)(v71 + 16);
                v75 = *(_QWORD *)(v71 + 24);
                *(_QWORD *)(v71 + 24) = 0;
                v76 = v104 != 0;
              }
              else
              {
                v75 = 0;
                v76 = 1;
              }
              v77 = __ldxr((unsigned __int8 *)v71);
              if (v77 == 1)
              {
                if (!__stlxr(0, (unsigned __int8 *)v71))
                {
LABEL_152:
                  if (!v74)
                  {
                    if (v75)
                      (*(void (**)(uint64_t))(*(_QWORD *)v75 + 8))(v75);
                    if (!v76)
                      WTF::fastFree((WTF *)v71, v70);
                  }
                  goto LABEL_157;
                }
              }
              else
              {
                __clrex();
              }
              WTF::Lock::unlockSlow((WTF::Lock *)v71);
              goto LABEL_152;
            }
          }
          else
          {
            __clrex();
          }
          WTF::Lock::unlockSlow((WTF::Lock *)v66);
          if (m_objectOfCorrectType)
            goto LABEL_141;
LABEL_157:
          v78 = self->_videoGravity.m_ptr;
          if (v78)
            CFRetain(self->_videoGravity.m_ptr);
          v79 = self->_previousVideoGravity.m_ptr;
          self->_previousVideoGravity.m_ptr = v78;
          if (v79)
            CFRelease(v79);
          p_videoSublayer = &self->_videoSublayer;
          objc_msgSend(p_videoSublayer->m_ptr, "setAnchorPoint:", 0.5, 0.5);
          v81 = p_videoSublayer->m_ptr;
          v82 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
          v107[0] = *MEMORY[0x1E0C9BAA8];
          v107[1] = v82;
          v107[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
          objc_msgSend(v81, "setAffineTransform:", v107);
          objc_msgSend(p_videoSublayer->m_ptr, "setFrame:", p_targetVideoFrame->m_location.m_x, p_targetVideoFrame->m_location.m_y, p_targetVideoFrame->m_size.m_width, p_targetVideoFrame->m_size.m_height);
          objc_msgSend(*(id *)(v29 + 2224), "commit");
          return;
        }
        MEMORY[0x19AEA534C](v66);
        goto LABEL_132;
      }
    }
    else
    {
      v33 = 0;
      if (v118)
        goto LABEL_60;
    }
    v34 = 0;
    goto LABEL_61;
  }
  if (!-[WebAVPlayerLayer loggerPtr](self, "loggerPtr"))
    return;
  if (!-[WebAVPlayerLayer logChannel](self, "logChannel"))
    return;
  v14 = -[WebAVPlayerLayer loggerPtr](self, "loggerPtr");
  v15 = -[WebAVPlayerLayer logChannel](self, "logChannel");
  v108 = 0;
  v109 = 0;
  v110 = "-[WebAVPlayerLayer resolveBounds]";
  v111 = -[WebAVPlayerLayer logIdentifier](self, "logIdentifier");
  if (!v14[12] || !v15->var0 || v15->var2 < 3u)
    return;
  WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)&v108);
  WTF::String::String((WTF::String *)&v115, "targetVideoFrame (");
  WebCore::FloatRect::toJSONObject((WebCore::FloatRect *)&self->_targetVideoFrame, (uint64_t *)&buf);
  WTF::JSONImpl::Value::toJSONString((WTF::JSONImpl::Value *)buf);
  v16 = (_DWORD *)buf;
  *(_QWORD *)&buf = 0;
  if (v16)
  {
    if (*v16 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v16;
  }
  WTF::String::String((WTF::String *)&v113, ") is equal to videoSublayer.bounds, and affineTransform is identity, bailing");
  v116 = v115;
  v121 = v114;
  *(_QWORD *)&buf = v118;
  v120 = v113;
  WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)&buf, (uint64_t *)&v116, (uint64_t *)&v121, (uint64_t *)&v120, &v119);
  if (!v119)
  {
LABEL_230:
    __break(0xC471u);
    JUMPOUT(0x196838F10);
  }
  v18 = v113;
  v113 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2)
      WTF::StringImpl::destroy(v18, v17);
    else
      *(_DWORD *)v18 -= 2;
  }
  v19 = v114;
  v114 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2)
      WTF::StringImpl::destroy(v19, v17);
    else
      *(_DWORD *)v19 -= 2;
  }
  v20 = v115;
  v115 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2)
      WTF::StringImpl::destroy(v20, v17);
    else
      *(_DWORD *)v20 -= 2;
  }
  v21 = v118;
  v118 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 2)
      WTF::StringImpl::destroy(v21, v17);
    else
      *(_DWORD *)v21 -= 2;
  }
  v22 = v15->var4;
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v23)
  {
    WTF::String::utf8();
    v25 = v116 ? (char *)v116 + 16 : 0;
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = v25;
    _os_log_impl(&dword_1940B8000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
    v23 = (uint64_t)v116;
    v116 = 0;
    if (v23)
    {
      if (*(_DWORD *)v23 == 1)
        v23 = WTF::fastFree((WTF *)v23, v24);
      else
        --*(_DWORD *)v23;
    }
  }
  if (v15->var0 && v15->var2 >= 3u)
  {
    v26 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
    while (1)
    {
      v27 = *v26;
      if ((v27 & 1) != 0)
        break;
      v28 = __ldaxr(v26);
      if (v28 == v27)
      {
        if (!__stxr(v27 | 1, v26))
        {
          v83 = WTF::Logger::observers((WTF::Logger *)v23);
          v84 = *(unsigned int *)(v83 + 12);
          if ((_DWORD)v84)
          {
            v85 = *(uint64_t **)v83;
            v105 = *(_QWORD *)v83 + 8 * v84;
            do
            {
              v86 = *v85;
              LODWORD(buf) = 0;
              WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)&v108);
              LODWORD(v123) = 0;
              WTF::String::String((WTF::String *)&v124, "targetVideoFrame (");
              v125 = 1;
              WebCore::FloatRect::toJSONObject((WebCore::FloatRect *)p_targetVideoFrame, (uint64_t *)&v121);
              WTF::JSONImpl::Value::toJSONString(v121);
              v87 = v121;
              v121 = 0;
              if (v87)
              {
                if (*(_DWORD *)v87 == 1)
                  WTF::JSONImpl::Value::operator delete();
                else
                  --*(_DWORD *)v87;
              }
              v127 = 0;
              WTF::String::String((WTF::String *)v128, ") is equal to videoSublayer.bounds, and affineTransform is identity, bailing");
              v116 = 0;
              v117 = 0;
              v88 = (WTF::Logger *)WTF::fastMalloc((WTF *)0x40);
              LODWORD(v117) = 4;
              v116 = v88;
              v89 = HIDWORD(v117);
              *((_DWORD *)v88 + 4 * HIDWORD(v117)) = buf;
              v90 = *((_QWORD *)&buf + 1);
              if (*((_QWORD *)&buf + 1))
                **((_DWORD **)&buf + 1) += 2;
              *((_QWORD *)v88 + 2 * v89 + 1) = v90;
              *((_DWORD *)v88 + 4 * (v89 + 1)) = (_DWORD)v123;
              v91 = v124;
              if (v124)
                *v124 += 2;
              *((_QWORD *)v88 + 2 * (v89 + 1) + 1) = v91;
              *((_DWORD *)v88 + 4 * (v89 + 2)) = v125;
              v92 = v126;
              if (v126)
                *(_DWORD *)v126 += 2;
              *((_QWORD *)v88 + 2 * (v89 + 2) + 1) = v92;
              *((_DWORD *)v88 + 4 * (v89 + 3)) = v127;
              v93 = v128[0];
              if (v128[0])
                *(_DWORD *)v128[0] += 2;
              *((_QWORD *)v88 + 2 * (v89 + 3) + 1) = v93;
              HIDWORD(v117) = v89 + 4;
              (*(void (**)(uint64_t, $F9635BD25436628440684A9CD771B596 *, uint64_t, WTF::Logger **))(*(_QWORD *)v86 + 16))(v86, v15, 3, &v116);
              v94 = v116;
              if (HIDWORD(v117))
              {
                v95 = 16 * HIDWORD(v117);
                v96 = (WTF::StringImpl **)((char *)v116 + 8);
                do
                {
                  v97 = *v96;
                  *v96 = 0;
                  if (v97)
                  {
                    if (*(_DWORD *)v97 == 2)
                      WTF::StringImpl::destroy(v97, (WTF::StringImpl *)v24);
                    else
                      *(_DWORD *)v97 -= 2;
                  }
                  v96 += 2;
                  v95 -= 16;
                }
                while (v95);
                v94 = v116;
              }
              if (v94)
              {
                v116 = 0;
                LODWORD(v117) = 0;
                WTF::fastFree(v94, v24);
              }
              v98 = (WTF::StringImpl *)v128[0];
              v128[0] = 0;
              if (v98)
              {
                if (*(_DWORD *)v98 == 2)
                  WTF::StringImpl::destroy(v98, (WTF::StringImpl *)v24);
                else
                  *(_DWORD *)v98 -= 2;
              }
              v99 = v126;
              v126 = 0;
              if (v99)
              {
                if (*(_DWORD *)v99 == 2)
                  WTF::StringImpl::destroy(v99, (WTF::StringImpl *)v24);
                else
                  *(_DWORD *)v99 -= 2;
              }
              v100 = (WTF::StringImpl *)v124;
              v124 = 0;
              if (v100)
              {
                if (*(_DWORD *)v100 == 2)
                  WTF::StringImpl::destroy(v100, (WTF::StringImpl *)v24);
                else
                  *(_DWORD *)v100 -= 2;
              }
              v101 = (WTF::StringImpl *)*((_QWORD *)&buf + 1);
              *((_QWORD *)&buf + 1) = 0;
              if (v101)
              {
                if (*(_DWORD *)v101 == 2)
                  WTF::StringImpl::destroy(v101, (WTF::StringImpl *)v24);
                else
                  *(_DWORD *)v101 -= 2;
              }
              ++v85;
            }
            while (v85 != (uint64_t *)v105);
          }
          v102 = __ldxr(v26);
          if (v102 == 1)
          {
            if (!__stlxr(0, v26))
              break;
          }
          else
          {
            __clrex();
          }
          WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
          break;
        }
      }
      else
      {
        __clrex();
      }
    }
  }
  v103 = v119;
  v119 = 0;
  if (v103)
  {
    if (*(_DWORD *)v103 == 2)
      WTF::StringImpl::destroy(v103, (WTF::StringImpl *)v24);
    else
      *(_DWORD *)v103 -= 2;
  }
}

- (void)setVideoGravity:(id)a3
{
  void *m_ptr;
  void *v6;
  void *v7;
  PAL *v8;
  unsigned __int8 v9;
  PAL *v10;
  _BYTE *v11;
  $F9635BD25436628440684A9CD771B596 *v12;
  int v13;
  int v14;
  uint64_t v15;
  unsigned int v16;
  int v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  NSObject *var4;
  uint64_t v22;
  void *v23;
  char *v24;
  unsigned __int8 *v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  WTF::Logger *v33;
  uint64_t v34;
  uint64_t v35;
  WTF::StringImpl *v36;
  WTF::Logger *v37;
  uint64_t v38;
  WTF::StringImpl **v39;
  WTF::StringImpl *v40;
  WTF::StringImpl *v41;
  WTF::StringImpl *v42;
  int v43;
  WTF::StringImpl *v44;
  ThreadSafeWeakPtrControlBlock *v45;
  VideoPresentationModel *m_objectOfCorrectType;
  int v48;
  void *v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  int v56;
  uint64_t v57;
  _QWORD v58[4];
  WTF::Logger *v59;
  uint64_t v60;
  WTF::StringImpl *v61;
  WTF::StringImpl *v62;
  WTF::StringImpl *v63;
  __int128 buf;
  int v65;
  WTF::StringImpl *v66[3];

  v66[2] = *(WTF::StringImpl **)MEMORY[0x1E0C80C00];
  if ((objc_msgSend(self->_videoGravity.m_ptr, "isEqualToString:") & 1) == 0)
  {
    m_ptr = self->_videoGravity.m_ptr;
    if (m_ptr)
      CFRetain(self->_videoGravity.m_ptr);
    v6 = self->_previousVideoGravity.m_ptr;
    self->_previousVideoGravity.m_ptr = m_ptr;
    if (v6)
    {
      CFRelease(v6);
      if (!a3)
      {
LABEL_7:
        v7 = self->_videoGravity.m_ptr;
        self->_videoGravity.m_ptr = a3;
        if (v7)
          CFRelease(v7);
        v8 = (PAL *)objc_msgSend(a3, "isEqualToString:", PAL::get_AVFoundation_AVLayerVideoGravityResize((PAL *)v7));
        if ((v8 & 1) != 0)
        {
          v9 = 0;
        }
        else
        {
          v10 = (PAL *)objc_msgSend(a3, "isEqualToString:", PAL::get_AVFoundation_AVLayerVideoGravityResizeAspect(v8));
          v9 = 1;
          if ((v10 & 1) == 0)
          {
            if (objc_msgSend(a3, "isEqualToString:", PAL::get_AVFoundation_AVLayerVideoGravityResizeAspectFill(v10)))v9 = 2;
            else
              v9 = 1;
          }
        }
        if (!-[WebAVPlayerLayer loggerPtr](self, "loggerPtr"))
          goto LABEL_87;
        if (!-[WebAVPlayerLayer logChannel](self, "logChannel"))
          goto LABEL_87;
        v11 = -[WebAVPlayerLayer loggerPtr](self, "loggerPtr");
        v12 = -[WebAVPlayerLayer logChannel](self, "logChannel");
        v58[0] = 0;
        v58[1] = 0;
        v58[2] = "-[WebAVPlayerLayer setVideoGravity:]";
        v58[3] = -[WebAVPlayerLayer logIdentifier](self, "logIdentifier");
        if (!v11[12] || !v12->var0 || v12->var2 < 3u)
          goto LABEL_87;
        WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v58);
        MEMORY[0x19AEA5508](&v61, objc_msgSend(a3, "description"));
        if (v62)
        {
          v13 = *((_DWORD *)v62 + 1);
          if (v61)
          {
LABEL_22:
            v14 = *((_DWORD *)v61 + 1);
LABEL_23:
            if ((v14 | v13) < 0)
              goto LABEL_128;
            v15 = (v13 + v14);
            if (__OFADD__(v13, v14))
              goto LABEL_128;
            if (v62)
            {
              v16 = *((_DWORD *)v62 + 4);
              v17 = (v16 >> 2) & 1;
              if (v61 && (v16 & 4) != 0)
                goto LABEL_28;
            }
            else
            {
              if (v61)
              {
LABEL_28:
                v17 = (*((unsigned __int8 *)v61 + 16) >> 2) & 1;
                goto LABEL_29;
              }
              v17 = 1;
            }
LABEL_29:
            WTF::tryMakeStringImplFromAdaptersInternal<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>(v15, v17, (uint64_t)v62, (uint64_t)v61, &buf);
            v63 = (WTF::StringImpl *)buf;
            if ((_QWORD)buf)
            {
              v19 = v61;
              v61 = 0;
              if (v19)
              {
                if (*(_DWORD *)v19 == 2)
                  WTF::StringImpl::destroy(v19, v18);
                else
                  *(_DWORD *)v19 -= 2;
              }
              v20 = v62;
              v62 = 0;
              if (v20)
              {
                if (*(_DWORD *)v20 == 2)
                  WTF::StringImpl::destroy(v20, v18);
                else
                  *(_DWORD *)v20 -= 2;
              }
              var4 = v12->var4;
              v22 = os_log_type_enabled(var4, OS_LOG_TYPE_DEFAULT);
              if ((_DWORD)v22)
              {
                WTF::String::utf8();
                v24 = v59 ? (char *)v59 + 16 : 0;
                LODWORD(buf) = 136446210;
                *(_QWORD *)((char *)&buf + 4) = v24;
                _os_log_impl(&dword_1940B8000, var4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
                v22 = (uint64_t)v59;
                v59 = 0;
                if (v22)
                {
                  if (*(_DWORD *)v22 == 1)
                    v22 = WTF::fastFree((WTF *)v22, v23);
                  else
                    --*(_DWORD *)v22;
                }
              }
              if (v12->var0 && v12->var2 >= 3u)
              {
                v25 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
                while (1)
                {
                  v26 = *v25;
                  if ((v26 & 1) != 0)
                    break;
                  v27 = __ldaxr(v25);
                  if (v27 == v26)
                  {
                    if (!__stxr(v26 | 1, v25))
                    {
                      v28 = WTF::Logger::observers((WTF::Logger *)v22);
                      v29 = *(unsigned int *)(v28 + 12);
                      if ((_DWORD)v29)
                      {
                        v30 = *(uint64_t **)v28;
                        v31 = *(_QWORD *)v28 + 8 * v29;
                        do
                        {
                          v32 = *v30;
                          LODWORD(buf) = 0;
                          WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v58);
                          v65 = 0;
                          MEMORY[0x19AEA5508](v66, objc_msgSend(a3, "description"));
                          v59 = 0;
                          v60 = 0;
                          v33 = (WTF::Logger *)WTF::fastMalloc((WTF *)0x20);
                          LODWORD(v60) = 2;
                          v59 = v33;
                          v34 = HIDWORD(v60);
                          *((_DWORD *)v33 + 4 * HIDWORD(v60)) = buf;
                          v35 = *((_QWORD *)&buf + 1);
                          if (*((_QWORD *)&buf + 1))
                            **((_DWORD **)&buf + 1) += 2;
                          *((_QWORD *)v33 + 2 * v34 + 1) = v35;
                          *((_DWORD *)v33 + 4 * (v34 + 1)) = v65;
                          v36 = v66[0];
                          if (v66[0])
                            *(_DWORD *)v66[0] += 2;
                          *((_QWORD *)v33 + 2 * (v34 + 1) + 1) = v36;
                          HIDWORD(v60) = v34 + 2;
                          (*(void (**)(uint64_t, $F9635BD25436628440684A9CD771B596 *, uint64_t, WTF::Logger **))(*(_QWORD *)v32 + 16))(v32, v12, 3, &v59);
                          v37 = v59;
                          if (HIDWORD(v60))
                          {
                            v38 = 16 * HIDWORD(v60);
                            v39 = (WTF::StringImpl **)((char *)v59 + 8);
                            do
                            {
                              v40 = *v39;
                              *v39 = 0;
                              if (v40)
                              {
                                if (*(_DWORD *)v40 == 2)
                                  WTF::StringImpl::destroy(v40, (WTF::StringImpl *)v23);
                                else
                                  *(_DWORD *)v40 -= 2;
                              }
                              v39 += 2;
                              v38 -= 16;
                            }
                            while (v38);
                            v37 = v59;
                          }
                          if (v37)
                          {
                            v59 = 0;
                            LODWORD(v60) = 0;
                            WTF::fastFree(v37, v23);
                          }
                          v41 = v66[0];
                          v66[0] = 0;
                          if (v41)
                          {
                            if (*(_DWORD *)v41 == 2)
                              WTF::StringImpl::destroy(v41, (WTF::StringImpl *)v23);
                            else
                              *(_DWORD *)v41 -= 2;
                          }
                          v42 = (WTF::StringImpl *)*((_QWORD *)&buf + 1);
                          *((_QWORD *)&buf + 1) = 0;
                          if (v42)
                          {
                            if (*(_DWORD *)v42 == 2)
                              WTF::StringImpl::destroy(v42, (WTF::StringImpl *)v23);
                            else
                              *(_DWORD *)v42 -= 2;
                          }
                          ++v30;
                        }
                        while (v30 != (uint64_t *)v31);
                      }
                      v43 = __ldxr(v25);
                      if (v43 == 1)
                      {
                        if (!__stlxr(0, v25))
                          break;
                      }
                      else
                      {
                        __clrex();
                      }
                      WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
                      break;
                    }
                  }
                  else
                  {
                    __clrex();
                  }
                }
              }
              v44 = v63;
              v63 = 0;
              if (v44)
              {
                if (*(_DWORD *)v44 == 2)
                  WTF::StringImpl::destroy(v44, (WTF::StringImpl *)v23);
                else
                  *(_DWORD *)v44 -= 2;
              }
LABEL_87:
              v45 = self->_presentationModel.m_controlBlock.m_ptr;
              if (!v45)
                goto LABEL_117;
              m_objectOfCorrectType = self->_presentationModel.m_objectOfCorrectType;
              if (__ldaxr((unsigned __int8 *)v45))
              {
                __clrex();
              }
              else if (!__stxr(1u, (unsigned __int8 *)v45))
              {
                goto LABEL_92;
              }
              MEMORY[0x19AEA534C](v45);
LABEL_92:
              if (*((_QWORD *)v45 + 3))
                ++*((_QWORD *)v45 + 1);
              else
                m_objectOfCorrectType = 0;
              v48 = __ldxr((unsigned __int8 *)v45);
              if (v48 == 1)
              {
                if (!__stlxr(0, (unsigned __int8 *)v45))
                {
                  if (!m_objectOfCorrectType)
                    goto LABEL_117;
                  goto LABEL_101;
                }
              }
              else
              {
                __clrex();
              }
              WTF::Lock::unlockSlow((WTF::Lock *)v45);
              if (!m_objectOfCorrectType)
                goto LABEL_117;
LABEL_101:
              (*(void (**)(VideoPresentationModel *, _QWORD))(*(_QWORD *)m_objectOfCorrectType + 48))(m_objectOfCorrectType, v9);
              v50 = *((_QWORD *)m_objectOfCorrectType + 1);
              if (__ldaxr((unsigned __int8 *)v50))
              {
                __clrex();
              }
              else if (!__stxr(1u, (unsigned __int8 *)v50))
              {
                goto LABEL_105;
              }
              MEMORY[0x19AEA534C](v50);
LABEL_105:
              v52 = *(_QWORD *)(v50 + 8);
              v53 = v52 - 1;
              *(_QWORD *)(v50 + 8) = v52 - 1;
              if (v52 == 1)
              {
                v57 = *(_QWORD *)(v50 + 16);
                v54 = *(_QWORD *)(v50 + 24);
                *(_QWORD *)(v50 + 24) = 0;
                v55 = v57 != 0;
              }
              else
              {
                v54 = 0;
                v55 = 1;
              }
              v56 = __ldxr((unsigned __int8 *)v50);
              if (v56 == 1)
              {
                if (!__stlxr(0, (unsigned __int8 *)v50))
                {
                  if (!v53)
                    goto LABEL_113;
                  goto LABEL_117;
                }
              }
              else
              {
                __clrex();
              }
              WTF::Lock::unlockSlow((WTF::Lock *)v50);
              if (!v53)
              {
LABEL_113:
                if (v54)
                  (*(void (**)(uint64_t))(*(_QWORD *)v54 + 8))(v54);
                if (!v55)
                  WTF::fastFree((WTF *)v50, v49);
              }
LABEL_117:
              -[WebAVPlayerLayer setNeedsLayout](self, "setNeedsLayout");
              return;
            }
LABEL_128:
            __break(0xC471u);
            return;
          }
        }
        else
        {
          v13 = 0;
          if (v61)
            goto LABEL_22;
        }
        v14 = 0;
        goto LABEL_23;
      }
    }
    else if (!a3)
    {
      goto LABEL_7;
    }
    CFRetain(a3);
    goto LABEL_7;
  }
}

- (NSString)videoGravity
{
  return (NSString *)self->_videoGravity.m_ptr;
}

- (CGRect)videoRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  PAL *v7;
  double v8;
  float v9;
  PAL *v10;
  double v11;
  float v12;
  double v13;
  float v14;
  double v15;
  float v16;
  double v17;
  float v18;
  float v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int v24;
  float v25;
  CGRect result;

  -[WebAVPlayerLayer videoDimensions](self, "videoDimensions");
  if (v3 <= 0.0 || (-[WebAVPlayerLayer videoDimensions](self, "videoDimensions"), v4 <= 0.0))
  {
    -[WebAVPlayerLayer bounds](self, "bounds");
    goto LABEL_12;
  }
  -[WebAVPlayerLayer videoDimensions](self, "videoDimensions");
  v6 = v5;
  v7 = (PAL *)-[WebAVPlayerLayer videoDimensions](self, "videoDimensions");
  v9 = v6 / v8;
  v10 = (PAL *)objc_msgSend((id)PAL::get_AVFoundation_AVLayerVideoGravityResizeAspect(v7), "isEqualToString:", -[WebAVPlayerLayer videoGravity](self, "videoGravity"));
  if (!(_DWORD)v10)
  {
    v24 = objc_msgSend((id)PAL::get_AVFoundation_AVLayerVideoGravityResizeAspectFill(v10), "isEqualToString:", -[WebAVPlayerLayer videoGravity](self, "videoGravity"));
    -[WebAVPlayerLayer bounds](self, "bounds");
    if (!v24)
      goto LABEL_12;
    v12 = v20;
    v14 = v21;
    v16 = v22;
    v18 = v23;
    if ((float)(v16 / v18) > v9)
      goto LABEL_5;
LABEL_10:
    v25 = (float)-(float)(v16 - (float)(v18 * v9)) * 0.5;
    v12 = v12 - v25;
    v16 = v25 + (float)(v25 + v16);
    goto LABEL_11;
  }
  -[WebAVPlayerLayer bounds](self, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  if ((float)(v16 / v18) >= v9)
    goto LABEL_10;
LABEL_5:
  v19 = (float)((float)(v16 / v9) - v18) * 0.5;
  v14 = v14 - v19;
  v18 = v19 + (float)(v19 + v18);
LABEL_11:
  v20 = v12;
  v21 = v14;
  v22 = v16;
  v23 = v18;
LABEL_12:
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

+ (id)keyPathsForValuesAffectingVideoRect
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("videoDimensions"), CFSTR("videoGravity"), 0);
}

- (NSEdgeInsets)legibleContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  NSEdgeInsets result;

  top = self->_legibleContentInsets.top;
  left = self->_legibleContentInsets.left;
  bottom = self->_legibleContentInsets.bottom;
  right = self->_legibleContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLegibleContentInsets:(NSEdgeInsets)a3
{
  self->_legibleContentInsets = a3;
}

- (BOOL)isReadyForDisplay
{
  return self->_readyForDisplay;
}

- (void)setReadyForDisplay:(BOOL)a3
{
  self->_readyForDisplay = a3;
}

- (NSDictionary)pixelBufferAttributes
{
  return self->_pixelBufferAttributes;
}

- (void)setPixelBufferAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  WebAVPlayerLayerPresentationModelClient *value;
  void *m_ptr;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ThreadSafeWeakPtrControlBlock *v9;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;

  value = self->_presentationModelClient.__ptr_.__value_;
  self->_presentationModelClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(WebAVPlayerLayerPresentationModelClient *, SEL))(*(_QWORD *)value + 8))(value, a2);
  m_ptr = self->_previousVideoGravity.m_ptr;
  self->_previousVideoGravity.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v5 = self->_videoGravity.m_ptr;
  self->_videoGravity.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->_captionsLayer.m_ptr;
  self->_captionsLayer.m_ptr = 0;
  if (v6)
    CFRelease(v6);
  v7 = self->_videoSublayer.m_ptr;
  self->_videoSublayer.m_ptr = 0;
  if (v7)
    CFRelease(v7);
  v8 = self->_playerController.m_ptr;
  self->_playerController.m_ptr = 0;
  if (v8)
    CFRelease(v8);
  v9 = self->_presentationModel.m_controlBlock.m_ptr;
  self->_presentationModel.m_controlBlock.m_ptr = 0;
  if (!v9)
    return;
  if (__ldaxr((unsigned __int8 *)v9))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v9))
  {
    goto LABEL_18;
  }
  MEMORY[0x19AEA534C](v9, a2);
LABEL_18:
  v11 = *((_QWORD *)v9 + 2) - 1;
  *((_QWORD *)v9 + 2) = v11;
  if (v11)
  {
    v14 = __ldxr((unsigned __int8 *)v9);
    if (v14 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v9))
        return;
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)v9);
    return;
  }
  v12 = *((_QWORD *)v9 + 1);
  v13 = __ldxr((unsigned __int8 *)v9);
  if (v13 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v9))
    {
      if (!v12)
        goto LABEL_26;
      return;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)v9);
  if (!v12)
LABEL_26:
    WTF::fastFree((WTF *)v9, (void *)a2);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  return self;
}

- (const)logIdentifier
{
  return self->_logIdentifier;
}

- (const)loggerPtr
{
  ThreadSafeWeakPtrControlBlock *m_ptr;
  VideoPresentationModel *m_objectOfCorrectType;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  int v13;
  uint64_t v15;

  m_ptr = self->_presentationModel.m_controlBlock.m_ptr;
  if (!m_ptr)
    return m_ptr;
  m_objectOfCorrectType = self->_presentationModel.m_objectOfCorrectType;
  if (__ldaxr((unsigned __int8 *)m_ptr))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](m_ptr, a2);
LABEL_6:
  if (*((_QWORD *)m_ptr + 3))
    ++*((_QWORD *)m_ptr + 1);
  else
    m_objectOfCorrectType = 0;
  v5 = __ldxr((unsigned __int8 *)m_ptr);
  if (v5 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)m_ptr))
    {
      if (m_objectOfCorrectType)
        goto LABEL_12;
      return 0;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
  if (!m_objectOfCorrectType)
    return 0;
LABEL_12:
  m_ptr = (ThreadSafeWeakPtrControlBlock *)(*(uint64_t (**)(VideoPresentationModel *, SEL))(*(_QWORD *)m_objectOfCorrectType + 272))(m_objectOfCorrectType, a2);
  v7 = *((_QWORD *)m_objectOfCorrectType + 1);
  if (__ldaxr((unsigned __int8 *)v7))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v7))
  {
    goto LABEL_19;
  }
  MEMORY[0x19AEA534C](v7);
LABEL_19:
  v9 = *(_QWORD *)(v7 + 8);
  v10 = v9 - 1;
  *(_QWORD *)(v7 + 8) = v9 - 1;
  if (v9 == 1)
  {
    v15 = *(_QWORD *)(v7 + 16);
    v11 = *(_QWORD *)(v7 + 24);
    *(_QWORD *)(v7 + 24) = 0;
    v12 = v15 != 0;
  }
  else
  {
    v11 = 0;
    v12 = 1;
  }
  v13 = __ldxr((unsigned __int8 *)v7);
  if (v13 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v7))
    {
      if (v10)
        return m_ptr;
      goto LABEL_27;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)v7);
  if (v10)
    return m_ptr;
LABEL_27:
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  if (!v12)
    WTF::fastFree((WTF *)v7, v6);
  return m_ptr;
}

- ($F9635BD25436628440684A9CD771B596)logChannel
{
  return ($F9635BD25436628440684A9CD771B596 *)&WebCore::LogFullscreen;
}

- (_QWORD)layoutSublayers
{
  const void *v2;

  *a1 = &off_1E34859D8;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)layoutSublayers
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 8), sel_resolveBounds, 0);
  return objc_msgSend(*(id *)(a1 + 8), "performSelector:withObject:afterDelay:", sel_resolveBounds, 0, *(double *)(a1 + 24) + 0.1);
}

@end
