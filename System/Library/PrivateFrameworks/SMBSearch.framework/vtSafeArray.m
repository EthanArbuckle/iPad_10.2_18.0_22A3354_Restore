@implementation vtSafeArray

- (vtSafeArray)initWithArray:(id)a3 ElementSize:(unsigned int)a4
{
  id v6;
  vtSafeArray *v7;
  vtSafeArray *v8;
  safeArrayBound *v9;
  safeArrayBound *rgsBoundArr;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)vtSafeArray;
  v7 = -[vtSafeArray init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    *(_DWORD *)&v7->_cDims = 1;
    v7->_cbElementSize = a4;
    v9 = -[safeArrayBound initWithElements:LowBound:]([safeArrayBound alloc], "initWithElements:LowBound:", objc_msgSend(v6, "count"), 0);
    rgsBoundArr = v8->_rgsBoundArr;
    v8->_rgsBoundArr = v9;

    if (v8->_rgsBoundArr)
    {
      -[vtSafeArray setVData:](v8, "setVData:", v6);
    }
    else
    {

      v8 = 0;
    }
  }

  return v8;
}

- (unsigned)cDims
{
  return self->_cDims;
}

- (void)setCDims:(unsigned __int16)a3
{
  self->_cDims = a3;
}

- (unsigned)fFeatures
{
  return self->_fFeatures;
}

- (void)setFFeatures:(unsigned __int16)a3
{
  self->_fFeatures = a3;
}

- (unsigned)cbElementSize
{
  return self->_cbElementSize;
}

- (void)setCbElementSize:(unsigned int)a3
{
  self->_cbElementSize = a3;
}

- (safeArrayBound)rgsBoundArr
{
  return (safeArrayBound *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRgsBoundArr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)vData
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vData, 0);
  objc_storeStrong((id *)&self->_rgsBoundArr, 0);
}

@end
