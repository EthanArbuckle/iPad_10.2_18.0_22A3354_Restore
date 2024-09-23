uint64_t Atomic.deinit(uint64_t a1)
{
  const void *v1;
  const void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  uint64_t v14;

  v2 = v1;
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v8 = (char *)&v14 - v7;
  v9 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  memcpy(v8, v2, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 24))(v8, v3, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v3);
  return UnsafeMutablePointer.deinitialize(count:)();
}

_BYTE *protocol witness for static AtomicRepresentable.encodeAtomicRepresentation(_:) in conformance Bool@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_BYTE *protocol witness for static AtomicRepresentable.decodeAtomicRepresentation(_:) in conformance Bool@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *result & 1;
  return result;
}

__int16 protocol witness for static AtomicRepresentable.decodeAtomicRepresentation(_:) in conformance Float16@<H0>(__int16 *a1@<X0>, __int16 *a2@<X8>)
{
  __int16 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

_DWORD *protocol witness for static AtomicRepresentable.encodeAtomicRepresentation(_:) in conformance Float@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

float protocol witness for static AtomicRepresentable.decodeAtomicRepresentation(_:) in conformance Float@<S0>(float *a1@<X0>, _DWORD *a2@<X8>)
{
  float result;

  result = *a1;
  *a2 = *(_DWORD *)a1;
  return result;
}

double protocol witness for static AtomicRepresentable.decodeAtomicRepresentation(_:) in conformance Double@<D0>(double *a1@<X0>, _QWORD *a2@<X8>)
{
  double result;

  result = *a1;
  *a2 = *(_QWORD *)a1;
  return result;
}

uint64_t (*AtomicLazyReference.storage.read())()
{
  return AtomicLazyReference.storage.read;
}

void AtomicLazyReference.init()(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t AtomicLazyReference.deinit(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];
  _QWORD v11[3];
  uint64_t v12;

  v2 = atomic_load(v1);
  v11[2] = v2;
  v10[2] = *(_QWORD *)(a1 + 16);
  swift_getCanonicalSpecializedMetadata();
  v3 = type metadata accessor for Unmanaged();
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in static Unmanaged.decodeAtomicOptionalRepresentation(_:), (uint64_t)v10, MEMORY[0x24BEE4078], v3, v4, (uint64_t)&v12);
  if (v12)
    swift_unknownObjectRelease();
  v5 = type metadata accessor for Optional();
  v11[0] = &protocol witness table for Unmanaged<A>;
  v6 = MEMORY[0x24BD2E6D4](&protocol conformance descriptor for <A> A?, v5, v11);
  v8 = type metadata accessor for Atomic(0, v5, v6, v7);
  return Atomic.deinit(v8);
}

uint64_t AtomicLazyReference.storeIfNil(_:)(unint64_t a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  _QWORD v10[7];
  uint64_t v11;

  v2 = a1;
  while (1)
  {
    v3 = __ldaxr(v1);
    if (v3)
      break;
    if (!__stlxr(a1, v1))
    {
      v4 = 1;
      goto LABEL_6;
    }
  }
  v4 = 0;
  __clrex();
LABEL_6:
  v10[6] = v3;
  MEMORY[0x24BDAC7A8](a1);
  v10[2] = *(_QWORD *)(v5 + 16);
  swift_getCanonicalSpecializedMetadata();
  v6 = type metadata accessor for Unmanaged();
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))closure #1 in static Unmanaged.decodeAtomicOptionalRepresentation(_:)partial apply, (uint64_t)v10, MEMORY[0x24BEE4078], v6, v7, (uint64_t)&v11);
  if ((v4 & 1) != 0)
  {
    swift_unknownObjectRetain();
    return v2;
  }
  v8 = v11;
  result = swift_unknownObjectRelease();
  if (v8)
  {
    swift_unknownObjectRetain();
    return v8;
  }
  __break(1u);
  return result;
}

uint64_t AtomicLazyReference.load()(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  _QWORD v6[5];
  uint64_t v7;

  v2 = atomic_load(v1);
  v6[4] = v2;
  v6[2] = *(_QWORD *)(a1 + 16);
  swift_getCanonicalSpecializedMetadata();
  v3 = type metadata accessor for Unmanaged();
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))closure #1 in static Unmanaged.decodeAtomicOptionalRepresentation(_:)partial apply, (uint64_t)v6, MEMORY[0x24BEE4078], v3, v4, (uint64_t)&v7);
  result = v7;
  if (v7)
    return swift_unknownObjectRetain();
  return result;
}

uint64_t AtomicLoadOrdering._rawValue.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*AtomicLoadOrdering._rawValue.modify())()
{
  return AtomicLazyReference.storage.read;
}

BOOL static AtomicLoadOrdering.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance AtomicLoadOrdering(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void AtomicLoadOrdering.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

void protocol witness for Hashable.hash(into:) in conformance AtomicLoadOrdering()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

uint64_t AtomicLoadOrdering.description.getter(uint64_t a1)
{
  Swift::String v2;
  Swift::String v3;

  switch(a1)
  {
    case 0:
      return 0x646578616C6572;
    case 5:
      return 0xD000000000000016;
    case 2:
      return 0x6E69726975716361;
  }
  _StringGuts.grow(_:)(22);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 41;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  return 0xD000000000000013;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AtomicLoadOrdering()
{
  uint64_t *v0;

  return AtomicLoadOrdering.description.getter(*v0);
}

uint64_t AtomicStoreOrdering._rawValue.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*AtomicStoreOrdering._rawValue.modify())()
{
  return AtomicLazyReference.storage.read;
}

BOOL static AtomicStoreOrdering.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t AtomicStoreOrdering.description.getter(uint64_t a1)
{
  Swift::String v2;
  Swift::String v3;

  switch(a1)
  {
    case 0:
      return 0x646578616C6572;
    case 5:
      return 0xD000000000000016;
    case 3:
      return 0x6E697361656C6572;
  }
  _StringGuts.grow(_:)(23);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 41;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  return 0xD000000000000014;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AtomicStoreOrdering()
{
  uint64_t *v0;

  return AtomicStoreOrdering.description.getter(*v0);
}

uint64_t AtomicUpdateOrdering._rawValue.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*AtomicUpdateOrdering._rawValue.modify())()
{
  return AtomicLazyReference.storage.read;
}

BOOL static AtomicUpdateOrdering.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

Swift::Int AtomicLoadOrdering.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance AtomicLoadOrdering()
{
  Swift::UInt *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance AtomicLoadOrdering()
{
  Swift::UInt *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t AtomicUpdateOrdering.description.getter(uint64_t a1)
{
  uint64_t v1;
  Swift::String v2;
  Swift::String v3;
  uint64_t v4;

  v1 = 0xD000000000000015;
  switch(a1)
  {
    case 0:
      v1 = 0x646578616C6572;
      break;
    case 2:
      v4 = 0x726975716361;
      goto LABEL_6;
    case 3:
      v4 = 0x7361656C6572;
LABEL_6:
      v1 = v4 & 0xFFFFFFFFFFFFLL | 0x6E69000000000000;
      break;
    case 4:
      return v1;
    case 5:
      v1 = 0xD000000000000016;
      break;
    default:
      _StringGuts.grow(_:)(24);
      swift_bridgeObjectRelease();
      v2._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v2);
      swift_bridgeObjectRelease();
      v3._countAndFlagsBits = 41;
      v3._object = (void *)0xE100000000000000;
      String.append(_:)(v3);
      v1 = 0xD000000000000015;
      break;
  }
  return v1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AtomicUpdateOrdering()
{
  uint64_t *v0;

  return AtomicUpdateOrdering.description.getter(*v0);
}

uint64_t protocol witness for static AtomicRepresentable.encodeAtomicRepresentation(_:) in conformance <A> A?(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 24))();
}

uint64_t protocol witness for static AtomicRepresentable.decodeAtomicRepresentation(_:) in conformance <A> A?(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 32))();
}

_QWORD *_sSPyxG15Synchronization19AtomicRepresentableABRi_zrlAbCP06decodeB14Representationyx0bE0QznFZTW@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  if (*result)
    *a2 = *result;
  else
    __break(1u);
  return result;
}

_QWORD *partial apply for closure #1 in static Unmanaged.decodeAtomicOptionalRepresentation(_:)@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, char *);
  uint64_t v28;

  v25 = a5;
  v26 = a2;
  v28 = a4;
  v27 = a1;
  v24 = a3;
  v9 = *(_QWORD *)(a3 - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v13 + 16);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v10);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v6);
  v22 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1, v14) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
    v27(v18, v12);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    if (v7)
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v25, v12, v24);
    v22 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(a6, v22, 1);
}

uint64_t type metadata accessor for Atomic(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Atomic);
}

uint64_t protocol witness for static AtomicOptionalRepresentable.decodeAtomicOptionalRepresentation(_:) in conformance Unmanaged<A>@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t result;
  _QWORD v7[5];
  uint64_t v8;

  v7[4] = *a1;
  v7[2] = *(_QWORD *)(a2 + 16);
  swift_getCanonicalSpecializedMetadata();
  result = _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))closure #1 in static Unmanaged.decodeAtomicOptionalRepresentation(_:)partial apply, (uint64_t)v7, MEMORY[0x24BEE4078], a2, v5, (uint64_t)&v8);
  *a3 = v8;
  return result;
}

uint64_t _sSRyxG15Synchronization19AtomicRepresentableABRi_zrlAbCP06encodeB14Representationy0bE0QzxnFZTW@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return _sSRyxG15Synchronization19AtomicRepresentableABRi_zrlAbCP06encodeB14Representationy0bE0QzxnFZTWTm(a1, a2, MEMORY[0x24BEE0990], a3);
}

uint64_t _sSRyxG15Synchronization19AtomicRepresentableABRi_zrlAbCP06decodeB14Representationyx0bE0QznFZTW@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return _sSRyxG15Synchronization19AtomicRepresentableABRi_zrlAbCP06decodeB14Representationyx0bE0QznFZTWTm(a1, a2, MEMORY[0x24BEE0998], a3);
}

uint64_t _sSryxG15Synchronization19AtomicRepresentableABRi_zrlAbCP06encodeB14Representationy0bE0QzxnFZTW@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return _sSRyxG15Synchronization19AtomicRepresentableABRi_zrlAbCP06encodeB14Representationy0bE0QzxnFZTWTm(a1, a2, MEMORY[0x24BEE1CB0], a3);
}

uint64_t _sSRyxG15Synchronization19AtomicRepresentableABRi_zrlAbCP06encodeB14Representationy0bE0QzxnFZTWTm@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(_QWORD, uint64_t, _QWORD)@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v5;
  uint64_t result;

  v5 = a1[1];
  result = a3(*a1, v5, *(_QWORD *)(a2 + 16));
  *a4 = result;
  a4[1] = v5;
  return result;
}

uint64_t _sSryxG15Synchronization19AtomicRepresentableABRi_zrlAbCP06decodeB14Representationyx0bE0QznFZTW@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return _sSRyxG15Synchronization19AtomicRepresentableABRi_zrlAbCP06decodeB14Representationyx0bE0QznFZTWTm(a1, a2, MEMORY[0x24BEE1CC8], a3);
}

uint64_t _sSRyxG15Synchronization19AtomicRepresentableABRi_zrlAbCP06decodeB14Representationyx0bE0QznFZTWTm@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(_QWORD, _QWORD, _QWORD)@<X3>, uint64_t *a4@<X8>)
{
  uint64_t result;
  uint64_t v6;

  result = a3(*a1, a1[1], *(_QWORD *)(a2 + 16));
  *a4 = result;
  a4[1] = v6;
  return result;
}

uint64_t *protocol witness for static AtomicRepresentable.encodeAtomicRepresentation(_:) in conformance UnsafeRawBufferPointer@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *result;
  if (*result)
  {
    v3 = result[1] - v2;
    *a2 = v2;
    a2[1] = v3;
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
  }
  return result;
}

_QWORD *protocol witness for static AtomicRepresentable.decodeAtomicRepresentation(_:) in conformance UnsafeRawBufferPointer@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *result + result[1];
  if (!*result)
    v2 = 0;
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t *protocol witness for static AtomicRepresentable.encodeAtomicRepresentation(_:) in conformance Duration@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *result;
  *a2 = result[1];
  a2[1] = v2;
  return result;
}

uint64_t *protocol witness for static AtomicRepresentable.decodeAtomicRepresentation(_:) in conformance Duration@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *result;
  *a2 = result[1];
  a2[1] = v2;
  return result;
}

uint64_t WordPair.first.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*WordPair.first.modify())()
{
  return AtomicLazyReference.storage.read;
}

uint64_t WordPair.second.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t WordPair.second.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*WordPair.second.modify())()
{
  return AtomicLazyReference.storage.read;
}

_QWORD *protocol witness for static AtomicRepresentable.encodeAtomicRepresentation(_:) in conformance WordPair@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

_QWORD *protocol witness for static AtomicRepresentable.decodeAtomicRepresentation(_:) in conformance WordPair@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance WordPair(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

Swift::Int WordPair.hashValue.getter(Swift::UInt a1, Swift::UInt a2)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  Hasher._combine(_:)(a2);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance WordPair()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  Swift::UInt v2;

  v1 = *v0;
  v2 = v0[1];
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance WordPair()
{
  Swift::UInt *v0;
  Swift::UInt v1;

  v1 = v0[1];
  Hasher._combine(_:)(*v0);
  Hasher._combine(_:)(v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance WordPair()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  Swift::UInt v2;

  v1 = *v0;
  v2 = v0[1];
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance WordPair()
{
  _QWORD *v0;

  return WordPair.description.getter(*v0, v0[1]);
}

unint64_t WordPair.description.getter()
{
  Swift::String v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;

  _StringGuts.grow(_:)(31);
  swift_bridgeObjectRelease();
  v0._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 0x646E6F636573202CLL;
  v1._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v1);
  v2._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 41;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  return 0xD000000000000010;
}

uint64_t (*_MutexHandle.value.read())()
{
  return AtomicLazyReference.storage.read;
}

uint64_t (*_s15Synchronization5MutexVAARi_zrlE6handleAA01_B6HandleVvr())()
{
  return AtomicLazyReference.storage.read;
}

uint64_t (*_s15Synchronization5MutexVAARi_zrlE5valueAA5_CellVyxGvr())()
{
  return AtomicLazyReference.storage.read;
}

_WORD *protocol witness for static AtomicRepresentable.decodeAtomicRepresentation(_:) in conformance Int16@<X0>(_WORD *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t _Atomic8BitStorage._storage.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*_Atomic8BitStorage._storage.modify())()
{
  return AtomicLazyReference.storage.read;
}

uint64_t _Atomic16BitStorage._storage.setter(uint64_t result)
{
  _WORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*_Atomic16BitStorage._storage.modify())()
{
  return AtomicLazyReference.storage.read;
}

uint64_t _Atomic32BitStorage._storage.setter(uint64_t result)
{
  _DWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*_Atomic32BitStorage._storage.modify())()
{
  return AtomicLazyReference.storage.read;
}

uint64_t _Atomic64BitStorage._storage.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*_Atomic64BitStorage._storage.modify())()
{
  return AtomicLazyReference.storage.read;
}

uint64_t _Atomic128BitStorage._storage.setter(uint64_t result, uint64_t a2)
{
  _QWORD *v2;

  *v2 = result;
  v2[1] = a2;
  return result;
}

uint64_t (*_Atomic128BitStorage._storage.modify())()
{
  return AtomicLazyReference.storage.read;
}

unint64_t lazy protocol witness table accessor for type AtomicLoadOrdering and conformance AtomicLoadOrdering()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AtomicLoadOrdering and conformance AtomicLoadOrdering;
  if (!lazy protocol witness table cache variable for type AtomicLoadOrdering and conformance AtomicLoadOrdering)
  {
    result = MEMORY[0x24BD2E6D4](&protocol conformance descriptor for AtomicLoadOrdering, &type metadata for AtomicLoadOrdering);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AtomicLoadOrdering and conformance AtomicLoadOrdering);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AtomicStoreOrdering and conformance AtomicStoreOrdering()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AtomicStoreOrdering and conformance AtomicStoreOrdering;
  if (!lazy protocol witness table cache variable for type AtomicStoreOrdering and conformance AtomicStoreOrdering)
  {
    result = MEMORY[0x24BD2E6D4](&protocol conformance descriptor for AtomicStoreOrdering, &type metadata for AtomicStoreOrdering);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AtomicStoreOrdering and conformance AtomicStoreOrdering);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AtomicUpdateOrdering and conformance AtomicUpdateOrdering()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AtomicUpdateOrdering and conformance AtomicUpdateOrdering;
  if (!lazy protocol witness table cache variable for type AtomicUpdateOrdering and conformance AtomicUpdateOrdering)
  {
    result = MEMORY[0x24BD2E6D4](&protocol conformance descriptor for AtomicUpdateOrdering, &type metadata for AtomicUpdateOrdering);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AtomicUpdateOrdering and conformance AtomicUpdateOrdering);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type WordPair and conformance WordPair()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type WordPair and conformance WordPair;
  if (!lazy protocol witness table cache variable for type WordPair and conformance WordPair)
  {
    result = MEMORY[0x24BD2E6D4](&protocol conformance descriptor for WordPair, &type metadata for WordPair);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type WordPair and conformance WordPair);
  }
  return result;
}

uint64_t type metadata instantiation function for Atomic()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for Atomic()
{
  uint64_t result;
  unint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  __int128 v5;
  int v6;
  int v7;
  __int128 *v8;

  v8 = &v5;
  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    v2 = *(_QWORD *)(result - 8);
    v3 = *(_DWORD *)(v2 + 84);
    v4 = *(unsigned __int8 *)(v2 + 80) | 0x10000;
    v5 = *(_OWORD *)(v2 + 64);
    v6 = v4;
    v7 = v3;
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for Atomic(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
}

uint64_t assignWithTake for Atomic(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 40))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t getEnumTagSinglePayload for Atomic(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 48))(a1, a2, AssociatedTypeWitness);
}

uint64_t storeEnumTagSinglePayload for Atomic(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(a1, a2, a3, AssociatedTypeWitness);
}

uint64_t destroy for AtomicLazyReference(uint64_t a1, uint64_t a2)
{
  return AtomicLazyReference.deinit(a2);
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AtomicLazyReference(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AtomicLazyReference(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
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
  *(_BYTE *)(result + 8) = v3;
  return result;
}

uint64_t type metadata accessor for AtomicLazyReference(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AtomicLazyReference);
}

uint64_t sub_24BC535B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _UNKNOWN **v4;

  if (!MEMORY[0x24BEE4F18])
    return MEMORY[0x24BEE4AE0] + 8;
  type metadata accessor for Unmanaged();
  v0 = type metadata accessor for Optional();
  v4 = &protocol witness table for Unmanaged<A>;
  v1 = MEMORY[0x24BD2E6D4](&protocol conformance descriptor for <A> A?, v0, &v4);
  return type metadata accessor for Atomic(0, v0, v1, v2);
}

ValueMetadata *type metadata accessor for AtomicLoadOrdering()
{
  return &type metadata for AtomicLoadOrdering;
}

ValueMetadata *type metadata accessor for AtomicStoreOrdering()
{
  return &type metadata for AtomicStoreOrdering;
}

ValueMetadata *type metadata accessor for AtomicUpdateOrdering()
{
  return &type metadata for AtomicUpdateOrdering;
}

uint64_t dispatch thunk of static AtomicOptionalRepresentable.decodeAtomicOptionalRepresentation(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of static AtomicRepresentable.encodeAtomicRepresentation(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of static AtomicRepresentable.decodeAtomicRepresentation(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for WordPair(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for WordPair(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for WordPair()
{
  return &type metadata for WordPair;
}

uint64_t type metadata instantiation function for _Cell()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for _Cell()
{
  uint64_t result;
  unint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  __int128 v5;
  int v6;
  int v7;
  __int128 *v8;

  v8 = &v5;
  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    v2 = *(_QWORD *)(result - 8);
    v3 = *(_DWORD *)(v2 + 84);
    v4 = *(unsigned __int8 *)(v2 + 80) | 0x10000;
    v5 = *(_OWORD *)(v2 + 64);
    v6 = v4;
    v7 = v3;
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for _Cell(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t initializeWithTake for _Cell(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
  return a1;
}

uint64_t assignWithTake for _Cell(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  return a1;
}

uint64_t getEnumTagSinglePayload for _Cell(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for _Cell(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 56))();
}

uint64_t type metadata accessor for _Cell(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _Cell);
}

_DWORD *__swift_memcpy4_4(_DWORD *result, _DWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for _MutexHandle(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for _MutexHandle(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 4) = v3;
  return result;
}

void *type metadata accessor for _MutexHandle()
{
  return &type metadata for _MutexHandle;
}

uint64_t sub_24BC53878()
{
  if (MEMORY[0x24BEE4F18])
    return __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _Cell<os_unfair_lock_s>);
  else
    return MEMORY[0x24BEE4AE0] + 8;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD2E6C8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata completion function for Mutex(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v5;

  result = type metadata accessor for _Cell(319, *(_QWORD *)(a1 + 16), a3, a4);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for Mutex(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((a1 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

_DWORD *initializeWithTake for Mutex(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v4;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_BYTE *assignWithTake for Mutex(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 40))((unint64_t)&a1[*(unsigned __int8 *)(v4 + 80) + 4] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), (unint64_t)&a2[*(unsigned __int8 *)(v4 + 80) + 4] & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

uint64_t getEnumTagSinglePayload for Mutex(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  char v9;
  int v10;
  unsigned int v11;
  int v12;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v8 = ((v6 + 4) & ~v6) + *(_QWORD *)(v4 + 64);
  v9 = 8 * v8;
  if (v8 <= 3)
  {
    v11 = ((v7 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      v10 = *(_DWORD *)(a1 + v8);
      if (!v10)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v11 > 0xFF)
    {
      v10 = *(unsigned __int16 *)(a1 + v8);
      if (!*(_WORD *)(a1 + v8))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v11 < 2)
    {
LABEL_18:
      if (v5)
        return (*(uint64_t (**)(uint64_t))(v4 + 48))((a1 + v6 + 4) & ~v6);
      return 0;
    }
  }
  v10 = *(unsigned __int8 *)(a1 + v8);
  if (!*(_BYTE *)(a1 + v8))
    goto LABEL_18;
LABEL_11:
  v12 = (v10 - 1) << v9;
  if (v8 > 3)
    v12 = 0;
  if (!(_DWORD)v8)
    return v5 + v12 + 1;
  if (v8 > 3)
    LODWORD(v8) = 4;
  return ((uint64_t (*)(void))((char *)&loc_24BC53ADC + 4 * byte_24BC54716[(v8 - 1)]))();
}

void storeEnumTagSinglePayload for Mutex(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  size_t v9;
  BOOL v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(unsigned __int8 *)(v6 + 80);
  v9 = ((v8 + 4) & ~v8) + *(_QWORD *)(v6 + 64);
  v10 = a3 >= v7;
  v11 = a3 - v7;
  if (v11 != 0 && v10)
  {
    if (v9 <= 3)
    {
      v14 = ((v11 + ~(-1 << (8 * v9))) >> (8 * v9)) + 1;
      if (HIWORD(v14))
      {
        v12 = 4u;
      }
      else if (v14 >= 0x100)
      {
        v12 = 2;
      }
      else
      {
        v12 = v14 > 1;
      }
    }
    else
    {
      v12 = 1u;
    }
  }
  else
  {
    v12 = 0;
  }
  if (v7 < a2)
  {
    v13 = ~v7 + a2;
    if (v9 < 4)
    {
      if ((_DWORD)v9)
      {
        v15 = v13 & ~(-1 << (8 * v9));
        bzero(a1, v9);
        if ((_DWORD)v9 == 3)
        {
          *a1 = v15;
          *((_BYTE *)a1 + 2) = BYTE2(v15);
        }
        else if ((_DWORD)v9 == 2)
        {
          *a1 = v15;
        }
        else
        {
          *(_BYTE *)a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, ((v8 + 4) & ~v8) + *(_QWORD *)(v6 + 64));
      *(_DWORD *)a1 = v13;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

uint64_t type metadata accessor for Mutex(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Mutex);
}

void *sub_24BC53D14()
{
  if (MEMORY[0x24BEE4F18])
    return &type metadata for _MutexHandle;
  else
    return (void *)(MEMORY[0x24BEE4AE0] + 8);
}

uint64_t sub_24BC53D3C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (MEMORY[0x24BEE4F18])
    return type metadata accessor for _Cell(0, *a1, a3, a4);
  else
    return MEMORY[0x24BEE4AE0] + 8;
}

ValueMetadata *type metadata accessor for _Atomic8BitStorage()
{
  return &type metadata for _Atomic8BitStorage;
}

ValueMetadata *type metadata accessor for _Atomic16BitStorage()
{
  return &type metadata for _Atomic16BitStorage;
}

ValueMetadata *type metadata accessor for _Atomic32BitStorage()
{
  return &type metadata for _Atomic32BitStorage;
}

ValueMetadata *type metadata accessor for _Atomic64BitStorage()
{
  return &type metadata for _Atomic64BitStorage;
}

ValueMetadata *type metadata accessor for _Atomic128BitStorage()
{
  return &type metadata for _Atomic128BitStorage;
}

void type metadata accessor for os_unfair_lock_s()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!lazy cache variable for type metadata for os_unfair_lock_s)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for os_unfair_lock_s);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for Optional(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  if (*(_DWORD *)(v6 + 84))
    v8 = *(_QWORD *)(v6 + 64);
  else
    v8 = *(_QWORD *)(v6 + 64) + 1;
  if (*(_DWORD *)(v6 + 80) > 7u || (v7 & 0x100000) != 0 || v8 > 0x18)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v7 + 16) & ~(unint64_t)v7));
    swift_retain();
  }
  else if ((*(unsigned int (**)(uint64_t *, uint64_t, _QWORD))(v6 + 48))(a2, 1, *(_QWORD *)(a3 + 16)))
  {
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

uint64_t destroy for Optional(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return result;
}

void *initializeWithCopy for Optional(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  size_t v7;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84))
      v7 = *(_QWORD *)(v6 + 64);
    else
      v7 = *(_QWORD *)(v6 + 64) + 1;
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *assignWithCopy for Optional(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 1, v5);
  v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v6 + 84))
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = *(_QWORD *)(v6 + 64) + 1;
  memcpy(a1, a2, v10);
  return a1;
}

void *initializeWithTake for Optional(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  size_t v7;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84))
      v7 = *(_QWORD *)(v6 + 64);
    else
      v7 = *(_QWORD *)(v6 + 64) + 1;
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *assignWithTake for Optional(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 1, v5);
  v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v6 + 84))
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = *(_QWORD *)(v6 + 64) + 1;
  memcpy(a1, a2, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for Optional(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  char v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  unsigned int v14;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = v5 - 1;
  if (!v5)
    v6 = 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v7;
  if (!a2)
    return 0;
  v8 = a2 - v6;
  if (a2 > v6)
  {
    v9 = 8 * v7;
    if (v7 > 3)
      goto LABEL_8;
    v11 = ((v8 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      v10 = *(_DWORD *)(a1 + v7);
      if (v10)
        goto LABEL_15;
    }
    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2)
          goto LABEL_24;
LABEL_8:
        v10 = *(unsigned __int8 *)(a1 + v7);
        if (!*(_BYTE *)(a1 + v7))
          goto LABEL_24;
LABEL_15:
        v12 = (v10 - 1) << v9;
        if (v7 > 3)
          v12 = 0;
        if ((_DWORD)v7)
        {
          if (v7 <= 3)
            v13 = v7;
          else
            v13 = 4;
          __asm { BR              X12 }
        }
        return v6 + v12 + 1;
      }
      v10 = *(unsigned __int16 *)(a1 + v7);
      if (*(_WORD *)(a1 + v7))
        goto LABEL_15;
    }
  }
LABEL_24:
  if (v5 < 2)
    return 0;
  v14 = (*(uint64_t (**)(void))(v4 + 48))();
  if (v14 >= 2)
    return v14 - 1;
  else
    return 0;
}

void storeEnumTagSinglePayload for Optional(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  size_t v10;
  BOOL v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v6 = 0;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = v8 - 1;
  if (v8)
  {
    v10 = *(_QWORD *)(v7 + 64);
  }
  else
  {
    v9 = 0;
    v10 = *(_QWORD *)(v7 + 64) + 1;
  }
  v11 = a3 >= v9;
  v12 = a3 - v9;
  if (v12 != 0 && v11)
  {
    if (v10 > 3)
    {
      v6 = 1u;
      if (v9 < a2)
        goto LABEL_14;
      goto LABEL_21;
    }
    v13 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
    if (HIWORD(v13))
    {
      v6 = 4u;
      if (v9 < a2)
      {
LABEL_14:
        v14 = ~v9 + a2;
        if (v10 < 4)
        {
          if ((_DWORD)v10)
          {
            v15 = v14 & ~(-1 << (8 * v10));
            bzero(a1, v10);
            if ((_DWORD)v10 == 3)
            {
              *a1 = v15;
              *((_BYTE *)a1 + 2) = BYTE2(v15);
            }
            else if ((_DWORD)v10 == 2)
            {
              *a1 = v15;
            }
            else
            {
              *(_BYTE *)a1 = v15;
            }
          }
        }
        else
        {
          bzero(a1, v10);
          *(_DWORD *)a1 = v14;
        }
        __asm { BR              X10 }
      }
LABEL_21:
      __asm { BR              X11 }
    }
    if (v13 >= 0x100)
      v6 = 2;
    else
      v6 = v13 > 1;
  }
  if (v9 < a2)
    goto LABEL_14;
  goto LABEL_21;
}

void sub_24BC54524()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_24BC5452C()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

uint64_t getEnumTag for Optional(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 48))(a1, 1);
}

uint64_t destructiveInjectEnumTag for Optional(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 56))(a1, a2, 1);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24BD2E6BC](a1, v6, a5);
}

_QWORD *closure #1 in static Unmanaged.decodeAtomicOptionalRepresentation(_:)partial apply@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return partial apply for closure #1 in static Unmanaged.decodeAtomicOptionalRepresentation(_:)(a1, a2);
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

uint64_t UnsafeMutablePointer.deinitialize(count:)()
{
  return MEMORY[0x24BEE1C00]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t type metadata accessor for Unmanaged()
{
  return MEMORY[0x24BEE4A78]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getCanonicalSpecializedMetadata()
{
  return MEMORY[0x24BEE4CF8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

