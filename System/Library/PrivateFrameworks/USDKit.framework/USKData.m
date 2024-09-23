@implementation USKData

- (VtValue)value
{
  _QWORD *v2;
  _QWORD *v3;
  _TypeInfo *v4;
  VtValue result;

  v3 = sub_2263B0700(v2, &self->_value._storage);
  result._info._ptrAndBits = v4;
  result._storage = (type)v3;
  return result;
}

- (USKData)initWithVtValue:(VtValue)a3 typeName:(TfToken)a4
{
  _TypeInfo *ptrAndBits;
  pxrInternal__aapl__pxrReserved__::VtValue *storage;
  const char *v7;
  uint64_t v8;
  USKData *v9;
  unsigned int *v10;
  unsigned int *v11;
  unsigned int v12;
  uint64_t v13;
  NSString *type;
  unsigned int *v15;
  unsigned int v16;
  USKData *v17;
  unsigned int *v19;
  objc_super v20;

  ptrAndBits = a3._info._ptrAndBits;
  storage = (pxrInternal__aapl__pxrReserved__::VtValue *)a3._storage;
  sub_2263F8F84();
  v20.receiver = self;
  v20.super_class = (Class)USKData;
  v9 = -[USKData init](&v20, sel_init);
  if (v9)
  {
    v10 = *(unsigned int **)ptrAndBits;
    v19 = v10;
    if ((v10 & 7) != 0)
    {
      v11 = (unsigned int *)((unint64_t)v10 & 0xFFFFFFFFFFFFFFF8);
      do
        v12 = __ldxr(v11);
      while (__stxr(v12 + 2, v11));
      if ((v12 & 1) == 0)
        v19 = v11;
    }
    objc_msgSend_dataTypeWithTfToken_(USKToken, v7, (uint64_t)&v19, v8);
    v13 = objc_claimAutoreleasedReturnValue();
    type = v9->_type;
    v9->_type = (NSString *)v13;

    if ((v19 & 7) != 0)
    {
      v15 = (unsigned int *)((unint64_t)v19 & 0xFFFFFFFFFFFFFFF8);
      do
        v16 = __ldxr(v15);
      while (__stlxr(v16 - 2, v15));
    }
    sub_2263B2DCC(&v9->_value._storage, storage);
    v9->_arraySize = pxrInternal__aapl__pxrReserved__::VtValue::_GetNumElements(storage);
    v17 = v9;
  }

  return v9;
}

- (USKData)initWithVtValue:(VtValue)a3 typeName:(TfToken)a4 withNodeOwner:(id)a5
{
  _TypeInfo *ptrAndBits;
  pxrInternal__aapl__pxrReserved__::VtValue *storage;
  _Rep *v9;
  const char *v10;
  uint64_t v11;
  USKData *v12;
  unsigned int *v13;
  unsigned int *v14;
  unsigned int v15;
  uint64_t v16;
  NSString *type;
  unsigned int *v18;
  unsigned int v19;
  USKData *v20;
  unsigned int *v22;
  objc_super v23;

  ptrAndBits = a3._info._ptrAndBits;
  storage = (pxrInternal__aapl__pxrReserved__::VtValue *)a3._storage;
  v9 = a4._rep._ptrAndBits;
  sub_2263F8F84();
  v23.receiver = self;
  v23.super_class = (Class)USKData;
  v12 = -[USKData init](&v23, sel_init);
  if (v12)
  {
    v13 = *(unsigned int **)ptrAndBits;
    v22 = v13;
    if ((v13 & 7) != 0)
    {
      v14 = (unsigned int *)((unint64_t)v13 & 0xFFFFFFFFFFFFFFF8);
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 2, v14));
      if ((v15 & 1) == 0)
        v22 = v14;
    }
    objc_msgSend_dataTypeWithTfToken_(USKToken, v10, (uint64_t)&v22, v11);
    v16 = objc_claimAutoreleasedReturnValue();
    type = v12->_type;
    v12->_type = (NSString *)v16;

    if ((v22 & 7) != 0)
    {
      v18 = (unsigned int *)((unint64_t)v22 & 0xFFFFFFFFFFFFFFF8);
      do
        v19 = __ldxr(v18);
      while (__stlxr(v19 - 2, v18));
    }
    sub_2263B2DCC(&v12->_value._storage, storage);
    v12->_arraySize = pxrInternal__aapl__pxrReserved__::VtValue::_GetNumElements(storage);
    objc_storeStrong((id *)&v12->_nodeOwner, a4._rep._ptrAndBits);
    v20 = v12;
  }

  return v12;
}

- (USKData)initWithVtValue:(VtValue)a3 typeName:(TfToken)a4 withSceneOwner:(id)a5
{
  _TypeInfo *ptrAndBits;
  pxrInternal__aapl__pxrReserved__::VtValue *storage;
  _Rep *v9;
  const char *v10;
  uint64_t v11;
  USKData *v12;
  unsigned int *v13;
  unsigned int *v14;
  unsigned int v15;
  uint64_t v16;
  NSString *type;
  unsigned int *v18;
  unsigned int v19;
  USKData *v20;
  unsigned int *v22;
  objc_super v23;

  ptrAndBits = a3._info._ptrAndBits;
  storage = (pxrInternal__aapl__pxrReserved__::VtValue *)a3._storage;
  v9 = a4._rep._ptrAndBits;
  sub_2263F8F84();
  v23.receiver = self;
  v23.super_class = (Class)USKData;
  v12 = -[USKData init](&v23, sel_init);
  if (v12)
  {
    v13 = *(unsigned int **)ptrAndBits;
    v22 = v13;
    if ((v13 & 7) != 0)
    {
      v14 = (unsigned int *)((unint64_t)v13 & 0xFFFFFFFFFFFFFFF8);
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 2, v14));
      if ((v15 & 1) == 0)
        v22 = v14;
    }
    objc_msgSend_dataTypeWithTfToken_(USKToken, v10, (uint64_t)&v22, v11);
    v16 = objc_claimAutoreleasedReturnValue();
    type = v12->_type;
    v12->_type = (NSString *)v16;

    if ((v22 & 7) != 0)
    {
      v18 = (unsigned int *)((unint64_t)v22 & 0xFFFFFFFFFFFFFFF8);
      do
        v19 = __ldxr(v18);
      while (__stlxr(v19 - 2, v18));
    }
    sub_2263B2DCC(&v12->_value._storage, storage);
    v12->_arraySize = pxrInternal__aapl__pxrReserved__::VtValue::_GetNumElements(storage);
    objc_storeStrong((id *)&v12->_sceneOwner, a4._rep._ptrAndBits);
    v20 = v12;
  }

  return v12;
}

- (USKData)initWithVtValue:(VtValue)a3 typeName:(TfToken)a4 withPropertyOwner:(id)a5
{
  _TypeInfo *ptrAndBits;
  pxrInternal__aapl__pxrReserved__::VtValue *storage;
  _Rep *v9;
  const char *v10;
  uint64_t v11;
  USKData *v12;
  unsigned int *v13;
  unsigned int *v14;
  unsigned int v15;
  uint64_t v16;
  NSString *type;
  unsigned int *v18;
  unsigned int v19;
  USKData *v20;
  unsigned int *v22;
  objc_super v23;

  ptrAndBits = a3._info._ptrAndBits;
  storage = (pxrInternal__aapl__pxrReserved__::VtValue *)a3._storage;
  v9 = a4._rep._ptrAndBits;
  sub_2263F8F84();
  v23.receiver = self;
  v23.super_class = (Class)USKData;
  v12 = -[USKData init](&v23, sel_init);
  if (v12)
  {
    v13 = *(unsigned int **)ptrAndBits;
    v22 = v13;
    if ((v13 & 7) != 0)
    {
      v14 = (unsigned int *)((unint64_t)v13 & 0xFFFFFFFFFFFFFFF8);
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 2, v14));
      if ((v15 & 1) == 0)
        v22 = v14;
    }
    objc_msgSend_dataTypeWithTfToken_(USKToken, v10, (uint64_t)&v22, v11);
    v16 = objc_claimAutoreleasedReturnValue();
    type = v12->_type;
    v12->_type = (NSString *)v16;

    if ((v22 & 7) != 0)
    {
      v18 = (unsigned int *)((unint64_t)v22 & 0xFFFFFFFFFFFFFFF8);
      do
        v19 = __ldxr(v18);
      while (__stlxr(v19 - 2, v18));
    }
    sub_2263B2DCC(&v12->_value._storage, storage);
    v12->_arraySize = pxrInternal__aapl__pxrReserved__::VtValue::_GetNumElements(storage);
    objc_storeStrong((id *)&v12->_propertyOwner, a4._rep._ptrAndBits);
    v20 = v12;
  }

  return v12;
}

- (NSData)dataNoCopy
{
  VtValue *p_value;
  uint64_t NumElements;
  pxrInternal__aapl__pxrReserved__::TfType *ElementTypeid;
  const std::type_info *v6;
  pxrInternal__aapl__pxrReserved__::TfType *v7;
  uint64_t v8;
  void *v9;
  _TypeInfo *ptrAndBits;
  uint64_t v11;
  const char *v12;
  void *v13;

  p_value = &self->_value;
  if (pxrInternal__aapl__pxrReserved__::VtValue::IsArrayValued((pxrInternal__aapl__pxrReserved__::VtValue *)&self->_value))
  {
    NumElements = pxrInternal__aapl__pxrReserved__::VtValue::_GetNumElements((pxrInternal__aapl__pxrReserved__::VtValue *)p_value);
    ElementTypeid = (pxrInternal__aapl__pxrReserved__::TfType *)pxrInternal__aapl__pxrReserved__::VtValue::GetElementTypeid((pxrInternal__aapl__pxrReserved__::VtValue *)p_value);
    v7 = (pxrInternal__aapl__pxrReserved__::TfType *)pxrInternal__aapl__pxrReserved__::TfType::_FindByTypeid(ElementTypeid, v6);
    v8 = pxrInternal__aapl__pxrReserved__::TfType::GetSizeof(v7) * NumElements;
    v9 = (void *)MEMORY[0x24BDBCE50];
    ptrAndBits = self->_value._info._ptrAndBits;
    if ((ptrAndBits & 4) != 0)
      v11 = (*(uint64_t (**)(VtValue *))(((unint64_t)ptrAndBits & 0xFFFFFFFFFFFFFFF8) + 168))(p_value);
    else
      v11 = sub_2263BE404((uint64_t *)p_value);
    objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v9, v12, *(_QWORD *)(v11 + 32), v8, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  return (NSData *)v13;
}

- (id)tokenValue
{
  int v2;
  USKToken *v3;
  const char *v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  void *v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int *v14;
  unsigned int *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  sub_2263B0700(v16, &self->_value._storage);
  v2 = sub_2263B34F8((pxrInternal__aapl__pxrReserved__::VtValue *)v16, &v15);
  sub_2263AD568((uint64_t)v16);
  if (v2)
  {
    v3 = [USKToken alloc];
    v14 = v15;
    if ((v15 & 7) != 0)
    {
      v6 = (unsigned int *)((unint64_t)v15 & 0xFFFFFFFFFFFFFFF8);
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 2, v6));
      if ((v7 & 1) == 0)
        v14 = v6;
    }
    v8 = (void *)objc_msgSend_initWithTfToken_(v3, v4, (uint64_t)&v14, v5);
    if ((v14 & 7) != 0)
    {
      v9 = (unsigned int *)((unint64_t)v14 & 0xFFFFFFFFFFFFFFF8);
      do
        v10 = __ldxr(v9);
      while (__stlxr(v10 - 2, v9));
    }
  }
  else
  {
    v8 = 0;
  }
  if ((v15 & 7) != 0)
  {
    v11 = (unsigned int *)((unint64_t)v15 & 0xFFFFFFFFFFFFFFF8);
    do
      v12 = __ldxr(v11);
    while (__stlxr(v12 - 2, v11));
  }
  return v8;
}

- (id)stringValue
{
  __CFString *type;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD **v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t String;
  int v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *__p;
  _BYTE *v24;
  uint64_t v25;
  __int128 v26;
  _OWORD v27[4];
  void *v28[2];
  __int128 v29;
  __int128 v30;
  _BYTE v31[144];
  uint64_t v32;
  void **p_p;

  v32 = 0;
  v30 = 0u;
  memset(v31, 0, sizeof(v31));
  *(_OWORD *)v28 = 0u;
  v29 = 0u;
  memset(v27, 0, sizeof(v27));
  v26 = 0u;
  sub_2263B38C0((uint64_t)&v26);
  type = (__CFString *)self->_type;
  if (type == CFSTR("asset"))
  {
    v4 = sub_2263B39EC((pxrInternal__aapl__pxrReserved__::VtValue *)&self->_value);
    v5 = *(char *)(v4 + 23);
    if (v5 >= 0)
      v6 = v4;
    else
      v6 = *(_QWORD *)v4;
    if (v5 >= 0)
      v7 = *(unsigned __int8 *)(v4 + 23);
    else
      v7 = *(_QWORD *)(v4 + 8);
    sub_2263B0814(v27, v6, v7);
  }
  else if (type == CFSTR("rel"))
  {
    v8 = (_DWORD **)sub_2263B3A54((pxrInternal__aapl__pxrReserved__::VtValue *)&self->_value);
    __p = 0;
    v24 = 0;
    v25 = 0;
    sub_2263BE178(&__p, *v8, v8[1], ((char *)v8[1] - (char *)*v8) >> 3);
    sub_2263B0814(v27, (uint64_t)"[", 1);
    v9 = (char *)__p;
    if (v24 != __p)
    {
      v10 = 0;
      v11 = 0;
      do
      {
        String = pxrInternal__aapl__pxrReserved__::SdfPath::GetString((pxrInternal__aapl__pxrReserved__::SdfPath *)&v9[v10]);
        v13 = *(char *)(String + 23);
        if (v13 >= 0)
          v14 = String;
        else
          v14 = *(_QWORD *)String;
        if (v13 >= 0)
          v15 = *(unsigned __int8 *)(String + 23);
        else
          v15 = *(_QWORD *)(String + 8);
        sub_2263B0814(v27, v14, v15);
        v9 = (char *)__p;
        v16 = (v24 - (_BYTE *)__p) >> 3;
        if (v16 - 1 > v11)
        {
          sub_2263B0814(v27, (uint64_t)", ", 2);
          v9 = (char *)__p;
          v16 = (v24 - (_BYTE *)__p) >> 3;
        }
        ++v11;
        v10 += 8;
      }
      while (v16 > v11);
    }
    sub_2263B0814(v27, (uint64_t)"]", 1);
    p_p = &__p;
    sub_2263BE380(&p_p);
  }
  else
  {
    pxrInternal__aapl__pxrReserved__::operator<<();
  }
  v17 = (void *)MEMORY[0x24BDD17C8];
  std::stringbuf::str();
  if (v25 >= 0)
    objc_msgSend_stringWithUTF8String_(v17, v18, (uint64_t)&__p, v19);
  else
    objc_msgSend_stringWithUTF8String_(v17, v18, (uint64_t)__p, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v25) < 0)
    operator delete(__p);
  *(_QWORD *)&v26 = *MEMORY[0x24BEDB7F0];
  v21 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)&v27[-1] + *(_QWORD *)(v26 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  *(_QWORD *)&v27[0] = v21;
  *((_QWORD *)&v27[0] + 1) = MEMORY[0x24BEDB848] + 16;
  if (SHIBYTE(v29) < 0)
    operator delete(v28[1]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x2276980B0](v31);
  return v20;
}

- (id)timeCodeValue
{
  int v2;
  USKTimeCode *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9 = 0.0;
  sub_2263B0700(v10, &self->_value._storage);
  v2 = sub_2263B3BF4((pxrInternal__aapl__pxrReserved__::VtValue *)v10, &v9);
  sub_2263AD568((uint64_t)v10);
  if (v2)
  {
    v3 = [USKTimeCode alloc];
    v7 = (void *)objc_msgSend_initWithSdfTimeCode_(v3, v4, v5, v6, v9);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)BOOLValue
{
  char v2;
  char v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  sub_2263B0700(v5, &self->_value._storage);
  v2 = sub_2263B3D84((pxrInternal__aapl__pxrReserved__::VtValue *)v5, &v4);
  sub_2263AD568((uint64_t)v5);
  if (v4)
    return v2;
  else
    return 0;
}

- (int)intValue
{
  int v2;
  int v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  sub_2263B0700(v5, &self->_value._storage);
  v2 = sub_2263B3F14((pxrInternal__aapl__pxrReserved__::VtValue *)v5, &v4);
  sub_2263AD568((uint64_t)v5);
  if (v2)
    return v4;
  else
    return 0;
}

- (unsigned)uintValue
{
  int v2;
  unsigned int v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  sub_2263B0700(v5, &self->_value._storage);
  v2 = sub_2263B40A4((pxrInternal__aapl__pxrReserved__::VtValue *)v5, &v4);
  sub_2263AD568((uint64_t)v5);
  if (v2)
    return v4;
  else
    return 0;
}

- (float)floatValue
{
  int v2;
  float result;
  float v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4 = 0.0;
  sub_2263B0700(v5, &self->_value._storage);
  v2 = sub_2263B4238((pxrInternal__aapl__pxrReserved__::VtValue *)v5, &v4);
  sub_2263AD568((uint64_t)v5);
  result = v4;
  if (!v2)
    return 0.0;
  return result;
}

- (int8x8_t)float2Value
{
  int v1;
  unsigned int v2;
  int8x8_t v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  sub_2263B0700(v5, (_QWORD *)(a1 + 8));
  v1 = sub_2263B43D0((pxrInternal__aapl__pxrReserved__::VtValue *)v5, &v4);
  sub_2263AD568((uint64_t)v5);
  if (v1)
    v2 = -1;
  else
    v2 = 0;
  return vand_s8(v4, (int8x8_t)vdup_n_s32(v2));
}

- (double)float3Value
{
  int v1;
  unsigned int v2;
  double result;
  int8x16_t v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4.i32[2] = 0;
  v4.i64[0] = 0;
  sub_2263B0700(v5, (_QWORD *)(a1 + 8));
  v1 = sub_2263B4570((pxrInternal__aapl__pxrReserved__::VtValue *)v5, (uint64_t)&v4);
  sub_2263AD568((uint64_t)v5);
  if (v1)
    v2 = -1;
  else
    v2 = 0;
  *(_QWORD *)&result = vbslq_s8((int8x16_t)vdupq_n_s32(v2), v4, (int8x16_t)0).u64[0];
  return result;
}

- (double)float4Value
{
  int v1;
  unsigned int v2;
  double result;
  int8x16_t v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4 = 0uLL;
  sub_2263B0700(v5, (_QWORD *)(a1 + 8));
  v1 = sub_2263B4718((pxrInternal__aapl__pxrReserved__::VtValue *)v5, &v4);
  sub_2263AD568((uint64_t)v5);
  if (v1)
    v2 = -1;
  else
    v2 = 0;
  *(_QWORD *)&result = vandq_s8(v4, (int8x16_t)vdupq_n_s32(v2)).u64[0];
  return result;
}

- (double)float4x4Value
{
  pxrInternal__aapl__pxrReserved__::VtValue *v1;
  int v2;
  __int128 v3;
  uint64_t v4;
  double *v5;
  uint64_t v6;
  __int128 v7;
  float v8;
  __int128 v10;
  _OWORD v11[8];
  _OWORD v12[4];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  memset(v11, 0, sizeof(v11));
  v1 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_2263B0700(v13, (_QWORD *)(a1 + 8));
  v2 = sub_2263B491C(v1, v11);
  sub_2263AD568((uint64_t)v13);
  v3 = 0uLL;
  if (v2)
  {
    v4 = 0;
    memset(v12, 0, sizeof(v12));
    v5 = (double *)v11;
    do
    {
      v6 = 0;
      v7 = v12[v4];
      do
      {
        v8 = v5[v6];
        v10 = v7;
        *(float *)((unint64_t)&v10 & 0xFFFFFFFFFFFFFFF3 | (4 * (v6 & 3))) = v8;
        v7 = v10;
        ++v6;
      }
      while (v6 != 4);
      v12[v4++] = v10;
      v5 += 4;
    }
    while (v4 != 4);
    *(_QWORD *)&v3 = *(_QWORD *)&v12[0];
  }
  return *(double *)&v3;
}

- (double)doubleValue
{
  int v2;
  double result;
  double v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4 = 0.0;
  sub_2263B0700(v5, &self->_value._storage);
  v2 = sub_2263B4AE0((pxrInternal__aapl__pxrReserved__::VtValue *)v5, &v4);
  sub_2263AD568((uint64_t)v5);
  result = v4;
  if (!v2)
    return 0.0;
  return result;
}

- (double)double2Value
{
  int v1;
  unint64_t v2;
  double result;
  int8x16_t v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4 = 0uLL;
  sub_2263B0700(v5, (_QWORD *)(a1 + 8));
  v1 = sub_2263B4C78((pxrInternal__aapl__pxrReserved__::VtValue *)v5, &v4);
  sub_2263AD568((uint64_t)v5);
  if (v1)
    v2 = -1;
  else
    v2 = 0;
  *(_QWORD *)&result = vandq_s8(v4, (int8x16_t)vdupq_n_s64(v2)).u64[0];
  return result;
}

- (int8x16_t)double3Value
{
  int v3;
  __int128 v4;
  int8x16_t result;
  unint64_t v6;
  int8x16_t v7;
  uint64_t v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v7 = 0uLL;
  v8 = 0;
  sub_2263B0700(v9, (_QWORD *)(a1 + 8));
  v3 = sub_2263B4E38((pxrInternal__aapl__pxrReserved__::VtValue *)v9, (uint64_t)&v7);
  sub_2263AD568((uint64_t)v9);
  if (v3)
  {
    result = v7;
    *(_QWORD *)&v4 = v8;
    v6 = vextq_s8(result, result, 8uLL).u64[0];
  }
  else
  {
    result.i64[0] = 0;
    v6 = 0;
    *(_QWORD *)&v4 = 0;
  }
  result.i64[1] = v6;
  *(int8x16_t *)a2 = result;
  *(_OWORD *)(a2 + 16) = v4;
  return result;
}

- (uint64_t)double4Value
{
  int v3;
  uint64_t result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  sub_2263B0700(v9, (_QWORD *)(a1 + 8));
  v3 = sub_2263B4FF8((pxrInternal__aapl__pxrReserved__::VtValue *)v9, &v7);
  result = sub_2263AD568((uint64_t)v9);
  v5 = 0uLL;
  v6 = 0uLL;
  if (v3)
  {
    v5 = v7;
    v6 = v8;
  }
  *a2 = v5;
  a2[1] = v6;
  return result;
}

- (double)double4x4Value
{
  pxrInternal__aapl__pxrReserved__::VtValue *v3;
  int v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  double result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_2263B0700(v18, (_QWORD *)(a1 + 8));
  v4 = sub_2263B491C(v3, &v10);
  sub_2263AD568((uint64_t)v18);
  if (v4)
  {
    v5 = v11;
    *a2 = v10;
    a2[1] = v5;
    v6 = v13;
    a2[2] = v12;
    a2[3] = v6;
    v7 = v15;
    a2[4] = v14;
    a2[5] = v7;
    result = *(double *)&v16;
    v9 = v17;
    a2[6] = v16;
    a2[7] = v9;
  }
  else
  {
    result = 0.0;
    a2[6] = 0u;
    a2[7] = 0u;
    a2[4] = 0u;
    a2[5] = 0u;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

- (double)quatfValue
{
  int v1;
  unsigned int v2;
  double result;
  int8x16_t v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4 = 0uLL;
  sub_2263B0700(v5, (_QWORD *)(a1 + 8));
  v1 = sub_2263B52A0((pxrInternal__aapl__pxrReserved__::VtValue *)v5, &v4);
  sub_2263AD568((uint64_t)v5);
  if (v1)
    v2 = -1;
  else
    v2 = 0;
  *(_QWORD *)&result = vandq_s8(v4, (int8x16_t)vdupq_n_s32(v2)).u64[0];
  return result;
}

- (id)objectPathValue
{
  USKObjectPath *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  int v8;
  int v9;
  uint64_t v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
  sub_2263B0700(v11, &self->_value._storage);
  LODWORD(self) = sub_2263B54EC((pxrInternal__aapl__pxrReserved__::VtValue *)v11, (uint64_t)&v10);
  sub_2263AD568((uint64_t)v11);
  if ((_DWORD)self)
  {
    v3 = [USKObjectPath alloc];
    sub_2263BDDD8(&v8, &v10);
    sub_2263BDE28(&v9, (_DWORD *)&v10 + 1);
    v6 = (void *)objc_msgSend_initWithSdfPath_(v3, v4, (uint64_t)&v8, v5);
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v8);
  }
  else
  {
    v6 = 0;
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v10);
  return v6;
}

- (id)urlValue
{
  VtValue *p_value;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v15[2];
  void *__p[2];
  __int128 v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)__p = 0u;
  v17 = 0u;
  *(_OWORD *)v15 = 0u;
  pxrInternal__aapl__pxrReserved__::SdfAssetPath::SdfAssetPath((pxrInternal__aapl__pxrReserved__::SdfAssetPath *)v15);
  p_value = &self->_value;
  sub_2263B0700(v18, p_value);
  v4 = sub_2263B5788((pxrInternal__aapl__pxrReserved__::VtValue *)v18, (std::string *)v15);
  sub_2263AD568((uint64_t)v18);
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCF48];
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = sub_2263B39EC((pxrInternal__aapl__pxrReserved__::VtValue *)p_value);
    if (*(char *)(v7 + 23) >= 0)
      objc_msgSend_stringWithUTF8String_(v6, v8, v7, v9);
    else
      objc_msgSend_stringWithUTF8String_(v6, v8, *(_QWORD *)v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURLWithPath_(v5, v11, (uint64_t)v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  if (SHIBYTE(v17) < 0)
    operator delete(__p[1]);
  if (SHIBYTE(__p[0]) < 0)
    operator delete(v15[0]);
  return v13;
}

- (id)resourcePath
{
  pxrInternal__aapl__pxrReserved__::VtValue *v3;
  const char *v4;
  uint64_t v5;
  USKResourcePath *v6;
  void *v7;
  void *v9[2];
  void *v10;
  __int128 __p;
  void *v12;
  void *v13[2];
  void *v14[4];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  memset(v14, 0, sizeof(v14));
  *(_OWORD *)v13 = 0u;
  pxrInternal__aapl__pxrReserved__::SdfAssetPath::SdfAssetPath((pxrInternal__aapl__pxrReserved__::SdfAssetPath *)v13);
  v3 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_2263B0700(v15, &self->_value._storage);
  LODWORD(self) = sub_2263B5788(v3, (std::string *)v13);
  sub_2263AD568((uint64_t)v15);
  if ((_DWORD)self)
  {
    v6 = [USKResourcePath alloc];
    if (SHIBYTE(v14[0]) < 0)
    {
      sub_2263AE36C(v9, v13[0], (unint64_t)v13[1]);
    }
    else
    {
      *(_OWORD *)v9 = *(_OWORD *)v13;
      v10 = v14[0];
    }
    if (SHIBYTE(v14[3]) < 0)
    {
      sub_2263AE36C(&__p, v14[1], (unint64_t)v14[2]);
    }
    else
    {
      __p = *(_OWORD *)&v14[1];
      v12 = v14[3];
    }
    v7 = (void *)objc_msgSend_initWithSdfAssetPath_(v6, v4, (uint64_t)v9, v5);
    if (SHIBYTE(v12) < 0)
      operator delete((void *)__p);
    if (SHIBYTE(v10) < 0)
      operator delete(v9[0]);
  }
  else
  {
    v7 = 0;
  }
  if (SHIBYTE(v14[3]) < 0)
    operator delete(v14[1]);
  if (SHIBYTE(v14[0]) < 0)
    operator delete(v13[0]);
  return v7;
}

- (unint64_t)intArray:(int *)a3 maxCount:(unint64_t)a4
{
  pxrInternal__aapl__pxrReserved__::VtValue *v6;
  int v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  void *__src;
  __int128 v15;
  __int128 v16;
  char *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  v6 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_2263B0700(v18, &self->_value._storage);
  v7 = sub_2263B5BE0(v6, (uint64_t)&v15);
  sub_2263AD568((uint64_t)v18);
  if (v7)
  {
    v12 = v15;
    v13 = v16;
    __src = v17;
    if (v17)
    {
      v8 = (unint64_t *)(v17 - 16);
      if (*((_QWORD *)&v13 + 1))
        v8 = (unint64_t *)*((_QWORD *)&v13 + 1);
      do
        v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }
    v10 = v12;
    sub_2263AC688((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v12);
    if (v10 < a4)
      a4 = v10;
    memcpy(a3, __src, 4 * a4);
    sub_2263AC71C((uint64_t)&v12);
  }
  else
  {
    a4 = 0;
  }
  sub_2263AC71C((uint64_t)&v15);
  return a4;
}

- (unint64_t)uintArray:(unsigned int *)a3 maxCount:(unint64_t)a4
{
  pxrInternal__aapl__pxrReserved__::VtValue *v6;
  int v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  void *__src;
  __int128 v15;
  __int128 v16;
  char *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  v6 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_2263B0700(v18, &self->_value._storage);
  v7 = sub_2263B5E30(v6, (uint64_t)&v15);
  sub_2263AD568((uint64_t)v18);
  if (v7)
  {
    v12 = v15;
    v13 = v16;
    __src = v17;
    if (v17)
    {
      v8 = (unint64_t *)(v17 - 16);
      if (*((_QWORD *)&v13 + 1))
        v8 = (unint64_t *)*((_QWORD *)&v13 + 1);
      do
        v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }
    v10 = v12;
    sub_2263C6BCC((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v12);
    if (v10 < a4)
      a4 = v10;
    memcpy(a3, __src, 4 * a4);
    sub_2263AC71C((uint64_t)&v12);
  }
  else
  {
    a4 = 0;
  }
  sub_2263AC71C((uint64_t)&v15);
  return a4;
}

- (unint64_t)quatfArray:(id *)a3 maxCount:(unint64_t)a4
{
  int v6;
  uint64_t v7;
  _OWORD v9[2];
  uint64_t v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  memset(v9, 0, sizeof(v9));
  sub_2263B0700(v11, &self->_value._storage);
  v6 = sub_2263B6044((pxrInternal__aapl__pxrReserved__::VtValue *)v11, (uint64_t)v9);
  sub_2263AD568((uint64_t)v11);
  if (v6)
  {
    if (*(_QWORD *)&v9[0] < a4)
      a4 = *(_QWORD *)&v9[0];
    if (a4)
    {
      v7 = 0;
      do
      {
        sub_2263C092C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v9);
        *((_OWORD *)a3 + v7) = *(_OWORD *)(v10 + 16 * v7);
        ++v7;
      }
      while (a4 != v7);
    }
  }
  else
  {
    a4 = 0;
  }
  sub_2263AC71C((uint64_t)v9);
  return a4;
}

- (id)stringArray
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;

  objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], a2, self->_arraySize, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((__CFString *)self->_type == CFSTR("string[]"))
  {
    v5 = sub_2263B6230((pxrInternal__aapl__pxrReserved__::VtValue *)&self->_value);
    if (self->_arraySize)
    {
      v8 = v5;
      v9 = 0;
      v10 = 0;
      do
      {
        v11 = *(_QWORD *)(v8 + 32) + v9;
        if (*(char *)(v11 + 23) < 0)
          v11 = *(_QWORD *)v11;
        objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v6, v11, v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v4, v13, (uint64_t)v12, v14);

        ++v10;
        v9 += 24;
      }
      while (v10 < self->_arraySize);
    }
  }
  return v4;
}

- (id)tokenArray
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  USKToken *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  unsigned int *v17;
  unsigned int v18;
  uint64_t v20;

  objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], a2, self->_arraySize, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((__CFString *)self->_type == CFSTR("token[]"))
  {
    v5 = sub_2263B63F0((pxrInternal__aapl__pxrReserved__::VtValue *)&self->_value);
    if (self->_arraySize)
    {
      v6 = v5;
      v7 = 0;
      do
      {
        v8 = [USKToken alloc];
        v11 = *(_QWORD *)(*(_QWORD *)(v6 + 32) + 8 * v7);
        v20 = v11;
        if ((v11 & 7) != 0)
        {
          v12 = (unsigned int *)(v11 & 0xFFFFFFFFFFFFFFF8);
          do
            v13 = __ldxr(v12);
          while (__stxr(v13 + 2, v12));
          if ((v13 & 1) == 0)
            v20 &= 0xFFFFFFFFFFFFFFF8;
        }
        v14 = (void *)objc_msgSend_initWithTfToken_(v8, v9, (uint64_t)&v20, v10);
        objc_msgSend_addObject_(v4, v15, (uint64_t)v14, v16);

        if ((v20 & 7) != 0)
        {
          v17 = (unsigned int *)(v20 & 0xFFFFFFFFFFFFFFF8);
          do
            v18 = __ldxr(v17);
          while (__stlxr(v18 - 2, v17));
        }
        ++v7;
      }
      while (v7 < self->_arraySize);
    }
  }
  return v4;
}

- (id)pathArray
{
  uint64_t v2;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  USKObjectPath *v9;
  _DWORD *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  int v16;
  int v17;

  if ((__CFString *)self->_type != CFSTR("rel"))
    return (id)objc_opt_new();
  objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], a2, self->_arraySize, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)sub_2263B3A54((pxrInternal__aapl__pxrReserved__::VtValue *)&self->_value);
  if (v6[1] != *v6)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = [USKObjectPath alloc];
      v10 = (_DWORD *)(*v6 + v7);
      sub_2263BDDD8(&v16, v10);
      sub_2263BDE28(&v17, v10 + 1);
      v13 = (void *)objc_msgSend_initWithSdfPath_(v9, v11, (uint64_t)&v16, v12);
      objc_msgSend_addObject_(v5, v14, (uint64_t)v13, v15);

      pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
      sub_2263BDE64((uint64_t)&v16);
      ++v8;
      v7 += 8;
    }
    while (v8 < (uint64_t)(v6[1] - *v6) >> 3);
  }
  return v5;
}

- (id)resourcePathArray
{
  uint64_t v2;
  void *v5;
  unint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  const char *v9;
  uint64_t v10;
  USKResourcePath *v11;
  unint64_t v12;
  __int128 *v13;
  __int128 v14;
  void **v15;
  __int128 v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20[2];
  uint64_t v21;
  __int128 __p;
  uint64_t v23;

  if ((__CFString *)self->_type != CFSTR("asset[]"))
    return (id)objc_opt_new();
  objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], a2, self->_arraySize, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t *)sub_2263B6768((pxrInternal__aapl__pxrReserved__::VtValue *)&self->_value);
  if (*v6)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v11 = [USKResourcePath alloc];
      v12 = v6[4];
      v13 = (__int128 *)(v12 + v7);
      if (*(char *)(v12 + v7 + 23) < 0)
      {
        sub_2263AE36C(v20, *(void **)v13, *((_QWORD *)v13 + 1));
      }
      else
      {
        v14 = *v13;
        v21 = *((_QWORD *)v13 + 2);
        *(_OWORD *)v20 = v14;
      }
      v15 = (void **)(v12 + v7 + 24);
      if (*(char *)(v12 + v7 + 47) < 0)
      {
        sub_2263AE36C(&__p, *v15, *(_QWORD *)(v12 + v7 + 32));
      }
      else
      {
        v16 = *(_OWORD *)v15;
        v23 = *(_QWORD *)(v12 + v7 + 40);
        __p = v16;
      }
      v17 = (void *)objc_msgSend_initWithSdfAssetPath_(v11, v9, (uint64_t)v20, v10);
      objc_msgSend_addObject_(v5, v18, (uint64_t)v17, v19);

      if (SHIBYTE(v23) < 0)
        operator delete((void *)__p);
      if (SHIBYTE(v21) < 0)
        operator delete(v20[0]);
      ++v8;
      v7 += 48;
    }
    while (v8 < *v6);
  }
  return v5;
}

- (unint64_t)floatArray:(float *)a3 maxCount:(unint64_t)a4
{
  pxrInternal__aapl__pxrReserved__::VtValue *v6;
  int v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  void *__src;
  __int128 v15;
  __int128 v16;
  char *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  v6 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_2263B0700(v18, &self->_value._storage);
  v7 = sub_2263B6924(v6, (uint64_t)&v15);
  sub_2263AD568((uint64_t)v18);
  if (v7)
  {
    v12 = v15;
    v13 = v16;
    __src = v17;
    if (v17)
    {
      v8 = (unint64_t *)(v17 - 16);
      if (*((_QWORD *)&v13 + 1))
        v8 = (unint64_t *)*((_QWORD *)&v13 + 1);
      do
        v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }
    v10 = v12;
    sub_2263CA3A4((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v12);
    if (v10 < a4)
      a4 = v10;
    memcpy(a3, __src, 4 * a4);
    sub_2263AC71C((uint64_t)&v12);
  }
  else
  {
    a4 = 0;
  }
  sub_2263AC71C((uint64_t)&v15);
  return a4;
}

- (unint64_t)float2Array:(USKData *)self maxCount:(SEL)a2
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t i;
  _OWORD v9[2];
  uint64_t v10;
  _QWORD v11[3];

  v4 = v3;
  v5 = v2;
  v11[2] = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  memset(v9, 0, sizeof(v9));
  sub_2263B0700(v11, &self->_value._storage);
  v6 = sub_2263B6B38((pxrInternal__aapl__pxrReserved__::VtValue *)v11, (uint64_t)v9);
  sub_2263AD568((uint64_t)v11);
  if (v6)
  {
    if (*(_QWORD *)&v9[0] < v4)
      v4 = *(_QWORD *)&v9[0];
    if (v4)
    {
      for (i = 0; i != v4; ++i)
      {
        sub_2263C11DC((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v9);
        *(_QWORD *)(v5 + 8 * i) = *(_QWORD *)(v10 + 8 * i);
      }
    }
  }
  else
  {
    v4 = 0;
  }
  sub_2263AC71C((uint64_t)v9);
  return v4;
}

- (unint64_t)float3Array:(USKData *)self maxCount:(SEL)a2
{
  _OWORD *v2;
  unint64_t v3;
  unint64_t v4;
  _OWORD *v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  _OWORD v11[2];
  uint64_t v12;
  _QWORD v13[3];

  v4 = v3;
  v5 = v2;
  v13[2] = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  memset(v11, 0, sizeof(v11));
  sub_2263B0700(v13, &self->_value._storage);
  v6 = sub_2263B6D58((pxrInternal__aapl__pxrReserved__::VtValue *)v13, (uint64_t)v11);
  sub_2263AD568((uint64_t)v13);
  if (v6)
  {
    if (*(_QWORD *)&v11[0] < v4)
      v4 = *(_QWORD *)&v11[0];
    if (v4)
    {
      v7 = 0;
      v8 = v4;
      do
      {
        sub_2263B1F74((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v11);
        *(_QWORD *)&v9 = *(_QWORD *)(v12 + v7);
        DWORD2(v9) = *(_DWORD *)(v12 + v7 + 8);
        *v5++ = v9;
        v7 += 12;
        --v8;
      }
      while (v8);
    }
  }
  else
  {
    v4 = 0;
  }
  sub_2263AC71C((uint64_t)v11);
  return v4;
}

- (unint64_t)float4Array:(USKData *)self maxCount:(SEL)a2
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t i;
  _OWORD v9[2];
  uint64_t v10;
  _QWORD v11[3];

  v4 = v3;
  v5 = v2;
  v11[2] = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  memset(v9, 0, sizeof(v9));
  sub_2263B0700(v11, &self->_value._storage);
  v6 = sub_2263B6F6C((pxrInternal__aapl__pxrReserved__::VtValue *)v11, (uint64_t)v9);
  sub_2263AD568((uint64_t)v11);
  if (v6)
  {
    if (*(_QWORD *)&v9[0] < v4)
      v4 = *(_QWORD *)&v9[0];
    if (v4)
    {
      for (i = 0; i != v4; ++i)
      {
        sub_2263B1E44((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v9);
        *(_OWORD *)(v5 + 16 * i) = *(_OWORD *)(v10 + 16 * i);
      }
    }
  }
  else
  {
    v4 = 0;
  }
  sub_2263AC71C((uint64_t)v9);
  return v4;
}

- (unint64_t)float4x4Array:(id *)a3 maxCount:(unint64_t)a4
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  float v14;
  __int128 v16;
  _OWORD v17[2];
  uint64_t v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v18 = 0;
  memset(v17, 0, sizeof(v17));
  sub_2263B0700(v19, &self->_value._storage);
  v6 = sub_2263B71D0((pxrInternal__aapl__pxrReserved__::VtValue *)v19, (uint64_t)v17);
  sub_2263AD568((uint64_t)v19);
  if (v6)
  {
    if (*(_QWORD *)&v17[0] < a4)
      a4 = *(_QWORD *)&v17[0];
    if (a4)
    {
      v7 = 0;
      v8 = 0;
      do
      {
        sub_2263C1908((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v17);
        v9 = 0;
        v10 = (char *)a3 + 64 * v8;
        v11 = v18 + v7;
        do
        {
          v12 = 0;
          v13 = *(_OWORD *)&v10[16 * v9];
          do
          {
            v14 = *(double *)(v11 + 8 * v12);
            v16 = v13;
            *(float *)((unint64_t)&v16 & 0xFFFFFFFFFFFFFFF3 | (4 * (v12 & 3))) = v14;
            v13 = v16;
            *(_OWORD *)&v10[16 * v9] = v16;
            ++v12;
          }
          while (v12 != 4);
          ++v9;
          v11 += 32;
        }
        while (v9 != 4);
        ++v8;
        v7 += 128;
      }
      while (v8 != a4);
    }
  }
  else
  {
    a4 = 0;
  }
  sub_2263AC71C((uint64_t)v17);
  return a4;
}

- (unint64_t)doubleArray:(double *)a3 maxCount:(unint64_t)a4
{
  pxrInternal__aapl__pxrReserved__::VtValue *v6;
  int v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  void *__src;
  __int128 v15;
  __int128 v16;
  char *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  v6 = (pxrInternal__aapl__pxrReserved__::VtValue *)sub_2263B0700(v18, &self->_value._storage);
  v7 = sub_2263B7420(v6, (uint64_t)&v15);
  sub_2263AD568((uint64_t)v18);
  if (v7)
  {
    v12 = v15;
    v13 = v16;
    __src = v17;
    if (v17)
    {
      v8 = (unint64_t *)(v17 - 16);
      if (*((_QWORD *)&v13 + 1))
        v8 = (unint64_t *)*((_QWORD *)&v13 + 1);
      do
        v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }
    v10 = v12;
    sub_2263CB26C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v12);
    if (v10 < a4)
      a4 = v10;
    memcpy(a3, __src, 8 * a4);
    sub_2263AC71C((uint64_t)&v12);
  }
  else
  {
    a4 = 0;
  }
  sub_2263AC71C((uint64_t)&v15);
  return a4;
}

- (unint64_t)double2Array:(USKData *)self maxCount:(SEL)a2
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t i;
  _OWORD v9[2];
  uint64_t v10;
  _QWORD v11[3];

  v4 = v3;
  v5 = v2;
  v11[2] = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  memset(v9, 0, sizeof(v9));
  sub_2263B0700(v11, &self->_value._storage);
  v6 = sub_2263B7634((pxrInternal__aapl__pxrReserved__::VtValue *)v11, (uint64_t)v9);
  sub_2263AD568((uint64_t)v11);
  if (v6)
  {
    if (*(_QWORD *)&v9[0] < v4)
      v4 = *(_QWORD *)&v9[0];
    if (v4)
    {
      for (i = 0; i != v4; ++i)
      {
        sub_2263C1FD8((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v9);
        *(_OWORD *)(v5 + 16 * i) = *(_OWORD *)(v10 + 16 * i);
      }
    }
  }
  else
  {
    v4 = 0;
  }
  sub_2263AC71C((uint64_t)v9);
  return v4;
}

- (unint64_t)double3Array:(USKData *)self maxCount:(SEL)a2
{
  _OWORD *v2;
  unint64_t v3;
  unint64_t v4;
  _OWORD *v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  _OWORD v11[2];
  uint64_t v12;
  _QWORD v13[3];

  v4 = v3;
  v5 = v2;
  v13[2] = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  memset(v11, 0, sizeof(v11));
  sub_2263B0700(v13, &self->_value._storage);
  v6 = sub_2263B785C((pxrInternal__aapl__pxrReserved__::VtValue *)v13, (uint64_t)v11);
  sub_2263AD568((uint64_t)v13);
  if (v6)
  {
    if (*(_QWORD *)&v11[0] < v4)
      v4 = *(_QWORD *)&v11[0];
    if (v4)
    {
      v7 = 0;
      v8 = v4;
      do
      {
        sub_2263C23C8((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v11);
        *(_QWORD *)&v9 = *(_QWORD *)(v12 + v7 + 16);
        *v5 = *(_OWORD *)(v12 + v7);
        v5[1] = v9;
        v5 += 2;
        v7 += 24;
        --v8;
      }
      while (v8);
    }
  }
  else
  {
    v4 = 0;
  }
  sub_2263AC71C((uint64_t)v11);
  return v4;
}

- (unint64_t)double4Array:(USKData *)self maxCount:(SEL)a2
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  _OWORD *v10;
  _OWORD v12[2];
  uint64_t v13;
  _QWORD v14[3];

  v4 = v3;
  v5 = v2;
  v14[2] = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  memset(v12, 0, sizeof(v12));
  sub_2263B0700(v14, &self->_value._storage);
  v6 = sub_2263B7A88((pxrInternal__aapl__pxrReserved__::VtValue *)v14, (uint64_t)v12);
  sub_2263AD568((uint64_t)v14);
  if (v6)
  {
    if (*(_QWORD *)&v12[0] < v4)
      v4 = *(_QWORD *)&v12[0];
    if (v4)
    {
      v7 = 0;
      v8 = v4;
      do
      {
        sub_2263C27D4((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v12);
        v9 = *(_OWORD *)(v13 + v7 + 16);
        v10 = (_OWORD *)(v5 + v7);
        *v10 = *(_OWORD *)(v13 + v7);
        v10[1] = v9;
        v7 += 32;
        --v8;
      }
      while (v8);
    }
  }
  else
  {
    v4 = 0;
  }
  sub_2263AC71C((uint64_t)v12);
  return v4;
}

- (unint64_t)double4x4Array:(id *)a3 maxCount:(unint64_t)a4
{
  int v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD *v16;
  _OWORD v18[2];
  uint64_t v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  memset(v18, 0, sizeof(v18));
  sub_2263B0700(v20, &self->_value._storage);
  v6 = sub_2263B71D0((pxrInternal__aapl__pxrReserved__::VtValue *)v20, (uint64_t)v18);
  sub_2263AD568((uint64_t)v20);
  if (v6)
  {
    if (*(_QWORD *)&v18[0] < a4)
      a4 = *(_QWORD *)&v18[0];
    if (a4)
    {
      v7 = 112;
      v8 = a4;
      do
      {
        sub_2263C1908((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v18);
        v9 = *(_OWORD *)(v19 + v7 - 96);
        v10 = *(_OWORD *)(v19 + v7 - 80);
        v11 = *(_OWORD *)(v19 + v7 - 64);
        v12 = *(_OWORD *)(v19 + v7 - 48);
        v13 = *(_OWORD *)(v19 + v7 - 32);
        v14 = *(_OWORD *)(v19 + v7 - 16);
        v15 = *(_OWORD *)(v19 + v7);
        v16 = (_OWORD *)((char *)a3 + v7);
        *(v16 - 7) = *(_OWORD *)(v19 + v7 - 112);
        *(v16 - 6) = v9;
        *(v16 - 5) = v10;
        *(v16 - 4) = v11;
        *(v16 - 3) = v12;
        *(v16 - 2) = v13;
        *(v16 - 1) = v14;
        *v16 = v15;
        v7 += 128;
        --v8;
      }
      while (v8);
    }
  }
  else
  {
    a4 = 0;
  }
  sub_2263AC71C((uint64_t)v18);
  return a4;
}

- (void)setValue:(VtValue)a3
{
  pxrInternal__aapl__pxrReserved__::VtValue *storage;
  unint64_t NumElements;
  uint64_t Type;
  const std::type_info *Typeid;
  pxrInternal__aapl__pxrReserved__::VtValue *v8;
  const std::type_info *v9;
  pxrInternal__aapl__pxrReserved__::VtValue *v10;
  pxrInternal__aapl__pxrReserved__::VtValue *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  storage = (pxrInternal__aapl__pxrReserved__::VtValue *)a3._storage;
  v14 = *MEMORY[0x24BDAC8D0];
  if (pxrInternal__aapl__pxrReserved__::VtValue::IsArrayValued(*(pxrInternal__aapl__pxrReserved__::VtValue **)&a3._storage))
    NumElements = pxrInternal__aapl__pxrReserved__::VtValue::_GetNumElements(storage);
  else
    NumElements = 0;
  Type = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&self->_value);
  if (Type == pxrInternal__aapl__pxrReserved__::VtValue::GetType(storage))
  {
    sub_2263B0058(&self->_value._storage, storage);
    self->_arraySize = NumElements;
  }
  else
  {
    v12 = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&self->_value);
    Typeid = (const std::type_info *)pxrInternal__aapl__pxrReserved__::TfType::GetTypeid((pxrInternal__aapl__pxrReserved__::TfType *)&v12);
    v8 = (pxrInternal__aapl__pxrReserved__::VtValue *)pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid(storage);
    if (pxrInternal__aapl__pxrReserved__::VtValue::_CanCast(v8, Typeid, v9))
    {
      v12 = 0;
      v13 = 0;
      v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid((pxrInternal__aapl__pxrReserved__::VtValue *)&self->_value);
      v11 = sub_2263BDFC4(storage, v10);
      sub_2263B0700(&v12, v11);
      if (v13)
      {
        sub_2263B0058(&self->_value._storage, &v12);
        self->_arraySize = NumElements;
      }
      sub_2263AD568((uint64_t)&v12);
    }
  }
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
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v8 = v4;
  if (v4)
  {
    objc_msgSend_token(v4, v5, v6, v7);
    v15 = v13;
    v16 = (char *)&off_24EDD7038 + 1;
    if ((v13 & 7) != 0)
    {
      v9 = (unsigned int *)(v13 & 0xFFFFFFFFFFFFFFF8);
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 2, v9));
      if ((v10 & 1) == 0)
        v15 = v13 & 0xFFFFFFFFFFFFFFF8;
    }
  }
  else
  {
    v13 = 0;
    v15 = 0;
    v16 = (char *)&off_24EDD7038 + 1;
  }
  objc_msgSend_setValue_(self, v5, (uint64_t)&v15, v7, v13);
  sub_2263AD568((uint64_t)&v15);
  if ((v14 & 7) != 0)
  {
    v11 = (unsigned int *)(v14 & 0xFFFFFFFFFFFFFFF8);
    do
      v12 = __ldxr(v11);
    while (__stlxr(v12 - 2, v11));
  }

}

- (void)setStringValue:(id)a3
{
  id v4;
  void *v5;
  __CFString *type;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  const char *v27;
  uint64_t v28;
  _QWORD v29[2];
  char v30;
  void *v31[2];
  char v32;
  void *__p;
  char v34;
  char *v35[2];
  int v36;
  int v37;
  char *v38;
  uint64_t v39[3];

  v39[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  type = (__CFString *)self->_type;
  if (type == CFSTR("string") || type == CFSTR("token"))
  {
    v8 = objc_retainAutorelease(v4);
    v31[0] = (void *)objc_msgSend_UTF8String(v8, v9, v10, v11);
    v39[1] = 0;
    sub_2263C2AC0(v39, (char **)v31);
    objc_msgSend_setValue_(self, v12, (uint64_t)v39, v13);
    sub_2263AD568((uint64_t)v39);
  }
  else if (type == CFSTR("rel"))
  {
    v22 = objc_retainAutorelease(v4);
    v26 = (char *)objc_msgSend_UTF8String(v22, v23, v24, v25);
    sub_2263AE2A8(v31, v26);
    MEMORY[0x2276976B4](v29, v31);
    v38 = (char *)&off_24EDD71B8 + 1;
    sub_2263BDDD8(&v36, v29);
    sub_2263BDE28(&v37, (_DWORD *)v29 + 1);
    objc_msgSend_setValue_(self, v27, (uint64_t)&v36, v28);
    sub_2263AD568((uint64_t)&v36);
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)v29);
    if (v32 < 0)
    {
      v21 = v31[0];
      goto LABEL_17;
    }
  }
  else if (type == CFSTR("asset"))
  {
    v14 = objc_retainAutorelease(v4);
    v18 = (char *)objc_msgSend_UTF8String(v14, v15, v16, v17);
    sub_2263AE2A8(v29, v18);
    MEMORY[0x227697264](v31, v29);
    v35[1] = (char *)&off_24EDD7270;
    sub_2263C3860(v35, (__int128 *)v31);
    objc_msgSend_setValue_(self, v19, (uint64_t)v35, v20);
    sub_2263AD568((uint64_t)v35);
    if (v34 < 0)
      operator delete(__p);
    if (v32 < 0)
      operator delete(v31[0]);
    if (v30 < 0)
    {
      v21 = (void *)v29[0];
LABEL_17:
      operator delete(v21);
    }
  }

}

- (void)setTimeCodeValue:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sdfTimeCode(a3, a2, (uint64_t)a3, v3);
  v8[1] = (char *)&off_24EDD7328 + 1;
  v8[0] = v5;
  objc_msgSend_setValue_(self, v6, (uint64_t)v8, v7);
  sub_2263AD568((uint64_t)v8);
}

- (void)setBoolValue:(BOOL)a3
{
  uint64_t v3;
  BOOL v4[8];
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5 = &unk_24EDD73E3;
  v4[0] = a3;
  objc_msgSend_setValue_(self, a2, (uint64_t)v4, v3);
  sub_2263AD568((uint64_t)v4);
}

- (void)setIntValue:(int)a3
{
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5 = &unk_24EDD749B;
  v4 = a3;
  objc_msgSend_setValue_(self, a2, (uint64_t)&v4, v3);
  sub_2263AD568((uint64_t)&v4);
}

- (void)setUIntValue:(unsigned int)a3
{
  uint64_t v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5 = &unk_24EDD7553;
  v4 = a3;
  objc_msgSend_setValue_(self, a2, (uint64_t)&v4, v3);
  sub_2263AD568((uint64_t)&v4);
}

- (void)setObjectPathValue:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v8 = v4;
  if (v4)
    objc_msgSend_path(v4, v5, v6, v7);
  else
    v11 = 0;
  v14 = (char *)&off_24EDD71B8 + 1;
  sub_2263BDDD8(&v12, &v11);
  sub_2263BDE28(&v13, (_DWORD *)&v11 + 1);
  objc_msgSend_setValue_(self, v9, (uint64_t)&v12, v10);
  sub_2263AD568((uint64_t)&v12);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v11);

}

- (void)setURLValue:(id)a3
{
  uint64_t v3;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  const char *v10;
  uint64_t v11;
  void *v12[2];
  char v13;
  void *v14[2];
  char v15;
  void *__p;
  char v17;
  char *v18[3];

  v18[2] = *(char **)MEMORY[0x24BDAC8D0];
  objc_msgSend_path(a3, a2, (uint64_t)a3, v3);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (char *)objc_msgSend_UTF8String(v5, v6, v7, v8);
  sub_2263AE2A8(v12, v9);
  MEMORY[0x227697264](v14, v12);
  v18[1] = (char *)&off_24EDD7270;
  sub_2263C3860(v18, (__int128 *)v14);
  objc_msgSend_setValue_(self, v10, (uint64_t)v18, v11);
  sub_2263AD568((uint64_t)v18);
  if (v17 < 0)
    operator delete(__p);
  if (v15 < 0)
    operator delete(v14[0]);
  if (v13 < 0)
    operator delete(v12[0]);

}

- (void)setResourcePath:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  const char *v9;
  uint64_t v10;
  void *__p[2];
  char v12;
  void *v13[2];
  void *v14[2];
  __int128 v15;
  char *v16[3];

  v16[2] = *(char **)MEMORY[0x24BDAC8D0];
  *(_OWORD *)v14 = 0u;
  v15 = 0u;
  *(_OWORD *)v13 = 0u;
  v4 = objc_retainAutorelease(a3);
  v8 = (char *)objc_msgSend_UTF8String(v4, v5, v6, v7);
  sub_2263AE2A8(__p, v8);
  MEMORY[0x227697264](v13, __p);
  if (v12 < 0)
    operator delete(__p[0]);
  v16[1] = (char *)&off_24EDD7270;
  sub_2263C3860(v16, (__int128 *)v13);
  objc_msgSend_setValue_(self, v9, (uint64_t)v16, v10);
  sub_2263AD568((uint64_t)v16);
  if (SHIBYTE(v15) < 0)
    operator delete(v14[1]);
  if (SHIBYTE(v14[0]) < 0)
    operator delete(v13[0]);

}

- (void)setFloatValue:(float)a3
{
  uint64_t v3;
  float v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5 = &unk_24EDD760B;
  v4 = a3;
  objc_msgSend_setValue_(self, a2, (uint64_t)&v4, v3);
  sub_2263AD568((uint64_t)&v4);
}

- (void)setFloat2Value:(USKData *)self
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v4[1] = (char *)&off_24EDD76C0 + 3;
  v4[0] = v3;
  objc_msgSend_setValue_(self, a2, (uint64_t)v4, v2);
  sub_2263AD568((uint64_t)v4);
}

- (void)setFloat3Value:(USKData *)self
{
  __int128 v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  __int128 v9;
  _QWORD v10[3];

  v9 = v2;
  v10[2] = *MEMORY[0x24BDAC8D0];
  v10[1] = (char *)&off_24EDD7778 + 2;
  v4 = operator new();
  *(_QWORD *)v4 = v9;
  *(_DWORD *)(v4 + 8) = DWORD2(v9);
  v7 = (unsigned int *)(v4 + 12);
  atomic_store(0, (unsigned int *)(v4 + 12));
  v10[0] = v4;
  do
    v8 = __ldxr(v7);
  while (__stxr(v8 + 1, v7));
  objc_msgSend_setValue_(self, v5, (uint64_t)v10, v6);
  sub_2263AD568((uint64_t)v10);
}

- (void)setFloat4Value:(USKData *)self
{
  __int128 v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  __int128 v9;
  _QWORD v10[3];

  v9 = v2;
  v10[2] = *MEMORY[0x24BDAC8D0];
  v10[1] = (char *)&off_24EDD7830 + 2;
  v4 = operator new();
  *(_OWORD *)v4 = v9;
  v7 = (unsigned int *)(v4 + 16);
  atomic_store(0, (unsigned int *)(v4 + 16));
  v10[0] = v4;
  do
    v8 = __ldxr(v7);
  while (__stxr(v8 + 1, v7));
  objc_msgSend_setValue_(self, v5, (uint64_t)v10, v6);
  sub_2263AD568((uint64_t)v10);
}

- (void)setDoubleValue:(double)a3
{
  uint64_t v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v4[1] = &unk_24EDD78EB;
  *(double *)v4 = a3;
  objc_msgSend_setValue_(self, a2, (uint64_t)v4, v3);
  sub_2263AD568((uint64_t)v4);
}

- (void)setDouble2Value:(USKData *)self
{
  __int128 v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  __int128 v9;
  _QWORD v10[3];

  v9 = v2;
  v10[2] = *MEMORY[0x24BDAC8D0];
  v10[1] = (char *)&off_24EDD79A0 + 2;
  v4 = operator new();
  *(_OWORD *)v4 = v9;
  v7 = (unsigned int *)(v4 + 16);
  atomic_store(0, (unsigned int *)(v4 + 16));
  v10[0] = v4;
  do
    v8 = __ldxr(v7);
  while (__stxr(v8 + 1, v7));
  objc_msgSend_setValue_(self, v5, (uint64_t)v10, v6);
  sub_2263AD568((uint64_t)v10);
}

- (void)setDouble3Value:(USKData *)self
{
  __int128 *v2;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  __int128 v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10 = *v2;
  v4 = *((_QWORD *)v2 + 2);
  v11[1] = (char *)&off_24EDD7A58 + 2;
  v5 = operator new();
  *(_OWORD *)v5 = v10;
  *(_QWORD *)(v5 + 16) = v4;
  v8 = (unsigned int *)(v5 + 24);
  atomic_store(0, (unsigned int *)(v5 + 24));
  v11[0] = v5;
  do
    v9 = __ldxr(v8);
  while (__stxr(v9 + 1, v8));
  objc_msgSend_setValue_(self, v6, (uint64_t)v11, v7);
  sub_2263AD568((uint64_t)v11);
}

- (void)setDouble4Value:(USKData *)self
{
  __int128 *v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  __int128 v9;
  __int128 v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v9 = *v2;
  v10 = v2[1];
  v11[1] = (char *)&off_24EDD7B10 + 2;
  v4 = operator new();
  *(_OWORD *)v4 = v9;
  *(_OWORD *)(v4 + 16) = v10;
  v7 = (unsigned int *)(v4 + 32);
  atomic_store(0, (unsigned int *)(v4 + 32));
  v11[0] = v4;
  do
    v8 = __ldxr(v7);
  while (__stxr(v8 + 1, v7));
  objc_msgSend_setValue_(self, v5, (uint64_t)v11, v6);
  sub_2263AD568((uint64_t)v11);
}

- (uint64_t)setDouble4x4Value:(__int128 *)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v17 = a3[1];
  v13 = *a3;
  v16 = a3[3];
  v11 = a3[4];
  v12 = a3[2];
  v14 = a3[7];
  v15 = a3[5];
  v10 = a3[6];
  v18[1] = (char *)&off_24EDD7BC8 + 2;
  v4 = operator new();
  *(_OWORD *)v4 = v13;
  *(_OWORD *)(v4 + 16) = v17;
  *(_OWORD *)(v4 + 32) = v12;
  *(_OWORD *)(v4 + 48) = v16;
  *(_OWORD *)(v4 + 64) = v11;
  *(_OWORD *)(v4 + 80) = v15;
  *(_OWORD *)(v4 + 96) = v10;
  *(_OWORD *)(v4 + 112) = v14;
  v7 = (unsigned int *)(v4 + 128);
  atomic_store(0, (unsigned int *)(v4 + 128));
  v18[0] = v4;
  do
    v8 = __ldxr(v7);
  while (__stxr(v8 + 1, v7));
  objc_msgSend_setValue_(a1, v5, (uint64_t)v18, v6);
  return sub_2263AD568((uint64_t)v18);
}

- (uint64_t)setQuatfValue:(void *)a1
{
  __n128 *v3;
  const char *v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v10[1] = &off_24EDD7C80;
  v3 = (__n128 *)operator new();
  *v3 = a2;
  v6 = (unsigned int *)&v3[1];
  atomic_store(0, (unsigned int *)&v3[1]);
  v10[0] = v3;
  do
    v7 = __ldxr(v6);
  while (__stxr(v7 + 1, v6));
  objc_msgSend_setValue_(a1, v4, (uint64_t)v10, v5);
  return sub_2263AD568((uint64_t)v10);
}

- (void)setIntArray:(int *)a3 count:(unint64_t)a4
{
  const char *v7;
  uint64_t v8;
  _OWORD v9[2];
  void *__dst;
  uint64_t v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  __dst = 0;
  memset(v9, 0, sizeof(v9));
  sub_2263AA560((uint64_t)v9, a4);
  sub_2263AC688((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v9);
  memcpy(__dst, a3, 4 * a4);
  v11[1] = (uint64_t)&off_24EDD7D38;
  sub_2263C68F0(v11, (uint64_t)v9);
  objc_msgSend_setValue_(self, v7, (uint64_t)v11, v8);
  sub_2263AD568((uint64_t)v11);
  sub_2263AC71C((uint64_t)v9);
}

- (void)setUIntArray:(unsigned int *)a3 count:(unint64_t)a4
{
  const char *v7;
  uint64_t v8;
  _OWORD v9[2];
  void *__dst;
  uint64_t v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  __dst = 0;
  memset(v9, 0, sizeof(v9));
  sub_2263B911C((uint64_t)v9, a4);
  sub_2263C6BCC((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v9);
  memcpy(__dst, a3, 4 * a4);
  v11[1] = (uint64_t)&off_24EDD7DF0;
  sub_2263C68F0(v11, (uint64_t)v9);
  objc_msgSend_setValue_(self, v7, (uint64_t)v11, v8);
  sub_2263AD568((uint64_t)v11);
  sub_2263AC71C((uint64_t)v9);
}

- (void)setQuatfArray:(id *)a3 count:(unint64_t)a4
{
  const char *v7;
  uint64_t v8;
  _OWORD v9[2];
  void *__dst;
  uint64_t v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  __dst = 0;
  memset(v9, 0, sizeof(v9));
  sub_2263B9294((uint64_t)v9, a4);
  sub_2263C092C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v9);
  memcpy(__dst, a3, 16 * a4);
  v11[1] = (uint64_t)off_24EDD7EA8;
  sub_2263B131C(v11, (uint64_t)v9);
  objc_msgSend_setValue_(self, v7, (uint64_t)v11, v8);
  sub_2263AD568((uint64_t)v11);
  sub_2263AC71C((uint64_t)v9);
}

- (void)setStringArray:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __CFString *type;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t k;
  const char *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  __int128 v24;
  void **v25;
  __int128 v26;
  unint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t i;
  const char *v33;
  uint64_t v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t j;
  const char *v48;
  uint64_t v49;
  id v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void **v55;
  unsigned int *v56;
  unsigned int v57;
  unint64_t v58;
  unsigned int *v59;
  unsigned int v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  id v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84[2];
  char v85;
  void *__p[2];
  _BYTE v87[24];
  uint64_t v88;
  void *v89[2];
  __int128 v90;
  uint64_t v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v8 = v4;
  type = (__CFString *)self->_type;
  if (type == CFSTR("string[]"))
  {
    *(_OWORD *)__p = 0u;
    memset(v87, 0, sizeof(v87));
    v27 = objc_msgSend_count(v4, v5, v6, v7);
    sub_2263B9998((uint64_t)__p, v27);
    v31 = 0;
    for (i = 0; i < objc_msgSend_count(v8, v28, v29, v30); ++i)
    {
      objc_msgSend_objectAtIndexedSubscript_(v8, v33, i, v34);
      v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v39 = objc_msgSend_UTF8String(v35, v36, v37, v38);
      sub_2263C7C48((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)__p);
      MEMORY[0x227697FCC](*(_QWORD *)&v87[16] + v31, v39);

      v31 += 24;
    }
    v89[0] = 0;
    v89[1] = &off_24EDD7F60;
    sub_2263B131C((uint64_t *)v89, (uint64_t)__p);
    sub_2263B0058(&self->_value._storage, v89);
    self->_arraySize = objc_msgSend_count(v8, v40, v41, v42);
    sub_2263AD568((uint64_t)v89);
    sub_2263C7974(__p);
  }
  else if (type == CFSTR("token[]"))
  {
    *(_OWORD *)__p = 0u;
    memset(v87, 0, sizeof(v87));
    v43 = objc_msgSend_count(v4, v5, v6, v7);
    sub_2263B9A2C((uint64_t)__p, v43);
    for (j = 0; j < objc_msgSend_count(v8, v44, v45, v46); ++j)
    {
      objc_msgSend_objectAtIndexedSubscript_(v8, v48, j, v49);
      v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v54 = objc_msgSend_UTF8String(v50, v51, v52, v53);
      MEMORY[0x2276976D8](v89, v54);
      sub_2263C8708((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)__p);
      v55 = (void **)(*(_QWORD *)&v87[16] + 8 * j);
      if (v89 == v55)
      {
        v58 = (unint64_t)v89[0];
      }
      else
      {
        if (((unint64_t)*v55 & 7) != 0)
        {
          v56 = (unsigned int *)((unint64_t)*v55 & 0xFFFFFFFFFFFFFFF8);
          do
            v57 = __ldxr(v56);
          while (__stlxr(v57 - 2, v56));
        }
        v58 = 0;
        *v55 = v89[0];
        v89[0] = 0;
      }
      if ((v58 & 7) != 0)
      {
        v59 = (unsigned int *)(v58 & 0xFFFFFFFFFFFFFFF8);
        do
          v60 = __ldxr(v59);
        while (__stlxr(v60 - 2, v59));
      }

    }
    v89[0] = 0;
    v89[1] = off_24EDD8018;
    sub_2263B131C((uint64_t *)v89, (uint64_t)__p);
    sub_2263B0058(&self->_value._storage, v89);
    self->_arraySize = objc_msgSend_count(v8, v61, v62, v63);
    sub_2263AD568((uint64_t)v89);
    sub_2263C8530(__p);
  }
  else if (type == CFSTR("rel"))
  {
    *(_OWORD *)__p = 0u;
    memset(v87, 0, sizeof(v87));
    v64 = objc_msgSend_count(v4, v5, v6, v7);
    sub_2263B9ADC((uint64_t)__p, v64);
    v68 = 0;
    v69 = 4;
    while (v68 < objc_msgSend_count(v8, v65, v66, v67))
    {
      objc_msgSend_objectAtIndexedSubscript_(v8, v70, v68, v71);
      v72 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v76 = (char *)objc_msgSend_UTF8String(v72, v73, v74, v75);
      sub_2263AE2A8(v89, v76);
      MEMORY[0x2276976B4](v84, v89);
      sub_2263C9010((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)__p);
      v77 = *(_QWORD *)&v87[16] + v69;
      sub_2263BE05C(*(_QWORD *)&v87[16] + v69 - 4, (int *)v84);
      sub_2263BE0B0(v77);
      pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
      sub_2263BDE64((uint64_t)v84);
      if (SBYTE7(v90) < 0)
        operator delete(v89[0]);

      ++v68;
      v69 += 8;
    }
    v89[0] = 0;
    v89[1] = &off_24EDD80D0;
    sub_2263B131C((uint64_t *)v89, (uint64_t)__p);
    sub_2263B0058(&self->_value._storage, v89);
    self->_arraySize = objc_msgSend_count(v8, v78, v79, v80);
    sub_2263AD568((uint64_t)v89);
    sub_2263C8DF4(__p);
  }
  else if (type == CFSTR("asset[]"))
  {
    v91 = 0;
    *(_OWORD *)v89 = 0u;
    v90 = 0u;
    v10 = objc_msgSend_count(v4, v5, v6, v7);
    sub_2263B9B90((uint64_t)v89, v10);
    v14 = 0;
    for (k = 0; k < objc_msgSend_count(v8, v11, v12, v13); ++k)
    {
      objc_msgSend_objectAtIndexedSubscript_(v8, v16, k, v17);
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v22 = (char *)objc_msgSend_UTF8String(v18, v19, v20, v21);
      sub_2263AE2A8(v84, v22);
      MEMORY[0x227697264](__p, v84);
      sub_2263C9B84((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v89);
      v23 = v91 + v14;
      if (*(char *)(v91 + v14 + 23) < 0)
        operator delete(*(void **)v23);
      v24 = *(_OWORD *)__p;
      *(_QWORD *)(v23 + 16) = *(_QWORD *)v87;
      *(_OWORD *)v23 = v24;
      v87[7] = 0;
      LOBYTE(__p[0]) = 0;
      v25 = (void **)(v23 + 24);
      if (*(char *)(v23 + 47) < 0)
        operator delete(*v25);
      v26 = *(_OWORD *)&v87[8];
      *(_QWORD *)(v23 + 40) = v88;
      *(_OWORD *)v25 = v26;
      HIBYTE(v88) = 0;
      v87[8] = 0;
      if ((v87[7] & 0x80000000) != 0)
        operator delete(__p[0]);
      if (v85 < 0)
        operator delete(v84[0]);

      v14 += 48;
    }
    __p[0] = 0;
    __p[1] = off_24EDD81A0;
    sub_2263B131C((uint64_t *)__p, (uint64_t)v89);
    sub_2263B0058(&self->_value._storage, __p);
    self->_arraySize = objc_msgSend_count(v8, v81, v82, v83);
    sub_2263AD568((uint64_t)__p);
    sub_2263C97A0(v89);
  }

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
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  _OWORD v29[2];
  uint64_t v30;
  uint64_t v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v30 = 0;
  memset(v29, 0, sizeof(v29));
  v8 = objc_msgSend_count(v4, v5, v6, v7);
  sub_2263B9A2C((uint64_t)v29, v8);
  for (i = 0; i < objc_msgSend_count(v4, v9, v10, v11); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(v4, v13, i, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v15;
    if (v15)
      objc_msgSend_token(v15, v16, v17, v18);
    else
      v28 = 0;
    sub_2263C8708((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v29);
    v20 = (uint64_t *)(v30 + 8 * i);
    if (&v28 == v20)
    {
      v23 = v28;
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
      *v20 = v28;
      v28 = 0;
    }
    if ((v23 & 7) != 0)
    {
      v24 = (unsigned int *)(v23 & 0xFFFFFFFFFFFFFFF8);
      do
        v25 = __ldxr(v24);
      while (__stlxr(v25 - 2, v24));
    }

  }
  v31[1] = (uint64_t)off_24EDD8018;
  sub_2263B131C(v31, (uint64_t)v29);
  objc_msgSend_setValue_(self, v26, (uint64_t)v31, v27);
  sub_2263AD568((uint64_t)v31);
  sub_2263C8530(v29);

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
  const char *v25;
  uint64_t v26;
  void *v27[2];
  char v28;
  void *__p[2];
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  _OWORD v33[2];
  uint64_t v34;
  uint64_t v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v34 = 0;
  memset(v33, 0, sizeof(v33));
  v8 = objc_msgSend_count(v4, v5, v6, v7);
  sub_2263B9B90((uint64_t)v33, v8);
  v12 = 0;
  for (i = 0; i < objc_msgSend_count(v4, v9, v10, v11); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(v4, v14, i, v15);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = (char *)objc_msgSend_UTF8String(v16, v17, v18, v19);
    sub_2263AE2A8(v27, v20);
    MEMORY[0x227697264](__p, v27);
    sub_2263C9B84((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v33);
    v21 = v34 + v12;
    if (*(char *)(v34 + v12 + 23) < 0)
      operator delete(*(void **)v21);
    v22 = *(_OWORD *)__p;
    *(_QWORD *)(v21 + 16) = v30;
    *(_OWORD *)v21 = v22;
    HIBYTE(v30) = 0;
    LOBYTE(__p[0]) = 0;
    v23 = (void **)(v21 + 24);
    if (*(char *)(v21 + 47) < 0)
      operator delete(*v23);
    v24 = v31;
    *(_QWORD *)(v21 + 40) = v32;
    *(_OWORD *)v23 = v24;
    HIBYTE(v32) = 0;
    LOBYTE(v31) = 0;
    if (SHIBYTE(v30) < 0)
      operator delete(__p[0]);
    if (v28 < 0)
      operator delete(v27[0]);

    v12 += 48;
  }
  v35[1] = (uint64_t)off_24EDD81A0;
  sub_2263B131C(v35, (uint64_t)v33);
  objc_msgSend_setValue_(self, v25, (uint64_t)v35, v26);
  sub_2263AD568((uint64_t)v35);
  sub_2263C97A0(v33);

}

- (void)setFloatArray:(float *)a3 count:(unint64_t)a4
{
  const char *v7;
  uint64_t v8;
  _OWORD v9[2];
  void *__dst;
  uint64_t v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  __dst = 0;
  memset(v9, 0, sizeof(v9));
  sub_2263BA174((uint64_t)v9, a4);
  sub_2263CA3A4((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v9);
  memcpy(__dst, a3, 4 * a4);
  v11[1] = (uint64_t)&off_24EDD8258;
  sub_2263CA8B4(v11, (uint64_t)v9);
  objc_msgSend_setValue_(self, v7, (uint64_t)v11, v8);
  sub_2263AD568((uint64_t)v11);
  sub_2263AC71C((uint64_t)v9);
}

- (void)setFloat2Array:(USKData *)self count:(SEL)a2
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  _OWORD v11[2];
  uint64_t v12;
  uint64_t v13[3];

  v4 = v3;
  v5 = v2;
  v13[2] = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  memset(v11, 0, sizeof(v11));
  sub_2263BA308((uint64_t)v11, v3);
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      v8 = *(_QWORD *)(v5 + 8 * i);
      sub_2263C11DC((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v11);
      *(_QWORD *)(v12 + 8 * i) = v8;
    }
  }
  v13[1] = (uint64_t)off_24EDD8310;
  sub_2263B131C(v13, (uint64_t)v11);
  objc_msgSend_setValue_(self, v9, (uint64_t)v13, v10);
  sub_2263AD568((uint64_t)v13);
  sub_2263AC71C((uint64_t)v11);
}

- (void)setFloat3Array:(USKData *)self count:(SEL)a2
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;
  _DWORD *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  _OWORD v14[2];
  uint64_t v15;
  uint64_t v16[3];

  v4 = v3;
  v5 = v2;
  v16[2] = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  memset(v14, 0, sizeof(v14));
  sub_2263AFB70((uint64_t)v14, v3);
  if (v4)
  {
    v7 = 0;
    v8 = (_DWORD *)(v5 + 8);
    do
    {
      v9 = *((_QWORD *)v8 - 1);
      v10 = *v8;
      sub_2263B1F74((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v14);
      v11 = v15 + v7;
      *(_QWORD *)v11 = v9;
      *(_DWORD *)(v11 + 8) = v10;
      v8 += 4;
      v7 += 12;
      --v4;
    }
    while (v4);
  }
  v16[1] = (uint64_t)&off_24EDD68F0;
  sub_2263B131C(v16, (uint64_t)v14);
  objc_msgSend_setValue_(self, v12, (uint64_t)v16, v13);
  sub_2263AD568((uint64_t)v16);
  sub_2263AC71C((uint64_t)v14);
}

- (void)setFloat4Array:(USKData *)self count:(SEL)a2
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t i;
  const char *v8;
  uint64_t v9;
  __int128 v10;
  _OWORD v11[2];
  uint64_t v12;
  uint64_t v13[3];

  v4 = v3;
  v5 = v2;
  v13[2] = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  memset(v11, 0, sizeof(v11));
  sub_2263AFB00((uint64_t)v11, v3);
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      v10 = *(_OWORD *)(v5 + 16 * i);
      sub_2263B1E44((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v11);
      *(_OWORD *)(v12 + 16 * i) = v10;
    }
  }
  v13[1] = (uint64_t)&off_24EDD69D0;
  sub_2263B131C(v13, (uint64_t)v11);
  objc_msgSend_setValue_(self, v8, (uint64_t)v13, v9);
  sub_2263AD568((uint64_t)v13);
  sub_2263AC71C((uint64_t)v11);
}

- (void)setDoubleArray:(double *)a3 count:(unint64_t)a4
{
  const char *v7;
  uint64_t v8;
  _OWORD v9[2];
  void *__dst;
  uint64_t v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  __dst = 0;
  memset(v9, 0, sizeof(v9));
  sub_2263BA6DC((uint64_t)v9, a4);
  sub_2263CB26C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v9);
  memcpy(__dst, a3, 8 * a4);
  v11[1] = (uint64_t)&off_24EDD83C8;
  sub_2263CA8B4(v11, (uint64_t)v9);
  objc_msgSend_setValue_(self, v7, (uint64_t)v11, v8);
  sub_2263AD568((uint64_t)v11);
  sub_2263AC71C((uint64_t)v9);
}

- (void)setDouble2Array:(USKData *)self count:(SEL)a2
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t i;
  const char *v8;
  uint64_t v9;
  __int128 v10;
  _OWORD v11[2];
  uint64_t v12;
  uint64_t v13[3];

  v4 = v3;
  v5 = v2;
  v13[2] = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  memset(v11, 0, sizeof(v11));
  sub_2263BA870((uint64_t)v11, v3);
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      v10 = *(_OWORD *)(v5 + 16 * i);
      sub_2263C1FD8((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v11);
      *(_OWORD *)(v12 + 16 * i) = v10;
    }
  }
  v13[1] = (uint64_t)off_24EDD8480;
  sub_2263B131C(v13, (uint64_t)v11);
  objc_msgSend_setValue_(self, v8, (uint64_t)v13, v9);
  sub_2263AD568((uint64_t)v13);
  sub_2263AC71C((uint64_t)v11);
}

- (void)setDouble3Array:(USKData *)self count:(SEL)a2
{
  __int128 *v2;
  unint64_t v3;
  unint64_t v4;
  __int128 *v5;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[2];
  uint64_t v14;
  uint64_t v15[3];

  v4 = v3;
  v5 = v2;
  v15[2] = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  memset(v13, 0, sizeof(v13));
  sub_2263BAA18((uint64_t)v13, v3);
  if (v4)
  {
    v7 = 0;
    do
    {
      v11 = *v5;
      v12 = v5[1];
      sub_2263C23C8((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v13);
      v8 = v14 + v7;
      *(_OWORD *)v8 = v11;
      *(_QWORD *)(v8 + 16) = v12;
      v5 += 2;
      v7 += 24;
      --v4;
    }
    while (v4);
  }
  v15[1] = (uint64_t)off_24EDD8538;
  sub_2263B131C(v15, (uint64_t)v13);
  objc_msgSend_setValue_(self, v9, (uint64_t)v15, v10);
  sub_2263AD568((uint64_t)v15);
  sub_2263AC71C((uint64_t)v13);
}

- (void)setDouble4Array:(USKData *)self count:(SEL)a2
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;
  _OWORD *v8;
  const char *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[2];
  uint64_t v14;
  uint64_t v15[3];

  v4 = v3;
  v5 = v2;
  v15[2] = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  memset(v13, 0, sizeof(v13));
  sub_2263BABC0((uint64_t)v13, v3);
  if (v4)
  {
    v7 = 0;
    do
    {
      v11 = *(_OWORD *)(v5 + v7);
      v12 = *(_OWORD *)(v5 + v7 + 16);
      sub_2263C27D4((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v13);
      v8 = (_OWORD *)(v14 + v7);
      *v8 = v11;
      v8[1] = v12;
      v7 += 32;
      --v4;
    }
    while (v4);
  }
  v15[1] = (uint64_t)off_24EDD85F0;
  sub_2263B131C(v15, (uint64_t)v13);
  objc_msgSend_setValue_(self, v9, (uint64_t)v15, v10);
  sub_2263AD568((uint64_t)v15);
  sub_2263AC71C((uint64_t)v13);
}

- (void)setDouble4x4Array:(id *)a3 count:(unint64_t)a4
{
  unint64_t v4;
  uint64_t v7;
  _OWORD *v8;
  const char *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _OWORD v19[2];
  uint64_t v20;
  uint64_t v21[3];

  v4 = a4;
  v21[2] = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  memset(v19, 0, sizeof(v19));
  sub_2263BADAC((uint64_t)v19, a4);
  if (v4)
  {
    v7 = 0;
    do
    {
      v17 = *(_OWORD *)((char *)a3 + v7 + 48);
      v18 = *(_OWORD *)((char *)a3 + v7 + 16);
      v13 = *(_OWORD *)((char *)a3 + v7 + 32);
      v14 = *(_OWORD *)((char *)a3 + v7);
      v15 = *(_OWORD *)((char *)a3 + v7 + 112);
      v16 = *(_OWORD *)((char *)a3 + v7 + 80);
      v11 = *(_OWORD *)((char *)a3 + v7 + 96);
      v12 = *(_OWORD *)((char *)a3 + v7 + 64);
      sub_2263C1908((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v19);
      v8 = (_OWORD *)(v20 + v7);
      *v8 = v14;
      v8[1] = v18;
      v8[2] = v13;
      v8[3] = v17;
      v8[4] = v12;
      v8[5] = v16;
      v8[6] = v11;
      v8[7] = v15;
      v7 += 128;
      --v4;
    }
    while (v4);
  }
  v21[1] = (uint64_t)off_24EDD86A8;
  sub_2263B131C(v21, (uint64_t)v19);
  objc_msgSend_setValue_(self, v9, (uint64_t)v21, v10);
  sub_2263AD568((uint64_t)v21);
  sub_2263AC71C((uint64_t)v19);
}

- (USKData)initWithToken:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  USKData *v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unint64_t v14;
  objc_super v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2263F8F84();
  v15.receiver = self;
  v15.super_class = (Class)USKData;
  v8 = -[USKData init](&v15, sel_init);
  if (v8)
  {
    if (v4)
    {
      objc_msgSend_token(v4, v5, v6, v7);
      v16 = v14;
      v17 = (char *)&off_24EDD7038 + 1;
      if ((v14 & 7) != 0)
      {
        v9 = (unsigned int *)(v14 & 0xFFFFFFFFFFFFFFF8);
        do
          v10 = __ldxr(v9);
        while (__stxr(v10 + 2, v9));
        if ((v10 & 1) == 0)
          v16 = v14 & 0xFFFFFFFFFFFFFFF8;
      }
    }
    else
    {
      v14 = 0;
      v16 = 0;
      v17 = (char *)&off_24EDD7038 + 1;
    }
    sub_2263AD3FC(&v8->_value._storage, &v16);
    sub_2263AD568((uint64_t)&v16);
    if ((v14 & 7) != 0)
    {
      v11 = (unsigned int *)(v14 & 0xFFFFFFFFFFFFFFF8);
      do
        v12 = __ldxr(v11);
      while (__stlxr(v12 - 2, v11));
    }
    objc_storeStrong((id *)&v8->_type, CFSTR("token"));
    v8->_arraySize = 0;
  }

  return v8;
}

- (USKData)initWithString:(id)a3
{
  id v4;
  USKData *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v11;
  objc_super v12;
  uint64_t v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2263F8F84();
  v12.receiver = self;
  v12.super_class = (Class)USKData;
  v5 = -[USKData init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_retainAutorelease(v4);
    v11 = (char *)objc_msgSend_UTF8String(v6, v7, v8, v9);
    v13[1] = 0;
    sub_2263C2AC0(v13, &v11);
    sub_2263AD3FC(&v5->_value._storage, v13);
    sub_2263AD568((uint64_t)v13);
    objc_storeStrong((id *)&v5->_type, CFSTR("string"));
    v5->_arraySize = 0;
  }

  return v5;
}

- (USKData)initWithTimeCode:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  USKData *v8;
  uint64_t v9;
  objc_super v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2263F8F84();
  v11.receiver = self;
  v11.super_class = (Class)USKData;
  v8 = -[USKData init](&v11, sel_init);
  if (v8)
  {
    objc_msgSend_sdfTimeCode(v4, v5, v6, v7);
    v12[1] = (char *)&off_24EDD7328 + 1;
    v12[0] = v9;
    sub_2263AD3FC(&v8->_value._storage, v12);
    sub_2263AD568((uint64_t)v12);
    objc_storeStrong((id *)&v8->_type, CFSTR("timecode"));
    v8->_arraySize = 0;
  }

  return v8;
}

- (USKData)initWithBool:(BOOL)a3
{
  USKData *v5;
  USKData *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v8.receiver = self;
  v8.super_class = (Class)USKData;
  v5 = -[USKData init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v9[1] = &unk_24EDD73E3;
    LOBYTE(v9[0]) = a3;
    sub_2263AD3FC(&v5->_value._storage, v9);
    sub_2263AD568((uint64_t)v9);
    objc_storeStrong((id *)&v6->_type, CFSTR("BOOL"));
    v6->_arraySize = 0;
  }
  return v6;
}

- (USKData)initWithInt:(int)a3
{
  USKData *v5;
  USKData *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v8.receiver = self;
  v8.super_class = (Class)USKData;
  v5 = -[USKData init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v9[1] = &unk_24EDD749B;
    LODWORD(v9[0]) = a3;
    sub_2263AD3FC(&v5->_value._storage, v9);
    sub_2263AD568((uint64_t)v9);
    objc_storeStrong((id *)&v6->_type, CFSTR("int"));
    v6->_arraySize = 0;
  }
  return v6;
}

- (USKData)initWithUInt:(unsigned int)a3
{
  USKData *v5;
  USKData *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v8.receiver = self;
  v8.super_class = (Class)USKData;
  v5 = -[USKData init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v9[1] = &unk_24EDD7553;
    LODWORD(v9[0]) = a3;
    sub_2263AD3FC(&v5->_value._storage, v9);
    sub_2263AD568((uint64_t)v9);
    objc_storeStrong((id *)&v6->_type, CFSTR("uint"));
    v6->_arraySize = 0;
  }
  return v6;
}

- (USKData)initWithObjectPath:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  USKData *v8;
  uint64_t v10;
  objc_super v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2263F8F84();
  v11.receiver = self;
  v11.super_class = (Class)USKData;
  v8 = -[USKData init](&v11, sel_init);
  if (v8)
  {
    if (v4)
      objc_msgSend_path(v4, v5, v6, v7);
    else
      v10 = 0;
    v12[1] = (char *)&off_24EDD71B8 + 1;
    sub_2263BDDD8(v12, &v10);
    sub_2263BDE28((_DWORD *)v12 + 1, (_DWORD *)&v10 + 1);
    sub_2263AD3FC(&v8->_value._storage, v12);
    sub_2263AD568((uint64_t)v12);
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v10);
    objc_storeStrong((id *)&v8->_type, CFSTR("rel"));
    v8->_arraySize = 0;
  }

  return v8;
}

- (USKData)initWithURL:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  USKData *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v15[2];
  char v16;
  void *v17[2];
  char v18;
  void *__p;
  char v20;
  objc_super v21;
  char *v22[3];

  v22[2] = *(char **)MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2263F8F84();
  v21.receiver = self;
  v21.super_class = (Class)USKData;
  v8 = -[USKData init](&v21, sel_init);
  if (v8)
  {
    objc_msgSend_relativeString(v4, v5, v6, v7);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (char *)objc_msgSend_UTF8String(v9, v10, v11, v12);
    sub_2263AE2A8(v15, v13);
    MEMORY[0x227697264](v17, v15);
    v22[1] = (char *)&off_24EDD7270;
    sub_2263C3860(v22, (__int128 *)v17);
    sub_2263AD3FC(&v8->_value._storage, v22);
    sub_2263AD568((uint64_t)v22);
    if (v20 < 0)
      operator delete(__p);
    if (v18 < 0)
      operator delete(v17[0]);
    if (v16 < 0)
      operator delete(v15[0]);

    objc_storeStrong((id *)&v8->_type, CFSTR("asset"));
    v8->_arraySize = 0;
  }

  return v8;
}

- (USKData)initWithResourcePath:(id)a3
{
  id v4;
  USKData *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v12[2];
  void *v13[2];
  __int128 v14;
  objc_super v15;
  void *__p[2];
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2263F8F84();
  v15.receiver = self;
  v15.super_class = (Class)USKData;
  v5 = -[USKData init](&v15, sel_init);
  if (v5)
  {
    *(_OWORD *)v13 = 0u;
    v14 = 0u;
    *(_OWORD *)v12 = 0u;
    v6 = objc_retainAutorelease(v4);
    v10 = (char *)objc_msgSend_UTF8String(v6, v7, v8, v9);
    sub_2263AE2A8(__p, v10);
    MEMORY[0x227697264](v12, __p);
    if (v17 < 0)
      operator delete(__p[0]);
    __p[1] = &off_24EDD7270;
    sub_2263C3860((char **)__p, (__int128 *)v12);
    sub_2263AD3FC(&v5->_value._storage, __p);
    sub_2263AD568((uint64_t)__p);
    objc_storeStrong((id *)&v5->_type, CFSTR("asset"));
    v5->_arraySize = 0;
    if (SHIBYTE(v14) < 0)
      operator delete(v13[1]);
    if (SHIBYTE(v13[0]) < 0)
      operator delete(v12[0]);
  }

  return v5;
}

- (USKData)initWithFloat:(float)a3
{
  USKData *v5;
  USKData *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v8.receiver = self;
  v8.super_class = (Class)USKData;
  v5 = -[USKData init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v9[1] = &unk_24EDD760B;
    *(float *)v9 = a3;
    sub_2263AD3FC(&v5->_value._storage, v9);
    sub_2263AD568((uint64_t)v9);
    objc_storeStrong((id *)&v6->_type, CFSTR("float"));
    v6->_arraySize = 0;
  }
  return v6;
}

- (USKData)initWithFloat2:(USKData *)self
{
  uint64_t v2;
  uint64_t v3;
  USKData *v5;
  USKData *v6;
  objc_super v8;
  _QWORD v9[3];

  v3 = v2;
  v9[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v8.receiver = self;
  v8.super_class = (Class)USKData;
  v5 = -[USKData init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v9[1] = (char *)&off_24EDD76C0 + 3;
    v9[0] = v3;
    sub_2263AD3FC(&v5->_value._storage, v9);
    sub_2263AD568((uint64_t)v9);
    objc_storeStrong((id *)&v6->_type, CFSTR("float2"));
    v6->_arraySize = 0;
  }
  return v6;
}

- (USKData)initWithFloat3:(USKData *)self
{
  __int128 v2;
  USKData *v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  __int128 v9;
  objc_super v10;
  _QWORD v11[3];

  v9 = v2;
  v11[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v10.receiver = self;
  v10.super_class = (Class)USKData;
  v4 = -[USKData init](&v10, sel_init);
  if (v4)
  {
    v11[1] = (char *)&off_24EDD7778 + 2;
    v5 = operator new();
    *(_QWORD *)v5 = v9;
    *(_DWORD *)(v5 + 8) = DWORD2(v9);
    v6 = (unsigned int *)(v5 + 12);
    atomic_store(0, (unsigned int *)(v5 + 12));
    v11[0] = v5;
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
    sub_2263AD3FC(&v4->_value._storage, v11);
    sub_2263AD568((uint64_t)v11);
    objc_storeStrong((id *)&v4->_type, CFSTR("float3"));
    v4->_arraySize = 0;
  }
  return v4;
}

- (USKData)initWithFloat4:(USKData *)self
{
  __int128 v2;
  USKData *v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  __int128 v9;
  objc_super v10;
  _QWORD v11[3];

  v9 = v2;
  v11[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v10.receiver = self;
  v10.super_class = (Class)USKData;
  v4 = -[USKData init](&v10, sel_init);
  if (v4)
  {
    v11[1] = (char *)&off_24EDD7830 + 2;
    v5 = operator new();
    *(_OWORD *)v5 = v9;
    v6 = (unsigned int *)(v5 + 16);
    atomic_store(0, (unsigned int *)(v5 + 16));
    v11[0] = v5;
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
    sub_2263AD3FC(&v4->_value._storage, v11);
    sub_2263AD568((uint64_t)v11);
    objc_storeStrong((id *)&v4->_type, CFSTR("float4"));
    v4->_arraySize = 0;
  }
  return v4;
}

- (USKData)initWithDouble:(double)a3
{
  USKData *v5;
  USKData *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v8.receiver = self;
  v8.super_class = (Class)USKData;
  v5 = -[USKData init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v9[1] = &unk_24EDD78EB;
    *(double *)v9 = a3;
    sub_2263AD3FC(&v5->_value._storage, v9);
    sub_2263AD568((uint64_t)v9);
    objc_storeStrong((id *)&v6->_type, CFSTR("double"));
    v6->_arraySize = 0;
  }
  return v6;
}

- (USKData)initWithDouble2:(USKData *)self
{
  __int128 v2;
  USKData *v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  __int128 v9;
  objc_super v10;
  _QWORD v11[3];

  v9 = v2;
  v11[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v10.receiver = self;
  v10.super_class = (Class)USKData;
  v4 = -[USKData init](&v10, sel_init);
  if (v4)
  {
    v11[1] = (char *)&off_24EDD79A0 + 2;
    v5 = operator new();
    *(_OWORD *)v5 = v9;
    v6 = (unsigned int *)(v5 + 16);
    atomic_store(0, (unsigned int *)(v5 + 16));
    v11[0] = v5;
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
    sub_2263AD3FC(&v4->_value._storage, v11);
    sub_2263AD568((uint64_t)v11);
    objc_storeStrong((id *)&v4->_type, CFSTR("double2"));
    v4->_arraySize = 0;
  }
  return v4;
}

- (USKData)initWithDouble3:(USKData *)self
{
  __int128 *v2;
  USKData *v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  __int128 v9;
  __int128 v10;
  objc_super v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v9 = *v2;
  v10 = v2[1];
  sub_2263F8F84();
  v11.receiver = self;
  v11.super_class = (Class)USKData;
  v4 = -[USKData init](&v11, sel_init);
  if (v4)
  {
    v12[1] = (char *)&off_24EDD7A58 + 2;
    v5 = operator new();
    *(_OWORD *)v5 = v9;
    *(_QWORD *)(v5 + 16) = v10;
    v6 = (unsigned int *)(v5 + 24);
    atomic_store(0, (unsigned int *)(v5 + 24));
    v12[0] = v5;
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
    sub_2263AD3FC(&v4->_value._storage, v12);
    sub_2263AD568((uint64_t)v12);
    objc_storeStrong((id *)&v4->_type, CFSTR("double3"));
    v4->_arraySize = 0;
  }
  return v4;
}

- (USKData)initWithDouble4:(USKData *)self
{
  __int128 *v2;
  USKData *v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  __int128 v9;
  __int128 v10;
  objc_super v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v9 = *v2;
  v10 = v2[1];
  sub_2263F8F84();
  v11.receiver = self;
  v11.super_class = (Class)USKData;
  v4 = -[USKData init](&v11, sel_init);
  if (v4)
  {
    v12[1] = (char *)&off_24EDD7B10 + 2;
    v5 = operator new();
    *(_OWORD *)v5 = v9;
    *(_OWORD *)(v5 + 16) = v10;
    v6 = (unsigned int *)(v5 + 32);
    atomic_store(0, (unsigned int *)(v5 + 32));
    v12[0] = v5;
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
    sub_2263AD3FC(&v4->_value._storage, v12);
    sub_2263AD568((uint64_t)v12);
    objc_storeStrong((id *)&v4->_type, CFSTR("double4"));
    v4->_arraySize = 0;
  }
  return v4;
}

- (USKData)initWithDouble4x4:(__int128 *)a3
{
  USKData *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v18.receiver = a1;
  v18.super_class = (Class)USKData;
  v5 = -[USKData init](&v18, sel_init);
  if (v5)
  {
    v17 = a3[1];
    v12 = a3[2];
    v13 = *a3;
    v15 = a3[5];
    v16 = a3[3];
    v14 = a3[7];
    v10 = a3[6];
    v11 = a3[4];
    v19[1] = (char *)&off_24EDD7BC8 + 2;
    v6 = operator new();
    *(_OWORD *)v6 = v13;
    *(_OWORD *)(v6 + 16) = v17;
    *(_OWORD *)(v6 + 32) = v12;
    *(_OWORD *)(v6 + 48) = v16;
    *(_OWORD *)(v6 + 64) = v11;
    *(_OWORD *)(v6 + 80) = v15;
    *(_OWORD *)(v6 + 96) = v10;
    *(_OWORD *)(v6 + 112) = v14;
    v7 = (unsigned int *)(v6 + 128);
    atomic_store(0, (unsigned int *)(v6 + 128));
    v19[0] = v6;
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
    sub_2263AD3FC(&v5->_value._storage, v19);
    sub_2263AD568((uint64_t)v19);
    objc_storeStrong((id *)&v5->_type, CFSTR("double4x4"));
    v5->_arraySize = 0;
  }
  return v5;
}

- (USKData)initWithQuatf:(void *)a1
{
  USKData *v3;
  __n128 *v4;
  unsigned int *v5;
  unsigned int v6;
  objc_super v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v9.receiver = a1;
  v9.super_class = (Class)USKData;
  v3 = -[USKData init](&v9, sel_init);
  if (v3)
  {
    v10[1] = &off_24EDD7C80;
    v4 = (__n128 *)operator new();
    *v4 = a2;
    v5 = (unsigned int *)&v4[1];
    atomic_store(0, (unsigned int *)&v4[1]);
    v10[0] = v4;
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
    sub_2263AD3FC(&v3->_value._storage, v10);
    sub_2263AD568((uint64_t)v10);
    objc_storeStrong((id *)&v3->_type, CFSTR("quatf"));
    v3->_arraySize = 0;
  }
  return v3;
}

- (USKData)initWithIntArray:(int *)a3 count:(unint64_t)a4
{
  USKData *v7;
  _OWORD v9[2];
  void *__dst;
  objc_super v11;
  uint64_t v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v11.receiver = self;
  v11.super_class = (Class)USKData;
  v7 = -[USKData init](&v11, sel_init);
  if (v7)
  {
    __dst = 0;
    memset(v9, 0, sizeof(v9));
    sub_2263AA560((uint64_t)v9, a4);
    sub_2263AC688((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v9);
    memcpy(__dst, a3, 4 * a4);
    v12[1] = (uint64_t)&off_24EDD7D38;
    sub_2263C68F0(v12, (uint64_t)v9);
    sub_2263AD3FC(&v7->_value._storage, v12);
    sub_2263AD568((uint64_t)v12);
    objc_storeStrong((id *)&v7->_type, CFSTR("int[]"));
    v7->_arraySize = a4;
    sub_2263AC71C((uint64_t)v9);
  }
  return v7;
}

- (USKData)initWithUIntArray:(unsigned int *)a3 count:(unint64_t)a4
{
  USKData *v7;
  _OWORD v9[2];
  void *__dst;
  objc_super v11;
  uint64_t v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v11.receiver = self;
  v11.super_class = (Class)USKData;
  v7 = -[USKData init](&v11, sel_init);
  if (v7)
  {
    __dst = 0;
    memset(v9, 0, sizeof(v9));
    sub_2263B911C((uint64_t)v9, a4);
    sub_2263C6BCC((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v9);
    memcpy(__dst, a3, 4 * a4);
    v12[1] = (uint64_t)&off_24EDD7DF0;
    sub_2263C68F0(v12, (uint64_t)v9);
    sub_2263AD3FC(&v7->_value._storage, v12);
    sub_2263AD568((uint64_t)v12);
    objc_storeStrong((id *)&v7->_type, CFSTR("uint[]"));
    v7->_arraySize = a4;
    sub_2263AC71C((uint64_t)v9);
  }
  return v7;
}

- (USKData)initWithQuatfArray:(id *)a3 count:(unint64_t)a4
{
  USKData *v7;
  uint64_t v8;
  __int128 v10;
  _OWORD v11[2];
  uint64_t v12;
  objc_super v13;
  uint64_t v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v13.receiver = self;
  v13.super_class = (Class)USKData;
  v7 = -[USKData init](&v13, sel_init);
  if (v7)
  {
    v12 = 0;
    memset(v11, 0, sizeof(v11));
    sub_2263B9294((uint64_t)v11, a4);
    if (a4)
    {
      v8 = 0;
      do
      {
        v10 = *((_OWORD *)a3 + v8);
        sub_2263C092C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v11);
        *(_OWORD *)(v12 + 16 * v8++) = v10;
      }
      while (a4 != v8);
    }
    v14[1] = (uint64_t)off_24EDD7EA8;
    sub_2263B131C(v14, (uint64_t)v11);
    sub_2263AD3FC(&v7->_value._storage, v14);
    sub_2263AD568((uint64_t)v14);
    objc_storeStrong((id *)&v7->_type, CFSTR("quatf[]"));
    v7->_arraySize = a4;
    sub_2263AC71C((uint64_t)v11);
  }
  return v7;
}

- (USKData)initWithStringArray:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  USKData *v8;
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
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  uint64_t v27;
  objc_super v28;
  uint64_t v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2263F8F84();
  v28.receiver = self;
  v28.super_class = (Class)USKData;
  v8 = -[USKData init](&v28, sel_init);
  if (v8)
  {
    v27 = 0;
    v9 = objc_msgSend_count(v4, v5, v6, v7, 0, 0, 0, 0);
    sub_2263B9998((uint64_t)&v26, v9);
    v13 = 0;
    for (i = 0; i < objc_msgSend_count(v4, v10, v11, v12); ++i)
    {
      objc_msgSend_objectAtIndexedSubscript_(v4, v15, i, v16);
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v21 = objc_msgSend_UTF8String(v17, v18, v19, v20);
      sub_2263C7C48((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v26);
      MEMORY[0x227697FCC](v27 + v13, v21);

      v13 += 24;
    }
    v29[1] = (uint64_t)&off_24EDD7F60;
    sub_2263B131C(v29, (uint64_t)&v26);
    sub_2263AD3FC(&v8->_value._storage, v29);
    sub_2263AD568((uint64_t)v29);
    objc_storeStrong((id *)&v8->_type, CFSTR("string[]"));
    v8->_arraySize = objc_msgSend_count(v4, v22, v23, v24);
    sub_2263C7974(&v26);
  }

  return v8;
}

- (USKData)initWithTokenArray:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  USKData *v8;
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
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v31;
  uint64_t v32;
  objc_super v33;
  uint64_t v34[3];

  v34[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2263F8F84();
  v33.receiver = self;
  v33.super_class = (Class)USKData;
  v8 = -[USKData init](&v33, sel_init);
  if (v8)
  {
    v32 = 0;
    v9 = objc_msgSend_count(v4, v5, v6, v7, 0, 0, 0, 0);
    sub_2263B9A2C((uint64_t)&v31, v9);
    for (i = 0; i < objc_msgSend_count(v4, v10, v11, v12); ++i)
    {
      objc_msgSend_objectAtIndexedSubscript_(v4, v14, i, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v16;
      if (v16)
        objc_msgSend_token(v16, v17, v18, v19);
      else
        v34[0] = 0;
      sub_2263C8708((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v31);
      v21 = (uint64_t *)(v32 + 8 * i);
      if (v34 == v21)
      {
        v24 = v34[0];
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
        *v21 = v34[0];
        v34[0] = 0;
      }
      if ((v24 & 7) != 0)
      {
        v25 = (unsigned int *)(v24 & 0xFFFFFFFFFFFFFFF8);
        do
          v26 = __ldxr(v25);
        while (__stlxr(v26 - 2, v25));
      }

    }
    v34[1] = (uint64_t)off_24EDD8018;
    sub_2263B131C(v34, (uint64_t)&v31);
    sub_2263AD3FC(&v8->_value._storage, v34);
    sub_2263AD568((uint64_t)v34);
    objc_storeStrong((id *)&v8->_type, CFSTR("token[]"));
    v8->_arraySize = objc_msgSend_count(v4, v27, v28, v29);
    sub_2263C8530(&v31);
  }

  return v8;
}

- (USKData)initWithResourcePathArray:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  USKData *v8;
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
  char *v21;
  uint64_t v22;
  __int128 v23;
  void **v24;
  __int128 v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v30[2];
  char v31;
  _OWORD v32[2];
  uint64_t v33;
  objc_super v34;
  void *__p[2];
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2263F8F84();
  v34.receiver = self;
  v34.super_class = (Class)USKData;
  v8 = -[USKData init](&v34, sel_init);
  if (v8)
  {
    v33 = 0;
    memset(v32, 0, sizeof(v32));
    v9 = objc_msgSend_count(v4, v5, v6, v7);
    sub_2263B9B90((uint64_t)v32, v9);
    v13 = 0;
    for (i = 0; i < objc_msgSend_count(v4, v10, v11, v12); ++i)
    {
      objc_msgSend_objectAtIndexedSubscript_(v4, v15, i, v16);
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v21 = (char *)objc_msgSend_UTF8String(v17, v18, v19, v20);
      sub_2263AE2A8(v30, v21);
      MEMORY[0x227697264](__p, v30);
      sub_2263C9B84((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v32);
      v22 = v33 + v13;
      if (*(char *)(v33 + v13 + 23) < 0)
        operator delete(*(void **)v22);
      v23 = *(_OWORD *)__p;
      *(_QWORD *)(v22 + 16) = v36;
      *(_OWORD *)v22 = v23;
      HIBYTE(v36) = 0;
      LOBYTE(__p[0]) = 0;
      v24 = (void **)(v22 + 24);
      if (*(char *)(v22 + 47) < 0)
        operator delete(*v24);
      v25 = v37;
      *(_QWORD *)(v22 + 40) = v38;
      *(_OWORD *)v24 = v25;
      HIBYTE(v38) = 0;
      LOBYTE(v37) = 0;
      if (SHIBYTE(v36) < 0)
        operator delete(__p[0]);
      if (v31 < 0)
        operator delete(v30[0]);

      v13 += 48;
    }
    __p[1] = off_24EDD81A0;
    sub_2263B131C((uint64_t *)__p, (uint64_t)v32);
    sub_2263AD3FC(&v8->_value._storage, __p);
    sub_2263AD568((uint64_t)__p);
    objc_storeStrong((id *)&v8->_type, CFSTR("asset[]"));
    v8->_arraySize = objc_msgSend_count(v4, v26, v27, v28);
    sub_2263C97A0(v32);
  }

  return v8;
}

- (USKData)initWithFloatArray:(float *)a3 count:(unint64_t)a4
{
  USKData *v7;
  _OWORD v9[2];
  void *__dst;
  objc_super v11;
  uint64_t v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v11.receiver = self;
  v11.super_class = (Class)USKData;
  v7 = -[USKData init](&v11, sel_init);
  if (v7)
  {
    __dst = 0;
    memset(v9, 0, sizeof(v9));
    sub_2263BA174((uint64_t)v9, a4);
    sub_2263CA3A4((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v9);
    memcpy(__dst, a3, 4 * a4);
    v12[1] = (uint64_t)&off_24EDD8258;
    sub_2263CA8B4(v12, (uint64_t)v9);
    sub_2263AD3FC(&v7->_value._storage, v12);
    sub_2263AD568((uint64_t)v12);
    objc_storeStrong((id *)&v7->_type, CFSTR("float[]"));
    v7->_arraySize = a4;
    sub_2263AC71C((uint64_t)v9);
  }
  return v7;
}

- (USKData)initWithFloat2Array:(USKData *)self count:(SEL)a2
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  USKData *v7;
  uint64_t i;
  uint64_t v9;
  _OWORD v11[2];
  uint64_t v12;
  objc_super v13;
  uint64_t v14[3];

  v4 = v3;
  v5 = v2;
  v14[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v13.receiver = self;
  v13.super_class = (Class)USKData;
  v7 = -[USKData init](&v13, sel_init);
  if (v7)
  {
    v12 = 0;
    memset(v11, 0, sizeof(v11));
    sub_2263BA308((uint64_t)v11, v4);
    if (v4)
    {
      for (i = 0; i != v4; ++i)
      {
        v9 = *(_QWORD *)(v5 + 8 * i);
        sub_2263C11DC((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v11);
        *(_QWORD *)(v12 + 8 * i) = v9;
      }
    }
    v14[1] = (uint64_t)off_24EDD8310;
    sub_2263B131C(v14, (uint64_t)v11);
    sub_2263AD3FC(&v7->_value._storage, v14);
    sub_2263AD568((uint64_t)v14);
    objc_storeStrong((id *)&v7->_type, CFSTR("float2[]"));
    v7->_arraySize = v4;
    sub_2263AC71C((uint64_t)v11);
  }
  return v7;
}

- (USKData)initWithFloat3Array:(USKData *)self count:(SEL)a2
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  USKData *v7;
  uint64_t v8;
  _DWORD *v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  _OWORD v15[2];
  uint64_t v16;
  objc_super v17;
  uint64_t v18[3];

  v4 = v3;
  v5 = v2;
  v18[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v17.receiver = self;
  v17.super_class = (Class)USKData;
  v7 = -[USKData init](&v17, sel_init);
  if (v7)
  {
    v16 = 0;
    memset(v15, 0, sizeof(v15));
    sub_2263AFB70((uint64_t)v15, v4);
    if (v4)
    {
      v8 = 0;
      v9 = (_DWORD *)(v5 + 8);
      v10 = v4;
      do
      {
        v11 = *((_QWORD *)v9 - 1);
        v12 = *v9;
        sub_2263B1F74((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v15);
        v13 = v16 + v8;
        *(_QWORD *)v13 = v11;
        *(_DWORD *)(v13 + 8) = v12;
        v9 += 4;
        v8 += 12;
        --v10;
      }
      while (v10);
    }
    v18[1] = (uint64_t)&off_24EDD68F0;
    sub_2263B131C(v18, (uint64_t)v15);
    sub_2263AD3FC(&v7->_value._storage, v18);
    sub_2263AD568((uint64_t)v18);
    objc_storeStrong((id *)&v7->_type, CFSTR("float3[]"));
    v7->_arraySize = v4;
    sub_2263AC71C((uint64_t)v15);
  }
  return v7;
}

- (USKData)initWithFloat4Array:(USKData *)self count:(SEL)a2
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  USKData *v7;
  uint64_t i;
  __int128 v10;
  _OWORD v11[2];
  uint64_t v12;
  objc_super v13;
  uint64_t v14[3];

  v4 = v3;
  v5 = v2;
  v14[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v13.receiver = self;
  v13.super_class = (Class)USKData;
  v7 = -[USKData init](&v13, sel_init);
  if (v7)
  {
    v12 = 0;
    memset(v11, 0, sizeof(v11));
    sub_2263AFB00((uint64_t)v11, v4);
    if (v4)
    {
      for (i = 0; i != v4; ++i)
      {
        v10 = *(_OWORD *)(v5 + 16 * i);
        sub_2263B1E44((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v11);
        *(_OWORD *)(v12 + 16 * i) = v10;
      }
    }
    v14[1] = (uint64_t)&off_24EDD69D0;
    sub_2263B131C(v14, (uint64_t)v11);
    sub_2263AD3FC(&v7->_value._storage, v14);
    sub_2263AD568((uint64_t)v14);
    objc_storeStrong((id *)&v7->_type, CFSTR("float4[]"));
    v7->_arraySize = v4;
    sub_2263AC71C((uint64_t)v11);
  }
  return v7;
}

- (USKData)initWithDoubleArray:(double *)a3 count:(unint64_t)a4
{
  USKData *v7;
  _OWORD v9[2];
  void *__dst;
  objc_super v11;
  uint64_t v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v11.receiver = self;
  v11.super_class = (Class)USKData;
  v7 = -[USKData init](&v11, sel_init);
  if (v7)
  {
    __dst = 0;
    memset(v9, 0, sizeof(v9));
    sub_2263BA6DC((uint64_t)v9, a4);
    sub_2263CB26C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v9);
    memcpy(__dst, a3, 8 * a4);
    v12[1] = (uint64_t)&off_24EDD83C8;
    sub_2263CA8B4(v12, (uint64_t)v9);
    sub_2263AD3FC(&v7->_value._storage, v12);
    sub_2263AD568((uint64_t)v12);
    objc_storeStrong((id *)&v7->_type, CFSTR("double[]"));
    v7->_arraySize = a4;
    sub_2263AC71C((uint64_t)v9);
  }
  return v7;
}

- (USKData)initWithDouble2Array:(USKData *)self count:(SEL)a2
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  USKData *v7;
  uint64_t i;
  __int128 v10;
  _OWORD v11[2];
  uint64_t v12;
  objc_super v13;
  uint64_t v14[3];

  v4 = v3;
  v5 = v2;
  v14[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v13.receiver = self;
  v13.super_class = (Class)USKData;
  v7 = -[USKData init](&v13, sel_init);
  if (v7)
  {
    v12 = 0;
    memset(v11, 0, sizeof(v11));
    sub_2263BA870((uint64_t)v11, v4);
    if (v4)
    {
      for (i = 0; i != v4; ++i)
      {
        v10 = *(_OWORD *)(v5 + 16 * i);
        sub_2263C1FD8((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v11);
        *(_OWORD *)(v12 + 16 * i) = v10;
      }
    }
    v14[1] = (uint64_t)off_24EDD8480;
    sub_2263B131C(v14, (uint64_t)v11);
    sub_2263AD3FC(&v7->_value._storage, v14);
    sub_2263AD568((uint64_t)v14);
    objc_storeStrong((id *)&v7->_type, CFSTR("double2[]"));
    v7->_arraySize = v4;
    sub_2263AC71C((uint64_t)v11);
  }
  return v7;
}

- (USKData)initWithDouble3Array:(USKData *)self count:(SEL)a2
{
  __int128 *v2;
  unint64_t v3;
  unint64_t v4;
  __int128 *v5;
  USKData *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  _OWORD v14[2];
  uint64_t v15;
  objc_super v16;
  uint64_t v17[3];

  v4 = v3;
  v5 = v2;
  v17[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v16.receiver = self;
  v16.super_class = (Class)USKData;
  v7 = -[USKData init](&v16, sel_init);
  if (v7)
  {
    v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_2263BAA18((uint64_t)v14, v4);
    if (v4)
    {
      v8 = 0;
      v9 = v4;
      do
      {
        v12 = *v5;
        v13 = v5[1];
        sub_2263C23C8((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v14);
        v10 = v15 + v8;
        *(_OWORD *)v10 = v12;
        *(_QWORD *)(v10 + 16) = v13;
        v5 += 2;
        v8 += 24;
        --v9;
      }
      while (v9);
    }
    v17[1] = (uint64_t)off_24EDD8538;
    sub_2263B131C(v17, (uint64_t)v14);
    sub_2263AD3FC(&v7->_value._storage, v17);
    sub_2263AD568((uint64_t)v17);
    objc_storeStrong((id *)&v7->_type, CFSTR("double3[]"));
    v7->_arraySize = v4;
    sub_2263AC71C((uint64_t)v14);
  }
  return v7;
}

- (USKData)initWithDouble4Array:(USKData *)self count:(SEL)a2
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  USKData *v7;
  uint64_t v8;
  unint64_t v9;
  _OWORD *v10;
  __int128 v12;
  __int128 v13;
  _OWORD v14[2];
  uint64_t v15;
  objc_super v16;
  uint64_t v17[3];

  v4 = v3;
  v5 = v2;
  v17[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v16.receiver = self;
  v16.super_class = (Class)USKData;
  v7 = -[USKData init](&v16, sel_init);
  if (v7)
  {
    v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_2263BABC0((uint64_t)v14, v4);
    if (v4)
    {
      v8 = 0;
      v9 = v4;
      do
      {
        v12 = *(_OWORD *)(v5 + v8);
        v13 = *(_OWORD *)(v5 + v8 + 16);
        sub_2263C27D4((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v14);
        v10 = (_OWORD *)(v15 + v8);
        *v10 = v12;
        v10[1] = v13;
        v8 += 32;
        --v9;
      }
      while (v9);
    }
    v17[1] = (uint64_t)off_24EDD85F0;
    sub_2263B131C(v17, (uint64_t)v14);
    sub_2263AD3FC(&v7->_value._storage, v17);
    sub_2263AD568((uint64_t)v17);
    objc_storeStrong((id *)&v7->_type, CFSTR("double4[]"));
    v7->_arraySize = v4;
    sub_2263AC71C((uint64_t)v14);
  }
  return v7;
}

- (USKData)initWithDouble4x4Array:(id *)a3 count:(unint64_t)a4
{
  USKData *v7;
  uint64_t v8;
  unint64_t v9;
  __int128 *v10;
  _OWORD *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _OWORD v27[2];
  uint64_t v28;
  objc_super v29;
  uint64_t v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v29.receiver = self;
  v29.super_class = (Class)USKData;
  v7 = -[USKData init](&v29, sel_init);
  if (v7)
  {
    v28 = 0;
    memset(v27, 0, sizeof(v27));
    sub_2263BADAC((uint64_t)v27, a4);
    if (a4)
    {
      v8 = 0;
      v9 = a4;
      do
      {
        v25 = *(_OWORD *)((char *)a3 + v8 + 48);
        v26 = *(_OWORD *)((char *)a3 + v8 + 16);
        v21 = *(_OWORD *)((char *)a3 + v8 + 32);
        v22 = *(_OWORD *)((char *)a3 + v8);
        v23 = *(_OWORD *)((char *)a3 + v8 + 112);
        v24 = *(_OWORD *)((char *)a3 + v8 + 80);
        v19 = *(_OWORD *)((char *)a3 + v8 + 96);
        v20 = *(_OWORD *)((char *)a3 + v8 + 64);
        sub_2263C1908((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v27);
        v10 = (__int128 *)(v28 + v8);
        *v10 = v22;
        v10[1] = v26;
        v10[2] = v21;
        v10[3] = v25;
        v10[4] = v20;
        v10[5] = v24;
        v10[6] = v19;
        v10[7] = v23;
        sub_2263C1908((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v27);
        v11 = (_OWORD *)(v28 + v8);
        v12 = *v10;
        v13 = v10[1];
        v14 = v10[3];
        v11[2] = v10[2];
        v11[3] = v14;
        v15 = v10[7];
        v17 = v10[4];
        v16 = v10[5];
        v11[6] = v10[6];
        v11[7] = v15;
        v11[4] = v17;
        v11[5] = v16;
        *v11 = v12;
        v11[1] = v13;
        v8 += 128;
        --v9;
      }
      while (v9);
    }
    v30[1] = (uint64_t)off_24EDD86A8;
    sub_2263B131C(v30, (uint64_t)v27);
    sub_2263AD3FC(&v7->_value._storage, v30);
    sub_2263AD568((uint64_t)v30);
    objc_storeStrong((id *)&v7->_type, CFSTR("double4x4[]"));
    v7->_arraySize = a4;
    sub_2263AC71C((uint64_t)v27);
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  USKData *v4;
  USKData *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  _BYTE v11[16];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (USKData *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_value(v5, v6, v7, v8);
    v9 = sub_2263BDD20((pxrInternal__aapl__pxrReserved__::VtValue *)&self->_value, (const pxrInternal__aapl__pxrReserved__::VtValue *)v11);
    sub_2263AD568((uint64_t)v11);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return pxrInternal__aapl__pxrReserved__::VtValue::GetHash((pxrInternal__aapl__pxrReserved__::VtValue *)&self->_value);
}

- (NSString)type
{
  return self->_type;
}

- (unint64_t)arraySize
{
  return self->_arraySize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_propertyOwner, 0);
  objc_storeStrong((id *)&self->_sceneOwner, 0);
  objc_storeStrong((id *)&self->_nodeOwner, 0);
  sub_2263AD568((uint64_t)&self->_value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
