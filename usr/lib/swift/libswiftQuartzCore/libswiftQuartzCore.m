unint64_t CAFrameRateRange.preferred.getter(double a1, double a2, float a3)
{
  uint64_t v3;

  v3 = LODWORD(a3);
  if (a3 == 0.0)
    v3 = 0;
  return v3 | ((unint64_t)(a3 == 0.0) << 32);
}

__C::CAFrameRateRange __swiftcall CAFrameRateRange.init(minimum:maximum:preferred:)(Swift::Float minimum, Swift::Float maximum, Swift::Float_optional *preferred)
{
  float v3;
  __C::CAFrameRateRange result;

  v3 = *(float *)&preferred;
  if (((unint64_t)preferred & 0x100000000) != 0)
    v3 = 0.0;
  result.__preferred = v3;
  result.maximum = maximum;
  result.minimum = minimum;
  return result;
}

void type metadata accessor for CAFrameRateRange(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for CATransform3D(uint64_t a1)
{
  type metadata accessor for CAFrameRateRange(a1, (unint64_t *)&lazy cache variable for type metadata for CATransform3D);
}

NSValue __swiftcall CATransform3D._bridgeToObjectiveC()()
{
  _OWORD *v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  _OWORD v6[8];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = v0[5];
  v6[4] = v0[4];
  v6[5] = v1;
  v2 = v0[7];
  v6[6] = v0[6];
  v6[7] = v2;
  v3 = v0[1];
  v6[0] = *v0;
  v6[1] = v3;
  v4 = v0[3];
  v6[2] = v0[2];
  v6[3] = v4;
  type metadata accessor for CATransform3D(0);
  return (NSValue)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1968]), sel_initWithBytes_objCType_, v6, "{CATransform3D=dddddddddddddddd}");
}

uint64_t key path getter for CAFrameRateRange.preferred : CAFrameRateRange@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  float v2;
  float v3;

  v2 = *(float *)(result + 8);
  v3 = v2;
  if (v2 == 0.0)
    v3 = 0.0;
  *(float *)a2 = v3;
  *(_BYTE *)(a2 + 4) = v2 == 0.0;
  return result;
}

uint64_t key path setter for CAFrameRateRange.preferred : CAFrameRateRange(uint64_t result, uint64_t a2)
{
  float v2;

  v2 = *(float *)result;
  if (*(_BYTE *)(result + 4))
    v2 = 0.0;
  *(float *)(a2 + 8) = v2;
  return result;
}

uint64_t CAFrameRateRange.preferred.setter(uint64_t result)
{
  uint64_t v1;
  float v2;

  v2 = *(float *)&result;
  if ((result & 0x100000000) != 0)
    v2 = 0.0;
  *(float *)(v1 + 8) = v2;
  return result;
}

uint64_t (*CAFrameRateRange.preferred.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  float v2;
  float v3;

  *(_QWORD *)a1 = v1;
  v2 = *(float *)(v1 + 8);
  v3 = v2;
  if (v2 == 0.0)
    v3 = 0.0;
  *(_BYTE *)(a1 + 12) = v2 == 0.0;
  *(float *)(a1 + 8) = v3;
  return CAFrameRateRange.preferred.modify;
}

uint64_t CAFrameRateRange.preferred.modify(uint64_t result)
{
  float v1;

  v1 = *(float *)(result + 8);
  if (*(_BYTE *)(result + 12))
    v1 = 0.0;
  *(float *)(*(_QWORD *)result + 8) = v1;
  return result;
}

BOOL static CAFrameRateRange.== infix(_:_:)(float a1, float a2, float a3, float a4, float a5, float a6)
{
  return CAFrameRateRangeIsEqualToRange(*(CAFrameRateRange *)&a1, *(CAFrameRateRange *)&a4);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CAFrameRateRange(CAFrameRateRange *a1, CAFrameRateRange *a2)
{
  return CAFrameRateRangeIsEqualToRange(*a1, *a2);
}

uint64_t __swift_memcpy12_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CAFrameRateRange(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 12))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CAFrameRateRange(uint64_t result, int a2, int a3)
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

void type metadata accessor for CAFrameRateRange(uint64_t a1)
{
  type metadata accessor for CAFrameRateRange(a1, &lazy cache variable for type metadata for CAFrameRateRange);
}

uint64_t initializeBufferWithCopyOfBuffer for CATransform3D(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy128_8(uint64_t a1, __int128 *a2)
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

uint64_t getEnumTagSinglePayload for CATransform3D(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 128))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CATransform3D(uint64_t result, int a2, int a3)
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

id static CATransform3D._forceBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  id result;
  _OWORD v6[9];

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  type metadata accessor for CATransform3D(0);
  result = (id)strcmp(v4, "{CATransform3D=dddddddddddddddd}");
  if ((_DWORD)result)
  {
    __break(1u);
  }
  else
  {
    memset(v6, 0, 128);
    _sSo13CATransform3DVSgWOi_((uint64_t)v6);
    outlined init with take of CATransform3D?((uint64_t)v6, a2);
    return objc_msgSend(v3, sel_getValue_size_, a2, 128);
  }
  return result;
}

uint64_t _sSo13CATransform3DVSgWOi_(uint64_t result)
{
  *(_BYTE *)(result + 128) = 0;
  return result;
}

uint64_t outlined init with take of CATransform3D?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CATransform3D?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD04394]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

double static CATransform3D._unconditionallyBridgeFromObjectiveC(_:)@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  double result;
  __int128 v7;
  _OWORD v8[2];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  specialized static CATransform3D._unconditionallyBridgeFromObjectiveC(_:)(a1, v8);
  v3 = v12;
  a2[4] = v11;
  a2[5] = v3;
  v4 = v14;
  a2[6] = v13;
  a2[7] = v4;
  v5 = v8[1];
  *a2 = v8[0];
  a2[1] = v5;
  result = *(double *)&v9;
  v7 = v10;
  a2[2] = v9;
  a2[3] = v7;
  return result;
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance CATransform3D()
{
  _OWORD *v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  _OWORD v6[8];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = v0[5];
  v6[4] = v0[4];
  v6[5] = v1;
  v2 = v0[7];
  v6[6] = v0[6];
  v6[7] = v2;
  v3 = v0[1];
  v6[0] = *v0;
  v6[1] = v3;
  v4 = v0[3];
  v6[2] = v0[2];
  v6[3] = v4;
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1968]), sel_initWithBytes_objCType_, v6, "{CATransform3D=dddddddddddddddd}");
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance CATransform3D(void *a1, uint64_t a2)
{
  id v3;
  id result;
  _OWORD v5[9];

  v3 = objc_retainAutorelease(a1);
  result = (id)strcmp((const char *)objc_msgSend(v3, sel_objCType), "{CATransform3D=dddddddddddddddd}");
  if ((_DWORD)result)
  {
    __break(1u);
  }
  else
  {
    memset(v5, 0, 128);
    _sSo13CATransform3DVSgWOi_((uint64_t)v5);
    outlined init with take of CATransform3D?((uint64_t)v5, a2);
    return objc_msgSend(v3, sel_getValue_size_, a2, 128);
  }
  return result;
}

double protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance CATransform3D@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  double result;
  __int128 v7;
  _OWORD v8[2];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  specialized static CATransform3D._unconditionallyBridgeFromObjectiveC(_:)(a1, v8);
  v3 = v12;
  a2[4] = v11;
  a2[5] = v3;
  v4 = v14;
  a2[6] = v13;
  a2[7] = v4;
  v5 = v8[1];
  *a2 = v8[0];
  a2[1] = v5;
  result = *(double *)&v9;
  v7 = v10;
  a2[2] = v9;
  a2[3] = v7;
  return result;
}

BOOL specialized static CATransform3D._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  int v5;
  _OWORD v7[9];

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  type metadata accessor for CATransform3D(0);
  v5 = strcmp(v4, "{CATransform3D=dddddddddddddddd}");
  if (v5)
  {
    _sSo13CATransform3DVSgWOi0_((uint64_t)v7);
    outlined init with take of CATransform3D?((uint64_t)v7, a2);
  }
  else
  {
    memset(v7, 0, 128);
    _sSo13CATransform3DVSgWOi_((uint64_t)v7);
    outlined init with take of CATransform3D?((uint64_t)v7, a2);
    objc_msgSend(v3, sel_getValue_size_, a2, 128);
  }
  return v5 == 0;
}

double specialized static CATransform3D._unconditionallyBridgeFromObjectiveC(_:)@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id v3;
  const char *v4;
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
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!a1)
LABEL_5:
    __break(1u);
  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  type metadata accessor for CATransform3D(0);
  if (strcmp(v4, "{CATransform3D=dddddddddddddddd}"))
  {
    __break(1u);
    goto LABEL_5;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(v3, sel_getValue_size_, &v10, 128);
  v5 = v15;
  a2[4] = v14;
  a2[5] = v5;
  v6 = v17;
  a2[6] = v16;
  a2[7] = v6;
  v7 = v11;
  *a2 = v10;
  a2[1] = v7;
  result = *(double *)&v12;
  v9 = v13;
  a2[2] = v12;
  a2[3] = v9;
  return result;
}

double _sSo13CATransform3DVSgWOi0_(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_BYTE *)(a1 + 128) = 1;
  return result;
}

BOOL CAFrameRateRangeIsEqualToRange(CAFrameRateRange range, CAFrameRateRange other)
{
  return MEMORY[0x24BDE5438](*(__n128 *)&range.minimum, *(__n128 *)&range.maximum, *(__n128 *)&range.preferred, *(__n128 *)&other.minimum, *(__n128 *)&other.maximum, *(__n128 *)&other.preferred);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

