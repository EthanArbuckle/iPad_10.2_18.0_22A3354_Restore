uint64_t _machPrecondition(file:line:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t result;

  result = a5();
  if ((_DWORD)result)
    __break(1u);
  return result;
}

uint64_t Mach.Port._name.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t Mach.Port._name.setter(uint64_t result)
{
  _DWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*Mach.Port._name.modify())()
{
  return Mach.Port._name.modify;
}

uint64_t Mach.Port._context.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t Mach.Port._context.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*Mach.Port._context.modify())()
{
  return Mach.Port._name.modify;
}

uint64_t Mach.Port.init(name:)@<X0>(uint64_t result@<X0>, ValueMetadata *a2@<X1>, uint64_t a3@<X8>)
{
  mach_port_name_t v3;
  mach_port_context_t v5;

  if (!(_DWORD)result)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v3 = result;
  if (a2 != &type metadata for Mach.ReceiveRight)
  {
    v5 = 0;
LABEL_6:
    *(_DWORD *)a3 = v3;
    *(_QWORD *)(a3 + 8) = v5;
    return result;
  }
  if ((_DWORD)result == -1)
    goto LABEL_8;
  v5 = arc4random();
  result = mach_port_guard(*MEMORY[0x24BDAEC58], v3, v5, 0);
  if (!(_DWORD)result)
    goto LABEL_6;
LABEL_9:
  __break(1u);
  return result;
}

uint64_t Mach.Port.withBorrowedName<A>(body:)(uint64_t (*a1)(_QWORD))
{
  unsigned int *v1;

  return a1(*v1);
}

uint64_t Mach.Port.deinit(uint64_t result)
{
  uint64_t v1;
  mach_port_name_t v2;

  v2 = *(_DWORD *)v1;
  if (*(ValueMetadata **)(result + 16) != &type metadata for Mach.ReceiveRight)
  {
    result = mach_port_deallocate(*MEMORY[0x24BDAEC58], v2);
    if (!(_DWORD)result)
      return result;
    __break(1u);
  }
  if (v2 == -1)
  {
    __break(1u);
    goto LABEL_8;
  }
  result = mach_port_destruct(*MEMORY[0x24BDAEC58], v2, 0, *(_QWORD *)(v1 + 8));
  if ((_DWORD)result)
LABEL_8:
    __break(1u);
  return result;
}

uint64_t static Mach.PortRightError.== infix(_:_:)()
{
  return 1;
}

void Mach.PortRightError.hash(into:)()
{
  Hasher._combine(_:)(0);
}

Swift::Int Mach.PortRightError.hashValue.getter()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Mach.PortRightError()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Mach.PortRightError()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance Mach.PortRightError()
{
  Hasher._combine(_:)(0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Mach.PortRightError()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t Mach.Port<>.init(name:context:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if ((_DWORD)result)
  {
    *(_DWORD *)a3 = result;
    *(_QWORD *)(a3 + 8) = a2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t Mach.Port<>.init()@<X0>(uint64_t a1@<X8>)
{
  ipc_space_t *v2;
  mach_port_name_t v3;
  mach_port_context_t v4;
  uint64_t result;
  mach_port_name_t name;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  name = 0;
  v2 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  if (mach_port_allocate(*MEMORY[0x24BDAEC58], 1u, &name))
  {
    __break(1u);
    goto LABEL_6;
  }
  v3 = name;
  if (name + 1 < 2)
    goto LABEL_7;
  v4 = arc4random();
  result = mach_port_guard(*v2, v3, v4, 0);
  if ((_DWORD)result)
  {
LABEL_6:
    __break(1u);
LABEL_7:
    __break(1u);
  }
  *(_DWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  return result;
}

uint64_t Mach.Port<>.relinquish()()
{
  unsigned int *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mach.Port<Mach.ReceiveRight>);
  Mach.Port.deinit(v2);
  return v1;
}

{
  return Mach.Port<>.relinquish()(&demangling cache variable for type metadata for Mach.Port<Mach.SendRight>);
}

{
  return Mach.Port<>.relinquish()(&demangling cache variable for type metadata for Mach.Port<Mach.SendOnceRight>);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD32704]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t Mach.Port<>.unguardAndRelinquish()()
{
  unsigned int *v0;
  uint64_t v1;
  mach_port_context_t v2;
  uint64_t v3;
  uint64_t result;

  v1 = *v0;
  v2 = *((_QWORD *)v0 + 1);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mach.Port<Mach.ReceiveRight>);
  Mach.Port.deinit(v3);
  result = mach_port_unguard(*MEMORY[0x24BDAEC58], v1, v2);
  if (!(_DWORD)result)
    return v1;
  __break(1u);
  return result;
}

uint64_t Mach.Port<>.withBorrowedName<A>(body:)(uint64_t (*a1)(_QWORD, _QWORD))
{
  unsigned int *v1;

  return a1(*v1, *((_QWORD *)v1 + 1));
}

uint64_t Mach.Port<>.makeSendOnceRight()@<X0>(uint64_t a1@<X8>)
{
  unsigned int *v1;
  uint64_t result;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0;
  result = MEMORY[0x20BD325C0](*MEMORY[0x24BDAEC58], *v1, 21, (char *)v4 + 4, v4);
  if ((_DWORD)result)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (LODWORD(v4[0]) != 18)
  {
LABEL_6:
    __break(1u);
LABEL_7:
    __break(1u);
  }
  if (!HIDWORD(v4[0]))
    goto LABEL_7;
  *(_DWORD *)a1 = HIDWORD(v4[0]);
  *(_QWORD *)(a1 + 8) = 0;
  return result;
}

uint64_t Mach.Port<>.makeSendRight()@<X0>(uint64_t a1@<X8>)
{
  mach_port_name_t *v1;
  mach_port_name_t v3;
  uint64_t result;
  BOOL v5;

  v3 = *v1;
  result = mach_port_insert_right(*MEMORY[0x24BDAEC58], v3, v3, 0x14u);
  if (v3)
    v5 = (_DWORD)result == 0;
  else
    v5 = 0;
  if (v5)
  {
    *(_DWORD *)a1 = v3;
    *(_QWORD *)(a1 + 8) = 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t Mach.Port<>.makeSendCount.getter()
{
  mach_port_name_t *v0;
  mach_msg_type_number_t port_info_outCnt;
  integer_t port_info_out[4];
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  *(_OWORD *)port_info_out = 0u;
  v4 = 0u;
  port_info_outCnt = 10;
  if (mach_port_get_attributes(*MEMORY[0x24BDAEC58], *v0, 2, port_info_out, &port_info_outCnt))
    __break(1u);
  return port_info_out[2];
}

uint64_t Mach.Port<>.makeSendCount.setter(uint64_t a1)
{
  unsigned int *v1;
  uint64_t result;

  result = MEMORY[0x20BD325F0](*MEMORY[0x24BDAEC58], *v1, a1);
  if ((_DWORD)result)
    __break(1u);
  return result;
}

void (*Mach.Port<>.makeSendCount.modify(_QWORD *a1))(void **a1, char a2)
{
  mach_port_name_t *v1;
  char *v3;

  v3 = (char *)malloc(0x38uLL);
  *(_OWORD *)(v3 + 8) = 0u;
  *a1 = v3;
  *((_DWORD *)v3 + 13) = 10;
  *(_QWORD *)v3 = v1;
  *(_OWORD *)(v3 + 24) = 0u;
  *((_QWORD *)v3 + 5) = 0;
  if (mach_port_get_attributes(*MEMORY[0x24BDAEC58], *v1, 2, (mach_port_info_t)v3 + 2, (mach_msg_type_number_t *)v3 + 13))
  {
    __break(1u);
  }
  *((_DWORD *)v3 + 12) = *((_DWORD *)v3 + 4);
  return Mach.Port<>.makeSendCount.modify;
}

void Mach.Port<>.makeSendCount.modify(void **a1, char a2)
{
  void *v3;
  int v4;

  v3 = *a1;
  v4 = MEMORY[0x20BD325F0](*MEMORY[0x24BDAEC58], **(unsigned int **)*a1, *((unsigned int *)*a1 + 12));
  if ((a2 & 1) != 0)
  {
    if (!v4)
    {
LABEL_5:
      free(v3);
      return;
    }
    __break(1u);
  }
  if (!v4)
    goto LABEL_5;
  __break(1u);
}

uint64_t Mach.Port<>.copySendRight()@<X0>(uint64_t a1@<X8>)
{
  mach_port_name_t *v1;
  mach_port_name_t v3;
  uint64_t result;
  BOOL v6;

  v3 = *v1;
  result = mach_port_insert_right(*MEMORY[0x24BDAEC58], *v1, *v1, 0x13u);
  if ((_DWORD)result == 15 || (_DWORD)result == 20)
  {
    lazy protocol witness table accessor for type Mach.PortRightError and conformance Mach.PortRightError();
    swift_allocError();
    return swift_willThrow();
  }
  else
  {
    if (v3)
      v6 = (_DWORD)result == 0;
    else
      v6 = 0;
    if (v6)
    {
      *(_DWORD *)a1 = v3;
      *(_QWORD *)(a1 + 8) = 0;
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Mach.PortRightError and conformance Mach.PortRightError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Mach.PortRightError and conformance Mach.PortRightError;
  if (!lazy protocol witness table cache variable for type Mach.PortRightError and conformance Mach.PortRightError)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for Mach.PortRightError, &type metadata for Mach.PortRightError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Mach.PortRightError and conformance Mach.PortRightError);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Mach.PortRightError and conformance Mach.PortRightError;
  if (!lazy protocol witness table cache variable for type Mach.PortRightError and conformance Mach.PortRightError)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for Mach.PortRightError, &type metadata for Mach.PortRightError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Mach.PortRightError and conformance Mach.PortRightError);
  }
  return result;
}

uint64_t Mach.Port<>.relinquish()(uint64_t *a1)
{
  unsigned int *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(a1);
  Mach.Port.deinit(v3);
  return v2;
}

ValueMetadata *type metadata accessor for Mach()
{
  return &type metadata for Mach;
}

uint64_t type metadata instantiation function for Mach.Port()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t destroy for Mach.Port(uint64_t a1, uint64_t a2)
{
  return Mach.Port.deinit(a2);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for Mach.Port(uint64_t result, uint64_t a2)
{
  *(_DWORD *)result = *(_DWORD *)a2;
  *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 8);
  return result;
}

uint64_t getEnumTagSinglePayload for Mach.Port(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Mach.Port(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for Mach.Port(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Mach.Port);
}

uint64_t getEnumTagSinglePayload for Mach.PortRightError(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for Mach.PortRightError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_20AE1AFC8 + 4 * asc_20AE2D110[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_20AE1AFE8 + 4 * byte_20AE2D115[v4]))();
}

_BYTE *sub_20AE1AFC8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_20AE1AFE8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_20AE1AFF0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_20AE1AFF8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_20AE1B000(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_20AE1B008(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t getEnumTag for Mach.PortRightError()
{
  return 0;
}

ValueMetadata *type metadata accessor for Mach.PortRightError()
{
  return &type metadata for Mach.PortRightError;
}

ValueMetadata *type metadata accessor for Mach.ReceiveRight()
{
  return &type metadata for Mach.ReceiveRight;
}

ValueMetadata *type metadata accessor for Mach.SendRight()
{
  return &type metadata for Mach.SendRight;
}

ValueMetadata *type metadata accessor for Mach.SendOnceRight()
{
  return &type metadata for Mach.SendOnceRight;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x20BD326EC](a1, v6, a5);
}

uint64_t protocol witness for Decodable.init(from:) in conformance FileDescriptor()
{
  lazy protocol witness table accessor for type FileDescriptor and conformance FileDescriptor();
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance FileDescriptor()
{
  lazy protocol witness table accessor for type FileDescriptor and conformance FileDescriptor();
  return RawRepresentable<>.encode(to:)();
}

_DWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance FileDescriptor.AccessMode@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance FileDescriptor.AccessMode(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

void protocol witness for Hashable.hash(into:) in conformance FileDescriptor.AccessMode()
{
  Swift::UInt32 *v0;

  Hasher._combine(_:)(*v0);
}

uint64_t protocol witness for Decodable.init(from:) in conformance FileDescriptor.AccessMode()
{
  lazy protocol witness table accessor for type FileDescriptor.AccessMode and conformance FileDescriptor.AccessMode();
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance FileDescriptor.AccessMode()
{
  lazy protocol witness table accessor for type FileDescriptor.AccessMode and conformance FileDescriptor.AccessMode();
  return RawRepresentable<>.encode(to:)();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance FileDescriptor.AccessMode(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_DWORD *protocol witness for OptionSet.init(rawValue:) in conformance FileDescriptor.OpenOptions@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance FileDescriptor.OpenOptions()
{
  lazy protocol witness table accessor for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions();
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance FileDescriptor.OpenOptions()
{
  lazy protocol witness table accessor for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions();
  return RawRepresentable<>.encode(to:)();
}

void protocol witness for SetAlgebra.init() in conformance FileDescriptor.OpenOptions(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

_DWORD *protocol witness for SetAlgebra.union(_:) in conformance FileDescriptor.OpenOptions@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.intersection(_:) in conformance FileDescriptor.OpenOptions@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance FileDescriptor.OpenOptions@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance FileDescriptor.OpenOptions(_DWORD *a1, int *a2)
{
  _DWORD *v2;
  int v3;
  int v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_DWORD *protocol witness for SetAlgebra.remove(_:) in conformance FileDescriptor.OpenOptions@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  _DWORD *v2;
  int v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_DWORD *)a2 = v3;
  *(_BYTE *)(a2 + 4) = v3 == 0;
  return result;
}

int *protocol witness for SetAlgebra.update(with:) in conformance FileDescriptor.OpenOptions@<X0>(int *result@<X0>, uint64_t a2@<X8>)
{
  int *v2;
  int v3;
  int v4;
  int v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = v5 == 0;
  return result;
}

_DWORD *protocol witness for SetAlgebra.formUnion(_:) in conformance FileDescriptor.OpenOptions(_DWORD *result)
{
  _DWORD *v1;

  *v1 |= *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.formIntersection(_:) in conformance FileDescriptor.OpenOptions(_DWORD *result)
{
  _DWORD *v1;

  *v1 &= *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance FileDescriptor.OpenOptions(_DWORD *result)
{
  _DWORD *v1;

  *v1 ^= *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.subtracting(_:) in conformance FileDescriptor.OpenOptions@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance FileDescriptor.OpenOptions(_DWORD *a1)
{
  _DWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance FileDescriptor.OpenOptions(_DWORD *a1)
{
  _DWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance FileDescriptor.OpenOptions(_DWORD *a1)
{
  _DWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance FileDescriptor.OpenOptions()
{
  _DWORD *v0;

  return *v0 == 0;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance FileDescriptor.OpenOptions()
{
  return SetAlgebra.init<A>(_:)();
}

_DWORD *protocol witness for SetAlgebra.subtract(_:) in conformance FileDescriptor.OpenOptions(_DWORD *result)
{
  _DWORD *v1;

  *v1 &= ~*result;
  return result;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance FileDescriptor.OpenOptions@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  int v3;
  uint64_t result;

  v3 = specialized SetAlgebra<>.init(arrayLiteral:)(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance FileDescriptor()
{
  Swift::UInt32 *v0;
  Swift::UInt32 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance FileDescriptor()
{
  Swift::UInt32 *v0;
  Swift::UInt32 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for Decodable.init(from:) in conformance FileDescriptor.SeekOrigin()
{
  lazy protocol witness table accessor for type FileDescriptor.SeekOrigin and conformance FileDescriptor.SeekOrigin();
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance FileDescriptor.SeekOrigin()
{
  lazy protocol witness table accessor for type FileDescriptor.SeekOrigin and conformance FileDescriptor.SeekOrigin();
  return RawRepresentable<>.encode(to:)();
}

uint64_t FileDescriptor.AccessMode.description.getter(int a1)
{
  Swift::String v2;
  Swift::String v3;

  switch(a1)
  {
    case 0:
      return 0x796C6E4F64616572;
    case 2:
      return 0x7469725764616572;
    case 1:
      return 0x6C6E4F6574697277;
  }
  _StringGuts.grow(_:)(16);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 41;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  return 0xD000000000000015;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FileDescriptor.AccessMode()
{
  int *v0;

  return FileDescriptor.AccessMode.description.getter(*v0);
}

unint64_t FileDescriptor.SeekOrigin.description.getter(int a1)
{
  unint64_t result;
  Swift::String v3;
  Swift::String v4;

  result = 0x7472617473;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = 0x746E6572727563;
      break;
    case 2:
      result = 6581861;
      break;
    case 3:
      result = 0x656C6F487478656ELL;
      break;
    case 4:
      result = 0x617461447478656ELL;
      break;
    default:
      _StringGuts.grow(_:)(16);
      swift_bridgeObjectRelease();
      v3._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v3);
      swift_bridgeObjectRelease();
      v4._countAndFlagsBits = 41;
      v4._object = (void *)0xE100000000000000;
      String.append(_:)(v4);
      result = 0xD000000000000015;
      break;
  }
  return result;
}

unint64_t protocol witness for CustomStringConvertible.description.getter in conformance FileDescriptor.SeekOrigin()
{
  int *v0;

  return FileDescriptor.SeekOrigin.description.getter(*v0);
}

uint64_t FileDescriptor.OpenOptions.description.getter(int a1)
{
  return specialized OptionSet._buildDescription(_:)((uint64_t)&outlined read-only object #0 of FileDescriptor.OpenOptions.description.getter, a1);
}

uint64_t specialized OptionSet._buildDescription(_:)(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  Swift::String v6;
  Swift::String v7;
  Swift::String v8;
  Swift::String v10;
  Swift::String v11;
  Swift::String v12;
  Swift::String v13;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = swift_bridgeObjectRetain() + 56;
    do
    {
      v5 = *(_DWORD *)(v4 - 24);
      if ((v5 & ~a2) == 0)
      {
        v6._countAndFlagsBits = StaticString.description.getter();
        String.append(_:)(v6);
        swift_bridgeObjectRelease();
        a2 &= ~v5;
        if (a2)
        {
          v7._countAndFlagsBits = 8236;
          v7._object = (void *)0xE200000000000000;
          String.append(_:)(v7);
        }
      }
      v4 += 32;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  if (a2)
  {
    _StringGuts.grow(_:)(16);
    v10._countAndFlagsBits = 0x6974704F6E65704FLL;
    v10._object = (void *)0xEB00000000736E6FLL;
    String.append(_:)(v10);
    v11._countAndFlagsBits = 0x756C615677617228;
    v11._object = (void *)0xEB00000000203A65;
    String.append(_:)(v11);
    _print_unlocked<A, B>(_:_:)();
    v12._countAndFlagsBits = 41;
    v12._object = (void *)0xE100000000000000;
    String.append(_:)(v12);
    v13._countAndFlagsBits = 0;
    v13._object = (void *)0xE000000000000000;
    String.append(_:)(v13);
    swift_bridgeObjectRelease();
  }
  v8._countAndFlagsBits = 93;
  v8._object = (void *)0xE100000000000000;
  String.append(_:)(v8);
  return 91;
}

uint64_t specialized OptionSet._buildDescription(_:)(uint64_t a1, unsigned __int16 a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  Swift::String v6;
  Swift::String v7;
  Swift::String v8;
  Swift::String v10;
  Swift::String v11;
  Swift::String v12;
  Swift::String v13;

  v2 = a2;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = swift_bridgeObjectRetain() + 56;
    do
    {
      v5 = *(unsigned __int16 *)(v4 - 24);
      if ((v5 & ~v2) == 0)
      {
        v6._countAndFlagsBits = StaticString.description.getter();
        String.append(_:)(v6);
        swift_bridgeObjectRelease();
        v2 &= v5 ^ 0xFFFF;
        if (v2)
        {
          v7._countAndFlagsBits = 8236;
          v7._object = (void *)0xE200000000000000;
          String.append(_:)(v7);
        }
      }
      v4 += 32;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  if (v2)
  {
    _StringGuts.grow(_:)(16);
    v10._countAndFlagsBits = 0x6D726550656C6946;
    v10._object = (void *)0xEF736E6F69737369;
    String.append(_:)(v10);
    v11._countAndFlagsBits = 0x756C615677617228;
    v11._object = (void *)0xEB00000000203A65;
    String.append(_:)(v11);
    _print_unlocked<A, B>(_:_:)();
    v12._countAndFlagsBits = 41;
    v12._object = (void *)0xE100000000000000;
    String.append(_:)(v12);
    v13._countAndFlagsBits = 0;
    v13._object = (void *)0xE000000000000000;
    String.append(_:)(v13);
    swift_bridgeObjectRelease();
  }
  v8._countAndFlagsBits = 93;
  v8._object = (void *)0xE100000000000000;
  String.append(_:)(v8);
  return 91;
}

unint64_t lazy protocol witness table accessor for type FileDescriptor and conformance FileDescriptor()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FileDescriptor and conformance FileDescriptor;
  if (!lazy protocol witness table cache variable for type FileDescriptor and conformance FileDescriptor)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FileDescriptor, &type metadata for FileDescriptor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FileDescriptor and conformance FileDescriptor);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FileDescriptor and conformance FileDescriptor;
  if (!lazy protocol witness table cache variable for type FileDescriptor and conformance FileDescriptor)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FileDescriptor, &type metadata for FileDescriptor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FileDescriptor and conformance FileDescriptor);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FileDescriptor.AccessMode and conformance FileDescriptor.AccessMode()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FileDescriptor.AccessMode and conformance FileDescriptor.AccessMode;
  if (!lazy protocol witness table cache variable for type FileDescriptor.AccessMode and conformance FileDescriptor.AccessMode)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FileDescriptor.AccessMode, &type metadata for FileDescriptor.AccessMode);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FileDescriptor.AccessMode and conformance FileDescriptor.AccessMode);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FileDescriptor.AccessMode and conformance FileDescriptor.AccessMode;
  if (!lazy protocol witness table cache variable for type FileDescriptor.AccessMode and conformance FileDescriptor.AccessMode)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FileDescriptor.AccessMode, &type metadata for FileDescriptor.AccessMode);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FileDescriptor.AccessMode and conformance FileDescriptor.AccessMode);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions;
  if (!lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FileDescriptor.OpenOptions, &type metadata for FileDescriptor.OpenOptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions;
  if (!lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FileDescriptor.OpenOptions, &type metadata for FileDescriptor.OpenOptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions;
  if (!lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FileDescriptor.OpenOptions, &type metadata for FileDescriptor.OpenOptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions;
  if (!lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FileDescriptor.OpenOptions, &type metadata for FileDescriptor.OpenOptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FileDescriptor.OpenOptions and conformance FileDescriptor.OpenOptions);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FileDescriptor.SeekOrigin and conformance FileDescriptor.SeekOrigin()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FileDescriptor.SeekOrigin and conformance FileDescriptor.SeekOrigin;
  if (!lazy protocol witness table cache variable for type FileDescriptor.SeekOrigin and conformance FileDescriptor.SeekOrigin)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FileDescriptor.SeekOrigin, &type metadata for FileDescriptor.SeekOrigin);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FileDescriptor.SeekOrigin and conformance FileDescriptor.SeekOrigin);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FileDescriptor.SeekOrigin and conformance FileDescriptor.SeekOrigin;
  if (!lazy protocol witness table cache variable for type FileDescriptor.SeekOrigin and conformance FileDescriptor.SeekOrigin)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FileDescriptor.SeekOrigin, &type metadata for FileDescriptor.SeekOrigin);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FileDescriptor.SeekOrigin and conformance FileDescriptor.SeekOrigin);
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FileDescriptor.OpenOptions()
{
  int *v0;

  return FileDescriptor.OpenOptions.description.getter(*v0);
}

ValueMetadata *type metadata accessor for FileDescriptor()
{
  return &type metadata for FileDescriptor;
}

ValueMetadata *type metadata accessor for FileDescriptor.AccessMode()
{
  return &type metadata for FileDescriptor.AccessMode;
}

ValueMetadata *type metadata accessor for FileDescriptor.OpenOptions()
{
  return &type metadata for FileDescriptor.OpenOptions;
}

ValueMetadata *type metadata accessor for FileDescriptor.SeekOrigin()
{
  return &type metadata for FileDescriptor.SeekOrigin;
}

Swift::Int specialized Sequence<>.starts<A>(with:)(Swift::Int result, Swift::Int startingAt, uint64_t a3, int64_t a4)
{
  int64_t v4;
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  Swift::Int v8;
  uint64_t v9;
  int64_t v10;
  Swift::Int v11;
  _BYTE *v12;
  int64_t v13;
  uint64_t v14;
  int64_t v15;
  Swift::Int v16;
  int64_t v17;
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  int v23;
  int64_t v24;
  int64_t v25;
  int64_t v27;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  Swift::Int v33;
  _BOOL4 v34;
  _BYTE *v35;

  v4 = startingAt;
  v5 = result;
  v6 = *(_QWORD *)(a3 + 16);
  v7 = v6 - 1;
  if (v6 - 1 != a4)
  {
    v9 = a3;
    v10 = *(_QWORD *)(result + 16);
    v11 = v10 - 1;
    v35 = (_BYTE *)(a3 + 32);
    v12 = (_BYTE *)(result + 32);
    v13 = v6 - 2;
    v14 = a3 + 33;
    v15 = v10 - 2;
    v16 = result + 33;
    v33 = result + 33;
    while (1)
    {
      if (v6 == 1 || a4)
      {
        if (!v6 || v6 <= a4)
          goto LABEL_114;
        if (a4 < 0)
          goto LABEL_106;
      }
      else
      {
        if (!v6)
          goto LABEL_113;
        if (*v35 == 47)
        {
          v17 = 1;
          goto LABEL_15;
        }
      }
      v17 = v6 - 1;
      if (a4 != v7)
      {
        if (a4 >= v7)
          goto LABEL_120;
        v17 = a4;
        if (v35[a4] == 47)
          goto LABEL_16;
        v17 = v6 - 1;
        if (a4 + 1 != v7)
        {
          v20 = a4;
          while (v20 + 1 >= a4 && v20 + 1 < v7)
          {
            if (*(_BYTE *)(v14 + v20) == 47)
            {
              v17 = v20 + 1;
              goto LABEL_15;
            }
            if (v13 == ++v20)
            {
              v17 = v6 - 1;
              goto LABEL_15;
            }
          }
          goto LABEL_101;
        }
      }
LABEL_15:
      if (v17 < a4)
        goto LABEL_104;
LABEL_16:
      if (a4 == v17)
        goto LABEL_103;
      if (v6 == 1 || a4)
      {
        if (v6 <= a4)
          goto LABEL_115;
        if (a4 < 0)
          goto LABEL_111;
      }
      else if (*v35 == 47)
      {
        v18 = 1;
        goto LABEL_49;
      }
      v18 = v6 - 1;
      if (a4 != v7)
      {
        if (a4 >= v7)
          goto LABEL_119;
        v19 = a4;
        if (v35[a4] == 47)
        {
LABEL_26:
          v18 = v19 + 1;
        }
        else
        {
          v18 = v6 - 1;
          if (a4 + 1 != v7)
          {
            v19 = a4;
            while (v19 + 1 >= a4 && v19 + 1 < v7)
            {
              v23 = *(unsigned __int8 *)(v14 + v19++);
              if (v23 == 47)
                goto LABEL_26;
              if (v13 == v19)
              {
                v18 = v6 - 1;
                goto LABEL_49;
              }
            }
LABEL_102:
            __break(1u);
LABEL_103:
            __break(1u);
LABEL_104:
            __break(1u);
LABEL_105:
            __break(1u);
LABEL_106:
            __break(1u);
LABEL_107:
            __break(1u);
LABEL_108:
            __break(1u);
LABEL_109:
            __break(1u);
LABEL_110:
            __break(1u);
LABEL_111:
            __break(1u);
LABEL_112:
            __break(1u);
LABEL_113:
            __break(1u);
LABEL_114:
            __break(1u);
            __break(1u);
LABEL_115:
            __break(1u);
LABEL_116:
            __break(1u);
LABEL_117:
            __break(1u);
            __break(1u);
LABEL_118:
            __break(1u);
LABEL_119:
            __break(1u);
LABEL_120:
            __break(1u);
LABEL_121:
            __break(1u);
LABEL_122:
            __break(1u);
            return result;
          }
        }
      }
LABEL_49:
      v34 = v4 == v11;
      if (v4 == v11)
        return v34;
      if (v4 || !v11)
      {
        if (!v10 || v10 <= v4)
          goto LABEL_117;
        if (v4 < 0)
          goto LABEL_109;
      }
      else
      {
        if (!v10)
          goto LABEL_116;
        if (*v12 == 47)
        {
          v24 = 1;
          goto LABEL_71;
        }
      }
      if (v4 >= v11)
        goto LABEL_108;
      v24 = v4;
      if (v12[v4] == 47)
        goto LABEL_72;
      v24 = v11;
      if (v4 + 1 != v11)
      {
        v25 = v4;
        while (1)
        {
          if (v25 + 1 < v4 || v25 + 1 >= v11)
          {
            __break(1u);
            goto LABEL_100;
          }
          if (*(_BYTE *)(v16 + v25) == 47)
            break;
          if (v15 == ++v25)
          {
            v24 = v11;
            goto LABEL_71;
          }
        }
        v24 = v25 + 1;
      }
LABEL_71:
      if (v24 < v4)
        goto LABEL_107;
LABEL_72:
      if (v4 == v24)
        goto LABEL_105;
      if (v4 || v10 == 1)
      {
        if (v10 <= v4)
          goto LABEL_118;
        if (v4 < 0)
          goto LABEL_112;
      }
      else if (*v12 == 47)
      {
        v8 = 1;
        goto LABEL_92;
      }
      if (v4 >= v11)
        goto LABEL_110;
      v27 = v4;
      if (v12[v4] == 47)
      {
LABEL_81:
        v8 = v27 + 1;
      }
      else
      {
        v8 = v11;
        if (v4 + 1 != v11)
        {
          v27 = v4;
          while (v27 + 1 >= v4 && v27 + 1 < v11)
          {
            v29 = *(unsigned __int8 *)(v16 + v27++);
            if (v29 == 47)
              goto LABEL_81;
            if (v15 == v27)
            {
              v8 = v11;
              goto LABEL_92;
            }
          }
LABEL_100:
          __break(1u);
LABEL_101:
          __break(1u);
          goto LABEL_102;
        }
      }
LABEL_92:
      v30 = v14;
      v31 = v5;
      v32 = v9;
      result = specialized Sequence<>.elementsEqual<A>(_:)(v4, v24, v5, a4, v17, v9);
      if ((result & 1) == 0)
        return v34;
      v4 = v8;
      a4 = v18;
      v5 = v31;
      v9 = v32;
      v14 = v30;
      v15 = v10 - 2;
      v11 = v10 - 1;
      v16 = v33;
      if (v18 == v7)
        goto LABEL_3;
    }
  }
  v8 = startingAt;
LABEL_3:
  if (v8 == *(_QWORD *)(v5 + 16) - 1)
  {
    return 1;
  }
  else
  {
    result = FilePath._parseComponent(startingAt:)(v8).componentEnd;
    if (result < v8)
      goto LABEL_121;
    if (v8 == result)
      goto LABEL_122;
    FilePath._parseComponent(startingAt:)(v8);
    return 0;
  }
}

int64_t specialized Sequence<>.starts<A>(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t result;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  int64_t v18;
  _BOOL8 v19;
  int64_t v20;
  int64_t v21;
  char v23;
  Swift::Int v24;
  Swift::Int componentEnd;
  uint64_t v26;
  int64_t v27;
  _BYTE *v28;
  _BYTE *v29;
  int64_t v30;
  uint64_t v33;

  v5 = *(_QWORD *)(a1 + 16);
  v6 = v5 - 1;
  v7 = *(_QWORD *)(a3 + 16);
  v8 = v7 - 1;
  if (v7 - 1 != a4)
  {
    v28 = (_BYTE *)(a1 + 32);
    v29 = (_BYTE *)(a3 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10 = v7 - 2;
    v30 = v5;
    v33 = a1;
    v26 = a1 + 33;
    v27 = v5 - 2;
    v11 = v5 - 1;
    v12 = v7 - 1;
    while (1)
    {
      result = FilePath._parseComponent(priorTo:)(v12);
      v12 = result;
      if (v7 == 1 || result)
      {
        v14 = a3 + 33;
        if (!v7 || v7 <= result)
          goto LABEL_70;
        if (result < 0)
          goto LABEL_67;
      }
      else
      {
        v14 = a3 + 33;
        if (!v7)
          goto LABEL_69;
        if (*v29 == 47)
        {
          v15 = 1;
          goto LABEL_28;
        }
      }
      v15 = v7 - 1;
      if (result != v8)
      {
        if (result >= v8)
          goto LABEL_73;
        if (v29[result] == 47)
          goto LABEL_77;
        v15 = v7 - 1;
        if (result + 1 != v8)
        {
          v16 = result;
          while (1)
          {
            if (v16 + 1 < result || v16 + 1 >= v8)
            {
              __break(1u);
              goto LABEL_64;
            }
            if (*(_BYTE *)(v14 + v16) == 47)
              break;
            if (v10 == ++v16)
            {
              v15 = v7 - 1;
              goto LABEL_26;
            }
          }
          v15 = v16 + 1;
        }
      }
LABEL_26:
      if (v15 < result)
        goto LABEL_65;
      if (result == v15)
        goto LABEL_77;
LABEL_28:
      v18 = v10;
      v19 = v11 == a2;
      if (v11 == a2)
        goto LABEL_61;
      swift_bridgeObjectRetain();
      result = FilePath._parseComponent(priorTo:)(v11);
      v11 = result;
      if (result || !v6)
      {
        if (!v30 || v30 <= result)
          goto LABEL_72;
        if (result < 0)
          goto LABEL_68;
      }
      else
      {
        if (!v30)
          goto LABEL_71;
        if (*v28 == 47)
        {
          v20 = 1;
          goto LABEL_53;
        }
      }
      v20 = v6;
      if (result != v6)
      {
        if (result >= v6)
          goto LABEL_74;
        if (v28[result] == 47)
          goto LABEL_78;
        v20 = v6;
        if (result + 1 != v6)
        {
          v21 = result;
          while (v21 + 1 >= result && v21 + 1 < v6)
          {
            if (*(_BYTE *)(v26 + v21) == 47)
            {
              v20 = v21 + 1;
              goto LABEL_51;
            }
            if (v27 == ++v21)
            {
              v20 = v6;
              goto LABEL_51;
            }
          }
LABEL_64:
          __break(1u);
LABEL_65:
          __break(1u);
LABEL_66:
          __break(1u);
LABEL_67:
          __break(1u);
LABEL_68:
          __break(1u);
LABEL_69:
          __break(1u);
LABEL_70:
          __break(1u);
LABEL_71:
          __break(1u);
LABEL_72:
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
LABEL_75:
          __break(1u);
LABEL_76:
          __break(1u);
LABEL_77:
          __break(1u);
LABEL_78:
          __break(1u);
          return result;
        }
      }
LABEL_51:
      if (v20 < result)
        goto LABEL_66;
      if (result == v20)
        goto LABEL_78;
LABEL_53:
      v23 = specialized Sequence<>.elementsEqual<A>(_:)(result, v20, v33, v12, v15, a3);
      swift_bridgeObjectRelease();
      if ((v23 & 1) == 0)
      {
LABEL_61:
        swift_bridgeObjectRelease();
        goto LABEL_62;
      }
      v10 = v18;
      if (v12 == a4)
      {
        swift_bridgeObjectRelease();
        v6 = v11;
        goto LABEL_56;
      }
    }
  }
  swift_bridgeObjectRetain();
LABEL_56:
  if (v6 == a2)
  {
    v19 = 1;
LABEL_62:
    swift_bridgeObjectRelease();
  }
  else
  {
    v24 = FilePath._parseComponent(priorTo:)(v6);
    componentEnd = FilePath._parseComponent(startingAt:)(v24).componentEnd;
    result = swift_bridgeObjectRelease();
    if (componentEnd < v24)
      goto LABEL_75;
    if (v24 == componentEnd)
      goto LABEL_76;
    return 0;
  }
  return v19;
}

BOOL FilePath.isAbsolute.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BOOL8 result;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  if (v1 == 1)
    return 0;
  if (v1)
    return *(_BYTE *)(*(_QWORD *)v0 + 32) == 47;
  __break(1u);
  return result;
}

uint64_t FilePath.root.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  Swift::tuple_rootEnd_Int_relativeBegin_Int v5;
  uint64_t result;

  v3 = *v1;
  v4 = *(_QWORD *)(v3 + 16);
  if (v4 == 1)
  {
LABEL_5:
    *a1 = 0;
    a1[1] = 0;
    return result;
  }
  if (v4)
  {
    if (*(_BYTE *)(v3 + 32) == 47)
    {
      v5 = SystemString._parseRoot()();
      *a1 = v3;
      a1[1] = v5.relativeBegin;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

BOOL FilePath.isRelative.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BOOL8 result;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  if (v1 == 1)
    return 1;
  if (v1)
    return *(_BYTE *)(*(_QWORD *)v0 + 32) != 47;
  __break(1u);
  return result;
}

Swift::Bool __swiftcall FilePath.starts(with:)(System::FilePath with)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  char v8;
  int64_t v9;

  v2 = *(_QWORD *)with._storage.nullTerminatedStorage._rawValue;
  v3 = *(_QWORD *)(*(_QWORD *)with._storage.nullTerminatedStorage._rawValue + 16);
  if (v3 != 1)
  {
    v4 = *v1;
    v5 = *(_QWORD *)(v4 + 16);
    if (v5 == 1)
      goto LABEL_7;
    if (!v5)
      goto LABEL_23;
    if (*(_BYTE *)(v4 + 32) != 47)
    {
LABEL_7:
      v7 = 0;
      v6 = 0;
    }
    else
    {
      LOBYTE(with._storage.nullTerminatedStorage._rawValue) = swift_bridgeObjectRetain();
      v6 = 1;
      v7 = v4;
    }
    if (v3)
    {
      if (*(_BYTE *)(v2 + 32) == 47)
      {
        swift_bridgeObjectRetain();
        if (v7)
        {
          v8 = specialized Sequence<>.elementsEqual<A>(_:)(0, 1, v2, 0, v6, v7);
          swift_bridgeObjectRelease();
          LOBYTE(with._storage.nullTerminatedStorage._rawValue) = swift_bridgeObjectRelease();
          if ((v8 & 1) != 0)
            goto LABEL_16;
LABEL_15:
          LOBYTE(with._storage.nullTerminatedStorage._rawValue) = 0;
          return (Swift::Bool)with._storage.nullTerminatedStorage._rawValue;
        }
      }
      else if (!v7)
      {
LABEL_16:
        if (v5 == 1)
        {
          v9 = 0;
        }
        else
        {
          if (!*(_QWORD *)(v4 + 16))
          {
LABEL_25:
            __break(1u);
            __break(1u);
            return (Swift::Bool)with._storage.nullTerminatedStorage._rawValue;
          }
          v9 = *(unsigned __int8 *)(v4 + 32) == 47;
        }
        if (*(_QWORD *)(v2 + 16))
        {
          LOBYTE(with._storage.nullTerminatedStorage._rawValue) = specialized Sequence<>.starts<A>(with:)(v2, *(unsigned __int8 *)(v2 + 32) == 47, v4, v9);
          return (Swift::Bool)with._storage.nullTerminatedStorage._rawValue;
        }
LABEL_24:
        __break(1u);
        __break(1u);
        goto LABEL_25;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    __break(1u);
LABEL_23:
    __break(1u);
    __break(1u);
    goto LABEL_24;
  }
  LOBYTE(with._storage.nullTerminatedStorage._rawValue) = 1;
  return (Swift::Bool)with._storage.nullTerminatedStorage._rawValue;
}

BOOL FilePath.isEmpty.getter()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 16) == 1;
}

Swift::Bool __swiftcall FilePath.ends(with:)(System::FilePath with)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v8;
  char v9;

  v2 = *(_QWORD *)with._storage.nullTerminatedStorage._rawValue;
  v3 = *v1;
  v4 = *(_QWORD *)(*(_QWORD *)with._storage.nullTerminatedStorage._rawValue + 16);
  if (v4 == 1)
    goto LABEL_5;
  if (!v4)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (*(_BYTE *)(v2 + 32) != 47)
  {
LABEL_5:
    v5 = *(_QWORD *)(v3 + 16);
    if (v5 == 1)
    {
      v6 = 0;
      v7 = 0;
      if (v4 == 1)
        goto LABEL_12;
      goto LABEL_11;
    }
    if (v5)
    {
      v6 = *(unsigned __int8 *)(v3 + 32) == 47;
      if (v4 == 1)
      {
        v7 = 0;
LABEL_12:
        swift_bridgeObjectRetain();
        v8 = swift_bridgeObjectRetain();
        v9 = specialized Sequence<>.starts<A>(with:)(v8, v7, v3, v6);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        LOBYTE(with._storage.nullTerminatedStorage._rawValue) = v9 & 1;
        return (Swift::Bool)with._storage.nullTerminatedStorage._rawValue;
      }
LABEL_11:
      v7 = *(unsigned __int8 *)(v2 + 32) == 47;
      goto LABEL_12;
    }
LABEL_14:
    __break(1u);
    __break(1u);
    return (Swift::Bool)with._storage.nullTerminatedStorage._rawValue;
  }
  LOBYTE(with._storage.nullTerminatedStorage._rawValue) = specialized static Array<A>.== infix(_:_:)(v3, v2);
  return (Swift::Bool)with._storage.nullTerminatedStorage._rawValue;
}

Swift::Int key path getter for FilePath.root : FilePath@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  Swift::Int result;
  Swift::tuple_rootEnd_Int_relativeBegin_Int v5;
  Swift::Int relativeBegin;

  v3 = *a1;
  v5 = SystemString._parseRoot()();
  result = v5.rootEnd;
  if (v5.relativeBegin)
  {
    relativeBegin = SystemString._parseRoot()().relativeBegin;
    result = swift_bridgeObjectRetain();
  }
  else
  {
    v3 = 0;
    relativeBegin = 0;
  }
  *a2 = v3;
  a2[1] = relativeBegin;
  return result;
}

uint64_t *FilePath.root.setter(uint64_t *result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  int64_t v6;

  if (*result)
  {
    v2 = result[1];
    v3 = *(_QWORD *)(*(_QWORD *)v1 + 16);
    if (v3 == 1)
    {
      v4 = 0;
    }
    else
    {
      if (!v3)
      {
LABEL_14:
        __break(1u);
        goto LABEL_15;
      }
      v4 = *(unsigned __int8 *)(*(_QWORD *)v1 + 32) == 47;
    }
    if ((v2 & 0x8000000000000000) == 0)
    {
      specialized Array.replaceSubrange<A>(_:with:)(0, v4, 0, v2, *result);
      return (uint64_t *)swift_bridgeObjectRelease();
    }
    __break(1u);
    goto LABEL_14;
  }
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  if (v5 == 1)
  {
    v6 = 0;
    return (uint64_t *)specialized Array.replaceSubrange<A>(_:with:)(0, v6);
  }
  if (v5)
  {
    v6 = *(unsigned __int8 *)(*(_QWORD *)v1 + 32) == 47;
    return (uint64_t *)specialized Array.replaceSubrange<A>(_:with:)(0, v6);
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t *(*FilePath.root.modify(uint64_t *(**a1)(uint64_t *a1, char a2)))(uint64_t *a1, char a2)
{
  uint64_t *(**v1)(uint64_t *, char);
  uint64_t *(*result)(uint64_t *, char);
  uint64_t v4;

  a1[2] = (uint64_t *(*)(uint64_t *, char))v1;
  result = *v1;
  v4 = *((_QWORD *)*v1 + 2);
  if (v4 == 1)
    goto LABEL_5;
  if (v4)
  {
    if (*((_BYTE *)result + 32) == 47)
    {
      *a1 = result;
      a1[1] = (uint64_t *(*)(uint64_t *, char))1;
      swift_bridgeObjectRetain();
      return FilePath.root.modify;
    }
LABEL_5:
    *a1 = 0;
    a1[1] = 0;
    return FilePath.root.modify;
  }
  __break(1u);
  return result;
}

uint64_t *FilePath.root.modify(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v4[2];

  v2 = a1[1];
  v4[0] = *a1;
  v4[1] = v2;
  if ((a2 & 1) == 0)
    return FilePath.root.setter(v4);
  swift_bridgeObjectRetain();
  FilePath.root.setter(v4);
  return (uint64_t *)swift_bridgeObjectRelease();
}

System::FilePath __swiftcall FilePath.removingRoot()()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  System::FilePath result;

  v2 = *v1;
  *v0 = *v1;
  v3 = *(_QWORD *)(v2 + 16);
  if (v3 == 1)
  {
    v4 = 0;
    return (System::FilePath)specialized Array.replaceSubrange<A>(_:with:)(0, v4);
  }
  if (v3)
  {
    v4 = *(unsigned __int8 *)(v2 + 32) == 47;
    return (System::FilePath)specialized Array.replaceSubrange<A>(_:with:)(0, v4);
  }
  __break(1u);
  return result;
}

void FilePath.lastComponent.getter(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  Swift::Int componentEnd;

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 - 1;
  if (v4 == 1)
    goto LABEL_5;
  if (!v4)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (*(_BYTE *)(v3 + 32) == 47 && v4 == 2)
  {
LABEL_5:
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
    return;
  }
  swift_bridgeObjectRetain();
  v6 = FilePath._parseComponent(priorTo:)(v5);
  componentEnd = FilePath._parseComponent(startingAt:)(v6).componentEnd;
  if (componentEnd < v6)
    goto LABEL_10;
  if (v6 != componentEnd)
  {
    *a1 = v3;
    a1[1] = v6;
    a1[2] = componentEnd;
    return;
  }
LABEL_11:
  __break(1u);
  __break(1u);
}

uint64_t specialized BidirectionalCollection.last.getter(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 16);
  if (v1 == 1)
  {
    v2 = 0;
    return v2 | ((v1 == 1) << 8);
  }
  if (v1)
  {
    v2 = *(unsigned __int8 *)(v1 + result + 30);
    return v2 | ((v1 == 1) << 8);
  }
  __break(1u);
  return result;
}

System::FilePath __swiftcall FilePath.removingLastComponent()()
{
  _QWORD *v0;
  _QWORD *v1;

  *v0 = *v1;
  return (System::FilePath)FilePath.removeLastComponent()();
}

Swift::Bool __swiftcall FilePath.removeLastComponent()()
{
  unint64_t *v0;
  uint64_t v1;
  Swift::Bool result;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int v6;
  unint64_t v7;
  int64_t v8;
  _BYTE v9[24];

  v7 = *v0;
  FilePath.lastComponent.getter(v9);
  v1 = *(_QWORD *)v9;
  if (!*(_QWORD *)v9)
    return v1 != 0;
  *(_OWORD *)v9 = *(_OWORD *)&v9[8];
  *(_QWORD *)&v9[16] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Slice<SystemString>);
  Slice.indices.getter();
  swift_bridgeObjectRelease();
  result = specialized Array.replaceSubrange<A>(_:with:)(v7, v8);
  v3 = *v0;
  v4 = *(_QWORD *)(*v0 + 16);
  if (v4 == 1)
    return v1 != 0;
  if (v4)
  {
    v6 = *(unsigned __int8 *)(v3 + 32);
    v5 = v3 + 32;
    if ((v6 != 47 || v4 != 2) && *(_BYTE *)(v5 + v4 - 2) == 47)
      specialized RangeReplaceableCollection.remove(at:)(v4 - 2);
    return v1 != 0;
  }
  __break(1u);
  __break(1u);
  __break(1u);
  return result;
}

int64_t FilePath.Component.extension.getter()
{
  uint64_t v0;
  int64_t v1;
  uint64_t v2;
  int64_t result;
  uint64_t v4;
  char v5;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 16);
  result = FilePath.Component._extensionRange()();
  if ((v5 & 1) != 0)
    return 0;
  if (result >= v1 && v2 >= v4)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Slice<SystemString>);
    Slice.indices.getter();
    v7 = static String._fromUTF8Repairing(_:)();
    swift_bridgeObjectRelease();
    return v7;
  }
  __break(1u);
  return result;
}

void FilePath.Component.stem.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  int64_t v3;
  char v4;
  int64_t v5;
  char v6;
  uint64_t v7;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  swift_bridgeObjectRetain();
  FilePath.Component.kind.getter();
  if (v4 == 2)
  {
    v5 = specialized BidirectionalCollection<>.lastIndex(of:)(0x2Eu, v2, v3, v1);
    if (v5 == v2)
      v7 = v3;
    else
      v7 = v5;
    if ((v6 & 1) != 0)
      v7 = v3;
  }
  else
  {
    v7 = v3;
  }
  if (v7 < v2)
  {
    __break(1u);
  }
  else if (v3 >= v7)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Slice<SystemString>);
    Slice.indices.getter();
    static String._fromUTF8Repairing(_:)();
    swift_bridgeObjectRelease_n();
    return;
  }
  __break(1u);
}

int64_t FilePath.extension.getter()
{
  int64_t v0;
  uint64_t v1;
  int64_t result;
  uint64_t v3;
  char v4;
  uint64_t v6;
  _QWORD v7[3];

  FilePath.lastComponent.getter(v7);
  if (!v7[0])
    return 0;
  v0 = v7[1];
  v1 = v7[2];
  result = FilePath.Component._extensionRange()();
  if ((v4 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if (result >= v0 && v1 >= v3)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Slice<SystemString>);
    Slice.indices.getter();
    v6 = static String._fromUTF8Repairing(_:)();
    swift_bridgeObjectRelease_n();
    return v6;
  }
  __break(1u);
  return result;
}

uint64_t FilePath.extension.setter(uint64_t a1, void *a2)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  char v7;
  Swift::String v8;
  System::SystemString v9;
  char v10;
  int64_t v11;
  char v12;
  char v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;

  FilePath.lastComponent.getter(&v16);
  v4 = v16;
  if (v16)
  {
    v6 = v17;
    v5 = v18;
    FilePath.Component.kind.getter();
    if (v7 != 2)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    if (a2)
    {
      v8._countAndFlagsBits = a1;
      v8._object = a2;
      v9.nullTerminatedStorage._rawValue = _makeExtension(_:)(v8).nullTerminatedStorage._rawValue;
      swift_bridgeObjectRelease();
    }
    else
    {
      v9.nullTerminatedStorage._rawValue = &outlined read-only object #0 of FilePath.extension.setter;
    }
    v16 = v4;
    v17 = v6;
    v18 = v5;
    FilePath.Component.kind.getter();
    if (v10 == 2)
    {
      v11 = specialized BidirectionalCollection<>.lastIndex(of:)(0x2Eu, v6, v5, v4);
      v13 = v12;
      swift_bridgeObjectRelease();
      v14 = v5;
      if ((v13 & 1) != 0)
        goto LABEL_14;
      v14 = v5;
      if (v11 == v6)
        goto LABEL_14;
      v14 = v11;
      if (v5 >= v11)
        goto LABEL_14;
      __break(1u);
    }
    swift_bridgeObjectRelease();
    v14 = v5;
LABEL_14:
    specialized Array.replaceSubrange<A>(_:with:)(v14, v5, (uint64_t)v9.nullTerminatedStorage._rawValue);
  }
  return swift_bridgeObjectRelease();
}

void (*FilePath.extension.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*result)(uint64_t, char);
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[3];

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[7] = v1;
  FilePath.lastComponent.getter(v13);
  v4 = v13[0];
  if (!v13[0])
    goto LABEL_7;
  v6 = v13[1];
  v5 = v13[2];
  result = (void (*)(uint64_t, char))FilePath.Component._extensionRange()();
  if ((v9 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    v10 = 0;
    v12 = 0;
    goto LABEL_8;
  }
  if ((uint64_t)result >= v6 && v5 >= v8)
  {
    *v3 = result;
    v3[1] = v8;
    v3[2] = v4;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Slice<SystemString>);
    Slice.indices.getter();
    v10 = static String._fromUTF8Repairing(_:)();
    v12 = v11;
    swift_bridgeObjectRelease_n();
LABEL_8:
    v3[3] = v10;
    v3[4] = v12;
    return FilePath.extension.modify;
  }
  __break(1u);
  return result;
}

void FilePath.extension.modify(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v4 = *(void **)(*(_QWORD *)a1 + 32);
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    FilePath.extension.setter(v3, v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    FilePath.extension.setter(*(_QWORD *)(*(_QWORD *)a1 + 24), v4);
  }
  free(v2);
}

void FilePath.stem.getter()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  char v3;
  int64_t v4;
  char v5;
  uint64_t v6;
  _QWORD v7[3];

  FilePath.lastComponent.getter(v7);
  v0 = v7[0];
  if (v7[0])
  {
    v1 = v7[1];
    v2 = v7[2];
    swift_bridgeObjectRetain();
    FilePath.Component.kind.getter();
    if (v3 == 2)
    {
      v4 = specialized BidirectionalCollection<>.lastIndex(of:)(0x2Eu, v1, v2, v0);
      if (v4 == v1)
        v6 = v2;
      else
        v6 = v4;
      if ((v5 & 1) != 0)
        v6 = v2;
    }
    else
    {
      v6 = v2;
    }
    if (v6 < v1)
    {
      __break(1u);
    }
    else if (v2 >= v6)
    {
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Slice<SystemString>);
      Slice.indices.getter();
      static String._fromUTF8Repairing(_:)();
      swift_bridgeObjectRelease_n();
      return;
    }
    __break(1u);
  }
}

void FilePath.isLexicallyNormal.getter()
{
  uint64_t *v0;
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4[3];

  v1 = 0;
  v2 = *v0;
  v3 = *(_QWORD *)(*v0 + 16);
  if (v3 == 1)
    goto LABEL_4;
  if (v3)
  {
    v1 = *(unsigned __int8 *)(v2 + 32) == 47;
LABEL_4:
    swift_bridgeObjectRetain_n();
    specialized Collection.drop(while:)(v2, v1, v2, v4);
    specialized Sequence.allSatisfy(_:)(v4[0], v4[1], v4[2]);
    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
}

uint64_t specialized Collection.drop(while:)@<X0>(uint64_t result@<X0>, int64_t a2@<X1>, uint64_t a3@<X2>, int64_t *a4@<X8>)
{
  int64_t v4;
  uint64_t v5;
  int64_t *v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  _BYTE *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  char v15;
  int64_t v16;
  int64_t v17;
  int64_t v19;
  int64_t v21;
  uint64_t v25;

  v4 = a2;
  v5 = result;
  v6 = a4;
  v7 = *(_QWORD *)(result + 16);
  v8 = v7 - 1;
  v9 = a2;
  if (v7 - 1 != a2)
  {
    v9 = a2;
    v10 = (_BYTE *)(result + 32);
    v25 = *(_QWORD *)(a3 + 16);
    v11 = v7 - 2;
    v12 = result + 33;
    v13 = *(_QWORD *)(result + 16);
    while (1)
    {
      v14 = v7 != 1 && v9 == 0;
      v15 = !v14;
      if (v14)
      {
        if (!v7)
          goto LABEL_88;
        if (!v13)
          goto LABEL_89;
        if (*v10 == 47)
        {
          v16 = 1;
LABEL_19:
          if (v16 < v9)
            goto LABEL_79;
          goto LABEL_20;
        }
      }
      else
      {
        if (!v7 || v7 <= v9)
          goto LABEL_87;
        if (v9 < 0)
          goto LABEL_84;
      }
      v16 = v7 - 1;
      if (v9 == v8)
        goto LABEL_19;
      if (v9 >= v8)
        goto LABEL_92;
      if (v9 >= v13)
        goto LABEL_93;
      v16 = v9;
      if (v10[v9] != 47)
      {
        v16 = v7 - 1;
        if (v9 + 1 != v8)
        {
          v19 = v9;
          while (v19 + 1 >= v9 && v19 + 1 < v8)
          {
            if (v13 - 1 == v19)
              goto LABEL_78;
            if (*(_BYTE *)(v12 + v19) == 47)
            {
              v16 = v19 + 1;
              goto LABEL_19;
            }
            if (v11 == ++v19)
            {
              v16 = v7 - 1;
              goto LABEL_19;
            }
          }
          goto LABEL_77;
        }
        goto LABEL_19;
      }
LABEL_20:
      if (v9 == v16)
        goto LABEL_80;
      if (v25 != 1)
      {
        if (!v25)
          goto LABEL_90;
        if (*(_BYTE *)(a3 + 32) == 47)
          goto LABEL_72;
      }
      if (!v13)
        goto LABEL_81;
      if (v9 < 0)
        goto LABEL_82;
      if ((uint64_t)v13 <= v16)
        goto LABEL_83;
      result = specialized Sequence<>.elementsEqual<A>(_:)((uint64_t)&outlined read-only object #0 of FilePath.Component.kind.getter, v9, v16, v5);
      if ((result & 1) != 0
        || (result = specialized Sequence<>.elementsEqual<A>(_:)((uint64_t)&outlined read-only object #1 of FilePath.Component.kind.getter, v9, v16, v5), (result & 1) == 0))
      {
LABEL_72:
        v6 = a4;
        v4 = a2;
        break;
      }
      if ((v15 & 1) != 0)
        goto LABEL_33;
      v13 = *(_QWORD *)(v5 + 16);
      if (!v13)
        goto LABEL_91;
      if (*v10 != 47)
      {
LABEL_33:
        if (v7 <= v9)
          goto LABEL_85;
        if (v9 == v8)
          goto LABEL_67;
        v13 = *(_QWORD *)(v5 + 16);
        if (v9 >= v13)
          goto LABEL_86;
        if (v10[v9] != 47)
        {
          if (v9 + 1 == v8)
          {
LABEL_67:
            v9 = v7 - 1;
            v6 = a4;
            v4 = a2;
            goto LABEL_68;
          }
          v17 = v9;
          while (v17 + 1 >= v9 && v17 + 1 < v8)
          {
            if (v13 - 1 == v17)
              goto LABEL_76;
            if (*(_BYTE *)(v12 + v17) == 47)
            {
              v9 = v17 + 1;
              goto LABEL_63;
            }
            if (v11 == ++v17)
              goto LABEL_67;
          }
          goto LABEL_75;
        }
LABEL_63:
        ++v9;
      }
      else
      {
        v9 = 1;
      }
      if (v9 == v8)
        goto LABEL_67;
    }
  }
  if (v7 <= v9)
  {
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
LABEL_79:
    __break(1u);
LABEL_80:
    __break(1u);
LABEL_81:
    __break(1u);
LABEL_82:
    __break(1u);
LABEL_83:
    __break(1u);
LABEL_84:
    __break(1u);
LABEL_85:
    __break(1u);
LABEL_86:
    __break(1u);
LABEL_87:
    __break(1u);
LABEL_88:
    __break(1u);
LABEL_89:
    __break(1u);
LABEL_90:
    __break(1u);
    __break(1u);
LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
LABEL_68:
  v21 = *(_QWORD *)(v5 + 16);
  result = swift_bridgeObjectRelease();
  if (v21 <= v4)
  {
LABEL_94:
    __break(1u);
    goto LABEL_95;
  }
  if (v9 < v4)
  {
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }
  if (v21 >= (unint64_t)v7)
  {
    v6[2] = v5;
    v6[3] = v4;
    *v6 = v9;
    v6[1] = v8;
    return result;
  }
LABEL_96:
  __break(1u);
  return result;
}

uint64_t specialized Sequence.allSatisfy(_:)(uint64_t result, int64_t a2, uint64_t a3)
{
  int64_t v4;
  int64_t v6;
  _BYTE *v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  int64_t v13;
  int64_t v14;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  int64_t v19;
  int64_t v20;

  if (result == a2)
    return 1;
  v4 = *(_QWORD *)(a3 + 16);
  if (!v4)
    goto LABEL_80;
  v6 = result;
  v7 = (_BYTE *)(a3 + 32);
  v8 = a3 + 33;
  v9 = result;
  while (v9 >= v6 && v9 < a2)
  {
    v10 = *(_QWORD *)(a3 + 16);
    if (v9 || v10 == 1)
      goto LABEL_12;
    if (!v10)
      goto LABEL_78;
    if (*v7 != 47)
    {
LABEL_12:
      if (v10 <= v9 || v10 == 0)
        goto LABEL_70;
      if (v9 < 0)
        goto LABEL_71;
      v11 = v10 - 1;
      v13 = v9;
      if (v9 == v10 - 1)
        goto LABEL_33;
      if (v9 >= (unint64_t)(v10 - 1))
        goto LABEL_74;
      if (v9 >= (unint64_t)v10)
        goto LABEL_75;
      v13 = v9;
      if (v7[v9] == 47)
        goto LABEL_33;
      if (v9 + 1 != v11)
      {
        v14 = v9;
        while (1)
        {
          if (v14 + 1 < v9 || v14 + 1 >= v11)
          {
            __break(1u);
            goto LABEL_65;
          }
          if (*(_BYTE *)(v8 + v14) == 47)
            break;
          if (v10 - 2 == ++v14)
            goto LABEL_32;
        }
        v11 = v14 + 1;
      }
    }
    else
    {
      v11 = 1;
    }
LABEL_32:
    v13 = v11;
    if (v11 < v9)
      goto LABEL_68;
LABEL_33:
    if (v9 == v13)
      goto LABEL_67;
    if (v9 || v10 == 1)
      goto LABEL_40;
    if (!v10)
      goto LABEL_79;
    if (*v7 != 47)
    {
LABEL_40:
      if (v10 <= v9 || !v10)
        goto LABEL_72;
      if (v9 < 0)
        goto LABEL_73;
      v17 = v10 - 1;
      v16 = v9;
      if (v9 != v10 - 1)
      {
        if (v9 >= (unint64_t)(v10 - 1))
          goto LABEL_76;
        if (v9 >= (unint64_t)v10)
          goto LABEL_77;
        v18 = v9;
        if (v7[v9] == 47)
        {
LABEL_57:
          v16 = v18 + 1;
        }
        else
        {
          if (v9 + 1 != v17)
          {
            v19 = v10 - 2;
            v20 = v9;
            while (v20 + 1 >= v9 && v20 + 1 < v17)
            {
              if (*(_BYTE *)(v8 + v20) == 47)
              {
                v18 = v20 + 1;
                goto LABEL_57;
              }
              if (v19 == ++v20)
                goto LABEL_55;
            }
LABEL_65:
            __break(1u);
            break;
          }
LABEL_55:
          v16 = v17;
        }
      }
    }
    else
    {
      v16 = 1;
    }
    if (v9 < 0 || v4 <= v13)
      goto LABEL_69;
    if ((specialized Sequence<>.elementsEqual<A>(_:)((uint64_t)&outlined read-only object #0 of FilePath.Component.kind.getter, v9, v13, a3) & 1) != 0)return 0;
    result = specialized Sequence<>.elementsEqual<A>(_:)((uint64_t)&outlined read-only object #1 of FilePath.Component.kind.getter, v9, v13, a3);
    if ((result & 1) != 0)
      return 0;
    v9 = v16;
    if (v16 == a2)
      return 1;
  }
  __break(1u);
LABEL_67:
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  __break(1u);
LABEL_74:
  __break(1u);
LABEL_75:
  __break(1u);
LABEL_76:
  __break(1u);
LABEL_77:
  __break(1u);
LABEL_78:
  __break(1u);
LABEL_79:
  __break(1u);
LABEL_80:
  __break(1u);
  return result;
}

System::FilePath __swiftcall FilePath.lexicallyNormalized()()
{
  _QWORD *v0;
  _QWORD *v1;
  System::FilePath result;

  *v0 = *v1;
  FilePath._normalizeSpecialDirectories()();
  return result;
}

void FilePath.lexicallyResolving(_:)(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  Swift::Int v8;
  Swift::Int componentEnd;
  char v10;
  uint64_t v11;

  v4 = *v2;
  v11 = *a1;
  v5 = *(_QWORD *)(*a1 + 16);
  if (v5 == 1)
  {
    v6 = 0;
  }
  else
  {
    if (!v5)
    {
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
      __break(1u);
LABEL_21:
      __break(1u);
      goto LABEL_22;
    }
    v6 = *(unsigned __int8 *)(*a1 + 32) == 47;
  }
  specialized Array.replaceSubrange<A>(_:with:)(0, v6);
  FilePath._normalizeSpecialDirectories()();
  v7 = *(_QWORD *)(v11 + 16);
  if (v7 == 1)
  {
    swift_bridgeObjectRelease();
    *a2 = v4;
    return;
  }
  if (!v7)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (*(_BYTE *)(v11 + 32) == 47)
  {
    v8 = 1;
    if (v7 == 2)
    {
LABEL_17:
      specialized FilePath.append<A>(_:)(v11, *(unsigned __int8 *)(v11 + 32) == 47);
      swift_bridgeObjectRelease();
      *a2 = v4;
      return;
    }
  }
  else
  {
    v8 = 0;
  }
  componentEnd = FilePath._parseComponent(startingAt:)(v8).componentEnd;
  if (componentEnd < v8)
    goto LABEL_21;
  if (v8 != componentEnd)
  {
    FilePath.Component.kind.getter();
    if (v10 == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *a2 = 0;
      return;
    }
    if (*(_QWORD *)(v11 + 16))
      goto LABEL_17;
    goto LABEL_20;
  }
LABEL_22:
  __break(1u);
  __break(1u);
}

uint64_t FilePath.appending<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *v3;

  *a3 = *v3;
  specialized FilePath.append<A>(_:)(a1, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
}

Swift::Bool __swiftcall FilePath.removePrefix(_:)(System::FilePath a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  char v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  int64_t v17[2];
  int64_t v18;

  v2 = *(_QWORD *)a1._storage.nullTerminatedStorage._rawValue;
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  if (v4 == 1)
    goto LABEL_5;
  if (!v4)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (*(_BYTE *)(v3 + 32) != 47)
  {
LABEL_5:
    v6 = 0;
    v5 = 0;
  }
  else
  {
    LOBYTE(a1._storage.nullTerminatedStorage._rawValue) = swift_bridgeObjectRetain();
    v5 = 1;
    v6 = v3;
  }
  v7 = *(_QWORD *)(v2 + 16);
  if (v7 == 1)
    goto LABEL_12;
  if (!v7)
  {
LABEL_29:
    __break(1u);
    __break(1u);
    __break(1u);
    goto LABEL_30;
  }
  if (*(_BYTE *)(v2 + 32) == 47)
  {
    LOBYTE(a1._storage.nullTerminatedStorage._rawValue) = swift_bridgeObjectRetain();
    v8 = 1;
    v9 = v2;
    if (!v6)
      goto LABEL_10;
LABEL_13:
    if (v9)
    {
      v10 = specialized Sequence<>.elementsEqual<A>(_:)(0, v8, v9, 0, v5, v6);
      swift_bridgeObjectRelease();
      LOBYTE(a1._storage.nullTerminatedStorage._rawValue) = swift_bridgeObjectRelease();
      if ((v10 & 1) != 0)
        goto LABEL_15;
LABEL_27:
      LOBYTE(a1._storage.nullTerminatedStorage._rawValue) = 0;
      return (Swift::Bool)a1._storage.nullTerminatedStorage._rawValue;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
LABEL_12:
  v9 = 0;
  v8 = 0;
  if (v6)
    goto LABEL_13;
LABEL_10:
  if (v9)
    goto LABEL_18;
LABEL_15:
  if (v4 == 1)
  {
    v11 = 0;
    v12 = 0;
    if (v7 == 1)
      goto LABEL_24;
    goto LABEL_22;
  }
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v11 = *(unsigned __int8 *)(v3 + 32) == 47;
  if (v7 == 1)
  {
    v12 = 0;
    goto LABEL_24;
  }
LABEL_22:
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v12 = *(unsigned __int8 *)(v2 + 32) == 47;
LABEL_24:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized _dropCommonPrefix<A>(_:_:)((uint64_t)&v18, v17, v3, v11, v2, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v13 = v18;
  v14 = v17[0];
  v15 = v17[1];
  swift_bridgeObjectRelease();
  LOBYTE(a1._storage.nullTerminatedStorage._rawValue) = swift_bridgeObjectRelease();
  if (v14 != v15)
    goto LABEL_27;
  if (v13 < 0)
  {
LABEL_32:
    __break(1u);
    return (Swift::Bool)a1._storage.nullTerminatedStorage._rawValue;
  }
  specialized Array.replaceSubrange<A>(_:with:)(0, v13);
  LOBYTE(a1._storage.nullTerminatedStorage._rawValue) = 1;
  return (Swift::Bool)a1._storage.nullTerminatedStorage._rawValue;
}

uint64_t specialized _dropCommonPrefix<A>(_:_:)(uint64_t result, int64_t *a2, uint64_t a3, int64_t a4, uint64_t a5, int64_t a6)
{
  int64_t v6;
  int64_t v7;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  int64_t *v12;
  _QWORD *v13;
  int64_t v14;
  int64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  int64_t v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  char v25;
  int64_t v26;
  char v27;
  int64_t v28;
  int64_t v29;
  int64_t v30;
  char v31;
  int64_t v32;
  int64_t v33;
  int64_t v34;
  int64_t v35;
  int64_t v36;
  BOOL v37;
  int v38;
  int64_t v39;
  int64_t v40;
  int64_t v41;
  int64_t v42;
  int64_t v43;
  int v45;
  _QWORD *v46;
  int64_t v47;
  int64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  int64_t v53;
  int64_t v54;
  int64_t v55;

  v6 = *(_QWORD *)(a3 + 16);
  if (v6 <= a4)
    goto LABEL_206;
  v7 = a6;
  v9 = *(_QWORD *)(a5 + 16);
  if (v9 <= a6)
  {
LABEL_207:
    __break(1u);
    __break(1u);
    __break(1u);
LABEL_208:
    __break(1u);
LABEL_209:
    __break(1u);
LABEL_210:
    __break(1u);
    __break(1u);
LABEL_211:
    __break(1u);
    return result;
  }
  v10 = a4;
  v11 = a3;
  v12 = a2;
  v13 = (_QWORD *)result;
  v55 = v9 - 1;
  v54 = v6 - 1;
  if (v6 - 1 != a4)
  {
    v46 = (_QWORD *)result;
    v14 = a6;
    v16 = (_BYTE *)(a3 + 32);
    v15 = a4;
    v17 = (_BYTE *)(a5 + 32);
    swift_bridgeObjectRetain();
    result = swift_bridgeObjectRetain();
    v18 = v11 + 33;
    v51 = v11;
    v52 = v9;
    v19 = v6;
    v47 = v15;
    v49 = v14;
    v50 = v11 + 33;
    v20 = v6 - 1;
    v53 = v6;
    while (1)
    {
      if (v15 >= v20)
        goto LABEL_169;
      if (v15 || v19 == 1)
        goto LABEL_26;
      if (!v19)
        goto LABEL_208;
      if (*v16 != 47)
      {
LABEL_26:
        if (v19 <= v15 || !v19)
          goto LABEL_175;
        if (v15 < 0)
          goto LABEL_176;
        v21 = v19 - 1;
        v22 = v15;
        if (v15 != v19 - 1)
        {
          v22 = v15;
          while (1)
          {
            if (v22 < v15 || v22 >= v21)
            {
              __break(1u);
              goto LABEL_163;
            }
            if (v16[v22] == 47)
              break;
            if (v21 == ++v22)
            {
              v22 = v19 - 1;
              break;
            }
          }
          if (v22 < v15)
            goto LABEL_180;
        }
        if (v15 == v22)
          goto LABEL_170;
        if (v15 == v20)
        {
          if (v14 == v55)
            goto LABEL_201;
          v23 = 0;
          v24 = 0;
          v11 = 0;
          v25 = 1;
LABEL_46:
          if (v14 >= v55)
            goto LABEL_192;
          if (v14 || v9 == 1)
            goto LABEL_53;
          if (!v9)
            goto LABEL_211;
          if (*v17 != 47)
          {
LABEL_53:
            if (v9 <= v14 || !v9)
              goto LABEL_194;
            if (v14 < 0)
              goto LABEL_195;
            v30 = v9 - 1;
            v29 = v14;
            if (v14 != v30)
            {
              v29 = v14;
              while (v29 >= v14 && v29 < v30)
              {
                if (v17[v29] == 47)
                  goto LABEL_62;
                if (v30 == ++v29)
                {
                  v29 = v30;
LABEL_62:
                  if (v29 < v14)
                    goto LABEL_196;
                  goto LABEL_63;
                }
              }
              goto LABEL_165;
            }
LABEL_63:
            if (v14 == v29)
              goto LABEL_193;
          }
          else
          {
            v29 = 1;
          }
          swift_bridgeObjectRetain();
          if (!v11)
          {
            v11 = v51;
            goto LABEL_158;
          }
          v31 = specialized Sequence<>.elementsEqual<A>(_:)(v14, v29, a5, v24, v23, v11);
          swift_bridgeObjectRelease();
          result = swift_bridgeObjectRelease();
          if ((v31 & 1) == 0)
          {
            v12 = a2;
            v7 = v49;
            v10 = v47;
            v11 = v51;
LABEL_160:
            v13 = v46;
            goto LABEL_161;
          }
          v11 = v51;
          v28 = v53;
          v20 = v54;
          if ((v25 & 1) != 0)
            goto LABEL_201;
          v27 = 0;
          v18 = v50;
          v19 = *(_QWORD *)(v51 + 16);
          if (!v15)
            goto LABEL_68;
          goto LABEL_71;
        }
        if (v15)
          goto LABEL_30;
      }
      if (v19 == 1 || *v16 != 47)
      {
LABEL_30:
        if (v19 <= v15)
          goto LABEL_198;
        if (v15 < 0)
          goto LABEL_199;
        v26 = v19 - 1;
        v23 = v15;
        if (v15 != v26)
        {
          v23 = v15;
          while (v23 >= v15 && v23 < v26)
          {
            if (v16[v23] == 47)
              goto LABEL_39;
            if (v26 == ++v23)
            {
              v23 = v26;
LABEL_39:
              if (v23 < v15)
                goto LABEL_200;
              goto LABEL_40;
            }
          }
LABEL_166:
          __break(1u);
LABEL_167:
          __break(1u);
LABEL_168:
          __break(1u);
LABEL_169:
          __break(1u);
LABEL_170:
          __break(1u);
LABEL_171:
          __break(1u);
LABEL_172:
          __break(1u);
LABEL_173:
          __break(1u);
LABEL_174:
          __break(1u);
LABEL_175:
          __break(1u);
LABEL_176:
          __break(1u);
LABEL_177:
          __break(1u);
LABEL_178:
          __break(1u);
LABEL_179:
          __break(1u);
LABEL_180:
          __break(1u);
LABEL_181:
          __break(1u);
LABEL_182:
          __break(1u);
LABEL_183:
          __break(1u);
LABEL_184:
          __break(1u);
LABEL_185:
          __break(1u);
LABEL_186:
          __break(1u);
LABEL_187:
          __break(1u);
LABEL_188:
          __break(1u);
LABEL_189:
          __break(1u);
LABEL_190:
          __break(1u);
LABEL_191:
          __break(1u);
LABEL_192:
          __break(1u);
LABEL_193:
          __break(1u);
LABEL_194:
          __break(1u);
LABEL_195:
          __break(1u);
LABEL_196:
          __break(1u);
LABEL_197:
          __break(1u);
LABEL_198:
          __break(1u);
LABEL_199:
          __break(1u);
LABEL_200:
          __break(1u);
LABEL_201:
          __break(1u);
LABEL_202:
          __break(1u);
LABEL_203:
          __break(1u);
LABEL_204:
          __break(1u);
LABEL_205:
          __break(1u);
LABEL_206:
          __break(1u);
          goto LABEL_207;
        }
LABEL_40:
        if (v15 == v23)
          goto LABEL_197;
      }
      else
      {
        v23 = 1;
      }
      result = swift_bridgeObjectRetain();
      if (v14 != v55)
      {
        v25 = 0;
        v24 = v15;
        goto LABEL_46;
      }
      if (v11)
      {
        v14 = v55;
LABEL_158:
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        goto LABEL_159;
      }
      v27 = 1;
      v28 = v53;
      v19 = MEMORY[0x10];
      if (!v15)
      {
LABEL_68:
        if (v19 != 1)
        {
          if (!v19)
            goto LABEL_209;
          if (*v16 == 47)
            goto LABEL_84;
        }
      }
LABEL_71:
      if (v19 <= v15 || !v19)
        goto LABEL_182;
      if (v15 < 0)
        goto LABEL_183;
      v32 = v19 - 1;
      v33 = v15;
      if (v15 != v19 - 1)
      {
        v33 = v15;
        while (v33 >= v15 && v33 < v32)
        {
          if (v16[v33] == 47)
            goto LABEL_81;
          if (v32 == ++v33)
          {
            v33 = v19 - 1;
LABEL_81:
            if (v33 < v15)
              goto LABEL_186;
            goto LABEL_82;
          }
        }
LABEL_163:
        __break(1u);
        goto LABEL_164;
      }
LABEL_82:
      if (v15 == v33)
        goto LABEL_171;
      if (v15)
      {
LABEL_88:
        if (v19 <= v15)
          goto LABEL_187;
        if (v15 < 0)
          goto LABEL_188;
        v34 = v19 - 1;
        v35 = v15;
        if (v15 == v19 - 1)
        {
          if (v28 <= v15)
            goto LABEL_172;
        }
        else
        {
          if (v15 >= (unint64_t)(v19 - 1))
            goto LABEL_202;
          if (v15 >= (unint64_t)v19)
            goto LABEL_203;
          v36 = v15;
          if (v16[v15] == 47)
          {
LABEL_96:
            v35 = v36 + 1;
            if (v28 <= v35)
              goto LABEL_172;
          }
          else
          {
            if (v15 + 1 != v34)
            {
              v36 = v15;
              while (1)
              {
                v37 = v36 + 1 >= v15 && v36 + 1 < v34;
                if (!v37)
                  goto LABEL_167;
                v38 = *(unsigned __int8 *)(v18 + v36++);
                if (v38 == 47)
                  goto LABEL_96;
                if (v19 - 2 == v36)
                {
                  v35 = v19 - 1;
                  if (v28 <= v34)
                    goto LABEL_172;
                  goto LABEL_110;
                }
              }
            }
            v35 = v19 - 1;
            if (v28 <= v34)
              goto LABEL_172;
          }
        }
LABEL_110:
        v37 = v35 < v15;
        v15 = v35;
        if (v37)
          goto LABEL_177;
        goto LABEL_111;
      }
LABEL_84:
      if (v19 == 1 || *v16 != 47)
        goto LABEL_88;
      if ((unint64_t)v28 <= 1)
        goto LABEL_172;
      v15 = 1;
LABEL_111:
      if ((v27 & 1) != 0)
        goto LABEL_173;
      if (v14 >= v55)
        goto LABEL_174;
      v9 = *(_QWORD *)(a5 + 16);
      if (v14 || v9 == 1)
        goto LABEL_129;
      if (!v9)
        goto LABEL_210;
      if (*v17 != 47)
      {
LABEL_129:
        if (v9 <= v14 || !v9)
          goto LABEL_184;
        if (v14 < 0)
          goto LABEL_185;
        v39 = v9 - 1;
        v40 = v14;
        if (v14 != v9 - 1)
        {
          v40 = v14;
          while (v40 >= v14 && v40 < v39)
          {
            if (v17[v40] == 47)
              goto LABEL_127;
            if (v39 == ++v40)
            {
              v40 = v9 - 1;
LABEL_127:
              if (v40 < v14)
                goto LABEL_189;
              goto LABEL_128;
            }
          }
LABEL_164:
          __break(1u);
LABEL_165:
          __break(1u);
          goto LABEL_166;
        }
LABEL_128:
        if (v14 == v40)
          goto LABEL_178;
        if (v14)
          goto LABEL_134;
      }
      if (v9 == 1 || *v17 != 47)
      {
LABEL_134:
        if (v9 <= v14)
          goto LABEL_190;
        if (v14 < 0)
          goto LABEL_191;
        v41 = v9 - 1;
        v42 = v14;
        if (v14 != v9 - 1)
        {
          if (v14 >= (unint64_t)(v9 - 1))
            goto LABEL_204;
          if (v14 >= (unint64_t)v9)
            goto LABEL_205;
          v43 = v14;
          if (v17[v14] == 47)
          {
LABEL_140:
            v42 = v43 + 1;
          }
          else
          {
            if (v14 + 1 != v41)
            {
              v43 = v14;
              while (v43 + 1 >= v14 && v43 + 1 < v41)
              {
                v45 = *(unsigned __int8 *)(a5 + 33 + v43++);
                if (v45 == 47)
                  goto LABEL_140;
                if (v9 - 2 == v43)
                  goto LABEL_150;
              }
              goto LABEL_168;
            }
LABEL_150:
            v42 = v9 - 1;
          }
        }
        if ((uint64_t)v52 <= v42)
          goto LABEL_179;
        v37 = v42 < v14;
        v14 = v42;
        if (v37)
          goto LABEL_181;
      }
      else
      {
        if (v52 <= 1)
          goto LABEL_179;
        v14 = 1;
      }
      if (v15 == v20)
      {
        v15 = v20;
LABEL_159:
        v12 = a2;
        v7 = v49;
        v10 = v47;
        goto LABEL_160;
      }
    }
  }
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRetain();
  v14 = v7;
  v15 = v10;
LABEL_161:
  *v13 = v15;
  v13[1] = v54;
  v13[2] = v11;
  v13[3] = v10;
  *v12 = v14;
  v12[1] = v55;
  v12[2] = a5;
  v12[3] = v7;
  return result;
}

unint64_t FilePath.append(_:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  unint64_t v5;
  unint64_t result;

  v2 = *a1;
  v3 = a1[1];
  v4 = (char *)a1[2];
  if ((char *)v3 == v4)
    return swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  result = v5 - 1;
  if (v5 == 1)
  {
LABEL_6:
    specialized RangeReplaceableCollection.append<A>(contentsOf:)(v3, v4, v2);
    return swift_bridgeObjectRelease();
  }
  if (v5 >= 2)
  {
    if (*(_BYTE *)(v5 + *(_QWORD *)v1 + 30) != 47)
      specialized Array.replaceSubrange<A>(_:with:)(result, v5 - 1, 47);
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t FilePath.append<A>(_:)(uint64_t a1, uint64_t a2)
{
  specialized FilePath.append<A>(_:)(a1, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
}

void FilePath.append(_:)(size_t a1, unint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v7;
  const char *v8;
  _QWORD *v9;
  const char *v10;
  _QWORD *v11;
  size_t v12;
  size_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  _QWORD *v20;
  uint64_t v21;

  v4 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v5 = v2;
  v7 = *v5;
  if (*(_QWORD *)(*v5 + 16) == 1)
  {
    swift_bridgeObjectRelease();
    if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
    {
      _StringGuts._slowWithCString<A>(_:)();
      swift_bridgeObjectRelease();
      v9 = v20;
      goto LABEL_20;
    }
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        v8 = (const char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
LABEL_10:
        closure #1 in SystemString.init(_:)(v8, (size_t *)&v20);
        v9 = v20;
        swift_bridgeObjectRelease();
LABEL_20:
        v20 = v9;
        SystemString._normalizeSeparators()();
        *v5 = (uint64_t)v20;
        return;
      }
LABEL_41:
      v8 = (const char *)_StringObject.sharedUTF8.getter();
      goto LABEL_10;
    }
    v20 = (_QWORD *)a1;
    v21 = a2 & 0xFFFFFFFFFFFFFFLL;
    v12 = strlen((const char *)&v20);
    if (!__OFADD__(v12, 1))
    {
      v9 = specialized _copyCollectionToContiguousArray<A>(_:)(&v20, v12 + 1);
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    __break(1u);
    goto LABEL_44;
  }
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    swift_bridgeObjectRelease();
    v11 = v20;
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    v20 = (_QWORD *)a1;
    v21 = a2 & 0xFFFFFFFFFFFFFFLL;
    v13 = strlen((const char *)&v20);
    if (__OFADD__(v13, 1))
    {
LABEL_44:
      __break(1u);
      __break(1u);
      goto LABEL_45;
    }
    v11 = specialized _copyCollectionToContiguousArray<A>(_:)(&v20, v13 + 1);
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((a1 & 0x1000000000000000) != 0)
      v10 = (const char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v10 = (const char *)_StringObject.sharedUTF8.getter();
    closure #1 in SystemString.init(_:)(v10, (size_t *)&v20);
    v11 = v20;
    swift_bridgeObjectRelease();
  }
  v20 = v11;
  SystemString._normalizeSeparators()();
  v14 = (uint64_t)v20;
  v15 = v20[2];
  v16 = (char *)(v15 - 1);
  if (v15 == 1)
    goto LABEL_28;
  if (!v15)
  {
    __break(1u);
    goto LABEL_41;
  }
  if (*((_BYTE *)v20 + 32) != 47)
  {
LABEL_28:
    v17 = 0;
    if (v15 == 1)
    {
LABEL_37:
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    v17 = 1;
    if (v15 == 2)
      goto LABEL_37;
  }
  v18 = *(_QWORD *)(v7 + 16);
  if (v18 == 1)
  {
    v19 = 0;
    goto LABEL_33;
  }
  if (v18)
  {
    v19 = *(_BYTE *)(v18 + v7 + 30) == 47;
LABEL_33:
    if (v18 != 1 && !v19)
      specialized Array.replaceSubrange<A>(_:with:)(v18 - 1, v18 - 1, 47);
    specialized RangeReplaceableCollection.append<A>(contentsOf:)(v17, v16, v14);
    goto LABEL_37;
  }
LABEL_45:
  __break(1u);
}

uint64_t *FilePath.appending(_:)@<X0>(uint64_t *result@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *result;
  v4 = result[1];
  v5 = (char *)result[2];
  v6 = *v2;
  *a2 = *v2;
  if ((char *)v4 == v5)
    return (uint64_t *)swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(v6 + 16);
  if (v7 == 1)
  {
LABEL_6:
    specialized RangeReplaceableCollection.append<A>(contentsOf:)(v4, v5, v3);
    return (uint64_t *)swift_bridgeObjectRelease();
  }
  if (v7)
  {
    if (*(_BYTE *)(v7 + v6 + 30) != 47)
      specialized Array.replaceSubrange<A>(_:with:)(v7 - 1, v7 - 1, 47);
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

void FilePath.appending(_:)(size_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *v3;

  *a3 = *v3;
  FilePath.append(_:)(a1, a2);
}

uint64_t FilePath.push(_:)(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;

  v2 = *(_QWORD *)result;
  v3 = *(_QWORD *)(*(_QWORD *)result + 16);
  v4 = (char *)(v3 - 1);
  if (v3 == 1)
    return swift_bridgeObjectRelease();
  if (v3)
  {
    if (*(_BYTE *)(v2 + 32) == 47)
    {
      result = swift_bridgeObjectRelease();
      *(_QWORD *)v1 = v2;
      return result;
    }
    v5 = *(_QWORD *)(*(_QWORD *)v1 + 16);
    if (v5 == 1)
      goto LABEL_9;
    if (v5)
    {
      if (*(_BYTE *)(v5 + *(_QWORD *)v1 + 30) != 47)
        specialized Array.replaceSubrange<A>(_:with:)(v5 - 1, v5 - 1, 47);
LABEL_9:
      specialized RangeReplaceableCollection.append<A>(contentsOf:)(0, v4, v2);
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    __break(1u);
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t FilePath.pushing(_:)@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;

  v3 = *a1;
  *a2 = *v2;
  v5 = v3;
  return FilePath.push(_:)((uint64_t)&v5);
}

Swift::Void __swiftcall FilePath.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
  uint64_t v1;
  uint64_t v2;

  if (keepingCapacity)
  {
    v2 = *(_QWORD *)(*(_QWORD *)v1 + 16);
    if (v2)
      specialized Array.replaceSubrange<A>(_:with:)(0, v2 - 1);
    else
      __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)v1 = &outlined read-only object #0 of FilePath.removeAll(keepingCapacity:);
  }
}

unint64_t specialized RangeReplaceableCollection.removeAll(keepingCapacity:)(char a1)
{
  unint64_t *v1;
  unint64_t result;
  uint64_t v4;

  result = *v1;
  if ((a1 & 1) != 0)
  {
    v4 = *(_QWORD *)(result + 16);
    if (v4)
      return specialized Array.replaceSubrange<A>(_:with:)(0, v4 - 1);
    else
      __break(1u);
  }
  else
  {
    result = swift_bridgeObjectRelease();
    *v1 = (unint64_t)&outlined read-only object #0 of specialized RangeReplaceableCollection.removeAll(keepingCapacity:);
  }
  return result;
}

uint64_t specialized RangeReplaceableCollection.removeAll(keepingCapacity:)(char a1)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v3;

  if ((a1 & 1) != 0)
  {
    result = v1[1];
    v3 = *(_QWORD *)(*v1 + 16);
    if (v3 <= result)
      __break(1u);
    else
      return specialized FilePath.ComponentView.replaceSubrange<A>(_:with:)(result, v3 - 1);
  }
  else
  {
    result = swift_bridgeObjectRelease();
    *v1 = &outlined read-only object #0 of specialized RangeReplaceableCollection.removeAll(keepingCapacity:);
    v1[1] = 0;
  }
  return result;
}

Swift::Void __swiftcall FilePath.reserveCapacity(_:)(Swift::Int a1)
{
  char **v1;
  Swift::Int v2;
  char *v3;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v5;

  v2 = a1 + 1;
  if (__OFADD__(a1, 1))
  {
    __break(1u);
  }
  else
  {
    v3 = *v1;
    isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
    if (!(_DWORD)isUniquelyReferenced_nonNull_native || v2 > *((_QWORD *)v3 + 3) >> 1)
    {
      if (*((_QWORD *)v3 + 2) <= v2)
        v5 = v2;
      else
        v5 = *((_QWORD *)v3 + 2);
      v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v5, 0, v3);
    }
    *v1 = v3;
  }
}

BOOL FilePath.dirname.getter@<W0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  swift_bridgeObjectRetain();
  return FilePath.removeLastComponent()();
}

void FilePath.basename.getter(_QWORD *a1@<X8>)
{
  FilePath.lastComponent.getter(a1);
}

int64_t specialized Sequence<>.elementsEqual<A>(_:)(int64_t result, int64_t a2, uint64_t a3, int64_t a4, int64_t a5, uint64_t a6)
{
  unint64_t v6;
  unint64_t v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  _BOOL8 v11;
  int v12;
  unint64_t v13;
  unint64_t v14;

  v6 = result;
  v7 = a4;
  while (1)
  {
    if (v7 == a5)
    {
      v8 = 0;
      v9 = a5;
      goto LABEL_10;
    }
    if ((uint64_t)v7 < a4 || (uint64_t)v7 >= a5)
      break;
    if ((v7 & 0x8000000000000000) != 0)
      goto LABEL_23;
    v10 = *(_QWORD *)(a6 + 16);
    if (v10 <= v7)
      goto LABEL_24;
    if (v7 >= v10 - 1)
      goto LABEL_25;
    v8 = *(unsigned __int8 *)(a6 + 32 + v7);
    v9 = v7 + 1;
LABEL_10:
    v11 = v6 == a2;
    if (v6 == a2)
    {
      v12 = 0;
      v13 = a2;
      if (v7 == a5)
        return v11;
    }
    else
    {
      if ((uint64_t)v6 < result || (uint64_t)v6 >= a2)
        goto LABEL_26;
      if ((v6 & 0x8000000000000000) != 0)
        goto LABEL_27;
      v14 = *(_QWORD *)(a3 + 16);
      if (v14 <= v6)
        goto LABEL_28;
      if (v6 >= v14 - 1)
        goto LABEL_29;
      v12 = *(unsigned __int8 *)(a3 + 32 + v6);
      v13 = v6 + 1;
      if (v7 == a5)
        return v11;
    }
    v11 = 0;
    if (v6 != a2)
    {
      v6 = v13;
      v7 = v9;
      if (v8 == v12)
        continue;
    }
    return v11;
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t specialized Sequence<>.elementsEqual<A>(_:)(uint64_t result, int64_t a2, int64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  unint64_t v12;

  v4 = 0;
  v5 = *(_QWORD *)(result + 16);
  v6 = result + 32;
  v7 = a2;
  while (1)
  {
    if (v7 == a3)
    {
      v8 = 0;
      v9 = a3;
      goto LABEL_10;
    }
    if ((uint64_t)v7 < a2 || (uint64_t)v7 >= a3)
      break;
    if ((v7 & 0x8000000000000000) != 0)
      goto LABEL_19;
    v10 = *(_QWORD *)(a4 + 16);
    if (v10 <= v7)
      goto LABEL_20;
    if (v7 >= v10 - 1)
      goto LABEL_21;
    v8 = *(unsigned __int8 *)(a4 + 32 + v7);
    v9 = v7 + 1;
LABEL_10:
    result = v4 == v5;
    if (v4 == v5)
    {
      v11 = 0;
      v12 = v5;
      if (v7 == a3)
        return result;
    }
    else
    {
      if (v4 >= v5)
        goto LABEL_22;
      v11 = *(unsigned __int8 *)(v6 + v4);
      v12 = v4 + 1;
      if (v7 == a3)
        return result;
    }
    result = 0;
    if (v4 != v5)
    {
      v4 = v12;
      v7 = v9;
      if (v8 == v11)
        continue;
    }
    return result;
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  __break(1u);
  return result;
}

{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  unint64_t v13;

  v4 = 0;
  v5 = *(_QWORD *)(result + 16);
  v6 = v5 - 1;
  v7 = result + 32;
  v8 = a2;
  while (1)
  {
    if (v8 == a3)
    {
      v9 = 0;
      v10 = a3;
      goto LABEL_10;
    }
    if ((uint64_t)v8 < a2 || (uint64_t)v8 >= a3)
      break;
    if ((v8 & 0x8000000000000000) != 0)
      goto LABEL_19;
    v11 = *(_QWORD *)(a4 + 16);
    if (v11 <= v8)
      goto LABEL_20;
    if (v8 >= v11 - 1)
      goto LABEL_21;
    v9 = *(unsigned __int8 *)(a4 + 32 + v8);
    v10 = v8 + 1;
LABEL_10:
    result = v4 == v6;
    if (v4 == v6)
    {
      v12 = 0;
      v13 = v5 - 1;
      if (v8 == a3)
        return result;
    }
    else
    {
      if (v4 >= v5)
        goto LABEL_22;
      v12 = *(unsigned __int8 *)(v7 + v4);
      v13 = v4 + 1;
      if (v8 == a3)
        return result;
    }
    result = 0;
    if (v4 != v6)
    {
      v4 = v13;
      v8 = v10;
      if (v9 == v12)
        continue;
    }
    return result;
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  __break(1u);
  return result;
}

int64_t specialized BidirectionalCollection<>.lastIndex(of:)(unsigned __int8 a1, uint64_t a2, int64_t a3, uint64_t a4)
{
  int64_t result;
  unint64_t v6;
  int64_t i;
  uint64_t v8;

  if (a3 == a2)
    return 0;
  result = a3 - 1;
  if (__OFSUB__(a3, 1))
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (result >= a3)
    goto LABEL_28;
  if (result < a2)
    goto LABEL_28;
  if (result < 0)
    goto LABEL_28;
  v6 = *(_QWORD *)(a4 + 16);
  if (result >= (uint64_t)(v6 - 1))
    goto LABEL_28;
  if (result >= v6)
  {
LABEL_29:
    __break(1u);
    return result;
  }
  if (*(unsigned __int8 *)(a4 + result + 32) != a1)
  {
    if (result == a2)
      return 0;
    for (i = a3; ; --i)
    {
      v8 = i - 1;
      if (a3 < (uint64_t)0x8000000000000002 || v8 <= a2 || v8 < 1 || a3 - 2 >= (uint64_t)(v6 - 1))
      {
        __break(1u);
        goto LABEL_27;
      }
      if (*(unsigned __int8 *)(a4 + 30 + i) == a1)
        break;
      if (a2 + 1 == v8)
        return 0;
    }
    return i - 2;
  }
  return result;
}

unint64_t specialized RangeReplaceableCollection.remove(at:)(unint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  if (v2 == 1)
  {
    __break(1u);
    goto LABEL_7;
  }
  if ((result & 0x8000000000000000) != 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v2 <= result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v2 - 1 > result)
  {
    v3 = *(unsigned __int8 *)(*(_QWORD *)v1 + result + 32);
    specialized Array.replaceSubrange<A>(_:with:)(result, result + 1);
    return v3;
  }
LABEL_9:
  __break(1u);
  return result;
}

Swift::Int specialized RangeReplaceableCollection.remove(at:)@<X0>(Swift::Int result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  uint64_t v4;
  Swift::Int v5;
  Swift::Int v6;
  Swift::tuple_componentEnd_Int_nextStart_Int v7;

  v4 = *v2;
  if (v2[1] == *(_QWORD *)(*v2 + 16) - 1)
  {
    __break(1u);
    goto LABEL_7;
  }
  v5 = result;
  result = FilePath._parseComponent(startingAt:)(result).componentEnd;
  if (result < v5)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (result == v5)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v6 = result;
  v7 = FilePath._parseComponent(startingAt:)(v5);
  result = v7.componentEnd;
  if (v7.nextStart >= v5)
  {
    swift_bridgeObjectRetain();
    result = specialized FilePath.ComponentView.replaceSubrange<A>(_:with:)(v5, v7.nextStart);
    *a2 = v4;
    a2[1] = v5;
    a2[2] = v6;
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

unint64_t specialized Array.replaceSubrange<A>(_:with:)(unint64_t result, int64_t a2, char a3)
{
  unint64_t *v3;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  int64_t v12;
  unint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  size_t v16;
  const void *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  v5 = *v3;
  v6 = *(_QWORD *)(*v3 + 16);
  if (v6 < a2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v7 = result;
  v8 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  result = swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)result || v10 > *(_QWORD *)(v5 + 24) >> 1)
  {
    if (v6 <= v10)
      v12 = v6 + v9;
    else
      v12 = v6;
    result = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)result, v12, 1, (char *)v5);
    v5 = result;
  }
  v13 = v5 + 32;
  v14 = (_BYTE *)(v5 + 32 + v7);
  if (!v9)
    goto LABEL_19;
  v15 = *(_QWORD *)(v5 + 16);
  v16 = v15 - a2;
  if (__OFSUB__(v15, a2))
    goto LABEL_25;
  result = (unint64_t)(v14 + 1);
  v17 = (const void *)(v13 + a2);
  if (v14 + 1 != (_BYTE *)(v13 + a2) || result >= (unint64_t)v17 + v16)
    result = (unint64_t)memmove((void *)result, v17, v16);
  v18 = *(_QWORD *)(v5 + 16);
  v19 = __OFADD__(v18, v9);
  v20 = v18 + v9;
  if (!v19)
  {
    *(_QWORD *)(v5 + 16) = v20;
LABEL_19:
    *v14 = a3;
    *v3 = v5;
    return result;
  }
LABEL_26:
  __break(1u);
  return result;
}

_QWORD *specialized String.withCString<A>(_:)(_QWORD *(*a1)(uint64_t *__return_ptr, _QWORD *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  _QWORD *result;
  uint64_t v8;
  _QWORD v9[3];

  if ((a4 & 0x1000000000000000) != 0 || !(a4 & 0x2000000000000000 | a3 & 0x1000000000000000))
  {
    result = (_QWORD *)_StringGuts._slowWithCString<A>(_:)();
    if (!v4)
      return (_QWORD *)v9[2];
  }
  else if ((a4 & 0x2000000000000000) != 0)
  {
    v9[0] = a3;
    v9[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    result = a1(&v8, v9);
    if (!v4)
      return (_QWORD *)v8;
  }
  else
  {
    if ((a3 & 0x1000000000000000) != 0)
      v6 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
    else
      v6 = _StringObject.sharedUTF8.getter();
    result = a1(v9, (_QWORD *)v6);
    if (!v4)
      return (_QWORD *)v9[0];
  }
  return result;
}

BOOL specialized static Array<A>.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  uint64_t v5;
  _BOOL8 result;
  int v7;
  int v8;
  int v9;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  if (*(unsigned __int8 *)(a1 + 32) != *(unsigned __int8 *)(a2 + 32))
    return 0;
  v3 = (unsigned __int8 *)(a1 + 33);
  v4 = (unsigned __int8 *)(a2 + 33);
  v5 = v2 - 1;
  do
  {
    result = v5 == 0;
    if (!v5)
      break;
    v8 = *v3++;
    v7 = v8;
    v9 = *v4++;
    --v5;
  }
  while (v7 == v9);
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SystemChar>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq56System0H6StringV_Tg507_sSRys4f5VGxs5e38_pIgyrzo_ACxsAD_pIegyrzr_lTR6System0C6I5V_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  result = a3();
  if (!v3)
    return v5;
  return result;
}

uint64_t specialized BidirectionalCollection._distance(from:to:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  if (result < a2)
  {
    v4 = (_BYTE *)(a3 + 32);
    v5 = *(_QWORD *)(a3 + 16);
    v6 = v5 - 1;
    v7 = 1;
    while (1)
    {
      if (!result && v5 != 1)
      {
        if (!v5)
          goto LABEL_46;
        if (*v4 == 47)
        {
          if (a2 == 1)
            return v7;
          v8 = 1;
          goto LABEL_5;
        }
      }
      if (v5 <= result || !v5)
        goto LABEL_40;
      if (result < 0)
        goto LABEL_41;
      if (result == v6)
      {
        v8 = result;
      }
      else
      {
        if (result >= (unint64_t)v6)
          goto LABEL_43;
        if (result >= (unint64_t)v5)
          goto LABEL_44;
        if (v4[result] == 47)
          goto LABEL_30;
        v8 = v5 - 1;
        if (result + 1 != v6)
        {
          v10 = result;
          while (1)
          {
            if (v10 + 1 < result || v10 + 1 >= v6)
            {
              __break(1u);
              goto LABEL_39;
            }
            if (*(_BYTE *)(a3 + 33 + v10) == 47)
              break;
            if (v5 - 2 == ++v10)
            {
              v8 = v5 - 1;
              goto LABEL_4;
            }
          }
          result = v10 + 1;
LABEL_30:
          if (result >= v6)
            goto LABEL_45;
          v8 = result + 1;
        }
      }
LABEL_4:
      if (v8 == a2)
        return v7;
LABEL_5:
      result = v8;
      v9 = __OFADD__(v7++, 1);
      if (v9)
      {
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
        return result;
      }
    }
  }
  if (a2 >= result)
    return 0;
  v7 = 0;
  do
  {
    v9 = __OFSUB__(v7--, 1);
    if (v9)
      goto LABEL_42;
    result = FilePath._parseComponent(priorTo:)(result);
  }
  while (result != a2);
  return v7;
}

unint64_t specialized _copyCollectionToContiguousArray<A>(_:)(unint64_t result, size_t a2, size_t a3)
{
  unint64_t v3;
  size_t v6;
  int64_t v7;
  _QWORD *v8;
  size_t v10;
  size_t *v11;
  size_t v12[2];

  v3 = *(_QWORD *)(a3 + 16);
  if (v3 > result && v3 > a2)
  {
    v6 = result;
    v7 = a2 - result;
    if (a2 == result)
      return MEMORY[0x24BEE4AF8];
    if (v7 <= 0)
    {
      v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SystemChar>);
      v8 = (_QWORD *)swift_allocObject();
      v10 = _swift_stdlib_malloc_size(v8);
      v8[2] = v7;
      v8[3] = 2 * v10 - 64;
    }
    v11 = specialized Slice._copyContents(initializing:)(v12, v8 + 4, v7, v6, a2, a3);
    swift_bridgeObjectRetain();
    result = swift_bridgeObjectRelease();
    if (v11 != (size_t *)v7)
      goto LABEL_13;
    return (unint64_t)v8;
  }
  __break(1u);
LABEL_13:
  __break(1u);
  return result;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  size_t v7;
  uint64_t v8;
  uint64_t result;
  _QWORD v10[3];

  v4 = specialized BidirectionalCollection._distance(from:to:)(a2, *(_QWORD *)(a1 + 16) - 1, a1);
  if (!v4)
    return MEMORY[0x24BEE4AF8];
  v5 = v4;
  if (v4 <= 0)
  {
    v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<FilePath.Component>);
    v6 = (_QWORD *)swift_allocObject();
    v7 = _swift_stdlib_malloc_size(v6);
    v6[2] = v5;
    v6[3] = 2 * ((uint64_t)(v7 - 32) / 24);
  }
  v8 = specialized Sequence._copySequenceContents(initializing:)((uint64_t)v10, v6 + 4, v5, a1, a2);
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  if (v8 == v5)
    return (uint64_t)v6;
  __break(1u);
  return result;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  size_t v5;
  _QWORD *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(result + 16);
  if (v1)
  {
    v2 = v1 - 1;
    if (v1 != 1)
    {
      v3 = result;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SystemChar>);
      v4 = swift_allocObject();
      v5 = _swift_stdlib_malloc_size((const void *)v4);
      *(_QWORD *)(v4 + 16) = v2;
      *(_QWORD *)(v4 + 24) = 2 * v5 - 64;
      v6 = specialized Sequence._copySequenceContents(initializing:)(&v7, (_BYTE *)(v4 + 32), v2, v3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v6 == (_QWORD *)v2)
        return v4;
      __break(1u);
    }
    return MEMORY[0x24BEE4AF8];
  }
  __break(1u);
  return result;
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(const void *a1, int64_t a2)
{
  _QWORD *v4;
  size_t v5;

  if (!a2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  if (a2 <= 0)
  {
    v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SystemChar>);
    v4 = (_QWORD *)swift_allocObject();
    v5 = _swift_stdlib_malloc_size(v4);
    v4[2] = a2;
    v4[3] = 2 * v5 - 64;
  }
  memcpy(v4 + 4, a1, a2);
  return v4;
}

size_t *specialized Slice._copyContents(initializing:)(size_t *result, void *__dst, int64_t a3, size_t a4, size_t a5, size_t a6)
{
  size_t v6;
  size_t *v11;
  size_t v12;
  size_t v13;

  v6 = *(_QWORD *)(a6 + 16);
  if (v6 <= a4 || v6 <= a5)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (__OFADD__(a4, a5 - a4))
    goto LABEL_17;
  if ((uint64_t)a5 < (uint64_t)a4)
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v11 = result;
  v12 = 0;
  if (a5 != a4 && a3)
  {
    if ((uint64_t)(a5 - a4) >= a3)
      v12 = a3;
    else
      v12 = a5 - a4;
    result = (size_t *)memcpy(__dst, (const void *)(a6 + a4 + 32), v12);
  }
  v13 = a4 + v12;
  if (__OFADD__(a4, v12))
    goto LABEL_19;
  if (v13 < v6)
  {
    *v11 = a4;
    v11[1] = a5;
    v11[2] = a6;
    v11[3] = v13;
    return (size_t *)v12;
  }
LABEL_20:
  __break(1u);
  return result;
}

_QWORD *specialized closure #1 in _StringGuts.withCString<A>(_:)@<X0>(_QWORD *(*a1)(uint64_t *__return_ptr)@<X2>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v5;

  result = a1(&v5);
  if (!v2)
    *a2 = v5;
  return result;
}

unint64_t specialized Array.replaceSubrange<A>(_:with:)(unint64_t result, int64_t a2)
{
  unint64_t *v2;
  unint64_t v4;
  int64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  size_t v12;
  const void *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v6 = result;
  v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v9 <= *(_QWORD *)(v4 + 24) >> 1)
  {
    if (!v8)
      goto LABEL_20;
  }
  else
  {
    if (v5 <= v9)
      v10 = v5 + v8;
    else
      v10 = v5;
    result = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)result, v10, 1, (char *)v4);
    v4 = result;
    if (!v8)
      goto LABEL_20;
  }
  v11 = *(_QWORD *)(v4 + 16);
  v12 = v11 - a2;
  if (__OFSUB__(v11, a2))
    goto LABEL_26;
  result = v4 + 32 + v6;
  v13 = (const void *)(v4 + 32 + a2);
  if (v6 != a2 || result >= (unint64_t)v13 + v12)
    result = (unint64_t)memmove((void *)result, v13, v12);
  v14 = *(_QWORD *)(v4 + 16);
  v15 = __OFADD__(v14, v8);
  v16 = v14 + v8;
  if (!v15)
  {
    *(_QWORD *)(v4 + 16) = v16;
LABEL_20:
    *v2 = v4;
    return result;
  }
LABEL_27:
  __break(1u);
  return result;
}

unint64_t specialized Array.replaceSubrange<A>(_:with:)(unint64_t result, int64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  unint64_t *v5;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v13;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  size_t v22;
  const void *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  v7 = *v5;
  v8 = *(_QWORD *)(*v5 + 16);
  if (v8 < a2)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v9 = result;
  v10 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v13 = *(_QWORD *)(a5 + 16);
  if (v13 <= a3 || v13 <= a4)
    goto LABEL_32;
  v15 = a4 - a3;
  v16 = a4 - a3 - v10;
  if (__OFSUB__(a4 - a3, v10))
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v17 = v8 + v16;
  if (__OFADD__(v8, v16))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  result = swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)result || v17 > *(_QWORD *)(v7 + 24) >> 1)
  {
    if (v8 <= v17)
      v18 = v8 + v16;
    else
      v18 = v8;
    result = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)result, v18, 1, (char *)v7);
    v7 = result;
  }
  v19 = v7 + 32;
  v20 = (char *)(v7 + 32 + v9);
  if (v16)
  {
    v21 = *(_QWORD *)(v7 + 16);
    v22 = v21 - a2;
    if (__OFSUB__(v21, a2))
    {
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    result = (unint64_t)&v20[v15];
    v23 = (const void *)(v19 + a2);
    if (&v20[v15] != (char *)(v19 + a2) || result >= (unint64_t)v23 + v22)
      result = (unint64_t)memmove((void *)result, v23, v22);
    v24 = *(_QWORD *)(v7 + 16);
    v25 = __OFADD__(v24, v16);
    v26 = v24 + v16;
    if (v25)
      goto LABEL_36;
    *(_QWORD *)(v7 + 16) = v26;
  }
  if (v15 < 1)
  {
LABEL_28:
    *v5 = v7;
    return result;
  }
  if (__OFADD__(a3, v15))
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  if ((uint64_t)a4 >= (uint64_t)a3)
  {
    result = (unint64_t)memcpy(v20, (const void *)(a5 + 32 + a3), a4 - a3);
    goto LABEL_28;
  }
LABEL_38:
  __break(1u);
  __break(1u);
  return result;
}

unint64_t specialized Array.replaceSubrange<A>(_:with:)(unint64_t result, int64_t a2, uint64_t a3)
{
  unint64_t *v3;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  size_t v18;
  const void *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  v5 = *v3;
  v6 = *(_QWORD *)(*v3 + 16);
  if (v6 < a2)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v7 = result;
  v8 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v10 = *(_QWORD *)(a3 + 16);
  if (!v10)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v11 = v10 - 1;
  v12 = v10 - 1 - v8;
  if (__OFSUB__(v10 - 1, v8))
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v13 = v6 + v12;
  if (__OFADD__(v6, v12))
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    return result;
  }
  result = swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)result || v13 > *(_QWORD *)(v5 + 24) >> 1)
  {
    if (v6 <= v13)
      v14 = v6 + v12;
    else
      v14 = v6;
    result = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)result, v14, 1, (char *)v5);
    v5 = result;
  }
  v15 = v5 + 32;
  v16 = (char *)(v5 + 32 + v7);
  if (!v12)
    goto LABEL_20;
  v17 = *(_QWORD *)(v5 + 16);
  v18 = v17 - a2;
  if (__OFSUB__(v17, a2))
    goto LABEL_29;
  result = (unint64_t)&v16[v11];
  v19 = (const void *)(v15 + a2);
  if (&v16[v11] != (char *)(v15 + a2) || result >= (unint64_t)v19 + v18)
    result = (unint64_t)memmove((void *)result, v19, v18);
  v20 = *(_QWORD *)(v5 + 16);
  v21 = __OFADD__(v20, v12);
  v22 = v20 + v12;
  if (v21)
    goto LABEL_30;
  *(_QWORD *)(v5 + 16) = v22;
LABEL_20:
  if (v10 >= 2)
    result = (unint64_t)memcpy(v16, (const void *)(a3 + 32), v10 - 1);
  *v3 = v5;
  return result;
}

uint64_t specialized FilePath.append<A>(_:)(uint64_t result, uint64_t a2)
{
  char **v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  char *v19;
  unint64_t v20;
  char v21;
  char *isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;

  v3 = *(_QWORD *)(result + 16);
  v4 = v3 - 1;
  if (v3 - 1 == a2)
    return result;
  v5 = a2;
  v6 = result;
  v25 = (_BYTE *)(result + 32);
  result = swift_bridgeObjectRetain();
  v7 = v3 - 2;
  v8 = result + 33;
  v23 = result + 33;
  v24 = v3 - 2;
  v26 = v3;
  while (2)
  {
    if (!v4 || v5)
    {
      if (!v3 || v3 <= v5)
        goto LABEL_80;
      if (v5 < 0)
        goto LABEL_76;
    }
    else
    {
      if (!v3)
      {
LABEL_79:
        __break(1u);
LABEL_80:
        __break(1u);
        __break(1u);
        goto LABEL_81;
      }
      if (*v25 == 47)
      {
        v9 = 1;
        goto LABEL_13;
      }
    }
    v9 = v4;
    if (v5 != v4)
    {
      if (v5 >= v4)
      {
LABEL_83:
        __break(1u);
        return result;
      }
      v9 = v5;
      if (v25[v5] == 47)
        goto LABEL_14;
      v9 = v4;
      if (v5 + 1 != v4)
      {
        v12 = v5;
        while (v12 + 1 >= v5 && v12 + 1 < v4)
        {
          if (*(_BYTE *)(v8 + v12) == 47)
          {
            v9 = v12 + 1;
            goto LABEL_13;
          }
          if (v7 == ++v12)
          {
            v9 = v4;
            goto LABEL_13;
          }
        }
LABEL_68:
        __break(1u);
        goto LABEL_69;
      }
    }
LABEL_13:
    if (v9 < v5)
    {
LABEL_70:
      __break(1u);
      goto LABEL_71;
    }
LABEL_14:
    if (v5 == v9)
    {
LABEL_71:
      __break(1u);
LABEL_72:
      __break(1u);
      goto LABEL_73;
    }
    if (v3 == 1 || v5)
    {
      if (v3 <= v5)
      {
LABEL_81:
        __break(1u);
        goto LABEL_82;
      }
      if (v5 < 0)
        goto LABEL_77;
    }
    else if (*v25 == 47)
    {
      v10 = 1;
      goto LABEL_47;
    }
    v10 = v4;
    if (v5 != v4)
    {
      if (v5 >= v4)
      {
LABEL_82:
        __break(1u);
        goto LABEL_83;
      }
      v11 = v5;
      if (v25[v5] == 47)
      {
LABEL_24:
        v10 = v11 + 1;
        goto LABEL_47;
      }
      v10 = v4;
      if (v5 + 1 != v4)
      {
        v11 = v5;
        while (v11 + 1 >= v5 && v11 + 1 < v4)
        {
          v15 = *(unsigned __int8 *)(v8 + v11++);
          if (v15 == 47)
            goto LABEL_24;
          if (v7 == v11)
          {
            v10 = v4;
            goto LABEL_47;
          }
        }
LABEL_69:
        __break(1u);
        goto LABEL_70;
      }
    }
LABEL_47:
    v16 = *((_QWORD *)*v2 + 2);
    v17 = v16 - 1;
    if (v16 == 1)
    {
      result = swift_bridgeObjectRetain();
    }
    else
    {
      if (v16 < 2)
      {
LABEL_78:
        __break(1u);
        goto LABEL_79;
      }
      v18 = (*v2)[v16 + 30];
      result = swift_bridgeObjectRetain();
      if (v18 != 47)
        result = specialized Array.replaceSubrange<A>(_:with:)(v17, v17, 47);
    }
    if (v5 >= v9)
      goto LABEL_72;
    if (v5 < 0)
    {
LABEL_73:
      __break(1u);
      goto LABEL_74;
    }
    if (v5 >= v26)
    {
LABEL_74:
      __break(1u);
      goto LABEL_75;
    }
    if (v9 > v26)
    {
LABEL_75:
      __break(1u);
LABEL_76:
      __break(1u);
LABEL_77:
      __break(1u);
      goto LABEL_78;
    }
    v19 = *v2;
    result = swift_bridgeObjectRetain();
    do
    {
      if (v4 == v5)
      {
        __break(1u);
LABEL_67:
        __break(1u);
        goto LABEL_68;
      }
      v20 = *((_QWORD *)v19 + 2);
      if (!v20)
        goto LABEL_67;
      v21 = *(_BYTE *)(v6 + v5 + 32);
      isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!(_DWORD)isUniquelyReferenced_nonNull_native || v20 >= *((_QWORD *)v19 + 3) >> 1)
        v19 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v20 + 1, 1, v19);
      result = (uint64_t)memmove(&v19[v20 + 32], &v19[v20 + 31], *((_QWORD *)v19 + 2) - (v20 - 1));
      ++*((_QWORD *)v19 + 2);
      v19[v20 + 31] = v21;
      ++v5;
    }
    while (v9 != v5);
    result = swift_bridgeObjectRelease_n();
    *v2 = v19;
    v5 = v10;
    v3 = v26;
    v8 = v23;
    v7 = v24;
    if (v10 != v4)
      continue;
    return swift_bridgeObjectRelease();
  }
}

unint64_t specialized FilePath.append<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  char *v9;
  uint64_t AssociatedConformanceWitness;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t result;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  unint64_t v21;
  char v22;
  char *isUniquelyReferenced_nonNull_native;
  _QWORD v24[2];
  char **v25;
  uint64_t v26;
  unint64_t v27;
  int64_t v28;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v24[0] = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)v24 - v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  dispatch thunk of Sequence.makeIterator()();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  dispatch thunk of IteratorProtocol.next()();
  v11 = v26;
  if (!v26)
    return (*(uint64_t (**)(char *, uint64_t))(v24[0] + 8))(v9, AssociatedTypeWitness);
  v12 = v27;
  v13 = v28;
  v24[1] = AssociatedConformanceWitness;
  while (v12 == v13)
  {
    swift_bridgeObjectRelease();
LABEL_4:
    dispatch thunk of IteratorProtocol.next()();
    v11 = v26;
    v12 = v27;
    v13 = v28;
    if (!v26)
      return (*(uint64_t (**)(char *, uint64_t))(v24[0] + 8))(v9, AssociatedTypeWitness);
  }
  v14 = *((_QWORD *)*v25 + 2);
  result = v14 - 1;
  if (v14 == 1)
  {
LABEL_10:
    if ((uint64_t)v12 < v13)
    {
      if ((v12 & 0x8000000000000000) != 0)
      {
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
      v16 = *(_QWORD *)(v11 + 16);
      if (v12 >= v16)
      {
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      if (v13 - 1 >= v16)
      {
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
      v17 = v9;
      v18 = AssociatedTypeWitness;
      v19 = v16 - 1;
      v20 = *v25;
      result = swift_bridgeObjectRetain();
      while (v19 != v12)
      {
        v21 = *((_QWORD *)v20 + 2);
        if (!v21)
          goto LABEL_25;
        v22 = *(_BYTE *)(v11 + v12 + 32);
        isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
        if (!(_DWORD)isUniquelyReferenced_nonNull_native || v21 >= *((_QWORD *)v20 + 3) >> 1)
          v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v21 + 1, 1, v20);
        result = (unint64_t)memmove(&v20[v21 + 32], &v20[v21 + 31], *((_QWORD *)v20 + 2) - (v21 - 1));
        ++*((_QWORD *)v20 + 2);
        v20[v21 + 31] = v22;
        if (v13 == ++v12)
        {
          swift_bridgeObjectRelease_n();
          *v25 = v20;
          AssociatedTypeWitness = v18;
          v9 = v17;
          goto LABEL_4;
        }
      }
      __break(1u);
LABEL_25:
      __break(1u);
    }
    __break(1u);
    goto LABEL_27;
  }
  if (v14 >= 2)
  {
    if ((*v25)[v14 + 30] != 47)
      result = specialized Array.replaceSubrange<A>(_:with:)(result, v14 - 1, 47);
    goto LABEL_10;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t specialized RangeReplaceableCollection.append<A>(contentsOf:)(uint64_t result, char *a2, uint64_t a3)
{
  char **v3;
  char *v4;
  unint64_t v5;
  char *v6;
  unint64_t v7;
  char *v8;
  unint64_t v9;
  char v10;
  char v11;
  char *isUniquelyReferenced_nonNull_native;

  v4 = &a2[-result];
  if (a2 != (char *)result)
  {
    if ((uint64_t)a2 > result)
    {
      if (result < 0)
      {
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      v5 = *(_QWORD *)(a3 + 16);
      if (v5 <= result)
      {
LABEL_20:
        __break(1u);
        goto LABEL_21;
      }
      if ((unint64_t)(a2 - 1) >= v5)
      {
LABEL_21:
        __break(1u);
        return result;
      }
      v6 = *v3;
      v7 = ~result + v5;
      v8 = (char *)(result + a3 + 32);
      while (v7)
      {
        v9 = *((_QWORD *)v6 + 2);
        if (!v9)
          goto LABEL_17;
        v11 = *v8++;
        v10 = v11;
        isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
        if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 >= *((_QWORD *)v6 + 3) >> 1)
          v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v9 + 1, 1, v6);
        result = (uint64_t)memmove(&v6[v9 + 32], &v6[v9 + 31], *((_QWORD *)v6 + 2) - (v9 - 1));
        ++*((_QWORD *)v6 + 2);
        v6[v9 + 31] = v10;
        --v7;
        if (!--v4)
        {
          *v3 = v6;
          return result;
        }
      }
      __break(1u);
LABEL_17:
      __break(1u);
    }
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

uint64_t *sub_20AE204D8(__int128 *a1)
{
  __int128 v2;

  v2 = *a1;
  swift_bridgeObjectRetain();
  return FilePath.root.setter((uint64_t *)&v2);
}

int64_t sub_20AE20514@<X0>(int64_t *a1@<X8>)
{
  int64_t result;
  int64_t v3;

  result = FilePath.extension.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20AE2054C(uint64_t *a1)
{
  uint64_t v1;
  void *v2;

  v1 = *a1;
  v2 = (void *)a1[1];
  swift_bridgeObjectRetain();
  return FilePath.extension.setter(v1, v2);
}

uint64_t String.withPlatformString<A>(_:)()
{
  return String._withPlatformString<A>(_:)();
}

uint64_t type metadata accessor for _RawBuffer.Storage()
{
  uint64_t result;

  result = type metadata singleton initialization cache for _RawBuffer.Storage;
  if (!type metadata singleton initialization cache for _RawBuffer.Storage)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata completion function for _RawBuffer.Storage()
{
  return swift_initClassMetadata2();
}

uint64_t _RawBuffer.Storage.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t ObjC metadata update function for _RawBuffer.Storage()
{
  return type metadata accessor for _RawBuffer.Storage();
}

_QWORD *initializeBufferWithCopyOfBuffer for _RawBuffer(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for _RawBuffer()
{
  return swift_release();
}

_QWORD *assignWithCopy for _RawBuffer(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *assignWithTake for _RawBuffer(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _RawBuffer(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for _RawBuffer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for _RawBuffer()
{
  return &type metadata for _RawBuffer;
}

int64_t FilePath.Component._extensionRange()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  int64_t v3;
  char v4;
  int64_t v5;
  int64_t result;
  char v7;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  FilePath.Component.kind.getter();
  if (v4 != 2)
    return 0;
  v5 = specialized BidirectionalCollection<>.lastIndex(of:)(0x2Eu, v2, v3, v1);
  result = 0;
  if ((v7 & 1) == 0 && v5 != v2)
  {
    if (v5 < 0 || v5 >= *(_QWORD *)(v1 + 16) - 1)
    {
      __break(1u);
    }
    else if (v3 > v5)
    {
      return v5 + 1;
    }
    __break(1u);
  }
  return result;
}

void FilePath.Component.kind.getter()
{
  uint64_t *v0;
  uint64_t v1;
  int64_t v2;
  int64_t v3;
  int64_t v4;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 16);
  if (!v2)
  {
    __break(1u);
    goto LABEL_8;
  }
  v3 = v0[1];
  if (v3 < 0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v4 = v0[2];
  if (v2 <= v4)
  {
LABEL_9:
    __break(1u);
    return;
  }
  if ((specialized Sequence<>.elementsEqual<A>(_:)((uint64_t)&outlined read-only object #0 of FilePath.Component.kind.getter, v0[1], v0[2], *v0) & 1) == 0)specialized Sequence<>.elementsEqual<A>(_:)((uint64_t)&outlined read-only object #1 of FilePath.Component.kind.getter, v3, v4, v1);
}

BOOL static FilePath.Component.Kind.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

System::SystemString __swiftcall _makeExtension(_:)(Swift::String a1)
{
  unint64_t object;
  uint64_t countAndFlagsBits;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  char *isUniquelyReferenced_nonNull_native;

  object = (unint64_t)a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  specialized Array.replaceSubrange<A>(_:with:)(0, 0, 46);
  if ((object & 0x2000000000000000) != 0)
    v3 = HIBYTE(object) & 0xF;
  else
    v3 = countAndFlagsBits & 0xFFFFFFFFFFFFLL;
  if (!v3)
    return (System::SystemString)&outlined read-only object #0 of _makeExtension(_:);
  v4 = (char *)&outlined read-only object #0 of _makeExtension(_:);
  swift_bridgeObjectRetain();
  v5 = 0;
  while (1)
  {
    if ((object & 0x1000000000000000) != 0)
    {
      v6 = _StringGuts.foreignErrorCorrectedScalar(startingAt:)();
    }
    else
    {
      if ((object & 0x2000000000000000) == 0 && (countAndFlagsBits & 0x1000000000000000) == 0)
        _StringObject.sharedUTF8.getter();
      v6 = _decodeScalar(_:startingAt:)();
    }
    v8 = v6;
    v9 = v7;
    if (v6 > 0x7F)
      break;
    v10 = *((_QWORD *)v4 + 2);
    if (!v10)
      goto LABEL_20;
    isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
    if (!(_DWORD)isUniquelyReferenced_nonNull_native || v10 >= *((_QWORD *)v4 + 3) >> 1)
      v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v10 + 1, 1, v4);
    memmove(&v4[v10 + 32], &v4[v10 + 31], *((_QWORD *)v4 + 2) - (v10 - 1));
    ++*((_QWORD *)v4 + 2);
    v4[v10 + 31] = v8;
    v5 += v9;
    if (v5 >= v3)
      goto LABEL_21;
  }
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  swift_bridgeObjectRelease();
  return (System::SystemString)v4;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance FilePath.Root.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void protocol witness for Hashable.hash(into:) in conformance FilePath.Root.CodingKeys()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance FilePath.Root.CodingKeys()
{
  _BYTE *v0;

  if (*v0)
    return 0x646E45746F6F725FLL;
  else
    return 0x687461705FLL;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance FilePath.Root.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized FilePath.Root.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance FilePath.Root.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance FilePath.Root.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FilePath.Root.CodingKeys()
{
  lazy protocol witness table accessor for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance FilePath.Root.CodingKeys()
{
  lazy protocol witness table accessor for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys();
  return CodingKey.debugDescription.getter();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance FilePath.Root.CodingKeys()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance FilePath.Root.CodingKeys()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance FilePath.Component.CodingKeys()
{
  _BYTE *v0;

  if (*v0)
    return 0x65676E61725FLL;
  else
    return 0x687461705FLL;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance FilePath.Component.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized FilePath.Component.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FilePath.Component.CodingKeys()
{
  lazy protocol witness table accessor for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance FilePath.Component.CodingKeys()
{
  lazy protocol witness table accessor for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys();
  return CodingKey.debugDescription.getter();
}

void FilePath.Component.Kind.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int FilePath.Component.Kind.hashValue.getter(unsigned __int8 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance FilePath.Component.Kind(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SystemString.appendComponents<A>(components:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t AssociatedConformanceWitness;
  uint64_t result;
  void (*v19)(char *, _QWORD);
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  _BYTE *v28;
  char v29;
  char *isUniquelyReferenced_nonNull_native;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  unsigned int (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43[32];

  v4 = v3;
  v41 = a2;
  v42 = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v34 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v8 = (char *)&v31 - v7;
  v9 = type metadata accessor for Optional();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v31 - v10;
  v12 = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](v12);
  swift_getAssociatedConformanceWitness();
  v13 = swift_getAssociatedTypeWitness();
  v32 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v31 - v14;
  v38 = a1;
  dispatch thunk of Collection.indices.getter();
  v16 = v34;
  dispatch thunk of Sequence.makeIterator()();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v39 = v15;
  v40 = v13;
  v37 = AssociatedConformanceWitness;
  dispatch thunk of IteratorProtocol.next()();
  v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
  if (v36(v11, 1, AssociatedTypeWitness) == 1)
  {
LABEL_2:
    (*(void (**)(char *, uint64_t))(v32 + 8))(v39, v40);
    return $defer #1 <A>() in SystemString.appendComponents<A>(components:)(v4);
  }
  else
  {
    v35 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
    v33 = v4;
    v35(v8, v11, AssociatedTypeWitness);
    while (1)
    {
      v19 = (void (*)(char *, _QWORD))dispatch thunk of Collection.subscript.read();
      v22 = *v20;
      v21 = v20[1];
      v23 = v20[2];
      swift_bridgeObjectRetain();
      v19(v43, 0);
      (*(void (**)(char *, uint64_t))(v16 + 8))(v8, AssociatedTypeWitness);
      v24 = v23 - v21;
      if (v23 != v21)
        break;
      swift_bridgeObjectRetain();
LABEL_5:
      swift_bridgeObjectRelease_n();
      specialized Array.replaceSubrange<A>(_:with:)(*(_QWORD *)(*v4 + 16) - 1, *(_QWORD *)(*v4 + 16) - 1, 47);
      dispatch thunk of IteratorProtocol.next()();
      if (v36(v11, 1, AssociatedTypeWitness) == 1)
        goto LABEL_2;
      v35(v8, v11, AssociatedTypeWitness);
    }
    v25 = (char *)(v22 + 32 + v21);
    v26 = *v4;
    v27 = *(_QWORD *)(*v4 + 16);
    result = swift_bridgeObjectRetain();
    while (v27)
    {
      v29 = *v25;
      isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!(_DWORD)isUniquelyReferenced_nonNull_native || v27 >= *(_QWORD *)(v26 + 24) >> 1)
        v26 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v27 + 1, 1, (char *)v26);
      v28 = (_BYTE *)(v26 + 32 + v27 - 1);
      result = (uint64_t)memmove((void *)(v26 + 32 + v27), v28, *(_QWORD *)(v26 + 16) - (v27 - 1));
      v27 = *(_QWORD *)(v26 + 16) + 1;
      *(_QWORD *)(v26 + 16) = v27;
      *v28 = v29;
      ++v25;
      if (!--v24)
      {
        v4 = v33;
        v16 = v34;
        *v33 = v26;
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t $defer #1 <A>() in SystemString.appendComponents<A>(components:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  v1 = *a1;
  if (SystemString._parseRoot()().relativeBegin == *(_QWORD *)(v1 + 16) - 1)
    goto LABEL_7;
  result = specialized BidirectionalCollection.last.getter(v1);
  if ((result & 0x100) == 0)
  {
    if (result != 47)
    {
LABEL_7:
      swift_bridgeObjectRetain();
      SystemString._normalizeSeparators()();
      return swift_bridgeObjectRelease();
    }
    v3 = *(_QWORD *)(v1 + 16);
    if (v3 == 1)
    {
      __break(1u);
    }
    else if (v3)
    {
      specialized RangeReplaceableCollection.remove(at:)(v3 - 2);
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t _StrSlice._withPlatformString<A>(_:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  size_t v8;
  unint64_t v9;
  size_t v10;

  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 40))(a1, a3);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 48))(a1, a3);
  Slice<>.withPlatformString<A>(_:)(v9, v10, v8, a2, a4);
  return swift_bridgeObjectRelease();
}

void specialized _StrSlice.hash(into:)(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v4;
  unint64_t v9;
  unint64_t v10;
  Swift::UInt8 *v11;
  Swift::UInt8 v12;

  v4 = *(_QWORD *)(a2 + 16);
  if (v4 <= a3 || v4 <= a4)
    goto LABEL_14;
  Hasher._combine(_:)(a4 - a3);
  v9 = a4 - a3;
  if (a4 != a3)
  {
    if (a4 <= a3)
    {
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
    if (a4 - 1 >= v4)
    {
LABEL_16:
      __break(1u);
      return;
    }
    v10 = ~a3 + v4;
    v11 = (Swift::UInt8 *)(a3 + a2 + 32);
    while (v10)
    {
      v12 = *v11++;
      Hasher._combine(_:)(v12);
      --v10;
      if (!--v9)
        return;
    }
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
}

void specialized _StrSlice.hash(into:)(int a1, uint64_t a2, Swift::UInt a3)
{
  Swift::UInt v3;
  unint64_t v5;
  Swift::UInt8 *v6;
  unint64_t i;
  Swift::UInt8 v8;

  if ((a3 & 0x8000000000000000) != 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v3 = a3;
  v5 = *(_QWORD *)(a2 + 16);
  if (v5 <= a3)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  Hasher._combine(_:)(a3);
  if (v3)
  {
    if (v3 - 1 >= v5)
    {
LABEL_12:
      __break(1u);
      return;
    }
    v6 = (Swift::UInt8 *)(a2 + 32);
    for (i = v5 - 1; i; --i)
    {
      v8 = *v6++;
      Hasher._combine(_:)(v8);
      if (!--v3)
        return;
    }
    __break(1u);
    goto LABEL_10;
  }
}

void specialized _StrSlice.hash(into:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int64_t v3;
  unint64_t v6;
  Swift::UInt8 *v7;
  Swift::UInt8 v8;

  v3 = *(_QWORD *)(a2 + 16);
  if (v3 <= (uint64_t)a3)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (!v3)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  Hasher._combine(_:)(v3 - 1 - a3);
  if (v3 - 1 != a3)
  {
    if (v3 - 1 <= a3)
    {
LABEL_14:
      __break(1u);
      return;
    }
    v6 = ~a3 + v3;
    v7 = (Swift::UInt8 *)(a3 + a2 + 32);
    while (v6)
    {
      v8 = *v7++;
      Hasher._combine(_:)(v8);
      if (!--v6)
        return;
    }
    __break(1u);
    goto LABEL_11;
  }
}

uint64_t FilePath.Component.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<FilePath.Component.CodingKeys>);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v8 = v1[1];
  v11 = v1[2];
  v12 = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v13 = v9;
  v15 = 0;
  lazy protocol witness table accessor for type FilePath and conformance FilePath();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    v13 = v12;
    v14 = v11;
    v15 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<Int>);
    lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>, MEMORY[0x24BEE1770], MEMORY[0x24BEE1B98]);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

Swift::Int FilePath.Component.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  _BYTE v5[72];

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  Hasher.init(_seed:)();
  specialized _StrSlice.hash(into:)((uint64_t)v5, v1, v2, v3);
  return Hasher._finalize()();
}

uint64_t FilePath.Component.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v12;
  char v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<FilePath.Component.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v13 = 0;
  lazy protocol witness table accessor for type FilePath and conformance FilePath();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v9 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<Int>);
  v13 = 1;
  lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>, MEMORY[0x24BEE1798], MEMORY[0x24BEE1BC8]);
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v10 = v12;
  *(_QWORD *)a2 = v9;
  *(_OWORD *)(a2 + 8) = v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for _StrSlice._storage.getter in conformance FilePath.Component()
{
  return swift_bridgeObjectRetain();
}

uint64_t protocol witness for _StrSlice._range.getter in conformance FilePath.Component()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t FilePath.Component.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  uint64_t result;

  SystemString._normalizeSeparators()();
  v3 = *(_QWORD *)(a1 + 16);
  v4 = v3 - 1;
  if (v3 != 1)
  {
    if (!v3)
    {
      __break(1u);
      goto LABEL_16;
    }
    if (*(_BYTE *)(a1 + 32) == 47)
      goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  v5 = specialized BidirectionalCollection._distance(from:to:)(0, v3 - 1, a1);
  swift_bridgeObjectRelease();
  if (v5 != 1)
  {
LABEL_10:
    result = swift_bridgeObjectRelease();
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    return result;
  }
  if (!v4)
    goto LABEL_19;
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (*(_BYTE *)(a1 + 32) != 47)
  {
    v6 = 0;
LABEL_12:
    result = FilePath._parseComponent(startingAt:)(v6).componentEnd;
    if (result >= v6)
    {
      if (v6 != result)
      {
        *a2 = a1;
        a2[1] = v6;
        a2[2] = result;
        return result;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v4 != 1)
  {
    v6 = 1;
    goto LABEL_12;
  }
LABEL_19:
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance FilePath.Component()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  _BYTE v5[72];

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  Hasher.init(_seed:)();
  specialized _StrSlice.hash(into:)((uint64_t)v5, v1, v2, v3);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance FilePath.Component(uint64_t a1)
{
  uint64_t v1;

  specialized _StrSlice.hash(into:)(a1, *(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16));
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance FilePath.Component()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  _BYTE v5[72];

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  Hasher.init(_seed:)();
  specialized _StrSlice.hash(into:)((uint64_t)v5, v1, v2, v3);
  return Hasher._finalize()();
}

uint64_t protocol witness for Decodable.init(from:) in conformance FilePath.Component@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return FilePath.Component.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance FilePath.Component(_QWORD *a1)
{
  return FilePath.Component.encode(to:)(a1);
}

int64_t protocol witness for static Equatable.== infix(_:_:) in conformance FilePath.Component(uint64_t *a1, uint64_t *a2)
{
  return specialized Sequence<>.elementsEqual<A>(_:)(a2[1], a2[2], *a2, a1[1], a1[2], *a1);
}

uint64_t FilePath.Root.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<FilePath.Root.CodingKeys>);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v10 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v13 = v8;
  v12 = 0;
  lazy protocol witness table accessor for type FilePath and conformance FilePath();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    v11 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void FilePath.Root.hashValue.getter()
{
  uint64_t *v0;
  Swift::UInt v1;
  uint64_t v2;
  Swift::UInt v3;
  Swift::UInt8 *v4;
  Swift::UInt v5;
  Swift::UInt8 v6;

  v2 = *v0;
  v1 = v0[1];
  Hasher.init(_seed:)();
  if ((v1 & 0x8000000000000000) != 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v3 = *(_QWORD *)(v2 + 16);
  if (v3 <= v1)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  Hasher._combine(_:)(v1);
  if (!v1)
  {
LABEL_8:
    Hasher._finalize()();
    return;
  }
  if (v1 - 1 < *(_QWORD *)(v2 + 16))
  {
    v4 = (Swift::UInt8 *)(v2 + 32);
    v5 = v3 - 1;
    while (v5)
    {
      v6 = *v4++;
      Hasher._combine(_:)(v6);
      --v5;
      if (!--v1)
        goto LABEL_8;
    }
    __break(1u);
    goto LABEL_10;
  }
LABEL_12:
  __break(1u);
}

uint64_t FilePath.Root.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[16];
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<FilePath.Root.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v12[15] = 0;
  lazy protocol witness table accessor for type FilePath and conformance FilePath();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v9 = v13;
  v12[14] = 1;
  swift_bridgeObjectRetain();
  v10 = KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  *a2 = v9;
  a2[1] = v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for _StrSlice._range.getter in conformance FilePath.Root()
{
  uint64_t v0;
  uint64_t result;

  if ((*(_QWORD *)(v0 + 8) & 0x8000000000000000) == 0)
    return 0;
  __break(1u);
  return result;
}

uint64_t FilePath.Root.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  SystemString._normalizeSeparators()();
  result = a1;
  v4 = *(_QWORD *)(a1 + 16);
  if (v4 == 1)
  {
LABEL_6:
    result = swift_bridgeObjectRelease();
    *a2 = 0;
    a2[1] = 0;
    return result;
  }
  if (v4)
  {
    if (*(_BYTE *)(a1 + 32) == 47 && v4 == 2)
    {
      *a2 = a1;
      a2[1] = 1;
      return result;
    }
    goto LABEL_6;
  }
  __break(1u);
  __break(1u);
  return result;
}

void protocol witness for Hashable.hash(into:) in conformance FilePath.Root(int a1)
{
  uint64_t v1;

  specialized _StrSlice.hash(into:)(a1, *(_QWORD *)v1, *(_QWORD *)(v1 + 8));
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance FilePath.Root()
{
  uint64_t *v0;
  Swift::UInt v1;
  uint64_t v2;
  unint64_t v3;
  Swift::UInt8 *v4;
  unint64_t v5;
  Swift::UInt8 v6;

  v2 = *v0;
  v1 = v0[1];
  Hasher.init(_seed:)();
  if ((v1 & 0x8000000000000000) != 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v3 = *(_QWORD *)(v2 + 16);
  if (v3 <= v1)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  Hasher._combine(_:)(v1);
  if (!v1)
  {
LABEL_8:
    Hasher._finalize()();
    return;
  }
  if (v1 - 1 < v3)
  {
    v4 = (Swift::UInt8 *)(v2 + 32);
    v5 = v3 - 1;
    while (v5)
    {
      v6 = *v4++;
      Hasher._combine(_:)(v6);
      --v5;
      if (!--v1)
        goto LABEL_8;
    }
    __break(1u);
    goto LABEL_10;
  }
LABEL_12:
  __break(1u);
}

uint64_t protocol witness for Decodable.init(from:) in conformance FilePath.Root@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return FilePath.Root.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance FilePath.Root(_QWORD *a1)
{
  return FilePath.Root.encode(to:)(a1);
}

uint64_t *protocol witness for static Equatable.== infix(_:_:) in conformance FilePath.Root(uint64_t *result, uint64_t *a2)
{
  int64_t v3;
  int64_t v4;

  v3 = result[1];
  v4 = a2[1];
  if (((v4 | v3) & 0x8000000000000000) == 0)
    return (uint64_t *)specialized Sequence<>.elementsEqual<A>(_:)(0, v4, *a2, 0, v3, *result);
  __break(1u);
  return result;
}

uint64_t FilePath._withPlatformString<A>(_:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  return SystemString.withPlatformString<A>(_:)(a1, a2);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.Component.CodingKeys, &unk_24C3D2EA8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.Component.CodingKeys, &unk_24C3D2EA8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.Component.CodingKeys, &unk_24C3D2EA8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.Component.CodingKeys, &unk_24C3D2EA8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component.CodingKeys and conformance FilePath.Component.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FilePath and conformance FilePath()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath and conformance FilePath;
  if (!lazy protocol witness table cache variable for type FilePath and conformance FilePath)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath, &type metadata for FilePath);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath and conformance FilePath);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath and conformance FilePath;
  if (!lazy protocol witness table cache variable for type FilePath and conformance FilePath)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath, &type metadata for FilePath);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath and conformance FilePath);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath and conformance FilePath;
  if (!lazy protocol witness table cache variable for type FilePath and conformance FilePath)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath, &type metadata for FilePath);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath and conformance FilePath);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath and conformance FilePath;
  if (!lazy protocol witness table cache variable for type FilePath and conformance FilePath)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath, &type metadata for FilePath);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath and conformance FilePath);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath and conformance FilePath;
  if (!lazy protocol witness table cache variable for type FilePath and conformance FilePath)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath, &type metadata for FilePath);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath and conformance FilePath);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD32710](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
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

uint64_t lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Range<Int>);
    v8 = a2;
    result = MEMORY[0x20BD3271C](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.Root.CodingKeys, &unk_24C3D2D20);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys)
  {
    result = MEMORY[0x20BD3271C]("%VZA,#", &unk_24C3D2D20);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.Root.CodingKeys, &unk_24C3D2D20);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.Root.CodingKeys, &unk_24C3D2D20);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Root.CodingKeys and conformance FilePath.Root.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FilePath.Component.Kind and conformance FilePath.Component.Kind()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Component.Kind and conformance FilePath.Component.Kind;
  if (!lazy protocol witness table cache variable for type FilePath.Component.Kind and conformance FilePath.Component.Kind)
  {
    result = MEMORY[0x20BD3271C]("!ZZAH&", &type metadata for FilePath.Component.Kind);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component.Kind and conformance FilePath.Component.Kind);
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for FilePath.Component(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type FilePath.Component and conformance FilePath.Component();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type FilePath.Component and conformance FilePath.Component()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component;
  if (!lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.Component, &type metadata for FilePath.Component);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component;
  if (!lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component)
  {
    result = MEMORY[0x20BD3271C]("qYZA<%", &type metadata for FilePath.Component);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component;
  if (!lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.Component, &type metadata for FilePath.Component);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component;
  if (!lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.Component, &type metadata for FilePath.Component);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component;
  if (!lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.Component, &type metadata for FilePath.Component);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component;
  if (!lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.Component, &type metadata for FilePath.Component);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component;
  if (!lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.Component, &type metadata for FilePath.Component);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Component and conformance FilePath.Component);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for FilePath.Component(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for FilePath.Component(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type FilePath.Component and conformance FilePath.Component, (uint64_t (*)(void))lazy protocol witness table accessor for type FilePath.Component and conformance FilePath.Component, (uint64_t (*)(void))lazy protocol witness table accessor for type FilePath.Component and conformance FilePath.Component);
}

unint64_t instantiation function for generic protocol witness table for FilePath.Root(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type FilePath.Root and conformance FilePath.Root();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type FilePath.Root and conformance FilePath.Root()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root;
  if (!lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.Root, &type metadata for FilePath.Root);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root;
  if (!lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root)
  {
    result = MEMORY[0x20BD3271C]("qXZA $", &type metadata for FilePath.Root);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root;
  if (!lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.Root, &type metadata for FilePath.Root);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root;
  if (!lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.Root, &type metadata for FilePath.Root);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root;
  if (!lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.Root, &type metadata for FilePath.Root);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root;
  if (!lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.Root, &type metadata for FilePath.Root);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root;
  if (!lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.Root, &type metadata for FilePath.Root);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.Root and conformance FilePath.Root);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for FilePath.Root(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for FilePath.Component(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type FilePath.Root and conformance FilePath.Root, (uint64_t (*)(void))lazy protocol witness table accessor for type FilePath.Root and conformance FilePath.Root, (uint64_t (*)(void))lazy protocol witness table accessor for type FilePath.Root and conformance FilePath.Root);
}

uint64_t instantiation function for generic protocol witness table for FilePath.Component(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  uint64_t result;

  a1[1] = a4();
  a1[2] = a5();
  result = a6();
  a1[3] = result;
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for FilePath.Root(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for FilePath.Root()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for FilePath.Root(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

_QWORD *assignWithTake for FilePath.Root(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for FilePath.Root(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FilePath.Root(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FilePath.Root()
{
  return &type metadata for FilePath.Root;
}

uint64_t initializeBufferWithCopyOfBuffer for FilePath.Component(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for FilePath.Component(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for FilePath.Component(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for FilePath.Component(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FilePath.Component(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FilePath.Component()
{
  return &type metadata for FilePath.Component;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FilePath.Component.Kind(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FilePath.Component.Kind(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_20AE2280C + 4 * byte_20AE2D921[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_20AE22840 + 4 * asc_20AE2D91C[v4]))();
}

uint64_t sub_20AE22840(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20AE22848(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20AE22850);
  return result;
}

uint64_t sub_20AE2285C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20AE22864);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_20AE22868(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20AE22870(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for FilePath.Component.Kind(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for FilePath.Component.Kind(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FilePath.Component.Kind()
{
  return &type metadata for FilePath.Component.Kind;
}

_BYTE *destructiveInjectEnumTag for FilePath.Root.CodingKeys(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void *type metadata accessor for FilePath.Root.CodingKeys()
{
  return &unk_24C3D2D20;
}

uint64_t getEnumTagSinglePayload for FilePath.Root.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FilePath.Root.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_20AE2299C + 4 * byte_20AE2D92B[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_20AE229D0 + 4 * byte_20AE2D926[v4]))();
}

uint64_t sub_20AE229D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20AE229D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20AE229E0);
  return result;
}

uint64_t sub_20AE229EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20AE229F4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_20AE229F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20AE22A00(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for FilePath.Component.CodingKeys()
{
  return &unk_24C3D2EA8;
}

uint64_t specialized FilePath.Root.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x687461705FLL && a2 == 0xE500000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x646E45746F6F725FLL && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t specialized FilePath.Component.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x687461705FLL && a2 == 0xE500000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65676E61725FLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

void FilePath.components.getter(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 16);
  if (v3 == 1)
  {
    *a1 = v2;
    a1[1] = 0;
  }
  else if (v3)
  {
    v4 = *(unsigned __int8 *)(v2 + 32) == 47;
    *a1 = v2;
    a1[1] = v4;
  }
  else
  {
    __break(1u);
  }
}

unint64_t specialized SystemString.init<A>(_:)(unint64_t a1, size_t a2, size_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2, a3);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(v3 + 16);
  if (!v4 || *(_BYTE *)(v4 + v3 + 31))
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v3 = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4 + 1, 1, (char *)v3);
    v6 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v3 + 24);
    if (v6 >= v5 >> 1)
      v3 = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v5 > 1), v6 + 1, 1, (char *)v3);
    *(_QWORD *)(v3 + 16) = v6 + 1;
    *(_BYTE *)(v3 + v6 + 32) = 0;
  }
  return v3;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance FilePath.ComponentView.CodingKeys()
{
  _BYTE *v0;

  if (*v0)
    return 0x74726174735FLL;
  else
    return 0x687461705FLL;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance FilePath.ComponentView.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized FilePath.ComponentView.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FilePath.ComponentView.CodingKeys()
{
  lazy protocol witness table accessor for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance FilePath.ComponentView.CodingKeys()
{
  lazy protocol witness table accessor for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t key path setter for FilePath.components : FilePath(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  _QWORD *v4;
  _BYTE v6[32];

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  v3 = FilePath.components.modify((uint64_t (*)(uint64_t))v6);
  *v4 = v1;
  v4[1] = v2;
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(_BYTE *, _QWORD))v3)(v6, 0);
}

uint64_t (*FilePath.components.modify(uint64_t (*result)(uint64_t a1)))(uint64_t a1)
{
  size_t *v1;
  size_t *v2;
  size_t v3;
  uint64_t v4;
  _BOOL8 v5;

  v2 = (size_t *)result;
  *((_QWORD *)result + 2) = v1;
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  if (v4 == 1)
    goto LABEL_6;
  if (!v4)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (*(_BYTE *)(v3 + 32) != 47)
  {
LABEL_6:
    v5 = 0;
    result = (uint64_t (*)(uint64_t))&outlined read-only object #0 of FilePath.components.modify;
    goto LABEL_7;
  }
  swift_bridgeObjectRetain();
  result = (uint64_t (*)(uint64_t))specialized SystemString.init<A>(_:)(0, 1uLL, v3);
  if (*(_QWORD *)(v3 + 16))
  {
    v5 = *(unsigned __int8 *)(v3 + 32) == 47;
LABEL_7:
    v2[3] = (size_t)result;
    *v2 = v3;
    v2[1] = v5;
    *v1 = (size_t)&outlined read-only object #1 of FilePath.components.modify;
    return FilePath.components.modify;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t FilePath.components.modify(uint64_t a1)
{
  $defer #1 () in FilePath.components.modify(*(uint64_t **)(a1 + 16), (uint64_t *)a1, *(_QWORD *)(a1 + 24));
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t $defer #1 () in FilePath.components.modify(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  v6 = *a1;
  v7 = *(_QWORD *)(*a1 + 16);
  if (v7 == 1)
    goto LABEL_5;
  if (!v7)
  {
    __break(1u);
    return result;
  }
  if (*(_BYTE *)(v6 + 32) != 47
    || (result = specialized Sequence<>.elementsEqual<A>(_:)(a3, 0, 1, v6), (result & 1) == 0))
  {
LABEL_5:
    v8 = swift_bridgeObjectRetain();
    FilePath.Root.init(_:)(v8, (uint64_t *)&v10);
    v9 = v10;
    return (uint64_t)FilePath.root.setter((uint64_t *)&v9);
  }
  return result;
}

uint64_t *FilePath.components.setter(uint64_t *result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  size_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7[2];

  v2 = *result;
  v3 = result[1];
  v4 = *v1;
  v5 = *(_QWORD *)(*v1 + 16);
  if (v5 == 1)
    goto LABEL_6;
  if (!v5)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (*(_BYTE *)(v4 + 32) != 47)
  {
LABEL_6:
    v6 = (uint64_t *)&outlined read-only object #0 of FilePath.components.setter;
    goto LABEL_7;
  }
  swift_bridgeObjectRetain();
  result = (uint64_t *)specialized SystemString.init<A>(_:)(0, 1uLL, v4);
  if (*(_QWORD *)(v4 + 16))
  {
    v6 = result;
LABEL_7:
    swift_bridgeObjectRelease();
    *v1 = (uint64_t)&outlined read-only object #1 of FilePath.components.setter;
    v7[0] = v2;
    v7[1] = v3;
    $defer #1 () in FilePath.components.modify(v1, v7, (uint64_t)v6);
    swift_bridgeObjectRelease();
    return (uint64_t *)swift_bridgeObjectRelease();
  }
LABEL_9:
  __break(1u);
  return result;
}

BOOL static FilePath.ComponentView.Index.< infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2;
}

void FilePath.ComponentView.Index.hash(into:)()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

BOOL static FilePath.ComponentView.Index.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int FilePath.ComponentView.Index.hashValue.getter()
{
  Swift::UInt *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance FilePath.ComponentView.Index(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2;
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance FilePath.ComponentView.Index(_QWORD *a1, _QWORD *a2)
{
  return *a2 >= *a1;
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance FilePath.ComponentView.Index(_QWORD *a1, _QWORD *a2)
{
  return *a1 >= *a2;
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance FilePath.ComponentView.Index(_QWORD *a1, _QWORD *a2)
{
  return *a2 < *a1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance FilePath.ComponentView.Index()
{
  Swift::UInt *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance FilePath.ComponentView.Index()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance FilePath.ComponentView.Index()
{
  Swift::UInt *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance FilePath.ComponentView.Index(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void FilePath.ComponentView.startIndex.getter(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 8);
}

void FilePath.ComponentView.endIndex.getter(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(*(_QWORD *)v1 + 16) - 1;
}

Swift::Int FilePath.ComponentView.index(after:)@<X0>(Swift::Int *a1@<X0>, Swift::Int *a2@<X8>)
{
  Swift::Int result;
  Swift::tuple_componentEnd_Int_nextStart_Int v4;

  v4 = FilePath._parseComponent(startingAt:)(*a1);
  result = v4.componentEnd;
  *a2 = v4.nextStart;
  return result;
}

uint64_t FilePath.ComponentView.index(before:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = FilePath._parseComponent(priorTo:)(*a1);
  *a2 = result;
  return result;
}

Swift::Int FilePath.ComponentView.subscript.getter@<X0>(Swift::Int *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  Swift::Int v4;
  uint64_t v5;
  Swift::Int result;

  v4 = *a1;
  v5 = *v2;
  result = FilePath._parseComponent(startingAt:)(*a1).componentEnd;
  if (result < v4)
  {
    __break(1u);
  }
  else if (v4 != result)
  {
    *a2 = v5;
    a2[1] = v4;
    a2[2] = result;
    return swift_bridgeObjectRetain();
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for BidirectionalCollection.index(before:) in conformance FilePath.ComponentView@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = FilePath._parseComponent(priorTo:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for BidirectionalCollection.formIndex(before:) in conformance FilePath.ComponentView(uint64_t *a1)
{
  uint64_t result;

  result = FilePath._parseComponent(priorTo:)(*a1);
  *a1 = result;
  return result;
}

uint64_t protocol witness for BidirectionalCollection.index(_:offsetBy:) in conformance FilePath.ComponentView@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t *v3;

  return specialized BidirectionalCollection.index(_:offsetBy:)(*a1, a2, *v3, a3);
}

uint64_t specialized BidirectionalCollection.index(_:offsetBy:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  if (a2 < 0)
  {
    v13 = 0;
    do
    {
      --v13;
      result = FilePath._parseComponent(priorTo:)(result);
    }
    while (v13 > a2);
    goto LABEL_32;
  }
  if (!a2)
  {
LABEL_32:
    *a4 = result;
    return result;
  }
  v6 = 0;
  v7 = (_BYTE *)(a3 + 32);
  v8 = *(_QWORD *)(a3 + 16);
  v9 = v8 - 1;
  v10 = result;
  while (1)
  {
    if (!v10 && v8 != 1)
    {
      if (!v8)
        goto LABEL_37;
      if (*v7 == 47)
      {
        result = 1;
        goto LABEL_5;
      }
    }
    if (v8 <= v10 || !v8)
      break;
    if (v10 < 0)
      goto LABEL_34;
    if (v10 == v9)
    {
      result = v10;
    }
    else
    {
      if (v10 >= v9)
        goto LABEL_35;
      if (v10 >= (unint64_t)v8)
        goto LABEL_36;
      if (v7[v10] == 47)
        goto LABEL_29;
      result = v8 - 1;
      if (v10 + 1 != v9)
      {
        v11 = v10;
        while (1)
        {
          if (v11 + 1 < v10 || v11 + 1 >= (uint64_t)v9)
          {
            __break(1u);
            goto LABEL_33;
          }
          if (*(_BYTE *)(a3 + 33 + v11) == 47)
            break;
          if (v8 - 2 == ++v11)
          {
            result = v8 - 1;
            goto LABEL_5;
          }
        }
        v10 = v11 + 1;
LABEL_29:
        result = v10 + 1;
      }
    }
LABEL_5:
    ++v6;
    v10 = result;
    if (v6 == a2)
      goto LABEL_32;
  }
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t protocol witness for BidirectionalCollection.index(_:offsetBy:limitedBy:) in conformance FilePath.ComponentView@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;

  return specialized BidirectionalCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3, *v4, a4);
}

uint64_t specialized BidirectionalCollection.index(_:offsetBy:limitedBy:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v15;
  uint64_t v16;

  if (a2 < 0)
  {
    v16 = 0;
    while (1)
    {
      v15 = result == a3;
      if (result == a3)
        break;
      --v16;
      result = FilePath._parseComponent(priorTo:)(result);
      if (v16 <= a2)
        goto LABEL_42;
    }
    result = 0;
LABEL_42:
    *(_QWORD *)a5 = result;
    *(_BYTE *)(a5 + 8) = v15;
    return result;
  }
  if (!a2)
  {
    v15 = 0;
    goto LABEL_42;
  }
  if (result == a3)
  {
LABEL_34:
    result = 0;
    v15 = 1;
    goto LABEL_42;
  }
  v8 = (_BYTE *)(a4 + 32);
  v9 = *(_QWORD *)(a4 + 16);
  v10 = v9 - 1;
  v11 = 1;
  while (!result && v9 != 1)
  {
    if (!v9)
      goto LABEL_49;
    if (*v8 != 47)
      break;
    if (v11 >= a2)
    {
      v15 = 0;
      result = 1;
      goto LABEL_42;
    }
    v12 = 1;
LABEL_33:
    ++v11;
    result = v12;
    if (v12 == a3)
      goto LABEL_34;
  }
  if (v9 > result && v9)
  {
    if (result < 0)
      goto LABEL_45;
    if (result == v10)
    {
      v12 = result;
      goto LABEL_32;
    }
    if (result >= (unint64_t)v10)
      goto LABEL_46;
    if (result >= (unint64_t)v9)
      goto LABEL_47;
    if (v8[result] != 47)
    {
      v12 = v9 - 1;
      if (result + 1 == v10)
      {
LABEL_32:
        if (v11 >= a2)
        {
          v15 = 0;
          result = v12;
          goto LABEL_42;
        }
        goto LABEL_33;
      }
      v13 = result;
      while (1)
      {
        if (v13 + 1 < result || v13 + 1 >= v10)
        {
          __break(1u);
          goto LABEL_44;
        }
        if (*(_BYTE *)(a4 + 33 + v13) == 47)
          break;
        if (v9 - 2 == ++v13)
        {
          v12 = v9 - 1;
          goto LABEL_32;
        }
      }
      result = v13 + 1;
    }
    if (result >= v10)
      goto LABEL_48;
    v12 = result + 1;
    goto LABEL_32;
  }
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
  return result;
}

uint64_t protocol witness for BidirectionalCollection.distance(from:to:) in conformance FilePath.ComponentView(uint64_t *a1, uint64_t *a2)
{
  uint64_t *v2;

  return specialized BidirectionalCollection._distance(from:to:)(*a1, *a2, *v2);
}

void protocol witness for Collection.startIndex.getter in conformance FilePath.ComponentView(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 8);
}

void protocol witness for Collection.endIndex.getter in conformance FilePath.ComponentView(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(*(_QWORD *)v1 + 16) - 1;
}

uint64_t (*protocol witness for Collection.subscript.read in conformance FilePath.ComponentView(_QWORD *a1, Swift::Int *a2))()
{
  uint64_t *v2;
  Swift::Int v4;
  uint64_t v5;
  uint64_t (*result)();

  v4 = *a2;
  v5 = *v2;
  result = (uint64_t (*)())FilePath._parseComponent(startingAt:)(*a2).componentEnd;
  if ((uint64_t)result < v4)
  {
    __break(1u);
  }
  else if ((uint64_t (*)())v4 != result)
  {
    *a1 = v5;
    a1[1] = v4;
    a1[2] = result;
    swift_bridgeObjectRetain();
    return destroy for FilePath.Root;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.subscript.getter in conformance FilePath.ComponentView@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = *v2;
  v5 = v2[1];
  v6 = *(_QWORD *)(*v2 + 16);
  if (v6 <= v5)
  {
    __break(1u);
    goto LABEL_6;
  }
  v7 = *a1;
  if (*a1 < v5)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v8 = a1[1];
  if (v6 > v8)
  {
    a2[2] = result;
    a2[3] = v5;
    *a2 = v7;
    a2[1] = v8;
    return swift_bridgeObjectRetain();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.indices.getter in conformance FilePath.ComponentView@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *v1;
  v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  v4 = *(_QWORD *)(v2 + 16) - 1;
  a1[2] = v3;
  a1[3] = v4;
  return swift_bridgeObjectRetain();
}

BOOL protocol witness for Collection.isEmpty.getter in conformance FilePath.ComponentView()
{
  _QWORD *v0;

  return v0[1] == *(_QWORD *)(*v0 + 16) - 1;
}

void protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance FilePath.ComponentView(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance FilePath.ComponentView(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  BOOL v5;

  v2 = *result;
  v3 = a2[1];
  if (*result >= *a2)
  {
    v5 = __OFSUB__(v2, v3);
    v4 = v2 - v3 < 0;
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  if (v4 == v5)
    __break(1u);
  return result;
}

_QWORD *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance FilePath.ComponentView(_QWORD *result, _QWORD *a2)
{
  if (*result < *a2 || a2[1] < *result)
    __break(1u);
  return result;
}

{
  if (*result < *a2 || a2[1] < result[1])
    __break(1u);
  return result;
}

Swift::Int protocol witness for Collection.index(after:) in conformance FilePath.ComponentView@<X0>(Swift::Int *a1@<X0>, Swift::Int *a2@<X8>)
{
  Swift::Int result;
  Swift::tuple_componentEnd_Int_nextStart_Int v4;

  v4 = FilePath._parseComponent(startingAt:)(*a1);
  result = v4.componentEnd;
  *a2 = v4.nextStart;
  return result;
}

Swift::Int protocol witness for Collection.formIndex(after:) in conformance FilePath.ComponentView(Swift::Int *a1)
{
  Swift::Int result;
  Swift::tuple_componentEnd_Int_nextStart_Int v3;

  v3 = FilePath._parseComponent(startingAt:)(*a1);
  result = v3.componentEnd;
  *a1 = v3.nextStart;
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance FilePath.ComponentView(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v2;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance FilePath.ComponentView()
{
  uint64_t *v0;

  return specialized BidirectionalCollection._distance(from:to:)(v0[1], *(_QWORD *)(*v0 + 16) - 1, *v0);
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance FilePath.ComponentView()
{
  return 2;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance FilePath.ComponentView()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = specialized _copyCollectionToContiguousArray<A>(_:)(*v0, v0[1]);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance FilePath.ComponentView(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t *v3;

  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3, v3[1]);
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance FilePath.ComponentView()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

void FilePath.ComponentView.init()(_QWORD *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of FilePath.ComponentView.init();
  a1[1] = 0;
}

int64_t specialized FilePath.ComponentView.replaceSubrange<A>(_:with:)(int64_t result, int64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  size_t relativeBegin;
  int64_t v5;
  uint64_t v7;
  Swift::tuple_rootEnd_Int_relativeBegin_Int v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(_QWORD *)(*v2 + 16) - 1;
  if (v2[1] != v3)
  {
    if (a2 < result)
    {
      __break(1u);
    }
    else
    {
      result = specialized Array.replaceSubrange<A>(_:with:)(result, a2);
      if (v3 != a2)
        return result;
      v7 = *v2;
      v8 = SystemString._parseRoot()();
      result = v8.rootEnd;
      if (v8.relativeBegin == *(_QWORD *)(v7 + 16) - 1)
        return result;
      result = specialized BidirectionalCollection.last.getter(v7);
      if ((result & 0x100) != 0)
      {
LABEL_18:
        __break(1u);
        return result;
      }
      if (result != 47)
        return result;
      v9 = *(_QWORD *)(v7 + 16);
      if (v9 != 1)
      {
        if (v9)
          return specialized RangeReplaceableCollection.remove(at:)(v9 - 2);
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if ((unint64_t)SystemString._parseRoot()().relativeBegin)
  {
    relativeBegin = SystemString._parseRoot()().relativeBegin;
    v5 = swift_bridgeObjectRetain();
  }
  else
  {
    v5 = 0;
    relativeBegin = 0;
  }
  specialized FilePath.init<A>(root:_:)(v5, relativeBegin, &v10);
  result = swift_bridgeObjectRelease();
  *v2 = v10;
  return result;
}

int64_t specialized FilePath.ComponentView.replaceSubrange<A>(_:with:)(int64_t result, int64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;
  size_t v10;
  uint64_t v11;
  size_t relativeBegin;
  size_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  Swift::tuple_rootEnd_Int_relativeBegin_Int v20;
  unint64_t v21;
  char *v22;
  unint64_t v23;
  char *v24;
  char v25;
  char *isUniquelyReferenced_nonNull_native;
  char *v28;

  v6 = v5;
  v10 = *v5;
  v11 = *(_QWORD *)(v10 + 16) - 1;
  if (v6[1] == v11)
  {
    if ((unint64_t)SystemString._parseRoot()().relativeBegin)
    {
      relativeBegin = SystemString._parseRoot()().relativeBegin;
      swift_bridgeObjectRetain();
      v13 = v10;
    }
    else
    {
      v13 = 0;
      relativeBegin = 0;
    }
    swift_bridgeObjectRetain();
    specialized FilePath.init<A>(root:_:)(v13, relativeBegin, a3, a4, a5, &v28);
    result = swift_bridgeObjectRelease();
    *v6 = v28;
    return result;
  }
  v14 = result;
  if (a2 < result)
    goto LABEL_33;
  v15 = (char *)&outlined read-only object #0 of specialized FilePath.ComponentView.replaceSubrange<A>(_:with:);
  v28 = (char *)&outlined read-only object #0 of specialized FilePath.ComponentView.replaceSubrange<A>(_:with:);
  if (v11 == result)
  {
    specialized Array.replaceSubrange<A>(_:with:)(0, 0, 47);
    v15 = v28;
  }
  v16 = a5 - a4;
  if (v16)
  {
    v22 = (char *)(a3 + 32 + a4);
    v23 = *((_QWORD *)v15 + 2);
    result = swift_bridgeObjectRetain();
    while (v23)
    {
      v25 = *v22;
      isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!(_DWORD)isUniquelyReferenced_nonNull_native || v23 >= *((_QWORD *)v15 + 3) >> 1)
        v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v23 + 1, 1, v15);
      v24 = &v15[v23 + 31];
      result = (int64_t)memmove(&v15[v23 + 32], v24, *((_QWORD *)v15 + 2) - (v23 - 1));
      v23 = *((_QWORD *)v15 + 2) + 1;
      *((_QWORD *)v15 + 2) = v23;
      *v24 = v25;
      ++v22;
      if (!--v16)
        goto LABEL_9;
    }
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  swift_bridgeObjectRetain();
LABEL_9:
  result = swift_bridgeObjectRelease();
  v17 = *((_QWORD *)v15 + 2);
  if (!v17)
    goto LABEL_34;
  v18 = v17 - 1;
  v19 = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)v19 || v17 >= *((_QWORD *)v15 + 3) >> 1)
    v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v19, v17 + 1, 1, v15);
  memmove(&v15[v17 + 32], &v15[v18 + 32], *((_QWORD *)v15 + 2) - v18);
  ++*((_QWORD *)v15 + 2);
  v15[v18 + 32] = 47;
  v28 = v15;
  v20 = SystemString._parseRoot()();
  v21 = *((_QWORD *)v15 + 2);
  if (v20.relativeBegin == v21 - 1)
    goto LABEL_19;
  result = specialized BidirectionalCollection.last.getter((uint64_t)v15);
  if ((result & 0x100) != 0)
  {
LABEL_37:
    __break(1u);
    return result;
  }
  if (result == 47)
  {
    if (v21 != 1)
    {
      result = v21 - 2;
      if (v21 >= 2)
      {
        specialized RangeReplaceableCollection.remove(at:)(result);
        v15 = v28;
        goto LABEL_19;
      }
      goto LABEL_36;
    }
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
LABEL_19:
  swift_bridgeObjectRetain();
  SystemString._normalizeSeparators()();
  swift_bridgeObjectRelease();
  if (v11 != v14)
  {
    specialized Array.replaceSubrange<A>(_:with:)(*((_QWORD *)v15 + 2) - 1, *((_QWORD *)v15 + 2) - 1, 47);
    v15 = v28;
  }
  specialized Array.replaceSubrange<A>(_:with:)(v14, a2, (uint64_t)v15);
  return swift_bridgeObjectRelease();
}

uint64_t FilePath.ComponentView.replaceSubrange<A>(_:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  size_t v13;
  Swift::Int relativeBegin;
  size_t v15;
  int64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  Swift::tuple_rootEnd_Int_relativeBegin_Int v20;
  uint64_t v21;
  size_t v23[2];
  uint64_t v24;

  v5 = v4;
  v9 = *(_QWORD *)(a3 - 8);
  result = MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)&v23[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *v5;
  if (v5[1] == *(_QWORD *)(*v5 + 16) - 1)
  {
    if ((unint64_t)SystemString._parseRoot()().relativeBegin)
    {
      relativeBegin = SystemString._parseRoot()().relativeBegin;
      swift_bridgeObjectRetain();
      v15 = v13;
    }
    else
    {
      v15 = 0;
      relativeBegin = 0;
    }
    v23[0] = v15;
    v23[1] = relativeBegin;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a2, a3);
    FilePath.init<A>(root:_:)(v23, (uint64_t)v12, a3, a4, &v24);
    result = swift_bridgeObjectRelease();
    *v5 = v24;
    return result;
  }
  v17 = *(_QWORD *)result;
  v16 = *(_QWORD *)(result + 8);
  if (v16 < *(_QWORD *)result)
  {
    __break(1u);
    goto LABEL_21;
  }
  if ((dispatch thunk of Collection.isEmpty.getter() & 1) != 0)
  {
    v18 = *(_QWORD *)(v13 + 16) - 1;
    result = specialized Array.replaceSubrange<A>(_:with:)(v17, v16);
    if (v16 != v18)
      return result;
    v19 = *v5;
    v20 = SystemString._parseRoot()();
    result = v20.rootEnd;
    if (v20.relativeBegin == *(_QWORD *)(v19 + 16) - 1)
      return result;
    result = specialized BidirectionalCollection.last.getter(v19);
    if ((result & 0x100) != 0)
    {
LABEL_23:
      __break(1u);
      return result;
    }
    if (result != 47)
      return result;
    v21 = *(_QWORD *)(v19 + 16);
    if (v21 != 1)
    {
      if (v21)
        return specialized RangeReplaceableCollection.remove(at:)(v21 - 2);
      goto LABEL_22;
    }
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v23[0] = (size_t)&outlined read-only object #0 of FilePath.ComponentView.replaceSubrange<A>(_:with:);
  if (v17 == *(_QWORD *)(v13 + 16) - 1)
  {
    specialized Array.replaceSubrange<A>(_:with:)(0, 0, 47);
    SystemString.appendComponents<A>(components:)(a2, a3, a4);
  }
  else
  {
    SystemString.appendComponents<A>(components:)(a2, a3, a4);
    specialized Array.replaceSubrange<A>(_:with:)(*(_QWORD *)(v23[0] + 16) - 1, *(_QWORD *)(v23[0] + 16) - 1, 47);
  }
  specialized Array.replaceSubrange<A>(_:with:)(v17, v16, v23[0]);
  return swift_bridgeObjectRelease();
}

int64_t specialized FilePath.init<A>(root:_:)@<X0>(int64_t result@<X0>, size_t a2@<X1>, uint64_t *a3@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  char v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int v15;
  unint64_t v16;
  char v17;
  Swift::tuple_rootEnd_Int_relativeBegin_Int v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;

  if (result)
  {
    if ((a2 & 0x8000000000000000) != 0)
    {
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
      goto LABEL_53;
    }
    v4 = (_QWORD *)specialized SystemString.init<A>(_:)(0, a2, result);
  }
  else
  {
    v4 = &outlined read-only object #0 of specialized FilePath.init<A>(root:_:);
  }
  v21 = v4;
  result = specialized SystemString.appendComponents<A>(components:)();
  v5 = (uint64_t)v21;
  v20 = (uint64_t)v21;
  v6 = v21[2];
  if (v6 == 1)
  {
LABEL_43:
    *a3 = v5;
    return result;
  }
  if (!v6)
    goto LABEL_55;
  v7 = 0;
  v8 = 0;
  while (1)
  {
    if (v6 <= v7)
    {
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
      goto LABEL_50;
    }
    v9 = *(unsigned __int8 *)(v5 + 32 + v7);
    if (v8 != v7)
    {
      if (v6 <= v8)
        goto LABEL_46;
      v10 = *(_BYTE *)(v5 + 32 + v8);
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (int64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v5);
        v5 = result;
      }
      v11 = *(_QWORD *)(v5 + 16);
      if (v8 >= v11)
        goto LABEL_47;
      *(_BYTE *)(v5 + 32 + v8) = v9;
      if (v11 <= v7)
        goto LABEL_48;
      *(_BYTE *)(v5 + 32 + v7) = v10;
      v20 = v5;
      v6 = *(_QWORD *)(v5 + 16);
    }
    v12 = v6 - 1;
    if ((uint64_t)v7 >= (uint64_t)(v6 - 1) || (uint64_t)v8 >= v12)
      goto LABEL_45;
    ++v8;
    v13 = v7 + 1;
    if (v9 == 47 && (uint64_t)v13 < v12)
    {
      if (v13 >= v6)
        goto LABEL_49;
      if (*(_BYTE *)(v5 + v13 + 32) == 47)
        break;
    }
LABEL_8:
    v7 = v13;
    if ((uint64_t)v13 >= v12)
      goto LABEL_30;
  }
  while (v6 - 3 != v7)
  {
    v15 = *(unsigned __int8 *)(v5 + 34 + v7++);
    if (v15 != 47)
    {
      v13 = v7 + 1;
      goto LABEL_8;
    }
  }
  v13 = v6 - 1;
LABEL_30:
  if (v8 >= v6 || v13 >= v6)
    goto LABEL_55;
  v16 = v13 - v8;
  if (v16)
  {
    if ((v16 & 0x8000000000000000) != 0)
      goto LABEL_51;
    result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(v6 - 1, -(uint64_t)v16, 0, v5);
    if ((v17 & 1) != 0)
      goto LABEL_56;
    if ((uint64_t)v6 <= result)
      goto LABEL_52;
    specialized Array.replaceSubrange<A>(_:with:)(result, v6 - 1);
    v5 = v20;
  }
  v18 = SystemString._parseRoot()();
  result = v18.rootEnd;
  v19 = *(_QWORD *)(v5 + 16);
  if (v18.relativeBegin == v19 - 1)
    goto LABEL_43;
  result = specialized BidirectionalCollection.last.getter(v5);
  if ((result & 0x100) != 0)
    goto LABEL_57;
  if (result != 47)
    goto LABEL_43;
  if (v19 != 1)
  {
    result = v19 - 2;
    if (v19 < 2)
      goto LABEL_54;
    result = specialized RangeReplaceableCollection.remove(at:)(result);
    v5 = v20;
    goto LABEL_43;
  }
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
  return result;
}

void specialized FilePath.init<A>(root:_:)(size_t a1@<X0>, size_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char **a6@<X8>)
{
  char *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  Swift::tuple_rootEnd_Int_relativeBegin_Int v15;
  unint64_t v16;
  __int16 v17;
  char *v18;
  unint64_t v19;
  char *v20;
  char v21;
  char *isUniquelyReferenced_nonNull_native;

  if (!a1)
  {
    v10 = (char *)&outlined read-only object #0 of specialized FilePath.init<A>(root:_:);
    v11 = a5 - a4;
    if (a5 == a4)
      goto LABEL_4;
LABEL_17:
    v18 = (char *)(a3 + 32 + a4);
    v19 = *((_QWORD *)v10 + 2);
    swift_bridgeObjectRetain();
    while (v19)
    {
      v21 = *v18;
      isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!(_DWORD)isUniquelyReferenced_nonNull_native || v19 >= *((_QWORD *)v10 + 3) >> 1)
        v10 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v19 + 1, 1, v10);
      v20 = &v10[v19 + 31];
      memmove(&v10[v19 + 32], v20, *((_QWORD *)v10 + 2) - (v19 - 1));
      v19 = *((_QWORD *)v10 + 2) + 1;
      *((_QWORD *)v10 + 2) = v19;
      *v20 = v21;
      ++v18;
      if (!--v11)
        goto LABEL_5;
    }
    __break(1u);
    goto LABEL_25;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v10 = (char *)specialized SystemString.init<A>(_:)(0, a2, a1);
  v11 = a5 - a4;
  if (v11)
    goto LABEL_17;
LABEL_4:
  swift_bridgeObjectRetain();
LABEL_5:
  swift_bridgeObjectRelease();
  v12 = *((_QWORD *)v10 + 2);
  if (!v12)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v13 = v12 - 1;
  v14 = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)v14 || v12 >= *((_QWORD *)v10 + 3) >> 1)
    v10 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v14, v12 + 1, 1, v10);
  memmove(&v10[v12 + 32], &v10[v13 + 32], *((_QWORD *)v10 + 2) - v13);
  ++*((_QWORD *)v10 + 2);
  v10[v13 + 32] = 47;
  v15 = SystemString._parseRoot()();
  v16 = *((_QWORD *)v10 + 2);
  if (v15.relativeBegin == v16 - 1)
    goto LABEL_15;
  v17 = specialized BidirectionalCollection.last.getter((uint64_t)v10);
  if ((v17 & 0x100) == 0)
  {
    if (v17 != 47)
    {
LABEL_15:
      swift_bridgeObjectRetain();
      SystemString._normalizeSeparators()();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      SystemString._normalizeSeparators()();
      *a6 = v10;
      return;
    }
    if (v16 != 1)
    {
      if (v16 >= 2)
      {
        specialized RangeReplaceableCollection.remove(at:)(v16 - 2);
        goto LABEL_15;
      }
      goto LABEL_28;
    }
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
  }
  __break(1u);
}

size_t specialized FilePath.init<A>(root:_:)@<X0>(size_t result@<X0>, size_t a2@<X1>, uint64_t a3@<X2>, char **a4@<X8>)
{
  char *v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  unint64_t v19;
  char *v20;
  char v21;
  char *isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  char **v24;
  char *v25;

  if (result)
  {
    if ((a2 & 0x8000000000000000) != 0)
    {
LABEL_36:
      __break(1u);
LABEL_37:
      __break(1u);
      __break(1u);
      __break(1u);
      goto LABEL_38;
    }
    result = specialized SystemString.init<A>(_:)(0, a2, result);
    v6 = (char *)result;
  }
  else
  {
    v6 = (char *)&outlined read-only object #0 of specialized FilePath.init<A>(root:_:);
  }
  v25 = v6;
  v7 = *(_QWORD *)(a3 + 16);
  if (v7)
  {
    v8 = 0;
    v24 = a4;
    do
    {
      if (v8 >= *(_QWORD *)(a3 + 16))
        goto LABEL_34;
      v11 = (uint64_t *)(a3 + 32 + 24 * v8);
      v13 = *v11;
      v12 = v11[1];
      v14 = v11[2];
      v15 = v14 - v12;
      if (v14 != v12)
      {
        v18 = (char *)(v13 + 32 + v12);
        v19 = *((_QWORD *)v6 + 2);
        result = swift_bridgeObjectRetain();
        while (v19)
        {
          v21 = *v18;
          isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
          if (!(_DWORD)isUniquelyReferenced_nonNull_native || v19 >= *((_QWORD *)v6 + 3) >> 1)
            v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v19 + 1, 1, v6);
          v20 = &v6[v19 + 31];
          result = (size_t)memmove(&v6[v19 + 32], v20, *((_QWORD *)v6 + 2) - (v19 - 1));
          v19 = *((_QWORD *)v6 + 2) + 1;
          *((_QWORD *)v6 + 2) = v19;
          *v20 = v21;
          ++v18;
          if (!--v15)
            goto LABEL_12;
        }
        __break(1u);
LABEL_34:
        __break(1u);
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      swift_bridgeObjectRetain();
LABEL_12:
      result = swift_bridgeObjectRelease();
      v16 = *((_QWORD *)v6 + 2);
      if (!v16)
        goto LABEL_35;
      v17 = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!(_DWORD)v17 || v16 >= *((_QWORD *)v6 + 3) >> 1)
        v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v17, v16 + 1, 1, v6);
      ++v8;
      v9 = &v6[v16 + 31];
      result = (size_t)memmove(&v6[v16 + 32], v9, *((_QWORD *)v6 + 2) - (v16 - 1));
      v10 = *((_QWORD *)v6 + 2) + 1;
      *((_QWORD *)v6 + 2) = v10;
      *v9 = 47;
    }
    while (v8 != v7);
    v25 = v6;
    a4 = v24;
    v23 = v10 - 1;
    if (v10 != 1)
      goto LABEL_26;
    goto LABEL_32;
  }
  v10 = *((_QWORD *)v6 + 2);
  v23 = v10 - 1;
  if (v10 == 1)
  {
LABEL_32:
    swift_bridgeObjectRetain();
    SystemString._normalizeSeparators()();
    swift_bridgeObjectRelease();
    SystemString._normalizeSeparators()();
    result = swift_bridgeObjectRelease();
    *a4 = v6;
    return result;
  }
LABEL_26:
  if (!v10)
    goto LABEL_37;
  if (v6[32] == 47 && v23 == 1)
    goto LABEL_32;
  result = specialized BidirectionalCollection.last.getter((uint64_t)v6);
  if ((result & 0x100) == 0)
  {
    if (result == 47)
    {
      specialized RangeReplaceableCollection.remove(at:)(v10 - 2);
      v6 = v25;
    }
    goto LABEL_32;
  }
LABEL_38:
  __break(1u);
  return result;
}

size_t *FilePath.init<A>(root:_:)@<X0>(size_t *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  size_t v9;
  void *v10;
  void *v11;

  if (!*result)
  {
    v10 = &outlined read-only object #0 of FilePath.init<A>(root:_:);
    goto LABEL_5;
  }
  v9 = result[1];
  if ((v9 & 0x8000000000000000) == 0)
  {
    v10 = (void *)specialized SystemString.init<A>(_:)(0, v9, *result);
LABEL_5:
    v11 = v10;
    SystemString.appendComponents<A>(components:)(a2, a3, a4);
    SystemString._normalizeSeparators()();
    result = (size_t *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a2, a3);
    *a5 = v11;
    return result;
  }
  __break(1u);
  return result;
}

void protocol witness for RangeReplaceableCollection.init() in conformance FilePath.ComponentView(_QWORD *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of protocol witness for RangeReplaceableCollection.init() in conformance FilePath.ComponentView;
  a1[1] = 0;
}

uint64_t protocol witness for RangeReplaceableCollection.replaceSubrange<A>(_:with:) in conformance FilePath.ComponentView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  FilePath.ComponentView.replaceSubrange<A>(_:with:)(a1, a2, a3, a4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a2, a3);
}

uint64_t protocol witness for RangeReplaceableCollection.init(repeating:count:) in conformance FilePath.ComponentView@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  return specialized RangeReplaceableCollection.init(repeating:count:)(*a1, a1[1], a1[2], a2, a3);
}

uint64_t protocol witness for RangeReplaceableCollection.init<A>(_:) in conformance FilePath.ComponentView()
{
  return RangeReplaceableCollection.init<A>(_:)();
}

uint64_t protocol witness for RangeReplaceableCollection.append(_:) in conformance FilePath.ComponentView(uint64_t *a1)
{
  uint64_t v1;

  specialized FilePath.ComponentView.replaceSubrange<A>(_:with:)(*(_QWORD *)(*(_QWORD *)v1 + 16) - 1, *(_QWORD *)(*(_QWORD *)v1 + 16) - 1, *a1, a1[1], a1[2]);
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for RangeReplaceableCollection.append<A>(contentsOf:) in conformance FilePath.ComponentView()
{
  return RangeReplaceableCollection.append<A>(contentsOf:)();
}

uint64_t protocol witness for RangeReplaceableCollection.insert(_:at:) in conformance FilePath.ComponentView(uint64_t *a1, int64_t *a2)
{
  specialized FilePath.ComponentView.replaceSubrange<A>(_:with:)(*a2, *a2, *a1, a1[1], a1[2]);
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for RangeReplaceableCollection.insert<A>(contentsOf:at:) in conformance FilePath.ComponentView()
{
  return RangeReplaceableCollection.insert<A>(contentsOf:at:)();
}

Swift::Int protocol witness for RangeReplaceableCollection.remove(at:) in conformance FilePath.ComponentView@<X0>(Swift::Int *a1@<X0>, _QWORD *a2@<X8>)
{
  return specialized RangeReplaceableCollection.remove(at:)(*a1, a2);
}

int64_t protocol witness for RangeReplaceableCollection.removeSubrange(_:) in conformance FilePath.ComponentView(int64_t *a1)
{
  return specialized FilePath.ComponentView.replaceSubrange<A>(_:with:)(*a1, a1[1]);
}

void protocol witness for RangeReplaceableCollection._customRemoveLast() in conformance FilePath.ComponentView(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

int64_t specialized RangeReplaceableCollection.removeFirst(_:)(int64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  int64_t v3;
  char v4;

  if (result)
  {
    if (result < 0)
    {
      __break(1u);
    }
    else
    {
      v2 = v1[1];
      result = specialized BidirectionalCollection.index(_:offsetBy:limitedBy:)(v2, result, *(_QWORD *)(*v1 + 16) - 1, *v1, (uint64_t)&v3);
      if ((v4 & 1) != 0)
      {
LABEL_9:
        __break(1u);
        return result;
      }
      if (v3 >= v2)
        return specialized FilePath.ComponentView.replaceSubrange<A>(_:with:)(v2, v3);
    }
    __break(1u);
    goto LABEL_9;
  }
  return result;
}

uint64_t protocol witness for RangeReplaceableCollection.removeAll(where:) in conformance FilePath.ComponentView(uint64_t (*a1)(_QWORD *), uint64_t a2)
{
  return specialized RangeReplaceableCollection.removeAll(where:)(a1, a2);
}

uint64_t specialized RangeReplaceableCollection.removeAll(where:)(uint64_t (*a1)(_QWORD *), uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  void *v10;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  int v20;
  char v21;
  _QWORD v22[3];
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;

  v4 = v3;
  v5 = *v2;
  v6 = v2[1];
  v23 = &outlined read-only object #0 of specialized RangeReplaceableCollection.removeAll(where:);
  v7 = *(_QWORD *)(v5 + 16);
  if (v6 == v7 - 1)
  {
    result = swift_bridgeObjectRelease();
    v9 = 0;
    v10 = &outlined read-only object #0 of specialized RangeReplaceableCollection.removeAll(where:);
LABEL_58:
    *v2 = (uint64_t)v10;
    v2[1] = v9;
    return result;
  }
  v25 = a2;
  v12 = (_BYTE *)(v5 + 32);
  result = swift_bridgeObjectRetain();
  v13 = v5 + 33;
  while (1)
  {
    if (v6 || v7 == 1)
      goto LABEL_72;
    if (!v7)
      goto LABEL_69;
    if (*v12 != 47)
    {
LABEL_72:
      if (v7 <= v6 || !v7)
        goto LABEL_62;
      if (v6 < 0)
        goto LABEL_63;
      v14 = v7 - 1;
      if (v6 == v7 - 1)
        goto LABEL_17;
      if (v6 >= (unint64_t)(v7 - 1))
        goto LABEL_66;
      if (v6 >= (unint64_t)v7)
        goto LABEL_67;
      if (v12[v6] == 47)
      {
LABEL_17:
        v14 = v6;
        goto LABEL_30;
      }
      if (v6 + 1 != v14)
      {
        v15 = v6;
        while (1)
        {
          if (v15 + 1 < v6 || v15 + 1 >= v14)
          {
            __break(1u);
            goto LABEL_59;
          }
          if (*(_BYTE *)(v13 + v15) == 47)
            break;
          if (v7 - 2 == ++v15)
            goto LABEL_29;
        }
        v14 = v15 + 1;
      }
    }
    else
    {
      v14 = 1;
    }
LABEL_29:
    if (v14 < v6)
      goto LABEL_60;
LABEL_30:
    if (v6 == v14)
      goto LABEL_61;
    if (v6)
    {
      if (v7 <= v6)
        goto LABEL_65;
      if (v6 < 0)
        goto LABEL_64;
    }
    else if (v7 != 1 && *v12 == 47)
    {
      v17 = 1;
      goto LABEL_53;
    }
    v17 = v7 - 1;
    if (v6 == v7 - 1)
    {
      v17 = v6;
      goto LABEL_53;
    }
    if (v6 >= v7 - 1)
      goto LABEL_68;
    if (v12[v6] == 47)
    {
      v18 = v6;
LABEL_43:
      v17 = v18 + 1;
      goto LABEL_53;
    }
    if (v6 + 1 != v17)
      break;
LABEL_53:
    v22[0] = v5;
    v22[1] = v6;
    v22[2] = v14;
    swift_bridgeObjectRetain();
    v21 = a1(v22);
    if (v4)
    {
      swift_bridgeObjectRelease_n();
      return swift_bridgeObjectRelease();
    }
    if ((v21 & 1) == 0)
      specialized FilePath.ComponentView.replaceSubrange<A>(_:with:)(v23[2] - 1, v23[2] - 1, v5, v6, v14);
    result = swift_bridgeObjectRelease();
    v7 = *(_QWORD *)(v5 + 16);
    v6 = v17;
    if (v17 == v7 - 1)
    {
      result = swift_bridgeObjectRelease_n();
      v10 = v23;
      v9 = v24;
      goto LABEL_58;
    }
  }
  v18 = v6;
  while (v18 + 1 >= v6 && v18 + 1 < v17)
  {
    v20 = *(unsigned __int8 *)(v13 + v18++);
    if (v20 == 47)
      goto LABEL_43;
    if (v7 - 2 == v18)
      goto LABEL_53;
  }
LABEL_59:
  __break(1u);
LABEL_60:
  __break(1u);
LABEL_61:
  __break(1u);
LABEL_62:
  __break(1u);
LABEL_63:
  __break(1u);
LABEL_64:
  __break(1u);
LABEL_65:
  __break(1u);
LABEL_66:
  __break(1u);
LABEL_67:
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
  __break(1u);
  return result;
}

size_t FilePath.init(root:components:)@<X0>(size_t *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  size_t result;
  char *v5;

  result = specialized FilePath.init<A>(root:_:)(*a1, a1[1], a2, &v5);
  *a3 = v5;
  return result;
}

void FilePath.init(root:_:)(size_t *a1@<X0>, int64_t *a2@<X1>, char **a3@<X8>)
{
  int64_t v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  size_t v8;
  char *v9;
  unint64_t v10;
  int64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  char v16;
  char v17;
  char *isUniquelyReferenced_nonNull_native;

  v4 = *a2;
  v5 = a2[1];
  v6 = a2[2];
  v7 = a2[3];
  if (*a1)
  {
    v8 = a1[1];
    if ((v8 & 0x8000000000000000) != 0)
    {
LABEL_30:
      __break(1u);
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    v9 = (char *)specialized SystemString.init<A>(_:)(0, v8, *a1);
  }
  else
  {
    v9 = (char *)&outlined read-only object #0 of FilePath.init(root:_:);
  }
  v10 = *(_QWORD *)(v6 + 16);
  if (v5 < v4 || (uint64_t)v10 <= v7)
    goto LABEL_27;
  if (v4 < v7)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if ((uint64_t)v10 <= v5)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v12 = v5 - v4;
  if (v5 == v4)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    SystemString._normalizeSeparators()();
    *a3 = v9;
    return;
  }
  if (v5 <= v4)
    goto LABEL_31;
  if (v4 < 0)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  if (v4 >= v10)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (v5 - 1 < v10)
  {
    v13 = ~v4 + v10;
    v14 = (char *)(v4 + v6 + 32);
    while (v13)
    {
      v15 = *((_QWORD *)v9 + 2);
      if (!v15)
        goto LABEL_26;
      v17 = *v14++;
      v16 = v17;
      isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!(_DWORD)isUniquelyReferenced_nonNull_native || v15 >= *((_QWORD *)v9 + 3) >> 1)
        v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v15 + 1, 1, v9);
      memmove(&v9[v15 + 32], &v9[v15 + 31], *((_QWORD *)v9 + 2) - (v15 - 1));
      ++*((_QWORD *)v9 + 2);
      v9[v15 + 31] = v16;
      --v13;
      if (!--v12)
        goto LABEL_12;
    }
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
LABEL_34:
  __break(1u);
}

uint64_t FilePath.ComponentView.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<FilePath.ComponentView.CodingKeys>);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v10 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v13 = v8;
  v12 = 0;
  lazy protocol witness table accessor for type FilePath and conformance FilePath();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    v11 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void FilePath.ComponentView.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  unint64_t v4;
  unint64_t v6;
  Swift::UInt8 *v7;
  Swift::UInt8 v8;

  v1 = *v0;
  v2 = v0[1];
  Hasher.init(_seed:)();
  v3 = *(_QWORD *)(v1 + 16);
  if (v3 <= (uint64_t)v2)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v3)
  {
    Hasher._combine(_:)(v3 - 1 - v2);
    if (v3 - 1 == v2)
    {
LABEL_13:
      Hasher._finalize()();
      return;
    }
    if (v3 - 1 <= v2)
      goto LABEL_18;
    v4 = *(_QWORD *)(v1 + 16);
    if (v2 >= v4 || v3 - 2 >= v4)
      goto LABEL_19;
    v6 = ~v2 + v3;
    v7 = (Swift::UInt8 *)(v2 + v1 + 32);
    while (v6)
    {
      v8 = *v7++;
      Hasher._combine(_:)(v8);
      if (!--v6)
        goto LABEL_13;
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_17:
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  __break(1u);
}

uint64_t FilePath.ComponentView.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[16];
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<FilePath.ComponentView.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v12[15] = 0;
  lazy protocol witness table accessor for type FilePath and conformance FilePath();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v9 = v13;
  v12[14] = 1;
  swift_bridgeObjectRetain();
  v10 = KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  *a2 = v9;
  a2[1] = v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for _StrSlice._range.getter in conformance FilePath.ComponentView()
{
  _QWORD *v0;
  uint64_t result;

  result = v0[1];
  if (*(_QWORD *)(*v0 + 16) <= result)
    __break(1u);
  return result;
}

void protocol witness for Hashable.hash(into:) in conformance FilePath.ComponentView(uint64_t a1)
{
  uint64_t v1;

  specialized _StrSlice.hash(into:)(a1, *(_QWORD *)v1, *(_QWORD *)(v1 + 8));
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance FilePath.ComponentView()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  unint64_t v4;
  Swift::UInt8 *v5;
  Swift::UInt8 v6;

  v1 = *v0;
  v2 = v0[1];
  Hasher.init(_seed:)();
  v3 = *(_QWORD *)(v1 + 16);
  if (v3 <= (uint64_t)v2)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (!v3)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  Hasher._combine(_:)(v3 - 1 - v2);
  if (v3 - 1 == v2)
  {
LABEL_9:
    Hasher._finalize()();
    return;
  }
  if (v3 - 1 > v2)
  {
    v4 = ~v2 + v3;
    v5 = (Swift::UInt8 *)(v2 + v1 + 32);
    while (v4)
    {
      v6 = *v5++;
      Hasher._combine(_:)(v6);
      if (!--v4)
        goto LABEL_9;
    }
    __break(1u);
    goto LABEL_11;
  }
LABEL_14:
  __break(1u);
}

uint64_t protocol witness for Decodable.init(from:) in conformance FilePath.ComponentView@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return FilePath.ComponentView.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance FilePath.ComponentView(_QWORD *a1)
{
  return FilePath.ComponentView.encode(to:)(a1);
}

uint64_t *protocol witness for static Equatable.== infix(_:_:) in conformance FilePath.ComponentView(uint64_t *result, uint64_t *a2)
{
  int64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;

  v3 = *result;
  v2 = result[1];
  v4 = *(_QWORD *)(*result + 16);
  if (v4 <= v2)
  {
    __break(1u);
  }
  else
  {
    result = (uint64_t *)a2[1];
    v5 = *(_QWORD *)(*a2 + 16);
    if (v5 > (uint64_t)result)
      return (uint64_t *)specialized Sequence<>.elementsEqual<A>(_:)((int64_t)result, v5 - 1, *a2, v2, v4 - 1, v3);
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.ComponentView.CodingKeys, &unk_24C3D2B70);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.ComponentView.CodingKeys, &unk_24C3D2B70);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.ComponentView.CodingKeys, &unk_24C3D2B70);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.ComponentView.CodingKeys, &unk_24C3D2B70);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView.CodingKeys and conformance FilePath.ComponentView.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FilePath.ComponentView.Index and conformance FilePath.ComponentView.Index()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.ComponentView.Index and conformance FilePath.ComponentView.Index;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView.Index and conformance FilePath.ComponentView.Index)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.ComponentView.Index, &type metadata for FilePath.ComponentView.Index);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView.Index and conformance FilePath.ComponentView.Index);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.ComponentView.Index and conformance FilePath.ComponentView.Index;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView.Index and conformance FilePath.ComponentView.Index)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.ComponentView.Index, &type metadata for FilePath.ComponentView.Index);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView.Index and conformance FilePath.ComponentView.Index);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FilePath.ComponentView and conformance FilePath.ComponentView()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.ComponentView, &type metadata for FilePath.ComponentView);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.ComponentView, &type metadata for FilePath.ComponentView);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.ComponentView, &type metadata for FilePath.ComponentView);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.ComponentView, &type metadata for FilePath.ComponentView);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.ComponentView, &type metadata for FilePath.ComponentView);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView)
  {
    result = MEMORY[0x20BD3271C]("\tUZA", &type metadata for FilePath.ComponentView);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.ComponentView, &type metadata for FilePath.ComponentView);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.ComponentView, &type metadata for FilePath.ComponentView);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView;
  if (!lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.ComponentView, &type metadata for FilePath.ComponentView);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.ComponentView and conformance FilePath.ComponentView);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Indices : BidirectionalCollection in FilePath.ComponentView()
{
  return lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type DefaultIndices<FilePath.ComponentView> and conformance <> DefaultIndices<A>, &demangling cache variable for type metadata for DefaultIndices<FilePath.ComponentView>, (uint64_t (*)(void))lazy protocol witness table accessor for type FilePath.ComponentView and conformance FilePath.ComponentView, MEMORY[0x24BEE0658]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in FilePath.ComponentView()
{
  return lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<FilePath.ComponentView> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<FilePath.ComponentView>, (uint64_t (*)(void))lazy protocol witness table accessor for type FilePath.ComponentView and conformance FilePath.ComponentView, MEMORY[0x24BEE4218]);
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in FilePath.ComponentView()
{
  return lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type DefaultIndices<FilePath.ComponentView> and conformance DefaultIndices<A>, &demangling cache variable for type metadata for DefaultIndices<FilePath.ComponentView>, MEMORY[0x24BEE0670]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in FilePath.ComponentView()
{
  return lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<FilePath.ComponentView> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<FilePath.ComponentView>, MEMORY[0x24BEE4238]);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in FilePath.ComponentView()
{
  return lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type IndexingIterator<FilePath.ComponentView> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<FilePath.ComponentView>, MEMORY[0x24BEE2C18]);
}

uint64_t lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance DefaultIndices<A>(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x20BD3271C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RangeReplaceableCollection in FilePath.ComponentView()
{
  return lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<FilePath.ComponentView> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<FilePath.ComponentView>, (uint64_t (*)(void))lazy protocol witness table accessor for type FilePath.ComponentView and conformance FilePath.ComponentView, MEMORY[0x24BEE4240]);
}

uint64_t lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance <> DefaultIndices<A>(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x20BD3271C](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for FilePath.ComponentView(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type FilePath.ComponentView and conformance FilePath.ComponentView();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t instantiation function for generic protocol witness table for FilePath.ComponentView(_QWORD *a1)
{
  unint64_t result;

  a1[1] = lazy protocol witness table accessor for type FilePath.ComponentView and conformance FilePath.ComponentView();
  a1[2] = lazy protocol witness table accessor for type FilePath.ComponentView and conformance FilePath.ComponentView();
  result = lazy protocol witness table accessor for type FilePath.ComponentView and conformance FilePath.ComponentView();
  a1[3] = result;
  return result;
}

void sub_20AE258F8(_QWORD *a1@<X8>)
{
  uint64_t v2;
  _QWORD v3[2];

  swift_bridgeObjectRetain();
  FilePath.components.getter(v3);
  v2 = v3[1];
  *a1 = v3[0];
  a1[1] = v2;
}

ValueMetadata *type metadata accessor for FilePath.ComponentView()
{
  return &type metadata for FilePath.ComponentView;
}

ValueMetadata *type metadata accessor for FilePath.ComponentView.Index()
{
  return &type metadata for FilePath.ComponentView.Index;
}

uint64_t storeEnumTagSinglePayload for FilePath.ComponentView.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_20AE259AC + 4 * byte_20AE2DDF9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_20AE259E0 + 4 * byte_20AE2DDF4[v4]))();
}

uint64_t sub_20AE259E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20AE259E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20AE259F0);
  return result;
}

uint64_t sub_20AE259FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20AE25A04);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_20AE25A08(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20AE25A10(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for FilePath.ComponentView.CodingKeys()
{
  return &unk_24C3D2B70;
}

int64_t specialized SystemString.appendComponents<A>(components:)()
{
  uint64_t *v0;
  uint64_t v1;
  Swift::tuple_rootEnd_Int_relativeBegin_Int v2;
  unint64_t v3;
  __int16 v4;
  uint64_t v5;
  unint64_t v6;
  int64_t result;
  unint64_t v8;
  unint64_t v9;
  int v10;
  char v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int v16;
  unint64_t v17;
  char v18;
  Swift::tuple_rootEnd_Int_relativeBegin_Int v19;
  unint64_t v20;
  uint64_t v21;

  v1 = *v0;
  v2 = SystemString._parseRoot()();
  v3 = *(_QWORD *)(v1 + 16);
  if (v2.relativeBegin == v3 - 1)
    goto LABEL_7;
  v4 = specialized BidirectionalCollection.last.getter(v1);
  if ((v4 & 0x100) == 0)
  {
    if (v4 == 47)
    {
      if (v3 == 1)
      {
LABEL_53:
        __break(1u);
      }
      else if (v3 >= 2)
      {
        specialized RangeReplaceableCollection.remove(at:)(v3 - 2);
        goto LABEL_7;
      }
      __break(1u);
LABEL_55:
      __break(1u);
LABEL_56:
      __break(1u);
LABEL_57:
      __break(1u);
LABEL_58:
      __break(1u);
      goto LABEL_59;
    }
LABEL_7:
    v5 = *v0;
    v21 = *v0;
    v6 = *(_QWORD *)(*v0 + 16);
    if (v6 == 1)
    {
      swift_bridgeObjectRetain();
      return swift_bridgeObjectRelease();
    }
    if (!v6)
      goto LABEL_60;
    result = swift_bridgeObjectRetain();
    v8 = 0;
    v9 = 0;
    while (1)
    {
      if (v6 <= v8)
      {
        __break(1u);
LABEL_48:
        __break(1u);
LABEL_49:
        __break(1u);
LABEL_50:
        __break(1u);
LABEL_51:
        __break(1u);
LABEL_52:
        __break(1u);
        goto LABEL_53;
      }
      v10 = *(unsigned __int8 *)(v5 + 32 + v8);
      if (v9 != v8)
      {
        if (v9 >= v6)
          goto LABEL_49;
        v11 = *(_BYTE *)(v5 + 32 + v9);
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (int64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v5);
          v5 = result;
        }
        v12 = *(_QWORD *)(v5 + 16);
        if (v9 >= v12)
          goto LABEL_50;
        *(_BYTE *)(v5 + 32 + v9) = v10;
        if (v12 <= v8)
          goto LABEL_51;
        *(_BYTE *)(v5 + 32 + v8) = v11;
        v21 = v5;
        v6 = *(_QWORD *)(v5 + 16);
      }
      v13 = v6 - 1;
      if ((uint64_t)v8 >= (uint64_t)(v6 - 1) || (uint64_t)v9 >= v13)
        goto LABEL_48;
      ++v9;
      v14 = v8 + 1;
      if (v10 == 47 && (uint64_t)v14 < v13)
      {
        if (v14 >= v6)
          goto LABEL_52;
        if (*(_BYTE *)(v5 + v14 + 32) == 47)
          break;
      }
LABEL_10:
      v8 = v14;
      if ((uint64_t)v14 >= v13)
        goto LABEL_33;
    }
    while (v6 - 3 != v8)
    {
      v16 = *(unsigned __int8 *)(v5 + 34 + v8++);
      if (v16 != 47)
      {
        v14 = v8 + 1;
        goto LABEL_10;
      }
    }
    v14 = v6 - 1;
LABEL_33:
    if (v9 >= v6 || v14 >= v6)
      goto LABEL_61;
    v17 = v14 - v9;
    if (v17)
    {
      if ((v17 & 0x8000000000000000) != 0)
        goto LABEL_55;
      result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(v6 - 1, -(uint64_t)v17, 0, v5);
      if ((v18 & 1) != 0)
        goto LABEL_62;
      if ((uint64_t)v6 <= result)
        goto LABEL_56;
      specialized Array.replaceSubrange<A>(_:with:)(result, v6 - 1);
      v5 = v21;
    }
    v19 = SystemString._parseRoot()();
    v20 = *(_QWORD *)(v5 + 16);
    if (v19.relativeBegin == v20 - 1)
      return swift_bridgeObjectRelease();
    result = specialized BidirectionalCollection.last.getter(v5);
    if ((result & 0x100) != 0)
      goto LABEL_63;
    if (result != 47)
      return swift_bridgeObjectRelease();
    if (v20 != 1)
    {
      if (v20 < 2)
        goto LABEL_58;
      specialized RangeReplaceableCollection.remove(at:)(v20 - 2);
      return swift_bridgeObjectRelease();
    }
    goto LABEL_57;
  }
LABEL_59:
  __break(1u);
LABEL_60:
  result = swift_bridgeObjectRetain();
LABEL_61:
  __break(1u);
LABEL_62:
  __break(1u);
LABEL_63:
  __break(1u);
  return result;
}

uint64_t specialized FilePath.ComponentView.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x687461705FLL && a2 == 0xE500000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74726174735FLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t Sequence._withRawBufferPointer<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t result;
  char *v21;
  uint64_t v22;
  char *v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v31 = a6;
  v26 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v30 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = type metadata accessor for Optional();
  v13 = *(_QWORD *)(v29 - 8);
  v14 = MEMORY[0x24BDAC7A8](v29);
  v16 = (char *)&v25 - v15;
  v32 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = a3;
  v34 = a4;
  v35 = a5;
  v36 = a1;
  v27 = a1;
  v28 = a2;
  v37 = a2;
  v19 = v38;
  result = dispatch thunk of Sequence.withContiguousStorageIfAvailable<A>(_:)();
  if (!v19)
  {
    v21 = v18;
    v38 = v6;
    v22 = v29;
    v23 = v30;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v16, 1, a4) == 1)
    {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v22);
      (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v23, v38, a3);
      swift_getAssociatedTypeWitness();
      Array.init<A>(_:)();
      Array.withUnsafeBytes<A>(_:)();
      return swift_bridgeObjectRelease();
    }
    else
    {
      v24 = *(void (**)(char *, char *, uint64_t))(v32 + 32);
      v24(v21, v16, a4);
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v24)(v31, v21, a4);
    }
  }
  return result;
}

uint64_t partial apply for closure #1 in Sequence._withRawBufferPointer<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v5)(uint64_t);
  uint64_t AssociatedTypeWitness;
  uint64_t v7;

  v5 = *(uint64_t (**)(uint64_t))(v2 + 40);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = MEMORY[0x20BD322CC](a1, a2, AssociatedTypeWitness);
  return v5(v7);
}

_WORD *protocol witness for OptionSet.init(rawValue:) in conformance FilePermissions@<X0>(_WORD *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance FilePermissions()
{
  Swift::UInt16 *v0;
  Swift::UInt16 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance FilePermissions()
{
  Swift::UInt16 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance FilePermissions()
{
  Swift::UInt16 *v0;
  Swift::UInt16 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for Decodable.init(from:) in conformance FilePermissions()
{
  lazy protocol witness table accessor for type FilePermissions and conformance FilePermissions();
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance FilePermissions()
{
  lazy protocol witness table accessor for type FilePermissions and conformance FilePermissions();
  return RawRepresentable<>.encode(to:)();
}

void protocol witness for SetAlgebra.init() in conformance FilePermissions(_WORD *a1@<X8>)
{
  *a1 = 0;
}

_WORD *protocol witness for SetAlgebra.union(_:) in conformance FilePermissions@<X0>(_WORD *result@<X0>, _WORD *a2@<X8>)
{
  _WORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_WORD *protocol witness for SetAlgebra.intersection(_:) in conformance FilePermissions@<X0>(_WORD *result@<X0>, _WORD *a2@<X8>)
{
  _WORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_WORD *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance FilePermissions@<X0>(_WORD *result@<X0>, _WORD *a2@<X8>)
{
  _WORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance FilePermissions(_WORD *a1, unsigned __int16 *a2)
{
  _WORD *v2;
  int v3;
  int v4;

  v3 = *a2;
  v4 = (unsigned __int16)*v2;
  if ((v4 & v3) != v3)
    *v2 = v4 | v3;
  *a1 = v3;
  return (v4 & v3) != v3;
}

unsigned __int16 *protocol witness for SetAlgebra.remove(_:) in conformance FilePermissions@<X0>(unsigned __int16 *result@<X0>, uint64_t a2@<X8>)
{
  _WORD *v2;
  int v3;
  int v4;
  int v5;

  v3 = *result;
  v4 = (unsigned __int16)*v2;
  v5 = v4 & v3;
  if ((v4 & v3) != 0)
    *v2 = v4 & ~(_WORD)v3;
  *(_WORD *)a2 = v5;
  *(_BYTE *)(a2 + 2) = v5 == 0;
  return result;
}

unsigned __int16 *protocol witness for SetAlgebra.update(with:) in conformance FilePermissions@<X0>(unsigned __int16 *result@<X0>, uint64_t a2@<X8>)
{
  _WORD *v2;
  int v3;
  int v4;
  int v5;

  v3 = *result;
  v4 = (unsigned __int16)*v2;
  *v2 = v4 | v3;
  v5 = v4 & v3;
  *(_WORD *)a2 = v5;
  *(_BYTE *)(a2 + 2) = v5 == 0;
  return result;
}

_WORD *protocol witness for SetAlgebra.formUnion(_:) in conformance FilePermissions(_WORD *result)
{
  _WORD *v1;

  *v1 |= *result;
  return result;
}

_WORD *protocol witness for SetAlgebra.formIntersection(_:) in conformance FilePermissions(_WORD *result)
{
  _WORD *v1;

  *v1 &= *result;
  return result;
}

_WORD *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance FilePermissions(_WORD *result)
{
  _WORD *v1;

  *v1 ^= *result;
  return result;
}

_WORD *protocol witness for SetAlgebra.subtracting(_:) in conformance FilePermissions@<X0>(_WORD *result@<X0>, _WORD *a2@<X8>)
{
  _WORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance FilePermissions(unsigned __int16 *a1)
{
  unsigned __int16 *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance FilePermissions(_WORD *a1)
{
  _WORD *v1;

  return (unsigned __int16)(*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance FilePermissions(unsigned __int16 *a1)
{
  unsigned __int16 *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance FilePermissions()
{
  _WORD *v0;

  return *v0 == 0;
}

_WORD *protocol witness for SetAlgebra.subtract(_:) in conformance FilePermissions(_WORD *result)
{
  _WORD *v1;

  *v1 &= ~*result;
  return result;
}

_WORD *protocol witness for RawRepresentable.init(rawValue:) in conformance FilePermissions@<X0>(_WORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_WORD *)a2 = *result;
  *(_BYTE *)(a2 + 2) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance FilePermissions(_WORD *a1@<X8>)
{
  _WORD *v1;

  *a1 = *v1;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance FilePermissions(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 == *a2;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance FilePermissions@<X0>(uint64_t a1@<X0>, _WORD *a2@<X8>)
{
  __int16 v3;
  uint64_t result;

  v3 = specialized SetAlgebra<>.init(arrayLiteral:)(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t FilePermissions.description.getter(unsigned __int16 a1)
{
  return specialized OptionSet._buildDescription(_:)((uint64_t)&outlined read-only object #0 of FilePermissions.description.getter, a1);
}

unint64_t lazy protocol witness table accessor for type FilePermissions and conformance FilePermissions()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions;
  if (!lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePermissions, &type metadata for FilePermissions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions;
  if (!lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePermissions, &type metadata for FilePermissions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions;
  if (!lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePermissions, &type metadata for FilePermissions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions;
  if (!lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePermissions, &type metadata for FilePermissions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePermissions and conformance FilePermissions);
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FilePermissions()
{
  unsigned __int16 *v0;

  return FilePermissions.description.getter(*v0);
}

ValueMetadata *type metadata accessor for FilePermissions()
{
  return &type metadata for FilePermissions;
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int *v3;
  int v4;
  int v5;

  v1 = *(_QWORD *)(result + 16);
  if (!v1)
    return 0;
  v2 = result;
  LODWORD(result) = 0;
  v3 = (int *)(v2 + 32);
  do
  {
    v5 = *v3++;
    v4 = v5;
    if ((v5 & ~(_DWORD)result) == 0)
      v4 = 0;
    result = v4 | result;
    --v1;
  }
  while (v1);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  unsigned __int16 *v3;
  int v4;
  int v5;

  v1 = *(_QWORD *)(result + 16);
  if (!v1)
    return 0;
  v2 = result;
  LODWORD(result) = 0;
  v3 = (unsigned __int16 *)(v2 + 32);
  do
  {
    v5 = *v3++;
    v4 = v5;
    if ((v5 & ~(_DWORD)result) == 0)
      v4 = 0;
    result = v4 | result;
    --v1;
  }
  while (v1);
  return result;
}

ValueMetadata *type metadata accessor for CInterop()
{
  return &type metadata for CInterop;
}

uint64_t FileDescriptor.closeAfter<A>(_:)@<X0>(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v8;
  void (*v9)(void);
  uint64_t v10;
  char *v11;
  uint64_t result;
  int v13;
  _DWORD *v14;
  _DWORD v15[4];

  v8 = *(_QWORD *)(a3 - 8);
  v9 = (void (*)(void))MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9();
  if (v4)
  {
    if (close(a2) == -1)
    {
      v15[3] = MEMORY[0x20BD32218]();
      lazy protocol witness table accessor for type Errno and conformance Errno();
      swift_willThrowTypedImpl();
    }
    return swift_willThrow();
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(a4, v11, a3);
    result = close(a2);
    if ((_DWORD)result == -1)
    {
      v13 = MEMORY[0x20BD32218]();
      v15[2] = v13;
      lazy protocol witness table accessor for type Errno and conformance Errno();
      swift_willThrowTypedImpl();
      swift_allocError();
      *v14 = v13;
      return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a4, a3);
    }
  }
  return result;
}

uint64_t FileDescriptor._writeAll<A>(_:)(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  _DWORD v8[8];
  uint64_t v9;

  v8[4] = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<Int, Errno>);
  Sequence._withRawBufferPointer<A>(_:)((uint64_t)partial apply for closure #1 in FileDescriptor._writeAll<A>(_:), (uint64_t)v8, a3, v6, a4, (uint64_t)&v9);
  return v9;
}

ssize_t closure #1 in FileDescriptor._writeAll<A>(_:)@<X0>(int __fd@<W2>, ssize_t result@<X0>, uint64_t a3@<X1>, uint64_t a4@<X8>)
{
  ssize_t v5;
  uint64_t v7;
  ssize_t v8;
  size_t v9;
  const void *v10;
  BOOL v11;
  char v12;

  v5 = result;
  v7 = 0;
  v8 = a3 - result;
  while (2)
  {
    if (v5)
    {
      v9 = v8 - v7;
      if (v8 > v7)
      {
        v10 = (const void *)(v5 + v7);
        goto LABEL_7;
      }
      v12 = 0;
    }
    else
    {
      v10 = 0;
      if (v7 < 0)
      {
        v9 = 0;
LABEL_7:
        while (1)
        {
          result = write(__fd, v10, v9);
          if (result != -1)
            break;
          result = MEMORY[0x20BD32218]();
          if ((_DWORD)result != 4)
            goto LABEL_13;
        }
        v11 = __OFADD__(v7, result);
        v7 += result;
        if (!v11)
          continue;
        __break(1u);
LABEL_13:
        v8 = result;
        v12 = 1;
      }
      else
      {
        v12 = 0;
        v8 = 0;
      }
    }
    break;
  }
  *(_QWORD *)a4 = v8;
  *(_BYTE *)(a4 + 8) = v12;
  return result;
}

uint64_t FileDescriptor._writeAll<A>(toAbsoluteOffset:_:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  _DWORD v9[6];
  uint64_t v10;
  uint64_t v11;

  v9[4] = a3;
  v10 = a1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<Int, Errno>);
  Sequence._withRawBufferPointer<A>(_:)((uint64_t)partial apply for closure #1 in FileDescriptor._writeAll<A>(toAbsoluteOffset:_:), (uint64_t)v9, a4, v7, a5, (uint64_t)&v11);
  return v11;
}

ssize_t closure #1 in FileDescriptor._writeAll<A>(toAbsoluteOffset:_:)@<X0>(int __fd@<W2>, ssize_t result@<X0>, uint64_t a3@<X1>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  ssize_t v7;
  uint64_t v9;
  ssize_t v10;
  size_t v11;
  off_t v12;
  const void *v13;
  BOOL v14;
  char v15;

  v7 = result;
  v9 = 0;
  v10 = a3 - result;
  while (2)
  {
    if (v7)
    {
      v11 = v10 - v9;
      if (v10 > v9)
      {
        v12 = a4 + v9;
        if (!__OFADD__(a4, v9))
        {
          v13 = (const void *)(v7 + v9);
          goto LABEL_9;
        }
        __break(1u);
        break;
      }
      v15 = 0;
LABEL_16:
      *(_QWORD *)a5 = v10;
      *(_BYTE *)(a5 + 8) = v15;
      return result;
    }
    if ((v9 & 0x8000000000000000) == 0)
    {
      v10 = 0;
      v15 = 0;
      goto LABEL_16;
    }
    v12 = a4 + v9;
    if (!__OFADD__(a4, v9))
    {
      v13 = 0;
      v11 = 0;
LABEL_9:
      while (1)
      {
        result = pwrite(__fd, v13, v11, v12);
        if (result != -1)
          break;
        result = MEMORY[0x20BD32218]();
        if ((_DWORD)result != 4)
          goto LABEL_15;
      }
      v14 = __OFADD__(v9, result);
      v9 += result;
      if (!v14)
        continue;
      __break(1u);
LABEL_15:
      v10 = result;
      v15 = 1;
      goto LABEL_16;
    }
    break;
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type Errno and conformance Errno()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Errno and conformance Errno;
  if (!lazy protocol witness table cache variable for type Errno and conformance Errno)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for Errno, &type metadata for Errno);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Errno and conformance Errno);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Errno and conformance Errno;
  if (!lazy protocol witness table cache variable for type Errno and conformance Errno)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for Errno, &type metadata for Errno);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Errno and conformance Errno);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Errno and conformance Errno;
  if (!lazy protocol witness table cache variable for type Errno and conformance Errno)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for Errno, &type metadata for Errno);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Errno and conformance Errno);
  }
  return result;
}

ssize_t partial apply for closure #1 in FileDescriptor._writeAll<A>(_:)@<X0>(ssize_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return closure #1 in FileDescriptor._writeAll<A>(_:)(*(_DWORD *)(v3 + 16), a1, a2, a3);
}

ssize_t partial apply for closure #1 in FileDescriptor._writeAll<A>(toAbsoluteOffset:_:)@<X0>(ssize_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return closure #1 in FileDescriptor._writeAll<A>(toAbsoluteOffset:_:)(*(_DWORD *)(v3 + 16), a1, a2, *(_QWORD *)(v3 + 24), a3);
}

unint64_t specialized Collection<>.firstIndex(of:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char v10;

  v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v4 = a3 & 0xFFFFFFFFFFFFLL;
  if (!v4)
    return 0;
  v7 = 4 * v4;
  v8 = 15;
  while (String.subscript.getter() != a1 || v9 != a2)
  {
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      return v8;
    v8 = String.index(after:)();
    if (v7 == v8 >> 14)
      return 0;
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t specialized Collection<>.firstIndex(of:)(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t result;
  uint64_t v5;
  int v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v3 = a1;
  if (*(unsigned __int8 *)(a2 + 32) == a1)
    return 0;
  result = 0;
  v5 = v2 - 1;
  while (v5 != result)
  {
    v6 = *(unsigned __int8 *)(a2 + 33 + result++);
    if (v6 == v3)
      return result;
  }
  return 0;
}

System::FilePath __swiftcall FilePath.init(_:)(Swift::String a1)
{
  _QWORD *v1;
  unint64_t object;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  System::FilePath result;
  char __s[8];
  uint64_t v10;

  object = (unint64_t)a1._object;
  v3 = v1;
  if (((uint64_t)a1._object & 0x1000000000000000) != 0
    || !((uint64_t)a1._object & 0x2000000000000000 | a1._countAndFlagsBits & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    swift_bridgeObjectRelease();
    v7 = *(_QWORD *)__s;
    goto LABEL_9;
  }
  MEMORY[0x24BDAC7A8](a1._countAndFlagsBits);
  if ((object & 0x2000000000000000) == 0)
  {
    if ((v4 & 0x1000000000000000) != 0)
    {
      v5 = (object & 0xFFFFFFFFFFFFFFFLL) + 32;
      v6 = v4 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      v5 = _StringObject.sharedUTF8.getter();
    }
    v7 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq56System0H6StringV_Tg507_sSRys4f5VGxs5e38_pIgyrzo_ACxsAD_pIegyrzr_lTR6System0C6I5V_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(v5, v6, (uint64_t (*)(void))partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:));
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  *(_QWORD *)__s = v4;
  v10 = object & 0xFFFFFFFFFFFFFFLL;
  result._storage.nullTerminatedStorage._rawValue = (void *)strlen(__s);
  if (!__OFADD__(result._storage.nullTerminatedStorage._rawValue, 1))
  {
    v7 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(__s, (int64_t)result._storage.nullTerminatedStorage._rawValue + 1);
    swift_bridgeObjectRelease();
LABEL_9:
    *(_QWORD *)__s = v7;
    SystemString._normalizeSeparators()();
    *v3 = *(_QWORD *)__s;
    return result;
  }
  __break(1u);
  return result;
}

void FilePath.init(platformString:)(const char *a1@<X0>, _QWORD *a2@<X8>)
{
  size_t v4;
  _QWORD *v5;

  v4 = strlen(a1);
  if (__OFADD__(v4, 1))
  {
    __break(1u);
  }
  else
  {
    v5 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, v4 + 1);
    SystemString._normalizeSeparators()();
    *a2 = v5;
  }
}

uint64_t FilePath.withCString<A>(_:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  return FilePath._withPlatformString<A>(_:)(a1, a2);
}

size_t FilePath.Component.init(platformString:)@<X0>(const char *a1@<X0>, uint64_t a2@<X8>)
{
  size_t result;
  _QWORD *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  result = strlen(a1);
  if (__OFADD__(result, 1))
  {
    __break(1u);
  }
  else
  {
    v5 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, result + 1);
    result = FilePath.Component.init(_:)((uint64_t)v5, (uint64_t *)&v7);
    v6 = v8;
    *(_OWORD *)a2 = v7;
    *(_QWORD *)(a2 + 16) = v6;
  }
  return result;
}

size_t FilePath.Component.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t result;
  uint64_t v10;
  char __s[16];
  uint64_t v12;

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    swift_bridgeObjectRelease();
    v8 = *(_QWORD *)__s;
    goto LABEL_9;
  }
  MEMORY[0x24BDAC7A8](a1);
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((v5 & 0x1000000000000000) != 0)
    {
      v6 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      v7 = v5 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      v6 = _StringObject.sharedUTF8.getter();
    }
    v8 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq56System0H6StringV_Tg507_sSRys4f5VGxs5e38_pIgyrzo_ACxsAD_pIegyrzr_lTR6System0C6I5V_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(v6, v7, (uint64_t (*)(void))closure #1 in _StringGuts.withCString<A>(_:)specialized partial apply);
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  *(_QWORD *)__s = v5;
  *(_QWORD *)&__s[8] = a2 & 0xFFFFFFFFFFFFFFLL;
  result = strlen(__s);
  if (!__OFADD__(result, 1))
  {
    v8 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(__s, result + 1);
    swift_bridgeObjectRelease();
LABEL_9:
    result = FilePath.Component.init(_:)(v8, (uint64_t *)__s);
    v10 = v12;
    *(_OWORD *)a3 = *(_OWORD *)__s;
    *(_QWORD *)(a3 + 16) = v10;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t FilePath.Component.withPlatformString<A>(_:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  unint64_t v4;

  v4 = lazy protocol witness table accessor for type FilePath.Component and conformance FilePath.Component();
  return _StrSlice._withPlatformString<A>(_:)((uint64_t)&type metadata for FilePath.Component, a1, v4, a2);
}

size_t FilePath.Root.init(platformString:)@<X0>(const char *a1@<X0>, _OWORD *a2@<X8>)
{
  size_t result;
  _QWORD *v5;
  __int128 v6;

  result = strlen(a1);
  if (__OFADD__(result, 1))
  {
    __break(1u);
  }
  else
  {
    v5 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, result + 1);
    result = FilePath.Root.init(_:)((uint64_t)v5, (uint64_t *)&v6);
    *a2 = v6;
  }
  return result;
}

size_t FilePath.Root.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t result;
  char __s[16];

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    swift_bridgeObjectRelease();
    v8 = *(_QWORD *)__s;
    goto LABEL_9;
  }
  MEMORY[0x24BDAC7A8](a1);
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((v5 & 0x1000000000000000) != 0)
    {
      v6 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      v7 = v5 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      v6 = _StringObject.sharedUTF8.getter();
    }
    v8 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq56System0H6StringV_Tg507_sSRys4f5VGxs5e38_pIgyrzo_ACxsAD_pIegyrzr_lTR6System0C6I5V_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(v6, v7, (uint64_t (*)(void))closure #1 in _StringGuts.withCString<A>(_:)specialized partial apply);
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  *(_QWORD *)__s = v5;
  *(_QWORD *)&__s[8] = a2 & 0xFFFFFFFFFFFFFFLL;
  result = strlen(__s);
  if (!__OFADD__(result, 1))
  {
    v8 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(__s, result + 1);
    swift_bridgeObjectRelease();
LABEL_9:
    result = FilePath.Root.init(_:)(v8, (uint64_t *)__s);
    *a3 = *(_OWORD *)__s;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t FilePath.Root.withPlatformString<A>(_:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  unint64_t v4;

  v4 = lazy protocol witness table accessor for type FilePath.Root and conformance FilePath.Root();
  return _StrSlice._withPlatformString<A>(_:)((uint64_t)&type metadata for FilePath.Root, a1, v4, a2);
}

System::FilePath __swiftcall FilePath.init(stringLiteral:)(Swift::String stringLiteral)
{
  _QWORD *v1;
  unint64_t object;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  System::FilePath result;
  char __s[8];
  uint64_t v10;

  object = (unint64_t)stringLiteral._object;
  v3 = v1;
  if (((uint64_t)stringLiteral._object & 0x1000000000000000) != 0
    || !((uint64_t)stringLiteral._object & 0x2000000000000000 | stringLiteral._countAndFlagsBits & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    swift_bridgeObjectRelease();
    v7 = *(_QWORD *)__s;
    goto LABEL_9;
  }
  MEMORY[0x24BDAC7A8](stringLiteral._countAndFlagsBits);
  if ((object & 0x2000000000000000) == 0)
  {
    if ((v4 & 0x1000000000000000) != 0)
    {
      v5 = (object & 0xFFFFFFFFFFFFFFFLL) + 32;
      v6 = v4 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      v5 = _StringObject.sharedUTF8.getter();
    }
    v7 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq56System0H6StringV_Tg507_sSRys4f5VGxs5e38_pIgyrzo_ACxsAD_pIegyrzr_lTR6System0C6I5V_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(v5, v6, (uint64_t (*)(void))closure #1 in _StringGuts.withCString<A>(_:)specialized partial apply);
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  *(_QWORD *)__s = v4;
  v10 = object & 0xFFFFFFFFFFFFFFLL;
  result._storage.nullTerminatedStorage._rawValue = (void *)strlen(__s);
  if (!__OFADD__(result._storage.nullTerminatedStorage._rawValue, 1))
  {
    v7 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(__s, (int64_t)result._storage.nullTerminatedStorage._rawValue + 1);
    swift_bridgeObjectRelease();
LABEL_9:
    *(_QWORD *)__s = v7;
    SystemString._normalizeSeparators()();
    *v3 = *(_QWORD *)__s;
    return result;
  }
  __break(1u);
  return result;
}

void protocol witness for ExpressibleByStringLiteral.init(stringLiteral:) in conformance FilePath(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = specialized String.withCString<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr, _QWORD *))closure #1 in SystemString.init(_:), 0, *a1, a1[1]);
  swift_bridgeObjectRelease();
  SystemString._normalizeSeparators()();
  *a2 = v3;
}

uint64_t FilePath.Component.init(stringLiteral:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  uint64_t result;
  __int128 v11;
  char __s[8];
  uint64_t v13;
  uint64_t v14;
  __int128 v15;

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    swift_bridgeObjectRelease();
    v8 = *(_QWORD *)__s;
  }
  else
  {
    MEMORY[0x24BDAC7A8](a1);
    if ((a2 & 0x2000000000000000) != 0)
    {
      *(_QWORD *)__s = v5;
      v13 = a2 & 0xFFFFFFFFFFFFFFLL;
      v9 = strlen(__s);
      if (__OFADD__(v9, 1))
      {
        __break(1u);
        goto LABEL_14;
      }
      v8 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(__s, v9 + 1);
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v5 & 0x1000000000000000) != 0)
      {
        v6 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v7 = v5 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v6 = _StringObject.sharedUTF8.getter();
      }
      v8 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq56System0H6StringV_Tg507_sSRys4f5VGxs5e38_pIgyrzo_ACxsAD_pIegyrzr_lTR6System0C6I5V_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(v6, v7, (uint64_t (*)(void))closure #1 in _StringGuts.withCString<A>(_:)specialized partial apply);
      swift_bridgeObjectRelease();
    }
  }
  result = FilePath.Component.init(_:)(v8, &v14);
  if (v14)
  {
    v11 = v15;
    *(_QWORD *)a3 = v14;
    *(_OWORD *)(a3 + 8) = v11;
    return result;
  }
LABEL_14:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t protocol witness for ExpressibleByStringLiteral.init(stringLiteral:) in conformance FilePath.Component@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;
  __int128 v5;
  uint64_t v6;
  __int128 v7;

  v3 = specialized String.withCString<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr, _QWORD *))closure #1 in SystemString.init(_:), 0, *a1, a1[1]);
  swift_bridgeObjectRelease();
  result = FilePath.Component.init(_:)((uint64_t)v3, &v6);
  if (v6)
  {
    v5 = v7;
    *(_QWORD *)a2 = v6;
    *(_OWORD *)(a2 + 8) = v5;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t FilePath.Root.init(stringLiteral:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  uint64_t result;
  uint64_t v11;
  char __s[8];
  uint64_t v13;
  uint64_t v14[2];

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    swift_bridgeObjectRelease();
    v8 = *(_QWORD *)__s;
  }
  else
  {
    MEMORY[0x24BDAC7A8](a1);
    if ((a2 & 0x2000000000000000) != 0)
    {
      *(_QWORD *)__s = v5;
      v13 = a2 & 0xFFFFFFFFFFFFFFLL;
      v9 = strlen(__s);
      if (__OFADD__(v9, 1))
      {
        __break(1u);
        goto LABEL_14;
      }
      v8 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(__s, v9 + 1);
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v5 & 0x1000000000000000) != 0)
      {
        v6 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v7 = v5 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v6 = _StringObject.sharedUTF8.getter();
      }
      v8 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq56System0H6StringV_Tg507_sSRys4f5VGxs5e38_pIgyrzo_ACxsAD_pIegyrzr_lTR6System0C6I5V_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(v6, v7, (uint64_t (*)(void))closure #1 in _StringGuts.withCString<A>(_:)specialized partial apply);
      swift_bridgeObjectRelease();
    }
  }
  result = FilePath.Root.init(_:)(v8, v14);
  if (v14[0])
  {
    v11 = v14[1];
    *a3 = v14[0];
    a3[1] = v11;
    return result;
  }
LABEL_14:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t protocol witness for ExpressibleByStringLiteral.init(stringLiteral:) in conformance FilePath.Root@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6[2];

  v3 = specialized String.withCString<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr, _QWORD *))closure #1 in SystemString.init(_:), 0, *a1, a1[1]);
  swift_bridgeObjectRelease();
  result = FilePath.Root.init(_:)((uint64_t)v3, v6);
  if (v6[0])
  {
    v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t FilePath.description.getter()
{
  uint64_t v0;

  swift_bridgeObjectRetain();
  v0 = String.init(cString:)();
  swift_bridgeObjectRelease();
  return v0;
}

Swift::String __swiftcall String.init(decoding:)(System::FilePath decoding)
{
  uint64_t v1;
  void *v2;
  Swift::String result;

  v1 = String.init(decoding:)(decoding._storage.nullTerminatedStorage._rawValue, (uint64_t (*)(uint64_t))MEMORY[0x24BEE0BE8]);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t FilePath.debugDescription.getter()
{
  uint64_t v0;

  FilePath.description.getter();
  v0 = String.debugDescription.getter();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance FilePath()
{
  uint64_t v0;

  FilePath.description.getter();
  v0 = String.debugDescription.getter();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FilePath.Component.description.getter()
{
  size_t *v0;
  size_t v1;
  unint64_t v2;
  size_t v3;
  uint64_t v4;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  swift_bridgeObjectRetain_n();
  specialized SystemString.init<A>(_:)(v2, v3, v1);
  v4 = String.init(cString:)();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t String.init(decoding:)(size_t *a1)
{
  return String.init(decoding:)(a1, (uint64_t (*)(unint64_t))MEMORY[0x24BEE0BE8]);
}

uint64_t FilePath.Component.debugDescription.getter()
{
  uint64_t v0;

  FilePath.Component.description.getter();
  v0 = String.debugDescription.getter();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance FilePath.Component()
{
  uint64_t v0;

  FilePath.Component.description.getter();
  v0 = String.debugDescription.getter();
  swift_bridgeObjectRelease();
  return v0;
}

void FilePath.Root.description.getter()
{
  size_t *v0;
  size_t v1;
  size_t v2;

  v1 = v0[1];
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v2 = *v0;
    swift_bridgeObjectRetain_n();
    specialized SystemString.init<A>(_:)(0, v1, v2);
    String.init(cString:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
  }
}

size_t *String.init(decoding:)(size_t *a1)
{
  return String.init(decoding:)(a1, (uint64_t (*)(unint64_t))MEMORY[0x24BEE0BE8]);
}

uint64_t FilePath.Root.debugDescription.getter()
{
  uint64_t v0;

  FilePath.Root.description.getter();
  v0 = String.debugDescription.getter();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance FilePath.Root()
{
  uint64_t v0;

  FilePath.Root.description.getter();
  v0 = String.debugDescription.getter();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FilePath.string.getter()
{
  uint64_t v0;

  swift_bridgeObjectRetain();
  v0 = String.init(cString:)();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FilePath.Component.string.getter()
{
  size_t *v0;
  size_t v1;
  unint64_t v2;
  size_t v3;
  uint64_t v4;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  swift_bridgeObjectRetain_n();
  specialized SystemString.init<A>(_:)(v2, v3, v1);
  v4 = String.init(cString:)();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  return v4;
}

void FilePath.Root.string.getter()
{
  size_t *v0;
  size_t v1;
  size_t v2;

  v1 = v0[1];
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v2 = *v0;
    swift_bridgeObjectRetain_n();
    specialized SystemString.init<A>(_:)(0, v1, v2);
    String.init(cString:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
  }
}

Swift::String_optional __swiftcall String.init(validating:)(System::FilePath validating)
{
  uint64_t v1;
  void *v2;
  Swift::String_optional result;

  v1 = String.init(decoding:)(validating._storage.nullTerminatedStorage._rawValue, (uint64_t (*)(uint64_t))MEMORY[0x24BEE0A60]);
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

uint64_t String.init(decoding:)(_QWORD *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2;

  v2 = a2(*a1 + 32);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t String.init(validating:)(size_t *a1)
{
  return String.init(decoding:)(a1, (uint64_t (*)(unint64_t))MEMORY[0x24BEE0A60]);
}

uint64_t String.init(decoding:)(size_t *a1, uint64_t (*a2)(unint64_t))
{
  size_t v3;
  unint64_t v4;
  size_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = *a1;
  v4 = a1[1];
  v5 = a1[2];
  swift_bridgeObjectRetain_n();
  v6 = specialized SystemString.init<A>(_:)(v4, v5, v3);
  v7 = a2(v6 + 32);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  return v7;
}

size_t *String.init(validating:)(size_t *a1)
{
  return String.init(decoding:)(a1, (uint64_t (*)(unint64_t))MEMORY[0x24BEE0A60]);
}

size_t *String.init(decoding:)(size_t *result, uint64_t (*a2)(unint64_t))
{
  size_t v2;
  size_t v4;
  unint64_t v5;
  uint64_t v6;

  v2 = result[1];
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v4 = *result;
    swift_bridgeObjectRetain_n();
    v5 = specialized SystemString.init<A>(_:)(0, v2, v4);
    v6 = a2(v5 + 32);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    return (size_t *)v6;
  }
  return result;
}

Swift::String __swiftcall String.init(_:)(System::FilePath a1)
{
  uint64_t v1;
  void *v2;
  Swift::String result;

  v1 = String.init(decoding:)(a1._storage.nullTerminatedStorage._rawValue, (uint64_t (*)(uint64_t))MEMORY[0x24BEE0BE8]);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

Swift::String_optional __swiftcall String.init(validatingUTF8:)(System::FilePath validatingUTF8)
{
  uint64_t v1;
  void *v2;
  Swift::String_optional result;

  v1 = String.init(decoding:)(validatingUTF8._storage.nullTerminatedStorage._rawValue, (uint64_t (*)(uint64_t))MEMORY[0x24BEE0A60]);
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

void FilePath.init(cString:)(const char *a1@<X0>, _QWORD *a2@<X8>)
{
  size_t v4;
  _QWORD *v5;

  v4 = strlen(a1);
  if (__OFADD__(v4, 1))
  {
    __break(1u);
  }
  else
  {
    v5 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, v4 + 1);
    SystemString._normalizeSeparators()();
    *a2 = v5;
  }
}

System::FilePath __swiftcall FilePath.init(cString:)(Swift::OpaquePointer cString)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  char *v4;
  unsigned __int8 *v5;
  uint64_t v6;
  int v7;
  size_t v8;
  System::FilePath result;
  _QWORD *v10;

  v2 = *((_QWORD *)cString._rawValue + 2);
  if (v2)
  {
    v3 = v1;
    v4 = (char *)cString._rawValue + 32;
    if (*((_BYTE *)cString._rawValue + 32))
    {
      v5 = (unsigned __int8 *)cString._rawValue + 33;
      v6 = v2 - 1;
      while (v6)
      {
        v7 = *v5++;
        --v6;
        if (!v7)
          goto LABEL_6;
      }
    }
    else
    {
LABEL_6:
      v8 = strlen((const char *)cString._rawValue + 32);
      if (!__OFADD__(v8, 1))
      {
        v10 = specialized _copyCollectionToContiguousArray<A>(_:)(v4, v8 + 1);
        SystemString._normalizeSeparators()();
        result._storage.nullTerminatedStorage._rawValue = (void *)swift_bridgeObjectRelease();
        *v3 = v10;
        return result;
      }
      __break(1u);
    }
  }
  result._storage.nullTerminatedStorage._rawValue = (void *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

System::FilePath __swiftcall FilePath.init(cString:)(System::FilePath cString)
{
  _QWORD *v1;

  if (*(_BYTE *)cString._storage.nullTerminatedStorage._rawValue)
  {
    cString._storage.nullTerminatedStorage._rawValue = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    *v1 = &outlined read-only object #0 of FilePath.init(cString:);
  }
  return cString;
}

System::FilePath __swiftcall FilePath.init(cString:)(Swift::String cString)
{
  _QWORD *v1;
  unint64_t object;
  uint64_t countAndFlagsBits;
  _QWORD *v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  System::FilePath result;
  uint64_t v24;
  char __s[8];
  uint64_t v26;

  object = (unint64_t)cString._object;
  countAndFlagsBits = cString._countAndFlagsBits;
  v4 = v1;
  v5 = specialized Collection<>.firstIndex(of:)(0, 0xE100000000000000, cString._countAndFlagsBits, (unint64_t)cString._object);
  if ((v6 & 1) != 0)
  {
    if ((object & 0x1000000000000000) != 0
      || !(object & 0x2000000000000000 | countAndFlagsBits & 0x1000000000000000))
    {
      _StringGuts._slowWithCString<A>(_:)();
      swift_bridgeObjectRelease();
      v22 = *(_QWORD *)__s;
    }
    else
    {
      MEMORY[0x24BDAC7A8](v5);
      if ((object & 0x2000000000000000) != 0)
      {
        *(_QWORD *)__s = countAndFlagsBits;
        v26 = object & 0xFFFFFFFFFFFFFFLL;
        result._storage.nullTerminatedStorage._rawValue = (void *)strlen(__s);
        if (__OFADD__(result._storage.nullTerminatedStorage._rawValue, 1))
          goto LABEL_27;
        v22 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(__s, (int64_t)result._storage.nullTerminatedStorage._rawValue + 1);
        swift_bridgeObjectRelease();
      }
      else
      {
        if ((countAndFlagsBits & 0x1000000000000000) != 0)
        {
          v20 = (object & 0xFFFFFFFFFFFFFFFLL) + 32;
          v21 = countAndFlagsBits & 0xFFFFFFFFFFFFLL;
        }
        else
        {
          v20 = _StringObject.sharedUTF8.getter();
        }
        v22 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq56System0H6StringV_Tg507_sSRys4f5VGxs5e38_pIgyrzo_ACxsAD_pIegyrzr_lTR6System0C6I5V_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(v20, v21, (uint64_t (*)(void))closure #1 in _StringGuts.withCString<A>(_:)specialized partial apply);
        swift_bridgeObjectRelease();
      }
    }
    *(_QWORD *)__s = v22;
    goto LABEL_21;
  }
  v7 = String.subscript.getter();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  swift_bridgeObjectRelease();
  v14 = MEMORY[0x20BD3223C](v7, v9, v11, v13);
  v16 = v15;
  v17 = swift_bridgeObjectRelease();
  if ((v16 & 0x1000000000000000) != 0 || !(v16 & 0x2000000000000000 | v14 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
LABEL_8:
    swift_bridgeObjectRelease();
LABEL_17:
    *(_QWORD *)__s = v24;
LABEL_21:
    SystemString._normalizeSeparators()();
    *v4 = *(_QWORD *)__s;
    return result;
  }
  MEMORY[0x24BDAC7A8](v17);
  if ((v16 & 0x2000000000000000) == 0)
  {
    if ((v14 & 0x1000000000000000) != 0)
    {
      v18 = (v16 & 0xFFFFFFFFFFFFFFFLL) + 32;
      v19 = v14 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      v18 = _StringObject.sharedUTF8.getter();
    }
    v24 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq56System0H6StringV_Tg507_sSRys4f5VGxs5e38_pIgyrzo_ACxsAD_pIegyrzr_lTR6System0C6I5V_TG5SRyAGGAMsAD_pIgyrzo_Tf1cn_n(v18, v19, (uint64_t (*)(void))closure #1 in _StringGuts.withCString<A>(_:)specialized partial apply);
    goto LABEL_8;
  }
  *(_QWORD *)__s = v14;
  v26 = v16 & 0xFFFFFFFFFFFFFFLL;
  result._storage.nullTerminatedStorage._rawValue = (void *)strlen(__s);
  if (!__OFADD__(result._storage.nullTerminatedStorage._rawValue, 1))
  {
    v24 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(__s, (int64_t)result._storage.nullTerminatedStorage._rawValue + 1);
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

_QWORD *partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:)@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return specialized closure #1 in _StringGuts.withCString<A>(_:)(*(_QWORD *(**)(uint64_t *__return_ptr))(v1 + 16), a1);
}

uint64_t associated type witness table accessor for ExpressibleByStringLiteral.StringLiteralType : _ExpressibleByBuiltinStringLiteral in FilePath()
{
  return MEMORY[0x24BEE0D80];
}

uint64_t associated type witness table accessor for ExpressibleByExtendedGraphemeClusterLiteral.ExtendedGraphemeClusterLiteralType : _ExpressibleByBuiltinExtendedGraphemeClusterLiteral in FilePath()
{
  return MEMORY[0x24BEE0D90];
}

uint64_t associated type witness table accessor for ExpressibleByUnicodeScalarLiteral.UnicodeScalarLiteralType : _ExpressibleByBuiltinUnicodeScalarLiteral in FilePath()
{
  return MEMORY[0x24BEE0D88];
}

_QWORD *closure #1 in _StringGuts.withCString<A>(_:)specialized partial apply@<X0>(_QWORD *a1@<X8>)
{
  return partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:)(a1);
}

ValueMetadata *type metadata accessor for SystemString()
{
  return &type metadata for SystemString;
}

uint64_t SystemString.replaceSubrange<A>(_:with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))((char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0), v3, v4);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SystemChar]);
  return Array.replaceSubrange<A>(_:with:)();
}

uint64_t SystemString.withSystemChars<A>(_:)@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  v5 = type metadata accessor for Optional();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v10 - v6;
  result = Array.withContiguousStorageIfAvailable<A>(_:)();
  if (!v2)
  {
    v9 = *(_QWORD *)(a1 - 8);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, a1);
    if ((_DWORD)result == 1)
      __break(1u);
    else
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a2, v7, a1);
  }
  return result;
}

uint64_t Slice<>.withPlatformString<A>(_:)@<X0>(unint64_t a1@<X2>, size_t a2@<X3>, size_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  swift_bridgeObjectRetain();
  specialized SystemString.init<A>(_:)(a1, a2, a3);
  SystemString.withSystemChars<A>(_:)(a4, a5);
  return swift_bridgeObjectRelease();
}

uint64_t SystemString.withPlatformString<A>(_:)@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  return SystemString.withSystemChars<A>(_:)(a1, a2);
}

uint64_t specialized RangeReplaceableCollection.init(repeating:count:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (!a4)
    goto LABEL_4;
  v7 = a4;
  if ((a4 & 0x8000000000000000) == 0)
  {
    do
    {
      swift_bridgeObjectRetain();
      specialized FilePath.ComponentView.replaceSubrange<A>(_:with:)(0, 0, v5, a2, a3);
      swift_bridgeObjectRelease();
      --v7;
    }
    while (v7);
LABEL_4:
    result = swift_bridgeObjectRelease();
    *a5 = &outlined read-only object #0 of specialized RangeReplaceableCollection.init(repeating:count:);
    a5[1] = 0;
    return result;
  }
  __break(1u);
  return result;
}

void specialized RangeReplaceableCollection.removeFirst()(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  Swift::Int v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int componentEnd;
  Swift::Int v7;
  char v8;

  v4 = *v1;
  v3 = v1[1];
  v5 = *(_QWORD *)(*v1 + 16) - 1;
  if (v3 == v5)
  {
    __break(1u);
    goto LABEL_8;
  }
  v7 = *v1;
  componentEnd = FilePath._parseComponent(startingAt:)(v3).componentEnd;
  if (componentEnd < v3)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v3 == componentEnd)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  *a1 = v4;
  a1[1] = v3;
  a1[2] = componentEnd;
  swift_bridgeObjectRetain();
  specialized BidirectionalCollection.index(_:offsetBy:limitedBy:)(v3, 1, v5, v4, (uint64_t)&v7);
  if ((v8 & 1) == 0)
  {
    if (v7 >= v3)
    {
      specialized FilePath.ComponentView.replaceSubrange<A>(_:with:)(v3, v7);
      return;
    }
    goto LABEL_10;
  }
LABEL_11:
  __break(1u);
}

uint64_t specialized RangeReplaceableCollection.removeFirst()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  if (v1 == 1)
  {
    __break(1u);
  }
  else if (v1)
  {
    v2 = *(unsigned __int8 *)(*(_QWORD *)v0 + 32);
    specialized Array.replaceSubrange<A>(_:with:)(0, 1);
    return v2;
  }
  __break(1u);
  return result;
}

unsigned __int8 *protocol witness for RawRepresentable.init(rawValue:) in conformance SystemChar@<X0>(unsigned __int8 *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance SystemChar(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance SystemChar(char *a1, char *a2)
{
  return *a1 < *a2;
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance SystemChar(char *a1, char *a2)
{
  return *a2 >= *a1;
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance SystemChar(char *a1, char *a2)
{
  return *a1 >= *a2;
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance SystemChar(char *a1, char *a2)
{
  return *a2 < *a1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SystemChar()
{
  Swift::UInt8 *v0;
  Swift::UInt8 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance SystemChar()
{
  Swift::UInt8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SystemChar()
{
  Swift::UInt8 *v0;
  Swift::UInt8 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for Decodable.init(from:) in conformance SystemChar()
{
  lazy protocol witness table accessor for type SystemChar and conformance SystemChar();
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance SystemChar()
{
  lazy protocol witness table accessor for type SystemChar and conformance SystemChar();
  return RawRepresentable<>.encode(to:)();
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance SystemString.CodingKeys()
{
  return 0xD000000000000015;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SystemString.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized SystemString.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance SystemString.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SystemString.CodingKeys()
{
  lazy protocol witness table accessor for type SystemString.CodingKeys and conformance SystemString.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SystemString.CodingKeys()
{
  lazy protocol witness table accessor for type SystemString.CodingKeys and conformance SystemString.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t SystemString.subscript.setter(char a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t *v3;
  char v4;
  uint64_t v5;
  uint64_t result;

  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v5 = *v3;
    if (*(_QWORD *)(*v3 + 16) > a2)
    {
      v4 = a1;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) != 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  __break(1u);
LABEL_8:
  result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v5);
  v5 = result;
LABEL_4:
  if (*(_QWORD *)(v5 + 16) <= v2)
  {
    __break(1u);
  }
  else
  {
    *(_BYTE *)(v5 + v2 + 32) = v4;
    *v3 = v5;
  }
  return result;
}

unint64_t specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(unint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4;
  BOOL v5;
  BOOL v6;
  uint64_t v7;
  BOOL v8;

  v4 = *(_QWORD *)(a4 + 16);
  if (v4 > result)
  {
    v5 = v4 >= a3;
    v6 = v4 == a3;
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  if (v6 || !v5)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v7 = a3 - result;
  if (a2 >= 1)
  {
    if (v7 < 0 || v7 >= (unint64_t)a2)
      goto LABEL_13;
    return 0;
  }
  if (v7 <= 0 && v7 > a2)
    return 0;
LABEL_13:
  v8 = __OFADD__(result, a2);
  result += a2;
  if (v8)
    goto LABEL_16;
  if (result >= v4)
LABEL_17:
    __break(1u);
  return result;
}

uint64_t protocol witness for MutableCollection.subscript.setter in conformance SystemString(char *a1, unint64_t *a2)
{
  return SystemString.subscript.setter(*a1, *a2);
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance SystemString(uint64_t (*result)(uint64_t a1), unint64_t *a2))(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;

  v3 = *a2;
  *(_QWORD *)result = v2;
  *((_QWORD *)result + 1) = v3;
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(*(_QWORD *)v2 + 16) > v3)
  {
    *((_BYTE *)result + 16) = *(_BYTE *)(*(_QWORD *)v2 + v3 + 32);
    return protocol witness for MutableCollection.subscript.modify in conformance SystemString;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for MutableCollection.subscript.modify in conformance SystemString(uint64_t a1)
{
  return SystemString.subscript.setter(*(_BYTE *)(a1 + 16), *(_QWORD *)(a1 + 8));
}

uint64_t protocol witness for MutableCollection.subscript.setter in conformance SystemString(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;

  specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)(v2, *a2, a2[1], *a1, a1[1], a1[2]);
  return swift_bridgeObjectRelease();
}

void (*protocol witness for MutableCollection.subscript.modify in conformance SystemString(_QWORD *a1, uint64_t *a2))(_QWORD *a1)
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = specialized MutableCollection<>.subscript.modify(v4, *a2, a2[1]);
  return protocol witness for MutableCollection.subscript.modify in conformance SystemString;
}

void protocol witness for MutableCollection.subscript.modify in conformance SystemString(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*specialized MutableCollection<>.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  void (**v3)(uint64_t **, char);
  _QWORD *v7;
  void (*result)(uint64_t **, char);
  uint64_t v9;

  v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  result = *v3;
  v9 = *((_QWORD *)*v3 + 2);
  if (!v9)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a2 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v9 > a3)
  {
    *v7 = a2;
    v7[1] = a3;
    v7[2] = result;
    swift_bridgeObjectRetain();
    return MutableCollection<>.subscript.modifyspecialized ;
  }
LABEL_7:
  __break(1u);
  return result;
}

void MutableCollection<>.subscript.modifyspecialized (uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *a1;
  v3 = **a1;
  v4 = (*a1)[1];
  v5 = (*a1)[4];
  v6 = (*a1)[5];
  v7 = (*a1)[2];
  v8 = (*a1)[3];
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)(v6, v8, v5, v3, v4, v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)((*a1)[5], v8, v5, v3, v4, v7);
  }
  swift_bridgeObjectRelease();
  free(v2);
}

unint64_t protocol witness for MutableCollection.partition(by:) in conformance SystemString@<X0>(uint64_t (*a1)(char *)@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;
  unint64_t result;

  result = specialized MutableCollection<>.partition(by:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

unint64_t specialized MutableCollection<>.partition(by:)(uint64_t (*a1)(char *))
{
  char **v1;
  uint64_t v2;
  char *v4;
  unint64_t result;

  v4 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v4 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v4);
  result = specialized MutableCollection<>._partitionImpl(by:)(a1);
  *v1 = v4;
  if (!v2 && result >= *((_QWORD *)v4 + 2))
    __break(1u);
  return result;
}

unint64_t protocol witness for MutableCollection.swapAt(_:_:) in conformance SystemString(unint64_t *a1, unint64_t *a2)
{
  return specialized MutableCollection.swapAt(_:_:)(*a1, *a2);
}

unint64_t specialized MutableCollection.swapAt(_:_:)(unint64_t result, unint64_t a2)
{
  unint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  char v5;
  char v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  if (result != a2)
  {
    v7 = result;
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      v4 = *v3;
      v8 = *(_QWORD *)(*v3 + 16);
      if (v8 > result)
      {
        v2 = a2;
        if (v8 > a2)
        {
          v5 = *(_BYTE *)(v4 + 32 + result);
          v6 = *(_BYTE *)(v4 + 32 + a2);
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) != 0)
            goto LABEL_6;
          goto LABEL_13;
        }
LABEL_12:
        __break(1u);
LABEL_13:
        result = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v4);
        v4 = result;
LABEL_6:
        v9 = *(_QWORD *)(v4 + 16);
        if (v9 <= v7)
        {
          __break(1u);
        }
        else
        {
          *(_BYTE *)(v4 + 32 + v7) = v6;
          *v3 = v4;
          if (v9 > v2)
          {
            *(_BYTE *)(v4 + 32 + v2) = v5;
            *v3 = v4;
            return result;
          }
        }
        __break(1u);
        return result;
      }
    }
    __break(1u);
    goto LABEL_12;
  }
  return result;
}

uint64_t protocol witness for MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:) in conformance SystemString()
{
  return MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)();
}

uint64_t protocol witness for MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:) in conformance SystemString()
{
  return SystemString.withContiguousMutableStorageIfAvailable<A>(_:)();
}

uint64_t SystemString.withContiguousMutableStorageIfAvailable<A>(_:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SystemChar]);
  return Array.withContiguousMutableStorageIfAvailable<A>(_:)();
}

_QWORD *protocol witness for BidirectionalCollection.index(before:) in conformance SystemString@<X0>(_QWORD *result@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < *(_QWORD *)(*(_QWORD *)v2 + 16) - 1)
  {
    *a2 = v3;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for BidirectionalCollection.formIndex(before:) in conformance SystemString(uint64_t *result)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else if ((v2 & 0x8000000000000000) == 0 && v2 < *(_QWORD *)(*(_QWORD *)v1 + 16) - 1)
  {
    *result = v2;
    return result;
  }
  __break(1u);
  return result;
}

void protocol witness for Collection.startIndex.getter in conformance SystemString(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t (*protocol witness for Collection.subscript.read in conformance SystemString(uint64_t (*result)(), unint64_t *a2))()
{
  uint64_t v2;
  unint64_t v3;

  v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(*(_QWORD *)v2 + 16) > v3)
  {
    *(_BYTE *)result = *(_BYTE *)(*(_QWORD *)v2 + v3 + 32);
    return Mach.Port._name.modify;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.subscript.getter in conformance SystemString@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = *v2;
  v5 = *(_QWORD *)(*v2 + 16);
  if (!v5)
  {
    __break(1u);
    goto LABEL_6;
  }
  v6 = *a1;
  if (*a1 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v7 = a1[1];
  if (v5 > v7)
  {
    *a2 = v6;
    a2[1] = v7;
    a2[2] = result;
    return swift_bridgeObjectRetain();
  }
LABEL_7:
  __break(1u);
  return result;
}

void protocol witness for Collection.indices.getter in conformance SystemString(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  if (v2)
  {
    *a1 = 0;
    a1[1] = v2 - 1;
  }
  else
  {
    __break(1u);
  }
}

BOOL protocol witness for Collection.isEmpty.getter in conformance SystemString()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 16) == 1;
}

_QWORD *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance SystemString@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v3;
  unint64_t v4;

  v4 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else if (v4 < *(_QWORD *)(*(_QWORD *)v3 + 16))
  {
    *a3 = v4;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance SystemString@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  unint64_t result;
  char v7;

  result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3, *v4);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v7 & 1;
  return result;
}

unint64_t *protocol witness for RandomAccessCollection.distance(from:to:) in conformance SystemString(unint64_t *result, unint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (*result < v4 && v3 < v4)
    return (unint64_t *)(v3 - *result);
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection.index(after:) in conformance SystemString@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *result;
  if (*result < 0 || v3 >= *(_QWORD *)(*(_QWORD *)v2 + 16) - 1)
    __break(1u);
  else
    *a2 = v3 + 1;
  return result;
}

uint64_t *protocol witness for Collection.formIndex(after:) in conformance SystemString(uint64_t *result)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *result;
  if (*result < 0 || v2 >= *(_QWORD *)(*(_QWORD *)v1 + 16) - 1)
    __break(1u);
  else
    *result = v2 + 1;
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance SystemString(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = 0;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance SystemString()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  if (v1)
    return v1 - 1;
  __break(1u);
  return result;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance SystemString()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
  swift_bridgeObjectRelease();
  return v1;
}

_QWORD *protocol witness for Sequence._copyContents(initializing:) in conformance SystemString(_QWORD *a1, _BYTE *a2, unint64_t a3)
{
  uint64_t *v3;

  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance SystemString()
{
  return SystemString.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t SystemString.withContiguousStorageIfAvailable<A>(_:)()
{
  return Array.withContiguousStorageIfAvailable<A>(_:)();
}

void protocol witness for RangeReplaceableCollection.init() in conformance SystemString(_QWORD *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of protocol witness for RangeReplaceableCollection.init() in conformance SystemString;
}

uint64_t protocol witness for RangeReplaceableCollection.replaceSubrange<A>(_:with:) in conformance SystemString(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  SystemString.replaceSubrange<A>(_:with:)(*a1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a2, a3);
}

char *protocol witness for RangeReplaceableCollection.reserveCapacity(_:) in conformance SystemString(char *result)
{
  char **v1;
  char *v2;
  char *v3;
  int64_t v4;

  v2 = result + 1;
  if (__OFADD__(result, 1))
  {
    __break(1u);
  }
  else
  {
    v3 = *v1;
    result = (char *)swift_isUniquelyReferenced_nonNull_native();
    if (!(_DWORD)result || (uint64_t)v2 > *((_QWORD *)v3 + 3) >> 1)
    {
      if (*((_QWORD *)v3 + 2) <= (uint64_t)v2)
        v4 = (int64_t)v2;
      else
        v4 = *((_QWORD *)v3 + 2);
      result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(result, v4, 0, v3);
      v3 = result;
    }
    *v1 = v3;
  }
  return result;
}

uint64_t protocol witness for RangeReplaceableCollection.init(repeating:count:) in conformance SystemString@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;

  result = specialized RangeReplaceableCollection.init(repeating:count:)(*a1, a2);
  *a3 = result;
  return result;
}

unint64_t protocol witness for RangeReplaceableCollection.append(_:) in conformance SystemString(char *a1)
{
  uint64_t v1;

  return specialized Array.replaceSubrange<A>(_:with:)(*(_QWORD *)(*(_QWORD *)v1 + 16) - 1, *(_QWORD *)(*(_QWORD *)v1 + 16) - 1, *a1);
}

unint64_t protocol witness for RangeReplaceableCollection.insert(_:at:) in conformance SystemString(char *a1, unint64_t *a2)
{
  return specialized Array.replaceSubrange<A>(_:with:)(*a2, *a2, *a1);
}

unint64_t protocol witness for RangeReplaceableCollection.remove(at:) in conformance SystemString@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized RangeReplaceableCollection.remove(at:)(*a1);
  *a2 = result;
  return result;
}

unint64_t protocol witness for RangeReplaceableCollection.removeSubrange(_:) in conformance SystemString(uint64_t a1)
{
  return specialized Array.replaceSubrange<A>(_:with:)(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

void protocol witness for RangeReplaceableCollection._customRemoveLast() in conformance SystemString(_WORD *a1@<X8>)
{
  *a1 = 256;
}

uint64_t protocol witness for RangeReplaceableCollection.removeFirst() in conformance SystemString@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = specialized RangeReplaceableCollection.removeFirst()();
  *a1 = result;
  return result;
}

uint64_t protocol witness for RangeReplaceableCollection.removeFirst(_:) in conformance SystemString(uint64_t result)
{
  uint64_t *v1;
  char v2;

  if (result)
  {
    if (result < 0)
    {
      __break(1u);
    }
    else
    {
      result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(0, result, *(_QWORD *)(*v1 + 16) - 1, *v1);
      if ((v2 & 1) != 0)
      {
LABEL_9:
        __break(1u);
        return result;
      }
      if ((result & 0x8000000000000000) == 0)
        return specialized Array.replaceSubrange<A>(_:with:)(0, result);
    }
    __break(1u);
    goto LABEL_9;
  }
  return result;
}

uint64_t protocol witness for RangeReplaceableCollection.removeAll(where:) in conformance SystemString(uint64_t (*a1)(char *))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  result = specialized MutableCollection._halfStablePartition(isSuffixElement:)(a1);
  if (!v2)
  {
    v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
    if (v4 <= result)
      __break(1u);
    else
      return specialized Array.replaceSubrange<A>(_:with:)(result, v4 - 1);
  }
  return result;
}

uint64_t SystemString.encode(to:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD v9[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SystemString.CodingKeys>);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type SystemString.CodingKeys and conformance SystemString.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v9[1] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SystemChar]);
  lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type [SystemChar] and conformance <A> [A], &demangling cache variable for type metadata for [SystemChar], (uint64_t (*)(void))lazy protocol witness table accessor for type SystemChar and conformance SystemChar, MEMORY[0x24BEE12A0]);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

Swift::Int SystemString.hashValue.getter(uint64_t a1)
{
  Swift::UInt v2;
  Swift::UInt8 *v3;
  Swift::UInt8 v4;

  Hasher.init(_seed:)();
  v2 = *(_QWORD *)(a1 + 16);
  Hasher._combine(_:)(v2);
  if (v2)
  {
    v3 = (Swift::UInt8 *)(a1 + 32);
    do
    {
      v4 = *v3++;
      Hasher._combine(_:)(v4);
      --v2;
    }
    while (v2);
  }
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SystemString()
{
  uint64_t *v0;

  return SystemString.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance SystemString()
{
  uint64_t *v0;
  uint64_t v1;
  Swift::UInt v2;
  Swift::UInt8 *v3;
  Swift::UInt8 v4;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 16);
  Hasher._combine(_:)(v2);
  if (v2)
  {
    v3 = (Swift::UInt8 *)(v1 + 32);
    do
    {
      v4 = *v3++;
      Hasher._combine(_:)(v4);
      --v2;
    }
    while (v2);
  }
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SystemString()
{
  uint64_t *v0;
  uint64_t v1;
  Swift::UInt v2;
  Swift::UInt8 *v3;
  Swift::UInt8 v4;

  v1 = *v0;
  Hasher.init(_seed:)();
  v2 = *(_QWORD *)(v1 + 16);
  Hasher._combine(_:)(v2);
  if (v2)
  {
    v3 = (Swift::UInt8 *)(v1 + 32);
    do
    {
      v4 = *v3++;
      Hasher._combine(_:)(v4);
      --v2;
    }
    while (v2);
  }
  return Hasher._finalize()();
}

_QWORD *protocol witness for Decodable.init(from:) in conformance SystemString@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = specialized SystemString.init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance SystemString(_QWORD *a1)
{
  uint64_t *v1;

  return SystemString.encode(to:)(a1, *v1);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance SystemString(uint64_t *a1, uint64_t *a2)
{
  return specialized static Array<A>.== infix(_:_:)(*a1, *a2);
}

uint64_t _sSPsRi_zrlE17withMemoryRebound2to8capacity_qd_1_qd__m_Siqd_1_SPyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t (*v17)(uint64_t, char *);
  uint64_t result;
  uint64_t v19;

  v13 = *(_QWORD *)(a8 - 8);
  v14 = MEMORY[0x24BDAC7A8](a5);
  v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = v17(v14, v16);
  if (v11)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a11, v16, a8);
  return result;
}

size_t closure #1 in SystemString.init(_:)@<X0>(const char *a1@<X0>, size_t *a2@<X8>)
{
  size_t result;

  result = strlen(a1);
  if (__OFADD__(result, 1))
  {
    __break(1u);
  }
  else
  {
    result = (size_t)specialized _copyCollectionToContiguousArray<A>(_:)(a1, result + 1);
    *a2 = result;
  }
  return result;
}

uint64_t protocol witness for ExpressibleByStringLiteral.init(stringLiteral:) in conformance SystemString@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = specialized String.withCString<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr, _QWORD *))closure #1 in SystemString.init(_:), 0, *a1, a1[1]);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SystemString()
{
  uint64_t v0;

  swift_bridgeObjectRetain();
  v0 = String.init(cString:)();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SystemString()
{
  uint64_t v0;

  swift_bridgeObjectRetain();
  String.init(cString:)();
  swift_bridgeObjectRelease();
  v0 = String.debugDescription.getter();
  swift_bridgeObjectRelease();
  return v0;
}

unint64_t lazy protocol witness table accessor for type SystemString and conformance SystemString()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SystemString and conformance SystemString;
  if (!lazy protocol witness table cache variable for type SystemString and conformance SystemString)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for SystemString, &type metadata for SystemString);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString and conformance SystemString);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SystemString and conformance SystemString;
  if (!lazy protocol witness table cache variable for type SystemString and conformance SystemString)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for SystemString, &type metadata for SystemString);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString and conformance SystemString);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SystemString and conformance SystemString;
  if (!lazy protocol witness table cache variable for type SystemString and conformance SystemString)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for SystemString, &type metadata for SystemString);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString and conformance SystemString);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SystemString and conformance SystemString;
  if (!lazy protocol witness table cache variable for type SystemString and conformance SystemString)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for SystemString, &type metadata for SystemString);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString and conformance SystemString);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SystemString and conformance SystemString;
  if (!lazy protocol witness table cache variable for type SystemString and conformance SystemString)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for SystemString, &type metadata for SystemString);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString and conformance SystemString);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SystemString and conformance SystemString;
  if (!lazy protocol witness table cache variable for type SystemString and conformance SystemString)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for SystemString, &type metadata for SystemString);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString and conformance SystemString);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SystemString and conformance SystemString;
  if (!lazy protocol witness table cache variable for type SystemString and conformance SystemString)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for SystemString, &type metadata for SystemString);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString and conformance SystemString);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SystemString and conformance SystemString;
  if (!lazy protocol witness table cache variable for type SystemString and conformance SystemString)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for SystemString, &type metadata for SystemString);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString and conformance SystemString);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SystemString and conformance SystemString;
  if (!lazy protocol witness table cache variable for type SystemString and conformance SystemString)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for SystemString, &type metadata for SystemString);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString and conformance SystemString);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SystemString and conformance SystemString;
  if (!lazy protocol witness table cache variable for type SystemString and conformance SystemString)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for SystemString, &type metadata for SystemString);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString and conformance SystemString);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SystemString and conformance SystemString;
  if (!lazy protocol witness table cache variable for type SystemString and conformance SystemString)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for SystemString, &type metadata for SystemString);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString and conformance SystemString);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RangeReplaceableCollection in SystemString()
{
  return lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<SystemString> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<SystemString>, (uint64_t (*)(void))lazy protocol witness table accessor for type SystemString and conformance SystemString, MEMORY[0x24BEE4240]);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in SystemString()
{
  return lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type IndexingIterator<SystemString> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<SystemString>, MEMORY[0x24BEE2C18]);
}

uint64_t associated type witness table accessor for Collection.Index : Comparable in SystemString()
{
  return MEMORY[0x24BEE1780];
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in SystemString()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>, MEMORY[0x24BEE1BD8]);
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    result = MEMORY[0x20BD3271C](MEMORY[0x24BEE1790], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in SystemString()
{
  return lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<SystemString> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<SystemString>, MEMORY[0x24BEE4238]);
}

uint64_t associated type witness table accessor for Collection.Indices : BidirectionalCollection in SystemString()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>, MEMORY[0x24BEE1BA8]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in SystemString()
{
  return lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<SystemString> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<SystemString>, (uint64_t (*)(void))lazy protocol witness table accessor for type SystemString and conformance SystemString, MEMORY[0x24BEE4218]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : MutableCollection in SystemString()
{
  return lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<SystemString> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<SystemString>, (uint64_t (*)(void))lazy protocol witness table accessor for type SystemString and conformance SystemString, MEMORY[0x24BEE4220]);
}

uint64_t associated type witness table accessor for Collection.Indices : RandomAccessCollection in SystemString()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>, MEMORY[0x24BEE1BD0]);
}

uint64_t lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Range<Int>);
    v6 = lazy protocol witness table accessor for type Int and conformance Int();
    v7[0] = MEMORY[0x24BEE17A8];
    v7[1] = v6;
    result = MEMORY[0x20BD3271C](a2, v5, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in SystemString()
{
  return lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<SystemString> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<SystemString>, (uint64_t (*)(void))lazy protocol witness table accessor for type SystemString and conformance SystemString, MEMORY[0x24BEE4230]);
}

uint64_t closure #1 in SystemString.withPlatformString<A>(_:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[6];
  uint64_t v15;

  if (result)
  {
    v8 = result;
    MEMORY[0x24BDAC7A8](result);
    v14[2] = v10;
    v14[3] = v9;
    v14[4] = v11;
    v14[5] = v12;
    v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    return _sSPsRi_zrlE17withMemoryRebound2to8capacity_qd_1_qd__m_Siqd_1_SPyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lF(MEMORY[0x24BEE3E50], a2, (uint64_t)partial apply for closure #1 in closure #1 in SystemString.withPlatformString<A>(_:), (uint64_t)v14, v8, (uint64_t)&type metadata for SystemChar, MEMORY[0x24BEE3E50], v13, a6, MEMORY[0x24BEE3F20], (uint64_t)&v15);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v14 = *(_QWORD *)result;
  v15 = *(_QWORD *)(*(_QWORD *)result + 16);
  if (!v15)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v9 = a2;
  if (a2 < 0)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v10 = a3;
  if (v15 <= a3)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v6 = a5;
  v7 = a4;
  if (a2 == a3)
    goto LABEL_22;
  v12 = a4 - a5;
  if (a4 == a5)
    goto LABEL_33;
  if (a2 >= a3)
    goto LABEL_34;
  v11 = a6;
  v8 = (_QWORD *)result;
  v13 = *(_QWORD *)(a6 + 16);
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
    goto LABEL_35;
  while (1)
  {
    v16 = 0;
    v17 = v13 <= v7 ? v7 : v13;
    v18 = v17 - v7;
    do
    {
      if (v7 + v16 >= v6)
      {
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      if (v7 < 0)
        goto LABEL_25;
      if (v18 == v16)
        goto LABEL_26;
      v19 = *(_QWORD *)(v14 + 16);
      if (v19 <= v9 + v16)
        goto LABEL_27;
      *(_BYTE *)(v9 + v14 + 32 + v16) = *(_BYTE *)(v7 + v11 + 32 + v16);
      if (v7 + v16 >= v13 - 1 || v9 + v16 >= v19 - 1)
        goto LABEL_28;
      if (~v9 + v10 == v16)
        goto LABEL_21;
      ++v16;
    }
    while (v12 + v16);
    __break(1u);
LABEL_21:
    *v8 = v14;
    v7 += v16 + 1;
LABEL_22:
    if (v7 == v6)
      return result;
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v14);
    v14 = result;
  }
}

_QWORD *specialized Sequence._copySequenceContents(initializing:)(_QWORD *result, _BYTE *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  _OWORD *v12;
  __int128 *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _BYTE *v19;

  if (!a2)
  {
    a3 = 0;
    goto LABEL_28;
  }
  if (!a3)
  {
LABEL_28:
    *result = a4;
    result[1] = a3;
    return (_QWORD *)a3;
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v4 = *(_QWORD *)(a4 + 16);
  v5 = v4 - 1;
  if (v4 == 1)
  {
LABEL_27:
    a3 = v5;
    goto LABEL_28;
  }
  if (v4)
  {
    *a2 = *(_BYTE *)(a4 + 32);
    v6 = a3 - 1;
    if (a3 != 1)
    {
      if (v5 < v6)
        v6 = v4 - 1;
      if (v6 >= v4 - 2)
        v6 = v4 - 2;
      if (v6 >= a3 - 2)
        v6 = a3 - 2;
      v7 = v6 + 1;
      if (v7 <= 0x10 || ((unint64_t)&a2[-a4] & 0xFFFFFFFFFFFFFFF0) == 0x20)
      {
        v8 = 1;
        v9 = a2;
      }
      else
      {
        v10 = v7 & 0xF;
        if ((v7 & 0xF) == 0)
          v10 = 16;
        v11 = v7 - v10;
        v8 = v7 - v10 + 1;
        v9 = &a2[v11];
        v12 = a2 + 1;
        v13 = (__int128 *)(a4 + 33);
        do
        {
          v14 = *v13++;
          *v12++ = v14;
          v11 -= 16;
        }
        while (v11);
      }
      v15 = 0;
      v16 = v4 - v8;
      v17 = a3 - v8;
      v18 = v8 + a4 + 32;
      v19 = v9 + 1;
      while (v17 != v15)
      {
        if (v16 - 1 == v15)
          goto LABEL_27;
        if (v16 == v15)
          goto LABEL_30;
        v19[v15] = *(_BYTE *)(v18 + v15);
        if (v17 == ++v15)
          goto LABEL_28;
      }
      __break(1u);
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    goto LABEL_28;
  }
LABEL_32:
  __break(1u);
  __break(1u);
  return result;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _BYTE *v12;
  uint64_t v13;
  int64_t i;
  BOOL v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  int v19;

  v7 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  v8 = a3;
  if (!a3)
    goto LABEL_6;
  if (a3 < 0)
    goto LABEL_63;
  v9 = *(_QWORD *)(a4 + 16);
  if (v9 - 1 == a5)
  {
LABEL_5:
    v8 = 0;
LABEL_6:
    v10 = a5;
LABEL_7:
    *v7 = a4;
    v7[1] = a5;
    v7[2] = v10;
    return v8;
  }
  v11 = a2;
  v12 = (_BYTE *)(a4 + 32);
  v13 = 1;
  for (i = a5; ; i = v10)
  {
    v15 = i || v9 == 1;
    v16 = v15;
    if (v15)
      break;
    if (!v9)
      goto LABEL_61;
    if (*v12 != 47)
      goto LABEL_25;
    if ((unint64_t)v9 < 2)
      goto LABEL_62;
    v17 = 1;
    v10 = 1;
LABEL_48:
    *v11 = a4;
    v11[1] = i;
    v11[2] = v17;
    if (v13 == v8)
    {
      swift_bridgeObjectRetain();
      goto LABEL_7;
    }
    v9 = *(_QWORD *)(a4 + 16);
    if (v10 == v9 - 1)
    {
      swift_bridgeObjectRetain();
      v8 = v13;
      goto LABEL_7;
    }
    ++v13;
    v11 += 3;
    result = swift_bridgeObjectRetain();
  }
  if (v9 <= i || !v9)
    goto LABEL_60;
  if (i < 0)
    goto LABEL_56;
LABEL_25:
  v10 = v9 - 1;
  v17 = i;
  if (i != v9 - 1)
  {
    v17 = i;
    while (1)
    {
      if (v17 >= v10)
      {
        __break(1u);
        goto LABEL_54;
      }
      if (v12[v17] == 47)
        break;
      if (v10 == ++v17)
      {
        v17 = v9 - 1;
        break;
      }
    }
    if (v17 < i)
      goto LABEL_57;
  }
  if (i == v17)
    goto LABEL_55;
  if (v16)
  {
    if (v9 <= i)
      goto LABEL_58;
    if (i < 0)
      goto LABEL_59;
  }
  else
  {
    if (*v12 == 47)
    {
      v10 = 1;
      goto LABEL_48;
    }
    if (v9 <= i)
      goto LABEL_58;
  }
  if (i == v10)
  {
    v10 = i;
    goto LABEL_48;
  }
  v18 = i;
  while (v18 < v10)
  {
    v19 = v12[v18++];
    if (v19 == 47)
    {
      v10 = v18;
      goto LABEL_48;
    }
    if (v10 == v18)
      goto LABEL_48;
  }
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  __break(1u);
LABEL_60:
  __break(1u);
LABEL_61:
  __break(1u);
LABEL_62:
  __break(1u);
LABEL_63:
  __break(1u);
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t specialized MutableCollection<>._partitionImpl(by:)(uint64_t (*a1)(char *))
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  char v9;
  char v11;
  char v12;

  v3 = v1[1];
  if (v3 < 1)
    return 0;
  v5 = 0;
  v6 = *v1;
  do
  {
    v12 = *(_BYTE *)(v6 + v5);
    v8 = a1(&v12);
    if (v2)
      break;
    if ((v8 & 1) != 0)
    {
      while (v5 < --v3)
      {
        v11 = *(_BYTE *)(v6 + v3);
        v9 = a1(&v11);
        if ((v9 & 1) == 0)
        {
          if (v6)
          {
            v7 = *(_BYTE *)(v6 + v5);
            *(_BYTE *)(v6 + v5) = *(_BYTE *)(v6 + v3);
            *(_BYTE *)(v6 + v3) = v7;
            goto LABEL_5;
          }
          __break(1u);
          return v5;
        }
      }
      return v5;
    }
LABEL_5:
    ++v5;
  }
  while (v5 < v3);
  return v5;
}

uint64_t specialized MutableCollection._halfStablePartition(isSuffixElement:)(uint64_t (*a1)(char *))
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  char v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  v3 = v2;
  v4 = *v1;
  v5 = *(_QWORD *)(*v1 + 16);
  if (v5 == 1)
  {
    return 0;
  }
  else
  {
    v7 = v4 + 32;
    result = swift_bridgeObjectRetain();
    v9 = 33;
    while (1)
    {
      if (v9 - v5 == 33)
      {
        __break(1u);
LABEL_33:
        __break(1u);
        goto LABEL_34;
      }
      v19 = *(_BYTE *)(v7 + v9 - 33);
      result = a1(&v19);
      if (v3)
      {
        swift_bridgeObjectRelease();
        return v7;
      }
      if ((result & 1) != 0)
        break;
      if (v9 - ((v5 - 1) & ~((v5 - 1) >> 63)) == 33)
        goto LABEL_33;
      if (++v9 - v5 == 32)
      {
        swift_bridgeObjectRelease();
        return *(_QWORD *)(v4 + 16) - 1;
      }
    }
    result = swift_bridgeObjectRelease();
    v10 = *(_QWORD *)(v4 + 16);
    v7 = v9 - 33;
    if (v9 - 33 >= (uint64_t)(v10 - 1))
      goto LABEL_42;
    if (v9 - v10 == 31)
      return v7;
    while (1)
    {
      v11 = v9 - 32;
      if (v10 <= v9 - 32)
        break;
      v18 = *(_BYTE *)(v4 + v9);
      result = a1(&v18);
      if ((result & 1) != 0)
      {
        v10 = *(_QWORD *)(v4 + 16);
        v12 = v10 - 1;
      }
      else
      {
        if (v11 != v7)
        {
          if ((v7 & 0x8000000000000000) != 0)
            goto LABEL_37;
          v13 = *(_QWORD *)(v4 + 16);
          if (v13 <= v7)
            goto LABEL_38;
          if (v13 <= v11)
            goto LABEL_39;
          v14 = *(_BYTE *)(v4 + 32 + v7);
          v15 = *(_BYTE *)(v4 + v9);
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v4);
            v4 = result;
          }
          v16 = *(_QWORD *)(v4 + 16);
          if (v7 >= v16)
            goto LABEL_40;
          *(_BYTE *)(v4 + v7 + 32) = v15;
          *v1 = v4;
          if (v16 <= v11)
            goto LABEL_41;
          *(_BYTE *)(v4 + v9) = v14;
          *v1 = v4;
        }
        if ((v7 & 0x8000000000000000) != 0)
          goto LABEL_36;
        v10 = *(_QWORD *)(v4 + 16);
        v12 = v10 - 1;
        if ((uint64_t)v7 >= (uint64_t)(v10 - 1))
          goto LABEL_36;
        ++v7;
      }
      if ((uint64_t)v11 >= v12)
        goto LABEL_35;
      v17 = v9 - 31;
      ++v9;
      if (v17 == v12)
        return v7;
    }
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
  }
  return result;
}

uint64_t specialized RangeReplaceableCollection.init(repeating:count:)(char a1, uint64_t a2)
{
  uint64_t result;
  char *v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SystemChar>);
  result = swift_allocObject();
  v5 = (char *)result;
  *(_OWORD *)(result + 16) = xmmword_20AE2E8F0;
  *(_BYTE *)(result + 32) = 0;
  if (!a2)
    return (uint64_t)v5;
  if ((a2 & 0x8000000000000000) == 0)
  {
    v6 = 1;
    do
    {
      if (v6 >= *((_QWORD *)v5 + 3) >> 1)
      {
        v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)1, v6 + 1, 1, v5);
        v7 = *((_QWORD *)v5 + 2);
      }
      else
      {
        v7 = v6;
      }
      v8 = &v5[v6 + 31];
      memmove(&v5[v6 + 32], v8, v7 - (v6 - 1));
      v6 = *((_QWORD *)v5 + 2) + 1;
      *((_QWORD *)v5 + 2) = v6;
      *v8 = a1;
      --a2;
    }
    while (a2);
    return (uint64_t)v5;
  }
  __break(1u);
  return result;
}

uint64_t specialized SystemString.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000015 && a2 == 0x800000020AE2D070)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

_QWORD *specialized SystemString.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  void (*v13)(char *, uint64_t);
  uint64_t v14;
  _QWORD *v15;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SystemString.CodingKeys>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type SystemString.CodingKeys and conformance SystemString.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SystemChar]);
    lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type [SystemChar] and conformance <A> [A], &demangling cache variable for type metadata for [SystemChar], (uint64_t (*)(void))lazy protocol witness table accessor for type SystemChar and conformance SystemChar, MEMORY[0x24BEE12D0]);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v7 = v15;
    v9 = v15[2];
    if (!v9
      || (v10 = v9 - 1, *((_BYTE *)v15 + v9 + 31))
      || (v11 = specialized Collection<>.firstIndex(of:)(0, (uint64_t)v15), (v12 & 1) != 0)
      || v11 != v10)
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      lazy protocol witness table accessor for type DefaultIndices<FilePath.ComponentView> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type KeyedDecodingContainer<SystemString.CodingKeys> and conformance KeyedDecodingContainer<A>, &demangling cache variable for type metadata for KeyedDecodingContainer<SystemString.CodingKeys>, MEMORY[0x24BEE33F8]);
      static DecodingError.dataCorruptedError<A>(forKey:in:debugDescription:)();
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      swift_bridgeObjectRelease();
    }
    else
    {
      v13 = *(void (**)(char *, uint64_t))(v4 + 8);
      swift_bridgeObjectRetain();
      v13(v6, v3);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      swift_bridgeObjectRelease();
    }
  }
  return v7;
}

unint64_t lazy protocol witness table accessor for type SystemString.CodingKeys and conformance SystemString.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys;
  if (!lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for SystemString.CodingKeys, &unk_24C3D2898);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys;
  if (!lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for SystemString.CodingKeys, &unk_24C3D2898);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys;
  if (!lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for SystemString.CodingKeys, &unk_24C3D2898);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys;
  if (!lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for SystemString.CodingKeys, &unk_24C3D2898);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemString.CodingKeys and conformance SystemString.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SystemChar and conformance SystemChar()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SystemChar and conformance SystemChar;
  if (!lazy protocol witness table cache variable for type SystemChar and conformance SystemChar)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for SystemChar, &type metadata for SystemChar);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemChar and conformance SystemChar);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SystemChar and conformance SystemChar;
  if (!lazy protocol witness table cache variable for type SystemChar and conformance SystemChar)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for SystemChar, &type metadata for SystemChar);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemChar and conformance SystemChar);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SystemChar and conformance SystemChar;
  if (!lazy protocol witness table cache variable for type SystemChar and conformance SystemChar)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for SystemChar, &type metadata for SystemChar);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemChar and conformance SystemChar);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SystemChar and conformance SystemChar;
  if (!lazy protocol witness table cache variable for type SystemChar and conformance SystemChar)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for SystemChar, &type metadata for SystemChar);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemChar and conformance SystemChar);
  }
  return result;
}

_QWORD *partial apply for closure #1 in SystemString.withContiguousMutableStorageIfAvailable<A>(_:)(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t (*v5)(_QWORD *);
  _QWORD v6[2];

  v2 = result[1];
  v3 = __OFSUB__(v2, 1);
  v4 = v2 - 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    v5 = *(uint64_t (**)(_QWORD *))(v1 + 24);
    v6[0] = *result;
    v6[1] = v4;
    return (_QWORD *)v5(v6);
  }
  return result;
}

uint64_t partial apply for closure #1 in SystemString.withContiguousStorageIfAvailable<A>(_:)(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  v3 = __OFSUB__(a2, 1);
  v4 = a2 - 1;
  if (!v3)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 24))(result, v4);
  __break(1u);
  return result;
}

uint64_t partial apply for closure #1 in SystemString.withPlatformString<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return closure #1 in SystemString.withPlatformString<A>(_:)(a1, a2, v2[3], v2[4], v2[5], v2[2]);
}

uint64_t partial apply for closure #1 in closure #1 in SystemString.withPlatformString<A>(_:)(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v2 + 32))();
  if (v3)
    *a2 = v3;
  return result;
}

uint64_t storeEnumTagSinglePayload for SystemString.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_20AE2AC98 + 4 * byte_20AE2E900[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_20AE2ACB8 + 4 * byte_20AE2E905[v4]))();
}

_BYTE *sub_20AE2AC98(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_20AE2ACB8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_20AE2ACC0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_20AE2ACC8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_20AE2ACD0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_20AE2ACD8(_DWORD *result)
{
  *result = 0;
  return result;
}

void *type metadata accessor for SystemString.CodingKeys()
{
  return &unk_24C3D2898;
}

ValueMetadata *type metadata accessor for SystemChar()
{
  return &type metadata for SystemChar;
}

BOOL static FilePath.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return specialized static Array<A>.== infix(_:_:)(*a1, *a2);
}

System::FilePath __swiftcall FilePath.init()()
{
  _QWORD *v0;
  System::FilePath result;

  *v0 = &outlined read-only object #0 of FilePath.init();
  return result;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance FilePath.CodingKeys()
{
  return 0x656761726F74735FLL;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance FilePath.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x656761726F74735FLL && a2 == 0xE800000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FilePath.CodingKeys()
{
  lazy protocol witness table accessor for type FilePath.CodingKeys and conformance FilePath.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance FilePath.CodingKeys()
{
  lazy protocol witness table accessor for type FilePath.CodingKeys and conformance FilePath.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t FilePath.length.getter()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 16) - 1;
}

uint64_t FilePath.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  _QWORD v11[2];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<FilePath.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type FilePath.CodingKeys and conformance FilePath.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  lazy protocol witness table accessor for type SystemString and conformance SystemString();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v10 = v11[1];
  swift_bridgeObjectRetain();
  if (FilePath._invariantsSatisfied()())
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  else
  {
    swift_bridgeObjectRelease();
    type metadata accessor for DecodingError();
    swift_allocError();
    lazy protocol witness table accessor for type KeyedDecodingContainer<FilePath.CodingKeys> and conformance KeyedDecodingContainer<A>();
    static DecodingError.dataCorruptedError<A>(forKey:in:debugDescription:)();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

void FilePath.hash(into:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  Swift::UInt8 *v3;
  Swift::UInt8 v4;

  v1 = *v0;
  Hasher._combine(_:)(*(_QWORD *)(*v0 + 16));
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = (Swift::UInt8 *)(v1 + 32);
    do
    {
      v4 = *v3++;
      Hasher._combine(_:)(v4);
      --v2;
    }
    while (v2);
  }
}

uint64_t FilePath.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<FilePath.CodingKeys>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type FilePath.CodingKeys and conformance FilePath.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v9[1] = v7;
  lazy protocol witness table accessor for type SystemString and conformance SystemString();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

Swift::Int FilePath.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  Swift::UInt8 *v3;
  Swift::UInt8 v4;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(*(_QWORD *)(v1 + 16));
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = (Swift::UInt8 *)(v1 + 32);
    do
    {
      v4 = *v3++;
      Hasher._combine(_:)(v4);
      --v2;
    }
    while (v2);
  }
  return Hasher._finalize()();
}

uint64_t protocol witness for Decodable.init(from:) in conformance FilePath@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return FilePath.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance FilePath(_QWORD *a1)
{
  return FilePath.encode(to:)(a1);
}

unint64_t lazy protocol witness table accessor for type FilePath.CodingKeys and conformance FilePath.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.CodingKeys, &unk_24C3D2AE0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.CodingKeys, &unk_24C3D2AE0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.CodingKeys, &unk_24C3D2AE0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys;
  if (!lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys)
  {
    result = MEMORY[0x20BD3271C](&protocol conformance descriptor for FilePath.CodingKeys, &unk_24C3D2AE0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilePath.CodingKeys and conformance FilePath.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type KeyedDecodingContainer<FilePath.CodingKeys> and conformance KeyedDecodingContainer<A>()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type KeyedDecodingContainer<FilePath.CodingKeys> and conformance KeyedDecodingContainer<A>;
  if (!lazy protocol witness table cache variable for type KeyedDecodingContainer<FilePath.CodingKeys> and conformance KeyedDecodingContainer<A>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for KeyedDecodingContainer<FilePath.CodingKeys>);
    result = MEMORY[0x20BD3271C](MEMORY[0x24BEE33F8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type KeyedDecodingContainer<FilePath.CodingKeys> and conformance KeyedDecodingContainer<A>);
  }
  return result;
}

ValueMetadata *type metadata accessor for FilePath()
{
  return &type metadata for FilePath;
}

uint64_t storeEnumTagSinglePayload for FilePath.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_20AE2B4FC + 4 * byte_20AE2F054[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_20AE2B51C + 4 * byte_20AE2F059[v4]))();
}

_BYTE *sub_20AE2B4FC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_20AE2B51C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_20AE2B524(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_20AE2B52C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_20AE2B534(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_20AE2B53C(_DWORD *result)
{
  *result = 0;
  return result;
}

void *type metadata accessor for FilePath.CodingKeys()
{
  return &unk_24C3D2AE0;
}

uint64_t String._withPlatformString<A>(_:)()
{
  return String.withCString<A>(_:)();
}

ssize_t FileDescriptor._write(_:retryOnInterrupt:)(void *__buf, uint64_t a2, char a3, int __fd)
{
  size_t v7;
  ssize_t result;

  if (__buf)
    v7 = a2 - (_QWORD)__buf;
  else
    v7 = 0;
  while (1)
  {
    result = write(__fd, __buf, v7);
    if (result != -1)
      break;
    LODWORD(result) = MEMORY[0x20BD32218]();
    if ((a3 & 1) == 0 || (_DWORD)result != 4)
      return result;
  }
  return result;
}

uint64_t FileDescriptor._write(toAbsoluteOffset:_:retryOnInterrupt:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  return FileDescriptor._write(toAbsoluteOffset:_:retryOnInterrupt:)(a1, a2, a3, a4, a5, MEMORY[0x24BDAFA00]);
}

void static FileDescriptor._open(_:_:options:permissions:retryOnInterrupt:)(uint64_t a1, uint64_t a2, __int16 a3, int a4, char a5)
{
  int v8;
  int v9;

  while (1)
  {
    if ((a4 & 0x10000) == 0)
    {
      v8 = open(_:_:_:)();
      goto LABEL_5;
    }
    if ((a3 & 0x200) != 0)
      break;
    v8 = open(_:_:)();
LABEL_5:
    if (v8 == -1)
    {
      v9 = MEMORY[0x20BD32218]();
      if ((a5 & 1) != 0 && v9 == 4)
        continue;
    }
    return;
  }
  __break(1u);
}

unint64_t FileDescriptor._close()(int a1)
{
  unsigned int v1;
  unsigned int v2;

  v1 = close(a1);
  v2 = v1;
  if (v1 == -1)
    v1 = MEMORY[0x20BD32218]();
  return v1 | ((unint64_t)(v2 == -1) << 32);
}

off_t FileDescriptor._seek(offset:from:)(off_t a1, int a2, int a3)
{
  off_t result;

  result = lseek(a3, a1, a2);
  if (result == -1)
    return MEMORY[0x20BD32218]();
  return result;
}

ssize_t FileDescriptor._read(into:retryOnInterrupt:)(void *a1, uint64_t a2, char a3, int a4)
{
  size_t v7;
  ssize_t result;

  if (a1)
    v7 = a2 - (_QWORD)a1;
  else
    v7 = 0;
  while (1)
  {
    result = read(a4, a1, v7);
    if (result != -1)
      break;
    LODWORD(result) = MEMORY[0x20BD32218]();
    if ((a3 & 1) == 0 || (_DWORD)result != 4)
      return result;
  }
  return result;
}

uint64_t FileDescriptor._read(fromAbsoluteOffset:into:retryOnInterrupt:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  return FileDescriptor._write(toAbsoluteOffset:_:retryOnInterrupt:)(a1, a2, a3, a4, a5, MEMORY[0x24BDAF698]);
}

uint64_t FileDescriptor._write(toAbsoluteOffset:_:retryOnInterrupt:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v11;
  uint64_t result;

  if (a2)
    v11 = a3 - a2;
  else
    v11 = 0;
  while (1)
  {
    result = a6(a5, a2, v11, a1);
    if (result != -1)
      break;
    LODWORD(result) = MEMORY[0x20BD32218]();
    if ((a4 & 1) == 0 || (_DWORD)result != 4)
      return result;
  }
  return result;
}

unint64_t FileDescriptor._duplicate(as:retryOnInterrupt:)(uint64_t a1, char a2, int a3)
{
  unsigned int v6;
  unsigned int v7;

  do
  {
    if ((a1 & 0x100000000) != 0)
      v6 = dup(a3);
    else
      v6 = dup2(a3, a1);
    v7 = v6;
    if (v6 != -1)
      break;
    v6 = MEMORY[0x20BD32218]();
    if ((a2 & 1) == 0)
      break;
  }
  while (v6 == 4);
  return v6 | ((unint64_t)(v7 == -1) << 32);
}

uint64_t static FileDescriptor._pipe()()
{
  _QWORD v1[2];

  v1[1] = *MEMORY[0x24BDAC8D0];
  v1[0] = -1;
  if (pipe((int *)v1) == -1)
    return MEMORY[0x20BD32218]();
  else
    return v1[0];
}

unint64_t FileDescriptor._resize(to:retryOnInterrupt:)(off_t a1, char a2, int a3)
{
  unsigned int v6;
  unsigned int v7;

  do
  {
    v6 = ftruncate(a3, a1);
    v7 = v6;
    if (v6 != -1)
      break;
    v6 = MEMORY[0x20BD32218]();
    if ((a2 & 1) == 0)
      break;
  }
  while (v6 == 4);
  return v6 | ((unint64_t)(v7 == -1) << 32);
}

unint64_t protocol witness for Error._domain.getter in conformance Errno()
{
  return 0xD000000000000012;
}

unint64_t Errno._domain.getter()
{
  return 0xD000000000000012;
}

uint64_t protocol witness for Error._code.getter in conformance Errno()
{
  int *v0;

  return *v0;
}

uint64_t Errno._code.getter(uint64_t result)
{
  return (int)result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance Errno()
{
  lazy protocol witness table accessor for type Errno and conformance Errno();
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance Errno()
{
  lazy protocol witness table accessor for type Errno and conformance Errno();
  return RawRepresentable<>.encode(to:)();
}

uint64_t Errno.description.getter(int a1)
{
  if (strerror(a1))
    return String.init(cString:)();
  else
    return 0x206E776F6E6B6E75;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Errno()
{
  int *v0;

  return Errno.description.getter(*v0);
}

ValueMetadata *type metadata accessor for Errno()
{
  return &type metadata for Errno;
}

Swift::Void __swiftcall FilePath._normalizeSpecialDirectories()()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  char v3;
  int64_t v4;
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  unint64_t v22;
  char v23;
  char v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  int v32;

  v1 = v0;
  v2 = *v0;
  FilePath.isLexicallyNormal.getter();
  if ((v3 & 1) != 0)
    return;
  v4 = *(_QWORD *)(v2 + 16);
  if (v4 == 1)
    return;
  if (!v4)
  {
LABEL_94:
    __break(1u);
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }
  v32 = *(unsigned __int8 *)(v2 + 32);
  if (v32 == 47)
  {
    if (v4 == 2)
      return;
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  v7 = v5;
  do
  {
    if (v6 || v4 == 1)
      goto LABEL_17;
    if (!v4)
      goto LABEL_92;
    if (*(_BYTE *)(v2 + 32) != 47)
    {
LABEL_17:
      if (v4 <= v6 || !v4)
        goto LABEL_87;
      if (v6 < 0)
        goto LABEL_88;
      v10 = v4 - 1;
      v8 = v6;
      v9 = v6;
      if (v6 != v4 - 1)
      {
        if (v6 >= (unint64_t)(v4 - 1))
          goto LABEL_90;
        if (v6 >= (unint64_t)v4)
          goto LABEL_91;
        v11 = v6;
        if (*(_BYTE *)(v2 + v6 + 32) == 47)
        {
LABEL_34:
          v8 = v11 + 1;
          v10 = v11;
        }
        else
        {
          if (v6 + 1 != v10)
          {
            v12 = v6;
            while (v12 + 1 >= v6 && v12 + 1 < v10)
            {
              if (*(_BYTE *)(v2 + 33 + v12) == 47)
              {
                v11 = v12 + 1;
                goto LABEL_34;
              }
              if (v4 - 2 == ++v12)
                goto LABEL_32;
            }
            goto LABEL_80;
          }
LABEL_32:
          v8 = v4 - 1;
        }
        v9 = v10;
        if (v10 < v6)
          goto LABEL_89;
      }
      if (v4 <= v9)
        goto LABEL_86;
    }
    else
    {
      v8 = 1;
      v9 = 1;
    }
    if ((specialized Sequence<>.elementsEqual<A>(_:)((uint64_t)&outlined read-only object #0 of FilePath._normalizeSpecialDirectories(), v6, v9, v2) & 1) != 0)
    {
LABEL_9:
      v6 = v8;
      goto LABEL_10;
    }
    if ((specialized Sequence<>.elementsEqual<A>(_:)((uint64_t)&outlined read-only object #1 of FilePath._normalizeSpecialDirectories(), v6, v9, v2) & 1) == 0)goto LABEL_46;
    if (v32 == 47 && v7 == v5)
    {
      v6 = v8;
      v7 = v5;
      goto LABEL_10;
    }
    if (v7 == v5)
      goto LABEL_46;
    v14 = FilePath._parseComponent(priorTo:)(v7);
    if (v14 < 0 || v4 <= v15)
      goto LABEL_93;
    v16 = v14;
    if ((specialized Sequence<>.elementsEqual<A>(_:)((uint64_t)&outlined read-only object #2 of FilePath._normalizeSpecialDirectories(), v14, v15, v2) & 1) != 0)
    {
LABEL_46:
      if (v6 == v7)
      {
        v6 = v8;
        v7 = v8;
      }
      else if (v6 != v8)
      {
        v17 = v6 + 32;
        v18 = v7 + 32;
        while (1)
        {
          v19 = v17 - 32;
          v20 = v18 - 32;
          if (v18 != v17)
          {
            if ((v19 & 0x8000000000000000) != 0)
              goto LABEL_81;
            v21 = (char *)*v1;
            v22 = *(_QWORD *)(*v1 + 16);
            if (v22 <= v19)
              goto LABEL_82;
            if (v20 >= v22)
              goto LABEL_83;
            v23 = v21[v17];
            v24 = v21[v18];
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v21 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v21);
            v25 = *((_QWORD *)v21 + 2);
            if (v19 >= v25)
              goto LABEL_84;
            v21[v17] = v24;
            *v1 = (uint64_t)v21;
            if (v25 <= v20)
              goto LABEL_85;
            v21[v18] = v23;
            *v1 = (uint64_t)v21;
          }
          v26 = v17 - 31;
          if (__OFADD__(v19, 1))
            break;
          v27 = *(_QWORD *)(*v1 + 16) - 1;
          if ((uint64_t)v20 >= v27 || ((v20 | v19) & 0x8000000000000000) != 0 || (uint64_t)v19 >= v27)
            goto LABEL_79;
          ++v17;
          ++v18;
          if (v26 == v8)
          {
            v7 = v18 - 32;
            goto LABEL_9;
          }
        }
        __break(1u);
LABEL_79:
        __break(1u);
LABEL_80:
        __break(1u);
LABEL_81:
        __break(1u);
LABEL_82:
        __break(1u);
LABEL_83:
        __break(1u);
LABEL_84:
        __break(1u);
LABEL_85:
        __break(1u);
LABEL_86:
        __break(1u);
LABEL_87:
        __break(1u);
LABEL_88:
        __break(1u);
LABEL_89:
        __break(1u);
LABEL_90:
        __break(1u);
LABEL_91:
        __break(1u);
LABEL_92:
        __break(1u);
LABEL_93:
        __break(1u);
        goto LABEL_94;
      }
    }
    else
    {
      v6 = v8;
      v7 = v16;
    }
LABEL_10:
    v2 = *v1;
    v4 = *(_QWORD *)(*v1 + 16);
  }
  while (v6 < v4 - 1);
  if (v6 == v7)
    return;
  if (v4 <= v7)
    goto LABEL_95;
  specialized Array.replaceSubrange<A>(_:with:)(v7, v4 - 1);
  v28 = *v1;
  v29 = *(_QWORD *)(*v1 + 16);
  if (v29 == 1)
    return;
  if (!v29)
  {
LABEL_96:
    __break(1u);
    __break(1u);
LABEL_97:
    __break(1u);
    goto LABEL_98;
  }
  if (*(_BYTE *)(v28 + 32) != 47 || v29 != 2)
  {
    v30 = specialized BidirectionalCollection.last.getter(*v1);
    if ((v30 & 0x100) != 0)
      goto LABEL_99;
    if (v30 == 47)
    {
      v31 = *(_QWORD *)(v28 + 16);
      if (v31 == 1)
        goto LABEL_97;
      if (v31)
      {
        specialized RangeReplaceableCollection.remove(at:)(v31 - 2);
        return;
      }
LABEL_98:
      __break(1u);
LABEL_99:
      __break(1u);
    }
  }
}

Swift::tuple_componentEnd_Int_nextStart_Int __swiftcall FilePath._parseComponent(startingAt:)(Swift::Int startingAt)
{
  uint64_t *v1;
  Swift::Int v2;
  uint64_t v3;
  Swift::Int v4;
  Swift::Int v6;
  uint64_t v7;
  Swift::Int v8;
  Swift::tuple_componentEnd_Int_nextStart_Int result;

  v2 = startingAt;
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  if (startingAt || v4 == 1)
    goto LABEL_6;
  if (!v4)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (*(_BYTE *)(v3 + 32) != 47)
  {
LABEL_6:
    if (v4 > startingAt && v4 != 0)
    {
      if (startingAt < 0)
      {
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }
      v6 = v4 - 1;
      if (v6 == startingAt)
        goto LABEL_23;
      v7 = v3 + 32;
      while (startingAt >= v2 && startingAt < v6)
      {
        v8 = startingAt + 1;
        if (*(_BYTE *)(v7 + startingAt) == 47)
        {
          v2 = startingAt + 1;
          goto LABEL_23;
        }
        ++startingAt;
        if (v6 == v8)
        {
          startingAt = v6;
          v2 = v6;
          goto LABEL_23;
        }
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_21;
  }
  startingAt = 1;
  v2 = 1;
LABEL_23:
  result.nextStart = v2;
  result.componentEnd = startingAt;
  return result;
}

uint64_t FilePath._parseComponent(priorTo:)(uint64_t result)
{
  uint64_t v1;
  uint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v3 = result - 1;
  if (result < 1)
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v4 = result;
  result = *v2;
  v5 = *(_QWORD *)(*v2 + 16);
  v6 = v5 - 1;
  if (v5 == 1)
    goto LABEL_7;
  if (!v5)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (*(_BYTE *)(result + 32) != 47)
  {
LABEL_7:
    v8 = 0;
    if (v5 <= v4)
    {
LABEL_29:
      __break(1u);
LABEL_30:
      v7 = v6;
LABEL_31:
      result = swift_bridgeObjectRelease();
      if (v1 >= (uint64_t)v7)
        return v7;
      goto LABEL_40;
    }
  }
  else
  {
    v1 = 1;
    if (v4 == 1)
      return 0;
    v8 = 1;
    if (v5 <= v4)
      goto LABEL_29;
  }
  v12 = *v2;
  if (v6 == v4)
  {
    swift_bridgeObjectRetain();
    v1 = v4;
    if (v4 == v8)
    {
LABEL_10:
      swift_bridgeObjectRelease();
      return v1;
    }
    goto LABEL_13;
  }
  if (v3 < v6)
  {
    swift_bridgeObjectRetain();
    specialized Slice<>.remove(at:)(v3);
    v1 = v4;
    if (v4 == v8)
      goto LABEL_10;
LABEL_13:
    result = v12;
    v6 = v1;
    while (1)
    {
      v9 = v6 - 1;
      if (__OFSUB__(v6, 1))
        break;
      if (v9 >= (uint64_t)v6)
        goto LABEL_34;
      if (v9 < 0)
        goto LABEL_34;
      v10 = *(_QWORD *)(result + 16);
      if (v9 >= (uint64_t)(v10 - 1))
        goto LABEL_34;
      if (v9 >= v10)
        goto LABEL_35;
      if (*(_BYTE *)(result + v9 + 32) == 47)
        goto LABEL_30;
      if (!v10 || v6 >= v10)
        goto LABEL_36;
      if (v10 == 1)
        goto LABEL_37;
      v7 = v6 - 1;
      specialized Array.replaceSubrange<A>(_:with:)(v6 - 1, v6);
      result = v12;
      v11 = *(_QWORD *)(v12 + 16);
      if (!v11 || v7 >= v11)
        goto LABEL_38;
      if (v7 != v8)
      {
        v6 = v9;
        if (v7)
          continue;
      }
      goto LABEL_31;
    }
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
LABEL_42:
  __break(1u);
  __break(1u);
  return result;
}

Swift::Bool __swiftcall FilePath._invariantsSatisfied()()
{
  uint64_t *v0;
  uint64_t v1;
  BOOL v2;
  __int16 v3;
  uint64_t v4;
  int v5;
  char v6;
  uint64_t v8;

  v1 = *v0;
  v8 = *v0;
  swift_bridgeObjectRetain();
  SystemString._normalizeSeparators()();
  v2 = specialized static Array<A>.== infix(_:_:)(v1, v8);
  LOBYTE(v3) = swift_bridgeObjectRelease();
  if (!v2)
  {
    LOBYTE(v3) = 0;
    return v3;
  }
  v4 = *(_QWORD *)(v1 + 16);
  if (v4 == 1)
    goto LABEL_9;
  if (!v4)
  {
    __break(1u);
    __break(1u);
    __break(1u);
    goto LABEL_13;
  }
  v5 = *(unsigned __int8 *)(v1 + 32);
  if (v5 == 47 && v4 == 2)
    goto LABEL_9;
  v3 = specialized BidirectionalCollection.last.getter(v1);
  if ((v3 & 0x100) != 0)
  {
LABEL_13:
    __break(1u);
    return v3;
  }
  v6 = v3;
  LOBYTE(v3) = v3 != 47;
  if (v5 == 47 && v6 != 47)
LABEL_9:
    LOBYTE(v3) = 1;
  return v3;
}

Swift::Void __swiftcall SystemString._normalizeSeparators()()
{
  char **v0;
  char *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  int v5;
  char v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  int v11;
  unint64_t v12;
  int64_t v13;
  char v14;
  __int16 v15;
  uint64_t v16;

  v1 = *v0;
  v2 = *((_QWORD *)*v0 + 2);
  if (v2 == 1)
    return;
  if (!v2)
    goto LABEL_53;
  v3 = 0;
  v4 = 0;
  while (1)
  {
    if (v2 <= v3)
    {
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
      goto LABEL_51;
    }
    v5 = v1[v3 + 32];
    if (v4 != v3)
    {
      if (v2 <= v4)
        goto LABEL_44;
      v6 = v1[v4 + 32];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v1 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v1);
      v7 = *((_QWORD *)v1 + 2);
      if (v4 >= v7)
        goto LABEL_45;
      v1[v4 + 32] = v5;
      *v0 = v1;
      if (v7 <= v3)
        goto LABEL_46;
      v1[v3 + 32] = v6;
      *v0 = v1;
      v2 = *((_QWORD *)v1 + 2);
    }
    v8 = v2 - 1;
    if ((uint64_t)v3 >= (uint64_t)(v2 - 1) || (uint64_t)v4 >= v8)
      goto LABEL_43;
    ++v4;
    v9 = v3 + 1;
    if (v5 == 47 && (uint64_t)v9 < v8)
    {
      if (v9 >= v2)
        goto LABEL_47;
      if (v1[v9 + 32] == 47)
        break;
    }
LABEL_4:
    v3 = v9;
    if ((uint64_t)v9 >= v8)
      goto LABEL_26;
  }
  while (v2 - 3 != v3)
  {
    v11 = v1[v3++ + 34];
    if (v11 != 47)
    {
      v9 = v3 + 1;
      goto LABEL_4;
    }
  }
  v9 = v2 - 1;
LABEL_26:
  if (v4 >= v2 || v9 >= v2)
  {
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  v12 = v9 - v4;
  if (!v12)
    goto LABEL_33;
  if ((v12 & 0x8000000000000000) != 0)
    goto LABEL_48;
  v13 = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(v2 - 1, -(uint64_t)v12, 0, (uint64_t)v1);
  if ((v14 & 1) != 0)
    goto LABEL_54;
  if ((uint64_t)v2 <= v13)
    goto LABEL_49;
  specialized Array.replaceSubrange<A>(_:with:)(v13, v2 - 1);
  v1 = *v0;
  v2 = *((_QWORD *)*v0 + 2);
LABEL_33:
  if (v2 == 1)
    return;
  if (!v2)
    goto LABEL_50;
  if ((v1[32] == 47) == v2 - 1)
    return;
  v15 = specialized BidirectionalCollection.last.getter((uint64_t)v1);
  if ((v15 & 0x100) == 0)
  {
    if (v15 != 47)
      return;
    v16 = *((_QWORD *)v1 + 2);
    if (v16 != 1)
    {
      if (v16)
      {
        specialized RangeReplaceableCollection.remove(at:)(v16 - 2);
        return;
      }
      goto LABEL_52;
    }
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
LABEL_55:
  __break(1u);
}

Swift::tuple_rootEnd_Int_relativeBegin_Int __swiftcall SystemString._parseRoot()()
{
  Swift::Int v0;
  uint64_t v1;
  Swift::Int v2;
  Swift::tuple_rootEnd_Int_relativeBegin_Int result;

  v1 = *(_QWORD *)(v0 + 16);
  if (v1 == 1)
  {
    v0 = 0;
    v2 = 0;
  }
  else if (v1)
  {
    v0 = *(unsigned __int8 *)(v0 + 32) == 47;
    v2 = v0;
  }
  else
  {
    __break(1u);
  }
  result.relativeBegin = v2;
  result.rootEnd = v0;
  return result;
}

unint64_t specialized Slice<>.remove(at:)(unint64_t a1)
{
  unint64_t *v1;
  unint64_t *v2;
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t result;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;

  v2 = v1;
  v4 = v1[2];
  v3 = v1 + 2;
  v5 = *v2;
  v6 = *(_QWORD *)(v4 + 16);
  if (*v2 >= v6)
  {
    __break(1u);
    goto LABEL_8;
  }
  v7 = v2[1];
  if (v7 >= v6)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  result = specialized RangeReplaceableCollection.remove(at:)(a1);
  v9 = *(_QWORD *)(*v3 + 16);
  if (v9 <= v5)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v10 = v7 + ~v5;
  *v2 = v5;
  v11 = __OFADD__(v5, v10);
  v12 = v5 + v10;
  if (v11)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v12 < v9)
  {
    v2[1] = v12;
    return result;
  }
LABEL_11:
  __break(1u);
  return open(_:_:_:)();
}

uint64_t open(_:_:_:)()
{
  return MEMORY[0x24BEE5350]();
}

uint64_t open(_:_:)()
{
  return MEMORY[0x24BEE5358]();
}

uint64_t errno.getter()
{
  return MEMORY[0x24BEE76B0]();
}

uint64_t MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)()
{
  return MEMORY[0x24BEE0838]();
}

uint64_t String.withCString<A>(_:)()
{
  return MEMORY[0x24BEE0A38]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t String.init(validatingUTF8:)()
{
  return MEMORY[0x24BEE0A60]();
}

uint64_t String.debugDescription.getter()
{
  return MEMORY[0x24BEE0A78]();
}

uint64_t static String._fromUTF8Repairing(_:)()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t String.index(after:)()
{
  return MEMORY[0x24BEE0B70]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x24BEE0D98]();
}

{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t dispatch thunk of Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x24BEE0E10]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t UnsafeRawBufferPointer.init<A>(_:)()
{
  return MEMORY[0x24BEE0FA0]();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x24BEE1028]();
}

{
  return MEMORY[0x24BEE1038]();
}

{
  return MEMORY[0x24BEE1050]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x24BEE10A8]();
}

{
  return MEMORY[0x24BEE10B8]();
}

{
  return MEMORY[0x24BEE10D0]();
}

uint64_t Array.replaceSubrange<A>(_:with:)()
{
  return MEMORY[0x24BEE1148]();
}

uint64_t Array.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x24BEE1158]();
}

uint64_t Array.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x24BEE11B0]();
}

uint64_t Array.withContiguousMutableStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x24BEE11C0]();
}

uint64_t Array.init<A>(_:)()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t dispatch thunk of Collection.indices.getter()
{
  return MEMORY[0x24BEE18F8]();
}

uint64_t dispatch thunk of Collection.isEmpty.getter()
{
  return MEMORY[0x24BEE1900]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t RangeReplaceableCollection.append<A>(contentsOf:)()
{
  return MEMORY[0x24BEE1AC0]();
}

uint64_t RangeReplaceableCollection.insert<A>(contentsOf:at:)()
{
  return MEMORY[0x24BEE1AD8]();
}

uint64_t RangeReplaceableCollection.init<A>(_:)()
{
  return MEMORY[0x24BEE1B08]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t _StringGuts.foreignErrorCorrectedScalar(startingAt:)()
{
  return MEMORY[0x24BEE2508]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t StaticString.description.getter()
{
  return MEMORY[0x24BEE25B8]();
}

uint64_t static DecodingError.dataCorruptedError<A>(forKey:in:debugDescription:)()
{
  return MEMORY[0x24BEE26C0]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t _decodeScalar(_:startingAt:)()
{
  return MEMORY[0x24BEE2840]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t Slice.indices.getter()
{
  return MEMORY[0x24BEE41C0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
  MEMORY[0x24BEE4300](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt16 a1)
{
  MEMORY[0x24BEE4308](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
  MEMORY[0x24BEE4310](*(_QWORD *)&a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x24BEE4A10]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int dup(int a1)
{
  return MEMORY[0x24BDAE0B8](*(_QWORD *)&a1);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x24BDAE0C0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x24BDAE548](*(_QWORD *)&a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x24BDAEBA0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_destruct(ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return MEMORY[0x24BDAEBC0](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&srdelta, guard);
}

kern_return_t mach_port_extract_right(ipc_space_t task, mach_port_name_t name, mach_msg_type_name_t msgt_name, mach_port_t *poly, mach_msg_type_name_t *polyPoly)
{
  return MEMORY[0x24BDAEBC8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgt_name, poly, polyPoly);
}

kern_return_t mach_port_get_attributes(ipc_space_read_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return MEMORY[0x24BDAEBD0](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_guard(ipc_space_t task, mach_port_name_t name, mach_port_context_t guard, BOOLean_t strict)
{
  return MEMORY[0x24BDAEBE0](*(_QWORD *)&task, *(_QWORD *)&name, guard, *(_QWORD *)&strict);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x24BDAEBE8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_set_mscount(ipc_space_t task, mach_port_name_t name, mach_port_mscount_t mscount)
{
  return MEMORY[0x24BDAEC18](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&mscount);
}

kern_return_t mach_port_unguard(ipc_space_t task, mach_port_name_t name, mach_port_context_t guard)
{
  return MEMORY[0x24BDAEC28](*(_QWORD *)&task, *(_QWORD *)&name, guard);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

int pipe(int a1[2])
{
  return MEMORY[0x24BDAF5D0](a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAFA00](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

