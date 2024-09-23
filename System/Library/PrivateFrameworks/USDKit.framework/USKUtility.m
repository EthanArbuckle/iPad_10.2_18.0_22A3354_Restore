@implementation USKUtility

+ (__n128)localTransformWithNode:(void *)a3 time:
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned int *v8;
  unsigned int v9;
  __int128 v11;
  _OWORD v12[4];
  _BYTE v13[128];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void **v17;

  v3 = a3;
  v7 = v3;
  if (v3)
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    objc_msgSend_usdPrim(v3, v4, v5, v6);
    pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v14, (const UsdPrim *)v13);
    v14 = MEMORY[0x24BEE9D78] + 16;
    if ((v13[24] & 7) != 0)
    {
      v8 = (unsigned int *)(*(_QWORD *)&v13[24] & 0xFFFFFFFFFFFFFFF8);
      do
        v9 = __ldxr(v8);
      while (__stlxr(v9 - 2, v8));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v13[16]);
    if (*(_QWORD *)&v13[8])
      sub_2263DA640(*(uint64_t *)&v13[8]);
    memset(v13, 0, sizeof(v13));
    pxrInternal__aapl__pxrReserved__::GfMatrix4d::SetDiagonal((pxrInternal__aapl__pxrReserved__::GfMatrix4d *)v13, 1.0);
    if (v15 && (*(_BYTE *)(v15 + 57) & 8) == 0 && (*(unsigned int (**)(uint64_t *))(v14 + 32))(&v14))
    {
      MEMORY[0x227697420](v12, &v14);
      pxrInternal__aapl__pxrReserved__::UsdGeomXformable::XformQuery::GetLocalTransformation();
      v17 = (void **)v12;
      sub_2263E41FC(&v17);
    }
    memset(v12, 0, sizeof(v12));
    MEMORY[0x227697204](v12, v13);
    v11 = v12[0];
    MEMORY[0x227697438](&v14);
  }
  else
  {
    v11 = *MEMORY[0x24BDAEE00];
  }

  return (__n128)v11;
}

+ (void)setLocalTransformWithNode:(uint64_t)a1 transform:(uint64_t)a2 time:(void *)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned int *v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  _BYTE v12[128];
  uint64_t v13;
  uint64_t v14[3];
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  v7 = v3;
  if (v3)
  {
    v16 = 0;
    v17 = 0;
    v18 = 0;
    objc_msgSend_usdPrim(v3, v4, v5, v6);
    pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v16, (const UsdPrim *)v12);
    v16 = MEMORY[0x24BEE9D78] + 16;
    if ((v12[24] & 7) != 0)
    {
      v8 = (unsigned int *)(*(_QWORD *)&v12[24] & 0xFFFFFFFFFFFFFFF8);
      do
        v9 = __ldxr(v8);
      while (__stlxr(v9 - 2, v8));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v12[16]);
    if (*(_QWORD *)&v12[8])
      sub_2263DA640(*(uint64_t *)&v12[8]);
    if (v17 && (*(_BYTE *)(v17 + 57) & 8) == 0 && (*(unsigned int (**)(uint64_t *))(v16 + 32))(&v16))
    {
      v15 = 0;
      pxrInternal__aapl__pxrReserved__::UsdGeomXformable::GetOrderedXformOps((pxrInternal__aapl__pxrReserved__::UsdGeomXformable *)&v16, &v15);
      v13 = 0;
      memset(v12, 0, sizeof(v12));
      v10 = v14[0];
      if (v14[1] == v14[0])
      {
        pxrInternal__aapl__pxrReserved__::UsdGeomXformable::AddTransformOp();
      }
      else
      {
        sub_2263E3BD0((uint64_t)v12, v14[0]);
        v11 = *(_DWORD *)(v10 + 128);
        BYTE4(v13) = *(_BYTE *)(v10 + 132);
        LODWORD(v13) = v11;
      }
      sub_2263DBD78((pxrInternal__aapl__pxrReserved__::UsdGeomXformOp *)v12);
      sub_2263E3ED0((uint64_t)v12);
      *(_QWORD *)v12 = v14;
      sub_2263E41FC((void ***)v12);
    }
    MEMORY[0x227697438](&v16);
  }

}

+ (__n128)worldTransformWithNode:(uint64_t)a3 time:(void *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned int *v10;
  unsigned int v11;
  __int128 v13;
  __int128 v14;
  _OWORD v15[8];
  _QWORD v16[3];
  UsdPrim v17;
  double v18;

  v5 = a4;
  v9 = v5;
  v18 = a1;
  memset(&v17, 0, 32);
  if (v5)
    objc_msgSend_usdPrim(v5, v6, v7, v8);
  memset(v16, 0, sizeof(v16));
  pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)v16, &v17);
  v16[0] = MEMORY[0x24BEE9D70] + 16;
  if ((sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v17) & 1) != 0)
  {
    memset(v15, 0, sizeof(v15));
    pxrInternal__aapl__pxrReserved__::UsdGeomImageable::ComputeLocalToWorldTransform();
    MEMORY[0x227697204](&v14, v15);
    v13 = v14;
  }
  else
  {
    v13 = *MEMORY[0x24BDAEE00];
  }
  MEMORY[0x227697414](v16);
  if (((uint64_t)v17._proxyPrimPath._propPart._poolHandle & 7) != 0)
  {
    v10 = (unsigned int *)((unint64_t)v17._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
    do
      v11 = __ldxr(v10);
    while (__stlxr(v11 - 2, v10));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v17._proxyPrimPath);
  if (v17._prim._p.px)
    sub_2263DA640((uint64_t)v17._prim._p.px);

  return (__n128)v13;
}

+ (id)transformKeyTimesWithNode:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned int *v8;
  unsigned int v9;
  _QWORD *v10;
  unint64_t v11;
  uint64_t v12;
  USKData *v13;
  const char *v14;
  void *v15;
  unsigned int *v16;
  unsigned int v17;
  uint64_t v19;
  UsdPrim v20;
  void *__p;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v7 = v3;
  if (v3)
  {
    v24 = 0;
    v25 = 0;
    v26 = 0;
    objc_msgSend_usdPrim(v3, v4, v5, v6);
    pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v24, &v20);
    v24 = MEMORY[0x24BEE9D78] + 16;
    if (((uint64_t)v20._proxyPrimPath._propPart._poolHandle & 7) != 0)
    {
      v8 = (unsigned int *)((unint64_t)v20._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
      do
        v9 = __ldxr(v8);
      while (__stlxr(v9 - 2, v8));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v20._proxyPrimPath);
    if (v20._prim._p.px)
      sub_2263DA640((uint64_t)v20._prim._p.px);
    if (v25 && (*(_BYTE *)(v25 + 57) & 8) == 0 && (*(unsigned int (**)(uint64_t *))(v24 + 32))(&v24))
    {
      __p = 0;
      v22 = 0;
      v23 = 0;
      pxrInternal__aapl__pxrReserved__::UsdGeomXformable::GetTimeSamples();
      memset(&v20, 0, sizeof(v20));
      v27 = 0;
      v28 = &v27;
      sub_2263CB018((unint64_t *)&v20, (v22 - (_BYTE *)__p) >> 3, &v28);
      v10 = __p;
      if (v22 != __p)
      {
        v11 = 0;
        do
        {
          v12 = v10[v11];
          sub_2263CB26C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v20);
          *((_QWORD *)v20._propName._rep._ptrAndBits + v11++) = v12;
          v10 = __p;
        }
        while (v11 < (v22 - (_BYTE *)__p) >> 3);
      }
      v13 = [USKData alloc];
      v29[1] = (uint64_t)&off_24EDD83C8;
      sub_2263CA8B4(v29, (uint64_t)&v20);
      MEMORY[0x2276976D8](&v19, "double[]");
      v15 = (void *)objc_msgSend_initWithVtValue_typeName_(v13, v14, (uint64_t)v29, (uint64_t)&v19);
      if ((v19 & 7) != 0)
      {
        v16 = (unsigned int *)(v19 & 0xFFFFFFFFFFFFFFF8);
        do
          v17 = __ldxr(v16);
        while (__stlxr(v17 - 2, v16));
      }
      sub_2263AD568((uint64_t)v29);
      sub_2263AC71C((uint64_t)&v20);
      if (__p)
      {
        v22 = __p;
        operator delete(__p);
      }
    }
    else
    {
      v15 = 0;
    }
    MEMORY[0x227697438](&v24);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (BOOL)isSceneGraphNode:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const pxrInternal__aapl__pxrReserved__::Usd_PrimData *v8;
  _QWORD *v9;
  pxrInternal__aapl__pxrReserved__::UsdGeomImageable *v10;
  unint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  char IsA;
  unsigned int *v15;
  unsigned int v16;
  uint64_t v18;
  pxrInternal__aapl__pxrReserved__ *v19[2];
  __int128 v20;

  v3 = a3;
  v7 = v3;
  if (v3)
  {
    *(_OWORD *)v19 = 0u;
    v20 = 0u;
    objc_msgSend_usdPrim(v3, v4, v5, v6);
    pxrInternal__aapl__pxrReserved__::Usd_ThrowExpiredPrimAccessError(0, v8);
    v9 = (_QWORD *)MEMORY[0x18];
    v10 = (pxrInternal__aapl__pxrReserved__::UsdGeomImageable *)MEMORY[0x2276976D8](&v18, "");
    v11 = *v9 & 0xFFFFFFFFFFFFFFF8;
    v12 = (unsigned int *)(v18 & 0xFFFFFFFFFFFFFFF8);
    if ((v18 & 7) != 0)
    {
      do
        v13 = __ldxr(v12);
      while (__stlxr(v13 - 2, v12));
    }
    if ((unsigned int *)v11 == v12)
    {
      IsA = 1;
    }
    else
    {
      pxrInternal__aapl__pxrReserved__::UsdGeomImageable::_GetStaticTfType(v10);
      pxrInternal__aapl__pxrReserved__::UsdSchemaRegistry::FindSchemaInfo();
      IsA = pxrInternal__aapl__pxrReserved__::UsdPrim::_IsA();
    }
    if ((BYTE8(v20) & 7) != 0)
    {
      v15 = (unsigned int *)(*((_QWORD *)&v20 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v16 = __ldxr(v15);
      while (__stlxr(v16 - 2, v15));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v20);
    if (v19[1])
      sub_2263DA640((uint64_t)v19[1]);
  }
  else
  {
    IsA = 0;
  }

  return IsA;
}

+ (BOOL)isTransformNode:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  pxrInternal__aapl__pxrReserved__::UsdGeomXformable *v8;
  char IsA;
  unsigned int *v10;
  unsigned int v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  v7 = v3;
  if (v3)
  {
    v8 = (pxrInternal__aapl__pxrReserved__::UsdGeomXformable *)objc_msgSend_usdPrim(v3, v4, v5, v6);
    pxrInternal__aapl__pxrReserved__::UsdGeomXformable::_GetStaticTfType(v8);
    pxrInternal__aapl__pxrReserved__::UsdSchemaRegistry::FindSchemaInfo();
    IsA = pxrInternal__aapl__pxrReserved__::UsdPrim::_IsA();
    if ((v15 & 7) != 0)
    {
      v10 = (unsigned int *)(v15 & 0xFFFFFFFFFFFFFFF8);
      do
        v11 = __ldxr(v10);
      while (__stlxr(v11 - 2, v10));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v14);
    if (v13)
      sub_2263DA640(v13);
  }
  else
  {
    IsA = 0;
  }

  return IsA;
}

+ (BOOL)isShaderOutputProperty:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int *v15;
  unsigned int v16;
  char IsOutput;
  unsigned int *v18;
  unsigned int v19;
  unsigned int *v20;
  unsigned int v21;
  BOOL v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v3 = a3;
  v7 = v3;
  if (v3)
  {
    objc_msgSend_usdProperty(v3, v4, v5, v6);
    v8 = v26;
    v9 = *((_QWORD *)&v27 + 1);
  }
  else
  {
    v9 = 0;
    v8 = 0;
    v26 = 0u;
    v27 = 0u;
  }
  if ((v9 & 7) != 0)
  {
    v10 = (unsigned int *)(v9 & 0xFFFFFFFFFFFFFFF8);
    do
      v11 = __ldxr(v10);
    while (__stlxr(v11 - 2, v10));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v27);
  if (*((_QWORD *)&v26 + 1))
    sub_2263DA640(*((uint64_t *)&v26 + 1));
  if (v8 != 3)
    goto LABEL_30;
  v26 = 0u;
  v27 = 0u;
  if (v7)
  {
    objc_msgSend_usdProperty(v7, v12, v13, v14);
  }
  else
  {
    v24 = 0uLL;
    v25 = 0uLL;
  }
  sub_2263DC6FC((uint64_t)&v24, (uint64_t)&v26);
  if ((BYTE8(v25) & 7) != 0)
  {
    v15 = (unsigned int *)(*((_QWORD *)&v25 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v16 = __ldxr(v15);
    while (__stlxr(v16 - 2, v15));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v25);
  if (*((_QWORD *)&v24 + 1))
    sub_2263DA640(*((uint64_t *)&v24 + 1));
  v24 = 0u;
  v25 = 0u;
  MEMORY[0x227697384](&v24, &v26);
  IsOutput = pxrInternal__aapl__pxrReserved__::UsdShadeOutput::IsOutput();
  if ((BYTE8(v25) & 7) != 0)
  {
    v18 = (unsigned int *)(*((_QWORD *)&v25 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v19 = __ldxr(v18);
    while (__stlxr(v19 - 2, v18));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v25);
  if (*((_QWORD *)&v24 + 1))
    sub_2263DA640(*((uint64_t *)&v24 + 1));
  if ((BYTE8(v27) & 7) != 0)
  {
    v20 = (unsigned int *)(*((_QWORD *)&v27 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v21 = __ldxr(v20);
    while (__stlxr(v21 - 2, v20));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v27);
  if (*((_QWORD *)&v26 + 1))
    sub_2263DA640(*((uint64_t *)&v26 + 1));
  if ((IsOutput & 1) != 0)
    v22 = 1;
  else
LABEL_30:
    v22 = 0;

  return v22;
}

+ (id)shaderNodeType:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned int *v8;
  unsigned int v9;
  __CFString *v10;
  unint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  unint64_t v14;
  unsigned int *v15;
  unsigned int v16;
  unint64_t v17;
  unsigned int *v18;
  unsigned int v19;
  unint64_t v20;
  unsigned int *v21;
  unsigned int v22;
  unint64_t v23;
  unsigned int *v24;
  unsigned int v25;
  unint64_t v26;
  unsigned int *v27;
  unsigned int v28;
  unint64_t v29;
  unsigned int *v30;
  unsigned int v31;
  char v32;
  __CFString **v33;
  unsigned int *v34;
  unsigned int v35;
  unsigned int *v36;
  unsigned int v37;
  uint64_t v39;
  uint64_t v40;
  UsdPrim v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v3 = a3;
  v7 = v3;
  v42 = 0;
  v43 = 0;
  v44 = 0;
  if (v3)
    objc_msgSend_usdPrim(v3, v4, v5, v6);
  else
    memset(&v41, 0, 32);
  pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v42, &v41);
  v42 = MEMORY[0x24BEE9D38] + 16;
  if (((uint64_t)v41._proxyPrimPath._propPart._poolHandle & 7) != 0)
  {
    v8 = (unsigned int *)((unint64_t)v41._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
    do
      v9 = __ldxr(v8);
    while (__stlxr(v9 - 2, v8));
  }
  v10 = (__CFString *)&v41;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v41._proxyPrimPath);
  if (v41._prim._p.px)
    sub_2263DA640((uint64_t)v41._prim._p.px);
  if (!v43 || (*(_BYTE *)(v43 + 57) & 8) != 0 || !(*(unsigned int (**)(uint64_t *))(v42 + 32))(&v42))
    goto LABEL_49;
  v40 = 0;
  memset(&v41, 0, 32);
  pxrInternal__aapl__pxrReserved__::UsdShadeShader::GetIdAttr((pxrInternal__aapl__pxrReserved__::UsdShadeShader *)&v42);
  if (!pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::TfToken>())
    goto LABEL_34;
  MEMORY[0x2276976D8](&v39, "UsdPreviewSurface");
  v11 = v40 & 0xFFFFFFFFFFFFFFF8;
  v12 = (unsigned int *)(v39 & 0xFFFFFFFFFFFFFFF8);
  if ((v39 & 7) != 0)
  {
    do
      v13 = __ldxr(v12);
    while (__stlxr(v13 - 2, v12));
  }
  if ((unsigned int *)v11 == v12)
  {
    v33 = &USKShaderNodeTypePreviewSurface;
  }
  else
  {
    MEMORY[0x2276976D8](&v39, "UsdUVTexture");
    v14 = v40 & 0xFFFFFFFFFFFFFFF8;
    v15 = (unsigned int *)(v39 & 0xFFFFFFFFFFFFFFF8);
    if ((v39 & 7) != 0)
    {
      do
        v16 = __ldxr(v15);
      while (__stlxr(v16 - 2, v15));
    }
    if ((unsigned int *)v14 == v15)
    {
      v33 = &USKShaderNodeTypeTextureReader;
    }
    else
    {
      MEMORY[0x2276976D8](&v39, "UsdTransform2d");
      v17 = v40 & 0xFFFFFFFFFFFFFFF8;
      v18 = (unsigned int *)(v39 & 0xFFFFFFFFFFFFFFF8);
      if ((v39 & 7) != 0)
      {
        do
          v19 = __ldxr(v18);
        while (__stlxr(v19 - 2, v18));
      }
      if ((unsigned int *)v17 == v18)
      {
        v33 = &USKShaderNodeTypeUVTransformReader;
      }
      else
      {
        MEMORY[0x2276976D8](&v39, "UsdPrimvarReader_float");
        v20 = v40 & 0xFFFFFFFFFFFFFFF8;
        v21 = (unsigned int *)(v39 & 0xFFFFFFFFFFFFFFF8);
        if ((v39 & 7) != 0)
        {
          do
            v22 = __ldxr(v21);
          while (__stlxr(v22 - 2, v21));
        }
        if ((unsigned int *)v20 != v21)
        {
          MEMORY[0x2276976D8](&v39, "UsdPrimvarReader_float2");
          v23 = v40 & 0xFFFFFFFFFFFFFFF8;
          v24 = (unsigned int *)(v39 & 0xFFFFFFFFFFFFFFF8);
          if ((v39 & 7) != 0)
          {
            do
              v25 = __ldxr(v24);
            while (__stlxr(v25 - 2, v24));
          }
          if ((unsigned int *)v23 != v24)
          {
            MEMORY[0x2276976D8](&v39, "UsdPrimvarReader_float3");
            v26 = v40 & 0xFFFFFFFFFFFFFFF8;
            v27 = (unsigned int *)(v39 & 0xFFFFFFFFFFFFFFF8);
            if ((v39 & 7) != 0)
            {
              do
                v28 = __ldxr(v27);
              while (__stlxr(v28 - 2, v27));
            }
            if ((unsigned int *)v26 != v27)
            {
              MEMORY[0x2276976D8](&v39, "UsdPrimvarReader_float4");
              v29 = v40 & 0xFFFFFFFFFFFFFFF8;
              v30 = (unsigned int *)(v39 & 0xFFFFFFFFFFFFFFF8);
              if ((v39 & 7) != 0)
              {
                do
                  v31 = __ldxr(v30);
                while (__stlxr(v31 - 2, v30));
              }
              if ((unsigned int *)v29 != v30)
              {
LABEL_34:
                v32 = 1;
                goto LABEL_40;
              }
            }
          }
        }
        v33 = &USKShaderNodeTypeMeshAttributeReader;
      }
    }
  }
  v10 = *v33;
  v32 = 0;
LABEL_40:
  if (((uint64_t)v41._proxyPrimPath._propPart._poolHandle & 7) != 0)
  {
    v34 = (unsigned int *)((unint64_t)v41._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
    do
      v35 = __ldxr(v34);
    while (__stlxr(v35 - 2, v34));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v41._proxyPrimPath);
  if (v41._prim._p.px)
    sub_2263DA640((uint64_t)v41._prim._p.px);
  if ((v40 & 7) != 0)
  {
    v36 = (unsigned int *)(v40 & 0xFFFFFFFFFFFFFFF8);
    do
      v37 = __ldxr(v36);
    while (__stlxr(v37 - 2, v36));
  }
  if ((v32 & 1) != 0)
LABEL_49:
    v10 = CFSTR("Unknown");
  MEMORY[0x22769739C](&v42);

  return v10;
}

+ (id)constantMaterialPropertiesWithMaterial:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned int *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  Usd_PrimData *v13;
  unint64_t *v14;
  unint64_t v15;
  Ptr *v16;
  unsigned int *v17;
  unsigned int v18;
  USKProperty *v19;
  unint64_t *v20;
  unint64_t v21;
  const char *v22;
  uint64_t v23;
  unsigned int *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t *v31;
  unsigned int *v32;
  unsigned int v33;
  unint64_t *v34;
  unint64_t v35;
  unsigned int *v36;
  unsigned int v37;
  unsigned int *v38;
  unsigned int v39;
  unsigned int *v40;
  unsigned int v41;
  pxrInternal__aapl__pxrReserved__::TfToken *BaseName;
  uint64_t EmptyString;
  void *v44;
  const char *v45;
  unsigned int *v46;
  unsigned int v47;
  __int128 v48;
  void *v49;
  unsigned int *v50;
  unsigned int v51;
  pxrInternal__aapl__pxrReserved__::TfToken *v52;
  uint64_t v53;
  size_t v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const void *v58;
  void *v59;
  const char *v60;
  unsigned int *v61;
  unsigned int v62;
  unsigned int *v63;
  unsigned int v64;
  unsigned int *v65;
  unsigned int v66;
  uint64_t *v68;
  uint64_t *v69;
  id v70;
  void *v71;
  uint64_t v72;
  void *__p[2];
  uint64_t v74;
  uint64_t v75;
  void *v76;
  Usd_PrimData *v77;
  uint64_t v78;
  Ptr *v79;
  UsdPrim v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  uint64_t v85;
  int v86;
  int v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  uint64_t v92;
  UsdPrim v93;
  uint64_t v94;
  uint64_t v95;

  v3 = a3;
  v7 = (void *)objc_opt_new();
  v93._propName._rep._ptrAndBits = 0;
  v94 = 0;
  v95 = 0;
  if (v3)
    objc_msgSend_usdPrim(v3, v4, v5, v6);
  else
    memset(&v93, 0, 32);
  sub_2263DD254(&v93, (pxrInternal__aapl__pxrReserved__::UsdShadeShader *)&v93._propName);
  if (((uint64_t)v93._proxyPrimPath._propPart._poolHandle & 7) != 0)
  {
    v8 = (unsigned int *)((unint64_t)v93._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
    do
      v9 = __ldxr(v8);
    while (__stlxr(v9 - 2, v8));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v93._proxyPrimPath);
  if (v93._prim._p.px)
    sub_2263DA640((uint64_t)v93._prim._p.px);
  if (v94
    && (*(_BYTE *)(v94 + 57) & 8) == 0
    && (*((unsigned int (**)(TfToken *))v93._propName._rep._ptrAndBits + 4))(&v93._propName))
  {
    v71 = v7;
    pxrInternal__aapl__pxrReserved__::UsdShadeShader::GetInputs((pxrInternal__aapl__pxrReserved__::UsdShadeShader *)&v93._propName);
    v11 = v91;
    v10 = v92;
    if (v91 != v92)
    {
      v12 = (uint64_t *)&v89 + 1;
      v72 = MEMORY[0x24BEE9D38] + 16;
      while (1)
      {
        memset(&v93, 0, 32);
        v93._type = *(_DWORD *)v11;
        v13 = *(Usd_PrimData **)(v11 + 8);
        v93._prim._p.px = v13;
        if (v13)
        {
          v14 = (unint64_t *)((char *)v13 + 48);
          do
            v15 = __ldxr(v14);
          while (__stxr(v15 + 1, v14));
        }
        sub_2263BDDD8(&v93._proxyPrimPath, (_DWORD *)(v11 + 16));
        sub_2263BDE28((_DWORD *)&v93._proxyPrimPath._primPart._poolHandle + 1, (_DWORD *)(v11 + 20));
        v16 = *(Ptr **)(v11 + 24);
        v93._proxyPrimPath._propPart._poolHandle = v16;
        if ((v16 & 7) != 0)
        {
          v17 = (unsigned int *)((unint64_t)v16 & 0xFFFFFFFFFFFFFFF8);
          do
            v18 = __ldxr(v17);
          while (__stxr(v18 + 2, v17));
          if ((v18 & 1) == 0)
            v93._proxyPrimPath._propPart._poolHandle = (Handle)((unint64_t)v93._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
        }
        v89 = 0u;
        v90 = 0u;
        sub_2263DCC2C((uint64_t)&v93, (uint64_t)&v89);
        if (!sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v89))
          goto LABEL_107;
        if ((pxrInternal__aapl__pxrReserved__::UsdShadeOutput::IsOutput() & 1) != 0
          || !pxrInternal__aapl__pxrReserved__::UsdAttribute::HasValue((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v89))
        {
          v81 = 0;
          v82 = 0;
          v83 = 0;
          sub_2263E3F28((uint64_t)&v80, v12, &v90);
          pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v81, &v80);
          v81 = v72;
          if (((uint64_t)v80._proxyPrimPath._propPart._poolHandle & 7) != 0)
          {
            v32 = (unsigned int *)((unint64_t)v80._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
            do
              v33 = __ldxr(v32);
            while (__stlxr(v33 - 2, v32));
          }
          pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
          sub_2263BDE64((uint64_t)&v80._proxyPrimPath);
          if (v80._prim._p.px)
            sub_2263DA640((uint64_t)v80._prim._p.px);
          if (v82 && (*(_BYTE *)(v82 + 57) & 8) == 0 && (*(unsigned int (**)(uint64_t *))(v81 + 32))(&v81))
          {
            memset(&v80, 0, 32);
            MEMORY[0x2276976D8](&v75, "fallback");
            pxrInternal__aapl__pxrReserved__::UsdShadeShader::GetInput((pxrInternal__aapl__pxrReserved__::UsdShadeShader *)&v81, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v75);
            v80._type = (int)v76;
            v80._prim._p.px = v77;
            if (v77)
            {
              v34 = (unint64_t *)((char *)v77 + 48);
              do
                v35 = __ldxr(v34);
              while (__stxr(v35 + 1, v34));
            }
            sub_2263BDDD8(&v80._proxyPrimPath, &v78);
            sub_2263BDE28((_DWORD *)&v80._proxyPrimPath._primPart._poolHandle + 1, (_DWORD *)&v78 + 1);
            v80._proxyPrimPath._propPart._poolHandle = v79;
            if ((v79 & 7) != 0)
            {
              v36 = (unsigned int *)((unint64_t)v79 & 0xFFFFFFFFFFFFFFF8);
              do
                v37 = __ldxr(v36);
              while (__stxr(v37 + 2, v36));
              if ((v37 & 1) == 0)
                v80._proxyPrimPath._propPart._poolHandle = (Handle)((unint64_t)v80._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
            }
            if ((v79 & 7) != 0)
            {
              v38 = (unsigned int *)((unint64_t)v79 & 0xFFFFFFFFFFFFFFF8);
              do
                v39 = __ldxr(v38);
              while (__stlxr(v39 - 2, v38));
            }
            pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
            sub_2263BDE64((uint64_t)&v78);
            if (v77)
              sub_2263DA640((uint64_t)v77);
            if ((v75 & 7) != 0)
            {
              v40 = (unsigned int *)(v75 & 0xFFFFFFFFFFFFFFF8);
              do
                v41 = __ldxr(v40);
              while (__stlxr(v41 - 2, v40));
            }
            if (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v80))
            {
              BaseName = (pxrInternal__aapl__pxrReserved__::TfToken *)pxrInternal__aapl__pxrReserved__::UsdProperty::GetBaseName((pxrInternal__aapl__pxrReserved__::UsdProperty *)&v89);
              if (((unint64_t)v76 & 0xFFFFFFFFFFFFFFF8) != 0)
                EmptyString = ((unint64_t)v76 & 0xFFFFFFFFFFFFFFF8) + 16;
              else
                EmptyString = pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString(BaseName);
              if (*(char *)(EmptyString + 23) < 0)
              {
                sub_2263AE36C(__p, *(void **)EmptyString, *(_QWORD *)(EmptyString + 8));
              }
              else
              {
                v48 = *(_OWORD *)EmptyString;
                v74 = *(_QWORD *)(EmptyString + 16);
                *(_OWORD *)__p = v48;
              }
              sub_2263DD878((uint64_t)&v80, (unsigned __int8 **)__p);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              if (SHIBYTE(v74) < 0)
                operator delete(__p[0]);
              if ((v76 & 7) != 0)
              {
                v50 = (unsigned int *)((unint64_t)v76 & 0xFFFFFFFFFFFFFFF8);
                do
                  v51 = __ldxr(v50);
                while (__stlxr(v51 - 2, v50));
              }
              if (v49)
              {
                v68 = v12;
                v70 = v3;
                v76 = 0;
                v77 = 0;
                v78 = 0;
                v52 = (pxrInternal__aapl__pxrReserved__::TfToken *)sub_2263DE374(&v93);
                if ((*(_QWORD *)v52 & 0xFFFFFFFFFFFFFFF8) != 0)
                  v53 = (*(_QWORD *)v52 & 0xFFFFFFFFFFFFFFF8) + 16;
                else
                  v53 = pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString(v52);
                if (*(char *)(v53 + 23) >= 0)
                  v54 = *(unsigned __int8 *)(v53 + 23);
                else
                  v54 = *(_QWORD *)(v53 + 8);
                v77 = 0;
                v78 = 0;
                v76 = 0;
                sub_2263E43E4((uint64_t)&v76, v54 + 9);
                if (v78 >= 0)
                  v57 = &v76;
                else
                  v57 = v76;
                if (v54)
                {
                  if (*(char *)(v53 + 23) >= 0)
                    v58 = (const void *)v53;
                  else
                    v58 = *(const void **)v53;
                  memmove(v57, v58, v54);
                }
                strcpy((char *)v57 + v54, ":fallback");
                if (v78 >= 0)
                  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v55, (uint64_t)&v76, v56, v68);
                else
                  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v55, (uint64_t)v76, v56, v68);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v3 = v70;
                objc_msgSend_setObject_forKey_(v71, v60, (uint64_t)v49, (uint64_t)v59);

                if (SHIBYTE(v78) < 0)
                  operator delete(v76);
                v12 = v69;
              }

            }
            if (((uint64_t)v80._proxyPrimPath._propPart._poolHandle & 7) != 0)
            {
              v61 = (unsigned int *)((unint64_t)v80._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
              do
                v62 = __ldxr(v61);
              while (__stlxr(v62 - 2, v61));
            }
            pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
            sub_2263BDE64((uint64_t)&v80._proxyPrimPath);
            if (v80._prim._p.px)
              sub_2263DA640((uint64_t)v80._prim._p.px);
          }
          MEMORY[0x22769739C](&v81);
          goto LABEL_107;
        }
        v19 = [USKProperty alloc];
        v84 = v89;
        v85 = *((_QWORD *)&v89 + 1);
        if (*((_QWORD *)&v89 + 1))
        {
          v20 = (unint64_t *)(*((_QWORD *)&v89 + 1) + 48);
          do
            v21 = __ldxr(v20);
          while (__stxr(v21 + 1, v20));
        }
        sub_2263BDDD8(&v86, &v90);
        sub_2263BDE28(&v87, (_DWORD *)&v90 + 1);
        v88 = *((_QWORD *)&v90 + 1);
        if ((BYTE8(v90) & 7) != 0)
        {
          v24 = (unsigned int *)(*((_QWORD *)&v90 + 1) & 0xFFFFFFFFFFFFFFF8);
          do
            v25 = __ldxr(v24);
          while (__stxr(v25 + 2, v24));
          if ((v25 & 1) == 0)
            v88 &= 0xFFFFFFFFFFFFFFF8;
        }
        v26 = (void *)objc_msgSend_initWithUsdProperty_(v19, v22, (uint64_t)&v84, v23);
        v27 = (void *)MEMORY[0x24BDD17C8];
        v30 = *(_QWORD *)sub_2263DE374(&v93) & 0xFFFFFFFFFFFFFFF8;
        if (!v30)
          break;
        v31 = (uint64_t *)(v30 + 16);
        if ((*(char *)(v30 + 39) & 0x80000000) == 0)
          goto LABEL_64;
        objc_msgSend_stringWithUTF8String_(v27, v28, *v31, v29);
LABEL_65:
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v71, v45, (uint64_t)v26, (uint64_t)v44);

        if ((v88 & 7) != 0)
        {
          v46 = (unsigned int *)(v88 & 0xFFFFFFFFFFFFFFF8);
          do
            v47 = __ldxr(v46);
          while (__stlxr(v47 - 2, v46));
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2263BDE64((uint64_t)&v86);
        if (v85)
          sub_2263DA640(v85);
LABEL_107:
        if ((BYTE8(v90) & 7) != 0)
        {
          v63 = (unsigned int *)(*((_QWORD *)&v90 + 1) & 0xFFFFFFFFFFFFFFF8);
          do
            v64 = __ldxr(v63);
          while (__stlxr(v64 - 2, v63));
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2263BDE64((uint64_t)&v90);
        if (*((_QWORD *)&v89 + 1))
          sub_2263DA640(*((uint64_t *)&v89 + 1));
        if (((uint64_t)v93._proxyPrimPath._propPart._poolHandle & 7) != 0)
        {
          v65 = (unsigned int *)((unint64_t)v93._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
          do
            v66 = __ldxr(v65);
          while (__stlxr(v66 - 2, v65));
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2263BDE64((uint64_t)&v93._proxyPrimPath);
        if (v93._prim._p.px)
          sub_2263DA640((uint64_t)v93._prim._p.px);
        v11 += 32;
        if (v11 == v10)
          goto LABEL_118;
      }
      v31 = (uint64_t *)"";
LABEL_64:
      objc_msgSend_stringWithUTF8String_(v27, v28, (uint64_t)v31, v29);
      goto LABEL_65;
    }
LABEL_118:
    *(_QWORD *)&v93._type = &v91;
    sub_2263E42FC((void ***)&v93);
    v7 = v71;
  }
  MEMORY[0x22769739C](&v93._propName);

  return v7;
}

+ (id)bufferMaterialPropertiesWithMaterial:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned int *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  char *v13;
  Usd_PrimData *v14;
  unint64_t *v15;
  unint64_t v16;
  Ptr *v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int *v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int *v25;
  _BOOL4 v26;
  unsigned int v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int *v30;
  unsigned int v31;
  unsigned int *v32;
  unsigned int v33;
  char *v34;
  USKProperty *v35;
  unint64_t *v36;
  unint64_t v37;
  const char *v38;
  uint64_t v39;
  unsigned int *v40;
  unsigned int v41;
  uint64_t *v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t *v48;
  void *v49;
  const char *v50;
  unsigned int *v51;
  unsigned int v52;
  unsigned int *v53;
  unsigned int v54;
  unsigned int *v55;
  unsigned int v56;
  unsigned int *v57;
  unsigned int v58;
  id v60;
  void *v61;
  int v62;
  uint64_t v63;
  int v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  UsdPrim v79;
  uint64_t v80;
  uint64_t v81;

  v3 = a3;
  v7 = (void *)objc_opt_new();
  v79._propName._rep._ptrAndBits = 0;
  v80 = 0;
  v81 = 0;
  if (v3)
    objc_msgSend_usdPrim(v3, v4, v5, v6);
  else
    memset(&v79, 0, 32);
  sub_2263DD254(&v79, (pxrInternal__aapl__pxrReserved__::UsdShadeShader *)&v79._propName);
  if (((uint64_t)v79._proxyPrimPath._propPart._poolHandle & 7) != 0)
  {
    v8 = (unsigned int *)((unint64_t)v79._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
    do
      v9 = __ldxr(v8);
    while (__stlxr(v9 - 2, v8));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v79._proxyPrimPath);
  if (v79._prim._p.px)
    sub_2263DA640((uint64_t)v79._prim._p.px);
  if (v80
    && (*(_BYTE *)(v80 + 57) & 8) == 0
    && (*((unsigned int (**)(TfToken *))v79._propName._rep._ptrAndBits + 4))(&v79._propName))
  {
    v60 = v3;
    v61 = v7;
    pxrInternal__aapl__pxrReserved__::UsdShadeShader::GetInputs((pxrInternal__aapl__pxrReserved__::UsdShadeShader *)&v79._propName);
    v11 = v77;
    v10 = v78;
    if (v77 != v78)
    {
      v12 = (uint64_t *)&v75 + 1;
      v13 = (char *)&v72 + 4;
      while (1)
      {
        memset(&v79, 0, 32);
        v79._type = *(_DWORD *)v11;
        v14 = *(Usd_PrimData **)(v11 + 8);
        v79._prim._p.px = v14;
        if (v14)
        {
          v15 = (unint64_t *)((char *)v14 + 48);
          do
            v16 = __ldxr(v15);
          while (__stxr(v16 + 1, v15));
        }
        sub_2263BDDD8(&v79._proxyPrimPath, (_DWORD *)(v11 + 16));
        sub_2263BDE28((_DWORD *)&v79._proxyPrimPath._primPart._poolHandle + 1, (_DWORD *)(v11 + 20));
        v17 = *(Ptr **)(v11 + 24);
        v79._proxyPrimPath._propPart._poolHandle = v17;
        if ((v17 & 7) != 0)
        {
          v18 = (unsigned int *)((unint64_t)v17 & 0xFFFFFFFFFFFFFFF8);
          do
            v19 = __ldxr(v18);
          while (__stxr(v19 + 2, v18));
          if ((v19 & 1) == 0)
            v79._proxyPrimPath._propPart._poolHandle = (Handle)((unint64_t)v79._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
        }
        v75 = 0u;
        v76 = 0u;
        sub_2263DCC2C((uint64_t)&v79, (uint64_t)&v75);
        if (!sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v75))
          goto LABEL_70;
        v74 = 0;
        sub_2263E3F28((uint64_t)&v70, v12, &v76);
        sub_2263DD718((pxrInternal__aapl__pxrReserved__::UsdObject *)&v70, &v74);
        if ((v73 & 7) != 0)
        {
          v20 = (unsigned int *)(v73 & 0xFFFFFFFFFFFFFFF8);
          do
            v21 = __ldxr(v20);
          while (__stlxr(v21 - 2, v20));
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2263BDE64((uint64_t)&v72);
        if (v71)
          sub_2263DA640(v71);
        MEMORY[0x2276976D8](&v70, "UsdPrimvarReader_float");
        v22 = v70;
        if ((v74 & 0xFFFFFFFFFFFFFFF8) == (v70 & 0xFFFFFFFFFFFFFFF8))
        {
          v26 = 1;
        }
        else
        {
          MEMORY[0x2276976D8](&v69, "UsdPrimvarReader_float2");
          v23 = v69;
          if ((v74 & 0xFFFFFFFFFFFFFFF8) == (v69 & 0xFFFFFFFFFFFFFFF8))
          {
            v26 = 1;
          }
          else
          {
            MEMORY[0x2276976D8](&v68, "UsdPrimvarReader_float3");
            v24 = v68;
            if ((v74 & 0xFFFFFFFFFFFFFFF8) == (v68 & 0xFFFFFFFFFFFFFFF8))
            {
              v26 = 1;
            }
            else
            {
              MEMORY[0x2276976D8](&v67, "UsdPrimvarReader_float4");
              v25 = (unsigned int *)(v67 & 0xFFFFFFFFFFFFFFF8);
              v26 = (v74 & 0xFFFFFFFFFFFFFFF8) == (v67 & 0xFFFFFFFFFFFFFFF8);
              if ((v67 & 7) != 0)
              {
                do
                  v27 = __ldxr(v25);
                while (__stlxr(v27 - 2, v25));
              }
              v24 = v68;
            }
            if ((v24 & 7) != 0)
            {
              v28 = (unsigned int *)(v24 & 0xFFFFFFFFFFFFFFF8);
              do
                v29 = __ldxr(v28);
              while (__stlxr(v29 - 2, v28));
            }
            v23 = v69;
          }
          if ((v23 & 7) != 0)
          {
            v30 = (unsigned int *)(v23 & 0xFFFFFFFFFFFFFFF8);
            do
              v31 = __ldxr(v30);
            while (__stlxr(v31 - 2, v30));
          }
          v22 = v70;
        }
        if ((v22 & 7) != 0)
        {
          v32 = (unsigned int *)(v22 & 0xFFFFFFFFFFFFFFF8);
          do
            v33 = __ldxr(v32);
          while (__stlxr(v33 - 2, v32));
        }
        if (v26)
          break;
LABEL_67:
        if ((v74 & 7) != 0)
        {
          v53 = (unsigned int *)(v74 & 0xFFFFFFFFFFFFFFF8);
          do
            v54 = __ldxr(v53);
          while (__stlxr(v54 - 2, v53));
        }
LABEL_70:
        if ((BYTE8(v76) & 7) != 0)
        {
          v55 = (unsigned int *)(*((_QWORD *)&v76 + 1) & 0xFFFFFFFFFFFFFFF8);
          do
            v56 = __ldxr(v55);
          while (__stlxr(v56 - 2, v55));
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2263BDE64((uint64_t)&v76);
        if (*((_QWORD *)&v75 + 1))
          sub_2263DA640(*((uint64_t *)&v75 + 1));
        if (((uint64_t)v79._proxyPrimPath._propPart._poolHandle & 7) != 0)
        {
          v57 = (unsigned int *)((unint64_t)v79._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
          do
            v58 = __ldxr(v57);
          while (__stlxr(v58 - 2, v57));
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2263BDE64((uint64_t)&v79._proxyPrimPath);
        if (v79._prim._p.px)
          sub_2263DA640((uint64_t)v79._prim._p.px);
        v11 += 32;
        if (v11 == v10)
          goto LABEL_81;
      }
      v34 = v13;
      v35 = [USKProperty alloc];
      v62 = v75;
      v63 = *((_QWORD *)&v75 + 1);
      if (*((_QWORD *)&v75 + 1))
      {
        v36 = (unint64_t *)(*((_QWORD *)&v75 + 1) + 48);
        do
          v37 = __ldxr(v36);
        while (__stxr(v37 + 1, v36));
      }
      sub_2263BDDD8(&v64, &v76);
      sub_2263BDE28(&v65, (_DWORD *)&v76 + 1);
      v66 = *((_QWORD *)&v76 + 1);
      if ((BYTE8(v76) & 7) != 0)
      {
        v40 = (unsigned int *)(*((_QWORD *)&v76 + 1) & 0xFFFFFFFFFFFFFFF8);
        do
          v41 = __ldxr(v40);
        while (__stxr(v41 + 2, v40));
        if ((v41 & 1) == 0)
          v66 &= 0xFFFFFFFFFFFFFFF8;
      }
      v42 = v12;
      v43 = (void *)objc_msgSend_initWithUsdProperty_(v35, v38, (uint64_t)&v62, v39);
      v44 = (void *)MEMORY[0x24BDD17C8];
      v47 = *(_QWORD *)sub_2263DE374(&v79) & 0xFFFFFFFFFFFFFFF8;
      if (v47)
      {
        v48 = (uint64_t *)(v47 + 16);
        if (*(char *)(v47 + 39) < 0)
        {
          objc_msgSend_stringWithUTF8String_(v44, v45, *v48, v46);
LABEL_62:
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKey_(v61, v50, (uint64_t)v43, (uint64_t)v49);

          if ((v66 & 7) != 0)
          {
            v51 = (unsigned int *)(v66 & 0xFFFFFFFFFFFFFFF8);
            do
              v52 = __ldxr(v51);
            while (__stlxr(v52 - 2, v51));
          }
          pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
          v12 = v42;
          v13 = v34;
          sub_2263BDE64((uint64_t)&v64);
          if (v63)
            sub_2263DA640(v63);
          goto LABEL_67;
        }
      }
      else
      {
        v48 = (uint64_t *)"";
      }
      objc_msgSend_stringWithUTF8String_(v44, v45, (uint64_t)v48, v46);
      goto LABEL_62;
    }
LABEL_81:
    *(_QWORD *)&v79._type = &v77;
    sub_2263E42FC((void ***)&v79);
    v3 = v60;
    v7 = v61;
  }
  MEMORY[0x22769739C](&v79._propName);

  return v7;
}

+ (id)textureMaterialPropertiesWithMaterial:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned int *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  Usd_PrimData *v12;
  unint64_t *v13;
  unint64_t v14;
  Ptr *v15;
  unsigned int *v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int *v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int *v24;
  unsigned int v25;
  USKProperty *v26;
  unint64_t *v27;
  unint64_t v28;
  const char *v29;
  uint64_t v30;
  unsigned int *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t *v38;
  void *v39;
  const char *v40;
  unsigned int *v41;
  unsigned int v42;
  unsigned int *v43;
  unsigned int v44;
  unsigned int *v45;
  unsigned int v46;
  int v48;
  uint64_t v49;
  int v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE v54[8];
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  UsdPrim v63;
  uint64_t v64;
  uint64_t v65;

  v3 = a3;
  v7 = (void *)objc_opt_new();
  v63._propName._rep._ptrAndBits = 0;
  v64 = 0;
  v65 = 0;
  if (v3)
    objc_msgSend_usdPrim(v3, v4, v5, v6);
  else
    memset(&v63, 0, 32);
  sub_2263DD254(&v63, (pxrInternal__aapl__pxrReserved__::UsdShadeShader *)&v63._propName);
  if (((uint64_t)v63._proxyPrimPath._propPart._poolHandle & 7) != 0)
  {
    v8 = (unsigned int *)((unint64_t)v63._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
    do
      v9 = __ldxr(v8);
    while (__stlxr(v9 - 2, v8));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v63._proxyPrimPath);
  if (v63._prim._p.px)
    sub_2263DA640((uint64_t)v63._prim._p.px);
  if (v64
    && (*(_BYTE *)(v64 + 57) & 8) == 0
    && (*((unsigned int (**)(TfToken *))v63._propName._rep._ptrAndBits + 4))(&v63._propName))
  {
    pxrInternal__aapl__pxrReserved__::UsdShadeShader::GetInputs((pxrInternal__aapl__pxrReserved__::UsdShadeShader *)&v63._propName);
    v10 = v61;
    v11 = v62;
    if (v61 != v62)
    {
      while (1)
      {
        memset(&v63, 0, 32);
        v63._type = *(_DWORD *)v10;
        v12 = *(Usd_PrimData **)(v10 + 8);
        v63._prim._p.px = v12;
        if (v12)
        {
          v13 = (unint64_t *)((char *)v12 + 48);
          do
            v14 = __ldxr(v13);
          while (__stxr(v14 + 1, v13));
        }
        sub_2263BDDD8(&v63._proxyPrimPath, (_DWORD *)(v10 + 16));
        sub_2263BDE28((_DWORD *)&v63._proxyPrimPath._primPart._poolHandle + 1, (_DWORD *)(v10 + 20));
        v15 = *(Ptr **)(v10 + 24);
        v63._proxyPrimPath._propPart._poolHandle = v15;
        if ((v15 & 7) != 0)
        {
          v16 = (unsigned int *)((unint64_t)v15 & 0xFFFFFFFFFFFFFFF8);
          do
            v17 = __ldxr(v16);
          while (__stxr(v17 + 2, v16));
          if ((v17 & 1) == 0)
            v63._proxyPrimPath._propPart._poolHandle = (Handle)((unint64_t)v63._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
        }
        v59 = 0u;
        v60 = 0u;
        sub_2263DCC2C((uint64_t)&v63, (uint64_t)&v59);
        if (!sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v59))
          goto LABEL_53;
        sub_2263E3F28((uint64_t)v54, (uint64_t *)&v59 + 1, &v60);
        sub_2263DD718((pxrInternal__aapl__pxrReserved__::UsdObject *)v54, &v58);
        MEMORY[0x2276976D8](&v53, "UsdUVTexture");
        v18 = v58;
        v19 = (unsigned int *)(v53 & 0xFFFFFFFFFFFFFFF8);
        if ((v53 & 7) != 0)
        {
          do
            v20 = __ldxr(v19);
          while (__stlxr(v20 - 2, v19));
          v21 = v58;
        }
        else
        {
          v21 = v58;
        }
        if ((v21 & 7) != 0)
        {
          v22 = (unsigned int *)(v21 & 0xFFFFFFFFFFFFFFF8);
          do
            v23 = __ldxr(v22);
          while (__stlxr(v23 - 2, v22));
        }
        if ((v57 & 7) != 0)
        {
          v24 = (unsigned int *)(v57 & 0xFFFFFFFFFFFFFFF8);
          do
            v25 = __ldxr(v24);
          while (__stlxr(v25 - 2, v24));
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2263BDE64((uint64_t)&v56);
        if (v55)
          sub_2263DA640(v55);
        if ((unsigned int *)(v18 & 0xFFFFFFFFFFFFFFF8) != v19)
          goto LABEL_53;
        v26 = [USKProperty alloc];
        v48 = v59;
        v49 = *((_QWORD *)&v59 + 1);
        if (*((_QWORD *)&v59 + 1))
        {
          v27 = (unint64_t *)(*((_QWORD *)&v59 + 1) + 48);
          do
            v28 = __ldxr(v27);
          while (__stxr(v28 + 1, v27));
        }
        sub_2263BDDD8(&v50, &v60);
        sub_2263BDE28(&v51, (_DWORD *)&v60 + 1);
        v52 = *((_QWORD *)&v60 + 1);
        if ((BYTE8(v60) & 7) != 0)
        {
          v31 = (unsigned int *)(*((_QWORD *)&v60 + 1) & 0xFFFFFFFFFFFFFFF8);
          do
            v32 = __ldxr(v31);
          while (__stxr(v32 + 2, v31));
          if ((v32 & 1) == 0)
            v52 &= 0xFFFFFFFFFFFFFFF8;
        }
        v33 = (void *)objc_msgSend_initWithUsdProperty_(v26, v29, (uint64_t)&v48, v30);
        v34 = (void *)MEMORY[0x24BDD17C8];
        v37 = *(_QWORD *)sub_2263DE374(&v63) & 0xFFFFFFFFFFFFFFF8;
        if (!v37)
          break;
        v38 = (uint64_t *)(v37 + 16);
        if ((*(char *)(v37 + 39) & 0x80000000) == 0)
          goto LABEL_47;
        objc_msgSend_stringWithUTF8String_(v34, v35, *v38, v36);
LABEL_48:
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v7, v40, (uint64_t)v33, (uint64_t)v39);

        if ((v52 & 7) != 0)
        {
          v41 = (unsigned int *)(v52 & 0xFFFFFFFFFFFFFFF8);
          do
            v42 = __ldxr(v41);
          while (__stlxr(v42 - 2, v41));
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2263BDE64((uint64_t)&v50);
        if (v49)
          sub_2263DA640(v49);
LABEL_53:
        if ((BYTE8(v60) & 7) != 0)
        {
          v43 = (unsigned int *)(*((_QWORD *)&v60 + 1) & 0xFFFFFFFFFFFFFFF8);
          do
            v44 = __ldxr(v43);
          while (__stlxr(v44 - 2, v43));
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2263BDE64((uint64_t)&v60);
        if (*((_QWORD *)&v59 + 1))
          sub_2263DA640(*((uint64_t *)&v59 + 1));
        if (((uint64_t)v63._proxyPrimPath._propPart._poolHandle & 7) != 0)
        {
          v45 = (unsigned int *)((unint64_t)v63._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
          do
            v46 = __ldxr(v45);
          while (__stlxr(v46 - 2, v45));
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2263BDE64((uint64_t)&v63._proxyPrimPath);
        if (v63._prim._p.px)
          sub_2263DA640((uint64_t)v63._prim._p.px);
        v10 += 32;
        if (v10 == v11)
          goto LABEL_64;
      }
      v38 = (uint64_t *)"";
LABEL_47:
      objc_msgSend_stringWithUTF8String_(v34, v35, (uint64_t)v38, v36);
      goto LABEL_48;
    }
LABEL_64:
    *(_QWORD *)&v63._type = &v61;
    sub_2263E42FC((void ***)&v63);
  }
  MEMORY[0x22769739C](&v63._propName);

  return v7;
}

+ (id)firstUVMeshAttributeNameInMaterial:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned int *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  Usd_PrimData *v13;
  unint64_t *v14;
  unint64_t v15;
  Ptr *v16;
  unsigned int *v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int *v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int *v23;
  unsigned int v24;
  unint64_t *v25;
  unint64_t v26;
  unsigned int *v27;
  unsigned int v28;
  unsigned int *v29;
  unsigned int v30;
  unsigned int *v31;
  unsigned int v32;
  uint64_t v33;
  unsigned int *v34;
  unsigned int v35;
  uint64_t v36;
  unsigned int *v37;
  unsigned int v38;
  unsigned int *v39;
  unsigned int v40;
  uint64_t v41;
  unsigned int *v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t *v46;
  unint64_t v47;
  uint64_t v48;
  unsigned int *v49;
  unsigned int v50;
  unsigned int *v51;
  unsigned int v52;
  unsigned int *v53;
  unsigned int v54;
  void *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  char v59;
  pxrInternal__aapl__pxrReserved__::VtValue *Typeid;
  const std::type_info *v61;
  std::type_info *v62;
  uint64_t v63;
  unsigned int *v64;
  unsigned int v65;
  char v66;
  unsigned int *v67;
  unsigned int v68;
  char v69;
  unsigned int *v70;
  unsigned int v71;
  unsigned int *v72;
  unsigned int v73;
  unsigned int *v74;
  unsigned int v75;
  char v76;
  unsigned int *v77;
  unsigned int v78;
  char v79;
  unsigned int *v80;
  unsigned int v81;
  char v82;
  unsigned int *v83;
  unsigned int v84;
  char v85;
  unsigned int *v86;
  unsigned int v87;
  unsigned int *v88;
  unsigned int v89;
  void **v90;
  uint64_t v92;
  uint64_t v93;
  void *__p[2];
  __int128 v95;
  _OWORD v96[2];
  _OWORD v97[2];
  uint64_t v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD v103[4];
  _QWORD v104[4];
  __int128 v105;
  __int128 v106;
  UsdPrim v107;
  uint64_t v108;
  uint64_t v109;
  UsdPrim v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v7 = v3;
  v110._propName._rep._ptrAndBits = 0;
  v111 = 0;
  v112 = 0;
  if (v3)
    objc_msgSend_usdPrim(v3, v4, v5, v6);
  else
    memset(&v110, 0, 32);
  sub_2263DD254(&v110, (pxrInternal__aapl__pxrReserved__::UsdShadeShader *)&v110._propName);
  if (((uint64_t)v110._proxyPrimPath._propPart._poolHandle & 7) != 0)
  {
    v8 = (unsigned int *)((unint64_t)v110._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
    do
      v9 = __ldxr(v8);
    while (__stlxr(v9 - 2, v8));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v110._proxyPrimPath);
  if (v110._prim._p.px)
    sub_2263DA640((uint64_t)v110._prim._p.px);
  if (v111
    && (*(_BYTE *)(v111 + 57) & 8) == 0
    && (*((unsigned int (**)(TfToken *))v110._propName._rep._ptrAndBits + 4))(&v110._propName))
  {
    pxrInternal__aapl__pxrReserved__::UsdShadeShader::GetInputs((pxrInternal__aapl__pxrReserved__::UsdShadeShader *)&v110._propName);
    v10 = v108;
    v11 = v109;
    if (v108 != v109)
    {
      v12 = 0;
      v92 = MEMORY[0x24BEE9D38] + 16;
      while (1)
      {
        memset(&v110, 0, 32);
        v110._type = *(_DWORD *)v10;
        v13 = *(Usd_PrimData **)(v10 + 8);
        v110._prim._p.px = v13;
        if (v13)
        {
          v14 = (unint64_t *)((char *)v13 + 48);
          do
            v15 = __ldxr(v14);
          while (__stxr(v15 + 1, v14));
        }
        sub_2263BDDD8(&v110._proxyPrimPath, (_DWORD *)(v10 + 16));
        sub_2263BDE28((_DWORD *)&v110._proxyPrimPath._primPart._poolHandle + 1, (_DWORD *)(v10 + 20));
        v16 = *(Ptr **)(v10 + 24);
        v110._proxyPrimPath._propPart._poolHandle = v16;
        if ((v16 & 7) != 0)
        {
          v17 = (unsigned int *)((unint64_t)v16 & 0xFFFFFFFFFFFFFFF8);
          do
            v18 = __ldxr(v17);
          while (__stxr(v18 + 2, v17));
          if ((v18 & 1) == 0)
            v110._proxyPrimPath._propPart._poolHandle = (Handle)((unint64_t)v110._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
        }
        memset(&v107, 0, 32);
        sub_2263DCC2C((uint64_t)&v110, (uint64_t)&v107);
        if (!sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v107)
          || v107._type == v110._type
          && *(_OWORD *)&v107._prim._p.px == *(_OWORD *)&v110._prim._p.px
          && ((unint64_t)v107._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8) == ((unint64_t)v110._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8))
        {
LABEL_163:
          v85 = 1;
          goto LABEL_165;
        }
        v105 = 0u;
        v106 = 0u;
        sub_2263E3F28((uint64_t)&v105, (uint64_t *)&v107._prim, &v107._proxyPrimPath);
        sub_2263DD718((pxrInternal__aapl__pxrReserved__::UsdObject *)&v105, v104);
        MEMORY[0x2276976D8](v103, "UsdUVTexture");
        v19 = v104[0];
        v20 = (unsigned int *)(v103[0] & 0xFFFFFFFFFFFFFFF8);
        if ((v103[0] & 7) != 0)
        {
          do
            v21 = __ldxr(v20);
          while (__stlxr(v21 - 2, v20));
          v22 = v104[0];
        }
        else
        {
          v22 = v104[0];
        }
        if ((v22 & 7) != 0)
        {
          v23 = (unsigned int *)(v22 & 0xFFFFFFFFFFFFFFF8);
          do
            v24 = __ldxr(v23);
          while (__stlxr(v24 - 2, v23));
        }
        if ((unsigned int *)(v19 & 0xFFFFFFFFFFFFFFF8) != v20)
        {
LABEL_156:
          v82 = 1;
          goto LABEL_157;
        }
        memset(v104, 0, sizeof(v104));
        pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v101, (const UsdPrim *)&v105);
        *(_QWORD *)&v101 = v92;
        MEMORY[0x2276976D8](&v99, "st");
        pxrInternal__aapl__pxrReserved__::UsdShadeShader::GetInput((pxrInternal__aapl__pxrReserved__::UsdShadeShader *)&v101, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v99);
        LODWORD(v104[0]) = v103[0];
        v104[1] = v103[1];
        if (v103[1])
        {
          v25 = (unint64_t *)(v103[1] + 48);
          do
            v26 = __ldxr(v25);
          while (__stxr(v26 + 1, v25));
        }
        sub_2263BDDD8(&v104[2], &v103[2]);
        sub_2263BDE28((_DWORD *)&v104[2] + 1, (_DWORD *)&v103[2] + 1);
        v104[3] = v103[3];
        if ((v103[3] & 7) != 0)
        {
          v27 = (unsigned int *)(v103[3] & 0xFFFFFFFFFFFFFFF8);
          do
            v28 = __ldxr(v27);
          while (__stxr(v28 + 2, v27));
          if ((v28 & 1) == 0)
            v104[3] &= 0xFFFFFFFFFFFFFFF8;
        }
        if ((v103[3] & 7) != 0)
        {
          v29 = (unsigned int *)(v103[3] & 0xFFFFFFFFFFFFFFF8);
          do
            v30 = __ldxr(v29);
          while (__stlxr(v30 - 2, v29));
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2263BDE64((uint64_t)&v103[2]);
        if (v103[1])
          sub_2263DA640(v103[1]);
        if ((v99 & 7) != 0)
        {
          v31 = (unsigned int *)(v99 & 0xFFFFFFFFFFFFFFF8);
          do
            v32 = __ldxr(v31);
          while (__stlxr(v32 - 2, v31));
        }
        MEMORY[0x22769739C](&v101);
        if (!sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)v104))
        {
LABEL_148:
          v79 = 1;
          goto LABEL_150;
        }
        memset(v103, 0, sizeof(v103));
        sub_2263DCC2C((uint64_t)v104, (uint64_t)v103);
        if (!sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)v103)
          || LODWORD(v103[0]) == LODWORD(v104[0])
          && *(_OWORD *)&v103[1] == *(_OWORD *)&v104[1]
          && (v103[3] & 0xFFFFFFFFFFFFFFF8) == (v104[3] & 0xFFFFFFFFFFFFFFF8))
        {
LABEL_140:
          v76 = 1;
          goto LABEL_142;
        }
        v101 = 0u;
        v102 = 0u;
        LODWORD(v101) = 1;
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
        *((_QWORD *)&v102 + 1) = 0;
        v100 = 0u;
        v99 = 0u;
        sub_2263E3F28((uint64_t)&v99, &v103[1], &v103[2]);
        v98 = 0;
        sub_2263DD718((pxrInternal__aapl__pxrReserved__::UsdObject *)&v99, &v98);
        MEMORY[0x2276976D8](v97, "UsdPrimvarReader_float2");
        v33 = v98;
        v34 = (unsigned int *)(*(_QWORD *)&v97[0] & 0xFFFFFFFFFFFFFFF8);
        if ((v97[0] & 7) != 0)
        {
          do
            v35 = __ldxr(v34);
          while (__stlxr(v35 - 2, v34));
        }
        if ((unsigned int *)(v33 & 0xFFFFFFFFFFFFFFF8) == v34)
        {
          LODWORD(v101) = v99;
          v45 = *((_QWORD *)&v99 + 1);
          if (*((_QWORD *)&v99 + 1))
          {
            v46 = (unint64_t *)(*((_QWORD *)&v99 + 1) + 48);
            do
              v47 = __ldxr(v46);
            while (__stxr(v47 + 1, v46));
          }
          v48 = *((_QWORD *)&v101 + 1);
          *((_QWORD *)&v101 + 1) = v45;
          if (v48)
            sub_2263DA640(v48);
          sub_2263C0080((uint64_t)&v102, &v100);
          sub_2263C00D4((uint64_t)&v102 + 4, (_DWORD *)&v100 + 1);
          sub_2263BE4E4((_QWORD *)&v102 + 1, (_QWORD *)&v100 + 1);
        }
        else
        {
          MEMORY[0x2276976D8](v97, "UsdTransform2d");
          v36 = v98;
          v37 = (unsigned int *)(*(_QWORD *)&v97[0] & 0xFFFFFFFFFFFFFFF8);
          if ((v97[0] & 7) != 0)
          {
            do
              v38 = __ldxr(v37);
            while (__stlxr(v38 - 2, v37));
          }
          if ((unsigned int *)(v36 & 0xFFFFFFFFFFFFFFF8) == v37)
          {
            memset(v97, 0, sizeof(v97));
            pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)v96, (const UsdPrim *)&v99);
            *(_QWORD *)&v96[0] = MEMORY[0x24BEE9D38] + 16;
            MEMORY[0x2276976D8](__p, "in");
            pxrInternal__aapl__pxrReserved__::UsdShadeShader::GetInput((pxrInternal__aapl__pxrReserved__::UsdShadeShader *)v96, (const pxrInternal__aapl__pxrReserved__::TfToken *)__p);
            if (((uint64_t)__p[0] & 7) != 0)
            {
              v39 = (unsigned int *)((unint64_t)__p[0] & 0xFFFFFFFFFFFFFFF8);
              do
                v40 = __ldxr(v39);
              while (__stlxr(v40 - 2, v39));
            }
            MEMORY[0x22769739C](v96);
            if (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)v97)
              && pxrInternal__aapl__pxrReserved__::UsdShadeInput::IsInput())
            {
              memset(v96, 0, sizeof(v96));
              sub_2263DCC2C((uint64_t)v97, (uint64_t)v96);
              if (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)v96)
                && (LODWORD(v96[0]) != LODWORD(v97[0])
                 || *(_OWORD *)((char *)v96 + 8) != *(_OWORD *)((char *)v97 + 8)
                 || (*((_QWORD *)&v96[1] + 1) & 0xFFFFFFFFFFFFFFF8) != (*((_QWORD *)&v97[1] + 1) & 0xFFFFFFFFFFFFFFF8)))
              {
                *(_OWORD *)__p = 0u;
                v95 = 0u;
                sub_2263E3F28((uint64_t)__p, (uint64_t *)v96 + 1, &v96[1]);
                sub_2263DD718((pxrInternal__aapl__pxrReserved__::UsdObject *)__p, &v113);
                MEMORY[0x2276976D8](&v93, "UsdPrimvarReader_float2");
                v41 = v113;
                v42 = (unsigned int *)(v93 & 0xFFFFFFFFFFFFFFF8);
                if ((v93 & 7) != 0)
                {
                  do
                    v43 = __ldxr(v42);
                  while (__stlxr(v43 - 2, v42));
                  v44 = v113;
                }
                else
                {
                  v44 = v113;
                }
                if ((v44 & 7) != 0)
                {
                  v49 = (unsigned int *)(v44 & 0xFFFFFFFFFFFFFFF8);
                  do
                    v50 = __ldxr(v49);
                  while (__stlxr(v50 - 2, v49));
                }
                if ((unsigned int *)(v41 & 0xFFFFFFFFFFFFFFF8) == v42)
                  sub_2263E089C((uint64_t)&v101, (uint64_t)__p);
                sub_2263D701C((uint64_t)__p);
              }
              sub_2263DC7CC((uint64_t)v96);
            }
            if ((BYTE8(v97[1]) & 7) != 0)
            {
              v51 = (unsigned int *)(*((_QWORD *)&v97[1] + 1) & 0xFFFFFFFFFFFFFFF8);
              do
                v52 = __ldxr(v51);
              while (__stlxr(v52 - 2, v51));
            }
            pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
            sub_2263BDE64((uint64_t)&v97[1]);
            if (*((_QWORD *)&v97[0] + 1))
              sub_2263DA640(*((uint64_t *)&v97[0] + 1));
          }
        }
        if (!sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v101))
        {
LABEL_124:
          v69 = 1;
          goto LABEL_126;
        }
        memset(v97, 0, sizeof(v97));
        pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)v96, (const UsdPrim *)&v101);
        *(_QWORD *)&v96[0] = MEMORY[0x24BEE9D38] + 16;
        MEMORY[0x2276976D8](__p, "varname");
        pxrInternal__aapl__pxrReserved__::UsdShadeShader::GetInput((pxrInternal__aapl__pxrReserved__::UsdShadeShader *)v96, (const pxrInternal__aapl__pxrReserved__::TfToken *)__p);
        if (((uint64_t)__p[0] & 7) != 0)
        {
          v53 = (unsigned int *)((unint64_t)__p[0] & 0xFFFFFFFFFFFFFFF8);
          do
            v54 = __ldxr(v53);
          while (__stlxr(v54 - 2, v53));
        }
        MEMORY[0x22769739C](v96);
        if (!sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)v97)
          || !pxrInternal__aapl__pxrReserved__::UsdShadeInput::IsInput())
        {
LABEL_117:
          v66 = 1;
          goto LABEL_118;
        }
        memset(v96, 0, sizeof(v96));
        sub_2263DCC2C((uint64_t)v97, (uint64_t)v96);
        if (!sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)v96))
          goto LABEL_104;
        v113 = 0;
        v114 = 0;
        pxrInternal__aapl__pxrReserved__::UsdAttribute::Get();
        if (!v114)
        {
          sub_2263AD568((uint64_t)&v113);
LABEL_104:
          v59 = 1;
          goto LABEL_111;
        }
        if (sub_2263E0918((pxrInternal__aapl__pxrReserved__::VtValue *)&v113))
        {
          v55 = (void *)MEMORY[0x24BDD17C8];
          v56 = sub_2263E0950((pxrInternal__aapl__pxrReserved__::VtValue *)&v113);
          if (*(char *)(v56 + 23) >= 0)
            goto LABEL_108;
        }
        else
        {
          Typeid = (pxrInternal__aapl__pxrReserved__::VtValue *)pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid((pxrInternal__aapl__pxrReserved__::VtValue *)&v113);
          if (!pxrInternal__aapl__pxrReserved__::VtValue::_CanCast(Typeid, &stru_24EDD71A8, v61))
          {
            pxrInternal__aapl__pxrReserved__::VtValue::GetTypeName((pxrInternal__aapl__pxrReserved__::VtValue *)&v113);
            v90 = __p;
            if (SBYTE7(v95) < 0)
              v90 = (void **)__p[0];
            NSLog(CFSTR("Warning: invalid varname type %s"), v90);
            if (SBYTE7(v95) < 0)
              operator delete(__p[0]);
            goto LABEL_110;
          }
          v62 = sub_2263E09B8((pxrInternal__aapl__pxrReserved__::VtValue *)&v113);
          sub_2263B2DCC(&v113, v62);
          v55 = (void *)MEMORY[0x24BDD17C8];
          v56 = sub_2263E0950((pxrInternal__aapl__pxrReserved__::VtValue *)&v113);
          if (*(char *)(v56 + 23) >= 0)
          {
LABEL_108:
            objc_msgSend_stringWithUTF8String_(v55, v57, v56, v58);
            goto LABEL_109;
          }
        }
        objc_msgSend_stringWithUTF8String_(v55, v57, *(_QWORD *)v56, v58);
LABEL_109:
        v63 = objc_claimAutoreleasedReturnValue();

        v12 = (id)v63;
LABEL_110:
        v12 = v12;
        sub_2263AD568((uint64_t)&v113);
        v59 = 0;
LABEL_111:
        if ((BYTE8(v96[1]) & 7) != 0)
        {
          v64 = (unsigned int *)(*((_QWORD *)&v96[1] + 1) & 0xFFFFFFFFFFFFFFF8);
          do
            v65 = __ldxr(v64);
          while (__stlxr(v65 - 2, v64));
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2263BDE64((uint64_t)&v96[1]);
        if (*((_QWORD *)&v96[0] + 1))
          sub_2263DA640(*((uint64_t *)&v96[0] + 1));
        if ((v59 & 1) != 0)
          goto LABEL_117;
        v66 = 0;
LABEL_118:
        if ((BYTE8(v97[1]) & 7) != 0)
        {
          v67 = (unsigned int *)(*((_QWORD *)&v97[1] + 1) & 0xFFFFFFFFFFFFFFF8);
          do
            v68 = __ldxr(v67);
          while (__stlxr(v68 - 2, v67));
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2263BDE64((uint64_t)&v97[1]);
        if (*((_QWORD *)&v97[0] + 1))
          sub_2263DA640(*((uint64_t *)&v97[0] + 1));
        if ((v66 & 1) != 0)
          goto LABEL_124;
        v69 = 0;
LABEL_126:
        if ((v98 & 7) != 0)
        {
          v70 = (unsigned int *)(v98 & 0xFFFFFFFFFFFFFFF8);
          do
            v71 = __ldxr(v70);
          while (__stlxr(v71 - 2, v70));
        }
        if ((BYTE8(v100) & 7) != 0)
        {
          v72 = (unsigned int *)(*((_QWORD *)&v100 + 1) & 0xFFFFFFFFFFFFFFF8);
          do
            v73 = __ldxr(v72);
          while (__stlxr(v73 - 2, v72));
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2263BDE64((uint64_t)&v100);
        if (*((_QWORD *)&v99 + 1))
          sub_2263DA640(*((uint64_t *)&v99 + 1));
        if ((BYTE8(v102) & 7) != 0)
        {
          v74 = (unsigned int *)(*((_QWORD *)&v102 + 1) & 0xFFFFFFFFFFFFFFF8);
          do
            v75 = __ldxr(v74);
          while (__stlxr(v75 - 2, v74));
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2263BDE64((uint64_t)&v102);
        if (*((_QWORD *)&v101 + 1))
          sub_2263DA640(*((uint64_t *)&v101 + 1));
        if ((v69 & 1) != 0)
          goto LABEL_140;
        v76 = 0;
LABEL_142:
        if ((v103[3] & 7) != 0)
        {
          v77 = (unsigned int *)(v103[3] & 0xFFFFFFFFFFFFFFF8);
          do
            v78 = __ldxr(v77);
          while (__stlxr(v78 - 2, v77));
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2263BDE64((uint64_t)&v103[2]);
        if (v103[1])
          sub_2263DA640(v103[1]);
        if ((v76 & 1) != 0)
          goto LABEL_148;
        v79 = 0;
LABEL_150:
        if ((v104[3] & 7) != 0)
        {
          v80 = (unsigned int *)(v104[3] & 0xFFFFFFFFFFFFFFF8);
          do
            v81 = __ldxr(v80);
          while (__stlxr(v81 - 2, v80));
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2263BDE64((uint64_t)&v104[2]);
        if (v104[1])
          sub_2263DA640(v104[1]);
        if ((v79 & 1) != 0)
          goto LABEL_156;
        v82 = 0;
LABEL_157:
        if ((BYTE8(v106) & 7) != 0)
        {
          v83 = (unsigned int *)(*((_QWORD *)&v106 + 1) & 0xFFFFFFFFFFFFFFF8);
          do
            v84 = __ldxr(v83);
          while (__stlxr(v84 - 2, v83));
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2263BDE64((uint64_t)&v106);
        if (*((_QWORD *)&v105 + 1))
          sub_2263DA640(*((uint64_t *)&v105 + 1));
        if ((v82 & 1) != 0)
          goto LABEL_163;
        v85 = 0;
LABEL_165:
        if (((uint64_t)v107._proxyPrimPath._propPart._poolHandle & 7) != 0)
        {
          v86 = (unsigned int *)((unint64_t)v107._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
          do
            v87 = __ldxr(v86);
          while (__stlxr(v87 - 2, v86));
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2263BDE64((uint64_t)&v107._proxyPrimPath);
        if (v107._prim._p.px)
          sub_2263DA640((uint64_t)v107._prim._p.px);
        if (((uint64_t)v110._proxyPrimPath._propPart._poolHandle & 7) != 0)
        {
          v88 = (unsigned int *)((unint64_t)v110._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
          do
            v89 = __ldxr(v88);
          while (__stlxr(v89 - 2, v88));
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2263BDE64((uint64_t)&v110._proxyPrimPath);
        if (v110._prim._p.px)
          sub_2263DA640((uint64_t)v110._prim._p.px);
        if ((v85 & 1) == 0)
        {
          *(_QWORD *)&v110._type = &v108;
          sub_2263E42FC((void ***)&v110);
          goto LABEL_186;
        }
        v10 += 32;
        if (v10 == v11)
          goto LABEL_188;
      }
    }
    v12 = 0;
LABEL_188:
    *(_QWORD *)&v110._type = &v108;
    sub_2263E42FC((void ***)&v110);
  }
  else
  {
    v12 = 0;
  }
  v12 = v12;
LABEL_186:
  MEMORY[0x22769739C](&v110._propName);

  return v12;
}

+ (id)USDPreviewSurfaceDefaults
{
  id v2;
  USKData *v3;
  int32x2_t *v4;
  unsigned int *v5;
  unsigned int v6;
  const char *v7;
  void *v8;
  const char *v9;
  unsigned int *v10;
  unsigned int v11;
  USKData *v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int v15;
  const char *v16;
  void *v17;
  const char *v18;
  unsigned int *v19;
  unsigned int v20;
  USKData *v21;
  const char *v22;
  void *v23;
  const char *v24;
  unsigned int *v25;
  unsigned int v26;
  USKData *v27;
  uint64_t v28;
  unsigned int *v29;
  unsigned int v30;
  const char *v31;
  void *v32;
  const char *v33;
  unsigned int *v34;
  unsigned int v35;
  USKData *v36;
  const char *v37;
  void *v38;
  const char *v39;
  unsigned int *v40;
  unsigned int v41;
  USKData *v42;
  const char *v43;
  void *v44;
  const char *v45;
  unsigned int *v46;
  unsigned int v47;
  USKData *v48;
  const char *v49;
  void *v50;
  const char *v51;
  unsigned int *v52;
  unsigned int v53;
  USKData *v54;
  const char *v55;
  void *v56;
  const char *v57;
  unsigned int *v58;
  unsigned int v59;
  USKData *v60;
  const char *v61;
  void *v62;
  const char *v63;
  unsigned int *v64;
  unsigned int v65;
  USKData *v66;
  const char *v67;
  void *v68;
  const char *v69;
  unsigned int *v70;
  unsigned int v71;
  USKData *v72;
  uint64_t v73;
  unsigned int *v74;
  unsigned int v75;
  const char *v76;
  void *v77;
  const char *v78;
  unsigned int *v79;
  unsigned int v80;
  USKData *v81;
  const char *v82;
  void *v83;
  const char *v84;
  unsigned int *v85;
  unsigned int v86;
  USKData *v87;
  const char *v88;
  void *v89;
  const char *v90;
  unsigned int *v91;
  unsigned int v92;
  USKData *v93;
  uint64_t v94;
  unsigned int *v95;
  unsigned int v96;
  const char *v97;
  void *v98;
  const char *v99;
  unsigned int *v100;
  unsigned int v101;
  USKData *v102;
  const char *v103;
  void *v104;
  const char *v105;
  unsigned int *v106;
  unsigned int v107;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  _QWORD v124[2];
  _QWORD v125[2];
  _QWORD v126[2];
  _QWORD v127[2];
  _QWORD v128[2];
  _QWORD v129[2];
  _QWORD v130[2];
  _QWORD v131[2];
  int v132;
  void *v133;
  _QWORD v134[2];
  _QWORD v135[2];
  _QWORD v136[2];
  int v137;
  void *v138;
  _QWORD v139[2];
  _QWORD v140[3];

  v140[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = [USKData alloc];
  v140[1] = (char *)&off_24EDD7778 + 2;
  v4 = (int32x2_t *)operator new();
  *v4 = vdup_n_s32(0x3E3851ECu);
  v4[1].i32[0] = 1043878380;
  v5 = (unsigned int *)&v4[1] + 1;
  atomic_store(0, (unsigned int *)&v4[1] + 1);
  v140[0] = v4;
  do
    v6 = __ldxr(v5);
  while (__stxr(v6 + 1, v5));
  MEMORY[0x2276976D8](&v123, "float3");
  v8 = (void *)objc_msgSend_initWithVtValue_typeName_(v3, v7, (uint64_t)v140, (uint64_t)&v123);
  objc_msgSend_setObject_forKeyedSubscript_(v2, v9, (uint64_t)v8, (uint64_t)CFSTR("diffuseColor"));

  if ((v123 & 7) != 0)
  {
    v10 = (unsigned int *)(v123 & 0xFFFFFFFFFFFFFFF8);
    do
      v11 = __ldxr(v10);
    while (__stlxr(v11 - 2, v10));
  }
  sub_2263AD568((uint64_t)v140);
  v12 = [USKData alloc];
  v139[1] = (char *)&off_24EDD7778 + 2;
  v13 = operator new();
  *(_QWORD *)v13 = 0;
  *(_DWORD *)(v13 + 8) = 0;
  v14 = (unsigned int *)(v13 + 12);
  atomic_store(0, (unsigned int *)(v13 + 12));
  v139[0] = v13;
  do
    v15 = __ldxr(v14);
  while (__stxr(v15 + 1, v14));
  MEMORY[0x2276976D8](&v122, "float3");
  v17 = (void *)objc_msgSend_initWithVtValue_typeName_(v12, v16, (uint64_t)v139, (uint64_t)&v122);
  objc_msgSend_setObject_forKeyedSubscript_(v2, v18, (uint64_t)v17, (uint64_t)CFSTR("emissiveColor"));

  if ((v122 & 7) != 0)
  {
    v19 = (unsigned int *)(v122 & 0xFFFFFFFFFFFFFFF8);
    do
      v20 = __ldxr(v19);
    while (__stlxr(v20 - 2, v19));
  }
  sub_2263AD568((uint64_t)v139);
  v21 = [USKData alloc];
  v138 = &unk_24EDD749B;
  v137 = 0;
  MEMORY[0x2276976D8](&v121, "int");
  v23 = (void *)objc_msgSend_initWithVtValue_typeName_(v21, v22, (uint64_t)&v137, (uint64_t)&v121);
  objc_msgSend_setObject_forKeyedSubscript_(v2, v24, (uint64_t)v23, (uint64_t)CFSTR("useSpecularWorkflow"));

  if ((v121 & 7) != 0)
  {
    v25 = (unsigned int *)(v121 & 0xFFFFFFFFFFFFFFF8);
    do
      v26 = __ldxr(v25);
    while (__stlxr(v26 - 2, v25));
  }
  sub_2263AD568((uint64_t)&v137);
  v27 = [USKData alloc];
  v136[1] = (char *)&off_24EDD7778 + 2;
  v28 = operator new();
  *(_QWORD *)v28 = 0;
  *(_DWORD *)(v28 + 8) = 0;
  v29 = (unsigned int *)(v28 + 12);
  atomic_store(0, (unsigned int *)(v28 + 12));
  v136[0] = v28;
  do
    v30 = __ldxr(v29);
  while (__stxr(v30 + 1, v29));
  MEMORY[0x2276976D8](&v120, "float3");
  v32 = (void *)objc_msgSend_initWithVtValue_typeName_(v27, v31, (uint64_t)v136, (uint64_t)&v120);
  objc_msgSend_setObject_forKeyedSubscript_(v2, v33, (uint64_t)v32, (uint64_t)CFSTR("specularColor"));

  if ((v120 & 7) != 0)
  {
    v34 = (unsigned int *)(v120 & 0xFFFFFFFFFFFFFFF8);
    do
      v35 = __ldxr(v34);
    while (__stlxr(v35 - 2, v34));
  }
  sub_2263AD568((uint64_t)v136);
  v36 = [USKData alloc];
  v135[0] = 0;
  v135[1] = &unk_24EDD78EB;
  MEMORY[0x2276976D8](&v119, "float");
  v38 = (void *)objc_msgSend_initWithVtValue_typeName_(v36, v37, (uint64_t)v135, (uint64_t)&v119);
  objc_msgSend_setObject_forKeyedSubscript_(v2, v39, (uint64_t)v38, (uint64_t)CFSTR("metallic"));

  if ((v119 & 7) != 0)
  {
    v40 = (unsigned int *)(v119 & 0xFFFFFFFFFFFFFFF8);
    do
      v41 = __ldxr(v40);
    while (__stlxr(v41 - 2, v40));
  }
  sub_2263AD568((uint64_t)v135);
  v42 = [USKData alloc];
  v134[0] = 0x3FE0000000000000;
  v134[1] = &unk_24EDD78EB;
  MEMORY[0x2276976D8](&v118, "float");
  v44 = (void *)objc_msgSend_initWithVtValue_typeName_(v42, v43, (uint64_t)v134, (uint64_t)&v118);
  objc_msgSend_setObject_forKeyedSubscript_(v2, v45, (uint64_t)v44, (uint64_t)CFSTR("roughness"));

  if ((v118 & 7) != 0)
  {
    v46 = (unsigned int *)(v118 & 0xFFFFFFFFFFFFFFF8);
    do
      v47 = __ldxr(v46);
    while (__stlxr(v47 - 2, v46));
  }
  sub_2263AD568((uint64_t)v134);
  v48 = [USKData alloc];
  v133 = &unk_24EDD749B;
  v132 = 0;
  MEMORY[0x2276976D8](&v117, "float");
  v50 = (void *)objc_msgSend_initWithVtValue_typeName_(v48, v49, (uint64_t)&v132, (uint64_t)&v117);
  objc_msgSend_setObject_forKeyedSubscript_(v2, v51, (uint64_t)v50, (uint64_t)CFSTR("clearcoat"));

  if ((v117 & 7) != 0)
  {
    v52 = (unsigned int *)(v117 & 0xFFFFFFFFFFFFFFF8);
    do
      v53 = __ldxr(v52);
    while (__stlxr(v53 - 2, v52));
  }
  sub_2263AD568((uint64_t)&v132);
  v54 = [USKData alloc];
  v131[0] = 0x3F847AE147AE147BLL;
  v131[1] = &unk_24EDD78EB;
  MEMORY[0x2276976D8](&v116, "float");
  v56 = (void *)objc_msgSend_initWithVtValue_typeName_(v54, v55, (uint64_t)v131, (uint64_t)&v116);
  objc_msgSend_setObject_forKeyedSubscript_(v2, v57, (uint64_t)v56, (uint64_t)CFSTR("clearcoatRoughness"));

  if ((v116 & 7) != 0)
  {
    v58 = (unsigned int *)(v116 & 0xFFFFFFFFFFFFFFF8);
    do
      v59 = __ldxr(v58);
    while (__stlxr(v59 - 2, v58));
  }
  sub_2263AD568((uint64_t)v131);
  v60 = [USKData alloc];
  v130[0] = 0x3FF0000000000000;
  v130[1] = &unk_24EDD78EB;
  MEMORY[0x2276976D8](&v115, "float");
  v62 = (void *)objc_msgSend_initWithVtValue_typeName_(v60, v61, (uint64_t)v130, (uint64_t)&v115);
  objc_msgSend_setObject_forKeyedSubscript_(v2, v63, (uint64_t)v62, (uint64_t)CFSTR("opacity"));

  if ((v115 & 7) != 0)
  {
    v64 = (unsigned int *)(v115 & 0xFFFFFFFFFFFFFFF8);
    do
      v65 = __ldxr(v64);
    while (__stlxr(v65 - 2, v64));
  }
  sub_2263AD568((uint64_t)v130);
  v66 = [USKData alloc];
  v129[0] = 0x3FF8000000000000;
  v129[1] = &unk_24EDD78EB;
  MEMORY[0x2276976D8](&v114, "float");
  v68 = (void *)objc_msgSend_initWithVtValue_typeName_(v66, v67, (uint64_t)v129, (uint64_t)&v114);
  objc_msgSend_setObject_forKeyedSubscript_(v2, v69, (uint64_t)v68, (uint64_t)CFSTR("ior"));

  if ((v114 & 7) != 0)
  {
    v70 = (unsigned int *)(v114 & 0xFFFFFFFFFFFFFFF8);
    do
      v71 = __ldxr(v70);
    while (__stlxr(v71 - 2, v70));
  }
  sub_2263AD568((uint64_t)v129);
  v72 = [USKData alloc];
  v128[1] = (char *)&off_24EDD7778 + 2;
  v73 = operator new();
  *(_QWORD *)v73 = 0;
  *(_DWORD *)(v73 + 8) = 1065353216;
  v74 = (unsigned int *)(v73 + 12);
  atomic_store(0, (unsigned int *)(v73 + 12));
  v128[0] = v73;
  do
    v75 = __ldxr(v74);
  while (__stxr(v75 + 1, v74));
  MEMORY[0x2276976D8](&v113, "float3");
  v77 = (void *)objc_msgSend_initWithVtValue_typeName_(v72, v76, (uint64_t)v128, (uint64_t)&v113);
  objc_msgSend_setObject_forKeyedSubscript_(v2, v78, (uint64_t)v77, (uint64_t)CFSTR("normal"));

  if ((v113 & 7) != 0)
  {
    v79 = (unsigned int *)(v113 & 0xFFFFFFFFFFFFFFF8);
    do
      v80 = __ldxr(v79);
    while (__stlxr(v80 - 2, v79));
  }
  sub_2263AD568((uint64_t)v128);
  v81 = [USKData alloc];
  v127[0] = 0;
  v127[1] = &unk_24EDD78EB;
  MEMORY[0x2276976D8](&v112, "float");
  v83 = (void *)objc_msgSend_initWithVtValue_typeName_(v81, v82, (uint64_t)v127, (uint64_t)&v112);
  objc_msgSend_setObject_forKeyedSubscript_(v2, v84, (uint64_t)v83, (uint64_t)CFSTR("displacement"));

  if ((v112 & 7) != 0)
  {
    v85 = (unsigned int *)(v112 & 0xFFFFFFFFFFFFFFF8);
    do
      v86 = __ldxr(v85);
    while (__stlxr(v86 - 2, v85));
  }
  sub_2263AD568((uint64_t)v127);
  v87 = [USKData alloc];
  v126[0] = 0x3FF0000000000000;
  v126[1] = &unk_24EDD78EB;
  MEMORY[0x2276976D8](&v111, "float");
  v89 = (void *)objc_msgSend_initWithVtValue_typeName_(v87, v88, (uint64_t)v126, (uint64_t)&v111);
  objc_msgSend_setObject_forKeyedSubscript_(v2, v90, (uint64_t)v89, (uint64_t)CFSTR("occlusion"));

  if ((v111 & 7) != 0)
  {
    v91 = (unsigned int *)(v111 & 0xFFFFFFFFFFFFFFF8);
    do
      v92 = __ldxr(v91);
    while (__stlxr(v92 - 2, v91));
  }
  sub_2263AD568((uint64_t)v126);
  v93 = [USKData alloc];
  v125[1] = (char *)&off_24EDD7830 + 2;
  v94 = operator new();
  *(_OWORD *)v94 = xmmword_22640C410;
  v95 = (unsigned int *)(v94 + 16);
  atomic_store(0, (unsigned int *)(v94 + 16));
  v125[0] = v94;
  do
    v96 = __ldxr(v95);
  while (__stxr(v96 + 1, v95));
  MEMORY[0x2276976D8](&v110, "float4");
  v98 = (void *)objc_msgSend_initWithVtValue_typeName_(v93, v97, (uint64_t)v125, (uint64_t)&v110);
  objc_msgSend_setObject_forKeyedSubscript_(v2, v99, (uint64_t)v98, (uint64_t)CFSTR("textureFallback"));

  if ((v110 & 7) != 0)
  {
    v100 = (unsigned int *)(v110 & 0xFFFFFFFFFFFFFFF8);
    do
      v101 = __ldxr(v100);
    while (__stlxr(v101 - 2, v100));
  }
  sub_2263AD568((uint64_t)v125);
  v102 = [USKData alloc];
  v124[0] = 0;
  v124[1] = (char *)&off_24EDD76C0 + 3;
  MEMORY[0x2276976D8](&v109, "float2");
  v104 = (void *)objc_msgSend_initWithVtValue_typeName_(v102, v103, (uint64_t)v124, (uint64_t)&v109);
  objc_msgSend_setObject_forKeyedSubscript_(v2, v105, (uint64_t)v104, (uint64_t)CFSTR("primvarFloat2Fallback"));

  if ((v109 & 7) != 0)
  {
    v106 = (unsigned int *)(v109 & 0xFFFFFFFFFFFFFFF8);
    do
      v107 = __ldxr(v106);
    while (__stlxr(v107 - 2, v106));
  }
  sub_2263AD568((uint64_t)v124);
  return v2;
}

+ (id)targetPropertyWithProperty:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  unsigned int *v16;
  unsigned int v17;
  USKProperty *v18;
  unint64_t *v19;
  unint64_t v20;
  const char *v21;
  uint64_t v22;
  unsigned int *v23;
  unsigned int v24;
  unsigned int *v25;
  unsigned int v26;
  unsigned int *v27;
  unsigned int v28;
  unsigned int *v29;
  unsigned int v30;
  int v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  _OWORD v37[2];
  _QWORD v38[4];

  v3 = a3;
  v7 = v3;
  if (v3)
  {
    objc_msgSend_usdProperty(v3, v4, v5, v6);
    v8 = v38[0];
    v9 = v38[3];
  }
  else
  {
    v9 = 0;
    v8 = 0;
    memset(v38, 0, sizeof(v38));
  }
  if ((v9 & 7) != 0)
  {
    v10 = (unsigned int *)(v9 & 0xFFFFFFFFFFFFFFF8);
    do
      v11 = __ldxr(v10);
    while (__stlxr(v11 - 2, v10));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v38[2]);
  if (v38[1])
    sub_2263DA640(v38[1]);
  if (v8 == 3)
  {
    memset(v38, 0, sizeof(v38));
    if (v7)
      objc_msgSend_usdProperty(v7, v12, v13, v14);
    else
      memset(v37, 0, sizeof(v37));
    sub_2263DC6FC((uint64_t)v37, (uint64_t)v38);
    if ((BYTE8(v37[1]) & 7) != 0)
    {
      v16 = (unsigned int *)(*((_QWORD *)&v37[1] + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v17 = __ldxr(v16);
      while (__stlxr(v17 - 2, v16));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v37[1]);
    if (*((_QWORD *)&v37[0] + 1))
      sub_2263DA640(*((uint64_t *)&v37[0] + 1));
    memset(v37, 0, sizeof(v37));
    sub_2263DCC2C((uint64_t)v38, (uint64_t)v37);
    if (LODWORD(v37[0]) == LODWORD(v38[0])
      && *(_OWORD *)((char *)v37 + 8) == *(_OWORD *)&v38[1]
      && (*((_QWORD *)&v37[1] + 1) & 0xFFFFFFFFFFFFFFF8) == (v38[3] & 0xFFFFFFFFFFFFFFF8))
    {
      v15 = v7;
    }
    else
    {
      v18 = [USKProperty alloc];
      v32 = v37[0];
      v33 = *((_QWORD *)&v37[0] + 1);
      if (*((_QWORD *)&v37[0] + 1))
      {
        v19 = (unint64_t *)(*((_QWORD *)&v37[0] + 1) + 48);
        do
          v20 = __ldxr(v19);
        while (__stxr(v20 + 1, v19));
      }
      sub_2263BDDD8(&v34, &v37[1]);
      sub_2263BDE28(&v35, (_DWORD *)&v37[1] + 1);
      v36 = *((_QWORD *)&v37[1] + 1);
      if ((BYTE8(v37[1]) & 7) != 0)
      {
        v23 = (unsigned int *)(*((_QWORD *)&v37[1] + 1) & 0xFFFFFFFFFFFFFFF8);
        do
          v24 = __ldxr(v23);
        while (__stxr(v24 + 2, v23));
        if ((v24 & 1) == 0)
          v36 &= 0xFFFFFFFFFFFFFFF8;
      }
      v15 = (id)objc_msgSend_initWithUsdProperty_(v18, v21, (uint64_t)&v32, v22);
      if ((v36 & 7) != 0)
      {
        v25 = (unsigned int *)(v36 & 0xFFFFFFFFFFFFFFF8);
        do
          v26 = __ldxr(v25);
        while (__stlxr(v26 - 2, v25));
      }
      pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
      sub_2263BDE64((uint64_t)&v34);
      if (v33)
        sub_2263DA640(v33);
    }
    if ((BYTE8(v37[1]) & 7) != 0)
    {
      v27 = (unsigned int *)(*((_QWORD *)&v37[1] + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v28 = __ldxr(v27);
      while (__stlxr(v28 - 2, v27));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v37[1]);
    if (*((_QWORD *)&v37[0] + 1))
      sub_2263DA640(*((uint64_t *)&v37[0] + 1));
    if ((v38[3] & 7) != 0)
    {
      v29 = (unsigned int *)(v38[3] & 0xFFFFFFFFFFFFFFF8);
      do
        v30 = __ldxr(v29);
      while (__stlxr(v30 - 2, v29));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v38[2]);
    if (v38[1])
      sub_2263DA640(v38[1]);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)meshGroupsWithNode:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  unsigned int *v9;
  unsigned int v10;
  void **v12;
  _QWORD v13[3];
  __int128 v14;
  __int128 v15;
  UsdPrim v16;

  v3 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  memset(&v16, 0, 32);
  if (v3)
    objc_msgSend_usdPrim(v3, v4, v5, v6);
  v14 = 0u;
  v15 = 0u;
  pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v14, &v16);
  *((_QWORD *)&v15 + 1) = 0;
  *(_QWORD *)&v14 = MEMORY[0x24BEE9DC8] + 16;
  memset(v13, 0, sizeof(v13));
  pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI::GetMaterialBindSubsets((pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI *)&v14);
  v8 = v7;
  v12 = (void **)v13;
  sub_2263E4504(&v12);
  MEMORY[0x2276975A0](&v14);
  if (((uint64_t)v16._proxyPrimPath._propPart._poolHandle & 7) != 0)
  {
    v9 = (unsigned int *)((unint64_t)v16._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
    do
      v10 = __ldxr(v9);
    while (__stlxr(v10 - 2, v9));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v16._proxyPrimPath);
  if (v16._prim._p.px)
    sub_2263DA640((uint64_t)v16._prim._p.px);

  return v8;
}

+ (id)meshUniqueAndTriangulate:(id)a3 names:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t i;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  pxrInternal__aapl__pxrReserved__::Sdf_ValueTypeNamesType *v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int *v65;
  unsigned int v66;
  unsigned int *v67;
  unsigned int v68;
  id v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  id v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v89;
  char *v90;
  uint64_t v91;
  unsigned int *v92;
  unsigned int v93;
  char *v94;
  uint64_t v95;
  pxrInternal__aapl__pxrReserved__::TfToken *v96;
  unint64_t v97;
  uint64_t v98;
  __int128 v99;
  id v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t j;
  void *v105;
  id v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  __int128 v114;
  uint64_t v115;
  unint64_t *v116;
  unint64_t v117;
  uint64_t v118;
  unsigned int *v119;
  unsigned int v120;
  uint64_t v121;
  unsigned int *v122;
  unsigned int v123;
  uint64_t v124;
  unsigned int *v125;
  unsigned int v126;
  unsigned int *v127;
  unsigned int v128;
  USKData *v129;
  const char *v130;
  void *v131;
  unsigned int *v132;
  unsigned int v133;
  const char *v134;
  uint64_t v135;
  unsigned int *v136;
  unsigned int v137;
  unsigned int *v138;
  unsigned int v139;
  unsigned int *v140;
  unsigned int v141;
  pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *v142;
  pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *v143;
  unint64_t v144;
  int *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  int v149;
  int v150;
  USKData *v151;
  pxrInternal__aapl__pxrReserved__::Sdf_ValueTypeNamesType *v152;
  const char *v153;
  void *v154;
  unsigned int *v155;
  unsigned int v156;
  const char *v157;
  uint64_t v158;
  USKData *v159;
  pxrInternal__aapl__pxrReserved__::Sdf_ValueTypeNamesType *v160;
  const char *v161;
  void *v162;
  unsigned int *v163;
  unsigned int v164;
  const char *v165;
  uint64_t v166;
  id v167;
  unsigned int *v168;
  unsigned int v169;
  unsigned int *v170;
  unsigned int v171;
  _BOOL4 v173;
  id v174;
  int v175;
  void *v176;
  id v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  void *__p[2];
  uint64_t v186;
  __int128 v187;
  _QWORD v188[3];
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  char *v195;
  char *v196;
  unint64_t v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  _QWORD v202[6];
  __int128 v203;
  uint64_t v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  UsdPrim v209;
  std::type_info **v210;
  uint64_t v211[2];
  _QWORD v212[2];
  _BYTE v213[128];
  unint64_t v214;
  uint64_t v215;
  _BYTE v216[128];
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  _BYTE v225[128];
  uint64_t v226;

  v226 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v174 = a4;
  v176 = v5;
  v177 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend_type(v5, v6, v7, v8);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9 != CFSTR("Mesh"))
  {
    objc_msgSend_name(v5, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringValue(v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error: Node %@ is not a mesh"), v17);

    v18 = v177;
    v19 = v177;
    goto LABEL_155;
  }
  memset(&v209, 0, 32);
  if (v5)
    objc_msgSend_usdPrim(v5, v10, v11, v12);
  v207 = 0u;
  v208 = 0u;
  v205 = 0u;
  v206 = 0u;
  v20 = v174;
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v205, (uint64_t)v225, 16);
  if (v24)
  {
    v25 = 0;
    v26 = *(_QWORD *)v206;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v206 != v26)
          objc_enumerationMutation(v20);
        v25 |= objc_msgSend_isEqualToString_(*(void **)(*((_QWORD *)&v205 + 1) + 8 * i), v22, (uint64_t)CFSTR("points"), v23);
      }
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v205, (uint64_t)v225, 16);
    }
    while (v24);

    if ((v25 & 1) != 0)
    {
      v204 = 0;
      v203 = 0u;
      memset(v202, 0, sizeof(v202));
      v200 = 0u;
      v201 = 0u;
      v198 = 0u;
      v199 = 0u;
      objc_msgSend_property_(v176, v28, (uint64_t)CFSTR("faceVertexIndices"), v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(v30, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v34;
      if (v34)
      {
        objc_msgSend_value(v34, v35, v36, v37);
      }
      else
      {
        v215 = 0;
        v214 = 0;
      }
      sub_2263E2504((uint64_t *)&v214, (uint64_t)&v217);
      sub_2263AC71C((uint64_t)&v202[1]);
      *(_OWORD *)&v202[1] = v217;
      *(_OWORD *)&v202[3] = v218;
      v217 = 0u;
      v218 = 0u;
      v202[5] = v219;
      *(_QWORD *)&v219 = 0;
      sub_2263AC71C((uint64_t)&v217);
      sub_2263AD568((uint64_t)&v214);

      objc_msgSend_property_(v176, v40, (uint64_t)CFSTR("faceVertexCounts"), v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(v42, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v46;
      if (v46)
      {
        objc_msgSend_value(v46, v47, v48, v49);
      }
      else
      {
        v215 = 0;
        v214 = 0;
      }
      sub_2263E2504((uint64_t *)&v214, (uint64_t)&v217);
      sub_2263AC71C((uint64_t)&v200);
      v200 = v217;
      v201 = v218;
      v217 = 0u;
      v218 = 0u;
      v202[0] = v219;
      *(_QWORD *)&v219 = 0;
      sub_2263AC71C((uint64_t)&v217);
      sub_2263AD568((uint64_t)&v214);

      v223 = 0;
      v224 = 0;
      objc_msgSend_property_(v176, v51, (uint64_t)CFSTR("points"), v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(v53, v54, v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v57;
      if (v57)
      {
        objc_msgSend_value(v57, v58, v59, v60);
      }
      else
      {
        v223 = 0;
        v224 = 0;
      }

      sub_2263B0700(&v217, &v223);
      *(_QWORD *)&v220 = 0;
      v218 = 0u;
      v219 = 0u;
      MEMORY[0x2276976D8]((char *)&v220 + 8, "points");
      v62 = (pxrInternal__aapl__pxrReserved__::Sdf_ValueTypeNamesType *)atomic_load(MEMORY[0x24BEE82A0]);
      if (!v62)
        v62 = sub_2263B1434(MEMORY[0x24BEE82A0]);
      *(_QWORD *)&v221 = *((_QWORD *)v62 + 83);
      MEMORY[0x2276976D8]((char *)&v221 + 8, "vertex");
      LODWORD(v222) = 1;
      v63 = v199;
      if ((unint64_t)v199 >= *((_QWORD *)&v199 + 1))
      {
        v64 = sub_2263B1500((uint64_t *)&v198 + 1, (uint64_t)&v217);
      }
      else
      {
        sub_2263B148C((uint64_t)&v198 + 8, (uint64_t)&v217);
        v64 = v63 + 88;
      }
      *(_QWORD *)&v199 = v64;
      if ((BYTE8(v221) & 7) != 0)
      {
        v65 = (unsigned int *)(*((_QWORD *)&v221 + 1) & 0xFFFFFFFFFFFFFFF8);
        do
          v66 = __ldxr(v65);
        while (__stlxr(v66 - 2, v65));
      }
      if ((BYTE8(v220) & 7) != 0)
      {
        v67 = (unsigned int *)(*((_QWORD *)&v220 + 1) & 0xFFFFFFFFFFFFFFF8);
        do
          v68 = __ldxr(v67);
        while (__stlxr(v68 - 2, v67));
      }
      sub_2263AC71C((uint64_t)&v218);
      sub_2263AD568((uint64_t)&v217);
      v195 = 0;
      v196 = 0;
      v197 = 0;
      v191 = 0u;
      v192 = 0u;
      v193 = 0u;
      v194 = 0u;
      v69 = v20;
      v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v70, (uint64_t)&v191, (uint64_t)v216, 16);
      if (v73)
      {
        v175 = 0;
        v173 = 0;
        v74 = *(_QWORD *)v192;
        do
        {
          v75 = 0;
          do
          {
            if (*(_QWORD *)v192 != v74)
              objc_enumerationMutation(v69);
            v76 = *(void **)(*((_QWORD *)&v191 + 1) + 8 * v75);
            if ((objc_msgSend_isEqualToString_(v76, v71, (uint64_t)CFSTR("faceVertexIndices"), v72) & 1) == 0
              && (objc_msgSend_isEqualToString_(v76, v71, (uint64_t)CFSTR("faceVertexCounts"), v72) & 1) == 0
              && (objc_msgSend_isEqualToString_(v76, v71, (uint64_t)CFSTR("points"), v72) & 1) == 0)
            {
              if ((objc_msgSend_isEqualToString_(v76, v71, (uint64_t)CFSTR("normals"), v72) & 1) != 0
                || objc_msgSend_isEqualToString_(v76, v77, (uint64_t)CFSTR("primvar:normals"), v78))
              {
                v175 = sub_2263E265C((uint64_t *)&v198, v176) ^ 1;
              }
              else if (objc_msgSend_isEqualToString_(v76, v79, (uint64_t)CFSTR("tangents"), v80))
              {
                v173 = !sub_2263E2708((uint64_t *)&v198, v176);
              }
              else
              {
                v81 = v76;
                if ((objc_msgSend_hasPrefix_(v81, v82, (uint64_t)CFSTR("primvars:"), v83) & 1) == 0)
                {
                  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v84, (uint64_t)CFSTR("primvars:%@"), v85, v81);
                  v86 = objc_claimAutoreleasedReturnValue();

                  v81 = (id)v86;
                }
                sub_2263E1D14((uint64_t *)&v198, v176, v81);
                if (!atomic_load(MEMORY[0x24BEE82A0]))
                  sub_2263B1434(MEMORY[0x24BEE82A0]);
                if ((pxrInternal__aapl__pxrReserved__::SdfValueTypeName::operator==() & 1) != 0)
                  goto LABEL_58;
                if (!atomic_load(MEMORY[0x24BEE82A0]))
                  sub_2263B1434(MEMORY[0x24BEE82A0]);
                if (pxrInternal__aapl__pxrReserved__::SdfValueTypeName::operator==())
                {
LABEL_58:
                  v89 = (uint64_t *)(v199 - 32);
                  v90 = v196;
                  if ((unint64_t)v196 >= v197)
                  {
                    v94 = sub_2263E46D0(&v195, v89);
                  }
                  else
                  {
                    v91 = *v89;
                    *(_QWORD *)v196 = *v89;
                    if ((v91 & 7) != 0)
                    {
                      v92 = (unsigned int *)(v91 & 0xFFFFFFFFFFFFFFF8);
                      do
                        v93 = __ldxr(v92);
                      while (__stxr(v93 + 2, v92));
                      if ((v93 & 1) == 0)
                        *(_QWORD *)v90 &= 0xFFFFFFFFFFFFFFF8;
                    }
                    v94 = v90 + 8;
                  }
                  v196 = v94;
                }

              }
            }
            ++v75;
          }
          while (v75 != v73);
          v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v71, (uint64_t)&v191, (uint64_t)v216, 16);
          v73 = v95;
        }
        while (v95);
      }
      else
      {
        v175 = 0;
        v173 = 0;
      }

      v189 = 0u;
      v190 = 0u;
      pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v189, &v209);
      *((_QWORD *)&v190 + 1) = 0;
      *(_QWORD *)&v189 = MEMORY[0x24BEE9DC8] + 16;
      memset(v188, 0, sizeof(v188));
      pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI::GetMaterialBindSubsets((pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI *)&v189);
      v96 = (pxrInternal__aapl__pxrReserved__::TfToken *)sub_2263AA688((uint64_t)&v198);
      if (((v175 | v173) & 1) != 0)
      {
        if ((v175 & 1) != 0)
          sub_2263AEAF4((uint64_t)&v198, 0);
        if (v173 && v196 != v195)
        {
          v97 = *(_QWORD *)v195 & 0xFFFFFFFFFFFFFFF8;
          v98 = v97 ? v97 + 16 : pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString(v96);
          if (*(char *)(v98 + 23) < 0)
          {
            sub_2263AE36C(__p, *(void **)v98, *(_QWORD *)(v98 + 8));
          }
          else
          {
            v99 = *(_OWORD *)v98;
            v186 = *(_QWORD *)(v98 + 16);
            *(_OWORD *)__p = v99;
          }
          sub_2263B02AC((uint64_t *)&v198, 0, (uint64_t)__p, 3.1416);
          if (SHIBYTE(v186) < 0)
            operator delete(__p[0]);
        }
      }
      sub_2264079C0((uint64_t)&v198);
      v183 = 0u;
      v184 = 0u;
      v181 = 0u;
      v182 = 0u;
      v100 = v69;
      v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(v100, v101, (uint64_t)&v181, (uint64_t)v213, 16);
      if (v102)
      {
        v103 = *(_QWORD *)v182;
        do
        {
          for (j = 0; j != v102; ++j)
          {
            if (*(_QWORD *)v182 != v103)
              objc_enumerationMutation(v100);
            v105 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * j);
            v214 = 0;
            v106 = objc_retainAutorelease(v105);
            v110 = objc_msgSend_UTF8String(v106, v107, v108, v109);
            MEMORY[0x2276976D8](&v214, v110);
            v112 = *((_QWORD *)&v198 + 1);
            v113 = v199;
            while (v112 != v113)
            {
              v222 = 0;
              v220 = 0u;
              v221 = 0u;
              v218 = 0u;
              v219 = 0u;
              v217 = 0u;
              sub_2263B0700(&v217, (_QWORD *)v112);
              v114 = *(_OWORD *)(v112 + 32);
              v218 = *(_OWORD *)(v112 + 16);
              v219 = v114;
              v115 = *(_QWORD *)(v112 + 48);
              *(_QWORD *)&v220 = v115;
              if (v115)
              {
                v116 = (unint64_t *)(v115 - 16);
                if (*((_QWORD *)&v219 + 1))
                  v116 = (unint64_t *)*((_QWORD *)&v219 + 1);
                do
                  v117 = __ldxr(v116);
                while (__stxr(v117 + 1, v116));
              }
              v118 = *(_QWORD *)(v112 + 56);
              *((_QWORD *)&v220 + 1) = v118;
              if ((v118 & 7) != 0)
              {
                v119 = (unsigned int *)(v118 & 0xFFFFFFFFFFFFFFF8);
                do
                  v120 = __ldxr(v119);
                while (__stxr(v120 + 2, v119));
                if ((v120 & 1) == 0)
                  *((_QWORD *)&v220 + 1) &= 0xFFFFFFFFFFFFFFF8;
              }
              v121 = *(_QWORD *)(v112 + 72);
              *(_QWORD *)&v221 = *(_QWORD *)(v112 + 64);
              *((_QWORD *)&v221 + 1) = v121;
              if ((v121 & 7) != 0)
              {
                v122 = (unsigned int *)(v121 & 0xFFFFFFFFFFFFFFF8);
                do
                  v123 = __ldxr(v122);
                while (__stxr(v123 + 2, v122));
                if ((v123 & 1) == 0)
                  *((_QWORD *)&v221 + 1) &= 0xFFFFFFFFFFFFFFF8;
              }
              LODWORD(v222) = *(_DWORD *)(v112 + 80);
              v124 = *((_QWORD *)&v220 + 1);
              if ((*((_QWORD *)&v220 + 1) & 0xFFFFFFFFFFFFFFF8) == (v214 & 0xFFFFFFFFFFFFFFF8))
              {
                v129 = [USKData alloc];
                sub_2263B0700(v212, &v217);
                pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken((pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v221);
                v131 = (void *)objc_msgSend_initWithVtValue_typeName_(v129, v130, (uint64_t)v212, (uint64_t)&v180);
                if ((v180 & 7) != 0)
                {
                  v132 = (unsigned int *)(v180 & 0xFFFFFFFFFFFFFFF8);
                  do
                    v133 = __ldxr(v132);
                  while (__stlxr(v133 - 2, v132));
                }
                sub_2263AD568((uint64_t)v212);
                objc_msgSend_addObject_(v177, v134, (uint64_t)v131, v135);

                if ((BYTE8(v221) & 7) != 0)
                {
                  v136 = (unsigned int *)(*((_QWORD *)&v221 + 1) & 0xFFFFFFFFFFFFFFF8);
                  do
                    v137 = __ldxr(v136);
                  while (__stlxr(v137 - 2, v136));
                }
                if ((BYTE8(v220) & 7) != 0)
                {
                  v138 = (unsigned int *)(*((_QWORD *)&v220 + 1) & 0xFFFFFFFFFFFFFFF8);
                  do
                    v139 = __ldxr(v138);
                  while (__stlxr(v139 - 2, v138));
                }
                sub_2263AC71C((uint64_t)&v218);
                sub_2263AD568((uint64_t)&v217);
                break;
              }
              if ((BYTE8(v221) & 7) != 0)
              {
                v125 = (unsigned int *)(*((_QWORD *)&v221 + 1) & 0xFFFFFFFFFFFFFFF8);
                do
                  v126 = __ldxr(v125);
                while (__stlxr(v126 - 2, v125));
                v124 = *((_QWORD *)&v220 + 1);
              }
              if ((v124 & 7) != 0)
              {
                v127 = (unsigned int *)(v124 & 0xFFFFFFFFFFFFFFF8);
                do
                  v128 = __ldxr(v127);
                while (__stlxr(v128 - 2, v127));
              }
              sub_2263AC71C((uint64_t)&v218);
              sub_2263AD568((uint64_t)&v217);
              v112 += 88;
            }
            if ((v214 & 7) != 0)
            {
              v140 = (unsigned int *)(v214 & 0xFFFFFFFFFFFFFFF8);
              do
                v141 = __ldxr(v140);
              while (__stlxr(v141 - 2, v140));
            }
          }
          v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(v100, v111, (uint64_t)&v181, (uint64_t)v213, 16);
        }
        while (v102);
      }

      v142 = (pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)*((_QWORD *)&v203 + 1);
      v143 = (pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v203;
      if (*((_QWORD *)&v203 + 1) == (_QWORD)v203)
      {
        v159 = [USKData alloc];
        v211[1] = (uint64_t)&off_24EDD7D38;
        sub_2263C68F0(v211, (uint64_t)&v202[1]);
        v160 = (pxrInternal__aapl__pxrReserved__::Sdf_ValueTypeNamesType *)atomic_load(MEMORY[0x24BEE82A0]);
        if (!v160)
          v160 = sub_2263B1434(MEMORY[0x24BEE82A0]);
        pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken((pxrInternal__aapl__pxrReserved__::Sdf_ValueTypeNamesType *)((char *)v160 + 464));
        v162 = (void *)objc_msgSend_initWithVtValue_typeName_(v159, v161, (uint64_t)v211, (uint64_t)&v179);
        if ((v179 & 7) != 0)
        {
          v163 = (unsigned int *)(v179 & 0xFFFFFFFFFFFFFFF8);
          do
            v164 = __ldxr(v163);
          while (__stlxr(v164 - 2, v163));
        }
        sub_2263AD568((uint64_t)v211);
        objc_msgSend_addObject_(v177, v165, (uint64_t)v162, v166);

      }
      else
      {
        do
        {
          *(_QWORD *)&v219 = 0;
          v217 = 0u;
          v218 = 0u;
          v144 = 3 * *(_QWORD *)v143;
          LODWORD(v187) = 0;
          v214 = (unint64_t)&v187;
          sub_2263AD210((unint64_t *)&v217, v144, (_DWORD **)&v214);
          sub_2263AC688(v143);
          v145 = (int *)*((_QWORD *)v143 + 4);
          sub_2263AC688(v143);
          v146 = *((_QWORD *)v143 + 4) + 4 * *(_QWORD *)v143;
          if (v145 != (int *)v146)
          {
            v147 = 0;
            do
            {
              v148 = *v145;
              sub_2263AC688((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v202[1]);
              v148 *= 3;
              v149 = *(_DWORD *)(v202[5] + 4 * v148);
              sub_2263AC688((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v217);
              *(_DWORD *)(v219 + v147) = v149;
              sub_2263AC688((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v202[1]);
              v150 = *(_DWORD *)(v202[5] + 4 * (int)v148 + 4);
              sub_2263AC688((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v217);
              *(_DWORD *)(v219 + v147 + 4) = v150;
              sub_2263AC688((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v202[1]);
              LODWORD(v148) = *(_DWORD *)(v202[5] + 4 * (int)v148 + 8);
              sub_2263AC688((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v217);
              *(_DWORD *)(v219 + v147 + 8) = v148;
              ++v145;
              v147 += 12;
            }
            while (v145 != (int *)v146);
          }
          v151 = [USKData alloc];
          v210 = &off_24EDD7D38;
          sub_2263C68F0((uint64_t *)&v209._propName, (uint64_t)&v217);
          v152 = (pxrInternal__aapl__pxrReserved__::Sdf_ValueTypeNamesType *)atomic_load(MEMORY[0x24BEE82A0]);
          if (!v152)
            v152 = sub_2263B1434(MEMORY[0x24BEE82A0]);
          pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken((pxrInternal__aapl__pxrReserved__::Sdf_ValueTypeNamesType *)((char *)v152 + 464));
          v154 = (void *)objc_msgSend_initWithVtValue_typeName_(v151, v153, (uint64_t)&v209._propName, (uint64_t)&v178);
          if ((v178 & 7) != 0)
          {
            v155 = (unsigned int *)(v178 & 0xFFFFFFFFFFFFFFF8);
            do
              v156 = __ldxr(v155);
            while (__stlxr(v156 - 2, v155));
          }
          sub_2263AD568((uint64_t)&v209._propName);
          objc_msgSend_addObject_(v177, v157, (uint64_t)v154, v158);

          sub_2263AC71C((uint64_t)&v217);
          v143 = (pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)((char *)v143 + 40);
        }
        while (v143 != v142);
      }
      v167 = v177;
      *(_QWORD *)&v217 = v188;
      sub_2263E4504((void ***)&v217);
      MEMORY[0x2276975A0](&v189);
      *(_QWORD *)&v217 = &v195;
      sub_2263E41A0((void ***)&v217);
      sub_2263AD568((uint64_t)&v223);
      *(_QWORD *)&v217 = &v203;
      sub_2263E4114((void ***)&v217);
      sub_2263AC71C((uint64_t)&v202[1]);
      sub_2263AC71C((uint64_t)&v200);
      *(_QWORD *)&v217 = (char *)&v198 + 8;
      sub_2263E4090((void ***)&v217);
      if ((v198 & 7) != 0)
      {
        v168 = (unsigned int *)(v198 & 0xFFFFFFFFFFFFFFF8);
        do
          v169 = __ldxr(v168);
        while (__stlxr(v169 - 2, v168));
      }
      goto LABEL_149;
    }
  }
  else
  {

  }
  NSLog(CFSTR("Error: object is missing topology or points information"));
  v39 = v177;
LABEL_149:
  if (((uint64_t)v209._proxyPrimPath._propPart._poolHandle & 7) != 0)
  {
    v170 = (unsigned int *)((unint64_t)v209._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
    do
      v171 = __ldxr(v170);
    while (__stlxr(v171 - 2, v170));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v209._proxyPrimPath);
  if (v209._prim._p.px)
    sub_2263DA640((uint64_t)v209._prim._p.px);
  v18 = v177;
LABEL_155:

  return v177;
}

@end
