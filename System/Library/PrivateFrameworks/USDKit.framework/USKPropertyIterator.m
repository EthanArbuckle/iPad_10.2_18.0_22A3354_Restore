@implementation USKPropertyIterator

- (USKPropertyIterator)initWithProperties:(const void *)a3
{
  USKPropertyIterator *v4;
  USKPropertyIterator *v5;
  uint64_t p_properties;
  USKPropertyIterator *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)USKPropertyIterator;
  v4 = -[USKPropertyIterator init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    p_properties = (uint64_t)&v4->_properties;
    if (&v5->_properties != a3)
      sub_2264038E4(p_properties, *(_QWORD *)a3, *((_QWORD *)a3 + 1), (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 5);
    v5->_it.__i_ = v5->_properties.__begin_;
    v7 = v5;
  }

  return v5;
}

- (id)nextObject
{
  USKProperty *v3;
  UsdProperty *i;
  uint64_t px;
  unint64_t *v6;
  unint64_t v7;
  const char *v8;
  uint64_t v9;
  Handle poolHandle;
  unsigned int *v11;
  unsigned int v12;
  void *v13;
  unsigned int *v14;
  unsigned int v15;
  int type;
  uint64_t v18;
  int v19;
  int v20;
  Handle v21;

  if (self->_it.__i_ == self->_properties.__end_)
  {
    v13 = 0;
  }
  else
  {
    v3 = [USKProperty alloc];
    i = self->_it.__i_;
    type = i->_type;
    px = (uint64_t)i->_prim._p.px;
    v18 = px;
    if (px)
    {
      v6 = (unint64_t *)(px + 48);
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
    }
    sub_2263BDDD8(&v19, &i->_proxyPrimPath);
    sub_2263BDE28(&v20, (_DWORD *)&i->_proxyPrimPath._primPart._poolHandle + 1);
    poolHandle = i->_proxyPrimPath._propPart._poolHandle;
    v21 = poolHandle;
    if ((poolHandle & 7) != 0)
    {
      v11 = (unsigned int *)((unint64_t)poolHandle & 0xFFFFFFFFFFFFFFF8);
      do
        v12 = __ldxr(v11);
      while (__stxr(v12 + 2, v11));
      if ((v12 & 1) == 0)
        v21 = (Handle)((unint64_t)v21 & 0xFFFFFFFFFFFFFFF8);
    }
    v13 = (void *)objc_msgSend_initWithUsdProperty_(v3, v8, (uint64_t)&type, v9);
    if ((v21 & 7) != 0)
    {
      v14 = (unsigned int *)((unint64_t)v21 & 0xFFFFFFFFFFFFFFF8);
      do
        v15 = __ldxr(v14);
      while (__stlxr(v15 - 2, v14));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v19);
    if (v18)
      sub_2263DA640(v18);
    self->_it.__i_ = (UsdProperty *)((char *)self->_it.__i_ + 32);
  }
  return v13;
}

- (void).cxx_destruct
{
  vector<pxrInternal__aapl__pxrReserved__::UsdProperty, std::allocator<pxrInternal__aapl__pxrReserved__::UsdProperty>> *p_properties;

  p_properties = &self->_properties;
  sub_2264035B4((void ***)&p_properties);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
