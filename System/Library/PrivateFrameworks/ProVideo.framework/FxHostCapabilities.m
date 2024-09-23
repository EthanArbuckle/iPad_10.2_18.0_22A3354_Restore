@implementation FxHostCapabilities

- (FxHostCapabilities)initWithAPIManager:(id)a3
{
  FxHostCapabilities *v4;
  FxHostCapabilitiesPriv *v5;
  __CFBundle *MainBundle;
  __CFBundle *v7;
  void *v8;
  FxHostCapabilitiesPriv *hostCapPriv;
  __int128 v10;
  id v11;
  id v12;
  id v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)FxHostCapabilities;
  v4 = -[FxHostCapabilities init](&v15, sel_init);
  if (v4)
  {
    v5 = (FxHostCapabilitiesPriv *)malloc_type_calloc(1uLL, 0x20uLL, 0x10800402D5EB2C2uLL);
    v4->_hostCapPriv = v5;
    if (v5)
    {
      MainBundle = CFBundleGetMainBundle();
      if (MainBundle)
      {
        v7 = MainBundle;
        if (!-[__CFString hasPrefix:]((id)CFBundleGetIdentifier(MainBundle), "hasPrefix:", CFSTR("com.apple.")))
        {
          hostCapPriv = v4->_hostCapPriv;
          v10 = *(_OWORD *)&qword_1EF075A30;
          *(_OWORD *)&hostCapPriv->var0 = gRemoteCapabilities;
          *(_OWORD *)&hostCapPriv->var2 = v10;
          v11 = v4->_hostCapPriv->var0;
          v12 = v4->_hostCapPriv->var2;
          v13 = v4->_hostCapPriv->var3;
          return v4;
        }
        LODWORD(MainBundle) = CFBundleGetVersionNumber(v7);
      }
      v4->_hostCapPriv->var1 = MainBundle;
      v4->_hostCapPriv->var0 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
      v8 = (void *)objc_msgSend(a3, "apiForProtocol:", &unk_1EF0A80F0);
      if (v8)
        v4->_hostCapPriv->var2 = (id)objc_msgSend(v8, "hostProperties");
      else
        v4->_hostCapPriv->var2 = 0;
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  FxHostCapabilitiesPriv *hostCapPriv;
  id var2;
  id var3;
  objc_super v6;

  hostCapPriv = self->_hostCapPriv;
  if (hostCapPriv)
  {
    if (hostCapPriv->var0)
    {

      hostCapPriv = self->_hostCapPriv;
    }
    var2 = hostCapPriv->var2;
    if (var2)
    {

      hostCapPriv = self->_hostCapPriv;
    }
    var3 = hostCapPriv->var3;
    if (var3)
    {

      hostCapPriv = self->_hostCapPriv;
    }
    free(hostCapPriv);
  }
  v6.receiver = self;
  v6.super_class = (Class)FxHostCapabilities;
  -[FxHostCapabilities dealloc](&v6, sel_dealloc);
}

+ (void)setRemoteHostCapabilities:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__FxHostCapabilities_setRemoteHostCapabilities___block_invoke;
  block[3] = &unk_1E64DFA00;
  block[4] = a3;
  if (setRemoteHostCapabilities__onceToken != -1)
    dispatch_once(&setRemoteHostCapabilities__onceToken, block);
}

id __48__FxHostCapabilities_setRemoteHostCapabilities___block_invoke(uint64_t a1)
{
  id result;

  *(_QWORD *)&gRemoteCapabilities = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("HostID"));
  DWORD2(gRemoteCapabilities) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("HostVersion")), "unsignedIntValue");
  qword_1EF075A30 = (uint64_t)(id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("HostProperties"));
  result = objc_alloc_init(MEMORY[0x1E0C99D20]);
  qword_1EF075A38 = (uint64_t)result;
  gRemoteCapsSet = 1;
  return result;
}

+ (id)getRemoteHostCapabilities
{
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  if (gRemoteCapsSet != 1)
    return 0;
  v4[0] = gRemoteCapabilities;
  v3[0] = CFSTR("HostID");
  v3[1] = CFSTR("HostVersion");
  v4[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DWORD2(gRemoteCapabilities));
  v4[2] = qword_1EF075A30;
  v3[2] = CFSTR("HostProperties");
  v3[3] = CFSTR("kFxHostPropertiesKey_GLContextPixelFormatAttributes");
  v4[3] = objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
}

- (id)hostID
{
  FxHostCapabilitiesPriv *hostCapPriv;
  id var2;

  hostCapPriv = self->_hostCapPriv;
  var2 = hostCapPriv->var2;
  if (var2)
  {
    if (objc_msgSend(var2, "valueForKey:", CFSTR("UsingMotionRendering")))
      return CFSTR("com.apple.Motion");
    hostCapPriv = self->_hostCapPriv;
  }
  return hostCapPriv->var0;
}

- (BOOL)hostIsMotion
{
  FxHostCapabilitiesPriv *hostCapPriv;
  id var2;
  void *v5;

  hostCapPriv = self->_hostCapPriv;
  var2 = hostCapPriv->var2;
  if (var2)
  {
    v5 = (void *)objc_msgSend(var2, "valueForKey:", CFSTR("UsingMotionRendering"));
    if (v5)
      return objc_msgSend(v5, "BOOLValue");
    hostCapPriv = self->_hostCapPriv;
  }
  return objc_msgSend(hostCapPriv->var0, "isEqualToString:", CFSTR("com.apple.motion"));
}

- (BOOL)hostIsFCP
{
  FxHostCapabilitiesPriv *hostCapPriv;
  id var2;
  void *v5;

  hostCapPriv = self->_hostCapPriv;
  var2 = hostCapPriv->var2;
  if (var2)
  {
    v5 = (void *)objc_msgSend(var2, "valueForKey:", CFSTR("UsingMotionRendering"));
    if (v5)
      return objc_msgSend(v5, "BOOLValue") ^ 1;
    hostCapPriv = self->_hostCapPriv;
  }
  return objc_msgSend(hostCapPriv->var0, "hasPrefix:", CFSTR("com.apple.FinalCut"));
}

- (BOOL)hostIsFCE
{
  FxHostCapabilitiesPriv *hostCapPriv;
  id var2;
  void *v5;

  hostCapPriv = self->_hostCapPriv;
  var2 = hostCapPriv->var2;
  if (var2)
  {
    v5 = (void *)objc_msgSend(var2, "valueForKey:", CFSTR("UsingMotionRendering"));
    if (v5)
      return objc_msgSend(v5, "BOOLValue") ^ 1;
    hostCapPriv = self->_hostCapPriv;
  }
  return objc_msgSend(hostCapPriv->var0, "isEqualToString:", CFSTR("com.apple.FinalCutExpress"));
}

- (unsigned)hostVersionNumber
{
  FxHostCapabilitiesPriv *hostCapPriv;
  id var2;
  void *v5;
  unsigned int v6;

  hostCapPriv = self->_hostCapPriv;
  var2 = hostCapPriv->var2;
  if (var2)
  {
    v5 = (void *)objc_msgSend(var2, "valueForKey:", CFSTR("HostVersion"));
    if (v5)
    {
      v6 = objc_msgSend(v5, "intValue");
      hostCapPriv = self->_hostCapPriv;
      hostCapPriv->var1 = v6;
    }
    else
    {
      hostCapPriv = self->_hostCapPriv;
    }
  }
  return hostCapPriv->var1;
}

- (BOOL)formatsFloatRGBABitmapsAsARGB
{
  id var2;
  void *v4;

  var2 = self->_hostCapPriv->var2;
  if (var2 && (v4 = (void *)objc_msgSend(var2, "valueForKey:", CFSTR("FormatsFloatRGBABitmapsAsARGB"))) != 0)
    return objc_msgSend(v4, "BOOLValue");
  else
    return -[FxHostCapabilities hostIsMotion](self, "hostIsMotion");
}

- (BOOL)supportsHiddenParameters
{
  id var2;
  void *v4;

  var2 = self->_hostCapPriv->var2;
  if (var2)
  {
    v4 = (void *)objc_msgSend(var2, "valueForKey:", CFSTR("SupportsHiddenParameters"));
    if (v4)
      return objc_msgSend(v4, "BOOLValue");
  }
  if (-[FxHostCapabilities hostIsFCE](self, "hostIsFCE"))
    return 0;
  return !-[FxHostCapabilities hostIsFCP](self, "hostIsFCP");
}

- (BOOL)supportsDisabledParameters
{
  id var2;
  void *v4;

  var2 = self->_hostCapPriv->var2;
  if (var2)
  {
    v4 = (void *)objc_msgSend(var2, "valueForKey:", CFSTR("SupportsDisabledParameters"));
    if (v4)
      return objc_msgSend(v4, "BOOLValue");
  }
  if (-[FxHostCapabilities hostIsFCE](self, "hostIsFCE"))
    return 0;
  return !-[FxHostCapabilities hostIsFCP](self, "hostIsFCP");
}

- (BOOL)supportsGroupParameters
{
  id var2;
  void *v4;

  var2 = self->_hostCapPriv->var2;
  if (var2 && (v4 = (void *)objc_msgSend(var2, "valueForKey:", CFSTR("SupportsGroupParameters"))) != 0)
    return objc_msgSend(v4, "BOOLValue");
  else
    return -[FxHostCapabilities hostIsMotion](self, "hostIsMotion");
}

- (BOOL)notifiesParameterChangedForGenerators
{
  id var2;
  void *v4;

  var2 = self->_hostCapPriv->var2;
  if (var2)
  {
    v4 = (void *)objc_msgSend(var2, "valueForKey:", CFSTR("NotifiesParameterChangedForGenerators"));
    if (v4)
      return objc_msgSend(v4, "BOOLValue");
  }
  if (-[FxHostCapabilities hostIsFCE](self, "hostIsFCE"))
    return 0;
  return !-[FxHostCapabilities hostIsFCP](self, "hostIsFCP");
}

- (BOOL)parameterChangedUsableForAllParameters
{
  id var2;
  void *v4;

  var2 = self->_hostCapPriv->var2;
  if (var2 && (v4 = (void *)objc_msgSend(var2, "valueForKey:", CFSTR("ParameterChangedUsableForAllParameters"))) != 0)
    return objc_msgSend(v4, "BOOLValue");
  else
    return !-[FxHostCapabilities hostIsMotion](self, "hostIsMotion");
}

- (BOOL)upscalesFields
{
  id var2;
  void *v4;

  var2 = self->_hostCapPriv->var2;
  if (var2 && (v4 = (void *)objc_msgSend(var2, "valueForKey:", CFSTR("UpscalesFields"))) != 0)
    return objc_msgSend(v4, "BOOLValue");
  else
    return -[FxHostCapabilities hostIsMotion](self, "hostIsMotion");
}

- (BOOL)supportsTemporalBitmaps
{
  id var2;
  void *v4;

  var2 = self->_hostCapPriv->var2;
  if (var2 && (v4 = (void *)objc_msgSend(var2, "valueForKey:", CFSTR("SupportsTemporalBitmaps"))) != 0)
    return objc_msgSend(v4, "BOOLValue");
  else
    return !-[FxHostCapabilities hostIsMotion](self, "hostIsMotion");
}

- (unint64_t)timeBase
{
  id var2;
  void *v4;

  var2 = self->_hostCapPriv->var2;
  if (var2 && (v4 = (void *)objc_msgSend(var2, "valueForKey:", CFSTR("TimeBase"))) != 0)
    return (int)objc_msgSend(v4, "intValue");
  else
    return -[FxHostCapabilities hostIsMotion](self, "hostIsMotion") ^ 1;
}

- (id)glContextPixelFormatAttributes
{
  FxHostCapabilitiesPriv *hostCapPriv;
  id var2;

  hostCapPriv = self->_hostCapPriv;
  if (!hostCapPriv->var3)
  {
    var2 = hostCapPriv->var2;
    if (var2)
    {
      self->_hostCapPriv->var3 = (id)objc_msgSend(var2, "valueForKey:", CFSTR("kFxHostPropertiesKey_GLContextPixelFormatAttributes"));
    }
    else if (-[FxHostCapabilities hostIsMotion](self, "hostIsMotion"))
    {
      -[FxHostCapabilities hostVersionNumber](self, "hostVersionNumber");
    }
  }
  return self->_hostCapPriv->var3;
}

@end
