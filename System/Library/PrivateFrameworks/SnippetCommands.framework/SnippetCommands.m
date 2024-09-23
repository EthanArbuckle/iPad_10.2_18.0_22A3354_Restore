BOOL OpenPunchoutCommandConverter.supports(sfCommand:)()
{
  objc_opt_self();
  return swift_dynamicCastObjCClass() != 0;
}

id OpenPunchoutCommandConverter.convert(sfCommand:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSURL *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;

  v1 = type metadata accessor for UUID();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81860]), sel_init);
  v8 = OUTLINED_FUNCTION_0();
  if (v8
    && (v8 = (id)outlined bridged method (ob) of @objc SFPunchout.bundleIdentifier.getter(v8, (SEL *)&selRef_name), v9))
  {
    MEMORY[0x2207CDF38](v8);
    v8 = (id)OUTLINED_FUNCTION_2();
  }
  else
  {
    v0 = 0;
  }
  OUTLINED_FUNCTION_1((uint64_t)v8, sel_setPunchOutName_);

  v10 = OUTLINED_FUNCTION_0();
  if (v10
    && (v10 = (id)outlined bridged method (ob) of @objc SFPunchout.bundleIdentifier.getter(v10, (SEL *)&selRef_bundleIdentifier), v11))
  {
    MEMORY[0x2207CDF38](v10);
    v10 = (id)OUTLINED_FUNCTION_2();
  }
  else
  {
    v0 = 0;
  }
  OUTLINED_FUNCTION_1((uint64_t)v10, sel_setBundleId_);

  v12 = OUTLINED_FUNCTION_0();
  if (v12 && (v13 = outlined bridged method (ob) of @objc SFPunchout.urls.getter(v12)) != 0)
  {
    specialized Collection.first.getter(v13, (uint64_t)v6);
    swift_bridgeObjectRelease();
    v14 = type metadata accessor for URL();
    v16 = 0;
    if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v14) != 1)
    {
      URL._bridgeToObjectiveC()(v15);
      v16 = v17;
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v6, v14);
    }
  }
  else
  {
    v18 = type metadata accessor for URL();
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v18);
    v16 = 0;
  }
  objc_msgSend(v7, sel_setPunchOutUri_, v16);

  v19 = v7;
  UUID.init()();
  v20 = UUID.uuidString.getter();
  v22 = v21;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  outlined bridged method (mbnn) of @objc SABaseClientBoundCommand.aceId.setter(v20, v22, v19);

  return v19;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207CE274]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t specialized Collection.first.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = type metadata accessor for URL();
  v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1+ ((*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80)), v5);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a2, v7, 1, v6);
}

id protocol witness for SFCommandConverter.convert(sfCommand:) in conformance OpenPunchoutCommandConverter()
{
  return OpenPunchoutCommandConverter.convert(sfCommand:)();
}

void outlined bridged method (mbnn) of @objc SABaseClientBoundCommand.aceId.setter(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)MEMORY[0x2207CDF38]();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setAceId_, v4);

}

uint64_t outlined bridged method (ob) of @objc SFPunchout.urls.getter(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_urls);

  if (!v2)
    return 0;
  type metadata accessor for URL();
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t outlined bridged method (ob) of @objc SFPunchout.bundleIdentifier.getter(void *a1, SEL *a2)
{
  id v3;
  uint64_t v4;

  v3 = objc_msgSend(a1, *a2);

  if (!v3)
    return 0;
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v4;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

ValueMetadata *type metadata accessor for OpenPunchoutCommandConverter()
{
  return &type metadata for OpenPunchoutCommandConverter;
}

id OUTLINED_FUNCTION_0()
{
  uint64_t v0;
  void *v1;

  return objc_msgSend(v1, (SEL)(v0 + 1059));
}

id OUTLINED_FUNCTION_1(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t (*SFCommandConverter.eraseToAnyConverter()(uint64_t a1, uint64_t a2))(void *a1)
{
  uint64_t v2;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v6, v2, a1);
  AnySFCommandConverter.init<A>(wrapped:)((uint64_t)v6, a1, a2);
  return partial apply for closure #1 in AnySFCommandConverter.init<A>(wrapped:);
}

uint64_t (*AnySFCommandConverter.init<A>(wrapped:)(uint64_t a1, uint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v6 = *(_QWORD *)(a2 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
  v9 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v10 = OUTLINED_FUNCTION_1_0();
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  OUTLINED_FUNCTION_0_0(v10 + v9, (uint64_t)v8);
  OUTLINED_FUNCTION_0_0((uint64_t)v8, a1);
  v11 = OUTLINED_FUNCTION_1_0();
  *(_QWORD *)(v11 + 16) = a2;
  *(_QWORD *)(v11 + 24) = a3;
  OUTLINED_FUNCTION_0_0(v11 + v9, (uint64_t)v8);
  return partial apply for closure #1 in AnySFCommandConverter.init<A>(wrapped:);
}

uint64_t AnySFCommandConverter.convert.getter(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t AnySFCommandConverter.supports.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_retain();
  return a3;
}

uint64_t closure #1 in AnySFCommandConverter.init<A>(wrapped:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);
  id v11;
  _QWORD *v12;

  swift_getAssociatedTypeWitness();
  v8 = swift_dynamicCastUnknownClass();
  if (v8)
  {
    v9 = v8;
    v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 32);
    v11 = a1;
    a2 = v10(v9, a3, a4);

  }
  else
  {
    lazy protocol witness table accessor for type SnippetCommandError and conformance SnippetCommandError();
    swift_allocError();
    *v12 = 0;
    swift_willThrow();
  }
  return a2;
}

uint64_t partial apply for closure #1 in AnySFCommandConverter.init<A>(wrapped:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80);
  return closure #1 in AnySFCommandConverter.init<A>(wrapped:)(a1, v1 + ((v3 + 32) & ~v3), v2, *(_QWORD *)(v1 + 24));
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for closure #2 in AnySFCommandConverter.init<A>(wrapped:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 24) + 24))() & 1;
}

uint64_t dispatch thunk of SFCommandConverter.supports(sfCommand:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of SFCommandConverter.convert(sfCommand:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t initializeBufferWithCopyOfBuffer for AnySFCommandConverter(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AnySFCommandConverter()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for AnySFCommandConverter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for AnySFCommandConverter(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for AnySFCommandConverter(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AnySFCommandConverter(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AnySFCommandConverter(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AnySFCommandConverter()
{
  return &type metadata for AnySFCommandConverter;
}

unint64_t lazy protocol witness table accessor for type SnippetCommandError and conformance SnippetCommandError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SnippetCommandError and conformance SnippetCommandError;
  if (!lazy protocol witness table cache variable for type SnippetCommandError and conformance SnippetCommandError)
  {
    result = MEMORY[0x2207CE280](&protocol conformance descriptor for SnippetCommandError, &type metadata for SnippetCommandError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SnippetCommandError and conformance SnippetCommandError);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_allocObject();
}

uint64_t one-time initialization function for default()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = OUTLINED_FUNCTION_3();
  __swift_allocate_value_buffer(v0, static Log.default);
  v1 = __swift_project_value_buffer(v0, (uint64_t)static Log.default);
  if (one-time initialization token for default != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)static Logger.Category.default);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

{
  uint64_t v0;
  id v1;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.Category.default);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.Category.default);
  if (one-time initialization token for defaultOSLog != -1)
    swift_once();
  v1 = (id)static Logger.Category.defaultOSLog;
  return Logger.init(_:)();
}

uint64_t Logger.Category.default.unsafeMutableAddressor()
{
  return Logger.Category.default.unsafeMutableAddressor(&one-time initialization token for default, (uint64_t)static Logger.Category.default);
}

uint64_t Log.default.unsafeMutableAddressor()
{
  return Logger.Category.default.unsafeMutableAddressor(&one-time initialization token for default, (uint64_t)static Log.default);
}

uint64_t Logger.Category.default.unsafeMutableAddressor(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_3();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Log.default.getter@<X0>(uint64_t a1@<X8>)
{
  return static Log.default.getter(&one-time initialization token for default, (uint64_t)static Log.default, a1);
}

void *Logger.subsystem.unsafeMutableAddressor()
{
  return &static Logger.subsystem;
}

unint64_t static Logger.subsystem.getter()
{
  return 0xD000000000000012;
}

uint64_t one-time initialization function for defaultOSLog()
{
  uint64_t result;

  type metadata accessor for OS_os_log();
  result = OS_os_log.init(subsystem:category:)();
  static Logger.Category.defaultOSLog = result;
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t static Logger.Category.default.getter@<X0>(uint64_t a1@<X8>)
{
  return static Log.default.getter(&one-time initialization token for default, (uint64_t)static Logger.Category.default, a1);
}

uint64_t static Log.default.getter@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = OUTLINED_FUNCTION_3();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

void Logger.logAndCrash(_:file:line:)(uint64_t (*a1)(void))
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;

  v1 = a1();
  v3 = v2;
  swift_bridgeObjectRetain_n();
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    *(_DWORD *)v6 = 136446210;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v1, v3, &v7);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21F909000, v4, v5, "%{public}s", v6, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5();
  }
  swift_bridgeObjectRelease_n();

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t static Logger.generateSignpostID()()
{
  id v0;

  if (one-time initialization token for defaultOSLog != -1)
    swift_once();
  v0 = (id)static Logger.Category.defaultOSLog;
  return OSSignpostID.init(log:)();
}

uint64_t static Logger.begin(_:)()
{
  id v0;

  if (one-time initialization token for defaultOSLog != -1)
    swift_once();
  v0 = (id)static Logger.Category.defaultOSLog;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  OUTLINED_FUNCTION_2_0();
  return OUTLINED_FUNCTION_0_1();
}

uint64_t (*static Logger.begin<A>(_:andWrap:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  void (*v17)(char *, char *, uint64_t);
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v25 = a6;
  v26 = a4;
  v27 = a5;
  v9 = OUTLINED_FUNCTION_1_1();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v13 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v24 - v14;
  if (one-time initialization token for defaultOSLog != -1)
    swift_once();
  v16 = (id)static Logger.Category.defaultOSLog;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();
  v17 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v17(v13, v15, v9);
  v18 = (*(unsigned __int8 *)(v10 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v25;
  v17((char *)(v19 + v18), v13, v9);
  v20 = v19 + ((v18 + v11 + 7) & 0xFFFFFFFFFFFFFFF8);
  *(_QWORD *)v20 = a1;
  *(_QWORD *)(v20 + 8) = a2;
  *(_BYTE *)(v20 + 16) = a3;
  v21 = (_QWORD *)(v19 + ((v18 + v11 + 31) & 0xFFFFFFFFFFFFFFF8));
  v22 = v27;
  *v21 = v26;
  v21[1] = v22;
  swift_retain();
  return partial apply for closure #1 in static Logger.begin<A>(_:andWrap:);
}

uint64_t closure #1 in static Logger.begin<A>(_:andWrap:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t))
{
  static os_signpost_type_t.end.getter();
  if (one-time initialization token for defaultOSLog != -1)
    swift_once();
  os_signpost(_:dso:log:name:signpostID:)();
  return a6(a1);
}

uint64_t static Logger.end(_:_:)()
{
  static os_signpost_type_t.end.getter();
  if (one-time initialization token for defaultOSLog != -1)
    swift_once();
  OUTLINED_FUNCTION_2_0();
  return OUTLINED_FUNCTION_0_1();
}

uint64_t static Logger.event(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = OUTLINED_FUNCTION_1_1();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static os_signpost_type_t.event.getter();
  if (one-time initialization token for defaultOSLog != -1)
    swift_once();
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_21F90C1E8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_1_1();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static Logger.begin<A>(_:andWrap:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = *(_QWORD *)(OUTLINED_FUNCTION_1_1() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = v4 + *(_QWORD *)(v3 + 64);
  return closure #1 in static Logger.begin<A>(_:andWrap:)(a1, v1 + v4, *(_QWORD *)(v1 + ((v5 + 7) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + ((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 8), *(unsigned __int8 *)(v1 + ((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 16), *(uint64_t (**)(uint64_t))(v1 + ((v5 + 31) & 0xFFFFFFFFFFFFFFF8)));
}

void type metadata accessor for Log()
{
  OUTLINED_FUNCTION_4();
}

void type metadata accessor for Logger.Category()
{
  OUTLINED_FUNCTION_4();
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for Logger.Signpost(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Logger.Signpost(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 16) = 0;
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
  *(_BYTE *)(result + 17) = v3;
  return result;
}

void type metadata accessor for Logger.Signpost()
{
  OUTLINED_FUNCTION_4();
}

unint64_t type metadata accessor for OS_os_log()
{
  unint64_t result;

  result = lazy cache variable for type metadata for OS_os_log;
  if (!lazy cache variable for type metadata for OS_os_log)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
  }
  return result;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = _StringObject.sharedUTF8.getter();
    if (!v8)
    {
      result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  Swift::Int v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = String.UTF8View._foreignCount()();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = _StringGuts.copyUTF8(into:)();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  result = _assertionFailure(_:_:file:line:flags:)();
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
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, uint64_t a4)
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
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
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
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    specialized UnsafeMutablePointer.initialize(from:count:)(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *specialized UnsafeMutablePointer.initialize(from:count:)(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
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

uint64_t OUTLINED_FUNCTION_0_1()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return type metadata accessor for Logger();
}

void OUTLINED_FUNCTION_5()
{
  JUMPOUT(0x2207CE2F8);
}

void (*SFCommandExecutor.eraseToAnyExecutor()(uint64_t a1, uint64_t a2))(void *a1)
{
  uint64_t v2;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v6, v2, a1);
  AnySFCommandExecutor.init<A>(wrapped:)((uint64_t)v6, a1, a2);
  return partial apply for closure #1 in AnySFCommandExecutor.init<A>(wrapped:);
}

void (*AnySFCommandExecutor.init<A>(wrapped:)(uint64_t a1, uint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v6 = *(_QWORD *)(a2 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
  v9 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v10 = OUTLINED_FUNCTION_1_0();
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  OUTLINED_FUNCTION_0_0(v10 + v9, (uint64_t)v8);
  OUTLINED_FUNCTION_0_0((uint64_t)v8, a1);
  v11 = OUTLINED_FUNCTION_1_0();
  *(_QWORD *)(v11 + 16) = a2;
  *(_QWORD *)(v11 + 24) = a3;
  OUTLINED_FUNCTION_0_0(v11 + v9, (uint64_t)v8);
  return partial apply for closure #1 in AnySFCommandExecutor.init<A>(wrapped:);
}

uint64_t AnySFCommandExecutor.execute.getter(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t AnySFCommandExecutor.supports.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_retain();
  return a3;
}

void closure #1 in AnySFCommandExecutor.init<A>(wrapped:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  id v10;
  _QWORD *v11;

  swift_getAssociatedTypeWitness();
  v7 = swift_dynamicCastUnknownClass();
  if (v7)
  {
    v8 = v7;
    v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 24);
    v10 = a1;
    v9(v8, a3, a4);

  }
  else
  {
    lazy protocol witness table accessor for type SnippetCommandError and conformance SnippetCommandError();
    swift_allocError();
    *v11 = 0;
    swift_willThrow();
  }
}

void partial apply for closure #1 in AnySFCommandExecutor.init<A>(wrapped:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80);
  closure #1 in AnySFCommandExecutor.init<A>(wrapped:)(a1, v1 + ((v3 + 32) & ~v3), v2, *(_QWORD *)(v1 + 24));
}

uint64_t partial apply for closure #2 in AnySFCommandExecutor.init<A>(wrapped:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 24) + 16))() & 1;
}

uint64_t dispatch thunk of SFCommandExecutor.supports(sfCommand:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of SFCommandExecutor.execute(sfCommand:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

ValueMetadata *type metadata accessor for AnySFCommandExecutor()
{
  return &type metadata for AnySFCommandExecutor;
}

BOOL BeginMapsRoutingExecutor.supports(sfCommand:)()
{
  objc_opt_self();
  return swift_dynamicCastObjCClass() != 0;
}

void BeginMapsRoutingExecutor.execute(sfCommand:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  Class isa;
  unsigned __int8 v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  int v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  int v27;
  os_log_t v28;
  uint64_t v29;
  uint64_t v30;

  v2 = type metadata accessor for Logger();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = BeginMapsRoutingExecutor.buildMapItem(from:)(a1);
  if (v6)
  {
    v7 = v6;
    BeginMapsRoutingExecutor.buildLaunchOptions(sfCommand:)(a1);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v9 = objc_msgSend(v7, sel_openInMapsWithLaunchOptions_, isa);

    if ((v9 & 1) != 0)
    {
      if (one-time initialization token for default != -1)
        swift_once();
      v10 = __swift_project_value_buffer(v2, (uint64_t)static Log.default);
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v10, v2);
      v11 = a1;
      v12 = Logger.logObject.getter();
      v13 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v12, (os_log_type_t)v13))
      {
        v27 = v13;
        v28 = v12;
        v14 = (uint8_t *)swift_slowAlloc();
        v26 = swift_slowAlloc();
        v30 = v26;
        *(_DWORD *)v14 = 136315138;
        if (outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.dictionaryRepresentation.getter(v11))
        {
          v15 = Dictionary.description.getter();
          v25 = v14;
          v16 = v15;
          v18 = v17;
          swift_bridgeObjectRelease();
          v19 = v16;
          v14 = v25;
        }
        else
        {
          v18 = 0xE90000000000003ELL;
          v19 = 0x64696C61766E693CLL;
        }
        v29 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v18, &v30);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21F909000, v28, (os_log_type_t)v27, "Successfully Started Navigation via SFCommand:\n    %s", v14, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_5();
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    else
    {
      lazy protocol witness table accessor for type SnippetCommandError and conformance SnippetCommandError();
      v22 = OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_1_2(v22, v23);

    }
  }
  else
  {
    lazy protocol witness table accessor for type SnippetCommandError and conformance SnippetCommandError();
    v20 = OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_1_2(v20, v21);
  }
}

id BeginMapsRoutingExecutor.buildMapItem(from:)(void *a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v2 = outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.mapsData.getter(a1);
  v4 = v3;
  type metadata accessor for MKMapItem();
  outlined copy of Data?(v2, v4);
  v5 = @nonobjc MKMapItem.init(serializedPlace:)(v2, v4);
  if (v5)
  {
    v6 = v5;
    OUTLINED_FUNCTION_0_2();
  }
  else
  {
    v7 = OUTLINED_FUNCTION_4_0();
    if (v7
      && (v8 = v7,
          objc_msgSend(v7, sel_lat),
          v10 = v9,
          v8,
          (v11 = OUTLINED_FUNCTION_4_0()) != 0))
    {
      v12 = v11;
      objc_msgSend(v11, sel_lng);
      v14 = v13;

      v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFA80]), sel_initWithLatitude_longitude_, v10, v14);
      v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDB0F0]), sel_initWithCLLocation_, v15);
      v6 = v16;
      if (v16)
      {
        v17 = v16;
        v18 = outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.name.getter(a1);
        if (v19)
        {
          v20 = (void *)MEMORY[0x2207CDF38](v18);
          swift_bridgeObjectRelease();
        }
        else
        {
          v20 = 0;
        }
        objc_msgSend(v17, sel_setName_, v20);
        OUTLINED_FUNCTION_0_2();

      }
      else
      {
        OUTLINED_FUNCTION_0_2();
      }

    }
    else
    {
      OUTLINED_FUNCTION_0_2();
      return 0;
    }
  }
  return v6;
}

uint64_t BeginMapsRoutingExecutor.buildLaunchOptions(sfCommand:)(void *a1)
{
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((objc_msgSend(a1, sel_shouldSearchDirectionsAlongCurrentRoute) & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_21F90FB70;
    *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(_QWORD *)(inited + 40) = v3;
    *(_QWORD *)(inited + 72) = MEMORY[0x24BEE1328];
    *(_BYTE *)(inited + 48) = 1;
    *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(_QWORD *)(inited + 88) = v4;
    *(_QWORD *)(inited + 120) = MEMORY[0x24BEE1768];
    *(_QWORD *)(inited + 96) = 0;
  }
  else
  {
    objc_msgSend(a1, sel_directionsMode);
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
    v8 = swift_initStackObject();
    *(_OWORD *)(v8 + 16) = xmmword_21F90FB60;
    *(_QWORD *)(v8 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(_QWORD *)(v8 + 40) = v9;
    *(_QWORD *)(v8 + 72) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v8 + 48) = v5;
    *(_QWORD *)(v8 + 56) = v7;
  }
  return Dictionary.init(dictionaryLiteral:)();
}

id @nonobjc MKMapItem.init(serializedPlace:)(uint64_t a1, unint64_t a2)
{
  Class isa;
  id v5;

  if (a2 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?(a1, a2);
  }
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_mapItemWithSerializedPlaceData_, isa);

  return v5;
}

void protocol witness for SFCommandExecutor.execute(sfCommand:) in conformance BeginMapsRoutingExecutor(void *a1)
{
  BeginMapsRoutingExecutor.execute(sfCommand:)(a1);
}

uint64_t outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.mapsData.getter(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_mapsData);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.name.getter(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_name);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.dictionaryRepresentation.getter(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_dictionaryRepresentation);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

unint64_t type metadata accessor for MKMapItem()
{
  unint64_t result;

  result = lazy cache variable for type metadata for MKMapItem;
  if (!lazy cache variable for type metadata for MKMapItem)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for MKMapItem);
  }
  return result;
}

uint64_t outlined copy of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined copy of Data._Representation(a1, a2);
  return a1;
}

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined consume of Data._Representation(a1, a2);
  return a1;
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

ValueMetadata *type metadata accessor for BeginMapsRoutingExecutor()
{
  return &type metadata for BeginMapsRoutingExecutor;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  unint64_t v0;
  uint64_t v1;

  return outlined consume of Data?(v1, v0);
}

uint64_t OUTLINED_FUNCTION_1_2(uint64_t a1, _QWORD *a2)
{
  *a2 = 2;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_allocError();
}

id OUTLINED_FUNCTION_4_0()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 840));
}

id specialized closure #1 in AnySFCommandConverter.init<A>(wrapped:)(id a1)
{
  id v2;
  _QWORD *v3;

  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    v2 = a1;
    a1 = OpenPunchoutCommandConverter.convert(sfCommand:)();

  }
  else
  {
    lazy protocol witness table accessor for type SnippetCommandError and conformance SnippetCommandError();
    swift_allocError();
    *v3 = 0;
    swift_willThrow();
  }
  return a1;
}

BOOL specialized closure #2 in AnySFCommandConverter.init<A>(wrapped:)()
{
  objc_opt_self();
  return swift_dynamicCastObjCClass() != 0;
}

void specialized closure #1 in AnySFCommandExecutor.init<A>(wrapped:)(void *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD *v5;

  objc_opt_self();
  v2 = swift_dynamicCastObjCClass();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = a1;
    BeginMapsRoutingExecutor.execute(sfCommand:)(v3);

  }
  else
  {
    lazy protocol witness table accessor for type SnippetCommandError and conformance SnippetCommandError();
    swift_allocError();
    *v5 = 0;
    swift_willThrow();
  }
}

BOOL specialized closure #2 in AnySFCommandExecutor.init<A>(wrapped:)()
{
  objc_opt_self();
  return swift_dynamicCastObjCClass() != 0;
}

uint64_t SnippetCommandExecutor.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t SnippetCommandExecutor.init()()
{
  uint64_t v0;

  return v0;
}

double one-time initialization function for converters(uint64_t a1)
{
  return one-time initialization function for converters(a1, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnySFCommandConverter>, (uint64_t)partial apply for specialized closure #1 in AnySFCommandConverter.init<A>(wrapped:), (uint64_t)partial apply for specialized closure #2 in AnySFCommandConverter.init<A>(wrapped:), &static SnippetCommandExecutor.converters);
}

uint64_t *SnippetCommandExecutor.converters.unsafeMutableAddressor()
{
  if (one-time initialization token for converters != -1)
    swift_once();
  return &static SnippetCommandExecutor.converters;
}

uint64_t static SnippetCommandExecutor.converters.getter()
{
  return static SnippetCommandExecutor.converters.getter(&one-time initialization token for converters);
}

double one-time initialization function for executors(uint64_t a1)
{
  return one-time initialization function for converters(a1, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnySFCommandExecutor>, (uint64_t)partial apply for specialized closure #1 in AnySFCommandExecutor.init<A>(wrapped:), (uint64_t)partial apply for specialized closure #2 in AnySFCommandExecutor.init<A>(wrapped:), &static SnippetCommandExecutor.executors);
}

double one-time initialization function for converters(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v8;
  double result;

  __swift_instantiateConcreteTypeFromMangledName(a2);
  v8 = swift_allocObject();
  *(_QWORD *)&result = 1;
  *(_OWORD *)(v8 + 16) = xmmword_21F90FB60;
  *(_QWORD *)(v8 + 32) = a3;
  *(_QWORD *)(v8 + 40) = 0;
  *(_QWORD *)(v8 + 48) = a4;
  *(_QWORD *)(v8 + 56) = 0;
  *a5 = v8;
  return result;
}

uint64_t *SnippetCommandExecutor.executors.unsafeMutableAddressor()
{
  if (one-time initialization token for executors != -1)
    swift_once();
  return &static SnippetCommandExecutor.executors;
}

uint64_t static SnippetCommandExecutor.executors.getter()
{
  return static SnippetCommandExecutor.converters.getter(&one-time initialization token for executors);
}

uint64_t static SnippetCommandExecutor.converters.getter(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t SnippetCommandExecutor.execute(sfCommand:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t *i;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;

  if (one-time initialization token for executors != -1)
    swift_once();
  v3 = static SnippetCommandExecutor.executors;
  v4 = *(_QWORD *)(static SnippetCommandExecutor.executors + 16);
  if (!v4)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 96))(a1);
  swift_bridgeObjectRetain_n();
  for (i = (uint64_t *)(v3 + 56); ; i += 4)
  {
    v7 = (uint64_t (*)(uint64_t))*(i - 1);
    v6 = *i;
    v9 = *(i - 3);
    v8 = *(i - 2);
    swift_retain();
    swift_retain();
    if ((v7(a1) & 1) != 0)
      break;
    swift_release();
    swift_release();
    if (!--v4)
    {
      OUTLINED_FUNCTION_36();
      return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 96))(a1);
    }
  }
  OUTLINED_FUNCTION_36();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t), uint64_t))(*(_QWORD *)v1 + 112))(a1, v9, v8, v7, v6);
  swift_release();
  return swift_release();
}

id SnippetCommandExecutor.convert(sfCommand:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(void *);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;

  v5 = OUTLINED_FUNCTION_3();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for converters != -1)
    swift_once();
  v9 = static SnippetCommandExecutor.converters;
  v10 = *(_QWORD *)(static SnippetCommandExecutor.converters + 16);
  v28 = v8;
  v29 = v6;
  if (v10)
  {
    v30 = v2;
    v27 = v5;
    v11 = a2;
    swift_bridgeObjectRetain_n();
    v12 = (uint64_t *)(v9 + 56);
    while (1)
    {
      v14 = (uint64_t (*)(void *))*(v12 - 1);
      v13 = *v12;
      v15 = *(v12 - 3);
      v16 = *(v12 - 2);
      swift_retain();
      swift_retain();
      if ((v14(a1) & 1) != 0)
        break;
      swift_release();
      swift_release();
      v12 += 4;
      if (!--v10)
      {
        OUTLINED_FUNCTION_36();
        a2 = v11;
        v5 = v27;
        v8 = v28;
        v6 = v29;
        goto LABEL_8;
      }
    }
    OUTLINED_FUNCTION_36();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t (*)(void *), uint64_t))(*(_QWORD *)v30 + 104))(a1, v15, v16, v14, v13);
    swift_release();
    return (id)swift_release();
  }
  else
  {
LABEL_8:
    if (one-time initialization token for default != -1)
      swift_once();
    v17 = __swift_project_value_buffer(v5, (uint64_t)static Log.default);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v17, v5);
    v30 = a1;
    v18 = v8;
    Logger.logObject.getter();
    v19 = OUTLINED_FUNCTION_26();
    if (OUTLINED_FUNCTION_9(v19))
    {
      v20 = (uint8_t *)OUTLINED_FUNCTION_2_1();
      v31 = OUTLINED_FUNCTION_2_1();
      *(_DWORD *)v20 = 136315138;
      if (outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.dictionaryRepresentation.getter(v30))
      {
        v21 = Dictionary.description.getter();
        v23 = v22;
        swift_bridgeObjectRelease();
      }
      else
      {
        v23 = 0xE90000000000003ELL;
        v21 = 0x64696C61766E693CLL;
      }
      v24 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v23, &v31);
      OUTLINED_FUNCTION_43(v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_46();
      _os_log_impl(&dword_21F909000, v18, v19, "Unable to convert command. Received unsupported SFCommand:\n    %s", v20, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
    }

    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_23();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v25 = v30;
    *(_QWORD *)a2 = v30;
    *(_BYTE *)(a2 + 8) = 1;
    return v25;
  }
}

void SnippetCommandExecutor.convert(sfCommand:with:)(void *a1@<X0>, uint64_t (*a2)(uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  void *v4;
  void *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  id v37;
  os_log_type_t v38;
  _DWORD *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  os_log_type_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  id v52;
  void *v53;
  id v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  os_log_type_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t (*v64)(_QWORD);
  uint64_t v65;
  char *v66;
  uint64_t v67;

  v10 = OUTLINED_FUNCTION_3();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = OUTLINED_FUNCTION_11();
  v13 = a2(v12);
  if (v5)
  {
    v67 = (uint64_t)v5;
    OUTLINED_FUNCTION_16();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    if (OUTLINED_FUNCTION_34())
    {
      v14 = v66;
      if ((unint64_t)(v66 - 1) >= 2)
      {
        if (v66)
        {

          if (one-time initialization token for default != -1)
            swift_once();
          v47 = (void *)__swift_project_value_buffer(v10, (uint64_t)static Log.default);
          OUTLINED_FUNCTION_6();
          OUTLINED_FUNCTION_7();
          outlined copy of SnippetCommandError(v66);
          OUTLINED_FUNCTION_6();
          OUTLINED_FUNCTION_7();
          outlined copy of SnippetCommandError(v66);
          Logger.logObject.getter();
          v48 = OUTLINED_FUNCTION_26();
          if (OUTLINED_FUNCTION_9(v48))
          {
            v49 = OUTLINED_FUNCTION_2_1();
            OUTLINED_FUNCTION_2_1();
            *(_DWORD *)v49 = 136315394;
            v65 = a3;
            OUTLINED_FUNCTION_4_1();
            OUTLINED_FUNCTION_7();
            v50 = String.init<A>(describing:)();
            v64 = (uint64_t (*)(_QWORD))OUTLINED_FUNCTION_48(v50, v51);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            OUTLINED_FUNCTION_1_3();
            OUTLINED_FUNCTION_1_3();
            OUTLINED_FUNCTION_46();
            *(_WORD *)(v49 + 12) = 2080;
            if (outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.dictionaryRepresentation.getter(v14))
            {
              Dictionary.description.getter();
              OUTLINED_FUNCTION_46();
            }
            v64 = (uint64_t (*)(_QWORD))OUTLINED_FUNCTION_15();
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            OUTLINED_FUNCTION_31();
            outlined consume of SnippetCommandError(v14);
            OUTLINED_FUNCTION_45();
            OUTLINED_FUNCTION_27(&dword_21F909000, v60, v48, "Converter: %s Is not able to support the SFCommand:\n    %s.\nReturning Exception: SnippetCommandError.unsupportedSFCommand");
            swift_arrayDestroy();
            OUTLINED_FUNCTION_5();
          }
          OUTLINED_FUNCTION_1_3();
          OUTLINED_FUNCTION_1_3();
          outlined consume of SnippetCommandError(v66);
          OUTLINED_FUNCTION_45();

          *(_QWORD *)a4 = v66;
        }
        else
        {

          if (one-time initialization token for default != -1)
            v36 = swift_once();
          OUTLINED_FUNCTION_10(v36, (uint64_t)static Log.default);
          OUTLINED_FUNCTION_21();
          OUTLINED_FUNCTION_49();
          v37 = a1;
          Logger.logObject.getter();
          v38 = OUTLINED_FUNCTION_26();
          if (OUTLINED_FUNCTION_9(v38))
          {
            v39 = (_DWORD *)OUTLINED_FUNCTION_2_1();
            OUTLINED_FUNCTION_2_1();
            *v39 = 136315394;
            v65 = a3;
            OUTLINED_FUNCTION_4_1();
            OUTLINED_FUNCTION_7();
            v40 = OUTLINED_FUNCTION_13();
            v64 = (uint64_t (*)(_QWORD))OUTLINED_FUNCTION_48(v40, v41);
            OUTLINED_FUNCTION_8();
            OUTLINED_FUNCTION_1_3();
            OUTLINED_FUNCTION_1_3();
            OUTLINED_FUNCTION_33();
            if (OUTLINED_FUNCTION_25())
            {
              Dictionary.description.getter();
              OUTLINED_FUNCTION_22();
            }
            v64 = (uint64_t (*)(_QWORD))OUTLINED_FUNCTION_15();
            OUTLINED_FUNCTION_8();

            OUTLINED_FUNCTION_31();
            OUTLINED_FUNCTION_28(&dword_21F909000, v59, v38, "Converter: %s Did not receive the expected SFCommand Type.\nReceived command of type: %s.\nReturning Exception: SnippetCommandError.unableToCastCommandToExpectedType");
            OUTLINED_FUNCTION_24();
            OUTLINED_FUNCTION_5();
          }

          OUTLINED_FUNCTION_1_3();
          OUTLINED_FUNCTION_1_3();
          *(_QWORD *)a4 = 0;
        }
        *(_BYTE *)(a4 + 8) = 1;
        OUTLINED_FUNCTION_32();
        goto LABEL_37;
      }
      OUTLINED_FUNCTION_45();
    }
    v63 = a4;
    OUTLINED_FUNCTION_32();
    if (one-time initialization token for default != -1)
      v15 = swift_once();
    v16 = OUTLINED_FUNCTION_10(v15, (uint64_t)static Log.default);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_7();
    v17 = v16;
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_7();
    v18 = (void *)Logger.logObject.getter();
    v19 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_40(v19))
    {
      v20 = OUTLINED_FUNCTION_2_1();
      v67 = OUTLINED_FUNCTION_2_1();
      *(_DWORD *)v20 = 136315650;
      v64 = a2;
      v65 = a3;
      OUTLINED_FUNCTION_4_1();
      OUTLINED_FUNCTION_7();
      v21 = OUTLINED_FUNCTION_13();
      v23 = OUTLINED_FUNCTION_29(v21, v22);
      OUTLINED_FUNCTION_12(v23);
      OUTLINED_FUNCTION_1_3();
      OUTLINED_FUNCTION_1_3();
      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 12) = 2080;
      if (OUTLINED_FUNCTION_47())
      {
        Dictionary.description.getter();
        OUTLINED_FUNCTION_18();
      }
      v42 = OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_3_1(v42);

      OUTLINED_FUNCTION_37();
      *(_WORD *)(v20 + 22) = 2080;
      OUTLINED_FUNCTION_19();
      v43 = OUTLINED_FUNCTION_41();
      v45 = OUTLINED_FUNCTION_29(v43, v44);
      OUTLINED_FUNCTION_3_1(v45);
      OUTLINED_FUNCTION_37();
      OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_35(&dword_21F909000, v46, v19, "Converter: %s Threw an Exception for:\n    %s\nError:\n    %s");
      OUTLINED_FUNCTION_42();
      OUTLINED_FUNCTION_5();
    }
    OUTLINED_FUNCTION_5_0();

    OUTLINED_FUNCTION_1_3();
    OUTLINED_FUNCTION_1_3();
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_5_0();

    *(_QWORD *)v63 = 1;
    *(_BYTE *)(v63 + 8) = 1;
LABEL_37:
    OUTLINED_FUNCTION_17();
    return;
  }
  v24 = (void *)v13;
  v62 = v11;
  if (one-time initialization token for default != -1)
    swift_once();
  v25 = __swift_project_value_buffer(v10, (uint64_t)static Log.default);
  OUTLINED_FUNCTION_44(v25, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16));
  v26 = a1;
  v27 = v24;
  v28 = v26;
  v29 = v27;
  v30 = (void *)OUTLINED_FUNCTION_38();
  v31 = static os_log_type_t.info.getter();
  if (!OUTLINED_FUNCTION_9(v31))
  {

    OUTLINED_FUNCTION_14(*(uint64_t (**)(uint64_t, uint64_t))(v62 + 8));
    *(_QWORD *)a4 = 0;
    *(_BYTE *)(a4 + 8) = 0;
    goto LABEL_37;
  }
  v61 = v31;
  v32 = OUTLINED_FUNCTION_2_1();
  v64 = (uint64_t (*)(_QWORD))OUTLINED_FUNCTION_2_1();
  *(_DWORD *)v32 = 136315394;
  if (OUTLINED_FUNCTION_47())
  {
    v33 = Dictionary.description.getter();
    v35 = v34;
    swift_bridgeObjectRelease();
  }
  else
  {
    v35 = 0xE90000000000003ELL;
    v33 = 0x64696C61766E693CLL;
  }
  v67 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v33, v35, (uint64_t *)&v64);
  OUTLINED_FUNCTION_30();

  OUTLINED_FUNCTION_33();
  *(_WORD *)(v32 + 12) = 2080;
  v52 = objc_msgSend(0, sel_dictionary);
  if (v52)
  {
    v53 = v52;
    v54 = objc_msgSend(v52, sel_description);

    v55 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v57 = v56;

    v67 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v55, v57, (uint64_t *)&v64);
    OUTLINED_FUNCTION_30();

    OUTLINED_FUNCTION_31();
    OUTLINED_FUNCTION_27(&dword_21F909000, v58, v61, "Successfully converted SFCommand:\n    %s\nto AceCommand:\n    %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5();
  }

  __break(1u);
}

void SnippetCommandExecutor.execute(sfCommand:with:)(void *a1@<X0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  void *v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  id v31;
  os_log_type_t v32;
  _DWORD *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(_QWORD);
  uint64_t v45;
  id v46;
  uint64_t v47;

  v10 = OUTLINED_FUNCTION_3();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = OUTLINED_FUNCTION_11();
  a2(v12);
  if (v5)
  {
    v47 = v5;
    OUTLINED_FUNCTION_16();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    v43 = a4;
    if (!OUTLINED_FUNCTION_34())
    {
LABEL_5:
      OUTLINED_FUNCTION_32();
      if (one-time initialization token for default != -1)
        v13 = swift_once();
      v14 = OUTLINED_FUNCTION_10(v13, (uint64_t)static Log.default);
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_7();
      v15 = v14;
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_7();
      v16 = (void *)Logger.logObject.getter();
      v17 = static os_log_type_t.error.getter();
      if (OUTLINED_FUNCTION_40(v17))
      {
        v18 = OUTLINED_FUNCTION_2_1();
        v47 = OUTLINED_FUNCTION_2_1();
        *(_DWORD *)v18 = 136315650;
        v44 = a2;
        v45 = a3;
        OUTLINED_FUNCTION_4_1();
        OUTLINED_FUNCTION_7();
        v19 = OUTLINED_FUNCTION_13();
        v21 = OUTLINED_FUNCTION_29(v19, v20);
        OUTLINED_FUNCTION_12(v21);
        OUTLINED_FUNCTION_1_3();
        OUTLINED_FUNCTION_1_3();
        swift_bridgeObjectRelease();
        *(_WORD *)(v18 + 12) = 2080;
        if (OUTLINED_FUNCTION_47())
        {
          Dictionary.description.getter();
          OUTLINED_FUNCTION_18();
        }
        v36 = OUTLINED_FUNCTION_20();
        OUTLINED_FUNCTION_3_1(v36);

        OUTLINED_FUNCTION_37();
        *(_WORD *)(v18 + 22) = 2080;
        OUTLINED_FUNCTION_19();
        v37 = OUTLINED_FUNCTION_41();
        v39 = OUTLINED_FUNCTION_29(v37, v38);
        OUTLINED_FUNCTION_3_1(v39);
        OUTLINED_FUNCTION_37();
        OUTLINED_FUNCTION_5_0();
        OUTLINED_FUNCTION_5_0();
        OUTLINED_FUNCTION_35(&dword_21F909000, v40, v17, "Executor: %s Threw an Exception for:\n    %s\nError:\n    %s");
        OUTLINED_FUNCTION_42();
        OUTLINED_FUNCTION_5();
      }
      OUTLINED_FUNCTION_5_0();

      OUTLINED_FUNCTION_1_3();
      OUTLINED_FUNCTION_1_3();
      OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_5_0();

      *(_QWORD *)v43 = 2;
      *(_BYTE *)(v43 + 8) = 1;
      goto LABEL_27;
    }
    if (v46)
    {
      outlined consume of SnippetCommandError(v46);
      goto LABEL_5;
    }
    OUTLINED_FUNCTION_5_0();
    if (one-time initialization token for default != -1)
      v30 = swift_once();
    OUTLINED_FUNCTION_10(v30, (uint64_t)static Log.default);
    OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_49();
    v31 = a1;
    Logger.logObject.getter();
    v32 = OUTLINED_FUNCTION_26();
    if (OUTLINED_FUNCTION_9(v32))
    {
      v33 = (_DWORD *)OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_2_1();
      *v33 = 136315394;
      v45 = a3;
      OUTLINED_FUNCTION_4_1();
      OUTLINED_FUNCTION_7();
      v34 = OUTLINED_FUNCTION_13();
      v44 = (void (*)(_QWORD))OUTLINED_FUNCTION_48(v34, v35);
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_1_3();
      OUTLINED_FUNCTION_1_3();
      OUTLINED_FUNCTION_33();
      if (OUTLINED_FUNCTION_25())
      {
        Dictionary.description.getter();
        OUTLINED_FUNCTION_22();
      }
      v44 = (void (*)(_QWORD))OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_8();

      OUTLINED_FUNCTION_31();
      OUTLINED_FUNCTION_28(&dword_21F909000, v42, v32, "Executor: %s Did not receive the expected SFCommand Type.\nReceived command of type: %s.\nReturning Exception: SnippetCommandError.unableToCastCommandToExpectedType");
      OUTLINED_FUNCTION_24();
      OUTLINED_FUNCTION_5();
    }

    OUTLINED_FUNCTION_1_3();
    OUTLINED_FUNCTION_1_3();
    *(_QWORD *)a4 = 0;
    *(_BYTE *)(a4 + 8) = 1;
    OUTLINED_FUNCTION_32();
  }
  else
  {
    if (one-time initialization token for default != -1)
      swift_once();
    v22 = __swift_project_value_buffer(v10, (uint64_t)static Log.default);
    OUTLINED_FUNCTION_44(v22, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16));
    v23 = a1;
    v24 = OUTLINED_FUNCTION_38();
    v25 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)OUTLINED_FUNCTION_2_1();
      v44 = (void (*)(_QWORD))OUTLINED_FUNCTION_2_1();
      *(_DWORD *)v26 = 136315138;
      if (outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.dictionaryRepresentation.getter(0))
      {
        v27 = Dictionary.description.getter();
        v29 = v28;
        OUTLINED_FUNCTION_33();
      }
      else
      {
        v29 = 0xE90000000000003ELL;
        v27 = 0x64696C61766E693CLL;
      }
      v41 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v27, v29, (uint64_t *)&v44);
      OUTLINED_FUNCTION_43(v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21F909000, v24, v25, "Successfully executed SFCommand:\n    %s", v26, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
    }

    OUTLINED_FUNCTION_14(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
    *(_QWORD *)a4 = 0;
    *(_BYTE *)(a4 + 8) = 2;
  }
LABEL_27:
  OUTLINED_FUNCTION_17();
}

uint64_t SnippetCommandExecutor.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SnippetCommandExecutor.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void outlined consume of SnippetCommandError(id a1)
{
  if ((unint64_t)a1 >= 3)

}

id outlined copy of SnippetCommandError(id result)
{
  if ((unint64_t)result >= 3)
    return result;
  return result;
}

uint64_t type metadata accessor for SnippetCommandExecutor()
{
  return objc_opt_self();
}

uint64_t method lookup function for SnippetCommandExecutor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SnippetCommandExecutor.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of SnippetCommandExecutor.execute(sfCommand:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t dispatch thunk of SnippetCommandExecutor.convert(sfCommand:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of SnippetCommandExecutor.convert(sfCommand:with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of SnippetCommandExecutor.execute(sfCommand:with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t initializeBufferWithCopyOfBuffer for ExecutionResult(uint64_t a1, uint64_t a2)
{
  id v3;
  char v4;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  outlined copy of ExecutionResult(*(id *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

id outlined copy of ExecutionResult(id result, char a2)
{
  if (a2 == 1)
    return outlined copy of SnippetCommandError(result);
  if (!a2)
    return result;
  return result;
}

void destroy for ExecutionResult(uint64_t a1)
{
  outlined consume of ExecutionResult(*(id *)a1, *(_BYTE *)(a1 + 8));
}

void outlined consume of ExecutionResult(id a1, char a2)
{
  if (a2 == 1)
  {
    outlined consume of SnippetCommandError(a1);
  }
  else if (!a2)
  {

  }
}

uint64_t assignWithCopy for ExecutionResult(uint64_t a1, uint64_t a2)
{
  id v3;
  char v4;
  void *v5;
  char v6;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  outlined copy of ExecutionResult(*(id *)a2, v4);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v3;
  v6 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v4;
  outlined consume of ExecutionResult(v5, v6);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for ExecutionResult(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  char v5;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v3;
  outlined consume of ExecutionResult(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for ExecutionResult(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 2)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ExecutionResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t getEnumTag for ExecutionResult(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t destructiveInjectEnumTag for ExecutionResult(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ExecutionResult()
{
  return &type metadata for ExecutionResult;
}

_QWORD *initializeBufferWithCopyOfBuffer for SnippetCommandError(_QWORD *a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF)
    v4 = v3;
  *a1 = v3;
  return a1;
}

void destroy for SnippetCommandError(void **a1)
{
  void *v1;

  v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF)

}

void **assignWithCopy for SnippetCommandError(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
    {
      *a1 = v4;
      v6 = v4;
      return a1;
    }
LABEL_7:
    *a1 = v4;
    return a1;
  }
  if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    v4 = *a2;
    goto LABEL_7;
  }
  *a1 = v4;
  v5 = v4;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for SnippetCommandError(void **a1, unint64_t *a2)
{
  void *v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
    goto LABEL_6;
  if (v4 < 0xFFFFFFFF)
  {

LABEL_6:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for SnippetCommandError(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFD && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483645);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 2;
  if (v4 >= 4)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SnippetCommandError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 2;
  }
  return result;
}

uint64_t getEnumTag for SnippetCommandError(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *destructiveInjectEnumTag for SnippetCommandError(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for SnippetCommandError()
{
  return &type metadata for SnippetCommandError;
}

void partial apply for specialized closure #1 in AnySFCommandExecutor.init<A>(wrapped:)(void *a1)
{
  specialized closure #1 in AnySFCommandExecutor.init<A>(wrapped:)(a1);
}

id partial apply for specialized closure #1 in AnySFCommandConverter.init<A>(wrapped:)(void *a1)
{
  return specialized closure #1 in AnySFCommandConverter.init<A>(wrapped:)(a1);
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_3_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 136) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 120) = *(_QWORD *)(v1 - 192);
  *(_QWORD *)(v1 - 112) = v0;
  return swift_retain();
}

void OUTLINED_FUNCTION_5_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

BOOL OUTLINED_FUNCTION_9(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

id OUTLINED_FUNCTION_10(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  __swift_project_value_buffer(v3, a2);
  return v2;
}

uint64_t OUTLINED_FUNCTION_11()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_12(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 136) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return String.init<A>(describing:)();
}

uint64_t OUTLINED_FUNCTION_14@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_15()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v1, v0, (uint64_t *)(v2 - 176));
}

id OUTLINED_FUNCTION_16()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_18()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_19()
{
  return swift_getErrorValue();
}

uint64_t OUTLINED_FUNCTION_20()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v1, v0, (uint64_t *)(v2 - 96));
}

uint64_t OUTLINED_FUNCTION_21()
{
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_22()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_23()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_25()
{
  void *v0;
  uint64_t v1;

  *(_WORD *)(v1 + 12) = 2080;
  return outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.dictionaryRepresentation.getter(v0);
}

uint64_t OUTLINED_FUNCTION_26()
{
  return static os_log_type_t.error.getter();
}

void OUTLINED_FUNCTION_27(void *a1, uint64_t a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;
  NSObject *v5;

  _os_log_impl(a1, v5, a3, a4, v4, 0x16u);
}

void OUTLINED_FUNCTION_28(void *a1, uint64_t a2, os_log_type_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_impl(a1, v4, a3, a4, v5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_29(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, (uint64_t *)(v2 - 96));
}

uint64_t OUTLINED_FUNCTION_30()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_32()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return swift_dynamicCast();
}

void OUTLINED_FUNCTION_35(void *a1, uint64_t a2, os_log_type_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_impl(a1, v4, a3, a4, v5, 0x20u);
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_37()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_38()
{
  return Logger.logObject.getter();
}

BOOL OUTLINED_FUNCTION_40(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_41()
{
  return Error.localizedDescription.getter();
}

uint64_t OUTLINED_FUNCTION_42()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_43(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_44@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v3, a1, v2);
}

void OUTLINED_FUNCTION_45()
{
  void *v0;

  outlined consume of SnippetCommandError(v0);
}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_47()
{
  void *v0;

  return outlined bridged method (pb) of @objc SFBeginMapsRoutingCommand.dictionaryRepresentation.getter(v0);
}

uint64_t OUTLINED_FUNCTION_48(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, (uint64_t *)(v2 - 176));
}

uint64_t OUTLINED_FUNCTION_49()
{
  return swift_retain_n();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x24BDCD8D0](retstr);
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x24BDCDCA0]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t os_signpost(_:dso:log:name:signpostID:)()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t OSSignpostID.init(log:)()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t Logger.init(_:)()
{
  return MEMORY[0x24BEE78E8]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x24BEE02B0]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x24BEE09F0]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t static os_signpost_type_t.event.getter()
{
  return MEMORY[0x24BEE7958]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

{
  return MEMORY[0x24BEE2F48]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x24BDD0708]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x24BEE4C88]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

