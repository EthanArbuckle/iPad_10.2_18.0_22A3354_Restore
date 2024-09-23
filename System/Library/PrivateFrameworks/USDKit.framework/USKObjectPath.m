@implementation USKObjectPath

- (SdfPath)path
{
  _DWORD *v2;
  _DWORD *v4;
  Ptr *v5;
  Ptr *v6;
  SdfPath result;

  v4 = sub_2263BDDD8(v2, &self->_path);
  v5 = (Ptr *)sub_2263BDE28(v4 + 1, (_DWORD *)&self->_path._primPart._poolHandle + 1);
  result._propPart._poolHandle = v6;
  result._primPart._poolHandle = v5;
  return result;
}

- (USKObjectPath)init
{
  USKObjectPath *v3;
  USKObjectPath *v4;
  uint64_t v6;
  objc_super v7;

  sub_2263F8F84();
  v7.receiver = self;
  v7.super_class = (Class)USKObjectPath;
  v3 = -[USKObjectPath init](&v7, sel_init);
  if (v3)
  {
    v6 = 0;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
    sub_2263BE05C((uint64_t)&v3->_path, (int *)&v6);
    sub_2263BE0B0((uint64_t)&v3->_path._primPart._poolHandle + 4);
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v6);
    v4 = v3;
  }

  return v3;
}

- (USKObjectPath)initWithSdfPath:(SdfPath)a3
{
  Handle poolHandle;
  USKObjectPath *v5;
  USKObjectPath *v6;
  USKObjectPath *v7;
  objc_super v9;

  poolHandle = a3._primPart._poolHandle;
  sub_2263F8F84();
  v9.receiver = self;
  v9.super_class = (Class)USKObjectPath;
  v5 = -[USKObjectPath init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    sub_2263C0080((uint64_t)&v5->_path, poolHandle);
    sub_2263C00D4((uint64_t)&v6->_path._primPart._poolHandle + 4, (_DWORD *)poolHandle + 1);
    v7 = v6;
  }

  return v6;
}

- (USKObjectPath)initWithString:(id)a3
{
  id v4;
  USKObjectPath *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  USKObjectPath *v11;
  void *__p[2];
  char v14;
  int v15;
  objc_super v16;

  v4 = a3;
  sub_2263F8F84();
  v16.receiver = self;
  v16.super_class = (Class)USKObjectPath;
  v5 = -[USKObjectPath init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_retainAutorelease(v4);
    v10 = (char *)objc_msgSend_UTF8String(v6, v7, v8, v9);
    sub_2263AE2A8(__p, v10);
    MEMORY[0x2276976B4](&v15, __p);
    sub_2263BE05C((uint64_t)&v5->_path, &v15);
    sub_2263BE0B0((uint64_t)&v5->_path._primPart._poolHandle + 4);
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v15);
    if (v14 < 0)
      operator delete(__p[0]);
    v11 = v5;
  }

  return v5;
}

- (USKObjectPath)initWithToken:(id)a3
{
  id v4;
  USKObjectPath *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  USKObjectPath *v9;
  uint64_t EmptyString;
  unsigned int *v11;
  unsigned int v12;
  USKObjectPath *v13;
  uint64_t v15;
  int v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)USKObjectPath;
  v5 = -[USKObjectPath init](&v17, sel_init);
  v9 = v5;
  if (!v5)
    goto LABEL_11;
  if (!v4)
  {
    v15 = 0;
    goto LABEL_6;
  }
  v5 = (USKObjectPath *)objc_msgSend_token(v4, v6, v7, v8);
  if ((v15 & 0xFFFFFFFFFFFFFFF8) == 0)
  {
LABEL_6:
    EmptyString = pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString((pxrInternal__aapl__pxrReserved__::TfToken *)v5);
    goto LABEL_7;
  }
  EmptyString = (v15 & 0xFFFFFFFFFFFFFFF8) + 16;
LABEL_7:
  MEMORY[0x2276976B4](&v16, EmptyString);
  sub_2263BE05C((uint64_t)&v9->_path, &v16);
  sub_2263BE0B0((uint64_t)&v9->_path._primPart._poolHandle + 4);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v16);
  if ((v15 & 7) != 0)
  {
    v11 = (unsigned int *)(v15 & 0xFFFFFFFFFFFFFFF8);
    do
      v12 = __ldxr(v11);
    while (__stlxr(v12 - 2, v11));
  }
  v13 = v9;
LABEL_11:

  return v9;
}

- (id)stringValue
{
  SdfPath *p_path;
  void *v3;
  uint64_t String;
  const char *v5;
  uint64_t v6;
  void *v7;

  p_path = &self->_path;
  if (pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::operator BOOL())
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    String = pxrInternal__aapl__pxrReserved__::SdfPath::GetString((pxrInternal__aapl__pxrReserved__::SdfPath *)p_path);
    if (*(char *)(String + 23) >= 0)
      objc_msgSend_stringWithUTF8String_(v3, v5, String, v6);
    else
      objc_msgSend_stringWithUTF8String_(v3, v5, *(_QWORD *)String, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)pathByAppendingPropertyComponent:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  USKObjectPath *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = 0;
  v4 = objc_retainAutorelease(a3);
  v8 = objc_msgSend_UTF8String(v4, v5, v6, v7);
  MEMORY[0x2276976D8](&v18, v8);
  pxrInternal__aapl__pxrReserved__::SdfPath::AppendProperty((pxrInternal__aapl__pxrReserved__::SdfPath *)&self->_path, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v18);
  if ((v18 & 7) != 0)
  {
    v9 = (unsigned int *)(v18 & 0xFFFFFFFFFFFFFFF8);
    do
      v10 = __ldxr(v9);
    while (__stlxr(v10 - 2, v9));
  }
  v11 = [USKObjectPath alloc];
  sub_2263BDDD8(&v16, &v19);
  sub_2263BDE28(&v17, (_DWORD *)&v19 + 1);
  v14 = (void *)objc_msgSend_initWithSdfPath_(v11, v12, (uint64_t)&v16, v13);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v16);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v19);

  return v14;
}

- (id)tokenValue
{
  SdfPath *p_path;
  USKToken *v3;
  const char *v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  void *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int *v13;

  p_path = &self->_path;
  if (pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::operator BOOL())
  {
    v3 = [USKToken alloc];
    v6 = *(unsigned int **)pxrInternal__aapl__pxrReserved__::SdfPath::GetToken((pxrInternal__aapl__pxrReserved__::SdfPath *)p_path);
    v13 = v6;
    if ((v6 & 7) != 0)
    {
      v7 = (unsigned int *)((unint64_t)v6 & 0xFFFFFFFFFFFFFFF8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 2, v7));
      if ((v8 & 1) == 0)
        v13 = v7;
    }
    v9 = (void *)objc_msgSend_initWithTfToken_(v3, v4, (uint64_t)&v13, v5);
    if ((v13 & 7) != 0)
    {
      v10 = (unsigned int *)((unint64_t)v13 & 0xFFFFFFFFFFFFFFF8);
      do
        v11 = __ldxr(v10);
      while (__stlxr(v11 - 2, v10));
    }
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)isNodePath
{
  return pxrInternal__aapl__pxrReserved__::SdfPath::IsPrimPath((pxrInternal__aapl__pxrReserved__::SdfPath *)&self->_path);
}

- (id)nodePath
{
  USKObjectPath *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  _BYTE v8[8];

  v3 = [USKObjectPath alloc];
  pxrInternal__aapl__pxrReserved__::SdfPath::GetPrimPath((pxrInternal__aapl__pxrReserved__::SdfPath *)&self->_path);
  v6 = (void *)objc_msgSend_initWithSdfPath_(v3, v4, (uint64_t)v8, v5);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)v8);
  return v6;
}

- (BOOL)isPropertyPath
{
  return pxrInternal__aapl__pxrReserved__::SdfPath::IsPropertyPath((pxrInternal__aapl__pxrReserved__::SdfPath *)&self->_path);
}

- (id)propertyName
{
  USKToken *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  unsigned int *v7;
  unsigned int v8;
  uint64_t v10;

  v3 = [USKToken alloc];
  pxrInternal__aapl__pxrReserved__::SdfPath::GetElementToken((pxrInternal__aapl__pxrReserved__::SdfPath *)&self->_path);
  v6 = (void *)objc_msgSend_initWithTfToken_(v3, v4, (uint64_t)&v10, v5);
  if ((v10 & 7) != 0)
  {
    v7 = (unsigned int *)(v10 & 0xFFFFFFFFFFFFFFF8);
    do
      v8 = __ldxr(v7);
    while (__stlxr(v8 - 2, v7));
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  USKObjectPath *v4;
  USKObjectPath *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  Handle poolHandle;
  Ptr *v10;
  BOOL v11;
  Ptr *v13;

  v4 = (USKObjectPath *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_path(v5, v6, v7, v8);
    poolHandle = self->_path._primPart._poolHandle;
    v10 = v13;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    v11 = poolHandle == v10;
    sub_2263BDE64((uint64_t)&v13);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return bswap64(0x9E3779B97F4A7C55* (HIDWORD(self->_path._primPart._poolHandle)+ ((HIDWORD(self->_path._primPart._poolHandle)+ (unint64_t)LODWORD(self->_path._primPart._poolHandle)+ (HIDWORD(self->_path._primPart._poolHandle) + (unint64_t)LODWORD(self->_path._primPart._poolHandle))* (HIDWORD(self->_path._primPart._poolHandle) + (unint64_t)LODWORD(self->_path._primPart._poolHandle))) >> 1)));
}

- (void).cxx_destruct
{
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&self->_path);
}

- (id).cxx_construct
{
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
  return self;
}

@end
