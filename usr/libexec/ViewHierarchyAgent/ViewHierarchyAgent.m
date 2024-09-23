uint64_t SystemXPCRequestExecutor.__allocating_init(targetConnection:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_allocObject(v2, 32, 7);
  return SystemXPCRequestExecutor.init(targetConnection:)(a1, a2);
}

uint64_t SystemXPCRequestExecutor.init(targetConnection:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v6;

  swift_retain();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  swift_release();
  return v6;
}

uint64_t SystemXPCRequestExecutor.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v0 + 16);
  v1 = swift_retain(v3);
  dispatch thunk of XPCConnection.cancel()(v1);
  swift_release(v3);
  swift_release(*(_QWORD *)(v4 + 16));
  return v4;
}

uint64_t SystemXPCRequestExecutor.__deallocating_deinit()
{
  uint64_t v0;

  v0 = SystemXPCRequestExecutor.deinit();
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t SystemXPCRequestExecutor.performRequest(_:using:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v4[10] = v3;
  v4[9] = a3;
  v4[8] = a2;
  v4[7] = a1;
  v4[4] = v4;
  v4[2] = 0;
  v4[3] = 0;
  v4[5] = 0;
  v4[6] = 0;
  v5 = type metadata accessor for XPCDictionary(0);
  v4[11] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[12] = v6;
  v8 = *(_QWORD *)(v6 + 64);
  v4[13] = swift_task_alloc((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4[14] = swift_task_alloc((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4[2] = a1;
  v4[3] = a2;
  v4[5] = a3;
  v4[6] = v3;
  return swift_task_switch(SystemXPCRequestExecutor.performRequest(_:using:), 0);
}

uint64_t SystemXPCRequestExecutor.performRequest(_:using:)()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  void (*v3)(uint64_t, uint64_t);
  Swift::String v4;
  _QWORD *v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;

  v19 = v0[14];
  v17 = v0[13];
  v18 = v0[12];
  v20 = v0[11];
  v21 = (void *)v0[9];
  v16 = v0[8];
  v15 = v0[7];
  v0[4] = v0;
  XPCDictionary.init()();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("request", 7uLL, 1);
  v1 = ViewHierarchyRequest.data.getter(v15, v16);
  XPCDictionary.subscript.setter(v1);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v17, v19, v20);
  v2 = v21;
  v23 = swift_task_alloc(32);
  *(_QWORD *)(v23 + 16) = v21;
  XPCDictionary.withUnsafeUnderlyingDictionary<A>(_:)(partial apply for closure #1 in SystemXPCRequestExecutor.performRequest(_:using:));
  v12 = v14[14];
  v9 = v14[13];
  v8 = v14[12];
  v10 = v14[11];
  v11 = v14[10];
  v7 = (id)v14[9];
  swift_task_dealloc(v23);

  v3 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v14[15] = v3;
  v3(v9, v10);
  v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("performRequest(_:using:)", 0x18uLL, 1);
  v14[16] = v4._object;
  swift_retain(v11);
  v13 = swift_task_alloc(32);
  v14[17] = v13;
  *(_QWORD *)(v13 + 16) = v11;
  *(_QWORD *)(v13 + 24) = v12;
  v5 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
  v14[18] = v5;
  *v5 = v14[4];
  v5[1] = SystemXPCRequestExecutor.performRequest(_:using:);
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v22, 0, 0, v4._countAndFlagsBits, v4._object, partial apply for closure #2 in SystemXPCRequestExecutor.performRequest(_:using:), v13, (char *)&type metadata for () + 8);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 144);
  *(_QWORD *)(v2 + 32) = *v1;
  v2 += 32;
  v7 = (_QWORD *)(v2 - 16);
  *(_QWORD *)(v2 + 120) = v0;
  swift_task_dealloc(v3);
  if (v0)
    return swift_task_switch(SystemXPCRequestExecutor.performRequest(_:using:), 0);
  v6 = v7[14];
  v5 = v7[8];
  swift_task_dealloc(v7[15]);
  swift_release(v5);
  swift_bridgeObjectRelease(v6);
  return swift_task_switch(SystemXPCRequestExecutor.performRequest(_:using:), 0);
}

{
  _QWORD *v0;
  void (*v1)(void);
  uint64_t v3;
  uint64_t v4;

  v1 = (void (*)(void))v0[15];
  v3 = v0[14];
  v4 = v0[13];
  v0[4] = v0;
  v1();
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0[4] + 8))();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v1 = v0[17];
  v4 = v0[16];
  v6 = (void (*)(uint64_t, uint64_t))v0[15];
  v7 = v0[14];
  v8 = v0[13];
  v5 = v0[11];
  v3 = v0[10];
  v0[4] = v0;
  swift_task_dealloc(v1);
  swift_release(v3);
  swift_bridgeObjectRelease(v4);
  v6(v7, v5);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v0[4] + 8))();
}

uint64_t closure #1 in SystemXPCRequestExecutor.performRequest(_:using:)(void *a1, void *a2)
{
  Swift::String v2;
  unsigned int fd;
  uint64_t v7;

  v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("fd", 2uLL, 1);
  fd = objc_msgSend(a2, "fileDescriptor");
  v7 = String.utf8CString.getter(v2._countAndFlagsBits, v2._object);
  swift_retain(v7);
  swift_release(v7);
  swift_retain(v7);
  swift_bridgeObjectRelease(v7);
  xpc_dictionary_set_fd(a1, (const char *)(v7 + 32), fd);
  swift_unknownObjectRelease(v7);
  return swift_bridgeObjectRelease(v2._object);
}

uint64_t partial apply for closure #1 in SystemXPCRequestExecutor.performRequest(_:using:)(void *a1)
{
  uint64_t v1;

  return closure #1 in SystemXPCRequestExecutor.performRequest(_:using:)(a1, *(void **)(v1 + 16));
}

uint64_t closure #2 in SystemXPCRequestExecutor.performRequest(_:using:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[2];
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v11 = a1;
  v8[1] = a2;
  v10 = a3;
  v24 = 0;
  v23 = 0;
  v22 = 0;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>);
  v13 = *(_QWORD *)(v16 - 8);
  v12 = *(_QWORD *)(v13 + 64);
  v8[0] = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v16);
  v15 = (char *)v8 - v8[0];
  v20 = type metadata accessor for XPCDictionary(0);
  v18 = *(_QWORD *)(v20 - 8);
  v9 = (*(_QWORD *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = __chkstk_darwin(v11);
  v19 = (char *)v8 - v9;
  v24 = v3;
  v23 = v4;
  v22 = v5;
  v21 = *(_QWORD *)(v4 + 16);
  swift_retain(v21);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v19, v10, v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v11, v16);
  v6 = *(unsigned __int8 *)(v13 + 80);
  v14 = (v6 + 16) & ~v6;
  v17 = swift_allocObject(&unk_100018750, v14 + v12, v6 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v17 + v14, v15, v16);
  dispatch thunk of XPCConnection.send(message:replyHandler:)(v19, partial apply for closure #1 in closure #2 in SystemXPCRequestExecutor.performRequest(_:using:), v17);
  swift_release(v17);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v19, v20);
  return swift_release(v21);
}

uint64_t partial apply for closure #2 in SystemXPCRequestExecutor.performRequest(_:using:)(uint64_t a1)
{
  uint64_t v1;

  return closure #2 in SystemXPCRequestExecutor.performRequest(_:using:)(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t closure #1 in closure #2 in SystemXPCRequestExecutor.performRequest(_:using:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;

  v18 = a1;
  v17 = a2;
  v24 = 0;
  v23 = 0;
  v25 = 0;
  v13 = type metadata accessor for XPCError(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = (*(_QWORD *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v13);
  v16 = (char *)&v10 - v15;
  v25 = (char *)&v10 - v15;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCDictionary, XPCError>);
  v19 = (*(_QWORD *)(*(_QWORD *)(v20 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = __chkstk_darwin(v18);
  v21 = (char *)&v10 - v19;
  v24 = v2;
  v23 = v3;
  outlined init with copy of Result<XPCDictionary, XPCError>(v2, (uint64_t)&v10 - v19);
  if (swift_getEnumCaseMultiPayload(v21) == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v21, v13);
    v25 = v16;
    v7 = lazy protocol witness table accessor for type XPCError and conformance XPCError();
    v11 = swift_allocError(v13, v7, 0, 0);
    (*(void (**)(uint64_t, char *, uint64_t))(v14 + 16))(v8, v16, v13);
    v12 = &v22;
    v22 = v11;
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>);
    CheckedContinuation.resume(throwing:)(v12, v9);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  else
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>);
    CheckedContinuation.resume<>()(v4);
    v5 = type metadata accessor for XPCDictionary(0);
    return (*(uint64_t (**)(char *))(*(_QWORD *)(v5 - 8) + 8))(v21);
  }
}

uint64_t CheckedContinuation.resume<>()(uint64_t a1)
{
  return CheckedContinuation.resume(returning:)(a1, a1);
}

uint64_t protocol witness for RequestExecutor.performRequest(_:using:) in conformance SystemXPCRequestExecutor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  *(_QWORD *)(v3 + 16) = v3;
  v4 = (_QWORD *)swift_task_alloc(dword_10001C384);
  *(_QWORD *)(v3 + 24) = v4;
  *v4 = *(_QWORD *)(v3 + 16);
  v4[1] = protocol witness for RequestExecutor.performRequest(_:using:) in conformance SystemXPCRequestExecutor;
  return SystemXPCRequestExecutor.performRequest(_:using:)(a1, a2, a3);
}

_QWORD *protocol witness for RequestExecutor.performRequest(_:using:) in conformance SystemXPCRequestExecutor()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 24);
  *(_QWORD *)(v1 + 16) = *v0;
  v4 = (_QWORD *)(v1 + 16);
  swift_task_dealloc(v2);
  return (*(_QWORD *(**)(_QWORD *__return_ptr))(*v4 + 8))(v4);
}

uint64_t type metadata accessor for SystemXPCRequestExecutor()
{
  return objc_opt_self(_TtC18ViewHierarchyAgent24SystemXPCRequestExecutor);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t TypeByMangledNameInContext2;
  uint64_t v4;

  v4 = *a1;
  if (*a1 < 0)
  {
    TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2((char *)a1 + (int)*a1, -(*a1 >> 32), 0);
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }
  return v4;
}

uint64_t sub_100004C5C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v4;
  unint64_t v5;

  v1 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>)
                 - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v5 = v2 + *(_QWORD *)(v1 + 64);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + v2);
  return swift_deallocObject(v4, v5);
}

uint64_t partial apply for closure #1 in closure #2 in SystemXPCRequestExecutor.performRequest(_:using:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Error>)
                                      - 8)
                          + 80);
  return closure #1 in closure #2 in SystemXPCRequestExecutor.performRequest(_:using:)(a1, v1 + ((v2 + 16) & ~v2));
}

uint64_t outlined init with copy of Result<XPCDictionary, XPCError>(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v7;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCDictionary, XPCError>);
  if (swift_getEnumCaseMultiPayload(a1) == 1)
  {
    v3 = type metadata accessor for XPCError(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a2, a1);
    swift_storeEnumTagMultiPayload(a2, v7, 1);
  }
  else
  {
    v2 = type metadata accessor for XPCDictionary(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a2, a1);
    swift_storeEnumTagMultiPayload(a2, v7, 0);
  }
  return a2;
}

unint64_t lazy protocol witness table accessor for type XPCError and conformance XPCError()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type XPCError and conformance XPCError;
  if (!lazy protocol witness table cache variable for type XPCError and conformance XPCError)
  {
    v0 = type metadata accessor for XPCError(255);
    v1 = ((uint64_t (*)(void *, uint64_t))swift_getWitnessTable)(&protocol conformance descriptor for XPCError, v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type XPCError and conformance XPCError);
    return v1;
  }
  return v3;
}

void ViewHierarchyAgentError.errorDescription.getter(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_100004E80()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Invalid request", 0xFuLL, 1)._countAndFlagsBits;
}

void static ViewHierarchyAgentError.__derived_enum_equals(_:_:)(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_100004F88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unsigned __int8 a12)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_100004FD4
                                                                                       + dword_10000503C[a12]))(a1, a2, a3, a4, a5, a6);
}

BOOL sub_100004FE4()
{
  uint64_t v1;

  return v1 == 0;
}

void ViewHierarchyAgentError.hash(into:)(uint64_t a1, char a2)
{
  __asm { BR              X8 }
}

uint64_t sub_10000509C()
{
  _QWORD v1[8];

  v1[1] = 0;
  v1[0] = 0;
  return ((uint64_t (*)(_QWORD *, void *, void *))Hasher.combine<A>(_:))(v1, &type metadata for Int, &protocol witness table for Int);
}

uint64_t ViewHierarchyAgentError.hashValue.getter(char a1)
{
  unint64_t v1;
  _BYTE v3[9];

  v3[1] = a1;
  v3[0] = a1;
  v1 = lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
  return _hashValue<A>(for:)(v3, &type metadata for ViewHierarchyAgentError, v1);
}

unint64_t lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError()
{
  unint64_t WitnessTable;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError;
  if (!lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError)
  {
    WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for ViewHierarchyAgentError, &type metadata for ViewHierarchyAgentError);
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError;
  if (!lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError)
  {
    WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for ViewHierarchyAgentError, &type metadata for ViewHierarchyAgentError);
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError;
  if (!lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError)
  {
    WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for ViewHierarchyAgentError, &type metadata for ViewHierarchyAgentError);
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError);
    return WitnessTable;
  }
  return v2;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ViewHierarchyAgentError(char *a1)
{
  char v1;

  static ViewHierarchyAgentError.__derived_enum_equals(_:_:)(*a1);
  return v1 & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance ViewHierarchyAgentError()
{
  char *v0;

  return ViewHierarchyAgentError.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance ViewHierarchyAgentError(uint64_t a1)
{
  char *v1;

  ViewHierarchyAgentError.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ViewHierarchyAgentError(Swift::Int a1)
{
  return Hashable._rawHashValue(seed:)(a1);
}

void protocol witness for LocalizedError.errorDescription.getter in conformance ViewHierarchyAgentError()
{
  char *v0;

  ViewHierarchyAgentError.errorDescription.getter(*v0);
}

uint64_t protocol witness for LocalizedError.failureReason.getter in conformance ViewHierarchyAgentError()
{
  return LocalizedError.failureReason.getter();
}

uint64_t protocol witness for LocalizedError.recoverySuggestion.getter in conformance ViewHierarchyAgentError()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t protocol witness for LocalizedError.helpAnchor.getter in conformance ViewHierarchyAgentError()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t protocol witness for Error._domain.getter in conformance ViewHierarchyAgentError()
{
  return Error._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance ViewHierarchyAgentError()
{
  return Error._code.getter();
}

uint64_t protocol witness for Error._userInfo.getter in conformance ViewHierarchyAgentError()
{
  return Error._userInfo.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance ViewHierarchyAgentError()
{
  return Error._getEmbeddedNSError()();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ViewHierarchyAgentError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xFC)
      goto LABEL_15;
    v7 = ((a2 + 3) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 252;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 4;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *storeEnumTagSinglePayload for ViewHierarchyAgentError(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xFC)
  {
    v5 = ((a3 + 3) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xFC)
  {
    v4 = ((a2 - 253) >> 8) + 1;
    *result = a2 + 3;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 3;
  }
  return result;
}

uint64_t getEnumTag for ViewHierarchyAgentError(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for ViewHierarchyAgentError(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ViewHierarchyAgentError()
{
  return &type metadata for ViewHierarchyAgentError;
}

unint64_t base witness table accessor for Error in ViewHierarchyAgentError()
{
  return lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
}

unint64_t base witness table accessor for Equatable in ViewHierarchyAgentError()
{
  return lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
}

uint64_t one-time initialization function for logger()
{
  Swift::String v0;
  Swift::String v1;
  uint64_t v3;

  v3 = type metadata accessor for Logger(0);
  __swift_allocate_value_buffer(v3, logger);
  __swift_project_value_buffer(v3, (uint64_t)logger);
  v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.dt.ViewHierarchy", 0x1AuLL, 1);
  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ViewHierarchyAgent", 0x12uLL, 1);
  return Logger.init(subsystem:category:)(v0._countAndFlagsBits, v0._object, v1._countAndFlagsBits, v1._object);
}

uint64_t logger.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for logger != -1)
    ((void (*)(uint64_t *, uint64_t (*)()))swift_once)(&one-time initialization token for logger, one-time initialization function for logger);
  v0 = type metadata accessor for Logger(0);
  return __swift_project_value_buffer(v0, (uint64_t)logger);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
    return *(_QWORD *)a2;
  return v3;
}

uint64_t __swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v5;

  v5 = a2;
  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v2 = swift_slowAlloc(*(_QWORD *)(*(_QWORD *)(a1 - 8) + 64), *(_DWORD *)(*(_QWORD *)(a1 - 8) + 80));
    *a2 = v2;
    return v2;
  }
  return (uint64_t)v5;
}

uint64_t CaptureController.__allocating_init(requestExecutor:)(_QWORD *a1)
{
  uint64_t v1;

  swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  return CaptureController.init(requestExecutor:)(a1);
}

uint64_t CaptureController.init(requestExecutor:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  NSURL *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
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
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  id v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  NSObject *v60;
  int v61;
  uint32_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint8_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _BYTE **v72;
  uint64_t *v73;
  uint64_t *v74;
  uint64_t v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char *v81;
  uint64_t v82;
  unint64_t v83;
  _QWORD *v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char *v88;
  id v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  id v96;
  __objc2_class_ro *v97;
  __objc2_class_ro *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void (*v102)(char *, uint64_t);
  char *v103;
  id v104;
  id v105;
  id v106;
  unsigned int v107;
  uint64_t (*v108)(uint64_t, uint64_t, uint64_t);
  uint64_t v109;
  _BYTE *v110;
  uint64_t v111;
  uint32_t v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  char v120[8];
  uint64_t vars0;
  uint64_t vars8;

  v84 = a1;
  v76 = "Fatal error";
  v77 = "ViewHierarchyAgent/CaptureController.swift";
  v116 = 0;
  v115 = 0;
  v113 = 0;
  v82 = 0;
  v78 = type metadata accessor for Logger(0);
  v79 = *(_QWORD *)(v78 - 8);
  v80 = (*(_QWORD *)(v79 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1 = __chkstk_darwin(0);
  v81 = (char *)&v47 - v80;
  v92 = type metadata accessor for UUID(v1);
  v90 = *(_QWORD *)(v92 - 8);
  v83 = (*(_QWORD *)(v90 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = __chkstk_darwin(v82);
  v91 = (char *)&v47 - v83;
  v101 = type metadata accessor for URL(v2);
  v99 = *(_QWORD *)(v101 - 8);
  v86 = *(_QWORD *)(v99 + 64);
  v85 = (v86 + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = __chkstk_darwin(v84);
  v95 = (char *)&v47 - v85;
  v87 = (v86 + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = __chkstk_darwin(v3);
  v103 = (char *)&v47 - v87;
  v116 = v4;
  v115 = v5;
  v88 = v120;
  outlined init with copy of RequestExecutor(v4, (uint64_t)v120);
  outlined init with take of RequestExecutor(v88, (void *)(v100 + 16));
  v6 = (void *)objc_opt_self(NSFileManager);
  v97 = &SystemXPCRequestExecutor;
  v89 = objc_msgSend(v6, "defaultManager");
  v96 = objc_msgSend(v89, "temporaryDirectory");
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  v8 = UUID.init()(v7);
  v93 = UUID.uuidString.getter(v8);
  v94 = v9;
  (*(void (**)(char *, uint64_t))(v90 + 8))(v91, v92);
  URL.appendingPathComponent(_:)(v93, v94);
  v10 = v103;
  swift_bridgeObjectRelease(v94);
  v102 = *(void (**)(char *, uint64_t))(v99 + 8);
  v102(v95, v101);

  v98 = &SystemXPCRequestExecutor;
  (*(void (**)(uint64_t, char *, uint64_t))(v99 + 32))(v100 + OBJC_IVAR____TtC18ViewHierarchyAgent17CaptureController_temporaryDirectory, v10, v101);
  v119 = 0;
  v11 = (void *)objc_opt_self(NSFileManager);
  v106 = objc_msgSend(v11, v97[10].name);
  (*(void (**)(char *, char *, uint64_t))(v99 + 16))(v10, (char *)v98[15].ivars + v100, v101);
  URL._bridgeToObjectiveC()(v12);
  v105 = v13;
  v102(v103, v101);
  v114 = v119;
  v107 = objc_msgSend(v106, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v105, 1, 0, &v114);
  v104 = v114;
  v14 = v114;
  v15 = v119;
  v119 = v104;

  if ((v107 & 1) == 0)
  {
    while (1)
    {
      v47 = v119;
      v48 = _convertNSErrorToError(_:)();

      swift_willThrow();
      v20 = v81;
      v66 = 0;
      swift_errorRetain(v48);
      v113 = v48;
      v21 = logger.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v20, v21, v78);
      swift_errorRetain(v48);
      v54 = 7;
      v22 = swift_allocObject(&unk_100018898, 24, 7);
      v23 = v48;
      v55 = v22;
      *(_QWORD *)(v22 + 16) = v48;
      v60 = Logger.logObject.getter(v23);
      v61 = static os_log_type_t.fault.getter();
      v51 = &v111;
      v111 = 12;
      v49 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      v50 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      v24 = lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)(&v112, v51, &type metadata for UInt32, &type metadata for Int, v49, v50, v24);
      v62 = v112;
      v52 = 17;
      v25 = swift_allocObject(&unk_1000188C0, 17, v54);
      v26 = v52;
      v27 = v54;
      v71 = v25;
      *(_BYTE *)(v25 + 16) = 32;
      v28 = swift_allocObject(&unk_1000188E8, v26, v27);
      v29 = v54;
      v64 = v28;
      *(_BYTE *)(v28 + 16) = 8;
      v53 = 32;
      v30 = swift_allocObject(&unk_100018910, 32, v29);
      v31 = v53;
      v32 = v54;
      v33 = v30;
      v34 = v55;
      v56 = v33;
      *(_QWORD *)(v33 + 16) = partial apply for implicit closure #1 in CaptureController.init(requestExecutor:);
      *(_QWORD *)(v33 + 24) = v34;
      v35 = swift_allocObject(&unk_100018938, v31, v32);
      v36 = v56;
      v65 = v35;
      *(_QWORD *)(v35 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
      *(_QWORD *)(v35 + 24) = v36;
      v59 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      v57 = _allocateUninitializedArray<A>(_:)(3);
      v58 = v37;
      swift_retain(v71);
      v38 = v64;
      v39 = v71;
      v40 = v58;
      *v58 = partial apply for closure #1 in OSLogArguments.append(_:);
      v40[1] = v39;
      swift_retain(v38);
      v41 = v65;
      v42 = v64;
      v43 = v58;
      v58[2] = closure #1 in OSLogArguments.append(_:)partial apply;
      v43[3] = v42;
      swift_retain(v41);
      v44 = v57;
      v45 = v65;
      v46 = v58;
      v58[4] = partial apply for closure #1 in OSLogArguments.append(_:);
      v46[5] = v45;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease(v44);
      if (os_log_type_enabled(v60, (os_log_type_t)v61))
      {
        v17 = v66;
        v68 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12, &type metadata for UInt8);
        v67 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        v69 = createStorage<A>(capacity:type:)(0, v67, v67);
        v70 = createStorage<A>(capacity:type:)(1, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
        v72 = &v110;
        v110 = v68;
        v73 = &v118;
        v118 = v69;
        v74 = &v117;
        v117 = v70;
        serialize(_:at:)(2, &v110);
        serialize(_:at:)(1, v72);
        v108 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v109 = v71;
        closure #1 in osLogInternal(_:log:type:)(&v108, (uint64_t)v72, (uint64_t)v73, (uint64_t)v74);
        v75 = v17;
        if (v17)
        {
          __break(1u);
        }
        else
        {
          v108 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
          v109 = v64;
          closure #1 in osLogInternal(_:log:type:)(&v108, (uint64_t)&v110, (uint64_t)&v118, (uint64_t)&v117);
          v63 = 0;
          v108 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
          v109 = v65;
          closure #1 in osLogInternal(_:log:type:)(&v108, (uint64_t)&v110, (uint64_t)&v118, (uint64_t)&v117);
          _os_log_impl((void *)&_mh_execute_header, v60, (os_log_type_t)v61, "Failed to remove temporary directory: %s", v68, v62);
          destroyStorage<A>(_:count:)(v69, 0);
          destroyStorage<A>(_:count:)(v70, 1);
          UnsafeMutablePointer.deallocate()();
          swift_release(v71);
          swift_release(v64);
          swift_release(v65);
        }
      }
      else
      {
        swift_release(v71);
        swift_release(v64);
        swift_release(v65);
      }

      (*(void (**)(char *, uint64_t))(v79 + 8))(v81, v78);
      v18 = implicit closure #1 in default argument 0 of fatalError(_:file:line:)();
      vars0 = 26;
      LODWORD(vars8) = 0;
      _assertionFailure(_:_:file:line:flags:)(v76, 11, 2, v18, v19, v77, 42);
      __break(1u);
    }
  }
  __swift_destroy_boxed_opaque_existential_1(v84);
  return v100;
}

uint64_t outlined init with copy of RequestExecutor(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

void *outlined init with take of RequestExecutor(const void *a1, void *__dst)
{
  memcpy(__dst, a1, 0x28uLL);
  return __dst;
}

uint64_t implicit closure #1 in CaptureController.init(requestExecutor:)(uint64_t a1)
{
  _QWORD v2[3];
  _BYTE v3[8];

  swift_getErrorValue(a1, v3, v2);
  return Error.localizedDescription.getter(v2[1], v2[2]);
}

uint64_t sub_100006578()
{
  uint64_t v0;
  uint64_t v2;

  swift_errorRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v2, 24, 7);
}

uint64_t partial apply for implicit closure #1 in CaptureController.init(requestExecutor:)()
{
  uint64_t v0;

  return implicit closure #1 in CaptureController.init(requestExecutor:)(*(_QWORD *)(v0 + 16));
}

uint64_t CaptureController.deinit()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  NSURL *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
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
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  id v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  int v48;
  uint32_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE **v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  void (*v73)(char *, uint64_t);
  id v74;
  id v75;
  id v76;
  unsigned int v77;
  uint64_t (*v78)(uint64_t, uint64_t, uint64_t);
  uint64_t v79;
  _BYTE *v80;
  uint64_t v81;
  uint32_t v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;

  v85 = 0;
  v83 = 0;
  v63 = 0;
  v64 = type metadata accessor for Logger(0);
  v65 = *(_QWORD *)(v64 - 8);
  v66 = (*(_QWORD *)(v65 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v0 = __chkstk_darwin(0);
  v67 = (char *)&v34 - v66;
  v71 = type metadata accessor for URL(v0);
  v70 = *(_QWORD *)(v71 - 8);
  v68 = (*(_QWORD *)(v70 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v71);
  v1 = (char *)&v34 - v68;
  v72 = (char *)&v34 - v68;
  v85 = v2;
  v88 = 0;
  v76 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v1, v69 + OBJC_IVAR____TtC18ViewHierarchyAgent17CaptureController_temporaryDirectory, v71);
  URL._bridgeToObjectiveC()(v3);
  v75 = v4;
  v73 = *(void (**)(char *, uint64_t))(v70 + 8);
  v73(v72, v71);
  v84 = v88;
  v77 = objc_msgSend(v76, "removeItemAtURL:error:", v75, &v84);
  v74 = v84;
  v5 = v84;
  v6 = v88;
  v88 = v74;

  if ((v77 & 1) == 0)
  {
    v34 = v88;
    v46 = _convertNSErrorToError(_:)();

    swift_willThrow();
    v9 = v67;
    v53 = 0;
    swift_errorRetain(v46);
    v83 = v46;
    v10 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v9, v10, v64);
    swift_errorRetain(v46);
    v40 = 7;
    v41 = swift_allocObject(&unk_100018960, 24, 7);
    *(_QWORD *)(v41 + 16) = v46;
    v47 = Logger.logObject.getter();
    v48 = static os_log_type_t.fault.getter();
    v37 = &v81;
    v81 = 12;
    v35 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v36 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v11 = lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)(&v82, v37, &type metadata for UInt32, &type metadata for Int, v35, v36, v11);
    v49 = v82;
    v38 = 17;
    v12 = swift_allocObject(&unk_100018988, 17, v40);
    v13 = v38;
    v14 = v40;
    v58 = v12;
    *(_BYTE *)(v12 + 16) = 32;
    v15 = swift_allocObject(&unk_1000189B0, v13, v14);
    v16 = v40;
    v51 = v15;
    *(_BYTE *)(v15 + 16) = 8;
    v39 = 32;
    v17 = swift_allocObject(&unk_1000189D8, 32, v16);
    v18 = v39;
    v19 = v40;
    v20 = v17;
    v21 = v41;
    v42 = v20;
    *(_QWORD *)(v20 + 16) = partial apply for implicit closure #1 in CaptureController.deinit;
    *(_QWORD *)(v20 + 24) = v21;
    v22 = swift_allocObject(&unk_100018A00, v18, v19);
    v23 = v42;
    v52 = v22;
    *(_QWORD *)(v22 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
    *(_QWORD *)(v22 + 24) = v23;
    v45 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v43 = _allocateUninitializedArray<A>(_:)(3);
    v44 = v24;
    swift_retain(v58);
    v25 = v51;
    v26 = v58;
    v27 = v44;
    *v44 = closure #1 in OSLogArguments.append(_:)partial apply;
    v27[1] = v26;
    swift_retain(v25);
    v28 = v52;
    v29 = v51;
    v30 = v44;
    v44[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v30[3] = v29;
    swift_retain(v28);
    v31 = v43;
    v32 = v52;
    v33 = v44;
    v44[4] = closure #1 in OSLogArguments.append(_:)partial apply;
    v33[5] = v32;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease(v31);
    if (os_log_type_enabled(v47, (os_log_type_t)v48))
    {
      v8 = v53;
      v55 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12, &type metadata for UInt8);
      v54 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v56 = createStorage<A>(capacity:type:)(0, v54, v54);
      v57 = createStorage<A>(capacity:type:)(1, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      v59 = &v80;
      v80 = v55;
      v60 = &v87;
      v87 = v56;
      v61 = &v86;
      v86 = v57;
      serialize(_:at:)(2, &v80);
      serialize(_:at:)(1, v59);
      v78 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v79 = v58;
      closure #1 in osLogInternal(_:log:type:)(&v78, (uint64_t)v59, (uint64_t)v60, (uint64_t)v61);
      v62 = v8;
      if (v8)
      {
        __break(1u);
      }
      else
      {
        v78 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v79 = v51;
        closure #1 in osLogInternal(_:log:type:)(&v78, (uint64_t)&v80, (uint64_t)&v87, (uint64_t)&v86);
        v50 = 0;
        v78 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v79 = v52;
        closure #1 in osLogInternal(_:log:type:)(&v78, (uint64_t)&v80, (uint64_t)&v87, (uint64_t)&v86);
        _os_log_impl((void *)&_mh_execute_header, v47, (os_log_type_t)v48, "Failed to remove temporary directory: %s", v55, v49);
        destroyStorage<A>(_:count:)(v56, 0);
        destroyStorage<A>(_:count:)(v57, 1);
        UnsafeMutablePointer.deallocate()();
        swift_release(v58);
        swift_release(v51);
        swift_release(v52);
      }
    }
    else
    {
      swift_release(v58);
      swift_release(v51);
      swift_release(v52);
    }

    (*(void (**)(char *, uint64_t))(v65 + 8))(v67, v64);
    swift_errorRelease(v46);
    swift_errorRelease(v46);
  }
  __swift_destroy_boxed_opaque_existential_1((_QWORD *)(v69 + 16));
  v73((char *)(v69 + OBJC_IVAR____TtC18ViewHierarchyAgent17CaptureController_temporaryDirectory), v71);
  return v69;
}

uint64_t implicit closure #1 in CaptureController.deinit(uint64_t a1)
{
  _QWORD v2[3];
  _BYTE v3[8];

  swift_getErrorValue(a1, v3, v2);
  return Error.localizedDescription.getter(v2[1], v2[2]);
}

uint64_t CaptureController.__deallocating_deinit()
{
  uint64_t v0;

  v0 = CaptureController.deinit();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t CaptureController.performRequest(_:using:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[15] = v3;
  v4[14] = a3;
  v4[13] = a2;
  v4[12] = a1;
  v4[9] = v4;
  v4[7] = 0;
  v4[8] = 0;
  v4[10] = 0;
  v4[11] = 0;
  v4[7] = a1;
  v4[8] = a2;
  v4[10] = a3;
  v4[11] = v3;
  return swift_task_switch(CaptureController.performRequest(_:using:), 0);
}

uint64_t CaptureController.performRequest(_:using:)()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;

  v1 = v0[15];
  v0[9] = v0;
  outlined init with copy of RequestExecutor(v1 + 16, (uint64_t)(v0 + 2));
  v6 = v0[5];
  v7 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v6);
  v2 = *(int **)(v7 + 8);
  v8 = (int *)((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc(v2[1]);
  v5[16] = v3;
  *v3 = v5[9];
  v3[1] = CaptureController.performRequest(_:using:);
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))v8)(v5[12], v5[13], v5[14], v6, v7);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 128);
  *(_QWORD *)(v2 + 72) = *v1;
  *(_QWORD *)(v2 + 136) = v0;
  swift_task_dealloc(v3);
  if (v0)
    return swift_task_switch(CaptureController.performRequest(_:using:), 0);
  else
    return swift_task_switch(CaptureController.performRequest(_:using:), 0);
}

{
  uint64_t v0;

  *(_QWORD *)(v0 + 72) = v0;
  __swift_destroy_boxed_opaque_existential_1((_QWORD *)(v0 + 16));
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 72) + 8))();
}

{
  uint64_t v0;
  uint64_t v2;

  *(_QWORD *)(v0 + 72) = v0;
  __swift_destroy_boxed_opaque_existential_1((_QWORD *)(v0 + 16));
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 72) + 8))();
}

uint64_t CaptureController.createTemporaryFile()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  char *v29;
  uint64_t v30;
  char *v31;

  v25 = a1;
  v31 = 0;
  v30 = 0;
  v9[1] = 0;
  v17 = type metadata accessor for UUID();
  v15 = *(_QWORD *)(v17 - 8);
  v10 = (*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1 = __chkstk_darwin(0);
  v16 = (char *)v9 - v10;
  v27 = type metadata accessor for URL(v1);
  v20 = *(_QWORD *)(v27 - 8);
  v12 = *(_QWORD *)(v20 + 64);
  v11 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v27);
  v21 = (char *)v9 - v11;
  v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = __chkstk_darwin((char *)v9 - v11);
  v29 = (char *)v9 - v13;
  v31 = (char *)v9 - v13;
  v30 = v14;
  v26 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
  v4 = v26(v2, v14 + OBJC_IVAR____TtC18ViewHierarchyAgent17CaptureController_temporaryDirectory);
  v5 = UUID.init()(v4);
  v18 = UUID.uuidString.getter(v5);
  v19 = v6;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v16, v17);
  URL.appendingPathComponent(_:)(v18, v19);
  swift_bridgeObjectRelease(v19);
  v28 = *(void (**)(char *, uint64_t))(v20 + 8);
  v28(v21, v27);
  v24 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  URL.path.getter();
  v22 = v7;
  v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v22);
  objc_msgSend(v24, "createFileAtPath:contents:attributes:", v23, 0);

  ((void (*)(uint64_t, char *, uint64_t))v26)(v25, v29, v27);
  return ((uint64_t (*)(char *, uint64_t))v28)(v29, v27);
}

uint64_t implicit closure #1 in default argument 0 of fatalError(_:file:line:)()
{
  swift_bridgeObjectRetain();
  return 0;
}

unint64_t lazy protocol witness table accessor for type UInt32 and conformance UInt32()
{
  unint64_t WitnessTable;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for UInt32, &type metadata for UInt32);
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for UInt32, &type metadata for UInt32);
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
    return WitnessTable;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t WitnessTable;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
    return WitnessTable;
  }
  return v2;
}

uint64_t createStorage<A>(capacity:type:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
    return static UnsafeMutablePointer.allocate(capacity:)(a1, a3);
  else
    return 0;
}

uint64_t serialize(_:at:)(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

void destroyStorage<A>(_:count:)(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    UnsafeMutablePointer.deinitialize(count:)(a2);
    UnsafeMutablePointer.deallocate()();
  }
}

Swift::Void __swiftcall Array._endMutation()()
{
  _QWORD *v0;

  *v0 = *v0;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

_QWORD *closure #1 in OSLogArguments.append(_:)(_QWORD *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v4 = a4();
  v9 = v5;
  v6 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v5, a3);
  v10 = *a1;
  v12 = v6;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  swift_bridgeObjectRelease(v9);
  result = a1;
  *a1 = v10 + 8;
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  __int16 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[4];
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;

  v14 = specialized _StringGuts._deconstructUTF8<A>(scratch:)((uint64_t)&v17, 0, 0, 1, a1, a2);
  v15 = v3;
  v16 = v4;
  v11 = v17;
  if (v14)
  {
    v12[3] = swift_getObjectType();
    v12[0] = v14;
    v6 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }
    __swift_destroy_boxed_opaque_existential_0(v12);
  }
  else
  {
    v13[3] = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    v7 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }
    swift_bridgeObjectRetain(a2);
    __swift_destroy_boxed_opaque_existential_0(v13);
  }
  return v11;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  char v13;
  char v14;
  int64_t v15;
  int64_t v16;
  _QWORD *v17;
  _QWORD v22[4];
  char v23;
  char v24;
  uint64_t v25;

  v17 = (_QWORD *)result;
  v25 = a6;
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (a2)
      {
        if (!a3)
          __break(1u);
        v16 = a3 - (_QWORD)a2;
      }
      else
      {
        v16 = 0;
      }
      v15 = (a6 & 0xF00000000000000uLL) >> 56;
      if (v15 < v16)
      {
        if (a2)
        {
          v22[0] = a5;
          v22[1] = a6 & (-(uint64_t)bswap64(0xFFuLL) - 1);
          specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(v22, v15, a2);
          UnsafeMutableRawBufferPointer.subscript.setter(0, v15, a2, a3);
          *v17 = a2;
          v11 = 0;
          v12 = v15;
          v13 = 1;
          v14 = 0;
LABEL_26:
          v22[2] = v11;
          v22[3] = v12;
          v23 = v13 & 1;
          v24 = v14 & 1;
          return (uint64_t)v11;
        }
        goto LABEL_28;
      }
    }
LABEL_13:
    v6 = _StringGuts._allocateForDeconstruct()(a5, a6);
    *v17 = v7;
    v11 = v6;
    v12 = v8;
    v13 = 0;
    v14 = 1;
    goto LABEL_26;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0xFFFFFFFFFFFFFFE0)
    {
      v10 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
      goto LABEL_21;
    }
    __break(1u);
  }
  result = _StringObject.sharedUTF8.getter(a5, a6);
  if (!result)
    goto LABEL_29;
  v10 = result;
LABEL_21:
  *v17 = v10;
  if (a6 < 0)
  {
    v9 = 0;
LABEL_25:
    v11 = (_QWORD *)v9;
    v12 = a5 & 0xFFFFFFFFFFFFLL;
    v13 = 0;
    v14 = 0;
    goto LABEL_26;
  }
  if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    swift_unknownObjectRetain();
    v9 = a6 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(const void *a1, size_t a2, void *__dst)
{
  memcpy(__dst, a1, a2);
  return __dst;
}

_QWORD *_StringGuts._allocateForDeconstruct()(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v6 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  v4 = v6[2];
  specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(v4);
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v4, 0);
  specialized Array._endMutation()();
  swift_retain(v6);
  v5 = specialized Array.count.getter((uint64_t)v6);
  swift_bridgeObjectRelease(v6);
  result = (_QWORD *)v5;
  if (!__OFSUB__(v5, 1))
    return v6;
  __break(1u);
  return result;
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  char v3;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v10[3];

  v10[2] = a2;
  if ((a2 & 0x1000000000000000) != 0)
  {
    v7 = String.UTF8View._foreignCount()();
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    v7 = (a2 & 0xF00000000000000uLL) >> 56;
  }
  else
  {
    v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v7)
    return specialized ContiguousArray.init()();
  v5 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v7, 0);
  swift_retain(v5);
  swift_release(v5);
  result = (_QWORD *)_StringGuts.copyUTF8(into:)(v5 + 4, v7, a1, a2);
  v6 = result;
  if ((v3 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    result = v10;
    v10[0] = 0;
    v10[1] = 0xE000000000000000;
    outlined destroy of String.UTF8View((uint64_t)v10);
    if (v6 == (_QWORD *)v7)
      return v5;
  }
  __break(1u);
  return result;
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  uint64_t *v0;
  uint64_t result;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v4 = *v0;
  result = swift_isUniquelyReferenced_nonNull_native();
  *v0 = v4;
  if ((result & 1) == 0)
  {
    v2 = specialized Array.count.getter(*v3);
    result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2 + 1, 1, *v3);
    *v3 = result;
  }
  return result;
}

uint64_t specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(uint64_t result)
{
  uint64_t v1;
  uint64_t *v2;

  if (*(_QWORD *)(*(_QWORD *)v1 + 24) >> 1 < result + 1)
  {
    result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(*(_QWORD *)(*(_QWORD *)v1 + 24) >> 1 != 0, result + 1, 1, *v2);
    *v2 = result;
  }
  return result;
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(uint64_t a1, char a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + 1;
  v4 = *v2;
  swift_bridgeObjectRetain();
  *(_QWORD *)(v4 + 16) = v5;
  swift_release(v4);
  v6 = *v2;
  swift_retain(*v2);
  *(_BYTE *)(v6 + 32 + a1) = a2;
  return swift_release(v6);
}

void specialized Array._endMutation()()
{
  _QWORD *v0;

  *v0 = *v0;
}

uint64_t specialized Array.count.getter(uint64_t a1)
{
  return specialized Array._getCount()(a1);
}

_QWORD *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  size_t v4;
  _QWORD *v6;
  uint64_t v7;

  if (a2 < a1)
    v7 = a1;
  else
    v7 = a2;
  if (v7)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    v6 = (_QWORD *)swift_allocObject(v2, v7 + 32, 7);
    if ((_swift_stdlib_has_malloc_size() & 1) != 0)
    {
      v4 = (size_t)v6 + _swift_stdlib_malloc_size(v6);
      swift_retain(v6);
      v6[2] = a1;
      v6[3] = 2 * (v4 - (_QWORD)(v6 + 4));
    }
    else
    {
      swift_retain(v6);
      v6[2] = a1;
      v6[3] = 2 * v7;
    }
    swift_release(v6);
    return v6;
  }
  else
  {
    swift_retain(&_swiftEmptyArrayStorage);
    return &_swiftEmptyArrayStorage;
  }
}

void *specialized ContiguousArray.init()()
{
  swift_retain(&_swiftEmptyArrayStorage);
  return &_swiftEmptyArrayStorage;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v5;
  size_t v6;
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v16;

  swift_retain(a4);
  result = swift_retain(a4);
  v16 = *(_QWORD *)(a4 + 24) >> 1;
  if ((a3 & 1) != 0)
  {
    if (v16 < a2)
    {
      if ((unsigned __int128)(v16 * (__int128)2) >> 64 != (2 * v16) >> 63)
      {
        __break(1u);
        return result;
      }
      if (2 * v16 < a2)
        v11 = a2;
      else
        v11 = 2 * v16;
    }
    else
    {
      v11 = *(_QWORD *)(a4 + 24) >> 1;
    }
  }
  else
  {
    v11 = a2;
  }
  v10 = *(_QWORD *)(a4 + 16);
  if (v11 < v10)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v11;
  if (v9)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    v8 = (_QWORD *)swift_allocObject(v5, v9 + 32, 7);
    if ((_swift_stdlib_has_malloc_size() & 1) != 0)
    {
      v6 = (size_t)v8 + _swift_stdlib_malloc_size(v8);
      swift_retain(v8);
      v8[2] = v10;
      v8[3] = 2 * (v6 - (_QWORD)(v8 + 4));
    }
    else
    {
      swift_retain(v8);
      v8[2] = v10;
      v8[3] = 2 * v9;
    }
    swift_release(v8);
    v7 = (char *)v8;
  }
  else
  {
    swift_retain(&_swiftEmptyArrayStorage);
    v7 = (char *)&_swiftEmptyArrayStorage;
  }
  if ((a1 & 1) != 0)
  {
    swift_release(a4);
    swift_bridgeObjectRelease(a4);
    specialized UnsafeMutablePointer.moveInitialize(from:count:)((char *)(a4 + 32), v10, v7 + 32);
    *(_QWORD *)(a4 + 16) = 0;
    swift_release(a4);
  }
  else
  {
    swift_bridgeObjectRelease(a4);
    swift_release(a4);
    swift_retain(a4);
    swift_release(a4);
    specialized UnsafeMutablePointer.initialize(from:count:)((const void *)(a4 + 32), v10, v7 + 32);
    swift_unknownObjectRelease(a4);
  }
  return (uint64_t)v7;
}

uint64_t specialized Array._getCount()(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

void *specialized UnsafeMutablePointer.initialize(from:count:)(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result)
    return (char *)memmove(a3, result, a2);
  return result;
}

_BYTE **closure #1 in OSLogArguments.append(_:)(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_10000847C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

_BYTE **partial apply for closure #1 in OSLogArguments.append(_:)(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1000084AC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

_BYTE **closure #1 in OSLogArguments.append(_:)partial apply(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1000084DC()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 32);
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_100008524()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 32);
}

_QWORD *partial apply for closure #1 in OSLogArguments.append(_:)(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _finalizeUninitializedArray<A>(_:)()
{
  type metadata accessor for Array(0);
  Array._endMutation()();
}

uint64_t __swift_destroy_boxed_opaque_existential_1(_QWORD *a1)
{
  uint64_t v2;

  v2 = a1[3];
  if ((*(_DWORD *)(*(_QWORD *)(v2 - 8) + 80) & 0x20000) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(_QWORD *))(*(_QWORD *)(v2 - 8) + 8))(a1);
}

uint64_t sub_100008614()
{
  uint64_t v0;
  uint64_t v2;

  swift_errorRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v2, 24);
}

uint64_t partial apply for implicit closure #1 in CaptureController.deinit()
{
  uint64_t v0;

  return implicit closure #1 in CaptureController.deinit(*(_QWORD *)(v0 + 16));
}

uint64_t sub_100008658()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17);
}

uint64_t sub_100008688()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17);
}

uint64_t sub_1000086B8()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 32);
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_100008700()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 32);
}

_QWORD *closure #1 in OSLogArguments.append(_:)partial apply(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  int v2;

  v2 = *(_DWORD *)(*(_QWORD *)(a2 - 8) + 80);
  if ((v2 & 0x20000) != 0)
    return (_QWORD *)(*result + ((v2 + 16) & ~(unint64_t)v2));
  return result;
}

uint64_t ObjC metadata update function for CaptureController()
{
  return type metadata accessor for CaptureController(0);
}

uint64_t type metadata accessor for CaptureController(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata singleton initialization cache for CaptureController;
  if (!type metadata singleton initialization cache for CaptureController)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CaptureController);
  return v2;
}

uint64_t type metadata completion function for CaptureController(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t updated;
  _QWORD v6[2];

  v6[0] = "(";
  v1 = type metadata accessor for URL(319);
  updated = v1;
  if (v2 <= 0x3F)
  {
    v6[1] = *(_QWORD *)(v1 - 8) + 64;
    updated = swift_updateClassMetadata2(a1, 256, 2, v6, a1 + 80);
    if (!updated)
      return 0;
  }
  return updated;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(_QWORD *a1)
{
  uint64_t v2;

  v2 = a1[3];
  if ((*(_DWORD *)(*(_QWORD *)(v2 - 8) + 80) & 0x20000) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(_QWORD *))(*(_QWORD *)(v2 - 8) + 8))(a1);
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t _swift_stdlib_has_malloc_size()
{
  return 1;
}

size_t _swift_stdlib_malloc_size(const void *a1)
{
  return malloc_size(a1);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of String.UTF8View(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

Swift::Void __swiftcall enterSandbox()()
{
  Swift::String v0;
  uint64_t v1;
  uint64_t v2;
  Swift::String v3;
  Swift::String v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.dt.ViewHierarchyAgent", 0x1FuLL, 1);
  v9 = String.utf8CString.getter(v0._countAndFlagsBits, v0._object);
  swift_retain(v9);
  swift_release(v9);
  swift_retain(v9);
  swift_bridgeObjectRelease(v9);
  v10 = _set_user_dir_suffix(v9 + 32);
  swift_unknownObjectRelease(v9);
  swift_bridgeObjectRelease(v0._object);
  if ((v10 & 1) != 0)
  {
    v7 = confstr(_:)(65537);
    v8 = v1;
    if (v1)
    {
      String.realpath.getter(v7, v1);
      v5 = v2;
      swift_bridgeObjectRelease(v8);
      v6 = v5;
    }
    else
    {
      v6 = 0;
    }
    if (v6)
    {
      swift_bridgeObjectRelease(v6);
      return;
    }
    v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Unable to read _CS_DARWIN_USER_TEMP_DIR", 0x27uLL, 1);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v3._countAndFlagsBits, v3._object, "ViewHierarchyAgent/SandboxUtils.swift", 37);
    __break(1u);
  }
  v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Could not create temporary directory.", 0x25uLL, 1);
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v4._countAndFlagsBits, v4._object, "ViewHierarchyAgent/SandboxUtils.swift", 37);
  __break(1u);
}

uint64_t confstr(_:)(int a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BYTE v9[16];
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;

  v14 = 0;
  v15 = 0;
  v16 = a1;
  v12 = 1024;
  v6 = lazy protocol witness table accessor for type Int and conformance Int();
  v7 = lazy protocol witness table accessor for type Int and conformance Int();
  v1 = lazy protocol witness table accessor for type Int32 and conformance Int32();
  SignedInteger<>.init<A>(_:)(&v13, &v12, &type metadata for Int, &type metadata for Int32, v6, v7, v1);
  v14 = Data.init(repeating:count:)(0, v13);
  v15 = v2;
  v10 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  Data.withUnsafeMutableBytes<A>(_:)(&v11, partial apply for closure #1 in confstr(_:), v9, v3);
  v5 = v11;
  outlined destroy of Data((uint64_t)&v14);
  return v5;
}

uint64_t String.realpath.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  char *v10;
  _QWORD v11[4];

  v11[2] = a1;
  v11[3] = a2;
  swift_bridgeObjectRetain(a2);
  v8 = String.utf8CString.getter(a1, a2);
  swift_retain(v8);
  swift_release(v8);
  swift_retain(v8);
  swift_bridgeObjectRelease(v8);
  v10 = realpath_DARWIN_EXTSN((const char *)(v8 + 32), 0);
  swift_unknownObjectRelease(v8);
  swift_bridgeObjectRelease(a2);
  if (!v10)
    return 0;
  v4 = String.init(cString:)();
  v5 = v2;
  swift_bridgeObjectRetain(v2);
  v11[0] = v4;
  v11[1] = v5;
  UnsafeMutablePointer.deallocate()();
  outlined destroy of String?((uint64_t)v11);
  return v4;
}

unint64_t lazy protocol witness table accessor for type Int32 and conformance Int32()
{
  unint64_t WitnessTable;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Int32, &type metadata for Int32);
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Int32, &type metadata for Int32);
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Int32, &type metadata for Int32);
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
    return WitnessTable;
  }
  return v2;
}

int64_t closure #1 in confstr(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int64_t *a4@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  int64_t result;
  int64_t v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  int v18;
  size_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v21 = a1;
  v22 = a2;
  v20 = a3;
  if (a1)
  {
    if (a2)
      v13 = a2 - a1;
    else
      __break(1u);
    if (v13 < 0)
    {
      _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, 2, 71, 0);
      __break(1u);
    }
    v4 = UnsafeMutableBufferPointer.baseAddress.getter(a1, v13, &type metadata for Int8);
  }
  else
  {
    v4 = UnsafeMutableBufferPointer.baseAddress.getter(0, 0, &type metadata for Int8);
  }
  v12 = (char *)v4;
  v18 = 1024;
  v10 = lazy protocol witness table accessor for type Int and conformance Int();
  v11 = lazy protocol witness table accessor for type Int and conformance Int();
  v5 = lazy protocol witness table accessor for type Int32 and conformance Int32();
  SignedInteger<>.init<A>(_:)(&v19, &v18, &type metadata for Int, &type metadata for Int32, v10, v11, v5);
  result = confstr(a3, v12, v19);
  if (result <= 0)
  {
    *a4 = 0;
    a4[1] = 0;
  }
  else
  {
    if (a1)
    {
      if (a2)
        v9 = a2 - a1;
      else
        __break(1u);
      if (v9 < 0)
      {
        LOBYTE(v8) = 2;
        _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v8, 71, 0);
        __break(1u);
      }
      result = UnsafeMutableBufferPointer.baseAddress.getter(a1, v9, &type metadata for Int8);
    }
    else
    {
      result = UnsafeMutableBufferPointer.baseAddress.getter(0, 0, &type metadata for Int8);
    }
    if (result)
    {
      result = String.init(cString:)();
      *a4 = result;
      a4[1] = v7;
    }
    else
    {
      *a4 = 0;
      a4[1] = 0;
    }
  }
  return result;
}

int64_t partial apply for closure #1 in confstr(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int64_t *a3@<X8>)
{
  uint64_t v3;

  return closure #1 in confstr(_:)(a1, a2, *(_DWORD *)(v3 + 16), a3);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of Data(uint64_t a1)
{
  outlined consume of Data._Representation(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t outlined consume of Data._Representation(uint64_t result, unint64_t a2)
{
  if (((a2 >> 62) & 3) == 1)
    return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
  if (((a2 >> 62) & 3) == 2)
  {
    swift_release(result);
    return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
  }
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of String?(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

uint64_t ViewHierarchyRequest.data.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v7;
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
  const char *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v23 = a1;
  v22 = a2;
  v19 = "Fatal error";
  v20 = "Unexpectedly found nil while unwrapping an Optional value";
  v21 = "ViewHierarchyAgent/ViewHierarchyRequest.swift";
  v30 = 0;
  v31 = 0;
  v28 = 0;
  v29 = 0;
  v24 = type metadata accessor for String.Encoding(0);
  v25 = *(_QWORD *)(v24 - 8);
  v26 = (*(_QWORD *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v27 = (char *)&v8 - v26;
  v30 = __chkstk_darwin(v23);
  v31 = v2;
  v17 = v23;
  v18 = v22;
  v14 = v22;
  v13 = v23;
  v3 = swift_bridgeObjectRetain();
  v28 = v13;
  v29 = v14;
  static String.Encoding.utf8.getter(v3);
  v4 = default argument 1 of String.data(using:allowLossyConversion:)();
  v15 = String.data(using:allowLossyConversion:)(v27, v4 & 1, v13, v14);
  v16 = v5;
  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
  if ((v16 & 0xF000000000000000) == 0xF000000000000000)
  {
    v7 = 2;
    _assertionFailure(_:_:file:line:flags:)(v19, 11, 2, v20, 57, 2, v21, 45, v7, 23, 0);
    __break(1u);
  }
  else
  {
    v11 = v15;
    v12 = v16;
  }
  v10 = v12;
  v9 = v11;
  swift_bridgeObjectRelease(v14);
  return v9;
}

uint64_t default argument 1 of String.data(using:allowLossyConversion:)()
{
  return 0;
}

_QWORD *initializeBufferWithCopyOfBuffer for ViewHierarchyRequest(_QWORD *a1, _QWORD *a2)
{
  _QWORD *result;
  uint64_t v4;

  *a1 = *a2;
  v4 = a2[1];
  swift_bridgeObjectRetain();
  result = a1;
  a1[1] = v4;
  return result;
}

uint64_t destroy for ViewHierarchyRequest(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

_QWORD *initializeWithCopy for ViewHierarchyRequest(_QWORD *a1, _QWORD *a2)
{
  _QWORD *result;
  uint64_t v4;

  *a1 = *a2;
  v4 = a2[1];
  swift_bridgeObjectRetain();
  result = a1;
  a1[1] = v4;
  return result;
}

_QWORD *assignWithCopy for ViewHierarchyRequest(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v4;

  *a1 = *a2;
  v4 = a2[1];
  swift_bridgeObjectRetain();
  v2 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRelease(v2);
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for ViewHierarchyRequest(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  *a1 = *a2;
  v3 = a1[1];
  a1[1] = a2[1];
  swift_bridgeObjectRelease(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for ViewHierarchyRequest(uint64_t a1, unsigned int a2)
{
  int v3;
  int v4;

  if (a2)
  {
    if (a2 > 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    {
      v4 = *(_OWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v3 = -1;
      if (*(_QWORD *)(a1 + 8) < (unint64_t)&_mh_execute_header)
        v3 = *(_QWORD *)(a1 + 8);
      v4 = v3;
    }
  }
  else
  {
    v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ViewHierarchyRequest(uint64_t result, unsigned int a2, unsigned int a3)
{
  _BOOL4 v3;

  v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(_OWORD *)result = a2 + 0x80000000;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3)
        *(_BYTE *)(result + 16) = 1;
      else
        __break(1u);
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3)
        *(_BYTE *)(result + 16) = 0;
      else
        __break(1u);
    }
    if (a2)
      *(_QWORD *)(result + 8) = a2 - 1;
  }
  return result;
}

uint64_t getEnumTag for ViewHierarchyRequest()
{
  return 0;
}

ValueMetadata *type metadata accessor for ViewHierarchyRequest()
{
  return &type metadata for ViewHierarchyRequest;
}

uint64_t default argument 1 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t default argument 2 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = specialized static Array._allocateUninitialized(_:)(0);
  type metadata accessor for OS_dispatch_queue.Attributes(0);
  v4 = v2;
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  v0 = lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
  return dispatch thunk of SetAlgebra.init<A>(_:)(&v4, v3, v0);
}

uint64_t default argument 3 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  unsigned int v3;

  v3 = enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:);
  v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 8) + 104))(a1, v3);
}

void static ViewHierarchyAgent.main()()
{
  uint64_t v0;

  enterSandbox()();
  v0 = *ViewHierarchyAgent.shared.unsafeMutableAddressor();
  swift_retain(v0);
  ViewHierarchyAgent.run()();
}

uint64_t sub_100009BC8()
{
  return ((uint64_t (*)())swift_release)();
}

uint64_t *ViewHierarchyAgent.shared.unsafeMutableAddressor()
{
  if (one-time initialization token for shared != -1)
    swift_once(&one-time initialization token for shared, one-time initialization function for shared);
  return &static ViewHierarchyAgent.shared;
}

Swift::Void __swiftcall ViewHierarchyAgent.run()()
{
  ViewHierarchyAgent.startSystemListener()();
  ViewHierarchyAgent.startRemoteListener()();
  ViewHierarchyAgent.startTargetHubListener()();
  dispatch_main();
}

_QWORD *one-time initialization function for shared()
{
  _QWORD *result;

  type metadata accessor for ViewHierarchyAgent();
  result = ViewHierarchyAgent.__allocating_init()();
  static ViewHierarchyAgent.shared = (uint64_t)result;
  return result;
}

_QWORD *ViewHierarchyAgent.__allocating_init()()
{
  uint64_t v0;

  swift_allocObject(v0, 104, 7);
  return ViewHierarchyAgent.().init()();
}

_QWORD *ViewHierarchyAgent.().init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  Builtin::Word v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  Swift::String v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  Swift::String v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  _QWORD *v24;
  Swift::String v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *result;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  Swift::String v33;
  uint64_t v34;
  Swift::String v35;
  unint64_t v36;
  Swift::String v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t countAndFlagsBits;
  id v46;
  void *object;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;

  v64 = 0;
  v50 = 0;
  v30 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0) - 8) + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  v1 = __chkstk_darwin(0);
  v40 = (uint64_t)&v30 - v30;
  v31 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for OS_dispatch_queue.Attributes(v1) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = __chkstk_darwin(v50);
  v39 = (char *)&v30 - v31;
  v32 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for DispatchQoS(v2) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v50);
  v38 = (char *)&v30 - v32;
  v64 = v0;
  v36 = type metadata accessor for OS_dispatch_queue();
  v34 = 19;
  v57 = 1;
  v33 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SystemListenerQueue", 0x13uLL, 1);
  default argument 1 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  default argument 2 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  default argument 3 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v40);
  v3 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v33._countAndFlagsBits, v33._object, v38, v39, v40, v50);
  v4 = v34;
  v5 = v57;
  v63[2] = v3;
  v35 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("RemoteListenerQueue", v4, v5 & 1);
  default argument 1 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  default argument 2 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  default argument 3 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v40);
  v6 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v35._countAndFlagsBits, v35._object, v38, v39, v40, v50);
  v7 = v57;
  v63[3] = v6;
  v37 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("TargetHubListenerQueue", 0x16uLL, v7 & 1);
  default argument 1 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  default argument 2 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  default argument 3 of OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v40);
  v8 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v37._countAndFlagsBits, v37._object, v38, v39, v40, v50);
  v9 = v63;
  v63[4] = v8;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Int32, CaptureController));
  v41 = _allocateUninitializedArray<A>(_:)(v50);
  type metadata accessor for CaptureController(v50);
  v42 = &type metadata for Int32;
  v43 = &protocol witness table for Int32;
  v9[11] = Dictionary.init(dictionaryLiteral:)(v41);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Int32, CheckedContinuation<SystemXPCPeerConnection, Error>));
  v44 = _allocateUninitializedArray<A>(_:)(v50);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>);
  v10 = Dictionary.init(dictionaryLiteral:)(v44);
  v11 = v50;
  v9[12] = v10;
  v52 = type metadata accessor for SystemXPCListenerConnection(v11);
  v12 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.dt.ViewHierarchyAgent.xpc", 0x23uLL, v57 & 1);
  countAndFlagsBits = v12._countAndFlagsBits;
  object = v12._object;
  v46 = (id)v63[2];
  v13 = v46;
  v14 = static SystemXPCConnection.machServiceListenerConnection(name:targetQueue:)(countAndFlagsBits, object, v46);
  v15 = v63;
  v48 = v14;
  v49 = v16;

  swift_bridgeObjectRelease(object);
  v17 = v49;
  v18 = v50;
  v15[5] = v48;
  v15[6] = v17;
  type metadata accessor for RemoteXPCListenerConnection(v18);
  v19 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.dt.ViewHierarchyAgent.remote", 0x26uLL, v57 & 1);
  v51 = v19._countAndFlagsBits;
  v54 = v19._object;
  v53 = (id)v63[3];
  v20 = v53;
  v55 = static RemoteXPCConnection.remoteServiceListenerConnection(serviceName:targetQueue:)(v51, v54, v53);
  v56 = v21;

  swift_bridgeObjectRelease(v54);
  v22 = v56;
  v23 = v57;
  v24 = v63;
  v63[7] = v55;
  v24[8] = v22;
  v25 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.dt.ViewHierarchyTargetHub.xpc", 0x27uLL, v23 & 1);
  v58 = v25._countAndFlagsBits;
  v60 = v25._object;
  v59 = (id)v63[4];
  v26 = v59;
  v61 = static SystemXPCConnection.machServiceListenerConnection(name:targetQueue:)(v58, v60, v59);
  v62 = v27;

  swift_bridgeObjectRelease(v60);
  v28 = v62;
  result = v63;
  v63[9] = v61;
  result[10] = v28;
  return result;
}

Swift::Void __swiftcall ViewHierarchyAgent.startSystemListener()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t *v20;
  uint64_t *v21;
  _BYTE **v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t *v38;
  uint32_t v39;
  uint64_t v40;
  int v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE *v47;
  uint64_t v48;
  uint32_t v49;
  uint64_t v50;

  v50 = 0;
  v26 = 0;
  v40 = 0;
  v35 = type metadata accessor for Logger(0);
  v34 = *(_QWORD *)(v35 - 8);
  v27 = (*(_QWORD *)(v34 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v35);
  v32 = (char *)&v13 - v27;
  v50 = v0;
  v1 = *(_QWORD **)(v0 + 40);
  v31 = v1;
  v29 = *(_QWORD *)(v0 + 48);
  swift_retain(v1);
  v28 = *v1;
  swift_retain(v30);
  dispatch thunk of XPCListenerConnection.setPeerConnectionHandler(_:)(partial apply for closure #1 in ViewHierarchyAgent.startSystemListener(), v30, v28, v29);
  v2 = v30;
  swift_release(v30);
  swift_release(v31);
  v33 = *(_QWORD *)(v2 + 40);
  v3 = swift_retain(v33);
  dispatch thunk of XPCConnection.activate()(v3);
  v4 = v32;
  swift_release(v33);
  v5 = logger.unsafeMutableAddressor();
  v6 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 16))(v4, v5, v35);
  v42 = Logger.logObject.getter(v6);
  v41 = static os_log_type_t.info.getter();
  v38 = &v48;
  v48 = 2;
  v36 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v37 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v7 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)(&v49, v38, &type metadata for UInt32, &type metadata for Int, v36, v37, v7);
  v39 = v49;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v43 = _allocateUninitializedArray<A>(_:)(v40);
  if (os_log_type_enabled(v42, (os_log_type_t)v41))
  {
    v8 = v26;
    v16 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2, &type metadata for UInt8);
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v15 = 0;
    v17 = createStorage<A>(capacity:type:)(0, v14, v14);
    v18 = createStorage<A>(capacity:type:)(v15, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    v22 = &v47;
    v47 = v16;
    v23 = &v46;
    v46 = v17;
    v20 = &v45;
    v45 = v18;
    v19 = 0;
    serialize(_:at:)(0, &v47);
    serialize(_:at:)(v19, v22);
    v44 = v43;
    v21 = &v13;
    __chkstk_darwin(&v13);
    v9 = v23;
    v10 = &v13 - 6;
    v24 = &v13 - 6;
    v10[2] = (uint64_t)v22;
    v10[3] = (uint64_t)v9;
    v10[4] = v11;
    v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    v12 = lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)(partial apply for closure #1 in osLogInternal(_:log:type:), v24, v25, v12);
    if (v8)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl((void *)&_mh_execute_header, v42, (os_log_type_t)v41, "Started SystemXPC listener", v16, v39);
      v13 = 0;
      destroyStorage<A>(_:count:)(v17, 0);
      destroyStorage<A>(_:count:)(v18, v13);
      UnsafeMutablePointer.deallocate()();
      swift_bridgeObjectRelease(v43);
    }
  }
  else
  {
    swift_bridgeObjectRelease(v43);
  }

  (*(void (**)(char *, uint64_t))(v34 + 8))(v32, v35);
}

Swift::Void __swiftcall ViewHierarchyAgent.startRemoteListener()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t *v20;
  uint64_t *v21;
  _BYTE **v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t *v38;
  uint32_t v39;
  uint64_t v40;
  int v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE *v47;
  uint64_t v48;
  uint32_t v49;
  uint64_t v50;

  v50 = 0;
  v26 = 0;
  v40 = 0;
  v35 = type metadata accessor for Logger(0);
  v34 = *(_QWORD *)(v35 - 8);
  v27 = (*(_QWORD *)(v34 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v35);
  v32 = (char *)&v13 - v27;
  v50 = v0;
  v1 = *(_QWORD **)(v0 + 56);
  v31 = v1;
  v29 = *(_QWORD *)(v0 + 64);
  swift_retain(v1);
  v28 = *v1;
  swift_retain(v30);
  dispatch thunk of XPCListenerConnection.setPeerConnectionHandler(_:)(partial apply for closure #1 in ViewHierarchyAgent.startRemoteListener(), v30, v28, v29);
  v2 = v30;
  swift_release(v30);
  swift_release(v31);
  v33 = *(_QWORD *)(v2 + 56);
  v3 = swift_retain(v33);
  dispatch thunk of XPCConnection.activate()(v3);
  v4 = v32;
  swift_release(v33);
  v5 = logger.unsafeMutableAddressor();
  v6 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 16))(v4, v5, v35);
  v42 = Logger.logObject.getter(v6);
  v41 = static os_log_type_t.info.getter();
  v38 = &v48;
  v48 = 2;
  v36 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v37 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v7 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)(&v49, v38, &type metadata for UInt32, &type metadata for Int, v36, v37, v7);
  v39 = v49;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v43 = _allocateUninitializedArray<A>(_:)(v40);
  if (os_log_type_enabled(v42, (os_log_type_t)v41))
  {
    v8 = v26;
    v16 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2, &type metadata for UInt8);
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v15 = 0;
    v17 = createStorage<A>(capacity:type:)(0, v14, v14);
    v18 = createStorage<A>(capacity:type:)(v15, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    v22 = &v47;
    v47 = v16;
    v23 = &v46;
    v46 = v17;
    v20 = &v45;
    v45 = v18;
    v19 = 0;
    serialize(_:at:)(0, &v47);
    serialize(_:at:)(v19, v22);
    v44 = v43;
    v21 = &v13;
    __chkstk_darwin(&v13);
    v9 = v23;
    v10 = &v13 - 6;
    v24 = &v13 - 6;
    v10[2] = (uint64_t)v22;
    v10[3] = (uint64_t)v9;
    v10[4] = v11;
    v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    v12 = lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)(closure #1 in osLogInternal(_:log:type:)partial apply, v24, v25, v12);
    if (v8)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl((void *)&_mh_execute_header, v42, (os_log_type_t)v41, "Started RemoteXPC listener", v16, v39);
      v13 = 0;
      destroyStorage<A>(_:count:)(v17, 0);
      destroyStorage<A>(_:count:)(v18, v13);
      UnsafeMutablePointer.deallocate()();
      swift_bridgeObjectRelease(v43);
    }
  }
  else
  {
    swift_bridgeObjectRelease(v43);
  }

  (*(void (**)(char *, uint64_t))(v34 + 8))(v32, v35);
}

Swift::Void __swiftcall ViewHierarchyAgent.startTargetHubListener()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t *v20;
  uint64_t *v21;
  _BYTE **v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t *v38;
  uint32_t v39;
  uint64_t v40;
  int v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE *v47;
  uint64_t v48;
  uint32_t v49;
  uint64_t v50;

  v50 = 0;
  v26 = 0;
  v40 = 0;
  v35 = type metadata accessor for Logger(0);
  v34 = *(_QWORD *)(v35 - 8);
  v27 = (*(_QWORD *)(v34 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v35);
  v32 = (char *)&v13 - v27;
  v50 = v0;
  v1 = *(_QWORD **)(v0 + 72);
  v31 = v1;
  v29 = *(_QWORD *)(v0 + 80);
  swift_retain(v1);
  v28 = *v1;
  swift_retain(v30);
  dispatch thunk of XPCListenerConnection.setPeerConnectionHandler(_:)(partial apply for closure #1 in ViewHierarchyAgent.startTargetHubListener(), v30, v28, v29);
  v2 = v30;
  swift_release(v30);
  swift_release(v31);
  v33 = *(_QWORD *)(v2 + 72);
  v3 = swift_retain(v33);
  dispatch thunk of XPCConnection.activate()(v3);
  v4 = v32;
  swift_release(v33);
  v5 = logger.unsafeMutableAddressor();
  v6 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 16))(v4, v5, v35);
  v42 = Logger.logObject.getter(v6);
  v41 = static os_log_type_t.info.getter();
  v38 = &v48;
  v48 = 2;
  v36 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v37 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v7 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)(&v49, v38, &type metadata for UInt32, &type metadata for Int, v36, v37, v7);
  v39 = v49;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v43 = _allocateUninitializedArray<A>(_:)(v40);
  if (os_log_type_enabled(v42, (os_log_type_t)v41))
  {
    v8 = v26;
    v16 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2, &type metadata for UInt8);
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v15 = 0;
    v17 = createStorage<A>(capacity:type:)(0, v14, v14);
    v18 = createStorage<A>(capacity:type:)(v15, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    v22 = &v47;
    v47 = v16;
    v23 = &v46;
    v46 = v17;
    v20 = &v45;
    v45 = v18;
    v19 = 0;
    serialize(_:at:)(0, &v47);
    serialize(_:at:)(v19, v22);
    v44 = v43;
    v21 = &v13;
    __chkstk_darwin(&v13);
    v9 = v23;
    v10 = &v13 - 6;
    v24 = &v13 - 6;
    v10[2] = (uint64_t)v22;
    v10[3] = (uint64_t)v9;
    v10[4] = v11;
    v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    v12 = lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)(closure #1 in osLogInternal(_:log:type:)partial apply, v24, v25, v12);
    if (v8)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl((void *)&_mh_execute_header, v42, (os_log_type_t)v41, "Started Targethub listener", v16, v39);
      v13 = 0;
      destroyStorage<A>(_:count:)(v17, 0);
      destroyStorage<A>(_:count:)(v18, v13);
      UnsafeMutablePointer.deallocate()();
      swift_bridgeObjectRelease(v43);
    }
  }
  else
  {
    swift_bridgeObjectRelease(v43);
  }

  (*(void (**)(char *, uint64_t))(v34 + 8))(v32, v35);
}

uint64_t type metadata accessor for ViewHierarchyAgent()
{
  return objc_opt_self(_TtC18ViewHierarchyAgent18ViewHierarchyAgent);
}

unint64_t type metadata accessor for OS_dispatch_queue()
{
  uint64_t v0;
  unint64_t ObjCClassMetadata;
  uint64_t v3;

  v3 = lazy cache variable for type metadata for OS_dispatch_queue;
  if (!lazy cache variable for type metadata for OS_dispatch_queue)
  {
    v0 = objc_opt_self(OS_dispatch_queue);
    ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
    return ObjCClassMetadata;
  }
  return v3;
}

_QWORD *closure #1 in ViewHierarchyAgent.startSystemListener()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v9[2];
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;

  v14 = a1;
  v13 = a2;
  v21 = 0;
  v20 = 0;
  v18 = 0;
  v19 = 0;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCPeerConnection, XPCError>);
  v15 = (*(_QWORD *)(*(_QWORD *)(v16 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v17 = (_QWORD *)((char *)v9 - v15);
  v21 = (_QWORD *)__chkstk_darwin(v14);
  v20 = v2;
  outlined init with copy of Result<XPCPeerConnection, XPCError>(v21, (_QWORD *)((char *)v9 - v15));
  if (swift_getEnumCaseMultiPayload(v17) == 1)
    return outlined destroy of Result<XPCPeerConnection, XPCError>(v17);
  v4 = (_QWORD *)*v17;
  v12 = v4;
  v10 = v17[1];
  v18 = v4;
  v19 = v10;
  v9[1] = *v4;
  swift_retain(v13);
  swift_retain(v4);
  v5 = (_QWORD *)swift_allocObject(&unk_100019148, 40, 7);
  v6 = v10;
  v11 = v5;
  v5[2] = v13;
  v5[3] = v4;
  v5[4] = v6;
  dispatch thunk of XPCPeerConnection.setEventHandler(_:)(partial apply for closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener());
  v7 = v12;
  swift_release(v11);
  v8 = swift_retain(v7);
  dispatch thunk of XPCConnection.activate()(v8);
  swift_release(v12);
  return (_QWORD *)swift_release(v12);
}

_QWORD *partial apply for closure #1 in ViewHierarchyAgent.startSystemListener()(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in ViewHierarchyAgent.startSystemListener()(a1, v1);
}

uint64_t closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
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
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD v41[2];
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE **v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, char *, uint64_t);
  unint64_t v52;
  unint64_t v53;
  uint64_t *v54;
  uint32_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  NSObject *v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char *v79;
  unint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t (*v93)(uint64_t, uint64_t, uint64_t);
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _BYTE *v97;
  uint64_t v98;
  uint32_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  char *v105;

  v89 = a1;
  v86 = a2;
  v87 = a3;
  v88 = a4;
  v103 = 0;
  v102 = 0;
  v100 = 0;
  v101 = 0;
  v105 = 0;
  v69 = 0;
  v104 = 0;
  v74 = 0;
  v70 = type metadata accessor for Logger(0);
  v71 = *(_QWORD *)(v70 - 8);
  v72 = (*(_QWORD *)(v71 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = __chkstk_darwin(0);
  v73 = (char *)v41 - v72;
  v75 = type metadata accessor for XPCError(v4);
  v76 = *(_QWORD *)(v75 - 8);
  v77 = *(_QWORD *)(v76 + 64);
  v78 = (v77 + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = __chkstk_darwin(v74);
  v79 = (char *)v41 - v78;
  v80 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = __chkstk_darwin(v5);
  v81 = (char *)v41 - v80;
  v105 = (char *)v41 - v80;
  v82 = type metadata accessor for XPCDictionary(v7);
  v83 = *(_QWORD *)(v82 - 8);
  v84 = (*(_QWORD *)(v83 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v82);
  v85 = (char *)v41 - v84;
  v104 = (char *)v41 - v84;
  v91 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCDictionary, XPCError>);
  v90 = (*(_QWORD *)(*(_QWORD *)(v91 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = __chkstk_darwin(v89);
  v92 = (char *)v41 - v90;
  v103 = v8;
  v102 = v9;
  v100 = v10;
  v101 = v11;
  outlined init with copy of Result<XPCDictionary, XPCError>(v8, (uint64_t)v41 - v90);
  if (swift_getEnumCaseMultiPayload(v92) == 1)
  {
    v13 = v73;
    v51 = *(void (**)(char *, char *, uint64_t))(v76 + 32);
    v51(v81, v92, v75);
    v105 = v81;
    v14 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v13, v14, v70);
    (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v79, v81, v75);
    v15 = *(unsigned __int8 *)(v76 + 80);
    v50 = (v15 + 16) & ~v15;
    v58 = 7;
    v59 = swift_allocObject(&unk_100019170, v50 + v77, v15 | 7);
    v16 = ((uint64_t (*)(uint64_t, char *, uint64_t))v51)(v59 + v50, v79, v75);
    v67 = Logger.logObject.getter(v16);
    v68 = static os_log_type_t.default.getter();
    v54 = &v98;
    v98 = 12;
    v52 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v53 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v17 = lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)(&v99, v54, &type metadata for UInt32, &type metadata for Int, v52, v53, v17);
    v55 = v99;
    v56 = 17;
    v18 = swift_allocObject(&unk_100019198, 17, v58);
    v19 = v56;
    v20 = v58;
    v61 = v18;
    *(_BYTE *)(v18 + 16) = 32;
    v21 = swift_allocObject(&unk_1000191C0, v19, v20);
    v22 = v58;
    v62 = v21;
    *(_BYTE *)(v21 + 16) = 8;
    v57 = 32;
    v23 = swift_allocObject(&unk_1000191E8, 32, v22);
    v24 = v57;
    v25 = v58;
    v26 = v23;
    v27 = v59;
    v60 = v26;
    *(_QWORD *)(v26 + 16) = partial apply for implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener();
    *(_QWORD *)(v26 + 24) = v27;
    v28 = swift_allocObject(&unk_100019210, v24, v25);
    v29 = v60;
    v64 = v28;
    *(_QWORD *)(v28 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
    *(_QWORD *)(v28 + 24) = v29;
    v66 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v63 = _allocateUninitializedArray<A>(_:)(3);
    v65 = v30;
    swift_retain(v61);
    v31 = v62;
    v32 = v61;
    v33 = v65;
    *v65 = closure #1 in OSLogArguments.append(_:)partial apply;
    v33[1] = v32;
    swift_retain(v31);
    v34 = v64;
    v35 = v62;
    v36 = v65;
    v65[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v36[3] = v35;
    swift_retain(v34);
    v37 = v63;
    v38 = v64;
    v39 = v65;
    v65[4] = closure #1 in OSLogArguments.append(_:)partial apply;
    v39[5] = v38;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease(v37);
    if (os_log_type_enabled(v67, (os_log_type_t)v68))
    {
      v40 = v69;
      v43 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12, &type metadata for UInt8);
      v42 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v44 = createStorage<A>(capacity:type:)(0, v42, v42);
      v45 = createStorage<A>(capacity:type:)(1, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      v46 = &v97;
      v97 = v43;
      v47 = &v96;
      v96 = v44;
      v48 = &v95;
      v95 = v45;
      serialize(_:at:)(2, &v97);
      serialize(_:at:)(1, v46);
      v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v94 = v61;
      closure #1 in osLogInternal(_:log:type:)(&v93, (uint64_t)v46, (uint64_t)v47, (uint64_t)v48);
      v49 = v40;
      if (v40)
      {
        __break(1u);
      }
      else
      {
        v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v94 = v62;
        closure #1 in osLogInternal(_:log:type:)(&v93, (uint64_t)&v97, (uint64_t)&v96, (uint64_t)&v95);
        v41[0] = 0;
        v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v94 = v64;
        closure #1 in osLogInternal(_:log:type:)(&v93, (uint64_t)&v97, (uint64_t)&v96, (uint64_t)&v95);
        _os_log_impl((void *)&_mh_execute_header, v67, (os_log_type_t)v68, "SystemXPCPeerConnection received an error: %s", v43, v55);
        destroyStorage<A>(_:count:)(v44, 0);
        destroyStorage<A>(_:count:)(v45, 1);
        UnsafeMutablePointer.deallocate()();
        swift_release(v61);
        swift_release(v62);
        swift_release(v64);
      }
    }
    else
    {
      swift_release(v61);
      swift_release(v62);
      swift_release(v64);
    }

    (*(void (**)(char *, uint64_t))(v71 + 8))(v73, v70);
    return (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v81, v75);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v83 + 32))(v85, v92, v82);
    v104 = v85;
    swift_retain(v87);
    ViewHierarchyAgent.handleMessage(_:from:)((uint64_t)v85, v87, v88);
    swift_release(v87);
    return (*(uint64_t (**)(char *, uint64_t))(v83 + 8))(v85, v82);
  }
}

uint64_t ViewHierarchyAgent.handleMessage(_:from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  Swift::String v13;
  uint64_t v14;
  Swift::String v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t result;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  Swift::String *v68;
  uint64_t v69;
  unint64_t v70;
  Swift::String v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  int v76;
  Swift::String v77;
  void (*v78)(char *, uint64_t);
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint8_t *v83;
  uint64_t v84;
  uint64_t v85;
  unsigned int v86;
  uint64_t *v87;
  Swift::String *v88;
  _BYTE **v89;
  uint64_t *v90;
  Swift::String *v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t *v95;
  uint32_t v96;
  int v97;
  NSObject *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint8_t *v105;
  uint64_t v106;
  uint64_t v107;
  _BYTE **v108;
  uint64_t *v109;
  uint64_t *v110;
  uint64_t v111;
  unint64_t v112;
  unint64_t v113;
  uint64_t *v114;
  uint32_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  _QWORD *v125;
  uint64_t v126;
  NSObject *v127;
  int v128;
  uint64_t v129;
  Swift::String v130;
  int v131;
  uint64_t v132;
  _QWORD *v133;
  uint64_t countAndFlagsBits;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  int v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *object;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  const char *v150;
  const char *v151;
  uint64_t v152;
  unint64_t v153;
  char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  unint64_t v158;
  char *v159;
  unint64_t v160;
  char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  unint64_t v165;
  char *v166;
  unint64_t v167;
  char *v168;
  uint64_t v169;
  uint64_t v170;
  unint64_t v171;
  uint64_t v172;
  uint64_t v173;
  char v174[8];
  uint64_t v175;
  uint64_t v176;
  char v177[8];
  uint64_t v178;
  uint64_t (*v179)(uint64_t, uint64_t, uint64_t);
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  _BYTE *v183;
  uint64_t v184;
  uint32_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  _BYTE *v195;
  uint64_t v196;
  uint32_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  char *v204;

  v169 = a1;
  v173 = a2;
  v170 = a3;
  v149 = "Fatal error";
  v150 = "Unexpectedly found nil while unwrapping an Optional value";
  v151 = "ViewHierarchyAgent/ViewHierarchyAgent.swift";
  v204 = 0;
  v203 = 0;
  v201 = 0;
  v202 = 0;
  v200 = 0;
  v198 = 0;
  v199 = 0;
  v152 = 0;
  v190 = 0;
  v191 = 0;
  v178 = 0;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCDictionary?);
  v153 = (*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v4);
  v154 = (char *)&v77 - v153;
  v155 = 0;
  v156 = type metadata accessor for Logger(0);
  v157 = *(_QWORD *)(v156 - 8);
  v158 = (*(_QWORD *)(v157 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = __chkstk_darwin(v155);
  v159 = (char *)&v77 - v158;
  v160 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = __chkstk_darwin(v5);
  v161 = (char *)&v77 - v160;
  v162 = type metadata accessor for XPCDictionary(v7);
  v163 = *(_QWORD *)(v162 - 8);
  v164 = *(_QWORD *)(v163 + 64);
  v165 = (v164 + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = __chkstk_darwin(v162);
  v166 = (char *)&v77 - v165;
  v204 = (char *)&v77 - v165;
  v167 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v8);
  v168 = (char *)&v77 - v167;
  v171 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?)
                                - 8)
                    + 64)
        + 15) & 0xFFFFFFFFFFFFFFF0;
  v10 = __chkstk_darwin(v173);
  v172 = (uint64_t)&v77 - v171;
  v203 = v11;
  v201 = v10;
  v202 = v12;
  v200 = v3;
  swift_retain(v10);
  if (v173)
  {
    v146 = v173;
    v147 = v170;
    v141 = v170;
    v142 = v173;
    v198 = v173;
    v199 = v170;
    v13 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("action", 6uLL, 1);
    object = v13._object;
    v144 = XPCDictionary.subscript.getter(v13._countAndFlagsBits);
    v145 = v14;
    if (v14)
    {
      v139 = v144;
      v140 = v145;
      v136 = v145;
      v135 = v144;
      v190 = v144;
      v191 = v145;
      swift_bridgeObjectRelease(object);
      swift_bridgeObjectRetain(v136);
      v15 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("performRequest", 0xEuLL, 1);
      countAndFlagsBits = v15._countAndFlagsBits;
      v137 = v15._object;
      swift_bridgeObjectRetain(v15._object);
      v188 = v135;
      v189 = v136;
      v138 = static String.== infix(_:_:)(countAndFlagsBits, v137, v135, v136);
      swift_bridgeObjectRelease(v137);
      swift_bridgeObjectRelease(v137);
      if ((v138 & 1) != 0)
      {
        swift_bridgeObjectRelease(v136);
        v16 = type metadata accessor for TaskPriority(0);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v172, 1);
        swift_retain(v148);
        swift_retain(v142);
        (*(void (**)(char *, uint64_t, uint64_t))(v163 + 16))(v168, v169, v162);
        v17 = *(unsigned __int8 *)(v163 + 80);
        v132 = (v17 + 56) & ~v17;
        v18 = (_QWORD *)swift_allocObject(&unk_100018B80, v132 + v164, v17 | 7);
        v19 = v148;
        v20 = v142;
        v21 = v141;
        v22 = v132;
        v23 = v163;
        v24 = v168;
        v25 = v162;
        v133 = v18;
        v18[2] = 0;
        v18[3] = 0;
        v18[4] = v19;
        v18[5] = v20;
        v18[6] = v21;
        (*(void (**)(char *, char *, uint64_t))(v23 + 32))((char *)v18 + v22, v24, v25);
        v26 = _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC(v172, (uint64_t)&async function pointer to partial apply for closure #1 in ViewHierarchyAgent.handleMessage(_:from:), (uint64_t)v133, (uint64_t)&type metadata for () + 8);
        swift_release(v26);
      }
      else
      {
        swift_bridgeObjectRelease(v136);
        swift_bridgeObjectRetain(v136);
        v130 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("finish", 6uLL, 1);
        swift_bridgeObjectRetain(v130._object);
        v186 = v135;
        v187 = v136;
        v131 = static String.== infix(_:_:)(v130._countAndFlagsBits, v130._object, v135, v136);
        swift_bridgeObjectRelease(v130._object);
        swift_bridgeObjectRelease(v130._object);
        if ((v131 & 1) != 0)
        {
          v27 = v152;
          swift_bridgeObjectRelease(v136);
          ViewHierarchyAgent.finish(_:)(v169);
          v129 = v27;
          if (v27)
          {
            v79 = v129;
            v72 = swift_errorRetain(v129);
            v178 = v79;
            XPCDictionary.createReply()(v72);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v163 + 48))(v154, 1, v162) == 1)
            {
              LOBYTE(v74) = 2;
              _assertionFailure(_:_:file:line:flags:)(v149, 11, 2, v150, 57, 2, v151, 43, v74, 172, 0);
              __break(1u);
            }
            (*(void (**)(char *, char *, uint64_t))(v163 + 32))(v166, v154, v162);
            v77 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("error", 5uLL, 1);
            swift_getErrorValue(v79, v177, v174);
            v73 = Error.localizedDescription.getter(v175, v176);
            XPCDictionary.subscript.setter(v73);
            swift_retain(v142);
            (*(void (**)(char *, char *, uint64_t))(v163 + 16))(v168, v166, v162);
            dispatch thunk of XPCConnection.send(message:)(v168);
            v78 = *(void (**)(char *, uint64_t))(v163 + 8);
            v78(v168, v162);
            swift_release(v142);
            v78(v166, v162);
            swift_errorRelease(v79);
            swift_errorRelease(v79);
          }
        }
        else
        {
          v28 = v142;
          swift_bridgeObjectRelease(v136);
          v29 = swift_retain(v28);
          dispatch thunk of XPCConnection.cancel()(v29);
          v30 = v161;
          swift_release(v142);
          v31 = logger.unsafeMutableAddressor();
          (*(void (**)(char *, uint64_t, uint64_t))(v157 + 16))(v30, v31, v156);
          swift_bridgeObjectRetain(v136);
          v117 = 32;
          v118 = 7;
          v32 = swift_allocObject(&unk_100018AB8, 32, 7);
          v33 = v136;
          v119 = v32;
          *(_QWORD *)(v32 + 16) = v135;
          *(_QWORD *)(v32 + 24) = v33;
          v127 = Logger.logObject.getter(v32);
          v128 = static os_log_type_t.error.getter();
          v114 = &v184;
          v184 = 12;
          v112 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          v113 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          v34 = lazy protocol witness table accessor for type Int and conformance Int();
          UnsignedInteger<>.init<A>(_:)(&v185, v114, &type metadata for UInt32, &type metadata for Int, v112, v113, v34);
          v115 = v185;
          v116 = 17;
          v35 = swift_allocObject(&unk_100018AE0, 17, v118);
          v36 = v116;
          v37 = v118;
          v121 = v35;
          *(_BYTE *)(v35 + 16) = 32;
          v38 = swift_allocObject(&unk_100018B08, v36, v37);
          v39 = v117;
          v40 = v118;
          v122 = v38;
          *(_BYTE *)(v38 + 16) = 8;
          v41 = swift_allocObject(&unk_100018B30, v39, v40);
          v42 = v117;
          v43 = v118;
          v44 = v41;
          v45 = v119;
          v120 = v44;
          *(_QWORD *)(v44 + 16) = partial apply for implicit closure #2 in ViewHierarchyAgent.handleMessage(_:from:);
          *(_QWORD *)(v44 + 24) = v45;
          v46 = swift_allocObject(&unk_100018B58, v42, v43);
          v47 = v120;
          v124 = v46;
          *(_QWORD *)(v46 + 16) = _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_0;
          *(_QWORD *)(v46 + 24) = v47;
          v126 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
          v123 = _allocateUninitializedArray<A>(_:)(3);
          v125 = v48;
          swift_retain(v121);
          v49 = v122;
          v50 = v121;
          v51 = v125;
          *v125 = _s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
          v51[1] = v50;
          swift_retain(v49);
          v52 = v124;
          v53 = v122;
          v54 = v125;
          v125[2] = closure #1 in OSLogArguments.append(_:)partial apply;
          v54[3] = v53;
          swift_retain(v52);
          v55 = v123;
          v56 = v124;
          v57 = v125;
          v125[4] = _s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
          v57[5] = v56;
          _finalizeUninitializedArray<A>(_:)();
          swift_bridgeObjectRelease(v55);
          if (os_log_type_enabled(v127, (os_log_type_t)v128))
          {
            v58 = v152;
            v105 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12, &type metadata for UInt8);
            v104 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
            v106 = createStorage<A>(capacity:type:)(0, v104, v104);
            v107 = createStorage<A>(capacity:type:)(1, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
            v108 = &v183;
            v183 = v105;
            v109 = &v182;
            v182 = v106;
            v110 = &v181;
            v181 = v107;
            serialize(_:at:)(2, &v183);
            serialize(_:at:)(1, v108);
            v179 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
            v180 = v121;
            closure #1 in osLogInternal(_:log:type:)(&v179, (uint64_t)v108, (uint64_t)v109, (uint64_t)v110);
            v111 = v58;
            if (v58)
            {
              __break(1u);
            }
            else
            {
              v179 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
              v180 = v122;
              closure #1 in osLogInternal(_:log:type:)(&v179, (uint64_t)&v183, (uint64_t)&v182, (uint64_t)&v181);
              v103 = 0;
              v179 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
              v180 = v124;
              closure #1 in osLogInternal(_:log:type:)(&v179, (uint64_t)&v183, (uint64_t)&v182, (uint64_t)&v181);
              _os_log_impl((void *)&_mh_execute_header, v127, (os_log_type_t)v128, "Failed to handle message with action %s", v105, v115);
              destroyStorage<A>(_:count:)(v106, 0);
              destroyStorage<A>(_:count:)(v107, 1);
              UnsafeMutablePointer.deallocate()();
              swift_release(v121);
              swift_release(v122);
              swift_release(v124);
            }
          }
          else
          {
            swift_release(v121);
            swift_release(v122);
            swift_release(v124);
          }

          (*(void (**)(char *, uint64_t))(v157 + 8))(v161, v156);
        }
      }
      swift_bridgeObjectRelease(v136);
      return swift_release(v142);
    }
    else
    {
      v60 = swift_bridgeObjectRelease(object);
      v61 = XPCDictionary.underlyingConnection.getter(v60);
      v102 = v61;
      if (v61)
      {
        v101 = v102;
        v100 = v102;
        dispatch thunk of XPCConnection.cancel()(v61);
        swift_release(v100);
      }
      v62 = v159;
      v63 = logger.unsafeMutableAddressor();
      v64 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v157 + 16))(v62, v63, v156);
      v98 = Logger.logObject.getter(v64);
      v97 = static os_log_type_t.error.getter();
      v95 = &v196;
      v196 = 2;
      v93 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      v94 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      v65 = lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)(&v197, v95, &type metadata for UInt32, &type metadata for Int, v93, v94, v65);
      v96 = v197;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      v99 = _allocateUninitializedArray<A>(_:)(0);
      if (os_log_type_enabled(v98, (os_log_type_t)v97))
      {
        v66 = v152;
        v83 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2, &type metadata for UInt8);
        v81 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        v82 = 0;
        v84 = createStorage<A>(capacity:type:)(0, v81, v81);
        v85 = createStorage<A>(capacity:type:)(v82, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
        v89 = &v195;
        v195 = v83;
        v90 = &v194;
        v194 = v84;
        v87 = &v193;
        v193 = v85;
        v86 = 0;
        serialize(_:at:)(0, &v195);
        serialize(_:at:)(v86, v89);
        v192 = v99;
        v88 = &v77;
        __chkstk_darwin(&v77);
        v67 = v90;
        v68 = &v77 - 3;
        v91 = &v77 - 3;
        v68[1]._countAndFlagsBits = (uint64_t)v89;
        v68[1]._object = v67;
        v68[2]._countAndFlagsBits = v69;
        v92 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        v70 = lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)(closure #1 in osLogInternal(_:log:type:)partial apply, v91, v92, v70);
        if (v66)
        {
          __break(1u);
        }
        else
        {
          _os_log_impl((void *)&_mh_execute_header, v98, (os_log_type_t)v97, "Failed to handle message without action", v83, v96);
          v80 = 0;
          destroyStorage<A>(_:count:)(v84, 0);
          destroyStorage<A>(_:count:)(v85, v80);
          UnsafeMutablePointer.deallocate()();
          swift_bridgeObjectRelease(v99);
        }
      }
      else
      {
        swift_bridgeObjectRelease(v99);
      }

      (*(void (**)(char *, uint64_t))(v157 + 8))(v159, v156);
      return swift_release(v142);
    }
  }
  else
  {
    v71 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("A message received over an XPC connection should have an underlying connection", 0x4EuLL, 1);
    v75 = 147;
    v76 = 0;
    result = _assertionFailure(_:_:file:line:flags:)(v149, 11, 2, v71._countAndFlagsBits, v71._object, v151, 43);
    __break(1u);
  }
  return result;
}

uint64_t implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener()()
{
  unint64_t v0;
  uint64_t v2;

  v2 = type metadata accessor for XPCError(0);
  v0 = lazy protocol witness table accessor for type XPCError and conformance XPCError();
  return Error.localizedDescription.getter(v2, v0);
}

uint64_t closure #1 in ViewHierarchyAgent.startRemoteListener()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
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
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD v40[3];
  uint64_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE **v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, char *, uint64_t);
  unint64_t v51;
  unint64_t v52;
  uint64_t *v53;
  uint32_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  NSObject *v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  char *v82;
  unint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  char *v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t, uint64_t);
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _BYTE *v96;
  uint64_t v97;
  uint32_t v98;
  uint64_t v99;
  _QWORD *v100;
  char *v101;

  v86 = a1;
  v85 = a2;
  v100 = 0;
  v99 = 0;
  v101 = 0;
  v72 = 0;
  v90 = 0;
  v91 = 0;
  v73 = 0;
  v74 = type metadata accessor for Logger(0);
  v75 = *(_QWORD *)(v74 - 8);
  v76 = (*(_QWORD *)(v75 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = __chkstk_darwin(0);
  v77 = (char *)v40 - v76;
  v78 = type metadata accessor for XPCError(v2);
  v79 = *(_QWORD *)(v78 - 8);
  v80 = *(_QWORD *)(v79 + 64);
  v81 = (v80 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v78);
  v82 = (char *)v40 - v81;
  v83 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)v40 - v81);
  v84 = (char *)v40 - v83;
  v101 = (char *)v40 - v83;
  v88 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCPeerConnection, XPCError>);
  v87 = (*(_QWORD *)(*(_QWORD *)(v88 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = (_QWORD *)__chkstk_darwin(v86);
  v89 = (char *)v40 - v87;
  v100 = v4;
  v99 = v5;
  outlined init with copy of Result<XPCPeerConnection, XPCError>(v4, (_QWORD *)((char *)v40 - v87));
  if (swift_getEnumCaseMultiPayload(v89) == 1)
  {
    v12 = v77;
    v50 = *(void (**)(char *, char *, uint64_t))(v79 + 32);
    v50(v84, v89, v78);
    v101 = v84;
    v13 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v12, v13, v74);
    (*(void (**)(char *, char *, uint64_t))(v79 + 16))(v82, v84, v78);
    v14 = *(unsigned __int8 *)(v79 + 80);
    v49 = (v14 + 16) & ~v14;
    v57 = 7;
    v58 = swift_allocObject(&unk_100018F90, v49 + v80, v14 | 7);
    v15 = ((uint64_t (*)(uint64_t, char *, uint64_t))v50)(v58 + v49, v82, v78);
    v66 = Logger.logObject.getter(v15);
    v67 = static os_log_type_t.debug.getter();
    v53 = &v97;
    v97 = 12;
    v51 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v52 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v16 = lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)(&v98, v53, &type metadata for UInt32, &type metadata for Int, v51, v52, v16);
    v54 = v98;
    v55 = 17;
    v17 = swift_allocObject(&unk_100018FB8, 17, v57);
    v18 = v55;
    v19 = v57;
    v60 = v17;
    *(_BYTE *)(v17 + 16) = 32;
    v20 = swift_allocObject(&unk_100018FE0, v18, v19);
    v21 = v57;
    v61 = v20;
    *(_BYTE *)(v20 + 16) = 8;
    v56 = 32;
    v22 = swift_allocObject(&unk_100019008, 32, v21);
    v23 = v56;
    v24 = v57;
    v25 = v22;
    v26 = v58;
    v59 = v25;
    *(_QWORD *)(v25 + 16) = partial apply for implicit closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener();
    *(_QWORD *)(v25 + 24) = v26;
    v27 = swift_allocObject(&unk_100019030, v23, v24);
    v28 = v59;
    v63 = v27;
    *(_QWORD *)(v27 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
    *(_QWORD *)(v27 + 24) = v28;
    v65 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v62 = _allocateUninitializedArray<A>(_:)(3);
    v64 = v29;
    swift_retain(v60);
    v30 = v61;
    v31 = v60;
    v32 = v64;
    *v64 = closure #1 in OSLogArguments.append(_:)partial apply;
    v32[1] = v31;
    swift_retain(v30);
    v33 = v63;
    v34 = v61;
    v35 = v64;
    v64[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v35[3] = v34;
    swift_retain(v33);
    v36 = v62;
    v37 = v63;
    v38 = v64;
    v64[4] = closure #1 in OSLogArguments.append(_:)partial apply;
    v38[5] = v37;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease(v36);
    if (os_log_type_enabled(v66, (os_log_type_t)v67))
    {
      v39 = v72;
      v42 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12, &type metadata for UInt8);
      v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v43 = createStorage<A>(capacity:type:)(0, v41, v41);
      v44 = createStorage<A>(capacity:type:)(1, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      v45 = &v96;
      v96 = v42;
      v46 = &v95;
      v95 = v43;
      v47 = &v94;
      v94 = v44;
      serialize(_:at:)(2, &v96);
      serialize(_:at:)(1, v45);
      v92 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v93 = v60;
      closure #1 in osLogInternal(_:log:type:)(&v92, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47);
      v48 = v39;
      if (v39)
      {
        __break(1u);
      }
      else
      {
        v92 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v93 = v61;
        closure #1 in osLogInternal(_:log:type:)(&v92, (uint64_t)&v96, (uint64_t)&v95, (uint64_t)&v94);
        v40[1] = 0;
        v92 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v93 = v63;
        closure #1 in osLogInternal(_:log:type:)(&v92, (uint64_t)&v96, (uint64_t)&v95, (uint64_t)&v94);
        _os_log_impl((void *)&_mh_execute_header, v66, (os_log_type_t)v67, "%s", v42, v54);
        destroyStorage<A>(_:count:)(v43, 0);
        destroyStorage<A>(_:count:)(v44, 1);
        UnsafeMutablePointer.deallocate()();
        swift_release(v60);
        swift_release(v61);
        swift_release(v63);
      }
    }
    else
    {
      swift_release(v60);
      swift_release(v61);
      swift_release(v63);
    }

    (*(void (**)(char *, uint64_t))(v75 + 8))(v77, v74);
    return (*(uint64_t (**)(char *, uint64_t))(v79 + 8))(v84, v78);
  }
  else
  {
    v6 = *(_QWORD **)v89;
    v71 = v6;
    v69 = *((_QWORD *)v89 + 1);
    v90 = v6;
    v91 = v69;
    v68 = *v6;
    swift_retain(v85);
    swift_retain(v6);
    v7 = (_QWORD *)swift_allocObject(&unk_100019058, 40, 7);
    v8 = v69;
    v70 = v7;
    v7[2] = v85;
    v7[3] = v6;
    v7[4] = v8;
    dispatch thunk of XPCPeerConnection.setEventHandler(_:)(partial apply for closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener());
    v9 = v71;
    swift_release(v70);
    v10 = swift_retain(v9);
    dispatch thunk of XPCConnection.activate()(v10);
    swift_release(v71);
    return swift_release(v71);
  }
}

uint64_t closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
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
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD v41[2];
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE **v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, char *, uint64_t);
  unint64_t v52;
  unint64_t v53;
  uint64_t *v54;
  uint32_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  NSObject *v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char *v79;
  unint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t (*v93)(uint64_t, uint64_t, uint64_t);
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _BYTE *v97;
  uint64_t v98;
  uint32_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  char *v105;

  v89 = a1;
  v86 = a2;
  v87 = a3;
  v88 = a4;
  v103 = 0;
  v102 = 0;
  v100 = 0;
  v101 = 0;
  v105 = 0;
  v69 = 0;
  v104 = 0;
  v74 = 0;
  v70 = type metadata accessor for Logger(0);
  v71 = *(_QWORD *)(v70 - 8);
  v72 = (*(_QWORD *)(v71 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = __chkstk_darwin(0);
  v73 = (char *)v41 - v72;
  v75 = type metadata accessor for XPCError(v4);
  v76 = *(_QWORD *)(v75 - 8);
  v77 = *(_QWORD *)(v76 + 64);
  v78 = (v77 + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = __chkstk_darwin(v74);
  v79 = (char *)v41 - v78;
  v80 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = __chkstk_darwin(v5);
  v81 = (char *)v41 - v80;
  v105 = (char *)v41 - v80;
  v82 = type metadata accessor for XPCDictionary(v7);
  v83 = *(_QWORD *)(v82 - 8);
  v84 = (*(_QWORD *)(v83 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v82);
  v85 = (char *)v41 - v84;
  v104 = (char *)v41 - v84;
  v91 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCDictionary, XPCError>);
  v90 = (*(_QWORD *)(*(_QWORD *)(v91 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = __chkstk_darwin(v89);
  v92 = (char *)v41 - v90;
  v103 = v8;
  v102 = v9;
  v100 = v10;
  v101 = v11;
  outlined init with copy of Result<XPCDictionary, XPCError>(v8, (uint64_t)v41 - v90);
  if (swift_getEnumCaseMultiPayload(v92) == 1)
  {
    v13 = v73;
    v51 = *(void (**)(char *, char *, uint64_t))(v76 + 32);
    v51(v81, v92, v75);
    v105 = v81;
    v14 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v13, v14, v70);
    (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v79, v81, v75);
    v15 = *(unsigned __int8 *)(v76 + 80);
    v50 = (v15 + 16) & ~v15;
    v58 = 7;
    v59 = swift_allocObject(&unk_100019080, v50 + v77, v15 | 7);
    v16 = ((uint64_t (*)(uint64_t, char *, uint64_t))v51)(v59 + v50, v79, v75);
    v67 = Logger.logObject.getter(v16);
    v68 = static os_log_type_t.default.getter();
    v54 = &v98;
    v98 = 12;
    v52 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v53 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v17 = lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)(&v99, v54, &type metadata for UInt32, &type metadata for Int, v52, v53, v17);
    v55 = v99;
    v56 = 17;
    v18 = swift_allocObject(&unk_1000190A8, 17, v58);
    v19 = v56;
    v20 = v58;
    v61 = v18;
    *(_BYTE *)(v18 + 16) = 32;
    v21 = swift_allocObject(&unk_1000190D0, v19, v20);
    v22 = v58;
    v62 = v21;
    *(_BYTE *)(v21 + 16) = 8;
    v57 = 32;
    v23 = swift_allocObject(&unk_1000190F8, 32, v22);
    v24 = v57;
    v25 = v58;
    v26 = v23;
    v27 = v59;
    v60 = v26;
    *(_QWORD *)(v26 + 16) = partial apply for implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener();
    *(_QWORD *)(v26 + 24) = v27;
    v28 = swift_allocObject(&unk_100019120, v24, v25);
    v29 = v60;
    v64 = v28;
    *(_QWORD *)(v28 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
    *(_QWORD *)(v28 + 24) = v29;
    v66 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v63 = _allocateUninitializedArray<A>(_:)(3);
    v65 = v30;
    swift_retain(v61);
    v31 = v62;
    v32 = v61;
    v33 = v65;
    *v65 = closure #1 in OSLogArguments.append(_:)partial apply;
    v33[1] = v32;
    swift_retain(v31);
    v34 = v64;
    v35 = v62;
    v36 = v65;
    v65[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v36[3] = v35;
    swift_retain(v34);
    v37 = v63;
    v38 = v64;
    v39 = v65;
    v65[4] = closure #1 in OSLogArguments.append(_:)partial apply;
    v39[5] = v38;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease(v37);
    if (os_log_type_enabled(v67, (os_log_type_t)v68))
    {
      v40 = v69;
      v43 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12, &type metadata for UInt8);
      v42 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v44 = createStorage<A>(capacity:type:)(0, v42, v42);
      v45 = createStorage<A>(capacity:type:)(1, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      v46 = &v97;
      v97 = v43;
      v47 = &v96;
      v96 = v44;
      v48 = &v95;
      v95 = v45;
      serialize(_:at:)(2, &v97);
      serialize(_:at:)(1, v46);
      v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v94 = v61;
      closure #1 in osLogInternal(_:log:type:)(&v93, (uint64_t)v46, (uint64_t)v47, (uint64_t)v48);
      v49 = v40;
      if (v40)
      {
        __break(1u);
      }
      else
      {
        v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v94 = v62;
        closure #1 in osLogInternal(_:log:type:)(&v93, (uint64_t)&v97, (uint64_t)&v96, (uint64_t)&v95);
        v41[0] = 0;
        v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v94 = v64;
        closure #1 in osLogInternal(_:log:type:)(&v93, (uint64_t)&v97, (uint64_t)&v96, (uint64_t)&v95);
        _os_log_impl((void *)&_mh_execute_header, v67, (os_log_type_t)v68, "RemoteXPCPeerConnection received an error: %s", v43, v55);
        destroyStorage<A>(_:count:)(v44, 0);
        destroyStorage<A>(_:count:)(v45, 1);
        UnsafeMutablePointer.deallocate()();
        swift_release(v61);
        swift_release(v62);
        swift_release(v64);
      }
    }
    else
    {
      swift_release(v61);
      swift_release(v62);
      swift_release(v64);
    }

    (*(void (**)(char *, uint64_t))(v71 + 8))(v73, v70);
    return (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v81, v75);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v83 + 32))(v85, v92, v82);
    v104 = v85;
    swift_retain(v87);
    ViewHierarchyAgent.handleMessage(_:from:)((uint64_t)v85, v87, v88);
    swift_release(v87);
    return (*(uint64_t (**)(char *, uint64_t))(v83 + 8))(v85, v82);
  }
}

uint64_t implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()()
{
  unint64_t v0;
  uint64_t v2;

  v2 = type metadata accessor for XPCError(0);
  v0 = lazy protocol witness table accessor for type XPCError and conformance XPCError();
  return Error.localizedDescription.getter(v2, v0);
}

uint64_t implicit closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()()
{
  unint64_t v0;
  uint64_t v2;

  v2 = type metadata accessor for XPCError(0);
  v0 = lazy protocol witness table accessor for type XPCError and conformance XPCError();
  return Error.localizedDescription.getter(v2, v0);
}

_QWORD *closure #1 in ViewHierarchyAgent.startTargetHubListener()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
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
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  Swift::String v69;
  uint64_t v70[2];
  uint64_t v71;
  uint64_t v72;
  uint8_t *v73;
  uint64_t v74;
  uint64_t v75;
  _BYTE **v76;
  uint64_t *v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint8_t *v84;
  uint64_t v85;
  uint64_t v86;
  _BYTE **v87;
  uint64_t *v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t *v94;
  uint32_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  _QWORD *v105;
  uint64_t v106;
  NSObject *v107;
  int v108;
  unint64_t v109;
  unint64_t v110;
  uint64_t *v111;
  uint32_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  _QWORD *v122;
  uint64_t v123;
  NSObject *v124;
  int v125;
  int v126;
  int *v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  char *v143;
  unint64_t v144;
  char *v145;
  unint64_t v146;
  _QWORD *v147;
  uint64_t v148;
  uint64_t v149;
  unint64_t v150;
  char *v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  uint64_t v155;
  uint64_t *v156;
  uint64_t (*v157)(uint64_t, uint64_t, uint64_t);
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  _BYTE *v161;
  uint64_t v162;
  uint32_t v163;
  uint64_t v164;
  uint64_t (*v165)(uint64_t, uint64_t, uint64_t);
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  _BYTE *v169;
  uint64_t v170;
  uint64_t v171;
  int v172;
  int v173;
  int v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  _QWORD *v179;
  char *v180;

  v153 = a1;
  v152 = a2;
  v137 = "Fatal error";
  v138 = "ViewHierarchyAgent/ViewHierarchyAgent.swift";
  v180 = 0;
  v179 = 0;
  v178 = 0;
  v176 = 0;
  v177 = 0;
  v175 = 0;
  v139 = 0;
  v173 = 0;
  v140 = type metadata accessor for Logger(0);
  v141 = *(_QWORD *)(v140 - 8);
  v142 = (*(_QWORD *)(v141 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v140);
  v143 = (char *)v70 - v142;
  v144 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)v70 - v142);
  v145 = (char *)v70 - v144;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>?);
  v146 = (*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v3);
  v147 = (uint64_t *)((char *)v70 - v146);
  v148 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>);
  v149 = *(_QWORD *)(v148 - 8);
  v150 = (*(_QWORD *)(v149 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v148);
  v151 = (char *)v70 - v150;
  v180 = (char *)v70 - v150;
  v155 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCPeerConnection, XPCError>);
  v154 = (*(_QWORD *)(*(_QWORD *)(v155 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = (_QWORD *)__chkstk_darwin(v153);
  v156 = (uint64_t *)((char *)v70 - v154);
  v179 = v4;
  v178 = v5;
  outlined init with copy of Result<XPCPeerConnection, XPCError>(v4, (uint64_t *)((char *)v70 - v154));
  if (swift_getEnumCaseMultiPayload(v156) == 1)
    return outlined destroy of Result<XPCPeerConnection, XPCError>(v156);
  v135 = *v156;
  v7 = v156[1];
  v176 = v135;
  v177 = v7;
  swift_retain(v135);
  v8 = type metadata accessor for SystemXPCPeerConnection(0);
  v136 = swift_dynamicCastClass(v135, v8);
  if (v136)
  {
    v134 = v136;
  }
  else
  {
    v133 = 0;
    swift_release(v135);
    v134 = v133;
  }
  v132 = v134;
  if (v134)
  {
    v131 = v132;
    v9 = v139;
    v129 = v132;
    v175 = v132;
    result = dispatch thunk of XPCConnection.withUnsafeUnderlyingConnection<A>(_:)(&v174, closure #1 in closure #1 in ViewHierarchyAgent.startTargetHubListener(), 0, &type metadata for Int32);
    v130 = v9;
    if (v9)
    {
      __break(1u);
    }
    else
    {
      v126 = v174;
      v173 = v174;
      v127 = &v172;
      v172 = v174;
      v128 = (char *)&v171 + 4;
      swift_beginAccess(v152 + 96);
      v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int32 : CheckedContinuation<SystemXPCPeerConnection, Error>]);
      Dictionary.removeValue(forKey:)(v147, v127, v10);
      swift_endAccess(v128);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v149 + 48))(v147, 1, v148) == 1)
      {
        v11 = outlined destroy of CheckedContinuation<SystemXPCPeerConnection, Error>?((uint64_t)v147);
        dispatch thunk of XPCConnection.cancel()(v11);
        v12 = v145;
        v13 = logger.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v141 + 16))(v12, v13, v140);
        v115 = 7;
        v14 = swift_allocObject(&unk_100018D10, 20, 7);
        v116 = v14;
        *(_DWORD *)(v14 + 16) = v126;
        v124 = Logger.logObject.getter(v14);
        v125 = static os_log_type_t.error.getter();
        v111 = &v170;
        v170 = 8;
        v109 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        v110 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        v15 = lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)(&v171, v111, &type metadata for UInt32, &type metadata for Int, v109, v110, v15);
        v112 = v171;
        v113 = 17;
        v16 = swift_allocObject(&unk_100018D38, 17, v115);
        v17 = v113;
        v18 = v115;
        v118 = v16;
        *(_BYTE *)(v16 + 16) = 0;
        v19 = swift_allocObject(&unk_100018D60, v17, v18);
        v20 = v115;
        v119 = v19;
        *(_BYTE *)(v19 + 16) = 4;
        v114 = 32;
        v21 = swift_allocObject(&unk_100018D88, 32, v20);
        v22 = v114;
        v23 = v115;
        v24 = v21;
        v25 = v116;
        v117 = v24;
        *(_QWORD *)(v24 + 16) = partial apply for implicit closure #3 in closure #1 in ViewHierarchyAgent.startTargetHubListener();
        *(_QWORD *)(v24 + 24) = v25;
        v26 = swift_allocObject(&unk_100018DB0, v22, v23);
        v27 = v117;
        v121 = v26;
        *(_QWORD *)(v26 + 16) = partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int32);
        *(_QWORD *)(v26 + 24) = v27;
        v123 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        v120 = _allocateUninitializedArray<A>(_:)(3);
        v122 = v28;
        swift_retain(v118);
        v29 = v119;
        v30 = v118;
        v31 = v122;
        *v122 = closure #1 in OSLogArguments.append(_:)partial apply;
        v31[1] = v30;
        swift_retain(v29);
        v32 = v121;
        v33 = v119;
        v34 = v122;
        v122[2] = closure #1 in OSLogArguments.append(_:)partial apply;
        v34[3] = v33;
        swift_retain(v32);
        v35 = v120;
        v36 = v121;
        v37 = v122;
        v122[4] = partial apply for closure #1 in OSLogArguments.append<A>(_:);
        v37[5] = v36;
        _finalizeUninitializedArray<A>(_:)();
        swift_bridgeObjectRelease(v35);
        if (os_log_type_enabled(v124, (os_log_type_t)v125))
        {
          v68 = v130;
          v73 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(8, &type metadata for UInt8);
          v71 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          v72 = 0;
          v74 = createStorage<A>(capacity:type:)(0, v71, v71);
          v75 = createStorage<A>(capacity:type:)(v72, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
          v76 = &v169;
          v169 = v73;
          v77 = &v168;
          v168 = v74;
          v78 = &v167;
          v167 = v75;
          serialize(_:at:)(0, &v169);
          serialize(_:at:)(1, v76);
          v165 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
          v166 = v118;
          closure #1 in osLogInternal(_:log:type:)(&v165, (uint64_t)v76, (uint64_t)v77, (uint64_t)v78);
          v79 = v68;
          if (v68)
          {
            __break(1u);
          }
          else
          {
            v165 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
            v166 = v119;
            closure #1 in osLogInternal(_:log:type:)(&v165, (uint64_t)&v169, (uint64_t)&v168, (uint64_t)&v167);
            v70[1] = 0;
            v165 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append<A>(_:);
            v166 = v121;
            closure #1 in osLogInternal(_:log:type:)(&v165, (uint64_t)&v169, (uint64_t)&v168, (uint64_t)&v167);
            _os_log_impl((void *)&_mh_execute_header, v124, (os_log_type_t)v125, "Received XPC connection from pid %d which we were not expecting", v73, v112);
            v70[0] = 0;
            destroyStorage<A>(_:count:)(v74, 0);
            destroyStorage<A>(_:count:)(v75, v70[0]);
            UnsafeMutablePointer.deallocate()();
            swift_release(v118);
            swift_release(v119);
            swift_release(v121);
          }
        }
        else
        {
          swift_release(v118);
          swift_release(v119);
          swift_release(v121);
        }

        (*(void (**)(char *, uint64_t))(v141 + 8))(v145, v140);
      }
      else
      {
        (*(void (**)(char *, _QWORD *, uint64_t))(v149 + 32))(v151, v147, v148);
        swift_retain(v152);
        v98 = 7;
        v38 = swift_allocObject(&unk_100018DD8, 28, 7);
        v39 = v126;
        v91 = v38;
        *(_QWORD *)(v38 + 16) = v152;
        *(_DWORD *)(v38 + 24) = v39;
        dispatch thunk of SystemXPCPeerConnection.setEventHandler(_:)(partial apply for closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener());
        v40 = swift_release(v91);
        dispatch thunk of XPCConnection.activate()(v40);
        swift_retain(v129);
        v164 = v129;
        CheckedContinuation.resume(returning:)(&v164, v148);
        v41 = v143;
        v42 = logger.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v141 + 16))(v41, v42, v140);
        v43 = swift_allocObject(&unk_100018E00, 20, v98);
        v99 = v43;
        *(_DWORD *)(v43 + 16) = v126;
        v107 = Logger.logObject.getter(v43);
        v108 = static os_log_type_t.default.getter();
        v94 = &v162;
        v162 = 8;
        v92 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        v93 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        v44 = lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)(&v163, v94, &type metadata for UInt32, &type metadata for Int, v92, v93, v44);
        v95 = v163;
        v96 = 17;
        v45 = swift_allocObject(&unk_100018E28, 17, v98);
        v46 = v96;
        v47 = v98;
        v101 = v45;
        *(_BYTE *)(v45 + 16) = 0;
        v48 = swift_allocObject(&unk_100018E50, v46, v47);
        v49 = v98;
        v102 = v48;
        *(_BYTE *)(v48 + 16) = 4;
        v97 = 32;
        v50 = swift_allocObject(&unk_100018E78, 32, v49);
        v51 = v97;
        v52 = v98;
        v53 = v50;
        v54 = v99;
        v100 = v53;
        *(_QWORD *)(v53 + 16) = partial apply for implicit closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener();
        *(_QWORD *)(v53 + 24) = v54;
        v55 = swift_allocObject(&unk_100018EA0, v51, v52);
        v56 = v100;
        v104 = v55;
        *(_QWORD *)(v55 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int32)partial apply;
        *(_QWORD *)(v55 + 24) = v56;
        v106 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        v103 = _allocateUninitializedArray<A>(_:)(3);
        v105 = v57;
        swift_retain(v101);
        v58 = v102;
        v59 = v101;
        v60 = v105;
        *v105 = closure #1 in OSLogArguments.append(_:)partial apply;
        v60[1] = v59;
        swift_retain(v58);
        v61 = v104;
        v62 = v102;
        v63 = v105;
        v105[2] = closure #1 in OSLogArguments.append(_:)partial apply;
        v63[3] = v62;
        swift_retain(v61);
        v64 = v103;
        v65 = v104;
        v66 = v105;
        v105[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
        v66[5] = v65;
        _finalizeUninitializedArray<A>(_:)();
        swift_bridgeObjectRelease(v64);
        if (os_log_type_enabled(v107, (os_log_type_t)v108))
        {
          v67 = v130;
          v84 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(8, &type metadata for UInt8);
          v82 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          v83 = 0;
          v85 = createStorage<A>(capacity:type:)(0, v82, v82);
          v86 = createStorage<A>(capacity:type:)(v83, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
          v87 = &v161;
          v161 = v84;
          v88 = &v160;
          v160 = v85;
          v89 = &v159;
          v159 = v86;
          serialize(_:at:)(0, &v161);
          serialize(_:at:)(1, v87);
          v157 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
          v158 = v101;
          closure #1 in osLogInternal(_:log:type:)(&v157, (uint64_t)v87, (uint64_t)v88, (uint64_t)v89);
          v90 = v67;
          if (v67)
          {
            __break(1u);
          }
          else
          {
            v157 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
            v158 = v102;
            closure #1 in osLogInternal(_:log:type:)(&v157, (uint64_t)&v161, (uint64_t)&v160, (uint64_t)&v159);
            v81 = 0;
            v157 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
            v158 = v104;
            closure #1 in osLogInternal(_:log:type:)(&v157, (uint64_t)&v161, (uint64_t)&v160, (uint64_t)&v159);
            _os_log_impl((void *)&_mh_execute_header, v107, (os_log_type_t)v108, "Established XPC connection to TargetBub on pid %d", v84, v95);
            v80 = 0;
            destroyStorage<A>(_:count:)(v85, 0);
            destroyStorage<A>(_:count:)(v86, v80);
            UnsafeMutablePointer.deallocate()();
            swift_release(v101);
            swift_release(v102);
            swift_release(v104);
          }
        }
        else
        {
          swift_release(v101);
          swift_release(v102);
          swift_release(v104);
        }

        (*(void (**)(char *, uint64_t))(v141 + 8))(v143, v140);
        (*(void (**)(char *, uint64_t))(v149 + 8))(v151, v148);
      }
      swift_release(v129);
      return (_QWORD *)swift_release(v135);
    }
  }
  else
  {
    v69 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Peer should be a SystemXPCConnection", 0x24uLL, 1);
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)(v137, 11, 2, v69._countAndFlagsBits, v69._object, v138, 43);
    __break(1u);
  }
  return result;
}

uint64_t closure #1 in closure #1 in ViewHierarchyAgent.startTargetHubListener()@<X0>(_xpc_connection_s *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = xpc_connection_get_pid(a1);
  *a2 = result;
  return result;
}

uint64_t closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
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
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD v39[2];
  uint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE **v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  int *v48;
  char *v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t, uint64_t);
  unint64_t v52;
  unint64_t v53;
  uint64_t *v54;
  uint32_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  NSObject *v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  char *v83;
  unint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t, uint64_t);
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  _BYTE *v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  uint64_t v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;

  v78 = a1;
  v76 = a2;
  v77 = a3;
  v100 = 0;
  v99 = 0;
  v98 = 0;
  v97 = 0;
  v69 = 0;
  v74 = 0;
  v70 = type metadata accessor for Logger(0);
  v71 = *(_QWORD *)(v70 - 8);
  v72 = (*(_QWORD *)(v71 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v70);
  v73 = (char *)v39 - v72;
  v86 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCDictionary, XPCError>);
  v75 = (*(_QWORD *)(*(_QWORD *)(v86 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = __chkstk_darwin(v74);
  v87 = (uint64_t)v39 - v75;
  v79 = type metadata accessor for XPCError(v3);
  v80 = *(_QWORD *)(v79 - 8);
  v82 = *(_QWORD *)(v80 + 64);
  v81 = (v82 + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = __chkstk_darwin(v78);
  v83 = (char *)v39 - v81;
  v84 = (v82 + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = __chkstk_darwin(v4);
  v85 = (char *)v39 - v84;
  v100 = (char *)v39 - v84;
  v99 = v5;
  v98 = v6;
  v97 = v7;
  outlined init with copy of Result<XPCDictionary, XPCError>(v5, v8);
  if (swift_getEnumCaseMultiPayload(v87) != 1)
    return outlined destroy of Result<XPCDictionary, XPCError>(v87);
  v51 = *(void (**)(char *, uint64_t, uint64_t))(v80 + 32);
  v51(v85, v87, v79);
  v48 = &v95;
  v95 = v77;
  v49 = (char *)&v94 + 4;
  swift_beginAccess(v76 + 88);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int32 : CaptureController]);
  Dictionary.removeValue(forKey:)(&v96, v48, v10);
  v11 = v73;
  swift_endAccess(v49);
  swift_release(v96);
  v12 = logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v11, v12, v70);
  (*(void (**)(char *, char *, uint64_t))(v80 + 16))(v83, v85, v79);
  v13 = *(unsigned __int8 *)(v80 + 80);
  v50 = (v13 + 16) & ~v13;
  v58 = 7;
  v59 = swift_allocObject(&unk_100018EC8, v50 + v82, v13 | 7);
  v14 = ((uint64_t (*)(uint64_t, char *, uint64_t))v51)(v59 + v50, v83, v79);
  v67 = Logger.logObject.getter(v14);
  v68 = static os_log_type_t.default.getter();
  v54 = &v93;
  v93 = 12;
  v52 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v53 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v15 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)(&v94, v54, &type metadata for UInt32, &type metadata for Int, v52, v53, v15);
  v55 = v94;
  v56 = 17;
  v16 = swift_allocObject(&unk_100018EF0, 17, v58);
  v17 = v56;
  v18 = v58;
  v61 = v16;
  *(_BYTE *)(v16 + 16) = 32;
  v19 = swift_allocObject(&unk_100018F18, v17, v18);
  v20 = v58;
  v62 = v19;
  *(_BYTE *)(v19 + 16) = 8;
  v57 = 32;
  v21 = swift_allocObject(&unk_100018F40, 32, v20);
  v22 = v57;
  v23 = v58;
  v24 = v21;
  v25 = v59;
  v60 = v24;
  *(_QWORD *)(v24 + 16) = partial apply for implicit closure #1 in closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener();
  *(_QWORD *)(v24 + 24) = v25;
  v26 = swift_allocObject(&unk_100018F68, v22, v23);
  v27 = v60;
  v64 = v26;
  *(_QWORD *)(v26 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  *(_QWORD *)(v26 + 24) = v27;
  v66 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v63 = _allocateUninitializedArray<A>(_:)(3);
  v65 = v28;
  swift_retain(v61);
  v29 = v62;
  v30 = v61;
  v31 = v65;
  *v65 = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[1] = v30;
  swift_retain(v29);
  v32 = v64;
  v33 = v62;
  v34 = v65;
  v65[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v34[3] = v33;
  swift_retain(v32);
  v35 = v63;
  v36 = v64;
  v37 = v65;
  v65[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v37[5] = v36;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease(v35);
  if (os_log_type_enabled(v67, (os_log_type_t)v68))
  {
    v38 = v69;
    v41 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12, &type metadata for UInt8);
    v40 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v42 = createStorage<A>(capacity:type:)(0, v40, v40);
    v43 = createStorage<A>(capacity:type:)(1, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    v44 = &v92;
    v92 = v41;
    v45 = &v91;
    v91 = v42;
    v46 = &v90;
    v90 = v43;
    serialize(_:at:)(2, &v92);
    serialize(_:at:)(1, v44);
    v88 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    v89 = v61;
    closure #1 in osLogInternal(_:log:type:)(&v88, (uint64_t)v44, (uint64_t)v45, (uint64_t)v46);
    v47 = v38;
    if (v38)
    {
      __break(1u);
    }
    else
    {
      v88 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v89 = v62;
      closure #1 in osLogInternal(_:log:type:)(&v88, (uint64_t)&v92, (uint64_t)&v91, (uint64_t)&v90);
      v39[0] = 0;
      v88 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v89 = v64;
      closure #1 in osLogInternal(_:log:type:)(&v88, (uint64_t)&v92, (uint64_t)&v91, (uint64_t)&v90);
      _os_log_impl((void *)&_mh_execute_header, v67, (os_log_type_t)v68, "TargetHubXPCPeerConnection received an error: %s", v41, v55);
      destroyStorage<A>(_:count:)(v42, 0);
      destroyStorage<A>(_:count:)(v43, 1);
      UnsafeMutablePointer.deallocate()();
      swift_release(v61);
      swift_release(v62);
      swift_release(v64);
    }
  }
  else
  {
    swift_release(v61);
    swift_release(v62);
    swift_release(v64);
  }

  (*(void (**)(char *, uint64_t))(v71 + 8))(v73, v70);
  return (*(uint64_t (**)(char *, uint64_t))(v80 + 8))(v85, v79);
}

uint64_t implicit closure #1 in closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()()
{
  unint64_t v0;
  uint64_t v2;

  v2 = type metadata accessor for XPCError(0);
  v0 = lazy protocol witness table accessor for type XPCError and conformance XPCError();
  return Error.localizedDescription.getter(v2, v0);
}

uint64_t closure #1 in ViewHierarchyAgent.handleMessage(_:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v14;
  uint64_t v15;

  v7[13] = a7;
  v7[12] = a5;
  v7[7] = v7;
  v7[8] = 0;
  v7[5] = 0;
  v7[6] = 0;
  v7[9] = 0;
  v7[10] = 0;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCDictionary?);
  v7[14] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for XPCDictionary(0);
  v7[15] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v7[16] = v11;
  v14 = *(_QWORD *)(v11 + 64);
  v7[17] = swift_task_alloc((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7[18] = swift_task_alloc((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7[8] = a4;
  v7[5] = a5;
  v7[6] = a6;
  v7[9] = a7;
  v12 = (_QWORD *)swift_task_alloc(dword_10001C5E4);
  *(_QWORD *)(v15 + 152) = v12;
  *v12 = *(_QWORD *)(v15 + 56);
  v12[1] = closure #1 in ViewHierarchyAgent.handleMessage(_:from:);
  return ViewHierarchyAgent.performRequest(connection:message:)(a5, a6, a7);
}

_QWORD *closure #1 in ViewHierarchyAgent.handleMessage(_:from:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 152);
  v2[7] = *(_QWORD *)v1;
  v2 += 7;
  v7 = v2 - 5;
  v8 = v2;
  v2[13] = v0;
  swift_task_dealloc(v3);
  if (v0)
    return (_QWORD *)swift_task_switch(closure #1 in ViewHierarchyAgent.handleMessage(_:from:), 0);
  v5 = v7[15];
  v6 = v7[12];
  swift_task_dealloc(v7[16]);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(_QWORD *(**)(_QWORD *__return_ptr))(*v8 + 8))(v8);
}

uint64_t closure #1 in ViewHierarchyAgent.handleMessage(_:from:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v15 = v0[20];
  v16 = v0[16];
  v18 = v0[15];
  v17 = v0[14];
  v0[7] = v0;
  v1 = swift_errorRetain();
  v0[10] = v15;
  XPCDictionary.createReply()(v1);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v17, 1, v18) == 1)
  {
    v4 = 2;
    return _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "ViewHierarchyAgent/ViewHierarchyAgent.swift", 43, v4, 162, 0);
  }
  else
  {
    v11 = v14[20];
    v6 = v14[18];
    v8 = v14[17];
    v5 = v14[16];
    v9 = v14[15];
    v7 = v14[12];
    (*(void (**)(void))(v5 + 32))();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("error", 5uLL, 1);
    swift_getErrorValue(v11, v14 + 11, v14 + 2);
    v3 = Error.localizedDescription.getter(v14[3], v14[4]);
    XPCDictionary.subscript.setter(v3);
    swift_retain(v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v6, v8, v9);
    dispatch thunk of XPCConnection.send(message:)(v6);
    v10 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v10(v6, v9);
    swift_release(v7);
    v10(v8, v9);
    swift_errorRelease(v11);
    swift_errorRelease(v11);
    v12 = v14[17];
    v13 = v14[14];
    swift_task_dealloc(v14[18]);
    swift_task_dealloc(v12);
    swift_task_dealloc(v13);
    return (*(uint64_t (**)(void))(v14[7] + 8))();
  }
}

uint64_t ViewHierarchyAgent.performRequest(connection:message:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)(v4 + 152) = v3;
  *(_QWORD *)(v4 + 144) = a3;
  *(_QWORD *)(v4 + 136) = a1;
  *(_QWORD *)(v4 + 96) = v4;
  *(_QWORD *)(v4 + 64) = 0;
  *(_QWORD *)(v4 + 72) = 0;
  *(_QWORD *)(v4 + 104) = 0;
  *(_QWORD *)(v4 + 112) = 0;
  *(_DWORD *)(v4 + 344) = 0;
  *(_QWORD *)(v4 + 80) = 0;
  *(_QWORD *)(v4 + 88) = 0;
  *(_QWORD *)(v4 + 120) = 0;
  *(_QWORD *)(v4 + 128) = 0;
  *(_DWORD *)(v4 + 360) = 0;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCDictionary?);
  *(_QWORD *)(v4 + 160) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for XPCDictionary(0);
  *(_QWORD *)(v4 + 168) = v6;
  v7 = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v4 + 176) = v7;
  v11 = *(_QWORD *)(v7 + 64);
  *(_QWORD *)(v4 + 184) = swift_task_alloc((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v4 + 192) = swift_task_alloc((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for URL(0);
  *(_QWORD *)(v4 + 200) = v8;
  v9 = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v4 + 208) = v9;
  v12 = *(_QWORD *)(v9 + 64);
  *(_QWORD *)(v4 + 216) = v12;
  *(_QWORD *)(v4 + 224) = swift_task_alloc((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v4 + 232) = swift_task_alloc((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v4 + 240) = swift_task_alloc((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v4 + 248) = swift_task_alloc((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?)
                              - 8)
                  + 64);
  *(_QWORD *)(v4 + 256) = swift_task_alloc((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v4 + 264) = swift_task_alloc((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v4 + 272) = swift_task_alloc((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v4 + 64) = a1;
  *(_QWORD *)(v4 + 72) = a2;
  *(_QWORD *)(v4 + 104) = a3;
  *(_QWORD *)(v4 + 112) = v3;
  return swift_task_switch(ViewHierarchyAgent.performRequest(connection:message:), 0);
}

uint64_t ViewHierarchyAgent.performRequest(connection:message:)()
{
  uint64_t v0;
  Swift::String v1;
  unint64_t v2;
  Swift::String v3;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v7;
  _BYTE *v8;
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
  int v20;

  *(_QWORD *)(v0 + 96) = v0;
  v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("pid", 3uLL, 1);
  v2 = lazy protocol witness table accessor for type Int32 and conformance Int32();
  XPCDictionary.subscript.getter((_QWORD *)(v0 + 348), v1._countAndFlagsBits, v1._object, &type metadata for Int32, v2);
  v20 = *(_DWORD *)(v0 + 348);
  if ((*(_BYTE *)(v0 + 352) & 1) != 0)
  {
    swift_bridgeObjectRelease(v1._object);
  }
  else
  {
    *(_DWORD *)(v19 + 344) = v20;
    swift_bridgeObjectRelease(v1._object);
    v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("request", 7uLL, 1);
    v18 = XPCDictionary.subscript.getter(v3._countAndFlagsBits);
    *(_QWORD *)(v19 + 280) = v18;
    *(_QWORD *)(v19 + 288) = v4;
    if (v4)
    {
      *(_QWORD *)(v19 + 80) = v18;
      *(_QWORD *)(v19 + 88) = v4;
      swift_bridgeObjectRelease(v3._object);
      v5 = (_QWORD *)swift_task_alloc(dword_10001C5FC);
      *(_QWORD *)(v19 + 296) = v5;
      *v5 = *(_QWORD *)(v19 + 96);
      v5[1] = ViewHierarchyAgent.performRequest(connection:message:);
      return ViewHierarchyAgent.captureController(for:)(v20);
    }
    swift_bridgeObjectRelease(v3._object);
  }
  v7 = lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
  swift_allocError(&type metadata for ViewHierarchyAgentError, v7, 0, 0);
  *v8 = 0;
  swift_willThrow();
  v9 = *(_QWORD *)(v19 + 264);
  v10 = *(_QWORD *)(v19 + 256);
  v11 = *(_QWORD *)(v19 + 248);
  v12 = *(_QWORD *)(v19 + 240);
  v13 = *(_QWORD *)(v19 + 232);
  v14 = *(_QWORD *)(v19 + 224);
  v15 = *(_QWORD *)(v19 + 192);
  v16 = *(_QWORD *)(v19 + 184);
  v17 = *(_QWORD *)(v19 + 160);
  swift_task_dealloc(*(_QWORD *)(v19 + 272));
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  return (*(uint64_t (**)(void))(*(_QWORD *)(v19 + 96) + 8))();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  _BYTE *v8;
  id v9;
  _QWORD *v10;
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
  void *v23;
  const void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const void *v33;
  void *v34;
  Swift::Int32 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(void);
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v1 = v0[38];
  v2 = v0[17];
  v43 = v2;
  v0[12] = v0;
  v0[15] = v1;
  swift_retain(v2);
  v3 = type metadata accessor for SystemXPCConnection(0);
  v44 = swift_dynamicCastClass(v43, v3);
  if (!v44)
  {
    swift_release(*(_QWORD *)(v42 + 136));
    v6 = *(_QWORD *)(v42 + 312);
    v38 = *(_QWORD *)(v42 + 248);
    v40 = *(_QWORD *)(v42 + 240);
    v36 = *(_QWORD *)(v42 + 208);
    v37 = *(_QWORD *)(v42 + 200);
    CaptureController.createTemporaryFile()(v38);
    type metadata accessor for NSFileHandle();
    v39 = *(void (**)(void))(v36 + 16);
    ((void (*)(uint64_t, uint64_t, uint64_t))v39)(v40, v38, v37);
    v41 = @nonobjc NSFileHandle.__allocating_init(forWritingTo:)(v40);
    if (!v6)
    {
      v25 = *(void **)(v42 + 272);
      v24 = *(const void **)(v42 + 264);
      v28 = *(_QWORD *)(v42 + 248);
      v26 = *(_QWORD *)(v42 + 208);
      v27 = *(_QWORD *)(v42 + 200);
      *(_QWORD *)(v42 + 128) = v41;
      v39();
      (*(void (**)(const void *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v24, 0, 1, v27);
      outlined init with take of URL?(v24, v25);
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v28, v27);
LABEL_9:
      v22 = *(_QWORD *)(v42 + 288);
      swift_bridgeObjectRetain(v22);
      v23 = *(void **)(v42 + 128);
      *(_QWORD *)(v42 + 320) = v23;
      v9 = v23;
      v10 = (_QWORD *)swift_task_alloc(dword_10001C49C);
      *(_QWORD *)(v42 + 328) = v10;
      *v10 = *(_QWORD *)(v42 + 96);
      v10[1] = ViewHierarchyAgent.performRequest(connection:message:);
      return CaptureController.performRequest(_:using:)(*(_QWORD *)(v42 + 280), v22, (uint64_t)v23);
    }
    v20 = *(_QWORD *)(v42 + 304);
    v21 = *(_QWORD *)(v42 + 288);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v42 + 208) + 8))(*(_QWORD *)(v42 + 248), *(_QWORD *)(v42 + 200));
    swift_release(v20);
    swift_bridgeObjectRelease(v21);
    goto LABEL_12;
  }
  swift_release(v44);
  v4 = *(_QWORD *)(v42 + 312);
  result = XPCDictionary.withUnsafeUnderlyingDictionary<A>(_:)(closure #1 in ViewHierarchyAgent.performRequest(connection:message:));
  if (!v4)
  {
    v35 = *(_DWORD *)(v42 + 356);
    *(_DWORD *)(v42 + 360) = v35;
    if (v35 > 0)
    {
      v34 = *(void **)(v42 + 272);
      v33 = *(const void **)(v42 + 264);
      v31 = *(_QWORD *)(v42 + 208);
      v32 = *(_QWORD *)(v42 + 200);
      type metadata accessor for NSFileHandle();
      *(NSFileHandle *)(v42 + 128) = NSFileHandle.__allocating_init(fileDescriptor:closeOnDealloc:)(v35, 1);
      (*(void (**)(const void *, uint64_t, uint64_t, uint64_t))(v31 + 56))(v33, 1, 1, v32);
      outlined init with take of URL?(v33, v34);
      goto LABEL_9;
    }
    v29 = *(_QWORD *)(v42 + 304);
    v30 = *(_QWORD *)(v42 + 288);
    v7 = lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
    swift_allocError(&type metadata for ViewHierarchyAgentError, v7, 0, 0);
    *v8 = 1;
    swift_willThrow();
    swift_release(v29);
    swift_bridgeObjectRelease(v30);
LABEL_12:
    v11 = *(_QWORD *)(v42 + 264);
    v12 = *(_QWORD *)(v42 + 256);
    v13 = *(_QWORD *)(v42 + 248);
    v14 = *(_QWORD *)(v42 + 240);
    v15 = *(_QWORD *)(v42 + 232);
    v16 = *(_QWORD *)(v42 + 224);
    v17 = *(_QWORD *)(v42 + 192);
    v18 = *(_QWORD *)(v42 + 184);
    v19 = *(_QWORD *)(v42 + 160);
    swift_task_dealloc(*(_QWORD *)(v42 + 272));
    swift_task_dealloc(v11);
    swift_task_dealloc(v12);
    swift_task_dealloc(v13);
    swift_task_dealloc(v14);
    swift_task_dealloc(v15);
    swift_task_dealloc(v16);
    swift_task_dealloc(v17);
    swift_task_dealloc(v18);
    swift_task_dealloc(v19);
    return (*(uint64_t (**)(void))(*(_QWORD *)(v42 + 96) + 8))();
  }
  return result;
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 328);
  *(_QWORD *)(v2 + 96) = *v1;
  v2 += 96;
  v6 = v2 - 80;
  *(_QWORD *)(v2 + 240) = v0;
  swift_task_dealloc(v3);
  if (v0)
    return swift_task_switch(ViewHierarchyAgent.performRequest(connection:message:), 0);
  v5 = *(_QWORD *)(v6 + 272);

  swift_bridgeObjectRelease(v5);
  return swift_task_switch(ViewHierarchyAgent.performRequest(connection:message:), 0);
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = v0[36];
  v0[12] = v0;
  swift_bridgeObjectRelease(v1);
  v3 = v0[33];
  v4 = v0[32];
  v5 = v0[31];
  v6 = v0[30];
  v7 = v0[29];
  v8 = v0[28];
  v9 = v0[24];
  v10 = v0[23];
  v11 = v0[20];
  swift_task_dealloc(v0[34]);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0[12] + 8))();
}

{
  uint64_t v0;
  void *v1;
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
  uint64_t v13;
  uint64_t v14;

  v1 = *(void **)(v0 + 320);
  v4 = *(_QWORD *)(v0 + 304);
  v5 = *(_QWORD *)(v0 + 288);
  v3 = *(_QWORD *)(v0 + 272);
  *(_QWORD *)(v0 + 96) = v0;

  swift_bridgeObjectRelease(v5);
  outlined destroy of URL?(v3);

  swift_release(v4);
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(v0 + 264);
  v7 = *(_QWORD *)(v0 + 256);
  v8 = *(_QWORD *)(v0 + 248);
  v9 = *(_QWORD *)(v0 + 240);
  v10 = *(_QWORD *)(v0 + 232);
  v11 = *(_QWORD *)(v0 + 224);
  v12 = *(_QWORD *)(v0 + 192);
  v13 = *(_QWORD *)(v0 + 184);
  v14 = *(_QWORD *)(v0 + 160);
  swift_task_dealloc(*(_QWORD *)(v0 + 272));
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 96) + 8))();
}

uint64_t ViewHierarchyAgent.performRequest(connection:message:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 296);
  v4[12] = *(_QWORD *)v2;
  v4[38] = a1;
  v4[39] = v1;
  swift_task_dealloc(v5);
  if (v1)
    return swift_task_switch(ViewHierarchyAgent.performRequest(connection:message:), 0);
  else
    return swift_task_switch(ViewHierarchyAgent.performRequest(connection:message:), 0);
}

{
  _QWORD *v1;
  uint64_t v3;
  Swift::String v4;
  uint64_t v5;
  uint64_t v6;
  Swift::String v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
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
  void (*v27)(uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const void *aBlock;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v43 = v1[22];
  v45 = v1[21];
  v44 = v1[20];
  v1[12] = v1;
  XPCDictionary.createReply()(a1);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v44, 1, v45) == 1)
    return _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "ViewHierarchyAgent/ViewHierarchyAgent.swift", 43, 2, 213, 0);
  v40 = *(_QWORD *)(v42 + 136);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v42 + 176) + 32))(*(_QWORD *)(v42 + 192), *(_QWORD *)(v42 + 160), *(_QWORD *)(v42 + 168));
  swift_retain(v40);
  v3 = type metadata accessor for RemoteXPCPeerConnection(0);
  v41 = swift_dynamicCastClass(v40, v3);
  if (v41)
  {
    swift_release(v41);
    v39 = *(void **)(v42 + 256);
    v37 = *(_QWORD *)(v42 + 208);
    v38 = *(_QWORD *)(v42 + 200);
    outlined init with copy of URL?(*(const void **)(v42 + 272), v39);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v37 + 48))(v39, 1, v38) == 1)
    {
      outlined destroy of URL?(*(_QWORD *)(v42 + 256));
      v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Should have a temporary file!", 0x1DuLL, 1);
      return _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v7._countAndFlagsBits, v7._object, "ViewHierarchyAgent/ViewHierarchyAgent.swift", 43);
    }
    v35 = *(_QWORD *)(v42 + 232);
    v26 = *(_QWORD *)(v42 + 224);
    v24 = *(_QWORD *)(v42 + 216);
    v34 = *(_QWORD *)(v42 + 208);
    v36 = *(_QWORD *)(v42 + 200);
    v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 32);
    ((void (*)(uint64_t, _QWORD))v27)(v35, *(_QWORD *)(v42 + 256));
    v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ft", 2uLL, 1);
    v29 = URL.path.getter();
    v32 = v5;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v26, v35, v36);
    v6 = *(unsigned __int8 *)(v34 + 80);
    v25 = (v6 + 16) & ~v6;
    v28 = swift_allocObject(&unk_100018BA8, v25 + v24, v6 | 7);
    v27(v28 + v25, v26, v36);
    *(_QWORD *)(v42 + 48) = partial apply for closure #2 in ViewHierarchyAgent.performRequest(connection:message:);
    *(_QWORD *)(v42 + 56) = v28;
    *(_QWORD *)(v42 + 16) = _NSConcreteStackBlock;
    *(_DWORD *)(v42 + 24) = 1107296256;
    *(_DWORD *)(v42 + 28) = 0;
    *(_QWORD *)(v42 + 32) = thunk for @escaping @callee_guaranteed (@unowned Int32) -> ();
    *(_QWORD *)(v42 + 40) = &block_descriptor;
    aBlock = _Block_copy((const void *)(v42 + 16));
    swift_release(*(_QWORD *)(v42 + 56));
    v30 = String.utf8CString.getter(v29, v32);
    swift_retain(v30);
    swift_release(v30);
    swift_retain(v30);
    swift_bridgeObjectRelease(v30);
    v33 = xpc_file_transfer_create_with_path(v30 + 32, aBlock);
    swift_unknownObjectRelease(v30);
    _Block_release(aBlock);
    swift_bridgeObjectRelease(v32);
    XPCDictionary.subscript.setter(v33, v4._countAndFlagsBits, v4._object);
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v36);
  }
  else
  {
    swift_release(*(_QWORD *)(v42 + 136));
  }
  v12 = *(_QWORD *)(v42 + 304);
  v14 = *(_QWORD *)(v42 + 272);
  v15 = *(_QWORD *)(v42 + 264);
  v16 = *(_QWORD *)(v42 + 256);
  v17 = *(_QWORD *)(v42 + 248);
  v18 = *(_QWORD *)(v42 + 240);
  v19 = *(_QWORD *)(v42 + 232);
  v20 = *(_QWORD *)(v42 + 224);
  v21 = *(_QWORD *)(v42 + 192);
  v22 = *(_QWORD *)(v42 + 184);
  v8 = *(_QWORD *)(v42 + 176);
  v10 = *(_QWORD *)(v42 + 168);
  v23 = *(_QWORD *)(v42 + 160);
  v9 = *(_QWORD *)(v42 + 136);
  v13 = *(_QWORD *)(v42 + 288);
  swift_retain(v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v22, v21, v10);
  dispatch thunk of XPCConnection.send(message:)(v22);
  v11 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v11(v22, v10);
  swift_release(v9);
  v11(v21, v10);
  outlined destroy of URL?(v14);

  swift_release(v12);
  swift_bridgeObjectRelease(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  return (*(uint64_t (**)(void))(*(_QWORD *)(v42 + 96) + 8))();
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType;
  uint64_t v5;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[5];

  v23[4] = a4;
  v21 = type metadata accessor for TaskPriority(0);
  v22 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v22 + 48))(a1, 1) == 1)
  {
    outlined destroy of TaskPriority?(a1);
    v16 = 0;
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(a1, v21);
    v16 = v15;
  }
  v14 = *(_QWORD *)(a3 + 16);
  v13 = *(_QWORD *)(a3 + 24);
  swift_unknownObjectRetain();
  if (v14)
  {
    ObjectType = swift_getObjectType(v14);
    v9 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v13);
    v10 = v5;
    swift_unknownObjectRelease(v14);
    v11 = v9;
    v12 = v10;
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  v7 = (_QWORD *)swift_allocObject(&unk_100018CE8, 40, 7);
  v7[2] = a4;
  v7[3] = a2;
  v7[4] = a3;
  v8 = 0;
  if (v11 != 0 || v12 != 0)
  {
    v23[0] = 0;
    v23[1] = 0;
    v23[2] = v11;
    v23[3] = v12;
    v8 = v23;
  }
  return swift_task_create(v16 | 0x1C00, v8, a4, &_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTATu, v7);
}

void ViewHierarchyAgent.finish(_:)(uint64_t a1)
{
  uint64_t v1;
  Swift::String v2;
  unint64_t v3;
  unint64_t v4;
  _BYTE *v5;
  Swift::Int32 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = a1;
  v8 = v1;
  v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("pid", 3uLL, 1);
  v3 = lazy protocol witness table accessor for type Int32 and conformance Int32();
  XPCDictionary.subscript.getter(&v7, v2._countAndFlagsBits, v2._object, &type metadata for Int32, v3);
  v6 = v7;
  if ((v7 & 0x100000000) != 0)
  {
    swift_bridgeObjectRelease(v2._object);
    v4 = lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
    swift_allocError(&type metadata for ViewHierarchyAgentError, v4, 0, 0);
    *v5 = 0;
    swift_willThrow();
  }
  else
  {
    swift_bridgeObjectRelease(v2._object);
    ViewHierarchyAgent.finish(_:)(v6);
  }
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #2 in ViewHierarchyAgent.handleMessage(_:from:)()
{
  swift_bridgeObjectRetain();
}

uint64_t ViewHierarchyAgent.captureController(for:)(int a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 128) = v1;
  *(_DWORD *)(v2 + 180) = a1;
  *(_QWORD *)(v2 + 80) = v2;
  *(_DWORD *)(v2 + 168) = 0;
  *(_QWORD *)(v2 + 88) = 0;
  *(_QWORD *)(v2 + 64) = 0;
  *(_QWORD *)(v2 + 72) = 0;
  *(_QWORD *)(v2 + 104) = 0;
  *(_QWORD *)(v2 + 120) = 0;
  *(_DWORD *)(v2 + 168) = a1;
  *(_QWORD *)(v2 + 88) = v1;
  return swift_task_switch(ViewHierarchyAgent.captureController(for:), 0);
}

uint64_t ViewHierarchyAgent.captureController(for:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(v0 + 128);
  v6 = *(_DWORD *)(v0 + 180);
  *(_QWORD *)(v0 + 80) = v0;
  swift_beginAccess(v5 + 88);
  v7 = *(_QWORD *)(v5 + 88);
  *(_DWORD *)(v0 + 172) = v6;
  v1 = type metadata accessor for CaptureController(0);
  *(_QWORD *)(v0 + 136) = v1;
  Dictionary.subscript.getter(v0 + 172, v7, &type metadata for Int32, v1, &protocol witness table for Int32);
  v8 = *(_QWORD *)(v0 + 96);
  if (v8)
  {
    *(_QWORD *)(v4 + 120) = v8;
    swift_endAccess(v4 + 16);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v4 + 80) + 8))(v8);
  }
  else
  {
    swift_endAccess(v4 + 16);
    v3 = (_QWORD *)swift_task_alloc(dword_10001C60C);
    *(_QWORD *)(v4 + 144) = v3;
    *v3 = *(_QWORD *)(v4 + 80);
    v3[1] = ViewHierarchyAgent.captureController(for:);
    return ViewHierarchyAgent.establishTargetHubConnection(to:)(*(_DWORD *)(v4 + 180));
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];

  v3 = *(_QWORD *)(v0 + 160);
  v7 = *(_QWORD *)(v0 + 152);
  v6 = *(_QWORD *)(v0 + 128);
  v5 = *(_DWORD *)(v0 + 180);
  *(_QWORD *)(v0 + 80) = v0;
  *(_QWORD *)(v0 + 64) = v7;
  *(_QWORD *)(v0 + 72) = v3;
  v4 = type metadata accessor for SystemXPCRequestExecutor();
  swift_retain(v7);
  v9[3] = v4;
  v9[4] = &protocol witness table for SystemXPCRequestExecutor;
  v9[0] = SystemXPCRequestExecutor.__allocating_init(targetConnection:)(v7, v3);
  v8 = CaptureController.__allocating_init(requestExecutor:)(v9);
  *(_QWORD *)(v0 + 104) = v8;
  swift_retain(v8);
  *(_QWORD *)(v0 + 112) = v8;
  *(_DWORD *)(v0 + 176) = v5;
  swift_beginAccess(v6 + 88);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int32 : CaptureController]);
  Dictionary.subscript.setter(v0 + 112, v0 + 176, v1);
  swift_endAccess(v0 + 40);
  swift_release(v7);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v0 + 80) + 8))(v8);
}

_QWORD *ViewHierarchyAgent.captureController(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v9;

  v5 = *(_QWORD **)v3;
  v6 = *(_QWORD *)(*(_QWORD *)v3 + 144);
  v5[10] = *(_QWORD *)v3;
  v9 = v5 + 10;
  v5[19] = a1;
  v5[20] = a2;
  v7 = swift_task_dealloc(v6);
  if (v2)
    return (*(_QWORD *(**)(_QWORD *__return_ptr, uint64_t))(*v9 + 8))(v9, v7);
  else
    return (_QWORD *)swift_task_switch(ViewHierarchyAgent.captureController(for:), 0);
}

uint64_t closure #1 in ViewHierarchyAgent.performRequest(connection:message:)@<X0>(void *a1@<X0>, unsigned int *a2@<X8>)
{
  Swift::String v2;
  uint64_t result;
  uint64_t v5;
  unsigned int v7;

  v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("fd", 2uLL, 1);
  v5 = String.utf8CString.getter(v2._countAndFlagsBits, v2._object);
  swift_retain(v5);
  swift_release(v5);
  swift_retain(v5);
  swift_bridgeObjectRelease(v5);
  v7 = xpc_dictionary_dup_fd(a1, (const char *)(v5 + 32));
  swift_unknownObjectRelease(v5);
  swift_bridgeObjectRelease(v2._object);
  result = v7;
  *a2 = v7;
  return result;
}

NSFileHandle __swiftcall NSFileHandle.__allocating_init(fileDescriptor:closeOnDealloc:)(Swift::Int32 fileDescriptor, Swift::Bool closeOnDealloc)
{
  id v2;

  v2 = objc_allocWithZone((Class)((uint64_t (*)())swift_getObjCClassFromMetadata)());
  return (NSFileHandle)@nonobjc NSFileHandle.init(fileDescriptor:closeOnDealloc:)(fileDescriptor, closeOnDealloc);
}

id @nonobjc NSFileHandle.__allocating_init(forWritingTo:)(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  unint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v12;
  id ObjCClassFromMetadata;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;

  URL._bridgeToObjectiveC()(__stack_chk_guard);
  v14 = v2;
  ObjCClassFromMetadata = (id)swift_getObjCClassFromMetadata(v1);
  v19 = 0;
  v18 = 0;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AutoreleasingUnsafeMutablePointer<NSError?>);
  v3 = lazy protocol witness table accessor for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>();
  _convertInOutToPointerArgument<A>(_:)(&v17, &v18, v12, v3);
  v16 = objc_msgSend(ObjCClassFromMetadata, "fileHandleForWritingToURL:error:", v14, v17);
  v15 = v18;
  v4 = v18;
  v5 = v19;
  v19 = v15;

  if (v16)
  {

    v6 = type metadata accessor for URL(0);
    (*(void (**)(uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1);
    return v16;
  }
  else
  {
    v10 = v19;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    v8 = type metadata accessor for URL(0);
    (*(void (**)(uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1);
    return (id)v9;
  }
}

uint64_t closure #2 in ViewHierarchyAgent.performRequest(connection:message:)(unsigned int a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  char *v4;
  uint64_t v5;
  NSURL *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
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
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  id v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  int v54;
  uint32_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint8_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _BYTE **v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  unsigned int v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  id v80;
  id v81;
  id v82;
  unsigned int v83;
  uint64_t (*v84)(uint64_t, uint64_t, uint64_t);
  uint64_t v85;
  _BYTE *v86;
  uint64_t v87;
  uint32_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;

  v74 = a1;
  v76 = a2;
  v92 = 0;
  v91 = 0;
  v89 = 0;
  v69 = 0;
  v70 = type metadata accessor for Logger(0);
  v71 = *(_QWORD *)(v70 - 8);
  v72 = (*(_QWORD *)(v71 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = __chkstk_darwin(0);
  v73 = (char *)&v39 - v72;
  v78 = type metadata accessor for URL(v2);
  v77 = *(_QWORD *)(v78 - 8);
  v75 = (*(_QWORD *)(v77 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = __chkstk_darwin(v74);
  v4 = (char *)&v39 - v75;
  v79 = (char *)&v39 - v75;
  v92 = v3;
  v91 = v5;
  v95 = 0;
  v82 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  (*(void (**)(char *, uint64_t, uint64_t))(v77 + 16))(v4, v76, v78);
  URL._bridgeToObjectiveC()(v6);
  v81 = v7;
  (*(void (**)(char *, uint64_t))(v77 + 8))(v79, v78);
  v90 = v95;
  v83 = objc_msgSend(v82, "removeItemAtURL:error:", v81, &v90);
  v80 = v90;
  v8 = v90;
  v9 = v95;
  v95 = v80;

  result = v83;
  if ((v83 & 1) == 0)
  {
    v40 = v95;
    v52 = _convertNSErrorToError(_:)();

    swift_willThrow();
    v12 = v73;
    v59 = 0;
    swift_errorRetain(v52);
    v89 = v52;
    v13 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v12, v13, v70);
    swift_errorRetain(v52);
    v46 = 7;
    v14 = swift_allocObject(&unk_100018C20, 24, 7);
    v15 = v52;
    v47 = v14;
    *(_QWORD *)(v14 + 16) = v52;
    v53 = Logger.logObject.getter(v15);
    v54 = static os_log_type_t.fault.getter();
    v43 = &v87;
    v87 = 12;
    v41 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v42 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v16 = lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)(&v88, v43, &type metadata for UInt32, &type metadata for Int, v41, v42, v16);
    v55 = v88;
    v44 = 17;
    v17 = swift_allocObject(&unk_100018C48, 17, v46);
    v18 = v44;
    v19 = v46;
    v64 = v17;
    *(_BYTE *)(v17 + 16) = 32;
    v20 = swift_allocObject(&unk_100018C70, v18, v19);
    v21 = v46;
    v57 = v20;
    *(_BYTE *)(v20 + 16) = 8;
    v45 = 32;
    v22 = swift_allocObject(&unk_100018C98, 32, v21);
    v23 = v45;
    v24 = v46;
    v25 = v22;
    v26 = v47;
    v48 = v25;
    *(_QWORD *)(v25 + 16) = partial apply for implicit closure #1 in closure #2 in ViewHierarchyAgent.performRequest(connection:message:);
    *(_QWORD *)(v25 + 24) = v26;
    v27 = swift_allocObject(&unk_100018CC0, v23, v24);
    v28 = v48;
    v58 = v27;
    *(_QWORD *)(v27 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
    *(_QWORD *)(v27 + 24) = v28;
    v51 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v49 = _allocateUninitializedArray<A>(_:)(3);
    v50 = v29;
    swift_retain(v64);
    v30 = v57;
    v31 = v64;
    v32 = v50;
    *v50 = closure #1 in OSLogArguments.append(_:)partial apply;
    v32[1] = v31;
    swift_retain(v30);
    v33 = v58;
    v34 = v57;
    v35 = v50;
    v50[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v35[3] = v34;
    swift_retain(v33);
    v36 = v49;
    v37 = v58;
    v38 = v50;
    v50[4] = closure #1 in OSLogArguments.append(_:)partial apply;
    v38[5] = v37;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease(v36);
    if (os_log_type_enabled(v53, (os_log_type_t)v54))
    {
      v11 = v59;
      v61 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12, &type metadata for UInt8);
      v60 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v62 = createStorage<A>(capacity:type:)(0, v60, v60);
      v63 = createStorage<A>(capacity:type:)(1, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      v65 = &v86;
      v86 = v61;
      v66 = &v94;
      v94 = v62;
      v67 = &v93;
      v93 = v63;
      serialize(_:at:)(2, &v86);
      serialize(_:at:)(1, v65);
      v84 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      v85 = v64;
      closure #1 in osLogInternal(_:log:type:)(&v84, (uint64_t)v65, (uint64_t)v66, (uint64_t)v67);
      v68 = v11;
      if (v11)
      {
        __break(1u);
      }
      else
      {
        v84 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v85 = v57;
        closure #1 in osLogInternal(_:log:type:)(&v84, (uint64_t)&v86, (uint64_t)&v94, (uint64_t)&v93);
        v56 = 0;
        v84 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        v85 = v58;
        closure #1 in osLogInternal(_:log:type:)(&v84, (uint64_t)&v86, (uint64_t)&v94, (uint64_t)&v93);
        _os_log_impl((void *)&_mh_execute_header, v53, (os_log_type_t)v54, "Failed to remove temporary file: %s", v61, v55);
        destroyStorage<A>(_:count:)(v62, 0);
        destroyStorage<A>(_:count:)(v63, 1);
        UnsafeMutablePointer.deallocate()();
        swift_release(v64);
        swift_release(v57);
        swift_release(v58);
      }
    }
    else
    {
      swift_release(v64);
      swift_release(v57);
      swift_release(v58);
    }

    (*(void (**)(char *, uint64_t))(v71 + 8))(v73, v70);
    swift_errorRelease(v52);
    return swift_errorRelease(v52);
  }
  return result;
}

uint64_t implicit closure #1 in closure #2 in ViewHierarchyAgent.performRequest(connection:message:)(uint64_t a1)
{
  _QWORD v2[3];
  _BYTE v3[8];

  swift_getErrorValue(a1, v3, v2);
  return Error.localizedDescription.getter(v2[1], v2[2]);
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Int32) -> ()(uint64_t a1, unsigned int a2)
{
  void (*v4)(_QWORD);
  uint64_t v5;

  v4 = *(void (**)(_QWORD))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v4(a2);
  return swift_release(v5);
}

Swift::Void __swiftcall ViewHierarchyAgent.finish(_:)(Swift::Int32 a1)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE v3[28];
  Swift::Int32 v4;
  _QWORD v5[2];
  Swift::Int32 v6;

  v5[1] = 0;
  v6 = a1;
  v4 = a1;
  swift_beginAccess(v1 + 88);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int32 : CaptureController]);
  Dictionary.removeValue(forKey:)(v5, &v4, v2);
  swift_endAccess(v3);
  swift_release(v5[0]);
}

uint64_t ViewHierarchyAgent.establishTargetHubConnection(to:)(int a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 72) = v1;
  *(_DWORD *)(v2 + 128) = a1;
  *(_QWORD *)(v2 + 48) = v2;
  *(_DWORD *)(v2 + 120) = 0;
  *(_QWORD *)(v2 + 56) = 0;
  *(_QWORD *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 40) = 0;
  *(_DWORD *)(v2 + 120) = a1;
  *(_QWORD *)(v2 + 56) = v1;
  return swift_task_switch(ViewHierarchyAgent.establishTargetHubConnection(to:), 0);
}

uint64_t ViewHierarchyAgent.establishTargetHubConnection(to:)()
{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  Swift::String v3;
  uint64_t v4;
  Swift::String v5;
  _QWORD *v6;
  uint64_t v7;
  void *object;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v16 = *(_QWORD *)(v0 + 72);
  v17 = *(_DWORD *)(v0 + 128);
  *(_QWORD *)(v0 + 48) = v0;
  *(_QWORD *)(v0 + 16) = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
  *(_QWORD *)(v0 + 24) = v1;
  v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.dt.ViewHierarchyTargetHub.Notification.", 0x31uLL, 1);
  object = v2._object;
  DefaultStringInterpolation.appendLiteral(_:)(v2);
  swift_bridgeObjectRelease(object);
  *(_DWORD *)(v0 + 124) = v17;
  DefaultStringInterpolation.appendInterpolation<A>(_:)(v0 + 124, &type metadata for Int32, &protocol witness table for Int32);
  v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  v10 = v3._object;
  DefaultStringInterpolation.appendLiteral(_:)(v3);
  swift_bridgeObjectRelease(v10);
  v12 = *(_QWORD *)(v0 + 16);
  v11 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain(v11);
  outlined destroy of DefaultStringInterpolation(v0 + 16);
  v13 = String.init(stringInterpolation:)(v12, v11);
  v15 = v4;
  *(_QWORD *)(v0 + 80) = v4;
  *(_QWORD *)(v0 + 32) = v13;
  *(_QWORD *)(v0 + 40) = v4;
  swift_bridgeObjectRetain(v4);
  v14 = String.utf8CString.getter(v13, v15);
  swift_retain(v14);
  swift_release(v14);
  swift_retain(v14);
  swift_bridgeObjectRelease(v14);
  notify_post((const char *)(v14 + 32));
  swift_unknownObjectRelease(v14);
  swift_bridgeObjectRelease(v15);
  v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("establishTargetHubConnection(to:)", 0x21uLL, 1);
  *(_QWORD *)(v0 + 88) = v5._object;
  swift_retain(v16);
  v19 = swift_task_alloc(32);
  *(_QWORD *)(v0 + 96) = v19;
  *(_QWORD *)(v19 + 16) = v16;
  *(_DWORD *)(v19 + 24) = v17;
  v6 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
  *(_QWORD *)(v18 + 104) = v6;
  v7 = type metadata accessor for SystemXPCPeerConnection(0);
  *v6 = *(_QWORD *)(v18 + 48);
  v6[1] = ViewHierarchyAgent.establishTargetHubConnection(to:);
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v18 + 64, 0, 0, v5._countAndFlagsBits, v5._object, partial apply for closure #1 in ViewHierarchyAgent.establishTargetHubConnection(to:), v19, v7);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 104);
  *(_QWORD *)(v2 + 48) = *v1;
  v2 += 48;
  v7 = (_QWORD *)(v2 - 32);
  *(_QWORD *)(v2 + 64) = v0;
  swift_task_dealloc(v3);
  if (v0)
    return swift_task_switch(ViewHierarchyAgent.establishTargetHubConnection(to:), 0);
  v6 = v7[9];
  v5 = v7[7];
  swift_task_dealloc(v7[10]);
  swift_release(v5);
  swift_bridgeObjectRelease(v6);
  return swift_task_switch(ViewHierarchyAgent.establishTargetHubConnection(to:), 0);
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v3;

  v1 = v0[10];
  v0[6] = v0;
  v3 = v0[8];
  swift_bridgeObjectRelease(v1);
  return (*(uint64_t (**)(uint64_t, void *))(v0[6] + 8))(v3, &protocol witness table for SystemXPCPeerConnection);
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = v0[12];
  v4 = v0[11];
  v5 = v0[10];
  v3 = v0[9];
  v0[6] = v0;
  swift_task_dealloc(v1);
  swift_release(v3);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v5);
  return (*(uint64_t (**)())(v0[6] + 8))();
}

uint64_t closure #1 in ViewHierarchyAgent.establishTargetHubConnection(to:)(uint64_t a1, uint64_t a2, int a3)
{
  return ViewHierarchyAgent.setPendingConnection(_:for:)(a1, a3);
}

uint64_t ViewHierarchyAgent.setPendingConnection(_:for:)(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  void (*v14)(char *, _QWORD);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  int *v25;
  char *v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  unint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  char v44;
  int v45;
  int v46;
  _BYTE v47[24];
  uint64_t v48;
  int v49;
  uint64_t v50;

  v34 = a1;
  v38 = a2;
  v50 = 0;
  v49 = 0;
  v48 = 0;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  v30 = (*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v3);
  v31 = (uint64_t)&v24 - v30;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>);
  v39 = *(_QWORD *)(v41 - 8);
  v32 = (*(_QWORD *)(v39 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v41);
  v33 = (char *)&v24 - v32;
  v35 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = __chkstk_darwin(v34);
  v36 = (char *)&v24 - v35;
  v37 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = __chkstk_darwin(v4);
  v40 = (uint64_t)&v24 - v37;
  v50 = v6;
  v49 = v7;
  v48 = v2;
  swift_beginAccess(v2 + 96);
  v8 = *(_QWORD *)(v2 + 96);
  v46 = v38;
  Dictionary.subscript.getter(&v46, v8, &type metadata for Int32, v41, &protocol witness table for Int32);
  if ((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 48))(v40, 1, v41) == 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v33, v40, v41);
    outlined destroy of CheckedContinuation<SystemXPCPeerConnection, Error>?(v40);
    swift_endAccess(v47);
    v9 = lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
    v10 = swift_allocError(&type metadata for ViewHierarchyAgentError, v9, 0, 0);
    v12 = v11;
    v13 = v41;
    *v12 = 2;
    v43 = v10;
    CheckedContinuation.resume(throwing:)(&v43, v13);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v33, v41);
  }
  else
  {
    outlined destroy of CheckedContinuation<SystemXPCPeerConnection, Error>?(v40);
    swift_endAccess(v47);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v36, v34, v41);
  v14 = *(void (**)(char *, _QWORD))(v39 + 56);
  v27 = 1;
  v14(v36, 0);
  v25 = &v45;
  v45 = v38;
  v26 = &v44;
  swift_beginAccess(v29 + 96);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int32 : CheckedContinuation<SystemXPCPeerConnection, Error>]);
  Dictionary.subscript.setter(v36, v25, v15);
  swift_endAccess(v26);
  v16 = type metadata accessor for TaskPriority(0);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v16 - 8) + 56))(v31, v27);
  swift_retain(v29);
  v17 = swift_allocObject(&unk_100018BF8, 44, 7);
  v18 = v29;
  v19 = v38;
  v20 = v17;
  v21 = v31;
  *(_QWORD *)(v20 + 16) = 0;
  *(_QWORD *)(v20 + 24) = 0;
  *(_QWORD *)(v20 + 32) = v18;
  *(_DWORD *)(v20 + 40) = v19;
  _sScTss5Error_pRs_rlE8detached8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntFZ(v21, (uint64_t)&async function pointer to partial apply for closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:), v20, (uint64_t)&type metadata for () + 8);
  v28 = v22;
  outlined destroy of TaskPriority?(v31);
  return swift_release(v28);
}

uint64_t closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v13;

  *(_DWORD *)(v5 + 120) = a5;
  *(_QWORD *)(v5 + 64) = a4;
  *(_QWORD *)(v5 + 40) = v5;
  *(_QWORD *)(v5 + 48) = 0;
  *(_DWORD *)(v5 + 112) = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>?);
  *(_QWORD *)(v5 + 72) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>);
  *(_QWORD *)(v5 + 80) = v7;
  v8 = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v5 + 88) = v8;
  *(_QWORD *)(v5 + 96) = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v5 + 48) = a4;
  *(_DWORD *)(v5 + 112) = a5;
  v9 = (_QWORD *)swift_task_alloc(async function pointer to static Task<>.sleep(nanoseconds:)[1]);
  *(_QWORD *)(v13 + 104) = v9;
  *v9 = *(_QWORD *)(v13 + 40);
  v9[1] = closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:);
  return static Task<>.sleep(nanoseconds:)(5000000000);
}

_QWORD *closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 104);
  v2[5] = *(_QWORD *)v1;
  v2 += 5;
  v6 = v2 - 3;
  v7 = v2;
  swift_task_dealloc(v3);
  if (!v0)
    return (_QWORD *)swift_task_switch(closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:), 0);
  v5 = v6[7];
  swift_task_dealloc(v6[10]);
  swift_task_dealloc(v5);
  return (*(_QWORD *(**)(_QWORD *__return_ptr))(*v7 + 8))(v7);
}

uint64_t closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:)()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;

  v13 = *(_QWORD *)(v0 + 88);
  v15 = *(_QWORD *)(v0 + 80);
  v14 = *(_QWORD **)(v0 + 72);
  v1 = *(_DWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 64);
  *(_QWORD *)(v0 + 40) = v0;
  *(_DWORD *)(v0 + 116) = v1;
  swift_beginAccess(v2 + 96);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int32 : CheckedContinuation<SystemXPCPeerConnection, Error>]);
  Dictionary.removeValue(forKey:)(v14, v0 + 116, v3);
  swift_endAccess(v0 + 16);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v13 + 48))(v14, 1, v15) == 1)
  {
    outlined destroy of CheckedContinuation<SystemXPCPeerConnection, Error>?(v12[9]);
  }
  else
  {
    v10 = v12[12];
    v9 = v12[11];
    v11 = v12[10];
    (*(void (**)(uint64_t, _QWORD))(v9 + 32))(v10, v12[9]);
    v4 = lazy protocol witness table accessor for type ViewHierarchyAgentError and conformance ViewHierarchyAgentError();
    v5 = swift_allocError(&type metadata for ViewHierarchyAgentError, v4, 0, 0);
    *v6 = 3;
    v12[7] = v5;
    CheckedContinuation.resume(throwing:)(v12 + 7, v11);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
  }
  v8 = v12[9];
  swift_task_dealloc(v12[12]);
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v12[5] + 8))();
}

void _sScTss5Error_pRs_rlE8detached8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntFZ(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  const void *v4;
  uint64_t ObjectType;
  uint64_t v6;
  _QWORD v7[2];
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
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
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[5];

  v28 = a1;
  v25 = a2;
  v26 = a3;
  v27 = a4;
  v33[4] = a4;
  v29 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = (const void *)__chkstk_darwin(v28);
  v30 = (uint64_t)v7 - v29;
  outlined init with copy of TaskPriority?(v4, (char *)v7 - v29);
  v31 = type metadata accessor for TaskPriority(0);
  v32 = *(_QWORD *)(v31 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v32 + 48))(v30, 1) == 1)
  {
    v23 = 0;
    outlined destroy of TaskPriority?(v30);
    v24 = v23;
  }
  else
  {
    v22 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v30, v31);
    v24 = v22;
  }
  v19 = v24 | 0x1000;
  v21 = *(_QWORD *)(v26 + 16);
  v20 = *(_QWORD *)(v26 + 24);
  swift_unknownObjectRetain();
  if (v21)
  {
    v17 = v21;
    v18 = v20;
    v11 = v20;
    v12 = v21;
    ObjectType = swift_getObjectType(v21);
    v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v11);
    v14 = v6;
    swift_unknownObjectRelease(v12);
    v15 = v13;
    v16 = v14;
  }
  else
  {
    v15 = 0;
    v16 = 0;
  }
  v8 = v16;
  v9 = v15;
  v10 = 0;
  if (v15 != 0 || v16 != 0)
  {
    v33[0] = 0;
    v33[1] = 0;
    v33[2] = v9;
    v33[3] = v8;
    v10 = v33;
  }
  v7[1] = swift_task_create(v19, v10, v27, v25, v26);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  Task.init(_:)();
}

void static ViewHierarchyAgent.$main()()
{
  static ViewHierarchyAgent.main()();
}

uint64_t ViewHierarchyAgent.deinit()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 56));
  swift_release(*(_QWORD *)(v0 + 72));
  outlined destroy of [Int32 : CaptureController]((_QWORD *)(v0 + 88));
  outlined destroy of [Int32 : CheckedContinuation<SystemXPCPeerConnection, Error>]((_QWORD *)(v0 + 96));
  return v2;
}

uint64_t ViewHierarchyAgent.__deallocating_deinit()
{
  uint64_t v0;

  v0 = ViewHierarchyAgent.deinit();
  return swift_deallocClassInstance(v0, 104, 7);
}

int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for ViewHierarchyAgent();
  static ViewHierarchyAgent.$main()();
}

uint64_t sub_100013540()
{
  return 0;
}

id @nonobjc NSFileHandle.init(fileDescriptor:closeOnDealloc:)(uint64_t a1, char a2)
{
  void *v2;

  return objc_msgSend(v2, "initWithFileDescriptor:closeOnDealloc:", a1, a2 & 1);
}

uint64_t partial apply for closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

unint64_t lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]()
{
  uint64_t v0;
  unint64_t WitnessTable;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(_:_:_:)]);
    WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v0);
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A]);
    return WitnessTable;
  }
  return v3;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t TypeByMangledNameInContextInMetadataState2;
  uint64_t v4;

  v4 = *a1;
  if (*a1 < 0)
  {
    TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)*a1, -(*a1 >> 32), 0);
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }
  return v4;
}

uint64_t partial apply for closure #1 in ViewHierarchyAgent.startRemoteListener()(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in ViewHierarchyAgent.startRemoteListener()(a1, v1);
}

uint64_t closure #1 in osLogInternal(_:log:type:)partial apply(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

_QWORD *partial apply for closure #1 in ViewHierarchyAgent.startTargetHubListener()(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in ViewHierarchyAgent.startTargetHubListener()(a1, v1);
}

uint64_t sub_100013720()
{
  uint64_t v0;
  uint64_t v2;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 32);
}

uint64_t partial apply for implicit closure #2 in ViewHierarchyAgent.handleMessage(_:from:)()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + 16);
  implicit closure #2 in ViewHierarchyAgent.handleMessage(_:from:)();
  return result;
}

uint64_t specialized static Array._allocateUninitialized(_:)(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v4 = result;
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    if (result > 0)
    {
      v1 = type metadata accessor for OS_dispatch_queue.Attributes(0);
      v2 = static Array._allocateBufferUninitialized(minimumCapacity:)(v4, v1);
      *(_QWORD *)(v2 + 16) = v4;
      v3 = (void *)v2;
    }
    else
    {
      swift_retain(&_swiftEmptyArrayStorage);
      v3 = &_swiftEmptyArrayStorage;
    }
    type metadata accessor for OS_dispatch_queue.Attributes(0);
    return (uint64_t)v3;
  }
  return result;
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTR(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = v2;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTQ0_;
  return v5(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTQ0_()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v3 = *v0;
  v1 = *(_QWORD *)(*v0 + 24);
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 16) + 8))();
}

uint64_t sub_10001391C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17);
}

_BYTE **_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10001394C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17);
}

uint64_t sub_10001397C()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 32);
}

uint64_t _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_0()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1000139C4()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 32);
}

_QWORD *_s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t closure #1 in OSLogArguments.append<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  void (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[3];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[16];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v15 = a1;
  v18 = a6;
  v13[1] = a7;
  v22 = a6;
  v16 = *(_QWORD *)(a6 - 8);
  v13[0] = (*(_QWORD *)(v16 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = __chkstk_darwin(a1);
  v17 = (uint64_t)v13 - v13[0];
  v8(v7);
  v14 = dispatch thunk of static FixedWidthInteger.bitWidth.getter() >> 3;
  v20 = *v15;
  v21 = v20 + v14;
  _ss27_withUnprotectedUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF(v17, partial apply for closure #1 in serialize<A>(_:at:), (uint64_t)v19, v18, (uint64_t)&type metadata for Never, (uint64_t)&type metadata for () + 8, (uint64_t)&protocol witness table for Never, v13[2]);
  v9 = v16;
  v10 = v17;
  v11 = v18;
  *v15 += v14;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
}

uint64_t closure #1 in serialize<A>(_:at:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t _ss27_withUnprotectedUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t (*v17)(void);
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v17 = a2;
  v13 = a5;
  v14 = a8;
  v23 = a4;
  v22 = a5;
  v21 = a6;
  v15 = *(_QWORD *)(a5 - 8);
  v16 = (*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v9 = __chkstk_darwin(a1);
  v18 = (char *)&v12 - v16;
  v20 = v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64);
  result = v17();
  v19 = v8;
  if (v8)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(v14, v18, v13);
  return result;
}

uint64_t sub_100013C30()
{
  char *v0;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v4 = type metadata accessor for XPCDictionary(0);
  v2 = *(_QWORD *)(v4 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v6 = v3 + *(_QWORD *)(v2 + 64);
  swift_unknownObjectRelease(*((_QWORD *)v0 + 2));
  swift_release(*((_QWORD *)v0 + 4));
  swift_release(*((_QWORD *)v0 + 5));
  (*(void (**)(char *, uint64_t))(v2 + 8))(&v0[v3], v4);
  return swift_deallocObject(v5, v6);
}

uint64_t partial apply for closure #1 in ViewHierarchyAgent.handleMessage(_:from:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v2 + 16) = v2;
  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for XPCDictionary(0) - 8) + 80);
  v11 = (v3 + 56) & ~v3;
  v6 = v1[2];
  v7 = v1[3];
  v8 = v1[4];
  v9 = v1[5];
  v10 = v1[6];
  v4 = (_QWORD *)swift_task_alloc(dword_10001C5D4);
  *(_QWORD *)(v2 + 24) = v4;
  *v4 = *(_QWORD *)(v2 + 16);
  v4[1] = partial apply for closure #1 in ViewHierarchyAgent.handleMessage(_:from:);
  return closure #1 in ViewHierarchyAgent.handleMessage(_:from:)(a1, v6, v7, v8, v9, v10, (uint64_t)v1 + v11);
}

uint64_t partial apply for closure #1 in ViewHierarchyAgent.handleMessage(_:from:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v3 = *v0;
  v1 = *(_QWORD *)(*v0 + 24);
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 16) + 8))();
}

unint64_t type metadata accessor for NSFileHandle()
{
  uint64_t v0;
  unint64_t ObjCClassMetadata;
  uint64_t v3;

  v3 = lazy cache variable for type metadata for NSFileHandle;
  if (!lazy cache variable for type metadata for NSFileHandle)
  {
    v0 = objc_opt_self(NSFileHandle);
    ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSFileHandle);
    return ObjCClassMetadata;
  }
  return v3;
}

void *outlined init with take of URL?(const void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a2, a1, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t outlined destroy of URL?(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = type metadata accessor for URL(0);
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

void *outlined init with copy of URL?(const void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t sub_1000140B8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v4;
  unint64_t v5;

  v1 = *(_QWORD *)(type metadata accessor for URL(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v5 = v2 + *(_QWORD *)(v1 + 64);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + v2);
  return swift_deallocObject(v4, v5);
}

uint64_t partial apply for closure #2 in ViewHierarchyAgent.performRequest(connection:message:)(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for URL(0) - 8) + 80);
  return closure #2 in ViewHierarchyAgent.performRequest(connection:message:)(a1, v1 + ((v2 + 16) & ~v2));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain(v5);
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of DefaultStringInterpolation(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

uint64_t partial apply for closure #1 in ViewHierarchyAgent.establishTargetHubConnection(to:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in ViewHierarchyAgent.establishTargetHubConnection(to:)(a1, *(_QWORD *)(v1 + 16), *(_DWORD *)(v1 + 24));
}

uint64_t outlined destroy of CheckedContinuation<SystemXPCPeerConnection, Error>?(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<SystemXPCPeerConnection, Error>);
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

uint64_t sub_100014270()
{
  uint64_t v0;
  uint64_t v2;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v2, 44);
}

uint64_t partial apply for closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = *(_QWORD *)(v1 + 32);
  v8 = *(_DWORD *)(v1 + 40);
  v3 = (_QWORD *)swift_task_alloc(dword_10001C62C);
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = partial apply for closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:);
  return closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:)(a1, v5, v6, v7, v8);
}

uint64_t partial apply for closure #1 in ViewHierarchyAgent.setPendingConnection(_:for:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v3 = *v0;
  v1 = *(_QWORD *)(*v0 + 24);
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 16) + 8))();
}

uint64_t outlined destroy of TaskPriority?(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = type metadata accessor for TaskPriority(0);
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

void *outlined init with copy of TaskPriority?(const void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t sub_100014534()
{
  uint64_t v0;
  uint64_t v2;

  swift_errorRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v2, 24);
}

uint64_t partial apply for implicit closure #1 in closure #2 in ViewHierarchyAgent.performRequest(connection:message:)()
{
  uint64_t v0;

  return implicit closure #1 in closure #2 in ViewHierarchyAgent.performRequest(connection:message:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_100014578()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17);
}

uint64_t sub_1000145A8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17);
}

uint64_t sub_1000145D8()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 32);
}

uint64_t sub_100014620()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 32);
}

unint64_t lazy protocol witness table accessor for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>()
{
  uint64_t v0;
  unint64_t WitnessTable;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>;
  if (!lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for AutoreleasingUnsafeMutablePointer<NSError?>);
    WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for AutoreleasingUnsafeMutablePointer<A>, v0);
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>);
    return WitnessTable;
  }
  return v3;
}

uint64_t sub_1000146D8()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v2, 40);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTA(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int *v5;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *(int **)(v1 + 24);
  v3 = (_QWORD *)swift_task_alloc(dword_10001C72C);
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTATQ0_;
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTu
                                                 + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTu))(a1, v5);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTATQ0_()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v3 = *v0;
  v1 = *(_QWORD *)(*v0 + 24);
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 16) + 8))();
}

_QWORD *outlined init with copy of Result<XPCPeerConnection, XPCError>(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v8;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCPeerConnection, XPCError>);
  if (swift_getEnumCaseMultiPayload(a1) == 1)
  {
    v3 = type metadata accessor for XPCError(0);
    (*(void (**)(_QWORD *, _QWORD *))(*(_QWORD *)(v3 - 8) + 16))(a2, a1);
    swift_storeEnumTagMultiPayload(a2, v8, 1);
  }
  else
  {
    v5 = *a1;
    swift_retain(*a1);
    v2 = a1[1];
    *a2 = v5;
    a2[1] = v2;
    swift_storeEnumTagMultiPayload(a2, v8, 0);
  }
  return a2;
}

_QWORD *outlined destroy of Result<XPCPeerConnection, XPCError>(_QWORD *a1)
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCPeerConnection, XPCError>);
  if (swift_getEnumCaseMultiPayload(a1) == 1)
  {
    v1 = type metadata accessor for XPCError(0);
    (*(void (**)(_QWORD *))(*(_QWORD *)(v1 - 8) + 8))(a1);
  }
  else
  {
    swift_release(*a1);
  }
  return a1;
}

uint64_t sub_100014964()
{
  uint64_t v0;

  return swift_deallocObject(v0, 20);
}

uint64_t partial apply for implicit closure #3 in closure #1 in ViewHierarchyAgent.startTargetHubListener()()
{
  uint64_t v0;

  return implicit closure #3 in closure #1 in ViewHierarchyAgent.startTargetHubListener()(*(unsigned int *)(v0 + 16));
}

uint64_t sub_100014994()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17);
}

uint64_t sub_1000149C4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17);
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int32)@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_100014A28()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 32);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int32)@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int32)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_100014A70()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 32);
}

uint64_t partial apply for closure #1 in OSLogArguments.append<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int32 and conformance Int32();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int32, v4);
}

uint64_t sub_100014B74()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v2, 28);
}

uint64_t partial apply for closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()(uint64_t a1)
{
  uint64_t v1;

  return closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()(a1, *(_QWORD *)(v1 + 16), *(_DWORD *)(v1 + 24));
}

uint64_t sub_100014BBC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 20);
}

uint64_t partial apply for implicit closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()()
{
  uint64_t v0;

  return implicit closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()(*(unsigned int *)(v0 + 16));
}

uint64_t sub_100014BEC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17);
}

uint64_t sub_100014C1C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17);
}

uint64_t sub_100014C4C()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 32);
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int32)partial apply@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int32)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_100014C94()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 32);
}

uint64_t closure #1 in OSLogArguments.append<A>(_:)partial apply(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = lazy protocol witness table accessor for type Int32 and conformance Int32();
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int32, v4);
}

uint64_t outlined destroy of Result<XPCDictionary, XPCError>(uint64_t a1)
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCDictionary, XPCError>);
  if (swift_getEnumCaseMultiPayload(a1) == 1)
    v1 = type metadata accessor for XPCError(0);
  else
    v1 = type metadata accessor for XPCDictionary(0);
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(a1);
  return a1;
}

uint64_t sub_100014DB8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v4;
  unint64_t v5;

  v1 = *(_QWORD *)(type metadata accessor for XPCError(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v5 = v2 + *(_QWORD *)(v1 + 64);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + v2);
  return swift_deallocObject(v4, v5);
}

uint64_t partial apply for implicit closure #1 in closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()()
{
  type metadata accessor for XPCError(0);
  return implicit closure #1 in closure #2 in closure #1 in ViewHierarchyAgent.startTargetHubListener()();
}

uint64_t sub_100014E58()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17);
}

uint64_t sub_100014E88()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17);
}

uint64_t sub_100014EB8()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 32);
}

uint64_t sub_100014F00()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 32);
}

uint64_t partial apply for closure #1 in serialize<A>(_:at:)()
{
  return closure #1 in serialize<A>(_:at:)();
}

uint64_t sub_100014F74()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v4;
  unint64_t v5;

  v1 = *(_QWORD *)(type metadata accessor for XPCError(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v5 = v2 + *(_QWORD *)(v1 + 64);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + v2);
  return swift_deallocObject(v4, v5);
}

uint64_t partial apply for implicit closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()()
{
  type metadata accessor for XPCError(0);
  return implicit closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()();
}

uint64_t sub_100015014()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17);
}

uint64_t sub_100015044()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17);
}

uint64_t sub_100015074()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 32);
}

uint64_t sub_1000150BC()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 32);
}

uint64_t sub_100015104()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 40);
}

uint64_t partial apply for closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()(uint64_t a1)
{
  uint64_t *v1;

  return closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100015158()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v4;
  unint64_t v5;

  v1 = *(_QWORD *)(type metadata accessor for XPCError(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v5 = v2 + *(_QWORD *)(v1 + 64);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + v2);
  return swift_deallocObject(v4, v5);
}

uint64_t partial apply for implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()()
{
  type metadata accessor for XPCError(0);
  return implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startRemoteListener()();
}

uint64_t sub_1000151F8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17);
}

uint64_t sub_100015228()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17);
}

uint64_t sub_100015258()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 32);
}

uint64_t sub_1000152A0()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 32);
}

uint64_t sub_1000152E8()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 40);
}

uint64_t partial apply for closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener()(uint64_t a1)
{
  uint64_t *v1;

  return closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener()(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_10001533C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v4;
  unint64_t v5;

  v1 = *(_QWORD *)(type metadata accessor for XPCError(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v5 = v2 + *(_QWORD *)(v1 + 64);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + v2);
  return swift_deallocObject(v4, v5);
}

uint64_t partial apply for implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener()()
{
  type metadata accessor for XPCError(0);
  return implicit closure #1 in closure #1 in closure #1 in ViewHierarchyAgent.startSystemListener()();
}

uint64_t sub_1000153DC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17);
}

uint64_t sub_10001540C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17);
}

uint64_t sub_10001543C()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 32);
}

uint64_t sub_100015484()
{
  uint64_t v0;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v2, 32);
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes()
{
  uint64_t v0;
  unint64_t WitnessTable;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes)
  {
    v0 = type metadata accessor for OS_dispatch_queue.Attributes(255);
    WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue.Attributes, v0);
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes);
    return WitnessTable;
  }
  return v3;
}

unint64_t lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]()
{
  uint64_t v0;
  unint64_t WitnessTable;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A];
  if (!lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
    WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v0);
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A]);
    return WitnessTable;
  }
  return v3;
}
