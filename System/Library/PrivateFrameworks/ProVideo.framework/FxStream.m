@implementation FxStream

- (FxStream)init
{
  FxStream *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FxStream;
  v2 = -[FxStream init](&v4, sel_init);
  if (v2)
    v2->_priv = (FxStreamPriv *)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
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
  FxStreamPriv *priv;
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
  v10.super_class = (Class)FxStream;
  -[FxStream dealloc](&v10, sel_dealloc);
}

- (id)pin
{
  return self->_priv->var0;
}

- (void)setPin:(id)a3
{
  id var0;

  var0 = self->_priv->var0;
  if (var0 != a3)
  {
    if (var0)

    self->_priv->var0 = a3;
  }
}

- (id)provider
{
  id v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = -[FxStream pin](self, "pin");
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, "direction");
    if (v4 == 1)
      return (id)objc_msgSend(v3, "parentPlug");
    if (!v4)
      return (id)objc_msgSend((id)objc_msgSend(v3, "parentPlug"), "host");
    FxDebugLog(CFSTR("Illegal pin direction value: %ld"), v5, v6, v7, v8, v9, v10, v11, v4);
  }
  return 0;
}

- (id)createSampleAtTime:(double)a3
{
  FxSample *v5;

  v5 = objc_alloc_init(FxSample);
  -[FxSample setStream:](v5, "setStream:", self);
  -[FxSample setTime:](v5, "setTime:", a3);
  return v5;
}

@end
