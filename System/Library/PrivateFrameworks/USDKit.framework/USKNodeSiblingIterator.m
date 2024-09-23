@implementation USKNodeSiblingIterator

- (USKNodeSiblingIterator)initWithSiblingRange:(const void *)a3
{
  USKNodeSiblingIterator *v4;
  USKNodeSiblingIterator *v5;
  __int128 v6;
  char v7;
  USKNodeSiblingIterator *v8;
  Usd_PrimData *v10;
  int v11;
  int v12;
  __int128 v13;
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)USKNodeSiblingIterator;
  v4 = -[USKNodeSiblingIterator init](&v15, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_range._begin._underlyingIterator = *(Usd_PrimData **)a3;
    sub_2263C0080((uint64_t)&v4->_range._begin._proxyPrimPath, (_DWORD *)a3 + 2);
    sub_2263C00D4((uint64_t)&v5->_range._begin._proxyPrimPath._primPart._poolHandle + 4, (_DWORD *)a3 + 3);
    v6 = *((_OWORD *)a3 + 1);
    LOBYTE(v5->_range._begin._predicate._values.__first_) = *((_BYTE *)a3 + 32);
    *(_OWORD *)&v5->_range._begin._proxyPrimPath._propPart._poolHandle = v6;
    *(_QWORD *)&v5->_range._begin._predicate._negate = *((_QWORD *)a3 + 5);
    sub_2263C0080((uint64_t)&v5->_range._end, (_DWORD *)a3 + 12);
    sub_2263C00D4((uint64_t)&v5->_range._end._underlyingIterator + 4, (_DWORD *)a3 + 13);
    v7 = *((_BYTE *)a3 + 72);
    v5->_range._end._proxyPrimPath = *(SdfPath *)((char *)a3 + 56);
    LOBYTE(v5->_range._end._predicate._mask.__first_) = v7;
    v10 = *(Usd_PrimData **)a3;
    sub_2263BDDD8(&v11, (_DWORD *)a3 + 2);
    sub_2263BDE28(&v12, (_DWORD *)a3 + 3);
    v13 = *((_OWORD *)a3 + 1);
    v14 = *((_QWORD *)a3 + 4);
    v5->_range._end._predicate._values.__first_ = (unint64_t)v10;
    sub_2263BE05C((uint64_t)&v5->_range._end._predicate._negate, &v11);
    sub_2263BE0B0((uint64_t)(&v5->_range._end._predicate._negate + 4));
    *(_OWORD *)&v5->_it._underlyingIterator = v13;
    LOBYTE(v5->_it._proxyPrimPath._propPart._poolHandle) = v14;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v11);
    v8 = v5;
  }

  return v5;
}

- (USKNodeSiblingIterator)initWithPrim:(const void *)a3
{
  uint64_t *UsdPrimDefaultPredicate;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  USKNodeSiblingIterator *v11;
  _BYTE v13[8];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16[3];

  UsdPrimDefaultPredicate = (uint64_t *)pxrInternal__aapl__pxrReserved__::GetUsdPrimDefaultPredicate((pxrInternal__aapl__pxrReserved__ *)self);
  v6 = *UsdPrimDefaultPredicate;
  v7 = UsdPrimDefaultPredicate[1];
  v8 = UsdPrimDefaultPredicate[2];
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::operator BOOL();
  v16[0] = v6 & 0xFFFFFFFFFFFFDFFFLL;
  v16[1] = v7 | 0x2000;
  v16[2] = v8;
  sub_2264022F8((uint64_t)a3, v16, (uint64_t)v13);
  v11 = (USKNodeSiblingIterator *)(id)objc_msgSend_initWithSiblingRange_(self, v9, (uint64_t)v13, v10);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v15);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v14);

  return v11;
}

- (USKNodeSiblingIterator)initWithPrim:(const void *)a3 withPredicate:(Usd_PrimFlagsPredicate *)a4
{
  unint64_t first;
  unint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  USKNodeSiblingIterator *v11;
  _BYTE v13[8];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16[3];

  first = a4->_mask.__first_;
  v7 = a4->_values.__first_;
  v8 = *(_QWORD *)&a4->_negate;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::operator BOOL();
  v16[0] = first & 0xFFFFFFFFFFFFDFFFLL;
  v16[1] = v7 | 0x2000;
  v16[2] = v8;
  sub_2264022F8((uint64_t)a3, v16, (uint64_t)v13);
  v11 = (USKNodeSiblingIterator *)(id)objc_msgSend_initWithSiblingRange_(self, v9, (uint64_t)v13, v10);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v15);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v14);

  return v11;
}

- (id)nextObject
{
  UsdPrimSiblingIterator *p_end;
  unint64_t first;
  bitset<15UL> *p_values;
  char v6;
  void *v8;
  USKNode *v9;
  const char *v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  _BYTE v14[8];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  SdfPath proxyPrimPath;
  unint64_t v20;

  *(_QWORD *)&v18 = *(_QWORD *)&self->_range._begin._predicate._negate;
  p_end = &self->_range._end;
  sub_2263BDDD8((_DWORD *)&v18 + 2, &self->_range._end);
  sub_2263BDE28((_DWORD *)&v18 + 3, (_DWORD *)&self->_range._end._underlyingIterator + 1);
  p_values = &self->_range._end._predicate._values;
  first = self->_range._end._predicate._values.__first_;
  proxyPrimPath = self->_range._end._proxyPrimPath;
  v20 = self->_range._end._predicate._mask.__first_;
  if (__PAIR128__(*(_QWORD *)&self->_range._end._predicate._negate, first) == v18)
    v6 = sub_226402C28((uint64_t)&self->_it, (uint64_t)&proxyPrimPath);
  else
    v6 = 0;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v18 + 8);
  if ((v6 & 1) != 0)
    return 0;
  *(_QWORD *)&v18 = *(_QWORD *)&self->_range._begin._predicate._negate;
  sub_2263BDDD8((_DWORD *)&v18 + 2, p_end);
  sub_2263BDE28((_DWORD *)&v18 + 3, (_DWORD *)&self->_range._end._underlyingIterator + 1);
  proxyPrimPath = self->_range._end._proxyPrimPath;
  v20 = self->_range._end._predicate._mask.__first_;
  if (*(_OWORD *)&self->_range._end._predicate._values.__first_ == v18
    && (sub_226402C28((uint64_t)&self->_it, (uint64_t)&proxyPrimPath) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = [USKNode alloc];
    sub_226402C9C((uint64_t)p_values, (uint64_t)v14);
    v8 = (void *)objc_msgSend_initWithUsdPrim_(v9, v10, (uint64_t)v14, v11);
    if ((v17 & 7) != 0)
    {
      v12 = (unsigned int *)(v17 & 0xFFFFFFFFFFFFFFF8);
      do
        v13 = __ldxr(v12);
      while (__stlxr(v13 - 2, v12));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v16);
    if (v15)
      sub_2263DA640(v15);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v18 + 8);
  sub_226402B08((uint64_t)p_values);
  return v8;
}

- (void).cxx_destruct
{
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&self->_range._end._predicate._negate);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&self->_range._end);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&self->_range._begin._proxyPrimPath);
}

- (id).cxx_construct
{
  sub_226402D14((uint64_t)&self->_range);
  self->_range._end._predicate._values.__first_ = 0;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
  self->_it._underlyingIterator = 0;
  self->_it._proxyPrimPath._primPart._poolHandle = 0;
  LOBYTE(self->_it._proxyPrimPath._propPart._poolHandle) = 0;
  return self;
}

@end
