@implementation OZFxPlugParameterHandler_v4

- (BOOL)addFontMenuWithName:(id)a3 parmId:(unsigned int)a4 fontName:(id)a5 parmFlags:(unsigned int)a6
{
  uint64_t v6;
  _BOOL4 v11;
  OZChannelFont *v12;
  _QWORD *folderStack;
  unint64_t v14;
  uint64_t **channelMap;
  uint64_t **v16;
  uint64_t v18;
  PCString v19;

  v6 = *(_QWORD *)&a6;
  LODWORD(v18) = a4;
  v11 = -[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(_QWORD *)&a4, 1, 1, v18);
  if (v11)
  {
    v12 = (OZChannelFont *)operator new();
    PCURL::PCURL((PCURL *)&v19, a3);
    folderStack = self->super._folderStack;
    v14 = folderStack[5] + folderStack[4] - 1;
    OZChannelFont::OZChannelFont(v12, &v19, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v14 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v14 & 0x1FF)), a4, 0);
    PCString::~PCString(&v19);
    v19.var0 = 0;
    PCString::set(&v19, (CFStringRef)a5);
    OZChannelFontBase::setFontChannelWithName(v12, &v19);
    PCString::~PCString(&v19);
    -[OZFxPlugParameterHandler setParameterFlags:forChannel:](self, "setParameterFlags:forChannel:", v6, v12);
    if (self->super._postAddParameters)
    {
      -[OZFxPlugParameterHandler markForDynamicParameterUsage](self, "markForDynamicParameterUsage");
      -[OZFxPlugParameterHandler removeHiddenParameters](self, "removeHiddenParameters");
    }
    channelMap = (uint64_t **)self->super._channelMap;
    v19.var0 = (__CFString *)&v18;
    std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, (unsigned int *)&v18, (uint64_t)&std::piecewise_construct, &v19)[5] = (uint64_t *)v12;
    v19.var0 = (__CFString *)&v18;
    v16 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&self->super._paramCreationMap, (unsigned int *)&v18, (uint64_t)&std::piecewise_construct, &v19);
    v16[5] = (uint64_t *)FontTransactionFactory;
    v16[6] = (uint64_t *)FontRetrieval;
    v16[7] = 0;
    if (self->super._postAddParameters)
      -[OZFxPlugParameterHandler reAddHiddenParameters](self, "reAddHiddenParameters");
  }
  return v11;
}

- (BOOL)addPushButtonWithName:(id)a3 parmId:(unsigned int)a4 selector:(SEL)a5 parmFlags:(unsigned int)a6
{
  uint64_t v6;
  _BOOL4 v11;
  BOOL result;
  OZChannelButton *v13;
  _QWORD *folderStack;
  unint64_t v15;
  __shared_weak_count *cntrl;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  void **isa;
  unsigned __int8 v23;
  const __CFString *v24;
  PCString v25;
  uint64_t **channelMap;
  uint64_t **v27;
  _QWORD *v28;
  unint64_t v29;
  uint64_t v30;
  PCString v31;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v33;
  PCString v34;
  unsigned int v35;
  unsigned int *v36;

  v6 = *(_QWORD *)&a6;
  v35 = a4;
  LODWORD(v30) = a6;
  v11 = -[OZFxPlugParameterHandler _intParameter:hasValidMin:max:sliderMin:sliderMax:defaultValue:paramFlags:](self, "_intParameter:hasValidMin:max:sliderMin:sliderMax:defaultValue:paramFlags:", *(_QWORD *)&a4, 0, 1, 0, 1, 0, v30);
  result = 0;
  if (v11 && a4 - 1 <= 0x270D)
  {
    v13 = (OZChannelButton *)operator new();
    PCURL::PCURL((PCURL *)&v34, a3);
    folderStack = self->super._folderStack;
    v15 = folderStack[5] + folderStack[4] - 1;
    OZChannelButton::OZChannelButton(v13, &v34, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v15 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v15 & 0x1FF)), a4, 0);
    PCString::~PCString(&v34);
    cntrl = self->super._fxPlugLock.__cntrl_;
    ptr = self->super._fxPlugLock.__ptr_;
    v33 = cntrl;
    if (cntrl)
    {
      v17 = (unint64_t *)((char *)cntrl + 8);
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
    OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v34, (uint64_t)&ptr);
    v19 = (std::__shared_weak_count *)v33;
    if (v33)
    {
      v20 = (unint64_t *)((char *)v33 + 8);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    isa = (void **)v34.var0->isa;
    if (!v34.var0->isa || (v23 = atomic_load((unsigned __int8 *)&self->super._pluginRemoved), (v23 & 1) != 0))
    {
      v28 = self->super._folderStack;
      v29 = v28[5] + v28[4] - 1;
      if (!*(_QWORD *)(*(_QWORD *)(v28[1] + ((v29 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v29 & 0x1FF)))
        (*((void (**)(OZChannelButton *))v13->var0 + 1))(v13);
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v34);
      return 0;
    }
    else
    {
      v24 = (const __CFString *)NSStringFromSelector(a5);
      v31.var0 = 0;
      PCString::set(&v31, v24);
      v25.var0 = (__CFString *)&v31;
      OZChannelButton::setCallbackSelectorAsString(v13, v25, isa[3]);
      PCString::~PCString(&v31);
      (*((void (**)(OZChannelButton *, _QWORD))v13->var0 + 36))(v13, 0);
      -[OZFxPlugParameterHandler setParameterFlags:forChannel:](self, "setParameterFlags:forChannel:", v6, v13);
      (*((void (**)(OZChannelButton *, _QWORD, _QWORD))v13->var0 + 63))(v13, 0, 0);
      if (self->super._postAddParameters)
      {
        -[OZFxPlugParameterHandler markForDynamicParameterUsage](self, "markForDynamicParameterUsage");
        -[OZFxPlugParameterHandler removeHiddenParameters](self, "removeHiddenParameters");
      }
      channelMap = (uint64_t **)self->super._channelMap;
      v36 = &v35;
      std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &v35, (uint64_t)&std::piecewise_construct, &v36)[5] = (uint64_t *)v13;
      v36 = &v35;
      v27 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&self->super._paramCreationMap, &v35, (uint64_t)&std::piecewise_construct, &v36);
      v27[5] = (uint64_t *)PushButtonTransactionFactory;
      v27[6] = (uint64_t *)NoOpRetrieval;
      v27[7] = 0;
      if (self->super._postAddParameters)
        -[OZFxPlugParameterHandler reAddHiddenParameters](self, "reAddHiddenParameters");
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v34);
      return 1;
    }
  }
  return result;
}

- (BOOL)addHelpButtonWithName:(id)a3 parmId:(unsigned int)a4 selector:(SEL)a5 parmFlags:(unsigned int)a6
{
  uint64_t v6;
  _BOOL4 v11;
  BOOL result;
  OZChannelHelpButton *v13;
  _QWORD *folderStack;
  unint64_t v15;
  __shared_weak_count *cntrl;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  void **isa;
  unsigned __int8 v23;
  const __CFString *v24;
  PCString v25;
  uint64_t **channelMap;
  uint64_t **v27;
  _QWORD *v28;
  unint64_t v29;
  uint64_t v30;
  PCString v31;
  OZFxPlugSharedLock *ptr;
  __shared_weak_count *v33;
  PCString v34;
  unsigned int v35;
  unsigned int *v36;

  v6 = *(_QWORD *)&a6;
  v35 = a4;
  LODWORD(v30) = a6;
  v11 = -[OZFxPlugParameterHandler _intParameter:hasValidMin:max:sliderMin:sliderMax:defaultValue:paramFlags:](self, "_intParameter:hasValidMin:max:sliderMin:sliderMax:defaultValue:paramFlags:", *(_QWORD *)&a4, 0, 1, 0, 1, 0, v30);
  result = 0;
  if (v11 && a4 - 1 <= 0x270D)
  {
    v13 = (OZChannelHelpButton *)operator new();
    PCURL::PCURL((PCURL *)&v34, a3);
    folderStack = self->super._folderStack;
    v15 = folderStack[5] + folderStack[4] - 1;
    OZChannelHelpButton::OZChannelHelpButton(v13, &v34, *(OZChannelFolder **)(*(_QWORD *)(folderStack[1] + ((v15 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v15 & 0x1FF)), a4, 0);
    PCString::~PCString(&v34);
    cntrl = self->super._fxPlugLock.__cntrl_;
    ptr = self->super._fxPlugLock.__ptr_;
    v33 = cntrl;
    if (cntrl)
    {
      v17 = (unint64_t *)((char *)cntrl + 8);
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
    OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v34, (uint64_t)&ptr);
    v19 = (std::__shared_weak_count *)v33;
    if (v33)
    {
      v20 = (unint64_t *)((char *)v33 + 8);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    isa = (void **)v34.var0->isa;
    if (!v34.var0->isa || (v23 = atomic_load((unsigned __int8 *)&self->super._pluginRemoved), (v23 & 1) != 0))
    {
      v28 = self->super._folderStack;
      v29 = v28[5] + v28[4] - 1;
      if (!*(_QWORD *)(*(_QWORD *)(v28[1] + ((v29 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v29 & 0x1FF)))
        (*(void (**)(OZChannelHelpButton *))(*(_QWORD *)v13 + 8))(v13);
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v34);
      return 0;
    }
    else
    {
      v24 = (const __CFString *)NSStringFromSelector(a5);
      v31.var0 = 0;
      PCString::set(&v31, v24);
      v25.var0 = (__CFString *)&v31;
      OZChannelButton::setCallbackSelectorAsString((OZChannelButton *)v13, v25, isa[3]);
      PCString::~PCString(&v31);
      (*(void (**)(OZChannelHelpButton *, _QWORD))(*(_QWORD *)v13 + 288))(v13, 0);
      -[OZFxPlugParameterHandler setParameterFlags:forChannel:](self, "setParameterFlags:forChannel:", v6, v13);
      (*(void (**)(OZChannelHelpButton *, _QWORD, _QWORD))(*(_QWORD *)v13 + 504))(v13, 0, 0);
      if (self->super._postAddParameters)
      {
        -[OZFxPlugParameterHandler markForDynamicParameterUsage](self, "markForDynamicParameterUsage");
        -[OZFxPlugParameterHandler removeHiddenParameters](self, "removeHiddenParameters");
      }
      channelMap = (uint64_t **)self->super._channelMap;
      v36 = &v35;
      std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &v35, (uint64_t)&std::piecewise_construct, &v36)[5] = (uint64_t *)v13;
      v36 = &v35;
      v27 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&self->super._paramCreationMap, &v35, (uint64_t)&std::piecewise_construct, &v36);
      v27[5] = (uint64_t *)PushButtonTransactionFactory;
      v27[6] = (uint64_t *)NoOpRetrieval;
      v27[7] = 0;
      if (self->super._postAddParameters)
        -[OZFxPlugParameterHandler reAddHiddenParameters](self, "reAddHiddenParameters");
      OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v34);
      return 1;
    }
  }
  return result;
}

- (BOOL)_getFontName:(id *)a3 fromParm:(unsigned int)a4 atTime:(id)a5
{
  OZChannelBase *v7;
  id v9;

  v7 = -[OZFxPlugParameterHandler channelForParameterID:](self, "channelForParameterID:", *(_QWORD *)&a4);
  if (v7)
  {
    if (self)
      -[OZFxPlugParameterHandler motionEffectRef](self, "motionEffectRef");
    else
      v9 = 0;
    *a3 = (id)PCString::ns_str((PCString *)&v7[5].var11);
    ProCore_Impl::PCNSRefImpl::release(&v9);
  }
  return v7 != 0;
}

- (BOOL)getFontName:(id *)a3 fromParm:(unsigned int)a4 atTime:(double)a5
{
  return -[OZFxPlugParameterHandler_v4 _getFontName:fromParm:atTime:](self, "_getFontName:fromParm:atTime:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

- (BOOL)getRGBABitmap:(id *)a3 layerOffsetX:(double *)a4 layerOffsetY:(double *)a5 requestInfo:(id *)a6 fromParameter:(unsigned int)a7 atTime:(id)a8
{
  __int128 v8;
  uint64_t v10;
  uint64_t v11;
  _OWORD v12[3];

  v8 = *(_OWORD *)&a6->var2;
  v12[0] = *(_OWORD *)&a6->var0.var0;
  v12[1] = v8;
  v12[2] = *(_OWORD *)&a6->var4;
  LOBYTE(v11) = 1;
  LOBYTE(v10) = 0;
  return -[OZFxPlugParameterHandler retrieveImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:retriever:ARGB:imageType:forAnalysis:](self, "retrieveImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:retriever:ARGB:imageType:forAnalysis:", a3, a4, a5, v12, *(_QWORD *)&a7, a8.var1, sel_textureRetriever_, v10, 1, v11);
}

- (BOOL)getBitmap:(id *)a3 layerOffsetX:(double *)a4 layerOffsetY:(double *)a5 requestInfo:(id *)a6 fromParm:(unsigned int)a7 atFxTime:(id)a8
{
  __int128 v8;
  uint64_t v10;
  uint64_t v11;
  _OWORD v12[3];

  v8 = *(_OWORD *)&a6->var2;
  v12[0] = *(_OWORD *)&a6->var0.var0;
  v12[1] = v8;
  v12[2] = *(_OWORD *)&a6->var4;
  LOBYTE(v11) = 0;
  LOBYTE(v10) = 1;
  return -[OZFxPlugParameterHandler retrieveImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:retriever:ARGB:imageType:forAnalysis:](self, "retrieveImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:retriever:ARGB:imageType:forAnalysis:", a3, a4, a5, v12, *(_QWORD *)&a7, a8.var1, sel_textureRetriever_, v10, 1, v11);
}

- (BOOL)getTexture:(id *)a3 layerOffsetX:(double *)a4 layerOffsetY:(double *)a5 requestInfo:(id *)a6 fromParm:(unsigned int)a7 atFxTime:(id)a8
{
  __int128 v8;
  uint64_t v10;
  uint64_t v11;
  _OWORD v12[3];

  v8 = *(_OWORD *)&a6->var2;
  v12[0] = *(_OWORD *)&a6->var0.var0;
  v12[1] = v8;
  v12[2] = *(_OWORD *)&a6->var4;
  LOBYTE(v11) = 0;
  LOBYTE(v10) = 1;
  return -[OZFxPlugParameterHandler retrieveImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:retriever:ARGB:imageType:forAnalysis:](self, "retrieveImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:retriever:ARGB:imageType:forAnalysis:", a3, a4, a5, v12, *(_QWORD *)&a7, a8.var1, sel_textureRetriever_, v10, 2, v11);
}

- (BOOL)getCustomParameterValue:(id *)a3 fromParm:(unsigned int)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OZFxPlugParameterHandler_v4;
  return -[OZFxPlugParameterHandler getCustomParameterValue:fromParm:](&v5, sel_getCustomParameterValue_fromParm_, a3, *(_QWORD *)&a4);
}

- (BOOL)getParameterFlags:(unsigned int *)a3 fromParm:(unsigned int)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OZFxPlugParameterHandler_v4;
  return -[OZFxPlugParameterHandler getParameterFlags:fromParm:](&v5, sel_getParameterFlags_fromParm_, a3, *(_QWORD *)&a4);
}

- (BOOL)getStringParameterValue:(id *)a3 fromParm:(unsigned int)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OZFxPlugParameterHandler_v4;
  return -[OZFxPlugParameterHandler getStringParameterValue:fromParm:](&v5, sel_getStringParameterValue_fromParm_, a3, *(_QWORD *)&a4);
}

- (BOOL)setCustomParameterValue:(id)a3 toParm:(unsigned int)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OZFxPlugParameterHandler_v4;
  return -[OZFxPlugParameterHandler setCustomParameterValue:toParm:](&v5, sel_setCustomParameterValue_toParm_, a3, *(_QWORD *)&a4);
}

- (BOOL)setParameterFlags:(unsigned int)a3 toParm:(unsigned int)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OZFxPlugParameterHandler_v4;
  return -[OZFxPlugParameterHandler setParameterFlags:toParm:](&v5, sel_setParameterFlags_toParm_, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (BOOL)addFlags:(unsigned int)a3 toParm:(unsigned int)a4
{
  uint64_t v4;
  _BOOL4 v7;
  BOOL result;
  int v9;

  v4 = *(_QWORD *)&a4;
  v9 = 0;
  v7 = -[OZFxPlugParameterHandler_v4 getParameterFlags:fromParm:](self, "getParameterFlags:fromParm:", &v9);
  result = 0;
  if (v7)
    return -[OZFxPlugParameterHandler_v4 setParameterFlags:toParm:](self, "setParameterFlags:toParm:", v9 | a3, v4);
  return result;
}

- (BOOL)removeFlags:(unsigned int)a3 fromParm:(unsigned int)a4
{
  uint64_t v4;
  _BOOL4 v7;
  BOOL result;
  int v9;

  v4 = *(_QWORD *)&a4;
  v9 = 0;
  v7 = -[OZFxPlugParameterHandler_v4 getParameterFlags:fromParm:](self, "getParameterFlags:fromParm:", &v9);
  result = 0;
  if (v7)
    return -[OZFxPlugParameterHandler_v4 setParameterFlags:toParm:](self, "setParameterFlags:toParm:", v9 & ~a3, v4);
  return result;
}

- (BOOL)setStringParameterValue:(id)a3 toParm:(unsigned int)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OZFxPlugParameterHandler_v4;
  return -[OZFxPlugParameterHandler setStringParameterValue:toParm:](&v5, sel_setStringParameterValue_toParm_, a3, *(_QWORD *)&a4);
}

- (BOOL)getHistogramBlackIn:(double *)a3 BlackOut:(double *)a4 WhiteIn:(double *)a5 WhiteOut:(double *)a6 Gamma:(double *)a7 forChannel:(unint64_t)a8 fromParm:(unsigned int)a9 atFxTime:(id)a10
{
  return -[OZFxPlugParameterHandler _getHistogramBlackIn:BlackOut:WhiteIn:WhiteOut:Gamma:forChannel:fromParm:atTime:](self, "_getHistogramBlackIn:BlackOut:WhiteIn:WhiteOut:Gamma:forChannel:fromParm:atTime:", a3, a4, a5, a6, a7, a8);
}

- (BOOL)getGradientStartEnd:(double *)a3 startY:(double *)a4 endX:(double *)a5 endY:(double *)a6 type:(int *)a7 fromParm:(unsigned int)a8 atFxTime:(id)a9
{
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OZFxPlugParameterHandler_v4;
  return -[OZFxPlugParameterHandler getGradientStartEnd:startY:endX:endY:type:fromParm:atTime:](&v10, sel_getGradientStartEnd_startY_endX_endY_type_fromParm_atTime_, a3, a4, a5, a6, a7, *(_QWORD *)&a8, a9.var1);
}

- (id)pushButtonSelectorNameForParameterID:(unsigned int)a3
{
  _QWORD *channelMap;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  unsigned int v8;
  BOOL v9;
  char **v10;
  const void *v11;
  const PCString *v12;
  const __CFString *v13;
  PCString v15;

  channelMap = self->super._channelMap;
  v6 = (char *)channelMap[1];
  v4 = (char *)(channelMap + 1);
  v5 = v6;
  if (!v6)
    return 0;
  v7 = v4;
  do
  {
    v8 = *((_DWORD *)v5 + 8);
    v9 = v8 >= a3;
    if (v8 >= a3)
      v10 = (char **)v5;
    else
      v10 = (char **)(v5 + 8);
    if (v9)
      v7 = v5;
    v5 = *v10;
  }
  while (*v10);
  if (v7 == v4)
    return 0;
  if (*((_DWORD *)v7 + 8) > a3)
    return 0;
  v11 = (const void *)*((_QWORD *)v7 + 5);
  if (!v11)
    return 0;
  if (!v12)
    return 0;
  PCString::PCString(&v15, v12 + 20);
  v13 = PCString::ns_str(&v15);
  PCString::~PCString(&v15);
  return (id)v13;
}

- (BOOL)imageSize:(CGSize *)a3 fromParameter:(unsigned int)a4 atTime:(id *)a5
{
  return 0;
}

@end
