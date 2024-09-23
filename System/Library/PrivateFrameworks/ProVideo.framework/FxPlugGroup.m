@implementation FxPlugGroup

- (FxPlugGroup)initWithDescriptor:(id)a3
{
  FxPlugGroup *v4;
  FxPlugGroupPriv *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FxPlugGroup;
  v4 = -[FxPlugGroup init](&v7, sel_init);
  if (v4)
  {
    v5 = (FxPlugGroupPriv *)malloc_type_calloc(1uLL, 0x10uLL, 0x80040803F642BuLL);
    v4->_priv = v5;
    if (v5)
    {
      v4->_priv->var1 = a3;
      v4->_priv->var0 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    }
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
  FxPlugGroupPriv *priv;
  id var1;
  objc_super v11;

  FxDebugAssert(self->_priv != 0, CFSTR("_priv == NULL"), v2, v3, v4, v5, v6, v7, (char)v11.receiver);
  priv = self->_priv;
  if (priv)
  {
    var1 = priv->var1;
    if (var1)
    {

      priv = self->_priv;
    }
    if (priv->var0)
    {

      priv = self->_priv;
    }
    free(priv);
  }
  v11.receiver = self;
  v11.super_class = (Class)FxPlugGroup;
  -[FxPlugGroup dealloc](&v11, sel_dealloc);
}

+ (id)fxPlugGroupWithDescriptor:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDescriptor:", a3);
}

- (id)descriptor
{
  return self->_priv->var1;
}

- (void)addFxPlugDescriptor:(id)a3
{
  objc_msgSend(self->_priv->var0, "addObject:", a3);
}

- (id)fxPlugDescriptorAtIndex:(int)a3
{
  return (id)objc_msgSend(self->_priv->var0, "objectAtIndex:", a3);
}

- (unsigned)count
{
  return objc_msgSend(self->_priv->var0, "count");
}

@end
