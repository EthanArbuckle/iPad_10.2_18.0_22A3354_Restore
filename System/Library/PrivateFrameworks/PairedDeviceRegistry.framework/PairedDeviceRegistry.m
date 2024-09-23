void sub_2433B1760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_2433B19A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2433B1BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0()
{
  return NSRequestConcreteImplementation();
}

uint64_t PDRRawVersionFromString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  unint64_t v6;
  unsigned __int8 v7;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "integerValue");

      v6 = objc_msgSend(v3, "count");
      v7 = 0;
      v8 = 0;
      if (v6 >= 2)
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v9, "integerValue");

        if ((unint64_t)objc_msgSend(v3, "count") < 3)
        {
          v8 = 0;
        }
        else
        {
          objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "integerValue");

          v8 = v11;
        }
      }
      v12 = (v5 << 16) | (v7 << 8) | v8;
    }
    else
    {
      v12 = 0xFFFFFFFFLL;
    }

  }
  else
  {
    v12 = 0xFFFFFFFFLL;
  }

  return v12;
}

uint64_t PDRWatchOSVersion(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a1;
  v4 = 0xFFFFFFFFLL;
  if (v3 && a2)
  {
    v4 = PDRRawVersionFromString(a2);
    v5 = v3;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Watch OS")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("watchOS")) & 1) == 0)
    {
      if (v4 >> 8 == 2050 && objc_msgSend(v5, "isEqualToString:", CFSTR("iPhone OS")))
        v4 = v4 | 0x10000u;
      else
        v4 = 0xFFFFFFFFLL;
    }

  }
  return v4;
}

uint64_t PDRWatchOSVersionForRemoteDevice(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  objc_msgSend(v1, "valueForProperty:", CFSTR("systemName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "valueForProperty:", CFSTR("systemVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = PDRWatchOSVersion(v2, v3);
  return v4;
}

uint64_t PDRWatchOSVersionForLocalDevice()
{
  return 0;
}

BOOL PDRVersionIsGreaterThanOrEqual(unsigned int a1, unsigned int a2)
{
  return a1 >= a2;
}

id instanceClass()
{
  if (instanceClass_onceToken != -1)
    dispatch_once(&instanceClass_onceToken, &__block_literal_global_1);
  return (id)instanceClass_result;
}

uint64_t __instanceClass_block_invoke()
{
  uint64_t result;

  +[PDRRegistry_Impl supportsWatch](PDRRegistry_Impl, "supportsWatch");
  result = objc_opt_class();
  instanceClass_result = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_2()
{
  return NSRequestConcreteImplementation();
}

uint64_t OUTLINED_FUNCTION_4()
{
  uint64_t v0;

  return v0;
}

uint64_t PDRDeviceSizeForProductType(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(&unk_2513DE268, "objectForKeyedSubscript:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = (int)objc_msgSend(v1, "intValue");
  else
    v3 = 0;

  return v3;
}

void type metadata accessor for PDRRegistryStatus(uint64_t a1)
{
  type metadata accessor for PDRRegistryStatus(a1, &lazy cache variable for type metadata for PDRRegistryStatus);
}

void type metadata accessor for PDRCompatibilityState(uint64_t a1)
{
  type metadata accessor for PDRRegistryStatus(a1, (unint64_t *)&lazy cache variable for type metadata for PDRCompatibilityState);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  type metadata accessor for PDRRegistryStatus(a1, &lazy cache variable for type metadata for os_unfair_lock_s);
}

uint64_t one-time initialization function for framework()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logs.framework);
  __swift_project_value_buffer(v0, (uint64_t)static Logs.framework);
  return Logger.init(subsystem:category:)();
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance PDRDevicePropertyKey(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance PDRDevicePropertyKey(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance PDRDevicePropertyKey(uint64_t a1, id *a2)
{
  uint64_t result;

  result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance PDRDevicePropertyKey(uint64_t a1, id *a2)
{
  char v3;

  v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance PDRDevicePropertyKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = MEMORY[0x2494F7BCC](v2);
  result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance PDRDevicePropertyKey@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = MEMORY[0x2494F7BCC](*a1, a1[1]);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance PDRDevicePropertyKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance PDRDevicePropertyKey(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance PDRDevicePropertyKey(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance PDRDevicePropertyKey(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance PDRDevicePropertyKey()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance PDRDevicePropertyKey()
{
  Swift::Int v0;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance PDRDeviceExclusion(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance PDRDeviceExclusion(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance PDRDevicePropertyKey()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3)
    v5 = 1;
  else
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance PDRCompatibilityState@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void type metadata accessor for PDRDevicePropertyKey(uint64_t a1)
{
  type metadata accessor for PDRRegistryStatus(a1, &lazy cache variable for type metadata for PDRDevicePropertyKey);
}

void type metadata accessor for PDRRegistryStatus(uint64_t a1, unint64_t *a2)
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

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance PDRDevicePropertyKey()
{
  lazy protocol witness table accessor for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey(&lazy protocol witness table cache variable for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey, (uint64_t)&protocol conformance descriptor for PDRDevicePropertyKey);
  lazy protocol witness table accessor for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey((unint64_t *)&lazy protocol witness table cache variable for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey, (uint64_t)&protocol conformance descriptor for PDRDevicePropertyKey);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t base witness table accessor for RawRepresentable in PDRDevicePropertyKey()
{
  return lazy protocol witness table accessor for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey(&lazy protocol witness table cache variable for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey, (uint64_t)&protocol conformance descriptor for PDRDevicePropertyKey);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in PDRDevicePropertyKey()
{
  return lazy protocol witness table accessor for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey(&lazy protocol witness table cache variable for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey, (uint64_t)&protocol conformance descriptor for PDRDevicePropertyKey);
}

uint64_t lazy protocol witness table accessor for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for PDRDevicePropertyKey(255);
    result = MEMORY[0x2494F83D0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t base witness table accessor for Equatable in PDRDevicePropertyKey()
{
  return lazy protocol witness table accessor for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey(&lazy protocol witness table cache variable for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey, (uint64_t)&protocol conformance descriptor for PDRDevicePropertyKey);
}

BOOL NotifyState.start(bootstrap:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  const char *v8;
  NSObject *v9;
  void *v10;
  uint32_t v11;
  _QWORD aBlock[6];
  int out_token;
  uint64_t v15;

  v2 = v1;
  v15 = *MEMORY[0x24BDAC8D0];
  v4 = type metadata accessor for DispatchQoS.QoSClass();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  out_token = 0;
  v8 = *(const char **)(v1 + 16);
  type metadata accessor for OS_dispatch_queue();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE5490], v4);
  v9 = static OS_dispatch_queue.global(qos:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  aBlock[4] = partial apply for closure #1 in NotifyState.start(bootstrap:);
  aBlock[5] = v2;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@unowned Int32) -> ();
  aBlock[3] = &block_descriptor;
  v10 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v11 = notify_register_dispatch(v8, &out_token, v9, v10);
  _Block_release(v10);

  if (!v11)
  {
    *(_DWORD *)(v2 + 40) = out_token;
    *(_BYTE *)(v2 + 44) = 0;
    if ((a1 & 1) != 0)
      (*(void (**)(uint64_t))(v2 + 24))(v2);
  }
  return v11 != 0;
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Int32) -> ()(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t NotifyState.__deallocating_deinit()
{
  uint64_t v0;

  free(*(void **)(v0 + 16));
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NotifyState()
{
  return objc_opt_self();
}

unint64_t type metadata accessor for OS_dispatch_queue()
{
  unint64_t result;

  result = lazy cache variable for type metadata for OS_dispatch_queue;
  if (!lazy cache variable for type metadata for OS_dispatch_queue)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
  }
  return result;
}

uint64_t partial apply for closure #1 in NotifyState.start(bootstrap:)(uint64_t result)
{
  uint64_t v1;

  if ((*(_BYTE *)(v1 + 44) & 1) == 0 && *(_DWORD *)(v1 + 40) == (_DWORD)result)
    return (*(uint64_t (**)(uint64_t))(v1 + 24))(v1);
  return result;
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

char *one-time initialization function for instance()
{
  char *result;

  type metadata accessor for RegistryCrux(0);
  swift_allocObject();
  result = RegistryCrux.().init()();
  static RegistryCrux.instance = (uint64_t)result;
  return result;
}

uint64_t (*RegistryCrux.connectionSleeper_.modify())()
{
  swift_beginAccess();
  return RegistryCrux.connectionSleeper_.modify;
}

uint64_t RegistryCrux.hasInternalDiagnostics.getter()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t result;

  v1 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___hasInternalDiagnostics;
  v2 = *(unsigned __int8 *)(v0
                          + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___hasInternalDiagnostics);
  if (v2 != 2)
    return v2 & 1;
  result = os_variant_has_internal_diagnostics();
  *(_BYTE *)(v0 + v1) = result;
  return result;
}

double RegistryCrux.minElapsedToFireMs.getter()
{
  uint64_t v0;
  _BYTE *v1;
  Swift::String v2;
  double result;
  Swift::Int_optional v4;

  v1 = (_BYTE *)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___minElapsedToFireMs);
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___minElapsedToFireMs + 8) & 1) == 0)
    return *(double *)v1;
  v2._object = (void *)0x80000002433C9380;
  v2._countAndFlagsBits = 0xD000000000000012;
  v4 = RegistryCrux.internalLongPreference(key:)(v2);
  result = (double)v4.value;
  if (v4.is_nil)
    result = 30.0;
  *(double *)v1 = result;
  v1[8] = 0;
  return result;
}

Swift::Int_optional __swiftcall RegistryCrux.internalLongPreference(key:)(Swift::String key)
{
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  Swift::Int v7;
  char v8;
  Swift::Int v9;
  Swift::Bool v10;
  __int128 aBlock;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  void *v16;
  Swift::Int_optional result;

  object = key._object;
  countAndFlagsBits = key._countAndFlagsBits;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = 0;
  *(_BYTE *)(v3 + 24) = 1;
  RegistryCrux.synchronousUntypedService(tag:)(0xD00000000000001CLL, 0x80000002433C9350, &aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCRegistryDelegate);
  swift_dynamicCast();
  v4 = v16;
  v5 = (void *)MEMORY[0x2494F7BCC](countAndFlagsBits, object);
  v14 = partial apply for closure #1 in RegistryCrux.internalLongPreference(key:);
  v15 = v3;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v12 = thunk for @escaping @callee_guaranteed (@unowned Bool, @unowned Int) -> ();
  v13 = &block_descriptor_15;
  v6 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_xpcLongForInternalPreference_withBlock_, v5, v6);
  swift_unknownObjectRelease();
  _Block_release(v6);

  swift_beginAccess();
  v7 = *(_QWORD *)(v3 + 16);
  v8 = *(_BYTE *)(v3 + 24);
  swift_release();
  v9 = v7;
  v10 = v8;
  result.value = v9;
  result.is_nil = v10;
  return result;
}

double RegistryCrux.maxElapsedToFireMs.getter()
{
  uint64_t v0;
  _BYTE *v1;
  Swift::String v2;
  double result;
  Swift::Int_optional v4;

  v1 = (_BYTE *)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___maxElapsedToFireMs);
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___maxElapsedToFireMs + 8) & 1) == 0)
    return *(double *)v1;
  v2._object = (void *)0x80000002433C9330;
  v2._countAndFlagsBits = 0xD000000000000012;
  v4 = RegistryCrux.internalLongPreference(key:)(v2);
  result = (double)v4.value;
  if (v4.is_nil)
    result = 5000.0;
  *(double *)v1 = result;
  v1[8] = 0;
  return result;
}

BOOL RegistryCrux.tailspinsEnabled.getter()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  Swift::String v3;
  _BOOL8 result;

  v1 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___tailspinsEnabled;
  v2 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___tailspinsEnabled);
  if (v2 != 2)
    return v2 & 1;
  v3._object = (void *)0x80000002433C92E0;
  v3._countAndFlagsBits = 0xD000000000000018;
  result = RegistryCrux.internalBoolPreference(key:)(v3).value;
  *(_BYTE *)(v0 + v1) = result;
  return result;
}

Swift::Bool_optional __swiftcall RegistryCrux.internalBoolPreference(key:)(Swift::String key)
{
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 aBlock;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  void *v10;
  uint64_t (*v11)(uint64_t, char);
  uint64_t v12;
  void *v13;

  object = key._object;
  countAndFlagsBits = key._countAndFlagsBits;
  v3 = swift_allocObject();
  *(_BYTE *)(v3 + 16) = 2;
  RegistryCrux.synchronousUntypedService(tag:)(0xD00000000000001CLL, 0x80000002433C9300, &aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCRegistryDelegate);
  swift_dynamicCast();
  v4 = v13;
  v5 = (void *)MEMORY[0x2494F7BCC](countAndFlagsBits, object);
  v11 = partial apply for closure #1 in RegistryCrux.internalBoolPreference(key:);
  v12 = v3;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v9 = thunk for @escaping @callee_guaranteed (@unowned Bool, @unowned Int) -> ();
  v10 = &block_descriptor_9;
  v6 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_xpcBooleanForInternalPreference_withBlock_, v5, v6);
  swift_unknownObjectRelease();
  _Block_release(v6);

  swift_beginAccess();
  LOBYTE(v4) = *(_BYTE *)(v3 + 16);
  swift_release();
  return (Swift::Bool_optional)v4;
}

char *RegistryCrux.().init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  _OWORD *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  id v27;
  char *result;
  uint64_t v29;
  void *v30;
  const char *v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = type metadata accessor for OS_dispatch_queue.Attributes();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v2);
  v4 = type metadata accessor for DispatchQoS();
  MEMORY[0x24BDAC7A8](v4);
  v5 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NRMutableDeviceCollection(0, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BEE5758], v5);
  static DispatchQoS.unspecified.getter();
  v9 = MEMORY[0x24BEE4AF8];
  aBlock[0] = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, v3, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A], &demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  *(_QWORD *)(v0 + 24) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  v10 = v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_refreshTimings;
  static ContinuousClock.now.getter();
  v11 = *(int *)(type metadata accessor for RegistryCrux.RefreshTimings(0) + 20);
  aBlock[0] = 0;
  MEMORY[0x2494F8484](aBlock, 8);
  *(_WORD *)(v10 + v11) = aBlock[0];
  v12 = v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_lastLoggedInfo;
  v13 = type metadata accessor for RegistryState.LoggingInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  v14 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  v15 = swift_allocObject();
  *(_DWORD *)(v15 + 16) = 0;
  *(_QWORD *)(v1 + v14) = v15;
  v16 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registries_;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistry>);
  v17 = swift_allocObject();
  *(_QWORD *)(v1 + v16) = v17;
  *(_QWORD *)(v17 + 16) = v9;
  *(_BYTE *)(v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_warnedAboutEntitlement_) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_connectionShadow_) = 0;
  v18 = v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_connectionSleeper_;
  *(_OWORD *)v18 = 0u;
  *(_OWORD *)(v18 + 16) = 0u;
  *(_BYTE *)(v18 + 32) = 1;
  v19 = (_OWORD *)(v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_serviceShadow_);
  *v19 = 0u;
  v19[1] = 0u;
  *(_BYTE *)(v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___hasInternalDiagnostics) = 2;
  v20 = v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___minElapsedToFireMs;
  *(_QWORD *)v20 = 0;
  *(_BYTE *)(v20 + 8) = 1;
  v21 = v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___maxElapsedToFireMs;
  *(_QWORD *)v21 = 0;
  *(_BYTE *)(v21 + 8) = 1;
  *(_BYTE *)(v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___tailspinsEnabled) = 2;
  v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6B4C8]), sel_init);
  v23 = v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_;
  *(_QWORD *)v23 = v22;
  *(_OWORD *)(v23 + 8) = xmmword_2433C7FF0;
  type metadata accessor for NotifyState();
  v24 = swift_allocObject();
  *(_DWORD *)(v24 + 40) = 0;
  *(_BYTE *)(v24 + 44) = 1;
  *(_QWORD *)(v24 + 24) = closure #1 in default argument 1 of NotifyState.init(name:_:);
  *(_QWORD *)(v24 + 32) = 0;
  v25 = (void *)MEMORY[0x2494F7BCC](0, 0xE000000000000000);
  v26 = (const char *)objc_msgSend(v25, sel_UTF8String);
  v27 = v25;
  result = strdup(v26);
  if (!result)
  {
    __break(1u);
    goto LABEL_11;
  }
  *(_QWORD *)(v24 + 16) = result;
  *(_QWORD *)(v1 + 16) = v24;
  v29 = swift_allocObject();
  *(_DWORD *)(v29 + 40) = 0;
  *(_BYTE *)(v29 + 44) = 1;
  swift_retain();
  v30 = (void *)MEMORY[0x2494F7BCC](0xD00000000000003FLL, 0x80000002433C98C0);
  v31 = (const char *)objc_msgSend(v30, sel_UTF8String);
  v32 = v30;
  result = strdup(v31);
  if (!result)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  *(_QWORD *)(v29 + 16) = result;
  *(_QWORD *)(v29 + 24) = partial apply for closure #1 in RegistryCrux.().init();
  *(_QWORD *)(v29 + 32) = v1;
  *(_QWORD *)(v1 + 16) = v29;
  swift_release();
  swift_retain();
  NotifyState.start(bootstrap:)(0);
  swift_release();
  v33 = *(NSObject **)(v1 + 24);
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = partial apply for closure #2 in RegistryCrux.().init();
  *(_QWORD *)(v34 + 24) = v1;
  aBlock[4] = partial apply for thunk for @callee_guaranteed () -> ();
  aBlock[5] = v34;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_100;
  v35 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v33, v35);
  _Block_release(v35);
  LOBYTE(v33) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v33 & 1) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (one-time initialization token for framework != -1)
LABEL_9:
    swift_once();
  v36 = type metadata accessor for Logger();
  __swift_project_value_buffer(v36, (uint64_t)static Logs.framework);
  v37 = Logger.logObject.getter();
  v38 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v39 = 0;
    _os_log_impl(&dword_2433AF000, v37, v38, "RegistryCrux fully initialized and synced", v39, 2u);
    MEMORY[0x2494F8478](v39, -1, -1);
  }
  swift_release();

  return (char *)v1;
}

uint64_t closure #1 in RegistryCrux.().init()(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD aBlock[6];

  v3 = type metadata accessor for DispatchWorkItemFlags();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[0] = *(_QWORD *)(a2 + 24);
  aBlock[4] = partial apply for closure #1 in closure #1 in RegistryCrux.().init();
  aBlock[5] = a2;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_103;
  v12 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  v14[1] = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, v4, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x2494F7CBC](0, v11, v7, v12);
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return swift_release();
}

void closure #1 in closure #1 in RegistryCrux.().init()(uint64_t a1, const char *a2)
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  if (one-time initialization token for framework != -1)
    swift_once();
  v3 = type metadata accessor for Logger();
  __swift_project_value_buffer(v3, (uint64_t)static Logs.framework);
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2433AF000, v4, v5, a2, v6, 2u);
    MEMORY[0x2494F8478](v6, -1, -1);
  }

  RegistryCrux.refresh()();
}

uint64_t thunk for @escaping @callee_guaranteed () -> ()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void RegistryCrux.refresh()()
{
  uint64_t v0;
  double v1;
  double v2;
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
  char *v25;
  uint64_t refreshed;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  os_unfair_lock_s *v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  os_unfair_lock_s *v41;
  void (*v42)(char *, uint64_t);
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  id v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  _DWORD *v59;
  uint64_t v60;
  _DWORD *v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  _DWORD *v68;
  _DWORD *v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  uint64_t *v73;
  void *v74;
  id v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t, uint64_t);
  int v81;
  uint64_t v82;
  void *v83;
  uint64_t *v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void **v93;
  uint64_t v94;
  uint64_t v95;
  NSObject *v96;
  os_log_type_t v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  double v102;
  double v103;
  uint64_t v104;
  NSObject *v105;
  os_log_type_t v106;
  _DWORD *v107;
  uint64_t v108;
  _DWORD *v109;
  uint64_t v110;
  uint64_t v111;
  double v112;
  void *v113;
  uint64_t v114;
  void (*v115)(char *, uint64_t);
  uint64_t v116;
  id Registry;
  void *v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  void **v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  uint64_t state64[4];
  double v134;
  uint64_t v135;

  v3 = v0;
  v135 = *MEMORY[0x24BDAC8D0];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for RegistryState.LoggingInfo?);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v121 = (uint64_t)&v114 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v120 = (uint64_t)&v114 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v119 = (uint64_t *)((char *)&v114 - v10);
  MEMORY[0x24BDAC7A8](v9);
  v125 = (uint64_t)&v114 - v11;
  v12 = type metadata accessor for RegistryState.LoggingInfo();
  v129 = *(_QWORD *)(v12 - 8);
  v130 = v12;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v127 = (uint64_t)&v114 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v123 = (uint64_t)&v114 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v122 = (void **)((char *)&v114 - v18);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v128 = (uint64_t)&v114 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v132 = (char *)&v114 - v21;
  v22 = type metadata accessor for ContinuousClock.Instant();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v114 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  refreshed = type metadata accessor for RegistryCrux.RefreshTimings(0);
  MEMORY[0x24BDAC7A8](refreshed);
  v28 = (char *)&v114 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = type metadata accessor for DispatchPredicate();
  v30 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v32 = (uint64_t *)((char *)&v114 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  v33 = *(void **)(v3 + 24);
  *v32 = v33;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v30 + 104))(v32, *MEMORY[0x24BEE5610], v29);
  v34 = v33;
  LOBYTE(v33) = _dispatchPreconditionTest(_:)();
  (*(void (**)(_QWORD *, uint64_t))(v30 + 8))(v32, v29);
  if ((v33 & 1) == 0)
  {
    __break(1u);
    goto LABEL_47;
  }
  static ContinuousClock.now.getter();
  v35 = *(int *)(refreshed + 20);
  state64[0] = 0;
  MEMORY[0x2494F8484](state64, 8);
  *(_WORD *)&v28[v35] = state64[0];
  v30 = v3 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_refreshTimings;
  swift_beginAccess();
  outlined assign with take of RegistryCrux.RefreshTimings((uint64_t)v28, v30);
  swift_endAccess();
  v124 = mach_absolute_time();
  v36 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
  v37 = *(os_unfair_lock_s **)(v3 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock);
  swift_retain();
  os_unfair_lock_lock(v37 + 4);
  swift_release();
  v38 = 0;
  v39 = *(_QWORD *)(v3 + 16);
  state64[0] = 0;
  if ((*(_BYTE *)(v39 + 44) & 1) == 0)
  {
    v40 = *(_DWORD *)(v39 + 40);
    swift_retain();
    if (notify_is_valid_token(v40))
    {
      if ((*(_BYTE *)(v39 + 44) & 1) != 0)
      {
        __break(1u);
LABEL_50:
        __break(1u);
        return;
      }
      notify_get_state(*(_DWORD *)(v39 + 40), state64);
    }
    swift_release();
    v38 = state64[0];
  }
  v41 = *(os_unfair_lock_s **)(v3 + v36);
  swift_retain();
  os_unfair_lock_unlock(v41 + 4);
  swift_release();
  if (((*(_QWORD *)(v3 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 16) ^ v38) & 0x3FFFFFFFFFFFFFFFLL) != 0)
  {
    v131 = refreshed;
    if (v38 <= 0)
    {
      v132 = (char *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6B4C8]), sel_init);
      if (one-time initialization token for framework != -1)
        swift_once();
      v65 = type metadata accessor for Logger();
      __swift_project_value_buffer(v65, (uint64_t)static Logs.framework);
      swift_retain();
      v66 = Logger.logObject.getter();
      v67 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v66, v67))
      {
        v68 = (_DWORD *)swift_slowAlloc();
        v126 = v22;
        v69 = v68;
        *v68 = 33554944;
        LOWORD(state64[0]) = *(_WORD *)(v30 + *(int *)(v131 + 20));
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *((_WORD *)v69 + 3) = 2048;
        v131 = (uint64_t)(v69 + 2);
        outlined init with copy of RegistryCrux.RefreshTimings(v30, (uint64_t)v28, type metadata accessor for RegistryCrux.RefreshTimings);
        static ContinuousClock.now.getter();
        ContinuousClock.Instant.duration(to:)();
        (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v126);
        v70 = Duration.components.getter();
        v72 = (double)v70 * 1000.0 + (double)v71 * 1.0e-15;
        outlined destroy of RegistryCrux.RefreshTimings((uint64_t)v28, type metadata accessor for RegistryCrux.RefreshTimings);
        *(double *)state64 = v72;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        _os_log_impl(&dword_2433AF000, v66, v67, "#refresh_%hx t%fms Daemon is idle, creating empty collection", (uint8_t *)v69, 0x10u);
        MEMORY[0x2494F8478](v69, -1, -1);

      }
      else
      {

        swift_release();
      }
      v83 = v132;
      RegistryCrux.assignNewState(_:)(v132, 0, v38);
      goto LABEL_45;
    }
    outlined init with copy of RegistryCrux.RefreshTimings(v30, (uint64_t)v28, type metadata accessor for RegistryCrux.RefreshTimings);
    static ContinuousClock.now.getter();
    ContinuousClock.Instant.duration(to:)();
    v42 = *(void (**)(char *, uint64_t))(v23 + 8);
    v126 = v22;
    v42(v25, v22);
    refreshed = Duration.components.getter();
    v44 = v43;
    outlined destroy of RegistryCrux.RefreshTimings((uint64_t)v28, type metadata accessor for RegistryCrux.RefreshTimings);
    if ((RegistryCrux.hasInternalDiagnostics.getter() & 1) != 0 && RegistryCrux.tailspinsEnabled.getter())
    {
      v45 = objc_msgSend((id)objc_opt_self(), sel_instance);
      objc_msgSend(v45, sel_beginFetchIntervalTrace);

    }
    Registry = RegistryCrux.definitelyFetchRegistryState()();
    v118 = v46;
    v116 = v47;
    outlined init with copy of RegistryCrux.RefreshTimings(v30, (uint64_t)v28, type metadata accessor for RegistryCrux.RefreshTimings);
    static ContinuousClock.now.getter();
    ContinuousClock.Instant.duration(to:)();
    v115 = v42;
    v42(v25, v126);
    v48 = Duration.components.getter();
    v50 = v49;
    outlined destroy of RegistryCrux.RefreshTimings((uint64_t)v28, type metadata accessor for RegistryCrux.RefreshTimings);
    v51 = RegistryCrux.minElapsedToFireMs.getter();
    v52 = RegistryCrux.maxElapsedToFireMs.getter();
    if (v51 <= v52)
    {
      v53 = v52;
      v2 = 1.0e-15;
      v1 = (double)v48 * 1000.0 + (double)v50 * 1.0e-15 - ((double)refreshed * 1000.0 + (double)v44 * 1.0e-15);
      v54 = objc_msgSend((id)objc_opt_self(), sel_instance);
      v55 = v54;
      if (v51 > v1 || v1 > v53)
      {
        objc_msgSend(v54, sel_cancelFetchIntervalTrace);

      }
      else
      {
        objc_msgSend(v54, sel_endFetchIntervalTrace);

        RegistryCrux.synchronousUntypedService(tag:)(0xD000000000000016, 0x80000002433C92C0, state64);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCPairingDelegate);
        swift_dynamicCast();
        objc_msgSend(*(id *)&v134, sel_xpcTriggerTailspinFrom_forApp_, v124, 0);
        swift_unknownObjectRelease();
      }
      refreshed = v131;
      v73 = (uint64_t *)v132;
      if ((*(_BYTE *)(v3 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux____lazy_storage___hasInternalDiagnostics) & 1) == 0)
      {
LABEL_40:
        if (one-time initialization token for framework == -1)
        {
LABEL_41:
          v104 = type metadata accessor for Logger();
          __swift_project_value_buffer(v104, (uint64_t)static Logs.framework);
          swift_retain();
          v105 = Logger.logObject.getter();
          v106 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v105, v106))
          {
            v107 = (_DWORD *)swift_slowAlloc();
            v108 = refreshed;
            v109 = v107;
            *v107 = 33555200;
            LOWORD(v134) = *(_WORD *)(v30 + *(int *)(v108 + 20));
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *((_WORD *)v109 + 3) = 2048;
            outlined init with copy of RegistryCrux.RefreshTimings(v30, (uint64_t)v28, type metadata accessor for RegistryCrux.RefreshTimings);
            static ContinuousClock.now.getter();
            ContinuousClock.Instant.duration(to:)();
            v115(v25, v126);
            v110 = Duration.components.getter();
            v112 = (double)v110 * 1000.0 + (double)v111 * v2;
            outlined destroy of RegistryCrux.RefreshTimings((uint64_t)v28, type metadata accessor for RegistryCrux.RefreshTimings);
            v134 = v112;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_release();
            *((_WORD *)v109 + 8) = 2048;
            v134 = v1;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            _os_log_impl(&dword_2433AF000, v105, v106, "#refresh_%hx t%fms definitelyFetchRegistryState complete. %fms", (uint8_t *)v109, 0x1Au);
            MEMORY[0x2494F8478](v109, -1, -1);

          }
          else
          {

            swift_release();
          }
          v113 = Registry;
          v83 = v118;
          RegistryCrux.assignNewState(_:)(Registry, v118, v116);

LABEL_45:
          return;
        }
LABEL_48:
        swift_once();
        goto LABEL_41;
      }
      v124 = v30;
      v74 = v118;
      v75 = v118;
      v76 = Registry;
      RegistryState.LoggingInfo.init(_:)(v76, v74, v116, v73);
      v77 = v3 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_lastLoggedInfo;
      swift_beginAccess();
      v78 = v125;
      outlined init with copy of RegistryState.LoggingInfo?(v77, v125, &demangling cache variable for type metadata for RegistryState.LoggingInfo?);
      v79 = v130;
      v80 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v129 + 48);
      v81 = v80(v78, 1, v130);
      outlined destroy of UUID?(v78, &demangling cache variable for type metadata for RegistryState.LoggingInfo?);
      v82 = v128;
      outlined init with copy of RegistryCrux.RefreshTimings((uint64_t)v73, v128, (uint64_t (*)(_QWORD))type metadata accessor for RegistryState.LoggingInfo);
      if (v81 == 1)
      {
        outlined destroy of RegistryCrux.RefreshTimings(v82, (uint64_t (*)(_QWORD))type metadata accessor for RegistryState.LoggingInfo);
        v30 = v124;
        goto LABEL_33;
      }
      v84 = v119;
      outlined init with copy of RegistryState.LoggingInfo?(v77, (uint64_t)v119, &demangling cache variable for type metadata for RegistryState.LoggingInfo?);
      v85 = v80((uint64_t)v84, 1, v79);
      v30 = v124;
      if (v85 != 1)
      {
        v86 = (uint64_t)v84;
        v87 = v128;
        v88 = RegistryState.LoggingInfo.shouldLog(last:)(v84);
        outlined destroy of RegistryCrux.RefreshTimings(v87, (uint64_t (*)(_QWORD))type metadata accessor for RegistryState.LoggingInfo);
        outlined destroy of RegistryCrux.RefreshTimings(v86, (uint64_t (*)(_QWORD))type metadata accessor for RegistryState.LoggingInfo);
        refreshed = v131;
        if ((v88 & 1) == 0)
        {
LABEL_39:
          outlined destroy of RegistryCrux.RefreshTimings((uint64_t)v73, (uint64_t (*)(_QWORD))type metadata accessor for RegistryState.LoggingInfo);
          goto LABEL_40;
        }
LABEL_33:
        v89 = v120;
        outlined init with copy of RegistryCrux.RefreshTimings((uint64_t)v73, v120, (uint64_t (*)(_QWORD))type metadata accessor for RegistryState.LoggingInfo);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v129 + 56))(v89, 0, 1, v130);
        v90 = v89;
        v91 = v121;
        outlined init with take of RegistryState.LoggingInfo?(v90, v121, &demangling cache variable for type metadata for RegistryState.LoggingInfo?);
        swift_beginAccess();
        outlined assign with take of RegistryState.LoggingInfo?(v91, v77, &demangling cache variable for type metadata for RegistryState.LoggingInfo?);
        swift_endAccess();
        if (one-time initialization token for framework != -1)
          swift_once();
        v92 = type metadata accessor for Logger();
        __swift_project_value_buffer(v92, (uint64_t)static Logs.framework);
        v93 = v122;
        outlined init with copy of RegistryCrux.RefreshTimings((uint64_t)v73, (uint64_t)v122, (uint64_t (*)(_QWORD))type metadata accessor for RegistryState.LoggingInfo);
        v94 = v123;
        outlined init with copy of RegistryCrux.RefreshTimings((uint64_t)v73, v123, (uint64_t (*)(_QWORD))type metadata accessor for RegistryState.LoggingInfo);
        v95 = v127;
        outlined init with copy of RegistryCrux.RefreshTimings((uint64_t)v73, v127, (uint64_t (*)(_QWORD))type metadata accessor for RegistryState.LoggingInfo);
        swift_retain();
        v96 = Logger.logObject.getter();
        v97 = static os_log_type_t.default.getter();
        v98 = v97;
        if (os_log_type_enabled(v96, v97))
        {
          v99 = swift_slowAlloc();
          *(_DWORD *)v99 = 33555456;
          LOWORD(v134) = *(_WORD *)(v30 + *(int *)(v131 + 20));
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release();
          *(_WORD *)(v99 + 6) = 2048;
          LODWORD(v130) = v98;
          v100 = v94;
          v101 = *v93;
          outlined destroy of RegistryCrux.RefreshTimings((uint64_t)v93, (uint64_t (*)(_QWORD))type metadata accessor for RegistryState.LoggingInfo);
          v134 = *(double *)&v101;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v99 + 16) = 2048;
          v102 = *(double *)(v100 + 8);
          outlined destroy of RegistryCrux.RefreshTimings(v100, (uint64_t (*)(_QWORD))type metadata accessor for RegistryState.LoggingInfo);
          v134 = v102;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v99 + 26) = 2048;
          v103 = *(double *)(v127 + 16);
          outlined destroy of RegistryCrux.RefreshTimings(v127, (uint64_t (*)(_QWORD))type metadata accessor for RegistryState.LoggingInfo);
          v134 = v103;
          refreshed = v131;
          v73 = (uint64_t *)v132;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl(&dword_2433AF000, v96, (os_log_type_t)v130, "#refresh_%hx Device collection info after definitelyFetchRegistryState: %ld total %ld paired %ld active", (uint8_t *)v99, 0x24u);
          MEMORY[0x2494F8478](v99, -1, -1);
        }
        else
        {
          outlined destroy of RegistryCrux.RefreshTimings(v95, (uint64_t (*)(_QWORD))type metadata accessor for RegistryState.LoggingInfo);
          outlined destroy of RegistryCrux.RefreshTimings(v94, (uint64_t (*)(_QWORD))type metadata accessor for RegistryState.LoggingInfo);
          outlined destroy of RegistryCrux.RefreshTimings((uint64_t)v93, (uint64_t (*)(_QWORD))type metadata accessor for RegistryState.LoggingInfo);
          swift_release();
          refreshed = v131;
        }

        goto LABEL_39;
      }
      goto LABEL_50;
    }
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if (one-time initialization token for framework != -1)
    swift_once();
  v56 = type metadata accessor for Logger();
  __swift_project_value_buffer(v56, (uint64_t)static Logs.framework);
  swift_retain();
  v57 = Logger.logObject.getter();
  v58 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v57, v58))
  {
    v59 = (_DWORD *)swift_slowAlloc();
    v60 = refreshed;
    v61 = v59;
    *v59 = 33554944;
    LOWORD(state64[0]) = *(_WORD *)(v30 + *(int *)(v60 + 20));
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *((_WORD *)v61 + 3) = 2048;
    v132 = (char *)(v61 + 2);
    outlined init with copy of RegistryCrux.RefreshTimings(v30, (uint64_t)v28, type metadata accessor for RegistryCrux.RefreshTimings);
    static ContinuousClock.now.getter();
    ContinuousClock.Instant.duration(to:)();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
    v62 = Duration.components.getter();
    v64 = (double)v62 * 1000.0 + (double)v63 * 1.0e-15;
    outlined destroy of RegistryCrux.RefreshTimings((uint64_t)v28, type metadata accessor for RegistryCrux.RefreshTimings);
    *(double *)state64 = v64;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl(&dword_2433AF000, v57, v58, "#refresh_%hx t%fms Refresh appears unnecessary", (uint8_t *)v61, 0x10u);
    MEMORY[0x2494F8478](v61, -1, -1);

  }
  else
  {

    swift_release();
  }
}

void RegistryCrux.assignNewState(_:)(void *a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  os_unfair_lock_s *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  _BOOL4 v43;
  _DWORD *v44;
  uint64_t v45;
  _DWORD *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint64_t v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  id v73;
  id v74;
  unint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t refreshed;
  uint64_t v84;
  void *v85;
  double v86;
  uint64_t v87[4];

  v4 = v3;
  v8 = type metadata accessor for ContinuousClock.Instant();
  v78 = *(_QWORD *)(v8 - 8);
  v79 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v76 = (char *)&v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  refreshed = type metadata accessor for RegistryCrux.RefreshTimings(0);
  MEMORY[0x24BDAC7A8](refreshed);
  v77 = (uint64_t)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
  v12 = *(os_unfair_lock_s **)(v4 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock);
  swift_retain();
  os_unfair_lock_lock(v12 + 4);
  swift_release();
  v87[0] = MEMORY[0x24BEE4AF8];
  v13 = swift_retain();
  specialized WeakCollection.sweep(action:)(v13, v87);
  swift_release();
  v14 = v87[0];
  v15 = (_QWORD *)(v4 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_);
  v16 = *(void **)(v4 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_);
  v17 = *(void **)(v4 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 8);
  v75 = *(_QWORD *)(v4 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 16);
  *v15 = a1;
  v15[1] = a2;
  v15[2] = a3;
  v18 = *(os_unfair_lock_s **)(v4 + v11);
  swift_retain();
  v19 = v16;
  v20 = v17;
  v21 = a1;
  v85 = a2;
  v22 = a2;
  v81 = v19;
  os_unfair_lock_unlock(v18 + 4);
  swift_release();
  if (one-time initialization token for framework != -1)
    swift_once();
  v23 = type metadata accessor for Logger();
  v24 = __swift_project_value_buffer(v23, (uint64_t)static Logs.framework);
  swift_retain();
  v84 = v24;
  v25 = Logger.logObject.getter();
  v26 = static os_log_type_t.default.getter();
  v27 = os_log_type_enabled(v25, v26);
  v80 = v4;
  v82 = a3;
  if (v27)
  {
    v28 = swift_slowAlloc();
    *(_DWORD *)v28 = 33554944;
    v74 = v21;
    v29 = v4 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_refreshTimings;
    swift_beginAccess();
    LOWORD(v87[0]) = *(_WORD *)(v29 + *(int *)(refreshed + 20));
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v28 + 6) = 2048;
    v73 = (id)(v28 + 8);
    v30 = v77;
    outlined init with copy of RegistryCrux.RefreshTimings(v29, v77, type metadata accessor for RegistryCrux.RefreshTimings);
    v31 = v76;
    static ContinuousClock.now.getter();
    ContinuousClock.Instant.duration(to:)();
    (*(void (**)(char *, uint64_t))(v78 + 8))(v31, v79);
    v21 = v74;
    v32 = Duration.components.getter();
    *(double *)&v34 = (double)v32 * 1000.0 + (double)v33 * 1.0e-15;
    outlined destroy of RegistryCrux.RefreshTimings(v30, type metadata accessor for RegistryCrux.RefreshTimings);
    v87[0] = v34;
    v4 = v80;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl(&dword_2433AF000, v25, v26, "#refresh_%hx t%fms New collection swapped in", (uint8_t *)v28, 0x10u);
    MEMORY[0x2494F8478](v28, -1, -1);

  }
  else
  {

    swift_release();
  }
  v35 = v21;
  v36 = v22;
  v37 = v81;
  v38 = v20;
  v39 = v35;
  v40 = v36;
  swift_retain();
  v41 = Logger.logObject.getter();
  v42 = static os_log_type_t.default.getter();
  v43 = os_log_type_enabled(v41, v42);
  v81 = v38;
  if (v43)
  {
    v44 = (_DWORD *)swift_slowAlloc();
    v74 = (id)v14;
    v45 = v4;
    v46 = v44;
    *v44 = 33555200;
    v47 = v38;
    v48 = v45 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_refreshTimings;
    swift_beginAccess();
    LOWORD(v87[0]) = *(_WORD *)(v48 + *(int *)(refreshed + 20));
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v14 = (unint64_t)v74;
    swift_release();
    *((_WORD *)v46 + 3) = 2048;

    v87[0] = v75 & 0x3FFFFFFFFFFFFFFFLL;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    *((_WORD *)v46 + 8) = 2048;
    v49 = v82;
    v87[0] = v82 & 0x3FFFFFFFFFFFFFFFLL;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl(&dword_2433AF000, v41, v42, "#refresh_%hx history %llu -> %llu", (uint8_t *)v46, 0x1Au);
    MEMORY[0x2494F8478](v46, -1, -1);
  }
  else
  {

    swift_release();
    v41 = v39;
    v49 = v82;
  }

  type metadata accessor for NRMutableDeviceCollection(0, (unint64_t *)&lazy cache variable for type metadata for NRMutableDeviceCollection);
  v50 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_diffFrom_to_, v37, v39);

  if (v50)
  {
    objc_opt_self();
    v51 = swift_dynamicCastObjCClass();
    if (v51)
    {
      v52 = (void *)v51;
      v75 = (unint64_t)v50;
      v74 = (id)(v14 >> 62);
      v73 = v37;
      if (v14 >> 62)
      {
        swift_bridgeObjectRetain();
        v53 = _CocoaArrayWrapper.endIndex.getter();
        if (v53)
          goto LABEL_13;
      }
      else
      {
        v53 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v53)
        {
LABEL_13:
          if (v53 < 1)
          {
            __break(1u);
            return;
          }
          v54 = 0;
          do
          {
            if ((v14 & 0xC000000000000001) != 0)
              v55 = (id)MEMORY[0x2494F7D64](v54, v14);
            else
              v55 = *(id *)(v14 + 8 * v54 + 32);
            v56 = v55;
            ++v54;
            type metadata accessor for Registry_Impl();
            swift_dynamicCastClassUnconditional();
            Registry_Impl.notify(deviceColletionDiff:state:)(v52, v39, v85, v49);

          }
          while (v53 != v54);
        }
      }
      swift_bridgeObjectRelease();
      v57 = v80;
      swift_retain_n();
      swift_bridgeObjectRetain();
      v58 = Logger.logObject.getter();
      v59 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v58, v59))
      {
        v60 = swift_slowAlloc();
        *(_DWORD *)v60 = 33555200;
        v61 = v57 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_refreshTimings;
        swift_beginAccess();
        v62 = *(_WORD *)(v61 + *(int *)(refreshed + 20));
        swift_release();
        LOWORD(v86) = v62;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        *(_WORD *)(v60 + 6) = 2048;
        v63 = v61;
        v64 = v77;
        outlined init with copy of RegistryCrux.RefreshTimings(v63, v77, type metadata accessor for RegistryCrux.RefreshTimings);
        v65 = v76;
        static ContinuousClock.now.getter();
        ContinuousClock.Instant.duration(to:)();
        (*(void (**)(char *, uint64_t))(v78 + 8))(v65, v79);
        v66 = Duration.components.getter();
        v68 = (double)v66 * 1000.0 + (double)v67 * 1.0e-15;
        outlined destroy of RegistryCrux.RefreshTimings(v64, type metadata accessor for RegistryCrux.RefreshTimings);
        v86 = v68;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        *(_WORD *)(v60 + 16) = 2048;
        if (v74)
        {
          swift_bridgeObjectRetain();
          v69 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
        }
        else
        {
          v69 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        v37 = v73;
        swift_bridgeObjectRelease();
        v86 = *(double *)&v69;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2433AF000, v58, v59, "#refresh_%hx t%fms %ld Registries informed", (uint8_t *)v60, 0x1Au);
        MEMORY[0x2494F8478](v60, -1, -1);

        swift_unknownObjectRelease();
      }
      else
      {

        swift_unknownObjectRelease();
        swift_release_n();
        swift_bridgeObjectRelease_n();
        v37 = v73;
      }
      goto LABEL_28;
    }
    swift_unknownObjectRelease();
  }
  swift_bridgeObjectRelease();
LABEL_28:
  v70 = Logger.logObject.getter();
  v71 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v70, v71))
  {
    v72 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v72 = 0;
    _os_log_impl(&dword_2433AF000, v70, v71, "assignNewState complete", v72, 2u);
    MEMORY[0x2494F8478](v72, -1, -1);
  }

}

id RegistryCrux.definitelyFetchRegistryState()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void **v5;
  uint64_t v6;
  __int128 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t Registry;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id result;
  uint64_t v20;
  double v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  os_log_t v34;
  id v35;
  id v36;
  __int128 v37;
  uint64_t v38;
  void **v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t refreshed;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  os_log_t v47;
  __int128 aBlock;
  void (*v49)(uint64_t, void *, void *, uint64_t, uint64_t);
  void *v50;
  void (*v51)(void *, void *, uint64_t, char);
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  char v56;

  v1 = v0;
  v45 = type metadata accessor for ContinuousClock.Instant();
  v44 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v43 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  refreshed = type metadata accessor for RegistryCrux.RefreshTimings(0);
  MEMORY[0x24BDAC7A8](refreshed);
  v41 = (uint64_t)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = 0u;
  v55 = 0u;
  v56 = 1;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = 0;
  v5 = (void **)(v4 + 16);
  *(_QWORD *)(v4 + 24) = 0;
  *(_QWORD *)(v4 + 32) = 0;
  v6 = v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_refreshTimings;
  swift_beginAccess();
  swift_beginAccess();
  v40 = v6;
  swift_beginAccess();
  *(_QWORD *)&v7 = 33555200;
  v37 = v7;
  v39 = (void **)(v4 + 16);
  v38 = MEMORY[0x24BEE4AD8] + 8;
  while (1)
  {
    RegistryCrux.synchronousUntypedService(tag:)(0xD00000000000001ELL, 0x80000002433C91E0, &aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCRegistryDelegate);
    swift_dynamicCast();
    v9 = v53;
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v1;
    *(_QWORD *)(v10 + 24) = v4;
    v51 = partial apply for closure #1 in RegistryCrux.definitelyFetchRegistryState();
    v52 = v10;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v49 = thunk for @escaping @callee_guaranteed (@guaranteed NRMutableDeviceCollection?, @guaranteed NRSecureDevicePropertyStore?, @unowned UInt64, @unowned Bool) -> ();
    v50 = &block_descriptor_0;
    v11 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_xpcGetDeviceCollectionWithBlock_, v11);
    _Block_release(v11);
    if (*(_QWORD *)(v4 + 16))
      goto LABEL_2;
    Registry = specialized getter of sleeper #1 in RegistryCrux.definitelyFetchRegistryState()((uint64_t)&v54);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    result = objc_msgSend((id)objc_opt_self(), sel_sleepForTimeInterval_, v17);
    v20 = Registry + 1;
    if (__OFADD__(Registry, 1))
      break;
    v21 = v18 * 2.37137;
    if (v18 * 2.37137 > 0.01)
      v21 = 0.01;
    *(double *)&v55 = v16 + v18;
    *((double *)&v55 + 1) = v21;
    v56 = 0;
    *(_QWORD *)&v54 = Registry + 1;
    *((_QWORD *)&v54 + 1) = v14 << (v20 >= v14);
    if (v20 >= v14)
    {
      if (one-time initialization token for framework != -1)
        swift_once();
      v22 = type metadata accessor for Logger();
      __swift_project_value_buffer(v22, (uint64_t)static Logs.framework);
      swift_retain();
      v23 = Logger.logObject.getter();
      v24 = static os_log_type_t.default.getter();
      v25 = v24;
      if (os_log_type_enabled(v23, v24))
      {
        v26 = swift_slowAlloc();
        *(_DWORD *)v26 = v37;
        v27 = v40;
        *(_WORD *)(v26 + 4) = *(_WORD *)(v40 + *(int *)(refreshed + 20));
        *(_WORD *)(v26 + 6) = 2048;
        v47 = v23;
        v28 = v41;
        outlined init with copy of RegistryCrux.RefreshTimings(v27, v41, type metadata accessor for RegistryCrux.RefreshTimings);
        v29 = v43;
        static ContinuousClock.now.getter();
        ContinuousClock.Instant.duration(to:)();
        v46 = v25;
        v30 = v29;
        v5 = v39;
        (*(void (**)(char *, uint64_t))(v44 + 8))(v30, v45);
        v31 = Duration.components.getter();
        v33 = (double)v31 * 1000.0 + (double)v32 * 1.0e-15;
        outlined destroy of RegistryCrux.RefreshTimings(v28, type metadata accessor for RegistryCrux.RefreshTimings);
        *(double *)(v26 + 8) = v33;
        swift_release();
        *(_WORD *)(v26 + 16) = 2048;
        *(_QWORD *)(v26 + 18) = v54;
        v34 = v47;
        _os_log_impl(&dword_2433AF000, v47, (os_log_type_t)v46, "#refresh_%hx t%fms definitelyFetchRegistryState at %ld retries", (uint8_t *)v26, 0x1Au);
        MEMORY[0x2494F8478](v26, -1, -1);
        swift_unknownObjectRelease();

      }
      else
      {

        swift_unknownObjectRelease();
        swift_release();
      }
      goto LABEL_3;
    }
LABEL_2:
    swift_unknownObjectRelease();
LABEL_3:
    v8 = *v5;
    if (*v5)
    {
      v35 = *(id *)(v4 + 24);
      v36 = v8;
      swift_release();
      return v36;
    }
  }
  __break(1u);
  return result;
}

uint64_t specialized getter of sleeper #1 in RegistryCrux.definitelyFetchRegistryState()(uint64_t a1)
{
  uint64_t result;

  if ((*(_BYTE *)(a1 + 32) & 1) == 0)
    return *(_QWORD *)a1;
  swift_beginAccess();
  result = 0;
  *(_OWORD *)a1 = xmmword_2433C8000;
  *(_OWORD *)(a1 + 16) = xmmword_2433C8010;
  *(_BYTE *)(a1 + 32) = 0;
  return result;
}

void closure #1 in RegistryCrux.definitelyFetchRegistryState()(void *a1, void *a2, uint64_t a3, char a4, uint64_t a5, _QWORD *a6)
{
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;

  if ((a4 & 1) != 0)
  {
    if (a1)
    {
      swift_beginAccess();
      v10 = (void *)a6[2];
      v11 = (void *)a6[3];
      a6[2] = a1;
      a6[3] = a2;
      a6[4] = a3;
      v12 = a2;
      v13 = a1;
      outlined consume of RegistryState?(v10, v11);
      return;
    }
    __break(1u);
  }
  if ((RegistryCrux.hasInternalDiagnostics.getter() & 1) != 0)
  {
    if (one-time initialization token for framework != -1)
      swift_once();
    v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)static Logs.framework);
    v15 = Logger.logObject.getter();
    v16 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_2433AF000, v15, v16, "Process is not entitled to access PairedDeviceRegistry - This process is about to crash", v17, 2u);
      MEMORY[0x2494F8478](v17, -1, -1);
    }

  }
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void thunk for @escaping @callee_guaranteed (@guaranteed NRMutableDeviceCollection?, @guaranteed NRSecureDevicePropertyStore?, @unowned UInt64, @unowned Bool) -> ()(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  void (*v9)(void *, void *, uint64_t, uint64_t);
  id v10;
  id v11;

  v9 = *(void (**)(void *, void *, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v11 = a2;
  v10 = a3;
  v9(a2, a3, a4, a5);
  swift_release();

}

uint64_t RegistryCrux.deinit()
{
  uint64_t v0;
  void *v1;

  swift_release();

  outlined destroy of RegistryCrux.RefreshTimings(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_refreshTimings, type metadata accessor for RegistryCrux.RefreshTimings);
  outlined destroy of UUID?(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_lastLoggedInfo, &demangling cache variable for type metadata for RegistryState.LoggingInfo?);
  swift_release();
  v1 = *(void **)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 8);

  swift_release();
  outlined destroy of UUID?(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_serviceShadow_, &demangling cache variable for type metadata for Any?);
  return v0;
}

uint64_t RegistryCrux.__deallocating_deinit()
{
  RegistryCrux.deinit();
  return swift_deallocClassInstance();
}

uint64_t ObjC metadata update function for RegistryCrux()
{
  return type metadata accessor for RegistryCrux(0);
}

uint64_t type metadata accessor for RegistryCrux(uint64_t a1)
{
  return type metadata accessor for RegistryCrux(a1, (uint64_t *)&type metadata singleton initialization cache for RegistryCrux);
}

void type metadata completion function for RegistryCrux()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for RegistryCrux.RefreshTimings(319);
  if (v0 <= 0x3F)
  {
    type metadata accessor for RegistryState.LoggingInfo?();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t type metadata accessor for RegistryCrux.RefreshTimings(uint64_t a1)
{
  return type metadata accessor for RegistryCrux(a1, (uint64_t *)&type metadata singleton initialization cache for RegistryCrux.RefreshTimings);
}

uint64_t type metadata accessor for RegistryCrux(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void type metadata accessor for RegistryState.LoggingInfo?()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for RegistryState.LoggingInfo?)
  {
    type metadata accessor for RegistryState.LoggingInfo();
    v0 = type metadata accessor for Optional();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for RegistryState.LoggingInfo?);
  }
}

id one-time initialization function for unifiedRemoteObjectInterface()
{
  id result;

  result = closure #1 in variable initialization expression of static RegistryCrux.unifiedRemoteObjectInterface();
  static RegistryCrux.unifiedRemoteObjectInterface = (uint64_t)result;
  return result;
}

id closure #1 in variable initialization expression of static RegistryCrux.unifiedRemoteObjectInterface()
{
  id result;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  Class isa;

  objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_2572B0CB8);
  result = objc_msgSend((id)objc_opt_self(), sel_enclosedClassTypes);
  if (!result)
  {
    __break(1u);
    goto LABEL_5;
  }
  v1 = result;
  v2 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  specialized _copyCollectionToContiguousArray<A>(_:)(v2);
  swift_bridgeObjectRelease();
  result = objc_msgSend((id)objc_opt_self(), sel_enclosedClassTypes);
  if (!result)
  {
LABEL_5:
    __break(1u);
    goto LABEL_6;
  }
  v3 = result;
  v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  specialized Array.append<A>(contentsOf:)(v4);
  v5 = swift_bridgeObjectRetain();
  specialized _arrayForceCast<A, B>(_:)(v5);
  swift_bridgeObjectRelease();
  v6 = objc_allocWithZone(MEMORY[0x24BDBCF20]);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_initWithArray_, isa);

  result = (id)static Set._forceBridgeFromObjectiveC(_:result:)();
LABEL_6:
  __break(1u);
  __break(1u);
  __break(1u);
  return result;
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD **v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  int64_t v7;
  int64_t v8;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t result;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  int64_t v29;
  _QWORD *v30;
  int64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  __int128 v37;
  int64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  _QWORD v53[2];
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;

  v5 = *(_QWORD *)(a1 + 16);
  v6 = *v2;
  v7 = (*v2)[2];
  v8 = v7 + v5;
  if (__OFADD__(v7, v5))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v3 = a1;
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  *v2 = v6;
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v10 = v6[3] >> 1, v10 < v8))
  {
    if (v7 <= v8)
      v11 = v7 + v5;
    else
      v11 = v7;
    v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v11, 1, v6);
    *v2 = v6;
    v10 = v6[3] >> 1;
  }
  v12 = v6[2];
  v13 = v10 - v12;
  v14 = specialized Sequence._copySequenceContents(initializing:)((uint64_t)v53, (uint64_t)&v6[5 * v12 + 4], v10 - v12, v3);
  if (v14 < v5)
    goto LABEL_15;
  if (v14)
  {
    v15 = v6[2];
    v16 = __OFADD__(v15, v14);
    v17 = v15 + v14;
    if (v16)
    {
      __break(1u);
LABEL_20:
      v22 = v13 + 1;
      if (__OFADD__(v13, 1))
      {
        __break(1u);
      }
      else
      {
        v21 = v54;
        v23 = (unint64_t)(v54 + 64) >> 6;
        v3 = v13;
        if (v22 >= v23)
          goto LABEL_41;
        v24 = *(_QWORD *)(v42 + 8 * v22);
        if (v24)
        {
LABEL_23:
          v19 = (v24 - 1) & v24;
          v20 = __clz(__rbit64(v24)) + (v22 << 6);
          v13 = v22;
          goto LABEL_18;
        }
        v25 = v13 + 2;
        v3 = v13 + 1;
        if (v13 + 2 >= v23)
          goto LABEL_41;
        v1 = v54;
        v24 = *(_QWORD *)(v42 + 8 * v25);
        if (v24)
        {
LABEL_26:
          v22 = v25;
LABEL_27:
          v21 = v54;
          goto LABEL_23;
        }
        v3 = v13 + 2;
        if (v13 + 3 >= v23)
          goto LABEL_41;
        v24 = *(_QWORD *)(v42 + 8 * (v13 + 3));
        if (v24)
        {
          v22 = v13 + 3;
          goto LABEL_27;
        }
        v25 = v13 + 4;
        v3 = v13 + 3;
        v21 = v54;
        if (v13 + 4 >= v23)
          goto LABEL_41;
        v24 = *(_QWORD *)(v42 + 8 * v25);
        if (v24)
          goto LABEL_26;
        v22 = v13 + 5;
        v3 = v13 + 4;
        v21 = v54;
        if (v13 + 5 >= v23)
        {
LABEL_41:
          v19 = 0;
          v52 = 0;
          v50 = 0u;
          v51 = 0u;
          goto LABEL_42;
        }
        v24 = *(_QWORD *)(v42 + 8 * v22);
        if (v24)
          goto LABEL_23;
        v3 = v23 - 1;
        v26 = v13 + 6;
        while (v23 != v26)
        {
          v24 = *(_QWORD *)(v42 + 8 * v26++);
          if (v24)
          {
            v22 = v26 - 1;
            goto LABEL_27;
          }
        }
      }
      v21 = v1;
      goto LABEL_41;
    }
    v6[2] = v17;
  }
  if (v14 != v13)
    return outlined consume of Set<AnyHashable>.Iterator._Variant();
LABEL_16:
  v4 = v6[2];
  v6 = (_QWORD *)v53[0];
  v42 = v53[1];
  v13 = v55;
  if (!v56)
    goto LABEL_20;
  v19 = (v56 - 1) & v56;
  v20 = __clz(__rbit64(v56)) | (v55 << 6);
  v21 = v54;
LABEL_18:
  outlined init with copy of AnyHashable(v6[6] + 40 * v20, (uint64_t)&v50);
  v3 = v13;
LABEL_42:
  outlined init with copy of RegistryState.LoggingInfo?((uint64_t)&v50, (uint64_t)&v47, (uint64_t *)&demangling cache variable for type metadata for AnyHashable?);
  if (!*((_QWORD *)&v48 + 1))
  {
LABEL_80:
    outlined destroy of UUID?((uint64_t)&v50, (uint64_t *)&demangling cache variable for type metadata for AnyHashable?);
    outlined consume of Set<AnyHashable>.Iterator._Variant();
    return outlined destroy of UUID?((uint64_t)&v47, (uint64_t *)&demangling cache variable for type metadata for AnyHashable?);
  }
  v43 = (unint64_t)(v21 + 64) >> 6;
  while (1)
  {
    outlined destroy of UUID?((uint64_t)&v47, (uint64_t *)&demangling cache variable for type metadata for AnyHashable?);
    v27 = *v2;
    v28 = (*v2)[3];
    v29 = v28 >> 1;
    if ((uint64_t)(v28 >> 1) < v4 + 1)
    {
      v27 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v28 > 1), v4 + 1, 1, *v2);
      *v2 = v27;
      v29 = v27[3] >> 1;
    }
    outlined init with copy of RegistryState.LoggingInfo?((uint64_t)&v50, (uint64_t)&v44, (uint64_t *)&demangling cache variable for type metadata for AnyHashable?);
    if (*((_QWORD *)&v45 + 1))
      break;
    v34 = v3;
LABEL_79:
    outlined destroy of UUID?((uint64_t)&v44, (uint64_t *)&demangling cache variable for type metadata for AnyHashable?);
    v3 = v34;
    v31 = v4;
LABEL_45:
    (*v2)[2] = v31;
    outlined init with copy of RegistryState.LoggingInfo?((uint64_t)&v50, (uint64_t)&v47, (uint64_t *)&demangling cache variable for type metadata for AnyHashable?);
    if (!*((_QWORD *)&v48 + 1))
      goto LABEL_80;
  }
  v30 = v27 + 4;
  if (v4 <= v29)
    v31 = v29;
  else
    v31 = v4;
  while (1)
  {
    v47 = v44;
    v48 = v45;
    v49 = v46;
    if (v4 == v31)
    {
      outlined destroy of AnyHashable((uint64_t)&v47);
      v4 = v31;
      goto LABEL_45;
    }
    result = outlined destroy of UUID?((uint64_t)&v50, (uint64_t *)&demangling cache variable for type metadata for AnyHashable?);
    v35 = &v30[5 * v4];
    v36 = v49;
    v37 = v48;
    *(_OWORD *)v35 = v47;
    *((_OWORD *)v35 + 1) = v37;
    v35[4] = v36;
    if (!v19)
      break;
    v32 = __clz(__rbit64(v19));
    v19 &= v19 - 1;
    v33 = v32 | (v3 << 6);
LABEL_53:
    outlined init with copy of AnyHashable(v6[6] + 40 * v33, (uint64_t)&v50);
    v34 = v3;
LABEL_54:
    ++v4;
    outlined init with copy of RegistryState.LoggingInfo?((uint64_t)&v50, (uint64_t)&v44, (uint64_t *)&demangling cache variable for type metadata for AnyHashable?);
    if (!*((_QWORD *)&v45 + 1))
      goto LABEL_79;
  }
  v38 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v38 >= v43)
    {
      v34 = v3;
LABEL_62:
      v19 = 0;
      v52 = 0;
      v3 = v34;
      v50 = 0u;
      v51 = 0u;
      goto LABEL_54;
    }
    v39 = *(_QWORD *)(v42 + 8 * v38);
    if (v39)
      goto LABEL_60;
    v40 = v3 + 2;
    v34 = v3 + 1;
    if (v3 + 2 >= v43)
      goto LABEL_62;
    v39 = *(_QWORD *)(v42 + 8 * v40);
    if (!v39)
    {
      v34 = v3 + 2;
      if (v3 + 3 >= v43)
        goto LABEL_62;
      v39 = *(_QWORD *)(v42 + 8 * (v3 + 3));
      if (v39)
      {
        v38 = v3 + 3;
        goto LABEL_60;
      }
      v40 = v3 + 4;
      v34 = v3 + 3;
      if (v3 + 4 >= v43)
        goto LABEL_62;
      v39 = *(_QWORD *)(v42 + 8 * v40);
      if (!v39)
      {
        v38 = v3 + 5;
        v34 = v3 + 4;
        if (v3 + 5 >= v43)
          goto LABEL_62;
        v39 = *(_QWORD *)(v42 + 8 * v38);
        if (!v39)
        {
          v41 = v3 + 6;
          while (v43 != v41)
          {
            v39 = *(_QWORD *)(v42 + 8 * v41++);
            if (v39)
            {
              v38 = v41 - 1;
              goto LABEL_60;
            }
          }
          v34 = v43 - 1;
          goto LABEL_62;
        }
        goto LABEL_60;
      }
    }
    v38 = v40;
LABEL_60:
    v19 = (v39 - 1) & v39;
    v33 = __clz(__rbit64(v39)) + (v38 << 6);
    v3 = v38;
    goto LABEL_53;
  }
  __break(1u);
  return result;
}

uint64_t specialized _arrayForceCast<A, B>(_:)(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v10 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
    v4 = a1 + 32;
    v2 = v10;
    do
    {
      outlined init with copy of AnyHashable(v4, (uint64_t)&v8);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v10;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v5 > 1, v6 + 1, 1);
        v2 = v10;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      outlined init with take of Any(&v9, (_OWORD *)(v2 + 32 * v6 + 32));
      v4 += 40;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t RegistryCrux.connectionLocked()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t (*v10)();
  uint64_t v11;
  Swift::Bool v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t result;
  __int128 aBlock;
  __int128 v30;
  void *v31;
  uint64_t v32;

  v1 = v0;
  v2 = type metadata accessor for Logger();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_connectionShadow_;
  v7 = *(void **)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_connectionShadow_);
  if (v7)
  {
    v8 = *(id *)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_connectionShadow_);
LABEL_16:
    v27 = v7;
    return (uint64_t)v8;
  }
  aBlock = 0u;
  v30 = 0u;
  v9 = v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_serviceShadow_;
  swift_beginAccess();
  outlined assign with take of RegistryState.LoggingInfo?((uint64_t)&aBlock, v9, &demangling cache variable for type metadata for Any?);
  swift_endAccess();
  v10 = RegistryCrux.connectionSleeper_.modify();
  if ((*(_BYTE *)(v11 + 32) & 1) != 0)
  {
    ((void (*)(__int128 *, _QWORD))v10)(&aBlock, 0);
LABEL_13:
    v18 = objc_allocWithZone(MEMORY[0x24BDD1988]);
    v19 = (void *)MEMORY[0x2494F7BCC](0xD000000000000030, 0x80000002433C9860);
    v20 = objc_msgSend(v18, sel_initWithMachServiceName_options_, v19, 4096);

    if (one-time initialization token for unifiedRemoteObjectInterface != -1)
      swift_once();
    objc_msgSend(v20, sel_setRemoteObjectInterface_, static RegistryCrux.unifiedRemoteObjectInterface);
    v21 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_2572AF010);
    objc_msgSend(v20, sel_setExportedInterface_, v21);

    objc_msgSend(v20, sel_setExportedObject_, v1);
    v31 = partial apply for closure #1 in RegistryCrux.connectionLocked();
    v32 = v1;
    v22 = MEMORY[0x24BDAC760];
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v30 = thunk for @escaping @callee_guaranteed () -> ();
    *((_QWORD *)&v30 + 1) = &block_descriptor_87;
    v23 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v20, sel_setInvalidationHandler_, v23);
    _Block_release(v23);
    v31 = closure #2 in RegistryCrux.connectionLocked();
    v32 = 0;
    *(_QWORD *)&aBlock = v22;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v30 = thunk for @escaping @callee_guaranteed () -> ();
    *((_QWORD *)&v30 + 1) = &block_descriptor_90;
    v24 = _Block_copy(&aBlock);
    objc_msgSend(v20, sel_setInterruptionHandler_, v24);
    _Block_release(v24);
    v25 = v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_connectionSleeper_;
    swift_beginAccess();
    *(_OWORD *)v25 = 0u;
    *(_OWORD *)(v25 + 16) = 0u;
    *(_BYTE *)(v25 + 32) = 1;
    v26 = *(void **)(v1 + v6);
    *(_QWORD *)(v1 + v6) = v20;
    v8 = v20;

    objc_msgSend(v8, sel_activate);
    v7 = 0;
    goto LABEL_16;
  }
  v12 = RetrySleeper.sleep()();
  ((void (*)(__int128 *, _QWORD))v10)(&aBlock, 0);
  if (!v12)
    goto LABEL_13;
  if (one-time initialization token for framework != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v2, (uint64_t)static Logs.framework);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v13, v2);
  swift_retain();
  v14 = Logger.logObject.getter();
  v15 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v14, v15))
  {

    swift_release();
    goto LABEL_12;
  }
  v16 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)v16 = 134217984;
  v17 = v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_connectionSleeper_;
  swift_beginAccess();
  if ((*(_BYTE *)(v17 + 32) & 1) == 0)
  {
    *(_QWORD *)&aBlock = *(_QWORD *)v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl(&dword_2433AF000, v14, v15, "Slept %ld times on XPC connection construction", v16, 0xCu);
    MEMORY[0x2494F8478](v16, -1, -1);

LABEL_12:
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    goto LABEL_13;
  }
  result = swift_release();
  __break(1u);
  return result;
}

uint64_t closure #1 in RegistryCrux.connectionLocked()(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  os_unfair_lock_s *v14;
  _OWORD v16[2];

  if (one-time initialization token for framework != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Logs.framework);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2433AF000, v3, v4, "XPC connection is invalid. Retrying eventually.", v5, 2u);
    MEMORY[0x2494F8478](v5, -1, -1);
  }

  v6 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
  v7 = *(os_unfair_lock_s **)(a1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock);
  swift_retain();
  os_unfair_lock_lock(v7 + 4);
  swift_release();
  memset(v16, 0, sizeof(v16));
  v8 = a1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_serviceShadow_;
  swift_beginAccess();
  outlined assign with take of RegistryState.LoggingInfo?((uint64_t)v16, v8, &demangling cache variable for type metadata for Any?);
  swift_endAccess();
  v9 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_connectionShadow_;
  objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_connectionShadow_), sel_invalidate);
  v10 = *(void **)(a1 + v9);
  *(_QWORD *)(a1 + v9) = 0;

  v11 = a1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_connectionSleeper_;
  swift_beginAccess();
  if ((*(_BYTE *)(v11 + 32) & 1) != 0)
  {
    v12 = xmmword_2433C8010;
    v13 = xmmword_2433C8000;
  }
  else
  {
    v13 = *(_OWORD *)v11;
    v12 = *(_OWORD *)(v11 + 16);
  }
  *(_OWORD *)v11 = v13;
  *(_OWORD *)(v11 + 16) = v12;
  *(_BYTE *)(v11 + 32) = 0;
  v14 = *(os_unfair_lock_s **)(a1 + v6);
  swift_retain();
  os_unfair_lock_unlock(v14 + 4);
  return swift_release();
}

void closure #2 in RegistryCrux.connectionLocked()()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  NSObject *oslog;

  if (one-time initialization token for framework != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)static Logs.framework);
  oslog = Logger.logObject.getter();
  v1 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_2433AF000, oslog, v1, "XPC connection interrupted.", v2, 2u);
    MEMORY[0x2494F8478](v2, -1, -1);
  }

}

uint64_t RegistryCrux.synchronousUntypedService(tag:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  uint64_t result;
  os_unfair_lock_s *v17;
  _OWORD *v18;
  uint64_t v19;
  __int128 aBlock;
  void (*v21)(uint64_t, void *);
  void *v22;
  void (*v23)(void *);
  _QWORD *v24;
  _OWORD v25[2];

  v7 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
  v8 = *(os_unfair_lock_s **)(v3 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock);
  swift_retain();
  os_unfair_lock_lock(v8 + 4);
  swift_release();
  v9 = v3 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_serviceShadow_;
  swift_beginAccess();
  outlined init with copy of RegistryState.LoggingInfo?(v9, (uint64_t)&aBlock, &demangling cache variable for type metadata for Any?);
  if (v22)
  {
    outlined init with take of Any(&aBlock, a3);
LABEL_7:
    v17 = *(os_unfair_lock_s **)(v3 + v7);
    swift_retain();
    os_unfair_lock_unlock(v17 + 4);
    return swift_release();
  }
  v19 = v7;
  v18 = a3;
  outlined destroy of UUID?((uint64_t)&aBlock, &demangling cache variable for type metadata for Any?);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = 0u;
  *(_OWORD *)(v10 + 32) = 0u;
  *(_BYTE *)(v10 + 48) = 1;
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = 0;
  memset(v25, 0, sizeof(v25));
  swift_beginAccess();
  do
  {
    *(_BYTE *)(v11 + 16) = 0;
    v12 = (void *)RegistryCrux.connectionLocked()();
    v13 = (_QWORD *)swift_allocObject();
    v13[2] = v11;
    v13[3] = v10;
    v13[4] = a1;
    v13[5] = a2;
    v23 = partial apply for closure #1 in RegistryCrux.synchronousUntypedService(tag:);
    v24 = v13;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v21 = thunk for @escaping @callee_guaranteed (@guaranteed Error) -> ();
    v22 = &block_descriptor_84;
    v14 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_release();
    v15 = objc_msgSend(v12, sel_synchronousRemoteObjectProxyWithErrorHandler_, v14);
    _Block_release(v14);

    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    outlined destroy of UUID?((uint64_t)v25, &demangling cache variable for type metadata for Any?);
    outlined init with take of RegistryState.LoggingInfo?((uint64_t)&aBlock, (uint64_t)v25, &demangling cache variable for type metadata for Any?);
  }
  while ((*(_BYTE *)(v11 + 16) & 1) != 0);
  swift_beginAccess();
  outlined assign with copy of UUID?((uint64_t)v25, v9, &demangling cache variable for type metadata for Any?);
  swift_endAccess();
  result = outlined init with copy of RegistryState.LoggingInfo?((uint64_t)v25, (uint64_t)&aBlock, &demangling cache variable for type metadata for Any?);
  if (v22)
  {
    outlined destroy of UUID?((uint64_t)v25, &demangling cache variable for type metadata for Any?);
    outlined init with take of Any(&aBlock, v18);
    swift_release();
    swift_release();
    v7 = v19;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t getter of sleeper #1 in RegistryCrux.synchronousUntypedService(tag:)(uint64_t a1)
{
  uint64_t result;

  if ((*(_BYTE *)(a1 + 48) & 1) == 0)
    return *(_QWORD *)(a1 + 16);
  swift_beginAccess();
  result = 0;
  *(_OWORD *)(a1 + 16) = xmmword_2433C8000;
  *(_OWORD *)(a1 + 32) = xmmword_2433C8010;
  *(_BYTE *)(a1 + 48) = 0;
  return result;
}

void closure #1 in RegistryCrux.synchronousUntypedService(tag:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  uint64_t v18;
  id v19;
  id v20;
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  BOOL v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *oslog;
  uint64_t v41;
  uint64_t v42;

  v10 = (void *)_convertErrorToNSError(_:)();
  if (objc_msgSend(v10, sel_code) != (id)4097)
    goto LABEL_7;
  v11 = objc_msgSend(v10, sel_domain);
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;

  if (v12 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v14 == v15)
  {
    swift_bridgeObjectRelease_n();
LABEL_13:
    swift_beginAccess();
    *(_BYTE *)(a2 + 16) = 1;
    v25 = getter of sleeper #1 in RegistryCrux.synchronousUntypedService(tag:)(a3);
    v27 = v26;
    v29 = v28;
    v31 = v30;
    objc_msgSend((id)objc_opt_self(), sel_sleepForTimeInterval_, v30);
    v32 = __OFADD__(v25, 1);
    v33 = v25 + 1;
    if (v32)
    {
      __break(1u);
    }
    else
    {
      if (v31 * 2.37137 <= 0.01)
        v34 = v31 * 2.37137;
      else
        v34 = 0.01;
      swift_beginAccess();
      *(double *)(a3 + 32) = v29 + v31;
      *(double *)(a3 + 40) = v34;
      *(_BYTE *)(a3 + 48) = 0;
      *(_QWORD *)(a3 + 16) = v33;
      *(_QWORD *)(a3 + 24) = v27 << (v33 >= v27);
      if (v33 < v27)
        goto LABEL_21;
      if (one-time initialization token for framework == -1)
      {
LABEL_19:
        v35 = type metadata accessor for Logger();
        __swift_project_value_buffer(v35, (uint64_t)static Logs.framework);
        swift_retain_n();
        swift_bridgeObjectRetain_n();
        v36 = Logger.logObject.getter();
        v37 = static os_log_type_t.error.getter();
        if (!os_log_type_enabled(v36, v37))
        {

          swift_bridgeObjectRelease_n();
          swift_release_n();
          return;
        }
        v38 = swift_slowAlloc();
        v39 = swift_slowAlloc();
        v41 = v39;
        *(_DWORD *)v38 = 136315650;
        swift_bridgeObjectRetain();
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a4, a5, &v41);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v38 + 12) = 2048;
        swift_release();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        *(_WORD *)(v38 + 22) = 2048;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        _os_log_impl(&dword_2433AF000, v36, v37, "Service fetch for %s retried %ld times, %f seconds", (uint8_t *)v38, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x2494F8478](v39, -1, -1);
        MEMORY[0x2494F8478](v38, -1, -1);

LABEL_21:
        return;
      }
    }
    swift_once();
    goto LABEL_19;
  }
  v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v17 & 1) != 0)
    goto LABEL_13;
LABEL_7:
  if (one-time initialization token for framework != -1)
    swift_once();
  v18 = type metadata accessor for Logger();
  __swift_project_value_buffer(v18, (uint64_t)static Logs.framework);
  v19 = a1;
  v20 = a1;
  oslog = Logger.logObject.getter();
  v21 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v22 = 138412290;
    v24 = a1;
    v42 = _swift_stdlib_bridgeErrorToNSError();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v23 = v42;

    _os_log_impl(&dword_2433AF000, oslog, v21, "Failed to get service: %@", v22, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x2494F8478](v23, -1, -1);
    MEMORY[0x2494F8478](v22, -1, -1);

  }
  else
  {

  }
}

void thunk for @escaping @callee_guaranteed (@guaranteed Error) -> ()(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

Swift::Int __swiftcall RegistryCrux.switchIndex()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  void *v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  Swift::Int v11;
  __int128 aBlock;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  void (*v16);
  uint64_t v17;
  void *v18;

  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = 0;
  v2 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
  v3 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock);
  swift_retain();
  os_unfair_lock_lock(v3 + 4);
  swift_release();
  v4 = *(void **)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_);
  v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 16);
  v6 = *(os_unfair_lock_s **)(v0 + v2);
  v7 = *(id *)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 8);
  swift_retain();
  v8 = v4;
  os_unfair_lock_unlock(v6 + 4);
  swift_release();
  if (v5 < 0)
  {

  }
  else
  {
    RegistryCrux.synchronousUntypedService(tag:)(0x6E49686374697773, 0xED00002928786564, &aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCRegistryDelegate);
    swift_dynamicCast();
    v9 = v18;
    v16 = partial apply for closure #1 in RegistryCrux.switchIndex();
    v17 = v1;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v14 = thunk for @escaping @callee_guaranteed (@unowned Int32) -> ();
    v15 = &block_descriptor_94;
    v10 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_xpcSwitchIndex_, v10);

    _Block_release(v10);
    swift_unknownObjectRelease();
  }
  swift_beginAccess();
  v11 = *(_QWORD *)(v1 + 16);
  swift_release();
  return v11;
}

void closure #1 in RegistryCrux.switchIndex()(unsigned int a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v3 = a1;
  swift_beginAccess();
  *(_QWORD *)(a2 + 16) = v3;
  if (one-time initialization token for framework != -1)
    swift_once();
  v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)static Logs.framework);
  swift_retain();
  v5 = Logger.logObject.getter();
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 134217984;
    swift_beginAccess();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl(&dword_2433AF000, v5, v6, "Fetched new switchIndex: %ld", v7, 0xCu);
    MEMORY[0x2494F8478](v7, -1, -1);

  }
  else
  {

    swift_release();
  }
}

uint64_t closure #1 in RegistryCrux.deviceIDAtSwitchIndex(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = swift_projectBox();
  v5 = swift_projectBox();
  swift_beginAccess();
  outlined assign with copy of UUID?(a1, v4, &demangling cache variable for type metadata for UUID?);
  swift_beginAccess();
  return outlined assign with copy of UUID?(a2, v5, (uint64_t *)&demangling cache variable for type metadata for Date?);
}

uint64_t one-time initialization function for supportWatch()
{
  void *v0;
  uint64_t result;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;

  v0 = (void *)objc_opt_self();
  result = (uint64_t)objc_msgSend(v0, sel_isUIBuild);
  if ((_DWORD)result)
  {
    if (one-time initialization token for demoModeEnabled != -1)
      swift_once();
    if ((static RegistryCrux.demoModeEnabled & 1) == 0)
    {
      result = (uint64_t)objc_msgSend(v0, sel_deviceClassString);
      if (!result)
        goto LABEL_14;
      v2 = (void *)result;
      v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v5 = v4;

      if (v3 == 0x6863746157 && v5 == 0xE500000000000000)
      {
        swift_bridgeObjectRelease();
        result = 1;
        goto LABEL_14;
      }
      v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v7 & 1) == 0)
      {
        result = (uint64_t)objc_msgSend(v0, sel_amCompanion);
        goto LABEL_14;
      }
    }
    result = 1;
  }
LABEL_14:
  static RegistryCrux.supportWatch = result;
  return result;
}

BOOL one-time initialization function for demoModeEnabled()
{
  _BOOL8 result;

  result = closure #1 in variable initialization expression of static RegistryCrux.demoModeEnabled();
  static RegistryCrux.demoModeEnabled = result;
  return result;
}

BOOL closure #1 in variable initialization expression of static RegistryCrux.demoModeEnabled()
{
  uint64_t inited;
  void *v1;
  const char *v2;
  id v3;
  char *v4;
  const char *v5;
  int v6;
  _BOOL8 v7;
  __CFString *v8;
  __CFString *v9;
  int AppBooleanValue;
  __CFString *v11;
  CFIndex AppIntegerValue;
  int val[2];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  type metadata accessor for NotifyState();
  inited = swift_initStackObject();
  *(_DWORD *)(inited + 40) = 0;
  *(_BYTE *)(inited + 44) = 1;
  v1 = (void *)MEMORY[0x2494F7BCC](0xD000000000000033, 0x80000002433C9900);
  v2 = (const char *)objc_msgSend(v1, sel_UTF8String);
  v3 = v1;
  v4 = strdup(v2);
  if (!v4)
    __break(1u);
  v5 = v4;
  *(_QWORD *)(inited + 16) = v4;
  *(_QWORD *)(inited + 24) = closure #1 in default argument 1 of NotifyState.init(name:_:);
  *(_QWORD *)(inited + 32) = 0;
  val[0] = 0;
  if (!notify_register_check(v4, val))
  {
    v6 = val[0];
    *(_DWORD *)(inited + 40) = val[0];
    *(_BYTE *)(inited + 44) = 0;
    if (notify_is_valid_token(v6))
    {
      *(_QWORD *)val = 0;
      if (notify_is_valid_token(v6))
      {
        notify_get_state(v6, (uint64_t *)val);
        v7 = *(_QWORD *)val != 0;
        if ((*(_BYTE *)(inited + 44) & 1) != 0)
          goto LABEL_11;
        goto LABEL_10;
      }
      goto LABEL_14;
    }
  }
  v8 = (__CFString *)MEMORY[0x2494F7BCC](0xD000000000000017, 0x80000002433C9940);
  v9 = (__CFString *)MEMORY[0x2494F7BCC](0x6D654465726F7453, 0xED000065646F4D6FLL);
  AppBooleanValue = CFPreferencesGetAppBooleanValue(v9, v8, 0);
  swift_retain();

  if (AppBooleanValue)
  {
    v11 = (__CFString *)MEMORY[0x2494F7BCC](0x6D6172676F725046, 0xEE007265626D754ELL);
    AppIntegerValue = CFPreferencesGetAppIntegerValue(v11, v8, 0);

    v7 = AppIntegerValue == 5;
    if ((*(_BYTE *)(inited + 44) & 1) == 0)
      goto LABEL_9;
LABEL_13:
    __break(1u);
LABEL_14:
    v7 = 0;
    if ((*(_BYTE *)(inited + 44) & 1) != 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  v7 = 0;
  if ((*(_BYTE *)(inited + 44) & 1) != 0)
    goto LABEL_13;
LABEL_9:
  notify_set_state(*(_DWORD *)(inited + 40), v7);
  notify_post(v5);

  swift_release();
  if ((*(_BYTE *)(inited + 44) & 1) == 0)
  {
LABEL_10:
    notify_cancel(*(_DWORD *)(inited + 40));
    *(_DWORD *)(inited + 40) = 0;
    *(_BYTE *)(inited + 44) = 1;
  }
LABEL_11:
  swift_release();
  return v7;
}

void *RegistryCrux.unpair(pairingID:options:)()
{
  uint64_t v0;
  void *v1;
  Class isa;
  Class v3;
  void *v4;
  void *v5;
  id v6;
  __int128 aBlock;
  void (*v9)(uint64_t, void *);
  void *v10;
  void (*v11)(void *);
  uint64_t v12;
  void *v13;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = 0;
  RegistryCrux.synchronousUntypedService(tag:)(0xD00000000000001ALL, 0x80000002433C9600, &aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCPairingDelegate);
  swift_dynamicCast();
  v1 = v13;
  isa = UUID._bridgeToObjectiveC()().super.isa;
  v3 = Dictionary._bridgeToObjectiveC()().super.isa;
  v11 = partial apply for closure #1 in RegistryCrux.pairingClientSetAltAccount(name:altDSID:device:);
  v12 = v0;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v9 = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  v10 = &block_descriptor_74;
  v4 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_xpcUnpairWithDeviceID_withOptions_operationHasBegun_, isa, v3, v4);
  swift_unknownObjectRelease();
  _Block_release(v4);

  swift_beginAccess();
  v5 = *(void **)(v0 + 16);
  v6 = v5;
  swift_release();
  return v5;
}

void thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ()(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

void *RegistryCrux.failsafeUnpair(options:)()
{
  uint64_t v0;
  void *v1;
  Class isa;
  void *v3;
  void *v4;
  id v5;
  __int128 aBlock;
  void (*v8)(uint64_t, void *);
  void *v9;
  void (*v10)(void *);
  uint64_t v11;
  void *v12;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = 0;
  RegistryCrux.synchronousUntypedService(tag:)(0xD000000000000018, 0x80000002433C95E0, &aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCPairingDelegate);
  swift_dynamicCast();
  v1 = v12;
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v10 = partial apply for closure #1 in RegistryCrux.pairingClientSetAltAccount(name:altDSID:device:);
  v11 = v0;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v8 = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  v9 = &block_descriptor_70;
  v3 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_xpcUnpairWithDeviceID_withOptions_operationHasBegun_, 0, isa, v3);
  swift_unknownObjectRelease();
  _Block_release(v3);

  swift_beginAccess();
  v4 = *(void **)(v0 + 16);
  v5 = v4;
  swift_release();
  return v4;
}

uint64_t RegistryCrux.setActive(device:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  Class isa;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  __int128 aBlock;
  uint64_t (*v19)(uint64_t, void *, uint64_t);
  void *v20;
  void (*v21)(void *, uint64_t, unint64_t);
  uint64_t v22;

  v2 = type metadata accessor for UUID();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  RegistryCrux.synchronousUntypedService(tag:)(0xD000000000000012, 0x80000002433C95A0, &aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCPairingDelegate);
  swift_dynamicCast();
  v6 = (void *)v17[1];
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = 0;
  *(_QWORD *)(v7 + 24) = 0xE000000000000000;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = 0;
  v9 = objc_msgSend(a1, sel_pairingID);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v8;
  *(_QWORD *)(v11 + 24) = v7;
  v21 = partial apply for closure #1 in RegistryCrux.setActive(device:);
  v22 = v11;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v19 = thunk for @escaping @callee_guaranteed (@guaranteed Error?, @guaranteed String?) -> ();
  v20 = &block_descriptor_66;
  v12 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_xpcSwitchActiveDeviceWithDeviceID_withAssertionHandler_, isa, v12);
  swift_unknownObjectRelease();
  _Block_release(v12);

  swift_beginAccess();
  v13 = *(_QWORD *)(v7 + 16);
  swift_beginAccess();
  v14 = *(void **)(v8 + 16);
  swift_bridgeObjectRetain();
  v15 = v14;
  swift_release();
  swift_release();
  return v13;
}

void closure #1 in RegistryCrux.setActive(device:)(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  id v8;
  uint64_t v10;
  unint64_t v11;

  if (a1)
  {
    swift_beginAccess();
    v7 = *(void **)(a4 + 16);
    *(_QWORD *)(a4 + 16) = a1;
    v8 = a1;

  }
  else
  {
    if (a3)
      v10 = a2;
    else
      v10 = 0;
    if (a3)
      v11 = a3;
    else
      v11 = 0xE000000000000000;
    swift_beginAccess();
    *(_QWORD *)(a5 + 16) = v10;
    *(_QWORD *)(a5 + 24) = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed Error?, @guaranteed String?) -> ()(uint64_t a1, void *a2, uint64_t a3)
{
  void (*v4)(void *, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = *(void (**)(void *, uint64_t, uint64_t))(a1 + 32);
  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  swift_retain();
  v8 = a2;
  v4(a2, v5, v7);
  swift_release();

  return swift_bridgeObjectRelease();
}

Swift::Bool __swiftcall RegistryCrux.isAssertionActive(identifier:)(Swift::String identifier)
{
  void *object;
  uint64_t countAndFlagsBits;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  __int128 aBlock;
  uint64_t (*v10)();
  void *v11;
  uint64_t (*v12)(char, uint64_t);
  uint64_t v13;
  void *v14;

  object = identifier._object;
  countAndFlagsBits = identifier._countAndFlagsBits;
  RegistryCrux.synchronousUntypedService(tag:)(0xD00000000000001ELL, 0x80000002433C9420, &aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCPairingDelegate);
  swift_dynamicCast();
  v3 = v14;
  v4 = swift_allocObject();
  *(_BYTE *)(v4 + 16) = 0;
  v5 = (void *)MEMORY[0x2494F7BCC](countAndFlagsBits, object);
  v12 = partial apply for closure #1 in RegistryCrux.isAssertionActive(identifier:);
  v13 = v4;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v10 = thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed Error?) -> ();
  v11 = &block_descriptor_22;
  v6 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_xpcIsAssertionActive_withCompletion_, v5, v6);
  swift_unknownObjectRelease();
  _Block_release(v6);

  swift_beginAccess();
  v7 = *(_BYTE *)(v4 + 16);
  swift_release();
  return v7;
}

Swift::Void __swiftcall RegistryCrux.invalidateSwitchAssertion(identifier:)(Swift::String identifier)
{
  void *object;
  uint64_t countAndFlagsBits;
  void *v3;
  void *v4;
  void *v5;
  __int128 aBlock;
  void (*v7)(uint64_t, void *);
  void *v8;
  void (*v9)(void *);
  uint64_t v10;
  void *v11;

  object = identifier._object;
  countAndFlagsBits = identifier._countAndFlagsBits;
  RegistryCrux.synchronousUntypedService(tag:)(0xD000000000000026, 0x80000002433C93D0, &aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCPairingDelegate);
  swift_dynamicCast();
  v3 = v11;
  v4 = (void *)MEMORY[0x2494F7BCC](countAndFlagsBits, object);
  v9 = closure #1 in RegistryCrux.invalidateSwitchAssertion(identifier:);
  v10 = 0;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v7 = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  v8 = &block_descriptor_18;
  v5 = _Block_copy(&aBlock);
  objc_msgSend(v3, sel_xpcInvalidateSwitchAssertionWithIdentifier_block_, v4, v5);
  _Block_release(v5);
  swift_unknownObjectRelease();

}

void closure #1 in RegistryCrux.invalidateSwitchAssertion(identifier:)(void *a1)
{
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  NSObject *oslog;
  uint64_t v11;

  if (a1)
  {
    v2 = a1;
    if (one-time initialization token for framework != -1)
      swift_once();
    v3 = type metadata accessor for Logger();
    __swift_project_value_buffer(v3, (uint64_t)static Logs.framework);
    v4 = a1;
    v5 = a1;
    oslog = Logger.logObject.getter();
    v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v7 = 138412290;
      v9 = a1;
      v11 = _swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v8 = v11;

      _os_log_impl(&dword_2433AF000, oslog, v6, "Invalidation failed (daemon crashed?): %@", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x2494F8478](v8, -1, -1);
      MEMORY[0x2494F8478](v7, -1, -1);

    }
    else
    {

    }
  }
}

Swift::Int __swiftcall RegistryCrux.lastSyncSwitchIndex()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  void *v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  _QWORD *v20;
  id v21;
  Swift::Int v22;
  void *v24;
  void *v25;
  void *v26;
  __int128 aBlock;
  void (*v28)(uint64_t, uint64_t, void *);
  void *v29;
  void (*v30)(uint64_t, void *);
  uint64_t v31;

  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = 0;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = 0;
  v3 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
  v4 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock);
  swift_retain();
  os_unfair_lock_lock(v4 + 4);
  swift_release();
  v5 = *(void **)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_);
  v6 = *(_QWORD *)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 16);
  v7 = *(os_unfair_lock_s **)(v0 + v3);
  v8 = *(id *)(v0 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 8);
  swift_retain();
  v9 = v5;
  os_unfair_lock_unlock(v7 + 4);
  swift_release();
  if (v6 < 0)
  {

  }
  else
  {
    v25 = v8;
    RegistryCrux.synchronousUntypedService(tag:)(0xD000000000000015, 0x80000002433C9580, &aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCPairingDelegate);
    swift_dynamicCast();
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v1;
    *(_QWORD *)(v10 + 24) = v2;
    v30 = partial apply for closure #1 in RegistryCrux.lastSyncSwitchIndex();
    v31 = v10;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v28 = thunk for @escaping @callee_guaranteed (@unowned Int, @guaranteed Error?) -> ();
    v29 = &block_descriptor_56;
    v11 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v26, sel_xpcGetLastSwitchIndex_, v11);
    _Block_release(v11);
    swift_beginAccess();
    v12 = *(void **)(v2 + 16);
    if (v12)
    {
      v24 = v9;
      v13 = one-time initialization token for framework;
      v14 = v12;
      if (v13 != -1)
        swift_once();
      v15 = type metadata accessor for Logger();
      __swift_project_value_buffer(v15, (uint64_t)static Logs.framework);
      v16 = v14;
      v17 = Logger.logObject.getter();
      v18 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v17, v18))
      {
        v19 = (uint8_t *)swift_slowAlloc();
        v20 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v19 = 138412290;
        *(_QWORD *)&aBlock = v16;
        v21 = v16;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *v20 = v12;

        _os_log_impl(&dword_2433AF000, v17, v18, "Failed to get switchIndex value from CFPrefs: %@", v19, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        MEMORY[0x2494F8478](v20, -1, -1);
        MEMORY[0x2494F8478](v19, -1, -1);

        swift_unknownObjectRelease();
      }
      else
      {

        swift_unknownObjectRelease();
      }
    }
    else
    {

      swift_unknownObjectRelease();
    }
  }
  swift_beginAccess();
  v22 = *(_QWORD *)(v1 + 16);
  swift_release();
  swift_release();
  return v22;
}

void closure #1 in RegistryCrux.lastSyncSwitchIndex()(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void **v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  void *v14;

  v7 = (void **)(a4 + 16);
  swift_beginAccess();
  *(_QWORD *)(a3 + 16) = a1;
  if (a2)
  {
    v8 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    type metadata accessor for NRMutableDeviceCollection(0, &lazy cache variable for type metadata for NSError);
    if (swift_dynamicCast())
      a2 = v14;
    else
      a2 = 0;
  }
  swift_beginAccess();
  v9 = *v7;
  *v7 = a2;

  if (one-time initialization token for framework != -1)
    swift_once();
  v10 = type metadata accessor for Logger();
  __swift_project_value_buffer(v10, (uint64_t)static Logs.framework);
  swift_retain();
  v11 = Logger.logObject.getter();
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v13 = 134217984;
    swift_beginAccess();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl(&dword_2433AF000, v11, v12, "Fetched lastSyncSwitchIndex: %ld", v13, 0xCu);
    MEMORY[0x2494F8478](v13, -1, -1);

  }
  else
  {

    swift_release();
  }
}

void thunk for @escaping @callee_guaranteed (@unowned Int, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t RegistryCrux.migrationCount(pairingID:)()
{
  uint64_t v0;
  void *v1;
  Class isa;
  void *v3;
  uint64_t v4;
  __int128 aBlock;
  void (*v7)(uint64_t, uint64_t, void *);
  void *v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  void *v11;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = 0;
  RegistryCrux.synchronousUntypedService(tag:)(0xD00000000000001ALL, 0x80000002433C9540, &aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCPairingDelegate);
  swift_dynamicCast();
  v1 = v11;
  isa = UUID._bridgeToObjectiveC()().super.isa;
  v9 = partial apply for closure #1 in RegistryCrux.migrationCount(pairingID:);
  v10 = v0;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v7 = thunk for @escaping @callee_guaranteed (@unowned Int, @guaranteed Error?) -> ();
  v8 = &block_descriptor_46;
  v3 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_xpcGetMigrationCountForPairingID_completion_, isa, v3);
  swift_unknownObjectRelease();
  _Block_release(v3);

  swift_beginAccess();
  v4 = *(_QWORD *)(v0 + 16);
  swift_release();
  return v4;
}

uint64_t RegistryCrux.waitForWatchPairingExtendedMetadata(advertisedName:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  __int128 aBlock;
  uint64_t (*v12)();
  void *v13;
  void (*v14)(char, void *);
  uint64_t v15;
  void *v16;

  v4 = swift_allocObject();
  *(_BYTE *)(v4 + 16) = 0;
  *(_QWORD *)(v4 + 24) = 0;
  RegistryCrux.synchronousUntypedService(tag:)(0xD000000000000034, 0x80000002433C94D0, &aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCPairingDelegate);
  swift_dynamicCast();
  v5 = v16;
  v6 = (void *)MEMORY[0x2494F7BCC](a1, a2);
  v14 = partial apply for closure #1 in RegistryCrux.waitForWatchPairingExtendedMetadata(advertisedName:);
  v15 = v4;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v12 = thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed Error?) -> ();
  v13 = &block_descriptor_40;
  v7 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_xpcWaitForWatchPairingExtendedMetadataForAdvertisedName_completion_, v6, v7);
  swift_unknownObjectRelease();
  _Block_release(v7);

  swift_beginAccess();
  v8 = *(unsigned __int8 *)(v4 + 16);
  v9 = *(id *)(v4 + 24);
  swift_release();
  return v8;
}

void closure #1 in RegistryCrux.waitForWatchPairingExtendedMetadata(advertisedName:)(char a1, void *a2, uint64_t a3)
{
  void *v6;
  id v7;

  swift_beginAccess();
  *(_BYTE *)(a3 + 16) = a1;
  v6 = *(void **)(a3 + 24);
  *(_QWORD *)(a3 + 24) = a2;
  v7 = a2;

}

uint64_t RegistryCrux.completeRTCPairingMetric(metricID:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  __int128 aBlock;
  uint64_t (*v12)();
  void *v13;
  void (*v14)(char, void *);
  uint64_t v15;
  void *v16;

  v4 = swift_allocObject();
  *(_BYTE *)(v4 + 16) = 0;
  *(_QWORD *)(v4 + 24) = 0;
  RegistryCrux.synchronousUntypedService(tag:)(0xD000000000000023, 0x80000002433C94A0, &aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCPairingDelegate);
  swift_dynamicCast();
  v5 = v16;
  v6 = (void *)MEMORY[0x2494F7BCC](a1, a2);
  v14 = partial apply for closure #1 in RegistryCrux.completeRTCPairingMetric(metricID:);
  v15 = v4;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v12 = thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed Error?) -> ();
  v13 = &block_descriptor_34;
  v7 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_xpcSubmitRTCPairingMetricForMetricID_withSuccess_, v6, v7);
  swift_unknownObjectRelease();
  _Block_release(v7);

  swift_beginAccess();
  v8 = *(unsigned __int8 *)(v4 + 16);
  v9 = *(id *)(v4 + 24);
  swift_release();
  return v8;
}

void closure #1 in RegistryCrux.completeRTCPairingMetric(metricID:)(char a1, void *a2, uint64_t a3)
{
  void *v6;
  id v7;

  swift_beginAccess();
  *(_BYTE *)(a3 + 16) = a1;
  v6 = *(void **)(a3 + 24);
  *(_QWORD *)(a3 + 24) = a2;
  v7 = a2;

}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Bool, @unowned Int) -> ()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v5)(uint64_t, uint64_t);

  v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);
  return swift_release();
}

void *RegistryCrux.pairingClientSetAltAccount(name:altDSID:device:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  Class isa;
  void *v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  id v24;
  __int128 aBlock;
  void (*v26)(uint64_t, void *);
  void *v27;
  void (*v28)(void *);
  uint64_t v29;
  void *v30;

  v23 = a4;
  v24 = a5;
  v8 = type metadata accessor for UUID();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = 0;
  RegistryCrux.synchronousUntypedService(tag:)(0xD000000000000030, 0x80000002433C9460, &aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCPairingDelegate);
  swift_dynamicCast();
  v13 = v30;
  v14 = (void *)MEMORY[0x2494F7BCC](a1, a2);
  v15 = (void *)MEMORY[0x2494F7BCC](a3, v23);
  v16 = objc_msgSend(v24, sel_pairingID);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v28 = partial apply for closure #1 in RegistryCrux.pairingClientSetAltAccount(name:altDSID:device:);
  v29 = v12;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v26 = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  v27 = &block_descriptor_28;
  v18 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v13, sel_xpcPairingClientSetAltAccountName_altDSID_forPairingID_completion_, v14, v15, isa, v18);
  swift_unknownObjectRelease();
  _Block_release(v18);

  swift_beginAccess();
  v19 = *(void **)(v12 + 16);
  v20 = v19;
  swift_release();
  return v19;
}

void closure #1 in RegistryCrux.unpair(pairingID:options:)(void *a1, uint64_t a2)
{
  void *v4;
  id v5;

  swift_beginAccess();
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = a1;
  v5 = a1;

}

Swift::Void __swiftcall RegistryCrux.add(registry:)(PDRRegistry registry)
{
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  unint64_t v9;
  os_unfair_lock_s *v10;
  uint64_t v11;
  _BYTE v12[8];

  v2 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
  v3 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock);
  swift_retain();
  os_unfair_lock_lock(v3 + 4);
  swift_release();
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registries_);
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  outlined init with take of RegistryState.LoggingInfo?((uint64_t)&v11, (uint64_t)v12, &demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
  v5 = (_QWORD *)(v4 + 16);
  swift_beginAccess();
  v6 = *(_QWORD **)(v4 + 16);
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v4 + 16) = v6;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v6[2] + 1, 1, (unint64_t)v6);
    *v5 = v6;
  }
  v9 = v6[2];
  v8 = v6[3];
  if (v9 >= v8 >> 1)
  {
    v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v8 > 1), v9 + 1, 1, (unint64_t)v6);
    *v5 = v6;
  }
  v6[2] = v9 + 1;
  outlined init with take of RegistryState.LoggingInfo?((uint64_t)v12, (uint64_t)&v6[v9 + 4], &demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
  swift_endAccess();
  swift_release();
  v10 = *(os_unfair_lock_s **)(v1 + v2);
  swift_retain();
  os_unfair_lock_unlock(v10 + 4);
  swift_release();
}

uint64_t *initializeBufferWithCopyOfBuffer for RegistryCrux.RefreshTimings(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for ContinuousClock.Instant();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(_WORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_WORD *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for RegistryCrux.RefreshTimings(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ContinuousClock.Instant();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for RegistryCrux.RefreshTimings(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for ContinuousClock.Instant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_WORD *)(a1 + *(int *)(a3 + 20)) = *(_WORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for RegistryCrux.RefreshTimings(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for ContinuousClock.Instant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_WORD *)(a1 + *(int *)(a3 + 20)) = *(_WORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for RegistryCrux.RefreshTimings(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for ContinuousClock.Instant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_WORD *)(a1 + *(int *)(a3 + 20)) = *(_WORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for RegistryCrux.RefreshTimings(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for ContinuousClock.Instant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_WORD *)(a1 + *(int *)(a3 + 20)) = *(_WORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for RegistryCrux.RefreshTimings()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2433BA2A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ContinuousClock.Instant();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for RegistryCrux.RefreshTimings()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2433BA2EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ContinuousClock.Instant();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata completion function for RegistryCrux.RefreshTimings()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ContinuousClock.Instant();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2494F83B8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2433BA438()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {

  }
  return swift_deallocObject();
}

void partial apply for closure #1 in RegistryCrux.definitelyFetchRegistryState()(void *a1, void *a2, uint64_t a3, char a4)
{
  uint64_t v4;

  closure #1 in RegistryCrux.definitelyFetchRegistryState()(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(_QWORD **)(v4 + 24));
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

void outlined consume of RegistryState?(void *a1, void *a2)
{
  if (a1)
  {

  }
}

uint64_t outlined assign with take of RegistryCrux.RefreshTimings(uint64_t a1, uint64_t a2)
{
  uint64_t refreshed;

  refreshed = type metadata accessor for RegistryCrux.RefreshTimings(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(refreshed - 8) + 40))(a2, a1, refreshed);
  return a2;
}

uint64_t outlined init with copy of RegistryCrux.RefreshTimings(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of RegistryCrux.RefreshTimings(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2433BA57C()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in RegistryCrux.internalBoolPreference(key:)(uint64_t result, char a2)
{
  uint64_t v2;
  char v3;

  if ((result & 1) != 0)
  {
    v3 = a2 & 1;
    result = swift_beginAccess();
    *(_BYTE *)(v2 + 16) = v3;
  }
  return result;
}

uint64_t sub_2433BA5CC()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in RegistryCrux.internalLongPreference(key:)(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if ((result & 1) != 0)
  {
    result = swift_beginAccess();
    *(_QWORD *)(v2 + 16) = a2;
    *(_BYTE *)(v2 + 24) = 0;
  }
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
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

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = _StringGuts.copyUTF8(into:)();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      v2 = String.UTF8View._foreignCount()();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
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

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t partial apply for closure #1 in RegistryCrux.isAssertionActive(identifier:)(char a1, uint64_t a2)
{
  uint64_t v2;
  char v3;
  uint64_t result;

  v3 = (a2 != 0) & a1;
  result = swift_beginAccess();
  *(_BYTE *)(v2 + 16) = v3;
  return result;
}

uint64_t sub_2433BACA8()
{
  uint64_t v0;

  return swift_deallocObject();
}

void partial apply for closure #1 in RegistryCrux.pairingClientSetAltAccount(name:altDSID:device:)(void *a1)
{
  uint64_t v1;

  closure #1 in RegistryCrux.unpair(pairingID:options:)(a1, v1);
}

uint64_t sub_2433BACE4()
{
  uint64_t v0;

  return swift_deallocObject();
}

void partial apply for closure #1 in RegistryCrux.completeRTCPairingMetric(metricID:)(char a1, void *a2)
{
  uint64_t v2;

  closure #1 in RegistryCrux.completeRTCPairingMetric(metricID:)(a1, a2, v2);
}

uint64_t sub_2433BAD10()
{
  uint64_t v0;

  return swift_deallocObject();
}

void partial apply for closure #1 in RegistryCrux.waitForWatchPairingExtendedMetadata(advertisedName:)(char a1, void *a2)
{
  uint64_t v2;

  closure #1 in RegistryCrux.waitForWatchPairingExtendedMetadata(advertisedName:)(a1, a2, v2);
}

uint64_t sub_2433BAD3C()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in RegistryCrux.migrationCount(pairingID:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t sub_2433BAD88()
{
  uint64_t v0;

  return swift_deallocObject();
}

void partial apply for closure #1 in RegistryCrux.lastSyncSwitchIndex()(uint64_t a1, void *a2)
{
  uint64_t v2;

  closure #1 in RegistryCrux.lastSyncSwitchIndex()(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_2433BADB8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t objectdestroy_2Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #1 in RegistryCrux.setActive(device:)(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  closure #1 in RegistryCrux.setActive(device:)(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
}

uint64_t sub_2433BAE14()
{
  return swift_deallocObject();
}

uint64_t sub_2433BAE24()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void partial apply for closure #1 in RegistryCrux.synchronousUntypedService(tag:)(void *a1)
{
  uint64_t v1;

  closure #1 in RegistryCrux.synchronousUntypedService(tag:)(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t outlined assign with copy of UUID?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 24))(a2, a1, v5);
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

uint64_t outlined assign with take of RegistryState.LoggingInfo?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t partial apply for closure #1 in RegistryCrux.connectionLocked()()
{
  uint64_t v0;

  return closure #1 in RegistryCrux.connectionLocked()(v0);
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AnyHashable>);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 40);
  v5 = specialized Sequence._copySequenceContents(initializing:)((uint64_t)&v7, (uint64_t)(v3 + 4), v1, a1);
  swift_bridgeObjectRetain();
  outlined consume of Set<AnyHashable>.Iterator._Variant();
  if (v5 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t outlined init with copy of AnyHashable(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  __int128 v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  _OWORD v23[2];
  uint64_t v24;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v13 = 0;
LABEL_36:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v13;
  }
  if (!a3)
  {
    v12 = 0;
    v13 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  v22 = -1 << *(_BYTE *)(a4 + 32);
  while (v9)
  {
    v15 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    v16 = v15 | (v12 << 6);
LABEL_9:
    ++v13;
    result = outlined init with copy of AnyHashable(*(_QWORD *)(a4 + 48) + 40 * v16, (uint64_t)v23);
    v17 = v24;
    v18 = v23[1];
    *(_OWORD *)v11 = v23[0];
    *(_OWORD *)(v11 + 16) = v18;
    *(_QWORD *)(v11 + 32) = v17;
    v11 += 40;
    if (v13 == a3)
    {
      v13 = a3;
LABEL_35:
      v7 = v22;
      goto LABEL_36;
    }
  }
  v19 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v19 >= v14)
    goto LABEL_34;
  v20 = *(_QWORD *)(v6 + 8 * v19);
  if (v20)
    goto LABEL_23;
  v21 = v12 + 2;
  ++v12;
  if (v19 + 1 >= v14)
    goto LABEL_34;
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
    goto LABEL_16;
  v12 = v19 + 1;
  if (v19 + 2 >= v14)
    goto LABEL_34;
  v20 = *(_QWORD *)(v6 + 8 * (v19 + 2));
  if (v20)
  {
    v19 += 2;
    goto LABEL_23;
  }
  v12 = v19 + 2;
  if (v19 + 3 >= v14)
    goto LABEL_34;
  v20 = *(_QWORD *)(v6 + 8 * (v19 + 3));
  if (v20)
  {
    v19 += 3;
    goto LABEL_23;
  }
  v21 = v19 + 4;
  v12 = v19 + 3;
  if (v19 + 4 >= v14)
  {
LABEL_34:
    v9 = 0;
    goto LABEL_35;
  }
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
LABEL_16:
    v19 = v21;
LABEL_23:
    v9 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v19 << 6);
    v12 = v19;
    goto LABEL_9;
  }
  while (1)
  {
    v19 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v19 >= v14)
    {
      v12 = v14 - 1;
      goto LABEL_34;
    }
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v21;
    if (v20)
      goto LABEL_23;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t outlined consume of Set<AnyHashable>.Iterator._Variant()
{
  return swift_release();
}

uint64_t outlined init with copy of RegistryState.LoggingInfo?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of UUID?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined destroy of AnyHashable(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

void partial apply for closure #1 in RegistryCrux.switchIndex()(unsigned int a1)
{
  uint64_t v1;

  closure #1 in RegistryCrux.switchIndex()(a1, v1);
}

uint64_t outlined init with take of RegistryState.LoggingInfo?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for NRMutableDeviceCollection(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2494F83C4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t partial apply for closure #1 in RegistryCrux.().init()(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in RegistryCrux.().init()(a1, v1);
}

void partial apply for closure #2 in RegistryCrux.().init()()
{
  uint64_t v0;

  closure #1 in closure #1 in RegistryCrux.().init()(v0, "#refresh Bootstrap sync refresh");
}

uint64_t sub_2433BB444()
{
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @callee_guaranteed () -> ()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

void partial apply for closure #1 in closure #1 in RegistryCrux.().init()()
{
  uint64_t v0;

  closure #1 in closure #1 in RegistryCrux.().init()(v0, "#refresh Starting async refresh");
}

uint64_t lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2494F83D0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2494F83D0](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

id Registry_Stub.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id Registry_Stub.init()()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v1 = OBJC_IVAR___PDRRegistry_Stub_unfairLock;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  v2 = swift_allocObject();
  *(_DWORD *)(v2 + 16) = 0;
  *(_QWORD *)&v0[v1] = v2;
  v3 = OBJC_IVAR___PDRRegistry_Stub_delegates;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v0[v3] = v4;
  *(_QWORD *)&v0[OBJC_IVAR___PDRRegistry_Stub_lastCompatibilityState] = 0;
  v0[OBJC_IVAR___PDRRegistry_Stub_started_] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___PDRRegistry_Stub_status_] = 0;
  v0[OBJC_IVAR___PDRRegistry_Stub_amSingleton] = 0;
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for Registry_Stub();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for Registry_Stub()
{
  return objc_opt_self();
}

id one-time initialization function for sharedInstance_()
{
  _BYTE *v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for Registry_Stub()), sel_init);
  v0[OBJC_IVAR___PDRRegistry_Stub_amSingleton] = 1;
  result = objc_msgSend(v0, sel_start);
  static Registry_Stub.sharedInstance_ = (uint64_t)v0;
  return result;
}

{
  _BYTE *v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for Registry_Impl()), sel_init);
  v0[OBJC_IVAR___PDRRegistry_Impl_amSingleton] = 1;
  result = objc_msgSend(v0, sel_start);
  static Registry_Impl.sharedInstance_ = (uint64_t)v0;
  return result;
}

Swift::Void __swiftcall Registry_Stub.stop()()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + OBJC_IVAR___PDRRegistry_Stub_started_) != 1
    || (*(_BYTE *)(v0 + OBJC_IVAR___PDRRegistry_Stub_amSingleton) & 1) != 0)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    *(_BYTE *)(v0 + OBJC_IVAR___PDRRegistry_Stub_started_) = 0;
  }
}

uint64_t Registry_Stub.add(delegate:)()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  unint64_t v8;
  os_unfair_lock_s *v9;
  uint64_t v11;
  _BYTE v12[8];

  v1 = OBJC_IVAR___PDRRegistry_Stub_unfairLock;
  v2 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR___PDRRegistry_Stub_unfairLock);
  swift_retain();
  os_unfair_lock_lock(v2 + 4);
  swift_release();
  v3 = *(_QWORD *)(v0 + OBJC_IVAR___PDRRegistry_Stub_delegates);
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  outlined init with take of WeakCollection<PDRRegistryDelegate>.Weak((uint64_t)&v11, (uint64_t)v12);
  v4 = (_QWORD *)(v3 + 16);
  swift_beginAccess();
  v5 = *(_QWORD **)(v3 + 16);
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v3 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v5[2] + 1, 1, (unint64_t)v5);
    *v4 = v5;
  }
  v8 = v5[2];
  v7 = v5[3];
  if (v8 >= v7 >> 1)
  {
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v7 > 1), v8 + 1, 1, (unint64_t)v5);
    *v4 = v5;
  }
  v5[2] = v8 + 1;
  outlined init with take of WeakCollection<PDRRegistryDelegate>.Weak((uint64_t)v12, (uint64_t)&v5[v8 + 4]);
  swift_endAccess();
  swift_release();
  v9 = *(os_unfair_lock_s **)(v0 + v1);
  swift_retain();
  os_unfair_lock_unlock(v9 + 4);
  return swift_release();
}

uint64_t outlined init with take of WeakCollection<PDRRegistryDelegate>.Weak(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t Registry_Stub.remove(delegate:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  os_unfair_lock_s *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  unsigned __int8 v10;

  v3 = OBJC_IVAR___PDRRegistry_Stub_unfairLock;
  v4 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR___PDRRegistry_Stub_unfairLock);
  swift_retain();
  os_unfair_lock_lock(v4 + 4);
  swift_release();
  v5 = *(_QWORD **)(v1 + OBJC_IVAR___PDRRegistry_Stub_delegates);
  v10 = 0;
  swift_unknownObjectRetain();
  v6 = swift_retain();
  specialized WeakCollection.sweep(action:)(v6, a1, v5, &v10);
  swift_release();
  swift_unknownObjectRelease();
  v7 = v10;
  v8 = *(os_unfair_lock_s **)(v1 + v3);
  swift_retain();
  os_unfair_lock_unlock(v8 + 4);
  swift_release();
  return v7;
}

id @objc Registry_Stub.device(forBluetoothID:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = type metadata accessor for UUID();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 0;
}

id Registry_Stub.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Registry_Stub();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t Registry_Stub.unpair(device:options:)()
{
  return 0;
}

uint64_t Registry_Stub.failsafeUnpair(options:)()
{
  return 0;
}

uint64_t Registry_Stub.setActive(device:results:)(uint64_t a1, uint64_t (*a2)(_QWORD, _QWORD))
{
  return a2(0, 0);
}

Swift::Int __swiftcall Registry_Stub.lastSyncSwitchIndex()()
{
  return 0;
}

uint64_t Registry_Stub.migrationCount(pairingID:)()
{
  return 0;
}

uint64_t Registry_Stub.completeRTCPairingMetric(metricID:completion:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD, _QWORD))
{
  return a3(0, 0);
}

void @objc Registry_Stub.waitForPairingExtendedMetadata(advertisedName:results:)(void *a1, int a2, int a3, void *aBlock)
{
  _QWORD *v5;
  void (*v6)(_QWORD *, _QWORD, _QWORD);
  id v7;

  v5 = _Block_copy(aBlock);
  v6 = (void (*)(_QWORD *, _QWORD, _QWORD))v5[2];
  v7 = a1;
  v6(v5, 0, 0);
  _Block_release(v5);

}

uint64_t Registry_Stub.pairingClientSetAltAccount(name:altDSID:device:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(_QWORD))
{
  return a6(0);
}

Swift::Int __swiftcall Registry_Stub.maxPairedDeviceCount()()
{
  return 0;
}

Swift::Int __swiftcall Registry_Stub.maxTinkerPairedDeviceCount()()
{
  return 0;
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AnyHashable>);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4])
          memmove(v12, a4 + 4, 40 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, unint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *(_QWORD *)(a4 + 24);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *(_QWORD *)(a4 + 16);
    if (v7 <= v8)
      v9 = *(_QWORD *)(a4 + 16);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<WeakCollection<PDRRegistry>.Weak>);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = (unint64_t)(v10 + 4);
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = MEMORY[0x24BEE4AF8] + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if ((unint64_t)v10 < a4 || v13 >= a4 + 32 + 8 * v8)
        {
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v10 != (_QWORD *)a4)
        {
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
          swift_arrayInitWithTakeBackToFront();
        }
        *(_QWORD *)(a4 + 16) = 0;
        goto LABEL_26;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, v13, a4);
LABEL_26:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *(_QWORD *)(a4 + 24);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *(_QWORD *)(a4 + 16);
    if (v7 <= v8)
      v9 = *(_QWORD *)(a4 + 16);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<WeakCollection<PDRRegistryDelegate>.Weak>);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = (unint64_t)(v10 + 4);
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = MEMORY[0x24BEE4AF8] + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if ((unint64_t)v10 < a4 || v13 >= a4 + 32 + 8 * v8)
        {
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v10 != (_QWORD *)a4)
        {
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
          swift_arrayInitWithTakeBackToFront();
        }
        *(_QWORD *)(a4 + 16) = 0;
        goto LABEL_26;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, v13, a4);
LABEL_26:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 8 * a1 + 32;
    v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 8 * a1 + 32;
    v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t method lookup function for Registry_Stub()
{
  return swift_lookUpClassMethod();
}

unint64_t type metadata accessor for PDRDevice()
{
  unint64_t result;

  result = lazy cache variable for type metadata for PDRDevice;
  if (!lazy cache variable for type metadata for PDRDevice)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for PDRDevice);
  }
  return result;
}

char *String.strdup()()
{
  void *v0;
  const char *v1;
  id v2;
  char *result;

  v0 = (void *)MEMORY[0x2494F7BCC]();
  v1 = (const char *)objc_msgSend(v0, sel_UTF8String);
  v2 = v0;
  result = strdup(v1);
  if (!result)
    __break(1u);
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for RetrySleeper(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t getEnumTagSinglePayload for RetrySleeper(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for RetrySleeper(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for RetrySleeper()
{
  return &type metadata for RetrySleeper;
}

Swift::Bool __swiftcall RetrySleeper.sleep()()
{
  uint64_t v0;
  void *v1;
  double v2;
  Swift::Bool result;
  double v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (void *)objc_opt_self();
  v2 = *(double *)(v0 + 24);
  result = objc_msgSend(v1, sel_sleepForTimeInterval_, v2);
  v4 = v2 * 2.37137;
  if (v2 * 2.37137 > 0.01)
    v4 = 0.01;
  *(double *)(v0 + 16) = v2 + *(double *)(v0 + 16);
  *(double *)(v0 + 24) = v4;
  v5 = *(_QWORD *)v0 + 1;
  if (__OFADD__(*(_QWORD *)v0, 1))
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)v0 = v5;
    v6 = *(_QWORD *)(v0 + 8);
    if (v5 >= v6)
      *(_QWORD *)(v0 + 8) = 2 * v6;
    return v5 >= v6;
  }
  return result;
}

char *one-time initialization function for notify()
{
  uint64_t v0;
  void *v1;
  const char *v2;
  id v3;
  char *result;

  type metadata accessor for NotifyState();
  v0 = swift_allocObject();
  *(_DWORD *)(v0 + 40) = 0;
  *(_BYTE *)(v0 + 44) = 1;
  v1 = (void *)MEMORY[0x2494F7BCC](0xD000000000000025, 0x80000002433C9C00);
  v2 = (const char *)objc_msgSend(v1, sel_UTF8String);
  v3 = v1;
  result = strdup(v2);
  if (result)
  {
    *(_QWORD *)(v0 + 16) = result;
    *(_QWORD *)(v0 + 24) = closure #1 in default argument 1 of NotifyState.init(name:_:);
    *(_QWORD *)(v0 + 32) = 0;
    result = (char *)NotifyState.start(bootstrap:)(0);
    static ConnectivityStatus_Impl.notify = (_UNKNOWN *)v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id ConnectivityStatus_Impl.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ConnectivityStatus_Impl.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConnectivityStatus_Impl();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ConnectivityStatus_Impl.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConnectivityStatus_Impl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t specialized static ConnectivityStatus_Impl.currentConnectivity()()
{
  uint64_t result;
  _DWORD *v1;
  int v2;
  uint64_t v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  if (one-time initialization token for notify != -1)
    swift_once();
  result = 0;
  v1 = static ConnectivityStatus_Impl.notify;
  v3[0] = 0;
  if ((*((_BYTE *)static ConnectivityStatus_Impl.notify + 44) & 1) == 0)
  {
    v2 = *((_DWORD *)static ConnectivityStatus_Impl.notify + 10);
    swift_retain();
    result = notify_is_valid_token(v2);
    if ((_DWORD)result)
    {
      if ((v1[11] & 1) != 0)
      {
        __break(1u);
      }
      else
      {
        notify_get_state(v1[10], v3);
        swift_release();
        return v3[0];
      }
    }
    else
    {
      swift_release();
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for ConnectivityStatus_Impl()
{
  return objc_opt_self();
}

_QWORD *initializeBufferWithCopyOfBuffer for RegistryState(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  a1[2] = *(_QWORD *)(a2 + 16);
  v5 = v3;
  v6 = v4;
  return a1;
}

void destroy for RegistryState(id *a1)
{

}

uint64_t assignWithCopy for RegistryState(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a1 + 8);
  v8 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v8;
  v9 = v8;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
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

uint64_t assignWithTake for RegistryState(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for RegistryState(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RegistryState(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for RegistryState()
{
  return &type metadata for RegistryState;
}

uint64_t *initializeBufferWithCopyOfBuffer for RegistryState.LoggingInfo(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = a2[2];
    v5 = *(int *)(a3 + 28);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = type metadata accessor for ContinuousClock.Instant();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t destroy for RegistryState.LoggingInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 28);
  v3 = type metadata accessor for ContinuousClock.Instant();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

uint64_t initializeWithCopy for RegistryState.LoggingInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 28);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = type metadata accessor for ContinuousClock.Instant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithCopy for RegistryState.LoggingInfo(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  v4 = *(int *)(a3 + 28);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = type metadata accessor for ContinuousClock.Instant();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

uint64_t initializeWithTake for RegistryState.LoggingInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 28);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = type metadata accessor for ContinuousClock.Instant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for RegistryState.LoggingInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 28);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = type metadata accessor for ContinuousClock.Instant();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for RegistryState.LoggingInfo()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2433BD000(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a3 + 28);
  v5 = type metadata accessor for ContinuousClock.Instant();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, a2, v5);
}

uint64_t storeEnumTagSinglePayload for RegistryState.LoggingInfo()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2433BD04C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + *(int *)(a4 + 28);
  v6 = type metadata accessor for ContinuousClock.Instant();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, a2, a2, v6);
}

uint64_t type metadata accessor for RegistryState.LoggingInfo()
{
  uint64_t result;

  result = type metadata singleton initialization cache for RegistryState.LoggingInfo;
  if (!type metadata singleton initialization cache for RegistryState.LoggingInfo)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata completion function for RegistryState.LoggingInfo()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ContinuousClock.Instant();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t RegistryState.LoggingInfo.shouldLog(last:)(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v30;
  uint64_t v31;

  v2 = v1;
  v4 = type metadata accessor for RegistryState.LoggingInfo();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v31 = (uint64_t)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v30 - v8;
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v30 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v30 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v30 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v30 - v19;
  v21 = *v2;
  v22 = *a1;
  outlined init with copy of RegistryState.LoggingInfo((uint64_t)v2, (uint64_t)&v30 - v19);
  outlined init with copy of RegistryState.LoggingInfo((uint64_t)a1, (uint64_t)v18);
  if (v21 != v22)
  {
    outlined destroy of RegistryState.LoggingInfo((uint64_t)v18);
    outlined destroy of RegistryState.LoggingInfo((uint64_t)v20);
    outlined init with copy of RegistryState.LoggingInfo((uint64_t)v2, (uint64_t)v15);
    outlined init with copy of RegistryState.LoggingInfo((uint64_t)a1, (uint64_t)v12);
    goto LABEL_6;
  }
  v23 = *((_QWORD *)v20 + 1);
  outlined destroy of RegistryState.LoggingInfo((uint64_t)v20);
  v24 = *((_QWORD *)v18 + 1);
  outlined destroy of RegistryState.LoggingInfo((uint64_t)v18);
  outlined init with copy of RegistryState.LoggingInfo((uint64_t)v2, (uint64_t)v15);
  outlined init with copy of RegistryState.LoggingInfo((uint64_t)a1, (uint64_t)v12);
  if (v23 != v24)
  {
LABEL_6:
    outlined destroy of RegistryState.LoggingInfo((uint64_t)v12);
    outlined destroy of RegistryState.LoggingInfo((uint64_t)v15);
    outlined init with copy of RegistryState.LoggingInfo((uint64_t)v2, (uint64_t)v9);
    v27 = v31;
    outlined init with copy of RegistryState.LoggingInfo((uint64_t)a1, v31);
    goto LABEL_7;
  }
  v25 = *((_QWORD *)v15 + 2);
  outlined destroy of RegistryState.LoggingInfo((uint64_t)v15);
  v26 = *((_QWORD *)v12 + 2);
  outlined destroy of RegistryState.LoggingInfo((uint64_t)v12);
  outlined init with copy of RegistryState.LoggingInfo((uint64_t)v2, (uint64_t)v9);
  v27 = v31;
  outlined init with copy of RegistryState.LoggingInfo((uint64_t)a1, v31);
  if (v25 != v26)
  {
LABEL_7:
    v28 = 1;
    goto LABEL_8;
  }
  ContinuousClock.Instant.duration(to:)();
  v28 = static Duration.< infix(_:_:)();
LABEL_8:
  outlined destroy of RegistryState.LoggingInfo(v27);
  outlined destroy of RegistryState.LoggingInfo((uint64_t)v9);
  return v28 & 1;
}

uint64_t outlined init with copy of RegistryState.LoggingInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RegistryState.LoggingInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of RegistryState.LoggingInfo(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RegistryState.LoggingInfo();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void RegistryState.LoggingInfo.init(_:)(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  void *v18;
  unsigned int v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  id v28;

  v7 = a1;
  v8 = objc_msgSend(v7, sel_allPairingIDs);
  type metadata accessor for UUID();
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v10 = a2;
  v11 = v7;
  v12 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay10Foundation4UUIDVG_20PairedDeviceRegistry0G5_ImplCs5NeverOTg504_s20fg44Registry0C5StateV11LoggingInfoVyAeCcfcAA0B5_I24C10Foundation4UUIDVXEfU_AJ0hN0VTf1cn_nTf4ng_n(v9, v11, a2, a3);
  swift_bridgeObjectRelease();

  if (!(v12 >> 62))
  {
    v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v13)
      goto LABEL_3;
LABEL_25:
    swift_bridgeObjectRelease();
    a4[1] = 0;
    a4[2] = 0;
    if (!(v12 >> 62))
    {
LABEL_23:
      v26 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_27:
      swift_bridgeObjectRelease();
      *a4 = v26;
      type metadata accessor for RegistryState.LoggingInfo();
      static ContinuousClock.now.getter();

      return;
    }
LABEL_26:
    swift_bridgeObjectRetain();
    v26 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  swift_bridgeObjectRetain();
  v13 = _CocoaArrayWrapper.endIndex.getter();
  if (!v13)
    goto LABEL_25;
LABEL_3:
  if (v13 >= 1)
  {
    v27 = v12 >> 62;
    v28 = v10;
    v14 = 0;
    v15 = 0;
    v16 = v12 & 0xC000000000000001;
    while (1)
    {
      v17 = v16 ? (id)MEMORY[0x2494F7D64](v14, v12) : *(id *)(v12 + 8 * v14 + 32);
      v18 = v17;
      v19 = objc_msgSend(v17, sel_isPaired, v27, v28);

      if (v19)
      {
        v20 = __OFADD__(v15++, 1);
        if (v20)
          break;
      }
      if (v13 == ++v14)
        goto LABEL_13;
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRelease();
    a4[1] = v15;
    swift_bridgeObjectRetain();
    v21 = 0;
    v22 = 0;
    while (1)
    {
      v23 = v16 ? (id)MEMORY[0x2494F7D64](v21, v12) : *(id *)(v12 + 8 * v21 + 32);
      v24 = v23;
      v25 = objc_msgSend(v23, sel_isActive);

      if (v25)
      {
        v20 = __OFADD__(v22++, 1);
        if (v20)
          break;
      }
      if (v13 == ++v21)
        goto LABEL_22;
    }
    __break(1u);
LABEL_22:
    swift_bridgeObjectRelease();
    v10 = v28;
    a4[2] = v22;
    if (!v27)
      goto LABEL_23;
    goto LABEL_26;
  }
  __break(1u);
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay10Foundation4UUIDVG_20PairedDeviceRegistry0G5_ImplCs5NeverOTg504_s20fg44Registry0C5StateV11LoggingInfoVyAeCcfcAA0B5_I24C10Foundation4UUIDVXEfU_AJ0hN0VTf1cn_nTf4ng_n(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  objc_class *v16;
  char *v17;
  char *v18;
  id v19;
  id v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  objc_super v27;
  uint64_t v28;

  v24 = a4;
  v8 = type metadata accessor for UUID();
  v25 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v11)
  {
    v21 = v4;
    v28 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray.reserveCapacity(_:)();
    v13 = (char *)(a1 + ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80)));
    v14 = *(_QWORD *)(v25 + 72);
    v22 = *(void (**)(char *, char *, uint64_t))(v25 + 16);
    v23 = v14;
    do
    {
      v15 = v22;
      v22(v10, v13, v8);
      v16 = (objc_class *)type metadata accessor for Device_Impl();
      v17 = (char *)objc_allocWithZone(v16);
      v15(&v17[OBJC_IVAR___PDRDevice_Impl_uuid_], v10, v8);
      v18 = &v17[OBJC_IVAR___PDRDevice_Impl_registryState];
      *(_QWORD *)v18 = a2;
      *((_QWORD *)v18 + 1) = a3;
      *((_QWORD *)v18 + 2) = v24;
      v27.receiver = v17;
      v27.super_class = v16;
      v19 = a2;
      v20 = a3;
      v26 = objc_msgSendSuper2(&v27, sel_init);
      (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v8);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v13 += v23;
      --v11;
    }
    while (v11);
    return v28;
  }
  return result;
}

id Migrator_Impl.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id Migrator_Impl.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Migrator_Impl();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for Migrator_Impl()
{
  return objc_opt_self();
}

id Migrator_Impl.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Migrator_Impl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t Registry_Impl.notify(deviceColletionDiff:state:)(void *a1, void *a2, void *a3, uint64_t a4)
{
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  os_unfair_lock_s *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  BOOL v17;
  os_unfair_lock_s *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  char *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD aBlock[6];

  v5 = v4;
  v33 = a4;
  v35 = a3;
  v36 = a1;
  v37 = a2;
  v34 = type metadata accessor for DispatchWorkItemFlags();
  v40 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS();
  v38 = *(_QWORD *)(v8 - 8);
  v39 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(v4, sel_compatibilityState);
  v12 = OBJC_IVAR___PDRRegistry_Impl_unfairLock;
  v13 = *(os_unfair_lock_s **)&v4[OBJC_IVAR___PDRRegistry_Impl_unfairLock];
  swift_retain();
  os_unfair_lock_lock(v13 + 4);
  swift_release();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  v14 = swift_retain();
  specialized WeakCollection.sweep(action:)(v14, aBlock);
  swift_release();
  v15 = aBlock[0];
  v16 = *(id *)&v5[OBJC_IVAR___PDRRegistry_Impl_lastCompatibilityState];
  if (v11 != v16)
    *(_QWORD *)&v5[OBJC_IVAR___PDRRegistry_Impl_lastCompatibilityState] = v11;
  v17 = v11 != v16;
  v18 = *(os_unfair_lock_s **)&v5[v12];
  swift_retain();
  os_unfair_lock_unlock(v18 + 4);
  swift_release();
  v19 = objc_msgSend(v5, sel_callbackQueue);
  v20 = swift_allocObject();
  v22 = v36;
  v21 = v37;
  *(_QWORD *)(v20 + 16) = v36;
  *(_QWORD *)(v20 + 24) = v21;
  v23 = v35;
  v24 = v33;
  *(_QWORD *)(v20 + 32) = v35;
  *(_QWORD *)(v20 + 40) = v24;
  *(_QWORD *)(v20 + 48) = v15;
  *(_QWORD *)(v20 + 56) = v5;
  *(_BYTE *)(v20 + 64) = v17;
  aBlock[4] = partial apply for specialized closure #1 in Registry_Impl.notify(deviceColletionDiff:state:);
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_15_0;
  v25 = _Block_copy(aBlock);
  v26 = v23;
  v27 = v5;
  v28 = v22;
  v29 = v21;
  static DispatchQoS.unspecified.getter();
  v41 = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  v30 = v34;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x2494F7CBC](0, v10, v7, v25);
  _Block_release(v25);

  (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v30);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v10, v39);
  return swift_release();
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed UUID?, @in_guaranteed Date?) -> ()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, char *);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void (**)(char *, char *))(a1 + 32);
  if (a2)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    v13 = type metadata accessor for UUID();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 0, 1, v13);
  }
  else
  {
    v14 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  }
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    v15 = type metadata accessor for Date();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v8, 0, 1, v15);
  }
  else
  {
    v16 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v8, 1, 1, v16);
  }
  swift_retain();
  v12(v11, v8);
  swift_release();
  outlined destroy of UUID?((uint64_t)v8, (uint64_t *)&demangling cache variable for type metadata for Date?);
  return outlined destroy of UUID?((uint64_t)v11, &demangling cache variable for type metadata for UUID?);
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyHashable, Any>);
  v2 = static _DictionaryStorage.allocate(capacity:)();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    outlined init with copy of RegistryState.LoggingInfo?(v6, (uint64_t)v15, &demangling cache variable for type metadata for (AnyHashable, Any));
    result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)outlined init with take of Any(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
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

id Registry_Impl.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id Registry_Impl.init()()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v1 = OBJC_IVAR___PDRRegistry_Impl_unfairLock;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  v2 = swift_allocObject();
  *(_DWORD *)(v2 + 16) = 0;
  *(_QWORD *)&v0[v1] = v2;
  v3 = OBJC_IVAR___PDRRegistry_Impl_delegates;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v0[v3] = v4;
  *(_QWORD *)&v0[OBJC_IVAR___PDRRegistry_Impl_lastCompatibilityState] = 0;
  v0[OBJC_IVAR___PDRRegistry_Impl_started_] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___PDRRegistry_Impl_status_] = 0;
  v0[OBJC_IVAR___PDRRegistry_Impl_amSingleton] = 0;
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for Registry_Impl();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for Registry_Impl()
{
  return objc_opt_self();
}

uint64_t static Registry_Impl.supportsWatch()()
{
  if (one-time initialization token for supportWatch != -1)
    swift_once();
  return static RegistryCrux.supportWatch;
}

void Registry_Impl.computeCompatibilityState()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  void *v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;

  if (one-time initialization token for instance != -1)
    swift_once();
  v1 = static RegistryCrux.instance;
  v2 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
  v3 = *(os_unfair_lock_s **)(static RegistryCrux.instance
                            + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock);
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v3 + 4);
  swift_release();
  v4 = *(void **)(v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_);
  v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 16);
  v6 = *(os_unfair_lock_s **)(v1 + v2);
  v7 = *(id *)(v1 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 8);
  swift_retain();
  v8 = v4;
  os_unfair_lock_unlock(v6 + 4);

  swift_release();
  swift_release();
  if (v5 < 0)
    return;
  v9 = objc_msgSend(v0, sel_getDevicesExcluding_, 4);
  type metadata accessor for PDRDevice();
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    v13 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v13)
      goto LABEL_6;
LABEL_13:
    swift_bridgeObjectRelease();
    return;
  }
  if (!*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_13;
LABEL_6:
  if ((v10 & 0xC000000000000001) != 0)
  {
    v11 = (id)MEMORY[0x2494F7D64](0, v10);
  }
  else
  {
    if (!*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    v11 = *(id *)(v10 + 32);
  }
  v12 = v11;
  swift_bridgeObjectRelease();
  if ((objc_msgSend(v12, sel_isArchived) & 1) == 0)
    PDRDevice.compatibilityState.getter();

}

Swift::Void __swiftcall Registry_Impl.start()()
{
  objc_class *v0;
  uint64_t v1;
  PDRRegistry v2;
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  os_unfair_lock_s *v9;
  id v10;
  id v11;

  v1 = OBJC_IVAR___PDRRegistry_Impl_started_;
  if ((*((_BYTE *)v0 + OBJC_IVAR___PDRRegistry_Impl_started_) & 1) != 0)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    if (one-time initialization token for instance != -1)
      swift_once();
    swift_retain();
    v2.super.isa = v0;
    RegistryCrux.add(registry:)(v2);
    swift_release();
    *((_BYTE *)v0 + v1) = 1;
    if ((*((_BYTE *)v0 + OBJC_IVAR___PDRRegistry_Impl_amSingleton) & 1) == 0)
    {
      v3 = static RegistryCrux.instance;
      v4 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
      v5 = *(os_unfair_lock_s **)(static RegistryCrux.instance
                                + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock);
      swift_retain();
      swift_retain();
      os_unfair_lock_lock(v5 + 4);
      swift_release();
      v7 = *(void **)(v3 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_);
      v6 = *(void **)(v3 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 8);
      v8 = *(_QWORD *)(v3 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 16);
      v9 = *(os_unfair_lock_s **)(v3 + v4);
      v10 = v6;
      swift_retain();
      v11 = v7;
      os_unfair_lock_unlock(v9 + 4);
      swift_release();
      swift_release();
      Registry_Impl.bootstrapNotify(_:)(v11, v6, v8);

    }
  }
}

Swift::Void __swiftcall Registry_Impl.stop()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  _QWORD *v5;
  id v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  char v9;

  v1 = OBJC_IVAR___PDRRegistry_Impl_started_;
  if (*((_BYTE *)v0 + OBJC_IVAR___PDRRegistry_Impl_started_) != 1
    || (*((_BYTE *)v0 + OBJC_IVAR___PDRRegistry_Impl_amSingleton) & 1) != 0)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    if (one-time initialization token for instance != -1)
      swift_once();
    v2 = static RegistryCrux.instance;
    v3 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
    v4 = *(os_unfair_lock_s **)(static RegistryCrux.instance
                              + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock);
    swift_retain();
    swift_retain();
    os_unfair_lock_lock(v4 + 4);
    swift_release();
    v5 = *(_QWORD **)(v2 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registries_);
    v6 = v0;
    v7 = swift_retain();
    specialized WeakCollection.sweep(action:)(v7, v6, v5, &v9);
    swift_release();

    v8 = *(os_unfair_lock_s **)(v2 + v3);
    swift_retain();
    os_unfair_lock_unlock(v8 + 4);
    swift_release();
    swift_release();
    *((_BYTE *)v0 + v1) = 0;
  }
}

void Registry_Impl.getActivePairedDeviceIncludingAltAccount()(uint64_t a1)
{
  void *v1;
  id v2;
  unint64_t v3;
  id v4;
  uint64_t v5;

  v2 = objc_msgSend(v1, sel_getDevicesExcluding_, a1);
  type metadata accessor for PDRDevice();
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v5)
      goto LABEL_6;
  }
  else if (!*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_6:
    swift_bridgeObjectRelease();
    return;
  }
  if ((v3 & 0xC000000000000001) != 0)
  {
    MEMORY[0x2494F7D64](0, v3);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v4 = *(id *)(v3 + 32);
    goto LABEL_6;
  }
  __break(1u);
}

uint64_t Registry_Impl.add(delegate:)()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  unint64_t v8;
  os_unfair_lock_s *v9;
  uint64_t v11;
  _BYTE v12[8];

  v1 = OBJC_IVAR___PDRRegistry_Impl_unfairLock;
  v2 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR___PDRRegistry_Impl_unfairLock);
  swift_retain();
  os_unfair_lock_lock(v2 + 4);
  swift_release();
  v3 = *(_QWORD *)(v0 + OBJC_IVAR___PDRRegistry_Impl_delegates);
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  outlined init with take of WeakCollection<PDRRegistryDelegate>.Weak((uint64_t)&v11, (uint64_t)v12);
  v4 = (_QWORD *)(v3 + 16);
  swift_beginAccess();
  v5 = *(_QWORD **)(v3 + 16);
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v3 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v5[2] + 1, 1, (unint64_t)v5);
    *v4 = v5;
  }
  v8 = v5[2];
  v7 = v5[3];
  if (v8 >= v7 >> 1)
  {
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v7 > 1), v8 + 1, 1, (unint64_t)v5);
    *v4 = v5;
  }
  v5[2] = v8 + 1;
  outlined init with take of WeakCollection<PDRRegistryDelegate>.Weak((uint64_t)v12, (uint64_t)&v5[v8 + 4]);
  swift_endAccess();
  swift_release();
  v9 = *(os_unfair_lock_s **)(v0 + v1);
  swift_retain();
  os_unfair_lock_unlock(v9 + 4);
  return swift_release();
}

uint64_t Registry_Impl.remove(delegate:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  os_unfair_lock_s *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  unsigned __int8 v10;

  v3 = OBJC_IVAR___PDRRegistry_Impl_unfairLock;
  v4 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR___PDRRegistry_Impl_unfairLock);
  swift_retain();
  os_unfair_lock_lock(v4 + 4);
  swift_release();
  v5 = *(_QWORD **)(v1 + OBJC_IVAR___PDRRegistry_Impl_delegates);
  v10 = 0;
  swift_unknownObjectRetain();
  v6 = swift_retain();
  specialized WeakCollection.sweep(action:)(v6, a1, v5, &v10);
  swift_release();
  swift_unknownObjectRelease();
  v7 = v10;
  v8 = *(os_unfair_lock_s **)(v1 + v3);
  swift_retain();
  os_unfair_lock_unlock(v8 + 4);
  swift_release();
  return v7;
}

uint64_t closure #1 in Registry_Impl.device(forBluetoothID:)(void **a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  char v14;
  void (*v15)(char *, uint64_t);
  uint64_t v17;

  v4 = type metadata accessor for UUID();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - v9;
  v11 = *a1;
  if ((objc_msgSend(v11, sel_isActive) & 1) != 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, a2, v4);
  }
  else
  {
    v12 = objc_msgSend(v11, sel_isPaired);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, a2, v4);
    if ((v12 & 1) == 0)
    {
      v14 = 0;
      v15 = *(void (**)(char *, uint64_t))(v5 + 8);
      goto LABEL_6;
    }
  }
  v13 = objc_msgSend(v11, sel_bluetoothIdentifier);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  v14 = static UUID.== infix(_:_:)();
  v15 = *(void (**)(char *, uint64_t))(v5 + 8);
  v15(v8, v4);
LABEL_6:
  v15(v10, v4);
  return v14 & 1;
}

void *specialized Sequence.first(where:)(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v13;

  if (a3 >> 62)
    goto LABEL_16;
  v6 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; v6 = _CocoaArrayWrapper.endIndex.getter())
  {
    v7 = 4;
    while (1)
    {
      v8 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2494F7D64](v7 - 4, a3) : *(id *)(a3 + 8 * v7);
      v9 = v8;
      v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      v13 = v8;
      v11 = a1(&v13);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return v9;
      }
      if ((v11 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return v9;
      }

      ++v7;
      if (v10 == v6)
        goto LABEL_11;
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t closure #1 in Registry_Impl.device(forPairingID:)(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  char v7;
  uint64_t v9;

  v2 = type metadata accessor for UUID();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(*a1, sel_pairingID);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  v7 = static UUID.== infix(_:_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7 & 1;
}

id @objc Registry_Impl.device(forBluetoothID:)(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(id *))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  id v10;
  id v11;
  unint64_t v12;
  void *v13;
  _BYTE v15[16];
  _BYTE *v16;

  v6 = type metadata accessor for UUID();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = &v15[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a1;
  v11 = objc_msgSend(v10, sel_getDevicesExcluding_, 0);
  type metadata accessor for PDRDevice();
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v16 = v9;
  v13 = specialized Sequence.first(where:)(a4, (uint64_t)v15, v12);

  swift_bridgeObjectRelease();
  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

id Registry_Impl.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Registry_Impl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t specialized closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void **p_ivar_lyt;
  unint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  Class isa;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint8_t *v39;
  id v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint8_t *v45;
  unsigned __int8 v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  Class v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint8_t *v55;
  unsigned __int8 v56;
  Class v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  uint8_t *v62;
  unsigned __int8 v63;
  id v64;
  uint64_t v65;
  int v66;
  int v67;
  id v68;
  char v69;
  char v70;
  unint64_t v71;
  id v72;
  __int16 v73;
  __int16 v74;
  id v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  __int16 v82;
  __int16 v83;
  id v84;
  uint64_t inited;
  uint64_t v86;
  id v87;
  Class v88;
  char v89;
  char v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  Class v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  int v102;
  int v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  Class v108;
  uint64_t result;
  uint64_t v110;
  const __CFString *v111;
  const __CFString *v112;
  uint64_t v113;
  const __CFString *v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void (*v120)(char *, unint64_t, uint64_t);
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  id v124;
  void (*v125)(char *, uint64_t, uint64_t, uint64_t);
  __int128 v126;
  const __CFString *v127;
  unint64_t v128;
  int v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t v137;
  void *v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;

  v129 = a7;
  v140 = a6;
  v134 = a4;
  v138 = a3;
  v132 = a2;
  v9 = type metadata accessor for UUID();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v133 = (uint64_t)&v110 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v110 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v124 = a1;
  v15 = objc_msgSend(a1, sel_allPairingIDs);
  v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v123 = *(_QWORD *)(v16 + 16);
  if (v123)
  {
    v17 = 0;
    v122 = v16 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
    v18 = a5 & 0xFFFFFFFFFFFFFF8;
    v119 = a5 & 0xFFFFFFFFFFFFFF8;
    if (a5 < 0)
      v18 = a5;
    v110 = v18;
    v137 = a5 & 0xC000000000000001;
    v19 = *(_QWORD *)(v10 + 72);
    v120 = *(void (**)(char *, unint64_t, uint64_t))(v10 + 16);
    v121 = v19;
    v114 = CFSTR("com.apple.watch.paireddeviceregistry.didunpair");
    v127 = CFSTR("pdr.device");
    p_ivar_lyt = (void **)(&NotifyState + 16);
    v112 = CFSTR("com.apple.watch.paireddeviceregistry.didpair");
    v113 = MEMORY[0x24BEE4AD8] + 8;
    v111 = CFSTR("com.apple.watch.paireddeviceregistry.didsetup");
    v126 = xmmword_2433C8220;
    v117 = v10;
    v118 = v9;
    v21 = a5;
    v131 = a5;
    v115 = v16;
    v116 = v14;
    while (1)
    {
      v120(v14, v122 + v121 * v17, v9);
      v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
      v22(v14, 0, 1, v9);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v14, 1, v9) == 1)
        break;
      (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v133, v14, v9);
      isa = UUID._bridgeToObjectiveC()().super.isa;
      v24 = objc_msgSend(v124, sel_objectForKeyedSubscript_, isa, v110);

      v139 = v24;
      if (!v24)
      {
LABEL_69:
        __break(1u);
LABEL_70:
        result = _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
        return result;
      }
      v135 = swift_allocObject();
      *(_QWORD *)(v135 + 16) = 0;
      v25 = swift_allocObject();
      v141 = v25;
      *(_QWORD *)(v25 + 16) = 0;
      *(_BYTE *)(v25 + 26) = 0;
      *(_WORD *)(v25 + 24) = 0;
      v128 = v17;
      v125 = v22;
      if (v21 >> 62)
      {
        swift_bridgeObjectRetain();
        v26 = _CocoaArrayWrapper.endIndex.getter();
        if (v26)
        {
LABEL_9:
          v27 = 4;
          v130 = v26;
          do
          {
            v28 = v27 - 4;
            if (v137)
            {
              v29 = (void *)MEMORY[0x2494F7D64](v27 - 4, v21);
              v30 = v27 - 3;
              if (__OFADD__(v28, 1))
                goto LABEL_68;
            }
            else
            {
              v29 = *(void **)(v21 + 8 * v27);
              swift_unknownObjectRetain();
              v30 = v27 - 3;
              if (__OFADD__(v28, 1))
              {
LABEL_68:
                __break(1u);
                goto LABEL_69;
              }
            }
            if ((objc_msgSend(v29, sel_respondsToSelector_, p_ivar_lyt[442]) & 1) != 0)
            {
              objc_msgSend(v29, (SEL)p_ivar_lyt[442], v140);
            }
            else
            {
              v32 = v138;
              v31 = v139;
              v34 = v132;
              v33 = v133;
              if ((v129 & 1) != 0)
              {
                if (one-time initialization token for framework != -1)
                  swift_once();
                v35 = type metadata accessor for Logger();
                __swift_project_value_buffer(v35, (uint64_t)static Logs.framework);
                v36 = Logger.logObject.getter();
                v37 = static os_log_type_t.default.getter();
                if (os_log_type_enabled(v36, v37))
                {
                  v38 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)v38 = 0;
                  _os_log_impl(&dword_2433AF000, v36, v37, "Informing delegate about compatibility state change", v38, 2u);
                  v39 = v38;
                  v32 = v138;
                  MEMORY[0x2494F8478](v39, -1, -1);
                }

              }
              v40 = objc_msgSend(v31, sel_changeType);
              v136 = v30;
              if (v40 == (id)2)
              {
                if (one-time initialization token for framework != -1)
                  swift_once();
                v51 = type metadata accessor for Logger();
                __swift_project_value_buffer(v51, (uint64_t)static Logs.framework);
                v52 = Logger.logObject.getter();
                v53 = static os_log_type_t.default.getter();
                if (os_log_type_enabled(v52, v53))
                {
                  v54 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)v54 = 0;
                  _os_log_impl(&dword_2433AF000, v52, v53, "Informing delegate about device removal", v54, 2u);
                  v55 = v54;
                  v32 = v138;
                  MEMORY[0x2494F8478](v55, -1, -1);
                }

                v56 = objc_msgSend(v29, sel_respondsToSelector_, sel_registry_removed_);
                v47 = v134;
                if ((v56 & 1) != 0)
                {
                  swift_unknownObjectRetain();
                  v57 = UUID._bridgeToObjectiveC()().super.isa;
                  objc_msgSend(v29, sel_registry_removed_, v140, v57);
                  swift_unknownObjectRelease();

                }
              }
              else if (v40 == (id)1)
              {
                if (one-time initialization token for framework != -1)
                  swift_once();
                v41 = type metadata accessor for Logger();
                __swift_project_value_buffer(v41, (uint64_t)static Logs.framework);
                v42 = Logger.logObject.getter();
                v43 = static os_log_type_t.default.getter();
                if (os_log_type_enabled(v42, v43))
                {
                  v44 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)v44 = 0;
                  _os_log_impl(&dword_2433AF000, v42, v43, "Informing delegate about property changes", v44, 2u);
                  v45 = v44;
                  v32 = v138;
                  MEMORY[0x2494F8478](v45, -1, -1);
                }

                v46 = objc_msgSend(v29, sel_respondsToSelector_, sel_registry_changed_properties_);
                v47 = v134;
                if ((v46 & 1) != 0)
                {
                  swift_unknownObjectRetain();
                  v48 = v135;
                  v49 = getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v135, v33, v34, v32, v47);
                  getter of alteredProperties #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v141, v31, v48, v33, v34, v32, v47);
                  type metadata accessor for PDRDevicePropertyKey(0);
                  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type PDRDevicePropertyKey and conformance PDRDevicePropertyKey, (uint64_t (*)(uint64_t))type metadata accessor for PDRDevicePropertyKey, (uint64_t)&protocol conformance descriptor for PDRDevicePropertyKey);
                  v50 = Set._bridgeToObjectiveC()().super.isa;
                  objc_msgSend(v29, sel_registry_changed_properties_, v140, v49, v50);

                  v47 = v134;
                  swift_bridgeObjectRelease();
                  swift_unknownObjectRelease();

                  v32 = v138;
                }
              }
              else
              {
                if (v40)
                  goto LABEL_70;
                if (one-time initialization token for framework != -1)
                  swift_once();
                v58 = type metadata accessor for Logger();
                __swift_project_value_buffer(v58, (uint64_t)static Logs.framework);
                v59 = Logger.logObject.getter();
                v60 = static os_log_type_t.default.getter();
                if (os_log_type_enabled(v59, v60))
                {
                  v61 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)v61 = 0;
                  _os_log_impl(&dword_2433AF000, v59, v60, "Informing delegate about device creation", v61, 2u);
                  v62 = v61;
                  v32 = v138;
                  MEMORY[0x2494F8478](v62, -1, -1);
                }

                v63 = objc_msgSend(v29, sel_respondsToSelector_, sel_registry_added_);
                v47 = v134;
                if ((v63 & 1) != 0)
                {
                  swift_unknownObjectRetain();
                  v64 = getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v135, v33, v34, v32, v47);
                  objc_msgSend(v29, sel_registry_added_, v140, v64);

                  swift_unknownObjectRelease();
                }
              }
              v65 = v135;
              getter of alteredProperties #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v141, v31, v135, v33, v34, v32, v47);
              v67 = v66;
              swift_bridgeObjectRelease();
              if ((v67 & 0x10000) != 0
                && (objc_msgSend(v29, sel_respondsToSelector_, sel_registry_didSetup_) & 1) != 0)
              {
                swift_unknownObjectRetain();
                v68 = getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v65, v33, v34, v32, v47);
                objc_msgSend(v29, sel_registry_didSetup_, v140, v68);

                swift_unknownObjectRelease();
              }
              getter of alteredProperties #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v141, v31, v65, v33, v34, v32, v47);
              v70 = v69;
              swift_bridgeObjectRelease();
              v71 = v131;
              if ((v70 & 1) != 0
                && (objc_msgSend(v29, sel_respondsToSelector_, sel_registry_didPair_) & 1) != 0)
              {
                swift_unknownObjectRetain();
                v72 = getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v65, v33, v34, v32, v47);
                objc_msgSend(v29, sel_registry_didPair_, v140, v72);

                swift_unknownObjectRelease();
              }
              getter of alteredProperties #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v141, v139, v65, v33, v34, v32, v47);
              v74 = v73;
              swift_bridgeObjectRelease();
              p_ivar_lyt = &NotifyState.ivar_lyt;
              v26 = v130;
              v21 = v71;
              v30 = v136;
              if ((v74 & 0x100) != 0
                && (objc_msgSend(v29, sel_respondsToSelector_, sel_registry_didUnpair_) & 1) != 0)
              {
                swift_unknownObjectRetain();
                v75 = getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v135, v133, v132, v138, v134);
                objc_msgSend(v29, sel_registry_didUnpair_, v140, v75);

                swift_unknownObjectRelease();
              }
            }
            swift_unknownObjectRelease();
            ++v27;
          }
          while (v30 != v26);
        }
      }
      else
      {
        v26 = *(_QWORD *)(v119 + 16);
        swift_bridgeObjectRetain();
        if (v26)
          goto LABEL_9;
      }
      swift_bridgeObjectRelease();
      v76 = v141;
      v77 = v138;
      v79 = v134;
      v78 = v135;
      v80 = v132;
      v81 = v133;
      getter of alteredProperties #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v141, v139, v135, v133, v132, v138, v134);
      v83 = v82;
      swift_bridgeObjectRelease();
      if ((v83 & 0x100) != 0)
      {
        v84 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = v126;
        v142 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v143 = v86;
        AnyHashable.init<A>(_:)();
        v87 = getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v135, v81, v80, v77, v79);
        *(_QWORD *)(inited + 96) = type metadata accessor for PDRDevice();
        *(_QWORD *)(inited + 72) = v87;
        specialized Dictionary.init(dictionaryLiteral:)(inited);
        v88 = Dictionary._bridgeToObjectiveC()().super.isa;
        v76 = v141;
        v78 = v135;
        swift_bridgeObjectRelease();
        objc_msgSend(v84, sel_postNotificationName_object_userInfo_, v114, v140, v88);

        v21 = v131;
      }
      getter of alteredProperties #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v76, v139, v78, v81, v80, v77, v79);
      v90 = v89;
      swift_bridgeObjectRelease();
      if ((v90 & 1) != 0)
      {
        v91 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
        v92 = swift_initStackObject();
        *(_OWORD *)(v92 + 16) = v126;
        v142 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v143 = v93;
        AnyHashable.init<A>(_:)();
        v94 = getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v135, v81, v80, v77, v79);
        *(_QWORD *)(v92 + 96) = type metadata accessor for PDRDevice();
        *(_QWORD *)(v92 + 72) = v94;
        specialized Dictionary.init(dictionaryLiteral:)(v92);
        v95 = Dictionary._bridgeToObjectiveC()().super.isa;
        v76 = v141;
        v78 = v135;
        swift_bridgeObjectRelease();
        objc_msgSend(v91, sel_postNotificationName_object_userInfo_, v112, v140, v95);

        v21 = v131;
      }
      v17 = v128 + 1;
      v96 = v80;
      v97 = v139;
      v98 = v79;
      v99 = v96;
      v100 = v77;
      v101 = v98;
      getter of alteredProperties #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v76, v139, v78, v81, v96, v100, v98);
      v103 = v102;
      swift_bridgeObjectRelease();
      if ((v103 & 0x10000) != 0)
      {
        v104 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
        v105 = swift_initStackObject();
        *(_OWORD *)(v105 + 16) = v126;
        v142 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v143 = v106;
        AnyHashable.init<A>(_:)();
        v107 = getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v78, v81, v99, v138, v101);
        *(_QWORD *)(v105 + 96) = type metadata accessor for PDRDevice();
        *(_QWORD *)(v105 + 72) = v107;
        specialized Dictionary.init(dictionaryLiteral:)(v105);
        v108 = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        objc_msgSend(v104, sel_postNotificationName_object_userInfo_, v111, v140, v108);

        v21 = v131;
        v10 = v117;
        v9 = v118;
        (*(void (**)(uint64_t, uint64_t))(v117 + 8))(v81, v118);
        swift_release();
        swift_release();
      }
      else
      {
        v10 = v117;
        v9 = v118;
        (*(void (**)(uint64_t, uint64_t))(v117 + 8))(v81, v118);
        swift_release();
        swift_release();

      }
      v14 = v116;
      if (v17 == v123)
        goto LABEL_66;
      p_ivar_lyt = (void **)(&NotifyState + 16);
      if (v17 >= *(_QWORD *)(v115 + 16))
      {
        __break(1u);
        goto LABEL_65;
      }
    }
  }
  else
  {
LABEL_65:
    v125 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
LABEL_66:
    v125(v14, 1, 1, v9);
  }
  return swift_bridgeObjectRelease();
}

id getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void **v15;
  void *v16;
  id v17;
  void (*v18)(char *, uint64_t, uint64_t);
  objc_class *v19;
  char *v20;
  char *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v28;
  objc_super v29;

  v10 = type metadata accessor for UUID();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(void **)(a1 + 16);
  v15 = (void **)(a1 + 16);
  v14 = v16;
  if (v16)
  {
    v17 = v14;
  }
  else
  {
    v18 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    v18(v13, a2, v10);
    v19 = (objc_class *)type metadata accessor for Device_Impl();
    v20 = (char *)objc_allocWithZone(v19);
    v18(&v20[OBJC_IVAR___PDRDevice_Impl_uuid_], (uint64_t)v13, v10);
    v21 = &v20[OBJC_IVAR___PDRDevice_Impl_registryState];
    *(_QWORD *)v21 = a3;
    *((_QWORD *)v21 + 1) = a4;
    *((_QWORD *)v21 + 2) = a5;
    v29.receiver = v20;
    v29.super_class = v19;
    v22 = a3;
    v23 = a4;
    v24 = objc_msgSendSuper2(&v29, sel_init);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    swift_beginAccess();
    v25 = *v15;
    *v15 = v24;
    v17 = v24;

    v14 = 0;
  }
  v26 = v14;
  return v17;
}

uint64_t getter of alteredProperties #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  __int16 v12;

  v8 = *(_QWORD *)(a1 + 16);
  if (v8)
  {
    v9 = v8;
  }
  else
  {
    v9 = closure #2 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(a2, a3, a4, a5, a6, a7);
    v11 = HIWORD(v10) & 1;
    v12 = v10 & 0x101;
    swift_beginAccess();
    *(_QWORD *)(a1 + 16) = v9;
    *(_BYTE *)(a1 + 26) = v11;
    *(_WORD *)(a1 + 24) = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v9;
}

uint64_t closure #2 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
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
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void (*v32)(char *, uint64_t, uint64_t);
  void (*v33)(uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t v42;
  id v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  int v51;
  id v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char *v60;
  id v61;
  uint64_t v63;
  const __CFString *v64;
  char *v65;
  char *v66;
  char *v67;
  const __CFString *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  char *v77;
  char *v78;
  id v79;
  uint64_t v80;

  v71 = a5;
  v72 = a6;
  v69 = a2;
  v70 = a4;
  v8 = type metadata accessor for UUID();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v65 = (char *)&v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v76 = (char *)&v63 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v67 = (char *)&v63 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v78 = (char *)&v63 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v66 = (char *)&v63 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v77 = (char *)&v63 - v20;
  v80 = MEMORY[0x24BEE4B08];
  v21 = objc_msgSend(a1, sel_diff);
  if (v21)
  {
    v22 = v21;
    v23 = objc_msgSend(v21, sel_allPropertyNames);

    if (v23)
    {
      v24 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      v25 = *(_QWORD *)(v24 + 16);
      if (v25)
      {
        v75 = 0;
        v26 = 0;
        v68 = CFSTR("isPaired");
        v63 = v24;
        v64 = CFSTR("isSetup");
        v27 = (uint64_t *)(v24 + 40);
        v73 = v9;
        v74 = a3;
        while (1)
        {
          v28 = *(v27 - 1);
          v29 = *v27;
          swift_bridgeObjectRetain();
          v30 = (void *)MEMORY[0x2494F7BCC](v28, v29);
          swift_bridgeObjectRelease();
          v31 = v30;
          specialized Set._Variant.insert(_:)(&v79, v31);

          v32 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
          v32(v77, a3, v8);
          if ((v75 & 0x100000000) != 0)
          {
            v33 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
            HIDWORD(v75) = 1;
            goto LABEL_18;
          }
          v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v36 = v35;
          if (v34 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v36 == v37)
          {
            swift_bridgeObjectRelease_n();
            v40 = (uint64_t)v66;
            v32(v66, (uint64_t)v77, v8);
            v42 = v73;
          }
          else
          {
            v39 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v40 = (uint64_t)v66;
            v32(v66, (uint64_t)v77, v8);
            v41 = 0;
            v42 = v73;
            if ((v39 & 1) == 0)
              goto LABEL_17;
          }
          v43 = getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v69, v40, v70, v71, v72);
          v41 = objc_msgSend(v43, sel_isPaired, v63, v64);

          v40 = (uint64_t)v66;
LABEL_17:
          HIDWORD(v75) = v41;
          v33 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
          v33(v40, v8);
          a3 = v74;
LABEL_18:
          v44 = v76;
          v33((uint64_t)v77, v8);
          v32(v78, a3, v8);
          if ((v75 & 1) != 0)
          {
            LODWORD(v75) = 1;
            goto LABEL_26;
          }
          v45 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v47 = v46;
          if (v45 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v47 == v48)
          {
            swift_bridgeObjectRelease_n();
            v49 = (uint64_t)v67;
            v32(v67, (uint64_t)v78, v8);
LABEL_24:
            v52 = getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v69, v49, v70, v71, v72);
            v53 = objc_msgSend(v52, sel_isPaired);

            v49 = (uint64_t)v67;
            v51 = v53 ^ 1;
            goto LABEL_25;
          }
          v50 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v49 = (uint64_t)v67;
          v32(v67, (uint64_t)v78, v8);
          v51 = 0;
          if ((v50 & 1) != 0)
            goto LABEL_24;
LABEL_25:
          LODWORD(v75) = v51;
          v33(v49, v8);
          a3 = v74;
          v44 = v76;
LABEL_26:
          v33((uint64_t)v78, v8);
          v32(v44, a3, v8);
          if ((v26 & 1) == 0)
          {
            v54 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            v56 = v55;
            if (v54 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v56 == v57)
            {
              swift_bridgeObjectRelease_n();
              v58 = (uint64_t)v65;
              v32(v65, (uint64_t)v76, v8);
              goto LABEL_31;
            }
            v59 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v58 = (uint64_t)v65;
            v60 = v76;
            v32(v65, (uint64_t)v76, v8);
            if ((v59 & 1) != 0)
            {
LABEL_31:
              v61 = getter of device #1 in closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(v69, v58, v70, v71, v72);
              v26 = objc_msgSend(v61, sel_isSetup);

              v31 = v61;
              v60 = v76;
            }
            else
            {
              v26 = 0;
            }

            v33(v58, v8);
            v33((uint64_t)v60, v8);
            a3 = v74;
            goto LABEL_6;
          }
          v33((uint64_t)v44, v8);

          v26 = 1;
LABEL_6:
          v9 = v73;
          v27 += 2;
          if (!--v25)
          {
            swift_bridgeObjectRelease();
            return v80;
          }
        }
      }
      swift_bridgeObjectRelease();
    }
  }
  return MEMORY[0x24BEE4B08];
}

uint64_t Registry_Impl.bootstrapNotify(_:)(void *a1, void *a2, uint64_t a3)
{
  char *v3;
  void *v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  os_unfair_lock_s *v14;
  uint64_t v15;
  uint64_t v16;
  os_unfair_lock_s *v17;
  id v18;
  _QWORD *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[6];

  v4 = v3;
  v26 = a3;
  v7 = type metadata accessor for DispatchWorkItemFlags();
  v29 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DispatchQoS();
  v27 = *(_QWORD *)(v10 - 8);
  v28 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = OBJC_IVAR___PDRRegistry_Impl_unfairLock;
  v14 = *(os_unfair_lock_s **)&v3[OBJC_IVAR___PDRRegistry_Impl_unfairLock];
  swift_retain();
  os_unfair_lock_lock(v14 + 4);
  swift_release();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  v15 = swift_retain();
  specialized WeakCollection.sweep(action:)(v15, aBlock);
  swift_release();
  v16 = aBlock[0];
  v17 = *(os_unfair_lock_s **)&v3[v13];
  swift_retain();
  os_unfair_lock_unlock(v17 + 4);
  swift_release();
  v18 = objc_msgSend(v4, sel_callbackQueue);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = v16;
  v19[3] = v4;
  v19[4] = a1;
  v19[5] = a2;
  v19[6] = v26;
  aBlock[4] = partial apply for closure #1 in Registry_Impl.bootstrapNotify(_:);
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_27;
  v20 = _Block_copy(aBlock);
  v21 = a2;
  v22 = v4;
  v23 = a1;
  static DispatchQoS.unspecified.getter();
  v30 = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x2494F7CBC](0, v12, v9, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v29 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v28);
  return swift_release();
}

uint64_t closure #1 in Registry_Impl.bootstrapNotify(_:)(unint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void **p_ivar_lyt;
  BOOL v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  void **v25;
  id v26;
  char *v27;
  void (*v28)(char *, char *, uint64_t);
  objc_class *v29;
  char *v30;
  char *v31;
  char *v32;
  id v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  char *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  char *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void (*v55)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v56;
  void (*v57)(char *, char *, uint64_t);
  id v58;
  objc_super v59;

  v51 = a4;
  v52 = a5;
  v53 = a2;
  v54 = a3;
  v6 = type metadata accessor for UUID();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v50 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v42 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
    goto LABEL_28;
  v15 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (v15)
  {
    v16 = 0;
    v17 = a1 & 0xC000000000000001;
    v45 = v15;
    v46 = a1;
    v42 = (char *)(a1 + 32);
    v43 = a1 & 0xFFFFFFFFFFFFFF8;
    p_ivar_lyt = (void **)(&NotifyState + 16);
    v49 = v6;
    v44 = a1 & 0xC000000000000001;
    while (v17)
    {
      v58 = (id)MEMORY[0x2494F7D64](v16, v46);
      v19 = __OFADD__(v16++, 1);
      if (v19)
        goto LABEL_26;
LABEL_12:
      a1 = (unint64_t)v58;
      if ((objc_msgSend(v58, sel_respondsToSelector_, p_ivar_lyt[442], v42) & 1) != 0)
      {
        objc_msgSend((id)a1, (SEL)p_ivar_lyt[442], v53);
        swift_unknownObjectRelease();
      }
      else
      {
        v48 = v16;
        v20 = objc_msgSend(v54, sel_allPairingIDs);
        v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

        v22 = *(_QWORD *)(v21 + 16);
        v47 = v21;
        if (v22)
        {
          v23 = v21 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
          v24 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
          v56 = *(_QWORD *)(v7 + 72);
          v57 = v24;
          v25 = (void **)(&NotifyState + 16);
          v26 = v58;
          v24(v14, (char *)v23, v6);
          while (1)
          {
            a1 = *(_QWORD *)(v7 + 56);
            ((void (*)(char *, _QWORD, uint64_t, uint64_t))a1)(v14, 0, 1, v6);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v14, 1, v6) == 1)
            {
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();
              v17 = v44;
              v15 = v45;
              v16 = v48;
              p_ivar_lyt = &NotifyState.ivar_lyt;
              goto LABEL_5;
            }
            v55 = (void (*)(char *, uint64_t, uint64_t, uint64_t))a1;
            (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v14, v6);
            if ((objc_msgSend(v26, sel_respondsToSelector_, v25[452]) & 1) != 0)
            {
              v27 = v50;
              v28 = v57;
              v57(v50, v11, v6);
              v29 = (objc_class *)type metadata accessor for Device_Impl();
              v30 = (char *)objc_allocWithZone(v29);
              v28(&v30[OBJC_IVAR___PDRDevice_Impl_uuid_], v27, v6);
              v31 = &v30[OBJC_IVAR___PDRDevice_Impl_registryState];
              v32 = v14;
              v33 = v54;
              v34 = v11;
              v35 = v7;
              v37 = v51;
              v36 = v52;
              *(_QWORD *)v31 = v54;
              *((_QWORD *)v31 + 1) = v37;
              *((_QWORD *)v31 + 2) = v36;
              v59.receiver = v30;
              v59.super_class = v29;
              swift_unknownObjectRetain();
              v38 = v33;
              v14 = v32;
              v25 = &NotifyState.ivar_lyt;
              v39 = v37;
              v7 = v35;
              v11 = v34;
              v6 = v49;
              v40 = objc_msgSendSuper2(&v59, sel_init);
              a1 = *(_QWORD *)(v7 + 8);
              ((void (*)(char *, uint64_t))a1)(v27, v6);
              objc_msgSend(v58, sel_registry_added_, v53, v40);
              swift_unknownObjectRelease();

              v26 = v58;
            }
            else
            {
              a1 = *(_QWORD *)(v7 + 8);
            }
            ((void (*)(char *, uint64_t))a1)(v11, v6);
            v23 += v56;
            if (!--v22)
              break;
            v57(v14, (char *)v23, v6);
          }
          v17 = v44;
          v15 = v45;
          v16 = v48;
          p_ivar_lyt = (void **)(&NotifyState + 16);
          v55(v14, 1, 1, v6);
        }
        else
        {
          v17 = v44;
          v15 = v45;
          v16 = v48;
          p_ivar_lyt = (void **)(&NotifyState + 16);
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v14, 1, 1, v6);
        }
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
      }
LABEL_5:
      if (v16 == v15)
        return swift_bridgeObjectRelease();
    }
    if (v16 >= *(_QWORD *)(v43 + 16))
      goto LABEL_27;
    v58 = *(id *)&v42[8 * v16];
    swift_unknownObjectRetain();
    v19 = __OFADD__(v16++, 1);
    if (!v19)
      goto LABEL_12;
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    swift_bridgeObjectRetain();
    v15 = _CocoaArrayWrapper.endIndex.getter();
  }
  return swift_bridgeObjectRelease();
}

void *Registry_Impl.unpair(device:options:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  uint64_t v9;

  v2 = type metadata accessor for UUID();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for instance != -1)
    swift_once();
  swift_retain();
  v6 = objc_msgSend(a1, sel_pairingID);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  v7 = RegistryCrux.unpair(pairingID:options:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7;
}

void *Registry_Impl.failsafeUnpair(options:)()
{
  void *v0;

  if (one-time initialization token for instance != -1)
    swift_once();
  swift_retain();
  v0 = RegistryCrux.failsafeUnpair(options:)();
  swift_release();
  return v0;
}

void Registry_Impl.setActive(device:results:)(void *a1, void (*a2)(void *, id))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  objc_class *active;
  _BYTE *v12;
  uint64_t *v13;
  id v14;
  id v15;
  objc_super v16;

  if (one-time initialization token for instance != -1)
    swift_once();
  swift_retain();
  v4 = RegistryCrux.setActive(device:)(a1);
  v6 = v5;
  v8 = v7;
  swift_release();
  if (v8)
  {
    v9 = v8;
    v10 = v8;
    a2(v8, 0);
    swift_bridgeObjectRelease();

  }
  else
  {
    active = (objc_class *)type metadata accessor for ActiveDeviceAssertion_Impl();
    v12 = objc_allocWithZone(active);
    v12[OBJC_IVAR___PDRActiveDeviceAssertion_Impl_valid] = 1;
    *(_QWORD *)&v12[OBJC_IVAR___PDRActiveDeviceAssertion_Impl_device_] = a1;
    v13 = (uint64_t *)&v12[OBJC_IVAR___PDRActiveDeviceAssertion_Impl_identifier_];
    *v13 = v4;
    v13[1] = v6;
    v16.receiver = v12;
    v16.super_class = active;
    v14 = a1;
    swift_bridgeObjectRetain();
    v15 = objc_msgSendSuper2(&v16, sel_init);
    a2(0, v15);

    swift_bridgeObjectRelease();
  }
}

Swift::Int __swiftcall Registry_Impl.lastSyncSwitchIndex()()
{
  Swift::Int v0;

  if (one-time initialization token for instance != -1)
    swift_once();
  swift_retain();
  v0 = RegistryCrux.lastSyncSwitchIndex()();
  swift_release();
  return v0;
}

uint64_t Registry_Impl.migrationCount(pairingID:)()
{
  uint64_t v0;

  if (one-time initialization token for instance != -1)
    swift_once();
  swift_retain();
  v0 = RegistryCrux.migrationCount(pairingID:)();
  swift_release();
  return v0;
}

void Registry_Impl.waitForPairingExtendedMetadata(advertisedName:results:)(uint64_t a1, uint64_t a2, void (*a3)(_QWORD, id))
{
  char v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  if (one-time initialization token for instance != -1)
    swift_once();
  swift_retain();
  v6 = RegistryCrux.waitForWatchPairingExtendedMetadata(advertisedName:)(a1, a2);
  v8 = v7;
  swift_release();
  if (v8)
  {
    v9 = objc_allocWithZone((Class)PDRPairingExtendedMetadata);
    v13 = v8;
    v10 = objc_msgSend(v9, sel_init);
    objc_msgSend(v10, sel_setChipID_, objc_msgSend(v13, sel_chipID));
    objc_msgSend(v10, sel_setPairingVersion_, objc_msgSend(v13, sel_pairingVersion));
    v11 = objc_msgSend(v13, sel_productType);
    objc_msgSend(v10, sel_setProductType_, v11);

    objc_msgSend(v10, sel_setPostFailsafeObliteration_, objc_msgSend(v13, sel_postFailsafeObliteration));
    objc_msgSend(v10, sel_setIsCellularEnabled_, objc_msgSend(v13, sel_isCellularEnabled));
    objc_msgSend(v10, sel_setEncodedSystemVersion_, objc_msgSend(v13, sel_encodedSystemVersion));
    v12 = v10;
    a3(v6 & 1, v10);

  }
  else
  {
    a3(v6 & 1, 0);
  }
}

void Registry_Impl.completeRTCPairingMetric(metricID:completion:)(uint64_t a1, uint64_t a2, void (*a3)(_QWORD, void *))
{
  char v6;
  void *v7;
  void *v8;

  if (one-time initialization token for instance != -1)
    swift_once();
  swift_retain();
  v6 = RegistryCrux.completeRTCPairingMetric(metricID:)(a1, a2);
  v8 = v7;
  swift_release();
  a3(v6 & 1, v8);

}

void Registry_Impl.pairingClientSetAltAccount(name:altDSID:device:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void (*a6)(void *))
{
  void *v12;

  if (one-time initialization token for instance != -1)
    swift_once();
  swift_retain();
  v12 = RegistryCrux.pairingClientSetAltAccount(name:altDSID:device:)(a1, a2, a3, a4, a5);
  swift_release();
  a6(v12);

}

Swift::Int __swiftcall Registry_Impl.maxPairedDeviceCount()()
{
  return 5;
}

Swift::Int __swiftcall Registry_Impl.maxTinkerPairedDeviceCount()()
{
  return 5;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      outlined init with copy of AnyHashable(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x2494F7D28](v9, a1);
      outlined destroy of AnyHashable((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t specialized Set._Variant.insert(_:)(_QWORD *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  Swift::Int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  char isUniquelyReferenced_nonNull_native;
  id v24;
  void *v26;
  id v27;
  uint64_t v28;

  v3 = v2;
  v6 = *v2;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  v7 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v3;
    *v3 = 0x8000000000000000;
    v24 = a2;
    specialized _NativeSet.insertNew(_:at:isUnique:)((uint64_t)v24, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v28;
    swift_bridgeObjectRelease();
    *a1 = v24;
    return 1;
  }
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;
  if (v10 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v12 == v13)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      v16 = ~v8;
      do
      {
        v9 = (v9 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
          goto LABEL_15;
        v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v19 = v18;
        if (v17 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v19 == v20)
          goto LABEL_16;
        v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      while ((v22 & 1) == 0);
    }
  }

  swift_bridgeObjectRelease();
  v26 = *(void **)(*(_QWORD *)(*v3 + 48) + 8 * v9);
  *a1 = v26;
  v27 = v26;
  return 0;
}

uint64_t specialized _NativeSet.resize(capacity:)()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  Swift::Int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  int64_t v28;
  _QWORD *v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<PDRDevicePropertyKey>);
  v3 = static _SetStorage.resize(original:capacity:move:)();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v27 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v29 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v28 = (unint64_t)(v5 + 63) >> 6;
    v8 = v3 + 56;
    result = swift_retain();
    v10 = 0;
    while (1)
    {
      if (v7)
      {
        v12 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v13 = v12 | (v10 << 6);
      }
      else
      {
        v14 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v14 >= v28)
          goto LABEL_33;
        v15 = v29[v14];
        ++v10;
        if (!v15)
        {
          v10 = v14 + 1;
          if (v14 + 1 >= v28)
            goto LABEL_33;
          v15 = v29[v10];
          if (!v15)
          {
            v10 = v14 + 2;
            if (v14 + 2 >= v28)
              goto LABEL_33;
            v15 = v29[v10];
            if (!v15)
            {
              v16 = v14 + 3;
              if (v16 >= v28)
              {
LABEL_33:
                swift_release();
                v1 = v27;
                v26 = 1 << *(_BYTE *)(v2 + 32);
                if (v26 > 63)
                  bzero(v29, ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v29 = -1 << v26;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v15 = v29[v16];
              if (!v15)
              {
                while (1)
                {
                  v10 = v16 + 1;
                  if (__OFADD__(v16, 1))
                    goto LABEL_39;
                  if (v10 >= v28)
                    goto LABEL_33;
                  v15 = v29[v10];
                  ++v16;
                  if (v15)
                    goto LABEL_23;
                }
              }
              v10 = v16;
            }
          }
        }
LABEL_23:
        v7 = (v15 - 1) & v15;
        v13 = __clz(__rbit64(v15)) + (v10 << 6);
      }
      v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v13);
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      Hasher.init(_seed:)();
      String.hash(into:)();
      v18 = Hasher._finalize()();
      result = swift_bridgeObjectRelease();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = v18 & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v8 + 8 * (v20 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v8 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v8 + 8 * v21);
        }
        while (v25 == -1);
        v11 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v11) = v17;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t specialized _NativeSet.insertNew(_:at:isUnique:)(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  Swift::Int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;

  v4 = v3;
  v6 = result;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_22;
  if ((a3 & 1) != 0)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v8 > v7)
    {
      result = (uint64_t)specialized _NativeSet.copy()();
LABEL_22:
      v25 = *v4;
      *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
      *(_QWORD *)(*(_QWORD *)(v25 + 48) + 8 * a2) = v6;
      v26 = *(_QWORD *)(v25 + 16);
      v27 = __OFADD__(v26, 1);
      v28 = v26 + 1;
      if (!v27)
      {
        *(_QWORD *)(v25 + 16) = v28;
        return result;
      }
      __break(1u);
      goto LABEL_25;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  v9 = *v3;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  v10 = Hasher._finalize()();
  result = swift_bridgeObjectRelease();
  v11 = -1 << *(_BYTE *)(v9 + 32);
  a2 = v10 & ~v11;
  if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
    goto LABEL_22;
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;
  if (v12 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v14 == v15)
  {
LABEL_25:
    swift_bridgeObjectRelease_n();
    goto LABEL_26;
  }
  v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v17 & 1) == 0)
  {
    v18 = ~v11;
    do
    {
      a2 = (a2 + 1) & v18;
      if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
        goto LABEL_22;
      v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v21 = v20;
      if (v19 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v21 == v22)
        goto LABEL_25;
      v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
    }
    while ((v24 & 1) == 0);
  }
LABEL_26:
  type metadata accessor for PDRDevicePropertyKey(0);
  result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

id specialized _NativeSet.copy()()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<PDRDevicePropertyKey>);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.copyAndResize(capacity:)()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  void *v17;
  id v18;
  Swift::Int v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<PDRDevicePropertyKey>);
  v3 = static _SetStorage.resize(original:capacity:move:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v27 = v0;
  v28 = v2 + 56;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v8 = v3 + 56;
  result = swift_retain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v29)
      goto LABEL_33;
    v15 = *(_QWORD *)(v28 + 8 * v14);
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v29)
        goto LABEL_33;
      v15 = *(_QWORD *)(v28 + 8 * v10);
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v29)
          goto LABEL_33;
        v15 = *(_QWORD *)(v28 + 8 * v10);
        if (!v15)
          break;
      }
    }
LABEL_23:
    v7 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v13);
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    Hasher.init(_seed:)();
    v18 = v17;
    String.hash(into:)();
    v19 = Hasher._finalize()();
    result = swift_bridgeObjectRelease();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = v19 & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v8 + 8 * (v21 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v8 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v8 + 8 * v22);
      }
      while (v26 == -1);
      v11 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v11) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_35;
  }
  v15 = *(_QWORD *)(v28 + 8 * v16);
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v29)
      goto LABEL_33;
    v15 = *(_QWORD *)(v28 + 8 * v10);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t specialized Registry_Impl.getDevicesExcluding(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  os_unfair_lock_s *v9;
  void *v10;
  void *v11;
  os_unfair_lock_s *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  id v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  char *v24;
  objc_class *v25;
  char *v26;
  char *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  char *v33;
  id v34;
  uint64_t v36;
  void (*v37)(char *, char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  void *v40;
  char *v41;
  id v42;
  id v43;
  uint64_t v44;
  objc_super v45;
  uint64_t v46;

  v2 = type metadata accessor for UUID();
  v44 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v41 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for instance != -1)
    swift_once();
  v7 = static RegistryCrux.instance;
  v8 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
  v9 = *(os_unfair_lock_s **)(static RegistryCrux.instance
                            + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock);
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v9 + 4);
  swift_release();
  v11 = *(void **)(v7 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_);
  v10 = *(void **)(v7 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 8);
  v39 = *(_QWORD *)(v7 + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_ + 16);
  v40 = v10;
  v12 = *(os_unfair_lock_s **)(v7 + v8);
  v43 = v10;
  swift_retain();
  v13 = v11;
  os_unfair_lock_unlock(v12 + 4);
  swift_release();
  swift_release();
  v42 = v13;
  v14 = objc_msgSend(v42, sel_allPairingIDs);
  v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v46 = MEMORY[0x24BEE4AF8];
  v16 = *(_QWORD *)(v15 + 16);
  v36 = v15;
  if (v16)
  {
    v17 = v44;
    v18 = v15 + ((*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80));
    v19 = *(_QWORD *)(v44 + 72);
    v37 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
    v20 = v37;
    v38 = v19;
    v37(v6, (char *)v18, v2);
    while (1)
    {
      v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
      v22(v6, 0, 1, v2);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v6, 1, v2) == 1)
        break;
      v23 = a1;
      v24 = v41;
      (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v41, v6, v2);
      v25 = (objc_class *)type metadata accessor for Device_Impl();
      v26 = (char *)objc_allocWithZone(v25);
      v20(&v26[OBJC_IVAR___PDRDevice_Impl_uuid_], v24, v2);
      v27 = &v26[OBJC_IVAR___PDRDevice_Impl_registryState];
      v28 = v42;
      v29 = v40;
      *(_QWORD *)v27 = v42;
      *((_QWORD *)v27 + 1) = v29;
      *((_QWORD *)v27 + 2) = v39;
      v45.receiver = v26;
      v45.super_class = v25;
      v30 = v28;
      v31 = v43;
      v17 = v44;
      v32 = objc_msgSendSuper2(&v45, sel_init, v36);
      v33 = v24;
      a1 = v23;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v33, v2);
      if (((v23 & 1) == 0 || objc_msgSend(v32, sel_isPaired))
        && ((v23 & 2) == 0 || (objc_msgSend(v32, sel_isArchived) & 1) == 0)
        && ((v23 & 4) == 0 || objc_msgSend(v32, sel_isActive))
        && ((v23 & 8) == 0 || (objc_msgSend(v32, sel_isActive) & 1) == 0)
        && ((v23 & 0x10) == 0 || objc_msgSend(v32, sel_isSetup))
        && ((v23 & 0x20) == 0 || (objc_msgSend(v32, sel_isAltAccount) & 1) == 0))
      {
        v21 = v32;
        MEMORY[0x2494F7C14]();
        if (*(_QWORD *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
        v17 = v44;
      }

      v20 = v37;
      v18 += v38;
      if (!--v16)
        goto LABEL_25;
      v37(v6, (char *)v18, v2);
    }
  }
  else
  {
    v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v44 + 56);
LABEL_25:
    v22(v6, 1, 1, v2);
  }
  v34 = v42;

  swift_bridgeObjectRelease();
  return v46;
}

uint64_t partial apply for closure #1 in RegistryCrux.deviceIDAtSwitchIndex(_:_:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in RegistryCrux.deviceIDAtSwitchIndex(_:_:)(a1, a2);
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

uint64_t partial apply for closure #1 in Registry_Impl.device(forBluetoothID:)(void **a1)
{
  uint64_t v1;

  return closure #1 in Registry_Impl.device(forBluetoothID:)(a1, *(_QWORD *)(v1 + 16)) & 1;
}

uint64_t partial apply for closure #1 in Registry_Impl.device(forPairingID:)(id *a1)
{
  return closure #1 in Registry_Impl.device(forPairingID:)(a1) & 1;
}

uint64_t method lookup function for Registry_Impl()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static Registry_Impl.supportsWatch()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

unint64_t specialized Registry_Impl.getSwitchEvents(after:process:)(int a1, Class a2, void (**a3)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  void **p_ivar_lyt;
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  void **v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  BOOL v19;
  unsigned int v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  os_unfair_lock_s *v31;
  void *v32;
  uint64_t *v33;
  uint64_t v34;
  os_unfair_lock_s *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int (*v48)(uint64_t, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  Class isa;
  unint64_t result;
  objc_class *v54;
  void **v55;
  void (**v56)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void **v61;
  uint64_t v62;
  void (*v63)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __int128 aBlock;
  uint64_t (*v79)(uint64_t, uint64_t, uint64_t);
  void *v80;
  uint64_t (*v81)();
  uint64_t v82;
  void *v83;

  v56 = a3;
  v62 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  v7 = MEMORY[0x24BDAC7A8](v62);
  v9 = (void **)((char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = MEMORY[0x24BDAC7A8](v7);
  v76 = (uint64_t)&v54 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v75 = (uint64_t)&v54 - v12;
  v60 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  v13 = MEMORY[0x24BDAC7A8](v60);
  v57 = (uint64_t *)((char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = MEMORY[0x24BDAC7A8](v13);
  v61 = (void **)((char *)&v54 - v16);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v54 - v17;
  v19 = __CFADD__(a1, 1);
  v20 = a1 + 1;
  if (v19)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    swift_once();
    goto LABEL_5;
  }
  p_ivar_lyt = &NotifyState.ivar_lyt;
  v21 = -[objc_class switchIndex](a2, sel_switchIndex);
  if (((unint64_t)v21 & 0x8000000000000000) != 0)
    goto LABEL_30;
  v4 = (uint64_t *)v21;
  if ((unint64_t)v21 >> 32)
    goto LABEL_30;
  if (one-time initialization token for instance != -1)
    goto LABEL_27;
LABEL_5:
  v22 = (uint64_t *)&demangling cache variable for type metadata for Date?;
  v59 = 0x80000002433C9E10;
  v58 = MEMORY[0x24BEE4AD8] + 8;
  v54 = a2;
  v55 = v9;
  while (v4 < v20)
  {
LABEL_20:
    result = (unint64_t)objc_msgSend(a2, (SEL)p_ivar_lyt[427], v54);
    if ((result & 0x8000000000000000) != 0 || HIDWORD(result))
      goto LABEL_30;
    v20 = (_DWORD)v4 + 1;
    v19 = v4 >= result;
    v4 = (uint64_t *)result;
    if (v19)
      return result;
  }
  v23 = static RegistryCrux.instance;
  v67 = OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_unfairLock;
  v66 = static RegistryCrux.instance + OBJC_IVAR____TtC20PairedDeviceRegistry12RegistryCrux_registryState_;
  v24 = type metadata accessor for Date();
  v69 = *(_QWORD *)(v24 - 8);
  v25 = *(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v69 + 56);
  swift_retain();
  v9 = 0;
  v64 = v23;
  v63 = v25;
  v65 = v4;
  v74 = v20;
  while (1)
  {
    v25(v18, 1, 1, v24);
    outlined destroy of UUID?((uint64_t)v18, v22);
    v25(v18, 1, 1, v24);
    v77 = swift_allocBox();
    v27 = v26;
    v28 = type metadata accessor for UUID();
    v70 = *(_QWORD *)(v28 - 8);
    v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 56);
    v73 = v27;
    v71 = v28;
    v29(v27, 1, 1);
    v30 = v67;
    v31 = *(os_unfair_lock_s **)(v23 + v67);
    swift_retain();
    os_unfair_lock_lock(v31 + 4);
    swift_release();
    v32 = *(void **)v66;
    v33 = v22;
    v34 = *(_QWORD *)(v66 + 16);
    v35 = *(os_unfair_lock_s **)(v23 + v30);
    v72 = *(id *)(v66 + 8);
    swift_retain();
    v36 = v32;
    os_unfair_lock_unlock(v35 + 4);
    swift_release();
    if (v34 < 0)
    {

      v22 = v33;
      v44 = v74;
    }
    else
    {
      outlined destroy of UUID?((uint64_t)v18, v33);
      RegistryCrux.synchronousUntypedService(tag:)(0xD00000000000001BLL, v59, &aBlock);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NRXPCRegistryDelegate);
      swift_dynamicCast();
      v68 = v83;
      v37 = swift_allocBox();
      v39 = v38;
      v25(v38, 1, 1, v24);
      v40 = swift_allocObject();
      *(_QWORD *)(v40 + 16) = v77;
      *(_QWORD *)(v40 + 24) = v37;
      v81 = closure #1 in RegistryCrux.deviceIDAtSwitchIndex(_:_:)partial apply;
      v82 = v40;
      *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
      *((_QWORD *)&aBlock + 1) = 1107296256;
      v79 = thunk for @escaping @callee_guaranteed (@in_guaranteed UUID?, @in_guaranteed Date?) -> ();
      v80 = &block_descriptor_9_0;
      v41 = _Block_copy(&aBlock);
      v42 = v24;
      v43 = v36;
      swift_retain();
      swift_retain();
      swift_release();
      v44 = v74;
      objc_msgSend(v68, sel_xpcDeviceIDAtSwitchIndex_withBlock_, (v74 + (_DWORD)v9), v41);

      v24 = v42;
      swift_unknownObjectRelease();
      _Block_release(v41);
      swift_beginAccess();
      outlined init with copy of RegistryState.LoggingInfo?(v39, (uint64_t)v18, v33);
      swift_release();
      v22 = v33;
    }
    v45 = (char *)v9 + v44;
    v46 = v73;
    swift_beginAccess();
    v47 = v75;
    v4 = &demangling cache variable for type metadata for UUID?;
    outlined init with copy of RegistryState.LoggingInfo?(v46, v75, &demangling cache variable for type metadata for UUID?);
    swift_release();
    p_ivar_lyt = v61;
    outlined init with copy of RegistryState.LoggingInfo?((uint64_t)v18, (uint64_t)v61, v22);
    a2 = *(Class *)(v69 + 48);
    LODWORD(v46) = ((uint64_t (*)(void **, uint64_t, uint64_t))a2)(p_ivar_lyt, 1, v24);
    outlined destroy of UUID?((uint64_t)p_ivar_lyt, v22);
    outlined init with copy of RegistryState.LoggingInfo?(v47, v76, &demangling cache variable for type metadata for UUID?);
    if ((_DWORD)v46 == 1
      || (v48 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v70 + 48), v48(v76, 1, v71) == 1))
    {
      outlined destroy of UUID?(v76, &demangling cache variable for type metadata for UUID?);
      outlined destroy of UUID?(v75, &demangling cache variable for type metadata for UUID?);
      outlined destroy of UUID?((uint64_t)v18, v22);
      goto LABEL_17;
    }
    outlined destroy of UUID?(v76, &demangling cache variable for type metadata for UUID?);
    v49 = (uint64_t)v57;
    outlined init with copy of RegistryState.LoggingInfo?((uint64_t)v18, (uint64_t)v57, v22);
    v50 = v24;
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))a2)(v49, 1, v24) == 1)
      goto LABEL_29;
    p_ivar_lyt = v55;
    outlined init with copy of RegistryState.LoggingInfo?(v75, (uint64_t)v55, &demangling cache variable for type metadata for UUID?);
    v51 = v71;
    if (v48((uint64_t)p_ivar_lyt, 1, v71) == 1)
      break;
    v4 = v57;
    isa = Date._bridgeToObjectiveC()().super.isa;
    a2 = UUID._bridgeToObjectiveC()().super.isa;
    ((void (**)(_QWORD, char *, Class, Class))v56)[2](v56, v45, isa, a2);

    outlined destroy of UUID?(v75, &demangling cache variable for type metadata for UUID?);
    outlined destroy of UUID?((uint64_t)v18, v22);
    (*(void (**)(void **, uint64_t))(v70 + 8))(p_ivar_lyt, v51);
    v24 = v50;
    (*(void (**)(uint64_t *, uint64_t))(v69 + 8))(v4, v50);
LABEL_17:
    v20 = v74;
    if ((_DWORD)v45 == -1)
    {
      __break(1u);
      goto LABEL_26;
    }
    v9 = (void **)((char *)v9 + 1);
    LODWORD(v4) = (_DWORD)v65;
    v23 = v64;
    v25 = v63;
    if (v65 < (int)v74 + (int)v9)
    {
      swift_release();
      a2 = v54;
      p_ivar_lyt = &NotifyState.ivar_lyt;
      goto LABEL_20;
    }
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  _Block_release(v56);
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void specialized Registry_Impl.setActive(device:results:)(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  objc_class *active;
  _BYTE *v13;
  uint64_t *v14;
  id v15;
  id v16;
  objc_super v17;

  if (one-time initialization token for instance != -1)
    swift_once();
  swift_retain();
  v4 = RegistryCrux.setActive(device:)(a1);
  v6 = v5;
  v8 = v7;
  swift_release();
  if (v8)
  {
    v9 = v8;
    v10 = v8;
    v11 = (void *)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void *, _QWORD))(a2 + 16))(a2, v11, 0);
    swift_bridgeObjectRelease();

  }
  else
  {
    active = (objc_class *)type metadata accessor for ActiveDeviceAssertion_Impl();
    v13 = objc_allocWithZone(active);
    v13[OBJC_IVAR___PDRActiveDeviceAssertion_Impl_valid] = 1;
    *(_QWORD *)&v13[OBJC_IVAR___PDRActiveDeviceAssertion_Impl_device_] = a1;
    v14 = (uint64_t *)&v13[OBJC_IVAR___PDRActiveDeviceAssertion_Impl_identifier_];
    *v14 = v4;
    v14[1] = v6;
    v17.receiver = v13;
    v17.super_class = active;
    v15 = a1;
    swift_bridgeObjectRetain();
    v16 = objc_msgSendSuper2(&v17, sel_init);
    (*(void (**)(uint64_t, _QWORD, id))(a2 + 16))(a2, 0, v16);

    swift_bridgeObjectRelease();
  }
}

void specialized Registry_Impl.waitForPairingExtendedMetadata(advertisedName:results:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void (*v12)(uint64_t, _QWORD, id);
  id v13;
  id v14;

  if (one-time initialization token for instance != -1)
    swift_once();
  swift_retain();
  v6 = RegistryCrux.waitForWatchPairingExtendedMetadata(advertisedName:)(a1, a2);
  v8 = v7;
  swift_release();
  if (v8)
  {
    v9 = objc_allocWithZone((Class)PDRPairingExtendedMetadata);
    v14 = v8;
    v10 = objc_msgSend(v9, sel_init);
    objc_msgSend(v10, sel_setChipID_, objc_msgSend(v14, sel_chipID));
    objc_msgSend(v10, sel_setPairingVersion_, objc_msgSend(v14, sel_pairingVersion));
    v11 = objc_msgSend(v14, sel_productType);
    objc_msgSend(v10, sel_setProductType_, v11);

    objc_msgSend(v10, sel_setPostFailsafeObliteration_, objc_msgSend(v14, sel_postFailsafeObliteration));
    objc_msgSend(v10, sel_setIsCellularEnabled_, objc_msgSend(v14, sel_isCellularEnabled));
    objc_msgSend(v10, sel_setEncodedSystemVersion_, objc_msgSend(v14, sel_encodedSystemVersion));
    v12 = *(void (**)(uint64_t, _QWORD, id))(a3 + 16);
    v13 = v10;
    v12(a3, v6 & 1, v13);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(a3 + 16))(a3, v6 & 1, 0);
  }
}

uint64_t sub_2433C3E98()
{
  id *v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for specialized closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)()
{
  uint64_t v0;

  return specialized closure #1 in Registry_Impl.notify(deviceColletionDiff:state:)(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(unsigned __int8 *)(v0 + 64));
}

unint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A];
  if (!lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    result = MEMORY[0x2494F83D0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A]);
  }
  return result;
}

uint64_t sub_2433C3F3C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2433C3F60()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2433C3F84()
{
  id *v0;

  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in Registry_Impl.bootstrapNotify(_:)()
{
  uint64_t v0;

  return closure #1 in Registry_Impl.bootstrapNotify(_:)(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32), *(void **)(v0 + 40), *(_QWORD *)(v0 + 48));
}

uint64_t closure #1 in Registry_Impl.device(forPairingID:)partial apply(id *a1)
{
  return partial apply for closure #1 in Registry_Impl.device(forPairingID:)(a1) & 1;
}

uint64_t closure #1 in Registry_Impl.device(forBluetoothID:)partial apply(void **a1)
{
  return partial apply for closure #1 in Registry_Impl.device(forBluetoothID:)(a1) & 1;
}

uint64_t type metadata completion function for WeakCollection()
{
  return swift_initClassMetadata2();
}

BOOL static WeakCollection.Weak.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = MEMORY[0x2494F84FC]();
  v4 = MEMORY[0x2494F84FC](a2);
  v5 = v4;
  if (v3)
  {
    swift_unknownObjectRelease();
    if (v5)
    {
      swift_unknownObjectRelease();
      return v3 == v5;
    }
    return 0;
  }
  if (v4)
  {
    swift_unknownObjectRelease();
    return 0;
  }
  return 1;
}

void specialized WeakCollection.sweep(action:)(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  void *v7;
  _QWORD *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _BYTE v13[8];

  v4 = a1 + 16;
  swift_beginAccess();
  v5 = *(_QWORD **)(a1 + 16);
  if (!v5[2])
    return;
  v6 = 0;
  while (1)
  {
    outlined init with copy of RegistryState.LoggingInfo?((uint64_t)&v5[v6 + 4], (uint64_t)v13, &demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
    v7 = (void *)MEMORY[0x2494F84FC](v13);
    outlined destroy of UUID?((uint64_t)v13, &demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
    if (v7)
    {
      v12 = v7;
      MEMORY[0x2494F7C14]();
      if (*(_QWORD *)((*a2 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*a2 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();

      ++v6;
      goto LABEL_9;
    }
    swift_beginAccess();
    v8 = *(_QWORD **)v4;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)v4 = v8;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v8 = specialized _ArrayBuffer._consumeAndCreateNew()((unint64_t)v8);
      *(_QWORD *)v4 = v8;
    }
    v10 = v8[2];
    if (v6 >= v10)
      break;
    v11 = v10 - 1;
    outlined destroy of UUID?((uint64_t)&v8[v6 + 4], &demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
    if ((uint64_t)(v11 - v6) < 0)
      goto LABEL_16;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
    swift_arrayInitWithTakeFrontToBack();
    v8[2] = v11;
    *(_QWORD *)v4 = v8;
    swift_endAccess();
LABEL_9:
    v5 = *(_QWORD **)v4;
    if (v6 >= *(_QWORD *)(*(_QWORD *)v4 + 16))
      return;
  }
  __break(1u);
LABEL_16:
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t specialized WeakCollection.sweep(action:)(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t result;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _BYTE v14[8];

  v4 = a1 + 16;
  result = swift_beginAccess();
  v6 = *(_QWORD **)(a1 + 16);
  if (!v6[2])
    return result;
  v7 = 0;
  while (1)
  {
    outlined init with copy of RegistryState.LoggingInfo?((uint64_t)&v6[v7 + 4], (uint64_t)v14, &demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
    v8 = MEMORY[0x2494F84FC](v14);
    outlined destroy of UUID?((uint64_t)v14, &demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
    if (v8)
    {
      v13 = swift_unknownObjectRetain();
      MEMORY[0x2494F7C14](v13);
      if (*(_QWORD *)((*a2 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*a2 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      result = swift_unknownObjectRelease();
      ++v7;
      goto LABEL_9;
    }
    swift_beginAccess();
    v9 = *(_QWORD **)v4;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)v4 = v9;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v9 = specialized _ArrayBuffer._consumeAndCreateNew()((unint64_t)v9);
      *(_QWORD *)v4 = v9;
    }
    v11 = v9[2];
    if (v7 >= v11)
      break;
    v12 = v11 - 1;
    outlined destroy of UUID?((uint64_t)&v9[v7 + 4], &demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
    if ((uint64_t)(v12 - v7) < 0)
      goto LABEL_16;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
    swift_arrayInitWithTakeFrontToBack();
    v9[2] = v12;
    *(_QWORD *)v4 = v9;
    result = swift_endAccess();
LABEL_9:
    v6 = *(_QWORD **)v4;
    if (v7 >= *(_QWORD *)(*(_QWORD *)v4 + 16))
      return result;
  }
  __break(1u);
LABEL_16:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t WeakCollection.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for WeakCollection(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for WeakCollection);
}

uint64_t type metadata instantiation function for WeakCollection.Weak()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t getEnumTagSinglePayload for WeakCollection.Weak(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for WeakCollection.Weak(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for WeakCollection.Weak(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for WeakCollection.Weak);
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew()(unint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, a1);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t specialized WeakCollection.sweep(action:)(uint64_t a1, uint64_t a2, _QWORD *a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t result;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD **v18;
  _BYTE v20[8];

  v7 = a1 + 16;
  result = swift_beginAccess();
  v9 = *(_QWORD **)(a1 + 16);
  if (!v9[2])
    return result;
  v10 = 0;
  v18 = (_QWORD **)(a3 + 2);
  while (1)
  {
    outlined init with copy of RegistryState.LoggingInfo?((uint64_t)&v9[v10 + 4], (uint64_t)v20, &demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
    v11 = MEMORY[0x2494F84FC](v20);
    outlined destroy of UUID?((uint64_t)v20, &demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
    if (v11)
      break;
    swift_beginAccess();
    v12 = *(_QWORD **)v7;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)v7 = v12;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v12 = specialized _ArrayBuffer._consumeAndCreateNew()((unint64_t)v12);
      *(_QWORD *)v7 = v12;
    }
    v14 = v12[2];
    if (v10 >= v14)
    {
      __break(1u);
      goto LABEL_19;
    }
    v15 = v14 - 1;
    outlined destroy of UUID?((uint64_t)&v12[v10 + 4], &demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
    if ((uint64_t)(v15 - v10) < 0)
      goto LABEL_21;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
    swift_arrayInitWithTakeFrontToBack();
    v12[2] = v15;
    *(_QWORD *)v7 = v12;
    result = swift_endAccess();
LABEL_9:
    v9 = *(_QWORD **)v7;
    if (v10 >= *(_QWORD *)(*(_QWORD *)v7 + 16))
      return result;
  }
  if (v11 != a2)
  {
    result = swift_unknownObjectRelease();
    ++v10;
    goto LABEL_9;
  }
  swift_beginAccess();
  a3 = *v18;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    goto LABEL_14;
LABEL_19:
  a3 = specialized _ArrayBuffer._consumeAndCreateNew()((unint64_t)a3);
LABEL_14:
  v16 = a3[2];
  if (v10 >= v16)
  {
    __break(1u);
LABEL_21:
    swift_release();
    swift_unknownObjectRelease();
    goto LABEL_22;
  }
  v17 = v16 - 1;
  outlined destroy of UUID?((uint64_t)&a3[v10 + 4], &demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
  if ((uint64_t)(v17 - v10) >= 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistryDelegate>.Weak);
    swift_arrayInitWithTakeFrontToBack();
    a3[2] = v17;
    *v18 = a3;
    swift_endAccess();
    *a4 = 1;
    return swift_unknownObjectRelease();
  }
LABEL_22:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void specialized WeakCollection.sweep(action:)(uint64_t a1, void *a2, _QWORD *a3, _BYTE *a4)
{
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  void *v10;
  _QWORD *v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD **v17;
  _BYTE v19[8];

  v7 = a1 + 16;
  swift_beginAccess();
  v8 = *(_QWORD **)(a1 + 16);
  if (!v8[2])
    return;
  v9 = 0;
  v17 = (_QWORD **)(a3 + 2);
  while (1)
  {
    outlined init with copy of RegistryState.LoggingInfo?((uint64_t)&v8[v9 + 4], (uint64_t)v19, &demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
    v10 = (void *)MEMORY[0x2494F84FC](v19);
    outlined destroy of UUID?((uint64_t)v19, &demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
    if (v10)
      break;
    swift_beginAccess();
    v11 = *(_QWORD **)v7;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)v7 = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v11 = specialized _ArrayBuffer._consumeAndCreateNew()((unint64_t)v11);
      *(_QWORD *)v7 = v11;
    }
    v13 = v11[2];
    if (v9 >= v13)
    {
      __break(1u);
      goto LABEL_19;
    }
    v14 = v13 - 1;
    outlined destroy of UUID?((uint64_t)&v11[v9 + 4], &demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
    if ((uint64_t)(v14 - v9) < 0)
      goto LABEL_21;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
    swift_arrayInitWithTakeFrontToBack();
    v11[2] = v14;
    *(_QWORD *)v7 = v11;
    swift_endAccess();
LABEL_9:
    v8 = *(_QWORD **)v7;
    if (v9 >= *(_QWORD *)(*(_QWORD *)v7 + 16))
      return;
  }
  if (v10 != a2)
  {

    ++v9;
    goto LABEL_9;
  }
  swift_beginAccess();
  a3 = *v17;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    goto LABEL_14;
LABEL_19:
  a3 = specialized _ArrayBuffer._consumeAndCreateNew()((unint64_t)a3);
LABEL_14:
  v15 = a3[2];
  if (v9 >= v15)
  {
    __break(1u);
LABEL_21:
    swift_release();

    goto LABEL_22;
  }
  v16 = v15 - 1;
  outlined destroy of UUID?((uint64_t)&a3[v9 + 4], &demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
  if ((uint64_t)(v16 - v9) >= 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakCollection<PDRRegistry>.Weak);
    swift_arrayInitWithTakeFrontToBack();
    a3[2] = v16;
    *v17 = a3;
    swift_endAccess();
    *a4 = 1;

    return;
  }
LABEL_22:
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2494F837C](a1, v6, a5);
}

id ActiveDeviceAssertion_Impl.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  objc_msgSend(v0, sel_invalidate);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActiveDeviceAssertion_Impl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ActiveDeviceAssertion_Impl()
{
  return objc_opt_self();
}

id ActiveDeviceAssertion_Impl.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ActiveDeviceAssertion_Impl.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t method lookup function for ActiveDeviceAssertion_Impl()
{
  return swift_lookUpClassMethod();
}

uint64_t PDRDevice.compatibilityState.getter()
{
  void *v0;
  uint64_t v2;
  _OWORD v3[2];
  _BYTE v4[24];
  uint64_t v5;

  if (objc_msgSend(v0, sel_valueForProperty_, CFSTR("compatibilityState")))
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  outlined init with take of Any?((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    if ((swift_dynamicCast() & 1) != 0)
      return v2;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v4);
  }
  return 0;
}

void Device_Impl.valueFor(property:)(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  Class isa;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;

  v3 = v1 + OBJC_IVAR___PDRDevice_Impl_registryState;
  v4 = *(void **)(v1 + OBJC_IVAR___PDRDevice_Impl_registryState);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  v6 = objc_msgSend(v4, sel_deviceForPairingID_, isa);

  if (v6)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = (void *)MEMORY[0x2494F7BCC](v7);
    swift_bridgeObjectRelease();
    v9 = objc_msgSend(v6, sel_objectForKeyedSubscript_, v8);

    if (!v9 || (v10 = objc_msgSend(v9, sel_value), v9, !v10))
    {

LABEL_9:
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
      return;
    }
    objc_opt_self();
    v11 = swift_dynamicCastObjCClass();
    if (!v11)
    {
      *(_QWORD *)(a1 + 24) = swift_getObjectType();

      *(_QWORD *)a1 = v10;
      return;
    }
    v12 = *(void **)(v3 + 8);
    if (v12)
    {
      v13 = v11;
      swift_unknownObjectRetain();
      v14 = objc_msgSend(v12, sel_objectForKeyedSubscript_, v13);
      if (v14)
      {
        v15 = v14;
        *(_QWORD *)(a1 + 24) = swift_getObjectType();

        swift_unknownObjectRelease_n();
        *(_QWORD *)a1 = v15;
        return;
      }

      swift_unknownObjectRelease_n();
      goto LABEL_9;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t Device_Impl.propertyNames()()
{
  uint64_t v0;
  void *v1;
  Class isa;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  int64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v1 = *(void **)(v0 + OBJC_IVAR___PDRDevice_Impl_registryState);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  v3 = objc_msgSend(v1, sel_deviceForPairingID_, isa);

  v4 = MEMORY[0x24BEE4AF8];
  if (v3)
  {
    v5 = objc_msgSend(v3, sel_allPropertyNames);

    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = *(_QWORD *)(v6 + 16);
    if (v7)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v7, 0);
      v8 = (uint64_t *)(v6 + 40);
      do
      {
        v9 = *(v8 - 1);
        v10 = *v8;
        swift_bridgeObjectRetain();
        v11 = MEMORY[0x2494F7BCC](v9, v10);
        swift_bridgeObjectRelease();
        v13 = *(_QWORD *)(v4 + 16);
        v12 = *(_QWORD *)(v4 + 24);
        if (v13 >= v12 >> 1)
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v12 > 1, v13 + 1, 1);
        v8 += 2;
        *(_QWORD *)(v4 + 16) = v13 + 1;
        *(_QWORD *)(v4 + 8 * v13 + 32) = v11;
        --v7;
      }
      while (v7);
    }
    swift_bridgeObjectRelease();
  }
  return v4;
}

Swift::Bool __swiftcall Device_Impl.supportsCapabilityRaw(_:)(Swift::UInt32 a1)
{
  void *v1;
  unsigned __int8 v3;
  id v5;
  __int128 v6;
  __int128 v7;
  _BYTE v8[32];

  if (objc_msgSend(v1, sel_valueForProperty_, CFSTR("capabilities")))
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    v6 = 0u;
    v7 = 0u;
  }
  outlined init with take of Any?((uint64_t)&v6, (uint64_t)v8);
  outlined init with copy of Any?((uint64_t)v8, (uint64_t)&v6);
  if (!*((_QWORD *)&v7 + 1))
  {
    outlined destroy of Any?((uint64_t)&v6);
    goto LABEL_8;
  }
  type metadata accessor for NRMiniUUIDSet();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    v3 = 0;
    goto LABEL_9;
  }
  v3 = objc_msgSend(v5, sel_hasCapability_, bswap32(a1));

LABEL_9:
  outlined destroy of Any?((uint64_t)v8);
  return v3;
}

id Device_Impl.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void Device_Impl.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id Device_Impl.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Device_Impl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t PDRDevice.localPairingDataStorePath.getter()
{
  return PDRDevice.localPairingDataStorePath.getter(PDRDevicePropertyKeyLocalPairingDataStorePath);
}

uint64_t PDRDevice.isPaired()(_QWORD *a1)
{
  void *v1;
  uint64_t result;
  unsigned __int8 v3;
  _OWORD v4[2];
  _BYTE v5[24];
  uint64_t v6;

  if (objc_msgSend(v1, sel_valueForProperty_, *a1))
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  outlined init with take of Any?((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    result = swift_dynamicCast();
    if ((_DWORD)result)
      return v3;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v5);
    return 0;
  }
  return result;
}

uint64_t PDRDevice.lastActiveDate()@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v3;
  int v4;
  uint64_t v6;
  _OWORD v7[2];
  _BYTE v8[24];
  uint64_t v9;

  if (objc_msgSend(v1, sel_valueForProperty_, CFSTR("lastActiveDate")))
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  outlined init with take of Any?((uint64_t)v7, (uint64_t)v8);
  if (v9)
  {
    v3 = type metadata accessor for Date();
    v4 = swift_dynamicCast();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(a1, v4 ^ 1u, 1, v3);
  }
  else
  {
    outlined destroy of Any?((uint64_t)v8);
    v6 = type metadata accessor for Date();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, 1, 1, v6);
  }
}

id @objc PDRDevice.systemBuildVersion()(void *a1, uint64_t a2, _QWORD *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a1;
  v5 = PDRDevice.localPairingDataStorePath.getter(a3);
  v7 = v6;

  if (v7)
  {
    v8 = (void *)MEMORY[0x2494F7BCC](v5, v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

id PDRDevice.advertisedName.getter()
{
  void *v0;
  id result;
  uint64_t v2;
  __int128 v3;
  __int128 v4;

  result = objc_msgSend(v0, sel_valueForProperty_, CFSTR("advertisedName"));
  if (result)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    outlined init with take of Any(&v3, &v4);
    swift_dynamicCast();
    return (id)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t PDRDevice.name.getter()
{
  return PDRDevice.localPairingDataStorePath.getter(PDRDevicePropertyKeyName);
}

uint64_t PDRDevice.localPairingDataStorePath.getter(_QWORD *a1)
{
  void *v1;
  uint64_t v3;
  _OWORD v4[2];
  _BYTE v5[24];
  uint64_t v6;

  if (objc_msgSend(v1, sel_valueForProperty_, *a1))
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  outlined init with take of Any?((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    if (swift_dynamicCast())
      return v3;
    else
      return 0;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v5);
    return 0;
  }
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

{
  uint64_t *v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t outlined init with take of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t type metadata accessor for NRMiniUUIDSet()
{
  unint64_t result;

  result = lazy cache variable for type metadata for NRMiniUUIDSet;
  if (!lazy cache variable for type metadata for NRMiniUUIDSet)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NRMiniUUIDSet);
  }
  return result;
}

uint64_t type metadata accessor for Device_Impl()
{
  uint64_t result;

  result = type metadata singleton initialization cache for Device_Impl;
  if (!type metadata singleton initialization cache for Device_Impl)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ObjC metadata update function for Device_Impl()
{
  return type metadata accessor for Device_Impl();
}

uint64_t type metadata completion function for Device_Impl()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for Device_Impl()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Device_Impl.supportsCapabilityRaw(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<PDRDevicePropertyKey>);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8)
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    type metadata accessor for PDRDevicePropertyKey(0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x24BDCD2F0]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x24BDCDCA0]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCDCE0]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x24BDCE5D8]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x24BDCE900]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x24BDCE9D0]();
}

uint64_t static UUID.== infix(_:_:)()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return MEMORY[0x24BEE5648]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCF830]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x24BEE1110]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x24BEE11B8]();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)MEMORY[0x24BDCFCC0]();
}

uint64_t static Set._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCFCC8]();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22C0]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x24BEE23A0](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t static ContinuousClock.now.getter()
{
  return MEMORY[0x24BEE6D88]();
}

uint64_t ContinuousClock.Instant.duration(to:)()
{
  return MEMORY[0x24BEE6DC0]();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

{
  return MEMORY[0x24BEE2F48]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t Duration.components.getter()
{
  return MEMORY[0x24BEE4828]();
}

uint64_t static Duration.< infix(_:_:)()
{
  return MEMORY[0x24BEE4860]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x24BDD11E8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x24BDAF150](*(_QWORD *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x24BDAF198](*(_QWORD *)&token, state64);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
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

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x24BEE4C48]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x24BEE4FB8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x24BEE4FC0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x24BEE4FE0]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x24BEE4FE8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

