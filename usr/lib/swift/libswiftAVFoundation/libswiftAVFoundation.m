_QWORD *static AVPartialAsyncProperty<A>.duration.getter()
{
  return static AVPartialAsyncProperty<A>.duration.getter((uint64_t (*)(uint64_t))type metadata accessor for CMTime, 0x6E6F697461727564, 0xE800000000000000);
}

uint64_t type metadata instantiation function for AVAsyncProperty.Status()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for AVAsyncProperty.Status()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t AVAsyncProperty.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance CMTime(void *a1, uint64_t a2)
{
  id v3;
  id result;
  __int128 v5;
  uint64_t v6;

  v3 = objc_retainAutorelease(a1);
  result = (id)strcmp((const char *)objc_msgSend(v3, sel_objCType), "{?=qiIq}");
  if ((_DWORD)result)
  {
    __break(1u);
  }
  else
  {
    result = objc_msgSend(v3, sel_CMTimeValue);
    *(_OWORD *)a2 = v5;
    *(_QWORD *)(a2 + 16) = v6;
    *(_BYTE *)(a2 + 24) = 0;
  }
  return result;
}

uint64_t AVAsynchronousKeyValueLoading.load<A>(_:)()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Class isa;
  uint64_t v7;
  _QWORD *v8;

  v1 = v0[16];
  v2 = (void *)v0[17];
  v4 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_20838E820;
  *(_QWORD *)(v5 + 32) = v4;
  *(_QWORD *)(v5 + 40) = v3;
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  v0[23] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = AVAsynchronousKeyValueLoading.load<A>(_:);
  v7 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v8 = v0 + 10;
  v8[1] = 0x40000000;
  v8[2] = @objc completion handler block implementation for <A><A1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ();
  v8[3] = &block_descriptor_0;
  v8[4] = v7;
  objc_msgSend(v2, sel_loadValuesAsynchronouslyForKeys_completionHandler_, isa, v8);
  return swift_continuation_await();
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(void);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  Swift::String v16;

  v1 = *(uint64_t **)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 152);
  v5 = *(uint64_t **)(v0 + 128);

  AVAsynchronousKeyValueLoading.status<A>(of:)(v5, v1);
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(v3 + 16))(v2, v1, v4);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v11 = *(_QWORD *)(v0 + 176);
    v12 = *(_QWORD *)(v0 + 152);
    v13 = *(_QWORD *)(v0 + 160);
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    swift_task_dealloc();
    swift_task_dealloc();
    v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10();
  }
  if (!EnumCaseMultiPayload)
  {
    v7 = *(_QWORD *)(v0 + 168);
    v8 = *(_QWORD *)(v0 + 144);
    v9 = *(_QWORD *)(v0 + 120);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 8))(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 152));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v9, v7, v8);
    swift_task_dealloc();
    swift_task_dealloc();
    v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10();
  }
  v15 = *(_QWORD *)(v0 + 152);
  _StringGuts.grow(_:)(20);
  v16._object = (void *)0x8000000208391B60;
  v16._countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v16);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v15);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return swift_task_switch();
}

void AVAsynchronousKeyValueLoading.status<A>(of:)(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  void (*v18)(id *);
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  Swift::String v27;
  Swift::String v28;
  Swift::String v29;
  uint64_t v30;
  uint64_t *v31;
  id v32;
  id v33[3];

  v3 = v2;
  v31 = a2;
  v33[2] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = *a1;
  v6 = type metadata accessor for CancellationError();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a1[2];
  v11 = (void *)a1[3];
  v12 = (void *)MEMORY[0x20BD05754](v10, v11);
  v33[0] = 0;
  v13 = objc_msgSend(v3, sel_statusOfValueForKey_error_, v12, v33);

  v15 = v33[0];
  switch((unint64_t)v13)
  {
    case 0uLL:
    case 1uLL:
      type metadata accessor for AVAsyncProperty.Status(0, *(_QWORD *)(v5 + 120), *(_QWORD *)(v5 + 128), v14);
      goto LABEL_12;
    case 2uLL:
      v18 = (void (*)(id *))a1[4];
      v33[0] = v3;
      v19 = v15;
      v18(v33);
      type metadata accessor for AVAsyncProperty.Status(0, *(_QWORD *)(v5 + 120), *(_QWORD *)(v5 + 128), v20);
      swift_storeEnumTagMultiPayload();

      return;
    case 3uLL:
      if (v33[0])
      {
        v21 = v33[0];
      }
      else
      {
        v21 = (id)AVLocalizedError();
        if (!v21)
          goto LABEL_15;
      }
      *v31 = (uint64_t)v21;
      type metadata accessor for AVAsyncProperty.Status(0, *(_QWORD *)(v5 + 120), *(_QWORD *)(v5 + 128), v22);
LABEL_12:
      swift_storeEnumTagMultiPayload();
      break;
    case 4uLL:
      v13 = v33[0];
      AVFall2022OSVersions();
      if (dyld_program_sdk_at_least())
      {
        v16 = (id)AVLocalizedError();
        if (v16)
        {
          *v31 = (uint64_t)v16;
          type metadata accessor for AVAsyncProperty.Status(0, *(_QWORD *)(v5 + 120), *(_QWORD *)(v5 + 128), v17);
          swift_storeEnumTagMultiPayload();

        }
        else
        {
          __break(1u);
LABEL_15:
          __break(1u);
LABEL_16:
          v33[0] = 0;
          v33[1] = (id)0xE000000000000000;
          v26 = v15;
          _StringGuts.grow(_:)(33);
          v27._object = (void *)0x8000000208391B40;
          v27._countAndFlagsBits = 0xD000000000000014;
          String.append(_:)(v27);
          v32 = v13;
          type metadata accessor for AVKeyValueStatus(0);
          _print_unlocked<A, B>(_:_:)();
          v28._countAndFlagsBits = 0x79656B20726F6620;
          v28._object = (void *)0xE900000000000020;
          String.append(_:)(v28);
          v29._countAndFlagsBits = v10;
          v29._object = v11;
          String.append(_:)(v29);
          _assertionFailure(_:_:file:line:flags:)();
          __break(1u);
        }
      }
      else
      {
        CancellationError.init()();
        lazy protocol witness table accessor for type CancellationError and conformance CancellationError();
        v23 = (void *)swift_allocError();
        (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v24, v9, v6);
        *v31 = _convertErrorToNSError(_:)();
        type metadata accessor for AVAsyncProperty.Status(0, *(_QWORD *)(v5 + 120), *(_QWORD *)(v5 + 128), v25);
        swift_storeEnumTagMultiPayload();

      }
      break;
    default:
      goto LABEL_16;
  }
}

uint64_t AVAsynchronousKeyValueLoading.load<A>(_:)(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5[16] = a2;
  v5[17] = v4;
  v5[15] = a1;
  v6 = *a2;
  v7 = *(_QWORD *)(*a2 + 120);
  v8 = *(_QWORD *)(v6 + 128);
  v5[18] = v8;
  v9 = type metadata accessor for AVAsyncProperty.Status(0, v7, v8, a4);
  v5[19] = v9;
  v5[20] = *(_QWORD *)(v9 - 8);
  v5[21] = swift_task_alloc();
  v5[22] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t type metadata accessor for AVAsyncProperty.Status(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AVAsyncProperty.Status);
}

uint64_t partial apply for closure #1 in AVAsyncProperty<>.init(key:)(void **a1)
{
  uint64_t v1;

  return closure #1 in AVAsyncProperty<>.init(key:)(a1, *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t closure #1 in AVAsyncProperty<>.init(key:)(void **a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  id v5;
  _OWORD v7[2];
  _BYTE v8[32];

  v3 = *a1;
  v4 = (void *)MEMORY[0x20BD05754](a2, a3);
  v5 = objc_msgSend(v3, sel_valueForKey_, v4);

  if (v5)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  outlined init with take of Any?((uint64_t)v7, (uint64_t)v8);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Any?);
  return swift_dynamicCast();
}

uint64_t outlined init with take of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD05ED4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void destroy for AVAsyncProperty.Status(id *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 24) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  if (v3 <= 8)
    v3 = 8;
  if (v3 > 3)
    goto LABEL_4;
  v5 = ((1 << (8 * v3)) + 1) >> (8 * v3);
  if (v5 > 0xFFFD)
  {
    v4 = *(_DWORD *)((char *)a1 + v3);
  }
  else
  {
    if (v5 <= 0xFD)
    {
LABEL_4:
      v4 = *((unsigned __int8 *)a1 + v3);
      goto LABEL_9;
    }
    v4 = *(unsigned __int16 *)((char *)a1 + v3);
  }
LABEL_9:
  if (v4 < 2)
  {
    if (v4 == 1)

    else
      (*(void (**)(void))(v2 + 8))();
  }
  else
  {
    if (v3 <= 3)
      v6 = v3;
    else
      v6 = 4;
    ((void (*)(void))((char *)&loc_20836DEB0 + 4 * byte_20838E8B9[v6]))();
  }
}

char *initializeWithCopy for AVAsyncProperty.Status(char *__dst, void **a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  id v11;
  unsigned int v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(v4 + 64);
  if (v5 > 3)
    goto LABEL_5;
  v7 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  if (v7 > 0xFFFD)
  {
    v6 = *(_DWORD *)((char *)a2 + v5);
  }
  else
  {
    if (v7 <= 0xFD)
    {
LABEL_5:
      v6 = *((unsigned __int8 *)a2 + v5);
      goto LABEL_10;
    }
    v6 = *(unsigned __int16 *)((char *)a2 + v5);
  }
LABEL_10:
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v8 = v5;
    else
      v8 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    v10 = *a2;
    *(_QWORD *)__dst = *a2;
    v11 = v10;
    if (v5 > 3)
      goto LABEL_21;
    v12 = ((1 << (8 * v5)) + 1) >> (8 * v5);
    if (v12 > 0xFFFD)
    {
      *(_DWORD *)&__dst[v5] = 1;
      return __dst;
    }
    if (v12 <= 0xFD)
LABEL_21:
      __dst[v5] = 1;
    else
      *(_WORD *)&__dst[v5] = 1;
  }
  else
  {
    (*(void (**)(char *))(v4 + 16))(__dst);
    if (v5 <= 3)
    {
      v9 = ((1 << (8 * v5)) + 1) >> (8 * v5);
      if (v9 > 0xFFFD)
      {
        *(_DWORD *)&__dst[v5] = 0;
        return __dst;
      }
      if (v9 > 0xFD)
      {
        *(_WORD *)&__dst[v5] = 0;
        return __dst;
      }
    }
    __dst[v5] = 0;
  }
  return __dst;
}

_QWORD *static AVPartialAsyncProperty<A>.duration.getter(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *(_QWORD *)(v3 + 96);
  v7 = a1(255);
  type metadata accessor for AVAsyncProperty(0, v6, v7, v8);
  return AVAsyncProperty<>.init(key:)(a2, a3);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x20BD05E5C](a1, v6, a5);
}

uint64_t type metadata accessor for AVAsyncProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AVAsyncProperty);
}

void type metadata accessor for CMTime(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for CMTime);
}

void type metadata accessor for CGImageRef(uint64_t a1, unint64_t *a2)
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

_QWORD *AVAsyncProperty<>.init(key:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  _QWORD *v6;

  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = *(_OWORD *)(v2 + 120);
  *(_QWORD *)(v5 + 32) = a1;
  *(_QWORD *)(v5 + 40) = a2;
  v6 = (_QWORD *)swift_allocObject();
  v6[4] = partial apply for closure #1 in AVAsyncProperty<>.init(key:);
  v6[5] = v5;
  v6[2] = a1;
  v6[3] = a2;
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t type metadata accessor for AVPartialAsyncProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AVPartialAsyncProperty);
}

uint64_t type metadata accessor for AVAnyAsyncProperty()
{
  return objc_opt_self();
}

uint64_t type metadata completion function for AVPartialAsyncProperty()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata completion function for AVAsyncProperty()
{
  return swift_initClassMetadata2();
}

uint64_t AVFall2022OSVersions()
{
  return 0x7E60901FFFFFFFFLL;
}

AVPlayerInterstitialEvent __swiftcall AVPlayerInterstitialEvent.init(primaryItem:identifier:time:templateItems:restrictions:resumptionOffset:playoutLimit:userDefinedAttributes:)(AVPlayerItem primaryItem, Swift::String_optional identifier, CMTime time, Swift::OpaquePointer templateItems, AVPlayerInterstitialEventRestrictions restrictions, CMTime resumptionOffset, CMTime playoutLimit, Swift::OpaquePointer userDefinedAttributes)
{
  CMTimeValue value;
  void *v9;
  Class v10;
  Class v11;
  id v12;
  void *ObjCClassFromMetadata;
  void *object;
  uint64_t v16;
  Class isa;
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[4];

  isa = primaryItem.super.isa;
  v16 = *(_QWORD *)&time.timescale;
  value = time.value;
  object = identifier.value._object;
  if (identifier.value._countAndFlagsBits)
  {
    v9 = (void *)MEMORY[0x20BD05754](primaryItem._playerItem, identifier.value._countAndFlagsBits);
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  type metadata accessor for AVPlayerItem();
  v10 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  specialized _dictionaryUpCast<A, B, C, D>(_:)(playoutLimit.epoch);
  swift_bridgeObjectRelease();
  v11 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v21[0] = object;
  v21[1] = value;
  v21[2] = v16;
  v20[1] = resumptionOffset.value;
  v20[2] = *(_QWORD *)&resumptionOffset.timescale;
  v19[0] = resumptionOffset.epoch;
  v19[1] = playoutLimit.value;
  v19[2] = *(_QWORD *)&playoutLimit.timescale;
  v20[0] = restrictions;
  v12 = objc_msgSend(ObjCClassFromMetadata, sel_interstitialEventWithPrimaryItem_identifier_time_templateItems_restrictions_resumptionOffset_playoutLimit_userDefinedAttributes_, isa, v9, v21, v10, templateItems._rawValue, v20, v19, v11);

  return (AVPlayerInterstitialEvent)v12;
}

unint64_t type metadata accessor for AVPlayerItem()
{
  unint64_t result;

  result = lazy cache variable for type metadata for AVPlayerItem;
  if (!lazy cache variable for type metadata for AVPlayerItem)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for AVPlayerItem);
  }
  return result;
}

uint64_t specialized _dictionaryUpCast<A, B, C, D>(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  _OWORD v37[3];
  _OWORD v38[2];
  __int128 v39;
  _OWORD v40[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyHashable, Any>);
    v2 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_37;
      v14 = *(_QWORD *)(v28 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_37;
        v14 = *(_QWORD *)(v28 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_37;
          v14 = *(_QWORD *)(v28 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v19 = *v17;
    v18 = v17[1];
    outlined init with copy of Sendable(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    outlined init with take of Sendable(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    outlined init with take of Sendable(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    outlined init with take of Sendable(v36, v37);
    outlined init with take of Sendable(v37, &v33);
    result = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
    v20 = -1 << *(_BYTE *)(v2 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_38;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(_QWORD *)(v10 + 32) = v31;
    result = (uint64_t)outlined init with take of Sendable(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    outlined consume of [String : Sendable].Iterator._Variant();
    return v2;
  }
  v14 = *(_QWORD *)(v28 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

unint64_t specialized _dictionaryUpCast<A, B, C, D>(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _OWORD *v6;
  _OWORD *v7;
  uint64_t *v8;
  uint64_t *v9;
  unint64_t result;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t *v16;
  _OWORD *v17;
  unint64_t i;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  int64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t *v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  _OWORD v44[3];
  _OWORD v45[2];
  __int128 v46;
  _OWORD v47[2];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Any>);
    v2 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v35 = v1 + 64;
  v3 = -1 << *(_BYTE *)(v1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v34 = (unint64_t)(63 - v3) >> 6;
  v6 = v47;
  v7 = v45;
  v8 = &v41;
  v9 = &v43;
  result = swift_bridgeObjectRetain();
  v36 = 0;
  if (v5)
    goto LABEL_10;
LABEL_11:
  v19 = v36 + 1;
  if (__OFADD__(v36, 1))
    goto LABEL_35;
  if (v19 >= v34)
    goto LABEL_32;
  v20 = *(_QWORD *)(v35 + 8 * v19);
  v21 = v36 + 1;
  if (!v20)
  {
    v21 = v36 + 2;
    if (v36 + 2 >= v34)
      goto LABEL_32;
    v20 = *(_QWORD *)(v35 + 8 * v21);
    if (!v20)
    {
      v21 = v36 + 3;
      if (v36 + 3 >= v34)
        goto LABEL_32;
      v20 = *(_QWORD *)(v35 + 8 * v21);
      if (!v20)
      {
        v21 = v36 + 4;
        if (v36 + 4 >= v34)
          goto LABEL_32;
        v20 = *(_QWORD *)(v35 + 8 * v21);
        if (!v20)
        {
          v22 = v36 + 5;
          if (v36 + 5 < v34)
          {
            v20 = *(_QWORD *)(v35 + 8 * v22);
            if (v20)
            {
              v21 = v36 + 5;
              goto LABEL_26;
            }
            while (1)
            {
              v21 = v22 + 1;
              if (__OFADD__(v22, 1))
                goto LABEL_36;
              if (v21 >= v34)
                break;
              v20 = *(_QWORD *)(v35 + 8 * v21);
              ++v22;
              if (v20)
                goto LABEL_26;
            }
          }
LABEL_32:
          outlined consume of [String : Sendable].Iterator._Variant();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  v36 = v21;
  v37 = (v20 - 1) & v20;
  for (i = __clz(__rbit64(v20)) + (v21 << 6); ; i = __clz(__rbit64(v5)) | (v36 << 6))
  {
    v23 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * i);
    v25 = *v23;
    v24 = v23[1];
    outlined init with copy of Sendable(*(_QWORD *)(v1 + 56) + 32 * i, (uint64_t)v6);
    *(_QWORD *)&v46 = v25;
    *((_QWORD *)&v46 + 1) = v24;
    v44[2] = v46;
    v45[0] = v47[0];
    v45[1] = v47[1];
    v39 = v25;
    v40 = v24;
    outlined init with take of Sendable(v7, &v38);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Sendable);
    swift_dynamicCast();
    v27 = v39;
    v26 = v40;
    outlined init with take of Sendable(v8, v9);
    outlined init with take of Sendable(v9, v44);
    outlined init with take of Sendable(v44, &v42);
    result = specialized __RawDictionaryStorage.find<A>(_:)(v27, v26);
    v28 = result;
    if ((v29 & 1) != 0)
    {
      v11 = v9;
      v12 = v8;
      v13 = v1;
      v14 = v7;
      v15 = v6;
      v16 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v16 = v27;
      v16[1] = v26;
      v6 = v15;
      v7 = v14;
      v1 = v13;
      v8 = v12;
      v9 = v11;
      v17 = (_OWORD *)(v2[7] + 32 * v28);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
      result = (unint64_t)outlined init with take of Sendable(&v42, v17);
      v5 = v37;
      if (!v37)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v30 = (uint64_t *)(v2[6] + 16 * result);
    *v30 = v27;
    v30[1] = v26;
    result = (unint64_t)outlined init with take of Sendable(&v42, (_OWORD *)(v2[7] + 32 * result));
    v31 = v2[2];
    v32 = __OFADD__(v31, 1);
    v33 = v31 + 1;
    if (v32)
      goto LABEL_34;
    v2[2] = v33;
    v5 = v37;
    if (!v37)
      goto LABEL_11;
LABEL_10:
    v37 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

id AVPlayerInterstitialEvent.init(primaryItem:identifier:date:templateItems:restrictions:resumptionOffset:playoutLimit:userDefinedAttributes:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  void *v15;
  Class isa;
  Class v17;
  Class v18;
  id v19;
  uint64_t v20;
  void *ObjCClassFromMetadata;
  _QWORD v26[3];
  _QWORD v27[4];

  if (a3)
  {
    v15 = (void *)MEMORY[0x20BD05754](a2, a3);
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = 0;
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  isa = Date._bridgeToObjectiveC()().super.isa;
  type metadata accessor for AVPlayerItem();
  v17 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  specialized _dictionaryUpCast<A, B, C, D>(_:)(a13);
  swift_bridgeObjectRelease();
  v18 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v27[1] = a8;
  v27[2] = a9;
  v26[0] = a10;
  v26[1] = a11;
  v26[2] = a12;
  v27[0] = a7;
  v19 = objc_msgSend(ObjCClassFromMetadata, sel_interstitialEventWithPrimaryItem_identifier_date_templateItems_restrictions_resumptionOffset_playoutLimit_userDefinedAttributes_, a1, v15, isa, v17, a6, v27, v26, v18);

  v20 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(a4, v20);
  return v19;
}

void type metadata accessor for CGImageRef(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for CGImageRef);
}

__n128 __swift_memcpy96_4(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t getEnumTagSinglePayload for CMTimeMapping(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 96))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CMTimeMapping(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 88) = 0;
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
  *(_BYTE *)(result + 96) = v3;
  return result;
}

void type metadata accessor for CMTimeMapping(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for CMTimeMapping);
}

void type metadata accessor for AVTrackAssociationType(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for AVTrackAssociationType);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CGSize(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CGSize(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for CGSize);
}

uint64_t initializeBufferWithCopyOfBuffer for CMTimeRange(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy48_4(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CMTimeRange(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CMTimeRange(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
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
  *(_BYTE *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CMTimeRange(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for CMTimeRange);
}

void type metadata accessor for CMTagCollectionRef(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for CMTagCollectionRef);
}

void type metadata accessor for CMFormatDescriptionRef(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for CMFormatDescriptionRef);
}

void type metadata accessor for AVMediaCharacteristic(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for AVMediaCharacteristic);
}

void type metadata accessor for AVMetadataKey(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for AVMetadataKey);
}

void type metadata accessor for AVMetadataFormat(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for AVMetadataFormat);
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for CGAffineTransform);
}

void type metadata accessor for AVKeyValueStatus(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for AVKeyValueStatus);
}

void type metadata accessor for AVFileType(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for AVFileType);
}

void type metadata accessor for AVMediaType(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for AVMediaType);
}

__n128 __swift_memcpy24_4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CMTime(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CMTime(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
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
  *(_BYTE *)(result + 24) = v3;
  return result;
}

void type metadata accessor for CFDictionaryRef(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for CFDictionaryRef);
}

void type metadata accessor for related decl 'e' for AVError(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for related decl 'e' for AVError);
}

void type metadata accessor for AVMetadataExtraAttributeKey(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for AVMetadataExtraAttributeKey);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance AVMetadataExtraAttributeKey(uint64_t a1, uint64_t a2)
{
  return protocol witness for Hashable.hashValue.getter in conformance AVMetadataExtraAttributeKey(a1, a2, MEMORY[0x24BEE0CD8]);
}

id protocol witness for _BridgedStoredNSError._nsError.getter in conformance related decl 'e' for AVError()
{
  id *v0;

  return *v0;
}

uint64_t protocol witness for _BridgedStoredNSError.init(_nsError:) in conformance related decl 'e' for AVError@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance AVFileType(uint64_t a1, uint64_t a2)
{
  return protocol witness for Hashable.hashValue.getter in conformance AVMetadataExtraAttributeKey(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance AVAssetExportSessionStatus@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance AVAssetExportSessionStatus(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance AVMetadataExtraAttributeKey(uint64_t a1, id *a2)
{
  uint64_t result;

  result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance AVMetadataExtraAttributeKey(uint64_t a1, id *a2)
{
  char v3;

  v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance AVMetadataExtraAttributeKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = MEMORY[0x20BD05754](v2);
  result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t protocol witness for static CustomNSError.errorDomain.getter in conformance related decl 'e' for AVError()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t protocol witness for CustomNSError.errorCode.getter in conformance related decl 'e' for AVError()
{
  lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AVError, (uint64_t)&protocol conformance descriptor for related decl 'e' for AVError);
  return _BridgedStoredNSError.errorCode.getter();
}

uint64_t protocol witness for CustomNSError.errorUserInfo.getter in conformance related decl 'e' for AVError()
{
  lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AVError, (uint64_t)&protocol conformance descriptor for related decl 'e' for AVError);
  return _BridgedStoredNSError.errorUserInfo.getter();
}

uint64_t protocol witness for _ObjectiveCBridgeableError.init(_bridgedNSError:) in conformance related decl 'e' for AVError(void *a1)
{
  id v2;

  lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AVError, (uint64_t)&protocol conformance descriptor for related decl 'e' for AVError);
  v2 = a1;
  return _BridgedStoredNSError.init(_bridgedNSError:)();
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance related decl 'e' for AVError()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = *v0;
  v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance related decl 'e' for AVError()
{
  lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AVError, (uint64_t)&protocol conformance descriptor for related decl 'e' for AVError);
  return _BridgedStoredNSError.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance related decl 'e' for AVError()
{
  Hasher.init(_seed:)();
  dispatch thunk of Hashable.hash(into:)();
  return Hasher._finalize()();
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance AVMetadataExtraAttributeKey()
{
  lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataExtraAttributeKey, (uint64_t)&protocol conformance descriptor for AVMetadataExtraAttributeKey);
  lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataExtraAttributeKey, (uint64_t)&protocol conformance descriptor for AVMetadataExtraAttributeKey);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t base witness table accessor for RawRepresentable in AVMetadataExtraAttributeKey()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataExtraAttributeKey, (uint64_t)&protocol conformance descriptor for AVMetadataExtraAttributeKey);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in AVMetadataExtraAttributeKey()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataExtraAttributeKey, (uint64_t)&protocol conformance descriptor for AVMetadataExtraAttributeKey);
}

uint64_t lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x20BD05EEC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t base witness table accessor for Equatable in AVMetadataExtraAttributeKey()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataExtraAttributeKey, (uint64_t)&protocol conformance descriptor for AVMetadataExtraAttributeKey);
}

uint64_t protocol witness for Error._domain.getter in conformance related decl 'e' for AVError()
{
  lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AVError, (uint64_t)&protocol conformance descriptor for related decl 'e' for AVError);
  return Error<>._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance related decl 'e' for AVError()
{
  lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AVError, (uint64_t)&protocol conformance descriptor for related decl 'e' for AVError);
  return Error<>._code.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance related decl 'e' for AVError()
{
  lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AVError, (uint64_t)&protocol conformance descriptor for related decl 'e' for AVError);
  return _BridgedStoredNSError._getEmbeddedNSError()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance related decl 'e' for AVError()
{
  lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AVError, (uint64_t)&protocol conformance descriptor for related decl 'e' for AVError);
  return static _BridgedStoredNSError.== infix(_:_:)();
}

uint64_t base witness table accessor for Equatable in related decl 'e' for AVError()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AVError, (uint64_t)&protocol conformance descriptor for related decl 'e' for AVError);
}

uint64_t base witness table accessor for Error in related decl 'e' for AVError()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AVError, (uint64_t)&protocol conformance descriptor for related decl 'e' for AVError);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance AVError(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance AVMediaType()
{
  lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMediaType and conformance AVMediaType, (uint64_t (*)(uint64_t))type metadata accessor for AVMediaType, (uint64_t)&protocol conformance descriptor for AVMediaType);
  lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMediaType and conformance AVMediaType, (uint64_t (*)(uint64_t))type metadata accessor for AVMediaType, (uint64_t)&protocol conformance descriptor for AVMediaType);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t base witness table accessor for RawRepresentable in AVMediaType()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMediaType and conformance AVMediaType, (uint64_t (*)(uint64_t))type metadata accessor for AVMediaType, (uint64_t)&protocol conformance descriptor for AVMediaType);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in AVMediaType()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMediaType and conformance AVMediaType, (uint64_t (*)(uint64_t))type metadata accessor for AVMediaType, (uint64_t)&protocol conformance descriptor for AVMediaType);
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance AVFileType@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance AVFileType()
{
  lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVFileType and conformance AVFileType, (uint64_t (*)(uint64_t))type metadata accessor for AVFileType, (uint64_t)&protocol conformance descriptor for AVFileType);
  lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVFileType and conformance AVFileType, (uint64_t (*)(uint64_t))type metadata accessor for AVFileType, (uint64_t)&protocol conformance descriptor for AVFileType);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance AVMetadataFormat()
{
  lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataFormat and conformance AVMetadataFormat, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataFormat, (uint64_t)&protocol conformance descriptor for AVMetadataFormat);
  lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataFormat and conformance AVMetadataFormat, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataFormat, (uint64_t)&protocol conformance descriptor for AVMetadataFormat);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance AVMetadataKey()
{
  lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataKey and conformance AVMetadataKey, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataKey, (uint64_t)&protocol conformance descriptor for AVMetadataKey);
  lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataKey and conformance AVMetadataKey, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataKey, (uint64_t)&protocol conformance descriptor for AVMetadataKey);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance AVMediaCharacteristic()
{
  lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMediaCharacteristic and conformance AVMediaCharacteristic, (uint64_t (*)(uint64_t))type metadata accessor for AVMediaCharacteristic, (uint64_t)&protocol conformance descriptor for AVMediaCharacteristic);
  lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMediaCharacteristic and conformance AVMediaCharacteristic, (uint64_t (*)(uint64_t))type metadata accessor for AVMediaCharacteristic, (uint64_t)&protocol conformance descriptor for AVMediaCharacteristic);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance AVMetadataExtraAttributeKey@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = MEMORY[0x20BD05754](*a1, a1[1]);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance AVTrackAssociationType()
{
  lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVTrackAssociationType and conformance AVTrackAssociationType, (uint64_t (*)(uint64_t))type metadata accessor for AVTrackAssociationType, (uint64_t)&protocol conformance descriptor for AVTrackAssociationType);
  lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVTrackAssociationType and conformance AVTrackAssociationType, (uint64_t (*)(uint64_t))type metadata accessor for AVTrackAssociationType, (uint64_t)&protocol conformance descriptor for AVTrackAssociationType);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance AVMetadataExtraAttributeKey(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AVMetadataExtraAttributeKey()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance AVMetadataExtraAttributeKey()
{
  Swift::Int v0;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t base witness table accessor for Equatable in AVMediaType()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMediaType and conformance AVMediaType, (uint64_t (*)(uint64_t))type metadata accessor for AVMediaType, (uint64_t)&protocol conformance descriptor for AVMediaType);
}

uint64_t base witness table accessor for RawRepresentable in AVFileType()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVFileType and conformance AVFileType, (uint64_t (*)(uint64_t))type metadata accessor for AVFileType, (uint64_t)&protocol conformance descriptor for AVFileType);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in AVFileType()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVFileType and conformance AVFileType, (uint64_t (*)(uint64_t))type metadata accessor for AVFileType, (uint64_t)&protocol conformance descriptor for AVFileType);
}

uint64_t base witness table accessor for Equatable in AVFileType()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVFileType and conformance AVFileType, (uint64_t (*)(uint64_t))type metadata accessor for AVFileType, (uint64_t)&protocol conformance descriptor for AVFileType);
}

uint64_t base witness table accessor for RawRepresentable in AVMetadataFormat()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataFormat and conformance AVMetadataFormat, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataFormat, (uint64_t)&protocol conformance descriptor for AVMetadataFormat);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in AVMetadataFormat()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataFormat and conformance AVMetadataFormat, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataFormat, (uint64_t)&protocol conformance descriptor for AVMetadataFormat);
}

uint64_t base witness table accessor for Equatable in AVMetadataFormat()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataFormat and conformance AVMetadataFormat, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataFormat, (uint64_t)&protocol conformance descriptor for AVMetadataFormat);
}

uint64_t base witness table accessor for RawRepresentable in AVMetadataKey()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataKey and conformance AVMetadataKey, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataKey, (uint64_t)&protocol conformance descriptor for AVMetadataKey);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in AVMetadataKey()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataKey and conformance AVMetadataKey, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataKey, (uint64_t)&protocol conformance descriptor for AVMetadataKey);
}

uint64_t base witness table accessor for Equatable in AVMetadataKey()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMetadataKey and conformance AVMetadataKey, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataKey, (uint64_t)&protocol conformance descriptor for AVMetadataKey);
}

uint64_t base witness table accessor for RawRepresentable in AVMediaCharacteristic()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMediaCharacteristic and conformance AVMediaCharacteristic, (uint64_t (*)(uint64_t))type metadata accessor for AVMediaCharacteristic, (uint64_t)&protocol conformance descriptor for AVMediaCharacteristic);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in AVMediaCharacteristic()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMediaCharacteristic and conformance AVMediaCharacteristic, (uint64_t (*)(uint64_t))type metadata accessor for AVMediaCharacteristic, (uint64_t)&protocol conformance descriptor for AVMediaCharacteristic);
}

uint64_t base witness table accessor for Equatable in AVMediaCharacteristic()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVMediaCharacteristic and conformance AVMediaCharacteristic, (uint64_t (*)(uint64_t))type metadata accessor for AVMediaCharacteristic, (uint64_t)&protocol conformance descriptor for AVMediaCharacteristic);
}

uint64_t base witness table accessor for RawRepresentable in AVTrackAssociationType()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVTrackAssociationType and conformance AVTrackAssociationType, (uint64_t (*)(uint64_t))type metadata accessor for AVTrackAssociationType, (uint64_t)&protocol conformance descriptor for AVTrackAssociationType);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in AVTrackAssociationType()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVTrackAssociationType and conformance AVTrackAssociationType, (uint64_t (*)(uint64_t))type metadata accessor for AVTrackAssociationType, (uint64_t)&protocol conformance descriptor for AVTrackAssociationType);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance AVMetadataExtraAttributeKey()
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

uint64_t base witness table accessor for Equatable in AVTrackAssociationType()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVTrackAssociationType and conformance AVTrackAssociationType, (uint64_t (*)(uint64_t))type metadata accessor for AVTrackAssociationType, (uint64_t)&protocol conformance descriptor for AVTrackAssociationType);
}

uint64_t base witness table accessor for CustomNSError in related decl 'e' for AVError()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AVError, (uint64_t)&protocol conformance descriptor for related decl 'e' for AVError);
}

uint64_t base witness table accessor for _ObjectiveCBridgeableError in related decl 'e' for AVError()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AVError, (uint64_t)&protocol conformance descriptor for related decl 'e' for AVError);
}

uint64_t base witness table accessor for Hashable in related decl 'e' for AVError()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AVError, (uint64_t)&protocol conformance descriptor for related decl 'e' for AVError);
}

uint64_t associated type witness table accessor for _BridgedStoredNSError.Code : _ErrorCodeProtocol in related decl 'e' for AVError()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVError and conformance AVError, (uint64_t (*)(uint64_t))type metadata accessor for AVError, (uint64_t)&protocol conformance descriptor for AVError);
}

void type metadata accessor for AVError(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for AVError);
}

uint64_t associated type witness table accessor for _BridgedStoredNSError.Code : RawRepresentable in related decl 'e' for AVError()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVError and conformance AVError, (uint64_t (*)(uint64_t))type metadata accessor for AVError, (uint64_t)&protocol conformance descriptor for AVError);
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    result = MEMORY[0x20BD05EEC](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

uint64_t base witness table accessor for Equatable in AVError()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVError and conformance AVError, (uint64_t (*)(uint64_t))type metadata accessor for AVError, (uint64_t)&protocol conformance descriptor for AVError);
}

uint64_t associated type witness table accessor for _ErrorCodeProtocol._ErrorType : _BridgedStoredNSError in AVError()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AVError, (uint64_t)&protocol conformance descriptor for related decl 'e' for AVError);
}

uint64_t outlined init with copy of Sendable(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *outlined init with take of Sendable(_OWORD *a1, _OWORD *a2)
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

void type metadata accessor for CGPoint(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for CGPoint);
}

void type metadata accessor for AVCaptureFlashMode(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for AVCaptureFlashMode);
}

void type metadata accessor for AVCaptureColorSpace(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for AVCaptureColorSpace);
}

_QWORD *__swift_memcpy8_4(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CMVideoDimensions(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CMVideoDimensions(uint64_t result, int a2, int a3)
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

void type metadata accessor for CMVideoDimensions(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for CMVideoDimensions);
}

void type metadata accessor for AVAssetExportSessionStatus(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for AVAssetExportSessionStatus);
}

void type metadata accessor for CMTimeFlags(uint64_t a1)
{
  type metadata accessor for CGImageRef(a1, &lazy cache variable for type metadata for CMTimeFlags);
}

_QWORD *static AVPartialAsyncProperty<A>.extraAttributes.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVMetadataExtraAttributeKey : Any]?, 0x7474416172747865, 0xEF73657475626972);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD05EE0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *static AVPartialAsyncProperty<A>.value.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for (NSCopying & NSObject)?, 0x65756C6176, 0xE500000000000000);
}

_QWORD *static AVPartialAsyncProperty<A>.stringValue.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for String?, 0x6156676E69727473, 0xEB0000000065756CLL);
}

_QWORD *static AVPartialAsyncProperty<A>.numberValue.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for NSNumber?, 0x61567265626D756ELL, 0xEB0000000065756CLL);
}

_QWORD *static AVPartialAsyncProperty<A>.dateValue.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for Date?, 0x756C615665746164, 0xE900000000000065);
}

_QWORD *static AVPartialAsyncProperty<A>.dataValue.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for Data?, 0x756C615661746164, 0xE900000000000065);
}

_QWORD *static AVPartialAsyncProperty<A>.extraAttributes.getter(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *(_QWORD *)(v3 + 96);
  v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a1);
  type metadata accessor for AVAsyncProperty(0, v6, v7, v8);
  return AVAsyncProperty<>.init(key:)(a2, a3);
}

_QWORD *static AVPartialAsyncProperty<A>.tracks.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [AVMutableMovieTrack]);
  type metadata accessor for AVAsyncProperty(0, v1, v2, v3);
  return AVAsyncProperty<>.init(key:)(0x736B63617274, 0xE600000000000000);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [AVFragmentedMovieTrack]);
  type metadata accessor for AVAsyncProperty(0, v1, v2, v3);
  return AVAsyncProperty<>.init(key:)(0x736B63617274, 0xE600000000000000);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [AVCompositionTrack]);
  type metadata accessor for AVAsyncProperty(0, v1, v2, v3);
  return AVAsyncProperty<>.init(key:)(0x736B63617274, 0xE600000000000000);
}

{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVAssetTrack], 0x736B63617274, 0xE600000000000000);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [AVMutableCompositionTrack]);
  type metadata accessor for AVAsyncProperty(0, v1, v2, v3);
  return AVAsyncProperty<>.init(key:)(0x736B63617274, 0xE600000000000000);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [AVFragmentedAssetTrack]);
  type metadata accessor for AVAsyncProperty(0, v1, v2, v3);
  return AVAsyncProperty<>.init(key:)(0x736B63617274, 0xE600000000000000);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [AVMovieTrack]);
  type metadata accessor for AVAsyncProperty(0, v1, v2, v3);
  return AVAsyncProperty<>.init(key:)(0x736B63617274, 0xE600000000000000);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [AVAssetTrack]);
  type metadata accessor for AVAsyncProperty(0, v1, v2, v3);
  return AVAsyncProperty<>.init(key:)(0x736B63617274, 0xE600000000000000);
}

uint64_t related decl 'e' for AVError.device.getter()
{
  return 0;
}

uint64_t related decl 'e' for AVError.device.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  *(_QWORD *)&v8 = a1;
  type metadata accessor for related decl 'e' for AVError(0);
  lazy protocol witness table accessor for type related decl 'e' for AVError and conformance related decl 'e' for AVError();
  v1 = _BridgedStoredNSError.userInfo.getter();
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(_QWORD *)(v1 + 16) && (v4 = specialized __RawDictionaryStorage.find<A>(_:)(v2, v3), (v5 & 1) != 0))
  {
    outlined init with copy of Sendable(*(_QWORD *)(v1 + 56) + 32 * v4, (uint64_t)&v8);
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v9 + 1))
  {
    type metadata accessor for AVCaptureDevice();
    if (swift_dynamicCast())
      return v7;
    else
      return 0;
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v8);
    return 0;
  }
}

unint64_t lazy protocol witness table accessor for type related decl 'e' for AVError and conformance related decl 'e' for AVError()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError;
  if (!lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError)
  {
    type metadata accessor for related decl 'e' for AVError(255);
    result = MEMORY[0x20BD05EEC](&protocol conformance descriptor for related decl 'e' for AVError, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for AVError and conformance related decl 'e' for AVError);
  }
  return result;
}

CMTimeValue related decl 'e' for AVError.time.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  CMTimeValue value;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  CFDictionaryRef v13;
  CMTime v15;
  CFDictionaryRef dictionaryRepresentation;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  *(_QWORD *)&v17 = a1;
  type metadata accessor for related decl 'e' for AVError(0);
  lazy protocol witness table accessor for type related decl 'e' for AVError and conformance related decl 'e' for AVError();
  v2 = _BridgedStoredNSError.userInfo.getter();
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(_QWORD *)(v2 + 16) && (v5 = specialized __RawDictionaryStorage.find<A>(_:)(v3, v4), (v6 & 1) != 0))
  {
    outlined init with copy of Sendable(*(_QWORD *)(v2 + 56) + 32 * v5, (uint64_t)&v19);
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v20 + 1))
  {
    type metadata accessor for CMTime(0);
    if (swift_dynamicCast())
      return v17;
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v19);
  }
  *(_QWORD *)&v17 = a1;
  v8 = _BridgedStoredNSError.userInfo.getter();
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(_QWORD *)(v8 + 16) && (v11 = specialized __RawDictionaryStorage.find<A>(_:)(v9, v10), (v12 & 1) != 0))
  {
    outlined init with copy of Sendable(*(_QWORD *)(v8 + 56) + 32 * v11, (uint64_t)&v17);
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v18 + 1))
  {
    outlined init with take of Sendable(&v17, &v19);
    outlined init with copy of Sendable((uint64_t)&v19, (uint64_t)&v17);
    type metadata accessor for CFDictionaryRef(0);
    swift_dynamicCast();
    v13 = dictionaryRepresentation;
    CMTimeMakeFromDictionary(&v15, dictionaryRepresentation);
    value = v15.value;

    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v19);
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v17);
    return 0;
  }
  return value;
}

uint64_t related decl 'e' for AVError.fileSize.getter(uint64_t a1)
{
  return related decl 'e' for AVError.fileSize.getter(a1);
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  *(_QWORD *)&v8 = a1;
  type metadata accessor for related decl 'e' for AVError(0);
  lazy protocol witness table accessor for type related decl 'e' for AVError and conformance related decl 'e' for AVError();
  v1 = _BridgedStoredNSError.userInfo.getter();
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(_QWORD *)(v1 + 16) && (v4 = specialized __RawDictionaryStorage.find<A>(_:)(v2, v3), (v5 & 1) != 0))
  {
    outlined init with copy of Sendable(*(_QWORD *)(v1 + 56) + 32 * v4, (uint64_t)&v8);
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v9 + 1))
  {
    if (swift_dynamicCast())
      return v7;
    else
      return 0;
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v8);
    return 0;
  }
}

uint64_t related decl 'e' for AVError.processID.getter(uint64_t a1)
{
  return related decl 'e' for AVError.fileSize.getter(a1);
}

uint64_t related decl 'e' for AVError.recordingSuccessfullyFinished.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  unsigned __int8 v7;
  __int128 v8;
  __int128 v9;

  *(_QWORD *)&v8 = a1;
  type metadata accessor for related decl 'e' for AVError(0);
  lazy protocol witness table accessor for type related decl 'e' for AVError and conformance related decl 'e' for AVError();
  v1 = _BridgedStoredNSError.userInfo.getter();
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(_QWORD *)(v1 + 16) && (v4 = specialized __RawDictionaryStorage.find<A>(_:)(v2, v3), (v5 & 1) != 0))
  {
    outlined init with copy of Sendable(*(_QWORD *)(v1 + 56) + 32 * v4, (uint64_t)&v8);
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v9 + 1))
  {
    if (swift_dynamicCast())
      return v7;
    else
      return 2;
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v8);
    return 2;
  }
}

uint64_t related decl 'e' for AVError.mediaType.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  *(_QWORD *)&v8 = a1;
  type metadata accessor for related decl 'e' for AVError(0);
  lazy protocol witness table accessor for type related decl 'e' for AVError and conformance related decl 'e' for AVError();
  v1 = _BridgedStoredNSError.userInfo.getter();
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(_QWORD *)(v1 + 16) && (v4 = specialized __RawDictionaryStorage.find<A>(_:)(v2, v3), (v5 & 1) != 0))
  {
    outlined init with copy of Sendable(*(_QWORD *)(v1 + 56) + 32 * v4, (uint64_t)&v8);
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v9 + 1))
  {
    if (swift_dynamicCast())
      return v7;
    else
      return 0;
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v8);
    return 0;
  }
}

{
  return related decl 'e' for AVError.mediaType.getter(a1, MEMORY[0x24BDFDCA0], type metadata accessor for AVMediaType);
}

uint64_t related decl 'e' for AVError.mediaSubtypes.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  *(_QWORD *)&v8 = a1;
  type metadata accessor for related decl 'e' for AVError(0);
  lazy protocol witness table accessor for type related decl 'e' for AVError and conformance related decl 'e' for AVError();
  v1 = _BridgedStoredNSError.userInfo.getter();
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(_QWORD *)(v1 + 16) && (v4 = specialized __RawDictionaryStorage.find<A>(_:)(v2, v3), (v5 & 1) != 0))
  {
    outlined init with copy of Sendable(*(_QWORD *)(v1 + 56) + 32 * v4, (uint64_t)&v8);
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v9 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
    if (swift_dynamicCast())
      return v7;
    else
      return 0;
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v8);
    return 0;
  }
}

uint64_t related decl 'e' for AVError.presentationTimeStamp.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  *(_QWORD *)&v8 = a1;
  type metadata accessor for related decl 'e' for AVError(0);
  lazy protocol witness table accessor for type related decl 'e' for AVError and conformance related decl 'e' for AVError();
  v1 = _BridgedStoredNSError.userInfo.getter();
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(_QWORD *)(v1 + 16) && (v4 = specialized __RawDictionaryStorage.find<A>(_:)(v2, v3), (v5 & 1) != 0))
  {
    outlined init with copy of Sendable(*(_QWORD *)(v1 + 56) + 32 * v4, (uint64_t)&v8);
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v9 + 1))
  {
    type metadata accessor for CMTime(0);
    if (swift_dynamicCast())
      return v7;
    else
      return 0;
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v8);
    return 0;
  }
}

unint64_t related decl 'e' for AVError.persistentTrackID.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  int v6;
  uint64_t v7;
  unsigned __int8 v8;
  unsigned int v10;
  __int128 v11;
  __int128 v12;

  *(_QWORD *)&v11 = a1;
  type metadata accessor for related decl 'e' for AVError(0);
  lazy protocol witness table accessor for type related decl 'e' for AVError and conformance related decl 'e' for AVError();
  v1 = _BridgedStoredNSError.userInfo.getter();
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(_QWORD *)(v1 + 16) && (v4 = specialized __RawDictionaryStorage.find<A>(_:)(v2, v3), (v5 & 1) != 0))
  {
    outlined init with copy of Sendable(*(_QWORD *)(v1 + 56) + 32 * v4, (uint64_t)&v11);
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v12 + 1))
  {
    v6 = swift_dynamicCast();
    v7 = v10;
    v8 = v6 ^ 1;
    if (!v6)
      v7 = 0;
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v11);
    v7 = 0;
    v8 = 1;
  }
  return v7 | ((unint64_t)v8 << 32);
}

uint64_t related decl 'e' for AVError.fileType.getter(uint64_t a1)
{
  return related decl 'e' for AVError.mediaType.getter(a1, MEMORY[0x24BDFDC90], type metadata accessor for AVFileType);
}

uint64_t related decl 'e' for AVError.mediaType.getter(uint64_t a1, uint64_t a2, void (*a3)(_QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v10;
  __int128 v11;
  __int128 v12;

  *(_QWORD *)&v11 = a1;
  type metadata accessor for related decl 'e' for AVError(0);
  lazy protocol witness table accessor for type related decl 'e' for AVError and conformance related decl 'e' for AVError();
  v4 = _BridgedStoredNSError.userInfo.getter();
  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(_QWORD *)(v4 + 16) && (v7 = specialized __RawDictionaryStorage.find<A>(_:)(v5, v6), (v8 & 1) != 0))
  {
    outlined init with copy of Sendable(*(_QWORD *)(v4 + 56) + 32 * v7, (uint64_t)&v11);
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v12 + 1))
  {
    a3(0);
    if (swift_dynamicCast())
      return v10;
    else
      return 0;
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v11);
    return 0;
  }
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;

  Hasher.init(_seed:)();
  String.hash(into:)();
  v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t type metadata accessor for AVCaptureDevice()
{
  unint64_t result;

  result = lazy cache variable for type metadata for AVCaptureDevice;
  if (!lazy cache variable for type metadata for AVCaptureDevice)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for AVCaptureDevice);
  }
  return result;
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

void AVCaptureIndexPicker.setActionQueue(_:action:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  _QWORD v6[6];

  v6[4] = a2;
  v6[5] = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 1107296256;
  v6[2] = thunk for @escaping @callee_guaranteed (@unowned Int) -> ();
  v6[3] = &block_descriptor;
  v5 = _Block_copy(v6);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_setActionQueue_action_, a1, v5);
  _Block_release(v5);
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Int) -> ()(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
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

unint64_t lazy protocol witness table accessor for type CancellationError and conformance CancellationError()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type CancellationError and conformance CancellationError;
  if (!lazy protocol witness table cache variable for type CancellationError and conformance CancellationError)
  {
    v1 = type metadata accessor for CancellationError();
    result = MEMORY[0x20BD05EEC](MEMORY[0x24BEE6848], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CancellationError and conformance CancellationError);
  }
  return result;
}

unint64_t AVAnyAsyncProperty.description.getter()
{
  return 0xD000000000000012;
}

uint64_t AVAnyAsyncProperty.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t AVAnyAsyncProperty.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AVAnyAsyncProperty()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 88))();
}

uint64_t AVPartialAsyncProperty.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return v2;
}

uint64_t AVPartialAsyncProperty.description.getter()
{
  uint64_t v0;
  Swift::String v1;
  void *v2;
  uint64_t v3;
  Swift::String v4;
  uint64_t v6;

  v6 = _typeName(_:qualified:)();
  v1._countAndFlagsBits = 46;
  v1._object = (void *)0xE100000000000000;
  String.append(_:)(v1);
  v3 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  swift_bridgeObjectRetain();
  v4._countAndFlagsBits = v3;
  v4._object = v2;
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t AVPartialAsyncProperty.__ivar_destroyer()
{
  return swift_bridgeObjectRelease();
}

uint64_t AVPartialAsyncProperty.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AVPartialAsyncProperty.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

_QWORD *AVAsyncProperty.__allocating_init(key:value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *result;

  result = (_QWORD *)swift_allocObject();
  result[4] = a3;
  result[5] = a4;
  result[2] = a1;
  result[3] = a2;
  return result;
}

_QWORD *AVAsyncProperty.init(key:value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return v4;
}

uint64_t AVAsyncProperty.__ivar_destroyer()
{
  return swift_release();
}

uint64_t AVAsyncProperty.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

void static AVAsyncProperty.Status<>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t TupleTypeMetadata2;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, uint64_t, uint64_t);
  char *v20;
  _QWORD v21[5];
  uint64_t v22;

  v22 = a2;
  v6 = *(_QWORD *)(a4 - 8);
  v21[2] = a5;
  v21[3] = v6;
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v21[1] = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v21[0] = (char *)v21 - v9;
  v12 = type metadata accessor for AVAsyncProperty.Status(0, v10, v11, v11);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  MEMORY[0x24BDAC7A8](v14);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v16 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v18 = (char *)v21 + *(int *)(v16 + 48) - v17;
  v21[4] = v13;
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v19((char *)v21 - v17, a1, v12);
  v19(v18, v22, v12);
  v20 = (char *)sub_20837158C + 4 * byte_20838E8B0[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_20837158C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);

  v6(v7, v2, v0);
  if (swift_getEnumCaseMultiPayload())
  {
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 104) + 8))(v7, v1);
    v9 = 0;
  }
  else
  {
    v10 = *(_QWORD *)(v8 - 104);
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32);
    v12 = *(_QWORD *)(v8 - 128);
    v11(v12, v7, v1);
    v13 = *(_QWORD *)(v8 - 120);
    v11(v13, v3, v1);
    v9 = dispatch thunk of static Equatable.== infix(_:_:)();
    v14 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v14(v13, v1);
    v14(v12, v1);
    v5 = *(_QWORD *)(v8 - 96);
    v4 = v0;
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  return v9 & 1;
}

unint64_t type metadata accessor for NSObject()
{
  unint64_t result;

  result = lazy cache variable for type metadata for NSObject;
  if (!lazy cache variable for type metadata for NSObject)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSObject);
  }
  return result;
}

void protocol witness for static Equatable.== infix(_:_:) in conformance <> AVAsyncProperty<A, B>.Status(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  static AVAsyncProperty.Status<>.== infix(_:_:)(a1, a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), *(_QWORD *)(a4 - 8));
}

void AVAsyncProperty.Status.description.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;

  v1 = MEMORY[0x24BDAC7A8](a1);
  MEMORY[0x24BDAC7A8](v1);
  (*(void (**)(char *))(v3 + 16))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (char *)&loc_208371808 + dword_20837192C[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_208371818()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  Swift::String v5;
  Swift::String v6;
  uint64_t v7;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v1, v2, v0);
  *(_QWORD *)(v4 - 64) = 0;
  *(_QWORD *)(v4 - 56) = 0xE000000000000000;
  v5._countAndFlagsBits = 0x2820646564616F4CLL;
  v5._object = (void *)0xE800000000000000;
  String.append(_:)(v5);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v6._countAndFlagsBits = 41;
  v6._object = (void *)0xE100000000000000;
  String.append(_:)(v6);
  v7 = *(_QWORD *)(v4 - 64);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v0);
  return v7;
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5[18] = a4;
  v5[19] = v4;
  v5[16] = a2;
  v5[17] = a3;
  v5[15] = a1;
  v6 = *a4;
  v8 = *(_QWORD *)(*(_QWORD *)a3 + 120);
  v7 = *(_QWORD *)(*(_QWORD *)a3 + 128);
  v5[20] = v7;
  v9 = type metadata accessor for AVAsyncProperty.Status(255, v8, v7, (uint64_t)a4);
  v5[21] = v9;
  v10 = *(_QWORD *)(v6 + 128);
  v5[22] = v10;
  v12 = type metadata accessor for AVAsyncProperty.Status(255, v8, v10, v11);
  v5[23] = v12;
  v5[24] = swift_getTupleTypeMetadata2();
  v5[25] = swift_task_alloc();
  v5[26] = *(_QWORD *)(v12 - 8);
  v5[27] = swift_task_alloc();
  v5[28] = *(_QWORD *)(v9 - 8);
  v5[29] = swift_task_alloc();
  v5[30] = swift_task_alloc();
  v5[31] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B>(_:_:)()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Class isa;
  uint64_t v10;
  _QWORD *v11;

  v1 = v0[18];
  v2 = (void *)v0[19];
  v3 = v0[17];
  v5 = *(_QWORD *)(v3 + 16);
  v4 = *(_QWORD *)(v3 + 24);
  v7 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_20838E830;
  *(_QWORD *)(v8 + 32) = v5;
  *(_QWORD *)(v8 + 40) = v4;
  *(_QWORD *)(v8 + 48) = v7;
  *(_QWORD *)(v8 + 56) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  v0[32] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = AVAsynchronousKeyValueLoading.load<A, B>(_:_:);
  v10 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v11 = v0 + 10;
  v11[1] = 0x40000000;
  v11[2] = @objc completion handler block implementation for <A><A1, B1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ();
  v11[3] = &block_descriptor_2;
  v11[4] = v10;
  objc_msgSend(v2, sel_loadValuesAsynchronouslyForKeys_completionHandler_, isa, v11);
  return swift_continuation_await();
}

{
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t *, uint64_t);
  int EnumCaseMultiPayload;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t (*v21)(void);
  uint64_t v23;
  Swift::String v24;
  Swift::String v25;
  Swift::String v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v1 = *(uint64_t **)(v0 + 248);
  v2 = *(uint64_t **)(v0 + 216);
  v3 = *(_QWORD *)(v0 + 224);
  v4 = *(_QWORD *)(v0 + 200);
  v5 = *(_QWORD *)(v0 + 192);
  v37 = *(_QWORD *)(v0 + 208);
  v38 = *(_QWORD *)(v0 + 184);
  v6 = *(_QWORD *)(v0 + 168);
  v7 = *(uint64_t **)(v0 + 144);
  v8 = *(uint64_t **)(v0 + 136);

  AVAsynchronousKeyValueLoading.status<A>(of:)(v8, v1);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v7, v2);
  v9 = v4 + *(int *)(v5 + 48);
  v10 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v3 + 16);
  v10(v4, v1, v6);
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(v37 + 16))(v9, v2, v38);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v14 = *(_QWORD *)(v0 + 208);
    v15 = *(_QWORD *)(v0 + 184);
    v10(*(_QWORD *)(v0 + 232), *(uint64_t **)(v0 + 200), *(_QWORD *)(v0 + 168));
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v9, v15);
    v13 = *(_QWORD *)(v0 + 184);
    goto LABEL_8;
  }
  if (!EnumCaseMultiPayload)
  {
    v10(*(_QWORD *)(v0 + 240), *(uint64_t **)(v0 + 200), *(_QWORD *)(v0 + 168));
    if (!swift_getEnumCaseMultiPayload())
    {
      v27 = *(_QWORD *)(v0 + 240);
      v28 = *(_QWORD *)(v0 + 248);
      v29 = *(_QWORD *)(v0 + 224);
      v36 = *(_QWORD *)(v0 + 200);
      v30 = *(_QWORD *)(v0 + 176);
      v32 = *(_QWORD *)(v0 + 160);
      v31 = *(_QWORD *)(v0 + 168);
      v34 = *(_QWORD *)(v0 + 120);
      v33 = *(_QWORD *)(v0 + 128);
      (*(void (**)(void))(*(_QWORD *)(v0 + 208) + 8))();
      v35 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
      v35(v28, v31);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 32))(v34, v27, v32);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 32))(v33, v9, v30);
      v35(v36, v31);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v21 = *(uint64_t (**)(void))(v0 + 8);
      return v21();
    }
    (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 160) - 8) + 8))(*(_QWORD *)(v0 + 240));
  }
  v12 = *(_QWORD *)(v0 + 184);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v13 = v12;
LABEL_8:
    v16 = *(_QWORD *)(v0 + 248);
    v17 = *(_QWORD *)(v0 + 216);
    v18 = *(_QWORD *)(v0 + 208);
    v19 = *(_QWORD *)(v0 + 168);
    v20 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 224) + 8);
    v20(*(_QWORD *)(v0 + 200), v19);
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v13);
    v20(v16, v19);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v21 = *(uint64_t (**)(void))(v0 + 8);
    return v21();
  }
  v23 = *(_QWORD *)(v0 + 168);
  _StringGuts.grow(_:)(28);
  v24._object = (void *)0x8000000208391B80;
  v24._countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v24);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v23);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v25._countAndFlagsBits = 8236;
  v25._object = (void *)0xE200000000000000;
  String.append(_:)(v25);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v12);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v26._countAndFlagsBits = 41;
  v26._object = (void *)0xE100000000000000;
  String.append(_:)(v26);
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t @objc completion handler block implementation for <A><A1, B1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ()()
{
  return swift_continuation_resume();
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C>(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t *a6)
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v7[20] = a6;
  v7[21] = v6;
  v7[18] = a4;
  v7[19] = a5;
  v7[16] = a2;
  v7[17] = a3;
  v7[15] = a1;
  v8 = *a5;
  v9 = *a6;
  v11 = *(_QWORD *)(*(_QWORD *)a4 + 120);
  v10 = *(_QWORD *)(*(_QWORD *)a4 + 128);
  v7[22] = v10;
  v12 = type metadata accessor for AVAsyncProperty.Status(255, v11, v10, a4);
  v7[23] = v12;
  v13 = *(_QWORD *)(v8 + 128);
  v7[24] = v13;
  v15 = type metadata accessor for AVAsyncProperty.Status(255, v11, v13, v14);
  v7[25] = v15;
  v16 = *(_QWORD *)(v9 + 128);
  v7[26] = v16;
  v18 = type metadata accessor for AVAsyncProperty.Status(255, v11, v16, v17);
  v7[27] = v18;
  v7[28] = swift_getTupleTypeMetadata3();
  v7[29] = swift_task_alloc();
  v7[30] = *(_QWORD *)(v18 - 8);
  v7[31] = swift_task_alloc();
  v7[32] = *(_QWORD *)(v15 - 8);
  v7[33] = swift_task_alloc();
  v7[34] = swift_task_alloc();
  v7[35] = *(_QWORD *)(v12 - 8);
  v7[36] = swift_task_alloc();
  v7[37] = swift_task_alloc();
  v7[38] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C>(_:_:_:)()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Class isa;
  uint64_t v13;
  _QWORD *v14;

  v1 = v0[20];
  v2 = (void *)v0[21];
  v4 = v0[18];
  v3 = v0[19];
  v6 = *(_QWORD *)(v4 + 16);
  v5 = *(_QWORD *)(v4 + 24);
  v8 = *(_QWORD *)(v3 + 16);
  v7 = *(_QWORD *)(v3 + 24);
  v10 = *(_QWORD *)(v1 + 16);
  v9 = *(_QWORD *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_20838E840;
  *(_QWORD *)(v11 + 32) = v6;
  *(_QWORD *)(v11 + 40) = v5;
  *(_QWORD *)(v11 + 48) = v8;
  *(_QWORD *)(v11 + 56) = v7;
  *(_QWORD *)(v11 + 64) = v10;
  *(_QWORD *)(v11 + 72) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  v0[39] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = AVAsynchronousKeyValueLoading.load<A, B, C>(_:_:_:);
  v13 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v14 = v0 + 10;
  v14[1] = 0x40000000;
  v14[2] = @objc completion handler block implementation for <A><A1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ();
  v14[3] = &block_descriptor_4;
  v14[4] = v13;
  objc_msgSend(v2, sel_loadValuesAsynchronouslyForKeys_completionHandler_, isa, v14);
  return swift_continuation_await();
}

{
  return swift_task_switch();
}

{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  void (*v13)(uint64_t, uint64_t *, uint64_t);
  void (*v14)(uint64_t, uint64_t *, uint64_t);
  int EnumCaseMultiPayload;
  uint64_t v16;
  uint64_t *v17;
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
  void (*v29)(uint64_t, uint64_t);
  uint64_t (*v30)(void);
  uint64_t v32;
  Swift::String v33;
  Swift::String v34;
  Swift::String v35;
  Swift::String v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
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

  v1 = v0;
  v3 = v0[30];
  v2 = v0 + 30;
  v4 = (uint64_t *)v2[8];
  v5 = (uint64_t *)v2[4];
  v50 = v2 + 2;
  v62 = v2[2];
  v52 = (uint64_t *)v2[1];
  v7 = *(v2 - 2);
  v6 = *(v2 - 1);
  v64 = *(v2 - 3);
  v57 = v2[5];
  v60 = *(v2 - 5);
  v54 = *(v2 - 7);
  v8 = (uint64_t *)*(v2 - 10);
  v10 = (uint64_t *)*(v2 - 12);
  v9 = (uint64_t *)*(v2 - 11);

  AVAsynchronousKeyValueLoading.status<A>(of:)(v10, v4);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v9, v5);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v8, v52);
  v11 = (uint64_t *)(v6 + *(int *)(v7 + 48));
  v12 = (uint64_t *)(v6 + *(int *)(v7 + 64));
  v13 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v57 + 16);
  v13(v6, v4, v54);
  v14 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v62 + 16);
  v14((uint64_t)v11, v5, v60);
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v3 + 16))(v12, v52, v64);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v18 = v1[30];
    v19 = v1[27];
    v13(v1[36], (uint64_t *)v1[29], v1[23]);
    (*(void (**)(uint64_t *, uint64_t))(v18 + 8))(v12, v19);
    v55 = v1[27];
    v58 = v1[25];
    v17 = v11;
    v2 = v50;
    goto LABEL_12;
  }
  if (!EnumCaseMultiPayload)
  {
    v13(v1[37], (uint64_t *)v1[29], v1[23]);
    if (!swift_getEnumCaseMultiPayload())
    {
      v14(v1[33], v11, v1[25]);
      if (!swift_getEnumCaseMultiPayload())
      {
        v37 = v1[38];
        v49 = v1[37];
        v38 = v1[34];
        v47 = v1[35];
        v39 = v1[32];
        v63 = v1[29];
        v53 = v1[26];
        v56 = v1[33];
        v59 = v12;
        v40 = v1[24];
        v41 = v1[25];
        v42 = v1[22];
        v43 = v1[23];
        v51 = v1[17];
        v44 = v1[15];
        v48 = v1[16];
        (*(void (**)(void))(v1[30] + 8))();
        v45 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
        v45(v38, v41);
        v46 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
        v46(v37, v43);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 32))(v44, v49, v42);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 32))(v48, v56, v40);
        (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)(v53 - 8) + 32))(v51, v59);
        v45((uint64_t)v11, v41);
        v46(v63, v43);
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        v30 = (uint64_t (*)(void))v1[1];
        return v30();
      }
      (*(void (**)(_QWORD))(*(_QWORD *)(v1[24] - 8) + 8))(v1[33]);
    }
    (*(void (**)(_QWORD))(*(_QWORD *)(v1[22] - 8) + 8))(v1[37]);
  }
  v16 = v1[25];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v55 = v1[27];
    v58 = v16;
    v17 = v12;
LABEL_12:
    v21 = *v2;
    v22 = v1[38];
    v23 = v1[35];
    v24 = v1[34];
    v25 = v1[31];
    v61 = v1[32];
    v26 = v1[29];
    v27 = v1[30];
    v28 = v1[23];
    (*(void (**)(uint64_t *))(v21 + 8))(v17);
    v29 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    v29(v26, v28);
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v55);
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v24, v58);
    v29(v22, v28);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v30 = (uint64_t (*)(void))v1[1];
    return v30();
  }
  v20 = v1[27];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v17 = v11;
    v2 += 2;
    v55 = v20;
    v58 = v16;
    goto LABEL_12;
  }
  v32 = v1[23];
  _StringGuts.grow(_:)(32);
  v33._object = (void *)0x8000000208391B80;
  v33._countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v33);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v32);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v34._countAndFlagsBits = 8236;
  v34._object = (void *)0xE200000000000000;
  String.append(_:)(v34);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v16);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v35._countAndFlagsBits = 8236;
  v35._object = (void *)0xE200000000000000;
  String.append(_:)(v35);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v20);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v36._countAndFlagsBits = 41;
  v36._object = (void *)0xE100000000000000;
  String.append(_:)(v36);
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C, D>(_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t *a7, uint64_t *a8)
{
  uint64_t v8;
  _QWORD *v9;
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

  v9[26] = a8;
  v9[27] = v8;
  v9[24] = a6;
  v9[25] = a7;
  v9[22] = a4;
  v9[23] = a5;
  v9[20] = a2;
  v9[21] = a3;
  v9[19] = a1;
  v10 = *a6;
  v11 = *a7;
  v12 = *a8;
  v14 = *(_QWORD *)(*(_QWORD *)a5 + 120);
  v13 = *(_QWORD *)(*(_QWORD *)a5 + 128);
  v9[28] = v13;
  v9[15] = type metadata accessor for AVAsyncProperty.Status(255, v14, v13, a4);
  v15 = *(_QWORD *)(v10 + 128);
  v9[29] = v15;
  v9[16] = type metadata accessor for AVAsyncProperty.Status(255, v14, v15, v16);
  v17 = *(_QWORD *)(v11 + 128);
  v9[30] = v17;
  v9[17] = type metadata accessor for AVAsyncProperty.Status(255, v14, v17, v18);
  v19 = *(_QWORD *)(v12 + 128);
  v9[31] = v19;
  v9[18] = type metadata accessor for AVAsyncProperty.Status(255, v14, v19, v20);
  v9[32] = swift_getTupleTypeMetadata();
  v9[33] = swift_task_alloc();
  v22 = type metadata accessor for AVAsyncProperty.Status(0, v14, v19, v21);
  v9[34] = v22;
  v9[35] = *(_QWORD *)(v22 - 8);
  v9[36] = swift_task_alloc();
  v24 = type metadata accessor for AVAsyncProperty.Status(0, v14, v17, v23);
  v9[37] = v24;
  v9[38] = *(_QWORD *)(v24 - 8);
  v9[39] = swift_task_alloc();
  v9[40] = swift_task_alloc();
  v26 = type metadata accessor for AVAsyncProperty.Status(0, v14, v15, v25);
  v9[41] = v26;
  v9[42] = *(_QWORD *)(v26 - 8);
  v9[43] = swift_task_alloc();
  v9[44] = swift_task_alloc();
  v28 = type metadata accessor for AVAsyncProperty.Status(0, v14, v13, v27);
  v9[45] = v28;
  v9[46] = *(_QWORD *)(v28 - 8);
  v9[47] = swift_task_alloc();
  v9[48] = swift_task_alloc();
  v9[49] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C, D>(_:_:_:_:)()
{
  _QWORD *v0;
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Class isa;
  uint64_t v15;
  _QWORD *v16;
  id v18;

  v18 = (id)v0[27];
  v2 = v0[25];
  v1 = v0[26];
  v4 = v0[23];
  v3 = v0[24];
  v6 = *(_QWORD *)(v4 + 16);
  v5 = *(_QWORD *)(v4 + 24);
  v8 = *(_QWORD *)(v3 + 16);
  v7 = *(_QWORD *)(v3 + 24);
  v9 = *(_QWORD *)(v2 + 16);
  v10 = *(_QWORD *)(v2 + 24);
  v11 = *(_QWORD *)(v1 + 16);
  v12 = *(_QWORD *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_20838E850;
  *(_QWORD *)(v13 + 32) = v6;
  *(_QWORD *)(v13 + 40) = v5;
  *(_QWORD *)(v13 + 48) = v8;
  *(_QWORD *)(v13 + 56) = v7;
  *(_QWORD *)(v13 + 64) = v9;
  *(_QWORD *)(v13 + 72) = v10;
  *(_QWORD *)(v13 + 80) = v11;
  *(_QWORD *)(v13 + 88) = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  v0[50] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = AVAsynchronousKeyValueLoading.load<A, B, C, D>(_:_:_:_:);
  v15 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v16 = v0 + 10;
  v16[1] = 0x40000000;
  v16[2] = @objc completion handler block implementation for <A><A1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ();
  v16[3] = &block_descriptor_6;
  v16[4] = v15;
  objc_msgSend(v18, sel_loadValuesAsynchronouslyForKeys_completionHandler_, isa, v16);
  return swift_continuation_await();
}

{
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  int *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  void (*v11)(uint64_t, uint64_t *, uint64_t);
  uint64_t *v12;
  void (*v13)(uint64_t *, uint64_t *, uint64_t);
  void (*v14)(uint64_t *, uint64_t *, uint64_t);
  uint64_t *v15;
  uint64_t *v16;
  int EnumCaseMultiPayload;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
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
  void (*v36)(uint64_t, uint64_t);
  uint64_t (*v37)(void);
  uint64_t v39;
  Swift::String v40;
  Swift::String v41;
  Swift::String v42;
  Swift::String v43;
  Swift::String v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t *v75;
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
  uint64_t *v88;
  uint64_t v89;
  uint64_t *v90;

  v1 = *(uint64_t **)(v0 + 392);
  v2 = *(uint64_t **)(v0 + 352);
  v76 = *(_QWORD *)(v0 + 368);
  v77 = *(_QWORD *)(v0 + 360);
  v70 = v1;
  v73 = v2;
  v3 = *(uint64_t **)(v0 + 320);
  v87 = *(_QWORD *)(v0 + 336);
  v89 = *(_QWORD *)(v0 + 328);
  v80 = *(_QWORD *)(v0 + 304);
  v82 = *(_QWORD *)(v0 + 296);
  v67 = *(uint64_t **)(v0 + 288);
  v4 = *(_QWORD *)(v0 + 264);
  v84 = *(_QWORD *)(v0 + 280);
  v85 = *(_QWORD *)(v0 + 272);
  v5 = *(int **)(v0 + 256);
  v64 = *(uint64_t **)(v0 + 208);
  v7 = *(uint64_t **)(v0 + 192);
  v6 = *(uint64_t **)(v0 + 200);
  v8 = *(uint64_t **)(v0 + 184);

  AVAsynchronousKeyValueLoading.status<A>(of:)(v8, v1);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v7, v2);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v6, v3);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v64, v67);
  v9 = (uint64_t *)(v4 + v5[12]);
  v10 = (uint64_t *)(v4 + v5[20]);
  v11 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v76 + 16);
  v12 = (uint64_t *)(v4 + v5[16]);
  v11(v4, v70, v77);
  v13 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v87 + 16);
  v88 = v9;
  v13(v9, v73, v89);
  v14 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v80 + 16);
  v90 = v12;
  v15 = v12;
  v16 = v10;
  v14(v15, v3, v82);
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v84 + 16))(v10, v67, v85);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v23 = *(_QWORD *)(v0 + 272);
    v24 = *(_QWORD *)(v0 + 280);
    v11(*(_QWORD *)(v0 + 376), *(uint64_t **)(v0 + 264), *(_QWORD *)(v0 + 360));
    (*(void (**)(uint64_t *, uint64_t))(v24 + 8))(v10, v23);
    v71 = *(_QWORD *)(v0 + 296);
    v74 = *(_QWORD *)(v0 + 272);
    v20 = (uint64_t *)(v0 + 336);
    v18 = (uint64_t *)(v0 + 304);
    v22 = v90;
    v65 = *(_QWORD *)(v0 + 328);
    v68 = v65;
    v21 = v88;
    goto LABEL_17;
  }
  if (!EnumCaseMultiPayload)
  {
    v11(*(_QWORD *)(v0 + 384), *(uint64_t **)(v0 + 264), *(_QWORD *)(v0 + 360));
    if (!swift_getEnumCaseMultiPayload())
    {
      v13(*(uint64_t **)(v0 + 344), v88, *(_QWORD *)(v0 + 328));
      if (!swift_getEnumCaseMultiPayload())
      {
        v14(*(uint64_t **)(v0 + 312), v90, *(_QWORD *)(v0 + 296));
        if (!swift_getEnumCaseMultiPayload())
        {
          v86 = *(_QWORD *)(v0 + 392);
          v62 = *(_QWORD *)(v0 + 384);
          v45 = *(_QWORD *)(v0 + 368);
          v46 = *(_QWORD *)(v0 + 352);
          v47 = *(_QWORD *)(v0 + 360);
          v63 = *(_QWORD *)(v0 + 344);
          v48 = *(_QWORD *)(v0 + 328);
          v58 = *(_QWORD *)(v0 + 336);
          v49 = *(_QWORD *)(v0 + 320);
          v51 = *(_QWORD *)(v0 + 296);
          v50 = *(_QWORD *)(v0 + 304);
          v79 = *(_QWORD *)(v0 + 264);
          v69 = *(_QWORD *)(v0 + 248);
          v72 = *(_QWORD *)(v0 + 312);
          v61 = *(_QWORD *)(v0 + 240);
          v75 = v10;
          v53 = *(_QWORD *)(v0 + 224);
          v52 = *(_QWORD *)(v0 + 232);
          v66 = *(_QWORD *)(v0 + 176);
          v59 = *(_QWORD *)(v0 + 160);
          v60 = *(_QWORD *)(v0 + 168);
          v57 = *(_QWORD *)(v0 + 152);
          (*(void (**)(void))(*(_QWORD *)(v0 + 280) + 8))();
          v54 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
          v54(v49, v51);
          v55 = *(void (**)(uint64_t, uint64_t))(v58 + 8);
          v55(v46, v48);
          v56 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
          v56(v86, v47);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 32))(v57, v62, v53);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 32))(v59, v63, v52);
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 32))(v60, v72);
          (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)(v69 - 8) + 32))(v66, v75);
          v54((uint64_t)v90, v51);
          v55((uint64_t)v88, v48);
          v56(v79, v47);
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          v37 = *(uint64_t (**)(void))(v0 + 8);
          return v37();
        }
        (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 240) - 8) + 8))(*(_QWORD *)(v0 + 312));
      }
      (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 232) - 8) + 8))(*(_QWORD *)(v0 + 344));
    }
    (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 224) - 8) + 8))(*(_QWORD *)(v0 + 384));
  }
  v18 = (uint64_t *)(v0 + 280);
  v19 = *(_QWORD *)(v0 + 328);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v74 = *(_QWORD *)(v0 + 272);
    v20 = (uint64_t *)(v0 + 304);
    v71 = *(_QWORD *)(v0 + 296);
    v65 = v71;
    v21 = v90;
    v22 = v16;
    v68 = v19;
LABEL_17:
    v27 = *v20;
    v28 = *v18;
    v29 = *(_QWORD *)(v0 + 392);
    v30 = *(_QWORD *)(v0 + 368);
    v31 = *(_QWORD *)(v0 + 360);
    v83 = *(_QWORD *)(v0 + 352);
    v78 = *(_QWORD *)(v0 + 320);
    v81 = *(_QWORD *)(v0 + 336);
    v32 = *(_QWORD *)(v0 + 304);
    v34 = *(_QWORD *)(v0 + 280);
    v33 = *(_QWORD *)(v0 + 288);
    v35 = *(_QWORD *)(v0 + 264);
    (*(void (**)(uint64_t *))(v28 + 8))(v22);
    (*(void (**)(uint64_t *, uint64_t))(v27 + 8))(v21, v65);
    v36 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v36(v35, v31);
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v74);
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v78, v71);
    (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v83, v68);
    v36(v29, v31);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v37 = *(uint64_t (**)(void))(v0 + 8);
    return v37();
  }
  v25 = *(_QWORD *)(v0 + 296);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v74 = *(_QWORD *)(v0 + 272);
    v65 = v19;
    v21 = v88;
    v22 = v16;
LABEL_16:
    v20 = (uint64_t *)(v0 + 336);
    v68 = v19;
    v71 = v25;
    goto LABEL_17;
  }
  v26 = *(_QWORD *)(v0 + 272);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v74 = v26;
    v18 = (uint64_t *)(v0 + 304);
    v22 = v90;
    v65 = v19;
    v21 = v88;
    goto LABEL_16;
  }
  v39 = *(_QWORD *)(v0 + 360);
  _StringGuts.grow(_:)(36);
  v40._object = (void *)0x8000000208391B80;
  v40._countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v40);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v39);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v41._countAndFlagsBits = 8236;
  v41._object = (void *)0xE200000000000000;
  String.append(_:)(v41);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v19);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v42._countAndFlagsBits = 8236;
  v42._object = (void *)0xE200000000000000;
  String.append(_:)(v42);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v25);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v43._countAndFlagsBits = 8236;
  v43._object = (void *)0xE200000000000000;
  String.append(_:)(v43);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v26);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v44._countAndFlagsBits = 41;
  v44._object = (void *)0xE100000000000000;
  String.append(_:)(v44);
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C, D, E>(_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t *a8)
{
  uint64_t v8;
  _QWORD *v9;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t *v35;
  uint64_t *v36;

  v9[29] = v36;
  v9[30] = v8;
  v9[27] = a8;
  v9[28] = v35;
  v9[25] = a6;
  v9[26] = a7;
  v9[23] = a4;
  v9[24] = a5;
  v9[21] = a2;
  v9[22] = a3;
  v9[20] = a1;
  v10 = *a7;
  v11 = *a8;
  v12 = *v35;
  v13 = *v36;
  v15 = *(_QWORD *)(*(_QWORD *)a6 + 120);
  v14 = *(_QWORD *)(*(_QWORD *)a6 + 128);
  v9[31] = v14;
  v9[10] = type metadata accessor for AVAsyncProperty.Status(255, v15, v14, a4);
  v16 = *(_QWORD *)(v10 + 128);
  v9[32] = v16;
  v9[11] = type metadata accessor for AVAsyncProperty.Status(255, v15, v16, v17);
  v18 = *(_QWORD *)(v11 + 128);
  v9[33] = v18;
  v9[12] = type metadata accessor for AVAsyncProperty.Status(255, v15, v18, v19);
  v20 = *(_QWORD *)(v12 + 128);
  v9[34] = v20;
  v9[13] = type metadata accessor for AVAsyncProperty.Status(255, v15, v20, v21);
  v22 = *(_QWORD *)(v13 + 128);
  v9[35] = v22;
  v9[14] = type metadata accessor for AVAsyncProperty.Status(255, v15, v22, v23);
  v9[36] = swift_getTupleTypeMetadata();
  v9[37] = swift_task_alloc();
  v25 = type metadata accessor for AVAsyncProperty.Status(0, v15, v22, v24);
  v9[38] = v25;
  v9[39] = *(_QWORD *)(v25 - 8);
  v9[40] = swift_task_alloc();
  v27 = type metadata accessor for AVAsyncProperty.Status(0, v15, v20, v26);
  v9[41] = v27;
  v9[42] = *(_QWORD *)(v27 - 8);
  v9[43] = swift_task_alloc();
  v9[44] = swift_task_alloc();
  v29 = type metadata accessor for AVAsyncProperty.Status(0, v15, v18, v28);
  v9[45] = v29;
  v9[46] = *(_QWORD *)(v29 - 8);
  v9[47] = swift_task_alloc();
  v9[48] = swift_task_alloc();
  v31 = type metadata accessor for AVAsyncProperty.Status(0, v15, v16, v30);
  v9[49] = v31;
  v9[50] = *(_QWORD *)(v31 - 8);
  v9[51] = swift_task_alloc();
  v9[52] = swift_task_alloc();
  v33 = type metadata accessor for AVAsyncProperty.Status(0, v15, v14, v32);
  v9[53] = v33;
  v9[54] = *(_QWORD *)(v33 - 8);
  v9[55] = swift_task_alloc();
  v9[56] = swift_task_alloc();
  v9[57] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C, D, E>(_:_:_:_:_:)()
{
  _QWORD *v0;
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Class isa;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v21 = (id)v0[30];
  v2 = v0[28];
  v1 = v0[29];
  v4 = v0[26];
  v3 = v0[27];
  v5 = v0[25];
  v7 = *(_QWORD *)(v5 + 16);
  v6 = *(_QWORD *)(v5 + 24);
  v8 = *(_QWORD *)(v4 + 16);
  v9 = *(_QWORD *)(v4 + 24);
  v10 = *(_QWORD *)(v3 + 16);
  v11 = *(_QWORD *)(v3 + 24);
  v12 = *(_QWORD *)(v2 + 24);
  v13 = *(_QWORD *)(v1 + 24);
  v19 = *(_QWORD *)(v1 + 16);
  v20 = *(_QWORD *)(v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_20838E860;
  *(_QWORD *)(v14 + 32) = v7;
  *(_QWORD *)(v14 + 40) = v6;
  *(_QWORD *)(v14 + 48) = v8;
  *(_QWORD *)(v14 + 56) = v9;
  *(_QWORD *)(v14 + 64) = v10;
  *(_QWORD *)(v14 + 72) = v11;
  *(_QWORD *)(v14 + 80) = v20;
  *(_QWORD *)(v14 + 88) = v12;
  *(_QWORD *)(v14 + 96) = v19;
  *(_QWORD *)(v14 + 104) = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  v0[58] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = AVAsynchronousKeyValueLoading.load<A, B, C, D, E>(_:_:_:_:_:);
  v16 = swift_continuation_init();
  v0[15] = MEMORY[0x24BDAC760];
  v17 = v0 + 15;
  v17[1] = 0x40000000;
  v17[2] = @objc completion handler block implementation for <A><A1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ();
  v17[3] = &block_descriptor_8;
  v17[4] = v16;
  objc_msgSend(v21, sel_loadValuesAsynchronouslyForKeys_completionHandler_, isa, v17);
  return swift_continuation_await();
}

{
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  int *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  void (*v13)(uint64_t, uint64_t *, uint64_t);
  void (*v14)(uint64_t *, uint64_t *, uint64_t);
  void (*v15)(uint64_t *, uint64_t *, uint64_t);
  uint64_t *v16;
  uint64_t *v17;
  void (*v18)(uint64_t *, uint64_t *, uint64_t);
  void (*v19)(uint64_t *, uint64_t *, uint64_t);
  int EnumCaseMultiPayload;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
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
  void (*v50)(uint64_t, uint64_t);
  uint64_t (*v51)(void);
  uint64_t v53;
  Swift::String v54;
  Swift::String v55;
  Swift::String v56;
  Swift::String v57;
  Swift::String v58;
  Swift::String v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t, uint64_t);
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
  void (*v82)(uint64_t, uint64_t);
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t *v96;
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
  uint64_t *v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t *v119;
  uint64_t *v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t v123;

  v1 = *(uint64_t **)(v0 + 456);
  v99 = *(_QWORD *)(v0 + 432);
  v2 = *(uint64_t **)(v0 + 416);
  v104 = *(_QWORD *)(v0 + 424);
  v102 = *(_QWORD *)(v0 + 400);
  v3 = *(uint64_t **)(v0 + 384);
  v117 = *(_QWORD *)(v0 + 392);
  v93 = v3;
  v106 = *(_QWORD *)(v0 + 368);
  v4 = *(uint64_t **)(v0 + 352);
  v108 = *(_QWORD *)(v0 + 360);
  v96 = v4;
  v107 = *(_QWORD *)(v0 + 336);
  v115 = *(_QWORD *)(v0 + 312);
  v5 = *(_QWORD *)(v0 + 296);
  v109 = *(_QWORD *)(v0 + 328);
  v112 = *(_QWORD *)(v0 + 304);
  v6 = *(int **)(v0 + 288);
  v119 = *(uint64_t **)(v0 + 232);
  v121 = *(uint64_t **)(v0 + 320);
  v7 = *(uint64_t **)(v0 + 208);
  v89 = *(uint64_t **)(v0 + 216);
  v90 = *(uint64_t **)(v0 + 224);
  v8 = *(uint64_t **)(v0 + 200);

  AVAsynchronousKeyValueLoading.status<A>(of:)(v8, v1);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v7, v2);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v89, v3);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v90, v4);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v119, v121);
  v9 = (uint64_t *)(v5 + v6[12]);
  v10 = (uint64_t *)(v5 + v6[16]);
  v11 = (uint64_t *)(v5 + v6[20]);
  v12 = (uint64_t *)(v5 + v6[24]);
  v13 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v99 + 16);
  v13(v5, v1, v104);
  v14 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v102 + 16);
  v120 = v9;
  v14(v9, v2, v117);
  v15 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v106 + 16);
  v118 = v10;
  v16 = v10;
  v17 = v11;
  v15(v16, v93, v108);
  v18 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v107 + 16);
  v18(v17, v96, v109);
  v19 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v115 + 16);
  v116 = v12;
  v19(v12, v121, v112);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v22 = *(_QWORD *)(v0 + 304);
    v23 = *(_QWORD *)(v0 + 312);
    v13(*(_QWORD *)(v0 + 440), *(uint64_t **)(v0 + 296), *(_QWORD *)(v0 + 424));
    (*(void (**)(uint64_t *, uint64_t))(v23 + 8))(v12, v22);
    v24 = (uint64_t *)(v0 + 336);
    v87 = *(_QWORD *)(v0 + 328);
    v25 = v17;
    v122 = *(_QWORD *)(v0 + 304);
    v26 = (uint64_t *)(v0 + 368);
    v83 = *(_QWORD *)(v0 + 360);
    v85 = v83;
    v110 = v118;
    v113 = *(_QWORD *)(v0 + 392);
    v81 = v113;
    v27 = (uint64_t *)(v0 + 400);
LABEL_22:
    v40 = *v27;
    v41 = *v26;
    v42 = *v24;
    v43 = *(_QWORD *)(v0 + 456);
    v44 = *(_QWORD *)(v0 + 432);
    v45 = *(_QWORD *)(v0 + 424);
    v103 = *(_QWORD *)(v0 + 416);
    v97 = *(_QWORD *)(v0 + 384);
    v100 = *(_QWORD *)(v0 + 400);
    v91 = *(_QWORD *)(v0 + 352);
    v94 = *(_QWORD *)(v0 + 368);
    v46 = *(_QWORD *)(v0 + 336);
    v47 = *(_QWORD *)(v0 + 312);
    v48 = *(_QWORD *)(v0 + 320);
    v49 = *(_QWORD *)(v0 + 296);
    (*(void (**)(uint64_t *))(v42 + 8))(v25);
    (*(void (**)(uint64_t *, uint64_t))(v41 + 8))(v110, v83);
    (*(void (**)(uint64_t *, uint64_t))(v40 + 8))(v120, v81);
    v50 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
    v50(v49, v45);
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v48, v122);
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v91, v87);
    (*(void (**)(uint64_t, uint64_t))(v94 + 8))(v97, v85);
    (*(void (**)(uint64_t, uint64_t))(v100 + 8))(v103, v113);
    v50(v43, v45);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v51 = *(uint64_t (**)(void))(v0 + 8);
    return v51();
  }
  if (!EnumCaseMultiPayload)
  {
    v13(*(_QWORD *)(v0 + 448), *(uint64_t **)(v0 + 296), *(_QWORD *)(v0 + 424));
    if (swift_getEnumCaseMultiPayload())
    {
      v21 = *(_QWORD *)(v0 + 248) - 8;
    }
    else
    {
      v14(*(uint64_t **)(v0 + 408), v120, *(_QWORD *)(v0 + 392));
      if (swift_getEnumCaseMultiPayload())
      {
        v28 = *(_QWORD *)(v0 + 248);
        (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 256) - 8) + 8))(*(_QWORD *)(v0 + 408));
        v21 = v28 - 8;
      }
      else
      {
        v15(*(uint64_t **)(v0 + 376), v118, *(_QWORD *)(v0 + 360));
        if (swift_getEnumCaseMultiPayload())
        {
          v29 = *(_QWORD *)(v0 + 408);
          v30 = *(_QWORD *)(v0 + 256);
          v31 = *(_QWORD *)(v0 + 248);
          (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 264) - 8) + 8))(*(_QWORD *)(v0 + 376));
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 8))(v29, v30);
          v21 = v31 - 8;
        }
        else
        {
          v32 = *(_QWORD *)(v0 + 248);
          v18(*(uint64_t **)(v0 + 344), v17, *(_QWORD *)(v0 + 328));
          v21 = v32 - 8;
          if (!swift_getEnumCaseMultiPayload())
          {
            v114 = *(_QWORD *)(v0 + 456);
            v88 = *(_QWORD *)(v0 + 448);
            v77 = *(_QWORD *)(v0 + 432);
            v60 = *(_QWORD *)(v0 + 416);
            v79 = *(_QWORD *)(v0 + 424);
            v123 = *(_QWORD *)(v0 + 408);
            v73 = *(_QWORD *)(v0 + 400);
            v61 = *(_QWORD *)(v0 + 384);
            v75 = *(_QWORD *)(v0 + 392);
            v95 = *(_QWORD *)(v0 + 376);
            v62 = *(_QWORD *)(v0 + 360);
            v70 = *(_QWORD *)(v0 + 368);
            v63 = *(_QWORD *)(v0 + 352);
            v101 = *(_QWORD *)(v0 + 344);
            v111 = v17;
            v64 = *(_QWORD *)(v0 + 328);
            v65 = *(_QWORD *)(v0 + 336);
            v86 = v64;
            v105 = *(_QWORD *)(v0 + 296);
            v98 = *(_QWORD *)(v0 + 280);
            v84 = *(_QWORD *)(v0 + 272);
            v66 = *(_QWORD *)(v0 + 256);
            v78 = *(_QWORD *)(v0 + 264);
            v92 = *(_QWORD *)(v0 + 192);
            v80 = *(_QWORD *)(v0 + 184);
            v76 = *(_QWORD *)(v0 + 176);
            v74 = *(_QWORD *)(v0 + 168);
            v71 = *(_QWORD *)(v0 + 160);
            v72 = *(_QWORD *)(v0 + 248);
            (*(void (**)(void))(*(_QWORD *)(v0 + 312) + 8))();
            v82 = *(void (**)(uint64_t, uint64_t))(v65 + 8);
            v82(v63, v64);
            v67 = *(void (**)(uint64_t, uint64_t))(v70 + 8);
            v67(v61, v62);
            v68 = *(void (**)(uint64_t, uint64_t))(v73 + 8);
            v68(v60, v75);
            v69 = *(void (**)(uint64_t, uint64_t))(v77 + 8);
            v69(v114, v79);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v21 + 32))(v71, v88, v72);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 32))(v74, v123, v66);
            (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v78 - 8) + 32))(v76, v95);
            (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v84 - 8) + 32))(v80, v101);
            (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)(v98 - 8) + 32))(v92, v116);
            v82((uint64_t)v111, v86);
            v67((uint64_t)v118, v62);
            v68((uint64_t)v120, v75);
            v69(v105, v79);
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            v51 = *(uint64_t (**)(void))(v0 + 8);
            return v51();
          }
          v33 = *(_QWORD *)(v0 + 408);
          v34 = *(_QWORD *)(v0 + 376);
          v35 = *(_QWORD *)(v0 + 264);
          v36 = *(_QWORD *)(v0 + 256);
          (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 272) - 8) + 8))(*(_QWORD *)(v0 + 344));
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 8))(v34, v35);
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 8))(v33, v36);
        }
      }
    }
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)v21 + 8))(*(_QWORD *)(v0 + 448), *(_QWORD *)(v0 + 248));
  }
  v24 = (uint64_t *)(v0 + 312);
  v37 = *(_QWORD *)(v0 + 392);
  v113 = v37;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v122 = *(_QWORD *)(v0 + 304);
    v87 = *(_QWORD *)(v0 + 328);
    v27 = (uint64_t *)(v0 + 368);
    v83 = v87;
    v85 = *(_QWORD *)(v0 + 360);
    v81 = v85;
    v25 = v116;
    v120 = v118;
    v110 = v17;
    v26 = (uint64_t *)(v0 + 336);
    goto LABEL_22;
  }
  v38 = *(_QWORD *)(v0 + 360);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v122 = *(_QWORD *)(v0 + 304);
    v87 = *(_QWORD *)(v0 + 328);
    v81 = v37;
    v83 = v87;
    v110 = v17;
    v25 = v116;
    v27 = (uint64_t *)(v0 + 400);
    v26 = (uint64_t *)(v0 + 336);
    v85 = v38;
    goto LABEL_22;
  }
  v39 = *(_QWORD *)(v0 + 328);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v122 = *(_QWORD *)(v0 + 304);
    v26 = (uint64_t *)(v0 + 368);
    v83 = v38;
    v110 = v118;
    v81 = v37;
    v25 = v116;
LABEL_21:
    v27 = (uint64_t *)(v0 + 400);
    v85 = v38;
    v87 = v39;
    goto LABEL_22;
  }
  v122 = *(_QWORD *)(v0 + 304);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v24 = (uint64_t *)(v0 + 336);
    v25 = v17;
    v26 = (uint64_t *)(v0 + 368);
    v83 = v38;
    v110 = v118;
    v81 = v37;
    goto LABEL_21;
  }
  v53 = *(_QWORD *)(v0 + 424);
  _StringGuts.grow(_:)(40);
  v54._object = (void *)0x8000000208391B80;
  v54._countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v54);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v53);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v55._countAndFlagsBits = 8236;
  v55._object = (void *)0xE200000000000000;
  String.append(_:)(v55);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v37);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v56._countAndFlagsBits = 8236;
  v56._object = (void *)0xE200000000000000;
  String.append(_:)(v56);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v38);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v57._countAndFlagsBits = 8236;
  v57._object = (void *)0xE200000000000000;
  String.append(_:)(v57);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v39);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v58._countAndFlagsBits = 8236;
  v58._object = (void *)0xE200000000000000;
  String.append(_:)(v58);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v122);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v59._countAndFlagsBits = 41;
  v59._object = (void *)0xE100000000000000;
  String.append(_:)(v59);
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F>(_:_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t *a8)
{
  uint64_t v8;
  _QWORD *v9;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t *v43;

  v9[32] = v43;
  v9[33] = v8;
  v9[30] = v41;
  v9[31] = v42;
  v9[28] = a8;
  v9[29] = v40;
  v9[26] = a6;
  v9[27] = a7;
  v9[24] = a4;
  v9[25] = a5;
  v9[22] = a2;
  v9[23] = a3;
  v9[21] = a1;
  v10 = *a8;
  v11 = *v40;
  v12 = *v41;
  v13 = *v42;
  v14 = *v43;
  v16 = *(_QWORD *)(*(_QWORD *)a7 + 120);
  v15 = *(_QWORD *)(*(_QWORD *)a7 + 128);
  v9[34] = v15;
  v9[10] = type metadata accessor for AVAsyncProperty.Status(255, v16, v15, a4);
  v17 = *(_QWORD *)(v10 + 128);
  v9[35] = v17;
  v9[11] = type metadata accessor for AVAsyncProperty.Status(255, v16, v17, v18);
  v19 = *(_QWORD *)(v11 + 128);
  v9[36] = v19;
  v9[12] = type metadata accessor for AVAsyncProperty.Status(255, v16, v19, v20);
  v21 = *(_QWORD *)(v12 + 128);
  v9[37] = v21;
  v9[13] = type metadata accessor for AVAsyncProperty.Status(255, v16, v21, v22);
  v23 = *(_QWORD *)(v13 + 128);
  v9[38] = v23;
  v9[14] = type metadata accessor for AVAsyncProperty.Status(255, v16, v23, v24);
  v25 = *(_QWORD *)(v14 + 128);
  v9[39] = v25;
  v9[15] = type metadata accessor for AVAsyncProperty.Status(255, v16, v25, v26);
  v9[40] = swift_getTupleTypeMetadata();
  v9[41] = swift_task_alloc();
  v28 = type metadata accessor for AVAsyncProperty.Status(0, v16, v25, v27);
  v9[42] = v28;
  v9[43] = *(_QWORD *)(v28 - 8);
  v9[44] = swift_task_alloc();
  v30 = type metadata accessor for AVAsyncProperty.Status(0, v16, v23, v29);
  v9[45] = v30;
  v9[46] = *(_QWORD *)(v30 - 8);
  v9[47] = swift_task_alloc();
  v9[48] = swift_task_alloc();
  v32 = type metadata accessor for AVAsyncProperty.Status(0, v16, v21, v31);
  v9[49] = v32;
  v9[50] = *(_QWORD *)(v32 - 8);
  v9[51] = swift_task_alloc();
  v9[52] = swift_task_alloc();
  v34 = type metadata accessor for AVAsyncProperty.Status(0, v16, v19, v33);
  v9[53] = v34;
  v9[54] = *(_QWORD *)(v34 - 8);
  v9[55] = swift_task_alloc();
  v9[56] = swift_task_alloc();
  v36 = type metadata accessor for AVAsyncProperty.Status(0, v16, v17, v35);
  v9[57] = v36;
  v9[58] = *(_QWORD *)(v36 - 8);
  v9[59] = swift_task_alloc();
  v9[60] = swift_task_alloc();
  v38 = type metadata accessor for AVAsyncProperty.Status(0, v16, v15, v37);
  v9[61] = v38;
  v9[62] = *(_QWORD *)(v38 - 8);
  v9[63] = swift_task_alloc();
  v9[64] = swift_task_alloc();
  v9[65] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F>(_:_:_:_:_:_:)()
{
  _QWORD *v0;
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  Class isa;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v24 = (id)v0[33];
  v2 = v0[31];
  v1 = v0[32];
  v4 = v0[29];
  v3 = v0[30];
  v6 = v0[27];
  v5 = v0[28];
  v7 = *(_QWORD *)(v6 + 16);
  v8 = *(_QWORD *)(v6 + 24);
  v9 = *(_QWORD *)(v5 + 16);
  v10 = *(_QWORD *)(v5 + 24);
  v11 = *(_QWORD *)(v4 + 24);
  v12 = *(_QWORD *)(v3 + 24);
  v22 = *(_QWORD *)(v3 + 16);
  v23 = *(_QWORD *)(v4 + 16);
  v13 = *(_QWORD *)(v2 + 24);
  v14 = *(_QWORD *)(v1 + 24);
  v20 = *(_QWORD *)(v1 + 16);
  v21 = *(_QWORD *)(v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_20838E870;
  *(_QWORD *)(v15 + 32) = v7;
  *(_QWORD *)(v15 + 40) = v8;
  *(_QWORD *)(v15 + 48) = v9;
  *(_QWORD *)(v15 + 56) = v10;
  *(_QWORD *)(v15 + 64) = v23;
  *(_QWORD *)(v15 + 72) = v11;
  *(_QWORD *)(v15 + 80) = v22;
  *(_QWORD *)(v15 + 88) = v12;
  *(_QWORD *)(v15 + 96) = v21;
  *(_QWORD *)(v15 + 104) = v13;
  *(_QWORD *)(v15 + 112) = v20;
  *(_QWORD *)(v15 + 120) = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  v0[66] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F>(_:_:_:_:_:_:);
  v17 = swift_continuation_init();
  v0[16] = MEMORY[0x24BDAC760];
  v18 = v0 + 16;
  v18[1] = 0x40000000;
  v18[2] = @objc completion handler block implementation for <A><A1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ();
  v18[3] = &block_descriptor_10;
  v18[4] = v17;
  objc_msgSend(v24, sel_loadValuesAsynchronouslyForKeys_completionHandler_, isa, v18);
  return swift_continuation_await();
}

{
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  int *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  void (*v14)(uint64_t, uint64_t *, uint64_t);
  void (*v15)(uint64_t *, uint64_t *, uint64_t);
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t *, uint64_t *, uint64_t);
  void (*v19)(uint64_t *, uint64_t *, uint64_t);
  int EnumCaseMultiPayload;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
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
  void (*v40)(uint64_t, uint64_t);
  uint64_t (*v41)(void);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  Swift::String v46;
  Swift::String v47;
  Swift::String v48;
  Swift::String v49;
  Swift::String v50;
  Swift::String v51;
  Swift::String v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t, uint64_t);
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
  void (*v73)(uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(uint64_t, uint64_t);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(uint64_t, uint64_t);
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
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
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void (*v110)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t *v121;
  uint64_t *v122;
  uint64_t *v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t *v127;
  uint64_t *v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t *v133;

  v1 = *(uint64_t **)(v0 + 520);
  v2 = *(uint64_t **)(v0 + 480);
  v85 = v1;
  v93 = *(_QWORD *)(v0 + 496);
  v96 = *(_QWORD *)(v0 + 464);
  v3 = *(uint64_t **)(v0 + 448);
  v105 = *(_QWORD *)(v0 + 456);
  v90 = v3;
  v99 = *(_QWORD *)(v0 + 488);
  v102 = *(_QWORD *)(v0 + 432);
  v109 = *(_QWORD *)(v0 + 424);
  v124 = *(uint64_t **)(v0 + 416);
  v107 = *(_QWORD *)(v0 + 400);
  v112 = *(_QWORD *)(v0 + 392);
  v127 = *(uint64_t **)(v0 + 384);
  v111 = *(_QWORD *)(v0 + 368);
  v113 = *(_QWORD *)(v0 + 360);
  v114 = *(_QWORD *)(v0 + 344);
  v4 = *(_QWORD *)(v0 + 328);
  v5 = *(int **)(v0 + 320);
  v129 = *(uint64_t **)(v0 + 352);
  v132 = *(uint64_t **)(v0 + 256);
  v122 = *(uint64_t **)(v0 + 248);
  v6 = *(uint64_t **)(v0 + 232);
  v117 = *(_QWORD *)(v0 + 336);
  v120 = *(uint64_t **)(v0 + 240);
  v7 = *(uint64_t **)(v0 + 216);
  v8 = *(uint64_t **)(v0 + 224);

  AVAsynchronousKeyValueLoading.status<A>(of:)(v7, v1);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v8, v2);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v6, v3);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v120, v124);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v122, v127);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v132, v129);
  v9 = (uint64_t *)(v4 + v5[12]);
  v10 = (uint64_t *)(v4 + v5[16]);
  v11 = (uint64_t *)(v4 + v5[20]);
  v12 = (uint64_t *)(v4 + v5[24]);
  v13 = (uint64_t *)(v4 + v5[28]);
  v14 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v93 + 16);
  v14(v4, v85, v99);
  v15 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v96 + 16);
  v123 = v9;
  v15(v9, v2, v105);
  v16 = v10;
  v17 = v109;
  v110 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v102 + 16);
  v110(v10, v90, v17);
  v18 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v107 + 16);
  v133 = v11;
  v18(v11, v124, v112);
  v19 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v111 + 16);
  v121 = v12;
  v19(v12, v127, v113);
  v128 = v13;
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v114 + 16))(v13, v129, v117);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v25 = *(_QWORD *)(v0 + 336);
    v26 = *(_QWORD *)(v0 + 344);
    v14(*(_QWORD *)(v0 + 504), *(uint64_t **)(v0 + 328), *(_QWORD *)(v0 + 488));
    (*(void (**)(uint64_t *, uint64_t))(v26 + 8))(v13, v25);
    v21 = (uint64_t *)(v0 + 368);
    v80 = *(_QWORD *)(v0 + 360);
    v24 = v12;
    v27 = (uint64_t *)(v0 + 400);
    v130 = *(_QWORD *)(v0 + 392);
    v78 = v130;
    v121 = v133;
    v125 = *(_QWORD *)(v0 + 336);
    v28 = (uint64_t *)(v0 + 432);
    v115 = *(_QWORD *)(v0 + 424);
    v75 = v115;
    v133 = v16;
    v118 = *(_QWORD *)(v0 + 456);
    v74 = v118;
    v23 = (uint64_t *)(v0 + 464);
LABEL_19:
    v30 = *v23;
    v31 = *v28;
    v32 = *v27;
    v33 = *v21;
    v103 = *(_QWORD *)(v0 + 520);
    v34 = *(_QWORD *)(v0 + 496);
    v35 = *(_QWORD *)(v0 + 488);
    v100 = *(_QWORD *)(v0 + 480);
    v94 = *(_QWORD *)(v0 + 448);
    v97 = *(_QWORD *)(v0 + 464);
    v88 = *(_QWORD *)(v0 + 416);
    v91 = *(_QWORD *)(v0 + 432);
    v83 = *(_QWORD *)(v0 + 384);
    v86 = *(_QWORD *)(v0 + 400);
    v36 = *(_QWORD *)(v0 + 368);
    v38 = *(_QWORD *)(v0 + 344);
    v37 = *(_QWORD *)(v0 + 352);
    v39 = *(_QWORD *)(v0 + 328);
    (*(void (**)(uint64_t *))(v33 + 8))(v24);
    (*(void (**)(uint64_t *, uint64_t))(v32 + 8))(v121, v78);
    (*(void (**)(uint64_t *, uint64_t))(v31 + 8))(v133, v75);
    (*(void (**)(uint64_t *, uint64_t))(v30 + 8))(v123, v74);
    v40 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
    v40(v39, v35);
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v125);
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v83, v80);
    (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v88, v130);
    (*(void (**)(uint64_t, uint64_t))(v91 + 8))(v94, v115);
    (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v100, v118);
    v40(v103, v35);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v41 = *(uint64_t (**)(void))(v0 + 8);
    return v41();
  }
  if (!EnumCaseMultiPayload)
  {
    v14(*(_QWORD *)(v0 + 512), *(uint64_t **)(v0 + 328), *(_QWORD *)(v0 + 488));
    if (!swift_getEnumCaseMultiPayload())
    {
      v15(*(uint64_t **)(v0 + 472), v123, *(_QWORD *)(v0 + 456));
      if (!swift_getEnumCaseMultiPayload())
      {
        v110(*(uint64_t **)(v0 + 440), v16, *(_QWORD *)(v0 + 424));
        if (!swift_getEnumCaseMultiPayload())
        {
          v18(*(uint64_t **)(v0 + 408), v133, *(_QWORD *)(v0 + 392));
          if (!swift_getEnumCaseMultiPayload())
          {
            v19(*(uint64_t **)(v0 + 376), v12, *(_QWORD *)(v0 + 360));
            if (!swift_getEnumCaseMultiPayload())
            {
              v126 = *(_QWORD *)(v0 + 520);
              v79 = *(_QWORD *)(v0 + 512);
              v68 = *(_QWORD *)(v0 + 496);
              v69 = *(_QWORD *)(v0 + 488);
              v119 = *(_QWORD *)(v0 + 480);
              v89 = *(_QWORD *)(v0 + 472);
              v66 = *(_QWORD *)(v0 + 464);
              v116 = *(_QWORD *)(v0 + 456);
              v131 = *(_QWORD *)(v0 + 448);
              v95 = *(_QWORD *)(v0 + 440);
              v53 = *(_QWORD *)(v0 + 424);
              v72 = *(_QWORD *)(v0 + 432);
              v54 = *(_QWORD *)(v0 + 416);
              v98 = *(_QWORD *)(v0 + 408);
              v55 = *(_QWORD *)(v0 + 392);
              v76 = *(_QWORD *)(v0 + 400);
              v56 = *(_QWORD *)(v0 + 384);
              v104 = *(_QWORD *)(v0 + 376);
              v57 = *(_QWORD *)(v0 + 360);
              v81 = *(_QWORD *)(v0 + 368);
              v84 = v57;
              v106 = v16;
              v108 = *(_QWORD *)(v0 + 328);
              v101 = *(_QWORD *)(v0 + 312);
              v87 = *(_QWORD *)(v0 + 304);
              v58 = *(_QWORD *)(v0 + 288);
              v59 = *(_QWORD *)(v0 + 272);
              v60 = *(_QWORD *)(v0 + 280);
              v92 = *(_QWORD *)(v0 + 208);
              v70 = *(_QWORD *)(v0 + 296);
              v71 = *(_QWORD *)(v0 + 200);
              v67 = *(_QWORD *)(v0 + 192);
              v64 = *(_QWORD *)(v0 + 176);
              v65 = *(_QWORD *)(v0 + 184);
              v63 = *(_QWORD *)(v0 + 168);
              (*(void (**)(void))(*(_QWORD *)(v0 + 344) + 8))();
              v82 = *(void (**)(uint64_t, uint64_t))(v81 + 8);
              v82(v56, v57);
              v77 = *(void (**)(uint64_t, uint64_t))(v76 + 8);
              v77(v54, v55);
              v73 = *(void (**)(uint64_t, uint64_t))(v72 + 8);
              v73(v131, v53);
              v61 = *(void (**)(uint64_t, uint64_t))(v66 + 8);
              v61(v119, v116);
              v62 = *(void (**)(uint64_t, uint64_t))(v68 + 8);
              v62(v126, v69);
              (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 32))(v63, v79, v59);
              (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 32))(v64, v89, v60);
              (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 32))(v65, v95, v58);
              (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v70 - 8) + 32))(v67, v98);
              (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v87 - 8) + 32))(v71, v104);
              (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)(v101 - 8) + 32))(v92, v128);
              v82((uint64_t)v121, v84);
              v77((uint64_t)v133, v55);
              v73((uint64_t)v106, v53);
              v61((uint64_t)v123, v116);
              v62(v108, v69);
              swift_task_dealloc();
              swift_task_dealloc();
              swift_task_dealloc();
              swift_task_dealloc();
              swift_task_dealloc();
              swift_task_dealloc();
              swift_task_dealloc();
              swift_task_dealloc();
              swift_task_dealloc();
              swift_task_dealloc();
              swift_task_dealloc();
              swift_task_dealloc();
              swift_task_dealloc();
              v41 = *(uint64_t (**)(void))(v0 + 8);
              return v41();
            }
            (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 304) - 8) + 8))(*(_QWORD *)(v0 + 376));
          }
          (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 296) - 8) + 8))(*(_QWORD *)(v0 + 408));
        }
        (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 288) - 8) + 8))(*(_QWORD *)(v0 + 440));
      }
      (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 280) - 8) + 8))(*(_QWORD *)(v0 + 472));
    }
    (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 272) - 8) + 8))(*(_QWORD *)(v0 + 512));
  }
  v21 = (uint64_t *)(v0 + 344);
  v22 = *(_QWORD *)(v0 + 456);
  v118 = v22;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v125 = *(_QWORD *)(v0 + 336);
    v80 = *(_QWORD *)(v0 + 360);
    v78 = v80;
    v130 = *(_QWORD *)(v0 + 392);
    v75 = v130;
    v23 = (uint64_t *)(v0 + 432);
    v115 = *(_QWORD *)(v0 + 424);
    v74 = v115;
    v123 = v16;
    v24 = v13;
LABEL_18:
    v27 = (uint64_t *)(v0 + 368);
    v28 = (uint64_t *)(v0 + 400);
    goto LABEL_19;
  }
  v29 = *(_QWORD *)(v0 + 424);
  v115 = v29;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v125 = *(_QWORD *)(v0 + 336);
    v80 = *(_QWORD *)(v0 + 360);
    v78 = v80;
    v130 = *(_QWORD *)(v0 + 392);
    v74 = v22;
    v75 = v130;
    v24 = v13;
    v23 = (uint64_t *)(v0 + 464);
    goto LABEL_18;
  }
  v130 = *(_QWORD *)(v0 + 392);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v125 = *(_QWORD *)(v0 + 336);
    v80 = *(_QWORD *)(v0 + 360);
    v78 = v80;
    v28 = (uint64_t *)(v0 + 432);
    v75 = v29;
    v133 = v16;
    v74 = v22;
    v24 = v13;
    v23 = (uint64_t *)(v0 + 464);
    v27 = (uint64_t *)(v0 + 368);
    goto LABEL_19;
  }
  v43 = *(_QWORD *)(v0 + 360);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v125 = *(_QWORD *)(v0 + 336);
    v27 = (uint64_t *)(v0 + 400);
    v78 = v130;
    v121 = v133;
    v28 = (uint64_t *)(v0 + 432);
    v75 = v29;
    v133 = v16;
    v74 = v22;
    v24 = v13;
LABEL_27:
    v23 = (uint64_t *)(v0 + 464);
    v80 = v43;
    goto LABEL_19;
  }
  v125 = *(_QWORD *)(v0 + 336);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v21 = (uint64_t *)(v0 + 368);
    v24 = v12;
    v27 = (uint64_t *)(v0 + 400);
    v78 = v130;
    v121 = v133;
    v28 = (uint64_t *)(v0 + 432);
    v75 = v29;
    v133 = v16;
    v74 = v22;
    goto LABEL_27;
  }
  v44 = v43;
  v45 = *(_QWORD *)(v0 + 488);
  _StringGuts.grow(_:)(44);
  v46._object = (void *)0x8000000208391B80;
  v46._countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v46);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v45);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v47._countAndFlagsBits = 8236;
  v47._object = (void *)0xE200000000000000;
  String.append(_:)(v47);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v22);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v48._countAndFlagsBits = 8236;
  v48._object = (void *)0xE200000000000000;
  String.append(_:)(v48);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v29);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v49._countAndFlagsBits = 8236;
  v49._object = (void *)0xE200000000000000;
  String.append(_:)(v49);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v130);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v50._countAndFlagsBits = 8236;
  v50._object = (void *)0xE200000000000000;
  String.append(_:)(v50);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v44);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v51._countAndFlagsBits = 8236;
  v51._object = (void *)0xE200000000000000;
  String.append(_:)(v51);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v125);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v52._countAndFlagsBits = 41;
  v52._object = (void *)0xE100000000000000;
  String.append(_:)(v52);
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F, G>(_:_:_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
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
  uint64_t *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;

  v9[35] = v50;
  v9[36] = v8;
  v9[33] = v48;
  v9[34] = v49;
  v9[31] = v46;
  v9[32] = v47;
  v9[29] = a8;
  v9[30] = v45;
  v9[27] = a6;
  v9[28] = a7;
  v9[25] = a4;
  v9[26] = a5;
  v9[23] = a2;
  v9[24] = a3;
  v9[22] = a1;
  v10 = *v45;
  v11 = *v46;
  v12 = *v47;
  v13 = *v48;
  v14 = *v49;
  v15 = *v50;
  v17 = *(_QWORD *)(*(_QWORD *)a8 + 120);
  v16 = *(_QWORD *)(*(_QWORD *)a8 + 128);
  v9[37] = v16;
  v9[10] = type metadata accessor for AVAsyncProperty.Status(255, v17, v16, a4);
  v18 = *(_QWORD *)(v10 + 128);
  v9[38] = v18;
  v9[11] = type metadata accessor for AVAsyncProperty.Status(255, v17, v18, v19);
  v20 = *(_QWORD *)(v11 + 128);
  v9[39] = v20;
  v9[12] = type metadata accessor for AVAsyncProperty.Status(255, v17, v20, v21);
  v22 = *(_QWORD *)(v12 + 128);
  v9[40] = v22;
  v9[13] = type metadata accessor for AVAsyncProperty.Status(255, v17, v22, v23);
  v24 = *(_QWORD *)(v13 + 128);
  v9[41] = v24;
  v9[14] = type metadata accessor for AVAsyncProperty.Status(255, v17, v24, v25);
  v26 = *(_QWORD *)(v14 + 128);
  v9[42] = v26;
  v9[15] = type metadata accessor for AVAsyncProperty.Status(255, v17, v26, v27);
  v28 = *(_QWORD *)(v15 + 128);
  v9[43] = v28;
  v9[16] = type metadata accessor for AVAsyncProperty.Status(255, v17, v28, v29);
  v9[44] = swift_getTupleTypeMetadata();
  v9[45] = swift_task_alloc();
  v31 = type metadata accessor for AVAsyncProperty.Status(0, v17, v28, v30);
  v9[46] = v31;
  v9[47] = *(_QWORD *)(v31 - 8);
  v9[48] = swift_task_alloc();
  v33 = type metadata accessor for AVAsyncProperty.Status(0, v17, v26, v32);
  v9[49] = v33;
  v9[50] = *(_QWORD *)(v33 - 8);
  v9[51] = swift_task_alloc();
  v9[52] = swift_task_alloc();
  v35 = type metadata accessor for AVAsyncProperty.Status(0, v17, v24, v34);
  v9[53] = v35;
  v9[54] = *(_QWORD *)(v35 - 8);
  v9[55] = swift_task_alloc();
  v9[56] = swift_task_alloc();
  v37 = type metadata accessor for AVAsyncProperty.Status(0, v17, v22, v36);
  v9[57] = v37;
  v9[58] = *(_QWORD *)(v37 - 8);
  v9[59] = swift_task_alloc();
  v9[60] = swift_task_alloc();
  v39 = type metadata accessor for AVAsyncProperty.Status(0, v17, v20, v38);
  v9[61] = v39;
  v9[62] = *(_QWORD *)(v39 - 8);
  v9[63] = swift_task_alloc();
  v9[64] = swift_task_alloc();
  v41 = type metadata accessor for AVAsyncProperty.Status(0, v17, v18, v40);
  v9[65] = v41;
  v9[66] = *(_QWORD *)(v41 - 8);
  v9[67] = swift_task_alloc();
  v9[68] = swift_task_alloc();
  v43 = type metadata accessor for AVAsyncProperty.Status(0, v17, v16, v42);
  v9[69] = v43;
  v9[70] = *(_QWORD *)(v43 - 8);
  v9[71] = swift_task_alloc();
  v9[72] = swift_task_alloc();
  v9[73] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F, G>(_:_:_:_:_:_:_:)()
{
  _QWORD *v0;
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  Class isa;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v27 = (id)v0[36];
  v2 = v0[34];
  v1 = v0[35];
  v4 = v0[32];
  v3 = v0[33];
  v6 = v0[30];
  v5 = v0[31];
  v7 = v0[29];
  v8 = *(_QWORD *)(v7 + 16);
  v9 = *(_QWORD *)(v7 + 24);
  v10 = *(_QWORD *)(v6 + 24);
  v11 = *(_QWORD *)(v5 + 24);
  v25 = *(_QWORD *)(v5 + 16);
  v26 = *(_QWORD *)(v6 + 16);
  v12 = *(_QWORD *)(v4 + 24);
  v13 = *(_QWORD *)(v3 + 24);
  v23 = *(_QWORD *)(v3 + 16);
  v24 = *(_QWORD *)(v4 + 16);
  v14 = *(_QWORD *)(v2 + 24);
  v15 = *(_QWORD *)(v1 + 24);
  v21 = *(_QWORD *)(v1 + 16);
  v22 = *(_QWORD *)(v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_20838E880;
  *(_QWORD *)(v16 + 32) = v8;
  *(_QWORD *)(v16 + 40) = v9;
  *(_QWORD *)(v16 + 48) = v26;
  *(_QWORD *)(v16 + 56) = v10;
  *(_QWORD *)(v16 + 64) = v25;
  *(_QWORD *)(v16 + 72) = v11;
  *(_QWORD *)(v16 + 80) = v24;
  *(_QWORD *)(v16 + 88) = v12;
  *(_QWORD *)(v16 + 96) = v23;
  *(_QWORD *)(v16 + 104) = v13;
  *(_QWORD *)(v16 + 112) = v22;
  *(_QWORD *)(v16 + 120) = v14;
  *(_QWORD *)(v16 + 128) = v21;
  *(_QWORD *)(v16 + 136) = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  v0[74] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F, G>(_:_:_:_:_:_:_:);
  v18 = swift_continuation_init();
  v0[17] = MEMORY[0x24BDAC760];
  v19 = v0 + 17;
  v19[1] = 0x40000000;
  v19[2] = @objc completion handler block implementation for <A><A1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ();
  v19[3] = &block_descriptor_12;
  v19[4] = v18;
  objc_msgSend(v27, sel_loadValuesAsynchronouslyForKeys_completionHandler_, isa, v19);
  return swift_continuation_await();
}

{
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  int *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  void (*v15)(uint64_t *, uint64_t *, uint64_t);
  void (*v16)(uint64_t *, uint64_t *, uint64_t);
  void (*v17)(uint64_t *, uint64_t *, uint64_t);
  void (*v18)(uint64_t *, uint64_t *, uint64_t);
  uint64_t *v19;
  int EnumCaseMultiPayload;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
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
  void (*v43)(uint64_t, uint64_t);
  uint64_t (*v44)(void);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  Swift::String v50;
  Swift::String v51;
  Swift::String v52;
  Swift::String v53;
  Swift::String v54;
  Swift::String v55;
  Swift::String v56;
  Swift::String v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t, uint64_t);
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
  void (*v87)(uint64_t, uint64_t);
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void (*v92)(uint64_t, uint64_t);
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void (*v99)(uint64_t, uint64_t);
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void (*v112)(uint64_t, uint64_t *, uint64_t);
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void (*v116)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t *v123;
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
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t *v142;
  uint64_t *v143;
  uint64_t *v144;
  uint64_t *v145;
  uint64_t *v146;
  uint64_t *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t *v153;
  uint64_t v154;
  uint64_t *v155;
  uint64_t *v156;
  uint64_t *v157;
  uint64_t *v158;

  v1 = *(uint64_t **)(v0 + 584);
  v119 = *(_QWORD *)(v0 + 552);
  v2 = *(uint64_t **)(v0 + 544);
  v103 = v1;
  v111 = *(_QWORD *)(v0 + 560);
  v115 = *(_QWORD *)(v0 + 528);
  v141 = *(_QWORD *)(v0 + 520);
  v3 = *(uint64_t **)(v0 + 512);
  v108 = v3;
  v122 = *(_QWORD *)(v0 + 496);
  v126 = *(_QWORD *)(v0 + 488);
  v147 = *(uint64_t **)(v0 + 480);
  v124 = *(_QWORD *)(v0 + 464);
  v128 = *(_QWORD *)(v0 + 456);
  v150 = *(uint64_t **)(v0 + 448);
  v127 = *(_QWORD *)(v0 + 432);
  v130 = *(_QWORD *)(v0 + 424);
  v100 = *(uint64_t **)(v0 + 416);
  v129 = *(_QWORD *)(v0 + 400);
  v132 = *(_QWORD *)(v0 + 392);
  v135 = *(_QWORD *)(v0 + 376);
  v4 = *(_QWORD *)(v0 + 360);
  v138 = *(_QWORD *)(v0 + 368);
  v5 = *(int **)(v0 + 352);
  v157 = *(uint64_t **)(v0 + 280);
  v153 = *(uint64_t **)(v0 + 384);
  v155 = *(uint64_t **)(v0 + 272);
  v6 = *(uint64_t **)(v0 + 248);
  v143 = *(uint64_t **)(v0 + 256);
  v145 = *(uint64_t **)(v0 + 264);
  v7 = *(uint64_t **)(v0 + 232);
  v8 = *(uint64_t **)(v0 + 240);

  AVAsynchronousKeyValueLoading.status<A>(of:)(v7, v1);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v8, v2);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v6, v3);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v143, v147);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v145, v150);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v155, v100);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v157, v153);
  v9 = (uint64_t *)(v4 + v5[12]);
  v10 = (uint64_t *)(v4 + v5[16]);
  v11 = (uint64_t *)(v4 + v5[20]);
  v12 = (uint64_t *)(v4 + v5[24]);
  v13 = (uint64_t *)(v4 + v5[28]);
  v14 = (uint64_t *)(v4 + v5[32]);
  v112 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v111 + 16);
  v112(v4, v103, v119);
  v158 = v9;
  v116 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v115 + 16);
  v116(v9, v2, v141);
  v15 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v122 + 16);
  v142 = v10;
  v15(v10, v108, v126);
  v16 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v124 + 16);
  v156 = v11;
  v16(v11, v147, v128);
  v17 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v127 + 16);
  v146 = v12;
  v17(v12, v150, v130);
  v18 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v129 + 16);
  v144 = v13;
  v18(v13, v100, v132);
  v19 = v14;
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v135 + 16))(v14, v153, v138);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v27 = *(_QWORD *)(v0 + 368);
    v28 = *(_QWORD *)(v0 + 376);
    v112(*(_QWORD *)(v0 + 568), *(uint64_t **)(v0 + 360), *(_QWORD *)(v0 + 552));
    (*(void (**)(uint64_t *, uint64_t))(v28 + 8))(v19, v27);
    v23 = (uint64_t *)(v0 + 400);
    v148 = *(_QWORD *)(v0 + 392);
    v26 = v144;
    v29 = (uint64_t *)(v0 + 432);
    v85 = *(_QWORD *)(v0 + 424);
    v88 = v85;
    v144 = v146;
    v30 = (uint64_t *)(v0 + 464);
    v151 = *(_QWORD *)(v0 + 456);
    v83 = v151;
    v146 = v156;
    v139 = *(_QWORD *)(v0 + 368);
    v31 = (uint64_t *)(v0 + 496);
    v133 = *(_QWORD *)(v0 + 488);
    v81 = v133;
    v156 = v142;
    v136 = *(_QWORD *)(v0 + 520);
    v79 = v136;
    v25 = (uint64_t *)(v0 + 528);
LABEL_21:
    v90 = *v25;
    v33 = *v31;
    v34 = *v30;
    v35 = *v29;
    v36 = *v23;
    v37 = *(_QWORD *)(v0 + 560);
    v38 = *(_QWORD *)(v0 + 552);
    v117 = *(_QWORD *)(v0 + 544);
    v120 = *(_QWORD *)(v0 + 584);
    v109 = *(_QWORD *)(v0 + 512);
    v113 = *(_QWORD *)(v0 + 528);
    v104 = *(_QWORD *)(v0 + 480);
    v106 = *(_QWORD *)(v0 + 496);
    v97 = *(_QWORD *)(v0 + 448);
    v101 = *(_QWORD *)(v0 + 464);
    v93 = *(_QWORD *)(v0 + 416);
    v95 = *(_QWORD *)(v0 + 432);
    v39 = *(_QWORD *)(v0 + 400);
    v41 = *(_QWORD *)(v0 + 376);
    v40 = *(_QWORD *)(v0 + 384);
    v42 = *(_QWORD *)(v0 + 360);
    (*(void (**)(uint64_t *))(v36 + 8))(v26);
    (*(void (**)(uint64_t *, uint64_t))(v35 + 8))(v144, v85);
    (*(void (**)(uint64_t *, uint64_t))(v34 + 8))(v146, v83);
    (*(void (**)(uint64_t *, uint64_t))(v33 + 8))(v156, v81);
    (*(void (**)(uint64_t *, uint64_t))(v90 + 8))(v158, v79);
    v43 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
    v43(v42, v38);
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v139);
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v93, v148);
    (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v97, v88);
    (*(void (**)(uint64_t, uint64_t))(v101 + 8))(v104, v151);
    (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v109, v133);
    (*(void (**)(uint64_t, uint64_t))(v113 + 8))(v117, v136);
    v43(v120, v38);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v44 = *(uint64_t (**)(void))(v0 + 8);
    return v44();
  }
  v21 = v142;
  if (!EnumCaseMultiPayload)
  {
    v112(*(_QWORD *)(v0 + 576), *(uint64_t **)(v0 + 360), *(_QWORD *)(v0 + 552));
    if (!swift_getEnumCaseMultiPayload())
    {
      v116(*(uint64_t **)(v0 + 536), v158, *(_QWORD *)(v0 + 520));
      if (!swift_getEnumCaseMultiPayload())
      {
        v15(*(uint64_t **)(v0 + 504), v142, *(_QWORD *)(v0 + 488));
        if (!swift_getEnumCaseMultiPayload())
        {
          v16(*(uint64_t **)(v0 + 472), v156, *(_QWORD *)(v0 + 456));
          if (!swift_getEnumCaseMultiPayload())
          {
            v17(*(uint64_t **)(v0 + 440), v146, *(_QWORD *)(v0 + 424));
            if (!swift_getEnumCaseMultiPayload())
            {
              v18(*(uint64_t **)(v0 + 408), v144, *(_QWORD *)(v0 + 392));
              v22 = v19;
              if (!swift_getEnumCaseMultiPayload())
              {
                v140 = *(_QWORD *)(v0 + 584);
                v89 = *(_QWORD *)(v0 + 576);
                v78 = *(_QWORD *)(v0 + 560);
                v80 = *(_QWORD *)(v0 + 552);
                v149 = *(_QWORD *)(v0 + 544);
                v107 = *(_QWORD *)(v0 + 536);
                v75 = *(_QWORD *)(v0 + 528);
                v134 = *(_QWORD *)(v0 + 520);
                v152 = *(_QWORD *)(v0 + 512);
                v110 = *(_QWORD *)(v0 + 504);
                v86 = *(_QWORD *)(v0 + 496);
                v131 = *(_QWORD *)(v0 + 488);
                v154 = *(_QWORD *)(v0 + 480);
                v114 = *(_QWORD *)(v0 + 472);
                v58 = *(_QWORD *)(v0 + 456);
                v91 = *(_QWORD *)(v0 + 464);
                v94 = v58;
                v59 = *(_QWORD *)(v0 + 448);
                v137 = *(_QWORD *)(v0 + 440);
                v60 = *(_QWORD *)(v0 + 424);
                v70 = *(_QWORD *)(v0 + 432);
                v102 = v60;
                v61 = *(_QWORD *)(v0 + 416);
                v121 = *(_QWORD *)(v0 + 408);
                v123 = v22;
                v62 = *(_QWORD *)(v0 + 392);
                v96 = v62;
                v98 = *(_QWORD *)(v0 + 400);
                v125 = *(_QWORD *)(v0 + 360);
                v118 = *(_QWORD *)(v0 + 344);
                v63 = *(_QWORD *)(v0 + 312);
                v73 = *(_QWORD *)(v0 + 320);
                v65 = *(_QWORD *)(v0 + 296);
                v64 = *(_QWORD *)(v0 + 304);
                v105 = *(_QWORD *)(v0 + 224);
                v82 = *(_QWORD *)(v0 + 336);
                v84 = *(_QWORD *)(v0 + 216);
                v76 = *(_QWORD *)(v0 + 328);
                v77 = *(_QWORD *)(v0 + 208);
                v74 = *(_QWORD *)(v0 + 200);
                v66 = *(_QWORD *)(v0 + 176);
                v71 = *(_QWORD *)(v0 + 184);
                v72 = *(_QWORD *)(v0 + 192);
                (*(void (**)(void))(*(_QWORD *)(v0 + 376) + 8))();
                v99 = *(void (**)(uint64_t, uint64_t))(v98 + 8);
                v99(v61, v62);
                v67 = *(void (**)(uint64_t, uint64_t))(v70 + 8);
                v67(v59, v60);
                v92 = *(void (**)(uint64_t, uint64_t))(v91 + 8);
                v92(v154, v58);
                v87 = *(void (**)(uint64_t, uint64_t))(v86 + 8);
                v87(v152, v131);
                v68 = *(void (**)(uint64_t, uint64_t))(v75 + 8);
                v68(v149, v134);
                v69 = *(void (**)(uint64_t, uint64_t))(v78 + 8);
                v69(v140, v80);
                (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 32))(v66, v89, v65);
                (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 32))(v71, v107, v64);
                (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 32))(v72, v110, v63);
                (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v73 - 8) + 32))(v74, v114);
                (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v76 - 8) + 32))(v77, v137);
                (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v82 - 8) + 32))(v84, v121);
                (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)(v118 - 8) + 32))(v105, v123);
                v99((uint64_t)v144, v96);
                v67((uint64_t)v146, v102);
                v92((uint64_t)v156, v94);
                v87((uint64_t)v142, v131);
                v68((uint64_t)v158, v134);
                v69(v125, v80);
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                v44 = *(uint64_t (**)(void))(v0 + 8);
                return v44();
              }
              (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 336) - 8) + 8))(*(_QWORD *)(v0 + 408));
              v21 = v142;
            }
            (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 328) - 8) + 8))(*(_QWORD *)(v0 + 440));
          }
          (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 320) - 8) + 8))(*(_QWORD *)(v0 + 472));
        }
        (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 312) - 8) + 8))(*(_QWORD *)(v0 + 504));
      }
      (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 304) - 8) + 8))(*(_QWORD *)(v0 + 536));
    }
    (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 296) - 8) + 8))(*(_QWORD *)(v0 + 576));
  }
  v23 = (uint64_t *)(v0 + 376);
  v24 = *(_QWORD *)(v0 + 520);
  v136 = v24;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v139 = *(_QWORD *)(v0 + 368);
    v148 = *(_QWORD *)(v0 + 392);
    v85 = v148;
    v88 = *(_QWORD *)(v0 + 424);
    v83 = v88;
    v151 = *(_QWORD *)(v0 + 456);
    v81 = v151;
    v25 = (uint64_t *)(v0 + 496);
    v133 = *(_QWORD *)(v0 + 488);
    v79 = v133;
    v158 = v21;
    v26 = v19;
LABEL_20:
    v30 = (uint64_t *)(v0 + 432);
    v29 = (uint64_t *)(v0 + 400);
    v31 = (uint64_t *)(v0 + 464);
    goto LABEL_21;
  }
  v32 = *(_QWORD *)(v0 + 488);
  v133 = v32;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v139 = *(_QWORD *)(v0 + 368);
    v148 = *(_QWORD *)(v0 + 392);
    v85 = v148;
    v88 = *(_QWORD *)(v0 + 424);
    v83 = v88;
    v151 = *(_QWORD *)(v0 + 456);
    v79 = v24;
    v81 = v151;
    v26 = v19;
    v25 = (uint64_t *)(v0 + 528);
    goto LABEL_20;
  }
  v46 = *(_QWORD *)(v0 + 456);
  v151 = v46;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v139 = *(_QWORD *)(v0 + 368);
    v148 = *(_QWORD *)(v0 + 392);
    v85 = v148;
    v88 = *(_QWORD *)(v0 + 424);
    v83 = v88;
    v31 = (uint64_t *)(v0 + 496);
    v81 = v32;
    v156 = v21;
    v79 = v24;
    v26 = v19;
    v25 = (uint64_t *)(v0 + 528);
    v30 = (uint64_t *)(v0 + 432);
    v29 = (uint64_t *)(v0 + 400);
    goto LABEL_21;
  }
  v47 = *(_QWORD *)(v0 + 424);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v139 = *(_QWORD *)(v0 + 368);
    v148 = *(_QWORD *)(v0 + 392);
    v83 = v46;
    v85 = v148;
    v30 = (uint64_t *)(v0 + 464);
    v146 = v156;
    v31 = (uint64_t *)(v0 + 496);
    v81 = v32;
    v156 = v142;
    v79 = v24;
    v26 = v19;
    v25 = (uint64_t *)(v0 + 528);
    v29 = (uint64_t *)(v0 + 400);
    v88 = v47;
    goto LABEL_21;
  }
  v148 = *(_QWORD *)(v0 + 392);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v139 = *(_QWORD *)(v0 + 368);
    v29 = (uint64_t *)(v0 + 432);
    v85 = v47;
    v144 = v146;
    v30 = (uint64_t *)(v0 + 464);
    v83 = v46;
    v146 = v156;
    v31 = (uint64_t *)(v0 + 496);
    v81 = v32;
    v156 = v142;
    v79 = v24;
    v26 = v19;
LABEL_31:
    v25 = (uint64_t *)(v0 + 528);
    v88 = v47;
    goto LABEL_21;
  }
  v139 = *(_QWORD *)(v0 + 368);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v23 = (uint64_t *)(v0 + 400);
    v26 = v144;
    v29 = (uint64_t *)(v0 + 432);
    v85 = v47;
    v144 = v146;
    v30 = (uint64_t *)(v0 + 464);
    v83 = v46;
    v146 = v156;
    v31 = (uint64_t *)(v0 + 496);
    v81 = v32;
    v156 = v142;
    v79 = v24;
    goto LABEL_31;
  }
  v48 = v47;
  v49 = *(_QWORD *)(v0 + 552);
  _StringGuts.grow(_:)(48);
  v50._object = (void *)0x8000000208391B80;
  v50._countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v50);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v49);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v51._countAndFlagsBits = 8236;
  v51._object = (void *)0xE200000000000000;
  String.append(_:)(v51);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v24);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v52._countAndFlagsBits = 8236;
  v52._object = (void *)0xE200000000000000;
  String.append(_:)(v52);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v32);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v53._countAndFlagsBits = 8236;
  v53._object = (void *)0xE200000000000000;
  String.append(_:)(v53);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v151);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v54._countAndFlagsBits = 8236;
  v54._object = (void *)0xE200000000000000;
  String.append(_:)(v54);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v48);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v55._countAndFlagsBits = 8236;
  v55._object = (void *)0xE200000000000000;
  String.append(_:)(v55);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v148);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v56._countAndFlagsBits = 8236;
  v56._object = (void *)0xE200000000000000;
  String.append(_:)(v56);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v139);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v57._countAndFlagsBits = 41;
  v57._object = (void *)0xE100000000000000;
  String.append(_:)(v57);
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F, G, H>(_:_:_:_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
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
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t *v57;

  v9[38] = v57;
  v9[39] = v8;
  v9[36] = v55;
  v9[37] = v56;
  v9[34] = v53;
  v9[35] = v54;
  v9[32] = v51;
  v9[33] = v52;
  v9[30] = a8;
  v9[31] = v50;
  v9[28] = a6;
  v9[29] = a7;
  v9[26] = a4;
  v9[27] = a5;
  v9[24] = a2;
  v9[25] = a3;
  v9[23] = a1;
  v10 = *v51;
  v11 = *v52;
  v12 = *v53;
  v13 = *v54;
  v14 = *v55;
  v15 = *v56;
  v16 = *v57;
  v17 = *(_QWORD *)(*(_QWORD *)v50 + 120);
  v49 = *(_QWORD *)(*(_QWORD *)v50 + 128);
  v9[40] = v49;
  v9[10] = type metadata accessor for AVAsyncProperty.Status(255, v17, v49, a4);
  v18 = *(_QWORD *)(v10 + 128);
  v9[41] = v18;
  v9[11] = type metadata accessor for AVAsyncProperty.Status(255, v17, v18, v19);
  v20 = *(_QWORD *)(v11 + 128);
  v9[42] = v20;
  v9[12] = type metadata accessor for AVAsyncProperty.Status(255, v17, v20, v21);
  v22 = *(_QWORD *)(v12 + 128);
  v9[43] = v22;
  v9[13] = type metadata accessor for AVAsyncProperty.Status(255, v17, v22, v23);
  v24 = *(_QWORD *)(v13 + 128);
  v9[44] = v24;
  v9[14] = type metadata accessor for AVAsyncProperty.Status(255, v17, v24, v25);
  v26 = *(_QWORD *)(v14 + 128);
  v9[45] = v26;
  v9[15] = type metadata accessor for AVAsyncProperty.Status(255, v17, v26, v27);
  v28 = *(_QWORD *)(v15 + 128);
  v9[46] = v28;
  v9[16] = type metadata accessor for AVAsyncProperty.Status(255, v17, v28, v29);
  v30 = *(_QWORD *)(v16 + 128);
  v9[47] = v30;
  v9[17] = type metadata accessor for AVAsyncProperty.Status(255, v17, v30, v31);
  v9[48] = swift_getTupleTypeMetadata();
  v9[49] = swift_task_alloc();
  v33 = type metadata accessor for AVAsyncProperty.Status(0, v17, v30, v32);
  v9[50] = v33;
  v9[51] = *(_QWORD *)(v33 - 8);
  v9[52] = swift_task_alloc();
  v35 = type metadata accessor for AVAsyncProperty.Status(0, v17, v28, v34);
  v9[53] = v35;
  v9[54] = *(_QWORD *)(v35 - 8);
  v9[55] = swift_task_alloc();
  v9[56] = swift_task_alloc();
  v37 = type metadata accessor for AVAsyncProperty.Status(0, v17, v26, v36);
  v9[57] = v37;
  v9[58] = *(_QWORD *)(v37 - 8);
  v9[59] = swift_task_alloc();
  v9[60] = swift_task_alloc();
  v39 = type metadata accessor for AVAsyncProperty.Status(0, v17, v24, v38);
  v9[61] = v39;
  v9[62] = *(_QWORD *)(v39 - 8);
  v9[63] = swift_task_alloc();
  v9[64] = swift_task_alloc();
  v41 = type metadata accessor for AVAsyncProperty.Status(0, v17, v22, v40);
  v9[65] = v41;
  v9[66] = *(_QWORD *)(v41 - 8);
  v9[67] = swift_task_alloc();
  v9[68] = swift_task_alloc();
  v43 = type metadata accessor for AVAsyncProperty.Status(0, v17, v20, v42);
  v9[69] = v43;
  v9[70] = *(_QWORD *)(v43 - 8);
  v9[71] = swift_task_alloc();
  v9[72] = swift_task_alloc();
  v45 = type metadata accessor for AVAsyncProperty.Status(0, v17, v18, v44);
  v9[73] = v45;
  v9[74] = *(_QWORD *)(v45 - 8);
  v9[75] = swift_task_alloc();
  v9[76] = swift_task_alloc();
  v47 = type metadata accessor for AVAsyncProperty.Status(0, v17, v49, v46);
  v9[77] = v47;
  v9[78] = *(_QWORD *)(v47 - 8);
  v9[79] = swift_task_alloc();
  v9[80] = swift_task_alloc();
  v9[81] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F, G, H>(_:_:_:_:_:_:_:_:)()
{
  _QWORD *v0;
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  Class isa;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  v30 = (id)v0[39];
  v2 = v0[37];
  v1 = v0[38];
  v4 = v0[35];
  v3 = v0[36];
  v6 = v0[33];
  v5 = v0[34];
  v8 = v0[31];
  v7 = v0[32];
  v9 = *(_QWORD *)(v8 + 24);
  v10 = *(_QWORD *)(v7 + 24);
  v28 = *(_QWORD *)(v7 + 16);
  v29 = *(_QWORD *)(v8 + 16);
  v11 = *(_QWORD *)(v6 + 24);
  v12 = *(_QWORD *)(v5 + 24);
  v26 = *(_QWORD *)(v5 + 16);
  v27 = *(_QWORD *)(v6 + 16);
  v13 = *(_QWORD *)(v4 + 24);
  v14 = *(_QWORD *)(v3 + 24);
  v24 = *(_QWORD *)(v3 + 16);
  v25 = *(_QWORD *)(v4 + 16);
  v15 = *(_QWORD *)(v2 + 24);
  v16 = *(_QWORD *)(v1 + 24);
  v22 = *(_QWORD *)(v1 + 16);
  v23 = *(_QWORD *)(v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_20838E890;
  *(_QWORD *)(v17 + 32) = v29;
  *(_QWORD *)(v17 + 40) = v9;
  *(_QWORD *)(v17 + 48) = v28;
  *(_QWORD *)(v17 + 56) = v10;
  *(_QWORD *)(v17 + 64) = v27;
  *(_QWORD *)(v17 + 72) = v11;
  *(_QWORD *)(v17 + 80) = v26;
  *(_QWORD *)(v17 + 88) = v12;
  *(_QWORD *)(v17 + 96) = v25;
  *(_QWORD *)(v17 + 104) = v13;
  *(_QWORD *)(v17 + 112) = v24;
  *(_QWORD *)(v17 + 120) = v14;
  *(_QWORD *)(v17 + 128) = v23;
  *(_QWORD *)(v17 + 136) = v15;
  *(_QWORD *)(v17 + 144) = v22;
  *(_QWORD *)(v17 + 152) = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  v0[82] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = AVAsynchronousKeyValueLoading.load<A, B, C, D, E, F, G, H>(_:_:_:_:_:_:_:_:);
  v19 = swift_continuation_init();
  v0[18] = MEMORY[0x24BDAC760];
  v20 = v0 + 18;
  v20[1] = 0x40000000;
  v20[2] = @objc completion handler block implementation for <A><A1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ();
  v20[3] = &block_descriptor_14;
  v20[4] = v19;
  objc_msgSend(v30, sel_loadValuesAsynchronouslyForKeys_completionHandler_, isa, v20);
  return swift_continuation_await();
}

{
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  int *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t *, uint64_t *, uint64_t);
  void (*v19)(uint64_t *, uint64_t *, uint64_t);
  void (*v20)(uint64_t *, uint64_t *, uint64_t);
  void (*v21)(uint64_t *, uint64_t *, uint64_t);
  uint64_t *v22;
  uint64_t *v23;
  int EnumCaseMultiPayload;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
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
  void (*v47)(uint64_t, uint64_t);
  uint64_t (*v48)(void);
  uint64_t v50;
  Swift::String v51;
  Swift::String v52;
  Swift::String v53;
  Swift::String v54;
  Swift::String v55;
  Swift::String v56;
  Swift::String v57;
  Swift::String v58;
  Swift::String v59;
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
  void (*v86)(uint64_t, uint64_t);
  uint64_t v87;
  uint64_t v88;
  void (*v89)(uint64_t, uint64_t);
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void (*v94)(uint64_t, uint64_t);
  uint64_t v95;
  uint64_t v96;
  void (*v97)(uint64_t, uint64_t);
  uint64_t v98;
  uint64_t v99;
  void (*v100)(uint64_t, uint64_t);
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void (*v105)(uint64_t, uint64_t);
  uint64_t v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  void (*v111)(uint64_t, uint64_t *, uint64_t);
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void (*v116)(uint64_t, uint64_t);
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void (*v124)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void (*v129)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
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
  uint64_t v148;
  uint64_t v149;
  uint64_t *v150;
  uint64_t *v151;
  uint64_t *v152;
  uint64_t *v153;
  uint64_t *v154;
  uint64_t *v155;
  uint64_t *v156;
  uint64_t *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t *v160;
  uint64_t *v161;
  uint64_t *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t *v168;
  uint64_t v169;
  uint64_t *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t *v173;
  uint64_t *v174;

  v1 = *(uint64_t **)(v0 + 648);
  v110 = *(_QWORD *)(v0 + 624);
  v117 = *(_QWORD *)(v0 + 616);
  v160 = *(uint64_t **)(v0 + 608);
  v113 = *(_QWORD *)(v0 + 592);
  v2 = *(uint64_t **)(v0 + 576);
  v108 = v2;
  v120 = *(_QWORD *)(v0 + 560);
  v123 = *(_QWORD *)(v0 + 584);
  v128 = *(_QWORD *)(v0 + 552);
  v157 = *(uint64_t **)(v0 + 544);
  v126 = *(_QWORD *)(v0 + 528);
  v133 = *(_QWORD *)(v0 + 520);
  v168 = *(uint64_t **)(v0 + 512);
  v131 = *(_QWORD *)(v0 + 496);
  v136 = *(_QWORD *)(v0 + 488);
  v170 = *(uint64_t **)(v0 + 480);
  v135 = *(_QWORD *)(v0 + 464);
  v138 = *(_QWORD *)(v0 + 456);
  v162 = *(uint64_t **)(v0 + 448);
  v137 = *(_QWORD *)(v0 + 432);
  v165 = *(uint64_t **)(v0 + 416);
  v141 = *(_QWORD *)(v0 + 424);
  v144 = *(_QWORD *)(v0 + 408);
  v3 = *(_QWORD *)(v0 + 392);
  v147 = *(_QWORD *)(v0 + 400);
  v4 = *(int **)(v0 + 384);
  v173 = *(uint64_t **)(v0 + 304);
  v153 = *(uint64_t **)(v0 + 288);
  v155 = *(uint64_t **)(v0 + 296);
  v5 = *(uint64_t **)(v0 + 272);
  v151 = *(uint64_t **)(v0 + 280);
  v7 = *(uint64_t **)(v0 + 256);
  v6 = *(uint64_t **)(v0 + 264);
  v8 = *(uint64_t **)(v0 + 248);

  AVAsynchronousKeyValueLoading.status<A>(of:)(v8, v1);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v7, v160);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v6, v2);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v5, v157);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v151, v168);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v153, v170);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v155, v162);
  AVAsynchronousKeyValueLoading.status<A>(of:)(v173, v165);
  v9 = (uint64_t *)(v3 + v4[12]);
  v10 = (uint64_t *)(v3 + v4[16]);
  v11 = (uint64_t *)(v3 + v4[20]);
  v12 = (uint64_t *)(v3 + v4[24]);
  v13 = (uint64_t *)(v3 + v4[28]);
  v14 = (uint64_t *)(v3 + v4[32]);
  v15 = (uint64_t *)(v3 + v4[36]);
  v111 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v110 + 16);
  v111(v3, v1, v117);
  v156 = v9;
  v16 = v123;
  v124 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v113 + 16);
  v124(v9, v160, v16);
  v161 = v10;
  v17 = v128;
  v129 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v120 + 16);
  v129(v10, v108, v17);
  v18 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v126 + 16);
  v174 = v11;
  v18(v11, v157, v133);
  v19 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v131 + 16);
  v154 = v12;
  v19(v12, v168, v136);
  v20 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v135 + 16);
  v152 = v13;
  v20(v13, v170, v138);
  v21 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v137 + 16);
  v22 = v14;
  v21(v14, v162, v141);
  v23 = v15;
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v144 + 16))(v15, v165, v147);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v30 = *(_QWORD *)(v0 + 400);
    v31 = *(_QWORD *)(v0 + 408);
    v111(*(_QWORD *)(v0 + 632), *(uint64_t **)(v0 + 392), *(_QWORD *)(v0 + 616));
    (*(void (**)(uint64_t *, uint64_t))(v31 + 8))(v15, v30);
    v26 = (uint64_t *)(v0 + 432);
    v148 = *(_QWORD *)(v0 + 424);
    v29 = v22;
    v32 = (uint64_t *)(v0 + 464);
    v158 = *(_QWORD *)(v0 + 456);
    v87 = v158;
    v150 = v152;
    v33 = (uint64_t *)(v0 + 496);
    v163 = *(_QWORD *)(v0 + 488);
    v84 = v163;
    v152 = v154;
    v34 = (uint64_t *)(v0 + 528);
    v166 = *(_QWORD *)(v0 + 520);
    v82 = v166;
    v154 = v174;
    v145 = *(_QWORD *)(v0 + 400);
    v35 = (uint64_t *)(v0 + 560);
    v139 = *(_QWORD *)(v0 + 552);
    v80 = v139;
    v174 = v161;
    v142 = *(_QWORD *)(v0 + 584);
    v78 = v142;
    v28 = (uint64_t *)(v0 + 592);
LABEL_23:
    v92 = *v28;
    v37 = *v35;
    v38 = *v34;
    v39 = *v33;
    v40 = *v32;
    v41 = *v26;
    v42 = *(_QWORD *)(v0 + 624);
    v43 = *(_QWORD *)(v0 + 616);
    v118 = *(_QWORD *)(v0 + 608);
    v121 = *(_QWORD *)(v0 + 648);
    v112 = *(_QWORD *)(v0 + 576);
    v114 = *(_QWORD *)(v0 + 592);
    v106 = *(_QWORD *)(v0 + 544);
    v109 = *(_QWORD *)(v0 + 560);
    v101 = *(_QWORD *)(v0 + 512);
    v103 = *(_QWORD *)(v0 + 528);
    v96 = *(_QWORD *)(v0 + 480);
    v98 = *(_QWORD *)(v0 + 496);
    v95 = *(_QWORD *)(v0 + 464);
    v90 = *(_QWORD *)(v0 + 448);
    v44 = *(_QWORD *)(v0 + 432);
    v45 = *(_QWORD *)(v0 + 408);
    v171 = *(_QWORD *)(v0 + 416);
    v46 = *(_QWORD *)(v0 + 392);
    (*(void (**)(uint64_t *))(v41 + 8))(v29);
    (*(void (**)(uint64_t *, uint64_t))(v40 + 8))(v150, v87);
    (*(void (**)(uint64_t *, uint64_t))(v39 + 8))(v152, v84);
    (*(void (**)(uint64_t *, uint64_t))(v38 + 8))(v154, v82);
    (*(void (**)(uint64_t *, uint64_t))(v37 + 8))(v174, v80);
    (*(void (**)(uint64_t *, uint64_t))(v92 + 8))(v156, v78);
    v47 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
    v47(v46, v43);
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v171, v145);
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v90, v148);
    (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v96, v158);
    (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v101, v163);
    (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v106, v166);
    (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v112, v139);
    (*(void (**)(uint64_t, uint64_t))(v114 + 8))(v118, v142);
    v47(v121, v43);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v48 = *(uint64_t (**)(void))(v0 + 8);
    return v48();
  }
  v25 = v161;
  v150 = v22;
  if (!EnumCaseMultiPayload)
  {
    v111(*(_QWORD *)(v0 + 640), *(uint64_t **)(v0 + 392), *(_QWORD *)(v0 + 616));
    if (!swift_getEnumCaseMultiPayload())
    {
      v124(*(uint64_t **)(v0 + 600), v156, *(_QWORD *)(v0 + 584));
      if (!swift_getEnumCaseMultiPayload())
      {
        v129(*(uint64_t **)(v0 + 568), v161, *(_QWORD *)(v0 + 552));
        if (!swift_getEnumCaseMultiPayload())
        {
          v18(*(uint64_t **)(v0 + 536), v174, *(_QWORD *)(v0 + 520));
          if (!swift_getEnumCaseMultiPayload())
          {
            v19(*(uint64_t **)(v0 + 504), v154, *(_QWORD *)(v0 + 488));
            if (!swift_getEnumCaseMultiPayload())
            {
              v20(*(uint64_t **)(v0 + 472), v152, *(_QWORD *)(v0 + 456));
              if (!swift_getEnumCaseMultiPayload())
              {
                v21(*(uint64_t **)(v0 + 440), v22, *(_QWORD *)(v0 + 424));
                if (!swift_getEnumCaseMultiPayload())
                {
                  v79 = *(_QWORD *)(v0 + 648);
                  v91 = *(_QWORD *)(v0 + 640);
                  v85 = *(_QWORD *)(v0 + 624);
                  v77 = *(_QWORD *)(v0 + 616);
                  v159 = *(_QWORD *)(v0 + 608);
                  v149 = *(_QWORD *)(v0 + 600);
                  v88 = *(_QWORD *)(v0 + 592);
                  v146 = *(_QWORD *)(v0 + 584);
                  v164 = *(_QWORD *)(v0 + 576);
                  v119 = *(_QWORD *)(v0 + 568);
                  v93 = *(_QWORD *)(v0 + 560);
                  v143 = *(_QWORD *)(v0 + 552);
                  v167 = *(_QWORD *)(v0 + 544);
                  v122 = *(_QWORD *)(v0 + 536);
                  v99 = *(_QWORD *)(v0 + 528);
                  v140 = *(_QWORD *)(v0 + 520);
                  v169 = *(_QWORD *)(v0 + 512);
                  v125 = *(_QWORD *)(v0 + 504);
                  v60 = *(_QWORD *)(v0 + 488);
                  v104 = *(_QWORD *)(v0 + 496);
                  v172 = *(_QWORD *)(v0 + 480);
                  v127 = *(_QWORD *)(v0 + 472);
                  v61 = *(_QWORD *)(v0 + 456);
                  v115 = *(_QWORD *)(v0 + 464);
                  v132 = v23;
                  v62 = *(_QWORD *)(v0 + 448);
                  v130 = *(_QWORD *)(v0 + 440);
                  v63 = *(_QWORD *)(v0 + 424);
                  v64 = *(_QWORD *)(v0 + 432);
                  v134 = *(_QWORD *)(v0 + 392);
                  v107 = *(_QWORD *)(v0 + 376);
                  v74 = *(_QWORD *)(v0 + 352);
                  v72 = *(_QWORD *)(v0 + 344);
                  v65 = *(_QWORD *)(v0 + 328);
                  v70 = *(_QWORD *)(v0 + 336);
                  v66 = *(_QWORD *)(v0 + 320);
                  v102 = *(_QWORD *)(v0 + 240);
                  v81 = *(_QWORD *)(v0 + 232);
                  v83 = *(_QWORD *)(v0 + 368);
                  v75 = *(_QWORD *)(v0 + 224);
                  v76 = *(_QWORD *)(v0 + 360);
                  v73 = *(_QWORD *)(v0 + 216);
                  v71 = *(_QWORD *)(v0 + 208);
                  v67 = *(_QWORD *)(v0 + 184);
                  v68 = *(_QWORD *)(v0 + 192);
                  v69 = *(_QWORD *)(v0 + 200);
                  (*(void (**)(void))(*(_QWORD *)(v0 + 408) + 8))();
                  v97 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
                  v97(v62, v63);
                  v116 = *(void (**)(uint64_t, uint64_t))(v115 + 8);
                  v116(v172, v61);
                  v105 = *(void (**)(uint64_t, uint64_t))(v104 + 8);
                  v105(v169, v60);
                  v100 = *(void (**)(uint64_t, uint64_t))(v99 + 8);
                  v100(v167, v140);
                  v94 = *(void (**)(uint64_t, uint64_t))(v93 + 8);
                  v94(v164, v143);
                  v89 = *(void (**)(uint64_t, uint64_t))(v88 + 8);
                  v89(v159, v146);
                  v86 = *(void (**)(uint64_t, uint64_t))(v85 + 8);
                  v86(v79, v77);
                  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 32))(v67, v91, v66);
                  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 32))(v68, v149, v65);
                  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v70 - 8) + 32))(v69, v119);
                  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v72 - 8) + 32))(v71, v122);
                  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v74 - 8) + 32))(v73, v125);
                  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v76 - 8) + 32))(v75, v127);
                  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v83 - 8) + 32))(v81, v130);
                  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)(v107 - 8) + 32))(v102, v132);
                  v97((uint64_t)v150, v63);
                  v116((uint64_t)v152, v61);
                  v105((uint64_t)v154, v60);
                  v100((uint64_t)v174, v140);
                  v94((uint64_t)v161, v143);
                  v89((uint64_t)v156, v146);
                  v86(v134, v77);
                  swift_task_dealloc();
                  swift_task_dealloc();
                  swift_task_dealloc();
                  swift_task_dealloc();
                  swift_task_dealloc();
                  swift_task_dealloc();
                  swift_task_dealloc();
                  swift_task_dealloc();
                  swift_task_dealloc();
                  swift_task_dealloc();
                  swift_task_dealloc();
                  swift_task_dealloc();
                  swift_task_dealloc();
                  swift_task_dealloc();
                  swift_task_dealloc();
                  swift_task_dealloc();
                  swift_task_dealloc();
                  v48 = *(uint64_t (**)(void))(v0 + 8);
                  return v48();
                }
                (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 368) - 8) + 8))(*(_QWORD *)(v0 + 440));
              }
              (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 360) - 8) + 8))(*(_QWORD *)(v0 + 472));
            }
            (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 352) - 8) + 8))(*(_QWORD *)(v0 + 504));
          }
          (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 344) - 8) + 8))(*(_QWORD *)(v0 + 536));
        }
        (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 336) - 8) + 8))(*(_QWORD *)(v0 + 568));
        v25 = v161;
      }
      (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 328) - 8) + 8))(*(_QWORD *)(v0 + 600));
    }
    (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 320) - 8) + 8))(*(_QWORD *)(v0 + 640));
  }
  v26 = (uint64_t *)(v0 + 408);
  v27 = *(_QWORD *)(v0 + 584);
  v142 = v27;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v145 = *(_QWORD *)(v0 + 400);
    v148 = *(_QWORD *)(v0 + 424);
    v87 = v148;
    v158 = *(_QWORD *)(v0 + 456);
    v84 = v158;
    v163 = *(_QWORD *)(v0 + 488);
    v82 = v163;
    v166 = *(_QWORD *)(v0 + 520);
    v80 = v166;
    v28 = (uint64_t *)(v0 + 560);
    v139 = *(_QWORD *)(v0 + 552);
    v78 = v139;
    v156 = v25;
    v29 = v23;
LABEL_22:
    v33 = (uint64_t *)(v0 + 464);
    v32 = (uint64_t *)(v0 + 432);
    v35 = (uint64_t *)(v0 + 528);
    v34 = (uint64_t *)(v0 + 496);
    goto LABEL_23;
  }
  v36 = *(_QWORD *)(v0 + 552);
  v139 = v36;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v145 = *(_QWORD *)(v0 + 400);
    v148 = *(_QWORD *)(v0 + 424);
    v87 = v148;
    v158 = *(_QWORD *)(v0 + 456);
    v84 = v158;
    v163 = *(_QWORD *)(v0 + 488);
    v82 = v163;
    v166 = *(_QWORD *)(v0 + 520);
    v78 = v27;
    v80 = v166;
    v29 = v23;
    v28 = (uint64_t *)(v0 + 592);
    goto LABEL_22;
  }
  v166 = *(_QWORD *)(v0 + 520);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v145 = *(_QWORD *)(v0 + 400);
    v148 = *(_QWORD *)(v0 + 424);
    v87 = v148;
    v158 = *(_QWORD *)(v0 + 456);
    v84 = v158;
    v163 = *(_QWORD *)(v0 + 488);
    v82 = v163;
    v35 = (uint64_t *)(v0 + 560);
    v80 = v36;
    v174 = v25;
    v78 = v27;
    v29 = v23;
    v28 = (uint64_t *)(v0 + 592);
    v33 = (uint64_t *)(v0 + 464);
    v32 = (uint64_t *)(v0 + 432);
    v34 = (uint64_t *)(v0 + 496);
    goto LABEL_23;
  }
  v163 = *(_QWORD *)(v0 + 488);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v145 = *(_QWORD *)(v0 + 400);
    v148 = *(_QWORD *)(v0 + 424);
    v87 = v148;
    v158 = *(_QWORD *)(v0 + 456);
    v84 = v158;
    v34 = (uint64_t *)(v0 + 528);
    v82 = v166;
    v154 = v174;
    v35 = (uint64_t *)(v0 + 560);
    v80 = v36;
    v174 = v25;
    v78 = v27;
    v29 = v23;
    v28 = (uint64_t *)(v0 + 592);
    v33 = (uint64_t *)(v0 + 464);
    v32 = (uint64_t *)(v0 + 432);
    goto LABEL_23;
  }
  v158 = *(_QWORD *)(v0 + 456);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v145 = *(_QWORD *)(v0 + 400);
    v148 = *(_QWORD *)(v0 + 424);
    v87 = v148;
    v33 = (uint64_t *)(v0 + 496);
    v84 = v163;
    v152 = v154;
    v34 = (uint64_t *)(v0 + 528);
    v82 = v166;
    v154 = v174;
    v35 = (uint64_t *)(v0 + 560);
    v80 = v36;
    v174 = v161;
    v78 = v27;
    v29 = v23;
    v28 = (uint64_t *)(v0 + 592);
    v32 = (uint64_t *)(v0 + 432);
    goto LABEL_23;
  }
  v148 = *(_QWORD *)(v0 + 424);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v145 = *(_QWORD *)(v0 + 400);
    v32 = (uint64_t *)(v0 + 464);
    v87 = v158;
    v150 = v152;
    v33 = (uint64_t *)(v0 + 496);
    v84 = v163;
    v152 = v154;
    v34 = (uint64_t *)(v0 + 528);
    v82 = v166;
    v154 = v174;
    v35 = (uint64_t *)(v0 + 560);
    v80 = v36;
    v174 = v161;
    v78 = v27;
    v29 = v23;
    v28 = (uint64_t *)(v0 + 592);
    goto LABEL_23;
  }
  v145 = *(_QWORD *)(v0 + 400);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v26 = (uint64_t *)(v0 + 432);
    v29 = v22;
    v32 = (uint64_t *)(v0 + 464);
    v87 = v158;
    v150 = v152;
    v33 = (uint64_t *)(v0 + 496);
    v84 = v163;
    v152 = v154;
    v34 = (uint64_t *)(v0 + 528);
    v82 = v166;
    v154 = v174;
    v35 = (uint64_t *)(v0 + 560);
    v80 = v36;
    v174 = v161;
    v78 = v27;
    v28 = (uint64_t *)(v0 + 592);
    goto LABEL_23;
  }
  v50 = *(_QWORD *)(v0 + 616);
  _StringGuts.grow(_:)(52);
  v51._object = (void *)0x8000000208391B80;
  v51._countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v51);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v50);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v52._countAndFlagsBits = 8236;
  v52._object = (void *)0xE200000000000000;
  String.append(_:)(v52);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v27);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v53._countAndFlagsBits = 8236;
  v53._object = (void *)0xE200000000000000;
  String.append(_:)(v53);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v36);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v54._countAndFlagsBits = 8236;
  v54._object = (void *)0xE200000000000000;
  String.append(_:)(v54);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v166);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v55._countAndFlagsBits = 8236;
  v55._object = (void *)0xE200000000000000;
  String.append(_:)(v55);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v163);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v56._countAndFlagsBits = 8236;
  v56._object = (void *)0xE200000000000000;
  String.append(_:)(v56);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v158);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v57._countAndFlagsBits = 8236;
  v57._object = (void *)0xE200000000000000;
  String.append(_:)(v57);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v148);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v58._countAndFlagsBits = 8236;
  v58._object = (void *)0xE200000000000000;
  String.append(_:)(v58);
  MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAsyncProperty<A, B>.Status, v145);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v59._countAndFlagsBits = 41;
  v59._object = (void *)0xE100000000000000;
  String.append(_:)(v59);
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t method lookup function for AVAnyAsyncProperty()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AVAnyAsyncProperty.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t method lookup function for AVPartialAsyncProperty()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for AVAsyncProperty()
{
  return swift_lookUpClassMethod();
}

char *initializeBufferWithCopyOfBuffer for AVAsyncProperty.Status(char *__dst, char **a2, uint64_t a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  int v8;
  unsigned int v10;
  unsigned int v11;
  char *v14;
  uint64_t v15;
  unsigned int v16;
  char *v17;
  char *v18;
  unsigned int v19;

  v3 = __dst;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(v4 + 64);
  if (v5 > 3)
  {
    v6 = v5 + 1;
    v7 = *(_DWORD *)(v4 + 80);
    v8 = v7 & 0x1000F8;
    goto LABEL_6;
  }
  v11 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  v7 = *(_DWORD *)(v4 + 80);
  if (v11 > 0xFFFD)
  {
    if ((unint64_t)(v5 + 4) > 0x18 || (v7 & 0x1000F8) != 0)
      goto LABEL_27;
    v10 = *(_DWORD *)((char *)a2 + v5);
    if (v10 < 2)
      goto LABEL_33;
    goto LABEL_29;
  }
  v8 = v7 & 0x1000F8;
  if (v11 > 0xFD)
  {
    if ((unint64_t)(v5 + 2) > 0x18 || v8 != 0)
      goto LABEL_27;
    v10 = *(unsigned __int16 *)((char *)a2 + v5);
    if (v10 < 2)
      goto LABEL_33;
LABEL_29:
    if (v5 <= 3)
      v15 = v5;
    else
      v15 = 4;
    __asm { BR              X13 }
  }
  v6 = v5 + 1;
LABEL_6:
  if (v6 > 0x18 || v8 != 0)
  {
LABEL_27:
    v14 = *a2;
    *(_QWORD *)v3 = *a2;
    v3 = &v14[((v7 & 0xF8 | 7u) + 16) & ~(unint64_t)(v7 & 0xF8 | 7u)];
    swift_retain();
    return v3;
  }
  v10 = *((unsigned __int8 *)a2 + v5);
  if (v10 >= 2)
    goto LABEL_29;
LABEL_33:
  if (v10 == 1)
  {
    v17 = *a2;
    *(_QWORD *)__dst = *a2;
    v18 = v17;
    if (v5 > 3)
      goto LABEL_39;
    v19 = ((1 << (8 * v5)) + 1) >> (8 * v5);
    if (v19 > 0xFFFD)
    {
      *(_DWORD *)&v3[v5] = 1;
      return v3;
    }
    if (v19 <= 0xFD)
LABEL_39:
      v3[v5] = 1;
    else
      *(_WORD *)&v3[v5] = 1;
  }
  else
  {
    (*(void (**)(char *))(v4 + 16))(__dst);
    if (v5 <= 3)
    {
      v16 = ((1 << (8 * v5)) + 1) >> (8 * v5);
      if (v16 > 0xFFFD)
      {
        *(_DWORD *)&v3[v5] = 0;
        return v3;
      }
      if (v16 > 0xFD)
      {
        *(_WORD *)&v3[v5] = 0;
        return v3;
      }
    }
    v3[v5] = 0;
  }
  return v3;
}

id *assignWithCopy for AVAsyncProperty.Status(id *__dst, void **__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  id v16;
  unsigned int v17;

  if (__dst == __src)
    return __dst;
  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  if (*(_QWORD *)(v6 + 64) <= 8uLL)
    v7 = 8;
  else
    v7 = *(_QWORD *)(v6 + 64);
  if (v7 > 3)
    goto LABEL_6;
  v9 = ((1 << (8 * v7)) + 1) >> (8 * v7);
  if (v9 > 0xFFFD)
  {
    v8 = *(_DWORD *)((char *)__dst + v7);
  }
  else
  {
    if (v9 <= 0xFD)
    {
LABEL_6:
      v8 = *((unsigned __int8 *)__dst + v7);
      goto LABEL_11;
    }
    v8 = *(unsigned __int16 *)((char *)__dst + v7);
  }
LABEL_11:
  if (v8 >= 2)
  {
    if (v7 <= 3)
      v10 = v7;
    else
      v10 = 4;
    __asm { BR              X12 }
  }
  if (v8 == 1)
  {

    if (v7 > 3)
      goto LABEL_22;
  }
  else
  {
    (*(void (**)(id *, _QWORD))(v6 + 8))(__dst, *(_QWORD *)(a3 + 24));
    if (v7 > 3)
      goto LABEL_22;
  }
  v11 = ((1 << (8 * v7)) + 1) >> (8 * v7);
  if (v11 <= 0xFFFD)
  {
    if (v11 > 0xFD)
    {
      v12 = *(unsigned __int16 *)((char *)__src + v7);
      if (v12 < 2)
        goto LABEL_31;
      goto LABEL_27;
    }
LABEL_22:
    v12 = *((unsigned __int8 *)__src + v7);
    if (v12 < 2)
      goto LABEL_31;
LABEL_27:
    if (v7 <= 3)
      v13 = v7;
    else
      v13 = 4;
    __asm { BR              X12 }
  }
  v12 = *(_DWORD *)((char *)__src + v7);
  if (v12 >= 2)
    goto LABEL_27;
LABEL_31:
  if (v12 == 1)
  {
    v15 = *__src;
    *__dst = *__src;
    v16 = v15;
    if (v7 > 3)
      goto LABEL_37;
    v17 = ((1 << (8 * v7)) + 1) >> (8 * v7);
    if (v17 > 0xFFFD)
    {
      *(_DWORD *)((char *)__dst + v7) = 1;
      return __dst;
    }
    if (v17 <= 0xFD)
LABEL_37:
      *((_BYTE *)__dst + v7) = 1;
    else
      *(_WORD *)((char *)__dst + v7) = 1;
  }
  else
  {
    (*(void (**)(id *, void **, uint64_t))(v6 + 16))(__dst, __src, v5);
    if (v7 <= 3)
    {
      v14 = ((1 << (8 * v7)) + 1) >> (8 * v7);
      if (v14 > 0xFFFD)
      {
        *(_DWORD *)((char *)__dst + v7) = 0;
        return __dst;
      }
      if (v14 > 0xFD)
      {
        *(_WORD *)((char *)__dst + v7) = 0;
        return __dst;
      }
    }
    *((_BYTE *)__dst + v7) = 0;
  }
  return __dst;
}

char *initializeWithTake for AVAsyncProperty.Status(char *__dst, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(v4 + 64);
  if (v5 > 3)
    goto LABEL_5;
  v7 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  if (v7 > 0xFFFD)
  {
    v6 = *(_DWORD *)((char *)a2 + v5);
  }
  else
  {
    if (v7 <= 0xFD)
    {
LABEL_5:
      v6 = *((unsigned __int8 *)a2 + v5);
      goto LABEL_10;
    }
    v6 = *(unsigned __int16 *)((char *)a2 + v5);
  }
LABEL_10:
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v8 = v5;
    else
      v8 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    *(_QWORD *)__dst = *a2;
    if (v5 > 3)
      goto LABEL_21;
    v10 = ((1 << (8 * v5)) + 1) >> (8 * v5);
    if (v10 > 0xFFFD)
    {
      *(_DWORD *)&__dst[v5] = 1;
      return __dst;
    }
    if (v10 <= 0xFD)
LABEL_21:
      __dst[v5] = 1;
    else
      *(_WORD *)&__dst[v5] = 1;
  }
  else
  {
    (*(void (**)(char *))(v4 + 32))(__dst);
    if (v5 <= 3)
    {
      v9 = ((1 << (8 * v5)) + 1) >> (8 * v5);
      if (v9 > 0xFFFD)
      {
        *(_DWORD *)&__dst[v5] = 0;
        return __dst;
      }
      if (v9 > 0xFD)
      {
        *(_WORD *)&__dst[v5] = 0;
        return __dst;
      }
    }
    __dst[v5] = 0;
  }
  return __dst;
}

id *assignWithTake for AVAsyncProperty.Status(id *__dst, id *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;

  if (__dst == __src)
    return __dst;
  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  if (*(_QWORD *)(v6 + 64) <= 8uLL)
    v7 = 8;
  else
    v7 = *(_QWORD *)(v6 + 64);
  if (v7 > 3)
    goto LABEL_6;
  v9 = ((1 << (8 * v7)) + 1) >> (8 * v7);
  if (v9 > 0xFFFD)
  {
    v8 = *(_DWORD *)((char *)__dst + v7);
  }
  else
  {
    if (v9 <= 0xFD)
    {
LABEL_6:
      v8 = *((unsigned __int8 *)__dst + v7);
      goto LABEL_11;
    }
    v8 = *(unsigned __int16 *)((char *)__dst + v7);
  }
LABEL_11:
  if (v8 >= 2)
  {
    if (v7 <= 3)
      v10 = v7;
    else
      v10 = 4;
    __asm { BR              X12 }
  }
  if (v8 == 1)
  {

    if (v7 > 3)
      goto LABEL_22;
  }
  else
  {
    (*(void (**)(id *, _QWORD))(v6 + 8))(__dst, *(_QWORD *)(a3 + 24));
    if (v7 > 3)
      goto LABEL_22;
  }
  v11 = ((1 << (8 * v7)) + 1) >> (8 * v7);
  if (v11 <= 0xFFFD)
  {
    if (v11 > 0xFD)
    {
      v12 = *(unsigned __int16 *)((char *)__src + v7);
      if (v12 < 2)
        goto LABEL_31;
      goto LABEL_27;
    }
LABEL_22:
    v12 = *((unsigned __int8 *)__src + v7);
    if (v12 < 2)
      goto LABEL_31;
LABEL_27:
    if (v7 <= 3)
      v13 = v7;
    else
      v13 = 4;
    __asm { BR              X12 }
  }
  v12 = *(_DWORD *)((char *)__src + v7);
  if (v12 >= 2)
    goto LABEL_27;
LABEL_31:
  if (v12 == 1)
  {
    *__dst = *__src;
    if (v7 > 3)
      goto LABEL_37;
    v15 = ((1 << (8 * v7)) + 1) >> (8 * v7);
    if (v15 > 0xFFFD)
    {
      *(_DWORD *)((char *)__dst + v7) = 1;
      return __dst;
    }
    if (v15 <= 0xFD)
LABEL_37:
      *((_BYTE *)__dst + v7) = 1;
    else
      *(_WORD *)((char *)__dst + v7) = 1;
  }
  else
  {
    (*(void (**)(id *, id *, uint64_t))(v6 + 32))(__dst, __src, v5);
    if (v7 <= 3)
    {
      v14 = ((1 << (8 * v7)) + 1) >> (8 * v7);
      if (v14 > 0xFFFD)
      {
        *(_DWORD *)((char *)__dst + v7) = 0;
        return __dst;
      }
      if (v14 > 0xFD)
      {
        *(_WORD *)((char *)__dst + v7) = 0;
        return __dst;
      }
    }
    *((_BYTE *)__dst + v7) = 0;
  }
  return __dst;
}

uint64_t getEnumTagSinglePayload for AVAsyncProperty.Status(uint64_t a1, unsigned int a2, uint64_t a3)
{
  unint64_t v3;
  int v4;
  unsigned int v5;
  char v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  int v12;
  unsigned int v13;
  int v14;
  int v16;
  unsigned int v17;
  unsigned int v18;
  char v19;
  int v20;
  unsigned int v21;
  int v22;
  int v23;
  unsigned int v24;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64);
  if (v3 <= 8)
    v3 = 8;
  if (v3 > 3)
  {
    v4 = 3;
LABEL_7:
    v6 = 8;
    goto LABEL_8;
  }
  v5 = ((1 << (8 * v3)) + 1) >> (8 * v3);
  if (v5 > 0xFFFD)
    goto LABEL_11;
  v4 = v5 + 2;
  if (v5 <= 0xFD)
    goto LABEL_7;
  v6 = 16;
LABEL_8:
  v7 = (1 << v6) - v4;
  if ((v7 & 0x80000000) == 0)
  {
    if (v3 > 3)
      goto LABEL_15;
LABEL_12:
    v8 = ((1 << (8 * v3)) + 1) >> (8 * v3);
    v9 = 2;
    if (v8 > 0xFFFD)
      v9 = 4;
    if (v8 > 0xFD)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_11:
  v7 = 0x7FFFFFFF;
  if (v3 <= 3)
    goto LABEL_12;
LABEL_15:
  v9 = 1;
LABEL_16:
  if (!a2)
    return 0;
  if (a2 <= v7)
    goto LABEL_34;
  v10 = v9 + v3;
  v11 = 8 * v10;
  if (v10 <= 3)
  {
    v13 = ((a2 - v7 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v13))
    {
      v12 = *(_DWORD *)(a1 + v10);
      if (!v12)
        goto LABEL_34;
      goto LABEL_27;
    }
    if (v13 > 0xFF)
    {
      v12 = *(unsigned __int16 *)(a1 + v10);
      if (!*(_WORD *)(a1 + v10))
        goto LABEL_34;
      goto LABEL_27;
    }
    if (v13 < 2)
    {
LABEL_34:
      if (v7)
      {
        if (v3 <= 3)
        {
          v21 = ((1 << (8 * v3)) + 1) >> (8 * v3);
          if (v21 > 0xFFFD)
          {
            v17 = *(_DWORD *)(a1 + v3);
            v18 = ~v17;
LABEL_44:
            v24 = 0x7FFFFFFF;
LABEL_45:
            if (v24 > v18)
              return -v17;
            else
              return 0;
          }
          v20 = v21 + 2;
          if (v21 > 0xFD)
          {
            v23 = *(unsigned __int16 *)(a1 + v3);
            v17 = v23 | 0xFFFF0000;
            v18 = v23 ^ 0xFFFF;
            v19 = 16;
          }
          else
          {
            v22 = *(unsigned __int8 *)(a1 + v3);
            v17 = v22 | 0xFFFFFF00;
            v18 = v22 ^ 0xFF;
            v19 = 8;
          }
        }
        else
        {
          v16 = *(unsigned __int8 *)(a1 + v3);
          v17 = v16 | 0xFFFFFF00;
          v18 = v16 ^ 0xFF;
          v19 = 8;
          v20 = 3;
        }
        v24 = (1 << v19) - v20;
        if ((v24 & 0x80000000) == 0)
          goto LABEL_45;
        goto LABEL_44;
      }
      return 0;
    }
  }
  v12 = *(unsigned __int8 *)(a1 + v10);
  if (!*(_BYTE *)(a1 + v10))
    goto LABEL_34;
LABEL_27:
  v14 = (v12 - 1) << v11;
  if (v10 > 3)
    v14 = 0;
  if (!(_DWORD)v10)
    return v7 + v14 + 1;
  if (v10 > 3)
    LODWORD(v10) = 4;
  return ((uint64_t (*)(void))((char *)&loc_208378670 + 4 * byte_20838E8DC[(v10 - 1)]))();
}

void storeEnumTagSinglePayload for AVAsyncProperty.Status(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  char v6;
  int v7;
  char v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  size_t v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  int v17;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 24) - 8) + 64);
  if (v5 <= 8)
    v5 = 8;
  v6 = 8 * v5;
  if (v5 <= 3)
  {
    v10 = ((1 << v6) + 1) >> v6;
    if (v10 > 0xFFFD)
      goto LABEL_12;
    v7 = v10 + 2;
    if (v10 > 0xFD)
    {
      v8 = 16;
LABEL_6:
      v9 = (1 << v8) - v7;
      if ((v9 & 0x80000000) == 0)
      {
        if (v5 > 3)
          goto LABEL_16;
LABEL_13:
        v11 = ((1 << v6) + 1) >> v6;
        v12 = 2;
        if (v11 > 0xFFFD)
          v12 = 4;
        if (v11 > 0xFD)
        {
LABEL_17:
          v13 = v12 + v5;
          if (a3 <= v9)
          {
            v14 = 0;
          }
          else if (v13 <= 3)
          {
            v16 = ((a3 - v9 + ~(-1 << (8 * v13))) >> (8 * v13)) + 1;
            if (HIWORD(v16))
            {
              v14 = 4u;
            }
            else if (v16 >= 0x100)
            {
              v14 = 2;
            }
            else
            {
              v14 = v16 > 1;
            }
          }
          else
          {
            v14 = 1u;
          }
          if (v9 < a2)
          {
            v15 = ~v9 + a2;
            if (v13 < 4)
            {
              if ((_DWORD)v13)
              {
                v17 = v15 & ~(-1 << (8 * v13));
                bzero(a1, v13);
                if ((_DWORD)v13 == 3)
                {
                  *a1 = v17;
                  *((_BYTE *)a1 + 2) = BYTE2(v17);
                }
                else if ((_DWORD)v13 == 2)
                {
                  *a1 = v17;
                }
                else
                {
                  *(_BYTE *)a1 = v17;
                }
              }
            }
            else
            {
              bzero(a1, v13);
              *(_DWORD *)a1 = v15;
            }
            __asm { BR              X10 }
          }
          __asm { BR              X12 }
        }
LABEL_16:
        v12 = 1;
        goto LABEL_17;
      }
LABEL_12:
      v9 = 0x7FFFFFFF;
      if (v5 > 3)
        goto LABEL_16;
      goto LABEL_13;
    }
  }
  else
  {
    v7 = 3;
  }
  v8 = 8;
  goto LABEL_6;
}

uint64_t getEnumTag for AVAsyncProperty.Status(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v2 = 8;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 64) > 8uLL)
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 64);
  if (v2 > 3)
    goto LABEL_4;
  v4 = ((1 << (8 * v2)) + 1) >> (8 * v2);
  if (v4 > 0xFFFD)
  {
    v3 = *(unsigned int *)(a1 + v2);
  }
  else
  {
    if (v4 <= 0xFD)
    {
LABEL_4:
      v3 = *(unsigned __int8 *)(a1 + v2);
      goto LABEL_9;
    }
    v3 = *(unsigned __int16 *)(a1 + v2);
  }
LABEL_9:
  if (v3 < 2)
    return v3;
  if (v2 <= 3)
    v5 = v2;
  else
    v5 = 4;
  return ((uint64_t (*)(void))((char *)&loc_208378A5C + 4 * byte_20838E8EA[v5]))();
}

_BYTE *destructiveInjectEnumTag for AVAsyncProperty.Status(_BYTE *result, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  int v9;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64) <= 8uLL)
    v4 = 8;
  else
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64);
  if (a2 > 1)
  {
    if (v4 < 4)
    {
      v6 = ((a2 - 2) >> (8 * v4)) + 2;
      v7 = (unsigned int *)&result[v4];
      v8 = ((1 << (8 * v4)) + 1) >> (8 * v4);
      if (v8 > 0xFFFD)
      {
        *v7 = v6;
      }
      else if (v8 > 0xFD)
      {
        *(_WORD *)v7 = v6;
      }
      else
      {
        *(_BYTE *)v7 = v6;
      }
    }
    else
    {
      result[v4] = 2;
    }
    if (v4 <= 3)
      v9 = v4;
    else
      v9 = 4;
    bzero(result, v4);
    __asm { BR              X10 }
  }
  if (v4 > 3)
    goto LABEL_6;
  v5 = ((1 << (8 * v4)) + 1) >> (8 * v4);
  if (v5 > 0xFFFD)
  {
    *(_DWORD *)&result[v4] = a2;
  }
  else
  {
    if (v5 <= 0xFD)
    {
LABEL_6:
      result[v4] = a2;
      return result;
    }
    *(_WORD *)&result[v4] = a2;
  }
  return result;
}

uint64_t sub_208378BFC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t AVMetadataMachineReadableCodeObject.corners.getter()
{
  void *v0;
  id v1;
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSDictionary v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  CGPoint_optional v16;

  v1 = objc_msgSend(v0, sel_corners);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : Any]);
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v15 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3, 0);
    v4 = 0;
    v5 = v15;
    while (1)
    {
      swift_bridgeObjectRetain();
      v6.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
      v16 = CGPoint.init(dictionaryRepresentation:)(v6.super.isa);
      if ((v8 & 1) != 0)
        break;
      v9 = *(_QWORD *)&v16.is_nil;
      v10 = v7;
      swift_bridgeObjectRelease();
      v12 = *(_QWORD *)(v15 + 16);
      v11 = *(_QWORD *)(v15 + 24);
      if (v12 >= v11 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
      ++v4;
      *(_QWORD *)(v15 + 16) = v12 + 1;
      v13 = v15 + 16 * v12;
      *(_QWORD *)(v13 + 32) = v9;
      *(_QWORD *)(v13 + 40) = v10;
      if (v3 == v4)
      {
        swift_bridgeObjectRelease();
        goto LABEL_9;
      }
    }
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v5 = MEMORY[0x24BEE4AF8];
LABEL_9:
    *(_QWORD *)&v16.is_nil = v5;
  }
  LOBYTE(result) = v16.is_nil;
  return result;
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<CGPoint>);
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

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<Int32>);
  *v3 = result;
  return result;
}

{
  char **v3;
  char *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<UInt32>);
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

{
  char **v3;
  char *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<AVCaptureFlashMode>);
  *v3 = result;
  return result;
}

{
  char **v3;
  char *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<AVCaptureColorSpace>);
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

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<ClosedRange<CGFloat>>);
  *v3 = result;
  return result;
}

_QWORD *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<[String : Any]>, &demangling cache variable for type metadata for [String : Any]);
  *v3 = result;
  return result;
}

{
  _QWORD **v3;
  _QWORD *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<[[String : NSNumber]]>, &demangling cache variable for type metadata for [[String : NSNumber]]);
  *v3 = result;
  return result;
}

{
  _QWORD **v3;
  _QWORD *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<[String : NSNumber]>, &demangling cache variable for type metadata for [String : NSNumber]);
  *v3 = result;
  return result;
}

{
  _QWORD **v3;
  _QWORD *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<[CGPoint]>, &demangling cache variable for type metadata for [CGPoint]);
  *v3 = result;
  return result;
}

{
  _QWORD **v3;
  _QWORD *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<[CMTag]>, &demangling cache variable for type metadata for [CMTag]);
  *v3 = result;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CMTimeRange>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8])
      memmove(v12, v13, 48 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 48 * v8);
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Float>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
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
    v10 = (char *)MEMORY[0x24BEE4AF8];
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

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CMTimeMapping>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 96);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[96 * v8])
      memmove(v12, v13, 96 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 96 * v8);
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CMVideoDimensions>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CGFloat>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 29;
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 2);
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[4 * v9])
      memmove(v14, v15, 4 * v9);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 4 * v9);
  }
  swift_release();
  return v11;
}

{
  char v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9])
      memmove(v14, v15, 8 * v9);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 8 * v9);
  }
  swift_release();
  return v11;
}

{
  char v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v9])
      memmove(v14, v15, 16 * v9);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 16 * v9);
  }
  swift_release();
  return v11;
}

_QWORD *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  int64_t v14;
  uint64_t v15;

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
    v15 = v14 - 32;
    if (v14 < 32)
      v15 = v14 - 25;
    v13[2] = v11;
    v13[3] = 2 * (v15 >> 3);
  }
  else
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v8 & 1) != 0)
  {
    if (v13 != a4 || v13 + 4 >= &a4[v11 + 4])
      memmove(v13 + 4, a4 + 4, 8 * v11);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v13;
}

_QWORD *static AVPartialAsyncProperty<A>.preferredRate.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE14E8], 0x6572726566657270, 0xED00006574615264, a4);
}

{
  uint64_t v4;

  type metadata accessor for AVAsyncProperty(0, *(_QWORD *)(v4 + 96), a1, a4);
  return AVAsyncProperty<>.init(key:)(a2, a3);
}

_QWORD *static AVPartialAsyncProperty<A>.preferredVolume.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE14E8], 0x6572726566657270, 0xEF656D756C6F5664, a4);
}

{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE14E8], 0x6572726566657270, 0xEF656D756C6F5664, a4);
}

_QWORD *static AVPartialAsyncProperty<A>.preferredTransform.getter()
{
  return static AVPartialAsyncProperty<A>.duration.getter((uint64_t (*)(uint64_t))type metadata accessor for CGAffineTransform, 0xD000000000000012, 0x8000000208391BE0);
}

{
  return static AVPartialAsyncProperty<A>.duration.getter((uint64_t (*)(uint64_t))type metadata accessor for CGAffineTransform, 0xD000000000000012, 0x8000000208391BE0);
}

_QWORD *static AVPartialAsyncProperty<A>.minimumTimeOffsetFromLive.getter()
{
  return static AVPartialAsyncProperty<A>.duration.getter((uint64_t (*)(uint64_t))type metadata accessor for CMTime, 0xD000000000000019, 0x8000000208391C00);
}

_QWORD *static AVPartialAsyncProperty<A>.providesPreciseDurationAndTiming.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE1328], 0xD000000000000020, 0x8000000208391C20, a4);
}

_QWORD *static AVPartialAsyncProperty<A>.trackGroups.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVAssetTrackGroup], 0x6F72476B63617274, 0xEB00000000737075);
}

_QWORD *static AVPartialAsyncProperty<A>.creationDate.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for AVMetadataItem?, 0x6E6F697461657263, 0xEC00000065746144);
}

_QWORD *static AVPartialAsyncProperty<A>.lyrics.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for String?, 0x73636972796CLL, 0xE600000000000000);
}

_QWORD *static AVPartialAsyncProperty<A>.commonMetadata.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVMetadataItem], 0x654D6E6F6D6D6F63, 0xEE00617461646174);
}

{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVMetadataItem], 0x654D6E6F6D6D6F63, 0xEE00617461646174);
}

_QWORD *static AVPartialAsyncProperty<A>.metadata.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVMetadataItem], 0x617461646174656DLL, 0xE800000000000000);
}

{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVMetadataItem], 0x617461646174656DLL, 0xE800000000000000);
}

_QWORD *static AVPartialAsyncProperty<A>.availableMetadataFormats.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVMetadataFormat], 0xD000000000000018, 0x8000000208391C50);
}

{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVMetadataFormat], 0xD000000000000018, 0x8000000208391C50);
}

_QWORD *static AVPartialAsyncProperty<A>.availableChapterLocales.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [Locale], 0xD000000000000017, 0x8000000208391C70);
}

uint64_t AVAsset.loadChapterMetadataGroups(withTitleLocale:containingItemsWithCommonKeys:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[17] = a2;
  v3[18] = v2;
  v3[16] = a1;
  return swift_task_switch();
}

uint64_t AVAsset.loadChapterMetadataGroups(withTitleLocale:containingItemsWithCommonKeys:)()
{
  _QWORD *v0;
  void *v1;
  Class isa;
  Class v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = (void *)v0[18];
  isa = Locale._bridgeToObjectiveC()().super.isa;
  v0[19] = isa;
  type metadata accessor for AVMetadataKey(0);
  v3 = Array._bridgeToObjectiveC()().super.isa;
  v0[20] = v3;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = AVAsset.loadChapterMetadataGroups(withTitleLocale:containingItemsWithCommonKeys:);
  v4 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v5 = v0 + 10;
  v5[1] = 0x40000000;
  v5[2] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSArray?, @unowned NSError?) -> () with result type [AVTimedMetadataGroup];
  v5[3] = &block_descriptor_1;
  v5[4] = v4;
  objc_msgSend(v1, sel_loadChapterMetadataGroupsWithTitleLocale_containingItemsWithCommonKeys_completionHandler_, isa, v3, v5);
  return swift_continuation_await();
}

{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 168) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 120);

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 160);
  v2 = *(void **)(v0 + 152);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSArray?, @unowned NSError?) -> () with result type [AVTimedMetadataGroup](uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    type metadata accessor for AVMediaSelection(0, &lazy cache variable for type metadata for AVTimedMetadataGroup);
    **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    return swift_continuation_throwingResume();
  }
}

_QWORD *static AVPartialAsyncProperty<A>.variants.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVAssetVariant], 0x73746E6169726176, 0xE800000000000000);
}

_QWORD *static AVPartialAsyncProperty<A>.availableMediaCharacteristicsWithMediaSelectionOptions.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVMediaCharacteristic], 0xD000000000000036, 0x8000000208391CB0);
}

_QWORD *static AVPartialAsyncProperty<A>.preferredMediaSelection.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = type metadata accessor for AVMediaSelection(255, &lazy cache variable for type metadata for AVMediaSelection);
  type metadata accessor for AVAsyncProperty(0, v1, v2, v3);
  return AVAsyncProperty<>.init(key:)(0xD000000000000017, 0x8000000208391CF0);
}

_QWORD *static AVPartialAsyncProperty<A>.allMediaSelections.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVMediaSelection], 0xD000000000000012, 0x8000000208391D10);
}

_QWORD *static AVPartialAsyncProperty<A>.hasProtectedContent.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE1328], 0xD000000000000013, 0x8000000208391D30, a4);
}

_QWORD *static AVPartialAsyncProperty<A>.canContainFragments.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE1328], 0xD000000000000013, 0x8000000208391D50, a4);
}

_QWORD *static AVPartialAsyncProperty<A>.containsFragments.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE1328], 0xD000000000000011, 0x8000000208391D70, a4);
}

_QWORD *static AVPartialAsyncProperty<A>.overallDurationHint.getter()
{
  return static AVPartialAsyncProperty<A>.duration.getter((uint64_t (*)(uint64_t))type metadata accessor for CMTime, 0xD000000000000013, 0x8000000208391D90);
}

_QWORD *static AVPartialAsyncProperty<A>.isPlayable.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE1328], 0x656C626179616C70, 0xE800000000000000, a4);
}

{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE1328], 0x656C626179616C70, 0xE800000000000000, a4);
}

_QWORD *static AVPartialAsyncProperty<A>.isExportable.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE1328], 0x626174726F707865, 0xEA0000000000656CLL, a4);
}

_QWORD *static AVPartialAsyncProperty<A>.isReadable.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE1328], 0x656C626164616572, 0xE800000000000000, a4);
}

_QWORD *static AVPartialAsyncProperty<A>.isComposable.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE1328], 0x6261736F706D6F63, 0xEA0000000000656CLL, a4);
}

_QWORD *static AVPartialAsyncProperty<A>.isCompatibleWithSavedPhotosAlbum.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE1328], 0xD00000000000001ELL, 0x8000000208391DB0, a4);
}

_QWORD *static AVPartialAsyncProperty<A>.isCompatibleWithAirPlayVideo.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE1328], 0xD00000000000001ALL, 0x8000000208391DD0, a4);
}

uint64_t type metadata accessor for AVMediaSelection(uint64_t a1, unint64_t *a2)
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

id AVCaption.textColor(at:)(uint64_t a1)
{
  return AVCaption.textColor(at:)(a1, (SEL *)&selRef_textColorAtIndex_range_);
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x20BD05EEC](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

id AVCaption.backgroundColor(at:)(uint64_t a1)
{
  return AVCaption.textColor(at:)(a1, (SEL *)&selRef_backgroundColorAtIndex_range_);
}

id AVCaption.textColor(at:)(uint64_t a1, SEL *a2)
{
  void *v2;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = 0;
  v9[1] = 0;
  v4 = objc_msgSend(v2, sel_text);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  lazy protocol witness table accessor for type String and conformance String();
  v5 = String.Index.utf16Offset<A>(in:)();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v2, *a2, v5, v9);
  v7 = objc_msgSend(v2, sel_text);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  Range<>.init(_:in:)();
  swift_bridgeObjectRelease();
  return v6;
}

id AVCaption.fontWeight(at:)(uint64_t a1)
{
  return AVCaption.textColor(at:)(a1, (SEL *)&selRef_fontWeightAtIndex_range_);
}

id AVCaption.fontStyle(at:)(uint64_t a1)
{
  return AVCaption.textColor(at:)(a1, (SEL *)&selRef_fontStyleAtIndex_range_);
}

id AVCaption.decoration(at:)(uint64_t a1)
{
  return AVCaption.textColor(at:)(a1, (SEL *)&selRef_decorationAtIndex_range_);
}

id AVCaption.textCombine(at:)(uint64_t a1)
{
  return AVCaption.textColor(at:)(a1, (SEL *)&selRef_textCombineAtIndex_range_);
}

id AVCaption.ruby(at:)()
{
  void *v0;
  id v1;
  uint64_t v2;
  id v3;
  id v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = 0;
  v6[1] = 0;
  v1 = objc_msgSend(v0, sel_text);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  lazy protocol witness table accessor for type String and conformance String();
  v2 = String.Index.utf16Offset<A>(in:)();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v0, sel_rubyAtIndex_range_, v2, v6);
  v4 = objc_msgSend(v0, sel_text);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  Range<>.init(_:in:)();
  swift_bridgeObjectRelease();
  return v3;
}

Swift::Void __swiftcall AVMutableCaption.setTextColor(_:in:)(CGColorRef _, _NSRange in)
{
  void *v2;

  objc_msgSend(v2, sel_setTextColor_inRange_, _, in.location, in.length);
}

Swift::Void __swiftcall AVMutableCaption.setBackgroundColor(_:in:)(CGColorRef _, _NSRange in)
{
  void *v2;

  objc_msgSend(v2, sel_setBackgroundColor_inRange_, _, in.location, in.length);
}

Swift::Void __swiftcall AVMutableCaption.setFontWeight(_:in:)(AVCaptionFontWeight _, _NSRange in)
{
  void *v2;

  objc_msgSend(v2, sel_setFontWeight_inRange_, _, in.location, in.length);
}

Swift::Void __swiftcall AVMutableCaption.setFontStyle(_:in:)(AVCaptionFontStyle _, _NSRange in)
{
  void *v2;

  objc_msgSend(v2, sel_setFontStyle_inRange_, _, in.location, in.length);
}

Swift::Void __swiftcall AVMutableCaption.setDecoration(_:in:)(AVCaptionDecoration _, _NSRange in)
{
  void *v2;

  objc_msgSend(v2, sel_setDecoration_inRange_, _, in.location, in.length);
}

Swift::Void __swiftcall AVMutableCaption.setTextCombine(_:in:)(AVCaptionTextCombine _, _NSRange in)
{
  void *v2;

  objc_msgSend(v2, sel_setTextCombine_inRange_, _, in.location, in.length);
}

Swift::Void __swiftcall AVMutableCaption.setRuby(_:in:)(AVCaptionRuby _, _NSRange in)
{
  void *v2;

  objc_msgSend(v2, sel_setRuby_inRange_, _.super.isa, in.location, in.length);
}

Swift::Void __swiftcall AVMutableCaption.removeTextColor(in:)(_NSRange in)
{
  void *v1;

  objc_msgSend(v1, sel_removeTextColorInRange_, in.location, in.length);
}

Swift::Void __swiftcall AVMutableCaption.removeBackgroundColor(in:)(_NSRange in)
{
  void *v1;

  objc_msgSend(v1, sel_removeBackgroundColorInRange_, in.location, in.length);
}

Swift::Void __swiftcall AVMutableCaption.removeFontWeight(in:)(_NSRange in)
{
  void *v1;

  objc_msgSend(v1, sel_removeFontWeightInRange_, in.location, in.length);
}

Swift::Void __swiftcall AVMutableCaption.removeFontStyle(in:)(_NSRange in)
{
  void *v1;

  objc_msgSend(v1, sel_removeFontStyleInRange_, in.location, in.length);
}

Swift::Void __swiftcall AVMutableCaption.removeDecoration(in:)(_NSRange in)
{
  void *v1;

  objc_msgSend(v1, sel_removeDecorationInRange_, in.location, in.length);
}

Swift::Void __swiftcall AVMutableCaption.removeTextCombine(in:)(_NSRange in)
{
  void *v1;

  objc_msgSend(v1, sel_removeTextCombineInRange_, in.location, in.length);
}

Swift::Void __swiftcall AVMutableCaption.removeRuby(in:)(_NSRange in)
{
  void *v1;

  objc_msgSend(v1, sel_removeRubyInRange_, in.location, in.length);
}

char *_sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSaySo7NSValueCG_So11CMTimeRangeas5NeverOTg5084_sSo37AVMetricPlayerItemLikelyToKeepUpEventC12AVFoundationE16loadedTimeRangesSaySo11e14RangeaGvgAFSo7D52Ccfu_32e1aaa32c9642607d0b6314623c7365cfAiFTf3nnnpk_nTf1cn_nTm(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t v5;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (a1 >> 62)
    goto LABEL_15;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v3 = MEMORY[0x24BEE4AF8];
    if (!v2)
      return (char *)v3;
    v16 = MEMORY[0x24BEE4AF8];
    result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0)
      break;
    v5 = 0;
    v3 = v16;
    while (v2 != v5)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x20BD059B8](v5, a1);
      else
        v6 = *(id *)(a1 + 8 * v5 + 32);
      v7 = v6;
      objc_msgSend(v6, sel_CMTimeRangeValue);

      v9 = *(_QWORD *)(v16 + 16);
      v8 = *(_QWORD *)(v16 + 24);
      if (v9 >= v8 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v8 > 1), v9 + 1, 1);
      *(_QWORD *)(v16 + 16) = v9 + 1;
      v10 = v16 + 48 * v9;
      *(_QWORD *)(v10 + 32) = v11;
      ++v5;
      *(_QWORD *)(v10 + 40) = v12;
      *(_OWORD *)(v10 + 48) = v13;
      *(_QWORD *)(v10 + 64) = v14;
      *(_QWORD *)(v10 + 72) = v15;
      if (v2 == v5)
        return (char *)v3;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t AVMetricEventStreamPublisher.metrics<A>(forType:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)a2 = v2;
  *(_QWORD *)(a2 + 8) = a1;
  *(_BYTE *)(a2 + 16) = 0;
  return swift_unknownObjectRetain();
}

uint64_t AVMetrics.init(forType:publisher:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = a2;
  *(_QWORD *)(a3 + 8) = result;
  *(_BYTE *)(a3 + 16) = 0;
  return result;
}

uint64_t AVMetricEventStreamPublisher.allMetrics()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  return swift_unknownObjectRetain();
}

uint64_t AVMetrics.SubscriberDelegate.__allocating_init(streamContinuation:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = swift_allocObject();
  v3 = v2 + *(_QWORD *)(*(_QWORD *)v2 + 88);
  v4 = type metadata accessor for AsyncStream.Continuation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(v3, a1, v4);
  return v2;
}

uint64_t AVMetrics.SubscriberDelegate.init(streamContinuation:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 88);
  v4 = type metadata accessor for AsyncStream.Continuation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(v3, a1, v4);
  return v1;
}

uint64_t @objc AVMetrics.SubscriberDelegate.publisher(_:didReceive:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;

  swift_unknownObjectRetain();
  v5 = a4;
  swift_retain();
  specialized AVMetrics.SubscriberDelegate.publisher(_:didReceive:)(v5);
  swift_unknownObjectRelease();

  return swift_release();
}

uint64_t AVMetrics.SubscriberDelegate.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 88);
  v2 = type metadata accessor for AsyncStream.Continuation();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t AVMetrics.SubscriberDelegate.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 88);
  v2 = type metadata accessor for AsyncStream.Continuation();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t AVMetrics.makeAsyncIterator()@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v4 = *(_QWORD *)v2;
  if (*(_BYTE *)(v2 + 16) == 1)
  {
    v5 = *(_QWORD *)(a1 + 16);
    v6 = swift_unknownObjectRetain();
    return AVMetrics.AsyncIterator.init(allMetricsForPublisher:)(v6, v5, a2);
  }
  else if (*(_QWORD *)(v2 + 8))
  {
    v8 = *(_QWORD *)(a1 + 16);
    swift_unknownObjectRetain();
    return AVMetrics.AsyncIterator.init(forType:publisher:)(v4, v8, a2);
  }
  else
  {
    return AVMetrics.AsyncIterator.init()(*(_QWORD *)(a1 + 16), a2);
  }
}

uint64_t AVMetrics.AsyncIterator.init(allMetricsForPublisher:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  void *v5;
  id v6;

  AVMetrics.AsyncIterator.init()(a2, a3);
  v5 = *(void **)a3;
  objc_msgSend(v5, sel_addPublisher_, a1);
  v6 = v5;
  objc_msgSend(v6, sel_subscribeToAllMetricEvents);

  return swift_unknownObjectRelease();
}

uint64_t AVMetrics.AsyncIterator.init(forType:publisher:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char *a3@<X8>)
{
  void *v5;
  uint64_t ObjCClassFromMetadata;
  id v7;

  AVMetrics.AsyncIterator.init()(a2, a3);
  v5 = *(void **)a3;
  objc_msgSend(v5, sel_addPublisher_, a1);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v7 = v5;
  objc_msgSend(v7, sel_subscribeToMetricEvent_, ObjCClassFromMetadata);

  return swift_unknownObjectRelease();
}

uint64_t AVMetrics.AsyncIterator.init()@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  id v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v32;
  uint64_t v33;
  id v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v39 = type metadata accessor for AsyncStream.Continuation.BufferingPolicy();
  v37 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v36 = (char *)&v32 - v4;
  v5 = type metadata accessor for AsyncStream.Continuation();
  v41 = *(_QWORD *)(v5 - 8);
  v42 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v32 - v6;
  v40 = type metadata accessor for AsyncStream();
  v38 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v35 = (char *)&v32 - v8;
  v9 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v32 = *(_QWORD *)(v9 - 8);
  v33 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x24BDAC7A8](v12);
  v13 = type metadata accessor for DispatchQoS();
  MEMORY[0x24BDAC7A8](v13);
  v14 = objc_msgSend((id)objc_opt_self(), sel_eventStream);
  *(_QWORD *)a2 = v14;
  type metadata accessor for AVMediaSelection(0, &lazy cache variable for type metadata for OS_dispatch_queue);
  v34 = v14;
  static DispatchQoS.unspecified.getter();
  v43 = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, _QWORD, uint64_t))(v32 + 104))(v11, *MEMORY[0x24BEE5750], v33);
  v15 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *((_QWORD *)a2 + 2) = v15;
  v17 = v36;
  v16 = v37;
  v18 = v39;
  (*(void (**)(char *, _QWORD, uint64_t))(v37 + 104))(v36, *MEMORY[0x24BEE6A10], v39);
  v19 = v15;
  v20 = v35;
  static AsyncStream.makeStream(of:bufferingPolicy:)();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v17, v18);
  v23 = type metadata accessor for AVMetrics.AsyncIterator(0, a1, v21, v22);
  (*(void (**)(char *, char *, uint64_t))(v38 + 32))(&a2[*(int *)(v23 + 36)], v20, v40);
  v24 = &a2[*(int *)(v23 + 40)];
  v26 = v41;
  v25 = v42;
  (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v24, v7, v42);
  type metadata accessor for AVMetrics.SubscriberDelegate(0, a1, v27, v28);
  (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v7, v24, v25);
  v29 = AVMetrics.SubscriberDelegate.__allocating_init(streamContinuation:)((uint64_t)v7);
  *((_QWORD *)a2 + 1) = v29;
  swift_retain();
  v30 = v34;
  objc_msgSend(v34, sel_setSubscriber_queue_, v29, v19);

  swift_release();
  return AsyncStream.makeAsyncIterator()();
}

uint64_t AVMetrics.AsyncIterator.next()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  type metadata accessor for AsyncStream.Iterator();
  *v1 = v0;
  v1[1] = AVMetrics.AsyncIterator.next();
  return AsyncStream.Iterator.next()();
}

{
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance AVMetrics<A>.AsyncIterator(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 16) = a1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = protocol witness for AsyncIteratorProtocol.next() in conformance AVMetrics<A>.AsyncIterator;
  return AVMetrics.AsyncIterator.next()();
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (!v1)
    **(_QWORD **)(v4 + 16) = a1;
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t _s12AVFoundation9AVMetricsV13AsyncIteratorVyx_GScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTW(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  *(_QWORD *)(v4 + 24) = a4;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 32) = v5;
  *v5 = v4;
  v5[1] = _s12AVFoundation9AVMetricsV13AsyncIteratorVyx_GScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_;
  return _sScIsE4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKF();
}

id AVMetrics.enableSubscription(forMetricEventStream:)(void *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  int v5;
  id result;

  v3 = *v1;
  v4 = v1[1];
  v5 = *((unsigned __int8 *)v1 + 16);
  result = objc_msgSend(a1, sel_addPublisher_, v3);
  if (v5 == 1)
    return objc_msgSend(a1, sel_subscribeToAllMetricEvents);
  if (v4)
  {
    swift_getObjCClassFromMetadata();
    return objc_msgSend(a1, sel_subscribeToMetricEvent_);
  }
  return result;
}

void AVMetrics.chronologicalMerge<A, B>(with:_:)(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v7;
  uint64_t *v11;
  uint64_t v12;
  uint64_t TupleTypeMetadata;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char **v28;
  int *v29;
  char **v30;
  uint64_t v31;
  int v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  _QWORD v38[2];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  _QWORD v46[2];
  char v47;

  v11 = (uint64_t *)(a6 & 0xFFFFFFFFFFFFFFFELL);
  v12 = 8 * a4;
  v41 = a5;
  v42 = a6;
  v39 = a3;
  v40 = a7;
  if (a4 == 1)
  {
    TupleTypeMetadata = type metadata accessor for AVMetrics(0, *v11, a3, 1);
  }
  else
  {
    MEMORY[0x24BDAC7A8](a1);
    if (a4)
    {
      v16 = (_QWORD *)((char *)v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
      v17 = a4;
      do
      {
        v18 = *v11++;
        *v16++ = type metadata accessor for AVMetrics(255, v18, v14, v15);
        --v17;
      }
      while (v17);
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  v19 = MEMORY[0x24BDAC7A8](TupleTypeMetadata);
  v21 = (char *)v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38[1] = v38;
  v23 = *a1;
  v22 = a1[1];
  v24 = *((_BYTE *)a1 + 16);
  v25 = *(_QWORD *)(v7 + 8);
  v26 = *(_BYTE *)(v7 + 16);
  v46[0] = *(_QWORD *)v7;
  v46[1] = v25;
  v47 = v26;
  v43 = v23;
  v44 = v22;
  v45 = v24;
  v27 = MEMORY[0x24BDAC7A8](v19);
  v28 = (char **)((char *)v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a4)
  {
    v29 = (int *)(v27 + 32);
    v30 = v28;
    v31 = a4;
    do
    {
      if (a4 == 1)
        v32 = 0;
      else
        v32 = *v29;
      v33 = &v21[v32];
      v34 = *a2++;
      v35 = *(_QWORD *)(v34 + 8);
      v36 = *(_BYTE *)(v34 + 16);
      *(_QWORD *)v33 = *(_QWORD *)v34;
      *((_QWORD *)v33 + 1) = v35;
      v33[16] = v36;
      *v30++ = v33;
      swift_unknownObjectRetain();
      v29 += 4;
      --v31;
    }
    while (v31);
  }
  v37 = *(_QWORD *)(v39 + 16);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  AVMergedMetrics.init(chronologicallyMerging:_:_:)((uint64_t)v46, (uint64_t)v28, a4, v37, v41, v42, v40);
}

uint64_t type metadata accessor for AVMetrics(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AVMetrics);
}

void AVMergedMetrics.init(chronologicallyMerging:_:_:)(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v8;
  uint64_t *v11;
  uint64_t TupleTypeMetadata;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t *v17;
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

  v8 = a5;
  v22 = a7;
  v23 = a2;
  v11 = (uint64_t *)(a6 & 0xFFFFFFFFFFFFFFFELL);
  if (a3 == 1)
  {
    TupleTypeMetadata = type metadata accessor for AVMetrics(0, *v11, a2, 1);
  }
  else
  {
    v20 = (uint64_t)&v20;
    v21 = a5;
    MEMORY[0x24BDAC7A8](a1);
    v16 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
    if (a3)
    {
      v17 = (uint64_t *)((char *)&v20 - v16);
      v18 = a3;
      do
      {
        v19 = *v11++;
        *v17++ = type metadata accessor for AVMetrics(255, v19, v13, v14);
        --v18;
      }
      while (v18);
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    v8 = v21;
  }
  MEMORY[0x24BDAC7A8](TupleTypeMetadata);
  v24 = a3;
  v25 = a4;
  v26 = v8;
  v27 = a6;
  type metadata accessor for AVMergedMetrics();
}

uint64_t protocol witness for AsyncSequence.makeAsyncIterator() in conformance AVMetrics<A>@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  AVMetrics.makeAsyncIterator()(a1, a2);
  return swift_unknownObjectRelease();
}

uint64_t AVMergedMetrics.SubscriberDelegate.__allocating_init(streamContinuation:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = swift_allocObject();
  v3 = v2 + direct field offset for AVMergedMetrics.SubscriberDelegate.streamContinuation;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(v3, a1, v4);
  return v2;
}

uint64_t AVMergedMetrics.SubscriberDelegate.init(streamContinuation:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + direct field offset for AVMergedMetrics.SubscriberDelegate.streamContinuation;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(v3, a1, v4);
  return v1;
}

uint64_t AVMergedMetrics.SubscriberDelegate.publisher(_:didReceive:)(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  _QWORD v10[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation.YieldResult);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[0] = a2;
  v10[1] = a1;
  v8 = a2;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  AsyncStream.Continuation.yield(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t @objc AVMergedMetrics.SubscriberDelegate.publisher(_:didReceive:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;

  swift_unknownObjectRetain();
  v6 = a4;
  swift_retain();
  AVMergedMetrics.SubscriberDelegate.publisher(_:didReceive:)(a3, v6);
  swift_unknownObjectRelease();

  return swift_release();
}

uint64_t AVMergedMetrics.SubscriberDelegate.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + direct field offset for AVMergedMetrics.SubscriberDelegate.streamContinuation;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t AVMergedMetrics.SubscriberDelegate.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + direct field offset for AVMergedMetrics.SubscriberDelegate.streamContinuation;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

void AVMergedMetrics.makeAsyncIterator()(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t TupleTypeMetadata;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  int *v29;
  char **v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  char v51;

  v6 = *(_QWORD *)(a1 + 16);
  v7 = 8 * v6;
  v45 = a4;
  if (v6 == 1)
  {
    TupleTypeMetadata = type metadata accessor for AVMetrics(0, *(_QWORD *)(*(_QWORD *)(a1 + 40) & 0xFFFFFFFFFFFFFELL), a2, a3);
    v9 = TupleTypeMetadata;
  }
  else
  {
    MEMORY[0x24BDAC7A8](a1);
    if (v6)
    {
      v12 = (uint64_t *)(*(_QWORD *)(a1 + 40) & 0xFFFFFFFFFFFFFFFELL);
      v13 = (uint64_t *)((char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
      v14 = v6;
      do
      {
        v15 = *v12++;
        *v13++ = type metadata accessor for AVMetrics(255, v15, v10, v11);
        --v14;
      }
      while (v14);
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    v9 = TupleTypeMetadata;
  }
  v16 = MEMORY[0x24BDAC7A8](TupleTypeMetadata);
  v18 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = &v40;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v40 - v20;
  v42 = &v40;
  v22 = v4[1];
  v23 = *((_BYTE *)v4 + 16);
  v41 = *v4;
  v49 = v41;
  v50 = v22;
  v51 = v23;
  v24 = v4[4];
  v25 = *((_BYTE *)v4 + 40);
  v46 = v4[3];
  v47 = v24;
  v48 = v25;
  MEMORY[0x24BDAC7A8](v19);
  v26 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = (uint64_t)v4 + *(int *)(a1 + 56);
  v44 = v28;
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v18, v27, v9);
  if (v6)
  {
    v29 = (int *)(v9 + 32);
    v30 = (char **)((char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
    v31 = v6;
    do
    {
      if (v6 == 1)
      {
        LODWORD(v32) = 0;
        v33 = v21;
      }
      else
      {
        v32 = *v29;
        v33 = &v21[v32];
      }
      v34 = &v18[(int)v32];
      v35 = *(_QWORD *)v34;
      v36 = *((_QWORD *)v34 + 1);
      LOBYTE(v34) = v34[16];
      *(_QWORD *)v33 = v35;
      *((_QWORD *)v33 + 1) = v36;
      v33[16] = (char)v34;
      *v30++ = v33;
      swift_unknownObjectRetain();
      v29 += 4;
      --v31;
    }
    while (v31);
  }
  v37 = *(_QWORD *)(a1 + 24);
  v38 = *(_QWORD *)(a1 + 32);
  v39 = *(_QWORD *)(a1 + 40);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  AVMergedMetrics.AsyncIterator.init(chronologicallyMerging:_:_:)((uint64_t)v26, v6, v37, v38, v39, v45);
}

uint64_t sub_20837BC88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 144) + 8))(v1, v0);
}

void AVMergedMetrics.AsyncIterator.init(chronologicallyMerging:_:_:)(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
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

  v23 = a5;
  v22 = a4;
  v21 = a3;
  v19[0] = a1;
  v33 = a6;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation.BufferingPolicy);
  v29 = *(_QWORD *)(v10 - 8);
  v30 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v26 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  v31 = *(_QWORD *)(v12 - 8);
  v32 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v25 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>);
  v27 = *(_QWORD *)(v14 - 8);
  v28 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v24 = (char *)v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v19[3] = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v19[2] = (char *)v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x24BDAC7A8](v17);
  v18 = type metadata accessor for DispatchQoS();
  MEMORY[0x24BDAC7A8](v18);
  v34 = a2;
  v35 = a3;
  v36 = a4;
  v37 = a5;
  type metadata accessor for AVMergedMetrics.AsyncIterator();
}

uint64_t AVMergedMetrics.AsyncIterator.next()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Iterator);
  *v1 = v0;
  v1[1] = AVMergedMetrics.AsyncIterator.next();
  return AsyncStream.Iterator.next()();
}

{
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance AVMergedMetrics<A, B, Pack{repeat C}>.AsyncIterator(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 16) = a1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = protocol witness for AsyncIteratorProtocol.next() in conformance AVMergedMetrics<A, B, Pack{repeat C}>.AsyncIterator;
  return AVMergedMetrics.AsyncIterator.next()();
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance AVMergedMetrics<A, B, Pack{repeat C}>.AsyncIterator(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = *v3;
  v7 = *v3;
  swift_task_dealloc();
  if (!v2)
  {
    v8 = *(_QWORD **)(v6 + 16);
    *v8 = a1;
    v8[1] = a2;
  }
  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t _s12AVFoundation15AVMergedMetricsV13AsyncIteratorVyxq_q0_q0_Qp_QP_GScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTW(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  *(_QWORD *)(v4 + 24) = a4;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 32) = v5;
  *v5 = v4;
  v5[1] = _s12AVFoundation15AVMergedMetricsV13AsyncIteratorVyxq_q0_q0_Qp_QP_GScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_;
  return _sScIsE4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKF();
}

uint64_t _s12AVFoundation15AVMergedMetricsV13AsyncIteratorVyxq_q0_q0_Qp_QP_GScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  v3 = *v1;
  swift_task_dealloc();
  if (v0)
    **(_QWORD **)(v2 + 24) = *(_QWORD *)(v2 + 16);
  return (*(uint64_t (**)(void))(v3 + 8))();
}

void protocol witness for AsyncSequence.makeAsyncIterator() in conformance AVMergedMetrics<A, B, Pack{repeat C}>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  AVMergedMetrics.makeAsyncIterator()(a1, a2, a3, a4);
}

uint64_t sub_20837C524()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 8))(v1, v0);
}

char *AVMetricPlayerItemLikelyToKeepUpEvent.loadedTimeRanges.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  char *v3;

  v1 = objc_msgSend(v0, sel_loadedTimeRanges);
  type metadata accessor for AVMediaSelection(0, (unint64_t *)&lazy cache variable for type metadata for NSValue);
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v3 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSaySo7NSValueCG_So11CMTimeRangeas5NeverOTg5084_sSo37AVMetricPlayerItemLikelyToKeepUpEventC12AVFoundationE16loadedTimeRangesSaySo11e14RangeaGvgAFSo7D52Ccfu_32e1aaa32c9642607d0b6314623c7365cfAiFTf3nnnpk_nTf1cn_nTm(v2);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t associated type witness table accessor for AsyncIteratorProtocol.Failure : Error in AVMetrics<A>.AsyncIterator()
{
  return MEMORY[0x24BEE3F20];
}

void associated type witness table accessor for AsyncSequence.AsyncIterator : AsyncIteratorProtocol in AVMetrics<A>()
{
  JUMPOUT(0x20BD05EECLL);
}

void associated type witness table accessor for AsyncSequence.AsyncIterator : AsyncIteratorProtocol in AVMergedMetrics<A, B, Pack{repeat C}>()
{
  JUMPOUT(0x20BD05EECLL);
}

uint64_t destroy for AVMetrics()
{
  return swift_unknownObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for AVMetrics(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_unknownObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AVMetrics(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AVMetrics(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVMetrics(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AVMetrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
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
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata completion function for AVMetrics.SubscriberDelegate()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for AsyncStream.Continuation();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for AVMetrics.SubscriberDelegate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AVMetrics.SubscriberDelegate);
}

uint64_t type metadata instantiation function for AVMetrics.AsyncIterator()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for AVMetrics.AsyncIterator()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = type metadata accessor for AsyncStream();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for AsyncStream.Continuation();
    if (v2 <= 0x3F)
    {
      result = type metadata accessor for AsyncStream.Iterator();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for AVMetrics.AsyncIterator(char *a1, char **a2, int *a3)
{
  int v3;
  char *v4;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v24;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a2[2];
    *((_QWORD *)a1 + 1) = a2[1];
    *((_QWORD *)a1 + 2) = v8;
    v9 = a3[9];
    v24 = &a1[v9];
    v10 = (uint64_t)a2 + v9;
    v11 = type metadata accessor for AsyncStream();
    v12 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    v13 = v4;
    swift_unknownObjectRetain();
    v14 = v8;
    v12(v24, v10, v11);
    v15 = a3[10];
    v16 = &v7[v15];
    v17 = (uint64_t)a2 + v15;
    v18 = type metadata accessor for AsyncStream.Continuation();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
    v19 = a3[11];
    v20 = &v7[v19];
    v21 = (uint64_t)a2 + v19;
    v22 = type metadata accessor for AsyncStream.Iterator();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
  }
  return v7;
}

uint64_t destroy for AVMetrics.AsyncIterator(id *a1, int *a2)
{
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  swift_unknownObjectRelease();
  v4 = (char *)a1 + a2[9];
  v5 = type metadata accessor for AsyncStream();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = (char *)a1 + a2[10];
  v7 = type metadata accessor for AsyncStream.Continuation();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)a1 + a2[11];
  v9 = type metadata accessor for AsyncStream.Iterator();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

_QWORD *initializeWithCopy for AVMetrics.AsyncIterator(_QWORD *a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  id v13;
  id v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v24;

  v7 = *(void **)a2;
  v6 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v6;
  v8 = *(void **)(a2 + 16);
  a1[2] = v8;
  v9 = a3[9];
  v24 = (char *)a1 + v9;
  v10 = a2 + v9;
  v11 = type metadata accessor for AsyncStream();
  v12 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  v13 = v7;
  swift_unknownObjectRetain();
  v14 = v8;
  v12(v24, v10, v11);
  v15 = a3[10];
  v16 = (char *)a1 + v15;
  v17 = a2 + v15;
  v18 = type metadata accessor for AsyncStream.Continuation();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  v19 = a3[11];
  v20 = (char *)a1 + v19;
  v21 = a2 + v19;
  v22 = type metadata accessor for AsyncStream.Iterator();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
  return a1;
}

uint64_t assignWithCopy for AVMetrics.AsyncIterator(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
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

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v9 = *(void **)(a2 + 16);
  v10 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v9;
  v11 = v9;

  v12 = a3[9];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = type metadata accessor for AsyncStream();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v16 = a3[10];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = type metadata accessor for AsyncStream.Continuation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  v20 = a3[11];
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = type metadata accessor for AsyncStream.Iterator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 24))(v21, v22, v23);
  return a1;
}

uint64_t initializeWithTake for AVMetrics.AsyncIterator(uint64_t a1, uint64_t a2, int *a3)
{
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

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = a3[9];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = type metadata accessor for AsyncStream();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[10];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = type metadata accessor for AsyncStream.Continuation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  v14 = a3[11];
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = type metadata accessor for AsyncStream.Iterator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
  return a1;
}

uint64_t assignWithTake for AVMetrics.AsyncIterator(uint64_t a1, _QWORD *a2, int *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  swift_unknownObjectRelease();
  v7 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = a2[2];

  v8 = a3[9];
  v9 = a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for AsyncStream();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = a3[10];
  v13 = a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = type metadata accessor for AsyncStream.Continuation();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = a3[11];
  v17 = a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = type metadata accessor for AsyncStream.Iterator();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVMetrics.AsyncIterator()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20837CEB4(char *a1, uint64_t a2, int *a3)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for AsyncStream();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = a3[9];
    }
    else
    {
      v12 = type metadata accessor for AsyncStream.Continuation();
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
      {
        v10 = v12;
        v11 = a3[10];
      }
      else
      {
        v10 = type metadata accessor for AsyncStream.Iterator();
        v9 = *(_QWORD *)(v10 - 8);
        v11 = a3[11];
      }
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(&a1[v11], a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for AVMetrics.AsyncIterator()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_20837CF94(char *result, uint64_t a2, int a3, int *a4)
{
  char *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v8 = type metadata accessor for AsyncStream();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = a4[9];
    }
    else
    {
      v12 = type metadata accessor for AsyncStream.Continuation();
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == a3)
      {
        v10 = v12;
        v11 = a4[10];
      }
      else
      {
        v10 = type metadata accessor for AsyncStream.Iterator();
        v9 = *(_QWORD *)(v10 - 8);
        v11 = a4[11];
      }
    }
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

uint64_t type metadata accessor for AVMetrics.AsyncIterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AVMetrics.AsyncIterator);
}

uint64_t type metadata instantiation function for AVMergedMetrics()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for AVMergedMetrics(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t TupleTypeMetadata;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD v18[4];

  v18[1] = &unk_20838EC60;
  v18[2] = &unk_20838EC60;
  v5 = *(_QWORD *)(a1 + 16);
  if (v5 == 1)
  {
    TupleTypeMetadata = type metadata accessor for AVMetrics(319, *(_QWORD *)(*(_QWORD *)(a1 + 40) & 0xFFFFFFFFFFFFFELL), a3, a4);
    if (v7 > 0x3F)
      return TupleTypeMetadata;
    TupleTypeMetadata = swift_checkMetadataState();
    if (v8 > 0x3F)
      return TupleTypeMetadata;
LABEL_9:
    v18[3] = *(_QWORD *)(TupleTypeMetadata - 8) + 64;
    swift_initStructMetadata();
    return 0;
  }
  MEMORY[0x24BDAC7A8](a1);
  if (v5)
  {
    v12 = (uint64_t *)(*(_QWORD *)(a1 + 40) & 0xFFFFFFFFFFFFFFFELL);
    v13 = (_QWORD *)((char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
    v14 = v5;
    do
    {
      v15 = *v12++;
      *v13++ = type metadata accessor for AVMetrics(255, v15, v9, v10);
      --v14;
    }
    while (v14);
  }
  TupleTypeMetadata = swift_getTupleTypeMetadata();
  if (v16 <= 0x3F)
    goto LABEL_9;
  return TupleTypeMetadata;
}

uint64_t initializeBufferWithCopyOfBuffer for AVMergedMetrics(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t TupleTypeMetadata;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    *(_QWORD *)(a1 + 8) = a2[1];
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    v7 = a2[4];
    *(_QWORD *)(a1 + 24) = a2[3];
    *(_QWORD *)(a1 + 32) = v7;
    *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
    v8 = *(int *)(a3 + 56);
    v9 = a1 + v8;
    v10 = (uint64_t)a2 + v8;
    v11 = *(_QWORD *)(a3 + 16);
    swift_unknownObjectRetain();
    v12 = swift_unknownObjectRetain();
    if (v11 == 1)
    {
      TupleTypeMetadata = type metadata accessor for AVMetrics(0, *(_QWORD *)(*(_QWORD *)(a3 + 40) & 0xFFFFFFFFFFFFFELL), v13, v14);
    }
    else
    {
      MEMORY[0x24BDAC7A8](v12);
      if (v11)
      {
        v19 = (uint64_t *)(*(_QWORD *)(a3 + 40) & 0xFFFFFFFFFFFFFFFELL);
        v20 = (uint64_t *)((char *)&v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
        v21 = v11;
        do
        {
          v22 = *v19++;
          *v20++ = type metadata accessor for AVMetrics(255, v22, v16, v17);
          --v21;
        }
        while (v21);
      }
      TupleTypeMetadata = swift_getTupleTypeMetadata();
    }
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata - 8) + 16))(v9, v10);
  }
  return a1;
}

uint64_t destroy for AVMergedMetrics(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t TupleTypeMetadata;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  swift_unknownObjectRelease();
  v4 = swift_unknownObjectRelease();
  v7 = *(int *)(a2 + 56);
  v8 = *(_QWORD *)(a2 + 16);
  if (v8 == 1)
  {
    TupleTypeMetadata = type metadata accessor for AVMetrics(0, *(_QWORD *)(*(_QWORD *)(a2 + 40) & 0xFFFFFFFFFFFFFELL), v5, v6);
  }
  else
  {
    MEMORY[0x24BDAC7A8](v4);
    if (v8)
    {
      v13 = (uint64_t *)(*(_QWORD *)(a2 + 40) & 0xFFFFFFFFFFFFFFFELL);
      v14 = (uint64_t *)((char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
      v15 = v8;
      do
      {
        v16 = *v13++;
        *v14++ = type metadata accessor for AVMetrics(255, v16, v10, v11);
        --v15;
      }
      while (v15);
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(TupleTypeMetadata - 8) + 8))(a1 + v7);
}

uint64_t initializeWithCopy for AVMergedMetrics(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t TupleTypeMetadata;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v8 = *(int *)(a3 + 56);
  v9 = *(_QWORD *)(a3 + 16);
  swift_unknownObjectRetain();
  v10 = swift_unknownObjectRetain();
  if (v9 == 1)
  {
    TupleTypeMetadata = type metadata accessor for AVMetrics(0, *(_QWORD *)(*(_QWORD *)(a3 + 40) & 0xFFFFFFFFFFFFFELL), v11, v12);
  }
  else
  {
    MEMORY[0x24BDAC7A8](v10);
    if (v9)
    {
      v17 = (uint64_t *)(*(_QWORD *)(a3 + 40) & 0xFFFFFFFFFFFFFFFELL);
      v18 = (uint64_t *)((char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
      v19 = v9;
      do
      {
        v20 = *v17++;
        *v18++ = type metadata accessor for AVMetrics(255, v20, v14, v15);
        --v19;
      }
      while (v19);
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata - 8) + 16))(a1 + v8, a2 + v8);
  return a1;
}

uint64_t assignWithCopy for AVMergedMetrics(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t TupleTypeMetadata;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_unknownObjectRetain();
  v6 = swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v9 = *(int *)(a3 + 56);
  v10 = *(_QWORD *)(a3 + 16);
  if (v10 == 1)
  {
    TupleTypeMetadata = type metadata accessor for AVMetrics(0, *(_QWORD *)(*(_QWORD *)(a3 + 40) & 0xFFFFFFFFFFFFFELL), v7, v8);
  }
  else
  {
    MEMORY[0x24BDAC7A8](v6);
    if (v10)
    {
      v15 = (uint64_t *)(*(_QWORD *)(a3 + 40) & 0xFFFFFFFFFFFFFFFELL);
      v16 = (uint64_t *)((char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
      v17 = v10;
      do
      {
        v18 = *v15++;
        *v16++ = type metadata accessor for AVMetrics(255, v18, v12, v13);
        --v17;
      }
      while (v17);
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata - 8) + 24))(a1 + v9, a2 + v9);
  return a1;
}

uint64_t initializeWithTake for AVMergedMetrics(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t TupleTypeMetadata;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v6 = *(int *)(a3 + 56);
  v7 = *(_QWORD *)(a3 + 16);
  if (v7 == 1)
  {
    TupleTypeMetadata = type metadata accessor for AVMetrics(0, *(_QWORD *)(*(_QWORD *)(a3 + 40) & 0xFFFFFFFFFFFFFELL), a3, a4);
  }
  else
  {
    MEMORY[0x24BDAC7A8](a1);
    if (v7)
    {
      v12 = (uint64_t *)(*(_QWORD *)(v9 + 40) & 0xFFFFFFFFFFFFFFFELL);
      v13 = (uint64_t *)((char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
      v14 = v7;
      do
      {
        v15 = *v12++;
        *v13++ = type metadata accessor for AVMetrics(255, v15, v9, v10);
        --v14;
      }
      while (v14);
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata - 8) + 32))(a1 + v6, a2 + v6);
  return a1;
}

uint64_t assignWithTake for AVMergedMetrics(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t TupleTypeMetadata;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v6 = swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v9 = *(int *)(a3 + 56);
  v10 = *(_QWORD *)(a3 + 16);
  if (v10 == 1)
  {
    TupleTypeMetadata = type metadata accessor for AVMetrics(0, *(_QWORD *)(*(_QWORD *)(a3 + 40) & 0xFFFFFFFFFFFFFELL), v7, v8);
  }
  else
  {
    MEMORY[0x24BDAC7A8](v6);
    if (v10)
    {
      v15 = (uint64_t *)(*(_QWORD *)(a3 + 40) & 0xFFFFFFFFFFFFFFFELL);
      v16 = (uint64_t *)((char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
      v17 = v10;
      do
      {
        v18 = *v15++;
        *v16++ = type metadata accessor for AVMetrics(255, v18, v12, v13);
        --v17;
      }
      while (v17);
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata - 8) + 40))(a1 + v9, a2 + v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVMergedMetrics()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20837D91C(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t TupleTypeMetadata;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v5 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v5) = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = *(_QWORD *)(a3 + 16);
    if (v9 == 1)
    {
      TupleTypeMetadata = type metadata accessor for AVMetrics(0, *(_QWORD *)(*(_QWORD *)(a3 + 40) & 0xFFFFFFFFFFFFFELL), a3, a4);
    }
    else
    {
      MEMORY[0x24BDAC7A8](a1);
      if (v9)
      {
        v14 = (uint64_t *)(*(_QWORD *)(a3 + 40) & 0xFFFFFFFFFFFFFFFELL);
        v15 = (uint64_t *)((char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
        v16 = v9;
        do
        {
          v17 = *v14++;
          *v15++ = type metadata accessor for AVMetrics(255, v17, v11, v12);
          --v16;
        }
        while (v16);
      }
      TupleTypeMetadata = swift_getTupleTypeMetadata();
    }
    return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(TupleTypeMetadata - 8) + 48))(&a1[*(int *)(a3 + 56)], a2);
  }
}

uint64_t storeEnumTagSinglePayload for AVMergedMetrics()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_20837DA4C(char *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;
  uint64_t TupleTypeMetadata;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = result;
  if ((_DWORD)a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = *(_QWORD *)(a4 + 16);
    if (v7 == 1)
    {
      TupleTypeMetadata = type metadata accessor for AVMetrics(0, *(_QWORD *)(*(_QWORD *)(a4 + 40) & 0xFFFFFFFFFFFFFELL), a3, a4);
    }
    else
    {
      MEMORY[0x24BDAC7A8](result);
      if (v7)
      {
        v12 = (uint64_t *)(*(_QWORD *)(a4 + 40) & 0xFFFFFFFFFFFFFFFELL);
        v13 = (uint64_t *)((char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
        v14 = v7;
        do
        {
          v15 = *v12++;
          *v13++ = type metadata accessor for AVMetrics(255, v15, v9, v10);
          --v14;
        }
        while (v14);
      }
      TupleTypeMetadata = swift_getTupleTypeMetadata();
    }
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata - 8) + 56))(&v5[*(int *)(a4 + 56)], a2, a2);
  }
  return result;
}

void type metadata accessor for AVMergedMetrics()
{
  JUMPOUT(0x20BD05E5CLL);
}

void type metadata completion function for AVMergedMetrics.SubscriberDelegate()
{
  unint64_t v0;

  type metadata accessor for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation(319, &lazy cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE6A40]);
  if (v0 <= 0x3F)
    swift_initClassMetadata2();
}

void type metadata accessor for AVMergedMetrics.SubscriberDelegate()
{
  JUMPOUT(0x20BD05E5CLL);
}

uint64_t type metadata instantiation function for AVMergedMetrics.AsyncIterator()
{
  return swift_allocateGenericValueMetadata();
}

void type metadata completion function for AVMergedMetrics.AsyncIterator()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  type metadata accessor for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation(319, &lazy cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE6A98]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation(319, &lazy cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE6A40]);
    if (v1 <= 0x3F)
    {
      type metadata accessor for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation(319, &lazy cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Iterator, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE6A78]);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

char *initializeBufferWithCopyOfBuffer for AVMergedMetrics.AsyncIterator(char *a1, char **a2, int *a3)
{
  int v4;
  char *v5;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    v8 = a2[2];
    *((_QWORD *)a1 + 1) = a2[1];
    *((_QWORD *)a1 + 2) = v8;
    v9 = a3[15];
    v10 = &a1[v9];
    v11 = (uint64_t)a2 + v9;
    v12 = v5;
    swift_unknownObjectRetain();
    v13 = v8;
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v10, v11, v14);
    v15 = a3[16];
    v16 = &a1[v15];
    v17 = (uint64_t)a2 + v15;
    v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
    v19 = a3[17];
    v20 = &a1[v19];
    v21 = (uint64_t)a2 + v19;
    v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Iterator);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
  }
  return a1;
}

uint64_t destroy for AVMergedMetrics.AsyncIterator(id *a1, int *a2)
{
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  swift_unknownObjectRelease();
  v4 = (char *)a1 + a2[15];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = (char *)a1 + a2[16];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)a1 + a2[17];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Iterator);
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

_QWORD *initializeWithCopy for AVMergedMetrics.AsyncIterator(_QWORD *a1, uint64_t a2, int *a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = *(void **)a2;
  v7 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v7;
  v8 = *(void **)(a2 + 16);
  a1[2] = v8;
  v9 = a3[15];
  v10 = (char *)a1 + v9;
  v11 = a2 + v9;
  v12 = v6;
  swift_unknownObjectRetain();
  v13 = v8;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v10, v11, v14);
  v15 = a3[16];
  v16 = (char *)a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  v19 = a3[17];
  v20 = (char *)a1 + v19;
  v21 = a2 + v19;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Iterator);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
  return a1;
}

uint64_t assignWithCopy for AVMergedMetrics.AsyncIterator(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
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

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v9 = *(void **)(a2 + 16);
  v10 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v9;
  v11 = v9;

  v12 = a3[15];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v16 = a3[16];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  v20 = a3[17];
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 24))(v21, v22, v23);
  return a1;
}

uint64_t initializeWithTake for AVMergedMetrics.AsyncIterator(uint64_t a1, uint64_t a2, int *a3)
{
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

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = a3[15];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[16];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  v14 = a3[17];
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
  return a1;
}

uint64_t assignWithTake for AVMergedMetrics.AsyncIterator(uint64_t a1, _QWORD *a2, int *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  swift_unknownObjectRelease();
  v7 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = a2[2];

  v8 = a3[15];
  v9 = a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = a3[16];
  v13 = a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = a3[17];
  v17 = a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Iterator);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVMergedMetrics.AsyncIterator()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20837E28C(char *a1, uint64_t a2, int *a3)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = a3[15];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
      {
        v10 = v12;
        v11 = a3[16];
      }
      else
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Iterator);
        v9 = *(_QWORD *)(v10 - 8);
        v11 = a3[17];
      }
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(&a1[v11], a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for AVMergedMetrics.AsyncIterator()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_20837E368(char *result, uint64_t a2, int a3, int *a4)
{
  char *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = a4[15];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == a3)
      {
        v10 = v12;
        v11 = a4[16];
      }
      else
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Iterator);
        v9 = *(_QWORD *)(v10 - 8);
        v11 = a4[17];
      }
    }
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

void type metadata accessor for AVMergedMetrics.AsyncIterator()
{
  JUMPOUT(0x20BD05E5CLL);
}

void type metadata accessor for AsyncStream<(AVMetricEvent, AVMetricEventStreamPublisher)>.Continuation(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for (AVMetricEvent, AVMetricEventStreamPublisher));
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t specialized AVMetrics.SubscriberDelegate.publisher(_:didReceive:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  _QWORD v8[2];

  v2 = type metadata accessor for AsyncStream.Continuation.YieldResult();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v8 - v4;
  v8[1] = swift_dynamicCastUnknownClassUnconditional();
  type metadata accessor for AsyncStream.Continuation();
  v6 = a1;
  AsyncStream.Continuation.yield(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes)
  {
    v1 = type metadata accessor for OS_dispatch_queue.Attributes();
    result = MEMORY[0x20BD05EEC](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A];
  if (!lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
    result = MEMORY[0x20BD05EEC](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A]);
  }
  return result;
}

Swift::Bool __swiftcall AVAssetWriterInputTaggedPixelBufferGroupAdaptor.appendTaggedBuffers(_:withPresentationTime:)(Swift::OpaquePointer _, CMTime withPresentationTime)
{
  void *v2;
  CMTimeEpoch epoch;
  CMTimeScale timescale;
  CMTimeValue value;
  CMTimeFlags flags;
  void *v7;
  CMTimeValue v9;
  CMTimeScale v10;
  CMTimeFlags v11;
  CMTimeEpoch v12;

  epoch = withPresentationTime.epoch;
  timescale = withPresentationTime.timescale;
  value = withPresentationTime.value;
  flags = withPresentationTime.flags;
  v7 = (void *)Array<A>.taggedBufferGroup.getter();
  v9 = value;
  v10 = timescale;
  v11 = flags;
  v12 = epoch;
  LOBYTE(epoch) = objc_msgSend(v2, sel_appendTaggedPixelBufferGroup_withPresentationTime_, v7, &v9);

  return epoch;
}

uint64_t AVAnnotationSerializedData.jsonData.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  outlined copy of Data._Representation(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
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

uint64_t AVAnnotationSerializedData.binaryData.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AVAnnotationSerializedData.init(jsonData:binaryData:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

id AVAnnotation.init(serializedData:)(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  id v4;
  Class isa;
  Class v6;
  id v7;
  id v8;
  id v9;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v2 = a1[1];
  v3 = a1[2];
  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  isa = Data._bridgeToObjectiveC()().super.isa;
  specialized _arrayForceCast<A, B>(_:)(v3);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
  v6 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation(v1, v2);
  swift_bridgeObjectRelease();
  v11[0] = 0;
  v7 = objc_msgSend(v4, sel_initWithJSONData_representationBinaryDataBindings_error_, isa, v6, v11);

  if (v7)
  {
    v8 = v11[0];
  }
  else
  {
    v9 = v11[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v7;
}

uint64_t specialized _arrayForceCast<A, B>(_:)(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
    v4 = a1 + 32;
    v2 = v9;
    do
    {
      swift_bridgeObjectRetain_n();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : AnyHashable]);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
      swift_dynamicCast();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v5 > 1), v6 + 1, 1);
        v2 = v9;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      *(_QWORD *)(v2 + 8 * v6 + 32) = v8;
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
    type metadata accessor for CMTime(0);
    v4 = a1 + 48;
    do
    {
      swift_dynamicCast();
      v2 = v9;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v5 > 1), v6 + 1, 1);
        v2 = v9;
      }
      v4 += 24;
      *(_QWORD *)(v2 + 16) = v6 + 1;
      outlined init with take of Sendable(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
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

void AVAnnotation.serialize()(uint64_t *a1@<X8>)
{
  void *v1;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14[2];

  v14[1] = *(id *)MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCE50]), sel_init);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCE30]), sel_init);
  v13 = v4;
  v14[0] = v3;
  objc_msgSend(v1, sel_getJSONData_representationBinaryDataBindings_, v14, &v13);
  v5 = v13;

  v6 = v14[0];
  v7 = v6;
  v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;

  v14[0] = 0;
  v11 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : AnyHashable]);
  static Array._forceBridgeFromObjectiveC(_:result:)();
  v12 = v14[0];
  if (!v14[0])
    __break(1u);

  *a1 = v8;
  a1[1] = v10;
  a1[2] = (uint64_t)v12;
}

uint64_t AVAnnotationPathRepresentation.init(paths:)(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  Class isa;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v16 = MEMORY[0x24BEE4AF8];
    v14 = *(_QWORD *)(a1 + 16);
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0);
    v3 = v14;
    v4 = 0;
    v15 = a1 + 32;
    while (1)
    {
      v5 = *(_QWORD *)(v15 + 8 * v4);
      v6 = *(_QWORD *)(v5 + 16);
      if (v6)
        break;
      v8 = MEMORY[0x24BEE4AF8];
      v10 = *(_QWORD *)(v16 + 16);
      v9 = *(_QWORD *)(v16 + 24);
      if (v10 >= v9 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v9 > 1), v10 + 1, 1);
        v3 = v14;
      }
      ++v4;
      *(_QWORD *)(v16 + 16) = v10 + 1;
      *(_QWORD *)(v16 + 8 * v10 + 32) = v8;
      if (v4 == v3)
        goto LABEL_8;
    }
    swift_bridgeObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v6, 0);
    CGPointCreateDictionaryRepresentation(*(CGPoint *)(v5 + 32));
    type metadata accessor for NSNumber();
    result = static Dictionary._forceBridgeFromObjectiveC(_:result:)();
    __break(1u);
  }
  else
  {
LABEL_8:
    swift_bridgeObjectRelease();
    v11 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [[String : NSNumber]]);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v13 = objc_msgSend(v11, sel_initWithPaths_, isa);

    return (uint64_t)v13;
  }
  return result;
}

uint64_t AVAnnotationPathRepresentation.paths.getter()
{
  void *v0;
  id v1;
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSDictionary v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CGPoint_optional v25;

  v1 = objc_msgSend(v0, sel_paths);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [[String : NSNumber]]);
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v24 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3, 0);
    v4 = 0;
    v5 = v24;
    v20 = v3;
    v21 = v2 + 32;
    while (1)
    {
      v6 = *(_QWORD *)(*(_QWORD *)(v21 + 8 * v4) + 16);
      if (v6)
        break;
      v7 = MEMORY[0x24BEE4AF8];
LABEL_11:
      v18 = *(_QWORD *)(v24 + 16);
      v17 = *(_QWORD *)(v24 + 24);
      if (v18 >= v17 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v17 > 1), v18 + 1, 1);
      ++v4;
      *(_QWORD *)(v24 + 16) = v18 + 1;
      *(_QWORD *)(v24 + 8 * v18 + 32) = v7;
      if (v4 == v3)
      {
        swift_bridgeObjectRelease();
        goto LABEL_16;
      }
    }
    v22 = v4;
    v23 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v6, 0);
    v7 = v23;
    type metadata accessor for NSNumber();
    v8 = 0;
    while (1)
    {
      swift_bridgeObjectRetain();
      v9.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
      v25 = CGPoint.init(dictionaryRepresentation:)(v9.super.isa);
      if ((v11 & 1) != 0)
        break;
      v12 = *(_QWORD *)&v25.is_nil;
      v13 = v10;
      swift_bridgeObjectRelease();
      v15 = *(_QWORD *)(v23 + 16);
      v14 = *(_QWORD *)(v23 + 24);
      if (v15 >= v14 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v14 > 1), v15 + 1, 1);
      ++v8;
      *(_QWORD *)(v23 + 16) = v15 + 1;
      v16 = v23 + 16 * v15;
      *(_QWORD *)(v16 + 32) = v12;
      *(_QWORD *)(v16 + 40) = v13;
      if (v6 == v8)
      {
        swift_bridgeObjectRelease();
        v3 = v20;
        v4 = v22;
        goto LABEL_11;
      }
    }
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v5 = MEMORY[0x24BEE4AF8];
LABEL_16:
    *(_QWORD *)&v25.is_nil = v5;
  }
  LOBYTE(result) = v25.is_nil;
  return result;
}

void AVAnnotationPathRepresentation.paths.setter(uint64_t a1)
{
  void *v1;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  Class isa;
  uint64_t v14;
  uint64_t v15;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v14 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3, 0);
    v4 = 0;
    v5 = v14;
    v12 = a1 + 32;
    do
    {
      v6 = *(_QWORD *)(v12 + 8 * v4);
      v7 = *(_QWORD *)(v6 + 16);
      if (v7)
      {
        swift_bridgeObjectRetain();
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v7, 0);
        CGPointCreateDictionaryRepresentation(*(CGPoint *)(v6 + 32));
        type metadata accessor for NSNumber();
        static Dictionary._forceBridgeFromObjectiveC(_:result:)();
        __break(1u);
        return;
      }
      v8 = MEMORY[0x24BEE4AF8];
      v15 = v5;
      v10 = *(_QWORD *)(v5 + 16);
      v9 = *(_QWORD *)(v5 + 24);
      if (v10 >= v9 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v9 > 1), v10 + 1, 1);
        v5 = v15;
      }
      ++v4;
      *(_QWORD *)(v5 + 16) = v10 + 1;
      *(_QWORD *)(v5 + 8 * v10 + 32) = v8;
    }
    while (v4 != v3);
    swift_bridgeObjectRelease();
    v1 = v11;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [[String : NSNumber]]);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setPaths_, isa);

}

void (*AVAnnotationPathRepresentation.paths.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = AVAnnotationPathRepresentation.paths.getter();
  return AVAnnotationPathRepresentation.paths.modify;
}

void AVAnnotationPathRepresentation.paths.modify(uint64_t *a1, char a2)
{
  uint64_t v2;

  if ((a2 & 1) != 0)
  {
    v2 = swift_bridgeObjectRetain();
    AVAnnotationPathRepresentation.paths.setter(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    AVAnnotationPathRepresentation.paths.setter(*a1);
  }
}

unint64_t type metadata accessor for NSNumber()
{
  unint64_t result;

  result = lazy cache variable for type metadata for NSNumber;
  if (!lazy cache variable for type metadata for NSNumber)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  }
  return result;
}

uint64_t sub_20837F39C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = AVAnnotationPathRepresentation.paths.getter();
  *a1 = result;
  return result;
}

void sub_20837F3C4()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  AVAnnotationPathRepresentation.paths.setter(v0);
}

uint64_t destroy for AVAnnotationSerializedData(uint64_t a1)
{
  outlined consume of Data._Representation(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return swift_bridgeObjectRelease();
}

uint64_t *initializeBufferWithCopyOfBuffer for AVAnnotationSerializedData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *a2;
  v5 = a2[1];
  outlined copy of Data._Representation(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for AVAnnotationSerializedData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  outlined copy of Data._Representation(*a2, v5);
  v6 = *a1;
  v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  outlined consume of Data._Representation(v6, v7);
  a1[2] = a2[2];
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

uint64_t *assignWithTake for AVAnnotationSerializedData(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *a1;
  v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  outlined consume of Data._Representation(v4, v5);
  a1[2] = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AVAnnotationSerializedData(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AVAnnotationSerializedData(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AVAnnotationSerializedData()
{
  return &type metadata for AVAnnotationSerializedData;
}

char *AVCaptureSlider.prominentValues.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v1 = objc_msgSend(v0, sel_prominentValues);
  type metadata accessor for NSNumber();
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_13;
LABEL_3:
  v13 = MEMORY[0x24BEE4AF8];
  result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    v6 = v13;
    do
    {
      if ((v2 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x20BD059B8](v5, v2);
      else
        v7 = *(id *)(v2 + 8 * v5 + 32);
      v8 = v7;
      objc_msgSend(v7, sel_floatValue);
      v10 = v9;

      v12 = *(_QWORD *)(v13 + 16);
      v11 = *(_QWORD *)(v13 + 24);
      if (v12 >= v11 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
      ++v5;
      *(_QWORD *)(v13 + 16) = v12 + 1;
      *(_DWORD *)(v13 + 4 * v12 + 32) = v10;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

void AVCaptureSlider.prominentValues.setter(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  id v7;
  double v8;
  Class isa;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    specialized ContiguousArray.reserveCapacity(_:)();
    v4 = 0;
    do
    {
      v5 = v4 + 1;
      v6 = *(_DWORD *)(a1 + 4 * v4 + 32);
      v7 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
      LODWORD(v8) = v6;
      objc_msgSend(v7, sel_initWithFloat_, v8);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v4 = v5;
    }
    while (v3 != v5);
  }
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setProminentValues_, isa);

}

void (*AVCaptureSlider.prominentValues.modify(char **a1))(uint64_t *a1, char a2)
{
  char *v1;

  a1[1] = v1;
  *a1 = AVCaptureSlider.prominentValues.getter();
  return AVCaptureSlider.prominentValues.modify;
}

void AVCaptureSlider.prominentValues.modify(uint64_t *a1, char a2)
{
  uint64_t v2;

  if ((a2 & 1) != 0)
  {
    v2 = swift_bridgeObjectRetain();
    AVCaptureSlider.prominentValues.setter(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    AVCaptureSlider.prominentValues.setter(*a1);
  }
}

id AVCaptureSlider.init(_:symbolName:in:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, float a5, float a6)
{
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v17;

  v12 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v13 = (void *)MEMORY[0x20BD05754](a1, a2);
  swift_bridgeObjectRelease();
  v14 = (void *)MEMORY[0x20BD05754](a3, a4);
  swift_bridgeObjectRelease();
  *(float *)&v15 = a5;
  *(float *)&v16 = a6;
  v17 = objc_msgSend(v12, sel_initWithLocalizedTitle_symbolName_minValue_maxValue_, v13, v14, v15, v16);

  return v17;
}

id AVCaptureSlider.init(_:symbolName:in:step:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, float a5, float a6, float a7)
{
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  id v20;

  v14 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v15 = (void *)MEMORY[0x20BD05754](a1, a2);
  swift_bridgeObjectRelease();
  v16 = (void *)MEMORY[0x20BD05754](a3, a4);
  swift_bridgeObjectRelease();
  *(float *)&v17 = a5;
  *(float *)&v18 = a6;
  *(float *)&v19 = a7;
  v20 = objc_msgSend(v14, sel_initWithLocalizedTitle_symbolName_minValue_maxValue_step_, v15, v16, v17, v18, v19);

  return v20;
}

id AVCaptureSlider.init(_:symbolName:values:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  id v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  Class isa;
  id v20;

  v7 = a3;
  v9 = a1;
  v10 = *(_QWORD *)(a5 + 16);
  if (v10)
  {
    specialized ContiguousArray.reserveCapacity(_:)();
    v11 = 0;
    do
    {
      v12 = v11 + 1;
      v13 = *(_DWORD *)(a5 + 4 * v11 + 32);
      v14 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
      LODWORD(v15) = v13;
      objc_msgSend(v14, sel_initWithFloat_, v15);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v11 = v12;
    }
    while (v10 != v12);
    swift_bridgeObjectRelease();
    v9 = a1;
    v7 = a3;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v16 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v17 = (void *)MEMORY[0x20BD05754](v9, a2);
  swift_bridgeObjectRelease();
  v18 = (void *)MEMORY[0x20BD05754](v7, a4);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v20 = objc_msgSend(v16, sel_initWithLocalizedTitle_symbolName_values_, v17, v18, isa);

  return v20;
}

void AVCaptureSlider.setActionQueue(_:action:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  _QWORD v6[6];

  v6[4] = a2;
  v6[5] = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 1107296256;
  v6[2] = thunk for @escaping @callee_guaranteed (@unowned Float) -> ();
  v6[3] = &block_descriptor_2;
  v5 = _Block_copy(v6);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_setActionQueue_action_, a1, v5);
  _Block_release(v5);
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Float) -> ()(uint64_t a1, float a2)
{
  void (*v3)(uint64_t, float);
  uint64_t v4;

  v3 = *(void (**)(uint64_t, float))(a1 + 32);
  v4 = swift_retain();
  v3(v4, a2);
  return swift_release();
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

char *sub_20837FD2C@<X0>(char **a1@<X8>)
{
  char *result;

  result = AVCaptureSlider.prominentValues.getter();
  *a1 = result;
  return result;
}

void sub_20837FD54()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  AVCaptureSlider.prominentValues.setter(v0);
}

Class @objc AVVideoComposition.sourceSampleDataTrackIDs.getter(void *a1, uint64_t a2)
{
  return @objc AVVideoComposition.sourceSampleDataTrackIDs.getter(a1, a2, (void (*)(void))AVVideoComposition.sourceSampleDataTrackIDs.getter);
}

Class @objc AVMutableVideoComposition.sourceSampleDataTrackIDs.getter(void *a1, uint64_t a2)
{
  return @objc AVVideoComposition.sourceSampleDataTrackIDs.getter(a1, a2, (void (*)(void))AVMutableVideoComposition.sourceSampleDataTrackIDs.getter);
}

Class @objc AVVideoComposition.sourceSampleDataTrackIDs.getter(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  Class isa;

  v4 = a1;
  a3();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

char *AVAsynchronousVideoCompositionRequest.sourceSampleDataTrackIDs.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  unsigned int v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v1 = objc_msgSend(v0, sel_sourceSampleDataTrackIDs);
  type metadata accessor for NSNumber();
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_13;
LABEL_3:
  v12 = MEMORY[0x24BEE4AF8];
  result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    v6 = v12;
    do
    {
      if ((v2 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x20BD059B8](v5, v2);
      else
        v7 = *(id *)(v2 + 8 * v5 + 32);
      v8 = v7;
      v9 = objc_msgSend(v7, sel_intValue);

      v11 = *(_QWORD *)(v12 + 16);
      v10 = *(_QWORD *)(v12 + 24);
      if (v11 >= v10 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1);
      ++v5;
      *(_QWORD *)(v12 + 16) = v11 + 1;
      *(_DWORD *)(v12 + 4 * v11 + 32) = v9;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

void @objc AVMutableVideoComposition.sourceSampleDataTrackIDs.setter(void *a1)
{
  uint64_t v2;
  id v3;

  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = a1;
  AVMutableVideoComposition.sourceSampleDataTrackIDs.setter(v2);

}

void AVMutableVideoComposition.sourceSampleDataTrackIDs.setter(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  Class isa;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    specialized ContiguousArray.reserveCapacity(_:)();
    v3 = 0;
    do
    {
      v4 = v3 + 1;
      Int32._bridgeToObjectiveC()();
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v3 = v4;
    }
    while (v2 != v4);
  }
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setSourceSampleDataTrackIDs_, isa);

}

id one-time initialization function for backgroundPIPAuthorizationTokenDidChangeNotification()
{
  static AVPlayer.backgroundPIPAuthorizationTokenDidChangeNotification = *MEMORY[0x24BDFDCE8];
  return (id)static AVPlayer.backgroundPIPAuthorizationTokenDidChangeNotification;
}

id static AVPlayer.backgroundPIPAuthorizationTokenDidChangeNotification.getter()
{
  return static AVPlayer.backgroundPIPAuthorizationTokenDidChangeNotification.getter(&one-time initialization token for backgroundPIPAuthorizationTokenDidChangeNotification, (id *)&static AVPlayer.backgroundPIPAuthorizationTokenDidChangeNotification);
}

id one-time initialization function for audiovisualBackgroundPlaybackPolicyDidChangeNotification()
{
  static AVPlayer.audiovisualBackgroundPlaybackPolicyDidChangeNotification = *MEMORY[0x24BDFDCE0];
  return (id)static AVPlayer.audiovisualBackgroundPlaybackPolicyDidChangeNotification;
}

id static AVPlayer.audiovisualBackgroundPlaybackPolicyDidChangeNotification.getter()
{
  return static AVPlayer.backgroundPIPAuthorizationTokenDidChangeNotification.getter(&one-time initialization token for audiovisualBackgroundPlaybackPolicyDidChangeNotification, (id *)&static AVPlayer.audiovisualBackgroundPlaybackPolicyDidChangeNotification);
}

id one-time initialization function for interstitialPlayerDidChangeNotification()
{
  static AVPlayer.interstitialPlayerDidChangeNotification = *MEMORY[0x24BDFDCF0];
  return (id)static AVPlayer.interstitialPlayerDidChangeNotification;
}

id static AVPlayer.interstitialPlayerDidChangeNotification.getter()
{
  return static AVPlayer.backgroundPIPAuthorizationTokenDidChangeNotification.getter(&one-time initialization token for interstitialPlayerDidChangeNotification, (id *)&static AVPlayer.interstitialPlayerDidChangeNotification);
}

id static AVPlayer.backgroundPIPAuthorizationTokenDidChangeNotification.getter(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

uint64_t AVAssetVariant.peakBitRate.getter()
{
  return AVAssetVariant.peakBitRate.getter((SEL *)&selRef_peakBitRate);
}

uint64_t AVAssetVariant.averageBitRate.getter()
{
  return AVAssetVariant.peakBitRate.getter((SEL *)&selRef_averageBitRate);
}

uint64_t AVAssetVariantVideoAttributes.nominalFrameRate.getter()
{
  return AVAssetVariant.peakBitRate.getter((SEL *)&selRef_nominalFrameRate);
}

uint64_t AVAssetVariant.peakBitRate.getter(SEL *a1)
{
  void *v1;
  double v3;
  uint64_t v5;

  objc_msgSend(v1, *a1);
  if (v3 < 0.0)
    return 0;
  objc_msgSend(v1, *a1);
  return v5;
}

char *AVAssetVariantVideoAttributes.codecTypes.getter()
{
  return AVAssetVariantVideoAttributes.codecTypes.getter((SEL *)&selRef_codecTypes);
}

char *AVAssetVariantAudioAttributes.formatIDs.getter()
{
  return AVAssetVariantVideoAttributes.codecTypes.getter((SEL *)&selRef_formatIDs);
}

char *AVAssetVariantVideoAttributes.codecTypes.getter(SEL *a1)
{
  void *v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  char *result;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v2 = objc_msgSend(v1, *a1);
  type metadata accessor for NSNumber();
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v4 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v4)
    goto LABEL_13;
LABEL_3:
  v13 = MEMORY[0x24BEE4AF8];
  result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    v6 = 0;
    v7 = v13;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x20BD059B8](v6, v3);
      else
        v8 = *(id *)(v3 + 8 * v6 + 32);
      v9 = v8;
      v10 = objc_msgSend(v8, sel_unsignedIntValue);

      v12 = *(_QWORD *)(v13 + 16);
      v11 = *(_QWORD *)(v13 + 24);
      if (v12 >= v11 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
      ++v6;
      *(_QWORD *)(v13 + 16) = v12 + 1;
      *(_DWORD *)(v13 + 4 * v12 + 32) = v10;
    }
    while (v4 != v6);
    swift_bridgeObjectRelease();
    return (char *)v7;
  }
  __break(1u);
  return result;
}

id AVAssetVariantAudioRenditionSpecificAttributes.channelCount.getter()
{
  void *v0;

  if (((unint64_t)objc_msgSend(v0, sel_channelCount) & 0x8000000000000000) != 0)
    return 0;
  else
    return objc_msgSend(v0, sel_channelCount);
}

char *AVPlayerItemSegment.loadedTimeRanges.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  char *v3;

  v1 = objc_msgSend(v0, sel_loadedTimeRanges);
  type metadata accessor for NSValue();
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v3 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSaySo7NSValueCG_So11CMTimeRangeas5NeverOTg5084_sSo37AVMetricPlayerItemLikelyToKeepUpEventC12AVFoundationE16loadedTimeRangesSaySo11e14RangeaGvgAFSo7D52Ccfu_32e1aaa32c9642607d0b6314623c7365cfAiFTf3nnnpk_nTf1cn_nTm(v2);
  swift_bridgeObjectRelease();
  return v3;
}

unint64_t type metadata accessor for NSValue()
{
  unint64_t result;

  result = lazy cache variable for type metadata for NSValue;
  if (!lazy cache variable for type metadata for NSValue)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSValue);
  }
  return result;
}

uint64_t AVPlayerItemIntegratedTimeline.PeriodicTimes.makeAsyncIterator()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  char *v15;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v22 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  v20 = *(_QWORD *)(v2 - 8);
  v21 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v19 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation.BufferingPolicy);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>);
  v18 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void **)v1;
  v11 = *(_QWORD *)(v1 + 8);
  v13 = *(_QWORD *)(v1 + 24);
  type metadata accessor for CMTime(0);
  v23 = v12;
  v24 = v11;
  v25 = *(_QWORD *)(v1 + 16);
  v26 = v13;
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE6A10], v4);
  v14 = v12;
  AsyncStream.init(_:bufferingPolicy:_:)();
  v15 = v19;
  AsyncStream.makeAsyncIterator()();

  (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v8);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v20 + 32))(v22, v15, v21);
}

uint64_t closure #1 in AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator.init(integratedTimeline:forInterval:)(uint64_t a1, void *a2, uint64_t a3, unint64_t a4, uint64_t (*a5)(uint64_t a1, uint64_t *a2))
{
  unsigned int v5;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t *);
  uint64_t aBlock;
  unint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t *);
  void *v26;
  uint64_t (*v27)(uint64_t, unint64_t, uint64_t);
  uint64_t v28;

  v22 = a5;
  v5 = a4;
  v9 = HIDWORD(a4);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  v14 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v15 + v14, v13, v10);
  v27 = partial apply for closure #1 in closure #1 in AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator.init(integratedTimeline:forInterval:);
  v28 = v15;
  aBlock = MEMORY[0x24BDAC760];
  v24 = 1107296256;
  v25 = thunk for @escaping @callee_guaranteed @Sendable (@unowned CMTime) -> ();
  v26 = &block_descriptor_18;
  v16 = _Block_copy(&aBlock);
  swift_release();
  aBlock = a3;
  v24 = __PAIR64__(v9, v5);
  v25 = v22;
  v17 = objc_msgSend(a2, sel_addPeriodicTimeObserverForInterval_queue_usingBlock_, &aBlock, 0, v16);
  _Block_release(v16);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a2;
  *(_QWORD *)(v18 + 24) = v17;
  v19 = a2;
  return AsyncStream.Continuation.onTermination.setter();
}

uint64_t partial apply for closure #1 in AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator.init(integratedTimeline:forInterval:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator.init(integratedTimeline:forInterval:)(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(uint64_t (**)(uint64_t, uint64_t *))(v1 + 40));
}

uint64_t closure #1 in closure #1 in AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator.init(integratedTimeline:forInterval:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  int v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v12[2];
  int v13;
  int v14;
  uint64_t v15;

  v4 = a2;
  v6 = HIDWORD(a2);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation.YieldResult);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[1] = a1;
  v13 = v4;
  v14 = v6;
  v15 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation);
  AsyncStream.Continuation.yield(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@unowned CMTime) -> ()(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[2];
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(v2, v3, v4);
  return swift_release();
}

uint64_t AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator.next()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  *v1 = v0;
  v1[1] = AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator.next();
  return AsyncStream.Iterator.next()();
}

{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 48) = a1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 56) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  *v2 = v1;
  v2[1] = protocol witness for AsyncIteratorProtocol.next() in conformance AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator;
  return AsyncStream.Iterator.next()();
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t _sSo30AVPlayerItemIntegratedTimelineC12AVFoundationE13PeriodicTimesV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTW(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  v4 = (_QWORD *)swift_task_alloc();
  v3[9] = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  *v4 = v3;
  v4[1] = _sSo30AVPlayerItemIntegratedTimelineC12AVFoundationE13PeriodicTimesV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_;
  return AsyncStream.Iterator.next()();
}

uint64_t _sSo30AVPlayerItemIntegratedTimelineC12AVFoundationE13PeriodicTimesV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t _sSo30AVPlayerItemIntegratedTimelineC12AVFoundationE13PeriodicTimesV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTY1_()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  *(_OWORD *)(v0 + 80) = *(_OWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 96) = *(_QWORD *)(v0 + 32);
  *(_BYTE *)(v0 + 41) = *(_BYTE *)(v0 + 40);
  if (v1)
  {
    swift_getObjectType();
    dispatch thunk of Actor.unownedExecutor.getter();
  }
  return swift_task_switch();
}

void protocol witness for AsyncSequence.makeAsyncIterator() in conformance AVPlayerItemIntegratedTimeline.PeriodicTimes(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = v1;
  v22 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  v20 = *(_QWORD *)(v3 - 8);
  v21 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v19 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation.BufferingPolicy);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(id *)v2;
  v13 = *(_QWORD *)(v2 + 8);
  v14 = *(_QWORD *)(v2 + 24);
  type metadata accessor for CMTime(0);
  v23 = v12;
  v24 = v13;
  v25 = *(_QWORD *)(v2 + 16);
  v26 = v14;
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BEE6A10], v5);
  v15 = v12;
  AsyncStream.init(_:bufferingPolicy:_:)();
  v16 = v19;
  AsyncStream.makeAsyncIterator()();

  (*(void (**)(char *, uint64_t))(v18 + 8))(v11, v9);
  (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v22, v16, v21);

}

uint64_t AVPlayerItemIntegratedTimeline.BoundaryTimes.makeAsyncIterator()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  v22 = *(_QWORD *)(v2 - 8);
  v23 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v21 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation.BufferingPolicy);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>);
  v20 = *(_QWORD *)(v8 - 8);
  result = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void **)(v1 + 8);
  if (v12)
  {
    v13 = *(_QWORD *)(v1 + 16);
    v14 = *(void **)v1;
    type metadata accessor for CMTime(0);
    v19 = (uint64_t)&v19;
    MEMORY[0x24BDAC7A8](v15);
    *(&v19 - 4) = (uint64_t)v14;
    *(&v19 - 3) = (uint64_t)v12;
    *(&v19 - 2) = v13;
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE6A10], v4);
    v16 = v14;
    v17 = v12;
    swift_bridgeObjectRetain();
    AsyncStream.init(_:bufferingPolicy:_:)();
    swift_bridgeObjectRelease();
    v18 = v21;
    AsyncStream.makeAsyncIterator()();

    (*(void (**)(char *, uint64_t))(v20 + 8))(v11, v8);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v22 + 32))(v24, v18, v23);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t closure #1 in AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator.init(integratedTimeline:forSegment:offsetsIntoSegment:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  Class isa;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  _QWORD aBlock[6];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  specialized _arrayForceCast<A, B>(_:)(a4);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  v13 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v14 = (v10 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v15 + v13, v11, v8);
  *(_QWORD *)(v15 + v14) = a2;
  aBlock[4] = partial apply for closure #1 in closure #1 in AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator.init(integratedTimeline:forSegment:offsetsIntoSegment:);
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@unowned Int) -> ();
  aBlock[3] = &block_descriptor_3;
  v16 = _Block_copy(aBlock);
  v17 = a2;
  swift_release();
  v18 = objc_msgSend(v17, sel_addBoundaryTimeObserverForSegment_offsetsIntoSegment_queue_usingBlock_, a3, isa, 0, v16);
  _Block_release(v16);

  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v17;
  *(_QWORD *)(v19 + 24) = v18;
  v20 = v17;
  return AsyncStream.Continuation.onTermination.setter();
}

uint64_t partial apply for closure #1 in AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator.init(integratedTimeline:forSegment:offsetsIntoSegment:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator.init(integratedTimeline:forSegment:offsetsIntoSegment:)(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

void closure #1 in closure #1 in AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator.init(integratedTimeline:forSegment:offsetsIntoSegment:)(char a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation.YieldResult);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) != 0)
  {
    objc_msgSend(a3, sel_currentTime);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation);
    AsyncStream.Continuation.yield(_:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation);
    AsyncStream.Continuation.finish()();
  }
}

uint64_t AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator.next()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  *v1 = v0;
  v1[1] = AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator.next();
  return AsyncStream.Iterator.next()();
}

{
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(unsigned __int8 *)(v0 + 40));
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 48) = a1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 56) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  *v2 = v1;
  v2[1] = protocol witness for AsyncIteratorProtocol.next() in conformance AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator;
  return AsyncStream.Iterator.next()();
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator()
{
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_BYTE *)(v0 + 40);
  *(_OWORD *)v1 = *(_OWORD *)(v0 + 16);
  *(_QWORD *)(v1 + 16) = v2;
  *(_BYTE *)(v1 + 24) = v3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t _sSo30AVPlayerItemIntegratedTimelineC12AVFoundationE13BoundaryTimesV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTW(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  v4 = (_QWORD *)swift_task_alloc();
  v3[9] = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  *v4 = v3;
  v4[1] = _sSo30AVPlayerItemIntegratedTimelineC12AVFoundationE13BoundaryTimesV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_;
  return AsyncStream.Iterator.next()();
}

uint64_t _sSo30AVPlayerItemIntegratedTimelineC12AVFoundationE13BoundaryTimesV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t _sSo30AVPlayerItemIntegratedTimelineC12AVFoundationE13BoundaryTimesV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTY1_()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  *(_OWORD *)(v0 + 80) = *(_OWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 96) = *(_QWORD *)(v0 + 32);
  *(_BYTE *)(v0 + 41) = *(_BYTE *)(v0 + 40);
  if (v1)
  {
    swift_getObjectType();
    dispatch thunk of Actor.unownedExecutor.getter();
  }
  return swift_task_switch();
}

uint64_t _sSo30AVPlayerItemIntegratedTimelineC12AVFoundationE13BoundaryTimesV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTY2_()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_BYTE *)(v0 + 41);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 48);
  *(_OWORD *)v3 = *(_OWORD *)(v0 + 80);
  *(_QWORD *)(v3 + 16) = v2;
  *(_BYTE *)(v3 + 24) = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void protocol witness for AsyncSequence.makeAsyncIterator() in conformance AVPlayerItemIntegratedTimeline.BoundaryTimes(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v2;
  id v3;

  AVPlayerItemIntegratedTimeline.BoundaryTimes.makeAsyncIterator()(a1);
  v2 = *(void **)v1;
  v3 = *(id *)(v1 + 8);
  swift_bridgeObjectRelease();

}

id AVPlayerItemIntegratedTimeline.periodicTimes(forInterval:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  void *v4;

  *a4 = v4;
  a4[1] = a1;
  a4[2] = a2;
  a4[3] = a3;
  return v4;
}

uint64_t AVPlayerItemIntegratedTimeline.boundaryTimes(for:offsetsIntoSegment:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  void *v3;
  id v5;
  id v6;

  *a3 = v3;
  a3[1] = a1;
  a3[2] = a2;
  v5 = v3;
  v6 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t associated type witness table accessor for AsyncIteratorProtocol.Failure : Error in AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator()
{
  return MEMORY[0x24BEE40A8];
}

uint64_t associated type witness table accessor for AsyncSequence.AsyncIterator : AsyncIteratorProtocol in AVPlayerItemIntegratedTimeline.PeriodicTimes()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey(&lazy protocol witness table cache variable for type AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator and conformance AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator, type metadata accessor for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator, (uint64_t)&protocol conformance descriptor for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator);
}

uint64_t type metadata accessor for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(uint64_t a1)
{
  return type metadata accessor for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(a1, (uint64_t *)&type metadata singleton initialization cache for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator);
}

uint64_t associated type witness table accessor for AsyncSequence.AsyncIterator : AsyncIteratorProtocol in AVPlayerItemIntegratedTimeline.BoundaryTimes()
{
  return lazy protocol witness table accessor for type AVMetadataExtraAttributeKey and conformance AVMetadataExtraAttributeKey((unint64_t *)&lazy protocol witness table cache variable for type AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator and conformance AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator, type metadata accessor for AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator, (uint64_t)&protocol conformance descriptor for AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator);
}

uint64_t type metadata accessor for AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator(uint64_t a1)
{
  return type metadata accessor for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(a1, type metadata singleton initialization cache for AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator);
}

uint64_t type metadata accessor for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void destroy for AVPlayerItemIntegratedTimeline.PeriodicTimes(id *a1)
{

}

uint64_t initializeWithCopy for AVPlayerItemIntegratedTimeline.PeriodicTimes(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = v3;
  return a1;
}

uint64_t assignWithCopy for AVPlayerItemIntegratedTimeline.PeriodicTimes(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
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

uint64_t assignWithTake for AVPlayerItemIntegratedTimeline.PeriodicTimes(uint64_t a1, _QWORD *a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = a2[3];
  return a1;
}

uint64_t getEnumTagSinglePayload for AVPlayerItemIntegratedTimeline.PeriodicTimes(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AVPlayerItemIntegratedTimeline.PeriodicTimes(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AVPlayerItemIntegratedTimeline.PeriodicTimes()
{
  return &type metadata for AVPlayerItemIntegratedTimeline.PeriodicTimes;
}

uint64_t getEnumTagSinglePayload for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void type metadata accessor for AsyncStream<CMTime>.Iterator()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for AsyncStream<CMTime>.Iterator)
  {
    type metadata accessor for CMTime(255);
    v0 = type metadata accessor for AsyncStream.Iterator();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  }
}

uint64_t destroy for AVPlayerItemIntegratedTimeline.BoundaryTimes(id *a1)
{

  return swift_bridgeObjectRelease();
}

_QWORD *initializeBufferWithCopyOfBuffer for AVPlayerItemIntegratedTimeline.BoundaryTimes(_QWORD *a1, uint64_t a2)
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
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AVPlayerItemIntegratedTimeline.BoundaryTimes(uint64_t a1, uint64_t a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AVPlayerItemIntegratedTimeline.BoundaryTimes(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AVPlayerItemIntegratedTimeline.BoundaryTimes(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AVPlayerItemIntegratedTimeline.BoundaryTimes(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AVPlayerItemIntegratedTimeline.BoundaryTimes()
{
  return &type metadata for AVPlayerItemIntegratedTimeline.BoundaryTimes;
}

uint64_t initializeBufferWithCopyOfBuffer for AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Iterator);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void type metadata completion function for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator()
{
  unint64_t v0;

  type metadata accessor for AsyncStream<CMTime>.Iterator();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_208381D90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

void partial apply for closure #1 in closure #1 in AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator.init(integratedTimeline:forSegment:offsetsIntoSegment:)(char a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation)
                 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  closure #1 in closure #1 in AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator.init(integratedTimeline:forSegment:offsetsIntoSegment:)(a1, v1 + v4, *(void **)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8)));
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

id partial apply for closure #2 in closure #1 in AVPlayerItemIntegratedTimeline.BoundaryTimes.Iterator.init(integratedTimeline:forSegment:offsetsIntoSegment:)()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_removeTimeObserver_, *(_QWORD *)(v0 + 24));
}

uint64_t sub_208381E88()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator.init(integratedTimeline:forInterval:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CMTime>.Continuation);
  return closure #1 in closure #1 in AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator.init(integratedTimeline:forInterval:)(a1, a2, a3);
}

uint64_t objectdestroy_11Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t AVCaptureSynchronizedDataCollection.makeIterator()()
{
  void *v0;
  id v1;

  v1 = v0;
  return NSFastEnumerationIterator.init(_:)();
}

AVCaptureSynchronizedData_optional __swiftcall AVCaptureSynchronizedDataCollection.Iterator.next()()
{
  AVCaptureSynchronizedDataInternal *v0;
  Swift::Bool v1;
  objc_class *v2;
  objc_class *v3;
  __int128 v4;
  uint64_t v5;
  _OWORD v6[2];
  AVCaptureSynchronizedData_optional result;

  NSFastEnumerationIterator.next()();
  if (v5)
  {
    outlined init with take of Sendable(&v4, v6);
    outlined init with take of Sendable(v6, &v4);
    type metadata accessor for AVMediaSelection(0, &lazy cache variable for type metadata for AVCaptureSynchronizedData);
    swift_dynamicCast();
    v2 = v3;
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v4);
    v2 = 0;
  }
  result.value._synchronizedDataInternal = v0;
  result.value.super.isa = v2;
  result.is_nil = v1;
  return result;
}

unint64_t protocol witness for IteratorProtocol.next() in conformance AVCaptureSynchronizedDataCollection.Iterator@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;

  result = (unint64_t)AVCaptureSynchronizedDataCollection.Iterator.next()();
  *a1 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type AVCaptureSynchronizedDataCollection.Iterator and conformance AVCaptureSynchronizedDataCollection.Iterator()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type AVCaptureSynchronizedDataCollection.Iterator and conformance AVCaptureSynchronizedDataCollection.Iterator;
  if (!lazy protocol witness table cache variable for type AVCaptureSynchronizedDataCollection.Iterator and conformance AVCaptureSynchronizedDataCollection.Iterator)
  {
    v1 = type metadata accessor for AVCaptureSynchronizedDataCollection.Iterator();
    result = MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVCaptureSynchronizedDataCollection.Iterator, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AVCaptureSynchronizedDataCollection.Iterator and conformance AVCaptureSynchronizedDataCollection.Iterator);
  }
  return result;
}

uint64_t type metadata accessor for AVCaptureSynchronizedDataCollection.Iterator()
{
  uint64_t result;

  result = type metadata singleton initialization cache for AVCaptureSynchronizedDataCollection.Iterator;
  if (!type metadata singleton initialization cache for AVCaptureSynchronizedDataCollection.Iterator)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t protocol witness for Sequence.makeIterator() in conformance AVCaptureSynchronizedDataCollection()
{
  return NSFastEnumerationIterator.init(_:)();
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance AVCaptureSynchronizedDataCollection()
{
  return 0;
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance AVCaptureSynchronizedDataCollection()
{
  return 2;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance AVCaptureSynchronizedDataCollection()
{
  void **v0;
  void *v1;
  uint64_t v2;

  v1 = *v0;
  v2 = specialized _copySequenceToContiguousArray<A>(_:)(*v0);

  return v2;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance AVCaptureSynchronizedDataCollection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return specialized Sequence._copyContents(initializing:)(a1, a2, a3);
}

uint64_t specialized Sequence._copyContents(initializing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  _QWORD v11[2];
  __int128 v12;
  uint64_t v13;
  _OWORD v14[2];

  v6 = type metadata accessor for AVCaptureSynchronizedDataCollection.Iterator();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = NSFastEnumerationIterator.init(_:)();
  if (!a2)
  {
    a3 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
LABEL_12:
    outlined init with take of AVCaptureSynchronizedDataCollection.Iterator((uint64_t)v8, a1);
    return a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    NSFastEnumerationIterator.next()();
    if (v13)
    {
      v10 = 0;
      while (1)
      {
        outlined init with take of Sendable(&v12, v14);
        outlined init with take of Sendable(v14, &v12);
        type metadata accessor for AVMediaSelection(0, &lazy cache variable for type metadata for AVCaptureSynchronizedData);
        swift_dynamicCast();
        *(_QWORD *)(a2 + 8 * v10) = v11[1];
        if (a3 - 1 == v10)
          break;
        NSFastEnumerationIterator.next()();
        ++v10;
        if (!v13)
          goto LABEL_11;
      }
    }
    else
    {
      v10 = 0;
LABEL_11:
      outlined destroy of Any?((uint64_t)&v12);
      a3 = v10;
    }
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance AVCaptureSynchronizedDataCollection()
{
  type metadata accessor for AVMediaSelection(0, &lazy cache variable for type metadata for AVCaptureSynchronizedDataCollection);
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t initializeBufferWithCopyOfBuffer for AVCaptureSynchronizedDataCollection.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NSFastEnumerationIterator();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for AVCaptureSynchronizedDataCollection.Iterator(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for NSFastEnumerationIterator();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for AVCaptureSynchronizedDataCollection.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NSFastEnumerationIterator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for AVCaptureSynchronizedDataCollection.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NSFastEnumerationIterator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for AVCaptureSynchronizedDataCollection.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NSFastEnumerationIterator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for AVCaptureSynchronizedDataCollection.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NSFastEnumerationIterator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVCaptureSynchronizedDataCollection.Iterator()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2083824C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NSFastEnumerationIterator();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AVCaptureSynchronizedDataCollection.Iterator()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_208382508(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NSFastEnumerationIterator();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata completion function for AVCaptureSynchronizedDataCollection.Iterator()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for NSFastEnumerationIterator();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t outlined init with take of AVCaptureSynchronizedDataCollection.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AVCaptureSynchronizedDataCollection.Iterator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t specialized _copySequenceToContiguousArray<A>(_:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t *v17;
  int64_t v18;
  uint64_t v19;
  _QWORD *v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  const void *v26;
  BOOL v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  __int128 v32;
  uint64_t v33;
  _OWORD v34[2];

  v2 = type metadata accessor for AVCaptureSynchronizedDataCollection.Iterator();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = a1;
  NSFastEnumerationIterator.init(_:)();
  NSFastEnumerationIterator.next()();
  v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v7 = 0;
  if (v33)
  {
    v8 = &lazy cache variable for type metadata for AVCaptureSynchronizedData;
    v9 = 0x24BDB24E0uLL;
    v10 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
    v11 = MEMORY[0x24BEE4AD8] + 8;
    v31[0] = v4;
    while (1)
    {
      outlined init with take of Sendable(&v32, v34);
      outlined init with take of Sendable(v34, &v32);
      type metadata accessor for AVMediaSelection(0, v8);
      result = swift_dynamicCast();
      v13 = v31[1];
      if (!v7)
      {
        v14 = v6[3];
        if ((uint64_t)((v14 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_23;
        v15 = v11;
        v16 = v9;
        v17 = v8;
        v18 = v14 & 0xFFFFFFFFFFFFFFFELL;
        if (v18 <= 1)
          v19 = 1;
        else
          v19 = v18;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
        v20 = (_QWORD *)swift_allocObject();
        v21 = _swift_stdlib_malloc_size(v20);
        v22 = v21 - 32;
        if (v21 < 32)
          v22 = v21 - 25;
        v23 = v22 >> 3;
        v20[2] = v19;
        v20[3] = (2 * (v22 >> 3)) | 1;
        v24 = (unint64_t)(v20 + 4);
        v25 = v6[3] >> 1;
        if (v6[2])
        {
          v26 = v6 + 4;
          if (v20 != v6 || v24 >= (unint64_t)v26 + 8 * v25)
            memmove(v20 + 4, v26, 8 * v25);
          v6[2] = 0;
        }
        v10 = (_QWORD *)(v24 + 8 * v25);
        v7 = (v23 & 0x7FFFFFFFFFFFFFFFLL) - v25;
        result = swift_release();
        v6 = v20;
        v8 = v17;
        v9 = v16;
        v11 = v15;
        v4 = (char *)v31[0];
      }
      v27 = __OFSUB__(v7--, 1);
      if (v27)
        break;
      *v10++ = v13;
      NSFastEnumerationIterator.next()();
      if (!v33)
        goto LABEL_18;
    }
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
LABEL_18:
  outlined destroy of Any?((uint64_t)&v32);
  result = outlined destroy of AVCaptureSynchronizedDataCollection.Iterator((uint64_t)v4);
  v28 = v6[3];
  if (v28 < 2)
    return (uint64_t)v6;
  v29 = v28 >> 1;
  v27 = __OFSUB__(v29, v7);
  v30 = v29 - v7;
  if (!v27)
  {
    v6[2] = v30;
    return (uint64_t)v6;
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t outlined destroy of AVCaptureSynchronizedDataCollection.Iterator(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AVCaptureSynchronizedDataCollection.Iterator();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

AVPlayerItem __swiftcall AVPlayerItem.init(asset:automaticallyLoadedAssetKeys:)(AVAsset asset, Swift::OpaquePointer automaticallyLoadedAssetKeys)
{
  AVAssetInternal *v2;
  Class isa;
  uint64_t v4;
  char *v5;
  AVPlayerItemInternal *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  Class v22;
  char *v23;
  AVPlayerItem result;
  uint64_t v25;

  v2 = asset._asset;
  isa = asset.super.isa;
  if ((unint64_t)asset._asset >> 62)
  {
    v4 = _CocoaArrayWrapper.endIndex.getter();
    if (!v4)
      goto LABEL_16;
  }
  else
  {
    v4 = *(_QWORD *)(((uint64_t)asset._asset & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v4)
      goto LABEL_16;
  }
  v25 = MEMORY[0x24BEE4AF8];
  v5 = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4 & ~(v4 >> 63), 0);
  if (v4 < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  if (((unint64_t)v2 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    do
    {
      v8 = MEMORY[0x20BD059B8](v7, v2);
      v10 = *(_QWORD *)(v8 + 16);
      v9 = *(_QWORD *)(v8 + 24);
      swift_bridgeObjectRetain();
      swift_unknownObjectRelease();
      v12 = *(_QWORD *)(v25 + 16);
      v11 = *(_QWORD *)(v25 + 24);
      if (v12 >= v11 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
      ++v7;
      *(_QWORD *)(v25 + 16) = v12 + 1;
      v13 = v25 + 16 * v12;
      *(_QWORD *)(v13 + 32) = v10;
      *(_QWORD *)(v13 + 40) = v9;
    }
    while (v4 != v7);
  }
  else
  {
    v14 = 0;
    do
    {
      v15 = *((_QWORD *)v2 + v14 + 4);
      v17 = *(_QWORD *)(v15 + 16);
      v16 = *(_QWORD *)(v15 + 24);
      v19 = *(_QWORD *)(v25 + 16);
      v18 = *(_QWORD *)(v25 + 24);
      swift_bridgeObjectRetain();
      if (v19 >= v18 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v18 > 1), v19 + 1, 1);
      ++v14;
      *(_QWORD *)(v25 + 16) = v19 + 1;
      v20 = v25 + 16 * v19;
      *(_QWORD *)(v20 + 32) = v17;
      *(_QWORD *)(v20 + 40) = v16;
    }
    while (v4 != v14);
  }
LABEL_16:
  swift_bridgeObjectRelease();
  v21 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v22 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v23 = (char *)objc_msgSend(v21, sel_initWithAsset_automaticallyLoadedAssetKeys_, isa, v22);

  v5 = v23;
LABEL_18:
  result._playerItem = v6;
  result.super.isa = (Class)v5;
  return result;
}

uint64_t AVPlayerItem.seek(to:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t AVPlayerItem.seek(to:)()
{
  int8x16_t *v0;
  int8x16_t *v1;
  _QWORD *v2;

  v1 = (int8x16_t *)swift_task_alloc();
  v0[2].i64[0] = (uint64_t)v1;
  v1[1] = vextq_s8(v0[1], v0[1], 8uLL);
  v2 = (_QWORD *)swift_task_alloc();
  v0[2].i64[1] = (uint64_t)v2;
  *v2 = v0;
  v2[1] = AVPlayerItem.seek(to:);
  return withCheckedContinuation<A>(isolation:function:_:)();
}

{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 48));
}

void closure #1 in AVPlayerItem.seek(to:)(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Class isa;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD aBlock[6];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = partial apply for closure #1 in closure #1 in AVPlayerItem.seek(to:);
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@unowned Int) -> ();
  aBlock[3] = &block_descriptor_4;
  v10 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_seekToDate_completionHandler_, isa, v10);
  _Block_release(v10);

}

char *AVPlayerItem.speedRamp.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t v5;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;

  v1 = objc_msgSend(v0, sel_speedRamp);
  if (!v1)
    return (char *)v1;
  type metadata accessor for NSValue();
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_4;
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v3)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
LABEL_4:
  v23 = (_QWORD *)MEMORY[0x24BEE4AF8];
  result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    v1 = v23;
    do
    {
      if ((v2 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x20BD059B8](v5, v2);
      else
        v6 = *(id *)(v2 + 8 * v5 + 32);
      v7 = v6;
      objc_msgSend(v6, sel_CMTimeMappingValue, v11, v12, v13);
      v12 = v18;
      v13 = v16;
      v11 = v20;

      v9 = v23[2];
      v8 = v23[3];
      if (v9 >= v8 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v8 > 1), v9 + 1, 1);
      v23[2] = v9 + 1;
      v10 = &v23[12 * v9];
      v10[4] = v14;
      ++v5;
      v10[5] = v15;
      *((_OWORD *)v10 + 3) = v16;
      v10[8] = v17;
      *(_OWORD *)(v10 + 9) = v18;
      v10[11] = v19;
      *((_OWORD *)v10 + 6) = v20;
      v10[14] = v21;
      v10[15] = v22;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v1;
  }
  __break(1u);
  return result;
}

void AVPlayerItem.speedRamp.setter(objc_class *a1)
{
  void *v1;
  Class isa;
  uint64_t v3;
  void *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  id v14;
  _QWORD v15[2];
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  isa = a1;
  if (a1)
  {
    v3 = *((_QWORD *)a1 + 2);
    if (v3)
    {
      v23 = MEMORY[0x24BEE4AF8];
      specialized ContiguousArray.reserveCapacity(_:)();
      v4 = (void *)objc_opt_self();
      v5 = (char *)isa + 64;
      do
      {
        v6 = *((_QWORD *)v5 + 7);
        v7 = *((_QWORD *)v5 - 3);
        v8 = *(_QWORD *)v5;
        v9 = *((_QWORD *)v5 + 3);
        v10 = *((_QWORD *)v5 + 6);
        v11 = *((_OWORD *)v5 - 1);
        v12 = *(_OWORD *)(v5 + 8);
        v13 = *((_OWORD *)v5 + 2);
        v15[0] = *((_QWORD *)v5 - 4);
        v15[1] = v7;
        v16 = v11;
        v17 = v8;
        v18 = v12;
        v19 = v9;
        v20 = v13;
        v21 = v10;
        v22 = v6;
        v14 = objc_msgSend(v4, sel_valueWithCMTimeMapping_, v15);
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        v5 += 96;
        --v3;
      }
      while (v3);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    type metadata accessor for NSValue();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v1, sel_setSpeedRamp_, isa);

}

void (*AVPlayerItem.speedRamp.modify(char **a1))(objc_class **a1, char a2)
{
  char *v1;

  a1[1] = v1;
  *a1 = AVPlayerItem.speedRamp.getter();
  return AVPlayerItem.speedRamp.modify;
}

void AVPlayerItem.speedRamp.modify(objc_class **a1, char a2)
{
  objc_class *v2;

  if ((a2 & 1) != 0)
  {
    v2 = (objc_class *)swift_bridgeObjectRetain();
    AVPlayerItem.speedRamp.setter(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    AVPlayerItem.speedRamp.setter(*a1);
  }
}

void partial apply for closure #1 in AVPlayerItem.seek(to:)(uint64_t a1)
{
  uint64_t v1;

  closure #1 in AVPlayerItem.seek(to:)(a1, *(void **)(v1 + 16));
}

char *sub_2083830C8@<X0>(char **a1@<X8>)
{
  char *result;

  result = AVPlayerItem.speedRamp.getter();
  *a1 = result;
  return result;
}

void sub_2083830F0()
{
  objc_class *v0;

  v0 = (objc_class *)swift_bridgeObjectRetain();
  AVPlayerItem.speedRamp.setter(v0);
}

uint64_t sub_208383118()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in AVPlayerItem.seek(to:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  return CheckedContinuation.resume(returning:)();
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

uint64_t AVAssetImageGenerator.image(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[24] = a3;
  v4[25] = v3;
  v4[22] = a1;
  v4[23] = a2;
  return swift_task_switch();
}

uint64_t AVAssetImageGenerator.image(at:)()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v0[24];
  v1 = (void *)v0[25];
  v4 = v0[22];
  v3 = v0[23];
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = AVAssetImageGenerator.image(at:);
  v5 = swift_continuation_init();
  v0[19] = v4;
  v6 = v0 + 19;
  *(v6 - 9) = MEMORY[0x24BDAC760];
  *(v6 - 8) = 0x40000000;
  *(v6 - 7) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned CGImageRef?, @unowned CMTime, @unowned NSError?) -> () with result type (CGImageRef, CMTime);
  *(v6 - 6) = &block_descriptor_5;
  *(v6 - 5) = v5;
  v6[1] = v3;
  v6[2] = v2;
  objc_msgSend(v1, sel_generateCGImageAsynchronouslyForTime_completionHandler_, v6, v6 - 9);
  return swift_continuation_await();
}

{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 208) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 144));
}

{
  uint64_t v0;

  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned CGImageRef?, @unowned CMTime, @unowned NSError?) -> () with result type (CGImageRef, CMTime)(uint64_t result, void *a2, uint64_t *a3, void *a4)
{
  _QWORD *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;

  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    swift_allocError();
    *v5 = a4;
    v6 = a4;
    return swift_continuation_throwingResumeWithError();
  }
  else if (a2)
  {
    v7 = *a3;
    v8 = a3[1];
    v9 = a3[2];
    v10 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 64) + 40);
    *v10 = a2;
    v10[1] = v7;
    v10[2] = v8;
    v10[3] = v9;
    v11 = a2;
    return swift_continuation_throwingResume();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t AVAssetImageGenerator.images(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  v18 = a2;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  v4 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Continuation.BufferingPolicy);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = v2;
  v20 = a1;
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BEE6A10], v7);
  swift_bridgeObjectRetain();
  v15 = v2;
  AsyncStream.init(_:bufferingPolicy:_:)();
  swift_bridgeObjectRelease();
  AsyncStream.makeAsyncIterator()();

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(v18, v6, v17);
}

void AVAssetImageGenerator.ImageGeneratorMonitor.generateImages(forTimes:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void (**v7)(uint64_t, uint64_t *, void *, uint64_t *, uint64_t, void *);
  void (*v8)(uint64_t, uint64_t *, void *, uint64_t *, uint64_t, void *);
  id v9;
  Class isa;
  uint64_t v11;
  void *v12;
  uint64_t aBlock;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t *, void *, uint64_t *, uint64_t, void *);
  void *v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, void *);
  uint64_t v18;
  uint64_t v19;

  v2 = v1;
  v4 = *(void **)(v1 + 16);
  v5 = *(_QWORD *)(a1 + 16);
  if (v5)
  {
    v19 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray.reserveCapacity(_:)();
    v6 = (void *)objc_opt_self();
    v7 = (void (**)(uint64_t, uint64_t *, void *, uint64_t *, uint64_t, void *))(a1 + 48);
    do
    {
      v8 = *v7;
      aBlock = (uint64_t)*(v7 - 2);
      v14 = (uint64_t)*(v7 - 1);
      v15 = v8;
      v9 = objc_msgSend(v6, sel_valueWithCMTime_, &aBlock);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v7 += 3;
      --v5;
    }
    while (v5);
  }
  type metadata accessor for NSValue();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v2;
  *(_QWORD *)(v11 + 24) = a1;
  v17 = partial apply for closure #2 in AVAssetImageGenerator.ImageGeneratorMonitor.generateImages(forTimes:);
  v18 = v11;
  aBlock = MEMORY[0x24BDAC760];
  v14 = 1107296256;
  v15 = thunk for @escaping @callee_guaranteed @Sendable (@unowned CMTime, @guaranteed CGImageRef?, @unowned CMTime, @unowned AVAssetImageGeneratorResult, @guaranteed Error?) -> ();
  v16 = &block_descriptor_4_0;
  v12 = _Block_copy(&aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v4, sel_generateCGImagesAsynchronouslyForTimes_completionHandler_, isa, v12);
  _Block_release(v12);

}

void closure #2 in AVAssetImageGenerator.ImageGeneratorMonitor.generateImages(forTimes:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  void (*v17)(uint64_t *);
  void (*v18)(uint64_t *);
  id v19;
  void *v20;
  void (*v21)(uint64_t *);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;

  v11 = *(_QWORD *)(a10 + 24);
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  *(_QWORD *)(a10 + 24) = v13;
  if (a8 == 2)
  {
    v18 = *(void (**)(uint64_t *))(a10 + 32);
    v19 = (id)AVLocalizedError();
    if (!v19)
    {
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    v20 = v19;
    v22 = a1;
    v23 = a2;
    v24 = a3;
    v25 = v19;
    v27 = 0;
    v28 = 0;
    v26 = 0;
    v29 = 1;
    v18(&v22);

  }
  else
  {
    if (a8 == 1)
    {
      if (a9)
      {
        v17 = *(void (**)(uint64_t *))(a10 + 32);
        v22 = a1;
        v23 = a2;
        v24 = a3;
        v25 = a9;
        v27 = 0;
        v28 = 0;
        v26 = 0;
        v29 = 1;
        v17(&v22);
        goto LABEL_11;
      }
      goto LABEL_15;
    }
    if (a8)
    {
LABEL_18:
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return;
    }
    if (!a4)
    {
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
    v21 = *(void (**)(uint64_t *))(a10 + 32);
    v22 = a1;
    v23 = a2;
    v24 = a3;
    v25 = a4;
    v26 = a5;
    v27 = a6;
    v28 = a7;
    v29 = 0;
    v21(&v22);
  }
LABEL_11:
  if (*(_QWORD *)(a10 + 24) == *(_QWORD *)(a11 + 16))
    (*(void (**)(_QWORD))(a10 + 48))(0);
}

void thunk for @escaping @callee_guaranteed @Sendable (@unowned CMTime, @guaranteed CGImageRef?, @unowned CMTime, @unowned AVAssetImageGeneratorResult, @guaranteed Error?) -> ()(uint64_t a1, uint64_t *a2, void *a3, uint64_t *a4, uint64_t a5, void *a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void (*v15)(uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, void *);
  id v16;

  v8 = *a2;
  v9 = a2[1];
  v10 = a2[2];
  v11 = *a4;
  v12 = a4[1];
  v13 = a4[2];
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  swift_retain();
  v16 = a3;
  v14 = a6;
  v15(v8, v9, v10, a3, v11, v12, v13, a5, a6);
  swift_release();

}

uint64_t AVAssetImageGenerator.ImageGeneratorMonitor.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t closure #1 in AVAssetImageGenerator.Images.init(times:generator:)(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, uint64_t, uint64_t);
  unint64_t v12;
  uint64_t v13;
  void (*v14)(unint64_t, char *, uint64_t);
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  id v18;
  void *v20;
  uint64_t v21;

  v20 = a2;
  v21 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Continuation);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v20 - v9;
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)&v20 - v9, a1, v4);
  v12 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v13 = swift_allocObject();
  v14 = *(void (**)(unint64_t, char *, uint64_t))(v5 + 32);
  v14(v13 + v12, v10, v4);
  v11(v8, a1, v4);
  v15 = swift_allocObject();
  v14(v15 + v12, v8, v4);
  type metadata accessor for AVAssetImageGenerator.ImageGeneratorMonitor();
  v16 = (_QWORD *)swift_allocObject();
  v17 = v20;
  v16[2] = v20;
  v16[3] = 0;
  v16[4] = partial apply for closure #1 in closure #1 in AVAssetImageGenerator.Images.init(times:generator:);
  v16[5] = v13;
  v16[6] = partial apply for closure #2 in closure #1 in AVAssetImageGenerator.Images.init(times:generator:);
  v16[7] = v15;
  v18 = v17;
  AVAssetImageGenerator.ImageGeneratorMonitor.generateImages(forTimes:)(v21);
  return swift_release();
}

uint64_t partial apply for closure #1 in AVAssetImageGenerator.Images.init(times:generator:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in AVAssetImageGenerator.Images.init(times:generator:)(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t closure #1 in closure #1 in AVAssetImageGenerator.Images.init(times:generator:)(__int128 *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _OWORD v7[4];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Continuation.YieldResult);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with take of AVAssetImageGenerator.Images.Element(a1, v7);
  outlined retain of AVAssetImageGenerator.Images.Element((uint64_t)a1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Continuation);
  AsyncStream.Continuation.yield(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t AVAssetImageGenerator.Images.makeAsyncIterator()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of AVAssetImageGenerator.Images(v1, a1);
}

uint64_t outlined init with copy of AVAssetImageGenerator.Images(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AVAssetImageGenerator.Images();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for AVAssetImageGenerator.Images()
{
  uint64_t result;

  result = type metadata singleton initialization cache for AVAssetImageGenerator.Images;
  if (!type metadata singleton initialization cache for AVAssetImageGenerator.Images)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t AVAssetImageGenerator.Images.next()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 80) = a1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 88) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  *v2 = v1;
  v2[1] = AVAssetImageGenerator.Images.next();
  return AsyncStream.Iterator.next()();
}

uint64_t AVAssetImageGenerator.Images.next()()
{
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  __int128 v4;
  __int128 v5;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = *(_BYTE *)(v0 + 72);
  v4 = *(_OWORD *)(v0 + 32);
  v5 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)v1 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 + 16) = v4;
  *(_OWORD *)(v1 + 32) = v5;
  *(_QWORD *)(v1 + 48) = v2;
  *(_BYTE *)(v1 + 56) = v3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t protocol witness for AsyncSequence.makeAsyncIterator() in conformance AVAssetImageGenerator.Images@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with take of AVAssetImageGenerator.Images(v1, a1);
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance AVAssetImageGenerator.Images(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 80) = a1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 88) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  *v2 = v1;
  v2[1] = protocol witness for AsyncIteratorProtocol.next() in conformance AVAssetImageGenerator.Images;
  return AsyncStream.Iterator.next()();
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance AVAssetImageGenerator.Images()
{
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  __int128 v4;
  __int128 v5;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = *(_BYTE *)(v0 + 72);
  v4 = *(_OWORD *)(v0 + 32);
  v5 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)v1 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 + 16) = v4;
  *(_OWORD *)(v1 + 32) = v5;
  *(_QWORD *)(v1 + 48) = v2;
  *(_BYTE *)(v1 + 56) = v3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t _sSo21AVAssetImageGeneratorC12AVFoundationE6ImagesVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTW(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 80) = a1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 88) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  *v2 = v1;
  v2[1] = _sSo21AVAssetImageGeneratorC12AVFoundationE6ImagesVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_;
  return AsyncStream.Iterator.next()();
}

uint64_t _sSo21AVAssetImageGeneratorC12AVFoundationE6ImagesVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t AVAssetImageGenerator.Images.Element.requestedTime.getter()
{
  __int128 *v0;
  __int128 v2;

  outlined init with take of AVAssetImageGenerator.Images.Element(v0, &v2);
  return v2;
}

_OWORD *outlined init with take of AVAssetImageGenerator.Images.Element(__int128 *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  *(_OWORD *)((char *)a2 + 41) = *(__int128 *)((char *)a1 + 41);
  a2[1] = v3;
  a2[2] = v4;
  *a2 = v2;
  return a2;
}

__int128 *AVAssetImageGenerator.Images.Element.image.getter()
{
  __int128 *v0;
  __int128 *v1;
  void *v2;
  id v3;
  id v4;
  __int128 v6;
  void *v7;
  __int128 v8;
  __int128 *v9;
  char v10;

  v1 = v0;
  outlined init with take of AVAssetImageGenerator.Images.Element(v0, &v6);
  v2 = v7;
  outlined init with take of AVAssetImageGenerator.Images.Element(v1, &v8);
  if ((v10 & 1) != 0)
  {
    v3 = v2;
    swift_willThrow();
  }
  else
  {
    v1 = v9;
    v4 = v2;
  }
  return v1;
}

uint64_t AVAssetImageGenerator.Images.Element.actualTime.getter()
{
  __int128 *v0;
  __int128 *v1;
  void *v2;
  id v3;
  __int128 v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  char v9;

  v1 = v0;
  outlined init with take of AVAssetImageGenerator.Images.Element(v0, &v5);
  v2 = v6;
  outlined init with take of AVAssetImageGenerator.Images.Element(v1, &v7);
  if ((v9 & 1) == 0)
    return v8;
  v3 = v2;
  return swift_willThrow();
}

unint64_t lazy protocol witness table accessor for type AVAssetImageGenerator.Images and conformance AVAssetImageGenerator.Images()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type AVAssetImageGenerator.Images and conformance AVAssetImageGenerator.Images;
  if (!lazy protocol witness table cache variable for type AVAssetImageGenerator.Images and conformance AVAssetImageGenerator.Images)
  {
    v1 = type metadata accessor for AVAssetImageGenerator.Images();
    result = MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAssetImageGenerator.Images, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AVAssetImageGenerator.Images and conformance AVAssetImageGenerator.Images);
  }
  return result;
}

uint64_t type metadata accessor for AVAssetImageGenerator.ImageGeneratorMonitor()
{
  return objc_opt_self();
}

uint64_t initializeBufferWithCopyOfBuffer for AVAssetImageGenerator.Images(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for AVAssetImageGenerator.Images(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for AVAssetImageGenerator.Images(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for AVAssetImageGenerator.Images(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for AVAssetImageGenerator.Images(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for AVAssetImageGenerator.Images(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVAssetImageGenerator.Images()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20838429C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AVAssetImageGenerator.Images()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2083842E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void type metadata completion function for AVAssetImageGenerator.Images()
{
  unint64_t v0;

  type metadata accessor for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void type metadata accessor for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator)
  {
    v0 = type metadata accessor for AsyncStream.Iterator();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Iterator);
  }
}

id outlined copy of AVAssetImageGenerator.Images.Element(int a1, int a2, int a3, id a4)
{
  return a4;
}

void destroy for AVAssetImageGenerator.Images.Element(uint64_t a1)
{
  outlined consume of AVAssetImageGenerator.Images.Element(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(id *)(a1 + 24));
}

void outlined consume of AVAssetImageGenerator.Images.Element(int a1, int a2, int a3, id a4)
{

}

uint64_t initializeWithCopy for AVAssetImageGenerator.Images.Element(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = (void *)a2[3];
  v7 = a2[4];
  v8 = a2[5];
  v9 = a2[6];
  v10 = *((_BYTE *)a2 + 56);
  outlined copy of AVAssetImageGenerator.Images.Element(*a2, v4, v5, v6);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_BYTE *)(a1 + 56) = v10;
  return a1;
}

uint64_t *assignWithCopy for AVAssetImageGenerator.Images.Element(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = (void *)a2[3];
  v7 = a2[4];
  v8 = a2[5];
  v9 = a2[6];
  v10 = *((_BYTE *)a2 + 56);
  outlined copy of AVAssetImageGenerator.Images.Element(*a2, v4, v5, v6);
  v11 = *a1;
  v12 = a1[1];
  v13 = a1[2];
  v14 = (void *)a1[3];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = (uint64_t)v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  *((_BYTE *)a1 + 56) = v10;
  outlined consume of AVAssetImageGenerator.Images.Element(v11, v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t *assignWithTake for AVAssetImageGenerator.Images.Element(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;

  v3 = *(_QWORD *)(a2 + 48);
  v4 = *(_BYTE *)(a2 + 56);
  v5 = *a1;
  v7 = a1[1];
  v6 = a1[2];
  v8 = (void *)a1[3];
  v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v9;
  *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);
  a1[6] = v3;
  *((_BYTE *)a1 + 56) = v4;
  outlined consume of AVAssetImageGenerator.Images.Element(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVAssetImageGenerator.Images.Element(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 57))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 56);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AVAssetImageGenerator.Images.Element(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 57) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 57) = 0;
    if (a2)
      *(_BYTE *)(result + 56) = -(char)a2;
  }
  return result;
}

uint64_t getEnumTag for AVAssetImageGenerator.Images.Element(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 56);
}

uint64_t destructiveInjectEnumTag for AVAssetImageGenerator.Images.Element(uint64_t result, char a2)
{
  *(_BYTE *)(result + 56) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AVAssetImageGenerator.Images.Element()
{
  return &type metadata for AVAssetImageGenerator.Images.Element;
}

uint64_t sub_20838468C()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void partial apply for closure #2 in AVAssetImageGenerator.ImageGeneratorMonitor.generateImages(forTimes:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v9;

  closure #2 in AVAssetImageGenerator.ImageGeneratorMonitor.generateImages(forTimes:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, *(_QWORD *)(v9 + 16), *(_QWORD *)(v9 + 24));
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

uint64_t outlined init with take of AVAssetImageGenerator.Images(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AVAssetImageGenerator.Images();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in closure #1 in AVAssetImageGenerator.Images.init(times:generator:)(__int128 *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Continuation);
  return closure #1 in closure #1 in AVAssetImageGenerator.Images.init(times:generator:)(a1);
}

uint64_t objectdestroy_8Tm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Continuation);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

void partial apply for closure #2 in closure #1 in AVAssetImageGenerator.Images.init(times:generator:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetImageGenerator.Images.Element>.Continuation);
  AsyncStream.Continuation.finish()();
}

uint64_t outlined retain of AVAssetImageGenerator.Images.Element(uint64_t a1)
{
  outlined copy of AVAssetImageGenerator.Images.Element(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(id *)(a1 + 24));
  return a1;
}

uint64_t AVAssetExportSession.export(to:as:isolation:)@<X0>(uint64_t a1@<X1>, NSURL *a2@<X8>)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;

  v4 = v2;
  v3[2] = v2;
  URL._bridgeToObjectiveC()(a2);
  v7 = v6;
  objc_msgSend(v4, sel_setOutputURL_, v6);

  objc_msgSend(v4, sel_setOutputFileType_, a1);
  v8 = swift_task_alloc();
  v3[3] = v8;
  *(_QWORD *)(v8 + 16) = v4;
  v9 = swift_task_alloc();
  v3[4] = v9;
  *(_QWORD *)(v9 + 16) = v4;
  v10 = v4;
  v11 = (_QWORD *)swift_task_alloc();
  v3[5] = v11;
  *v11 = v3;
  v11[1] = AVAssetExportSession.export(to:as:isolation:);
  return withTaskCancellationHandler<A>(operation:onCancel:)();
}

uint64_t AVAssetExportSession.export(to:as:isolation:)()
{
  uint64_t *v0;
  void *v1;
  uint64_t v3;

  v1 = *(void **)(*v0 + 16);
  v3 = *v0;
  swift_task_dealloc();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t AVAssetExportSession.export(to:as:)@<X0>(uint64_t a1@<X1>, NSURL *a2@<X8>)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;

  v4 = v2;
  v3[2] = v2;
  URL._bridgeToObjectiveC()(a2);
  v7 = v6;
  objc_msgSend(v4, sel_setOutputURL_, v6);

  objc_msgSend(v4, sel_setOutputFileType_, a1);
  v8 = swift_task_alloc();
  v3[3] = v8;
  *(_QWORD *)(v8 + 16) = v4;
  v9 = swift_task_alloc();
  v3[4] = v9;
  *(_QWORD *)(v9 + 16) = v4;
  v10 = v4;
  v11 = (_QWORD *)swift_task_alloc();
  v3[5] = v11;
  *v11 = v3;
  v11[1] = AVAssetExportSession.export(to:as:);
  return withTaskCancellationHandler<A>(operation:onCancel:)();
}

uint64_t closure #1 in AVAssetExportSession.export(to:as:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 128) = a2;
  return swift_task_switch();
}

uint64_t closure #1 in AVAssetExportSession.export(to:as:)()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (void *)v0[16];
  v0[2] = v0;
  v0[3] = closure #1 in AVAssetExportSession.export(to:as:);
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = @objc completion handler block implementation for <A><A1, B1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ();
  v3[3] = &block_descriptor_37;
  v3[4] = v2;
  objc_msgSend(v1, sel_exportAsynchronouslyWithCompletionHandler_, v3);
  return swift_continuation_await();
}

{
  return swift_task_switch();
}

id closure #1 in AVAssetExportSession.export(to:as:)()
{
  uint64_t v0;
  id v1;
  uint64_t (*v2)(void);
  id result;
  void *v4;
  Swift::String v5;

  v1 = objc_msgSend(*(id *)(v0 + 128), sel_status);
  if (v1 == (id)5)
    goto LABEL_7;
  if (v1 == (id)4)
  {
    if (objc_msgSend(*(id *)(v0 + 128), sel_error))
      goto LABEL_8;
    __break(1u);
LABEL_7:
    result = (id)AVLocalizedError();
    if (!result)
    {
      __break(1u);
      return result;
    }
LABEL_8:
    swift_willThrow();
    v2 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v2();
  }
  if (v1 == (id)3)
  {
    v2 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v2();
  }
  v4 = *(void **)(v0 + 128);
  _StringGuts.grow(_:)(29);
  *(_QWORD *)(v0 + 80) = 0;
  *(_QWORD *)(v0 + 88) = 0xE000000000000000;
  v5._object = (void *)0x8000000208392070;
  v5._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v5);
  *(_QWORD *)(v0 + 120) = objc_msgSend(v4, sel_status);
  type metadata accessor for AVAssetExportSessionStatus(0);
  _print_unlocked<A, B>(_:_:)();
  return (id)_assertionFailure(_:_:file:line:flags:)();
}

uint64_t partial apply for closure #1 in AVAssetExportSession.export(to:as:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = partial apply for closure #1 in AVAssetExportSession.export(to:as:);
  v3[16] = v2;
  return swift_task_switch();
}

uint64_t closure #1 in AVAssetExportSession.export(to:as:)partial apply()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = closure #1 in AVAssetExportSession.export(to:as:)partial apply;
  v3[16] = v2;
  return swift_task_switch();
}

{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

id AVAssetExportSession.states(updateInterval:)@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  void *v2;

  *(_QWORD *)a1 = v2;
  *(double *)(a1 + 8) = a2;
  return v2;
}

_QWORD *initializeBufferWithCopyOfBuffer for AVAssetExportSession.State(_QWORD *a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF)
    v4 = v3;
  *a1 = v3;
  return a1;
}

void destroy for AVAssetExportSession.State(void **a1)
{
  void *v1;

  v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF)

}

void **assignWithCopy for AVAssetExportSession.State(void **a1, void **a2)
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

void **assignWithTake for AVAssetExportSession.State(void **a1, unint64_t *a2)
{
  void *v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
    goto LABEL_5;
  if (v4 < 0xFFFFFFFF)
  {

LABEL_5:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for AVAssetExportSession.State(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AVAssetExportSession.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 1;
  }
  return result;
}

uint64_t getEnumTag for AVAssetExportSession.State(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *destructiveInjectEnumTag for AVAssetExportSession.State(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for AVAssetExportSession.State()
{
  return &type metadata for AVAssetExportSession.State;
}

unint64_t lazy protocol witness table accessor for type AVAssetExportSession.ProgressStates and conformance AVAssetExportSession.ProgressStates()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AVAssetExportSession.ProgressStates and conformance AVAssetExportSession.ProgressStates;
  if (!lazy protocol witness table cache variable for type AVAssetExportSession.ProgressStates and conformance AVAssetExportSession.ProgressStates)
  {
    result = MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAssetExportSession.ProgressStates, &unk_24C098CD0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AVAssetExportSession.ProgressStates and conformance AVAssetExportSession.ProgressStates);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for AVAssetExportSession.ProgressStates(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  return a1;
}

uint64_t assignWithCopy for AVAssetExportSession.ProgressStates(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for AVAssetExportSession.ProgressStates(uint64_t a1, _QWORD *a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for AVAssetExportSession.ProgressStates(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AVAssetExportSession.ProgressStates(uint64_t result, int a2, int a3)
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

void *type metadata accessor for AVAssetExportSession.ProgressStates()
{
  return &unk_24C098CD0;
}

unint64_t lazy protocol witness table accessor for type AVAssetExportSession.ProgressStates.Iterator and conformance AVAssetExportSession.ProgressStates.Iterator()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type AVAssetExportSession.ProgressStates.Iterator and conformance AVAssetExportSession.ProgressStates.Iterator;
  if (!lazy protocol witness table cache variable for type AVAssetExportSession.ProgressStates.Iterator and conformance AVAssetExportSession.ProgressStates.Iterator)
  {
    v1 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator(255);
    result = MEMORY[0x20BD05EEC](&protocol conformance descriptor for AVAssetExportSession.ProgressStates.Iterator, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AVAssetExportSession.ProgressStates.Iterator and conformance AVAssetExportSession.ProgressStates.Iterator);
  }
  return result;
}

uint64_t type metadata accessor for AVAssetExportSession.ProgressStates.Iterator(uint64_t a1)
{
  return type metadata accessor for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(a1, (uint64_t *)&type metadata singleton initialization cache for AVAssetExportSession.ProgressStates.Iterator);
}

uint64_t AVAssetExportSession.ProgressStates.Iterator.StateInternal.init(forSnapshotOf:previousInternalState:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t v15;
  char *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSURL *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  Swift::String v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t aBlock;
  unint64_t v46;
  uint64_t (*v47)(uint64_t);
  void *v48;
  id (*v49)();
  uint64_t v50;
  id v51;

  v43 = (char *)a3;
  v44 = a2;
  v4 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v42 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = type metadata accessor for URL();
  v7 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Date();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = a1;
  v18 = objc_msgSend(a1, sel_status);
  switch((unint64_t)v18)
  {
    case 0uLL:

      outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v44, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
      v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
      return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v43, 1, 3, v21);
    case 1uLL:

      outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v44, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
      v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
      return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v43, 2, 3, v22);
    case 2uLL:
      outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v44, (uint64_t)v12, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v12, 1, v4) == 1)
      {
        outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?((uint64_t)v12, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
LABEL_10:
        v25 = objc_msgSend((id)objc_opt_self(), sel_progressWithTotalUnitCount_, 0x7FFFFE0000000000);
        objc_msgSend(v25, sel_setKind_, *MEMORY[0x24BDD11B0]);
        SendableExportSession.outputURLRequiringExportingStatus.getter(v17, (uint64_t)v9);
        URL._bridgeToObjectiveC()(v26);
        v28 = v27;
        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v41);
        objc_msgSend(v25, sel_setFileURL_, v28);

        objc_msgSend(v25, sel_setPausable_, 0);
        objc_msgSend(v25, sel_setCancellable_, 1);
        v29 = swift_allocObject();
        *(_QWORD *)(v29 + 16) = v17;
        v49 = partial apply for closure #1 in AVAssetExportSession.ProgressStates.Iterator.StateInternal.init(forSnapshotOf:previousInternalState:);
        v50 = v29;
        aBlock = MEMORY[0x24BDAC760];
        v46 = 1107296256;
        v47 = thunk for @escaping @callee_guaranteed @Sendable () -> ();
        v48 = &block_descriptor_6;
        v30 = _Block_copy(&aBlock);
        v31 = v17;
        swift_release();
        objc_msgSend(v25, sel_setCancellationHandler_, v30);
        _Block_release(v30);
        v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
        v33 = *(int *)(v32 + 48);
        v34 = (uint64_t)v42;
        static Date.now.getter();

        outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v44, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
        *(_QWORD *)(v34 + v33) = v25;
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v34, 0, 3, v32);
        return outlined init with take of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v34, (uint64_t)v43);
      }
      v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
      v24 = *(_QWORD *)(v23 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v12, 3, v23))
      {
        outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal((uint64_t)v12);
        goto LABEL_10;
      }

      outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v44, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
      v35 = *(_QWORD *)&v12[*(int *)(v23 + 48)];
      v36 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
      v36(v16, v12, v13);
      v37 = *(int *)(v23 + 48);
      v38 = (uint64_t)v43;
      v36(v43, v16, v13);
      *(_QWORD *)(v38 + v37) = v35;
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v24 + 56))(v38, 0, 3, v23);
    case 3uLL:
    case 4uLL:
    case 5uLL:

      outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v44, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
      v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
      return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v43, 3, 3, v19);
    default:
      aBlock = 0;
      v46 = 0xE000000000000000;
      _StringGuts.grow(_:)(24);
      v39._object = (void *)0x8000000208392050;
      v39._countAndFlagsBits = 0xD000000000000016;
      String.append(_:)(v39);
      v51 = v18;
      type metadata accessor for AVAssetExportSessionStatus(0);
      _print_unlocked<A, B>(_:_:)();
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      JUMPOUT(0x208385780);
  }
}

uint64_t SendableExportSession.outputURLRequiringExportingStatus.getter@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t result;
  uint64_t v15;

  v4 = type metadata accessor for URL();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(a1, sel_status) != (id)2)
  {
    __break(1u);
    goto LABEL_6;
  }
  v11 = objc_msgSend(a1, sel_outputURL);
  if (!v11)
  {
LABEL_6:
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, 1, 1, v4);
    goto LABEL_7;
  }
  v12 = v11;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  v13 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v13(v10, v7, v4);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v4);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4);
  if ((_DWORD)result != 1)
    return ((uint64_t (*)(uint64_t, char *, uint64_t))v13)(a2, v10, v4);
LABEL_7:
  __break(1u);
  return result;
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

uint64_t AVAssetExportSession.ProgressStates.Iterator.next()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[2] = a1;
  v2[3] = v1;
  v3 = type metadata accessor for Date();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
  v2[8] = swift_task_alloc();
  v2[9] = swift_task_alloc();
  v4 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  v2[10] = v4;
  v2[11] = *(_QWORD *)(v4 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t AVAssetExportSession.ProgressStates.Iterator.next()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void **v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int (*v23)(uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id *v27;
  void *v28;
  float v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;

  v2 = *(_QWORD *)(v0 + 120);
  v1 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 72);
  v4 = *(void ***)(v0 + 24);
  v5 = *v4;
  v6 = *(int *)(type metadata accessor for AVAssetExportSession.ProgressStates.Iterator(0) + 24);
  *(_DWORD *)(v0 + 168) = v6;
  v7 = (uint64_t)v4 + v6;
  outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v7, v3, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
  AVAssetExportSession.ProgressStates.Iterator.StateInternal.init(forSnapshotOf:previousInternalState:)(v5, v3, v1);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  *(_QWORD *)(v0 + 136) = v8;
  v9 = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v0 + 144) = v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 3, 3, v8);
  specialized static AVAssetExportSession.ProgressStates.Iterator.StateInternal.== infix(_:_:)(v1, v2);
  LOBYTE(v1) = v10;
  outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v2);
  if ((v1 & 1) != 0)
    goto LABEL_4;
  v11 = *(_QWORD *)(v0 + 80);
  v12 = *(_QWORD *)(v0 + 88);
  v13 = *(_QWORD *)(v0 + 64);
  outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v7, v13, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v13, 1, v11) == 1)
  {
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(*(_QWORD *)(v0 + 64), &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
    if ((static Task<>.isCancelled.getter() & 1) != 0)
    {
LABEL_4:
      v14 = *(_QWORD **)(v0 + 16);
      outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(_QWORD *)(v0 + 128));
      *v14 = 2;
      goto LABEL_14;
    }
LABEL_9:
    v20 = *(_QWORD *)(v0 + 136);
    v21 = *(_QWORD *)(v0 + 144);
    v22 = *(_QWORD *)(v0 + 104);
    outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(_QWORD *)(v0 + 128), v22);
    v23 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48);
    if (v23(v22, 3, v20))
    {
      outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(_QWORD *)(v0 + 104));
    }
    else
    {
      v25 = *(_QWORD *)(v0 + 40);
      v24 = *(_QWORD *)(v0 + 48);
      v27 = *(id **)(v0 + 24);
      v26 = *(_QWORD *)(v0 + 32);
      v28 = *(void **)(*(_QWORD *)(v0 + 104) + *(int *)(*(_QWORD *)(v0 + 136) + 48));
      (*(void (**)(uint64_t))(v25 + 32))(v24);
      objc_msgSend(*v27, sel_progress);
      specialized static AVAssetExportSession.ProgressStates.Iterator.updateProgress(_:exportProgress:exportingStartDate:)(v28, v29);

      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
    }
    v30 = *(_QWORD *)(v0 + 128);
    v31 = *(_QWORD *)(v0 + 136);
    v33 = *(_QWORD *)(v0 + 88);
    v32 = *(_QWORD *)(v0 + 96);
    v34 = *(_QWORD *)(v0 + 80);
    v35 = *(_QWORD *)(v0 + 24) + *(int *)(v0 + 168);
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v35, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
    outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v30, v35);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v33 + 56))(v35, 0, 1, v34);
    outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v30, v32);
    v36 = (char *)&loc_208385CBC + 4 * byte_20838F050[v23(v32, 3, v31)];
    __asm { BR              X10 }
  }
  v15 = *(_QWORD *)(v0 + 128);
  v16 = *(_QWORD *)(v0 + 112);
  outlined init with take of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(_QWORD *)(v0 + 64), v16);
  specialized static AVAssetExportSession.ProgressStates.Iterator.StateInternal.== infix(_:_:)(v15, v16);
  if ((v17 & 1) == 0)
  {
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(_QWORD *)(v0 + 112));
    if ((static Task<>.isCancelled.getter() & 1) != 0)
      goto LABEL_4;
    goto LABEL_9;
  }
  if ((static Task<>.isCancelled.getter() & 1) == 0)
  {
    v37 = *(_QWORD *)(v0 + 112);
    v38 = *(_QWORD *)(v0 + 56);
    v39 = *(uint64_t **)(v0 + 24);
    Date.init(timeIntervalSinceNow:)();
    v40 = *v39;
    v41 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v41;
    v41[2] = v40;
    v41[3] = v37;
    v41[4] = v38;
    v42 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v42;
    *v42 = v0;
    v42[1] = AVAssetExportSession.ProgressStates.Iterator.next();
    return withTaskGroup<A, B>(of:returning:isolation:body:)();
  }
  v18 = *(_QWORD *)(v0 + 128);
  v19 = *(_QWORD **)(v0 + 16);
  outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(_QWORD *)(v0 + 112));
  outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v18);
  *v19 = 2;
LABEL_14:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void **v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  void *v19;
  float v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 72);
  v5 = *(_QWORD *)(v0 + 56);
  v6 = *(_QWORD *)(v0 + 32);
  v7 = *(_QWORD *)(v0 + 40);
  v8 = *(void ***)(v0 + 24);
  v9 = *v8;
  outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?((uint64_t)v8 + *(int *)(v0 + 168), v4, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
  AVAssetExportSession.ProgressStates.Iterator.StateInternal.init(forSnapshotOf:previousInternalState:)(v9, v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v3);
  outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v2);
  outlined init with take of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v1, v2);
  if ((static Task<>.isCancelled.getter() & 1) == 0)
  {
    v11 = *(_QWORD *)(v0 + 136);
    v12 = *(_QWORD *)(v0 + 144);
    v13 = *(_QWORD *)(v0 + 104);
    outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(_QWORD *)(v0 + 128), v13);
    v14 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    if (v14(v13, 3, v11))
    {
      outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(_QWORD *)(v0 + 104));
    }
    else
    {
      v16 = *(_QWORD *)(v0 + 40);
      v15 = *(_QWORD *)(v0 + 48);
      v18 = *(id **)(v0 + 24);
      v17 = *(_QWORD *)(v0 + 32);
      v19 = *(void **)(*(_QWORD *)(v0 + 104) + *(int *)(*(_QWORD *)(v0 + 136) + 48));
      (*(void (**)(uint64_t))(v16 + 32))(v15);
      objc_msgSend(*v18, sel_progress);
      specialized static AVAssetExportSession.ProgressStates.Iterator.updateProgress(_:exportProgress:exportingStartDate:)(v19, v20);

      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    }
    v21 = *(_QWORD *)(v0 + 128);
    v22 = *(_QWORD *)(v0 + 136);
    v24 = *(_QWORD *)(v0 + 88);
    v23 = *(_QWORD *)(v0 + 96);
    v25 = *(_QWORD *)(v0 + 80);
    v26 = *(_QWORD *)(v0 + 24) + *(int *)(v0 + 168);
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v26, &demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
    outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v21, v26);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v24 + 56))(v26, 0, 1, v25);
    outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v21, v23);
    v27 = (char *)&loc_208386034 + 4 * byte_20838F054[v14(v23, 3, v22)];
    __asm { BR              X10 }
  }
  v10 = *(_QWORD **)(v0 + 16);
  outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(_QWORD *)(v0 + 128));
  *v10 = 2;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[4] = a4;
  v5[5] = a5;
  v5[2] = a2;
  v5[3] = a3;
  v6 = type metadata accessor for Date();
  v5[6] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[7] = v7;
  v5[8] = *(_QWORD *)(v7 + 64);
  v5[9] = swift_task_alloc();
  v8 = *(_QWORD *)(type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0) - 8);
  v5[10] = v8;
  v5[11] = *(_QWORD *)(v8 + 64);
  v5[12] = swift_task_alloc();
  v5[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  v5[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  uint64_t v25;

  v2 = v0[13];
  v1 = v0[14];
  v4 = v0[11];
  v3 = v0[12];
  v5 = v0[10];
  v7 = (void *)v0[3];
  v6 = v0[4];
  v8 = type metadata accessor for TaskPriority();
  v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56);
  v25 = v8;
  v24(v1, 1, 1);
  outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v6, v2);
  v9 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v10 = (v4 + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = 0;
  *(_QWORD *)(v11 + 24) = 0;
  outlined init with take of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v2, v11 + v9);
  *(_QWORD *)(v11 + v10) = v7;
  v12 = v7;
  _sScG7addTask8priority9operationyScPSg_xyYaYAcntFyt_Tg5(v1, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:), v11);
  outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v1, &demangling cache variable for type metadata for TaskPriority?);
  outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v6, v3);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 48))(v3, 3, v13))
  {
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v0[12]);
  }
  else
  {
    v14 = v0[14];
    v15 = v0[12];
    v16 = v0[9];
    v17 = v0[6];
    v18 = v0[7];
    v19 = v0[5];

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v15, v17);
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v24)(v14, 1, 1, v25);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v16, v19, v17);
    v20 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = 0;
    *(_QWORD *)(v21 + 24) = 0;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v18 + 32))(v21 + v20, v16, v17);
    _sScG7addTask8priority9operationyScPSg_xyYaYAcntFyt_Tg5(v14, (uint64_t)&async function pointer to partial apply for closure #2 in closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:), v21);
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v14, &demangling cache variable for type metadata for TaskPriority?);
  }
  v22 = (_QWORD *)swift_task_alloc();
  v0[15] = v22;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskGroup<()>);
  *v22 = v0;
  v22[1] = closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:);
  return TaskGroup.next(isolation:)();
}

{
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  MEMORY[0x20BD05838](**(_QWORD **)(v0 + 16), MEMORY[0x24BEE4AE0] + 8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #1 in closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v8;

  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v8;
  *v8 = v5;
  v8[1] = partial apply for closure #1 in AVAssetExportSession.export(to:as:);
  return specialized static AVAssetExportSession.ProgressStates.Iterator.untilInternalStateWillChange(from:accordingTo:)(a4, a5);
}

uint64_t _sScG7addTask8priority9operationyScPSg_xyYaYAcntFyt_Tg5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
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
  _QWORD *v18;
  _QWORD v20[4];
  _QWORD v21[4];

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(a1, (uint64_t)v10, &demangling cache variable for type metadata for TaskPriority?);
  v11 = type metadata accessor for TaskPriority();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?((uint64_t)v10, &demangling cache variable for type metadata for TaskPriority?);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v13 = dispatch thunk of Actor.unownedExecutor.getter();
      v15 = v14;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v16 = *v4;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  v18 = (_QWORD *)(v15 | v13);
  if (v15 | v13)
  {
    v21[0] = 0;
    v21[1] = 0;
    v18 = v21;
    v21[2] = v13;
    v21[3] = v15;
  }
  v20[1] = 1;
  v20[2] = v18;
  v20[3] = v16;
  swift_task_create();
  return swift_release();
}

uint64_t closure #2 in closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t closure #2 in closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:)()
{
  uint64_t v0;
  _QWORD *v1;

  Date.nanosecondsSinceNow.getter();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = closure #2 in closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:);
  return static Task<>.sleep(nanoseconds:)();
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 32) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t Date.nanosecondsSinceNow.getter()
{
  double v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  double v4;
  double v5;

  Date.timeIntervalSinceNow.getter();
  if (v0 <= 0.0)
    v1 = 0x8000000000000400;
  else
    v1 = 0x7FFFFFFFFFFFFC00;
  Date.timeIntervalSinceNow.getter();
  if ((~v2 & 0x7FF0000000000000) == 0)
    return v1;
  result = Date.timeIntervalSinceNow.getter();
  v5 = v4 * 1000000000.0;
  if (v5 >= 9.22337204e18 || v5 <= -9.22337204e18)
    return v1;
  if ((~*(_QWORD *)&v5 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (v5 <= -9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v5 < 9.22337204e18)
    return (uint64_t)v5;
LABEL_16:
  __break(1u);
  return result;
}

void closure #1 in static AVAssetExportSession.ProgressStates.Iterator.untilInternalStateWillChange(from:accordingTo:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _QWORD v6[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetExportSessionStatus>.Continuation.YieldResult);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6[1] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetExportSessionStatus>.Continuation);
  AsyncStream.Continuation.yield(_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if ((unint64_t)(a1 - 3) <= 2)
    AsyncStream.Continuation.finish()();
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance AVAssetExportSession.ProgressStates.Iterator(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = protocol witness for AsyncIteratorProtocol.next() in conformance AVAssetExportSession.ProgressStates.Iterator;
  return AVAssetExportSession.ProgressStates.Iterator.next()(a1);
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance AVAssetExportSession.ProgressStates.Iterator()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t _sSo20AVAssetExportSessionC12AVFoundationE14ProgressStates33_D1D93B46B4622E2FDA3EC9B1BC7A64BDLLV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTW(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = _sSo20AVAssetExportSessionC12AVFoundationE14ProgressStates33_D1D93B46B4622E2FDA3EC9B1BC7A64BDLLV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_;
  return AVAssetExportSession.ProgressStates.Iterator.next()(a1);
}

uint64_t protocol witness for AsyncSequence.makeAsyncIterator() in conformance AVAssetExportSession.ProgressStates@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t result;

  v3 = *v1;
  v4 = v1[1];
  v5 = (char *)a1 + *(int *)(type metadata accessor for AVAssetExportSession.ProgressStates.Iterator(0) + 24);
  v6 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(uint64_t a1)
{
  return type metadata accessor for AVPlayerItemIntegratedTimeline.PeriodicTimes.Iterator(a1, (uint64_t *)&type metadata singleton initialization cache for AVAssetExportSession.ProgressStates.Iterator.StateInternal);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTRyt_Tg5(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = _sSo20AVAssetExportSessionC12AVFoundationE14ProgressStates33_D1D93B46B4622E2FDA3EC9B1BC7A64BDLLV8IteratorVScIACScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_;
  return v6(a1);
}

void specialized static AVAssetExportSession.ProgressStates.Iterator.StateInternal.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
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

  v4 = type metadata accessor for Date();
  MEMORY[0x24BDAC7A8](v4);
  v5 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  MEMORY[0x24BDAC7A8](v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (AVAssetExportSession.ProgressStates.Iterator.StateInternal, AVAssetExportSession.ProgressStates.Iterator.StateInternal));
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (uint64_t)&v9[*(int *)(v7 + 48)];
  outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(a1, (uint64_t)v9);
  outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(a2, v10);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  v12 = (char *)sub_208386C48
      + 4
      * byte_20838F058[(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v9, 3, v11)];
  __asm { BR              X10 }
}

uint64_t sub_208386C48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  void *v9;
  char v10;
  void *v12;
  char v13;
  void (*v14)(uint64_t, uint64_t);

  outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v0, v1);
  v8 = *(int *)(v5 + 48);
  v9 = *(void **)(v1 + v8);
  if (v7(v4, 3, v5))
  {

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v2);
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(v0, &demangling cache variable for type metadata for (AVAssetExportSession.ProgressStates.Iterator.StateInternal, AVAssetExportSession.ProgressStates.Iterator.StateInternal));
  }
  else
  {
    v12 = *(void **)(v4 + v8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v3, v4, v2);
    v13 = static Date.== infix(_:_:)();
    v14 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v14(v1, v2);
    if ((v13 & 1) != 0)
    {
      type metadata accessor for NSObject();
      v10 = static NSObject.== infix(_:_:)();

      v14(v3, v2);
      outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v0);
      return v10 & 1;
    }
    v14(v3, v2);

    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v0);
  }
  v10 = 0;
  return v10 & 1;
}

uint64_t outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id specialized static AVAssetExportSession.ProgressStates.Iterator.updateProgress(_:exportProgress:exportingStartDate:)(void *a1, float a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id result;
  float v9;
  uint64_t v10;

  v4 = type metadata accessor for Date();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(a1, sel_totalUnitCount);
  v9 = (float)(uint64_t)result * a2;
  if ((~LODWORD(v9) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v9 <= -9.2234e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v9 >= 9.2234e18)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  objc_msgSend(a1, sel_setCompletedUnitCount_, (uint64_t)v9);
  static Date.now.getter();
  Date.timeIntervalSince(_:)();
  result = (id)(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (a2 > 0.0)
    return (id)NSProgress.estimatedTimeRemaining.setter();
  return result;
}

uint64_t outlined init with take of AVAssetExportSession.ProgressStates.Iterator.StateInternal(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v9;
  *v9 = v3;
  v9[1] = closure #1 in AVAssetExportSession.export(to:as:)partial apply;
  return closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:)(a1, a2, v6, v7, v8);
}

uint64_t sub_20838702C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  swift_unknownObjectRelease();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v0 + v2, 3, v4))
  {
    v5 = type metadata accessor for Date();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v0 + v2, v5);

  }
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  v2 = *(_QWORD *)(type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v0 + v3;
  v5 = *(_QWORD *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFF8));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = partial apply for closure #1 in AVAssetExportSession.export(to:as:);
  v7 = (_QWORD *)swift_task_alloc();
  v6[2] = v7;
  *v7 = v6;
  v7[1] = partial apply for closure #1 in AVAssetExportSession.export(to:as:);
  return specialized static AVAssetExportSession.ProgressStates.Iterator.untilInternalStateWillChange(from:accordingTo:)(v4, v5);
}

uint64_t sub_20838719C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = type metadata accessor for Date();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t partial apply for closure #2 in closure #1 in static AVAssetExportSession.ProgressStates.Iterator.advancementToNextInterestingState(after:accordingTo:deadline:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for Date() - 8) + 80);
  v3 = v0 + ((v2 + 32) & ~v2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = partial apply for closure #1 in AVAssetExportSession.export(to:as:);
  v4[2] = v3;
  return swift_task_switch();
}

uint64_t outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2083872CC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTRyt_Tg5TA(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = partial apply for closure #1 in AVAssetExportSession.export(to:as:);
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTRyt_Tg5Tu
                                                 + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTRyt_Tg5Tu))(a1, v4);
}

uint64_t specialized static AVAssetExportSession.ProgressStates.Iterator.untilInternalStateWillChange(from:accordingTo:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2[5] = a1;
  v2[6] = a2;
  v3 = type metadata accessor for Date();
  v2[7] = v3;
  v2[8] = *(_QWORD *)(v3 - 8);
  v2[9] = swift_task_alloc();
  v2[10] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (AVAssetExportSession.ProgressStates.Iterator.StateInternal, AVAssetExportSession.ProgressStates.Iterator.StateInternal));
  v2[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
  v2[12] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetExportSessionStatus>.Iterator);
  v2[13] = v4;
  v2[14] = *(_QWORD *)(v4 - 8);
  v2[15] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetExportSessionStatus>.Continuation.BufferingPolicy);
  v2[16] = v5;
  v2[17] = *(_QWORD *)(v5 - 8);
  v2[18] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetExportSessionStatus>.Continuation);
  v2[19] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v2[20] = v7;
  v2[21] = *(_QWORD *)(v7 + 64);
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetExportSessionStatus>);
  v2[24] = v8;
  v2[25] = *(_QWORD *)(v8 - 8);
  v2[26] = swift_task_alloc();
  v9 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  v2[27] = v9;
  v2[28] = *(_QWORD *)(v9 - 8);
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t specialized static AVAssetExportSession.ProgressStates.Iterator.untilInternalStateWillChange(from:accordingTo:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  _QWORD *v19;
  uint64_t v20;

  v1 = *(_QWORD *)(v0 + 248);
  v2 = *(_QWORD *)(v0 + 256);
  outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(*(_QWORD *)(v0 + 40), v2);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  *(_QWORD *)(v0 + 264) = v3;
  v4 = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v0 + 272) = v4;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v1, 3, 3, v3);
  specialized static AVAssetExportSession.ProgressStates.Iterator.StateInternal.== infix(_:_:)(v2, v1);
  v6 = v5;
  outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v1);
  result = outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v2);
  if ((v6 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 184);
    v20 = *(_QWORD *)(v0 + 176);
    v9 = *(_QWORD *)(v0 + 160);
    v11 = *(_QWORD *)(v0 + 144);
    v10 = *(_QWORD *)(v0 + 152);
    v13 = *(_QWORD *)(v0 + 128);
    v12 = *(_QWORD *)(v0 + 136);
    v14 = *(void **)(v0 + 48);
    type metadata accessor for AVAssetExportSessionStatus(0);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v12 + 104))(v11, *MEMORY[0x24BEE6A10], v13);
    static AsyncStream.makeStream(of:bufferingPolicy:)();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v20, v8, v10);
    v15 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    v16 = swift_allocObject();
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 32))(v16 + v15, v20, v10);
    *(_QWORD *)(v0 + 32) = v14;
    swift_getKeyPath();
    v17 = (_QWORD *)swift_allocObject();
    v17[2] = partial apply for closure #1 in static AVAssetExportSession.ProgressStates.Iterator.untilInternalStateWillChange(from:accordingTo:);
    v17[3] = v16;
    v17[4] = v14;
    v18 = v14;
    swift_retain();
    *(_QWORD *)(v0 + 280) = _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)();
    swift_release();
    swift_release();

    swift_release();
    AsyncStream.makeAsyncIterator()();
    v19 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 288) = v19;
    *v19 = v0;
    v19[1] = specialized static AVAssetExportSession.ProgressStates.Iterator.untilInternalStateWillChange(from:accordingTo:);
    return AsyncStream.Iterator.next(isolation:)();
  }
  return result;
}

{
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  if ((*(_BYTE *)(v0 + 24) & 1) == 0)
  {
    v1 = *(_QWORD *)(v0 + 272);
    v20 = *(_QWORD *)(v0 + 264);
    v2 = *(_QWORD *)(v0 + 240);
    v3 = *(_QWORD *)(v0 + 216);
    v4 = *(_QWORD *)(v0 + 224);
    v6 = *(_QWORD *)(v0 + 88);
    v5 = *(_QWORD *)(v0 + 96);
    v7 = *(_QWORD *)(v0 + 80);
    v9 = *(_QWORD *)(v0 + 40);
    v8 = *(void **)(v0 + 48);
    outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v9, v5);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v4 + 56))(v5, 0, 1, v3);
    AVAssetExportSession.ProgressStates.Iterator.StateInternal.init(forSnapshotOf:previousInternalState:)(v8, v5, v2);
    v10 = v6 + *(int *)(v7 + 48);
    outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v2, v6);
    outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v9, v10);
    v11 = (char *)&loc_2083878A4
        + 4 * byte_20838F05C[(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v6, 3, v20)];
    __asm { BR              X10 }
  }
  v12 = *(void **)(v0 + 280);
  v13 = *(_QWORD *)(v0 + 200);
  v14 = *(_QWORD *)(v0 + 208);
  v16 = *(_QWORD *)(v0 + 184);
  v15 = *(_QWORD *)(v0 + 192);
  v17 = *(_QWORD *)(v0 + 152);
  v18 = *(_QWORD *)(v0 + 160);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 112) + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 104));
  dispatch thunk of NSKeyValueObservation.invalidate()();

  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  if ((*(_BYTE *)(v0 + 24) & 1) == 0)
  {
    v1 = *(_QWORD *)(v0 + 272);
    v20 = *(_QWORD *)(v0 + 264);
    v2 = *(_QWORD *)(v0 + 240);
    v3 = *(_QWORD *)(v0 + 216);
    v4 = *(_QWORD *)(v0 + 224);
    v6 = *(_QWORD *)(v0 + 88);
    v5 = *(_QWORD *)(v0 + 96);
    v7 = *(_QWORD *)(v0 + 80);
    v9 = *(_QWORD *)(v0 + 40);
    v8 = *(void **)(v0 + 48);
    outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v9, v5);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v4 + 56))(v5, 0, 1, v3);
    AVAssetExportSession.ProgressStates.Iterator.StateInternal.init(forSnapshotOf:previousInternalState:)(v8, v5, v2);
    v10 = v6 + *(int *)(v7 + 48);
    outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v2, v6);
    outlined init with copy of AVAssetExportSession.ProgressStates.Iterator.StateInternal(v9, v10);
    v11 = (char *)&loc_208387C98
        + 4 * byte_20838F060[(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v6, 3, v20)];
    __asm { BR              X10 }
  }
  v12 = *(void **)(v0 + 280);
  v13 = *(_QWORD *)(v0 + 200);
  v14 = *(_QWORD *)(v0 + 208);
  v16 = *(_QWORD *)(v0 + 184);
  v15 = *(_QWORD *)(v0 + 192);
  v17 = *(_QWORD *)(v0 + 152);
  v18 = *(_QWORD *)(v0 + 160);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 112) + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 104));
  dispatch thunk of NSKeyValueObservation.invalidate()();

  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_208387F68()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetExportSessionStatus>.Continuation);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

void partial apply for closure #1 in static AVAssetExportSession.ProgressStates.Iterator.untilInternalStateWillChange(from:accordingTo:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<AVAssetExportSessionStatus>.Continuation);
  closure #1 in static AVAssetExportSession.ProgressStates.Iterator.untilInternalStateWillChange(from:accordingTo:)(a1);
}

char *keypath_get_selector_status()
{
  return sel_status;
}

id sub_208388018@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_status);
  *a2 = result;
  return result;
}

uint64_t sub_208388048()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in SendableExportSession.onInitialAndChangedStatus(execute:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(id))(v0 + 16))(objc_msgSend(*(id *)(v0 + 32), sel_status));
}

uint64_t sub_2083880B0()
{
  uint64_t v0;

  return swift_deallocObject();
}

id partial apply for closure #1 in AVAssetExportSession.ProgressStates.Iterator.StateInternal.init(forSnapshotOf:previousInternalState:)()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_cancelExport);
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

uint64_t *initializeBufferWithCopyOfBuffer for AVAssetExportSession.ProgressStates.Iterator.StateInternal(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void (*v13)(uint64_t *, _QWORD, uint64_t, uint64_t);
  id v14;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 3, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v10 = type metadata accessor for Date();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
      v11 = *(int *)(v7 + 48);
      v12 = *(void **)((char *)a2 + v11);
      *(uint64_t *)((char *)a1 + v11) = (uint64_t)v12;
      v13 = *(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56);
      v14 = v12;
      v13(a1, 0, 3, v7);
    }
  }
  return a1;
}

void destroy for AVAssetExportSession.ProgressStates.Iterator.StateInternal(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 3, v2))
  {
    v3 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);

  }
}

char *initializeWithCopy for AVAssetExportSession.ProgressStates.Iterator.StateInternal(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void (*v11)(char *, _QWORD, uint64_t, uint64_t);
  id v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = type metadata accessor for Date();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    v9 = *(int *)(v6 + 48);
    v10 = *(void **)&a2[v9];
    *(_QWORD *)&a1[v9] = v10;
    v11 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56);
    v12 = v10;
    v11(a1, 0, 3, v6);
  }
  return a1;
}

char *assignWithCopy for AVAssetExportSession.ProgressStates.Iterator.StateInternal(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void (*v14)(char *, _QWORD, uint64_t, uint64_t);
  id v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 3, v6);
  v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      v17 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(a1, a2, v17);
      v18 = *(int *)(v6 + 48);
      v19 = *(void **)&a2[v18];
      v20 = *(void **)&a1[v18];
      *(_QWORD *)&a1[v18] = v19;
      v21 = v19;

      return a1;
    }
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?((uint64_t)a1, &demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v11 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
  v12 = *(int *)(v6 + 48);
  v13 = *(void **)&a2[v12];
  *(_QWORD *)&a1[v12] = v13;
  v14 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56);
  v15 = v13;
  v14(a1, 0, 3, v6);
  return a1;
}

uint64_t outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *initializeWithTake for AVAssetExportSession.ProgressStates.Iterator.StateInternal(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = type metadata accessor for Date();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    *(_QWORD *)&a1[*(int *)(v6 + 48)] = *(_QWORD *)&a2[*(int *)(v6 + 48)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

char *assignWithTake for AVAssetExportSession.ProgressStates.Iterator.StateInternal(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 3, v6);
  v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      v13 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(a1, a2, v13);
      v14 = *(int *)(v6 + 48);
      v15 = *(void **)&a1[v14];
      *(_QWORD *)&a1[v14] = *(_QWORD *)&a2[v14];

      return a1;
    }
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?((uint64_t)a1, &demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v11 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, a2, v11);
  *(_QWORD *)&a1[*(int *)(v6 + 48)] = *(_QWORD *)&a2[*(int *)(v6 + 48)];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVAssetExportSession.ProgressStates.Iterator.StateInternal()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_208388688(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 4)
    return v5 - 3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AVAssetExportSession.ProgressStates.Iterator.StateInternal()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2083886E4(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 3);
  else
    v5 = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t getEnumTag for AVAssetExportSession.ProgressStates.Iterator.StateInternal(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 3, v2);
}

uint64_t destructiveInjectEnumTag for AVAssetExportSession.ProgressStates.Iterator.StateInternal(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 3, v4);
}

uint64_t type metadata completion function for AVAssetExportSession.ProgressStates.Iterator.StateInternal()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for AVAssetExportSession.ProgressStates.Iterator(char *a1, char **a2, uint64_t a3)
{
  int v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(char *, uint64_t, uint64_t);
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void (*v19)(char *, _QWORD, uint64_t, uint64_t);
  id v20;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v5 = a1;
    *((_QWORD *)a1 + 1) = a2[1];
    v6 = *(int *)(a3 + 24);
    v7 = &a1[v6];
    v8 = (char *)a2 + v6;
    v9 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
    v10 = *(_QWORD *)(v9 - 8);
    v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    v12 = v4;
    if (v11(v8, 1, v9))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
      v15 = *(_QWORD *)(v14 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 3, v14))
      {
        memcpy(v7, v8, *(_QWORD *)(v10 + 64));
      }
      else
      {
        v16 = type metadata accessor for Date();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v7, v8, v16);
        v17 = *(int *)(v14 + 48);
        v18 = *(void **)&v8[v17];
        *(_QWORD *)&v7[v17] = v18;
        v19 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56);
        v20 = v18;
        v19(v7, 0, 3, v14);
      }
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
  }
  return v5;
}

void destroy for AVAssetExportSession.ProgressStates.Iterator(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (char *)a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5))
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v4, 3, v6))
    {
      v7 = type metadata accessor for Date();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v4, v7);

    }
  }
}

_QWORD *initializeWithCopy for AVAssetExportSession.ProgressStates.Iterator(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(char *, uint64_t, uint64_t);
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void (*v19)(char *, _QWORD, uint64_t, uint64_t);
  id v20;

  v5 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)(a2 + v6);
  v9 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v5;
  if (v11(v8, 1, v9))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
    v15 = *(_QWORD *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 3, v14))
    {
      memcpy(v7, v8, *(_QWORD *)(v10 + 64));
    }
    else
    {
      v16 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v7, v8, v16);
      v17 = *(int *)(v14 + 48);
      v18 = *(void **)&v8[v17];
      *(_QWORD *)&v7[v17] = v18;
      v19 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56);
      v20 = v18;
      v19(v7, 0, 3, v14);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  return a1;
}

uint64_t assignWithCopy for AVAssetExportSession.ProgressStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(char *, uint64_t, uint64_t);
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void (*v28)(char *, _QWORD, uint64_t, uint64_t);
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void (*v33)(char *, _QWORD, uint64_t, uint64_t);
  id v34;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v9 = *(int *)(a3 + 24);
  v10 = (char *)(a1 + v9);
  v11 = (char *)(a2 + v9);
  v12 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
      v21 = *(_QWORD *)(v20 - 8);
      v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48);
      v23 = v22(v10, 3, v20);
      v24 = v22(v11, 3, v20);
      if (v23)
      {
        if (!v24)
        {
          v25 = type metadata accessor for Date();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v10, v11, v25);
          v26 = *(int *)(v20 + 48);
          v27 = *(void **)&v11[v26];
          *(_QWORD *)&v10[v26] = v27;
          v28 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56);
          v29 = v27;
          v28(v10, 0, 3, v20);
          return a1;
        }
      }
      else
      {
        if (!v24)
        {
          v36 = type metadata accessor for Date();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 24))(v10, v11, v36);
          v37 = *(int *)(v20 + 48);
          v38 = *(void **)&v11[v37];
          v39 = *(void **)&v10[v37];
          *(_QWORD *)&v10[v37] = v38;
          v40 = v38;

          return a1;
        }
        outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?((uint64_t)v10, &demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
      }
      v19 = *(_QWORD *)(v13 + 64);
      goto LABEL_8;
    }
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal((uint64_t)v10);
LABEL_7:
    v19 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?)
                                - 8)
                    + 64);
LABEL_8:
    memcpy(v10, v11, v19);
    return a1;
  }
  if (v16)
    goto LABEL_7;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v11, 3, v17))
  {
    memcpy(v10, v11, *(_QWORD *)(v13 + 64));
  }
  else
  {
    v30 = type metadata accessor for Date();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v10, v11, v30);
    v31 = *(int *)(v17 + 48);
    v32 = *(void **)&v11[v31];
    *(_QWORD *)&v10[v31] = v32;
    v33 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56);
    v34 = v32;
    v33(v10, 0, 3, v17);
  }
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

_OWORD *initializeWithTake for AVAssetExportSession.ProgressStates.Iterator(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *a1 = *a2;
  v4 = *(int *)(a3 + 24);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
    v11 = *(_QWORD *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 3, v10))
    {
      memcpy(v5, v6, *(_QWORD *)(v8 + 64));
    }
    else
    {
      v12 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v5, v6, v12);
      *(_QWORD *)&v5[*(int *)(v10 + 48)] = *(_QWORD *)&v6[*(int *)(v10 + 48)];
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v5, 0, 3, v10);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

uint64_t assignWithTake for AVAssetExportSession.ProgressStates.Iterator(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(char *, uint64_t, uint64_t);
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  void *v28;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  v7 = *(int *)(a3 + 24);
  v8 = (char *)(a1 + v7);
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
      v19 = *(_QWORD *)(v18 - 8);
      v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
      v21 = v20(v8, 3, v18);
      v22 = v20(v9, 3, v18);
      if (v21)
      {
        if (!v22)
        {
          v23 = type metadata accessor for Date();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v8, v9, v23);
          *(_QWORD *)&v8[*(int *)(v18 + 48)] = *(_QWORD *)&v9[*(int *)(v18 + 48)];
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v8, 0, 3, v18);
          return a1;
        }
      }
      else
      {
        if (!v22)
        {
          v26 = type metadata accessor for Date();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 40))(v8, v9, v26);
          v27 = *(int *)(v18 + 48);
          v28 = *(void **)&v8[v27];
          *(_QWORD *)&v8[v27] = *(_QWORD *)&v9[v27];

          return a1;
        }
        outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal?((uint64_t)v8, &demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
      }
      v17 = *(_QWORD *)(v11 + 64);
      goto LABEL_8;
    }
    outlined destroy of AVAssetExportSession.ProgressStates.Iterator.StateInternal((uint64_t)v8);
LABEL_7:
    v17 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?)
                                - 8)
                    + 64);
LABEL_8:
    memcpy(v8, v9, v17);
    return a1;
  }
  if (v14)
    goto LABEL_7;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (startDate: Date, progress: NSProgress));
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v9, 3, v15))
  {
    memcpy(v8, v9, *(_QWORD *)(v11 + 64));
  }
  else
  {
    v24 = type metadata accessor for Date();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v8, v9, v24);
    *(_QWORD *)&v8[*(int *)(v15 + 48)] = *(_QWORD *)&v9[*(int *)(v15 + 48)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v8, 0, 3, v15);
  }
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVAssetExportSession.ProgressStates.Iterator()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_208389170(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 24)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for AVAssetExportSession.ProgressStates.Iterator()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_2083891FC(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

void type metadata completion function for AVAssetExportSession.ProgressStates.Iterator()
{
  unint64_t v0;

  type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal?();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal?()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?)
  {
    type metadata accessor for AVAssetExportSession.ProgressStates.Iterator.StateInternal(255);
    v0 = type metadata accessor for Optional();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for AVAssetExportSession.ProgressStates.Iterator.StateInternal?);
  }
}

void *type metadata accessor for SendableExportSession()
{
  return &unk_24C098C88;
}

uint64_t specialized AVAsynchronousKeyValueLoading.status<A>(of:)(_QWORD *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void (*v14)(id *__return_ptr, id *);
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v20;
  Swift::String v21;
  Swift::String v22;
  Swift::String v23;
  id v24;
  id v25;
  unint64_t v26;
  uint64_t v27;

  v2 = v1;
  v27 = *MEMORY[0x24BDAC8D0];
  v4 = type metadata accessor for CancellationError();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (id)a1[2];
  v9 = (void *)a1[3];
  v10 = (void *)MEMORY[0x20BD05754](v8, v9);
  v25 = 0;
  v11 = objc_msgSend(v2, sel_statusOfValueForKey_error_, v10, &v25);

  v12 = v25;
  switch((unint64_t)v11)
  {
    case 0uLL:
      return 0;
    case 1uLL:
      return 1;
    case 2uLL:
      v14 = (void (*)(id *__return_ptr, id *))a1[4];
      v24 = v2;
      v15 = v25;
      v14(&v25, &v24);

      return (uint64_t)v25;
    case 3uLL:
      if (v25)
        return (uint64_t)v25;
      v16 = (id)AVLocalizedError();
      if (v16)
        return (uint64_t)v16;
      goto LABEL_16;
    case 4uLL:
      v8 = v25;
      AVFall2022OSVersions();
      if ((dyld_program_sdk_at_least() & 1) != 0)
      {
        v13 = (id)AVLocalizedError();
        if (!v13)
        {
          __break(1u);
LABEL_16:
          __break(1u);
LABEL_17:
          v25 = 0;
          v26 = 0xE000000000000000;
          v20 = v12;
          _StringGuts.grow(_:)(33);
          v21._object = (void *)0x8000000208391B40;
          v21._countAndFlagsBits = 0xD000000000000014;
          String.append(_:)(v21);
          v24 = v11;
          type metadata accessor for AVKeyValueStatus(0);
          _print_unlocked<A, B>(_:_:)();
          v22._countAndFlagsBits = 0x79656B20726F6620;
          v22._object = (void *)0xE900000000000020;
          String.append(_:)(v22);
          v23._countAndFlagsBits = (uint64_t)v8;
          v23._object = v9;
          String.append(_:)(v23);
          _assertionFailure(_:_:file:line:flags:)();
          __break(1u);
          JUMPOUT(0x208389674);
        }
        v25 = v13;

      }
      else
      {
        CancellationError.init()();
        lazy protocol witness table accessor for type CancellationError and conformance CancellationError();
        v17 = (void *)swift_allocError();
        (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v18, v7, v4);
        v25 = (id)_convertErrorToNSError(_:)();
        LOBYTE(v26) = 1;

      }
      return (uint64_t)v25;
    default:
      goto LABEL_17;
  }
}

uint64_t specialized AVAsynchronousKeyValueLoading.load<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 120) = a1;
  *(_QWORD *)(v2 + 128) = v1;
  return swift_task_switch();
}

uint64_t specialized AVAsynchronousKeyValueLoading.load<A>(_:)()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Class isa;
  uint64_t v7;
  _QWORD *v8;

  v1 = v0[15];
  v2 = (void *)v0[16];
  v4 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_20838E820;
  *(_QWORD *)(v5 + 32) = v4;
  *(_QWORD *)(v5 + 40) = v3;
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  v0[17] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = specialized AVAsynchronousKeyValueLoading.load<A>(_:);
  v7 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v8 = v0 + 10;
  v8[1] = 0x40000000;
  v8[2] = @objc completion handler block implementation for <A><A1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ();
  v8[3] = &block_descriptor_6_0;
  v8[4] = v7;
  objc_msgSend(v2, sel_loadValuesAsynchronouslyForKeys_completionHandler_, isa, v8);
  return swift_continuation_await();
}

{
  return swift_task_switch();
}

{
  uint64_t v0;
  _QWORD *v1;
  void *v2;
  char v3;
  void *v4;
  char v6;
  Swift::String v7;

  v1 = *(_QWORD **)(v0 + 120);

  v2 = (void *)specialized AVAsynchronousKeyValueLoading.status<A>(of:)(v1);
  v4 = v2;
  if (v3 == 1)
  {
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else if (v3)
  {
    v6 = v3;
    outlined copy of AVAsyncProperty<AVAssetTrack, [CMFormatDescriptionRef]>.Status(v2, v3);
    _StringGuts.grow(_:)(20);
    swift_bridgeObjectRelease();
    v7._countAndFlagsBits = specialized AVAsyncProperty.Status.description.getter(v4, v6, &demangling cache variable for type metadata for [AVAssetTrack], (void (*)(void *, uint64_t))outlined consume of AVAsyncProperty<AVAsset, [AVAssetTrack]>.Status);
    String.append(_:)(v7);
    swift_bridgeObjectRelease();
    return _assertionFailure(_:_:file:line:flags:)();
  }
  else
  {
    return (*(uint64_t (**)(void *))(v0 + 8))(v2);
  }
}

uint64_t specialized closure #1 in AVAsyncProperty<>.init(key:)(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  void *v6;
  id v7;
  _OWORD v9[2];
  _BYTE v10[32];
  uint64_t v11;

  v6 = (void *)MEMORY[0x20BD05754](a2, a3);
  v7 = objc_msgSend(a1, sel_valueForKey_, v6);

  if (v7)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  outlined init with take of Any?((uint64_t)v9, (uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Any?);
  __swift_instantiateConcreteTypeFromMangledName(a4);
  swift_dynamicCast();
  return v11;
}

uint64_t specialized AVAsyncProperty.Status.description.getter(void *a1, char a2, uint64_t *a3, void (*a4)(void *, uint64_t))
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  void *v12;
  uint64_t v13;
  Swift::String v15;
  Swift::String v16;
  uint64_t v18;

  if (!a2)
  {
    v18 = 0;
    swift_bridgeObjectRetain();
    v15._countAndFlagsBits = 0x2820646564616F4CLL;
    v15._object = (void *)0xE800000000000000;
    String.append(_:)(v15);
    __swift_instantiateConcreteTypeFromMangledName(a3);
    _print_unlocked<A, B>(_:_:)();
    v16._countAndFlagsBits = 41;
    v16._object = (void *)0xE100000000000000;
    String.append(_:)(v16);
    v12 = a1;
    v13 = 0;
    goto LABEL_5;
  }
  if (a2 == 1)
  {
    v18 = 0x282064656C696146;
    v6 = objc_msgSend(a1, sel_description);
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = v8;

    v10._countAndFlagsBits = v7;
    v10._object = v9;
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    v11._countAndFlagsBits = 41;
    v11._object = (void *)0xE100000000000000;
    String.append(_:)(v11);
    v12 = a1;
    v13 = 1;
LABEL_5:
    a4(v12, v13);
    return v18;
  }
  if (a1)
    return 0x676E6964616F4CLL;
  else
    return 0x2074657920746F4ELL;
}

uint64_t AVMutableComposition.insertTimeRange(_:of:at:isolation:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)(v7 + 312) = a4;
  *(_QWORD *)(v7 + 320) = a5;
  *(_QWORD *)(v7 + 296) = a2;
  *(_QWORD *)(v7 + 304) = a3;
  v8 = *a1;
  *(_QWORD *)(v7 + 328) = v6;
  *(_QWORD *)(v7 + 336) = v8;
  v9 = *((_OWORD *)a1 + 2);
  *(_OWORD *)(v7 + 344) = *((_OWORD *)a1 + 1);
  v10 = *(_OWORD *)(a1 + 1);
  *((_QWORD *)&v10 + 1) = v9;
  *(_OWORD *)(v7 + 472) = v10;
  *(_QWORD *)(v7 + 360) = a1[5];
  if (a6)
  {
    swift_getObjectType();
    v11 = dispatch thunk of Actor.unownedExecutor.getter();
    v13 = v12;
  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  *(_QWORD *)(v7 + 368) = v11;
  *(_QWORD *)(v7 + 376) = v13;
  return swift_task_switch();
}

uint64_t AVMutableComposition.insertTimeRange(_:of:at:isolation:)()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *inited;
  uint64_t v3;
  _QWORD *v4;

  v1 = swift_allocObject();
  v0[48] = v1;
  *(_QWORD *)(v1 + 16) = 0x736B63617274;
  *(_QWORD *)(v1 + 24) = 0xE600000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAsyncProperty<AVAsset, [AVAssetTrack]>);
  inited = (_QWORD *)swift_initStackObject();
  v0[49] = inited;
  inited[4] = partial apply for specialized closure #1 in AVAsyncProperty<>.init(key:);
  inited[5] = v1;
  inited[2] = 0x736B63617274;
  inited[3] = 0xE600000000000000;
  v3 = async function pointer to specialized AVAsynchronousKeyValueLoading.load<A>(_:);
  v4 = (_QWORD *)swift_task_alloc();
  v0[50] = v4;
  *v4 = v0;
  v4[1] = AVMutableComposition.insertTimeRange(_:of:at:isolation:);
  return ((uint64_t (*)(uint64_t))((char *)&async function pointer to specialized AVAsynchronousKeyValueLoading.load<A>(_:)
                                          + v3))((uint64_t)inited);
}

{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
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
  unsigned int v15;
  void *v16;
  id v17;
  uint64_t (*v18)(void);
  uint64_t v19;
  _QWORD *inited;
  id v22;
  void *v23;
  uint64_t (*v24)(void);

  v1 = v0[51];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v0[53] = v2;
  v3 = v0[51];
  if (v2)
  {
    if ((v3 & 0xC000000000000001) != 0)
      v4 = (id)MEMORY[0x20BD059B8](0);
    else
      v4 = *(id *)(v3 + 32);
    v0[54] = v4;
    v0[55] = 1;
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = 0xD000000000000012;
    *(_QWORD *)(v19 + 24) = 0x8000000208392090;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAsyncProperty<AVAssetTrack, [CMFormatDescriptionRef]>);
    inited = (_QWORD *)swift_initStackObject();
    v0[56] = inited;
    inited[4] = partial apply for specialized closure #1 in AVAsyncProperty<>.init(key:);
    inited[5] = v19;
    inited[2] = 0xD000000000000012;
    inited[3] = 0x8000000208392090;
    return swift_task_switch();
  }
  else
  {
    v6 = v0[44];
    v5 = v0[45];
    v8 = v0[42];
    v7 = v0[43];
    v9 = v0[40];
    v23 = (void *)v0[41];
    v10 = v0[38];
    v11 = v0[39];
    v12 = v0[37];
    v13 = v0[59];
    v14 = v0[60];
    swift_bridgeObjectRelease();
    v0[22] = v8;
    v0[23] = v13;
    v0[24] = v7;
    v0[25] = v6;
    v0[26] = v14;
    v0[27] = v5;
    v0[33] = v10;
    v0[34] = v11;
    v0[35] = v9;
    v0[36] = 0;
    v15 = objc_msgSend(v23, sel_insertTimeRange_ofAsset_atTime_error_, v0 + 22, v12, v0 + 33, v0 + 36);
    v16 = (void *)v0[36];
    if (v15)
    {
      v24 = (uint64_t (*)(void))v0[1];
      v17 = v16;
      v18 = v24;
    }
    else
    {
      v22 = v16;
      _convertNSErrorToError(_:)();

      swift_willThrow();
      v18 = (uint64_t (*)(void))v0[1];
    }
    return v18();
  }
}

{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Class isa;
  uint64_t v7;
  _QWORD *v8;

  v1 = v0[56];
  v2 = (void *)v0[54];
  v4 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_20838E820;
  *(_QWORD *)(v5 + 32) = v4;
  *(_QWORD *)(v5 + 40) = v3;
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  v0[57] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = AVMutableComposition.insertTimeRange(_:of:at:isolation:);
  v7 = swift_continuation_init();
  v0[28] = MEMORY[0x24BDAC760];
  v8 = v0 + 28;
  v8[1] = 0x40000000;
  v8[2] = @objc completion handler block implementation for <A><A1>@escaping @callee_unowned @convention(block) @Sendable () -> () with result type ();
  v8[3] = &block_descriptor_7;
  v8[4] = v7;
  objc_msgSend(v2, sel_loadValuesAsynchronouslyForKeys_completionHandler_, isa, v8);
  return swift_continuation_await();
}

{
  return swift_task_switch();
}

{
  uint64_t v0;
  _QWORD *v1;
  void *v2;
  char v3;
  void *v4;
  char v6;
  Swift::String v7;

  v1 = *(_QWORD **)(v0 + 448);

  v2 = (void *)specialized AVAsynchronousKeyValueLoading.status<A>(of:)(v1);
  v4 = v2;
  *(_QWORD *)(v0 + 464) = v2;
  if (v3 == 1)
  {
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    swift_bridgeObjectRelease();
    swift_release();
    return swift_task_switch();
  }
  if (!v3)
  {
    swift_setDeallocating();
    swift_bridgeObjectRelease();
    swift_release();
    outlined consume of AVAsyncProperty<AVAssetTrack, [CMFormatDescriptionRef]>.Status(v4, 0);
    return swift_task_switch();
  }
  v6 = v3;
  outlined copy of AVAsyncProperty<AVAssetTrack, [CMFormatDescriptionRef]>.Status(v2, v3);
  _StringGuts.grow(_:)(20);
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = specialized AVAsyncProperty.Status.description.getter(v4, v6, &demangling cache variable for type metadata for [CMFormatDescriptionRef], (void (*)(void *, uint64_t))outlined consume of AVAsyncProperty<AVAssetTrack, [CMFormatDescriptionRef]>.Status);
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  uint64_t v0;
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
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  void *v14;
  id v15;
  uint64_t (*v16)(void);
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v22;
  _QWORD *inited;
  id v24;
  uint64_t (*v25)(void);

  v1 = *(_QWORD *)(v0 + 440);
  v2 = *(_QWORD *)(v0 + 424);

  if (v1 == v2)
  {
    v4 = *(_QWORD *)(v0 + 352);
    v3 = *(_QWORD *)(v0 + 360);
    v6 = *(_QWORD *)(v0 + 336);
    v5 = *(_QWORD *)(v0 + 344);
    v7 = *(_QWORD *)(v0 + 320);
    v24 = *(id *)(v0 + 328);
    v8 = *(_QWORD *)(v0 + 304);
    v9 = *(_QWORD *)(v0 + 312);
    v10 = *(_QWORD *)(v0 + 296);
    v11 = *(_QWORD *)(v0 + 472);
    v12 = *(_QWORD *)(v0 + 480);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 176) = v6;
    *(_QWORD *)(v0 + 184) = v11;
    *(_QWORD *)(v0 + 192) = v5;
    *(_QWORD *)(v0 + 200) = v4;
    *(_QWORD *)(v0 + 208) = v12;
    *(_QWORD *)(v0 + 216) = v3;
    *(_QWORD *)(v0 + 264) = v8;
    *(_QWORD *)(v0 + 272) = v9;
    *(_QWORD *)(v0 + 280) = v7;
    *(_QWORD *)(v0 + 288) = 0;
    v13 = objc_msgSend(v24, sel_insertTimeRange_ofAsset_atTime_error_, v0 + 176, v10, v0 + 264, v0 + 288);
    v14 = *(void **)(v0 + 288);
    if (v13)
    {
      v25 = *(uint64_t (**)(void))(v0 + 8);
      v15 = v14;
      v16 = v25;
    }
    else
    {
      v20 = v14;
      _convertNSErrorToError(_:)();

      swift_willThrow();
      v16 = *(uint64_t (**)(void))(v0 + 8);
    }
    return v16();
  }
  else
  {
    v17 = *(_QWORD *)(v0 + 440);
    v18 = *(_QWORD *)(v0 + 408);
    if ((v18 & 0xC000000000000001) != 0)
      v19 = (id)MEMORY[0x20BD059B8](*(_QWORD *)(v0 + 440));
    else
      v19 = *(id *)(v18 + 8 * v17 + 32);
    *(_QWORD *)(v0 + 432) = v19;
    *(_QWORD *)(v0 + 440) = v17 + 1;
    if (__OFADD__(v17, 1))
      __break(1u);
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = 0xD000000000000012;
    *(_QWORD *)(v22 + 24) = 0x8000000208392090;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AVAsyncProperty<AVAssetTrack, [CMFormatDescriptionRef]>);
    inited = (_QWORD *)swift_initStackObject();
    *(_QWORD *)(v0 + 448) = inited;
    inited[4] = partial apply for specialized closure #1 in AVAsyncProperty<>.init(key:);
    inited[5] = v22;
    inited[2] = 0xD000000000000012;
    inited[3] = 0x8000000208392090;
    return swift_task_switch();
  }
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;

  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AVMutableComposition.insertTimeRange(_:of:at:isolation:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 408) = a1;
  *(_QWORD *)(v3 + 416) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_20838A72C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for specialized closure #1 in AVAsyncProperty<>.init(key:)@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = specialized closure #1 in AVAsyncProperty<>.init(key:)(*a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), &demangling cache variable for type metadata for [AVAssetTrack]);
  *a2 = result;
  return result;
}

{
  uint64_t v2;
  uint64_t result;

  result = specialized closure #1 in AVAsyncProperty<>.init(key:)(*a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), &demangling cache variable for type metadata for [CMFormatDescriptionRef]);
  *a2 = result;
  return result;
}

id outlined copy of AVAsyncProperty<AVAssetTrack, [CMFormatDescriptionRef]>.Status(id result, char a2)
{
  if (a2 == 1)
    return result;
  if (!a2)
    return (id)swift_bridgeObjectRetain();
  return result;
}

void outlined consume of AVAsyncProperty<AVAssetTrack, [CMFormatDescriptionRef]>.Status(void *a1, char a2)
{
  if (a2 == 1)
  {

  }
  else if (!a2)
  {
    swift_bridgeObjectRelease();
  }
}

char *AVCapturePhotoOutput.supportedFlashModes.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v1 = objc_msgSend(v0, sel_supportedFlashModes);
  type metadata accessor for NSNumber();
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_13;
LABEL_3:
  v12 = MEMORY[0x24BEE4AF8];
  result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    v6 = v12;
    do
    {
      if ((v2 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x20BD059B8](v5, v2);
      else
        v7 = *(id *)(v2 + 8 * v5 + 32);
      v8 = v7;
      v9 = objc_msgSend(v7, sel_integerValue);

      v11 = *(_QWORD *)(v12 + 16);
      v10 = *(_QWORD *)(v12 + 24);
      if (v11 >= v10 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1);
      ++v5;
      *(_QWORD *)(v12 + 16) = v11 + 1;
      *(_QWORD *)(v12 + 8 * v11 + 32) = v9;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

char *AVCapturePhotoOutput.availablePhotoPixelFormatTypes.getter()
{
  return AVAssetVariantVideoAttributes.codecTypes.getter((SEL *)&selRef_availablePhotoPixelFormatTypes);
}

char *AVCapturePhotoOutput.availableRawPhotoPixelFormatTypes.getter()
{
  return AVAssetVariantVideoAttributes.codecTypes.getter((SEL *)&selRef_availableRawPhotoPixelFormatTypes);
}

void AVCapturePhotoOutput.supportedPhotoPixelFormatTypes(for:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void AVCapturePhotoOutput.supportedRawPhotoPixelFormatTypes(for:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

char *AVCapturePhotoSettings.availablePreviewPhotoPixelFormatTypes.getter()
{
  return AVAssetVariantVideoAttributes.codecTypes.getter((SEL *)&selRef_availablePreviewPhotoPixelFormatTypes);
}

void AVCapturePhoto.cgImageRepresentation()()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void AVCapturePhoto.previewCGImageRepresentation()()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void AVSampleBufferVideoRenderer.presentationTimeExpectation.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 24) = 1;
}

id key path setter for AVSampleBufferVideoRenderer.presentationTimeExpectation : AVSampleBufferVideoRenderer(uint64_t *a1, void **a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  _QWORD v8[3];

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  v5 = *((unsigned __int8 *)a1 + 24);
  v6 = *a2;
  if (v5 == 1)
  {
    if (v4 | v3 | v2)
      return objc_msgSend(v6, sel_expectMonotonicallyIncreasingUpcomingSampleBufferPresentationTimes);
    else
      return objc_msgSend(v6, sel_resetUpcomingSampleBufferPresentationTimeExpectations);
  }
  else
  {
    v8[0] = v2;
    v8[1] = v3;
    v8[2] = v4;
    return objc_msgSend(v6, sel_expectMinimumUpcomingSampleBufferPresentationTime_, v8);
  }
}

id AVSampleBufferVideoRenderer.presentationTimeExpectation.setter(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[3];

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  if (*(_BYTE *)(a1 + 24) == 1)
  {
    if (v3 | v2 | *(_QWORD *)a1)
      return objc_msgSend(v1, sel_expectMonotonicallyIncreasingUpcomingSampleBufferPresentationTimes);
    else
      return objc_msgSend(v1, sel_resetUpcomingSampleBufferPresentationTimeExpectations);
  }
  else
  {
    v5[0] = *(_QWORD *)a1;
    v5[1] = v2;
    v5[2] = v3;
    return objc_msgSend(v1, sel_expectMinimumUpcomingSampleBufferPresentationTime_, v5);
  }
}

void (*AVSampleBufferVideoRenderer.presentationTimeExpectation.modify(_QWORD *a1))(uint64_t **a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[7] = v1;
  v3[1] = 0;
  v3[2] = 0;
  *v3 = 0;
  *((_BYTE *)v3 + 24) = 1;
  return AVSampleBufferVideoRenderer.presentationTimeExpectation.modify;
}

void AVSampleBufferVideoRenderer.presentationTimeExpectation.modify(uint64_t **a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v1 = *a1;
  v2 = (uint64_t)(*a1 + 4);
  v3 = **a1;
  v4 = (*a1)[1];
  v5 = (*a1)[2];
  if (*((_BYTE *)*a1 + 24))
  {
    v6 = (void *)v1[7];
    if (v5 | v4 | v3)
      objc_msgSend(v6, sel_expectMonotonicallyIncreasingUpcomingSampleBufferPresentationTimes, v2);
    else
      objc_msgSend(v6, sel_resetUpcomingSampleBufferPresentationTimeExpectations, v2);
  }
  else
  {
    v7 = (void *)v1[7];
    v1[4] = v3;
    v1[5] = v4;
    v1[6] = v5;
    objc_msgSend(v7, sel_expectMinimumUpcomingSampleBufferPresentationTime_, v2);
  }
  free(v1);
}

void sub_20838ACA8(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 24) = 1;
}

__n128 __swift_memcpy25_4(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for AVSampleBufferVideoRenderer.PresentationTimeExpectation(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AVSampleBufferVideoRenderer.PresentationTimeExpectation(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 12) = 0;
    *(_QWORD *)(result + 4) = 0;
    *(_QWORD *)(result + 17) = 0;
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
  *(_BYTE *)(result + 25) = v3;
  return result;
}

uint64_t getEnumTag for AVSampleBufferVideoRenderer.PresentationTimeExpectation(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t destructiveInjectEnumTag for AVSampleBufferVideoRenderer.PresentationTimeExpectation(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    *(_BYTE *)(result + 24) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AVSampleBufferVideoRenderer.PresentationTimeExpectation()
{
  return &type metadata for AVSampleBufferVideoRenderer.PresentationTimeExpectation;
}

id AVPlayerVideoOutput.taggedBuffers(forHostTime:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  void *v4;
  uint64_t v6;
  uint64_t v7;
  id result;
  __int128 v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[3];
  id v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BDC0D40];
  v7 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
  v16 = 0;
  *(_QWORD *)&v17 = v6;
  *((_QWORD *)&v17 + 1) = *(_QWORD *)(MEMORY[0x24BDC0D40] + 8);
  v18 = v7;
  v15[0] = a1;
  v15[1] = a2;
  v15[2] = a3;
  result = objc_msgSend(v4, sel_copyTaggedBufferGroupForHostTime_presentationTimeStamp_activeConfiguration_, v15, &v17, &v16);
  v9 = 0uLL;
  if (!result)
    goto LABEL_5;
  v10 = result;
  v11 = v16;
  if (!v16)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_20838E820;
    *(_QWORD *)(v14 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v14 + 32) = 0xD00000000000005DLL;
    *(_QWORD *)(v14 + 40) = 0x80000002083920E0;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();

    v9 = 0uLL;
    result = 0;
LABEL_5:
    v13 = 0;
    v11 = 0;
    goto LABEL_6;
  }
  v12 = v16;
  result = (id)Array<A>.init(taggedBufferGroup:)();
  v9 = v17;
  v13 = v18;
LABEL_6:
  *(_QWORD *)a4 = result;
  *(_OWORD *)(a4 + 8) = v9;
  *(_QWORD *)(a4 + 24) = v13;
  *(_QWORD *)(a4 + 32) = v11;
  return result;
}

id AVVideoOutputSpecification.init(tagCollections:)(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  Class isa;
  id v10;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v14 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
    v2 = 0;
    v3 = v14;
    do
    {
      swift_bridgeObjectRetain();
      v4 = Array<A>.tagCollection.getter();
      type metadata accessor for CMTagCollectionRef(0);
      v13 = v5;
      swift_bridgeObjectRelease();
      *(_QWORD *)&v12 = v4;
      v14 = v3;
      v7 = *(_QWORD *)(v3 + 16);
      v6 = *(_QWORD *)(v3 + 24);
      if (v7 >= v6 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v6 > 1), v7 + 1, 1);
        v3 = v14;
      }
      ++v2;
      *(_QWORD *)(v3 + 16) = v7 + 1;
      outlined init with take of Sendable(&v12, (_OWORD *)(v3 + 32 * v7 + 32));
    }
    while (v1 != v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v8, sel_initWithTagCollections_, isa);

  return v10;
}

Swift::Void __swiftcall AVVideoOutputSpecification.setOutputPixelBufferAttributes(_:for:)(Swift::OpaquePointer_optional _, Swift::OpaquePointer a2)
{
  void *v2;
  NSDictionary v3;
  id v4;

  if (_.value._rawValue)
    v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  else
    v3.super.isa = 0;
  v4 = (id)Array<A>.tagCollection.getter();
  objc_msgSend(v2, sel_setOutputPixelBufferAttributes_forTagCollection_, v3.super.isa, v4);

}

Swift::Void __swiftcall AVVideoOutputSpecification.setOutputSettings(_:for:)(Swift::OpaquePointer_optional _, Swift::OpaquePointer a2)
{
  void *v2;
  NSDictionary v3;
  id v4;

  if (_.value._rawValue)
  {
    specialized _dictionaryUpCast<A, B, C, D>(_:)((uint64_t)_.value._rawValue);
    v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v3.super.isa = 0;
  }
  v4 = (id)Array<A>.tagCollection.getter();
  objc_msgSend(v2, sel_setOutputSettings_forTagCollection_, v3.super.isa, v4);

}

uint64_t AVVideoOutputSpecification.preferredTagCollections.getter()
{
  return AVVideoOutputSpecification.preferredTagCollections.getter((SEL *)&selRef_preferredTagCollections);
}

uint64_t AVPlayerVideoOutputConfiguration.dataChannelDescription.getter()
{
  return AVVideoOutputSpecification.preferredTagCollections.getter((SEL *)&selRef_dataChannelDescriptions);
}

uint64_t AVVideoOutputSpecification.preferredTagCollections.getter(SEL *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE v11[32];
  _BYTE v12[32];
  uint64_t v13;

  v2 = objc_msgSend(v1, *a1);
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    v13 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4, 0);
    v5 = v3 + 32;
    do
    {
      outlined init with copy of Sendable(v5, (uint64_t)v12);
      outlined init with copy of Sendable((uint64_t)v12, (uint64_t)v11);
      type metadata accessor for CMTagCollectionRef(0);
      swift_dynamicCast();
      v6 = MEMORY[0x20BD057F0]();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
      v7 = v13;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v7 + 16) + 1, 1);
        v7 = v13;
      }
      v9 = *(_QWORD *)(v7 + 16);
      v8 = *(_QWORD *)(v7 + 24);
      if (v9 >= v8 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v8 > 1), v9 + 1, 1);
        v7 = v13;
      }
      *(_QWORD *)(v7 + 16) = v9 + 1;
      *(_QWORD *)(v7 + 8 * v9 + 32) = v6;
      v5 += 32;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  return v7;
}

uint64_t static Array<A>.createTagsForPreset(preset:)()
{
  int v0;
  Swift::String v1;
  uint64_t result;

  v0 = CMTagCollectionCreateWithVideoOutputPreset();
  if (v0 != noErr.getter())
  {
    _StringGuts.grow(_:)(40);
    swift_bridgeObjectRelease();
    v1._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v1);
    swift_bridgeObjectRelease();
  }
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t static Array<A>.monoscopicForVideoOutput()()
{
  return static Array<A>.createTagsForPreset(preset:)();
}

uint64_t static Array<A>.stereoscopicForVideoOutput()()
{
  return static Array<A>.createTagsForPreset(preset:)();
}

_QWORD *static AVPartialAsyncProperty<A>.formatDescriptions.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [CMFormatDescriptionRef], 0xD000000000000012, 0x8000000208392090);
}

_QWORD *static AVPartialAsyncProperty<A>.isDecodable.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE1328], 0x6C6261646F636564, 0xE900000000000065, a4);
}

_QWORD *static AVPartialAsyncProperty<A>.isEnabled.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE1328], 0x64656C62616E65, 0xE700000000000000, a4);
}

_QWORD *static AVPartialAsyncProperty<A>.isSelfContained.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE1328], 0x746E6F43666C6573, 0xED000064656E6961, a4);
}

_QWORD *static AVPartialAsyncProperty<A>.totalSampleDataLength.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE4008], 0xD000000000000015, 0x80000002083921F0, a4);
}

_QWORD *static AVPartialAsyncProperty<A>.mediaCharacteristics.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVMediaCharacteristic], 0xD000000000000014, 0x8000000208392210);
}

_QWORD *static AVPartialAsyncProperty<A>.timeRange.getter()
{
  return static AVPartialAsyncProperty<A>.duration.getter((uint64_t (*)(uint64_t))type metadata accessor for CMTimeRange, 0x676E6152656D6974, 0xE900000000000065);
}

_QWORD *static AVPartialAsyncProperty<A>.naturalTimeScale.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE3F88], 0xD000000000000010, 0x8000000208392230, a4);
}

_QWORD *static AVPartialAsyncProperty<A>.estimatedDataRate.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE14E8], 0xD000000000000011, 0x8000000208392250, a4);
}

_QWORD *static AVPartialAsyncProperty<A>.languageCode.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for String?, 0x65676175676E616CLL, 0xEC00000065646F43);
}

_QWORD *static AVPartialAsyncProperty<A>.extendedLanguageTag.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for String?, 0xD000000000000013, 0x8000000208392270);
}

_QWORD *static AVPartialAsyncProperty<A>.naturalSize.getter()
{
  return static AVPartialAsyncProperty<A>.duration.getter((uint64_t (*)(uint64_t))type metadata accessor for CGSize, 0x536C61727574616ELL, 0xEB00000000657A69);
}

_QWORD *static AVPartialAsyncProperty<A>.hasAudioSampleDependencies.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE1328], 0xD00000000000001ALL, 0x8000000208392290, a4);
}

_QWORD *static AVPartialAsyncProperty<A>.nominalFrameRate.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE14E8], 0xD000000000000010, 0x80000002083922B0, a4);
}

_QWORD *static AVPartialAsyncProperty<A>.minFrameDuration.getter()
{
  return static AVPartialAsyncProperty<A>.duration.getter((uint64_t (*)(uint64_t))type metadata accessor for CMTime, 0xD000000000000010, 0x80000002083922D0);
}

_QWORD *static AVPartialAsyncProperty<A>.requiresFrameReordering.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE1328], 0xD000000000000017, 0x80000002083922F0, a4);
}

_QWORD *static AVPartialAsyncProperty<A>.segments.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVAssetTrackSegment], 0x73746E656D676573, 0xE800000000000000);
}

_QWORD *static AVPartialAsyncProperty<A>.availableTrackAssociationTypes.getter()
{
  return static AVPartialAsyncProperty<A>.extraAttributes.getter(&demangling cache variable for type metadata for [AVTrackAssociationType], 0xD00000000000001ELL, 0x8000000208392310);
}

_QWORD *static AVPartialAsyncProperty<A>.canProvideSampleCursors.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static AVPartialAsyncProperty<A>.preferredRate.getter(MEMORY[0x24BEE1328], 0xD000000000000017, 0x8000000208392330, a4);
}

NSValue __swiftcall CMTime._bridgeToObjectiveC()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = v0;
  v5 = v1;
  v6 = v2;
  return (NSValue)objc_msgSend((id)objc_opt_self(), sel_valueWithCMTime_, &v4);
}

id static CMTime._forceBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  id result;
  __int128 v6;
  uint64_t v7;

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  type metadata accessor for CMTime(0);
  result = (id)strcmp(v4, "{?=qiIq}");
  if ((_DWORD)result)
  {
    __break(1u);
  }
  else
  {
    result = objc_msgSend(v3, sel_CMTimeValue);
    *(_OWORD *)a2 = v6;
    *(_QWORD *)(a2 + 16) = v7;
    *(_BYTE *)(a2 + 24) = 0;
  }
  return result;
}

BOOL static CMTime._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  int v5;
  uint64_t v6;
  __int128 v7;
  _BOOL8 result;
  __int128 v9;
  uint64_t v10;

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  type metadata accessor for CMTime(0);
  v5 = strcmp(v4, "{?=qiIq}");
  if (v5)
  {
    v6 = 0;
    v7 = 0uLL;
  }
  else
  {
    objc_msgSend(v3, sel_CMTimeValue);
    v7 = v9;
    v6 = v10;
  }
  result = v5 == 0;
  *(_OWORD *)a2 = v7;
  *(_QWORD *)(a2 + 16) = v6;
  *(_BYTE *)(a2 + 24) = v5 != 0;
  return result;
}

uint64_t static CMTime._unconditionallyBridgeFromObjectiveC(_:)(uint64_t result)
{
  id v1;
  const char *v2;
  uint64_t v3;

  if (result)
  {
    v1 = objc_retainAutorelease((id)result);
    v2 = (const char *)objc_msgSend(v1, sel_objCType);
    type metadata accessor for CMTime(0);
    result = strcmp(v2, "{?=qiIq}");
    if (!(_DWORD)result)
    {
      objc_msgSend(v1, sel_CMTimeValue);
      return v3;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance CMTime()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[3];

  v1 = *v0;
  v2 = v0[2];
  v3 = (void *)objc_opt_self();
  v5[0] = v1;
  v5[1] = v0[1];
  v5[2] = v2;
  return objc_msgSend(v3, sel_valueWithCMTime_, v5);
}

BOOL protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance CMTime(void *a1, uint64_t a2)
{
  id v3;
  int v4;
  uint64_t v5;
  __int128 v6;
  _BOOL8 result;
  __int128 v8;
  uint64_t v9;

  v3 = objc_retainAutorelease(a1);
  v4 = strcmp((const char *)objc_msgSend(v3, sel_objCType), "{?=qiIq}");
  if (v4)
  {
    v5 = 0;
    v6 = 0uLL;
  }
  else
  {
    objc_msgSend(v3, sel_CMTimeValue);
    v6 = v8;
    v5 = v9;
  }
  result = v4 == 0;
  *(_OWORD *)a2 = v6;
  *(_QWORD *)(a2 + 16) = v5;
  *(_BYTE *)(a2 + 24) = v4 != 0;
  return result;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance CMTime@<X0>(id result@<X0>, _QWORD *a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (result)
  {
    v3 = objc_retainAutorelease(result);
    result = (id)strcmp((const char *)objc_msgSend(v3, sel_objCType), "{?=qiIq}");
    if (!(_DWORD)result)
    {
      result = objc_msgSend(v3, sel_CMTimeValue);
      v4 = v8;
      v5 = v7;
      *a2 = v6;
      a2[1] = v5;
      a2[2] = v4;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

NSValue __swiftcall CMTimeRange._bridgeToObjectiveC()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[6];

  v1 = *v0;
  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[5];
  v5 = (void *)objc_opt_self();
  v7[0] = v1;
  v7[1] = v0[1];
  v7[2] = v2;
  v7[3] = v3;
  v7[4] = v0[4];
  v7[5] = v4;
  return (NSValue)objc_msgSend(v5, sel_valueWithCMTimeRange_, v7);
}

id static CMTimeRange._forceBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  id result;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  type metadata accessor for CMTimeRange(0);
  result = (id)strcmp(v4, "{?={?=qiIq}{?=qiIq}}");
  if ((_DWORD)result)
  {
    __break(1u);
  }
  else
  {
    result = objc_msgSend(v3, sel_CMTimeRangeValue);
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v7;
    *(_OWORD *)(a2 + 32) = v8;
    *(_BYTE *)(a2 + 48) = 0;
  }
  return result;
}

BOOL static CMTimeRange._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  int v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _BOOL8 result;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  type metadata accessor for CMTimeRange(0);
  v5 = strcmp(v4, "{?={?=qiIq}{?=qiIq}}");
  v6 = 0uLL;
  v7 = 0uLL;
  v8 = 0uLL;
  if (!v5)
  {
    objc_msgSend(v3, sel_CMTimeRangeValue, 0.0, 0.0, 0.0);
    v6 = v10;
    v7 = v11;
    v8 = v12;
  }
  result = v5 == 0;
  *(_OWORD *)a2 = v6;
  *(_OWORD *)(a2 + 16) = v7;
  *(_OWORD *)(a2 + 32) = v8;
  *(_BYTE *)(a2 + 48) = v5 != 0;
  return result;
}

id static CMTimeRange._unconditionallyBridgeFromObjectiveC(_:)@<X0>(id result@<X0>, uint64_t a2@<X8>)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  if (result)
  {
    v3 = objc_retainAutorelease(result);
    v4 = (const char *)objc_msgSend(v3, sel_objCType);
    type metadata accessor for CMTimeRange(0);
    result = (id)strcmp(v4, "{?={?=qiIq}{?=qiIq}}");
    if (!(_DWORD)result)
    {
      result = objc_msgSend(v3, sel_CMTimeRangeValue);
      v5 = v13;
      v6 = v10;
      v7 = v12;
      v8 = v11;
      *(_QWORD *)a2 = v9;
      *(_QWORD *)(a2 + 8) = v6;
      *(_OWORD *)(a2 + 16) = v8;
      *(_QWORD *)(a2 + 32) = v7;
      *(_QWORD *)(a2 + 40) = v5;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance CMTimeRange()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[6];

  v1 = *v0;
  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[5];
  v5 = (void *)objc_opt_self();
  v7[0] = v1;
  v7[1] = v0[1];
  v7[2] = v2;
  v7[3] = v3;
  v7[4] = v0[4];
  v7[5] = v4;
  return objc_msgSend(v5, sel_valueWithCMTimeRange_, v7);
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance CMTimeRange(void *a1, uint64_t a2)
{
  id v3;
  id result;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = objc_retainAutorelease(a1);
  result = (id)strcmp((const char *)objc_msgSend(v3, sel_objCType), "{?={?=qiIq}{?=qiIq}}");
  if ((_DWORD)result)
  {
    __break(1u);
  }
  else
  {
    result = objc_msgSend(v3, sel_CMTimeRangeValue);
    *(_OWORD *)a2 = v5;
    *(_OWORD *)(a2 + 16) = v6;
    *(_OWORD *)(a2 + 32) = v7;
    *(_BYTE *)(a2 + 48) = 0;
  }
  return result;
}

BOOL protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance CMTimeRange(void *a1, uint64_t a2)
{
  id v3;
  int v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _BOOL8 result;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v3 = objc_retainAutorelease(a1);
  v4 = strcmp((const char *)objc_msgSend(v3, sel_objCType), "{?={?=qiIq}{?=qiIq}}");
  v5 = 0uLL;
  v6 = 0uLL;
  v7 = 0uLL;
  if (!v4)
  {
    objc_msgSend(v3, sel_CMTimeRangeValue, 0.0, 0.0, 0.0);
    v5 = v9;
    v6 = v10;
    v7 = v11;
  }
  result = v4 == 0;
  *(_OWORD *)a2 = v5;
  *(_OWORD *)(a2 + 16) = v6;
  *(_OWORD *)(a2 + 32) = v7;
  *(_BYTE *)(a2 + 48) = v4 != 0;
  return result;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance CMTimeRange@<X0>(id result@<X0>, uint64_t a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  if (result)
  {
    v3 = objc_retainAutorelease(result);
    result = (id)strcmp((const char *)objc_msgSend(v3, sel_objCType), "{?={?=qiIq}{?=qiIq}}");
    if (!(_DWORD)result)
    {
      result = objc_msgSend(v3, sel_CMTimeRangeValue);
      v4 = v12;
      v5 = v9;
      v6 = v11;
      v7 = v10;
      *(_QWORD *)a2 = v8;
      *(_QWORD *)(a2 + 8) = v5;
      *(_OWORD *)(a2 + 16) = v7;
      *(_QWORD *)(a2 + 32) = v6;
      *(_QWORD *)(a2 + 40) = v4;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

NSValue __swiftcall CMTimeMapping._bridgeToObjectiveC()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[12];

  v1 = *v0;
  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[5];
  v5 = v0[6];
  v6 = v0[8];
  v7 = v0[9];
  v8 = v0[11];
  v9 = (void *)objc_opt_self();
  v11[0] = v1;
  v11[1] = v0[1];
  v11[2] = v2;
  v11[3] = v3;
  v11[4] = v0[4];
  v11[5] = v4;
  v11[6] = v5;
  v11[7] = v0[7];
  v11[8] = v6;
  v11[9] = v7;
  v11[10] = v0[10];
  v11[11] = v8;
  return (NSValue)objc_msgSend(v9, sel_valueWithCMTimeMapping_, v11);
}

id static CMTimeMapping._forceBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  id result;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  type metadata accessor for CMTimeMapping(0);
  result = (id)strcmp(v4, "{?={?={?=qiIq}{?=qiIq}}{?={?=qiIq}{?=qiIq}}}");
  if ((_DWORD)result)
  {
    __break(1u);
  }
  else
  {
    result = objc_msgSend(v3, sel_CMTimeMappingValue);
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v7;
    *(_OWORD *)(a2 + 32) = v8;
    *(_OWORD *)(a2 + 48) = v9;
    *(_OWORD *)(a2 + 64) = v10;
    *(_OWORD *)(a2 + 80) = v11;
    *(_BYTE *)(a2 + 96) = 0;
  }
  return result;
}

BOOL static CMTimeMapping._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  int v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BOOL8 result;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  type metadata accessor for CMTimeMapping(0);
  v5 = strcmp(v4, "{?={?={?=qiIq}{?=qiIq}}{?={?=qiIq}{?=qiIq}}}");
  if (v5)
  {
    v6 = 0uLL;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    v7 = 0uLL;
    v8 = 0uLL;
    v9 = 0uLL;
  }
  else
  {
    objc_msgSend(v3, sel_CMTimeMappingValue);
    v6 = v13;
    v7 = v14;
    v8 = v15;
    v9 = v16;
    *(_OWORD *)a2 = v11;
    *(_OWORD *)(a2 + 16) = v12;
  }
  result = v5 == 0;
  *(_OWORD *)(a2 + 32) = v6;
  *(_OWORD *)(a2 + 48) = v7;
  *(_OWORD *)(a2 + 64) = v8;
  *(_OWORD *)(a2 + 80) = v9;
  *(_BYTE *)(a2 + 96) = v5 != 0;
  return result;
}

id static CMTimeMapping._unconditionallyBridgeFromObjectiveC(_:)@<X0>(id result@<X0>, uint64_t a2@<X8>)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;

  if (result)
  {
    v3 = objc_retainAutorelease(result);
    v4 = (const char *)objc_msgSend(v3, sel_objCType);
    type metadata accessor for CMTimeMapping(0);
    result = (id)strcmp(v4, "{?={?={?=qiIq}{?=qiIq}}{?={?=qiIq}{?=qiIq}}}");
    if (!(_DWORD)result)
    {
      result = objc_msgSend(v3, sel_CMTimeMappingValue);
      v5 = v21;
      v6 = v14;
      v7 = v16;
      v8 = v18;
      v9 = v20;
      v10 = v15;
      v11 = v17;
      v12 = v19;
      *(_QWORD *)a2 = v13;
      *(_QWORD *)(a2 + 8) = v6;
      *(_OWORD *)(a2 + 16) = v10;
      *(_QWORD *)(a2 + 32) = v7;
      *(_OWORD *)(a2 + 40) = v11;
      *(_QWORD *)(a2 + 56) = v8;
      *(_OWORD *)(a2 + 64) = v12;
      *(_QWORD *)(a2 + 80) = v9;
      *(_QWORD *)(a2 + 88) = v5;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance CMTimeMapping()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[12];

  v1 = *v0;
  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[5];
  v5 = v0[6];
  v6 = v0[8];
  v7 = v0[9];
  v8 = v0[11];
  v9 = (void *)objc_opt_self();
  v11[0] = v1;
  v11[1] = v0[1];
  v11[2] = v2;
  v11[3] = v3;
  v11[4] = v0[4];
  v11[5] = v4;
  v11[6] = v5;
  v11[7] = v0[7];
  v11[8] = v6;
  v11[9] = v7;
  v11[10] = v0[10];
  v11[11] = v8;
  return objc_msgSend(v9, sel_valueWithCMTimeMapping_, v11);
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance CMTimeMapping(void *a1, uint64_t a2)
{
  id v3;
  id result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v3 = objc_retainAutorelease(a1);
  result = (id)strcmp((const char *)objc_msgSend(v3, sel_objCType), "{?={?={?=qiIq}{?=qiIq}}{?={?=qiIq}{?=qiIq}}}");
  if ((_DWORD)result)
  {
    __break(1u);
  }
  else
  {
    result = objc_msgSend(v3, sel_CMTimeMappingValue);
    *(_OWORD *)a2 = v5;
    *(_OWORD *)(a2 + 16) = v6;
    *(_OWORD *)(a2 + 32) = v7;
    *(_OWORD *)(a2 + 48) = v8;
    *(_OWORD *)(a2 + 64) = v9;
    *(_OWORD *)(a2 + 80) = v10;
    *(_BYTE *)(a2 + 96) = 0;
  }
  return result;
}

BOOL protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance CMTimeMapping(void *a1, uint64_t a2)
{
  id v3;
  int v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _BOOL8 result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v3 = objc_retainAutorelease(a1);
  v4 = strcmp((const char *)objc_msgSend(v3, sel_objCType), "{?={?={?=qiIq}{?=qiIq}}{?={?=qiIq}{?=qiIq}}}");
  if (v4)
  {
    v5 = 0uLL;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    v6 = 0uLL;
    v7 = 0uLL;
    v8 = 0uLL;
  }
  else
  {
    objc_msgSend(v3, sel_CMTimeMappingValue);
    v5 = v12;
    v6 = v13;
    v7 = v14;
    v8 = v15;
    *(_OWORD *)a2 = v10;
    *(_OWORD *)(a2 + 16) = v11;
  }
  result = v4 == 0;
  *(_OWORD *)(a2 + 32) = v5;
  *(_OWORD *)(a2 + 48) = v6;
  *(_OWORD *)(a2 + 64) = v7;
  *(_OWORD *)(a2 + 80) = v8;
  *(_BYTE *)(a2 + 96) = v4 != 0;
  return result;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance CMTimeMapping@<X0>(id result@<X0>, uint64_t a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  if (result)
  {
    v3 = objc_retainAutorelease(result);
    result = (id)strcmp((const char *)objc_msgSend(v3, sel_objCType), "{?={?={?=qiIq}{?=qiIq}}{?={?=qiIq}{?=qiIq}}}");
    if (!(_DWORD)result)
    {
      result = objc_msgSend(v3, sel_CMTimeMappingValue);
      v4 = v20;
      v5 = v13;
      v6 = v15;
      v7 = v17;
      v8 = v19;
      v9 = v14;
      v10 = v16;
      v11 = v18;
      *(_QWORD *)a2 = v12;
      *(_QWORD *)(a2 + 8) = v5;
      *(_OWORD *)(a2 + 16) = v9;
      *(_QWORD *)(a2 + 32) = v6;
      *(_OWORD *)(a2 + 40) = v10;
      *(_QWORD *)(a2 + 56) = v7;
      *(_OWORD *)(a2 + 64) = v11;
      *(_QWORD *)(a2 + 80) = v8;
      *(_QWORD *)(a2 + 88) = v4;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

char *AVCaptureVideoDataOutput.availableVideoPixelFormatTypes.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  unsigned int v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v1 = objc_msgSend(v0, sel_availableVideoCVPixelFormatTypes);
  type metadata accessor for NSNumber();
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_13;
LABEL_3:
  v12 = MEMORY[0x24BEE4AF8];
  result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    v6 = v12;
    do
    {
      if ((v2 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x20BD059B8](v5, v2);
      else
        v7 = *(id *)(v2 + 8 * v5 + 32);
      v8 = v7;
      v9 = objc_msgSend(v7, sel_unsignedIntValue);

      v11 = *(_QWORD *)(v12 + 16);
      v10 = *(_QWORD *)(v12 + 24);
      if (v11 >= v10 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1);
      ++v5;
      *(_QWORD *)(v12 + 16) = v11 + 1;
      *(_DWORD *)(v12 + 4 * v11 + 32) = v9;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

char *AVCaptureDeviceFormat.supportedColorSpaces.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v1 = objc_msgSend(v0, sel_supportedColorSpaces);
  type metadata accessor for AVMediaSelection(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_13;
LABEL_3:
  v12 = MEMORY[0x24BEE4AF8];
  result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    v6 = v12;
    do
    {
      if ((v2 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x20BD059B8](v5, v2);
      else
        v7 = *(id *)(v2 + 8 * v5 + 32);
      v8 = v7;
      v9 = objc_msgSend(v7, sel_integerValue);

      v11 = *(_QWORD *)(v12 + 16);
      v10 = *(_QWORD *)(v12 + 24);
      if (v11 >= v10 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1);
      ++v5;
      *(_QWORD *)(v12 + 16) = v11 + 1;
      *(_QWORD *)(v12 + 8 * v11 + 32) = v9;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

char *AVCaptureDeviceFormat.supportedMaxPhotoDimensions.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v1 = objc_msgSend(v0, sel_supportedMaxPhotoDimensions);
  type metadata accessor for AVMediaSelection(0, (unint64_t *)&lazy cache variable for type metadata for NSValue);
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_13;
LABEL_3:
  v12 = MEMORY[0x24BEE4AF8];
  result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    v6 = v12;
    do
    {
      if ((v2 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x20BD059B8](v5, v2);
      else
        v7 = *(id *)(v2 + 8 * v5 + 32);
      v8 = v7;
      v9 = objc_msgSend(v7, sel_CMVideoDimensionsValue);

      v11 = *(_QWORD *)(v12 + 16);
      v10 = *(_QWORD *)(v12 + 24);
      if (v11 >= v10 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1);
      ++v5;
      *(_QWORD *)(v12 + 16) = v11 + 1;
      *(_QWORD *)(v12 + 8 * v11 + 32) = v9;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

char *AVCaptureDeviceFormat.secondaryNativeResolutionZoomFactors.getter()
{
  return AVCaptureDeviceFormat.secondaryNativeResolutionZoomFactors.getter((SEL *)&selRef_secondaryNativeResolutionZoomFactors);
}

char *AVCaptureDeviceFormat.supportedVideoZoomFactorsForDepthDataDelivery.getter()
{
  return AVCaptureDeviceFormat.secondaryNativeResolutionZoomFactors.getter((SEL *)&selRef_supportedVideoZoomFactorsForDepthDataDelivery);
}

char *AVCaptureDeviceFormat.secondaryNativeResolutionZoomFactors.getter(SEL *a1)
{
  void *v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  char *result;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  float v10;
  float v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v2 = objc_msgSend(v1, *a1);
  type metadata accessor for AVMediaSelection(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v4 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v4)
    goto LABEL_13;
LABEL_3:
  v14 = MEMORY[0x24BEE4AF8];
  result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    v6 = 0;
    v7 = v14;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x20BD059B8](v6, v3);
      else
        v8 = *(id *)(v3 + 8 * v6 + 32);
      v9 = v8;
      objc_msgSend(v8, sel_floatValue);
      v11 = v10;

      v13 = *(_QWORD *)(v14 + 16);
      v12 = *(_QWORD *)(v14 + 24);
      if (v13 >= v12 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v12 > 1), v13 + 1, 1);
      ++v6;
      *(_QWORD *)(v14 + 16) = v13 + 1;
      *(double *)(v14 + 8 * v13 + 32) = v11;
    }
    while (v4 != v6);
    swift_bridgeObjectRelease();
    return (char *)v7;
  }
  __break(1u);
  return result;
}

char *AVCaptureDeviceFormat.supportedVideoZoomRangesForDepthDataDelivery.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = objc_msgSend(v0, sel_supportedVideoZoomRangesForDepthDataDelivery);
  type metadata accessor for AVMediaSelection(0, &lazy cache variable for type metadata for AVZoomRange);
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62)
    goto LABEL_14;
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      v16 = MEMORY[0x24BEE4AF8];
      result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
      if (v3 < 0)
        break;
      v5 = 0;
      v6 = v16;
      while (1)
      {
        v7 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x20BD059B8](v5, v2) : *(id *)(v2 + 8 * v5 + 32);
        v8 = v7;
        objc_msgSend(v7, sel_minZoomFactor);
        v10 = v9;
        objc_msgSend(v8, sel_maxZoomFactor);
        v12 = v11;

        if (v10 > v12)
          break;
        v14 = *(_QWORD *)(v16 + 16);
        v13 = *(_QWORD *)(v16 + 24);
        if (v14 >= v13 >> 1)
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v13 > 1), v14 + 1, 1);
        ++v5;
        *(_QWORD *)(v16 + 16) = v14 + 1;
        v15 = v16 + 16 * v14;
        *(double *)(v15 + 32) = v10;
        *(double *)(v15 + 40) = v12;
        if (v3 == v5)
        {
          swift_bridgeObjectRelease();
          return (char *)v6;
        }
      }
      __break(1u);
LABEL_14:
      swift_bridgeObjectRetain();
      v3 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v3)
        goto LABEL_15;
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
  return result;
}

void AVCaptureDeviceFormat.systemRecommendedVideoZoomRange.getter()
{
  void *v0;
  id v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v1 = objc_msgSend(v0, sel_systemRecommendedVideoZoomRange);
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, sel_minZoomFactor);
    v4 = v3;
    objc_msgSend(v2, sel_maxZoomFactor);
    v6 = v5;

    if (v4 > v6)
      __break(1u);
  }
}

void AVCaptureDeviceFormat.systemRecommendedExposureBiasRange.getter()
{
  void *v0;
  id v1;
  void *v2;
  float v3;
  float v4;
  float v5;
  float v6;

  v1 = objc_msgSend(v0, sel_systemRecommendedExposureBiasRange);
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, sel_minExposureBias);
    v4 = v3;
    objc_msgSend(v2, sel_maxExposureBias);
    v6 = v5;

    if (v4 > v6)
      __break(1u);
  }
}

uint64_t dispatch thunk of NSKeyValueObservation.invalidate()()
{
  return MEMORY[0x24BDCD258]();
}

uint64_t _BridgedStoredNSError._getEmbeddedNSError()()
{
  return MEMORY[0x24BDCD280]();
}

uint64_t _BridgedStoredNSError.init(_bridgedNSError:)()
{
  return MEMORY[0x24BDCD288]();
}

uint64_t _BridgedStoredNSError.errorUserInfo.getter()
{
  return MEMORY[0x24BDCD290]();
}

uint64_t static _BridgedStoredNSError.== infix(_:_:)()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t _BridgedStoredNSError.hash(into:)()
{
  return MEMORY[0x24BDCD2A8]();
}

uint64_t _BridgedStoredNSError.userInfo.getter()
{
  return MEMORY[0x24BDCD2B0]();
}

uint64_t _BridgedStoredNSError.errorCode.getter()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t NSFastEnumerationIterator.next()()
{
  return MEMORY[0x24BDCD508]();
}

uint64_t type metadata accessor for NSFastEnumerationIterator()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t NSFastEnumerationIterator.init(_:)()
{
  return MEMORY[0x24BDCD538]();
}

uint64_t _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)()
{
  return MEMORY[0x24BDCD5A8]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x24BDCD8D0](retstr);
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCD9C0]();
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

uint64_t Date.timeIntervalSince(_:)()
{
  return MEMORY[0x24BDCE330]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x24BDCE5D8]();
}

uint64_t Date.init(timeIntervalSinceNow:)()
{
  return MEMORY[0x24BDCE610]();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t static Date.== infix(_:_:)()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t static Date.now.getter()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x24BDCE900]();
}

NSLocale __swiftcall Locale._bridgeToObjectiveC()()
{
  return (NSLocale)MEMORY[0x24BDCEC90]();
}

uint64_t noErr.getter()
{
  return MEMORY[0x24BEE5370]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t CancellationError.init()()
{
  return MEMORY[0x24BEE67F8]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

uint64_t static Dictionary._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCF818]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x24BEE0980]();
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

uint64_t String.Index.utf16Offset<A>(in:)()
{
  return MEMORY[0x24BEE0B38]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x24BEE0E70]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

uint64_t static Array._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCFBB0]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t Array<A>.init(taggedBufferGroup:)()
{
  return MEMORY[0x24BEE51D0]();
}

uint64_t Array<A>.taggedBufferGroup.getter()
{
  return MEMORY[0x24BEE51D8]();
}

uint64_t Array<A>.init(tagCollection:)()
{
  return MEMORY[0x24BEE51E0]();
}

uint64_t Array<A>.tagCollection.getter()
{
  return MEMORY[0x24BEE51E8]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t type metadata accessor for CancellationError()
{
  return MEMORY[0x24BEE6838]();
}

uint64_t TaskGroup.next(isolation:)()
{
  return MEMORY[0x24BEE6878]();
}

Swift::Void __swiftcall TaskGroup.cancelAll()()
{
  MEMORY[0x24BEE68B0]();
}

uint64_t _sScIsE4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKF()
{
  return MEMORY[0x24BEE6908]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t static AsyncStream.makeStream(of:bufferingPolicy:)()
{
  return MEMORY[0x24BEE69A8]();
}

uint64_t type metadata accessor for AsyncStream.Continuation.YieldResult()
{
  return MEMORY[0x24BEE69E8]();
}

uint64_t AsyncStream.Continuation.onTermination.setter()
{
  return MEMORY[0x24BEE69F8]();
}

uint64_t type metadata accessor for AsyncStream.Continuation.BufferingPolicy()
{
  return MEMORY[0x24BEE6A18]();
}

uint64_t AsyncStream.Continuation.yield(_:)()
{
  return MEMORY[0x24BEE6A30]();
}

Swift::Void __swiftcall AsyncStream.Continuation.finish()()
{
  MEMORY[0x24BEE6A38]();
}

uint64_t type metadata accessor for AsyncStream.Continuation()
{
  return MEMORY[0x24BEE6A40]();
}

uint64_t AsyncStream.makeAsyncIterator()()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t AsyncStream.Iterator.next(isolation:)()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t AsyncStream.Iterator.next()()
{
  return MEMORY[0x24BEE6A68]();
}

uint64_t type metadata accessor for AsyncStream.Iterator()
{
  return MEMORY[0x24BEE6A78]();
}

uint64_t type metadata accessor for AsyncStream()
{
  return MEMORY[0x24BEE6A98]();
}

uint64_t AsyncStream.init(_:bufferingPolicy:_:)()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t static Task<>.isCancelled.getter()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t static Task<>.sleep(nanoseconds:)()
{
  return MEMORY[0x24BEE6B28]();
}

uint64_t Range<>.init(_:in:)()
{
  return MEMORY[0x24BDCFD70]();
}

uint64_t NSProgress.estimatedTimeRemaining.setter()
{
  return MEMORY[0x24BDCFDB8]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x24BEE57A0]();
}

CGPoint_optional __swiftcall CGPoint.init(dictionaryRepresentation:)(CFDictionaryRef dictionaryRepresentation)
{
  char v1;
  double v2;
  double v3;
  CGPoint_optional result;

  v1 = MEMORY[0x24BDBD870](dictionaryRepresentation);
  result.value.y = v3;
  result.value.x = v2;
  result.is_nil = v1;
  return result;
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t NSObject.hashValue.getter()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
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

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t withTaskGroup<A, B>(of:returning:isolation:body:)()
{
  return MEMORY[0x24BEE6D68]();
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

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
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

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t withCheckedContinuation<A>(isolation:function:_:)()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x24BEE3930]();
}

{
  return MEMORY[0x24BEE3938]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t withTaskCancellationHandler<A>(operation:onCancel:)()
{
  return MEMORY[0x24BEE70A8]();
}

uint64_t Error<>._code.getter()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t Error<>._domain.getter()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x24BEE3F10]();
}

NSNumber __swiftcall Int32._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x24BDD0730]();
}

uint64_t print(_:separator:terminator:)()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AVLocalizedError()
{
  return MEMORY[0x24BDFDCD8]();
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x24BDBEF98]((__n128)point, *(__n128 *)&point.y);
}

uint64_t CMTagCollectionCreateWithVideoOutputPreset()
{
  return MEMORY[0x24BDFDCF8]();
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x24BDC04A8](retstr, dictionaryRepresentation);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
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

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x24BEE4C90]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x24BEE4E00]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
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

