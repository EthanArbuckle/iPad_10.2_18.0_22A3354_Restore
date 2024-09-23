@implementation PAEStyleTransfer

+ (BOOL)hasEspressoVersion
{
  return (int)objc_msgSend(MEMORY[0x1E0D1F4F0], "featureVersion") > 0;
}

- (id)_bundleForFilter
{
  void *v2;
  id result;
  uint64_t v4;

  v2 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4618);
  v4 = 0;
  objc_msgSend(v2, "getStringParameterValue:fromParm:", &v4, 3);
  result = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", v4);
  if (!result)
    return (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  return result;
}

- (id)_modelPath:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = -[PAEStyleTransfer _bundleForFilter](self, "_bundleForFilter");
  v6 = (void *)objc_msgSend(v5, "pathForResource:ofType:", a3, CFSTR("net"));
  if (v6 && (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v6) & 1) != 0)
  {
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v5, "pathForResource:ofType:", a3, CFSTR("shape"))) & 1) != 0)
    {
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v5, "pathForResource:ofType:", a3, CFSTR("weights"))) & 1) != 0)return v6;
      v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: In %s %d, neural style transfer %@ weights file not found."), "/Library/Caches/com.apple.xbs/Sources/FiltersiOS/Filters/PAEStyleTransfer.mm", 149, a3);
    }
    else
    {
      v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: In %s %d, neural style transfer %@ shape file not found."), "/Library/Caches/com.apple.xbs/Sources/FiltersiOS/Filters/PAEStyleTransfer.mm", 145, a3);
    }
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: In %s %d, neural style transfer %@ model file not found."), "/Library/Caches/com.apple.xbs/Sources/FiltersiOS/Filters/PAEStyleTransfer.mm", 141, a3);
  }
  if (v7)
  {
    if (kLogLevel >= 2 * !self->_firstModelLoadLog)
      NSLog(CFSTR("%@"), v7);
    v6 = 0;
    self->_firstModelLoadLog = 0;
  }
  return v6;
}

- (id)pathForGPUSettings
{
  void *v2;

  v2 = (void *)objc_msgSend(-[PAEStyleTransfer _bundleForFilter](self, "_bundleForFilter"), "pathForResource:ofType:", CFSTR("StyleTransfer"), CFSTR("settings"));
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v2))
    return v2;
  else
    return 0;
}

- (void)registerGPUDefaults
{
  uint64_t block;
  uint64_t v4;
  void (*v5)(uint64_t);
  void *v6;
  PAEStyleTransfer *v7;

  if (!self->_gpuDefaultsLoaded)
  {
    if ((kLogLevel & 0x80000000) == 0)
      NSLog(CFSTR("%@"), a2, CFSTR("Loading defaults..."));
    self->_modelName = (NSString *)&stru_1E65EDDA0;
    block = MEMORY[0x1E0C809B0];
    v4 = 3221225472;
    v5 = __39__PAEStyleTransfer_registerGPUDefaults__block_invoke;
    v6 = &unk_1E64DFA00;
    v7 = self;
    if (-[PAEStyleTransfer registerGPUDefaults]::onceToken != -1)
      dispatch_once(&-[PAEStyleTransfer registerGPUDefaults]::onceToken, &block);
    self->_currentQualityLevel = 0;
    self->_currentAspectRatio = 1.0;
    self->_gpuDefaultsLoaded = 1;
    if ((-[PAEStyleTransfer registerGPUDefaults]::sLoadedDefaults & 1) == 0 && (kLogLevel & 0x80000000) == 0)
      NSLog(CFSTR("%@"), CFSTR("WARNING: GPU defaults were  not actually loaded for Style Transfer. "), block, v4, v5, v6, v7);
  }
}

void __39__PAEStyleTransfer_registerGPUDefaults__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "pathForGPUSettings") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D1F4F0], "performSelector:withObject:", sel_loadStylesConfigAtPath_, objc_msgSend(*(id *)(a1 + 32), "pathForGPUSettings"));
    if ((kLogLevel & 0x80000000) == 0)
      NSLog(CFSTR("%@"), CFSTR("GPU Defaults Loaded..."));
    -[PAEStyleTransfer registerGPUDefaults]::sLoadedDefaults = 1;
  }
}

- (void)setupGPUNetwork
{
  void *v3;
  id v4;

  v4 = MTLCreateSystemDefaultDevice();
  v3 = (void *)objc_msgSend(v4, "newCommandQueue");
  self->_gpuNetwork = (EspressoImage2Image *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F4F0]), "initWithQueue:", v3);

}

- (id)gpuModelPath:(id)a3
{
  return -[PAEStyleTransfer _modelPath:](self, "_modelPath:", objc_msgSend(a3, "stringByAppendingString:", CFSTR(".espresso")));
}

- (BOOL)loadGPUModel:(id)a3
{
  TwoNetsStyleTransfer *aneNetwork;
  id v6;
  id v7;
  int v8;
  uint64_t v9;

  aneNetwork = self->_aneNetwork;
  if (aneNetwork)
  {

    self->_aneNetwork = 0;
    HStyleTransfer_ANE::RenderContext::ReleaseRenderContext(&self->_aneRenderContext.m_Obj);
    self->_firstModelLoadLog = 1;
  }
  v6 = -[PAEStyleTransfer gpuModelPath:](self, "gpuModelPath:", a3);
  if (v6)
  {
    v7 = v6;
    self->_modelName = (NSString *)a3;
    if (!self->_gpuNetwork)
      -[PAEStyleTransfer setupGPUNetwork](self, "setupGPUNetwork");
    v8 = -[EspressoImage2Image load:resolutionPreset:](-[PAEStyleTransfer gpuNetwork](self, "gpuNetwork"), "load:resolutionPreset:", v7, -[PAEStyleTransfer currentQualityLevel](self, "currentQualityLevel"));
    if (v8)
    {
      printf("Espresso error: %d at line %s:%d\n", v8, "/Library/Caches/com.apple.xbs/Sources/FiltersiOS/Filters/PAEStyleTransfer.mm", 273);
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: In %s %d, neural style transfer %@ shape failed to load GPU Model."), "/Library/Caches/com.apple.xbs/Sources/FiltersiOS/Filters/PAEStyleTransfer.mm", 276, a3);
      if ((kLogLevel & 0x80000000) == 0)
        NSLog(CFSTR("%@"), v9);
    }
  }
  return 1;
}

- (id)aneModelPath:(id)a3
{
  return -[PAEStyleTransfer _modelPath:](self, "_modelPath:", objc_msgSend(a3, "stringByAppendingString:", CFSTR("_ANE_HQ.espresso")));
}

- (BOOL)loadANEModel:(id)a3
{
  EspressoImage2Image *gpuNetwork;
  TwoNetsStyleTransfer *aneNetwork;
  RenderContext *m_Obj;
  RenderContext *v8;
  id v9;
  id v10;
  int v11;
  uint64_t v12;
  RenderContext *v14;

  gpuNetwork = self->_gpuNetwork;
  if (gpuNetwork)
  {

    self->_gpuNetwork = 0;
    self->_firstModelLoadLog = 1;
  }
  aneNetwork = self->_aneNetwork;
  if (aneNetwork)
  {

    self->_aneNetwork = 0;
    self->_firstModelLoadLog = 1;
  }
  if (!self->_aneRenderContext.m_Obj)
  {
    HStyleTransfer_ANE::RenderContext::GetRetainedRenderContext((HGObject **)&v14);
    m_Obj = self->_aneRenderContext.m_Obj;
    v8 = v14;
    if (m_Obj == v14)
    {
      if (m_Obj)
        (*(void (**)(RenderContext *))(*(_QWORD *)m_Obj + 24))(m_Obj);
    }
    else
    {
      if (m_Obj)
      {
        (*(void (**)(RenderContext *))(*(_QWORD *)m_Obj + 24))(m_Obj);
        v8 = v14;
      }
      self->_aneRenderContext.m_Obj = v8;
    }
  }
  v9 = -[PAEStyleTransfer aneModelPath:](self, "aneModelPath:", a3);
  if (v9)
  {
    v10 = v9;
    self->_modelName = (NSString *)a3;
    self->_aneNetwork = (TwoNetsStyleTransfer *)objc_alloc_init(MEMORY[0x1E0D1F500]);
    v11 = -[TwoNetsStyleTransfer load:outputName:](-[PAEStyleTransfer aneNetwork](self, "aneNetwork"), "load:outputName:", v10, CFSTR("output-ane"));
    if (v11)
    {
      printf("Espresso error: %d at line %s:%d\n", v11, "/Library/Caches/com.apple.xbs/Sources/FiltersiOS/Filters/PAEStyleTransfer.mm", 334);
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: In %s %d, neural style transfer %@ shape failed to load for ANE."), "/Library/Caches/com.apple.xbs/Sources/FiltersiOS/Filters/PAEStyleTransfer.mm", 337, a3);
      if ((kLogLevel & 0x80000000) == 0)
        NSLog(CFSTR("%@"), v12);
    }
  }
  return 1;
}

- (PAEStyleTransfer)initWithAPIManager:(id)a3
{
  PAEStyleTransfer *v3;
  PAEStyleTransfer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEStyleTransfer;
  v3 = -[PAESharedDefaultBase initWithAPIManager:](&v6, sel_initWithAPIManager_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_gpuDefaultsLoaded = 0;
    v3->_firstModelLoadLog = 1;
    if (-[PAEStyleTransfer initWithAPIManager:]::onceToken != -1)
      dispatch_once(&-[PAEStyleTransfer initWithAPIManager:]::onceToken, &__block_literal_global_29);
  }
  return v4;
}

void *__39__PAEStyleTransfer_initWithAPIManager___block_invoke()
{
  void *result;

  result = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("PAEStyleTransferLogLevel"));
  if (result)
  {
    result = (void *)objc_msgSend(result, "integerValue");
    kLogLevel = (int)result;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  HStyleTransfer_ANE::RenderContext::ReleaseRenderContext(&self->_aneRenderContext.m_Obj);
  v3.receiver = self;
  v3.super_class = (Class)PAEStyleTransfer;
  -[PAESharedDefaultBase dealloc](&v3, sel_dealloc);
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 65792);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 590080);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", &unk_1E66490D8, CFSTR("PixelTransformSupport"), v3, CFSTR("MayRemapTime"), v4, CFSTR("SupportsHeliumRendering"), v5, CFSTR("PixelTransformSupport"), v6, CFSTR("SDRWorkingSpace"), v7, CFSTR("HDRWorkingSpace"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)variesOverTime
{
  return 0;
}

- (BOOL)addParameters
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PAEStyleTransfer;
  -[PAESharedDefaultBase addParameters](&v9, sel_addParameters);
  v3 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A6DD0);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    LODWORD(v3) = objc_msgSend(v4, "addStringParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PAEStyleTransferModelName"), 0, 0), 1, &stru_1E65EDDA0, 1);
    if ((_DWORD)v3)
    {
      LODWORD(v8) = 17;
      v6 = objc_msgSend(v4, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PAEStyleTransferQualityLevel"), 0, 0), 2, 0, 0, 6, 0, 0x100000006, v8);
      LOBYTE(v3) = 0;
      if (v6)
        LOBYTE(v3) = objc_msgSend(v4, "addStringParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PAEStyleTransferAppBundleID"), 0, 0), 3, &stru_1E65EDDA0, 1);
    }
  }
  return v3;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  _OWORD v20[3];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4590);
  v10 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
    goto LABEL_10;
  -[PAEStyleTransfer registerGPUDefaults](self, "registerGPUDefaults");
  v25 = 0;
  objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", &v25, 2, a5->var0.var1);
  v12 = v25;
  v24 = 0;
  objc_msgSend(v9, "getStringParameterValue:fromParm:", &v24, 1);
  v13 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  if (!v13)
    return v13;
  if (objc_msgSend(a4, "imageType") != 3)
  {
LABEL_10:
    LOBYTE(v13) = 0;
    return v13;
  }
  v21 = 0;
  v22 = 0;
  v23 = 0;
  -[PAEStyleTransfer renderResourceForQuality:forModel:](self, "renderResourceForQuality:forModel:", v12, v24);
  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = objc_msgSend(a4, "width");
  v16 = objc_msgSend(a4, "height");
  v17 = objc_msgSend(v14, "stringWithFormat:", CFSTR("StyleTransfer: inputSize [%lu x %lu] | modelName %@ | quality %ld | aneModelExists %d | forceResource %@ | renderResource %d"), v15, v16, v24, v12, 0, 0, 0);
  if (kLogLevel >= 1)
    NSLog(CFSTR("%@"), v17);
  v18 = *(_OWORD *)&a5->var2;
  v20[0] = *(_OWORD *)&a5->var0.var0;
  v20[1] = v18;
  v20[2] = *(_OWORD *)&a5->var4;
  LOBYTE(v13) = -[PAEStyleTransfer buildGPURenderGraph:withInput:withInfo:modelName:qualityLevel:](self, "buildGPURenderGraph:withInput:withInfo:modelName:qualityLevel:", a3, a4, v20, v24, v12);
  return v13;
}

- (PAEStyleTransferResourceTestResult)renderResourceForQuality:(SEL)a3 forModel:(int64_t)a4
{
  int v8;
  void *v9;
  PAEStyleTransferResourceTestResult *result;

  v8 = 0;
  retstr->var0 = 0;
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    if (objc_msgSend(MEMORY[0x1E0D1F500], "supportsANE"))
    {
      v8 = 1;
      retstr->var0 = 1;
    }
    else
    {
      v8 = 0;
    }
  }
  v9 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("PAEStyleTransfer_ResourceOverride"));
  retstr->var1 = v9;
  if (v9)
  {
    v8 = objc_msgSend(v9, "integerValue");
    retstr->var0 = v8;
  }
  result = -[PAEStyleTransfer aneModelPath:](self, "aneModelPath:", a5);
  retstr->var2 = result != 0;
  if (v8 == 1 && !result)
    retstr->var0 = 0;
  return result;
}

- (BOOL)buildGPURenderGraph:(id)a3 withInput:(id)a4 withInfo:(id *)a5 modelName:(id)a6 qualityLevel:(int64_t)a7
{
  EspressoImage2Image *v12;
  HStyleTransfer_GPU *v13;
  HStyleTransfer_GPU *v15;
  uint64_t v16;

  if (+[PAEStyleTransfer hasEspressoVersion](PAEStyleTransfer, "hasEspressoVersion", a3, a4, a5)
    && self->_gpuNetwork
    && -[NSString isEqualToString:](self->_modelName, "isEqualToString:", a6)
    || -[PAEStyleTransfer loadGPUModel:](self, "loadGPUModel:", a6))
  {
    if (-[PAEStyleTransfer currentQualityLevel](self, "currentQualityLevel") != a7)
    {
      -[EspressoImage2Image reshapeToResolutionPreset:](-[PAEStyleTransfer gpuNetwork](self, "gpuNetwork"), "reshapeToResolutionPreset:", a7);
      -[PAEStyleTransfer setCurrentQualityLevel:](self, "setCurrentQualityLevel:", a7);
    }
    self->_modelName = (NSString *)a6;
    if (a4)
      objc_msgSend(a4, "heliumRef");
    else
      v16 = 0;
    v12 = -[PAEStyleTransfer gpuNetwork](self, "gpuNetwork");
    v13 = (HStyleTransfer_GPU *)HGObject::operator new(0x1B0uLL);
    HStyleTransfer_GPU::HStyleTransfer_GPU(v13, v12);
    (*(void (**)(HStyleTransfer_GPU *, _QWORD, uint64_t))(*(_QWORD *)v13 + 120))(v13, 0, v16);
    v15 = v13;
    (*(void (**)(HStyleTransfer_GPU *))(*(_QWORD *)v13 + 16))(v13);
    objc_msgSend(a3, "setHeliumRef:", &v15);
    if (v15)
      (*(void (**)(HStyleTransfer_GPU *))(*(_QWORD *)v15 + 24))(v15);
    (*(void (**)(HStyleTransfer_GPU *))(*(_QWORD *)v13 + 24))(v13);
    if (v16)
      (*(void (**)(uint64_t))(*(_QWORD *)v16 + 24))(v16);
  }
  return 1;
}

- (BOOL)buildANERenderGraph:(id)a3 withInput:(id)a4 withInfo:(id *)a5 modelName:(id)a6 qualityLevel:(int64_t)a7
{
  _BOOL4 v11;
  RenderContext *v12;
  TwoNetsStyleTransfer *aneNetwork;
  RenderContext *m_Obj;
  uint64_t v16;
  RenderContext *v17;

  if (self->_aneNetwork && -[NSString isEqualToString:](self->_modelName, "isEqualToString:", a6, a4, a5, a6, a7)
    || (v11 = -[PAEStyleTransfer loadANEModel:](self, "loadANEModel:", a6, a4, a5, a6, a7)))
  {
    if (a4)
      objc_msgSend(a4, "heliumRef");
    else
      v16 = 0;
    v12 = (RenderContext *)HGObject::operator new(0x1B0uLL);
    aneNetwork = self->_aneNetwork;
    m_Obj = self->_aneRenderContext.m_Obj;
    v17 = m_Obj;
    if (m_Obj)
      (*(void (**)(RenderContext *))(*(_QWORD *)m_Obj + 16))(m_Obj);
    HStyleTransfer_ANE::HStyleTransfer_ANE(v12, aneNetwork, &v17);
    if (v17)
      (*(void (**)(RenderContext *))(*(_QWORD *)v17 + 24))(v17);
    (*(void (**)(RenderContext *, _QWORD, uint64_t))(*(_QWORD *)v12 + 120))(v12, 0, v16);
    v17 = v12;
    (*(void (**)(RenderContext *))(*(_QWORD *)v12 + 16))(v12);
    objc_msgSend(a3, "setHeliumRef:", &v17);
    if (v17)
      (*(void (**)(RenderContext *))(*(_QWORD *)v17 + 24))(v17);
    (*(void (**)(RenderContext *))(*(_QWORD *)v12 + 24))(v12);
    if (v16)
      (*(void (**)(uint64_t))(*(_QWORD *)v16 + 24))(v16);
    LOBYTE(v11) = 1;
  }
  return v11;
}

- (EspressoImage2Image)gpuNetwork
{
  return self->_gpuNetwork;
}

- (void)setGpuNetwork:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (TwoNetsStyleTransfer)aneNetwork
{
  return self->_aneNetwork;
}

- (void)setAneNetwork:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (int64_t)currentQualityLevel
{
  return self->_currentQualityLevel;
}

- (void)setCurrentQualityLevel:(int64_t)a3
{
  self->_currentQualityLevel = a3;
}

- (double)currentAspectRatio
{
  return self->_currentAspectRatio;
}

- (void)setCurrentAspectRatio:(double)a3
{
  self->_currentAspectRatio = a3;
}

- (void).cxx_destruct
{
  RenderContext *m_Obj;

  m_Obj = self->_aneRenderContext.m_Obj;
  if (m_Obj)
    (*(void (**)(RenderContext *, SEL))(*(_QWORD *)m_Obj + 24))(m_Obj, a2);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
