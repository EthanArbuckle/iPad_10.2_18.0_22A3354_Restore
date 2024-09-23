@implementation USKProperty

- (NSString)type
{
  UsdProperty *p_property;
  pxrInternal__aapl__pxrReserved__::SdfSchemaBase *Instance;
  const pxrInternal__aapl__pxrReserved__::TfType *Type;
  const char *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int v10;
  __CFString *v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int *v16;
  unsigned int v17;
  __CFString **v18;
  unsigned int *v20;
  uint64_t v21;
  uint64_t TypeName;
  uint64_t v23;
  unsigned int *v24;
  __int128 v25;
  __int128 v26;

  p_property = &self->_property;
  if (p_property->_type == 4)
  {
    v18 = &USKDataTypeObjectPathArray;
LABEL_26:
    v11 = *v18;
    return (NSString *)v11;
  }
  if (p_property->_type != 3)
  {
    v18 = &USKDataTypeUnknown;
    goto LABEL_26;
  }
  v25 = 0u;
  v26 = 0u;
  sub_2263DC6FC((uint64_t)p_property, (uint64_t)&v25);
  v24 = 0;
  Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_24EDD5B58);
  if (!Instance)
    Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
  TypeName = pxrInternal__aapl__pxrReserved__::UsdAttribute::GetTypeName((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v25);
  Type = (const pxrInternal__aapl__pxrReserved__::TfType *)pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetType((pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&TypeName);
  v21 = 0;
  v23 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(Instance, Type, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v21);
  pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken((pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v23);
  if ((v21 & 7) != 0)
  {
    v7 = (unsigned int *)(v21 & 0xFFFFFFFFFFFFFFF8);
    do
      v8 = __ldxr(v7);
    while (__stlxr(v8 - 2, v7));
  }
  v20 = v24;
  if ((v24 & 7) != 0)
  {
    v9 = (unsigned int *)((unint64_t)v24 & 0xFFFFFFFFFFFFFFF8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 2, v9));
    if ((v10 & 1) == 0)
      v20 = v9;
  }
  objc_msgSend_dataTypeWithTfToken_(USKToken, v5, (uint64_t)&v20, v6);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((v20 & 7) != 0)
  {
    v12 = (unsigned int *)((unint64_t)v20 & 0xFFFFFFFFFFFFFFF8);
    do
      v13 = __ldxr(v12);
    while (__stlxr(v13 - 2, v12));
  }
  if ((v24 & 7) != 0)
  {
    v14 = (unsigned int *)((unint64_t)v24 & 0xFFFFFFFFFFFFFFF8);
    do
      v15 = __ldxr(v14);
    while (__stlxr(v15 - 2, v14));
  }
  if ((BYTE8(v26) & 7) != 0)
  {
    v16 = (unsigned int *)(*((_QWORD *)&v26 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v17 = __ldxr(v16);
    while (__stlxr(v17 - 2, v16));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v26);
  if (*((_QWORD *)&v25 + 1))
    sub_2263DA640(*((uint64_t *)&v25 + 1));
  return (NSString *)v11;
}

- (USKToken)typeName
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend_type(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenWithDataType_(USKToken, v5, (uint64_t)v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (USKToken *)v7;
}

- (NSString)role
{
  UsdProperty *p_property;
  const char *v3;
  uint64_t v4;
  __CFString *v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;

  p_property = &self->_property;
  if (p_property->_type == 3)
  {
    v15 = 0u;
    v16 = 0u;
    sub_2263DC6FC((uint64_t)p_property, (uint64_t)&v15);
    v14 = 0;
    pxrInternal__aapl__pxrReserved__::UsdAttribute::GetRoleName((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v15);
    v13 = 0;
    objc_msgSend_roleTypeWithTfToken_(USKToken, v3, (uint64_t)&v13, v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((v13 & 7) != 0)
    {
      v6 = (unsigned int *)(v13 & 0xFFFFFFFFFFFFFFF8);
      do
        v7 = __ldxr(v6);
      while (__stlxr(v7 - 2, v6));
    }
    if ((v14 & 7) != 0)
    {
      v8 = (unsigned int *)(v14 & 0xFFFFFFFFFFFFFFF8);
      do
        v9 = __ldxr(v8);
      while (__stlxr(v9 - 2, v8));
    }
    if ((BYTE8(v16) & 7) != 0)
    {
      v10 = (unsigned int *)(*((_QWORD *)&v16 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v11 = __ldxr(v10);
      while (__stlxr(v11 - 2, v10));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v16);
    if (*((_QWORD *)&v15 + 1))
      sub_2263DA640(*((uint64_t *)&v15 + 1));
  }
  else
  {
    v5 = CFSTR("None");
  }
  return (NSString *)v5;
}

- (USKToken)roleName
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend_role(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenWithRoleType_(USKToken, v5, (uint64_t)v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (USKToken *)v7;
}

- (USKProperty)initWithUsdProperty:(UsdProperty *)a3
{
  USKProperty *v4;
  Usd_PrimData *px;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  USKProperty *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)USKProperty;
  v4 = -[USKProperty init](&v11, sel_init);
  if (v4 && (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)a3) & 1) != 0)
  {
    v4->_property._type = a3->_type;
    px = a3->_prim._p.px;
    if (px)
    {
      v6 = (unint64_t *)((char *)px + 48);
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
    }
    v8 = (uint64_t)v4->_property._prim._p.px;
    v4->_property._prim._p.px = px;
    if (v8)
      sub_2263DA640(v8);
    sub_2263C0080((uint64_t)&v4->_property._proxyPrimPath, &a3->_proxyPrimPath);
    sub_2263C00D4((uint64_t)&v4->_property._proxyPrimPath._primPart._poolHandle + 4, (_DWORD *)&a3->_proxyPrimPath._primPart._poolHandle + 1);
    sub_2263BE4E4(&v4->_property._proxyPrimPath._propPart._poolHandle, &a3->_proxyPrimPath._propPart._poolHandle);
    v9 = v4;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (USKProperty)initWithUsdProperty:(UsdProperty *)a3 withSceneOwner:(id)a4
{
  id v7;
  USKProperty *v8;
  Usd_PrimData *px;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  USKProperty *v13;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)USKProperty;
  v8 = -[USKProperty init](&v15, sel_init);
  if (v8 && (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)a3) & 1) != 0)
  {
    v8->_property._type = a3->_type;
    px = a3->_prim._p.px;
    if (px)
    {
      v10 = (unint64_t *)((char *)px + 48);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    v12 = (uint64_t)v8->_property._prim._p.px;
    v8->_property._prim._p.px = px;
    if (v12)
      sub_2263DA640(v12);
    sub_2263C0080((uint64_t)&v8->_property._proxyPrimPath, &a3->_proxyPrimPath);
    sub_2263C00D4((uint64_t)&v8->_property._proxyPrimPath._primPart._poolHandle + 4, (_DWORD *)&a3->_proxyPrimPath._primPart._poolHandle + 1);
    sub_2263BE4E4(&v8->_property._proxyPrimPath._propPart._poolHandle, &a3->_proxyPrimPath._propPart._poolHandle);
    objc_storeStrong((id *)&v8->_property._propName._rep._ptrAndBits, a4);
    v13 = v8;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (USKProperty)initWithUsdProperty:(UsdProperty *)a3 withNodeOwner:(id)a4
{
  id v7;
  USKProperty *v8;
  Usd_PrimData *px;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  USKProperty *v13;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)USKProperty;
  v8 = -[USKProperty init](&v15, sel_init);
  if (v8 && (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)a3) & 1) != 0)
  {
    v8->_property._type = a3->_type;
    px = a3->_prim._p.px;
    if (px)
    {
      v10 = (unint64_t *)((char *)px + 48);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    v12 = (uint64_t)v8->_property._prim._p.px;
    v8->_property._prim._p.px = px;
    if (v12)
      sub_2263DA640(v12);
    sub_2263C0080((uint64_t)&v8->_property._proxyPrimPath, &a3->_proxyPrimPath);
    sub_2263C00D4((uint64_t)&v8->_property._proxyPrimPath._primPart._poolHandle + 4, (_DWORD *)&a3->_proxyPrimPath._primPart._poolHandle + 1);
    sub_2263BE4E4(&v8->_property._proxyPrimPath._propPart._poolHandle, &a3->_proxyPrimPath._propPart._poolHandle);
    objc_storeStrong((id *)&v8->_sceneOwner, a4);
    v13 = v8;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)parentNode
{
  USKNode *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  unsigned int *v7;
  unsigned int v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = [USKNode alloc];
  sub_2263E3F28((uint64_t)&v10, (uint64_t *)&self->_property._prim, &self->_property._proxyPrimPath);
  v6 = (void *)objc_msgSend_initWithUsdPrim_(v3, v4, (uint64_t)&v10, v5);
  if ((v13 & 7) != 0)
  {
    v7 = (unsigned int *)(v13 & 0xFFFFFFFFFFFFFFF8);
    do
      v8 = __ldxr(v7);
    while (__stlxr(v8 - 2, v7));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v12);
  if (v11)
    sub_2263DA640(v11);
  return v6;
}

- (unint64_t)arraySize
{
  unint64_t NumElements;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  sub_2263E6BC8(&self->_property._type, v4);
  NumElements = pxrInternal__aapl__pxrReserved__::VtValue::_GetNumElements((pxrInternal__aapl__pxrReserved__::VtValue *)v4);
  sub_2263AD568((uint64_t)v4);
  return NumElements;
}

- (unint64_t)arraySizeAtTime:(double)a3
{
  unint64_t NumElements;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  sub_2263E6BC8(&self->_property._type, v5);
  NumElements = pxrInternal__aapl__pxrReserved__::VtValue::_GetNumElements((pxrInternal__aapl__pxrReserved__::VtValue *)v5);
  sub_2263AD568((uint64_t)v5);
  return NumElements;
}

- (id)name
{
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

  v3 = [USKToken alloc];
  v6 = *(unsigned int **)sub_2263DE374(&self->_property._type);
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
  return v9;
}

- (id)path
{
  USKObjectPath *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  int v8;

  v3 = [USKObjectPath alloc];
  sub_2263E6F40((uint64_t)&self->_property, &v8);
  v6 = (void *)objc_msgSend_initWithSdfPath_(v3, v4, (uint64_t)&v8, v5);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v8);
  return v6;
}

- (UsdProperty)usdProperty
{
  UsdProperty *p_property;
  Usd_PrimData *px;
  unint64_t *v6;
  unint64_t v7;
  UsdProperty *result;
  Ptr *poolHandle;
  unsigned int *v10;
  unsigned int v11;

  p_property = &self->_property;
  retstr->_type = self->_property._type;
  px = self->_property._prim._p.px;
  retstr->_prim._p.px = px;
  if (px)
  {
    v6 = (unint64_t *)((char *)px + 48);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  sub_2263BDDD8(&retstr->_proxyPrimPath, &self->_property._proxyPrimPath);
  result = (UsdProperty *)sub_2263BDE28((_DWORD *)&retstr->_proxyPrimPath._primPart._poolHandle + 1, (_DWORD *)&p_property->_proxyPrimPath._primPart._poolHandle + 1);
  poolHandle = p_property->_proxyPrimPath._propPart._poolHandle;
  retstr->_proxyPrimPath._propPart._poolHandle = poolHandle;
  if ((poolHandle & 7) != 0)
  {
    v10 = (unsigned int *)((unint64_t)poolHandle & 0xFFFFFFFFFFFFFFF8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 2, v10));
    if ((v11 & 1) == 0)
      retstr->_proxyPrimPath._propPart._poolHandle = (Handle)((unint64_t)retstr->_proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
  }
  return result;
}

- (id)metadata
{
  void *v3;
  void *v4;
  const char *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  unint64_t EmptyString;
  void *v13;
  const char *v14;
  uint64_t v15;
  pxrInternal__aapl__pxrReserved__::SdfSchemaBase *Instance;
  unsigned int *v17;
  unsigned int v18;
  USKData *v19;
  const char *v20;
  unsigned int *v21;
  unsigned int v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  unsigned int *v26;
  unsigned int v27;
  USKData *v28;
  unsigned int *v29;
  unsigned int v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  unsigned int *v35;
  unsigned int v36;
  unsigned int *v37;
  unsigned int v38;
  unsigned int *v39;
  unsigned int v40;
  unsigned int *v41;
  unsigned int v42;
  _QWORD *v43;
  _QWORD **v44;
  BOOL v45;
  void *v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *__p[2];
  char v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  void *v61[2];
  __int128 v62;
  __int128 v63;
  _OWORD v64[9];
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  uint64_t v71;
  _QWORD v72[4];

  v72[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v67 = 0;
  v68[0] = 0;
  v68[1] = 0;
  pxrInternal__aapl__pxrReserved__::UsdObject::GetAllAuthoredMetadata((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_property);
  v6 = 0;
  if (v68)
  {
    v7 = *MEMORY[0x24BEDB7F0];
    v49 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
    v50 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
    v48 = MEMORY[0x24BEDB848] + 16;
    do
    {
      v71 = 0;
      v72[0] = 0;
      v72[1] = 0;
      v8 = sub_2263DA68C(&v71, v6 + 4);
      v11 = (void *)MEMORY[0x24BDD17C8];
      if ((v71 & 0xFFFFFFFFFFFFFFF8) != 0)
        EmptyString = (v71 & 0xFFFFFFFFFFFFFFF8) + 16;
      else
        EmptyString = pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString((pxrInternal__aapl__pxrReserved__::TfToken *)v8);
      if (*(char *)(EmptyString + 23) < 0)
        EmptyString = *(_QWORD *)EmptyString;
      objc_msgSend_stringWithUTF8String_(v11, v9, EmptyString, v10, v48);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v3, v14, (uint64_t)v13, v15);

      v66 = 0;
      Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_24EDD5B58);
      if (!Instance)
        Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
      __p[0] = 0;
      *(_QWORD *)&v56 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(Instance, (const pxrInternal__aapl__pxrReserved__::VtValue *)v72, (const pxrInternal__aapl__pxrReserved__::TfToken *)__p);
      pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken((pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v56);
      if (((uint64_t)__p[0] & 7) != 0)
      {
        v17 = (unsigned int *)((unint64_t)__p[0] & 0xFFFFFFFFFFFFFFF8);
        do
          v18 = __ldxr(v17);
        while (__stlxr(v18 - 2, v17));
      }
      if (v66)
      {
        v19 = [USKData alloc];
        sub_2263B0700(v69, v72);
        v51 = v66;
        if ((v66 & 7) != 0)
        {
          v21 = (unsigned int *)(v66 & 0xFFFFFFFFFFFFFFF8);
          do
            v22 = __ldxr(v21);
          while (__stxr(v22 + 2, v21));
          if ((v22 & 1) == 0)
            v51 &= 0xFFFFFFFFFFFFFFF8;
        }
        v23 = (void *)objc_msgSend_initWithVtValue_typeName_withPropertyOwner_(v19, v20, (uint64_t)v69, (uint64_t)&v51, self);
        objc_msgSend_addObject_(v4, v24, (uint64_t)v23, v25);

        if ((v51 & 7) != 0)
        {
          v26 = (unsigned int *)(v51 & 0xFFFFFFFFFFFFFFF8);
          do
            v27 = __ldxr(v26);
          while (__stlxr(v27 - 2, v26));
        }
        sub_2263AD568((uint64_t)v69);
      }
      else
      {
        v65 = 0;
        v63 = 0u;
        memset(v64, 0, sizeof(v64));
        *(_OWORD *)v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v56 = 0u;
        sub_2263B38C0((uint64_t)&v56);
        pxrInternal__aapl__pxrReserved__::operator<<();
        v28 = [USKData alloc];
        std::stringbuf::str();
        MEMORY[0x2276976E4](&v55, __p);
        v70[0] = v55;
        v70[1] = (char *)&off_24EDD7038 + 1;
        if ((v55 & 7) != 0)
        {
          v29 = (unsigned int *)(v55 & 0xFFFFFFFFFFFFFFF8);
          do
            v30 = __ldxr(v29);
          while (__stxr(v30 + 2, v29));
          if ((v30 & 1) == 0)
            v70[0] &= 0xFFFFFFFFFFFFFFF8;
        }
        MEMORY[0x2276976D8](&v52, "token");
        v32 = (void *)objc_msgSend_initWithVtValue_typeName_withPropertyOwner_(v28, v31, (uint64_t)v70, (uint64_t)&v52, self);
        objc_msgSend_addObject_(v4, v33, (uint64_t)v32, v34);

        if ((v52 & 7) != 0)
        {
          v35 = (unsigned int *)(v52 & 0xFFFFFFFFFFFFFFF8);
          do
            v36 = __ldxr(v35);
          while (__stlxr(v36 - 2, v35));
        }
        sub_2263AD568((uint64_t)v70);
        if ((v55 & 7) != 0)
        {
          v37 = (unsigned int *)(v55 & 0xFFFFFFFFFFFFFFF8);
          do
            v38 = __ldxr(v37);
          while (__stlxr(v38 - 2, v37));
        }
        if (v54 < 0)
          operator delete(__p[0]);
        *(_QWORD *)&v56 = v7;
        *(_QWORD *)((char *)&v56 + *(_QWORD *)(v7 - 24)) = v50;
        *(_QWORD *)&v57 = v49;
        *((_QWORD *)&v57 + 1) = v48;
        if (SHIBYTE(v62) < 0)
          operator delete(v61[1]);
        std::streambuf::~streambuf();
        std::iostream::~basic_iostream();
        MEMORY[0x2276980B0](v64);
      }
      if ((v66 & 7) != 0)
      {
        v39 = (unsigned int *)(v66 & 0xFFFFFFFFFFFFFFF8);
        do
          v40 = __ldxr(v39);
        while (__stlxr(v40 - 2, v39));
      }
      sub_2263AD568((uint64_t)v72);
      if ((v71 & 7) != 0)
      {
        v41 = (unsigned int *)(v71 & 0xFFFFFFFFFFFFFFF8);
        do
          v42 = __ldxr(v41);
        while (__stlxr(v42 - 2, v41));
      }
      v43 = (_QWORD *)v6[1];
      if (v43)
      {
        do
        {
          v44 = (_QWORD **)v43;
          v43 = (_QWORD *)*v43;
        }
        while (v43);
      }
      else
      {
        do
        {
          v44 = (_QWORD **)v6[2];
          v45 = *v44 == v6;
          v6 = v44;
        }
        while (!v45);
      }
      v6 = v44;
    }
    while (v44 != v68);
  }
  objc_msgSend_dictionaryWithObjects_forKeys_(MEMORY[0x24BDBCE70], v5, (uint64_t)v4, (uint64_t)v3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2263DB100((uint64_t)&v67, v68[0]);

  return v46;
}

- (BOOL)setMetadataWithKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  pxrInternal__aapl__pxrReserved__::SdfSchemaBase *Instance;
  const char *v14;
  const VtValue *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t Type;
  BOOL v21;
  uint64_t v22;
  char v23;
  unsigned int *v24;
  unsigned int v25;
  uint64_t v27;
  _QWORD v28[2];
  _QWORD v29[2];
  uint64_t v30;
  uint64_t v31;
  VtValue v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v27 = 0;
  v8 = objc_retainAutorelease(v6);
  v12 = objc_msgSend_UTF8String(v8, v9, v10, v11);
  MEMORY[0x2276976D8](&v27, v12);
  v32._storage = 0;
  v32._info._ptrAndBits = 0;
  Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_24EDD5B58);
  if (!Instance)
    Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
  if (pxrInternal__aapl__pxrReserved__::SdfSchemaBase::IsRegistered(Instance, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v27, (pxrInternal__aapl__pxrReserved__::VtValue *)&v32))
  {
    if (!v32._info._ptrAndBits)
      goto LABEL_12;
    Type = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v32);
    if (v7)
    {
      objc_msgSend_value(v7, v17, v18, v19);
    }
    else
    {
      v30 = 0;
      v31 = 0;
    }
    v22 = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v30);
    sub_2263AD568((uint64_t)&v30);
    if (Type == v22)
    {
LABEL_12:
      if (v7)
      {
        objc_msgSend_value(v7, v14, (uint64_t)v15, v16);
      }
      else
      {
        v30 = 0;
        v31 = 0;
      }
      v23 = pxrInternal__aapl__pxrReserved__::UsdObject::SetMetadata((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_property, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v27, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v30);
    }
    else
    {
      v30 = 0;
      v31 = 0;
      if (v7)
      {
        objc_msgSend_value(v7, v14, (uint64_t)v15, v16);
      }
      else
      {
        v28[0] = 0;
        v28[1] = 0;
      }
      pxrInternal__aapl__pxrReserved__::VtValue::CastToTypeOf((pxrInternal__aapl__pxrReserved__::VtValue *)v28, &v32, v15);
      sub_2263AD3FC(&v30, v29);
      sub_2263AD568((uint64_t)v29);
      sub_2263AD568((uint64_t)v28);
      v23 = pxrInternal__aapl__pxrReserved__::UsdObject::SetMetadata((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_property, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v27, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v30);
    }
    v21 = v23;
    sub_2263AD568((uint64_t)&v30);
  }
  else
  {
    v21 = 0;
  }
  sub_2263AD568((uint64_t)&v32);
  if ((v27 & 7) != 0)
  {
    v24 = (unsigned int *)(v27 & 0xFFFFFFFFFFFFFFF8);
    do
      v25 = __ldxr(v24);
    while (__stlxr(v25 - 2, v24));
  }

  return v21;
}

- (BOOL)setDictionaryMetadataWithKey:(id)a3 dictionaryKey:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  pxrInternal__aapl__pxrReserved__::SdfSchemaBase *Instance;
  pxrInternal__aapl__pxrReserved__::TfToken *v22;
  BOOL v23;
  _QWORD *ValueAtPath;
  const char *v25;
  const VtValue *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t Type;
  uint64_t v32;
  char v33;
  unsigned int *v34;
  unsigned int v35;
  unsigned int *v36;
  unsigned int v37;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];
  _QWORD v42[2];
  uint64_t v43;
  uint64_t v44;
  VtValue v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v40 = 0;
  v11 = objc_retainAutorelease(v8);
  v15 = objc_msgSend_UTF8String(v11, v12, v13, v14);
  MEMORY[0x2276976D8](&v40, v15);
  v39 = 0;
  v16 = objc_retainAutorelease(v9);
  v20 = objc_msgSend_UTF8String(v16, v17, v18, v19);
  MEMORY[0x2276976D8](&v39, v20);
  v45._storage = 0;
  v45._info._ptrAndBits = 0;
  Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_24EDD5B58);
  if (!Instance)
    Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
  if (pxrInternal__aapl__pxrReserved__::SdfSchemaBase::IsRegistered(Instance, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v40, (pxrInternal__aapl__pxrReserved__::VtValue *)&v45))
  {
    if (((uint64_t)v45._info._ptrAndBits & 4) != 0)
      v22 = (pxrInternal__aapl__pxrReserved__::TfToken *)(*(uint64_t (**)(VtValue *))(((unint64_t)v45._info._ptrAndBits & 0xFFFFFFFFFFFFFFF8)
                                                                                              + 168))(&v45);
    else
      v22 = (pxrInternal__aapl__pxrReserved__::TfToken *)sub_2263DB168((uint64_t *)&v45);
    if ((v39 & 0xFFFFFFFFFFFFFFF8) == 0)
      pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString(v22);
    ValueAtPath = (_QWORD *)pxrInternal__aapl__pxrReserved__::VtDictionary::GetValueAtPath();
    if (ValueAtPath)
    {
      sub_2263B2DCC(&v45, ValueAtPath);
    }
    else
    {
      v44 = 0;
      sub_2263AD3FC(&v45, &v43);
      sub_2263AD568((uint64_t)&v43);
    }
    if (!v45._info._ptrAndBits)
      goto LABEL_20;
    Type = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v45);
    if (v10)
    {
      objc_msgSend_value(v10, v28, v29, v30);
    }
    else
    {
      v43 = 0;
      v44 = 0;
    }
    v32 = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v43);
    sub_2263AD568((uint64_t)&v43);
    if (Type == v32)
    {
LABEL_20:
      if (v10)
      {
        objc_msgSend_value(v10, v25, (uint64_t)v26, v27);
      }
      else
      {
        v43 = 0;
        v44 = 0;
      }
      v33 = pxrInternal__aapl__pxrReserved__::UsdObject::SetMetadataByDictKey((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_property, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v40, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v39, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v43);
    }
    else
    {
      v43 = 0;
      v44 = 0;
      if (v10)
      {
        objc_msgSend_value(v10, v25, (uint64_t)v26, v27);
      }
      else
      {
        v41[0] = 0;
        v41[1] = 0;
      }
      pxrInternal__aapl__pxrReserved__::VtValue::CastToTypeOf((pxrInternal__aapl__pxrReserved__::VtValue *)v41, &v45, v26);
      sub_2263AD3FC(&v43, v42);
      sub_2263AD568((uint64_t)v42);
      sub_2263AD568((uint64_t)v41);
      v33 = pxrInternal__aapl__pxrReserved__::UsdObject::SetMetadataByDictKey((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_property, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v40, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v39, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v43);
    }
    v23 = v33;
    sub_2263AD568((uint64_t)&v43);
  }
  else
  {
    v23 = 0;
  }
  sub_2263AD568((uint64_t)&v45);
  if ((v39 & 7) != 0)
  {
    v34 = (unsigned int *)(v39 & 0xFFFFFFFFFFFFFFF8);
    do
      v35 = __ldxr(v34);
    while (__stlxr(v35 - 2, v34));
  }
  if ((v40 & 7) != 0)
  {
    v36 = (unsigned int *)(v40 & 0xFFFFFFFFFFFFFFF8);
    do
      v37 = __ldxr(v36);
    while (__stlxr(v37 - 2, v36));
  }

  return v23;
}

- (BOOL)setCustomMetadata:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  unsigned int *v21;
  unsigned int v22;
  unsigned int *v23;
  unsigned int v24;
  uint64_t v26;
  unsigned int *v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v27 = 0;
  v8 = atomic_load(MEMORY[0x24BEE7E98]);
  if (!v8)
    v8 = sub_2263DA79C(MEMORY[0x24BEE7E98]);
  v9 = *(unsigned int **)(v8 + 72);
  v27 = v9;
  if ((v9 & 7) != 0)
  {
    v10 = (unsigned int *)((unint64_t)v9 & 0xFFFFFFFFFFFFFFF8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 2, v10));
    if ((v11 & 1) == 0)
      v27 = v10;
  }
  v26 = 0;
  v12 = objc_retainAutorelease(v6);
  v16 = objc_msgSend_UTF8String(v12, v13, v14, v15);
  MEMORY[0x2276976D8](&v26, v16);
  if (v7)
  {
    objc_msgSend_value(v7, v17, v18, v19);
  }
  else
  {
    v28[0] = 0;
    v28[1] = 0;
  }
  v20 = pxrInternal__aapl__pxrReserved__::UsdObject::SetMetadataByDictKey((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_property, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v27, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v26, (const pxrInternal__aapl__pxrReserved__::VtValue *)v28);
  sub_2263AD568((uint64_t)v28);
  if ((v26 & 7) != 0)
  {
    v21 = (unsigned int *)(v26 & 0xFFFFFFFFFFFFFFF8);
    do
      v22 = __ldxr(v21);
    while (__stlxr(v22 - 2, v21));
  }
  if ((v27 & 7) != 0)
  {
    v23 = (unsigned int *)((unint64_t)v27 & 0xFFFFFFFFFFFFFFF8);
    do
      v24 = __ldxr(v23);
    while (__stlxr(v24 - 2, v23));
  }

  return v20;
}

- (id)metadataWithKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  USKData *v11;
  pxrInternal__aapl__pxrReserved__::SdfSchemaBase *Instance;
  const char *v13;
  void *v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int *v17;
  unsigned int v18;
  uint64_t v20;
  uint64_t Type;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v25 = 0;
  v26 = 0;
  v4 = objc_retainAutorelease(a3);
  v8 = objc_msgSend_UTF8String(v4, v5, v6, v7);
  MEMORY[0x2276976D8](&v23, v8);
  pxrInternal__aapl__pxrReserved__::UsdObject::GetMetadata((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_property, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v23, (pxrInternal__aapl__pxrReserved__::VtValue *)&v25);
  if ((v23 & 7) != 0)
  {
    v9 = (unsigned int *)(v23 & 0xFFFFFFFFFFFFFFF8);
    do
      v10 = __ldxr(v9);
    while (__stlxr(v10 - 2, v9));
  }
  if (v26)
  {
    v11 = [USKData alloc];
    sub_2263B0700(v24, &v25);
    Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_24EDD5B58);
    if (!Instance)
      Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
    v20 = 0;
    Type = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v25);
    v23 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(Instance, (const pxrInternal__aapl__pxrReserved__::TfType *)&Type, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v20);
    pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken((pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v23);
    v14 = (void *)objc_msgSend_initWithVtValue_typeName_withPropertyOwner_(v11, v13, (uint64_t)v24, (uint64_t)&v22, self);
    if ((v22 & 7) != 0)
    {
      v15 = (unsigned int *)(v22 & 0xFFFFFFFFFFFFFFF8);
      do
        v16 = __ldxr(v15);
      while (__stlxr(v16 - 2, v15));
    }
    if ((v20 & 7) != 0)
    {
      v17 = (unsigned int *)(v20 & 0xFFFFFFFFFFFFFFF8);
      do
        v18 = __ldxr(v17);
      while (__stlxr(v18 - 2, v17));
    }
    sub_2263AD568((uint64_t)v24);
  }
  else
  {
    v14 = 0;
  }
  sub_2263AD568((uint64_t)&v25);

  return v14;
}

- (id)dictionaryMetadataWithKey:(id)a3 dictionaryKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int *v20;
  unsigned int v21;
  USKData *v22;
  pxrInternal__aapl__pxrReserved__::SdfSchemaBase *Instance;
  const char *v24;
  void *v25;
  unsigned int *v26;
  unsigned int v27;
  unsigned int *v28;
  unsigned int v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t Type;
  uint64_t v34;
  _QWORD v35[2];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v36 = 0;
  v37 = 0;
  v8 = objc_retainAutorelease(v6);
  v12 = objc_msgSend_UTF8String(v8, v9, v10, v11);
  MEMORY[0x2276976D8](&v34, v12);
  v13 = objc_retainAutorelease(v7);
  v17 = objc_msgSend_UTF8String(v13, v14, v15, v16);
  MEMORY[0x2276976D8](&Type, v17);
  pxrInternal__aapl__pxrReserved__::UsdObject::GetMetadataByDictKey((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_property, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v34, (const pxrInternal__aapl__pxrReserved__::TfToken *)&Type, (pxrInternal__aapl__pxrReserved__::VtValue *)&v36);
  if ((Type & 7) != 0)
  {
    v18 = (unsigned int *)(Type & 0xFFFFFFFFFFFFFFF8);
    do
      v19 = __ldxr(v18);
    while (__stlxr(v19 - 2, v18));
  }
  if ((v34 & 7) != 0)
  {
    v20 = (unsigned int *)(v34 & 0xFFFFFFFFFFFFFFF8);
    do
      v21 = __ldxr(v20);
    while (__stlxr(v21 - 2, v20));
  }
  if (v37)
  {
    v22 = [USKData alloc];
    sub_2263B0700(v35, &v36);
    Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_24EDD5B58);
    if (!Instance)
      Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
    Type = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v36);
    v31 = 0;
    v34 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(Instance, (const pxrInternal__aapl__pxrReserved__::TfType *)&Type, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v31);
    pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken((pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v34);
    v25 = (void *)objc_msgSend_initWithVtValue_typeName_withPropertyOwner_(v22, v24, (uint64_t)v35, (uint64_t)&v32, self);
    if ((v32 & 7) != 0)
    {
      v26 = (unsigned int *)(v32 & 0xFFFFFFFFFFFFFFF8);
      do
        v27 = __ldxr(v26);
      while (__stlxr(v27 - 2, v26));
    }
    if ((v31 & 7) != 0)
    {
      v28 = (unsigned int *)(v31 & 0xFFFFFFFFFFFFFFF8);
      do
        v29 = __ldxr(v28);
      while (__stlxr(v29 - 2, v28));
    }
    sub_2263AD568((uint64_t)v35);
  }
  else
  {
    v25 = 0;
  }
  sub_2263AD568((uint64_t)&v36);

  return v25;
}

- (id)customMetadataWithKey:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  USKData *v13;
  pxrInternal__aapl__pxrReserved__::SdfSchemaBase *Instance;
  const char *v15;
  void *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int *v19;
  unsigned int v20;
  uint64_t v22;
  uint64_t Type;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27 = 0;
  v28 = 0;
  v5 = atomic_load(MEMORY[0x24BEE7E98]);
  if (!v5)
    v5 = sub_2263DA79C(MEMORY[0x24BEE7E98]);
  v6 = objc_retainAutorelease(v4);
  v10 = objc_msgSend_UTF8String(v6, v7, v8, v9);
  MEMORY[0x2276976D8](&v25, v10);
  pxrInternal__aapl__pxrReserved__::UsdObject::GetMetadataByDictKey((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_property, (const pxrInternal__aapl__pxrReserved__::TfToken *)(v5 + 72), (const pxrInternal__aapl__pxrReserved__::TfToken *)&v25, (pxrInternal__aapl__pxrReserved__::VtValue *)&v27);
  if ((v25 & 7) != 0)
  {
    v11 = (unsigned int *)(v25 & 0xFFFFFFFFFFFFFFF8);
    do
      v12 = __ldxr(v11);
    while (__stlxr(v12 - 2, v11));
  }
  if (v28)
  {
    v13 = [USKData alloc];
    sub_2263B0700(v26, &v27);
    Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_24EDD5B58);
    if (!Instance)
      Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
    v22 = 0;
    Type = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v27);
    v25 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(Instance, (const pxrInternal__aapl__pxrReserved__::TfType *)&Type, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v22);
    pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken((pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v25);
    v16 = (void *)objc_msgSend_initWithVtValue_typeName_withPropertyOwner_(v13, v15, (uint64_t)v26, (uint64_t)&v24, self);
    if ((v24 & 7) != 0)
    {
      v17 = (unsigned int *)(v24 & 0xFFFFFFFFFFFFFFF8);
      do
        v18 = __ldxr(v17);
      while (__stlxr(v18 - 2, v17));
    }
    if ((v22 & 7) != 0)
    {
      v19 = (unsigned int *)(v22 & 0xFFFFFFFFFFFFFFF8);
      do
        v20 = __ldxr(v19);
      while (__stlxr(v20 - 2, v19));
    }
    sub_2263AD568((uint64_t)v26);
  }
  else
  {
    v16 = 0;
  }
  sub_2263AD568((uint64_t)&v27);

  return v16;
}

- (id)connectedPropertyPath
{
  UsdProperty *p_property;
  unsigned int *v3;
  unsigned int v4;
  _QWORD v6[3];
  __int128 v7;
  __int128 v8;
  void **v9;

  p_property = &self->_property;
  if (p_property->_type == 3)
  {
    v7 = 0u;
    v8 = 0u;
    sub_2263DC6FC((uint64_t)p_property, (uint64_t)&v7);
    if (pxrInternal__aapl__pxrReserved__::UsdAttribute::HasAuthoredConnections((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v7))
    {
      memset(v6, 0, sizeof(v6));
      pxrInternal__aapl__pxrReserved__::UsdAttribute::GetConnections();
      v9 = (void **)v6;
      sub_2263BE380(&v9);
    }
    if ((BYTE8(v8) & 7) != 0)
    {
      v3 = (unsigned int *)(*((_QWORD *)&v8 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v4 = __ldxr(v3);
      while (__stlxr(v4 - 2, v3));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v8);
    if (*((_QWORD *)&v7 + 1))
      sub_2263DA640(*((uint64_t *)&v7 + 1));
  }
  return 0;
}

- (id)connectedPropertyPaths
{
  void *v2;
  UsdProperty *p_property;
  int HasAuthoredConnections;
  char v5;
  id v6;
  const char *v7;
  uint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  _QWORD v12[3];
  __int128 v13;
  __int128 v14;
  void **v15;

  p_property = &self->_property;
  if (p_property->_type != 3)
    goto LABEL_10;
  v13 = 0u;
  v14 = 0u;
  sub_2263DC6FC((uint64_t)p_property, (uint64_t)&v13);
  HasAuthoredConnections = pxrInternal__aapl__pxrReserved__::UsdAttribute::HasAuthoredConnections((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v13);
  v5 = HasAuthoredConnections;
  if (HasAuthoredConnections)
  {
    memset(v12, 0, sizeof(v12));
    pxrInternal__aapl__pxrReserved__::UsdAttribute::GetConnections();
    v6 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v2 = (void *)objc_msgSend_initWithCapacity_(v6, v7, 0, v8);
    v15 = (void **)v12;
    sub_2263BE380(&v15);
  }
  if ((BYTE8(v14) & 7) != 0)
  {
    v9 = (unsigned int *)(*((_QWORD *)&v14 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v10 = __ldxr(v9);
    while (__stlxr(v10 - 2, v9));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v14);
  if (*((_QWORD *)&v13 + 1))
    sub_2263DA640(*((uint64_t *)&v13 + 1));
  if ((v5 & 1) == 0)
LABEL_10:
    v2 = 0;
  return v2;
}

- (BOOL)setConnectionWithTargetPaths:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  _DWORD *v18;
  _DWORD *v19;
  char v20;
  unsigned int *v21;
  unsigned int v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  _DWORD *v29;
  unint64_t v30;
  __int128 v31;
  __int128 v32;
  void **v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_property._type == 3)
  {
    v31 = 0u;
    v32 = 0u;
    sub_2263DC6FC((uint64_t)&self->_property, (uint64_t)&v31);
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v8 = objc_msgSend_count(v4, v5, v6, v7);
    sub_2263E8CAC(&v28, v8);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = v4;
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v24, (uint64_t)v34, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v9);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (v17)
            objc_msgSend_path(v17, v11, v12, v13, (_QWORD)v24);
          else
            v33 = 0;
          v18 = v29;
          if ((unint64_t)v29 >= v30)
          {
            v19 = (_DWORD *)sub_2263F39C8(&v28, &v33);
          }
          else
          {
            sub_2263BE108(v29, &v33);
            sub_2263BE140(v18 + 1, (_DWORD *)&v33 + 1);
            v19 = v18 + 2;
          }
          v29 = v19;
          pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
          sub_2263BDE64((uint64_t)&v33);
        }
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v24, (uint64_t)v34, 16);
      }
      while (v14);
    }

    v20 = pxrInternal__aapl__pxrReserved__::UsdAttribute::SetConnections();
    v33 = (void **)&v28;
    sub_2263BE380(&v33);
    if ((BYTE8(v32) & 7) != 0)
    {
      v21 = (unsigned int *)(*((_QWORD *)&v32 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v22 = __ldxr(v21);
      while (__stlxr(v22 - 2, v21));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v32);
    if (*((_QWORD *)&v31 + 1))
      sub_2263DA640(*((uint64_t *)&v31 + 1));
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)clearConnections
{
  UsdProperty *p_property;
  unsigned int *v3;
  unsigned int v4;
  __int128 v5;
  __int128 v6;

  p_property = &self->_property;
  if (p_property->_type == 3)
  {
    v5 = 0u;
    v6 = 0u;
    sub_2263DC6FC((uint64_t)p_property, (uint64_t)&v5);
    pxrInternal__aapl__pxrReserved__::UsdAttribute::ClearConnections((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v5);
    if ((BYTE8(v6) & 7) != 0)
    {
      v3 = (unsigned int *)(*((_QWORD *)&v6 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v4 = __ldxr(v3);
      while (__stlxr(v4 - 2, v3));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v6);
    if (*((_QWORD *)&v5 + 1))
      sub_2263DA640(*((uint64_t *)&v5 + 1));
  }
}

- (void)clearMetadata
{
  UsdProperty *p_property;
  _QWORD *v3;
  unint64_t *v4;
  unint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  _QWORD *v8;
  _QWORD **v9;
  BOOL v10;
  unsigned int *v11;
  unsigned int v12;
  uint64_t v13;
  _QWORD *v14[2];
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  p_property = &self->_property;
  if (p_property->_type == 3)
  {
    v15 = 0u;
    v16 = 0u;
    sub_2263DC6FC((uint64_t)p_property, (uint64_t)&v15);
    v13 = 0;
    v14[0] = 0;
    v14[1] = 0;
    pxrInternal__aapl__pxrReserved__::UsdObject::GetAllAuthoredMetadata((pxrInternal__aapl__pxrReserved__::UsdObject *)&v15);
    v3 = 0;
    if (v14)
    {
      v4 = (unint64_t *)MEMORY[0x24BEE7E98];
      do
      {
        v17 = 0;
        v18[0] = 0;
        v18[1] = 0;
        sub_2263DA68C(&v17, v3 + 4);
        v5 = atomic_load(v4);
        if (!v5)
          v5 = sub_2263DA79C(v4);
        if ((v17 & 0xFFFFFFFFFFFFFFF8) != (*(_QWORD *)(v5 + 448) & 0xFFFFFFFFFFFFFFF8))
          pxrInternal__aapl__pxrReserved__::UsdObject::ClearMetadata((pxrInternal__aapl__pxrReserved__::UsdObject *)&v15, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v17);
        sub_2263AD568((uint64_t)v18);
        if ((v17 & 7) != 0)
        {
          v6 = (unsigned int *)(v17 & 0xFFFFFFFFFFFFFFF8);
          do
            v7 = __ldxr(v6);
          while (__stlxr(v7 - 2, v6));
        }
        v8 = (_QWORD *)v3[1];
        if (v8)
        {
          do
          {
            v9 = (_QWORD **)v8;
            v8 = (_QWORD *)*v8;
          }
          while (v8);
        }
        else
        {
          do
          {
            v9 = (_QWORD **)v3[2];
            v10 = *v9 == v3;
            v3 = v9;
          }
          while (!v10);
        }
        v3 = v9;
      }
      while (v9 != v14);
    }
    sub_2263DB100((uint64_t)&v13, v14[0]);
    if ((BYTE8(v16) & 7) != 0)
    {
      v11 = (unsigned int *)(*((_QWORD *)&v16 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v12 = __ldxr(v11);
      while (__stlxr(v12 - 2, v11));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v16);
    if (*((_QWORD *)&v15 + 1))
      sub_2263DA640(*((uint64_t *)&v15 + 1));
  }
}

- (void)clearValue
{
  UsdProperty *p_property;
  unsigned int *v3;
  unsigned int v4;
  unsigned int *v5;
  unsigned int v6;
  __int128 v7;
  __int128 v8;

  p_property = &self->_property;
  if (p_property->_type == 4)
  {
    v7 = 0u;
    v8 = 0u;
    sub_2263E9114((uint64_t)p_property, (uint64_t)&v7);
    pxrInternal__aapl__pxrReserved__::UsdRelationship::ClearTargets((pxrInternal__aapl__pxrReserved__::UsdRelationship *)&v7);
    if ((BYTE8(v8) & 7) != 0)
    {
      v5 = (unsigned int *)(*((_QWORD *)&v8 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v6 = __ldxr(v5);
      while (__stlxr(v6 - 2, v5));
    }
  }
  else
  {
    if (p_property->_type != 3)
      return;
    v7 = 0u;
    v8 = 0u;
    sub_2263DC6FC((uint64_t)p_property, (uint64_t)&v7);
    pxrInternal__aapl__pxrReserved__::UsdAttribute::Clear((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v7);
    if ((BYTE8(v8) & 7) != 0)
    {
      v3 = (unsigned int *)(*((_QWORD *)&v8 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v4 = __ldxr(v3);
      while (__stlxr(v4 - 2, v3));
    }
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v8);
  if (*((_QWORD *)&v7 + 1))
    sub_2263DA640(*((uint64_t *)&v7 + 1));
}

- (id)data
{
  UsdProperty *p_property;
  pxrInternal__aapl__pxrReserved__::SdfSchemaBase *Instance;
  const pxrInternal__aapl__pxrReserved__::TfType *Type;
  unsigned int *v6;
  unsigned int v7;
  USKData *v8;
  const char *v9;
  unsigned int *v10;
  unsigned int v11;
  void *v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int v16;
  USKData *v17;
  const char *v18;
  unsigned int *v19;
  unsigned int v20;
  unsigned int *v22;
  unsigned int v23;
  unsigned int *v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t TypeName;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  unint64_t v33;
  uint64_t v34[2];
  _DWORD *v35;
  _DWORD *v36;
  uint64_t v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x24BDAC8D0];
  p_property = &self->_property;
  if (p_property->_type == 4)
  {
    v31 = 0u;
    v32 = 0u;
    sub_2263E9114((uint64_t)p_property, (uint64_t)&v31);
    v35 = 0;
    v36 = 0;
    v37 = 0;
    pxrInternal__aapl__pxrReserved__::UsdRelationship::GetTargets();
    if (v36 == v35)
    {
      v12 = 0;
    }
    else
    {
      v17 = [USKData alloc];
      v34[1] = (uint64_t)&off_24EDD8950;
      sub_2263F4170(v34, &v35);
      MEMORY[0x2276976D8](&v26, "rel");
      v12 = (void *)objc_msgSend_initWithVtValue_typeName_withPropertyOwner_(v17, v18, (uint64_t)v34, (uint64_t)&v26, self);
      if ((v26 & 7) != 0)
      {
        v19 = (unsigned int *)(v26 & 0xFFFFFFFFFFFFFFF8);
        do
          v20 = __ldxr(v19);
        while (__stlxr(v20 - 2, v19));
      }
      sub_2263AD568((uint64_t)v34);
    }
    v33 = (unint64_t)&v35;
    sub_2263BE380((void ***)&v33);
    if ((BYTE8(v32) & 7) != 0)
    {
      v24 = (unsigned int *)(*((_QWORD *)&v32 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v25 = __ldxr(v24);
      while (__stlxr(v25 - 2, v24));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  }
  else
  {
    if (p_property->_type != 3)
      return 0;
    v31 = 0u;
    v32 = 0u;
    sub_2263DC6FC((uint64_t)p_property, (uint64_t)&v31);
    if ((pxrInternal__aapl__pxrReserved__::UsdAttribute::HasValue((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v31) & 1) != 0)
    {
      v35 = 0;
      v36 = 0;
      pxrInternal__aapl__pxrReserved__::UsdAttribute::Get();
      v33 = 0;
      Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_24EDD5B58);
      if (!Instance)
        Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
      TypeName = pxrInternal__aapl__pxrReserved__::UsdAttribute::GetTypeName((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v31);
      Type = (const pxrInternal__aapl__pxrReserved__::TfType *)pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetType((pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&TypeName);
      v28 = 0;
      v30 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(Instance, Type, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v28);
      pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken((pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v30);
      if ((v28 & 7) != 0)
      {
        v6 = (unsigned int *)(v28 & 0xFFFFFFFFFFFFFFF8);
        do
          v7 = __ldxr(v6);
        while (__stlxr(v7 - 2, v6));
      }
      v8 = [USKData alloc];
      sub_2263B0700(v38, &v35);
      v27 = v33;
      if ((v33 & 7) != 0)
      {
        v10 = (unsigned int *)(v33 & 0xFFFFFFFFFFFFFFF8);
        do
          v11 = __ldxr(v10);
        while (__stxr(v11 + 2, v10));
        if ((v11 & 1) == 0)
          v27 = (unint64_t)v10;
      }
      v12 = (void *)objc_msgSend_initWithVtValue_typeName_withPropertyOwner_(v8, v9, (uint64_t)v38, (uint64_t)&v27, self);
      if ((v27 & 7) != 0)
      {
        v13 = (unsigned int *)(v27 & 0xFFFFFFFFFFFFFFF8);
        do
          v14 = __ldxr(v13);
        while (__stlxr(v14 - 2, v13));
      }
      sub_2263AD568((uint64_t)v38);
      if ((v33 & 7) != 0)
      {
        v15 = (unsigned int *)(v33 & 0xFFFFFFFFFFFFFFF8);
        do
          v16 = __ldxr(v15);
        while (__stlxr(v16 - 2, v15));
      }
      sub_2263AD568((uint64_t)&v35);
    }
    else
    {
      v12 = 0;
    }
    if ((BYTE8(v32) & 7) != 0)
    {
      v22 = (unsigned int *)(*((_QWORD *)&v32 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v23 = __ldxr(v22);
      while (__stlxr(v23 - 2, v22));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  }
  sub_2263BDE64((uint64_t)&v32);
  if (*((_QWORD *)&v31 + 1))
    sub_2263DA640(*((uint64_t *)&v31 + 1));
  return v12;
}

- (id)dataAtTime:(double)a3
{
  UsdProperty *p_property;
  pxrInternal__aapl__pxrReserved__::SdfSchemaBase *Instance;
  const pxrInternal__aapl__pxrReserved__::TfType *Type;
  unsigned int *v7;
  unsigned int v8;
  USKData *v9;
  const char *v10;
  unsigned int *v11;
  unsigned int v12;
  void *v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int *v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int *v23;
  uint64_t v24;
  uint64_t TypeName;
  uint64_t v26;
  unsigned int *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v30 = 0u;
  v31 = 0u;
  p_property = &self->_property;
  sub_2263DC6FC((uint64_t)&self->_property, (uint64_t)&v30);
  if (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v30)
    && pxrInternal__aapl__pxrReserved__::UsdAttribute::HasValue((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v30))
  {
    v28 = 0u;
    v29 = 0u;
    sub_2263DC6FC((uint64_t)p_property, (uint64_t)&v28);
    v33[0] = 0;
    v33[1] = 0;
    pxrInternal__aapl__pxrReserved__::UsdAttribute::Get();
    v27 = 0;
    Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_24EDD5B58);
    if (!Instance)
      Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
    TypeName = pxrInternal__aapl__pxrReserved__::UsdAttribute::GetTypeName((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v28);
    Type = (const pxrInternal__aapl__pxrReserved__::TfType *)pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetType((pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&TypeName);
    v24 = 0;
    v26 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(Instance, Type, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v24);
    pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken((pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v26);
    if ((v24 & 7) != 0)
    {
      v7 = (unsigned int *)(v24 & 0xFFFFFFFFFFFFFFF8);
      do
        v8 = __ldxr(v7);
      while (__stlxr(v8 - 2, v7));
    }
    v9 = [USKData alloc];
    sub_2263B0700(v32, v33);
    v23 = v27;
    if ((v27 & 7) != 0)
    {
      v11 = (unsigned int *)((unint64_t)v27 & 0xFFFFFFFFFFFFFFF8);
      do
        v12 = __ldxr(v11);
      while (__stxr(v12 + 2, v11));
      if ((v12 & 1) == 0)
        v23 = v11;
    }
    v13 = (void *)objc_msgSend_initWithVtValue_typeName_withPropertyOwner_(v9, v10, (uint64_t)v32, (uint64_t)&v23, self);
    if ((v23 & 7) != 0)
    {
      v14 = (unsigned int *)((unint64_t)v23 & 0xFFFFFFFFFFFFFFF8);
      do
        v15 = __ldxr(v14);
      while (__stlxr(v15 - 2, v14));
    }
    sub_2263AD568((uint64_t)v32);
    if ((v27 & 7) != 0)
    {
      v16 = (unsigned int *)((unint64_t)v27 & 0xFFFFFFFFFFFFFFF8);
      do
        v17 = __ldxr(v16);
      while (__stlxr(v17 - 2, v16));
    }
    sub_2263AD568((uint64_t)v33);
    if ((BYTE8(v29) & 7) != 0)
    {
      v18 = (unsigned int *)(*((_QWORD *)&v29 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v19 = __ldxr(v18);
      while (__stlxr(v19 - 2, v18));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v29);
    if (*((_QWORD *)&v28 + 1))
      sub_2263DA640(*((uint64_t *)&v28 + 1));
  }
  else
  {
    v13 = 0;
  }
  if ((BYTE8(v31) & 7) != 0)
  {
    v20 = (unsigned int *)(*((_QWORD *)&v31 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v21 = __ldxr(v20);
    while (__stlxr(v21 - 2, v20));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v31);
  if (*((_QWORD *)&v30 + 1))
    sub_2263DA640(*((uint64_t *)&v30 + 1));
  return v13;
}

- (BOOL)isAnimated
{
  UsdProperty *p_property;
  char v3;
  unsigned int *v4;
  unsigned int v5;
  __int128 v7;
  __int128 v8;

  p_property = &self->_property;
  if (p_property->_type == 4)
    return 0;
  v7 = 0u;
  v8 = 0u;
  sub_2263DC6FC((uint64_t)p_property, (uint64_t)&v7);
  if (pxrInternal__aapl__pxrReserved__::UsdAttribute::GetVariability((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v7) == 1)
    v3 = 0;
  else
    v3 = pxrInternal__aapl__pxrReserved__::UsdAttribute::ValueMightBeTimeVarying((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v7);
  if ((BYTE8(v8) & 7) != 0)
  {
    v4 = (unsigned int *)(*((_QWORD *)&v8 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v5 = __ldxr(v4);
    while (__stlxr(v5 - 2, v4));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v8);
  if (*((_QWORD *)&v7 + 1))
    sub_2263DA640(*((uint64_t *)&v7 + 1));
  return v3;
}

- (id)timeSamples
{
  UsdProperty *p_property;
  unsigned int *v4;
  unsigned int v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  p_property = &self->_property;
  if (p_property->_type == 4)
    return 0;
  v6 = 0u;
  v7 = 0u;
  sub_2263DC6FC((uint64_t)p_property, (uint64_t)&v6);
  if (pxrInternal__aapl__pxrReserved__::UsdAttribute::GetVariability((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v6) != 1)
    pxrInternal__aapl__pxrReserved__::UsdAttribute::GetTimeSamples();
  if ((BYTE8(v7) & 7) != 0)
  {
    v4 = (unsigned int *)(*((_QWORD *)&v7 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v5 = __ldxr(v4);
    while (__stlxr(v5 - 2, v4));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v7);
  if (*((_QWORD *)&v6 + 1))
    sub_2263DA640(*((uint64_t *)&v6 + 1));
  return 0;
}

- (id)stringValue
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  double *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  double *i;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  size_t v27;
  _QWORD *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v39;
  _OWORD v40[2];
  double *v41;
  __int128 v42;
  _OWORD v43[4];
  void *__p[2];
  __int128 v45;
  __int128 v46;
  _OWORD v47[9];
  uint64_t v48;
  void *v49[2];
  char v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_timeSamples(self, a2, v2, v3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v48 = 0;
    v46 = 0u;
    memset(v47, 0, sizeof(v47));
    *(_OWORD *)__p = 0u;
    v45 = 0u;
    memset(v43, 0, sizeof(v43));
    v42 = 0u;
    sub_2263B38C0((uint64_t)&v42);
    sub_2263B0814(v43, (uint64_t)"[", 1);
    v41 = 0;
    memset(v40, 0, sizeof(v40));
    objc_msgSend_value(v39, v8, v9, v10);
    sub_2263EA034((uint64_t *)v49, (uint64_t)v40);
    sub_2263AD568((uint64_t)v49);
    sub_2263CB26C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v40);
    v11 = v41;
    sub_2263CB26C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v40);
    for (i = &v41[*(_QWORD *)&v40[0]]; v11 != i; ++v11)
    {
      objc_msgSend_dataAtTime_(self, v12, v13, v14, *v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (_QWORD *)std::ostream::operator<<();
      v18 = sub_2263B0814(v17, (uint64_t)": ", 2);
      objc_msgSend_stringValue(v16, v19, v20, v21);
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v26 = (const char *)objc_msgSend_UTF8String(v22, v23, v24, v25);
      v27 = strlen(v26);
      v28 = sub_2263B0814(v18, (uint64_t)v26, v27);
      sub_2263B0814(v28, (uint64_t)", ", 2);

    }
    sub_2263B0814(v43, (uint64_t)"]", 1);
    v29 = (void *)MEMORY[0x24BDD17C8];
    std::stringbuf::str();
    if (v50 >= 0)
      objc_msgSend_stringWithUTF8String_(v29, v30, (uint64_t)v49, v31);
    else
      objc_msgSend_stringWithUTF8String_(v29, v30, (uint64_t)v49[0], v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50 < 0)
      operator delete(v49[0]);
    sub_2263AC71C((uint64_t)v40);
    *(_QWORD *)&v42 = *MEMORY[0x24BEDB7F0];
    v33 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
    *(_QWORD *)((char *)&v43[-1] + *(_QWORD *)(v42 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
    *(_QWORD *)&v43[0] = v33;
    *((_QWORD *)&v43[0] + 1) = MEMORY[0x24BEDB848] + 16;
    if (SHIBYTE(v45) < 0)
      operator delete(__p[1]);
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x2276980B0](v47);
  }
  else
  {
    objc_msgSend_data(self, v5, v6, v7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringValue(v34, v35, v36, v37);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v32;
}

- (id)tokenValue
{
  USKToken *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  unsigned int *v7;
  unsigned int v8;
  unint64_t v10;

  v3 = [USKToken alloc];
  sub_2263EA15C(&self->_property._type, (unsigned int **)&v10);
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

- (id)urlValue
{
  const char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  unsigned int *v10;
  unsigned int v11;
  void *v13[2];
  void *__p[2];
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v16 = 0u;
  v17 = 0u;
  sub_2263DC6FC((uint64_t)&self->_property, (uint64_t)&v16);
  if (!sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v16))
    goto LABEL_12;
  v13[0] = (void *)pxrInternal__aapl__pxrReserved__::UsdAttribute::GetTypeName((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v16);
  if (!atomic_load(MEMORY[0x24BEE82A0]))
    sub_2263B1434(MEMORY[0x24BEE82A0]);
  if (pxrInternal__aapl__pxrReserved__::SdfValueTypeName::operator==())
  {
    *(_OWORD *)__p = 0u;
    v15 = 0u;
    *(_OWORD *)v13 = 0u;
    pxrInternal__aapl__pxrReserved__::SdfAssetPath::SdfAssetPath((pxrInternal__aapl__pxrReserved__::SdfAssetPath *)v13);
    pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::SdfAssetPath>();
    v5 = (void *)MEMORY[0x24BDBCF48];
    if (v15 >= 0)
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v3, (uint64_t)&__p[1], v4);
    else
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v3, (uint64_t)__p[1], v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURLWithPath_(v5, v7, (uint64_t)v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (SHIBYTE(v15) < 0)
      operator delete(__p[1]);
    if (SHIBYTE(__p[0]) < 0)
      operator delete(v13[0]);
  }
  else
  {
LABEL_12:
    v9 = 0;
  }
  if ((BYTE8(v17) & 7) != 0)
  {
    v10 = (unsigned int *)(*((_QWORD *)&v17 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v11 = __ldxr(v10);
    while (__stlxr(v11 - 2, v10));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v17);
  if (*((_QWORD *)&v16 + 1))
    sub_2263DA640(*((uint64_t *)&v16 + 1));
  return v9;
}

- (id)resourcePath
{
  const char *v3;
  uint64_t v4;
  USKResourcePath *v5;
  void *v6;
  unsigned int *v7;
  unsigned int v8;
  void *v10[2];
  void *v11;
  __int128 __p;
  void *v13;
  void *v14[2];
  void *v15[4];
  __int128 v16;
  __int128 v17;

  v16 = 0u;
  v17 = 0u;
  sub_2263DC6FC((uint64_t)&self->_property, (uint64_t)&v16);
  if (!sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v16))
    goto LABEL_7;
  v14[0] = (void *)pxrInternal__aapl__pxrReserved__::UsdAttribute::GetTypeName((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v16);
  if (!atomic_load(MEMORY[0x24BEE82A0]))
    sub_2263B1434(MEMORY[0x24BEE82A0]);
  if (pxrInternal__aapl__pxrReserved__::SdfValueTypeName::operator==())
  {
    memset(v15, 0, sizeof(v15));
    *(_OWORD *)v14 = 0u;
    pxrInternal__aapl__pxrReserved__::SdfAssetPath::SdfAssetPath((pxrInternal__aapl__pxrReserved__::SdfAssetPath *)v14);
    pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::SdfAssetPath>();
    v5 = [USKResourcePath alloc];
    if (SHIBYTE(v15[0]) < 0)
    {
      sub_2263AE36C(v10, v14[0], (unint64_t)v14[1]);
    }
    else
    {
      *(_OWORD *)v10 = *(_OWORD *)v14;
      v11 = v15[0];
    }
    if (SHIBYTE(v15[3]) < 0)
    {
      sub_2263AE36C(&__p, v15[1], (unint64_t)v15[2]);
    }
    else
    {
      __p = *(_OWORD *)&v15[1];
      v13 = v15[3];
    }
    v6 = (void *)objc_msgSend_initWithSdfAssetPath_(v5, v3, (uint64_t)v10, v4);
    if (SHIBYTE(v13) < 0)
      operator delete((void *)__p);
    if (SHIBYTE(v11) < 0)
      operator delete(v10[0]);
    if (SHIBYTE(v15[3]) < 0)
      operator delete(v15[1]);
    if (SHIBYTE(v15[0]) < 0)
      operator delete(v14[0]);
  }
  else
  {
LABEL_7:
    v6 = 0;
  }
  if ((BYTE8(v17) & 7) != 0)
  {
    v7 = (unsigned int *)(*((_QWORD *)&v17 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v8 = __ldxr(v7);
    while (__stlxr(v8 - 2, v7));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v17);
  if (*((_QWORD *)&v16 + 1))
    sub_2263DA640(*((uint64_t *)&v16 + 1));
  return v6;
}

- (id)resourcePathArray
{
  id v3;
  unsigned int *v5;
  unsigned int v6;
  _OWORD v8[2];
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = 0u;
  v11 = 0u;
  sub_2263DC6FC((uint64_t)&self->_property, (uint64_t)&v10);
  if (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v10))
  {
    *(_QWORD *)&v8[0] = pxrInternal__aapl__pxrReserved__::UsdAttribute::GetTypeName((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v10);
    if (!atomic_load(MEMORY[0x24BEE82A0]))
      sub_2263B1434(MEMORY[0x24BEE82A0]);
    if (pxrInternal__aapl__pxrReserved__::SdfValueTypeName::operator==())
    {
      v9 = 0;
      memset(v8, 0, sizeof(v8));
      pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::VtArray<pxrInternal__aapl__pxrReserved__::SdfAssetPath>>();
      sub_2263C97A0(v8);
    }
  }
  if ((BYTE8(v11) & 7) != 0)
  {
    v5 = (unsigned int *)(*((_QWORD *)&v11 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v6 = __ldxr(v5);
    while (__stlxr(v6 - 2, v5));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v11);
  if (*((_QWORD *)&v10 + 1))
    sub_2263DA640(*((uint64_t *)&v10 + 1));
  return v3;
}

- (id)timeCodeValue
{
  USKTimeCode *v3;
  double v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = [USKTimeCode alloc];
  v4 = sub_2263EAA28(&self->_property._type, NAN);
  return (id)objc_msgSend_initWithSdfTimeCode_(v3, v5, v6, v7, v4);
}

- (BOOL)BOOLValue
{
  return sub_2263EAC44(&self->_property._type);
}

- (int)intValue
{
  return sub_2263EAE70(&self->_property._type);
}

- (unsigned)uintValue
{
  return sub_2263EB094(&self->_property._type);
}

- (unsigned)uintValueAtTime:(double)a3
{
  return sub_2263EB094(&self->_property._type);
}

- (double)doubleValue
{
  return sub_2263EB2C8(&self->_property._type, NAN);
}

- (double)doubleValueAtTime:(double)a3
{
  return sub_2263EB2C8(&self->_property._type, a3);
}

- (double)double2Value
{
  return sub_2263EB508((_DWORD *)(a1 + 24));
}

- (double)double2ValueAtTime:(uint64_t)a1
{
  return sub_2263EB508((_DWORD *)(a1 + 24));
}

- (__n128)double3Value
{
  unint64_t v3;
  __n128 result;
  __int128 v5;

  result.n128_f64[0] = sub_2263EB774((_DWORD *)(a1 + 24));
  result.n128_u64[1] = v3;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

- (__n128)double3ValueAtTime:(uint64_t)a1@<X0>
{
  unint64_t v3;
  __n128 result;
  __int128 v5;

  result.n128_f64[0] = sub_2263EB774((_DWORD *)(a1 + 24));
  result.n128_u64[1] = v3;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

- (__n128)double4Value
{
  unint64_t v3;
  __n128 result;
  uint64_t v5;
  __int128 v6;

  result.n128_f64[0] = sub_2263EBA0C((_DWORD *)(a1 + 24));
  result.n128_u64[1] = v3;
  *((_QWORD *)&v6 + 1) = v5;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v6;
  return result;
}

- (__n128)double4ValueAtTime:(uint64_t)a1@<X0>
{
  unint64_t v3;
  __n128 result;
  uint64_t v5;
  __int128 v6;

  result.n128_f64[0] = sub_2263EBA0C((_DWORD *)(a1 + 24));
  result.n128_u64[1] = v3;
  *((_QWORD *)&v6 + 1) = v5;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v6;
  return result;
}

- (__n128)double4x4Value
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  _OWORD v8[6];
  __n128 v9;
  __int128 v10;

  sub_2263EBD04((_DWORD *)(a1 + 24), v8);
  v3 = v8[1];
  *a2 = v8[0];
  a2[1] = v3;
  v4 = v8[3];
  a2[2] = v8[2];
  a2[3] = v4;
  v5 = v8[5];
  a2[4] = v8[4];
  a2[5] = v5;
  result = v9;
  v7 = v10;
  a2[6] = v9;
  a2[7] = v7;
  return result;
}

- (__n128)double4x4ValueAtTime:(uint64_t)a1@<X0>
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  _OWORD v8[6];
  __n128 v9;
  __int128 v10;

  sub_2263EBD04((_DWORD *)(a1 + 24), v8);
  v3 = v8[1];
  *a2 = v8[0];
  a2[1] = v3;
  v4 = v8[3];
  a2[2] = v8[2];
  a2[3] = v4;
  v5 = v8[5];
  a2[4] = v8[4];
  a2[5] = v5;
  result = v9;
  v7 = v10;
  a2[6] = v9;
  a2[7] = v7;
  return result;
}

- (float)floatValue
{
  return sub_2263EBFFC(&self->_property._type, 0.0);
}

- (float)floatValueAtTime:(double)a3
{
  return sub_2263EBFFC(&self->_property._type, *(float *)&a3);
}

- (__n64)float2Value
{
  unsigned __int32 v1;
  __n64 result;

  result.n64_f32[0] = sub_2263EC23C((_DWORD *)(a1 + 24));
  result.n64_u32[1] = v1;
  return result;
}

- (__n64)float2ValueAtTime:(uint64_t)a1
{
  unsigned __int32 v1;
  __n64 result;

  result.n64_f32[0] = sub_2263EC23C((_DWORD *)(a1 + 24));
  result.n64_u32[1] = v1;
  return result;
}

- (__n64)float3Value
{
  unsigned __int32 v1;
  __n64 result;

  result.n64_f32[0] = sub_2263EC49C((_DWORD *)(a1 + 24));
  result.n64_u32[1] = v1;
  return result;
}

- (__n64)float3ValueAtTime:(uint64_t)a1
{
  unsigned __int32 v1;
  __n64 result;

  result.n64_f32[0] = sub_2263EC49C((_DWORD *)(a1 + 24));
  result.n64_u32[1] = v1;
  return result;
}

- (__n64)float4Value
{
  unsigned __int32 v1;
  __n64 result;

  result.n64_f32[0] = sub_2263EC71C((_DWORD *)(a1 + 24));
  result.n64_u32[1] = v1;
  return result;
}

- (__n64)float4ValueAtTime:(uint64_t)a1
{
  unsigned __int32 v1;
  __n64 result;

  result.n64_f32[0] = sub_2263EC71C((_DWORD *)(a1 + 24));
  result.n64_u32[1] = v1;
  return result;
}

- (__n64)quatfValue
{
  unsigned __int32 v1;
  __n64 result;

  result.n64_f32[0] = sub_2263EC9A8((_DWORD *)(a1 + 24));
  result.n64_u32[1] = v1;
  return result;
}

- (__n64)quatfValueAtTime:(uint64_t)a1
{
  unsigned __int32 v1;
  __n64 result;

  result.n64_f32[0] = sub_2263EC9A8((_DWORD *)(a1 + 24));
  result.n64_u32[1] = v1;
  return result;
}

- (unint64_t)intArray:(int *)a3 maxCount:(unint64_t)a4
{
  return sub_2263ECC0C(&self->_property._type, a3, a4);
}

- (unint64_t)intArray:(int *)a3 maxCount:(unint64_t)a4 atTime:(double)a5
{
  return sub_2263ECC0C(&self->_property._type, a3, a4);
}

- (unint64_t)uintArray:(unsigned int *)a3 maxCount:(unint64_t)a4
{
  return sub_2263ECD90(&self->_property._type, a3, a4);
}

- (unint64_t)uintArray:(unsigned int *)a3 maxCount:(unint64_t)a4 atTime:(double)a5
{
  return sub_2263ECD90(&self->_property._type, a3, a4);
}

- (unint64_t)quatfArray:(id *)a3 maxCount:(unint64_t)a4
{
  return sub_2263ECF14(&self->_property._type, a3, a4);
}

- (unint64_t)quatfArray:(id *)a3 maxCount:(unint64_t)a4 atTime:(double)a5
{
  return sub_2263ECF14(&self->_property._type, a3, a4);
}

- (id)stringArray
{
  pxrInternal__aapl__pxrReserved__::VtValue *Typeid;
  const std::type_info *v3;
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  pxrInternal__aapl__pxrReserved__::VtValue *v16;
  const std::type_info *v17;
  uint64_t *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  sub_2263E6BC8(&self->_property._type, v31);
  if (!v31[1])
    goto LABEL_19;
  Typeid = (pxrInternal__aapl__pxrReserved__::VtValue *)pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid((pxrInternal__aapl__pxrReserved__::VtValue *)v31);
  if (!pxrInternal__aapl__pxrReserved__::VtValue::_CanCast(Typeid, &stru_24EDD6F60, v3))
  {
    v16 = (pxrInternal__aapl__pxrReserved__::VtValue *)pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid((pxrInternal__aapl__pxrReserved__::VtValue *)v31);
    if (pxrInternal__aapl__pxrReserved__::VtValue::_CanCast(v16, &stru_24EDD6F78, v17))
    {
      v18 = (uint64_t *)sub_2263B63F0((pxrInternal__aapl__pxrReserved__::VtValue *)v31);
      v19 = *v18;
      objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], v20, *v18, v21);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!v19)
        goto LABEL_20;
      v24 = 0;
      while (1)
      {
        v25 = *(_QWORD *)(v18[4] + 8 * v24) & 0xFFFFFFFFFFFFFFF8;
        if (!v25)
          break;
        v26 = (uint64_t *)(v25 + 16);
        if ((*(char *)(v25 + 39) & 0x80000000) == 0)
          goto LABEL_16;
        objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v22, *v26, v23);
LABEL_17:
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v10, v28, (uint64_t)v27, v29);

        if (v19 == ++v24)
          goto LABEL_20;
      }
      v26 = (uint64_t *)"";
LABEL_16:
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v22, (uint64_t)v26, v23);
      goto LABEL_17;
    }
LABEL_19:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    goto LABEL_20;
  }
  v4 = (uint64_t *)sub_2263B6230((pxrInternal__aapl__pxrReserved__::VtValue *)v31);
  v5 = *v4;
  objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], v6, *v4, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11 = 0;
    do
    {
      v12 = v4[4] + v11;
      if (*(char *)(v12 + 23) < 0)
        v12 = *(_QWORD *)v12;
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v8, v12, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v10, v14, (uint64_t)v13, v15);

      v11 += 24;
      --v5;
    }
    while (v5);
  }
LABEL_20:
  sub_2263AD568((uint64_t)v31);
  return v10;
}

- (id)stringArrayAtTime:(double)a3
{
  uint64_t *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  pxrInternal__aapl__pxrReserved__::TfToken *v7;
  const char *v8;
  uint64_t v9;
  pxrInternal__aapl__pxrReserved__::TfToken *v10;
  uint64_t i;
  uint64_t v12;
  unsigned int *v13;
  unsigned int v14;
  void *v15;
  unsigned int *v16;
  uint64_t EmptyString;
  void *v18;
  const char *v19;
  uint64_t v20;
  unsigned int v21;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  sub_2263E6BC8(&self->_property._type, v23);
  v3 = (uint64_t *)sub_2263B63F0((pxrInternal__aapl__pxrReserved__::VtValue *)v23);
  v4 = *v3;
  objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], v5, *v3, v6);
  v7 = (pxrInternal__aapl__pxrReserved__::TfToken *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      v12 = *(_QWORD *)(v3[4] + 8 * i);
      if ((v12 & 7) != 0)
      {
        v13 = (unsigned int *)(v12 & 0xFFFFFFFFFFFFFFF8);
        do
          v14 = __ldxr(v13);
        while (__stxr(v14 + 2, v13));
        if ((v14 & 1) == 0)
          v12 &= 0xFFFFFFFFFFFFFFF8;
      }
      v15 = (void *)MEMORY[0x24BDD17C8];
      v16 = (unsigned int *)(v12 & 0xFFFFFFFFFFFFFFF8);
      if ((v12 & 0xFFFFFFFFFFFFFFF8) != 0)
        EmptyString = (uint64_t)(v16 + 4);
      else
        EmptyString = pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString(v7);
      if (*(char *)(EmptyString + 23) < 0)
        EmptyString = *(_QWORD *)EmptyString;
      objc_msgSend_stringWithUTF8String_(v15, v8, EmptyString, v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v10, v19, (uint64_t)v18, v20);

      if ((v12 & 7) != 0)
      {
        do
          v21 = __ldxr(v16);
        while (__stlxr(v21 - 2, v16));
      }
    }
  }
  sub_2263AD568((uint64_t)v23);
  return v10;
}

- (id)tokenArray
{
  uint64_t *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  uint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  USKToken *v11;
  const char *v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  unsigned int *v19;
  unsigned int v20;
  unsigned int *v21;
  unsigned int v22;
  uint64_t v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  sub_2263E6BC8(&self->_property._type, v25);
  v2 = (uint64_t *)sub_2263B63F0((pxrInternal__aapl__pxrReserved__::VtValue *)v25);
  v3 = *v2;
  objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], v4, *v2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      v8 = *(_QWORD *)(v2[4] + 8 * i);
      if ((v8 & 7) != 0)
      {
        v9 = (unsigned int *)(v8 & 0xFFFFFFFFFFFFFFF8);
        do
          v10 = __ldxr(v9);
        while (__stxr(v10 + 2, v9));
        if ((v10 & 1) == 0)
          v8 &= 0xFFFFFFFFFFFFFFF8;
      }
      v11 = [USKToken alloc];
      v24 = v8;
      if ((v8 & 7) != 0)
      {
        v14 = (unsigned int *)(v8 & 0xFFFFFFFFFFFFFFF8);
        do
          v15 = __ldxr(v14);
        while (__stxr(v15 + 2, v14));
        if ((v15 & 1) == 0)
          v24 &= 0xFFFFFFFFFFFFFFF8;
      }
      v16 = (void *)objc_msgSend_initWithTfToken_(v11, v12, (uint64_t)&v24, v13);
      objc_msgSend_addObject_(v6, v17, (uint64_t)v16, v18);

      if ((v24 & 7) != 0)
      {
        v19 = (unsigned int *)(v24 & 0xFFFFFFFFFFFFFFF8);
        do
          v20 = __ldxr(v19);
        while (__stlxr(v20 - 2, v19));
      }
      if ((v8 & 7) != 0)
      {
        v21 = (unsigned int *)(v8 & 0xFFFFFFFFFFFFFFF8);
        do
          v22 = __ldxr(v21);
        while (__stlxr(v22 - 2, v21));
      }
    }
  }
  sub_2263AD568((uint64_t)v25);
  return v6;
}

- (id)tokenArrayAtTime:(double)a3
{
  uint64_t *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  USKToken *v12;
  const char *v13;
  uint64_t v14;
  unsigned int *v15;
  unsigned int v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int *v22;
  unsigned int v23;
  uint64_t v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  sub_2263E6BC8(&self->_property._type, v26);
  v3 = (uint64_t *)sub_2263B63F0((pxrInternal__aapl__pxrReserved__::VtValue *)v26);
  v4 = *v3;
  objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], v5, *v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      v9 = *(_QWORD *)(v3[4] + 8 * i);
      if ((v9 & 7) != 0)
      {
        v10 = (unsigned int *)(v9 & 0xFFFFFFFFFFFFFFF8);
        do
          v11 = __ldxr(v10);
        while (__stxr(v11 + 2, v10));
        if ((v11 & 1) == 0)
          v9 &= 0xFFFFFFFFFFFFFFF8;
      }
      v12 = [USKToken alloc];
      v25 = v9;
      if ((v9 & 7) != 0)
      {
        v15 = (unsigned int *)(v9 & 0xFFFFFFFFFFFFFFF8);
        do
          v16 = __ldxr(v15);
        while (__stxr(v16 + 2, v15));
        if ((v16 & 1) == 0)
          v25 &= 0xFFFFFFFFFFFFFFF8;
      }
      v17 = (void *)objc_msgSend_initWithTfToken_(v12, v13, (uint64_t)&v25, v14);
      objc_msgSend_addObject_(v7, v18, (uint64_t)v17, v19);

      if ((v25 & 7) != 0)
      {
        v20 = (unsigned int *)(v25 & 0xFFFFFFFFFFFFFFF8);
        do
          v21 = __ldxr(v20);
        while (__stlxr(v21 - 2, v20));
      }
      if ((v9 & 7) != 0)
      {
        v22 = (unsigned int *)(v9 & 0xFFFFFFFFFFFFFFF8);
        do
          v23 = __ldxr(v22);
        while (__stlxr(v23 - 2, v22));
      }
    }
  }
  sub_2263AD568((uint64_t)v26);
  return v7;
}

- (id)objectPath
{
  unsigned int *v2;
  unsigned int v3;
  _QWORD v5[3];
  __int128 v6;
  __int128 v7;
  void **v8;

  v6 = 0u;
  v7 = 0u;
  sub_2263E9114((uint64_t)&self->_property, (uint64_t)&v6);
  if (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v6))
  {
    memset(v5, 0, sizeof(v5));
    pxrInternal__aapl__pxrReserved__::UsdRelationship::GetTargets();
    v8 = (void **)v5;
    sub_2263BE380(&v8);
  }
  if ((BYTE8(v7) & 7) != 0)
  {
    v2 = (unsigned int *)(*((_QWORD *)&v7 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v3 = __ldxr(v2);
    while (__stlxr(v3 - 2, v2));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v7);
  if (*((_QWORD *)&v6 + 1))
    sub_2263DA640(*((uint64_t *)&v6 + 1));
  return 0;
}

- (id)objectPathArray
{
  void *v2;
  UsdProperty *p_property;
  int v4;
  char v5;
  const char *v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  _OWORD v11[2];
  uint64_t v12;
  _QWORD v13[3];
  __int128 v14;
  __int128 v15;

  p_property = &self->_property;
  if (p_property->_type != 4)
    goto LABEL_10;
  v14 = 0u;
  v15 = 0u;
  sub_2263E9114((uint64_t)p_property, (uint64_t)&v14);
  v4 = sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v14);
  v5 = v4;
  if (v4)
  {
    memset(v13, 0, sizeof(v13));
    v12 = 0;
    memset(v11, 0, sizeof(v11));
    pxrInternal__aapl__pxrReserved__::UsdRelationship::GetTargets();
    objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], v6, 0, v7);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2263C8DF4(v11);
    *(_QWORD *)&v11[0] = v13;
    sub_2263BE380((void ***)v11);
  }
  if ((BYTE8(v15) & 7) != 0)
  {
    v8 = (unsigned int *)(*((_QWORD *)&v15 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v9 = __ldxr(v8);
    while (__stlxr(v9 - 2, v8));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v15);
  if (*((_QWORD *)&v14 + 1))
    sub_2263DA640(*((uint64_t *)&v14 + 1));
  if ((v5 & 1) == 0)
LABEL_10:
    v2 = (void *)objc_opt_new();
  return v2;
}

- (id)targetObject
{
  unsigned int *v2;
  unsigned int v3;
  __int128 v5;
  _QWORD v6[3];
  __int128 v7;
  __int128 v8;

  v7 = 0u;
  v8 = 0u;
  sub_2263E9114((uint64_t)&self->_property, (uint64_t)&v7);
  if (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v7))
  {
    memset(v6, 0, sizeof(v6));
    pxrInternal__aapl__pxrReserved__::UsdRelationship::GetTargets();
    *(_QWORD *)&v5 = v6;
    sub_2263BE380((void ***)&v5);
  }
  if ((BYTE8(v8) & 7) != 0)
  {
    v2 = (unsigned int *)(*((_QWORD *)&v8 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v3 = __ldxr(v2);
    while (__stlxr(v3 - 2, v2));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v8);
  if (*((_QWORD *)&v7 + 1))
    sub_2263DA640(*((uint64_t *)&v7 + 1));
  return 0;
}

- (unint64_t)floatArray:(float *)a3 maxCount:(unint64_t)a4
{
  return sub_2263EDF9C(&self->_property._type, a3, a4);
}

- (unint64_t)floatArray:(float *)a3 maxCount:(unint64_t)a4 atTime:(double)a5
{
  return sub_2263EDF9C(&self->_property._type, a3, a4);
}

- (unint64_t)float2Array:(USKProperty *)self maxCount:(SEL)a2
{
  void *v2;
  unint64_t v3;

  return sub_2263EE120(&self->_property._type, v2, v3);
}

- (unint64_t)float2Array:(USKProperty *)self maxCount:(SEL)a2 atTime:
{
  void *v2;
  unint64_t v3;

  return sub_2263EE120(&self->_property._type, v2, v3);
}

- (unint64_t)float3Array:(USKProperty *)self maxCount:(SEL)a2
{
  _OWORD *v2;
  unint64_t v3;

  return sub_2263EE2A4(&self->_property._type, v2, v3);
}

- (unint64_t)float3Array:(USKProperty *)self maxCount:(SEL)a2 atTime:
{
  _OWORD *v2;
  unint64_t v3;

  return sub_2263EE2A4(&self->_property._type, v2, v3);
}

- (unint64_t)float4Array:(USKProperty *)self maxCount:(SEL)a2
{
  void *v2;
  unint64_t v3;

  return sub_2263EE454(&self->_property._type, v2, v3);
}

- (unint64_t)float4Array:(USKProperty *)self maxCount:(SEL)a2 atTime:
{
  void *v2;
  unint64_t v3;

  return sub_2263EE454(&self->_property._type, v2, v3);
}

- (unint64_t)float4x4Array:(id *)a3 maxCount:(unint64_t)a4
{
  return sub_2263EE5D8(&self->_property._type, a3, a4);
}

- (unint64_t)float4x4Array:(id *)a3 maxCount:(unint64_t)a4 atTime:(double)a5
{
  return sub_2263EE5D8(&self->_property._type, a3, a4);
}

- (unint64_t)doubleArray:(double *)a3 maxCount:(unint64_t)a4
{
  return sub_2263EE75C(&self->_property._type, a3, a4);
}

- (unint64_t)doubleArray:(double *)a3 maxCount:(unint64_t)a4 atTime:(double)a5
{
  return sub_2263EE75C(&self->_property._type, a3, a4);
}

- (unint64_t)double2Array:(USKProperty *)self maxCount:(SEL)a2
{
  void *v2;
  unint64_t v3;

  return sub_2263EE8E0(&self->_property._type, v2, v3);
}

- (unint64_t)double2Array:(USKProperty *)self maxCount:(SEL)a2 atTime:
{
  void *v2;
  unint64_t v3;

  return sub_2263EE8E0(&self->_property._type, v2, v3);
}

- (unint64_t)double3Array:(USKProperty *)self maxCount:(SEL)a2
{
  _OWORD *v2;
  unint64_t v3;

  return sub_2263EEA64(&self->_property._type, v2, v3);
}

- (unint64_t)double3Array:(USKProperty *)self maxCount:(SEL)a2 atTime:
{
  _OWORD *v2;
  unint64_t v3;

  return sub_2263EEA64(&self->_property._type, v2, v3);
}

- (unint64_t)double4Array:(USKProperty *)self maxCount:(SEL)a2
{
  void *v2;
  unint64_t v3;

  return sub_2263EEC24(&self->_property._type, v2, v3);
}

- (unint64_t)double4Array:(USKProperty *)self maxCount:(SEL)a2 atTime:
{
  void *v2;
  unint64_t v3;

  return sub_2263EEC24(&self->_property._type, v2, v3);
}

- (unint64_t)double4x4Array:(id *)a3 maxCount:(unint64_t)a4
{
  return sub_2263EEDA8(&self->_property._type, a3, a4);
}

- (unint64_t)double4x4Array:(id *)a3 maxCount:(unint64_t)a4 atTime:(double)a5
{
  return sub_2263EEDA8(&self->_property._type, a3, a4);
}

- (void)setData:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v8 = v4;
  if (v4)
  {
    objc_msgSend_value(v4, v5, v6, v7);
  }
  else
  {
    v9[0] = 0;
    v9[1] = 0;
  }
  sub_2263EEF0C(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)v9);
  sub_2263AD568((uint64_t)v9);

}

- (void)setData:(id)a3 atTime:(double)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v9 = v5;
  if (v5)
  {
    objc_msgSend_value(v5, v6, v7, v8);
  }
  else
  {
    v10[0] = 0;
    v10[1] = 0;
  }
  sub_2263EEF0C(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)v10);
  sub_2263AD568((uint64_t)v10);

}

- (void)setTokenValue:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v8 = v4;
  if (v4)
  {
    objc_msgSend_token(v4, v5, v6, v7);
    v14 = v13;
    v15 = (char *)&off_24EDD7038 + 1;
    if ((v13 & 7) != 0)
    {
      v9 = (unsigned int *)(v13 & 0xFFFFFFFFFFFFFFF8);
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 2, v9));
      if ((v10 & 1) == 0)
        v14 = v13 & 0xFFFFFFFFFFFFFFF8;
    }
  }
  else
  {
    v13 = 0;
    v14 = 0;
    v15 = (char *)&off_24EDD7038 + 1;
  }
  sub_2263EEF0C(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)&v14);
  sub_2263AD568((uint64_t)&v14);
  if ((v13 & 7) != 0)
  {
    v11 = (unsigned int *)(v13 & 0xFFFFFFFFFFFFFFF8);
    do
      v12 = __ldxr(v11);
    while (__stlxr(v12 - 2, v11));
  }

}

- (void)setStringValue:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  UsdProperty *p_property;
  unint64_t *v11;
  uint64_t v13;
  uint64_t v14;
  unsigned int *v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  void *v20;
  unsigned int *v22;
  unsigned int v23;
  char *v24;
  void *v25[2];
  void *v26[2];
  char v27;
  __int128 v28;
  __int128 v29;
  void *__p[2];
  uint64_t v31;
  void **TypeName;
  uint64_t v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v4 = objc_retainAutorelease(a3);
  v24 = (char *)objc_msgSend_UTF8String(v4, v5, v6, v7);
  v33[1] = 0;
  sub_2263C2AC0(v33, &v24);
  __p[0] = 0;
  __p[1] = 0;
  v31 = 0;
  v8 = sub_2263E0950((pxrInternal__aapl__pxrReserved__::VtValue *)v33);
  if (*(char *)(v8 + 23) < 0)
  {
    sub_2263AE36C(__p, *(void **)v8, *(_QWORD *)(v8 + 8));
  }
  else
  {
    v9 = *(_OWORD *)v8;
    v31 = *(_QWORD *)(v8 + 16);
    *(_OWORD *)__p = v9;
  }
  p_property = &self->_property;
  if (self->_property._type == 3)
  {
    v28 = 0uLL;
    v29 = 0uLL;
    sub_2263DC6FC((uint64_t)p_property, (uint64_t)&v28);
    TypeName = 0;
    TypeName = (void **)pxrInternal__aapl__pxrReserved__::UsdAttribute::GetTypeName((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v28);
    v11 = (unint64_t *)MEMORY[0x24BEE82A0];
    if (!atomic_load(MEMORY[0x24BEE82A0]))
      sub_2263B1434(MEMORY[0x24BEE82A0]);
    if (pxrInternal__aapl__pxrReserved__::SdfValueTypeName::operator==())
    {
      pxrInternal__aapl__pxrReserved__::UsdAttribute::_Set<std::string>();
    }
    else
    {
      if (!atomic_load(v11))
        sub_2263B1434(MEMORY[0x24BEE82A0]);
      if (pxrInternal__aapl__pxrReserved__::SdfValueTypeName::operator==())
      {
        MEMORY[0x2276976E4](v25, __p);
        pxrInternal__aapl__pxrReserved__::UsdAttribute::_Set<pxrInternal__aapl__pxrReserved__::TfToken>();
        if (((uint64_t)v25[0] & 7) != 0)
        {
          v16 = (unsigned int *)((unint64_t)v25[0] & 0xFFFFFFFFFFFFFFF8);
          do
            v17 = __ldxr(v16);
          while (__stlxr(v17 - 2, v16));
        }
      }
      else
      {
        if (!atomic_load(v11))
          sub_2263B1434(MEMORY[0x24BEE82A0]);
        if (pxrInternal__aapl__pxrReserved__::SdfValueTypeName::operator==())
        {
          MEMORY[0x227697264](v25, __p);
          pxrInternal__aapl__pxrReserved__::UsdAttribute::_Set<pxrInternal__aapl__pxrReserved__::SdfAssetPath>();
          if (v27 < 0)
            operator delete(v26[1]);
          if (SHIBYTE(v26[0]) < 0)
            operator delete(v25[0]);
        }
      }
    }
    if ((BYTE8(v29) & 7) != 0)
    {
      v22 = (unsigned int *)(*((_QWORD *)&v29 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v23 = __ldxr(v22);
      while (__stlxr(v23 - 2, v22));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v29);
    v20 = (void *)*((_QWORD *)&v28 + 1);
    if (!*((_QWORD *)&v28 + 1))
      goto LABEL_26;
LABEL_25:
    sub_2263DA640((uint64_t)v20);
    goto LABEL_26;
  }
  *(_OWORD *)v25 = 0uLL;
  *(_OWORD *)v26 = 0uLL;
  sub_2263E9114((uint64_t)p_property, (uint64_t)v25);
  if (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)v25))
  {
    v28 = 0uLL;
    *(_QWORD *)&v29 = 0;
    MEMORY[0x2276976B4](&TypeName, __p);
    v13 = *((_QWORD *)&v28 + 1);
    if (*((_QWORD *)&v28 + 1) >= (unint64_t)v29)
    {
      v14 = sub_2263F39C8((uint64_t *)&v28, &TypeName);
    }
    else
    {
      sub_2263BE108(*((_DWORD **)&v28 + 1), &TypeName);
      sub_2263BE140((_DWORD *)(v13 + 4), (_DWORD *)&TypeName + 1);
      v14 = v13 + 8;
    }
    *((_QWORD *)&v28 + 1) = v14;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&TypeName);
    pxrInternal__aapl__pxrReserved__::UsdRelationship::SetTargets();
    TypeName = (void **)&v28;
    sub_2263BE380(&TypeName);
  }
  if (((uint64_t)v26[1] & 7) != 0)
  {
    v18 = (unsigned int *)((unint64_t)v26[1] & 0xFFFFFFFFFFFFFFF8);
    do
      v19 = __ldxr(v18);
    while (__stlxr(v19 - 2, v18));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)v26);
  v20 = v25[1];
  if (v25[1])
    goto LABEL_25;
LABEL_26:
  if (SHIBYTE(v31) < 0)
    operator delete(__p[0]);
  sub_2263AD568((uint64_t)v33);

}

- (void)setTimeCodeValue:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sdfTimeCode(a3, a2, (uint64_t)a3, v3);
  v6[1] = (char *)&off_24EDD7328 + 1;
  v6[0] = v5;
  sub_2263EEF0C(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)v6);
  sub_2263AD568((uint64_t)v6);
}

- (void)setBoolValue:(BOOL)a3
{
  BOOL v3[8];
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v4 = &unk_24EDD73E3;
  v3[0] = a3;
  sub_2263EEF0C(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)v3);
  sub_2263AD568((uint64_t)v3);
}

- (void)setIntValue:(int)a3
{
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v4 = &unk_24EDD749B;
  v3 = a3;
  sub_2263EEF0C(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)&v3);
  sub_2263AD568((uint64_t)&v3);
}

- (void)setUIntValue:(unsigned int)a3
{
  unsigned int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v4 = &unk_24EDD7553;
  v3 = a3;
  sub_2263EEF0C(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)&v3);
  sub_2263AD568((uint64_t)&v3);
}

- (void)setUIntValue:(unsigned int)a3 atTime:(double)a4
{
  unsigned int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5 = &unk_24EDD7553;
  v4 = a3;
  sub_2263EEF0C(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)&v4);
  sub_2263AD568((uint64_t)&v4);
}

- (void)setDoubleValue:(double)a3
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[1] = &unk_24EDD78EB;
  *(double *)v3 = a3;
  sub_2263EEF0C(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)v3);
  sub_2263AD568((uint64_t)v3);
}

- (void)setDoubleValue:(double)a3 atTime:(double)a4
{
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v4[1] = &unk_24EDD78EB;
  *(double *)v4 = a3;
  sub_2263EEF0C(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)v4);
  sub_2263AD568((uint64_t)v4);
}

- (void)setDouble2Value:(USKProperty *)self
{
  __int128 v2;
  UsdProperty *p_property;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  __int128 v7;
  _QWORD v8[3];

  v7 = v2;
  v8[2] = *MEMORY[0x24BDAC8D0];
  p_property = &self->_property;
  v8[1] = (char *)&off_24EDD79A0 + 2;
  v4 = operator new();
  *(_OWORD *)v4 = v7;
  v5 = (unsigned int *)(v4 + 16);
  atomic_store(0, (unsigned int *)(v4 + 16));
  v8[0] = v4;
  do
    v6 = __ldxr(v5);
  while (__stxr(v6 + 1, v5));
  sub_2263EEF0C(p_property, (pxrInternal__aapl__pxrReserved__::VtValue *)v8);
  sub_2263AD568((uint64_t)v8);
}

- (void)setDouble2Value:(double)a3 atTime:
{
  UsdProperty *p_property;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  __int128 v7;
  _QWORD v8[3];

  v7 = *(_OWORD *)&a3;
  v8[2] = *MEMORY[0x24BDAC8D0];
  p_property = &self->_property;
  v8[1] = (char *)&off_24EDD79A0 + 2;
  v4 = operator new();
  *(_OWORD *)v4 = v7;
  v5 = (unsigned int *)(v4 + 16);
  atomic_store(0, (unsigned int *)(v4 + 16));
  v8[0] = v4;
  do
    v6 = __ldxr(v5);
  while (__stxr(v6 + 1, v5));
  sub_2263EEF0C(p_property, (pxrInternal__aapl__pxrReserved__::VtValue *)v8);
  sub_2263AD568((uint64_t)v8);
}

- (void)setDouble3Value:(USKProperty *)self
{
  __int128 *v2;
  UsdProperty *p_property;
  uint64_t v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  __int128 v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8 = *v2;
  p_property = &self->_property;
  v4 = *((_QWORD *)v2 + 2);
  v9[1] = (char *)&off_24EDD7A58 + 2;
  v5 = operator new();
  *(_OWORD *)v5 = v8;
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (unsigned int *)(v5 + 24);
  atomic_store(0, (unsigned int *)(v5 + 24));
  v9[0] = v5;
  do
    v7 = __ldxr(v6);
  while (__stxr(v7 + 1, v6));
  sub_2263EEF0C(p_property, (pxrInternal__aapl__pxrReserved__::VtValue *)v9);
  sub_2263AD568((uint64_t)v9);
}

- (void)setDouble3Value:(double)a3 atTime:
{
  __int128 *v3;
  UsdProperty *p_property;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  __int128 v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9 = *v3;
  p_property = &self->_property;
  v5 = *((_QWORD *)v3 + 2);
  v10[1] = (char *)&off_24EDD7A58 + 2;
  v6 = operator new();
  *(_OWORD *)v6 = v9;
  *(_QWORD *)(v6 + 16) = v5;
  v7 = (unsigned int *)(v6 + 24);
  atomic_store(0, (unsigned int *)(v6 + 24));
  v10[0] = v6;
  do
    v8 = __ldxr(v7);
  while (__stxr(v8 + 1, v7));
  sub_2263EEF0C(p_property, (pxrInternal__aapl__pxrReserved__::VtValue *)v10);
  sub_2263AD568((uint64_t)v10);
}

- (void)setDouble4Value:(USKProperty *)self
{
  __int128 *v2;
  UsdProperty *p_property;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  __int128 v7;
  __int128 v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v7 = *v2;
  v8 = v2[1];
  p_property = &self->_property;
  v9[1] = (char *)&off_24EDD7B10 + 2;
  v4 = operator new();
  *(_OWORD *)v4 = v7;
  *(_OWORD *)(v4 + 16) = v8;
  v5 = (unsigned int *)(v4 + 32);
  atomic_store(0, (unsigned int *)(v4 + 32));
  v9[0] = v4;
  do
    v6 = __ldxr(v5);
  while (__stxr(v6 + 1, v5));
  sub_2263EEF0C(p_property, (pxrInternal__aapl__pxrReserved__::VtValue *)v9);
  sub_2263AD568((uint64_t)v9);
}

- (void)setDouble4Value:(double)a3 atTime:
{
  __int128 *v3;
  UsdProperty *p_property;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  __int128 v8;
  __int128 v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v8 = *v3;
  v9 = v3[1];
  p_property = &self->_property;
  v10[1] = (char *)&off_24EDD7B10 + 2;
  v5 = operator new();
  *(_OWORD *)v5 = v8;
  *(_OWORD *)(v5 + 16) = v9;
  v6 = (unsigned int *)(v5 + 32);
  atomic_store(0, (unsigned int *)(v5 + 32));
  v10[0] = v5;
  do
    v7 = __ldxr(v6);
  while (__stxr(v7 + 1, v6));
  sub_2263EEF0C(p_property, (pxrInternal__aapl__pxrReserved__::VtValue *)v10);
  sub_2263AD568((uint64_t)v10);
}

- (uint64_t)setDouble4x4Value:(__int128 *)a3
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v3 = (_DWORD *)(a1 + 24);
  v15 = a3[1];
  v11 = *a3;
  v14 = a3[3];
  v9 = a3[4];
  v10 = a3[2];
  v12 = a3[7];
  v13 = a3[5];
  v8 = a3[6];
  v16[1] = (char *)&off_24EDD7BC8 + 2;
  v4 = operator new();
  *(_OWORD *)v4 = v11;
  *(_OWORD *)(v4 + 16) = v15;
  *(_OWORD *)(v4 + 32) = v10;
  *(_OWORD *)(v4 + 48) = v14;
  *(_OWORD *)(v4 + 64) = v9;
  *(_OWORD *)(v4 + 80) = v13;
  *(_OWORD *)(v4 + 96) = v8;
  *(_OWORD *)(v4 + 112) = v12;
  v5 = (unsigned int *)(v4 + 128);
  atomic_store(0, (unsigned int *)(v4 + 128));
  v16[0] = v4;
  do
    v6 = __ldxr(v5);
  while (__stxr(v6 + 1, v5));
  sub_2263EEF0C(v3, (pxrInternal__aapl__pxrReserved__::VtValue *)v16);
  return sub_2263AD568((uint64_t)v16);
}

- (uint64_t)setDouble4x4Value:(__int128 *)a3 atTime:
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v3 = (_DWORD *)(a1 + 24);
  v15 = a3[1];
  v10 = a3[2];
  v11 = *a3;
  v13 = a3[5];
  v14 = a3[3];
  v12 = a3[7];
  v8 = a3[6];
  v9 = a3[4];
  v16[1] = (char *)&off_24EDD7BC8 + 2;
  v4 = operator new();
  *(_OWORD *)v4 = v11;
  *(_OWORD *)(v4 + 16) = v15;
  *(_OWORD *)(v4 + 32) = v10;
  *(_OWORD *)(v4 + 48) = v14;
  *(_OWORD *)(v4 + 64) = v9;
  *(_OWORD *)(v4 + 80) = v13;
  *(_OWORD *)(v4 + 96) = v8;
  *(_OWORD *)(v4 + 112) = v12;
  v5 = (unsigned int *)(v4 + 128);
  atomic_store(0, (unsigned int *)(v4 + 128));
  v16[0] = v4;
  do
    v6 = __ldxr(v5);
  while (__stxr(v6 + 1, v5));
  sub_2263EEF0C(v3, (pxrInternal__aapl__pxrReserved__::VtValue *)v16);
  return sub_2263AD568((uint64_t)v16);
}

- (void)setFloatValue:(float)a3
{
  float v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v4 = &unk_24EDD760B;
  v3 = a3;
  sub_2263EEF0C(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)&v3);
  sub_2263AD568((uint64_t)&v3);
}

- (void)setFloatValue:(float)a3 atTime:(double)a4
{
  float v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5 = &unk_24EDD760B;
  v4 = a3;
  sub_2263EEF0C(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)&v4);
  sub_2263AD568((uint64_t)&v4);
}

- (void)setFloat2Value:(USKProperty *)self
{
  uint64_t v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[1] = (char *)&off_24EDD76C0 + 3;
  v3[0] = v2;
  sub_2263EEF0C(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)v3);
  sub_2263AD568((uint64_t)v3);
}

- (void)setFloat2Value:(double)a3 atTime:
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[1] = (char *)&off_24EDD76C0 + 3;
  *(double *)v3 = a3;
  sub_2263EEF0C(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)v3);
  sub_2263AD568((uint64_t)v3);
}

- (void)setFloat3Value:(USKProperty *)self
{
  __int128 v2;
  UsdProperty *p_property;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  __int128 v7;
  _QWORD v8[3];

  v7 = v2;
  v8[2] = *MEMORY[0x24BDAC8D0];
  p_property = &self->_property;
  v8[1] = (char *)&off_24EDD7778 + 2;
  v4 = operator new();
  *(_QWORD *)v4 = v7;
  *(_DWORD *)(v4 + 8) = DWORD2(v7);
  v5 = (unsigned int *)(v4 + 12);
  atomic_store(0, (unsigned int *)(v4 + 12));
  v8[0] = v4;
  do
    v6 = __ldxr(v5);
  while (__stxr(v6 + 1, v5));
  sub_2263EEF0C(p_property, (pxrInternal__aapl__pxrReserved__::VtValue *)v8);
  sub_2263AD568((uint64_t)v8);
}

- (void)setFloat3Value:(double)a3 atTime:
{
  UsdProperty *p_property;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  __int128 v7;
  _QWORD v8[3];

  v7 = *(_OWORD *)&a3;
  v8[2] = *MEMORY[0x24BDAC8D0];
  p_property = &self->_property;
  v8[1] = (char *)&off_24EDD7778 + 2;
  v4 = operator new();
  *(_QWORD *)v4 = v7;
  *(_DWORD *)(v4 + 8) = DWORD2(v7);
  v5 = (unsigned int *)(v4 + 12);
  atomic_store(0, (unsigned int *)(v4 + 12));
  v8[0] = v4;
  do
    v6 = __ldxr(v5);
  while (__stxr(v6 + 1, v5));
  sub_2263EEF0C(p_property, (pxrInternal__aapl__pxrReserved__::VtValue *)v8);
  sub_2263AD568((uint64_t)v8);
}

- (void)setFloat4Value:(USKProperty *)self
{
  __int128 v2;
  UsdProperty *p_property;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  __int128 v7;
  _QWORD v8[3];

  v7 = v2;
  v8[2] = *MEMORY[0x24BDAC8D0];
  p_property = &self->_property;
  v8[1] = (char *)&off_24EDD7830 + 2;
  v4 = operator new();
  *(_OWORD *)v4 = v7;
  v5 = (unsigned int *)(v4 + 16);
  atomic_store(0, (unsigned int *)(v4 + 16));
  v8[0] = v4;
  do
    v6 = __ldxr(v5);
  while (__stxr(v6 + 1, v5));
  sub_2263EEF0C(p_property, (pxrInternal__aapl__pxrReserved__::VtValue *)v8);
  sub_2263AD568((uint64_t)v8);
}

- (void)setFloat4Value:(double)a3 atTime:
{
  UsdProperty *p_property;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  __int128 v7;
  _QWORD v8[3];

  v7 = *(_OWORD *)&a3;
  v8[2] = *MEMORY[0x24BDAC8D0];
  p_property = &self->_property;
  v8[1] = (char *)&off_24EDD7830 + 2;
  v4 = operator new();
  *(_OWORD *)v4 = v7;
  v5 = (unsigned int *)(v4 + 16);
  atomic_store(0, (unsigned int *)(v4 + 16));
  v8[0] = v4;
  do
    v6 = __ldxr(v5);
  while (__stxr(v6 + 1, v5));
  sub_2263EEF0C(p_property, (pxrInternal__aapl__pxrReserved__::VtValue *)v8);
  sub_2263AD568((uint64_t)v8);
}

- (uint64_t)setQuatfValue:(uint64_t)a1
{
  _DWORD *v2;
  __n128 *v3;
  unsigned int *v4;
  unsigned int v5;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = (_DWORD *)(a1 + 24);
  v8[1] = &off_24EDD7C80;
  v3 = (__n128 *)operator new();
  *v3 = a2;
  v4 = (unsigned int *)&v3[1];
  atomic_store(0, (unsigned int *)&v3[1]);
  v8[0] = v3;
  do
    v5 = __ldxr(v4);
  while (__stxr(v5 + 1, v4));
  sub_2263EEF0C(v2, (pxrInternal__aapl__pxrReserved__::VtValue *)v8);
  return sub_2263AD568((uint64_t)v8);
}

- (uint64_t)setQuatfValue:(uint64_t)a1 atTime:(__n128)a2
{
  _DWORD *v2;
  __n128 *v3;
  unsigned int *v4;
  unsigned int v5;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = (_DWORD *)(a1 + 24);
  v8[1] = &off_24EDD7C80;
  v3 = (__n128 *)operator new();
  *v3 = a2;
  v4 = (unsigned int *)&v3[1];
  atomic_store(0, (unsigned int *)&v3[1]);
  v8[0] = v3;
  do
    v5 = __ldxr(v4);
  while (__stxr(v5 + 1, v4));
  sub_2263EEF0C(v2, (pxrInternal__aapl__pxrReserved__::VtValue *)v8);
  return sub_2263AD568((uint64_t)v8);
}

- (void)setIntArray:(int *)a3 count:(unint64_t)a4
{
  sub_2263F0D6C(&self->_property._type, a3, a4);
}

- (void)setIntArray:(int *)a3 count:(unint64_t)a4 atTime:(double)a5
{
  sub_2263F0D6C(&self->_property._type, a3, a4);
}

- (void)setUIntArray:(unsigned int *)a3 count:(unint64_t)a4
{
  sub_2263F0EBC(&self->_property._type, a3, a4);
}

- (void)setUIntArray:(unsigned int *)a3 count:(unint64_t)a4 atTime:(double)a5
{
  sub_2263F0EBC(&self->_property._type, a3, a4);
}

- (void)setQuatfArray:(id *)a3 count:(unint64_t)a4
{
  sub_2263F100C(&self->_property._type, a3, a4);
}

- (void)setQuatfArray:(id *)a3 count:(unint64_t)a4 atTime:(double)a5
{
  sub_2263F100C(&self->_property._type, a3, a4);
}

- (void)setStringArray:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t i;
  const char *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = 0;
  v8 = objc_msgSend_count(v4, v5, v6, v7, 0, 0, 0, 0);
  sub_2263B9998((uint64_t)&v21, v8);
  v12 = 0;
  for (i = 0; i < objc_msgSend_count(v4, v9, v10, v11); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(v4, v14, i, v15);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = objc_msgSend_UTF8String(v16, v17, v18, v19);
    sub_2263C7C48((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v21);
    MEMORY[0x227697FCC](v22 + v12, v20);

    v12 += 24;
  }
  v23[1] = (uint64_t)&off_24EDD7F60;
  sub_2263B131C(v23, (uint64_t)&v21);
  sub_2263F12C4((pxrInternal__aapl__pxrReserved__::VtValue *)v23, &self->_property._type);
  sub_2263AD568((uint64_t)v23);
  sub_2263C7974(&v21);

}

- (void)setStringArray:(id)a3 atTime:(double)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t i;
  const char *v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v23 = 0;
  v9 = objc_msgSend_count(v5, v6, v7, v8, 0, 0, 0, 0);
  sub_2263B9998((uint64_t)&v22, v9);
  v13 = 0;
  for (i = 0; i < objc_msgSend_count(v5, v10, v11, v12); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(v5, v15, i, v16);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = objc_msgSend_UTF8String(v17, v18, v19, v20);
    sub_2263C7C48((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v22);
    MEMORY[0x227697FCC](v23 + v13, v21);

    v13 += 24;
  }
  v24[1] = (uint64_t)&off_24EDD7F60;
  sub_2263B131C(v24, (uint64_t)&v22);
  sub_2263F12C4((pxrInternal__aapl__pxrReserved__::VtValue *)v24, &self->_property._type);
  sub_2263AD568((uint64_t)v24);
  sub_2263C7974(&v22);

}

- (void)setTokenArray:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t i;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t *v20;
  unsigned int *v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int *v24;
  unsigned int v25;
  uint64_t v26;
  _OWORD v27[2];
  uint64_t v28;
  uint64_t v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v28 = 0;
  memset(v27, 0, sizeof(v27));
  v8 = objc_msgSend_count(v4, v5, v6, v7);
  sub_2263B9A2C((uint64_t)v27, v8);
  for (i = 0; i < objc_msgSend_count(v4, v9, v10, v11); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(v4, v13, i, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v15;
    if (v15)
      objc_msgSend_token(v15, v16, v17, v18);
    else
      v26 = 0;
    sub_2263C8708((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v27);
    v20 = (uint64_t *)(v28 + 8 * i);
    if (&v26 == v20)
    {
      v23 = v26;
    }
    else
    {
      if ((*v20 & 7) != 0)
      {
        v21 = (unsigned int *)(*v20 & 0xFFFFFFFFFFFFFFF8);
        do
          v22 = __ldxr(v21);
        while (__stlxr(v22 - 2, v21));
      }
      v23 = 0;
      *v20 = v26;
      v26 = 0;
    }
    if ((v23 & 7) != 0)
    {
      v24 = (unsigned int *)(v23 & 0xFFFFFFFFFFFFFFF8);
      do
        v25 = __ldxr(v24);
      while (__stlxr(v25 - 2, v24));
    }

  }
  v29[1] = (uint64_t)off_24EDD8018;
  sub_2263B131C(v29, (uint64_t)v27);
  sub_2263EEF0C(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)v29);
  sub_2263AD568((uint64_t)v29);
  sub_2263C8530(v27);

}

- (void)setTokenArray:(id)a3 atTime:(double)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t i;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t *v21;
  unsigned int *v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int *v25;
  unsigned int v26;
  uint64_t v27;
  _OWORD v28[2];
  uint64_t v29;
  uint64_t v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v29 = 0;
  memset(v28, 0, sizeof(v28));
  v9 = objc_msgSend_count(v5, v6, v7, v8);
  sub_2263B9A2C((uint64_t)v28, v9);
  for (i = 0; i < objc_msgSend_count(v5, v10, v11, v12); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(v5, v14, i, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v16;
    if (v16)
      objc_msgSend_token(v16, v17, v18, v19);
    else
      v27 = 0;
    sub_2263C8708((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v28);
    v21 = (uint64_t *)(v29 + 8 * i);
    if (&v27 == v21)
    {
      v24 = v27;
    }
    else
    {
      if ((*v21 & 7) != 0)
      {
        v22 = (unsigned int *)(*v21 & 0xFFFFFFFFFFFFFFF8);
        do
          v23 = __ldxr(v22);
        while (__stlxr(v23 - 2, v22));
      }
      v24 = 0;
      *v21 = v27;
      v27 = 0;
    }
    if ((v24 & 7) != 0)
    {
      v25 = (unsigned int *)(v24 & 0xFFFFFFFFFFFFFFF8);
      do
        v26 = __ldxr(v25);
      while (__stlxr(v26 - 2, v25));
    }

  }
  v30[1] = (uint64_t)off_24EDD8018;
  sub_2263B131C(v30, (uint64_t)v28);
  sub_2263EEF0C(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)v30);
  sub_2263AD568((uint64_t)v30);
  sub_2263C8530(v28);

}

- (void)setFloatArray:(float *)a3 count:(unint64_t)a4
{
  sub_2263F1E60(&self->_property._type, a3, a4);
}

- (void)setFloatArray:(float *)a3 count:(unint64_t)a4 atTime:(double)a5
{
  sub_2263F1E60(&self->_property._type, a3, a4);
}

- (void)setFloat2Array:(USKProperty *)self count:(SEL)a2
{
  const void *v2;
  unint64_t v3;

  sub_2263F1FB0(&self->_property._type, v2, v3);
}

- (void)setFloat2Array:(USKProperty *)self count:(SEL)a2 atTime:
{
  const void *v2;
  unint64_t v3;

  sub_2263F1FB0(&self->_property._type, v2, v3);
}

- (void)setFloat3Array:(USKProperty *)self count:(SEL)a2
{
  uint64_t v2;
  unint64_t v3;

  sub_2263F2100(&self->_property._type, v2, v3);
}

- (void)setFloat3Array:(USKProperty *)self count:(SEL)a2 atTime:
{
  uint64_t v2;
  unint64_t v3;

  sub_2263F2100(&self->_property._type, v2, v3);
}

- (void)setFloat4Array:(USKProperty *)self count:(SEL)a2
{
  const void *v2;
  unint64_t v3;

  sub_2263F2280(&self->_property._type, v2, v3);
}

- (void)setFloat4Array:(USKProperty *)self count:(SEL)a2 atTime:
{
  const void *v2;
  unint64_t v3;

  sub_2263F2280(&self->_property._type, v2, v3);
}

- (void)setFloat4x4Array:(id *)a3 count:(unint64_t)a4
{
  sub_2263F23D0(&self->_property._type, a3, a4);
}

- (void)setFloat4x4Array:(id *)a3 count:(unint64_t)a4 atTime:(double)a5
{
  sub_2263F23D0(&self->_property._type, a3, a4);
}

- (void)setDoubleArray:(double *)a3 count:(unint64_t)a4
{
  sub_2263F2520(&self->_property._type, a3, a4);
}

- (void)setDoubleArray:(double *)a3 count:(unint64_t)a4 atTime:(double)a5
{
  sub_2263F2520(&self->_property._type, a3, a4);
}

- (void)setDouble2Array:(USKProperty *)self count:(SEL)a2
{
  const void *v2;
  unint64_t v3;

  sub_2263F2670(&self->_property._type, v2, v3);
}

- (void)setDouble2Array:(USKProperty *)self count:(SEL)a2 atTime:
{
  const void *v2;
  unint64_t v3;

  sub_2263F2670(&self->_property._type, v2, v3);
}

- (void)setDouble3Array:(USKProperty *)self count:(SEL)a2
{
  __int128 *v2;
  unint64_t v3;

  sub_2263F27C0(&self->_property._type, v2, v3);
}

- (void)setDouble3Array:(USKProperty *)self count:(SEL)a2 atTime:
{
  __int128 *v2;
  unint64_t v3;

  sub_2263F27C0(&self->_property._type, v2, v3);
}

- (void)setDouble4Array:(USKProperty *)self count:(SEL)a2
{
  const void *v2;
  unint64_t v3;

  sub_2263F2940(&self->_property._type, v2, v3);
}

- (void)setDouble4Array:(USKProperty *)self count:(SEL)a2 atTime:
{
  const void *v2;
  unint64_t v3;

  sub_2263F2940(&self->_property._type, v2, v3);
}

- (void)setDouble4x4Array:(id *)a3 count:(unint64_t)a4
{
  sub_2263F2A90(&self->_property._type, a3, a4);
}

- (void)setDouble4x4Array:(id *)a3 count:(unint64_t)a4 atTime:(double)a5
{
  sub_2263F2A90(&self->_property._type, a3, a4);
}

- (void)setObjectPathArray:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  _DWORD *v18;
  _DWORD *v19;
  unsigned int *v20;
  unsigned int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  _DWORD *v27;
  unint64_t v28;
  __int128 v29;
  __int128 v30;
  void **v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v29 = 0u;
  v30 = 0u;
  sub_2263E9114((uint64_t)&self->_property, (uint64_t)&v29);
  if (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v29))
  {
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v8 = objc_msgSend_count(v4, v5, v6, v7);
    sub_2263E8CAC(&v26, v8);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = v4;
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v22, (uint64_t)v32, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v9);
          v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (v17)
            objc_msgSend_path(v17, v11, v12, v13, (_QWORD)v22);
          else
            v31 = 0;
          v18 = v27;
          if ((unint64_t)v27 >= v28)
          {
            v19 = (_DWORD *)sub_2263F39C8(&v26, &v31);
          }
          else
          {
            sub_2263BE108(v27, &v31);
            sub_2263BE140(v18 + 1, (_DWORD *)&v31 + 1);
            v19 = v18 + 2;
          }
          v27 = v19;
          pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
          sub_2263BDE64((uint64_t)&v31);
        }
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v22, (uint64_t)v32, 16);
      }
      while (v14);
    }

    pxrInternal__aapl__pxrReserved__::UsdRelationship::SetTargets();
    v31 = (void **)&v26;
    sub_2263BE380(&v31);
  }
  if ((BYTE8(v30) & 7) != 0)
  {
    v20 = (unsigned int *)(*((_QWORD *)&v30 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v21 = __ldxr(v20);
    while (__stlxr(v21 - 2, v20));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v30);
  if (*((_QWORD *)&v29 + 1))
    sub_2263DA640(*((uint64_t *)&v29 + 1));

}

- (void)setObjectPath:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  void **v15;

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  sub_2263E9114((uint64_t)&self->_property, (uint64_t)&v13);
  if (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v13))
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    if (v4)
      objc_msgSend_path(v4, v5, v6, v7);
    else
      v15 = 0;
    v11 = sub_2263F39C8(&v10, &v15);
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v15);
    pxrInternal__aapl__pxrReserved__::UsdRelationship::SetTargets();
    v15 = (void **)&v10;
    sub_2263BE380(&v15);
  }
  if ((BYTE8(v14) & 7) != 0)
  {
    v8 = (unsigned int *)(*((_QWORD *)&v14 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v9 = __ldxr(v8);
    while (__stlxr(v9 - 2, v8));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v14);
  if (*((_QWORD *)&v13 + 1))
    sub_2263DA640(*((uint64_t *)&v13 + 1));

}

- (void)setURL:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unsigned int *v13;
  unsigned int v14;
  void *v15[2];
  void *__p[2];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char *v20[2];
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  sub_2263DC6FC((uint64_t)&self->_property, (uint64_t)&v18);
  if (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v18))
  {
    *(_OWORD *)__p = 0u;
    v17 = 0u;
    *(_OWORD *)v15 = 0u;
    objc_msgSend_relativeString(v4, v5, v6, v7);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (char *)objc_msgSend_UTF8String(v8, v9, v10, v11);
    sub_2263AE2A8(v20, v12);
    MEMORY[0x227697264](v15, v20);
    if (v21 < 0)
      operator delete(v20[0]);

    v20[1] = (char *)&off_24EDD7270;
    sub_2263C3860(v20, (__int128 *)v15);
    pxrInternal__aapl__pxrReserved__::UsdAttribute::Set();
    sub_2263AD568((uint64_t)v20);
    if (SHIBYTE(v17) < 0)
      operator delete(__p[1]);
    if (SHIBYTE(__p[0]) < 0)
      operator delete(v15[0]);
  }
  if ((BYTE8(v19) & 7) != 0)
  {
    v13 = (unsigned int *)(*((_QWORD *)&v19 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v14 = __ldxr(v13);
    while (__stlxr(v14 - 2, v13));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v19);
  if (*((_QWORD *)&v18 + 1))
    sub_2263DA640(*((uint64_t *)&v18 + 1));

}

- (void)setResourcePath:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unsigned int *v10;
  unsigned int v11;
  void *v12[2];
  void *__p[2];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char *v17[2];
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  sub_2263DC6FC((uint64_t)&self->_property, (uint64_t)&v15);
  if (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v15))
  {
    *(_OWORD *)__p = 0u;
    v14 = 0u;
    *(_OWORD *)v12 = 0u;
    v5 = objc_retainAutorelease(v4);
    v9 = (char *)objc_msgSend_UTF8String(v5, v6, v7, v8);
    sub_2263AE2A8(v17, v9);
    MEMORY[0x227697264](v12, v17);
    if (v18 < 0)
      operator delete(v17[0]);
    v17[1] = (char *)&off_24EDD7270;
    sub_2263C3860(v17, (__int128 *)v12);
    pxrInternal__aapl__pxrReserved__::UsdAttribute::Set();
    sub_2263AD568((uint64_t)v17);
    if (SHIBYTE(v14) < 0)
      operator delete(__p[1]);
    if (SHIBYTE(__p[0]) < 0)
      operator delete(v12[0]);
  }
  if ((BYTE8(v16) & 7) != 0)
  {
    v10 = (unsigned int *)(*((_QWORD *)&v16 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v11 = __ldxr(v10);
    while (__stlxr(v11 - 2, v10));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v16);
  if (*((_QWORD *)&v15 + 1))
    sub_2263DA640(*((uint64_t *)&v15 + 1));

}

- (void)setResourcePathArray:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t i;
  const char *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  __int128 v22;
  void **v23;
  __int128 v24;
  unsigned int *v25;
  unsigned int v26;
  void *v27[2];
  char v28;
  _OWORD v29[2];
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  void *__p[2];
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v31 = 0u;
  v32 = 0u;
  sub_2263DC6FC((uint64_t)&self->_property, (uint64_t)&v31);
  if (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v31))
  {
    v30 = 0;
    memset(v29, 0, sizeof(v29));
    v8 = objc_msgSend_count(v4, v5, v6, v7);
    sub_2263B9B90((uint64_t)v29, v8);
    v12 = 0;
    for (i = 0; i < objc_msgSend_count(v4, v9, v10, v11); ++i)
    {
      objc_msgSend_objectAtIndexedSubscript_(v4, v14, i, v15);
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v20 = (char *)objc_msgSend_UTF8String(v16, v17, v18, v19);
      sub_2263AE2A8(v27, v20);
      MEMORY[0x227697264](__p, v27);
      sub_2263C9B84((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v29);
      v21 = v30 + v12;
      if (*(char *)(v30 + v12 + 23) < 0)
        operator delete(*(void **)v21);
      v22 = *(_OWORD *)__p;
      *(_QWORD *)(v21 + 16) = v34;
      *(_OWORD *)v21 = v22;
      HIBYTE(v34) = 0;
      LOBYTE(__p[0]) = 0;
      v23 = (void **)(v21 + 24);
      if (*(char *)(v21 + 47) < 0)
        operator delete(*v23);
      v24 = v35;
      *(_QWORD *)(v21 + 40) = v36;
      *(_OWORD *)v23 = v24;
      HIBYTE(v36) = 0;
      LOBYTE(v35) = 0;
      if (SHIBYTE(v34) < 0)
        operator delete(__p[0]);
      if (v28 < 0)
        operator delete(v27[0]);

      v12 += 48;
    }
    __p[1] = off_24EDD81A0;
    sub_2263B131C((uint64_t *)__p, (uint64_t)v29);
    pxrInternal__aapl__pxrReserved__::UsdAttribute::Set();
    sub_2263AD568((uint64_t)__p);
    sub_2263C97A0(v29);
  }
  if ((BYTE8(v32) & 7) != 0)
  {
    v25 = (unsigned int *)(*((_QWORD *)&v32 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v26 = __ldxr(v25);
    while (__stlxr(v26 - 2, v25));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v32);
  if (*((_QWORD *)&v31 + 1))
    sub_2263DA640(*((uint64_t *)&v31 + 1));

}

- (BOOL)isEqual:(id)a3
{
  USKProperty *v4;
  USKProperty *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  unsigned int *v10;
  unsigned int v11;
  int v13;
  Usd_PrimData *v14;
  Ptr *v15;
  uint64_t v16;

  v4 = (USKProperty *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_usdProperty(v5, v6, v7, v8);
    v9 = self->_property._type == v13
      && self->_property._prim._p.px == v14
      && self->_property._proxyPrimPath._primPart._poolHandle == v15
      && ((unint64_t)self->_property._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8) == (v16 & 0xFFFFFFFFFFFFFFF8);
    if ((v16 & 7) != 0)
    {
      v10 = (unsigned int *)(v16 & 0xFFFFFFFFFFFFFFF8);
      do
        v11 = __ldxr(v10);
      while (__stlxr(v11 - 2, v10));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v15);
    if (v14)
      sub_2263DA640((uint64_t)v14);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  _QWORD v3[2];

  v3[0] = 0;
  v3[1] = 0;
  sub_2263F38AC((uint64_t)v3, (unsigned int *)&self->_property, &self->_property._prim._p.px, (unsigned int *)&self->_property._proxyPrimPath, &self->_property._proxyPrimPath._propPart._poolHandle);
  return bswap64(0x9E3779B97F4A7C55 * v3[0]);
}

- (void).cxx_destruct
{
  UsdProperty *p_property;
  Handle poolHandle;
  unsigned int *v5;
  unsigned int v6;
  uint64_t px;

  objc_storeStrong((id *)&self->_sceneOwner, 0);
  objc_storeStrong((id *)&self->_property._propName._rep._ptrAndBits, 0);
  p_property = &self->_property;
  poolHandle = p_property->_proxyPrimPath._propPart._poolHandle;
  if ((poolHandle & 7) != 0)
  {
    v5 = (unsigned int *)((unint64_t)poolHandle & 0xFFFFFFFFFFFFFFF8);
    do
      v6 = __ldxr(v5);
    while (__stlxr(v6 - 2, v5));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&p_property->_proxyPrimPath);
  px = (uint64_t)p_property->_prim._p.px;
  if (px)
    sub_2263DA640(px);
}

- (id).cxx_construct
{
  UsdProperty *p_property;

  p_property = &self->_property;
  self->_property._type = 2;
  self->_property._prim._p.px = 0;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
  p_property->_proxyPrimPath._propPart._poolHandle = 0;
  return self;
}

@end
