uint64_t XPC_TYPE_DICTIONARY.getter()
{
  return MEMORY[0x1E0C812F8];
}

uint64_t XPC_ERROR_KEY_DESCRIPTION.getter(_QWORD *a1, uint64_t a2)
{
  if (*a1 != -1)
    swift_once();
  return *(_QWORD *)a2;
}

uint64_t XPC_EVENT_KEY_NAME.getter()
{
  return XPC_ERROR_KEY_DESCRIPTION.getter(&one-time initialization token for XPC_EVENT_KEY_NAME, (uint64_t)&XPC_EVENT_KEY_NAME);
}

unint64_t instantiation function for generic protocol witness table for Int(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type Int and conformance Int();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    result = MEMORY[0x1DF0F49E8](MEMORY[0x1E0DEB470], MEMORY[0x1E0DEB418]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance Int()
{
  return 1;
}

unint64_t instantiation function for generic protocol witness table for Int8(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type Int8 and conformance Int8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type Int8 and conformance Int8()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int8 and conformance Int8;
  if (!lazy protocol witness table cache variable for type Int8 and conformance Int8)
  {
    result = MEMORY[0x1DF0F49E8](MEMORY[0x1E0DEDAA8], MEMORY[0x1E0DEDA70]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int8 and conformance Int8);
  }
  return result;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance Int8()
{
  return 2;
}

unint64_t instantiation function for generic protocol witness table for Int16(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type Int16 and conformance Int16();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type Int16 and conformance Int16()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int16 and conformance Int16;
  if (!lazy protocol witness table cache variable for type Int16 and conformance Int16)
  {
    result = MEMORY[0x1DF0F49E8](MEMORY[0x1E0DEDB90], MEMORY[0x1E0DEDB58]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int16 and conformance Int16);
  }
  return result;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance Int16()
{
  return 3;
}

unint64_t instantiation function for generic protocol witness table for Int32(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type Int32 and conformance Int32();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type Int32 and conformance Int32()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    result = MEMORY[0x1DF0F49E8](MEMORY[0x1E0DEDC10], MEMORY[0x1E0DEDBC8]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
  }
  return result;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance Int32()
{
  return 4;
}

unint64_t instantiation function for generic protocol witness table for Int64(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type Int64 and conformance Int64();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type Int64 and conformance Int64()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int64 and conformance Int64;
  if (!lazy protocol witness table cache variable for type Int64 and conformance Int64)
  {
    result = MEMORY[0x1DF0F49E8](MEMORY[0x1E0DEDCB0], MEMORY[0x1E0DEDC60]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int64 and conformance Int64);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int64 and conformance Int64;
  if (!lazy protocol witness table cache variable for type Int64 and conformance Int64)
  {
    result = MEMORY[0x1DF0F49E8](MEMORY[0x1E0DEDCA0], MEMORY[0x1E0DEDC60]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int64 and conformance Int64);
  }
  return result;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance Int64()
{
  return 5;
}

unint64_t instantiation function for generic protocol witness table for UInt(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type UInt and conformance UInt();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt and conformance UInt()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UInt and conformance UInt;
  if (!lazy protocol witness table cache variable for type UInt and conformance UInt)
  {
    result = MEMORY[0x1DF0F49E8](MEMORY[0x1E0DEBBE0], MEMORY[0x1E0DEBB98]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt and conformance UInt);
  }
  return result;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance UInt()
{
  return 6;
}

unint64_t instantiation function for generic protocol witness table for UInt8(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type UInt8 and conformance UInt8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt8 and conformance UInt8()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UInt8 and conformance UInt8;
  if (!lazy protocol witness table cache variable for type UInt8 and conformance UInt8)
  {
    result = MEMORY[0x1DF0F49E8](MEMORY[0x1E0DEDEB0], MEMORY[0x1E0DEDE70]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt8 and conformance UInt8);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UInt8 and conformance UInt8;
  if (!lazy protocol witness table cache variable for type UInt8 and conformance UInt8)
  {
    result = MEMORY[0x1DF0F49E8](MEMORY[0x1E0DEDEA0], MEMORY[0x1E0DEDE70]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt8 and conformance UInt8);
  }
  return result;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance UInt8()
{
  return 7;
}

unint64_t instantiation function for generic protocol witness table for UInt16(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type UInt16 and conformance UInt16();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt16 and conformance UInt16()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UInt16 and conformance UInt16;
  if (!lazy protocol witness table cache variable for type UInt16 and conformance UInt16)
  {
    result = MEMORY[0x1DF0F49E8](MEMORY[0x1E0DEE0B0], MEMORY[0x1E0DEE068]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt16 and conformance UInt16);
  }
  return result;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance UInt16()
{
  return 8;
}

unint64_t instantiation function for generic protocol witness table for UInt32(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt32 and conformance UInt32()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    result = MEMORY[0x1DF0F49E8](MEMORY[0x1E0DEE148], MEMORY[0x1E0DEE0F8]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
  }
  return result;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance UInt32()
{
  return 9;
}

unint64_t instantiation function for generic protocol witness table for UInt64(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type UInt64 and conformance UInt64();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt64 and conformance UInt64()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UInt64 and conformance UInt64;
  if (!lazy protocol witness table cache variable for type UInt64 and conformance UInt64)
  {
    result = MEMORY[0x1DF0F49E8](MEMORY[0x1E0DEE1D0], MEMORY[0x1E0DEE190]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt64 and conformance UInt64);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UInt64 and conformance UInt64;
  if (!lazy protocol witness table cache variable for type UInt64 and conformance UInt64)
  {
    result = MEMORY[0x1DF0F49E8](MEMORY[0x1E0DEE1C8], MEMORY[0x1E0DEE190]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt64 and conformance UInt64);
  }
  return result;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance UInt64()
{
  return 10;
}

void type metadata accessor for xpc_session_create_flags_t(uint64_t a1)
{
  type metadata accessor for xpc_session_create_flags_t(a1, (unint64_t *)&lazy cache variable for type metadata for xpc_session_create_flags_t);
}

_QWORD *specialized static Int8.decodeValue(from:withCodingMetadata:)(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = result[4];
  v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    v3 = result[6];
    if (v3 >= v2 - v1)
    {
      v8 = type metadata accessor for DecodingError();
      swift_allocError();
      v10 = v9;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v8 - 8) + 104))(v10, *MEMORY[0x1E0DEC458], v8);
      swift_willThrow();
      return (_QWORD *)v7;
    }
    v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2)
        goto LABEL_14;
      v6 = v3 + 1;
      v7 = *(unsigned __int8 *)(result[3] + v4);
      result[6] = v6;
      return (_QWORD *)v7;
    }
  }
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  type metadata accessor for xpc_session_create_flags_t(a1, (unint64_t *)&lazy cache variable for type metadata for os_unfair_lock_s);
}

void type metadata accessor for xpc_session_create_flags_t(uint64_t a1, unint64_t *a2)
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

uint64_t XPCSession.InitializationOptions.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t XPCSession.InitializationOptions.init(rawValue:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t static XPCSession.InitializationOptions.none.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = static XPCSession.InitializationOptions.none;
  return result;
}

uint64_t static XPCSession.InitializationOptions.none.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *a1;
  result = swift_beginAccess();
  static XPCSession.InitializationOptions.none = v1;
  return result;
}

uint64_t (*static XPCSession.InitializationOptions.none.modify())()
{
  swift_beginAccess();
  return static XPCSession.InitializationOptions.inactive.modify;
}

uint64_t static XPCSession.InitializationOptions.inactive.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = static XPCSession.InitializationOptions.inactive;
  return result;
}

uint64_t static XPCSession.InitializationOptions.inactive.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *a1;
  result = swift_beginAccess();
  static XPCSession.InitializationOptions.inactive = v1;
  return result;
}

uint64_t (*static XPCSession.InitializationOptions.inactive.modify())()
{
  swift_beginAccess();
  return static XPCSession.InitializationOptions.inactive.modify;
}

uint64_t static XPCSession.InitializationOptions.privileged.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = static XPCSession.InitializationOptions.privileged;
  return result;
}

uint64_t static XPCSession.InitializationOptions.privileged.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *a1;
  result = swift_beginAccess();
  static XPCSession.InitializationOptions.privileged = v1;
  return result;
}

uint64_t (*static XPCSession.InitializationOptions.privileged.modify())()
{
  swift_beginAccess();
  return static XPCSession.InitializationOptions.privileged.modify;
}

_QWORD *protocol witness for OptionSet.init(rawValue:) in conformance XPCSession.InitializationOptions@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void protocol witness for SetAlgebra.init() in conformance XPCSession.InitializationOptions(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *protocol witness for SetAlgebra.union(_:) in conformance XPCSession.InitializationOptions@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.intersection(_:) in conformance XPCSession.InitializationOptions@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance XPCSession.InitializationOptions@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance XPCSession.InitializationOptions(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *protocol witness for SetAlgebra.remove(_:) in conformance XPCSession.InitializationOptions@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *protocol witness for SetAlgebra.update(with:) in conformance XPCSession.InitializationOptions@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *protocol witness for SetAlgebra.formUnion(_:) in conformance XPCSession.InitializationOptions(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.formIntersection(_:) in conformance XPCSession.InitializationOptions(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance XPCSession.InitializationOptions(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.subtracting(_:) in conformance XPCSession.InitializationOptions@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance XPCSession.InitializationOptions(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance XPCSession.InitializationOptions(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance XPCSession.InitializationOptions(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance XPCSession.InitializationOptions()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance XPCSession.InitializationOptions()
{
  return SetAlgebra.init<A>(_:)();
}

_QWORD *protocol witness for SetAlgebra.subtract(_:) in conformance XPCSession.InitializationOptions(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance XPCSession.InitializationOptions@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance XPCSession.InitializationOptions(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance XPCSession.InitializationOptions(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:)(void *a1, _xpc_rich_error_s *a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL can_retry;
  id v30;
  uint64_t v31;
  _QWORD v33[6];
  uint64_t v34;

  if (!a1)
  {
    if (a2)
    {
      lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
      swift_allocError();
      v23 = v22;
      if (MEMORY[0x1DF0F4CB8](a2) == MEMORY[0x1E0C81368])
      {
        v34 = a6;
        v24 = xpc_rich_error_copy_description(a2);
        if (v24)
        {
          v25 = v24;
          v26 = String.init(cString:)();
          v28 = v27;
          can_retry = xpc_rich_error_can_retry(a2);
          free(v25);
          *(_BYTE *)v23 = can_retry;
          *(_QWORD *)(v23 + 8) = v26;
          *(_QWORD *)(v23 + 16) = v28;
          swift_willThrow();
          outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
          swift_unknownObjectRelease();
          type metadata accessor for XPCSession();
          v18 = v34;
          swift_deallocPartialClassInstance();
          return v18;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000001BLL, 0x80000001DF04E630);
  }
  v11 = *a5;
  *(_QWORD *)(a6 + 16) = a1;
  if (a3)
  {
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = a3;
    *(_QWORD *)(v12 + 24) = a4;
    v34 = v11;
    v13 = a1;
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
    v14 = v13;
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
    v15 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<XPCReceivedMessage, XPCRichError>) -> ());
    v17 = v16;
    v18 = a6;
    v19 = *(void **)(a6 + 16);
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = v15;
    *(_QWORD *)(v20 + 24) = v17;
    v33[4] = closure #1 in XPCSession.setCancellationHandler(_:)partial apply;
    v33[5] = v20;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 1107296256;
    v33[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
    v33[3] = &block_descriptor_151;
    v21 = _Block_copy(v33);
    swift_retain();
    swift_release();
    _swift_xpc_session_set_cancel_handler(v19, v21);
    _Block_release(v21);
    v11 = v34;
    swift_release();
    outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
  }
  else
  {
    v18 = a6;
    v30 = a1;
  }
  swift_beginAccess();
  if ((static XPCSession.InitializationOptions.inactive & ~v11) != 0)
  {
    XPCSession.activate()();
    if (v31)
      swift_release();
  }
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);

  swift_unknownObjectRelease();
  return v18;
}

{
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL can_retry;
  id v30;
  uint64_t v31;
  _QWORD v33[6];
  uint64_t v34;

  if (!a1)
  {
    if (a2)
    {
      lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
      swift_allocError();
      v23 = v22;
      if (MEMORY[0x1DF0F4CB8](a2) == MEMORY[0x1E0C81368])
      {
        v34 = a6;
        v24 = xpc_rich_error_copy_description(a2);
        if (v24)
        {
          v25 = v24;
          v26 = String.init(cString:)();
          v28 = v27;
          can_retry = xpc_rich_error_can_retry(a2);
          free(v25);
          *(_BYTE *)v23 = can_retry;
          *(_QWORD *)(v23 + 8) = v26;
          *(_QWORD *)(v23 + 16) = v28;
          swift_willThrow();
          outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
          swift_unknownObjectRelease();
          type metadata accessor for XPCSession();
          v18 = v34;
          swift_deallocPartialClassInstance();
          return v18;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000001BLL, 0x80000001DF04E630);
  }
  v11 = *a5;
  *(_QWORD *)(a6 + 16) = a1;
  if (a3)
  {
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = a3;
    *(_QWORD *)(v12 + 24) = a4;
    v34 = v11;
    v13 = a1;
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
    v14 = v13;
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
    v15 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<XPCReceivedMessage, XPCRichError>) -> ());
    v17 = v16;
    v18 = a6;
    v19 = *(void **)(a6 + 16);
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = v15;
    *(_QWORD *)(v20 + 24) = v17;
    v33[4] = closure #1 in XPCSession.setCancellationHandler(_:)partial apply;
    v33[5] = v20;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 1107296256;
    v33[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
    v33[3] = &block_descriptor_107;
    v21 = _Block_copy(v33);
    swift_retain();
    swift_release();
    _swift_xpc_session_set_cancel_handler(v19, v21);
    _Block_release(v21);
    v11 = v34;
    swift_release();
    outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
  }
  else
  {
    v18 = a6;
    v30 = a1;
  }
  swift_beginAccess();
  if ((static XPCSession.InitializationOptions.inactive & ~v11) != 0)
  {
    XPCSession.activate()();
    if (v31)
      swift_release();
  }
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);

  swift_unknownObjectRelease();
  return v18;
}

{
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL can_retry;
  id v30;
  uint64_t v31;
  _QWORD v33[6];
  uint64_t v34;

  if (!a1)
  {
    if (a2)
    {
      lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
      swift_allocError();
      v23 = v22;
      if (MEMORY[0x1DF0F4CB8](a2) == MEMORY[0x1E0C81368])
      {
        v34 = a6;
        v24 = xpc_rich_error_copy_description(a2);
        if (v24)
        {
          v25 = v24;
          v26 = String.init(cString:)();
          v28 = v27;
          can_retry = xpc_rich_error_can_retry(a2);
          free(v25);
          *(_BYTE *)v23 = can_retry;
          *(_QWORD *)(v23 + 8) = v26;
          *(_QWORD *)(v23 + 16) = v28;
          swift_willThrow();
          outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
          swift_unknownObjectRelease();
          type metadata accessor for XPCSession();
          v18 = v34;
          swift_deallocPartialClassInstance();
          return v18;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000001BLL, 0x80000001DF04E630);
  }
  v11 = *a5;
  *(_QWORD *)(a6 + 16) = a1;
  if (a3)
  {
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = a3;
    *(_QWORD *)(v12 + 24) = a4;
    v34 = v11;
    v13 = a1;
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
    v14 = v13;
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
    v15 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<XPCReceivedMessage, XPCRichError>) -> ());
    v17 = v16;
    v18 = a6;
    v19 = *(void **)(a6 + 16);
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = v15;
    *(_QWORD *)(v20 + 24) = v17;
    v33[4] = closure #1 in XPCSession.setCancellationHandler(_:)partial apply;
    v33[5] = v20;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 1107296256;
    v33[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
    v33[3] = &block_descriptor_85;
    v21 = _Block_copy(v33);
    swift_retain();
    swift_release();
    _swift_xpc_session_set_cancel_handler(v19, v21);
    _Block_release(v21);
    v11 = v34;
    swift_release();
    outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
  }
  else
  {
    v18 = a6;
    v30 = a1;
  }
  swift_beginAccess();
  if ((static XPCSession.InitializationOptions.inactive & ~v11) != 0)
  {
    XPCSession.activate()();
    if (v31)
      swift_release();
  }
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);

  swift_unknownObjectRelease();
  return v18;
}

{
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL can_retry;
  id v30;
  uint64_t v31;
  _QWORD v33[6];
  uint64_t v34;

  if (!a1)
  {
    if (a2)
    {
      lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
      swift_allocError();
      v23 = v22;
      if (MEMORY[0x1DF0F4CB8](a2) == MEMORY[0x1E0C81368])
      {
        v34 = a6;
        v24 = xpc_rich_error_copy_description(a2);
        if (v24)
        {
          v25 = v24;
          v26 = String.init(cString:)();
          v28 = v27;
          can_retry = xpc_rich_error_can_retry(a2);
          free(v25);
          *(_BYTE *)v23 = can_retry;
          *(_QWORD *)(v23 + 8) = v26;
          *(_QWORD *)(v23 + 16) = v28;
          swift_willThrow();
          outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
          swift_unknownObjectRelease();
          type metadata accessor for XPCSession();
          v18 = v34;
          swift_deallocPartialClassInstance();
          return v18;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000001BLL, 0x80000001DF04E630);
  }
  v11 = *a5;
  *(_QWORD *)(a6 + 16) = a1;
  if (a3)
  {
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = a3;
    *(_QWORD *)(v12 + 24) = a4;
    v34 = v11;
    v13 = a1;
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
    v14 = v13;
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
    v15 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<XPCReceivedMessage, XPCRichError>) -> ());
    v17 = v16;
    v18 = a6;
    v19 = *(void **)(a6 + 16);
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = v15;
    *(_QWORD *)(v20 + 24) = v17;
    v33[4] = closure #1 in XPCSession.setCancellationHandler(_:)partial apply;
    v33[5] = v20;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 1107296256;
    v33[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
    v33[3] = &block_descriptor_74;
    v21 = _Block_copy(v33);
    swift_retain();
    swift_release();
    _swift_xpc_session_set_cancel_handler(v19, v21);
    _Block_release(v21);
    v11 = v34;
    swift_release();
    outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
  }
  else
  {
    v18 = a6;
    v30 = a1;
  }
  swift_beginAccess();
  if ((static XPCSession.InitializationOptions.inactive & ~v11) != 0)
  {
    XPCSession.activate()();
    if (v31)
      swift_release();
  }
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);

  swift_unknownObjectRelease();
  return v18;
}

uint64_t specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:)(void *a1, _xpc_rich_error_s *a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL can_retry;
  id v35;
  uint64_t v36;
  _QWORD aBlock[6];
  uint64_t v38;

  v9 = a7;
  if (!a1)
  {
    if (a2)
    {
      lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
      v25 = swift_allocError();
      v27 = v26;
      if (MEMORY[0x1DF0F4CB8](a2) == MEMORY[0x1E0C81368])
      {
        v36 = v9;
        v9 = v25;
        v38 = a8;
        v28 = xpc_rich_error_copy_description(a2);
        if (v28)
        {
          v29 = v28;
          v30 = String.init(cString:)();
          v32 = v31;
          can_retry = xpc_rich_error_can_retry(a2);
          free(v29);
          *(_BYTE *)v27 = can_retry;
          *(_QWORD *)(v27 + 8) = v30;
          *(_QWORD *)(v27 + 16) = v32;
          swift_willThrow();
          outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
          swift_unknownObjectRelease();
          type metadata accessor for XPCSession();
          swift_deallocPartialClassInstance();
          v24 = v36;
          goto LABEL_13;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
    outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(v9);
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000001BLL, 0x80000001DF04E630);
  }
  v38 = *a5;
  *(_QWORD *)(a6 + 16) = a1;
  if (a7)
  {
    v15 = a1;
    XPCSession.setIncomingMessageHandler(_:)(v9);
    if (!a3)
      goto LABEL_5;
    goto LABEL_4;
  }
  v35 = a1;
  if (a3)
  {
LABEL_4:
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = a3;
    *(_QWORD *)(v16 + 24) = a4;
    swift_retain_n();
    v17 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<XPCReceivedMessage, XPCRichError>) -> ());
    v19 = v18;
    v20 = *(void **)(a6 + 16);
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = v17;
    *(_QWORD *)(v21 + 24) = v19;
    aBlock[4] = closure #1 in XPCSession.setCancellationHandler(_:)partial apply;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
    aBlock[3] = &block_descriptor_140;
    v22 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    _swift_xpc_session_set_cancel_handler(v20, v22);
    _Block_release(v22);
    swift_release();
    outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
  }
LABEL_5:
  swift_beginAccess();
  if ((static XPCSession.InitializationOptions.inactive & ~v38) != 0)
  {
    XPCSession.activate()();
    if (v23)
      swift_release();
  }
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);

  swift_unknownObjectRelease();
  v24 = v9;
LABEL_13:
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(v24);
  return a6;
}

{
  uint64_t v9;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL can_retry;
  id v35;
  uint64_t v36;
  _QWORD aBlock[6];
  uint64_t v38;

  v9 = a7;
  if (!a1)
  {
    if (a2)
    {
      lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
      v25 = swift_allocError();
      v27 = v26;
      if (MEMORY[0x1DF0F4CB8](a2) == MEMORY[0x1E0C81368])
      {
        v36 = v9;
        v9 = v25;
        v38 = a8;
        v28 = xpc_rich_error_copy_description(a2);
        if (v28)
        {
          v29 = v28;
          v30 = String.init(cString:)();
          v32 = v31;
          can_retry = xpc_rich_error_can_retry(a2);
          free(v29);
          *(_BYTE *)v27 = can_retry;
          *(_QWORD *)(v27 + 8) = v30;
          *(_QWORD *)(v27 + 16) = v32;
          swift_willThrow();
          outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
          swift_unknownObjectRelease();
          type metadata accessor for XPCSession();
          swift_deallocPartialClassInstance();
          v24 = v36;
          goto LABEL_13;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
    outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(v9);
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000001BLL, 0x80000001DF04E630);
  }
  v38 = *a5;
  *(_QWORD *)(a6 + 16) = a1;
  if (a7)
  {
    v15 = a1;
    XPCSession.setIncomingMessageHandler(_:)(v9);
    if (!a3)
      goto LABEL_5;
    goto LABEL_4;
  }
  v35 = a1;
  if (a3)
  {
LABEL_4:
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = a3;
    *(_QWORD *)(v16 + 24) = a4;
    swift_retain_n();
    v17 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<XPCReceivedMessage, XPCRichError>) -> ());
    v19 = v18;
    v20 = *(void **)(a6 + 16);
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = v17;
    *(_QWORD *)(v21 + 24) = v19;
    aBlock[4] = closure #1 in XPCSession.setCancellationHandler(_:)partial apply;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
    aBlock[3] = &block_descriptor_118;
    v22 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    _swift_xpc_session_set_cancel_handler(v20, v22);
    _Block_release(v22);
    swift_release();
    outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
  }
LABEL_5:
  swift_beginAccess();
  if ((static XPCSession.InitializationOptions.inactive & ~v38) != 0)
  {
    XPCSession.activate()();
    if (v23)
      swift_release();
  }
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);

  swift_unknownObjectRelease();
  v24 = v9;
LABEL_13:
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(v24);
  return a6;
}

uint64_t XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:)(void *a1, _xpc_rich_error_s *a2, uint64_t a3, void *a4, uint64_t *a5, void (*a6)(uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL can_retry;
  _QWORD v31[6];
  id v32;

  v7 = v6;
  if (!a1)
  {
    if (a2)
    {
      lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
      swift_allocError();
      v23 = v22;
      if (MEMORY[0x1DF0F4CB8](a2) == MEMORY[0x1E0C81368])
      {
        v32 = a4;
        v24 = xpc_rich_error_copy_description(a2);
        if (v24)
        {
          v25 = v24;
          v26 = String.init(cString:)();
          v28 = v27;
          can_retry = xpc_rich_error_can_retry(a2);
          free(v25);
          *(_BYTE *)v23 = can_retry;
          *(_QWORD *)(v23 + 8) = v26;
          *(_QWORD *)(v23 + 16) = v28;
          swift_willThrow();
          outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
          swift_unknownObjectRelease();
          type metadata accessor for XPCSession();
          swift_deallocPartialClassInstance();
          return v7;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000001BLL, 0x80000001DF04E630);
  }
  v12 = *a5;
  *(_QWORD *)(v6 + 16) = a1;
  v13 = a1;
  a6(v6);
  if (a3)
  {
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = a3;
    *(_QWORD *)(v14 + 24) = a4;
    swift_retain_n();
    v15 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<XPCReceivedMessage, XPCRichError>) -> ());
    v32 = v13;
    v17 = v16;
    v18 = *(void **)(v7 + 16);
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = v15;
    *(_QWORD *)(v19 + 24) = v17;
    v31[4] = closure #1 in XPCSession.setCancellationHandler(_:)partial apply;
    v31[5] = v19;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 1107296256;
    v31[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
    v31[3] = &block_descriptor_129;
    v20 = _Block_copy(v31);
    swift_retain();
    swift_release();
    _swift_xpc_session_set_cancel_handler(v18, v20);
    _Block_release(v20);
    v13 = v32;
    swift_release();
    outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
  }
  swift_beginAccess();
  if ((static XPCSession.InitializationOptions.inactive & ~v12) != 0)
  {
    XPCSession.activate()();
    if (v21)
      swift_release();
  }
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);

  swift_unknownObjectRelease();
  return v7;
}

uint64_t closure #1 in XPCSession.init<A>(session:createError:incomingMessageHandler:cancellationHandler:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  if (a2)
  {
    swift_retain();
    XPCSession.setIncomingMessageHandler<A>(_:)(a2, a3, a4, a5);
    return outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a2);
  }
  return result;
}

uint64_t XPCSession.__allocating_init(xpcService:targetQueue:options:cancellationHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  return XPCSession.__allocating_init(xpcService:targetQueue:options:cancellationHandler:)(a1, a2, a3, a4, a5, a6, (uint64_t (*)(uint64_t, void *, uint64_t, _QWORD *))_swift_xpc_session_create_xpc_service, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t))specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:));
}

xpc_session_t _swift_xpc_session_create_xpc_service(const char *a1, void *a2, xpc_session_create_flags_t a3, xpc_rich_error_t *a4)
{
  NSObject *v7;
  xpc_session_t xpc_service;

  v7 = a2;
  xpc_service = xpc_session_create_xpc_service(a1, v7, a3, a4);

  return xpc_service;
}

uint64_t type metadata accessor for XPCSession()
{
  return objc_opt_self();
}

uint64_t XPCSession.__allocating_init(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return XPCSession.__allocating_init(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t (*)(uint64_t, void *, uint64_t, _QWORD *))_swift_xpc_session_create_xpc_service, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t))specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:));
}

{
  return XPCSession.__allocating_init(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t (*)(uint64_t, void *, uint64_t, _QWORD *))_swift_xpc_session_create_xpc_service, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t))specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:));
}

uint64_t XPCSession.__allocating_init<A>(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10)
{
  return XPCSession.__allocating_init<A>(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, (uint64_t (*)(uint64_t, void *, uint64_t, uint64_t *))_swift_xpc_session_create_xpc_service);
}

uint64_t XPCSession.__allocating_init(machService:targetQueue:options:cancellationHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  return XPCSession.__allocating_init(xpcService:targetQueue:options:cancellationHandler:)(a1, a2, a3, a4, a5, a6, (uint64_t (*)(uint64_t, void *, uint64_t, _QWORD *))_swift_xpc_session_create_mach_service, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t))specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:));
}

uint64_t XPCSession.__allocating_init(xpcService:targetQueue:options:cancellationHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, void *, uint64_t, _QWORD *), uint64_t (*a8)(id, uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t))
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v12 = *a4;
  swift_beginAccess();
  v13 = static XPCSession.InitializationOptions.inactive | v12;
  v14 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v21[0] = 0;
  v15 = (id)a7(v14 + 32, a3, v13, v21);
  v16 = v21[0];
  swift_unknownObjectRetain();
  swift_release();
  v21[0] = v12;
  type metadata accessor for XPCSession();
  v17 = swift_allocObject();
  swift_unknownObjectRetain();
  v18 = a8(v15, v16, a5, a6, v21, v17);
  swift_unknownObjectRelease();

  return v18;
}

uint64_t XPCSession.__allocating_init(machService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return XPCSession.__allocating_init(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t (*)(uint64_t, void *, uint64_t, _QWORD *))_swift_xpc_session_create_mach_service, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t))specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:));
}

{
  return XPCSession.__allocating_init(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t (*)(uint64_t, void *, uint64_t, _QWORD *))_swift_xpc_session_create_mach_service, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t))specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:));
}

uint64_t XPCSession.__allocating_init<A>(machService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10)
{
  return XPCSession.__allocating_init<A>(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, (uint64_t (*)(uint64_t, void *, uint64_t, uint64_t *))_swift_xpc_session_create_mach_service);
}

uint64_t XPCSession.__allocating_init<A>(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(uint64_t, void *, uint64_t, uint64_t *))
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _xpc_rich_error_s *v18;
  uint64_t v19;
  uint64_t v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v14 = *a4;
  swift_beginAccess();
  v15 = static XPCSession.InitializationOptions.inactive | v14;
  v16 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v23[0] = 0;
  v17 = (id)a11(v16 + 32, a3, v15, v23);
  v18 = (_xpc_rich_error_s *)v23[0];
  swift_unknownObjectRetain();
  swift_release();
  v23[0] = v14;
  swift_unknownObjectRetain();
  v19 = specialized XPCSession.__allocating_init<A>(session:createError:incomingMessageHandler:cancellationHandler:options:)(v17, v18, a5, a6, a7, a8, v23);
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a5);
  swift_unknownObjectRelease();

  return v19;
}

uint64_t XPCSession.__allocating_init(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(uint64_t, void *, uint64_t, _QWORD *), uint64_t (*a10)(id, uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t))
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v13 = *a4;
  swift_beginAccess();
  v14 = static XPCSession.InitializationOptions.inactive | v13;
  v15 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v23[0] = 0;
  v16 = (id)a9(v15 + 32, a3, v14, v23);
  v17 = v23[0];
  swift_unknownObjectRetain();
  swift_release();
  v23[0] = v13;
  type metadata accessor for XPCSession();
  v18 = swift_allocObject();
  swift_unknownObjectRetain();
  v19 = a10(v16, v17, a7, a8, v23, v18, a5, a6);
  swift_unknownObjectRelease();

  return v19;
}

uint64_t closure #1 in XPCSession._setIncomingMessageHandler(_:)(uint64_t a1, void (*a2)(uint64_t *__return_ptr, uint64_t *))
{
  uint64_t v4;
  uint64_t result;
  char v6;
  uint64_t v7;
  uint64_t v8;

  v4 = swift_unknownObjectRetain();
  result = MEMORY[0x1DF0F4CB8](v4);
  if (result == MEMORY[0x1E0C812F8])
  {
    v6 = xpc_dictionary_expects_reply();
    v7 = a1;
    a2(&v8, &v7);
    if (v8)
    {
      if ((v6 & 1) != 0)
      {
        if (xpc_dictionary_expects_reply())
          xpc_dictionary_send_reply_4SWIFT();
      }
      swift_unknownObjectRelease();
    }
    return swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ()(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t XPCSession.setIncomingMessageHandler(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[6];

  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCDictionary?);
  v3 = ClientSpecifiedHandler.init(_:)(a1);
  v5 = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v3;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = *(void **)(v1 + 16);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = partial apply for implicit closure #2 in implicit closure #1 in XPCSession.setIncomingMessageHandler(_:);
  *(_QWORD *)(v8 + 24) = v6;
  v11[4] = partial apply for closure #1 in XPCSession._setIncomingMessageHandler(_:);
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
  v11[3] = &block_descriptor;
  v9 = _Block_copy(v11);
  swift_retain();
  swift_retain();
  swift_release();
  _swift_xpc_session_set_incoming_message_handler(v7, v9);
  _Block_release(v9);
  swift_release();
  return swift_release();
}

{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[6];

  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Encodable?);
  v3 = ClientSpecifiedHandler.init(_:)(a1);
  v5 = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v3;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = partial apply for implicit closure #2 in implicit closure #1 in XPCSession.setIncomingMessageHandler(_:);
  *(_QWORD *)(v7 + 24) = v6;
  v8 = *(void **)(v1 + 16);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = closure #1 in XPCSession._setIncomingMessageHandler(_:)partial apply;
  *(_QWORD *)(v9 + 24) = v7;
  v12[4] = closure #1 in XPCSession._setIncomingMessageHandler(_:)partial apply;
  v12[5] = v9;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1107296256;
  v12[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
  v12[3] = &block_descriptor_30;
  v10 = _Block_copy(v12);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  _swift_xpc_session_set_incoming_message_handler(v8, v10);
  _Block_release(v10);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t closure #1 in XPCSession._setIncomingMessageHandler(_:)@<X0>(_QWORD *a1@<X0>, void (*a2)(__int128 *__return_ptr, _QWORD *)@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t result;
  char v12;
  _QWORD v13[8];
  _QWORD v14[2];
  __int128 v15;
  uint64_t v16;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;

  v17[0] = *a1;
  v5 = v17[0];
  swift_unknownObjectRetain();
  v6 = XPCDictionary.subscript.getter(0x656C6261646F435FLL, 0xEE00636E79537349) & 1;
  type metadata accessor for XPCReceivedMessage.XPCReceivedMessageMetadata();
  v7 = swift_allocObject();
  *(_BYTE *)(v7 + 16) = v6;
  *(_BYTE *)(v7 + 17) = v6;
  v14[0] = v5;
  v14[1] = v7;
  a2(&v15, v14);
  if (v16)
  {
    outlined init with take of Encodable(&v15, (uint64_t)v17);
    v8 = v18;
    v9 = v19;
    v10 = __swift_project_boxed_opaque_existential_1(v17, v18);
    *(_QWORD *)&v15 = v5;
    *((_QWORD *)&v15 + 1) = v7;
    XPCReceivedMessage.reply<A>(_:)((uint64_t)v10, v8, v9);
    swift_release();
    swift_unknownObjectRelease();
    *a3 = 0;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  }
  outlined destroy of Encodable?((uint64_t)&v15);
  swift_unknownObjectRetain();
  swift_retain();
  if (xpc_dictionary_expects_reply() && (*(_BYTE *)(v7 + 17) & 1) != 0)
  {
    v12 = *(_BYTE *)(v7 + 16);
    swift_release();
    swift_unknownObjectRelease();
    if ((v12 & 1) == 0)
    {
      swift_release();
      result = swift_unknownObjectRelease();
      goto LABEL_11;
    }
    v17[0] = xpc_dictionary_create_empty();
    MEMORY[0x1E0C80A78](v17[0]);
    v13[2] = 0xD000000000000074;
    v13[3] = 0x80000001DF04E6F0;
    v13[4] = v17;
    specialized String.withCString<A>(_:)((uint64_t (*)(_QWORD *))partial apply for closure #1 in XPCDictionary.subscript.setter, (uint64_t)v13, 0x656C6261646F435FLL, 0xED0000726F727245);
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    if (xpc_dictionary_expects_reply())
      xpc_dictionary_send_reply_4SWIFT();
    swift_release();
    swift_unknownObjectRelease_n();
  }
  else
  {
    swift_release_n();
  }
  result = swift_unknownObjectRelease_n();
LABEL_11:
  *a3 = 0;
  return result;
}

uint64_t XPCSession.setIncomingMessageHandler<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[6];

  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Encodable?);
  v8 = ClientSpecifiedHandler.init(_:)(a1);
  v10 = v9;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = v8;
  v11[5] = v10;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = partial apply for closure #1 in XPCSession.setIncomingMessageHandler<A>(_:);
  *(_QWORD *)(v12 + 24) = v11;
  v13 = *(void **)(v4 + 16);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = partial apply for closure #1 in XPCSession._setIncomingMessageHandler(_:);
  *(_QWORD *)(v14 + 24) = v12;
  v17[4] = closure #1 in XPCSession._setIncomingMessageHandler(_:)partial apply;
  v17[5] = v14;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 1107296256;
  v17[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
  v17[3] = &block_descriptor_16;
  v15 = _Block_copy(v17);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  _swift_xpc_session_set_incoming_message_handler(v13, v15);
  _Block_release(v15);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t closure #1 in XPCSession.setIncomingMessageHandler<A>(_:)(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _OWORD *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _OWORD v15[3];

  v6 = *(_QWORD *)(a4 - 8);
  v7 = MEMORY[0x1E0C80A78](a1);
  v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (_OWORD *)MEMORY[0x1E0C80A78](v7);
  v12 = (char *)v15 - v11;
  v15[0] = *v10;
  v15[2] = v15[0];
  XPCReceivedMessage.decode<A>(as:)(v13, v13, (uint64_t)v9);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v12, v9, a4);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Encodable?);
  ClientSpecifiedHandler.callEventHandler(_:)((uint64_t)v12, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v12, a4);
}

uint64_t XPCSession.setCancellationHandler(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[6];

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  swift_retain();
  v6 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ());
  v8 = v7;
  v9 = *(void **)(v2 + 16);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v6;
  *(_QWORD *)(v10 + 24) = v8;
  v13[4] = partial apply for closure #1 in XPCSession.setCancellationHandler(_:);
  v13[5] = v10;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 1107296256;
  v13[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
  v13[3] = &block_descriptor_39;
  v11 = _Block_copy(v13);
  swift_retain();
  swift_release();
  _swift_xpc_session_set_cancel_handler(v9, v11);
  _Block_release(v11);
  return swift_release();
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ()(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

char *closure #1 in XPCSession.setCancellationHandler(_:)(_xpc_rich_error_s *a1, void (*a2)(uint64_t))
{
  uint64_t v4;
  char *result;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL can_retry;
  BOOL v11[8];
  uint64_t v12;
  uint64_t v13;

  v4 = swift_unknownObjectRetain();
  result = (char *)MEMORY[0x1DF0F4CB8](v4);
  if (result == (char *)MEMORY[0x1E0C81368])
  {
    result = xpc_rich_error_copy_description(a1);
    if (result)
    {
      v6 = result;
      v7 = String.init(cString:)();
      v9 = v8;
      can_retry = xpc_rich_error_can_retry(a1);
      free(v6);
      swift_unknownObjectRelease();
      v11[0] = can_retry;
      v12 = v7;
      v13 = v9;
      ClientSpecifiedHandler.callEventHandler(_:)((uint64_t)v11, a2);
      return (char *)swift_bridgeObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void XPCSession.setTargetQueue(_:)(void *a1)
{
  uint64_t v1;

  _swift_xpc_session_set_target_queue(*(void **)(v1 + 16), a1);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> XPCSession.activate()()
{
  uint64_t v0;
  BOOL v1;
  _xpc_rich_error_s *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL can_retry;
  xpc_rich_error_t v12[2];

  v12[1] = *(xpc_rich_error_t *)MEMORY[0x1E0C80C00];
  v12[0] = 0;
  v1 = _swift_xpc_session_activate(*(void **)(v0 + 16), v12);
  v2 = v12[0];
  if (!v1)
  {
    if (v12[0])
    {
      lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
      swift_allocError();
      v4 = v3;
      v5 = swift_unknownObjectRetain();
      if (MEMORY[0x1DF0F4CB8](v5) != MEMORY[0x1E0C81368])
        __break(1u);
      v6 = xpc_rich_error_copy_description(v2);
      if (v6)
      {
        v7 = v6;
        v8 = String.init(cString:)();
        v10 = v9;
        can_retry = xpc_rich_error_can_retry(v2);
        free(v7);
        *(_BYTE *)v4 = can_retry;
        *(_QWORD *)(v4 + 8) = v8;
        *(_QWORD *)(v4 + 16) = v10;
        swift_willThrow();
        swift_unknownObjectRelease();
        goto LABEL_6;
      }
      __break(1u);
    }
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000001FLL, 0x80000001DF04E500);
  }
LABEL_6:
  swift_unknownObjectRelease();
}

Swift::Void __swiftcall XPCSession.cancel(reason:)(Swift::String reason)
{
  uint64_t v1;

  _swift_xpc_session_cancel(*(void **)(v1 + 16));
}

_xpc_rich_error_s *XPCSession.send(message:)(void **a1)
{
  uint64_t v1;
  _xpc_rich_error_s *result;
  _xpc_rich_error_s *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _xpc_rich_error_s *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL can_retry;

  result = _swift_xpc_session_send_message(*(void **)(v1 + 16), *a1);
  if (result)
  {
    v3 = result;
    lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
    swift_allocError();
    v5 = v4;
    v6 = swift_unknownObjectRetain();
    result = (_xpc_rich_error_s *)MEMORY[0x1DF0F4CB8](v6);
    if (result == (_xpc_rich_error_s *)MEMORY[0x1E0C81368])
    {
      result = (_xpc_rich_error_s *)xpc_rich_error_copy_description(v3);
      if (result)
      {
        v7 = result;
        v8 = String.init(cString:)();
        v10 = v9;
        can_retry = xpc_rich_error_can_retry(v3);
        free(v7);
        *(_BYTE *)v5 = can_retry;
        *(_QWORD *)(v5 + 8) = v8;
        *(_QWORD *)(v5 + 16) = v10;
        swift_willThrow();
        return (_xpc_rich_error_s *)swift_unknownObjectRelease_n();
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

uint64_t XPCSession.send<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  void *v5;

  result = static XPCReceivedMessage.encodeMessage<A>(_:isSync:)(a1, 0, a2, a3, &v5);
  if (!v3)
  {
    XPCSession.send(message:)(&v5);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t XPCSession.sendSync(message:)@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  void *v4;
  id v5;
  _xpc_rich_error_s *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL can_retry;
  xpc_rich_error_t v20[2];

  v20[1] = *(xpc_rich_error_t *)MEMORY[0x1E0C80C00];
  v4 = *a1;
  v20[0] = 0;
  v5 = _swift_xpc_session_send_message_with_reply_sync(*(void **)(v2 + 16), v4, v20);
  v6 = v20[0];
  if (v5)
  {
    v7 = v5;
    v8 = swift_unknownObjectRetain();
    v9 = MEMORY[0x1DF0F4CB8](v8);
    swift_unknownObjectRelease();
    result = swift_unknownObjectRelease();
    if (v9 == MEMORY[0x1E0C812F8])
    {
      *a2 = v7;
      return result;
    }
    __break(1u);
LABEL_9:
    __break(1u);
  }
  if (!v20[0])
LABEL_11:
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD000000000000018, 0x80000001DF04E580);
  lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
  swift_allocError();
  v12 = v11;
  v13 = swift_unknownObjectRetain();
  if (MEMORY[0x1DF0F4CB8](v13) != MEMORY[0x1E0C81368])
    goto LABEL_9;
  v14 = xpc_rich_error_copy_description(v6);
  if (!v14)
  {
    __break(1u);
    goto LABEL_11;
  }
  v15 = v14;
  v16 = String.init(cString:)();
  v18 = v17;
  can_retry = xpc_rich_error_can_retry(v6);
  free(v15);
  *(_BYTE *)v12 = can_retry;
  *(_QWORD *)(v12 + 8) = v16;
  *(_QWORD *)(v12 + 16) = v18;
  swift_willThrow();
  swift_unknownObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t XPCSession.sendSync<A, B>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v9;

  result = XPCSession.sendSync<A>(_:)(a1, a2, a4, &v9);
  if (!v5)
  {
    XPCReceivedMessage.decode<A>(as:)(a3, a3, a5);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t XPCSession.sendSync<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  xpc_object_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  xpc_object_t v11;

  result = static XPCReceivedMessage.encodeMessage<A>(_:isSync:)(a1, 1, a2, a3, &v11);
  if (!v4)
  {
    v10 = v11;
    XPCSession.sendSync(message:)(&v10, &v11);
    v7 = v11;
    swift_unknownObjectRetain();
    v8 = XPCDictionary.subscript.getter(0x656C6261646F435FLL, 0xEE00636E79537349) & 1;
    type metadata accessor for XPCReceivedMessage.XPCReceivedMessageMetadata();
    v9 = swift_allocObject();
    *(_BYTE *)(v9 + 16) = v8;
    *(_BYTE *)(v9 + 17) = v8;
    swift_unknownObjectRelease();
    result = swift_unknownObjectRelease();
    *a4 = v7;
    a4[1] = v9;
  }
  return result;
}

uint64_t closure #1 in XPCSession._send(message:replyHandler:)(_BOOL8 a1, _xpc_rich_error_s *a2, void (*a3)(_BOOL8 *))
{
  uint64_t v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 can_retry;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  if (!a1)
  {
    if (!a2)
      goto LABEL_12;
    v7 = swift_unknownObjectRetain();
    if (MEMORY[0x1DF0F4CB8](v7) == MEMORY[0x1E0C81368])
    {
      v8 = xpc_rich_error_copy_description(a2);
      if (v8)
      {
        v9 = v8;
        v10 = String.init(cString:)();
        v12 = v11;
        can_retry = xpc_rich_error_can_retry(a2);
        free(v9);
        v15 = can_retry;
        v16 = v10;
        v17 = v12;
        v18 = 1;
        a3(&v15);
        swift_bridgeObjectRelease();
        return swift_unknownObjectRelease();
      }
      goto LABEL_11;
    }
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
LABEL_12:
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000003FLL, 0x80000001DF04E650);
  }
  v5 = swift_unknownObjectRetain();
  if (MEMORY[0x1DF0F4CB8](v5) != MEMORY[0x1E0C812F8])
  {
    __break(1u);
    goto LABEL_10;
  }
  v16 = 0;
  v17 = 0;
  v15 = a1;
  v18 = 0;
  a3(&v15);
  return swift_unknownObjectRelease();
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object?, @guaranteed OS_xpc_object?) -> ()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v5)(uint64_t, uint64_t);

  v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v5(a2, a3);
  swift_release();
  swift_unknownObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t XPCSession.send(message:replyHandler:)(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[6];

  v6 = *a1;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCDictionary, XPCRichError>);
  v8 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ());
  v10 = v9;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v8;
  *(_QWORD *)(v11 + 24) = v10;
  v12 = *(void **)(v3 + 16);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = partial apply for implicit closure #2 in implicit closure #1 in XPCSession.send(message:replyHandler:);
  *(_QWORD *)(v13 + 24) = v11;
  v16[4] = partial apply for closure #1 in XPCSession._send(message:replyHandler:);
  v16[5] = v13;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 1107296256;
  v16[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object?, @guaranteed OS_xpc_object?) -> ();
  v16[3] = &block_descriptor_51;
  v14 = _Block_copy(v16);
  swift_retain();
  swift_retain();
  swift_release();
  _swift_xpc_session_send_message_with_reply_async(v12, v6, v14);
  _Block_release(v14);
  swift_release();
  return swift_release();
}

uint64_t XPCSession._send<A>(_:replyHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  xpc_object_t v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  xpc_object_t v15[6];

  result = static XPCReceivedMessage.encodeMessage<A>(_:isSync:)(a1, 0, a4, a5, v15);
  if (!v6)
  {
    v10 = v15[0];
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = a2;
    *(_QWORD *)(v11 + 24) = a3;
    v12 = *(void **)(v5 + 16);
    v13 = (_QWORD *)swift_allocObject();
    v13[2] = partial apply for closure #1 in XPCSession._send<A>(_:replyHandler:);
    v13[3] = v11;
    v15[4] = closure #1 in XPCSession._send(message:replyHandler:)partial apply;
    v15[5] = v13;
    v15[0] = (xpc_object_t)MEMORY[0x1E0C809B0];
    v15[1] = (xpc_object_t)1107296256;
    v15[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object?, @guaranteed OS_xpc_object?) -> ();
    v15[3] = &block_descriptor_95;
    v14 = _Block_copy(v15);
    swift_retain();
    swift_retain();
    swift_release();
    _swift_xpc_session_send_message_with_reply_async(v12, v10, v14);
    _Block_release(v14);
    swift_unknownObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t closure #1 in XPCSession._send<A>(_:replyHandler:)(uint64_t a1, void (*a2)(uint64_t *))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = *(_QWORD *)a1;
  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 8);
    v4 = *(_QWORD *)(a1 + 16);
    v9 = *(_QWORD *)a1 & 1;
    v10 = v5;
    v11 = v4;
    v12 = 1;
    swift_bridgeObjectRetain();
    a2(&v9);
    return outlined consume of Result<XPCDictionary, XPCRichError>(v3, v5, v4, 1);
  }
  else
  {
    swift_unknownObjectRetain();
    v7 = XPCDictionary.subscript.getter(0x656C6261646F435FLL, 0xEE00636E79537349) & 1;
    type metadata accessor for XPCReceivedMessage.XPCReceivedMessageMetadata();
    v8 = swift_allocObject();
    *(_BYTE *)(v8 + 16) = v7;
    *(_BYTE *)(v8 + 17) = v7;
    v9 = v3;
    v10 = v8;
    v11 = 0;
    v12 = 0;
    swift_unknownObjectRetain();
    swift_retain();
    a2(&v9);
    swift_release_n();
    return swift_unknownObjectRelease_n();
  }
}

uint64_t XPCSession.send<A, B>(_:replyHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;

  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a4;
  v14[3] = a5;
  v14[4] = a6;
  v14[5] = a7;
  v14[6] = a2;
  v14[7] = a3;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  type metadata accessor for Result();
  v15 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<B, Error>) -> ());
  v17 = v16;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = a4;
  v18[3] = a5;
  v18[4] = a6;
  v18[5] = a7;
  v18[6] = v15;
  v18[7] = v17;
  swift_retain();
  XPCSession._send<A>(_:replyHandler:)(a1, (uint64_t)partial apply for closure #1 in XPCSession.send<A, B>(_:replyHandler:), (uint64_t)v18, a4, a6);
  swift_release();
  return swift_release();
}

uint64_t closure #1 in XPCSession.send<A, B>(_:replyHandler:)(uint64_t *a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v8 = type metadata accessor for Result();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v13 - v10;
  closure #1 in closure #1 in XPCSession.send<A, B>(_:replyHandler:)(*a1, a1[1], a1[2], a5, (uint64_t *)((char *)&v13 - v10));
  ClientSpecifiedHandler.callEventHandler(_:)((uint64_t)v11, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t closure #1 in closure #1 in XPCSession.send<A, B>(_:replyHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X5>, uint64_t *a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[4];

  v10 = *(_QWORD *)(a4 - 8);
  MEMORY[0x1E0C80A78](a1);
  v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  v13 = (char *)v18 - v12;
  if ((v14 & 1) != 0)
  {
    lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
    v15 = swift_allocError();
    *(_BYTE *)v16 = a1 & 1;
    *(_QWORD *)(v16 + 8) = a2;
    *(_QWORD *)(v16 + 16) = a3;
    *a5 = v15;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
    type metadata accessor for Result();
    swift_storeEnumTagMultiPayload();
    return swift_bridgeObjectRetain();
  }
  else
  {
    v18[2] = a1;
    v18[3] = a2;
    XPCReceivedMessage.decode<A>(as:)(a4, a4, (uint64_t)v18 - v12);
    (*(void (**)(uint64_t *, char *, uint64_t))(v10 + 32))(a5, v13, a4);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
    type metadata accessor for Result();
    return swift_storeEnumTagMultiPayload();
  }
}

uint64_t XPCSession.send<A>(_:replyHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCReceivedMessage, XPCRichError>);
  v11 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<XPCReceivedMessage, XPCRichError>) -> ());
  v13 = v12;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v11;
  *(_QWORD *)(v14 + 24) = v13;
  swift_retain();
  XPCSession._send<A>(_:replyHandler:)(a1, (uint64_t)partial apply for implicit closure #2 in implicit closure #1 in XPCSession.send<A>(_:replyHandler:), v14, a4, a5);
  swift_release();
  return swift_release();
}

uint64_t implicit closure #2 in implicit closure #1 in XPCSession.send(message:replyHandler:)(__int128 *a1, void (*a2)(uint64_t), uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
  char v6;
  __int128 v8;
  uint64_t v9;
  char v10;

  v5 = *((_QWORD *)a1 + 2);
  v6 = *((_BYTE *)a1 + 24);
  v8 = *a1;
  v9 = v5;
  v10 = v6;
  __swift_instantiateConcreteTypeFromMangledName(a4);
  return ClientSpecifiedHandler.callEventHandler(_:)((uint64_t)&v8, a2);
}

uint64_t XPCSession.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t XPCSession.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t XPCSession.__allocating_init(endpoint:targetQueue:options:cancellationHandler:)(uint64_t a1, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  void *v9;
  void *xpc_endpoint;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v8 = *a3;
  v9 = (void *)swift_unknownObjectRetain();
  if (!xpc_copy(v9))
    __break(1u);
  swift_unknownObjectRelease_n();
  swift_beginAccess();
  xpc_endpoint = (void *)xpc_session_create_xpc_endpoint();
  swift_unknownObjectRelease();
  v14[0] = v8;
  type metadata accessor for XPCSession();
  v11 = swift_allocObject();
  swift_unknownObjectRetain_n();
  v12 = specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:)(xpc_endpoint, 0, a4, a5, v14, v11);
  swift_unknownObjectRelease();

  return v12;
}

uint64_t XPCSession.__allocating_init(endpoint:targetQueue:options:incomingMessageHandler:cancellationHandler:)(uint64_t a1, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return XPCSession.__allocating_init(endpoint:targetQueue:options:incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, a6, a7, (uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t))specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:));
}

{
  return XPCSession.__allocating_init(endpoint:targetQueue:options:incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, a6, a7, (uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t))specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:));
}

uint64_t XPCSession.__allocating_init<A>(endpoint:targetQueue:options:incomingMessageHandler:cancellationHandler:)(uint64_t a1, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v12;
  void *v13;
  void *xpc_endpoint;
  uint64_t v15;
  uint64_t v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v12 = *a3;
  v13 = (void *)swift_unknownObjectRetain();
  if (!xpc_copy(v13))
    __break(1u);
  swift_unknownObjectRelease_n();
  swift_beginAccess();
  xpc_endpoint = (void *)xpc_session_create_xpc_endpoint();
  swift_unknownObjectRelease();
  v17[0] = v12;
  swift_unknownObjectRetain_n();
  v15 = specialized XPCSession.__allocating_init<A>(session:createError:incomingMessageHandler:cancellationHandler:options:)(xpc_endpoint, 0, a4, a5, a6, a7, v17);
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a4);
  swift_unknownObjectRelease();

  return v15;
}

uint64_t XPCSession.__allocating_init(endpoint:targetQueue:options:incomingMessageHandler:cancellationHandler:)(uint64_t a1, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(uint64_t, _QWORD, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t))
{
  uint64_t v13;
  void *v14;
  uint64_t xpc_endpoint;
  uint64_t v16;
  uint64_t v17;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v13 = *a3;
  v14 = (void *)swift_unknownObjectRetain();
  if (!xpc_copy(v14))
    __break(1u);
  swift_unknownObjectRelease_n();
  swift_beginAccess();
  xpc_endpoint = xpc_session_create_xpc_endpoint();
  swift_unknownObjectRelease();
  v20[0] = v13;
  type metadata accessor for XPCSession();
  v16 = swift_allocObject();
  swift_unknownObjectRetain_n();
  v17 = a8(xpc_endpoint, 0, a6, a7, v20, v16, a4, a5);
  swift_unknownObjectRelease();

  return v17;
}

unint64_t XPCSession.debugDescription.getter()
{
  uint64_t v0;
  char *v1;
  char *v2;
  uint64_t v3;

  v1 = _swift_xpc_session_copy_description(*(void **)(v0 + 16));
  if (!v1)
    return 0xD000000000000035;
  v2 = v1;
  v3 = String.init(cString:)();
  free(v2);
  return v3;
}

unint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance XPCSession()
{
  uint64_t v0;
  char *v1;
  char *v2;
  uint64_t v3;

  v1 = _swift_xpc_session_copy_description(*(void **)(*(_QWORD *)v0 + 16));
  if (!v1)
    return 0xD000000000000035;
  v2 = v1;
  v3 = String.init(cString:)();
  free(v2);
  return v3;
}

uint64_t XPCSession.__allocating_init(fromConnection:targetQueue:options:cancellationHandler:)(void *a1, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v9 = *a3;
  swift_beginAccess();
  v10 = _swift__xpc_session_create_from_connection_4SWIFT(a1, a2);
  v14[0] = v9;
  type metadata accessor for XPCSession();
  v11 = swift_allocObject();
  swift_unknownObjectRetain_n();
  v12 = specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:)(v10, 0, a4, a5, v14, v11);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v12;
}

uint64_t XPCSession.__allocating_init(fromConnection:targetQueue:options:incomingMessageHandler:cancellationHandler:)(void *a1, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return XPCSession.__allocating_init(fromConnection:targetQueue:options:incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, a6, a7, (uint64_t (*)(id, _QWORD, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t))specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:));
}

{
  return XPCSession.__allocating_init(fromConnection:targetQueue:options:incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, a6, a7, (uint64_t (*)(id, _QWORD, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t))specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:));
}

uint64_t XPCSession.__allocating_init<A>(fromConnection:targetQueue:options:incomingMessageHandler:cancellationHandler:)(void *a1, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v12 = *a3;
  swift_beginAccess();
  v13 = _swift__xpc_session_create_from_connection_4SWIFT(a1, a2);
  v17[0] = v12;
  swift_unknownObjectRetain_n();
  v14 = specialized XPCSession.__allocating_init<A>(session:createError:incomingMessageHandler:cancellationHandler:options:)(v13, 0, a4, a5, a6, a7, v17);
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v14;
}

uint64_t XPCSession.__allocating_init(fromConnection:targetQueue:options:incomingMessageHandler:cancellationHandler:)(void *a1, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(id, _QWORD, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t))
{
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v14 = *a3;
  swift_beginAccess();
  v15 = _swift__xpc_session_create_from_connection_4SWIFT(a1, a2);
  v20[0] = v14;
  type metadata accessor for XPCSession();
  v16 = swift_allocObject();
  swift_unknownObjectRetain_n();
  v17 = a8(v15, 0, a6, a7, v20, v16, a4, a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v17;
}

id XPCSession.extractConnection()()
{
  uint64_t v0;
  id result;

  result = _swift__xpc_session_extract_connection_4SWIFT(*(void **)(v0 + 16));
  if (!result)
    __break(1u);
  return result;
}

Swift::Void __swiftcall XPCSession.setTargetUserSession(userIdentifier:)(Swift::UInt32 userIdentifier)
{
  xpc_session_set_target_user_session_uid();
}

uint64_t specialized XPCSession.__allocating_init<A>(session:createError:incomingMessageHandler:cancellationHandler:options:)(void *a1, _xpc_rich_error_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t *a7)
{
  uint64_t v12;

  v12 = *a7;
  type metadata accessor for XPCSession();
  swift_allocObject();
  return XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:)(a1, a2, a5, a6, &v12, (void (*)(uint64_t))partial apply for closure #1 in XPCSession.init<A>(session:createError:incomingMessageHandler:cancellationHandler:options:));
}

xpc_session_t _swift_xpc_session_create_mach_service(const char *a1, void *a2, xpc_session_create_flags_t a3, xpc_rich_error_t *a4)
{
  NSObject *v7;
  xpc_session_t mach_service;

  v7 = a2;
  mach_service = xpc_session_create_mach_service(a1, v7, a3, a4);

  return mach_service;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0F49D0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1DF01B824()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in XPCSession.setIncomingMessageHandler(_:)(uint64_t *a1)
{
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t v4;

  v2 = *(void (**)(uint64_t))(v1 + 16);
  v4 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCDictionary?);
  return ClientSpecifiedHandler.callEventHandler(_:)((uint64_t)&v4, v2);
}

uint64_t partial apply for closure #1 in XPCSession._setIncomingMessageHandler(_:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in XPCSession._setIncomingMessageHandler(_:)(a1, *(void (**)(uint64_t *__return_ptr, uint64_t *))(v1 + 16));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

void _swift_xpc_session_set_incoming_message_handler(void *a1, void *a2)
{
  _xpc_session_s *v3;
  id v4;

  v3 = a1;
  v4 = a2;
  xpc_session_set_incoming_message_handler(v3, v4);

}

uint64_t sub_1DF01B914()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in XPCSession.setIncomingMessageHandler<A>(_:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in XPCSession.setIncomingMessageHandler<A>(_:)(a1, *(void (**)(uint64_t))(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 16));
}

uint64_t partial apply for closure #1 in XPCSession._setIncomingMessageHandler(_:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return closure #1 in XPCSession._setIncomingMessageHandler(_:)(a1, *(void (**)(__int128 *__return_ptr, _QWORD *))(v2 + 16), a2);
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in XPCSession.setIncomingMessageHandler(_:)(__int128 *a1)
{
  uint64_t v1;
  void (*v2)(uint64_t);
  __int128 v4;

  v2 = *(void (**)(uint64_t))(v1 + 16);
  v4 = *a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Encodable?);
  return ClientSpecifiedHandler.callEventHandler(_:)((uint64_t)&v4, v2);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

char *partial apply for closure #1 in XPCSession.setCancellationHandler(_:)(_xpc_rich_error_s *a1)
{
  uint64_t v1;

  return closure #1 in XPCSession.setCancellationHandler(_:)(a1, *(void (**)(uint64_t))(v1 + 16));
}

void _swift_xpc_session_set_cancel_handler(void *a1, void *a2)
{
  _xpc_session_s *v3;
  id v4;

  v3 = a1;
  v4 = a2;
  xpc_session_set_cancel_handler(v3, v4);

}

void _swift_xpc_session_set_target_queue(void *a1, void *a2)
{
  _xpc_session_s *v3;
  NSObject *v4;

  v3 = a1;
  v4 = a2;
  xpc_session_set_target_queue(v3, v4);

}

BOOL _swift_xpc_session_activate(void *a1, xpc_rich_error_t *a2)
{
  _xpc_session_s *v3;
  _BOOL8 v4;

  v3 = a1;
  v4 = xpc_session_activate(v3, a2);

  return v4;
}

unint64_t lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type XPCRichError and conformance XPCRichError;
  if (!lazy protocol witness table cache variable for type XPCRichError and conformance XPCRichError)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for XPCRichError, &type metadata for XPCRichError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCRichError and conformance XPCRichError);
  }
  return result;
}

void _swift_xpc_session_cancel(void *a1)
{
  _xpc_session_s *v1;

  v1 = a1;
  xpc_session_cancel(v1);

}

xpc_rich_error_t _swift_xpc_session_send_message(void *a1, void *a2)
{
  _xpc_session_s *v3;
  id v4;
  xpc_rich_error_t v5;

  v3 = a1;
  v4 = a2;
  v5 = xpc_session_send_message(v3, v4);

  return v5;
}

id _swift_xpc_session_send_message_with_reply_sync(void *a1, void *a2, xpc_rich_error_t *a3)
{
  _xpc_session_s *v5;
  id v6;
  xpc_object_t v7;

  v5 = a1;
  v6 = a2;
  v7 = xpc_session_send_message_with_reply_sync(v5, v6, a3);

  return v7;
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in XPCSession.send(message:replyHandler:)(__int128 *a1)
{
  uint64_t v1;

  return implicit closure #2 in implicit closure #1 in XPCSession.send(message:replyHandler:)(a1, *(void (**)(uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24), &demangling cache variable for type metadata for Result<XPCDictionary, XPCRichError>);
}

uint64_t partial apply for closure #1 in XPCSession._send(message:replyHandler:)(_BOOL8 a1, _xpc_rich_error_s *a2)
{
  uint64_t v2;

  return closure #1 in XPCSession._send(message:replyHandler:)(a1, a2, *(void (**)(_BOOL8 *))(v2 + 16));
}

void _swift_xpc_session_send_message_with_reply_async(void *a1, void *a2, void *a3)
{
  _xpc_session_s *v5;
  id v6;
  id v7;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  xpc_session_send_message_with_reply_async(v5, v6, v7);

}

uint64_t sub_1DF01BC40()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<B, Error>) -> ()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0F49DC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t partial apply for closure #1 in XPCSession.send<A, B>(_:replyHandler:)(uint64_t *a1)
{
  uint64_t v1;

  return closure #1 in XPCSession.send<A, B>(_:replyHandler:)(a1, *(void (**)(uint64_t))(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in XPCSession.send<A>(_:replyHandler:)(__int128 *a1)
{
  uint64_t v1;

  return implicit closure #2 in implicit closure #1 in XPCSession.send(message:replyHandler:)(a1, *(void (**)(uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24), &demangling cache variable for type metadata for Result<XPCReceivedMessage, XPCRichError>);
}

char *_swift_xpc_session_copy_description(void *a1)
{
  _xpc_session_s *v1;
  char *v2;

  v1 = a1;
  v2 = xpc_session_copy_description(v1);

  return v2;
}

id _swift__xpc_session_create_from_connection_4SWIFT(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a1;
  v4 = a2;
  v5 = (void *)_xpc_session_create_from_connection_4SWIFT();

  return v5;
}

id _swift__xpc_session_extract_connection_4SWIFT(void *a1)
{
  id v1;
  void *connection_4SWIFT;

  v1 = a1;
  connection_4SWIFT = (void *)_xpc_session_extract_connection_4SWIFT();

  return connection_4SWIFT;
}

unint64_t lazy protocol witness table accessor for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions;
  if (!lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for XPCSession.InitializationOptions, &type metadata for XPCSession.InitializationOptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions;
  if (!lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for XPCSession.InitializationOptions, &type metadata for XPCSession.InitializationOptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions;
  if (!lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for XPCSession.InitializationOptions, &type metadata for XPCSession.InitializationOptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions;
  if (!lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for XPCSession.InitializationOptions, &type metadata for XPCSession.InitializationOptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions);
  }
  return result;
}

uint64_t method lookup function for XPCSession()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCSession.setIncomingMessageHandler(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of XPCSession.setIncomingMessageHandler<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of XPCSession.setCancellationHandler(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of XPCSession.setTargetQueue(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of XPCSession.activate()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of XPCSession.cancel(reason:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of XPCSession.send(message:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of XPCSession.send<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of XPCSession.sendSync(message:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of XPCSession.sendSync<A, B>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of XPCSession.sendSync<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of XPCSession.send(message:replyHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of XPCSession.send<A, B>(_:replyHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of XPCSession.send<A>(_:replyHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

ValueMetadata *type metadata accessor for XPCSession.InitializationOptions()
{
  return &type metadata for XPCSession.InitializationOptions;
}

uint64_t outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t outlined copy of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t partial apply for closure #1 in XPCSession._send<A>(_:replyHandler:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in XPCSession._send<A>(_:replyHandler:)(a1, *(void (**)(uint64_t *))(v1 + 16));
}

uint64_t outlined consume of Result<XPCDictionary, XPCRichError>(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 1) != 0)
    return swift_bridgeObjectRelease();
  else
    return swift_unknownObjectRelease();
}

uint64_t outlined destroy of Encodable?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Encodable?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void partial apply for closure #1 in XPCDictionary.subscript.setter(char *a1)
{
  uint64_t v1;

  closure #1 in XPCDictionary.subscript.setter(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void ***)(v1 + 32));
}

{
  uint64_t v1;

  closure #1 in XPCDictionary.subscript.setter(a1, *(xpc_object_t **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t outlined init with take of Encodable(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
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

uint64_t partial apply for closure #1 in XPCSession.init<A>(session:createError:incomingMessageHandler:cancellationHandler:options:)(uint64_t a1)
{
  uint64_t *v1;

  return closure #1 in XPCSession.init<A>(session:createError:incomingMessageHandler:cancellationHandler:options:)(a1, v1[4], v1[5], v1[2], v1[3]);
}

void closure #1 in XPCDictionary.subscript.setterpartial apply(char *a1)
{
  partial apply for closure #1 in XPCDictionary.subscript.setter(a1);
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance String()
{
  return 14;
}

_QWORD *specialized static String.decodeValue(from:withCodingMetadata:)()
{
  uint64_t v0;
  _QWORD *result;
  uint64_t v2;
  Swift::String v3;
  Swift::String v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  Swift::String v8;

  result = specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
  if (!v0)
  {
    if (DecodingBuffer.consume(_:)((uint64_t)result))
    {
      v2 = String.init(cString:)();
      swift_unknownObjectRelease();
      return (_QWORD *)v2;
    }
    else
    {
      _StringGuts.grow(_:)(21);
      swift_bridgeObjectRelease();
      v3._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v3);
      swift_bridgeObjectRelease();
      v4._countAndFlagsBits = 0x736574796220;
      v4._object = (void *)0xE600000000000000;
      String.append(_:)(v4);
      v5 = type metadata accessor for DecodingError();
      swift_allocError();
      v7 = v6;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      v8._countAndFlagsBits = 0xD000000000000011;
      v8._object = (void *)0x80000001DF04E790;
      String.append(_:)(v8);
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(v7, *MEMORY[0x1E0DEC458], v5);
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_willThrow();
    }
  }
  return result;
}

uint64_t _XPCUnkeyedDecodingContainer.UnkeyedDecodingStorage.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

_QWORD *_XPCUnkeyedDecodingContainer.__allocating_init(codingMetadata:buffer:)(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  static DecodingContainer.decodeType(from:withCodingMetadata:)(a3, a1, a2, v3, (uint64_t)&protocol witness table for _XPCUnkeyedDecodingContainer);
  if (v4)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (_QWORD *)swift_release();
  }
  v7 = specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
  v8 = specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
  v10 = DecodingBuffer.consume(_:)((uint64_t)v8);
  if (!v10)
  {
    v19 = type metadata accessor for DecodingError();
    swift_allocError();
    v21 = v20;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(31);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x1E0DEC458], v19);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_willThrow();
    return (_QWORD *)swift_release();
  }
  v14 = v10;
  v15 = v12;
  v16 = v13;
  v22 = v11;
  swift_release();
  type metadata accessor for DecodingBuffer();
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = v14;
  v17[3] = v22;
  v17[4] = v15;
  v17[5] = v16;
  v17[6] = 0;
  type metadata accessor for _XPCUnkeyedDecodingContainer.UnkeyedDecodingStorage();
  v18 = (_QWORD *)swift_allocObject();
  v18[3] = v7;
  v18[4] = 0;
  v18[2] = v17;
  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = v18;
  return result;
}

Swift::Bool __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _XPCUnkeyedDecodingContainer.decodeNil()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::Bool result;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD **)(v1 + 16);
  v3 = v2[4];
  v4 = v2[5] >> 1;
  if (__OFSUB__(v4, v3))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v5 = v2[6];
  if (v5 >= v4 - v3)
    goto LABEL_11;
  v6 = v3 + v5;
  if (!__OFADD__(v3, v5))
  {
    if (v6 < v3 || v6 >= v4)
      goto LABEL_17;
    if (*(_BYTE *)(v2[3] + v6) == 1)
    {
      v2[6] = v5 + 1;
      result = 1;
      goto LABEL_12;
    }
LABEL_11:
    result = 0;
LABEL_12:
    v9 = *(_QWORD *)(v1 + 32);
    v10 = __OFADD__(v9, 1);
    v11 = v9 + 1;
    if (!v10)
    {
      *(_QWORD *)(v1 + 32) = v11;
      return result;
    }
    goto LABEL_15;
  }
LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
  return result;
}

uint64_t specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  int v11;

  v2 = v0[4];
  v3 = v0[2];
  v4 = v0[3];
  v5 = swift_retain();
  v6 = specialized static XPCDecoder.decode<A>(from:withCodingMetadata:)(v5, v3, v4);
  result = swift_release();
  v8 = *(_QWORD *)(v2 + 32);
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  v11 = v9;
  if (v1)
  {
    if (!v11)
    {
LABEL_8:
      *(_QWORD *)(v2 + 32) = v10;
      return v6 & 1;
    }
    __break(1u);
  }
  if ((v11 & 1) == 0)
    goto LABEL_8;
  __break(1u);
  return result;
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  int v11;

  v2 = v0[4];
  v3 = v0[2];
  v4 = v0[3];
  v5 = swift_retain();
  v6 = specialized static XPCDecoder.decode<A>(from:withCodingMetadata:)(v5, v3, v4);
  result = swift_release();
  v8 = *(_QWORD *)(v2 + 32);
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  v11 = v9;
  if (v1)
  {
    if (!v11)
    {
LABEL_8:
      *(_QWORD *)(v2 + 32) = v10;
      return v6;
    }
    __break(1u);
  }
  if ((v11 & 1) == 0)
    goto LABEL_8;
  __break(1u);
  return result;
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int v10;

  v2 = v0[4];
  v3 = v0[2];
  v4 = v0[3];
  v5 = swift_retain();
  specialized static XPCDecoder.decode<A>(from:withCodingMetadata:)(v5, v3, v4);
  result = swift_release();
  v7 = *(_QWORD *)(v2 + 32);
  v8 = __OFADD__(v7, 1);
  v9 = v7 + 1;
  v10 = v8;
  if (v1)
  {
    if (!v10)
    {
LABEL_8:
      *(_QWORD *)(v2 + 32) = v9;
      return result;
    }
    __break(1u);
  }
  if ((v10 & 1) == 0)
    goto LABEL_8;
  __break(1u);
  return result;
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int v10;

  v2 = v0[4];
  v3 = v0[2];
  v4 = v0[3];
  v5 = swift_retain();
  specialized static XPCDecoder.decode<A>(from:withCodingMetadata:)(v5, v3, v4);
  result = swift_release();
  v7 = *(_QWORD *)(v2 + 32);
  v8 = __OFADD__(v7, 1);
  v9 = v7 + 1;
  v10 = v8;
  if (v1)
  {
    if (!v10)
    {
LABEL_8:
      *(_QWORD *)(v2 + 32) = v9;
      return result;
    }
    __break(1u);
  }
  if ((v10 & 1) == 0)
    goto LABEL_8;
  __break(1u);
  return result;
}

uint64_t specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)(uint64_t (*a1)(uint64_t), uint64_t (*a2)(void), uint64_t (*a3)(_QWORD *))
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(_QWORD *);
  uint64_t result;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  int v17;

  v8 = v3[4];
  v10 = v3[2];
  v9 = v3[3];
  v11 = swift_retain();
  v12 = specialized static XPCDecoder.decode<A>(from:withCodingMetadata:)(v11, v10, v9, a1, a2, a3);
  result = swift_release();
  v14 = *(_QWORD *)(v8 + 32);
  v15 = __OFADD__(v14, 1);
  v16 = v14 + 1;
  v17 = v15;
  if (v4)
  {
    if (!v17)
    {
LABEL_8:
      *(_QWORD *)(v8 + 32) = v16;
      return (uint64_t)v12;
    }
    __break(1u);
  }
  if ((v17 & 1) == 0)
    goto LABEL_8;
  __break(1u);
  return result;
}

uint64_t _XPCUnkeyedDecodingContainer.decode<A>(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int v14;

  type metadata accessor for XPCDecoder();
  v6 = v2[4];
  v8 = v2[2];
  v7 = v2[3];
  v9 = swift_retain();
  static XPCDecoder.decode<A>(from:withCodingMetadata:)(v9, v8, v7, a1, a2);
  result = swift_release();
  v11 = *(_QWORD *)(v6 + 32);
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  v14 = v12;
  if (v3)
  {
    if (!v14)
    {
LABEL_8:
      *(_QWORD *)(v6 + 32) = v13;
      return result;
    }
    __break(1u);
  }
  if ((v14 & 1) == 0)
    goto LABEL_8;
  __break(1u);
  return result;
}

uint64_t _XPCUnkeyedDecodingContainer.nestedContainer<A>(keyedBy:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  Swift::String v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t inited;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t result;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = v3;
  v7 = *(_QWORD *)(v3 + 32);
  v8 = *(_QWORD *)(v7 + 32);
  v9._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(v3 + 16);
  v11 = *(_QWORD *)(v4 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DF04A630;
  *(_QWORD *)(inited + 56) = &type metadata for CodableIndexKey;
  *(_QWORD *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  v13 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v13;
  *(_QWORD *)(v13 + 16) = 0x207865646E49;
  *(_QWORD *)(v13 + 24) = 0xE600000000000000;
  *(_QWORD *)(v13 + 32) = v8;
  *(_BYTE *)(v13 + 40) = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((_QWORD *)inited);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15 = type metadata accessor for _XPCKeyedDecodingContainer(0, a2, a3, v14);
  v16 = *(_QWORD **)(v7 + 16);
  swift_retain();
  result = (uint64_t)_XPCKeyedDecodingContainer.__allocating_init(codingMetadata:initialStorage:)(v10, v11, v16);
  if (v22)
  {
    v18 = *(_QWORD *)(v7 + 32);
    v19 = __OFADD__(v18, 1);
    v20 = v18 + 1;
    if (!v19)
      goto LABEL_6;
    __break(1u);
  }
  MEMORY[0x1DF0F49E8](&protocol conformance descriptor for _XPCKeyedDecodingContainer<A>, v15);
  result = KeyedDecodingContainer.init<A>(_:)();
  v21 = *(_QWORD *)(v7 + 32);
  v19 = __OFADD__(v21, 1);
  v20 = v21 + 1;
  if (!v19)
  {
LABEL_6:
    *(_QWORD *)(v7 + 32) = v20;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t _XPCUnkeyedDecodingContainer.nestedUnkeyedContainer()@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  Swift::String v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t inited;
  uint64_t v12;
  _QWORD *v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = v2;
  v4 = v1;
  v5 = *v1;
  v6 = v1[4];
  v7 = *(_QWORD *)(v6 + 32);
  v8._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9 = v1[2];
  v10 = v4[3];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DF04A630;
  *(_QWORD *)(inited + 56) = &type metadata for CodableIndexKey;
  *(_QWORD *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  v12 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v12;
  *(_QWORD *)(v12 + 16) = 0x207865646E49;
  *(_QWORD *)(v12 + 24) = 0xE600000000000000;
  *(_QWORD *)(v12 + 32) = v7;
  *(_BYTE *)(v12 + 40) = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((_QWORD *)inited);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = *(_QWORD **)(v6 + 16);
  swift_retain();
  result = (uint64_t)_XPCUnkeyedDecodingContainer.__allocating_init(codingMetadata:buffer:)(v9, v10, v13);
  if (v3)
  {
    v16 = *(_QWORD *)(v6 + 32);
    v17 = __OFADD__(v16, 1);
    v18 = v16 + 1;
    if (!v17)
      goto LABEL_6;
    __break(1u);
  }
  v19 = result;
  a1[3] = v5;
  result = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCUnkeyedDecodingContainer and conformance _XPCUnkeyedDecodingContainer, v15, (uint64_t (*)(uint64_t))type metadata accessor for _XPCUnkeyedDecodingContainer, (uint64_t)&protocol conformance descriptor for _XPCUnkeyedDecodingContainer);
  a1[4] = result;
  *a1 = v19;
  v20 = *(_QWORD *)(v6 + 32);
  v17 = __OFADD__(v20, 1);
  v18 = v20 + 1;
  if (!v17)
  {
LABEL_6:
    *(_QWORD *)(v6 + 32) = v18;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t _XPCUnkeyedDecodingContainer.superDecoder()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  Swift::String v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t inited;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v2 = v1;
  v4 = *(_QWORD *)(v1 + 32);
  v5 = *(_QWORD *)(v4 + 32);
  v6._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(v1 + 16);
  v8 = *(_QWORD *)(v2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DF04A630;
  *(_QWORD *)(inited + 56) = &type metadata for CodableIndexKey;
  *(_QWORD *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  v10 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v10;
  *(_QWORD *)(v10 + 16) = 0x207865646E49;
  *(_QWORD *)(v10 + 24) = v16;
  *(_QWORD *)(v10 + 32) = v5;
  *(_BYTE *)(v10 + 40) = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((_QWORD *)inited);
  v11 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(v4 + 16);
  v13 = type metadata accessor for _XPCDecoder();
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 56) = 0u;
  *(_QWORD *)(v14 + 72) = 0;
  *(_QWORD *)(v14 + 24) = v8;
  *(_QWORD *)(v14 + 32) = v12;
  *(_QWORD *)(v14 + 16) = v11;
  a1[3] = v13;
  a1[4] = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
  *a1 = v14;
  return swift_retain();
}

uint64_t _XPCUnkeyedDecodingContainer.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for _XPCUnkeyedDecodingContainer()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for _XPCUnkeyedDecodingContainer.UnkeyedDecodingStorage()
{
  return objc_opt_self();
}

uint64_t protocol witness for UnkeyedDecodingContainer.codingPath.getter in conformance _XPCUnkeyedDecodingContainer()
{
  return swift_bridgeObjectRetain();
}

uint64_t protocol witness for UnkeyedDecodingContainer.count.getter in conformance _XPCUnkeyedDecodingContainer()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 32) + 24);
}

BOOL protocol witness for UnkeyedDecodingContainer.isAtEnd.getter in conformance _XPCUnkeyedDecodingContainer()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 32) + 32) == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 32) + 24);
}

uint64_t protocol witness for UnkeyedDecodingContainer.currentIndex.getter in conformance _XPCUnkeyedDecodingContainer()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 32) + 32);
}

BOOL protocol witness for UnkeyedDecodingContainer.decodeNil() in conformance _XPCUnkeyedDecodingContainer()
{
  return _XPCUnkeyedDecodingContainer.decodeNil()();
}

uint64_t protocol witness for UnkeyedDecodingContainer.decode(_:) in conformance _XPCUnkeyedDecodingContainer()
{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)() & 1;
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)((uint64_t (*)(uint64_t))specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:), specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>(), MEMORY[0x1E0DEB3F8]);
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)((uint64_t (*)(uint64_t))specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:), specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>(), MEMORY[0x1E0DEDA58]);
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)((uint64_t (*)(uint64_t))specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:), specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>(), MEMORY[0x1E0DEDB40]);
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)((uint64_t (*)(uint64_t))specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:), specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>(), MEMORY[0x1E0DEDBB0]);
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)((uint64_t (*)(uint64_t))specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:), specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>(), MEMORY[0x1E0DEDC40]);
}

{
  return UnkeyedDecodingContainer.decode(_:)();
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)((uint64_t (*)(uint64_t))specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:), specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>(), MEMORY[0x1E0DEBB78]);
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)((uint64_t (*)(uint64_t))specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:), specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>(), MEMORY[0x1E0DEDE58]);
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)((uint64_t (*)(uint64_t))specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:), specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>(), MEMORY[0x1E0DEE050]);
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)((uint64_t (*)(uint64_t))specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:), specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>(), MEMORY[0x1E0DEE0D8]);
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)((uint64_t (*)(uint64_t))specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:), specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>(), MEMORY[0x1E0DEE170]);
}

{
  return UnkeyedDecodingContainer.decode(_:)();
}

uint64_t protocol witness for UnkeyedDecodingContainer.decode<A>(_:) in conformance _XPCUnkeyedDecodingContainer@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return _XPCUnkeyedDecodingContainer.decode<A>(_:)(a1, a2);
}

uint64_t protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer()
{
  return UnkeyedDecodingContainer.decodeIfPresent(_:)();
}

{
  return UnkeyedDecodingContainer.decodeIfPresent(_:)();
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = UnkeyedDecodingContainer.decodeIfPresent(_:)();
  if (v0)
    return v2;
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = UnkeyedDecodingContainer.decodeIfPresent(_:)();
  if (v0)
    return v2;
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = UnkeyedDecodingContainer.decodeIfPresent(_:)();
  if (v0)
    return v2;
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = UnkeyedDecodingContainer.decodeIfPresent(_:)();
  if (v0)
    return v2;
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = UnkeyedDecodingContainer.decodeIfPresent(_:)();
  if (v0)
    return v2;
  return result;
}

uint64_t protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer(uint64_t a1, uint64_t a2)
{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer(a1, a2, MEMORY[0x1E0DED2E0]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer(a1, a2, MEMORY[0x1E0DED300]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer(a1, a2, MEMORY[0x1E0DED308]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer(a1, a2, MEMORY[0x1E0DED310]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer(a1, a2, MEMORY[0x1E0DED328]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer(a1, a2, MEMORY[0x1E0DED320]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer(a1, a2, MEMORY[0x1E0DED330]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer(a1, a2, MEMORY[0x1E0DED338]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer(a1, a2, MEMORY[0x1E0DED348]);
}

uint64_t protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 0x1FF;
}

{
  return a3() & 0x1FFFF;
}

{
  unint64_t v3;

  v3 = a3();
  return v3 | ((HIDWORD(v3) & 1) << 32);
}

{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  result = a3();
  if (v3)
    return v5;
  return result;
}

uint64_t protocol witness for UnkeyedDecodingContainer.decodeIfPresent<A>(_:) in conformance _XPCUnkeyedDecodingContainer()
{
  return UnkeyedDecodingContainer.decodeIfPresent<A>(_:)();
}

uint64_t protocol witness for UnkeyedDecodingContainer.nestedContainer<A>(keyedBy:) in conformance _XPCUnkeyedDecodingContainer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _XPCUnkeyedDecodingContainer.nestedContainer<A>(keyedBy:)(a1, a2, a3);
}

uint64_t protocol witness for UnkeyedDecodingContainer.nestedUnkeyedContainer() in conformance _XPCUnkeyedDecodingContainer@<X0>(uint64_t *a1@<X8>)
{
  return _XPCUnkeyedDecodingContainer.nestedUnkeyedContainer()(a1);
}

uint64_t protocol witness for UnkeyedDecodingContainer.superDecoder() in conformance _XPCUnkeyedDecodingContainer@<X0>(uint64_t *a1@<X8>)
{
  return _XPCUnkeyedDecodingContainer.superDecoder()(a1);
}

_QWORD *protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance _XPCUnkeyedDecodingContainer@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  _QWORD *result;

  result = _XPCUnkeyedDecodingContainer.__allocating_init(codingMetadata:buffer:)(a1, a2, a3);
  if (!v4)
    *a4 = result;
  return result;
}

uint64_t protocol witness for SharableStorageContainer.storage.getter in conformance _XPCUnkeyedDecodingContainer@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(*(_QWORD *)v1 + 32);
  return swift_retain();
}

_QWORD *protocol witness for SharableStorageContainer.init(codingMetadata:storage:) in conformance _XPCUnkeyedDecodingContainer@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;
  _QWORD *result;

  v7 = *a3;
  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = v7;
  *a4 = result;
  return result;
}

_QWORD *protocol witness for SharableStorageContainer.init(codingMetadata:initialStorage:) in conformance _XPCUnkeyedDecodingContainer@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD **a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  _QWORD *result;

  result = _XPCUnkeyedDecodingContainer.__allocating_init(codingMetadata:buffer:)(a1, a2, *a3);
  if (!v4)
    *a4 = result;
  return result;
}

uint64_t protocol witness for CodingContainerWithMetadata.codingMetadata.getter in conformance _XPCUnkeyedDecodingContainer()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance _XPCUnkeyedDecodingContainer()
{
  return 15;
}

unint64_t lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CodableIndexKey and conformance CodableIndexKey;
  if (!lazy protocol witness table cache variable for type CodableIndexKey and conformance CodableIndexKey)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for CodableIndexKey, &type metadata for CodableIndexKey);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CodableIndexKey and conformance CodableIndexKey);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CodableIndexKey and conformance CodableIndexKey;
  if (!lazy protocol witness table cache variable for type CodableIndexKey and conformance CodableIndexKey)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for CodableIndexKey, &type metadata for CodableIndexKey);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CodableIndexKey and conformance CodableIndexKey);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CodableIndexKey and conformance CodableIndexKey;
  if (!lazy protocol witness table cache variable for type CodableIndexKey and conformance CodableIndexKey)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for CodableIndexKey, &type metadata for CodableIndexKey);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CodableIndexKey and conformance CodableIndexKey);
  }
  return result;
}

uint64_t sub_1DF01D72C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1)
    swift_once();
  if (one-time initialization token for global != -1)
    swift_once();
  swift_beginAccess();
  v0 = MEMORY[0x1E0DEAFA0];
  v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x1E0DEAFA0], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2())
      v2 = v0;
    else
      v2 = 0;
    v3 = v2 != 0;
    swift_beginAccess();
    v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = v4[2];
    v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1)
    swift_once();
  if (one-time initialization token for global != -1)
    swift_once();
  swift_beginAccess();
  v0 = MEMORY[0x1E0DEA968];
  v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x1E0DEA968], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2())
      v2 = v0;
    else
      v2 = 0;
    v3 = v2 != 0;
    swift_beginAccess();
    v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = v4[2];
    v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1)
    swift_once();
  if (one-time initialization token for global != -1)
    swift_once();
  swift_beginAccess();
  v0 = MEMORY[0x1E0DEB070];
  v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x1E0DEB070], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2())
      v2 = v0;
    else
      v2 = 0;
    v3 = v2 != 0;
    swift_beginAccess();
    v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = v4[2];
    v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1)
    swift_once();
  if (one-time initialization token for global != -1)
    swift_once();
  swift_beginAccess();
  v0 = MEMORY[0x1E0DEB188];
  v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x1E0DEB188], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2())
      v2 = v0;
    else
      v2 = 0;
    v3 = v2 != 0;
    swift_beginAccess();
    v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = v4[2];
    v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1)
    swift_once();
  if (one-time initialization token for global != -1)
    swift_once();
  swift_beginAccess();
  v0 = MEMORY[0x1E0DEB418];
  v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x1E0DEB418], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2())
      v2 = v0;
    else
      v2 = 0;
    v3 = v2 != 0;
    swift_beginAccess();
    v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = v4[2];
    v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1)
    swift_once();
  if (one-time initialization token for global != -1)
    swift_once();
  swift_beginAccess();
  v0 = MEMORY[0x1E0DEDA70];
  v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x1E0DEDA70], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2())
      v2 = v0;
    else
      v2 = 0;
    v3 = v2 != 0;
    swift_beginAccess();
    v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = v4[2];
    v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1)
    swift_once();
  if (one-time initialization token for global != -1)
    swift_once();
  swift_beginAccess();
  v0 = MEMORY[0x1E0DEDB58];
  v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x1E0DEDB58], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2())
      v2 = v0;
    else
      v2 = 0;
    v3 = v2 != 0;
    swift_beginAccess();
    v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = v4[2];
    v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1)
    swift_once();
  if (one-time initialization token for global != -1)
    swift_once();
  swift_beginAccess();
  v0 = MEMORY[0x1E0DEDBC8];
  v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x1E0DEDBC8], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2())
      v2 = v0;
    else
      v2 = 0;
    v3 = v2 != 0;
    swift_beginAccess();
    v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = v4[2];
    v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1)
    swift_once();
  if (one-time initialization token for global != -1)
    swift_once();
  swift_beginAccess();
  v0 = MEMORY[0x1E0DEDC60];
  v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x1E0DEDC60], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2())
      v2 = v0;
    else
      v2 = 0;
    v3 = v2 != 0;
    swift_beginAccess();
    v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = v4[2];
    v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1)
    swift_once();
  if (one-time initialization token for global != -1)
    swift_once();
  swift_beginAccess();
  v0 = MEMORY[0x1E0DEBB98];
  v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x1E0DEBB98], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2())
      v2 = v0;
    else
      v2 = 0;
    v3 = v2 != 0;
    swift_beginAccess();
    v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = v4[2];
    v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1)
    swift_once();
  if (one-time initialization token for global != -1)
    swift_once();
  swift_beginAccess();
  v0 = MEMORY[0x1E0DEDE70];
  v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x1E0DEDE70], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2())
      v2 = v0;
    else
      v2 = 0;
    v3 = v2 != 0;
    swift_beginAccess();
    v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = v4[2];
    v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1)
    swift_once();
  if (one-time initialization token for global != -1)
    swift_once();
  swift_beginAccess();
  v0 = MEMORY[0x1E0DEE068];
  v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x1E0DEE068], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2())
      v2 = v0;
    else
      v2 = 0;
    v3 = v2 != 0;
    swift_beginAccess();
    v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = v4[2];
    v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1)
    swift_once();
  if (one-time initialization token for global != -1)
    swift_once();
  swift_beginAccess();
  v0 = MEMORY[0x1E0DEE0F8];
  v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x1E0DEE0F8], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2())
      v2 = v0;
    else
      v2 = 0;
    v3 = v2 != 0;
    swift_beginAccess();
    v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = v4[2];
    v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1)
    swift_once();
  if (one-time initialization token for global != -1)
    swift_once();
  swift_beginAccess();
  v0 = MEMORY[0x1E0DEE190];
  v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x1E0DEE190], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2())
      v2 = v0;
    else
      v2 = 0;
    v3 = v2 != 0;
    swift_beginAccess();
    v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = v4[2];
    v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

BOOL specialized Set.contains(_:)(Swift::UInt a1, uint64_t a2)
{
  Swift::Int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 result;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  v4 = Hasher._finalize()();
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = v4 & ~v5;
  v7 = a2 + 56;
  if (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(a2 + 48);
  if (*(_QWORD *)(v8 + 8 * v6) == a1)
    return 1;
  v9 = ~v5;
  v10 = (v6 + 1) & v9;
  if (((*(_QWORD *)(v7 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
    return 0;
  do
  {
    v11 = *(_QWORD *)(v8 + 8 * v10);
    result = v11 == a1;
    if (v11 == a1)
      break;
    v10 = (v10 + 1) & v9;
  }
  while (((*(_QWORD *)(v7 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  return result;
}

uint64_t specialized static XPCDecoder.decode<A>(from:withCodingMetadata:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v7;
  uint64_t v8;
  char v9;

  v7 = type metadata accessor for _XPCDecoder();
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_QWORD *)(v8 + 72) = 0;
  *(_QWORD *)(v8 + 24) = a3;
  *(_QWORD *)(v8 + 32) = a1;
  *(_QWORD *)(v8 + 16) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) != 0)
  {
    v7 = specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>()();
    swift_release();
  }
  else
  {
    lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
    v9 = Bool.init(from:)();
    if (!v3)
      v7 = v9;
  }
  return v7 & 1;
}

{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = type metadata accessor for _XPCDecoder();
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_QWORD *)(v8 + 72) = 0;
  *(_QWORD *)(v8 + 24) = a3;
  *(_QWORD *)(v8 + 32) = a1;
  *(_QWORD *)(v8 + 16) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) != 0)
  {
    v7 = specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>()();
    swift_release();
  }
  else
  {
    lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
    v9 = String.init(from:)();
    if (!v3)
      return v9;
  }
  return v7;
}

double specialized static XPCDecoder.decode<A>(from:withCodingMetadata:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  double v4;
  uint64_t v8;
  double v9;
  double v10;

  type metadata accessor for _XPCDecoder();
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_QWORD *)(v8 + 72) = 0;
  *(_QWORD *)(v8 + 24) = a3;
  *(_QWORD *)(v8 + 32) = a1;
  *(_QWORD *)(v8 + 16) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) != 0)
  {
    specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>()();
    v4 = v9;
    swift_release();
  }
  else
  {
    lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
    Double.init(from:)();
    if (!v3)
      return v10;
  }
  return v4;
}

float specialized static XPCDecoder.decode<A>(from:withCodingMetadata:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  float v4;
  uint64_t v8;
  float v9;
  float v10;

  type metadata accessor for _XPCDecoder();
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_QWORD *)(v8 + 72) = 0;
  *(_QWORD *)(v8 + 24) = a3;
  *(_QWORD *)(v8 + 32) = a1;
  *(_QWORD *)(v8 + 16) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) != 0)
  {
    specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>()();
    v4 = v9;
    swift_release();
  }
  else
  {
    lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
    Float.init(from:)();
    if (!v3)
      return v10;
  }
  return v4;
}

uint64_t (*specialized static XPCDecoder.decode<A>(from:withCodingMetadata:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(void), uint64_t (*a6)(_QWORD *)))(_QWORD *)
{
  uint64_t v6;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[5];

  v13 = type metadata accessor for _XPCDecoder();
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 56) = 0u;
  *(_QWORD *)(v14 + 72) = 0;
  *(_QWORD *)(v14 + 24) = a3;
  *(_QWORD *)(v14 + 32) = a1;
  *(_QWORD *)(v14 + 16) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v15 = swift_retain();
  if ((a4(v15) & 1) != 0)
  {
    a6 = (uint64_t (*)(_QWORD *))a5();
    swift_release();
  }
  else
  {
    v18[3] = v13;
    v18[4] = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
    v18[0] = v14;
    v16 = a6(v18);
    if (!v6)
      return (uint64_t (*)(_QWORD *))v16;
  }
  return a6;
}

uint64_t specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  uint64_t v13;
  void (*v14)(uint64_t *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v2 = v0;
  v3 = MEMORY[0x1E0DEAFA0];
  v4 = swift_conformsToProtocol2();
  if (v4)
    v5 = v4;
  else
    v5 = 0;
  if (v4)
    v6 = v3;
  else
    v6 = 0;
  if (v6)
  {
    v48 = type metadata accessor for _XPCDecoder();
    v49 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
    v46 = v2;
    swift_retain();
    XPCCodableObject.init(from:)(&v46, (uint64_t *)&v43);
    if (!v1)
    {
      v8 = v43;
      v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
      v10 = v9(v6, v5);
      v11 = MEMORY[0x1DF0F4CB8](v8);
      v12 = specialized Set.contains(_:)(v11, v10);
      swift_bridgeObjectRelease();
      if (!v12)
      {
        v46 = 0;
        v47 = 0xE000000000000000;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        _StringGuts.grow(_:)(81);
        v29._countAndFlagsBits = 0x2065707954;
        v29._object = (void *)0xE500000000000000;
        String.append(_:)(v29);
        v30._countAndFlagsBits = 1819242306;
        v30._object = (void *)0xE400000000000000;
        String.append(_:)(v30);
        v31._countAndFlagsBits = 0xD000000000000028;
        v31._object = (void *)0x80000001DF04E8A0;
        String.append(_:)(v31);
        v9(v6, v5);
        v32._countAndFlagsBits = Set.description.getter();
        String.append(_:)(v32);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v33._countAndFlagsBits = 0xD00000000000001ELL;
        v33._object = (void *)0x80000001DF04E8D0;
        String.append(_:)(v33);
        *(_QWORD *)&v43 = MEMORY[0x1DF0F4CB8](v8);
        _print_unlocked<A, B>(_:_:)();
        v34 = v46;
        v35 = (void *)v47;
        type metadata accessor for DecodingError();
        swift_allocError();
        typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEAFA0], v34, v35, v36);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_willThrow();
        goto LABEL_14;
      }
      v50 = v8;
      v13 = v8;
      v14 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
      v15 = type metadata accessor for Optional();
      v41 = (uint64_t)&v41;
      v16 = *(_QWORD *)(v15 - 8);
      MEMORY[0x1E0C80A78](v15);
      v18 = (char *)&v41 - v17;
      v42 = v13;
      swift_unknownObjectRetain();
      v14(&v50, v6, v5);
      v19 = *(_QWORD *)(v6 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
      {
        (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
        v46 = 0;
        v47 = 0xE000000000000000;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        _StringGuts.grow(_:)(31);
        v20._object = (void *)0x80000001DF04E8F0;
        v20._countAndFlagsBits = 0xD000000000000015;
        String.append(_:)(v20);
        v21._countAndFlagsBits = 1819242306;
        v21._object = (void *)0xE400000000000000;
        String.append(_:)(v21);
        v22._countAndFlagsBits = 0x206D6F726620;
        v22._object = (void *)0xE600000000000000;
        String.append(_:)(v22);
        *(_QWORD *)&v43 = v42;
        _print_unlocked<A, B>(_:_:)();
        v23 = type metadata accessor for DecodingError();
        swift_allocError();
        v25 = v24;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
        (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x1E0DEC458], v23);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_willThrow();
LABEL_14:
        swift_unknownObjectRelease();
        return v7 & 1;
      }
      v44 = v6;
      v45 = v5;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v43);
      (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
      outlined init with take of Encodable(&v43, (uint64_t)&v46);
      outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v46, (uint64_t)&v43);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
      if ((swift_dynamicCast() & 1) != 0)
      {
        swift_unknownObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
        v7 = v50 & 1;
      }
      else
      {
        type metadata accessor for DecodingError();
        swift_allocError();
        v40 = v39;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEAFA0], 0, (void *)0xE000000000000000, v40);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_willThrow();
        swift_unknownObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
      }
    }
  }
  else
  {
    v46 = 0;
    v47 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    v26 = type metadata accessor for DecodingError();
    swift_allocError();
    v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v28, *MEMORY[0x1E0DEC458], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_willThrow();
  }
  return v7 & 1;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  uint64_t v13;
  void (*v14)(uint64_t *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD v40[2];
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v2 = v0;
  v3 = MEMORY[0x1E0DEA968];
  v4 = swift_conformsToProtocol2();
  if (v4)
    v5 = v4;
  else
    v5 = 0;
  if (v4)
    v6 = v3;
  else
    v6 = 0;
  if (!v6)
  {
    v45 = 0;
    v46 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    v26 = type metadata accessor for DecodingError();
    swift_allocError();
    v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v28, *MEMORY[0x1E0DEC458], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  v47 = type metadata accessor for _XPCDecoder();
  v48 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
  v45 = v2;
  swift_retain();
  result = XPCCodableObject.init(from:)(&v45, (uint64_t *)&v42);
  if (!v1)
  {
    v8 = v42;
    v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    v10 = v9(v6, v5);
    v11 = MEMORY[0x1DF0F4CB8](v8);
    v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      v45 = 0;
      v46 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 0x676E69727453;
      v30._object = (void *)0xE600000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x80000001DF04E8A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x80000001DF04E8D0;
      String.append(_:)(v33);
      *(_QWORD *)&v42 = MEMORY[0x1DF0F4CB8](v8);
      _print_unlocked<A, B>(_:_:)();
      v34 = v45;
      v35 = (void *)v46;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEA968], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v41 = v8;
    v13 = v8;
    v14 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    v15 = type metadata accessor for Optional();
    v40[1] = v40;
    v16 = *(_QWORD *)(v15 - 8);
    MEMORY[0x1E0C80A78](v15);
    v18 = (char *)v40 - v17;
    v49 = v13;
    swift_unknownObjectRetain();
    v14(&v41, v6, v5);
    v19 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      v45 = 0;
      v46 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x80000001DF04E8F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 0x676E69727453;
      v21._object = (void *)0xE600000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(_QWORD *)&v42 = v49;
      _print_unlocked<A, B>(_:_:)();
      v23 = type metadata accessor for DecodingError();
      swift_allocError();
      v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x1E0DEC458], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v43 = v6;
    v44 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v42);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v42, (uint64_t)&v45);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v45, (uint64_t)&v42);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if ((swift_dynamicCast() & 1) != 0)
    {
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v45);
      return v41;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEA968], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v45);
    }
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  uint64_t v13;
  void (*v14)(uint64_t *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD v40[2];
  uint64_t v41;
  char v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v2 = v0;
  v3 = MEMORY[0x1E0DEB070];
  v4 = swift_conformsToProtocol2();
  if (v4)
    v5 = v4;
  else
    v5 = 0;
  if (v4)
    v6 = v3;
  else
    v6 = 0;
  if (!v6)
  {
    v46 = 0;
    v47 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    v26 = type metadata accessor for DecodingError();
    swift_allocError();
    v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v28, *MEMORY[0x1E0DEC458], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  v48 = type metadata accessor for _XPCDecoder();
  v49 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
  v46 = v2;
  swift_retain();
  result = XPCCodableObject.init(from:)(&v46, (uint64_t *)&v43);
  if (!v1)
  {
    v8 = v43;
    v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    v10 = v9(v6, v5);
    v11 = MEMORY[0x1DF0F4CB8](v8);
    v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      v46 = 0;
      v47 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 0x656C62756F44;
      v30._object = (void *)0xE600000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x80000001DF04E8A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x80000001DF04E8D0;
      String.append(_:)(v33);
      *(_QWORD *)&v43 = MEMORY[0x1DF0F4CB8](v8);
      _print_unlocked<A, B>(_:_:)();
      v34 = v46;
      v35 = (void *)v47;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEB070], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v41 = v8;
    v13 = v8;
    v14 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    v15 = type metadata accessor for Optional();
    v40[1] = v40;
    v16 = *(_QWORD *)(v15 - 8);
    MEMORY[0x1E0C80A78](v15);
    v18 = (char *)v40 - v17;
    v50 = v13;
    swift_unknownObjectRetain();
    v14(&v41, v6, v5);
    v19 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      v46 = 0;
      v47 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x80000001DF04E8F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 0x656C62756F44;
      v21._object = (void *)0xE600000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(_QWORD *)&v43 = v50;
      _print_unlocked<A, B>(_:_:)();
      v23 = type metadata accessor for DecodingError();
      swift_allocError();
      v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x1E0DEC458], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v44 = v6;
    v45 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v43);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v43, (uint64_t)&v46);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v46, (uint64_t)&v43);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v42 = 0;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEB070], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
    }
    swift_unknownObjectRelease();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  uint64_t v13;
  void (*v14)(uint64_t *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v2 = v0;
  v3 = MEMORY[0x1E0DEB188];
  v4 = swift_conformsToProtocol2();
  if (v4)
    v5 = v4;
  else
    v5 = 0;
  if (v4)
    v6 = v3;
  else
    v6 = 0;
  if (!v6)
  {
    v45 = 0;
    v46 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    v26 = type metadata accessor for DecodingError();
    swift_allocError();
    v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v28, *MEMORY[0x1E0DEC458], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  v47 = type metadata accessor for _XPCDecoder();
  v48 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
  v45 = v2;
  swift_retain();
  result = XPCCodableObject.init(from:)(&v45, (uint64_t *)&v42);
  if (!v1)
  {
    v8 = v42;
    v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    v10 = v9(v6, v5);
    v11 = MEMORY[0x1DF0F4CB8](v8);
    v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      v45 = 0;
      v46 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 0x74616F6C46;
      v30._object = (void *)0xE500000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x80000001DF04E8A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x80000001DF04E8D0;
      String.append(_:)(v33);
      *(_QWORD *)&v42 = MEMORY[0x1DF0F4CB8](v8);
      _print_unlocked<A, B>(_:_:)();
      v34 = v45;
      v35 = (void *)v46;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEB188], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v49 = v8;
    v13 = v8;
    v14 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    v15 = type metadata accessor for Optional();
    v40 = (uint64_t)&v40;
    v16 = *(_QWORD *)(v15 - 8);
    MEMORY[0x1E0C80A78](v15);
    v18 = (char *)&v40 - v17;
    v41 = v13;
    swift_unknownObjectRetain();
    v14(&v49, v6, v5);
    v19 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      v45 = 0;
      v46 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x80000001DF04E8F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 0x74616F6C46;
      v21._object = (void *)0xE500000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(_QWORD *)&v42 = v41;
      _print_unlocked<A, B>(_:_:)();
      v23 = type metadata accessor for DecodingError();
      swift_allocError();
      v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x1E0DEC458], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v43 = v6;
    v44 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v42);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v42, (uint64_t)&v45);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v45, (uint64_t)&v42);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if ((swift_dynamicCast() & 1) != 0)
    {
      BYTE4(v49) = 0;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEB188], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
    }
    swift_unknownObjectRelease();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v45);
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  uint64_t v13;
  void (*v14)(uint64_t *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD v40[2];
  uint64_t v41;
  char v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v2 = v0;
  v3 = MEMORY[0x1E0DEB418];
  v4 = swift_conformsToProtocol2();
  if (v4)
    v5 = v4;
  else
    v5 = 0;
  if (v4)
    v6 = v3;
  else
    v6 = 0;
  if (!v6)
  {
    v46 = 0;
    v47 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    v26 = type metadata accessor for DecodingError();
    swift_allocError();
    v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v28, *MEMORY[0x1E0DEC458], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  v48 = type metadata accessor for _XPCDecoder();
  v49 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
  v46 = v2;
  swift_retain();
  result = XPCCodableObject.init(from:)(&v46, (uint64_t *)&v43);
  if (!v1)
  {
    v8 = v43;
    v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    v10 = v9(v6, v5);
    v11 = MEMORY[0x1DF0F4CB8](v8);
    v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      v46 = 0;
      v47 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 7630409;
      v30._object = (void *)0xE300000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x80000001DF04E8A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x80000001DF04E8D0;
      String.append(_:)(v33);
      *(_QWORD *)&v43 = MEMORY[0x1DF0F4CB8](v8);
      _print_unlocked<A, B>(_:_:)();
      v34 = v46;
      v35 = (void *)v47;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEB418], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v41 = v8;
    v13 = v8;
    v14 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    v15 = type metadata accessor for Optional();
    v40[1] = v40;
    v16 = *(_QWORD *)(v15 - 8);
    MEMORY[0x1E0C80A78](v15);
    v18 = (char *)v40 - v17;
    v50 = v13;
    swift_unknownObjectRetain();
    v14(&v41, v6, v5);
    v19 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      v46 = 0;
      v47 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x80000001DF04E8F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 7630409;
      v21._object = (void *)0xE300000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(_QWORD *)&v43 = v50;
      _print_unlocked<A, B>(_:_:)();
      v23 = type metadata accessor for DecodingError();
      swift_allocError();
      v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x1E0DEC458], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v44 = v6;
    v45 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v43);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v43, (uint64_t)&v46);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v46, (uint64_t)&v43);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v42 = 0;
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
      return v41;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEB418], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
    }
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  uint64_t v13;
  void (*v14)(uint64_t *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v2 = v0;
  v3 = MEMORY[0x1E0DEDA70];
  v4 = swift_conformsToProtocol2();
  if (v4)
    v5 = v4;
  else
    v5 = 0;
  if (v4)
    v6 = v3;
  else
    v6 = 0;
  if (!v6)
  {
    v45 = 0;
    v46 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    v26 = type metadata accessor for DecodingError();
    swift_allocError();
    v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v28, *MEMORY[0x1E0DEC458], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  v47 = type metadata accessor for _XPCDecoder();
  v48 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
  v45 = v2;
  swift_retain();
  result = XPCCodableObject.init(from:)(&v45, (uint64_t *)&v42);
  if (!v1)
  {
    v8 = v42;
    v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    v10 = v9(v6, v5);
    v11 = MEMORY[0x1DF0F4CB8](v8);
    v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      v45 = 0;
      v46 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 947154505;
      v30._object = (void *)0xE400000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x80000001DF04E8A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x80000001DF04E8D0;
      String.append(_:)(v33);
      *(_QWORD *)&v42 = MEMORY[0x1DF0F4CB8](v8);
      _print_unlocked<A, B>(_:_:)();
      v34 = v45;
      v35 = (void *)v46;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEDA70], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v49 = v8;
    v13 = v8;
    v14 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    v15 = type metadata accessor for Optional();
    v40 = (uint64_t)&v40;
    v16 = *(_QWORD *)(v15 - 8);
    MEMORY[0x1E0C80A78](v15);
    v18 = (char *)&v40 - v17;
    v41 = v13;
    swift_unknownObjectRetain();
    v14(&v49, v6, v5);
    v19 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      v45 = 0;
      v46 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x80000001DF04E8F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 947154505;
      v21._object = (void *)0xE400000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(_QWORD *)&v42 = v41;
      _print_unlocked<A, B>(_:_:)();
      v23 = type metadata accessor for DecodingError();
      swift_allocError();
      v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x1E0DEC458], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v43 = v6;
    v44 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v42);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v42, (uint64_t)&v45);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v45, (uint64_t)&v42);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if ((swift_dynamicCast() & 1) != 0)
    {
      BYTE1(v49) = 0;
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v45);
      return v49;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEDA70], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v45);
    }
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  uint64_t v13;
  void (*v14)(uint64_t *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v2 = v0;
  v3 = MEMORY[0x1E0DEDB58];
  v4 = swift_conformsToProtocol2();
  if (v4)
    v5 = v4;
  else
    v5 = 0;
  if (v4)
    v6 = v3;
  else
    v6 = 0;
  if (!v6)
  {
    v45 = 0;
    v46 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    v26 = type metadata accessor for DecodingError();
    swift_allocError();
    v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v28, *MEMORY[0x1E0DEC458], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  v47 = type metadata accessor for _XPCDecoder();
  v48 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
  v45 = v2;
  swift_retain();
  result = XPCCodableObject.init(from:)(&v45, (uint64_t *)&v42);
  if (!v1)
  {
    v8 = v42;
    v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    v10 = v9(v6, v5);
    v11 = MEMORY[0x1DF0F4CB8](v8);
    v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      v45 = 0;
      v46 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 0x3631746E49;
      v30._object = (void *)0xE500000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x80000001DF04E8A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x80000001DF04E8D0;
      String.append(_:)(v33);
      *(_QWORD *)&v42 = MEMORY[0x1DF0F4CB8](v8);
      _print_unlocked<A, B>(_:_:)();
      v34 = v45;
      v35 = (void *)v46;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEDB58], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v49 = v8;
    v13 = v8;
    v14 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    v15 = type metadata accessor for Optional();
    v40 = (uint64_t)&v40;
    v16 = *(_QWORD *)(v15 - 8);
    MEMORY[0x1E0C80A78](v15);
    v18 = (char *)&v40 - v17;
    v41 = v13;
    swift_unknownObjectRetain();
    v14(&v49, v6, v5);
    v19 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      v45 = 0;
      v46 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x80000001DF04E8F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 0x3631746E49;
      v21._object = (void *)0xE500000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(_QWORD *)&v42 = v41;
      _print_unlocked<A, B>(_:_:)();
      v23 = type metadata accessor for DecodingError();
      swift_allocError();
      v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x1E0DEC458], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v43 = v6;
    v44 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v42);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v42, (uint64_t)&v45);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v45, (uint64_t)&v42);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if ((swift_dynamicCast() & 1) != 0)
    {
      BYTE2(v49) = 0;
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v45);
      return (unsigned __int16)v49;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEDB58], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v45);
    }
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  uint64_t v13;
  void (*v14)(uint64_t *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v2 = v0;
  v3 = MEMORY[0x1E0DEDBC8];
  v4 = swift_conformsToProtocol2();
  if (v4)
    v5 = v4;
  else
    v5 = 0;
  if (v4)
    v6 = v3;
  else
    v6 = 0;
  if (!v6)
  {
    v45 = 0;
    v46 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    v26 = type metadata accessor for DecodingError();
    swift_allocError();
    v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v28, *MEMORY[0x1E0DEC458], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  v47 = type metadata accessor for _XPCDecoder();
  v48 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
  v45 = v2;
  swift_retain();
  result = XPCCodableObject.init(from:)(&v45, (uint64_t *)&v42);
  if (!v1)
  {
    v8 = v42;
    v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    v10 = v9(v6, v5);
    v11 = MEMORY[0x1DF0F4CB8](v8);
    v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      v45 = 0;
      v46 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 0x3233746E49;
      v30._object = (void *)0xE500000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x80000001DF04E8A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x80000001DF04E8D0;
      String.append(_:)(v33);
      *(_QWORD *)&v42 = MEMORY[0x1DF0F4CB8](v8);
      _print_unlocked<A, B>(_:_:)();
      v34 = v45;
      v35 = (void *)v46;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEDBC8], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v49 = v8;
    v13 = v8;
    v14 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    v15 = type metadata accessor for Optional();
    v40 = (uint64_t)&v40;
    v16 = *(_QWORD *)(v15 - 8);
    MEMORY[0x1E0C80A78](v15);
    v18 = (char *)&v40 - v17;
    v41 = v13;
    swift_unknownObjectRetain();
    v14(&v49, v6, v5);
    v19 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      v45 = 0;
      v46 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x80000001DF04E8F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 0x3233746E49;
      v21._object = (void *)0xE500000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(_QWORD *)&v42 = v41;
      _print_unlocked<A, B>(_:_:)();
      v23 = type metadata accessor for DecodingError();
      swift_allocError();
      v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x1E0DEC458], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v43 = v6;
    v44 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v42);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v42, (uint64_t)&v45);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v45, (uint64_t)&v42);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if ((swift_dynamicCast() & 1) != 0)
    {
      BYTE4(v49) = 0;
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v45);
      return v49;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEDBC8], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v45);
    }
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  uint64_t v13;
  void (*v14)(uint64_t *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD v40[2];
  uint64_t v41;
  char v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v2 = v0;
  v3 = MEMORY[0x1E0DEDC60];
  v4 = swift_conformsToProtocol2();
  if (v4)
    v5 = v4;
  else
    v5 = 0;
  if (v4)
    v6 = v3;
  else
    v6 = 0;
  if (!v6)
  {
    v46 = 0;
    v47 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    v26 = type metadata accessor for DecodingError();
    swift_allocError();
    v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v28, *MEMORY[0x1E0DEC458], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  v48 = type metadata accessor for _XPCDecoder();
  v49 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
  v46 = v2;
  swift_retain();
  result = XPCCodableObject.init(from:)(&v46, (uint64_t *)&v43);
  if (!v1)
  {
    v8 = v43;
    v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    v10 = v9(v6, v5);
    v11 = MEMORY[0x1DF0F4CB8](v8);
    v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      v46 = 0;
      v47 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 0x3436746E49;
      v30._object = (void *)0xE500000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x80000001DF04E8A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x80000001DF04E8D0;
      String.append(_:)(v33);
      *(_QWORD *)&v43 = MEMORY[0x1DF0F4CB8](v8);
      _print_unlocked<A, B>(_:_:)();
      v34 = v46;
      v35 = (void *)v47;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEDC60], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v41 = v8;
    v13 = v8;
    v14 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    v15 = type metadata accessor for Optional();
    v40[1] = v40;
    v16 = *(_QWORD *)(v15 - 8);
    MEMORY[0x1E0C80A78](v15);
    v18 = (char *)v40 - v17;
    v50 = v13;
    swift_unknownObjectRetain();
    v14(&v41, v6, v5);
    v19 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      v46 = 0;
      v47 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x80000001DF04E8F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 0x3436746E49;
      v21._object = (void *)0xE500000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(_QWORD *)&v43 = v50;
      _print_unlocked<A, B>(_:_:)();
      v23 = type metadata accessor for DecodingError();
      swift_allocError();
      v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x1E0DEC458], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v44 = v6;
    v45 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v43);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v43, (uint64_t)&v46);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v46, (uint64_t)&v43);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v42 = 0;
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
      return v41;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEDC60], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
    }
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  uint64_t v13;
  void (*v14)(uint64_t *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD v40[2];
  uint64_t v41;
  char v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v2 = v0;
  v3 = MEMORY[0x1E0DEBB98];
  v4 = swift_conformsToProtocol2();
  if (v4)
    v5 = v4;
  else
    v5 = 0;
  if (v4)
    v6 = v3;
  else
    v6 = 0;
  if (!v6)
  {
    v46 = 0;
    v47 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    v26 = type metadata accessor for DecodingError();
    swift_allocError();
    v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v28, *MEMORY[0x1E0DEC458], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  v48 = type metadata accessor for _XPCDecoder();
  v49 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
  v46 = v2;
  swift_retain();
  result = XPCCodableObject.init(from:)(&v46, (uint64_t *)&v43);
  if (!v1)
  {
    v8 = v43;
    v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    v10 = v9(v6, v5);
    v11 = MEMORY[0x1DF0F4CB8](v8);
    v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      v46 = 0;
      v47 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 1953384789;
      v30._object = (void *)0xE400000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x80000001DF04E8A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x80000001DF04E8D0;
      String.append(_:)(v33);
      *(_QWORD *)&v43 = MEMORY[0x1DF0F4CB8](v8);
      _print_unlocked<A, B>(_:_:)();
      v34 = v46;
      v35 = (void *)v47;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEBB98], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v41 = v8;
    v13 = v8;
    v14 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    v15 = type metadata accessor for Optional();
    v40[1] = v40;
    v16 = *(_QWORD *)(v15 - 8);
    MEMORY[0x1E0C80A78](v15);
    v18 = (char *)v40 - v17;
    v50 = v13;
    swift_unknownObjectRetain();
    v14(&v41, v6, v5);
    v19 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      v46 = 0;
      v47 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x80000001DF04E8F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 1953384789;
      v21._object = (void *)0xE400000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(_QWORD *)&v43 = v50;
      _print_unlocked<A, B>(_:_:)();
      v23 = type metadata accessor for DecodingError();
      swift_allocError();
      v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x1E0DEC458], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v44 = v6;
    v45 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v43);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v43, (uint64_t)&v46);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v46, (uint64_t)&v43);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v42 = 0;
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
      return v41;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEBB98], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
    }
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  uint64_t v13;
  void (*v14)(uint64_t *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v2 = v0;
  v3 = MEMORY[0x1E0DEDE70];
  v4 = swift_conformsToProtocol2();
  if (v4)
    v5 = v4;
  else
    v5 = 0;
  if (v4)
    v6 = v3;
  else
    v6 = 0;
  if (!v6)
  {
    v45 = 0;
    v46 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    v26 = type metadata accessor for DecodingError();
    swift_allocError();
    v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v28, *MEMORY[0x1E0DEC458], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  v47 = type metadata accessor for _XPCDecoder();
  v48 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
  v45 = v2;
  swift_retain();
  result = XPCCodableObject.init(from:)(&v45, (uint64_t *)&v42);
  if (!v1)
  {
    v8 = v42;
    v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    v10 = v9(v6, v5);
    v11 = MEMORY[0x1DF0F4CB8](v8);
    v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      v45 = 0;
      v46 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 0x38746E4955;
      v30._object = (void *)0xE500000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x80000001DF04E8A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x80000001DF04E8D0;
      String.append(_:)(v33);
      *(_QWORD *)&v42 = MEMORY[0x1DF0F4CB8](v8);
      _print_unlocked<A, B>(_:_:)();
      v34 = v45;
      v35 = (void *)v46;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEDE70], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v49 = v8;
    v13 = v8;
    v14 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    v15 = type metadata accessor for Optional();
    v40 = (uint64_t)&v40;
    v16 = *(_QWORD *)(v15 - 8);
    MEMORY[0x1E0C80A78](v15);
    v18 = (char *)&v40 - v17;
    v41 = v13;
    swift_unknownObjectRetain();
    v14(&v49, v6, v5);
    v19 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      v45 = 0;
      v46 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x80000001DF04E8F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 0x38746E4955;
      v21._object = (void *)0xE500000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(_QWORD *)&v42 = v41;
      _print_unlocked<A, B>(_:_:)();
      v23 = type metadata accessor for DecodingError();
      swift_allocError();
      v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x1E0DEC458], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v43 = v6;
    v44 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v42);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v42, (uint64_t)&v45);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v45, (uint64_t)&v42);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if ((swift_dynamicCast() & 1) != 0)
    {
      BYTE1(v49) = 0;
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v45);
      return v49;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEDE70], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v45);
    }
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  uint64_t v13;
  void (*v14)(uint64_t *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v2 = v0;
  v3 = MEMORY[0x1E0DEE068];
  v4 = swift_conformsToProtocol2();
  if (v4)
    v5 = v4;
  else
    v5 = 0;
  if (v4)
    v6 = v3;
  else
    v6 = 0;
  if (!v6)
  {
    v45 = 0;
    v46 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    v26 = type metadata accessor for DecodingError();
    swift_allocError();
    v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v28, *MEMORY[0x1E0DEC458], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  v47 = type metadata accessor for _XPCDecoder();
  v48 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
  v45 = v2;
  swift_retain();
  result = XPCCodableObject.init(from:)(&v45, (uint64_t *)&v42);
  if (!v1)
  {
    v8 = v42;
    v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    v10 = v9(v6, v5);
    v11 = MEMORY[0x1DF0F4CB8](v8);
    v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      v45 = 0;
      v46 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 0x3631746E4955;
      v30._object = (void *)0xE600000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x80000001DF04E8A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x80000001DF04E8D0;
      String.append(_:)(v33);
      *(_QWORD *)&v42 = MEMORY[0x1DF0F4CB8](v8);
      _print_unlocked<A, B>(_:_:)();
      v34 = v45;
      v35 = (void *)v46;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEE068], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v49 = v8;
    v13 = v8;
    v14 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    v15 = type metadata accessor for Optional();
    v40 = (uint64_t)&v40;
    v16 = *(_QWORD *)(v15 - 8);
    MEMORY[0x1E0C80A78](v15);
    v18 = (char *)&v40 - v17;
    v41 = v13;
    swift_unknownObjectRetain();
    v14(&v49, v6, v5);
    v19 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      v45 = 0;
      v46 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x80000001DF04E8F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 0x3631746E4955;
      v21._object = (void *)0xE600000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(_QWORD *)&v42 = v41;
      _print_unlocked<A, B>(_:_:)();
      v23 = type metadata accessor for DecodingError();
      swift_allocError();
      v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x1E0DEC458], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v43 = v6;
    v44 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v42);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v42, (uint64_t)&v45);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v45, (uint64_t)&v42);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if ((swift_dynamicCast() & 1) != 0)
    {
      BYTE2(v49) = 0;
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v45);
      return (unsigned __int16)v49;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEE068], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v45);
    }
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  uint64_t v13;
  void (*v14)(uint64_t *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v2 = v0;
  v3 = MEMORY[0x1E0DEE0F8];
  v4 = swift_conformsToProtocol2();
  if (v4)
    v5 = v4;
  else
    v5 = 0;
  if (v4)
    v6 = v3;
  else
    v6 = 0;
  if (!v6)
  {
    v45 = 0;
    v46 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    v26 = type metadata accessor for DecodingError();
    swift_allocError();
    v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v28, *MEMORY[0x1E0DEC458], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  v47 = type metadata accessor for _XPCDecoder();
  v48 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
  v45 = v2;
  swift_retain();
  result = XPCCodableObject.init(from:)(&v45, (uint64_t *)&v42);
  if (!v1)
  {
    v8 = v42;
    v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    v10 = v9(v6, v5);
    v11 = MEMORY[0x1DF0F4CB8](v8);
    v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      v45 = 0;
      v46 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 0x3233746E4955;
      v30._object = (void *)0xE600000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x80000001DF04E8A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x80000001DF04E8D0;
      String.append(_:)(v33);
      *(_QWORD *)&v42 = MEMORY[0x1DF0F4CB8](v8);
      _print_unlocked<A, B>(_:_:)();
      v34 = v45;
      v35 = (void *)v46;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEE0F8], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v49 = v8;
    v13 = v8;
    v14 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    v15 = type metadata accessor for Optional();
    v40 = (uint64_t)&v40;
    v16 = *(_QWORD *)(v15 - 8);
    MEMORY[0x1E0C80A78](v15);
    v18 = (char *)&v40 - v17;
    v41 = v13;
    swift_unknownObjectRetain();
    v14(&v49, v6, v5);
    v19 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      v45 = 0;
      v46 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x80000001DF04E8F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 0x3233746E4955;
      v21._object = (void *)0xE600000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(_QWORD *)&v42 = v41;
      _print_unlocked<A, B>(_:_:)();
      v23 = type metadata accessor for DecodingError();
      swift_allocError();
      v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x1E0DEC458], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v43 = v6;
    v44 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v42);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v42, (uint64_t)&v45);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v45, (uint64_t)&v42);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if ((swift_dynamicCast() & 1) != 0)
    {
      BYTE4(v49) = 0;
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v45);
      return v49;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEE0F8], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v45);
    }
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  uint64_t v13;
  void (*v14)(uint64_t *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD v40[2];
  uint64_t v41;
  char v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v2 = v0;
  v3 = MEMORY[0x1E0DEE190];
  v4 = swift_conformsToProtocol2();
  if (v4)
    v5 = v4;
  else
    v5 = 0;
  if (v4)
    v6 = v3;
  else
    v6 = 0;
  if (!v6)
  {
    v46 = 0;
    v47 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    v26 = type metadata accessor for DecodingError();
    swift_allocError();
    v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v28, *MEMORY[0x1E0DEC458], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  v48 = type metadata accessor for _XPCDecoder();
  v49 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
  v46 = v2;
  swift_retain();
  result = XPCCodableObject.init(from:)(&v46, (uint64_t *)&v43);
  if (!v1)
  {
    v8 = v43;
    v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    v10 = v9(v6, v5);
    v11 = MEMORY[0x1DF0F4CB8](v8);
    v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      v46 = 0;
      v47 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 0x3436746E4955;
      v30._object = (void *)0xE600000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x80000001DF04E8A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x80000001DF04E8D0;
      String.append(_:)(v33);
      *(_QWORD *)&v43 = MEMORY[0x1DF0F4CB8](v8);
      _print_unlocked<A, B>(_:_:)();
      v34 = v46;
      v35 = (void *)v47;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEE190], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v41 = v8;
    v13 = v8;
    v14 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    v15 = type metadata accessor for Optional();
    v40[1] = v40;
    v16 = *(_QWORD *)(v15 - 8);
    MEMORY[0x1E0C80A78](v15);
    v18 = (char *)v40 - v17;
    v50 = v13;
    swift_unknownObjectRetain();
    v14(&v41, v6, v5);
    v19 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      v46 = 0;
      v47 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x80000001DF04E8F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 0x3436746E4955;
      v21._object = (void *)0xE600000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(_QWORD *)&v43 = v50;
      _print_unlocked<A, B>(_:_:)();
      v23 = type metadata accessor for DecodingError();
      swift_allocError();
      v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x1E0DEC458], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v44 = v6;
    v45 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v43);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v43, (uint64_t)&v46);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v46, (uint64_t)&v43);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v42 = 0;
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
      return v41;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEE190], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
    }
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x1DF0F49E8](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t outlined init with copy of XPCCodableObjectRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(char a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= result && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        *(_BYTE *)(v16[7] + v10) = a1 & 1;
        return result;
      }
      return specialized _NativeDictionary._insert(at:key:value:)(v10, a2, a1 & 1, v16);
    }
    if (v15 >= result && (a3 & 1) == 0)
    {
      result = (uint64_t)specialized _NativeDictionary.copy()();
      goto LABEL_7;
    }
    specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(result, a3 & 1);
    result = specialized __RawDictionaryStorage.find<A>(_:)(a2);
    if ((v14 & 1) == (v17 & 1))
    {
      v10 = result;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
      return specialized _NativeDictionary._insert(at:key:value:)(v10, a2, a1 & 1, v16);
    }
  }
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a1, a2, a3, a4, (void (*)(void))specialized _NativeDictionary.copy(), (void (*)(void))specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:), (uint64_t (*)(uint64_t, uint64_t))outlined init with take of Encodable, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))specialized _NativeDictionary._insert(at:key:value:));
}

{
  return specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a1, a2, a3, a4, (void (*)(void))specialized _NativeDictionary.copy(), (void (*)(void))specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:), (uint64_t (*)(uint64_t, uint64_t))outlined init with take of Encodable, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))specialized _NativeDictionary._insert(at:key:value:));
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(void), void (*a6)(void), uint64_t (*a7)(uint64_t, uint64_t), void (*a8)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t *v8;
  uint64_t *v11;
  uint64_t v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  unint64_t v27;
  char v28;

  v11 = v8;
  v16 = *v8;
  v18 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  v19 = *(_QWORD *)(v16 + 16);
  v20 = (v17 & 1) == 0;
  v21 = v19 + v20;
  if (__OFADD__(v19, v20))
  {
    __break(1u);
  }
  else
  {
    v22 = v17;
    v23 = *(_QWORD *)(v16 + 24);
    if (v23 >= v21 && (a4 & 1) != 0)
    {
LABEL_7:
      v24 = *v11;
      if ((v22 & 1) != 0)
      {
LABEL_8:
        v25 = *(_QWORD *)(v24 + 56) + 40 * v18;
        __swift_destroy_boxed_opaque_existential_1(v25);
        return a7(a1, v25);
      }
      goto LABEL_11;
    }
    if (v23 >= v21 && (a4 & 1) == 0)
    {
      a5();
      goto LABEL_7;
    }
    a6();
    v27 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
    if ((v22 & 1) == (v28 & 1))
    {
      v18 = v27;
      v24 = *v11;
      if ((v22 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      a8(v18, a2, a3, a1, v24);
      return swift_bridgeObjectRetain();
    }
  }
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t XPCArray.init(_:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;

  result = MEMORY[0x1DF0F4CB8]();
  if (result == MEMORY[0x1E0C812C8])
    *a2 = a1;
  else
    __break(1u);
  return result;
}

xpc_object_t XPCArray.init()@<X0>(_QWORD *a1@<X8>)
{
  xpc_object_t result;

  result = xpc_array_create_empty();
  *a1 = result;
  return result;
}

uint64_t XPCArray.withUnsafeUnderlyingArray<A>(_:)(uint64_t (*a1)(_QWORD))
{
  _QWORD *v1;

  return a1(*v1);
}

uint64_t XPCArray.subscript.getter@<X0>(size_t index@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  xpc_object_t *v4;
  xpc_object_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v12;
  double value;

  v8 = xpc_array_get_value(*v4, index);
  if (!v8)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(a4, 1, 1, a2);
  v9 = v8;
  v10 = MEMORY[0x1DF0F4CB8]();
  if (v10 == MEMORY[0x1E0C81328])
  {
    value = COERCE_DOUBLE(xpc_int64_get_value(v9));
    lazy protocol witness table accessor for type Int64 and conformance Int64();
  }
  else
  {
    if (v10 != MEMORY[0x1E0C81398])
    {
      if (v10 != MEMORY[0x1E0C81300])
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(a4, 1, 1, a2);
        return swift_unknownObjectRelease();
      }
      value = xpc_double_get_value(v9);
      v12 = lazy protocol witness table accessor for type Double and conformance Double();
      MEMORY[0x1DF0F41A8](&value, MEMORY[0x1E0DEB070], v12, a2, a3);
      return swift_unknownObjectRelease();
    }
    value = COERCE_DOUBLE(xpc_uint64_get_value(v9));
    lazy protocol witness table accessor for type UInt64 and conformance UInt64();
  }
  dispatch thunk of Numeric.init<A>(exactly:)();
  return swift_unknownObjectRelease();
}

{
  xpc_object_t *v4;
  xpc_object_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  double value;

  v8 = xpc_array_get_value(*v4, index);
  if (!v8)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(a4, 1, 1, a2);
  v9 = v8;
  v10 = MEMORY[0x1DF0F4CB8]();
  if (v10 == MEMORY[0x1E0C81328])
  {
    value = COERCE_DOUBLE(xpc_int64_get_value(v9));
    v12 = *(_QWORD *)(a3 + 16);
    v13 = lazy protocol witness table accessor for type Int64 and conformance Int64();
    v14 = MEMORY[0x1E0DEDC60];
  }
  else
  {
    if (v10 != MEMORY[0x1E0C81398])
    {
      if (v10 != MEMORY[0x1E0C81300])
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(a4, 1, 1, a2);
        return swift_unknownObjectRelease();
      }
      value = xpc_double_get_value(v9);
      lazy protocol witness table accessor for type Double and conformance Double();
      dispatch thunk of BinaryFloatingPoint.init<A>(exactly:)();
      return swift_unknownObjectRelease();
    }
    value = COERCE_DOUBLE(xpc_uint64_get_value(v9));
    v12 = *(_QWORD *)(a3 + 16);
    v13 = lazy protocol witness table accessor for type UInt64 and conformance UInt64();
    v14 = MEMORY[0x1E0DEE190];
  }
  MEMORY[0x1DF0F3FB0](&value, v14, v13, a2, v12);
  return swift_unknownObjectRelease();
}

xpc_object_t XPCArray.subscript.getter(size_t index)
{
  xpc_object_t *v1;

  return xpc_array_get_value(*v1, index);
}

{
  xpc_object_t *v1;

  return xpc_array_get_value(*v1, index);
}

unint64_t lazy protocol witness table accessor for type Double and conformance Double()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Double and conformance Double;
  if (!lazy protocol witness table cache variable for type Double and conformance Double)
  {
    result = MEMORY[0x1DF0F49E8](MEMORY[0x1E0DEB078], MEMORY[0x1E0DEB070]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Double and conformance Double);
  }
  return result;
}

uint64_t XPCArray.subscript.setter(uint64_t a1, size_t a2, uint64_t a3, uint64_t a4)
{
  return XPCArray.subscript.setter(a1, a2, a3, a4, (void (*)(char *, char *))partial apply for implicit closure #1 in XPCArray.subscript.setter, MEMORY[0x1E0DEDC60], MEMORY[0x1E0C86568]);
}

{
  return XPCArray.subscript.setter(a1, a2, a3, a4, (void (*)(char *, char *))partial apply for implicit closure #1 in XPCArray.subscript.setter, MEMORY[0x1E0DEE190], MEMORY[0x1E0C867B0]);
}

{
  uint64_t v5;

  specialized XPCArray.subscript.setter(a1, a2, a3, a4);
  v5 = type metadata accessor for Optional();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
}

uint64_t implicit closure #1 in XPCArray.subscript.setter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t);
  _BOOL4 v30;
  char *v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char *v43;
  char v44;
  uint64_t v45;
  char *v46;
  char v47;
  char v48;
  uint64_t v49;
  char *v50;
  char v51;
  char *v52;
  char *v53;
  uint64_t v54;
  char v55;
  char *v56;
  char *v57;
  char *v58;
  char v59;
  uint64_t result;
  uint64_t v61;
  uint64_t AssociatedConformanceWitness;
  char *v63;
  char v64;
  char *v65;
  int64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(char *, uint64_t);
  uint64_t v70;
  char *v71;
  char *v72;
  char *v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int64_t v79;

  v76 = a4;
  v70 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 8) + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v9 = (char *)&v68 - v8;
  v10 = MEMORY[0x1E0C80A78](v7);
  v71 = (char *)&v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v10);
  v72 = (char *)&v68 - v13;
  v14 = MEMORY[0x1E0C80A78](v12);
  v74 = (char *)&v68 - v15;
  v16 = MEMORY[0x1E0C80A78](v14);
  v75 = (char *)&v68 - v17;
  v18 = MEMORY[0x1E0C80A78](v16);
  v73 = (char *)&v68 - v19;
  v20 = MEMORY[0x1E0C80A78](v18);
  v22 = (char *)&v68 - v21;
  v23 = MEMORY[0x1E0C80A78](v20);
  v25 = (char *)&v68 - v24;
  MEMORY[0x1E0C80A78](v23);
  v27 = (char *)&v68 - v26;
  v77 = v28;
  v29 = *(void (**)(char *, uint64_t, uint64_t))(v28 + 16);
  v29((char *)&v68 - v26, a1, a2);
  LOBYTE(a1) = dispatch thunk of static BinaryInteger.isSigned.getter();
  v29(v25, (uint64_t)v27, a2);
  v30 = (a1 & 1) != 0 && dispatch thunk of BinaryInteger.bitWidth.getter() > 64;
  v31 = v25;
  v32 = *(void (**)(char *, uint64_t))(v77 + 8);
  v32(v31, a2);
  v29(v22, (uint64_t)v27, a2);
  if (!v30)
  {
    v32(v22, a2);
    goto LABEL_9;
  }
  v79 = 0x8000000000000000;
  if ((dispatch thunk of static BinaryInteger.isSigned.getter() & 1) != 0)
  {
    if (dispatch thunk of BinaryInteger.bitWidth.getter() < 64)
    {
      v33 = dispatch thunk of BinaryInteger._lowWord.getter();
      v34 = v22;
      v35 = a2;
LABEL_31:
      v32(v34, v35);
      if (v33 < v79)
        goto LABEL_32;
      goto LABEL_9;
    }
    lazy protocol witness table accessor for type Int64 and conformance Int64();
    v56 = v73;
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    v51 = dispatch thunk of static Comparable.< infix(_:_:)();
    v32(v56, a2);
LABEL_26:
    v32(v22, a2);
    if ((v51 & 1) != 0)
      goto LABEL_32;
    goto LABEL_9;
  }
  v69 = v32;
  v48 = dispatch thunk of static BinaryInteger.isSigned.getter();
  v49 = dispatch thunk of BinaryInteger.bitWidth.getter();
  if ((v48 & 1) == 0)
  {
    if (v49 >= 64)
    {
      v32 = v69;
      v69(v22, a2);
      goto LABEL_9;
    }
    v33 = dispatch thunk of BinaryInteger._lowWord.getter();
    v34 = v22;
    v35 = a2;
    v32 = v69;
    goto LABEL_31;
  }
  if (v49 > 64)
  {
    lazy protocol witness table accessor for type Int64 and conformance Int64();
    v50 = v73;
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    v51 = dispatch thunk of static Comparable.< infix(_:_:)();
    v32 = v69;
    v69(v50, a2);
    goto LABEL_26;
  }
  v61 = v70;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  MEMORY[0x1DF0F4574](&unk_1DF04A878, 256, AssociatedTypeWitness, AssociatedConformanceWitness);
  v63 = v73;
  MEMORY[0x1DF0F446C](v9, a2, v61);
  v64 = dispatch thunk of static Comparable.< infix(_:_:)();
  v32 = v69;
  v69(v63, a2);
  v65 = v71;
  (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v71, v22, a2);
  if ((v64 & 1) != 0)
  {
    v32(v65, a2);
    v54 = 0;
    v55 = 1;
    goto LABEL_33;
  }
  v66 = v79;
  v67 = dispatch thunk of BinaryInteger._lowWord.getter();
  v32(v65, a2);
  if (v67 < v66)
  {
LABEL_32:
    v54 = 0;
    v55 = 1;
LABEL_33:
    v40 = v76;
    goto LABEL_36;
  }
LABEL_9:
  v36 = dispatch thunk of BinaryInteger.bitWidth.getter();
  v37 = v75;
  v29(v75, (uint64_t)v27, a2);
  if (v36 < 65)
  {
    v41 = dispatch thunk of BinaryInteger.bitWidth.getter();
    v32(v37, a2);
    if (v41 != 64)
    {
      v53 = v74;
      v29(v74, (uint64_t)v27, a2);
      v39 = v53;
      v40 = v76;
      goto LABEL_23;
    }
    v42 = dispatch thunk of static BinaryInteger.isSigned.getter();
    v43 = v74;
    v29(v74, (uint64_t)v27, a2);
    v39 = v43;
    v40 = v76;
    if ((v42 & 1) != 0)
    {
LABEL_23:
      v32(v39, a2);
      goto LABEL_24;
    }
  }
  else
  {
    v32(v37, a2);
    v38 = v74;
    v29(v74, (uint64_t)v27, a2);
    v39 = v38;
    v40 = v76;
  }
  v79 = 0x7FFFFFFFFFFFFFFFLL;
  v44 = dispatch thunk of static BinaryInteger.isSigned.getter();
  v45 = dispatch thunk of BinaryInteger.bitWidth.getter();
  if ((v44 & 1) != 0)
  {
    v46 = v73;
    if (v45 > 64)
    {
      lazy protocol witness table accessor for type Int64 and conformance Int64();
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
      v47 = dispatch thunk of static Comparable.< infix(_:_:)();
      v32(v46, a2);
      v32(v39, a2);
      if ((v47 & 1) != 0)
        goto LABEL_35;
      goto LABEL_24;
    }
    goto LABEL_21;
  }
  v52 = v73;
  if (v45 <= 63)
  {
LABEL_21:
    dispatch thunk of BinaryInteger._lowWord.getter();
    goto LABEL_23;
  }
  v78 = 0x7FFFFFFFFFFFFFFFLL;
  (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v73, v39, a2);
  lazy protocol witness table accessor for type Int64 and conformance Int64();
  v57 = v72;
  v58 = v52;
  dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
  v59 = dispatch thunk of static Comparable.< infix(_:_:)();
  v32(v57, a2);
  v32(v58, a2);
  if ((v59 & 1) != 0)
  {
LABEL_35:
    v54 = 0;
    v55 = 1;
    goto LABEL_36;
  }
LABEL_24:
  v54 = dispatch thunk of BinaryInteger._lowWord.getter();
  v55 = 0;
LABEL_36:
  result = ((uint64_t (*)(char *, uint64_t))v32)(v27, a2);
  *(_QWORD *)v40 = v54;
  *(_BYTE *)(v40 + 8) = v55;
  return result;
}

{
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t result;
  char *v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  char *v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t AssociatedConformanceWitness;
  char *v46;
  char *v47;
  unint64_t v48;
  char *v49;
  unint64_t v50;
  BOOL v51;
  char *v52;
  char v53;
  unint64_t v54;
  char *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  void (*v59)(char *, char *, uint64_t);
  char *v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t);
  uint64_t v63;
  char *v64;
  uint64_t v65;
  unint64_t v66;

  v61 = a4;
  v6 = *(_QWORD *)(a3 + 8);
  v58 = *(_QWORD *)(*(_QWORD *)(v6 + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v10 = (char *)&v55 - v9;
  v11 = MEMORY[0x1E0C80A78](v8);
  v56 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v11);
  v60 = (char *)&v55 - v14;
  v15 = MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v55 - v16;
  v18 = MEMORY[0x1E0C80A78](v15);
  v20 = (char *)&v55 - v19;
  MEMORY[0x1E0C80A78](v18);
  v22 = (char *)&v55 - v21;
  v63 = v23;
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 16);
  v24((char *)&v55 - v21, a1, a2);
  v65 = v6;
  LOBYTE(a1) = dispatch thunk of static BinaryInteger.isSigned.getter();
  v59 = (void (*)(char *, char *, uint64_t))v24;
  v24(v20, (uint64_t)v22, a2);
  v57 = v17;
  v64 = v22;
  v55 = v10;
  if ((a1 & 1) == 0)
  {
    v27 = AssociatedTypeWitness;
    v29 = v63;
    v62 = *(void (**)(char *, uint64_t))(v63 + 8);
    v62(v20, a2);
LABEL_5:
    v35 = v64;
    v36 = dispatch thunk of BinaryInteger.bitWidth.getter();
    v37 = v60;
    v59(v60, v35, a2);
    if (v36 <= 63)
    {
      v38 = v37;
      v39 = a2;
      v40 = v62;
LABEL_7:
      v40(v38, v39);
      v33 = v61;
      v41 = v64;
LABEL_8:
      v31 = dispatch thunk of BinaryInteger._lowWord.getter();
      v32 = 0;
LABEL_19:
      result = ((uint64_t (*)(char *, uint64_t))v40)(v41, a2);
      goto LABEL_20;
    }
    v66 = -1;
    v42 = dispatch thunk of static BinaryInteger.isSigned.getter();
    v43 = dispatch thunk of BinaryInteger.bitWidth.getter();
    if ((v42 & 1) != 0)
    {
      if (v43 <= 64)
      {
        v44 = v58;
        AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
        v46 = v55;
        MEMORY[0x1DF0F4574](&unk_1DF04A878, 256, v27, AssociatedConformanceWitness);
        v47 = v57;
        MEMORY[0x1DF0F446C](v46, a2, v44);
        LOBYTE(v44) = dispatch thunk of static Comparable.> infix(_:_:)();
        v40 = v62;
        v62(v47, a2);
        v48 = v66;
        v49 = v56;
        (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v56, v37, a2);
        if ((v44 & 1) == 0)
        {
          v38 = v49;
          v39 = a2;
          goto LABEL_7;
        }
        v50 = dispatch thunk of BinaryInteger._lowWord.getter();
        v40(v49, a2);
        v51 = v48 >= v50;
        goto LABEL_17;
      }
    }
    else if (v43 < 65)
    {
      v54 = dispatch thunk of BinaryInteger._lowWord.getter();
      v40 = v62;
      v62(v37, a2);
      v51 = v66 >= v54;
LABEL_17:
      v33 = v61;
      v41 = v64;
      if (v51)
        goto LABEL_8;
      goto LABEL_18;
    }
    lazy protocol witness table accessor for type UInt64 and conformance UInt64();
    v52 = v57;
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    v53 = dispatch thunk of static Comparable.< infix(_:_:)();
    v40 = v62;
    v62(v52, a2);
    v40(v37, a2);
    v33 = v61;
    v41 = v64;
    if ((v53 & 1) == 0)
      goto LABEL_8;
LABEL_18:
    v31 = 0;
    v32 = 1;
    goto LABEL_19;
  }
  v25 = v58;
  v26 = swift_getAssociatedConformanceWitness();
  v27 = AssociatedTypeWitness;
  MEMORY[0x1DF0F4574](&unk_1DF04A878, 256, AssociatedTypeWitness, v26);
  MEMORY[0x1DF0F446C](v10, a2, v25);
  v28 = dispatch thunk of static Comparable.< infix(_:_:)();
  v29 = v63;
  v30 = *(void (**)(char *, uint64_t))(v63 + 8);
  v30(v17, a2);
  v62 = v30;
  v30(v20, a2);
  if ((v28 & 1) == 0)
    goto LABEL_5;
  v31 = 0;
  v32 = 1;
  v33 = v61;
  result = ((uint64_t (*)(char *, uint64_t))v62)(v64, a2);
LABEL_20:
  *(_QWORD *)v33 = v31;
  *(_BYTE *)(v33 + 8) = v32;
  return result;
}

uint64_t XPCArray.subscript.setter(uint64_t result, size_t a2)
{
  void **v2;
  _xpc_connection_s *v4;
  uint64_t v5;
  void *v6;

  if (result)
  {
    v4 = (_xpc_connection_s *)result;
    v5 = MEMORY[0x1DF0F4CB8]();
    v6 = *v2;
    if (v5 == MEMORY[0x1E0C812E0])
      xpc_array_set_connection(v6, a2, v4);
    else
      xpc_array_set_value(v6, a2, v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

{
  void **v2;
  _xpc_connection_s *v4;
  uint64_t v5;
  void *v6;

  if (result != 2)
  {
    v4 = (_xpc_connection_s *)xpc_BOOL_create(result & 1);
    v5 = MEMORY[0x1DF0F4CB8]();
    v6 = *v2;
    if (v5 == MEMORY[0x1E0C812E0])
      xpc_array_set_connection(v6, a2, v4);
    else
      xpc_array_set_value(v6, a2, v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

void (*XPCArray.subscript.modify(_QWORD *a1, size_t a2, uint64_t a3, uint64_t a4))(size_t **a1, char a2)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  void *v13;

  v9 = malloc(0x40uLL);
  *a1 = v9;
  v9[2] = a4;
  v9[3] = v4;
  *v9 = a2;
  v9[1] = a3;
  v10 = type metadata accessor for Optional();
  v9[4] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v9[5] = v11;
  v12 = *(_QWORD *)(v11 + 64);
  v9[6] = malloc(v12);
  v13 = malloc(v12);
  v9[7] = v13;
  XPCArray.subscript.getter(a2, a3, *(_QWORD *)(a4 + 8), (uint64_t)v13);
  return XPCArray.subscript.modify;
}

{
  uint64_t v4;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  void *v13;

  v9 = malloc(0x40uLL);
  *a1 = v9;
  v9[2] = a4;
  v9[3] = v4;
  *v9 = a2;
  v9[1] = a3;
  v10 = type metadata accessor for Optional();
  v9[4] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v9[5] = v11;
  v12 = *(_QWORD *)(v11 + 64);
  v9[6] = malloc(v12);
  v13 = malloc(v12);
  v9[7] = v13;
  XPCArray.subscript.getter(a2, a3, *(_QWORD *)(a4 + 8), (uint64_t)v13);
  return XPCArray.subscript.modify;
}

{
  uint64_t v4;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  void *v13;

  v9 = malloc(0x40uLL);
  *a1 = v9;
  v9[2] = a4;
  v9[3] = v4;
  *v9 = a2;
  v9[1] = a3;
  v10 = type metadata accessor for Optional();
  v9[4] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v9[5] = v11;
  v12 = *(_QWORD *)(v11 + 64);
  v9[6] = malloc(v12);
  v13 = malloc(v12);
  v9[7] = v13;
  XPCArray.subscript.getter(a2, a3, a4, (uint64_t)v13);
  return XPCArray.subscript.modify;
}

void XPCArray.subscript.modify(size_t **a1, char a2)
{
  XPCArray.subscript.modify(a1, a2, (void (*)(char *, char *))partial apply for implicit closure #1 in XPCArray.subscript.setter, MEMORY[0x1E0DEDC60], MEMORY[0x1E0C86568]);
}

{
  XPCArray.subscript.modify(a1, a2, (void (*)(char *, char *))partial apply for implicit closure #1 in XPCArray.subscript.setter, MEMORY[0x1E0DEE190], MEMORY[0x1E0C867B0]);
}

{
  size_t *v2;
  void *v3;
  void *v4;
  size_t v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  void (*v10)(void *, size_t);

  v2 = *a1;
  v3 = (void *)(*a1)[6];
  v4 = (void *)(*a1)[7];
  v5 = (*a1)[4];
  v6 = (*a1)[5];
  v7 = (*a1)[2];
  v9 = **a1;
  v8 = (*a1)[1];
  if ((a2 & 1) != 0)
  {
    (*(void (**)(size_t, void *, size_t))(v6 + 16))((*a1)[6], v4, v5);
    specialized XPCArray.subscript.setter((uint64_t)v3, v9, v8, v7);
    v10 = *(void (**)(void *, size_t))(v6 + 8);
    v10(v3, v5);
  }
  else
  {
    specialized XPCArray.subscript.setter((*a1)[7], v9, v8, v7);
    v10 = *(void (**)(void *, size_t))(v6 + 8);
  }
  v10(v4, v5);
  free(v4);
  free(v3);
  free(v2);
}

uint64_t XPCArray.subscript.getter@<X0>(size_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return XPCArray.subscript.getter(a1, a2, *(_QWORD *)(a3 + 8), a4);
}

{
  return XPCArray.subscript.getter(a1, a2, a3, a4);
}

uint64_t XPCArray.subscript.setter(uint64_t a1, size_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *), uint64_t a6, uint64_t (*a7)(uint64_t))
{
  uint64_t v8;

  specialized XPCArray.subscript.setter(a1, a2, a3, a4, a5, a6, a7);
  v8 = type metadata accessor for Optional();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
}

void XPCArray.subscript.modify(size_t **a1, char a2, void (*a3)(char *, char *), uint64_t a4, uint64_t (*a5)(uint64_t))
{
  size_t *v6;
  void *v7;
  void *v8;
  size_t v9;
  size_t v10;
  uint64_t v11;
  size_t v12;
  uint64_t v13;
  void (*v14)(void *, size_t);

  v6 = *a1;
  v7 = (void *)(*a1)[6];
  v8 = (void *)(*a1)[7];
  v9 = (*a1)[4];
  v10 = (*a1)[5];
  v11 = (*a1)[2];
  v12 = **a1;
  v13 = (*a1)[1];
  if ((a2 & 1) != 0)
  {
    (*(void (**)(size_t, void *, size_t))(v10 + 16))((*a1)[6], v8, v9);
    specialized XPCArray.subscript.setter((uint64_t)v7, v12, v13, v11, a3, a4, a5);
    v14 = *(void (**)(void *, size_t))(v10 + 8);
    v14(v7, v9);
  }
  else
  {
    specialized XPCArray.subscript.setter((*a1)[7], v12, v13, v11, a3, a4, a5);
    v14 = *(void (**)(void *, size_t))(v10 + 8);
  }
  v14(v8, v9);
  free(v8);
  free(v7);
  free(v6);
}

xpc_object_t closure #1 in XPCArray.subscript.setter@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  xpc_object_t result;
  _QWORD v6[2];

  MEMORY[0x1E0C80A78](a1);
  (*(void (**)(char *))(v4 + 16))((char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  lazy protocol witness table accessor for type Double and conformance Double();
  BinaryFloatingPoint.init<A>(_:)();
  result = xpc_double_create(*(double *)&v6[1]);
  *a2 = result;
  return result;
}

uint64_t XPCArray.subscript.getter@<X0>(size_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  _QWORD *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[2];

  v17[0] = a2;
  v10 = type metadata accessor for Optional();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v17 - v12;
  v17[1] = *v5;
  XPCArray.subscript.getter(a1, a3, a4, (uint64_t)v17 - v12);
  v14 = *(_QWORD *)(a3 - 8);
  v15 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, a3);
  if ((_DWORD)v15 != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(a5, v13, a3);
  ((void (*)(uint64_t))v17[0])(v15);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t XPCArray.subscript.getter(size_t a1)
{
  void *v2;
  xpc_object_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 value;

  v2 = (void *)swift_unknownObjectRetain();
  v3 = xpc_array_get_value(v2, a1);
  if (v3 && (v4 = v3, v5 = MEMORY[0x1DF0F4CB8](), v6 = MEMORY[0x1E0C812D0], swift_unknownObjectRelease(), v5 == v6))
  {
    value = xpc_BOOL_get_value(v4);
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    return 2;
  }
  return value;
}

{
  void *v2;
  xpc_object_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t value;

  v2 = (void *)swift_unknownObjectRetain_n();
  v3 = xpc_array_get_value(v2, a1);
  if (v3)
  {
    v4 = v3;
    v5 = MEMORY[0x1DF0F4CB8]();
    v6 = MEMORY[0x1E0C812D0];
    swift_unknownObjectRelease();
    if (v5 == v6)
    {
      value = xpc_BOOL_get_value(v4);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      return 2;
    }
  }
  else
  {
    value = 2;
    swift_unknownObjectRelease_n();
  }
  return value;
}

{
  void *v2;
  uint64_t v3;

  v2 = (void *)swift_unknownObjectRetain();
  if (xpc_array_get_string(v2, a1))
  {
    v3 = String.init(cString:)();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    return 0;
  }
  return v3;
}

xpc_object_t XPCArray.subscript.getter(size_t index, uint64_t a2)
{
  xpc_object_t *v2;
  xpc_object_t v4;
  xpc_object_t v5;

  v4 = xpc_array_get_value(*v2, index);
  v5 = v4;
  if (v4 && MEMORY[0x1DF0F4CB8](v4) != a2)
  {
    swift_unknownObjectRelease();
    return 0;
  }
  return v5;
}

unsigned __int8 *key path setter for XPCArray.subscript(_:) : XPCArray(unsigned __int8 *result, void **a2, size_t *a3)
{
  int v3;
  size_t v5;
  _xpc_connection_s *v6;
  uint64_t v7;
  void *v8;

  v3 = *result;
  if (v3 != 2)
  {
    v5 = *a3;
    v6 = (_xpc_connection_s *)xpc_BOOL_create(v3 & 1);
    v7 = MEMORY[0x1DF0F4CB8]();
    v8 = *a2;
    if (v7 == MEMORY[0x1E0C812E0])
      xpc_array_set_connection(v8, v5, v6);
    else
      xpc_array_set_value(v8, v5, v6);
    return (unsigned __int8 *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t (*XPCArray.subscript.modify(size_t *a1, size_t a2))(uint64_t result)
{
  size_t v2;
  char *v4;
  void *v5;
  xpc_object_t v6;
  void *v7;
  uint64_t v8;
  char value;

  v4 = (char *)(a1 + 2);
  *a1 = a2;
  a1[1] = v2;
  v5 = (void *)swift_unknownObjectRetain_n();
  v6 = xpc_array_get_value(v5, a2);
  if (v6)
  {
    v7 = v6;
    v8 = MEMORY[0x1DF0F4CB8]();
    swift_unknownObjectRelease();
    if (v8 == MEMORY[0x1E0C812D0])
    {
      value = xpc_BOOL_get_value(v7);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      value = 2;
    }
  }
  else
  {
    value = 2;
    swift_unknownObjectRelease_n();
  }
  *v4 = value;
  return XPCArray.subscript.modify;
}

uint64_t XPCArray.subscript.modify(uint64_t result)
{
  size_t *v1;
  int v2;
  void **v3;
  _xpc_connection_s *v4;
  uint64_t v5;
  void *v6;
  size_t v7;

  v1 = (size_t *)result;
  v2 = *(unsigned __int8 *)(result + 16);
  if (v2 != 2)
  {
    v3 = *(void ***)(result + 8);
    v4 = (_xpc_connection_s *)xpc_BOOL_create(v2 & 1);
    v5 = MEMORY[0x1DF0F4CB8]();
    v6 = *v3;
    v7 = *v1;
    if (v5 == MEMORY[0x1E0C812E0])
      xpc_array_set_connection(v6, v7, v4);
    else
      xpc_array_set_value(v6, v7, v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t XPCArray.subscript.getter(size_t a1, uint64_t (*a2)(uint64_t))
{
  void *v4;
  xpc_object_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 value;

  v4 = (void *)swift_unknownObjectRetain_n();
  v5 = xpc_array_get_value(v4, a1);
  if (!v5)
  {
    v9 = swift_unknownObjectRelease_n();
    return a2(v9) & 1;
  }
  v6 = v5;
  v7 = MEMORY[0x1DF0F4CB8]();
  v8 = MEMORY[0x1E0C812D0];
  swift_unknownObjectRelease();
  if (v7 != v8)
  {
    swift_unknownObjectRelease();
    v9 = swift_unknownObjectRelease();
    return a2(v9) & 1;
  }
  value = xpc_BOOL_get_value(v6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return value;
}

xpc_object_t XPCArray.subscript.getter@<X0>(size_t index@<X0>, _QWORD *a2@<X8>)
{
  xpc_object_t *v2;
  xpc_object_t result;
  xpc_object_t v5;

  result = xpc_array_get_dictionary(*v2, index);
  v5 = result;
  if (result && (result = (xpc_object_t)MEMORY[0x1DF0F4CB8](result), result != (xpc_object_t)MEMORY[0x1E0C812F8]))
    __break(1u);
  else
    *a2 = v5;
  return result;
}

uint64_t XPCArray.subscript.getter@<X0>(size_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v4;
  xpc_object_t v5;
  xpc_object_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = (void *)swift_unknownObjectRetain();
  v5 = xpc_array_get_dictionary(v4, a1);
  v6 = v5;
  if (!v5)
    goto LABEL_4;
  v7 = MEMORY[0x1DF0F4CB8](v5);
  result = swift_unknownObjectRelease();
  if (v7 != MEMORY[0x1E0C812F8])
  {
    __break(1u);
LABEL_4:
    result = swift_unknownObjectRelease();
  }
  *a2 = v6;
  return result;
}

xpc_object_t *XPCArray.subscript.setter(xpc_object_t *result, size_t a2)
{
  xpc_object_t *v2;

  if (*result)
  {
    xpc_array_set_value(*v2, a2, *result);
    return (xpc_object_t *)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t (*XPCArray.subscript.modify(_QWORD *a1, size_t a2))(uint64_t result, char a2)
{
  uint64_t v2;
  void *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  uint64_t v8;

  a1[1] = a2;
  a1[2] = v2;
  v5 = (void *)swift_unknownObjectRetain();
  v6 = xpc_array_get_dictionary(v5, a2);
  v7 = v6;
  if (!v6)
    goto LABEL_4;
  v8 = MEMORY[0x1DF0F4CB8](v6);
  swift_unknownObjectRelease();
  if (v8 != MEMORY[0x1E0C812F8])
  {
    __break(1u);
LABEL_4:
    swift_unknownObjectRelease();
  }
  *a1 = v7;
  return XPCArray.subscript.modify;
}

uint64_t XPCArray.subscript.modify(uint64_t result, char a2)
{
  void *v2;

  v2 = *(void **)result;
  if ((a2 & 1) != 0)
  {
    if (v2)
    {
LABEL_5:
      xpc_array_set_value(**(xpc_object_t **)(result + 16), *(_QWORD *)(result + 8), v2);
      return swift_unknownObjectRelease();
    }
    __break(1u);
  }
  if (v2)
    goto LABEL_5;
  __break(1u);
  return result;
}

{
  uint64_t v2;
  xpc_object_t *v3;
  size_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(result + 8);
  if ((a2 & 1) != 0)
  {
    if (v2)
    {
      v4 = *(_QWORD *)(result + 16);
      v3 = *(xpc_object_t **)(result + 24);
      v5 = *(_QWORD *)result;
      swift_bridgeObjectRetain();
      specialized String.withCString<A>(_:)(v5, v2, v3, v4);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    if (!v2)
      return result;
    specialized String.withCString<A>(_:)(*(_QWORD *)result, v2, *(xpc_object_t **)(result + 24), *(_QWORD *)(result + 16));
  }
  return swift_bridgeObjectRelease();
}

_xpc_connection_s **key path setter for XPCArray.subscript(_:) : XPCArray(_xpc_connection_s **result, void **a2, size_t *a3)
{
  _xpc_connection_s *v3;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = *result;
  if (*result)
  {
    v5 = *a3;
    v6 = swift_unknownObjectRetain();
    v7 = MEMORY[0x1DF0F4CB8](v6);
    v8 = *a2;
    if (v7 == MEMORY[0x1E0C812E0])
      xpc_array_set_connection(v8, v5, v3);
    else
      xpc_array_set_value(v8, v5, v3);
    return (_xpc_connection_s **)swift_unknownObjectRelease();
  }
  return result;
}

_xpc_connection_s **(*XPCArray.subscript.modify(_QWORD *a1, size_t a2))(_xpc_connection_s **result, char a2)
{
  xpc_object_t *v2;

  a1[1] = a2;
  a1[2] = v2;
  *a1 = xpc_array_get_value(*v2, a2);
  return XPCArray.subscript.modify;
}

_xpc_connection_s **XPCArray.subscript.modify(_xpc_connection_s **result, char a2)
{
  _xpc_connection_s **v2;
  _xpc_connection_s *v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  size_t v8;
  void **v9;
  uint64_t v10;
  void *v11;
  size_t v12;

  v2 = result;
  v3 = *result;
  if ((a2 & 1) != 0)
  {
    if (v3)
    {
      v4 = (void **)result[2];
      v5 = swift_unknownObjectRetain();
      v6 = MEMORY[0x1DF0F4CB8](v5);
      v7 = *v4;
      v8 = (size_t)v2[1];
      if (v6 == MEMORY[0x1E0C812E0])
        xpc_array_set_connection(v7, v8, v3);
      else
        xpc_array_set_value(v7, v8, v3);
      swift_unknownObjectRelease();
    }
    return (_xpc_connection_s **)swift_unknownObjectRelease();
  }
  if (v3)
  {
    v9 = (void **)result[2];
    v10 = MEMORY[0x1DF0F4CB8](*result);
    v11 = *v9;
    v12 = (size_t)v2[1];
    if (v10 == MEMORY[0x1E0C812E0])
      xpc_array_set_connection(v11, v12, v3);
    else
      xpc_array_set_value(v11, v12, v3);
    return (_xpc_connection_s **)swift_unknownObjectRelease();
  }
  return result;
}

const char *XPCArray.subscript.getter(size_t index)
{
  xpc_object_t *v1;
  const char *result;

  result = xpc_array_get_string(*v1, index);
  if (result)
    return (const char *)String.init(cString:)();
  return result;
}

uint64_t key path getter for XPCArray.subscript(_:) : XPCArray@<X0>(size_t *a1@<X1>, uint64_t *a2@<X8>)
{
  size_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *a1;
  v4 = (void *)swift_unknownObjectRetain();
  if (xpc_array_get_string(v4, v3))
  {
    v5 = String.init(cString:)();
    v7 = v6;
    result = swift_unknownObjectRelease();
  }
  else
  {
    result = swift_unknownObjectRelease();
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
  return result;
}

uint64_t *key path setter for XPCArray.subscript(_:) : XPCArray(uint64_t *result, xpc_object_t *a2, size_t *a3)
{
  uint64_t v3;
  uint64_t v5;
  size_t v6;

  v3 = result[1];
  if (v3)
  {
    v5 = *result;
    v6 = *a3;
    swift_bridgeObjectRetain();
    specialized String.withCString<A>(_:)(v5, v3, a2, v6);
    return (uint64_t *)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t XPCArray.subscript.setter(uint64_t result, uint64_t a2, size_t index)
{
  xpc_object_t *v3;

  if (a2)
  {
    specialized String.withCString<A>(_:)(result, a2, v3, index);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void specialized String.withCString<A>(_:)(uint64_t a1, uint64_t a2, xpc_object_t *a3, size_t index)
{
  uint64_t v5;
  uint64_t v6;
  char string[8];
  uint64_t v8;

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    *(_QWORD *)string = a1;
    v8 = a2 & 0xFFFFFFFFFFFFFFLL;
    xpc_array_set_string(*a3, index, string);
  }
  else
  {
    if ((a1 & 0x1000000000000000) != 0)
    {
      v5 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      v6 = a1 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      v5 = _StringObject.sharedUTF8.getter();
    }
    specialized closure #1 in _StringGuts.withCString<A>(_:)(v5, v6, (uint64_t (*)(void))partial apply for closure #1 in XPCArray.subscript.setter);
  }
}

uint64_t (*XPCArray.subscript.modify(uint64_t *a1, size_t a2))(uint64_t result, char a2)
{
  uint64_t v2;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  a1[2] = a2;
  a1[3] = v2;
  v5 = (void *)swift_unknownObjectRetain();
  if (xpc_array_get_string(v5, a2))
  {
    v6 = String.init(cString:)();
    v8 = v7;
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    v6 = 0;
    v8 = 0;
  }
  *a1 = v6;
  a1[1] = v8;
  return XPCArray.subscript.modify;
}

uint64_t XPCArray.copy(into:)(uint64_t *a1)
{
  void **v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t result;
  _QWORD v8[6];

  v2 = *a1;
  v3 = *v1;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v2;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = partial apply for closure #1 in XPCArray.copy(into:);
  *(_QWORD *)(v5 + 24) = v4;
  v8[4] = partial apply for thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@unowned Bool);
  v8[5] = v5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = thunk for @escaping @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@unowned Bool);
  v8[3] = &block_descriptor_0;
  v6 = _Block_copy(v8);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  xpc_array_apply(v3, v6);
  _Block_release(v6);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v3 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@unowned Bool)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v5)(uint64_t, uint64_t);
  char v6;

  v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v6 = v5(a2, a3);
  swift_unknownObjectRelease();
  return v6 & 1;
}

BOOL XPCArray.isEmpty.getter()
{
  xpc_object_t *v0;

  return xpc_array_get_count(*v0) == 0;
}

size_t XPCArray.count.getter()
{
  xpc_object_t *v0;

  return xpc_array_get_count(*v0);
}

uint64_t XPCArray.forEach(_:)(uint64_t a1, uint64_t a2)
{
  void **v2;
  uint64_t v3;
  void *v6;
  uint64_t v7;
  uint64_t result;
  char isEscapingClosureAtFileLocation;

  v6 = *v2;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  closure #1 in XPCArray.forEach(_:)((uint64_t)partial apply for thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error), v7, v6);
  if (v3)
    return swift_release();
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

{
  void **v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t result;
  char isEscapingClosureAtFileLocation;
  _QWORD v8[4];

  v8[3] = a2;
  v4 = *v2;
  v8[2] = a1;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = partial apply for thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error);
  *(_QWORD *)(v5 + 24) = v8;
  closure #1 in XPCArray.forEach(_:)((uint64_t)thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error)partial apply, v5, v4);
  if (v3)
    return swift_release();
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

uint64_t closure #1 in XPCArray.forEach(_:)(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t result;
  id v10;
  _QWORD aBlock[6];
  id v12;

  v12 = 0;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = &v12;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = partial apply for closure #1 in closure #1 in XPCArray.forEach(_:);
  *(_QWORD *)(v7 + 24) = v6;
  aBlock[4] = thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@unowned Bool)partial apply;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@unowned Bool);
  aBlock[3] = &block_descriptor_49;
  v8 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  xpc_array_apply(a3, v8);
  _Block_release(v8);
  LOBYTE(a3) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((a3 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    if (v12)
    {
      v10 = v12;
      swift_willThrow();

    }
    return swift_release();
  }
  return result;
}

uint64_t XPCArray.map<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void **v3;
  uint64_t v4;
  void *v8;
  size_t count;
  uint64_t v10;
  uint64_t result;
  char isEscapingClosureAtFileLocation;
  _QWORD v13[4];
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v8 = *v3;
  v19 = Array.init()();
  count = xpc_array_get_count(v8);
  type metadata accessor for Array();
  Array.reserveCapacity(_:)(count);
  v15 = a3;
  v16 = &v19;
  v17 = a1;
  v18 = a2;
  v13[2] = partial apply for closure #1 in XPCArray.map<A>(_:);
  v13[3] = &v14;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error)partial apply;
  *(_QWORD *)(v10 + 24) = v13;
  closure #1 in XPCArray.forEach(_:)((uint64_t)thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error)partial apply, v10, v8);
  if (v4)
  {
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
    else
      return v19;
  }
  return result;
}

uint64_t closure #1 in XPCArray.map<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t result;

  v2 = MEMORY[0x1E0C80A78](a1);
  result = v3(v2);
  if (!v1)
  {
    type metadata accessor for Array();
    return Array.append(_:)();
  }
  return result;
}

BOOL static XPCArray.== infix(_:_:)(xpc_object_t *a1, xpc_object_t *a2)
{
  return xpc_equal(*a1, *a2);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance XPCArray(xpc_object_t *a1, xpc_object_t *a2)
{
  return xpc_equal(*a1, *a2);
}

void XPCArray.hash(into:)()
{
  xpc_object_t *v0;
  size_t v1;

  v1 = xpc_hash(*v0);
  Hasher._combine(_:)(v1);
}

Swift::Int XPCArray.hashValue.getter()
{
  void **v0;
  void *v1;
  size_t v2;

  v1 = *v0;
  Hasher.init(_seed:)();
  v2 = xpc_hash(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance XPCArray()
{
  void **v0;
  void *v1;
  size_t v2;

  v1 = *v0;
  Hasher.init(_seed:)();
  v2 = xpc_hash(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance XPCArray()
{
  xpc_object_t *v0;
  size_t v1;

  v1 = xpc_hash(*v0);
  Hasher._combine(_:)(v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance XPCArray()
{
  void **v0;
  void *v1;
  size_t v2;

  v1 = *v0;
  Hasher.init(_seed:)();
  v2 = xpc_hash(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t XPCArray.debugDescription.getter()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;

  v1 = (void *)MEMORY[0x1DF0F4BB0](*v0);
  v2 = String.init(cString:)();
  free(v1);
  return v2;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance XPCArray()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;

  v1 = (void *)MEMORY[0x1DF0F4BB0](*v0);
  v2 = String.init(cString:)();
  free(v1);
  return v2;
}

uint64_t specialized XPCArray.subscript.setter(uint64_t a1, size_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *), uint64_t a6, uint64_t (*a7)(uint64_t))
{
  void **v7;
  void **v11;
  uint64_t v13;
  uint64_t result;
  _xpc_connection_s *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[6];
  uint64_t v19;
  char v20;

  v11 = v7;
  v18[2] = a3;
  v18[3] = a4;
  type metadata accessor for Optional();
  result = _sSq7flatMapyqd_0_SgABxqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF(a5, (uint64_t)v18, MEMORY[0x1E0DEDCE8], a6, v13, (uint64_t)&v19);
  if (v20 != 1)
  {
    v15 = (_xpc_connection_s *)a7(v19);
    v16 = MEMORY[0x1DF0F4CB8]();
    v17 = *v11;
    if (v16 == MEMORY[0x1E0C812E0])
      xpc_array_set_connection(v17, a2, v15);
    else
      xpc_array_set_value(v17, a2, v15);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t specialized XPCArray.subscript.setter(uint64_t a1, size_t a2, uint64_t a3, uint64_t a4)
{
  void **v4;
  void **v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  _xpc_connection_s *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  _xpc_connection_s *v14;

  v5 = v4;
  v13[2] = a3;
  v13[3] = a4;
  type metadata accessor for Optional();
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for OS_xpc_object);
  result = _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in XPCArray.subscript.setter, (uint64_t)v13, MEMORY[0x1E0DEDCE8], v7, v8, (uint64_t)&v14);
  v10 = v14;
  if (v14)
  {
    v11 = MEMORY[0x1DF0F4CB8](v14);
    v12 = *v5;
    if (v11 == MEMORY[0x1E0C812E0])
      xpc_array_set_connection(v12, a2, v10);
    else
      xpc_array_set_value(v12, a2, v10);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1DF0278A4()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in XPCArray.copy(into:)(size_t index, xpc_object_t value)
{
  uint64_t v2;

  xpc_array_set_value(*(xpc_object_t *)(v2 + 16), index, value);
  return 1;
}

uint64_t sub_1DF0278EC()
{
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@unowned Bool)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_1DF027938()
{
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1DF027968()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in XPCArray.map<A>(_:)(uint64_t a1)
{
  return closure #1 in XPCArray.map<A>(_:)(a1);
}

uint64_t sub_1DF027994()
{
  return swift_deallocObject();
}

unint64_t lazy protocol witness table accessor for type XPCArray and conformance XPCArray()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type XPCArray and conformance XPCArray;
  if (!lazy protocol witness table cache variable for type XPCArray and conformance XPCArray)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for XPCArray, &type metadata for XPCArray);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCArray and conformance XPCArray);
  }
  return result;
}

uint64_t sub_1DF0279EC(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return keypath_getTm(a1, a2, a3, (uint64_t (*)(_QWORD, _QWORD, _QWORD))XPCArray.subscript.getter);
}

uint64_t sub_1DF0279F8(uint64_t a1, uint64_t a2, size_t *a3, uint64_t a4)
{
  return specialized XPCArray.subscript.setter(a1, *a3, *(size_t *)((char *)a3 + a4 - 16), *(size_t *)((char *)a3 + a4 - 8), (void (*)(char *, char *))partial apply for implicit closure #1 in XPCArray.subscript.setter, MEMORY[0x1E0DEDC60], MEMORY[0x1E0C86568]);
}

uint64_t sub_1DF027A40()
{
  return 16;
}

__n128 sub_1DF027A4C(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_1DF027A58(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return keypath_getTm(a1, a2, a3, (uint64_t (*)(_QWORD, _QWORD, _QWORD))XPCArray.subscript.getter);
}

uint64_t keypath_getTm(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t (*a4)(_QWORD, _QWORD, _QWORD))
{
  return a4(*a2, *(_QWORD *)((char *)a2 + a3 - 16), *(_QWORD *)((char *)a2 + a3 - 8));
}

uint64_t sub_1DF027AA4(uint64_t a1, uint64_t a2, size_t *a3, uint64_t a4)
{
  return specialized XPCArray.subscript.setter(a1, *a3, *(size_t *)((char *)a3 + a4 - 16), *(size_t *)((char *)a3 + a4 - 8), (void (*)(char *, char *))partial apply for implicit closure #1 in XPCArray.subscript.setter, MEMORY[0x1E0DEE190], MEMORY[0x1E0C867B0]);
}

uint64_t sub_1DF027AEC()
{
  return 16;
}

__n128 sub_1DF027AF8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_1DF027B04(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return keypath_getTm(a1, a2, a3, (uint64_t (*)(_QWORD, _QWORD, _QWORD))XPCArray.subscript.getter);
}

uint64_t sub_1DF027B10(uint64_t a1, uint64_t a2, size_t *a3, uint64_t a4)
{
  return specialized XPCArray.subscript.setter(a1, *a3, *(size_t *)((char *)a3 + a4 - 16), *(size_t *)((char *)a3 + a4 - 8));
}

uint64_t sub_1DF027B40()
{
  return 16;
}

__n128 sub_1DF027B4C(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_1DF027B58@<X0>(size_t *a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = XPCArray.subscript.getter(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1DF027B98()
{
  return 0;
}

uint64_t sub_1DF027BA8@<X0>(size_t *a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = XPCArray.subscript.getter(*a1, &v4);
  *a2 = v4;
  return result;
}

void sub_1DF027BEC(xpc_object_t *a1, xpc_object_t *a2, size_t *a3)
{
  if (*a1)
    xpc_array_set_value(*a2, *a3, *a1);
  else
    __break(1u);
}

uint64_t sub_1DF027C08()
{
  return 0;
}

xpc_object_t sub_1DF027C18@<X0>(xpc_object_t *a1@<X0>, size_t *a2@<X1>, _QWORD *a3@<X8>)
{
  xpc_object_t result;

  result = xpc_array_get_value(*a1, *a2);
  *a3 = result;
  return result;
}

uint64_t sub_1DF027C50()
{
  return 0;
}

uint64_t sub_1DF027C68()
{
  return 0;
}

ValueMetadata *type metadata accessor for XPCArray()
{
  return &type metadata for XPCArray;
}

uint64_t sub_1DF027C88()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in XPCArray.forEach(_:)()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  return 1;
}

uint64_t sub_1DF027D00()
{
  return swift_deallocObject();
}

void partial apply for closure #1 in XPCArray.subscript.setter(char *string)
{
  uint64_t v1;

  xpc_array_set_string(**(xpc_object_t **)(v1 + 16), *(_QWORD *)(v1 + 24), string);
}

xpc_object_t partial apply for closure #1 in XPCArray.subscript.setter@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return closure #1 in XPCArray.subscript.setter(a1, a2);
}

uint64_t partial apply for implicit closure #1 in XPCArray.subscript.setter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return implicit closure #1 in XPCArray.subscript.setter(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

{
  uint64_t v2;

  return implicit closure #1 in XPCArray.subscript.setter(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error)partial apply()
{
  return partial apply for thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error)();
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance Float()
{
  return 12;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance Double()
{
  return 13;
}

uint64_t dispatch thunk of CodingPrimitive.encodeValue(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of static CodingPrimitive.decodeValue(from:withCodingMetadata:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance Int(uint64_t a1)
{
  uint64_t *v1;

  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))specialized static DecodingContainer.decodeType(from:withCodingMetadata:), (uint64_t (*)(uint64_t, uint64_t))specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:), a4);
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance Int8(uint64_t a1)
{
  char *v1;

  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _BYTE *a4@<X8>)
{
  return protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int8(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))specialized static DecodingContainer.decodeType(from:withCodingMetadata:), (uint64_t (*)(uint64_t, uint64_t))specialized static Int8.decodeValue(from:withCodingMetadata:), a4);
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance Int16(uint64_t a1)
{
  __int16 *v1;

  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int16@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _WORD *a4@<X8>)
{
  return protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int16(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))specialized static DecodingContainer.decodeType(from:withCodingMetadata:), (uint64_t (*)(uint64_t, uint64_t))specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:), a4);
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance Int32(uint64_t a1)
{
  unsigned int *v1;

  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int32@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _DWORD *a4@<X8>)
{
  return protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int32(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))specialized static DecodingContainer.decodeType(from:withCodingMetadata:), (uint64_t (*)(uint64_t, uint64_t))specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:), a4);
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance Int64(uint64_t a1)
{
  uint64_t *v1;

  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))specialized static DecodingContainer.decodeType(from:withCodingMetadata:), (uint64_t (*)(uint64_t, uint64_t))specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:), a4);
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance UInt(uint64_t a1)
{
  uint64_t *v1;

  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance UInt@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))specialized static DecodingContainer.decodeType(from:withCodingMetadata:), (uint64_t (*)(uint64_t, uint64_t))specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:), a4);
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance UInt8(uint64_t a1)
{
  char *v1;

  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance UInt8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _BYTE *a4@<X8>)
{
  return protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int8(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))specialized static DecodingContainer.decodeType(from:withCodingMetadata:), (uint64_t (*)(uint64_t, uint64_t))specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:), a4);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t, uint64_t, uint64_t)@<X5>, uint64_t (*a5)(uint64_t, uint64_t)@<X6>, _BYTE *a6@<X8>)
{
  uint64_t v6;
  uint64_t result;
  char v12;

  a4(a3, a1, a2);
  if (v6)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    v12 = a5(a3, a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_release();
    *a6 = v12;
  }
  return result;
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance UInt16(uint64_t a1)
{
  __int16 *v1;

  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance UInt16@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _WORD *a4@<X8>)
{
  return protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int16(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))specialized static DecodingContainer.decodeType(from:withCodingMetadata:), (uint64_t (*)(uint64_t, uint64_t))specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:), a4);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int16@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t, uint64_t, uint64_t)@<X5>, uint64_t (*a5)(uint64_t, uint64_t)@<X6>, _WORD *a6@<X8>)
{
  uint64_t v6;
  uint64_t result;
  __int16 v12;

  a4(a3, a1, a2);
  if (v6)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    v12 = a5(a3, a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_release();
    *a6 = v12;
  }
  return result;
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance UInt32(uint64_t a1)
{
  unsigned int *v1;

  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance UInt32@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _DWORD *a4@<X8>)
{
  return protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int32(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))specialized static DecodingContainer.decodeType(from:withCodingMetadata:), (uint64_t (*)(uint64_t, uint64_t))specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:), a4);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int32@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t, uint64_t, uint64_t)@<X5>, uint64_t (*a5)(uint64_t, uint64_t)@<X6>, _DWORD *a6@<X8>)
{
  uint64_t v6;
  uint64_t result;
  int v12;

  a4(a3, a1, a2);
  if (v6)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    v12 = a5(a3, a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_release();
    *a6 = v12;
  }
  return result;
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance UInt64(uint64_t a1)
{
  uint64_t *v1;

  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance UInt64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))specialized static DecodingContainer.decodeType(from:withCodingMetadata:), (uint64_t (*)(uint64_t, uint64_t))specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:), a4);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t, uint64_t, uint64_t)@<X5>, uint64_t (*a5)(uint64_t, uint64_t)@<X6>, uint64_t *a6@<X8>)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v12;

  a4(a3, a1, a2);
  if (v6)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    v12 = a5(a3, a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_release();
    *a6 = v12;
  }
  return result;
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance String(uint64_t a1)
{
  uint64_t *v1;

  return specialized CodingPrimitive.encode(to:)(a1, *v1, v1[1]);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance String@<X0>(_QWORD *a1@<X2>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  specialized static DecodingContainer.decodeType(from:withCodingMetadata:)(a1);
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    v5 = specialized static String.decodeValue(from:withCodingMetadata:)();
    v7 = v6;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_release();
    *a2 = v5;
    a2[1] = v7;
  }
  return result;
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance Float(uint64_t a1)
{
  float *v1;

  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Float@<X0>(_QWORD *a1@<X2>, unsigned int *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  unsigned int v5;

  specialized static DecodingContainer.decodeType(from:withCodingMetadata:)(a1);
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    v5 = specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_release();
    *a2 = v5;
  }
  return result;
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance Double(uint64_t a1)
{
  double *v1;

  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Double@<X0>(_QWORD *a1@<X2>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  _QWORD *v5;

  specialized static DecodingContainer.decodeType(from:withCodingMetadata:)(a1);
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    v5 = specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_release();
    *a2 = v5;
  }
  return result;
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance Bool(uint64_t a1)
{
  char *v1;

  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Bool@<X0>(_QWORD *a1@<X2>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  unsigned __int8 v6;

  specialized static DecodingContainer.decodeType(from:withCodingMetadata:)(a1);
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    v6 = specialized static Bool.decodeValue(from:withCodingMetadata:)(a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_release();
    *a2 = v6 & 1;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for CodingUserInfoKeyNotFound(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CodingUserInfoKey();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for CodingUserInfoKeyNotFound(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CodingUserInfoKey();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for CodingUserInfoKeyNotFound(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CodingUserInfoKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for CodingUserInfoKeyNotFound(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CodingUserInfoKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for CodingUserInfoKeyNotFound(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CodingUserInfoKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for CodingUserInfoKeyNotFound(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CodingUserInfoKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for CodingUserInfoKeyNotFound()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DF0286A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CodingUserInfoKey();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for CodingUserInfoKeyNotFound()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DF0286F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CodingUserInfoKey();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for CodingUserInfoKeyNotFound()
{
  uint64_t result;

  result = type metadata singleton initialization cache for CodingUserInfoKeyNotFound;
  if (!type metadata singleton initialization cache for CodingUserInfoKeyNotFound)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata completion function for CodingUserInfoKeyNotFound()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for CodingUserInfoKey();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t typeMismatchError(codingMetadata:type:message:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, void *a3@<X4>, _QWORD *a4@<X8>)
{
  Swift::String v8;
  Swift::String v9;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
  *a4 = a1;
  swift_bridgeObjectRetain();
  _StringGuts.grow(_:)(39);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._object = (void *)0x80000001DF04ECF0;
  v9._countAndFlagsBits = 0xD00000000000001ALL;
  String.append(_:)(v9);
  v10._countAndFlagsBits = a2;
  v10._object = a3;
  String.append(_:)(v10);
  DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
  v11 = *MEMORY[0x1E0DEC450];
  v12 = type metadata accessor for DecodingError();
  return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(a4, v11, v12);
}

uint64_t keyNotFoundError<A>(codingMetadata:key:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  uint64_t *boxed_opaque_existential_1;
  Swift::String v9;
  uint64_t v10;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CodingKey, DecodingError.Context));
  a4[3] = a2;
  a4[4] = a3;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a4);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(boxed_opaque_existential_1, a1, a2);
  swift_bridgeObjectRetain();
  _StringGuts.grow(_:)(31);
  v9._object = (void *)0x80000001DF04EC90;
  v9._countAndFlagsBits = 0xD00000000000001DLL;
  String.append(_:)(v9);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
  v10 = *MEMORY[0x1E0DEC448];
  v11 = type metadata accessor for DecodingError();
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(a4, v10, v11);
}

unint64_t implicit closure #1 in default argument 2 of encodingError<A>(codingMetadata:value:message:)()
{
  return 0xD000000000000017;
}

uint64_t encodingError<A>(codingMetadata:value:message:)@<X0>(uint64_t a1@<X2>, void (*a2)(uint64_t)@<X3>, uint64_t a3@<X5>, uint64_t *a4@<X8>)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
  a4[3] = a3;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a4);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))(boxed_opaque_existential_1, a1, a3);
  v9 = swift_bridgeObjectRetain();
  a2(v9);
  DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
  v10 = *MEMORY[0x1E0DEC4B0];
  v11 = type metadata accessor for EncodingError();
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(a4, v10, v11);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CodingUserInfoKeyNotFound()
{
  Swift::String v0;

  _StringGuts.grow(_:)(28);
  v0._object = (void *)0x80000001DF04ECD0;
  v0._countAndFlagsBits = 0xD00000000000001ALL;
  String.append(_:)(v0);
  type metadata accessor for CodingUserInfoKey();
  _print_unlocked<A, B>(_:_:)();
  return 0;
}

uint64_t XPCCodableObject.init(copying:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;

  result = OS_xpc_object.isCodable()();
  if ((result & 1) != 0)
  {
    result = (uint64_t)xpc_copy(a1);
    if (result)
    {
      v5 = result;
      result = swift_unknownObjectRelease();
      *a2 = v5;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

Swift::Bool __swiftcall OS_xpc_object.isCodable()()
{
  uint64_t v0;
  Swift::UInt v1;

  if (one-time initialization token for allTypes != -1)
    swift_once();
  v0 = static Set<>.allTypes;
  v1 = MEMORY[0x1DF0F4CB8]();
  return specialized Set.contains(_:)(v1, v0);
}

void XPCCodableObject.type.getter()
{
  JUMPOUT(0x1DF0F4CB8);
}

xpc_object_t XPCCodableObject.copyUnderlyingXPCObject()()
{
  xpc_object_t *v0;
  xpc_object_t result;

  result = xpc_copy(*v0);
  if (!result)
    __break(1u);
  return result;
}

BOOL static XPCCodableObject.== infix(_:_:)(xpc_object_t *a1, xpc_object_t *a2)
{
  return xpc_equal(*a1, *a2);
}

void XPCCodableObject.hash(into:)()
{
  xpc_object_t *v0;
  size_t v1;

  v1 = xpc_hash(*v0);
  Hasher._combine(_:)(v1);
}

Swift::Int XPCCodableObject.hashValue.getter()
{
  void **v0;
  void *v1;
  size_t v2;

  v1 = *v0;
  Hasher.init(_seed:)();
  v2 = xpc_hash(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t XPCCodableObject.debugDescription.getter()
{
  uint64_t *v0;
  uint64_t v1;
  Swift::String v2;
  Swift::String v3;

  v1 = *v0;
  _StringGuts.grow(_:)(19);
  swift_bridgeObjectRelease();
  MEMORY[0x1DF0F4BB0](v1);
  v2._countAndFlagsBits = String.init(cString:)();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 41;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  return 0xD00000000000001ELL;
}

uint64_t XPCCodableObject.encode(to:)(_QWORD *a1)
{
  _xpc_connection_s **v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  _xpc_connection_s *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  unint64_t v16;
  char v17;
  xpc_object_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  xpc_object_t v25;

  v3 = type metadata accessor for CodingUserInfoKey();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v22 - v8;
  v10 = *v1;
  v11 = a1[3];
  v12 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v11);
  v13 = MEMORY[0x1DF0F4688](v11, v12);
  if (one-time initialization token for xpcCodable != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v3, (uint64_t)static CodingUserInfoKey.xpcCodable);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v15(v9, v14, v3);
  if (*(_QWORD *)(v13 + 16) && (v16 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v9), (v17 & 1) != 0))
  {
    outlined init with copy of Any(*(_QWORD *)(v13 + 56) + 32 * v16, (uint64_t)&v23);
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  if (!*((_QWORD *)&v24 + 1))
  {
    outlined destroy of Any?((uint64_t)&v23);
    goto LABEL_12;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    v15(v7, v14, v3);
    type metadata accessor for CodingUserInfoKeyNotFound();
    lazy protocol witness table accessor for type CodingUserInfoKeyNotFound and conformance CodingUserInfoKeyNotFound();
    swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v20, v7, v3);
    return swift_willThrow();
  }
  v18 = v25;
  xpc_array_get_count(v25);
  v19 = swift_unknownObjectRetain();
  if (MEMORY[0x1DF0F4CB8](v19) == MEMORY[0x1E0C812E0])
    xpc_array_set_connection(v18, 0xFFFFFFFFFFFFFFFFLL, v10);
  else
    xpc_array_set_value(v18, 0xFFFFFFFFFFFFFFFFLL, v10);
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v23, *((uint64_t *)&v24 + 1));
  dispatch thunk of SingleValueEncodingContainer.encode(_:)();
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
}

uint64_t XPCCodableObject.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  unint64_t v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t result;
  size_t v21;
  xpc_object_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  __int128 v32;
  __int128 v33;
  void *v34;

  v31 = a2;
  v4 = type metadata accessor for CodingUserInfoKey();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v30 - v9;
  v11 = a1[3];
  v12 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v11);
  v13 = MEMORY[0x1DF0F4670](v11, v12);
  if (one-time initialization token for xpcCodable != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v4, (uint64_t)static CodingUserInfoKey.xpcCodable);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v15(v10, v14, v4);
  if (*(_QWORD *)(v13 + 16) && (v16 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v10), (v17 & 1) != 0))
  {
    outlined init with copy of Any(*(_QWORD *)(v13 + 56) + 32 * v16, (uint64_t)&v32);
  }
  else
  {
    v32 = 0u;
    v33 = 0u;
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  if (!*((_QWORD *)&v33 + 1))
  {
    outlined destroy of Any?((uint64_t)&v32);
    goto LABEL_12;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    v15(v8, v14, v4);
    type metadata accessor for CodingUserInfoKeyNotFound();
    lazy protocol witness table accessor for type CodingUserInfoKeyNotFound and conformance CodingUserInfoKeyNotFound();
    swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v19, v8, v4);
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  v18 = v34;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Decoder.singleValueContainer()();
  if (v2)
  {
LABEL_10:
    swift_unknownObjectRelease();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  __swift_project_boxed_opaque_existential_1(&v32, *((uint64_t *)&v33 + 1));
  v21 = dispatch thunk of SingleValueDecodingContainer.decode(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v32);
  v22 = xpc_array_get_value(v18, v21);
  if (!v22)
  {
    v25 = a1[3];
    v26 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v25);
    Decoder.codingMetadata.getter(v25, v26);
    v27 = type metadata accessor for DecodingError();
    swift_allocError();
    v29 = v28;
    *(_QWORD *)&v32 = 0;
    *((_QWORD *)&v32 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(31);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v27 - 8) + 104))(v29, *MEMORY[0x1E0DEC458], v27);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_willThrow();
    goto LABEL_10;
  }
  v23 = v22;
  result = OS_xpc_object.isCodable()();
  if ((result & 1) != 0)
  {
    result = (uint64_t)xpc_copy(v23);
    if (result)
    {
      v24 = result;
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      *v31 = v24;
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance XPCCodableObject@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return XPCCodableObject.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance XPCCodableObject(_QWORD *a1)
{
  return XPCCodableObject.encode(to:)(a1);
}

uint64_t static XPCCodableObjectRepresentable.validXPCObjectTypes.getter()
{
  specialized static XPCCodableObjectRepresentable.validXPCObjectTypes.getter();
  return swift_bridgeObjectRetain();
}

{
  specialized static XPCCodableObjectRepresentable.validXPCObjectTypes.getter();
  return swift_bridgeObjectRetain();
}

uint64_t XPCCodableObjectRepresentableCache._Cache.subscript.getter(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;

  v4 = (os_unfair_lock_s *)(a2 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a2 + 24));
  v5 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(v5 + 16) && (v6 = specialized __RawDictionaryStorage.find<A>(_:)(a1), (v7 & 1) != 0))
    v8 = *(unsigned __int8 *)(*(_QWORD *)(v5 + 56) + v6);
  else
    v8 = 2;
  os_unfair_lock_unlock(v4);
  return v8;
}

uint64_t one-time initialization function for resetValue()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  _QWORD v11[42];

  v11[0] = MEMORY[0x1E0DEAFA0];
  v11[1] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Bool?);
  v11[2] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [Bool]);
  v11[3] = MEMORY[0x1E0DEA968];
  v11[4] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  v11[5] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String]);
  v11[6] = MEMORY[0x1E0DEB188];
  v11[7] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Float?);
  v11[8] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [Float]);
  v11[9] = MEMORY[0x1E0DEB070];
  v11[10] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Double?);
  v11[11] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [Double]);
  v11[12] = MEMORY[0x1E0DEDA70];
  v11[13] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Int8?);
  v11[14] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [Int8]);
  v11[15] = MEMORY[0x1E0DEDB58];
  v11[16] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Int16?);
  v11[17] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [Int16]);
  v11[18] = MEMORY[0x1E0DEDBC8];
  v11[19] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Int32?);
  v11[20] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [Int32]);
  v11[21] = MEMORY[0x1E0DEDC60];
  v11[22] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Int64?);
  v11[23] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [Int64]);
  v11[24] = MEMORY[0x1E0DEB418];
  v11[25] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Int?);
  v11[26] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [Int]);
  v11[27] = MEMORY[0x1E0DEDE70];
  v11[28] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UInt8?);
  v11[29] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [UInt8]);
  v11[30] = MEMORY[0x1E0DEE068];
  v11[31] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UInt16?);
  v11[32] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [UInt16]);
  v11[33] = MEMORY[0x1E0DEE0F8];
  v11[34] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UInt32?);
  v11[35] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [UInt32]);
  v11[36] = MEMORY[0x1E0DEE190];
  v11[37] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UInt64?);
  v11[38] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt64]);
  v11[39] = MEMORY[0x1E0DEBB98];
  v11[40] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UInt?);
  v11[41] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [UInt]);
  v10 = MEMORY[0x1E0DEE9D8];
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, 42, 0);
  v0 = 0;
  v1 = v10;
  v2 = *(_QWORD *)(v10 + 16);
  v3 = 16 * v2;
  do
  {
    v4 = v11[v0];
    v10 = v1;
    v5 = *(_QWORD *)(v1 + 24);
    v6 = v2 + v0 + 1;
    if (v2 + v0 >= v5 >> 1)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v5 > 1), v2 + v0 + 1, 1);
      v1 = v10;
    }
    ++v0;
    *(_QWORD *)(v1 + 16) = v6;
    v7 = v1 + v3;
    *(_QWORD *)(v7 + 32) = v4;
    *(_BYTE *)(v7 + 40) = 0;
    v3 += 16;
  }
  while (v0 != 42);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ObjectIdentifier, Bool>);
  v10 = static _DictionaryStorage.allocate(capacity:)();
  v8 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v8, 1, &v10);
  result = swift_release();
  static XPCCodableObjectRepresentableCache._Cache.resetValue = v10;
  return result;
}

uint64_t one-time initialization function for global()
{
  unint64_t v0;
  uint64_t result;

  v0 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E0DEE9D8]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<[ObjectIdentifier : Bool], os_unfair_lock_s>);
  result = swift_allocObject();
  *(_DWORD *)(result + 24) = 0;
  *(_QWORD *)(result + 16) = v0;
  static XPCCodableObjectRepresentableCache._Cache.global = (_UNKNOWN *)result;
  return result;
}

{
  uint64_t inited;
  uint64_t result;

  type metadata accessor for XPCCodableObjectRepresentableCache();
  inited = swift_initStaticObject();
  if (one-time initialization token for global != -1)
    swift_once();
  result = _dyld_register_for_bulk_image_loads();
  static XPCCodableObjectRepresentableCache.global = inited;
  return result;
}

uint64_t @objc closure #1 in XPCCodableObjectRepresentableCache.().init()()
{
  os_unfair_lock_s *v0;

  if (one-time initialization token for global != -1)
    swift_once();
  swift_beginAccess();
  v0 = (os_unfair_lock_s *)static XPCCodableObjectRepresentableCache._Cache.global;
  swift_retain();
  os_unfair_lock_lock(v0 + 6);
  swift_bridgeObjectRelease();
  if (one-time initialization token for resetValue != -1)
    swift_once();
  *(_QWORD *)&v0[4]._os_unfair_lock_opaque = static XPCCodableObjectRepresentableCache._Cache.resetValue;
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v0 + 6);
  return swift_release();
}

uint64_t static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)(uint64_t a1, uint64_t a2)
{
  if (one-time initialization token for global != -1)
    swift_once();
  return specialized XPCCodableObjectRepresentableCache._checkConformance<A>(forType:)(a2);
}

uint64_t XPCCodableObjectRepresentableCache.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t one-time initialization function for allTypes()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<OpaquePointer>);
  inited = swift_initStackObject();
  v1 = MEMORY[0x1E0C812D0];
  *(_QWORD *)(inited + 32) = MEMORY[0x1E0C81350];
  *(_QWORD *)(inited + 40) = v1;
  v2 = MEMORY[0x1E0C81398];
  *(_QWORD *)(inited + 48) = MEMORY[0x1E0C81328];
  *(_QWORD *)(inited + 56) = v2;
  v3 = MEMORY[0x1E0C812F0];
  *(_QWORD *)(inited + 64) = MEMORY[0x1E0C81300];
  *(_QWORD *)(inited + 72) = v3;
  v4 = MEMORY[0x1E0C81390];
  *(_QWORD *)(inited + 80) = MEMORY[0x1E0C812E8];
  *(_QWORD *)(inited + 88) = v4;
  v5 = MEMORY[0x1E0C81318];
  *(_QWORD *)(inited + 96) = MEMORY[0x1E0C813A0];
  *(_QWORD *)(inited + 104) = v5;
  v6 = MEMORY[0x1E0C81338];
  *(_QWORD *)(inited + 112) = MEMORY[0x1E0C81388];
  *(_QWORD *)(inited + 120) = v6;
  v7 = MEMORY[0x1E0C812F8];
  *(_QWORD *)(inited + 128) = MEMORY[0x1E0C812C8];
  *(_QWORD *)(inited + 136) = v7;
  v8 = MEMORY[0x1E0C81308];
  *(_QWORD *)(inited + 144) = MEMORY[0x1E0C81310];
  *(_QWORD *)(inited + 152) = v8;
  v9 = MEMORY[0x1E0C81330];
  v10 = MEMORY[0x1E0C81348];
  *(_OWORD *)(inited + 16) = xmmword_1DF04AA60;
  *(_QWORD *)(inited + 160) = v9;
  *(_QWORD *)(inited + 168) = v10;
  *(_QWORD *)(inited + 176) = MEMORY[0x1E0C81368];
  v11 = specialized Set.init(_nonEmptyArrayLiteral:)(inited);
  result = swift_setDeallocating();
  static Set<>.allTypes = v11;
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v2;

  v2 = static Hasher._hash(seed:_:)();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

{
  uint64_t v2;

  type metadata accessor for CodingUserInfoKey();
  v2 = dispatch thunk of Hashable._rawHashValue(seed:)();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t lazy protocol witness table accessor for type CodingUserInfoKeyNotFound and conformance CodingUserInfoKeyNotFound()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type CodingUserInfoKeyNotFound and conformance CodingUserInfoKeyNotFound;
  if (!lazy protocol witness table cache variable for type CodingUserInfoKeyNotFound and conformance CodingUserInfoKeyNotFound)
  {
    v1 = type metadata accessor for CodingUserInfoKeyNotFound();
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for CodingUserInfoKeyNotFound, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CodingUserInfoKeyNotFound and conformance CodingUserInfoKeyNotFound);
  }
  return result;
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

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;

  Hasher.init(_seed:)();
  String.hash(into:)();
  v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = type metadata accessor for CodingUserInfoKey();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      v14 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

void specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v7;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  void *v17;
  id v18;
  _QWORD *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  char v26;
  _QWORD *v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  _BOOL8 v31;
  uint64_t v32;
  char v33;
  char v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  Swift::String v38;
  Swift::String v39;
  char v40;

  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v7 = *(_QWORD *)(a1 + 32);
  v40 = *(_BYTE *)(a1 + 40);
  swift_bridgeObjectRetain();
  v8 = (_QWORD *)*a3;
  v10 = specialized __RawDictionaryStorage.find<A>(_:)(v7);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
    goto LABEL_23;
  v14 = v9;
  if (v8[3] >= v13)
  {
    if ((a2 & 1) != 0)
    {
      if ((v9 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      specialized _NativeDictionary.copy()();
      if ((v14 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v19 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v10 >> 6) + 64) |= 1 << v10;
    *(_QWORD *)(v19[6] + 8 * v10) = v7;
    *(_BYTE *)(v19[7] + v10) = v40;
    v20 = v19[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (v21)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v19[2] = v22;
    v23 = v4 - 1;
    if (v4 == 1)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    v24 = (_BYTE *)(a1 + 56);
    while (1)
    {
      v25 = *((_QWORD *)v24 - 1);
      v26 = *v24;
      v27 = (_QWORD *)*a3;
      v28 = specialized __RawDictionaryStorage.find<A>(_:)(v25);
      v30 = v27[2];
      v31 = (v29 & 1) == 0;
      v21 = __OFADD__(v30, v31);
      v32 = v30 + v31;
      if (v21)
        break;
      v33 = v29;
      if (v27[3] < v32)
      {
        specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v32, 1);
        v28 = specialized __RawDictionaryStorage.find<A>(_:)(v25);
        if ((v33 & 1) != (v34 & 1))
          goto LABEL_25;
      }
      if ((v33 & 1) != 0)
        goto LABEL_10;
      v35 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v28 >> 6) + 64) |= 1 << v28;
      *(_QWORD *)(v35[6] + 8 * v28) = v25;
      *(_BYTE *)(v35[7] + v28) = v26;
      v36 = v35[2];
      v21 = __OFADD__(v36, 1);
      v37 = v36 + 1;
      if (v21)
        goto LABEL_24;
      v35[2] = v37;
      v24 += 16;
      if (!--v23)
        goto LABEL_22;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v13, a2 & 1);
  v15 = specialized __RawDictionaryStorage.find<A>(_:)(v7);
  if ((v14 & 1) == (v16 & 1))
  {
    v10 = v15;
    if ((v14 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v17 = (void *)swift_allocError();
    swift_willThrow();
    v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease_n();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
LABEL_26:
  _StringGuts.grow(_:)(30);
  v38._object = (void *)0x80000001DF04EDD0;
  v38._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v38);
  _print_unlocked<A, B>(_:_:)();
  v39._countAndFlagsBits = 39;
  v39._object = (void *)0xE100000000000000;
  String.append(_:)(v39);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t specialized XPCCodableObjectRepresentableCache._checkConformance<A>(forType:)(uint64_t a1)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  os_unfair_lock_s *v6;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;

  if (one-time initialization token for global != -1)
    swift_once();
  swift_beginAccess();
  v2 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(a1, (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v2 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2())
      v3 = a1;
    else
      v3 = 0;
    v4 = v3 != 0;
    swift_beginAccess();
    v5 = static XPCCodableObjectRepresentableCache._Cache.global;
    v6 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = v5[2];
    v5[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v4, a1, isUniquelyReferenced_nonNull_native);
    v5[2] = v9;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v6);
  }
  else
  {
    v4 = v2 & 1;
  }
  swift_endAccess();
  return v4;
}

Swift::Int specialized Set.init(_nonEmptyArrayLiteral:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::UInt v7;
  Swift::Int result;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(demangling cache variable for type metadata for _SetStorage<OpaquePointer>);
    v3 = static _SetStorage.allocate(capacity:)();
    v4 = 0;
    v5 = v3 + 56;
    v6 = a1 + 32;
    while (1)
    {
      v7 = *(_QWORD *)(v6 + 8 * v4);
      Hasher.init(_seed:)();
      Hasher._combine(_:)(v7);
      result = Hasher._finalize()();
      v9 = -1 << *(_BYTE *)(v3 + 32);
      v10 = result & ~v9;
      v11 = v10 >> 6;
      v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
      v13 = 1 << v10;
      v14 = *(_QWORD *)(v3 + 48);
      if (((1 << v10) & v12) != 0)
      {
        if (*(_QWORD *)(v14 + 8 * v10) == v7)
          goto LABEL_3;
        v15 = ~v9;
        while (1)
        {
          v10 = (v10 + 1) & v15;
          v11 = v10 >> 6;
          v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
          v13 = 1 << v10;
          if ((v12 & (1 << v10)) == 0)
            break;
          if (*(_QWORD *)(v14 + 8 * v10) == v7)
            goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v11) = v13 | v12;
      *(_QWORD *)(v14 + 8 * v10) = v7;
      v16 = *(_QWORD *)(v3 + 16);
      v17 = __OFADD__(v16, 1);
      v18 = v16 + 1;
      if (v17)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v18;
LABEL_3:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x1E0DEE9E8];
}

uint64_t specialized static XPCCodableObjectRepresentable.validXPCObjectTypes.getter()
{
  if (one-time initialization token for allTypes != -1)
    swift_once();
  return static Set<>.allTypes;
}

unint64_t lazy protocol witness table accessor for type XPCCodableObject and conformance XPCCodableObject()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type XPCCodableObject and conformance XPCCodableObject;
  if (!lazy protocol witness table cache variable for type XPCCodableObject and conformance XPCCodableObject)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for XPCCodableObject, &type metadata for XPCCodableObject);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCCodableObject and conformance XPCCodableObject);
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCCodableObject()
{
  return &type metadata for XPCCodableObject;
}

uint64_t dispatch thunk of XPCCodableObjectRepresentable.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of XPCCodableObjectRepresentable.xpcCodableObject.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static XPCCodableObjectRepresentable.validXPCObjectTypes.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t type metadata accessor for XPCCodableObjectRepresentableCache()
{
  return objc_opt_self();
}

BOOL static XPCEndpoint.== infix(_:_:)(xpc_object_t *a1, xpc_object_t *a2)
{
  return xpc_equal(*a1, *a2);
}

uint64_t XPCEndpoint.hash(into:)()
{
  void *v0;
  size_t v1;

  v0 = (void *)swift_unknownObjectRetain();
  v1 = xpc_hash(v0);
  Hasher._combine(_:)(v1);
  return swift_unknownObjectRelease();
}

Swift::Int XPCEndpoint.hashValue.getter()
{
  void *v0;
  size_t v1;

  Hasher.init(_seed:)();
  v0 = (void *)swift_unknownObjectRetain();
  v1 = xpc_hash(v0);
  Hasher._combine(_:)(v1);
  swift_unknownObjectRelease();
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance XPCEndpoint()
{
  void *v0;
  size_t v1;

  Hasher.init(_seed:)();
  v0 = (void *)swift_unknownObjectRetain();
  v1 = xpc_hash(v0);
  Hasher._combine(_:)(v1);
  swift_unknownObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance XPCEndpoint()
{
  void *v0;
  size_t v1;

  v0 = (void *)swift_unknownObjectRetain();
  v1 = xpc_hash(v0);
  Hasher._combine(_:)(v1);
  return swift_unknownObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance XPCEndpoint()
{
  void *v0;
  size_t v1;

  Hasher.init(_seed:)();
  v0 = (void *)swift_unknownObjectRetain();
  v1 = xpc_hash(v0);
  Hasher._combine(_:)(v1);
  swift_unknownObjectRelease();
  return Hasher._finalize()();
}

unint64_t XPCEndpoint.debugDescription.getter()
{
  uint64_t *v0;
  uint64_t v1;
  Swift::String v2;
  Swift::String v3;

  v1 = *v0;
  _StringGuts.grow(_:)(19);
  swift_bridgeObjectRelease();
  MEMORY[0x1DF0F4BB0](v1);
  v2._countAndFlagsBits = String.init(cString:)();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 41;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  return 0xD00000000000001ELL;
}

unint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance XPCEndpoint()
{
  return XPCCodableObject.debugDescription.getter();
}

uint64_t XPCEndpoint.encode(to:)(_QWORD *a1)
{
  return XPCCodableObject.encode(to:)(a1);
}

uint64_t XPCEndpoint.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  Swift::String v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;

  outlined init with copy of XPCCodableObjectRepresentable((uint64_t)a1, (uint64_t)&v13);
  XPCCodableObject.init(from:)(&v13, &v15);
  if (!v2)
  {
    v5 = v15;
    if (MEMORY[0x1DF0F4CB8](v15) == MEMORY[0x1E0C81308])
    {
      *a2 = v5;
    }
    else
    {
      v6 = a1[3];
      v7 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v6);
      Decoder.codingMetadata.getter(v6, v7);
      v13 = 0;
      v14 = 0xE000000000000000;
      v8._countAndFlagsBits = 0x626F20637078203ALL;
      v8._object = (void *)0xED0000207463656ALL;
      String.append(_:)(v8);
      v15 = MEMORY[0x1DF0F4CB8](v5);
      _print_unlocked<A, B>(_:_:)();
      v9 = v13;
      v10 = (void *)v14;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)((uint64_t)&type metadata for XPCEndpoint, v9, v10, v11);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t lazy protocol witness table accessor for type XPCEndpoint and conformance XPCEndpoint()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type XPCEndpoint and conformance XPCEndpoint;
  if (!lazy protocol witness table cache variable for type XPCEndpoint and conformance XPCEndpoint)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for XPCEndpoint, &type metadata for XPCEndpoint);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCEndpoint and conformance XPCEndpoint);
  }
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance XPCEndpoint@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return XPCEndpoint.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance XPCEndpoint(_QWORD *a1)
{
  return XPCCodableObject.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for XPCEndpoint()
{
  return &type metadata for XPCEndpoint;
}

uint64_t dispatch thunk of UnkeyedContainer.currentIndex.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t initializeBufferWithCopyOfBuffer for CodableIndexKey(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CodableIndexKey()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CodableIndexKey(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CodableIndexKey(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CodableIndexKey(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for CodableIndexKey(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 25))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CodableIndexKey(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 25) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CodableIndexKey()
{
  return &type metadata for CodableIndexKey;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance CodableIndexKey()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance CodableIndexKey@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance CodableIndexKey()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance CodableIndexKey@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  Swift::String v4;
  uint64_t result;

  v4._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v4);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = 0x207865646E49;
  *(_QWORD *)(a2 + 8) = 0xE600000000000000;
  *(_QWORD *)(a2 + 16) = a1;
  *(_BYTE *)(a2 + 24) = 0;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CodableIndexKey()
{
  lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CodableIndexKey()
{
  lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  return CodingKey.debugDescription.getter();
}

ValueMetadata *type metadata accessor for NilPrimitive()
{
  return &type metadata for NilPrimitive;
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance NilPrimitive(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  specialized static DecodingContainer.decodeType(from:withCodingMetadata:)(a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance NilPrimitive()
{
  return 0;
}

uint64_t specialized NilPrimitive.encode(to:)(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  unint64_t v6;

  v2 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  v3 = *(_QWORD *)(a1 + 16);
  result = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a1 + 16) = v3;
  if ((result & 1) == 0)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v3 + 16) + 1, 1, (char *)v3);
    v3 = result;
    *v2 = result;
  }
  v6 = *(_QWORD *)(v3 + 16);
  v5 = *(_QWORD *)(v3 + 24);
  if (v6 >= v5 >> 1)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v5 > 1), v6 + 1, 1, (char *)v3);
    v3 = result;
    *v2 = result;
  }
  *(_QWORD *)(v3 + 16) = v6 + 1;
  *(_BYTE *)(v3 + v6 + 32) = 1;
  return result;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance Bool()
{
  return 11;
}

_QWORD *specialized static Bool.decodeValue(from:withCodingMetadata:)(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = result[4];
  v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    v3 = result[6];
    if (v3 >= v2 - v1)
      goto LABEL_10;
    v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2)
        goto LABEL_14;
      v6 = v3 + 1;
      v7 = *(unsigned __int8 *)(result[3] + v4);
      result[6] = v6;
      if (v7 < 2)
        return (_QWORD *)(v7 & 1);
LABEL_10:
      v8 = type metadata accessor for DecodingError();
      swift_allocError();
      v10 = v9;
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v8 - 8) + 104))(v10, *MEMORY[0x1E0DEC458], v8);
      swift_willThrow();
      return (_QWORD *)(v7 & 1);
    }
  }
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t dispatch thunk of static CodingIntegerPrimitive.encodingLength.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t specialized CodingIntegerPrimitive.forEachByte(do:)(uint64_t a1, uint64_t *a2)
{
  closure #1 in CodingIntegerPrimitive.asBytes()(a1, a2);
  closure #1 in CodingIntegerPrimitive.asBytes()(SBYTE1(a1), a2);
  closure #1 in CodingIntegerPrimitive.asBytes()(SBYTE2(a1), a2);
  closure #1 in CodingIntegerPrimitive.asBytes()(SBYTE3(a1), a2);
  closure #1 in CodingIntegerPrimitive.asBytes()(SBYTE4(a1), a2);
  closure #1 in CodingIntegerPrimitive.asBytes()(SBYTE5(a1), a2);
  closure #1 in CodingIntegerPrimitive.asBytes()(SBYTE6(a1), a2);
  return closure #1 in CodingIntegerPrimitive.asBytes()(SHIBYTE(a1), a2);
}

uint64_t closure #1 in CodingIntegerPrimitive.encodeValue(to:)(char a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;

  v4 = (uint64_t *)(a2 + 16);
  swift_beginAccess();
  v5 = *(_QWORD *)(a2 + 16);
  result = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a2 + 16) = v5;
  if ((result & 1) == 0)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v5 + 16) + 1, 1, (char *)v5);
    v5 = result;
    *v4 = result;
  }
  v8 = *(_QWORD *)(v5 + 16);
  v7 = *(_QWORD *)(v5 + 24);
  if (v8 >= v7 >> 1)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, (char *)v5);
    v5 = result;
    *v4 = result;
  }
  *(_QWORD *)(v5 + 16) = v8 + 1;
  *(_BYTE *)(v5 + v8 + 32) = a1;
  return result;
}

uint64_t closure #1 in CodingIntegerPrimitive.asBytes()(char a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t result;
  unint64_t v6;
  unint64_t v7;

  v4 = *a2;
  result = swift_isUniquelyReferenced_nonNull_native();
  *a2 = v4;
  if ((result & 1) == 0)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v4 + 16) + 1, 1, (char *)v4);
    v4 = result;
    *a2 = result;
  }
  v7 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  if (v7 >= v6 >> 1)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v6 > 1), v7 + 1, 1, (char *)v4);
    v4 = result;
  }
  *(_QWORD *)(v4 + 16) = v7 + 1;
  *(_BYTE *)(v4 + v7 + 32) = a1;
  *a2 = v4;
  return result;
}

uint64_t specialized CodingIntegerPrimitive.forEachByte(do:)(int a1, uint64_t a2)
{
  closure #1 in CodingIntegerPrimitive.encodeValue(to:)(a1, a2);
  closure #1 in CodingIntegerPrimitive.encodeValue(to:)(SBYTE1(a1), a2);
  closure #1 in CodingIntegerPrimitive.encodeValue(to:)(SBYTE2(a1), a2);
  return closure #1 in CodingIntegerPrimitive.encodeValue(to:)(SHIBYTE(a1), a2);
}

uint64_t specialized CodingIntegerPrimitive.forEachByte(do:)(uint64_t a1, uint64_t a2)
{
  closure #1 in CodingIntegerPrimitive.encodeValue(to:)(a1, a2);
  closure #1 in CodingIntegerPrimitive.encodeValue(to:)(SBYTE1(a1), a2);
  closure #1 in CodingIntegerPrimitive.encodeValue(to:)(SBYTE2(a1), a2);
  closure #1 in CodingIntegerPrimitive.encodeValue(to:)(SBYTE3(a1), a2);
  closure #1 in CodingIntegerPrimitive.encodeValue(to:)(SBYTE4(a1), a2);
  closure #1 in CodingIntegerPrimitive.encodeValue(to:)(SBYTE5(a1), a2);
  closure #1 in CodingIntegerPrimitive.encodeValue(to:)(SBYTE6(a1), a2);
  return closure #1 in CodingIntegerPrimitive.encodeValue(to:)(SHIBYTE(a1), a2);
}

_QWORD *specialized static DecodingContainer.decodeType(from:withCodingMetadata:)(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;

  v1 = result[4];
  v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    v3 = result[6];
    if (v3 >= v2 - v1)
    {
      v6 = type metadata accessor for DecodingError();
      swift_allocError();
      v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *MEMORY[0x1E0DEC458], v6);
      return (_QWORD *)swift_willThrow();
    }
    v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2)
        goto LABEL_16;
      if (*(_BYTE *)(result[3] + v4) == 2)
      {
        result[6] = v3 + 1;
        return result;
      }
      v13 = dispatch thunk of CustomStringConvertible.description.getter();
      v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEB418], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;

  v1 = result[4];
  v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    v3 = result[6];
    if (v3 >= v2 - v1)
    {
      v6 = type metadata accessor for DecodingError();
      swift_allocError();
      v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *MEMORY[0x1E0DEC458], v6);
      return (_QWORD *)swift_willThrow();
    }
    v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2)
        goto LABEL_16;
      if (*(_BYTE *)(result[3] + v4) == 3)
      {
        result[6] = v3 + 1;
        return result;
      }
      v13 = dispatch thunk of CustomStringConvertible.description.getter();
      v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEDA70], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;

  v1 = result[4];
  v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    v3 = result[6];
    if (v3 >= v2 - v1)
    {
      v6 = type metadata accessor for DecodingError();
      swift_allocError();
      v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *MEMORY[0x1E0DEC458], v6);
      return (_QWORD *)swift_willThrow();
    }
    v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2)
        goto LABEL_16;
      if (*(_BYTE *)(result[3] + v4) == 4)
      {
        result[6] = v3 + 1;
        return result;
      }
      v13 = dispatch thunk of CustomStringConvertible.description.getter();
      v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEDB58], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;

  v1 = result[4];
  v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    v3 = result[6];
    if (v3 >= v2 - v1)
    {
      v6 = type metadata accessor for DecodingError();
      swift_allocError();
      v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *MEMORY[0x1E0DEC458], v6);
      return (_QWORD *)swift_willThrow();
    }
    v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2)
        goto LABEL_16;
      if (*(_BYTE *)(result[3] + v4) == 5)
      {
        result[6] = v3 + 1;
        return result;
      }
      v13 = dispatch thunk of CustomStringConvertible.description.getter();
      v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEDBC8], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;

  v1 = result[4];
  v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    v3 = result[6];
    if (v3 >= v2 - v1)
    {
      v6 = type metadata accessor for DecodingError();
      swift_allocError();
      v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *MEMORY[0x1E0DEC458], v6);
      return (_QWORD *)swift_willThrow();
    }
    v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2)
        goto LABEL_16;
      if (*(_BYTE *)(result[3] + v4) == 6)
      {
        result[6] = v3 + 1;
        return result;
      }
      v13 = dispatch thunk of CustomStringConvertible.description.getter();
      v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEDC60], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;

  v1 = result[4];
  v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    v3 = result[6];
    if (v3 >= v2 - v1)
    {
      v6 = type metadata accessor for DecodingError();
      swift_allocError();
      v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *MEMORY[0x1E0DEC458], v6);
      return (_QWORD *)swift_willThrow();
    }
    v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2)
        goto LABEL_16;
      if (*(_BYTE *)(result[3] + v4) == 7)
      {
        result[6] = v3 + 1;
        return result;
      }
      v13 = dispatch thunk of CustomStringConvertible.description.getter();
      v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEBB98], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  Swift::String v11;
  Swift::String v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;

  v1 = result[4];
  v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    v3 = result[6];
    if (v3 >= v2 - v1)
    {
      v6 = type metadata accessor for DecodingError();
      swift_allocError();
      v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *MEMORY[0x1E0DEC458], v6);
      return (_QWORD *)swift_willThrow();
    }
    v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2)
        goto LABEL_16;
      if (*(_BYTE *)(result[3] + v4) == 8)
      {
        result[6] = v3 + 1;
        return result;
      }
      v9 = MEMORY[0x1E0DEDE70];
      v14 = dispatch thunk of CustomStringConvertible.description.getter();
      v15 = v10;
      v11._countAndFlagsBits = 540877088;
      v11._object = (void *)0xE400000000000000;
      String.append(_:)(v11);
      v12._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v12);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(v9, v14, v15, v13);
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;

  v1 = result[4];
  v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    v3 = result[6];
    if (v3 >= v2 - v1)
    {
      v6 = type metadata accessor for DecodingError();
      swift_allocError();
      v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *MEMORY[0x1E0DEC458], v6);
      return (_QWORD *)swift_willThrow();
    }
    v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2)
        goto LABEL_16;
      if (*(_BYTE *)(result[3] + v4) == 9)
      {
        result[6] = v3 + 1;
        return result;
      }
      v13 = dispatch thunk of CustomStringConvertible.description.getter();
      v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEE068], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;

  v1 = result[4];
  v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    v3 = result[6];
    if (v3 >= v2 - v1)
    {
      v6 = type metadata accessor for DecodingError();
      swift_allocError();
      v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *MEMORY[0x1E0DEC458], v6);
      return (_QWORD *)swift_willThrow();
    }
    v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2)
        goto LABEL_16;
      if (*(_BYTE *)(result[3] + v4) == 10)
      {
        result[6] = v3 + 1;
        return result;
      }
      v13 = dispatch thunk of CustomStringConvertible.description.getter();
      v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEE0F8], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;

  v1 = result[4];
  v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    v3 = result[6];
    if (v3 >= v2 - v1)
    {
      v6 = type metadata accessor for DecodingError();
      swift_allocError();
      v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *MEMORY[0x1E0DEC458], v6);
      return (_QWORD *)swift_willThrow();
    }
    v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2)
        goto LABEL_16;
      if (*(_BYTE *)(result[3] + v4) == 11)
      {
        result[6] = v3 + 1;
        return result;
      }
      v13 = dispatch thunk of CustomStringConvertible.description.getter();
      v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEE190], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;

  v1 = result[4];
  v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    v3 = result[6];
    if (v3 >= v2 - v1)
    {
      v6 = type metadata accessor for DecodingError();
      swift_allocError();
      v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *MEMORY[0x1E0DEC458], v6);
      return (_QWORD *)swift_willThrow();
    }
    v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2)
        goto LABEL_16;
      if (*(_BYTE *)(result[3] + v4) == 1)
      {
        result[6] = v3 + 1;
        return result;
      }
      v13 = dispatch thunk of CustomStringConvertible.description.getter();
      v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)((uint64_t)&type metadata for NilPrimitive, v13, v14, v12);
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;

  v1 = result[4];
  v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    v3 = result[6];
    if (v3 >= v2 - v1)
    {
      v6 = type metadata accessor for DecodingError();
      swift_allocError();
      v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *MEMORY[0x1E0DEC458], v6);
      return (_QWORD *)swift_willThrow();
    }
    v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2)
        goto LABEL_16;
      if (*(_BYTE *)(result[3] + v4) == 19)
      {
        result[6] = v3 + 1;
        return result;
      }
      v13 = dispatch thunk of CustomStringConvertible.description.getter();
      v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)((uint64_t)&type metadata for OptionalPrimitive, v13, v14, v12);
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;

  v1 = result[4];
  v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    v3 = result[6];
    if (v3 >= v2 - v1)
    {
      v6 = type metadata accessor for DecodingError();
      swift_allocError();
      v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *MEMORY[0x1E0DEC458], v6);
      return (_QWORD *)swift_willThrow();
    }
    v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2)
        goto LABEL_16;
      if (*(_BYTE *)(result[3] + v4) == 15)
      {
        result[6] = v3 + 1;
        return result;
      }
      v13 = dispatch thunk of CustomStringConvertible.description.getter();
      v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEA968], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;

  v1 = result[4];
  v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    v3 = result[6];
    if (v3 >= v2 - v1)
    {
      v6 = type metadata accessor for DecodingError();
      swift_allocError();
      v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *MEMORY[0x1E0DEC458], v6);
      return (_QWORD *)swift_willThrow();
    }
    v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2)
        goto LABEL_16;
      if (*(_BYTE *)(result[3] + v4) == 12)
      {
        result[6] = v3 + 1;
        return result;
      }
      v13 = dispatch thunk of CustomStringConvertible.description.getter();
      v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEAFA0], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;

  v1 = result[4];
  v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    v3 = result[6];
    if (v3 >= v2 - v1)
    {
      v6 = type metadata accessor for DecodingError();
      swift_allocError();
      v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *MEMORY[0x1E0DEC458], v6);
      return (_QWORD *)swift_willThrow();
    }
    v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2)
        goto LABEL_16;
      if (*(_BYTE *)(result[3] + v4) == 14)
      {
        result[6] = v3 + 1;
        return result;
      }
      v13 = dispatch thunk of CustomStringConvertible.description.getter();
      v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEB070], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;

  v1 = result[4];
  v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    v3 = result[6];
    if (v3 >= v2 - v1)
    {
      v6 = type metadata accessor for DecodingError();
      swift_allocError();
      v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *MEMORY[0x1E0DEC458], v6);
      return (_QWORD *)swift_willThrow();
    }
    v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2)
        goto LABEL_16;
      if (*(_BYTE *)(result[3] + v4) == 13)
      {
        result[6] = v3 + 1;
        return result;
      }
      v13 = dispatch thunk of CustomStringConvertible.description.getter();
      v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x1E0DEB188], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

_QWORD *_XPCKeyedDecodingContainer.__allocating_init(codingMetadata:initialStorage:)(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return _XPCKeyedDecodingContainer.__allocating_init(codingMetadata:buffer:)(a1, a2, a3);
}

uint64_t specialized Dictionary.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return specialized Dictionary.subscript.setter(a1, a2, a3, (void (*)(void))outlined init with take of Encodable, (void (*)(_BYTE *, uint64_t, uint64_t, uint64_t))specialized _NativeDictionary.setValue(_:forKey:isUnique:), &demangling cache variable for type metadata for EncodingContainer?, &demangling cache variable for type metadata for _DictionaryStorage<String, EncodingContainer>);
}

uint64_t specialized Dictionary.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), void (*a5)(_BYTE *, uint64_t, uint64_t, uint64_t), uint64_t *a6, uint64_t *a7)
{
  uint64_t *v7;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  _BYTE v17[40];

  if (*(_QWORD *)(a1 + 24))
  {
    a4();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v16 = *v7;
    *v7 = 0x8000000000000000;
    a5(v17, a2, a3, isUniquelyReferenced_nonNull_native);
    *v7 = v16;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    outlined destroy of DecodingContainer?(a1, a6);
    specialized Dictionary._Variant.removeValue(forKey:)(a2, a3, (void (*)(_BYTE *, uint64_t))a4, a7, (uint64_t)v17);
    swift_bridgeObjectRelease();
    return outlined destroy of DecodingContainer?((uint64_t)v17, a6);
  }
}

uint64_t KeyedDecodingStorage.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for KeyedDecodingStorage()
{
  return objc_opt_self();
}

uint64_t type metadata completion function for _XPCKeyedDecodingContainer()
{
  return swift_initClassMetadata2();
}

uint64_t static _XPCKeyedDecodingContainer.wireType.getter()
{
  return 16;
}

_QWORD *_XPCKeyedDecodingContainer.__allocating_init(codingMetadata:storage:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;

  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  result[5] = 0;
  return result;
}

_QWORD *_XPCKeyedDecodingContainer.init(codingMetadata:storage:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  v3[5] = 0;
  return v3;
}

_QWORD *_XPCKeyedDecodingContainer.__allocating_init(codingMetadata:buffer:)(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *result;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *inited;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char isUniquelyReferenced_nonNull_native;
  char v40;
  unint64_t v41;
  uint64_t v42;
  _BOOL8 v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  _QWORD *v49;
  uint64_t v50;
  BOOL v51;
  uint64_t v52;
  uint64_t v53;
  Swift::String v54;
  Swift::String v55;
  Swift::String v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  Swift::String v60;
  uint64_t v61;
  unint64_t v62;
  _QWORD *v63;
  __int128 v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;

  static DecodingContainer.decodeType(from:withCodingMetadata:)(a3, a1, a2, v3, (uint64_t)&protocol witness table for _XPCKeyedDecodingContainer<A>);
  if (v4)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (_QWORD *)swift_release();
  }
  v68 = (unint64_t)specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
  v8 = specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
  v65 = a2;
  v9 = DecodingBuffer.consume(_:)((uint64_t)v8);
  if (!v9)
  {
    _StringGuts.grow(_:)(51);
    v54._countAndFlagsBits = 0xD00000000000002BLL;
    v54._object = (void *)0x80000001DF04EE80;
    String.append(_:)(v54);
    v55._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v55);
    swift_bridgeObjectRelease();
    v56._countAndFlagsBits = 0x736574796220;
    v56._object = (void *)0xE600000000000000;
    String.append(_:)(v56);
    v57 = type metadata accessor for DecodingError();
    swift_allocError();
    v59 = v58;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(31);
    swift_bridgeObjectRelease();
    v60._countAndFlagsBits = 0;
    v60._object = (void *)0xE000000000000000;
    String.append(_:)(v60);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v57 - 8) + 104))(v59, *MEMORY[0x1E0DEC458], v57);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_willThrow();
    return (_QWORD *)swift_release();
  }
  v13 = v9;
  v14 = v10;
  v15 = v12;
  v16 = v11;
  type metadata accessor for DecodingBuffer();
  inited = (_QWORD *)swift_initStackObject();
  inited[2] = v13;
  inited[3] = v14;
  v18 = inited;
  inited[4] = v16;
  inited[5] = v15;
  inited[6] = 0;
  v19 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E0DEE9D8]);
  v20 = v68;
  if ((v68 & 0x8000000000000000) != 0)
    goto LABEL_53;
  v21 = (_QWORD *)v19;
  v22 = v65;
  if (!v68)
  {
LABEL_39:
    type metadata accessor for KeyedDecodingStorage();
    v61 = swift_allocObject();
    v62 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E0DEE9D8]);
    *(_QWORD *)(v61 + 16) = v21;
    *(_QWORD *)(v61 + 24) = v62;
    swift_release();
    swift_release();
    result = (_QWORD *)swift_allocObject();
    result[2] = a1;
    result[3] = v22;
    result[4] = v61;
    result[5] = 0;
    return result;
  }
  v63 = v18;
  while (v20)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v23 = (_QWORD *)swift_retain();
    specialized static DecodingContainer.decodeType(from:withCodingMetadata:)(v23);
    v66 = specialized static String.decodeValue(from:withCodingMetadata:)();
    v25 = v24;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    v26 = (unint64_t)specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
    if ((v26 & 0x8000000000000000) != 0)
      goto LABEL_41;
    v67 = v25;
    v27 = v18[6];
    v28 = (char *)(v27 + v26);
    if (__OFADD__(v27, v26))
      goto LABEL_42;
    v29 = v18[4];
    v30 = v18[5];
    v31 = v30 >> 1;
    if (__OFSUB__(v30 >> 1, v29))
      goto LABEL_43;
    v69 = v20;
    if ((uint64_t)((v30 >> 1) - v29) >= (uint64_t)v28)
    {
      v35 = v29 + v27;
      if (__OFADD__(v29, v27))
        goto LABEL_44;
      v36 = v35 + v26;
      if (__OFADD__(v35, v26))
        goto LABEL_45;
      if (v36 < v35)
        goto LABEL_46;
      if (v31 < v35)
        goto LABEL_47;
      if (v35 < v29)
        goto LABEL_48;
      if (v31 < v36)
        goto LABEL_49;
      if (v36 < 0)
        goto LABEL_50;
      v64 = *((_OWORD *)v18 + 1);
      v37 = v18[5] & 1 | (2 * v36);
      v18[6] = v28;
      v38 = swift_allocObject();
      *(_OWORD *)(v38 + 16) = v64;
      *(_QWORD *)(v38 + 32) = v35;
      *(_QWORD *)(v38 + 40) = v37;
      *(_QWORD *)(v38 + 48) = 0;
      swift_unknownObjectRetain();
      swift_retain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v41 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v66, v67);
      v42 = v21[2];
      v43 = (v40 & 1) == 0;
      v44 = v42 + v43;
      if (__OFADD__(v42, v43))
        goto LABEL_51;
      v45 = v40;
      if (v21[3] >= v44)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          specialized _NativeDictionary.copy()();
        v46 = v67;
        if ((v45 & 1) != 0)
          goto LABEL_35;
      }
      else
      {
        specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v44, isUniquelyReferenced_nonNull_native);
        v46 = v67;
        v47 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v66, v67);
        if ((v45 & 1) != (v48 & 1))
          goto LABEL_54;
        v41 = v47;
        if ((v45 & 1) != 0)
        {
LABEL_35:
          v53 = v21[7];
          swift_release();
          *(_QWORD *)(v53 + 8 * v41) = v38;
          goto LABEL_36;
        }
      }
      v21[(v41 >> 6) + 8] |= 1 << v41;
      v49 = (_QWORD *)(v21[6] + 16 * v41);
      *v49 = v66;
      v49[1] = v46;
      *(_QWORD *)(v21[7] + 8 * v41) = v38;
      v50 = v21[2];
      v51 = __OFADD__(v50, 1);
      v52 = v50 + 1;
      if (v51)
        goto LABEL_52;
      v21[2] = v52;
      swift_bridgeObjectRetain();
LABEL_36:
      v22 = v65;
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v18 = v63;
      v20 = v69 - 1;
      if (v69 == 1)
        goto LABEL_39;
    }
    else
    {
      swift_bridgeObjectRetain();
      v32 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v66, v67);
      v34 = v33;
      swift_bridgeObjectRelease();
      if ((v34 & 1) != 0)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          specialized _NativeDictionary.copy()();
        swift_bridgeObjectRelease();
        specialized _NativeDictionary._delete(at:)(v32, (uint64_t)v21);
        swift_release();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      v22 = v65;
      v20 = v69 - 1;
      if (v69 == 1)
        goto LABEL_39;
    }
  }
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
LABEL_47:
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
LABEL_53:
  __break(1u);
LABEL_54:
  result = (_QWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t _XPCKeyedDecodingContainer.allKeys.getter()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 40))
  {
    v1 = *(_QWORD *)(v0 + 40);
  }
  else
  {
    v1 = closure #1 in _XPCKeyedDecodingContainer.allKeys.getter();
    *(_QWORD *)(v0 + 40) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t closure #1 in _XPCKeyedDecodingContainer.allKeys.getter()
{
  uint64_t v0;

  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String : DecodingBuffer].Keys);
  lazy protocol witness table accessor for type [String : DecodingBuffer].Keys and conformance [A : B].Keys();
  v0 = Sequence.compactMap<A>(_:)();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t _XPCKeyedDecodingContainer.contains(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 32) + 16);
  swift_bridgeObjectRetain();
  v2 = dispatch thunk of CodingKey.stringValue.getter();
  if (*(_QWORD *)(v1 + 16) && (specialized __RawDictionaryStorage.find<A>(_:)(v2, v3), (v4 & 1) != 0))
  {
    swift_retain();
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v5;
}

uint64_t _XPCKeyedDecodingContainer.valueBuffer(forKey:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t *v11;

  v3 = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  swift_bridgeObjectRetain();
  v4 = dispatch thunk of CodingKey.stringValue.getter();
  if (*(_QWORD *)(v3 + 16) && (v6 = specialized __RawDictionaryStorage.find<A>(_:)(v4, v5), (v7 & 1) != 0))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v6);
    swift_retain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v8 = a1[3];
    v9 = a1[4];
    v10 = __swift_project_boxed_opaque_existential_1(a1, v8);
    type metadata accessor for DecodingError();
    swift_allocError();
    keyNotFoundError<A>(codingMetadata:key:)((uint64_t)v10, v8, v9, v11);
    swift_willThrow();
  }
  return v8;
}

uint64_t _XPCKeyedDecodingContainer.decodeNil(forKey:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13[3];
  __int128 v14;

  v14 = *(_OWORD *)(*(_QWORD *)v1 + 80);
  v12 = v14;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v13);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(boxed_opaque_existential_1, a1);
  v5 = (_QWORD *)_XPCKeyedDecodingContainer.valueBuffer(forKey:)(v13);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  if (v2)
    return a1 & 1;
  v7 = v5[4];
  v8 = v5[5] >> 1;
  if (__OFSUB__(v8, v7))
  {
    __break(1u);
  }
  else
  {
    v9 = v5[6];
    if (v9 >= v8 - v7)
      goto LABEL_12;
    v10 = v7 + v9;
    if (!__OFADD__(v7, v9))
    {
      if (v10 < v7 || v10 >= v8)
        goto LABEL_17;
      if (*(_BYTE *)(v5[3] + v10) == 1)
      {
        v5[6] = v9 + 1;
        LOBYTE(a1) = 1;
LABEL_13:
        swift_release();
        return a1 & 1;
      }
LABEL_12:
      LOBYTE(a1) = 0;
      goto LABEL_13;
    }
  }
  __break(1u);
LABEL_17:
  __break(1u);
  return result;
}

uint64_t _XPCKeyedDecodingContainer.decode<A>(_:forKey:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12[3];
  __int128 v13;

  v13 = *(_OWORD *)(*v3 + 80);
  v11 = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(boxed_opaque_existential_1, a1);
  v9 = _XPCKeyedDecodingContainer.valueBuffer(forKey:)(v12);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  if (!v4)
  {
    type metadata accessor for XPCDecoder();
    static XPCDecoder.decode<A>(from:withCodingMetadata:)(v9, v3[2], v3[3], a2, a3);
    return swift_release();
  }
  return result;
}

uint64_t _XPCKeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  _UNKNOWN **v43;
  uint64_t v44;

  v10 = *(_QWORD *)(*v4 + 88);
  *((_QWORD *)&v42 + 1) = *(_QWORD *)(*v4 + 80);
  v9 = *((_QWORD *)&v42 + 1);
  v43 = (_UNKNOWN **)v10;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v41);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(boxed_opaque_existential_1, a2, v9);
  v12 = _XPCKeyedDecodingContainer.valueBuffer(forKey:)(&v41);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v41);
  if (!v5)
  {
    v36 = v12;
    v37 = a3;
    v14 = CodingMetadata.appending<A>(codingKey:)(a2, v4[2], v4[3], v9, v10);
    v34 = v15;
    v35 = v14;
    v16 = v4[4];
    v17 = dispatch thunk of CodingKey.stringValue.getter();
    v19 = v18;
    swift_beginAccess();
    v20 = *(_QWORD *)(v16 + 24);
    if (*(_QWORD *)(v20 + 16))
    {
      swift_bridgeObjectRetain();
      v21 = specialized __RawDictionaryStorage.find<A>(_:)(v17, v19);
      if ((v22 & 1) != 0)
      {
        outlined init with copy of XPCCodableObjectRepresentable(*(_QWORD *)(v20 + 56) + 40 * v21, (uint64_t)&v38);
      }
      else
      {
        v40 = 0;
        v38 = 0u;
        v39 = 0u;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      v40 = 0;
      v38 = 0u;
      v39 = 0u;
    }
    swift_bridgeObjectRelease();
    v23 = *((_QWORD *)&v39 + 1);
    if (*((_QWORD *)&v39 + 1))
    {
      v24 = v40;
      v25 = __swift_project_boxed_opaque_existential_1(&v38, *((uint64_t *)&v39 + 1));
      *((_QWORD *)&v42 + 1) = v23;
      v43 = *(_UNKNOWN ***)(v24 + 8);
      v26 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v41);
      (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v26, v25, v23);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v38);
    }
    else
    {
      outlined destroy of DecodingContainer?((uint64_t)&v38, &demangling cache variable for type metadata for DecodingContainer?);
      v41 = 0u;
      v42 = 0u;
      v43 = 0;
    }
    v28 = type metadata accessor for _XPCKeyedDecodingContainer(0, v37, a4, v27);
    *(_QWORD *)&v38 = v36;
    v29 = static SharableStorageContainer.getExisting<A>(container:codingMetadata:initialStorage:)((uint64_t)&v44, (uint64_t)&v41, v35, v34, (uint64_t)&v38, v28, v28, (uint64_t)&protocol witness table for _XPCKeyedDecodingContainer<A>, (uint64_t)&protocol witness table for _XPCKeyedDecodingContainer<A>);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined destroy of DecodingContainer?((uint64_t)&v41, &demangling cache variable for type metadata for CodingContainer?);
    v30 = v44;
    if ((v29 & 1) != 0)
    {
      v31 = dispatch thunk of CodingKey.stringValue.getter();
      v33 = v32;
      *((_QWORD *)&v42 + 1) = v28;
      v43 = &protocol witness table for _XPCKeyedDecodingContainer<A>;
      *(_QWORD *)&v41 = v30;
      swift_beginAccess();
      swift_retain();
      specialized Dictionary.subscript.setter((uint64_t)&v41, v31, v33, (void (*)(void))outlined init with take of Encodable, (void (*)(_BYTE *, uint64_t, uint64_t, uint64_t))specialized _NativeDictionary.setValue(_:forKey:isUnique:), &demangling cache variable for type metadata for DecodingContainer?, &demangling cache variable for type metadata for _DictionaryStorage<String, DecodingContainer>);
      swift_endAccess();
    }
    *(_QWORD *)&v41 = v30;
    MEMORY[0x1DF0F49E8](&protocol conformance descriptor for _XPCKeyedDecodingContainer<A>, v28);
    KeyedDecodingContainer.init<A>(_:)();
    return swift_release();
  }
  return result;
}

uint64_t specialized static SharableStorageContainer.getExisting<A>(container:codingMetadata:initialStorage:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  _QWORD *v15;
  char v16;
  uint64_t result;
  _QWORD *v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  _QWORD v23[3];
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;

  outlined init with copy of CodingContainer?(a2, (uint64_t)v19);
  if (!v19[3])
  {
    outlined destroy of DecodingContainer?((uint64_t)v19, &demangling cache variable for type metadata for CodingContainer?);
    v20 = 0u;
    v21 = 0u;
    v22 = 0;
    goto LABEL_8;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingContainer);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SharableStorageContainer);
  if ((swift_dynamicCast() & 1) == 0)
  {
    v22 = 0;
    v20 = 0u;
    v21 = 0u;
LABEL_8:
    result = outlined destroy of DecodingContainer?((uint64_t)&v20, &demangling cache variable for type metadata for SharableStorageContainer?);
    if (*(_QWORD *)(a2 + 24))
      goto LABEL_13;
LABEL_9:
    type metadata accessor for _XPCUnkeyedDecodingContainer();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v18 = _XPCUnkeyedDecodingContainer.__allocating_init(codingMetadata:buffer:)(a3, a4, a5);
    if (!v5)
    {
      *a1 = v18;
      v16 = 1;
    }
    return v16 & 1;
  }
  if (!*((_QWORD *)&v21 + 1))
    goto LABEL_8;
  v26 = a1;
  outlined init with take of Encodable(&v20, (uint64_t)v23);
  v11 = v24;
  v12 = v25;
  __swift_project_boxed_opaque_existential_1(v23, v24);
  v13 = *(void (**)(uint64_t, uint64_t))(v12 + 24);
  *((_QWORD *)&v21 + 1) = swift_getAssociatedTypeWitness();
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v20);
  v13(v11, v12);
  type metadata accessor for _XPCUnkeyedDecodingContainer.UnkeyedDecodingStorage();
  if (swift_dynamicCast())
  {
    v14 = v19[0];
    type metadata accessor for _XPCUnkeyedDecodingContainer();
    v15 = (_QWORD *)swift_allocObject();
    v15[2] = a3;
    v15[3] = a4;
    v15[4] = v14;
    *v26 = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    v16 = 0;
    return v16 & 1;
  }
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  a1 = v26;
  if (!*(_QWORD *)(a2 + 24))
    goto LABEL_9;
LABEL_13:
  __break(1u);
  return result;
}

uint64_t specialized static SharableStorageContainer.getExisting<A>(container:codingMetadata:initialStorage:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t result;
  _QWORD *v16;
  void (*v17)(uint64_t, uint64_t);
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  outlined init with copy of CodingContainer?(a2, (uint64_t)v18);
  if (v18[3])
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingContainer);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SharableStorageContainer);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*((_QWORD *)&v20 + 1))
      {
        v25 = v5;
        outlined init with take of Encodable(&v19, (uint64_t)v22);
        v12 = v23;
        v11 = v24;
        __swift_project_boxed_opaque_existential_1(v22, v23);
        v17 = *(void (**)(uint64_t, uint64_t))(v11 + 24);
        *((_QWORD *)&v20 + 1) = swift_getAssociatedTypeWitness();
        __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v19);
        v17(v12, v11);
        if (swift_dynamicCast())
        {
          v13 = v18[0];
          type metadata accessor for _XPCUnkeyedEncodingContainer();
          v14 = (_QWORD *)swift_allocObject();
          v14[2] = a3;
          v14[3] = a4;
          v14[4] = v13;
          *a1 = v14;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
          return 0;
        }
        result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
        if (*(_QWORD *)(a2 + 24))
          goto LABEL_11;
LABEL_9:
        type metadata accessor for _XPCUnkeyedEncodingContainer();
        v16 = (_QWORD *)swift_allocObject();
        v16[2] = a3;
        v16[3] = a4;
        v16[4] = a5;
        *a1 = v16;
        swift_retain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        return 1;
      }
    }
    else
    {
      v21 = 0;
      v19 = 0u;
      v20 = 0u;
    }
  }
  else
  {
    outlined destroy of DecodingContainer?((uint64_t)v18, &demangling cache variable for type metadata for CodingContainer?);
    v19 = 0u;
    v20 = 0u;
    v21 = 0;
  }
  result = outlined destroy of DecodingContainer?((uint64_t)&v19, &demangling cache variable for type metadata for SharableStorageContainer?);
  if (!*(_QWORD *)(a2 + 24))
    goto LABEL_9;
LABEL_11:
  __break(1u);
  return result;
}

uint64_t _XPCKeyedDecodingContainer.nestedUnkeyedContainer(forKey:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  _UNKNOWN **v37;
  uint64_t v38;

  v7 = *(_QWORD *)(*v2 + 88);
  *((_QWORD *)&v36 + 1) = *(_QWORD *)(*v2 + 80);
  v6 = *((_QWORD *)&v36 + 1);
  v37 = (_UNKNOWN **)v7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v35);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(boxed_opaque_existential_1, a1, v6);
  v9 = _XPCKeyedDecodingContainer.valueBuffer(forKey:)(&v35);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v35);
  if (!v3)
  {
    v31 = (_QWORD *)v9;
    v29 = a2;
    v30 = CodingMetadata.appending<A>(codingKey:)(a1, v2[2], v2[3], v6, v7);
    v12 = v11;
    v13 = v2[4];
    v14 = dispatch thunk of CodingKey.stringValue.getter();
    v16 = v15;
    swift_beginAccess();
    v17 = *(_QWORD *)(v13 + 24);
    if (*(_QWORD *)(v17 + 16))
    {
      swift_bridgeObjectRetain();
      v18 = specialized __RawDictionaryStorage.find<A>(_:)(v14, v16);
      if ((v19 & 1) != 0)
      {
        outlined init with copy of XPCCodableObjectRepresentable(*(_QWORD *)(v17 + 56) + 40 * v18, (uint64_t)&v32);
      }
      else
      {
        v34 = 0;
        v32 = 0u;
        v33 = 0u;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      v34 = 0;
      v32 = 0u;
      v33 = 0u;
    }
    swift_bridgeObjectRelease();
    v20 = *((_QWORD *)&v33 + 1);
    if (*((_QWORD *)&v33 + 1))
    {
      v21 = v34;
      v22 = __swift_project_boxed_opaque_existential_1(&v32, *((uint64_t *)&v33 + 1));
      *((_QWORD *)&v36 + 1) = v20;
      v37 = *(_UNKNOWN ***)(v21 + 8);
      v23 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v35);
      (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v23, v22, v20);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v32);
    }
    else
    {
      outlined destroy of DecodingContainer?((uint64_t)&v32, &demangling cache variable for type metadata for DecodingContainer?);
      v35 = 0u;
      v36 = 0u;
      v37 = 0;
    }
    v24 = specialized static SharableStorageContainer.getExisting<A>(container:codingMetadata:initialStorage:)(&v38, (uint64_t)&v35, v30, v12, v31);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined destroy of DecodingContainer?((uint64_t)&v35, &demangling cache variable for type metadata for CodingContainer?);
    v25 = v38;
    if ((v24 & 1) != 0)
    {
      v26 = dispatch thunk of CodingKey.stringValue.getter();
      v28 = v27;
      *((_QWORD *)&v36 + 1) = type metadata accessor for _XPCUnkeyedDecodingContainer();
      v37 = &protocol witness table for _XPCUnkeyedDecodingContainer;
      *(_QWORD *)&v35 = v25;
      swift_beginAccess();
      swift_retain();
      specialized Dictionary.subscript.setter((uint64_t)&v35, v26, v28, (void (*)(void))outlined init with take of Encodable, (void (*)(_BYTE *, uint64_t, uint64_t, uint64_t))specialized _NativeDictionary.setValue(_:forKey:isUnique:), &demangling cache variable for type metadata for DecodingContainer?, &demangling cache variable for type metadata for _DictionaryStorage<String, DecodingContainer>);
      swift_endAccess();
    }
    v29[3] = type metadata accessor for _XPCUnkeyedDecodingContainer();
    v29[4] = _s3XPC11_XPCDecoderCACs7DecoderAAWlTm_0(&lazy protocol witness table cache variable for type _XPCUnkeyedDecodingContainer and conformance _XPCUnkeyedDecodingContainer, (uint64_t (*)(uint64_t))type metadata accessor for _XPCUnkeyedDecodingContainer, (uint64_t)&protocol conformance descriptor for _XPCUnkeyedDecodingContainer);
    result = swift_release();
    *v29 = v25;
  }
  return result;
}

uint64_t _XPCKeyedDecodingContainer.superDecoder()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v4[5];

  static SuperCoderKey.defaultKey<A>(_:)(*(_QWORD *)(*(_QWORD *)v1 + 80), *(_QWORD *)(*(_QWORD *)v1 + 88), v4);
  _XPCKeyedDecodingContainer._superDecoder(forKey:)(v4, a1);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
}

uint64_t _XPCKeyedDecodingContainer._superDecoder(forKey:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  result = _XPCKeyedDecodingContainer.valueBuffer(forKey:)(a1);
  if (!v3)
  {
    v7 = result;
    v8 = a1[3];
    v9 = a1[4];
    v10 = __swift_project_boxed_opaque_existential_1(a1, v8);
    v11 = CodingMetadata.appending<A>(codingKey:)((uint64_t)v10, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), v8, v9);
    v13 = v12;
    v14 = type metadata accessor for _XPCDecoder();
    v15 = swift_allocObject();
    *(_OWORD *)(v15 + 40) = 0u;
    *(_OWORD *)(v15 + 56) = 0u;
    *(_QWORD *)(v15 + 72) = 0;
    *(_QWORD *)(v15 + 24) = v13;
    *(_QWORD *)(v15 + 32) = v7;
    *(_QWORD *)(v15 + 16) = v11;
    a2[3] = v14;
    result = _s3XPC11_XPCDecoderCACs7DecoderAAWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
    a2[4] = result;
    *a2 = v15;
  }
  return result;
}

uint64_t _XPCKeyedDecodingContainer.superDecoder(forKey:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v7;
  uint64_t v8[3];
  __int128 v9;

  v9 = *(_OWORD *)(*(_QWORD *)v2 + 80);
  v7 = v9;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v8);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(boxed_opaque_existential_1, a1);
  _XPCKeyedDecodingContainer._superDecoder(forKey:)(v8, a2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t _XPCKeyedDecodingContainer.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t _XPCKeyedDecodingContainer.__deallocating_deinit()
{
  _XPCKeyedDecodingContainer.deinit();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for _XPCKeyedDecodingContainer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _XPCKeyedDecodingContainer);
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.codingPath.getter in conformance _XPCKeyedDecodingContainer<A>(uint64_t a1)
{
  return CodingContainerWithMetadata.codingPath.getter(a1, (uint64_t)&protocol witness table for _XPCKeyedDecodingContainer<A>);
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.allKeys.getter in conformance _XPCKeyedDecodingContainer<A>()
{
  return _XPCKeyedDecodingContainer.allKeys.getter();
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.contains(_:) in conformance _XPCKeyedDecodingContainer<A>()
{
  return _XPCKeyedDecodingContainer.contains(_:)() & 1;
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decodeNil(forKey:) in conformance _XPCKeyedDecodingContainer<A>(uint64_t a1)
{
  return _XPCKeyedDecodingContainer.decodeNil(forKey:)(a1) & 1;
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(uint64_t a1)
{
  uint64_t v1;
  char v2;
  char v4;

  _XPCKeyedDecodingContainer.decode<A>(_:forKey:)(a1, MEMORY[0x1E0DEAFA0], (uint64_t)&v4);
  if (!v1)
    v2 = v4;
  return v2 & 1;
}

{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  result = _XPCKeyedDecodingContainer.decode<A>(_:forKey:)(a1, MEMORY[0x1E0DEA968], (uint64_t)&v3);
  if (!v1)
    return v3;
  return result;
}

double protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(uint64_t a1)
{
  uint64_t v1;
  double result;
  double v3;

  _XPCKeyedDecodingContainer.decode<A>(_:forKey:)(a1, MEMORY[0x1E0DEB070], (uint64_t)&v3);
  if (!v1)
    return v3;
  return result;
}

float protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(uint64_t a1)
{
  uint64_t v1;
  float result;
  float v3;

  _XPCKeyedDecodingContainer.decode<A>(_:forKey:)(a1, MEMORY[0x1E0DEB188], (uint64_t)&v3);
  if (!v1)
    return v3;
  return result;
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x1E0DEB418]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x1E0DEDA70]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x1E0DEDB58]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x1E0DEDBC8]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x1E0DEDC60]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x1E0DEBB98]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x1E0DEDE70]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x1E0DEE068]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x1E0DEE0F8]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x1E0DEE190]);
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>()
{
  return KeyedDecodingContainerProtocol.decode(_:forKey:)();
}

{
  return KeyedDecodingContainerProtocol.decode(_:forKey:)();
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t result;
  unsigned __int8 v6;

  result = _XPCKeyedDecodingContainer.decode<A>(_:forKey:)(a1, a4, (uint64_t)&v6);
  if (!v4)
    return v6;
  return result;
}

{
  uint64_t v4;
  uint64_t result;
  unsigned __int16 v6;

  result = _XPCKeyedDecodingContainer.decode<A>(_:forKey:)(a1, a4, (uint64_t)&v6);
  if (!v4)
    return v6;
  return result;
}

{
  uint64_t v4;
  uint64_t result;
  unsigned int v6;

  result = _XPCKeyedDecodingContainer.decode<A>(_:forKey:)(a1, a4, (uint64_t)&v6);
  if (!v4)
    return v6;
  return result;
}

{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  result = _XPCKeyedDecodingContainer.decode<A>(_:forKey:)(a1, a4, (uint64_t)&v6);
  if (!v4)
    return v6;
  return result;
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decode<A>(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return _XPCKeyedDecodingContainer.decode<A>(_:forKey:)(a1, a2, a3);
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>()
{
  return KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
  if (v0)
    return v2;
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
  if (v0)
    return v2;
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
  if (v0)
    return v2;
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
  if (v0)
    return v2;
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
  if (v0)
    return v2;
  return result;
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x1E0DED7E8]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x1E0DED808]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x1E0DED810]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x1E0DED818]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x1E0DED830]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x1E0DED828]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x1E0DED838]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x1E0DED840]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x1E0DED850]);
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FF;
}

{
  return a4() & 0x1FFFF;
}

{
  unint64_t v4;

  v4 = a4();
  return v4 | ((HIDWORD(v4) & 1) << 32);
}

{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  result = a4();
  if (v4)
    return v6;
  return result;
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent<A>(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>()
{
  return KeyedDecodingContainerProtocol.decodeIfPresent<A>(_:forKey:)();
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.nestedContainer<A>(keyedBy:forKey:) in conformance _XPCKeyedDecodingContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _XPCKeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(a1, a2, a3, a4);
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.nestedUnkeyedContainer(forKey:) in conformance _XPCKeyedDecodingContainer<A>@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return _XPCKeyedDecodingContainer.nestedUnkeyedContainer(forKey:)(a1, a2);
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.superDecoder() in conformance _XPCKeyedDecodingContainer<A>@<X0>(uint64_t *a1@<X8>)
{
  return _XPCKeyedDecodingContainer.superDecoder()(a1);
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.superDecoder(forKey:) in conformance _XPCKeyedDecodingContainer<A>@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return _XPCKeyedDecodingContainer.superDecoder(forKey:)(a1, a2);
}

_QWORD *protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance _XPCKeyedDecodingContainer<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  _QWORD *result;

  result = _XPCKeyedDecodingContainer.__allocating_init(codingMetadata:buffer:)(a1, a2, a3);
  if (!v4)
    *a4 = result;
  return result;
}

_QWORD *protocol witness for SharableStorageContainer.init(codingMetadata:storage:) in conformance _XPCKeyedDecodingContainer<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  _QWORD *result;

  result = _XPCKeyedDecodingContainer.__allocating_init(codingMetadata:storage:)(a1, a2, *a3);
  *a4 = result;
  return result;
}

_QWORD *protocol witness for SharableStorageContainer.init(codingMetadata:initialStorage:) in conformance _XPCKeyedDecodingContainer<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD **a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  _QWORD *result;

  result = _XPCKeyedDecodingContainer.__allocating_init(codingMetadata:initialStorage:)(a1, a2, *a3);
  if (!v4)
    *a4 = result;
  return result;
}

uint64_t associated type witness table accessor for KeyedDecodingContainerProtocol.Key : CodingKey in _XPCKeyedDecodingContainer<A>(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 88);
}

double specialized Dictionary._Variant.removeValue(forKey:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(_BYTE *, uint64_t)@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t *v5;
  uint64_t *v8;
  unint64_t v12;
  char v13;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  double result;
  uint64_t v17;

  v8 = v5;
  swift_bridgeObjectRetain();
  v12 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2);
  LOBYTE(a2) = v13;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v15 = *v8;
    v17 = *v8;
    *v8 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      specialized _NativeDictionary.copy()(a4, a3);
      v15 = v17;
    }
    swift_bridgeObjectRelease();
    a3((_BYTE *)(*(_QWORD *)(v15 + 56) + 40 * v12), a5);
    specialized _NativeDictionary._delete(at:)(v12, v15);
    *v8 = v15;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)(a5 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a5 = 0u;
    *(_OWORD *)(a5 + 16) = 0u;
  }
  return result;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  char v32;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ObjectIdentifier, Bool>);
  result = static _DictionaryStorage.resize(original:capacity:move:)();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v32 = a2;
    v31 = v3;
    v8 = 0;
    v9 = (_QWORD *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v17 = v16 | (v8 << 6);
      }
      else
      {
        if (__OFADD__(v8++, 1))
          goto LABEL_38;
        if (v8 >= v13)
        {
LABEL_29:
          if ((v32 & 1) == 0)
          {
            result = swift_release();
            v3 = v31;
            goto LABEL_36;
          }
          v30 = 1 << *(_BYTE *)(v5 + 32);
          if (v30 >= 64)
            bzero((void *)(v5 + 64), ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
          else
            *v9 = -1 << v30;
          v3 = v31;
          *(_QWORD *)(v5 + 16) = 0;
          break;
        }
        v19 = v9[v8];
        if (!v19)
        {
          v20 = v8 + 1;
          if (v8 + 1 >= v13)
            goto LABEL_29;
          v19 = v9[v20];
          if (!v19)
          {
            while (1)
            {
              v8 = v20 + 1;
              if (__OFADD__(v20, 1))
                break;
              if (v8 >= v13)
                goto LABEL_29;
              v19 = v9[v8];
              ++v20;
              if (v19)
                goto LABEL_19;
            }
LABEL_37:
            __break(1u);
LABEL_38:
            __break(1u);
            return result;
          }
          ++v8;
        }
LABEL_19:
        v12 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v17);
      v22 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v17);
      result = static Hasher._hash(seed:_:)();
      v23 = -1 << *(_BYTE *)(v7 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v14 + 8 * (v24 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_37;
          }
          v28 = v25 == v27;
          if (v25 == v27)
            v25 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v14 + 8 * v25);
        }
        while (v29 == -1);
        v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(_QWORD *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v15) = v21;
      *(_BYTE *)(*(_QWORD *)(v7 + 56) + v15) = v22;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_36:
  *v3 = v7;
  return result;
}

{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, DecodingBuffer>);
  v36 = a2;
  v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    result = Hasher._finalize()();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

{
  return specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(a1, a2, &demangling cache variable for type metadata for _DictionaryStorage<String, DecodingContainer>, (void (*)(uint64_t, _BYTE *))outlined init with take of Encodable);
}

{
  return specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(a1, a2, &demangling cache variable for type metadata for _DictionaryStorage<String, EncodingContainer>, (void (*)(uint64_t, _BYTE *))outlined init with take of Encodable);
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2, uint64_t *a3, void (*a4)(uint64_t, _BYTE *))
{
  uint64_t *v4;
  uint64_t *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  _QWORD *v37;
  char v38;
  _BYTE v39[40];

  v6 = v4;
  v8 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v38 = a2;
  v9 = static _DictionaryStorage.resize(original:capacity:move:)();
  v10 = v9;
  if (*(_QWORD *)(v8 + 16))
  {
    v11 = 1 << *(_BYTE *)(v8 + 32);
    v37 = (_QWORD *)(v8 + 64);
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v13 = v12 & *(_QWORD *)(v8 + 64);
    v36 = (unint64_t)(v11 + 63) >> 6;
    v14 = v9 + 64;
    result = swift_retain();
    v16 = 0;
    while (1)
    {
      if (v13)
      {
        v19 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v20 = v19 | (v16 << 6);
      }
      else
      {
        v21 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v36)
          goto LABEL_34;
        v22 = v37[v21];
        ++v16;
        if (!v22)
        {
          v16 = v21 + 1;
          if (v21 + 1 >= v36)
            goto LABEL_34;
          v22 = v37[v16];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v36)
            {
LABEL_34:
              swift_release();
              v6 = v4;
              if ((v38 & 1) != 0)
              {
                v35 = 1 << *(_BYTE *)(v8 + 32);
                if (v35 >= 64)
                  bzero(v37, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v37 = -1 << v35;
                *(_QWORD *)(v8 + 16) = 0;
              }
              break;
            }
            v22 = v37[v23];
            if (!v22)
            {
              while (1)
              {
                v16 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v16 >= v36)
                  goto LABEL_34;
                v22 = v37[v16];
                ++v23;
                if (v22)
                  goto LABEL_21;
              }
            }
            v16 = v23;
          }
        }
LABEL_21:
        v13 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v16 << 6);
      }
      v24 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 16 * v20);
      v26 = *v24;
      v25 = v24[1];
      v27 = *(_QWORD *)(v8 + 56) + 40 * v20;
      if ((v38 & 1) != 0)
      {
        a4(v27, v39);
      }
      else
      {
        outlined init with copy of XPCCodableObjectRepresentable(v27, (uint64_t)v39);
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      result = Hasher._finalize()();
      v28 = -1 << *(_BYTE *)(v10 + 32);
      v29 = result & ~v28;
      v30 = v29 >> 6;
      if (((-1 << v29) & ~*(_QWORD *)(v14 + 8 * (v29 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v14 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v31 = 0;
        v32 = (unint64_t)(63 - v28) >> 6;
        do
        {
          if (++v30 == v32 && (v31 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v33 = v30 == v32;
          if (v30 == v32)
            v30 = 0;
          v31 |= v33;
          v34 = *(_QWORD *)(v14 + 8 * v30);
        }
        while (v34 == -1);
        v17 = __clz(__rbit64(~v34)) + (v30 << 6);
      }
      *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v17);
      *v18 = v26;
      v18[1] = v25;
      result = ((uint64_t (*)(_BYTE *, unint64_t))a4)(v39, *(_QWORD *)(v10 + 56) + 40 * v17);
      ++*(_QWORD *)(v10 + 16);
    }
  }
  result = swift_release();
  *v6 = v10;
  return result;
}

unint64_t specialized _NativeDictionary._delete(at:)(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  Swift::Int v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        v9 = Hasher._finalize()();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  Swift::Int v11;
  unint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  unint64_t v17;
  __int128 *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        v11 = Hasher._finalize()();
        result = swift_bridgeObjectRelease();
        v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8)
            goto LABEL_5;
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          v13 = *(_QWORD *)(a2 + 48);
          v14 = (_OWORD *)(v13 + 16 * v3);
          v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1)
            *v14 = *v15;
          v16 = *(_QWORD *)(a2 + 56);
          v17 = v16 + 40 * v3;
          v18 = (__int128 *)(v16 + 40 * v6);
          if (v3 != v6 || (v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            v9 = *v18;
            v10 = v18[1];
            *(_QWORD *)(v17 + 32) = *((_QWORD *)v18 + 4);
            *(_OWORD *)v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t specialized _NativeDictionary._insert(at:key:value:)(unint64_t result, uint64_t a2, char a3, _QWORD *a4)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  a4[(result >> 6) + 8] |= 1 << result;
  *(_QWORD *)(a4[6] + 8 * result) = a2;
  *(_BYTE *)(a4[7] + result) = a3;
  v4 = a4[2];
  v5 = __OFADD__(v4, 1);
  v6 = v4 + 1;
  if (v5)
    __break(1u);
  else
    a4[2] = v6;
  return result;
}

uint64_t specialized _NativeDictionary._insert(at:key:value:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  return specialized _NativeDictionary._insert(at:key:value:)(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t))outlined init with take of Encodable);
}

uint64_t specialized _NativeDictionary._insert(at:key:value:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t (*a6)(uint64_t, uint64_t))
{
  _QWORD *v7;
  uint64_t result;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v7 = (_QWORD *)(a5[6] + 16 * a1);
  *v7 = a2;
  v7[1] = a3;
  result = a6(a4, a5[7] + 40 * a1);
  v9 = a5[2];
  v10 = __OFADD__(v9, 1);
  v11 = v9 + 1;
  if (v10)
    __break(1u);
  else
    a5[2] = v11;
  return result;
}

void *specialized _NativeDictionary.copy()()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  unint64_t v18;
  int64_t v19;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ObjectIdentifier, Bool>);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    if (!v18)
      break;
LABEL_23:
    v12 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    v16 = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = v16;
  }
  v19 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, DecodingBuffer>);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_retain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

{
  return specialized _NativeDictionary.copy()(&demangling cache variable for type metadata for _DictionaryStorage<String, DecodingContainer>, (void (*)(_BYTE *, uint64_t))outlined init with take of Encodable);
}

{
  return specialized _NativeDictionary.copy()(&demangling cache variable for type metadata for _DictionaryStorage<String, EncodingContainer>, (void (*)(_BYTE *, uint64_t))outlined init with take of Encodable);
}

void *specialized _NativeDictionary.copy()(uint64_t *a1, void (*a2)(_BYTE *, uint64_t))
{
  uint64_t *v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t *v27;
  uint64_t v28;
  _BYTE v29[40];

  v4 = v2;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v5 = *v2;
  v6 = static _DictionaryStorage.copy(original:)();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v4 = v7;
    return result;
  }
  v27 = v4;
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v28 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v24 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v24 >= v15)
      goto LABEL_26;
    v25 = *(_QWORD *)(v28 + 8 * v24);
    ++v11;
    if (!v25)
    {
      v11 = v24 + 1;
      if (v24 + 1 >= v15)
        goto LABEL_26;
      v25 = *(_QWORD *)(v28 + 8 * v11);
      if (!v25)
        break;
    }
LABEL_25:
    v14 = (v25 - 1) & v25;
    v17 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v20 = *v19;
    v21 = v19[1];
    v22 = 40 * v17;
    outlined init with copy of XPCCodableObjectRepresentable(*(_QWORD *)(v5 + 56) + 40 * v17, (uint64_t)v29);
    v23 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v23 = v20;
    v23[1] = v21;
    a2(v29, *(_QWORD *)(v7 + 56) + v22);
    result = (void *)swift_bridgeObjectRetain();
  }
  v26 = v24 + 2;
  if (v26 >= v15)
  {
LABEL_26:
    result = (void *)swift_release();
    v4 = v27;
    goto LABEL_28;
  }
  v25 = *(_QWORD *)(v28 + 8 * v26);
  if (v25)
  {
    v11 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v11 >= v15)
      goto LABEL_26;
    v25 = *(_QWORD *)(v28 + 8 * v11);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

_QWORD *specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)()
{
  return specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
}

{
  return specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
}

{
  return specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
}

{
  return specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
}

{
  return specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
}

{
  return specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
}

{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  if (DecodingBuffer.consume(_:)(4))
  {
    if (v2 >> 1 != v1)
    {
      LODWORD(v3) = 0;
      v4 = v2 >> 1;
      while (!__OFSUB__(v4--, 1))
      {
        if (v4 < v1 || v4 >= (uint64_t)(v2 >> 1))
          goto LABEL_12;
        v3 = (_QWORD *)(*(unsigned __int8 *)(v0 + v4) | ((_DWORD)v3 << 8));
        if (v4 == v1)
        {
          swift_unknownObjectRelease();
          return v3;
        }
      }
      __break(1u);
LABEL_12:
      __break(1u);
    }
    swift_unknownObjectRelease();
    return 0;
  }
  else
  {
    v6 = type metadata accessor for DecodingError();
    swift_allocError();
    v8 = v7;
    v10[0] = 0;
    v10[1] = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v3 = v10;
    _StringGuts.grow(_:)(31);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *MEMORY[0x1E0DEC458], v6);
    swift_willThrow();
  }
  return v3;
}

{
  return specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
}

{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  if (DecodingBuffer.consume(_:)(8))
  {
    if (v2 >> 1 != v1)
    {
      v3 = 0;
      v4 = v2 >> 1;
      while (!__OFSUB__(v4--, 1))
      {
        if (v4 < v1 || v4 >= (uint64_t)(v2 >> 1))
          goto LABEL_12;
        v3 = (_QWORD *)(*(unsigned __int8 *)(v0 + v4) | ((_QWORD)v3 << 8));
        if (v4 == v1)
        {
          swift_unknownObjectRelease();
          return v3;
        }
      }
      __break(1u);
LABEL_12:
      __break(1u);
    }
    swift_unknownObjectRelease();
    return 0;
  }
  else
  {
    v6 = type metadata accessor for DecodingError();
    swift_allocError();
    v8 = v7;
    v10[0] = 0;
    v10[1] = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v3 = v10;
    _StringGuts.grow(_:)(31);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *MEMORY[0x1E0DEC458], v6);
    swift_willThrow();
  }
  return v3;
}

{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  if (DecodingBuffer.consume(_:)(1))
  {
    if (v2 >> 1 != v1)
    {
      v3 = v2 >> 1;
      while (!__OFSUB__(v3--, 1))
      {
        if (v3 < v1 || v3 >= (uint64_t)(v2 >> 1))
          goto LABEL_12;
        if (v3 == v1)
        {
          v5 = (_QWORD *)*(unsigned __int8 *)(v0 + v1);
          swift_unknownObjectRelease();
          return v5;
        }
      }
      __break(1u);
LABEL_12:
      __break(1u);
    }
    swift_unknownObjectRelease();
    return 0;
  }
  else
  {
    v6 = type metadata accessor for DecodingError();
    swift_allocError();
    v8 = v7;
    v10[0] = 0;
    v10[1] = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v5 = v10;
    _StringGuts.grow(_:)(31);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *MEMORY[0x1E0DEC458], v6);
    swift_willThrow();
  }
  return v5;
}

{
  return specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
}

{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  if (DecodingBuffer.consume(_:)(2))
  {
    if (v2 >> 1 != v1)
    {
      LODWORD(v3) = 0;
      v4 = v2 >> 1;
      while (!__OFSUB__(v4--, 1))
      {
        if (v4 < v1 || v4 >= (uint64_t)(v2 >> 1))
          goto LABEL_12;
        v3 = (_QWORD *)(*(unsigned __int8 *)(v0 + v4) | ((_DWORD)v3 << 8));
        if (v4 == v1)
        {
          swift_unknownObjectRelease();
          return v3;
        }
      }
      __break(1u);
LABEL_12:
      __break(1u);
    }
    swift_unknownObjectRelease();
    return 0;
  }
  else
  {
    v6 = type metadata accessor for DecodingError();
    swift_allocError();
    v8 = v7;
    v10[0] = 0;
    v10[1] = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v3 = v10;
    _StringGuts.grow(_:)(31);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *MEMORY[0x1E0DEC458], v6);
    swift_willThrow();
  }
  return v3;
}

uint64_t _s3XPC11_XPCDecoderCACs7DecoderAAWlTm_0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1DF0F49E8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined init with copy of CodingContainer?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingContainer?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in closure #1 in _XPCKeyedDecodingContainer.allKeys.getter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  v4 = *a1;
  v5 = a1[1];
  swift_bridgeObjectRetain();
  return MEMORY[0x1DF0F46A0](v4, v5, v2, v3);
}

uint64_t outlined destroy of DecodingContainer?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1DF0F49AC](a1, v6, a5);
}

uint64_t CodingContainerWithMetadata.codingPath.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = (*(uint64_t (**)(void))(a2 + 8))();
  swift_bridgeObjectRelease();
  return v2;
}

_QWORD *DecodingBuffer.__allocating_init(bytes:index:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;

  v4 = a1 + 32;
  v5 = (2 * *(_QWORD *)(a1 + 16)) | 1;
  type metadata accessor for DecodingBuffer();
  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = v4;
  result[4] = 0;
  result[5] = v5;
  result[6] = a2;
  return result;
}

uint64_t type metadata accessor for DecodingBuffer()
{
  return objc_opt_self();
}

uint64_t DecodingBuffer.nextByte.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t result;

  v1 = v0[4];
  v2 = v0[5] >> 1;
  v3 = v2 - v1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v4 = v0[6];
  if (v4 >= v3)
  {
    v5 = 0;
    return v5 | ((v4 >= v3) << 8);
  }
  v6 = v1 + v4;
  if (__OFADD__(v1, v4))
    goto LABEL_13;
  if (v6 >= v1 && v6 < v2)
  {
    v5 = *(unsigned __int8 *)(v0[3] + v6);
    return v5 | ((v4 >= v3) << 8);
  }
LABEL_14:
  __break(1u);
  return result;
}

Swift::UInt8_optional __swiftcall DecodingBuffer.consume()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  Swift::UInt8_optional v8;

  v1 = v0[4];
  v2 = v0[5] >> 1;
  v3 = v2 - v1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
    goto LABEL_13;
  }
  v4 = v0[6];
  if (v4 < v3)
  {
    v6 = v1 + v4;
    if (!__OFADD__(v1, v4))
    {
      if (v6 >= v1 && v6 < v2)
      {
        v5 = *(unsigned __int8 *)(v0[3] + v6);
        v0[6] = v4 + 1;
        return (Swift::UInt8_optional)(v5 | ((v4 >= v3) << 8));
      }
LABEL_14:
      __break(1u);
      return v8;
    }
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v5 = 0;
  return (Swift::UInt8_optional)(v5 | ((v4 >= v3) << 8));
}

uint64_t DecodingBuffer.consume(_:)(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  v2 = v1[6];
  v3 = v2 + result;
  if (__OFADD__(v2, result))
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v4 = v1[4];
  v5 = v1[5];
  v6 = v5 >> 1;
  if (__OFSUB__(v5 >> 1, v4))
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if ((uint64_t)((v5 >> 1) - v4) < v3)
    return 0;
  v7 = v4 + v2;
  if (__OFADD__(v4, v2))
    goto LABEL_17;
  v8 = v7 + result;
  if (__OFADD__(v7, result))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v8 < v7)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v6 < v7)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v7 < v4)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (v6 < v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if ((v8 & 0x8000000000000000) == 0)
  {
    v1[6] = v3;
    return swift_unknownObjectRetain();
  }
LABEL_23:
  __break(1u);
  return result;
}

_QWORD *DecodingBuffer.createSubBuffer(_:)(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = (_QWORD *)DecodingBuffer.consume(_:)(a1);
  if (result)
  {
    v5 = result;
    v6 = v2;
    v7 = v3;
    v8 = v4;
    type metadata accessor for DecodingBuffer();
    result = (_QWORD *)swift_allocObject();
    result[2] = v5;
    result[3] = v6;
    result[4] = v7;
    result[5] = v8;
    result[6] = 0;
  }
  return result;
}

uint64_t DecodingBuffer.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return v0;
}

uint64_t DecodingBuffer.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t method lookup function for DecodingBuffer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DecodingBuffer.nextByte.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))() & 0x1FF;
}

uint64_t dispatch thunk of DecodingBuffer.consume()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))() & 0x1FF;
}

uint64_t dispatch thunk of DecodingBuffer.consume(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of DecodingBuffer.createSubBuffer(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t XPCRichError.canRetry.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t XPCRichError.debugDescription.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance XPCRichError()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t destroy for XPCRichError()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for XPCRichError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for XPCRichError(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for XPCRichError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCRichError(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCRichError(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCRichError()
{
  return &type metadata for XPCRichError;
}

uint64_t ClientSpecifiedHandler.init(_:)(uint64_t a1)
{
  swift_retain();
  swift_release();
  return a1;
}

uint64_t ClientSpecifiedHandler.callEventHandler(_:)(uint64_t a1, void (*a2)(uint64_t))
{
  swift_retain();
  a2(a1);
  return swift_release();
}

void __XPC_INTERNAL_CRASH__(_:file:line:)(uint64_t a1, uint64_t a2)
{
  __XPC_INTERNAL_CRASH__(_:file:line:)(a1, a2);
}

{
  String.append(_:)(*(Swift::String *)&a1);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t xpc_uuid_get_uuid(_:)(void *a1)
{
  const uint8_t *bytes;

  bytes = xpc_uuid_get_bytes(a1);
  if (bytes)
    return *(_QWORD *)bytes;
  else
    return 0;
}

xpc_object_t xpc_uuid_create_with_uuid(_:)(unsigned __int8 a1, unsigned __int8 a2, unsigned __int8 a3, unsigned __int8 a4, unsigned __int8 a5, unsigned __int8 a6, unsigned __int8 a7, unsigned __int8 a8, int a9, int a10)
{
  unsigned __int8 uuid[8];
  int v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  uuid[0] = a1;
  uuid[1] = a2;
  uuid[2] = a3;
  uuid[3] = a4;
  uuid[4] = a5;
  uuid[5] = a6;
  uuid[6] = a7;
  uuid[7] = a8;
  v12 = a9;
  v13 = a10;
  return xpc_uuid_create(uuid);
}

void __XPC_API_MISUSE__(_:file:line:)(uint64_t a1, uint64_t a2)
{
  __XPC_INTERNAL_CRASH__(_:file:line:)(a1, a2);
}

uint64_t Array<A>.byteDescription.getter(uint64_t a1)
{
  int64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  Swift::String v13;
  Swift::String v14;
  uint64_t v16;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v16 = MEMORY[0x1E0DEE9D8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
    v3 = a1 + 32;
    lazy protocol witness table accessor for type UInt8 and conformance UInt8();
    do
    {
      ++v3;
      v4 = String.init<A>(_:radix:uppercase:)();
      v6 = v5;
      v8 = *(_QWORD *)(v16 + 16);
      v7 = *(_QWORD *)(v16 + 24);
      if (v8 >= v7 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1);
      *(_QWORD *)(v16 + 16) = v8 + 1;
      v9 = v16 + 16 * v8;
      *(_QWORD *)(v9 + 32) = v4;
      *(_QWORD *)(v9 + 40) = v6;
      --v1;
    }
    while (v1);
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String]);
  lazy protocol witness table accessor for type [String] and conformance [A]();
  v10 = BidirectionalCollection<>.joined(separator:)();
  v12 = v11;
  swift_bridgeObjectRelease();
  v13._countAndFlagsBits = v10;
  v13._object = v12;
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 93;
  v14._object = (void *)0xE100000000000000;
  String.append(_:)(v14);
  return 91;
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

{
  char **v3;
  char *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type [String] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [String] and conformance [A];
  if (!lazy protocol witness table cache variable for type [String] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&demangling cache variable for type metadata for [String]);
    result = MEMORY[0x1DF0F49E8](MEMORY[0x1E0DEAF20], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A]);
  }
  return result;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  size_t v15;

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(ObjectIdentifier, Bool)>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  v15 = 16 * v8;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[v15])
      memmove(v13, v14, v15);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v15);
  }
  swift_release();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t static SuperCoderKey.defaultKey<A>(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  void (*v15)(char *, char *, uint64_t);
  uint64_t *boxed_opaque_existential_1;
  uint64_t v17;

  v6 = type metadata accessor for Optional();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v17 - v9;
  v11 = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](v8);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1DF0F46A0](0x7265707573, 0xE500000000000000, a1, a2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, a1) == 1)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    a3[3] = (uint64_t)&type metadata for SuperCoderKey;
    a3[4] = lazy protocol witness table accessor for type SuperCoderKey and conformance SuperCoderKey();
    result = swift_allocObject();
    *a3 = result;
    *(_QWORD *)(result + 16) = 0x7265707573;
    *(_QWORD *)(result + 24) = 0xE500000000000000;
    *(_QWORD *)(result + 32) = 0;
    *(_BYTE *)(result + 40) = 0;
  }
  else
  {
    v15 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v15(v13, v10, a1);
    a3[3] = a1;
    a3[4] = a2;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a3);
    return ((uint64_t (*)(uint64_t *, char *, uint64_t))v15)(boxed_opaque_existential_1, v13, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SuperCoderKey and conformance SuperCoderKey()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SuperCoderKey and conformance SuperCoderKey;
  if (!lazy protocol witness table cache variable for type SuperCoderKey and conformance SuperCoderKey)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for SuperCoderKey, &type metadata for SuperCoderKey);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SuperCoderKey and conformance SuperCoderKey);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SuperCoderKey and conformance SuperCoderKey;
  if (!lazy protocol witness table cache variable for type SuperCoderKey and conformance SuperCoderKey)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for SuperCoderKey, &type metadata for SuperCoderKey);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SuperCoderKey and conformance SuperCoderKey);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SuperCoderKey and conformance SuperCoderKey;
  if (!lazy protocol witness table cache variable for type SuperCoderKey and conformance SuperCoderKey)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for SuperCoderKey, &type metadata for SuperCoderKey);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SuperCoderKey and conformance SuperCoderKey);
  }
  return result;
}

uint64_t sub_1DF031C94()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

ValueMetadata *type metadata accessor for SuperCoderKey()
{
  return &type metadata for SuperCoderKey;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SuperCoderKey@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = a2;
  *(_QWORD *)(a3 + 16) = 0;
  *(_BYTE *)(a3 + 24) = 0;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SuperCoderKey()
{
  lazy protocol witness table accessor for type SuperCoderKey and conformance SuperCoderKey();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SuperCoderKey()
{
  lazy protocol witness table accessor for type SuperCoderKey and conformance SuperCoderKey();
  return CodingKey.debugDescription.getter();
}

uint64_t specialized CodingIntegerPrimitive.encodeValue(to:)(uint64_t a1, __int16 a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v4 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  v5 = *(_QWORD *)(a1 + 16);
  result = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a1 + 16) = v5;
  if ((result & 1) == 0)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v5 + 16) + 1, 1, (char *)v5);
    v5 = result;
    *v4 = result;
  }
  v8 = *(_QWORD *)(v5 + 16);
  v7 = *(_QWORD *)(v5 + 24);
  if (v8 >= v7 >> 1)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, (char *)v5);
    v5 = result;
    *v4 = result;
  }
  *(_QWORD *)(v5 + 16) = v8 + 1;
  *(_BYTE *)(v5 + v8 + 32) = a2;
  v9 = *v4;
  v11 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v11 >= v10 >> 1)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1, (char *)v9);
    v9 = result;
    *v4 = result;
  }
  *(_QWORD *)(v9 + 16) = v11 + 1;
  *(_BYTE *)(v9 + v11 + 32) = HIBYTE(a2);
  return result;
}

uint64_t specialized CodingPrimitive.encode(to:)(uint64_t a1, uint64_t a2)
{
  char **v4;
  char *v5;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  unint64_t v8;

  v4 = (char **)(a1 + 16);
  swift_beginAccess();
  v5 = *(char **)(a1 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a1 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v5 + 2) + 1, 1, v5);
    *v4 = v5;
  }
  v8 = *((_QWORD *)v5 + 2);
  v7 = *((_QWORD *)v5 + 3);
  if (v8 >= v7 >> 1)
  {
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, v5);
    *v4 = v5;
  }
  *((_QWORD *)v5 + 2) = v8 + 1;
  v5[v8 + 32] = 2;
  swift_retain();
  specialized CodingIntegerPrimitive.forEachByte(do:)(a2, a1);
  return swift_release();
}

{
  char **v4;
  char *v5;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  unint64_t v8;

  v4 = (char **)(a1 + 16);
  swift_beginAccess();
  v5 = *(char **)(a1 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a1 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v5 + 2) + 1, 1, v5);
    *v4 = v5;
  }
  v8 = *((_QWORD *)v5 + 2);
  v7 = *((_QWORD *)v5 + 3);
  if (v8 >= v7 >> 1)
  {
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, v5);
    *v4 = v5;
  }
  *((_QWORD *)v5 + 2) = v8 + 1;
  v5[v8 + 32] = 5;
  swift_retain();
  specialized CodingIntegerPrimitive.forEachByte(do:)(a2, a1);
  return swift_release();
}

{
  char **v4;
  char *v5;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  unint64_t v8;

  v4 = (char **)(a1 + 16);
  swift_beginAccess();
  v5 = *(char **)(a1 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a1 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v5 + 2) + 1, 1, v5);
    *v4 = v5;
  }
  v8 = *((_QWORD *)v5 + 2);
  v7 = *((_QWORD *)v5 + 3);
  if (v8 >= v7 >> 1)
  {
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, v5);
    *v4 = v5;
  }
  *((_QWORD *)v5 + 2) = v8 + 1;
  v5[v8 + 32] = 6;
  swift_retain();
  specialized CodingIntegerPrimitive.forEachByte(do:)(a2, a1);
  return swift_release();
}

{
  char **v4;
  char *v5;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  unint64_t v8;

  v4 = (char **)(a1 + 16);
  swift_beginAccess();
  v5 = *(char **)(a1 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a1 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v5 + 2) + 1, 1, v5);
    *v4 = v5;
  }
  v8 = *((_QWORD *)v5 + 2);
  v7 = *((_QWORD *)v5 + 3);
  if (v8 >= v7 >> 1)
  {
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, v5);
    *v4 = v5;
  }
  *((_QWORD *)v5 + 2) = v8 + 1;
  v5[v8 + 32] = 7;
  swift_retain();
  specialized CodingIntegerPrimitive.forEachByte(do:)(a2, a1);
  return swift_release();
}

{
  char **v4;
  char *v5;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  unint64_t v8;

  v4 = (char **)(a1 + 16);
  swift_beginAccess();
  v5 = *(char **)(a1 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a1 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v5 + 2) + 1, 1, v5);
    *v4 = v5;
  }
  v8 = *((_QWORD *)v5 + 2);
  v7 = *((_QWORD *)v5 + 3);
  if (v8 >= v7 >> 1)
  {
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, v5);
    *v4 = v5;
  }
  *((_QWORD *)v5 + 2) = v8 + 1;
  v5[v8 + 32] = 10;
  swift_retain();
  specialized CodingIntegerPrimitive.forEachByte(do:)(a2, a1);
  return swift_release();
}

{
  char **v4;
  char *v5;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  unint64_t v8;

  v4 = (char **)(a1 + 16);
  swift_beginAccess();
  v5 = *(char **)(a1 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a1 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v5 + 2) + 1, 1, v5);
    *v4 = v5;
  }
  v8 = *((_QWORD *)v5 + 2);
  v7 = *((_QWORD *)v5 + 3);
  if (v8 >= v7 >> 1)
  {
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, v5);
    *v4 = v5;
  }
  *((_QWORD *)v5 + 2) = v8 + 1;
  v5[v8 + 32] = 11;
  swift_retain();
  specialized CodingIntegerPrimitive.forEachByte(do:)(a2, a1);
  return swift_release();
}

uint64_t specialized CodingPrimitive.encode(to:)(uint64_t a1, char a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v4 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  v5 = *(_QWORD *)(a1 + 16);
  result = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a1 + 16) = v5;
  if ((result & 1) == 0)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v5 + 16) + 1, 1, (char *)v5);
    v5 = result;
    *v4 = result;
  }
  v8 = *(_QWORD *)(v5 + 16);
  v7 = *(_QWORD *)(v5 + 24);
  if (v8 >= v7 >> 1)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, (char *)v5);
    v5 = result;
    *v4 = result;
  }
  *(_QWORD *)(v5 + 16) = v8 + 1;
  *(_BYTE *)(v5 + v8 + 32) = 3;
  v9 = *v4;
  v11 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v11 >= v10 >> 1)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1, (char *)v9);
    v9 = result;
    *v4 = result;
  }
  *(_QWORD *)(v9 + 16) = v11 + 1;
  *(_BYTE *)(v9 + v11 + 32) = a2;
  return result;
}

{
  uint64_t *v4;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v4 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  v5 = *(_QWORD *)(a1 + 16);
  result = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a1 + 16) = v5;
  if ((result & 1) == 0)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v5 + 16) + 1, 1, (char *)v5);
    v5 = result;
    *v4 = result;
  }
  v8 = *(_QWORD *)(v5 + 16);
  v7 = *(_QWORD *)(v5 + 24);
  if (v8 >= v7 >> 1)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, (char *)v5);
    v5 = result;
    *v4 = result;
  }
  *(_QWORD *)(v5 + 16) = v8 + 1;
  *(_BYTE *)(v5 + v8 + 32) = 8;
  v9 = *v4;
  v11 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v11 >= v10 >> 1)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1, (char *)v9);
    v9 = result;
    *v4 = result;
  }
  *(_QWORD *)(v9 + 16) = v11 + 1;
  *(_BYTE *)(v9 + v11 + 32) = a2;
  return result;
}

{
  uint64_t *v4;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v4 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  v5 = *(_QWORD *)(a1 + 16);
  result = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a1 + 16) = v5;
  if ((result & 1) == 0)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v5 + 16) + 1, 1, (char *)v5);
    v5 = result;
    *v4 = result;
  }
  v8 = *(_QWORD *)(v5 + 16);
  v7 = *(_QWORD *)(v5 + 24);
  if (v8 >= v7 >> 1)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, (char *)v5);
    v5 = result;
    *v4 = result;
  }
  *(_QWORD *)(v5 + 16) = v8 + 1;
  *(_BYTE *)(v5 + v8 + 32) = 12;
  v9 = *v4;
  v11 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v11 >= v10 >> 1)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1, (char *)v9);
    v9 = result;
    *v4 = result;
  }
  *(_QWORD *)(v9 + 16) = v11 + 1;
  *(_BYTE *)(v9 + v11 + 32) = a2 & 1;
  return result;
}

uint64_t specialized CodingPrimitive.encode(to:)(uint64_t a1, __int16 a2)
{
  char **v4;
  char *v5;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  unint64_t v8;

  v4 = (char **)(a1 + 16);
  swift_beginAccess();
  v5 = *(char **)(a1 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a1 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v5 + 2) + 1, 1, v5);
    *v4 = v5;
  }
  v8 = *((_QWORD *)v5 + 2);
  v7 = *((_QWORD *)v5 + 3);
  if (v8 >= v7 >> 1)
  {
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, v5);
    *v4 = v5;
  }
  *((_QWORD *)v5 + 2) = v8 + 1;
  v5[v8 + 32] = 4;
  return specialized CodingIntegerPrimitive.encodeValue(to:)(a1, a2);
}

{
  uint64_t *v4;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v4 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  v5 = *(_QWORD *)(a1 + 16);
  result = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a1 + 16) = v5;
  if ((result & 1) == 0)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v5 + 16) + 1, 1, (char *)v5);
    v5 = result;
    *v4 = result;
  }
  v8 = *(_QWORD *)(v5 + 16);
  v7 = *(_QWORD *)(v5 + 24);
  if (v8 >= v7 >> 1)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, (char *)v5);
    v5 = result;
    *v4 = result;
  }
  *(_QWORD *)(v5 + 16) = v8 + 1;
  *(_BYTE *)(v5 + v8 + 32) = 9;
  v9 = *v4;
  v11 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v11 >= v10 >> 1)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1, (char *)v9);
    v9 = result;
    *v4 = result;
  }
  *(_QWORD *)(v9 + 16) = v11 + 1;
  *(_BYTE *)(v9 + v11 + 32) = a2;
  v12 = *v4;
  v14 = *(_QWORD *)(*v4 + 16);
  v13 = *(_QWORD *)(*v4 + 24);
  if (v14 >= v13 >> 1)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v13 > 1), v14 + 1, 1, (char *)v12);
    v12 = result;
    *v4 = result;
  }
  *(_QWORD *)(v12 + 16) = v14 + 1;
  *(_BYTE *)(v12 + v14 + 32) = HIBYTE(a2);
  return result;
}

uint64_t specialized CodingPrimitive.encode(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char **v6;
  char *v7;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12[2];

  v6 = (char **)(a1 + 16);
  swift_beginAccess();
  v7 = *(char **)(a1 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a1 + 16) = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v7 + 2) + 1, 1, v7);
    *v6 = v7;
  }
  v10 = *((_QWORD *)v7 + 2);
  v9 = *((_QWORD *)v7 + 3);
  if (v10 >= v9 >> 1)
  {
    v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v9 > 1), v10 + 1, 1, v7);
    *v6 = v7;
  }
  *((_QWORD *)v7 + 2) = v10 + 1;
  v7[v10 + 32] = 15;
  v12[0] = a2;
  v12[1] = a3;
  swift_retain();
  swift_bridgeObjectRetain();
  specialized String.withUTF8<A>(_:)(v12, a1);
  return swift_bridgeObjectRelease();
}

uint64_t specialized CodingPrimitive.encode(to:)(uint64_t a1, double a2)
{
  char **v4;
  char *v5;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  unint64_t v8;

  v4 = (char **)(a1 + 16);
  swift_beginAccess();
  v5 = *(char **)(a1 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a1 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v5 + 2) + 1, 1, v5);
    *v4 = v5;
  }
  v8 = *((_QWORD *)v5 + 2);
  v7 = *((_QWORD *)v5 + 3);
  if (v8 >= v7 >> 1)
  {
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, v5);
    *v4 = v5;
  }
  *((_QWORD *)v5 + 2) = v8 + 1;
  v5[v8 + 32] = 14;
  swift_retain();
  specialized CodingIntegerPrimitive.forEachByte(do:)(*(_QWORD *)&a2, a1);
  return swift_release();
}

uint64_t specialized CodingPrimitive.encode(to:)(uint64_t a1, float a2)
{
  char **v4;
  char *v5;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  unint64_t v8;

  v4 = (char **)(a1 + 16);
  swift_beginAccess();
  v5 = *(char **)(a1 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a1 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v5 + 2) + 1, 1, v5);
    *v4 = v5;
  }
  v8 = *((_QWORD *)v5 + 2);
  v7 = *((_QWORD *)v5 + 3);
  if (v8 >= v7 >> 1)
  {
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, v5);
    *v4 = v5;
  }
  *((_QWORD *)v5 + 2) = v8 + 1;
  v5[v8 + 32] = 13;
  swift_retain();
  specialized CodingIntegerPrimitive.forEachByte(do:)(LODWORD(a2), a1);
  return swift_release();
}

uint64_t *specialized String.withUTF8<A>(_:)(uint64_t *result, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char **v8;
  unsigned __int8 *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v3 = *result;
  v4 = result[1];
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_7:
    v21[0] = v3;
    v21[1] = v4 & 0xFFFFFFFFFFFFFFLL;
    v15 = HIBYTE(v4) & 0xF;
    swift_retain();
    specialized CodingIntegerPrimitive.forEachByte(do:)(v15 + 1, a2);
    swift_release();
    v8 = (char **)(a2 + 16);
    swift_beginAccess();
    v10 = v21;
    v11 = v15;
    goto LABEL_8;
  }
  v12 = result;
  v3 = static String._copying(_:)();
  v14 = v13;
  result = (uint64_t *)swift_bridgeObjectRelease();
  *v12 = v3;
  v12[1] = v14;
  v4 = v14;
  if ((v14 & 0x2000000000000000) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v3 & 0x1000000000000000) == 0)
  {
    result = (uint64_t *)_StringObject.sharedUTF8.getter();
    v5 = (uint64_t)result;
    v6 = v20;
    v7 = v20 + 1;
    if (!__OFADD__(v20, 1))
      goto LABEL_5;
LABEL_15:
    __break(1u);
    return result;
  }
  v5 = (v4 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v6 = v3 & 0xFFFFFFFFFFFFLL;
  v7 = (v3 & 0xFFFFFFFFFFFFLL) + 1;
  if (__OFADD__(v3 & 0xFFFFFFFFFFFFLL, 1))
    goto LABEL_15;
LABEL_5:
  swift_retain();
  specialized CodingIntegerPrimitive.forEachByte(do:)(v7, a2);
  swift_release();
  v8 = (char **)(a2 + 16);
  swift_beginAccess();
  v10 = (_QWORD *)v5;
  v11 = v6;
LABEL_8:
  specialized Array.append<A>(contentsOf:)((uint64_t)v10, v11, v9);
  v16 = *(char **)(a2 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a2 + 16) = v16;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v16 + 2) + 1, 1, v16);
    *v8 = v16;
  }
  v19 = *((_QWORD *)v16 + 2);
  v18 = *((_QWORD *)v16 + 3);
  if (v19 >= v18 >> 1)
  {
    v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v18 > 1), v19 + 1, 1, v16);
    *v8 = v16;
  }
  *((_QWORD *)v16 + 2) = v19 + 1;
  v16[v19 + 32] = 0;
  return (uint64_t *)swift_release();
}

uint64_t KeyedEncodingStorage.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for KeyedEncodingStorage()
{
  return objc_opt_self();
}

uint64_t type metadata completion function for _XPCKeyedEncodingContainer()
{
  return swift_initClassMetadata2();
}

unint64_t protocol witness for SharableStorage.init() in conformance KeyedEncodingStorage@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  unint64_t result;

  v2 = swift_allocObject();
  result = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E0DEE9D8]);
  *(_QWORD *)(v2 + 16) = result;
  *a1 = v2;
  return result;
}

_QWORD *_XPCKeyedEncodingContainer.__allocating_init(codingMetadata:storage:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;

  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  return result;
}

_QWORD *_XPCKeyedEncodingContainer.init(codingMetadata:storage:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  return v3;
}

uint64_t _XPCKeyedEncodingContainer.encodeNil(forKey:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];
  __int128 v21;
  __int128 v22;
  _UNKNOWN **v23;

  v2 = *(_QWORD *)(*v1 + 80);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](a1);
  v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(v3 + 16);
  v20[1] = v7;
  v6(v5);
  v8 = v1[4];
  swift_retain();
  v9 = dispatch thunk of CodingKey.stringValue.getter();
  v11 = v10;
  swift_beginAccess();
  v12 = *(_QWORD *)(v8 + 16);
  if (*(_QWORD *)(v12 + 16) && (v13 = specialized __RawDictionaryStorage.find<A>(_:)(v9, v11), (v14 & 1) != 0))
  {
    outlined init with copy of XPCCodableObjectRepresentable(*(_QWORD *)(v12 + 56) + 40 * v13, (uint64_t)&v21);
  }
  else
  {
    v23 = 0;
    v21 = 0u;
    v22 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v15 = *((_QWORD *)&v22 + 1);
  result = outlined destroy of DecodingContainer?((uint64_t)&v21, &demangling cache variable for type metadata for EncodingContainer?);
  if (v15)
  {
    __break(1u);
  }
  else
  {
    swift_retain();
    v17 = dispatch thunk of CodingKey.stringValue.getter();
    v19 = v18;
    *((_QWORD *)&v22 + 1) = &type metadata for NilPrimitive;
    v23 = &protocol witness table for NilPrimitive;
    swift_beginAccess();
    specialized Dictionary.subscript.setter((uint64_t)&v21, v17, v19);
    swift_endAccess();
    return swift_release();
  }
  return result;
}

uint64_t _XPCKeyedEncodingContainer.encode<A>(_:forKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t result;
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
  _BYTE v34[40];
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;

  v32 = a4;
  v5 = v4;
  v30 = a1;
  v31 = a3;
  v6 = *v4;
  v7 = *(_QWORD *)(v6 + 80);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](a1);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(void (**)(char *))(v8 + 16);
  v38 = v12;
  v11(v10);
  v13 = v5[4];
  v14 = *(_QWORD *)(v6 + 88);
  swift_retain();
  v15 = dispatch thunk of CodingKey.stringValue.getter();
  v17 = v16;
  swift_beginAccess();
  v18 = *(_QWORD *)(v13 + 16);
  if (*(_QWORD *)(v18 + 16) && (v19 = specialized __RawDictionaryStorage.find<A>(_:)(v15, v17), (v20 & 1) != 0))
  {
    outlined init with copy of XPCCodableObjectRepresentable(*(_QWORD *)(v18 + 56) + 40 * v19, (uint64_t)&v35);
  }
  else
  {
    v37 = 0;
    v35 = 0u;
    v36 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v21 = *((_QWORD *)&v36 + 1);
  result = outlined destroy of DecodingContainer?((uint64_t)&v35, &demangling cache variable for type metadata for EncodingContainer?);
  if (v21)
  {
    __break(1u);
  }
  else
  {
    v23 = CodingMetadata.appending<A>(codingKey:)(v38, v5[2], v5[3], v7, v14);
    v25 = v24;
    type metadata accessor for XPCEncoder();
    v26 = v33;
    static XPCEncoder.encode<A>(_:withCodingMetadata:)(v30, v23, v25, v31, v32, (uint64_t)&v35);
    if (v26)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_retain();
      v27 = dispatch thunk of CodingKey.stringValue.getter();
      v29 = v28;
      outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v35, (uint64_t)v34);
      swift_beginAccess();
      specialized Dictionary.subscript.setter((uint64_t)v34, v27, v29);
      swift_endAccess();
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v35);
    }
  }
  return result;
}

uint64_t _XPCKeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  _UNKNOWN **v35;

  v5 = *v4;
  v6 = CodingMetadata.appending<A>(codingKey:)(a2, v4[2], v4[3], *(_QWORD *)(*v4 + 80), *(_QWORD *)(*v4 + 88));
  v8 = v7;
  v9 = v4[4];
  swift_retain();
  v10 = dispatch thunk of CodingKey.stringValue.getter();
  v12 = v11;
  swift_beginAccess();
  v13 = *(_QWORD *)(v9 + 16);
  if (*(_QWORD *)(v13 + 16) && (v14 = specialized __RawDictionaryStorage.find<A>(_:)(v10, v12), (v15 & 1) != 0))
  {
    outlined init with copy of XPCCodableObjectRepresentable(*(_QWORD *)(v13 + 56) + 40 * v14, (uint64_t)&v30);
  }
  else
  {
    v32 = 0;
    v30 = 0u;
    v31 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_release();
  v16 = *((_QWORD *)&v31 + 1);
  if (*((_QWORD *)&v31 + 1))
  {
    v17 = v32;
    v18 = __swift_project_boxed_opaque_existential_1(&v30, *((uint64_t *)&v31 + 1));
    *((_QWORD *)&v34 + 1) = v16;
    v35 = *(_UNKNOWN ***)(v17 + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v33);
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(boxed_opaque_existential_1, v18, v16);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v30);
  }
  else
  {
    outlined destroy of DecodingContainer?((uint64_t)&v30, &demangling cache variable for type metadata for EncodingContainer?);
    v33 = 0u;
    v34 = 0u;
    v35 = 0;
  }
  v21 = type metadata accessor for _XPCKeyedEncodingContainer(0, a3, a4, v20);
  v22 = static SharableStorageContainer.getExisting<A>(container:codingMetadata:)((uint64_t)&v30, (uint64_t)&v33, v6, v8, v5, v21, (uint64_t)&protocol witness table for _XPCKeyedEncodingContainer<A>, (uint64_t)&protocol witness table for _XPCKeyedEncodingContainer<A>, (uint64_t)&protocol witness table for KeyedEncodingStorage);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of DecodingContainer?((uint64_t)&v33, &demangling cache variable for type metadata for CodingContainer?);
  v23 = v30;
  if ((v22 & 1) != 0)
  {
    swift_retain();
    v24 = dispatch thunk of CodingKey.stringValue.getter();
    v26 = v25;
    *((_QWORD *)&v34 + 1) = v21;
    v35 = &protocol witness table for _XPCKeyedEncodingContainer<A>;
    *(_QWORD *)&v33 = v23;
    swift_beginAccess();
    swift_retain();
    specialized Dictionary.subscript.setter((uint64_t)&v33, v24, v26);
    swift_endAccess();
    swift_release();
  }
  *(_QWORD *)&v33 = v23;
  MEMORY[0x1DF0F49E8](&protocol conformance descriptor for _XPCKeyedEncodingContainer<A>, v21);
  return KeyedEncodingContainer.init<A>(_:)();
}

uint64_t _XPCKeyedEncodingContainer.nestedUnkeyedContainer(forKey:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  _UNKNOWN **v31;

  v3 = *v2;
  v4 = CodingMetadata.appending<A>(codingKey:)(a1, v2[2], v2[3], *(_QWORD *)(*v2 + 80), *(_QWORD *)(*v2 + 88));
  v6 = v5;
  v7 = v2[4];
  swift_retain();
  v8 = dispatch thunk of CodingKey.stringValue.getter();
  v10 = v9;
  swift_beginAccess();
  v11 = *(_QWORD *)(v7 + 16);
  if (*(_QWORD *)(v11 + 16) && (v12 = specialized __RawDictionaryStorage.find<A>(_:)(v8, v10), (v13 & 1) != 0))
  {
    outlined init with copy of XPCCodableObjectRepresentable(*(_QWORD *)(v11 + 56) + 40 * v12, (uint64_t)&v26);
  }
  else
  {
    v28 = 0;
    v26 = 0u;
    v27 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_release();
  v14 = *((_QWORD *)&v27 + 1);
  if (*((_QWORD *)&v27 + 1))
  {
    v15 = v28;
    v16 = __swift_project_boxed_opaque_existential_1(&v26, *((uint64_t *)&v27 + 1));
    *((_QWORD *)&v30 + 1) = v14;
    v31 = *(_UNKNOWN ***)(v15 + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v29);
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(boxed_opaque_existential_1, v16, v14);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v26);
  }
  else
  {
    outlined destroy of DecodingContainer?((uint64_t)&v26, &demangling cache variable for type metadata for EncodingContainer?);
    v29 = 0u;
    v30 = 0u;
    v31 = 0;
  }
  v18 = type metadata accessor for _XPCUnkeyedEncodingContainer();
  v19 = static SharableStorageContainer.getExisting<A>(container:codingMetadata:)((uint64_t)&v26, (uint64_t)&v29, v4, v6, v3, v18, (uint64_t)&protocol witness table for _XPCKeyedEncodingContainer<A>, (uint64_t)&protocol witness table for _XPCUnkeyedEncodingContainer, (uint64_t)&protocol witness table for _XPCUnkeyedEncodingContainer.UnkeyedEncodingStorage);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of DecodingContainer?((uint64_t)&v29, &demangling cache variable for type metadata for CodingContainer?);
  v20 = v26;
  if ((v19 & 1) != 0)
  {
    swift_retain();
    v21 = dispatch thunk of CodingKey.stringValue.getter();
    v23 = v22;
    *((_QWORD *)&v30 + 1) = v18;
    v31 = &protocol witness table for _XPCUnkeyedEncodingContainer;
    *(_QWORD *)&v29 = v20;
    swift_beginAccess();
    swift_retain();
    specialized Dictionary.subscript.setter((uint64_t)&v29, v21, v23);
    swift_endAccess();
    swift_release();
  }
  a2[3] = v18;
  result = _s3XPC11_XPCDecoderCACs7DecoderAAWlTm_0(&lazy protocol witness table cache variable for type _XPCUnkeyedEncodingContainer and conformance _XPCUnkeyedEncodingContainer, (uint64_t (*)(uint64_t))type metadata accessor for _XPCUnkeyedEncodingContainer, (uint64_t)&protocol conformance descriptor for _XPCUnkeyedEncodingContainer);
  a2[4] = result;
  *a2 = v20;
  return result;
}

uint64_t _XPCKeyedEncodingContainer.superEncoder()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v4[5];

  static SuperCoderKey.defaultKey<A>(_:)(*(_QWORD *)(*(_QWORD *)v1 + 80), *(_QWORD *)(*(_QWORD *)v1 + 88), v4);
  _XPCKeyedEncodingContainer._superEncoder(forKey:)(v4, a1);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
}

uint64_t _XPCKeyedEncodingContainer._superEncoder(forKey:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  _QWORD v17[5];

  v5 = a1[3];
  v6 = a1[4];
  v7 = __swift_project_boxed_opaque_existential_1(a1, v5);
  v8 = CodingMetadata.appending<A>(codingKey:)((uint64_t)v7, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), v5, v6);
  v10 = v9;
  v11 = type metadata accessor for _XPCEncoder();
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 32) = 0u;
  *(_OWORD *)(v12 + 48) = 0u;
  *(_QWORD *)(v12 + 64) = 0;
  *(_QWORD *)(v12 + 16) = v8;
  *(_QWORD *)(v12 + 24) = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  swift_retain();
  v13 = dispatch thunk of CodingKey.stringValue.getter();
  v15 = v14;
  v17[3] = v11;
  v17[4] = &protocol witness table for _XPCEncoder;
  v17[0] = v12;
  swift_beginAccess();
  swift_retain();
  specialized Dictionary.subscript.setter((uint64_t)v17, v13, v15);
  swift_endAccess();
  swift_release();
  a2[3] = v11;
  result = _s3XPC11_XPCDecoderCACs7DecoderAAWlTm_0(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, (uint64_t (*)(uint64_t))type metadata accessor for _XPCEncoder, (uint64_t)&protocol conformance descriptor for _XPCEncoder);
  a2[4] = result;
  *a2 = v12;
  return result;
}

uint64_t _XPCKeyedEncodingContainer.superEncoder(forKey:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v7;
  uint64_t v8[3];
  __int128 v9;

  v9 = *(_OWORD *)(*(_QWORD *)v2 + 80);
  v7 = v9;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v8);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(boxed_opaque_existential_1, a1);
  _XPCKeyedEncodingContainer._superEncoder(forKey:)(v8, a2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t _XPCKeyedEncodingContainer.encode(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = type metadata accessor for _XPCKeyedEncodingContainer(0, *(_QWORD *)(*v4 + 80), *(_QWORD *)(*v4 + 88), a4);
  specialized EncodingContainer.encodeType(to:)(a1, v6, (uint64_t)&protocol witness table for _XPCKeyedEncodingContainer<A>);
  v7 = v4[4];
  swift_beginAccess();
  v8 = *(_QWORD *)(*(_QWORD *)(v7 + 16) + 16);
  swift_retain();
  specialized CodingIntegerPrimitive.forEachByte(do:)(v8, a1);
  swift_release();
  return EncodingBuffer.appendSized(_:)((uint64_t (*)(uint64_t))partial apply for closure #1 in _XPCKeyedEncodingContainer.encode(to:));
}

uint64_t closure #1 in _XPCKeyedEncodingContainer.encode(to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char **v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34[2];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;

  v3 = *(_QWORD *)(a1 + 32);
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 16);
  v31 = v4 + 64;
  v5 = 1 << *(_BYTE *)(v4 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(v4 + 64);
  v8 = (char **)(a2 + 16);
  v33 = v4;
  swift_bridgeObjectRetain();
  result = swift_beginAccess();
  v10 = 0;
  v32 = (unint64_t)(v5 + 63) >> 6;
  if (!v7)
    goto LABEL_6;
LABEL_4:
  v11 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  v12 = v11 | (v10 << 6);
LABEL_5:
  v13 = *(_QWORD *)(v33 + 56);
  v14 = (_QWORD *)(*(_QWORD *)(v33 + 48) + 16 * v12);
  v15 = v14[1];
  *(_QWORD *)&v35 = *v14;
  *((_QWORD *)&v35 + 1) = v15;
  outlined init with copy of XPCCodableObjectRepresentable(v13 + 40 * v12, (uint64_t)&v36);
  swift_bridgeObjectRetain();
  while (1)
  {
    outlined init with take of (key: String, value: EncodingContainer)?((uint64_t)&v35, (uint64_t)&v39);
    v18 = v40;
    if (!v40)
      return swift_release();
    v19 = v39;
    outlined init with take of Encodable(&v41, (uint64_t)&v35);
    v20 = *v8;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v8 = v20;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v20 + 2) + 1, 1, v20);
      *v8 = v20;
    }
    v23 = *((_QWORD *)v20 + 2);
    v22 = *((_QWORD *)v20 + 3);
    if (v23 >= v22 >> 1)
    {
      v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v22 > 1), v23 + 1, 1, v20);
      *v8 = v20;
    }
    *((_QWORD *)v20 + 2) = v23 + 1;
    v20[v23 + 32] = 15;
    v34[0] = v19;
    v34[1] = v18;
    swift_retain();
    swift_bridgeObjectRetain();
    specialized String.withUTF8<A>(_:)(v34, a2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v24 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(_QWORD *)(v24 + 16) = 8;
    *(_QWORD *)(v24 + 32) = 0xCCCCCCCCCCCCCCCCLL;
    v25 = *(_QWORD *)(*(_QWORD *)(a2 + 16) + 16);
    specialized Array.append<A>(contentsOf:)(v24);
    v27 = *((_QWORD *)&v36 + 1);
    v26 = v37;
    __swift_project_boxed_opaque_existential_1(&v35, *((uint64_t *)&v36 + 1));
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(a2, v27, v26);
    v28 = v25 + 8;
    if (__OFADD__(v25, 8))
      break;
    v29 = *((_QWORD *)*v8 + 2);
    result = v29 - v28;
    if (__OFSUB__(v29, v28))
      goto LABEL_39;
    v34[0] = MEMORY[0x1E0DEE9D8];
    result = specialized CodingIntegerPrimitive.forEachByte(do:)(result, v34);
    if (v28 < v25)
      goto LABEL_40;
    specialized Array.replaceSubrange<A>(_:with:)(v25, v25 + 8, v34[0]);
    swift_bridgeObjectRelease();
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v35);
    if (v7)
      goto LABEL_4;
LABEL_6:
    v16 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_41;
    if (v16 < v32)
    {
      v17 = *(_QWORD *)(v31 + 8 * v16);
      if (v17)
        goto LABEL_9;
      v10 += 2;
      if (v16 + 1 >= v32)
      {
        v10 = v16;
      }
      else
      {
        v17 = *(_QWORD *)(v31 + 8 * v10);
        if (v17)
        {
          ++v16;
          goto LABEL_9;
        }
        if (v16 + 2 < v32)
        {
          v17 = *(_QWORD *)(v31 + 8 * (v16 + 2));
          if (v17)
          {
            v16 += 2;
            goto LABEL_9;
          }
          v30 = v16 + 3;
          if (v16 + 3 < v32)
          {
            v17 = *(_QWORD *)(v31 + 8 * v30);
            if (!v17)
            {
              while (1)
              {
                v16 = v30 + 1;
                if (__OFADD__(v30, 1))
                  goto LABEL_42;
                if (v16 >= v32)
                {
                  v10 = v32 - 1;
                  goto LABEL_14;
                }
                v17 = *(_QWORD *)(v31 + 8 * v16);
                ++v30;
                if (v17)
                  goto LABEL_9;
              }
            }
            v16 += 3;
LABEL_9:
            v7 = (v17 - 1) & v17;
            v12 = __clz(__rbit64(v17)) + (v16 << 6);
            v10 = v16;
            goto LABEL_5;
          }
          v10 = v16 + 2;
        }
      }
    }
LABEL_14:
    v7 = 0;
    v38 = 0;
    v36 = 0u;
    v37 = 0u;
    v35 = 0u;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t _XPCKeyedEncodingContainer.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t _XPCKeyedEncodingContainer.__deallocating_deinit()
{
  _XPCKeyedEncodingContainer.deinit();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for _XPCKeyedEncodingContainer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _XPCKeyedEncodingContainer);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.codingPath.getter in conformance _XPCKeyedEncodingContainer<A1>(uint64_t a1)
{
  return CodingContainerWithMetadata.codingPath.getter(a1, (uint64_t)&protocol witness table for _XPCKeyedEncodingContainer<A>);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeNil(forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1)
{
  return _XPCKeyedEncodingContainer.encodeNil(forKey:)(a1);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encode(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(char a1, uint64_t a2)
{
  char v3;

  v3 = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a2, MEMORY[0x1E0DEAFA0], MEMORY[0x1E0DEAFA8]);
}

{
  char v3;

  v3 = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a2, MEMORY[0x1E0DEDA70], MEMORY[0x1E0DEDA78]);
}

{
  char v3;

  v3 = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a2, MEMORY[0x1E0DEDE70], MEMORY[0x1E0DEDE78]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encode(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v4[2];

  v4[1] = a2;
  v4[0] = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)v4, a3, MEMORY[0x1E0DEA968], MEMORY[0x1E0DEA970]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encode(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, double a2)
{
  double v3;

  v3 = a2;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a1, MEMORY[0x1E0DEB070], MEMORY[0x1E0DEB080]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encode(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, float a2)
{
  float v3;

  v3 = a2;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a1, MEMORY[0x1E0DEB188], MEMORY[0x1E0DEB198]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encode(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a2, MEMORY[0x1E0DEB418], MEMORY[0x1E0DEB420]);
}

{
  uint64_t v3;

  v3 = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a2, MEMORY[0x1E0DEDC60], MEMORY[0x1E0DEDC68]);
}

{
  uint64_t v3;

  v3 = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a2, MEMORY[0x1E0DEBB98], MEMORY[0x1E0DEBBA0]);
}

{
  uint64_t v3;

  v3 = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a2, MEMORY[0x1E0DEE190], MEMORY[0x1E0DEE198]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encode(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(__int16 a1, uint64_t a2)
{
  __int16 v3;

  v3 = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a2, MEMORY[0x1E0DEDB58], MEMORY[0x1E0DEDB60]);
}

{
  __int16 v3;

  v3 = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a2, MEMORY[0x1E0DEE068], MEMORY[0x1E0DEE070]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encode(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(int a1, uint64_t a2)
{
  int v3;

  v3 = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a2, MEMORY[0x1E0DEDBC8], MEMORY[0x1E0DEDBD0]);
}

{
  int v3;

  v3 = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a2, MEMORY[0x1E0DEE0F8], MEMORY[0x1E0DEE100]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encode(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return protocol witness for KeyedEncodingContainerProtocol.encode(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, a5, MEMORY[0x1E0DED960]);
}

{
  return protocol witness for KeyedEncodingContainerProtocol.encode(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, a5, MEMORY[0x1E0DED968]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encode(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v11;

  v11 = type metadata accessor for _XPCKeyedEncodingContainer(0, *(_QWORD *)(a4 + 80), *(_QWORD *)(a4 + 88), a4);
  return a6(a1, a2, a3, v11, a5);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encode<A>(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)(a1, a2, a3, a4);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeConditional<A>(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for _XPCKeyedEncodingContainer(0, *(_QWORD *)(a5 + 80), *(_QWORD *)(a5 + 88), a4);
  return KeyedEncodingContainerProtocol.encodeConditional<A>(_:forKey:)();
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for _XPCKeyedEncodingContainer(0, *(_QWORD *)(a3 + 80), *(_QWORD *)(a3 + 88), a4);
  return KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:)();
}

{
  type metadata accessor for _XPCKeyedEncodingContainer(0, *(_QWORD *)(a4 + 80), *(_QWORD *)(a4 + 88), a4);
  return KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:)();
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, a5, MEMORY[0x1E0DED8E0]);
}

{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, a5, MEMORY[0x1E0DED8F0]);
}

{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, a5, MEMORY[0x1E0DED920]);
}

{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, a5, MEMORY[0x1E0DED8F8]);
}

{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, a5, MEMORY[0x1E0DED948]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, MEMORY[0x1E0DED8E8]);
}

{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, MEMORY[0x1E0DED918]);
}

{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, MEMORY[0x1E0DED940]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, MEMORY[0x1E0DED908]);
}

{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, MEMORY[0x1E0DED928]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, MEMORY[0x1E0DED910]);
}

{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, MEMORY[0x1E0DED938]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, a5, a6, MEMORY[0x1E0DED930]);
}

{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, a5, a6, MEMORY[0x1E0DED950]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, uint64_t, uint64_t, uint64_t))
{
  uint64_t v9;

  v9 = type metadata accessor for _XPCKeyedEncodingContainer(0, *(_QWORD *)(a3 + 80), *(_QWORD *)(a3 + 88), a4);
  return a5(a1 & 0x1FF, a2, v9, a4);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, uint64_t, uint64_t, uint64_t))
{
  uint64_t v9;

  v9 = type metadata accessor for _XPCKeyedEncodingContainer(0, *(_QWORD *)(a3 + 80), *(_QWORD *)(a3 + 88), a4);
  return a5(a1 & 0x1FFFF, a2, v9, a4);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v9;

  v9 = type metadata accessor for _XPCKeyedEncodingContainer(0, *(_QWORD *)(a3 + 80), *(_QWORD *)(a3 + 88), a4);
  return a5(a1 | ((HIDWORD(a1) & 1) << 32), a2, v9, a4);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v10;
  uint64_t v11;

  v10 = a2 & 1;
  v11 = type metadata accessor for _XPCKeyedEncodingContainer(0, *(_QWORD *)(a4 + 80), *(_QWORD *)(a4 + 88), a4);
  return a6(a1, v10, a3, v11, a5);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v12;
  uint64_t v13;

  v12 = a3 & 1;
  v13 = type metadata accessor for _XPCKeyedEncodingContainer(0, *(_QWORD *)(a5 + 80), *(_QWORD *)(a5 + 88), a4);
  return a7(a1, a2, v12, a4, v13, a6);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent<A>(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for _XPCKeyedEncodingContainer(0, *(_QWORD *)(a5 + 80), *(_QWORD *)(a5 + 88), a4);
  return KeyedEncodingContainerProtocol.encodeIfPresent<A>(_:forKey:)();
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.nestedContainer<A>(keyedBy:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _XPCKeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(a1, a2, a3, a4);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.nestedUnkeyedContainer(forKey:) in conformance _XPCKeyedEncodingContainer<A>@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return _XPCKeyedEncodingContainer.nestedUnkeyedContainer(forKey:)(a1, a2);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.superEncoder() in conformance _XPCKeyedEncodingContainer<A>@<X0>(uint64_t *a1@<X8>)
{
  return _XPCKeyedEncodingContainer.superEncoder()(a1);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.superEncoder(forKey:) in conformance _XPCKeyedEncodingContainer<A>@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return _XPCKeyedEncodingContainer.superEncoder(forKey:)(a1, a2);
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _XPCKeyedEncodingContainer.encode(to:)(a1, a2, a3, a4);
}

_QWORD *protocol witness for SharableStorageContainer.init(codingMetadata:storage:) in conformance _XPCKeyedEncodingContainer<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  _QWORD *result;

  result = _XPCKeyedEncodingContainer.__allocating_init(codingMetadata:storage:)(a1, a2, *a3);
  *a4 = result;
  return result;
}

_QWORD *protocol witness for SharableStorageContainer.init(codingMetadata:initialStorage:) in conformance _XPCKeyedEncodingContainer<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  _QWORD *result;

  result = _XPCKeyedEncodingContainer.__allocating_init(codingMetadata:storage:)(a1, a2, *a3);
  *a4 = result;
  return result;
}

uint64_t static String._copying(_:)()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = String.subscript.getter();
  v4 = static String._copying(_:)(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t static String._copying(_:)(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = specialized Collection.count.getter(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v9, 0);
      v12 = specialized Sequence._copySequenceContents(initializing:)((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    }
    v13 = MEMORY[0x1DF0F4004](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x1DF0F4004);
LABEL_9:
      _StringObject.sharedUTF8.getter();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x1DF0F4004]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t specialized Collection.count.getter(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = _StringGuts._slowEnsureMatchingEncoding(_:)(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = _StringGuts._slowEnsureMatchingEncoding(_:)(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return String.UTF8View._foreignDistance(from:to:)();
  }
  __break(1u);
  return result;
}

_QWORD *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t specialized Sequence._copySequenceContents(initializing:)(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = String.UTF8View._foreignSubscript(position:)();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = _StringObject.sharedUTF8.getter();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = String.UTF8View._foreignIndex(after:)();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t _StringGuts._slowEnsureMatchingEncoding(_:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = String.UTF16View.index(_:offsetBy:)();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x1DF0F4058](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t partial apply for closure #1 in _XPCKeyedEncodingContainer.encode(to:)()
{
  uint64_t v0;

  return closure #1 in _XPCKeyedEncodingContainer.encode(to:)(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t outlined init with take of (key: String, value: EncodingContainer)?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: String, value: EncodingContainer)?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t XPC_TYPE_ARRAY.getter()
{
  return MEMORY[0x1E0C812C8];
}

uint64_t XPC_TYPE_INT64.getter()
{
  return MEMORY[0x1E0C81328];
}

uint64_t XPC_TYPE_UINT64.getter()
{
  return MEMORY[0x1E0C81398];
}

uint64_t XPC_TYPE_DOUBLE.getter()
{
  return MEMORY[0x1E0C81300];
}

uint64_t XPC_TYPE_BOOL.getter()
{
  return MEMORY[0x1E0C812D0];
}

uint64_t XPC_TYPE_CONNECTION.getter()
{
  return MEMORY[0x1E0C812E0];
}

uint64_t XPC_ARRAY_APPEND.getter()
{
  return -1;
}

uint64_t XPC_TYPE_NULL.getter()
{
  return MEMORY[0x1E0C81350];
}

uint64_t XPC_TYPE_DATE.getter()
{
  return MEMORY[0x1E0C812F0];
}

uint64_t XPC_TYPE_DATA.getter()
{
  return MEMORY[0x1E0C812E8];
}

uint64_t XPC_TYPE_STRING.getter()
{
  return MEMORY[0x1E0C81390];
}

uint64_t XPC_TYPE_UUID.getter()
{
  return MEMORY[0x1E0C813A0];
}

uint64_t XPC_TYPE_FD.getter()
{
  return MEMORY[0x1E0C81318];
}

uint64_t XPC_TYPE_SHMEM.getter()
{
  return MEMORY[0x1E0C81388];
}

uint64_t XPC_TYPE_MACH_SEND.getter()
{
  return MEMORY[0x1E0C81338];
}

uint64_t XPC_TYPE_ERROR.getter()
{
  return MEMORY[0x1E0C81310];
}

uint64_t XPC_TYPE_ENDPOINT.getter()
{
  return MEMORY[0x1E0C81308];
}

uint64_t XPC_TYPE_MACH_RECV.getter()
{
  return MEMORY[0x1E0C81330];
}

uint64_t XPC_TYPE_MACH_SEND_ONCE.getter()
{
  return MEMORY[0x1E0C81348];
}

uint64_t XPC_TYPE_RICH_ERROR.getter()
{
  return MEMORY[0x1E0C81368];
}

uint64_t XPC_TYPE_ACTIVITY.getter()
{
  return MEMORY[0x1E0C812C0];
}

uint64_t XPC_TYPE_POINTER.getter()
{
  return MEMORY[0x1E0C81360];
}

uint64_t XPC_TYPE_SERIALIZER.getter()
{
  return MEMORY[0x1E0C81370];
}

uint64_t XPC_TYPE_PIPE.getter()
{
  return MEMORY[0x1E0C81358];
}

uint64_t XPC_TYPE_BUNDLE.getter()
{
  return MEMORY[0x1E0C812D8];
}

uint64_t XPC_TYPE_SERVICE.getter()
{
  return MEMORY[0x1E0C81378];
}

uint64_t XPC_TYPE_SERVICE_INSTANCE.getter()
{
  return MEMORY[0x1E0C81380];
}

uint64_t XPC_TYPE_FILE_TRANSFER.getter()
{
  return MEMORY[0x1E0C81320];
}

void one-time initialization function for XPC_ERROR_KEY_DESCRIPTION()
{
  XPC_ERROR_KEY_DESCRIPTION = *MEMORY[0x1E0C81270];
}

uint64_t XPC_ERROR_KEY_DESCRIPTION.getter()
{
  return XPC_ERROR_KEY_DESCRIPTION.getter(one-time initialization token for XPC_ERROR_KEY_DESCRIPTION, (uint64_t)&XPC_ERROR_KEY_DESCRIPTION);
}

void one-time initialization function for XPC_EVENT_KEY_NAME()
{
  XPC_EVENT_KEY_NAME = *MEMORY[0x1E0C81298];
}

id XPC_BOOL_TRUE.getter()
{
  return XPC_BOOL_TRUE.getter(_swift_xpc_BOOL_true);
}

uint64_t _swift_xpc_BOOL_true()
{
  uint64_t v0;
  id v1;

  v0 = MEMORY[0x1E0C81240];
  v1 = MEMORY[0x1E0C81240];
  return v0;
}

id XPC_BOOL_FALSE.getter()
{
  return XPC_BOOL_TRUE.getter(_swift_xpc_BOOL_false);
}

uint64_t _swift_xpc_BOOL_false()
{
  uint64_t v0;
  id v1;

  v0 = MEMORY[0x1E0C81238];
  v1 = MEMORY[0x1E0C81238];
  return v0;
}

id XPC_ERROR_CONNECTION_INTERRUPTED.getter()
{
  return XPC_BOOL_TRUE.getter(_swift_xpc_connection_interrupted);
}

uint64_t _swift_xpc_connection_interrupted()
{
  uint64_t v0;
  id v1;

  v0 = MEMORY[0x1E0C81258];
  v1 = MEMORY[0x1E0C81258];
  return v0;
}

id XPC_ERROR_CONNECTION_INVALID.getter()
{
  return XPC_BOOL_TRUE.getter(_swift_xpc_connection_invalid);
}

uint64_t _swift_xpc_connection_invalid()
{
  uint64_t v0;
  id v1;

  v0 = MEMORY[0x1E0C81260];
  v1 = MEMORY[0x1E0C81260];
  return v0;
}

id XPC_ERROR_TERMINATION_IMMINENT.getter()
{
  return XPC_BOOL_TRUE.getter(_swift_xpc_connection_termination_imminent);
}

uint64_t _swift_xpc_connection_termination_imminent()
{
  uint64_t v0;
  id v1;

  v0 = MEMORY[0x1E0C81288];
  v1 = MEMORY[0x1E0C81288];
  return v0;
}

id XPC_ERROR_PEER_CODE_SIGNING_REQUIREMENT.getter()
{
  return XPC_BOOL_TRUE.getter(_swift_xpc_connection_error_peer_code_signing_requirement);
}

id XPC_BOOL_TRUE.getter(uint64_t (*a1)(void))
{
  id result;

  result = (id)a1();
  if (!result)
    __break(1u);
  return result;
}

uint64_t _swift_xpc_connection_error_peer_code_signing_requirement()
{
  uint64_t v0;
  id v1;

  v0 = MEMORY[0x1E0C81278];
  v1 = MEMORY[0x1E0C81278];
  return v0;
}

uint64_t xpc_session_create_flags_t.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

XPC::xpc_session_create_flags_t __swiftcall xpc_session_create_flags_t.init(rawValue:)(XPC::xpc_session_create_flags_t rawValue)
{
  XPC::xpc_session_create_flags_t *v1;

  v1->_swift_shim = rawValue._swift_shim;
  return rawValue;
}

void static xpc_session_create_flags_t.none.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void static xpc_session_create_flags_t.privileged.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static xpc_session_create_flags_t.inactive.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

id xpc_session_create_xpc_service(_:_:_:_:)(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  return xpc_session_create_xpc_service(_:_:_:_:)(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, _QWORD))_swift_xpc_session_create_xpc_service_0);
}

xpc_session_t _swift_xpc_session_create_xpc_service_0(const char *a1, void *a2, xpc_session_create_flags_t a3, xpc_rich_error_t *a4)
{
  NSObject *v7;
  xpc_session_t xpc_service;

  v7 = a2;
  xpc_service = xpc_session_create_xpc_service(a1, v7, a3, a4);

  return xpc_service;
}

id xpc_session_create_mach_service(_:_:_:_:)(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  return xpc_session_create_xpc_service(_:_:_:_:)(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, _QWORD))_swift_xpc_session_create_mach_service_0);
}

id xpc_session_create_xpc_service(_:_:_:_:)(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, _QWORD))
{
  return (id)a5(a1, a2, *a3);
}

xpc_session_t _swift_xpc_session_create_mach_service_0(const char *a1, void *a2, xpc_session_create_flags_t a3, xpc_rich_error_t *a4)
{
  NSObject *v7;
  xpc_session_t mach_service;

  v7 = a2;
  mach_service = xpc_session_create_mach_service(a1, v7, a3, a4);

  return mach_service;
}

uint64_t xpc_session_set_incoming_message_handler(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return xpc_session_set_incoming_message_handler(_:_:)(a1, a2, a3, (uint64_t)&block_descriptor_1, (void (*)(uint64_t, void *))_swift_xpc_session_set_incoming_message_handler_0);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

void _swift_xpc_session_set_incoming_message_handler_0(void *a1, void *a2)
{
  _xpc_session_s *v3;
  id v4;

  v3 = a1;
  v4 = a2;
  xpc_session_set_incoming_message_handler(v3, v4);

}

uint64_t xpc_session_set_cancel_handler(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return xpc_session_set_incoming_message_handler(_:_:)(a1, a2, a3, (uint64_t)&block_descriptor_3, (void (*)(uint64_t, void *))_swift_xpc_session_set_cancel_handler_0);
}

uint64_t xpc_session_set_incoming_message_handler(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, void *))
{
  void *v7;
  _QWORD v9[6];

  v9[4] = a2;
  v9[5] = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
  v9[3] = a4;
  v7 = _Block_copy(v9);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  a5(a1, v7);
  _Block_release(v7);
  return swift_unknownObjectRelease();
}

void _swift_xpc_session_set_cancel_handler_0(void *a1, void *a2)
{
  _xpc_session_s *v3;
  id v4;

  v3 = a1;
  v4 = a2;
  xpc_session_set_cancel_handler(v3, v4);

}

BOOL xpc_session_activate(_:_:)(void *a1, xpc_rich_error_t *a2)
{
  return _swift_xpc_session_activate(a1, a2);
}

xpc_rich_error_t xpc_session_send_message(_:_:)(void *a1, void *a2)
{
  return _swift_xpc_session_send_message(a1, a2);
}

id xpc_session_send_message_with_reply_sync(_:_:_:)(void *a1, void *a2, xpc_rich_error_t *a3)
{
  return _swift_xpc_session_send_message_with_reply_sync(a1, a2, a3);
}

uint64_t xpc_session_send_message_with_reply_async(_:_:_:)(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  _QWORD v8[6];

  v8[4] = a3;
  v8[5] = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object?, @guaranteed OS_xpc_object?) -> ();
  v8[3] = &block_descriptor_6;
  v6 = _Block_copy(v8);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  _swift_xpc_session_send_message_with_reply_async(a1, a2, v6);
  _Block_release(v6);
  return swift_unknownObjectRelease();
}

void xpc_listener_copy_description(_:)()
{
  Swift::String v0;
  Swift::String v1;
  Swift::String v2;

  _StringGuts.grow(_:)(77);
  v0._countAndFlagsBits = 0x5041204320435058;
  v0._object = (void *)0xEA00000000002049;
  String.append(_:)(v0);
  v1._countAndFlagsBits = StaticString.description.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._object = (void *)0x80000001DF04F220;
  v2._countAndFlagsBits = 0xD000000000000041;
  String.append(_:)(v2);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void xpc_listener_create(_:_:_:_:_:)()
{
  Swift::String v0;
  Swift::String v1;
  Swift::String v2;

  _StringGuts.grow(_:)(77);
  v0._countAndFlagsBits = 0x5041204320435058;
  v0._object = (void *)0xEA00000000002049;
  String.append(_:)(v0);
  v1._countAndFlagsBits = StaticString.description.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._object = (void *)0x80000001DF04F220;
  v2._countAndFlagsBits = 0xD000000000000041;
  String.append(_:)(v2);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void xpc_listener_activate(_:_:)()
{
  Swift::String v0;
  Swift::String v1;
  Swift::String v2;

  _StringGuts.grow(_:)(77);
  v0._countAndFlagsBits = 0x5041204320435058;
  v0._object = (void *)0xEA00000000002049;
  String.append(_:)(v0);
  v1._countAndFlagsBits = StaticString.description.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._object = (void *)0x80000001DF04F220;
  v2._countAndFlagsBits = 0xD000000000000041;
  String.append(_:)(v2);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void xpc_listener_cancel(_:)()
{
  Swift::String v0;
  Swift::String v1;
  Swift::String v2;

  _StringGuts.grow(_:)(77);
  v0._countAndFlagsBits = 0x5041204320435058;
  v0._object = (void *)0xEA00000000002049;
  String.append(_:)(v0);
  v1._countAndFlagsBits = StaticString.description.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._object = (void *)0x80000001DF04F220;
  v2._countAndFlagsBits = 0xD000000000000041;
  String.append(_:)(v2);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void xpc_listener_reject_peer(_:_:)()
{
  Swift::String v0;
  Swift::String v1;
  Swift::String v2;

  _StringGuts.grow(_:)(77);
  v0._countAndFlagsBits = 0x5041204320435058;
  v0._object = (void *)0xEA00000000002049;
  String.append(_:)(v0);
  v1._countAndFlagsBits = StaticString.description.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._object = (void *)0x80000001DF04F220;
  v2._countAndFlagsBits = 0xD000000000000041;
  String.append(_:)(v2);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

id xpc_retain(_:)(void *a1)
{
  id result;

  result = _swift_xpc_retain(a1);
  if (!result)
    __break(1u);
  return result;
}

id _swift_xpc_retain(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  xpc_retain(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void _swift_xpc_release(void *a1)
{
  id v1;

  v1 = a1;
  xpc_release(v1);

}

unint64_t lazy protocol witness table accessor for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t;
  if (!lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for xpc_session_create_flags_t, &type metadata for xpc_session_create_flags_t);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t;
  if (!lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for xpc_session_create_flags_t, &type metadata for xpc_session_create_flags_t);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t;
  if (!lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for xpc_session_create_flags_t, &type metadata for xpc_session_create_flags_t);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t;
  if (!lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for xpc_session_create_flags_t, &type metadata for xpc_session_create_flags_t);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t);
  }
  return result;
}

ValueMetadata *type metadata accessor for xpc_session_create_flags_t()
{
  return &type metadata for xpc_session_create_flags_t;
}

ValueMetadata *type metadata accessor for xpc_listener_create_flags_t()
{
  return &type metadata for xpc_listener_create_flags_t;
}

uint64_t CodingMetadata.appending<A>(codingKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t inited;
  uint64_t *boxed_opaque_existential_1;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DF04A630;
  *(_QWORD *)(inited + 56) = a4;
  *(_QWORD *)(inited + 64) = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 32));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 16))(boxed_opaque_existential_1, a1, a4);
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((_QWORD *)inited);
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t Decoder.codingMetadata.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = MEMORY[0x1DF0F4658]();
  MEMORY[0x1DF0F4670](a1, a2);
  return v4;
}

uint64_t one-time initialization function for xpcCodable()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingUserInfoKey?);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for CodingUserInfoKey();
  __swift_allocate_value_buffer(v3, static CodingUserInfoKey.xpcCodable);
  v4 = __swift_project_value_buffer(v3, (uint64_t)static CodingUserInfoKey.xpcCodable);
  CodingUserInfoKey.init(rawValue:)();
  v5 = *(_QWORD *)(v3 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v3);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v4, v2, v3);
  __break(1u);
  return result;
}

uint64_t static CodingUserInfoKey.xpcCodable.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (one-time initialization token for xpcCodable != -1)
    swift_once();
  v2 = type metadata accessor for CodingUserInfoKey();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static CodingUserInfoKey.xpcCodable);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t destroy for CodingMetadata()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeBufferWithCopyOfBuffer for CodingMetadata(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for CodingMetadata(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for CodingMetadata(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CodingMetadata(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CodingMetadata(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CodingMetadata()
{
  return &type metadata for CodingMetadata;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t XPCDecoder.__allocating_init(userInfo:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t XPCDecoder.init(userInfo:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t static XPCDecoder.decode<A>(from:withCodingMetadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;

  type metadata accessor for _XPCDecoder();
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 40) = 0u;
  *(_OWORD *)(v10 + 56) = 0u;
  *(_QWORD *)(v10 + 72) = 0;
  *(_QWORD *)(v10 + 24) = a3;
  *(_QWORD *)(v10 + 32) = a1;
  *(_QWORD *)(v10 + 16) = a2;
  type metadata accessor for XPCCodableObjectRepresentableCache();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  if ((static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)(a4, a4) & 1) != 0)
  {
    _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>()(a4, a5);
    return swift_release();
  }
  else
  {
    lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, v11, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
    return dispatch thunk of Decodable.init(from:)();
  }
}

uint64_t XPCDecoder.decode<A>(_:from:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  type metadata accessor for XPCDecoder();
  v7 = (2 * *(_QWORD *)(a1 + 16)) | 1;
  type metadata accessor for DecodingBuffer();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a1;
  v8[3] = a1 + 32;
  v8[4] = 0;
  v8[5] = v7;
  v8[6] = 0;
  v9 = *(_QWORD *)(v3 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  static XPCDecoder.decode<A>(from:withCodingMetadata:)((uint64_t)v8, MEMORY[0x1E0DEE9D8], v9, a2, a3);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for XPCDecoder()
{
  return objc_opt_self();
}

uint64_t XPCDecoder.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t XPCDecoder.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t method lookup function for XPCDecoder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCDecoder.__allocating_init(userInfo:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of XPCDecoder.decode<A>(_:from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t _XPCDecoder.container<A>(keyedBy:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t result;
  uint64_t v19;
  _QWORD v20[3];
  _QWORD v21[3];
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  _UNKNOWN **v26;
  uint64_t v27;

  v8 = (uint64_t)(v3 + 5);
  swift_beginAccess();
  outlined init with copy of DecodingContainer?((uint64_t)(v3 + 5), (uint64_t)v21);
  v9 = v22;
  v27 = a3;
  if (v22)
  {
    v10 = v23;
    v11 = __swift_project_boxed_opaque_existential_1(v21, v22);
    *((_QWORD *)&v25 + 1) = v9;
    v26 = *(_UNKNOWN ***)(v10 + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v24);
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(boxed_opaque_existential_1, v11, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  }
  else
  {
    outlined destroy of DecodingContainer?((uint64_t)v21, &demangling cache variable for type metadata for DecodingContainer?);
    v24 = 0u;
    v25 = 0u;
    v26 = 0;
  }
  v14 = type metadata accessor for _XPCKeyedDecodingContainer(0, a1, a2, v13);
  v15 = v3[2];
  v16 = v3[3];
  v21[0] = v3[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v17 = static SharableStorageContainer.getExisting<A>(container:codingMetadata:initialStorage:)((uint64_t)v20, (uint64_t)&v24, v15, v16, (uint64_t)v21, v14, v14, (uint64_t)&protocol witness table for _XPCKeyedDecodingContainer<A>, (uint64_t)&protocol witness table for _XPCKeyedDecodingContainer<A>);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  result = outlined destroy of DecodingContainer?((uint64_t)&v24, &demangling cache variable for type metadata for CodingContainer?);
  if (!v4)
  {
    v19 = v20[0];
    if ((v17 & 1) != 0)
    {
      *((_QWORD *)&v25 + 1) = v14;
      v26 = &protocol witness table for _XPCKeyedDecodingContainer<A>;
      *(_QWORD *)&v24 = v20[0];
      outlined init with take of DecodingContainer?((uint64_t)&v24, (uint64_t)v21);
      swift_beginAccess();
      swift_retain();
      outlined assign with take of DecodingContainer?((uint64_t)v21, v8);
      swift_endAccess();
    }
    *(_QWORD *)&v24 = v19;
    MEMORY[0x1DF0F49E8](&protocol conformance descriptor for _XPCKeyedDecodingContainer<A>, v14);
    return KeyedDecodingContainer.init<A>(_:)();
  }
  return result;
}

uint64_t _XPCDecoder.unkeyedContainer()@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  char v12;
  uint64_t result;
  uint64_t v14;
  _QWORD v15[3];
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  _UNKNOWN **v21;

  v4 = (uint64_t)(v1 + 5);
  swift_beginAccess();
  outlined init with copy of DecodingContainer?((uint64_t)(v1 + 5), (uint64_t)v16);
  v5 = v17;
  if (v17)
  {
    v6 = v18;
    v7 = __swift_project_boxed_opaque_existential_1(v16, v17);
    *((_QWORD *)&v20 + 1) = v5;
    v21 = *(_UNKNOWN ***)(v6 + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v19);
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(boxed_opaque_existential_1, v7, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  else
  {
    outlined destroy of DecodingContainer?((uint64_t)v16, &demangling cache variable for type metadata for DecodingContainer?);
    v19 = 0u;
    v20 = 0u;
    v21 = 0;
  }
  v9 = v1[2];
  v10 = v1[3];
  v11 = (_QWORD *)v1[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v12 = specialized static SharableStorageContainer.getExisting<A>(container:codingMetadata:initialStorage:)(v15, (uint64_t)&v19, v9, v10, v11);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = outlined destroy of DecodingContainer?((uint64_t)&v19, &demangling cache variable for type metadata for CodingContainer?);
  if (!v2)
  {
    v14 = v15[0];
    if ((v12 & 1) != 0)
    {
      *((_QWORD *)&v20 + 1) = type metadata accessor for _XPCUnkeyedDecodingContainer();
      v21 = &protocol witness table for _XPCUnkeyedDecodingContainer;
      *(_QWORD *)&v19 = v14;
      outlined init with take of DecodingContainer?((uint64_t)&v19, (uint64_t)v16);
      swift_beginAccess();
      swift_retain();
      outlined assign with take of DecodingContainer?((uint64_t)v16, v4);
      swift_endAccess();
    }
    a1[3] = type metadata accessor for _XPCUnkeyedDecodingContainer();
    result = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCUnkeyedDecodingContainer and conformance _XPCUnkeyedDecodingContainer, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCUnkeyedDecodingContainer, (uint64_t)&protocol conformance descriptor for _XPCUnkeyedDecodingContainer);
    a1[4] = result;
    *a1 = v14;
  }
  return result;
}

uint64_t _XPCDecoder.singleValueContainer()@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v3 = v1[2];
  v4 = v1[3];
  v5 = v1[4];
  v6 = type metadata accessor for _XPCSingleValueDecodingContainer();
  v7 = (_QWORD *)swift_allocObject();
  v7[3] = v3;
  v7[4] = v4;
  v7[2] = v5;
  a1[3] = v6;
  a1[4] = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCSingleValueDecodingContainer and conformance _XPCSingleValueDecodingContainer, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCSingleValueDecodingContainer, (uint64_t)&protocol conformance descriptor for _XPCSingleValueDecodingContainer);
  *a1 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  Swift::UInt v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  Swift::String v24;
  Swift::String v25;
  Swift::String v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  Swift::String v30;
  Swift::String v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  Swift::String v35;
  Swift::String v36;
  Swift::String v37;
  Swift::String v38;
  Swift::String v39;
  uint64_t v40;
  void *v41;
  _QWORD *v42;
  uint64_t *boxed_opaque_existential_1;
  char v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t, uint64_t, uint64_t);
  _QWORD *v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v4 = v2;
  v7 = type metadata accessor for Optional();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v49 - v9;
  v11 = swift_conformsToProtocol2();
  if (v11)
    v12 = v11;
  else
    v12 = 0;
  if (v11)
    v13 = a1;
  else
    v13 = 0;
  if (!v13)
  {
    v60 = 0;
    v61 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    v60 = 0x6465746365707845;
    v61 = 0xE900000000000020;
    v30._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v30);
    swift_bridgeObjectRelease();
    v31._countAndFlagsBits = 0xD000000000000023;
    v31._object = (void *)0x80000001DF04F350;
    String.append(_:)(v31);
    v32 = type metadata accessor for DecodingError();
    swift_allocError();
    v34 = v33;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v32 - 8) + 104))(v34, *MEMORY[0x1E0DEC458], v32);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  v62 = type metadata accessor for _XPCDecoder();
  v63 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, v14, (uint64_t (*)(uint64_t))type metadata accessor for _XPCDecoder, (uint64_t)&protocol conformance descriptor for _XPCDecoder);
  v60 = v4;
  swift_retain();
  result = XPCCodableObject.init(from:)(&v60, (uint64_t *)&v57);
  if (!v3)
  {
    v53 = a2;
    v16 = v12;
    v17 = v57;
    v18 = *(void (**)(uint64_t, uint64_t))(v16 + 24);
    v56 = v16;
    v54 = v18;
    v19 = ((uint64_t (*)(uint64_t))v18)(v13);
    v55 = v17;
    v20 = MEMORY[0x1DF0F4CB8](v17);
    LOBYTE(v17) = specialized Set.contains(_:)(v20, v19);
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0)
    {
      v60 = 0;
      v61 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v35._countAndFlagsBits = 0x2065707954;
      v35._object = (void *)0xE500000000000000;
      String.append(_:)(v35);
      v36._countAndFlagsBits = _typeName(_:qualified:)();
      String.append(_:)(v36);
      swift_bridgeObjectRelease();
      v37._countAndFlagsBits = 0xD000000000000028;
      v37._object = (void *)0x80000001DF04E8A0;
      String.append(_:)(v37);
      v54(v13, v56);
      v38._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v38);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v39._countAndFlagsBits = 0xD00000000000001ELL;
      v39._object = (void *)0x80000001DF04E8D0;
      String.append(_:)(v39);
      *(_QWORD *)&v57 = MEMORY[0x1DF0F4CB8](v55);
      _print_unlocked<A, B>(_:_:)();
      v40 = v60;
      v41 = (void *)v61;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(a1, v40, v41, v42);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v64 = v55;
    v54 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
    v51 = type metadata accessor for Optional();
    v52 = &v49;
    v50 = *(_QWORD *)(v51 - 8);
    MEMORY[0x1E0C80A78](v51);
    v22 = (char *)&v49 - v21;
    swift_unknownObjectRetain();
    ((void (*)(uint64_t *, uint64_t, uint64_t))v54)(&v64, v13, v56);
    v23 = *(_QWORD *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v22, 1, v13) == 1)
    {
      (*(void (**)(char *, uint64_t))(v50 + 8))(v22, v51);
      v60 = 0;
      v61 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v24._object = (void *)0x80000001DF04E8F0;
      v24._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v24);
      v25._countAndFlagsBits = _typeName(_:qualified:)();
      String.append(_:)(v25);
      swift_bridgeObjectRelease();
      v26._countAndFlagsBits = 0x206D6F726620;
      v26._object = (void *)0xE600000000000000;
      String.append(_:)(v26);
      *(_QWORD *)&v57 = v55;
      _print_unlocked<A, B>(_:_:)();
      v27 = type metadata accessor for DecodingError();
      swift_allocError();
      v29 = v28;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v27 - 8) + 104))(v29, *MEMORY[0x1E0DEC458], v27);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    v58 = v13;
    v59 = v56;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v57);
    (*(void (**)(uint64_t *, char *, uint64_t))(v23 + 32))(boxed_opaque_existential_1, v22, v13);
    outlined init with take of Encodable(&v57, (uint64_t)&v60);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v60, (uint64_t)&v57);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    v44 = swift_dynamicCast();
    v45 = *(_QWORD *)(a1 - 8);
    v46 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v45 + 56);
    if ((v44 & 1) != 0)
    {
      v46(v10, 0, 1, a1);
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v45 + 32))(v53, v10, a1);
    }
    else
    {
      v46(v10, 1, 1, a1);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      type metadata accessor for DecodingError();
      swift_allocError();
      v48 = v47;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(a1, 0, (void *)0xE000000000000000, v48);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
    }
  }
  return result;
}

uint64_t _XPCDecoder.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  outlined destroy of DecodingContainer?(v0 + 40, &demangling cache variable for type metadata for DecodingContainer?);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for _XPCDecoder()
{
  return objc_opt_self();
}

uint64_t protocol witness for Decoder.userInfo.getter in conformance _XPCDecoder()
{
  return swift_bridgeObjectRetain();
}

uint64_t protocol witness for Decoder.container<A>(keyedBy:) in conformance _XPCDecoder@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return _XPCDecoder.container<A>(keyedBy:)(a1, a2, a3);
}

uint64_t protocol witness for Decoder.unkeyedContainer() in conformance _XPCDecoder@<X0>(_QWORD *a1@<X8>)
{
  return _XPCDecoder.unkeyedContainer()(a1);
}

uint64_t protocol witness for Decoder.singleValueContainer() in conformance _XPCDecoder@<X0>(_QWORD *a1@<X8>)
{
  return _XPCDecoder.singleValueContainer()(a1);
}

uint64_t outlined init with copy of DecodingContainer?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DecodingContainer?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of DecodingContainer?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DecodingContainer?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined assign with take of DecodingContainer?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DecodingContainer?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t XPCDictionary.init(_:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;

  result = MEMORY[0x1DF0F4CB8]();
  if (result == MEMORY[0x1E0C812F8])
    *a2 = a1;
  else
    __break(1u);
  return result;
}

uint64_t XPCDictionary.reply(_:)()
{
  uint64_t result;

  result = xpc_dictionary_expects_reply();
  if ((_DWORD)result)
    return xpc_dictionary_send_reply_4SWIFT();
  return result;
}

uint64_t _sSq7flatMapyqd_0_SgABxqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v6;
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
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, char *);
  uint64_t v29;

  v26 = a5;
  v27 = a2;
  v28 = a1;
  v29 = a6;
  v9 = *(_QWORD *)(a3 - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v13 + 16);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x1E0C80A78](v10);
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v20 = (char *)&v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v22);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1, v14) == 1)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 56))(v29, 1, 1, a4);
  v25 = a3;
  v24 = v26;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
  v28(v18, v12);
  result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  if (v6)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v24, v12, v25);
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
  v10 = MEMORY[0x1E0C80A78](a1);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v13 + 16);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x1E0C80A78](v10);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
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

uint64_t specialized String.withCString<A>(_:)(uint64_t a1, uint64_t a2, xpc_object_t *a3, uint64_t a4)
{
  const char *v6;
  char key[8];
  uint64_t v9;

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    return swift_bridgeObjectRelease();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
      v6 = (const char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v6 = (const char *)_StringObject.sharedUTF8.getter();
    xpc_dictionary_set_data(*a3, v6, (const void *)(a4 + 32), *(_QWORD *)(a4 + 16));
    return swift_bridgeObjectRelease();
  }
  *(_QWORD *)key = a1;
  v9 = a2 & 0xFFFFFFFFFFFFFFLL;
  xpc_dictionary_set_data(*a3, key, (const void *)(a4 + 32), *(_QWORD *)(a4 + 16));
  return swift_bridgeObjectRelease();
}

uint64_t specialized String.withCString<A>(_:)(uint64_t a1, uint64_t a2, _xpc_connection_s *a3, void **a4)
{
  const char *v6;
  uint64_t v8;
  void *v9;
  char key[8];
  uint64_t v11;

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    return swift_unknownObjectRelease();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
      v6 = (const char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v6 = (const char *)_StringObject.sharedUTF8.getter();
    closure #1 in XPCDictionary.subscript.setter(v6, a3, a4);
    return swift_unknownObjectRelease();
  }
  *(_QWORD *)key = a1;
  v11 = a2 & 0xFFFFFFFFFFFFFFLL;
  v8 = MEMORY[0x1DF0F4CB8](a3);
  v9 = *a4;
  if (v8 == MEMORY[0x1E0C812E0])
    xpc_dictionary_set_connection(v9, key, a3);
  else
    xpc_dictionary_set_value(v9, key, a3);
  return swift_unknownObjectRelease();
}

uint64_t specialized String.withCString<A>(_:)(uint64_t a1, uint64_t a2, xpc_object_t *a3, xpc_object_t value)
{
  const char *v6;
  char key[8];
  uint64_t v9;

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    return swift_unknownObjectRelease();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
      v6 = (const char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v6 = (const char *)_StringObject.sharedUTF8.getter();
    xpc_dictionary_set_value(*a3, v6, value);
    return swift_unknownObjectRelease();
  }
  *(_QWORD *)key = a1;
  v9 = a2 & 0xFFFFFFFFFFFFFFLL;
  xpc_dictionary_set_value(*a3, key, value);
  return swift_unknownObjectRelease();
}

{
  uint64_t v5;
  uint64_t v6;
  char key[8];
  uint64_t v9;

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    return swift_unknownObjectRelease();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
    {
      v5 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      v6 = a1 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      v5 = _StringObject.sharedUTF8.getter();
    }
    specialized closure #1 in _StringGuts.withCString<A>(_:)(v5, v6, (uint64_t (*)(void))partial apply for closure #1 in XPCDictionary.subscript.setter);
    return swift_unknownObjectRelease();
  }
  *(_QWORD *)key = a1;
  v9 = a2 & 0xFFFFFFFFFFFFFFLL;
  xpc_dictionary_set_value(*a3, key, value);
  return swift_unknownObjectRelease();
}

uint64_t specialized String.withCString<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void **a5)
{
  char *v8;
  char key[8];
  uint64_t v11;

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    return swift_bridgeObjectRelease();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
      v8 = (char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v8 = (char *)_StringObject.sharedUTF8.getter();
    closure #1 in XPCDictionary.subscript.setter(v8, a3, a4, a5);
    return swift_bridgeObjectRelease();
  }
  *(_QWORD *)key = a1;
  v11 = a2 & 0xFFFFFFFFFFFFFFLL;
  if (a4)
    specialized String.withCString<A>(_:)(a3, a4, a5, key);
  else
    xpc_dictionary_set_value(*a5, key, 0);
  return swift_bridgeObjectRelease();
}

void specialized String.withCString<A>(_:)(uint64_t a1, uint64_t a2, void **a3, char *key)
{
  const char *v6;
  void *v7;
  char string[8];
  uint64_t v9;

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
  }
  else
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      *(_QWORD *)string = a1;
      v9 = a2 & 0xFFFFFFFFFFFFFFLL;
      v7 = *a3;
      v6 = string;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
        v6 = (const char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v6 = (const char *)_StringObject.sharedUTF8.getter();
      v7 = *a3;
    }
    xpc_dictionary_set_string(v7, key, v6);
  }
}

uint64_t specialized String.withCString<A>(_:)@<X0>(xpc_object_t xdict@<X2>, uint64_t a2@<X0>, uint64_t a3@<X1>, _QWORD *a4@<X8>)
{
  char *v6;
  uint64_t result;
  xpc_object_t v8;
  xpc_object_t v9;
  char key[8];
  uint64_t v11;

  if ((a3 & 0x1000000000000000) != 0 || !(a3 & 0x2000000000000000 | a2 & 0x1000000000000000))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCDictionary?);
    _StringGuts._slowWithCString<A>(_:)();
    return swift_unknownObjectRelease();
  }
  if ((a3 & 0x2000000000000000) == 0)
  {
    if ((a2 & 0x1000000000000000) != 0)
      v6 = (char *)((a3 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v6 = (char *)_StringObject.sharedUTF8.getter();
    closure #1 in XPCDictionary.subscript.getter(v6, xdict, a4);
    return swift_unknownObjectRelease();
  }
  *(_QWORD *)key = a2;
  v11 = a3 & 0xFFFFFFFFFFFFFFLL;
  v8 = xpc_dictionary_get_dictionary(xdict, key);
  v9 = v8;
  if (v8 && (result = MEMORY[0x1DF0F4CB8](v8), result != MEMORY[0x1E0C812F8]))
  {
    __break(1u);
  }
  else
  {
    *a4 = v9;
    return swift_unknownObjectRelease();
  }
  return result;
}

{
  char *v6;
  uint64_t result;
  xpc_object_t v8;
  xpc_object_t v9;
  char key[8];
  uint64_t v11;

  if ((a3 & 0x1000000000000000) != 0 || !(a3 & 0x2000000000000000 | a2 & 0x1000000000000000))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCArray?);
    _StringGuts._slowWithCString<A>(_:)();
    return swift_unknownObjectRelease();
  }
  if ((a3 & 0x2000000000000000) == 0)
  {
    if ((a2 & 0x1000000000000000) != 0)
      v6 = (char *)((a3 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v6 = (char *)_StringObject.sharedUTF8.getter();
    closure #1 in XPCDictionary.subscript.getter(v6, xdict, a4);
    return swift_unknownObjectRelease();
  }
  *(_QWORD *)key = a2;
  v11 = a3 & 0xFFFFFFFFFFFFFFLL;
  v8 = xpc_dictionary_get_array(xdict, key);
  v9 = v8;
  if (v8 && (result = MEMORY[0x1DF0F4CB8](v8), result != MEMORY[0x1E0C812C8]))
  {
    __break(1u);
  }
  else
  {
    *a4 = v9;
    return swift_unknownObjectRelease();
  }
  return result;
}

xpc_object_t XPCDictionary.init()@<X0>(_QWORD *a1@<X8>)
{
  xpc_object_t result;

  result = xpc_dictionary_create_empty();
  *a1 = result;
  return result;
}

uint64_t XPCDictionary.withUnsafeUnderlyingDictionary<A>(_:)(uint64_t (*a1)(_QWORD))
{
  _QWORD *v1;

  return a1(*v1);
}

uint64_t XPCDictionary.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  _QWORD *v5;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v14;
  _QWORD v15[4];
  double v16[2];

  v15[2] = *v5;
  swift_unknownObjectRetain();
  v11 = specialized String.withCString<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr, _QWORD *))partial apply for closure #1 in XPCDictionary.subscript.getter, (uint64_t)v15, a1, a2);
  swift_unknownObjectRelease();
  if (!v11)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(a5, 1, 1, a3);
  v12 = MEMORY[0x1DF0F4CB8](v11);
  if (v12 == MEMORY[0x1E0C81328])
  {
    v16[0] = COERCE_DOUBLE(xpc_int64_get_value(v11));
    lazy protocol witness table accessor for type Int64 and conformance Int64();
  }
  else
  {
    if (v12 != MEMORY[0x1E0C81398])
    {
      if (v12 == MEMORY[0x1E0C81300])
      {
        v16[0] = xpc_double_get_value(v11);
        v14 = lazy protocol witness table accessor for type Double and conformance Double();
        MEMORY[0x1DF0F41A8](v16, MEMORY[0x1E0DEB070], v14, a3, a4);
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(a5, 1, 1, a3);
      }
      return swift_unknownObjectRelease();
    }
    v16[0] = COERCE_DOUBLE(xpc_uint64_get_value(v11));
    lazy protocol witness table accessor for type UInt64 and conformance UInt64();
  }
  dispatch thunk of Numeric.init<A>(exactly:)();
  return swift_unknownObjectRelease();
}

{
  _QWORD *v5;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  double v18[2];

  v17[2] = *v5;
  swift_unknownObjectRetain();
  v11 = specialized String.withCString<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr, _QWORD *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v17, a1, a2);
  swift_unknownObjectRelease();
  if (!v11)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(a5, 1, 1, a3);
  v12 = MEMORY[0x1DF0F4CB8](v11);
  if (v12 == MEMORY[0x1E0C81328])
  {
    v18[0] = COERCE_DOUBLE(xpc_int64_get_value(v11));
    v14 = *(_QWORD *)(a4 + 16);
    v15 = lazy protocol witness table accessor for type Int64 and conformance Int64();
    v16 = MEMORY[0x1E0DEDC60];
  }
  else
  {
    if (v12 != MEMORY[0x1E0C81398])
    {
      if (v12 == MEMORY[0x1E0C81300])
      {
        v18[0] = xpc_double_get_value(v11);
        lazy protocol witness table accessor for type Double and conformance Double();
        dispatch thunk of BinaryFloatingPoint.init<A>(exactly:)();
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(a5, 1, 1, a3);
      }
      return swift_unknownObjectRelease();
    }
    v18[0] = COERCE_DOUBLE(xpc_uint64_get_value(v11));
    v14 = *(_QWORD *)(a4 + 16);
    v15 = lazy protocol witness table accessor for type UInt64 and conformance UInt64();
    v16 = MEMORY[0x1E0DEE190];
  }
  MEMORY[0x1DF0F3FB0](v18, v16, v15, a3, v14);
  return swift_unknownObjectRelease();
}

_QWORD *XPCDictionary.subscript.getter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD v4[4];

  v4[2] = *v2;
  return specialized String.withCString<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr, _QWORD *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v4, a1, a2);
}

{
  _QWORD *v2;
  _QWORD *v5;
  _QWORD v7[4];

  v7[2] = *v2;
  swift_unknownObjectRetain();
  v5 = specialized String.withCString<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr, _QWORD *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v7, a1, a2);
  swift_unknownObjectRelease();
  return v5;
}

{
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *result;
  int64_t v7;
  _BYTE v8[16];
  uint64_t v9;
  int64_t *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *v2;
  v7 = 0;
  v9 = v3;
  v10 = &v7;
  v4 = specialized String.withCString<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr, _QWORD *))partial apply for closure #1 in XPCDictionary.subscript.getter, (uint64_t)v8, a1, a2);
  result = 0;
  if (v7 >= 1 && v4 != 0)
    return specialized _copyCollectionToContiguousArray<A>(_:)(v4, v7);
  return result;
}

{
  uint64_t *v2;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  int64_t v9;
  _BYTE v10[16];
  uint64_t v11;
  int64_t *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = *v2;
  v9 = 0;
  v11 = v5;
  v12 = &v9;
  swift_unknownObjectRetain();
  v6 = specialized String.withCString<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr, _QWORD *))partial apply for closure #1 in XPCDictionary.subscript.getter, (uint64_t)v10, a1, a2);
  if (v9 >= 1 && v6)
  {
    v7 = specialized _copyCollectionToContiguousArray<A>(_:)(v6, v9);
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    return 0;
  }
  return v7;
}

uint64_t XPCDictionary.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return XPCDictionary.subscript.setter(a1, a2, a3, a4, a5, (void (*)(char *, char *))partial apply for implicit closure #1 in XPCArray.subscript.setter, MEMORY[0x1E0DEDC60], MEMORY[0x1E0C86568]);
}

{
  return XPCDictionary.subscript.setter(a1, a2, a3, a4, a5, (void (*)(char *, char *))partial apply for implicit closure #1 in XPCArray.subscript.setter, MEMORY[0x1E0DEE190], MEMORY[0x1E0C867B0]);
}

{
  uint64_t v6;

  specialized XPCDictionary.subscript.setter(a1, a2, a3, a4, a5);
  v6 = type metadata accessor for Optional();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
}

uint64_t XPCDictionary.subscript.setter(_xpc_connection_s *a1, uint64_t a2, uint64_t a3)
{
  void **v3;

  if (a1)
  {
    swift_unknownObjectRetain();
    specialized String.withCString<A>(_:)(a2, a3, a1, v3);
    swift_unknownObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

void (*XPCDictionary.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t **a1, char a2)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;

  v11 = malloc(0x48uLL);
  *a1 = v11;
  v11[3] = a5;
  v11[4] = v5;
  v11[1] = a3;
  v11[2] = a4;
  *v11 = a2;
  v12 = type metadata accessor for Optional();
  v11[5] = v12;
  v13 = *(_QWORD *)(v12 - 8);
  v11[6] = v13;
  v14 = *(_QWORD *)(v13 + 64);
  v11[7] = malloc(v14);
  v11[8] = malloc(v14);
  XPCDictionary.subscript.getter(a2, a3, a4, a5);
  return XPCDictionary.subscript.modify;
}

{
  uint64_t v5;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;

  v11 = malloc(0x48uLL);
  *a1 = v11;
  v11[3] = a5;
  v11[4] = v5;
  v11[1] = a3;
  v11[2] = a4;
  *v11 = a2;
  v12 = type metadata accessor for Optional();
  v11[5] = v12;
  v13 = *(_QWORD *)(v12 - 8);
  v11[6] = v13;
  v14 = *(_QWORD *)(v13 + 64);
  v11[7] = malloc(v14);
  v11[8] = malloc(v14);
  XPCDictionary.subscript.getter(a2, a3, a4, a5);
  return XPCDictionary.subscript.modify;
}

{
  uint64_t v5;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  void *v15;

  v11 = malloc(0x48uLL);
  *a1 = v11;
  v11[3] = a5;
  v11[4] = v5;
  v11[1] = a3;
  v11[2] = a4;
  *v11 = a2;
  v12 = type metadata accessor for Optional();
  v11[5] = v12;
  v13 = *(_QWORD *)(v12 - 8);
  v11[6] = v13;
  v14 = *(_QWORD *)(v13 + 64);
  v11[7] = malloc(v14);
  v15 = malloc(v14);
  v11[8] = v15;
  XPCDictionary.subscript.getter(a2, a3, a4, a5, (uint64_t)v15);
  return XPCDictionary.subscript.modify;
}

void XPCDictionary.subscript.modify(uint64_t **a1, char a2)
{
  XPCDictionary.subscript.modify(a1, a2, (void (*)(char *, char *))partial apply for implicit closure #1 in XPCArray.subscript.setter, MEMORY[0x1E0DEDC60], MEMORY[0x1E0C86568]);
}

{
  XPCDictionary.subscript.modify(a1, a2, (void (*)(char *, char *))partial apply for implicit closure #1 in XPCArray.subscript.setter, MEMORY[0x1E0DEE190], MEMORY[0x1E0C867B0]);
}

{
  uint64_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void *, uint64_t);

  v2 = *a1;
  v3 = (void *)(*a1)[7];
  v4 = (void *)(*a1)[8];
  v5 = (*a1)[5];
  v6 = (*a1)[6];
  v7 = (*a1)[3];
  v9 = (*a1)[1];
  v8 = (*a1)[2];
  v10 = **a1;
  if ((a2 & 1) != 0)
  {
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[7], v4, v5);
    swift_bridgeObjectRetain();
    specialized XPCDictionary.subscript.setter((uint64_t)v3, v10, v9, v8, v7);
    v11 = *(void (**)(void *, uint64_t))(v6 + 8);
    v11(v3, v5);
  }
  else
  {
    swift_bridgeObjectRetain();
    specialized XPCDictionary.subscript.setter((uint64_t)v4, v10, v9, v8, v7);
    v11 = *(void (**)(void *, uint64_t))(v6 + 8);
  }
  v11(v4, v5);
  free(v4);
  free(v3);
  free(v2);
}

{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;
  uint64_t v8;

  v3 = *a1;
  v4 = (*a1)[3];
  v6 = **a1;
  v5 = (*a1)[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v7 = (void **)v3[4];
  v8 = v3[2];
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    specialized String.withCString<A>(_:)(v8, v4, v6, v5, v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    specialized String.withCString<A>(_:)(v3[2], v4, v6, v5, (void **)v3[4]);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  free(v3);
}

{
  uint64_t *v2;
  uint64_t v3;
  xpc_object_t *v4;
  uint64_t v5;
  uint64_t v6;
  xpc_object_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *a1;
  v3 = **a1;
  if ((a2 & 1) != 0)
  {
    if (v3)
    {
      v4 = (xpc_object_t *)v2[4];
      v6 = v2[2];
      v5 = v2[3];
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      specialized String.withCString<A>(_:)(v6, v5, v4, v3);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    goto LABEL_6;
  }
  if (v3)
  {
    v7 = (xpc_object_t *)v2[4];
    v9 = v2[2];
    v8 = v2[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    specialized String.withCString<A>(_:)(v9, v8, v7, v3);
    swift_bridgeObjectRelease();
LABEL_6:
    swift_bridgeObjectRelease();
  }
  free(v2);
}

{
  uint64_t *v2;
  uint64_t v3;
  void *v4;
  _xpc_connection_s *v5;
  _xpc_connection_s *v6;
  void **v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _xpc_connection_s *v11;
  _xpc_connection_s *v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *a1;
  v3 = **a1;
  if ((a2 & 1) != 0)
  {
    if (!v3)
    {
LABEL_8:
      swift_unknownObjectRelease();
      goto LABEL_9;
    }
    swift_bridgeObjectRetain();
    v4 = (void *)swift_unknownObjectRetain();
    v5 = (_xpc_connection_s *)xpc_copy(v4);
    if (v5)
    {
      v6 = v5;
      v7 = (void **)v2[3];
      v9 = v2[1];
      v8 = v2[2];
      swift_unknownObjectRelease();
      swift_unknownObjectRetain();
      specialized String.withCString<A>(_:)(v9, v8, v6, v7);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      goto LABEL_8;
    }
    __break(1u);
  }
  else
  {
    if (!v3)
    {
LABEL_9:
      free(v2);
      return;
    }
    swift_bridgeObjectRetain();
    v10 = (void *)swift_unknownObjectRetain();
    v11 = (_xpc_connection_s *)xpc_copy(v10);
    if (v11)
    {
      v12 = v11;
      v13 = (void **)v2[3];
      v15 = v2[1];
      v14 = v2[2];
      swift_unknownObjectRelease_n();
      swift_unknownObjectRetain();
      specialized String.withCString<A>(_:)(v15, v14, v12, v13);
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
  }
  __break(1u);
}

uint64_t XPCDictionary.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;

  v9 = *(_QWORD *)(a4 + 8);
  swift_unknownObjectRetain();
  XPCDictionary.subscript.getter(a1, a2, a3, v9, a5);
  return swift_unknownObjectRelease();
}

{
  swift_unknownObjectRetain();
  XPCDictionary.subscript.getter(a1, a2, a3, a4, a5);
  return swift_unknownObjectRelease();
}

uint64_t key path getter for XPCDictionary.subscript<A>(_:) : <A>XPCDictionaryA(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(uint64_t *)((char *)a2 + a3 - 16);
  v6 = *(uint64_t *)((char *)a2 + a3 - 8);
  v7 = *a2;
  v8 = a2[1];
  swift_unknownObjectRetain();
  a4(v7, v8, v5, v6);
  return swift_unknownObjectRelease();
}

uint64_t XPCDictionary.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(char *, char *), uint64_t a7, uint64_t (*a8)(uint64_t))
{
  uint64_t v9;

  specialized XPCDictionary.subscript.setter(a1, a2, a3, a4, a5, a6, a7, a8);
  v9 = type metadata accessor for Optional();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
}

void XPCDictionary.subscript.modify(uint64_t **a1, char a2, void (*a3)(char *, char *), uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(void *, uint64_t);

  v5 = *a1;
  v6 = (void *)(*a1)[7];
  v7 = (void *)(*a1)[8];
  v8 = (*a1)[5];
  v9 = (*a1)[6];
  v10 = (*a1)[3];
  v11 = (*a1)[1];
  v12 = (*a1)[2];
  v13 = **a1;
  if ((a2 & 1) != 0)
  {
    (*(void (**)(uint64_t, void *, uint64_t))(v9 + 16))((*a1)[7], v7, v8);
    swift_bridgeObjectRetain();
    specialized XPCDictionary.subscript.setter((uint64_t)v6, v13, v11, v12, v10, a3, a4, a5);
    v14 = *(void (**)(void *, uint64_t))(v9 + 8);
    v14(v6, v8);
  }
  else
  {
    swift_bridgeObjectRetain();
    specialized XPCDictionary.subscript.setter((uint64_t)v7, v13, v11, v12, v10, a3, a4, a5);
    v14 = *(void (**)(void *, uint64_t))(v9 + 8);
  }
  v14(v7, v8);
  free(v7);
  free(v6);
  free(v5);
}

uint64_t XPCDictionary.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(uint64_t, uint64_t)@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t *v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;

  v20 = a4;
  v21 = a3;
  v22 = a7;
  v12 = type metadata accessor for Optional();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v20 - v14;
  v23 = *v7;
  swift_unknownObjectRetain();
  XPCDictionary.subscript.getter(a1, a2, a5, a6, (uint64_t)v15);
  swift_unknownObjectRelease();
  v16 = *(_QWORD *)(a5 - 8);
  v17 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v15, 1, a5);
  if ((_DWORD)v17 != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v16 + 32))(v22, v15, a5);
  v21(v17, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t XPCDictionary.subscript.getter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 value;
  _QWORD v11[4];

  v11[2] = *v2;
  swift_unknownObjectRetain();
  v5 = specialized String.withCString<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr, _QWORD *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v11, a1, a2);
  if (v5 && (v6 = v5, v7 = MEMORY[0x1DF0F4CB8](), v8 = MEMORY[0x1E0C812D0], swift_unknownObjectRelease(), v7 == v8))
  {
    value = xpc_BOOL_get_value(v6);
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    return 2;
  }
  return value;
}

{
  uint64_t *v2;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t value;
  _QWORD v12[4];

  v5 = *v2;
  swift_unknownObjectRetain();
  v12[2] = v5;
  swift_unknownObjectRetain();
  v6 = specialized String.withCString<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr, _QWORD *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v12, a1, a2);
  if (v6)
  {
    v7 = v6;
    v8 = MEMORY[0x1DF0F4CB8]();
    v9 = MEMORY[0x1E0C812D0];
    swift_unknownObjectRelease();
    if (v8 == v9)
    {
      value = xpc_BOOL_get_value(v7);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      return 2;
    }
  }
  else
  {
    value = 2;
    swift_unknownObjectRelease_n();
  }
  return value;
}

{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[4];

  v8[2] = *v2;
  swift_unknownObjectRetain();
  specialized String.withCString<A>(_:)((void (*)(__int128 *__return_ptr, _QWORD *))partial apply for closure #1 in XPCDictionary.subscript.getter, (uint64_t)v8, a1, a2);
  v6 = v5;
  swift_unknownObjectRelease();
  return v6;
}

_QWORD *XPCDictionary.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v7;
  _QWORD v9[4];

  v9[2] = *v3;
  swift_unknownObjectRetain();
  v7 = specialized String.withCString<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr, _QWORD *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v9, a1, a2);
  swift_unknownObjectRelease();
  if (v7 && MEMORY[0x1DF0F4CB8](v7) != a3)
  {
    swift_unknownObjectRelease();
    return 0;
  }
  return v7;
}

uint64_t key path getter for XPCDictionary.subscript(_:) : XPCDictionary@<X0>(uint64_t *a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t result;

  v3 = *a1;
  v4 = a1[1];
  swift_unknownObjectRetain();
  v5 = XPCDictionary.subscript.getter(v3, v4);
  result = swift_unknownObjectRelease();
  *a2 = v5;
  return result;
}

unsigned __int8 *key path setter for XPCDictionary.subscript(_:) : XPCDictionary(unsigned __int8 *result, void **a2, uint64_t *a3)
{
  int v3;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  _xpc_connection_s *v8;

  v3 = *result;
  if (v3 != 2)
  {
    v6 = *a3;
    v5 = a3[1];
    v7 = v3 & 1;
    swift_bridgeObjectRetain();
    v8 = (_xpc_connection_s *)xpc_BOOL_create(v7);
    swift_unknownObjectRetain();
    specialized String.withCString<A>(_:)(v6, v5, v8, a2);
    swift_unknownObjectRelease();
    return (unsigned __int8 *)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t XPCDictionary.subscript.setter(char a1, uint64_t a2, uint64_t a3)
{
  void **v3;
  _xpc_connection_s *v6;

  if (a1 != 2)
  {
    v6 = (_xpc_connection_s *)xpc_BOOL_create(a1 & 1);
    swift_unknownObjectRetain();
    specialized String.withCString<A>(_:)(a2, a3, v6, v3);
    swift_unknownObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t (*XPCDictionary.subscript.modify(uint64_t a1, uint64_t a2, uint64_t a3))(uint64_t result)
{
  uint64_t v3;

  *(_QWORD *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)a1 = a2;
  *(_BYTE *)(a1 + 24) = XPCDictionary.subscript.getter(a2, a3);
  return XPCDictionary.subscript.modify;
}

uint64_t XPCDictionary.subscript.modify(uint64_t result)
{
  int v1;
  uint64_t v2;
  void **v3;
  BOOL v4;
  uint64_t v5;
  _xpc_connection_s *v6;

  v1 = *(unsigned __int8 *)(result + 24);
  if (v1 != 2)
  {
    v2 = *(_QWORD *)(result + 8);
    v3 = *(void ***)(result + 16);
    v4 = v1 & 1;
    v5 = *(_QWORD *)result;
    swift_bridgeObjectRetain();
    v6 = (_xpc_connection_s *)xpc_BOOL_create(v4);
    swift_unknownObjectRetain();
    specialized String.withCString<A>(_:)(v5, v2, v6, v3);
    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t XPCDictionary.subscript.getter(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t *v3;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char value;
  _QWORD v15[4];

  v7 = *v3;
  swift_unknownObjectRetain();
  v15[2] = v7;
  swift_unknownObjectRetain();
  v8 = specialized String.withCString<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr, _QWORD *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v15, a1, a2);
  if (v8)
  {
    v9 = v8;
    v10 = MEMORY[0x1DF0F4CB8]();
    v11 = MEMORY[0x1E0C812D0];
    swift_unknownObjectRelease();
    if (v10 == v11)
    {
      value = xpc_BOOL_get_value(v9);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      return value & 1;
    }
    swift_unknownObjectRelease();
    v12 = swift_unknownObjectRelease();
  }
  else
  {
    v12 = swift_unknownObjectRelease_n();
  }
  value = a3(v12);
  return value & 1;
}

uint64_t XPCDictionary.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  void **v3;
  void *v7;

  v7 = *v3;
  swift_unknownObjectRetain();
  return specialized String.withCString<A>(_:)(v7, a1, a2, a3);
}

{
  void **v3;
  void *v7;

  v7 = *v3;
  swift_unknownObjectRetain();
  return specialized String.withCString<A>(_:)(v7, a1, a2, a3);
}

xpc_object_t closure #1 in XPCDictionary.subscript.getter@<X0>(char *key@<X0>, xpc_object_t xdict@<X1>, _QWORD *a3@<X8>)
{
  xpc_object_t result;
  xpc_object_t v5;

  result = xpc_dictionary_get_dictionary(xdict, key);
  v5 = result;
  if (result && (result = (xpc_object_t)MEMORY[0x1DF0F4CB8](result), result != (xpc_object_t)MEMORY[0x1E0C812F8]))
    __break(1u);
  else
    *a3 = v5;
  return result;
}

{
  xpc_object_t result;
  xpc_object_t v5;

  result = xpc_dictionary_get_array(xdict, key);
  v5 = result;
  if (result && (result = (xpc_object_t)MEMORY[0x1DF0F4CB8](result), result != (xpc_object_t)MEMORY[0x1E0C812C8]))
    __break(1u);
  else
    *a3 = v5;
  return result;
}

uint64_t key path getter for XPCDictionary.subscript(_:) : XPCDictionary@<X0>(void **a1@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v4 = *a1;
  v5 = *a2;
  v6 = a2[1];
  swift_unknownObjectRetain();
  result = specialized String.withCString<A>(_:)(v4, v5, v6, &v8);
  *a3 = v8;
  return result;
}

uint64_t key path setter for XPCDictionary.subscript(_:) : XPCDictionary(void **a1, xpc_object_t *a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = *a3;
  v5 = a3[1];
  v6 = *a1;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  specialized String.withCString<A>(_:)(v4, v5, a2, v6);
  return swift_bridgeObjectRelease();
}

uint64_t XPCDictionary.subscript.setter(void **a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t *v3;
  void *v6;

  v6 = *a1;
  swift_unknownObjectRetain();
  specialized String.withCString<A>(_:)(a2, a3, v3, v6);
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

void (*XPCDictionary.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(void ***a1, char a2)
{
  void **v3;
  _QWORD *v7;
  void *v8;

  v7 = malloc(0x28uLL);
  *a1 = v7;
  v7[2] = a3;
  v7[3] = v3;
  v7[1] = a2;
  v8 = *v3;
  swift_unknownObjectRetain_n();
  specialized String.withCString<A>(_:)(v8, a2, a3, v7);
  v7[4] = 0;
  swift_unknownObjectRelease();
  return XPCDictionary.subscript.modify;
}

void XPCDictionary.subscript.modify(void ***a1, char a2)
{
  void **v3;
  uint64_t v4;
  void *v5;
  xpc_object_t *v6;
  uint64_t v7;

  v3 = *a1;
  v4 = (uint64_t)(*a1)[2];
  v5 = **a1;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  v6 = (xpc_object_t *)v3[3];
  v7 = (uint64_t)v3[1];
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRetain();
    specialized String.withCString<A>(_:)(v7, v4, v6, v5);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    specialized String.withCString<A>(_:)((uint64_t)v3[1], v4, (xpc_object_t *)v3[3], v5);
    swift_bridgeObjectRelease();
  }
  swift_unknownObjectRelease();
  free(v3);
}

xpc_object_t partial apply for closure #1 in XPCDictionary.subscript.getter@<X0>(char *key@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  xpc_object_t result;

  result = xpc_dictionary_get_value(*(xpc_object_t *)(v2 + 16), key);
  *a2 = result;
  return result;
}

uint64_t key path getter for XPCDictionary.subscript(_:) : XPCDictionary@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;
  _QWORD v8[4];

  v4 = *a2;
  v5 = a2[1];
  v8[2] = *a1;
  swift_unknownObjectRetain();
  v6 = specialized String.withCString<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr, _QWORD *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v8, v4, v5);
  result = swift_unknownObjectRelease();
  *a3 = v6;
  return result;
}

{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  _QWORD v11[4];

  v4 = *a2;
  v5 = a2[1];
  v11[2] = *a1;
  swift_unknownObjectRetain();
  specialized String.withCString<A>(_:)((void (*)(__int128 *__return_ptr, _QWORD *))partial apply for closure #1 in XPCDictionary.subscript.getter, (uint64_t)v11, v4, v5);
  v7 = v6;
  v9 = v8;
  result = swift_unknownObjectRelease();
  *a3 = v7;
  a3[1] = v9;
  return result;
}

_xpc_connection_s **key path setter for XPCDictionary.subscript(_:) : XPCDictionary(_xpc_connection_s **result, void **a2, uint64_t *a3)
{
  _xpc_connection_s *v3;
  uint64_t v5;
  uint64_t v6;

  v3 = *result;
  if (*result)
  {
    v5 = *a3;
    v6 = a3[1];
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    specialized String.withCString<A>(_:)(v5, v6, v3, a2);
    return (_xpc_connection_s **)swift_bridgeObjectRelease();
  }
  return result;
}

void closure #1 in XPCDictionary.subscript.setter(const char *a1, _xpc_connection_s *a2, void **a3)
{
  uint64_t v6;
  void *v7;

  v6 = MEMORY[0x1DF0F4CB8](a2);
  v7 = *a3;
  if (v6 == MEMORY[0x1E0C812E0])
    xpc_dictionary_set_connection(v7, a1, a2);
  else
    xpc_dictionary_set_value(v7, a1, a2);
}

void (*XPCDictionary.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(_xpc_connection_s ***a1, char a2)
{
  _QWORD *v3;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD v10[4];

  v7 = malloc(0x28uLL);
  *a1 = v7;
  v7[2] = a3;
  v7[3] = v3;
  v7[1] = a2;
  v10[2] = *v3;
  swift_unknownObjectRetain();
  v8 = specialized String.withCString<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr, _QWORD *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v10, a2, a3);
  v7[4] = 0;
  swift_unknownObjectRelease();
  *v7 = v8;
  return XPCDictionary.subscript.modify;
}

void XPCDictionary.subscript.modify(_xpc_connection_s ***a1, char a2)
{
  _xpc_connection_s **v2;
  _xpc_connection_s *v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *a1;
  v3 = **a1;
  if ((a2 & 1) != 0)
  {
    if (v3)
    {
      v4 = (void **)v2[3];
      v6 = (uint64_t)v2[1];
      v5 = (uint64_t)v2[2];
      swift_unknownObjectRetain_n();
      swift_bridgeObjectRetain();
      specialized String.withCString<A>(_:)(v6, v5, v3, v4);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
    goto LABEL_6;
  }
  if (v3)
  {
    v7 = (void **)v2[3];
    v9 = (uint64_t)v2[1];
    v8 = (uint64_t)v2[2];
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    specialized String.withCString<A>(_:)(v9, v8, v3, v7);
    swift_bridgeObjectRelease();
LABEL_6:
    swift_unknownObjectRelease();
  }
  free(v2);
}

double XPCDictionary.subscript.getter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD v4[4];

  v4[2] = *v2;
  return specialized String.withCString<A>(_:)((void (*)(__int128 *__return_ptr, _QWORD *))partial apply for closure #1 in XPCDictionary.subscript.getter, (uint64_t)v4, a1, a2);
}

uint64_t closure #1 in XPCDictionary.subscript.getter@<X0>(char *key@<X0>, xpc_object_t xdict@<X1>, _QWORD *a3@<X8>)
{
  uint64_t result;
  uint64_t v5;

  result = (uint64_t)xpc_dictionary_get_string(xdict, key);
  if (result)
    result = String.init(cString:)();
  else
    v5 = 0;
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t key path setter for XPCDictionary.subscript(_:) : XPCDictionary(uint64_t *a1, void **a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a3;
  v5 = a3[1];
  v6 = *a1;
  v7 = a1[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized String.withCString<A>(_:)(v4, v5, v6, v7, a2);
  return swift_bridgeObjectRelease();
}

uint64_t XPCDictionary.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void **v4;

  swift_bridgeObjectRetain();
  specialized String.withCString<A>(_:)(a3, a4, a1, a2, v4);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void closure #1 in XPCDictionary.subscript.setter(char *key, uint64_t a2, uint64_t a3, void **a4)
{
  if (a3)
    specialized String.withCString<A>(_:)(a2, a3, a4, key);
  else
    xpc_dictionary_set_value(*a4, key, 0);
}

void (*XPCDictionary.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  _QWORD *v3;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];

  v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[3] = a3;
  v7[4] = v3;
  v7[2] = a2;
  v13[2] = *v3;
  swift_unknownObjectRetain();
  specialized String.withCString<A>(_:)((void (*)(__int128 *__return_ptr, _QWORD *))partial apply for closure #1 in XPCDictionary.subscript.getter, (uint64_t)v13, a2, a3);
  v9 = v8;
  v11 = v10;
  v7[5] = 0;
  swift_unknownObjectRelease();
  *v7 = v9;
  v7[1] = v11;
  return XPCDictionary.subscript.modify;
}

{
  uint64_t *v3;
  _QWORD *v7;
  _QWORD *v8;
  int64_t v9;
  _QWORD *v10;
  _BYTE v12[16];
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[1] = 0;
  v7[3] = a3;
  v7[4] = v3;
  v7[2] = a2;
  v13 = *v3;
  v14 = v7 + 1;
  swift_unknownObjectRetain();
  v8 = specialized String.withCString<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr, _QWORD *))partial apply for closure #1 in XPCDictionary.subscript.getter, (uint64_t)v12, a2, a3);
  v7[5] = 0;
  v9 = v7[1];
  if (v9 >= 1 && v8)
  {
    v10 = specialized _copyCollectionToContiguousArray<A>(_:)(v8, v9);
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    v10 = 0;
  }
  *v7 = v10;
  return XPCDictionary.subscript.modify;
}

{
  _QWORD *v3;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  void (*result)(uint64_t **, char);
  void (*v11)(uint64_t **, char);
  _QWORD v12[4];

  v7 = malloc(0x28uLL);
  *a1 = v7;
  v7[2] = a3;
  v7[3] = v3;
  v7[1] = a2;
  v12[2] = *v3;
  swift_unknownObjectRetain();
  v8 = specialized String.withCString<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr, _QWORD *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v12, a2, a3);
  v7[4] = 0;
  if (!v8)
  {
    swift_unknownObjectRelease();
    v11 = 0;
    goto LABEL_6;
  }
  v9 = v8;
  swift_getObjectType();
  result = (void (*)(uint64_t **, char))OS_xpc_object.isCodable()();
  if ((result & 1) != 0)
  {
    result = (void (*)(uint64_t **, char))xpc_copy(v9);
    if (result)
    {
      v11 = result;
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
LABEL_6:
      *v7 = v11;
      return XPCDictionary.subscript.modify;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

const void *closure #1 in XPCDictionary.subscript.getter@<X0>(char *key@<X0>, xpc_object_t xdict@<X1>, size_t *a3@<X2>, _QWORD *a4@<X8>)
{
  const void *result;

  result = xpc_dictionary_get_data(xdict, key, a3);
  *a4 = result;
  return result;
}

uint64_t key path getter for XPCDictionary.subscript(_:) : XPCDictionary@<X0>(uint64_t *a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t result;

  v3 = *a1;
  v4 = a1[1];
  swift_unknownObjectRetain();
  v5 = XPCDictionary.subscript.getter(v3, v4);
  result = swift_unknownObjectRelease();
  *a2 = v5;
  return result;
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = *a1;
  v4 = a1[1];
  swift_unknownObjectRetain();
  XPCDictionary.subscript.getter(v3, v4, &v6);
  result = swift_unknownObjectRelease();
  *a2 = v6;
  return result;
}

uint64_t *key path setter for XPCDictionary.subscript(_:) : XPCDictionary(uint64_t *result, xpc_object_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v3 = *result;
  if (*result)
  {
    v5 = *a3;
    v6 = a3[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    specialized String.withCString<A>(_:)(v5, v6, a2, v3);
    return (uint64_t *)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t XPCDictionary.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t *v3;

  if (a1)
  {
    swift_bridgeObjectRetain();
    specialized String.withCString<A>(_:)(a2, a3, v3, a1);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t XPCDictionary.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  _QWORD *v3;
  _QWORD *v7;
  uint64_t result;
  uint64_t v9;
  _QWORD v10[4];

  v10[2] = *v3;
  swift_unknownObjectRetain();
  v7 = specialized String.withCString<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr, _QWORD *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v10, a1, a2);
  result = swift_unknownObjectRelease();
  if (!v7)
  {
    v9 = 0;
    goto LABEL_6;
  }
  swift_getObjectType();
  result = OS_xpc_object.isCodable()();
  if ((result & 1) != 0)
  {
    result = (uint64_t)xpc_copy(v7);
    if (result)
    {
      v9 = result;
      result = swift_unknownObjectRelease();
LABEL_6:
      *a3 = v9;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

{
  _QWORD *v3;
  _QWORD *v7;
  void *v8;
  uint64_t result;
  uint64_t v10;
  _QWORD v11[4];

  v11[2] = *v3;
  swift_unknownObjectRetain();
  v7 = specialized String.withCString<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr, _QWORD *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v11, a1, a2);
  if (!v7)
  {
    result = swift_unknownObjectRelease();
    v10 = 0;
    goto LABEL_6;
  }
  v8 = v7;
  swift_getObjectType();
  result = OS_xpc_object.isCodable()();
  if ((result & 1) != 0)
  {
    result = (uint64_t)xpc_copy(v8);
    if (result)
    {
      v10 = result;
      swift_unknownObjectRelease();
      result = swift_unknownObjectRelease();
LABEL_6:
      *a3 = v10;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

_xpc_connection_s *key path setter for XPCDictionary.subscript(_:) : XPCDictionary(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v3 = *a3;
  v4 = a3[1];
  v6 = *a1;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  return XPCDictionary.subscript.setter(&v6, v3, v4);
}

_xpc_connection_s *XPCDictionary.subscript.setter(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void **v3;
  void *v6;
  _xpc_connection_s *result;
  _xpc_connection_s *v8;

  if (!*a1)
    return (_xpc_connection_s *)swift_bridgeObjectRelease();
  v6 = (void *)swift_unknownObjectRetain();
  result = (_xpc_connection_s *)xpc_copy(v6);
  if (result)
  {
    v8 = result;
    swift_unknownObjectRelease_n();
    swift_unknownObjectRetain();
    specialized String.withCString<A>(_:)(a2, a3, v8, v3);
    swift_unknownObjectRelease();
    return (_xpc_connection_s *)swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t XPCDictionary.copy(into:)(uint64_t *a1)
{
  void **v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t result;
  _QWORD v8[6];

  v2 = *a1;
  v3 = *v1;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v2;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = partial apply for closure #1 in XPCDictionary.copy(into:);
  *(_QWORD *)(v5 + 24) = v4;
  v8[4] = partial apply for thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@unowned Bool);
  v8[5] = v5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = thunk for @escaping @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@unowned Bool);
  v8[3] = &block_descriptor_2;
  v6 = _Block_copy(v8);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  xpc_dictionary_apply(v3, v6);
  _Block_release(v6);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v3 & 1) != 0)
    __break(1u);
  return result;
}

_QWORD *XPCDictionary.removeValue(forKey:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD v4[4];

  v4[2] = *v2;
  return specialized String.withCString<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr, _QWORD *))partial apply for closure #1 in XPCDictionary.removeValue(forKey:), (uint64_t)v4, a1, a2);
}

BOOL XPCDictionary.isEmpty.getter()
{
  xpc_object_t *v0;

  return xpc_dictionary_get_count(*v0) == 0;
}

size_t XPCDictionary.count.getter()
{
  xpc_object_t *v0;

  return xpc_dictionary_get_count(*v0);
}

uint64_t XPCDictionary.forEach(_:)(uint64_t a1, uint64_t a2)
{
  void **v2;
  uint64_t v3;
  void *v6;
  uint64_t v7;
  uint64_t result;
  char isEscapingClosureAtFileLocation;

  v6 = *v2;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  closure #1 in XPCDictionary.forEach(_:)((uint64_t)partial apply for thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error), v7, v6);
  if (v3)
    return swift_release();
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

{
  void **v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t result;
  char isEscapingClosureAtFileLocation;
  _QWORD v8[4];

  v8[3] = a2;
  v4 = *v2;
  v8[2] = a1;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error)partial apply;
  *(_QWORD *)(v5 + 24) = v8;
  closure #1 in XPCDictionary.forEach(_:)((uint64_t)thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error)partial apply, v5, v4);
  if (v3)
    return swift_release();
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

uint64_t closure #1 in XPCDictionary.forEach(_:)(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t result;
  id v10;
  _QWORD aBlock[6];
  id v12;

  v12 = 0;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = &v12;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = partial apply for closure #1 in closure #1 in XPCDictionary.forEach(_:);
  *(_QWORD *)(v7 + 24) = v6;
  aBlock[4] = thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@unowned Bool)partial apply;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@unowned Bool);
  aBlock[3] = &block_descriptor_84;
  v8 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  xpc_dictionary_apply(a3, v8);
  _Block_release(v8);
  LOBYTE(a3) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((a3 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    if (v12)
    {
      v10 = v12;
      swift_willThrow();

    }
    return swift_release();
  }
  return result;
}

uint64_t closure #1 in closure #1 in XPCDictionary.forEach(_:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4;

  v4 = String.init(cString:)();
  a3(v4);
  swift_bridgeObjectRelease();
  return 1;
}

char *specialized XPCDictionary.map<A>(_:)(uint64_t a1, uint64_t a2, xpc_object_t xdict)
{
  uint64_t v3;
  int64_t count;
  char *v8;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *result;
  char isEscapingClosureAtFileLocation;
  _QWORD v16[11];
  char *v17;

  count = xpc_dictionary_get_count(xdict);
  v8 = (char *)MEMORY[0x1E0DEE9D8];
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || count > *((_QWORD *)v8 + 3) >> 1)
  {
    if (*((_QWORD *)v8 + 2) <= count)
      v10 = count;
    else
      v10 = *((_QWORD *)v8 + 2);
    isUniquelyReferenced_nonNull_native = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v10, 0, v8);
    v8 = isUniquelyReferenced_nonNull_native;
  }
  v17 = v8;
  v11 = MEMORY[0x1E0C80A78](isUniquelyReferenced_nonNull_native);
  v16[6] = &v17;
  v16[7] = a1;
  v16[8] = a2;
  MEMORY[0x1E0C80A78](v11);
  v16[2] = partial apply for specialized closure #1 in XPCDictionary.map<A>(_:);
  v16[3] = v12;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error)partial apply;
  *(_QWORD *)(v13 + 24) = v16;
  closure #1 in XPCDictionary.forEach(_:)((uint64_t)thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error)partial apply, v13, xdict);
  if (v3)
  {
    swift_release();
    return (char *)swift_bridgeObjectRelease();
  }
  else
  {
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    result = (char *)swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
    else
      return v17;
  }
  return result;
}

uint64_t specialized XPCDictionary.map<A>(_:)(uint64_t a1, uint64_t a2, xpc_object_t xdict)
{
  uint64_t v3;
  size_t count;
  uint64_t v8;
  uint64_t result;
  char isEscapingClosureAtFileLocation;
  _QWORD v11[4];
  char v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = MEMORY[0x1E0DEE9D8];
  count = xpc_dictionary_get_count(xdict);
  specialized Array._reserveCapacityImpl(minimumCapacity:growForAppend:)(count, 0);
  specialized Array._endMutation()();
  v13 = &v16;
  v14 = a1;
  v15 = a2;
  v11[2] = partial apply for specialized closure #1 in XPCDictionary.map<A>(_:);
  v11[3] = &v12;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error)partial apply;
  *(_QWORD *)(v8 + 24) = v11;
  closure #1 in XPCDictionary.forEach(_:)((uint64_t)thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error)partial apply, v8, xdict);
  if (v3)
  {
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
    else
      return v16;
  }
  return result;
}

uint64_t XPCDictionary.map<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void **v3;
  uint64_t v4;
  void *v8;
  size_t count;
  uint64_t v10;
  uint64_t result;
  char isEscapingClosureAtFileLocation;
  _QWORD v13[4];
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v8 = *v3;
  v19 = Array.init()();
  count = xpc_dictionary_get_count(v8);
  type metadata accessor for Array();
  Array.reserveCapacity(_:)(count);
  v15 = a3;
  v16 = &v19;
  v17 = a1;
  v18 = a2;
  v13[2] = partial apply for closure #1 in XPCDictionary.map<A>(_:);
  v13[3] = &v14;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error)partial apply;
  *(_QWORD *)(v10 + 24) = v13;
  closure #1 in XPCDictionary.forEach(_:)((uint64_t)thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error)partial apply, v10, v8);
  if (v4)
  {
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
    else
      return v19;
  }
  return result;
}

uint64_t specialized closure #1 in XPCDictionary.map<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, _QWORD *(*a5)(_QWORD *__return_ptr))
{
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD v14[2];

  result = (uint64_t)a5(v14);
  if (!v5)
  {
    v8 = v14[0];
    v9 = v14[1];
    v10 = *a4;
    result = swift_isUniquelyReferenced_nonNull_native();
    *a4 = v10;
    if ((result & 1) == 0)
    {
      result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v10 + 16) + 1, 1, (char *)v10);
      v10 = result;
      *a4 = result;
    }
    v12 = *(_QWORD *)(v10 + 16);
    v11 = *(_QWORD *)(v10 + 24);
    if (v12 >= v11 >> 1)
    {
      result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1, (char *)v10);
      v10 = result;
      *a4 = result;
    }
    *(_QWORD *)(v10 + 16) = v12 + 1;
    v13 = v10 + 16 * v12;
    *(_QWORD *)(v13 + 32) = v8;
    *(_QWORD *)(v13 + 40) = v9;
  }
  return result;
}

_QWORD *specialized closure #1 in XPCDictionary.map<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *(*a5)(uint64_t *__return_ptr))
{
  uint64_t v5;
  _QWORD *result;
  uint64_t v8;

  result = a5(&v8);
  if (!v5)
  {
    MEMORY[0x1DF0F40AC](result);
    if (*(_QWORD *)((*a4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*a4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    return (_QWORD *)specialized Array._endMutation()();
  }
  return result;
}

uint64_t closure #1 in XPCDictionary.map<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t result;

  v2 = MEMORY[0x1E0C80A78](a1);
  result = v3(v2);
  if (!v1)
  {
    type metadata accessor for Array();
    return Array.append(_:)();
  }
  return result;
}

char *XPCDictionary.keys.getter()
{
  xpc_object_t *v0;

  return specialized XPCDictionary.map<A>(_:)((uint64_t)specialized implicit closure #1 in XPCDictionary.keys.getter, 0, *v0);
}

uint64_t specialized implicit closure #1 in XPCDictionary.keys.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  return swift_bridgeObjectRetain();
}

uint64_t XPCDictionary.values.getter()
{
  xpc_object_t *v0;

  return specialized XPCDictionary.map<A>(_:)((uint64_t)specialized implicit closure #1 in XPCDictionary.values.getter, 0, *v0);
}

uint64_t specialized implicit closure #1 in XPCDictionary.values.getter@<X0>(uint64_t a1@<X2>, _QWORD *a2@<X8>)
{
  *a2 = a1;
  return swift_unknownObjectRetain();
}

xpc_object_t XPCDictionary.createReply()@<X0>(_QWORD *a1@<X8>)
{
  xpc_object_t *v1;
  xpc_object_t result;
  xpc_object_t v4;

  result = xpc_dictionary_create_reply(*v1);
  v4 = result;
  if (result && (result = (xpc_object_t)MEMORY[0x1DF0F4CB8](result), result != (xpc_object_t)MEMORY[0x1E0C812F8]))
    __break(1u);
  else
    *a1 = v4;
  return result;
}

Swift::Void __swiftcall XPCDictionary.sendReply()()
{
  xpc_dictionary_send_reply();
}

BOOL static XPCDictionary.== infix(_:_:)(xpc_object_t *a1, xpc_object_t *a2)
{
  return xpc_equal(*a1, *a2);
}

void XPCDictionary.hash(into:)()
{
  xpc_object_t *v0;
  size_t v1;

  v1 = xpc_hash(*v0);
  Hasher._combine(_:)(v1);
}

Swift::Int XPCDictionary.hashValue.getter()
{
  void **v0;
  void *v1;
  size_t v2;

  v1 = *v0;
  Hasher.init(_seed:)();
  v2 = xpc_hash(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t XPCDictionary.debugDescription.getter()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;

  v1 = (void *)MEMORY[0x1DF0F4BB0](*v0);
  v2 = String.init(cString:)();
  free(v1);
  return v2;
}

void closure #1 in XPCDictionary.subscript.setter(char *key, xpc_object_t *a2, void *a3)
{
  xpc_dictionary_set_value(*a2, key, a3);
}

uint64_t XPCDictionary.auditToken.getter()
{
  xpc_dictionary_get_audit_token();
  return 0;
}

uint64_t specialized closure #1 in _StringGuts.withCString<A>(_:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t specialized Array._reserveCapacityImpl(minimumCapacity:growForAppend:)(uint64_t a1, char a2)
{
  uint64_t *v2;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *v2;
  result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v2 = v5;
  v7 = 0;
  if ((result & 1) != 0 && (v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    if (a1 <= *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1)
      return result;
    v7 = 1;
  }
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 <= a1)
    v9 = a1;
  else
    v9 = v8;
  result = MEMORY[0x1DF0F4220](v7, v9, a2 & 1, v5);
  *v2 = result;
  return result;
}

uint64_t specialized XPCDictionary.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(char *, char *), uint64_t a7, uint64_t (*a8)(uint64_t))
{
  void **v8;
  void **v12;
  uint64_t v15;
  _xpc_connection_s *v16;
  _QWORD v18[6];
  uint64_t v19;
  char v20;

  v12 = v8;
  v18[2] = a4;
  v18[3] = a5;
  type metadata accessor for Optional();
  _sSq7flatMapyqd_0_SgABxqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF(a6, (uint64_t)v18, MEMORY[0x1E0DEDCE8], a7, v15, (uint64_t)&v19);
  if ((v20 & 1) == 0)
  {
    v16 = (_xpc_connection_s *)a8(v19);
    swift_unknownObjectRetain();
    specialized String.withCString<A>(_:)(a2, a3, v16, v12);
    swift_unknownObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t specialized XPCDictionary.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void **v5;
  void **v6;
  uint64_t v9;
  uint64_t v10;
  _xpc_connection_s *v11;
  _QWORD v13[5];
  _xpc_connection_s *v14;

  v6 = v5;
  v13[2] = a4;
  v13[3] = a5;
  type metadata accessor for Optional();
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for OS_xpc_object);
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in XPCArray.subscript.setter, (uint64_t)v13, MEMORY[0x1E0DEDCE8], v9, v10, (uint64_t)&v14);
  v11 = v14;
  if (v14)
  {
    swift_unknownObjectRetain();
    specialized String.withCString<A>(_:)(a2, a3, v11, v6);
    swift_unknownObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t partial apply for closure #1 in XPCDictionary.subscript.getter@<X0>(char *a1@<X0>, _QWORD *a2@<X8>)
{
  return partial apply for closure #1 in XPCDictionary.subscript.getter(a1, a2);
}

const void *partial apply for closure #1 in XPCDictionary.subscript.getter@<X0>(char *a1@<X0>, _QWORD *a2@<X8>)
{
  return partial apply for closure #1 in XPCDictionary.subscript.getter(a1, a2);
}

const void *partial apply for closure #1 in XPCDictionary.subscript.getter@<X0>(char *key@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  const void *result;

  result = xpc_dictionary_get_data(*(xpc_object_t *)(v2 + 16), key, *(size_t **)(v2 + 24));
  *a2 = result;
  return result;
}

uint64_t sub_1DF03B02C()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in XPCDictionary.copy(into:)(char *key, xpc_object_t value)
{
  uint64_t v2;

  xpc_dictionary_set_value(*(xpc_object_t *)(v2 + 16), key, value);
  return 1;
}

uint64_t sub_1DF03B074()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

void partial apply for closure #1 in XPCDictionary.removeValue(forKey:)(char *key@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  void *v5;
  xpc_object_t v6;

  v5 = *(void **)(v2 + 16);
  v6 = xpc_dictionary_get_value(v5, key);
  xpc_dictionary_set_value(v5, key, 0);
  *a2 = v6;
}

uint64_t sub_1DF03B104()
{
  return swift_deallocObject();
}

uint64_t sub_1DF03B114()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in XPCDictionary.map<A>(_:)(uint64_t a1)
{
  return closure #1 in XPCDictionary.map<A>(_:)(a1);
}

uint64_t sub_1DF03B140()
{
  return swift_deallocObject();
}

unint64_t lazy protocol witness table accessor for type XPCDictionary and conformance XPCDictionary()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type XPCDictionary and conformance XPCDictionary;
  if (!lazy protocol witness table cache variable for type XPCDictionary and conformance XPCDictionary)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for XPCDictionary, &type metadata for XPCDictionary);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCDictionary and conformance XPCDictionary);
  }
  return result;
}

uint64_t sub_1DF03B198(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return key path getter for XPCDictionary.subscript<A>(_:) : <A>XPCDictionaryA(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))XPCDictionary.subscript.getter);
}

uint64_t sub_1DF03B1B4(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (void (*)(char *, char *))partial apply for implicit closure #1 in XPCArray.subscript.setter, MEMORY[0x1E0DEDC60], MEMORY[0x1E0C86568]);
}

uint64_t sub_1DF03B1D0()
{
  return 16;
}

__n128 sub_1DF03B1DC(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_1DF03B1E8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return key path getter for XPCDictionary.subscript<A>(_:) : <A>XPCDictionaryA(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))XPCDictionary.subscript.getter);
}

uint64_t sub_1DF03B204(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (void (*)(char *, char *))partial apply for implicit closure #1 in XPCArray.subscript.setter, MEMORY[0x1E0DEE190], MEMORY[0x1E0C867B0]);
}

uint64_t keypath_setTm(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, void (*a5)(char *, char *), uint64_t a6, uint64_t (*a7)(uint64_t))
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v11 = *(uint64_t *)((char *)a3 + a4 - 16);
  v12 = *(uint64_t *)((char *)a3 + a4 - 8);
  v13 = *a3;
  v14 = a3[1];
  swift_bridgeObjectRetain();
  return specialized XPCDictionary.subscript.setter(a1, v13, v14, v11, v12, a5, a6, a7);
}

uint64_t sub_1DF03B2A4()
{
  return 16;
}

__n128 sub_1DF03B2B0(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_1DF03B2BC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return key path getter for XPCDictionary.subscript<A>(_:) : <A>XPCDictionaryA(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))XPCDictionary.subscript.getter);
}

uint64_t sub_1DF03B2D8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(uint64_t *)((char *)a3 + a4 - 16);
  v6 = *(uint64_t *)((char *)a3 + a4 - 8);
  v7 = *a3;
  v8 = a3[1];
  swift_bridgeObjectRetain();
  return specialized XPCDictionary.subscript.setter(a1, v7, v8, v5, v6);
}

uint64_t sub_1DF03B334()
{
  return 16;
}

__n128 sub_1DF03B340(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_1DF03B354()
{
  return 0;
}

uint64_t sub_1DF03B36C()
{
  return 0;
}

uint64_t sub_1DF03B384()
{
  return 0;
}

uint64_t sub_1DF03B39C()
{
  return 0;
}

uint64_t sub_1DF03B3B4()
{
  return 0;
}

uint64_t sub_1DF03B3CC()
{
  return 0;
}

ValueMetadata *type metadata accessor for XPCDictionary()
{
  return &type metadata for XPCDictionary;
}

uint64_t partial apply for closure #1 in XPCDictionary.subscript.getter@<X0>(char *key@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = (uint64_t)xpc_dictionary_get_string(*(xpc_object_t *)(v2 + 16), key);
  if (result)
    result = String.init(cString:)();
  else
    v5 = 0;
  *a2 = result;
  a2[1] = v5;
  return result;
}

_QWORD *partial apply for specialized closure #1 in XPCDictionary.map<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return specialized closure #1 in XPCDictionary.map<A>(_:)(a1, a2, a3, *(_QWORD **)(v3 + 16), *(_QWORD *(**)(uint64_t *__return_ptr))(v3 + 24));
}

uint64_t sub_1DF03B44C()
{
  return swift_deallocObject();
}

uint64_t partial apply for specialized closure #1 in XPCDictionary.map<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return specialized closure #1 in XPCDictionary.map<A>(_:)(a1, a2, a3, *(uint64_t **)(v3 + 16), *(_QWORD *(**)(_QWORD *__return_ptr))(v3 + 24));
}

uint64_t sub_1DF03B478()
{
  return swift_deallocObject();
}

uint64_t sub_1DF03B488()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in XPCDictionary.forEach(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return closure #1 in closure #1 in XPCDictionary.forEach(_:)(a1, a2, *(void (**)(uint64_t))(v2 + 16));
}

uint64_t sub_1DF03B4B8()
{
  return swift_deallocObject();
}

void partial apply for closure #1 in XPCDictionary.subscript.setter(char *key)
{
  uint64_t v1;

  xpc_dictionary_set_data(**(xpc_object_t **)(v1 + 16), key, (const void *)(*(_QWORD *)(v1 + 24) + 32), *(_QWORD *)(*(_QWORD *)(v1 + 24) + 16));
}

{
  uint64_t v1;

  xpc_dictionary_set_value(**(xpc_object_t **)(v1 + 16), key, *(xpc_object_t *)(v1 + 24));
}

void partial apply for closure #1 in closure #1 in XPCDictionary.subscript.setter(char *string)
{
  uint64_t v1;

  xpc_dictionary_set_string(**(xpc_object_t **)(v1 + 16), *(const char **)(v1 + 24), string);
}

xpc_object_t partial apply for closure #1 in XPCDictionary.subscript.getter@<X0>(char *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return closure #1 in XPCDictionary.subscript.getter(a1, *(xpc_object_t *)(v2 + 16), a2);
}

{
  uint64_t v2;

  return closure #1 in XPCDictionary.subscript.getter(a1, *(xpc_object_t *)(v2 + 16), a2);
}

void partial apply for closure #1 in XPCDictionary.subscript.setter(const char *a1)
{
  uint64_t v1;

  closure #1 in XPCDictionary.subscript.setter(a1, *(_xpc_connection_s **)(v1 + 16), *(void ***)(v1 + 24));
}

xpc_object_t closure #1 in XPCDictionary.subscript.getterpartial apply@<X0>(char *a1@<X0>, _QWORD *a2@<X8>)
{
  return partial apply for closure #1 in XPCDictionary.subscript.getter(a1, a2);
}

uint64_t dispatch thunk of DecodingContainer.init(codingMetadata:buffer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

_QWORD *static DecodingContainer.decodeType(from:withCodingMetadata:)(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  Swift::String v24;
  void *v25;
  Swift::String v26;
  Swift::String v27;
  _QWORD *v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  void *v31;

  v5 = result[4];
  v6 = result[5] >> 1;
  v7 = v6 - v5;
  if (__OFSUB__(v6, v5))
  {
    __break(1u);
    goto LABEL_20;
  }
  v9 = result;
  v10 = result[6];
  if (v10 >= v7)
  {
    v18 = _typeName(_:qualified:)();
    v20 = v19;
    v21 = type metadata accessor for DecodingError();
    swift_allocError();
    v23 = v22;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(31);
    swift_bridgeObjectRelease();
    v24._countAndFlagsBits = v18;
    v24._object = v20;
    String.append(_:)(v24);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, *MEMORY[0x1E0DEC458], v21);
LABEL_17:
    swift_bridgeObjectRelease();
    return (_QWORD *)swift_willThrow();
  }
  v11 = __OFADD__(v5, v10);
  v12 = v5 + v10;
  if (v11)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (v12 < v5 || v12 >= v6)
    goto LABEL_21;
  v14 = *(unsigned __int8 *)(result[3] + v12);
  v15 = *(_QWORD *)(a5 + 8);
  v29 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8);
  result = (_QWORD *)v29(a4, v15);
  if (v14 != ((_BYTE)result + 1))
  {
    v30 = dispatch thunk of CustomStringConvertible.description.getter();
    v31 = v25;
    v26._countAndFlagsBits = 540877088;
    v26._object = (void *)0xE400000000000000;
    String.append(_:)(v26);
    v29(a4, v15);
    v27._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v27);
    swift_bridgeObjectRelease();
    type metadata accessor for DecodingError();
    swift_allocError();
    typeMismatchError(codingMetadata:type:message:)(a4, v30, v31, v28);
    goto LABEL_17;
  }
  v16 = v9[6];
  if (v16 < v7)
  {
    v17 = v5 + v16;
    if (!__OFADD__(v5, v16))
    {
      if (v17 >= v5 && v17 < v6)
      {
        v9[6] = v16 + 1;
        return result;
      }
      goto LABEL_23;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
  }
  return result;
}

uint64_t specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t *boxed_opaque_existential_1;
  _BYTE v6[40];
  uint64_t v7[5];
  _QWORD v8[5];

  v2 = MEMORY[0x1E0DEAFA0];
  v8[3] = MEMORY[0x1E0DEAFA0];
  v8[4] = &protocol witness table for Bool;
  LOBYTE(v8[0]) = a1;
  v3 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x1E0DEAFA0]);
  v7[3] = v2;
  v7[4] = (uint64_t)&protocol witness table for Bool;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(boxed_opaque_existential_1, v3, v2);
  outlined init with take of EncodingContainer?((uint64_t)v7, (uint64_t)v6);
  swift_beginAccess();
  outlined assign with take of EncodingContainer?((uint64_t)v6, v1 + 32);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t *boxed_opaque_existential_1;
  _BYTE v7[40];
  uint64_t v8[5];
  _QWORD v9[5];

  v3 = MEMORY[0x1E0DEA968];
  v9[3] = MEMORY[0x1E0DEA968];
  v9[4] = &protocol witness table for String;
  v9[0] = a1;
  v9[1] = a2;
  v4 = __swift_project_boxed_opaque_existential_1(v9, MEMORY[0x1E0DEA968]);
  v8[3] = v3;
  v8[4] = (uint64_t)&protocol witness table for String;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v8);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(boxed_opaque_existential_1, v4, v3);
  outlined init with take of EncodingContainer?((uint64_t)v8, (uint64_t)v7);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  outlined assign with take of EncodingContainer?((uint64_t)v7, v2 + 32);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
}

uint64_t specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(double a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t *boxed_opaque_existential_1;
  _BYTE v6[40];
  uint64_t v7[5];
  _QWORD v8[5];

  v2 = MEMORY[0x1E0DEB070];
  v8[3] = MEMORY[0x1E0DEB070];
  v8[4] = &protocol witness table for Double;
  *(double *)v8 = a1;
  v3 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x1E0DEB070]);
  v7[3] = v2;
  v7[4] = (uint64_t)&protocol witness table for Double;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(boxed_opaque_existential_1, v3, v2);
  outlined init with take of EncodingContainer?((uint64_t)v7, (uint64_t)v6);
  swift_beginAccess();
  outlined assign with take of EncodingContainer?((uint64_t)v6, v1 + 32);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(float a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t *boxed_opaque_existential_1;
  _BYTE v6[40];
  uint64_t v7[5];
  _QWORD v8[5];

  v2 = MEMORY[0x1E0DEB188];
  v8[3] = MEMORY[0x1E0DEB188];
  v8[4] = &protocol witness table for Float;
  *(float *)v8 = a1;
  v3 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x1E0DEB188]);
  v7[3] = v2;
  v7[4] = (uint64_t)&protocol witness table for Float;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(boxed_opaque_existential_1, v3, v2);
  outlined init with take of EncodingContainer?((uint64_t)v7, (uint64_t)v6);
  swift_beginAccess();
  outlined assign with take of EncodingContainer?((uint64_t)v6, v1 + 32);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(char a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v9;
  uint64_t v10;
  uint64_t *boxed_opaque_existential_1;
  _BYTE v13[40];
  uint64_t v14[5];
  _QWORD v15[5];

  v15[3] = a2;
  v15[4] = a3;
  LOBYTE(v15[0]) = a1;
  v9 = __swift_project_boxed_opaque_existential_1(v15, a2);
  v10 = *a4;
  v14[3] = a2;
  v14[4] = v10;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v14);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)a5 + 16))(boxed_opaque_existential_1, v9, a2);
  outlined init with take of EncodingContainer?((uint64_t)v14, (uint64_t)v13);
  swift_beginAccess();
  outlined assign with take of EncodingContainer?((uint64_t)v13, v5 + 32);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
}

uint64_t specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(__int16 a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v9;
  uint64_t v10;
  uint64_t *boxed_opaque_existential_1;
  _BYTE v13[40];
  uint64_t v14[5];
  _QWORD v15[5];

  v15[3] = a2;
  v15[4] = a3;
  LOWORD(v15[0]) = a1;
  v9 = __swift_project_boxed_opaque_existential_1(v15, a2);
  v10 = *a4;
  v14[3] = a2;
  v14[4] = v10;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v14);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)a5 + 16))(boxed_opaque_existential_1, v9, a2);
  outlined init with take of EncodingContainer?((uint64_t)v14, (uint64_t)v13);
  swift_beginAccess();
  outlined assign with take of EncodingContainer?((uint64_t)v13, v5 + 32);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
}

uint64_t specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(int a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v9;
  uint64_t v10;
  uint64_t *boxed_opaque_existential_1;
  _BYTE v13[40];
  uint64_t v14[5];
  _QWORD v15[5];

  v15[3] = a2;
  v15[4] = a3;
  LODWORD(v15[0]) = a1;
  v9 = __swift_project_boxed_opaque_existential_1(v15, a2);
  v10 = *a4;
  v14[3] = a2;
  v14[4] = v10;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v14);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)a5 + 16))(boxed_opaque_existential_1, v9, a2);
  outlined init with take of EncodingContainer?((uint64_t)v14, (uint64_t)v13);
  swift_beginAccess();
  outlined assign with take of EncodingContainer?((uint64_t)v13, v5 + 32);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
}

uint64_t specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v9;
  uint64_t v10;
  uint64_t *boxed_opaque_existential_1;
  _BYTE v13[40];
  uint64_t v14[5];
  _QWORD v15[5];

  v15[3] = a2;
  v15[4] = a3;
  v15[0] = a1;
  v9 = __swift_project_boxed_opaque_existential_1(v15, a2);
  v10 = *a4;
  v14[3] = a2;
  v14[4] = v10;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v14);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)a5 + 16))(boxed_opaque_existential_1, v9, a2);
  outlined init with take of EncodingContainer?((uint64_t)v14, (uint64_t)v13);
  swift_beginAccess();
  outlined assign with take of EncodingContainer?((uint64_t)v13, v5 + 32);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
}

uint64_t _XPCSingleValueEncodingContainer.encode<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  ValueMetadata *v11;
  _UNKNOWN **v12;
  _QWORD *v13;
  uint64_t *boxed_opaque_existential_1;
  uint64_t result;
  _BYTE v17[40];
  __int128 v18;
  __int128 v19;
  void *v20;
  __int128 v21;
  ValueMetadata *v22;
  _UNKNOWN **v23;

  v5 = v3;
  MEMORY[0x1E0C80A78](a1);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v10 + 16))(v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0) + 22, a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if (swift_dynamicCast())
  {
    outlined init with take of Encodable(&v18, (uint64_t)&v21);
    v11 = v22;
    v12 = v23;
    v13 = __swift_project_boxed_opaque_existential_1(&v21, (uint64_t)v22);
    *((_QWORD *)&v19 + 1) = v11;
    v20 = v12[2];
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v18);
    (*((void (**)(uint64_t *, _QWORD *, ValueMetadata *))v11[-1].Description + 2))(boxed_opaque_existential_1, v13, v11);
    outlined init with take of EncodingContainer?((uint64_t)&v18, (uint64_t)v17);
    swift_beginAccess();
    outlined assign with take of EncodingContainer?((uint64_t)v17, v5 + 32);
    swift_endAccess();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v21);
  }
  v20 = 0;
  v18 = 0u;
  v19 = 0u;
  outlined destroy of DecodingContainer?((uint64_t)&v18, &demangling cache variable for type metadata for CodingPrimitive?);
  if ((static OptionalPrimitive.isOptionalPrimitive<A>(_:)(a1) & 1) != 0)
  {
    type metadata accessor for XPCEncoder();
    result = static XPCEncoder.encode<A>(_:withCodingMetadata:)(a1, *(_QWORD *)(v5 + 16), *(_QWORD *)(v5 + 24), a2, a3, (uint64_t)&v21);
    if (v4)
      return result;
    outlined init with take of Encodable(&v21, (uint64_t)&v18);
    outlined init with take of EncodingContainer?((uint64_t)&v18, (uint64_t)v17);
    swift_beginAccess();
    outlined assign with take of EncodingContainer?((uint64_t)v17, v5 + 32);
  }
  else
  {
    v22 = &type metadata for OptionalPrimitive;
    v23 = &protocol witness table for OptionalPrimitive;
    outlined init with take of EncodingContainer?((uint64_t)&v21, (uint64_t)&v18);
    swift_beginAccess();
    outlined assign with take of EncodingContainer?((uint64_t)&v18, v5 + 32);
  }
  return swift_endAccess();
}

uint64_t _XPCSingleValueEncodingContainer.encode(to:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  __int128 v6;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  swift_beginAccess();
  outlined init with copy of EncodingContainer?(v1 + 32, (uint64_t)&v6);
  if (!v7)
  {
    outlined destroy of DecodingContainer?((uint64_t)&v6, &demangling cache variable for type metadata for EncodingContainer?);
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000001DLL, 0x80000001DF04F3E0);
  }
  outlined init with take of Encodable(&v6, (uint64_t)v8);
  v3 = v9;
  v4 = v10;
  __swift_project_boxed_opaque_existential_1(v8, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a1, v3, v4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t _XPCSingleValueEncodingContainer.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of DecodingContainer?(v0 + 32, &demangling cache variable for type metadata for EncodingContainer?);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for _XPCSingleValueEncodingContainer()
{
  return objc_opt_self();
}

uint64_t protocol witness for SingleValueEncodingContainer.codingPath.getter in conformance _XPCSingleValueEncodingContainer(uint64_t a1)
{
  return CodingContainerWithMetadata.codingPath.getter(a1, (uint64_t)&protocol witness table for _XPCSingleValueEncodingContainer);
}

uint64_t protocol witness for SingleValueEncodingContainer.encodeNil() in conformance _XPCSingleValueEncodingContainer()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[40];
  _BYTE v4[24];
  ValueMetadata *v5;
  _UNKNOWN **v6;

  v1 = *v0;
  v5 = &type metadata for NilPrimitive;
  v6 = &protocol witness table for NilPrimitive;
  outlined init with take of EncodingContainer?((uint64_t)v4, (uint64_t)v3);
  swift_beginAccess();
  outlined assign with take of EncodingContainer?((uint64_t)v3, v1 + 32);
  return swift_endAccess();
}

uint64_t protocol witness for SingleValueEncodingContainer.encode(_:) in conformance _XPCSingleValueEncodingContainer(char a1)
{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1);
}

{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1, MEMORY[0x1E0DEDA70], (uint64_t)&protocol witness table for Int8, off_1EA979270, MEMORY[0x1E0DEDA70] - 8);
}

{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1, MEMORY[0x1E0DEDE70], (uint64_t)&protocol witness table for UInt8, off_1EA979490, MEMORY[0x1E0DEDE70] - 8);
}

uint64_t protocol witness for SingleValueEncodingContainer.encode(_:) in conformance _XPCSingleValueEncodingContainer(uint64_t a1, uint64_t a2)
{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1, a2);
}

uint64_t protocol witness for SingleValueEncodingContainer.encode(_:) in conformance _XPCSingleValueEncodingContainer(double a1)
{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1);
}

uint64_t protocol witness for SingleValueEncodingContainer.encode(_:) in conformance _XPCSingleValueEncodingContainer(float a1)
{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1);
}

uint64_t protocol witness for SingleValueEncodingContainer.encode(_:) in conformance _XPCSingleValueEncodingContainer(uint64_t a1)
{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1, MEMORY[0x1E0DEB418], (uint64_t)&protocol witness table for Int, off_1EA979160, MEMORY[0x1E0DEB418] - 8);
}

{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1, MEMORY[0x1E0DEDC60], (uint64_t)&protocol witness table for Int64, off_1EA979408, MEMORY[0x1E0DEDC60] - 8);
}

{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1, MEMORY[0x1E0DEBB98], (uint64_t)&protocol witness table for UInt, off_1EA9791E8, MEMORY[0x1E0DEBB98] - 8);
}

{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1, MEMORY[0x1E0DEE190], (uint64_t)&protocol witness table for UInt64, off_1EA979628, MEMORY[0x1E0DEE190] - 8);
}

uint64_t protocol witness for SingleValueEncodingContainer.encode(_:) in conformance _XPCSingleValueEncodingContainer(__int16 a1)
{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1, MEMORY[0x1E0DEDB58], (uint64_t)&protocol witness table for Int16, off_1EA9792F8, MEMORY[0x1E0DEDB58] - 8);
}

{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1, MEMORY[0x1E0DEE068], (uint64_t)&protocol witness table for UInt16, off_1EA979518, MEMORY[0x1E0DEE068] - 8);
}

uint64_t protocol witness for SingleValueEncodingContainer.encode(_:) in conformance _XPCSingleValueEncodingContainer(int a1)
{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1, MEMORY[0x1E0DEDBC8], (uint64_t)&protocol witness table for Int32, off_1EA979380, MEMORY[0x1E0DEDBC8] - 8);
}

{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1, MEMORY[0x1E0DEE0F8], (uint64_t)&protocol witness table for UInt32, off_1EA9795A0, MEMORY[0x1E0DEE0F8] - 8);
}

uint64_t protocol witness for SingleValueEncodingContainer.encode(_:) in conformance _XPCSingleValueEncodingContainer()
{
  return SingleValueEncodingContainer.encode(_:)();
}

{
  return SingleValueEncodingContainer.encode(_:)();
}

uint64_t protocol witness for SingleValueEncodingContainer.encode<A>(_:) in conformance _XPCSingleValueEncodingContainer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _XPCSingleValueEncodingContainer.encode<A>(_:)(a1, a2, a3);
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance _XPCSingleValueEncodingContainer(uint64_t a1)
{
  return _XPCSingleValueEncodingContainer.encode(to:)(a1);
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance _XPCSingleValueEncodingContainer()
{
  return 17;
}

uint64_t outlined init with take of EncodingContainer?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EncodingContainer?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined assign with take of EncodingContainer?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EncodingContainer?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of EncodingContainer?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EncodingContainer?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static OptionalPrimitive.isOptionalPrimitive<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  __int128 v7[2];
  uint64_t v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  MEMORY[0x1E0C80A78](a1);
  (*(void (**)(char *))(v2 + 16))((char *)v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingOptional);
  if (swift_dynamicCast())
  {
    outlined init with take of Encodable(v7, (uint64_t)v9);
    v3 = v10;
    v4 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    LOBYTE(v3) = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    v5 = v3 ^ 1;
  }
  else
  {
    v8 = 0;
    memset(v7, 0, sizeof(v7));
    outlined destroy of CodingOptional?((uint64_t)v7);
    v5 = 1;
  }
  return v5 & 1;
}

BOOL Optional.isNil.getter(uint64_t a1)
{
  uint64_t v1;

  return (*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 48))(v1, 1) == 1;
}

uint64_t static OptionalPrimitive.unwrapNestedOptional<A>(_:codingMetadata:buffer:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  void *v6;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v17;

  if (swift_conformsToProtocol2())
    v13 = a1;
  else
    v13 = 0;
  if (v13)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14 = (_QWORD *)swift_retain();
    specialized static DecodingContainer.decodeType(from:withCodingMetadata:)(v14);
    if (!v6)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      type metadata accessor for _XPCDecoder();
      v17 = swift_allocObject();
      *(_OWORD *)(v17 + 40) = 0u;
      *(_OWORD *)(v17 + 56) = 0u;
      *(_QWORD *)(v17 + 72) = 0;
      *(_QWORD *)(v17 + 24) = a3;
      *(_QWORD *)(v17 + 32) = a4;
      *(_QWORD *)(v17 + 16) = a2;
      lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      dispatch thunk of Decodable.init(from:)();
      v15 = 0;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 56))(a6, v15, 1, a5);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();

  }
  v15 = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 56))(a6, v15, 1, a5);
}

unint64_t lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder;
  if (!lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder)
  {
    v1 = type metadata accessor for _XPCDecoder();
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for _XPCDecoder, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder);
  }
  return result;
}

uint64_t outlined destroy of CodingOptional?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingOptional?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for OptionalPrimitive()
{
  return &type metadata for OptionalPrimitive;
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance OptionalPrimitive(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  specialized static DecodingContainer.decodeType(from:withCodingMetadata:)(a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance OptionalPrimitive()
{
  return 18;
}

uint64_t specialized OptionalPrimitive.encode(to:)(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v2 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  v3 = *(_QWORD *)(a1 + 16);
  result = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a1 + 16) = v3;
  if ((result & 1) == 0)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v3 + 16) + 1, 1, (char *)v3);
    v3 = result;
    *v2 = result;
  }
  v6 = *(_QWORD *)(v3 + 16);
  v5 = *(_QWORD *)(v3 + 24);
  if (v6 >= v5 >> 1)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v5 > 1), v6 + 1, 1, (char *)v3);
    v3 = result;
    *v2 = result;
  }
  *(_QWORD *)(v3 + 16) = v6 + 1;
  *(_BYTE *)(v3 + v6 + 32) = 19;
  v7 = *v2;
  v9 = *(_QWORD *)(*v2 + 16);
  v8 = *(_QWORD *)(*v2 + 24);
  if (v9 >= v8 >> 1)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v8 > 1), v9 + 1, 1, (char *)v7);
    v7 = result;
    *v2 = result;
  }
  *(_QWORD *)(v7 + 16) = v9 + 1;
  *(_BYTE *)(v7 + v9 + 32) = 1;
  return result;
}

uint64_t dispatch thunk of EncodingContainer.encode(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t specialized EncodingContainer.encodeType(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;

  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a3 + 8) + 8))(a2);
  v5 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  v6 = *(_QWORD *)(a1 + 16);
  result = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a1 + 16) = v6;
  if ((result & 1) == 0)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v6 + 16) + 1, 1, (char *)v6);
    v6 = result;
    *v5 = result;
  }
  v9 = *(_QWORD *)(v6 + 16);
  v8 = *(_QWORD *)(v6 + 24);
  if (v9 >= v8 >> 1)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v8 > 1), v9 + 1, 1, (char *)v6);
    v6 = result;
    *v5 = result;
  }
  *(_QWORD *)(v6 + 16) = v9 + 1;
  *(_BYTE *)(v6 + v9 + 32) = v4 + 1;
  return result;
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t XPCListener.InitializationOptions.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t XPCListener.InitializationOptions.init(rawValue:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t static XPCListener.InitializationOptions.none.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = static XPCListener.InitializationOptions.none;
  return result;
}

uint64_t static XPCListener.InitializationOptions.none.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *a1;
  result = swift_beginAccess();
  static XPCListener.InitializationOptions.none = v1;
  return result;
}

uint64_t (*static XPCListener.InitializationOptions.none.modify())()
{
  swift_beginAccess();
  return static XPCSession.InitializationOptions.privileged.modify;
}

uint64_t static XPCListener.InitializationOptions.inactive.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = static XPCListener.InitializationOptions.inactive;
  return result;
}

uint64_t static XPCListener.InitializationOptions.inactive.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *a1;
  result = swift_beginAccess();
  static XPCListener.InitializationOptions.inactive = v1;
  return result;
}

uint64_t (*static XPCListener.InitializationOptions.inactive.modify())()
{
  swift_beginAccess();
  return static XPCSession.InitializationOptions.inactive.modify;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance XPCListener.InitializationOptions@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return specialized SetAlgebra<>.init(arrayLiteral:)(a1, a2);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance XPCListener.IncomingSessionRequest.Decision._Decision(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance XPCListener.IncomingSessionRequest.Decision._Decision()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance XPCListener.IncomingSessionRequest.Decision._Decision()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance XPCListener.IncomingSessionRequest.Decision._Decision()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

_BYTE *XPCListener.IncomingSessionRequest.decision.setter(_BYTE *result)
{
  uint64_t v1;
  Swift::String v2;

  if (*(_BYTE *)(v1 + 24) != 2)
  {
    _StringGuts.grow(_:)(55);
    v2._object = (void *)0x80000001DF04F610;
    v2._countAndFlagsBits = 0xD000000000000035;
    String.append(_:)(v2);
    if (*(_BYTE *)(v1 + 24) == 2)
      __break(1u);
    _print_unlocked<A, B>(_:_:)();
    __XPC_API_MISUSE__(_:file:line:)(0, 0xE000000000000000);
  }
  *(_BYTE *)(v1 + 24) = *result;
  return result;
}

uint64_t XPCListener.IncomingSessionRequest.accept(incomingMessageHandler:cancellationHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _BYTE *a5@<X8>)
{
  return XPCListener.IncomingSessionRequest.accept(incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))XPCSession.setIncomingMessageHandler(_:), a5);
}

{
  return XPCListener.IncomingSessionRequest.accept(incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))XPCSession.setIncomingMessageHandler(_:), a5);
}

uint64_t XPCListener.IncomingSessionRequest.accept<A>(incomingMessageHandler:cancellationHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _BYTE *a7@<X8>)
{
  uint64_t result;
  char v9;

  XPCListener.IncomingSessionRequest.accept<A>(incomingMessageHandler:cancellationHandler:)(&v9, a1, a2, a3, a4, a5, a6);
  result = swift_release();
  *a7 = v9;
  return result;
}

uint64_t XPCListener.IncomingSessionRequest.accept(incomingMessageHandler:cancellationHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void (*a5)(uint64_t, uint64_t)@<X4>, _BYTE *a6@<X8>)
{
  uint64_t result;
  char v13;

  swift_retain();
  a5(a1, a2);
  swift_release();
  XPCListener.IncomingSessionRequest._accept(cancellationHandler:)(&v13, a3, a4);
  result = swift_release();
  *a6 = v13;
  return result;
}

uint64_t XPCListener.IncomingSessionRequest._accept(cancellationHandler:)(_BYTE *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  _QWORD v17[6];

  if (a2)
  {
    v7 = *(_QWORD *)(v3 + 16);
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = a2;
    *(_QWORD *)(v8 + 24) = a3;
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a2);
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a2);
    swift_retain();
    v9 = ClientSpecifiedHandler.init(_:)((uint64_t)_s3XPC12XPCRichErrorVIegn_ACytIegnr_TRTA_0);
    v11 = v10;
    v12 = *(void **)(v7 + 16);
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v9;
    *(_QWORD *)(v13 + 24) = v11;
    v17[4] = partial apply for closure #1 in XPCSession.setCancellationHandler(_:);
    v17[5] = v13;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 1107296256;
    v17[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
    v17[3] = &block_descriptor_51_0;
    v14 = _Block_copy(v17);
    swift_retain();
    swift_release();
    _swift_xpc_session_set_cancel_handler(v12, v14);
    _Block_release(v14);
    swift_release();
    swift_release();
    outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a2);
  }
  LOBYTE(v17[0]) = 0;
  XPCListener.IncomingSessionRequest.decision.setter(v17);
  v15 = *(unsigned __int8 *)(v3 + 24);
  if (v15 == 2)
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000002ALL, 0x80000001DF04F480);
  *a1 = v15 & 1;
  return swift_retain();
}

uint64_t XPCListener.IncomingSessionRequest.accept(incomingMessageHandler:cancellationHandler:)(_BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return XPCListener.IncomingSessionRequest.accept(incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, (void (*)(uint64_t, uint64_t))XPCSession.setIncomingMessageHandler(_:));
}

{
  return XPCListener.IncomingSessionRequest.accept(incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, (void (*)(uint64_t, uint64_t))XPCSession.setIncomingMessageHandler(_:));
}

uint64_t XPCListener.IncomingSessionRequest.accept<A>(incomingMessageHandler:cancellationHandler:)(_BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  swift_retain();
  XPCSession.setIncomingMessageHandler<A>(_:)(a2, a3, a6, a7);
  swift_release();
  return XPCListener.IncomingSessionRequest._accept(cancellationHandler:)(a1, a4, a5);
}

uint64_t XPCListener.IncomingSessionRequest.accept(incomingMessageHandler:cancellationHandler:)(_BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  swift_retain();
  a6(a2, a3);
  swift_release();
  return XPCListener.IncomingSessionRequest._accept(cancellationHandler:)(a1, a4, a5);
}

uint64_t XPCListener.IncomingSessionRequest.accept<A>(_:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, _BYTE *a4@<X8>)
{
  return XPCListener.IncomingSessionRequest.accept<A>(_:)(a1, a2, a3, (uint64_t (*)(char *, uint64_t, uint64_t))implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:), (uint64_t (*)(char *, uint64_t, uint64_t))implicit closure #3 in XPCListener.IncomingSessionRequest.accept<A>(_:), (void (*)(uint64_t, uint64_t))XPCSession.setIncomingMessageHandler(_:), a4);
}

{
  return XPCListener.IncomingSessionRequest.accept<A>(_:)(a1, a2, a3, (uint64_t (*)(char *, uint64_t, uint64_t))implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:), (uint64_t (*)(char *, uint64_t, uint64_t))implicit closure #3 in XPCListener.IncomingSessionRequest.accept<A>(_:), (void (*)(uint64_t, uint64_t))XPCSession.setIncomingMessageHandler(_:), a4);
}

uint64_t (*implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3))(uint64_t *a1)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v5 = *(_QWORD *)(a2 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](a1);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a2;
  *(_QWORD *)(v9 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, v7, a2);
  return partial apply for implicit closure #2 in implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:);
}

uint64_t (*implicit closure #3 in XPCListener.IncomingSessionRequest.accept<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v5 = *(_QWORD *)(a2 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](a1);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a2;
  *(_QWORD *)(v9 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, v7, a2);
  return partial apply for implicit closure #4 in implicit closure #3 in XPCListener.IncomingSessionRequest.accept<A>(_:);
}

{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v5 = *(_QWORD *)(a2 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](a1);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a2;
  *(_QWORD *)(v9 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, v7, a2);
  return partial apply for implicit closure #4 in implicit closure #3 in XPCListener.IncomingSessionRequest.accept<A>(_:);
}

uint64_t XPCListener.IncomingSessionRequest.accept<A>(_:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _BYTE *a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t (*v13)();
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t AssociatedTypeWitness;
  _BYTE *v21;
  char v22;

  v21 = a5;
  v9 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = swift_retain();
  a1(v12);
  swift_release();
  v13 = implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:)((uint64_t)v11, a2, a3, a4);
  v15 = v14;
  v16 = implicit closure #3 in XPCListener.IncomingSessionRequest.accept<A>(_:)((uint64_t)v11, a2, a3, a4);
  v18 = v17;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  XPCListener.IncomingSessionRequest.accept<A>(incomingMessageHandler:cancellationHandler:)(&v22, (uint64_t)v13, v15, (uint64_t)v16, v18, AssociatedTypeWitness, a4);
  swift_release();
  *v21 = v22;
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, a2);
}

uint64_t (*implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  char *v11;
  uint64_t v13;

  v7 = *(_QWORD *)(a2 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](a1);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v11 = (char *)swift_allocObject();
  *((_QWORD *)v11 + 2) = a2;
  *((_QWORD *)v11 + 3) = a3;
  *((_QWORD *)v11 + 4) = a4;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v11[v10], v9, a2);
  return partial apply for implicit closure #2 in implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:);
}

uint64_t (*implicit closure #3 in XPCListener.IncomingSessionRequest.accept<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t a1)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  char *v11;
  uint64_t v13;

  v7 = *(_QWORD *)(a2 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](a1);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v11 = (char *)swift_allocObject();
  *((_QWORD *)v11 + 2) = a2;
  *((_QWORD *)v11 + 3) = a3;
  *((_QWORD *)v11 + 4) = a4;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v11[v10], v9, a2);
  return partial apply for implicit closure #4 in implicit closure #3 in XPCListener.IncomingSessionRequest.accept<A>(_:);
}

uint64_t XPCListener.IncomingSessionRequest.accept<A>(_:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t (*a4)(char *, uint64_t, uint64_t)@<X4>, uint64_t (*a5)(char *, uint64_t, uint64_t)@<X5>, void (*a6)(uint64_t, uint64_t)@<X6>, _BYTE *a7@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  _BYTE *v25;
  char v26;

  v24 = a6;
  v25 = a7;
  v12 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = swift_retain();
  a1(v15);
  swift_release();
  v16 = a4(v14, a2, a3);
  v18 = v17;
  v19 = a5(v14, a2, a3);
  v21 = v20;
  swift_retain();
  v24(v16, v18);
  swift_release();
  XPCListener.IncomingSessionRequest._accept(cancellationHandler:)(&v26, v19, v21);
  swift_release();
  swift_release();
  swift_release();
  *v25 = v26;
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, a2);
}

uint64_t (*implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3))(__int128 *a1)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v5 = *(_QWORD *)(a2 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](a1);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a2;
  *(_QWORD *)(v9 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, v7, a2);
  return partial apply for implicit closure #2 in implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:);
}

XPC::XPCListener::IncomingSessionRequest::Decision __swiftcall XPCListener.IncomingSessionRequest.reject(reason:)(Swift::String reason)
{
  _BYTE *v1;
  uint64_t v2;
  _BYTE *v3;
  void *v4;
  id v5;
  XPC::XPCListener::IncomingSessionRequest::Decision result;
  int v7;
  char v8;

  v3 = v1;
  v4 = *(void **)(*(_QWORD *)(v2 + 16) + 16);
  String.utf8CString.getter();
  v5 = v4;
  _swift_xpc_listener_reject_peer(v5);

  swift_release();
  v8 = 1;
  result.decision = XPCListener.IncomingSessionRequest.decision.setter(&v8);
  v7 = *(unsigned __int8 *)(v2 + 24);
  if (v7 == 2)
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000002ALL, 0x80000001DF04F480);
  *v3 = v7 & 1;
  return result;
}

void _swift_xpc_listener_reject_peer(void *a1)
{
  id v1;

  v1 = a1;
  MEMORY[0x1DF0F4D24]();

}

uint64_t XPCListener.IncomingSessionRequest.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t XPCListener.IncomingSessionRequest.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t XPCListener.__allocating_init(service:targetQueue:options:incomingSessionHandler:)(uint64_t a1, uint64_t a2, void *a3, xpc_listener_create_flags_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;

  v12 = swift_allocObject();
  XPCListener.init(service:targetQueue:options:incomingSessionHandler:)(a1, a2, a3, a4, a5, a6);
  return v12;
}

uint64_t XPCListener.init(service:targetQueue:options:incomingSessionHandler:)(uint64_t a1, uint64_t a2, void *a3, xpc_listener_create_flags_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  xpc_listener_create_flags_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  xpc_listener_s *v18;
  _xpc_rich_error_s *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL can_retry;
  uint64_t v30;
  _QWORD aBlock[6];
  xpc_rich_error_t v32[2];

  v32[1] = *(xpc_rich_error_t *)MEMORY[0x1E0C80C00];
  v10 = *a4;
  v32[0] = 0;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a5;
  *(_QWORD *)(v11 + 24) = a6;
  type metadata accessor for XPCListener.IncomingSessionRequest();
  swift_retain();
  v12 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@guaranteed XPCListener.IncomingSessionRequest) -> (@out XPCListener.IncomingSessionRequest.Decision));
  v14 = v13;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v12;
  *(_QWORD *)(v15 + 24) = v14;
  aBlock[4] = partial apply for closure #1 in XPCListener.init(service:targetQueue:options:incomingSessionHandler:);
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_session) -> ();
  aBlock[3] = &block_descriptor_3;
  v16 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v17 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v18 = _swift_xpc_listener_create((const char *)(v17 + 32), a3, v10, v16, v32);
  _Block_release(v16);
  v19 = v32[0];
  swift_release();
  if (!v18)
  {
    if (v19)
    {
      lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
      swift_allocError();
      v21 = v20;
      v22 = swift_unknownObjectRetain();
      if (MEMORY[0x1DF0F4CB8](v22) != MEMORY[0x1E0C81368])
        __break(1u);
      v30 = v6;
      v23 = xpc_rich_error_copy_description(v19);
      if (v23)
      {
        v24 = v23;
        v25 = String.init(cString:)();
        v27 = v26;
        can_retry = xpc_rich_error_can_retry(v19);
        free(v24);
        *(_BYTE *)v21 = can_retry;
        *(_QWORD *)(v21 + 8) = v25;
        *(_QWORD *)(v21 + 16) = v27;
        swift_willThrow();
        swift_release();
        swift_unknownObjectRelease();

        swift_release();
        swift_unknownObjectRelease();
        type metadata accessor for XPCListener();
        v6 = v30;
        swift_deallocPartialClassInstance();
        return v6;
      }
      __break(1u);
    }
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000001CLL, 0x80000001DF04F530);
  }
  swift_release();

  swift_release();
  *(_QWORD *)(v6 + 16) = v18;
  swift_unknownObjectRelease();
  return v6;
}

uint64_t sub_1DF03DF60()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed XPCListener.IncomingSessionRequest) -> (@out XPCListener.IncomingSessionRequest.Decision)(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t type metadata accessor for XPCListener.IncomingSessionRequest()
{
  return objc_opt_self();
}

void thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_session) -> ()(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

xpc_listener_t _swift_xpc_listener_create(const char *a1, void *a2, xpc_listener_create_flags_t a3, void *a4, xpc_rich_error_t *a5)
{
  NSObject *v9;
  id v10;
  xpc_listener_t v11;

  v9 = a2;
  v10 = a4;
  v11 = xpc_listener_create(a1, v9, a3, v10, a5);

  return v11;
}

uint64_t type metadata accessor for XPCListener()
{
  return objc_opt_self();
}

uint64_t XPCListener.__allocating_init(targetQueue:options:incomingSessionHandler:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t anonymous;
  _QWORD v16[6];

  v7 = swift_allocObject();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a3;
  *(_QWORD *)(v8 + 24) = a4;
  type metadata accessor for XPCListener.IncomingSessionRequest();
  swift_retain();
  v9 = ClientSpecifiedHandler.init(_:)((uint64_t)thunk for @escaping @callee_guaranteed (@guaranteed XPCListener.IncomingSessionRequest) -> (@out XPCListener.IncomingSessionRequest.Decision)partial apply);
  v11 = v10;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v9;
  *(_QWORD *)(v12 + 24) = v11;
  v16[4] = partial apply for closure #1 in XPCListener.init(targetQueue:options:incomingSessionHandler:);
  v16[5] = v12;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 1107296256;
  v16[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_session) -> ();
  v16[3] = &block_descriptor_13;
  v13 = _Block_copy(v16);
  swift_retain();
  swift_release();
  anonymous = xpc_listener_create_anonymous();
  swift_release();

  swift_release();
  _Block_release(v13);
  *(_QWORD *)(v7 + 16) = anonymous;
  return v7;
}

uint64_t XPCListener.init(targetQueue:options:incomingSessionHandler:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t anonymous;
  _QWORD v16[6];

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a3;
  *(_QWORD *)(v8 + 24) = a4;
  type metadata accessor for XPCListener.IncomingSessionRequest();
  swift_retain();
  v9 = ClientSpecifiedHandler.init(_:)((uint64_t)thunk for @escaping @callee_guaranteed (@guaranteed XPCListener.IncomingSessionRequest) -> (@out XPCListener.IncomingSessionRequest.Decision)partial apply);
  v11 = v10;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v9;
  *(_QWORD *)(v12 + 24) = v11;
  v16[4] = partial apply for closure #1 in XPCListener.init(service:targetQueue:options:incomingSessionHandler:);
  v16[5] = v12;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 1107296256;
  v16[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_session) -> ();
  v16[3] = &block_descriptor_24;
  v13 = _Block_copy(v16);
  swift_retain();
  swift_release();
  anonymous = xpc_listener_create_anonymous();
  swift_release();

  swift_release();
  _Block_release(v13);
  *(_QWORD *)(v4 + 16) = anonymous;
  return v4;
}

uint64_t closure #1 in XPCListener.init(service:targetQueue:options:incomingSessionHandler:)(void *a1, void (*a2)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v8;

  type metadata accessor for XPCListener.IncomingSessionRequest();
  v4 = swift_allocObject();
  *(_BYTE *)(v4 + 24) = 2;
  type metadata accessor for XPCSession();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v4 + 16) = v5;
  v8 = v4;
  v6 = a1;
  ClientSpecifiedHandler.callEventHandler(_:)((uint64_t)&v8, a2);
  return swift_release();
}

uint64_t partial apply for closure #1 in XPCListener.init(targetQueue:options:incomingSessionHandler:)(void *a1)
{
  uint64_t v1;

  return closure #1 in XPCListener.init(service:targetQueue:options:incomingSessionHandler:)(a1, *(void (**)(uint64_t))(v1 + 16));
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> XPCListener.activate()()
{
  uint64_t v0;
  BOOL v1;
  _xpc_rich_error_s *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL can_retry;
  xpc_rich_error_t v12[2];

  v12[1] = *(xpc_rich_error_t *)MEMORY[0x1E0C80C00];
  v12[0] = 0;
  v1 = _swift_xpc_listener_activate(*(void **)(v0 + 16), v12);
  v2 = v12[0];
  if (!v1)
  {
    if (v12[0])
    {
      lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
      swift_allocError();
      v4 = v3;
      v5 = swift_unknownObjectRetain();
      if (MEMORY[0x1DF0F4CB8](v5) != MEMORY[0x1E0C81368])
        __break(1u);
      v6 = xpc_rich_error_copy_description(v2);
      if (v6)
      {
        v7 = v6;
        v8 = String.init(cString:)();
        v10 = v9;
        can_retry = xpc_rich_error_can_retry(v2);
        free(v7);
        *(_BYTE *)v4 = can_retry;
        *(_QWORD *)(v4 + 8) = v8;
        *(_QWORD *)(v4 + 16) = v10;
        swift_willThrow();
        swift_unknownObjectRelease();
        goto LABEL_6;
      }
      __break(1u);
    }
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000001FLL, 0x80000001DF04E500);
  }
LABEL_6:
  swift_unknownObjectRelease();
}

BOOL _swift_xpc_listener_activate(void *a1, xpc_rich_error_t *a2)
{
  xpc_listener_s *v3;
  _BOOL8 v4;

  v3 = a1;
  v4 = xpc_listener_activate(v3, a2);

  return v4;
}

Swift::Void __swiftcall XPCListener.cancel()()
{
  uint64_t v0;

  _swift_xpc_listener_cancel(*(void **)(v0 + 16));
}

void _swift_xpc_listener_cancel(void *a1)
{
  xpc_listener_s *v1;

  v1 = a1;
  xpc_listener_cancel(v1);

}

uint64_t XPCListener.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t XPCListener.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t XPCListener.endpoint.getter@<X0>(uint64_t *a1@<X8>)
{
  void *endpoint;
  uint64_t result;
  uint64_t v4;

  endpoint = (void *)xpc_listener_create_endpoint();
  swift_getObjectType();
  result = OS_xpc_object.isCodable()();
  if ((result & 1) != 0)
  {
    result = (uint64_t)xpc_copy(endpoint);
    if (result)
    {
      v4 = result;
      result = swift_unknownObjectRelease();
      *a1 = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t XPCListener.debugDescription.getter()
{
  uint64_t v0;
  char *v1;
  char *v2;
  uint64_t v3;

  v1 = _swift_xpc_listener_copy_description(*(void **)(v0 + 16));
  if (!v1)
    return 0xD000000000000036;
  v2 = v1;
  v3 = String.init(cString:)();
  free(v2);
  return v3;
}

char *_swift_xpc_listener_copy_description(void *a1)
{
  xpc_listener_s *v1;
  char *v2;

  v1 = a1;
  v2 = xpc_listener_copy_description(v1);

  return v2;
}

unint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance XPCListener()
{
  return XPCListener.debugDescription.getter();
}

uint64_t XPCListener.IncomingSessionRequest.withUnsafeAuditToken<A>(_:)(uint64_t (*a1)())
{
  _xpc_session_get_peer_audit_token_4SWIFT();
  return a1();
}

unint64_t lazy protocol witness table accessor for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions;
  if (!lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for XPCListener.InitializationOptions, &type metadata for XPCListener.InitializationOptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions;
  if (!lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for XPCListener.InitializationOptions, &type metadata for XPCListener.InitializationOptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions;
  if (!lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for XPCListener.InitializationOptions, &type metadata for XPCListener.InitializationOptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions;
  if (!lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for XPCListener.InitializationOptions, &type metadata for XPCListener.InitializationOptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions);
  }
  return result;
}

uint64_t method lookup function for XPCListener()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCListener.__allocating_init(service:targetQueue:options:incomingSessionHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of XPCListener.__allocating_init(targetQueue:options:incomingSessionHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of XPCListener.activate()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of XPCListener.cancel()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

ValueMetadata *type metadata accessor for XPCListener.InitializationOptions()
{
  return &type metadata for XPCListener.InitializationOptions;
}

uint64_t method lookup function for XPCListener.IncomingSessionRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCListener.IncomingSessionRequest.accept(incomingMessageHandler:cancellationHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of XPCListener.IncomingSessionRequest.accept<A>(incomingMessageHandler:cancellationHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of XPCListener.IncomingSessionRequest.accept<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of XPCListener.IncomingSessionRequest.reject(reason:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for XPCListener.IncomingSessionRequest.Decision()
{
  return &type metadata for XPCListener.IncomingSessionRequest.Decision;
}

uint64_t dispatch thunk of XPCPeerHandler.handleIncomingRequest(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of XPCPeerHandler.handleCancellation(error:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t getEnumTagSinglePayload for XPCListener.IncomingSessionRequest.Decision(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for XPCListener.IncomingSessionRequest.Decision(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DF03EAC4 + 4 * byte_1DF04BA85[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1DF03EAF8 + 4 * asc_1DF04BA80[v4]))();
}

uint64_t sub_1DF03EAF8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DF03EB00(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DF03EB08);
  return result;
}

uint64_t sub_1DF03EB14(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DF03EB1CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1DF03EB20(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DF03EB28(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for XPCListener.IncomingSessionRequest.Decision._Decision(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for XPCListener.IncomingSessionRequest.Decision._Decision(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for XPCListener.IncomingSessionRequest.Decision._Decision()
{
  return &type metadata for XPCListener.IncomingSessionRequest.Decision._Decision;
}

unint64_t lazy protocol witness table accessor for type XPCListener.IncomingSessionRequest.Decision._Decision and conformance XPCListener.IncomingSessionRequest.Decision._Decision()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type XPCListener.IncomingSessionRequest.Decision._Decision and conformance XPCListener.IncomingSessionRequest.Decision._Decision;
  if (!lazy protocol witness table cache variable for type XPCListener.IncomingSessionRequest.Decision._Decision and conformance XPCListener.IncomingSessionRequest.Decision._Decision)
  {
    result = MEMORY[0x1DF0F49E8](&protocol conformance descriptor for XPCListener.IncomingSessionRequest.Decision._Decision, &type metadata for XPCListener.IncomingSessionRequest.Decision._Decision);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCListener.IncomingSessionRequest.Decision._Decision and conformance XPCListener.IncomingSessionRequest.Decision._Decision);
  }
  return result;
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:)(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v4;

  v2 = *(_QWORD *)(v1 + 24);
  v4 = *a1;
  return (*(uint64_t (**)(__int128 *))(v2 + 24))(&v4);
}

uint64_t partial apply for implicit closure #4 in implicit closure #3 in XPCListener.IncomingSessionRequest.accept<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[8];
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(v1 + 24);
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v6[0] = *(_BYTE *)a1;
  v7 = v3;
  v8 = v4;
  return (*(uint64_t (**)(_BYTE *))(v2 + 32))(v6);
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[8];
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(v1 + 24);
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v6[0] = *(_BYTE *)a1;
  v7 = v3;
  v8 = v4;
  return (*(uint64_t (**)(_BYTE *))(v2 + 32))(v6);
}

uint64_t objectdestroy_32Tm()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 24) + 24))();
}

uint64_t objectdestroy_26Tm()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 24);
  v4 = *a1;
  return (*(uint64_t (**)(uint64_t *))(v2 + 24))(&v4);
}

uint64_t _s3XPC12XPCRichErrorVIegn_ACytIegnr_TRTA_0(uint64_t a1)
{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ()(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t protocol witness for SharableStorage.init() in conformance _XPCUnkeyedEncodingContainer.UnkeyedEncodingStorage@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = MEMORY[0x1E0DEE9D8];
  *a1 = result;
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _XPCUnkeyedEncodingContainer.encodeNil()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v4;
  unint64_t v5;
  __int128 v6;
  ValueMetadata *v7;
  _UNKNOWN **v8;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD **)(v1 + 16);
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v1 + 16) = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2[2] + 1, 1, v2);
    *(_QWORD *)(v1 + 16) = v2;
  }
  v5 = v2[2];
  v4 = v2[3];
  if (v5 >= v4 >> 1)
  {
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v4 > 1), v5 + 1, 1, v2);
    *(_QWORD *)(v1 + 16) = v2;
  }
  v7 = &type metadata for NilPrimitive;
  v8 = &protocol witness table for NilPrimitive;
  v2[2] = v5 + 1;
  outlined init with take of Encodable(&v6, (uint64_t)&v2[5 * v5 + 4]);
  swift_release();
}

uint64_t specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  Swift::String v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t inited;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  _QWORD v25[3];
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];

  v3 = v1;
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 16) + 16);
  v28[0] = 0x207865646E49;
  v28[1] = 0xE600000000000000;
  v25[0] = v5;
  v6._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(v1 + 16);
  v8 = *(_QWORD *)(v3 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DF04A630;
  *(_QWORD *)(inited + 56) = &type metadata for CodableIndexKey;
  *(_QWORD *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  v10 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v10;
  *(_QWORD *)(v10 + 16) = 0x207865646E49;
  *(_QWORD *)(v10 + 24) = 0xE600000000000000;
  *(_QWORD *)(v10 + 32) = v5;
  *(_BYTE *)(v10 + 40) = 0;
  v28[0] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((_QWORD *)inited);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  specialized static XPCEncoder.encode<A>(_:withCodingMetadata:)(a1, v7, v8, (uint64_t)v28);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if (!v2)
  {
    v12 = *(_QWORD *)(v3 + 32);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)v28, (uint64_t)v25);
    v13 = (_QWORD *)(v12 + 16);
    v14 = *(_QWORD **)(v12 + 16);
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v12 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14[2] + 1, 1, v14);
      *v13 = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
      *v13 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
    v18 = v26;
    v19 = v27;
    v20 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v26);
    MEMORY[0x1E0C80A78](v20);
    v22 = (char *)&v25[-1] - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v23 + 16))(v22);
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v17, (uint64_t)v22, (uint64_t *)(v12 + 16), v18, v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  }
  return result;
}

uint64_t specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  Swift::String v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t inited;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  _QWORD v27[3];
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[16];

  v3 = v2;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 16) + 16);
  v30[0] = 0x207865646E49;
  v30[1] = 0xE600000000000000;
  v27[0] = v6;
  v7._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(v2 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DF04A630;
  *(_QWORD *)(inited + 56) = &type metadata for CodableIndexKey;
  *(_QWORD *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  v11 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v11;
  *(_QWORD *)(v11 + 16) = 0x207865646E49;
  *(_QWORD *)(v11 + 24) = 0xE600000000000000;
  *(_QWORD *)(v11 + 32) = v6;
  *(_BYTE *)(v11 + 40) = 0;
  v30[0] = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((_QWORD *)inited);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12 = v30[15];
  specialized static XPCEncoder.encode<A>(_:withCodingMetadata:)(a1, a2, v8, v9, (uint64_t)v30);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if (!v12)
  {
    v14 = *(_QWORD *)(v3 + 32);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)v30, (uint64_t)v27);
    v15 = (_QWORD *)(v14 + 16);
    v16 = *(_QWORD **)(v14 + 16);
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v14 + 16) = v16;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v16[2] + 1, 1, v16);
      *v15 = v16;
    }
    v19 = v16[2];
    v18 = v16[3];
    if (v19 >= v18 >> 1)
      *v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v18 > 1), v19 + 1, 1, v16);
    v20 = v28;
    v21 = v29;
    v22 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v27, v28);
    MEMORY[0x1E0C80A78](v22);
    v24 = (char *)&v27[-1] - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v25 + 16))(v24);
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v19, (uint64_t)v24, (uint64_t *)(v14 + 16), v20, v21);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  }
  return result;
}

uint64_t specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  Swift::String v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t inited;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  _QWORD v25[3];
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];

  v3 = v1;
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 16) + 16);
  v28[0] = 0x207865646E49;
  v28[1] = 0xE600000000000000;
  v25[0] = v5;
  v6._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(v1 + 16);
  v8 = *(_QWORD *)(v3 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DF04A630;
  *(_QWORD *)(inited + 56) = &type metadata for CodableIndexKey;
  *(_QWORD *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  v10 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v10;
  *(_QWORD *)(v10 + 16) = 0x207865646E49;
  *(_QWORD *)(v10 + 24) = 0xE600000000000000;
  *(_QWORD *)(v10 + 32) = v5;
  *(_BYTE *)(v10 + 40) = 0;
  v28[0] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((_QWORD *)inited);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  specialized static XPCEncoder.encode<A>(_:withCodingMetadata:)(v7, v8, (uint64_t)v28, a1);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if (!v2)
  {
    v12 = *(_QWORD *)(v3 + 32);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)v28, (uint64_t)v25);
    v13 = (_QWORD *)(v12 + 16);
    v14 = *(_QWORD **)(v12 + 16);
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v12 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14[2] + 1, 1, v14);
      *v13 = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
      *v13 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
    v18 = v26;
    v19 = v27;
    v20 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v26);
    MEMORY[0x1E0C80A78](v20);
    v22 = (char *)&v25[-1] - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v23 + 16))(v22);
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v17, (uint64_t)v22, (uint64_t *)(v12 + 16), v18, v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  }
  return result;
}

uint64_t specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(float a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  Swift::String v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t inited;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  _QWORD v25[3];
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];

  v3 = v1;
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 16) + 16);
  v28[0] = 0x207865646E49;
  v28[1] = 0xE600000000000000;
  v25[0] = v5;
  v6._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(v1 + 16);
  v8 = *(_QWORD *)(v3 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DF04A630;
  *(_QWORD *)(inited + 56) = &type metadata for CodableIndexKey;
  *(_QWORD *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  v10 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v10;
  *(_QWORD *)(v10 + 16) = 0x207865646E49;
  *(_QWORD *)(v10 + 24) = 0xE600000000000000;
  *(_QWORD *)(v10 + 32) = v5;
  *(_BYTE *)(v10 + 40) = 0;
  v28[0] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((_QWORD *)inited);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  specialized static XPCEncoder.encode<A>(_:withCodingMetadata:)(v7, v8, (uint64_t)v28, a1);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if (!v2)
  {
    v12 = *(_QWORD *)(v3 + 32);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)v28, (uint64_t)v25);
    v13 = (_QWORD *)(v12 + 16);
    v14 = *(_QWORD **)(v12 + 16);
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v12 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14[2] + 1, 1, v14);
      *v13 = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
      *v13 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
    v18 = v26;
    v19 = v27;
    v20 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v26);
    MEMORY[0x1E0C80A78](v20);
    v22 = (char *)&v25[-1] - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v23 + 16))(v22);
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v17, (uint64_t)v22, (uint64_t *)(v12 + 16), v18, v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  }
  return result;
}

uint64_t specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(uint64_t a1, void (*a2)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  Swift::String v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t inited;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  _QWORD v26[3];
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  void (*v30)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t);

  v30 = a2;
  v4 = v2;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 16) + 16);
  v29[0] = 0x207865646E49;
  v29[1] = 0xE600000000000000;
  v26[0] = v6;
  v7._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(v2 + 16);
  v9 = *(_QWORD *)(v4 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DF04A630;
  *(_QWORD *)(inited + 56) = &type metadata for CodableIndexKey;
  *(_QWORD *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  v11 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v11;
  *(_QWORD *)(v11 + 16) = 0x207865646E49;
  *(_QWORD *)(v11 + 24) = 0xE600000000000000;
  *(_QWORD *)(v11 + 32) = v6;
  *(_BYTE *)(v11 + 40) = 0;
  v29[0] = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((_QWORD *)inited);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v30(v29, a1, v8, v9);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if (!v3)
  {
    v13 = *(_QWORD *)(v4 + 32);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)v29, (uint64_t)v26);
    v14 = (_QWORD *)(v13 + 16);
    v15 = *(_QWORD **)(v13 + 16);
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v13 + 16) = v15;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v15[2] + 1, 1, v15);
      *v14 = v15;
    }
    v18 = v15[2];
    v17 = v15[3];
    if (v18 >= v17 >> 1)
      *v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v17 > 1), v18 + 1, 1, v15);
    v19 = v27;
    v20 = v28;
    v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    MEMORY[0x1E0C80A78](v21);
    v23 = (char *)&v26[-1] - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v24 + 16))(v23);
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v18, (uint64_t)v23, (uint64_t *)(v13 + 16), v19, v20);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  }
  return result;
}

uint64_t _XPCUnkeyedEncodingContainer.encode<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  Swift::String v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t inited;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[3];
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[17];

  v4 = v3;
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 16);
  v32[0] = 0x207865646E49;
  v32[1] = 0xE600000000000000;
  v28 = a3;
  v29[0] = v7;
  v8._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(v3 + 16);
  v10 = *(_QWORD *)(v4 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DF04A630;
  *(_QWORD *)(inited + 56) = &type metadata for CodableIndexKey;
  *(_QWORD *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  v12 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v12;
  *(_QWORD *)(v12 + 16) = 0x207865646E49;
  *(_QWORD *)(v12 + 24) = 0xE600000000000000;
  *(_QWORD *)(v12 + 32) = v7;
  *(_BYTE *)(v12 + 40) = 0;
  v32[0] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((_QWORD *)inited);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  type metadata accessor for XPCEncoder();
  v13 = v32[16];
  static XPCEncoder.encode<A>(_:withCodingMetadata:)(a1, v9, v10, a2, v28, (uint64_t)v32);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if (!v13)
  {
    v15 = *(_QWORD *)(v4 + 32);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)v32, (uint64_t)v29);
    v16 = (_QWORD *)(v15 + 16);
    v17 = *(_QWORD **)(v15 + 16);
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v15 + 16) = v17;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v17 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v17[2] + 1, 1, v17);
      *v16 = v17;
    }
    v20 = v17[2];
    v19 = v17[3];
    if (v20 >= v19 >> 1)
      *v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v19 > 1), v20 + 1, 1, v17);
    v21 = v30;
    v22 = v31;
    v23 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v29, v30);
    MEMORY[0x1E0C80A78](v23);
    v25 = (char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v26 + 16))(v25);
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v20, (uint64_t)v25, (uint64_t *)(v15 + 16), v21, v22);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  }
  return result;
}

uint64_t _XPCUnkeyedEncodingContainer.nestedContainer<A>(keyedBy:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  Swift::String v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t inited;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v22;
  unint64_t v23;
  _QWORD v25[2];

  v4 = v3;
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 16);
  v25[0] = 0x207865646E49;
  v25[1] = 0xE600000000000000;
  v8._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(v3 + 16);
  v10 = *(_QWORD *)(v4 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DF04A630;
  *(_QWORD *)(inited + 56) = &type metadata for CodableIndexKey;
  *(_QWORD *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  v12 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v12;
  *(_QWORD *)(v12 + 16) = 0x207865646E49;
  *(_QWORD *)(v12 + 24) = 0xE600000000000000;
  *(_QWORD *)(v12 + 32) = v7;
  *(_BYTE *)(v12 + 40) = 0;
  v25[0] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((_QWORD *)inited);
  v13 = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15 = type metadata accessor for _XPCKeyedEncodingContainer(0, a2, a3, v14);
  type metadata accessor for KeyedEncodingStorage();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E0DEE9D8]);
  v17 = _XPCKeyedEncodingContainer.__allocating_init(codingMetadata:storage:)(v13, v10, v16);
  v18 = *(_QWORD *)(v4 + 32);
  v19 = (_QWORD *)(v18 + 16);
  v20 = *(_QWORD **)(v18 + 16);
  swift_retain();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v18 + 16) = v20;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v20[2] + 1, 1, v20);
    *v19 = v20;
  }
  v23 = v20[2];
  v22 = v20[3];
  if (v23 >= v22 >> 1)
    *v19 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v22 > 1), v23 + 1, 1, v20);
  v25[0] = v17;
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v23, (uint64_t)v25, (uint64_t *)(v18 + 16), v15, (uint64_t)&protocol witness table for _XPCKeyedEncodingContainer<A>);
  swift_release();
  v25[0] = v17;
  MEMORY[0x1DF0F49E8](&protocol conformance descriptor for _XPCKeyedEncodingContainer<A>, v15);
  return KeyedEncodingContainer.init<A>(_:)();
}

uint64_t _XPCUnkeyedEncodingContainer.nestedUnkeyedContainer()@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  Swift::String v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t inited;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t result;
  __int128 v21;
  uint64_t v22;
  _UNKNOWN **v23;
  uint64_t v24;

  v2 = v1;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 16) + 16);
  *(_QWORD *)&v21 = 0x207865646E49;
  *((_QWORD *)&v21 + 1) = 0xE600000000000000;
  v24 = v4;
  v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DF04A630;
  *(_QWORD *)(inited + 56) = &type metadata for CodableIndexKey;
  *(_QWORD *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  v9 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v9;
  *(_QWORD *)(v9 + 16) = 0x207865646E49;
  *(_QWORD *)(v9 + 24) = 0xE600000000000000;
  *(_QWORD *)(v9 + 32) = v4;
  *(_BYTE *)(v9 + 40) = 0;
  *(_QWORD *)&v21 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((_QWORD *)inited);
  v10 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  type metadata accessor for _XPCUnkeyedEncodingContainer.UnkeyedEncodingStorage();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = MEMORY[0x1E0DEE9D8];
  v12 = type metadata accessor for _XPCUnkeyedEncodingContainer();
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v10;
  v13[3] = v7;
  v13[4] = v11;
  v14 = *(_QWORD *)(v2 + 32);
  v15 = *(_QWORD **)(v14 + 16);
  swift_retain();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v14 + 16) = v15;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v15[2] + 1, 1, v15);
    *(_QWORD *)(v14 + 16) = v15;
  }
  v18 = v15[2];
  v17 = v15[3];
  if (v18 >= v17 >> 1)
  {
    v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v17 > 1), v18 + 1, 1, v15);
    *(_QWORD *)(v14 + 16) = v15;
  }
  v22 = v12;
  v23 = &protocol witness table for _XPCUnkeyedEncodingContainer;
  *(_QWORD *)&v21 = v13;
  v15[2] = v18 + 1;
  outlined init with take of Encodable(&v21, (uint64_t)&v15[5 * v18 + 4]);
  swift_release();
  a1[3] = v12;
  result = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCUnkeyedEncodingContainer and conformance _XPCUnkeyedEncodingContainer, v19, (uint64_t (*)(uint64_t))type metadata accessor for _XPCUnkeyedEncodingContainer, (uint64_t)&protocol conformance descriptor for _XPCUnkeyedEncodingContainer);
  a1[4] = result;
  *a1 = v13;
  return result;
}

uint64_t _XPCUnkeyedEncodingContainer.superEncoder()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  Swift::String v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t inited;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  uint64_t result;
  __int128 v19;
  uint64_t v20;
  _UNKNOWN **v21;
  uint64_t v22;

  v2 = v1;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 16) + 16);
  *(_QWORD *)&v19 = 0x207865646E49;
  *((_QWORD *)&v19 + 1) = 0xE600000000000000;
  v22 = v4;
  v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DF04A630;
  *(_QWORD *)(inited + 56) = &type metadata for CodableIndexKey;
  *(_QWORD *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  v9 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v9;
  *(_QWORD *)(v9 + 16) = 0x207865646E49;
  *(_QWORD *)(v9 + 24) = 0xE600000000000000;
  *(_QWORD *)(v9 + 32) = v4;
  *(_BYTE *)(v9 + 40) = 0;
  *(_QWORD *)&v19 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((_QWORD *)inited);
  v10 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11 = type metadata accessor for _XPCEncoder();
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 32) = 0u;
  *(_OWORD *)(v12 + 48) = 0u;
  *(_QWORD *)(v12 + 64) = 0;
  *(_QWORD *)(v12 + 16) = v10;
  *(_QWORD *)(v12 + 24) = v7;
  v13 = *(_QWORD *)(v2 + 32);
  v14 = *(_QWORD **)(v13 + 16);
  swift_retain();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v13 + 16) = v14;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14[2] + 1, 1, v14);
    *(_QWORD *)(v13 + 16) = v14;
  }
  v17 = v14[2];
  v16 = v14[3];
  if (v17 >= v16 >> 1)
  {
    v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
    *(_QWORD *)(v13 + 16) = v14;
  }
  v20 = v11;
  v21 = &protocol witness table for _XPCEncoder;
  *(_QWORD *)&v19 = v12;
  v14[2] = v17 + 1;
  outlined init with take of Encodable(&v19, (uint64_t)&v14[5 * v17 + 4]);
  swift_release();
  a1[3] = v11;
  result = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCEncoder, (uint64_t)&protocol conformance descriptor for _XPCEncoder);
  a1[4] = result;
  *a1 = v12;
  return result;
}

uint64_t _XPCUnkeyedEncodingContainer.encode(to:)(uint64_t a1)
{
  uint64_t v1;
  char **v3;
  char *v4;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v3 = (char **)(a1 + 16);
  swift_beginAccess();
  v4 = *(char **)(a1 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a1 + 16) = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
    *v3 = v4;
  }
  v7 = *((_QWORD *)v4 + 2);
  v6 = *((_QWORD *)v4 + 3);
  if (v7 >= v6 >> 1)
  {
    v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v6 > 1), v7 + 1, 1, v4);
    *v3 = v4;
  }
  *((_QWORD *)v4 + 2) = v7 + 1;
  v4[v7 + 32] = 16;
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 16) + 16);
  swift_retain();
  specialized CodingIntegerPrimitive.forEachByte(do:)(v8, a1);
  swift_release();
  swift_retain();
  swift_retain();
  specialized EncodingBuffer.appendSized(_:)(a1, v1, a1);
  swift_release();
  return swift_release();
}

uint64_t closure #1 in _XPCUnkeyedEncodingContainer.encode(to:)(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v5 = v2 + 32;
    swift_bridgeObjectRetain();
    do
    {
      outlined init with copy of XPCCodableObjectRepresentable(v5, (uint64_t)v8);
      v6 = v9;
      v7 = v10;
      __swift_project_boxed_opaque_existential_1(v8, v9);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a2, v6, v7);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
      v5 += 40;
      --v3;
    }
    while (v3);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for _XPCUnkeyedEncodingContainer()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for _XPCUnkeyedEncodingContainer.UnkeyedEncodingStorage()
{
  return objc_opt_self();
}

uint64_t protocol witness for UnkeyedEncodingContainer.codingPath.getter in conformance _XPCUnkeyedEncodingContainer(uint64_t a1)
{
  return CodingContainerWithMetadata.codingPath.getter(a1, (uint64_t)&protocol witness table for _XPCUnkeyedEncodingContainer);
}

uint64_t protocol witness for UnkeyedEncodingContainer.count.getter in conformance _XPCUnkeyedEncodingContainer()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 32) + 16) + 16);
}

void protocol witness for UnkeyedEncodingContainer.encodeNil() in conformance _XPCUnkeyedEncodingContainer()
{
  _XPCUnkeyedEncodingContainer.encodeNil()();
}

uint64_t protocol witness for UnkeyedEncodingContainer.encode(_:) in conformance _XPCUnkeyedEncodingContainer(char a1)
{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1);
}

uint64_t protocol witness for UnkeyedEncodingContainer.encode(_:) in conformance _XPCUnkeyedEncodingContainer(uint64_t a1, uint64_t a2)
{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, a2);
}

uint64_t protocol witness for UnkeyedEncodingContainer.encode(_:) in conformance _XPCUnkeyedEncodingContainer(double a1)
{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1);
}

uint64_t protocol witness for UnkeyedEncodingContainer.encode(_:) in conformance _XPCUnkeyedEncodingContainer(float a1)
{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1);
}

uint64_t protocol witness for UnkeyedEncodingContainer.encode(_:) in conformance _XPCUnkeyedEncodingContainer(uint64_t a1)
{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, (void (*)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t))specialized static XPCEncoder.encode<A>(_:withCodingMetadata:));
}

{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, (void (*)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t))specialized static XPCEncoder.encode<A>(_:withCodingMetadata:));
}

{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, (void (*)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t))specialized static XPCEncoder.encode<A>(_:withCodingMetadata:));
}

{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, (void (*)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t))specialized static XPCEncoder.encode<A>(_:withCodingMetadata:));
}

{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, (void (*)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t))specialized static XPCEncoder.encode<A>(_:withCodingMetadata:));
}

{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, (void (*)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t))specialized static XPCEncoder.encode<A>(_:withCodingMetadata:));
}

{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, (void (*)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t))specialized static XPCEncoder.encode<A>(_:withCodingMetadata:));
}

{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, (void (*)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t))specialized static XPCEncoder.encode<A>(_:withCodingMetadata:));
}

{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, (void (*)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t))specialized static XPCEncoder.encode<A>(_:withCodingMetadata:));
}

{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, (void (*)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t))specialized static XPCEncoder.encode<A>(_:withCodingMetadata:));
}

uint64_t protocol witness for UnkeyedEncodingContainer.encode(_:) in conformance _XPCUnkeyedEncodingContainer()
{
  return UnkeyedEncodingContainer.encode(_:)();
}

{
  return UnkeyedEncodingContainer.encode(_:)();
}

uint64_t protocol witness for UnkeyedEncodingContainer.encode<A>(_:) in conformance _XPCUnkeyedEncodingContainer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, a2, a3);
}

uint64_t protocol witness for UnkeyedEncodingContainer.encodeConditional<A>(_:) in conformance _XPCUnkeyedEncodingContainer()
{
  return UnkeyedEncodingContainer.encodeConditional<A>(_:)();
}

uint64_t protocol witness for UnkeyedEncodingContainer.encode<A>(contentsOf:) in conformance _XPCUnkeyedEncodingContainer()
{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

uint64_t protocol witness for UnkeyedEncodingContainer.nestedContainer<A>(keyedBy:) in conformance _XPCUnkeyedEncodingContainer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _XPCUnkeyedEncodingContainer.nestedContainer<A>(keyedBy:)(a1, a2, a3);
}

uint64_t protocol witness for UnkeyedEncodingContainer.nestedUnkeyedContainer() in conformance _XPCUnkeyedEncodingContainer@<X0>(_QWORD *a1@<X8>)
{
  return _XPCUnkeyedEncodingContainer.nestedUnkeyedContainer()(a1);
}

uint64_t protocol witness for UnkeyedEncodingContainer.superEncoder() in conformance _XPCUnkeyedEncodingContainer@<X0>(uint64_t *a1@<X8>)
{
  return _XPCUnkeyedEncodingContainer.superEncoder()(a1);
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance _XPCUnkeyedEncodingContainer(uint64_t a1)
{
  return _XPCUnkeyedEncodingContainer.encode(to:)(a1);
}

_QWORD *protocol witness for SharableStorageContainer.init(codingMetadata:storage:) in conformance _XPCUnkeyedEncodingContainer@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;
  _QWORD *result;

  v7 = *a3;
  type metadata accessor for _XPCUnkeyedEncodingContainer();
  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = v7;
  *a4 = result;
  return result;
}

_QWORD *protocol witness for SharableStorageContainer.init(codingMetadata:initialStorage:) in conformance _XPCUnkeyedEncodingContainer@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;
  _QWORD *result;

  v7 = *a3;
  type metadata accessor for _XPCUnkeyedEncodingContainer();
  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = v7;
  *a4 = result;
  return result;
}

uint64_t sub_1DF040D78()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t specialized static XPCEncoder.encode<A>(_:withCodingMetadata:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20[2];
  uint64_t v21;
  char v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  v9 = type metadata accessor for _XPCEncoder();
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(_QWORD *)(v10 + 64) = 0;
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    v24 = v9;
    v25 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCEncoder, (uint64_t)&protocol conformance descriptor for _XPCEncoder);
    *(_QWORD *)&v23 = v10;
    swift_retain();
    Bool.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
    goto LABEL_9;
  }
  v11 = a1 & 1;
  v22 = a1 & 1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  v12 = MEMORY[0x1E0DEAFA0];
  if ((swift_dynamicCast() & 1) == 0)
  {
    v21 = 0;
    memset(v20, 0, sizeof(v20));
    outlined destroy of DecodingContainer?((uint64_t)v20, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    v14 = type metadata accessor for EncodingError();
    swift_allocError();
    v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(_QWORD *)(v16 + 24) = v12;
    *(_BYTE *)v16 = v11;
    *(_QWORD *)&v23 = 0;
    *((_QWORD *)&v23 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v16, *MEMORY[0x1E0DEC4B0], v14);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v20, (uint64_t)&v23);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v23);
    if (v24)
    {
      swift_release();
      return outlined init with take of Encodable(&v23, a4);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v23, &demangling cache variable for type metadata for EncodingContainer?);
    v17 = type metadata accessor for EncodingError();
    swift_allocError();
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(_QWORD *)(v19 + 24) = MEMORY[0x1E0DEAFA0];
    *(_BYTE *)v19 = a1 & 1;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v19, *MEMORY[0x1E0DEC4B0], v17);
    goto LABEL_12;
  }
  return swift_release();
}

{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19[2];
  uint64_t v20;
  char v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v9 = type metadata accessor for _XPCEncoder();
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(_QWORD *)(v10 + 64) = 0;
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    v23 = v9;
    v24 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCEncoder, (uint64_t)&protocol conformance descriptor for _XPCEncoder);
    *(_QWORD *)&v22 = v10;
    swift_retain();
    Int8.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  v11 = MEMORY[0x1E0DEDA70];
  if ((swift_dynamicCast() & 1) == 0)
  {
    v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    v13 = type metadata accessor for EncodingError();
    swift_allocError();
    v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(_QWORD *)(v15 + 24) = v11;
    *(_BYTE *)v15 = a1;
    *(_QWORD *)&v22 = 0;
    *((_QWORD *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v15, *MEMORY[0x1E0DEC4B0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a4);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    v16 = type metadata accessor for EncodingError();
    swift_allocError();
    v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(_QWORD *)(v18 + 24) = MEMORY[0x1E0DEDA70];
    *(_BYTE *)v18 = a1;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v18, *MEMORY[0x1E0DEC4B0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19[2];
  uint64_t v20;
  char v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v9 = type metadata accessor for _XPCEncoder();
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(_QWORD *)(v10 + 64) = 0;
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    v23 = v9;
    v24 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCEncoder, (uint64_t)&protocol conformance descriptor for _XPCEncoder);
    *(_QWORD *)&v22 = v10;
    swift_retain();
    UInt8.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  v11 = MEMORY[0x1E0DEDE70];
  if ((swift_dynamicCast() & 1) == 0)
  {
    v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    v13 = type metadata accessor for EncodingError();
    swift_allocError();
    v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(_QWORD *)(v15 + 24) = v11;
    *(_BYTE *)v15 = a1;
    *(_QWORD *)&v22 = 0;
    *((_QWORD *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v15, *MEMORY[0x1E0DEC4B0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a4);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    v16 = type metadata accessor for EncodingError();
    swift_allocError();
    v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(_QWORD *)(v18 + 24) = MEMORY[0x1E0DEDE70];
    *(_BYTE *)v18 = a1;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v18, *MEMORY[0x1E0DEC4B0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

uint64_t specialized static XPCEncoder.encode<A>(_:withCodingMetadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  __int128 v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;

  v11 = type metadata accessor for _XPCEncoder();
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 32) = 0u;
  *(_OWORD *)(v12 + 48) = 0u;
  *(_QWORD *)(v12 + 64) = 0;
  *(_QWORD *)(v12 + 16) = a3;
  *(_QWORD *)(v12 + 24) = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    v26 = v11;
    v27 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCEncoder, (uint64_t)&protocol conformance descriptor for _XPCEncoder);
    *(_QWORD *)&v25 = v12;
    swift_retain();
    String.encode(to:)();
    if (v5)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
    goto LABEL_9;
  }
  v23 = a1;
  v24 = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  v13 = MEMORY[0x1E0DEA968];
  if ((swift_dynamicCast() & 1) == 0)
  {
    v22 = 0;
    memset(v21, 0, sizeof(v21));
    outlined destroy of DecodingContainer?((uint64_t)v21, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    v15 = type metadata accessor for EncodingError();
    swift_allocError();
    v17 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    v17[3] = v13;
    *v17 = a1;
    v17[1] = a2;
    *(_QWORD *)&v25 = 0;
    *((_QWORD *)&v25 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v17, *MEMORY[0x1E0DEC4B0], v15);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v21, (uint64_t)&v25);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v25);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
  if (!v5)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v12 + 32, (uint64_t)&v25);
    if (v26)
    {
      swift_release();
      return outlined init with take of Encodable(&v25, a5);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v25, &demangling cache variable for type metadata for EncodingContainer?);
    v18 = type metadata accessor for EncodingError();
    swift_allocError();
    v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    v20[3] = MEMORY[0x1E0DEA968];
    *v20 = a1;
    v20[1] = a2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v20, *MEMORY[0x1E0DEC4B0], v18);
    goto LABEL_12;
  }
  return swift_release();
}

uint64_t specialized static XPCEncoder.encode<A>(_:withCodingMetadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19[2];
  uint64_t v20;
  double v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v9 = type metadata accessor for _XPCEncoder();
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(_QWORD *)(v10 + 64) = 0;
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    v23 = v9;
    v24 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCEncoder, (uint64_t)&protocol conformance descriptor for _XPCEncoder);
    *(_QWORD *)&v22 = v10;
    swift_retain();
    Double.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  v21 = a4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  v11 = MEMORY[0x1E0DEB070];
  if ((swift_dynamicCast() & 1) == 0)
  {
    v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    v13 = type metadata accessor for EncodingError();
    swift_allocError();
    v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(_QWORD *)(v15 + 24) = v11;
    *(double *)v15 = a4;
    *(_QWORD *)&v22 = 0;
    *((_QWORD *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v15, *MEMORY[0x1E0DEC4B0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a3);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    v16 = type metadata accessor for EncodingError();
    swift_allocError();
    v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(_QWORD *)(v18 + 24) = MEMORY[0x1E0DEB070];
    *(double *)v18 = a4;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v18, *MEMORY[0x1E0DEC4B0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

uint64_t specialized static XPCEncoder.encode<A>(_:withCodingMetadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, float a4@<S0>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19[2];
  uint64_t v20;
  float v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v9 = type metadata accessor for _XPCEncoder();
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(_QWORD *)(v10 + 64) = 0;
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    v23 = v9;
    v24 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCEncoder, (uint64_t)&protocol conformance descriptor for _XPCEncoder);
    *(_QWORD *)&v22 = v10;
    swift_retain();
    Float.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  v21 = a4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  v11 = MEMORY[0x1E0DEB188];
  if ((swift_dynamicCast() & 1) == 0)
  {
    v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    v13 = type metadata accessor for EncodingError();
    swift_allocError();
    v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(_QWORD *)(v15 + 24) = v11;
    *(float *)v15 = a4;
    *(_QWORD *)&v22 = 0;
    *((_QWORD *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v15, *MEMORY[0x1E0DEC4B0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a3);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    v16 = type metadata accessor for EncodingError();
    swift_allocError();
    v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(_QWORD *)(v18 + 24) = MEMORY[0x1E0DEB188];
    *(float *)v18 = a4;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v18, *MEMORY[0x1E0DEC4B0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

uint64_t specialized static XPCEncoder.encode<A>(_:withCodingMetadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  __int128 v19[2];
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v9 = type metadata accessor for _XPCEncoder();
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(_QWORD *)(v10 + 64) = 0;
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    v23 = v9;
    v24 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCEncoder, (uint64_t)&protocol conformance descriptor for _XPCEncoder);
    *(_QWORD *)&v22 = v10;
    swift_retain();
    Int.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  v11 = MEMORY[0x1E0DEB418];
  if ((swift_dynamicCast() & 1) == 0)
  {
    v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    v13 = type metadata accessor for EncodingError();
    swift_allocError();
    v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    v15[3] = v11;
    *v15 = a1;
    *(_QWORD *)&v22 = 0;
    *((_QWORD *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v15, *MEMORY[0x1E0DEC4B0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a4);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    v16 = type metadata accessor for EncodingError();
    swift_allocError();
    v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    v18[3] = MEMORY[0x1E0DEB418];
    *v18 = a1;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v18, *MEMORY[0x1E0DEC4B0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  __int128 v19[2];
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v9 = type metadata accessor for _XPCEncoder();
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(_QWORD *)(v10 + 64) = 0;
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    v23 = v9;
    v24 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCEncoder, (uint64_t)&protocol conformance descriptor for _XPCEncoder);
    *(_QWORD *)&v22 = v10;
    swift_retain();
    Int64.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  v11 = MEMORY[0x1E0DEDC60];
  if ((swift_dynamicCast() & 1) == 0)
  {
    v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    v13 = type metadata accessor for EncodingError();
    swift_allocError();
    v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    v15[3] = v11;
    *v15 = a1;
    *(_QWORD *)&v22 = 0;
    *((_QWORD *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v15, *MEMORY[0x1E0DEC4B0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a4);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    v16 = type metadata accessor for EncodingError();
    swift_allocError();
    v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    v18[3] = MEMORY[0x1E0DEDC60];
    *v18 = a1;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v18, *MEMORY[0x1E0DEC4B0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  __int128 v19[2];
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v9 = type metadata accessor for _XPCEncoder();
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(_QWORD *)(v10 + 64) = 0;
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    v23 = v9;
    v24 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCEncoder, (uint64_t)&protocol conformance descriptor for _XPCEncoder);
    *(_QWORD *)&v22 = v10;
    swift_retain();
    UInt.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  v11 = MEMORY[0x1E0DEBB98];
  if ((swift_dynamicCast() & 1) == 0)
  {
    v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    v13 = type metadata accessor for EncodingError();
    swift_allocError();
    v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    v15[3] = v11;
    *v15 = a1;
    *(_QWORD *)&v22 = 0;
    *((_QWORD *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v15, *MEMORY[0x1E0DEC4B0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a4);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    v16 = type metadata accessor for EncodingError();
    swift_allocError();
    v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    v18[3] = MEMORY[0x1E0DEBB98];
    *v18 = a1;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v18, *MEMORY[0x1E0DEC4B0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  __int128 v19[2];
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v9 = type metadata accessor for _XPCEncoder();
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(_QWORD *)(v10 + 64) = 0;
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    v23 = v9;
    v24 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCEncoder, (uint64_t)&protocol conformance descriptor for _XPCEncoder);
    *(_QWORD *)&v22 = v10;
    swift_retain();
    UInt64.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  v11 = MEMORY[0x1E0DEE190];
  if ((swift_dynamicCast() & 1) == 0)
  {
    v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    v13 = type metadata accessor for EncodingError();
    swift_allocError();
    v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    v15[3] = v11;
    *v15 = a1;
    *(_QWORD *)&v22 = 0;
    *((_QWORD *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v15, *MEMORY[0x1E0DEC4B0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a4);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    v16 = type metadata accessor for EncodingError();
    swift_allocError();
    v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    v18[3] = MEMORY[0x1E0DEE190];
    *v18 = a1;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v18, *MEMORY[0x1E0DEC4B0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

uint64_t specialized static XPCEncoder.encode<A>(_:withCodingMetadata:)@<X0>(__int16 a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19[2];
  uint64_t v20;
  __int16 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v9 = type metadata accessor for _XPCEncoder();
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(_QWORD *)(v10 + 64) = 0;
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    v23 = v9;
    v24 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCEncoder, (uint64_t)&protocol conformance descriptor for _XPCEncoder);
    *(_QWORD *)&v22 = v10;
    swift_retain();
    Int16.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  v11 = MEMORY[0x1E0DEDB58];
  if ((swift_dynamicCast() & 1) == 0)
  {
    v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    v13 = type metadata accessor for EncodingError();
    swift_allocError();
    v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(_QWORD *)(v15 + 24) = v11;
    *(_WORD *)v15 = a1;
    *(_QWORD *)&v22 = 0;
    *((_QWORD *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v15, *MEMORY[0x1E0DEC4B0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a4);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    v16 = type metadata accessor for EncodingError();
    swift_allocError();
    v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(_QWORD *)(v18 + 24) = MEMORY[0x1E0DEDB58];
    *(_WORD *)v18 = a1;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v18, *MEMORY[0x1E0DEC4B0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19[2];
  uint64_t v20;
  __int16 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v9 = type metadata accessor for _XPCEncoder();
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(_QWORD *)(v10 + 64) = 0;
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    v23 = v9;
    v24 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCEncoder, (uint64_t)&protocol conformance descriptor for _XPCEncoder);
    *(_QWORD *)&v22 = v10;
    swift_retain();
    UInt16.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  v11 = MEMORY[0x1E0DEE068];
  if ((swift_dynamicCast() & 1) == 0)
  {
    v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    v13 = type metadata accessor for EncodingError();
    swift_allocError();
    v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(_QWORD *)(v15 + 24) = v11;
    *(_WORD *)v15 = a1;
    *(_QWORD *)&v22 = 0;
    *((_QWORD *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v15, *MEMORY[0x1E0DEC4B0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a4);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    v16 = type metadata accessor for EncodingError();
    swift_allocError();
    v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(_QWORD *)(v18 + 24) = MEMORY[0x1E0DEE068];
    *(_WORD *)v18 = a1;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v18, *MEMORY[0x1E0DEC4B0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

uint64_t specialized static XPCEncoder.encode<A>(_:withCodingMetadata:)@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19[2];
  uint64_t v20;
  int v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v9 = type metadata accessor for _XPCEncoder();
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(_QWORD *)(v10 + 64) = 0;
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    v23 = v9;
    v24 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCEncoder, (uint64_t)&protocol conformance descriptor for _XPCEncoder);
    *(_QWORD *)&v22 = v10;
    swift_retain();
    Int32.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  v11 = MEMORY[0x1E0DEDBC8];
  if ((swift_dynamicCast() & 1) == 0)
  {
    v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    v13 = type metadata accessor for EncodingError();
    swift_allocError();
    v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(_QWORD *)(v15 + 24) = v11;
    *(_DWORD *)v15 = a1;
    *(_QWORD *)&v22 = 0;
    *((_QWORD *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v15, *MEMORY[0x1E0DEC4B0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a4);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    v16 = type metadata accessor for EncodingError();
    swift_allocError();
    v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(_QWORD *)(v18 + 24) = MEMORY[0x1E0DEDBC8];
    *(_DWORD *)v18 = a1;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v18, *MEMORY[0x1E0DEC4B0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19[2];
  uint64_t v20;
  int v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v9 = type metadata accessor for _XPCEncoder();
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(_QWORD *)(v10 + 64) = 0;
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    v23 = v9;
    v24 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCEncoder, (uint64_t)&protocol conformance descriptor for _XPCEncoder);
    *(_QWORD *)&v22 = v10;
    swift_retain();
    UInt32.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  v11 = MEMORY[0x1E0DEE0F8];
  if ((swift_dynamicCast() & 1) == 0)
  {
    v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    v13 = type metadata accessor for EncodingError();
    swift_allocError();
    v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(_QWORD *)(v15 + 24) = v11;
    *(_DWORD *)v15 = a1;
    *(_QWORD *)&v22 = 0;
    *((_QWORD *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v15, *MEMORY[0x1E0DEC4B0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a4);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    v16 = type metadata accessor for EncodingError();
    swift_allocError();
    v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(_QWORD *)(v18 + 24) = MEMORY[0x1E0DEE0F8];
    *(_DWORD *)v18 = a1;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v18, *MEMORY[0x1E0DEC4B0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v13 = a4;
  v14 = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  v10 = *a3;
  *(_QWORD *)(v10 + 16) = a1 + 1;
  return outlined init with take of Encodable(&v12, v10 + 40 * a1 + 32);
}

uint64_t dispatch thunk of SharableStorageContainer.init(codingMetadata:storage:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of SharableStorageContainer.init(codingMetadata:initialStorage:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t static SharableStorageContainer.getExisting<A>(container:codingMetadata:initialStorage:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  char v29;
  uint64_t result;
  void (*v31)(uint64_t, uint64_t, char *, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[2];
  void (*v35)(_QWORD, uint64_t);
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t AssociatedTypeWitness;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[24];
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  _QWORD v51[3];
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v41 = a5;
  v44 = a3;
  v45 = a4;
  v43 = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v39 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v12 = (char *)v34 - v11;
  v13 = swift_getAssociatedTypeWitness();
  v14 = type metadata accessor for Optional();
  v38 = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x1E0C80A78](v14);
  v17 = (char *)v34 - v16;
  v18 = *(_QWORD *)(v13 - 8);
  v19 = MEMORY[0x1E0C80A78](v15);
  v37 = (char *)v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v19);
  v22 = (char *)v34 - v21;
  v42 = a2;
  outlined init with copy of CodingContainer?(a2, (uint64_t)v46);
  if (!v47)
  {
    outlined destroy of DecodingContainer?((uint64_t)v46, &demangling cache variable for type metadata for CodingContainer?);
    v48 = 0u;
    v49 = 0u;
    v50 = 0;
LABEL_8:
    v23 = v54;
    goto LABEL_9;
  }
  v36 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingContainer);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SharableStorageContainer);
  if ((swift_dynamicCast() & 1) == 0)
  {
    v50 = 0;
    v48 = 0u;
    v49 = 0u;
    goto LABEL_8;
  }
  v23 = v54;
  if (!*((_QWORD *)&v49 + 1))
  {
LABEL_9:
    result = outlined destroy of DecodingContainer?((uint64_t)&v48, &demangling cache variable for type metadata for SharableStorageContainer?);
    goto LABEL_10;
  }
  outlined init with take of Encodable(&v48, (uint64_t)v51);
  v24 = v53;
  v34[0] = v52;
  v34[1] = __swift_project_boxed_opaque_existential_1(v51, v52);
  v35 = *(void (**)(_QWORD, uint64_t))(v24 + 24);
  *((_QWORD *)&v49 + 1) = swift_getAssociatedTypeWitness();
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v48);
  v35(v34[0], v24);
  v25 = swift_dynamicCast();
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  if (v25)
  {
    v26(v17, 0, 1, v13);
    v27 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
    v27(v22, v17, v13);
    v28 = v37;
    v27(v37, v22, v13);
    (*(void (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t))(a9 + 32))(v44, v45, v28, a7, a9);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    v29 = 0;
    return v29 & 1;
  }
  v26(v17, 1, 1, v13);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v17, v36);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
  v23 = v54;
LABEL_10:
  if (!*(_QWORD *)(v42 + 24))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v12, v41, AssociatedTypeWitness);
    v31 = *(void (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t))(a9 + 40);
    v32 = v44;
    swift_bridgeObjectRetain();
    v33 = v45;
    swift_bridgeObjectRetain();
    v31(v32, v33, v12, a7, a9);
    if (!v23)
      v29 = 1;
    return v29 & 1;
  }
  __break(1u);
  return result;
}

uint64_t static SharableStorageContainer.getExisting<A>(container:codingMetadata:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v16 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v17 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v19 = (char *)&v23 - v18;
  (*(void (**)(uint64_t, uint64_t))(a9 + 8))(v17, a9);
  LOBYTE(a4) = static SharableStorageContainer.getExisting<A>(container:codingMetadata:initialStorage:)(a1, a2, a3, a4, (uint64_t)v19, v20, a6, v21, a8);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v19, AssociatedTypeWitness);
  return a4 & 1;
}

uint64_t specialized static SharableStorageContainer.getExisting<A>(container:codingMetadata:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  type metadata accessor for _XPCUnkeyedEncodingContainer.UnkeyedEncodingStorage();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = MEMORY[0x1E0DEE9D8];
  LOBYTE(a4) = specialized static SharableStorageContainer.getExisting<A>(container:codingMetadata:initialStorage:)(a1, a2, a3, a4, v8);
  swift_release();
  return a4 & 1;
}

uint64_t XPCEncoder.__allocating_init(userInfo:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t XPCEncoder.init(userInfo:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t static XPCEncoder.encode<A>(_:withCodingMetadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29[2];
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v28 = a5;
  v34 = a1;
  v24 = a6;
  v9 = *(_QWORD *)(a4 - 8);
  MEMORY[0x1E0C80A78](a1);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for _XPCEncoder();
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 32) = 0u;
  *(_OWORD *)(v13 + 48) = 0u;
  *(_QWORD *)(v13 + 64) = 0;
  *(_QWORD *)(v13 + 16) = a2;
  *(_QWORD *)(v13 + 24) = a3;
  type metadata accessor for XPCCodableObjectRepresentableCache();
  v25 = a2;
  swift_bridgeObjectRetain();
  v26 = a3;
  swift_bridgeObjectRetain();
  if ((static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)(a4, a4) & 1) == 0)
  {
    v32 = v12;
    v33 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, v14, (uint64_t (*)(uint64_t))type metadata accessor for _XPCEncoder, (uint64_t)&protocol conformance descriptor for _XPCEncoder);
    *(_QWORD *)&v31 = v13;
    swift_retain();
    v17 = v34;
    v18 = v27;
    dispatch thunk of Encodable.encode(to:)();
    if (v18)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v31);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v31);
    goto LABEL_9;
  }
  v16 = v27;
  v15 = v28;
  v17 = v34;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v34, a4);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  if (!swift_dynamicCast())
  {
    v30 = 0;
    memset(v29, 0, sizeof(v29));
    v20 = outlined destroy of DecodingContainer?((uint64_t)v29, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    MEMORY[0x1E0C80A78](v20);
    *(&v23 - 2) = a4;
    *(&v23 - 1) = v15;
    type metadata accessor for EncodingError();
    swift_allocError();
    encodingError<A>(codingMetadata:value:message:)(v17, (void (*)(uint64_t))partial apply for implicit closure #1 in static XPCEncoder.encode<A>(_:withCodingMetadata:), a4, v21);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v29, (uint64_t)&v31);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v31);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v31);
  if (!v16)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v13 + 32, (uint64_t)&v31);
    if (v32)
    {
      swift_release();
      return outlined init with take of Encodable(&v31, v24);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v31, &demangling cache variable for type metadata for EncodingContainer?);
    type metadata accessor for EncodingError();
    swift_allocError();
    encodingError<A>(codingMetadata:value:message:)(v17, (void (*)(uint64_t))implicit closure #1 in default argument 2 of encodingError<A>(codingMetadata:value:message:), a4, v22);
    goto LABEL_12;
  }
  return swift_release();
}

uint64_t implicit closure #1 in static XPCEncoder.encode<A>(_:withCodingMetadata:)()
{
  Swift::String v0;
  Swift::String v1;
  Swift::String v2;

  _StringGuts.grow(_:)(49);
  v0._countAndFlagsBits = 0x6465746365707845;
  v0._object = (void *)0xEE00206570797420;
  String.append(_:)(v0);
  v1._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._object = (void *)0x80000001DF04FB90;
  v2._countAndFlagsBits = 0xD000000000000021;
  String.append(_:)(v2);
  return 0;
}

uint64_t XPCEncoder.encode<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;

  type metadata accessor for XPCEncoder();
  v8 = *(_QWORD *)(v3 + 16);
  swift_bridgeObjectRetain();
  v9 = MEMORY[0x1E0DEE9D8];
  static XPCEncoder.encode<A>(_:withCodingMetadata:)(a1, MEMORY[0x1E0DEE9D8], v8, a2, a3, (uint64_t)v14);
  swift_bridgeObjectRelease();
  if (!v4)
  {
    type metadata accessor for EncodingBuffer();
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v9;
    v11 = v15;
    v12 = v16;
    __swift_project_boxed_opaque_existential_1(v14, v15);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, v11, v12);
    swift_beginAccess();
    v9 = *(_QWORD *)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  }
  return v9;
}

uint64_t type metadata accessor for XPCEncoder()
{
  return objc_opt_self();
}

uint64_t XPCEncoder.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t XPCEncoder.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t _XPCEncoder.encode(to:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  __int128 v6;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  swift_beginAccess();
  outlined init with copy of EncodingContainer?(v1 + 32, (uint64_t)&v6);
  if (!v7)
    return outlined destroy of DecodingContainer?((uint64_t)&v6, &demangling cache variable for type metadata for EncodingContainer?);
  outlined init with take of Encodable(&v6, (uint64_t)v8);
  v3 = v9;
  v4 = v10;
  __swift_project_boxed_opaque_existential_1(v8, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a1, v3, v4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t _XPCEncoder.container<A>(keyedBy:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  _UNKNOWN **v24;

  v6 = v3 + 32;
  swift_beginAccess();
  outlined init with copy of EncodingContainer?(v3 + 32, (uint64_t)v19);
  v7 = v20;
  if (v20)
  {
    v8 = v21;
    v9 = __swift_project_boxed_opaque_existential_1(v19, v20);
    *((_QWORD *)&v23 + 1) = v7;
    v24 = *(_UNKNOWN ***)(v8 + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v22);
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(boxed_opaque_existential_1, v9, v7);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  }
  else
  {
    outlined destroy of DecodingContainer?((uint64_t)v19, &demangling cache variable for type metadata for EncodingContainer?);
    v22 = 0u;
    v23 = 0u;
    v24 = 0;
  }
  v12 = type metadata accessor for _XPCKeyedEncodingContainer(0, a2, a3, v11);
  v13 = *(_QWORD *)(v3 + 16);
  v14 = *(_QWORD *)(v3 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v15 = static SharableStorageContainer.getExisting<A>(container:codingMetadata:)((uint64_t)v19, (uint64_t)&v22, v13, v14, v12, v12, (uint64_t)&protocol witness table for _XPCKeyedEncodingContainer<A>, (uint64_t)&protocol witness table for _XPCKeyedEncodingContainer<A>, (uint64_t)&protocol witness table for KeyedEncodingStorage);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for CodingContainer?);
  v16 = v19[0];
  if ((v15 & 1) == 0)
    goto LABEL_7;
  *((_QWORD *)&v23 + 1) = v12;
  v24 = &protocol witness table for _XPCKeyedEncodingContainer<A>;
  *(_QWORD *)&v22 = v19[0];
  outlined init with copy of EncodingContainer?(v6, (uint64_t)v19);
  v17 = v20;
  swift_retain();
  result = outlined destroy of DecodingContainer?((uint64_t)v19, &demangling cache variable for type metadata for EncodingContainer?);
  if (!v17)
  {
    swift_beginAccess();
    outlined assign with take of EncodingContainer?((uint64_t)&v22, v6);
    swift_endAccess();
LABEL_7:
    *(_QWORD *)&v22 = v16;
    MEMORY[0x1DF0F49E8](&protocol conformance descriptor for _XPCKeyedEncodingContainer<A>, v12);
    return KeyedEncodingContainer.init<A>(_:)();
  }
  __break(1u);
  return result;
}

uint64_t _XPCEncoder.unkeyedContainer()@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  _UNKNOWN **v19;

  v3 = v1 + 32;
  swift_beginAccess();
  outlined init with copy of EncodingContainer?(v1 + 32, (uint64_t)v14);
  v4 = v15;
  if (v15)
  {
    v5 = v16;
    v6 = __swift_project_boxed_opaque_existential_1(v14, v15);
    *((_QWORD *)&v18 + 1) = v4;
    v19 = *(_UNKNOWN ***)(v5 + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v17);
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(boxed_opaque_existential_1, v6, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  }
  else
  {
    outlined destroy of DecodingContainer?((uint64_t)v14, &demangling cache variable for type metadata for EncodingContainer?);
    v17 = 0u;
    v18 = 0u;
    v19 = 0;
  }
  v9 = *(_QWORD *)(v1 + 16);
  v8 = *(_QWORD *)(v1 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10 = specialized static SharableStorageContainer.getExisting<A>(container:codingMetadata:)(v14, (uint64_t)&v17, v9, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of DecodingContainer?((uint64_t)&v17, &demangling cache variable for type metadata for CodingContainer?);
  v11 = v14[0];
  if ((v10 & 1) == 0)
    goto LABEL_7;
  *((_QWORD *)&v18 + 1) = type metadata accessor for _XPCUnkeyedEncodingContainer();
  v19 = &protocol witness table for _XPCUnkeyedEncodingContainer;
  *(_QWORD *)&v17 = v11;
  outlined init with copy of EncodingContainer?(v3, (uint64_t)v14);
  v12 = v15;
  swift_retain();
  result = outlined destroy of DecodingContainer?((uint64_t)v14, &demangling cache variable for type metadata for EncodingContainer?);
  if (!v12)
  {
    swift_beginAccess();
    outlined assign with take of EncodingContainer?((uint64_t)&v17, v3);
    swift_endAccess();
LABEL_7:
    a1[3] = type metadata accessor for _XPCUnkeyedEncodingContainer();
    result = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCUnkeyedEncodingContainer and conformance _XPCUnkeyedEncodingContainer, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCUnkeyedEncodingContainer, (uint64_t)&protocol conformance descriptor for _XPCUnkeyedEncodingContainer);
    a1[4] = result;
    *a1 = v11;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t _XPCEncoder.singleValueContainer()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  _BYTE v10[24];
  uint64_t v11;
  _QWORD v12[5];

  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  v5 = type metadata accessor for _XPCSingleValueEncodingContainer();
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 32) = 0u;
  *(_OWORD *)(v6 + 48) = 0u;
  *(_QWORD *)(v6 + 64) = 0;
  *(_QWORD *)(v6 + 16) = v3;
  *(_QWORD *)(v6 + 24) = v4;
  v12[3] = v5;
  v12[4] = &protocol witness table for _XPCSingleValueEncodingContainer;
  v12[0] = v6;
  v7 = v1 + 32;
  swift_beginAccess();
  outlined init with copy of EncodingContainer?(v1 + 32, (uint64_t)v10);
  v8 = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  result = outlined destroy of DecodingContainer?((uint64_t)v10, &demangling cache variable for type metadata for EncodingContainer?);
  if (v8)
  {
    __break(1u);
  }
  else
  {
    swift_beginAccess();
    outlined assign with take of EncodingContainer?((uint64_t)v12, v7);
    swift_endAccess();
    a1[3] = v5;
    result = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCSingleValueEncodingContainer and conformance _XPCSingleValueEncodingContainer, 255, (uint64_t (*)(uint64_t))type metadata accessor for _XPCSingleValueEncodingContainer, (uint64_t)&protocol conformance descriptor for _XPCSingleValueEncodingContainer);
    a1[4] = result;
    *a1 = v6;
  }
  return result;
}

uint64_t _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  Swift::UInt v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;
  _QWORD v18[7];

  v2 = v1;
  v4 = a1[3];
  v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v5 + 16))(v18, v4, v5);
  v6 = v18[0];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  swift_getDynamicType();
  v7 = (*(uint64_t (**)(void))(a1[4] + 24))();
  v8 = MEMORY[0x1DF0F4CB8](v6);
  LOBYTE(v5) = specialized Set.contains(_:)(v8, v7);
  swift_bridgeObjectRelease();
  if ((v5 & 1) != 0)
  {
    v18[6] = v6;
    v18[3] = type metadata accessor for _XPCEncoder();
    v18[4] = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, v9, (uint64_t (*)(uint64_t))type metadata accessor for _XPCEncoder, (uint64_t)&protocol conformance descriptor for _XPCEncoder);
    v18[0] = v2;
    swift_retain();
    XPCCodableObject.encode(to:)(v18);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  }
  else
  {
    v10 = type metadata accessor for EncodingError();
    swift_allocError();
    v12 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    v12[3] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    v13 = swift_allocObject();
    *v12 = v13;
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)a1, v13 + 16);
    v18[0] = 0;
    v18[1] = 0xE000000000000000;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(62);
    v14._object = (void *)0x80000001DF04FB40;
    v14._countAndFlagsBits = 0xD00000000000002CLL;
    String.append(_:)(v14);
    _print_unlocked<A, B>(_:_:)();
    v15._countAndFlagsBits = 0x6F206562206F7420;
    v15._object = (void *)0xEE0020666F20656ELL;
    String.append(_:)(v15);
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    swift_getDynamicType();
    (*(void (**)(void))(a1[4] + 24))();
    v16._countAndFlagsBits = Set.description.getter();
    String.append(_:)(v16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v10 - 8) + 104))(v12, *MEMORY[0x1E0DEC4B0], v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_willThrow();
  }
  return swift_unknownObjectRelease();
}

uint64_t _XPCEncoder.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of DecodingContainer?(v0 + 32, &demangling cache variable for type metadata for EncodingContainer?);
  return swift_deallocClassInstance();
}

uint64_t protocol witness for Encoder.container<A>(keyedBy:) in conformance _XPCEncoder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _XPCEncoder.container<A>(keyedBy:)(a1, a2, a3);
}

uint64_t protocol witness for Encoder.unkeyedContainer() in conformance _XPCEncoder@<X0>(_QWORD *a1@<X8>)
{
  return _XPCEncoder.unkeyedContainer()(a1);
}

uint64_t protocol witness for Encoder.singleValueContainer() in conformance _XPCEncoder@<X0>(uint64_t *a1@<X8>)
{
  return _XPCEncoder.singleValueContainer()(a1);
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance _XPCEncoder(uint64_t a1)
{
  return _XPCEncoder.encode(to:)(a1);
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance _XPCEncoder()
{
  return 19;
}

uint64_t method lookup function for XPCEncoder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCEncoder.__allocating_init(userInfo:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of XPCEncoder.encode<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t type metadata accessor for _XPCEncoder()
{
  return objc_opt_self();
}

uint64_t sub_1DF0450F4()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in static XPCEncoder.encode<A>(_:withCodingMetadata:)()
{
  return implicit closure #1 in static XPCEncoder.encode<A>(_:withCodingMetadata:)();
}

uint64_t XPCReceivedMessage.reply<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char key[16];

  static XPCReceivedMessage.encodeMessage<A>(_:isSync:)(a1, 0, a2, a3, (xpc_object_t *)key);
  swift_unknownObjectRetain();
  if (xpc_dictionary_expects_reply())
    xpc_dictionary_send_reply_4SWIFT();
  swift_unknownObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t XPCReceivedMessage.decode<A>(as:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void **v3;
  uint64_t v4;
  uint64_t v5;
  void *v9;
  uint64_t v10;
  const void *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  unint64_t v26;
  int64_t v27;
  _QWORD v28[2];
  char key[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = *v3;
  swift_unknownObjectRetain();
  *(_OWORD *)key = xmmword_1DF04C0C0;
  closure #1 in XPCDictionary.subscript.getter(key, v9, v28);
  if (!v4)
  {
    v3 = (void **)v28[0];
    v5 = v28[1];
  }
  swift_unknownObjectRelease();
  if (v5)
  {
    lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
    swift_allocError();
    *(_BYTE *)v10 = 0;
    *(_QWORD *)(v10 + 8) = v3;
    *(_QWORD *)(v10 + 16) = v5;
    return swift_willThrow();
  }
  v27 = 0;
  swift_unknownObjectRetain();
  *(_OWORD *)key = xmmword_1DF04C0D0;
  v11 = closure #1 in XPCDictionary.subscript.getter(key, v9, (size_t *)&v27, v28);
  if (!v4)
    v11 = (const void *)v28[0];
  if (v27 < 1 || !v11)
  {
    swift_unknownObjectRelease();
    v22 = type metadata accessor for DecodingError();
    swift_allocError();
    v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *v24 = a1;
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v24, *MEMORY[0x1E0DEC460], v22);
    return swift_willThrow();
  }
  v12 = specialized _copyCollectionToContiguousArray<A>(_:)(v11, v27);
  swift_unknownObjectRelease();
  swift_unknownObjectRetain_n();
  specialized String.withCString<A>(_:)(v9, 0xD000000000000011, 0x80000001DF04FC20, key);
  swift_unknownObjectRelease();
  v13 = *(_QWORD *)key;
  if (*(_QWORD *)key)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CodingUserInfoKey, Any)>);
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CodingUserInfoKey, Any));
    v15 = *(unsigned __int8 *)(*(_QWORD *)(v14 - 8) + 80);
    v16 = (v15 + 32) & ~v15;
    v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_1DF04A630;
    v18 = v17 + v16;
    v19 = (_QWORD *)(v18 + *(int *)(v14 + 48));
    if (one-time initialization token for xpcCodable != -1)
      swift_once();
    v20 = type metadata accessor for CodingUserInfoKey();
    v21 = __swift_project_value_buffer(v20, (uint64_t)static CodingUserInfoKey.xpcCodable);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v21, v20);
    v19[3] = &type metadata for XPCArray;
    *v19 = v13;
  }
  else
  {
    v17 = MEMORY[0x1E0DEE9D8];
  }
  v26 = specialized Dictionary.init(dictionaryLiteral:)(v17);
  type metadata accessor for XPCDecoder();
  *(_QWORD *)(swift_initStackObject() + 16) = v26;
  XPCDecoder.decode<A>(_:from:)((uint64_t)v12, a2, a3);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t static XPCReceivedMessage.encodeMessage<A>(_:isSync:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, xpc_object_t *a5@<X8>)
{
  uint64_t v5;
  xpc_object_t empty;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _xpc_connection_s *v20;

  empty = xpc_array_create_empty();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CodingUserInfoKey, Any)>);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CodingUserInfoKey, Any));
  v11 = *(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80);
  v12 = (v11 + 32) & ~v11;
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1DF04A630;
  v14 = v13 + v12;
  v15 = (_QWORD *)(v13 + v12 + *(int *)(v10 + 48));
  if (one-time initialization token for xpcCodable != -1)
    swift_once();
  v16 = type metadata accessor for CodingUserInfoKey();
  v17 = __swift_project_value_buffer(v16, (uint64_t)static CodingUserInfoKey.xpcCodable);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v17, v16);
  v15[3] = &type metadata for XPCArray;
  *v15 = empty;
  swift_unknownObjectRetain();
  v18 = specialized Dictionary.init(dictionaryLiteral:)(v13);
  type metadata accessor for XPCEncoder();
  *(_QWORD *)(swift_initStackObject() + 16) = v18;
  v19 = XPCEncoder.encode<A>(_:)(a1, a3, a4);
  swift_bridgeObjectRelease();
  if (!v5)
  {
    *a5 = xpc_dictionary_create_empty();
    swift_bridgeObjectRetain();
    specialized String.withCString<A>(_:)(0x656C6261646F435FLL, 0xEC00000079646F42, a5, v19);
    swift_bridgeObjectRelease();
    v20 = (_xpc_connection_s *)xpc_BOOL_create(a2 & 1);
    swift_unknownObjectRetain();
    specialized String.withCString<A>(_:)(0x656C6261646F435FLL, 0xEE00636E79537349, v20, a5);
    swift_unknownObjectRelease();
    swift_unknownObjectRetain();
    specialized String.withCString<A>(_:)(0xD000000000000011, 0x80000001DF04FC20, a5, empty);
  }
  return swift_unknownObjectRelease();
}

_QWORD *specialized String.withCString<A>(_:)(_QWORD *(*a1)(uint64_t *__return_ptr, _QWORD *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return specialized String.withCString<A>(_:)(a1, a2, a3, a4, (uint64_t *)&demangling cache variable for type metadata for OS_xpc_object?);
}

{
  return specialized String.withCString<A>(_:)(a1, a2, a3, a4, (uint64_t *)&demangling cache variable for type metadata for UnsafeRawPointer?);
}

uint64_t specialized String.withCString<A>(_:)(uint64_t (*a1)(_QWORD *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  _QWORD v7[2];

  if ((a4 & 0x1000000000000000) != 0 || !(a4 & 0x2000000000000000 | a3 & 0x1000000000000000))
    return _StringGuts._slowWithCString<A>(_:)();
  if ((a4 & 0x2000000000000000) != 0)
  {
    v7[0] = a3;
    v7[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    v5 = v7;
  }
  else if ((a3 & 0x1000000000000000) != 0)
  {
    v5 = (_QWORD *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    v5 = (_QWORD *)_StringObject.sharedUTF8.getter();
  }
  return a1(v5);
}

double specialized String.withCString<A>(_:)(void (*a1)(__int128 *__return_ptr, _QWORD *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  double result;
  __int128 v8;
  __int128 v9;
  _QWORD v10[2];

  if ((a4 & 0x1000000000000000) != 0 || !(a4 & 0x2000000000000000 | a3 & 0x1000000000000000))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    _StringGuts._slowWithCString<A>(_:)();
    if (!v4)
      return *(double *)&v9;
  }
  else if ((a4 & 0x2000000000000000) != 0)
  {
    v10[0] = a3;
    v10[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    a1(&v8, v10);
    if (!v4)
      return *(double *)&v8;
  }
  else
  {
    if ((a3 & 0x1000000000000000) != 0)
      v6 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
    else
      v6 = _StringObject.sharedUTF8.getter();
    a1((__int128 *)v10, (_QWORD *)v6);
    if (!v4)
      return *(double *)v10;
  }
  return result;
}

_QWORD *specialized String.withCString<A>(_:)(_QWORD *(*a1)(uint64_t *__return_ptr, _QWORD *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  _QWORD v10[3];

  if ((a4 & 0x1000000000000000) != 0 || !(a4 & 0x2000000000000000 | a3 & 0x1000000000000000))
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    result = (_QWORD *)_StringGuts._slowWithCString<A>(_:)();
    if (!v5)
      return (_QWORD *)v10[2];
  }
  else if ((a4 & 0x2000000000000000) != 0)
  {
    v10[0] = a3;
    v10[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    result = a1(&v9, v10);
    if (!v5)
      return (_QWORD *)v9;
  }
  else
  {
    if ((a3 & 0x1000000000000000) != 0)
      v7 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
    else
      v7 = _StringObject.sharedUTF8.getter();
    result = a1(v10, (_QWORD *)v7);
    if (!v5)
      return (_QWORD *)v10[0];
  }
  return result;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CodingUserInfoKey, Any));
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CodingUserInfoKey, Any>);
  v6 = static _DictionaryStorage.allocate(capacity:)();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = &v5[*(int *)(v2 + 48)];
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    outlined init with copy of (String, DecodingContainer)(v12, (uint64_t)v5, &demangling cache variable for type metadata for (CodingUserInfoKey, Any));
    result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = type metadata accessor for CodingUserInfoKey();
    (*(void (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    result = (unint64_t)outlined init with take of Any(v9, (_OWORD *)(v7[7] + 32 * v16));
    v19 = v7[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

{
  return specialized Dictionary.init(dictionaryLiteral:)(a1, &demangling cache variable for type metadata for _DictionaryStorage<String, DecodingContainer>, (uint64_t *)&demangling cache variable for type metadata for (String, DecodingContainer), (uint64_t (*)(uint64_t *, unint64_t))outlined init with take of Encodable);
}

{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, DecodingBuffer>);
  v2 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_retain();
    result = specialized __RawDictionaryStorage.find<A>(_:)(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

{
  return specialized Dictionary.init(dictionaryLiteral:)(a1, &demangling cache variable for type metadata for _DictionaryStorage<String, EncodingContainer>, &demangling cache variable for type metadata for (String, EncodingContainer), (uint64_t (*)(uint64_t *, unint64_t))outlined init with take of Encodable);
}

{
  uint64_t v1;
  _QWORD *v3;
  _BYTE *i;
  uint64_t v5;
  char v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ObjectIdentifier, Bool>);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)();
    for (i = (_BYTE *)(a1 + 40); ; i += 16)
    {
      v5 = *((_QWORD *)i - 1);
      v6 = *i;
      result = specialized __RawDictionaryStorage.find<A>(_:)(v5);
      if ((v8 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_QWORD *)(v3[6] + 8 * result) = v5;
      *(_BYTE *)(v3[7] + result) = v6;
      v9 = v3[2];
      v10 = __OFADD__(v9, 1);
      v11 = v9 + 1;
      if (v10)
        goto LABEL_10;
      v3[2] = v11;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9E0];
  }
  return result;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t *, unint64_t))
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  uint64_t *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (!*(_QWORD *)(a1 + 16))
  {
    v8 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = static _DictionaryStorage.allocate(capacity:)();
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  v10 = v7 + 64;
  v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    outlined init with copy of (String, DecodingContainer)(v11, (uint64_t)&v20, a3);
    v12 = v20;
    v13 = v21;
    result = specialized __RawDictionaryStorage.find<A>(_:)(v20, v21);
    if ((v15 & 1) != 0)
      break;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v16 = (uint64_t *)(v8[6] + 16 * result);
    *v16 = v12;
    v16[1] = v13;
    result = a4(&v22, v8[7] + 40 * result);
    v17 = v8[2];
    v18 = __OFADD__(v17, 1);
    v19 = v17 + 1;
    if (v18)
      goto LABEL_11;
    v8[2] = v19;
    v11 += 56;
    if (!--v9)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed () -> ()(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t XPCReceivedMessage.XPCReceivedMessageMetadata.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

double XPCReceivedMessage.handoffReply(to:_:)@<D0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  double result;
  _QWORD v8[6];

  v5 = *(_QWORD *)(v3 + 8);
  v8[4] = a1;
  v8[5] = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = thunk for @escaping @callee_guaranteed () -> ();
  v8[3] = &block_descriptor_4;
  v6 = _Block_copy(v8);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  xpc_dictionary_handoff_reply();
  _Block_release(v6);
  swift_unknownObjectRelease();
  *(_BYTE *)(v5 + 16) = 0;
  result = 0.0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_QWORD *)(a3 + 32) = 0;
  return result;
}

uint64_t XPCReceivedMessage.expectsReply.getter()
{
  return xpc_dictionary_expects_reply();
}

uint64_t XPCReceivedMessage.isSync.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(*(_QWORD *)(v0 + 8) + 17);
}

Swift::Void __swiftcall XPCReceivedMessage.detachHandoff()()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 8) + 16) = 0;
}

uint64_t XPCReceivedMessage.auditToken.getter()
{
  xpc_dictionary_get_audit_token();
  return 0;
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(const void *a1, int64_t a2)
{
  _QWORD *v4;
  size_t v5;

  if (!a2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  if (a2 <= 0)
  {
    v4 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    v4 = (_QWORD *)swift_allocObject();
    v5 = _swift_stdlib_malloc_size(v4);
    v4[2] = a2;
    v4[3] = 2 * v5 - 64;
  }
  memcpy(v4 + 4, a1, a2);
  return v4;
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t destroy for XPCReceivedMessage()
{
  swift_unknownObjectRelease();
  return swift_release();
}

_QWORD *initializeBufferWithCopyOfBuffer for XPCReceivedMessage(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_unknownObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for XPCReceivedMessage(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for XPCReceivedMessage(_OWORD *a1, _OWORD *a2)
{
  swift_unknownObjectRelease();
  *a1 = *a2;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for XPCReceivedMessage()
{
  return &type metadata for XPCReceivedMessage;
}

uint64_t type metadata accessor for XPCReceivedMessage.XPCReceivedMessageMetadata()
{
  return objc_opt_self();
}

uint64_t outlined init with copy of (String, DecodingContainer)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

Swift::Bool __swiftcall _XPCSingleValueDecodingContainer.decodeNil()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Bool result;

  v1 = *(_QWORD **)(v0 + 16);
  v2 = v1[4];
  v3 = v1[5] >> 1;
  if (__OFSUB__(v3, v2))
  {
    __break(1u);
  }
  else
  {
    v4 = v1[6];
    if (v4 >= v3 - v2)
      return 0;
    v5 = v2 + v4;
    if (!__OFADD__(v2, v4))
    {
      if (v5 < v2 || v5 >= v3)
        goto LABEL_14;
      if (*(_BYTE *)(v1[3] + v5) == 1)
      {
        v1[6] = v4 + 1;
        return 1;
      }
      return 0;
    }
  }
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t specialized _XPCSingleValueDecodingContainer.decode<A>(_:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = MEMORY[0x1E0DEB418];
  v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  v5 = v0[3];
  v4 = v0[4];
  v6 = v0[2];
  v7 = *(_QWORD *)(v3 + 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  v14 = v2;
  v15 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1)
    return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v12);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    v12 = 0;
    v13 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    v12 = 0xD000000000000016;
    v13 = 0x80000001DF04FCD0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v12, v13);
  }
  return v11;
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  char v9;
  Swift::String v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v2 = MEMORY[0x1E0DEAFA0];
  v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  v5 = v0[3];
  v4 = v0[4];
  v6 = v0[2];
  v7 = *(_QWORD *)(v3 + 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  v14 = v2;
  v15 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v9 = v16 & 1;
      return v9 & 1;
    }
LABEL_8:
    v12 = 0;
    v13 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    v12 = 0xD000000000000016;
    v13 = 0x80000001DF04FCD0;
    v11._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v11);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v12, v13);
  }
  __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v12);
  return v9 & 1;
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = MEMORY[0x1E0DEA968];
  v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  v5 = v0[3];
  v4 = v0[4];
  v6 = v0[2];
  v7 = *(_QWORD *)(v3 + 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  v14 = v2;
  v15 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1)
    return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v12);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    v12 = 0;
    v13 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    v12 = 0xD000000000000016;
    v13 = 0x80000001DF04FCD0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v12, v13);
  }
  return v11;
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;

  v2 = MEMORY[0x1E0DEDA70];
  v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  v5 = v0[3];
  v4 = v0[4];
  v6 = v0[2];
  v7 = *(_QWORD *)(v3 + 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  v13 = v2;
  v14 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1)
    return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v11);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    v11 = 0;
    v12 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    v11 = 0xD000000000000016;
    v12 = 0x80000001DF04FCD0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v11, v12);
  }
  return v15;
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int16 v15;

  v2 = MEMORY[0x1E0DEDB58];
  v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  v5 = v0[3];
  v4 = v0[4];
  v6 = v0[2];
  v7 = *(_QWORD *)(v3 + 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  v13 = v2;
  v14 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1)
    return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v11);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    v11 = 0;
    v12 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    v11 = 0xD000000000000016;
    v12 = 0x80000001DF04FCD0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v11, v12);
  }
  return v15;
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;

  v2 = MEMORY[0x1E0DEDBC8];
  v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  v5 = v0[3];
  v4 = v0[4];
  v6 = v0[2];
  v7 = *(_QWORD *)(v3 + 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  v13 = v2;
  v14 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1)
    return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v11);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    v11 = 0;
    v12 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    v11 = 0xD000000000000016;
    v12 = 0x80000001DF04FCD0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v11, v12);
  }
  return v15;
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = MEMORY[0x1E0DEDC60];
  v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  v5 = v0[3];
  v4 = v0[4];
  v6 = v0[2];
  v7 = *(_QWORD *)(v3 + 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  v14 = v2;
  v15 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1)
    return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v12);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    v12 = 0;
    v13 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    v12 = 0xD000000000000016;
    v13 = 0x80000001DF04FCD0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v12, v13);
  }
  return v11;
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = MEMORY[0x1E0DEBB98];
  v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  v5 = v0[3];
  v4 = v0[4];
  v6 = v0[2];
  v7 = *(_QWORD *)(v3 + 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  v14 = v2;
  v15 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1)
    return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v12);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    v12 = 0;
    v13 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    v12 = 0xD000000000000016;
    v13 = 0x80000001DF04FCD0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v12, v13);
  }
  return v11;
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;

  v2 = MEMORY[0x1E0DEDE70];
  v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  v5 = v0[3];
  v4 = v0[4];
  v6 = v0[2];
  v7 = *(_QWORD *)(v3 + 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  v13 = v2;
  v14 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1)
    return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v11);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    v11 = 0;
    v12 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    v11 = 0xD000000000000016;
    v12 = 0x80000001DF04FCD0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v11, v12);
  }
  return v15;
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int16 v15;

  v2 = MEMORY[0x1E0DEE068];
  v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  v5 = v0[3];
  v4 = v0[4];
  v6 = v0[2];
  v7 = *(_QWORD *)(v3 + 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  v13 = v2;
  v14 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1)
    return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v11);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    v11 = 0;
    v12 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    v11 = 0xD000000000000016;
    v12 = 0x80000001DF04FCD0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v11, v12);
  }
  return v15;
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;

  v2 = MEMORY[0x1E0DEE0F8];
  v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  v5 = v0[3];
  v4 = v0[4];
  v6 = v0[2];
  v7 = *(_QWORD *)(v3 + 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  v13 = v2;
  v14 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1)
    return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v11);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    v11 = 0;
    v12 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    v11 = 0xD000000000000016;
    v12 = 0x80000001DF04FCD0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v11, v12);
  }
  return v15;
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = MEMORY[0x1E0DEE190];
  v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  v5 = v0[3];
  v4 = v0[4];
  v6 = v0[2];
  v7 = *(_QWORD *)(v3 + 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  v14 = v2;
  v15 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1)
    return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v12);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    v12 = 0;
    v13 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    v12 = 0xD000000000000016;
    v13 = 0x80000001DF04FCD0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v12, v13);
  }
  return v11;
}

double specialized _XPCSingleValueDecodingContainer.decode<A>(_:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  double result;
  Swift::String v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = MEMORY[0x1E0DEB070];
  v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  v5 = v0[3];
  v4 = v0[4];
  v6 = v0[2];
  v7 = *(_QWORD *)(v3 + 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  v14 = v2;
  v15 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1)
  {
    __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v12);
    return result;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    v12 = 0;
    v13 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    v12 = 0xD000000000000016;
    v13 = 0x80000001DF04FCD0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v12, v13);
  }
  return v11;
}

float specialized _XPCSingleValueDecodingContainer.decode<A>(_:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  float result;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float v15;

  v2 = MEMORY[0x1E0DEB188];
  v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  v5 = v0[3];
  v4 = v0[4];
  v6 = v0[2];
  v7 = *(_QWORD *)(v3 + 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  v13 = v2;
  v14 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1)
  {
    __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v11);
    return result;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    v11 = 0;
    v12 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    v11 = 0xD000000000000016;
    v12 = 0x80000001DF04FCD0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v11, v12);
  }
  return v15;
}

uint64_t _XPCSingleValueDecodingContainer.decode<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t, uint64_t);
  void (*v36)(char *, char *, uint64_t);
  void (*v37)(char *, char *, uint64_t);
  Swift::String v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v43 = a3;
  v6 = type metadata accessor for Optional();
  v40 = *(_QWORD *)(v6 - 8);
  v41 = v6;
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v7);
  v12 = (char *)&v39 - v11;
  v42 = *(_QWORD *)(a2 - 8);
  v13 = MEMORY[0x1E0C80A78](v10);
  v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v39 - v16;
  v18 = swift_conformsToProtocol2();
  if (v18)
    v19 = v18;
  else
    v19 = 0;
  if (v18)
    v20 = a1;
  else
    v20 = 0;
  if (v20)
  {
    v22 = v3[3];
    v21 = v3[4];
    v23 = v3[2];
    v24 = *(_QWORD *)(v19 + 8);
    v25 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 16);
    v46 = v20;
    v47 = v19;
    __swift_allocate_boxed_opaque_existential_1(&v44);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    v26 = v48;
    v25(v22, v21, v23, v20, v24);
    if (v26)
    {
      return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v44);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
      v33 = swift_dynamicCast();
      v34 = v42;
      v35 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v42 + 56);
      if (!v33)
      {
        v35(v12, 1, 1, a2);
        (*(void (**)(char *, uint64_t))(v40 + 8))(v12, v41);
        v44 = 0;
        v45 = 0xE000000000000000;
        _StringGuts.grow(_:)(24);
        swift_bridgeObjectRelease();
        v44 = 0xD000000000000016;
        v45 = 0x80000001DF04FCD0;
        v38._countAndFlagsBits = _typeName(_:qualified:)();
        String.append(_:)(v38);
        swift_bridgeObjectRelease();
        __XPC_INTERNAL_CRASH__(_:file:line:)(v44, v45);
      }
      v35(v12, 0, 1, a2);
      v36 = *(void (**)(char *, char *, uint64_t))(v34 + 32);
      v36(v17, v12, a2);
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v36)(v43, v17, a2);
    }
  }
  else
  {
    v29 = v3[3];
    v28 = v3[4];
    v30 = v3[2];
    v31 = v48;
    result = static OptionalPrimitive.unwrapNestedOptional<A>(_:codingMetadata:buffer:)(a1, v29, v28, v30, a2, (uint64_t)v9);
    if (!v31)
    {
      v32 = v42;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v9, 1, a2) == 1)
      {
        (*(void (**)(char *, uint64_t))(v40 + 8))(v9, v41);
        type metadata accessor for XPCDecoder();
        return static XPCDecoder.decode<A>(from:withCodingMetadata:)(v30, v29, v28, a2, v43);
      }
      else
      {
        v37 = *(void (**)(char *, char *, uint64_t))(v32 + 32);
        v37(v15, v9, a2);
        return ((uint64_t (*)(uint64_t, char *, uint64_t))v37)(v43, v15, a2);
      }
    }
  }
  return result;
}

uint64_t _XPCSingleValueDecodingContainer.__deallocating_deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for _XPCSingleValueDecodingContainer()
{
  return objc_opt_self();
}

uint64_t protocol witness for SingleValueDecodingContainer.codingPath.getter in conformance _XPCSingleValueDecodingContainer(uint64_t a1)
{
  return CodingContainerWithMetadata.codingPath.getter(a1, (uint64_t)&protocol witness table for _XPCSingleValueDecodingContainer);
}

BOOL protocol witness for SingleValueDecodingContainer.decodeNil() in conformance _XPCSingleValueDecodingContainer()
{
  return _XPCSingleValueDecodingContainer.decodeNil()();
}

uint64_t protocol witness for SingleValueDecodingContainer.decode(_:) in conformance _XPCSingleValueDecodingContainer()
{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)() & 1;
}

{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

{
  return SingleValueDecodingContainer.decode(_:)();
}

{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

{
  return SingleValueDecodingContainer.decode(_:)();
}

double protocol witness for SingleValueDecodingContainer.decode(_:) in conformance _XPCSingleValueDecodingContainer()
{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

float protocol witness for SingleValueDecodingContainer.decode(_:) in conformance _XPCSingleValueDecodingContainer()
{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

uint64_t protocol witness for SingleValueDecodingContainer.decode<A>(_:) in conformance _XPCSingleValueDecodingContainer@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return _XPCSingleValueDecodingContainer.decode<A>(_:)(a1, a2, a3);
}

_QWORD *protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance _XPCSingleValueDecodingContainer@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  _QWORD *result;

  type metadata accessor for _XPCSingleValueDecodingContainer();
  result = (_QWORD *)swift_allocObject();
  result[3] = a1;
  result[4] = a2;
  result[2] = a3;
  *a4 = result;
  return result;
}

uint64_t protocol witness for CodingContainerWithMetadata.codingMetadata.getter in conformance _XPCSingleValueDecodingContainer()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x1DF0F4AB4);
  return result;
}

uint64_t EncodingBuffer.__allocating_init(bytes:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t key path setter for EncodingBuffer.bytes : EncodingBuffer(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 16) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t EncodingBuffer.bytes.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t EncodingBuffer.bytes.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*EncodingBuffer.bytes.modify())()
{
  swift_beginAccess();
  return static XPCSession.InitializationOptions.privileged.modify;
}

uint64_t EncodingBuffer.init(bytes:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

Swift::Void __swiftcall EncodingBuffer.append(_:)(Swift::UInt8 a1)
{
  uint64_t v1;
  char **v3;
  char *v4;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v6;
  unint64_t v7;

  v3 = (char **)(v1 + 16);
  swift_beginAccess();
  v4 = *(char **)(v1 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v1 + 16) = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
    *v3 = v4;
  }
  v7 = *((_QWORD *)v4 + 2);
  v6 = *((_QWORD *)v4 + 3);
  if (v7 >= v6 >> 1)
  {
    v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v6 > 1), v7 + 1, 1, v4);
    *v3 = v4;
  }
  *((_QWORD *)v4 + 2) = v7 + 1;
  v4[v7 + 32] = a1;
}

uint64_t EncodingBuffer.append(_:)(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *v4;

  swift_beginAccess();
  return specialized Array.append<A>(contentsOf:)(a1, a2, v4);
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  int64_t v11;

  v2 = *(_QWORD *)(result + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(v6 + 16))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v11 = v4 + v2;
  else
    v11 = v4;
  result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)result, v11, 1, (char *)v3);
  v3 = result;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  v7 = *(_QWORD *)(v3 + 16);
  if ((*(_QWORD *)(v3 + 24) >> 1) - v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = (uint64_t)memcpy((void *)(v3 + v7 + 32), (const void *)(v6 + 32), v2);
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v8 = *(_QWORD *)(v3 + 16);
  v9 = __OFADD__(v8, v2);
  v10 = v8 + v2;
  if (!v9)
  {
    *(_QWORD *)(v3 + 16) = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t specialized Array.append<A>(contentsOf:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X8>)
{
  uint64_t *v3;
  unsigned __int8 *v4;
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  int64_t v17;
  int v18;
  unsigned __int8 *v19;
  int v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  unsigned __int8 *v24;
  unsigned __int8 *v25;
  __int128 *v26;
  uint64_t v27;
  unsigned __int8 *v28;
  _OWORD *v29;
  __int128 v30;
  unsigned __int8 *v31;
  int v32;
  char *v33;
  unsigned __int8 *v34;
  int64_t v35;
  int v36;

  v5 = *v3;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = v6 + a2;
  if (__OFADD__(v6, a2))
  {
    __break(1u);
  }
  else
  {
    v4 = (unsigned __int8 *)result;
    result = swift_isUniquelyReferenced_nonNull_native();
    if (!(_DWORD)result || (v9 = *(_QWORD *)(v5 + 24) >> 1, v9 < v7))
    {
      if (v6 <= v7)
        v10 = v7;
      else
        v10 = v6;
      result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)result, v10, 1, (char *)v5);
      v5 = result;
      v9 = *(_QWORD *)(result + 24) >> 1;
    }
    v11 = *(_QWORD *)(v5 + 16);
    v12 = v9 - v11;
    if (!a2 || v9 == v11)
    {
      a3 = &v4[a2];
      if (!v4)
        a3 = 0;
      if (a2 <= 0)
      {
        v13 = 0;
LABEL_22:
        if (v13 != v12)
          goto LABEL_23;
        goto LABEL_26;
      }
    }
    else
    {
      if (a2 >= v12)
        v13 = v9 - v11;
      else
        v13 = a2;
      result = (uint64_t)memcpy((void *)(v5 + v11 + 32), v4, v13);
      if (v12 >= a2)
      {
        a3 = &v4[a2];
        if (v13 >= 1)
        {
          v14 = *(_QWORD *)(v5 + 16);
          v15 = __OFADD__(v14, v13);
          v16 = v14 + v13;
          if (v15)
          {
            __break(1u);
            return result;
          }
          *(_QWORD *)(v5 + 16) = v16;
        }
        v4 += v13;
        goto LABEL_22;
      }
    }
  }
  __break(1u);
LABEL_26:
  if (v4 && v4 != a3)
  {
    v17 = *(_QWORD *)(v5 + 16);
    v20 = *v4;
    v19 = v4 + 1;
    v18 = v20;
    while (1)
    {
      v21 = *(_QWORD *)(v5 + 24);
      v22 = v21 >> 1;
      v23 = v17 + 1;
      if ((uint64_t)(v21 >> 1) < v17 + 1)
      {
        v33 = (char *)v5;
        v34 = a3;
        v35 = v17;
        v36 = v18;
        result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v21 > 1), v17 + 1, 1, v33);
        v18 = v36;
        v17 = v35;
        a3 = v34;
        v5 = result;
        v22 = *(_QWORD *)(result + 24) >> 1;
        if (v17 >= v22)
          goto LABEL_30;
      }
      else if (v17 >= v22)
      {
        goto LABEL_30;
      }
      *(_BYTE *)(v5 + 32 + v17) = v18;
      if (v19 == a3)
      {
LABEL_48:
        *(_QWORD *)(v5 + 16) = v23;
        break;
      }
      v24 = (unsigned __int8 *)(v22 + ~v17);
      if (v24 >= &a3[~(unint64_t)v19])
        v24 = &a3[~(unint64_t)v19];
      v25 = v24 + 1;
      if ((unint64_t)(v24 + 1) > 0x10 && (unint64_t)(v17 + v5 - (_QWORD)v19 + 33) >= 0x10)
      {
        v26 = (__int128 *)v19;
        v27 = v25 & 0xF;
        if ((v25 & 0xF) == 0)
          v27 = 16;
        v28 = &v25[-v27];
        v23 += (int64_t)v28;
        v19 = &v28[(_QWORD)v19];
        v29 = (_OWORD *)(v5 + v17 + 33);
        do
        {
          v30 = *v26++;
          *v29++ = v30;
          v28 -= 16;
        }
        while (v28);
      }
      v31 = v19++;
      while (1)
      {
        v32 = *v31++;
        v18 = v32;
        if (v22 == v23)
          break;
        *(_BYTE *)(v5 + 32 + v23++) = v18;
        ++v19;
        if (v31 == a3)
          goto LABEL_48;
      }
      v17 = v22;
LABEL_30:
      *(_QWORD *)(v5 + 16) = v17;
    }
  }
LABEL_23:
  *v3 = v5;
  return result;
}

_QWORD *specialized Array.append<A>(contentsOf:)(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int64_t v10;

  v2 = result[2];
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= v3[3] >> 1)
  {
    if (v6[2])
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v10 = v4 + v2;
  else
    v10 = v4;
  result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(result, v10, 1, v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>, (uint64_t *)&demangling cache variable for type metadata for CodingKey);
  v3 = result;
  if (!v6[2])
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  if ((v3[3] >> 1) - v3[2] < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CodingKey);
  result = (_QWORD *)swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    result = (_QWORD *)swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v7 = v3[2];
  v8 = __OFADD__(v7, v2);
  v9 = v7 + v2;
  if (!v8)
  {
    v3[2] = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

Swift::Void __swiftcall EncodingBuffer.append(_:)(Swift::OpaquePointer a1)
{
  uint64_t v1;

  swift_beginAccess();
  v1 = swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)(v1);
}

uint64_t EncodingBuffer.appendSized(_:)(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(_QWORD *)(v3 + 16) = 8;
  v4 = v1 + 16;
  *(_QWORD *)(v3 + 32) = 0xCCCCCCCCCCCCCCCCLL;
  swift_beginAccess();
  v5 = *(_QWORD *)(*(_QWORD *)(v1 + 16) + 16);
  v6 = specialized Array.append<A>(contentsOf:)(v3);
  result = a1(v6);
  v8 = v5 + 8;
  if (__OFADD__(v5, 8))
  {
    __break(1u);
    goto LABEL_6;
  }
  v9 = *(_QWORD *)(*(_QWORD *)v4 + 16);
  result = v9 - v8;
  if (__OFSUB__(v9, v8))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v10 = MEMORY[0x1E0DEE9D8];
  result = specialized CodingIntegerPrimitive.forEachByte(do:)(result, &v10);
  if (v8 >= v5)
  {
    specialized Array.replaceSubrange<A>(_:with:)(v5, v5 + 8, v10);
    return swift_bridgeObjectRelease();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t EncodingBuffer.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t EncodingBuffer.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, (uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<EncodingContainer>, &demangling cache variable for type metadata for EncodingContainer);
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;

  v8 = (char)result;
  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v13 = (_QWORD *)swift_allocObject();
    v14 = _swift_stdlib_malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
  }
  else
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  if ((v8 & 1) != 0)
  {
    if (v13 != a4 || v13 + 4 >= &a4[5 * v11 + 4])
      memmove(v13 + 4, a4 + 4, 40 * v11);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v13;
}

char *specialized UnsafeBufferPointer._copyContents(initializing:)(void *a1, int64_t a2, char *__src, int64_t a4)
{
  char *v4;
  size_t v5;

  v4 = __src;
  if (a4 && a2)
  {
    if (a4 >= a2)
      v5 = a2;
    else
      v5 = a4;
    memcpy(a1, __src, v5);
    v4 += v5;
  }
  return v4;
}

unint64_t specialized Array.replaceSubrange<A>(_:with:)(unint64_t result, int64_t a2, uint64_t a3)
{
  unint64_t *v3;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  size_t v10;
  size_t v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  size_t v17;
  const void *v18;
  uint64_t v19;
  BOOL v20;
  size_t v21;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  v5 = *v3;
  v6 = *(_QWORD *)(*v3 + 16);
  if (v6 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v7 = result;
  v8 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v10 = *(_QWORD *)(a3 + 16);
  v11 = v10 - v8;
  if (__OFSUB__(v10, v8))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v12 = v6 + v11;
  if (__OFADD__(v6, v11))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    return result;
  }
  result = swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)result || v12 > *(_QWORD *)(v5 + 24) >> 1)
  {
    if (v6 <= v12)
      v13 = v6 + v11;
    else
      v13 = v6;
    result = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)result, v13, 1, (char *)v5);
    v5 = result;
  }
  v14 = v5 + 32;
  v15 = (char *)(v5 + 32 + v7);
  if (!v11)
    goto LABEL_19;
  v16 = *(_QWORD *)(v5 + 16);
  v17 = v16 - a2;
  if (__OFSUB__(v16, a2))
    goto LABEL_27;
  result = (unint64_t)&v15[v10];
  v18 = (const void *)(v14 + a2);
  if (&v15[v10] != (char *)(v14 + a2) || result >= (unint64_t)v18 + v17)
    result = (unint64_t)memmove((void *)result, v18, v17);
  v19 = *(_QWORD *)(v5 + 16);
  v20 = __OFADD__(v19, v11);
  v21 = v19 + v11;
  if (v20)
    goto LABEL_28;
  *(_QWORD *)(v5 + 16) = v21;
LABEL_19:
  if (v10)
    result = (unint64_t)memcpy(v15, (const void *)(a3 + 32), v10);
  *v3 = v5;
  return result;
}

uint64_t sub_1DF048F7C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for EncodingBuffer()
{
  return objc_opt_self();
}

uint64_t method lookup function for EncodingBuffer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EncodingBuffer.bytes.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t dispatch thunk of EncodingBuffer.bytes.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of EncodingBuffer.bytes.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of EncodingBuffer.__allocating_init(bytes:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of EncodingBuffer.append(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of EncodingBuffer.appendSized(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t specialized EncodingBuffer.appendSized(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v12;

  v6 = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(_QWORD *)(v6 + 16) = 8;
  v7 = a1 + 16;
  *(_QWORD *)(v6 + 32) = 0xCCCCCCCCCCCCCCCCLL;
  swift_beginAccess();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 16);
  specialized Array.append<A>(contentsOf:)(v6);
  closure #1 in _XPCUnkeyedEncodingContainer.encode(to:)(a2, a3);
  v9 = v8 + 8;
  if (__OFADD__(v8, 8))
  {
    __break(1u);
    goto LABEL_6;
  }
  v10 = *(_QWORD *)(*(_QWORD *)v7 + 16);
  if (__OFSUB__(v10, v9))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v12 = MEMORY[0x1E0DEE9D8];
  specialized CodingIntegerPrimitive.forEachByte(do:)(v10 - v9, &v12);
  if (v9 >= v8)
  {
    specialized Array.replaceSubrange<A>(_:with:)(v8, v8 + 8, v12);
    return swift_bridgeObjectRelease();
  }
LABEL_7:
  __break(1u);
  return Array.init()();
}

uint64_t Array.init()()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t dispatch thunk of BinaryFloatingPoint.init<A>(exactly:)()
{
  return MEMORY[0x1E0DE9DD0]();
}

uint64_t BinaryFloatingPoint.init<A>(_:)()
{
  return MEMORY[0x1E0DE9DF0]();
}

uint64_t dispatch thunk of Encodable.encode(to:)()
{
  return MEMORY[0x1E0DEA0F0]();
}

uint64_t dispatch thunk of FloatingPoint.init<A>(exactly:)()
{
  return MEMORY[0x1E0DEA150]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t dispatch thunk of static Comparable.> infix(_:_:)()
{
  return MEMORY[0x1E0DEA3B8]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t String.init(from:)()
{
  return MEMORY[0x1E0DEA750]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x1E0DEA758]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x1E0DEA800](a1._countAndFlagsBits, a1._object);
}

uint64_t String.encode(to:)()
{
  return MEMORY[0x1E0DEA808]();
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t String.init<A>(_:radix:uppercase:)()
{
  return MEMORY[0x1E0DEA9C0]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t Sequence.compactMap<A>(_:)()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x1E0DEADB8]();
}

Swift::Void __swiftcall Array.reserveCapacity(_:)(Swift::Int a1)
{
  MEMORY[0x1E0DEADD8](a1);
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t Bool.init(from:)()
{
  return MEMORY[0x1E0DEAF80]();
}

uint64_t Bool.encode(to:)()
{
  return MEMORY[0x1E0DEAF88]();
}

uint64_t Double.init(from:)()
{
  return MEMORY[0x1E0DEB020]();
}

uint64_t Double.encode(to:)()
{
  return MEMORY[0x1E0DEB040]();
}

uint64_t dispatch thunk of Decodable.init(from:)()
{
  return MEMORY[0x1E0DEB120]();
}

uint64_t Float.init(from:)()
{
  return MEMORY[0x1E0DEB150]();
}

uint64_t Float.encode(to:)()
{
  return MEMORY[0x1E0DEB168]();
}

uint64_t Set.description.getter()
{
  return MEMORY[0x1E0DEB220]();
}

uint64_t Int.encode(to:)()
{
  return MEMORY[0x1E0DEB400]();
}

uint64_t dispatch thunk of Numeric.init<A>(exactly:)()
{
  return MEMORY[0x1E0DEB4A0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t UInt.encode(to:)()
{
  return MEMORY[0x1E0DEBB80]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)()
{
  return MEMORY[0x1E0DEBD70]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(exactly:)()
{
  return MEMORY[0x1E0DEBDF0]();
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

uint64_t SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return MEMORY[0x1E0DEC280]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x1E0DEC2A8](a1);
}

uint64_t StaticString.description.getter()
{
  return MEMORY[0x1E0DEC338]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t EncodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x1E0DEC4B8]();
}

uint64_t type metadata accessor for EncodingError()
{
  return MEMORY[0x1E0DEC4E0]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t CodingUserInfoKey.init(rawValue:)()
{
  return MEMORY[0x1E0DEC980]();
}

uint64_t type metadata accessor for CodingUserInfoKey()
{
  return MEMORY[0x1E0DEC990]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t KeyedDecodingContainer.init<A>(_:)()
{
  return MEMORY[0x1E0DED058]();
}

uint64_t KeyedEncodingContainer.init<A>(_:)()
{
  return MEMORY[0x1E0DED180]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t UnkeyedDecodingContainer.decodeIfPresent(_:)()
{
  return MEMORY[0x1E0DED2C8]();
}

{
  return MEMORY[0x1E0DED2D0]();
}

{
  return MEMORY[0x1E0DED2D8]();
}

{
  return MEMORY[0x1E0DED2E8]();
}

{
  return MEMORY[0x1E0DED2F0]();
}

{
  return MEMORY[0x1E0DED318]();
}

{
  return MEMORY[0x1E0DED340]();
}

uint64_t UnkeyedDecodingContainer.decodeIfPresent<A>(_:)()
{
  return MEMORY[0x1E0DED2F8]();
}

uint64_t UnkeyedDecodingContainer.decode(_:)()
{
  return MEMORY[0x1E0DED350]();
}

{
  return MEMORY[0x1E0DED358]();
}

uint64_t UnkeyedEncodingContainer.encodeConditional<A>(_:)()
{
  return MEMORY[0x1E0DED400]();
}

uint64_t UnkeyedEncodingContainer.encode<A>(contentsOf:)()
{
  return MEMORY[0x1E0DED408]();
}

{
  return MEMORY[0x1E0DED410]();
}

{
  return MEMORY[0x1E0DED418]();
}

{
  return MEMORY[0x1E0DED420]();
}

{
  return MEMORY[0x1E0DED428]();
}

{
  return MEMORY[0x1E0DED430]();
}

{
  return MEMORY[0x1E0DED438]();
}

{
  return MEMORY[0x1E0DED440]();
}

{
  return MEMORY[0x1E0DED448]();
}

{
  return MEMORY[0x1E0DED450]();
}

{
  return MEMORY[0x1E0DED458]();
}

{
  return MEMORY[0x1E0DED460]();
}

{
  return MEMORY[0x1E0DED468]();
}

{
  return MEMORY[0x1E0DED470]();
}

{
  return MEMORY[0x1E0DED478]();
}

{
  return MEMORY[0x1E0DED480]();
}

{
  return MEMORY[0x1E0DED488]();
}

uint64_t UnkeyedEncodingContainer.encode(_:)()
{
  return MEMORY[0x1E0DED490]();
}

{
  return MEMORY[0x1E0DED498]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x1E0DED548]();
}

{
  return MEMORY[0x1E0DED550]();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return MEMORY[0x1E0DED5C0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x1E0DED648]();
}

uint64_t SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x1E0DED698]();
}

{
  return MEMORY[0x1E0DED6A0]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode(_:)()
{
  return MEMORY[0x1E0DED6E8]();
}

uint64_t SingleValueEncodingContainer.encode(_:)()
{
  return MEMORY[0x1E0DED748]();
}

{
  return MEMORY[0x1E0DED750]();
}

uint64_t KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x1E0DED7D0]();
}

{
  return MEMORY[0x1E0DED7D8]();
}

{
  return MEMORY[0x1E0DED7E0]();
}

{
  return MEMORY[0x1E0DED7F0]();
}

{
  return MEMORY[0x1E0DED7F8]();
}

{
  return MEMORY[0x1E0DED820]();
}

{
  return MEMORY[0x1E0DED848]();
}

uint64_t KeyedDecodingContainerProtocol.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x1E0DED800]();
}

uint64_t KeyedDecodingContainerProtocol.decode(_:forKey:)()
{
  return MEMORY[0x1E0DED858]();
}

{
  return MEMORY[0x1E0DED860]();
}

uint64_t KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x1E0DED8D0]();
}

{
  return MEMORY[0x1E0DED8D8]();
}

uint64_t KeyedEncodingContainerProtocol.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x1E0DED900]();
}

uint64_t KeyedEncodingContainerProtocol.encodeConditional<A>(_:forKey:)()
{
  return MEMORY[0x1E0DED958]();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return MEMORY[0x1E0DED9E8]();
}

uint64_t Int8.encode(to:)()
{
  return MEMORY[0x1E0DEDA60]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t Int16.encode(to:)()
{
  return MEMORY[0x1E0DEDB48]();
}

uint64_t Int32.encode(to:)()
{
  return MEMORY[0x1E0DEDBB8]();
}

uint64_t Int64.encode(to:)()
{
  return MEMORY[0x1E0DEDC48]();
}

uint64_t UInt8.encode(to:)()
{
  return MEMORY[0x1E0DEDE60]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1E0DEDEF8]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x1E0DEDF10](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t type metadata accessor for Result()
{
  return MEMORY[0x1E0DEE030]();
}

uint64_t UInt16.encode(to:)()
{
  return MEMORY[0x1E0DEE058]();
}

uint64_t UInt32.encode(to:)()
{
  return MEMORY[0x1E0DEE0E0]();
}

uint64_t UInt64.encode(to:)()
{
  return MEMORY[0x1E0DEE178]();
}

uint64_t dispatch thunk of Decoder.codingPath.getter()
{
  return MEMORY[0x1E0DEE220]();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x1E0DEE230]();
}

uint64_t dispatch thunk of Decoder.userInfo.getter()
{
  return MEMORY[0x1E0DEE238]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x1E0DEE260]();
}

uint64_t dispatch thunk of Encoder.userInfo.getter()
{
  return MEMORY[0x1E0DEE268]();
}

uint64_t dispatch thunk of CodingKey.stringValue.getter()
{
  return MEMORY[0x1E0DEE8B8]();
}

uint64_t dispatch thunk of CodingKey.init(stringValue:)()
{
  return MEMORY[0x1E0DEE8C8]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x1E0DEE978]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _dyld_register_for_bulk_image_loads()
{
  return MEMORY[0x1E0C80F50]();
}

uint64_t _xpc_session_create_from_connection_4SWIFT()
{
  return MEMORY[0x1E0C812A8]();
}

uint64_t _xpc_session_extract_connection_4SWIFT()
{
  return MEMORY[0x1E0C812B0]();
}

uint64_t _xpc_session_get_peer_audit_token_4SWIFT()
{
  return MEMORY[0x1E0C812B8]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1E0DEED80]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C85E10]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E50](xarray, index);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1E0C85E70](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E90](xarray, index);
}

void xpc_array_set_connection(xpc_object_t xarray, size_t index, xpc_connection_t connection)
{
  MEMORY[0x1E0C85EA0](xarray, index, connection);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x1E0C85ED0](xarray, index, string);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
  MEMORY[0x1E0C85EE8](xarray, index, value);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1E0C85EF0](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C860E8](object);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

uint64_t xpc_dictionary_expects_reply()
{
  return MEMORY[0x1E0C86238]();
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86248](xdict, key);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x1E0C86258]();
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1E0C86270](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86288](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

uint64_t xpc_dictionary_handoff_reply()
{
  return MEMORY[0x1E0C862F0]();
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1E0C862F8]();
}

uint64_t xpc_dictionary_send_reply_4SWIFT()
{
  return MEMORY[0x1E0C86300]();
}

void xpc_dictionary_set_connection(xpc_object_t xdict, const char *key, xpc_connection_t connection)
{
  MEMORY[0x1E0C86320](xdict, key, connection);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x1E0C863D0](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x1E0C863E0](xdouble);
  return result;
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

size_t xpc_hash(xpc_object_t object)
{
  return MEMORY[0x1E0C86538](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

BOOL xpc_listener_activate(xpc_listener_t listener, xpc_rich_error_t *error_out)
{
  return MEMORY[0x1E0C86590](listener, error_out);
}

void xpc_listener_cancel(xpc_listener_t listener)
{
  MEMORY[0x1E0C86598](listener);
}

char *__cdecl xpc_listener_copy_description(xpc_listener_t listener)
{
  return (char *)MEMORY[0x1E0C865A0](listener);
}

xpc_listener_t xpc_listener_create(const char *service, dispatch_queue_t target_queue, xpc_listener_create_flags_t flags, xpc_listener_incoming_session_handler_t incoming_session_handler, xpc_rich_error_t *error_out)
{
  return (xpc_listener_t)MEMORY[0x1E0C865A8](service, target_queue, flags, incoming_session_handler, error_out);
}

uint64_t xpc_listener_create_anonymous()
{
  return MEMORY[0x1E0C865B0]();
}

uint64_t xpc_listener_create_endpoint()
{
  return MEMORY[0x1E0C865B8]();
}

void xpc_listener_reject_peer(xpc_session_t peer, const char *reason)
{
  MEMORY[0x1E0C865C0](peer, reason);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

BOOL xpc_rich_error_can_retry(xpc_rich_error_t error)
{
  return MEMORY[0x1E0C86668](error);
}

char *__cdecl xpc_rich_error_copy_description(xpc_rich_error_t error)
{
  return (char *)MEMORY[0x1E0C86670](error);
}

BOOL xpc_session_activate(xpc_session_t session, xpc_rich_error_t *error_out)
{
  return MEMORY[0x1E0C86678](session, error_out);
}

void xpc_session_cancel(xpc_session_t session)
{
  MEMORY[0x1E0C86680](session);
}

char *__cdecl xpc_session_copy_description(xpc_session_t session)
{
  return (char *)MEMORY[0x1E0C86688](session);
}

xpc_session_t xpc_session_create_mach_service(const char *mach_service, dispatch_queue_t target_queue, xpc_session_create_flags_t flags, xpc_rich_error_t *error_out)
{
  return (xpc_session_t)MEMORY[0x1E0C86690](mach_service, target_queue, flags, error_out);
}

uint64_t xpc_session_create_xpc_endpoint()
{
  return MEMORY[0x1E0C86698]();
}

xpc_session_t xpc_session_create_xpc_service(const char *name, dispatch_queue_t target_queue, xpc_session_create_flags_t flags, xpc_rich_error_t *error_out)
{
  return (xpc_session_t)MEMORY[0x1E0C866A0](name, target_queue, flags, error_out);
}

xpc_rich_error_t xpc_session_send_message(xpc_session_t session, xpc_object_t message)
{
  return (xpc_rich_error_t)MEMORY[0x1E0C866A8](session, message);
}

void xpc_session_send_message_with_reply_async(xpc_session_t session, xpc_object_t message, xpc_session_reply_handler_t reply_handler)
{
  MEMORY[0x1E0C866B0](session, message, reply_handler);
}

xpc_object_t xpc_session_send_message_with_reply_sync(xpc_session_t session, xpc_object_t message, xpc_rich_error_t *error_out)
{
  return (xpc_object_t)MEMORY[0x1E0C866B8](session, message, error_out);
}

void xpc_session_set_cancel_handler(xpc_session_t session, xpc_session_cancel_handler_t cancel_handler)
{
  MEMORY[0x1E0C866C0](session, cancel_handler);
}

void xpc_session_set_incoming_message_handler(xpc_session_t session, xpc_session_incoming_message_handler_t handler)
{
  MEMORY[0x1E0C866C8](session, handler);
}

void xpc_session_set_target_queue(xpc_session_t session, dispatch_queue_t target_queue)
{
  MEMORY[0x1E0C866D0](session, target_queue);
}

uint64_t xpc_session_set_target_user_session_uid()
{
  return MEMORY[0x1E0C866D8]();
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x1E0C867E0](uuid);
}

