void sub_2132A45A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initRadarComponent()
{
  Class result;

  if (TapToRadarKitLibrary_sOnce != -1)
    dispatch_once(&TapToRadarKitLibrary_sOnce, &__block_literal_global_14);
  result = objc_getClass("RadarComponent");
  classRadarComponent = (uint64_t)result;
  getRadarComponentClass[0] = (uint64_t (*)())RadarComponentFunction;
  return result;
}

id RadarComponentFunction()
{
  return (id)classRadarComponent;
}

Class initTapToRadarService()
{
  Class result;

  if (TapToRadarKitLibrary_sOnce != -1)
    dispatch_once(&TapToRadarKitLibrary_sOnce, &__block_literal_global_14);
  result = objc_getClass("TapToRadarService");
  classTapToRadarService = (uint64_t)result;
  getTapToRadarServiceClass[0] = (uint64_t (*)())TapToRadarServiceFunction;
  return result;
}

id TapToRadarServiceFunction()
{
  return (id)classTapToRadarService;
}

Class initRadarDraft()
{
  Class result;

  if (TapToRadarKitLibrary_sOnce != -1)
    dispatch_once(&TapToRadarKitLibrary_sOnce, &__block_literal_global_14);
  result = objc_getClass("RadarDraft");
  classRadarDraft = (uint64_t)result;
  getRadarDraftClass = (uint64_t (*)())RadarDraftFunction;
  return result;
}

id RadarDraftFunction()
{
  return (id)classRadarDraft;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t FlowTaskMetadata.init(id:isClientInitiated:creationTime:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;

  v10 = a5 + *(int *)(OUTLINED_FUNCTION_0_0() + 24);
  v11 = type metadata accessor for Date();
  __swift_storeEnumTagSinglePayload(v10, 1, 1, v11);
  *(_QWORD *)a5 = a1;
  *(_QWORD *)(a5 + 8) = a2;
  *(_BYTE *)(a5 + 16) = a3;
  outlined destroy of Date?(v10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10, a4, v11);
  return __swift_storeEnumTagSinglePayload(v10, 0, 1, v11);
}

uint64_t type metadata accessor for FlowTaskMetadata()
{
  uint64_t result;

  result = type metadata singleton initialization cache for FlowTaskMetadata;
  if (!type metadata singleton initialization cache for FlowTaskMetadata)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t outlined destroy of Date?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199B0614]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t FlowTaskMetadata.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void FlowTaskMetadata.id.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*FlowTaskMetadata.id.modify())()
{
  return FlowTaskMetadata.id.modify;
}

uint64_t FlowTaskMetadata.isClientInitiated.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t FlowTaskMetadata.isClientInitiated.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = result;
  return result;
}

uint64_t (*FlowTaskMetadata.isClientInitiated.modify())()
{
  return FlowTaskMetadata.id.modify;
}

uint64_t FlowTaskMetadata.creationTime.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_0_0() + 24);
  return outlined init with copy of Date?(v3, a1);
}

uint64_t outlined init with copy of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t FlowTaskMetadata.creationTime.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_0_0() + 24);
  return outlined assign with take of Date?(a1, v3);
}

uint64_t outlined assign with take of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*FlowTaskMetadata.creationTime.modify())()
{
  OUTLINED_FUNCTION_0_0();
  return FlowTaskMetadata.id.modify;
}

void default argument 0 of InteractionTypeHelper.init(accessibilityStatusProvider:deviceClassProvider:)(uint64_t a1@<X8>)
{
  *(_QWORD *)(a1 + 24) = &type metadata for AccessibilityStatusProviderImpl;
  *(_QWORD *)(a1 + 32) = &protocol witness table for AccessibilityStatusProviderImpl;
}

uint64_t default argument 1 of InteractionTypeHelper.init(accessibilityStatusProvider:deviceClassProvider:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for MobileGestaltDeviceClassProvider();
  v3 = MEMORY[0x24BEA8E28];
  a1[3] = v2;
  a1[4] = v3;
  __swift_allocate_boxed_opaque_existential_1(a1);
  return static MobileGestaltDeviceClassProvider.shared.getter();
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

_QWORD *initializeBufferWithCopyOfBuffer for FlowTaskMetadata(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v5;
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    v6 = *(int *)(a3 + 24);
    v7 = (void *)(a1 + v6);
    v8 = (char *)a2 + v6;
    v9 = type metadata accessor for Date();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t destroy for FlowTaskMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for Date();
  result = __swift_getEnumTagSinglePayload(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return result;
}

uint64_t initializeWithCopy for FlowTaskMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = *(int *)(a3 + 24);
  v6 = (void *)(a1 + v5);
  v7 = (const void *)(a2 + v5);
  v8 = type metadata accessor for Date();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v8);
  }
  return a1;
}

uint64_t assignWithCopy for FlowTaskMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  int EnumTagSinglePayload;
  int v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = *(int *)(a3 + 24);
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = type metadata accessor for Date();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    v12 = *(_QWORD *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  return a1;
}

uint64_t initializeWithTake for FlowTaskMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(int *)(a3 + 24);
  v5 = (void *)(a1 + v4);
  v6 = (const void *)(a2 + v4);
  v7 = type metadata accessor for Date();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  }
  return a1;
}

uint64_t assignWithTake for FlowTaskMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  int EnumTagSinglePayload;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v7 = *(int *)(a3 + 24);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for Date();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    v13 = *(_QWORD *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for FlowTaskMetadata()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2132A51BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 24), a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for FlowTaskMetadata()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_2132A524C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 2147483646)
  {
    *(_QWORD *)(a1 + 8) = a2;
    OUTLINED_FUNCTION_1();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    __swift_storeEnumTagSinglePayload(a1 + *(int *)(a4 + 24), a2, a2, v7);
  }
}

void type metadata completion function for FlowTaskMetadata()
{
  unint64_t v0;

  type metadata accessor for Date?();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void type metadata accessor for Date?()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Date?)
  {
    type metadata accessor for Date();
    v0 = type metadata accessor for Optional();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Date?);
  }
}

uint64_t protocol witness for SetAlgebra.init() in conformance NSPropertyListMutabilityOptions@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = specialized OptionSet<>.init()();
  *a1 = result;
  return result;
}

_QWORD *protocol witness for OptionSet.init(rawValue:) in conformance NSPropertyListMutabilityOptions@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return type metadata accessor for FlowTaskMetadata();
}

uint64_t InteractionTypeHelper.init(accessibilityStatusProvider:deviceClassProvider:)@<X0>(__int128 *a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X8>)
{
  outlined init with take of DeviceClassProvider(a1, a3);
  return outlined init with take of DeviceClassProvider(a2, a3 + 40);
}

uint64_t outlined init with take of DeviceClassProvider(__int128 *a1, uint64_t a2)
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

uint64_t one-time initialization function for shared()
{
  qword_253F0A7A8 = (uint64_t)&type metadata for AccessibilityStatusProviderImpl;
  unk_253F0A7B0 = &protocol witness table for AccessibilityStatusProviderImpl;
  qword_253F0A7D0 = type metadata accessor for MobileGestaltDeviceClassProvider();
  unk_253F0A7D8 = MEMORY[0x24BEA8E28];
  __swift_allocate_boxed_opaque_existential_1(qword_253F0A7B8);
  return static MobileGestaltDeviceClassProvider.shared.getter();
}

uint64_t static InteractionTypeHelper.shared.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for shared != -1)
    swift_once();
  return outlined init with copy of InteractionTypeHelper((uint64_t)&static InteractionTypeHelper.shared, a1);
}

uint64_t outlined init with copy of InteractionTypeHelper(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for InteractionTypeHelper(a2, a1);
  return a2;
}

uint64_t one-time initialization function for interactionForIdiom()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void);
  uint64_t v10;
  uint64_t v11;
  void (*v12)(unint64_t, uint64_t, uint64_t);
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(DeviceClass, InteractionType)>);
  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (DeviceClass, InteractionType));
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2132C4400;
  v5 = v4 + v3;
  v6 = v4 + v3 + *(int *)(v0 + 48);
  v7 = *MEMORY[0x24BEA8920];
  v8 = type metadata accessor for DeviceClass();
  v9 = *(void (**)(void))(*(_QWORD *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v5, v7, v8);
  v10 = *MEMORY[0x24BEA8C38];
  v11 = type metadata accessor for InteractionType();
  v12 = *(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 104);
  v12(v6, v10, v11);
  v13 = v5 + v2 + *(int *)(v0 + 48);
  v9();
  v12(v13, v10, v11);
  v14 = v5 + 2 * v2 + *(int *)(v0 + 48);
  v9();
  v12(v14, *MEMORY[0x24BEA8C30], v11);
  v15 = v5 + 3 * v2 + *(int *)(v0 + 48);
  v9();
  v12(v15, v10, v11);
  lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type DeviceClass and conformance DeviceClass, (uint64_t (*)(uint64_t))MEMORY[0x24BEA8938], MEMORY[0x24BEA8948]);
  result = Dictionary.init(dictionaryLiteral:)();
  static InteractionTypeHelper.interactionForIdiom = result;
  return result;
}

uint64_t one-time initialization function for dialogDrivenInputOrigins()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void (*v6)(unint64_t, _QWORD, uint64_t);
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InputOrigin>);
  v0 = type metadata accessor for InputOrigin();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2132C4400;
  v5 = v4 + v3;
  v6 = *(void (**)(unint64_t, _QWORD, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x24BEA89D8], v0);
  v6(v5 + v2, *MEMORY[0x24BEA89E0], v0);
  v6(v5 + 2 * v2, *MEMORY[0x24BEA8A08], v0);
  v6(v5 + 3 * v2, *MEMORY[0x24BEA8A20], v0);
  result = specialized Set.init(_nonEmptyArrayLiteral:)(v4);
  static InteractionTypeHelper.dialogDrivenInputOrigins = result;
  return result;
}

uint64_t *InteractionTypeHelper.dialogDrivenInputOrigins.unsafeMutableAddressor()
{
  if (one-time initialization token for dialogDrivenInputOrigins != -1)
    swift_once();
  return &static InteractionTypeHelper.dialogDrivenInputOrigins;
}

uint64_t static InteractionTypeHelper.dialogDrivenInputOrigins.getter()
{
  return static InteractionTypeHelper.dialogDrivenInputOrigins.getter(&one-time initialization token for dialogDrivenInputOrigins);
}

uint64_t static InteractionTypeHelper.interactionType(inputOrigin:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v4;
  uint64_t v5;
  unsigned int *v6;

  if (one-time initialization token for dialogDrivenInputOrigins != -1)
    swift_once();
  v4 = specialized Set.contains(_:)(a1, static InteractionTypeHelper.dialogDrivenInputOrigins);
  v5 = OUTLINED_FUNCTION_3();
  v6 = (unsigned int *)MEMORY[0x24BEA8C30];
  if ((v4 & 1) == 0)
    v6 = (unsigned int *)MEMORY[0x24BEA8C38];
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(a2, *v6, v5);
}

uint64_t specialized Set.contains(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, unint64_t, uint64_t);
  char v12;
  uint64_t v14;
  uint64_t v15;

  v3 = type metadata accessor for InputOrigin();
  v15 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a2 + 16)
    && (lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type InputOrigin and conformance InputOrigin, (uint64_t (*)(uint64_t))MEMORY[0x24BEA8A48], MEMORY[0x24BEA8A58]), v6 = dispatch thunk of Hashable._rawHashValue(seed:)(), v7 = -1 << *(_BYTE *)(a2 + 32), v8 = v6 & ~v7, ((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0))
  {
    v9 = ~v7;
    v10 = *(_QWORD *)(v15 + 72);
    v11 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
    do
    {
      v11(v5, *(_QWORD *)(a2 + 48) + v10 * v8, v3);
      lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type InputOrigin and conformance InputOrigin, (uint64_t (*)(uint64_t))MEMORY[0x24BEA8A48], MEMORY[0x24BEA8A60]);
      v12 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v3);
      if ((v12 & 1) != 0)
        break;
      v8 = (v8 + 1) & v9;
    }
    while (((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, unint64_t, uint64_t);
  char v12;
  uint64_t v14;
  uint64_t v15;

  v3 = type metadata accessor for AudioDestination();
  v15 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a2 + 16)
    && (lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type AudioDestination and conformance AudioDestination, (uint64_t (*)(uint64_t))MEMORY[0x24BEA8CB8], MEMORY[0x24BEA8CC8]), v6 = dispatch thunk of Hashable._rawHashValue(seed:)(), v7 = -1 << *(_BYTE *)(a2 + 32), v8 = v6 & ~v7, ((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0))
  {
    v9 = ~v7;
    v10 = *(_QWORD *)(v15 + 72);
    v11 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
    do
    {
      v11(v5, *(_QWORD *)(a2 + 48) + v10 * v8, v3);
      lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type AudioDestination and conformance AudioDestination, (uint64_t (*)(uint64_t))MEMORY[0x24BEA8CB8], MEMORY[0x24BEA8CD0]);
      v12 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v3);
      if ((v12 & 1) != 0)
        break;
      v8 = (v8 + 1) & v9;
    }
    while (((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

uint64_t one-time initialization function for dialogDrivenAudioDestinations()
{
  uint64_t v0;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AudioDestination>);
  type metadata accessor for AudioDestination();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2132C4410;
  static AudioDestination.bluetoothHandsFreeDevice.getter();
  static AudioDestination.bluetoothA2DPDevice.getter();
  static AudioDestination.carAudio.getter();
  result = specialized Set.init(_nonEmptyArrayLiteral:)(v0);
  static InteractionTypeHelper.dialogDrivenAudioDestinations = result;
  return result;
}

uint64_t *InteractionTypeHelper.dialogDrivenAudioDestinations.unsafeMutableAddressor()
{
  if (one-time initialization token for dialogDrivenAudioDestinations != -1)
    swift_once();
  return &static InteractionTypeHelper.dialogDrivenAudioDestinations;
}

uint64_t static InteractionTypeHelper.dialogDrivenAudioDestinations.getter()
{
  return static InteractionTypeHelper.dialogDrivenInputOrigins.getter(&one-time initialization token for dialogDrivenAudioDestinations);
}

uint64_t static InteractionTypeHelper.dialogDrivenInputOrigins.getter(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t static InteractionTypeHelper.interactionType(audioDestination:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  char v17;
  unsigned int *v18;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_5();
  v7 = v6 - v5;
  v8 = type metadata accessor for AudioDestination();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_5();
  v12 = v11 - v10;
  outlined init with copy of AudioDestination?(a1, v7, &demangling cache variable for type metadata for AudioDestination?);
  if (__swift_getEnumTagSinglePayload(v7, 1, v8) == 1)
  {
    outlined destroy of AudioDestination?(v7, &demangling cache variable for type metadata for AudioDestination?);
    v13 = *MEMORY[0x24BEA8C38];
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_7();
    v15 = a2;
    v16 = v13;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v12, v7, v8);
    if (one-time initialization token for dialogDrivenAudioDestinations != -1)
      swift_once();
    v17 = specialized Set.contains(_:)(v12, static InteractionTypeHelper.dialogDrivenAudioDestinations);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v12, v8);
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_7();
    if ((v17 & 1) != 0)
      v18 = (unsigned int *)MEMORY[0x24BEA8C30];
    else
      v18 = (unsigned int *)MEMORY[0x24BEA8C38];
    v16 = *v18;
    v15 = a2;
  }
  return v14(v15, v16);
}

void InteractionTypeHelper.mapInteractionType(inputOrigin:isEyesFree:isDeviceInStarkMode:isDeviceInCarDND:audioSource:audioDestination:previousInteractionType:)(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
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
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  void (*v46)(uint64_t, uint64_t);
  unsigned int *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  void (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  void (*v66)(uint64_t, uint64_t);
  char v67;
  uint64_t v68;
  unsigned int *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(uint64_t);
  uint64_t v76;
  char v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  int v96;
  int v97;
  uint64_t v98;
  int v99;
  uint64_t v100;
  uint64_t v101;

  v85 = a7;
  v82 = a6;
  v92 = a5;
  v93 = a1;
  v96 = a4;
  v97 = a3;
  v99 = a2;
  v101 = a8;
  v88 = type metadata accessor for InputOrigin();
  v86 = *(_QWORD *)(v88 - 8);
  MEMORY[0x24BDAC7A8](v88);
  OUTLINED_FUNCTION_13();
  v87 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_13();
  v91 = v11;
  v94 = type metadata accessor for AudioSource();
  v89 = *(_QWORD *)(v94 - 8);
  MEMORY[0x24BDAC7A8](v94);
  OUTLINED_FUNCTION_14();
  v100 = v12;
  v14 = MEMORY[0x24BDAC7A8](v13);
  v83 = (char *)&v82 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v90 = (uint64_t)&v82 - v16;
  v98 = type metadata accessor for Logger();
  v17 = *(_QWORD *)(v98 - 8);
  MEMORY[0x24BDAC7A8](v98);
  OUTLINED_FUNCTION_5();
  v20 = v19 - v18;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for InteractionType?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_14();
  v84 = v22;
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v82 - v24;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DeviceClass?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_5();
  v29 = v28 - v27;
  v30 = type metadata accessor for DeviceClass();
  v31 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_5();
  v34 = v33 - v32;
  v35 = v8[8];
  v95 = v8;
  __swift_project_boxed_opaque_existential_1(v8 + 5, v35);
  dispatch thunk of DeviceClassProvider.currentDeviceClass.getter();
  if (__swift_getEnumTagSinglePayload(v29, 1, v30) == 1)
  {
    outlined destroy of AudioDestination?(v29, &demangling cache variable for type metadata for DeviceClass?);
    static Logger.logger.getter();
    v36 = Logger.logObject.getter();
    v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_2132A2000, v36, v37, "Unknown device type returned by MobileGestalt. Interaction type may not be accurate.", v38, 2u);
      MEMORY[0x2199B06A4](v38, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v20, v98);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 32))(v34, v29, v30);
    if (one-time initialization token for interactionForIdiom != -1)
      swift_once();
    specialized Dictionary.subscript.getter(v34, static InteractionTypeHelper.interactionForIdiom, (uint64_t)v25);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v34, v30);
    v39 = OUTLINED_FUNCTION_3();
    if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v39) != 1)
    {
      (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 32))(v101, v25, v39);
      return;
    }
    outlined destroy of AudioDestination?((uint64_t)v25, &demangling cache variable for type metadata for InteractionType?);
  }
  v40 = v100;
  if ((v99 & 1) != 0)
    goto LABEL_27;
  if ((v97 & 1) != 0)
    goto LABEL_27;
  if ((v96 & 1) != 0)
    goto LABEL_27;
  v41 = v95[3];
  v42 = v95[4];
  __swift_project_boxed_opaque_existential_1(v95, v41);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v42 + 8))(v41, v42) & 1) != 0)
    goto LABEL_27;
  v43 = v91;
  outlined init with copy of AudioDestination?(v92, v91, &demangling cache variable for type metadata for AudioSource?);
  v44 = v94;
  if (__swift_getEnumTagSinglePayload(v43, 1, v94) == 1)
  {
    outlined destroy of AudioDestination?(v43, &demangling cache variable for type metadata for AudioSource?);
    if (one-time initialization token for dialogDrivenInputOrigins != -1)
      swift_once();
    v45 = specialized Set.contains(_:)(v93, static InteractionTypeHelper.dialogDrivenInputOrigins);
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_7();
    if ((v45 & 1) != 0)
      v47 = (unsigned int *)MEMORY[0x24BEA8C30];
    else
      v47 = (unsigned int *)MEMORY[0x24BEA8C38];
    v57 = *v47;
    v58 = v101;
    goto LABEL_28;
  }
  v49 = v89;
  v48 = v90;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v89 + 32))(v90, v43, v44);
  v51 = v86;
  v50 = v87;
  v52 = v88;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v86 + 16))(v87, v93, v88);
  v53 = (*(uint64_t (**)(uint64_t, uint64_t))(v51 + 88))(v50, v52);
  if (v53 == *MEMORY[0x24BEA89F8])
  {
    v54 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
    v55 = v48;
LABEL_21:
    v56 = v44;
LABEL_26:
    v54(v55, v56);
LABEL_27:
    OUTLINED_FUNCTION_3();
    v58 = OUTLINED_FUNCTION_10();
LABEL_28:
    v46(v58, v57);
    return;
  }
  if (v53 == *MEMORY[0x24BEA89F0])
  {
    v55 = v90;
    v54 = *(void (**)(uint64_t, uint64_t))(v89 + 8);
    v56 = v94;
    goto LABEL_26;
  }
  v44 = v94;
  v59 = v89;
  if (v53 != *MEMORY[0x24BEA8A10])
  {
    if (v53 == *MEMORY[0x24BEA89E0])
    {
      v54 = *(void (**)(uint64_t, uint64_t))(v89 + 8);
      v55 = v90;
      goto LABEL_21;
    }
    v62 = (uint64_t)v83;
    (*(void (**)(char *, uint64_t, uint64_t))(v89 + 16))(v83, v90, v94);
    static AudioSource.lineIn.getter();
    lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type AudioSource and conformance AudioSource, (uint64_t (*)(uint64_t))MEMORY[0x24BEA88E0], MEMORY[0x24BEA88F0]);
    v64 = v63;
    v65 = OUTLINED_FUNCTION_0_1();
    v66 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
    OUTLINED_FUNCTION_4(v40);
    if ((v65 & 1) != 0)
    {
      OUTLINED_FUNCTION_4(v62);
      if (one-time initialization token for dialogDrivenInputOrigins != -1)
        swift_once();
      v67 = specialized Set.contains(_:)(v93, static InteractionTypeHelper.dialogDrivenInputOrigins);
      v68 = OUTLINED_FUNCTION_3();
      v69 = (unsigned int *)MEMORY[0x24BEA8C30];
      if ((v67 & 1) == 0)
        v69 = (unsigned int *)MEMORY[0x24BEA8C38];
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v68 - 8) + 104))(v101, *v69, v68);
      v70 = v90;
      v71 = v44;
    }
    else
    {
      static AudioSource.wiredHeadsetMic.getter();
      OUTLINED_FUNCTION_0_1();
      OUTLINED_FUNCTION_2();
      static AudioSource.bluetoothHandsFreeDevice.getter();
      OUTLINED_FUNCTION_0_1();
      OUTLINED_FUNCTION_2();
      if ((v65 & 1) != 0)
      {
        OUTLINED_FUNCTION_4(v62);
        v72 = v90;
        v73 = v44;
        goto LABEL_46;
      }
      static AudioSource.usbAudio.getter();
      OUTLINED_FUNCTION_0_1();
      OUTLINED_FUNCTION_2();
      static AudioSource.unknown.getter();
      OUTLINED_FUNCTION_0_1();
      OUTLINED_FUNCTION_2();
      static AudioSource.carAudio.getter();
      OUTLINED_FUNCTION_0_1();
      OUTLINED_FUNCTION_2();
      v76 = v100;
      static AudioSource.builtInMic.getter();
      v77 = OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_4(v76);
      if ((v77 & 1) == 0)
      {
        v78 = v100;
        static AudioSource.bluetoothDoAPDevice.getter();
        v79 = OUTLINED_FUNCTION_1_0();
        OUTLINED_FUNCTION_4(v78);
        if ((v79 & 1) == 0)
        {
          v80 = v100;
          static AudioSource.carJarvisDevice.getter();
          v81 = (uint64_t)v83;
          dispatch thunk of static Equatable.== infix(_:_:)();
          OUTLINED_FUNCTION_12(v80);
          OUTLINED_FUNCTION_12(v81);
          OUTLINED_FUNCTION_12(v90);
          OUTLINED_FUNCTION_3();
          OUTLINED_FUNCTION_7();
          v74 = v101;
          goto LABEL_47;
        }
        OUTLINED_FUNCTION_9();
        v72 = v90;
        v73 = v64;
LABEL_46:
        v66(v72, v73);
        OUTLINED_FUNCTION_3();
        v74 = OUTLINED_FUNCTION_10();
LABEL_47:
        v75(v74);
        goto LABEL_43;
      }
      OUTLINED_FUNCTION_9();
      static InteractionTypeHelper.interactionType(audioDestination:)(v82, v101);
      v70 = v90;
      v71 = v64;
    }
    v66(v70, v71);
LABEL_43:
    (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v87, v88);
    return;
  }
  (*(void (**)(uint64_t, uint64_t))(v89 + 8))(v90, v94);
  v60 = v84;
  outlined init with copy of AudioDestination?(v85, v84, &demangling cache variable for type metadata for InteractionType?);
  v61 = OUTLINED_FUNCTION_3();
  if (__swift_getEnumTagSinglePayload(v60, 1, v61) == 1)
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v61 - 8) + 104))(v101, *MEMORY[0x24BEA8C38], v61);
    outlined destroy of AudioDestination?(v60, &demangling cache variable for type metadata for InteractionType?);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 32))(v101, v60, v61);
  }
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void outlined init with copy of AudioDestination?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_8();
}

void outlined destroy of AudioDestination?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_8();
}

uint64_t specialized Dictionary.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v5;
  char v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (*(_QWORD *)(a2 + 16) && (v5 = specialized __RawDictionaryStorage.find<A>(_:)(a1), (v6 & 1) != 0))
  {
    v7 = v5;
    v8 = *(_QWORD *)(a2 + 56);
    v9 = type metadata accessor for InteractionType();
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a3, v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * v7, v9);
    v10 = a3;
    v11 = 0;
    v12 = v9;
  }
  else
  {
    v12 = type metadata accessor for InteractionType();
    v10 = a3;
    v11 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v10, v11, 1, v12);
}

void specialized Dictionary.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16))
  {
    OUTLINED_FUNCTION_11(a1, a2);
    if ((v3 & 1) != 0)
      swift_unknownObjectRetain();
  }
  OUTLINED_FUNCTION_8();
}

{
  char v3;

  if (*(_QWORD *)(a3 + 16))
  {
    OUTLINED_FUNCTION_11(a1, a2);
    if ((v3 & 1) != 0)
      swift_bridgeObjectRetain();
  }
  OUTLINED_FUNCTION_8();
}

uint64_t specialized Dictionary.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  char v5;

  if (*(_QWORD *)(a3 + 16) && (v4 = OUTLINED_FUNCTION_11(a1, a2), (v5 & 1) != 0))
    return *(unsigned __int8 *)(*(_QWORD *)(v3 + 56) + v4);
  else
    return 2;
}

BOOL AccessibilityStatusProviderImpl.isVoiceOverEnabled.getter()
{
  return _AXSVoiceOverTouchEnabled() != 0;
}

uint64_t serialize(_:at:)(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for InteractionTypeHelper(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for InteractionTypeHelper(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 40);
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

uint64_t initializeWithCopy for InteractionTypeHelper(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  return a1;
}

uint64_t *assignWithCopy for InteractionTypeHelper(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  __swift_assign_boxed_opaque_existential_1(a1 + 5, a2 + 5);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

void *__swift_memcpy80_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x50uLL);
}

uint64_t assignWithTake for InteractionTypeHelper(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for InteractionTypeHelper(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 80))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InteractionTypeHelper(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for InteractionTypeHelper()
{
  return &type metadata for InteractionTypeHelper;
}

uint64_t dispatch thunk of AccessibilityStatusProvider.isVoiceOverEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

ValueMetadata *type metadata accessor for AccessibilityStatusProviderImpl()
{
  return &type metadata for AccessibilityStatusProviderImpl;
}

uint64_t specialized Set.init(_nonEmptyArrayLiteral:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v2 = type metadata accessor for InputOrigin();
  v31 = *(_QWORD *)(v2 - 8);
  v3 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v26 - v6;
  if (!*(_QWORD *)(a1 + 16))
  {
    v9 = MEMORY[0x24BEE4B08];
    goto LABEL_16;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<InputOrigin>);
  result = static _SetStorage.allocate(capacity:)();
  v9 = result;
  v28 = *(_QWORD *)(a1 + 16);
  if (!v28)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return v9;
  }
  v10 = 0;
  v30 = result + 56;
  v11 = *(unsigned __int8 *)(v31 + 80);
  v26 = a1;
  v27 = a1 + ((v11 + 32) & ~v11);
  while (v10 < *(_QWORD *)(a1 + 16))
  {
    v12 = *(_QWORD *)(v31 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v31 + 16);
    v13(v7, v27 + v12 * v10, v2);
    lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type InputOrigin and conformance InputOrigin, (uint64_t (*)(uint64_t))MEMORY[0x24BEA8A48], MEMORY[0x24BEA8A58]);
    v14 = dispatch thunk of Hashable._rawHashValue(seed:)();
    v15 = -1 << *(_BYTE *)(v9 + 32);
    v16 = v14 & ~v15;
    v17 = v16 >> 6;
    v18 = *(_QWORD *)(v30 + 8 * (v16 >> 6));
    v19 = 1 << v16;
    if (((1 << v16) & v18) != 0)
    {
      v29 = v10;
      v20 = ~v15;
      while (1)
      {
        v13(v5, *(_QWORD *)(v9 + 48) + v16 * v12, v2);
        lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type InputOrigin and conformance InputOrigin, (uint64_t (*)(uint64_t))MEMORY[0x24BEA8A48], MEMORY[0x24BEA8A60]);
        v21 = dispatch thunk of static Equatable.== infix(_:_:)();
        v22 = *(void (**)(char *, uint64_t))(v31 + 8);
        v22(v5, v2);
        if ((v21 & 1) != 0)
          break;
        v16 = (v16 + 1) & v20;
        v17 = v16 >> 6;
        v18 = *(_QWORD *)(v30 + 8 * (v16 >> 6));
        v19 = 1 << v16;
        if ((v18 & (1 << v16)) == 0)
        {
          a1 = v26;
          v10 = v29;
          goto LABEL_10;
        }
      }
      result = ((uint64_t (*)(char *, uint64_t))v22)(v7, v2);
      a1 = v26;
      v10 = v29;
    }
    else
    {
LABEL_10:
      *(_QWORD *)(v30 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v31 + 32))(*(_QWORD *)(v9 + 48) + v16 * v12, v7, v2);
      v23 = *(_QWORD *)(v9 + 16);
      v24 = __OFADD__(v23, 1);
      v25 = v23 + 1;
      if (v24)
        goto LABEL_18;
      *(_QWORD *)(v9 + 16) = v25;
    }
    if (++v10 == v28)
      goto LABEL_16;
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v2 = type metadata accessor for AudioDestination();
  v31 = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v26 - v6;
  if (!*(_QWORD *)(a1 + 16))
  {
    v9 = MEMORY[0x24BEE4B08];
    goto LABEL_16;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<AudioDestination>);
  result = static _SetStorage.allocate(capacity:)();
  v9 = result;
  v28 = *(_QWORD *)(a1 + 16);
  if (!v28)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return v9;
  }
  v10 = 0;
  v30 = result + 56;
  v11 = *(unsigned __int8 *)(v31 + 80);
  v26 = a1;
  v27 = a1 + ((v11 + 32) & ~v11);
  while (v10 < *(_QWORD *)(a1 + 16))
  {
    v12 = *(_QWORD *)(v31 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v31 + 16);
    v13(v7, v27 + v12 * v10, v2);
    lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type AudioDestination and conformance AudioDestination, (uint64_t (*)(uint64_t))MEMORY[0x24BEA8CB8], MEMORY[0x24BEA8CC8]);
    v14 = dispatch thunk of Hashable._rawHashValue(seed:)();
    v15 = -1 << *(_BYTE *)(v9 + 32);
    v16 = v14 & ~v15;
    v17 = v16 >> 6;
    v18 = *(_QWORD *)(v30 + 8 * (v16 >> 6));
    v19 = 1 << v16;
    if (((1 << v16) & v18) != 0)
    {
      v29 = v10;
      v20 = ~v15;
      while (1)
      {
        v13(v5, *(_QWORD *)(v9 + 48) + v16 * v12, v2);
        lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type AudioDestination and conformance AudioDestination, (uint64_t (*)(uint64_t))MEMORY[0x24BEA8CB8], MEMORY[0x24BEA8CD0]);
        v21 = dispatch thunk of static Equatable.== infix(_:_:)();
        v22 = *(void (**)(char *, uint64_t))(v31 + 8);
        v22(v5, v2);
        if ((v21 & 1) != 0)
          break;
        v16 = (v16 + 1) & v20;
        v17 = v16 >> 6;
        v18 = *(_QWORD *)(v30 + 8 * (v16 >> 6));
        v19 = 1 << v16;
        if ((v18 & (1 << v16)) == 0)
        {
          a1 = v26;
          v10 = v29;
          goto LABEL_10;
        }
      }
      result = ((uint64_t (*)(char *, uint64_t))v22)(v7, v2);
      a1 = v26;
      v10 = v29;
    }
    else
    {
LABEL_10:
      *(_QWORD *)(v30 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v31 + 32))(*(_QWORD *)(v9 + 48) + v16 * v12, v7, v2);
      v23 = *(_QWORD *)(v9 + 16);
      v24 = __OFADD__(v23, 1);
      v25 = v23 + 1;
      if (v24)
        goto LABEL_18;
      *(_QWORD *)(v9 + 16) = v25;
    }
    if (++v10 == v28)
      goto LABEL_16;
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

void lazy protocol witness table accessor for type AudioSource and conformance AudioSource(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x2199B062C](a3, v5), a1);
  }
  OUTLINED_FUNCTION_8();
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t OUTLINED_FUNCTION_2()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return type metadata accessor for InteractionType();
}

uint64_t OUTLINED_FUNCTION_4(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_9()
{
  uint64_t (*v0)(_QWORD, _QWORD);
  uint64_t v1;

  return v0(*(_QWORD *)(v1 - 232), *(_QWORD *)(v1 - 144));
}

uint64_t OUTLINED_FUNCTION_10()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 96);
}

unint64_t OUTLINED_FUNCTION_11(uint64_t a1, uint64_t a2)
{
  return specialized __RawDictionaryStorage.find<A>(_:)(a1, a2);
}

uint64_t OUTLINED_FUNCTION_12(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t SiriLocationProvider.requestOrigin()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DispatchTimeInterval?);
  v3[5] = OUTLINED_FUNCTION_4_0();
  return OUTLINED_FUNCTION_0_2();
}

uint64_t SiriLocationProvider.requestOrigin()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(_QWORD, _QWORD, _QWORD);

  v1 = v0[5];
  v2 = type metadata accessor for DispatchTimeInterval();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v2);
  v3 = (_QWORD *)OUTLINED_FUNCTION_2_0();
  v0[6] = v3;
  *v3 = v0;
  v3[1] = SiriLocationProvider.requestOrigin();
  return v5(v0[5], v0[2], v0[3]);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_5_0();
  v3 = *(_QWORD *)(v2 + 40);
  OUTLINED_FUNCTION_3_0();
  outlined destroy of DispatchTimeInterval?(v3);
  swift_task_dealloc();
  return OUTLINED_FUNCTION_1_1(v0, *(uint64_t (**)(void))(v1 + 8));
}

uint64_t outlined destroy of DispatchTimeInterval?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DispatchTimeInterval?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t DummyLocationProvider.requestOrigin(searchTimeout:)()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = type metadata accessor for Logger();
  v0[2] = v1;
  v0[3] = *(_QWORD *)(v1 - 8);
  v0[4] = OUTLINED_FUNCTION_4_0();
  return OUTLINED_FUNCTION_0_2();
}

{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  static Logger.logger.getter();
  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2132A2000, v1, v2, "DummyLocationProvider was used; this should not happen.", v3, 2u);
    MEMORY[0x2199B06A4](v3, -1, -1);
  }
  v5 = *(_QWORD *)(v0 + 24);
  v4 = *(_QWORD *)(v0 + 32);
  v6 = *(_QWORD *)(v0 + 16);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_task_dealloc();
  return OUTLINED_FUNCTION_1_1(0, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t protocol witness for SiriLocationProvider.requestOrigin(searchTimeout:) in conformance DummyLocationProvider()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = protocol witness for SiriLocationProvider.requestOrigin(searchTimeout:) in conformance DummyLocationProvider;
  return DummyLocationProvider.requestOrigin(searchTimeout:)();
}

uint64_t dispatch thunk of SiriLocationProvider.requestOrigin(searchTimeout:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v7 = (_QWORD *)OUTLINED_FUNCTION_2_0();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = dispatch thunk of SiriLocationProvider.requestOrigin(searchTimeout:);
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of SiriLocationProvider.requestOrigin(searchTimeout:)()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(v0);
}

ValueMetadata *type metadata accessor for DummyLocationProvider()
{
  return &type metadata for DummyLocationProvider;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_1_1(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return swift_task_alloc();
}

void OUTLINED_FUNCTION_5_0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

CNContact_optional __swiftcall MeCardProxy.fetchMeCard()()
{
  uint64_t v0;
  objc_class *v1;
  Swift::Bool v2;
  uint64_t v3;
  CNContact_optional result;

  v3 = 0;
  v1 = (objc_class *)(*(uint64_t (**)(uint64_t *))(v0 + 8))(&v3);
  result.value.super.isa = v1;
  result.is_nil = v2;
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

uint64_t MeCardOptions.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

SiriFlowEnvironment::MeCardOptions __swiftcall MeCardOptions.init(rawValue:)(SiriFlowEnvironment::MeCardOptions rawValue)
{
  SiriFlowEnvironment::MeCardOptions *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static MeCardOptions.ignoreLocalMeCard.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static MeCardOptions.ignoreCachedMeCard.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

SiriFlowEnvironment::MeCardOptions protocol witness for OptionSet.init(rawValue:) in conformance MeCardOptions(Swift::Int *a1)
{
  return MeCardOptions.init(rawValue:)(*a1);
}

void specialized OptionSet<>.init()(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

unint64_t lazy protocol witness table accessor for type MeCardOptions and conformance MeCardOptions()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions;
  if (!lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions)
  {
    result = MEMORY[0x2199B062C](&protocol conformance descriptor for MeCardOptions, &type metadata for MeCardOptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions;
  if (!lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions)
  {
    result = MEMORY[0x2199B062C](&protocol conformance descriptor for MeCardOptions, &type metadata for MeCardOptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions;
  if (!lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions)
  {
    result = MEMORY[0x2199B062C](&protocol conformance descriptor for MeCardOptions, &type metadata for MeCardOptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions;
  if (!lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions)
  {
    result = MEMORY[0x2199B062C](&protocol conformance descriptor for MeCardOptions, &type metadata for MeCardOptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions);
  }
  return result;
}

uint64_t specialized OptionSet<>.init()()
{
  return 0;
}

uint64_t protocol witness for SetAlgebra.union(_:) in conformance MeCardOptions@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return specialized OptionSet.union(_:)(*a1, *v2, a2);
}

uint64_t specialized OptionSet.union(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 | result;
  return result;
}

uint64_t protocol witness for SetAlgebra.intersection(_:) in conformance MeCardOptions@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return specialized OptionSet.intersection(_:)(*a1, *v2, a2);
}

uint64_t specialized OptionSet.intersection(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & result;
  return result;
}

uint64_t protocol witness for SetAlgebra.symmetricDifference(_:) in conformance MeCardOptions@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return specialized OptionSet.symmetricDifference(_:)(*a1, *v2, a2);
}

uint64_t specialized OptionSet.symmetricDifference(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 ^ result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance MeCardOptions(_QWORD *a1, uint64_t *a2)
{
  return specialized OptionSet<>.insert(_:)(a1, *a2);
}

BOOL specialized OptionSet<>.insert(_:)(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & a2;
  if (v3 != a2)
    *v2 |= a2;
  *a1 = a2;
  return v3 != a2;
}

uint64_t protocol witness for SetAlgebra.remove(_:) in conformance MeCardOptions@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return specialized OptionSet<>.remove(_:)(*a1, a2);
}

uint64_t specialized OptionSet<>.remove(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & result;
  if (v3)
    *v2 &= ~result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t protocol witness for SetAlgebra.update(with:) in conformance MeCardOptions@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return specialized OptionSet<>.update(with:)(*a1, a2);
}

uint64_t specialized OptionSet<>.update(with:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *v2;
  *v2 |= result;
  v4 = v3 & result;
  *(_QWORD *)a2 = v4;
  *(_BYTE *)(a2 + 8) = v4 == 0;
  return result;
}

uint64_t protocol witness for SetAlgebra.formUnion(_:) in conformance MeCardOptions(uint64_t *a1)
{
  return specialized OptionSet<>.formUnion(_:)(*a1);
}

uint64_t specialized OptionSet<>.formUnion(_:)(uint64_t result)
{
  _QWORD *v1;

  *v1 |= result;
  return result;
}

uint64_t protocol witness for SetAlgebra.formIntersection(_:) in conformance MeCardOptions(uint64_t *a1)
{
  return specialized OptionSet<>.formIntersection(_:)(*a1);
}

uint64_t specialized OptionSet<>.formIntersection(_:)(uint64_t result)
{
  _QWORD *v1;

  *v1 &= result;
  return result;
}

uint64_t protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance MeCardOptions(uint64_t *a1)
{
  return specialized OptionSet<>.formSymmetricDifference(_:)(*a1);
}

uint64_t specialized OptionSet<>.formSymmetricDifference(_:)(uint64_t result)
{
  _QWORD *v1;

  *v1 ^= result;
  return result;
}

uint64_t protocol witness for SetAlgebra.subtracting(_:) in conformance MeCardOptions@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return specialized SetAlgebra.subtracting(_:)(*a1, *v2, a2);
}

uint64_t specialized SetAlgebra.subtracting(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & ~result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance MeCardOptions(uint64_t *a1)
{
  uint64_t *v1;

  return specialized SetAlgebra.isSubset(of:)(*a1, *v1);
}

BOOL specialized SetAlgebra.isSubset(of:)(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance MeCardOptions(uint64_t *a1)
{
  uint64_t *v1;

  return specialized SetAlgebra.isDisjoint(with:)(*a1, *v1);
}

BOOL specialized SetAlgebra.isDisjoint(with:)(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance MeCardOptions(uint64_t *a1)
{
  uint64_t *v1;

  return specialized SetAlgebra.isSuperset(of:)(*a1, *v1);
}

BOOL specialized SetAlgebra.isSuperset(of:)(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance MeCardOptions()
{
  uint64_t *v0;

  return specialized SetAlgebra.isEmpty.getter(*v0);
}

BOOL specialized SetAlgebra.isEmpty.getter(uint64_t a1)
{
  return a1 == 0;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance MeCardOptions()
{
  return SetAlgebra.init<A>(_:)();
}

uint64_t protocol witness for SetAlgebra.subtract(_:) in conformance MeCardOptions(uint64_t *a1)
{
  return specialized SetAlgebra.subtract(_:)(*a1);
}

uint64_t specialized SetAlgebra.subtract(_:)(uint64_t result)
{
  _QWORD *v1;

  *v1 &= ~result;
  return result;
}

SiriFlowEnvironment::MeCardOptions protocol witness for RawRepresentable.init(rawValue:) in conformance MeCardOptions@<X0>(Swift::Int *a1@<X0>, uint64_t a2@<X8>)
{
  SiriFlowEnvironment::MeCardOptions result;

  result.rawValue = MeCardOptions.init(rawValue:)(*a1).rawValue;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance MeCardOptions@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = MeCardOptions.rawValue.getter();
  *a1 = result;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance MeCardOptions(uint64_t *a1, uint64_t *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

uint64_t dispatch thunk of MeCardProxy.fetchMeCard(options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

ValueMetadata *type metadata accessor for MeCardOptions()
{
  return &type metadata for MeCardOptions;
}

uint64_t MultiUserState.requiresUserGrounding.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;
  _OWORD v13[4];

  OUTLINED_FUNCTION_0_3(a1, a2, a3, a4, a5, a6, a7, a8, *(uint64_t *)&v10[0]);
  if ((_QWORD)v11 == 1)
  {
    outlined destroy of MultiUserState((uint64_t)v10);
    return 0;
  }
  else
  {
    v13[0] = v10[0];
    v13[1] = v10[1];
    v13[2] = v11;
    v13[3] = v12;
    v8 = LOBYTE(v10[0]);
    outlined destroy of MultiUserContext((uint64_t)v13);
  }
  return v8;
}

uint64_t outlined init with copy of MultiUserState(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for MultiUserState(a2, a1);
  return a2;
}

uint64_t outlined destroy of MultiUserState(uint64_t a1)
{
  destroy for MultiUserState(a1);
  return a1;
}

uint64_t outlined destroy of MultiUserContext(uint64_t a1)
{
  destroy for MultiUserContext(a1);
  return a1;
}

BOOL MultiUserState.isEnabled.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10[4];
  uint64_t v11;

  OUTLINED_FUNCTION_0_3(a1, a2, a3, a4, a5, a6, a7, a8, v10[0]);
  v8 = v11;
  if (v11 != 1)
    outlined destroy of MultiUserState((uint64_t)v10);
  return v8 != 1;
}

uint64_t MultiUserContext.requiresUserGrounding.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t MultiUserContext.meCardProxy.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of MeCardProxy?(v1 + 8, a1);
}

uint64_t outlined init with copy of MeCardProxy?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MeCardProxy?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t MultiUserContext.meCardProxy.setter(uint64_t a1)
{
  uint64_t v1;

  return outlined assign with take of MeCardProxy?(a1, v1 + 8);
}

uint64_t outlined assign with take of MeCardProxy?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MeCardProxy?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*MultiUserContext.meCardProxy.modify())()
{
  return FlowTaskMetadata.id.modify;
}

uint64_t MultiUserContext.handoffTargetDeviceID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MultiUserContext.init(requiresUserGrounding:meCardProxy:handoffTargetDeviceID:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t result;

  *(_QWORD *)(a5 + 40) = 0;
  *(_OWORD *)(a5 + 24) = 0u;
  *(_OWORD *)(a5 + 8) = 0u;
  *(_BYTE *)a5 = a1;
  result = outlined assign with take of MeCardProxy?(a2, a5 + 8);
  *(_QWORD *)(a5 + 48) = a3;
  *(_QWORD *)(a5 + 56) = a4;
  return result;
}

uint64_t destroy for MultiUserState(uint64_t result)
{
  unint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  LODWORD(v2) = -1;
  if (v1 < 0xFFFFFFFF)
    v2 = *(_QWORD *)(result + 32);
  if ((int)v2 - 1 < 0)
  {
    if (v1)
      __swift_destroy_boxed_opaque_existential_1(result + 8);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for MultiUserState(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  _OWORD *v8;
  _OWORD *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v4 = *(_QWORD *)(a2 + 32);
  LODWORD(v5) = -1;
  if (v4 < 0xFFFFFFFF)
    v5 = *(_QWORD *)(a2 + 32);
  if ((int)v5 - 1 < 0)
  {
    v8 = (_OWORD *)(a2 + 8);
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v9 = (_OWORD *)(a1 + 8);
    if (v4)
    {
      v10 = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 32) = v4;
      *(_QWORD *)(a1 + 40) = v10;
      (**(void (***)(_OWORD *, _OWORD *))(v4 - 8))(v9, v8);
    }
    else
    {
      v11 = *(_OWORD *)(a2 + 24);
      *v9 = *v8;
      *(_OWORD *)(a1 + 24) = v11;
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    }
    v12 = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 56) = v12;
    swift_bridgeObjectRetain();
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    v7 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v7;
  }
  return a1;
}

uint64_t assignWithCopy for MultiUserState(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  __int128 *v9;
  int v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v4 = a1 + 8;
  v5 = *(_QWORD *)(a1 + 32);
  LODWORD(v6) = -1;
  if (v5 >= 0xFFFFFFFF)
    LODWORD(v7) = -1;
  else
    v7 = *(_QWORD *)(a1 + 32);
  v8 = v7 - 1;
  v9 = (__int128 *)((char *)a2 + 8);
  if (*((_QWORD *)a2 + 4) < 0xFFFFFFFFuLL)
    v6 = *((_QWORD *)a2 + 4);
  v10 = v6 - 1;
  if (v8 < 0)
  {
    if ((v10 & 0x80000000) == 0)
    {
      if (v5)
        __swift_destroy_boxed_opaque_existential_1(a1 + 8);
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v15 = *((_QWORD *)a2 + 4);
    if (v5)
    {
      if (v15)
      {
        __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 8), (uint64_t *)a2 + 1);
LABEL_24:
        *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
        *(_QWORD *)(a1 + 56) = *((_QWORD *)a2 + 7);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        return a1;
      }
      __swift_destroy_boxed_opaque_existential_1(a1 + 8);
    }
    else if (v15)
    {
      *(_QWORD *)(a1 + 32) = v15;
      *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
      (**(void (***)(uint64_t, uint64_t))(v15 - 8))(a1 + 8, (uint64_t)a2 + 8);
      goto LABEL_24;
    }
    v18 = *v9;
    v19 = v9[1];
    *(_QWORD *)(v4 + 32) = *((_QWORD *)v9 + 4);
    *(_OWORD *)v4 = v18;
    *(_OWORD *)(v4 + 16) = v19;
    goto LABEL_24;
  }
  if ((v10 & 0x80000000) == 0)
  {
LABEL_14:
    v12 = *a2;
    v13 = a2[1];
    v14 = a2[3];
    *(_OWORD *)(a1 + 32) = a2[2];
    *(_OWORD *)(a1 + 48) = v14;
    *(_OWORD *)a1 = v12;
    *(_OWORD *)(a1 + 16) = v13;
    return a1;
  }
  *(_BYTE *)a1 = *(_BYTE *)a2;
  v11 = *((_QWORD *)a2 + 4);
  if (v11)
  {
    *(_QWORD *)(a1 + 32) = v11;
    *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
    (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 8, (uint64_t)a2 + 8);
  }
  else
  {
    v16 = *v9;
    v17 = *(__int128 *)((char *)a2 + 24);
    *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
    *(_OWORD *)v4 = v16;
    *(_OWORD *)(a1 + 24) = v17;
  }
  *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
  *(_QWORD *)(a1 + 56) = *((_QWORD *)a2 + 7);
  swift_bridgeObjectRetain();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for MultiUserState(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  _OWORD *v11;
  __int128 v12;
  uint64_t v13;

  v4 = *(_QWORD *)(a1 + 32);
  LODWORD(v5) = -1;
  if (v4 < 0xFFFFFFFF)
    v5 = *(_QWORD *)(a1 + 32);
  if ((int)v5 - 1 >= 0)
    goto LABEL_10;
  v6 = (_OWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a2 + 32);
  if (v7 >= 0xFFFFFFFF)
    LODWORD(v7) = -1;
  if ((int)v7 - 1 >= 0)
  {
    if (v4)
      __swift_destroy_boxed_opaque_existential_1(a1 + 8);
    swift_bridgeObjectRelease();
LABEL_10:
    v8 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v8;
    v9 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v9;
    return a1;
  }
  v11 = (_OWORD *)(a2 + 8);
  *(_BYTE *)a1 = *(_BYTE *)a2;
  if (v4)
    __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  v12 = *(_OWORD *)(a2 + 24);
  *v6 = *v11;
  *(_OWORD *)(a1 + 24) = v12;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v13 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v13;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MultiUserState(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 64))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  if ((v4 + 1) >= 2)
    return v4;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for MultiUserState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 64) = 0;
    if (a2)
      *(_QWORD *)(result + 32) = a2 + 1;
  }
  return result;
}

uint64_t getEnumTag for MultiUserState(uint64_t a1)
{
  unint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  v2 = v1 - 1;
  if (v2 < 0)
    v2 = -1;
  return (v2 + 1);
}

double destructiveInjectEnumTag for MultiUserState(uint64_t a1, unsigned int a2)
{
  double result;

  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(a1 + 56) = 0;
    result = 0.0;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_QWORD *)a1 = a2 - 0x7FFFFFFF;
  }
  else if (a2)
  {
    *(_QWORD *)(a1 + 32) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for MultiUserState()
{
  return &type metadata for MultiUserState;
}

uint64_t destroy for MultiUserContext(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MultiUserContext(uint64_t a1, char *a2)
{
  char *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v5 = *a2;
  v4 = a2 + 8;
  *(_BYTE *)a1 = v5;
  v6 = a1 + 8;
  v7 = *((_QWORD *)a2 + 4);
  if (v7)
  {
    v8 = *((_QWORD *)a2 + 5);
    *(_QWORD *)(a1 + 32) = v7;
    *(_QWORD *)(a1 + 40) = v8;
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))(v6, (uint64_t)v4);
  }
  else
  {
    v9 = *((_OWORD *)v4 + 1);
    *(_OWORD *)v6 = *(_OWORD *)v4;
    *(_OWORD *)(v6 + 16) = v9;
    *(_QWORD *)(v6 + 32) = *((_QWORD *)v4 + 4);
  }
  v10 = *((_QWORD *)a2 + 7);
  *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
  *(_QWORD *)(a1 + 56) = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MultiUserContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = a1 + 8;
  v5 = (__int128 *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    if (v6)
    {
      *(_QWORD *)(a1 + 32) = v6;
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 8, a2 + 8);
      goto LABEL_8;
    }
LABEL_7:
    v7 = *v5;
    v8 = v5[1];
    *(_QWORD *)(v4 + 32) = *((_QWORD *)v5 + 4);
    *(_OWORD *)v4 = v7;
    *(_OWORD *)(v4 + 16) = v8;
    goto LABEL_8;
  }
  if (!v6)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 8);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 8), (uint64_t *)(a2 + 8));
LABEL_8:
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for MultiUserContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = a1 + 8;
  if (*(_QWORD *)(a1 + 32))
    __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  v5 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)v4 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(v4 + 16) = v5;
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(v4 + 32) = *(_QWORD *)(a2 + 40);
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v6;
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MultiUserContext(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 64))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 32);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MultiUserContext(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 64) = 0;
    if (a2)
      *(_QWORD *)(result + 32) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for MultiUserContext()
{
  return &type metadata for MultiUserContext;
}

uint64_t OUTLINED_FUNCTION_0_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  return outlined init with copy of MultiUserState(v9, (uint64_t)&a9);
}

double one-time initialization function for internalSharedContext()
{
  uint64_t v0;
  double result;

  type metadata accessor for RefreshableSharedContext();
  v0 = swift_allocObject();
  result = 0.0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  static SharedContext.internalSharedContext = v0;
  return result;
}

double RefreshableSharedContext.__allocating_init()()
{
  uint64_t v0;
  double result;

  v0 = swift_allocObject();
  result = 0.0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  return result;
}

uint64_t static SharedContext.internalSharedContext.getter()
{
  if (one-time initialization token for internalSharedContext != -1)
    swift_once();
  return swift_retain();
}

uint64_t static SharedContext.current.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;

  if (one-time initialization token for internalSharedContext != -1)
    swift_once();
  v2 = static SharedContext.internalSharedContext;
  a1[3] = type metadata accessor for RefreshableSharedContext();
  a1[4] = (uint64_t)&protocol witness table for RefreshableSharedContext;
  *a1 = v2;
  return swift_retain();
}

uint64_t key path setter for RefreshableSharedContext.sharedContext : RefreshableSharedContext(uint64_t a1, uint64_t a2)
{
  _BYTE v4[40];

  outlined init with copy of SharedContextService?(a1, (uint64_t)v4);
  return (*(uint64_t (**)(_BYTE *))(**(_QWORD **)a2 + 96))(v4);
}

void RefreshableSharedContext.sharedContext.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  swift_beginAccess();
  outlined init with copy of SharedContextService?(v1 + 16, a1);
  OUTLINED_FUNCTION_2_1();
}

void RefreshableSharedContext.sharedContext.setter(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_1_2();
  outlined assign with take of SharedContextService?(a1, v1 + 16);
  swift_endAccess();
  OUTLINED_FUNCTION_2_1();
}

uint64_t (*RefreshableSharedContext.sharedContext.modify())()
{
  OUTLINED_FUNCTION_1_2();
  return RefreshableSharedContext.sharedContext.modify;
}

uint64_t RefreshableSharedContext.stateOrBail()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v3 = type metadata accessor for Logger();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(__int128 *__return_ptr, uint64_t))(*(_QWORD *)v1 + 88))(&v17, v5);
  if (v18)
    return outlined init with take of DeviceClassProvider(&v17, a1);
  v15 = v4;
  outlined destroy of SharedContextService?((uint64_t)&v17);
  static Logger.logger.getter();
  v9 = Logger.logObject.getter();
  v10 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    *(_QWORD *)&v17 = swift_slowAlloc();
    *(_DWORD *)v11 = 136315650;
    v12 = StaticString.description.getter();
    v16 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v13, (uint64_t *)&v17);
    OUTLINED_FUNCTION_0_4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2048;
    v16 = 51;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v11 + 22) = 2080;
    v16 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000028, 0x80000002132C5BC0, (uint64_t *)&v17);
    OUTLINED_FUNCTION_0_4();
    _os_log_impl(&dword_2132A2000, v9, v10, "FatalError at %s:%lu - %s", (uint8_t *)v11, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_1();
  }

  (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v3);
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t RefreshableSharedContext.fetchContext(for:includesNearbyDevices:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  RefreshableSharedContext.stateOrBail()((uint64_t)v11);
  v8 = v12;
  v9 = v13;
  __swift_project_boxed_opaque_existential_1(v11, v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 8))(a1, a2, a3, a4, v8, v9);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
}

uint64_t RefreshableSharedContext._fetchContext(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  RefreshableSharedContext.stateOrBail()((uint64_t)v7);
  v4 = v8;
  v5 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, v4, v5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

uint64_t RefreshableSharedContext.deinit()
{
  uint64_t v0;

  outlined destroy of SharedContextService?(v0 + 16);
  return v0;
}

uint64_t RefreshableSharedContext.__deallocating_deinit()
{
  uint64_t v0;

  outlined destroy of SharedContextService?(v0 + 16);
  return swift_deallocClassInstance();
}

double RefreshableSharedContext.init()()
{
  uint64_t v0;
  double result;

  *(_QWORD *)(v0 + 48) = 0;
  result = 0.0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  return result;
}

uint64_t type metadata accessor for RefreshableSharedContext()
{
  return objc_opt_self();
}

uint64_t outlined init with copy of SharedContextService?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SharedContextService?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined assign with take of SharedContextService?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SharedContextService?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of SharedContextService?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SharedContextService?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t protocol witness for SharedContextService.fetchContext(for:includesNearbyDevices:with:) in conformance RefreshableSharedContext()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 120))();
}

uint64_t protocol witness for SharedContextService._fetchContext(with:) in conformance RefreshableSharedContext()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 128))();
}

uint64_t sub_2132A8A68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 88))();
}

ValueMetadata *type metadata accessor for SharedContext()
{
  return &type metadata for SharedContext;
}

uint64_t dispatch thunk of SharedContextService.fetchContext(for:includesNearbyDevices:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of SharedContextService._fetchContext(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t method lookup function for RefreshableSharedContext()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RefreshableSharedContext.sharedContext.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t dispatch thunk of RefreshableSharedContext.sharedContext.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of RefreshableSharedContext.sharedContext.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of RefreshableSharedContext.fetchContext(for:includesNearbyDevices:with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of RefreshableSharedContext._fetchContext(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of RefreshableSharedContext.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_3_1()
{
  JUMPOUT(0x2199B06A4);
}

uint64_t SiriEnvironment.currentRequest.getter()
{
  type metadata accessor for CurrentRequest();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  return dispatch thunk of SiriEnvironment.subscript.getter();
}

uint64_t type metadata accessor for CurrentRequest()
{
  return objc_opt_self();
}

uint64_t key path setter for SiriEnvironment.currentRequest : SiriEnvironment()
{
  swift_retain();
  return SiriEnvironment.currentRequest.setter();
}

uint64_t SiriEnvironment.currentRequest.setter()
{
  type metadata accessor for CurrentRequest();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  return dispatch thunk of SiriEnvironment.subscript.setter();
}

void SiriEnvironment.currentRequest.modify(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;

  a1[1] = v1;
  a1[2] = type metadata accessor for CurrentRequest();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  a1[3] = v3;
  *a1 = dispatch thunk of SiriEnvironment.subscript.getter();
  OUTLINED_FUNCTION_1();
}

void SiriEnvironment.currentRequest.modify(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
  {
    swift_retain();
    OUTLINED_FUNCTION_235();
    swift_release();
  }
  else
  {
    OUTLINED_FUNCTION_235();
    OUTLINED_FUNCTION_1();
  }
}

SiriFlowEnvironment::RequestPositionInSession_optional __swiftcall RequestPositionInSession.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 3;
  if ((unint64_t)rawValue < 3)
    v2 = rawValue;
  *v1 = v2;
  return (SiriFlowEnvironment::RequestPositionInSession_optional)rawValue;
}

uint64_t RequestPositionInSession.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance RequestPositionInSession(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

void protocol witness for Hashable.hashValue.getter in conformance RequestPositionInSession()
{
  specialized RawRepresentable<>.hashValue.getter();
}

void protocol witness for Hashable.hash(into:) in conformance RequestPositionInSession(uint64_t a1)
{
  unsigned __int8 *v1;

  specialized RawRepresentable<>.hash(into:)(a1, *v1);
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance RequestPositionInSession()
{
  specialized RawRepresentable<>._rawHashValue(seed:)();
}

SiriFlowEnvironment::RequestPositionInSession_optional protocol witness for RawRepresentable.init(rawValue:) in conformance RequestPositionInSession(Swift::Int *a1)
{
  return RequestPositionInSession.init(rawValue:)(*a1);
}

void protocol witness for RawRepresentable.rawValue.getter in conformance RequestPositionInSession(uint64_t *a1@<X8>)
{
  *a1 = RequestPositionInSession.rawValue.getter();
  OUTLINED_FUNCTION_8();
}

uint64_t protocol witness for Decodable.init(from:) in conformance RequestPositionInSession()
{
  lazy protocol witness table accessor for type RequestPositionInSession and conformance RequestPositionInSession();
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance RequestPositionInSession()
{
  lazy protocol witness table accessor for type RequestPositionInSession and conformance RequestPositionInSession();
  return RawRepresentable<>.encode(to:)();
}

uint64_t CurrentRequest.mock.getter()
{
  OUTLINED_FUNCTION_4_1();
  return swift_retain();
}

void CurrentRequest.mock.setter(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_4_1();
  *(_QWORD *)(v1 + 16) = a1;
  swift_release();
  OUTLINED_FUNCTION_2_1();
}

uint64_t (*CurrentRequest.mock.modify())()
{
  OUTLINED_FUNCTION_1_2();
  return CurrentRequest.mock.modify;
}

void CurrentRequest.refId.getter()
{
  CurrentRequest.refId.getter();
}

{
  OUTLINED_FUNCTION_228();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  OUTLINED_FUNCTION_143();
  OUTLINED_FUNCTION_94();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_113();
  OUTLINED_FUNCTION_149();
  OUTLINED_FUNCTION_236();
  OUTLINED_FUNCTION_171();
}

void key path getter for CurrentRequest.refId : CurrentRequest(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  CurrentRequest.refId.getter();
  *a1 = v2;
  a1[1] = v3;
}

void sub_2132A8EA8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_77();
  CurrentRequest.refId.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.refId : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))CurrentRequest.refId.setter);
}

void CurrentRequest.refId.setter()
{
  CurrentRequest.refId.setter();
}

{
  OUTLINED_FUNCTION_227();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  OUTLINED_FUNCTION_143();
  OUTLINED_FUNCTION_94();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_22();
  static MockablePublished.subscript.setter();
  OUTLINED_FUNCTION_61();
}

void CurrentRequest.refId.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$refId.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$refId.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$refId.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$refId.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$refId.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$refId.setter);
}

void CurrentRequest.aceId.getter()
{
  CurrentRequest.refId.getter();
}

void key path getter for CurrentRequest.aceId : CurrentRequest(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  CurrentRequest.aceId.getter();
  *a1 = v2;
  a1[1] = v3;
}

void sub_2132A9110()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_77();
  CurrentRequest.aceId.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.aceId : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))CurrentRequest.aceId.setter);
}

void CurrentRequest.aceId.setter()
{
  CurrentRequest.refId.setter();
}

void CurrentRequest.aceId.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$aceId.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$aceId.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$aceId.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$aceId.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$aceId.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$aceId.setter);
}

void CurrentRequest.executionRequestId.getter()
{
  CurrentRequest.refId.getter();
}

void key path getter for CurrentRequest.executionRequestId : CurrentRequest(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  CurrentRequest.executionRequestId.getter();
  *a1 = v2;
  a1[1] = v3;
}

void sub_2132A9394()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_77();
  CurrentRequest.executionRequestId.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.executionRequestId : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))CurrentRequest.executionRequestId.setter);
}

void CurrentRequest.executionRequestId.setter()
{
  CurrentRequest.refId.setter();
}

void CurrentRequest.executionRequestId.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$executionRequestId.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$executionRequestId.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$executionRequestId.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$executionRequestId.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$executionRequestId.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$executionRequestId.setter);
}

void CurrentRequest.sessionHandoffContinuityID.getter()
{
  CurrentRequest.refId.getter();
}

void key path getter for CurrentRequest.sessionHandoffContinuityID : CurrentRequest(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  CurrentRequest.sessionHandoffContinuityID.getter();
  *a1 = v2;
  a1[1] = v3;
}

void sub_2132A9590()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_77();
  CurrentRequest.sessionHandoffContinuityID.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.sessionHandoffContinuityID : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))CurrentRequest.sessionHandoffContinuityID.setter);
}

void CurrentRequest.sessionHandoffContinuityID.setter()
{
  CurrentRequest.refId.setter();
}

void CurrentRequest.sessionHandoffContinuityID.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$sessionHandoffContinuityID.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$sessionHandoffContinuityID.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$sessionHandoffContinuityID.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$sessionHandoffContinuityID.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$sessionHandoffContinuityID.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$sessionHandoffContinuityID.setter);
}

void CurrentRequest.peerName.getter()
{
  CurrentRequest.refId.getter();
}

void key path getter for CurrentRequest.peerName : CurrentRequest(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  CurrentRequest.peerName.getter();
  *a1 = v2;
  a1[1] = v3;
}

void sub_2132A978C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_77();
  CurrentRequest.peerName.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.peerName : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))CurrentRequest.peerName.setter);
}

void CurrentRequest.peerName.setter()
{
  CurrentRequest.refId.setter();
}

void CurrentRequest.peerName.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$peerName.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$peerName.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$peerName.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$peerName.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$peerName.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$peerName.setter);
}

uint64_t CurrentRequest.inputOrigin.getter()
{
  return CurrentRequest.inputOrigin.getter(&demangling cache variable for type metadata for MockablePublished<InputOrigin>);
}

uint64_t key path getter for CurrentRequest.inputOrigin : CurrentRequest()
{
  return CurrentRequest.inputOrigin.getter();
}

void sub_2132A9988()
{
  CurrentRequest.inputOrigin.getter();
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.inputOrigin : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.inputOrigin : CurrentRequest(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BEA8A48]);
}

uint64_t CurrentRequest.inputOrigin.setter()
{
  return CurrentRequest.inputOrigin.setter();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_85();
  v13 = v0;
  v14 = v1;
  v3 = v2;
  v5 = v4;
  v7 = v6(0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v12 - v9;
  __swift_instantiateConcreteTypeFromMangledName(v3);
  OUTLINED_FUNCTION_257();
  OUTLINED_FUNCTION_143();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v5, v7);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_22();
  static MockablePublished.subscript.setter();
  return OUTLINED_FUNCTION_223(v5, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
}

void CurrentRequest.inputOrigin.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$inputOrigin.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$inputOrigin.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$inputOrigin.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$inputOrigin.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$inputOrigin.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$inputOrigin.setter);
}

uint64_t CurrentRequest.interactionType.getter()
{
  return CurrentRequest.inputOrigin.getter(&demangling cache variable for type metadata for MockablePublished<InteractionType>);
}

uint64_t CurrentRequest.inputOrigin.getter(uint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_143();
  OUTLINED_FUNCTION_94();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  static MockablePublished.subscript.getter();
  OUTLINED_FUNCTION_149();
  return OUTLINED_FUNCTION_62();
}

uint64_t key path getter for CurrentRequest.interactionType : CurrentRequest()
{
  return CurrentRequest.interactionType.getter();
}

void sub_2132A9C0C()
{
  CurrentRequest.interactionType.getter();
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.interactionType : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.inputOrigin : CurrentRequest(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BEA8C48]);
}

uint64_t CurrentRequest.interactionType.setter()
{
  return CurrentRequest.inputOrigin.setter();
}

void CurrentRequest.interactionType.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$interactionType.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$interactionType.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$interactionType.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$interactionType.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$interactionType.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$interactionType.setter);
}

void CurrentRequest.interactionId.getter()
{
  CurrentRequest.refId.getter();
}

void key path getter for CurrentRequest.interactionId : CurrentRequest(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  CurrentRequest.interactionId.getter();
  *a1 = v2;
  a1[1] = v3;
}

void sub_2132A9F04()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_77();
  CurrentRequest.interactionId.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.interactionId : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))CurrentRequest.interactionId.setter);
}

void CurrentRequest.interactionId.setter()
{
  CurrentRequest.refId.setter();
}

void CurrentRequest.interactionId.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$interactionId.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$interactionId.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$interactionId.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$interactionId.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$interactionId.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$interactionId.setter);
}

uint64_t CurrentRequest.audioSource.getter()
{
  return CurrentRequest.inputOrigin.getter(&demangling cache variable for type metadata for MockablePublished<AudioSource?>);
}

uint64_t key path getter for CurrentRequest.audioSource : CurrentRequest()
{
  return CurrentRequest.audioSource.getter();
}

void sub_2132AA100()
{
  CurrentRequest.audioSource.getter();
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.audioSource : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.audioSource : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for AudioSource?, (void (*)(char *))CurrentRequest.audioSource.setter);
}

void CurrentRequest.audioSource.setter(uint64_t a1)
{
  CurrentRequest.audioSource.setter(a1, (uint64_t)&demangling cache variable for type metadata for AudioSource?, &demangling cache variable for type metadata for MockablePublished<AudioSource?>);
}

void CurrentRequest.audioSource.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$audioSource.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$audioSource.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$audioSource.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$audioSource.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$audioSource.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$audioSource.setter);
}

uint64_t CurrentRequest.audioDestination.getter()
{
  return CurrentRequest.inputOrigin.getter(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
}

uint64_t key path getter for CurrentRequest.audioDestination : CurrentRequest()
{
  return CurrentRequest.audioDestination.getter();
}

void sub_2132AA310()
{
  CurrentRequest.audioDestination.getter();
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.audioDestination : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.audioSource : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for AudioDestination?, (void (*)(char *))CurrentRequest.audioDestination.setter);
}

void CurrentRequest.audioDestination.setter(uint64_t a1)
{
  CurrentRequest.audioSource.setter(a1, (uint64_t)&demangling cache variable for type metadata for AudioDestination?, &demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
}

void CurrentRequest.audioSource.setter(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  OUTLINED_FUNCTION_228();
  OUTLINED_FUNCTION_242(v6, v7);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a3);
  swift_getKeyPath();
  OUTLINED_FUNCTION_257();
  outlined init with copy of AudioDestination?(v4, (uint64_t)v10, v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_22();
  static MockablePublished.subscript.setter();
  outlined destroy of AudioSource?(v4, v3);
}

void CurrentRequest.audioDestination.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$audioDestination.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$audioDestination.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$audioDestination.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$audioDestination.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$audioDestination.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$audioDestination.setter);
}

uint64_t CurrentRequest.responseMode.getter()
{
  return CurrentRequest.inputOrigin.getter(&demangling cache variable for type metadata for MockablePublished<ResponseMode>);
}

uint64_t key path getter for CurrentRequest.responseMode : CurrentRequest()
{
  return CurrentRequest.responseMode.getter();
}

void sub_2132AA5FC()
{
  CurrentRequest.responseMode.getter();
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.responseMode : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.inputOrigin : CurrentRequest(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BEA8AE8]);
}

uint64_t CurrentRequest.responseMode.setter()
{
  return CurrentRequest.inputOrigin.setter();
}

void CurrentRequest.responseMode.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$responseMode.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$responseMode.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$responseMode.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$responseMode.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$responseMode.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$responseMode.setter);
}

uint64_t CurrentRequest.multiUserState.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  swift_getKeyPath();
  swift_getKeyPath();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_55();
  return OUTLINED_FUNCTION_62();
}

uint64_t key path getter for CurrentRequest.multiUserState : CurrentRequest()
{
  return CurrentRequest.multiUserState.getter();
}

void sub_2132AA860()
{
  CurrentRequest.multiUserState.getter();
  OUTLINED_FUNCTION_8();
}

uint64_t key path setter for CurrentRequest.multiUserState : CurrentRequest(uint64_t a1)
{
  _BYTE v2[64];

  outlined init with copy of MultiUserState(a1, (uint64_t)v2);
  return CurrentRequest.multiUserState.setter((uint64_t)v2);
}

uint64_t CurrentRequest.multiUserState.setter(uint64_t a1)
{
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  swift_getKeyPath();
  swift_getKeyPath();
  outlined init with copy of MultiUserState(a1, (uint64_t)&v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_192();
  return outlined destroy of MultiUserState(a1);
}

void CurrentRequest.multiUserState.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$multiUserState.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$multiUserState.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$multiUserState.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$multiUserState.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$multiUserState.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$multiUserState.setter);
}

uint64_t CurrentRequest.bargeInContext.getter()
{
  return CurrentRequest.inputOrigin.getter(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
}

uint64_t key path getter for CurrentRequest.bargeInContext : CurrentRequest()
{
  return CurrentRequest.bargeInContext.getter();
}

void sub_2132AAB0C()
{
  CurrentRequest.bargeInContext.getter();
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.bargeInContext : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.audioSource : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for BargeInContext?, (void (*)(char *))CurrentRequest.bargeInContext.setter);
}

void CurrentRequest.bargeInContext.setter(uint64_t a1)
{
  CurrentRequest.audioSource.setter(a1, (uint64_t)&demangling cache variable for type metadata for BargeInContext?, &demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
}

void CurrentRequest.bargeInContext.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$bargeInContext.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$bargeInContext.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$bargeInContext.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$bargeInContext.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$bargeInContext.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$bargeInContext.setter);
}

uint64_t CurrentRequest.sharedContextService.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  swift_getKeyPath();
  swift_getKeyPath();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_55();
  return OUTLINED_FUNCTION_62();
}

uint64_t key path getter for CurrentRequest.sharedContextService : CurrentRequest()
{
  return CurrentRequest.sharedContextService.getter();
}

void sub_2132AAD70()
{
  CurrentRequest.sharedContextService.getter();
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.sharedContextService : CurrentRequest(uint64_t a1)
{
  _BYTE v1[40];

  outlined init with copy of AudioDestination?(a1, (uint64_t)v1, &demangling cache variable for type metadata for SharedContextService?);
  CurrentRequest.sharedContextService.setter((uint64_t)v1);
}

void CurrentRequest.sharedContextService.setter(uint64_t a1)
{
  _BYTE v2[40];

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  swift_getKeyPath();
  swift_getKeyPath();
  OUTLINED_FUNCTION_84(a1, (uint64_t)v2);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_22();
  static MockablePublished.subscript.setter();
  OUTLINED_FUNCTION_108(a1);
}

void CurrentRequest.sharedContextService.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$sharedContextService.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$sharedContextService.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$sharedContextService.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$sharedContextService.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$sharedContextService.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$sharedContextService.setter);
}

uint64_t CurrentRequest.originatingHome.getter()
{
  return CurrentRequest.inputOrigin.getter(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
}

uint64_t key path getter for CurrentRequest.originatingHome : CurrentRequest()
{
  return CurrentRequest.originatingHome.getter();
}

void sub_2132AB048()
{
  CurrentRequest.originatingHome.getter();
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.originatingHome : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.audioSource : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for HomeInfo?, (void (*)(char *))CurrentRequest.originatingHome.setter);
}

void CurrentRequest.originatingHome.setter(uint64_t a1)
{
  CurrentRequest.audioSource.setter(a1, (uint64_t)&demangling cache variable for type metadata for HomeInfo?, &demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
}

void CurrentRequest.originatingHome.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$originatingHome.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$originatingHome.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$originatingHome.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$originatingHome.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$originatingHome.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$originatingHome.setter);
}

uint64_t CurrentRequest.speechPackage.getter()
{
  return CurrentRequest.speechPackage.getter(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>);
}

uint64_t key path getter for CurrentRequest.speechPackage : CurrentRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CurrentRequest.speechPackage.getter();
  *a1 = result;
  return result;
}

void sub_2132AB260()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_77();
  *v0 = CurrentRequest.speechPackage.getter();
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.speechPackage : CurrentRequest(id *a1)
{
  id v1;

  v1 = *a1;
  CurrentRequest.speechPackage.setter();
}

void CurrentRequest.speechPackage.setter()
{
  CurrentRequest.speechPackage.setter();
}

{
  uint64_t v0;
  uint64_t *v1;

  OUTLINED_FUNCTION_227();
  OUTLINED_FUNCTION_242(v0, v1);
  OUTLINED_FUNCTION_143();
  OUTLINED_FUNCTION_94();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_132();
  OUTLINED_FUNCTION_61();
}

void CurrentRequest.speechPackage.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$speechPackage.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$speechPackage.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$speechPackage.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$speechPackage.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$speechPackage.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$speechPackage.setter);
}

void CurrentRequest.resultCandidateId.getter()
{
  CurrentRequest.refId.getter();
}

void key path getter for CurrentRequest.resultCandidateId : CurrentRequest(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  CurrentRequest.resultCandidateId.getter();
  *a1 = v2;
  a1[1] = v3;
}

void sub_2132AB484()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_77();
  CurrentRequest.resultCandidateId.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.resultCandidateId : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))CurrentRequest.resultCandidateId.setter);
}

void CurrentRequest.resultCandidateId.setter()
{
  CurrentRequest.refId.setter();
}

void CurrentRequest.resultCandidateId.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$resultCandidateId.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$resultCandidateId.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$resultCandidateId.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$resultCandidateId.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$resultCandidateId.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$resultCandidateId.setter);
}

void CurrentRequest.asrOnDevice.getter()
{
  CurrentRequest.asrOnDevice.getter();
}

{
  OUTLINED_FUNCTION_228();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  OUTLINED_FUNCTION_143();
  OUTLINED_FUNCTION_94();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_113();
  OUTLINED_FUNCTION_149();
  OUTLINED_FUNCTION_236();
  OUTLINED_FUNCTION_171();
}

void key path getter for CurrentRequest.asrOnDevice : CurrentRequest(_BYTE *a1@<X8>)
{
  char v2;

  CurrentRequest.asrOnDevice.getter();
  *a1 = v2;
}

void sub_2132AB680()
{
  _BYTE *v0;
  char v1;

  OUTLINED_FUNCTION_77();
  CurrentRequest.asrOnDevice.getter();
  *v0 = v1;
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.asrOnDevice : CurrentRequest()
{
  CurrentRequest.asrOnDevice.setter();
}

void sub_2132AB6C4()
{
  CurrentRequest.asrOnDevice.setter();
  OUTLINED_FUNCTION_8();
}

void CurrentRequest.asrOnDevice.setter()
{
  CurrentRequest.asrOnDevice.setter();
}

{
  OUTLINED_FUNCTION_227();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  OUTLINED_FUNCTION_143();
  OUTLINED_FUNCTION_94();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_132();
  OUTLINED_FUNCTION_61();
}

void CurrentRequest.asrOnDevice.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$asrOnDevice.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$asrOnDevice.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$asrOnDevice.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$asrOnDevice.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$asrOnDevice.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$asrOnDevice.setter);
}

void CurrentRequest.currentDeviceAssistantId.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  swift_getKeyPath();
  swift_getKeyPath();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_216();
  OUTLINED_FUNCTION_149();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_171();
}

void key path getter for CurrentRequest.currentDeviceAssistantId : CurrentRequest(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  CurrentRequest.currentDeviceAssistantId.getter();
  *a1 = v2;
  a1[1] = v3;
}

void sub_2132AB914()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_77();
  CurrentRequest.currentDeviceAssistantId.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.currentDeviceAssistantId : CurrentRequest()
{
  swift_bridgeObjectRetain();
  CurrentRequest.currentDeviceAssistantId.setter();
}

void CurrentRequest.currentDeviceAssistantId.setter()
{
  OUTLINED_FUNCTION_227();
  OUTLINED_FUNCTION_228();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  swift_getKeyPath();
  swift_getKeyPath();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_22();
  static MockablePublished.subscript.setter();
  OUTLINED_FUNCTION_61();
}

void CurrentRequest.currentDeviceAssistantId.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$currentDeviceAssistantId.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$currentDeviceAssistantId.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$currentDeviceAssistantId.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$currentDeviceAssistantId.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$currentDeviceAssistantId.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$currentDeviceAssistantId.setter);
}

uint64_t CurrentRequest.voiceTriggerEventInfo.getter()
{
  return CurrentRequest.speechPackage.getter(&demangling cache variable for type metadata for MockablePublished<[String : String]?>);
}

uint64_t CurrentRequest.speechPackage.getter(uint64_t *a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_143();
  OUTLINED_FUNCTION_94();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_113();
  OUTLINED_FUNCTION_149();
  OUTLINED_FUNCTION_236();
  return v2;
}

uint64_t key path getter for CurrentRequest.voiceTriggerEventInfo : CurrentRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CurrentRequest.voiceTriggerEventInfo.getter();
  *a1 = result;
  return result;
}

void sub_2132ABC30()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_77();
  *v0 = CurrentRequest.voiceTriggerEventInfo.getter();
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.voiceTriggerEventInfo : CurrentRequest()
{
  swift_bridgeObjectRetain();
  CurrentRequest.voiceTriggerEventInfo.setter();
}

void CurrentRequest.voiceTriggerEventInfo.setter()
{
  CurrentRequest.speechPackage.setter();
}

void CurrentRequest.voiceTriggerEventInfo.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$voiceTriggerEventInfo.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$voiceTriggerEventInfo.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$voiceTriggerEventInfo.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$voiceTriggerEventInfo.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$voiceTriggerEventInfo.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$voiceTriggerEventInfo.setter);
}

uint64_t CurrentRequest.asrExecutionLocation.getter()
{
  return CurrentRequest.inputOrigin.getter(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
}

uint64_t key path getter for CurrentRequest.asrExecutionLocation : CurrentRequest()
{
  return CurrentRequest.asrExecutionLocation.getter();
}

void sub_2132ABEB4()
{
  CurrentRequest.asrExecutionLocation.getter();
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.asrExecutionLocation : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.inputOrigin : CurrentRequest(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BEA8CE0]);
}

uint64_t CurrentRequest.asrExecutionLocation.setter()
{
  return CurrentRequest.inputOrigin.setter();
}

void CurrentRequest.asrExecutionLocation.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$asrExecutionLocation.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$asrExecutionLocation.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$asrExecutionLocation.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$asrExecutionLocation.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$asrExecutionLocation.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$asrExecutionLocation.setter);
}

uint64_t CurrentRequest.nlExecutionLocation.getter()
{
  return CurrentRequest.inputOrigin.getter(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
}

uint64_t key path getter for CurrentRequest.nlExecutionLocation : CurrentRequest()
{
  return CurrentRequest.nlExecutionLocation.getter();
}

void sub_2132AC0C4()
{
  CurrentRequest.nlExecutionLocation.getter();
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.nlExecutionLocation : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.inputOrigin : CurrentRequest(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BEA8CE0]);
}

void key path setter for CurrentRequest.inputOrigin : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v6;

  v5 = a5(0);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_255(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 16));
  OUTLINED_FUNCTION_239();
  OUTLINED_FUNCTION_1();
}

uint64_t CurrentRequest.nlExecutionLocation.setter()
{
  return CurrentRequest.inputOrigin.setter();
}

void CurrentRequest.nlExecutionLocation.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$nlExecutionLocation.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$nlExecutionLocation.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$nlExecutionLocation.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$nlExecutionLocation.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$nlExecutionLocation.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$nlExecutionLocation.setter);
}

void CurrentRequest.companionName.getter()
{
  CurrentRequest.refId.getter();
}

void key path getter for CurrentRequest.companionName : CurrentRequest(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  CurrentRequest.companionName.getter();
  *a1 = v2;
  a1[1] = v3;
}

void sub_2132AC33C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_77();
  CurrentRequest.companionName.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.companionName : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))CurrentRequest.companionName.setter);
}

void CurrentRequest.companionName.setter()
{
  CurrentRequest.refId.setter();
}

void CurrentRequest.companionName.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$companionName.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$companionName.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$companionName.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$companionName.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$companionName.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$companionName.setter);
}

void CurrentRequest.isRecognizeMyVoiceEnabled.getter()
{
  CurrentRequest.asrOnDevice.getter();
}

void key path getter for CurrentRequest.isRecognizeMyVoiceEnabled : CurrentRequest(_BYTE *a1@<X8>)
{
  char v2;

  CurrentRequest.isRecognizeMyVoiceEnabled.getter();
  *a1 = v2;
}

void sub_2132AC5A0()
{
  _BYTE *v0;
  char v1;

  OUTLINED_FUNCTION_77();
  CurrentRequest.isRecognizeMyVoiceEnabled.getter();
  *v0 = v1;
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.isRecognizeMyVoiceEnabled : CurrentRequest()
{
  CurrentRequest.isRecognizeMyVoiceEnabled.setter();
}

void sub_2132AC5E4()
{
  CurrentRequest.isRecognizeMyVoiceEnabled.setter();
  OUTLINED_FUNCTION_8();
}

void CurrentRequest.isRecognizeMyVoiceEnabled.setter()
{
  CurrentRequest.asrOnDevice.setter();
}

void CurrentRequest.isRecognizeMyVoiceEnabled.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$isRecognizeMyVoiceEnabled.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$isRecognizeMyVoiceEnabled.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$isRecognizeMyVoiceEnabled.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$isRecognizeMyVoiceEnabled.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$isRecognizeMyVoiceEnabled.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$isRecognizeMyVoiceEnabled.setter);
}

uint64_t CurrentRequest.flowTaskMetadata.getter()
{
  return CurrentRequest.inputOrigin.getter(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
}

uint64_t key path getter for CurrentRequest.flowTaskMetadata : CurrentRequest()
{
  return CurrentRequest.flowTaskMetadata.getter();
}

void sub_2132AC83C()
{
  CurrentRequest.flowTaskMetadata.getter();
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.flowTaskMetadata : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.audioSource : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for FlowTaskMetadata?, (void (*)(char *))CurrentRequest.flowTaskMetadata.setter);
}

void key path setter for CurrentRequest.audioSource : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, void (*a6)(char *))
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(a5);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_100(a1, (uint64_t)v10);
  a6(v10);
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.flowTaskMetadata.setter(uint64_t a1)
{
  CurrentRequest.audioSource.setter(a1, (uint64_t)&demangling cache variable for type metadata for FlowTaskMetadata?, &demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
}

void CurrentRequest.flowTaskMetadata.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$flowTaskMetadata.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$flowTaskMetadata.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$flowTaskMetadata.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$flowTaskMetadata.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$flowTaskMetadata.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$flowTaskMetadata.setter);
}

void CurrentRequest.voiceAudioSessionId.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  swift_getKeyPath();
  swift_getKeyPath();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_216();
  OUTLINED_FUNCTION_149();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_171();
}

void key path getter for CurrentRequest.voiceAudioSessionId : CurrentRequest(_DWORD *a1@<X8>)
{
  int v2;

  CurrentRequest.voiceAudioSessionId.getter();
  *a1 = v2;
}

void sub_2132ACB24()
{
  _DWORD *v0;
  int v1;

  OUTLINED_FUNCTION_77();
  CurrentRequest.voiceAudioSessionId.getter();
  *v0 = v1;
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.voiceAudioSessionId : CurrentRequest()
{
  CurrentRequest.voiceAudioSessionId.setter();
}

void sub_2132ACB68()
{
  CurrentRequest.voiceAudioSessionId.setter();
  OUTLINED_FUNCTION_8();
}

void CurrentRequest.voiceAudioSessionId.setter()
{
  OUTLINED_FUNCTION_227();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  swift_getKeyPath();
  swift_getKeyPath();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_22();
  static MockablePublished.subscript.setter();
  OUTLINED_FUNCTION_61();
}

void CurrentRequest.voiceAudioSessionId.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$voiceAudioSessionId.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$voiceAudioSessionId.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$voiceAudioSessionId.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$voiceAudioSessionId.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$voiceAudioSessionId.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$voiceAudioSessionId.setter);
}

void CurrentRequest.utterance.getter()
{
  CurrentRequest.refId.getter();
}

void key path getter for CurrentRequest.utterance : CurrentRequest(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  CurrentRequest.utterance.getter();
  *a1 = v2;
  a1[1] = v3;
}

void sub_2132ACDCC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_77();
  CurrentRequest.utterance.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.utterance : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))CurrentRequest.utterance.setter);
}

void CurrentRequest.utterance.setter()
{
  CurrentRequest.refId.setter();
}

void CurrentRequest.utterance.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$utterance.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$utterance.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$utterance.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$utterance.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$utterance.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$utterance.setter);
}

void CurrentRequest.isSystemApertureEnabled.getter()
{
  CurrentRequest.isSystemApertureEnabled.getter();
}

{
  OUTLINED_FUNCTION_228();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  OUTLINED_FUNCTION_143();
  OUTLINED_FUNCTION_94();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_113();
  OUTLINED_FUNCTION_149();
  OUTLINED_FUNCTION_236();
  OUTLINED_FUNCTION_171();
}

void key path getter for CurrentRequest.isSystemApertureEnabled : CurrentRequest(_BYTE *a1@<X8>)
{
  char v2;

  CurrentRequest.isSystemApertureEnabled.getter();
  *a1 = v2 & 1;
}

void sub_2132ACFCC()
{
  _BYTE *v0;
  char v1;

  OUTLINED_FUNCTION_77();
  CurrentRequest.isSystemApertureEnabled.getter();
  *v0 = v1 & 1;
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.isSystemApertureEnabled : CurrentRequest()
{
  CurrentRequest.isSystemApertureEnabled.setter();
}

void sub_2132AD014()
{
  CurrentRequest.isSystemApertureEnabled.setter();
  OUTLINED_FUNCTION_8();
}

void CurrentRequest.isSystemApertureEnabled.setter()
{
  CurrentRequest.isSystemApertureEnabled.setter();
}

{
  OUTLINED_FUNCTION_227();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  OUTLINED_FUNCTION_143();
  OUTLINED_FUNCTION_94();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_132();
  OUTLINED_FUNCTION_61();
}

void CurrentRequest.isSystemApertureEnabled.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$isSystemApertureEnabled.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$isSystemApertureEnabled.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$isSystemApertureEnabled.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$isSystemApertureEnabled.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$isSystemApertureEnabled.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$isSystemApertureEnabled.setter);
}

void CurrentRequest.isLiveActivitiesSupported.getter()
{
  CurrentRequest.isSystemApertureEnabled.getter();
}

void key path getter for CurrentRequest.isLiveActivitiesSupported : CurrentRequest(_BYTE *a1@<X8>)
{
  char v2;

  CurrentRequest.isLiveActivitiesSupported.getter();
  *a1 = v2 & 1;
}

void sub_2132AD26C()
{
  _BYTE *v0;
  char v1;

  OUTLINED_FUNCTION_77();
  CurrentRequest.isLiveActivitiesSupported.getter();
  *v0 = v1 & 1;
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.isLiveActivitiesSupported : CurrentRequest()
{
  CurrentRequest.isLiveActivitiesSupported.setter();
}

void sub_2132AD2B4()
{
  CurrentRequest.isLiveActivitiesSupported.setter();
  OUTLINED_FUNCTION_8();
}

void CurrentRequest.isLiveActivitiesSupported.setter()
{
  CurrentRequest.isSystemApertureEnabled.setter();
}

void CurrentRequest.isLiveActivitiesSupported.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$isLiveActivitiesSupported.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$isLiveActivitiesSupported.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$isLiveActivitiesSupported.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$isLiveActivitiesSupported.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$isLiveActivitiesSupported.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$isLiveActivitiesSupported.setter);
}

void CurrentRequest.isInAmbient.getter()
{
  CurrentRequest.isSystemApertureEnabled.getter();
}

void key path getter for CurrentRequest.isInAmbient : CurrentRequest(_BYTE *a1@<X8>)
{
  char v2;

  CurrentRequest.isInAmbient.getter();
  *a1 = v2 & 1;
}

void sub_2132AD510()
{
  _BYTE *v0;
  char v1;

  OUTLINED_FUNCTION_77();
  CurrentRequest.isInAmbient.getter();
  *v0 = v1 & 1;
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.isInAmbient : CurrentRequest()
{
  CurrentRequest.isInAmbient.setter();
}

void sub_2132AD558()
{
  CurrentRequest.isInAmbient.setter();
  OUTLINED_FUNCTION_8();
}

void CurrentRequest.isInAmbient.setter()
{
  CurrentRequest.isSystemApertureEnabled.setter();
}

void CurrentRequest.isInAmbient.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$isInAmbient.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$isInAmbient.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$isInAmbient.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$isInAmbient.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$isInAmbient.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$isInAmbient.setter);
}

uint64_t CurrentRequest.positionInSession.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  swift_getKeyPath();
  swift_getKeyPath();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_55();
  return OUTLINED_FUNCTION_62();
}

uint64_t key path getter for CurrentRequest.positionInSession : CurrentRequest@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  result = CurrentRequest.positionInSession.getter();
  *a1 = v3;
  return result;
}

void key path setter for CurrentRequest.positionInSession : CurrentRequest()
{
  CurrentRequest.positionInSession.setter();
}

void CurrentRequest.positionInSession.setter()
{
  OUTLINED_FUNCTION_227();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  swift_getKeyPath();
  swift_getKeyPath();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_22();
  static MockablePublished.subscript.setter();
  OUTLINED_FUNCTION_61();
}

void CurrentRequest.positionInSession.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$positionInSession.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$positionInSession.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$positionInSession.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$positionInSession.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$positionInSession.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$positionInSession.setter);
}

void CurrentRequest.responseLanguageVariant.getter()
{
  CurrentRequest.refId.getter();
}

void key path getter for CurrentRequest.responseLanguageVariant : CurrentRequest(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  CurrentRequest.responseLanguageVariant.getter();
  *a1 = v2;
  a1[1] = v3;
}

void sub_2132ADA30()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_77();
  CurrentRequest.responseLanguageVariant.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.responseLanguageVariant : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))CurrentRequest.responseLanguageVariant.setter);
}

void CurrentRequest.responseLanguageVariant.setter()
{
  CurrentRequest.refId.setter();
}

void CurrentRequest.responseLanguageVariant.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$responseLanguageVariant.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$responseLanguageVariant.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$responseLanguageVariant.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$responseLanguageVariant.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$responseLanguageVariant.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$responseLanguageVariant.setter);
}

uint64_t CurrentRequest.locationProvider.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  swift_getKeyPath();
  swift_getKeyPath();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_55();
  return OUTLINED_FUNCTION_62();
}

uint64_t key path getter for CurrentRequest.locationProvider : CurrentRequest()
{
  return CurrentRequest.locationProvider.getter();
}

void sub_2132ADC80()
{
  CurrentRequest.locationProvider.getter();
  OUTLINED_FUNCTION_8();
}

uint64_t key path setter for CurrentRequest.locationProvider : CurrentRequest(uint64_t a1)
{
  _BYTE v2[40];

  outlined init with copy of SiriLocationProvider(a1, (uint64_t)v2);
  return CurrentRequest.locationProvider.setter((uint64_t)v2);
}

uint64_t CurrentRequest.locationProvider.setter(uint64_t a1)
{
  _BYTE v3[40];

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  swift_getKeyPath();
  swift_getKeyPath();
  outlined init with copy of SiriLocationProvider(a1, (uint64_t)v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_192();
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t outlined init with copy of SiriLocationProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void CurrentRequest.locationProvider.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$locationProvider.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$locationProvider.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$locationProvider.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$locationProvider.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$locationProvider.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$locationProvider.setter);
}

void CurrentRequest.requestLanguageVariant.getter()
{
  CurrentRequest.refId.getter();
}

void key path getter for CurrentRequest.requestLanguageVariant : CurrentRequest(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  CurrentRequest.requestLanguageVariant.getter();
  *a1 = v2;
  a1[1] = v3;
}

void sub_2132ADF70()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_77();
  CurrentRequest.requestLanguageVariant.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.requestLanguageVariant : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))CurrentRequest.requestLanguageVariant.setter);
}

void CurrentRequest.requestLanguageVariant.setter()
{
  CurrentRequest.refId.setter();
}

void CurrentRequest.requestLanguageVariant.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$requestLanguageVariant.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void CurrentRequest.$requestLanguageVariant.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$requestLanguageVariant.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$requestLanguageVariant.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$requestLanguageVariant.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$requestLanguageVariant.setter);
}

void CurrentRequest.rootRequestId.getter()
{
  CurrentRequest.refId.getter();
}

void key path getter for CurrentRequest.rootRequestId : CurrentRequest(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  CurrentRequest.rootRequestId.getter();
  *a1 = v2;
  a1[1] = v3;
}

void sub_2132AE16C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_77();
  CurrentRequest.rootRequestId.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_8();
}

void key path setter for CurrentRequest.rootRequestId : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))CurrentRequest.rootRequestId.setter);
}

void key path setter for CurrentRequest.refId : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;

  v7 = *a1;
  v6 = a1[1];
  OUTLINED_FUNCTION_36();
  a5(v7, v6);
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.rootRequestId.setter()
{
  CurrentRequest.refId.setter();
}

void CurrentRequest.rootRequestId.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_54((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_52(KeyPath);
  v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.refId.modify(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_149();
  free(v1);
}

void CurrentRequest.$rootRequestId.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

void key path setter for CurrentRequest.$refId : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v6;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a5);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_255(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 16));
  OUTLINED_FUNCTION_239();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$rootRequestId.setter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15();
}

void CurrentRequest.$rootRequestId.modify()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_10_0(v2);
  v3 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_31((uint64_t)v3);
  CurrentRequest.$rootRequestId.getter();
  OUTLINED_FUNCTION_1();
}

void CurrentRequest.$rootRequestId.modify(uint64_t a1, char a2)
{
  CurrentRequest.$refId.modify(a1, a2, (void (*)(void *))CurrentRequest.$rootRequestId.setter);
}

void CurrentRequest.$refId.modify(uint64_t a1, char a2, void (*a3)(void *))
{
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = *(_QWORD **)a1;
  v5 = *(void **)(*(_QWORD *)a1 + 24);
  v6 = *(void **)(*(_QWORD *)a1 + 32);
  if ((a2 & 1) != 0)
  {
    v7 = v4[2];
    (*(void (**)(_QWORD, void *, _QWORD))(v7 + 16))(*(_QWORD *)(*(_QWORD *)a1 + 24), v6, v4[1]);
    a3(v5);
    OUTLINED_FUNCTION_223((uint64_t)v6, *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
  }
  else
  {
    a3(*(void **)(*(_QWORD *)a1 + 32));
  }
  free(v6);
  free(v5);
  free(v4);
}

#error "2132AE4B0: call analysis failed (funcsize=11)"

void CurrentRequest.init(storage:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
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
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t, uint64_t);
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t (*v127)(uint64_t, uint64_t);
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void (*v141)(uint64_t, uint64_t, uint64_t);
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  uint64_t *v148;
  char *v149;
  uint64_t *v150;
  char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  _QWORD *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  _QWORD *v169;
  uint64_t v170;
  uint64_t *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  _QWORD v177[3];
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  unint64_t v181;
  uint64_t v182;
  uint64_t v183;
  _OWORD v184[2];
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;

  OUTLINED_FUNCTION_85();
  a19 = v23;
  a20 = v24;
  v25 = v20;
  v177[1] = v26;
  v27 = OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_73(v27, (uint64_t)&a14);
  v176 = v28;
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_70();
  v32 = OUTLINED_FUNCTION_63(v31);
  OUTLINED_FUNCTION_73(v32, (uint64_t)&a10);
  v172 = v33;
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v35);
  v167 = OUTLINED_FUNCTION_64((uint64_t)&v146 - v36);
  v166 = *(_QWORD *)(v167 - 8);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v38);
  v40 = OUTLINED_FUNCTION_65((uint64_t)&v146 - v39);
  OUTLINED_FUNCTION_73(v40, (uint64_t)v184);
  OUTLINED_FUNCTION_194(v41);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v43);
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_58(v44);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FlowTaskMetadata?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v45);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v46);
  OUTLINED_FUNCTION_58((uint64_t)&v146 - v47);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HomeInfo?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v48);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v49);
  OUTLINED_FUNCTION_140();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v50);
  OUTLINED_FUNCTION_14();
  v179 = v51;
  MEMORY[0x24BDAC7A8](v52);
  OUTLINED_FUNCTION_109();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v53);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v54);
  v56 = (char *)&v146 - v55;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_6();
  v58 = MEMORY[0x24BDAC7A8](v57);
  v60 = (char *)&v146 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v58);
  v62 = (char *)&v146 - v61;
  OUTLINED_FUNCTION_173();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  OUTLINED_FUNCTION_1_3();
  v20[3] = OUTLINED_FUNCTION_5_1();
  v184[0] = 0uLL;
  OUTLINED_FUNCTION_39();
  v20[4] = OUTLINED_FUNCTION_5_1();
  v184[0] = 0uLL;
  OUTLINED_FUNCTION_39();
  v20[5] = OUTLINED_FUNCTION_5_1();
  v184[0] = 0uLL;
  OUTLINED_FUNCTION_39();
  v20[6] = OUTLINED_FUNCTION_5_1();
  v184[0] = 0uLL;
  OUTLINED_FUNCTION_39();
  v20[7] = OUTLINED_FUNCTION_5_1();
  v184[0] = 0uLL;
  OUTLINED_FUNCTION_39();
  v63 = OUTLINED_FUNCTION_5_1();
  v152 = OUTLINED_FUNCTION_260(v63);
  v66 = OUTLINED_FUNCTION_137(v152, v64, v65, v152);
  v147 = v62;
  v151 = v60;
  outlined init with copy of AudioDestination?(v66, (uint64_t)v60, &demangling cache variable for type metadata for AudioSource?);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_43();
  outlined destroy of AudioSource?((uint64_t)v62, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_189();
  v153 = OUTLINED_FUNCTION_91(v67);
  __swift_storeEnumTagSinglePayload((uint64_t)v56, 1, 1, v153);
  v149 = v56;
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_103(v68, v69);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_142((uint64_t)v56);
  OUTLINED_FUNCTION_168();
  v160 = OUTLINED_FUNCTION_106(v70);
  v73 = OUTLINED_FUNCTION_87(v160, v71, v72, v160);
  v156 = v22;
  OUTLINED_FUNCTION_130(v73, v179);
  v161 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_148(v22);
  OUTLINED_FUNCTION_169();
  OUTLINED_FUNCTION_78(v74);
  OUTLINED_FUNCTION_130((uint64_t)v184, (uint64_t)&v180);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  OUTLINED_FUNCTION_1_3();
  v75 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_148((uint64_t)v184);
  v25[16] = v75;
  v76 = type metadata accessor for HomeInfo();
  OUTLINED_FUNCTION_116(v76);
  OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_84(v77, v78);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
  OUTLINED_FUNCTION_1_3();
  v79 = OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_108(v21);
  v25[17] = v79;
  *(_QWORD *)&v184[0] = 0;
  v155 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>);
  OUTLINED_FUNCTION_1_3();
  v80 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_213(v80);
  v154 = v81;
  v184[0] = 0uLL;
  OUTLINED_FUNCTION_39();
  v82 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_232(v82);
  OUTLINED_FUNCTION_207(v83);
  LOBYTE(v184[0]) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  OUTLINED_FUNCTION_1_3();
  v84 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_190(v84);
  OUTLINED_FUNCTION_98(v85);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>);
  OUTLINED_FUNCTION_1_3();
  v25[22] = OUTLINED_FUNCTION_5_1();
  v184[0] = 0uLL;
  OUTLINED_FUNCTION_39();
  v86 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_191(v86);
  OUTLINED_FUNCTION_186(v87);
  LOBYTE(v184[0]) = 2;
  OUTLINED_FUNCTION_50();
  v88 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_214(v88);
  v158 = OUTLINED_FUNCTION_92(v89);
  v90 = v178;
  OUTLINED_FUNCTION_193(v158, v91, v92, v158);
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_130(v93, v94);
  v159 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
  OUTLINED_FUNCTION_1_3();
  v95 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_148(v90);
  v25[27] = v95;
  v157 = v25 + 27;
  v184[0] = 0uLL;
  OUTLINED_FUNCTION_39();
  v96 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_170(v96);
  OUTLINED_FUNCTION_165(v97);
  v169 = v25 + 34;
  v184[0] = 0uLL;
  OUTLINED_FUNCTION_39();
  v98 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_164(v98);
  v168 = v99;
  v184[0] = 0uLL;
  OUTLINED_FUNCTION_39();
  v25[36] = OUTLINED_FUNCTION_5_1();
  v184[0] = 0uLL;
  OUTLINED_FUNCTION_39();
  v25[37] = OUTLINED_FUNCTION_5_1();
  v100 = v163;
  v101 = v162;
  OUTLINED_FUNCTION_249(v162, *MEMORY[0x24BEA8A28], *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v163 + 104));
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_238(v164, v101, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v100 + 16));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>);
  OUTLINED_FUNCTION_1_3();
  v102 = OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_223(v101, *(uint64_t (**)(uint64_t, uint64_t))(v100 + 8));
  v25[8] = v102;
  OUTLINED_FUNCTION_6_0();
  v103 = v166;
  v104 = v165;
  OUTLINED_FUNCTION_249(v165, *MEMORY[0x24BEA8C38], *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v166 + 104));
  OUTLINED_FUNCTION_1_2();
  v105 = OUTLINED_FUNCTION_256();
  OUTLINED_FUNCTION_238(v105, v106, v107);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>);
  OUTLINED_FUNCTION_1_3();
  v108 = OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_223(v104, *(uint64_t (**)(uint64_t, uint64_t))(v103 + 8));
  v25[9] = v108;
  OUTLINED_FUNCTION_6_0();
  v109 = (uint64_t)v147;
  OUTLINED_FUNCTION_217();
  __swift_storeEnumTagSinglePayload(v110, v111, v112, v152);
  v113 = v148;
  OUTLINED_FUNCTION_1_2();
  swift_release();
  OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_84(v114, v115);
  OUTLINED_FUNCTION_9_0();
  v116 = OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_108(v109);
  *v113 = v116;
  OUTLINED_FUNCTION_6_0();
  v117 = (uint64_t)v149;
  OUTLINED_FUNCTION_217();
  OUTLINED_FUNCTION_226(v118, v119, v120, (uint64_t)v177);
  v121 = v150;
  OUTLINED_FUNCTION_1_2();
  swift_release();
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_72(v122, v123);
  OUTLINED_FUNCTION_138();
  v124 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_88(v117);
  *v121 = v124;
  OUTLINED_FUNCTION_6_0();
  v125 = v170;
  static ResponseMode.displayForward.getter();
  OUTLINED_FUNCTION_1_2();
  v126 = v171;
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v172 + 16))(v171, v125, v173);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_222();
  OUTLINED_FUNCTION_34(v125, v127);
  v25[13] = v124;
  OUTLINED_FUNCTION_6_0();
  memset(v184, 0, sizeof(v184));
  v185 = 1;
  v186 = 0;
  v187 = 0;
  v188 = 0;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_104();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_89();
  v25[14] = v124;
  OUTLINED_FUNCTION_68();
  v128 = v156;
  OUTLINED_FUNCTION_217();
  OUTLINED_FUNCTION_226(v129, v130, v131, (uint64_t)&v183);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_243();
  OUTLINED_FUNCTION_90(v128, v179);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_45();
  *v126 = v124;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  v180 = 0;
  OUTLINED_FUNCTION_1_3();
  demangling cache variable for type metadata for BargeInContext? = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  v180 = 0;
  v181 = 0;
  OUTLINED_FUNCTION_39();
  demangling cache variable for type metadata for BargeInContext? = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  LOBYTE(v180) = 2;
  OUTLINED_FUNCTION_50();
  demangling cache variable for type metadata for BargeInContext? = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  v180 = 0;
  v181 = 0xE000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  OUTLINED_FUNCTION_1_3();
  v25[21] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  v180 = 0;
  v181 = 0;
  OUTLINED_FUNCTION_39();
  demangling cache variable for type metadata for BargeInContext? = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  LOBYTE(v180) = 2;
  OUTLINED_FUNCTION_50();
  demangling cache variable for type metadata for BargeInContext? = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  v132 = v178;
  OUTLINED_FUNCTION_217();
  OUTLINED_FUNCTION_226(v133, v134, v135, (uint64_t)&v182);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_243();
  OUTLINED_FUNCTION_248();
  OUTLINED_FUNCTION_90(v136, v137);
  OUTLINED_FUNCTION_1_3();
  v138 = OUTLINED_FUNCTION_156();
  OUTLINED_FUNCTION_59(v132);
  *v126 = v138;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LODWORD(v180) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  OUTLINED_FUNCTION_1_3();
  v25[28] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  v180 = 0;
  v181 = 0;
  OUTLINED_FUNCTION_39();
  demangling cache variable for type metadata for FlowTaskMetadata? = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v180) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  OUTLINED_FUNCTION_1_3();
  v25[30] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v180) = 0;
  OUTLINED_FUNCTION_138();
  v25[31] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v180) = 0;
  OUTLINED_FUNCTION_138();
  v25[32] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v180) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  OUTLINED_FUNCTION_1_3();
  v25[33] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_145();
  v180 = 0;
  v181 = 0;
  OUTLINED_FUNCTION_39();
  v25[34] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_69((uint64_t)&type metadata for DummyLocationProvider);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  OUTLINED_FUNCTION_1_3();
  v139 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_49(v139);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_144();
  v180 = 0;
  v181 = 0;
  OUTLINED_FUNCTION_39();
  v25[36] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  v140 = v174;
  OUTLINED_FUNCTION_225();
  OUTLINED_FUNCTION_1_2();
  v141 = *(void (**)(uint64_t, uint64_t, uint64_t))(v176 + 16);
  v142 = v175;
  v143 = v177[0];
  v141(v175, v140, v177[0]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
  OUTLINED_FUNCTION_1_3();
  v144 = OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_259();
  v25[23] = v144;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_225();
  OUTLINED_FUNCTION_1_2();
  v141(v142, v140, v143);
  OUTLINED_FUNCTION_138();
  v145 = OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_259();
  v25[24] = v145;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_163();
  swift_release();
  OUTLINED_FUNCTION_153();
  OUTLINED_FUNCTION_38();
}

uint64_t CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25)
{
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
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

  v25 = OUTLINED_FUNCTION_71();
  LOBYTE(v43) = a23;
  v26 = OUTLINED_FUNCTION_66();
  CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:)(v26, v27, v28, v29, v30, v31, v32, v33, v35, v36, v37, v38, v39, v40, v41, v42, a17, a18, a19,
    a20,
    a21,
    a22,
    v43,
    a24,
    a25,
    v44,
    a19,
    a20,
    a17,
    a18,
    a15,
    a16,
    a13,
    a14,
    a11,
    a12,
    a9);
  return v25;
}

void CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,unsigned __int8 a35,uint64_t a36,uint64_t a37)
{
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t *v127;
  uint64_t *v128;
  uint64_t v129;
  uint64_t *v130;
  uint64_t *v131;
  uint64_t *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t (*v135)(uint64_t, uint64_t);
  uint64_t v136;
  uint64_t v137;
  _QWORD *v138;
  uint64_t v139;
  uint64_t (*v140)(uint64_t, uint64_t);
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t *v168;
  uint64_t v169;
  void (*v170)(uint64_t);
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t *v179;
  uint64_t *v180;
  uint64_t *v181;
  uint64_t v182;
  char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t *v187;
  uint64_t *v188;
  uint64_t *v189;
  uint64_t v190;
  uint64_t *v191;
  uint64_t *v192;
  uint64_t *v193;
  uint64_t v194;
  uint64_t *v195;
  uint64_t v196;
  uint64_t v197;
  _QWORD *v198;
  uint64_t v199;
  uint64_t *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t *v210;
  uint64_t v211;
  _QWORD *v212;
  uint64_t *v213;
  uint64_t v214;
  uint64_t v215;
  _QWORD *v216;
  uint64_t v217;
  uint64_t *v218;
  uint64_t *v219;
  int v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t (*v223)(uint64_t, uint64_t);
  uint64_t v224;
  id v225;
  uint64_t v226;
  uint64_t v227;
  _QWORD v228[6];
  uint64_t v229;
  uint64_t v230;
  uint64_t *v231;
  uint64_t *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;

  OUTLINED_FUNCTION_85();
  a19 = v41;
  a20 = v42;
  v43 = v37;
  v205 = v44;
  v206 = v45;
  v199 = v46;
  v200 = v47;
  v190 = v48;
  v192 = v49;
  v187 = v50;
  v188 = v51;
  OUTLINED_FUNCTION_194(a37);
  OUTLINED_FUNCTION_165(a36);
  v220 = a35;
  OUTLINED_FUNCTION_178(a34);
  OUTLINED_FUNCTION_201(a33);
  OUTLINED_FUNCTION_177(a32);
  OUTLINED_FUNCTION_157(a31);
  v228[0] = a30;
  v228[1] = a29;
  v228[2] = a28;
  OUTLINED_FUNCTION_197(a27);
  v228[4] = v52;
  OUTLINED_FUNCTION_67(a25);
  OUTLINED_FUNCTION_186(v53);
  v222 = OUTLINED_FUNCTION_135(a22);
  v221 = *(_QWORD *)(v222 - 8);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v54);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v55);
  v57 = OUTLINED_FUNCTION_63((uint64_t)&v179 - v56);
  OUTLINED_FUNCTION_73(v57, (uint64_t)&a11);
  OUTLINED_FUNCTION_250(v58);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v59);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v60);
  OUTLINED_FUNCTION_70();
  v62 = OUTLINED_FUNCTION_64(v61);
  OUTLINED_FUNCTION_73(v62, (uint64_t)&a9);
  OUTLINED_FUNCTION_207(v63);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v64);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v65);
  OUTLINED_FUNCTION_70();
  v67 = OUTLINED_FUNCTION_65(v66);
  OUTLINED_FUNCTION_73(v67, (uint64_t)&a10);
  v203 = v68;
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v69);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v70);
  OUTLINED_FUNCTION_58((uint64_t)&v179 - v71);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FlowTaskMetadata?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v72);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v73);
  OUTLINED_FUNCTION_58((uint64_t)&v179 - v74);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HomeInfo?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v75);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v76);
  OUTLINED_FUNCTION_58((uint64_t)&v179 - v77);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v78);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v79);
  OUTLINED_FUNCTION_109();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v80);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v81);
  v83 = (char *)&v179 - v82;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v84);
  OUTLINED_FUNCTION_141();
  MEMORY[0x24BDAC7A8](v85);
  OUTLINED_FUNCTION_151();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  OUTLINED_FUNCTION_1_3();
  v37[3] = OUTLINED_FUNCTION_5_1();
  v86 = v37 + 3;
  v235 = 0;
  v236 = 0;
  OUTLINED_FUNCTION_2_2();
  v37[4] = OUTLINED_FUNCTION_5_1();
  v87 = v37 + 4;
  v235 = 0;
  v236 = 0;
  OUTLINED_FUNCTION_2_2();
  v88 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_211(v88);
  v179 = v89;
  v235 = 0;
  v236 = 0;
  OUTLINED_FUNCTION_2_2();
  v90 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_210(v90);
  v180 = v91;
  v235 = 0;
  v236 = 0;
  OUTLINED_FUNCTION_2_2();
  v92 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_209(v92);
  v181 = v93;
  v235 = 0;
  v236 = 0;
  OUTLINED_FUNCTION_2_2();
  v94 = OUTLINED_FUNCTION_5_1();
  v95 = OUTLINED_FUNCTION_260(v94);
  v98 = OUTLINED_FUNCTION_86(v95, v96, v97, v95);
  v182 = v38;
  v184 = v39;
  OUTLINED_FUNCTION_123(v98, v39);
  v185 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_146(v38);
  OUTLINED_FUNCTION_189();
  v100 = OUTLINED_FUNCTION_91(v99);
  OUTLINED_FUNCTION_137(v100, v101, v102, v100);
  v183 = v83;
  OUTLINED_FUNCTION_180();
  OUTLINED_FUNCTION_72(v103, v104);
  v186 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_88((uint64_t)v83);
  OUTLINED_FUNCTION_168();
  v106 = OUTLINED_FUNCTION_106(v105);
  OUTLINED_FUNCTION_219(v106);
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_123(v107, v108);
  v194 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_146(v40);
  OUTLINED_FUNCTION_169();
  OUTLINED_FUNCTION_78(v109);
  OUTLINED_FUNCTION_79((uint64_t)&v235, (uint64_t)&v231);
  v196 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_83((uint64_t)&v235);
  OUTLINED_FUNCTION_212();
  v111 = OUTLINED_FUNCTION_107(v110);
  v112 = v224;
  v115 = OUTLINED_FUNCTION_137(v111, v113, v114, v111);
  OUTLINED_FUNCTION_79(v115, (uint64_t)v225);
  v197 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_83(v112);
  OUTLINED_FUNCTION_167();
  OUTLINED_FUNCTION_98(v116);
  v201 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>);
  OUTLINED_FUNCTION_1_3();
  v37[18] = OUTLINED_FUNCTION_5_1();
  v195 = v37 + 18;
  v235 = 0;
  v236 = 0;
  OUTLINED_FUNCTION_2_2();
  v37[19] = OUTLINED_FUNCTION_5_1();
  v198 = v37 + 19;
  LOBYTE(v235) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  OUTLINED_FUNCTION_1_3();
  v37[20] = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_98((uint64_t)(v37 + 20));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>);
  OUTLINED_FUNCTION_1_3();
  v37[22] = OUTLINED_FUNCTION_5_1();
  v235 = 0;
  v236 = 0;
  OUTLINED_FUNCTION_2_2();
  v37[25] = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_199((uint64_t)(v37 + 25));
  LOBYTE(v235) = 2;
  OUTLINED_FUNCTION_48();
  v37[26] = OUTLINED_FUNCTION_5_1();
  v207 = OUTLINED_FUNCTION_92((uint64_t)(v37 + 26));
  v117 = v226;
  OUTLINED_FUNCTION_184(v207, v118, v119, v207);
  OUTLINED_FUNCTION_180();
  OUTLINED_FUNCTION_84(v120, v121);
  v208 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
  OUTLINED_FUNCTION_1_3();
  v122 = OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_108(v117);
  v43[27] = v122;
  v235 = 0;
  v236 = 0;
  OUTLINED_FUNCTION_2_2();
  v123 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_170(v123);
  OUTLINED_FUNCTION_187(v124);
  v216 = v43 + 34;
  v235 = 0;
  v236 = 0;
  OUTLINED_FUNCTION_2_2();
  v125 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_164(v125);
  v211 = v126;
  v235 = 0;
  v236 = 0;
  OUTLINED_FUNCTION_2_2();
  v43[36] = OUTLINED_FUNCTION_5_1();
  v235 = 0;
  v236 = 0;
  OUTLINED_FUNCTION_2_2();
  v43[37] = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_2();
  v127 = v187;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_14_0();
  v231 = v188;
  v232 = v127;
  OUTLINED_FUNCTION_2_2();
  *v86 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v231 = v192;
  v232 = v86;
  OUTLINED_FUNCTION_2_2();
  *v87 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v128 = v179;
  OUTLINED_FUNCTION_1_2();
  v129 = *v128;
  v130 = v128;
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v231 = v200;
  v232 = v128;
  OUTLINED_FUNCTION_2_2();
  *v128 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v131 = v180;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v231 = v206;
  v232 = v131;
  OUTLINED_FUNCTION_2_2();
  *v130 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v132 = v181;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v231 = v213;
  v232 = v132;
  OUTLINED_FUNCTION_2_2();
  *v130 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_139();
  v133 = v202;
  OUTLINED_FUNCTION_42(v202, v230);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_42(v204, v133);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_222();
  OUTLINED_FUNCTION_186(v134);
  OUTLINED_FUNCTION_34(v133, v135);
  v43[8] = v129;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_139();
  v136 = v209;
  v137 = v227;
  OUTLINED_FUNCTION_42(v209, v229);
  OUTLINED_FUNCTION_1_2();
  v138 = v212;
  OUTLINED_FUNCTION_42((uint64_t)v212, v136);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>);
  OUTLINED_FUNCTION_1_3();
  v139 = OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_206(v130[1]);
  OUTLINED_FUNCTION_34(v136, v140);
  v43[9] = v139;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_128();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_100(v141, v142);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_112();
  v143 = OUTLINED_FUNCTION_196();
  OUTLINED_FUNCTION_60(v143, v184);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_45();
  *v138 = &demangling cache variable for type metadata for AudioSource?;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_131();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_100(v144, v145);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_60(v137, (uint64_t)v223);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_45();
  *v138 = &demangling cache variable for type metadata for AudioDestination?;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_139();
  v146 = v214;
  OUTLINED_FUNCTION_42(v214, v228[3]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_42(v215, v146);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>);
  OUTLINED_FUNCTION_1_3();
  v147 = OUTLINED_FUNCTION_35();
  v223 = *(uint64_t (**)(uint64_t, uint64_t))(v137 + 8);
  OUTLINED_FUNCTION_34(v146, v223);
  v43[13] = v147;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_104();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_89();
  v43[14] = v147;
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_123(v148, v149);
  v150 = v189;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_180();
  OUTLINED_FUNCTION_123(v151, v152);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_95();
  *v150 = v147;
  OUTLINED_FUNCTION_6_0();
  v153 = OUTLINED_FUNCTION_124();
  OUTLINED_FUNCTION_72(v153, v154);
  v155 = v191;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_182();
  OUTLINED_FUNCTION_72((uint64_t)&v235, (uint64_t)&v231);
  OUTLINED_FUNCTION_1_3();
  v156 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_88((uint64_t)&v235);
  *v155 = v156;
  OUTLINED_FUNCTION_68();
  v157 = v217;
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_123(v158, v159);
  v160 = v193;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_123(v161, v162);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_95();
  *v160 = v156;
  OUTLINED_FUNCTION_6_0();
  v163 = v195;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_99();
  v225 = OUTLINED_FUNCTION_160((uint64_t)&v233);
  OUTLINED_FUNCTION_14_0();
  v231 = v163;
  OUTLINED_FUNCTION_1_3();
  *v160 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  v231 = v218;
  v232 = v219;
  OUTLINED_FUNCTION_2_2();
  *v163 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  LOBYTE(v231) = v220;
  OUTLINED_FUNCTION_48();
  *v163 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_183((uint64_t)&v234);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_36();
  v43[21] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  v231 = 0;
  v232 = 0;
  OUTLINED_FUNCTION_2_2();
  *v163 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  LOBYTE(v231) = 2;
  OUTLINED_FUNCTION_48();
  *v163 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  v164 = v226;
  OUTLINED_FUNCTION_226(v226, 1, 1, (uint64_t)v228);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_185();
  OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_72(v165, v166);
  OUTLINED_FUNCTION_1_3();
  v167 = OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_88(v164);
  v43[27] = v167;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LODWORD(v231) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  OUTLINED_FUNCTION_1_3();
  v43[28] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  v168 = v210;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_185();
  v231 = 0;
  v232 = 0;
  OUTLINED_FUNCTION_2_2();
  *v168 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v231) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  OUTLINED_FUNCTION_1_3();
  v43[30] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v231) = 0;
  OUTLINED_FUNCTION_9_0();
  v43[31] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v231) = 0;
  OUTLINED_FUNCTION_9_0();
  v43[32] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v231) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  OUTLINED_FUNCTION_1_3();
  v43[33] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_145();
  v231 = 0;
  v232 = 0;
  OUTLINED_FUNCTION_2_2();
  v43[34] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_69((uint64_t)&type metadata for DummyLocationProvider);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  OUTLINED_FUNCTION_1_3();
  v169 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_49(v169);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_144();
  v231 = 0;
  v232 = 0;
  OUTLINED_FUNCTION_2_2();
  v43[36] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_225();
  OUTLINED_FUNCTION_1_2();
  v170 = *(void (**)(uint64_t))(v221 + 16);
  v171 = OUTLINED_FUNCTION_256();
  v170(v171);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
  OUTLINED_FUNCTION_1_3();
  v172 = OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_258();
  v43[23] = v172;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_225();
  OUTLINED_FUNCTION_1_2();
  v173 = OUTLINED_FUNCTION_256();
  v170(v173);
  OUTLINED_FUNCTION_9_0();
  v174 = OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_258();
  v43[24] = v174;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_126();
  OUTLINED_FUNCTION_146(v157);
  v175 = OUTLINED_FUNCTION_124();
  outlined destroy of AudioSource?(v175, &demangling cache variable for type metadata for SharedContextService?);
  v176 = OUTLINED_FUNCTION_125();
  outlined destroy of AudioSource?(v176, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_117();
  OUTLINED_FUNCTION_74((uint64_t)&v237);
  v177 = OUTLINED_FUNCTION_131();
  outlined destroy of AudioSource?(v177, &demangling cache variable for type metadata for AudioDestination?);
  v178 = OUTLINED_FUNCTION_128();
  outlined destroy of AudioSource?(v178, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_252();
  OUTLINED_FUNCTION_74((uint64_t)&v229);
  OUTLINED_FUNCTION_74((uint64_t)&v230);
  OUTLINED_FUNCTION_153();
  OUTLINED_FUNCTION_38();
}

void CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unsigned __int8 a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27)
{
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
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  OUTLINED_FUNCTION_71();
  LOBYTE(v43) = a25;
  v27 = OUTLINED_FUNCTION_66();
  CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:)(v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    v43,
    a26,
    a27,
    v44,
    a21,
    a22,
    a19,
    a20,
    a17,
    a18,
    a15,
    a16,
    a13,
    a14,
    a11);
  OUTLINED_FUNCTION_174();
}

void CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,unsigned __int8 a37,uint64_t a38,uint64_t a39)
{
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t *v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t *v125;
  uint64_t *v126;
  uint64_t *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t (*v131)(uint64_t, uint64_t);
  uint64_t v132;
  _QWORD *v133;
  uint64_t v134;
  uint64_t (*v135)(uint64_t, uint64_t);
  uint64_t *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t (*v145)(uint64_t, uint64_t);
  uint64_t v146;
  uint64_t v147;
  _QWORD *v148;
  uint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t *v155;
  uint64_t *v156;
  uint64_t *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t **v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t *v172;
  uint64_t *v173;
  uint64_t *v174;
  uint64_t *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t *v180;
  uint64_t v181;
  uint64_t *v182;
  uint64_t v183;
  _QWORD *v184;
  uint64_t *v185;
  uint64_t v186;
  uint64_t *v187;
  uint64_t *v188;
  uint64_t v189;
  uint64_t *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t *v197;
  uint64_t v198;
  uint64_t **v199;
  uint64_t *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  _QWORD *v204;
  uint64_t *v205;
  uint64_t *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  _QWORD *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t *v214;
  uint64_t *v215;
  char v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t (*v222)(uint64_t, uint64_t);
  uint64_t v223;
  id v224;
  uint64_t *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228[3];
  uint64_t v229[2];
  uint64_t *v230;
  uint64_t *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;

  OUTLINED_FUNCTION_85();
  a19 = v43;
  a20 = v44;
  v45 = v39;
  v195 = v46;
  v197 = v47;
  v186 = v48;
  v188 = v49;
  v181 = v50;
  v182 = v51;
  v178 = v52;
  v180 = v53;
  v217 = a39;
  OUTLINED_FUNCTION_194(a38);
  OUTLINED_FUNCTION_202(a37);
  OUTLINED_FUNCTION_234(v54);
  OUTLINED_FUNCTION_178(a35);
  OUTLINED_FUNCTION_201(a34);
  OUTLINED_FUNCTION_177(a33);
  OUTLINED_FUNCTION_23(a32);
  OUTLINED_FUNCTION_197(v55);
  OUTLINED_FUNCTION_67(v56);
  OUTLINED_FUNCTION_206(v57);
  v221 = OUTLINED_FUNCTION_135(a22);
  v220 = *(_QWORD *)(v221 - 8);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v58);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v59);
  OUTLINED_FUNCTION_70();
  v61 = OUTLINED_FUNCTION_63(v60);
  OUTLINED_FUNCTION_73(v61, (uint64_t)&a12);
  v208 = v62;
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v63);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v64);
  OUTLINED_FUNCTION_70();
  v66 = OUTLINED_FUNCTION_64(v65);
  OUTLINED_FUNCTION_73(v66, (uint64_t)&a10);
  v201 = v67;
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v68);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v69);
  OUTLINED_FUNCTION_70();
  v226 = OUTLINED_FUNCTION_65(v70);
  v191 = *(_QWORD *)(v226 - 8);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v71);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v72);
  OUTLINED_FUNCTION_58((uint64_t)&v171 - v73);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FlowTaskMetadata?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v74);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v75);
  OUTLINED_FUNCTION_58((uint64_t)&v171 - v76);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HomeInfo?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v77);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v78);
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_58(v79);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v80);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v81);
  OUTLINED_FUNCTION_109();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v82);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v83);
  OUTLINED_FUNCTION_140();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v84);
  OUTLINED_FUNCTION_208();
  MEMORY[0x24BDAC7A8](v85);
  v87 = (char *)&v171 - v86;
  OUTLINED_FUNCTION_173();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  OUTLINED_FUNCTION_1_3();
  v39[3] = OUTLINED_FUNCTION_5_1();
  v88 = v39 + 3;
  v233 = 0;
  v234 = 0;
  OUTLINED_FUNCTION_2_2();
  v39[4] = OUTLINED_FUNCTION_5_1();
  v89 = v39 + 4;
  v233 = 0;
  v234 = 0;
  OUTLINED_FUNCTION_2_2();
  v39[5] = OUTLINED_FUNCTION_5_1();
  v172 = v39 + 5;
  v233 = 0;
  v234 = 0;
  OUTLINED_FUNCTION_2_2();
  v39[6] = OUTLINED_FUNCTION_5_1();
  v173 = v39 + 6;
  v233 = 0;
  v234 = 0;
  OUTLINED_FUNCTION_2_2();
  v39[7] = OUTLINED_FUNCTION_5_1();
  v174 = v39 + 7;
  v233 = 0;
  v234 = 0;
  OUTLINED_FUNCTION_2_2();
  v39[10] = OUTLINED_FUNCTION_5_1();
  v90 = OUTLINED_FUNCTION_115((uint64_t)(v39 + 10));
  v91 = OUTLINED_FUNCTION_218(v90);
  v176 = v40;
  OUTLINED_FUNCTION_72(v91, v40);
  v177 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>);
  OUTLINED_FUNCTION_1_3();
  v92 = OUTLINED_FUNCTION_110();
  OUTLINED_FUNCTION_88((uint64_t)v87);
  v45[11] = v92;
  v93 = OUTLINED_FUNCTION_91((uint64_t)(v45 + 11));
  OUTLINED_FUNCTION_224(v93, v94, v95, v93);
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_79(v96, v97);
  v179 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
  OUTLINED_FUNCTION_1_3();
  v98 = OUTLINED_FUNCTION_110();
  OUTLINED_FUNCTION_83(v41);
  v45[12] = v98;
  v99 = type metadata accessor for BargeInContext();
  OUTLINED_FUNCTION_87(v99, v100, v101, v99);
  v183 = v42;
  OUTLINED_FUNCTION_248();
  OUTLINED_FUNCTION_79(v102, v103);
  v189 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_156();
  OUTLINED_FUNCTION_83(v42);
  OUTLINED_FUNCTION_169();
  OUTLINED_FUNCTION_78(v104);
  OUTLINED_FUNCTION_90((uint64_t)&v233, (uint64_t)&v230);
  v192 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  OUTLINED_FUNCTION_1_3();
  v105 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_59((uint64_t)&v233);
  v45[16] = v105;
  v106 = OUTLINED_FUNCTION_107((uint64_t)(v45 + 16));
  OUTLINED_FUNCTION_86(v106, v107, v108, v106);
  OUTLINED_FUNCTION_180();
  OUTLINED_FUNCTION_90(v109, v110);
  v193 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_167();
  OUTLINED_FUNCTION_98(v111);
  v196 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>);
  OUTLINED_FUNCTION_1_3();
  v45[18] = OUTLINED_FUNCTION_5_1();
  v190 = v45 + 18;
  v233 = 0;
  v234 = 0;
  OUTLINED_FUNCTION_2_2();
  v45[19] = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_198((uint64_t)(v45 + 19));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  OUTLINED_FUNCTION_1_3();
  v112 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_190(v112);
  OUTLINED_FUNCTION_98(v113);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>);
  OUTLINED_FUNCTION_1_3();
  v45[22] = OUTLINED_FUNCTION_5_1();
  v233 = 0;
  v234 = 0;
  OUTLINED_FUNCTION_2_2();
  v45[25] = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_199((uint64_t)(v45 + 25));
  LOBYTE(v233) = &demangling cache variable for type metadata for HomeInfo?;
  OUTLINED_FUNCTION_48();
  v45[26] = OUTLINED_FUNCTION_5_1();
  v202 = OUTLINED_FUNCTION_92((uint64_t)(v45 + 26));
  v114 = v225;
  OUTLINED_FUNCTION_86(v202, v115, v116, v202);
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_79(v117, v118);
  v203 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
  OUTLINED_FUNCTION_1_3();
  v119 = OUTLINED_FUNCTION_110();
  OUTLINED_FUNCTION_83((uint64_t)v114);
  v45[27] = v119;
  v199 = (uint64_t **)(v45 + 27);
  v233 = 0;
  v234 = 0;
  OUTLINED_FUNCTION_2_2();
  v120 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_170(v120);
  OUTLINED_FUNCTION_176(v121);
  v210 = v45 + 34;
  v233 = 0;
  v234 = 0;
  OUTLINED_FUNCTION_2_2();
  v122 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_164(v122);
  v211 = v123;
  v233 = 0;
  v234 = 0;
  OUTLINED_FUNCTION_2_2();
  v45[36] = OUTLINED_FUNCTION_5_1();
  v233 = 0;
  v234 = 0;
  OUTLINED_FUNCTION_2_2();
  v45[37] = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v230 = v180;
  v231 = &demangling cache variable for type metadata for HomeInfo?;
  OUTLINED_FUNCTION_2_2();
  *v88 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v230 = v182;
  v231 = &demangling cache variable for type metadata for HomeInfo?;
  OUTLINED_FUNCTION_2_2();
  *v89 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v124 = v172;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v230 = v188;
  v231 = v124;
  OUTLINED_FUNCTION_2_2();
  *v114 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v125 = v173;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v230 = v197;
  v231 = v125;
  OUTLINED_FUNCTION_2_2();
  *v125 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v126 = v174;
  OUTLINED_FUNCTION_1_2();
  v127 = v126;
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v230 = v206;
  v231 = v126;
  OUTLINED_FUNCTION_2_2();
  *v126 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_237();
  v129 = *(_QWORD *)(v128 - 256);
  OUTLINED_FUNCTION_42(v129, v229[1]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_42(v194, v129);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>);
  OUTLINED_FUNCTION_1_3();
  v130 = OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_206(v126[1]);
  OUTLINED_FUNCTION_34(v129, v131);
  v45[8] = v130;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_139();
  v132 = v198;
  OUTLINED_FUNCTION_42(v198, v229[0]);
  OUTLINED_FUNCTION_1_2();
  v133 = v204;
  OUTLINED_FUNCTION_42((uint64_t)v204, v132);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_222();
  OUTLINED_FUNCTION_187(v134);
  OUTLINED_FUNCTION_34(v132, v135);
  v45[9] = v130;
  OUTLINED_FUNCTION_6_0();
  v136 = v175;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v230 = v205;
  v231 = v136;
  OUTLINED_FUNCTION_2_2();
  *v127 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_100(v137, v138);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_112();
  v139 = OUTLINED_FUNCTION_196();
  OUTLINED_FUNCTION_60(v139, v176);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_45();
  *v133 = &demangling cache variable for type metadata for AudioSource?;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_100(v140, v141);
  OUTLINED_FUNCTION_1_2();
  swift_release();
  v142 = OUTLINED_FUNCTION_196();
  OUTLINED_FUNCTION_60(v142, (uint64_t)v222);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_45();
  v45[12] = (uint64_t)&demangling cache variable for type metadata for AudioDestination?;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_139();
  v143 = v207;
  v144 = v227;
  OUTLINED_FUNCTION_42(v207, v228[0]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_42(v209, v143);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_222();
  v222 = v145;
  OUTLINED_FUNCTION_34(v143, v145);
  v45[13] = (uint64_t)&demangling cache variable for type metadata for AudioDestination?;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_104();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_89();
  v45[14] = (uint64_t)&demangling cache variable for type metadata for AudioDestination?;
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_84(v146, v147);
  v148 = v184;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_84(v144, v223);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_96();
  *v148 = &demangling cache variable for type metadata for AudioDestination?;
  OUTLINED_FUNCTION_6_0();
  v149 = v212;
  OUTLINED_FUNCTION_72(v212, (uint64_t)&v233);
  v150 = v185;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_182();
  OUTLINED_FUNCTION_72((uint64_t)&v233, (uint64_t)&v230);
  OUTLINED_FUNCTION_1_3();
  v151 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_88((uint64_t)&v233);
  *v150 = v151;
  OUTLINED_FUNCTION_68();
  v152 = v213;
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_103(v153, v154);
  v155 = v187;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_103((uint64_t)v150, (uint64_t)v224);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_111();
  *v155 = v151;
  OUTLINED_FUNCTION_6_0();
  v156 = v190;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_99();
  v224 = OUTLINED_FUNCTION_160((uint64_t)&v232);
  OUTLINED_FUNCTION_14_0();
  v230 = v156;
  OUTLINED_FUNCTION_1_3();
  *v155 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  v230 = v214;
  v231 = v215;
  OUTLINED_FUNCTION_2_2();
  *v156 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  LOBYTE(v230) = v216;
  OUTLINED_FUNCTION_48();
  *v156 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_183((uint64_t)&v233);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_36();
  v45[21] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  v230 = 0;
  v231 = 0;
  OUTLINED_FUNCTION_2_2();
  *v156 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  v157 = v200;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  LOBYTE(v230) = 2;
  OUTLINED_FUNCTION_48();
  *v156 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  v158 = OUTLINED_FUNCTION_181((uint64_t)&v237);
  __swift_storeEnumTagSinglePayload(v158, v159, v160, v202);
  v161 = v199;
  OUTLINED_FUNCTION_1_2();
  swift_release();
  OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_123(v162, v163);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_95();
  *v161 = v157;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LODWORD(v230) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  OUTLINED_FUNCTION_1_3();
  v45[28] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  v230 = 0;
  v231 = 0;
  OUTLINED_FUNCTION_2_2();
  *v157 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v230) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  OUTLINED_FUNCTION_1_3();
  v45[30] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v230) = 0;
  OUTLINED_FUNCTION_9_0();
  v45[31] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v230) = 0;
  OUTLINED_FUNCTION_9_0();
  v45[32] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v230) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  OUTLINED_FUNCTION_1_3();
  v45[33] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_145();
  v230 = 0;
  v231 = 0;
  OUTLINED_FUNCTION_2_2();
  v45[34] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_69((uint64_t)&type metadata for DummyLocationProvider);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  OUTLINED_FUNCTION_1_3();
  v164 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_49(v164);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_144();
  v230 = 0;
  v231 = 0;
  OUTLINED_FUNCTION_2_2();
  v45[36] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  v165 = v218;
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v220 + 16))(v219, v165, v221);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
  OUTLINED_FUNCTION_1_3();
  v166 = OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_101();
  v45[23] = v166;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_166();
  OUTLINED_FUNCTION_9_0();
  v167 = OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_101();
  v45[24] = v167;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_163();
  OUTLINED_FUNCTION_155((uint64_t)&v236);
  outlined destroy of AudioSource?(v152, &demangling cache variable for type metadata for HomeInfo?);
  outlined destroy of AudioSource?(v149, &demangling cache variable for type metadata for SharedContextService?);
  v168 = OUTLINED_FUNCTION_125();
  outlined destroy of AudioSource?(v168, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_117();
  OUTLINED_FUNCTION_74((uint64_t)&v235);
  v169 = OUTLINED_FUNCTION_131();
  outlined destroy of AudioSource?(v169, &demangling cache variable for type metadata for AudioDestination?);
  v170 = OUTLINED_FUNCTION_128();
  outlined destroy of AudioSource?(v170, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_74((uint64_t)v228);
  OUTLINED_FUNCTION_74((uint64_t)v229);
  OUTLINED_FUNCTION_153();
  OUTLINED_FUNCTION_38();
}

void CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
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
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned __int8 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  OUTLINED_FUNCTION_118(a1, a2, a3, a4, a5, a6, a7, a8);
  OUTLINED_FUNCTION_71();
  LOBYTE(v46) = a25;
  v28 = OUTLINED_FUNCTION_97();
  CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:)(v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    v46,
    a26,
    a27,
    a28,
    a26,
    a27,
    a21,
    a22,
    a19,
    a20,
    a17,
    a18,
    v47,
    v48,
    v49,
    v50);
  OUTLINED_FUNCTION_174();
}

void CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,unsigned __int8 a37,uint64_t a38,uint64_t a39,uint64_t a40)
{
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t *v134;
  uint64_t *v135;
  uint64_t *v136;
  uint64_t *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t (*v140)(uint64_t, uint64_t);
  uint64_t v141;
  uint64_t (*v142)(uint64_t, uint64_t);
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t *v165;
  uint64_t *v166;
  uint64_t *v167;
  uint64_t *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t *v181;
  uint64_t *v182;
  uint64_t *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t *v191;
  uint64_t v192;
  uint64_t *v193;
  uint64_t v194;
  uint64_t *v195;
  uint64_t *v196;
  uint64_t v197;
  uint64_t *v198;
  uint64_t *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t *v219;
  uint64_t (*v220)(uint64_t, uint64_t);
  uint64_t *v221;
  uint64_t v222;
  uint64_t v223;
  _QWORD *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t *v227;
  uint64_t *v228;
  char v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t (*v232)(uint64_t, uint64_t);
  uint64_t v233;
  uint64_t v234;
  id v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241[3];
  uint64_t *v242;
  uint64_t *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;

  OUTLINED_FUNCTION_85();
  a19 = v45;
  a20 = v46;
  v47 = v40;
  v207 = v48;
  v209 = v49;
  v197 = v50;
  v199 = v51;
  v192 = v52;
  v193 = v53;
  v189 = v54;
  v191 = v55;
  OUTLINED_FUNCTION_194(a40);
  OUTLINED_FUNCTION_165(a39);
  OUTLINED_FUNCTION_234(a38);
  OUTLINED_FUNCTION_202(a37);
  OUTLINED_FUNCTION_201(v56);
  OUTLINED_FUNCTION_177(a35);
  OUTLINED_FUNCTION_157(a34);
  OUTLINED_FUNCTION_204(a33);
  OUTLINED_FUNCTION_23(a32);
  OUTLINED_FUNCTION_187(v57);
  OUTLINED_FUNCTION_150(a26);
  v231 = OUTLINED_FUNCTION_135(v58);
  v230 = *(_QWORD *)(v231 - 8);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v59);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v60);
  v238 = OUTLINED_FUNCTION_63((uint64_t)&v181 - v61);
  v222 = *(_QWORD *)(v238 - 8);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v62);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v63);
  v237 = OUTLINED_FUNCTION_64((uint64_t)&v181 - v64);
  v211 = *(_QWORD *)(v237 - 8);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v65);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v66);
  OUTLINED_FUNCTION_70();
  v68 = OUTLINED_FUNCTION_65(v67);
  OUTLINED_FUNCTION_73(v68, (uint64_t)&a10);
  v203 = v69;
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v70);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v71);
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_58(v72);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FlowTaskMetadata?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v73);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v74);
  OUTLINED_FUNCTION_58((uint64_t)&v181 - v75);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HomeInfo?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v76);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v77);
  OUTLINED_FUNCTION_58((uint64_t)&v181 - v78);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v79);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v80);
  OUTLINED_FUNCTION_109();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v81);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v82);
  OUTLINED_FUNCTION_140();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v83);
  OUTLINED_FUNCTION_208();
  MEMORY[0x24BDAC7A8](v84);
  OUTLINED_FUNCTION_151();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  OUTLINED_FUNCTION_1_3();
  v40[3] = OUTLINED_FUNCTION_5_1();
  v85 = v40 + 3;
  v246 = 0;
  v247 = 0;
  OUTLINED_FUNCTION_2_2();
  v40[4] = OUTLINED_FUNCTION_5_1();
  v86 = v40 + 4;
  v246 = 0;
  v247 = 0;
  OUTLINED_FUNCTION_2_2();
  v87 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_211(v87);
  v181 = v88;
  v246 = 0;
  v247 = 0;
  OUTLINED_FUNCTION_2_2();
  v89 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_210(v89);
  v182 = v90;
  v246 = 0;
  v247 = 0;
  OUTLINED_FUNCTION_2_2();
  v91 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_209(v91);
  v183 = v92;
  v246 = 0;
  v247 = 0;
  OUTLINED_FUNCTION_2_2();
  v93 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_231(v93);
  v95 = OUTLINED_FUNCTION_115(v94);
  v98 = OUTLINED_FUNCTION_86(v95, v96, v97, v95);
  v185 = v42;
  v187 = v41;
  OUTLINED_FUNCTION_103(v98, v41);
  v188 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_110();
  OUTLINED_FUNCTION_142(v42);
  OUTLINED_FUNCTION_189();
  v100 = OUTLINED_FUNCTION_91(v99);
  OUTLINED_FUNCTION_116(v100);
  v186 = v43;
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_72(v101, v102);
  v190 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_110();
  OUTLINED_FUNCTION_88(v43);
  OUTLINED_FUNCTION_168();
  v104 = OUTLINED_FUNCTION_106(v103);
  OUTLINED_FUNCTION_87(v104, v105, v106, v104);
  v194 = v44;
  OUTLINED_FUNCTION_180();
  OUTLINED_FUNCTION_103(v107, v108);
  v201 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_142(v44);
  OUTLINED_FUNCTION_169();
  OUTLINED_FUNCTION_78(v109);
  OUTLINED_FUNCTION_90((uint64_t)&v246, (uint64_t)&v242);
  v204 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_59((uint64_t)&v246);
  OUTLINED_FUNCTION_212();
  v111 = OUTLINED_FUNCTION_107(v110);
  v112 = v233;
  v115 = OUTLINED_FUNCTION_120(v111, v113, v114, v111);
  OUTLINED_FUNCTION_90(v115, v116);
  v205 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_59(v112);
  OUTLINED_FUNCTION_167();
  OUTLINED_FUNCTION_98(v117);
  v208 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>);
  OUTLINED_FUNCTION_1_3();
  v118 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_213(v118);
  v202 = v119;
  v246 = 0;
  v247 = 0;
  OUTLINED_FUNCTION_2_2();
  v40[19] = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_198((uint64_t)(v40 + 19));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  OUTLINED_FUNCTION_1_3();
  v120 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_190(v120);
  OUTLINED_FUNCTION_98(v121);
  v214 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>);
  OUTLINED_FUNCTION_1_3();
  v122 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_215(v122);
  OUTLINED_FUNCTION_199(v123);
  v246 = 0;
  v247 = 0;
  OUTLINED_FUNCTION_2_2();
  v124 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_191(v124);
  v213 = v125;
  LOBYTE(v246) = &demangling cache variable for type metadata for HomeInfo?;
  OUTLINED_FUNCTION_48();
  v40[26] = OUTLINED_FUNCTION_5_1();
  v216 = OUTLINED_FUNCTION_92((uint64_t)(v40 + 26));
  v126 = v236;
  __swift_storeEnumTagSinglePayload(v236, 1, 1, v216);
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_79(v127, v128);
  v217 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
  OUTLINED_FUNCTION_1_3();
  v129 = OUTLINED_FUNCTION_110();
  OUTLINED_FUNCTION_83(v126);
  v47[27] = v129;
  v246 = 0;
  v247 = 0;
  OUTLINED_FUNCTION_2_2();
  v130 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_170(v130);
  v218 = v131;
  v224 = v47 + 34;
  v246 = 0;
  v247 = 0;
  OUTLINED_FUNCTION_2_2();
  v132 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_164(v132);
  v225 = v133;
  v246 = 0;
  v247 = 0;
  OUTLINED_FUNCTION_2_2();
  v47[36] = OUTLINED_FUNCTION_5_1();
  v246 = 0;
  v247 = 0;
  OUTLINED_FUNCTION_2_2();
  v47[37] = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v242 = v191;
  v243 = &demangling cache variable for type metadata for HomeInfo?;
  OUTLINED_FUNCTION_2_2();
  *v85 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v242 = v193;
  v243 = &demangling cache variable for type metadata for HomeInfo?;
  OUTLINED_FUNCTION_2_2();
  *v86 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v134 = v181;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v242 = v199;
  v243 = v134;
  OUTLINED_FUNCTION_2_2();
  demangling cache variable for type metadata for AudioDestination? = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v135 = v182;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v242 = v209;
  v243 = v135;
  OUTLINED_FUNCTION_2_2();
  *v135 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v136 = v183;
  OUTLINED_FUNCTION_1_2();
  v137 = v136;
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v242 = v221;
  v243 = v136;
  OUTLINED_FUNCTION_2_2();
  *v136 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_139();
  v138 = v200;
  OUTLINED_FUNCTION_42(v200, v241[2]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_42(v206, v138);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>);
  OUTLINED_FUNCTION_1_3();
  v139 = OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_221(v136[1]);
  OUTLINED_FUNCTION_34(v138, v140);
  v47[8] = v139;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_139();
  v141 = v210;
  OUTLINED_FUNCTION_42(v210, v241[1]);
  OUTLINED_FUNCTION_1_2();
  v142 = v220;
  OUTLINED_FUNCTION_42((uint64_t)v220, v141);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>);
  OUTLINED_FUNCTION_1_3();
  v143 = OUTLINED_FUNCTION_35();
  v220 = (uint64_t (*)(uint64_t, uint64_t))v136[1];
  OUTLINED_FUNCTION_34(v141, v220);
  v47[9] = v143;
  OUTLINED_FUNCTION_6_0();
  v144 = v184;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v242 = v219;
  v243 = (uint64_t *)v144;
  OUTLINED_FUNCTION_2_2();
  *v137 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_128();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_100(v145, v146);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_112();
  v147 = OUTLINED_FUNCTION_196();
  OUTLINED_FUNCTION_60(v147, v187);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_45();
  *(_QWORD *)v142 = &demangling cache variable for type metadata for AudioSource?;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_131();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_100(v148, v149);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_112();
  v150 = v144;
  OUTLINED_FUNCTION_60(v144, (uint64_t)v232);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_45();
  *(_QWORD *)v142 = &demangling cache variable for type metadata for AudioDestination?;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_240();
  v152 = *(_QWORD *)(v151 - 256);
  v153 = v238;
  OUTLINED_FUNCTION_42(v152, v239);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_42(v223, v152);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>);
  OUTLINED_FUNCTION_1_3();
  v154 = OUTLINED_FUNCTION_35();
  v232 = *(uint64_t (**)(uint64_t, uint64_t))(v150 + 8);
  OUTLINED_FUNCTION_34(v152, v232);
  v47[13] = v154;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_104();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_89();
  v47[14] = v154;
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_84(v155, v156);
  v157 = v195;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_84(v153, v234);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_96();
  *v157 = v154;
  OUTLINED_FUNCTION_6_0();
  v158 = OUTLINED_FUNCTION_124();
  OUTLINED_FUNCTION_72(v158, v159);
  v160 = v196;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_182();
  OUTLINED_FUNCTION_72((uint64_t)&v246, (uint64_t)&v242);
  OUTLINED_FUNCTION_1_3();
  v161 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_88((uint64_t)&v246);
  *v160 = v161;
  OUTLINED_FUNCTION_68();
  v162 = v226;
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_84(v163, v164);
  v165 = v198;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_84((uint64_t)v160, (uint64_t)v235);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_96();
  *v165 = v161;
  OUTLINED_FUNCTION_6_0();
  v166 = v202;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_99();
  v235 = OUTLINED_FUNCTION_160((uint64_t)&v244);
  OUTLINED_FUNCTION_14_0();
  v242 = v166;
  OUTLINED_FUNCTION_1_3();
  *v165 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  v242 = v227;
  v243 = v228;
  OUTLINED_FUNCTION_2_2();
  *v166 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  LOBYTE(v242) = v229;
  OUTLINED_FUNCTION_48();
  *v166 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_183((uint64_t)&v245);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_36();
  v47[21] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v167 = v212;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v242 = v167;
  OUTLINED_FUNCTION_1_3();
  *v167 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  v242 = 0;
  v243 = 0;
  OUTLINED_FUNCTION_2_2();
  *v167 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  v168 = v215;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  LOBYTE(v242) = 2;
  OUTLINED_FUNCTION_48();
  *v167 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  v169 = OUTLINED_FUNCTION_181((uint64_t)&v249);
  __swift_storeEnumTagSinglePayload(v169, v170, v171, v216);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_253();
  OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_123(v172, v173);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_95();
  *v167 = (uint64_t)v168;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LODWORD(v242) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  OUTLINED_FUNCTION_1_3();
  v47[28] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  v242 = 0;
  v243 = 0;
  OUTLINED_FUNCTION_2_2();
  *v168 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v242) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  OUTLINED_FUNCTION_1_3();
  v47[30] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v242) = 0;
  OUTLINED_FUNCTION_9_0();
  v47[31] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v242) = 0;
  OUTLINED_FUNCTION_9_0();
  v47[32] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v242) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  OUTLINED_FUNCTION_1_3();
  v47[33] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_145();
  v242 = 0;
  v243 = 0;
  OUTLINED_FUNCTION_2_2();
  v47[34] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_69((uint64_t)&type metadata for DummyLocationProvider);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  OUTLINED_FUNCTION_1_3();
  v174 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_49(v174);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_144();
  v242 = 0;
  v243 = 0;
  OUTLINED_FUNCTION_2_2();
  v47[36] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_134();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
  OUTLINED_FUNCTION_1_3();
  v175 = OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_101();
  v47[23] = v175;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_166();
  OUTLINED_FUNCTION_9_0();
  v176 = OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_101();
  v47[24] = v176;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_126();
  OUTLINED_FUNCTION_108(v162);
  v177 = OUTLINED_FUNCTION_124();
  outlined destroy of AudioSource?(v177, &demangling cache variable for type metadata for SharedContextService?);
  v178 = OUTLINED_FUNCTION_125();
  outlined destroy of AudioSource?(v178, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_117();
  OUTLINED_FUNCTION_74((uint64_t)&v248);
  v179 = OUTLINED_FUNCTION_131();
  outlined destroy of AudioSource?(v179, &demangling cache variable for type metadata for AudioDestination?);
  v180 = OUTLINED_FUNCTION_128();
  outlined destroy of AudioSource?(v180, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_252();
  OUTLINED_FUNCTION_74((uint64_t)&v240);
  OUTLINED_FUNCTION_74((uint64_t)v241);
  OUTLINED_FUNCTION_153();
  OUTLINED_FUNCTION_38();
}

uint64_t CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  OUTLINED_FUNCTION_118(a1, a2, a3, a4, a5, a6, a7, a8);
  v30 = OUTLINED_FUNCTION_71();
  LOBYTE(v50) = a25;
  v31 = OUTLINED_FUNCTION_97();
  CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:)(v31, v32, v33, v34, v35, v36, v37, v38, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    v50,
    a26,
    a27,
    a28,
    a29,
    a30,
    a28,
    a29,
    a26,
    a27,
    a21,
    a22,
    a19,
    a20,
    a17,
    a18,
    v51,
    v52);
  return v30;
}

void CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,unsigned __int8 a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42)
{
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t (*v135)(uint64_t, uint64_t);
  uint64_t v136;
  uint64_t *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t *v148;
  uint64_t *v149;
  uint64_t *v150;
  uint64_t *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  _QWORD *v155;
  uint64_t v156;
  uint64_t (*v157)(uint64_t, uint64_t);
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t *v178;
  uint64_t *v179;
  uint64_t (*v180)(uint64_t, uint64_t);
  uint64_t *v181;
  uint64_t *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t *v195;
  uint64_t *v196;
  uint64_t *v197;
  uint64_t v198;
  uint64_t v199;
  char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t (*v205)(uint64_t, uint64_t);
  uint64_t v206;
  uint64_t (*v207)(uint64_t, uint64_t);
  uint64_t v208;
  uint64_t *v209;
  uint64_t *v210;
  uint64_t *v211;
  uint64_t v212;
  uint64_t (*v213)(uint64_t, uint64_t);
  uint64_t v214;
  uint64_t v215;
  uint64_t *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t (*v223)(uint64_t, uint64_t);
  uint64_t v224;
  uint64_t v225;
  uint64_t (*v226)(uint64_t, uint64_t);
  uint64_t *v227;
  uint64_t v228;
  uint64_t *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t (*v233)(uint64_t, uint64_t);
  _QWORD *v234;
  uint64_t v235;
  uint64_t (*v236)(uint64_t, uint64_t);
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t (*v240)(uint64_t, uint64_t);
  uint64_t *v241;
  char v242;
  uint64_t (*v243)(uint64_t, uint64_t);
  uint64_t v244;
  uint64_t v245;
  uint64_t (*v246)(uint64_t, uint64_t);
  uint64_t v247;
  uint64_t v248;
  id v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252[2];
  uint64_t v253[4];
  uint64_t (*v254)(uint64_t, uint64_t);
  uint64_t *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;

  OUTLINED_FUNCTION_85();
  a19 = v46;
  a20 = v47;
  v48 = v42;
  v222 = v49;
  v223 = v50;
  v212 = v51;
  v213 = v52;
  v206 = v53;
  v207 = v54;
  v203 = v55;
  v205 = v56;
  OUTLINED_FUNCTION_165(a42);
  OUTLINED_FUNCTION_194(a41);
  OUTLINED_FUNCTION_234(a40);
  OUTLINED_FUNCTION_178(a39);
  OUTLINED_FUNCTION_201(a38);
  OUTLINED_FUNCTION_202(a37);
  OUTLINED_FUNCTION_157(v57);
  OUTLINED_FUNCTION_204(a35);
  OUTLINED_FUNCTION_229(a34);
  OUTLINED_FUNCTION_250(a33);
  OUTLINED_FUNCTION_23(a32);
  OUTLINED_FUNCTION_197(v58);
  OUTLINED_FUNCTION_67(v59);
  OUTLINED_FUNCTION_207(v60);
  v245 = OUTLINED_FUNCTION_135(a22);
  v244 = *(_QWORD *)(v245 - 8);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v61);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v62);
  v64 = OUTLINED_FUNCTION_63((uint64_t)&v195 - v63);
  OUTLINED_FUNCTION_73(v64, (uint64_t)&a11);
  OUTLINED_FUNCTION_221(v65);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v66);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v67);
  OUTLINED_FUNCTION_70();
  v69 = OUTLINED_FUNCTION_64(v68);
  OUTLINED_FUNCTION_73(v69, (uint64_t)&a9);
  v225 = v70;
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v71);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v72);
  OUTLINED_FUNCTION_70();
  v74 = OUTLINED_FUNCTION_65(v73);
  OUTLINED_FUNCTION_73(v74, (uint64_t)&a10);
  v217 = v75;
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v76);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v77);
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_58(v78);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FlowTaskMetadata?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v79);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v80);
  OUTLINED_FUNCTION_58((uint64_t)&v195 - v81);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HomeInfo?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v82);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v83);
  OUTLINED_FUNCTION_58((uint64_t)&v195 - v84);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v85);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v86);
  OUTLINED_FUNCTION_109();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v87);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v88);
  v90 = (char *)&v195 - v89;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v91);
  OUTLINED_FUNCTION_141();
  MEMORY[0x24BDAC7A8](v92);
  OUTLINED_FUNCTION_151();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  OUTLINED_FUNCTION_1_3();
  v42[3] = OUTLINED_FUNCTION_5_1();
  v93 = v42 + 3;
  v258 = 0;
  v259 = 0;
  OUTLINED_FUNCTION_2_2();
  v42[4] = OUTLINED_FUNCTION_5_1();
  v94 = v42 + 4;
  v258 = 0;
  v259 = 0;
  OUTLINED_FUNCTION_2_2();
  v95 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_211(v95);
  v195 = v96;
  v258 = 0;
  v259 = 0;
  OUTLINED_FUNCTION_2_2();
  v97 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_210(v97);
  v196 = v98;
  v258 = 0;
  v259 = 0;
  OUTLINED_FUNCTION_2_2();
  v99 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_209(v99);
  v197 = v100;
  v258 = 0;
  v259 = 0;
  OUTLINED_FUNCTION_2_2();
  v101 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_231(v101);
  v103 = OUTLINED_FUNCTION_115(v102);
  v106 = OUTLINED_FUNCTION_86(v103, v104, v105, v103);
  v199 = v43;
  v201 = v44;
  OUTLINED_FUNCTION_90(v106, v44);
  v202 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_189();
  v108 = OUTLINED_FUNCTION_91(v107);
  OUTLINED_FUNCTION_193(v108, v109, v110, v108);
  v200 = v90;
  OUTLINED_FUNCTION_180();
  OUTLINED_FUNCTION_72(v111, v112);
  v204 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_88((uint64_t)v90);
  OUTLINED_FUNCTION_168();
  v114 = OUTLINED_FUNCTION_106(v113);
  OUTLINED_FUNCTION_87(v114, v115, v116, v114);
  v208 = v45;
  OUTLINED_FUNCTION_180();
  OUTLINED_FUNCTION_103(v117, v118);
  v215 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_142(v45);
  OUTLINED_FUNCTION_169();
  OUTLINED_FUNCTION_78(v119);
  OUTLINED_FUNCTION_90((uint64_t)&v258, (uint64_t)&v254);
  v218 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_59((uint64_t)&v258);
  OUTLINED_FUNCTION_212();
  v121 = OUTLINED_FUNCTION_107(v120);
  v122 = v247;
  v125 = OUTLINED_FUNCTION_120(v121, v123, v124, v121);
  OUTLINED_FUNCTION_90(v125, v126);
  v219 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_59(v122);
  OUTLINED_FUNCTION_167();
  OUTLINED_FUNCTION_98(v127);
  v221 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>);
  OUTLINED_FUNCTION_1_3();
  v128 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_213(v128);
  v216 = v129;
  v258 = 0;
  v259 = 0;
  OUTLINED_FUNCTION_2_2();
  v130 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_232(v130);
  OUTLINED_FUNCTION_198(v131);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  OUTLINED_FUNCTION_1_3();
  v132 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_190(v132);
  OUTLINED_FUNCTION_98(v133);
  v228 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>);
  OUTLINED_FUNCTION_1_3();
  v134 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_215(v134);
  v226 = v135;
  v258 = 0;
  v259 = 0;
  OUTLINED_FUNCTION_2_2();
  v136 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_191(v136);
  v227 = v137;
  LOBYTE(v258) = &demangling cache variable for type metadata for HomeInfo?;
  OUTLINED_FUNCTION_48();
  v138 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_214(v138);
  v230 = OUTLINED_FUNCTION_92(v139);
  v140 = v250;
  __swift_storeEnumTagSinglePayload(v250, 1, 1, v230);
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_79(v141, v142);
  v231 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
  OUTLINED_FUNCTION_1_3();
  v143 = OUTLINED_FUNCTION_110();
  OUTLINED_FUNCTION_83(v140);
  v48[27] = v143;
  v258 = 0;
  v259 = 0;
  OUTLINED_FUNCTION_2_2();
  v144 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_170(v144);
  v232 = v145;
  OUTLINED_FUNCTION_186((uint64_t)(v48 + 34));
  v258 = 0;
  v259 = 0;
  OUTLINED_FUNCTION_2_2();
  v146 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_164(v146);
  v238 = v147;
  v258 = 0;
  v259 = 0;
  OUTLINED_FUNCTION_2_2();
  v48[36] = OUTLINED_FUNCTION_5_1();
  v258 = 0;
  v259 = 0;
  OUTLINED_FUNCTION_2_2();
  v48[37] = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v254 = v205;
  v255 = &demangling cache variable for type metadata for HomeInfo?;
  OUTLINED_FUNCTION_2_2();
  *v93 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v254 = v207;
  v255 = &demangling cache variable for type metadata for HomeInfo?;
  OUTLINED_FUNCTION_2_2();
  *v94 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v148 = v195;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v254 = v213;
  v255 = v148;
  OUTLINED_FUNCTION_2_2();
  demangling cache variable for type metadata for AudioDestination? = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v149 = v196;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v254 = v223;
  v255 = v149;
  OUTLINED_FUNCTION_2_2();
  demangling cache variable for type metadata for AudioDestination? = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v150 = v197;
  OUTLINED_FUNCTION_1_2();
  v151 = v150;
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v254 = v236;
  v255 = v150;
  OUTLINED_FUNCTION_2_2();
  *v150 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_139();
  v152 = v214;
  OUTLINED_FUNCTION_42(v214, v253[3]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_42(v220, v152);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>);
  OUTLINED_FUNCTION_1_3();
  v153 = OUTLINED_FUNCTION_35();
  v236 = (uint64_t (*)(uint64_t, uint64_t))v150[1];
  OUTLINED_FUNCTION_34(v152, v236);
  v48[8] = v153;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_139();
  v154 = v224;
  OUTLINED_FUNCTION_42(v224, v253[2]);
  OUTLINED_FUNCTION_1_2();
  v155 = v234;
  OUTLINED_FUNCTION_42((uint64_t)v234, v154);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>);
  OUTLINED_FUNCTION_1_3();
  v156 = OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_176(v150[1]);
  OUTLINED_FUNCTION_34(v154, v157);
  v48[9] = v156;
  OUTLINED_FUNCTION_6_0();
  v158 = v198;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v254 = v233;
  v255 = (uint64_t *)v158;
  OUTLINED_FUNCTION_2_2();
  *v151 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_128();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_100(v159, v160);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_112();
  v161 = OUTLINED_FUNCTION_196();
  OUTLINED_FUNCTION_60(v161, v201);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_45();
  *v155 = &demangling cache variable for type metadata for AudioSource?;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_131();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_100(v162, v163);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_112();
  v164 = v158;
  OUTLINED_FUNCTION_60(v158, (uint64_t)v246);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_45();
  *v155 = &demangling cache variable for type metadata for AudioDestination?;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_139();
  v165 = v235;
  v166 = v251;
  OUTLINED_FUNCTION_42(v235, v252[1]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_42(v237, v165);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>);
  OUTLINED_FUNCTION_1_3();
  v167 = OUTLINED_FUNCTION_35();
  v246 = *(uint64_t (**)(uint64_t, uint64_t))(v164 + 8);
  OUTLINED_FUNCTION_34(v165, v246);
  v48[13] = v167;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_104();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_89();
  v48[14] = v167;
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_84(v168, v169);
  v170 = v209;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_84(v166, v248);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_96();
  *v170 = v167;
  OUTLINED_FUNCTION_6_0();
  v171 = OUTLINED_FUNCTION_124();
  OUTLINED_FUNCTION_72(v171, v172);
  v173 = v210;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_182();
  OUTLINED_FUNCTION_72((uint64_t)&v258, (uint64_t)&v254);
  OUTLINED_FUNCTION_1_3();
  v174 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_88((uint64_t)&v258);
  *v173 = v174;
  OUTLINED_FUNCTION_68();
  v175 = v239;
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_84(v176, v177);
  v178 = v211;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_84((uint64_t)v173, (uint64_t)v249);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_96();
  *v178 = v174;
  OUTLINED_FUNCTION_6_0();
  v179 = v216;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_99();
  v249 = OUTLINED_FUNCTION_160((uint64_t)&v256);
  OUTLINED_FUNCTION_14_0();
  v254 = (uint64_t (*)(uint64_t, uint64_t))v179;
  OUTLINED_FUNCTION_1_3();
  *v178 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  v254 = v240;
  v255 = v241;
  OUTLINED_FUNCTION_2_2();
  *v179 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  LOBYTE(v254) = v242;
  OUTLINED_FUNCTION_48();
  *v179 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_183((uint64_t)&v257);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_36();
  v48[21] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v180 = v226;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v254 = v180;
  OUTLINED_FUNCTION_1_3();
  *v178 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v181 = v227;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v254 = v243;
  v255 = v181;
  OUTLINED_FUNCTION_2_2();
  *v181 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v182 = v229;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  LOBYTE(v254) = 2;
  OUTLINED_FUNCTION_48();
  *v181 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  v183 = OUTLINED_FUNCTION_181((uint64_t)&v261);
  __swift_storeEnumTagSinglePayload(v183, v184, v185, v230);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_253();
  OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_123(v186, v187);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_95();
  *v181 = (uint64_t)v182;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LODWORD(v254) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  OUTLINED_FUNCTION_1_3();
  v48[28] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  v254 = 0;
  v255 = 0;
  OUTLINED_FUNCTION_2_2();
  *v182 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v254) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  OUTLINED_FUNCTION_1_3();
  v48[30] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v254) = 0;
  OUTLINED_FUNCTION_9_0();
  v48[31] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v254) = 0;
  OUTLINED_FUNCTION_9_0();
  v48[32] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v254) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  OUTLINED_FUNCTION_1_3();
  v48[33] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_145();
  v254 = 0;
  v255 = 0;
  OUTLINED_FUNCTION_2_2();
  v48[34] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_69((uint64_t)&type metadata for DummyLocationProvider);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  OUTLINED_FUNCTION_1_3();
  v188 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_49(v188);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_144();
  v254 = 0;
  v255 = 0;
  OUTLINED_FUNCTION_2_2();
  v48[36] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_134();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
  OUTLINED_FUNCTION_1_3();
  v189 = OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_101();
  v48[23] = v189;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_166();
  OUTLINED_FUNCTION_9_0();
  v190 = OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_101();
  v48[24] = v190;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_126();
  OUTLINED_FUNCTION_108(v175);
  v191 = OUTLINED_FUNCTION_124();
  outlined destroy of AudioSource?(v191, &demangling cache variable for type metadata for SharedContextService?);
  v192 = OUTLINED_FUNCTION_125();
  outlined destroy of AudioSource?(v192, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_117();
  OUTLINED_FUNCTION_74((uint64_t)&v260);
  v193 = OUTLINED_FUNCTION_131();
  outlined destroy of AudioSource?(v193, &demangling cache variable for type metadata for AudioDestination?);
  v194 = OUTLINED_FUNCTION_128();
  outlined destroy of AudioSource?(v194, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_74((uint64_t)v252);
  OUTLINED_FUNCTION_74((uint64_t)v253);
  OUTLINED_FUNCTION_153();
  OUTLINED_FUNCTION_38();
}

void CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:)()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  char v3;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  unsigned __int8 v34;

  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_71();
  LOBYTE(v22) = v3;
  LOBYTE(v21) = v1;
  v5 = OUTLINED_FUNCTION_66();
  CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:)(v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, (uint64_t)v32, v33, v30,
    v31,
    v28,
    v29,
    v4,
    v0,
    v21,
    v26,
    v27,
    v24,
    v25,
    v2,
    v22,
    v23,
    v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34);
  OUTLINED_FUNCTION_162();
}

void CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,unsigned __int8 a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t *a41,uint64_t a42,unsigned __int8 a43)
{
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t *v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t *v130;
  uint64_t *v131;
  uint64_t *v132;
  uint64_t *v133;
  uint64_t *v134;
  uint64_t *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t (*v139)(uint64_t, uint64_t);
  uint64_t v140;
  _QWORD *v141;
  uint64_t v142;
  uint64_t (*v143)(uint64_t, uint64_t);
  uint64_t *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t (*v153)(uint64_t, uint64_t);
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t *v168;
  uint64_t *v169;
  uint64_t *v170;
  uint64_t *v171;
  uint64_t *v172;
  uint64_t *v173;
  uint64_t *v174;
  uint64_t v175;
  uint64_t v176;
  void (*v177)(uint64_t, uint64_t, uint64_t);
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t *v186;
  uint64_t *v187;
  uint64_t *v188;
  uint64_t *v189;
  uint64_t *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t *v194;
  uint64_t *v195;
  uint64_t *v196;
  uint64_t *v197;
  uint64_t *v198;
  uint64_t *v199;
  uint64_t v200;
  uint64_t *v201;
  uint64_t v202;
  uint64_t *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t *v208;
  uint64_t v209;
  uint64_t *v210;
  uint64_t v211;
  uint64_t *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t *v215;
  uint64_t *v216;
  uint64_t v217;
  uint64_t *v218;
  uint64_t v219;
  _QWORD *v220;
  uint64_t *v221;
  uint64_t *v222;
  uint64_t v223;
  uint64_t v224;
  _QWORD *v225;
  uint64_t v226;
  uint64_t *v227;
  uint64_t *v228;
  char v229;
  uint64_t *v230;
  int v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t (*v236)(uint64_t, uint64_t);
  uint64_t v237;
  id v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241[3];
  uint64_t v242[3];
  uint64_t *v243;
  uint64_t *v244;
  uint64_t v245;
  uint64_t v246;
  _OWORD v247[2];
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;

  OUTLINED_FUNCTION_85();
  a19 = v47;
  a20 = v48;
  v49 = v43;
  v211 = v50;
  v212 = v51;
  v200 = v52;
  v201 = v53;
  v196 = v54;
  v197 = v55;
  v194 = v56;
  v195 = v57;
  v231 = a43;
  OUTLINED_FUNCTION_194(a42);
  v230 = a41;
  OUTLINED_FUNCTION_165(a40);
  OUTLINED_FUNCTION_234(a39);
  OUTLINED_FUNCTION_178(a38);
  OUTLINED_FUNCTION_202(a37);
  OUTLINED_FUNCTION_177(v58);
  OUTLINED_FUNCTION_157(a35);
  OUTLINED_FUNCTION_204(a34);
  OUTLINED_FUNCTION_229(a33);
  OUTLINED_FUNCTION_23(a32);
  OUTLINED_FUNCTION_197(v59);
  OUTLINED_FUNCTION_150(v60);
  v62 = OUTLINED_FUNCTION_135(v61);
  OUTLINED_FUNCTION_73(v62, (uint64_t)&v249);
  v234 = v63;
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v64);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v65);
  v240 = OUTLINED_FUNCTION_63((uint64_t)&v186 - v66);
  v223 = *(_QWORD *)(v240 - 8);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v67);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v68);
  v70 = OUTLINED_FUNCTION_64((uint64_t)&v186 - v69);
  OUTLINED_FUNCTION_73(v70, (uint64_t)&a9);
  v214 = v71;
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v72);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v73);
  OUTLINED_FUNCTION_70();
  v239 = OUTLINED_FUNCTION_65(v74);
  v204 = *(_QWORD *)(v239 - 8);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v75);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v76);
  OUTLINED_FUNCTION_58((uint64_t)&v186 - v77);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FlowTaskMetadata?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v78);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v79);
  OUTLINED_FUNCTION_58((uint64_t)&v186 - v80);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HomeInfo?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v81);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v82);
  OUTLINED_FUNCTION_58((uint64_t)&v186 - v83);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v84);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v85);
  OUTLINED_FUNCTION_109();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v86);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v87);
  OUTLINED_FUNCTION_140();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v88);
  OUTLINED_FUNCTION_102();
  MEMORY[0x24BDAC7A8](v89);
  v91 = (char *)&v186 - v90;
  OUTLINED_FUNCTION_173();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  OUTLINED_FUNCTION_1_3();
  v43[3] = OUTLINED_FUNCTION_5_1();
  v92 = v43 + 3;
  v247[0] = 0uLL;
  OUTLINED_FUNCTION_2_2();
  v43[4] = OUTLINED_FUNCTION_5_1();
  v93 = v43 + 4;
  v247[0] = 0uLL;
  OUTLINED_FUNCTION_2_2();
  v43[5] = OUTLINED_FUNCTION_5_1();
  v187 = v43 + 5;
  v247[0] = 0uLL;
  OUTLINED_FUNCTION_2_2();
  v43[6] = OUTLINED_FUNCTION_5_1();
  v188 = v43 + 6;
  v247[0] = 0uLL;
  OUTLINED_FUNCTION_2_2();
  v43[7] = OUTLINED_FUNCTION_5_1();
  v189 = v43 + 7;
  v247[0] = 0uLL;
  OUTLINED_FUNCTION_2_2();
  v43[10] = OUTLINED_FUNCTION_5_1();
  v94 = OUTLINED_FUNCTION_115((uint64_t)(v43 + 10));
  v95 = OUTLINED_FUNCTION_218(v94);
  v191 = v45;
  OUTLINED_FUNCTION_103(v95, v45);
  v192 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>);
  OUTLINED_FUNCTION_1_3();
  v96 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_142((uint64_t)v91);
  v49[11] = v96;
  v97 = OUTLINED_FUNCTION_91((uint64_t)(v49 + 11));
  OUTLINED_FUNCTION_224(v97, v98, v99, v97);
  OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_79(v100, v101);
  v193 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_83(v44);
  OUTLINED_FUNCTION_168();
  v103 = OUTLINED_FUNCTION_106(v102);
  OUTLINED_FUNCTION_219(v103);
  OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_79(v104, v105);
  v202 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
  OUTLINED_FUNCTION_1_3();
  v106 = OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_83(v46);
  v49[15] = v106;
  v248 = 0;
  memset(v247, 0, sizeof(v247));
  OUTLINED_FUNCTION_79((uint64_t)v247, (uint64_t)&v243);
  v205 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  OUTLINED_FUNCTION_1_3();
  v107 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_83((uint64_t)v247);
  v49[16] = v107;
  v108 = OUTLINED_FUNCTION_107((uint64_t)(v49 + 16));
  v109 = v237;
  v112 = OUTLINED_FUNCTION_137(v108, v110, v111, v108);
  OUTLINED_FUNCTION_79(v112, (uint64_t)v238);
  v206 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_83(v109);
  OUTLINED_FUNCTION_167();
  OUTLINED_FUNCTION_98(v113);
  v209 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>);
  OUTLINED_FUNCTION_1_3();
  v49[18] = OUTLINED_FUNCTION_5_1();
  v203 = v49 + 18;
  v247[0] = 0uLL;
  OUTLINED_FUNCTION_2_2();
  v49[19] = OUTLINED_FUNCTION_5_1();
  v208 = v49 + 19;
  LOBYTE(v247[0]) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  OUTLINED_FUNCTION_1_3();
  v49[20] = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_98((uint64_t)(v49 + 20));
  v217 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>);
  OUTLINED_FUNCTION_1_3();
  v114 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_215(v114);
  v215 = v115;
  v247[0] = 0uLL;
  OUTLINED_FUNCTION_2_2();
  v116 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_191(v116);
  v216 = v117;
  LOBYTE(v247[0]) = 2;
  OUTLINED_FUNCTION_50();
  v118 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_214(v118);
  v120 = OUTLINED_FUNCTION_92(v119);
  v121 = v219;
  v124 = OUTLINED_FUNCTION_184(v120, v122, v123, v120);
  OUTLINED_FUNCTION_84(v124, (uint64_t)v225);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
  OUTLINED_FUNCTION_1_3();
  v125 = OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_108(v121);
  v49[27] = v125;
  v247[0] = 0uLL;
  OUTLINED_FUNCTION_2_2();
  v126 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_170(v126);
  v218 = v127;
  v225 = v49 + 34;
  v247[0] = 0uLL;
  OUTLINED_FUNCTION_2_2();
  v128 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_164(v128);
  v219 = v129;
  v247[0] = 0uLL;
  OUTLINED_FUNCTION_2_2();
  v49[36] = OUTLINED_FUNCTION_5_1();
  v247[0] = 0uLL;
  OUTLINED_FUNCTION_2_2();
  v49[37] = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_2();
  v130 = v194;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_14_0();
  v243 = v195;
  v244 = v130;
  OUTLINED_FUNCTION_2_2();
  *v92 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_2();
  v131 = v196;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_14_0();
  v243 = v197;
  v244 = v131;
  OUTLINED_FUNCTION_2_2();
  *v93 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  swift_bridgeObjectRelease();
  v132 = v187;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v243 = v201;
  v244 = v132;
  OUTLINED_FUNCTION_2_2();
  *v131 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v133 = v188;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v243 = v212;
  v244 = v133;
  OUTLINED_FUNCTION_2_2();
  *v133 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v134 = v189;
  OUTLINED_FUNCTION_1_2();
  v135 = v134;
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v243 = v222;
  v244 = v134;
  OUTLINED_FUNCTION_2_2();
  *v134 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_237();
  v137 = *(_QWORD *)(v136 - 256);
  OUTLINED_FUNCTION_42(v137, v242[2]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_42(v207, v137);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>);
  OUTLINED_FUNCTION_1_3();
  v138 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_221(v134[1]);
  OUTLINED_FUNCTION_34(v137, v139);
  v49[8] = v138;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_139();
  v140 = v213;
  OUTLINED_FUNCTION_42(v213, v242[1]);
  OUTLINED_FUNCTION_1_2();
  v141 = v220;
  OUTLINED_FUNCTION_42((uint64_t)v220, v140);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>);
  OUTLINED_FUNCTION_1_3();
  v142 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_176(v134[1]);
  OUTLINED_FUNCTION_34(v140, v143);
  v49[9] = v142;
  OUTLINED_FUNCTION_6_0();
  v144 = v190;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v243 = v221;
  v244 = v144;
  OUTLINED_FUNCTION_2_2();
  *v135 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_100(v145, v146);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_246();
  v147 = OUTLINED_FUNCTION_196();
  OUTLINED_FUNCTION_60(v147, v191);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_45();
  *v141 = &demangling cache variable for type metadata for AudioSource?;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_100(v148, v149);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_246();
  v150 = OUTLINED_FUNCTION_196();
  OUTLINED_FUNCTION_60(v150, (uint64_t)v236);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_45();
  *v141 = &demangling cache variable for type metadata for AudioDestination?;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_240();
  v152 = *(_QWORD *)(v151 - 256);
  OUTLINED_FUNCTION_42(v152, v241[1]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_42(v224, v152);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_222();
  v236 = v153;
  OUTLINED_FUNCTION_34(v152, v153);
  v49[13] = (uint64_t)&demangling cache variable for type metadata for AudioDestination?;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_104();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_89();
  v49[14] = (uint64_t)&demangling cache variable for type metadata for AudioDestination?;
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_84(v154, v155);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_205();
  OUTLINED_FUNCTION_248();
  OUTLINED_FUNCTION_84(v156, v157);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_156();
  OUTLINED_FUNCTION_96();
  v49[15] = (uint64_t)&demangling cache variable for type metadata for AudioDestination?;
  OUTLINED_FUNCTION_6_0();
  v158 = OUTLINED_FUNCTION_124();
  OUTLINED_FUNCTION_90(v158, v159);
  v160 = v198;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_205();
  OUTLINED_FUNCTION_90((uint64_t)v247, (uint64_t)&v243);
  OUTLINED_FUNCTION_1_3();
  v161 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_59((uint64_t)v247);
  *v160 = v161;
  OUTLINED_FUNCTION_68();
  v162 = v226;
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_123(v163, v164);
  v165 = v199;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_205();
  OUTLINED_FUNCTION_248();
  OUTLINED_FUNCTION_123(v166, v167);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_156();
  OUTLINED_FUNCTION_95();
  *v165 = v161;
  OUTLINED_FUNCTION_6_0();
  v168 = v203;
  OUTLINED_FUNCTION_1_2();
  v238 = OUTLINED_FUNCTION_160((uint64_t)&v245);
  OUTLINED_FUNCTION_14_0();
  v243 = &demangling cache variable for type metadata for SharedContextService?;
  OUTLINED_FUNCTION_1_3();
  *v168 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  v169 = v208;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_205();
  v243 = v227;
  v244 = v228;
  OUTLINED_FUNCTION_2_2();
  *v169 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  v170 = v210;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_205();
  LOBYTE(v243) = v229;
  OUTLINED_FUNCTION_50();
  *v170 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_183((uint64_t)&v246);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_36();
  v49[21] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v171 = v215;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v243 = v171;
  OUTLINED_FUNCTION_1_3();
  *v171 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v172 = v216;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v243 = v230;
  v244 = v172;
  OUTLINED_FUNCTION_2_2();
  *v172 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v173 = v186;
  OUTLINED_FUNCTION_1_2();
  swift_release();
  LOBYTE(v243) = v231;
  OUTLINED_FUNCTION_50();
  *v173 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LODWORD(v243) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  OUTLINED_FUNCTION_1_3();
  v49[28] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  v174 = v218;
  OUTLINED_FUNCTION_1_2();
  swift_release();
  v243 = 0;
  v244 = 0;
  OUTLINED_FUNCTION_2_2();
  *v174 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v243) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  OUTLINED_FUNCTION_1_3();
  v49[30] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v243) = 0;
  OUTLINED_FUNCTION_9_0();
  v49[31] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v243) = 0;
  OUTLINED_FUNCTION_9_0();
  v49[32] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v243) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  OUTLINED_FUNCTION_1_3();
  v49[33] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_145();
  v243 = 0;
  v244 = 0;
  OUTLINED_FUNCTION_2_2();
  v49[34] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_69((uint64_t)&type metadata for DummyLocationProvider);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  OUTLINED_FUNCTION_1_3();
  v175 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_49(v175);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_144();
  v243 = 0;
  v244 = 0;
  OUTLINED_FUNCTION_2_2();
  v49[36] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  v176 = v232;
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_1_2();
  v177 = *(void (**)(uint64_t, uint64_t, uint64_t))(v234 + 16);
  v178 = v233;
  v179 = v235;
  v177(v233, v176, v235);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
  OUTLINED_FUNCTION_1_3();
  v180 = OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_101();
  v49[23] = v180;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_1_2();
  v177(v178, v176, v179);
  OUTLINED_FUNCTION_9_0();
  v181 = OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_101();
  v49[24] = v181;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_163();
  OUTLINED_FUNCTION_155((uint64_t)&v251);
  outlined destroy of AudioSource?(v162, &demangling cache variable for type metadata for HomeInfo?);
  v182 = OUTLINED_FUNCTION_124();
  outlined destroy of AudioSource?(v182, &demangling cache variable for type metadata for SharedContextService?);
  v183 = OUTLINED_FUNCTION_125();
  outlined destroy of AudioSource?(v183, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_117();
  OUTLINED_FUNCTION_74((uint64_t)&v250);
  v184 = OUTLINED_FUNCTION_131();
  outlined destroy of AudioSource?(v184, &demangling cache variable for type metadata for AudioDestination?);
  v185 = OUTLINED_FUNCTION_128();
  outlined destroy of AudioSource?(v185, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_74((uint64_t)v241);
  OUTLINED_FUNCTION_74((uint64_t)v242);
  OUTLINED_FUNCTION_153();
  OUTLINED_FUNCTION_38();
}

void CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:flowTaskMetadata:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  uint64_t v32;
  char v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
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
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_71();
  LOBYTE(v41) = v35;
  LOBYTE(v40) = v33;
  CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:flowTaskMetadata:)(v38, v37, v36, a4, a5, a6, a7, a8, v58, v59, v56, v57, v54, v55, v52, v53, v50, v51, v48,
    v49,
    v46,
    v47,
    v39,
    v32,
    v40,
    (uint64_t)v44,
    v45,
    v42,
    v43,
    v34,
    v41,
    a32,
    v42,
    v43,
    v44,
    v45,
    v46,
    v47,
    v48,
    v49,
    v50,
    v51,
    v52,
    v53);
  OUTLINED_FUNCTION_162();
}

void CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:flowTaskMetadata:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t *a35,uint64_t a36,unsigned __int8 a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,unsigned __int8 a43,uint64_t a44)
{
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t *v143;
  uint64_t *v144;
  uint64_t *v145;
  uint64_t *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t (*v149)(uint64_t, uint64_t);
  uint64_t v150;
  uint64_t (*v151)(uint64_t, uint64_t);
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t *v173;
  uint64_t *v174;
  uint64_t *v175;
  uint64_t *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t *v189;
  uint64_t *v190;
  uint64_t *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t *v199;
  uint64_t v200;
  uint64_t *v201;
  char *v202;
  uint64_t *v203;
  uint64_t *v204;
  uint64_t *v205;
  uint64_t v206;
  uint64_t *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t *v221;
  uint64_t *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t *v226;
  uint64_t *v227;
  uint64_t (*v228)(uint64_t, uint64_t);
  uint64_t v229;
  uint64_t *v230;
  uint64_t v231;
  _QWORD *v232;
  uint64_t *v233;
  uint64_t *v234;
  char v235;
  uint64_t *v236;
  int v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t (*v241)(uint64_t, uint64_t);
  uint64_t v242;
  uint64_t v243;
  id v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250[5];
  uint64_t v251;
  uint64_t *v252;
  uint64_t *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;

  OUTLINED_FUNCTION_85();
  a19 = v48;
  a20 = v49;
  v50 = v44;
  v217 = v51;
  v218 = v52;
  v206 = v53;
  v207 = v54;
  v200 = v55;
  v201 = v56;
  v198 = v57;
  v199 = v58;
  OUTLINED_FUNCTION_165(a44);
  v237 = a43;
  OUTLINED_FUNCTION_201(a42);
  OUTLINED_FUNCTION_178(a41);
  OUTLINED_FUNCTION_177(a40);
  OUTLINED_FUNCTION_157(a39);
  OUTLINED_FUNCTION_204(a38);
  OUTLINED_FUNCTION_202(a37);
  OUTLINED_FUNCTION_250(v59);
  v233 = a35;
  OUTLINED_FUNCTION_186(a34);
  v248 = a33;
  OUTLINED_FUNCTION_23(a32);
  OUTLINED_FUNCTION_197(v60);
  OUTLINED_FUNCTION_67(v61);
  OUTLINED_FUNCTION_176(v62);
  v240 = OUTLINED_FUNCTION_135(a22);
  v239 = *(_QWORD *)(v240 - 8);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v63);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v64);
  v66 = OUTLINED_FUNCTION_63((uint64_t)&v188 - v65);
  OUTLINED_FUNCTION_73(v66, (uint64_t)&a10);
  OUTLINED_FUNCTION_187(v67);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v68);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v69);
  v71 = OUTLINED_FUNCTION_64((uint64_t)&v188 - v70);
  OUTLINED_FUNCTION_73(v71, (uint64_t)&v259);
  v220 = v72;
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v73);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v74);
  OUTLINED_FUNCTION_70();
  v76 = OUTLINED_FUNCTION_65(v75);
  OUTLINED_FUNCTION_73(v76, (uint64_t)&a9);
  v211 = v77;
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v78);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v79);
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_58(v80);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FlowTaskMetadata?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v81);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v82);
  OUTLINED_FUNCTION_58((uint64_t)&v188 - v83);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HomeInfo?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v84);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v85);
  OUTLINED_FUNCTION_58((uint64_t)&v188 - v86);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v87);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v88);
  v90 = (char *)&v188 - v89;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v91);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v92);
  OUTLINED_FUNCTION_109();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v93);
  OUTLINED_FUNCTION_102();
  MEMORY[0x24BDAC7A8](v94);
  OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_173();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  OUTLINED_FUNCTION_1_3();
  v44[3] = OUTLINED_FUNCTION_5_1();
  v95 = v44 + 3;
  v255 = 0;
  v256 = 0;
  OUTLINED_FUNCTION_9_0();
  v44[4] = OUTLINED_FUNCTION_5_1();
  v96 = v44 + 4;
  v255 = 0;
  v256 = 0;
  OUTLINED_FUNCTION_9_0();
  v97 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_211(v97);
  v189 = v98;
  v255 = 0;
  v256 = 0;
  OUTLINED_FUNCTION_9_0();
  v99 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_210(v99);
  v190 = v100;
  v255 = 0;
  v256 = 0;
  OUTLINED_FUNCTION_9_0();
  v101 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_209(v101);
  v191 = v102;
  v255 = 0;
  v256 = 0;
  OUTLINED_FUNCTION_9_0();
  v103 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_231(v103);
  v105 = OUTLINED_FUNCTION_115(v104);
  v106 = OUTLINED_FUNCTION_116(v105);
  v193 = v45;
  v195 = v46;
  OUTLINED_FUNCTION_90(v106, v46);
  v196 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_59(v45);
  OUTLINED_FUNCTION_189();
  v108 = OUTLINED_FUNCTION_91(v107);
  OUTLINED_FUNCTION_87(v108, v109, v110, v108);
  v194 = v47;
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_79(v111, v112);
  v197 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_83(v47);
  OUTLINED_FUNCTION_168();
  v114 = OUTLINED_FUNCTION_106(v113);
  OUTLINED_FUNCTION_262(v114);
  v202 = v90;
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_130(v115, v116);
  v209 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_148((uint64_t)v90);
  OUTLINED_FUNCTION_169();
  OUTLINED_FUNCTION_78(v117);
  OUTLINED_FUNCTION_90((uint64_t)&v255, (uint64_t)&v252);
  v212 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  OUTLINED_FUNCTION_1_3();
  v118 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_59((uint64_t)&v255);
  OUTLINED_FUNCTION_212();
  v120 = OUTLINED_FUNCTION_107(v119);
  __swift_storeEnumTagSinglePayload(v242, 1, 1, v120);
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_130(v121, v122);
  v213 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_136();
  OUTLINED_FUNCTION_167();
  OUTLINED_FUNCTION_98(v123);
  v216 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>);
  OUTLINED_FUNCTION_1_3();
  v124 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_213(v124);
  v210 = v125;
  v255 = 0;
  v256 = 0;
  OUTLINED_FUNCTION_9_0();
  v126 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_232(v126);
  v215 = v127;
  LOBYTE(v255) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  OUTLINED_FUNCTION_1_3();
  v128 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_190(v128);
  OUTLINED_FUNCTION_98(v129);
  v223 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>);
  OUTLINED_FUNCTION_1_3();
  v130 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_215(v130);
  v221 = v131;
  v255 = 0;
  v256 = 0;
  OUTLINED_FUNCTION_9_0();
  v132 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_191(v132);
  v222 = v133;
  LOBYTE(v255) = 2;
  OUTLINED_FUNCTION_2_2();
  v134 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_214(v134);
  v136 = OUTLINED_FUNCTION_92(v135);
  __swift_storeEnumTagSinglePayload(v245, 1, 1, v136);
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_90(v137, v138);
  v225 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_200();
  v50[27] = v118;
  v255 = 0;
  v256 = 0;
  OUTLINED_FUNCTION_9_0();
  v139 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_170(v139);
  v226 = v140;
  v232 = v50 + 34;
  v255 = 0;
  v256 = 0;
  OUTLINED_FUNCTION_9_0();
  v141 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_164(v141);
  OUTLINED_FUNCTION_206(v142);
  v255 = 0;
  v256 = 0;
  OUTLINED_FUNCTION_9_0();
  v50[36] = OUTLINED_FUNCTION_5_1();
  v255 = 0;
  v256 = 0;
  OUTLINED_FUNCTION_9_0();
  v50[37] = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v252 = v199;
  v253 = &demangling cache variable for type metadata for FlowTaskMetadata?;
  OUTLINED_FUNCTION_9_0();
  *v95 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v252 = v201;
  v253 = &demangling cache variable for type metadata for FlowTaskMetadata?;
  OUTLINED_FUNCTION_9_0();
  *v96 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v143 = v189;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_122();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v252 = v207;
  v253 = v143;
  OUTLINED_FUNCTION_9_0();
  demangling cache variable for type metadata for AudioDestination? = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v144 = v190;
  OUTLINED_FUNCTION_1_2();
  v145 = v144;
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v252 = v218;
  v253 = v144;
  OUTLINED_FUNCTION_9_0();
  *v144 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v146 = v191;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_122();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v252 = v230;
  v253 = v146;
  OUTLINED_FUNCTION_9_0();
  *v145 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_203();
  v147 = v208;
  OUTLINED_FUNCTION_42(v208, v251);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_42(v214, v147);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>);
  OUTLINED_FUNCTION_1_3();
  v148 = OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_176(v145[1]);
  OUTLINED_FUNCTION_34(v147, v149);
  v50[8] = v148;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_203();
  v150 = v219;
  OUTLINED_FUNCTION_42(v219, v250[4]);
  OUTLINED_FUNCTION_1_2();
  v151 = v228;
  OUTLINED_FUNCTION_42((uint64_t)v228, v150);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>);
  OUTLINED_FUNCTION_1_3();
  v152 = OUTLINED_FUNCTION_40();
  v228 = (uint64_t (*)(uint64_t, uint64_t))v145[1];
  OUTLINED_FUNCTION_34(v150, v228);
  v50[9] = v152;
  OUTLINED_FUNCTION_6_0();
  v153 = v192;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_122();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v252 = v227;
  v253 = (uint64_t *)v153;
  OUTLINED_FUNCTION_9_0();
  *v145 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_128();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_100(v154, v155);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_159();
  OUTLINED_FUNCTION_60(v153, v195);
  OUTLINED_FUNCTION_1_3();
  v156 = OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_59(v153);
  *(_QWORD *)v151 = v156;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_131();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_100(v157, v158);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_159();
  v159 = v153;
  OUTLINED_FUNCTION_60(v153, (uint64_t)v241);
  OUTLINED_FUNCTION_1_3();
  v160 = OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_59(v153);
  *(_QWORD *)v151 = v160;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_203();
  v161 = v229;
  v162 = v247;
  OUTLINED_FUNCTION_42(v229, v250[1]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_42(v231, v161);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>);
  OUTLINED_FUNCTION_1_3();
  v163 = OUTLINED_FUNCTION_40();
  v241 = *(uint64_t (**)(uint64_t, uint64_t))(v159 + 8);
  OUTLINED_FUNCTION_34(v161, v241);
  v50[13] = v163;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_104();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_89();
  v50[14] = v163;
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_103(v164, v165);
  v166 = v203;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_103(v162, v243);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_111();
  *v166 = v163;
  OUTLINED_FUNCTION_6_0();
  v167 = OUTLINED_FUNCTION_124();
  OUTLINED_FUNCTION_79(v167, v168);
  v169 = v204;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_182();
  OUTLINED_FUNCTION_79((uint64_t)&v255, (uint64_t)&v252);
  OUTLINED_FUNCTION_1_3();
  v170 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_83((uint64_t)&v255);
  *v169 = v170;
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_103(v171, v172);
  v173 = v205;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_103((uint64_t)v169, (uint64_t)v244);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_111();
  *v173 = v170;
  OUTLINED_FUNCTION_6_0();
  v174 = v210;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_122();
  v244 = OUTLINED_FUNCTION_160((uint64_t)&v251);
  OUTLINED_FUNCTION_14_0();
  v252 = v174;
  OUTLINED_FUNCTION_1_3();
  *v173 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  v252 = v233;
  v253 = v234;
  OUTLINED_FUNCTION_9_0();
  *v174 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  LOBYTE(v252) = v235;
  OUTLINED_FUNCTION_2_2();
  *v174 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_183((uint64_t)&v254);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_36();
  v50[21] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v175 = v221;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_122();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v252 = v175;
  OUTLINED_FUNCTION_1_3();
  *v173 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v176 = v222;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_122();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v252 = v236;
  v253 = v176;
  OUTLINED_FUNCTION_9_0();
  *v173 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v177 = v224;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  LOBYTE(v252) = v237;
  OUTLINED_FUNCTION_2_2();
  *v176 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  v178 = v238;
  v179 = v245;
  OUTLINED_FUNCTION_130(v238, v245);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_185();
  OUTLINED_FUNCTION_130(v179, v246);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_136();
  v50[27] = v177;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LODWORD(v252) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  OUTLINED_FUNCTION_1_3();
  v50[28] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  v180 = v226;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_185();
  v252 = 0;
  v253 = 0;
  OUTLINED_FUNCTION_9_0();
  *v180 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v252) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  OUTLINED_FUNCTION_1_3();
  v50[30] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v252) = 0;
  OUTLINED_FUNCTION_50();
  v50[31] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v252) = 0;
  OUTLINED_FUNCTION_50();
  v50[32] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v252) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  OUTLINED_FUNCTION_1_3();
  v50[33] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_145();
  v252 = 0;
  v253 = 0;
  OUTLINED_FUNCTION_9_0();
  v50[34] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_69((uint64_t)&type metadata for DummyLocationProvider);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  OUTLINED_FUNCTION_1_3();
  v181 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_49(v181);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_144();
  v252 = 0;
  v253 = 0;
  OUTLINED_FUNCTION_9_0();
  v50[36] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_133();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
  OUTLINED_FUNCTION_1_3();
  v182 = OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_161();
  v50[23] = v182;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_230();
  OUTLINED_FUNCTION_9_0();
  v183 = OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_161();
  v50[24] = v183;
  OUTLINED_FUNCTION_6_0();
  CurrentRequest.rootRequestId.setter();
  OUTLINED_FUNCTION_155((uint64_t)&v258);
  outlined destroy of AudioSource?(v178, &demangling cache variable for type metadata for FlowTaskMetadata?);
  outlined destroy of AudioSource?(v248, &demangling cache variable for type metadata for HomeInfo?);
  v184 = OUTLINED_FUNCTION_124();
  outlined destroy of AudioSource?(v184, &demangling cache variable for type metadata for SharedContextService?);
  v185 = OUTLINED_FUNCTION_125();
  outlined destroy of AudioSource?(v185, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_117();
  OUTLINED_FUNCTION_74((uint64_t)&v257);
  v186 = OUTLINED_FUNCTION_131();
  outlined destroy of AudioSource?(v186, &demangling cache variable for type metadata for AudioDestination?);
  v187 = OUTLINED_FUNCTION_128();
  outlined destroy of AudioSource?(v187, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_251();
  OUTLINED_FUNCTION_74((uint64_t)&v249);
  OUTLINED_FUNCTION_74((uint64_t)v250);
  OUTLINED_FUNCTION_153();
  OUTLINED_FUNCTION_38();
}

void CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:flowTaskMetadata:voiceAudioSessionId:isSystemApertureEnabled:isInAmbient:positionInSession:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,unsigned __int8 *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,int a45,__int16 a46,uint64_t a47)
{
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
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;

  OUTLINED_FUNCTION_85();
  v65 = v47;
  v66 = v48;
  v63 = v49;
  v64 = v50;
  v61 = v51;
  v62 = v52;
  v59 = v53;
  v60 = v54;
  WORD2(v57) = a46;
  LODWORD(v57) = a45;
  LOBYTE(v56) = a43;
  LOBYTE(v55) = a37;
  swift_allocObject();
  CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:flowTaskMetadata:voiceAudioSessionId:isSystemApertureEnabled:isInAmbient:positionInSession:)(v59, v60, v61, v62, v63, v64, v65, v66, a21, a22, a23, a24, a25, a26, a27, a28, a29, (uint64_t)a30, a31,
    a32,
    a33,
    a34,
    a35,
    a36,
    v55,
    a38,
    a39,
    a40,
    a41,
    a42,
    v56,
    a44,
    v57,
    a47,
    a40,
    a41,
    a38,
    a39,
    v58,
    a35,
    a33,
    a34,
    a31,
    a32,
    a29,
    BYTE4(a29),
    BYTE5(a29),
    a30);
  OUTLINED_FUNCTION_38();
}

void CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:flowTaskMetadata:voiceAudioSessionId:isSystemApertureEnabled:isInAmbient:positionInSession:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,unsigned __int8 a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,unsigned __int8 a43,uint64_t a44,int a45,unsigned __int8 a46,unsigned __int8 a47,unsigned __int8 *a48)
{
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  unsigned __int8 *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t (*v134)(uint64_t, uint64_t);
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t *v146;
  uint64_t *v147;
  uint64_t *v148;
  uint64_t *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t (*v153)(uint64_t, uint64_t);
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t *v175;
  uint64_t *v176;
  uint64_t (*v177)(uint64_t, uint64_t);
  uint64_t *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t *v191;
  uint64_t *v192;
  uint64_t *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t (*v201)(uint64_t, uint64_t);
  uint64_t v202;
  uint64_t (*v203)(uint64_t, uint64_t);
  char *v204;
  uint64_t *v205;
  uint64_t *v206;
  uint64_t *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t (*v210)(uint64_t, uint64_t);
  uint64_t v211;
  uint64_t *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t (*v220)(uint64_t, uint64_t);
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t (*v224)(uint64_t, uint64_t);
  uint64_t *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t *v229;
  uint64_t (*v230)(uint64_t, uint64_t);
  uint64_t (*v231)(uint64_t, uint64_t);
  uint64_t v232;
  uint64_t (*v233)(uint64_t, uint64_t);
  uint64_t v234;
  uint64_t v235;
  _QWORD *v236;
  uint64_t (*v237)(uint64_t, uint64_t);
  uint64_t *v238;
  char v239;
  uint64_t (*v240)(uint64_t, uint64_t);
  int v241;
  uint64_t v242;
  int v243;
  int v244;
  int v245;
  int v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t (*v249)(uint64_t, uint64_t);
  uint64_t v250;
  uint64_t v251;
  id v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257[5];
  uint64_t v258[3];
  uint64_t (*v259)(uint64_t, uint64_t);
  uint64_t *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;

  OUTLINED_FUNCTION_85();
  a19 = v52;
  a20 = v53;
  v54 = v48;
  v219 = v55;
  v220 = v56;
  v208 = v57;
  v210 = v58;
  v202 = v59;
  v203 = v60;
  v200 = v61;
  v201 = v62;
  v246 = a47;
  v245 = a46;
  v244 = a45;
  OUTLINED_FUNCTION_178(a44);
  v241 = a43;
  OUTLINED_FUNCTION_157(a42);
  OUTLINED_FUNCTION_177(a41);
  OUTLINED_FUNCTION_204(a40);
  OUTLINED_FUNCTION_229(a39);
  OUTLINED_FUNCTION_250(a38);
  OUTLINED_FUNCTION_202(a37);
  OUTLINED_FUNCTION_186(v63);
  OUTLINED_FUNCTION_206(a35);
  OUTLINED_FUNCTION_221(a34);
  v256 = a33;
  OUTLINED_FUNCTION_23(a32);
  OUTLINED_FUNCTION_197(v64);
  OUTLINED_FUNCTION_67(v65);
  v233 = v66;
  v221 = a22;
  v67 = a48;
  v248 = OUTLINED_FUNCTION_147();
  v247 = *(_QWORD *)(v248 - 8);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v68);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v69);
  v71 = OUTLINED_FUNCTION_63((uint64_t)&v190 - v70);
  OUTLINED_FUNCTION_73(v71, (uint64_t)&a10);
  v234 = v72;
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v73);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v74);
  OUTLINED_FUNCTION_70();
  v76 = OUTLINED_FUNCTION_64(v75);
  OUTLINED_FUNCTION_73(v76, (uint64_t)&v266);
  v223 = v77;
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v78);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v79);
  OUTLINED_FUNCTION_70();
  v81 = OUTLINED_FUNCTION_65(v80);
  OUTLINED_FUNCTION_73(v81, (uint64_t)&a9);
  v213 = v82;
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v83);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v84);
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_58(v85);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FlowTaskMetadata?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v86);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v87);
  OUTLINED_FUNCTION_58((uint64_t)&v190 - v88);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HomeInfo?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v89);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v90);
  OUTLINED_FUNCTION_58((uint64_t)&v190 - v91);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v92);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v93);
  v95 = (char *)&v190 - v94;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v96);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v97);
  OUTLINED_FUNCTION_109();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v98);
  OUTLINED_FUNCTION_102();
  MEMORY[0x24BDAC7A8](v99);
  OUTLINED_FUNCTION_140();
  v243 = *v67;
  v54[2] = 0;
  v262 = 0;
  v263 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  OUTLINED_FUNCTION_1_3();
  v54[3] = OUTLINED_FUNCTION_5_1();
  v262 = 0;
  v263 = 0;
  OUTLINED_FUNCTION_9_0();
  v54[4] = OUTLINED_FUNCTION_5_1();
  v262 = 0;
  v263 = 0;
  OUTLINED_FUNCTION_9_0();
  v100 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_211(v100);
  v191 = v101;
  v262 = 0;
  v263 = 0;
  OUTLINED_FUNCTION_9_0();
  v102 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_210(v102);
  v192 = v103;
  v262 = 0;
  v263 = 0;
  OUTLINED_FUNCTION_9_0();
  v104 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_209(v104);
  v193 = v105;
  v262 = 0;
  v263 = 0;
  OUTLINED_FUNCTION_9_0();
  v106 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_231(v106);
  v108 = OUTLINED_FUNCTION_115(v107);
  v109 = OUTLINED_FUNCTION_116(v108);
  v195 = v49;
  v197 = v50;
  OUTLINED_FUNCTION_90(v109, v50);
  v198 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_59(v49);
  OUTLINED_FUNCTION_189();
  v111 = OUTLINED_FUNCTION_91(v110);
  OUTLINED_FUNCTION_87(v111, v112, v113, v111);
  v196 = v51;
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_79(v114, v115);
  v199 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_83(v51);
  OUTLINED_FUNCTION_168();
  v117 = OUTLINED_FUNCTION_106(v116);
  OUTLINED_FUNCTION_262(v117);
  v204 = v95;
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_130(v118, v119);
  v211 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_148((uint64_t)v95);
  OUTLINED_FUNCTION_169();
  OUTLINED_FUNCTION_78(v120);
  OUTLINED_FUNCTION_90((uint64_t)&v262, (uint64_t)&v259);
  v214 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  OUTLINED_FUNCTION_1_3();
  v121 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_59((uint64_t)&v262);
  OUTLINED_FUNCTION_212();
  v123 = OUTLINED_FUNCTION_107(v122);
  __swift_storeEnumTagSinglePayload(v250, 1, 1, v123);
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_130(v124, v125);
  v215 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_136();
  OUTLINED_FUNCTION_167();
  OUTLINED_FUNCTION_98(v126);
  v218 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>);
  OUTLINED_FUNCTION_1_3();
  v127 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_213(v127);
  v212 = v128;
  v262 = 0;
  v263 = 0;
  OUTLINED_FUNCTION_9_0();
  v129 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_232(v129);
  v217 = v130;
  LOBYTE(v262) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  OUTLINED_FUNCTION_1_3();
  v131 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_190(v131);
  OUTLINED_FUNCTION_98(v132);
  v226 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>);
  OUTLINED_FUNCTION_1_3();
  v133 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_215(v133);
  v224 = v134;
  v262 = 0;
  v263 = 0;
  OUTLINED_FUNCTION_9_0();
  v135 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_191(v135);
  v225 = v136;
  LOBYTE(v262) = 2;
  OUTLINED_FUNCTION_2_2();
  v137 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_214(v137);
  v139 = OUTLINED_FUNCTION_92(v138);
  __swift_storeEnumTagSinglePayload(v253, 1, 1, v139);
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_90(v140, v141);
  v228 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_200();
  v54[27] = v121;
  v262 = 0;
  v263 = 0;
  OUTLINED_FUNCTION_9_0();
  v142 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_170(v142);
  OUTLINED_FUNCTION_199(v143);
  v236 = v54 + 34;
  v262 = 0;
  v263 = 0;
  OUTLINED_FUNCTION_9_0();
  v144 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_164(v144);
  OUTLINED_FUNCTION_207(v145);
  v262 = 0;
  v263 = 0;
  OUTLINED_FUNCTION_9_0();
  v54[36] = OUTLINED_FUNCTION_5_1();
  v262 = 0;
  v263 = 0;
  OUTLINED_FUNCTION_9_0();
  v54[37] = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v259 = v201;
  v260 = &demangling cache variable for type metadata for FlowTaskMetadata?;
  OUTLINED_FUNCTION_9_0();
  v54[3] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v259 = v203;
  v260 = &demangling cache variable for type metadata for FlowTaskMetadata?;
  OUTLINED_FUNCTION_9_0();
  v54[4] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v146 = v191;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_122();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v259 = v210;
  v260 = v146;
  OUTLINED_FUNCTION_9_0();
  demangling cache variable for type metadata for AudioDestination? = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v147 = v192;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_122();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v259 = v220;
  v260 = v147;
  OUTLINED_FUNCTION_9_0();
  demangling cache variable for type metadata for AudioDestination? = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v148 = v193;
  OUTLINED_FUNCTION_1_2();
  v149 = v148;
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v259 = v233;
  v260 = v148;
  OUTLINED_FUNCTION_9_0();
  *v148 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_203();
  v150 = v209;
  OUTLINED_FUNCTION_42(v209, v258[2]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_42(v216, v150);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>);
  OUTLINED_FUNCTION_1_3();
  v151 = OUTLINED_FUNCTION_40();
  v233 = (uint64_t (*)(uint64_t, uint64_t))v148[1];
  OUTLINED_FUNCTION_34(v150, v233);
  v54[8] = v151;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_203();
  v152 = v222;
  OUTLINED_FUNCTION_42(v222, v258[1]);
  OUTLINED_FUNCTION_1_2();
  v153 = v231;
  OUTLINED_FUNCTION_42((uint64_t)v231, v152);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>);
  OUTLINED_FUNCTION_1_3();
  v154 = OUTLINED_FUNCTION_40();
  v231 = (uint64_t (*)(uint64_t, uint64_t))v148[1];
  OUTLINED_FUNCTION_34(v152, v231);
  v54[9] = v154;
  OUTLINED_FUNCTION_6_0();
  v155 = v194;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_122();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v259 = v230;
  v260 = (uint64_t *)v155;
  OUTLINED_FUNCTION_9_0();
  *v149 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_128();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_100(v156, v157);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_159();
  OUTLINED_FUNCTION_60(v155, v197);
  OUTLINED_FUNCTION_1_3();
  v158 = OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_59(v155);
  *(_QWORD *)v153 = v158;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_131();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_100(v159, v160);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_159();
  v161 = v155;
  OUTLINED_FUNCTION_60(v155, (uint64_t)v249);
  OUTLINED_FUNCTION_1_3();
  v162 = OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_59(v155);
  *(_QWORD *)v153 = v162;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_203();
  v163 = v232;
  v164 = v255;
  OUTLINED_FUNCTION_42(v232, v257[3]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_42(v235, v163);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>);
  OUTLINED_FUNCTION_1_3();
  v165 = OUTLINED_FUNCTION_40();
  v249 = *(uint64_t (**)(uint64_t, uint64_t))(v161 + 8);
  OUTLINED_FUNCTION_34(v163, v249);
  v54[13] = v165;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_104();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_89();
  v54[14] = v165;
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_103(v166, v167);
  v168 = v205;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_103(v164, v251);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_111();
  *v168 = v165;
  OUTLINED_FUNCTION_6_0();
  v169 = OUTLINED_FUNCTION_124();
  OUTLINED_FUNCTION_79(v169, v170);
  v171 = v206;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_182();
  OUTLINED_FUNCTION_79((uint64_t)&v262, (uint64_t)&v259);
  OUTLINED_FUNCTION_1_3();
  v172 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_83((uint64_t)&v262);
  *v171 = v172;
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_103(v173, v174);
  v175 = v207;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_103((uint64_t)v171, (uint64_t)v252);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_111();
  *v175 = v172;
  OUTLINED_FUNCTION_6_0();
  v176 = v212;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_122();
  v252 = OUTLINED_FUNCTION_160((uint64_t)v258);
  OUTLINED_FUNCTION_14_0();
  v259 = (uint64_t (*)(uint64_t, uint64_t))v176;
  OUTLINED_FUNCTION_1_3();
  *v175 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  v259 = v237;
  v260 = v238;
  OUTLINED_FUNCTION_9_0();
  *v176 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  LOBYTE(v259) = v239;
  OUTLINED_FUNCTION_2_2();
  *v176 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_183((uint64_t)&v261);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_36();
  v54[21] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v177 = v224;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_122();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v259 = v177;
  OUTLINED_FUNCTION_1_3();
  *v175 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v178 = v225;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_122();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14_0();
  v259 = v240;
  v260 = v178;
  OUTLINED_FUNCTION_9_0();
  *v175 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37();
  v179 = v227;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_32();
  LOBYTE(v259) = v241;
  OUTLINED_FUNCTION_2_2();
  *v178 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  v180 = v242;
  v181 = v253;
  OUTLINED_FUNCTION_130(v242, v253);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_185();
  OUTLINED_FUNCTION_130(v181, v254);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_136();
  v54[27] = v179;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LODWORD(v259) = v244;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  OUTLINED_FUNCTION_1_3();
  v54[28] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  v182 = v229;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_185();
  v259 = 0;
  v260 = 0;
  OUTLINED_FUNCTION_9_0();
  *v182 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v259) = v245;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  OUTLINED_FUNCTION_1_3();
  v54[30] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v259) = 0;
  OUTLINED_FUNCTION_50();
  v54[31] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v259) = v246;
  OUTLINED_FUNCTION_50();
  v54[32] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v259) = v243;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  OUTLINED_FUNCTION_1_3();
  v54[33] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_145();
  v259 = 0;
  v260 = 0;
  OUTLINED_FUNCTION_9_0();
  v54[34] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_69((uint64_t)&type metadata for DummyLocationProvider);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  OUTLINED_FUNCTION_1_3();
  v183 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_49(v183);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_144();
  v259 = 0;
  v260 = 0;
  OUTLINED_FUNCTION_9_0();
  v54[36] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_133();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
  OUTLINED_FUNCTION_1_3();
  v184 = OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_161();
  v54[23] = v184;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_230();
  OUTLINED_FUNCTION_9_0();
  v185 = OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_161();
  v54[24] = v185;
  OUTLINED_FUNCTION_6_0();
  CurrentRequest.rootRequestId.setter();
  OUTLINED_FUNCTION_155((uint64_t)&v265);
  outlined destroy of AudioSource?(v180, &demangling cache variable for type metadata for FlowTaskMetadata?);
  outlined destroy of AudioSource?(v256, &demangling cache variable for type metadata for HomeInfo?);
  v186 = OUTLINED_FUNCTION_124();
  outlined destroy of AudioSource?(v186, &demangling cache variable for type metadata for SharedContextService?);
  v187 = OUTLINED_FUNCTION_125();
  outlined destroy of AudioSource?(v187, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_117();
  OUTLINED_FUNCTION_74((uint64_t)&v264);
  v188 = OUTLINED_FUNCTION_131();
  outlined destroy of AudioSource?(v188, &demangling cache variable for type metadata for AudioDestination?);
  v189 = OUTLINED_FUNCTION_128();
  outlined destroy of AudioSource?(v189, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_251();
  OUTLINED_FUNCTION_74((uint64_t)&v255);
  OUTLINED_FUNCTION_74((uint64_t)v257);
  OUTLINED_FUNCTION_153();
  OUTLINED_FUNCTION_38();
}

#error "2132B6D60: call analysis failed (funcsize=11)"

void CurrentRequest.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
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
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t *v134;
  uint64_t *v135;
  uint64_t v136;
  uint64_t *v137;
  uint64_t *v138;
  uint64_t v139;
  uint64_t *v140;
  uint64_t *v141;
  uint64_t *v142;
  uint64_t *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t KeyPath;
  uint64_t v151;
  int v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  unint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  char v185;
  char v186;
  char v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void (*v198)(char *, uint64_t, uint64_t);
  uint64_t v199;
  void (*v200)(uint64_t);
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t *v206;
  uint64_t *v207;
  uint64_t *v208;
  uint64_t *v209;
  uint64_t *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  _QWORD *v227;
  uint64_t v228;
  uint64_t v229;
  char *v230;
  char *v231;
  uint64_t v232;
  char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  _QWORD *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  char *v244;
  uint64_t v245;
  uint64_t *v246;
  uint64_t v247;
  unint64_t v248;
  uint64_t v249;
  uint64_t v250;
  __int128 v251;
  __int128 v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  _BYTE v257[16];

  OUTLINED_FUNCTION_85();
  a19 = v23;
  a20 = v24;
  v25 = v20;
  v205 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ExecutionLocation?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v28);
  v233 = (char *)&v205 - v29;
  v30 = OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_73(v30, (uint64_t)&a13);
  v235 = v31;
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_12_0();
  v34 = MEMORY[0x24BDAC7A8](v33);
  v244 = (char *)&v205 - v35;
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_58(v36);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ResponseMode?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_13();
  v39 = OUTLINED_FUNCTION_63(v38);
  OUTLINED_FUNCTION_73(v39, (uint64_t)v257);
  v232 = v40;
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_58(v43);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for InteractionType?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v44);
  OUTLINED_FUNCTION_13();
  v46 = OUTLINED_FUNCTION_64(v45);
  OUTLINED_FUNCTION_73(v46, (uint64_t)&v239);
  v220 = v47;
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v48);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v49);
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_58(v50);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for InputOrigin?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v51);
  OUTLINED_FUNCTION_13();
  v211 = OUTLINED_FUNCTION_65(v52);
  v215 = *(_QWORD *)(v211 - 8);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v53);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v54);
  OUTLINED_FUNCTION_58((uint64_t)&v205 - v55);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FlowTaskMetadata?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v56);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v57);
  OUTLINED_FUNCTION_58((uint64_t)&v205 - v58);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HomeInfo?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v59);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v60);
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_58(v61);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_6();
  v63 = MEMORY[0x24BDAC7A8](v62);
  v65 = (char *)&v205 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v63);
  v67 = (char *)&v205 - v66;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v68);
  OUTLINED_FUNCTION_141();
  MEMORY[0x24BDAC7A8](v69);
  v71 = (char *)&v205 - v70;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v72);
  OUTLINED_FUNCTION_102();
  MEMORY[0x24BDAC7A8](v73);
  v75 = (char *)&v205 - v74;
  OUTLINED_FUNCTION_173();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  OUTLINED_FUNCTION_1_3();
  v20[3] = OUTLINED_FUNCTION_5_1();
  v206 = v20 + 3;
  v251 = 0uLL;
  OUTLINED_FUNCTION_2_2();
  v20[4] = OUTLINED_FUNCTION_5_1();
  v207 = v20 + 4;
  v251 = 0uLL;
  OUTLINED_FUNCTION_2_2();
  v76 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_211(v76);
  v208 = v77;
  v251 = 0uLL;
  OUTLINED_FUNCTION_2_2();
  v78 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_210(v78);
  v209 = v79;
  v251 = 0uLL;
  OUTLINED_FUNCTION_2_2();
  v80 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_209(v80);
  v210 = v81;
  v251 = 0uLL;
  OUTLINED_FUNCTION_2_2();
  v82 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_231(v82);
  v84 = OUTLINED_FUNCTION_115(v83);
  __swift_storeEnumTagSinglePayload((uint64_t)v75, 1, 1, v84);
  OUTLINED_FUNCTION_72((uint64_t)v75, v22);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>);
  OUTLINED_FUNCTION_172();
  OUTLINED_FUNCTION_152(v85, (uint64_t)&v228);
  v217 = v22;
  MockablePublished.init(wrappedValue:)();
  v216 = v75;
  OUTLINED_FUNCTION_88((uint64_t)v75);
  OUTLINED_FUNCTION_189();
  v87 = OUTLINED_FUNCTION_91(v86);
  v90 = OUTLINED_FUNCTION_193(v87, v88, v89, v87);
  OUTLINED_FUNCTION_84(v90, v21);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
  OUTLINED_FUNCTION_172();
  OUTLINED_FUNCTION_152(v91, (uint64_t)&v229);
  v222 = v21;
  MockablePublished.init(wrappedValue:)();
  v221 = v71;
  OUTLINED_FUNCTION_108((uint64_t)v71);
  OUTLINED_FUNCTION_168();
  v93 = OUTLINED_FUNCTION_106(v92);
  v96 = OUTLINED_FUNCTION_184(v93, v94, v95, v93);
  OUTLINED_FUNCTION_79(v96, (uint64_t)v65);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
  OUTLINED_FUNCTION_172();
  OUTLINED_FUNCTION_152(v97, (uint64_t)&v241);
  v231 = v65;
  MockablePublished.init(wrappedValue:)();
  v230 = v67;
  OUTLINED_FUNCTION_83((uint64_t)v67);
  OUTLINED_FUNCTION_169();
  OUTLINED_FUNCTION_78(v98);
  v99 = OUTLINED_FUNCTION_261();
  OUTLINED_FUNCTION_79(v99, v100);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  OUTLINED_FUNCTION_172();
  OUTLINED_FUNCTION_152(v101, (uint64_t)&v244);
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_83((uint64_t)&v251);
  OUTLINED_FUNCTION_212();
  v103 = OUTLINED_FUNCTION_107(v102);
  v104 = v240;
  OUTLINED_FUNCTION_86(v103, v105, v106, v103);
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_79(v107, v108);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
  OUTLINED_FUNCTION_172();
  OUTLINED_FUNCTION_152(v109, (uint64_t)&v246);
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_83(v104);
  OUTLINED_FUNCTION_167();
  OUTLINED_FUNCTION_98(v110);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>);
  OUTLINED_FUNCTION_172();
  OUTLINED_FUNCTION_152(v111, (uint64_t)&v247);
  v112 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_213(v112);
  v223 = v113;
  v251 = 0uLL;
  OUTLINED_FUNCTION_2_2();
  v114 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_232(v114);
  OUTLINED_FUNCTION_229(v115);
  LOBYTE(v251) = 2;
  v116 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  OUTLINED_FUNCTION_1_3();
  v117 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_190(v117);
  OUTLINED_FUNCTION_98(v118);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>);
  OUTLINED_FUNCTION_172();
  OUTLINED_FUNCTION_152(v119, (uint64_t)&v250);
  v120 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_215(v120);
  OUTLINED_FUNCTION_201(v121);
  v251 = 0uLL;
  OUTLINED_FUNCTION_2_2();
  v122 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_191(v122);
  OUTLINED_FUNCTION_178(v123);
  LOBYTE(v251) = 2;
  v218 = v116;
  swift_allocObject();
  v124 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_214(v124);
  v126 = OUTLINED_FUNCTION_92(v125);
  v127 = v242;
  __swift_storeEnumTagSinglePayload(v242, 1, 1, v126);
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_72(v128, v129);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
  OUTLINED_FUNCTION_172();
  OUTLINED_FUNCTION_152(v130, (uint64_t)&v252);
  v131 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_88(v127);
  v25[27] = v131;
  v227 = v25 + 27;
  v251 = 0uLL;
  OUTLINED_FUNCTION_2_2();
  v25[29] = OUTLINED_FUNCTION_5_1();
  v251 = 0uLL;
  OUTLINED_FUNCTION_2_2();
  v25[34] = OUTLINED_FUNCTION_5_1();
  v251 = 0uLL;
  OUTLINED_FUNCTION_2_2();
  v25[36] = OUTLINED_FUNCTION_5_1();
  v251 = 0uLL;
  OUTLINED_FUNCTION_2_2();
  v132 = OUTLINED_FUNCTION_5_1();
  v239 = v25 + 29;
  v25[37] = v132;
  swift_getKeyPath();
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_241();
  v133 = v247;
  v134 = (uint64_t *)v248;
  v135 = v206;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_127();
  v245 = v133;
  v246 = v134;
  OUTLINED_FUNCTION_2_2();
  *v135 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_241();
  v136 = v247;
  v137 = (uint64_t *)v248;
  v138 = v207;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_127();
  v245 = v136;
  v246 = v137;
  OUTLINED_FUNCTION_2_2();
  *v138 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_241();
  v139 = v247;
  v140 = (uint64_t *)v248;
  v141 = v208;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_127();
  v245 = v139;
  v246 = v140;
  OUTLINED_FUNCTION_2_2();
  *v141 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_158();
  v142 = v209;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_179();
  v245 = v139;
  v246 = v141;
  OUTLINED_FUNCTION_2_2();
  *v142 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_158();
  v143 = v210;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_179();
  v245 = v139;
  v246 = v141;
  OUTLINED_FUNCTION_2_2();
  *v143 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  v144 = v212;
  OUTLINED_FUNCTION_119();
  v145 = v144;
  v146 = v211;
  swift_release();
  if (__swift_getEnumTagSinglePayload(v144, 1, v146) == 1)
  {
    v147 = v215;
    v148 = v213;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v215 + 104))(v213, *MEMORY[0x24BEA8A28], v146);
    outlined destroy of AudioSource?(v145, &demangling cache variable for type metadata for InputOrigin?);
  }
  else
  {
    v147 = v215;
    v148 = v213;
    OUTLINED_FUNCTION_195(v213, v145, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v215 + 32));
  }
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_195(v214, v148, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v147 + 16));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>);
  OUTLINED_FUNCTION_1_3();
  v149 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_244(*(uint64_t (**)(uint64_t, uint64_t))(v147 + 8));
  v25[8] = v149;
  OUTLINED_FUNCTION_6_0();
  KeyPath = swift_getKeyPath();
  v151 = v224;
  OUTLINED_FUNCTION_119();
  OUTLINED_FUNCTION_55();
  v152 = OUTLINED_FUNCTION_247(v151, 1, (uint64_t)&v239);
  v153 = v232;
  v154 = v226;
  v155 = v220;
  v156 = v225;
  if (v152 == 1)
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v220 + 104))(v225, *MEMORY[0x24BEA8C38], KeyPath);
    outlined destroy of AudioSource?(v151, &demangling cache variable for type metadata for InteractionType?);
  }
  else
  {
    OUTLINED_FUNCTION_195(v225, v151, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v220 + 32));
  }
  v224 = (uint64_t)(v239 + 5);
  OUTLINED_FUNCTION_165((uint64_t)(v239 + 7));
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_195(v219, v156, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v155 + 16));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>);
  OUTLINED_FUNCTION_1_3();
  v157 = OUTLINED_FUNCTION_43();
  (*(void (**)(uint64_t, uint64_t))(v155 + 8))(v156, KeyPath);
  v25[9] = v157;
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_158();
  OUTLINED_FUNCTION_1_2();
  swift_release();
  v245 = v157;
  v246 = (uint64_t *)KeyPath;
  OUTLINED_FUNCTION_2_2();
  v25[10] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  v158 = (uint64_t)v216;
  Builder.subscript.getter();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_1_2();
  swift_release();
  OUTLINED_FUNCTION_72(v158, v217);
  OUTLINED_FUNCTION_1_3();
  v159 = OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_88(v158);
  v25[11] = v159;
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  v160 = (uint64_t)v221;
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_1_2();
  swift_release();
  OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_72(v161, v162);
  OUTLINED_FUNCTION_1_3();
  v163 = OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_88(v160);
  v25[12] = v163;
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_119();
  OUTLINED_FUNCTION_55();
  if (OUTLINED_FUNCTION_247(v154, 1, (uint64_t)v257) == 1)
  {
    v164 = v233;
    v165 = v228;
    static ResponseMode.displayForward.getter();
    outlined destroy of AudioSource?(v154, &demangling cache variable for type metadata for ResponseMode?);
  }
  else
  {
    v164 = v233;
    v165 = v228;
    OUTLINED_FUNCTION_195(v228, v154, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v153 + 32));
  }
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_195(v229, v165, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v153 + 16));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>);
  OUTLINED_FUNCTION_1_3();
  v166 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_244(*(uint64_t (**)(uint64_t, uint64_t))(v153 + 8));
  v25[13] = v166;
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_119();
  OUTLINED_FUNCTION_55();
  if (v249 == 2)
  {
    v251 = 0u;
    v252 = 0u;
    v253 = 1;
    v254 = 0;
    v255 = 0;
    v256 = 0;
    outlined destroy of AudioSource?((uint64_t)&v247, &demangling cache variable for type metadata for MultiUserState?);
  }
  else
  {
    outlined init with take of MultiUserState((uint64_t)&v247, (uint64_t)&v251);
  }
  v167 = (uint64_t)v164;
  OUTLINED_FUNCTION_1_2();
  v168 = OUTLINED_FUNCTION_261();
  outlined init with copy of MultiUserState(v168, v169);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_89();
  v25[14] = v166;
  OUTLINED_FUNCTION_254();
  swift_getKeyPath();
  v170 = (uint64_t)v230;
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_1_2();
  swift_release();
  OUTLINED_FUNCTION_72(v170, (uint64_t)v231);
  OUTLINED_FUNCTION_1_3();
  v171 = OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_88(v170);
  v25[15] = v171;
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_1_2();
  swift_release();
  v172 = OUTLINED_FUNCTION_261();
  OUTLINED_FUNCTION_72(v172, v173);
  OUTLINED_FUNCTION_1_3();
  v174 = OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_88((uint64_t)&v251);
  v25[16] = v174;
  OUTLINED_FUNCTION_254();
  swift_getKeyPath();
  v175 = v240;
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_1_2();
  swift_release();
  OUTLINED_FUNCTION_72(v175, v241);
  OUTLINED_FUNCTION_1_3();
  v176 = OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_88(v175);
  v25[17] = v176;
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_55();
  v177 = v247;
  OUTLINED_FUNCTION_1_2();
  swift_release();
  v245 = v177;
  OUTLINED_FUNCTION_1_3();
  v25[18] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_158();
  OUTLINED_FUNCTION_1_2();
  swift_release();
  v245 = v177;
  v246 = &demangling cache variable for type metadata for HomeInfo?;
  OUTLINED_FUNCTION_2_2();
  v25[19] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_55();
  LOBYTE(v177) = v247;
  OUTLINED_FUNCTION_1_2();
  swift_release();
  LOBYTE(v245) = v177;
  OUTLINED_FUNCTION_50();
  v25[20] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_119();
  OUTLINED_FUNCTION_55();
  if (*((_QWORD *)&v251 + 1))
    v178 = v251;
  else
    v178 = 0;
  if (*((_QWORD *)&v251 + 1))
    v179 = *((_QWORD *)&v251 + 1);
  else
    v179 = 0xE000000000000000;
  OUTLINED_FUNCTION_1_2();
  v247 = v178;
  v248 = v179;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  OUTLINED_FUNCTION_1_3();
  v25[21] = OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_55();
  v180 = v247;
  OUTLINED_FUNCTION_1_2();
  swift_release();
  v245 = v180;
  OUTLINED_FUNCTION_1_3();
  v25[22] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_158();
  OUTLINED_FUNCTION_1_2();
  swift_release();
  v245 = v180;
  v246 = (uint64_t *)v179;
  OUTLINED_FUNCTION_2_2();
  v25[25] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_55();
  LOBYTE(v180) = v247;
  OUTLINED_FUNCTION_1_2();
  swift_release();
  LOBYTE(v245) = v180;
  OUTLINED_FUNCTION_50();
  v25[26] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  v181 = v242;
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_1_2();
  swift_release();
  OUTLINED_FUNCTION_72(v181, v243);
  OUTLINED_FUNCTION_1_3();
  v182 = OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_88(v181);
  v25[27] = v182;
  OUTLINED_FUNCTION_6_0();
  v183 = swift_getKeyPath();
  OUTLINED_FUNCTION_119();
  OUTLINED_FUNCTION_55();
  if (BYTE4(v251))
    v184 = 0;
  else
    v184 = v251;
  OUTLINED_FUNCTION_1_2();
  LODWORD(v247) = v184;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  OUTLINED_FUNCTION_1_3();
  v25[28] = OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_158();
  OUTLINED_FUNCTION_1_2();
  swift_release();
  v245 = v184;
  v246 = (uint64_t *)v183;
  OUTLINED_FUNCTION_2_2();
  v25[29] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_119();
  OUTLINED_FUNCTION_55();
  v185 = v251 & 1;
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v247) = v185;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  OUTLINED_FUNCTION_1_3();
  v25[30] = OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_119();
  OUTLINED_FUNCTION_245();
  v186 = v251 & 1;
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v247) = v186;
  OUTLINED_FUNCTION_9_0();
  v25[31] = OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_119();
  OUTLINED_FUNCTION_245();
  v187 = v251 & 1;
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v247) = v187;
  OUTLINED_FUNCTION_9_0();
  v25[32] = OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_6_0();
  v188 = swift_getKeyPath();
  OUTLINED_FUNCTION_119();
  OUTLINED_FUNCTION_55();
  if (v251 == 3)
    v189 = 0;
  else
    v189 = v251;
  OUTLINED_FUNCTION_1_2();
  LOBYTE(v247) = v189;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  OUTLINED_FUNCTION_1_3();
  v25[33] = OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_158();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_145();
  v245 = v189;
  v246 = (uint64_t *)v188;
  OUTLINED_FUNCTION_2_2();
  v25[34] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  *((_QWORD *)&v252 + 1) = &type metadata for DummyLocationProvider;
  v253 = (uint64_t)&protocol witness table for DummyLocationProvider;
  v190 = OUTLINED_FUNCTION_261();
  outlined init with copy of SiriLocationProvider(v190, v191);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  OUTLINED_FUNCTION_1_3();
  v192 = OUTLINED_FUNCTION_80();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v251);
  v25[35] = v192;
  OUTLINED_FUNCTION_254();
  swift_getKeyPath();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_158();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_144();
  v245 = v192;
  v246 = (uint64_t *)v188;
  OUTLINED_FUNCTION_2_2();
  v25[36] = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_119();
  OUTLINED_FUNCTION_55();
  v193 = (uint64_t)v164;
  v194 = v238;
  if (__swift_getEnumTagSinglePayload(v193, 1, v238) == 1)
  {
    v195 = v234;
    static ExecutionLocation.unknown.getter();
    outlined destroy of AudioSource?(v167, &demangling cache variable for type metadata for ExecutionLocation?);
    v196 = v236;
    v197 = v235;
  }
  else
  {
    v197 = v235;
    v195 = v234;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v235 + 32))(v234, v167, v194);
    v196 = v236;
  }
  OUTLINED_FUNCTION_1_2();
  v198 = *(void (**)(char *, uint64_t, uint64_t))(v197 + 16);
  v198(v244, v195, v194);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
  OUTLINED_FUNCTION_1_3();
  v199 = OUTLINED_FUNCTION_40();
  v200 = *(void (**)(uint64_t))(v197 + 8);
  v201 = OUTLINED_FUNCTION_256();
  v200(v201);
  v25[23] = v199;
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  v202 = v197;
  OUTLINED_FUNCTION_119();
  OUTLINED_FUNCTION_245();
  if (__swift_getEnumTagSinglePayload(v196, 1, v194) == 1)
  {
    v203 = v237;
    static ExecutionLocation.unknown.getter();
    outlined destroy of AudioSource?(v196, &demangling cache variable for type metadata for ExecutionLocation?);
  }
  else
  {
    v203 = v237;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v202 + 32))(v237, v196, v194);
  }
  OUTLINED_FUNCTION_1_2();
  v198(v244, v203, v194);
  OUTLINED_FUNCTION_9_0();
  v204 = OUTLINED_FUNCTION_44();
  ((void (*)(uint64_t, uint64_t))v200)(v203, v194);
  v25[24] = v204;
  OUTLINED_FUNCTION_6_0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_55();
  CurrentRequest.rootRequestId.setter();
  OUTLINED_FUNCTION_149();
  OUTLINED_FUNCTION_153();
  OUTLINED_FUNCTION_38();
}

void outlined destroy of AudioSource?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_242(a1, a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_8();
}

uint64_t outlined init with take of MultiUserState(uint64_t a1, uint64_t a2)
{
  __swift_memcpy64_8(a2, a1);
  return a2;
}

uint64_t CurrentRequest.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t CurrentRequest.__deallocating_deinit()
{
  CurrentRequest.deinit();
  return swift_deallocClassInstance();
}

unint64_t lazy protocol witness table accessor for type RequestPositionInSession and conformance RequestPositionInSession()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type RequestPositionInSession and conformance RequestPositionInSession;
  if (!lazy protocol witness table cache variable for type RequestPositionInSession and conformance RequestPositionInSession)
  {
    result = MEMORY[0x2199B062C](&protocol conformance descriptor for RequestPositionInSession, &type metadata for RequestPositionInSession);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type RequestPositionInSession and conformance RequestPositionInSession);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type RequestPositionInSession and conformance RequestPositionInSession;
  if (!lazy protocol witness table cache variable for type RequestPositionInSession and conformance RequestPositionInSession)
  {
    result = MEMORY[0x2199B062C](&protocol conformance descriptor for RequestPositionInSession, &type metadata for RequestPositionInSession);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type RequestPositionInSession and conformance RequestPositionInSession);
  }
  return result;
}

void base witness table accessor for SiriEnvironmentProvider in CurrentRequest()
{
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
}

uint64_t (*protocol witness for MockableEnvironmentProvider.mock.modify in conformance CurrentRequest())()
{
  swift_beginAccess();
  return RefreshableSharedContext.sharedContext.modify;
}

uint64_t protocol witness for MockableEnvironmentProvider.mock<A>(override:run:) in conformance CurrentRequest()
{
  return MockableEnvironmentProvider.mock<A>(override:run:)();
}

uint64_t protocol witness for MockableEnvironmentProvider.install(_:) in conformance CurrentRequest()
{
  return MockableEnvironmentProvider.install(_:)();
}

uint64_t protocol witness for static MockableEnvironmentProvider.adjustMock(_:) in conformance CurrentRequest()
{
  return swift_retain();
}

uint64_t protocol witness for Buildable.init(_:) in conformance CurrentRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CurrentRequest.__allocating_init(_:)();
  *a1 = result;
  return result;
}

void base witness table accessor for ObservableObject in CurrentRequest()
{
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
}

void lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  if (!*a1)
  {
    v4 = type metadata accessor for CurrentRequest();
    atomic_store(MEMORY[0x2199B062C](a2, v4), a1);
  }
  OUTLINED_FUNCTION_8();
}

uint64_t protocol witness for static SiriEnvironmentProvider.defaultScope.getter in conformance CurrentRequest()
{
  return static SiriEnvironmentProvider.defaultScope.getter();
}

uint64_t associated type witness table accessor for ObservableObject.ObjectWillChangePublisher : Publisher in CurrentRequest()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance CurrentRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

void sub_2132B86AC()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_77();
  *v0 = SiriEnvironment.currentRequest.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B86D0()
{
  CurrentRequest.$refId.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B86EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
}

void sub_2132B8710()
{
  CurrentRequest.$aceId.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B872C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
}

void sub_2132B8750()
{
  CurrentRequest.$executionRequestId.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B876C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
}

void sub_2132B8790()
{
  CurrentRequest.$sessionHandoffContinuityID.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B87AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
}

void sub_2132B87D0()
{
  CurrentRequest.$peerName.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B87EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
}

void sub_2132B8810()
{
  CurrentRequest.$inputOrigin.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B882C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<InputOrigin>.Publisher);
}

void sub_2132B8850()
{
  CurrentRequest.$interactionType.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B886C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<InteractionType>.Publisher);
}

void sub_2132B8890()
{
  CurrentRequest.$interactionId.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B88AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
}

void sub_2132B88D0()
{
  CurrentRequest.$audioSource.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B88EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<AudioSource?>.Publisher);
}

void sub_2132B8910()
{
  CurrentRequest.$audioDestination.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B892C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<AudioDestination?>.Publisher);
}

void sub_2132B8950()
{
  CurrentRequest.$responseMode.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B896C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<ResponseMode>.Publisher);
}

void sub_2132B8990()
{
  CurrentRequest.$multiUserState.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B89AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<MultiUserState>.Publisher);
}

void sub_2132B89D0()
{
  CurrentRequest.$bargeInContext.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B89EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<BargeInContext?>.Publisher);
}

void sub_2132B8A10()
{
  CurrentRequest.$sharedContextService.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B8A2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<SharedContextService?>.Publisher);
}

void sub_2132B8A50()
{
  CurrentRequest.$originatingHome.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B8A6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<HomeInfo?>.Publisher);
}

void sub_2132B8A90()
{
  CurrentRequest.$speechPackage.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B8AAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>.Publisher);
}

void sub_2132B8AD0()
{
  CurrentRequest.$resultCandidateId.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B8AEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
}

void sub_2132B8B10()
{
  CurrentRequest.$asrOnDevice.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B8B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<Bool?>.Publisher);
}

void sub_2132B8B50()
{
  CurrentRequest.$currentDeviceAssistantId.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B8B6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String>.Publisher);
}

void sub_2132B8B90()
{
  CurrentRequest.$voiceTriggerEventInfo.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B8BAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<[String : String]?>.Publisher);
}

void sub_2132B8BD0()
{
  CurrentRequest.$asrExecutionLocation.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B8BEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<ExecutionLocation>.Publisher);
}

void sub_2132B8C10()
{
  CurrentRequest.$nlExecutionLocation.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B8C2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<ExecutionLocation>.Publisher);
}

void sub_2132B8C50()
{
  CurrentRequest.$companionName.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B8C6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
}

void sub_2132B8C90()
{
  CurrentRequest.$isRecognizeMyVoiceEnabled.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B8CAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<Bool?>.Publisher);
}

void sub_2132B8CD0()
{
  CurrentRequest.$flowTaskMetadata.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B8CEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>.Publisher);
}

void sub_2132B8D10()
{
  CurrentRequest.$voiceAudioSessionId.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B8D2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<UInt32>.Publisher);
}

void sub_2132B8D50()
{
  CurrentRequest.$utterance.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B8D6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
}

void sub_2132B8D90()
{
  CurrentRequest.$isSystemApertureEnabled.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B8DAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<Bool>.Publisher);
}

void sub_2132B8DD0()
{
  CurrentRequest.$isLiveActivitiesSupported.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B8DEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<Bool>.Publisher);
}

void sub_2132B8E10()
{
  CurrentRequest.$isInAmbient.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B8E2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<Bool>.Publisher);
}

void sub_2132B8E50()
{
  CurrentRequest.$positionInSession.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B8E6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>.Publisher);
}

void sub_2132B8E90()
{
  CurrentRequest.$responseLanguageVariant.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B8EAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
}

void sub_2132B8ED0()
{
  CurrentRequest.$locationProvider.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B8EEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>.Publisher);
}

void sub_2132B8F10()
{
  CurrentRequest.$requestLanguageVariant.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B8F2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
}

void sub_2132B8F50()
{
  CurrentRequest.$rootRequestId.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132B8F6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RequestPositionInSession(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for RequestPositionInSession(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2132B9074 + 4 * byte_2132C4805[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2132B90A8 + 4 * byte_2132C4800[v4]))();
}

uint64_t sub_2132B90A8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132B90B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2132B90B8);
  return result;
}

uint64_t sub_2132B90C4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2132B90CCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2132B90D0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132B90D8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for RequestPositionInSession(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for RequestPositionInSession(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RequestPositionInSession()
{
  return &type metadata for RequestPositionInSession;
}

uint64_t method lookup function for CurrentRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CurrentRequest.__allocating_init(storage:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 368))();
}

uint64_t dispatch thunk of CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,double a21,uint64_t a22,uint64_t a23,double a24,uint64_t a25,double a26,uint64_t a27,double a28)
{
  return OUTLINED_FUNCTION_93(a1, a2, a3, a4, a5, a6, a7, a8, a24, a26, a28, a21, a17, a18, a19, a20);
}

uint64_t dispatch thunk of CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,double a21,uint64_t a22,uint64_t a23,double a24,uint64_t a25,double a26,uint64_t a27,double a28)
{
  return OUTLINED_FUNCTION_93(a1, a2, a3, a4, a5, a6, a7, a8, a24, a26, a28, a21, a17, a18, a19, a20);
}

uint64_t dispatch thunk of CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, __n128 a10, uint64_t a11, __n128 a12, uint64_t a13, __n128 a14, __n128 a15)
{
  return OUTLINED_FUNCTION_105(a1, a2, a3, a4, a5, a6, a7, a8, a13, a14, a15, a12, a10, a9);
}

#error "2132B9200: call analysis failed (funcsize=9)"

#error "2132B9224: call analysis failed (funcsize=17)"

uint64_t dispatch thunk of CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:flowTaskMetadata:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 416))();
}

uint64_t dispatch thunk of CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:flowTaskMetadata:voiceAudioSessionId:isSystemApertureEnabled:isInAmbient:positionInSession:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 424))();
}

uint64_t dispatch thunk of CurrentRequest.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 432))();
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return MockablePublished.init(wrappedValue:)();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return MockablePublished.init(wrappedValue:)();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return static MockablePublished.subscript.modify();
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return MockablePublished.init(wrappedValue:)();
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_allocObject();
}

void *OUTLINED_FUNCTION_10_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = a1;
  v2 = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v1 + 16) = v2;
  return malloc(*(_QWORD *)(v2 + 64));
}

void OUTLINED_FUNCTION_12_0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v0, v1);
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_16()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_22()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_23(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 - 256) = a1;
  *(v2 - 38) = v2[12];
  *(v2 - 37) = v2[11];
  *(v2 - 36) = v2[10];
  *(v2 - 35) = v2[9];
  *(v2 - 34) = v2[8];
}

void *OUTLINED_FUNCTION_27()
{
  size_t v0;

  return malloc(v0);
}

void *OUTLINED_FUNCTION_28()
{
  return malloc(0x38uLL);
}

void *OUTLINED_FUNCTION_29()
{
  return malloc(0x28uLL);
}

_QWORD *OUTLINED_FUNCTION_30(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;

  *v1 = result;
  *result = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_31(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_32()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return MockablePublished.init(wrappedValue:)();
}

uint64_t OUTLINED_FUNCTION_34@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_35()
{
  return MockablePublished.init(wrappedValue:)();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_37()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_39()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_40()
{
  return MockablePublished.init(wrappedValue:)();
}

uint64_t OUTLINED_FUNCTION_42(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_43()
{
  return MockablePublished.init(wrappedValue:)();
}

uint64_t OUTLINED_FUNCTION_44()
{
  return MockablePublished.init(wrappedValue:)();
}

void OUTLINED_FUNCTION_45()
{
  uint64_t *v0;
  uint64_t v1;

  outlined destroy of AudioSource?(v1, v0);
}

uint64_t OUTLINED_FUNCTION_46()
{
  return dispatch thunk of MockablePublished.projectedValue.setter();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return dispatch thunk of MockablePublished.projectedValue.getter();
}

uint64_t OUTLINED_FUNCTION_48()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_49(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  __swift_destroy_boxed_opaque_existential_1(v2 - 160);
  *(_QWORD *)(v1 + 280) = a1;
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_50()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_51(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_52(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_53()
{
  return Builder.subscript.getter();
}

uint64_t OUTLINED_FUNCTION_54(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_55()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_57()
{
  return Builder.subscript.getter();
}

void OUTLINED_FUNCTION_58(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

void OUTLINED_FUNCTION_59(uint64_t a1)
{
  uint64_t *v1;

  outlined destroy of AudioSource?(a1, v1);
}

void OUTLINED_FUNCTION_60(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  outlined init with copy of AudioDestination?(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_62()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_63@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return type metadata accessor for ResponseMode();
}

uint64_t OUTLINED_FUNCTION_64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return type metadata accessor for InteractionType();
}

uint64_t OUTLINED_FUNCTION_65@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return type metadata accessor for InputOrigin();
}

uint64_t OUTLINED_FUNCTION_66()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_67(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 - 256) = a1;
  *(_QWORD *)(v2 - 264) = *(_QWORD *)(v2 + 40);
  *(_QWORD *)(v2 - 256) = *(_QWORD *)(v2 + 32);
}

uint64_t OUTLINED_FUNCTION_68()
{
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_69@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 136) = a1;
  *(_QWORD *)(v2 - 128) = v1;
  return outlined init with copy of SiriLocationProvider(v2 - 160, v2 - 248);
}

uint64_t OUTLINED_FUNCTION_71()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_72(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  outlined init with copy of AudioDestination?(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_73@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 - 256) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_74@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 - 256))();
}

__n128 OUTLINED_FUNCTION_75()
{
  uint64_t v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;

  v1 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v0 - 160) = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v0 - 144) = v1;
  v2 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v0 - 192) = *(_OWORD *)(v0 + 64);
  *(_OWORD *)(v0 - 176) = v2;
  v3 = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v0 - 224) = *(_OWORD *)(v0 + 96);
  *(_OWORD *)(v0 - 208) = v3;
  return *(__n128 *)(v0 + 168);
}

uint64_t OUTLINED_FUNCTION_76()
{
  return Builder.subscript.getter();
}

double OUTLINED_FUNCTION_78@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  double result;

  *(_QWORD *)(v1 - 256) = a1;
  *(_QWORD *)(v2 - 128) = 0;
  result = 0.0;
  *(_OWORD *)(v2 - 160) = 0u;
  *(_OWORD *)(v2 - 144) = 0u;
  return result;
}

void OUTLINED_FUNCTION_79(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  outlined init with copy of AudioDestination?(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_80()
{
  return MockablePublished.init(wrappedValue:)();
}

uint64_t OUTLINED_FUNCTION_81()
{
  uint64_t v0;

  return outlined init with copy of MultiUserState(*(_QWORD *)(v0 - 296), v0 - 160);
}

uint64_t OUTLINED_FUNCTION_82()
{
  return static MockablePublished.subscript.getter();
}

void OUTLINED_FUNCTION_83(uint64_t a1)
{
  uint64_t *v1;

  outlined destroy of AudioSource?(a1, v1);
}

void OUTLINED_FUNCTION_84(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  outlined init with copy of AudioDestination?(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_86(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  __swift_storeEnumTagSinglePayload(v4, 1, 1, a4);
  return v4;
}

uint64_t OUTLINED_FUNCTION_87(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  __swift_storeEnumTagSinglePayload(v4, 1, 1, a4);
  return v4;
}

void OUTLINED_FUNCTION_88(uint64_t a1)
{
  uint64_t *v1;

  outlined destroy of AudioSource?(a1, v1);
}

uint64_t OUTLINED_FUNCTION_89()
{
  uint64_t v0;

  return outlined destroy of MultiUserState(v0 - 160);
}

void OUTLINED_FUNCTION_90(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  outlined init with copy of AudioDestination?(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_91@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return type metadata accessor for AudioDestination();
}

uint64_t OUTLINED_FUNCTION_92@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return type metadata accessor for FlowTaskMetadata();
}

uint64_t OUTLINED_FUNCTION_93(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD);

  return v16(a1, a2, a3, a4, a5, a6, a7, a8, a13, a14, a15, a16, *(_QWORD *)&a12);
}

uint64_t OUTLINED_FUNCTION_94()
{
  return swift_getKeyPath();
}

void OUTLINED_FUNCTION_95()
{
  uint64_t v0;
  uint64_t *v1;

  outlined destroy of AudioSource?(v0, v1);
}

void OUTLINED_FUNCTION_96()
{
  uint64_t v0;
  uint64_t *v1;

  outlined destroy of AudioSource?(v0, v1);
}

uint64_t OUTLINED_FUNCTION_97()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_98(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 - 256) = a1;
  *(_QWORD *)(v2 - 160) = 0;
}

void OUTLINED_FUNCTION_100(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  outlined init with copy of AudioDestination?(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_101()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

void OUTLINED_FUNCTION_103(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  outlined init with copy of AudioDestination?(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_104()
{
  uint64_t v0;

  return outlined init with copy of MultiUserState(v0 - 160, v0 - 248);
}

uint64_t OUTLINED_FUNCTION_105@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __n128 a10@<Q0>, __n128 a11@<Q1>, __n128 a12@<Q3>, __n128 a13@<Q6>, uint64_t a14)
{
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t, unint64_t, unint64_t, uint64_t, unint64_t, unint64_t, unint64_t, unint64_t);

  return v15(a1, a2, a3, a4, a5, a6, a7, a8, a14, a13.n128_u64[0], a13.n128_u64[1], v14, a12.n128_u64[0], a12.n128_u64[1], a9, a10.n128_u64[0], a10.n128_u64[1], a11.n128_u64[0], a11.n128_u64[1]);
}

uint64_t OUTLINED_FUNCTION_106@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return type metadata accessor for BargeInContext();
}

uint64_t OUTLINED_FUNCTION_107@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return type metadata accessor for HomeInfo();
}

void OUTLINED_FUNCTION_108(uint64_t a1)
{
  uint64_t *v1;

  outlined destroy of AudioSource?(a1, v1);
}

uint64_t OUTLINED_FUNCTION_110()
{
  return MockablePublished.init(wrappedValue:)();
}

void OUTLINED_FUNCTION_111()
{
  uint64_t v0;
  uint64_t *v1;

  outlined destroy of AudioSource?(v0, v1);
}

uint64_t OUTLINED_FUNCTION_112()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_113()
{
  return static MockablePublished.subscript.getter();
}

uint64_t OUTLINED_FUNCTION_115@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return type metadata accessor for AudioSource();
}

uint64_t OUTLINED_FUNCTION_116(uint64_t a1)
{
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  return v1;
}

uint64_t OUTLINED_FUNCTION_117()
{
  uint64_t v0;

  return outlined destroy of MultiUserState(*(_QWORD *)(v0 - 296));
}

__n128 OUTLINED_FUNCTION_118(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __n128 result;

  *(_QWORD *)(v8 - 104) = a7;
  *(_QWORD *)(v8 - 96) = a8;
  *(_QWORD *)(v8 - 112) = a6;
  v9 = *(_OWORD *)(v8 + 16);
  *(_OWORD *)(v8 - 144) = *(_OWORD *)(v8 + 32);
  *(_OWORD *)(v8 - 128) = v9;
  v10 = *(_OWORD *)(v8 + 48);
  result = *(__n128 *)(v8 + 64);
  *(__n128 *)(v8 - 176) = result;
  *(_OWORD *)(v8 - 160) = v10;
  return result;
}

uint64_t OUTLINED_FUNCTION_119()
{
  return Builder.subscript.getter();
}

uint64_t OUTLINED_FUNCTION_120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  __swift_storeEnumTagSinglePayload(v4, 1, 1, a4);
  return v4;
}

uint64_t OUTLINED_FUNCTION_121()
{
  return static ExecutionLocation.unknown.getter();
}

void OUTLINED_FUNCTION_123(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  outlined init with copy of AudioDestination?(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_124()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 312);
}

uint64_t OUTLINED_FUNCTION_125()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 304);
}

void OUTLINED_FUNCTION_126()
{
  uint64_t v0;

  CurrentRequest.rootRequestId.setter();

}

uint64_t OUTLINED_FUNCTION_127()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_128()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 272);
}

void OUTLINED_FUNCTION_130(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  outlined init with copy of AudioDestination?(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_131()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 280);
}

uint64_t OUTLINED_FUNCTION_132()
{
  return static MockablePublished.subscript.setter();
}

uint64_t OUTLINED_FUNCTION_133()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v1 - 408) + 16))(*(_QWORD *)(v1 - 416), v0, *(_QWORD *)(v1 - 400));
}

uint64_t OUTLINED_FUNCTION_134()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v1 - 400) + 16))(*(_QWORD *)(v1 - 408), v0, *(_QWORD *)(v1 - 392));
}

uint64_t OUTLINED_FUNCTION_135@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return type metadata accessor for ExecutionLocation();
}

void OUTLINED_FUNCTION_136()
{
  uint64_t v0;
  uint64_t *v1;

  outlined destroy of AudioSource?(v0, v1);
}

uint64_t OUTLINED_FUNCTION_137(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  __swift_storeEnumTagSinglePayload(v4, 1, 1, a4);
  return v4;
}

uint64_t OUTLINED_FUNCTION_138()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_142(uint64_t a1)
{
  uint64_t *v1;

  outlined destroy of AudioSource?(a1, v1);
}

uint64_t OUTLINED_FUNCTION_143()
{
  return swift_getKeyPath();
}

uint64_t OUTLINED_FUNCTION_144()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_145()
{
  return swift_release();
}

void OUTLINED_FUNCTION_146(uint64_t a1)
{
  uint64_t *v1;

  outlined destroy of AudioSource?(a1, v1);
}

uint64_t OUTLINED_FUNCTION_147()
{
  return type metadata accessor for ExecutionLocation();
}

void OUTLINED_FUNCTION_148(uint64_t a1)
{
  uint64_t *v1;

  outlined destroy of AudioSource?(a1, v1);
}

uint64_t OUTLINED_FUNCTION_149()
{
  return swift_release();
}

void OUTLINED_FUNCTION_150(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 - 256) = a1;
  *(v2 - 33) = v2[5];
  *(v2 - 32) = v2[4];
  *(v2 - 66) = v2[2];
}

void OUTLINED_FUNCTION_151()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v1 - 160) = 0;
  *(_QWORD *)(v1 - 152) = 0;
}

uint64_t OUTLINED_FUNCTION_152@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 - 256) = a1;
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_153()
{
  uint64_t v0;

  return v0;
}

__n128 OUTLINED_FUNCTION_154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, __int128 a16)
{
  return (__n128)a16;
}

void OUTLINED_FUNCTION_155(uint64_t a1@<X8>)
{

}

uint64_t OUTLINED_FUNCTION_156()
{
  return MockablePublished.init(wrappedValue:)();
}

void OUTLINED_FUNCTION_157(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 472) = a1;
}

uint64_t OUTLINED_FUNCTION_159()
{
  return swift_release();
}

id OUTLINED_FUNCTION_160@<X0>(uint64_t a1@<X8>)
{
  return *(id *)(a1 - 256);
}

uint64_t OUTLINED_FUNCTION_161()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

void OUTLINED_FUNCTION_163()
{
  CurrentRequest.rootRequestId.setter();
}

uint64_t OUTLINED_FUNCTION_164(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 272) = result;
  return result;
}

void OUTLINED_FUNCTION_165(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 432) = a1;
}

uint64_t OUTLINED_FUNCTION_166()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(v2, v0, v3);
}

void OUTLINED_FUNCTION_167()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 136) = v1;
}

void OUTLINED_FUNCTION_168()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 96) = v1;
}

void OUTLINED_FUNCTION_169()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 120) = v1;
}

uint64_t OUTLINED_FUNCTION_170(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 232) = result;
  return result;
}

void OUTLINED_FUNCTION_173()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v1 - 160) = 0;
  *(_QWORD *)(v1 - 152) = 0;
}

void OUTLINED_FUNCTION_176(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 552) = a1;
}

void OUTLINED_FUNCTION_177(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 464) = a1;
}

void OUTLINED_FUNCTION_178(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 448) = a1;
}

uint64_t OUTLINED_FUNCTION_179()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_181@<X0>(uint64_t a1@<X8>)
{
  return *(_QWORD *)(a1 - 256);
}

uint64_t OUTLINED_FUNCTION_182()
{
  return swift_release();
}

void OUTLINED_FUNCTION_183(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 - 256);
  *(_QWORD *)(v2 - 248) = v1;
  *(_QWORD *)(v2 - 240) = v3;
}

uint64_t OUTLINED_FUNCTION_184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  __swift_storeEnumTagSinglePayload(v4, 1, 1, a4);
  return v4;
}

uint64_t OUTLINED_FUNCTION_185()
{
  return swift_release();
}

void OUTLINED_FUNCTION_186(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 512) = a1;
}

void OUTLINED_FUNCTION_187(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 544) = a1;
}

void OUTLINED_FUNCTION_189()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 88) = v1;
}

uint64_t OUTLINED_FUNCTION_190(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 160) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_191(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 200) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_192()
{
  return static MockablePublished.subscript.setter();
}

uint64_t OUTLINED_FUNCTION_193(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  __swift_storeEnumTagSinglePayload(v4, 1, 1, a4);
  return v4;
}

void OUTLINED_FUNCTION_194(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 424) = a1;
}

uint64_t OUTLINED_FUNCTION_195@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_196()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_197(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

void OUTLINED_FUNCTION_198(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 - 256) = a1;
  *(_BYTE *)(v2 - 160) = 2;
}

void OUTLINED_FUNCTION_199(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 608) = a1;
}

void OUTLINED_FUNCTION_200()
{
  uint64_t *v0;
  uint64_t v1;

  outlined destroy of AudioSource?(v1, v0);
}

void OUTLINED_FUNCTION_201(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 456) = a1;
}

void OUTLINED_FUNCTION_202(int a1@<W8>)
{
  uint64_t v1;

  *(_DWORD *)(v1 - 256) = a1;
}

void OUTLINED_FUNCTION_204(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 480) = a1;
}

uint64_t OUTLINED_FUNCTION_205()
{
  return swift_release();
}

void OUTLINED_FUNCTION_206(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 520) = a1;
}

void OUTLINED_FUNCTION_207(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 536) = a1;
}

uint64_t OUTLINED_FUNCTION_209(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_210(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 48) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_211(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = result;
  return result;
}

void OUTLINED_FUNCTION_212()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 128) = v1;
}

uint64_t OUTLINED_FUNCTION_213(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 144) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_214(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 208) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_215(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 176) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_216()
{
  return static MockablePublished.subscript.getter();
}

uint64_t OUTLINED_FUNCTION_218(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  result = v1;
  *(_QWORD *)(v2 - 840) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_219(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  result = v1;
  *(_QWORD *)(v2 - 752) = v1;
  return result;
}

void OUTLINED_FUNCTION_221(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 528) = a1;
}

uint64_t OUTLINED_FUNCTION_223@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  __swift_storeEnumTagSinglePayload(v4, 1, 1, a4);
  result = v4;
  *(_QWORD *)(v5 - 824) = v4;
  return result;
}

uint64_t OUTLINED_FUNCTION_225()
{
  return static ExecutionLocation.unknown.getter();
}

uint64_t OUTLINED_FUNCTION_226@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, *(_QWORD *)(a4 - 256));
}

void OUTLINED_FUNCTION_229(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 488) = a1;
}

uint64_t OUTLINED_FUNCTION_230()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(v3, v2, v0);
}

uint64_t OUTLINED_FUNCTION_231(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 80) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_232(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 152) = result;
  return result;
}

void OUTLINED_FUNCTION_234(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 440) = a1;
}

uint64_t OUTLINED_FUNCTION_235()
{
  return dispatch thunk of SiriEnvironment.subscript.setter();
}

uint64_t OUTLINED_FUNCTION_236()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_238@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_239()
{
  uint64_t (*v0)(uint64_t);
  uint64_t v1;

  return v0(v1);
}

uint64_t OUTLINED_FUNCTION_241()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_242(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledName(a2);
}

uint64_t OUTLINED_FUNCTION_243()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_244@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_245()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_246()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_247@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return __swift_getEnumTagSinglePayload(a1, a2, *(_QWORD *)(a3 - 256));
}

uint64_t OUTLINED_FUNCTION_249@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, _QWORD)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, *(_QWORD *)(v3 - 256));
}

void OUTLINED_FUNCTION_250(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 496) = a1;
}

uint64_t OUTLINED_FUNCTION_251()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 264);
}

uint64_t OUTLINED_FUNCTION_252()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 264);
}

uint64_t OUTLINED_FUNCTION_253()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_254()
{
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_255@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_256()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_257()
{
  return swift_getKeyPath();
}

uint64_t OUTLINED_FUNCTION_258()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

uint64_t OUTLINED_FUNCTION_259()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_260(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 80) = a1;
  return type metadata accessor for AudioSource();
}

uint64_t OUTLINED_FUNCTION_261()
{
  uint64_t v0;

  return v0 - 160;
}

uint64_t OUTLINED_FUNCTION_262(uint64_t a1)
{
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  return v1;
}

void specialized == infix<A>(_:_:)(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_2132BA428(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_2132BA4FC + 4 * byte_2132C5578[a2]))(0x6D726F6674616C50);
}

uint64_t sub_2132BA4FC(uint64_t a1)
{
  uint64_t v1;
  char v3;

  if (a1 == 0x6D726F6674616C50 && v1 == 0xE90000000000005FLL)
    v3 = 1;
  else
    v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

BOOL specialized == infix<A>(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

BOOL specialized == infix<A>(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void specialized RawRepresentable<>.hashValue.getter()
{
  Hasher.init(_seed:)();
  OUTLINED_FUNCTION_47_0();
  Hasher._finalize()();
  OUTLINED_FUNCTION_45_0();
}

Swift::Int specialized RawRepresentable<>.hashValue.getter(char a1)
{
  _BYTE v3[72];

  Hasher.init(_seed:)();
  specialized RawRepresentable<>.hash(into:)((uint64_t)v3, a1);
  return Hasher._finalize()();
}

void specialized RawRepresentable<>.hash(into:)(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_2132BA6D8()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

void specialized RawRepresentable<>.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
  OUTLINED_FUNCTION_8();
}

void specialized RawRepresentable<>._rawHashValue(seed:)()
{
  Hasher.init(_seed:)();
  OUTLINED_FUNCTION_47_0();
  Hasher._finalize()();
  OUTLINED_FUNCTION_45_0();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, char a2)
{
  _BYTE v4[72];

  Hasher.init(_seed:)();
  specialized RawRepresentable<>.hash(into:)((uint64_t)v4, a2);
  return Hasher._finalize()();
}

uint64_t Policy.supportedOperatingSystems.getter()
{
  return swift_bridgeObjectRetain();
}

void Policy.supportedOperatingSystems.setter(uint64_t a1)
{
  _QWORD *v1;

  swift_bridgeObjectRelease();
  *v1 = a1;
  OUTLINED_FUNCTION_8();
}

uint64_t (*Policy.supportedOperatingSystems.modify())()
{
  return FlowTaskMetadata.id.modify;
}

uint64_t Policy.ducAllowList.getter()
{
  return swift_bridgeObjectRetain();
}

void Policy.ducAllowList.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  OUTLINED_FUNCTION_8();
}

uint64_t (*Policy.ducAllowList.modify())()
{
  return FlowTaskMetadata.id.modify;
}

uint64_t Policy.errorSignatureDenyList.getter()
{
  return swift_bridgeObjectRetain();
}

void Policy.errorSignatureDenyList.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  OUTLINED_FUNCTION_8();
}

uint64_t (*Policy.errorSignatureDenyList.modify())()
{
  return FlowTaskMetadata.id.modify;
}

uint64_t Policy.denyAllErrorSignatures.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t Policy.denyAllErrorSignatures.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 24) = result;
  return result;
}

uint64_t (*Policy.denyAllErrorSignatures.modify())()
{
  return FlowTaskMetadata.id.modify;
}

SiriFlowEnvironment::Policy __swiftcall Policy.init(supportedOperatingSystems:ducAllowList:errorSignatureDenyList:denyAllErrorSignatures:)(Swift::OpaquePointer supportedOperatingSystems, Swift::OpaquePointer ducAllowList, Swift::OpaquePointer errorSignatureDenyList, Swift::Bool denyAllErrorSignatures)
{
  uint64_t v4;
  SiriFlowEnvironment::Policy result;

  *(Swift::OpaquePointer *)v4 = supportedOperatingSystems;
  *(Swift::OpaquePointer *)(v4 + 8) = ducAllowList;
  *(Swift::OpaquePointer *)(v4 + 16) = errorSignatureDenyList;
  *(_BYTE *)(v4 + 24) = denyAllErrorSignatures;
  result.errorSignatureDenyList = errorSignatureDenyList;
  result.ducAllowList = ducAllowList;
  result.supportedOperatingSystems = supportedOperatingSystems;
  result.denyAllErrorSignatures = denyAllErrorSignatures;
  return result;
}

SiriFlowEnvironment::TapToRadarWithPolicyManager::DefaultPolicyKeys_optional __swiftcall TapToRadarWithPolicyManager.DefaultPolicyKeys.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  void *object;
  Swift::String v3;
  char *v4;
  unint64_t v5;
  SiriFlowEnvironment::TapToRadarWithPolicyManager::DefaultPolicyKeys_optional result;
  char v7;

  object = rawValue._object;
  v3._countAndFlagsBits = rawValue._countAndFlagsBits;
  v4 = v1;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of TapToRadarWithPolicyManager.DefaultPolicyKeys.init(rawValue:), v3);
  result.value = swift_bridgeObjectRelease();
  v7 = 8;
  if (v5 < 8)
    v7 = v5;
  *v4 = v7;
  return result;
}

uint64_t TapToRadarWithPolicyManager.DefaultPolicyKeys.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2132BA9A4 + 4 * byte_2132C5588[*v0]))(0xD000000000000019, 0x80000002132C5AE0);
}

uint64_t sub_2132BA9A4()
{
  return 0x6D726F6674616C50;
}

uint64_t sub_2132BA9C0()
{
  return OUTLINED_FUNCTION_27_0();
}

uint64_t sub_2132BA9E4@<X0>(uint64_t a1@<X8>)
{
  return a1 + 3;
}

unint64_t sub_2132BA9FC()
{
  return 0xD000000000000013;
}

uint64_t sub_2132BAA18()
{
  return 0x6C6C41796E6544;
}

uint64_t sub_2132BAA30()
{
  return 0x656C74746F726854;
}

void protocol witness for static Equatable.== infix(_:_:) in conformance TapToRadarWithPolicyManager.DefaultPolicyKeys(char *a1)
{
  specialized == infix<A>(_:_:)(*a1);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance TapToRadarWithPolicyManager.DefaultPolicyKeys()
{
  char *v0;

  return specialized RawRepresentable<>.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance TapToRadarWithPolicyManager.DefaultPolicyKeys(uint64_t a1)
{
  char *v1;

  specialized RawRepresentable<>.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance TapToRadarWithPolicyManager.DefaultPolicyKeys(uint64_t a1)
{
  char *v1;

  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

SiriFlowEnvironment::TapToRadarWithPolicyManager::DefaultPolicyKeys_optional protocol witness for RawRepresentable.init(rawValue:) in conformance TapToRadarWithPolicyManager.DefaultPolicyKeys(Swift::String *a1)
{
  return TapToRadarWithPolicyManager.DefaultPolicyKeys.init(rawValue:)(*a1);
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance TapToRadarWithPolicyManager.DefaultPolicyKeys@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = TapToRadarWithPolicyManager.DefaultPolicyKeys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t TapToRadarWithPolicyManager.__allocating_init(data:)(uint64_t a1, unint64_t a2)
{
  OUTLINED_FUNCTION_22_0();
  return TapToRadarWithPolicyManager.init(data:)(a1, a2);
}

uint64_t TapToRadarWithPolicyManager.init(data:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  uint64_t v9;
  char v10;

  swift_retain();
  static TapToRadarWithPolicyManager.policy(fromPlistData:)();
  *(_OWORD *)(v2 + 136) = v8;
  *(_QWORD *)(v2 + 152) = v9;
  *(_BYTE *)(v2 + 160) = v10;
  swift_release();
  TapToRadarManager.init()();
  v6 = v5;
  outlined consume of Data._Representation(a1, a2);
  return v6;
}

void static TapToRadarWithPolicyManager.policy(fromPlistData:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  Class isa;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  Swift::String v17;
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  os_log_type_t v30;
  uint8_t *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[2];
  uint64_t *v56;
  _QWORD v57[4];
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62[3];
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;

  OUTLINED_FUNCTION_85();
  v1 = v0;
  v66 = *MEMORY[0x24BDAC8D0];
  v2 = OUTLINED_FUNCTION_16_0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_8_1();
  v6 = (v4 - v5);
  MEMORY[0x24BDAC7A8](v7);
  v9 = ((char *)v55 - v8);
  v10 = (void *)objc_opt_self();
  isa = Data._bridgeToObjectiveC()().super.isa;
  *(_QWORD *)&v64 = 0;
  v12 = objc_msgSend(v10, sel_propertyListWithData_options_format_error_, isa, 0, 0, &v64);

  if (!v12)
  {
    v28 = (id)v64;
    v29 = (void *)_convertNSErrorToError(_:)();

    LOBYTE(v12) = (_BYTE)v29;
    swift_willThrow();

    goto LABEL_11;
  }
  v13 = (id)v64;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Swift.AnyObject]);
  if ((OUTLINED_FUNCTION_11_1() & 1) == 0)
  {
LABEL_11:
    static Logger.logger.getter();
    Logger.logObject.getter();
    v30 = OUTLINED_FUNCTION_43_0();
    if (OUTLINED_FUNCTION_5_2(v30))
    {
      v31 = (uint8_t *)OUTLINED_FUNCTION_2_3();
      *(_WORD *)v31 = 0;
      OUTLINED_FUNCTION_10_1(&dword_2132A2000, v6, (os_log_type_t)v12, "TapToRadarWithPolicyManager#policy unable to extract policy", v31);
      OUTLINED_FUNCTION_3_1();
    }

    (*(void (**)(NSObject *, uint64_t))(v3 + 8))(v6, v2);
    *(_QWORD *)v1 = 0;
    *(_QWORD *)(v1 + 8) = 0;
    *(_BYTE *)(v1 + 24) = 0;
    *(_QWORD *)(v1 + 16) = 0;
    goto LABEL_49;
  }
  v56 = (uint64_t *)v1;
  v14 = v62[0];
  specialized Dictionary.subscript.getter(0xD000000000000019, 0x80000002132C5AE0, v62[0]);
  v16 = MEMORY[0x24BEE4AF8];
  if (v15)
  {
    *(_QWORD *)&v64 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    if (OUTLINED_FUNCTION_11_1())
      v16 = v62[0];
  }
  v17._countAndFlagsBits = static TapToRadarWithPolicyManager.translateDeviceToPlatform()();
  countAndFlagsBits = v17._countAndFlagsBits;
  object = v17._object;
  *(_QWORD *)&v64 = 0x6D726F6674616C50;
  *((_QWORD *)&v64 + 1) = 0xE90000000000005FLL;
  String.append(_:)(v17);
  specialized Dictionary.subscript.getter(v64, *((uint64_t *)&v64 + 1), v14);
  v21 = v20;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v21)
  {
    swift_bridgeObjectRelease();
    v22 = (uint64_t)OUTLINED_FUNCTION_35_0();
    v24 = v56;
    if ((v22 & 1) != 0)
    {
      v25 = OUTLINED_FUNCTION_27_0();
      v26 = MEMORY[0x2199AFF9C](v25, 0xEC0000007473694CLL);
      v27 = OUTLINED_FUNCTION_14_1(v26);

      if (v27)
      {
        _bridgeAnyObjectToAny(_:)();
        swift_unknownObjectRelease();
      }
      else
      {
        v64 = 0u;
        v65 = 0u;
      }
      outlined init with take of Any??((uint64_t)&v64, (uint64_t)&v58, &demangling cache variable for type metadata for Any?);
    }
    else
    {
      v58 = 0;
      v59 = 0;
      v60 = 0;
      v61 = 1;
    }
    OUTLINED_FUNCTION_44_0(v22, v23, &demangling cache variable for type metadata for Any??);
    if (v63 == 1)
    {
      v37 = &demangling cache variable for type metadata for Any??;
      v38 = v62;
    }
    else
    {
      OUTLINED_FUNCTION_46_0(v35, v36, &demangling cache variable for type metadata for Any?);
      if (*((_QWORD *)&v65 + 1))
      {
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [[String : String]]);
        if (OUTLINED_FUNCTION_11_1())
          v39 = v57[0];
        else
          v39 = 0;
LABEL_28:
        v40 = (uint64_t)OUTLINED_FUNCTION_35_0();
        if ((v40 & 1) != 0)
        {
          v42 = MEMORY[0x2199AFF9C](0xD000000000000016, 0x80000002132C5B20);
          v43 = OUTLINED_FUNCTION_14_1(v42);

          if (v43)
          {
            _bridgeAnyObjectToAny(_:)();
            swift_unknownObjectRelease();
          }
          else
          {
            memset(v57, 0, sizeof(v57));
          }
          outlined init with take of Any??((uint64_t)v57, (uint64_t)&v58, &demangling cache variable for type metadata for Any?);
        }
        else
        {
          v58 = 0;
          v59 = 0;
          v60 = 0;
          v61 = 1;
        }
        OUTLINED_FUNCTION_44_0(v40, v41, &demangling cache variable for type metadata for Any??);
        if (v63 == 1)
        {
          v46 = &demangling cache variable for type metadata for Any??;
          v47 = v62;
        }
        else
        {
          OUTLINED_FUNCTION_46_0(v44, v45, &demangling cache variable for type metadata for Any?);
          if (*((_QWORD *)&v65 + 1))
          {
            if ((OUTLINED_FUNCTION_11_1() & 1) != 0)
            {
              v48 = v57[0];
              v49 = OUTLINED_FUNCTION_25();
              specialized Dictionary.subscript.getter(v49, v50, v48);
              v52 = v51 && (*(_QWORD *)&v64 = v51, (OUTLINED_FUNCTION_11_1() & 1) != 0) && v62[0] != 0;
              goto LABEL_44;
            }
LABEL_43:
            v52 = 0;
            v48 = 0;
LABEL_44:
            swift_unknownObjectRelease();
            v53 = MEMORY[0x24BEE4AF8];
            if (v39)
              v53 = v39;
            v54 = MEMORY[0x24BEE4B00];
            if (v48)
              v54 = v48;
            *v24 = v16;
            v24[1] = v53;
            v24[2] = v54;
            *((_BYTE *)v24 + 24) = v52;
            goto LABEL_49;
          }
          v46 = &demangling cache variable for type metadata for Any?;
          v47 = (uint64_t *)&v64;
        }
        outlined destroy of AudioDestination?((uint64_t)v47, v46);
        goto LABEL_43;
      }
      v37 = &demangling cache variable for type metadata for Any?;
      v38 = (uint64_t *)&v64;
    }
    outlined destroy of AudioDestination?((uint64_t)v38, v37);
    v39 = 0;
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_37();
  static Logger.logger.getter();
  OUTLINED_FUNCTION_36_0();
  Logger.logObject.getter();
  v32 = OUTLINED_FUNCTION_43_0();
  if (os_log_type_enabled(v9, v32))
  {
    v33 = (uint8_t *)OUTLINED_FUNCTION_2_3();
    *(_QWORD *)&v64 = OUTLINED_FUNCTION_2_3();
    *(_DWORD *)v33 = 136315138;
    v55[1] = v33 + 4;
    OUTLINED_FUNCTION_36_0();
    v62[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(countAndFlagsBits, (unint64_t)object, (uint64_t *)&v64);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_48_0(&dword_2132A2000, v9, v32, "TapToRadarWithPolicyManager#policy unable to find a policy for the platform '%s'", v33);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_1();
  }

  OUTLINED_FUNCTION_3_3();
  (*(void (**)(NSObject *, uint64_t))(v3 + 8))(v9, v2);
  v34 = v56;
  *v56 = 0;
  v34[1] = 0;
  *((_BYTE *)v34 + 24) = 0;
  v34[2] = 0;
LABEL_49:
  OUTLINED_FUNCTION_38();
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

void TapToRadarWithPolicyManager.__allocating_init(policy:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = OUTLINED_FUNCTION_22_0();
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_BYTE *)(a1 + 24);
  *(_OWORD *)(v2 + 136) = *(_OWORD *)a1;
  *(_QWORD *)(v2 + 152) = v3;
  *(_BYTE *)(v2 + 160) = v4;
  TapToRadarManager.init()();
  OUTLINED_FUNCTION_8();
}

void TapToRadarWithPolicyManager.init(policy:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_BYTE *)(a1 + 24);
  *(_OWORD *)(v1 + 136) = *(_OWORD *)a1;
  *(_QWORD *)(v1 + 152) = v2;
  *(_BYTE *)(v1 + 160) = v3;
  TapToRadarManager.init()();
}

uint64_t static TapToRadarWithPolicyManager.translateDeviceToPlatform()()
{
  id v0;
  int v1;
  int v2;
  uint64_t v3;
  id v4;
  int v6;
  id v7;
  int v8;
  id v9;
  int v10;

  GestaltGetDeviceClass();
  v0 = (id)CUGestaltDeviceClassToString();
  v1 = objc_msgSend(v0, "hasPrefix:", CFSTR("iPhone"));

  if (v1 || (v0 = v0, v2 = objc_msgSend(v0, "hasPrefix:", CFSTR("iPad")), v0, v2))
  {
    v3 = 5459817;

    return v3;
  }
  v4 = v0;
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("AudioAccessory1,")) & 1) != 0
    || (objc_msgSend(v4, "hasPrefix:", CFSTR("AudioAccessory5,")) & 1) != 0
    || (objc_msgSend(v4, "hasPrefix:", CFSTR("AudioAccessory6,")) & 1) != 0
    || objc_msgSend(v4, "hasPrefix:", CFSTR("HomePod")))
  {
    v3 = 1397716596;

LABEL_9:
    return v3;
  }

  v4 = v4;
  v6 = objc_msgSend(v4, "hasPrefix:", CFSTR("AppleTV"));

  if (v6)
  {
    v3 = 1397716596;
    goto LABEL_9;
  }
  v7 = v4;
  v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("Watch"));

  if (v8)
  {

    return 0x534F6863746177;
  }
  else
  {
    v9 = v7;
    v10 = objc_msgSend(v9, "containsString:", CFSTR("Mac"));

    if (v10)
      return 0x534F63616DLL;
    else
      return 0x726F707075736E75;
  }
}

void TapToRadarWithPolicyManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:duc:radarFilingExtras:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t *a24,void (*a25)(_QWORD),uint64_t a26)
{
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  void (*v52)(char *, uint64_t);
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD v74[5];
  _QWORD v75[6];

  OUTLINED_FUNCTION_85();
  v29 = v27;
  v70 = v30;
  v71 = v31;
  v68 = v32;
  v69 = v33;
  v35 = v34;
  v67 = v36;
  v38 = v37;
  v72 = a23;
  v73 = v39;
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_40_0();
  MEMORY[0x24BDAC7A8](v40);
  OUTLINED_FUNCTION_8_1();
  v43 = (char *)(v41 - v42);
  MEMORY[0x24BDAC7A8](v44);
  v46 = (char *)&v57 - v45;
  v47 = *v35;
  v65 = v35[1];
  v66 = v47;
  v48 = v35[2];
  v63 = v35[3];
  v64 = v48;
  v62 = v35[4];
  v61 = *a24;
  v60 = a24[1];
  v59 = a24[2];
  v58 = a24[3];
  v57 = a24[4];
  static Logger.logger.getter();
  v49 = Logger.logObject.getter();
  v50 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v49, v50))
  {
    v51 = (uint8_t *)OUTLINED_FUNCTION_2_3();
    *(_WORD *)v51 = 0;
    OUTLINED_FUNCTION_10_1(&dword_2132A2000, v49, v50, "TapToRadarWithPolicyManager#createProblem", v51);
    OUTLINED_FUNCTION_3_1();
  }

  v52 = *(void (**)(char *, uint64_t))(v28 + 8);
  v52(v46, v26);
  v53 = v73;
  if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v29 + 376))(v38, v73, a22, v72) & 1) != 0)
  {
    v75[0] = v66;
    v75[1] = v65;
    v75[2] = v64;
    v75[3] = v63;
    v75[4] = v62;
    v74[0] = v61;
    v74[1] = v60;
    v74[2] = v59;
    v74[3] = v58;
    v74[4] = v57;
    TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)(v38, v53, v67, v68, (uint64_t)v75, v69, v70, v71, a21, (uint64_t)v74, (uint64_t)a25, a26, v57, v58, v59, v60, v61, v62, v63,
      v64,
      v65,
      v66,
      v67,
      v68);
  }
  else
  {
    static Logger.logger.getter();
    v54 = Logger.logObject.getter();
    v55 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = (uint8_t *)OUTLINED_FUNCTION_2_3();
      *(_WORD *)v56 = 0;
      OUTLINED_FUNCTION_10_1(&dword_2132A2000, v54, v55, "TapToRadarWithPolicyManager#createProblem policy data does not support filing this issue", v56);
      OUTLINED_FUNCTION_3_1();
    }

    v52(v43, v26);
    a25(0);
  }
  OUTLINED_FUNCTION_38();
}

Swift::Bool __swiftcall TapToRadarWithPolicyManager.doesPolicyDataAllowFilingIssue(errStatus:duc:)(Swift::String errStatus, Swift::String_optional duc)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_log_type_t v5;
  os_log_type_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  _QWORD *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  os_log_type_t v35;
  os_log_type_t v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  os_log_type_t v40;
  uint8_t *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  Swift::Bool result;
  os_log_type_t v51;
  os_log_type_t v52;
  os_log_type_t v53;
  uint8_t *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67[2];
  uint64_t v68;

  OUTLINED_FUNCTION_85();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = OUTLINED_FUNCTION_16_0();
  v65 = *(_QWORD *)(v11 - 8);
  v66 = v11;
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_8_1();
  v14 = (v12 - v13);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_37_0();
  v64 = v16;
  OUTLINED_FUNCTION_34_0();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_37_0();
  v61 = v18;
  OUTLINED_FUNCTION_34_0();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_37_0();
  v60 = v20;
  OUTLINED_FUNCTION_34_0();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_37_0();
  v62 = v22;
  OUTLINED_FUNCTION_34_0();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_12_1();
  v24 = Logger.logObject.getter();
  v25 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = OUTLINED_FUNCTION_2_3();
    v68 = OUTLINED_FUNCTION_2_3();
    *(_DWORD *)v26 = 136315394;
    OUTLINED_FUNCTION_36_0();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v8, &v68);
    OUTLINED_FUNCTION_31_0();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    OUTLINED_FUNCTION_13_1();
    *(_WORD *)(v26 + 12) = 2080;
    v67[1] = v4;
    OUTLINED_FUNCTION_24();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    v27 = String.init<A>(describing:)();
    v67[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v27, v28, &v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    OUTLINED_FUNCTION_3_3();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_42_0(&dword_2132A2000, v24, v25, "TapToRadarWithPolicyManager#doesPolicyDataAllowFilingIssue, errStatus: %s, duc: %s", (uint8_t *)v26);
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_3_1();
  }

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3_3();
  v29 = *(void (**)(uint64_t, uint64_t))(v65 + 8);
  v29(v2, v66);
  v30 = *(_QWORD **)(v2 + 136);
  if (!v30)
  {
    static Logger.logger.getter();
    Logger.logObject.getter();
    v40 = OUTLINED_FUNCTION_43_0();
    if (OUTLINED_FUNCTION_5_2(v40))
    {
      v41 = (uint8_t *)OUTLINED_FUNCTION_2_3();
      *(_WORD *)v41 = 0;
      OUTLINED_FUNCTION_10_1(&dword_2132A2000, v14, v6, "TapToRadarWithPolicyManager#doesPolicyDataAllowFilingIssue unable to extract policy", v41);
      OUTLINED_FUNCTION_3_1();
    }

    v29((uint64_t)v14, v66);
    goto LABEL_17;
  }
  v31 = *(unsigned __int8 *)(v2 + 160);
  OUTLINED_FUNCTION_38_0();
  OUTLINED_FUNCTION_33_0();
  swift_bridgeObjectRetain();
  v32 = static TapToRadarWithPolicyManager.translateDeviceToPlatform()();
  v34 = v33;
  if ((specialized Sequence<>.contains(_:)(v32, v33, v30) & 1) == 0)
  {
    static Logger.logger.getter();
    outlined copy of Policy?((uint64_t)v30);
    OUTLINED_FUNCTION_36();
    v42 = Logger.logObject.getter();
    v43 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v42, v43))
    {
      v63 = v42;
      v44 = OUTLINED_FUNCTION_2_3();
      v67[0] = OUTLINED_FUNCTION_2_3();
      *(_DWORD *)v44 = 136315394;
      OUTLINED_FUNCTION_36();
      v68 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v34, v67);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_13_1();
      *(_WORD *)(v44 + 12) = 2080;
      v45 = OUTLINED_FUNCTION_38_0();
      v46 = MEMORY[0x2199B0044](v45, MEMORY[0x24BEE0D00]);
      v48 = v47;
      swift_bridgeObjectRelease();
      v68 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v46, v48, v67);
      OUTLINED_FUNCTION_30_0();
      OUTLINED_FUNCTION_23_0();
      OUTLINED_FUNCTION_1_4();
      OUTLINED_FUNCTION_1_4();
      OUTLINED_FUNCTION_42_0(&dword_2132A2000, v63, v43, "TapToRadarWithPolicyManager#doesPolicyDataAllowFilingIssue, current platform: %s is not part of %s", (uint8_t *)v44);
      OUTLINED_FUNCTION_41();
      OUTLINED_FUNCTION_3_1();
    }
    OUTLINED_FUNCTION_3_3();
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_1_4();

    v49 = v64;
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_37();
  if (v4)
  {
    TapToRadarWithPolicyManager.checkIsDUCAllowedPolicy(ducAllowList:errStatus:duc:)();
    v36 = v35;
    OUTLINED_FUNCTION_1_4();
    if ((v36 & 1) == 0)
    {
      OUTLINED_FUNCTION_21_0();
      OUTLINED_FUNCTION_32_0();
      v37 = OUTLINED_FUNCTION_39_0();
      if (OUTLINED_FUNCTION_20_0(v37))
      {
        v38 = (uint8_t *)OUTLINED_FUNCTION_2_3();
        *(_WORD *)v38 = 0;
        OUTLINED_FUNCTION_10_1(&dword_2132A2000, v31, v36, "TapToRadarWithPolicyManager#doesPolicyDataAllowFilingIssue DUC not allowed", v38);
        OUTLINED_FUNCTION_3_1();
      }

      v39 = v62;
LABEL_26:
      v29(v39, v66);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if ((v31 & 1) != 0)
  {
    OUTLINED_FUNCTION_1_4();
    static Logger.logger.getter();
    Logger.logObject.getter();
    v55 = OUTLINED_FUNCTION_39_0();
    if (os_log_type_enabled(v31, v55))
    {
      v56 = (uint8_t *)OUTLINED_FUNCTION_2_3();
      v67[0] = OUTLINED_FUNCTION_2_3();
      *(_DWORD *)v56 = 136315138;
      v57 = OUTLINED_FUNCTION_25();
      v68 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v57, v58, v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_48_0(&dword_2132A2000, v31, v55, "TapToRadarWithPolicyManager#checkIsDenyListed %s is true", v56);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_1();
    }

    v39 = v61;
    goto LABEL_26;
  }
  TapToRadarWithPolicyManager.checkIsDenyListed(denyList:errStatus:)();
  v52 = v51;
  OUTLINED_FUNCTION_1_4();
  if ((v52 & 1) == 0)
  {
    OUTLINED_FUNCTION_21_0();
    OUTLINED_FUNCTION_32_0();
    v53 = OUTLINED_FUNCTION_39_0();
    if (OUTLINED_FUNCTION_20_0(v53))
    {
      v54 = (uint8_t *)OUTLINED_FUNCTION_2_3();
      *(_WORD *)v54 = 0;
      OUTLINED_FUNCTION_10_1(&dword_2132A2000, v31, v52, "TapToRadarWithPolicyManager#doesPolicyDataAllowFilingIssue, policy allows filing", v54);
      OUTLINED_FUNCTION_3_1();
    }

    v49 = v60;
LABEL_16:
    v29(v49, v66);
  }
LABEL_17:
  OUTLINED_FUNCTION_38();
  return result;
}

uint64_t specialized Sequence<>.contains(_:)(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

void TapToRadarWithPolicyManager.checkIsDUCAllowedPolicy(ducAllowList:errStatus:duc:)()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  _QWORD *v25;
  BOOL v26;
  unint64_t v27;
  char v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  unint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;

  OUTLINED_FUNCTION_85();
  v2 = v1;
  v4 = v3;
  v42 = v5;
  v43 = v6;
  v8 = v7;
  v9 = OUTLINED_FUNCTION_16_0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_8_1();
  v13 = v11 - v12;
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_17();
  swift_bridgeObjectRetain();
  v15 = Logger.logObject.getter();
  v16 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)OUTLINED_FUNCTION_2_3();
    *(_DWORD *)v17 = 134217984;
    OUTLINED_FUNCTION_31_0();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_48_0(&dword_2132A2000, v15, v16, "TapToRadarWithPolicyManager#checkIsDUCAllowedPolicy DUCAllowList size: %ld", v17);
    OUTLINED_FUNCTION_3_1();
  }

  OUTLINED_FUNCTION_6_1();
  v18 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  v18(v0, v9);
  v19 = *(_QWORD *)(v8 + 16);
  if (!v19)
    goto LABEL_28;
  v41 = v9;
  swift_bridgeObjectRetain();
  v20 = 0;
  while (1)
  {
    v21 = *(_QWORD *)(v8 + 8 * v20 + 32);
    if (*(_QWORD *)(v21 + 16))
      break;
LABEL_20:
    if (v19 == ++v20)
    {
      OUTLINED_FUNCTION_6_1();
      goto LABEL_28;
    }
  }
  swift_bridgeObjectRetain();
  v22 = OUTLINED_FUNCTION_27_0();
  v23 = specialized __RawDictionaryStorage.find<A>(_:)(v22, 0xE800000000000000);
  if ((v24 & 1) == 0)
    goto LABEL_19;
  v25 = (_QWORD *)(*(_QWORD *)(v21 + 56) + 16 * v23);
  v26 = *v25 == v4 && v25[1] == v2;
  if (!v26 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    goto LABEL_19;
  if (!*(_QWORD *)(v21 + 16)
    || (v27 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000013, 0x80000002132C5B40), (v28 & 1) == 0))
  {
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_23_0();
    v34 = v41;
    v32 = v43;
    goto LABEL_25;
  }
  v29 = (uint64_t *)(*(_QWORD *)(v21 + 56) + 16 * v27);
  v30 = *v29;
  v31 = v29[1];
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_23_0();
  v32 = v43;
  v33 = v30 == v42 && v31 == v43;
  if (!v33 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
LABEL_19:
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  OUTLINED_FUNCTION_6_1();
  v34 = v41;
LABEL_25:
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_12_1();
  v35 = v32;
  v36 = OUTLINED_FUNCTION_32_0();
  v37 = static os_log_type_t.debug.getter();
  if (OUTLINED_FUNCTION_5_2(v37))
  {
    v38 = OUTLINED_FUNCTION_2_3();
    v44 = OUTLINED_FUNCTION_2_3();
    *(_DWORD *)v38 = 136315650;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v2, &v44);
    OUTLINED_FUNCTION_31_0();
    OUTLINED_FUNCTION_30_0();
    OUTLINED_FUNCTION_13_1();
    *(_WORD *)(v38 + 12) = 2080;
    OUTLINED_FUNCTION_24();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    v39 = String.init<A>(describing:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v39, v40, &v44);
    OUTLINED_FUNCTION_30_0();
    OUTLINED_FUNCTION_3_3();
    swift_bridgeObjectRelease();
    *(_WORD *)(v38 + 22) = 2080;
    OUTLINED_FUNCTION_38_0();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v42, v35, &v44);
    OUTLINED_FUNCTION_30_0();
    OUTLINED_FUNCTION_13_1();
    _os_log_impl(&dword_2132A2000, v36, (os_log_type_t)0x80000002132C5B40, "TapToRadarWithPolicyManager#checkIsDUCAllowedPolicy, ducs matched: %s, errInf: %s, errStatus: %s", (uint8_t *)v38, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_1();
  }

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3_3();
  v18(v13, v34);
LABEL_28:
  OUTLINED_FUNCTION_38();
}

void TapToRadarWithPolicyManager.checkIsDenyListed(denyList:errStatus:)()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;

  OUTLINED_FUNCTION_85();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_40_0();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(v7 + 16))
  {
    v11 = specialized __RawDictionaryStorage.find<A>(_:)(0x656C74746F726854, 0xEF73726F72724564);
    if ((v12 & 1) != 0)
    {
      v27 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v11);
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
      if ((OUTLINED_FUNCTION_11_1() & 1) != 0)
      {
        v13 = v26;
        OUTLINED_FUNCTION_33_0();
        specialized _ArrayProtocol.filter(_:)(v13);
        OUTLINED_FUNCTION_21_0();
        OUTLINED_FUNCTION_12_1();
        OUTLINED_FUNCTION_12_1();
        v14 = OUTLINED_FUNCTION_32_0();
        v15 = static os_log_type_t.debug.getter();
        v16 = v15;
        if (os_log_type_enabled(v14, v15))
        {
          v17 = OUTLINED_FUNCTION_2_3();
          v25 = v16;
          v18 = v17;
          v24 = OUTLINED_FUNCTION_2_3();
          v27 = v24;
          *(_DWORD *)v18 = 136315394;
          v23 = v18 + 4;
          v19 = OUTLINED_FUNCTION_36();
          v20 = MEMORY[0x2199B0044](v19, MEMORY[0x24BEE0D00]);
          v22 = v21;
          OUTLINED_FUNCTION_37();
          v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v22, &v27);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          OUTLINED_FUNCTION_3_3();
          OUTLINED_FUNCTION_6_1();
          *(_WORD *)(v18 + 12) = 2080;
          OUTLINED_FUNCTION_33_0();
          v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v5, v3, &v27);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          OUTLINED_FUNCTION_13_1();
          OUTLINED_FUNCTION_42_0(&dword_2132A2000, v14, (os_log_type_t)v25, "TapToRadarWithPolicyManager#checkIsDenyListed results: %s, errStatus: %s - denying!", (uint8_t *)v18);
          OUTLINED_FUNCTION_41();
          OUTLINED_FUNCTION_3_1();
        }

        OUTLINED_FUNCTION_3_3();
        OUTLINED_FUNCTION_3_3();
        (*(void (**)(char *, uint64_t))(v1 + 8))(v10, v0);
        OUTLINED_FUNCTION_37();
      }
    }
  }
  OUTLINED_FUNCTION_38();
}

uint64_t specialized _ArrayProtocol.filter(_:)(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = result;
  v2 = *(_QWORD *)(result + 16);
  if (v2)
  {
    v3 = 0;
    v4 = result + 40;
    v15 = MEMORY[0x24BEE4AF8];
    v14 = result + 40;
    do
    {
      v5 = (uint64_t *)(v4 + 16 * v3);
      v6 = v3;
      while (1)
      {
        if (v6 >= *(_QWORD *)(v1 + 16))
        {
          __break(1u);
          return result;
        }
        v7 = *(v5 - 1);
        v8 = *v5;
        v3 = v6 + 1;
        lazy protocol witness table accessor for type String and conformance String();
        swift_bridgeObjectRetain();
        if ((StringProtocol.contains<A>(_:)() & 1) != 0)
          break;
        result = swift_bridgeObjectRelease();
        v5 += 2;
        ++v6;
        if (v2 == v3)
          goto LABEL_15;
      }
      v9 = v15;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v15 + 16) + 1, 1);
        v9 = v15;
      }
      v11 = *(_QWORD *)(v9 + 16);
      v10 = *(_QWORD *)(v9 + 24);
      v12 = v11 + 1;
      if (v11 >= v10 >> 1)
      {
        result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1);
        v12 = v11 + 1;
        v9 = v15;
      }
      *(_QWORD *)(v9 + 16) = v12;
      v15 = v9;
      v13 = v9 + 16 * v11;
      *(_QWORD *)(v13 + 32) = v7;
      *(_QWORD *)(v13 + 40) = v8;
      v4 = v14;
    }
    while (v2 - 1 != v6);
  }
  else
  {
    v15 = MEMORY[0x24BEE4AF8];
  }
LABEL_15:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

void TapToRadarWithPolicyManager.__allocating_init()()
{
  OUTLINED_FUNCTION_26();
  __break(1u);
}

void TapToRadarWithPolicyManager.init()()
{
  OUTLINED_FUNCTION_26();
  __break(1u);
}

uint64_t TapToRadarWithPolicyManager.__ivar_destroyer()
{
  uint64_t v0;

  return outlined consume of Policy?(*(_QWORD *)(v0 + 136));
}

void TapToRadarWithPolicyManager.deinit()
{
  uint64_t v0;

  v0 = TapToRadarManager.deinit();
  OUTLINED_FUNCTION_15_0(v0);
  OUTLINED_FUNCTION_8();
}

uint64_t TapToRadarWithPolicyManager.__deallocating_deinit()
{
  uint64_t v0;

  v0 = TapToRadarManager.deinit();
  OUTLINED_FUNCTION_15_0(v0);
  return swift_deallocClassInstance();
}

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t specialized UnsafeMutablePointer.initialize(from:count:)(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t closure #1 in OSLogArguments.append(_:)(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v7, a3);
  v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  result = OUTLINED_FUNCTION_23_0();
  *a1 = v8;
  return result;
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
    OUTLINED_FUNCTION_36();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
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

_BYTE **closure #1 in OSLogArguments.append(_:)(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void outlined init with take of Any??(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  OUTLINED_FUNCTION_8();
}

uint64_t outlined copy of Policy?(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t outlined consume of Policy?(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type TapToRadarWithPolicyManager.DefaultPolicyKeys and conformance TapToRadarWithPolicyManager.DefaultPolicyKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TapToRadarWithPolicyManager.DefaultPolicyKeys and conformance TapToRadarWithPolicyManager.DefaultPolicyKeys;
  if (!lazy protocol witness table cache variable for type TapToRadarWithPolicyManager.DefaultPolicyKeys and conformance TapToRadarWithPolicyManager.DefaultPolicyKeys)
  {
    result = MEMORY[0x2199B062C](&protocol conformance descriptor for TapToRadarWithPolicyManager.DefaultPolicyKeys, &type metadata for TapToRadarWithPolicyManager.DefaultPolicyKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TapToRadarWithPolicyManager.DefaultPolicyKeys and conformance TapToRadarWithPolicyManager.DefaultPolicyKeys);
  }
  return result;
}

uint64_t destroy for Policy()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Policy(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Policy(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
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

uint64_t assignWithTake for Policy(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for Policy(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 25))
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

uint64_t storeEnumTagSinglePayload for Policy(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 25) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Policy()
{
  return &type metadata for Policy;
}

uint64_t type metadata accessor for TapToRadarWithPolicyManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for TapToRadarWithPolicyManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TapToRadarWithPolicyManager.__allocating_init(data:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 352))();
}

uint64_t dispatch thunk of TapToRadarWithPolicyManager.__allocating_init(policy:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 360))();
}

uint64_t dispatch thunk of TapToRadarWithPolicyManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:duc:radarFilingExtras:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of TapToRadarWithPolicyManager.doesPolicyDataAllowFilingIssue(errStatus:duc:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t getEnumTagSinglePayload for TapToRadarWithPolicyManager.DefaultPolicyKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF9)
  {
    if (a2 + 7 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 7) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v5 = v6 - 8;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for TapToRadarWithPolicyManager.DefaultPolicyKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_2132BD458 + 4 * byte_2132C5595[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_2132BD48C + 4 * byte_2132C5590[v4]))();
}

uint64_t sub_2132BD48C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132BD494(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2132BD49CLL);
  return result;
}

uint64_t sub_2132BD4A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2132BD4B0);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_2132BD4B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132BD4BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TapToRadarWithPolicyManager.DefaultPolicyKeys()
{
  return &type metadata for TapToRadarWithPolicyManager.DefaultPolicyKeys;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x2199B062C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
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
    specialized UnsafeMutablePointer.initialize(from:count:)((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  uint64_t v0;

  return outlined consume of Policy?(v0);
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return swift_bridgeObjectRelease_n();
}

BOOL OUTLINED_FUNCTION_5_2(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_10_1(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return swift_bridgeObjectRelease_n();
}

id OUTLINED_FUNCTION_14_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  return objc_msgSend(v1, (SEL)(v2 + 3400), a1);
}

uint64_t OUTLINED_FUNCTION_15_0(uint64_t a1)
{
  return outlined consume of Policy?(*(_QWORD *)(a1 + 136));
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return type metadata accessor for Logger();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return static Logger.logger.getter();
}

BOOL OUTLINED_FUNCTION_20_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return static Logger.logger.getter();
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return 0x6C6C41796E6544;
}

uint64_t OUTLINED_FUNCTION_26()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return 0x776F6C6C41435544;
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  uint64_t v0;

  return v0 - 104;
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return Logger.logObject.getter();
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  return swift_bridgeObjectRetain();
}

id OUTLINED_FUNCTION_35_0()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 3912));
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t OUTLINED_FUNCTION_41()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_42_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return static os_log_type_t.error.getter();
}

void OUTLINED_FUNCTION_44_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  outlined init with take of Any??(v3 - 192, v3 - 160, a3);
}

void OUTLINED_FUNCTION_46_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  outlined init with take of Any??(v3 - 160, v3 - 128, a3);
}

void OUTLINED_FUNCTION_47_0()
{
  unsigned __int8 v0;

  Hasher._combine(_:)(v0);
}

void OUTLINED_FUNCTION_48_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t SiriEnvironment.homeKitProvider.getter()
{
  type metadata accessor for HomeKitProvider();
  lazy protocol witness table accessor for type HomeKitProvider and conformance HomeKitProvider(&lazy protocol witness table cache variable for type HomeKitProvider and conformance HomeKitProvider, (uint64_t)&protocol conformance descriptor for HomeKitProvider);
  return dispatch thunk of SiriEnvironment.subscript.getter();
}

uint64_t type metadata accessor for HomeKitProvider()
{
  return objc_opt_self();
}

uint64_t key path setter for SiriEnvironment.homeKitProvider : SiriEnvironment()
{
  swift_retain();
  return SiriEnvironment.homeKitProvider.setter();
}

uint64_t SiriEnvironment.homeKitProvider.setter()
{
  type metadata accessor for HomeKitProvider();
  lazy protocol witness table accessor for type HomeKitProvider and conformance HomeKitProvider(&lazy protocol witness table cache variable for type HomeKitProvider and conformance HomeKitProvider, (uint64_t)&protocol conformance descriptor for HomeKitProvider);
  return dispatch thunk of SiriEnvironment.subscript.setter();
}

void SiriEnvironment.homeKitProvider.modify(uint64_t *a1)
{
  uint64_t v1;

  a1[1] = v1;
  a1[2] = type metadata accessor for HomeKitProvider();
  a1[3] = lazy protocol witness table accessor for type HomeKitProvider and conformance HomeKitProvider(&lazy protocol witness table cache variable for type HomeKitProvider and conformance HomeKitProvider, (uint64_t)&protocol conformance descriptor for HomeKitProvider);
  *a1 = dispatch thunk of SiriEnvironment.subscript.getter();
  OUTLINED_FUNCTION_1();
}

uint64_t SiriEnvironment.homeKitProvider.modify(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    return OUTLINED_FUNCTION_235();
  swift_retain();
  OUTLINED_FUNCTION_235();
  return swift_release();
}

unint64_t protocol witness for HomeKitHelperProtocol.areHomesConfigured() in conformance HomeKitHelper()
{
  return (unint64_t)@nonobjc HomeKitHelper.areHomesConfigured()() & 1;
}

id @nonobjc HomeKitHelper.areHomesConfigured()()
{
  void *v0;

  return objc_msgSend(v0, sel_areHomesConfigured);
}

unint64_t protocol witness for HomeKitHelperProtocol.areAnyAccessoriesConfigured() in conformance HomeKitHelper()
{
  return (unint64_t)@nonobjc HomeKitHelper.areAnyAccessoriesConfigured()() & 1;
}

id @nonobjc HomeKitHelper.areAnyAccessoriesConfigured()()
{
  void *v0;

  return objc_msgSend(v0, sel_areAnyAccessoriesConfigured);
}

unint64_t protocol witness for HomeKitHelperProtocol.areAnySpeakersConfigured() in conformance HomeKitHelper()
{
  return (unint64_t)@nonobjc HomeKitHelper.areAnySpeakersConfigured()() & 1;
}

id @nonobjc HomeKitHelper.areAnySpeakersConfigured()()
{
  void *v0;

  return objc_msgSend(v0, sel_areAnySpeakersConfigured);
}

uint64_t key path setter for HomeKitProvider.mock : HomeKitProvider(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)a2 + 128);
  v3 = swift_retain();
  return v2(v3);
}

uint64_t HomeKitProvider.mock.getter()
{
  OUTLINED_FUNCTION_4_1();
  return swift_retain();
}

void HomeKitProvider.mock.setter(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_4_1();
  *(_QWORD *)(v1 + 16) = a1;
  swift_release();
  OUTLINED_FUNCTION_2_1();
}

uint64_t (*HomeKitProvider.mock.modify())()
{
  OUTLINED_FUNCTION_4_1();
  return RefreshableSharedContext.sharedContext.modify;
}

uint64_t key path getter for HomeKitProvider.homeKitHelper : HomeKitProvider(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 144))();
}

uint64_t key path setter for HomeKitProvider.homeKitHelper : HomeKitProvider(uint64_t a1, uint64_t a2)
{
  _BYTE v4[40];

  outlined init with copy of SiriLocationProvider(a1, (uint64_t)v4);
  return (*(uint64_t (**)(_BYTE *))(**(_QWORD **)a2 + 152))(v4);
}

uint64_t HomeKitProvider.homeKitHelper.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeKitHelperProtocol>);
  swift_getKeyPath();
  swift_getKeyPath();
  lazy protocol witness table accessor for type HomeKitProvider and conformance HomeKitProvider(&lazy protocol witness table cache variable for type HomeKitProvider and conformance HomeKitProvider, (uint64_t)&protocol conformance descriptor for HomeKitProvider);
  static MockablePublished.subscript.getter();
  swift_release();
  return swift_release();
}

void sub_2132BDC68(uint64_t a1)
{
  (*(void (**)(void))(**(_QWORD **)a1 + 144))();
  OUTLINED_FUNCTION_8();
}

uint64_t HomeKitProvider.homeKitHelper.setter(uint64_t a1)
{
  _BYTE v3[40];

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeKitHelperProtocol>);
  swift_getKeyPath();
  swift_getKeyPath();
  outlined init with copy of SiriLocationProvider(a1, (uint64_t)v3);
  lazy protocol witness table accessor for type HomeKitProvider and conformance HomeKitProvider(&lazy protocol witness table cache variable for type HomeKitProvider and conformance HomeKitProvider, (uint64_t)&protocol conformance descriptor for HomeKitProvider);
  OUTLINED_FUNCTION_22();
  static MockablePublished.subscript.setter();
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

void (*HomeKitProvider.homeKitHelper.modify(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeKitHelperProtocol>);
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  lazy protocol witness table accessor for type HomeKitProvider and conformance HomeKitProvider(&lazy protocol witness table cache variable for type HomeKitProvider and conformance HomeKitProvider, (uint64_t)&protocol conformance descriptor for HomeKitProvider);
  v2[6] = static MockablePublished.subscript.modify();
  return HomeKitProvider.homeKitHelper.modify;
}

void HomeKitProvider.homeKitHelper.modify(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  OUTLINED_FUNCTION_14_0();
  swift_release();
  free(v1);
}

uint64_t key path setter for HomeKitProvider.$homeKitHelper : HomeKitProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeKitHelperProtocol>.Publisher);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 176))(v6);
}

void HomeKitProvider.$homeKitHelper.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_22();
  dispatch thunk of MockablePublished.projectedValue.getter();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_1();
}

uint64_t HomeKitProvider.$homeKitHelper.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeKitHelperProtocol>.Publisher);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_4_1();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  OUTLINED_FUNCTION_22();
  dispatch thunk of MockablePublished.projectedValue.setter();
  OUTLINED_FUNCTION_14_0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void HomeKitProvider.$homeKitHelper.modify(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeKitHelperProtocol>.Publisher);
  v3[1] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[2] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[3] = malloc(v6);
  v3[4] = malloc(v6);
  HomeKitProvider.$homeKitHelper.getter();
  OUTLINED_FUNCTION_1();
}

void HomeKitProvider.$homeKitHelper.modify(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD **)a1;
  v3 = *(void **)(*(_QWORD *)a1 + 24);
  v4 = *(void **)(*(_QWORD *)a1 + 32);
  if ((a2 & 1) != 0)
  {
    v5 = v2[1];
    v6 = v2[2];
    (*(void (**)(_QWORD, void *, uint64_t))(v6 + 16))(*(_QWORD *)(*(_QWORD *)a1 + 24), v4, v5);
    HomeKitProvider.$homeKitHelper.setter((uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    HomeKitProvider.$homeKitHelper.setter(*(_QWORD *)(*(_QWORD *)a1 + 32));
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t HomeKitProvider.__allocating_init(storage:)()
{
  uint64_t v0;

  v0 = swift_allocObject();
  HomeKitProvider.init(storage:)();
  return v0;
}

uint64_t HomeKitProvider.init(storage:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (**v5)(uint64_t, uint64_t);
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  char v12;
  _BYTE v14[40];
  _QWORD v15[5];

  v1 = v0;
  v2 = type metadata accessor for Logger();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (uint64_t (**)(uint64_t, uint64_t))&v14[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(_QWORD *)(v0 + 16) = 0;
  v6 = objc_msgSend(objc_allocWithZone((Class)HomeKitHelper), sel_init);
  v15[3] = type metadata accessor for HomeKitHelper();
  v15[4] = &protocol witness table for HomeKitHelper;
  v15[0] = v6;
  outlined init with copy of SiriLocationProvider((uint64_t)v15, (uint64_t)v14);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeKitHelperProtocol>);
  swift_allocObject();
  v7 = v6;
  v8 = MockablePublished.init(wrappedValue:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);

  *(_QWORD *)(v1 + 24) = v8;
  *(_WORD *)(v1 + 32) = 0;
  *(_BYTE *)(v1 + 34) = 0;
  static Logger.logger.getter();
  v9 = Logger.logObject.getter();
  v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_2132A2000, v9, v10, "HomeKitProvider init", v11, 2u);
    MEMORY[0x2199B06A4](v11, -1, -1);
  }

  (*(void (**)(uint64_t (**)(uint64_t, uint64_t), uint64_t))(v3 + 8))(v5, v2);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_5();
  *(_BYTE *)(v1 + 32) = OUTLINED_FUNCTION_3_4(v5[1]) & 1;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_5();
  *(_BYTE *)(v1 + 33) = OUTLINED_FUNCTION_3_4(v5[2]) & 1;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_5();
  v12 = OUTLINED_FUNCTION_3_4(v5[3]);
  swift_release();
  *(_BYTE *)(v1 + 34) = v12 & 1;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v1;
}

unint64_t type metadata accessor for HomeKitHelper()
{
  unint64_t result;

  result = lazy cache variable for type metadata for HomeKitHelper;
  if (!lazy cache variable for type metadata for HomeKitHelper)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for HomeKitHelper);
  }
  return result;
}

Swift::Bool __swiftcall HomeKitProvider.areHomesConfigured(refresh:)(Swift::Bool refresh)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Swift::Bool result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (refresh)
  {
    v3 = OUTLINED_FUNCTION_0_5(refresh);
    OUTLINED_FUNCTION_5_3((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10, v13, v14, v15, v16, v17);
    v11 = OUTLINED_FUNCTION_4_2(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
    *(_BYTE *)(v1 + 32) = v11 & 1;
    OUTLINED_FUNCTION_14_2(v11);
  }
  OUTLINED_FUNCTION_2_4();
  return result;
}

Swift::Bool __swiftcall HomeKitProvider.areAnyAccessoriesConfigured(refresh:)(Swift::Bool refresh)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Swift::Bool result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (refresh)
  {
    v3 = OUTLINED_FUNCTION_0_5(refresh);
    OUTLINED_FUNCTION_5_3((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10, v13, v14, v15, v16, v17);
    v11 = OUTLINED_FUNCTION_4_2(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16));
    *(_BYTE *)(v1 + 33) = v11 & 1;
    OUTLINED_FUNCTION_14_2(v11);
  }
  OUTLINED_FUNCTION_2_4();
  return result;
}

Swift::Bool __swiftcall HomeKitProvider.areAnySpeakersConfigured(refresh:)(Swift::Bool refresh)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Swift::Bool result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (refresh)
  {
    v3 = OUTLINED_FUNCTION_0_5(refresh);
    OUTLINED_FUNCTION_5_3((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10, v13, v14, v15, v16, v17);
    v11 = OUTLINED_FUNCTION_4_2(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 24));
    *(_BYTE *)(v1 + 34) = v11 & 1;
    OUTLINED_FUNCTION_14_2(v11);
  }
  OUTLINED_FUNCTION_2_4();
  return result;
}

uint64_t HomeKitProvider.debugInfo.getter()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_2132C4400;
  *(_QWORD *)(v1 + 32) = 0xD000000000000035;
  *(_QWORD *)(v1 + 40) = 0x80000002132C6390;
  _StringGuts.grow(_:)(22);
  OUTLINED_FUNCTION_10_2();
  if (v0[32])
    v2 = 1702195828;
  else
    v2 = 0x65736C6166;
  OUTLINED_FUNCTION_13_2(v2);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 48) = 0xD000000000000014;
  *(_QWORD *)(v1 + 56) = 0x80000002132C63D0;
  _StringGuts.grow(_:)(31);
  OUTLINED_FUNCTION_10_2();
  if (v0[33])
    v3 = 1702195828;
  else
    v3 = 0x65736C6166;
  OUTLINED_FUNCTION_13_2(v3);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 64) = 0xD00000000000001DLL;
  *(_QWORD *)(v1 + 72) = 0x80000002132C63F0;
  _StringGuts.grow(_:)(28);
  OUTLINED_FUNCTION_10_2();
  if (v0[34])
    v4 = 1702195828;
  else
    v4 = 0x65736C6166;
  if (v0[34])
    v5 = 0xE400000000000000;
  else
    v5 = 0xE500000000000000;
  v6 = v5;
  String.append(_:)(*(Swift::String *)&v4);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 80) = 0xD00000000000001ALL;
  *(_QWORD *)(v1 + 88) = 0x80000002132C6410;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  lazy protocol witness table accessor for type [String] and conformance [A]();
  v7 = BidirectionalCollection<>.joined(separator:)();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t HomeKitProvider.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return v0;
}

uint64_t HomeKitProvider.__deallocating_deinit()
{
  HomeKitProvider.deinit();
  return swift_deallocClassInstance();
}

uint64_t protocol witness for MockableEnvironmentProvider.mock.getter in conformance HomeKitProvider()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t protocol witness for MockableEnvironmentProvider.mock.setter in conformance HomeKitProvider()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

void (*protocol witness for MockableEnvironmentProvider.mock.modify in conformance HomeKitProvider(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 136))();
  return protocol witness for MockableEnvironmentProvider.mock.modify in conformance HomeKitProvider;
}

void protocol witness for MockableEnvironmentProvider.mock.modify in conformance HomeKitProvider(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t protocol witness for MockableEnvironmentProvider.mock<A>(override:run:) in conformance HomeKitProvider()
{
  type metadata accessor for HomeKitProvider();
  return MockableEnvironmentProvider.mock<A>(override:run:)();
}

uint64_t protocol witness for MockableEnvironmentProvider.install(_:) in conformance HomeKitProvider()
{
  type metadata accessor for HomeKitProvider();
  return MockableEnvironmentProvider.install(_:)();
}

uint64_t protocol witness for static MockableEnvironmentProvider.adjustMock(_:) in conformance HomeKitProvider()
{
  type metadata accessor for HomeKitProvider();
  return swift_retain();
}

uint64_t protocol witness for SiriEnvironmentProvider.init(storage:) in conformance HomeKitProvider()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance HomeKitProvider@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for HomeKitProvider();
  result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type [String] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [String] and conformance [A];
  if (!lazy protocol witness table cache variable for type [String] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String]);
    result = MEMORY[0x2199B062C](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A]);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199B0620](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t base witness table accessor for SiriEnvironmentProvider in HomeKitProvider()
{
  return lazy protocol witness table accessor for type HomeKitProvider and conformance HomeKitProvider(&lazy protocol witness table cache variable for type HomeKitProvider and conformance HomeKitProvider, (uint64_t)&protocol conformance descriptor for HomeKitProvider);
}

uint64_t base witness table accessor for ObservableObject in HomeKitProvider()
{
  return lazy protocol witness table accessor for type HomeKitProvider and conformance HomeKitProvider(&lazy protocol witness table cache variable for type HomeKitProvider and conformance HomeKitProvider, (uint64_t)&protocol conformance descriptor for HomeKitProvider);
}

uint64_t lazy protocol witness table accessor for type HomeKitProvider and conformance HomeKitProvider(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for HomeKitProvider();
    result = MEMORY[0x2199B062C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_2132BE908(uint64_t *a1@<X8>)
{
  *a1 = SiriEnvironment.homeKitProvider.getter();
  OUTLINED_FUNCTION_8();
}

void sub_2132BE930(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 120))();
  OUTLINED_FUNCTION_8();
}

void sub_2132BE960(uint64_t a1)
{
  (*(void (**)(void))(**(_QWORD **)a1 + 168))();
  OUTLINED_FUNCTION_8();
}

uint64_t dispatch thunk of HomeKitHelperProtocol.areHomesConfigured()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of HomeKitHelperProtocol.areAnyAccessoriesConfigured()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of HomeKitHelperProtocol.areAnySpeakersConfigured()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t method lookup function for HomeKitProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HomeKitProvider.mock.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of HomeKitProvider.mock.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of HomeKitProvider.mock.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of HomeKitProvider.homeKitHelper.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of HomeKitProvider.homeKitHelper.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of HomeKitProvider.homeKitHelper.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of HomeKitProvider.$homeKitHelper.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of HomeKitProvider.$homeKitHelper.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of HomeKitProvider.$homeKitHelper.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of HomeKitProvider.__allocating_init(storage:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t dispatch thunk of HomeKitProvider.areHomesConfigured(refresh:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of HomeKitProvider.areAnyAccessoriesConfigured(refresh:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of HomeKitProvider.areAnySpeakersConfigured(refresh:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of HomeKitProvider.debugInfo.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

_QWORD *OUTLINED_FUNCTION_0_5(uint64_t a1, ...)
{
  uint64_t v1;
  va_list va;

  va_start(va, a1);
  return (*(_QWORD *(**)(uint64_t *__return_ptr))(*(_QWORD *)v1 + 144))((uint64_t *)va);
}

_QWORD *OUTLINED_FUNCTION_1_5()
{
  uint64_t v0;

  return __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 - 104), *(_QWORD *)(v0 - 80));
}

uint64_t OUTLINED_FUNCTION_3_4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_4_2@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

_QWORD *OUTLINED_FUNCTION_5_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return __swift_project_boxed_opaque_existential_1(&a10, a13);
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  uint64_t (*v0)(void);

  return v0();
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_13_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1;
  String.append(_:)(*(Swift::String *)&a1);
}

uint64_t OUTLINED_FUNCTION_14_2(uint64_t a1, ...)
{
  va_list va;

  va_start(va, a1);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)va);
}

void TapToRadarManager.init()()
{
  _QWORD *v0;
  uint64_t v1;

  v0[2] = 0;
  v0[3] = 0xE000000000000000;
  v0[4] = Dictionary.init(dictionaryLiteral:)();
  v0[5] = 0;
  v0[6] = 0xE000000000000000;
  v0[7] = 0xD000000000000014;
  v0[8] = 0x80000002132C64C0;
  v0[9] = 0x7274745F69726973;
  v0[10] = 0xE800000000000000;
  v0[11] = 0x726F727265;
  v0[12] = 0xE500000000000000;
  v0[13] = 40;
  v0[14] = OUTLINED_FUNCTION_2_3();
  if (GetSystemBuildVersionString())
  {
    v0[15] = String.init(cString:)();
    v0[16] = v1;
    OUTLINED_FUNCTION_8();
  }
  else
  {
    __break(1u);
  }
}

void TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 *v30;
  __int128 *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  __int128 v45;
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
  uint64_t v57;
  _QWORD v58[6];
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62[6];

  OUTLINED_FUNCTION_85();
  v26 = v24;
  v49 = v27;
  v54 = v28;
  v50 = v29;
  v31 = v30;
  v53 = v32;
  v48 = v33;
  v52 = v34;
  v47 = v35;
  v51 = *v24;
  v57 = *(_QWORD *)(OUTLINED_FUNCTION_47_1() - 8);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v36);
  v56 = OUTLINED_FUNCTION_2_5();
  v55 = *(_QWORD *)(v56 - 8);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v37);
  v38 = OUTLINED_FUNCTION_15_1();
  v39 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  OUTLINED_FUNCTION_30_1();
  v40 = v31[1];
  v59 = *v31;
  v60 = v40;
  v61 = *((_QWORD *)v31 + 4);
  outlined init with take of RadarFilingExtras?(a22, (uint64_t)v62, &demangling cache variable for type metadata for RadarFilingExtras?);
  OUTLINED_FUNCTION_41_0();
  v41 = Logger.logObject.getter();
  v42 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v41, v42))
  {
    v43 = (uint8_t *)OUTLINED_FUNCTION_2_3();
    *(_WORD *)v43 = 0;
    OUTLINED_FUNCTION_10_1(&dword_2132A2000, v41, v42, "TapToRadarManager#createProblem, attempting to create problem...", v43);
    OUTLINED_FUNCTION_3_1();
  }

  OUTLINED_FUNCTION_65_0((uint64_t)v24, *(uint64_t (**)(uint64_t, uint64_t))(v39 + 8));
  if (one-time initialization token for runQueue != -1)
    swift_once();
  v44 = OUTLINED_FUNCTION_63_0();
  v45 = v60;
  *(_OWORD *)(v44 + 88) = v59;
  *(_QWORD *)(v44 + 16) = v26;
  *(_QWORD *)(v44 + 24) = v47;
  *(_QWORD *)(v44 + 32) = v52;
  *(_QWORD *)(v44 + 40) = v48;
  *(_QWORD *)(v44 + 48) = v53;
  *(_QWORD *)(v44 + 56) = a23;
  *(_QWORD *)(v44 + 64) = a24;
  *(_QWORD *)(v44 + 72) = v49;
  *(_QWORD *)(v44 + 80) = a21;
  *(_OWORD *)(v44 + 104) = v45;
  *(_QWORD *)(v44 + 120) = v61;
  *(_QWORD *)(v44 + 128) = v50;
  *(_QWORD *)(v44 + 136) = v54;
  outlined init with take of RadarFilingExtras?((uint64_t)v62, v44 + 144, &demangling cache variable for type metadata for RadarFilingExtras?);
  *(_QWORD *)(v44 + 184) = v51;
  v58[4] = partial apply for closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:);
  v58[5] = v44;
  v58[0] = MEMORY[0x24BDAC760];
  v58[1] = 1107296256;
  v58[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  v58[3] = &block_descriptor;
  _Block_copy(v58);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  outlined retain of TTRComponentInfo((uint64_t)&v59);
  swift_bridgeObjectRetain();
  outlined retain of RadarFilingExtras?(v62);
  OUTLINED_FUNCTION_50_0();
  lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  OUTLINED_FUNCTION_57_0();
  OUTLINED_FUNCTION_49_0(&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A]);
  OUTLINED_FUNCTION_32_1();
  v46 = OUTLINED_FUNCTION_19();
  MEMORY[0x2199B00B0](v46);
  OUTLINED_FUNCTION_70_0();
  OUTLINED_FUNCTION_14_3(v57);
  (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v25, v56);
  swift_release();
  OUTLINED_FUNCTION_38();
}

uint64_t TapToRadarManager.deinit()
{
  uint64_t v0;

  OUTLINED_FUNCTION_43_1();
  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_37_1();
  swift_bridgeObjectRelease();
  return v0;
}

void TapToRadarManager.requestID.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_68_0();
}

void TapToRadarManager.requestID.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_228();
  OUTLINED_FUNCTION_4_1();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18_0();
}

void TapToRadarManager.requestID.modify()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_8();
}

uint64_t TapToRadarManager.ttrRequestManager.getter()
{
  OUTLINED_FUNCTION_4_1();
  return swift_bridgeObjectRetain();
}

void TapToRadarManager.ttrRequestManager.setter(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_4_1();
  *(_QWORD *)(v1 + 32) = a1;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_68_0();
}

void TapToRadarManager.ttrRequestManager.modify()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_8();
}

void TapToRadarManager.requestText.getter()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_68_0();
}

void TapToRadarManager.requestText.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_228();
  OUTLINED_FUNCTION_4_1();
  *(_QWORD *)(v1 + 40) = v2;
  *(_QWORD *)(v1 + 48) = v0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18_0();
}

void TapToRadarManager.requestText.modify()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_8();
}

Swift::Void __swiftcall TapToRadarManager.populateSiriRequestText()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[6];

  OUTLINED_FUNCTION_85();
  v6 = *(_QWORD *)(OUTLINED_FUNCTION_47_1() - 8);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v2);
  v3 = OUTLINED_FUNCTION_2_5();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_31_1();
  if (one-time initialization token for runQueue != -1)
    swift_once();
  v7[4] = partial apply for closure #1 in TapToRadarManager.populateSiriRequestText();
  v7[5] = v0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  v7[3] = &block_descriptor_3;
  _Block_copy(v7);
  swift_retain();
  OUTLINED_FUNCTION_50_0();
  lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  OUTLINED_FUNCTION_57_0();
  OUTLINED_FUNCTION_49_0(&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  v5 = OUTLINED_FUNCTION_19();
  MEMORY[0x2199B00B0](v5);
  OUTLINED_FUNCTION_70_0();
  OUTLINED_FUNCTION_14_3(v6);
  OUTLINED_FUNCTION_65_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  swift_release();
  OUTLINED_FUNCTION_38();
}

Swift::OpaquePointer_optional __swiftcall TapToRadarManager.getDefaultsContents(userDefaultSuiteName:)(Swift::String userDefaultSuiteName)
{
  uint64_t v1;
  uint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  Swift::Bool v10;
  void *v11;
  _OWORD v12[2];
  __int128 v13;
  __int128 v14;
  Swift::OpaquePointer_optional result;

  v2 = v1;
  object = userDefaultSuiteName._object;
  countAndFlagsBits = userDefaultSuiteName._countAndFlagsBits;
  v5 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  swift_bridgeObjectRetain();
  v6 = @nonobjc NSUserDefaults.init(suiteName:)(countAndFlagsBits, (uint64_t)object);
  if (!v6)
  {
    v13 = 0u;
    v14 = 0u;
LABEL_10:
    outlined destroy of AudioDestination?((uint64_t)&v13, &demangling cache variable for type metadata for Any?);
    v11 = 0;
    goto LABEL_11;
  }
  v7 = v6;
  v8 = (void *)MEMORY[0x2199AFF9C](*(_QWORD *)(v2 + 72), *(_QWORD *)(v2 + 80));
  v9 = objc_msgSend(v7, sel_objectForKey_, v8);
  OUTLINED_FUNCTION_62_0();

  if (v5)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
  }
  outlined init with take of RadarFilingExtras?((uint64_t)v12, (uint64_t)&v13, &demangling cache variable for type metadata for Any?);
  if (!*((_QWORD *)&v14 + 1))
    goto LABEL_10;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : [String : String]]);
  if (swift_dynamicCast())
    v11 = *(void **)&v12[0];
  else
    v11 = 0;
LABEL_11:
  result.value._rawValue = v11;
  result.is_nil = v10;
  return result;
}

Swift::Void __swiftcall TapToRadarManager.writeDefaultsContents(contents:userDefaultSuiteName:)(Swift::OpaquePointer contents, Swift::String userDefaultSuiteName)
{
  uint64_t v2;
  uint64_t v3;
  void *object;
  uint64_t countAndFlagsBits;
  id v6;
  void *v7;
  Class isa;
  id v9;

  v3 = v2;
  object = userDefaultSuiteName._object;
  countAndFlagsBits = userDefaultSuiteName._countAndFlagsBits;
  objc_allocWithZone(MEMORY[0x24BDBCF50]);
  OUTLINED_FUNCTION_1_6();
  v6 = @nonobjc NSUserDefaults.init(suiteName:)(countAndFlagsBits, (uint64_t)object);
  if (v6)
  {
    v7 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    v9 = (id)MEMORY[0x2199AFF9C](*(_QWORD *)(v3 + 72), *(_QWORD *)(v3 + 80));
    objc_msgSend(v7, sel_setValue_forKey_, isa, v9);

  }
}

void TapToRadarManager.setupLaunchTTR(createDraftContainer:title:completion:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const void *v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[6];
  _BYTE v23[120];

  OUTLINED_FUNCTION_85();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v18 = *v0;
  v21 = *(_QWORD *)(OUTLINED_FUNCTION_47_1() - 8);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v8);
  v20 = OUTLINED_FUNCTION_2_5();
  v19 = *(_QWORD *)(v20 - 8);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v9);
  v10 = OUTLINED_FUNCTION_15_1();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_30_1();
  memcpy(v23, v7, 0x70uLL);
  OUTLINED_FUNCTION_41_0();
  v12 = Logger.logObject.getter();
  v13 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)OUTLINED_FUNCTION_2_3();
    *(_WORD *)v14 = 0;
    OUTLINED_FUNCTION_10_1(&dword_2132A2000, v12, v13, "TapToRadarManager#setupLaunchTTR", v14);
    OUTLINED_FUNCTION_3_1();
  }

  (*(void (**)(uint64_t *, uint64_t))(v11 + 8))(v0, v10);
  type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for OS_dispatch_queue);
  v15 = (void *)static OS_dispatch_queue.main.getter();
  v16 = (_QWORD *)OUTLINED_FUNCTION_63_0();
  memcpy(v16 + 2, v23, 0x70uLL);
  v16[16] = v5;
  v16[17] = v3;
  v16[18] = v18;
  v22[4] = partial apply for closure #1 in TapToRadarManager.setupLaunchTTR(createDraftContainer:title:completion:);
  v22[5] = v16;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 1107296256;
  v22[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  v22[3] = &block_descriptor_9;
  _Block_copy(v22);
  outlined retain of TapToRadarManager.CreateDraftContainer((uint64_t)v23);
  swift_retain();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_50_0();
  v22[0] = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  OUTLINED_FUNCTION_57_0();
  OUTLINED_FUNCTION_49_0(&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A]);
  OUTLINED_FUNCTION_32_1();
  v17 = OUTLINED_FUNCTION_19();
  MEMORY[0x2199B00B0](v17);
  OUTLINED_FUNCTION_70_0();

  OUTLINED_FUNCTION_14_3(v21);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v1, v20);
  OUTLINED_FUNCTION_38();
}

Swift::Bool __swiftcall TapToRadarManager.hasFiledThisIssue(errStatus:userDefaultSuiteName:)(Swift::String errStatus, Swift::String userDefaultSuiteName)
{
  uint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Bool result;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;

  object = errStatus._object;
  countAndFlagsBits = errStatus._countAndFlagsBits;
  v5 = (*(uint64_t (**)(uint64_t, void *))(*(_QWORD *)v2 + 248))(userDefaultSuiteName._countAndFlagsBits, userDefaultSuiteName._object);
  if (!v5
    || (v6 = v5,
        OUTLINED_FUNCTION_1_6(),
        v7 = OUTLINED_FUNCTION_3_5(),
        specialized Dictionary.subscript.getter(v7, v8, v6),
        v10 = v9,
        OUTLINED_FUNCTION_23_0(),
        OUTLINED_FUNCTION_28_0(),
        !v10))
  {
LABEL_28:
    OUTLINED_FUNCTION_26_0();
    return result;
  }
  v11 = 0;
  v12 = v10 + 64;
  OUTLINED_FUNCTION_24_0();
  v16 = v15 & v14;
  v18 = (unint64_t)(v17 + 63) >> 6;
  while (v16)
  {
    v19 = __clz(__rbit64(v16));
    v16 &= v16 - 1;
    v20 = v19 | (v11 << 6);
LABEL_20:
    v24 = (_QWORD *)(*(_QWORD *)(v10 + 56) + 16 * v20);
    if (*v24 != countAndFlagsBits || v24[1] != (_QWORD)object)
    {
      result = _stringCompareWithSmolCheck(_:_:expecting:)();
      if (!result)
        continue;
    }
LABEL_27:
    OUTLINED_FUNCTION_236();
    goto LABEL_28;
  }
  v21 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
    goto LABEL_30;
  }
  if (v21 >= v18)
    goto LABEL_27;
  v22 = *(_QWORD *)(v12 + 8 * v21);
  ++v11;
  if (v22)
    goto LABEL_19;
  v11 = v21 + 1;
  if (v21 + 1 >= v18)
    goto LABEL_27;
  v22 = *(_QWORD *)(v12 + 8 * v11);
  if (v22)
    goto LABEL_19;
  v11 = v21 + 2;
  if (v21 + 2 >= v18)
    goto LABEL_27;
  v22 = *(_QWORD *)(v12 + 8 * v11);
  if (v22)
  {
LABEL_19:
    v16 = (v22 - 1) & v22;
    v20 = __clz(__rbit64(v22)) + (v11 << 6);
    goto LABEL_20;
  }
  v23 = v21 + 3;
  if (v23 >= v18)
    goto LABEL_27;
  v22 = *(_QWORD *)(v12 + 8 * v23);
  if (v22)
  {
    v11 = v23;
    goto LABEL_19;
  }
  while (1)
  {
    v11 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v11 >= v18)
      goto LABEL_27;
    v22 = *(_QWORD *)(v12 + 8 * v11);
    ++v23;
    if (v22)
      goto LABEL_19;
  }
LABEL_30:
  __break(1u);
  return result;
}

Swift::String __swiftcall TapToRadarManager.getRequestID()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  Swift::String result;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FlowTaskMetadata?);
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v0);
  v2 = (uint64_t *)((char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  OUTLINED_FUNCTION_46_1();
  OUTLINED_FUNCTION_60_0();
  OUTLINED_FUNCTION_59_0();
  lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t (*)(uint64_t))type metadata accessor for CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  dispatch thunk of SiriEnvironment.subscript.getter();
  OUTLINED_FUNCTION_14_0();
  CurrentRequest.flowTaskMetadata.getter();
  swift_release();
  v3 = type metadata accessor for FlowTaskMetadata();
  if (__swift_getEnumTagSinglePayload((uint64_t)v2, 1, v3))
  {
    outlined destroy of AudioDestination?((uint64_t)v2, &demangling cache variable for type metadata for FlowTaskMetadata?);
LABEL_4:
    swift_bridgeObjectRelease();
    v4 = 0;
    v5 = 0xE000000000000000;
    goto LABEL_5;
  }
  v4 = *v2;
  v5 = v2[1];
  OUTLINED_FUNCTION_36();
  outlined destroy of AudioDestination?((uint64_t)v2, &demangling cache variable for type metadata for FlowTaskMetadata?);
  if (!v5)
    goto LABEL_4;
LABEL_5:
  v6 = v4;
  v7 = (void *)v5;
  result._object = v7;
  result._countAndFlagsBits = v6;
  return result;
}

uint64_t TapToRadarManager.writeDefaults(errStatus:userDefaultSuiteName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  Swift::String v23;
  __int128 v24;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v26;
  char v27;
  void (*v28)(uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  _OWORD v35[2];
  __int128 v36;
  __int128 v37;

  v5 = v4;
  v31 = a1;
  v8 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  OUTLINED_FUNCTION_36();
  v33 = a3;
  v34 = a4;
  v9 = @nonobjc NSUserDefaults.init(suiteName:)(a3, a4);
  if (!v9)
  {
    v36 = 0u;
    v37 = 0u;
LABEL_9:
    outlined destroy of AudioDestination?((uint64_t)&v36, &demangling cache variable for type metadata for Any?);
    goto LABEL_10;
  }
  v10 = v9;
  v11 = (void *)MEMORY[0x2199AFF9C](v5[9], v5[10]);
  v12 = objc_msgSend(v10, sel_objectForKey_, v11, v31);

  if (v12)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v35, 0, sizeof(v35));
  }
  outlined init with take of RadarFilingExtras?((uint64_t)v35, (uint64_t)&v36, &demangling cache variable for type metadata for Any?);
  if (!*((_QWORD *)&v37 + 1))
    goto LABEL_9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : [String : String]]);
  if (swift_dynamicCast())
  {
    v13 = *(_QWORD *)&v35[0];
    goto LABEL_11;
  }
LABEL_10:
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
  v13 = Dictionary.init(dictionaryLiteral:)();
LABEL_11:
  v15 = v5[15];
  v14 = v5[16];
  swift_bridgeObjectRetain();
  specialized Dictionary.subscript.getter(v15, v14, v13);
  v17 = v16;
  swift_bridgeObjectRelease();
  if (!v17)
    v17 = Dictionary.init(dictionaryLiteral:)();
  v18 = v5[11];
  v19 = v5[12];
  *(_QWORD *)&v36 = *(_QWORD *)(v17 + 16) + 1;
  v20 = dispatch thunk of CustomStringConvertible.description.getter();
  v22 = v21;
  *(_QWORD *)&v36 = v18;
  *((_QWORD *)&v36 + 1) = v19;
  swift_bridgeObjectRetain();
  v23._countAndFlagsBits = v20;
  v23._object = v22;
  String.append(_:)(v23);
  OUTLINED_FUNCTION_28_0();
  v24 = v36;
  OUTLINED_FUNCTION_36();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)&v36 = v17;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v31, a2, v24, *((uint64_t *)&v24 + 1), isUniquelyReferenced_nonNull_native);
  v26 = v36;
  OUTLINED_FUNCTION_28_0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v27 = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)&v36 = v13;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v26, v15, v14, v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(*v5 + 256);
  v29 = swift_bridgeObjectRetain();
  v28(v29, v33, v34);
  return swift_bridgeObjectRelease_n();
}

void TapToRadarManager.isRadarValid(radarComponentInfo:title:description:)(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;

  v6 = OUTLINED_FUNCTION_16_0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v23 - v11;
  v13 = a1[1];
  v14 = *a1 & 0xFFFFFFFFFFFFLL;
  if ((v13 & 0x2000000000000000) != 0)
    v14 = HIBYTE(v13) & 0xF;
  if (!v14
    || ((v15 = a1[3], (v15 & 0x2000000000000000) != 0) ? (v16 = HIBYTE(v15) & 0xF) : (v16 = a1[2] & 0xFFFFFFFFFFFFLL),
        !v16))
  {
    static Logger.logger.getter();
    v18 = Logger.logObject.getter();
    v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)OUTLINED_FUNCTION_2_3();
      *(_WORD *)v20 = 0;
      OUTLINED_FUNCTION_10_1(&dword_2132A2000, v18, v19, "TapToRadarManager#isRadarValid, either radar component ID or component name/version need to be specified", v20);
      goto LABEL_18;
    }
    v10 = v12;
LABEL_19:

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_20;
  }
  if (!a3)
    goto LABEL_16;
  v17 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v17 = a2 & 0xFFFFFFFFFFFFLL;
  if (!v17)
  {
LABEL_16:
    OUTLINED_FUNCTION_41_0();
    v18 = Logger.logObject.getter();
    v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v21))
    {
      v22 = (uint8_t *)OUTLINED_FUNCTION_2_3();
      *(_WORD *)v22 = 0;
      OUTLINED_FUNCTION_10_1(&dword_2132A2000, v18, v21, "TapToRadarManager#isRadarValid, no radar title specified", v22);
LABEL_18:
      OUTLINED_FUNCTION_3_1();
    }
    goto LABEL_19;
  }
LABEL_20:
  OUTLINED_FUNCTION_26_0();
}

uint64_t TapToRadarManager.shouldFileTTRWithRequestID()()
{
  uint64_t v0;
  void (*v1)(void);
  uint64_t v2;
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
  void (*v14)(_BYTE *, _QWORD);
  uint64_t v15;
  _BYTE v17[32];

  v1 = *(void (**)(void))(*(_QWORD *)v0 + 152);
  v1();
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_48_1();
  if (!v3)
  {
    v4 = (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
    v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 160))(v4);
  }
  ((void (*)(uint64_t))v1)(v2);
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_48_1();
  if (!v5)
    return 1;
  v6 = ((uint64_t (*)(void))v1)();
  v8 = v7;
  v9 = (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
  LODWORD(v6) = specialized Dictionary.subscript.getter(v6, v8, v9);
  swift_bridgeObjectRelease();
  v10 = OUTLINED_FUNCTION_53_0();
  if ((_DWORD)v6 != 2)
    return 0;
  v11 = ((uint64_t (*)(uint64_t))v1)(v10);
  v13 = v12;
  v14 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v0 + 192))(v17);
  v15 = 1;
  specialized Dictionary._Variant.setValue(_:forKey:)(1, v11, v13);
  OUTLINED_FUNCTION_53_0();
  v14(v17, 0);
  return v15;
}

void TapToRadarManager.updateTTRForRequestID(ttrLaunch:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v4)(void);
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(_BYTE *, _QWORD);
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t i;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v30;
  void (*v31)(_QWORD, _QWORD);
  uint64_t *v32;
  uint64_t *v33;
  char v34;
  char v35;
  uint64_t v36;
  void (*v37)(_QWORD, _QWORD);
  uint64_t v38;
  uint64_t (*v39)(void);
  Swift::Int v40;
  Swift::Int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int64_t v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE v54[32];

  v2 = v1;
  v4 = *(uint64_t (**)(void))(*(_QWORD *)v1 + 152);
  v5 = v4();
  v7 = v6;
  OUTLINED_FUNCTION_12_2();
  v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0)
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  if (!v8 || (a1 & 1) == 0)
    return;
  v9 = (uint64_t (*)(_BYTE *, _QWORD))OUTLINED_FUNCTION_64_0(*(uint64_t (**)(char *))(*(_QWORD *)v2 + 216), v42, v44, v46, v48, v50, v52);
  String.removeAll(keepingCapacity:)(0);
  v10 = v9(v54, 0);
  v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 176))(v10);
  v12 = 0;
  v13 = v11 + 64;
  OUTLINED_FUNCTION_24_0();
  v16 = v15 & v14;
  v49 = v18;
  v51 = (unint64_t)(v17 + 63) >> 6;
  v47 = v11 + 64;
  if ((v15 & v14) == 0)
    goto LABEL_7;
LABEL_6:
  v19 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  for (i = v19 | (v12 << 6); ; i = __clz(__rbit64(v22)) + (v12 << 6))
  {
    v24 = (uint64_t *)(*(_QWORD *)(v11 + 48) + 16 * i);
    v25 = *v24;
    v26 = v24[1];
    v27 = swift_bridgeObjectRetain();
    if (v25 == ((uint64_t (*)(uint64_t))v4)(v27) && v26 == v28)
    {
      OUTLINED_FUNCTION_6_1();
    }
    else
    {
      v30 = _stringCompareWithSmolCheck(_:_:expecting:)();
      OUTLINED_FUNCTION_23_0();
      if ((v30 & 1) == 0)
      {
        v31 = (void (*)(_QWORD, _QWORD))OUTLINED_FUNCTION_64_0(*(uint64_t (**)(char *))(*(_QWORD *)v2 + 192), v43, v45, v47, v49, v51, v53);
        v33 = v32;
        OUTLINED_FUNCTION_1_6();
        specialized __RawDictionaryStorage.find<A>(_:)(v25, v26);
        v35 = v34;
        OUTLINED_FUNCTION_23_0();
        if ((v35 & 1) != 0)
        {
          HIDWORD(v45) = swift_isUniquelyReferenced_nonNull_native();
          v53 = *v33;
          v36 = *v33;
          *v33 = 0x8000000000000000;
          v37 = v31;
          v38 = v2;
          v39 = v4;
          v40 = *(_QWORD *)(v36 + 24);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, Bool>);
          v41 = v40;
          v4 = v39;
          v2 = v38;
          v31 = v37;
          _NativeDictionary.ensureUnique(isUnique:capacity:)(SBYTE4(v45), v41);
          swift_bridgeObjectRelease();
          _NativeDictionary._delete(at:)();
          *v33 = v53;
          swift_bridgeObjectRelease();
        }
        v31(v54, 0);
        v13 = v47;
        v11 = v49;
      }
    }
    OUTLINED_FUNCTION_6_1();
    if (v16)
      goto LABEL_6;
LABEL_7:
    v21 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v21 >= v51)
      goto LABEL_32;
    v22 = *(_QWORD *)(v13 + 8 * v21);
    ++v12;
    if (!v22)
    {
      v12 = v21 + 1;
      if (v21 + 1 >= v51)
        goto LABEL_32;
      v22 = *(_QWORD *)(v13 + 8 * v12);
      if (!v22)
      {
        v12 = v21 + 2;
        if (v21 + 2 >= v51)
          goto LABEL_32;
        v22 = *(_QWORD *)(v13 + 8 * v12);
        if (!v22)
          break;
      }
    }
LABEL_20:
    v16 = (v22 - 1) & v22;
  }
  v23 = v21 + 3;
  if (v23 >= v51)
  {
LABEL_32:
    swift_release();
    return;
  }
  v22 = *(_QWORD *)(v13 + 8 * v23);
  if (v22)
  {
    v12 = v23;
    goto LABEL_20;
  }
  while (1)
  {
    v12 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v12 >= v51)
      goto LABEL_32;
    v22 = *(_QWORD *)(v13 + 8 * v12);
    ++v23;
    if (v22)
      goto LABEL_20;
  }
LABEL_35:
  __break(1u);
}

void TapToRadarManager.generateRequestInfoHeader(providedDescription:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  Swift::String v3;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    _StringGuts.grow(_:)(24);
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_23_0();
    v3._countAndFlagsBits = 0xD000000000000016;
    v3._object = (void *)0x80000002132C65D0;
    String.append(_:)(v3);
  }
  OUTLINED_FUNCTION_68_0();
}

uint64_t TapToRadarManager.createSiriRequestDescription(providedDescription:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  Swift::String v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  OUTLINED_FUNCTION_85();
  v41 = v1;
  v42 = v2;
  v3 = type metadata accessor for Locale();
  v36 = *(_QWORD *)(v3 - 8);
  v37 = v3;
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_46_1();
  OUTLINED_FUNCTION_60_0();
  OUTLINED_FUNCTION_61_0();
  OUTLINED_FUNCTION_14_0();
  v34 = dispatch thunk of CurrentDevice.preferencesLanguageCode.getter();
  v8 = v7;
  swift_release();
  static SiriEnvironment.default.getter();
  OUTLINED_FUNCTION_61_0();
  OUTLINED_FUNCTION_14_0();
  v9 = dispatch thunk of CurrentDevice.deviceRegionCode.getter();
  v11 = v10;
  OUTLINED_FUNCTION_236();
  swift_bridgeObjectRetain();
  v12 = OUTLINED_FUNCTION_3_5();
  TapToRadarManager.generateRequestInfoHeader(providedDescription:)(v12, v13);
  v15 = v14;
  v17 = v16;
  v18 = OUTLINED_FUNCTION_23_0();
  v39 = v15;
  v40 = v17;
  v19 = *(void (**)(uint64_t))(*(_QWORD *)v0 + 200);
  v19(v18);
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_21_1();
  if (v20)
  {
    *(_QWORD *)&v38 = 0;
    *((_QWORD *)&v38 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(16);
    v21 = OUTLINED_FUNCTION_67_0();
    strcpy((char *)&v38, "\n\tUtterance:\t\t");
    HIBYTE(v38) = -18;
    v22._countAndFlagsBits = ((uint64_t (*)(uint64_t))v19)(v21);
    String.append(_:)(v22);
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_6_3();
    OUTLINED_FUNCTION_7_1();
  }
  if (v11)
    v23 = v11;
  else
    v23 = (void *)0xE700000000000000;
  v24 = 0x6E776F6E6B6E75;
  if (v11)
    v24 = v9;
  v35 = v24;
  if (v8)
  {
    v25 = v34;
  }
  else
  {
    v8 = (void *)0xED00006465696669;
    v25 = 0x6365707320746F6ELL;
  }
  *(_QWORD *)&v38 = 0;
  *((_QWORD *)&v38 + 1) = 0xE000000000000000;
  _StringGuts.grow(_:)(18);
  OUTLINED_FUNCTION_67_0();
  *(_QWORD *)&v38 = 0xD000000000000010;
  *((_QWORD *)&v38 + 1) = 0x80000002132C6590;
  static SiriEnvironment.default.getter();
  OUTLINED_FUNCTION_61_0();
  OUTLINED_FUNCTION_14_0();
  dispatch thunk of CurrentDevice.siriLocale.getter();
  OUTLINED_FUNCTION_236();
  lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type Locale and conformance Locale, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEF0]);
  v26 = v37;
  v27 = dispatch thunk of CustomStringConvertible.description.getter();
  v29 = v28;
  (*(void (**)(char *, uint64_t))(v36 + 8))(v6, v26);
  v30._countAndFlagsBits = v27;
  v30._object = v29;
  String.append(_:)(v30);
  OUTLINED_FUNCTION_53_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_7_1();
  *(_QWORD *)&v38 = 0;
  *((_QWORD *)&v38 + 1) = 0xE000000000000000;
  _StringGuts.grow(_:)(19);
  OUTLINED_FUNCTION_67_0();
  *(_QWORD *)&v38 = 0xD000000000000011;
  *((_QWORD *)&v38 + 1) = 0x80000002132C65B0;
  v31._countAndFlagsBits = v25;
  v31._object = v8;
  String.append(_:)(v31);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_7_1();
  strcpy((char *)&v38, "\n\tRegion:\t\t\t");
  BYTE13(v38) = 0;
  HIWORD(v38) = -5120;
  v32._countAndFlagsBits = v35;
  v32._object = v23;
  String.append(_:)(v32);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_7_1();
  return v39;
}

void TapToRadarManager.internalPopulateSiriRequestText()()
{
  uint32_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint32_t *p_align;
  id v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  void *v27;
  unint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  Swift::String v40;
  uint64_t v41;
  void *v42;
  void (*v43)(uint64_t *, _QWORD);
  Swift::String v44;
  uint64_t v45;
  void (*v46)(uint64_t *, _QWORD);
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint32_t *v58;
  uint64_t v59;
  void *v60;

  OUTLINED_FUNCTION_85();
  v2 = OUTLINED_FUNCTION_16_0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_31_1();
  v58 = v0;
  i = (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
  v6 = v5;
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_21_1();
  if (v7)
    goto LABEL_2;
  v56 = v3;
  v57 = v1;
  OUTLINED_FUNCTION_46_1();
  OUTLINED_FUNCTION_60_0();
  OUTLINED_FUNCTION_59_0();
  lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (uint64_t (*)(uint64_t))type metadata accessor for CurrentRequest, (uint64_t)&protocol conformance descriptor for CurrentRequest);
  OUTLINED_FUNCTION_13_3();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_44_1();
  v8 = OUTLINED_FUNCTION_25_0();
  if (!i)
    goto LABEL_11;
  p_align = &stru_24CF83FE8.align;
  v10 = OUTLINED_FUNCTION_52_0(v8, sel_recognition);
  OUTLINED_FUNCTION_62_0();
  if (!v6)
    goto LABEL_11;
  v11 = outlined bridged method (ob) of @objc AFSpeechInterpretation.tokens.getter(v6, (SEL *)&selRef_phrases, &lazy cache variable for type metadata for AFSpeechPhrase);
  if (!v11)
    goto LABEL_67;
  i = v11;
  if (v11 >> 62)
LABEL_61:
    v12 = _CocoaArrayWrapper.endIndex.getter();
  else
    v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_7_1();
  if (!v12)
  {
LABEL_11:
    v13 = (void *)static SiriEnvironment.default.getter();
    OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_14_0();
    OUTLINED_FUNCTION_44_1();
    v18 = OUTLINED_FUNCTION_25_0();
    v15 = v56;
    v16 = v57;
    if (i)
    {
      v17 = OUTLINED_FUNCTION_52_0(v18, sel_unfilteredRecognition);
      goto LABEL_13;
    }
LABEL_2:
    OUTLINED_FUNCTION_38();
    return;
  }
  v13 = (void *)static SiriEnvironment.default.getter();
  OUTLINED_FUNCTION_13_3();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_44_1();
  v14 = OUTLINED_FUNCTION_25_0();
  v15 = v56;
  v16 = v57;
  if (!i)
    goto LABEL_2;
  v17 = OUTLINED_FUNCTION_52_0(v14, *((const char **)p_align + 47));
LABEL_13:
  v19 = v17;
  OUTLINED_FUNCTION_62_0();
  if (!v13)
    goto LABEL_2;
  v20 = outlined bridged method (ob) of @objc AFSpeechInterpretation.tokens.getter(v13, (SEL *)&selRef_phrases, &lazy cache variable for type metadata for AFSpeechPhrase);
  if (!v20)
    goto LABEL_2;
  v21 = v20 & 0xFFFFFFFFFFFFFF8;
  v53 = v20;
  if ((unint64_t)v20 >> 62)
  {
    if (v20 >= 0)
      i = v20 & 0xFFFFFFFFFFFFFF8;
    else
      i = v20;
    OUTLINED_FUNCTION_1_6();
    v22 = _CocoaArrayWrapper.endIndex.getter();
    OUTLINED_FUNCTION_23_0();
  }
  else
  {
    v22 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  p_align = v58;
  if (!v22)
  {
    swift_bridgeObjectRelease();
LABEL_52:
    OUTLINED_FUNCTION_58_0();
    OUTLINED_FUNCTION_12_2();
    OUTLINED_FUNCTION_21_1();
    if (v45)
    {
      v46 = (void (*)(uint64_t *, _QWORD))OUTLINED_FUNCTION_22_1();
      specialized RangeReplaceableCollection<>.removeLast()();
      OUTLINED_FUNCTION_12_2();
      v46(&v59, 0);
    }
    static Logger.logger.getter();
    swift_retain_n();
    v47 = Logger.logObject.getter();
    v48 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)OUTLINED_FUNCTION_2_3();
      v59 = OUTLINED_FUNCTION_2_3();
      *(_DWORD *)v49 = 136315138;
      v50 = OUTLINED_FUNCTION_58_0();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v50, v51, &v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_54_0();
      OUTLINED_FUNCTION_23_0();
      _os_log_impl(&dword_2132A2000, v47, v48, "TapToRadarManager#internalPopulateSiriRequestText, requestText: %s", v49, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_1();
    }

    OUTLINED_FUNCTION_54_0();
    OUTLINED_FUNCTION_65_0(v16, *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));
    goto LABEL_2;
  }
  v23 = 0;
  v24 = v53;
  v25 = v53 & 0xC000000000000001;
  v52 = v2;
  v54 = v22;
  v55 = v21;
  while (1)
  {
    if (v25)
    {
      v26 = (id)MEMORY[0x2199B014C](v23, v24);
    }
    else
    {
      if (v23 >= *(_QWORD *)(v21 + 16))
        goto LABEL_59;
      v26 = *(id *)(v53 + 32 + 8 * v23);
    }
    v27 = v26;
    if (__OFADD__(v23++, 1))
    {
      __break(1u);
LABEL_58:
      __break(1u);
LABEL_59:
      __break(1u);
LABEL_60:
      __break(1u);
      goto LABEL_61;
    }
    v29 = outlined bridged method (pb) of @objc AFSpeechPhrase.interpretations.getter(v26);
    if (!v29)
      break;
    i = v29;
    v30 = v29 & 0xFFFFFFFFFFFFFF8;
    if (v29 >> 62)
    {
      if (!_CocoaArrayWrapper.endIndex.getter())
      {
LABEL_44:

        OUTLINED_FUNCTION_7_1();
        goto LABEL_49;
      }
    }
    else if (!*(_QWORD *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_44;
    }
    if ((i & 0xC000000000000001) != 0)
    {
      v31 = (id)MEMORY[0x2199B014C](0, i);
    }
    else
    {
      if (!*(_QWORD *)(v30 + 16))
        goto LABEL_58;
      v31 = *(id *)(i + 32);
    }
    v32 = v31;
    OUTLINED_FUNCTION_7_1();
    v33 = outlined bridged method (ob) of @objc AFSpeechInterpretation.tokens.getter(v32, (SEL *)&selRef_tokens, &lazy cache variable for type metadata for AFSpeechToken);
    if (v33)
    {
      v34 = v33;
      if (v33 >> 62)
      {
        v35 = _CocoaArrayWrapper.endIndex.getter();
        if (!v35)
          goto LABEL_47;
LABEL_33:
        if (v35 < 1)
          goto LABEL_60;
        for (i = 0; i != v35; ++i)
        {
          if ((v34 & 0xC000000000000001) != 0)
            v36 = (id)MEMORY[0x2199B014C](i, v34);
          else
            v36 = *(id *)(v34 + 8 * i + 32);
          v37 = v36;
          v38 = outlined bridged method (pb) of @objc AFSpeechToken.text.getter(v36);
          if (v39)
          {
            v59 = v38;
            v60 = v39;
            v40._countAndFlagsBits = 32;
            v40._object = (void *)0xE100000000000000;
            String.append(_:)(v40);
            v41 = v59;
            v42 = v60;
            v43 = (void (*)(uint64_t *, _QWORD))OUTLINED_FUNCTION_22_1();
            v44._countAndFlagsBits = v41;
            v44._object = v42;
            String.append(_:)(v44);
            swift_bridgeObjectRelease();
            v43(&v59, 0);
            p_align = v58;
          }

        }
        OUTLINED_FUNCTION_42_1();
        swift_bridgeObjectRelease();
        v2 = v52;
        v24 = v53;
      }
      else
      {
        v35 = *(_QWORD *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v35)
          goto LABEL_33;
LABEL_47:
        OUTLINED_FUNCTION_42_1();
        swift_bridgeObjectRelease();
      }
      v22 = v54;
      v21 = v55;
      v25 = v53 & 0xC000000000000001;
      goto LABEL_49;
    }
    OUTLINED_FUNCTION_42_1();
LABEL_49:
    if (v23 == v22)
    {
      swift_bridgeObjectRelease();
      v15 = v56;
      v16 = v57;
      goto LABEL_52;
    }
  }
  __break(1u);
LABEL_67:
  __break(1u);
}

void TTRComponentInfo.componentName.getter()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_8();
}

void TTRComponentInfo.componentVersion.getter()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_8();
}

uint64_t TTRComponentInfo.componentID.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t RadarFilingExtras.attachmentURLs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t RadarFilingExtras.extensionIDs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t RadarFilingExtras.deviceIDs.getter()
{
  return swift_bridgeObjectRetain();
}

void RadarFilingExtras.displayReason.getter()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_8();
}

uint64_t key path setter for TapToRadarManager.requestID : TapToRadarManager(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 160);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t key path setter for TapToRadarManager.ttrRequestManager : TapToRadarManager(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)a2 + 184);
  v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t key path setter for TapToRadarManager.requestText : TapToRadarManager(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 208);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

void TapToRadarManager.defaultDisplayTitle.getter()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_8();
}

void TapToRadarManager.defaultsKey.getter()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_8();
}

void TapToRadarManager.contentKeyError.getter()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_8();
}

uint64_t TapToRadarManager.bufferSize.getter()
{
  return 40;
}

uint64_t TapToRadarManager.buffer.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 112);
}

void TapToRadarManager.sysBuildVer.getter()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_8();
}

uint64_t one-time initialization function for runQueue()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t result;
  _QWORD v8[2];

  v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for OS_dispatch_queue.Attributes();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v4);
  v6 = type metadata accessor for DispatchQoS();
  MEMORY[0x24BDAC7A8](v6);
  type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for OS_dispatch_queue);
  static DispatchQoS.default.getter();
  v8[1] = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, v5, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A], &demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v0);
  result = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  static TapToRadarManager.runQueue = result;
  return result;
}

uint64_t TapToRadarManager.CreateDraftContainer.radarComponentInfo.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = v1[1];
  v3 = v1[2];
  v4 = v1[3];
  v5 = v1[4];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  a1[4] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void TapToRadarManager.CreateDraftContainer.radarComponentInfo.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  __int128 v4;

  v3 = a1[1];
  v4 = *a1;
  v2 = *((_QWORD *)a1 + 4);
  OUTLINED_FUNCTION_43_1();
  OUTLINED_FUNCTION_7_1();
  *(_OWORD *)v1 = v4;
  *(_OWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v1 + 32) = v2;
  OUTLINED_FUNCTION_18_0();
}

uint64_t (*TapToRadarManager.CreateDraftContainer.radarComponentInfo.modify())()
{
  return FlowTaskMetadata.id.modify;
}

void TapToRadarManager.CreateDraftContainer.title.getter()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_8();
}

void TapToRadarManager.CreateDraftContainer.title.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_228();
  OUTLINED_FUNCTION_27_1();
  *(_QWORD *)(v1 + 40) = v2;
  *(_QWORD *)(v1 + 48) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*TapToRadarManager.CreateDraftContainer.title.modify())()
{
  return FlowTaskMetadata.id.modify;
}

void TapToRadarManager.CreateDraftContainer.description.getter()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_8();
}

void TapToRadarManager.CreateDraftContainer.description.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_228();
  OUTLINED_FUNCTION_39_1();
  *(_QWORD *)(v1 + 56) = v2;
  *(_QWORD *)(v1 + 64) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*TapToRadarManager.CreateDraftContainer.description.modify())()
{
  return FlowTaskMetadata.id.modify;
}

uint64_t TapToRadarManager.CreateDraftContainer.radarFilingExtras.getter@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = v1[9];
  v3 = v1[10];
  v4 = v1[11];
  v5 = v1[12];
  v6 = v1[13];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  return outlined copy of RadarFilingExtras?(v2);
}

__n128 TapToRadarManager.CreateDraftContainer.radarFilingExtras.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v4 = a1[1];
  v5 = *a1;
  v2 = *((_QWORD *)a1 + 4);
  outlined consume of RadarFilingExtras?(*(_QWORD *)(v1 + 72));
  *(_OWORD *)(v1 + 72) = v5;
  *(_OWORD *)(v1 + 88) = v4;
  *(_QWORD *)(v1 + 104) = v2;
  OUTLINED_FUNCTION_68_0();
  return result;
}

uint64_t (*TapToRadarManager.CreateDraftContainer.radarFilingExtras.modify())()
{
  return FlowTaskMetadata.id.modify;
}

__n128 TapToRadarManager.CreateDraftContainer.init(radarComponentInfo:title:description:radarFilingExtras:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  __n128 result;
  __int128 v11;

  v7 = *(_OWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a6 + 32);
  *(_OWORD *)a7 = *(_OWORD *)a1;
  *(_OWORD *)(a7 + 16) = v7;
  *(_QWORD *)(a7 + 32) = v8;
  *(_QWORD *)(a7 + 40) = a2;
  *(_QWORD *)(a7 + 48) = a3;
  *(_QWORD *)(a7 + 56) = a4;
  *(_QWORD *)(a7 + 64) = a5;
  result = *(__n128 *)a6;
  v11 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(a7 + 72) = *(_OWORD *)a6;
  *(_OWORD *)(a7 + 88) = v11;
  *(_QWORD *)(a7 + 104) = v9;
  return result;
}

void TapToRadarManager.__allocating_init()()
{
  OUTLINED_FUNCTION_63_0();
  TapToRadarManager.init()();
  OUTLINED_FUNCTION_8();
}

uint64_t closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(_QWORD), uint64_t a7, unint64_t a8, uint64_t a9, _QWORD *a10, uint64_t a11, unint64_t a12, uint64_t *a13, uint64_t a14)
{
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t (*v28)(uint64_t, uint64_t, uint64_t, uint64_t);
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  char v37;
  char v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t (*v44)(_QWORD);
  uint64_t v45;
  uint64_t v46;
  void (*v47)(__int128 *, uint64_t, uint64_t, uint64_t (*)(char), _QWORD *);
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t (*v69)(_QWORD);
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD v83[5];

  v67 = a8;
  v69 = a6;
  v70 = a7;
  v59 = a13;
  outlined init with take of RadarFilingExtras?((uint64_t)a13, (uint64_t)v83, &demangling cache variable for type metadata for RadarFilingExtras?);
  v66 = v83[0];
  v65 = v83[1];
  v64 = v83[2];
  v63 = v83[3];
  v62 = v83[4];
  v58 = *a10;
  v61 = a10[1];
  v57 = a10[2];
  v60 = a10[3];
  v56 = a10[4];
  v68 = type metadata accessor for Logger();
  v19 = *(_QWORD *)(v68 - 8);
  v20 = MEMORY[0x24BDAC7A8](v68);
  v22 = (char *)&v51 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v51 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v51 - v26;
  if (!IsAppleInternalBuild()
    || (v28 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*a1 + 272),
        v55 = a5,
        (v28(a2, a3, a4, a5) & 1) != 0))
  {
    static Logger.logger.getter();
    v29 = Logger.logObject.getter();
    v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_2132A2000, v29, v30, "TapToRadarManager#createProblem not filing issue", v31, 2u);
      MEMORY[0x2199B06A4](v31, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v19 + 8))(v27, v68);
    return v69(0);
  }
  v54 = a4;
  v53 = a3;
  if ((TapToRadarManager.shouldFileTTRWithRequestID()() & 1) == 0)
  {
    static Logger.logger.getter();
    v48 = Logger.logObject.getter();
    v49 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v50 = 0;
      _os_log_impl(&dword_2132A2000, v48, v49, "TapToRadarManager#createProblem, already filed for this requestID, skipping", v50, 2u);
      MEMORY[0x2199B06A4](v50, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v19 + 8))(v25, v68);
    return v69(0);
  }
  TapToRadarManager.internalPopulateSiriRequestText()();
  v33 = TapToRadarManager.createSiriRequestDescription(providedDescription:)();
  v35 = v34;
  v36 = *((_OWORD *)a10 + 1);
  v71 = *(_OWORD *)a10;
  v72 = v36;
  v73 = a10[4];
  swift_bridgeObjectRetain();
  TapToRadarManager.isRadarValid(radarComponentInfo:title:description:)(&v71, a11, a12);
  v38 = v37;
  swift_bridgeObjectRelease();
  if ((v38 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return v69(0);
  }
  v52 = v35;
  v67 = a12;
  v51 = a14;
  static Logger.logger.getter();
  v39 = Logger.logObject.getter();
  v40 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v39, v40))
  {
    v41 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v41 = 0;
    _os_log_impl(&dword_2132A2000, v39, v40, "TapToRadarManager#createProblem, valid information provided", v41, 2u);
    MEMORY[0x2199B06A4](v41, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v68);
  *(_QWORD *)&v71 = v58;
  *((_QWORD *)&v71 + 1) = v61;
  *(_QWORD *)&v72 = v57;
  *((_QWORD *)&v72 + 1) = v60;
  v73 = v56;
  v74 = a11;
  v75 = v67;
  v76 = v33;
  v77 = v52;
  v78 = v66;
  v79 = v65;
  v80 = v64;
  v81 = v63;
  v82 = v62;
  v68 = a1[7];
  v58 = a1[8];
  v42 = (_QWORD *)swift_allocObject();
  v42[2] = a1;
  v42[3] = a2;
  v43 = v54;
  v42[4] = v53;
  v42[5] = v43;
  v44 = v69;
  v45 = v70;
  v42[6] = v55;
  v42[7] = v44;
  v46 = v51;
  v42[8] = v45;
  v42[9] = v46;
  v47 = *(void (**)(__int128 *, uint64_t, uint64_t, uint64_t (*)(char), _QWORD *))(*a1 + 264);
  outlined retain of TTRComponentInfo((uint64_t)a10);
  swift_bridgeObjectRetain();
  outlined retain of RadarFilingExtras?(v59);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v47(&v71, v68, v58, partial apply for closure #1 in closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:), v42);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return outlined consume of RadarFilingExtras?(v66);
}

uint64_t sub_2132C16E0()
{
  uint64_t v0;

  swift_release();
  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_27_1();
  swift_release();
  OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_37_1();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 144) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_deallocObject();
}

void partial apply for closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)()
{
  uint64_t v0;

  closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(uint64_t (**)(_QWORD))(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), (_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 136), (uint64_t *)(v0 + 144), *(_QWORD *)(v0 + 184));
  OUTLINED_FUNCTION_68_0();
}

uint64_t closure #1 in closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD aBlock[6];

  v25[0] = a7;
  v15 = type metadata accessor for DispatchWorkItemFlags();
  v28 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for DispatchQoS();
  v26 = *(_QWORD *)(v18 - 8);
  v27 = v18;
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for runQueue != -1)
    swift_once();
  v25[1] = static TapToRadarManager.runQueue;
  v21 = swift_allocObject();
  *(_BYTE *)(v21 + 16) = a1 & 1;
  *(_QWORD *)(v21 + 24) = a2;
  *(_QWORD *)(v21 + 32) = a3;
  *(_QWORD *)(v21 + 40) = a4;
  *(_QWORD *)(v21 + 48) = a5;
  v22 = v25[0];
  *(_QWORD *)(v21 + 56) = a6;
  *(_QWORD *)(v21 + 64) = v22;
  *(_QWORD *)(v21 + 72) = a8;
  aBlock[4] = partial apply for closure #1 in closure #1 in closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:);
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor_22;
  v23 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  static DispatchQoS.unspecified.getter();
  v29 = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], &demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x2199B00B0](0, v20, v17, v23);
  _Block_release(v23);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v17, v15);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v20, v27);
  return swift_release();
}

uint64_t closure #1 in closure #1 in closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t))
{
  uint64_t v9;

  if ((a1 & 1) != 0)
    TapToRadarManager.writeDefaults(errStatus:userDefaultSuiteName:)(a3, a4, a5, a6);
  v9 = a1 & 1;
  TapToRadarManager.updateTTRForRequestID(ttrLaunch:)(v9);
  return a7(v9);
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

uint64_t outlined retain of TTRComponentInfo(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *outlined retain of RadarFilingExtras?(uint64_t *a1)
{
  outlined copy of RadarFilingExtras?(*a1);
  return a1;
}

uint64_t outlined copy of RadarFilingExtras?(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

void static TapToRadarManager.launchTTR(createDraftContainer:completion:)()
{
  void (*v0)(id);
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
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
  Class isa;
  uint64_t v16;
  Class v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSNumber v21;
  void *v22;
  void *v23;
  Class v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  char *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(id);
  int v42;

  OUTLINED_FUNCTION_85();
  v40 = v1;
  v41 = v0;
  v3 = v2;
  v4 = OUTLINED_FUNCTION_16_0();
  v38 = *(_QWORD *)(v4 - 8);
  v39 = v4;
  OUTLINED_FUNCTION_21();
  MEMORY[0x24BDAC7A8](v5);
  v37 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v3;
  v8 = v3[1];
  v9 = v3[2];
  v10 = v3[3];
  v11 = v3[5];
  v12 = v3[6];
  v13 = v3[7];
  v14 = v3[8];
  isa = (Class)v3[9];
  v17 = (Class)v3[10];
  v16 = v3[11];
  v18 = v3[12];
  v19 = (void *)v3[13];
  v34 = v18;
  v35 = v16;
  v36 = MEMORY[0x2199AFF9C](v7, v8);
  v20 = (void *)MEMORY[0x2199AFF9C](v9, v10);
  v21.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
  v22 = (void *)MEMORY[0x2199AFF9C](v11, v12);
  v23 = (void *)MEMORY[0x2199AFF9C](v13, v14);
  if (isa)
  {
    if (isa == (Class)1)
    {
      v19 = 0;
      v24 = 0;
      v17 = 0;
      isa = 0;
      goto LABEL_10;
    }
    type metadata accessor for URL();
    isa = Array._bridgeToObjectiveC()().super.isa;
  }
  v25 = v35;
  if (v17)
    v17 = Array._bridgeToObjectiveC()().super.isa;
  if (v25)
  {
    v24 = Array._bridgeToObjectiveC()().super.isa;
    if (!v19)
      goto LABEL_10;
    goto LABEL_9;
  }
  v24 = 0;
  if (v19)
LABEL_9:
    v19 = (void *)MEMORY[0x2199AFF9C](v34, v19);
LABEL_10:
  v26 = (void *)objc_opt_self();
  v27 = (void *)v36;
  v28 = objc_msgSend(v26, sel_createProblem_componentVersion_componentID_title_description_attachmentURLs_extensionIDs_deviceIDs_displayReason_, v36, v20, v21.super.super.isa, v22, v23, isa, v17, v24, v19);

  v29 = v37;
  static Logger.logger.getter();
  v30 = Logger.logObject.getter();
  v31 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)OUTLINED_FUNCTION_2_3();
    *(_DWORD *)v32 = 67109120;
    v42 = (int)v28;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_2132A2000, v30, v31, "TapToRadarManager#launchTTR result: %{BOOL}d", v32, 8u);
    OUTLINED_FUNCTION_3_1();
  }

  (*(void (**)(char *, uint64_t))(v38 + 8))(v29, v39);
  v41(v28);
  OUTLINED_FUNCTION_38();
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable () -> ()(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t specialized RangeReplaceableCollection<>.removeLast()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;

  v1 = v0[1];
  if ((v1 & 0x2000000000000000) == 0)
  {
    if ((*v0 & 0xFFFFFFFFFFFFLL) != 0)
    {
LABEL_5:
      String.index(before:)();
      return String.remove(at:)();
    }
    __break(1u);
  }
  if ((v1 & 0xF00000000000000) != 0)
    goto LABEL_5;
  __break(1u);
  return result;
}

uint64_t TapToRadarManager.__deallocating_deinit()
{
  TapToRadarManager.deinit();
  return swift_deallocClassInstance();
}

id @nonobjc NSUserDefaults.init(suiteName:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  if (a2)
  {
    v3 = (void *)MEMORY[0x2199AFF9C]();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  return v4;
}

void outlined init with take of RadarFilingExtras?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(a3);
  v3 = OUTLINED_FUNCTION_3_5();
  v4(v3);
  OUTLINED_FUNCTION_8();
}

uint64_t sub_2132C1EE0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_43_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_38_1();
  if (*(_QWORD *)(v0 + 88) != 1)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_37_1();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #1 in TapToRadarManager.setupLaunchTTR(createDraftContainer:title:completion:)()
{
  static TapToRadarManager.launchTTR(createDraftContainer:completion:)();
}

uint64_t outlined retain of TapToRadarManager.CreateDraftContainer(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined copy of RadarFilingExtras?(v2);
  return a1;
}

uint64_t outlined consume of RadarFilingExtras?(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t closure #1 in serialize<A>(_:at:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

void sub_2132C2058()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_33_1();
  *v0 = (*(uint64_t (**)(void))(v1 + 152))();
  v0[1] = v2;
  OUTLINED_FUNCTION_8();
}

void sub_2132C2080()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_33_1();
  *v0 = (*(uint64_t (**)(void))(v1 + 176))();
  OUTLINED_FUNCTION_8();
}

void sub_2132C20A8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_33_1();
  *v0 = (*(uint64_t (**)(void))(v1 + 200))();
  v0[1] = v2;
  OUTLINED_FUNCTION_8();
}

uint64_t destroy for TTRComponentInfo()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for TTRComponentInfo(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for TTRComponentInfo(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

_QWORD *assignWithTake for TTRComponentInfo(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  return a1;
}

uint64_t getEnumTagSinglePayload for TTRComponentInfo(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TTRComponentInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for TTRComponentInfo()
{
  OUTLINED_FUNCTION_45_1();
}

uint64_t destroy for RadarFilingExtras()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for RadarFilingExtras(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for RadarFilingExtras(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for RadarFilingExtras(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RadarFilingExtras(uint64_t *a1, unsigned int a2)
{
  int v2;
  uint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 40))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RadarFilingExtras(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

void type metadata accessor for RadarFilingExtras()
{
  OUTLINED_FUNCTION_45_1();
}

uint64_t type metadata accessor for TapToRadarManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for TapToRadarManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TapToRadarManager.requestID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of TapToRadarManager.requestID.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of TapToRadarManager.requestID.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of TapToRadarManager.ttrRequestManager.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of TapToRadarManager.ttrRequestManager.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of TapToRadarManager.ttrRequestManager.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of TapToRadarManager.requestText.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of TapToRadarManager.requestText.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of TapToRadarManager.requestText.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of TapToRadarManager.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of TapToRadarManager.populateSiriRequestText()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of TapToRadarManager.getDefaultsContents(userDefaultSuiteName:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of TapToRadarManager.writeDefaultsContents(contents:userDefaultSuiteName:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of TapToRadarManager.setupLaunchTTR(createDraftContainer:title:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of TapToRadarManager.hasFiledThisIssue(errStatus:userDefaultSuiteName:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of TapToRadarManager.getRequestID()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t destroy for TapToRadarManager.CreateDraftContainer(uint64_t a1)
{
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = *(_QWORD *)(a1 + 72);
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for TapToRadarManager.CreateDraftContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v8 = a2 + 72;
  v7 = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 == 1)
  {
    v9 = *(_OWORD *)(v8 + 16);
    *(_OWORD *)(a1 + 72) = *(_OWORD *)v8;
    *(_OWORD *)(a1 + 88) = v9;
    *(_QWORD *)(a1 + 104) = *(_QWORD *)(v8 + 32);
  }
  else
  {
    v10 = *(_QWORD *)(a2 + 80);
    v11 = *(_QWORD *)(a2 + 88);
    *(_QWORD *)(a1 + 72) = v7;
    *(_QWORD *)(a1 + 80) = v10;
    v12 = *(_QWORD *)(a2 + 96);
    v13 = *(_QWORD *)(a2 + 104);
    *(_QWORD *)(a1 + 88) = v11;
    *(_QWORD *)(a1 + 96) = v12;
    *(_QWORD *)(a1 + 104) = v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for TapToRadarManager.CreateDraftContainer(uint64_t a1, uint64_t a2)
{
  __int128 *v4;
  uint64_t v5;
  __int128 *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (__int128 *)(a1 + 72);
  v6 = (__int128 *)(a2 + 72);
  v5 = *(_QWORD *)(a2 + 72);
  if (*(_QWORD *)(a1 + 72) == 1)
  {
    if (v5 == 1)
    {
      v7 = *v6;
      v8 = *(_OWORD *)(a2 + 88);
      *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
      *v4 = v7;
      *(_OWORD *)(a1 + 88) = v8;
    }
    else
    {
      *(_QWORD *)(a1 + 72) = v5;
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
      *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
      *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
      *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v5 == 1)
  {
    outlined destroy of RadarFilingExtras(a1 + 72);
    v9 = *(_QWORD *)(a2 + 104);
    v10 = *(_OWORD *)(a2 + 88);
    *v4 = *v6;
    *(_OWORD *)(a1 + 88) = v10;
    *(_QWORD *)(a1 + 104) = v9;
  }
  else
  {
    *(_QWORD *)(a1 + 72) = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

uint64_t outlined destroy of RadarFilingExtras(uint64_t a1)
{
  destroy for RadarFilingExtras();
  return a1;
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

uint64_t assignWithTake for TapToRadarManager.CreateDraftContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 72);
  if (*(_QWORD *)(a1 + 72) != 1)
  {
    if (v7 != 1)
    {
      *(_QWORD *)(a1 + 72) = v7;
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
      swift_bridgeObjectRelease();
      v9 = *(_QWORD *)(a2 + 104);
      *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
      *(_QWORD *)(a1 + 104) = v9;
      swift_bridgeObjectRelease();
      return a1;
    }
    outlined destroy of RadarFilingExtras(a1 + 72);
  }
  v8 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = v8;
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  return a1;
}

uint64_t getEnumTagSinglePayload for TapToRadarManager.CreateDraftContainer(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 112))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TapToRadarManager.CreateDraftContainer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 112) = 1;
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
    *(_BYTE *)(result + 112) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for TapToRadarManager.CreateDraftContainer()
{
  OUTLINED_FUNCTION_45_1();
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v2;

  type metadata accessor for DeviceClass();
  lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type DeviceClass and conformance DeviceClass, (uint64_t (*)(uint64_t))MEMORY[0x24BEA8938], MEMORY[0x24BEA8948]);
  v2 = dispatch thunk of Hashable._rawHashValue(seed:)();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
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
  v5 = type metadata accessor for DeviceClass();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
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
      lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type DeviceClass and conformance DeviceClass, (uint64_t (*)(uint64_t))MEMORY[0x24BEA8938], MEMORY[0x24BEA8950]);
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

uint64_t specialized Dictionary._Variant.setValue(_:forKey:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  *v3 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  *v3 = v9;
  return swift_bridgeObjectRelease();
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  _BOOL8 v14;
  Swift::Int v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v11 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  v13 = v10[2];
  v14 = (v12 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_9;
  }
  v16 = v11;
  v17 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, [String : String]>);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15))
    goto LABEL_5;
  v18 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_9:
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  v16 = v18;
LABEL_5:
  v20 = *v5;
  if ((v17 & 1) != 0)
  {
    v21 = v20[7];
    result = swift_bridgeObjectRelease();
    *(_QWORD *)(v21 + 8 * v16) = a1;
  }
  else
  {
    specialized _NativeDictionary._insert(at:key:value:)(v16, a2, a3, a1, v20);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD **v6;
  _QWORD *v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  _BOOL8 v16;
  Swift::Int v17;
  unint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t result;

  v6 = (_QWORD **)v5;
  v12 = (_QWORD *)*v5;
  v13 = specialized __RawDictionaryStorage.find<A>(_:)(a3, a4);
  v15 = v12[2];
  v16 = (v14 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_9;
  }
  v18 = v13;
  v19 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, String>);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a5 & 1, v17))
    goto LABEL_5;
  v20 = specialized __RawDictionaryStorage.find<A>(_:)(a3, a4);
  if ((v19 & 1) != (v21 & 1))
  {
LABEL_9:
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  v18 = v20;
LABEL_5:
  v22 = *v6;
  if ((v19 & 1) != 0)
  {
    v23 = (uint64_t *)(v22[7] + 16 * v18);
    result = swift_bridgeObjectRelease();
    *v23 = a1;
    v23[1] = a2;
  }
  else
  {
    specialized _NativeDictionary._insert(at:key:value:)(v18, a3, a4, a1, a2, v22);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(char a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  _BOOL8 v14;
  Swift::Int v15;
  unint64_t v16;
  char v17;
  uint64_t result;
  char v19;
  _QWORD *v20;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v11 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  v13 = v10[2];
  v14 = (v12 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_9;
  }
  v16 = v11;
  v17 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, Bool>);
  result = _NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15);
  if ((result & 1) == 0)
    goto LABEL_5;
  result = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_9:
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  v16 = result;
LABEL_5:
  v20 = *v5;
  if ((v17 & 1) != 0)
  {
    *(_BYTE *)(v20[7] + v16) = a1 & 1;
  }
  else
  {
    specialized _NativeDictionary._insert(at:key:value:)(v16, a2, a3, a1 & 1, v20);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t specialized _NativeDictionary._insert(at:key:value:)(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)(a5[7] + 8 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

unint64_t specialized _NativeDictionary._insert(at:key:value:)(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = (_QWORD *)(a6[6] + 16 * result);
  *v6 = a2;
  v6[1] = a3;
  v7 = (_QWORD *)(a6[7] + 16 * result);
  *v7 = a4;
  v7[1] = a5;
  v8 = a6[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a6[2] = v10;
  return result;
}

unint64_t specialized _NativeDictionary._insert(at:key:value:)(unint64_t result, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_BYTE *)(a5[7] + result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

uint64_t outlined bridged method (pb) of @objc AFSpeechPhrase.interpretations.getter(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_interpretations);
  if (!v1)
    return 0;
  v2 = v1;
  type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for AFSpeechInterpretation);
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t outlined bridged method (pb) of @objc AFSpeechToken.text.getter(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_text);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t outlined bridged method (ob) of @objc AFSpeechInterpretation.tokens.getter(void *a1, SEL *a2, unint64_t *a3)
{
  id v5;
  uint64_t v6;

  v5 = objc_msgSend(a1, *a2);

  if (!v5)
    return 0;
  type metadata accessor for OS_dispatch_queue(0, a3);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return v6;
}

void type metadata accessor for OS_dispatch_queue(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    objc_opt_self();
    atomic_store(swift_getObjCClassMetadata(), a2);
  }
  OUTLINED_FUNCTION_8();
}

uint64_t sub_2132C33BC()
{
  swift_release();
  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_27_1();
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)(char a1)
{
  uint64_t *v1;

  return closure #1 in closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8]);
}

uint64_t sub_2132C3420()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)()
{
  uint64_t v0;

  return closure #1 in closure #1 in closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)(*(_BYTE *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(uint64_t (**)(uint64_t))(v0 + 64));
}

void lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x2199B062C](MEMORY[0x24BEE12C8], v3), a1);
  }
  OUTLINED_FUNCTION_8();
}

uint64_t OUTLINED_FUNCTION_1_6()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_6_3()
{
  uint64_t v0;

  String.append(_:)(*(Swift::String *)(v0 - 112));
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_13_3()
{
  return dispatch thunk of SiriEnvironment.subscript.getter();
}

uint64_t OUTLINED_FUNCTION_14_3@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return type metadata accessor for Logger();
}

uint64_t OUTLINED_FUNCTION_19()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 216))(v1 - 112);
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_32_1()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t OUTLINED_FUNCTION_34_1@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

uint64_t OUTLINED_FUNCTION_37_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_38_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_39_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_40_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  return static Logger.logger.getter();
}

void OUTLINED_FUNCTION_42_1()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_43_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_44_1()
{
  return CurrentRequest.speechPackage.getter();
}

uint64_t OUTLINED_FUNCTION_46_1()
{
  return type metadata accessor for SiriEnvironment();
}

uint64_t OUTLINED_FUNCTION_47_1()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

void OUTLINED_FUNCTION_49_0(unint64_t *a1)
{
  uint64_t *v1;

  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](a1, v1);
}

uint64_t OUTLINED_FUNCTION_50_0()
{
  return static DispatchQoS.unspecified.getter();
}

id OUTLINED_FUNCTION_52_0(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_53_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_54_0()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_57_0()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_58_0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 - 144))();
}

uint64_t OUTLINED_FUNCTION_59_0()
{
  return type metadata accessor for CurrentRequest();
}

uint64_t OUTLINED_FUNCTION_60_0()
{
  return static SiriEnvironment.default.getter();
}

uint64_t OUTLINED_FUNCTION_61_0()
{
  return SiriEnvironment.currentDevice.getter();
}

void OUTLINED_FUNCTION_62_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_63_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_64_0@<X0>(uint64_t (*a1)(char *)@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  return a1(va);
}

uint64_t OUTLINED_FUNCTION_65_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_67_0()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_70_0()
{
  const void *v0;

  _Block_release(v0);
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x24BDCDCA0]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t type metadata accessor for Locale()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t SiriEnvironment.currentDevice.getter()
{
  return MEMORY[0x24BEA87E8]();
}

uint64_t static SiriEnvironment.default.getter()
{
  return MEMORY[0x24BEA8808]();
}

uint64_t type metadata accessor for SiriEnvironment()
{
  return MEMORY[0x24BEA8810]();
}

uint64_t dispatch thunk of SiriEnvironment.subscript.getter()
{
  return MEMORY[0x24BEA8820]();
}

uint64_t dispatch thunk of SiriEnvironment.subscript.setter()
{
  return MEMORY[0x24BEA8828]();
}

uint64_t static SiriEnvironmentProvider.defaultScope.getter()
{
  return MEMORY[0x24BEA8888]();
}

uint64_t static AudioSource.carAudio.getter()
{
  return MEMORY[0x24BEA8890]();
}

uint64_t static AudioSource.usbAudio.getter()
{
  return MEMORY[0x24BEA8898]();
}

uint64_t static AudioSource.builtInMic.getter()
{
  return MEMORY[0x24BEA88A0]();
}

uint64_t static AudioSource.carJarvisDevice.getter()
{
  return MEMORY[0x24BEA88A8]();
}

uint64_t static AudioSource.wiredHeadsetMic.getter()
{
  return MEMORY[0x24BEA88B0]();
}

uint64_t static AudioSource.bluetoothDoAPDevice.getter()
{
  return MEMORY[0x24BEA88B8]();
}

uint64_t static AudioSource.bluetoothHandsFreeDevice.getter()
{
  return MEMORY[0x24BEA88C0]();
}

uint64_t static AudioSource.lineIn.getter()
{
  return MEMORY[0x24BEA88C8]();
}

uint64_t static AudioSource.unknown.getter()
{
  return MEMORY[0x24BEA88D0]();
}

uint64_t type metadata accessor for AudioSource()
{
  return MEMORY[0x24BEA88E0]();
}

uint64_t type metadata accessor for DeviceClass()
{
  return MEMORY[0x24BEA8938]();
}

uint64_t type metadata accessor for InputOrigin()
{
  return MEMORY[0x24BEA8A48]();
}

uint64_t static ResponseMode.displayForward.getter()
{
  return MEMORY[0x24BEA8AC8]();
}

uint64_t type metadata accessor for ResponseMode()
{
  return MEMORY[0x24BEA8AE8]();
}

uint64_t dispatch thunk of CurrentDevice.siriLocale.getter()
{
  return MEMORY[0x24BEA8B20]();
}

uint64_t dispatch thunk of CurrentDevice.deviceRegionCode.getter()
{
  return MEMORY[0x24BEA8B40]();
}

uint64_t dispatch thunk of CurrentDevice.preferencesLanguageCode.getter()
{
  return MEMORY[0x24BEA8B68]();
}

uint64_t type metadata accessor for BargeInContext()
{
  return MEMORY[0x24BEA8BD8]();
}

uint64_t type metadata accessor for InteractionType()
{
  return MEMORY[0x24BEA8C48]();
}

uint64_t static AudioDestination.carAudio.getter()
{
  return MEMORY[0x24BEA8C88]();
}

uint64_t static AudioDestination.bluetoothA2DPDevice.getter()
{
  return MEMORY[0x24BEA8C98]();
}

uint64_t static AudioDestination.bluetoothHandsFreeDevice.getter()
{
  return MEMORY[0x24BEA8CA0]();
}

uint64_t type metadata accessor for AudioDestination()
{
  return MEMORY[0x24BEA8CB8]();
}

uint64_t static ExecutionLocation.unknown.getter()
{
  return MEMORY[0x24BEA8CD8]();
}

uint64_t type metadata accessor for ExecutionLocation()
{
  return MEMORY[0x24BEA8CE0]();
}

uint64_t MockablePublished.init(wrappedValue:)()
{
  return MEMORY[0x24BEA8CF0]();
}

uint64_t dispatch thunk of MockablePublished.projectedValue.getter()
{
  return MEMORY[0x24BEA8CF8]();
}

uint64_t dispatch thunk of MockablePublished.projectedValue.setter()
{
  return MEMORY[0x24BEA8D00]();
}

uint64_t static MockablePublished.subscript.modify()
{
  return MEMORY[0x24BEA8D08]();
}

uint64_t static MockablePublished.subscript.getter()
{
  return MEMORY[0x24BEA8D10]();
}

uint64_t static MockablePublished.subscript.setter()
{
  return MEMORY[0x24BEA8D18]();
}

uint64_t dispatch thunk of DeviceClassProvider.currentDeviceClass.getter()
{
  return MEMORY[0x24BEA8D58]();
}

uint64_t static MockableEnvironmentProvider.adjustMock(_:)()
{
  return MEMORY[0x24BEA8DF0]();
}

uint64_t MockableEnvironmentProvider.mock<A>(override:run:)()
{
  return MEMORY[0x24BEA8DF8]();
}

uint64_t MockableEnvironmentProvider.install(_:)()
{
  return MEMORY[0x24BEA8E10]();
}

uint64_t static MobileGestaltDeviceClassProvider.shared.getter()
{
  return MEMORY[0x24BEA8E20]();
}

uint64_t type metadata accessor for MobileGestaltDeviceClassProvider()
{
  return MEMORY[0x24BEA8E30]();
}

uint64_t static Logger.logger.getter()
{
  return MEMORY[0x24BEA8E38]();
}

uint64_t Builder.subscript.getter()
{
  return MEMORY[0x24BEA8E40]();
}

{
  return MEMORY[0x24BEA8E48]();
}

uint64_t type metadata accessor for HomeInfo()
{
  return MEMORY[0x24BEA8E50]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t static DispatchQoS.default.getter()
{
  return MEMORY[0x24BEE54E0]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x24BEE5500]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x24BEE0980]();
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

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t String.index(before:)()
{
  return MEMORY[0x24BEE0B78]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

uint64_t String.remove(at:)()
{
  return MEMORY[0x24BEE0BE0]();
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x24BEE0BE8]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

Swift::Void __swiftcall String.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
  MEMORY[0x24BEE0CE0](keepingCapacity);
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x24BEE1098]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x24BEE1120]();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x24BDCFD28]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x24BEE7910]();
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

uint64_t static OS_dispatch_queue.main.getter()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x24BEE57A0]();
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

uint64_t StringProtocol.contains<A>(_:)()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE24D0]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t StaticString.description.getter()
{
  return MEMORY[0x24BEE25B8]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x24BEE2E58](isUnique, capacity);
}

uint64_t _NativeDictionary._delete(at:)()
{
  return MEMORY[0x24BEE2E70]();
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

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x24BEE3290](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED8]();
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

uint64_t CUGestaltDeviceClassToString()
{
  return MEMORY[0x24BE29140]();
}

uint64_t GestaltGetDeviceClass()
{
  return MEMORY[0x24BE293A0]();
}

uint64_t GetSystemBuildVersionString()
{
  return MEMORY[0x24BE293F8]();
}

uint64_t HMHomeManagerAreAnyAccessoriesConfigured()
{
  return MEMORY[0x24BDD5E50]();
}

uint64_t HMHomeManagerAreAnySpeakersConfigured()
{
  return MEMORY[0x24BDD5E60]();
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x24BE295B0]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x24BED25B0]();
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t areHomesConfigured()
{
  return MEMORY[0x24BDD7B18]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
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

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

