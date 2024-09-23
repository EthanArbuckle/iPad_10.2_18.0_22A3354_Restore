uint64_t MDLMatrix4x4Array.float4x4Array.getter()
{
  return MDLMatrix4x4Array.float4x4Array.getter(type metadata accessor for simd_float4x4, (SEL *)&selRef_getFloat4x4Array_maxCount_);
}

unint64_t key path getter for MDLMatrix4x4Array.float4x4Array : MDLMatrix4x4Array@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
{
  return key path getter for MDLMatrix4x4Array.float4x4Array : MDLMatrix4x4Array(a1, type metadata accessor for simd_float4x4, (SEL *)&selRef_getFloat4x4Array_maxCount_, a2);
}

id key path setter for MDLMatrix4x4Array.float4x4Array : MDLMatrix4x4Array(uint64_t a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFloat4x4Array_count_, *(_QWORD *)a1 + 32, *(_QWORD *)(*(_QWORD *)a1 + 16));
}

uint64_t MDLMatrix4x4Array.float4x4Array.setter(uint64_t a1)
{
  return MDLMatrix4x4Array.float4x4Array.setter(a1, (SEL *)&selRef_setFloat4x4Array_count_);
}

void type metadata accessor for simd_float4x4(uint64_t a1)
{
  type metadata accessor for simd_float4x4(a1, &lazy cache variable for type metadata for simd_float4x4);
}

uint64_t (*MDLMatrix4x4Array.float4x4Array.modify(uint64_t *a1))(id *a1, uint64_t a2)
{
  void *v1;
  uint64_t (*result)(id *, uint64_t);
  uint64_t (*v4)(id *, uint64_t);
  uint64_t v5;

  a1[1] = (uint64_t)v1;
  result = (uint64_t (*)(id *, uint64_t))objc_msgSend(v1, sel_elementCount);
  if (((unint64_t)result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v4 = result;
    if (result)
    {
      type metadata accessor for simd_float4x4(0);
      v5 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(_QWORD *)(v5 + 16) = v4;
    }
    else
    {
      v5 = MEMORY[0x24BEE4AF8];
    }
    objc_msgSend(v1, sel_getFloat4x4Array_maxCount_, v5 + 32, v4);
    *(_QWORD *)(v5 + 16) = v4;
    *a1 = v5;
    return MDLMatrix4x4Array.float4x4Array.modify;
  }
  return result;
}

uint64_t MDLMatrix4x4Array.float4x4Array.modify(id *a1, uint64_t a2)
{
  return MDLMatrix4x4Array.float4x4Array.modify(a1, a2, (SEL *)&selRef_setFloat4x4Array_count_);
}

uint64_t MDLMatrix4x4Array.double4x4Array.getter()
{
  return MDLMatrix4x4Array.float4x4Array.getter(type metadata accessor for simd_double4x4, (SEL *)&selRef_getDouble4x4Array_maxCount_);
}

uint64_t MDLMatrix4x4Array.float4x4Array.getter(void (*a1)(_QWORD), SEL *a2)
{
  void *v2;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = (uint64_t)objc_msgSend(v2, sel_elementCount);
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v6 = result;
    if (result)
    {
      a1(0);
      v7 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(_QWORD *)(v7 + 16) = v6;
    }
    else
    {
      v7 = MEMORY[0x24BEE4AF8];
    }
    objc_msgSend(v2, *a2, v7 + 32, v6);
    *(_QWORD *)(v7 + 16) = v6;
    return v7;
  }
  return result;
}

unint64_t key path getter for MDLMatrix4x4Array.double4x4Array : MDLMatrix4x4Array@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
{
  return key path getter for MDLMatrix4x4Array.float4x4Array : MDLMatrix4x4Array(a1, type metadata accessor for simd_double4x4, (SEL *)&selRef_getDouble4x4Array_maxCount_, a2);
}

unint64_t key path getter for MDLMatrix4x4Array.float4x4Array : MDLMatrix4x4Array@<X0>(id *a1@<X0>, void (*a2)(_QWORD)@<X3>, SEL *a3@<X4>, uint64_t *a4@<X8>)
{
  id v7;
  unint64_t result;
  unint64_t v9;
  uint64_t v10;

  v7 = *a1;
  result = (unint64_t)objc_msgSend(*a1, sel_elementCount);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v9 = result;
    if (result)
    {
      a2(0);
      v10 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(_QWORD *)(v10 + 16) = v9;
    }
    else
    {
      v10 = MEMORY[0x24BEE4AF8];
    }
    result = (unint64_t)objc_msgSend(v7, *a3, v10 + 32, v9);
    *(_QWORD *)(v10 + 16) = v9;
    *a4 = v10;
  }
  return result;
}

id key path setter for MDLMatrix4x4Array.double4x4Array : MDLMatrix4x4Array(uint64_t a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDouble4x4Array_count_, *(_QWORD *)a1 + 32, *(_QWORD *)(*(_QWORD *)a1 + 16));
}

uint64_t MDLMatrix4x4Array.double4x4Array.setter(uint64_t a1)
{
  return MDLMatrix4x4Array.float4x4Array.setter(a1, (SEL *)&selRef_setDouble4x4Array_count_);
}

uint64_t MDLMatrix4x4Array.float4x4Array.setter(uint64_t a1, SEL *a2)
{
  void *v2;

  objc_msgSend(v2, *a2, a1 + 32, *(_QWORD *)(a1 + 16));
  return swift_bridgeObjectRelease();
}

void type metadata accessor for simd_double4x4(uint64_t a1)
{
  type metadata accessor for simd_float4x4(a1, &lazy cache variable for type metadata for simd_double4x4);
}

uint64_t (*MDLMatrix4x4Array.double4x4Array.modify(uint64_t *a1))(id *a1, uint64_t a2)
{
  void *v1;
  uint64_t (*result)(id *, uint64_t);
  uint64_t (*v4)(id *, uint64_t);
  uint64_t v5;

  a1[1] = (uint64_t)v1;
  result = (uint64_t (*)(id *, uint64_t))objc_msgSend(v1, sel_elementCount);
  if (((unint64_t)result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v4 = result;
    if (result)
    {
      type metadata accessor for simd_double4x4(0);
      v5 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(_QWORD *)(v5 + 16) = v4;
    }
    else
    {
      v5 = MEMORY[0x24BEE4AF8];
    }
    objc_msgSend(v1, sel_getDouble4x4Array_maxCount_, v5 + 32, v4);
    *(_QWORD *)(v5 + 16) = v4;
    *a1 = v5;
    return MDLMatrix4x4Array.double4x4Array.modify;
  }
  return result;
}

uint64_t MDLMatrix4x4Array.double4x4Array.modify(id *a1, uint64_t a2)
{
  return MDLMatrix4x4Array.float4x4Array.modify(a1, a2, (SEL *)&selRef_setDouble4x4Array_count_);
}

uint64_t MDLMatrix4x4Array.float4x4Array.modify(id *a1, uint64_t a2, SEL *a3)
{
  objc_msgSend(a1[1], *a3, (char *)*a1 + 32, *((_QWORD *)*a1 + 2));
  return swift_bridgeObjectRelease();
}

uint64_t MDLAnimatedValue.times.getter()
{
  return MDLAnimatedValue.times.getter(MEMORY[0x24BEE13C8], (SEL *)&selRef_getTimes_maxCount_);
}

Swift::Void __swiftcall MDLAnimatedScalarArray.set(floatArray:atTime:)(Swift::OpaquePointer floatArray, Swift::Double atTime)
{
  void *v2;

  objc_msgSend(v2, sel_setFloatArray_count_atTime_, (char *)floatArray._rawValue + 32, *((_QWORD *)floatArray._rawValue + 2), atTime);
}

Swift::Void __swiftcall MDLAnimatedScalarArray.set(doubleArray:atTime:)(Swift::OpaquePointer doubleArray, Swift::Double atTime)
{
  void *v2;

  objc_msgSend(v2, sel_setDoubleArray_count_atTime_, (char *)doubleArray._rawValue + 32, *((_QWORD *)doubleArray._rawValue + 2), atTime);
}

uint64_t MDLAnimatedScalarArray.floatArray(atTime:)(double a1)
{
  return MDLAnimatedScalarArray.floatArray(atTime:)(a1, MEMORY[0x24BEE14E8], (SEL *)&selRef_getFloatArray_maxCount_atTime_);
}

uint64_t MDLAnimatedScalarArray.doubleArray(atTime:)(double a1)
{
  return MDLAnimatedScalarArray.floatArray(atTime:)(a1, MEMORY[0x24BEE13C8], (SEL *)&selRef_getDoubleArray_maxCount_atTime_);
}

uint64_t MDLAnimatedScalarArray.floatArray(atTime:)(double a1, uint64_t a2, SEL *a3)
{
  void *v3;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = (uint64_t)objc_msgSend(v3, sel_elementCount);
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v7 = result;
    if (result)
    {
      v8 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(_QWORD *)(v8 + 16) = v7;
    }
    else
    {
      v8 = MEMORY[0x24BEE4AF8];
    }
    objc_msgSend(v3, *a3, v8 + 32, objc_msgSend(v3, sel_elementCount), a1);
    *(_QWORD *)(v8 + 16) = v7;
    return v8;
  }
  return result;
}

Swift::Void __swiftcall MDLAnimatedScalarArray.reset(floatArray:atTimes:)(Swift::OpaquePointer floatArray, Swift::OpaquePointer atTimes)
{
  MDLAnimatedScalarArray.reset(floatArray:atTimes:)((uint64_t)floatArray._rawValue, (uint64_t)atTimes._rawValue, (SEL *)&selRef_resetWithFloatArray_count_atTimes_count_);
}

Swift::Void __swiftcall MDLAnimatedScalarArray.reset(doubleArray:atTimes:)(Swift::OpaquePointer doubleArray, Swift::OpaquePointer atTimes)
{
  MDLAnimatedScalarArray.reset(floatArray:atTimes:)((uint64_t)doubleArray._rawValue, (uint64_t)atTimes._rawValue, (SEL *)&selRef_resetWithDoubleArray_count_atTimes_count_);
}

uint64_t MDLAnimatedScalarArray.floatArray.getter()
{
  return MDLAnimatedScalarArray.floatArray.getter(MEMORY[0x24BEE14E8], (SEL *)&selRef_getFloatArray_maxCount_);
}

uint64_t MDLAnimatedScalarArray.doubleArray.getter()
{
  return MDLAnimatedScalarArray.floatArray.getter(MEMORY[0x24BEE13C8], (SEL *)&selRef_getDoubleArray_maxCount_);
}

uint64_t MDLAnimatedScalarArray.floatArray.getter(uint64_t a1, SEL *a2)
{
  void *v2;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  v4 = (uint64_t)objc_msgSend(v2, sel_elementCount);
  result = (uint64_t)objc_msgSend(v2, sel_timeSampleCount);
  v6 = v4 * result;
  if ((unsigned __int128)(v4 * (__int128)result) >> 64 != (v4 * result) >> 63)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v6 < 0)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  if (v6)
  {
    v7 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(_QWORD *)(v7 + 16) = v6;
  }
  else
  {
    v7 = MEMORY[0x24BEE4AF8];
  }
  objc_msgSend(v2, *a2, v7 + 32, v6);
  *(_QWORD *)(v7 + 16) = v6;
  return v7;
}

Swift::Void __swiftcall MDLAnimatedVector3Array.set(float3Array:atTime:)(Swift::OpaquePointer float3Array, Swift::Double atTime)
{
  void *v2;

  objc_msgSend(v2, sel_setFloat3Array_count_atTime_, (char *)float3Array._rawValue + 32, *((_QWORD *)float3Array._rawValue + 2), atTime);
}

Swift::Void __swiftcall MDLAnimatedVector3Array.set(double3Array:atTime:)(Swift::OpaquePointer double3Array, Swift::Double atTime)
{
  void *v2;

  objc_msgSend(v2, sel_setDouble3Array_count_atTime_, (char *)double3Array._rawValue + 32, *((_QWORD *)double3Array._rawValue + 2), atTime);
}

uint64_t MDLAnimatedVector3Array.float3Array(atTime:)(double a1)
{
  return MDLAnimatedVector3Array.float3Array(atTime:)(&demangling cache variable for type metadata for SIMD3<Float>, (SEL *)&selRef_getFloat3Array_maxCount_atTime_, a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212B9B180]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t MDLAnimatedVector3Array.double3Array(atTime:)(double a1)
{
  return MDLAnimatedVector3Array.float3Array(atTime:)(&demangling cache variable for type metadata for SIMD3<Double>, (SEL *)&selRef_getDouble3Array_maxCount_atTime_, a1);
}

uint64_t MDLAnimatedVector3Array.float3Array(atTime:)(uint64_t *a1, SEL *a2, double a3)
{
  void *v3;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = (uint64_t)objc_msgSend(v3, sel_elementCount);
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v8 = result;
    if (result)
    {
      __swift_instantiateConcreteTypeFromMangledName(a1);
      v9 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(_QWORD *)(v9 + 16) = v8;
    }
    else
    {
      v9 = MEMORY[0x24BEE4AF8];
    }
    objc_msgSend(v3, *a2, v9 + 32, objc_msgSend(v3, sel_elementCount), a3);
    *(_QWORD *)(v9 + 16) = v8;
    return v9;
  }
  return result;
}

Swift::Void __swiftcall MDLAnimatedVector3Array.reset(float3Array:atTimes:)(Swift::OpaquePointer float3Array, Swift::OpaquePointer atTimes)
{
  MDLAnimatedScalarArray.reset(floatArray:atTimes:)((uint64_t)float3Array._rawValue, (uint64_t)atTimes._rawValue, (SEL *)&selRef_resetWithFloat3Array_count_atTimes_count_);
}

Swift::Void __swiftcall MDLAnimatedVector3Array.reset(double3Array:atTimes:)(Swift::OpaquePointer double3Array, Swift::OpaquePointer atTimes)
{
  MDLAnimatedScalarArray.reset(floatArray:atTimes:)((uint64_t)double3Array._rawValue, (uint64_t)atTimes._rawValue, (SEL *)&selRef_resetWithDouble3Array_count_atTimes_count_);
}

uint64_t MDLAnimatedVector3Array.float3Array.getter()
{
  return MDLAnimatedVector3Array.float3Array.getter(&demangling cache variable for type metadata for SIMD3<Float>, (SEL *)&selRef_getFloat3Array_maxCount_);
}

uint64_t MDLAnimatedVector3Array.double3Array.getter()
{
  return MDLAnimatedVector3Array.float3Array.getter(&demangling cache variable for type metadata for SIMD3<Double>, (SEL *)&selRef_getDouble3Array_maxCount_);
}

uint64_t MDLAnimatedVector3Array.float3Array.getter(uint64_t *a1, SEL *a2)
{
  void *v2;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v5 = (uint64_t)objc_msgSend(v2, sel_elementCount);
  result = (uint64_t)objc_msgSend(v2, sel_timeSampleCount);
  v7 = v5 * result;
  if ((unsigned __int128)(v5 * (__int128)result) >> 64 != (v5 * result) >> 63)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v7 < 0)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(a1);
    v8 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(_QWORD *)(v8 + 16) = v7;
  }
  else
  {
    v8 = MEMORY[0x24BEE4AF8];
  }
  objc_msgSend(v2, *a2, v8 + 32, v7);
  *(_QWORD *)(v8 + 16) = v7;
  return v8;
}

Swift::Void __swiftcall MDLAnimatedQuaternionArray.set(floatQuaternionArray:atTime:)(Swift::OpaquePointer floatQuaternionArray, Swift::Double atTime)
{
  void *v2;

  objc_msgSend(v2, sel_setFloatQuaternionArray_count_atTime_, (char *)floatQuaternionArray._rawValue + 32, *((_QWORD *)floatQuaternionArray._rawValue + 2), atTime);
}

Swift::Void __swiftcall MDLAnimatedQuaternionArray.set(doubleQuaternionArray:atTime:)(Swift::OpaquePointer doubleQuaternionArray, Swift::Double atTime)
{
  void *v2;

  objc_msgSend(v2, sel_setDoubleQuaternionArray_count_atTime_, (char *)doubleQuaternionArray._rawValue + 32, *((_QWORD *)doubleQuaternionArray._rawValue + 2), atTime);
}

uint64_t MDLAnimatedQuaternionArray.floatQuaternionArray(atTime:)(double a1)
{
  return MDLAnimatedQuaternionArray.floatQuaternionArray(atTime:)(type metadata accessor for simd_quatf, (SEL *)&selRef_getFloatQuaternionArray_maxCount_atTime_, a1);
}

void type metadata accessor for simd_quatf(uint64_t a1)
{
  type metadata accessor for simd_float4x4(a1, &lazy cache variable for type metadata for simd_quatf);
}

uint64_t MDLAnimatedQuaternionArray.doubleQuaternionArray(atTime:)(double a1)
{
  return MDLAnimatedQuaternionArray.floatQuaternionArray(atTime:)(type metadata accessor for simd_quatd, (SEL *)&selRef_getDoubleQuaternionArray_maxCount_atTime_, a1);
}

uint64_t MDLAnimatedQuaternionArray.floatQuaternionArray(atTime:)(void (*a1)(_QWORD), SEL *a2, double a3)
{
  void *v3;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = (uint64_t)objc_msgSend(v3, sel_elementCount);
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v8 = result;
    if (result)
    {
      a1(0);
      v9 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(_QWORD *)(v9 + 16) = v8;
    }
    else
    {
      v9 = MEMORY[0x24BEE4AF8];
    }
    objc_msgSend(v3, *a2, v9 + 32, objc_msgSend(v3, sel_elementCount), a3);
    *(_QWORD *)(v9 + 16) = v8;
    return v9;
  }
  return result;
}

void type metadata accessor for simd_quatd(uint64_t a1)
{
  type metadata accessor for simd_float4x4(a1, &lazy cache variable for type metadata for simd_quatd);
}

void type metadata accessor for simd_float4x4(uint64_t a1, unint64_t *a2)
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

Swift::Void __swiftcall MDLAnimatedQuaternionArray.reset(floatQuaternionArray:atTimes:)(Swift::OpaquePointer floatQuaternionArray, Swift::OpaquePointer atTimes)
{
  MDLAnimatedScalarArray.reset(floatArray:atTimes:)((uint64_t)floatQuaternionArray._rawValue, (uint64_t)atTimes._rawValue, (SEL *)&selRef_resetWithFloatQuaternionArray_count_atTimes_count_);
}

Swift::Void __swiftcall MDLAnimatedQuaternionArray.reset(doubleQuaternionArray:atTimes:)(Swift::OpaquePointer doubleQuaternionArray, Swift::OpaquePointer atTimes)
{
  MDLAnimatedScalarArray.reset(floatArray:atTimes:)((uint64_t)doubleQuaternionArray._rawValue, (uint64_t)atTimes._rawValue, (SEL *)&selRef_resetWithDoubleQuaternionArray_count_atTimes_count_);
}

id MDLAnimatedScalarArray.reset(floatArray:atTimes:)(uint64_t a1, uint64_t a2, SEL *a3)
{
  void *v3;

  return objc_msgSend(v3, *a3, a1 + 32, *(_QWORD *)(a1 + 16), a2 + 32, *(_QWORD *)(a2 + 16));
}

uint64_t MDLAnimatedQuaternionArray.floatQuaternionArray.getter()
{
  return MDLAnimatedQuaternionArray.floatQuaternionArray.getter(type metadata accessor for simd_quatf, (SEL *)&selRef_getFloatQuaternionArray_maxCount_);
}

uint64_t MDLAnimatedQuaternionArray.doubleQuaternionArray.getter()
{
  return MDLAnimatedQuaternionArray.floatQuaternionArray.getter(type metadata accessor for simd_quatd, (SEL *)&selRef_getDoubleQuaternionArray_maxCount_);
}

uint64_t MDLAnimatedQuaternionArray.floatQuaternionArray.getter(void (*a1)(_QWORD), SEL *a2)
{
  void *v2;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v5 = (uint64_t)objc_msgSend(v2, sel_elementCount);
  result = (uint64_t)objc_msgSend(v2, sel_timeSampleCount);
  v7 = v5 * result;
  if ((unsigned __int128)(v5 * (__int128)result) >> 64 != (v5 * result) >> 63)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v7 < 0)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  if (v7)
  {
    a1(0);
    v8 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(_QWORD *)(v8 + 16) = v7;
  }
  else
  {
    v8 = MEMORY[0x24BEE4AF8];
  }
  objc_msgSend(v2, *a2, v8 + 32, v7);
  *(_QWORD *)(v8 + 16) = v7;
  return v8;
}

Swift::Void __swiftcall MDLAnimatedScalar.reset(floatArray:atTimes:)(Swift::OpaquePointer floatArray, Swift::OpaquePointer atTimes)
{
  void *v2;

  objc_msgSend(v2, sel_resetWithFloatArray_atTimes_count_, (char *)floatArray._rawValue + 32, (char *)atTimes._rawValue + 32, *((_QWORD *)atTimes._rawValue + 2));
}

Swift::Void __swiftcall MDLAnimatedScalar.reset(doubleArray:atTimes:)(Swift::OpaquePointer doubleArray, Swift::OpaquePointer atTimes)
{
  void *v2;

  objc_msgSend(v2, sel_resetWithDoubleArray_atTimes_count_, (char *)doubleArray._rawValue + 32, (char *)atTimes._rawValue + 32, *((_QWORD *)atTimes._rawValue + 2));
}

uint64_t MDLAnimatedScalar.floatArray.getter()
{
  return MDLAnimatedValue.times.getter(MEMORY[0x24BEE14E8], (SEL *)&selRef_getFloatArray_maxCount_);
}

uint64_t MDLAnimatedScalar.doubleArray.getter()
{
  return MDLAnimatedValue.times.getter(MEMORY[0x24BEE13C8], (SEL *)&selRef_getDoubleArray_maxCount_);
}

uint64_t MDLAnimatedValue.times.getter(uint64_t a1, SEL *a2)
{
  void *v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = (uint64_t)objc_msgSend(v2, sel_timeSampleCount);
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v5 = result;
    if (result)
    {
      v6 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(_QWORD *)(v6 + 16) = v5;
    }
    else
    {
      v6 = MEMORY[0x24BEE4AF8];
    }
    objc_msgSend(v2, *a2, v6 + 32, objc_msgSend(v2, sel_timeSampleCount));
    *(_QWORD *)(v6 + 16) = v5;
    return v6;
  }
  return result;
}

Swift::Void __swiftcall MDLAnimatedVector2.reset(float2Array:atTimes:)(Swift::OpaquePointer float2Array, Swift::OpaquePointer atTimes)
{
  void *v2;

  objc_msgSend(v2, sel_resetWithFloat2Array_atTimes_count_, (char *)float2Array._rawValue + 32, (char *)atTimes._rawValue + 32, *((_QWORD *)atTimes._rawValue + 2));
}

Swift::Void __swiftcall MDLAnimatedVector2.reset(double2Array:atTimes:)(Swift::OpaquePointer double2Array, Swift::OpaquePointer atTimes)
{
  void *v2;

  objc_msgSend(v2, sel_resetWithDouble2Array_atTimes_count_, (char *)double2Array._rawValue + 32, (char *)atTimes._rawValue + 32, *((_QWORD *)atTimes._rawValue + 2));
}

uint64_t MDLAnimatedVector2.float2Array.getter()
{
  return MDLAnimatedVector2.float2Array.getter(&demangling cache variable for type metadata for SIMD2<Float>, (SEL *)&selRef_getFloat2Array_maxCount_);
}

uint64_t MDLAnimatedVector2.double2Array.getter()
{
  return MDLAnimatedVector2.float2Array.getter(&demangling cache variable for type metadata for SIMD2<Double>, (SEL *)&selRef_getDouble2Array_maxCount_);
}

Swift::Void __swiftcall MDLAnimatedVector3.reset(float3Array:atTimes:)(Swift::OpaquePointer float3Array, Swift::OpaquePointer atTimes)
{
  void *v2;

  objc_msgSend(v2, sel_resetWithFloat3Array_atTimes_count_, (char *)float3Array._rawValue + 32, (char *)atTimes._rawValue + 32, *((_QWORD *)atTimes._rawValue + 2));
}

Swift::Void __swiftcall MDLAnimatedVector3.reset(double3Array:atTimes:)(Swift::OpaquePointer double3Array, Swift::OpaquePointer atTimes)
{
  void *v2;

  objc_msgSend(v2, sel_resetWithDouble3Array_atTimes_count_, (char *)double3Array._rawValue + 32, (char *)atTimes._rawValue + 32, *((_QWORD *)atTimes._rawValue + 2));
}

uint64_t MDLAnimatedVector3.float3Array.getter()
{
  return MDLAnimatedVector2.float2Array.getter(&demangling cache variable for type metadata for SIMD3<Float>, (SEL *)&selRef_getFloat3Array_maxCount_);
}

uint64_t MDLAnimatedVector3.double3Array.getter()
{
  return MDLAnimatedVector2.float2Array.getter(&demangling cache variable for type metadata for SIMD3<Double>, (SEL *)&selRef_getDouble3Array_maxCount_);
}

Swift::Void __swiftcall MDLAnimatedVector4.reset(float4Array:atTimes:)(Swift::OpaquePointer float4Array, Swift::OpaquePointer atTimes)
{
  void *v2;

  objc_msgSend(v2, sel_resetWithFloat4Array_atTimes_count_, (char *)float4Array._rawValue + 32, (char *)atTimes._rawValue + 32, *((_QWORD *)atTimes._rawValue + 2));
}

Swift::Void __swiftcall MDLAnimatedVector4.reset(double4Array:atTimes:)(Swift::OpaquePointer double4Array, Swift::OpaquePointer atTimes)
{
  void *v2;

  objc_msgSend(v2, sel_resetWithDouble4Array_atTimes_count_, (char *)double4Array._rawValue + 32, (char *)atTimes._rawValue + 32, *((_QWORD *)atTimes._rawValue + 2));
}

uint64_t MDLAnimatedVector4.float4Array.getter()
{
  return MDLAnimatedVector2.float2Array.getter(&demangling cache variable for type metadata for SIMD4<Float>, (SEL *)&selRef_getFloat4Array_maxCount_);
}

uint64_t MDLAnimatedVector4.double4Array.getter()
{
  return MDLAnimatedVector2.float2Array.getter(&demangling cache variable for type metadata for SIMD4<Double>, (SEL *)&selRef_getDouble4Array_maxCount_);
}

uint64_t MDLAnimatedVector2.float2Array.getter(uint64_t *a1, SEL *a2)
{
  void *v2;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = (uint64_t)objc_msgSend(v2, sel_timeSampleCount);
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v6 = result;
    if (result)
    {
      __swift_instantiateConcreteTypeFromMangledName(a1);
      v7 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(_QWORD *)(v7 + 16) = v6;
    }
    else
    {
      v7 = MEMORY[0x24BEE4AF8];
    }
    objc_msgSend(v2, *a2, v7 + 32, objc_msgSend(v2, sel_timeSampleCount));
    *(_QWORD *)(v7 + 16) = v6;
    return v7;
  }
  return result;
}

Swift::Void __swiftcall MDLAnimatedMatrix4x4.reset(float4x4Array:atTimes:)(Swift::OpaquePointer float4x4Array, Swift::OpaquePointer atTimes)
{
  void *v2;

  objc_msgSend(v2, sel_resetWithFloat4x4Array_atTimes_count_, (char *)float4x4Array._rawValue + 32, (char *)atTimes._rawValue + 32, *((_QWORD *)atTimes._rawValue + 2));
}

Swift::Void __swiftcall MDLAnimatedMatrix4x4.reset(double4Array:atTimes:)(Swift::OpaquePointer double4Array, Swift::OpaquePointer atTimes)
{
  void *v2;

  objc_msgSend(v2, sel_resetWithDouble4x4Array_atTimes_count_, (char *)double4Array._rawValue + 32, (char *)atTimes._rawValue + 32, *((_QWORD *)atTimes._rawValue + 2));
}

uint64_t MDLAnimatedMatrix4x4.float4x4Array.getter()
{
  return MDLAnimatedMatrix4x4.float4x4Array.getter(type metadata accessor for simd_float4x4, (SEL *)&selRef_getFloat4x4Array_maxCount_);
}

uint64_t MDLAnimatedMatrix4x4.double4x4Array.getter()
{
  return MDLAnimatedMatrix4x4.float4x4Array.getter(type metadata accessor for simd_double4x4, (SEL *)&selRef_getDouble4x4Array_maxCount_);
}

uint64_t MDLAnimatedMatrix4x4.float4x4Array.getter(void (*a1)(_QWORD), SEL *a2)
{
  void *v2;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = (uint64_t)objc_msgSend(v2, sel_timeSampleCount);
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v6 = result;
    if (result)
    {
      a1(0);
      v7 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(_QWORD *)(v7 + 16) = v6;
    }
    else
    {
      v7 = MEMORY[0x24BEE4AF8];
    }
    objc_msgSend(v2, *a2, v7 + 32, objc_msgSend(v2, sel_timeSampleCount));
    *(_QWORD *)(v7 + 16) = v6;
    return v7;
  }
  return result;
}

Swift::Void __swiftcall MDLAnimatedQuaternion.reset(floatQuaternionArray:atTimes:)(Swift::OpaquePointer floatQuaternionArray, Swift::OpaquePointer atTimes)
{
  void *v2;

  objc_msgSend(v2, sel_resetWithFloatQuaternionArray_atTimes_count_, (char *)floatQuaternionArray._rawValue + 32, (char *)atTimes._rawValue + 32, *((_QWORD *)atTimes._rawValue + 2));
}

Swift::Void __swiftcall MDLAnimatedQuaternion.reset(doubleQuaternionArray:atTimes:)(Swift::OpaquePointer doubleQuaternionArray, Swift::OpaquePointer atTimes)
{
  void *v2;

  objc_msgSend(v2, sel_resetWithDoubleQuaternionArray_atTimes_count_, (char *)doubleQuaternionArray._rawValue + 32, (char *)atTimes._rawValue + 32, *((_QWORD *)atTimes._rawValue + 2));
}

uint64_t MDLAnimatedQuaternion.floatQuaternionArray.getter()
{
  return MDLAnimatedMatrix4x4.float4x4Array.getter(type metadata accessor for simd_quatf, (SEL *)&selRef_getFloatQuaternionArray_maxCount_);
}

uint64_t MDLAnimatedQuaternion.doubleQuaternionArray.getter()
{
  return MDLAnimatedMatrix4x4.float4x4Array.getter(type metadata accessor for simd_quatd, (SEL *)&selRef_getDoubleQuaternionArray_maxCount_);
}

uint64_t initializeBufferWithCopyOfBuffer for simd_quatd(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_16(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for simd_quatd(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for simd_quatd(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

__n128 __swift_memcpy128_16(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t getEnumTagSinglePayload for simd_double4x4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 128))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for simd_double4x4(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
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
  *(_BYTE *)(result + 128) = v3;
  return result;
}

__n128 __swift_memcpy64_16(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for simd_float4x4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 64))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for simd_float4x4(uint64_t result, int a2, int a3)
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

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x24BEE1190]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

