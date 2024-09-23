@implementation USKLayerOffset

- (double)offset
{
  return self->_layerOffset._offset;
}

- (SdfLayerOffset)sdfLayerOffset
{
  double offset;
  double scale;
  SdfLayerOffset result;

  offset = self->_layerOffset._offset;
  scale = self->_layerOffset._scale;
  result._scale = scale;
  result._offset = offset;
  return result;
}

- (USKLayerOffset)init
{
  char *v2;
  char *v3;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)USKLayerOffset;
  v2 = -[USKLayerOffset init](&v6, sel_init);
  if (v2)
  {
    pxrInternal__aapl__pxrReserved__::SdfLayerOffset::SdfLayerOffset((pxrInternal__aapl__pxrReserved__::SdfLayerOffset *)&v5, 0.0, 1.0);
    *(_OWORD *)(v2 + 8) = v5;
    v3 = v2;
  }

  return (USKLayerOffset *)v2;
}

- (USKLayerOffset)initWithSdfLayerOffset:(SdfLayerOffset)a3
{
  double scale;
  double offset;
  USKLayerOffset *v5;
  USKLayerOffset *v6;
  USKLayerOffset *v7;
  objc_super v9;

  scale = a3._scale;
  offset = a3._offset;
  v9.receiver = self;
  v9.super_class = (Class)USKLayerOffset;
  v5 = -[USKLayerOffset init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_layerOffset._offset = offset;
    v5->_layerOffset._scale = scale;
    v7 = v5;
  }

  return v6;
}

- (USKLayerOffset)initWithOffset:(double)a3 scale:(double)a4
{
  char *v6;
  char *v7;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)USKLayerOffset;
  v6 = -[USKLayerOffset init](&v10, sel_init);
  if (v6)
  {
    pxrInternal__aapl__pxrReserved__::SdfLayerOffset::SdfLayerOffset((pxrInternal__aapl__pxrReserved__::SdfLayerOffset *)&v9, a3, a4);
    *(_OWORD *)(v6 + 8) = v9;
    v7 = v6;
  }

  return (USKLayerOffset *)v6;
}

- (BOOL)isEqual:(id)a3
{
  USKLayerOffset *v4;
  USKLayerOffset *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v4 = (USKLayerOffset *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_sdfLayerOffset(v5, v6, v7, v8);
    v9 = pxrInternal__aapl__pxrReserved__::SdfLayerOffset::operator==();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return pxrInternal__aapl__pxrReserved__::SdfLayerOffset::GetHash((pxrInternal__aapl__pxrReserved__::SdfLayerOffset *)&self->_layerOffset);
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (id).cxx_construct
{
  pxrInternal__aapl__pxrReserved__::SdfLayerOffset::SdfLayerOffset((pxrInternal__aapl__pxrReserved__::SdfLayerOffset *)&self->_layerOffset, 0.0, 1.0);
  return self;
}

@end
