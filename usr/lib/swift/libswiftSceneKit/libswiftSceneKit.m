float SCNVector3.init(_:_:_:)(double a1)
{
  return a1;
}

__C::SCNVector3 __swiftcall SCNVector3.init(_:_:_:)(Swift::Int a1, Swift::Int a2, Swift::Int a3)
{
  float v3;
  float v4;
  float v5;
  __C::SCNVector3 result;

  v3 = (float)a1;
  v4 = (float)a2;
  v5 = (float)a3;
  result.z = v5;
  result.y = v4;
  result.x = v3;
  return result;
}

float32x2_t SCNVector3.init(_:)(float64x2_t a1)
{
  return vcvt_f32_f64(a1);
}

double SIMD3<>.init(_:)(float a1, float a2)
{
  return COERCE_DOUBLE(__PAIR64__(LODWORD(a2), LODWORD(a1)));
}

double SIMD3<>.init(_:)(float32x2_t a1, float32_t a2)
{
  double result;

  a1.f32[1] = a2;
  *(_QWORD *)&result = *(_OWORD *)&vcvtq_f64_f32(a1);
  return result;
}

float SCNVector4.init(_:_:_:_:)(double a1)
{
  return a1;
}

__C::SCNVector4 __swiftcall SCNVector4.init(_:_:_:_:)(Swift::Int a1, Swift::Int a2, Swift::Int a3, Swift::Int a4)
{
  float v4;
  float v5;
  float v6;
  float v7;
  __C::SCNVector4 result;

  v4 = (float)a1;
  v5 = (float)a2;
  v6 = (float)a3;
  v7 = (float)a4;
  result.w = v7;
  result.z = v6;
  result.y = v5;
  result.x = v4;
  return result;
}

float32x2_t SCNVector4.init(_:)(float64x2_t a1)
{
  return vcvt_f32_f64(a1);
}

__n64 SIMD4<>.init(_:)(double a1, float a2)
{
  __n64 result;

  result.n64_f32[1] = a2;
  return result;
}

double SIMD4<>.init(_:)(float32x2_t a1, float32_t a2)
{
  double result;

  a1.f32[1] = a2;
  *(_QWORD *)&result = *(_OWORD *)&vcvtq_f64_f32(a1);
  return result;
}

void __swiftcall SCNMatrix4.init(_:)(__C::SCNMatrix4 *__return_ptr retstr, simd_float4x4 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(_OWORD *)&retstr->m11 = v2;
  *(_OWORD *)&retstr->m21 = v3;
  *(_OWORD *)&retstr->m31 = v4;
  *(_OWORD *)&retstr->m41 = v5;
}

void __swiftcall SCNMatrix4.init(_:)(__C::SCNMatrix4 *__return_ptr retstr, simd_double4x4 *a2)
{
  float64x2_t v2;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float32x4_t v6;

  v3 = *(float64x2_t *)a2->columns[2].f64;
  v2 = *(float64x2_t *)&a2->columns[2].f64[2];
  v5 = *(float64x2_t *)a2->columns[3].f64;
  v4 = *(float64x2_t *)&a2->columns[3].f64[2];
  v6 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)a2->columns[1].f64), *(float64x2_t *)&a2->columns[1].f64[2]);
  *(float32x4_t *)&retstr->m11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)a2->columns[0].f64), *(float64x2_t *)&a2->columns[0].f64[2]);
  *(float32x4_t *)&retstr->m21 = v6;
  *(float32x4_t *)&retstr->m31 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v3), v2);
  *(float32x4_t *)&retstr->m41 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v5), v4);
}

void __swiftcall simd_double4x4.init(_:)(simd_double4x4 *__return_ptr retstr, __C::SCNMatrix4 *a2)
{
  float32x4_t v2;
  float64x2_t v3;
  float32x4_t v4;
  float32x4_t v5;

  v2 = *(float32x4_t *)&a2->m21;
  v3 = vcvt_hight_f64_f32(*(float32x4_t *)&a2->m11);
  v4 = *(float32x4_t *)&a2->m31;
  v5 = *(float32x4_t *)&a2->m41;
  *(float64x2_t *)retstr->columns[0].f64 = vcvtq_f64_f32(*(float32x2_t *)&a2->m11);
  *(float64x2_t *)&retstr->columns[0].f64[2] = v3;
  *(float64x2_t *)retstr->columns[1].f64 = vcvtq_f64_f32(*(float32x2_t *)v2.f32);
  *(float64x2_t *)&retstr->columns[1].f64[2] = vcvt_hight_f64_f32(v2);
  *(float64x2_t *)retstr->columns[2].f64 = vcvtq_f64_f32(*(float32x2_t *)v4.f32);
  *(float64x2_t *)&retstr->columns[2].f64[2] = vcvt_hight_f64_f32(v4);
  *(float64x2_t *)retstr->columns[3].f64 = vcvtq_f64_f32(*(float32x2_t *)v5.f32);
  *(float64x2_t *)&retstr->columns[3].f64[2] = vcvt_hight_f64_f32(v5);
}

id SCNGeometryElement.init<A>(indices:primitiveType:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  void *ObjCClassFromMetadata;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  Class isa;
  id v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (a2 > 3)
  {
    __break(1u);
LABEL_30:
    v22 = v3;
    v20 = type metadata accessor for _ArrayBuffer();
    v21 = MEMORY[0x212BE2CC0](MEMORY[0x24BEE2670], v20);
    MEMORY[0x212BE2BAC](&v22, v8, v20, v21);
    swift_unknownObjectRetain();
    v12 = (_BYTE *)_ContiguousArrayBuffer.firstElementAddress.getter();
    swift_release();
  }
  else
  {
    v8 = a3;
    v5 = a2;
    v3 = a1;
    v9 = MEMORY[0x212BE2B7C](a1, a3);
    v4 = v9;
    switch(v5)
    {
      case 0uLL:
        v4 = v9 / 3;
        goto LABEL_11;
      case 1uLL:
        v4 = v9 - 2;
        if (!__OFSUB__(v9, 2))
          goto LABEL_11;
        __break(1u);
LABEL_7:
        if (v9 >= 0)
          v10 = v9;
        else
          v10 = v9 + 1;
        v4 = v10 >> 1;
LABEL_11:
        v11 = *(_QWORD *)(v8 - 8);
        v6 = *(_QWORD *)(v11 + 72);
        v7 = v9 * v6;
        if ((unsigned __int128)(v9 * (__int128)v6) >> 64 == (v9 * v6) >> 63)
        {
          swift_bridgeObjectRetain();
          if ((_swift_isClassOrObjCExistentialType() & 1) == 0
            || (v3 & 0x8000000000000000) == 0 && (v3 & 0x4000000000000000) == 0)
          {
            swift_bridgeObjectRelease();
            if ((_swift_isClassOrObjCExistentialType() & 1) != 0)
              v12 = (_BYTE *)((v3 & 0xFFFFFFFFFFFFFF8)
                            + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)));
            else
              v12 = (_BYTE *)(v3
                            + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)));
            goto LABEL_18;
          }
        }
        else
        {
          __break(1u);
        }
        if (MEMORY[0x212BE2B88](v3, v8))
          goto LABEL_30;
        swift_bridgeObjectRelease();
        v12 = 0;
LABEL_18:
        if ((_swift_isClassOrObjCExistentialType() & 1) == 0
          || (v3 & 0x8000000000000000) == 0 && (v3 & 0x4000000000000000) == 0)
        {
          _swift_isClassOrObjCExistentialType();
          swift_bridgeObjectRetain();
          if (v12)
            break;
          goto LABEL_22;
        }
        swift_unknownObjectRetain();
        if (!v12)
        {
LABEL_22:
          v12 = (_BYTE *)(~*(_DWORD *)(v11 + 80) | 0xFFFFFFFFFFFFFF00);
          break;
        }
        break;
      case 2uLL:
        goto LABEL_7;
      case 3uLL:
        goto LABEL_11;
      default:
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
        JUMPOUT(0x21190AF2CLL);
    }
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v14 = specialized Data.init(bytes:count:)(v12, v7);
  v16 = v15;
  swift_unknownObjectRelease();
  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v14, v16);
  v18 = objc_msgSend(ObjCClassFromMetadata, sel_geometryElementWithData_primitiveType_primitiveCount_bytesPerIndex_, isa, v5, v4, v6);
  swift_bridgeObjectRelease();

  return v18;
}

SCNGeometrySource __swiftcall SCNGeometrySource.init(vertices:)(Swift::OpaquePointer vertices)
{
  return (SCNGeometrySource)SCNGeometrySource.init(vertices:)((uint64_t)vertices._rawValue, (SEL *)&selRef_geometrySourceWithVertices_count_);
}

SCNGeometrySource __swiftcall SCNGeometrySource.init(normals:)(Swift::OpaquePointer normals)
{
  return (SCNGeometrySource)SCNGeometrySource.init(vertices:)((uint64_t)normals._rawValue, (SEL *)&selRef_geometrySourceWithNormals_count_);
}

SCNGeometrySource __swiftcall SCNGeometrySource.init(textureCoordinates:)(Swift::OpaquePointer textureCoordinates)
{
  return (SCNGeometrySource)SCNGeometrySource.init(vertices:)((uint64_t)textureCoordinates._rawValue, (SEL *)&selRef_geometrySourceWithTextureCoordinates_count_);
}

id SCNGeometrySource.init(vertices:)(uint64_t a1, SEL *a2)
{
  id v2;

  v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), *a2, a1 + 32, *(_QWORD *)(a1 + 16));
  swift_bridgeObjectRelease();
  return v2;
}

float SCNBoundingVolume.boundingBox.getter@<S0>(uint64_t a1@<X8>)
{
  void *v1;
  unsigned int v3;
  unsigned int v4;
  float result;
  unsigned int v6;
  __int128 v7;
  unint64_t v8;
  unsigned int v9;
  float v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *(_DWORD *)(MEMORY[0x24BDE8320] + 4);
  v4 = *(_DWORD *)(MEMORY[0x24BDE8320] + 8);
  v10 = *(float *)MEMORY[0x24BDE8320];
  v11 = __PAIR64__(v4, v3);
  v8 = __PAIR64__(v3, LODWORD(v10));
  v9 = v4;
  objc_msgSend(v1, sel_getBoundingBoxMin_max_, &v10, &v8);
  v6 = v9;
  result = v10;
  *(_QWORD *)&v7 = v11;
  *((_QWORD *)&v7 + 1) = v8;
  *(float *)a1 = v10;
  *(_OWORD *)(a1 + 4) = v7;
  *(_DWORD *)(a1 + 20) = v6;
  return result;
}

double key path getter for SCNBoundingVolume.boundingBox : <A>A@<D0>(uint64_t a1@<X8>)
{
  double result;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  SCNBoundingVolume.boundingBox.getter((uint64_t)&v4);
  result = *(double *)&v4;
  v3 = v5;
  *(_OWORD *)a1 = v4;
  *(_QWORD *)(a1 + 16) = v3;
  return result;
}

id key path setter for SCNBoundingVolume.boundingBox : <A>A(float *a1)
{
  return SCNBoundingVolume.boundingBox.setter(*a1, a1[1], a1[2], a1[3], a1[4], a1[5]);
}

id SCNBoundingVolume.boundingBox.setter(float a1, float a2, float a3, float a4, float a5, float a6)
{
  void *v6;
  _DWORD v8[3];
  _DWORD v9[3];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  *(float *)v9 = a1;
  *(float *)&v9[1] = a2;
  *(float *)&v9[2] = a3;
  *(float *)v8 = a4;
  *(float *)&v8[1] = a5;
  *(float *)&v8[2] = a6;
  return objc_msgSend(v6, sel_setBoundingBoxMin_max_, v9, v8);
}

void (*SCNBoundingVolume.boundingBox.modify(_QWORD *a1))(void ***a1, char a2)
{
  void *v1;
  char *v3;
  int8x16_t v4;
  int8x16_t v5;
  int8x16_t v6;

  v3 = (char *)malloc(0x38uLL);
  *a1 = v3;
  *(_QWORD *)v3 = v1;
  v4.i32[0] = *(_DWORD *)(MEMORY[0x24BDE8320] + 8);
  v5.i64[0] = *MEMORY[0x24BDE8320];
  *((_QWORD *)v3 + 4) = *MEMORY[0x24BDE8320];
  v6 = vextq_s8(vextq_s8(v4, v4, 4uLL), v5, 0xCuLL);
  v6.i32[3] = v6.i32[0];
  *(int8x16_t *)(v3 + 40) = v6;
  objc_msgSend(v1, sel_getBoundingBoxMin_max_, v3 + 32, v3 + 44);
  *(_OWORD *)(v3 + 8) = *((_OWORD *)v3 + 2);
  *((_QWORD *)v3 + 3) = *((_QWORD *)v3 + 6);
  return SCNBoundingVolume.boundingBox.modify;
}

void SCNBoundingVolume.boundingBox.modify(void ***a1, char a2)
{
  void **v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  __int128 v8;
  void *v9;

  v2 = *a1;
  v3 = (*a1)[1];
  v4 = (uint64_t)(*a1 + 4);
  v5 = (uint64_t)*a1 + 44;
  v7 = *((_DWORD *)*a1 + 4);
  v6 = *((_DWORD *)*a1 + 5);
  *(_QWORD *)&v8 = (*a1)[3];
  v9 = **a1;
  if ((a2 & 1) != 0)
  {
    *((_DWORD *)v2 + 13) = v7;
    *((_DWORD *)v2 + 8) = v6;
    *((_QWORD *)&v8 + 1) = v3;
    *(_OWORD *)((char *)v2 + 36) = v8;
    objc_msgSend(v9, sel_setBoundingBoxMin_max_, v5, v4);
  }
  else
  {
    v2[4] = v3;
    *((_DWORD *)v2 + 10) = v7;
    *((_DWORD *)v2 + 11) = v6;
    v2[6] = (void *)v8;
    objc_msgSend(v9, sel_setBoundingBoxMin_max_, v4, v5);
  }
  free(v2);
}

float SCNBoundingVolume.boundingSphere.getter()
{
  void *v0;
  int v1;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(MEMORY[0x24BDE8320] + 8);
  v4 = *MEMORY[0x24BDE8320];
  v5 = v1;
  v3 = 0;
  objc_msgSend(v0, sel_getBoundingSphereCenter_radius_, &v4, &v3);
  return *(float *)&v4;
}

uint64_t SCNSceneSource.entryWithIdentifier<A>(_:withClass:)()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v4;
  _OWORD v5[2];
  __int128 v6;
  uint64_t v7;
  __int128 v8;

  v1 = (void *)MEMORY[0x212BE2B70]();
  v2 = objc_msgSend(v0, sel_entryWithIdentifier_withClass_, v1, swift_getObjCClassFromMetadata());

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  outlined init with take of Any?((uint64_t)v5, (uint64_t)&v6);
  if (v7)
  {
    outlined init with take of Any(&v6, &v8);
    swift_dynamicCast();
    return v4;
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v6);
    return 0;
  }
}

uint64_t specialized Data.InlineData.init(_:)(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t specialized Data.init(bytes:count:)(_BYTE *__src, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  if (a2 <= 14)
    return specialized Data.InlineData.init(_:)(__src, &__src[a2]);
  type metadata accessor for __DataStorage();
  swift_allocObject();
  __DataStorage.init(bytes:length:)();
  if ((unint64_t)a2 < 0x7FFFFFFF)
    return a2 << 32;
  type metadata accessor for Data.RangeReference();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t outlined init with take of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BE2CB4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_21190B638()
{
  return 8;
}

_QWORD *sub_21190B644(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SCNMatrix4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy64_4(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for SCNMatrix4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 64))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SCNMatrix4(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 64) = v3;
  return result;
}

void type metadata accessor for SCNMatrix4(uint64_t a1)
{
  type metadata accessor for SCNMatrix4(a1, &lazy cache variable for type metadata for SCNMatrix4);
}

__n128 __swift_memcpy16_4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SCNVector4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SCNVector4(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for SCNVector4(uint64_t a1)
{
  type metadata accessor for SCNMatrix4(a1, &lazy cache variable for type metadata for SCNVector4);
}

uint64_t __swift_memcpy12_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for SCNVector3(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 12))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SCNVector3(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_DWORD *)(result + 8) = 0;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 12) = v3;
  return result;
}

void type metadata accessor for SCNVector3(uint64_t a1)
{
  type metadata accessor for SCNMatrix4(a1, &lazy cache variable for type metadata for SCNVector3);
}

void type metadata accessor for SCNMatrix4(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

id one-time initialization function for SCNVector3InNSValueObjCType()
{
  void *v0;
  double v1;
  double v2;
  double v3;
  id v4;
  id v5;
  id result;

  v0 = (void *)objc_opt_self();
  LODWORD(v1) = 0;
  LODWORD(v2) = 0;
  LODWORD(v3) = 0;
  v4 = objc_msgSend(v0, sel_valueWithSCNVector3_, v1, v2, v3);
  v5 = objc_msgSend(v4, sel_objCType);
  result = v4;
  SCNVector3InNSValueObjCType = (uint64_t)v5;
  return result;
}

id one-time initialization function for SCNVector4InNSValueObjCType()
{
  void *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;
  id v6;
  id result;

  v0 = (void *)objc_opt_self();
  LODWORD(v1) = 0;
  LODWORD(v2) = 0;
  LODWORD(v3) = 0;
  LODWORD(v4) = 0;
  v5 = objc_msgSend(v0, sel_valueWithSCNVector4_, v1, v2, v3, v4);
  v6 = objc_msgSend(v5, sel_objCType);
  result = v5;
  SCNVector4InNSValueObjCType = (uint64_t)v6;
  return result;
}

NSValue __swiftcall SCNVector3._bridgeToObjectiveC()()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  v3 = v2;
  v4 = v1;
  v5 = v0;
  v6 = (void *)objc_opt_self();
  LODWORD(v7) = v5;
  LODWORD(v8) = v4;
  LODWORD(v9) = v3;
  return (NSValue)objc_msgSend(v6, sel_valueWithSCNVector3_, v7, v8, v9);
}

id static SCNVector3._forceBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  id result;
  unsigned int v6;
  unsigned int v7;
  int v8;

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  if (one-time initialization token for SCNVector3InNSValueObjCType != -1)
    swift_once();
  result = (id)strcmp(v4, (const char *)SCNVector3InNSValueObjCType);
  if ((_DWORD)result)
  {
    __break(1u);
  }
  else
  {
    result = objc_msgSend(v3, sel_SCNVector3Value);
    *(_QWORD *)a2 = v6 | ((unint64_t)v7 << 32);
    *(_DWORD *)(a2 + 8) = v8;
    *(_BYTE *)(a2 + 12) = 0;
  }
  return result;
}

BOOL static SCNVector3._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  int v5;
  unint64_t v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  _BOOL8 result;

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  if (one-time initialization token for SCNVector3InNSValueObjCType != -1)
    swift_once();
  v5 = strcmp(v4, (const char *)SCNVector3InNSValueObjCType);
  if (v5)
  {
    v6 = 0;
    v7 = 0;
  }
  else
  {
    objc_msgSend(v3, sel_SCNVector3Value);
    v6 = v8 | ((unint64_t)v9 << 32);
  }
  result = v5 == 0;
  *(_QWORD *)a2 = v6;
  *(_DWORD *)(a2 + 8) = v7;
  *(_BYTE *)(a2 + 12) = v5 != 0;
  return result;
}

id static SCNVector3._unconditionallyBridgeFromObjectiveC(_:)(id result)
{
  id v1;
  const char *v2;

  if (result)
  {
    v1 = objc_retainAutorelease(result);
    v2 = (const char *)objc_msgSend(v1, sel_objCType);
    if (one-time initialization token for SCNVector3InNSValueObjCType != -1)
      swift_once();
    result = (id)strcmp(v2, (const char *)SCNVector3InNSValueObjCType);
    if (!(_DWORD)result)
      return objc_msgSend(v1, sel_SCNVector3Value);
    __break(1u);
  }
  __break(1u);
  return result;
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance SCNVector3()
{
  int *v0;
  int v1;
  int v2;
  int v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = (void *)objc_opt_self();
  LODWORD(v5) = v1;
  LODWORD(v6) = v2;
  LODWORD(v7) = v3;
  return objc_msgSend(v4, sel_valueWithSCNVector3_, v5, v6, v7);
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance SCNVector3(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  id result;
  unsigned int v6;
  unsigned int v7;
  int v8;

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  if (one-time initialization token for SCNVector3InNSValueObjCType != -1)
    swift_once();
  result = (id)strcmp(v4, (const char *)SCNVector3InNSValueObjCType);
  if ((_DWORD)result)
  {
    __break(1u);
  }
  else
  {
    result = objc_msgSend(v3, sel_SCNVector3Value);
    *(_QWORD *)a2 = v6 | ((unint64_t)v7 << 32);
    *(_DWORD *)(a2 + 8) = v8;
    *(_BYTE *)(a2 + 12) = 0;
  }
  return result;
}

BOOL protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance SCNVector3(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  int v5;
  unint64_t v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  _BOOL8 result;

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  if (one-time initialization token for SCNVector3InNSValueObjCType != -1)
    swift_once();
  v5 = strcmp(v4, (const char *)SCNVector3InNSValueObjCType);
  if (v5)
  {
    v6 = 0;
    v7 = 0;
  }
  else
  {
    objc_msgSend(v3, sel_SCNVector3Value);
    v6 = v8 | ((unint64_t)v9 << 32);
  }
  result = v5 == 0;
  *(_QWORD *)a2 = v6;
  *(_DWORD *)(a2 + 8) = v7;
  *(_BYTE *)(a2 + 12) = v5 != 0;
  return result;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance SCNVector3@<X0>(id result@<X0>, _DWORD *a2@<X8>)
{
  id v3;
  const char *v4;
  int v5;
  int v6;
  int v7;

  if (result)
  {
    v3 = objc_retainAutorelease(result);
    v4 = (const char *)objc_msgSend(v3, sel_objCType);
    if (one-time initialization token for SCNVector3InNSValueObjCType != -1)
      swift_once();
    result = (id)strcmp(v4, (const char *)SCNVector3InNSValueObjCType);
    if (!(_DWORD)result)
    {
      result = objc_msgSend(v3, sel_SCNVector3Value);
      *a2 = v5;
      a2[1] = v6;
      a2[2] = v7;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

NSValue __swiftcall SCNVector4._bridgeToObjectiveC()()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = v3;
  v5 = v2;
  v6 = v1;
  v7 = v0;
  v8 = (void *)objc_opt_self();
  LODWORD(v9) = v7;
  LODWORD(v10) = v6;
  LODWORD(v11) = v5;
  LODWORD(v12) = v4;
  return (NSValue)objc_msgSend(v8, sel_valueWithSCNVector4_, v9, v10, v11, v12);
}

id static SCNVector4._forceBridgeFromObjectiveC(_:result:)(void *a1, int8x16_t *a2)
{
  id v3;
  const char *v4;
  id result;
  unsigned int v6;
  unsigned int v7;
  int8x16_t v8;
  __int32 v9;
  int32x2_t v10;

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  if (one-time initialization token for SCNVector4InNSValueObjCType != -1)
    swift_once();
  result = (id)strcmp(v4, (const char *)SCNVector4InNSValueObjCType);
  if ((_DWORD)result)
  {
    __break(1u);
  }
  else
  {
    result = objc_msgSend(v3, sel_SCNVector4Value);
    v8.i64[0] = v6;
    v8.i64[1] = v7;
    v10.i32[1] = v9;
    *a2 = vorrq_s8((int8x16_t)vshll_n_s32(v10, 0x20uLL), v8);
    a2[1].i8[0] = 0;
  }
  return result;
}

BOOL static SCNVector4._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, int8x16_t *a2)
{
  id v3;
  const char *v4;
  int v5;
  int8x16_t v6;
  unsigned int v7;
  unsigned int v8;
  int8x16_t v9;
  __int32 v10;
  int32x2_t v11;
  _BOOL8 result;

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  if (one-time initialization token for SCNVector4InNSValueObjCType != -1)
    swift_once();
  v5 = strcmp(v4, (const char *)SCNVector4InNSValueObjCType);
  v6 = 0uLL;
  if (!v5)
  {
    objc_msgSend(v3, sel_SCNVector4Value, 0.0);
    v9.i64[0] = v7;
    v9.i64[1] = v8;
    v11.i32[1] = v10;
    v6 = vorrq_s8((int8x16_t)vshll_n_s32(v11, 0x20uLL), v9);
  }
  result = v5 == 0;
  *a2 = v6;
  a2[1].i8[0] = v5 != 0;
  return result;
}

id static SCNVector4._unconditionallyBridgeFromObjectiveC(_:)(id result)
{
  id v1;
  const char *v2;

  if (result)
  {
    v1 = objc_retainAutorelease(result);
    v2 = (const char *)objc_msgSend(v1, sel_objCType);
    if (one-time initialization token for SCNVector4InNSValueObjCType != -1)
      swift_once();
    result = (id)strcmp(v2, (const char *)SCNVector4InNSValueObjCType);
    if (!(_DWORD)result)
      return objc_msgSend(v1, sel_SCNVector4Value);
    __break(1u);
  }
  __break(1u);
  return result;
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance SCNVector4()
{
  int *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  v5 = (void *)objc_opt_self();
  LODWORD(v6) = v1;
  LODWORD(v7) = v2;
  LODWORD(v8) = v3;
  LODWORD(v9) = v4;
  return objc_msgSend(v5, sel_valueWithSCNVector4_, v6, v7, v8, v9);
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance SCNVector4(void *a1, int8x16_t *a2)
{
  id v3;
  const char *v4;
  id result;
  unsigned int v6;
  unsigned int v7;
  int8x16_t v8;
  __int32 v9;
  int32x2_t v10;

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  if (one-time initialization token for SCNVector4InNSValueObjCType != -1)
    swift_once();
  result = (id)strcmp(v4, (const char *)SCNVector4InNSValueObjCType);
  if ((_DWORD)result)
  {
    __break(1u);
  }
  else
  {
    result = objc_msgSend(v3, sel_SCNVector4Value);
    v8.i64[0] = v6;
    v8.i64[1] = v7;
    v10.i32[1] = v9;
    *a2 = vorrq_s8((int8x16_t)vshll_n_s32(v10, 0x20uLL), v8);
    a2[1].i8[0] = 0;
  }
  return result;
}

BOOL protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance SCNVector4(void *a1, int8x16_t *a2)
{
  id v3;
  const char *v4;
  int v5;
  int8x16_t v6;
  unsigned int v7;
  unsigned int v8;
  int8x16_t v9;
  __int32 v10;
  int32x2_t v11;
  _BOOL8 result;

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  if (one-time initialization token for SCNVector4InNSValueObjCType != -1)
    swift_once();
  v5 = strcmp(v4, (const char *)SCNVector4InNSValueObjCType);
  v6 = 0uLL;
  if (!v5)
  {
    objc_msgSend(v3, sel_SCNVector4Value, 0.0);
    v9.i64[0] = v7;
    v9.i64[1] = v8;
    v11.i32[1] = v10;
    v6 = vorrq_s8((int8x16_t)vshll_n_s32(v11, 0x20uLL), v9);
  }
  result = v5 == 0;
  *a2 = v6;
  a2[1].i8[0] = v5 != 0;
  return result;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance SCNVector4@<X0>(id result@<X0>, _DWORD *a2@<X8>)
{
  id v3;
  const char *v4;
  int v5;
  int v6;
  int v7;
  int v8;

  if (result)
  {
    v3 = objc_retainAutorelease(result);
    v4 = (const char *)objc_msgSend(v3, sel_objCType);
    if (one-time initialization token for SCNVector4InNSValueObjCType != -1)
      swift_once();
    result = (id)strcmp(v4, (const char *)SCNVector4InNSValueObjCType);
    if (!(_DWORD)result)
    {
      result = objc_msgSend(v3, sel_SCNVector4Value);
      *a2 = v5;
      a2[1] = v6;
      a2[2] = v7;
      a2[3] = v8;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id one-time initialization function for SCNMatrix4InNSValueObjCType()
{
  id v0;
  id v1;
  id result;
  _OWORD v3[4];

  memset(v3, 0, sizeof(v3));
  v0 = objc_msgSend((id)objc_opt_self(), sel_valueWithSCNMatrix4_, v3);
  v1 = objc_msgSend(v0, sel_objCType);
  result = v0;
  SCNMatrix4InNSValueObjCType = (uint64_t)v1;
  return result;
}

NSValue __swiftcall SCNMatrix4._bridgeToObjectiveC()()
{
  _OWORD *v0;
  void *v1;
  __int128 v2;
  __int128 v3;
  _OWORD v5[4];

  v1 = (void *)objc_opt_self();
  v2 = v0[1];
  v5[0] = *v0;
  v5[1] = v2;
  v3 = v0[3];
  v5[2] = v0[2];
  v5[3] = v3;
  return (NSValue)objc_msgSend(v1, sel_valueWithSCNMatrix4_, v5);
}

id static SCNMatrix4._forceBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  id result;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  if (one-time initialization token for SCNMatrix4InNSValueObjCType != -1)
    swift_once();
  result = (id)strcmp(v4, (const char *)SCNMatrix4InNSValueObjCType);
  if ((_DWORD)result)
  {
    __break(1u);
  }
  else
  {
    result = objc_msgSend(v3, sel_SCNMatrix4Value);
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v7;
    *(_OWORD *)(a2 + 32) = v8;
    *(_OWORD *)(a2 + 48) = v9;
    *(_BYTE *)(a2 + 64) = 0;
  }
  return result;
}

BOOL static SCNMatrix4._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  int v5;
  _BOOL8 result;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  if (one-time initialization token for SCNMatrix4InNSValueObjCType != -1)
    swift_once();
  v5 = strcmp(v4, (const char *)SCNMatrix4InNSValueObjCType);
  if (v5)
  {
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    objc_msgSend(v3, sel_SCNMatrix4Value);
    *(_OWORD *)a2 = v7;
    *(_OWORD *)(a2 + 16) = v8;
    *(_OWORD *)(a2 + 32) = v9;
    *(_OWORD *)(a2 + 48) = v10;
  }
  result = v5 == 0;
  *(_BYTE *)(a2 + 64) = v5 != 0;
  return result;
}

id static SCNMatrix4._unconditionallyBridgeFromObjectiveC(_:)@<X0>(id result@<X0>, _OWORD *a2@<X8>)
{
  id v3;
  const char *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  if (result)
  {
    v3 = objc_retainAutorelease(result);
    v4 = (const char *)objc_msgSend(v3, sel_objCType);
    if (one-time initialization token for SCNMatrix4InNSValueObjCType != -1)
      swift_once();
    result = (id)strcmp(v4, (const char *)SCNMatrix4InNSValueObjCType);
    if (!(_DWORD)result)
    {
      result = objc_msgSend(v3, sel_SCNMatrix4Value);
      *a2 = v5;
      a2[1] = v6;
      a2[2] = v7;
      a2[3] = v8;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance SCNMatrix4()
{
  _OWORD *v0;
  void *v1;
  __int128 v2;
  __int128 v3;
  _OWORD v5[4];

  v1 = (void *)objc_opt_self();
  v2 = v0[1];
  v5[0] = *v0;
  v5[1] = v2;
  v3 = v0[3];
  v5[2] = v0[2];
  v5[3] = v3;
  return objc_msgSend(v1, sel_valueWithSCNMatrix4_, v5);
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance SCNMatrix4(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  id result;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  if (one-time initialization token for SCNMatrix4InNSValueObjCType != -1)
    swift_once();
  result = (id)strcmp(v4, (const char *)SCNMatrix4InNSValueObjCType);
  if ((_DWORD)result)
  {
    __break(1u);
  }
  else
  {
    result = objc_msgSend(v3, sel_SCNMatrix4Value);
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v7;
    *(_OWORD *)(a2 + 32) = v8;
    *(_OWORD *)(a2 + 48) = v9;
    *(_BYTE *)(a2 + 64) = 0;
  }
  return result;
}

BOOL protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance SCNMatrix4(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  int v5;
  _BOOL8 result;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  if (one-time initialization token for SCNMatrix4InNSValueObjCType != -1)
    swift_once();
  v5 = strcmp(v4, (const char *)SCNMatrix4InNSValueObjCType);
  if (v5)
  {
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    objc_msgSend(v3, sel_SCNMatrix4Value);
    *(_OWORD *)a2 = v7;
    *(_OWORD *)(a2 + 16) = v8;
    *(_OWORD *)(a2 + 32) = v9;
    *(_OWORD *)(a2 + 48) = v10;
  }
  result = v5 == 0;
  *(_BYTE *)(a2 + 64) = v5 != 0;
  return result;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance SCNMatrix4@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id v3;
  const char *v4;
  id result;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  if (a1)
  {
    v3 = objc_retainAutorelease(a1);
    v4 = (const char *)objc_msgSend(v3, sel_objCType);
    if (one-time initialization token for SCNMatrix4InNSValueObjCType != -1)
      swift_once();
    if (!strcmp(v4, (const char *)SCNMatrix4InNSValueObjCType))
    {
      result = objc_msgSend(v3, sel_SCNMatrix4Value);
      *a2 = v6;
      a2[1] = v7;
      a2[2] = v8;
      a2[3] = v9;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return (id)__DataStorage.init(bytes:length:)();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x24BDCDC10]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x24BDCDCA0]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t Array.endIndex.getter()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t type metadata accessor for _ArrayBuffer()
{
  return MEMORY[0x24BEE2668]();
}

uint64_t ContiguousArray.init<A>(_:)()
{
  return MEMORY[0x24BEE2A20]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t _ContiguousArrayBuffer.firstElementAddress.getter()
{
  return MEMORY[0x24BEE3538]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x24BEE4B28]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

