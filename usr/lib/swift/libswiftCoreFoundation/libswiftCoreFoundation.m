CFHashCode _CFObject.hashValue.getter()
{
  const void *v0;

  return CFHash(v0);
}

uint64_t protocol witness for BinaryFloatingPoint.significandWidth.getter in conformance CGFloat()
{
  return Double.significandWidth.getter();
}

ValueMetadata *type metadata accessor for CGFloat()
{
  return &type metadata for CGFloat;
}

void protocol witness for static FloatingPoint.ulpOfOne.getter in conformance CGFloat(_QWORD *a1@<X8>)
{
  *a1 = 0x3CB0000000000000;
}

void protocol witness for static FloatingPoint.leastNormalMagnitude.getter in conformance CGFloat(_QWORD *a1@<X8>)
{
  *a1 = 0x10000000000000;
}

double protocol witness for ExpressibleByIntegerLiteral.init(integerLiteral:) in conformance CGFloat@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  double result;

  result = (double)*a1;
  *a2 = result;
  return result;
}

BOOL protocol witness for FloatingPoint.isZero.getter in conformance CGFloat()
{
  _QWORD *v0;

  return (*v0 & 0x7FFFFFFFFFFFFFFFLL) == 0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  return *a1 == *a2;
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  return *a1 < *a2;
}

BOOL protocol witness for FloatingPoint.isFinite.getter in conformance CGFloat()
{
  _QWORD *v0;

  return (~*v0 & 0x7FF0000000000000) != 0;
}

double protocol witness for static Numeric.* infix(_:_:) in conformance CGFloat@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result;

  result = *a1 * *a2;
  *a3 = result;
  return result;
}

BOOL protocol witness for FloatingPoint.isInfinite.getter in conformance CGFloat()
{
  _QWORD *v0;

  return (*v0 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000;
}

BOOL protocol witness for FloatingPoint.isNaN.getter in conformance CGFloat()
{
  _QWORD *v0;

  return (*v0 & 0xFFFFFFFFFFFFFLL) != 0 && (~*v0 & 0x7FF0000000000000) == 0;
}

double protocol witness for Numeric.magnitude.getter in conformance CGFloat@<D0>(double *a1@<X8>)
{
  double *v1;
  double result;

  result = fabs(*v1);
  *a1 = result;
  return result;
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  return *a2 <= *a1;
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  return *a2 < *a1;
}

uint64_t protocol witness for FloatingPoint.round(_:) in conformance CGFloat(uint64_t a1)
{
  double *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  double v8;
  uint64_t v9;

  v3 = type metadata accessor for FloatingPointRoundingRule();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  result = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v6, v3);
  if ((_DWORD)result == *MEMORY[0x1E0DED4F0])
  {
    *v1 = round(*v1);
    return result;
  }
  if ((_DWORD)result == *MEMORY[0x1E0DED4E8])
  {
    *v1 = rint(*v1);
    return result;
  }
  if ((_DWORD)result == *MEMORY[0x1E0DED500])
  {
    v8 = *v1;
LABEL_7:
    *v1 = ceil(v8);
    return result;
  }
  if ((_DWORD)result == *MEMORY[0x1E0DED508])
  {
    v8 = *v1;
LABEL_10:
    *v1 = floor(v8);
    return result;
  }
  if ((_DWORD)result == *MEMORY[0x1E0DED4D8])
  {
    *v1 = trunc(*v1);
  }
  else
  {
    if ((_DWORD)result == *MEMORY[0x1E0DED4E0])
    {
      v8 = *v1;
      if ((*(_QWORD *)v1 & 0x8000000000000000) == 0)
        goto LABEL_7;
      goto LABEL_10;
    }
    Double._roundSlowPath(_:)();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return result;
}

uint64_t protocol witness for CVarArg._cVarArgEncoding.getter in conformance CGFloat()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t result;

  v1 = *v0;
  result = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(_QWORD *)(result + 16) = 1;
  *(_QWORD *)(result + 32) = v1;
  return result;
}

void protocol witness for BinaryFloatingPoint.init<A>(_:) in conformance CGFloat(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, double *a4@<X8>)
{
  *a4 = specialized BinaryFloatingPoint.init<A>(_:)(a1, a2, a3);
}

double specialized BinaryFloatingPoint.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v37;
  uint64_t v38;
  int v39;
  float v40;
  uint64_t v41;
  __int16 v43;
  char *v44;
  uint64_t v45;
  char v46;
  char *v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  __int16 v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  char *v62;
  uint64_t v63;
  unsigned __int8 v64;
  char *v65;
  uint64_t v66;
  int v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  double v77;

  v76 = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v72 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v73 = AssociatedTypeWitness;
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v71 = (char *)&v68 - v6;
  v7 = swift_getAssociatedTypeWitness();
  v69 = *(_QWORD *)(v7 - 8);
  v70 = v7;
  v8 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v68 = (char *)&v68 - v9;
  v75 = *(_QWORD *)(a2 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v10);
  v15 = (char *)&v68 - v14;
  v16 = MEMORY[0x1E0C80A78](v13);
  v18 = (char *)&v68 - v17;
  v19 = MEMORY[0x1E0C80A78](v16);
  v21 = (char *)&v68 - v20;
  v22 = MEMORY[0x1E0C80A78](v19);
  v24 = (char *)&v68 - v23;
  MEMORY[0x1E0C80A78](v22);
  v26 = (char *)&v68 - v25;
  v27 = dispatch thunk of static BinaryFloatingPoint.exponentBitCount.getter();
  v74 = a3;
  v28 = dispatch thunk of static BinaryFloatingPoint.significandBitCount.getter();
  if (v27 == 11)
  {
    if (v28 == 52)
    {
      v34 = v75;
      v33 = v76;
      (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v15, v76, a2);
      v35 = swift_dynamicCast();
      _D8 = v77;
      (*(void (**)(char *, uint64_t, uint64_t))(v34 + 32))(v12, v33, a2);
      if (v35)
      {
        (*(void (**)(char *, uint64_t))(v34 + 8))(v12, a2);
      }
      else
      {
        v54 = dispatch thunk of FloatingPoint.sign.getter();
        v55 = v68;
        dispatch thunk of BinaryFloatingPoint.exponentBitPattern.getter();
        v56 = v70;
        swift_getAssociatedConformanceWitness();
        v57 = dispatch thunk of BinaryInteger._lowWord.getter();
        (*(void (**)(char *, uint64_t))(v69 + 8))(v55, v56);
        v58 = v71;
        dispatch thunk of BinaryFloatingPoint.significandBitPattern.getter();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v12, a2);
        v59 = v73;
        swift_getAssociatedConformanceWitness();
        v60 = dispatch thunk of BinaryInteger._lowWord.getter();
        (*(void (**)(char *, uint64_t))(v72 + 8))(v58, v59);
        *(_QWORD *)&_D8 = (v54 << 63) | ((unint64_t)(v57 & 0x7FF) << 52) | v60 & 0xFFFFFFFFFFFFFLL;
      }
      return _D8;
    }
LABEL_13:
    lazy protocol witness table accessor for type CGFloat and conformance CGFloat();
    v41 = v76;
    static BinaryFloatingPoint._convert<A>(from:)();
    (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v41, a2);
    return v77;
  }
  if (v27 == 8)
  {
    if (v28 == 23)
    {
      v38 = v75;
      v37 = v76;
      (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v21, v76, a2);
      v39 = swift_dynamicCast();
      v40 = *(float *)&v77;
      (*(void (**)(char *, uint64_t, uint64_t))(v38 + 32))(v18, v37, a2);
      if (v39)
      {
        (*(void (**)(char *, uint64_t))(v38 + 8))(v18, a2);
        return v40;
      }
      else
      {
        v61 = dispatch thunk of FloatingPoint.sign.getter();
        v62 = v68;
        dispatch thunk of BinaryFloatingPoint.exponentBitPattern.getter();
        v63 = v70;
        swift_getAssociatedConformanceWitness();
        v64 = dispatch thunk of BinaryInteger._lowWord.getter();
        (*(void (**)(char *, uint64_t))(v69 + 8))(v62, v63);
        v65 = v71;
        dispatch thunk of BinaryFloatingPoint.significandBitPattern.getter();
        (*(void (**)(char *, uint64_t))(v38 + 8))(v18, a2);
        v66 = v73;
        swift_getAssociatedConformanceWitness();
        v67 = dispatch thunk of BinaryInteger._lowWord.getter();
        (*(void (**)(char *, uint64_t))(v72 + 8))(v65, v66);
        return COERCE_FLOAT((v61 << 31) | (v64 << 23) | v67 & 0x7FFFFF);
      }
    }
    goto LABEL_13;
  }
  if (v27 != 5 || v28 != 10)
    goto LABEL_13;
  v30 = v75;
  v29 = v76;
  (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v26, v76, a2);
  v31 = swift_dynamicCast();
  _H8 = LOWORD(v77);
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 32))(v24, v29, a2);
  if (v31)
  {
    (*(void (**)(char *, uint64_t))(v30 + 8))(v24, a2);
  }
  else
  {
    v43 = dispatch thunk of FloatingPoint.sign.getter();
    v44 = v68;
    dispatch thunk of BinaryFloatingPoint.exponentBitPattern.getter();
    v45 = v70;
    swift_getAssociatedConformanceWitness();
    v46 = dispatch thunk of BinaryInteger._lowWord.getter();
    (*(void (**)(char *, uint64_t))(v69 + 8))(v44, v45);
    v47 = v71;
    dispatch thunk of BinaryFloatingPoint.significandBitPattern.getter();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v24, a2);
    v48 = v73;
    swift_getAssociatedConformanceWitness();
    v49 = dispatch thunk of BinaryInteger._lowWord.getter();
    (*(void (**)(char *, uint64_t))(v72 + 8))(v47, v48);
    _H8 = (v43 << 15) | ((v46 & 0x1F) << 10) | v49 & 0x3FF;
  }
  __asm { FCVT            D8, H8 }
  return _D8;
}

void protocol witness for BinaryFloatingPoint.significandBitPattern.getter in conformance CGFloat(uint64_t *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1 & 0xFFFFFFFFFFFFFLL;
}

uint64_t protocol witness for static BinaryFloatingPoint.significandBitCount.getter in conformance CGFloat()
{
  return 52;
}

void protocol witness for BinaryFloatingPoint.exponentBitPattern.getter in conformance CGFloat(uint64_t *a1@<X8>)
{
  _QWORD *v1;

  *a1 = (*v1 >> 52) & 0x7FFLL;
}

uint64_t protocol witness for static BinaryFloatingPoint.exponentBitCount.getter in conformance CGFloat()
{
  return 11;
}

uint64_t protocol witness for FloatingPoint.exponent.getter in conformance CGFloat@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = Double.exponent.getter();
  *a1 = result;
  return result;
}

BOOL static _CFObject.== infix(_:_:)(const void *a1, const void *a2)
{
  return CFEqual(a1, a2) != 0;
}

void _CFObject.hash(into:)()
{
  Swift::UInt v0;

  v0 = dispatch thunk of Hashable.hashValue.getter();
  Hasher._combine(_:)(v0);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance CGFloat(_QWORD *a1)
{
  _BYTE v2[24];
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  dispatch thunk of SingleValueEncodingContainer.encode(_:)();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
}

uint64_t protocol witness for Decodable.init(from:) in conformance CGFloat@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  _QWORD v16[5];
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[4];

  v18 = a2;
  v17 = type metadata accessor for DecodingError.Context();
  v3 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DecodingError();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v10 = v19;
  dispatch thunk of Decoder.singleValueContainer()();
  if (v10)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v16[3] = v3;
  v16[4] = v9;
  v16[1] = v7;
  v16[2] = v5;
  v19 = a1;
  v11 = v18;
  __swift_project_boxed_opaque_existential_1(v20, v20[3]);
  dispatch thunk of SingleValueDecodingContainer.decode(_:)();
  v13 = v12;
  v14 = (uint64_t)v19;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  result = __swift_destroy_boxed_opaque_existential_1(v14);
  *v11 = v13;
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1BCCD7AA0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

double protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance CGFloat@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result;

  result = *a1 - *a2;
  *a3 = result;
  return result;
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  return *a1 <= *a2;
}

double protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  double result;

  result = *a1 - *a2;
  *a1 = result;
  return result;
}

double protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  double result;

  result = *a2 + *a1;
  *a1 = result;
  return result;
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance CGFloat()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CGFloat()
{
  return Double.description.getter();
}

uint64_t protocol witness for FloatingPoint.sign.getter in conformance CGFloat()
{
  _QWORD *v0;

  return *v0 >> 63;
}

void protocol witness for static AdditiveArithmetic.zero.getter in conformance CGFloat(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

unint64_t lazy protocol witness table accessor for type CGFloat and conformance CGFloat()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    result = MEMORY[0x1BCCD7AAC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    result = MEMORY[0x1BCCD7AAC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    result = MEMORY[0x1BCCD7AAC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    result = MEMORY[0x1BCCD7AAC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    result = MEMORY[0x1BCCD7AAC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    result = MEMORY[0x1BCCD7AAC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    result = MEMORY[0x1BCCD7AAC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    result = MEMORY[0x1BCCD7AAC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    result = MEMORY[0x1BCCD7AAC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    result = MEMORY[0x1BCCD7AAC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    result = MEMORY[0x1BCCD7AAC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    result = MEMORY[0x1BCCD7AAC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

double protocol witness for static Numeric.*= infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  double result;

  result = *a2 * *a1;
  *a1 = result;
  return result;
}

double protocol witness for static FloatingPoint./= infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  double result;

  result = *a1 / *a2;
  *a1 = result;
  return result;
}

uint64_t associated type witness table accessor for ExpressibleByIntegerLiteral.IntegerLiteralType : _ExpressibleByBuiltinIntegerLiteral in CGFloat()
{
  return MEMORY[0x1E0DEB488];
}

double protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance CGFloat@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result;

  result = *a1 + *a2;
  *a3 = result;
  return result;
}

double protocol witness for static FloatingPoint./ infix(_:_:) in conformance CGFloat@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result;

  result = *a1 / *a2;
  *a3 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    result = MEMORY[0x1BCCD7AAC](MEMORY[0x1E0DEB440], MEMORY[0x1E0DEB418]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    result = MEMORY[0x1BCCD7AAC](MEMORY[0x1E0DEB460], MEMORY[0x1E0DEB418]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt and conformance UInt()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UInt and conformance UInt;
  if (!lazy protocol witness table cache variable for type UInt and conformance UInt)
  {
    result = MEMORY[0x1BCCD7AAC](MEMORY[0x1E0DEBBC0], MEMORY[0x1E0DEBB98]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt and conformance UInt);
  }
  return result;
}

CoreGraphics::CGFloat __swiftcall CGFloat.init()()
{
  return 0;
}

CoreGraphics::CGFloat __swiftcall CGFloat.init(_:)(Swift::Float a1)
{
  CoreGraphics::CGFloat result;

  result.native = a1;
  return result;
}

void CGFloat.native.setter(double a1)
{
  double *v1;

  *v1 = a1;
}

uint64_t (*CGFloat.native.modify())()
{
  return CGFloat.native.modify;
}

uint64_t CGFloat.init<A>(exactly:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v10;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  v6 = (uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  v7 = Double.init<A>(exactly:)(v6, a2);
  LOBYTE(v6) = v8;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
  if ((v6 & 1) != 0)
    return 0;
  else
    return v7;
}

uint64_t Double.init<A>(exactly:)(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t result;
  char v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;

  if (dispatch thunk of BinaryInteger.bitWidth.getter() > 64)
  {
    lazy protocol witness table accessor for type Double and conformance Double();
    lazy protocol witness table accessor for type UInt64 and conformance UInt64();
    v4 = static BinaryFloatingPoint<>._convert<A>(from:)();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
    if ((v4 & 1) != 0)
      return v11;
    goto LABEL_13;
  }
  v6 = dispatch thunk of static BinaryInteger.isSigned.getter();
  v7 = dispatch thunk of BinaryInteger._lowWord.getter();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  if ((v6 & 1) != 0)
  {
    v8 = (double)v7;
    if ((double)v7 < 9.22337204e18)
    {
      *(double *)&result = (double)v7;
      if ((~*(_QWORD *)&v8 & 0x7FF0000000000000) != 0)
      {
        if (v8 > -9.22337204e18)
        {
          v9 = (uint64_t)v8;
          goto LABEL_12;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      goto LABEL_17;
    }
  }
  else
  {
    v10 = (double)(unint64_t)v7;
    if ((double)(unint64_t)v7 < 1.84467441e19)
    {
      *(double *)&result = (double)(unint64_t)v7;
      if ((~*(_QWORD *)&v10 & 0x7FF0000000000000) != 0)
      {
        v9 = (unint64_t)v10;
LABEL_12:
        if (v7 == v9)
          return result;
        goto LABEL_13;
      }
LABEL_17:
      __break(1u);
      return result;
    }
  }
LABEL_13:
  *(double *)&result = 0.0;
  return result;
}

double CGFloat.magnitude.getter(double a1)
{
  return fabs(a1);
}

double protocol witness for static SignedNumeric.- prefix(_:) in conformance CGFloat@<D0>(double *a1@<X0>, double *a2@<X8>)
{
  double result;

  result = -*a1;
  *a2 = result;
  return result;
}

double protocol witness for SignedNumeric.negate() in conformance CGFloat()
{
  double *v0;
  double result;

  result = -*v0;
  *v0 = result;
  return result;
}

Swift::Void __swiftcall CGFloat.negate()()
{
  double *v0;

  *v0 = -*v0;
}

double static CGFloat.* infix(_:_:)(double a1, double a2)
{
  return a1 * a2;
}

double static CGFloat.*= infix(_:_:)(double *a1, double a2)
{
  double result;

  result = *a1 * a2;
  *a1 = result;
  return result;
}

double static CGFloat.+ infix(_:_:)(double a1, double a2)
{
  return a1 + a2;
}

double static CGFloat.+= infix(_:_:)(double *a1, double a2)
{
  double result;

  result = *a1 + a2;
  *a1 = result;
  return result;
}

double static CGFloat.- infix(_:_:)(double a1, double a2)
{
  return a1 - a2;
}

double static CGFloat.-= infix(_:_:)(double *a1, double a2)
{
  double result;

  result = *a1 - a2;
  *a1 = result;
  return result;
}

CoreGraphics::CGFloat __swiftcall CGFloat.init(integerLiteral:)(Swift::Int integerLiteral)
{
  CoreGraphics::CGFloat result;

  result.native = (double)integerLiteral;
  return result;
}

uint64_t static CGFloat.exponentBitCount.getter()
{
  return 11;
}

uint64_t static CGFloat.significandBitCount.getter()
{
  return 52;
}

CoreGraphics::CGFloat __swiftcall CGFloat.init(bitPattern:)(Swift::UInt bitPattern)
{
  return (CoreGraphics::CGFloat)bitPattern;
}

uint64_t CGFloat.sign.getter(double a1)
{
  return *(_QWORD *)&a1 >> 63;
}

uint64_t CGFloat.exponentBitPattern.getter(double a1)
{
  return (*(_QWORD *)&a1 >> 52) & 0x7FFLL;
}

uint64_t CGFloat.significandBitPattern.getter(double a1)
{
  return *(_QWORD *)&a1 & 0xFFFFFFFFFFFFFLL;
}

double CGFloat.init(sign:exponentBitPattern:significandBitPattern:)(uint64_t a1, __int16 a2, uint64_t a3)
{
  double result;

  *(_QWORD *)&result = ((unint64_t)(a2 & 0x7FF) << 52) | (a1 << 63) | a3 & 0xFFFFFFFFFFFFFLL;
  return result;
}

CoreGraphics::CGFloat __swiftcall CGFloat.init(nan:signaling:)(Swift::UInt nan, Swift::Bool signaling)
{
  CoreGraphics::CGFloat result;

  if (!(nan >> 50))
    return (CoreGraphics::CGFloat)((0x8000000000000uLL >> signaling) | nan | 0x7FF0000000000000);
  __break(1u);
  return result;
}

double static CGFloat.infinity.getter()
{
  return INFINITY;
}

double static CGFloat.nan.getter()
{
  return NAN;
}

double static CGFloat.signalingNaN.getter()
{
  return NAN;
}

void static CGFloat.quietNaN.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

double static CGFloat.greatestFiniteMagnitude.getter()
{
  return 1.79769313e308;
}

double static CGFloat.pi.getter()
{
  return 3.14159265;
}

double CGFloat.ulp.getter(double a1)
{
  uint64_t v2;
  double result;

  v2 = (*(_QWORD *)&a1 >> 52) & 0x7FFLL;
  if (v2)
  {
    result = NAN;
    if (v2 != 2047)
      return COERCE_DOUBLE(*(_QWORD *)&a1 & 0x7FF0000000000000) * 2.22044605e-16;
  }
  else
  {
    *(_QWORD *)&result = 1;
  }
  return result;
}

double static CGFloat.leastNormalMagnitude.getter()
{
  return 2.22507386e-308;
}

double static CGFloat.leastNonzeroMagnitude.getter()
{
  double result;

  *(_QWORD *)&result = 1;
  return result;
}

unint64_t CGFloat.exponent.getter(double a1)
{
  uint64_t v1;
  unint64_t result;
  unint64_t v3;

  v1 = (*(_QWORD *)&a1 >> 52) & 0x7FFLL;
  if (v1 == 2047)
    return 0x7FFFFFFFFFFFFFFFLL;
  v3 = *(_QWORD *)&a1 & 0xFFFFFFFFFFFFFLL;
  if (!(v1 | *(_QWORD *)&a1 & 0xFFFFFFFFFFFFFLL))
    return 0x8000000000000000;
  if (v1)
    return v1 - 1023;
  if (v3)
    return -1011 - __clz(v3);
  __break(1u);
  return result;
}

double CGFloat.significand.getter(double result)
{
  uint64_t v1;
  unint64_t v2;

  v1 = (*(_QWORD *)&result >> 52) & 0x7FFLL;
  v2 = *(_QWORD *)&result & 0xFFFFFFFFFFFFFLL;
  if ((*(_QWORD *)&result & 0xFFFFFFFFFFFFFLL) == 0 || v1 != 2047)
  {
    if (v1)
    {
      if (v1 != 2047)
      {
        *(_QWORD *)&result = v2 | 0x3FF0000000000000;
        return result;
      }
    }
    else if (v2)
    {
      *(_QWORD *)&result = (*(_QWORD *)&result << (__clz(v2) + 53)) & 0xFFFFFFFFFFFFFLL | 0x3FF0000000000000;
      return result;
    }
    *(_QWORD *)&result = v1 << 52;
  }
  return result;
}

double CGFloat.init(sign:exponent:significand:)(char a1, uint64_t a2, double a3)
{
  return specialized Double.init(sign:exponent:significand:)(a1 & 1, a2, a3);
}

uint64_t CGFloat.round(_:)(uint64_t a1)
{
  double *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  double v8;
  uint64_t v9;

  v3 = type metadata accessor for FloatingPointRoundingRule();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  result = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v6, v3);
  if ((_DWORD)result == *MEMORY[0x1E0DED4F0])
  {
    *v1 = round(*v1);
    return result;
  }
  if ((_DWORD)result == *MEMORY[0x1E0DED4E8])
  {
    *v1 = rint(*v1);
    return result;
  }
  if ((_DWORD)result == *MEMORY[0x1E0DED500])
  {
    v8 = *v1;
LABEL_7:
    *v1 = ceil(v8);
    return result;
  }
  if ((_DWORD)result == *MEMORY[0x1E0DED508])
  {
    v8 = *v1;
LABEL_10:
    *v1 = floor(v8);
    return result;
  }
  if ((_DWORD)result == *MEMORY[0x1E0DED4D8])
  {
    *v1 = trunc(*v1);
  }
  else
  {
    if ((_DWORD)result == *MEMORY[0x1E0DED4E0])
    {
      v8 = *v1;
      if ((*(_QWORD *)v1 & 0x8000000000000000) == 0)
        goto LABEL_7;
      goto LABEL_10;
    }
    Double._roundSlowPath(_:)();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return result;
}

double CGFloat.nextUp.getter(double a1)
{
  double result;

  result = a1 + 0.0;
  if (result < INFINITY)
    *(_QWORD *)&result += (*(uint64_t *)&result >> 63) | 1;
  return result;
}

double static CGFloat./= infix(_:_:)(double *a1, double a2)
{
  double result;

  result = *a1 / a2;
  *a1 = result;
  return result;
}

Swift::Void __swiftcall CGFloat.formTruncatingRemainder(dividingBy:)(CoreGraphics::CGFloat dividingBy)
{
  long double *v1;

  *v1 = fmod(*v1, dividingBy.native);
}

Swift::Void __swiftcall CGFloat.formRemainder(dividingBy:)(CoreGraphics::CGFloat dividingBy)
{
  long double *v1;

  *v1 = remainder(*v1, dividingBy.native);
}

Swift::Void __swiftcall CGFloat.formSquareRoot()()
{
  double *v0;

  *v0 = sqrt(*v0);
}

Swift::Void __swiftcall CGFloat.addProduct(_:_:)(CoreGraphics::CGFloat a1, CoreGraphics::CGFloat a2)
{
  double *v2;

  *v2 = *v2 + a1.native * a2.native;
}

Swift::Bool __swiftcall CGFloat.isEqual(to:)(CoreGraphics::CGFloat to)
{
  double v1;

  return v1 == to.native;
}

Swift::Bool __swiftcall CGFloat.isLess(than:)(CoreGraphics::CGFloat than)
{
  double v1;

  return v1 < than.native;
}

Swift::Bool __swiftcall CGFloat.isLessThanOrEqualTo(_:)(CoreGraphics::CGFloat a1)
{
  double v1;

  return v1 <= a1.native;
}

BOOL CGFloat.isNormal.getter(double a1)
{
  return ((*(_QWORD *)&a1 >> 52) & 0x7FFLL) != 0x7FF && ((*(_QWORD *)&a1 >> 52) & 0x7FFLL) != 0;
}

BOOL CGFloat.isFinite.getter(double a1)
{
  return (~*(_QWORD *)&a1 & 0x7FF0000000000000) != 0;
}

BOOL CGFloat.isZero.getter(double a1)
{
  return (*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFLL) == 0;
}

BOOL CGFloat.isSubnormal.getter(double a1)
{
  return (*(_QWORD *)&a1 & 0xFFFFFFFFFFFFFLL) != 0 && (*(_QWORD *)&a1 & 0x7FF0000000000000) == 0;
}

BOOL CGFloat.isInfinite.getter(double a1)
{
  return (*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000;
}

BOOL CGFloat.isNaN.getter(double a1)
{
  return (*(_QWORD *)&a1 & 0xFFFFFFFFFFFFFLL) != 0 && (~*(_QWORD *)&a1 & 0x7FF0000000000000) == 0;
}

BOOL CGFloat.isSignalingNaN.getter(double a1)
{
  return (~*(_QWORD *)&a1 & 0x7FF0000000000000) == 0
      && (*(_QWORD *)&a1 & 0xFFFFFFFFFFFFFLL) != 0
      && (*(_QWORD *)&a1 & 0x8000000000000) == 0;
}

void CGFloat.isSignaling.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t CGFloat.isCanonical.getter()
{
  return 1;
}

double CGFloat.binade.getter(double a1)
{
  uint64_t v1;
  double result;

  v1 = (*(_QWORD *)&a1 >> 52) & 0x7FFLL;
  if (v1 == 2047)
    return NAN;
  if ((*(_QWORD *)&a1 & 0xFFFFFFFFFFFFFLL) != 0 && !v1)
    return COERCE_DOUBLE(COERCE_UNSIGNED_INT64(a1 * 4.50359963e15) & 0xFFF0000000000000) * 2.22044605e-16;
  *(_QWORD *)&result = *(_QWORD *)&a1 & 0xFFF0000000000000;
  return result;
}

uint64_t CGFloat.significandWidth.getter(double a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;

  v1 = *(_QWORD *)&a1 & 0xFFFFFFFFFFFFFLL;
  v2 = __clz(__rbit64(*(_QWORD *)&a1 & 0xFFFFFFFFFFFFFLL));
  v3 = (*(_QWORD *)&a1 >> 52) & 0x7FFLL;
  if (v3 && v3 != 2047)
  {
    v6 = 52 - v2;
    if (v1)
      return v6;
    else
      return 0;
  }
  else
  {
    v4 = 63 - __clz(v1) - v2;
    if (v3)
      v4 = -1;
    if (v1)
      return v4;
    else
      return -1;
  }
}

uint64_t protocol witness for BinaryFloatingPoint.init(sign:exponentBitPattern:significandBitPattern:) in conformance CGFloat@<X0>(uint64_t result@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X2>, uint64_t *a4@<X8>)
{
  *a4 = (result << 63) | ((*a2 & 0x7FFLL) << 52) | *a3 & 0xFFFFFFFFFFFFFLL;
  return result;
}

double protocol witness for BinaryFloatingPoint.init(_:) in conformance CGFloat@<D0>(double *a1@<X8>, float a2@<S0>)
{
  double result;

  result = a2;
  *a1 = result;
  return result;
}

void protocol witness for BinaryFloatingPoint.init(_:) in conformance CGFloat(double *a1@<X8>, double a2@<D0>)
{
  *a1 = a2;
}

uint64_t protocol witness for BinaryFloatingPoint.init<A>(exactly:) in conformance CGFloat@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;
  char v6;

  result = specialized BinaryFloatingPoint.init<A>(exactly:)(a1, a2, a3);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v6 & 1;
  return result;
}

uint64_t specialized BinaryFloatingPoint.init<A>(exactly:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t result;
  uint64_t v42;
  void (*v43)(char *, uint64_t, uint64_t);
  uint64_t v44;
  char v45;
  void (*v46)(char *, uint64_t);
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char v52;
  uint64_t v53;
  char *v54;
  char v55;
  void (**v56)(char *, uint64_t);
  uint64_t v57;
  void (*v58)(uint64_t, uint64_t);
  uint64_t v59;
  char v60;
  uint64_t v61;
  char *v62;
  char *v63;
  char v64;
  void (*v65)(char *, uint64_t);
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t AssociatedConformanceWitness;
  char *v72;
  char *v73;
  char *v74;
  void (*v75)(char *, uint64_t);
  char *v76;
  char *v77;
  char v78;
  void (*v79)(char *, uint64_t);
  void (*v80)(char *, uint64_t);
  char *v81;
  char *v82;
  char *v83;
  uint64_t v84;
  char *v85;
  void (*v86)(char *, uint64_t);
  int64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  char *v91;
  char v92;
  uint64_t v93;
  char v94;
  void (*v95)(char *, uint64_t);
  char *v96;
  char v97;
  char *v98;
  void (*v99)(char *, uint64_t);
  uint64_t v100;
  void (*v101)(char *, uint64_t);
  void (*v102)(char *, uint64_t);
  uint64_t v103;
  char *v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  char v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  char *v117;
  char *v118;
  void (*v119)(char *, uint64_t);
  char *v120;
  char *v121;
  char *v122;
  char v123;
  void (*v124)(char *, uint64_t);
  char *v125;
  char v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  void (*v131)(char *, uint64_t);
  int64_t v132;
  uint64_t v133;
  char v134;
  uint64_t v135;
  char *v136;
  char v137;
  char *v138;
  char v139;
  uint64_t v140;
  BOOL v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char *v145;
  char *v146;
  int64_t v147;
  uint64_t v148;
  uint64_t v149;
  void (*v150)(uint64_t, uint64_t);
  uint64_t v151;
  uint64_t v152;
  char *v153;
  void (**v154)(char *, uint64_t);
  char *v155;
  char *v156;
  char *v157;
  char *v158;
  uint64_t AssociatedTypeWitness;
  uint64_t v160;
  char *v161;
  char *v162;
  char *v163;
  void (*v164)(char *, uint64_t);
  char *v165;
  char *v166;
  char *v167;
  char *v168;
  char *v169;
  uint64_t v170;
  int64_t v171;

  swift_getAssociatedTypeWitness();
  v166 = *(char **)(swift_getAssociatedConformanceWitness() + 8);
  v160 = *(_QWORD *)(*((_QWORD *)v166 + 3) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v161 = (char *)&v149 - v6;
  v7 = swift_checkMetadataState();
  v167 = *(char **)(v7 - 8);
  v8 = MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v149 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v8);
  v158 = (char *)&v149 - v12;
  v13 = MEMORY[0x1E0C80A78](v11);
  v157 = (char *)&v149 - v14;
  v15 = MEMORY[0x1E0C80A78](v13);
  v155 = (char *)&v149 - v16;
  v17 = MEMORY[0x1E0C80A78](v15);
  v156 = (char *)&v149 - v18;
  v19 = MEMORY[0x1E0C80A78](v17);
  v153 = (char *)&v149 - v20;
  v21 = MEMORY[0x1E0C80A78](v19);
  v164 = (void (*)(char *, uint64_t))((char *)&v149 - v22);
  v23 = MEMORY[0x1E0C80A78](v21);
  v162 = (char *)&v149 - v24;
  v25 = MEMORY[0x1E0C80A78](v23);
  v154 = (void (**)(char *, uint64_t))((char *)&v149 - v26);
  v27 = MEMORY[0x1E0C80A78](v25);
  v163 = (char *)&v149 - v28;
  v29 = MEMORY[0x1E0C80A78](v27);
  v165 = (char *)&v149 - v30;
  v31 = MEMORY[0x1E0C80A78](v29);
  v168 = (char *)&v149 - v32;
  v33 = MEMORY[0x1E0C80A78](v31);
  v169 = (char *)&v149 - v34;
  v35 = *(_QWORD *)(a2 - 8);
  v36 = MEMORY[0x1E0C80A78](v33);
  v38 = (char *)&v149 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v36);
  v40 = (char *)&v149 - v39;
  if ((dispatch thunk of FloatingPoint.isNaN.getter() & 1) != 0)
  {
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(a1, a2);
    return 0;
  }
  v152 = v7;
  v42 = a1;
  if (dispatch thunk of static BinaryFloatingPoint.exponentBitCount.getter() >= 12)
  {
    v43 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 16);
    v43(v40, v42, a2);
LABEL_7:
    v45 = dispatch thunk of FloatingPoint.isFinite.getter();
    goto LABEL_9;
  }
  v44 = dispatch thunk of static BinaryFloatingPoint.significandBitCount.getter();
  v43 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 16);
  v43(v40, v42, a2);
  if (v44 >= 53)
    goto LABEL_7;
  v45 = 0;
LABEL_9:
  v46 = *(void (**)(char *, uint64_t))(v35 + 8);
  v46(v40, a2);
  v43(v38, v42, a2);
  if ((v45 & 1) == 0)
  {
    v46(v38, a2);
    v48 = v42;
    return specialized BinaryFloatingPoint.init<A>(_:)(v48, a2, a3);
  }
  v47 = dispatch thunk of FloatingPoint.isZero.getter();
  v46(v38, a2);
  v48 = v42;
  if ((v47 & 1) != 0)
    return specialized BinaryFloatingPoint.init<A>(_:)(v48, a2, a3);
  v151 = a3;
  dispatch thunk of FloatingPoint.exponent.getter();
  v49 = Double.exponent.getter();
  v171 = v49;
  v50 = v152;
  v51 = v166;
  if ((dispatch thunk of static BinaryInteger.isSigned.getter() & 1) != 0)
  {
    if (dispatch thunk of BinaryInteger.bitWidth.getter() < 64)
    {
LABEL_22:
      v57 = dispatch thunk of BinaryInteger._lowWord.getter();
      v56 = (void (**)(char *, uint64_t))v167;
      if (v57 >= v49)
        goto LABEL_23;
      goto LABEL_41;
    }
    goto LABEL_18;
  }
  v52 = dispatch thunk of static BinaryInteger.isSigned.getter();
  v53 = dispatch thunk of BinaryInteger.bitWidth.getter();
  if ((v52 & 1) == 0)
  {
    if (v53 < 64)
      goto LABEL_22;
    v56 = (void (**)(char *, uint64_t))v167;
    (*((void (**)(char *, char *, uint64_t))v167 + 2))(v10, v169, v50);
    v170 = v49;
    if (v49 <= 0)
    {
      v56[1](v10, v50);
    }
    else
    {
      lazy protocol witness table accessor for type Int and conformance Int();
      v77 = v168;
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
      v78 = dispatch thunk of static Comparable.< infix(_:_:)();
      v79 = v46;
      v80 = (void (*)(char *, uint64_t))*((_QWORD *)v167 + 1);
      v81 = v77;
      v56 = (void (**)(char *, uint64_t))v167;
      v80(v81, v50);
      v80(v10, v50);
      v46 = v79;
      if ((v78 & 1) != 0)
        goto LABEL_41;
    }
    goto LABEL_23;
  }
  if (v53 > 64)
  {
LABEL_18:
    lazy protocol witness table accessor for type Int and conformance Int();
    v54 = v168;
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    v55 = dispatch thunk of static Comparable.< infix(_:_:)();
    v56 = (void (**)(char *, uint64_t))v167;
    (*((void (**)(char *, uint64_t))v167 + 1))(v54, v50);
    if ((v55 & 1) == 0)
      goto LABEL_23;
    goto LABEL_41;
  }
  v69 = AssociatedTypeWitness;
  v70 = v160;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v72 = v161;
  MEMORY[0x1BCCD79C8](&unk_1BA2183D8, 256, v69, AssociatedConformanceWitness);
  v73 = v168;
  MEMORY[0x1BCCD7998](v72, v50, v70);
  v74 = v169;
  LOBYTE(v69) = dispatch thunk of static Comparable.< infix(_:_:)();
  v56 = (void (**)(char *, uint64_t))v167;
  v75 = (void (*)(char *, uint64_t))*((_QWORD *)v167 + 1);
  v75(v73, v50);
  v76 = v158;
  ((void (*)(char *, char *, uint64_t))v56[2])(v158, v74, v50);
  if ((v69 & 1) == 0)
  {
    v85 = v76;
    v86 = v46;
    v87 = v171;
    v88 = dispatch thunk of BinaryInteger._lowWord.getter();
    v75(v85, v50);
    v141 = v88 < v87;
    v46 = v86;
    if (v141)
      goto LABEL_41;
LABEL_23:
    v58 = (void (*)(uint64_t, uint64_t))v46;
    v59 = Double.exponent.getter();
    v171 = v59;
    v60 = dispatch thunk of static BinaryInteger.isSigned.getter();
    v61 = dispatch thunk of BinaryInteger.bitWidth.getter();
    if ((v60 & 1) != 0)
    {
      if (v61 > 64)
      {
        lazy protocol witness table accessor for type Int and conformance Int();
        v62 = v168;
        dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
        v63 = v169;
        v64 = dispatch thunk of static Comparable.< infix(_:_:)();
        v65 = v56[1];
        v65(v62, v50);
        v66 = v63;
LABEL_36:
        v65(v66, v50);
        if ((v64 & 1) == 0)
        {
LABEL_37:
          a3 = v151;
          v84 = dispatch thunk of BinaryFloatingPoint.significandWidth.getter();
          if (Double.significandWidth.getter() < v84)
            goto LABEL_80;
          return specialized BinaryFloatingPoint.init<A>(_:)(v48, a2, a3);
        }
LABEL_80:
        v58(v48, a2);
        return 0;
      }
    }
    else if (v61 > 63)
    {
      v170 = v59;
      v82 = v157;
      ((void (*)(char *, char *, uint64_t))v56[4])(v157, v169, v50);
      if (v59 < 0)
      {
        v56[1](v82, v50);
        goto LABEL_80;
      }
      lazy protocol witness table accessor for type Int and conformance Int();
      v83 = v168;
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
      v64 = dispatch thunk of static Comparable.< infix(_:_:)();
      v65 = v56[1];
      v65(v83, v50);
      v66 = v82;
      goto LABEL_36;
    }
    v67 = v169;
    v68 = dispatch thunk of BinaryInteger._lowWord.getter();
    v56[1](v67, v50);
    if (v171 >= v68)
      goto LABEL_37;
    goto LABEL_80;
  }
  v75(v76, v50);
LABEL_41:
  v89 = Double.exponent.getter();
  v171 = v89;
  if ((dispatch thunk of static BinaryInteger.isSigned.getter() & 1) != 0)
  {
    v90 = v169;
    if (dispatch thunk of BinaryInteger.bitWidth.getter() >= 64)
    {
      lazy protocol witness table accessor for type Int and conformance Int();
      v91 = v168;
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
      goto LABEL_47;
    }
LABEL_52:
    if (dispatch thunk of BinaryInteger._lowWord.getter() >= v89)
      goto LABEL_53;
    goto LABEL_87;
  }
  v92 = dispatch thunk of static BinaryInteger.isSigned.getter();
  v93 = dispatch thunk of BinaryInteger.bitWidth.getter();
  if ((v92 & 1) != 0)
  {
    if (v93 <= 64)
      goto LABEL_73;
    lazy protocol witness table accessor for type Int and conformance Int();
    v91 = v168;
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    v90 = v169;
LABEL_47:
    v94 = dispatch thunk of static Comparable.< infix(_:_:)();
    v56[1](v91, v50);
    if ((v94 & 1) == 0)
      goto LABEL_53;
LABEL_87:
    v46((char *)v48, a2);
    v56[1](v90, v50);
    return 0;
  }
  if (v93 < 64)
  {
    v90 = v169;
    goto LABEL_52;
  }
  v121 = v155;
  ((void (*)(char *, char *, uint64_t))v56[2])(v155, v169, v50);
  v170 = v89;
  if (v89 > 0)
  {
    lazy protocol witness table accessor for type Int and conformance Int();
    v122 = v168;
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    v123 = dispatch thunk of static Comparable.< infix(_:_:)();
    v124 = v56[1];
    v124(v122, v50);
    v124(v121, v50);
    v90 = v169;
    if ((v123 & 1) == 0)
      goto LABEL_53;
    goto LABEL_87;
  }
  v56[1](v121, v50);
  v90 = v169;
  while (1)
  {
LABEL_53:
    v150 = (void (*)(uint64_t, uint64_t))v46;
    v169 = (char *)dispatch thunk of BinaryFloatingPoint.significandWidth.getter();
    v95 = v56[4];
    v96 = v165;
    ((void (*)(char *, char *, uint64_t))v95)(v165, v90, v50);
    v97 = dispatch thunk of static BinaryInteger.isSigned.getter();
    v98 = v163;
    v99 = v56[2];
    ((void (*)(char *, char *, uint64_t))v99)(v163, v96, v50);
    if ((v97 & 1) == 0)
    {
      v101 = v56[1];
      v101(v98, v50);
LABEL_60:
      v104 = v162;
      v102 = v99;
      goto LABEL_61;
    }
    v100 = dispatch thunk of BinaryInteger.bitWidth.getter();
    v101 = v56[1];
    v101(v98, v50);
    if (v100 <= 64)
      goto LABEL_60;
    v56 = v154;
    v102 = v99;
    ((void (*)(void (**)(char *, uint64_t), char *, uint64_t))v99)(v154, v165, v50);
    v171 = 0x8000000000000000;
    if ((dispatch thunk of static BinaryInteger.isSigned.getter() & 1) != 0)
    {
      v103 = dispatch thunk of BinaryInteger.bitWidth.getter();
      v104 = v162;
      if (v103 >= 64)
      {
        lazy protocol witness table accessor for type Int and conformance Int();
        v138 = v168;
        dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
        v139 = dispatch thunk of static Comparable.< infix(_:_:)();
        v101(v138, v50);
        v101((char *)v56, v50);
        if ((v139 & 1) == 0)
          goto LABEL_61;
      }
      else
      {
        v105 = dispatch thunk of BinaryInteger._lowWord.getter();
        v101((char *)v56, v50);
        if (v105 >= v171)
          goto LABEL_61;
      }
      goto LABEL_101;
    }
    v134 = dispatch thunk of static BinaryInteger.isSigned.getter();
    v135 = dispatch thunk of BinaryInteger.bitWidth.getter();
    if ((v134 & 1) != 0)
    {
      if (v135 > 64)
      {
        lazy protocol witness table accessor for type Int and conformance Int();
        v136 = v168;
        v50 = v152;
        v51 = v166;
        dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
        v137 = dispatch thunk of static Comparable.< infix(_:_:)();
        v101(v136, v50);
        v101((char *)v56, v50);
        v104 = v162;
        if ((v137 & 1) == 0)
          goto LABEL_61;
LABEL_101:
        __break(1u);
LABEL_102:
        v50 = v152;
        v101((char *)v56, v152);
        v51 = v166;
        v104 = v162;
        goto LABEL_61;
      }
      v142 = AssociatedTypeWitness;
      v143 = v160;
      v50 = v152;
      v144 = swift_getAssociatedConformanceWitness();
      MEMORY[0x1BCCD79C8](&unk_1BA2183D8, 256, v142, v144);
      v145 = v168;
      MEMORY[0x1BCCD7998](v161, v50, v143);
      v146 = v166;
      LOBYTE(v142) = dispatch thunk of static Comparable.< infix(_:_:)();
      v101(v145, v50);
      v51 = v153;
      ((void (*)(char *, void (**)(char *, uint64_t), uint64_t))v95)(v153, v56, v50);
      if ((v142 & 1) != 0)
        goto LABEL_104;
      v147 = v171;
      v148 = dispatch thunk of BinaryInteger._lowWord.getter();
      v101(v51, v50);
      v141 = v148 < v147;
      v51 = v146;
    }
    else
    {
      if (v135 >= 64)
        goto LABEL_102;
      v50 = v152;
      v51 = v166;
      v140 = dispatch thunk of BinaryInteger._lowWord.getter();
      v101((char *)v56, v50);
      v141 = v140 < v171;
    }
    v104 = v162;
    if (v141)
      goto LABEL_101;
LABEL_61:
    v106 = v165;
    v107 = dispatch thunk of BinaryInteger.bitWidth.getter();
    ((void (*)(char *, char *, uint64_t))v102)(v104, v106, v50);
    if (v107 >= 65)
    {
      v101(v104, v50);
      goto LABEL_63;
    }
    v110 = dispatch thunk of BinaryInteger.bitWidth.getter();
    v101(v104, v50);
    if (v110 != 64 || (dispatch thunk of static BinaryInteger.isSigned.getter() & 1) != 0)
      break;
LABEL_63:
    v46 = v164;
    ((void (*)(void (*)(char *, uint64_t), char *, uint64_t))v102)(v164, v165, v50);
    v171 = 0x7FFFFFFFFFFFFFFFLL;
    v108 = dispatch thunk of static BinaryInteger.isSigned.getter();
    v109 = dispatch thunk of BinaryInteger.bitWidth.getter();
    if ((v108 & 1) != 0)
    {
      if (v109 <= 64)
        goto LABEL_71;
      lazy protocol witness table accessor for type Int and conformance Int();
    }
    else
    {
      if (v109 < 64)
      {
LABEL_71:
        v111 = (char *)v164;
        v112 = dispatch thunk of BinaryInteger._lowWord.getter();
        v101(v111, v50);
        if (v171 >= v112)
          break;
        goto LABEL_72;
      }
      v170 = 0x7FFFFFFFFFFFFFFFLL;
      lazy protocol witness table accessor for type Int and conformance Int();
    }
    v125 = v168;
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    v46 = v164;
    v126 = dispatch thunk of static Comparable.< infix(_:_:)();
    v101(v125, v50);
    v101((char *)v46, v50);
    if ((v126 & 1) == 0)
      break;
LABEL_72:
    __break(1u);
LABEL_73:
    v113 = AssociatedTypeWitness;
    v114 = v160;
    v115 = swift_getAssociatedConformanceWitness();
    v116 = v161;
    MEMORY[0x1BCCD79C8](&unk_1BA2183D8, 256, v113, v115);
    v117 = v168;
    MEMORY[0x1BCCD7998](v116, v50, v114);
    v118 = v169;
    LOBYTE(v113) = dispatch thunk of static Comparable.< infix(_:_:)();
    v119 = v56[1];
    v119(v117, v50);
    v120 = v156;
    ((void (*)(char *, char *, uint64_t))v56[2])(v156, v118, v50);
    if ((v113 & 1) != 0)
    {
      v119(v120, v50);
      v90 = v169;
      goto LABEL_87;
    }
    v130 = v120;
    v131 = v46;
    v132 = v171;
    v133 = dispatch thunk of BinaryInteger._lowWord.getter();
    v119(v130, v50);
    v141 = v133 < v132;
    v46 = v131;
    v90 = v169;
    if (v141)
      goto LABEL_87;
  }
  v127 = v165;
  v128 = dispatch thunk of BinaryInteger._lowWord.getter();
  v101(v127, v50);
  v129 = Double.exponent.getter();
  if (__OFSUB__(v128, v129))
  {
    __break(1u);
LABEL_104:
    result = ((uint64_t (*)(char *, uint64_t))v101)(v51, v50);
    __break(1u);
    return result;
  }
  a3 = v151;
  if (v128 - v129 >= (uint64_t)v169)
    return specialized BinaryFloatingPoint.init<A>(_:)(v48, a2, a3);
  v150(v48, a2);
  return 0;
}

uint64_t protocol witness for BinaryFloatingPoint.binade.getter in conformance CGFloat@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = Double.binade.getter();
  *a1 = v3;
  return result;
}

void protocol witness for FloatingPoint.init(sign:exponent:significand:) in conformance CGFloat(char a1@<W0>, uint64_t *a2@<X1>, double *a3@<X2>, double *a4@<X8>)
{
  *a4 = specialized Double.init(sign:exponent:significand:)(a1 & 1, *a2, *a3);
}

void protocol witness for FloatingPoint.init(signOf:magnitudeOf:) in conformance CGFloat(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  *a3 = specialized BinaryFloatingPoint.init(signOf:magnitudeOf:)(*a1, *a2);
}

double protocol witness for FloatingPoint.init(_:) in conformance CGFloat@<D0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  double result;

  result = (double)a1;
  *a2 = (double)a1;
  return result;
}

uint64_t protocol witness for FloatingPoint.init<A>(_:) in conformance CGFloat@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, double *a3@<X8>)
{
  double v6;
  uint64_t result;

  v6 = specialized CGFloat.init<A>(_:)(a1, a2);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  *a3 = v6;
  return result;
}

uint64_t protocol witness for Numeric.init<A>(exactly:) in conformance CGFloat@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
  v9 = Double.init<A>(exactly:)((uint64_t)v8, a2);
  v11 = v10;
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
  if ((v11 & 1) != 0)
    v13 = 0;
  else
    v13 = v9;
  *(_QWORD *)a3 = v13;
  *(_BYTE *)(a3 + 8) = v11 & 1;
  return result;
}

uint64_t protocol witness for static FloatingPoint.radix.getter in conformance CGFloat()
{
  return 2;
}

void protocol witness for static FloatingPoint.nan.getter in conformance CGFloat(_QWORD *a1@<X8>)
{
  *a1 = 0x7FF8000000000000;
}

void protocol witness for static FloatingPoint.signalingNaN.getter in conformance CGFloat(_QWORD *a1@<X8>)
{
  *a1 = 0x7FF4000000000000;
}

void protocol witness for static FloatingPoint.infinity.getter in conformance CGFloat(_QWORD *a1@<X8>)
{
  *a1 = 0x7FF0000000000000;
}

void protocol witness for static FloatingPoint.greatestFiniteMagnitude.getter in conformance CGFloat(_QWORD *a1@<X8>)
{
  *a1 = 0x7FEFFFFFFFFFFFFFLL;
}

void protocol witness for static FloatingPoint.pi.getter in conformance CGFloat(_QWORD *a1@<X8>)
{
  *a1 = 0x400921FB54442D18;
}

double protocol witness for FloatingPoint.ulp.getter in conformance CGFloat@<D0>(double *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  double result;
  double v4;

  v2 = (*v1 >> 52) & 0x7FFLL;
  if (v2)
  {
    if (v2 != 2047)
    {
      result = COERCE_DOUBLE(*v1 & 0x7FF0000000000000) * 2.22044605e-16;
      *a1 = result;
      return result;
    }
    v4 = NAN;
  }
  else
  {
    *(_QWORD *)&v4 = 1;
  }
  result = v4;
  *a1 = v4;
  return result;
}

void protocol witness for static FloatingPoint.leastNonzeroMagnitude.getter in conformance CGFloat(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for FloatingPoint.significand.getter in conformance CGFloat@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = Double.significand.getter();
  *a1 = v3;
  return result;
}

double static CGFloat./ infix(_:_:)(double a1, double a2)
{
  return a1 / a2;
}

void protocol witness for FloatingPoint.remainder(dividingBy:) in conformance CGFloat(long double *a1@<X0>, long double *a2@<X8>)
{
  long double *v2;

  *a2 = _stdlib_remainder(*v2, *a1);
}

void protocol witness for FloatingPoint.formRemainder(dividingBy:) in conformance CGFloat(long double *a1)
{
  long double *v1;

  *v1 = _stdlib_remainder(*v1, *a1);
}

void protocol witness for FloatingPoint.truncatingRemainder(dividingBy:) in conformance CGFloat(long double *a1@<X0>, long double *a2@<X8>)
{
  long double *v2;

  *a2 = fmod(*v2, *a1);
}

void protocol witness for FloatingPoint.formTruncatingRemainder(dividingBy:) in conformance CGFloat(long double *a1)
{
  long double *v1;

  *v1 = fmod(*v1, *a1);
}

void protocol witness for FloatingPoint.squareRoot() in conformance CGFloat(double *a1@<X8>)
{
  double *v1;

  *a1 = _stdlib_squareRoot(*v1);
}

void protocol witness for FloatingPoint.formSquareRoot() in conformance CGFloat()
{
  double *v0;

  *v0 = _stdlib_squareRoot(*v0);
}

double protocol witness for FloatingPoint.addingProduct(_:_:) in conformance CGFloat@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double *v3;
  double result;

  result = *v3 + *a1 * *a2;
  *a3 = result;
  return result;
}

double protocol witness for FloatingPoint.addProduct(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  double *v2;
  double result;

  result = *v2 + *a1 * *a2;
  *v2 = result;
  return result;
}

double *protocol witness for static FloatingPoint.minimum(_:_:) in conformance CGFloat@<X0>(double *result@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double v3;
  double v4;

  v3 = *result;
  v4 = *a2;
  if (*result > *a2)
  {
    if ((*(_QWORD *)&v4 & 0xFFFFFFFFFFFFFLL) == 0)
      v3 = *a2;
    if ((~*(_QWORD *)&v4 & 0x7FF0000000000000) != 0)
      v3 = *a2;
  }
  *a3 = v3;
  return result;
}

double *protocol witness for static FloatingPoint.maximum(_:_:) in conformance CGFloat@<X0>(double *result@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double v3;
  double v4;

  v3 = *result;
  v4 = *a2;
  if (*a2 >= *result)
  {
    if ((*(_QWORD *)&v4 & 0xFFFFFFFFFFFFFLL) == 0)
      v3 = *a2;
    if ((~*(_QWORD *)&v4 & 0x7FF0000000000000) != 0)
      v3 = *a2;
  }
  *a3 = v3;
  return result;
}

double *protocol witness for static FloatingPoint.minimumMagnitude(_:_:) in conformance CGFloat@<X0>(double *result@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double v3;
  double v4;

  v3 = *result;
  v4 = *a2;
  if (fabs(*result) > fabs(*a2))
  {
    if ((*(_QWORD *)&v4 & 0xFFFFFFFFFFFFFLL) == 0)
      v3 = *a2;
    if ((~*(_QWORD *)&v4 & 0x7FF0000000000000) != 0)
      v3 = *a2;
  }
  *a3 = v3;
  return result;
}

double *protocol witness for static FloatingPoint.maximumMagnitude(_:_:) in conformance CGFloat@<X0>(double *result@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double v3;
  double v4;

  v3 = *result;
  v4 = *a2;
  if (fabs(*a2) >= fabs(*result))
  {
    if ((*(_QWORD *)&v4 & 0xFFFFFFFFFFFFFLL) == 0)
      v3 = *a2;
    if ((~*(_QWORD *)&v4 & 0x7FF0000000000000) != 0)
      v3 = *a2;
  }
  *a3 = v3;
  return result;
}

uint64_t protocol witness for FloatingPoint.rounded(_:) in conformance CGFloat@<X0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  double *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  double v9;
  uint64_t result;
  double v11;
  double v12;
  uint64_t v13;
  double v14;

  v5 = type metadata accessor for FloatingPointRoundingRule();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  v14 = *v2;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  result = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v8, v5);
  if ((_DWORD)result == *MEMORY[0x1E0DED4F0])
  {
    v11 = round(v9);
  }
  else if ((_DWORD)result == *MEMORY[0x1E0DED4E8])
  {
    v11 = rint(v9);
  }
  else if ((_DWORD)result == *MEMORY[0x1E0DED500])
  {
    v11 = ceil(v9);
  }
  else if ((_DWORD)result == *MEMORY[0x1E0DED508])
  {
    v11 = floor(v9);
  }
  else if ((_DWORD)result == *MEMORY[0x1E0DED4D8])
  {
    v11 = trunc(v9);
  }
  else if ((_DWORD)result == *MEMORY[0x1E0DED4E0])
  {
    v11 = ceil(v9);
    v12 = floor(v9);
    if (v9 < 0.0)
      v11 = v12;
  }
  else
  {
    Double._roundSlowPath(_:)();
    result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v11 = v14;
  }
  *a2 = v11;
  return result;
}

void protocol witness for FloatingPoint.nextUp.getter in conformance CGFloat(double *a1@<X8>)
{
  double *v1;
  double v2;

  v2 = *v1 + 0.0;
  if (v2 < INFINITY)
    *(_QWORD *)&v2 += (*(uint64_t *)&v2 >> 63) | 1;
  *a1 = v2;
}

double protocol witness for FloatingPoint.nextDown.getter in conformance CGFloat@<D0>(double *a1@<X8>)
{
  double *v1;
  double v2;
  double result;

  v2 = 0.0 - *v1;
  if (v2 < INFINITY)
    *(_QWORD *)&v2 += (*(uint64_t *)&v2 >> 63) | 1;
  result = -v2;
  *a1 = result;
  return result;
}

BOOL protocol witness for FloatingPoint.isEqual(to:) in conformance CGFloat(double *a1)
{
  double *v1;

  return *v1 == *a1;
}

BOOL protocol witness for FloatingPoint.isLess(than:) in conformance CGFloat(double *a1)
{
  double *v1;

  return *v1 < *a1;
}

BOOL protocol witness for FloatingPoint.isLessThanOrEqualTo(_:) in conformance CGFloat(double *a1)
{
  double *v1;

  return *v1 <= *a1;
}

uint64_t protocol witness for FloatingPoint.isTotallyOrdered(belowOrEqualTo:) in conformance CGFloat(double *a1)
{
  double *v1;

  return specialized BinaryFloatingPoint.isTotallyOrdered(belowOrEqualTo:)(*a1, *v1);
}

uint64_t specialized BinaryFloatingPoint.isTotallyOrdered(belowOrEqualTo:)(double a1, double a2)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _BOOL4 v8;

  if (a2 < a1)
    return 1;
  result = *(_QWORD *)&a2 >> 63;
  if ((*(_QWORD *)&a1 & 0x8000000000000000) != 0)
  {
    if ((*(_QWORD *)&a2 & 0x8000000000000000) == 0)
      return result;
  }
  else if ((*(_QWORD *)&a2 & 0x8000000000000000) != 0)
  {
    return result;
  }
  v3 = (*(_QWORD *)&a2 >> 52) & 0x7FFLL;
  v4 = (*(_QWORD *)&a1 >> 52) & 0x7FFLL;
  v5 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  v6 = *(_QWORD *)&a1 & 0xFFFFFFFFFFFFFLL;
  v8 = a2 >= 0.0 || v5 >= v6;
  if (v6 < v5)
    v8 = *(_QWORD *)&a2 >> 63;
  if (v3 < v4)
    v8 = a2 >= 0.0;
  if (v4 < v3)
    return result;
  else
    return v8;
}

BOOL protocol witness for FloatingPoint.isNormal.getter in conformance CGFloat()
{
  _QWORD *v0;

  return ((*v0 >> 52) & 0x7FFLL) != 0x7FF && ((*v0 >> 52) & 0x7FFLL) != 0;
}

BOOL protocol witness for FloatingPoint.isSubnormal.getter in conformance CGFloat()
{
  _QWORD *v0;

  return (*v0 & 0xFFFFFFFFFFFFFLL) != 0 && (*v0 & 0x7FF0000000000000) == 0;
}

BOOL protocol witness for FloatingPoint.isSignalingNaN.getter in conformance CGFloat()
{
  _QWORD *v0;

  return (~*v0 & 0x7FF0000000000000) == 0 && (*v0 & 0xFFFFFFFFFFFFFLL) != 0 && (*v0 & 0x8000000000000) == 0;
}

uint64_t protocol witness for FloatingPoint.floatingPointClass.getter in conformance CGFloat()
{
  double *v0;

  return specialized FloatingPoint.floatingPointClass.getter(*v0);
}

uint64_t protocol witness for FloatingPoint.isCanonical.getter in conformance CGFloat()
{
  return 1;
}

double protocol witness for ExpressibleByFloatLiteral.init(floatLiteral:) in conformance CGFloat@<D0>(double *a1@<X0>, _QWORD *a2@<X8>)
{
  double result;

  result = *a1;
  *a2 = *(_QWORD *)a1;
  return result;
}

uint64_t CGFloat.customMirror.getter()
{
  return Mirror.init(reflecting:)();
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance CGFloat()
{
  return Mirror.init(reflecting:)();
}

void CGFloat.hash(into:)(double a1)
{
  Swift::UInt64 v1;

  if ((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFLL) != 0)
    v1 = *(_QWORD *)&a1;
  else
    v1 = 0;
  Hasher._combine(_:)(v1);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance CGFloat()
{
  return Double.hashValue.getter();
}

void protocol witness for Hashable.hash(into:) in conformance CGFloat()
{
  Swift::UInt64 *v0;
  Swift::UInt64 v1;

  if ((*v0 & 0x7FFFFFFFFFFFFFFFLL) != 0)
    v1 = *v0;
  else
    v1 = 0;
  Hasher._combine(_:)(v1);
}

Swift::UInt8 __swiftcall UInt8.init(_:)(CoreGraphics::CGFloat a1)
{
  int v1;

  if ((~*(_QWORD *)&a1.native & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1.native <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1.native >= 256.0)
  {
LABEL_7:
    __break(1u);
    return v1;
  }
  return (int)a1.native;
}

Swift::Int8 __swiftcall Int8.init(_:)(CoreGraphics::CGFloat a1)
{
  int v1;

  if ((~*(_QWORD *)&a1.native & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1.native <= -129.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1.native >= 128.0)
  {
LABEL_7:
    __break(1u);
    return v1;
  }
  return (int)a1.native;
}

Swift::UInt16 __swiftcall UInt16.init(_:)(CoreGraphics::CGFloat a1)
{
  int v1;

  if ((~*(_QWORD *)&a1.native & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1.native <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1.native >= 65536.0)
  {
LABEL_7:
    __break(1u);
    return v1;
  }
  return (int)a1.native;
}

Swift::Int16 __swiftcall Int16.init(_:)(CoreGraphics::CGFloat a1)
{
  int v1;

  if ((~*(_QWORD *)&a1.native & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1.native <= -32769.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1.native >= 32768.0)
  {
LABEL_7:
    __break(1u);
    return v1;
  }
  return (int)a1.native;
}

Swift::UInt32 __swiftcall UInt32.init(_:)(CoreGraphics::CGFloat a1)
{
  Swift::UInt32 result;

  if ((~*(_QWORD *)&a1.native & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1.native <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1.native < 4294967300.0)
    return a1.native;
LABEL_7:
  __break(1u);
  return result;
}

Swift::Int32 __swiftcall Int32.init(_:)(CoreGraphics::CGFloat a1)
{
  Swift::Int32 result;

  if ((~*(_QWORD *)&a1.native & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1.native <= -2147483650.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1.native < 2147483650.0)
    return (int)a1.native;
LABEL_7:
  __break(1u);
  return result;
}

unint64_t UInt64.init(_:)(double a1)
{
  unint64_t result;

  if ((~*(_QWORD *)&a1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 1.84467441e19)
    return (unint64_t)a1;
LABEL_7:
  __break(1u);
  return result;
}

uint64_t Int64.init(_:)(double a1)
{
  uint64_t result;

  if ((~*(_QWORD *)&a1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 9.22337204e18)
    return (uint64_t)a1;
LABEL_7:
  __break(1u);
  return result;
}

Swift::Float __swiftcall Float.init(_:)(CoreGraphics::CGFloat a1)
{
  return a1.native;
}

CoreGraphics::CGFloat __swiftcall CGFloat.distance(to:)(CoreGraphics::CGFloat to)
{
  double v1;
  CoreGraphics::CGFloat result;

  result.native = to.native - v1;
  return result;
}

CoreGraphics::CGFloat __swiftcall CGFloat.advanced(by:)(CoreGraphics::CGFloat by)
{
  double v1;
  CoreGraphics::CGFloat result;

  result.native = by.native + v1;
  return result;
}

double protocol witness for Strideable.distance(to:) in conformance CGFloat@<D0>(double *a1@<X0>, double *a2@<X8>)
{
  double *v2;
  double result;

  result = *a1 - *v2;
  *a2 = result;
  return result;
}

double protocol witness for Strideable.advanced(by:) in conformance CGFloat@<D0>(double *a1@<X0>, double *a2@<X8>)
{
  double *v2;
  double result;

  result = *a1 + *v2;
  *a2 = result;
  return result;
}

double *protocol witness for static Strideable._step(after:from:by:) in conformance CGFloat(double *result, uint64_t a2, char a3, double *a4, double *a5, double *a6)
{
  double v6;
  double v8;

  v6 = *a6;
  if ((a3 & 1) != 0)
  {
    v8 = v6 + *a4;
    goto LABEL_5;
  }
  if (!__OFADD__(a2++, 1))
  {
    v8 = *a5 + (double)a2 * v6;
LABEL_5:
    *result = v8;
    return (double *)a2;
  }
  __break(1u);
  return result;
}

uint64_t CGFloat._cVarArgEncoding.getter(double a1)
{
  uint64_t result;

  result = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(_QWORD *)(result + 16) = 1;
  *(double *)(result + 32) = a1;
  return result;
}

uint64_t CGFloat._cVarArgAlignment.getter()
{
  return 8;
}

uint64_t protocol witness for _CVarArgAligned._cVarArgAlignment.getter in conformance CGFloat()
{
  return 8;
}

double CGFloat.init(from:)(_QWORD *a1)
{
  double v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  double v9;
  uint64_t v10;
  _QWORD v12[4];
  uint64_t v13;
  _QWORD *v14;
  _QWORD v15[4];

  v13 = type metadata accessor for DecodingError();
  v3 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v4 = type metadata accessor for DecodingError.Context();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v8 = v14;
  dispatch thunk of Decoder.singleValueContainer()();
  if (v8)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v14 = a1;
    v12[2] = v3;
    v12[3] = v7;
    v12[1] = v5;
    __swift_project_boxed_opaque_existential_1(v15, v15[3]);
    dispatch thunk of SingleValueDecodingContainer.decode(_:)();
    v1 = v9;
    v10 = (uint64_t)v14;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    __swift_destroy_boxed_opaque_existential_1(v10);
  }
  return v1;
}

uint64_t CGFloat.encode(to:)(_QWORD *a1)
{
  _BYTE v2[24];
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  dispatch thunk of SingleValueEncodingContainer.encode(_:)();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
}

uint64_t specialized FloatingPoint.floatingPointClass.getter(double a1)
{
  uint64_t v1;
  unsigned int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;

  v1 = (*(_QWORD *)&a1 >> 52) & 0x7FFLL;
  if (a1 < 0.0)
    v2 = 5;
  else
    v2 = 6;
  if (a1 < 0.0)
    v3 = 4;
  else
    v3 = 7;
  if ((*(_QWORD *)&a1 & 0xFFFFFFFFFFFFFLL) != 0)
    v2 = v3;
  if (a1 < 0.0)
    v4 = 3;
  else
    v4 = 8;
  if (a1 < 0.0)
    v5 = 2;
  else
    v5 = 9;
  if ((*(_QWORD *)&a1 & 0xFFFFFFFFFFFFFLL) != 0)
    v6 = (*(_QWORD *)&a1 >> 51) & 1;
  else
    v6 = v5;
  if (v1 != 2047)
    v6 = v4;
  if (v1)
    return v6;
  else
    return v2;
}

double specialized CGFloat.init<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char v7;
  uint64_t v8;
  _QWORD v9[2];

  v3 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v3 + 16))(v5);
  if (dispatch thunk of BinaryInteger.bitWidth.getter() < 65)
  {
    v7 = dispatch thunk of static BinaryInteger.isSigned.getter();
    v8 = dispatch thunk of BinaryInteger._lowWord.getter();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, a2);
    if ((v7 & 1) != 0)
      return (double)v8;
    else
      return (double)(unint64_t)v8;
  }
  else
  {
    lazy protocol witness table accessor for type Double and conformance Double();
    lazy protocol witness table accessor for type UInt64 and conformance UInt64();
    static BinaryFloatingPoint<>._convert<A>(from:)();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, a2);
    return *(double *)&v9[1];
  }
}

double specialized Double.init(sign:exponent:significand:)(char a1, uint64_t a2, double a3)
{
  double result;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;

  result = -a3;
  if ((a1 & 1) == 0)
    result = a3;
  v5 = (*(_QWORD *)&a3 >> 52) & 0x7FFLL;
  if (v5 != 2047 && v5 | *(_QWORD *)&a3 & 0xFFFFFFFFFFFFFLL)
  {
    if (a2 >= -1022)
    {
      if (a2 >= 1024)
      {
        if (a2 >= 3069)
          a2 = 3069;
        do
        {
          a2 -= 1023;
          result = result * 8.98846567e307;
        }
        while ((unint64_t)a2 > 0x3FF);
      }
    }
    else
    {
      if (a2 <= -3066)
        v6 = -3066;
      else
        v6 = a2;
      do
      {
        a2 = v6 + 1022;
        result = result * 2.22507386e-308;
        v7 = __CFADD__(v6, 2044);
        v6 += 1022;
      }
      while (!v7);
    }
    return result * COERCE_DOUBLE(((a2 << 52) + 0x3FF0000000000000) & 0x7FF0000000000000);
  }
  return result;
}

double _stdlib_squareRoot(double a1)
{
  return sqrt(a1);
}

uint64_t associated type witness table accessor for ExpressibleByFloatLiteral.FloatLiteralType : _ExpressibleByBuiltinFloatLiteral in CGFloat()
{
  return MEMORY[0x1E0DEB0F0];
}

unint64_t lazy protocol witness table accessor for type Double and conformance Double()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Double and conformance Double;
  if (!lazy protocol witness table cache variable for type Double and conformance Double)
  {
    result = MEMORY[0x1BCCD7AAC](MEMORY[0x1E0DEB078], MEMORY[0x1E0DEB070]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Double and conformance Double);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt64 and conformance UInt64()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UInt64 and conformance UInt64;
  if (!lazy protocol witness table cache variable for type UInt64 and conformance UInt64)
  {
    result = MEMORY[0x1BCCD7AAC](MEMORY[0x1E0DEE1D0], MEMORY[0x1E0DEE190]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt64 and conformance UInt64);
  }
  return result;
}

double specialized BinaryFloatingPoint.init(signOf:magnitudeOf:)(double a1, double a2)
{
  double result;

  *(_QWORD *)&result = *(_QWORD *)&a1 & 0x8000000000000000 | *(_QWORD *)&a2 & 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

uint64_t dispatch thunk of static BinaryFloatingPoint.exponentBitCount.getter()
{
  return MEMORY[0x1E0DE9DA8]();
}

uint64_t dispatch thunk of BinaryFloatingPoint.significandWidth.getter()
{
  return MEMORY[0x1E0DE9DB0]();
}

uint64_t dispatch thunk of BinaryFloatingPoint.exponentBitPattern.getter()
{
  return MEMORY[0x1E0DE9DB8]();
}

uint64_t dispatch thunk of static BinaryFloatingPoint.significandBitCount.getter()
{
  return MEMORY[0x1E0DE9DC0]();
}

uint64_t dispatch thunk of BinaryFloatingPoint.significandBitPattern.getter()
{
  return MEMORY[0x1E0DE9DC8]();
}

uint64_t static BinaryFloatingPoint._convert<A>(from:)()
{
  return MEMORY[0x1E0DE9DE8]();
}

uint64_t static BinaryFloatingPoint<>._convert<A>(from:)()
{
  return MEMORY[0x1E0DE9E10]();
}

uint64_t dispatch thunk of FloatingPoint.sign.getter()
{
  return MEMORY[0x1E0DEA130]();
}

uint64_t dispatch thunk of FloatingPoint.isNaN.getter()
{
  return MEMORY[0x1E0DEA138]();
}

uint64_t dispatch thunk of FloatingPoint.isZero.getter()
{
  return MEMORY[0x1E0DEA140]();
}

uint64_t dispatch thunk of FloatingPoint.exponent.getter()
{
  return MEMORY[0x1E0DEA168]();
}

uint64_t dispatch thunk of FloatingPoint.isFinite.getter()
{
  return MEMORY[0x1E0DEA178]();
}

uint64_t dispatch thunk of Hashable.hashValue.getter()
{
  return MEMORY[0x1E0DEA1C8]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t Double.description.getter()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t Double.significand.getter()
{
  return MEMORY[0x1E0DEAFF0]();
}

uint64_t Double._roundSlowPath(_:)()
{
  return MEMORY[0x1E0DEAFF8]();
}

uint64_t Double.significandWidth.getter()
{
  return MEMORY[0x1E0DEB008]();
}

uint64_t Double.binade.getter()
{
  return MEMORY[0x1E0DEB038]();
}

uint64_t Double.exponent.getter()
{
  return MEMORY[0x1E0DEB048]();
}

uint64_t Double.hashValue.getter()
{
  return MEMORY[0x1E0DEB060]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)()
{
  return MEMORY[0x1E0DEBD70]();
}

uint64_t dispatch thunk of BinaryInteger._lowWord.getter()
{
  return MEMORY[0x1E0DEBDF8]();
}

uint64_t dispatch thunk of BinaryInteger.bitWidth.getter()
{
  return MEMORY[0x1E0DEBE00]();
}

uint64_t dispatch thunk of static BinaryInteger.isSigned.getter()
{
  return MEMORY[0x1E0DEBE10]();
}

uint64_t type metadata accessor for DecodingError.Context()
{
  return MEMORY[0x1E0DEC488]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t type metadata accessor for FloatingPointRoundingRule()
{
  return MEMORY[0x1E0DED510]();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return MEMORY[0x1E0DED5C0]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x1E0DED638]();
}

{
  return MEMORY[0x1E0DED640]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode(_:)()
{
  return MEMORY[0x1E0DED6D8]();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return MEMORY[0x1E0DED9E8]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x1E0DEDEF0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x1E0DEDF10](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
  MEMORY[0x1E0DEDF30](a1);
}

uint64_t Mirror.init(reflecting:)()
{
  return MEMORY[0x1E0DEDF80]();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x1E0DEE230]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x1E0DEE260]();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

long double remainder(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C850A8](__x, __y);
  return result;
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

