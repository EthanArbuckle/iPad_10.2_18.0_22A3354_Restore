@implementation FxHost

+ (id)_createPathArrayFromURLArray:(id)a3
{
  void *v4;
  void *v5;
  void *i;
  void *v7;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v5 = (void *)objc_msgSend(a3, "objectEnumerator");
  for (i = v5; ; v5 = i)
  {
    v7 = (void *)objc_msgSend(v5, "nextObject");
    if (!v7)
      break;
    objc_msgSend(v4, "addObject:", objc_msgSend(v7, "path"));
  }
  return v4;
}

- (id)_createDefaultSearchableURLsDict
{
  id var2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  var2 = self->_priv->var2;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_msgSend(var2, "objectEnumerator");
  v5 = objc_msgSend(v4, "nextObject");
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      if (objc_msgSend(v6, "isEqual:", CFSTR("ACF57DAE-E1BB-11D8-BF80-000A95DF1816")))
      {
        v7 = objc_msgSend((id)objc_opt_class(), "fxPlugsFolderURLs");
        if (v7)
          objc_msgSend(v3, "setObject:forKey:", v7, v6);
      }
      v6 = (void *)objc_msgSend(v4, "nextObject");
    }
    while (v6);
  }
  return v3;
}

- (id)_createDefaultSupportBuiltInsDict
{
  id var2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  var2 = self->_priv->var2;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_msgSend(var2, "objectEnumerator");
  v5 = objc_msgSend(v4, "nextObject");
  if (v5)
  {
    v6 = v5;
    do
    {
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), v6);
      v6 = objc_msgSend(v4, "nextObject");
    }
    while (v6);
  }
  return v3;
}

- (FxHost)init
{
  FxHost *v2;
  FxHostPriv *v3;
  id v4;
  id v5;
  id v6;
  FxHostPriv *priv;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FxHost;
  v2 = -[FxHost init](&v9, sel_init);
  if (v2)
  {
    v3 = (FxHostPriv *)malloc_type_calloc(1uLL, 0x38uLL, 0x80040C96DFCA5uLL);
    v2->_priv = v3;
    if (v3)
    {
      v2->_priv->var0 = +[PROPlugInManager sharedPlugInManager](PROPlugInManager, "sharedPlugInManager");
      v4 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
      v2->_priv->var2 = v4;
      objc_msgSend(v4, "addObject:", CFSTR("ACF57DAE-E1BB-11D8-BF80-000A95DF1816"));
      v2->_priv->var1 = v2->_priv->var2;
      v5 = -[FxHost _createDefaultSearchableURLsDict](v2, "_createDefaultSearchableURLsDict");
      v2->_priv->var4 = v5;
      v6 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v5);
      priv = v2->_priv;
      priv->var3 = v6;
      priv->var6 = 0;
      v2->_priv->var5 = -[FxHost _createDefaultSupportBuiltInsDict](v2, "_createDefaultSupportBuiltInsDict");
    }
  }
  return v2;
}

+ (id)host
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  FxHostPriv *priv;
  id var1;
  id var2;
  id var3;
  id var4;
  id var5;
  id var6;
  objc_super v16;

  FxDebugAssert(self->_priv != 0, CFSTR("_priv == NULL"), v2, v3, v4, v5, v6, v7, (char)v16.receiver);
  priv = self->_priv;
  if (priv)
  {
    if (priv->var0)
    {

      priv = self->_priv;
    }
    var1 = priv->var1;
    if (var1)
    {

      priv = self->_priv;
    }
    var2 = priv->var2;
    if (var2)
    {

      priv = self->_priv;
    }
    var3 = priv->var3;
    if (var3)
    {

      priv = self->_priv;
    }
    var4 = priv->var4;
    if (var4)
    {

      priv = self->_priv;
    }
    var5 = priv->var5;
    if (var5)
    {

      priv = self->_priv;
    }
    var6 = priv->var6;
    if (var6)
    {

      priv = self->_priv;
    }
    free(priv);
  }
  v16.receiver = self;
  v16.super_class = (Class)FxHost;
  -[FxHost dealloc](&v16, sel_dealloc);
}

+ (id)internalPlugInsFolderURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/Library/Application Support/ProApps/Internal Plug-Ins"));
}

+ (id)plugInsFolderURLs
{
  void *v2;
  id v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = +[FxHost internalPlugInsFolderURL](FxHost, "internalPlugInsFolderURL");
  v4 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/Library/Plug-Ins"));
  return (id)objc_msgSend(v2, "arrayWithObjects:", v3, v4, objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", objc_msgSend(CFSTR("~/Library/Plug-Ins"), "stringByExpandingTildeInPath")), 0);
}

+ (id)fxPlugsFolderURLs
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = +[FxHost plugInsFolderURLs](FxHost, "plugInsFolderURLs");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v4 = (void *)objc_msgSend(v2, "objectEnumerator");
  v5 = objc_msgSend(v4, "nextObject");
  if (v5)
  {
    v6 = v5;
    do
    {
      objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("FxPlug/"), v6));
      v6 = objc_msgSend(v4, "nextObject");
    }
    while (v6);
  }
  return v3;
}

- (void)invalidateFxPlugDescriptorArray
{
  FxHostPriv *priv;
  id var6;

  priv = self->_priv;
  var6 = priv->var6;
  if (var6)
  {
    priv->var6 = 0;

  }
}

- (id)defaultSupportedPlugInTypeUUIDs
{
  return self->_priv->var2;
}

- (id)supportedPlugInTypeUUIDs
{
  return self->_priv->var1;
}

- (void)setSupportedPlugInTypeUUIDs:(id)a3
{
  id var1;

  if ((objc_msgSend(a3, "isEqualToArray:", self->_priv->var1) & 1) == 0)
  {
    var1 = self->_priv->var1;
    self->_priv->var1 = a3;
    if (var1)

  }
}

- (BOOL)allowBuiltInEffectsForPlugInTypeUUID:(id)a3
{
  return objc_msgSend((id)objc_msgSend(self->_priv->var5, "objectForKey:", a3), "BOOLValue");
}

- (void)setAllowBuiltInEffects:(BOOL)a3 forPlugInTypeUUID:(id)a4
{
  _BOOL8 v5;
  void *v7;

  v5 = a3;
  v7 = (void *)objc_msgSend(self->_priv->var5, "objectForKey:", a4);
  if (!v7 || objc_msgSend(v7, "BOOLValue") != v5)
  {
    objc_msgSend(self->_priv->var5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5), a4);
    -[FxHost invalidateFxPlugDescriptorArray](self, "invalidateFxPlugDescriptorArray");
  }
}

- (id)_findGroupInList:(id)a3 withIdenticalDescriptor:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend(a3, "objectEnumerator");
  do
  {
    v6 = (void *)objc_msgSend(v5, "nextObject");
    v7 = v6;
  }
  while (v6 && !objc_msgSend((id)objc_msgSend(v6, "descriptor"), "isEqual:", a4));
  return v7;
}

- (unsigned)timeScaleForStream:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -timeScaleForStream not implemented by FxHost"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 1;
}

- (double)startTimeForStream:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -startTimeForStream not implemented by FxHost"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0.0;
}

- (double)durationForStream:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -durationForStream not implemented by FxHost"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0.0;
}

- (double)frameDurationForStream:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -frameDurationForStream not implemented by FxHost"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 1.0;
}

- (BOOL)isContextTypeSupported:(int)a3 bySample:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -isContextTypeSupported:bySample: not implemented by FxHost"), (uint64_t)a2, *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7, vars0);
  return 0;
}

- (BOOL)isStreamPremultiplied:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -isStreamPremultiplied not implemented by FxHost"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 1;
}

- (double)pixelAspectForStream:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -pixelAspectForStream not implemented by FxHost"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 1.0;
}

- (BOOL)isSamplePredetermined:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -isSamplePredetermined not implemented by FxHost"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (id)requiredSamplesForSample:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -requiredSamplesForSample: not implemented by FxHost"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (id)evaluateSample:(id)a3 withOptions:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -evaluateSample:withOptions: not implemented by FxHost"), (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, vars0);
  return 0;
}

- (unint64_t)fieldOrderForSample:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxHostEnvironment> -fieldOrderForSample: not implemented by FxHost"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (id)domainOfDefinitionForSample:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxStreamProviding> -domainOfDefinitionForSample: not implemented by FxHost"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (unsigned)globalTimeScale
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxHostEnvironment> -globalTimeScale not implemented by FxHost"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);
  return 1;
}

- (double)globalFrameDuration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxHostEnvironment> -globalFrameDuration not implemented by FxHost"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);
  return 1.0;
}

- (id)uniqueID
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxHostEnvironment> -uniqueID not implemented by FxHost"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);
  return &stru_1E65EDDA0;
}

- (id)hostName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxHostEnvironment> -hostName not implemented by FxHost"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);
  return &stru_1E65EDDA0;
}

- (int)majorVersion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxHostEnvironment> -majorVersion not implemented by FxHost"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);
  return 1;
}

- (int)minorVersion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxHostEnvironment> -minorVersion not implemented by FxHost"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (BOOL)supportsParameterClass:(Class)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("<FxHostEnvironment> -supportsParameterClass: not implemented by FxHost"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

@end
