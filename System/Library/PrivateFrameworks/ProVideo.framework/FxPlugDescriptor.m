@implementation FxPlugDescriptor

- (FxPlugDescriptor)initWithPROPlugIn:(void *)a3
{
  FxPlugDescriptor *v4;
  FxPlugDescriptorPriv *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FxPlugDescriptor;
  v4 = -[FxPlugDescriptor init](&v7, sel_init);
  if (v4)
  {
    v5 = (FxPlugDescriptorPriv *)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
    v4->_priv = v5;
    if (v5)
      v4->_priv->var0 = a3;
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  FxPlugDescriptorPriv *priv;
  objc_super v10;

  FxDebugAssert(self->_priv != 0, CFSTR("_priv == NULL"), v2, v3, v4, v5, v6, v7, (char)v10.receiver);
  priv = self->_priv;
  if (priv)
  {
    if (priv->var0)
    {

      priv = self->_priv;
    }
    free(priv);
  }
  v10.receiver = self;
  v10.super_class = (Class)FxPlugDescriptor;
  -[FxPlugDescriptor dealloc](&v10, sel_dealloc);
}

+ (id)fxPlugDescriptorWithPROPlugIn:(void *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPROPlugIn:", a3);
}

- (id)properties
{
  id var0;

  var0 = self->_priv->var0;
  if (var0)
    return (id)objc_msgSend((id)objc_msgSend(var0, "infoDictionary"), "objectForKey:", CFSTR("FxPlugProperties"));
  NSLog(CFSTR("FxPlug is not Native"), a2);
  return 0;
}

- (Class)plugInClass
{
  id var0;

  var0 = self->_priv->var0;
  if (var0)
    return (Class)objc_msgSend(var0, "plugInClass");
  NSLog(CFSTR("FxPlug is not Native"), a2);
  return 0;
}

- (id)flavor
{
  return (id)objc_msgSend(-[FxPlugDescriptor properties](self, "properties"), "objectForKey:", CFSTR("Flavor"));
}

- (id)plugInTypeUUID
{
  return CFSTR("ACF57DAE-E1BB-11D8-BF80-000A95DF1816");
}

- (id)displayName
{
  id var0;

  var0 = self->_priv->var0;
  if (var0)
    return (id)objc_msgSend(var0, "displayName");
  NSLog(CFSTR("FxPlug is not Native"), a2);
  return 0;
}

- (id)uuid
{
  id var0;

  var0 = self->_priv->var0;
  if (var0)
    return (id)(id)CFUUIDCreateString(0, (CFUUIDRef)objc_msgSend(var0, "uuid"));
  NSLog(CFSTR("FxPlug is not Native"), a2);
  return 0;
}

- (id)version
{
  id var0;

  var0 = self->_priv->var0;
  if (var0)
    return (id)objc_msgSend(var0, "version");
  NSLog(CFSTR("FxPlug is not Native"), a2);
  return 0;
}

- (id)groupDescriptor
{
  id var0;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;

  var0 = self->_priv->var0;
  if (var0)
  {
    v3 = (void *)objc_msgSend(var0, "group");
    FxDebugAssert(v3 != 0, CFSTR("[plugIn group] returned NULL."), v4, v5, v6, v7, v8, v9, v11);
    if (v3)
      return +[FxPlugGroupDescriptor fxPlugGroupDescriptorWithUUID:andDisplayName:](FxPlugGroupDescriptor, "fxPlugGroupDescriptorWithUUID:andDisplayName:", (id)CFUUIDCreateString(0, (CFUUIDRef)objc_msgSend(v3, "uuid")), objc_msgSend(v3, "displayName"));
  }
  else
  {
    NSLog(CFSTR("FxPlug is not Native"), a2);
  }
  return 0;
}

- (BOOL)canDoGPU
{
  return objc_msgSend((id)objc_msgSend(-[FxPlugDescriptor properties](self, "properties"), "objectForKey:", CFSTR("CanDoGPU")), "BOOLValue");
}

- (BOOL)requiresCoreImage
{
  return objc_msgSend((id)objc_msgSend(-[FxPlugDescriptor properties](self, "properties"), "objectForKey:", CFSTR("RequiresCoreImage")), "BOOLValue");
}

@end
