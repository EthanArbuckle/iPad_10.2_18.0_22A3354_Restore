@implementation USKNodeSubtreeIterator

- (id)copyWithZone:(_NSZone *)a3
{
  USKNodeSubtreeIterator *v4;
  const char *v5;
  uint64_t v6;

  v4 = [USKNodeSubtreeIterator alloc];
  return (id)objc_msgSend_initWithSubtreeRange_(v4, v5, (uint64_t)&self->_range, v6);
}

- (USKNodeSubtreeIterator)initWithSubtreeRange:(const void *)a3
{
  char *v4;
  char *v5;
  __int128 v6;
  char *v7;
  __int128 v9;
  int v10[3];
  __int16 v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)USKNodeSubtreeIterator;
  v4 = -[USKNodeSubtreeIterator init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 8) = *(_OWORD *)a3;
    sub_2263C0080((uint64_t)(v4 + 24), (_DWORD *)a3 + 4);
    sub_2263C00D4((uint64_t)(v5 + 28), (_DWORD *)a3 + 5);
    v6 = *(_OWORD *)((char *)a3 + 37);
    *((_OWORD *)v5 + 2) = *(_OWORD *)((char *)a3 + 24);
    *(_OWORD *)(v5 + 45) = v6;
    sub_226401400((uint64_t *)v5 + 1, (uint64_t)&v9);
    *((_OWORD *)v5 + 4) = v9;
    sub_2263BE05C((uint64_t)(v5 + 80), v10);
    sub_2263BE0B0((uint64_t)(v5 + 84));
    *((_DWORD *)v5 + 22) = v10[2];
    *((_WORD *)v5 + 46) = v11;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)v10);
    v7 = v5;
  }

  return (USKNodeSubtreeIterator *)v5;
}

- (USKNodeSubtreeIterator)initWithScene:(const void *)a3
{
  pxrInternal__aapl__pxrReserved__ *v4;
  int8x16_t *UsdPrimDefaultPredicate;
  uint64_t v6;
  int8x16_t v7;
  const char *v8;
  uint64_t v9;
  USKNodeSubtreeIterator *v10;
  Usd_PrimFlagsPredicate v12;
  _BYTE v13[16];
  uint64_t v14;

  v4 = (pxrInternal__aapl__pxrReserved__ *)sub_2263EDEE0((uint64_t *)a3);
  UsdPrimDefaultPredicate = (int8x16_t *)pxrInternal__aapl__pxrReserved__::GetUsdPrimDefaultPredicate(v4);
  v6 = UsdPrimDefaultPredicate[1].i64[0];
  v7.i64[0] = -8193;
  v7.i64[0] = vandq_s8(*UsdPrimDefaultPredicate, v7).u64[0];
  v7.i64[1] = vorrq_s8(*UsdPrimDefaultPredicate, (int8x16_t)vdupq_n_s64(0x2000uLL)).i64[1];
  *(int8x16_t *)&v12._mask.__first_ = v7;
  *(_QWORD *)&v12._negate = v6;
  pxrInternal__aapl__pxrReserved__::UsdStage::Traverse(v4, &v12);
  v10 = (USKNodeSubtreeIterator *)(id)objc_msgSend_initWithSubtreeRange_(self, v8, (uint64_t)v13, v9);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v14);

  return v10;
}

- (USKNodeSubtreeIterator)initWithPrim:(const void *)a3
{
  int8x16_t *UsdPrimDefaultPredicate;
  uint64_t v6;
  int8x16_t v7;
  const char *v8;
  uint64_t v9;
  USKNodeSubtreeIterator *v10;
  int8x16_t v12;
  uint64_t v13;
  _BYTE v14[16];
  uint64_t v15;

  UsdPrimDefaultPredicate = (int8x16_t *)pxrInternal__aapl__pxrReserved__::GetUsdPrimDefaultPredicate((pxrInternal__aapl__pxrReserved__ *)self);
  v6 = UsdPrimDefaultPredicate[1].i64[0];
  v7.i64[0] = -8193;
  v7.i64[0] = vandq_s8(*UsdPrimDefaultPredicate, v7).u64[0];
  v7.i64[1] = vorrq_s8(*UsdPrimDefaultPredicate, (int8x16_t)vdupq_n_s64(0x2000uLL)).i64[1];
  v12 = v7;
  v13 = v6;
  sub_226402D78((uint64_t)v14, (uint64_t)a3, &v12);
  v10 = (USKNodeSubtreeIterator *)(id)objc_msgSend_initWithSubtreeRange_(self, v8, (uint64_t)v14, v9);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v15);

  return v10;
}

- (USKNodeSubtreeIterator)initWithScene:(const void *)a3 withPredicate:(Usd_PrimFlagsPredicate *)a4
{
  pxrInternal__aapl__pxrReserved__::UsdStage *v6;
  uint64_t v7;
  int8x16_t v8;
  const char *v9;
  uint64_t v10;
  USKNodeSubtreeIterator *v11;
  Usd_PrimFlagsPredicate v13;
  _BYTE v14[16];
  uint64_t v15;

  v6 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263EDEE0((uint64_t *)a3);
  v7 = *(_QWORD *)&a4->_negate;
  v8.i64[0] = -8193;
  v8.i64[0] = vandq_s8(*(int8x16_t *)&a4->_mask.__first_, v8).u64[0];
  v8.i64[1] = vorrq_s8(*(int8x16_t *)a4, (int8x16_t)vdupq_n_s64(0x2000uLL)).i64[1];
  *(int8x16_t *)&v13._mask.__first_ = v8;
  *(_QWORD *)&v13._negate = v7;
  pxrInternal__aapl__pxrReserved__::UsdStage::Traverse(v6, &v13);
  v11 = (USKNodeSubtreeIterator *)(id)objc_msgSend_initWithSubtreeRange_(self, v9, (uint64_t)v14, v10);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v15);

  return v11;
}

- (USKNodeSubtreeIterator)initWithPrim:(const void *)a3 withPredicate:(Usd_PrimFlagsPredicate *)a4
{
  int8x16_t v4;
  uint64_t v6;
  __int128 v7;
  const char *v8;
  uint64_t v9;
  USKNodeSubtreeIterator *v10;
  __int128 v12;
  uint64_t v13;
  _BYTE v14[16];
  uint64_t v15;

  v6 = *(_QWORD *)&a4->_negate;
  v4.i64[0] = -8193;
  *(_QWORD *)&v7 = vandq_s8(*(int8x16_t *)&a4->_mask.__first_, v4).u64[0];
  *((_QWORD *)&v7 + 1) = vorrq_s8(*(int8x16_t *)a4, (int8x16_t)vdupq_n_s64(0x2000uLL)).i64[1];
  v12 = v7;
  v13 = v6;
  sub_226402D78((uint64_t)v14, (uint64_t)a3, &v12);
  v10 = (USKNodeSubtreeIterator *)(id)objc_msgSend_initWithSubtreeRange_(self, v8, (uint64_t)v14, v9);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v15);

  return v10;
}

- (id)nextObject
{
  pxrInternal__aapl__pxrReserved__::UsdPrimRange::iterator *p_initDepth;
  Usd_PrimData *p_range;
  BOOL v5;
  USKNode *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  unsigned int *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  Usd_PrimData *end;
  Usd_PrimData *v18;
  UsdPrimRange *v19;
  int v20;
  __int16 v21;

  p_initDepth = (pxrInternal__aapl__pxrReserved__::UsdPrimRange::iterator *)&self->_range._initDepth;
  p_range = (Usd_PrimData *)&self->_range;
  end = self->_range._end;
  v18 = (Usd_PrimData *)&self->_range;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
  v5 = 0;
  v20 = 0;
  v21 = 0;
  if (self->_it._underlyingIterator == v18)
    v5 = *(Usd_PrimData **)p_initDepth == end
      && self->_it._range == v19
      && !LODWORD(self->_it._proxyPrimPath._primPart._poolHandle)
      && !BYTE4(self->_it._proxyPrimPath._primPart._poolHandle)
      && BYTE5(self->_it._proxyPrimPath._primPart._poolHandle) == 0;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v19);
  if (v5)
    return 0;
  end = self->_range._end;
  v18 = p_range;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
  v20 = 0;
  v21 = 0;
  if (self->_it._underlyingIterator == p_range
    && *(Usd_PrimData **)p_initDepth == end
    && self->_it._range == v19
    && !LODWORD(self->_it._proxyPrimPath._primPart._poolHandle)
    && !BYTE4(self->_it._proxyPrimPath._primPart._poolHandle)
    && !BYTE5(self->_it._proxyPrimPath._primPart._poolHandle))
  {
    v10 = 0;
  }
  else
  {
    v7 = [USKNode alloc];
    sub_226401A34((uint64_t)p_initDepth, (uint64_t)&v13);
    v10 = (void *)objc_msgSend_initWithUsdPrim_(v7, v8, (uint64_t)&v13, v9);
    if ((v16 & 7) != 0)
    {
      v11 = (unsigned int *)(v16 & 0xFFFFFFFFFFFFFFF8);
      do
        v12 = __ldxr(v11);
      while (__stlxr(v12 - 2, v11));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v15);
    if (v14)
      sub_2263DA640(v14);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v19);
  pxrInternal__aapl__pxrReserved__::UsdPrimRange::iterator::increment(p_initDepth);
  return v10;
}

- (void).cxx_destruct
{
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&self->_it._range);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&self->_range._initProxyPrimPath);
}

- (id).cxx_construct
{
  self->_range._begin = 0;
  self->_range._end = 0;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
  self->_range._initProxyPrimPath._propPart._poolHandle = 0;
  self->_range._predicate._mask.__first_ = 0;
  LOBYTE(self->_range._predicate._values.__first_) = 0;
  *(_DWORD *)&self->_range._predicate._negate = 0;
  *(&self->_range._predicate._negate + 4) = 0;
  *(_QWORD *)&self->_range._initDepth = 0;
  self->_it._underlyingIterator = 0;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
  LODWORD(self->_it._proxyPrimPath._primPart._poolHandle) = 0;
  WORD2(self->_it._proxyPrimPath._primPart._poolHandle) = 0;
  return self;
}

@end
