@implementation USKNode

- (USKNode)initWithUsdPrim:(UsdPrim *)a3
{
  USKNode *v4;
  Usd_PrimData *px;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  USKNode *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)USKNode;
  v4 = -[USKNode init](&v11, sel_init);
  if (v4 && (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)a3) & 1) != 0)
  {
    v4->_prim._type = a3->_type;
    px = a3->_prim._p.px;
    if (px)
    {
      v6 = (unint64_t *)((char *)px + 48);
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
    }
    v8 = (uint64_t)v4->_prim._prim._p.px;
    v4->_prim._prim._p.px = px;
    if (v8)
      sub_2263DA640(v8);
    sub_2263C0080((uint64_t)&v4->_prim._proxyPrimPath, &a3->_proxyPrimPath);
    sub_2263C00D4((uint64_t)&v4->_prim._proxyPrimPath._primPart._poolHandle + 4, (_DWORD *)&a3->_proxyPrimPath._primPart._poolHandle + 1);
    sub_2263BE4E4(&v4->_prim._proxyPrimPath._propPart._poolHandle, &a3->_proxyPrimPath._propPart._poolHandle);
    v9 = v4;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (USKNode)initWithUsdPrim:(UsdPrim *)a3 withSceneOwner:(id)a4
{
  id v7;
  USKNode *v8;
  Usd_PrimData *px;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  USKNode *v13;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)USKNode;
  v8 = -[USKNode init](&v15, sel_init);
  if (v8 && (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)a3) & 1) != 0)
  {
    v8->_prim._type = a3->_type;
    px = a3->_prim._p.px;
    if (px)
    {
      v10 = (unint64_t *)((char *)px + 48);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    v12 = (uint64_t)v8->_prim._prim._p.px;
    v8->_prim._prim._p.px = px;
    if (v12)
      sub_2263DA640(v12);
    sub_2263C0080((uint64_t)&v8->_prim._proxyPrimPath, &a3->_proxyPrimPath);
    sub_2263C00D4((uint64_t)&v8->_prim._proxyPrimPath._primPart._poolHandle + 4, (_DWORD *)&a3->_proxyPrimPath._primPart._poolHandle + 1);
    sub_2263BE4E4(&v8->_prim._proxyPrimPath._propPart._poolHandle, &a3->_proxyPrimPath._propPart._poolHandle);
    objc_storeStrong((id *)&v8->_prim._propName._rep._ptrAndBits, a4);
    v13 = v8;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (UsdPrim)usdPrim
{
  UsdPrim *p_prim;
  Usd_PrimData *px;
  unint64_t *v6;
  unint64_t v7;
  UsdPrim *result;
  Ptr *poolHandle;
  unsigned int *v10;
  unsigned int v11;

  p_prim = &self->_prim;
  retstr->_type = self->_prim._type;
  px = self->_prim._prim._p.px;
  retstr->_prim._p.px = px;
  if (px)
  {
    v6 = (unint64_t *)((char *)px + 48);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  sub_2263BDDD8(&retstr->_proxyPrimPath, &self->_prim._proxyPrimPath);
  result = (UsdPrim *)sub_2263BDE28((_DWORD *)&retstr->_proxyPrimPath._primPart._poolHandle + 1, (_DWORD *)&p_prim->_proxyPrimPath._primPart._poolHandle + 1);
  poolHandle = p_prim->_proxyPrimPath._propPart._poolHandle;
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

- (id)createUniqueGeomSubset:(id)a3 elementType:(id)a4 indices:(id)a5 familyName:(id)a6 familyType:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int *v45;
  unsigned int v46;
  unsigned int *v47;
  unsigned int v48;
  unsigned int *v49;
  unsigned int v50;
  unsigned int *v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[3];
  _OWORD v58[2];
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v19 = a7;
  if (v12)
  {
    objc_msgSend_token(v12, v16, v17, v18);
    v20 = *(_QWORD *)&v58[0];
  }
  else
  {
    v20 = 0;
    *(_QWORD *)&v58[0] = 0;
  }
  v21 = v20 & 0xFFFFFFFFFFFFFFF8;
  if ((v20 & 0xFFFFFFFFFFFFFFF8) != 0)
  {
    if (*(char *)(v21 + 39) < 0)
      v22 = *(_QWORD *)(v21 + 24);
    else
      v22 = *(unsigned __int8 *)(v21 + 39);
  }
  else
  {
    v22 = 0;
  }
  if ((v20 & 7) != 0)
  {
    do
      v23 = __ldxr((unsigned int *)v21);
    while (__stlxr(v23 - 2, (unsigned int *)v21));
  }
  if (v22)
  {
    if (v13)
    {
      objc_msgSend_token(v13, v16, v17, v18);
      v24 = *(_QWORD *)&v58[0];
    }
    else
    {
      v24 = 0;
      *(_QWORD *)&v58[0] = 0;
    }
    v25 = v24 & 0xFFFFFFFFFFFFFFF8;
    if ((v24 & 0xFFFFFFFFFFFFFFF8) != 0)
    {
      if (*(char *)(v25 + 39) < 0)
        v26 = *(_QWORD *)(v25 + 24);
      else
        v26 = *(unsigned __int8 *)(v25 + 39);
    }
    else
    {
      v26 = 0;
    }
    if ((v24 & 7) != 0)
    {
      do
        v27 = __ldxr((unsigned int *)v25);
      while (__stlxr(v27 - 2, (unsigned int *)v25));
    }
    if (v26)
    {
      v60 = 0;
      v61 = 0;
      v62 = 0;
      v28 = pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v60, &self->_prim);
      v60 = MEMORY[0x24BEE9D70] + 16;
      if (!v61
        || (*(_BYTE *)(v61 + 57) & 8) != 0
        || ((*(uint64_t (**)(uint64_t))(MEMORY[0x24BEE9D70] + 48))(v28) & 1) == 0)
      {
LABEL_36:
        MEMORY[0x227697414](&v60);
        goto LABEL_37;
      }
      v29 = objc_retainAutorelease(v14);
      v33 = objc_msgSend_bytes(v29, v30, v31, v32);
      v37 = objc_msgSend_length(v29, v34, v35, v36);
      v38 = v37 >> 3;
      v59 = 0;
      memset(v58, 0, sizeof(v58));
      sub_2263AA560((uint64_t)v58, v37 >> 3);
      if (v37 >= 8)
      {
        v42 = 0;
        if (v38 <= 1)
          v38 = 1;
        do
        {
          v43 = *(_QWORD *)(v33 + 8 * v42);
          sub_2263AC688((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v58);
          *(_DWORD *)(v59 + 4 * v42++) = v43;
        }
        while (v38 != v42);
      }
      memset(v57, 0, sizeof(v57));
      if (v12)
      {
        objc_msgSend_token(v12, v39, v40, v41);
        if (v13)
          goto LABEL_32;
      }
      else
      {
        v56 = 0;
        if (v13)
        {
LABEL_32:
          objc_msgSend_token(v13, v39, v40, v41);
          if (v15)
            goto LABEL_33;
          goto LABEL_40;
        }
      }
      v55 = 0;
      if (v15)
      {
LABEL_33:
        objc_msgSend_token(v15, v39, v40, v41);
        if (v19)
        {
LABEL_34:
          objc_msgSend_token(v19, v39, v40, v41);
LABEL_42:
          pxrInternal__aapl__pxrReserved__::UsdGeomSubset::CreateUniqueGeomSubset();
          if ((v53 & 7) != 0)
          {
            v45 = (unsigned int *)(v53 & 0xFFFFFFFFFFFFFFF8);
            do
              v46 = __ldxr(v45);
            while (__stlxr(v46 - 2, v45));
          }
          if ((v54 & 7) != 0)
          {
            v47 = (unsigned int *)(v54 & 0xFFFFFFFFFFFFFFF8);
            do
              v48 = __ldxr(v47);
            while (__stlxr(v48 - 2, v47));
          }
          if ((v55 & 7) != 0)
          {
            v49 = (unsigned int *)(v55 & 0xFFFFFFFFFFFFFFF8);
            do
              v50 = __ldxr(v49);
            while (__stlxr(v50 - 2, v49));
          }
          if ((v56 & 7) != 0)
          {
            v51 = (unsigned int *)(v56 & 0xFFFFFFFFFFFFFFF8);
            do
              v52 = __ldxr(v51);
            while (__stlxr(v52 - 2, v51));
          }
          MEMORY[0x2276972DC](v57);
          sub_2263AC71C((uint64_t)v58);
          goto LABEL_36;
        }
LABEL_41:
        v53 = 0;
        goto LABEL_42;
      }
LABEL_40:
      v54 = 0;
      if (v19)
        goto LABEL_34;
      goto LABEL_41;
    }
  }
LABEL_37:

  return 0;
}

- (id)getAllGeomSubsets
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void **v11;

  v8 = 0;
  v9 = 0;
  v10 = 0;
  pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v8, &self->_prim);
  v8 = MEMORY[0x24BEE9D70] + 16;
  if (v9
    && (*(_BYTE *)(v9 + 57) & 8) == 0
    && ((*(uint64_t (**)(uint64_t *))(MEMORY[0x24BEE9D70] + 48))(&v8) & 1) != 0)
  {
    memset(v7, 0, sizeof(v7));
    pxrInternal__aapl__pxrReserved__::UsdGeomSubset::GetAllGeomSubsets();
    v2 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v5 = (void *)objc_msgSend_initWithCapacity_(v2, v3, 0, v4);
    v11 = (void **)v7;
    sub_2263E4504(&v11);
  }
  else
  {
    v5 = 0;
  }
  MEMORY[0x227697414](&v8);
  return v5;
}

- (id)getGeomSubsets:(id)a3 familyName:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned int *v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;

  v6 = a3;
  v7 = a4;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v24, &self->_prim);
  v24 = MEMORY[0x24BEE9D70] + 16;
  if (!v25
    || (*(_BYTE *)(v25 + 57) & 8) != 0
    || ((*(uint64_t (**)(uint64_t *))(MEMORY[0x24BEE9D70] + 48))(&v24) & 1) == 0)
  {
    v11 = 0;
    goto LABEL_8;
  }
  v21 = 0;
  v22 = 0;
  v23 = 0;
  if (!v6)
  {
    v27 = 0;
    if (v7)
      goto LABEL_6;
LABEL_10:
    v20 = 0;
    goto LABEL_11;
  }
  objc_msgSend_token(v6, v8, v9, v10);
  if (!v7)
    goto LABEL_10;
LABEL_6:
  objc_msgSend_token(v7, v8, v9, v10);
LABEL_11:
  pxrInternal__aapl__pxrReserved__::UsdGeomSubset::GetGeomSubsets();
  if ((v20 & 7) != 0)
  {
    v13 = (unsigned int *)(v20 & 0xFFFFFFFFFFFFFFF8);
    do
      v14 = __ldxr(v13);
    while (__stlxr(v14 - 2, v13));
  }
  if ((v27 & 7) != 0)
  {
    v15 = (unsigned int *)(v27 & 0xFFFFFFFFFFFFFFF8);
    do
      v16 = __ldxr(v15);
    while (__stlxr(v16 - 2, v15));
  }
  v17 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v11 = (void *)objc_msgSend_initWithCapacity_(v17, v18, 0xAAAAAAAAAAAAAAABLL * ((v22 - v21) >> 3), v19);
  v27 = (unint64_t)&v21;
  sub_2263E4504((void ***)&v27);
LABEL_8:
  MEMORY[0x227697414](&v24);

  return v11;
}

- (id)getGeomSubsetIndicesAttr
{
  USKProperty *v2;
  const char *v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  void *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v20 = 0;
  v21 = 0;
  v22 = 0;
  pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v20, &self->_prim);
  v20 = MEMORY[0x24BEE9D28] + 16;
  if (v21
    && (*(_BYTE *)(v21 + 57) & 8) == 0
    && ((*(uint64_t (**)(uint64_t *))(MEMORY[0x24BEE9D28] + 48))(&v20) & 1) != 0)
  {
    v18 = 0u;
    v19 = 0u;
    pxrInternal__aapl__pxrReserved__::UsdGeomSubset::GetIndicesAttr((pxrInternal__aapl__pxrReserved__::UsdGeomSubset *)&v20);
    v2 = [USKProperty alloc];
    v13 = 0;
    v14 = 0;
    sub_2263BDDD8(&v15, &v19);
    sub_2263BDE28(&v16, (_DWORD *)&v19 + 1);
    v17 = *((_QWORD *)&v19 + 1);
    if ((BYTE8(v19) & 7) != 0)
    {
      v5 = (unsigned int *)(*((_QWORD *)&v19 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v6 = __ldxr(v5);
      while (__stxr(v6 + 2, v5));
      if ((v6 & 1) == 0)
        v17 &= 0xFFFFFFFFFFFFFFF8;
    }
    v7 = (void *)objc_msgSend_initWithUsdProperty_(v2, v3, (uint64_t)&v13, v4);
    if ((v17 & 7) != 0)
    {
      v8 = (unsigned int *)(v17 & 0xFFFFFFFFFFFFFFF8);
      do
        v9 = __ldxr(v8);
      while (__stlxr(v9 - 2, v8));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v15);
    if (v14)
      sub_2263DA640(v14);
    if ((BYTE8(v19) & 7) != 0)
    {
      v10 = (unsigned int *)(*((_QWORD *)&v19 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v11 = __ldxr(v10);
      while (__stlxr(v11 - 2, v10));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v19);
    if (*((_QWORD *)&v18 + 1))
      sub_2263DA640(*((uint64_t *)&v18 + 1));
  }
  else
  {
    v7 = 0;
  }
  MEMORY[0x2276972DC](&v20);
  return v7;
}

- (id)getGeomSubsetElementTypeAttr
{
  USKProperty *v2;
  const char *v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  void *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v20 = 0;
  v21 = 0;
  v22 = 0;
  pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v20, &self->_prim);
  v20 = MEMORY[0x24BEE9D28] + 16;
  if (v21
    && (*(_BYTE *)(v21 + 57) & 8) == 0
    && ((*(uint64_t (**)(uint64_t *))(MEMORY[0x24BEE9D28] + 48))(&v20) & 1) != 0)
  {
    v18 = 0u;
    v19 = 0u;
    pxrInternal__aapl__pxrReserved__::UsdGeomSubset::GetElementTypeAttr((pxrInternal__aapl__pxrReserved__::UsdGeomSubset *)&v20);
    v2 = [USKProperty alloc];
    v13 = 0;
    v14 = 0;
    sub_2263BDDD8(&v15, &v19);
    sub_2263BDE28(&v16, (_DWORD *)&v19 + 1);
    v17 = *((_QWORD *)&v19 + 1);
    if ((BYTE8(v19) & 7) != 0)
    {
      v5 = (unsigned int *)(*((_QWORD *)&v19 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v6 = __ldxr(v5);
      while (__stxr(v6 + 2, v5));
      if ((v6 & 1) == 0)
        v17 &= 0xFFFFFFFFFFFFFFF8;
    }
    v7 = (void *)objc_msgSend_initWithUsdProperty_(v2, v3, (uint64_t)&v13, v4);
    if ((v17 & 7) != 0)
    {
      v8 = (unsigned int *)(v17 & 0xFFFFFFFFFFFFFFF8);
      do
        v9 = __ldxr(v8);
      while (__stlxr(v9 - 2, v8));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v15);
    if (v14)
      sub_2263DA640(v14);
    if ((BYTE8(v19) & 7) != 0)
    {
      v10 = (unsigned int *)(*((_QWORD *)&v19 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v11 = __ldxr(v10);
      while (__stlxr(v11 - 2, v10));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v19);
    if (*((_QWORD *)&v18 + 1))
      sub_2263DA640(*((uint64_t *)&v18 + 1));
  }
  else
  {
    v7 = 0;
  }
  MEMORY[0x2276972DC](&v20);
  return v7;
}

- (id)getGeomSubsetFamilyName
{
  uint64_t v2;
  USKToken *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int *v10;
  unsigned int v11;
  unsigned int *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v18 = 0;
  v19 = 0;
  v20 = 0;
  v2 = pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v18, &self->_prim);
  v18 = MEMORY[0x24BEE9D28] + 16;
  if (v19
    && (*(_BYTE *)(v19 + 57) & 8) == 0
    && ((*(uint64_t (**)(uint64_t))(MEMORY[0x24BEE9D28] + 48))(v2) & 1) != 0)
  {
    v16 = 0u;
    v17 = 0u;
    pxrInternal__aapl__pxrReserved__::UsdGeomSubset::GetFamilyNameAttr((pxrInternal__aapl__pxrReserved__::UsdGeomSubset *)&v18);
    if ((sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v16) & 1) != 0)
    {
      v15 = 0;
      if ((pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::TfToken>() & 1) != 0)
      {
        v3 = [USKToken alloc];
        v14 = v15;
        v6 = (void *)objc_msgSend_initWithTfToken_(v3, v4, (uint64_t)&v14, v5);
        if ((v14 & 7) != 0)
        {
          v7 = (unsigned int *)(v14 & 0xFFFFFFFFFFFFFFF8);
          do
            v8 = __ldxr(v7);
          while (__stlxr(v8 - 2, v7));
        }
      }
      else
      {
        v6 = 0;
      }
      if ((v15 & 7) != 0)
      {
        v10 = (unsigned int *)(v15 & 0xFFFFFFFFFFFFFFF8);
        do
          v11 = __ldxr(v10);
        while (__stlxr(v11 - 2, v10));
      }
    }
    else
    {
      v6 = 0;
    }
    if ((BYTE8(v17) & 7) != 0)
    {
      v12 = (unsigned int *)(*((_QWORD *)&v17 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v13 = __ldxr(v12);
      while (__stlxr(v13 - 2, v12));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v17);
    if (*((_QWORD *)&v16 + 1))
      sub_2263DA640(*((uint64_t *)&v16 + 1));
  }
  else
  {
    v6 = 0;
  }
  MEMORY[0x2276972DC](&v18);
  return v6;
}

- (void)applyType:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const UsdPrim *v7;
  uint64_t v8;
  const UsdPrim *v9;
  uint64_t v10;
  const UsdPrim *v11;
  uint64_t v12;
  const UsdPrim *v13;
  uint64_t v14;
  const UsdPrim *v15;
  uint64_t v16;
  const UsdPrim *v17;
  UsdPrim *p_prim;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  unsigned int *v25;
  unsigned int v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t Text;
  unsigned int *v33;
  unsigned int v34;
  uint64_t v35;
  _BYTE v36[32];
  _BYTE v37[32];
  _BYTE v38[32];
  _BYTE v39[32];
  _BYTE v40[32];
  _BYTE v41[32];
  __int128 v42;
  uint64_t v43;
  uint64_t v44;

  v4 = a3;
  v42 = 0u;
  v43 = 0;
  LODWORD(v42) = 1;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
  v44 = 0;
  if (objc_msgSend_isEqualToString_(v4, v5, (uint64_t)CFSTR("SkelBindingAPI"), v6))
  {
    pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI::Apply((pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI *)&self->_prim, v7);
    MEMORY[0x22769748C](v41);
  }
  else if (objc_msgSend_isEqualToString_(v4, (const char *)v7, (uint64_t)CFSTR("Preliminary_AnchoringAPI"), v8))
  {
    pxrInternal__aapl__pxrReserved__::UsdInteractivePreliminary_AnchoringAPI::Apply((pxrInternal__aapl__pxrReserved__::UsdInteractivePreliminary_AnchoringAPI *)&self->_prim, v9);
    MEMORY[0x227697630](v40);
  }
  else if (objc_msgSend_isEqualToString_(v4, (const char *)v9, (uint64_t)CFSTR("MaterialBindingAPI"), v10))
  {
    pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI::Apply((pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI *)&self->_prim, v11);
    MEMORY[0x2276975A0](v39);
  }
  else if (objc_msgSend_isEqualToString_(v4, (const char *)v11, (uint64_t)CFSTR("Preliminary_PhysicsColliderAPI"), v12))
  {
    pxrInternal__aapl__pxrReserved__::UsdPhysicsPreliminary_PhysicsColliderAPI::Apply((pxrInternal__aapl__pxrReserved__::UsdPhysicsPreliminary_PhysicsColliderAPI *)&self->_prim, v13);
    MEMORY[0x227697654](v38);
  }
  else if (objc_msgSend_isEqualToString_(v4, (const char *)v13, (uint64_t)CFSTR("Preliminary_PhysicsMaterialAPI"), v14))
  {
    pxrInternal__aapl__pxrReserved__::UsdPhysicsPreliminary_PhysicsMaterialAPI::Apply((pxrInternal__aapl__pxrReserved__::UsdPhysicsPreliminary_PhysicsMaterialAPI *)&self->_prim, v15);
    MEMORY[0x22769766C](v37);
  }
  else
  {
    p_prim = &self->_prim;
    if (objc_msgSend_isEqualToString_(v4, (const char *)v15, (uint64_t)CFSTR("Preliminary_PhysicsRigidBodyAPI"), v16))
    {
      pxrInternal__aapl__pxrReserved__::UsdPhysicsPreliminary_PhysicsRigidBodyAPI::Apply((pxrInternal__aapl__pxrReserved__::UsdPhysicsPreliminary_PhysicsRigidBodyAPI *)p_prim, v17);
      MEMORY[0x227697684](v36);
    }
    else
    {
      v19 = objc_retainAutorelease(v4);
      v23 = objc_msgSend_UTF8String(v19, v20, v21, v22);
      MEMORY[0x2276976D8](&v35, v23);
      v24 = pxrInternal__aapl__pxrReserved__::UsdPrim::AddAppliedSchema((pxrInternal__aapl__pxrReserved__::UsdPrim *)p_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v35);
      if ((v35 & 7) != 0)
      {
        v25 = (unsigned int *)(v35 & 0xFFFFFFFFFFFFFFF8);
        do
          v26 = __ldxr(v25);
        while (__stlxr(v26 - 2, v25));
      }
      if ((v24 & 1) == 0)
      {
        v27 = objc_retainAutorelease(v19);
        v31 = objc_msgSend_UTF8String(v27, v28, v29, v30);
        sub_2263E6F40((uint64_t)p_prim, &v35);
        Text = pxrInternal__aapl__pxrReserved__::SdfPath::GetText((pxrInternal__aapl__pxrReserved__::SdfPath *)&v35);
        NSLog(CFSTR("Could not add applied schema %s to prim: %s"), v31, Text);
        sub_2263B5610((uint64_t)&v35);
      }
    }
  }
  if ((v44 & 7) != 0)
  {
    v33 = (unsigned int *)(v44 & 0xFFFFFFFFFFFFFFF8);
    do
      v34 = __ldxr(v33);
    while (__stlxr(v34 - 2, v33));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v43);
  if (*((_QWORD *)&v42 + 1))
    sub_2263DA640(*((uint64_t *)&v42 + 1));

}

- (BOOL)hasSchemaType:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char HasAPI;
  unsigned int *v13;
  unsigned int v14;
  uint64_t v16;
  uint64_t TypeFromName;

  v4 = a3;
  objc_msgSend_tokenWithSchemaType_(USKToken, v5, (uint64_t)v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  if (v7)
    objc_msgSend_token(v7, v8, v9, v10);
  else
    v16 = 0;
  TypeFromName = pxrInternal__aapl__pxrReserved__::UsdSchemaRegistry::GetTypeFromName((pxrInternal__aapl__pxrReserved__::UsdSchemaRegistry *)&v16, (const TfToken *)v8);
  HasAPI = pxrInternal__aapl__pxrReserved__::UsdPrim::HasAPI((pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfType *)&TypeFromName);
  if ((v16 & 7) != 0)
  {
    v13 = (unsigned int *)(v16 & 0xFFFFFFFFFFFFFFF8);
    do
      v14 = __ldxr(v13);
    while (__stlxr(v14 - 2, v13));
  }

  return HasAPI;
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
  pxrInternal__aapl__pxrReserved__::Sdf_ValueTypeNamesType *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  unsigned int *v36;
  unsigned int v37;
  unsigned int *v38;
  unsigned int v39;
  unsigned int *v40;
  unsigned int v41;
  unsigned int *v42;
  unsigned int v43;
  _QWORD *v44;
  _QWORD **v45;
  BOOL v46;
  void *v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *__p[2];
  char v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  void *v62[2];
  __int128 v63;
  __int128 v64;
  _OWORD v65[9];
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69[2];
  _QWORD v70[2];
  _QWORD v71[2];
  uint64_t v72;
  _QWORD v73[4];

  v73[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v68 = 0;
  v69[0] = 0;
  v69[1] = 0;
  pxrInternal__aapl__pxrReserved__::UsdObject::GetAllAuthoredMetadata((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_prim);
  v6 = 0;
  if (v69)
  {
    v7 = *MEMORY[0x24BEDB7F0];
    v50 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
    v51 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
    v49 = MEMORY[0x24BEDB848] + 16;
    do
    {
      v72 = 0;
      v73[0] = 0;
      v73[1] = 0;
      v8 = sub_2263DA68C(&v72, v6 + 4);
      v11 = (void *)MEMORY[0x24BDD17C8];
      if ((v72 & 0xFFFFFFFFFFFFFFF8) != 0)
        EmptyString = (v72 & 0xFFFFFFFFFFFFFFF8) + 16;
      else
        EmptyString = pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString((pxrInternal__aapl__pxrReserved__::TfToken *)v8);
      if (*(char *)(EmptyString + 23) < 0)
        EmptyString = *(_QWORD *)EmptyString;
      objc_msgSend_stringWithUTF8String_(v11, v9, EmptyString, v10, v49);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v3, v14, (uint64_t)v13, v15);

      v67 = 0;
      Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_24EDD5B58);
      if (!Instance)
        Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
      __p[0] = 0;
      *(_QWORD *)&v57 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(Instance, (const pxrInternal__aapl__pxrReserved__::VtValue *)v73, (const pxrInternal__aapl__pxrReserved__::TfToken *)__p);
      pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken((pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v57);
      if (((uint64_t)__p[0] & 7) != 0)
      {
        v17 = (unsigned int *)((unint64_t)__p[0] & 0xFFFFFFFFFFFFFFF8);
        do
          v18 = __ldxr(v17);
        while (__stlxr(v18 - 2, v17));
      }
      if (v67)
      {
        v19 = [USKData alloc];
        sub_2263B0700(v70, v73);
        v52 = v67;
        if ((v67 & 7) != 0)
        {
          v21 = (unsigned int *)(v67 & 0xFFFFFFFFFFFFFFF8);
          do
            v22 = __ldxr(v21);
          while (__stxr(v22 + 2, v21));
          if ((v22 & 1) == 0)
            v52 &= 0xFFFFFFFFFFFFFFF8;
        }
        v23 = (void *)objc_msgSend_initWithVtValue_typeName_withNodeOwner_(v19, v20, (uint64_t)v70, (uint64_t)&v52, self);
        objc_msgSend_addObject_(v4, v24, (uint64_t)v23, v25);

        if ((v52 & 7) != 0)
        {
          v26 = (unsigned int *)(v52 & 0xFFFFFFFFFFFFFFF8);
          do
            v27 = __ldxr(v26);
          while (__stlxr(v27 - 2, v26));
        }
        sub_2263AD568((uint64_t)v70);
      }
      else
      {
        v66 = 0;
        v64 = 0u;
        memset(v65, 0, sizeof(v65));
        *(_OWORD *)v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v57 = 0u;
        sub_2263B38C0((uint64_t)&v57);
        pxrInternal__aapl__pxrReserved__::operator<<();
        v28 = [USKData alloc];
        std::stringbuf::str();
        MEMORY[0x2276976E4](&v56, __p);
        v71[0] = v56;
        v71[1] = (char *)&off_24EDD7038 + 1;
        if ((v56 & 7) != 0)
        {
          v29 = (unsigned int *)(v56 & 0xFFFFFFFFFFFFFFF8);
          do
            v30 = __ldxr(v29);
          while (__stxr(v30 + 2, v29));
          if ((v30 & 1) == 0)
            v71[0] &= 0xFFFFFFFFFFFFFFF8;
        }
        v31 = (pxrInternal__aapl__pxrReserved__::Sdf_ValueTypeNamesType *)atomic_load(MEMORY[0x24BEE82A0]);
        if (!v31)
          v31 = sub_2263B1434(MEMORY[0x24BEE82A0]);
        pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken((pxrInternal__aapl__pxrReserved__::Sdf_ValueTypeNamesType *)((char *)v31 + 88));
        v33 = (void *)objc_msgSend_initWithVtValue_typeName_withNodeOwner_(v28, v32, (uint64_t)v71, (uint64_t)&v53, self);
        objc_msgSend_addObject_(v4, v34, (uint64_t)v33, v35);

        if ((v53 & 7) != 0)
        {
          v36 = (unsigned int *)(v53 & 0xFFFFFFFFFFFFFFF8);
          do
            v37 = __ldxr(v36);
          while (__stlxr(v37 - 2, v36));
        }
        sub_2263AD568((uint64_t)v71);
        if ((v56 & 7) != 0)
        {
          v38 = (unsigned int *)(v56 & 0xFFFFFFFFFFFFFFF8);
          do
            v39 = __ldxr(v38);
          while (__stlxr(v39 - 2, v38));
        }
        if (v55 < 0)
          operator delete(__p[0]);
        *(_QWORD *)&v57 = v7;
        *(_QWORD *)((char *)&v57 + *(_QWORD *)(v7 - 24)) = v51;
        *(_QWORD *)&v58 = v50;
        *((_QWORD *)&v58 + 1) = v49;
        if (SHIBYTE(v63) < 0)
          operator delete(v62[1]);
        std::streambuf::~streambuf();
        std::iostream::~basic_iostream();
        MEMORY[0x2276980B0](v65);
      }
      if ((v67 & 7) != 0)
      {
        v40 = (unsigned int *)(v67 & 0xFFFFFFFFFFFFFFF8);
        do
          v41 = __ldxr(v40);
        while (__stlxr(v41 - 2, v40));
      }
      sub_2263AD568((uint64_t)v73);
      if ((v72 & 7) != 0)
      {
        v42 = (unsigned int *)(v72 & 0xFFFFFFFFFFFFFFF8);
        do
          v43 = __ldxr(v42);
        while (__stlxr(v43 - 2, v42));
      }
      v44 = (_QWORD *)v6[1];
      if (v44)
      {
        do
        {
          v45 = (_QWORD **)v44;
          v44 = (_QWORD *)*v44;
        }
        while (v44);
      }
      else
      {
        do
        {
          v45 = (_QWORD **)v6[2];
          v46 = *v45 == v6;
          v6 = v45;
        }
        while (!v46);
      }
      v6 = v45;
    }
    while (v45 != v69);
  }
  objc_msgSend_dictionaryWithObjects_forKeys_(MEMORY[0x24BDBCE70], v5, (uint64_t)v4, (uint64_t)v3);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2263DB100((uint64_t)&v68, v69[0]);

  return v47;
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
      v23 = pxrInternal__aapl__pxrReserved__::UsdObject::SetMetadata((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v27, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v30);
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
      v23 = pxrInternal__aapl__pxrReserved__::UsdObject::SetMetadata((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v27, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v30);
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
      v33 = pxrInternal__aapl__pxrReserved__::UsdObject::SetMetadataByDictKey((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v40, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v39, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v43);
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
      v33 = pxrInternal__aapl__pxrReserved__::UsdObject::SetMetadataByDictKey((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v40, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v39, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v43);
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
  v20 = pxrInternal__aapl__pxrReserved__::UsdObject::SetMetadataByDictKey((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v27, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v26, (const pxrInternal__aapl__pxrReserved__::VtValue *)v28);
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
  pxrInternal__aapl__pxrReserved__::UsdObject::GetMetadata((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v23, (pxrInternal__aapl__pxrReserved__::VtValue *)&v25);
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
    v14 = (void *)objc_msgSend_initWithVtValue_typeName_withNodeOwner_(v11, v13, (uint64_t)v24, (uint64_t)&v22, self);
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
  pxrInternal__aapl__pxrReserved__::UsdObject::GetMetadataByDictKey((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v34, (const pxrInternal__aapl__pxrReserved__::TfToken *)&Type, (pxrInternal__aapl__pxrReserved__::VtValue *)&v36);
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
    v25 = (void *)objc_msgSend_initWithVtValue_typeName_withNodeOwner_(v22, v24, (uint64_t)v35, (uint64_t)&v32, self);
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
  pxrInternal__aapl__pxrReserved__::UsdObject::GetMetadataByDictKey((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)(v5 + 72), (const pxrInternal__aapl__pxrReserved__::TfToken *)&v25, (pxrInternal__aapl__pxrReserved__::VtValue *)&v27);
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
    v16 = (void *)objc_msgSend_initWithVtValue_typeName_withNodeOwner_(v13, v15, (uint64_t)v26, (uint64_t)&v24, self);
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

- (void)addReferenceWithURL:(id)a3 nodePath:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int *v24;
  unsigned int v25;
  _BYTE v26[16];
  uint64_t v27;
  void *__p[2];
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    pxrInternal__aapl__pxrReserved__::UsdPrim::GetReferences((pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
    objc_msgSend_relativeString(v6, v8, v9, v10);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (char *)objc_msgSend_UTF8String(v11, v12, v13, v14);
    sub_2263AE2A8(__p, v15);
    if (v7)
      objc_msgSend_path(v7, v16, v17, v18);
    else
      v27 = 0;
    pxrInternal__aapl__pxrReserved__::SdfLayerOffset::SdfLayerOffset((pxrInternal__aapl__pxrReserved__::SdfLayerOffset *)v26, 0.0, 1.0);
    pxrInternal__aapl__pxrReserved__::UsdReferences::AddReference();
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v27);
    if (v29 < 0)
      operator delete(__p[0]);

    if ((v32 & 7) != 0)
    {
      v22 = (unsigned int *)(v32 & 0xFFFFFFFFFFFFFFF8);
      do
        v23 = __ldxr(v22);
      while (__stlxr(v23 - 2, v22));
    }
  }
  else
  {
    pxrInternal__aapl__pxrReserved__::UsdPrim::GetReferences((pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
    sub_2263AE2A8(__p, "");
    if (v7)
      objc_msgSend_path(v7, v19, v20, v21);
    else
      v27 = 0;
    pxrInternal__aapl__pxrReserved__::SdfLayerOffset::SdfLayerOffset((pxrInternal__aapl__pxrReserved__::SdfLayerOffset *)v26, 0.0, 1.0);
    pxrInternal__aapl__pxrReserved__::UsdReferences::AddReference();
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v27);
    if (v29 < 0)
      operator delete(__p[0]);
    if ((v32 & 7) != 0)
    {
      v24 = (unsigned int *)(v32 & 0xFFFFFFFFFFFFFFF8);
      do
        v25 = __ldxr(v24);
      while (__stlxr(v25 - 2, v24));
    }
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v31);
  if (v30)
    sub_2263DA640(v30);

}

- (void)addReferenceWithPath:(id)a3 nodePath:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int *v19;
  unsigned int v20;
  unsigned int *v21;
  unsigned int v22;
  _BYTE v23[16];
  uint64_t v24;
  void *__p[2];
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    pxrInternal__aapl__pxrReserved__::UsdPrim::GetReferences((pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
    v8 = objc_retainAutorelease(v6);
    v12 = (char *)objc_msgSend_UTF8String(v8, v9, v10, v11);
    sub_2263AE2A8(__p, v12);
    if (v7)
      objc_msgSend_path(v7, v13, v14, v15);
    else
      v24 = 0;
    pxrInternal__aapl__pxrReserved__::SdfLayerOffset::SdfLayerOffset((pxrInternal__aapl__pxrReserved__::SdfLayerOffset *)v23, 0.0, 1.0);
    pxrInternal__aapl__pxrReserved__::UsdReferences::AddReference();
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v24);
    if (v26 < 0)
      operator delete(__p[0]);
    if ((v29 & 7) != 0)
    {
      v19 = (unsigned int *)(v29 & 0xFFFFFFFFFFFFFFF8);
      do
        v20 = __ldxr(v19);
      while (__stlxr(v20 - 2, v19));
    }
  }
  else
  {
    pxrInternal__aapl__pxrReserved__::UsdPrim::GetReferences((pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
    sub_2263AE2A8(__p, "");
    if (v7)
      objc_msgSend_path(v7, v16, v17, v18);
    else
      v24 = 0;
    pxrInternal__aapl__pxrReserved__::SdfLayerOffset::SdfLayerOffset((pxrInternal__aapl__pxrReserved__::SdfLayerOffset *)v23, 0.0, 1.0);
    pxrInternal__aapl__pxrReserved__::UsdReferences::AddReference();
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v24);
    if (v26 < 0)
      operator delete(__p[0]);
    if ((v29 & 7) != 0)
    {
      v21 = (unsigned int *)(v29 & 0xFFFFFFFFFFFFFFF8);
      do
        v22 = __ldxr(v21);
      while (__stlxr(v22 - 2, v21));
    }
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v28);
  if (v27)
    sub_2263DA640(v27);

}

- (void)addReferenceWithPath:(id)a3 nodePath:(id)a4 offset:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int *v24;
  unsigned int v25;
  unsigned int *v26;
  unsigned int v27;
  _QWORD v28[2];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *__p[2];
  uint64_t v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  __p[0] = 0;
  __p[1] = 0;
  v34 = 0;
  sub_2263AE2A8(__p, "");
  if (v8)
  {
    v11 = objc_retainAutorelease(v8);
    v15 = objc_msgSend_UTF8String(v11, v12, v13, v14);
    MEMORY[0x227697FCC](__p, v15);
  }
  if (v10)
  {
    pxrInternal__aapl__pxrReserved__::UsdPrim::GetReferences((pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
    if (v9)
      objc_msgSend_path(v9, v16, v17, v18);
    else
      v29 = 0;
    objc_msgSend_sdfLayerOffset(v10, v16, v17, v18);
    v28[0] = v22;
    v28[1] = v23;
    pxrInternal__aapl__pxrReserved__::UsdReferences::AddReference();
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v29);
    if ((v32 & 7) != 0)
    {
      v24 = (unsigned int *)(v32 & 0xFFFFFFFFFFFFFFF8);
      do
        v25 = __ldxr(v24);
      while (__stlxr(v25 - 2, v24));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  }
  else
  {
    pxrInternal__aapl__pxrReserved__::UsdPrim::GetReferences((pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
    if (v9)
      objc_msgSend_path(v9, v19, v20, v21);
    else
      v29 = 0;
    pxrInternal__aapl__pxrReserved__::SdfLayerOffset::SdfLayerOffset((pxrInternal__aapl__pxrReserved__::SdfLayerOffset *)v28, 0.0, 1.0);
    pxrInternal__aapl__pxrReserved__::UsdReferences::AddReference();
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v29);
    if ((v32 & 7) != 0)
    {
      v26 = (unsigned int *)(v32 & 0xFFFFFFFFFFFFFFF8);
      do
        v27 = __ldxr(v26);
      while (__stlxr(v27 - 2, v26));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  }
  sub_2263BDE64((uint64_t)&v31);
  if (v30)
    sub_2263DA640(v30);
  if (SHIBYTE(v34) < 0)
    operator delete(__p[0]);

}

- (void)clearReferences
{
  unsigned int *v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  pxrInternal__aapl__pxrReserved__::UsdPrim::GetReferences((pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
  MEMORY[0x2276972F4](&v4);
  if ((v7 & 7) != 0)
  {
    v2 = (unsigned int *)(v7 & 0xFFFFFFFFFFFFFFF8);
    do
      v3 = __ldxr(v2);
    while (__stlxr(v3 - 2, v2));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v6);
  if (v5)
    sub_2263DA640(v5);
}

- (void)addVariantSet:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int *v12;
  unsigned int v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *__p;
  char v23;

  v4 = a3;
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetVariantSets((pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
  v5 = objc_retainAutorelease(v4);
  v9 = (char *)objc_msgSend_UTF8String(v5, v6, v7, v8);
  sub_2263AE2A8(&v14, v9);
  pxrInternal__aapl__pxrReserved__::UsdVariantSets::AddVariantSet();
  if (v23 < 0)
    operator delete(__p);
  if ((v21 & 7) != 0)
  {
    v10 = (unsigned int *)(v21 & 0xFFFFFFFFFFFFFFF8);
    do
      v11 = __ldxr(v10);
    while (__stlxr(v11 - 2, v10));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v20);
  if (v19)
    sub_2263DA640(v19);
  if (v15 < 0)
    operator delete(v14);
  if ((v18 & 7) != 0)
  {
    v12 = (unsigned int *)(v18 & 0xFFFFFFFFFFFFFFF8);
    do
      v13 = __ldxr(v12);
    while (__stlxr(v13 - 2, v12));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v17);
  if (v16)
    sub_2263DA640(v16);

}

- (void)addVariant:(id)a3 variantSet:(id)a4
{
  id v6;
  id v7;
  UsdPrim *p_prim;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char HasVariantSet;
  unsigned int *v15;
  unsigned int v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  unsigned int *v22;
  unsigned int v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  unsigned int *v29;
  unsigned int v30;
  unint64_t v31;
  const char *v32;
  void *v33;
  char v34;
  void *__p;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  void *v41[2];
  uint64_t v42;

  v6 = a3;
  v7 = a4;
  p_prim = &self->_prim;
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetVariantSets((pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
  v9 = objc_retainAutorelease(v7);
  v13 = (char *)objc_msgSend_UTF8String(v9, v10, v11, v12);
  sub_2263AE2A8(&__p, v13);
  HasVariantSet = pxrInternal__aapl__pxrReserved__::UsdVariantSets::HasVariantSet();
  if (SHIBYTE(v37) < 0)
    operator delete(__p);
  if ((BYTE8(v40) & 7) != 0)
  {
    v15 = (unsigned int *)(*((_QWORD *)&v40 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v16 = __ldxr(v15);
    while (__stlxr(v16 - 2, v15));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v40);
  if (*((_QWORD *)&v39 + 1))
    sub_2263DA640(*((uint64_t *)&v39 + 1));
  if ((HasVariantSet & 1) != 0)
  {
    v42 = 0;
    v40 = 0u;
    *(_OWORD *)v41 = 0u;
    v39 = 0u;
    pxrInternal__aapl__pxrReserved__::UsdPrim::GetVariantSets((pxrInternal__aapl__pxrReserved__::UsdPrim *)p_prim);
    v17 = objc_retainAutorelease(v9);
    v21 = (char *)objc_msgSend_UTF8String(v17, v18, v19, v20);
    sub_2263AE2A8(&v33, v21);
    pxrInternal__aapl__pxrReserved__::UsdVariantSets::GetVariantSet();
    if (v34 < 0)
      operator delete(v33);
    if ((v38 & 7) != 0)
    {
      v22 = (unsigned int *)(v38 & 0xFFFFFFFFFFFFFFF8);
      do
        v23 = __ldxr(v22);
      while (__stlxr(v23 - 2, v22));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v37);
    if (v36)
      sub_2263DA640(v36);
    v24 = objc_retainAutorelease(v6);
    v28 = (char *)objc_msgSend_UTF8String(v24, v25, v26, v27);
    sub_2263AE2A8(&__p, v28);
    pxrInternal__aapl__pxrReserved__::UsdVariantSet::AddVariant();
    if (SHIBYTE(v37) < 0)
      operator delete(__p);
    if (SHIBYTE(v42) < 0)
      operator delete(v41[0]);
    if ((BYTE8(v40) & 7) != 0)
    {
      v29 = (unsigned int *)(*((_QWORD *)&v40 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v30 = __ldxr(v29);
      while (__stlxr(v30 - 2, v29));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v40);
    if (*((_QWORD *)&v39 + 1))
      sub_2263DA640(*((uint64_t *)&v39 + 1));
  }
  else
  {
    v31 = *(_QWORD *)sub_2263DE374(p_prim) & 0xFFFFFFFFFFFFFFF8;
    if (v31)
    {
      v32 = (const char *)(v31 + 16);
      if (*(char *)(v31 + 39) < 0)
        v32 = *(const char **)v32;
    }
    else
    {
      v32 = "";
    }
    NSLog(CFSTR("Warning: variant set %@ does not exists in prim %s"), v9, v32);
  }

}

- (BOOL)hasVariantSets
{
  UsdPrim *p_prim;
  BOOL result;
  unsigned int *v4;
  unsigned int v5;
  uint64_t v6;

  p_prim = &self->_prim;
  MEMORY[0x2276976D8](&v6, "variantSetNames");
  result = pxrInternal__aapl__pxrReserved__::UsdObject::HasMetadata((pxrInternal__aapl__pxrReserved__::UsdObject *)p_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v6);
  if ((v6 & 7) != 0)
  {
    v4 = (unsigned int *)(v6 & 0xFFFFFFFFFFFFFFF8);
    do
      v5 = __ldxr(v4);
    while (__stlxr(v5 - 2, v4));
  }
  return result;
}

- (BOOL)hasVariantSet:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char HasVariantSet;
  unsigned int *v11;
  unsigned int v12;
  void *__p;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetVariantSets((pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
  v5 = objc_retainAutorelease(v4);
  v9 = (char *)objc_msgSend_UTF8String(v5, v6, v7, v8);
  sub_2263AE2A8(&__p, v9);
  HasVariantSet = pxrInternal__aapl__pxrReserved__::UsdVariantSets::HasVariantSet();
  if (v15 < 0)
    operator delete(__p);
  if ((v18 & 7) != 0)
  {
    v11 = (unsigned int *)(v18 & 0xFFFFFFFFFFFFFFF8);
    do
      v12 = __ldxr(v11);
    while (__stlxr(v12 - 2, v11));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v17);
  if (v16)
    sub_2263DA640(v16);

  return HasVariantSet;
}

- (id)variantSets
{
  id v3;
  unsigned int *v4;
  unsigned int v5;
  const char *v6;
  uint64_t v7;
  __int128 *v8;
  __int128 *i;
  __int128 v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *__p[2];
  uint64_t v16;
  uint64_t v17;
  __int128 *v18;
  __int128 *v19;
  uint64_t v20;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = 0;
  v19 = 0;
  v20 = 0;
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetVariantSets((pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
  pxrInternal__aapl__pxrReserved__::UsdVariantSets::GetNames((pxrInternal__aapl__pxrReserved__::UsdVariantSets *)__p);
  if ((v17 & 7) != 0)
  {
    v4 = (unsigned int *)(v17 & 0xFFFFFFFFFFFFFFF8);
    do
      v5 = __ldxr(v4);
    while (__stlxr(v5 - 2, v4));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v16);
  if (__p[1])
    sub_2263DA640((uint64_t)__p[1]);
  v8 = v18;
  for (i = v19; v8 != i; v8 = (__int128 *)((char *)v8 + 24))
  {
    __p[0] = 0;
    __p[1] = 0;
    v16 = 0;
    if (*((char *)v8 + 23) < 0)
    {
      sub_2263AE36C(__p, *(void **)v8, *((_QWORD *)v8 + 1));
    }
    else
    {
      v10 = *v8;
      v16 = *((_QWORD *)v8 + 2);
      *(_OWORD *)__p = v10;
    }
    if (v16 >= 0)
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v6, (uint64_t)__p, v7, __p[0], __p[1], v16);
    else
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v6, (uint64_t)__p[0], v7, __p[0], __p[1], v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v12, (uint64_t)v11, v13);

    if (SHIBYTE(v16) < 0)
      operator delete(__p[0]);
  }
  __p[0] = &v18;
  sub_2263DA710((void ***)__p);
  return v3;
}

- (id)variantsWithVariantSet:(id)a3
{
  id v4;
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unsigned int *v11;
  unsigned int v12;
  const char *v13;
  uint64_t v14;
  __int128 *v15;
  uint64_t i;
  __int128 v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  id v21;
  unsigned int *v22;
  unsigned int v23;
  void *__p[2];
  uint64_t v26;
  __int128 *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  void *v33[2];
  uint64_t v34;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v34 = 0;
  v32 = 0u;
  *(_OWORD *)v33 = 0u;
  v31 = 0u;
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetVariantSets((pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
  v6 = objc_retainAutorelease(v4);
  v10 = (char *)objc_msgSend_UTF8String(v6, v7, v8, v9);
  sub_2263AE2A8(__p, v10);
  pxrInternal__aapl__pxrReserved__::UsdVariantSets::GetVariantSet();
  if (SHIBYTE(v26) < 0)
    operator delete(__p[0]);
  if ((v30 & 7) != 0)
  {
    v11 = (unsigned int *)(v30 & 0xFFFFFFFFFFFFFFF8);
    do
      v12 = __ldxr(v11);
    while (__stlxr(v12 - 2, v11));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v29);
  if (v28)
    sub_2263DA640(v28);
  pxrInternal__aapl__pxrReserved__::UsdVariantSet::GetVariantNames((pxrInternal__aapl__pxrReserved__::UsdVariantSet *)&v31);
  v15 = v27;
  for (i = v28; v15 != (__int128 *)i; v15 = (__int128 *)((char *)v15 + 24))
  {
    __p[0] = 0;
    __p[1] = 0;
    v26 = 0;
    if (*((char *)v15 + 23) < 0)
    {
      sub_2263AE36C(__p, *(void **)v15, *((_QWORD *)v15 + 1));
    }
    else
    {
      v17 = *v15;
      v26 = *((_QWORD *)v15 + 2);
      *(_OWORD *)__p = v17;
    }
    if (v26 >= 0)
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v13, (uint64_t)__p, v14, __p[0], __p[1], v26);
    else
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v13, (uint64_t)__p[0], v14, __p[0], __p[1], v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v5, v19, (uint64_t)v18, v20);

    if (SHIBYTE(v26) < 0)
      operator delete(__p[0]);
  }
  __p[0] = &v27;
  sub_2263DA710((void ***)__p);
  v21 = v5;
  if (SHIBYTE(v34) < 0)
    operator delete(v33[0]);
  if ((BYTE8(v32) & 7) != 0)
  {
    v22 = (unsigned int *)(*((_QWORD *)&v32 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v23 = __ldxr(v22);
    while (__stlxr(v23 - 2, v22));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v32);
  if (*((_QWORD *)&v31 + 1))
    sub_2263DA640(*((uint64_t *)&v31 + 1));

  return v21;
}

- (BOOL)selectVariant:(id)a3 variantSet:(id)a4
{
  id v6;
  id v7;
  UsdPrim *p_prim;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int HasVariantSet;
  unsigned int *v15;
  unsigned int v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  unsigned int *v22;
  unsigned int v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char HasAuthoredVariant;
  BOOL v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  unint64_t v36;
  const char *v37;
  unsigned int *v38;
  unsigned int v39;
  void *v41;
  char v42;
  void *__p;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  void *v49[2];
  uint64_t v50;

  v6 = a3;
  v7 = a4;
  p_prim = &self->_prim;
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetVariantSets((pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
  v9 = objc_retainAutorelease(v7);
  v13 = (char *)objc_msgSend_UTF8String(v9, v10, v11, v12);
  sub_2263AE2A8(&__p, v13);
  HasVariantSet = pxrInternal__aapl__pxrReserved__::UsdVariantSets::HasVariantSet();
  if (SHIBYTE(v45) < 0)
    operator delete(__p);
  if ((BYTE8(v48) & 7) != 0)
  {
    v15 = (unsigned int *)(*((_QWORD *)&v48 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v16 = __ldxr(v15);
    while (__stlxr(v16 - 2, v15));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v48);
  if (*((_QWORD *)&v47 + 1))
    sub_2263DA640(*((uint64_t *)&v47 + 1));
  if (HasVariantSet)
  {
    v50 = 0;
    v48 = 0u;
    *(_OWORD *)v49 = 0u;
    v47 = 0u;
    pxrInternal__aapl__pxrReserved__::UsdPrim::GetVariantSets((pxrInternal__aapl__pxrReserved__::UsdPrim *)p_prim);
    v17 = objc_retainAutorelease(v9);
    v21 = (char *)objc_msgSend_UTF8String(v17, v18, v19, v20);
    sub_2263AE2A8(&v41, v21);
    pxrInternal__aapl__pxrReserved__::UsdVariantSets::GetVariantSet();
    if (v42 < 0)
      operator delete(v41);
    if ((v46 & 7) != 0)
    {
      v22 = (unsigned int *)(v46 & 0xFFFFFFFFFFFFFFF8);
      do
        v23 = __ldxr(v22);
      while (__stlxr(v23 - 2, v22));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v45);
    if (v44)
      sub_2263DA640(v44);
    v24 = objc_retainAutorelease(v6);
    v28 = (char *)objc_msgSend_UTF8String(v24, v25, v26, v27);
    sub_2263AE2A8(&__p, v28);
    HasAuthoredVariant = pxrInternal__aapl__pxrReserved__::UsdVariantSet::HasAuthoredVariant();
    v30 = HasAuthoredVariant;
    if (SHIBYTE(v45) < 0)
    {
      operator delete(__p);
      if (v30)
      {
LABEL_18:
        v31 = objc_retainAutorelease(v24);
        v35 = (char *)objc_msgSend_UTF8String(v31, v32, v33, v34);
        sub_2263AE2A8(&__p, v35);
        pxrInternal__aapl__pxrReserved__::UsdVariantSet::SetVariantSelection();
        if (SHIBYTE(v45) < 0)
          operator delete(__p);
        goto LABEL_27;
      }
    }
    else if ((HasAuthoredVariant & 1) != 0)
    {
      goto LABEL_18;
    }
    NSLog(CFSTR("Warning: variant %@ does not exists in set %@"), v24, v17);
LABEL_27:
    if (SHIBYTE(v50) < 0)
      operator delete(v49[0]);
    if ((BYTE8(v48) & 7) != 0)
    {
      v38 = (unsigned int *)(*((_QWORD *)&v48 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v39 = __ldxr(v38);
      while (__stlxr(v39 - 2, v38));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v48);
    if (*((_QWORD *)&v47 + 1))
      sub_2263DA640(*((uint64_t *)&v47 + 1));
    goto LABEL_34;
  }
  v36 = *(_QWORD *)sub_2263DE374(p_prim) & 0xFFFFFFFFFFFFFFF8;
  if (v36)
  {
    v37 = (const char *)(v36 + 16);
    if (*(char *)(v36 + 39) < 0)
      v37 = *(const char **)v37;
  }
  else
  {
    v37 = "";
  }
  NSLog(CFSTR("Warning: variant set %@ does not exists in prim %s"), v9, v37);
  v30 = 0;
LABEL_34:

  return v30;
}

- (BOOL)editVariant:(id)a3 variantSet:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  const char *v11;
  int v12;
  UsdPrim *p_prim;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unsigned int *v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int *v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  unsigned int *v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int *v33;
  unsigned int v34;
  __int128 v36;
  void *v37[2];
  uint64_t v38;
  void *__p;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  _OWORD v45[4];
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v12 = objc_msgSend_selectVariant_variantSet_(self, v11, (uint64_t)v8, (uint64_t)v9);
  if (v12)
  {
    v38 = 0;
    v36 = 0u;
    *(_OWORD *)v37 = 0u;
    p_prim = &self->_prim;
    pxrInternal__aapl__pxrReserved__::UsdPrim::GetVariantSets((pxrInternal__aapl__pxrReserved__::UsdPrim *)p_prim);
    v14 = objc_retainAutorelease(v9);
    v18 = (char *)objc_msgSend_UTF8String(v14, v15, v16, v17);
    sub_2263AE2A8(&__p, v18);
    pxrInternal__aapl__pxrReserved__::UsdVariantSets::GetVariantSet();
    if (v41 < 0)
      operator delete(__p);
    if ((BYTE8(v45[0]) & 7) != 0)
    {
      v19 = (unsigned int *)(*((_QWORD *)&v45[0] + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v20 = __ldxr(v19);
      while (__stlxr(v20 - 2, v19));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)v45);
    if (*((_QWORD *)&v44 + 1))
      sub_2263DA640(*((uint64_t *)&v44 + 1));
    v46 = 0;
    memset(v45, 0, sizeof(v45));
    v44 = 0u;
    pxrInternal__aapl__pxrReserved__::UsdVariantSet::GetVariantEditContext();
    MEMORY[0x227697354](&v44, &__p);
    sub_226401D80((uint64_t)&v43);
    v21 = v42;
    if (v42)
    {
      v22 = (unsigned int *)(v42 + 8);
      do
      {
        v23 = __ldxr(v22);
        v24 = v23 - 1;
      }
      while (__stlxr(v24, v22));
      if (!v24)
        (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
    }
    v25 = v40;
    if (v40)
    {
      v26 = (unsigned int *)(v40 + 8);
      do
      {
        v27 = __ldxr(v26);
        v28 = v27 - 1;
      }
      while (__stlxr(v28, v26));
      if (!v28)
        (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
    }
    __p = 0;
    v40 = 0;
    pxrInternal__aapl__pxrReserved__::UsdObject::GetStage((pxrInternal__aapl__pxrReserved__::UsdObject *)p_prim);
    v10[2](v10);
    v29 = v40;
    if (v40)
    {
      v30 = (unsigned int *)(v40 + 8);
      do
      {
        v31 = __ldxr(v30);
        v32 = v31 - 1;
      }
      while (__stlxr(v32, v30));
      if (!v32)
        (*(void (**)(uint64_t))(*(_QWORD *)v29 + 8))(v29);
    }
    MEMORY[0x227697360](&v44);
    if (SHIBYTE(v38) < 0)
      operator delete(v37[0]);
    if ((BYTE8(v36) & 7) != 0)
    {
      v33 = (unsigned int *)(*((_QWORD *)&v36 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v34 = __ldxr(v33);
      while (__stlxr(v34 - 2, v33));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v36);
  }

  return v12;
}

- (BOOL)clearVariantSelectionForVariantSet:(id)a3
{
  id v4;
  UsdPrim *p_prim;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int HasVariantSet;
  unsigned int *v12;
  unsigned int v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unsigned int *v19;
  unsigned int v20;
  unsigned int *v21;
  unsigned int v22;
  void *v24;
  char v25;
  void *__p;
  uint64_t v27;
  _BYTE v28[8];
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  void *v32[2];
  uint64_t v33;

  v4 = a3;
  p_prim = &self->_prim;
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetVariantSets((pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
  v6 = objc_retainAutorelease(v4);
  v10 = (char *)objc_msgSend_UTF8String(v6, v7, v8, v9);
  sub_2263AE2A8(&__p, v10);
  HasVariantSet = pxrInternal__aapl__pxrReserved__::UsdVariantSets::HasVariantSet();
  if ((v28[7] & 0x80000000) != 0)
    operator delete(__p);
  if ((BYTE8(v31) & 7) != 0)
  {
    v12 = (unsigned int *)(*((_QWORD *)&v31 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v13 = __ldxr(v12);
    while (__stlxr(v13 - 2, v12));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v31);
  if (*((_QWORD *)&v30 + 1))
    sub_2263DA640(*((uint64_t *)&v30 + 1));
  if (HasVariantSet)
  {
    v33 = 0;
    v31 = 0u;
    *(_OWORD *)v32 = 0u;
    v30 = 0u;
    pxrInternal__aapl__pxrReserved__::UsdPrim::GetVariantSets((pxrInternal__aapl__pxrReserved__::UsdPrim *)p_prim);
    v14 = objc_retainAutorelease(v6);
    v18 = (char *)objc_msgSend_UTF8String(v14, v15, v16, v17);
    sub_2263AE2A8(&v24, v18);
    pxrInternal__aapl__pxrReserved__::UsdVariantSets::GetVariantSet();
    if (v25 < 0)
      operator delete(v24);
    if ((v29 & 7) != 0)
    {
      v19 = (unsigned int *)(v29 & 0xFFFFFFFFFFFFFFF8);
      do
        v20 = __ldxr(v19);
      while (__stlxr(v20 - 2, v19));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)v28);
    if (v27)
      sub_2263DA640(v27);
    pxrInternal__aapl__pxrReserved__::UsdVariantSet::ClearVariantSelection((pxrInternal__aapl__pxrReserved__::UsdVariantSet *)&v30);
    if (SHIBYTE(v33) < 0)
      operator delete(v32[0]);
    if ((BYTE8(v31) & 7) != 0)
    {
      v21 = (unsigned int *)(*((_QWORD *)&v31 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v22 = __ldxr(v21);
      while (__stlxr(v22 - 2, v21));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v31);
    if (*((_QWORD *)&v30 + 1))
      sub_2263DA640(*((uint64_t *)&v30 + 1));
  }

  return HasVariantSet;
}

- (id)inheritedMaterialBinding
{
  const pxrInternal__aapl__pxrReserved__::TfToken *v2;
  USKNode *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  unsigned int *v7;
  unsigned int v8;
  _BYTE v10[8];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v15 = 0;
  v16 = 0;
  v17 = 0;
  pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)v14, &self->_prim);
  v14[3] = 0;
  v14[0] = MEMORY[0x24BEE9DC8] + 16;
  v2 = (const pxrInternal__aapl__pxrReserved__::TfToken *)atomic_load(MEMORY[0x24BEE8128]);
  if (!v2)
    v2 = (const pxrInternal__aapl__pxrReserved__::TfToken *)sub_226403004(MEMORY[0x24BEE8128]);
  pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI::ComputeBoundMaterial((pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI *)v14, v2, 0);
  MEMORY[0x2276975A0](v14);
  if (v16 && (*(_BYTE *)(v16 + 57) & 8) == 0 && (*(unsigned int (**)(uint64_t *))(v15 + 32))(&v15))
  {
    v3 = [USKNode alloc];
    sub_2263E3F28((uint64_t)v10, &v16, &v17);
    v6 = (void *)objc_msgSend_initWithUsdPrim_(v3, v4, (uint64_t)v10, v5);
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
  }
  else
  {
    v6 = 0;
  }
  MEMORY[0x227697444](&v15);
  return v6;
}

- (id)inheritedSkeletonBinding
{
  USKNode *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  unsigned int *v6;
  unsigned int v7;
  _BYTE v9[8];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v14 = 0;
  v15 = 0;
  v16 = 0;
  pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)v13, &self->_prim);
  v13[3] = 0;
  v13[0] = MEMORY[0x24BEE9DA0] + 16;
  pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI::GetInheritedSkeleton((pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI *)v13);
  MEMORY[0x22769748C](v13);
  if (v15 && (*(_BYTE *)(v15 + 57) & 8) == 0 && (*(unsigned int (**)(uint64_t *))(v14 + 32))(&v14))
  {
    v2 = [USKNode alloc];
    sub_2263E3F28((uint64_t)v9, &v15, &v16);
    v5 = (void *)objc_msgSend_initWithUsdPrim_(v2, v3, (uint64_t)v9, v4);
    if ((v12 & 7) != 0)
    {
      v6 = (unsigned int *)(v12 & 0xFFFFFFFFFFFFFFF8);
      do
        v7 = __ldxr(v6);
      while (__stlxr(v7 - 2, v6));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v11);
    if (v10)
      sub_2263DA640(v10);
  }
  else
  {
    v5 = 0;
  }
  MEMORY[0x2276973D8](&v14);
  return v5;
}

- (id)inheritedSkeletonAnimationBinding
{
  USKNode *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  unsigned int *v6;
  unsigned int v7;
  id v8;
  unsigned int *v9;
  unsigned int v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  __int128 v17;
  __int128 v18;

  v17 = 0u;
  v18 = 0u;
  pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)v16, &self->_prim);
  v16[3] = 0;
  v16[0] = MEMORY[0x24BEE9DA0] + 16;
  pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI::GetInheritedAnimationSource((pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI *)v16);
  MEMORY[0x22769748C](v16);
  if (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v17))
  {
    v2 = [USKNode alloc];
    sub_2263E3F28((uint64_t)&v12, (uint64_t *)&v17 + 1, &v18);
    v5 = (void *)objc_msgSend_initWithUsdPrim_(v2, v3, (uint64_t)&v12, v4);
    if ((v15 & 7) != 0)
    {
      v6 = (unsigned int *)(v15 & 0xFFFFFFFFFFFFFFF8);
      do
        v7 = __ldxr(v6);
      while (__stlxr(v7 - 2, v6));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v14);
    if (v13)
      sub_2263DA640(v13);
  }
  else
  {
    v5 = 0;
  }
  v8 = v5;
  if ((BYTE8(v18) & 7) != 0)
  {
    v9 = (unsigned int *)(*((_QWORD *)&v18 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v10 = __ldxr(v9);
    while (__stlxr(v10 - 2, v9));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v18);
  if (*((_QWORD *)&v17 + 1))
    sub_2263DA640(*((uint64_t *)&v17 + 1));

  return v8;
}

- (id)inheritedProperty:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  USKProperty *v12;
  unint64_t *v13;
  unint64_t v14;
  const char *v15;
  unsigned int *v16;
  unsigned int v17;
  void *v18;
  unsigned int *v19;
  unsigned int v20;
  id v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int *v24;
  unsigned int v25;
  int v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[4];
  __int128 v34;
  __int128 v35;
  __int128 v36;

  v4 = a3;
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)v33, &self->_prim);
  v33[3] = 0;
  v33[0] = MEMORY[0x24BEE9DB0] + 16;
  v5 = objc_retainAutorelease(v4);
  v9 = objc_msgSend_UTF8String(v5, v6, v7, v8);
  MEMORY[0x2276976D8](&v32, v9);
  pxrInternal__aapl__pxrReserved__::UsdGeomPrimvarsAPI::FindPrimvarWithInheritance((pxrInternal__aapl__pxrReserved__::UsdGeomPrimvarsAPI *)v33, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v32);
  if ((v32 & 7) != 0)
  {
    v10 = (unsigned int *)(v32 & 0xFFFFFFFFFFFFFFF8);
    do
      v11 = __ldxr(v10);
    while (__stlxr(v11 - 2, v10));
  }
  MEMORY[0x2276974BC](v33);
  if (pxrInternal__aapl__pxrReserved__::UsdGeomPrimvar::IsPrimvar())
  {
    v12 = [USKProperty alloc];
    v27 = v34;
    v28 = *((_QWORD *)&v34 + 1);
    if (*((_QWORD *)&v34 + 1))
    {
      v13 = (unint64_t *)(*((_QWORD *)&v34 + 1) + 48);
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
    sub_2263BDDD8(&v29, &v35);
    sub_2263BDE28(&v30, (_DWORD *)&v35 + 1);
    v31 = *((_QWORD *)&v35 + 1);
    if ((BYTE8(v35) & 7) != 0)
    {
      v16 = (unsigned int *)(*((_QWORD *)&v35 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v17 = __ldxr(v16);
      while (__stxr(v17 + 2, v16));
      if ((v17 & 1) == 0)
        v31 &= 0xFFFFFFFFFFFFFFF8;
    }
    v18 = (void *)objc_msgSend_initWithUsdProperty_withNodeOwner_(v12, v15, (uint64_t)&v27, (uint64_t)self);
    if ((v31 & 7) != 0)
    {
      v19 = (unsigned int *)(v31 & 0xFFFFFFFFFFFFFFF8);
      do
        v20 = __ldxr(v19);
      while (__stlxr(v20 - 2, v19));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v29);
    if (v28)
      sub_2263DA640(v28);
  }
  else
  {
    v18 = 0;
  }
  v21 = v18;
  if ((v36 & 7) != 0)
  {
    v22 = (unsigned int *)(v36 & 0xFFFFFFFFFFFFFFF8);
    do
      v23 = __ldxr(v22);
    while (__stlxr(v23 - 2, v22));
  }
  if ((BYTE8(v35) & 7) != 0)
  {
    v24 = (unsigned int *)(*((_QWORD *)&v35 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v25 = __ldxr(v24);
    while (__stlxr(v25 - 2, v24));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v35);
  if (*((_QWORD *)&v34 + 1))
    sub_2263DA640(*((uint64_t *)&v34 + 1));

  return v21;
}

- (NSDictionary)properties
{
  void *v2;
  void *v3;
  id v4;
  const char *v5;
  void *v6;
  _QWORD v8[3];
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  memset(v8, 0, sizeof(v8));
  v10 = 0;
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetAuthoredProperties();
  if (!&v9)
    (*(void (**)(void))(v9 + 32))();
  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  v4 = objc_alloc(MEMORY[0x24BDBCE70]);
  v6 = (void *)objc_msgSend_initWithObjects_forKeys_(v4, v5, (uint64_t)v3, (uint64_t)v2);

  *(_QWORD *)&v9 = v8;
  sub_2264035B4((void ***)&v9);
  return (NSDictionary *)v6;
}

- (id)property:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  USKProperty *v9;
  unint64_t *v10;
  unint64_t v11;
  const char *v12;
  unsigned int *v13;
  unsigned int v14;
  void *v15;
  unsigned int *v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int *v20;
  unsigned int v21;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = 0;
  v4 = objc_retainAutorelease(a3);
  v8 = objc_msgSend_UTF8String(v4, v5, v6, v7);
  MEMORY[0x2276976D8](&v30, v8);
  v28 = 0u;
  v29 = 0u;
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetProperty((pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v30);
  if (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v28))
  {
    v9 = [USKProperty alloc];
    v23 = v28;
    v24 = *((_QWORD *)&v28 + 1);
    if (*((_QWORD *)&v28 + 1))
    {
      v10 = (unint64_t *)(*((_QWORD *)&v28 + 1) + 48);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    sub_2263BDDD8(&v25, &v29);
    sub_2263BDE28(&v26, (_DWORD *)&v29 + 1);
    v27 = *((_QWORD *)&v29 + 1);
    if ((BYTE8(v29) & 7) != 0)
    {
      v13 = (unsigned int *)(*((_QWORD *)&v29 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 2, v13));
      if ((v14 & 1) == 0)
        v27 &= 0xFFFFFFFFFFFFFFF8;
    }
    v15 = (void *)objc_msgSend_initWithUsdProperty_withNodeOwner_(v9, v12, (uint64_t)&v23, (uint64_t)self);
    if ((v27 & 7) != 0)
    {
      v16 = (unsigned int *)(v27 & 0xFFFFFFFFFFFFFFF8);
      do
        v17 = __ldxr(v16);
      while (__stlxr(v17 - 2, v16));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v25);
    if (v24)
      sub_2263DA640(v24);
  }
  else
  {
    v15 = 0;
  }
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
  if ((v30 & 7) != 0)
  {
    v20 = (unsigned int *)(v30 & 0xFFFFFFFFFFFFFFF8);
    do
      v21 = __ldxr(v20);
    while (__stlxr(v21 - 2, v20));
  }

  return v15;
}

- (BOOL)removeProperty:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  UsdPrim *p_prim;
  char v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int *v19;
  unsigned int v20;
  unsigned int *v21;
  unsigned int v22;
  _QWORD v24[3];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  void **v30;

  v29 = 0;
  v4 = objc_retainAutorelease(a3);
  v8 = objc_msgSend_UTF8String(v4, v5, v6, v7);
  MEMORY[0x2276976D8](&v29, v8);
  v27 = 0u;
  v28 = 0u;
  p_prim = &self->_prim;
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetProperty((pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v29);
  v10 = sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v27);
  if ((v10 & 1) != 0)
  {
    pxrInternal__aapl__pxrReserved__::UsdPrim::RemoveProperty((pxrInternal__aapl__pxrReserved__::UsdPrim *)p_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v29);
    pxrInternal__aapl__pxrReserved__::UsdPrim::GetProperty((pxrInternal__aapl__pxrReserved__::UsdPrim *)p_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v29);
    LODWORD(v27) = v25;
    v11 = *((_QWORD *)&v25 + 1);
    *((_QWORD *)&v25 + 1) = 0;
    v12 = *((_QWORD *)&v27 + 1);
    *((_QWORD *)&v27 + 1) = v11;
    if (v12)
      sub_2263DA640(v12);
    sub_2263BE05C((uint64_t)&v28, (int *)&v26);
    sub_2263BE0B0((uint64_t)&v28 + 4);
    if ((BYTE8(v28) & 7) != 0)
    {
      v13 = (unsigned int *)(*((_QWORD *)&v28 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v14 = __ldxr(v13);
      while (__stlxr(v14 - 2, v13));
    }
    *((_QWORD *)&v28 + 1) = *((_QWORD *)&v26 + 1);
    *((_QWORD *)&v26 + 1) = 0;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v26);
    if ((sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v27) & 1) != 0)
    {
      if ((_DWORD)v27 == 3)
      {
        v25 = 0uLL;
        v26 = 0uLL;
        sub_2263DC6FC((uint64_t)&v27, (uint64_t)&v25);
        pxrInternal__aapl__pxrReserved__::UsdAttribute::Block((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v25);
        if ((BYTE8(v26) & 7) != 0)
        {
          v15 = (unsigned int *)(*((_QWORD *)&v26 + 1) & 0xFFFFFFFFFFFFFFF8);
          do
            v16 = __ldxr(v15);
          while (__stlxr(v16 - 2, v15));
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
      }
      else
      {
        v25 = 0uLL;
        v26 = 0uLL;
        sub_2263E9114((uint64_t)&v27, (uint64_t)&v25);
        memset(v24, 0, sizeof(v24));
        pxrInternal__aapl__pxrReserved__::UsdRelationship::SetTargets();
        v30 = (void **)v24;
        sub_2263BE380(&v30);
        if ((BYTE8(v26) & 7) != 0)
        {
          v17 = (unsigned int *)(*((_QWORD *)&v26 + 1) & 0xFFFFFFFFFFFFFFF8);
          do
            v18 = __ldxr(v17);
          while (__stlxr(v18 - 2, v17));
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
      }
      sub_2263BDE64((uint64_t)&v26);
      if (*((_QWORD *)&v25 + 1))
        sub_2263DA640(*((uint64_t *)&v25 + 1));
    }
  }
  if ((BYTE8(v28) & 7) != 0)
  {
    v19 = (unsigned int *)(*((_QWORD *)&v28 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v20 = __ldxr(v19);
    while (__stlxr(v20 - 2, v19));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v28);
  if (*((_QWORD *)&v27 + 1))
    sub_2263DA640(*((uint64_t *)&v27 + 1));
  if ((v29 & 7) != 0)
  {
    v21 = (unsigned int *)(v29 & 0xFFFFFFFFFFFFFFF8);
    do
      v22 = __ldxr(v21);
    while (__stlxr(v22 - 2, v21));
  }

  return v10;
}

- (BOOL)isInstanceNode
{
  return pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::operator BOOL();
}

- (id)masterNode
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
  sub_2263FEB38((uint64_t)&self->_prim, (uint64_t)&v10);
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

- (id)specifier
{
  unsigned int v2;
  __CFString **v3;

  sub_2263FEC48((uint64_t)&self->_prim, (const pxrInternal__aapl__pxrReserved__::Usd_PrimData *)a2);
  if (v2 > 2)
    v3 = &USKNodeSpecifierTypeDefine;
  else
    v3 = (&off_24EDD8C50)[v2];
  return *v3;
}

- (void)setSpecifier:(id)a3
{
  __CFString *v4;
  __CFString *v5;

  v4 = (__CFString *)a3;
  v5 = v4;
  if (CFSTR("SdfSpecifierDef") == v4 || CFSTR("SdfSpecifierOver") == v4 || CFSTR("SdfSpecifierClass") == v4)
    sub_2263FED20((uint64_t)&self->_prim);

}

- (id)newPropertyWithName:(id)a3 type:(id)a4 role:(id)a5
{
  return (id)MEMORY[0x24BEDD108](self, sel_newPropertyWithName_type_role_variability_, a3, a4);
}

- (id)newPropertyWithName:(id)a3 type:(id)a4 role:(id)a5 variability:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const pxrInternal__aapl__pxrReserved__::Usd_PrimData *v23;
  pxrInternal__aapl__pxrReserved__::UsdPrimDefinition *v24;
  Usd_PrimData *px;
  unint64_t *v26;
  unint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t poolHandle;
  unsigned int *v32;
  unsigned int v33;
  pxrInternal__aapl__pxrReserved__::SdfSpec *v34;
  pxrInternal__aapl__pxrReserved__::SdfSpec *v35;
  pxrInternal__aapl__pxrReserved__::SdfSpec *v36;
  pxrInternal__aapl__pxrReserved__::SdfSpec *v37;
  unsigned int *v38;
  unsigned int v39;
  USKProperty *v40;
  unint64_t *v41;
  unint64_t v42;
  const char *v43;
  unsigned int *v44;
  unsigned int v45;
  void *v46;
  unsigned int *v47;
  unsigned int v48;
  unsigned int *v49;
  unsigned int v50;
  pxrInternal__aapl__pxrReserved__::SdfSpec *v51;
  pxrInternal__aapl__pxrReserved__::SdfSpec *v52;
  unsigned int *v53;
  unsigned int v54;
  USKProperty *v55;
  unint64_t *v56;
  unint64_t v57;
  const char *v58;
  unsigned int *v59;
  unsigned int v60;
  unsigned int *v61;
  unsigned int v62;
  unsigned int *v63;
  unsigned int v64;
  uint64_t v65;
  unsigned int *v66;
  unsigned int v67;
  unsigned int *v68;
  unsigned int v69;
  unsigned int *v70;
  unsigned int v71;
  unsigned int *v72;
  unsigned int v73;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  int type;
  Usd_PrimData *v79;
  int v80;
  int v81;
  unint64_t v82;
  int v83;
  uint64_t v84;
  int v85;
  int v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  int v90;
  int v91;
  uint64_t v92;
  uint64_t TypeName;
  uint64_t v94;
  unsigned int v95;
  uint64_t v96;
  int v97;
  int v98;
  uint64_t v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  _QWORD v103[2];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v75 = v10;
  objc_msgSend_tokenWithDataType_(USKToken, v12, (uint64_t)v10, v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenWithRoleType_(USKToken, v15, (uint64_t)v11, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v103[0] = 0;
  v18 = objc_retainAutorelease(v9);
  v22 = objc_msgSend_UTF8String(v18, v19, v20, v21);
  MEMORY[0x2276976D8](v103, v22);
  v102 = 0;
  v24 = (pxrInternal__aapl__pxrReserved__::UsdPrimDefinition *)sub_2263FFB7C((uint64_t)&self->_prim, v23);
  pxrInternal__aapl__pxrReserved__::UsdPrimDefinition::GetSchemaPropertySpec(v24, (const pxrInternal__aapl__pxrReserved__::TfToken *)v103);
  if ((pxrInternal__aapl__pxrReserved__::SdfSpec::IsDormant((pxrInternal__aapl__pxrReserved__::SdfSpec *)&v102) & 1) != 0)
  {
LABEL_2:
    type = self->_prim._type;
    px = self->_prim._prim._p.px;
    v79 = px;
    if (px)
    {
      v26 = (unint64_t *)((char *)px + 48);
      do
        v27 = __ldxr(v26);
      while (__stxr(v27 + 1, v26));
    }
    sub_2263BDDD8(&v80, &self->_prim._proxyPrimPath);
    sub_2263BDE28(&v81, (_DWORD *)&self->_prim._proxyPrimPath._primPart._poolHandle + 1);
    poolHandle = (unint64_t)self->_prim._proxyPrimPath._propPart._poolHandle;
    v82 = poolHandle;
    if ((poolHandle & 7) != 0)
    {
      v32 = (unsigned int *)(poolHandle & 0xFFFFFFFFFFFFFFF8);
      do
        v33 = __ldxr(v32);
      while (__stxr(v33 + 2, v32));
      if ((v33 & 1) == 0)
        v82 &= 0xFFFFFFFFFFFFFFF8;
    }
    if (v14)
    {
      objc_msgSend_token(v14, v28, v29, v30);
      if (v17)
      {
LABEL_12:
        objc_msgSend_token(v17, v28, v29, v30);
        goto LABEL_61;
      }
    }
    else
    {
      v77 = 0;
      if (v17)
        goto LABEL_12;
    }
    v76 = 0;
LABEL_61:
    sub_2263FEDC4((pxrInternal__aapl__pxrReserved__::UsdPrim *)&type, v18, (pxrInternal__aapl__pxrReserved__ *)&v77, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v76);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v76 & 7) != 0)
    {
      v66 = (unsigned int *)(v76 & 0xFFFFFFFFFFFFFFF8);
      do
        v67 = __ldxr(v66);
      while (__stlxr(v67 - 2, v66));
    }
    if ((v77 & 7) != 0)
    {
      v68 = (unsigned int *)(v77 & 0xFFFFFFFFFFFFFFF8);
      do
        v69 = __ldxr(v68);
      while (__stlxr(v69 - 2, v68));
    }
    if ((v82 & 7) != 0)
    {
      v70 = (unsigned int *)(v82 & 0xFFFFFFFFFFFFFFF8);
      do
        v71 = __ldxr(v70);
      while (__stlxr(v71 - 2, v70));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v80);
    v65 = (uint64_t)v79;
    if (v79)
      goto LABEL_71;
    goto LABEL_72;
  }
  v34 = sub_2263FFBCC((pxrInternal__aapl__pxrReserved__::SdfSpec *)&v102);
  if (pxrInternal__aapl__pxrReserved__::SdfSpec::GetSpecType(v34) == 1)
  {
    v101 = 0u;
    v35 = sub_2263FFBCC((pxrInternal__aapl__pxrReserved__::SdfSpec *)&v102);
    pxrInternal__aapl__pxrReserved__::SdfPropertySpec::GetNameToken(v35);
    v36 = sub_2263FFBCC((pxrInternal__aapl__pxrReserved__::SdfSpec *)&v102);
    TypeName = pxrInternal__aapl__pxrReserved__::SdfPropertySpec::GetTypeName(v36);
    v37 = sub_2263FFBCC((pxrInternal__aapl__pxrReserved__::SdfSpec *)&v102);
    pxrInternal__aapl__pxrReserved__::SdfPropertySpec::GetVariability(v37);
    pxrInternal__aapl__pxrReserved__::UsdPrim::CreateAttribute();
    *(_QWORD *)&v100 = v95;
    *((_QWORD *)&v100 + 1) = v96;
    v96 = 0;
    LODWORD(v101) = v97;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::operator=();
    DWORD1(v101) = v98;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator=();
    *((_QWORD *)&v101 + 1) = v99;
    v99 = 0;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v97);
    if ((v94 & 7) != 0)
    {
      v38 = (unsigned int *)(v94 & 0xFFFFFFFFFFFFFFF8);
      do
        v39 = __ldxr(v38);
      while (__stlxr(v39 - 2, v38));
    }
    v40 = [USKProperty alloc];
    v88 = v100;
    v89 = *((_QWORD *)&v100 + 1);
    if (*((_QWORD *)&v100 + 1))
    {
      v41 = (unint64_t *)(*((_QWORD *)&v100 + 1) + 48);
      do
        v42 = __ldxr(v41);
      while (__stxr(v42 + 1, v41));
    }
    sub_2263BDDD8(&v90, &v101);
    sub_2263BDE28(&v91, (_DWORD *)&v101 + 1);
    v92 = *((_QWORD *)&v101 + 1);
    if ((BYTE8(v101) & 7) != 0)
    {
      v44 = (unsigned int *)(*((_QWORD *)&v101 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v45 = __ldxr(v44);
      while (__stxr(v45 + 2, v44));
      if ((v45 & 1) == 0)
        v92 &= 0xFFFFFFFFFFFFFFF8;
    }
    v46 = (void *)objc_msgSend_initWithUsdProperty_withNodeOwner_(v40, v43, (uint64_t)&v88, (uint64_t)self);
    if ((v92 & 7) != 0)
    {
      v47 = (unsigned int *)(v92 & 0xFFFFFFFFFFFFFFF8);
      do
        v48 = __ldxr(v47);
      while (__stlxr(v48 - 2, v47));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v90);
    if (v89)
      sub_2263DA640(v89);
    if ((BYTE8(v101) & 7) != 0)
    {
      v49 = (unsigned int *)(*((_QWORD *)&v101 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v50 = __ldxr(v49);
      while (__stlxr(v50 - 2, v49));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  }
  else
  {
    v51 = sub_2263FFBCC((pxrInternal__aapl__pxrReserved__::SdfSpec *)&v102);
    if (pxrInternal__aapl__pxrReserved__::SdfSpec::GetSpecType(v51) != 8)
      goto LABEL_2;
    v100 = 0u;
    v101 = 0u;
    v52 = sub_2263FFBCC((pxrInternal__aapl__pxrReserved__::SdfSpec *)&v102);
    pxrInternal__aapl__pxrReserved__::SdfPropertySpec::GetNameToken(v52);
    pxrInternal__aapl__pxrReserved__::UsdPrim::CreateRelationship((pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v94);
    LODWORD(v100) = v95;
    *((_QWORD *)&v100 + 1) = v96;
    v96 = 0;
    LODWORD(v101) = v97;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::operator=();
    DWORD1(v101) = v98;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator=();
    *((_QWORD *)&v101 + 1) = v99;
    v99 = 0;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v97);
    if (v96)
      sub_2263DA640(v96);
    if ((v94 & 7) != 0)
    {
      v53 = (unsigned int *)(v94 & 0xFFFFFFFFFFFFFFF8);
      do
        v54 = __ldxr(v53);
      while (__stlxr(v54 - 2, v53));
    }
    v55 = [USKProperty alloc];
    v83 = v100;
    v84 = *((_QWORD *)&v100 + 1);
    if (*((_QWORD *)&v100 + 1))
    {
      v56 = (unint64_t *)(*((_QWORD *)&v100 + 1) + 48);
      do
        v57 = __ldxr(v56);
      while (__stxr(v57 + 1, v56));
    }
    sub_2263BDDD8(&v85, &v101);
    sub_2263BDE28(&v86, (_DWORD *)&v101 + 1);
    v87 = *((_QWORD *)&v101 + 1);
    if ((BYTE8(v101) & 7) != 0)
    {
      v59 = (unsigned int *)(*((_QWORD *)&v101 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v60 = __ldxr(v59);
      while (__stxr(v60 + 2, v59));
      if ((v60 & 1) == 0)
        v87 &= 0xFFFFFFFFFFFFFFF8;
    }
    v46 = (void *)objc_msgSend_initWithUsdProperty_withNodeOwner_(v55, v58, (uint64_t)&v83, (uint64_t)self);
    if ((v87 & 7) != 0)
    {
      v61 = (unsigned int *)(v87 & 0xFFFFFFFFFFFFFFF8);
      do
        v62 = __ldxr(v61);
      while (__stlxr(v62 - 2, v61));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v85);
    if (v84)
      sub_2263DA640(v84);
    if ((BYTE8(v101) & 7) != 0)
    {
      v63 = (unsigned int *)(*((_QWORD *)&v101 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v64 = __ldxr(v63);
      while (__stlxr(v64 - 2, v63));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  }
  sub_2263BDE64((uint64_t)&v101);
  v65 = *((_QWORD *)&v100 + 1);
  if (*((_QWORD *)&v100 + 1))
LABEL_71:
    sub_2263DA640(v65);
LABEL_72:
  MEMORY[0x2276976C0](&v102);
  if ((v103[0] & 7) != 0)
  {
    v72 = (unsigned int *)(v103[0] & 0xFFFFFFFFFFFFFFF8);
    do
      v73 = __ldxr(v72);
    while (__stlxr(v73 - 2, v72));
  }

  return v46;
}

- (id)newCustomPropertyWithName:(id)a3 type:(id)a4 role:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  Usd_PrimData *px;
  unint64_t *v18;
  unint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t poolHandle;
  unsigned int *v24;
  unsigned int v25;
  void *v26;
  unsigned int *v27;
  unsigned int v28;
  unsigned int *v29;
  unsigned int v30;
  unsigned int *v31;
  unsigned int v32;
  uint64_t v34;
  uint64_t v35;
  int type;
  Usd_PrimData *v37;
  int v38;
  int v39;
  unint64_t v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_tokenWithDataType_(USKToken, v11, (uint64_t)v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenWithRoleType_(USKToken, v14, (uint64_t)v10, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_prim._type;
  px = self->_prim._prim._p.px;
  v37 = px;
  if (px)
  {
    v18 = (unint64_t *)((char *)px + 48);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  sub_2263BDDD8(&v38, &self->_prim._proxyPrimPath);
  sub_2263BDE28(&v39, (_DWORD *)&self->_prim._proxyPrimPath._primPart._poolHandle + 1);
  poolHandle = (unint64_t)self->_prim._proxyPrimPath._propPart._poolHandle;
  v40 = poolHandle;
  if ((poolHandle & 7) != 0)
  {
    v24 = (unsigned int *)(poolHandle & 0xFFFFFFFFFFFFFFF8);
    do
      v25 = __ldxr(v24);
    while (__stxr(v25 + 2, v24));
    if ((v25 & 1) == 0)
      v40 &= 0xFFFFFFFFFFFFFFF8;
  }
  if (v13)
  {
    objc_msgSend_token(v13, v20, v21, v22);
    if (v16)
    {
LABEL_11:
      objc_msgSend_token(v16, v20, v21, v22);
      goto LABEL_14;
    }
  }
  else
  {
    v35 = 0;
    if (v16)
      goto LABEL_11;
  }
  v34 = 0;
LABEL_14:
  sub_2263FEDC4((pxrInternal__aapl__pxrReserved__::UsdPrim *)&type, v8, (pxrInternal__aapl__pxrReserved__ *)&v35, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v34);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v34 & 7) != 0)
  {
    v27 = (unsigned int *)(v34 & 0xFFFFFFFFFFFFFFF8);
    do
      v28 = __ldxr(v27);
    while (__stlxr(v28 - 2, v27));
  }
  if ((v35 & 7) != 0)
  {
    v29 = (unsigned int *)(v35 & 0xFFFFFFFFFFFFFFF8);
    do
      v30 = __ldxr(v29);
    while (__stlxr(v30 - 2, v29));
  }
  if ((v40 & 7) != 0)
  {
    v31 = (unsigned int *)(v40 & 0xFFFFFFFFFFFFFFF8);
    do
      v32 = __ldxr(v31);
    while (__stlxr(v32 - 2, v31));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v38);
  if (v37)
    sub_2263DA640((uint64_t)v37);

  return v26;
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
  v6 = *(unsigned int **)sub_2263DE374(&self->_prim._type);
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
  sub_2263E6F40((uint64_t)&self->_prim, &v8);
  v6 = (void *)objc_msgSend_initWithSdfPath_(v3, v4, (uint64_t)&v8, v5);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v8);
  return v6;
}

- (id)childIterator
{
  USKNodeSiblingIterator *v3;
  const char *v4;
  uint64_t v5;

  v3 = [USKNodeSiblingIterator alloc];
  return (id)objc_msgSend_initWithPrim_(v3, v4, (uint64_t)&self->_prim, v5);
}

- (id)subtreeIterator
{
  USKNodeSubtreeIterator *v3;
  const char *v4;
  uint64_t v5;

  v3 = [USKNodeSubtreeIterator alloc];
  return (id)objc_msgSend_initWithPrim_(v3, v4, (uint64_t)&self->_prim, v5);
}

- (id)loadedChildIterator
{
  USKNodeSiblingIterator *v3;
  const char *v4;
  int64x2_t v6;
  char v7;

  v3 = [USKNodeSiblingIterator alloc];
  v7 = 0;
  v6 = vdupq_n_s64(2uLL);
  return (id)objc_msgSend_initWithPrim_withPredicate_(v3, v4, (uint64_t)&self->_prim, (uint64_t)&v6);
}

- (id)loadedSubtreeIterator
{
  USKNodeSubtreeIterator *v3;
  const char *v4;
  int64x2_t v6;
  char v7;

  v3 = [USKNodeSubtreeIterator alloc];
  v7 = 0;
  v6 = vdupq_n_s64(2uLL);
  return (id)objc_msgSend_initWithPrim_withPredicate_(v3, v4, (uint64_t)&self->_prim, (uint64_t)&v6);
}

- (id)propertyList
{
  USKPropertyIterator *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _BYTE v9[24];
  void **v10;
  _BYTE v11[24];
  _BYTE *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = [USKPropertyIterator alloc];
  v12 = 0;
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetAuthoredProperties();
  v5 = (void *)objc_msgSend_initWithProperties_(v2, v3, (uint64_t)v9, v4);
  v10 = (void **)v9;
  sub_2264035B4(&v10);
  v6 = v12;
  if (v12 == v11)
  {
    v7 = 4;
    v6 = v11;
    goto LABEL_5;
  }
  if (v12)
  {
    v7 = 5;
LABEL_5:
    (*(void (**)(void))(*v6 + 8 * v7))();
  }
  return v5;
}

- (NSString)type
{
  const char *v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int v10;
  void *v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int *v17;
  uint64_t v18;
  unsigned int *v19;
  uint64_t v20;

  v19 = 0;
  MEMORY[0x2276976D8](&v18, "typeName");
  v20 = 0;
  sub_22640369C((uint64_t)&self->_prim, (const pxrInternal__aapl__pxrReserved__::Usd_PrimData *)&v18);
  if ((v20 & 7) != 0)
  {
    v5 = (unsigned int *)(v20 & 0xFFFFFFFFFFFFFFF8);
    do
      v6 = __ldxr(v5);
    while (__stlxr(v6 - 2, v5));
  }
  if ((v18 & 7) != 0)
  {
    v7 = (unsigned int *)(v18 & 0xFFFFFFFFFFFFFFF8);
    do
      v8 = __ldxr(v7);
    while (__stlxr(v8 - 2, v7));
  }
  v17 = v19;
  if ((v19 & 7) != 0)
  {
    v9 = (unsigned int *)((unint64_t)v19 & 0xFFFFFFFFFFFFFFF8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 2, v9));
    if ((v10 & 1) == 0)
      v17 = v9;
  }
  objc_msgSend_nodeTypeWithTfToken_(USKToken, v3, (uint64_t)&v17, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v17 & 7) != 0)
  {
    v12 = (unsigned int *)((unint64_t)v17 & 0xFFFFFFFFFFFFFFF8);
    do
      v13 = __ldxr(v12);
    while (__stlxr(v13 - 2, v12));
  }
  if ((v19 & 7) != 0)
  {
    v14 = (unsigned int *)((unint64_t)v19 & 0xFFFFFFFFFFFFFFF8);
    do
      v15 = __ldxr(v14);
    while (__stlxr(v15 - 2, v14));
  }
  return (NSString *)v11;
}

- (USKToken)typeName
{
  unsigned int *v3;
  unsigned int v4;
  unsigned int *v5;
  unsigned int v6;
  USKToken *v7;
  const char *v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  void *v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int *v18;
  uint64_t v19;
  unsigned int *v20;
  uint64_t v21;

  v20 = 0;
  MEMORY[0x2276976D8](&v19, "typeName");
  v21 = 0;
  sub_22640369C((uint64_t)&self->_prim, (const pxrInternal__aapl__pxrReserved__::Usd_PrimData *)&v19);
  if ((v21 & 7) != 0)
  {
    v3 = (unsigned int *)(v21 & 0xFFFFFFFFFFFFFFF8);
    do
      v4 = __ldxr(v3);
    while (__stlxr(v4 - 2, v3));
  }
  if ((v19 & 7) != 0)
  {
    v5 = (unsigned int *)(v19 & 0xFFFFFFFFFFFFFFF8);
    do
      v6 = __ldxr(v5);
    while (__stlxr(v6 - 2, v5));
  }
  v7 = [USKToken alloc];
  v18 = v20;
  if ((v20 & 7) != 0)
  {
    v10 = (unsigned int *)((unint64_t)v20 & 0xFFFFFFFFFFFFFFF8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 2, v10));
    if ((v11 & 1) == 0)
      v18 = v10;
  }
  v12 = (void *)objc_msgSend_initWithTfToken_(v7, v8, (uint64_t)&v18, v9);
  if ((v18 & 7) != 0)
  {
    v13 = (unsigned int *)((unint64_t)v18 & 0xFFFFFFFFFFFFFFF8);
    do
      v14 = __ldxr(v13);
    while (__stlxr(v14 - 2, v13));
  }
  if ((v20 & 7) != 0)
  {
    v15 = (unsigned int *)((unint64_t)v20 & 0xFFFFFFFFFFFFFFF8);
    do
      v16 = __ldxr(v15);
    while (__stlxr(v16 - 2, v15));
  }
  return (USKToken *)v12;
}

- (NSArray)schemaTypes
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t *i;
  uint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  __CFString *v13;
  const char *v14;
  uint64_t v15;
  __CFString *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int *v19;
  unsigned int v20;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  void **v25;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetAppliedSchemas((pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
  v6 = v23;
  for (i = v24; v6 != i; ++v6)
  {
    v8 = *v6;
    if ((*v6 & 7) != 0)
    {
      v9 = (unsigned int *)(v8 & 0xFFFFFFFFFFFFFFF8);
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 2, v9));
      if ((v10 & 1) == 0)
        v8 &= 0xFFFFFFFFFFFFFFF8;
    }
    v22 = v8;
    if ((v8 & 7) != 0)
    {
      v11 = (unsigned int *)(v8 & 0xFFFFFFFFFFFFFFF8);
      do
        v12 = __ldxr(v11);
      while (__stxr(v12 + 2, v11));
      if ((v12 & 1) == 0)
        v22 &= 0xFFFFFFFFFFFFFFF8;
    }
    objc_msgSend_schemaTypeWithTfToken_(USKToken, v4, (uint64_t)&v22, v5);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v16 = v13;
    if ((v22 & 7) != 0)
    {
      v17 = (unsigned int *)(v22 & 0xFFFFFFFFFFFFFFF8);
      do
        v18 = __ldxr(v17);
      while (__stlxr(v18 - 2, v17));
    }
    if (v13 != CFSTR("Unknown"))
      objc_msgSend_addObject_(v3, v14, (uint64_t)v13, v15);

    if ((v8 & 7) != 0)
    {
      v19 = (unsigned int *)(v8 & 0xFFFFFFFFFFFFFFF8);
      do
        v20 = __ldxr(v19);
      while (__stlxr(v20 - 2, v19));
    }
  }
  v25 = (void **)&v23;
  sub_2263E41A0(&v25);
  return (NSArray *)v3;
}

- (id)parent
{
  USKNode *v2;
  unint64_t *v3;
  unint64_t v4;
  const char *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  void *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int *v12;
  unsigned int v13;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;

  v20 = 0u;
  v21 = 0u;
  sub_226400968((uint64_t)&self->_prim, (uint64_t)&v20);
  if (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v20))
  {
    v2 = [USKNode alloc];
    v15 = v20;
    v16 = *((_QWORD *)&v20 + 1);
    if (*((_QWORD *)&v20 + 1))
    {
      v3 = (unint64_t *)(*((_QWORD *)&v20 + 1) + 48);
      do
        v4 = __ldxr(v3);
      while (__stxr(v4 + 1, v3));
    }
    sub_2263BDDD8(&v17, &v21);
    sub_2263BDE28(&v18, (_DWORD *)&v21 + 1);
    v19 = *((_QWORD *)&v21 + 1);
    if ((BYTE8(v21) & 7) != 0)
    {
      v7 = (unsigned int *)(*((_QWORD *)&v21 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 2, v7));
      if ((v8 & 1) == 0)
        v19 &= 0xFFFFFFFFFFFFFFF8;
    }
    v9 = (void *)objc_msgSend_initWithUsdPrim_(v2, v5, (uint64_t)&v15, v6);
    if ((v19 & 7) != 0)
    {
      v10 = (unsigned int *)(v19 & 0xFFFFFFFFFFFFFFF8);
      do
        v11 = __ldxr(v10);
      while (__stlxr(v11 - 2, v10));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v17);
    if (v16)
      sub_2263DA640(v16);
  }
  else
  {
    v9 = 0;
  }
  if ((BYTE8(v21) & 7) != 0)
  {
    v12 = (unsigned int *)(*((_QWORD *)&v21 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v13 = __ldxr(v12);
    while (__stlxr(v13 - 2, v12));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v21);
  if (*((_QWORD *)&v20 + 1))
    sub_2263DA640(*((uint64_t *)&v20 + 1));
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  USKNode *v4;
  USKNode *v5;
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

  v4 = (USKNode *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_usdPrim(v5, v6, v7, v8);
    v9 = self->_prim._type == v13
      && self->_prim._prim._p.px == v14
      && self->_prim._proxyPrimPath._primPart._poolHandle == v15
      && ((unint64_t)self->_prim._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8) == (v16 & 0xFFFFFFFFFFFFFFF8);
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
  sub_2263F38AC((uint64_t)v3, (unsigned int *)&self->_prim, &self->_prim._prim._p.px, (unsigned int *)&self->_prim._proxyPrimPath, &self->_prim._proxyPrimPath._propPart._poolHandle);
  return bswap64(0x9E3779B97F4A7C55 * v3[0]);
}

- (void).cxx_destruct
{
  UsdPrim *p_prim;
  Handle poolHandle;
  unsigned int *v5;
  unsigned int v6;
  uint64_t px;

  objc_storeStrong((id *)&self->_prim._propName._rep._ptrAndBits, 0);
  p_prim = &self->_prim;
  poolHandle = p_prim->_proxyPrimPath._propPart._poolHandle;
  if ((poolHandle & 7) != 0)
  {
    v5 = (unsigned int *)((unint64_t)poolHandle & 0xFFFFFFFFFFFFFFF8);
    do
      v6 = __ldxr(v5);
    while (__stlxr(v6 - 2, v5));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&p_prim->_proxyPrimPath);
  px = (uint64_t)p_prim->_prim._p.px;
  if (px)
    sub_2263DA640(px);
}

- (id).cxx_construct
{
  UsdPrim *p_prim;

  p_prim = &self->_prim;
  self->_prim._type = 1;
  self->_prim._prim._p.px = 0;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
  p_prim->_proxyPrimPath._propPart._poolHandle = 0;
  return self;
}

@end
