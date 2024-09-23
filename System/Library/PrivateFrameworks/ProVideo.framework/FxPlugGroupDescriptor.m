@implementation FxPlugGroupDescriptor

- (FxPlugGroupDescriptor)initWithUUID:(id)a3 andDisplayName:(id)a4
{
  FxPlugGroupDescriptor *v6;
  FxPlugGroupDescriptorPriv *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FxPlugGroupDescriptor;
  v6 = -[FxPlugGroupDescriptor init](&v9, sel_init);
  if (v6)
  {
    v7 = (FxPlugGroupDescriptorPriv *)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
    v6->_priv = v7;
    if (v7)
      v6->_priv->var0 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a3, CFSTR("UUID"), a4, CFSTR("DisplayName"), 0);
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  FxPlugGroupDescriptorPriv *priv;
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
  v10.super_class = (Class)FxPlugGroupDescriptor;
  -[FxPlugGroupDescriptor dealloc](&v10, sel_dealloc);
}

+ (id)fxPlugGroupDescriptorWithUUID:(id)a3 andDisplayName:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUUID:andDisplayName:", a3, a4);
}

- (id)displayName
{
  return (id)objc_msgSend(self->_priv->var0, "objectForKey:", CFSTR("DisplayName"));
}

- (id)uuid
{
  return (id)objc_msgSend(self->_priv->var0, "objectForKey:", CFSTR("UUID"));
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(-[FxPlugGroupDescriptor uuid](self, "uuid"), "isEqualToString:", objc_msgSend(a3, "uuid"));
  if (v5)
    LOBYTE(v5) = objc_msgSend(-[FxPlugGroupDescriptor displayName](self, "displayName"), "isEqualToString:", objc_msgSend(a3, "displayName"));
  return v5;
}

@end
