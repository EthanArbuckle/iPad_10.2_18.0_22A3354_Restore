@implementation FxPin

- (FxPin)init
{
  FxPin *v2;
  FxPinPriv *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FxPin;
  v2 = -[FxPin init](&v5, sel_init);
  if (v2)
  {
    v3 = (FxPinPriv *)malloc_type_calloc(1uLL, 0x40uLL, 0x10800409C3078A8uLL);
    v2->_priv = v3;
    if (v3)
    {
      v2->_priv->var1 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v2->_priv->var7 = (Class)objc_opt_class();
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  FxPinPriv *priv;
  id var1;
  id var2;
  id var3;
  id var4;
  id var5;
  objc_super v15;

  FxDebugAssert(self->_priv != 0, CFSTR("_priv == NULL"), v2, v3, v4, v5, v6, v7, (char)v15.receiver);
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
    free(priv);
  }
  v15.receiver = self;
  v15.super_class = (Class)FxPin;
  -[FxPin dealloc](&v15, sel_dealloc);
}

- (int)index
{
  void *v3;

  if (!-[FxPin direction](self, "direction"))
  {
    v3 = (void *)objc_msgSend(-[FxPin parentPlug](self, "parentPlug"), "inputPins");
    return objc_msgSend(v3, "indexOfObject:", self);
  }
  if (-[FxPin direction](self, "direction") == 1)
  {
    v3 = (void *)objc_msgSend(-[FxPin parentPlug](self, "parentPlug"), "outputPins");
    return objc_msgSend(v3, "indexOfObject:", self);
  }
  return -1;
}

- (id)properties
{
  return self->_priv->var1;
}

- (id)parentPlug
{
  return self->_priv->var0;
}

- (void)setParentPlug:(id)a3
{
  id var0;

  var0 = self->_priv->var0;
  if (var0)

  self->_priv->var0 = a3;
}

- (id)stream
{
  id result;
  FxStream *v4;

  result = self->_priv->var2;
  if (!result)
  {
    v4 = objc_alloc_init(FxStream);
    -[FxStream setPin:](v4, "setPin:", self);
    result = v4;
    self->_priv->var2 = result;
  }
  return result;
}

- (id)uuid
{
  return self->_priv->var3;
}

- (void)setUUID:(id)a3
{
  id var3;

  var3 = self->_priv->var3;
  if (var3)

  self->_priv->var3 = a3;
}

- (id)displayName
{
  return self->_priv->var4;
}

- (void)setDisplayName:(id)a3
{
  id var4;

  var4 = self->_priv->var4;
  if (var4)

  self->_priv->var4 = a3;
}

- (id)description
{
  return self->_priv->var5;
}

- (void)setDescription:(id)a3
{
  id var5;

  var5 = self->_priv->var5;
  if (var5)

  self->_priv->var5 = a3;
}

- (int)direction
{
  return self->_priv->var6;
}

- (void)setDirection:(int)a3
{
  self->_priv->var6 = a3;
}

- (Class)valueClass
{
  return self->_priv->var7;
}

- (void)setValueClass:(Class)a3
{
  self->_priv->var7 = a3;
}

@end
