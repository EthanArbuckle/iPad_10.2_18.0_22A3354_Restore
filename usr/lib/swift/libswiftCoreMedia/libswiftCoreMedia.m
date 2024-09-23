uint64_t CMClockRef.time.getter()
{
  return CMClockRef.time.getter(MEMORY[0x1E0C9ED48]);
}

CMClockRef static CMClockRef.hostTimeClock.getter()
{
  return CMClockGetHostTimeClock();
}

CMTime __swiftcall CMTime.init(seconds:preferredTimescale:)(Swift::Double seconds, Swift::Int32 preferredTimescale)
{
  CMTimeValue value;
  uint64_t v3;
  CMTimeEpoch epoch;
  CMTime v5;
  CMTime result;

  CMTimeMakeWithSeconds(&v5, seconds, preferredTimescale);
  value = v5.value;
  v3 = *(_QWORD *)&v5.timescale;
  epoch = v5.epoch;
  result.epoch = epoch;
  result.timescale = v3;
  result.flags = HIDWORD(v3);
  result.value = value;
  return result;
}

uint64_t CMClockRef.time.getter(void (*a1)(uint64_t *__return_ptr, uint64_t))
{
  uint64_t v1;
  uint64_t v3;

  a1(&v3, v1);
  return v3;
}

BOOL static CMTime.== infix(_:_:)(CMTimeValue a1, uint64_t a2, CMTimeEpoch a3, CMTimeValue a4, uint64_t a5, CMTimeEpoch a6)
{
  CMTime v7;
  CMTime time1;

  v7.epoch = a6;
  time1.value = a1;
  *(_QWORD *)&time1.timescale = a2;
  time1.epoch = a3;
  v7.value = a4;
  *(_QWORD *)&v7.timescale = a5;
  return CMTimeCompare(&time1, &v7) == 0;
}

uint64_t one-time initialization function for tlsKey()
{
  uint64_t result;
  pthread_key_t v1[2];

  v1[1] = *MEMORY[0x1E0C80C00];
  v1[0] = 0;
  result = pthread_key_create(v1, 0);
  static BoxedError.tlsKey = v1[0];
  return result;
}

uint64_t BoxedError.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t _CMObjectiveCBridgeableWithRawValue<>.hash(into:)()
{
  uint64_t AssociatedTypeWitness;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v1 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)&v5 - v2;
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of Hashable.hash(into:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, AssociatedTypeWitness);
}

uint64_t _CMObjectiveCBridgeableWithRawValue<>._bridgeToObjectiveC()()
{
  uint64_t v1;

  dispatch thunk of RawRepresentable.rawValue.getter();
  return v1;
}

uint64_t static _CMObjectiveCBridgeableWithRawValue<>._forceBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  uint64_t v4;
  id v5;

  v4 = type metadata accessor for Optional();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a2, v4);
  v5 = a1;
  return dispatch thunk of RawRepresentable.init(rawValue:)();
}

uint64_t static _CMObjectiveCBridgeableWithRawValue<>._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  uint64_t v4;
  id v5;

  v4 = type metadata accessor for Optional();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a2, v4);
  v5 = a1;
  dispatch thunk of RawRepresentable.init(rawValue:)();
  return 1;
}

uint64_t static _CMObjectiveCBridgeableWithRawValue<>._unconditionallyBridgeFromObjectiveC(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;

  type metadata accessor for Optional();
  v8 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v16 - v11;
  if (a1)
  {
    v17 = (uint64_t)a1;
    v10 = *(char **)(a3 + 16);
    v13 = a1;
    dispatch thunk of RawRepresentable.init(rawValue:)();
    v14 = *(_QWORD *)(a2 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, a2) != 1)
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(a4, v12, a2);
    __break(1u);
  }
  v17 = MEMORY[0x1BCCB97B8](0, 0xE000000000000000);
  dispatch thunk of RawRepresentable.init(rawValue:)();
  v14 = *(_QWORD *)(a2 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v10, 1, a2);
  v12 = v10;
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(a4, v12, a2);
  __break(1u);
  return result;
}

uint64_t _CMObjectiveCBridgeableWithRawValue<>._bridgeToObjectiveC()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v7 = (char *)&v10 - v6;
  dispatch thunk of RawRepresentable.rawValue.getter();
  v8 = MEMORY[0x1BCCB9B24](AssociatedTypeWitness, a3);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, AssociatedTypeWitness);
  return v8;
}

uint64_t static _CMObjectiveCBridgeableWithRawValue<>._forceBridgeFromObjectiveC(_:result:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = a5;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = type metadata accessor for Optional();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v18 - v13;
  v15 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))((char *)&v18 - v13, 1, 1, AssociatedTypeWitness);
  MEMORY[0x1BCCB9B00](a1, v14, AssociatedTypeWitness, v19);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v12, 1, AssociatedTypeWitness);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v17 = type metadata accessor for Optional();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(a2, v17);
    dispatch thunk of RawRepresentable.init(rawValue:)();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  }
  return result;
}

uint64_t static _CMObjectiveCBridgeableWithRawValue<>._conditionallyBridgeFromObjectiveC(_:result:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = type metadata accessor for Optional();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v19 - v13;
  v15 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))((char *)&v19 - v13, 1, 1, AssociatedTypeWitness);
  v16 = MEMORY[0x1BCCB9B0C](a1, v14, AssociatedTypeWitness, a5);
  if ((v16 & 1) == 0)
    goto LABEL_4;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v12, 1, AssociatedTypeWitness);
  if ((_DWORD)result != 1)
  {
    v18 = type metadata accessor for Optional();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v20, v18);
    dispatch thunk of RawRepresentable.init(rawValue:)();
LABEL_4:
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    return v16 & 1;
  }
  __break(1u);
  return result;
}

uint64_t static _CMObjectiveCBridgeableWithRawValue<>._unconditionallyBridgeFromObjectiveC(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v5 = type metadata accessor for Optional();
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v10 - v6;
  dispatch thunk of static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:)();
  dispatch thunk of RawRepresentable.init(rawValue:)();
  v8 = *(_QWORD *)(a1 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v7, 1, a1);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(a2, v7, a1);
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BoxedError()
{
  return objc_opt_self();
}

void type metadata accessor for CFComparisonResult(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for CFComparisonResult);
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

void type metadata accessor for CMTime(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for CMTime);
}

void type metadata accessor for CMTagCategory(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for CMTagCategory);
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
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for CMTimeRange);
}

void type metadata accessor for CMSimpleQueueRef(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for CMSimpleQueueRef);
}

void type metadata accessor for CFStringRef(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, (unint64_t *)&lazy cache variable for type metadata for CFStringRef);
}

void type metadata accessor for CMBufferQueueRef(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for CMBufferQueueRef);
}

void type metadata accessor for CMStereoViewInterpretationOptions(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for CMStereoViewInterpretationOptions);
}

void type metadata accessor for CMStereoViewComponents(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for CMStereoViewComponents);
}

void type metadata accessor for CMProjectionType(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for CMProjectionType);
}

void type metadata accessor for CMPackingType(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for CMPackingType);
}

void type metadata accessor for CMFormatDescriptionRef(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for CMFormatDescriptionRef);
}

__n128 __swift_memcpy72_4(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CMSampleTimingInfo(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 72))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CMSampleTimingInfo(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
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
  *(_BYTE *)(result + 72) = v3;
  return result;
}

void type metadata accessor for CMSampleTimingInfo(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for CMSampleTimingInfo);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AudioStreamPacketDescription(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AudioStreamPacketDescription(uint64_t result, int a2, int a3)
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

void type metadata accessor for AudioStreamPacketDescription(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for AudioStreamPacketDescription);
}

void type metadata accessor for CMBlockBufferRef(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for CMBlockBufferRef);
}

void type metadata accessor for CMSampleBufferRef(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for CMSampleBufferRef);
}

void type metadata accessor for CMTagCollectionRef(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for CMTagCollectionRef);
}

void type metadata accessor for CVBufferRef(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for CVBufferRef);
}

void type metadata accessor for CMTimebaseRef(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for CMTimebaseRef);
}

void type metadata accessor for CMClockRef(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for CMClockRef);
}

uint64_t closure #1 in CMBufferQueueResetWithHandler(queue:execute:rescue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  uint64_t v9;
  int v10;
  id v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a1;
  v8[3] = a2;
  v8[4] = a3;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = partial apply for closure #1 in closure #1 in CMBufferQueueResetWithHandler(queue:execute:rescue:);
  *(_QWORD *)(v9 + 24) = v8;
  v13[0] = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
  v13[1] = v9;
  swift_retain();
  swift_retain();
  v10 = MEMORY[0x1BCCB9E6C](a4, @objc callClosureFromRefconCMBuffer(_:_:), v13);
  if (v10 != noErr.getter())
  {
    v11 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v11, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v10, 0);
    swift_willThrow();
  }
  return swift_release();
}

uint64_t closure #1 in closure #1 in CMBufferQueueResetWithHandler(queue:execute:rescue:)(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t @objc callClosureFromRefconCMBuffer(_:_:)(uint64_t result, void (**a2)(uint64_t *))
{
  void (*v2)(uint64_t *);
  uint64_t v3;

  if (a2)
  {
    v2 = *a2;
    v3 = result;
    swift_unknownObjectRetain();
    swift_retain();
    v2(&v3);
    swift_unknownObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance CFStringRef(uint64_t a1)
{
  MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CFStringRef, a1);
  return _CFObject.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance CFStringRef()
{
  MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CFStringRef);
  return _CFObject.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CFStringRef(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CFStringRef, a2);
  _CFObject.hash(into:)();
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CFStringRef(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CFStringRef, a3);
  return static _CFObject.== infix(_:_:)();
}

uint64_t base witness table accessor for Hashable in CFStringRef()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CMTagCategory()
{
  Swift::UInt32 *v0;
  Swift::UInt32 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CMTagCategory()
{
  Swift::UInt32 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CMTagCategory()
{
  Swift::UInt32 *v0;
  Swift::UInt32 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

_DWORD *protocol witness for OptionSet.init(rawValue:) in conformance CMTimeFlags@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void protocol witness for SetAlgebra.init() in conformance CMTimeFlags(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

_DWORD *protocol witness for SetAlgebra.union(_:) in conformance CMTimeFlags@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.intersection(_:) in conformance CMTimeFlags@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance CMTimeFlags@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance CMTimeFlags(_DWORD *a1, int *a2)
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

_DWORD *protocol witness for SetAlgebra.remove(_:) in conformance CMTimeFlags@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
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

int *protocol witness for SetAlgebra.update(with:) in conformance CMTimeFlags@<X0>(int *result@<X0>, uint64_t a2@<X8>)
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

_DWORD *protocol witness for SetAlgebra.formUnion(_:) in conformance CMTimeFlags(_DWORD *result)
{
  _DWORD *v1;

  *v1 |= *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.formIntersection(_:) in conformance CMTimeFlags(_DWORD *result)
{
  _DWORD *v1;

  *v1 &= *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance CMTimeFlags(_DWORD *result)
{
  _DWORD *v1;

  *v1 ^= *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.subtracting(_:) in conformance CMTimeFlags@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance CMTimeFlags(_DWORD *a1)
{
  _DWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance CMTimeFlags(_DWORD *a1)
{
  _DWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance CMTimeFlags(_DWORD *a1)
{
  _DWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance CMTimeFlags()
{
  _DWORD *v0;

  return *v0 == 0;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance CMTimeFlags()
{
  return SetAlgebra.init<A>(_:)();
}

_DWORD *protocol witness for SetAlgebra.subtract(_:) in conformance CMTimeFlags(_DWORD *result)
{
  _DWORD *v1;

  *v1 &= ~*result;
  return result;
}

_DWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance CMTimeFlags@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CMTimeFlags(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t base witness table accessor for Equatable in CMTagCategory()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CMTagCategory and conformance CMTagCategory, (uint64_t (*)(uint64_t))type metadata accessor for CMTagCategory, (uint64_t)&protocol conformance descriptor for CMTagCategory);
}

uint64_t lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1BCCBA8B0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t base witness table accessor for Equatable in CFStringRef()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t (*)(uint64_t))type metadata accessor for CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
}

uint64_t sub_1B8D09A68()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in CMBufferQueueResetWithHandler(queue:execute:rescue:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in closure #1 in CMBufferQueueResetWithHandler(queue:execute:rescue:)(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_1B8D09AA0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ()(_QWORD *a1)
{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ()(a1, *(uint64_t (**)(_QWORD))(v1 + 16));
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CMTimeFlags(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void type metadata accessor for CMTag(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for CMTag);
}

__n128 __swift_memcpy68_4(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CMBufferCallbacks(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 68))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 28);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CMBufferCallbacks(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 64) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 68) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 28) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 68) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for CMBufferCallbacks(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for CMBufferCallbacks);
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

void type metadata accessor for AudioFormatListItem(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for AudioFormatListItem);
}

void type metadata accessor for CMTimeFlags(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for CMTimeFlags);
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance CMTimeFlags@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  int v3;
  uint64_t result;

  v3 = specialized SetAlgebra<>.init(arrayLiteral:)(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t base witness table accessor for Equatable in CMTimeFlags()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CMTimeFlags and conformance CMTimeFlags, (uint64_t (*)(uint64_t))type metadata accessor for CMTimeFlags, (uint64_t)&protocol conformance descriptor for CMTimeFlags);
}

uint64_t base witness table accessor for ExpressibleByArrayLiteral in CMTimeFlags()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CMTimeFlags and conformance CMTimeFlags, (uint64_t (*)(uint64_t))type metadata accessor for CMTimeFlags, (uint64_t)&protocol conformance descriptor for CMTimeFlags);
}

uint64_t base witness table accessor for RawRepresentable in CMTimeFlags()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CMTimeFlags and conformance CMTimeFlags, (uint64_t (*)(uint64_t))type metadata accessor for CMTimeFlags, (uint64_t)&protocol conformance descriptor for CMTimeFlags);
}

uint64_t base witness table accessor for SetAlgebra in CMTimeFlags()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CMTimeFlags and conformance CMTimeFlags, (uint64_t (*)(uint64_t))type metadata accessor for CMTimeFlags, (uint64_t)&protocol conformance descriptor for CMTimeFlags);
}

void type metadata accessor for CMTagDataType(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for CMTagDataType);
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

uint64_t getEnumTagSinglePayload for AudioStreamBasicDescription(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AudioStreamBasicDescription(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
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
  *(_BYTE *)(result + 40) = v3;
  return result;
}

void type metadata accessor for AudioStreamBasicDescription(uint64_t a1)
{
  type metadata accessor for CFComparisonResult(a1, &lazy cache variable for type metadata for AudioStreamBasicDescription);
}

void type metadata accessor for CFComparisonResult(uint64_t a1, unint64_t *a2)
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

id one-time initialization function for missingRequiredParameter()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12745, 0);
  static CMClockRef.Error.missingRequiredParameter = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12748, 0);
  static CMTimebaseRef.Error.missingRequiredParameter = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12752, 0);
  static CMSync.Error.missingRequiredParameter = (uint64_t)result;
  return result;
}

id static CMClockRef.Error.missingRequiredParameter.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for missingRequiredParameter, (id *)&static CMClockRef.Error.missingRequiredParameter);
}

id one-time initialization function for invalidParameter()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12746, 0);
  static CMClockRef.Error.invalidParameter = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12749, 0);
  static CMTimebaseRef.Error.invalidParameter = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12753, 0);
  static CMSync.Error.invalidParameter = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12710, 0);
  static CMFormatDescriptionRef.Error.invalidParameter = (uint64_t)result;
  return result;
}

id static CMClockRef.Error.invalidParameter.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidParameter, (id *)&static CMClockRef.Error.invalidParameter);
}

id one-time initialization function for allocationFailed()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12747, 0);
  static CMClockRef.Error.allocationFailed = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12750, 0);
  static CMTimebaseRef.Error.allocationFailed = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12754, 0);
  static CMSync.Error.allocationFailed = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12770, 0);
  static CMSimpleQueueRef.Error.allocationFailed = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12730, 0);
  static CMSampleBufferRef.Error.allocationFailed = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12760, 0);
  static CMBufferQueueRef.Error.allocationFailed = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12711, 0);
  static CMFormatDescriptionRef.Error.allocationFailed = (uint64_t)result;
  return result;
}

id static CMClockRef.Error.allocationFailed.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for allocationFailed, (id *)&static CMClockRef.Error.allocationFailed);
}

id one-time initialization function for unsupportedOperation()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12756, 0);
  static CMClockRef.Error.unsupportedOperation = (uint64_t)result;
  return result;
}

id static CMClockRef.Error.unsupportedOperation.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for unsupportedOperation, (id *)&static CMClockRef.Error.unsupportedOperation);
}

id static CMTimebaseRef.Error.missingRequiredParameter.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for missingRequiredParameter, (id *)&static CMTimebaseRef.Error.missingRequiredParameter);
}

id static CMTimebaseRef.Error.invalidParameter.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidParameter, (id *)&static CMTimebaseRef.Error.invalidParameter);
}

id static CMTimebaseRef.Error.allocationFailed.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for allocationFailed, (id *)&static CMTimebaseRef.Error.allocationFailed);
}

id one-time initialization function for timerIntervalTooShort()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12751, 0);
  static CMTimebaseRef.Error.timerIntervalTooShort = (uint64_t)result;
  return result;
}

id static CMTimebaseRef.Error.timerIntervalTooShort.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for timerIntervalTooShort, (id *)&static CMTimebaseRef.Error.timerIntervalTooShort);
}

id one-time initialization function for readOnly()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12757, 0);
  static CMTimebaseRef.Error.readOnly = (uint64_t)result;
  return result;
}

id static CMTimebaseRef.Error.readOnly.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for readOnly, (id *)&static CMTimebaseRef.Error.readOnly);
}

id static CMSync.Error.missingRequiredParameter.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for missingRequiredParameter, (id *)&static CMSync.Error.missingRequiredParameter);
}

id static CMSync.Error.invalidParameter.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidParameter, (id *)&static CMSync.Error.invalidParameter);
}

id static CMSync.Error.allocationFailed.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for allocationFailed, (id *)&static CMSync.Error.allocationFailed);
}

id one-time initialization function for rateMustBeNonZero()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12755, 0);
  static CMSync.Error.rateMustBeNonZero = (uint64_t)result;
  return result;
}

id static CMSync.Error.rateMustBeNonZero.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for rateMustBeNonZero, (id *)&static CMSync.Error.rateMustBeNonZero);
}

id static CMClockRef.Error.missingRequiredParameter.getter(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

uint64_t static CMClockRef.convertHostTimeToSystemUnits(_:)(CMTimeValue a1, uint64_t a2, CMTimeEpoch a3)
{
  CMTime hostTime;

  hostTime.value = a1;
  *(_QWORD *)&hostTime.timescale = a2;
  hostTime.epoch = a3;
  return CMClockConvertHostTimeToSystemUnits(&hostTime);
}

CMTimeValue static CMClockRef.convertSystemUnitsToHostTime(_:)(uint64_t a1)
{
  CMTime v2;

  CMClockMakeHostTimeFromSystemUnits(&v2, a1);
  return v2.value;
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMClockRef.anchorTime()(Swift::tuple_anchorTime_CMTime_referenceTime_CMTime *__return_ptr retstr)
{
  OpaqueCMClock *v1;
  OpaqueCMClock *v2;
  OSStatus AnchorTime;
  CMTimeEpoch epoch;
  CMTimeEpoch v6;
  CMTimeValue value;
  uint64_t v8;
  uint64_t v9;
  id v10;
  CMTime referenceClockTimeOut;
  CMTime clockTimeOut;
  uint64_t v13;

  v2 = v1;
  v13 = *MEMORY[0x1E0C80C00];
  memset(&clockTimeOut, 0, sizeof(clockTimeOut));
  memset(&referenceClockTimeOut, 0, sizeof(referenceClockTimeOut));
  AnchorTime = CMClockGetAnchorTime(v2, &clockTimeOut, &referenceClockTimeOut);
  if (AnchorTime == noErr.getter())
  {
    epoch = referenceClockTimeOut.epoch;
    v6 = clockTimeOut.epoch;
    value = referenceClockTimeOut.value;
    v8 = *(_QWORD *)&referenceClockTimeOut.timescale;
    v9 = *(_QWORD *)&clockTimeOut.timescale;
    retstr->anchorTime.value = clockTimeOut.value;
    *(_QWORD *)&retstr->anchorTime.timescale = v9;
    retstr->anchorTime.epoch = v6;
    retstr->referenceTime.value = value;
    *(_QWORD *)&retstr->referenceTime.timescale = v8;
    retstr->referenceTime.epoch = epoch;
  }
  else
  {
    v10 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v10, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], AnchorTime, 0);
    swift_willThrow();
  }
}

Swift::Bool __swiftcall CMClockRef.mightDrift(relativeTo:)(CMClockRef relativeTo)
{
  OpaqueCMClock *v1;

  return CMClockMightDrift(v1, relativeTo) != 0;
}

Swift::Void __swiftcall CMClockRef.invalidate()()
{
  OpaqueCMClock *v0;

  CMClockInvalidate(v0);
}

void _CMTimebaseInitTrampoline.init(sourceClock:)(void *a1, uint64_t a2, uint64_t a3)
{
  _CMTimebaseInitTrampoline.init(sourceClock:)(a1, a2, a3, MEMORY[0x1E0C9F450]);
}

void _CMTimebaseInitTrampoline.init(masterClock:)(void *a1, uint64_t a2, uint64_t a3)
{
  _CMTimebaseInitTrampoline.init(sourceClock:)(a1, a2, a3, MEMORY[0x1E0C9F450]);
}

void _CMTimebaseInitTrampoline.init(sourceTimebase:)(void *a1, uint64_t a2, uint64_t a3)
{
  _CMTimebaseInitTrampoline.init(sourceClock:)(a1, a2, a3, MEMORY[0x1E0C9F458]);
}

void _CMTimebaseInitTrampoline.init(masterTimebase:)(void *a1, uint64_t a2, uint64_t a3)
{
  _CMTimebaseInitTrampoline.init(sourceClock:)(a1, a2, a3, MEMORY[0x1E0C9F458]);
}

void _CMTimebaseInitTrampoline.init(sourceClock:)(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, void *, _QWORD *))
{
  int v6;
  void *v7;
  void (*v8)(void);
  id v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v11[0] = 0;
  v6 = a4(*MEMORY[0x1E0C9AE00], a1, v11);
  v7 = (void *)v11[0];
  if (v6 != noErr.getter())
  {
    v10 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v10, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v6, 0);
    swift_willThrow();

    goto LABEL_5;
  }
  if (v7)
  {
    v8 = *(void (**)(void))(a3 + 8);
    v9 = v7;
    v8();

LABEL_5:
    return;
  }
  __break(1u);
}

void protocol witness for _CMTimebaseInitTrampoline.init(referencing:) in conformance CMTimebaseRef(void *a1@<X0>, _QWORD *a2@<X8>)
{
  CFTypeRef v4;

  v4 = CMTimebaseRetain(a1);

  *a2 = v4;
}

CMTimebaseRef CMTimebaseRef.masterTimebase.getter()
{
  OpaqueCMTimebase *v0;

  return CMTimebaseCopySourceTimebase(v0);
}

CMClockRef CMTimebaseRef.masterClock.getter()
{
  OpaqueCMTimebase *v0;

  return CMTimebaseCopySourceClock(v0);
}

uint64_t CMTimebaseRef.source.getter@<X0>(uint64_t *a1@<X8>)
{
  return CMTimebaseRef.source.getter(a1);
}

{
  OpaqueCMTimebase *v1;
  OpaqueCMTimebase *v2;
  CMClockOrTimebaseRef v4;
  CFTypeID v5;
  uint64_t v6;
  uint64_t v7;
  _UNKNOWN **v8;
  CFTypeID v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  Swift::String v13;
  Swift::String v14;

  v2 = v1;
  v4 = CMTimebaseCopySource(v2);
  v5 = CFGetTypeID(v4);
  if (v5 == CMTimebaseGetTypeID())
  {
    type metadata accessor for CMTimebaseRef(0);
    v7 = v6;
    v8 = &protocol witness table for CMTimebaseRef;
LABEL_5:
    swift_unknownObjectRetain();
    v11 = swift_dynamicCastUnknownClassUnconditional();
    a1[3] = v7;
    a1[4] = (uint64_t)v8;
    result = swift_unknownObjectRelease();
    *a1 = v11;
    return result;
  }
  v9 = CFGetTypeID(v4);
  if (v9 == CMClockGetTypeID())
  {
    type metadata accessor for CMClockRef(0);
    v7 = v10;
    v8 = &protocol witness table for CMClockRef;
    goto LABEL_5;
  }
  _StringGuts.grow(_:)(59);
  v13._object = (void *)0x80000001B8D32F50;
  v13._countAndFlagsBits = 0xD000000000000016;
  String.append(_:)(v13);
  _print_unlocked<A, B>(_:_:)();
  v14._countAndFlagsBits = 0xD000000000000023;
  v14._object = (void *)0x80000001B8D32F70;
  String.append(_:)(v14);
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t CMTimebaseRef.source.setter(_QWORD *a1)
{
  return CMTimebaseRef.source.setter(a1);
}

{
  OpaqueCMTimebase *v1;
  OpaqueCMTimebase *v2;
  const void *v4;
  CFTypeID v5;
  OpaqueCMTimebase *v6;
  CFTypeID v7;
  uint64_t result;
  Swift::String v9;
  Swift::String v10;
  OpaqueCMTimebase *newSourceTimebase;
  _BYTE v12[40];

  v2 = v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v4 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  v5 = CFGetTypeID(v4);
  if (v5 == CMTimebaseGetTypeID())
  {
    outlined init with copy of CMSyncProtocol((uint64_t)a1, (uint64_t)v12);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMSyncProtocol);
    type metadata accessor for CMTimebaseRef(0);
    swift_dynamicCast();
    v6 = newSourceTimebase;
    CMTimebaseSetSourceTimebase(v2, newSourceTimebase);
LABEL_5:

    swift_unknownObjectRelease();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  v7 = CFGetTypeID(v4);
  if (v7 == CMClockGetTypeID())
  {
    outlined init with copy of CMSyncProtocol((uint64_t)a1, (uint64_t)v12);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMSyncProtocol);
    type metadata accessor for CMClockRef(0);
    swift_dynamicCast();
    v6 = newSourceTimebase;
    CMTimebaseSetSourceClock(v2, newSourceTimebase);
    goto LABEL_5;
  }
  outlined init with copy of CMSyncProtocol((uint64_t)a1, (uint64_t)v12);
  _StringGuts.grow(_:)(59);
  v9._object = (void *)0x80000001B8D32F50;
  v9._countAndFlagsBits = 0xD000000000000016;
  String.append(_:)(v9);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMSyncProtocol);
  _print_unlocked<A, B>(_:_:)();
  v10._countAndFlagsBits = 0xD000000000000023;
  v10._object = (void *)0x80000001B8D32F70;
  String.append(_:)(v10);
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t outlined init with copy of CMSyncProtocol(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1BCCBA898]((char *)a1 + (int)result, -(result >> 32), 0, 0);
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

void (*CMTimebaseRef.source.modify(uint64_t **a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t *v3;

  v3 = (uint64_t *)malloc(0x58uLL);
  *a1 = v3;
  v3[10] = v1;
  CMTimebaseRef.source.getter(v3);
  return CMTimebaseRef.source.modify;
}

void CMTimebaseRef.source.modify(uint64_t *a1, char a2)
{
  CMTimebaseRef.source.modify(a1, a2, (void (*)(char *))CMTimebaseRef.source.setter);
}

uint64_t CMTimebaseRef.master.getter@<X0>(uint64_t *a1@<X8>)
{
  return CMTimebaseRef.source.getter(a1);
}

uint64_t CMTimebaseRef.master.setter(_QWORD *a1)
{
  return CMTimebaseRef.source.setter(a1);
}

void (*CMTimebaseRef.master.modify(uint64_t **a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t *v3;

  v3 = (uint64_t *)malloc(0x58uLL);
  *a1 = v3;
  v3[10] = v1;
  CMTimebaseRef.master.getter(v3);
  return CMTimebaseRef.master.modify;
}

void CMTimebaseRef.master.modify(uint64_t *a1, char a2)
{
  CMTimebaseRef.source.modify(a1, a2, (void (*)(char *))CMTimebaseRef.master.setter);
}

void CMTimebaseRef.source.modify(uint64_t *a1, char a2, void (*a3)(char *))
{
  char *v4;

  v4 = (char *)*a1;
  if ((a2 & 1) != 0)
  {
    outlined init with copy of CMSyncProtocol(*a1, (uint64_t)(v4 + 40));
    a3(v4 + 40);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    a3((char *)*a1);
  }
  free(v4);
}

CMClockRef CMTimebaseRef.ultimateMasterClock.getter()
{
  OpaqueCMTimebase *v0;

  return CMTimebaseCopyUltimateSourceClock(v0);
}

uint64_t CMTimebaseRef.time.getter()
{
  return CMClockRef.time.getter(MEMORY[0x1E0C9F470]);
}

CMTime __swiftcall CMTimebaseRef.time(withTimescale:rounding:)(Swift::Int32 withTimescale, CMTimeRoundingMethod rounding)
{
  OpaqueCMTimebase *v2;
  CMTimeValue value;
  uint64_t v4;
  CMTimeEpoch epoch;
  CMTime v6;
  CMTime result;

  CMTimebaseGetTimeWithTimeScale(&v6, v2, withTimescale, rounding);
  value = v6.value;
  v4 = *(_QWORD *)&v6.timescale;
  epoch = v6.epoch;
  result.epoch = epoch;
  result.timescale = v4;
  result.flags = HIDWORD(v4);
  result.value = value;
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMTimebaseRef.setTime(_:)(CMTime a1)
{
  OpaqueCMTimebase *v1;
  OSStatus v2;
  id v3;
  CMTime time;

  time = a1;
  v2 = CMTimebaseSetTime(v1, &time);
  if (v2 != noErr.getter())
  {
    v3 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v3, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v2, 0);
    swift_willThrow();
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMTimebaseRef.setAnchorTime(_:referenceTime:)(CMTime _, CMTime referenceTime)
{
  OpaqueCMTimebase *v2;
  OSStatus v3;
  id v4;
  CMTime v5;
  CMTime timebaseTime;

  v5 = referenceTime;
  timebaseTime = _;
  v3 = CMTimebaseSetAnchorTime(v2, &timebaseTime, &v5);
  if (v3 != noErr.getter())
  {
    v4 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v4, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v3, 0);
    swift_willThrow();
  }
}

double CMTimebaseRef.rate.getter()
{
  OpaqueCMTimebase *v0;

  return CMTimebaseGetRate(v0);
}

Float64 CMTimebaseRef.timeAndRate.getter()
{
  OpaqueCMTimebase *v0;
  Float64 rateOut;
  CMTime timeOut;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  memset(&timeOut, 0, sizeof(timeOut));
  rateOut = 0.0;
  CMTimebaseGetTimeAndRate(v0, &timeOut, &rateOut);
  return rateOut;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMTimebaseRef.setRate(_:)(Swift::Double a1)
{
  OpaqueCMTimebase *v1;
  OSStatus v2;
  id v3;

  v2 = CMTimebaseSetRate(v1, a1);
  if (v2 != noErr.getter())
  {
    v3 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v3, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v2, 0);
    swift_willThrow();
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMTimebaseRef.setRateAndAnchorTime(rate:anchorTime:referenceTime:)(Swift::Double rate, CMTime anchorTime, CMTime referenceTime)
{
  OpaqueCMTimebase *v3;
  OSStatus v4;
  id v5;
  CMTime v6;
  CMTime timebaseTime;

  v6 = referenceTime;
  timebaseTime = anchorTime;
  v4 = CMTimebaseSetRateAndAnchorTime(v3, rate, &timebaseTime, &v6);
  if (v4 != noErr.getter())
  {
    v5 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v5, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v4, 0);
    swift_willThrow();
  }
}

double CMTimebaseRef.effectiveRate.getter()
{
  OpaqueCMTimebase *v0;

  return CMTimebaseGetEffectiveRate(v0);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMTimebaseRef.addTimer(_:on:)(NSTimer _, NSRunLoop on)
{
  OpaqueCMTimebase *v2;
  __CFRunLoop *v4;
  OSStatus v5;
  id v6;

  v4 = (__CFRunLoop *)-[objc_class getCFRunLoop](on.super.isa, sel_getCFRunLoop);
  v5 = CMTimebaseAddTimer(v2, _.super.isa, v4);

  if (v5 != noErr.getter())
  {
    v6 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v6, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v5, 0);
    swift_willThrow();
  }
}

double static CMTimebaseRef.veryLongTimeInterval.getter()
{
  return 8073216000.0;
}

double static CMTimebaseRef.farFuture.getter()
{
  return 8073216000.0;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMTimebaseRef.removeTimer(_:)(NSTimer a1)
{
  CMTimebaseRef.removeTimer(_:)((uint64_t)a1.super.isa, MEMORY[0x1E0C9F4A8]);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMTimebaseRef.setTimerNextFireTime(_:fireTime:)(NSTimer _, CMTime fireTime)
{
  OpaqueCMTimebase *v2;
  OSStatus v3;
  id v4;
  CMTime fireTimea;

  fireTimea = fireTime;
  v3 = CMTimebaseSetTimerNextFireTime(v2, _.super.isa, &fireTimea, 0);
  if (v3 != noErr.getter())
  {
    v4 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v4, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v3, 0);
    swift_willThrow();
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMTimebaseRef.setTimerToFireImmediately(_:)(NSTimer a1)
{
  CMTimebaseRef.removeTimer(_:)((uint64_t)a1.super.isa, MEMORY[0x1E0C9F508]);
}

uint64_t CMTimebaseRef.removeTimer(_:)(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  int v3;
  uint64_t result;
  id v5;

  v3 = a2(v2, a1);
  result = noErr.getter();
  if (v3 != (_DWORD)result)
  {
    v5 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v5, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v3, 0);
    return swift_willThrow();
  }
  return result;
}

uint64_t CMTimebaseRef.addTimer<A>(_:)(uint64_t a1, uint64_t a2)
{
  return CMTimebaseRef.addTimer<A>(_:)(a1, a2, MEMORY[0x1E0C9F418]);
}

uint64_t CMTimebaseRef.removeTimer<A>(_:)(uint64_t a1, uint64_t a2)
{
  return CMTimebaseRef.addTimer<A>(_:)(a1, a2, MEMORY[0x1E0C9F4B0]);
}

uint64_t CMTimebaseRef.addTimer<A>(_:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v3;
  int v4;
  uint64_t result;
  id v6;

  v4 = closure #1 in CMTimebaseRef.addTimer<A>(_:)(v3, a1, a2, a3);
  result = noErr.getter();
  if (v4 != (_DWORD)result)
  {
    v6 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v6, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v4, 0);
    return swift_willThrow();
  }
  return result;
}

uint64_t CMTimebaseRef.setTimerNextFireTime<A>(_:fireTime:)(uint64_t a1, CMTimeValue a2, unint64_t a3, CMTimeEpoch a4)
{
  OpaqueCMTimebase *v4;
  int v5;
  uint64_t result;
  id v7;

  v5 = closure #1 in CMTimebaseRef.setTimerNextFireTime<A>(_:fireTime:)(v4, a1, a2, a3, a4);
  result = noErr.getter();
  if (v5 != (_DWORD)result)
  {
    v7 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v7, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v5, 0);
    return swift_willThrow();
  }
  return result;
}

uint64_t closure #1 in CMTimebaseRef.setTimerNextFireTime<A>(_:fireTime:)(OpaqueCMTimebase *a1, uint64_t a2, CMTimeValue a3, unint64_t a4, CMTimeEpoch a5)
{
  CMTimeScale v6;
  unint64_t v9;
  NSObject *v10;
  CMTime fireTime;

  v6 = a4;
  v9 = HIDWORD(a4);
  objc_opt_self();
  v10 = swift_dynamicCastObjCClassUnconditional();
  fireTime.value = a3;
  fireTime.timescale = v6;
  fireTime.flags = v9;
  fireTime.epoch = a5;
  return CMTimebaseSetTimerDispatchSourceNextFireTime(a1, v10, &fireTime, 0);
}

uint64_t CMTimebaseRef.setTimerToFireImmediately<A>(_:)(uint64_t a1, uint64_t a2)
{
  return CMTimebaseRef.addTimer<A>(_:)(a1, a2, MEMORY[0x1E0C9F4F8]);
}

uint64_t closure #1 in CMTimebaseRef.addTimer<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v5;

  objc_opt_self();
  v5 = swift_dynamicCastObjCClassUnconditional();
  return a4(a1, v5);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMTimebaseRef.notificationBarrier()()
{
  OpaqueCMTimebase *v0;
  OSStatus v1;
  id v2;

  v1 = CMTimebaseNotificationBarrier(v0);
  if (v1 != noErr.getter())
  {
    v2 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v2, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v1, 0);
    swift_willThrow();
  }
}

id one-time initialization function for effectiveRateChanged()
{
  static CMTimebaseRef.effectiveRateChanged = *MEMORY[0x1E0CA2E78];
  return (id)static CMTimebaseRef.effectiveRateChanged;
}

id static CMTimebaseRef.effectiveRateChanged.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for effectiveRateChanged, (id *)&static CMTimebaseRef.effectiveRateChanged);
}

id one-time initialization function for timeJumped()
{
  static CMTimebaseRef.timeJumped = *MEMORY[0x1E0CA2E88];
  return (id)static CMTimebaseRef.timeJumped;
}

id static CMTimebaseRef.timeJumped.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for timeJumped, (id *)&static CMTimebaseRef.timeJumped);
}

id CMTimebaseRef.NotificationKey.rawValue.getter()
{
  id *v0;

  return *v0;
}

void CMTimebaseRef.NotificationKey.rawValue.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*CMTimebaseRef.NotificationKey.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

uint64_t CMTimebaseRef.NotificationKey.init(rawValue:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

id one-time initialization function for eventTime()
{
  static CMTimebaseRef.NotificationKey.eventTime = *MEMORY[0x1E0CA2E70];
  return (id)static CMTimebaseRef.NotificationKey.eventTime;
}

id static CMTimebaseRef.NotificationKey.eventTime.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v2;

  if (one-time initialization token for eventTime != -1)
    swift_once();
  v2 = (void *)static CMTimebaseRef.NotificationKey.eventTime;
  *a1 = static CMTimebaseRef.NotificationKey.eventTime;
  return v2;
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance CMTimebaseRef.NotificationKey@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

id protocol witness for RawRepresentable.rawValue.getter in conformance CMTimebaseRef.NotificationKey@<X0>(void **a1@<X8>)
{
  void **v1;
  void *v2;

  v2 = *v1;
  *a1 = *v1;
  return v2;
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance CMTimebaseRef.NotificationKey()
{
  id *v0;

  return *v0;
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance CMTimebaseRef.NotificationKey(void *a1, id *a2)
{

  *a2 = a1;
  return a1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance CMTimebaseRef.NotificationKey(void *a1, id *a2)
{
  id v4;

  *a2 = a1;
  v4 = a1;
  return 1;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance CMTimebaseRef.NotificationKey@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  void *v2;

  v2 = (void *)a1;
  if (!a1)
  {
    a1 = MEMORY[0x1BCCB97B8](0, 0xE000000000000000);
    v2 = 0;
  }
  *a2 = a1;
  return v2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CMTimebaseRef.NotificationKey()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  Hasher.init(_seed:)();
  type metadata accessor for CFStringRef(0);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef();
  v2 = v1;
  _CFObject.hash(into:)();

  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CMTimebaseRef.NotificationKey()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  type metadata accessor for CFStringRef(0);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef();
  v2 = v1;
  _CFObject.hash(into:)();

}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CMTimebaseRef.NotificationKey()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  Hasher.init(_seed:)();
  type metadata accessor for CFStringRef(0);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef();
  v2 = v1;
  _CFObject.hash(into:)();

  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CMTimebaseRef.NotificationKey(void **a1, void **a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  char v6;

  v2 = *a1;
  v3 = *a2;
  type metadata accessor for CFStringRef(0);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef();
  v4 = v2;
  v5 = v3;
  v6 = static _CFObject.== infix(_:_:)();

  return v6 & 1;
}

uint64_t CMTimebaseRef.rateAndAnchorTime<A>(relativeTo:)@<X0>(uint64_t a1@<X8>)
{
  return CMTimebaseRef.rateAndAnchorTime<A>(relativeTo:)(a1);
}

{
  const void *v1;
  const void *v2;
  const void *v4;
  OSStatus RelativeRateAndAnchorTime;
  uint64_t result;
  CMTimeValue value;
  CMTimeEpoch epoch;
  CMTimeEpoch v9;
  CMTimeValue v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  CMTime v14;
  CMTime outOfClockOrTimebaseAnchorTime;
  Float64 outRelativeRate[2];

  v2 = v1;
  outRelativeRate[1] = *(Float64 *)MEMORY[0x1E0C80C00];
  outRelativeRate[0] = 0.0;
  memset(&outOfClockOrTimebaseAnchorTime, 0, sizeof(outOfClockOrTimebaseAnchorTime));
  memset(&v14, 0, sizeof(v14));
  v4 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  RelativeRateAndAnchorTime = CMSyncGetRelativeRateAndAnchorTime(v2, v4, outRelativeRate, &outOfClockOrTimebaseAnchorTime, &v14);
  swift_unknownObjectRelease();
  result = noErr.getter();
  if (RelativeRateAndAnchorTime == (_DWORD)result)
  {
    epoch = v14.epoch;
    value = outOfClockOrTimebaseAnchorTime.value;
    v9 = outOfClockOrTimebaseAnchorTime.epoch;
    v10 = v14.value;
    v11 = *(_QWORD *)&v14.timescale;
    v12 = *(_QWORD *)&outOfClockOrTimebaseAnchorTime.timescale;
    *(Float64 *)a1 = outRelativeRate[0];
    *(_QWORD *)(a1 + 8) = value;
    *(_QWORD *)(a1 + 16) = v12;
    *(_QWORD *)(a1 + 24) = v9;
    *(_QWORD *)(a1 + 32) = v10;
    *(_QWORD *)(a1 + 40) = v11;
    *(_QWORD *)(a1 + 48) = epoch;
  }
  else
  {
    v13 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v13, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], RelativeRateAndAnchorTime, 0);
    return swift_willThrow();
  }
  return result;
}

double protocol witness for CMSyncProtocol.rateAndAnchorTime<A>(relativeTo:) in conformance CMTimebaseRef@<D0>(uint64_t a1@<X8>)
{
  return protocol witness for CMSyncProtocol.rateAndAnchorTime<A>(relativeTo:) in conformance CMTimebaseRef((void (*)(_QWORD *__return_ptr))CMTimebaseRef.rateAndAnchorTime<A>(relativeTo:), a1);
}

uint64_t protocol witness for CMSyncProtocol.time.getter in conformance CMTimebaseRef(uint64_t a1, uint64_t a2)
{
  return protocol witness for CMSyncProtocol.time.getter in conformance CMTimebaseRef(a1, a2, MEMORY[0x1E0C9F470]);
}

double CMTimebaseRef.rate<A>(relativeTo:)()
{
  const void *v0;
  const void *v1;
  double RelativeRate;

  v1 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  RelativeRate = CMSyncGetRelativeRate(v0, v1);
  swift_unknownObjectRelease();
  return RelativeRate;
}

uint64_t CMClockRef.rateAndAnchorTime<A>(relativeTo:)@<X0>(uint64_t a1@<X8>)
{
  return CMTimebaseRef.rateAndAnchorTime<A>(relativeTo:)(a1);
}

CMTimeValue CMTimebaseRef.convertTime<A>(_:to:)(CMTimeValue a1, unint64_t a2, CMTimeEpoch a3)
{
  const void *v3;
  CMTimeScale v5;
  unint64_t v7;
  const void *v8;
  CMTimeValue value;
  CMTime v11;
  CMTime time;

  v5 = a2;
  v7 = HIDWORD(a2);
  v8 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  time.value = a1;
  time.timescale = v5;
  time.flags = v7;
  time.epoch = a3;
  CMSyncConvertTime(&v11, &time, v3, v8);
  value = v11.value;
  swift_unknownObjectRelease();
  return value;
}

BOOL CMTimebaseRef.mightDrift<A>(relativeTo:)()
{
  const void *v0;
  const void *v1;
  int v2;

  v1 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  v2 = CMSyncMightDrift(v0, v1);
  swift_unknownObjectRelease();
  return v2 != 0;
}

unint64_t instantiation function for generic protocol witness table for CMTimebaseRef.NotificationKey(_QWORD *a1)
{
  unint64_t result;

  a1[1] = lazy protocol witness table accessor for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey();
  a1[2] = lazy protocol witness table accessor for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey();
  result = lazy protocol witness table accessor for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey;
  if (!lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMTimebaseRef.NotificationKey, &type metadata for CMTimebaseRef.NotificationKey);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey;
  if (!lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMTimebaseRef.NotificationKey, &type metadata for CMTimebaseRef.NotificationKey);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey;
  if (!lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMTimebaseRef.NotificationKey, &type metadata for CMTimebaseRef.NotificationKey);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey;
  if (!lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMTimebaseRef.NotificationKey, &type metadata for CMTimebaseRef.NotificationKey);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey);
  }
  return result;
}

uint64_t protocol witness for CMSyncProtocol.rate<A>(relativeTo:) in conformance CMClockRef()
{
  return CMClockRef.rate<A>(relativeTo:)();
}

double protocol witness for CMSyncProtocol.rateAndAnchorTime<A>(relativeTo:) in conformance CMClockRef@<D0>(uint64_t a1@<X8>)
{
  return protocol witness for CMSyncProtocol.rateAndAnchorTime<A>(relativeTo:) in conformance CMTimebaseRef((void (*)(_QWORD *__return_ptr))CMClockRef.rateAndAnchorTime<A>(relativeTo:), a1);
}

double protocol witness for CMSyncProtocol.rateAndAnchorTime<A>(relativeTo:) in conformance CMTimebaseRef@<D0>(void (*a1)(_QWORD *__return_ptr)@<X5>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[3];
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  a1(v10);
  if (!v2)
  {
    result = *(double *)v10;
    v5 = v10[1];
    v6 = v10[2];
    v7 = v11;
    v8 = v12;
    v9 = v13;
    *(_QWORD *)a2 = v10[0];
    *(_QWORD *)(a2 + 8) = v5;
    *(_QWORD *)(a2 + 16) = v6;
    *(_OWORD *)(a2 + 24) = v7;
    *(_QWORD *)(a2 + 40) = v8;
    *(_QWORD *)(a2 + 48) = v9;
  }
  return result;
}

uint64_t protocol witness for CMSyncProtocol.convertTime<A>(_:to:) in conformance CMClockRef()
{
  return CMClockRef.convertTime<A>(_:to:)();
}

uint64_t protocol witness for CMSyncProtocol.mightDrift<A>(relativeTo:) in conformance CMClockRef()
{
  return CMClockRef.mightDrift<A>(relativeTo:)() & 1;
}

uint64_t protocol witness for CMSyncProtocol.time.getter in conformance CMClockRef(uint64_t a1, uint64_t a2)
{
  return protocol witness for CMSyncProtocol.time.getter in conformance CMTimebaseRef(a1, a2, MEMORY[0x1E0C9ED48]);
}

uint64_t protocol witness for CMSyncProtocol.time.getter in conformance CMTimebaseRef(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr, _QWORD))
{
  _QWORD *v3;
  uint64_t v5;

  a3(&v5, *v3);
  return v5;
}

uint64_t sub_1B8D0BD58@<X0>(uint64_t *a1@<X8>)
{
  return CMTimebaseRef.source.getter(a1);
}

uint64_t sub_1B8D0BD78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(_BYTE *))CMTimebaseRef.source.setter);
}

uint64_t sub_1B8D0BD84@<X0>(uint64_t *a1@<X8>)
{
  return CMTimebaseRef.master.getter(a1);
}

uint64_t sub_1B8D0BDA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(_BYTE *))CMTimebaseRef.master.setter);
}

uint64_t keypath_setTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_BYTE *))
{
  _BYTE v7[40];

  outlined init with copy of CMSyncProtocol(a1, (uint64_t)v7);
  return a5(v7);
}

ValueMetadata *type metadata accessor for CMClockRef.Error()
{
  return &type metadata for CMClockRef.Error;
}

ValueMetadata *type metadata accessor for CMTimebaseRef.Error()
{
  return &type metadata for CMTimebaseRef.Error;
}

ValueMetadata *type metadata accessor for CMSync()
{
  return &type metadata for CMSync;
}

ValueMetadata *type metadata accessor for CMSync.Error()
{
  return &type metadata for CMSync.Error;
}

uint64_t dispatch thunk of _CMTimebaseInitTrampoline.init(referencing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

ValueMetadata *type metadata accessor for CMTimebaseRef.NotificationKey()
{
  return &type metadata for CMTimebaseRef.NotificationKey;
}

uint64_t dispatch thunk of CMSyncProtocol.rate<A>(relativeTo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of CMSyncProtocol.rateAndAnchorTime<A>(relativeTo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of CMSyncProtocol.convertTime<A>(_:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 24))();
}

uint64_t dispatch thunk of CMSyncProtocol.mightDrift<A>(relativeTo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of CMSyncProtocol.time.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

unint64_t lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef;
  if (!lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef)
  {
    type metadata accessor for CFStringRef(255);
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CFStringRef, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  }
  return result;
}

uint64_t CMTaggedBuffer.tags.getter()
{
  return swift_bridgeObjectRetain();
}

id CMTaggedBuffer.buffer.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v2;
  char v3;

  v2 = *(void **)(v1 + 8);
  v3 = *(_BYTE *)(v1 + 16);
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3;
  return v2;
}

uint64_t CMTaggedBuffer.init(tags:buffer:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  char v4;

  v3 = *a2;
  v4 = *((_BYTE *)a2 + 8);
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = v3;
  *(_BYTE *)(a3 + 16) = v4;
  return result;
}

uint64_t CMTaggedBuffer.init(tags:sampleBuffer:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = a2;
  *(_BYTE *)(a3 + 16) = 0;
  return result;
}

uint64_t CMTaggedBuffer.init(tags:pixelBuffer:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = a2;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

uint64_t CMTaggedBuffer.description.getter()
{
  Swift::String v0;
  uint64_t v1;
  uint64_t v2;
  Swift::String v3;
  Swift::String v4;

  _StringGuts.grow(_:)(20);
  v0._countAndFlagsBits = 0x203A73676174;
  v0._object = (void *)0xE600000000000000;
  String.append(_:)(v0);
  v1 = type metadata accessor for CMTag();
  v2 = swift_bridgeObjectRetain();
  v3._countAndFlagsBits = MEMORY[0x1BCCB989C](v2, v1);
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 0x726566667562202CLL;
  v4._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v4);
  _print_unlocked<A, B>(_:_:)();
  return 0;
}

char *Array<A>.init(taggedBufferGroup:)(OpaqueCMTaggedBufferGroup *a1)
{
  char *v2;

  v2 = specialized Array<A>.init(taggedBufferGroup:)(a1);

  return v2;
}

uint64_t Array<A>.taggedBufferGroup.getter(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  char *v3;
  char v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  Class isa;
  Class v13;
  void *v14;
  id v16;
  uint64_t result;
  Swift::String v18;
  Swift::String v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v23[0] = 0;
  v20 = MEMORY[0x1E0DEE9D8];
  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = (id *)(swift_bridgeObjectRetain() + 48);
    v3 = (char *)MEMORY[0x1E0DEE9D8];
    do
    {
      v4 = *(_BYTE *)v2;
      v5 = *(v2 - 1);
      v6 = swift_bridgeObjectRetain();
      Array<A>.tagCollection.getter(v6);
      MEMORY[0x1BCCB986C]();
      if (*(_QWORD *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      if ((v4 & 1) != 0)
        type metadata accessor for CVBufferRef(0);
      else
        type metadata accessor for CMSampleBufferRef(0);
      v22 = v7;
      *(_QWORD *)&v21 = v5;
      v8 = v5;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v3 + 2) + 1, 1, v3);
      v10 = *((_QWORD *)v3 + 2);
      v9 = *((_QWORD *)v3 + 3);
      if (v10 >= v9 >> 1)
        v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v9 > 1), v10 + 1, 1, v3);
      *((_QWORD *)v3 + 2) = v10 + 1;
      outlined init with take of Any(&v21, &v3[32 * v10 + 32]);
      swift_bridgeObjectRelease();

      v2 += 3;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  v11 = *MEMORY[0x1E0C9AE00];
  type metadata accessor for CMTagCollectionRef(0);
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v13 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  LODWORD(v11) = MEMORY[0x1BCCBA2A4](v11, isa, v13, v23);

  v14 = (void *)v23[0];
  if ((_DWORD)v11 != noErr.getter() || v14 == 0)
  {
    *(_QWORD *)&v21 = 0;
    *((_QWORD *)&v21 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(53);
    v18._object = (void *)0x80000001B8D32FD0;
    v18._countAndFlagsBits = 0xD000000000000033;
    String.append(_:)(v18);
    v19._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v19);
    swift_bridgeObjectRelease();
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v16 = v14;
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    return (uint64_t)v16;
  }
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CMTag>);
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
    memcpy(v13, v14, 16 * v8);
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CMTaggedBuffer>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8])
      memmove(v12, v13, 24 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
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
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafeMutableRawPointer?>);
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
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Data>);
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

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3, char *a4)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafePointer<UInt8>>);
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
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
    v11 = (char *)MEMORY[0x1E0DEE9D8];
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
  swift_bridgeObjectRelease();
  return v11;
}

char *specialized Array<A>.init(taggedBufferGroup:)(OpaqueCMTaggedBufferGroup *a1)
{
  CMItemCount Count;
  CMItemCount v3;
  CFIndex v4;
  char *v5;
  char *v6;
  const OpaqueCMTagCollection *v7;
  const OpaqueCMTagCollection *v8;
  __CVBuffer *v9;
  const OpaqueCMTagCollection *v10;
  __CVBuffer *v11;
  uint64_t v12;
  __CVBuffer *v13;
  opaqueCMSampleBuffer *v14;
  opaqueCMSampleBuffer *v15;
  const OpaqueCMTagCollection *v16;
  opaqueCMSampleBuffer *v17;
  __CVBuffer *v18;
  unint64_t v19;
  unint64_t v20;

  Count = CMTaggedBufferGroupGetCount(a1);
  if (Count >= 1)
  {
    v3 = Count;
    v4 = 0;
    v5 = (char *)MEMORY[0x1E0DEE9D8];
    while (1)
    {
      v7 = CMTaggedBufferGroupGetTagCollectionAtIndex(a1, v4);
      if (!v7)
        goto LABEL_5;
      v8 = v7;
      v9 = CMTaggedBufferGroupGetCVPixelBufferAtIndex(a1, v4);
      if (v9)
        break;
      v14 = CMTaggedBufferGroupGetCMSampleBufferAtIndex(a1, v4);
      if (v14)
      {
        v15 = v14;
        v16 = v8;
        v17 = v15;
        v12 = specialized Array<A>.init(tagCollection:)(v16);
        v13 = v17;
        goto LABEL_11;
      }
LABEL_4:

LABEL_5:
      if (v3 == ++v4)
        return v5;
    }
    v10 = v8;
    v11 = v9;
    v12 = specialized Array<A>.init(tagCollection:)(v10);
    v13 = v11;
LABEL_11:
    v18 = v13;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v5 + 2) + 1, 1, v5);
    v20 = *((_QWORD *)v5 + 2);
    v19 = *((_QWORD *)v5 + 3);
    if (v20 >= v19 >> 1)
      v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v19 > 1), v20 + 1, 1, v5);
    *((_QWORD *)v5 + 2) = v20 + 1;
    v6 = &v5[24 * v20];
    *((_QWORD *)v6 + 4) = v12;
    *((_QWORD *)v6 + 5) = v18;
    v6[48] = v9 != 0;

    goto LABEL_4;
  }
  return (char *)MEMORY[0x1E0DEE9D8];
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void destroy for CMTaggedBuffer(uint64_t a1)
{
  swift_bridgeObjectRelease();

}

uint64_t initializeBufferWithCopyOfBuffer for CMTaggedBuffer(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  id v5;

  v3 = *(void **)(a2 + 8);
  v4 = *(_BYTE *)(a2 + 16);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4;
  swift_bridgeObjectRetain();
  v5 = v3;
  return a1;
}

uint64_t assignWithCopy for CMTaggedBuffer(uint64_t a1, uint64_t a2)
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  v6 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  v7 = v4;

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

uint64_t assignWithTake for CMTaggedBuffer(uint64_t a1, uint64_t a2)
{
  char v4;
  void *v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_BYTE *)(a2 + 16);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for CMTaggedBuffer(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CMTaggedBuffer(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CMTaggedBuffer()
{
  return &type metadata for CMTaggedBuffer;
}

uint64_t initializeBufferWithCopyOfBuffer for CMTaggedBuffer.Buffer(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v5 = v3;
  return a1;
}

void destroy for CMTaggedBuffer.Buffer(id *a1)
{

}

uint64_t assignWithCopy for CMTaggedBuffer.Buffer(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v6 = v3;

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

uint64_t assignWithTake for CMTaggedBuffer.Buffer(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for CMTaggedBuffer.Buffer(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CMTaggedBuffer.Buffer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t getEnumTag for CMTaggedBuffer.Buffer(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t destructiveInjectEnumTag for CMTaggedBuffer.Buffer(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CMTaggedBuffer.Buffer()
{
  return &type metadata for CMTaggedBuffer.Buffer;
}

_OWORD *CMAttachmentBearerAttachments.Value.value.getter@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  _OWORD v4[2];

  outlined init with copy of CMAttachmentBearerAttachments.Value(v1, (uint64_t)v4);
  return outlined init with take of Any(v4, a1);
}

uint64_t outlined init with copy of CMAttachmentBearerAttachments.Value(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;

  v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 >= 2)
    v3 = *(_DWORD *)a1 + 2;
  v4 = v3 == 1;
  v5 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v5;
  (**(void (***)(uint64_t))(v5 - 8))(a2);
  *(_BYTE *)(a2 + 32) = v4;
  return a2;
}

uint64_t CMAttachmentBearerAttachments.Value.mode.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  _BYTE v4[40];

  outlined init with copy of CMAttachmentBearerAttachments.Value(v1, (uint64_t)v4);
  *a1 = v4[32];
  return outlined destroy of CMAttachmentBearerAttachments.Value((uint64_t)v4);
}

uint64_t outlined destroy of CMAttachmentBearerAttachments.Value(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return a1;
}

CoreMedia::CMAttachmentBearerAttachments::Mode_optional __swiftcall CMAttachmentBearerAttachments.Mode.init(rawValue:)(Swift::UInt32 rawValue)
{
  char *v1;
  char v2;

  if (rawValue == 1)
    v2 = 1;
  else
    v2 = 2;
  if (!rawValue)
    v2 = 0;
  *v1 = v2;
  return (CoreMedia::CMAttachmentBearerAttachments::Mode_optional)rawValue;
}

uint64_t CMAttachmentBearerAttachments.Mode.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CMAttachmentBearerAttachments.Mode(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CMAttachmentBearerAttachments.Mode()
{
  unsigned __int8 *v0;
  Swift::UInt32 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CMAttachmentBearerAttachments.Mode()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CMAttachmentBearerAttachments.Mode()
{
  unsigned __int8 *v0;
  Swift::UInt32 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

_DWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance CMAttachmentBearerAttachments.Mode@<X0>(_DWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CMAttachmentBearerAttachments.Mode(_DWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

double CMAttachmentBearerAttachments.subscript.getter@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  const void *v7;
  __CFString *v8;
  CFTypeRef v9;
  char v10;
  double result;
  CMAttachmentMode attachmentModeOut;
  __int128 v13[2];
  char v14;
  __int128 v15;
  uint64_t ObjectType;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  attachmentModeOut = 0;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  v7 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  v8 = (__CFString *)MEMORY[0x1BCCB97B8](a1, a2);
  v9 = (id)CMGetAttachment(v7, v8, &attachmentModeOut);
  swift_unknownObjectRelease();

  if (v9)
  {
    if (!attachmentModeOut)
    {
      v10 = 0;
      ObjectType = swift_getObjectType();
      *(_QWORD *)&v15 = v9;
      goto LABEL_6;
    }
    if (attachmentModeOut == 1)
    {
      ObjectType = swift_getObjectType();
      *(_QWORD *)&v15 = v9;
      v10 = 1;
LABEL_6:
      outlined init with take of Any(&v15, v13);
      v14 = v10;
      outlined init with take of CMAttachmentBearerAttachments.Value(v13, a3);
      return result;
    }
    swift_unknownObjectRelease();
  }
  result = 0.0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_BYTE *)(a3 + 32) = -1;
  return result;
}

uint64_t outlined init with take of CMAttachmentBearerAttachments.Value(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_BYTE *)(a2 + 32) = *((_BYTE *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t key path setter for CMAttachmentBearerAttachments.subscript(_:) : CMAttachmentBearerAttachments(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[40];

  v3 = *a3;
  v4 = a3[1];
  outlined init with copy of CMAttachmentBearerAttachments.Value?(a1, (uint64_t)v6, &demangling cache variable for type metadata for CMAttachmentBearerAttachments.Value?);
  swift_bridgeObjectRetain();
  return CMAttachmentBearerAttachments.subscript.setter((uint64_t)v6, v3, v4);
}

uint64_t CMAttachmentBearerAttachments.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  const void *v13;
  __CFString *v14;
  const void *v15;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  const void *v22;
  __CFString *v23;
  uint64_t v24;
  _OWORD v25[2];
  unsigned __int8 v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  unsigned __int8 v31;
  _BYTE v32[40];

  v4 = v3;
  outlined init with copy of CMAttachmentBearerAttachments.Value?(a1, (uint64_t)&v29, &demangling cache variable for type metadata for CMAttachmentBearerAttachments.Value?);
  if (v31 == 255)
  {
    outlined destroy of CMAttachmentBearerAttachments.Value?((uint64_t)&v29);
    outlined init with copy of CMAttachmentBearerAttachments(v4, (uint64_t)&v29);
    v17 = v30;
    v18 = __swift_project_boxed_opaque_existential_1(&v29, v30);
    v19 = *(_QWORD *)(v17 - 8);
    MEMORY[0x1E0C80A78](v18);
    v21 = (char *)&v24 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v19 + 16))(v21);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v29);
    v22 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v17);
    v23 = (__CFString *)MEMORY[0x1BCCB97B8](a2, a3);
    swift_bridgeObjectRelease();
    CMRemoveAttachment(v22, v23);

    swift_unknownObjectRelease();
    return outlined destroy of CMAttachmentBearerAttachments.Value?(a1);
  }
  else
  {
    outlined init with take of CMAttachmentBearerAttachments.Value(&v29, (uint64_t)v32);
    outlined init with copy of CMAttachmentBearerAttachments(v4, (uint64_t)&v29);
    v8 = v30;
    v9 = __swift_project_boxed_opaque_existential_1(&v29, v30);
    v10 = *(_QWORD *)(v8 - 8);
    MEMORY[0x1E0C80A78](v9);
    v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v29);
    v13 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
    v14 = (__CFString *)MEMORY[0x1BCCB97B8](a2, a3);
    swift_bridgeObjectRelease();
    outlined init with copy of CMAttachmentBearerAttachments.Value((uint64_t)v32, (uint64_t)v25);
    outlined init with take of Any(v25, &v27);
    __swift_project_boxed_opaque_existential_1(&v27, v28);
    v15 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
    outlined init with copy of CMAttachmentBearerAttachments.Value((uint64_t)v32, (uint64_t)v25);
    LODWORD(v8) = v26;
    outlined destroy of CMAttachmentBearerAttachments.Value((uint64_t)v25);
    CMSetAttachment(v13, v14, v15, v8);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    outlined destroy of CMAttachmentBearerAttachments.Value?(a1);
    outlined destroy of CMAttachmentBearerAttachments.Value((uint64_t)v32);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v27);
  }
}

uint64_t outlined destroy of CMAttachmentBearerAttachments.Value?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMAttachmentBearerAttachments.Value?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with copy of CMAttachmentBearerAttachments(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void (*CMAttachmentBearerAttachments.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t *a1, char a2)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = malloc(0x68uLL);
  *a1 = v7;
  v7[11] = a3;
  v7[12] = v3;
  v7[10] = a2;
  CMAttachmentBearerAttachments.subscript.getter(a2, a3, (uint64_t)v7);
  return CMAttachmentBearerAttachments.subscript.modify;
}

void CMAttachmentBearerAttachments.subscript.modify(uint64_t *a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (_QWORD *)*a1;
  if ((a2 & 1) != 0)
  {
    v3 = v2[11];
    v4 = v2[10];
    outlined init with copy of CMAttachmentBearerAttachments.Value?(*a1, (uint64_t)(v2 + 5), &demangling cache variable for type metadata for CMAttachmentBearerAttachments.Value?);
    swift_bridgeObjectRetain();
    CMAttachmentBearerAttachments.subscript.setter((uint64_t)(v2 + 5), v4, v3);
    outlined destroy of CMAttachmentBearerAttachments.Value?((uint64_t)v2);
  }
  else
  {
    v5 = v2[11];
    v6 = v2[10];
    swift_bridgeObjectRetain();
    CMAttachmentBearerAttachments.subscript.setter((uint64_t)v2, v6, v5);
  }
  free(v2);
}

{
  _QWORD *v2;
  __CFString *v3;
  __CFString *v4;

  v2 = (_QWORD *)*a1;
  if ((a2 & 1) != 0)
  {
    v3 = (__CFString *)v2[11];
    outlined init with copy of CMAttachmentBearerAttachments.Value?(*a1, (uint64_t)(v2 + 5), &demangling cache variable for type metadata for CMAttachmentBearerAttachments.Value?);
    v4 = v3;
    CMAttachmentBearerAttachments.subscript.setter((uint64_t)(v2 + 5), &v4);
    outlined destroy of Any?((uint64_t)v2, &demangling cache variable for type metadata for CMAttachmentBearerAttachments.Value?);
  }
  else
  {
    v4 = (__CFString *)v2[11];
    CMAttachmentBearerAttachments.subscript.setter((uint64_t)v2, &v4);
  }
  free(v2);
}

Swift::Void __swiftcall CMAttachmentBearerAttachments.removeAll()()
{
  _QWORD *v0;
  const void *v1;

  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  v1 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  CMRemoveAllAttachments(v1);
  swift_unknownObjectRelease();
}

unint64_t CMAttachmentBearerAttachments.nonPropagated.getter()
{
  return CMAttachmentBearerAttachments.nonPropagated.getter(0);
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Any>);
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
    outlined init with copy of CMAttachmentBearerAttachments.Value?(v6, (uint64_t)&v15, &demangling cache variable for type metadata for (String, Any));
    v7 = v15;
    v8 = v16;
    result = specialized __RawDictionaryStorage.find<A>(_:)(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)outlined init with take of Any(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
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

{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, Any>);
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
    outlined init with copy of CMAttachmentBearerAttachments.Value?(v6, (uint64_t)&v13, &demangling cache variable for type metadata for (CFStringRef, Any));
    v7 = v13;
    result = specialized __RawDictionaryStorage.find<A>(_:)(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)outlined init with take of Any(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
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

{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, CGFloat>);
  v2 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = (id)*(v4 - 1);
    result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v6;
    *(_QWORD *)(v2[7] + v9) = v5;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
    v4 += 2;
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

unint64_t CMAttachmentBearerAttachments.propagated.getter()
{
  return CMAttachmentBearerAttachments.nonPropagated.getter(1u);
}

unint64_t CMAttachmentBearerAttachments.nonPropagated.getter(CMAttachmentMode a1)
{
  _QWORD *v1;
  _QWORD *v3;
  const __CFAllocator *v4;
  const void *v5;
  CFDictionaryRef v6;
  unint64_t result;

  v3 = v1;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  v5 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  v6 = CMCopyDictionaryOfAttachments(v4, v5, a1);
  swift_unknownObjectRelease();
  if (!v6)
    return specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E0DEE9D8]);
  v6;
  result = static Dictionary._forceBridgeFromObjectiveC(_:result:)();
  __break(1u);
  return result;
}

Swift::Void __swiftcall CMAttachmentBearerAttachments.merge(_:mode:)(Swift::OpaquePointer _, CoreMedia::CMAttachmentBearerAttachments::Mode mode)
{
  _QWORD *v2;
  CMAttachmentMode v3;
  const void *v4;
  const __CFDictionary *isa;

  v3 = *(unsigned __int8 *)mode;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  v4 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  CMSetAttachments(v4, isa, v3);
  swift_unknownObjectRelease();

}

id CMBlockBufferRef.attachments.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  id v4;

  type metadata accessor for CMBlockBufferRef(0);
  a1[3] = v2;
  a1[4] = &protocol witness table for CMBlockBufferRef;
  *a1 = v4;
  return v4;
}

uint64_t (*CMBlockBufferRef.attachments.modify(_QWORD *a1))()
{
  void *v1;
  _QWORD *v3;
  uint64_t v4;
  id v5;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  type metadata accessor for CMBlockBufferRef(0);
  v3[3] = v4;
  v3[4] = &protocol witness table for CMBlockBufferRef;
  *v3 = v1;
  v5 = v1;
  return CMSampleBufferRef.attachments.modify;
}

uint64_t CMBlockBufferRef.attachments.setter(uint64_t *a1)
{
  return CMBlockBufferRef.attachments.setter(a1, (uint64_t (*)(_QWORD))type metadata accessor for CMBlockBufferRef, (uint64_t)&protocol witness table for CMBlockBufferRef);
}

uint64_t *outlined assign with copy of CMAttachmentBearerAttachments(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a2, a1);
  return a2;
}

id protocol witness for CMAttachmentBearerProtocol.attachments.getter in conformance CMBlockBufferRef@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  return protocol witness for CMAttachmentBearerProtocol.attachments.getter in conformance CMBlockBufferRef(a1, (uint64_t (*)(_QWORD))type metadata accessor for CMBlockBufferRef, a2);
}

id CMSampleBufferRef.attachments.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  id v4;

  type metadata accessor for CMSampleBufferRef(0);
  a1[3] = v2;
  a1[4] = &protocol witness table for CMSampleBufferRef;
  *a1 = v4;
  return v4;
}

uint64_t (*CMSampleBufferRef.attachments.modify(_QWORD *a1))()
{
  void *v1;
  _QWORD *v3;
  uint64_t v4;
  id v5;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  type metadata accessor for CMSampleBufferRef(0);
  v3[3] = v4;
  v3[4] = &protocol witness table for CMSampleBufferRef;
  *v3 = v1;
  v5 = v1;
  return CMSampleBufferRef.attachments.modify;
}

uint64_t CMSampleBufferRef.attachments.setter(uint64_t *a1)
{
  return CMBlockBufferRef.attachments.setter(a1, (uint64_t (*)(_QWORD))type metadata accessor for CMSampleBufferRef, (uint64_t)&protocol witness table for CMSampleBufferRef);
}

id protocol witness for CMAttachmentBearerProtocol.attachments.getter in conformance CMSampleBufferRef@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  return protocol witness for CMAttachmentBearerProtocol.attachments.getter in conformance CMBlockBufferRef(a1, (uint64_t (*)(_QWORD))type metadata accessor for CMSampleBufferRef, a2);
}

id CVBufferRef.attachments.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  id v4;

  type metadata accessor for CVBufferRef(0);
  a1[3] = v2;
  a1[4] = &protocol witness table for CVBufferRef;
  *a1 = v4;
  return v4;
}

uint64_t key path setter for CMBlockBufferRef.attachments : CMBlockBufferRef(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD), uint64_t a6)
{
  void *v8;
  id v9;
  uint64_t v11[5];

  v8 = *a2;
  v11[3] = a5(0);
  v11[4] = a6;
  v11[0] = (uint64_t)v8;
  v9 = v8;
  outlined assign with copy of CMAttachmentBearerAttachments(a1, v11);
  return outlined destroy of CMAttachmentBearerAttachments.Value((uint64_t)v11);
}

void (*CVBufferRef.attachments.modify(_QWORD *a1))(uint64_t *a1)
{
  void *v1;
  _QWORD *v3;
  uint64_t v4;
  id v5;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  type metadata accessor for CVBufferRef(0);
  v3[3] = v4;
  v3[4] = &protocol witness table for CVBufferRef;
  *v3 = v1;
  v5 = v1;
  return CVBufferRef.attachments.modify;
}

void CVBufferRef.attachments.modify(uint64_t *a1)
{
  void *v1;

  v1 = (void *)*a1;
  outlined destroy of CMAttachmentBearerAttachments.Value(*a1);
  free(v1);
}

uint64_t CVBufferRef.attachments.setter(uint64_t *a1)
{
  return CMBlockBufferRef.attachments.setter(a1, (uint64_t (*)(_QWORD))type metadata accessor for CVBufferRef, (uint64_t)&protocol witness table for CVBufferRef);
}

uint64_t CMBlockBufferRef.attachments.setter(uint64_t *a1, uint64_t (*a2)(_QWORD), uint64_t a3)
{
  void *v3;
  id v6;
  uint64_t v8[5];

  v8[3] = a2(0);
  v8[4] = a3;
  v8[0] = (uint64_t)v3;
  v6 = v3;
  outlined assign with copy of CMAttachmentBearerAttachments(a1, v8);
  outlined destroy of CMAttachmentBearerAttachments.Value((uint64_t)v8);
  return outlined destroy of CMAttachmentBearerAttachments.Value((uint64_t)a1);
}

uint64_t CMBlockBufferRef.propagateAttachments<A>(to:)()
{
  const void *v0;
  const void *v1;

  v1 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  CMPropagateAttachments(v0, v1);
  return swift_unknownObjectRelease();
}

unint64_t lazy protocol witness table accessor for type CMAttachmentBearerAttachments.Mode and conformance CMAttachmentBearerAttachments.Mode()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMAttachmentBearerAttachments.Mode and conformance CMAttachmentBearerAttachments.Mode;
  if (!lazy protocol witness table cache variable for type CMAttachmentBearerAttachments.Mode and conformance CMAttachmentBearerAttachments.Mode)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMAttachmentBearerAttachments.Mode, &type metadata for CMAttachmentBearerAttachments.Mode);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMAttachmentBearerAttachments.Mode and conformance CMAttachmentBearerAttachments.Mode);
  }
  return result;
}

id protocol witness for CMAttachmentBearerProtocol.attachments.getter in conformance CVBufferRef@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  return protocol witness for CMAttachmentBearerProtocol.attachments.getter in conformance CMBlockBufferRef(a1, (uint64_t (*)(_QWORD))type metadata accessor for CVBufferRef, a2);
}

id protocol witness for CMAttachmentBearerProtocol.attachments.getter in conformance CMBlockBufferRef@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(_QWORD)@<X2>, _QWORD *a3@<X8>)
{
  id *v3;
  id v7;

  v7 = *v3;
  a3[3] = a2(0);
  a3[4] = a1;
  *a3 = v7;
  return v7;
}

uint64_t protocol witness for CMAttachmentBearerProtocol.propagateAttachments<A>(to:) in conformance CVBufferRef()
{
  return CVBufferRef.propagateAttachments<A>(to:)();
}

double sub_1B8D0DF78@<D0>(uint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  return CMAttachmentBearerAttachments.subscript.getter(*a1, a1[1], a2);
}

uint64_t sub_1B8D0DFA0()
{
  return 0;
}

id sub_1B8D0DFB0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_1Tm(a1, (uint64_t (*)(_QWORD))type metadata accessor for CMBlockBufferRef, (uint64_t)&protocol witness table for CMBlockBufferRef, a2);
}

uint64_t sub_1B8D0DFC4(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CMBlockBufferRef.attachments : CMBlockBufferRef(a1, a2, a3, a4, (uint64_t (*)(_QWORD))type metadata accessor for CMBlockBufferRef, (uint64_t)&protocol witness table for CMBlockBufferRef);
}

id sub_1B8D0DFE8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_1Tm(a1, (uint64_t (*)(_QWORD))type metadata accessor for CMSampleBufferRef, (uint64_t)&protocol witness table for CMSampleBufferRef, a2);
}

uint64_t sub_1B8D0DFFC(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CMBlockBufferRef.attachments : CMBlockBufferRef(a1, a2, a3, a4, (uint64_t (*)(_QWORD))type metadata accessor for CMSampleBufferRef, (uint64_t)&protocol witness table for CMSampleBufferRef);
}

id sub_1B8D0E020@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_1Tm(a1, (uint64_t (*)(_QWORD))type metadata accessor for CVBufferRef, (uint64_t)&protocol witness table for CVBufferRef, a2);
}

id keypath_get_1Tm@<X0>(id *a1@<X0>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t a3@<X4>, _QWORD *a4@<X8>)
{
  id v7;

  v7 = *a1;
  a4[3] = a2(0);
  a4[4] = a3;
  *a4 = v7;
  return v7;
}

uint64_t sub_1B8D0E078(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CMBlockBufferRef.attachments : CMBlockBufferRef(a1, a2, a3, a4, (uint64_t (*)(_QWORD))type metadata accessor for CVBufferRef, (uint64_t)&protocol witness table for CVBufferRef);
}

uint64_t dispatch thunk of CMAttachmentBearerProtocol.attachments.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of CMAttachmentBearerProtocol.propagateAttachments<A>(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t destroy for CMAttachmentBearerAttachments(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t initializeWithCopy for CMAttachmentBearerAttachments(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for CMAttachmentBearerAttachments(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
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

uint64_t assignWithTake for CMAttachmentBearerAttachments(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for CMAttachmentBearerAttachments(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CMAttachmentBearerAttachments(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CMAttachmentBearerAttachments()
{
  return &type metadata for CMAttachmentBearerAttachments;
}

uint64_t initializeWithCopy for CMAttachmentBearerAttachments.Value(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;

  v3 = *(unsigned __int8 *)(a2 + 32);
  if (v3 >= 2)
    v3 = *(_DWORD *)a2 + 2;
  v4 = v3 == 1;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v5;
  (**(void (***)(uint64_t))(v5 - 8))(a1);
  *(_BYTE *)(a1 + 32) = v4;
  return a1;
}

uint64_t assignWithCopy for CMAttachmentBearerAttachments.Value(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  BOOL v5;
  uint64_t v6;

  if (a1 != a2)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    v4 = *(unsigned __int8 *)(a2 + 32);
    if (v4 >= 2)
      v4 = *(_DWORD *)a2 + 2;
    v5 = v4 == 1;
    v6 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 24) = v6;
    (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
    *(_BYTE *)(a1 + 32) = v5;
  }
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for CMAttachmentBearerAttachments.Value(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  __int128 v5;

  if (a1 != a2)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    v4 = *(unsigned __int8 *)(a2 + 32);
    if (v4 >= 2)
      v4 = *(_DWORD *)a2 + 2;
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(_BYTE *)(a1 + 32) = v4 == 1;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for CMAttachmentBearerAttachments.Value(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 >= 2)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CMAttachmentBearerAttachments.Value(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 32) = 0;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t getEnumTag for CMAttachmentBearerAttachments.Value(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 32);
  if (result >= 2)
    return (*(_DWORD *)a1 + 2);
  return result;
}

uint64_t destructiveInjectEnumTag for CMAttachmentBearerAttachments.Value(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CMAttachmentBearerAttachments.Value()
{
  return &type metadata for CMAttachmentBearerAttachments.Value;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CMAttachmentBearerAttachments.Mode(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CMAttachmentBearerAttachments.Mode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B8D0E65C + 4 * byte_1B8D30385[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B8D0E690 + 4 * byte_1B8D30380[v4]))();
}

uint64_t sub_1B8D0E690(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B8D0E698(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B8D0E6A0);
  return result;
}

uint64_t sub_1B8D0E6AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B8D0E6B4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B8D0E6B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B8D0E6C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for CMAttachmentBearerAttachments.Mode(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for CMAttachmentBearerAttachments.Mode(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CMAttachmentBearerAttachments.Mode()
{
  return &type metadata for CMAttachmentBearerAttachments.Mode;
}

uint64_t outlined init with copy of CMAttachmentBearerAttachments.Value?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void _CMSimpleQueueInitTrampoline.init(capacity:)(uint64_t capacity, uint64_t a2, uint64_t a3)
{
  OSStatus v5;
  CMSimpleQueueRef v6;
  id v7;
  CMSimpleQueueRef v8[2];

  v8[1] = *(CMSimpleQueueRef *)MEMORY[0x1E0C80C00];
  if (capacity == (int)capacity)
  {
    v8[0] = 0;
    v5 = CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], capacity, v8);
    v6 = v8[0];
    if (v5 == noErr.getter())
    {
      if (v6)
        (*(void (**)(CMSimpleQueueRef, uint64_t, uint64_t))(a3 + 8))(v6, a2, a3);
      else
        __break(1u);
    }
    else
    {
      v7 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
      objc_msgSend(v7, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v5, 0);
      swift_willThrow();

    }
  }
  else
  {
    if (one-time initialization token for parameterOutOfRange != -1)
      swift_once();
    (id)static CMSimpleQueueRef.Error.parameterOutOfRange;
    swift_willThrow();
  }
}

id static CMSimpleQueueRef.Error.allocationFailed.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for allocationFailed, (id *)&static CMSimpleQueueRef.Error.allocationFailed);
}

id one-time initialization function for requiredParameterMissing()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12771, 0);
  static CMSimpleQueueRef.Error.requiredParameterMissing = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12731, 0);
  static CMSampleBufferRef.Error.requiredParameterMissing = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12761, 0);
  static CMBufferQueueRef.Error.requiredParameterMissing = (uint64_t)result;
  return result;
}

id static CMSimpleQueueRef.Error.requiredParameterMissing.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for requiredParameterMissing, (id *)&static CMSimpleQueueRef.Error.requiredParameterMissing);
}

id one-time initialization function for parameterOutOfRange()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12772, 0);
  static CMSimpleQueueRef.Error.parameterOutOfRange = (uint64_t)result;
  return result;
}

id static CMSimpleQueueRef.Error.parameterOutOfRange.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for parameterOutOfRange, (id *)&static CMSimpleQueueRef.Error.parameterOutOfRange);
}

id one-time initialization function for queueIsFull()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12773, 0);
  static CMSimpleQueueRef.Error.queueIsFull = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12764, 0);
  static CMBufferQueueRef.Error.queueIsFull = (uint64_t)result;
  return result;
}

id static CMSimpleQueueRef.Error.queueIsFull.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for queueIsFull, (id *)&static CMSimpleQueueRef.Error.queueIsFull);
}

uint64_t CMSimpleQueueRef.enqueue(_:)(void *element)
{
  opaqueCMSimpleQueue *v1;
  OSStatus v2;
  uint64_t result;
  id v4;

  v2 = CMSimpleQueueEnqueue(v1, element);
  result = noErr.getter();
  if (v2 != (_DWORD)result)
  {
    v4 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v4, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v2, 0);
    return swift_willThrow();
  }
  return result;
}

const void *CMSimpleQueueRef.dequeue()()
{
  opaqueCMSimpleQueue *v0;

  return CMSimpleQueueDequeue(v0);
}

const void *CMSimpleQueueRef.head.getter()
{
  opaqueCMSimpleQueue *v0;

  return CMSimpleQueueGetHead(v0);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMSimpleQueueRef.reset()()
{
  opaqueCMSimpleQueue *v0;
  OSStatus v1;
  id v2;

  v1 = CMSimpleQueueReset(v0);
  if (v1 != noErr.getter())
  {
    v2 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v2, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v1, 0);
    swift_willThrow();
  }
}

uint64_t CMSimpleQueueRef.capacity.getter()
{
  opaqueCMSimpleQueue *v0;

  return CMSimpleQueueGetCapacity(v0);
}

uint64_t CMSimpleQueueRef.count.getter()
{
  opaqueCMSimpleQueue *v0;

  return CMSimpleQueueGetCount(v0);
}

uint64_t CMSimpleQueueRef.fullness.getter()
{
  opaqueCMSimpleQueue *v0;
  uint64_t result;

  result = CMSimpleQueueGetCapacity(v0);
  if ((_DWORD)result)
  {
    CMSimpleQueueGetCount(v0);
    return CMSimpleQueueGetCapacity(v0);
  }
  return result;
}

uint64_t dispatch thunk of _CMSimpleQueueInitTrampoline.init(referencing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

ValueMetadata *type metadata accessor for CMSimpleQueueRef.Error()
{
  return &type metadata for CMSimpleQueueRef.Error;
}

void __swiftcall CMTimeRange.init(start:end:)(__C::CMTimeRange *__return_ptr retstr, CMTime start, CMTime end)
{
  CMTimeEpoch epoch;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  CMTimeRange v8;
  CMTime enda;
  CMTime starta;

  starta = start;
  enda = end;
  CMTimeRangeFromTimeToTime(&v8, &starta, &enda);
  epoch = v8.duration.epoch;
  v5 = *(_QWORD *)&v8.start.timescale;
  v6 = *(_QWORD *)&v8.duration.timescale;
  v7 = *(_OWORD *)&v8.start.epoch;
  retstr->start.value = v8.start.value;
  *(_QWORD *)&retstr->start.timescale = v5;
  *(_OWORD *)&retstr->start.epoch = v7;
  *(_QWORD *)&retstr->duration.timescale = v6;
  retstr->duration.epoch = epoch;
}

BOOL CMTimeRange.isValid.getter()
{
  uint64_t v0;
  BOOL v2;

  if ((*(_BYTE *)(v0 + 12) & 1) == 0)
    return 0;
  if ((*(_BYTE *)(v0 + 36) & 1) == 0)
    return 0;
  if (*(_QWORD *)(v0 + 40))
    v2 = 1;
  else
    v2 = *(uint64_t *)(v0 + 24) < 0;
  return !v2;
}

uint64_t CMTimeRange.isIndefinite.getter()
{
  uint64_t v0;
  int v1;
  unsigned int v3;
  int v4;
  unsigned int v5;

  v1 = *(_DWORD *)(v0 + 12);
  if ((v1 & 1) == 0)
    return 0;
  v3 = *(_DWORD *)(v0 + 36);
  if ((v3 & 1) == 0)
    return 0;
  v4 = (v3 >> 4) & 1;
  if ((v1 & 0x10) != 0)
    v5 = 1;
  else
    v5 = v4;
  if (*(uint64_t *)(v0 + 24) < 0)
    v5 = 0;
  if (*(_QWORD *)(v0 + 40))
    return 0;
  else
    return v5;
}

BOOL CMTimeRange.isEmpty.getter()
{
  uint64_t v0;
  _BOOL8 result;
  CMTimeFlags v2;
  CMTimeValue v3;
  CMTimeScale v4;
  CMTimeValue v5;
  CMTime v6;
  CMTime time1;

  if ((*(_BYTE *)(v0 + 12) & 1) == 0)
    return 0;
  result = 0;
  v2 = *(_DWORD *)(v0 + 36);
  if ((v2 & 1) != 0 && !*(_QWORD *)(v0 + 40))
  {
    v3 = *(_QWORD *)(v0 + 24);
    if ((v3 & 0x8000000000000000) == 0)
    {
      v4 = *(_DWORD *)(v0 + 32);
      v5 = *MEMORY[0x1E0CA2E68];
      v6.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      time1.value = v3;
      time1.timescale = v4;
      time1.flags = v2;
      time1.epoch = 0;
      v6.value = v5;
      *(_QWORD *)&v6.timescale = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 8);
      return CMTimeCompare(&time1, &v6) == 0;
    }
  }
  return result;
}

CMTimeValue CMTimeRange.end.getter()
{
  uint64_t v0;
  CMTimeEpoch v1;
  CMTime v3;
  CMTimeRange range;

  v1 = *(_QWORD *)(v0 + 40);
  range.start.value = *(_QWORD *)v0;
  *(_QWORD *)&range.start.timescale = *(_QWORD *)(v0 + 8);
  *(_OWORD *)&range.start.epoch = *(_OWORD *)(v0 + 16);
  *(_QWORD *)&range.duration.timescale = *(_QWORD *)(v0 + 32);
  range.duration.epoch = v1;
  CMTimeRangeGetEnd(&v3, &range);
  return v3.value;
}

void __swiftcall CMTimeRange.union(_:)(__C::CMTimeRange *__return_ptr retstr, __C::CMTimeRange *a2)
{
  CMTimeRange.union(_:)(&a2->start.value, MEMORY[0x1E0C9F3E0], (uint64_t)retstr);
}

void __swiftcall CMTimeRange.intersection(_:)(__C::CMTimeRange *__return_ptr retstr, __C::CMTimeRange *a2)
{
  CMTimeRange.union(_:)(&a2->start.value, MEMORY[0x1E0C9F3D8], (uint64_t)retstr);
}

double CMTimeRange.union(_:)@<D0>(uint64_t *a1@<X0>, void (*a2)(_QWORD *__return_ptr, _QWORD *, _QWORD *)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double result;
  uint64_t v10;
  __int128 v11;
  _QWORD v12[2];
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];
  __int128 v21;
  uint64_t v22;
  uint64_t v23;

  v5 = *a1;
  v6 = a1[5];
  v7 = *(_QWORD *)(v3 + 40);
  v20[0] = *(_QWORD *)v3;
  v20[1] = *(_QWORD *)(v3 + 8);
  v21 = *(_OWORD *)(v3 + 16);
  v22 = *(_QWORD *)(v3 + 32);
  v23 = v7;
  v16[0] = v5;
  v16[1] = a1[1];
  v17 = *((_OWORD *)a1 + 1);
  v18 = a1[4];
  v19 = v6;
  a2(v12, v20, v16);
  v8 = v15;
  result = *(double *)&v12[1];
  v10 = v14;
  v11 = v13;
  *(_QWORD *)a3 = v12[0];
  *(double *)(a3 + 8) = result;
  *(_OWORD *)(a3 + 16) = v11;
  *(_QWORD *)(a3 + 32) = v10;
  *(_QWORD *)(a3 + 40) = v8;
  return result;
}

Swift::Bool __swiftcall CMTimeRange.containsTime(_:)(CMTime a1)
{
  uint64_t v1;
  CMTimeValue v2;
  CMTimeEpoch v3;
  CMTime time;
  CMTimeRange range;

  v2 = *(_QWORD *)v1;
  v3 = *(_QWORD *)(v1 + 40);
  time.epoch = a1.epoch;
  range.start.value = v2;
  *(_QWORD *)&range.start.timescale = *(_QWORD *)(v1 + 8);
  *(_OWORD *)&range.start.epoch = *(_OWORD *)(v1 + 16);
  *(_QWORD *)&range.duration.timescale = *(_QWORD *)(v1 + 32);
  range.duration.epoch = v3;
  time.value = a1.value;
  time.timescale = a1.timescale;
  time.flags = a1.flags;
  return CMTimeRangeContainsTime(&range, &time) != 0;
}

Swift::Bool __swiftcall CMTimeRange.containsTimeRange(_:)(__C::CMTimeRange *a1)
{
  uint64_t v1;
  CMTimeValue value;
  CMTimeValue v3;
  CMTimeEpoch v4;
  CMTimeRange v6;
  CMTimeRange range;

  value = a1->start.value;
  v3 = *(_QWORD *)v1;
  v4 = *(_QWORD *)(v1 + 40);
  v6.duration.epoch = a1->duration.epoch;
  range.start.value = v3;
  *(_QWORD *)&range.start.timescale = *(_QWORD *)(v1 + 8);
  *(_OWORD *)&range.start.epoch = *(_OWORD *)(v1 + 16);
  *(_QWORD *)&range.duration.timescale = *(_QWORD *)(v1 + 32);
  range.duration.epoch = v4;
  v6.start.value = value;
  *(_QWORD *)&v6.start.timescale = *(_QWORD *)&a1->start.timescale;
  *(_OWORD *)&v6.start.epoch = *(_OWORD *)&a1->start.epoch;
  *(_QWORD *)&v6.duration.timescale = *(_QWORD *)&a1->duration.timescale;
  return CMTimeRangeContainsTimeRange(&range, &v6) != 0;
}

Swift::Bool __swiftcall CMTIMERANGE_IS_VALID(_:)(__C::CMTimeRange *a1)
{
  BOOL v2;

  if ((a1->start.flags & 1) == 0)
    return 0;
  if ((a1->duration.flags & 1) == 0)
    return 0;
  if (a1->duration.epoch)
    v2 = 1;
  else
    v2 = a1->duration.value < 0;
  return !v2;
}

Swift::Bool __swiftcall CMTIMERANGE_IS_INVALID(_:)(__C::CMTimeRange *a1)
{
  if ((a1->start.flags & 1) == 0)
    return 1;
  if ((a1->duration.flags & 1) == 0)
    return 1;
  return a1->duration.epoch || a1->duration.value < 0;
}

Swift::Bool __swiftcall CMTIMERANGE_IS_INDEFINITE(_:)(__C::CMTimeRange *a1)
{
  CMTimeFlags flags;
  CMTimeFlags v3;
  int v4;
  Swift::Bool v5;

  flags = a1->start.flags;
  if ((flags & 1) == 0)
    return 0;
  v3 = a1->duration.flags;
  if ((v3 & 1) == 0)
    return 0;
  v4 = (v3 >> 4) & 1;
  if ((flags & 0x10) != 0)
    v5 = 1;
  else
    v5 = v4;
  if (a1->duration.value < 0)
    v5 = 0;
  return !a1->duration.epoch && v5;
}

Swift::Bool __swiftcall CMTIMERANGE_IS_EMPTY(_:)(__C::CMTimeRange *a1)
{
  Swift::Bool result;
  CMTimeFlags flags;
  CMTimeValue value;
  CMTimeScale timescale;
  CMTimeValue v6;
  CMTime v7;
  CMTime time1;

  if ((a1->start.flags & 1) == 0)
    return 0;
  result = 0;
  flags = a1->duration.flags;
  if ((flags & 1) != 0 && !a1->duration.epoch)
  {
    value = a1->duration.value;
    if ((value & 0x8000000000000000) == 0)
    {
      timescale = a1->duration.timescale;
      v6 = *MEMORY[0x1E0CA2E68];
      v7.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      time1.value = value;
      time1.timescale = timescale;
      time1.flags = flags;
      time1.epoch = 0;
      v7.value = v6;
      *(_QWORD *)&v7.timescale = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 8);
      return CMTimeCompare(&time1, &v7) == 0;
    }
  }
  return result;
}

BOOL static CMTimeRange.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  CMTimeValue v2;
  CMTimeValue v3;
  CMTimeEpoch v4;
  CMTimeRange v6;
  CMTimeRange range1;

  v2 = *(_QWORD *)a2;
  v3 = *(_QWORD *)a1;
  v4 = *(_QWORD *)(a1 + 40);
  v6.duration.epoch = *(_QWORD *)(a2 + 40);
  range1.start.value = v3;
  *(_QWORD *)&range1.start.timescale = *(_QWORD *)(a1 + 8);
  *(_OWORD *)&range1.start.epoch = *(_OWORD *)(a1 + 16);
  *(_QWORD *)&range1.duration.timescale = *(_QWORD *)(a1 + 32);
  range1.duration.epoch = v4;
  v6.start.value = v2;
  *(_QWORD *)&v6.start.timescale = *(_QWORD *)(a2 + 8);
  *(_OWORD *)&v6.start.epoch = *(_OWORD *)(a2 + 16);
  *(_QWORD *)&v6.duration.timescale = *(_QWORD *)(a2 + 32);
  return CMTimeRangeEqual(&range1, &v6) != 0;
}

BOOL static CMTimeRange.!= infix(_:_:)(uint64_t a1, uint64_t a2)
{
  CMTimeValue v2;
  CMTimeValue v3;
  CMTimeEpoch v4;
  CMTimeRange v6;
  CMTimeRange range1;

  v2 = *(_QWORD *)a2;
  v3 = *(_QWORD *)a1;
  v4 = *(_QWORD *)(a1 + 40);
  v6.duration.epoch = *(_QWORD *)(a2 + 40);
  range1.start.value = v3;
  *(_QWORD *)&range1.start.timescale = *(_QWORD *)(a1 + 8);
  *(_OWORD *)&range1.start.epoch = *(_OWORD *)(a1 + 16);
  *(_QWORD *)&range1.duration.timescale = *(_QWORD *)(a1 + 32);
  range1.duration.epoch = v4;
  v6.start.value = v2;
  *(_QWORD *)&v6.start.timescale = *(_QWORD *)(a2 + 8);
  *(_OWORD *)&v6.start.epoch = *(_OWORD *)(a2 + 16);
  *(_QWORD *)&v6.duration.timescale = *(_QWORD *)(a2 + 32);
  return CMTimeRangeEqual(&range1, &v6) == 0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CMTimeRange(uint64_t a1, uint64_t a2)
{
  CMTimeValue v2;
  CMTimeEpoch v3;
  CMTimeValue v4;
  CMTimeRange v6;
  CMTimeRange range1;

  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)a2;
  v6.duration.epoch = *(_QWORD *)(a2 + 40);
  range1.start.value = v2;
  *(_QWORD *)&range1.start.timescale = *(_QWORD *)(a1 + 8);
  *(_OWORD *)&range1.start.epoch = *(_OWORD *)(a1 + 16);
  *(_QWORD *)&range1.duration.timescale = *(_QWORD *)(a1 + 32);
  range1.duration.epoch = v3;
  v6.start.value = v4;
  *(_QWORD *)&v6.start.timescale = *(_QWORD *)(a2 + 8);
  *(_OWORD *)&v6.start.epoch = *(_OWORD *)(a2 + 16);
  *(_QWORD *)&v6.duration.timescale = *(_QWORD *)(a2 + 32);
  return CMTimeRangeEqual(&range1, &v6) != 0;
}

void CMTimeRange.hash(into:)()
{
  uint64_t v0;
  int64_t v1;
  int v2;
  int64_t v3;
  Swift::UInt64 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int v9;
  int64_t v10;
  Swift::UInt64 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)v0;
  v2 = *(_DWORD *)(v0 + 12);
  v3 = *(int *)(v0 + 8);
  v4 = *(_QWORD *)(v0 + 16);
  Hasher._combine(_:)(v2 & 0xFFFFFFFD);
  if ((v2 & 0x1D) == 1)
  {
    v5 = v1;
    if ((_DWORD)v3)
    {
      v6 = v3;
      v7 = v1;
      while (1)
      {
        v5 = v6;
        if (v6 == -1 && v7 == 0x8000000000000000)
          break;
        v6 = v7 % v6;
        v7 = v5;
        if (!v6)
          goto LABEL_8;
      }
      __break(1u);
    }
LABEL_8:
    if (v5)
    {
      if (v1 == 0x8000000000000000 && v5 == -1)
      {
        __break(1u);
        goto LABEL_27;
      }
      v1 /= v5;
      v3 /= v5;
    }
    Hasher._combine(_:)(v1);
    Hasher._combine(_:)(v3);
    Hasher._combine(_:)(v4);
  }
  v8 = *(_QWORD *)(v0 + 24);
  v9 = *(_DWORD *)(v0 + 36);
  v10 = *(int *)(v0 + 32);
  v11 = *(_QWORD *)(v0 + 40);
  Hasher._combine(_:)(v9 & 0xFFFFFFFD);
  if ((v9 & 0x1D) != 1)
    return;
  v12 = v8;
  if ((_DWORD)v10)
  {
    v13 = v10;
    v14 = v8;
    while (1)
    {
      v12 = v13;
      if (v13 == -1 && v14 == 0x8000000000000000)
        break;
      v13 = v14 % v13;
      v14 = v12;
      if (!v13)
        goto LABEL_20;
    }
    __break(1u);
  }
LABEL_20:
  if (v12)
  {
    if (v8 != 0x8000000000000000 || v12 != -1)
    {
      v8 /= v12;
      v10 /= v12;
      goto LABEL_24;
    }
LABEL_27:
    __break(1u);
    return;
  }
LABEL_24:
  Hasher._combine(_:)(v8);
  Hasher._combine(_:)(v10);
  Hasher._combine(_:)(v11);
}

Swift::Int CMTimeRange.hashValue.getter()
{
  Hasher.init(_seed:)();
  CMTimeRange.hash(into:)();
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CMTimeRange()
{
  Hasher.init(_seed:)();
  CMTimeRange.hash(into:)();
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CMTimeRange()
{
  Hasher.init(_seed:)();
  CMTimeRange.hash(into:)();
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type CMTimeRange and conformance CMTimeRange()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type CMTimeRange and conformance CMTimeRange;
  if (!lazy protocol witness table cache variable for type CMTimeRange and conformance CMTimeRange)
  {
    type metadata accessor for CMTimeRange(255);
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMTimeRange, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMTimeRange and conformance CMTimeRange);
  }
  return result;
}

void _CMSampleBufferInitTrampoline.init(dataBuffer:formatDescription:numSamples:sampleTimings:sampleSizes:)(CMBlockBufferRef dataBuffer, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  OSStatus v10;
  CMSampleBufferRef v11;
  void (*v12)(void);
  opaqueCMSampleBuffer *v13;
  id v14;
  CMSampleBufferRef v15[2];

  v15[1] = *(CMSampleBufferRef *)MEMORY[0x1E0C80C00];
  v15[0] = 0;
  v10 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], dataBuffer, 1u, 0, 0, formatDescription, numSamples, *(_QWORD *)(a4 + 16), (const CMSampleTimingInfo *)(a4 + 32), *(_QWORD *)(a5 + 16), (const size_t *)(a5 + 32), v15);
  v11 = v15[0];
  if (v10 != noErr.getter())
  {
    v14 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v14, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v10, 0);
    swift_willThrow();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v11)
  {
    v12 = *(void (**)(void))(a7 + 8);
    v13 = v11;
    v12();

LABEL_5:
    return;
  }
  __break(1u);
}

uint64_t _CMSampleBufferInitTrampoline.init(dataBuffer:dataReady:formatDescription:numSamples:sampleTimings:sampleSizes:makeDataReadyHandler:)(OpaqueCMBlockBuffer *a1, char a2, const opaqueCMFormatDescription *a3, CMItemCount a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  CMItemCount v12;
  const size_t *sampleSizeArray;
  CMItemCount v14;
  const __CFAllocator *v15;
  void *v16;
  OSStatus DataReadyHandler;
  CMSampleBufferRef v18;
  uint64_t result;
  void (*v20)(void);
  opaqueCMSampleBuffer *v21;
  id v22;
  CMSampleTimingInfo *sampleTimingArray;
  _QWORD aBlock[6];
  CMSampleBufferRef sampleBufferOut[2];

  sampleBufferOut[1] = *(CMSampleBufferRef *)MEMORY[0x1E0C80C00];
  sampleBufferOut[0] = 0;
  sampleTimingArray = (CMSampleTimingInfo *)(a5 + 32);
  v12 = *(_QWORD *)(a5 + 16);
  sampleSizeArray = (const size_t *)(a6 + 32);
  v14 = *(_QWORD *)(a6 + 16);
  v15 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  aBlock[4] = a7;
  aBlock[5] = a8;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed CMSampleBufferRef) -> (@unowned Int32);
  aBlock[3] = &block_descriptor;
  v16 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  DataReadyHandler = CMSampleBufferCreateWithMakeDataReadyHandler(v15, a1, a2 & 1, a3, a4, v12, sampleTimingArray, v14, sampleSizeArray, sampleBufferOut, v16);
  _Block_release(v16);
  v18 = sampleBufferOut[0];
  if (DataReadyHandler == noErr.getter())
  {
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if (v18)
    {
      v20 = *(void (**)(void))(a10 + 8);
      v21 = v18;
      v20();

      return swift_release();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    v22 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v22, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], DataReadyHandler, 0);
    swift_willThrow();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return swift_release();
  }
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed CMSampleBufferRef) -> (@unowned Int32)(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = v3();
  swift_release();

  return v5;
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

void _CMSampleBufferInitTrampoline.init(dataBuffer:formatDescription:numSamples:presentationTimeStamp:packetDescriptions:)(CMBlockBufferRef dataBuffer, CMFormatDescriptionRef formatDescription, const AudioStreamPacketDescription *numSamples, CMTimeValue a4, uint64_t a5, CMTimeEpoch a6, uint64_t a7, int a8, uint64_t a9)
{
  const AudioStreamPacketDescription *packetDescriptions;
  const __CFAllocator *v12;
  OSStatus v13;
  CMSampleBufferRef v14;
  void (*v15)(void);
  opaqueCMSampleBuffer *v16;
  id v17;
  CMTime presentationTimeStamp;
  CMSampleBufferRef v19[2];

  v19[1] = *(CMSampleBufferRef *)MEMORY[0x1E0C80C00];
  v19[0] = 0;
  packetDescriptions = *(const AudioStreamPacketDescription **)(a7 + 16);
  if (packetDescriptions)
  {
    if (packetDescriptions != numSamples)
      __break(1u);
    packetDescriptions = (const AudioStreamPacketDescription *)(a7 + 32);
  }
  v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  presentationTimeStamp.value = a4;
  *(_QWORD *)&presentationTimeStamp.timescale = a5;
  presentationTimeStamp.epoch = a6;
  v13 = CMAudioSampleBufferCreateWithPacketDescriptions(v12, dataBuffer, 1u, 0, 0, formatDescription, (CMItemCount)numSamples, &presentationTimeStamp, packetDescriptions, v19);
  v14 = v19[0];
  if (v13 == noErr.getter())
  {
    swift_bridgeObjectRelease();
    if (v14)
    {
      v15 = *(void (**)(void))(a9 + 8);
      v16 = v14;
      v15();

    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    v17 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v17, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v13, 0);
    swift_willThrow();

    swift_bridgeObjectRelease();
  }
}

uint64_t _CMSampleBufferInitTrampoline.init(dataBuffer:dataReady:formatDescription:numSamples:presentationTimeStamp:packetDescriptions:makeDataReadyHandler:)(OpaqueCMBlockBuffer *a1, char a2, const opaqueCMFormatDescription *a3, CMItemCount a4, CMTimeValue a5, unint64_t a6, CMTimeEpoch a7, const AudioStreamPacketDescription *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  CMTimeScale v12;
  SInt64 mStartOffset;
  CMTimeValue v14;
  char v15;
  CMTimeEpoch v16;
  const AudioStreamPacketDescription *v17;
  unint64_t v18;
  const __CFAllocator *v19;
  void *makeDataReadyHandler;
  OSStatus DataReadyHandler;
  CMSampleBufferRef v22;
  uint64_t result;
  void (*v24)(void);
  opaqueCMSampleBuffer *v25;
  id v26;
  CMTime aBlock;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  CMSampleBufferRef sampleBufferOut[2];

  v12 = a6;
  sampleBufferOut[1] = *(CMSampleBufferRef *)MEMORY[0x1E0C80C00];
  sampleBufferOut[0] = 0;
  mStartOffset = a8[1].mStartOffset;
  if (mStartOffset)
  {
    if (mStartOffset != a4)
      __break(1u);
    v14 = a5;
    v15 = a2;
    v16 = a7;
    v17 = a8 + 2;
  }
  else
  {
    v14 = a5;
    v15 = a2;
    v16 = a7;
    v17 = 0;
  }
  v18 = HIDWORD(a6);
  v19 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v32 = a9;
  v33 = a10;
  aBlock.value = MEMORY[0x1E0C809B0];
  *(_QWORD *)&aBlock.timescale = 1107296256;
  aBlock.epoch = (CMTimeEpoch)thunk for @escaping @callee_guaranteed (@guaranteed CMSampleBufferRef) -> (@unowned Int32);
  v31 = &block_descriptor_3;
  makeDataReadyHandler = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  aBlock.value = v14;
  aBlock.timescale = v12;
  aBlock.flags = v18;
  aBlock.epoch = v16;
  DataReadyHandler = CMAudioSampleBufferCreateWithPacketDescriptionsAndMakeDataReadyHandler(v19, a1, v15 & 1, a3, a4, &aBlock, v17, sampleBufferOut, makeDataReadyHandler);
  _Block_release(makeDataReadyHandler);
  v22 = sampleBufferOut[0];
  if (DataReadyHandler == noErr.getter())
  {
    result = swift_bridgeObjectRelease();
    if (v22)
    {
      v24 = *(void (**)(void))(a12 + 8);
      v25 = v22;
      v24();

      return swift_release();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    v26 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v26, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], DataReadyHandler, 0);
    swift_willThrow();

    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

void _CMSampleBufferInitTrampoline.init(imageBuffer:formatDescription:sampleTiming:)(CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef formatDescription, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __int128 v8;
  __int128 v9;
  OSStatus v10;
  CMSampleBufferRef v11;
  void (*v12)(void);
  opaqueCMSampleBuffer *v13;
  id v14;
  CMSampleTimingInfo sampleTiming;
  CMSampleBufferRef sampleBufferOut[2];

  sampleBufferOut[1] = *(CMSampleBufferRef *)MEMORY[0x1E0C80C00];
  v8 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)&sampleTiming.presentationTimeStamp.timescale = *(_OWORD *)(a3 + 32);
  *(_OWORD *)&sampleTiming.decodeTimeStamp.value = v8;
  sampleTiming.decodeTimeStamp.epoch = *(_QWORD *)(a3 + 64);
  v9 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)&sampleTiming.duration.value = *(_OWORD *)a3;
  *(_OWORD *)&sampleTiming.duration.epoch = v9;
  sampleBufferOut[0] = 0;
  v10 = CMSampleBufferCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], imageBuffer, 1u, 0, 0, formatDescription, &sampleTiming, sampleBufferOut);
  v11 = sampleBufferOut[0];
  if (v10 == noErr.getter())
  {
    if (v11)
    {
      v12 = *(void (**)(void))(a5 + 8);
      v13 = v11;
      v12();

    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    v14 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v14, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v10, 0);
    swift_willThrow();

  }
}

void _CMSampleBufferInitTrampoline.init(taggedBuffers:presentationTimeStamp:duration:formatDescription:)(uint64_t a1, CMTimeValue a2, unint64_t a3, CMTimeEpoch a4, CMTimeValue a5, unint64_t a6, CMTimeEpoch a7, const opaqueCMFormatDescription *a8, uint64_t a9, uint64_t a10)
{
  CMTimeScale v11;
  CMTimeScale v14;
  unint64_t v16;
  unint64_t v17;
  OpaqueCMTaggedBufferGroup *v18;
  const __CFAllocator *v19;
  void (*v20)(void);
  opaqueCMSampleBuffer *v21;
  CMTime sbufDuration;
  CMTime sbufPTS;
  CMSampleBufferRef sBufOut[2];

  v11 = a6;
  v14 = a3;
  sBufOut[1] = *(CMSampleBufferRef *)MEMORY[0x1E0C80C00];
  v16 = HIDWORD(a3);
  v17 = HIDWORD(a6);
  sBufOut[0] = 0;
  v18 = (OpaqueCMTaggedBufferGroup *)Array<A>.taggedBufferGroup.getter(a1);
  swift_bridgeObjectRelease();
  v19 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  sbufPTS.timescale = v14;
  sbufPTS.flags = v16;
  sbufPTS.epoch = a4;
  sbufDuration.value = a5;
  sbufDuration.timescale = v11;
  sbufDuration.flags = v17;
  sbufDuration.epoch = a7;
  sbufPTS.value = a2;
  CMSampleBufferCreateForTaggedBufferGroup(v19, v18, &sbufPTS, &sbufDuration, a8, sBufOut);
  if (!sBufOut[0])
    __break(1u);
  v20 = *(void (**)(void))(a10 + 8);
  v21 = sBufOut[0];
  v20();

}

uint64_t _CMSampleBufferInitTrampoline.init(imageBuffer:dataReady:formatDescription:sampleTiming:makeDataReadyHandler:)(__CVBuffer *a1, char a2, const opaqueCMFormatDescription *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 v12;
  __int128 v13;
  const __CFAllocator *v14;
  void *v15;
  OSStatus DataReadyHandler;
  CMSampleBufferRef v17;
  uint64_t result;
  void (*v19)(void);
  id v20;
  _QWORD aBlock[6];
  CMSampleTimingInfo sampleTiming;
  CMSampleBufferRef sampleBufferOut[2];

  sampleBufferOut[1] = *(CMSampleBufferRef *)MEMORY[0x1E0C80C00];
  v12 = *(_OWORD *)(a4 + 48);
  *(_OWORD *)&sampleTiming.presentationTimeStamp.timescale = *(_OWORD *)(a4 + 32);
  *(_OWORD *)&sampleTiming.decodeTimeStamp.value = v12;
  sampleTiming.decodeTimeStamp.epoch = *(_QWORD *)(a4 + 64);
  v13 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)&sampleTiming.duration.value = *(_OWORD *)a4;
  *(_OWORD *)&sampleTiming.duration.epoch = v13;
  sampleBufferOut[0] = 0;
  v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  aBlock[4] = a5;
  aBlock[5] = a6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed CMSampleBufferRef) -> (@unowned Int32);
  aBlock[3] = &block_descriptor_6;
  v15 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  DataReadyHandler = CMSampleBufferCreateForImageBufferWithMakeDataReadyHandler(v14, a1, a2 & 1, a3, &sampleTiming, sampleBufferOut, v15);
  _Block_release(v15);
  v17 = sampleBufferOut[0];
  result = noErr.getter();
  if (DataReadyHandler != (_DWORD)result)
  {
    v20 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v20, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], DataReadyHandler, 0);
    swift_willThrow();
    goto LABEL_5;
  }
  if (v17)
  {
    v19 = *(void (**)(void))(a8 + 8);
    v17 = v17;
    v19();
LABEL_5:

    return swift_release();
  }
  __break(1u);
  return result;
}

void _CMSampleBufferInitTrampoline.init(copying:)(CMSampleBufferRef sbuf, uint64_t a2, uint64_t a3)
{
  OSStatus Copy;
  CMSampleBufferRef v6;
  void (*v7)(void);
  opaqueCMSampleBuffer *v8;
  id v9;
  CMSampleBufferRef v10[2];

  v10[1] = *(CMSampleBufferRef *)MEMORY[0x1E0C80C00];
  v10[0] = 0;
  Copy = CMSampleBufferCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], sbuf, v10);
  v6 = v10[0];
  if (Copy != noErr.getter())
  {
    v9 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v9, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], Copy, 0);
    swift_willThrow();

    goto LABEL_5;
  }
  if (v6)
  {
    v7 = *(void (**)(void))(a3 + 8);
    v8 = v6;
    v7();

LABEL_5:
    return;
  }
  __break(1u);
}

void _CMSampleBufferInitTrampoline.init(copying:withNewTiming:)(CMSampleBufferRef originalSBuf, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OSStatus CopyWithNewTiming;
  CMSampleBufferRef v7;
  void (*v8)(void);
  opaqueCMSampleBuffer *v9;
  id v10;
  CMSampleBufferRef v11[2];

  v11[1] = *(CMSampleBufferRef *)MEMORY[0x1E0C80C00];
  v11[0] = 0;
  CopyWithNewTiming = CMSampleBufferCreateCopyWithNewTiming((CFAllocatorRef)*MEMORY[0x1E0C9AE00], originalSBuf, *(_QWORD *)(a2 + 16), (const CMSampleTimingInfo *)(a2 + 32), v11);
  v7 = v11[0];
  if (CopyWithNewTiming != noErr.getter())
  {
    v10 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v10, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], CopyWithNewTiming, 0);
    swift_willThrow();

    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  if (v7)
  {
    v8 = *(void (**)(void))(a4 + 8);
    v9 = v7;
    v8();

LABEL_5:
    return;
  }
  __break(1u);
}

void _CMSampleBufferInitTrampoline.init(copying:forRange:)(CMSampleBufferRef sbuf, CFRange sampleRange, uint64_t a3, uint64_t a4)
{
  CFIndex v4;
  CFIndex location;
  OSStatus v8;
  CMSampleBufferRef v9;
  void (*v10)(void);
  opaqueCMSampleBuffer *v11;
  id v12;
  CMSampleBufferRef v13[2];

  v13[1] = *(CMSampleBufferRef *)MEMORY[0x1E0C80C00];
  v13[0] = 0;
  v4 = sampleRange.length - sampleRange.location;
  if (__OFSUB__(sampleRange.length, sampleRange.location))
    __break(1u);
  location = sampleRange.location;
  v8 = CMSampleBufferCopySampleBufferForRange((CFAllocatorRef)*MEMORY[0x1E0C9AE00], sbuf, *(CFRange *)(&v4 - 1), v13);
  v9 = v13[0];
  if (v8 != noErr.getter())
  {
    v12 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v12, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v8, 0);
    swift_willThrow();

    goto LABEL_6;
  }
  if (v9)
  {
    v10 = *(void (**)(void))(a4 + 8);
    v11 = v9;
    v10();

LABEL_6:
    return;
  }
  __break(1u);
}

id static CMSampleBufferRef.Error.allocationFailed.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for allocationFailed, (id *)&static CMSampleBufferRef.Error.allocationFailed);
}

id static CMSampleBufferRef.Error.requiredParameterMissing.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for requiredParameterMissing, (id *)&static CMSampleBufferRef.Error.requiredParameterMissing);
}

id one-time initialization function for alreadyHasDataBuffer()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12732, 0);
  static CMSampleBufferRef.Error.alreadyHasDataBuffer = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.alreadyHasDataBuffer.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for alreadyHasDataBuffer, (id *)&static CMSampleBufferRef.Error.alreadyHasDataBuffer);
}

id one-time initialization function for bufferNotReady()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12733, 0);
  static CMSampleBufferRef.Error.bufferNotReady = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.bufferNotReady.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for bufferNotReady, (id *)&static CMSampleBufferRef.Error.bufferNotReady);
}

id one-time initialization function for sampleIndexOutOfRange()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12734, 0);
  static CMSampleBufferRef.Error.sampleIndexOutOfRange = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.sampleIndexOutOfRange.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for sampleIndexOutOfRange, (id *)&static CMSampleBufferRef.Error.sampleIndexOutOfRange);
}

id one-time initialization function for bufferHasNoSampleSizes()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12735, 0);
  static CMSampleBufferRef.Error.bufferHasNoSampleSizes = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.bufferHasNoSampleSizes.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for bufferHasNoSampleSizes, (id *)&static CMSampleBufferRef.Error.bufferHasNoSampleSizes);
}

id one-time initialization function for bufferHasNoSampleTimingInfo()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12736, 0);
  static CMSampleBufferRef.Error.bufferHasNoSampleTimingInfo = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.bufferHasNoSampleTimingInfo.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for bufferHasNoSampleTimingInfo, (id *)&static CMSampleBufferRef.Error.bufferHasNoSampleTimingInfo);
}

id one-time initialization function for arrayTooSmall()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12737, 0);
  static CMSampleBufferRef.Error.arrayTooSmall = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.arrayTooSmall.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for arrayTooSmall, (id *)&static CMSampleBufferRef.Error.arrayTooSmall);
}

id one-time initialization function for invalidEntryCount()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12738, 0);
  static CMSampleBufferRef.Error.invalidEntryCount = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.invalidEntryCount.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidEntryCount, (id *)&static CMSampleBufferRef.Error.invalidEntryCount);
}

id one-time initialization function for cannotSubdivide()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12739, 0);
  static CMSampleBufferRef.Error.cannotSubdivide = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.cannotSubdivide.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for cannotSubdivide, (id *)&static CMSampleBufferRef.Error.cannotSubdivide);
}

id one-time initialization function for sampleTimingInfoInvalid()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12740, 0);
  static CMSampleBufferRef.Error.sampleTimingInfoInvalid = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.sampleTimingInfoInvalid.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for sampleTimingInfoInvalid, (id *)&static CMSampleBufferRef.Error.sampleTimingInfoInvalid);
}

id one-time initialization function for invalidMediaTypeForOperation()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12741, 0);
  static CMSampleBufferRef.Error.invalidMediaTypeForOperation = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.invalidMediaTypeForOperation.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidMediaTypeForOperation, (id *)&static CMSampleBufferRef.Error.invalidMediaTypeForOperation);
}

id one-time initialization function for invalidSampleData()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12742, 0);
  static CMSampleBufferRef.Error.invalidSampleData = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.invalidSampleData.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidSampleData, (id *)&static CMSampleBufferRef.Error.invalidSampleData);
}

id one-time initialization function for invalidMediaFormat()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12743, 0);
  static CMSampleBufferRef.Error.invalidMediaFormat = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.invalidMediaFormat.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidMediaFormat, (id *)&static CMSampleBufferRef.Error.invalidMediaFormat);
}

id one-time initialization function for invalidated()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12744, 0);
  static CMSampleBufferRef.Error.invalidated = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.invalidated.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidated, (id *)&static CMSampleBufferRef.Error.invalidated);
}

id one-time initialization function for dataFailed()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -16750, 0);
  static CMSampleBufferRef.Error.dataFailed = (uint64_t)result;
  return result;
}

{
  static CMSampleBufferRef.dataFailed = *MEMORY[0x1E0CA27D0];
  return (id)static CMSampleBufferRef.dataFailed;
}

id static CMSampleBufferRef.Error.dataFailed.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for dataFailed, (id *)&static CMSampleBufferRef.Error.dataFailed);
}

id one-time initialization function for dataCanceled()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -16751, 0);
  static CMSampleBufferRef.Error.dataCanceled = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.dataCanceled.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for dataCanceled, (id *)&static CMSampleBufferRef.Error.dataCanceled);
}

uint64_t CMSampleBufferRef.Flags.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t CMSampleBufferRef.Flags.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static CMSampleBufferRef.Flags.audioBufferListAssure16ByteAlignment.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMSampleBufferRef.setDataBuffer(_:)(CMBlockBufferRef a1)
{
  CMTimebaseRef.removeTimer(_:)((uint64_t)a1, MEMORY[0x1E0C9F070]);
}

CMBlockBufferRef CMSampleBufferRef.dataBuffer.getter()
{
  opaqueCMSampleBuffer *v0;

  return CMSampleBufferGetDataBuffer(v0);
}

CVImageBufferRef CMSampleBufferRef.imageBuffer.getter()
{
  opaqueCMSampleBuffer *v0;

  return CMSampleBufferGetImageBuffer(v0);
}

char *CMSampleBufferRef.taggedBuffers.getter()
{
  opaqueCMSampleBuffer *v0;
  OpaqueCMTaggedBufferGroup *v1;
  OpaqueCMTaggedBufferGroup *v2;
  char *v3;

  v1 = CMSampleBufferGetTaggedBufferGroup(v0);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = specialized Array<A>.init(taggedBufferGroup:)(v1);

  return v3;
}

uint64_t CMSampleBufferRef.setDataBuffer(fromAudioBufferList:blockBufferMemoryAllocator:flags:)(AudioBufferList *bufferList, CFAllocatorRef blockBufferBlockAllocator, uint32_t *a3)
{
  opaqueCMSampleBuffer *v3;
  OSStatus v4;
  uint64_t result;
  id v6;

  v4 = CMSampleBufferSetDataBufferFromAudioBufferList(v3, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], blockBufferBlockAllocator, *a3, bufferList);
  result = noErr.getter();
  if (v4 != (_DWORD)result)
  {
    v6 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v6, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v4, 0);
    return swift_willThrow();
  }
  return result;
}

uint64_t CMSampleBufferRef.withAudioBufferList<A>(blockBufferMemoryAllocator:flags:body:)(const __CFAllocator *a1, uint32_t *a2, void (*a3)(char *, OpaqueCMBlockBuffer *), uint64_t a4)
{
  opaqueCMSampleBuffer *v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint32_t v12;
  OSStatus AudioBufferListWithRetainedBlockBuffer;
  size_t v14;
  AudioBufferList *v15;
  OSStatus v16;
  CMBlockBufferRef v17;
  uint64_t result;
  OpaqueCMBlockBuffer *v19;
  id v20;
  id v21;
  _QWORD v22[2];
  void (*v23)(char *, OpaqueCMBlockBuffer *);
  size_t bufferListSizeNeededOut;
  CMBlockBufferRef blockBufferOut[2];

  v22[1] = a4;
  v23 = a3;
  blockBufferOut[1] = *(CMBlockBufferRef *)MEMORY[0x1E0C80C00];
  v8 = type metadata accessor for UnsafeMutableAudioBufferListPointer();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *a2;
  bufferListSizeNeededOut = 0;
  AudioBufferListWithRetainedBlockBuffer = CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(v4, &bufferListSizeNeededOut, 0, 0, 0, 0, v12, 0);
  if (AudioBufferListWithRetainedBlockBuffer != noErr.getter())
  {
    v20 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v20, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], AudioBufferListWithRetainedBlockBuffer, 0);
    return swift_willThrow();
  }
  v22[0] = v5;
  v14 = bufferListSizeNeededOut;
  v15 = (AudioBufferList *)swift_slowAlloc();
  blockBufferOut[0] = 0;
  v16 = CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(v4, 0, v15, v14, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], a1, v12, blockBufferOut);
  v17 = blockBufferOut[0];
  if (v16 != noErr.getter())
  {
    v21 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v21, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v16, 0);
    swift_willThrow();

    return MEMORY[0x1BCCBA934](v15, -1, -1);
  }
  result = UnsafeMutableAudioBufferListPointer.init(_:)();
  if (v17)
  {
    v19 = v17;
    v23(v11, v19);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

    return MEMORY[0x1BCCBA934](v15, -1, -1);
  }
  __break(1u);
  return result;
}

uint64_t CMSampleBufferRef.audioStreamPacketDescriptions()()
{
  opaqueCMSampleBuffer *v0;
  opaqueCMSampleBuffer *v1;
  uint64_t AudioStreamPacketDescriptions;
  int64_t v3;
  unint64_t v4;
  id v5;
  OSStatus v6;
  id v7;
  size_t v9[2];

  v1 = v0;
  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = 0;
  AudioStreamPacketDescriptions = CMSampleBufferGetAudioStreamPacketDescriptions(v0, 0, 0, v9);
  if ((_DWORD)AudioStreamPacketDescriptions != noErr.getter())
  {
    v5 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v5, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], (int)AudioStreamPacketDescriptions, 0);
    swift_willThrow();
    return AudioStreamPacketDescriptions;
  }
  v3 = v9[0] + 15;
  if ((v9[0] & 0x8000000000000000) == 0)
    v3 = v9[0];
  if ((uint64_t)v9[0] < -15)
  {
    __break(1u);
    goto LABEL_14;
  }
  if ((uint64_t)v9[0] <= 15)
  {
    AudioStreamPacketDescriptions = MEMORY[0x1E0DEE9D8];
    v4 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
  }
  else
  {
    v4 = v3 >> 4;
    type metadata accessor for AudioStreamPacketDescription(0);
    AudioStreamPacketDescriptions = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(_QWORD *)(AudioStreamPacketDescriptions + 16) = v4;
    bzero((void *)(AudioStreamPacketDescriptions + 32), 16 * v4);
  }
  if (v4 >> 59)
LABEL_14:
    __break(1u);
  v6 = CMSampleBufferGetAudioStreamPacketDescriptions(v1, 16 * v4, (AudioStreamPacketDescription *)(AudioStreamPacketDescriptions + 32), 0);
  if (v6 != noErr.getter())
  {
    v7 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v7, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v6, 0);
    swift_willThrow();
    swift_bridgeObjectRelease();
  }
  return AudioStreamPacketDescriptions;
}

uint64_t CMSampleBufferRef.withUnsafeAudioStreamPacketDescriptions<A>(_:)(uint64_t (*a1)(AudioStreamPacketDescription *, uint64_t))
{
  opaqueCMSampleBuffer *v1;
  OSStatus AudioStreamPacketDescriptionsPtr;
  id v5;
  size_t packetDescriptionsSizeOut;
  AudioStreamPacketDescription *packetDescriptionsPointerOut[2];

  packetDescriptionsPointerOut[1] = *(AudioStreamPacketDescription **)MEMORY[0x1E0C80C00];
  packetDescriptionsSizeOut = 0;
  packetDescriptionsPointerOut[0] = 0;
  AudioStreamPacketDescriptionsPtr = CMSampleBufferGetAudioStreamPacketDescriptionsPtr(v1, (const AudioStreamPacketDescription **)packetDescriptionsPointerOut, &packetDescriptionsSizeOut);
  if (AudioStreamPacketDescriptionsPtr == noErr.getter())
    return a1(packetDescriptionsPointerOut[0], (uint64_t)packetDescriptionsSizeOut / 16);
  v5 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  objc_msgSend(v5, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], AudioStreamPacketDescriptionsPtr, 0);
  return swift_willThrow();
}

uint64_t CMSampleBufferRef.copyPCMData(fromRange:into:)(uint64_t frameOffset, uint64_t a2, AudioBufferList *bufferList)
{
  opaqueCMSampleBuffer *v3;
  uint64_t v5;
  id v6;
  OSStatus v7;
  id v8;

  if (frameOffset != (int)frameOffset)
    goto LABEL_4;
  v5 = a2 - frameOffset;
  if (__OFSUB__(a2, frameOffset))
  {
    __break(1u);
    return frameOffset;
  }
  if (v5 != (int)v5)
  {
LABEL_4:
    if (one-time initialization token for sampleIndexOutOfRange != -1)
      swift_once();
    v6 = (id)static CMSampleBufferRef.Error.sampleIndexOutOfRange;
    return swift_willThrow();
  }
  v7 = CMSampleBufferCopyPCMDataIntoAudioBufferList(v3, frameOffset, v5, bufferList);
  frameOffset = noErr.getter();
  if (v7 != (_DWORD)frameOffset)
  {
    v8 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v8, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v7, 0);
    return swift_willThrow();
  }
  return frameOffset;
}

void CMSampleBufferRef.DataReadiness.hash(into:)()
{
  uint64_t v0;
  Swift::UInt32 v1;

  v1 = *(_DWORD *)v0;
  if (*(_BYTE *)(v0 + 4) == 1)
  {
    Hasher._combine(_:)(v1 != 0);
  }
  else
  {
    Hasher._combine(_:)(2uLL);
    Hasher._combine(_:)(v1);
  }
}

uint64_t static CMSampleBufferRef.DataReadiness.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;

  v2 = *(unsigned __int8 *)(a2 + 4);
  v3 = (*(_DWORD *)a1 == *(_DWORD *)a2) & ~v2;
  if (*(_DWORD *)a2)
    v4 = *(unsigned __int8 *)(a2 + 4);
  else
    v4 = 0;
  if (*(_DWORD *)a2)
    v2 = 0;
  if (*(_DWORD *)a1)
    v5 = v4;
  else
    v5 = v2;
  if (*(_BYTE *)(a1 + 4) == 1)
    return v5;
  else
    return v3;
}

Swift::Int CMSampleBufferRef.DataReadiness.hashValue.getter()
{
  uint64_t v0;
  Swift::UInt32 v1;
  int v2;

  v1 = *(_DWORD *)v0;
  v2 = *(unsigned __int8 *)(v0 + 4);
  Hasher.init(_seed:)();
  if (v2 == 1)
  {
    Hasher._combine(_:)(v1 != 0);
  }
  else
  {
    Hasher._combine(_:)(2uLL);
    Hasher._combine(_:)(v1);
  }
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CMSampleBufferRef.DataReadiness()
{
  uint64_t v0;
  Swift::UInt32 v1;
  int v2;

  v1 = *(_DWORD *)v0;
  v2 = *(unsigned __int8 *)(v0 + 4);
  Hasher.init(_seed:)();
  if (v2 == 1)
  {
    Hasher._combine(_:)(v1 != 0);
  }
  else
  {
    Hasher._combine(_:)(2uLL);
    Hasher._combine(_:)(v1);
  }
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CMSampleBufferRef.DataReadiness()
{
  uint64_t v0;
  Swift::UInt32 v1;

  v1 = *(_DWORD *)v0;
  if (*(_BYTE *)(v0 + 4) == 1)
  {
    Hasher._combine(_:)(v1 != 0);
  }
  else
  {
    Hasher._combine(_:)(2uLL);
    Hasher._combine(_:)(v1);
  }
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CMSampleBufferRef.DataReadiness()
{
  uint64_t v0;
  Swift::UInt32 v1;
  int v2;

  v1 = *(_DWORD *)v0;
  v2 = *(unsigned __int8 *)(v0 + 4);
  Hasher.init(_seed:)();
  if (v2 == 1)
  {
    Hasher._combine(_:)(v1 != 0);
  }
  else
  {
    Hasher._combine(_:)(2uLL);
    Hasher._combine(_:)(v1);
  }
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CMSampleBufferRef.DataReadiness(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;

  v2 = *(unsigned __int8 *)(a2 + 4);
  v3 = (*(_DWORD *)a1 == *(_DWORD *)a2) & ~v2;
  if (*(_DWORD *)a2)
    v4 = *(unsigned __int8 *)(a2 + 4);
  else
    v4 = 0;
  if (*(_DWORD *)a2)
    v2 = 0;
  if (*(_DWORD *)a1)
    v5 = v4;
  else
    v5 = v2;
  if (*(_BYTE *)(a1 + 4) == 1)
    return v5;
  else
    return v3;
}

uint64_t CMSampleBufferRef.dataReadiness.getter@<X0>(uint64_t a1@<X8>)
{
  opaqueCMSampleBuffer *v1;
  uint64_t result;
  OSStatus v4;
  BOOL v5;
  OSStatus statusOut;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  statusOut = noErr.getter();
  result = CMSampleBufferDataIsReady(v1);
  if ((_DWORD)result)
  {
    v4 = 1;
    v5 = 1;
  }
  else
  {
    result = CMSampleBufferHasDataFailed(v1, &statusOut);
    v5 = (_DWORD)result == 0;
    v4 = statusOut;
    if (!(_DWORD)result)
      v4 = 0;
  }
  *(_DWORD *)a1 = v4;
  *(_BYTE *)(a1 + 4) = v5;
  return result;
}

uint64_t CMSampleBufferRef.setDataReadiness(_:)(uint64_t a1)
{
  opaqueCMSampleBuffer *v1;
  OSStatus v2;
  int v3;
  uint64_t result;
  OSStatus v5;
  OSStatus v6;
  id v7;

  v2 = *(_DWORD *)a1;
  v3 = *(unsigned __int8 *)(a1 + 4);
  result = noErr.getter();
  if (v3 == 1)
  {
    if (!v2)
    {
      __break(1u);
      return result;
    }
    v5 = CMSampleBufferSetDataReady(v1);
  }
  else
  {
    v5 = CMSampleBufferSetDataFailed(v1, v2);
  }
  v6 = v5;
  result = noErr.getter();
  if (v6 != (_DWORD)result)
  {
    v7 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v7, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v6, 0);
    return swift_willThrow();
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMSampleBufferRef.makeDataReady()()
{
  opaqueCMSampleBuffer *v0;
  OSStatus DataReady;
  id v2;

  DataReady = CMSampleBufferMakeDataReady(v0);
  if (DataReady != noErr.getter())
  {
    v2 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v2, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], DataReady, 0);
    swift_willThrow();
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMSampleBufferRef.trackDataReadiness(_:)(CMSampleBufferRef a1)
{
  CMTimebaseRef.removeTimer(_:)((uint64_t)a1, MEMORY[0x1E0C9F0B0]);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMSampleBufferRef.invalidate()()
{
  opaqueCMSampleBuffer *v0;
  OSStatus v1;
  pthread_key_t v2;
  id *v3;
  id *v4;
  id v5;
  id v6;

  v1 = CMSampleBufferInvalidate(v0);
  if (one-time initialization token for tlsKey != -1)
    swift_once();
  v2 = static BoxedError.tlsKey;
  v3 = (id *)pthread_getspecific(static BoxedError.tlsKey);
  if (v3)
  {
    v4 = v3;
    pthread_setspecific(v2, 0);
    v5 = v4[2];
    swift_release();
  }
  else
  {
    if (v1 == noErr.getter())
      return;
    v6 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v6, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v1, 0);
  }
  swift_willThrow();
}

uint64_t CMSampleBufferRef.setInvalidateHandler(_:)(uint64_t a1, uint64_t a2)
{
  opaqueCMSampleBuffer *v2;
  uint64_t v5;
  void *v6;
  OSStatus v7;
  uint64_t result;
  id v9;
  _QWORD v10[6];

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  v10[4] = partial apply for closure #1 in closure #1 in CMSampleBufferRef.setInvalidateHandler(_:);
  v10[5] = v5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1107296256;
  v10[2] = thunk for @escaping @callee_guaranteed (@guaranteed CMSampleBufferRef) -> ();
  v10[3] = &block_descriptor_9;
  v6 = _Block_copy(v10);
  swift_retain();
  swift_release();
  v7 = CMSampleBufferSetInvalidateHandler(v2, v6);
  _Block_release(v6);
  result = noErr.getter();
  if (v7 != (_DWORD)result)
  {
    v9 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v9, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v7, 0);
    return swift_willThrow();
  }
  return result;
}

uint64_t closure #1 in closure #1 in CMSampleBufferRef.setInvalidateHandler(_:)(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void thunk for @escaping @callee_guaranteed (@guaranteed CMSampleBufferRef) -> ()(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

BOOL CMSampleBufferRef.isValid.getter()
{
  opaqueCMSampleBuffer *v0;

  return CMSampleBufferIsValid(v0) != 0;
}

CMItemCount CMSampleBufferRef.numSamples.getter()
{
  opaqueCMSampleBuffer *v0;

  return CMSampleBufferGetNumSamples(v0);
}

uint64_t CMSampleBufferRef.duration.getter()
{
  return CMClockRef.time.getter(MEMORY[0x1E0C9EFC8]);
}

uint64_t CMSampleBufferRef.presentationTimeStamp.getter()
{
  return CMClockRef.time.getter(MEMORY[0x1E0C9F008]);
}

uint64_t CMSampleBufferRef.decodeTimeStamp.getter()
{
  return CMClockRef.time.getter(MEMORY[0x1E0C9EFC0]);
}

uint64_t CMSampleBufferRef.outputDuration.getter()
{
  return CMClockRef.time.getter(MEMORY[0x1E0C9EFF0]);
}

uint64_t CMSampleBufferRef.outputPresentationTimeStamp.getter()
{
  return CMClockRef.time.getter(MEMORY[0x1E0C9EFF8]);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMSampleBufferRef.setOutputPresentationTimeStamp(_:)(CMTime a1)
{
  opaqueCMSampleBuffer *v1;
  OSStatus v2;
  id v3;
  CMTime outputPresentationTimeStamp;

  outputPresentationTimeStamp = a1;
  v2 = CMSampleBufferSetOutputPresentationTimeStamp(v1, &outputPresentationTimeStamp);
  if (v2 != noErr.getter())
  {
    v3 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v3, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v2, 0);
    swift_willThrow();
  }
}

uint64_t CMSampleBufferRef.outputDecodeTimeStamp.getter()
{
  return CMClockRef.time.getter(MEMORY[0x1E0C9EFE8]);
}

uint64_t CMSampleBufferRef.sampleTimingInfos()()
{
  return CMSampleBufferRef.sampleTimingInfos()(MEMORY[0x1E0C9F030]);
}

uint64_t CMSampleBufferRef.outputSampleTimingInfos()()
{
  return CMSampleBufferRef.sampleTimingInfos()(MEMORY[0x1E0C9F000]);
}

uint64_t CMSampleBufferRef.sampleTimingInfos()(uint64_t (*a1)(void))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  int v5;
  id v6;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v9 = *MEMORY[0x1E0CA2E90];
  v10 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 8);
  v11 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
  v12 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 32);
  v13 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 40);
  v14 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 56);
  v15 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
  v2 = a1();
  if ((_DWORD)v2 == -12736)
    return MEMORY[0x1E0DEE9D8];
  v3 = v2;
  if ((_DWORD)v2 == noErr.getter())
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CMSampleTimingInfo>);
    v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_1B8D30590;
    *(_QWORD *)(v3 + 32) = v9;
    *(_QWORD *)(v3 + 40) = v10;
    *(_OWORD *)(v3 + 48) = v11;
    *(_QWORD *)(v3 + 64) = v12;
    *(_OWORD *)(v3 + 72) = v13;
    *(_QWORD *)(v3 + 88) = v14;
    *(_QWORD *)(v3 + 96) = v15;
  }
  else
  {
    if ((_DWORD)v3 == -12737)
      v3 = noErr.getter();
    if ((_DWORD)v3 == noErr.getter())
    {
      v3 = MEMORY[0x1E0DEE9D8];
      v5 = ((uint64_t (*)(uint64_t, _QWORD, uint64_t, _QWORD))a1)(v1, *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16), MEMORY[0x1E0DEE9D8] + 32, 0);
      if (v5 != noErr.getter())
      {
        v6 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
        objc_msgSend(v6, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v5, 0);
        swift_willThrow();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      v4 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
      objc_msgSend(v4, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], (int)v3, 0);
      swift_willThrow();
    }
  }
  return v3;
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMSampleBufferRef.sampleTimingInfo(at:)(__C::CMSampleTimingInfo *__return_ptr retstr, Swift::Int at)
{
  opaqueCMSampleBuffer *v2;
  opaqueCMSampleBuffer *v3;
  CMTimeEpoch v5;
  OSStatus SampleTimingInfo;
  CMTimeEpoch epoch;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  id v13;
  CMSampleTimingInfo v14;
  uint64_t v15;

  v3 = v2;
  v15 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
  v14.duration.value = *MEMORY[0x1E0CA2E90];
  *(_QWORD *)&v14.duration.timescale = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 8);
  *(_OWORD *)&v14.duration.epoch = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
  *(_QWORD *)&v14.presentationTimeStamp.timescale = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 32);
  *(_OWORD *)&v14.presentationTimeStamp.epoch = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 40);
  *(_QWORD *)&v14.decodeTimeStamp.timescale = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 56);
  v14.decodeTimeStamp.epoch = v5;
  SampleTimingInfo = CMSampleBufferGetSampleTimingInfo(v3, at, &v14);
  if (SampleTimingInfo == noErr.getter())
  {
    epoch = v14.decodeTimeStamp.epoch;
    v8 = *(_QWORD *)&v14.duration.timescale;
    v9 = *(_QWORD *)&v14.presentationTimeStamp.timescale;
    v10 = *(_QWORD *)&v14.decodeTimeStamp.timescale;
    v11 = *(_OWORD *)&v14.duration.epoch;
    v12 = *(_OWORD *)&v14.presentationTimeStamp.epoch;
    retstr->duration.value = v14.duration.value;
    *(_QWORD *)&retstr->duration.timescale = v8;
    *(_OWORD *)&retstr->duration.epoch = v11;
    *(_QWORD *)&retstr->presentationTimeStamp.timescale = v9;
    *(_OWORD *)&retstr->presentationTimeStamp.epoch = v12;
    *(_QWORD *)&retstr->decodeTimeStamp.timescale = v10;
    retstr->decodeTimeStamp.epoch = epoch;
  }
  else
  {
    v13 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v13, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], SampleTimingInfo, 0);
    swift_willThrow();
  }
}

uint64_t CMSampleBufferRef.sampleSizes()()
{
  opaqueCMSampleBuffer *v0;
  opaqueCMSampleBuffer *v1;
  OSStatus SampleSizeArray;
  uint64_t v3;
  int v4;
  CMItemCount v5;
  id v6;
  OSStatus v7;
  id v8;
  size_t sizeArrayOut;
  CMItemCount sizeArrayEntriesNeededOut[2];

  v1 = v0;
  sizeArrayEntriesNeededOut[1] = *MEMORY[0x1E0C80C00];
  sizeArrayOut = 0;
  sizeArrayEntriesNeededOut[0] = 0;
  SampleSizeArray = CMSampleBufferGetSampleSizeArray(v0, 1, &sizeArrayOut, sizeArrayEntriesNeededOut);
  v3 = MEMORY[0x1E0DEE9D8];
  if (SampleSizeArray != -12736)
  {
    v4 = SampleSizeArray;
    if (SampleSizeArray == noErr.getter())
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
      v3 = swift_allocObject();
      *(_OWORD *)(v3 + 16) = xmmword_1B8D30590;
      *(_QWORD *)(v3 + 32) = sizeArrayOut;
    }
    else
    {
      if (v4 == -12737)
        v4 = noErr.getter();
      if (v4 == noErr.getter())
      {
        v5 = sizeArrayEntriesNeededOut[0];
        if (sizeArrayEntriesNeededOut[0] < 0)
          __break(1u);
        if (sizeArrayEntriesNeededOut[0])
        {
          v3 = static Array._allocateBufferUninitialized(minimumCapacity:)();
          *(_QWORD *)(v3 + 16) = v5;
          bzero((void *)(v3 + 32), 8 * v5);
        }
        else
        {
          v5 = *(_QWORD *)(v3 + 16);
        }
        v7 = CMSampleBufferGetSampleSizeArray(v1, v5, (size_t *)(v3 + 32), 0);
        if (v7 != noErr.getter())
        {
          v8 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
          objc_msgSend(v8, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v7, 0);
          swift_willThrow();
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        v6 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
        objc_msgSend(v6, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v4, 0);
        swift_willThrow();
      }
    }
  }
  return v3;
}

Swift::Int __swiftcall CMSampleBufferRef.sampleSize(at:)(Swift::Int at)
{
  opaqueCMSampleBuffer *v1;

  return CMSampleBufferGetSampleSize(v1, at);
}

size_t CMSampleBufferRef.totalSampleSize.getter()
{
  opaqueCMSampleBuffer *v0;

  return CMSampleBufferGetTotalSampleSize(v0);
}

CMFormatDescriptionRef CMSampleBufferRef.formatDescription.getter()
{
  opaqueCMSampleBuffer *v0;

  return CMSampleBufferGetFormatDescription(v0);
}

uint64_t (*CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

id one-time initialization function for notSync()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync = *MEMORY[0x1E0CA2620];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for notSync, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync, a1);
}

id one-time initialization function for partialSync()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.partialSync = *MEMORY[0x1E0CA2628];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.partialSync;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.partialSync.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for partialSync, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.partialSync, a1);
}

id one-time initialization function for hasRedundantCoding()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hasRedundantCoding = *MEMORY[0x1E0CA2610];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hasRedundantCoding;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hasRedundantCoding.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for hasRedundantCoding, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hasRedundantCoding, a1);
}

id one-time initialization function for isDependedOnByOthers()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.isDependedOnByOthers = *MEMORY[0x1E0CA2618];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.isDependedOnByOthers;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.isDependedOnByOthers.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for isDependedOnByOthers, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.isDependedOnByOthers, a1);
}

id one-time initialization function for dependsOnOthers()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.dependsOnOthers = *MEMORY[0x1E0CA25C8];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.dependsOnOthers;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.dependsOnOthers.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for dependsOnOthers, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.dependsOnOthers, a1);
}

id one-time initialization function for earlierDisplayTimesAllowed()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.earlierDisplayTimesAllowed = *MEMORY[0x1E0CA25E0];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.earlierDisplayTimesAllowed;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.earlierDisplayTimesAllowed.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for earlierDisplayTimesAllowed, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.earlierDisplayTimesAllowed, a1);
}

id one-time initialization function for displayImmediately()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.displayImmediately = *MEMORY[0x1E0CA25D0];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.displayImmediately;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.displayImmediately.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for displayImmediately, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.displayImmediately, a1);
}

id one-time initialization function for doNotDisplay()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.doNotDisplay = *MEMORY[0x1E0CA25D8];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.doNotDisplay;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.doNotDisplay.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for doNotDisplay, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.doNotDisplay, a1);
}

id one-time initialization function for hevcTemporalLevelInfo()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcTemporalLevelInfo = *MEMORY[0x1E0CA2600];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcTemporalLevelInfo;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcTemporalLevelInfo.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for hevcTemporalLevelInfo, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcTemporalLevelInfo, a1);
}

id one-time initialization function for hevcTemporalSubLayerAccess()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcTemporalSubLayerAccess = *MEMORY[0x1E0CA2608];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcTemporalSubLayerAccess;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcTemporalSubLayerAccess.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for hevcTemporalSubLayerAccess, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcTemporalSubLayerAccess, a1);
}

id one-time initialization function for hevcStepwiseTemporalSubLayerAccess()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcStepwiseTemporalSubLayerAccess = *MEMORY[0x1E0CA25F0];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcStepwiseTemporalSubLayerAccess;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcStepwiseTemporalSubLayerAccess.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for hevcStepwiseTemporalSubLayerAccess, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcStepwiseTemporalSubLayerAccess, a1);
}

id one-time initialization function for hevcSyncSampleNALUnitType()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcSyncSampleNALUnitType = *MEMORY[0x1E0CA25F8];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcSyncSampleNALUnitType;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcSyncSampleNALUnitType.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for hevcSyncSampleNALUnitType, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcSyncSampleNALUnitType, a1);
}

id one-time initialization function for audioIndependentSampleDecoderRefreshCount()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.audioIndependentSampleDecoderRefreshCount = *MEMORY[0x1E0CA25A8];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.audioIndependentSampleDecoderRefreshCount;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.audioIndependentSampleDecoderRefreshCount.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for audioIndependentSampleDecoderRefreshCount, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.audioIndependentSampleDecoderRefreshCount, a1);
}

id CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator.next()@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  int64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  id result;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;

  v2 = *v1;
  v3 = v1[1];
  v5 = v1[2];
  v4 = v1[3];
  v6 = v4;
  v7 = v1[4];
  if (v7)
  {
    v8 = (v7 - 1) & v7;
    v9 = __clz(__rbit64(v7)) | (v4 << 6);
LABEL_3:
    v10 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v9);
    *(_QWORD *)a1 = v10;
    outlined init with copy of Any(*(_QWORD *)(v2 + 56) + 32 * v9, a1 + 8);
    result = v10;
LABEL_21:
    *v1 = v2;
    v1[1] = v3;
    v1[2] = v5;
    v1[3] = v6;
    v1[4] = v8;
    return result;
  }
  v12 = v4 + 1;
  if (!__OFADD__(v4, 1))
  {
    v13 = (unint64_t)(v5 + 64) >> 6;
    if (v12 < v13)
    {
      v14 = *(_QWORD *)(v3 + 8 * v12);
      if (v14)
      {
LABEL_7:
        v8 = (v14 - 1) & v14;
        v9 = __clz(__rbit64(v14)) + (v12 << 6);
        v6 = v12;
        goto LABEL_3;
      }
      v6 = v4 + 1;
      if (v4 + 2 < v13)
      {
        v14 = *(_QWORD *)(v3 + 8 * (v4 + 2));
        if (v14)
        {
          v12 = v4 + 2;
          goto LABEL_7;
        }
        v6 = v4 + 2;
        if (v4 + 3 < v13)
        {
          v14 = *(_QWORD *)(v3 + 8 * (v4 + 3));
          if (v14)
          {
            v12 = v4 + 3;
            goto LABEL_7;
          }
          v12 = v4 + 4;
          v6 = v4 + 3;
          if (v4 + 4 < v13)
          {
            v14 = *(_QWORD *)(v3 + 8 * v12);
            if (v14)
              goto LABEL_7;
            v6 = v13 - 1;
            v15 = v4 + 5;
            while (v13 != v15)
            {
              v14 = *(_QWORD *)(v3 + 8 * v15++);
              if (v14)
              {
                v12 = v15 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
    v8 = 0;
    *(_QWORD *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

void CMSampleBufferRef.PerSampleAttachmentsDictionary.makeIterator()(_QWORD *a1@<X8>)
{
  uint64_t v1;
  CFIndex v3;
  const __CFArray *v4;
  void *ValueAtIndex;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(_QWORD *)(v1 + 8);
  v4 = CMSampleBufferGetSampleAttachmentsArray(*(CMSampleBufferRef *)v1, 0);
  if (v4)
  {
    ValueAtIndex = (void *)CFArrayGetValueAtIndex(v4, v3);
    if (ValueAtIndex)
    {
      v6 = ValueAtIndex;
      lazy protocol witness table accessor for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key();
      v6;
      static Dictionary._forceBridgeFromObjectiveC(_:result:)();
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    v7 = -1;
    v8 = MEMORY[0x1E0DEE9E0] + 64;
    v9 = -1 << *(_BYTE *)(MEMORY[0x1E0DEE9E0] + 32);
    if (-v9 < 64)
      v7 = ~(-1 << -(char)v9);
    v10 = v7 & *(_QWORD *)(MEMORY[0x1E0DEE9E0] + 64);
    *a1 = MEMORY[0x1E0DEE9E0];
    a1[1] = v8;
    a1[2] = ~v9;
    a1[3] = 0;
    a1[4] = v10;
  }
}

void CMSampleBufferRef.PerSampleAttachmentsDictionary.subscript.getter(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  void *v4;
  CFIndex v5;
  const __CFArray *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  void *ValueAtIndex;
  const void *Value;
  const void *v11;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  id key;

  v4 = *a1;
  v5 = *(_QWORD *)(v2 + 8);
  v6 = CMSampleBufferGetSampleAttachmentsArray(*(CMSampleBufferRef *)v2, 0);
  if (v6)
  {
    v7 = v6;
    key = v4;
    v8 = v7;
    ValueAtIndex = (void *)CFArrayGetValueAtIndex(v8, v5);
    if (ValueAtIndex)
    {
      v13 = ValueAtIndex;
      Value = CFDictionaryGetValue(v13, key);
      if (Value)
      {
        v11 = Value;
        swift_unknownObjectRetain();
        *(_QWORD *)(a2 + 24) = swift_getObjectType();

        *(_QWORD *)a2 = v11;
        v12 = (const __CFDictionary *)key;
      }
      else
      {
        *(_OWORD *)a2 = 0u;
        *(_OWORD *)(a2 + 16) = 0u;

        v12 = v13;
      }

    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
}

const __CFArray *key path setter for CMSampleBufferRef.PerSampleAttachmentsDictionary.subscript(_:) : CMSampleBufferRef.PerSampleAttachmentsDictionary(uint64_t a1, uint64_t a2, void **a3)
{
  void *v3;
  id v4;
  void *v6;
  _BYTE v7[32];

  v3 = *a3;
  outlined init with copy of CMAttachmentBearerAttachments.Value?(a1, (uint64_t)v7, &demangling cache variable for type metadata for Any?);
  v6 = v3;
  v4 = v3;
  return CMSampleBufferRef.PerSampleAttachmentsDictionary.subscript.setter((uint64_t)v7, &v6);
}

const __CFArray *CMSampleBufferRef.PerSampleAttachmentsDictionary.subscript.setter(uint64_t a1, void **a2)
{
  uint64_t v2;
  void *v4;
  const __CFArray *result;
  const __CFArray *v6;
  __CFDictionary *v7;
  const void *v8;
  __CFDictionary *v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v4 = *a2;
  result = CMSampleBufferGetSampleAttachmentsArray(*(CMSampleBufferRef *)v2, 1u);
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  v6 = result;
  result = (const __CFArray *)CFArrayGetValueAtIndex(result, *(_QWORD *)(v2 + 8));
  if (!result)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  v7 = result;
  outlined init with copy of CMAttachmentBearerAttachments.Value?(a1, (uint64_t)&v10, &demangling cache variable for type metadata for Any?);
  if (v11)
  {
    outlined init with take of Any(&v10, &v12);
    __swift_project_boxed_opaque_existential_1(&v12, v13);
    v8 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
    CFDictionarySetValue(v7, v4, v8);

    swift_unknownObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v12);
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v10, &demangling cache variable for type metadata for Any?);
    v9 = v7;
    CFDictionaryRemoveValue(v9, v4);

  }
  return (const __CFArray *)outlined destroy of Any?(a1, &demangling cache variable for type metadata for Any?);
}

void (*CMSampleBufferRef.PerSampleAttachmentsDictionary.subscript.modify(_QWORD *a1, void **a2))(uint64_t *a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  void *v10[3];

  v5 = malloc(0x50uLL);
  *a1 = v5;
  v6 = *a2;
  v5[8] = v2;
  v5[9] = v6;
  v7 = *(void **)(v2 + 8);
  v10[1] = *(void **)v2;
  v10[2] = v7;
  v10[0] = v6;
  v8 = v6;
  CMSampleBufferRef.PerSampleAttachmentsDictionary.subscript.getter(v10, (uint64_t)v5);
  return CMSampleBufferRef.PerSampleAttachmentsDictionary.subscript.modify;
}

void CMSampleBufferRef.PerSampleAttachmentsDictionary.subscript.modify(uint64_t *a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;

  v2 = (_QWORD *)*a1;
  if ((a2 & 1) != 0)
  {
    v3 = (void *)v2[9];
    outlined init with copy of CMAttachmentBearerAttachments.Value?(*a1, (uint64_t)(v2 + 4), &demangling cache variable for type metadata for Any?);
    v4 = v3;
    CMSampleBufferRef.PerSampleAttachmentsDictionary.subscript.setter((uint64_t)(v2 + 4), &v4);
    outlined destroy of Any?((uint64_t)v2, &demangling cache variable for type metadata for Any?);
  }
  else
  {
    v4 = (void *)v2[9];
    CMSampleBufferRef.PerSampleAttachmentsDictionary.subscript.setter((uint64_t)v2, &v4);
  }
  free(v2);
}

void protocol witness for Sequence.makeIterator() in conformance CMSampleBufferRef.PerSampleAttachmentsDictionary(_QWORD *a1@<X8>)
{
  id *v1;

  CMSampleBufferRef.PerSampleAttachmentsDictionary.makeIterator()(a1);

}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance CMSampleBufferRef.PerSampleAttachmentsDictionary()
{
  return 0;
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance CMSampleBufferRef.PerSampleAttachmentsDictionary()
{
  return 2;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance CMSampleBufferRef.PerSampleAttachmentsDictionary()
{
  uint64_t *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (void *)*v0;
  specialized _copySequenceToContiguousArray<A>(_:)(*v0, v0[1]);
  v3 = v2;

  return v3;
}

void protocol witness for Sequence._copyContents(initializing:) in conformance CMSampleBufferRef.PerSampleAttachmentsDictionary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *(void **)v3, *(_QWORD *)(v3 + 8));
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance CMSampleBufferRef.PerSampleAttachmentsDictionary()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

Swift::Int __swiftcall CMSampleBufferRef.SampleAttachmentsArray.index(after:)(Swift::Int after)
{
  BOOL v1;
  Swift::Int result;

  v1 = __OFADD__(after, 1);
  result = after + 1;
  if (v1)
    __break(1u);
  return result;
}

uint64_t CMSampleBufferRef.SampleAttachmentsArray.startIndex.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t CMSampleBufferRef.SampleAttachmentsArray.startIndex.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*CMSampleBufferRef.SampleAttachmentsArray.startIndex.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

uint64_t CMSampleBufferRef.SampleAttachmentsArray.endIndex.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t CMSampleBufferRef.SampleAttachmentsArray.endIndex.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t (*CMSampleBufferRef.SampleAttachmentsArray.endIndex.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

id CMSampleBufferRef.SampleAttachmentsArray.subscript.getter@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  void **v2;
  void *v3;

  v3 = *v2;
  *a2 = *v2;
  a2[1] = a1;
  return v3;
}

void (*CMSampleBufferRef.SampleAttachmentsArray.subscript.modify(void **a1, void *a2))(id *a1)
{
  void **v2;
  void *v3;
  id v4;

  v3 = *v2;
  *a1 = *v2;
  a1[1] = a2;
  v4 = v3;
  return destroy for CMTaggedBuffer.Buffer;
}

void CMSampleBufferRef.SampleAttachmentsArray.subscript.setter(id *a1)
{

}

void protocol witness for Collection.startIndex.getter in conformance CMSampleBufferRef.SampleAttachmentsArray(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 8);
}

void protocol witness for Collection.endIndex.getter in conformance CMSampleBufferRef.SampleAttachmentsArray(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 16);
}

void (*protocol witness for Collection.subscript.read in conformance CMSampleBufferRef.SampleAttachmentsArray(void **a1, void **a2))(id *a1)
{
  void **v2;
  void *v3;
  void *v4;
  id v5;

  v3 = *a2;
  v4 = *v2;
  *a1 = *v2;
  a1[1] = v3;
  v5 = v4;
  return destroy for CMTaggedBuffer.Buffer;
}

uint64_t *protocol witness for Collection.subscript.getter in conformance CMSampleBufferRef.SampleAttachmentsArray@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = *(_QWORD *)(v2 + 8);
  v4 = *(_QWORD *)(v2 + 16);
  if (v4 < v3)
  {
    __break(1u);
    goto LABEL_6;
  }
  v5 = *result;
  if (*result < v3)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v6 = result[1];
  if (v4 >= v6)
  {
    v7 = *(void **)v2;
    a2[2] = *(_QWORD *)v2;
    a2[3] = v3;
    a2[4] = v4;
    *a2 = v5;
    a2[1] = v6;
    return (uint64_t *)v7;
  }
LABEL_7:
  __break(1u);
  return result;
}

id protocol witness for Collection.indices.getter in conformance CMSampleBufferRef.SampleAttachmentsArray@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)v1;
  v3 = *(_QWORD *)(v1 + 8);
  v4 = *(_QWORD *)(v1 + 16);
  *a1 = *(_QWORD *)v1;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v3;
  a1[4] = v4;
  return v2;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance CMSampleBufferRef.SampleAttachmentsArray()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8) == *(_QWORD *)(v0 + 16);
}

void protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance CMSampleBufferRef.SampleAttachmentsArray(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t *protocol witness for Collection.index(_:offsetBy:) in conformance CMSampleBufferRef.SampleAttachmentsArray@<X0>(uint64_t *result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if ((a2 & 0x8000000000000000) == 0)
  {
    v3 = *result;
    if (!a2)
    {
LABEL_6:
      *a3 = v3;
      return result;
    }
    v4 = v3 ^ 0x7FFFFFFFFFFFFFFFLL;
    v5 = a2 - 1;
    while (v4 > v5)
    {
      ++v3;
      if (!--a2)
        goto LABEL_6;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.index(_:offsetBy:limitedBy:) in conformance CMSampleBufferRef.SampleAttachmentsArray@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;
  char v6;

  result = specialized Collection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v6 & 1;
  return result;
}

uint64_t *protocol witness for Collection.distance(from:to:) in conformance CMSampleBufferRef.SampleAttachmentsArray(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;

  v2 = *result;
  v3 = *a2;
  if (*a2 < *result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (*a2 == *result)
    return 0;
  v4 = (uint64_t *)(v3 - v2);
  if (v3 > v2)
  {
    result = 0;
    v5 = v3 + ~v2;
    while (v5 <= 0x7FFFFFFFFFFFFFFELL)
    {
      result = (uint64_t *)((char *)result + 1);
      if (v4 == result)
        return result;
    }
    __break(1u);
    goto LABEL_10;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance CMSampleBufferRef.SampleAttachmentsArray(uint64_t *result, uint64_t *a2)
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

_QWORD *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance CMSampleBufferRef.SampleAttachmentsArray(_QWORD *result, _QWORD *a2)
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

_QWORD *protocol witness for Collection.index(after:) in conformance CMSampleBufferRef.SampleAttachmentsArray@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  if (__OFADD__(*result, 1))
    __break(1u);
  else
    *a2 = *result + 1;
  return result;
}

_QWORD *protocol witness for Collection.formIndex(after:) in conformance CMSampleBufferRef.SampleAttachmentsArray(_QWORD *result)
{
  if (__OFADD__(*result, 1))
    __break(1u);
  else
    ++*result;
  return result;
}

__n128 protocol witness for Sequence.makeIterator() in conformance CMSampleBufferRef.SampleAttachmentsArray@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __n128 result;

  *(_QWORD *)a1 = *(_QWORD *)v1;
  result = *(__n128 *)(v1 + 8);
  *(__n128 *)(a1 + 8) = result;
  *(_QWORD *)(a1 + 24) = result.n128_u64[0];
  return result;
}

void protocol witness for Collection.count.getter in conformance CMSampleBufferRef.SampleAttachmentsArray()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 16);
  if (v2 < v1)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v2 == v1)
    return;
  v3 = v2 - v1;
  if (v2 > v1)
  {
    v4 = 0;
    v5 = v2 + ~v1;
    while (v5 <= 0x7FFFFFFFFFFFFFFELL)
    {
      if (v3 == ++v4)
        return;
    }
    __break(1u);
    goto LABEL_9;
  }
LABEL_10:
  __break(1u);
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance CMSampleBufferRef.SampleAttachmentsArray()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)v0;
  specialized _copyCollectionToContiguousArray<A>(_:)(*(void **)v0, *(_QWORD *)(v0 + 8), *(_QWORD *)(v0 + 16));
  v3 = v2;

  return v3;
}

_QWORD *protocol witness for Sequence._copyContents(initializing:) in conformance CMSampleBufferRef.SampleAttachmentsArray(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;

  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *(void **)v3, *(_QWORD *)(v3 + 8), *(_QWORD *)(v3 + 16));
}

CMItemCount CMSampleBufferRef.sampleAttachments.getter@<X0>(opaqueCMSampleBuffer **a1@<X8>)
{
  void *v1;
  opaqueCMSampleBuffer *v3;
  CMItemCount result;

  v3 = v1;
  result = CMSampleBufferGetNumSamples(v3);
  *a1 = v3;
  a1[1] = 0;
  a1[2] = (opaqueCMSampleBuffer *)result;
  return result;
}

void (*CMSampleBufferRef.sampleAttachments.modify(opaqueCMSampleBuffer **a1))(id *a1)
{
  void *v1;
  opaqueCMSampleBuffer *v3;
  CMItemCount NumSamples;

  v3 = v1;
  NumSamples = CMSampleBufferGetNumSamples(v3);
  *a1 = v3;
  a1[1] = 0;
  a1[2] = (opaqueCMSampleBuffer *)NumSamples;
  return destroy for CMTaggedBuffer.Buffer;
}

void CMSampleBufferRef.sampleAttachments.setter(id *a1)
{
  void *v1;
  opaqueCMSampleBuffer *v3;

  v3 = v1;
  CMSampleBufferGetNumSamples(v3);

}

CMSampleBufferRef_optional __swiftcall CMSampleBufferRef.SingleSampleBuffers.Iterator.next()()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v2;
  CMSampleBufferRef_optional result;
  uint64_t v4;
  unint64_t v5;

  v2 = *v0;
  v1 = v0[1];
  if ((unint64_t)*v0 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = _CocoaArrayWrapper.endIndex.getter();
    result.value = (CMSampleBufferRef)swift_bridgeObjectRelease();
    if (v1 == v4)
      return 0;
  }
  else if (v1 == *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    return 0;
  }
  if ((v2 & 0xC000000000000001) != 0)
  {
    result.value = (CMSampleBufferRef)MEMORY[0x1BCCB998C](v1, v2);
    v5 = v1 + 1;
    if (!__OFADD__(v1, 1))
      goto LABEL_9;
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if ((v1 & 0x8000000000000000) != 0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v1 < *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    result.value = (CMSampleBufferRef)*(id *)(v2 + 8 * v1 + 32);
    v5 = v1 + 1;
    if (!__OFADD__(v1, 1))
    {
LABEL_9:
      v0[1] = v5;
      return result;
    }
    goto LABEL_12;
  }
LABEL_14:
  __break(1u);
  return result;
}

CMSampleBufferRef_optional protocol witness for IteratorProtocol.next() in conformance CMSampleBufferRef.SingleSampleBuffers.Iterator@<X0>(CMSampleBufferRef_optional *a1@<X8>)
{
  CMSampleBufferRef_optional result;

  result.value = CMSampleBufferRef.SingleSampleBuffers.Iterator.next()().value;
  a1->value = result.value;
  return result;
}

uint64_t CMSampleBufferRef.SingleSampleBuffers.makeIterator()@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = 0;
  return swift_bridgeObjectRetain();
}

void protocol witness for Sequence.makeIterator() in conformance CMSampleBufferRef.SingleSampleBuffers(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = 0;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance CMSampleBufferRef.SingleSampleBuffers()
{
  unint64_t *v0;
  uint64_t v1;

  v1 = specialized _copySequenceToContiguousArray<A>(_:)(*v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance CMSampleBufferRef.SingleSampleBuffers(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  unint64_t *v3;

  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t CMSampleBufferRef.singleSampleBuffers()@<X0>(_QWORD *a1@<X8>)
{
  opaqueCMSampleBuffer *v1;
  opaqueCMSampleBuffer *v2;
  CMItemCount NumSamples;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  OSStatus v8;
  uint64_t result;
  id v10;
  _QWORD aBlock[6];
  uint64_t v12;

  v2 = v1;
  v12 = MEMORY[0x1E0DEE9D8];
  NumSamples = CMSampleBufferGetNumSamples(v1);
  specialized Array._reserveCapacityImpl(minimumCapacity:growForAppend:)(NumSamples, 0);
  specialized Array._endMutation()();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = &v12;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = partial apply for closure #1 in closure #1 in CMSampleBufferRef.singleSampleBuffers();
  *(_QWORD *)(v6 + 24) = v5;
  aBlock[4] = partial apply for thunk for @callee_guaranteed (@guaranteed CMSampleBufferRef, @unowned Int) -> (@unowned Int32);
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed CMSampleBufferRef, @unowned Int) -> (@unowned Int32);
  aBlock[3] = &block_descriptor_18;
  v7 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v8 = CMSampleBufferCallBlockForEachSample(v2, v7);
  _Block_release(v7);
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v7 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    result = noErr.getter();
    if (v8 == (_DWORD)result)
    {
      *a1 = v12;
    }
    else
    {
      v10 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
      objc_msgSend(v10, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v8, 0);
      swift_willThrow();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t closure #1 in closure #1 in CMSampleBufferRef.singleSampleBuffers()(void *a1, uint64_t a2, _QWORD *a3)
{
  id v4;

  v4 = a1;
  MEMORY[0x1BCCB986C]();
  if (*(_QWORD *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  return noErr.getter();
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed CMSampleBufferRef, @unowned Int) -> (@unowned Int32)(uint64_t a1, void *a2)
{
  uint64_t (*v2)(void);
  id v3;
  uint64_t v4;

  v2 = *(uint64_t (**)(void))(a1 + 32);
  v3 = a2;
  v4 = v2();

  return v4;
}

id CMSampleBufferRef.AttachmentKey.rawValue.getter()
{
  id *v0;

  return *v0;
}

void CMSampleBufferRef.AttachmentKey.rawValue.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*CMSampleBufferRef.AttachmentKey.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

uint64_t CMSampleBufferRef.AttachmentKey.init(rawValue:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

id one-time initialization function for resetDecoderBeforeDecoding()
{
  static CMSampleBufferRef.AttachmentKey.resetDecoderBeforeDecoding = *MEMORY[0x1E0CA26D8];
  return (id)static CMSampleBufferRef.AttachmentKey.resetDecoderBeforeDecoding;
}

id static CMSampleBufferRef.AttachmentKey.resetDecoderBeforeDecoding.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for resetDecoderBeforeDecoding, (void **)&static CMSampleBufferRef.AttachmentKey.resetDecoderBeforeDecoding, a1);
}

id one-time initialization function for drainAfterDecoding()
{
  static CMSampleBufferRef.AttachmentKey.drainAfterDecoding = *MEMORY[0x1E0CA2658];
  return (id)static CMSampleBufferRef.AttachmentKey.drainAfterDecoding;
}

id static CMSampleBufferRef.AttachmentKey.drainAfterDecoding.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for drainAfterDecoding, (void **)&static CMSampleBufferRef.AttachmentKey.drainAfterDecoding, a1);
}

id one-time initialization function for postNotificationWhenConsumed()
{
  static CMSampleBufferRef.AttachmentKey.postNotificationWhenConsumed = *MEMORY[0x1E0CA26C8];
  return (id)static CMSampleBufferRef.AttachmentKey.postNotificationWhenConsumed;
}

id static CMSampleBufferRef.AttachmentKey.postNotificationWhenConsumed.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for postNotificationWhenConsumed, (void **)&static CMSampleBufferRef.AttachmentKey.postNotificationWhenConsumed, a1);
}

id one-time initialization function for resumeOutput()
{
  static CMSampleBufferRef.AttachmentKey.resumeOutput = *MEMORY[0x1E0CA26E0];
  return (id)static CMSampleBufferRef.AttachmentKey.resumeOutput;
}

id static CMSampleBufferRef.AttachmentKey.resumeOutput.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for resumeOutput, (void **)&static CMSampleBufferRef.AttachmentKey.resumeOutput, a1);
}

id one-time initialization function for transitionID()
{
  static CMSampleBufferRef.AttachmentKey.transitionID = *MEMORY[0x1E0CA2718];
  return (id)static CMSampleBufferRef.AttachmentKey.transitionID;
}

id static CMSampleBufferRef.AttachmentKey.transitionID.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for transitionID, (void **)&static CMSampleBufferRef.AttachmentKey.transitionID, a1);
}

id one-time initialization function for trimDurationAtStart()
{
  static CMSampleBufferRef.AttachmentKey.trimDurationAtStart = *MEMORY[0x1E0CA2728];
  return (id)static CMSampleBufferRef.AttachmentKey.trimDurationAtStart;
}

id static CMSampleBufferRef.AttachmentKey.trimDurationAtStart.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for trimDurationAtStart, (void **)&static CMSampleBufferRef.AttachmentKey.trimDurationAtStart, a1);
}

id one-time initialization function for trimDurationAtEnd()
{
  static CMSampleBufferRef.AttachmentKey.trimDurationAtEnd = *MEMORY[0x1E0CA2720];
  return (id)static CMSampleBufferRef.AttachmentKey.trimDurationAtEnd;
}

id static CMSampleBufferRef.AttachmentKey.trimDurationAtEnd.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for trimDurationAtEnd, (void **)&static CMSampleBufferRef.AttachmentKey.trimDurationAtEnd, a1);
}

id one-time initialization function for speedMultiplier()
{
  static CMSampleBufferRef.AttachmentKey.speedMultiplier = *MEMORY[0x1E0CA2708];
  return (id)static CMSampleBufferRef.AttachmentKey.speedMultiplier;
}

id static CMSampleBufferRef.AttachmentKey.speedMultiplier.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for speedMultiplier, (void **)&static CMSampleBufferRef.AttachmentKey.speedMultiplier, a1);
}

id one-time initialization function for reverse()
{
  static CMSampleBufferRef.AttachmentKey.reverse = *MEMORY[0x1E0CA26E8];
  return (id)static CMSampleBufferRef.AttachmentKey.reverse;
}

id static CMSampleBufferRef.AttachmentKey.reverse.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for reverse, (void **)&static CMSampleBufferRef.AttachmentKey.reverse, a1);
}

id one-time initialization function for fillDiscontinuitiesWithSilence()
{
  static CMSampleBufferRef.AttachmentKey.fillDiscontinuitiesWithSilence = *MEMORY[0x1E0CA2698];
  return (id)static CMSampleBufferRef.AttachmentKey.fillDiscontinuitiesWithSilence;
}

id static CMSampleBufferRef.AttachmentKey.fillDiscontinuitiesWithSilence.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for fillDiscontinuitiesWithSilence, (void **)&static CMSampleBufferRef.AttachmentKey.fillDiscontinuitiesWithSilence, a1);
}

id one-time initialization function for emptyMedia()
{
  static CMSampleBufferRef.AttachmentKey.emptyMedia = *MEMORY[0x1E0CA2678];
  return (id)static CMSampleBufferRef.AttachmentKey.emptyMedia;
}

id static CMSampleBufferRef.AttachmentKey.emptyMedia.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for emptyMedia, (void **)&static CMSampleBufferRef.AttachmentKey.emptyMedia, a1);
}

id one-time initialization function for permanentEmptyMedia()
{
  static CMSampleBufferRef.AttachmentKey.permanentEmptyMedia = *MEMORY[0x1E0CA26C0];
  return (id)static CMSampleBufferRef.AttachmentKey.permanentEmptyMedia;
}

id static CMSampleBufferRef.AttachmentKey.permanentEmptyMedia.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for permanentEmptyMedia, (void **)&static CMSampleBufferRef.AttachmentKey.permanentEmptyMedia, a1);
}

id one-time initialization function for displayEmptyMediaImmediately()
{
  static CMSampleBufferRef.AttachmentKey.displayEmptyMediaImmediately = *MEMORY[0x1E0CA2648];
  return (id)static CMSampleBufferRef.AttachmentKey.displayEmptyMediaImmediately;
}

id static CMSampleBufferRef.AttachmentKey.displayEmptyMediaImmediately.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for displayEmptyMediaImmediately, (void **)&static CMSampleBufferRef.AttachmentKey.displayEmptyMediaImmediately, a1);
}

id one-time initialization function for endsPreviousSampleDuration()
{
  static CMSampleBufferRef.AttachmentKey.endsPreviousSampleDuration = *MEMORY[0x1E0CA2690];
  return (id)static CMSampleBufferRef.AttachmentKey.endsPreviousSampleDuration;
}

id static CMSampleBufferRef.AttachmentKey.endsPreviousSampleDuration.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for endsPreviousSampleDuration, (void **)&static CMSampleBufferRef.AttachmentKey.endsPreviousSampleDuration, a1);
}

id one-time initialization function for sampleReferenceURL()
{
  static CMSampleBufferRef.AttachmentKey.sampleReferenceURL = *MEMORY[0x1E0CA26F8];
  return (id)static CMSampleBufferRef.AttachmentKey.sampleReferenceURL;
}

id static CMSampleBufferRef.AttachmentKey.sampleReferenceURL.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for sampleReferenceURL, (void **)&static CMSampleBufferRef.AttachmentKey.sampleReferenceURL, a1);
}

id one-time initialization function for sampleReferenceByteOffset()
{
  static CMSampleBufferRef.AttachmentKey.sampleReferenceByteOffset = *MEMORY[0x1E0CA26F0];
  return (id)static CMSampleBufferRef.AttachmentKey.sampleReferenceByteOffset;
}

id static CMSampleBufferRef.AttachmentKey.sampleReferenceByteOffset.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for sampleReferenceByteOffset, (void **)&static CMSampleBufferRef.AttachmentKey.sampleReferenceByteOffset, a1);
}

id one-time initialization function for gradualDecoderRefresh()
{
  static CMSampleBufferRef.AttachmentKey.gradualDecoderRefresh = *MEMORY[0x1E0CA26B0];
  return (id)static CMSampleBufferRef.AttachmentKey.gradualDecoderRefresh;
}

id static CMSampleBufferRef.AttachmentKey.gradualDecoderRefresh.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for gradualDecoderRefresh, (void **)&static CMSampleBufferRef.AttachmentKey.gradualDecoderRefresh, a1);
}

id one-time initialization function for droppedFrameReason()
{
  static CMSampleBufferRef.AttachmentKey.droppedFrameReason = *MEMORY[0x1E0CA2660];
  return (id)static CMSampleBufferRef.AttachmentKey.droppedFrameReason;
}

id static CMSampleBufferRef.AttachmentKey.droppedFrameReason.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for droppedFrameReason, (void **)&static CMSampleBufferRef.AttachmentKey.droppedFrameReason, a1);
}

id one-time initialization function for droppedFrameReasonInfo()
{
  static CMSampleBufferRef.AttachmentKey.droppedFrameReasonInfo = *MEMORY[0x1E0CA2668];
  return (id)static CMSampleBufferRef.AttachmentKey.droppedFrameReasonInfo;
}

id static CMSampleBufferRef.AttachmentKey.droppedFrameReasonInfo.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for droppedFrameReasonInfo, (void **)&static CMSampleBufferRef.AttachmentKey.droppedFrameReasonInfo, a1);
}

id one-time initialization function for stillImageLensStabilizationInfo()
{
  static CMSampleBufferRef.AttachmentKey.stillImageLensStabilizationInfo = *MEMORY[0x1E0CA2710];
  return (id)static CMSampleBufferRef.AttachmentKey.stillImageLensStabilizationInfo;
}

id static CMSampleBufferRef.AttachmentKey.stillImageLensStabilizationInfo.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for stillImageLensStabilizationInfo, (void **)&static CMSampleBufferRef.AttachmentKey.stillImageLensStabilizationInfo, a1);
}

id one-time initialization function for cameraIntrinsicMatrix()
{
  static CMSampleBufferRef.AttachmentKey.cameraIntrinsicMatrix = *MEMORY[0x1E0CA2638];
  return (id)static CMSampleBufferRef.AttachmentKey.cameraIntrinsicMatrix;
}

id static CMSampleBufferRef.AttachmentKey.cameraIntrinsicMatrix.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for cameraIntrinsicMatrix, (void **)&static CMSampleBufferRef.AttachmentKey.cameraIntrinsicMatrix, a1);
}

id one-time initialization function for forceKeyFrame()
{
  static CMSampleBufferRef.AttachmentKey.forceKeyFrame = *MEMORY[0x1E0CA26A8];
  return (id)static CMSampleBufferRef.AttachmentKey.forceKeyFrame;
}

id static CMSampleBufferRef.AttachmentKey.forceKeyFrame.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for forceKeyFrame, (void **)&static CMSampleBufferRef.AttachmentKey.forceKeyFrame, a1);
}

double CMAttachmentBearerAttachments.subscript.getter@<D0>(const __CFString **a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  const __CFString *v4;
  const void *v5;
  CFTypeRef v6;
  char v7;
  double result;
  CMAttachmentMode attachmentModeOut;
  __int128 v10[2];
  char v11;
  __int128 v12;
  uint64_t ObjectType;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  attachmentModeOut = 0;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  v5 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  v6 = (id)CMGetAttachment(v5, v4, &attachmentModeOut);
  swift_unknownObjectRelease();
  if (v6)
  {
    if (!attachmentModeOut)
    {
      v7 = 0;
      ObjectType = swift_getObjectType();
      *(_QWORD *)&v12 = v6;
      goto LABEL_6;
    }
    if (attachmentModeOut == 1)
    {
      ObjectType = swift_getObjectType();
      *(_QWORD *)&v12 = v6;
      v7 = 1;
LABEL_6:
      outlined init with take of Any(&v12, v10);
      v11 = v7;
      outlined init with take of CMAttachmentBearerAttachments.Value(v10, a2);
      return result;
    }
    swift_unknownObjectRelease();
  }
  result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_BYTE *)(a2 + 32) = -1;
  return result;
}

uint64_t key path setter for CMAttachmentBearerAttachments.subscript(_:) : CMAttachmentBearerAttachments(uint64_t a1, uint64_t a2, __CFString **a3)
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v6;
  _BYTE v7[40];

  v3 = *a3;
  outlined init with copy of CMAttachmentBearerAttachments.Value?(a1, (uint64_t)v7, &demangling cache variable for type metadata for CMAttachmentBearerAttachments.Value?);
  v6 = v3;
  v4 = v3;
  return CMAttachmentBearerAttachments.subscript.setter((uint64_t)v7, &v6);
}

uint64_t CMAttachmentBearerAttachments.subscript.setter(uint64_t a1, __CFString **a2)
{
  uint64_t v2;
  uint64_t v3;
  __CFString *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  const void *v11;
  const void *v12;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  const void *v19;
  uint64_t v20;
  _OWORD v21[2];
  unsigned __int8 v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  unsigned __int8 v27;
  _BYTE v28[40];

  v3 = v2;
  v5 = *a2;
  outlined init with copy of CMAttachmentBearerAttachments.Value?(a1, (uint64_t)&v25, &demangling cache variable for type metadata for CMAttachmentBearerAttachments.Value?);
  if (v27 == 255)
  {
    outlined destroy of Any?((uint64_t)&v25, &demangling cache variable for type metadata for CMAttachmentBearerAttachments.Value?);
    outlined init with copy of CMAttachmentBearerAttachments(v3, (uint64_t)&v25);
    v14 = v26;
    v15 = __swift_project_boxed_opaque_existential_1(&v25, v26);
    v16 = *(_QWORD *)(v14 - 8);
    MEMORY[0x1E0C80A78](v15);
    v18 = (char *)&v20 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v16 + 16))(v18);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
    v19 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v14);
    CMRemoveAttachment(v19, v5);
    swift_unknownObjectRelease();

    return outlined destroy of Any?(a1, &demangling cache variable for type metadata for CMAttachmentBearerAttachments.Value?);
  }
  else
  {
    outlined init with take of CMAttachmentBearerAttachments.Value(&v25, (uint64_t)v28);
    outlined init with copy of CMAttachmentBearerAttachments(v3, (uint64_t)&v25);
    v6 = v26;
    v7 = __swift_project_boxed_opaque_existential_1(&v25, v26);
    v8 = *(_QWORD *)(v6 - 8);
    MEMORY[0x1E0C80A78](v7);
    v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v8 + 16))(v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
    v11 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
    outlined init with copy of CMAttachmentBearerAttachments.Value((uint64_t)v28, (uint64_t)v21);
    outlined init with take of Any(v21, &v23);
    __swift_project_boxed_opaque_existential_1(&v23, v24);
    v12 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
    outlined init with copy of CMAttachmentBearerAttachments.Value((uint64_t)v28, (uint64_t)v21);
    LODWORD(v10) = v22;
    outlined destroy of CMAttachmentBearerAttachments.Value((uint64_t)v21);
    CMSetAttachment(v11, v5, v12, (CMAttachmentMode)v10);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    outlined destroy of Any?(a1, &demangling cache variable for type metadata for CMAttachmentBearerAttachments.Value?);
    outlined destroy of CMAttachmentBearerAttachments.Value((uint64_t)v28);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
  }
}

void (*CMAttachmentBearerAttachments.subscript.modify(_QWORD *a1, __CFString **a2))(uint64_t *a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;
  __CFString *v6;
  __CFString *v7;
  const __CFString *v9;

  v5 = malloc(0x60uLL);
  *a1 = v5;
  v6 = *a2;
  v5[10] = v2;
  v5[11] = v6;
  v9 = v6;
  v7 = v6;
  CMAttachmentBearerAttachments.subscript.getter(&v9, (uint64_t)v5);
  return CMAttachmentBearerAttachments.subscript.modify;
}

id one-time initialization function for dataBecameReady()
{
  static CMSampleBufferRef.dataBecameReady = *MEMORY[0x1E0CA27C8];
  return (id)static CMSampleBufferRef.dataBecameReady;
}

id static CMSampleBufferRef.dataBecameReady.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for dataBecameReady, (id *)&static CMSampleBufferRef.dataBecameReady);
}

id static CMSampleBufferRef.dataFailed.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for dataFailed, (id *)&static CMSampleBufferRef.dataFailed);
}

uint64_t (*CMSampleBufferRef.NotificationKey.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

id one-time initialization function for status()
{
  static CMSampleBufferRef.NotificationKey.status = *MEMORY[0x1E0CA27C0];
  return (id)static CMSampleBufferRef.NotificationKey.status;
}

id static CMSampleBufferRef.NotificationKey.status.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for status, (void **)&static CMSampleBufferRef.NotificationKey.status, a1);
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter@<X0>(_QWORD *a1@<X0>, void **a2@<X1>, void **a3@<X8>)
{
  void *v5;

  if (*a1 != -1)
    swift_once();
  v5 = *a2;
  *a3 = *a2;
  return v5;
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
  result = MEMORY[0x1BCCB9998](v7, v9, a2 & 1, v5);
  *v2 = result;
  return result;
}

uint64_t sub_1B8D13B88()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in CMSampleBufferRef.setInvalidateHandler(_:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in closure #1 in CMSampleBufferRef.setInvalidateHandler(_:)(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t lazy protocol witness table accessor for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key, &type metadata for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key, &type metadata for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key, &type metadata for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key, &type metadata for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key);
  }
  return result;
}

uint64_t sub_1B8D13C34()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in CMSampleBufferRef.singleSampleBuffers()(void *a1, uint64_t a2)
{
  uint64_t v2;

  return closure #1 in closure #1 in CMSampleBufferRef.singleSampleBuffers()(a1, a2, *(_QWORD **)(v2 + 16));
}

uint64_t sub_1B8D13C4C()
{
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed CMSampleBufferRef, @unowned Int) -> (@unowned Int32)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t outlined destroy of Any?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t lazy protocol witness table accessor for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMSampleBufferRef.Flags, &type metadata for CMSampleBufferRef.Flags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMSampleBufferRef.Flags, &type metadata for CMSampleBufferRef.Flags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMSampleBufferRef.Flags, &type metadata for CMSampleBufferRef.Flags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMSampleBufferRef.Flags, &type metadata for CMSampleBufferRef.Flags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CMSampleBufferRef.DataReadiness and conformance CMSampleBufferRef.DataReadiness()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMSampleBufferRef.DataReadiness and conformance CMSampleBufferRef.DataReadiness;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.DataReadiness and conformance CMSampleBufferRef.DataReadiness)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMSampleBufferRef.DataReadiness, &type metadata for CMSampleBufferRef.DataReadiness);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.DataReadiness and conformance CMSampleBufferRef.DataReadiness);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key, (uint64_t (*)(void))lazy protocol witness table accessor for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key, (uint64_t (*)(void))lazy protocol witness table accessor for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key);
}

unint64_t lazy protocol witness table accessor for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator, &type metadata for CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CMSampleBufferRef.SampleAttachmentsArray and conformance CMSampleBufferRef.SampleAttachmentsArray()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMSampleBufferRef.SampleAttachmentsArray and conformance CMSampleBufferRef.SampleAttachmentsArray;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.SampleAttachmentsArray and conformance CMSampleBufferRef.SampleAttachmentsArray)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMSampleBufferRef.SampleAttachmentsArray, &type metadata for CMSampleBufferRef.SampleAttachmentsArray);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.SampleAttachmentsArray and conformance CMSampleBufferRef.SampleAttachmentsArray);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Index : Comparable in CMSampleBufferRef.SampleAttachmentsArray()
{
  return MEMORY[0x1E0DEB430];
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in CMSampleBufferRef.SampleAttachmentsArray()
{
  return lazy protocol witness table accessor for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>, &demangling cache variable for type metadata for DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray>, MEMORY[0x1E0DEA228]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1BCCBA8A4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in CMSampleBufferRef.SampleAttachmentsArray()
{
  return lazy protocol witness table accessor for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<CMSampleBufferRef.SampleAttachmentsArray> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<CMSampleBufferRef.SampleAttachmentsArray>, MEMORY[0x1E0DEDE48]);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in CMSampleBufferRef.SampleAttachmentsArray()
{
  return lazy protocol witness table accessor for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type IndexingIterator<CMSampleBufferRef.SampleAttachmentsArray> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<CMSampleBufferRef.SampleAttachmentsArray>, MEMORY[0x1E0DEC908]);
}

uint64_t lazy protocol witness table accessor for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1BCCBA8B0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CMSampleBufferRef.SingleSampleBuffers.Iterator and conformance CMSampleBufferRef.SingleSampleBuffers.Iterator()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMSampleBufferRef.SingleSampleBuffers.Iterator and conformance CMSampleBufferRef.SingleSampleBuffers.Iterator;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.SingleSampleBuffers.Iterator and conformance CMSampleBufferRef.SingleSampleBuffers.Iterator)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMSampleBufferRef.SingleSampleBuffers.Iterator, &type metadata for CMSampleBufferRef.SingleSampleBuffers.Iterator);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.SingleSampleBuffers.Iterator and conformance CMSampleBufferRef.SingleSampleBuffers.Iterator);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMSampleBufferRef.AttachmentKey(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey, (uint64_t (*)(void))lazy protocol witness table accessor for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey, (uint64_t (*)(void))lazy protocol witness table accessor for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey);
}

unint64_t lazy protocol witness table accessor for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMSampleBufferRef.AttachmentKey, &type metadata for CMSampleBufferRef.AttachmentKey);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMSampleBufferRef.AttachmentKey, &type metadata for CMSampleBufferRef.AttachmentKey);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMSampleBufferRef.AttachmentKey, &type metadata for CMSampleBufferRef.AttachmentKey);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMSampleBufferRef.AttachmentKey, &type metadata for CMSampleBufferRef.AttachmentKey);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMSampleBufferRef.NotificationKey(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey, (uint64_t (*)(void))lazy protocol witness table accessor for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey, (uint64_t (*)(void))lazy protocol witness table accessor for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey);
}

uint64_t instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  uint64_t result;

  a1[1] = a4();
  a1[2] = a5();
  result = a6();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMSampleBufferRef.NotificationKey, &type metadata for CMSampleBufferRef.NotificationKey);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMSampleBufferRef.NotificationKey, &type metadata for CMSampleBufferRef.NotificationKey);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMSampleBufferRef.NotificationKey, &type metadata for CMSampleBufferRef.NotificationKey);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMSampleBufferRef.NotificationKey, &type metadata for CMSampleBufferRef.NotificationKey);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey);
  }
  return result;
}

void sub_1B8D1439C(uint64_t a1@<X0>, void **a2@<X1>, uint64_t a3@<X8>)
{
  void *v3;
  void *v4;
  void *v5[3];

  v3 = *(void **)(a1 + 8);
  v4 = *a2;
  v5[1] = *(void **)a1;
  v5[2] = v3;
  v5[0] = v4;
  CMSampleBufferRef.PerSampleAttachmentsDictionary.subscript.getter(v5, a3);
}

uint64_t sub_1B8D143DC()
{
  return 0;
}

id sub_1B8D143EC@<X0>(void **a1@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  void *v3;
  uint64_t v4;

  v3 = *a1;
  v4 = *a2;
  *a3 = v3;
  a3[1] = v4;
  return v3;
}

uint64_t sub_1B8D14400()
{
  return 0;
}

CMItemCount sub_1B8D14410@<X0>(id *a1@<X0>, opaqueCMSampleBuffer **a2@<X8>)
{
  opaqueCMSampleBuffer *v3;
  CMItemCount result;

  v3 = (opaqueCMSampleBuffer *)*a1;
  result = CMSampleBufferGetNumSamples(v3);
  *a2 = v3;
  a2[1] = 0;
  a2[2] = (opaqueCMSampleBuffer *)result;
  return result;
}

void sub_1B8D14444(id *a1, opaqueCMSampleBuffer **a2)
{
  opaqueCMSampleBuffer *v2;
  id v3;

  v2 = *a2;
  v3 = *a1;
  CMSampleBufferGetNumSamples(v2);

}

double sub_1B8D14480@<D0>(const __CFString **a1@<X1>, uint64_t a2@<X8>)
{
  const __CFString *v3;

  v3 = *a1;
  return CMAttachmentBearerAttachments.subscript.getter(&v3, a2);
}

uint64_t sub_1B8D144B8()
{
  return 0;
}

uint64_t dispatch thunk of _CMSampleBufferInitTrampoline.init(referencing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

ValueMetadata *type metadata accessor for CMSampleBufferRef.Error()
{
  return &type metadata for CMSampleBufferRef.Error;
}

ValueMetadata *type metadata accessor for CMSampleBufferRef.Flags()
{
  return &type metadata for CMSampleBufferRef.Flags;
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CMSampleBufferRef.DataReadiness(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CMSampleBufferRef.DataReadiness(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 4) = 0;
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
  *(_BYTE *)(result + 5) = v3;
  return result;
}

uint64_t getEnumTag for CMSampleBufferRef.DataReadiness(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t destructiveInjectEnumTag for CMSampleBufferRef.DataReadiness(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
    *(_BYTE *)(result + 4) = 1;
  }
  else
  {
    *(_BYTE *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for CMSampleBufferRef.DataReadiness()
{
  return &type metadata for CMSampleBufferRef.DataReadiness;
}

_QWORD *initializeBufferWithCopyOfBuffer for CMSampleBufferRef.PerSampleAttachmentsDictionary(_QWORD *a1, uint64_t a2)
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

uint64_t assignWithCopy for CMSampleBufferRef.PerSampleAttachmentsDictionary(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for CMSampleBufferRef.PerSampleAttachmentsDictionary(uint64_t a1, _QWORD *a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  return a1;
}

ValueMetadata *type metadata accessor for CMSampleBufferRef.PerSampleAttachmentsDictionary()
{
  return &type metadata for CMSampleBufferRef.PerSampleAttachmentsDictionary;
}

ValueMetadata *type metadata accessor for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key()
{
  return &type metadata for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key;
}

uint64_t destroy for CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator()
{
  return outlined consume of [CMSampleBufferRef.PerSampleAttachmentsDictionary.Key : Any].Iterator._Variant();
}

_QWORD *initializeWithCopy for CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  outlined copy of [A : B].Iterator._Variant<A, B>();
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  return a1;
}

_QWORD *assignWithCopy for CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  outlined copy of [A : B].Iterator._Variant<A, B>();
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  outlined consume of [CMSampleBufferRef.PerSampleAttachmentsDictionary.Key : Any].Iterator._Variant();
  return a1;
}

uint64_t assignWithTake for CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = v3;
  outlined consume of [CMSampleBufferRef.PerSampleAttachmentsDictionary.Key : Any].Iterator._Variant();
  return a1;
}

uint64_t getEnumTagSinglePayload for CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7F && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 127);
  v3 = (((*(_QWORD *)a1 >> 57) >> 6) | (2 * ((*(_QWORD *)a1 >> 57) & 0x38 | *(_QWORD *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7E)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7E)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 127;
    if (a3 >= 0x7F)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7F)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
    {
      v3 = (-a2 >> 1) & 0x3F | ((-a2 & 0x7F) << 6);
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
      *(_OWORD *)(result + 8) = 0u;
      *(_OWORD *)(result + 24) = 0u;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator()
{
  return &type metadata for CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator;
}

uint64_t initializeBufferWithCopyOfBuffer for CMSampleBufferRef.SampleAttachmentsArray(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v4 = v3;
  return a1;
}

uint64_t assignWithCopy for CMSampleBufferRef.SampleAttachmentsArray(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
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

uint64_t assignWithTake for CMSampleBufferRef.SampleAttachmentsArray(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for CMSampleBufferRef.SampleAttachmentsArray(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CMSampleBufferRef.SampleAttachmentsArray(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CMSampleBufferRef.SampleAttachmentsArray()
{
  return &type metadata for CMSampleBufferRef.SampleAttachmentsArray;
}

ValueMetadata *type metadata accessor for CMSampleBufferRef.SingleSampleBuffers()
{
  return &type metadata for CMSampleBufferRef.SingleSampleBuffers;
}

_QWORD *initializeBufferWithCopyOfBuffer for CMSampleBufferRef.SingleSampleBuffers.Iterator(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for CMSampleBufferRef.SingleSampleBuffers.Iterator()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for CMSampleBufferRef.SingleSampleBuffers.Iterator(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

_QWORD *assignWithTake for CMSampleBufferRef.SingleSampleBuffers.Iterator(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for CMSampleBufferRef.PerSampleAttachmentsDictionary(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CMSampleBufferRef.PerSampleAttachmentsDictionary(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CMSampleBufferRef.SingleSampleBuffers.Iterator()
{
  return &type metadata for CMSampleBufferRef.SingleSampleBuffers.Iterator;
}

ValueMetadata *type metadata accessor for CMSampleBufferRef.AttachmentKey()
{
  return &type metadata for CMSampleBufferRef.AttachmentKey;
}

ValueMetadata *type metadata accessor for CMSampleBufferRef.NotificationKey()
{
  return &type metadata for CMSampleBufferRef.NotificationKey;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CMTagCategory()
{
  unsigned int *v0;

  return specialized _CMFormatDescriptionFourCCConvertible.description.getter(*v0);
}

NSNumber protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance CMTagCategory()
{
  return UInt32._bridgeToObjectiveC()();
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance CMTagCategory(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int v4;
  char v5;

  v4 = 0;
  v5 = 1;
  result = MEMORY[0x1BCCB9BF0](a1, &v4);
  if ((v5 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    *(_DWORD *)a2 = v4;
    *(_BYTE *)(a2 + 4) = 0;
  }
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance CMTagCategory()
{
  uint64_t result;

  result = static UInt32._conditionallyBridgeFromObjectiveC(_:result:)();
  if ((result & 1) == 0)
    return result & 1;
  __break(1u);
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance CMTagCategory@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result;

  result = static UInt32._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  return result;
}

uint64_t CMTag.rawCategory.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 16);
}

void CMTag.rawTagValue.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 32);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 24);
  *(_BYTE *)(a1 + 8) = v2;
}

uint64_t CMTag.__allocating_init(rawCategory:rawTagValue:)(int a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v5;
  char v6;

  result = swift_allocObject();
  v5 = *a2;
  v6 = *((_BYTE *)a2 + 8);
  *(_DWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = v5;
  *(_BYTE *)(result + 32) = v6;
  return result;
}

uint64_t CMTag.init(rawCategory:rawTagValue:)(int a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v3 = *a2;
  v4 = *((_BYTE *)a2 + 8);
  *(_DWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  *(_BYTE *)(v2 + 32) = v4;
  return v2;
}

uint64_t CMTag.value<A>(onlyIfMatching:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t *);
  char v5;
  uint64_t v7;
  char v8;

  if (*(_DWORD *)(v3 + 16) != *(_DWORD *)(a1 + 32))
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(a3, 1, 1, a2);
  v4 = *(uint64_t (**)(uint64_t *))a1;
  v5 = *(_BYTE *)(v3 + 32);
  v7 = *(_QWORD *)(v3 + 24);
  v8 = v5;
  return v4(&v7);
}

uint64_t CMTypedTag.Category.value(for:)(uint64_t *a1)
{
  uint64_t (**v1)(uint64_t *);
  char v2;
  uint64_t (*v3)(uint64_t *);
  uint64_t v5;
  char v6;

  v2 = *((_BYTE *)a1 + 8);
  v3 = *v1;
  v5 = *a1;
  v6 = v2;
  return v3(&v5);
}

void CMTag.description.getter()
{
  __asm { BR              X10 }
}

uint64_t sub_1B8D14E30(CMTagCategory a1, int64_t a2)
{
  const __CFAllocator *v2;
  CFStringRef v3;
  __CFString *v4;
  CMTag v6;

  v6 = CMTagMakeWithSInt64Value(a1, a2);
  v3 = CMTagCopyDescription(v2, v6);
  if (v3)
  {
    v4 = (__CFString *)v3;
    static String._conditionallyBridgeFromObjectiveC(_:result:)();

  }
  return 0x2064696C61766E49;
}

uint64_t CMTag.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t CMTag.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void protocol witness for static Equatable.== infix(_:_:) in conformance CMTag(uint64_t *a1)
{
  specialized static CMTag.== infix(_:_:)(*a1);
}

void protocol witness for CustomStringConvertible.description.getter in conformance CMTag()
{
  CMTag.description.getter();
}

uint64_t CMTypedTag.Category.rawCategory.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 32);
}

uint64_t CMTypedTag.Category.tagValue(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t CMTypedTag.Category.init(rawCategory:valueForTagValue:tagValueForValue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(_QWORD *)a6 = a2;
  *(_QWORD *)(a6 + 8) = a3;
  *(_QWORD *)(a6 + 16) = a4;
  *(_QWORD *)(a6 + 24) = a5;
  *(_DWORD *)(a6 + 32) = result;
  return result;
}

uint64_t CMTypedTag.category.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  v2 = *(_QWORD *)(v1 + 64);
  v3 = *(_DWORD *)(v1 + 72);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 40);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 48);
  *(_QWORD *)(a1 + 24) = v2;
  *(_DWORD *)(a1 + 32) = v3;
  swift_retain();
  return swift_retain();
}

uint64_t CMTypedTag.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(uint64_t *);
  char v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  char v13;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 128);
  v4 = type metadata accessor for Optional();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v12 - v6;
  v8 = *(void (**)(uint64_t *))(v1 + 40);
  v9 = *(_BYTE *)(v1 + 32);
  v12 = *(_QWORD *)(v1 + 24);
  v13 = v9;
  v8(&v12);
  v10 = *(_QWORD *)(v3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v3) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a1, v7, v3);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t CMTypedTag.__allocating_init(category:value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;

  v6 = specialized CMTypedTag.__allocating_init(category:value:)(a1, a2, a3, a4);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v4 + 128) - 8) + 8))(a2);
  return v6;
}

uint64_t CMTypedTag.init(category:value:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = specialized CMTypedTag.init(category:value:)(a1, a2);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v4 + 128) - 8) + 8))(a2);
  return v5;
}

void CMTypedTag.__allocating_init(rawCategory:rawTagValue:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void CMTypedTag.init(rawCategory:rawTagValue:)()
{
  specialized CMTypedTag.init(rawCategory:rawTagValue:)();
}

uint64_t CMTypedTag.__ivar_destroyer()
{
  swift_release();
  return swift_release();
}

uint64_t CMTypedTag.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return v0;
}

uint64_t CMTypedTag.__deallocating_deinit()
{
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

void static CMTypedTag.Category.mediaType.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 1835297121;
}

void static CMTypedTag.Category.mediaSubType.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 1836283234;
}

void static CMTypedTag.Category.trackID.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 1953653099;
}

void static CMTypedTag.Category.channelID.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 1986226286;
}

void static CMTypedTag.Category.videoLayerID.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 1986814329;
}

void static CMTypedTag.Category.pixelFormat.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 1885960294;
}

void static CMTypedTag.Category.packingType.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 1885430635;
}

void static CMTypedTag.Category.projectionType.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 1886547818;
}

void static CMTypedTag.Category.stereoView.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 1702454643;
}

void static CMTypedTag.Category.stereoViewInterpretation.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 1702455664;
}

uint64_t static CMTag.mediaType(_:)(unsigned int *a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMTypedTag<CMFormatDescriptionRef.MediaType>);
  result = swift_allocObject();
  *(_QWORD *)(result + 40) = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)(result + 56) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(result + 64) = 0;
  *(_DWORD *)(result + 72) = 1835297121;
  *(_DWORD *)(result + 16) = 1835297121;
  *(_QWORD *)(result + 24) = v1;
  *(_BYTE *)(result + 32) = 2;
  return result;
}

uint64_t static CMTag.mediaSubType(_:)(unsigned int *a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMTypedTag<CMFormatDescriptionRef.MediaSubType>);
  result = swift_allocObject();
  *(_QWORD *)(result + 40) = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)(result + 56) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(result + 64) = 0;
  *(_DWORD *)(result + 72) = 1836283234;
  *(_DWORD *)(result + 16) = 1836283234;
  *(_QWORD *)(result + 24) = v1;
  *(_BYTE *)(result + 32) = 2;
  return result;
}

uint64_t static CMTag.trackID(_:)(int a1)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMTypedTag<Int32>);
  result = swift_allocObject();
  *(_QWORD *)(result + 40) = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)(result + 56) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(result + 64) = 0;
  *(_DWORD *)(result + 72) = 1953653099;
  *(_DWORD *)(result + 16) = 1953653099;
  *(_QWORD *)(result + 24) = a1;
  *(_BYTE *)(result + 32) = 0;
  return result;
}

uint64_t static CMTag.channelID(_:)(uint64_t a1)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMTypedTag<Int64>);
  result = swift_allocObject();
  *(_QWORD *)(result + 40) = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)(result + 56) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(result + 64) = 0;
  *(_DWORD *)(result + 72) = 1986226286;
  *(_DWORD *)(result + 16) = 1986226286;
  *(_QWORD *)(result + 24) = a1;
  *(_BYTE *)(result + 32) = 0;
  return result;
}

uint64_t static CMTag.videoLayerID(_:)(uint64_t a1)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMTypedTag<Int64>);
  result = swift_allocObject();
  *(_QWORD *)(result + 40) = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)(result + 56) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(result + 64) = 0;
  *(_DWORD *)(result + 72) = 1986814329;
  *(_DWORD *)(result + 16) = 1986814329;
  *(_QWORD *)(result + 24) = a1;
  *(_BYTE *)(result + 32) = 0;
  return result;
}

uint64_t static CMTag.pixelFormat(_:)(unsigned int a1)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMTypedTag<UInt32>);
  result = swift_allocObject();
  *(_QWORD *)(result + 40) = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)(result + 56) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(result + 64) = 0;
  *(_DWORD *)(result + 72) = 1885960294;
  *(_DWORD *)(result + 16) = 1885960294;
  *(_QWORD *)(result + 24) = a1;
  *(_BYTE *)(result + 32) = 2;
  return result;
}

uint64_t static CMTag.packingType(_:)(unint64_t a1)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMTypedTag<CMPackingType>);
  result = swift_allocObject();
  *(_QWORD *)(result + 40) = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)(result + 56) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(result + 64) = 0;
  *(_DWORD *)(result + 72) = 1885430635;
  if (HIDWORD(a1))
  {
    __break(1u);
  }
  else
  {
    *(_DWORD *)(result + 16) = 1885430635;
    *(_QWORD *)(result + 24) = a1;
    *(_BYTE *)(result + 32) = 2;
  }
  return result;
}

uint64_t static CMTag.projectionType(_:)(unint64_t a1)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMTypedTag<CMProjectionType>);
  result = swift_allocObject();
  *(_QWORD *)(result + 40) = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)(result + 56) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(result + 64) = 0;
  *(_DWORD *)(result + 72) = 1886547818;
  if (HIDWORD(a1))
  {
    __break(1u);
  }
  else
  {
    *(_DWORD *)(result + 16) = 1886547818;
    *(_QWORD *)(result + 24) = a1;
    *(_BYTE *)(result + 32) = 2;
  }
  return result;
}

uint64_t static CMTag.stereoView(_:)(uint64_t a1)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMTypedTag<CMStereoViewComponents>);
  result = swift_allocObject();
  *(_QWORD *)(result + 40) = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)(result + 56) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(result + 64) = 0;
  *(_DWORD *)(result + 72) = 1702454643;
  *(_DWORD *)(result + 16) = 1702454643;
  *(_QWORD *)(result + 24) = a1;
  *(_BYTE *)(result + 32) = 3;
  return result;
}

uint64_t static CMTag.stereoViewInterpretation(_:)(uint64_t a1)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMTypedTag<CMStereoViewInterpretationOptions>);
  result = swift_allocObject();
  *(_QWORD *)(result + 40) = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)(result + 56) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(_QWORD *)(result + 64) = 0;
  *(_DWORD *)(result + 72) = 1702455664;
  *(_DWORD *)(result + 16) = 1702455664;
  *(_QWORD *)(result + 24) = a1;
  *(_BYTE *)(result + 32) = 3;
  return result;
}

unsigned int *closure #2 in CMTypedTag.Category<>.init(rawCategory:)@<X0>(unsigned int *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 2;
  return result;
}

uint64_t closure #1 in CMTypedTag.Category<>.init(rawCategory:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;

  v2 = *(unsigned __int8 *)(result + 8);
  if (*(_BYTE *)(result + 8))
  {
    LODWORD(v3) = 0;
LABEL_5:
    *(_DWORD *)a2 = v3;
    *(_BYTE *)(a2 + 4) = v2 != 0;
    return result;
  }
  v3 = *(_QWORD *)result;
  if (*(_QWORD *)result < (int64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v3 <= 0x7FFFFFFF)
  {
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

int *closure #2 in CMTypedTag.Category<>.init(rawCategory:)@<X0>(int *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

unsigned int *closure #1 in CMTypedTag.Category<>.init(rawCategory:)@<X0>(unsigned int *result@<X0>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;

  v2 = *((unsigned __int8 *)result + 8);
  if (v2 == 2)
    v3 = *result;
  else
    v3 = 0;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v2 != 2;
  return result;
}

_QWORD *closure #2 in CMTypedTag.Category<>.init(rawCategory:)@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  if (HIDWORD(*result))
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)a2 = *result;
    *(_BYTE *)(a2 + 8) = 2;
  }
  return result;
}

{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 3;
  return result;
}

{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t *closure #1 in CMTypedTag.Category<>.init(rawCategory:)@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;

  v2 = *((unsigned __int8 *)result + 8);
  if (v2 == 3)
    v3 = *result;
  else
    v3 = 0;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v2 != 3;
  return result;
}

{
  int v2;
  uint64_t v3;

  v2 = *((unsigned __int8 *)result + 8);
  if (*((_BYTE *)result + 8))
    v3 = 0;
  else
    v3 = *result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v2 != 0;
  return result;
}

int *closure #1 in CMTypedTag.Category<>.init(rawCategory:)@<X0>(int *result@<X0>, uint64_t a2@<X8>)
{
  int v2;
  int v3;

  v2 = *((unsigned __int8 *)result + 8);
  if (v2 == 2)
    v3 = *result;
  else
    v3 = 0;
  *(_DWORD *)a2 = v3;
  *(_BYTE *)(a2 + 4) = v2 != 2;
  return result;
}

uint64_t Sequence<>.filter<A>(matchingCategory:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[8];
  _OWORD v18[2];
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  _OWORD v25[2];
  int v26;

  v7 = *(_OWORD *)(a1 + 16);
  v18[0] = *(_OWORD *)a1;
  v18[1] = v7;
  v19 = *(_DWORD *)(a1 + 32);
  v8 = *(_OWORD *)(a1 + 16);
  v25[0] = *(_OWORD *)a1;
  v25[1] = v8;
  v26 = *(_DWORD *)(a1 + 32);
  v21 = a2;
  v22 = a3;
  v23 = a4;
  v24 = v25;
  v20 = Sequence.compactMap<A>(_:)();
  v17[2] = a2;
  v17[3] = a3;
  v17[4] = a4;
  v17[5] = v18;
  v9 = type metadata accessor for Array();
  v12 = type metadata accessor for CMTypedTag(0, a3, v10, v11);
  v13 = MEMORY[0x1BCCBA8B0](MEMORY[0x1E0DEAF50], v9);
  v15 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in Sequence<>.filter<A>(matchingCategory:), (uint64_t)v17, v9, v12, MEMORY[0x1E0DEDCE8], v13, MEMORY[0x1E0DEDD18], v14);
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  Swift::Int v24;
  uint64_t result;
  Swift::Int v26;
  void (*v27)(char *, _QWORD);
  void (*v28)(char *);
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
  uint64_t v40;
  void (*v41)(char *, char *);
  uint64_t v42;
  char *v43;
  Swift::Int v44;
  uint64_t v45;
  char v46[32];
  uint64_t v47;

  v33 = a5;
  v34 = a8;
  v41 = a1;
  v42 = a2;
  v32 = *(_QWORD *)(a5 - 8);
  MEMORY[0x1E0C80A78](a1);
  v43 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v12 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v13 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v15 = (char *)&v32 - v14;
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = swift_getAssociatedTypeWitness();
  v35 = *(_QWORD *)(v18 - 8);
  v36 = v18;
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v32 - v19;
  v21 = dispatch thunk of Collection.count.getter();
  if (!v21)
    return static Array._allocateUninitialized(_:)();
  v39 = AssociatedTypeWitness;
  v22 = v8;
  v23 = a4;
  v24 = v21;
  v47 = MEMORY[0x1BCCB99F8](v23);
  v37 = type metadata accessor for ContiguousArray();
  ContiguousArray.reserveCapacity(_:)(v24);
  v40 = v22;
  result = dispatch thunk of Collection.startIndex.getter();
  if ((v24 & 0x8000000000000000) == 0)
  {
    v26 = v24;
    v38 = v17;
    while (v26)
    {
      v44 = v26;
      v27 = (void (*)(char *, _QWORD))dispatch thunk of Collection.subscript.read();
      v28 = *(void (**)(char *))(v12 + 16);
      v29 = v12;
      v30 = v39;
      v28(v15);
      v27(v46, 0);
      v31 = v45;
      v41(v15, v43);
      if (v31)
      {
        (*(void (**)(char *, uint64_t))(v29 + 8))(v15, v30);
        (*(void (**)(char *, uint64_t))(v35 + 8))(v20, v36);
        swift_release();
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v32 + 32))(v34, v43, v33);
      }
      v45 = 0;
      (*(void (**)(char *, uint64_t))(v29 + 8))(v15, v30);
      ContiguousArray.append(_:)();
      result = dispatch thunk of Collection.formIndex(after:)();
      v26 = v44 - 1;
      v12 = v29;
      if (v44 == 1)
      {
        (*(void (**)(char *, uint64_t))(v35 + 8))(v20, v36);
        return v47;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t Sequence<>.firstValue<A>(matchingCategory:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[8];
  _OWORD v19[2];
  int v20;

  v8 = type metadata accessor for LazySequence();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v18 - v10;
  v12 = *(_DWORD *)(a1 + 32);
  MEMORY[0x1BCCB9848](a2, a4);
  v13 = MEMORY[0x1BCCBA8B0](MEMORY[0x1E0DEC320], v8);
  v14 = *(_OWORD *)(a1 + 16);
  v19[0] = *(_OWORD *)a1;
  v19[1] = v14;
  v20 = v12;
  v18[2] = v8;
  v18[3] = a3;
  v18[4] = v13;
  v18[5] = v19;
  v15 = Sequence.compactMap<A>(_:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v18[0] = v15;
  v16 = type metadata accessor for Array();
  MEMORY[0x1BCCBA8B0](MEMORY[0x1E0DEAF50], v16);
  Collection.first.getter();
  return swift_bridgeObjectRelease();
}

uint64_t Sequence<>.first<A>(matchingCategory:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[2];
  _OWORD v21[2];
  int v22;

  v8 = type metadata accessor for LazySequence();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v20 - v10;
  v12 = *(_DWORD *)(a1 + 32);
  MEMORY[0x1BCCB9848](a2, a4);
  v13 = *(_OWORD *)(a1 + 16);
  v21[0] = *(_OWORD *)a1;
  v21[1] = v13;
  v22 = v12;
  v14 = MEMORY[0x1BCCBA8B0](MEMORY[0x1E0DEC320], v8);
  v15 = Sequence<>.filter<A>(matchingCategory:)((uint64_t)v21, v8, a3, v14);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v20[1] = v15;
  type metadata accessor for CMTypedTag(255, a3, v16, v17);
  v18 = type metadata accessor for Array();
  MEMORY[0x1BCCBA8B0](MEMORY[0x1E0DEAF50], v18);
  Collection.first.getter();
  swift_bridgeObjectRelease();
  return *(_QWORD *)&v21[0];
}

uint64_t specialized static CMTag.Value.== infix(_:_:)(uint64_t a1)
{
  return ((uint64_t (*)(void))((char *)sub_1B8D15FC4 + 4 * byte_1B8D30E3C[*(unsigned __int8 *)(a1 + 8)]))();
}

BOOL sub_1B8D15FC4@<W0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;

  return !v1 && a1 == v2;
}

BOOL sub_1B8D15FF0@<W0>(double a1@<X8>)
{
  int v1;
  double v2;
  _BOOL4 v3;

  v3 = a1 == v2;
  return v1 == 1 && v3;
}

uint64_t type metadata accessor for CMTypedTag.Category(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CMTypedTag.Category);
}

void specialized static CMTag.== infix(_:_:)(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1B8D16058(CMTagCategory a1, int64_t a2)
{
  uint64_t v2;

  CMTagMakeWithSInt64Value(a1, a2);
  return ((uint64_t (*)(_QWORD, _QWORD))((char *)sub_1B8D160A4
                                                 + 4 * byte_1B8D30E44[*(unsigned __int8 *)(v2 + 32)]))(*(unsigned int *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

BOOL sub_1B8D160A4(CMTagCategory a1, int64_t a2)
{
  uint64_t v2;
  CMTagValue v3;
  CMTag v5;
  CMTag v6;

  v6 = CMTagMakeWithSInt64Value(a1, a2);
  *(_QWORD *)&v5.category = v2;
  v5.value = v3;
  return CMTagEqualToTag(v5, v6) != 0;
}

uint64_t specialized CMTypedTag.init(category:value:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t *__return_ptr, uint64_t);
  uint64_t v5;
  int v6;
  uint64_t v7;
  char v8;
  uint64_t v10;
  char v11;

  v3 = v2;
  v4 = *(void (**)(uint64_t *__return_ptr, uint64_t))(a1 + 16);
  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_DWORD *)(a1 + 32);
  *(_OWORD *)(v3 + 40) = *(_OWORD *)a1;
  *(_QWORD *)(v3 + 56) = v4;
  *(_QWORD *)(v3 + 64) = v5;
  *(_DWORD *)(v3 + 72) = v6;
  v4(&v10, a2);
  v7 = v10;
  v8 = v11;
  *(_DWORD *)(v3 + 16) = v6;
  *(_QWORD *)(v3 + 24) = v7;
  *(_BYTE *)(v3 + 32) = v8;
  return v3;
}

uint64_t specialized CMTypedTag.__allocating_init(category:value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  void (*v8)(uint64_t *__return_ptr, uint64_t);
  uint64_t v9;
  int v10;
  uint64_t v11;
  char v12;
  uint64_t v14;
  char v15;

  type metadata accessor for CMTypedTag(0, *(_QWORD *)(v4 + 128), a3, a4);
  v7 = swift_allocObject();
  v8 = *(void (**)(uint64_t *__return_ptr, uint64_t))(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_DWORD *)(a1 + 32);
  *(_OWORD *)(v7 + 40) = *(_OWORD *)a1;
  *(_QWORD *)(v7 + 56) = v8;
  *(_QWORD *)(v7 + 64) = v9;
  *(_DWORD *)(v7 + 72) = v10;
  v8(&v14, a2);
  v11 = v14;
  v12 = v15;
  *(_DWORD *)(v7 + 16) = v10;
  *(_QWORD *)(v7 + 24) = v11;
  *(_BYTE *)(v7 + 32) = v12;
  return v7;
}

void specialized CMTypedTag.init(rawCategory:rawTagValue:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t partial apply for closure #1 in Sequence<>.filter<A>(matchingCategory:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  _OWORD v13[2];
  int v14;

  v7 = *(_QWORD *)(v4 + 24);
  v8 = *(_QWORD *)(v4 + 40);
  type metadata accessor for CMTypedTag(0, v7, a2, a3);
  v9 = *(_OWORD *)(v8 + 16);
  v13[0] = *(_OWORD *)v8;
  v13[1] = v9;
  v14 = *(_DWORD *)(v8 + 32);
  outlined retain of CMTypedTag<A1>.Category(v8);
  result = specialized CMTypedTag.__allocating_init(category:value:)((uint64_t)v13, a1, v10, v11);
  *a4 = result;
  return result;
}

uint64_t type metadata accessor for CMTypedTag(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CMTypedTag);
}

uint64_t instantiation function for generic protocol witness table for CMTagCategory(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = lazy protocol witness table accessor for type CMTagCategory and conformance CMTagCategory(&lazy protocol witness table cache variable for type CMTagCategory and conformance CMTagCategory, (uint64_t)&protocol conformance descriptor for CMTagCategory);
  result = lazy protocol witness table accessor for type CMTagCategory and conformance CMTagCategory(&lazy protocol witness table cache variable for type CMTagCategory and conformance CMTagCategory, (uint64_t)&protocol conformance descriptor for CMTagCategory);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMTagCategory(_QWORD *a1)
{
  uint64_t result;

  a1[1] = lazy protocol witness table accessor for type CMTagCategory and conformance CMTagCategory(&lazy protocol witness table cache variable for type CMTagCategory and conformance CMTagCategory, (uint64_t)&protocol conformance descriptor for CMTagCategory);
  a1[2] = lazy protocol witness table accessor for type CMTagCategory and conformance CMTagCategory(&lazy protocol witness table cache variable for type CMTagCategory and conformance CMTagCategory, (uint64_t)&protocol conformance descriptor for CMTagCategory);
  result = lazy protocol witness table accessor for type CMTagCategory and conformance CMTagCategory(&lazy protocol witness table cache variable for type CMTagCategory and conformance CMTagCategory, (uint64_t)&protocol conformance descriptor for CMTagCategory);
  a1[3] = result;
  return result;
}

uint64_t lazy protocol witness table accessor for type CMTagCategory and conformance CMTagCategory(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CMTagCategory(255);
    result = MEMORY[0x1BCCBA8B0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for CMTag()
{
  return objc_opt_self();
}

uint64_t method lookup function for CMTag()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CMTag.__allocating_init(rawCategory:rawTagValue:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of CMTag.value<A>(onlyIfMatching:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of CMTag.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t getEnumTagSinglePayload for CMTag.Value(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CMTag.Value(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t destructiveInjectEnumTag for CMTag.Value(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CMTag.Value()
{
  return &type metadata for CMTag.Value;
}

uint64_t type metadata completion function for CMTypedTag()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for CMTypedTag()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CMTypedTag.value.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of CMTypedTag.__allocating_init(category:value:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t type metadata instantiation function for CMTypedTag.Category()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t destroy for CMTypedTag.Category()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for CMTypedTag.Category(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CMTypedTag.Category(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_retain();
  swift_release();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy36_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for CMTypedTag.Category(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for CMTypedTag.Category(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 36))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CMTypedTag.Category(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_DWORD *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 36) = 1;
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
    *(_BYTE *)(result + 36) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t outlined retain of CMTypedTag<A1>.Category(uint64_t a1)
{
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t partial apply for closure #1 in Sequence<>.compactMap<A>(toValuesMatchingCategory:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  _OWORD v7[2];
  int v8;

  v2 = *(_QWORD *)(v1 + 24);
  v3 = *(_QWORD *)(v1 + 40);
  v4 = *a1;
  v5 = *(_OWORD *)(v3 + 16);
  v7[0] = *(_OWORD *)v3;
  v7[1] = v5;
  v8 = *(_DWORD *)(v3 + 32);
  return (*(uint64_t (**)(_OWORD *, uint64_t))(*(_QWORD *)v4 + 112))(v7, v2);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1BCCBA880](a1, v6, a5);
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ()(_QWORD *a1, uint64_t (*a2)(_QWORD))
{
  return a2(*a1);
}

uint64_t CMBufferQueueRef.Handlers.getDecodeTimeStamp.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(*v0);
  return v1;
}

uint64_t CMBufferQueueRef.Handlers.getPresentationTimeStamp.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v1);
  return v1;
}

uint64_t CMBufferQueueRef.Handlers.getDuration.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_retain();
  return v1;
}

uint64_t CMBufferQueueRef.Handlers.isDataReady.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v1);
  return v1;
}

uint64_t outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t CMBufferQueueRef.Handlers.compare.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v1);
  return v1;
}

uint64_t CMBufferQueueRef.Handlers.dataBecameReadyNotification.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CMBufferQueueRef.Handlers.getSize.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 96);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v1);
  return v1;
}

uint64_t CMBufferQueueRef.Handlers.Builder.dataBecameReadyNotification.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 80) = a1;
  *(_QWORD *)(v2 + 88) = a2;
  return result;
}

uint64_t (*CMBufferQueueRef.Handlers.Builder.dataBecameReadyNotification.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

uint64_t CMBufferQueueRef.Handlers.Builder.getDecodeTimeStamp(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t result;

  v5 = *v2;
  swift_retain();
  result = outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v5);
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t CMBufferQueueRef.Handlers.Builder.getPresentationTimeStamp(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  v5 = *(_QWORD *)(v2 + 16);
  swift_retain();
  result = outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v5);
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t CMBufferQueueRef.Handlers.Builder.getDuration(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  v5 = *(_QWORD *)(v2 + 32);
  swift_retain();
  result = outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v5);
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t CMBufferQueueRef.Handlers.Builder.isDataReady(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  v5 = *(_QWORD *)(v2 + 48);
  swift_retain();
  result = outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v5);
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return result;
}

uint64_t outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t CMBufferQueueRef.Handlers.Builder.compare(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  v5 = *(_QWORD *)(v2 + 64);
  swift_retain();
  result = outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v5);
  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = a2;
  return result;
}

uint64_t CMBufferQueueRef.Handlers.Builder.getSize(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  v5 = *(_QWORD *)(v2 + 96);
  swift_retain();
  result = outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v5);
  *(_QWORD *)(v2 + 96) = a1;
  *(_QWORD *)(v2 + 104) = a2;
  return result;
}

uint64_t *CMBufferQueueRef.Handlers.Builder.build(handlers:)@<X0>(uint64_t *result@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t *v2;
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
  uint64_t (*v19)();
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)();
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)();
  uint64_t (*v39)(uint64_t);
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
  uint64_t (*v53)();
  uint64_t v54;
  uint64_t v55;
  uint64_t (*v56)();
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;

  v62 = *result;
  v4 = result[4];
  v48 = result[6];
  v6 = *v2;
  v5 = v2[1];
  v7 = v2[2];
  v55 = v2[3];
  v8 = v2[5];
  v9 = v2[9];
  v59 = v2[8];
  v66 = v2[11];
  v10 = v2[12];
  v61 = v2[4];
  v65 = v2[10];
  v50 = result[12];
  v51 = v2[13];
  v44 = result[13];
  v45 = result[11];
  v46 = result[10];
  v47 = result[2];
  v42 = result[7];
  v43 = result[9];
  v49 = result[8];
  v57 = v2[7];
  v58 = v2[6];
  v41 = result[3];
  v52 = result[1];
  if (v61)
  {
    v11 = v2[4];
    v12 = result[4];
    v13 = v8;
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v11;
    *(_QWORD *)(v14 + 24) = v13;
    goto LABEL_5;
  }
  if (v4)
  {
    v15 = result[5];
    v14 = swift_allocObject();
    v12 = v4;
    *(_QWORD *)(v14 + 16) = v4;
    *(_QWORD *)(v14 + 24) = v15;
    swift_retain();
LABEL_5:
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned CMTime);
    *(_QWORD *)(v16 + 24) = v14;
    v54 = v16;
    if (v6)
    {
      v17 = swift_allocObject();
      *(_QWORD *)(v17 + 16) = v6;
      *(_QWORD *)(v17 + 24) = v5;
      v18 = v10;
    }
    else
    {
      v19 = 0;
      v18 = v10;
      if (!v12)
      {
        v64 = 0;
LABEL_11:
        v53 = v19;
        v21 = v9;
        if (v7)
        {
          v22 = swift_allocObject();
          *(_QWORD *)(v22 + 16) = v7;
          *(_QWORD *)(v22 + 24) = v55;
          v23 = v12;
          v25 = v57;
          v24 = v58;
        }
        else
        {
          v26 = 0;
          v23 = v12;
          if (!v12)
          {
            v63 = 0;
            v25 = v57;
            v24 = v58;
            v56 = 0;
            if (v58)
              goto LABEL_18;
            goto LABEL_21;
          }
          v63 = 0;
          v25 = v57;
          v24 = v58;
          if (!v47)
          {
LABEL_17:
            v56 = v26;
            if (v24)
            {
LABEL_18:
              v28 = swift_allocObject();
              *(_QWORD *)(v28 + 16) = v24;
              *(_QWORD *)(v28 + 24) = v25;
              v29 = v59;
              goto LABEL_24;
            }
LABEL_21:
            v30 = 0;
            v29 = v59;
            v31 = 0;
            if (!v23 || !v48)
            {
LABEL_25:
              v60 = v30;
              if (v29)
              {
                v32 = swift_allocObject();
                *(_QWORD *)(v32 + 16) = v29;
                *(_QWORD *)(v32 + 24) = v21;
              }
              else
              {
                v33 = 0;
                v34 = 0;
                if (!v23 || !v49)
                {
LABEL_31:
                  v35 = v66;
                  if (!v66)
                  {
                    if (!v23)
                    {
                      v65 = 0;
                      v35 = 0;
                      if (v18)
                        goto LABEL_35;
                      goto LABEL_37;
                    }
                    v35 = v45;
                    swift_bridgeObjectRetain();
                    v65 = v46;
                  }
                  if (v18)
                  {
LABEL_35:
                    v36 = swift_allocObject();
                    *(_QWORD *)(v36 + 16) = v18;
                    *(_QWORD *)(v36 + 24) = v51;
                    v37 = v18;
                    v38 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Int)partial apply;
                    goto LABEL_40;
                  }
LABEL_37:
                  v39 = 0;
                  v40 = 0;
                  if (!v23 || !v50)
                    goto LABEL_41;
                  v36 = swift_allocObject();
                  *(_QWORD *)(v36 + 16) = v50;
                  *(_QWORD *)(v36 + 24) = v44;
                  swift_retain();
                  v37 = v18;
                  v38 = (uint64_t (*)())partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Int);
LABEL_40:
                  v40 = swift_allocObject();
                  *(_QWORD *)(v40 + 16) = v38;
                  *(_QWORD *)(v40 + 24) = v36;
                  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v37);
                  v39 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Swift.AnyObject) -> (@out Int);
LABEL_41:
                  *a2 = v53;
                  a2[1] = (uint64_t (*)())v64;
                  a2[2] = v56;
                  a2[3] = (uint64_t (*)())v63;
                  a2[4] = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Swift.AnyObject) -> (@out CMTime);
                  a2[5] = (uint64_t (*)())v54;
                  a2[6] = (uint64_t (*)())v60;
                  a2[7] = (uint64_t (*)())v31;
                  a2[8] = (uint64_t (*)())v33;
                  a2[9] = (uint64_t (*)())v34;
                  a2[10] = (uint64_t (*)())v65;
                  a2[11] = (uint64_t (*)())v35;
                  a2[12] = (uint64_t (*)())v39;
                  a2[13] = (uint64_t (*)())v40;
                  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v61);
                  return (uint64_t *)swift_bridgeObjectRetain();
                }
                v32 = swift_allocObject();
                *(_QWORD *)(v32 + 16) = v49;
                *(_QWORD *)(v32 + 24) = v43;
                swift_retain();
              }
              v34 = swift_allocObject();
              *(_QWORD *)(v34 + 16) = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject, @guaranteed Swift.AnyObject) -> (@unowned CFComparisonResult);
              *(_QWORD *)(v34 + 24) = v32;
              outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v29);
              v33 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Swift.AnyObject, @in_guaranteed Swift.AnyObject) -> (@out CFComparisonResult);
              goto LABEL_31;
            }
            v28 = swift_allocObject();
            *(_QWORD *)(v28 + 16) = v48;
            *(_QWORD *)(v28 + 24) = v42;
            swift_retain();
LABEL_24:
            v31 = swift_allocObject();
            *(_QWORD *)(v31 + 16) = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
            *(_QWORD *)(v31 + 24) = v28;
            outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v24);
            v30 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Swift.AnyObject) -> (@out Bool);
            goto LABEL_25;
          }
          v22 = swift_allocObject();
          *(_QWORD *)(v22 + 16) = v47;
          *(_QWORD *)(v22 + 24) = v41;
          swift_retain();
        }
        v27 = swift_allocObject();
        *(_QWORD *)(v27 + 16) = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned CMTime);
        *(_QWORD *)(v27 + 24) = v22;
        v63 = v27;
        outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v7);
        v26 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Swift.AnyObject) -> (@out CMTime);
        goto LABEL_17;
      }
      v64 = 0;
      if (!v62)
        goto LABEL_11;
      v17 = swift_allocObject();
      *(_QWORD *)(v17 + 16) = v62;
      *(_QWORD *)(v17 + 24) = v52;
      swift_retain();
    }
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned CMTime);
    *(_QWORD *)(v20 + 24) = v17;
    v64 = v20;
    outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v6);
    v19 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Swift.AnyObject) -> (@out CMTime);
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

double CMBufferQueueRef.Handlers.init(withHandlers:)@<D0>(void (*a1)(__int128 *)@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v16[11];
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  _OWORD v21[7];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _OWORD v26[2];
  __int128 v27;

  v27 = 0u;
  v25 = 0u;
  memset(v26, 0, sizeof(v26));
  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  a1(&v22);
  v3 = v22;
  v4 = v23;
  v5 = v24;
  v6 = v25;
  v14 = *(_QWORD *)&v26[0];
  v15 = v27;
  v16[7] = v22;
  v16[8] = v23;
  v16[9] = v24;
  v16[10] = v25;
  v17 = *(_QWORD *)&v26[0];
  v18 = *(_OWORD *)((char *)v26 + 8);
  v19 = *((_QWORD *)&v26[1] + 1);
  v20 = v27;
  memset(v16, 0, 112);
  CMBufferQueueRef.Handlers.Builder.build(handlers:)((uint64_t *)v16, (uint64_t (**)())v21);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v3);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v4);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v5);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v6);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v14);
  swift_bridgeObjectRelease();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v15);
  result = *(double *)v21;
  v8 = v21[1];
  v9 = v21[2];
  v10 = v21[3];
  v11 = v21[4];
  v12 = v21[5];
  v13 = v21[6];
  *a2 = v21[0];
  a2[1] = v8;
  a2[2] = v9;
  a2[3] = v10;
  a2[4] = v11;
  a2[5] = v12;
  a2[6] = v13;
  return result;
}

uint64_t CMBufferQueueRef.Handlers.withHandlers(_:)@<X0>(void (*a1)(__int128 *)@<X0>, uint64_t (**a2)()@<X8>)
{
  __int128 *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _OWORD v40[2];
  __int128 v41;

  v11 = *v2;
  v9 = *((_QWORD *)v2 + 3);
  v10 = *((_QWORD *)v2 + 2);
  v16 = v2[4];
  v17 = v2[3];
  v15 = v2[5];
  v13 = *((_QWORD *)v2 + 13);
  v14 = *((_QWORD *)v2 + 12);
  v41 = 0u;
  v39 = 0u;
  memset(v40, 0, sizeof(v40));
  v37 = 0u;
  v38 = 0u;
  v36 = 0u;
  a1(&v36);
  v3 = v36;
  v4 = v37;
  v5 = v38;
  v6 = v39;
  v8 = *(_QWORD *)&v40[0];
  v12 = v41;
  v28 = v36;
  v29 = v37;
  v30 = v38;
  v31 = v39;
  v33 = *(_OWORD *)((char *)v40 + 8);
  v32 = *(_QWORD *)&v40[0];
  v34 = *((_QWORD *)&v40[1] + 1);
  v35 = v41;
  v19 = v11;
  v20 = v10;
  v21 = v9;
  v22 = v2[2];
  v23 = v17;
  v24 = v16;
  v25 = v15;
  v26 = v14;
  v27 = v13;
  CMBufferQueueRef.Handlers.Builder.build(handlers:)((uint64_t *)&v19, a2);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v3);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v4);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v5);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v6);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v8);
  swift_bridgeObjectRelease();
  return outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v12);
}

double CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:)@<D0>(__int128 *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v16[11];
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  _OWORD v21[7];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _OWORD v26[2];
  __int128 v27;

  v27 = 0u;
  v25 = 0u;
  memset(v26, 0, sizeof(v26));
  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:)((uint64_t *)&v22, a1);
  v3 = v22;
  v4 = v23;
  v5 = v24;
  v6 = v25;
  v14 = *(_QWORD *)&v26[0];
  v15 = v27;
  v16[7] = v22;
  v16[8] = v23;
  v16[9] = v24;
  v16[10] = v25;
  v17 = *(_QWORD *)&v26[0];
  v18 = *(_OWORD *)((char *)v26 + 8);
  v19 = *((_QWORD *)&v26[1] + 1);
  v20 = v27;
  memset(v16, 0, 112);
  CMBufferQueueRef.Handlers.Builder.build(handlers:)((uint64_t *)v16, (uint64_t (**)())v21);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v3);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v4);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v5);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v6);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v14);
  swift_bridgeObjectRelease();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v15);
  result = *(double *)v21;
  v8 = v21[1];
  v9 = v21[2];
  v10 = v21[3];
  v11 = v21[4];
  v12 = v21[5];
  v13 = v21[6];
  *a2 = v21[0];
  a2[1] = v8;
  a2[2] = v9;
  a2[3] = v10;
  a2[4] = v11;
  a2[5] = v12;
  a2[6] = v13;
  return result;
}

uint64_t closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:)(uint64_t *a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t result;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  id v33;

  v4 = *(_QWORD *)((char *)a2 + 12);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v6 = *a2;
    *(_OWORD *)(v5 + 40) = a2[1];
    v7 = a2[3];
    *(_OWORD *)(v5 + 56) = a2[2];
    *(_OWORD *)(v5 + 72) = v7;
    *(_DWORD *)(v5 + 88) = *((_DWORD *)a2 + 16);
    *(_OWORD *)(v5 + 24) = v6;
    outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(*a1);
    *a1 = (uint64_t)partial apply for closure #2 in closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:);
    a1[1] = v5;
  }
  v8 = *(_QWORD *)((char *)a2 + 20);
  if (v8)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v8;
    v10 = *a2;
    *(_OWORD *)(v9 + 40) = a2[1];
    v11 = a2[3];
    *(_OWORD *)(v9 + 56) = a2[2];
    *(_OWORD *)(v9 + 72) = v11;
    *(_DWORD *)(v9 + 88) = *((_DWORD *)a2 + 16);
    *(_OWORD *)(v9 + 24) = v10;
    outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(a1[2]);
    a1[2] = (uint64_t)partial apply for closure #2 in closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:);
    a1[3] = v9;
  }
  v12 = swift_allocObject();
  v13 = a2[3];
  *(_OWORD *)(v12 + 48) = a2[2];
  *(_OWORD *)(v12 + 64) = v13;
  *(_DWORD *)(v12 + 80) = *((_DWORD *)a2 + 16);
  v14 = a2[1];
  *(_OWORD *)(v12 + 16) = *a2;
  *(_OWORD *)(v12 + 32) = v14;
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(a1[4]);
  a1[4] = (uint64_t)partial apply for closure #3 in closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:);
  a1[5] = v12;
  v15 = *(_QWORD *)((char *)a2 + 36);
  if (v15)
  {
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v15;
    v17 = *a2;
    *(_OWORD *)(v16 + 40) = a2[1];
    v18 = a2[3];
    *(_OWORD *)(v16 + 56) = a2[2];
    *(_OWORD *)(v16 + 72) = v18;
    *(_DWORD *)(v16 + 88) = *((_DWORD *)a2 + 16);
    *(_OWORD *)(v16 + 24) = v17;
    outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(a1[6]);
    a1[6] = (uint64_t)partial apply for closure #4 in closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:);
    a1[7] = v16;
  }
  v19 = *(_QWORD *)((char *)a2 + 44);
  if (v19)
  {
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = v19;
    v21 = *a2;
    *(_OWORD *)(v20 + 40) = a2[1];
    v22 = a2[3];
    *(_OWORD *)(v20 + 56) = a2[2];
    *(_OWORD *)(v20 + 72) = v22;
    *(_DWORD *)(v20 + 88) = *((_DWORD *)a2 + 16);
    *(_OWORD *)(v20 + 24) = v21;
    outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(a1[8]);
    a1[8] = (uint64_t)partial apply for closure #5 in closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:);
    a1[9] = v20;
  }
  outlined init with take of String?((uint64_t)a2 + 52, (uint64_t)&v32, &demangling cache variable for type metadata for Unmanaged<CFStringRef>?);
  result = outlined init with take of String?((uint64_t)&v32, (uint64_t)&v33, &demangling cache variable for type metadata for Unmanaged<CFStringRef>?);
  if (v33)
  {
    v24 = v33;
    v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v27 = v26;

    result = swift_bridgeObjectRelease();
    a1[10] = v25;
    a1[11] = v27;
  }
  v28 = *(_QWORD *)((char *)a2 + 60);
  if (v28)
  {
    v29 = swift_allocObject();
    *(_QWORD *)(v29 + 16) = v28;
    v30 = *a2;
    *(_OWORD *)(v29 + 40) = a2[1];
    v31 = a2[3];
    *(_OWORD *)(v29 + 56) = a2[2];
    *(_OWORD *)(v29 + 72) = v31;
    *(_DWORD *)(v29 + 88) = *((_DWORD *)a2 + 16);
    *(_OWORD *)(v29 + 24) = v30;
    result = outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(a1[12]);
    a1[12] = (uint64_t)partial apply for closure #6 in closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:);
    a1[13] = v29;
  }
  return result;
}

double one-time initialization function for unsortedSampleBuffers(uint64_t a1)
{
  return one-time initialization function for unsortedSampleBuffers(a1, MEMORY[0x1E0C9EC20], &static CMBufferQueueRef.Handlers.unsortedSampleBuffers);
}

uint64_t static CMBufferQueueRef.Handlers.unsortedSampleBuffers.getter@<X0>(uint64_t a1@<X8>)
{
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

  if (one-time initialization token for unsortedSampleBuffers != -1)
    swift_once();
  v2 = static CMBufferQueueRef.Handlers.unsortedSampleBuffers;
  v3 = unk_1EF1D8530;
  v4 = qword_1EF1D8538;
  v5 = unk_1EF1D8540;
  v6 = qword_1EF1D8548;
  v7 = unk_1EF1D8550;
  v8 = qword_1EF1D8558;
  v9 = unk_1EF1D8560;
  v10 = qword_1EF1D8568;
  v11 = qword_1EF1D8580;
  v12 = unk_1EF1D8588;
  v13 = qword_1EF1D8590;
  *(_QWORD *)a1 = static CMBufferQueueRef.Handlers.unsortedSampleBuffers;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = v9;
  *(_QWORD *)(a1 + 64) = v10;
  *(_OWORD *)(a1 + 72) = *(_OWORD *)algn_1EF1D8570;
  *(_QWORD *)(a1 + 88) = v11;
  *(_QWORD *)(a1 + 96) = v12;
  *(_QWORD *)(a1 + 104) = v13;
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v2);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v4);
  swift_retain();
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v8);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v10);
  swift_bridgeObjectRetain();
  return outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v12);
}

double one-time initialization function for outputPTSSortedSampleBuffers(uint64_t a1)
{
  return one-time initialization function for unsortedSampleBuffers(a1, MEMORY[0x1E0C9EC18], &static CMBufferQueueRef.Handlers.outputPTSSortedSampleBuffers);
}

double one-time initialization function for unsortedSampleBuffers(uint64_t a1, uint64_t (*a2)(void), _OWORD *a3)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v8[4];
  int v9;

  v4 = a2();
  v5 = *(_OWORD *)(v4 + 48);
  v8[2] = *(_OWORD *)(v4 + 32);
  v8[3] = v5;
  v9 = *(_DWORD *)(v4 + 64);
  v6 = *(_OWORD *)(v4 + 16);
  v8[0] = *(_OWORD *)v4;
  v8[1] = v6;
  return CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:)(v8, a3);
}

uint64_t static CMBufferQueueRef.Handlers.outputPTSSortedSampleBuffers.getter@<X0>(uint64_t a1@<X8>)
{
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

  if (one-time initialization token for outputPTSSortedSampleBuffers != -1)
    swift_once();
  v2 = static CMBufferQueueRef.Handlers.outputPTSSortedSampleBuffers;
  v3 = unk_1EF1D85A0;
  v4 = qword_1EF1D85A8;
  v5 = unk_1EF1D85B0;
  v6 = qword_1EF1D85B8;
  v7 = unk_1EF1D85C0;
  v8 = qword_1EF1D85C8;
  v9 = unk_1EF1D85D0;
  v10 = qword_1EF1D85D8;
  v11 = qword_1EF1D85F0;
  v12 = unk_1EF1D85F8;
  v13 = qword_1EF1D8600;
  *(_QWORD *)a1 = static CMBufferQueueRef.Handlers.outputPTSSortedSampleBuffers;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = v9;
  *(_QWORD *)(a1 + 64) = v10;
  *(_OWORD *)(a1 + 72) = unk_1EF1D85E0;
  *(_QWORD *)(a1 + 88) = v11;
  *(_QWORD *)(a1 + 96) = v12;
  *(_QWORD *)(a1 + 104) = v13;
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v2);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v4);
  swift_retain();
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v8);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v10);
  swift_bridgeObjectRetain();
  return outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v12);
}

uint64_t specialized CMBufferQueueRef.Handlers.withOpaquePointer<A>(_:)(uint64_t *a1, CMItemCount a2, CMBufferQueueRef *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t inited;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t result;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  char *aBlock;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE v51[16];
  _QWORD v52[3];

  v5 = *a1;
  v6 = a1[1];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any?>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B8D31050;
  v8 = (char *)MEMORY[0x1E0C809B0];
  if (v5)
  {
    v49 = v5;
    v50 = v6;
    aBlock = (char *)MEMORY[0x1E0C809B0];
    v46 = 1644167168;
    v47 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned CMTime);
    v48 = &block_descriptor_64;
    v9 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for @convention(block) (_:));
  }
  else
  {
    v9 = 0;
    v10 = 0;
    *(_QWORD *)(inited + 40) = 0;
    *(_QWORD *)(inited + 48) = 0;
  }
  *(_QWORD *)(inited + 32) = v9;
  *(_QWORD *)(inited + 56) = v10;
  if (a1[2])
  {
    v11 = a1[3];
    v49 = a1[2];
    v50 = v11;
    aBlock = v8;
    v46 = 1644167168;
    v47 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned CMTime);
    v48 = &block_descriptor_61;
    v12 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for @convention(block) (_:));
  }
  else
  {
    v12 = 0;
    v13 = 0;
    *(_QWORD *)(inited + 72) = 0;
    *(_QWORD *)(inited + 80) = 0;
  }
  *(_QWORD *)(inited + 64) = v12;
  *(_QWORD *)(inited + 88) = v13;
  v14 = a1[5];
  v15 = a1[6];
  v16 = a1[7];
  v49 = a1[4];
  v50 = v14;
  aBlock = v8;
  v46 = 1644167168;
  v47 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned CMTime);
  v48 = &block_descriptor_49;
  v17 = _Block_copy(&aBlock);
  *(_QWORD *)(inited + 120) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for @convention(block) (_:));
  *(_QWORD *)(inited + 96) = v17;
  swift_retain();
  swift_release();
  if (v15)
  {
    v49 = v15;
    v50 = v16;
    aBlock = v8;
    v46 = 1107296256;
    v47 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
    v48 = &block_descriptor_58;
    v18 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for @convention(block) (_:));
  }
  else
  {
    v18 = 0;
    v19 = 0;
    *(_QWORD *)(inited + 136) = 0;
    *(_QWORD *)(inited + 144) = 0;
  }
  *(_QWORD *)(inited + 128) = v18;
  *(_QWORD *)(inited + 152) = v19;
  if (a1[8])
  {
    v20 = a1[9];
    v49 = a1[8];
    v50 = v20;
    aBlock = v8;
    v46 = 1107296256;
    v47 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject, @guaranteed Swift.AnyObject) -> (@unowned CFComparisonResult);
    v48 = &block_descriptor_55;
    v21 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for @convention(block) (_:_:));
  }
  else
  {
    v21 = 0;
    v22 = 0;
    *(_QWORD *)(inited + 168) = 0;
    *(_QWORD *)(inited + 176) = 0;
  }
  *(_QWORD *)(inited + 160) = v21;
  *(_QWORD *)(inited + 184) = v22;
  outlined init with take of String?((uint64_t)(a1 + 10), (uint64_t)v51, &demangling cache variable for type metadata for String?);
  outlined init with take of String?((uint64_t)v51, (uint64_t)v52, &demangling cache variable for type metadata for String?);
  if (v52[1])
  {
    v23 = MEMORY[0x1BCCB97B8](v52[0]);
    type metadata accessor for CFStringRef(0);
  }
  else
  {
    v23 = 0;
    v24 = 0;
    *(_QWORD *)(inited + 200) = 0;
    *(_QWORD *)(inited + 208) = 0;
  }
  *(_QWORD *)(inited + 192) = v23;
  *(_QWORD *)(inited + 216) = v24;
  if (a1[12])
  {
    v25 = a1[13];
    v49 = a1[12];
    v50 = v25;
    aBlock = v8;
    v46 = 1107296256;
    v47 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Int);
    v48 = &block_descriptor_52;
    v26 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for @convention(block) (_:));
  }
  else
  {
    v26 = 0;
    v27 = 0;
    *(_QWORD *)(inited + 232) = 0;
    *(_QWORD *)(inited + 240) = 0;
  }
  *(_QWORD *)(inited + 224) = v26;
  *(_QWORD *)(inited + 248) = v27;
  v44 = MEMORY[0x1E0DEE9D8];
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, 7, 0);
  for (i = 32; i != 256; i += 32)
  {
    outlined init with copy of Any?(inited + i, (uint64_t)&aBlock);
    outlined init with copy of Any?((uint64_t)&aBlock, (uint64_t)&v42);
    if (v43)
    {
      outlined init with take of Any(&v42, &v40);
      __swift_project_boxed_opaque_existential_1(&v40, v41);
      v29 = _bridgeAnythingToObjectiveC<A>(_:)();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v40);
    }
    else
    {
      v29 = 0;
    }
    outlined destroy of Any?((uint64_t)&aBlock);
    v30 = v44;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v30 + 16) + 1, 1);
      v30 = v44;
    }
    v32 = *(_QWORD *)(v30 + 16);
    v31 = *(_QWORD *)(v30 + 24);
    if (v32 >= v31 >> 1)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v31 > 1), v32 + 1, 1);
      v30 = v44;
    }
    *(_QWORD *)(v30 + 16) = v32 + 1;
    *(_QWORD *)(v30 + 8 * v32 + 32) = v29;
  }
  swift_bridgeObjectRelease();
  aBlock = (char *)&outlined read-only object #0 of specialized CMBufferQueueRef.Handlers.withOpaquePointer<A>(_:);
  specialized Array.append<A>(contentsOf:)(v30);
  v33 = aBlock;
  result = CMBufferQueueCreateWithHandlers((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, (const CMBufferHandlers *)(aBlock + 32), a3);
  v35 = result;
  v36 = *((_QWORD *)v33 + 2);
  v37 = v36 - 1;
  if (v36 == 1)
    goto LABEL_35;
  if (v36)
  {
    swift_bridgeObjectRetain();
    v38 = 0;
    do
    {
      if (*(_QWORD *)&v33[8 * v38 + 40])
        swift_unknownObjectRelease();
      ++v38;
    }
    while (v37 != v38);
    swift_bridgeObjectRelease();
LABEL_35:
    swift_bridgeObjectRelease();
    return v35;
  }
  __break(1u);
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned CMTime)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v3 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  v4 = swift_unknownObjectRetain();
  v5 = v3(v4);
  v7 = v6;
  v9 = v8;
  swift_release();
  result = swift_unknownObjectRelease();
  *a2 = v5;
  a2[1] = v7;
  a2[2] = v9;
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool)(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  LOBYTE(v1) = v1(v2);
  swift_release();
  swift_unknownObjectRelease();
  return v1 & 1;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject, @guaranteed Swift.AnyObject) -> (@unowned CFComparisonResult)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v5)(uint64_t, uint64_t);
  uint64_t v6;

  v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = v5(a2, a3);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v6;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Int)(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v3 = v1(v2);
  swift_release();
  swift_unknownObjectRelease();
  return v3;
}

void _CMBufferQueueInitTrampoline.init(capacity:handlers:)(CMItemCount a1, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  int v9;
  id v10;
  CMBufferQueueRef v11;
  _OWORD v12[7];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a2[5];
  v12[4] = a2[4];
  v12[5] = v6;
  v12[6] = a2[6];
  v7 = a2[1];
  v12[0] = *a2;
  v12[1] = v7;
  v8 = a2[3];
  v12[2] = a2[2];
  v12[3] = v8;
  v11 = 0;
  v9 = specialized CMBufferQueueRef.Handlers.withOpaquePointer<A>(_:)((uint64_t *)v12, a1, &v11);
  if (v9 == noErr.getter())
  {
    outlined release of CMBufferQueueRef.Handlers((uint64_t *)v12);
    if (v11)
      (*(void (**)(CMBufferQueueRef, uint64_t, uint64_t))(a4 + 8))(v11, a3, a4);
    else
      __break(1u);
  }
  else
  {
    v10 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v10, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v9, 0);
    swift_willThrow();
    outlined release of CMBufferQueueRef.Handlers((uint64_t *)v12);

  }
}

uint64_t *outlined release of CMBufferQueueRef.Handlers(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a1[2];
  v3 = a1[6];
  v4 = a1[8];
  v5 = a1[12];
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(*a1);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v2);
  swift_release();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v3);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v4);
  swift_bridgeObjectRelease();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v5);
  return a1;
}

id static CMBufferQueueRef.Error.allocationFailed.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for allocationFailed, (id *)&static CMBufferQueueRef.Error.allocationFailed);
}

id static CMBufferQueueRef.Error.requiredParameterMissing.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for requiredParameterMissing, (id *)&static CMBufferQueueRef.Error.requiredParameterMissing);
}

id one-time initialization function for invalidCMBufferCallbacksStruct()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12762, 0);
  static CMBufferQueueRef.Error.invalidCMBufferCallbacksStruct = (uint64_t)result;
  return result;
}

id static CMBufferQueueRef.Error.invalidCMBufferCallbacksStruct.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidCMBufferCallbacksStruct, (id *)&static CMBufferQueueRef.Error.invalidCMBufferCallbacksStruct);
}

id one-time initialization function for enqueueAfterEndOfData()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12763, 0);
  static CMBufferQueueRef.Error.enqueueAfterEndOfData = (uint64_t)result;
  return result;
}

id static CMBufferQueueRef.Error.enqueueAfterEndOfData.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for enqueueAfterEndOfData, (id *)&static CMBufferQueueRef.Error.enqueueAfterEndOfData);
}

id static CMBufferQueueRef.Error.queueIsFull.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for queueIsFull, (id *)&static CMBufferQueueRef.Error.queueIsFull);
}

id one-time initialization function for badTriggerDuration()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12765, 0);
  static CMBufferQueueRef.Error.badTriggerDuration = (uint64_t)result;
  return result;
}

id static CMBufferQueueRef.Error.badTriggerDuration.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for badTriggerDuration, (id *)&static CMBufferQueueRef.Error.badTriggerDuration);
}

id one-time initialization function for cannotModifyQueueFromTriggerCallback()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12766, 0);
  static CMBufferQueueRef.Error.cannotModifyQueueFromTriggerCallback = (uint64_t)result;
  return result;
}

id static CMBufferQueueRef.Error.cannotModifyQueueFromTriggerCallback.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for cannotModifyQueueFromTriggerCallback, (id *)&static CMBufferQueueRef.Error.cannotModifyQueueFromTriggerCallback);
}

id one-time initialization function for invalidTriggerCondition()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12767, 0);
  static CMBufferQueueRef.Error.invalidTriggerCondition = (uint64_t)result;
  return result;
}

id static CMBufferQueueRef.Error.invalidTriggerCondition.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidTriggerCondition, (id *)&static CMBufferQueueRef.Error.invalidTriggerCondition);
}

id one-time initialization function for invalidTriggerToken()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12768, 0);
  static CMBufferQueueRef.Error.invalidTriggerToken = (uint64_t)result;
  return result;
}

id static CMBufferQueueRef.Error.invalidTriggerToken.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidTriggerToken, (id *)&static CMBufferQueueRef.Error.invalidTriggerToken);
}

id one-time initialization function for invalidBuffer()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12769, 0);
  static CMBufferQueueRef.Error.invalidBuffer = (uint64_t)result;
  return result;
}

id static CMBufferQueueRef.Error.invalidBuffer.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidBuffer, (id *)&static CMBufferQueueRef.Error.invalidBuffer);
}

uint64_t CMBufferQueueRef.enqueue(_:)(CMBufferRef buf)
{
  opaqueCMBufferQueue *v1;
  OSStatus v2;
  pthread_key_t v3;
  id *v4;
  id *v5;
  id v6;
  uint64_t result;
  id v8;

  v2 = CMBufferQueueEnqueue(v1, buf);
  if (one-time initialization token for tlsKey != -1)
    swift_once();
  v3 = static BoxedError.tlsKey;
  v4 = (id *)pthread_getspecific(static BoxedError.tlsKey);
  if (v4)
  {
    v5 = v4;
    pthread_setspecific(v3, 0);
    v6 = v5[2];
    swift_release();
  }
  else
  {
    result = noErr.getter();
    if (v2 == (_DWORD)result)
      return result;
    v8 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v8, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v2, 0);
  }
  return swift_willThrow();
}

CMBufferRef CMBufferQueueRef.dequeue()()
{
  opaqueCMBufferQueue *v0;

  return CMBufferQueueDequeueAndRetain(v0);
}

CMBufferRef CMBufferQueueRef.dequeueIfDataReady()()
{
  opaqueCMBufferQueue *v0;

  return CMBufferQueueDequeueIfDataReadyAndRetain(v0);
}

CMBufferRef CMBufferQueueRef.head.getter()
{
  opaqueCMBufferQueue *v0;

  return CMBufferQueueCopyHead(v0);
}

BOOL CMBufferQueueRef.isEmpty.getter()
{
  opaqueCMBufferQueue *v0;

  return CMBufferQueueIsEmpty(v0) != 0;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMBufferQueueRef.markEndOfData()()
{
  CMBufferQueueRef.markEndOfData()(MEMORY[0x1E0C9ECA8]);
}

BOOL CMBufferQueueRef.containsEndOfData.getter()
{
  opaqueCMBufferQueue *v0;

  return CMBufferQueueContainsEndOfData(v0) != 0;
}

BOOL CMBufferQueueRef.isAtEndOfData.getter()
{
  opaqueCMBufferQueue *v0;

  return CMBufferQueueIsAtEndOfData(v0) != 0;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMBufferQueueRef.reset()()
{
  CMBufferQueueRef.markEndOfData()(MEMORY[0x1E0C9ECB8]);
}

uint64_t CMBufferQueueRef.markEndOfData()(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  int v2;
  uint64_t result;
  id v4;

  v2 = a1(v1);
  result = noErr.getter();
  if (v2 != (_DWORD)result)
  {
    v4 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v4, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v2, 0);
    return swift_willThrow();
  }
  return result;
}

uint64_t CMBufferQueueRef.reset(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t isEscapingClosureAtFileLocation;
  void *v10;
  id v11;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = 0;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  closure #1 in CMBufferQueueResetWithHandler(queue:execute:rescue:)((uint64_t)partial apply for thunk for @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@error @owned Error), v7, v6, v2);
  if (v3)
  {
    swift_release();
    return swift_release();
  }
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    swift_beginAccess();
    v10 = *(void **)(v6 + 16);
    if (!v10)
      return swift_release();
    v11 = v10;
    swift_willThrow();
    return swift_release();
  }
  return result;
}

uint64_t sub_1B8D188B0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1B8D188D4()
{
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@error @owned Error)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

CMItemCount CMBufferQueueRef.bufferCount.getter()
{
  opaqueCMBufferQueue *v0;

  return CMBufferQueueGetBufferCount(v0);
}

uint64_t CMBufferQueueRef.duration.getter()
{
  return CMClockRef.time.getter(MEMORY[0x1E0C9EC28]);
}

uint64_t CMBufferQueueRef.minDecodeTimeStamp.getter()
{
  return CMClockRef.time.getter(MEMORY[0x1E0C9EC58]);
}

uint64_t CMBufferQueueRef.firstDecodeTimeStamp.getter()
{
  return CMClockRef.time.getter(MEMORY[0x1E0C9EC38]);
}

uint64_t CMBufferQueueRef.minPresentationTimeStamp.getter()
{
  return CMClockRef.time.getter(MEMORY[0x1E0C9EC60]);
}

uint64_t CMBufferQueueRef.firstPresentationTimeStamp.getter()
{
  return CMClockRef.time.getter(MEMORY[0x1E0C9EC40]);
}

uint64_t CMBufferQueueRef.maxPresentationTimeStamp.getter()
{
  return CMClockRef.time.getter(MEMORY[0x1E0C9EC50]);
}

uint64_t CMBufferQueueRef.endPresentationTimeStamp.getter()
{
  return CMClockRef.time.getter(MEMORY[0x1E0C9EC30]);
}

size_t CMBufferQueueRef.totalSize.getter()
{
  opaqueCMBufferQueue *v0;

  return CMBufferQueueGetTotalSize(v0);
}

void CMBufferQueueRef.installTrigger(condition:_:)(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1B8D189C8(int a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, CMBufferQueueTriggerToken triggerTokenOut, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  opaqueCMBufferQueue *v28;
  uint64_t v29;
  CMTimeValue v30;
  CMTimeEpoch v31;
  uint64_t v32;
  void *v33;
  OSStatus v34;
  uint64_t result;
  id v36;
  CMTime v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  if (a2)
  {
    v39 = a2;
    v40 = v29;
    v37.value = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v37.timescale = 1107296256;
    v37.epoch = (CMTimeEpoch)thunk for @escaping @callee_guaranteed (@unowned OpaquePointer) -> ();
    v38 = &block_descriptor_33;
    v33 = _Block_copy(&v37);
    swift_retain();
    swift_release();
  }
  else
  {
    v33 = 0;
  }
  v37.value = v30;
  *(_QWORD *)&v37.timescale = v32;
  v37.epoch = v31;
  v34 = CMBufferQueueInstallTriggerHandler(v28, 1, &v37, (CMBufferQueueTriggerToken *)&v41, v33);
  _Block_release(v33);
  if (v34 == noErr.getter())
  {
    result = v41;
    if (v41)
      return result;
    __break(1u);
  }
  v36 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  objc_msgSend(v36, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v34, 0, v37.value, *(_QWORD *)&v37.timescale, v37.epoch);
  return swift_willThrow();
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned OpaquePointer) -> ()(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
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

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMBufferQueueRef.removeTrigger(_:)(Swift::OpaquePointer a1)
{
  opaqueCMBufferQueue *v1;
  OSStatus v2;
  id v3;

  v2 = CMBufferQueueRemoveTrigger(v1, (CMBufferQueueTriggerToken)a1._rawValue);
  if (v2 != noErr.getter())
  {
    v3 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v3, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v2, 0);
    swift_willThrow();
  }
}

Swift::Bool __swiftcall CMBufferQueueRef.testTrigger(_:)(Swift::OpaquePointer a1)
{
  opaqueCMBufferQueue *v1;

  return CMBufferQueueTestTrigger(v1, (CMBufferQueueTriggerToken)a1._rawValue) != 0;
}

void CMBufferQueueRef.Buffers.Iterator.next()()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = *v0;
  v1 = v0[1];
  if (!((unint64_t)*v0 >> 62))
  {
    if (v1 == *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
      return;
LABEL_5:
    if ((v2 & 0xC000000000000001) != 0)
    {
      MEMORY[0x1BCCB998C](v1, v2);
      v4 = v1 + 1;
      if (!__OFADD__(v1, 1))
        goto LABEL_9;
    }
    else
    {
      if ((v1 & 0x8000000000000000) != 0)
      {
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
      if (v1 >= *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_14:
        __break(1u);
        return;
      }
      swift_unknownObjectRetain();
      v4 = v1 + 1;
      if (!__OFADD__(v1, 1))
      {
LABEL_9:
        v0[1] = v4;
        return;
      }
    }
    __break(1u);
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v1 != v3)
    goto LABEL_5;
}

void protocol witness for IteratorProtocol.next() in conformance CMBufferQueueRef.Buffers.Iterator(_QWORD *a1@<X8>)
{
  uint64_t v2;

  CMBufferQueueRef.Buffers.Iterator.next()();
  *a1 = v2;
}

uint64_t CMBufferQueueRef.Buffers.makeIterator()@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = 0;
  return swift_bridgeObjectRetain();
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance CMBufferQueueRef.Buffers()
{
  unint64_t *v0;
  uint64_t v1;

  v1 = specialized _copySequenceToContiguousArray<A>(_:)(*v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance CMBufferQueueRef.Buffers(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unint64_t *v3;

  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t CMBufferQueueRef.buffers.getter@<X0>(_QWORD *a1@<X8>)
{
  opaqueCMBufferQueue *v1;
  uint64_t v3;
  CMItemCount BufferCount;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = MEMORY[0x1E0DEE9D8];
  BufferCount = CMBufferQueueGetBufferCount(v1);
  specialized Array._reserveCapacityImpl(minimumCapacity:growForAppend:)(BufferCount, 0);
  specialized Array._endMutation()();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = partial apply for closure #1 in CMBufferQueueRef.buffers.getter;
  *(_QWORD *)(v5 + 24) = v3;
  v8[0] = _syXlIegg_yXlytIegnr_TRTA_0;
  v8[1] = v5;
  swift_retain();
  CMBufferQueueCallForEachBuffer(v1, (OSStatus (__cdecl *)(CMBufferRef, void *))@objc callAppendToArray #1 (buffer:refcon:) in CMBufferQueueRef.buffers.getter, v8);
  swift_release();
  swift_beginAccess();
  v6 = *(_QWORD *)(v3 + 16);
  swift_bridgeObjectRetain();
  result = swift_release();
  *a1 = v6;
  return result;
}

uint64_t sub_1B8D1939C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t closure #1 in CMBufferQueueRef.buffers.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  swift_beginAccess();
  v3 = swift_unknownObjectRetain();
  MEMORY[0x1BCCB986C](v3);
  if (*(_QWORD *)((*(_QWORD *)(a2 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(a2 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  return swift_endAccess();
}

uint64_t @objc callAppendToArray #1 (buffer:refcon:) in CMBufferQueueRef.buffers.getter(uint64_t a1, void (**a2)(uint64_t *))
{
  void (*v2)(uint64_t *);
  uint64_t v3;
  uint64_t v5;

  if (a2)
  {
    v2 = *a2;
    v5 = a1;
    swift_unknownObjectRetain();
    swift_retain();
    v2(&v5);
    swift_release();
  }
  else
  {
    swift_unknownObjectRetain();
  }
  v3 = noErr.getter();
  swift_unknownObjectRelease();
  return v3;
}

uint64_t CMBufferQueueRef.setValidationHandler(_:)(uint64_t a1, uint64_t a2)
{
  opaqueCMBufferQueue *v2;
  uint64_t v5;
  void *v6;
  uint64_t result;
  _QWORD v8[6];

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  v8[4] = partial apply for closure #1 in CMBufferQueueRef.setValidationHandler(_:);
  v8[5] = v5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = thunk for @escaping @callee_guaranteed (@guaranteed CMBufferQueueRef, @guaranteed Swift.AnyObject) -> (@unowned Int32);
  v8[3] = &block_descriptor_45;
  v6 = _Block_copy(v8);
  swift_retain();
  swift_release();
  LODWORD(a2) = CMBufferQueueSetValidationHandler(v2, v6);
  _Block_release(v6);
  result = noErr.getter();
  if ((_DWORD)a2 != (_DWORD)result)
    __break(1u);
  return result;
}

uint64_t closure #1 in CMBufferQueueRef.setValidationHandler(_:)(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  return noErr.getter();
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed CMBufferQueueRef, @guaranteed Swift.AnyObject) -> (@unowned Int32)(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t (*v5)(id, uint64_t);
  id v6;
  uint64_t v7;

  v5 = *(uint64_t (**)(id, uint64_t))(a1 + 32);
  swift_retain();
  v6 = a2;
  swift_unknownObjectRetain();
  v7 = v5(v6, a3);
  swift_release();

  swift_unknownObjectRelease();
  return v7;
}

uint64_t partial apply for closure #1 in CMBufferQueueRef.buffers.getter(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in CMBufferQueueRef.buffers.getter(a1, v1);
}

uint64_t _syXlIegg_yXlytIegnr_TRTA_0(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t partial apply for closure #1 in CMBufferQueueRef.setValidationHandler(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return closure #1 in CMBufferQueueRef.setValidationHandler(_:)(a1, a2, *(void (**)(void))(v2 + 16));
}

unint64_t lazy protocol witness table accessor for type CMBufferQueueRef.Buffers.Iterator and conformance CMBufferQueueRef.Buffers.Iterator()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMBufferQueueRef.Buffers.Iterator and conformance CMBufferQueueRef.Buffers.Iterator;
  if (!lazy protocol witness table cache variable for type CMBufferQueueRef.Buffers.Iterator and conformance CMBufferQueueRef.Buffers.Iterator)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMBufferQueueRef.Buffers.Iterator, &type metadata for CMBufferQueueRef.Buffers.Iterator);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMBufferQueueRef.Buffers.Iterator and conformance CMBufferQueueRef.Buffers.Iterator);
  }
  return result;
}

uint64_t destroy for CMBufferQueueRef.Handlers(_QWORD *a1)
{
  uint64_t result;

  if (*a1)
    swift_release();
  if (a1[2])
    swift_release();
  swift_release();
  if (a1[6])
    swift_release();
  if (a1[8])
    swift_release();
  result = swift_bridgeObjectRelease();
  if (a1[12])
    return swift_release();
  return result;
}

_QWORD *initializeWithCopy for CMBufferQueueRef.Handlers(_QWORD *a1, _QWORD *a2)
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
  uint64_t v14;

  if (*a2)
  {
    v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  v5 = a2[2];
  if (v5)
  {
    v6 = a2[3];
    a1[2] = v5;
    a1[3] = v6;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  }
  v7 = a2[6];
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_retain();
  if (v7)
  {
    v9 = a2[7];
    a1[6] = v7;
    a1[7] = v9;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
  }
  v10 = a2[8];
  if (v10)
  {
    v11 = a2[9];
    a1[8] = v10;
    a1[9] = v11;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
  }
  v12 = a2[12];
  v13 = a2[11];
  a1[10] = a2[10];
  a1[11] = v13;
  swift_bridgeObjectRetain();
  if (v12)
  {
    v14 = a2[13];
    a1[12] = v12;
    a1[13] = v14;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 6) = *((_OWORD *)a2 + 6);
  }
  return a1;
}

_QWORD *assignWithCopy for CMBufferQueueRef.Handlers(_QWORD *a1, _QWORD *a2)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = *a2;
  if (*a1)
  {
    if (v4)
    {
      v5 = a2[1];
      *a1 = v4;
      a1[1] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[1];
    *a1 = v4;
    a1[1] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  v7 = a2[2];
  if (a1[2])
  {
    if (v7)
    {
      v8 = a2[3];
      a1[2] = v7;
      a1[3] = v8;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    v9 = a2[3];
    a1[2] = v7;
    a1[3] = v9;
    swift_retain();
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_15:
  v10 = a2[5];
  a1[4] = a2[4];
  a1[5] = v10;
  swift_retain();
  swift_release();
  v11 = a2[6];
  if (a1[6])
  {
    if (v11)
    {
      v12 = a2[7];
      a1[6] = v11;
      a1[7] = v12;
      swift_retain();
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v11)
  {
    v13 = a2[7];
    a1[6] = v11;
    a1[7] = v13;
    swift_retain();
    goto LABEL_22;
  }
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
LABEL_22:
  v14 = a2[8];
  if (a1[8])
  {
    if (v14)
    {
      v15 = a2[9];
      a1[8] = v14;
      a1[9] = v15;
      swift_retain();
      swift_release();
      goto LABEL_29;
    }
    swift_release();
  }
  else if (v14)
  {
    v16 = a2[9];
    a1[8] = v14;
    a1[9] = v16;
    swift_retain();
    goto LABEL_29;
  }
  *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
LABEL_29:
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = a2[12];
  if (!a1[12])
  {
    if (v17)
    {
      v19 = a2[13];
      a1[12] = v17;
      a1[13] = v19;
      swift_retain();
      return a1;
    }
LABEL_35:
    *((_OWORD *)a1 + 6) = *((_OWORD *)a2 + 6);
    return a1;
  }
  if (!v17)
  {
    swift_release();
    goto LABEL_35;
  }
  v18 = a2[13];
  a1[12] = v17;
  a1[13] = v18;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy112_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t assignWithTake for CMBufferQueueRef.Handlers(uint64_t a1, uint64_t *a2)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = *a2;
  if (*(_QWORD *)a1)
  {
    if (v4)
    {
      v5 = a2[1];
      *(_QWORD *)a1 = v4;
      *(_QWORD *)(a1 + 8) = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[1];
    *(_QWORD *)a1 = v4;
    *(_QWORD *)(a1 + 8) = v6;
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  v7 = a2[2];
  if (*(_QWORD *)(a1 + 16))
  {
    if (v7)
    {
      v8 = a2[3];
      *(_QWORD *)(a1 + 16) = v7;
      *(_QWORD *)(a1 + 24) = v8;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    v9 = a2[3];
    *(_QWORD *)(a1 + 16) = v7;
    *(_QWORD *)(a1 + 24) = v9;
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
LABEL_15:
  *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
  swift_release();
  v10 = a2[6];
  if (*(_QWORD *)(a1 + 48))
  {
    if (v10)
    {
      v11 = a2[7];
      *(_QWORD *)(a1 + 48) = v10;
      *(_QWORD *)(a1 + 56) = v11;
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v10)
  {
    v12 = a2[7];
    *(_QWORD *)(a1 + 48) = v10;
    *(_QWORD *)(a1 + 56) = v12;
    goto LABEL_22;
  }
  *(_OWORD *)(a1 + 48) = *((_OWORD *)a2 + 3);
LABEL_22:
  v13 = a2[8];
  if (*(_QWORD *)(a1 + 64))
  {
    if (v13)
    {
      v14 = a2[9];
      *(_QWORD *)(a1 + 64) = v13;
      *(_QWORD *)(a1 + 72) = v14;
      swift_release();
      goto LABEL_29;
    }
    swift_release();
  }
  else if (v13)
  {
    v15 = a2[9];
    *(_QWORD *)(a1 + 64) = v13;
    *(_QWORD *)(a1 + 72) = v15;
    goto LABEL_29;
  }
  *(_OWORD *)(a1 + 64) = *((_OWORD *)a2 + 4);
LABEL_29:
  v16 = a2[11];
  *(_QWORD *)(a1 + 80) = a2[10];
  *(_QWORD *)(a1 + 88) = v16;
  swift_bridgeObjectRelease();
  v17 = a2[12];
  if (!*(_QWORD *)(a1 + 96))
  {
    if (v17)
    {
      v19 = a2[13];
      *(_QWORD *)(a1 + 96) = v17;
      *(_QWORD *)(a1 + 104) = v19;
      return a1;
    }
LABEL_35:
    *(_OWORD *)(a1 + 96) = *((_OWORD *)a2 + 6);
    return a1;
  }
  if (!v17)
  {
    swift_release();
    goto LABEL_35;
  }
  v18 = a2[13];
  *(_QWORD *)(a1 + 96) = v17;
  *(_QWORD *)(a1 + 104) = v18;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CMBufferQueueRef.Handlers(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 112))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CMBufferQueueRef.Handlers(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 112) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CMBufferQueueRef.Handlers()
{
  return &type metadata for CMBufferQueueRef.Handlers;
}

uint64_t destroy for CMBufferQueueRef.Handlers.Builder(_QWORD *a1)
{
  uint64_t result;

  if (*a1)
    swift_release();
  if (a1[2])
    swift_release();
  if (a1[4])
    swift_release();
  if (a1[6])
    swift_release();
  if (a1[8])
    swift_release();
  result = swift_bridgeObjectRelease();
  if (a1[12])
    return swift_release();
  return result;
}

_QWORD *initializeWithCopy for CMBufferQueueRef.Handlers.Builder(_QWORD *a1, _QWORD *a2)
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
  uint64_t v14;
  uint64_t v15;

  if (*a2)
  {
    v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  v5 = a2[2];
  if (v5)
  {
    v6 = a2[3];
    a1[2] = v5;
    a1[3] = v6;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  }
  v7 = a2[4];
  if (v7)
  {
    v8 = a2[5];
    a1[4] = v7;
    a1[5] = v8;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  }
  v9 = a2[6];
  if (v9)
  {
    v10 = a2[7];
    a1[6] = v9;
    a1[7] = v10;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
  }
  v11 = a2[8];
  if (v11)
  {
    v12 = a2[9];
    a1[8] = v11;
    a1[9] = v12;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
  }
  v13 = a2[12];
  v14 = a2[11];
  a1[10] = a2[10];
  a1[11] = v14;
  swift_bridgeObjectRetain();
  if (v13)
  {
    v15 = a2[13];
    a1[12] = v13;
    a1[13] = v15;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 6) = *((_OWORD *)a2 + 6);
  }
  return a1;
}

_QWORD *assignWithCopy for CMBufferQueueRef.Handlers.Builder(_QWORD *a1, _QWORD *a2)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = *a2;
  if (*a1)
  {
    if (v4)
    {
      v5 = a2[1];
      *a1 = v4;
      a1[1] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[1];
    *a1 = v4;
    a1[1] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  v7 = a2[2];
  if (a1[2])
  {
    if (v7)
    {
      v8 = a2[3];
      a1[2] = v7;
      a1[3] = v8;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    v9 = a2[3];
    a1[2] = v7;
    a1[3] = v9;
    swift_retain();
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_15:
  v10 = a2[4];
  if (a1[4])
  {
    if (v10)
    {
      v11 = a2[5];
      a1[4] = v10;
      a1[5] = v11;
      swift_retain();
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v10)
  {
    v12 = a2[5];
    a1[4] = v10;
    a1[5] = v12;
    swift_retain();
    goto LABEL_22;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_22:
  v13 = a2[6];
  if (a1[6])
  {
    if (v13)
    {
      v14 = a2[7];
      a1[6] = v13;
      a1[7] = v14;
      swift_retain();
      swift_release();
      goto LABEL_29;
    }
    swift_release();
  }
  else if (v13)
  {
    v15 = a2[7];
    a1[6] = v13;
    a1[7] = v15;
    swift_retain();
    goto LABEL_29;
  }
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
LABEL_29:
  v16 = a2[8];
  if (a1[8])
  {
    if (v16)
    {
      v17 = a2[9];
      a1[8] = v16;
      a1[9] = v17;
      swift_retain();
      swift_release();
      goto LABEL_36;
    }
    swift_release();
  }
  else if (v16)
  {
    v18 = a2[9];
    a1[8] = v16;
    a1[9] = v18;
    swift_retain();
    goto LABEL_36;
  }
  *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
LABEL_36:
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = a2[12];
  if (!a1[12])
  {
    if (v19)
    {
      v21 = a2[13];
      a1[12] = v19;
      a1[13] = v21;
      swift_retain();
      return a1;
    }
LABEL_42:
    *((_OWORD *)a1 + 6) = *((_OWORD *)a2 + 6);
    return a1;
  }
  if (!v19)
  {
    swift_release();
    goto LABEL_42;
  }
  v20 = a2[13];
  a1[12] = v19;
  a1[13] = v20;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *assignWithTake for CMBufferQueueRef.Handlers.Builder(_QWORD *a1, _QWORD *a2)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = *a2;
  if (*a1)
  {
    if (v4)
    {
      v5 = a2[1];
      *a1 = v4;
      a1[1] = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[1];
    *a1 = v4;
    a1[1] = v6;
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  v7 = a2[2];
  if (a1[2])
  {
    if (v7)
    {
      v8 = a2[3];
      a1[2] = v7;
      a1[3] = v8;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    v9 = a2[3];
    a1[2] = v7;
    a1[3] = v9;
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_15:
  v10 = a2[4];
  if (a1[4])
  {
    if (v10)
    {
      v11 = a2[5];
      a1[4] = v10;
      a1[5] = v11;
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v10)
  {
    v12 = a2[5];
    a1[4] = v10;
    a1[5] = v12;
    goto LABEL_22;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_22:
  v13 = a2[6];
  if (a1[6])
  {
    if (v13)
    {
      v14 = a2[7];
      a1[6] = v13;
      a1[7] = v14;
      swift_release();
      goto LABEL_29;
    }
    swift_release();
  }
  else if (v13)
  {
    v15 = a2[7];
    a1[6] = v13;
    a1[7] = v15;
    goto LABEL_29;
  }
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
LABEL_29:
  v16 = a2[8];
  if (a1[8])
  {
    if (v16)
    {
      v17 = a2[9];
      a1[8] = v16;
      a1[9] = v17;
      swift_release();
      goto LABEL_36;
    }
    swift_release();
  }
  else if (v16)
  {
    v18 = a2[9];
    a1[8] = v16;
    a1[9] = v18;
    goto LABEL_36;
  }
  *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
LABEL_36:
  v19 = a2[11];
  a1[10] = a2[10];
  a1[11] = v19;
  swift_bridgeObjectRelease();
  v20 = a2[12];
  if (!a1[12])
  {
    if (v20)
    {
      v22 = a2[13];
      a1[12] = v20;
      a1[13] = v22;
      return a1;
    }
LABEL_42:
    *((_OWORD *)a1 + 6) = *((_OWORD *)a2 + 6);
    return a1;
  }
  if (!v20)
  {
    swift_release();
    goto LABEL_42;
  }
  v21 = a2[13];
  a1[12] = v20;
  a1[13] = v21;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CMBufferQueueRef.Handlers.Builder(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 112))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CMBufferQueueRef.Handlers.Builder(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 112) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 112) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for CMBufferQueueRef.Handlers.Builder()
{
  return &type metadata for CMBufferQueueRef.Handlers.Builder;
}

uint64_t dispatch thunk of _CMBufferQueueInitTrampoline.init(referencing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

ValueMetadata *type metadata accessor for CMBufferQueueRef.Error()
{
  return &type metadata for CMBufferQueueRef.Error;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CMBufferQueueRef.TriggerCondition(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFA && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 250);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 6)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CMBufferQueueRef.TriggerCondition(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 250;
    if (a3 >= 0xFA)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFA)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t getEnumTag for CMBufferQueueRef.TriggerCondition(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 5u)
    return *(unsigned __int8 *)(a1 + 24);
  else
    return (*(_DWORD *)a1 + 6);
}

uint64_t destructiveInjectEnumTag for CMBufferQueueRef.TriggerCondition(uint64_t result, unsigned int a2)
{
  uint64_t v2;

  v2 = a2 - 6;
  if (a2 >= 6)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    LOBYTE(a2) = 6;
    *(_QWORD *)result = v2;
  }
  *(_BYTE *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CMBufferQueueRef.TriggerCondition()
{
  return &type metadata for CMBufferQueueRef.TriggerCondition;
}

ValueMetadata *type metadata accessor for CMBufferQueueRef.Buffers()
{
  return &type metadata for CMBufferQueueRef.Buffers;
}

ValueMetadata *type metadata accessor for CMBufferQueueRef.Buffers.Iterator()
{
  return &type metadata for CMBufferQueueRef.Buffers.Iterator;
}

uint64_t specialized _copySequenceToContiguousArray<A>(_:)(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t *v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  _QWORD *v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  const void *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (a1 >> 62)
    goto LABEL_28;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (v2)
  {
    while (1)
    {
      v4 = a1 & 0xC000000000000001;
      if ((a1 & 0xC000000000000001) == 0
        && (unint64_t)(v2 - 1) >= *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
LABEL_37:
        __break(1u);
        return result;
      }
      v5 = 0;
      v6 = 0;
      v7 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v8 = (uint64_t *)(MEMORY[0x1E0DEE9D8] + 32);
      v26 = v2;
      while (v4)
      {
        v9 = MEMORY[0x1BCCB998C](v6, a1);
        if (!v5)
          goto LABEL_12;
LABEL_8:
        v10 = __OFSUB__(v5--, 1);
        if (v10)
          goto LABEL_26;
LABEL_24:
        ++v6;
        *v8++ = v9;
        if (v2 == v6)
          goto LABEL_32;
      }
      v9 = *(_QWORD *)(a1 + 8 * v6 + 32);
      swift_unknownObjectRetain();
      if (v5)
        goto LABEL_8;
LABEL_12:
      v11 = v7[3];
      if ((uint64_t)((v11 >> 1) + 0x4000000000000000) < 0)
        goto LABEL_27;
      v12 = v4;
      v13 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if (v13 <= 1)
        v14 = 1;
      else
        v14 = v13;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
      v15 = (_QWORD *)swift_allocObject();
      v16 = _swift_stdlib_malloc_size(v15);
      v17 = v16 - 32;
      if (v16 < 32)
        v17 = v16 - 25;
      v18 = v17 >> 3;
      v15[2] = v14;
      v15[3] = (2 * (v17 >> 3)) | 1;
      v19 = (unint64_t)(v15 + 4);
      v20 = v7[3] >> 1;
      if (v7[2])
      {
        v21 = v7 + 4;
        if (v15 != v7 || v19 >= (unint64_t)v21 + 8 * v20)
          memmove(v15 + 4, v21, 8 * v20);
        v7[2] = 0;
      }
      v8 = (uint64_t *)(v19 + 8 * v20);
      v22 = (v18 & 0x7FFFFFFFFFFFFFFFLL) - v20;
      swift_release();
      v7 = v15;
      v4 = v12;
      v2 = v26;
      v10 = __OFSUB__(v22, 1);
      v5 = v22 - 1;
      if (!v10)
        goto LABEL_24;
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      swift_bridgeObjectRetain();
      if (!_CocoaArrayWrapper.endIndex.getter())
        break;
      swift_bridgeObjectRetain();
      v2 = _CocoaArrayWrapper.endIndex.getter();
      result = swift_bridgeObjectRelease();
      if (v2 < 1)
      {
        __break(1u);
        break;
      }
    }
  }
  v5 = 0;
  v7 = (_QWORD *)MEMORY[0x1E0DEE9D8];
LABEL_32:
  result = swift_bridgeObjectRelease();
  v23 = v7[3];
  if (v23 >= 2)
  {
    v24 = v23 >> 1;
    v10 = __OFSUB__(v24, v5);
    v25 = v24 - v5;
    if (v10)
      goto LABEL_37;
    v7[2] = v25;
  }
  return (uint64_t)v7;
}

{
  uint64_t v2;
  uint64_t result;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  id v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  _QWORD *v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  const void *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (a1 >> 62)
    goto LABEL_28;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (v2)
  {
    while (1)
    {
      v4 = a1 & 0xC000000000000001;
      if ((a1 & 0xC000000000000001) == 0
        && (unint64_t)(v2 - 1) >= *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
LABEL_37:
        __break(1u);
        return result;
      }
      v5 = 0;
      v6 = 0;
      v7 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v8 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      v26 = v2;
      while (v4)
      {
        v9 = (id)MEMORY[0x1BCCB998C](v6, a1);
        if (!v5)
          goto LABEL_12;
LABEL_8:
        v10 = __OFSUB__(v5--, 1);
        if (v10)
          goto LABEL_26;
LABEL_24:
        ++v6;
        *v8++ = v9;
        if (v2 == v6)
          goto LABEL_32;
      }
      v9 = *(id *)(a1 + 8 * v6 + 32);
      if (v5)
        goto LABEL_8;
LABEL_12:
      v11 = v7[3];
      if ((uint64_t)((v11 >> 1) + 0x4000000000000000) < 0)
        goto LABEL_27;
      v12 = v4;
      v13 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if (v13 <= 1)
        v14 = 1;
      else
        v14 = v13;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
      v15 = (_QWORD *)swift_allocObject();
      v16 = _swift_stdlib_malloc_size(v15);
      v17 = v16 - 32;
      if (v16 < 32)
        v17 = v16 - 25;
      v18 = v17 >> 3;
      v15[2] = v14;
      v15[3] = (2 * (v17 >> 3)) | 1;
      v19 = (unint64_t)(v15 + 4);
      v20 = v7[3] >> 1;
      if (v7[2])
      {
        v21 = v7 + 4;
        if (v15 != v7 || v19 >= (unint64_t)v21 + 8 * v20)
          memmove(v15 + 4, v21, 8 * v20);
        v7[2] = 0;
      }
      v8 = (_QWORD *)(v19 + 8 * v20);
      v22 = (v18 & 0x7FFFFFFFFFFFFFFFLL) - v20;
      swift_release();
      v7 = v15;
      v4 = v12;
      v2 = v26;
      v10 = __OFSUB__(v22, 1);
      v5 = v22 - 1;
      if (!v10)
        goto LABEL_24;
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      swift_bridgeObjectRetain();
      if (!_CocoaArrayWrapper.endIndex.getter())
        break;
      swift_bridgeObjectRetain();
      v2 = _CocoaArrayWrapper.endIndex.getter();
      result = swift_bridgeObjectRelease();
      if (v2 < 1)
      {
        __break(1u);
        break;
      }
    }
  }
  v5 = 0;
  v7 = (_QWORD *)MEMORY[0x1E0DEE9D8];
LABEL_32:
  result = swift_bridgeObjectRelease();
  v23 = v7[3];
  if (v23 >= 2)
  {
    v24 = v23 >> 1;
    v10 = __OFSUB__(v24, v5);
    v25 = v24 - v5;
    if (v10)
      goto LABEL_37;
    v7[2] = v25;
  }
  return (uint64_t)v7;
}

void specialized _copySequenceToContiguousArray<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD *v16;
  BOOL v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  _OWORD v35[2];
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  _QWORD v40[4];
  unint64_t v41;

  *(_QWORD *)&v37 = a1;
  *((_QWORD *)&v37 + 1) = a2;
  CMSampleBufferRef.PerSampleAttachmentsDictionary.makeIterator()(v40);
  v2 = 0;
  v3 = v40[0];
  v4 = v40[3];
  v33 = v40[1];
  v34 = (unint64_t)(v40[2] + 64) >> 6;
  v5 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v6 = v41;
  v7 = MEMORY[0x1E0DEE9D8] + 32;
  if (!v41)
    goto LABEL_3;
LABEL_2:
  v8 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  v9 = v8 | (v4 << 6);
  while (1)
  {
    v14 = *(void **)(*(_QWORD *)(v3 + 48) + 8 * v9);
    *(_QWORD *)&v35[0] = v14;
    outlined init with copy of Any(*(_QWORD *)(v3 + 56) + 32 * v9, (uint64_t)v35 + 8);
    v37 = v35[0];
    v38 = v35[1];
    v39 = v36;
    if (v2)
    {
      v15 = v14;
      v16 = v5;
      v17 = __OFSUB__(v2--, 1);
      if (v17)
        goto LABEL_43;
    }
    else
    {
      v18 = v5[3];
      if ((uint64_t)((v18 >> 1) + 0x4000000000000000) < 0)
        goto LABEL_45;
      v19 = v18 & 0xFFFFFFFFFFFFFFFELL;
      if (v19 <= 1)
        v20 = 1;
      else
        v20 = v19;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(key: CMSampleBufferRef.PerSampleAttachmentsDictionary.Key, value: Any)>);
      v16 = (_QWORD *)swift_allocObject();
      v21 = (uint64_t)(_swift_stdlib_malloc_size(v16) - 32) / 40;
      v16[2] = v20;
      v16[3] = 2 * v21;
      v22 = v16 + 4;
      v23 = v5[3] >> 1;
      v7 = (uint64_t)&v16[5 * v23 + 4];
      v24 = (v21 & 0x7FFFFFFFFFFFFFFFLL) - v23;
      if (v5[2])
      {
        if (v16 != v5 || v22 >= &v5[5 * v23 + 4])
          memmove(v22, v5 + 4, 40 * v23);
        v26 = v14;
        v5[2] = 0;
      }
      else
      {
        v27 = v14;
      }
      swift_release();
      v17 = __OFSUB__(v24, 1);
      v2 = v24 - 1;
      if (v17)
      {
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    v28 = v37;
    v29 = v38;
    *(_QWORD *)(v7 + 32) = v39;
    *(_OWORD *)v7 = v28;
    *(_OWORD *)(v7 + 16) = v29;
    v7 += 40;
    v5 = v16;
    if (v6)
      goto LABEL_2;
LABEL_3:
    v10 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_44;
    if (v10 >= v34)
      goto LABEL_39;
    v11 = *(_QWORD *)(v33 + 8 * v10);
    v12 = v4 + 1;
    if (!v11)
    {
      v12 = v4 + 2;
      if (v4 + 2 >= v34)
        goto LABEL_39;
      v11 = *(_QWORD *)(v33 + 8 * v12);
      if (!v11)
      {
        v12 = v4 + 3;
        if (v4 + 3 >= v34)
          goto LABEL_39;
        v11 = *(_QWORD *)(v33 + 8 * v12);
        if (!v11)
        {
          v12 = v4 + 4;
          if (v4 + 4 >= v34)
            goto LABEL_39;
          v11 = *(_QWORD *)(v33 + 8 * v12);
          if (!v11)
          {
            v12 = v4 + 5;
            if (v4 + 5 >= v34)
              goto LABEL_39;
            v11 = *(_QWORD *)(v33 + 8 * v12);
            if (!v11)
              break;
          }
        }
      }
    }
LABEL_18:
    v6 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
    v4 = v12;
  }
  v13 = v4 + 6;
  while (v34 != v13)
  {
    v11 = *(_QWORD *)(v33 + 8 * v13++);
    if (v11)
    {
      v12 = v13 - 1;
      goto LABEL_18;
    }
  }
LABEL_39:
  outlined consume of [CMSampleBufferRef.PerSampleAttachmentsDictionary.Key : Any].Iterator._Variant();
  v30 = v5[3];
  if (v30 < 2)
    return;
  v31 = v30 >> 1;
  v17 = __OFSUB__(v31, v2);
  v32 = v31 - v2;
  if (!v17)
  {
    v5[2] = v32;
    return;
  }
LABEL_46:
  __break(1u);
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

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
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
  result = (uint64_t)memcpy((void *)(v3 + 8 * v7 + 32), (const void *)(v6 + 32), 8 * v2);
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

uint64_t sub_1B8D1AE44()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #3 in closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  (*(void (**)(uint64_t *__return_ptr, uint64_t, _QWORD))(v1 + 44))(&v3, a1, *(_QWORD *)(v1 + 20));
  return v3;
}

uint64_t outlined init with take of String?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1B8D1AEC8()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #6 in closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:)(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 16))(a1, *(_QWORD *)(v1 + 28));
}

uint64_t sub_1B8D1AEE4()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #5 in closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(a1, a2, *(_QWORD *)(v2 + 28));
}

uint64_t sub_1B8D1AF00()
{
  return swift_deallocObject();
}

BOOL partial apply for closure #4 in closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:)(uint64_t a1)
{
  uint64_t v1;

  return (*(unsigned int (**)(uint64_t, _QWORD))(v1 + 16))(a1, *(_QWORD *)(v1 + 28)) != 0;
}

uint64_t sub_1B8D1AF34()
{
  return swift_deallocObject();
}

uint64_t sub_1B8D1AF48()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #2 in closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  (*(void (**)(uint64_t *__return_ptr, uint64_t, _QWORD))(v1 + 16))(&v3, a1, *(_QWORD *)(v1 + 28));
  return v3;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Int)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD))(v2 + 16))(*a1);
  *a2 = result;
  return result;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Swift.AnyObject) -> (@out Int)(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t *__return_ptr, uint64_t *);
  uint64_t v4;
  uint64_t v5;

  v2 = *(void (**)(uint64_t *__return_ptr, uint64_t *))(v1 + 16);
  v5 = a1;
  v2(&v4, &v5);
  return v4;
}

uint64_t sub_1B8D1AFF4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Swift.AnyObject, @in_guaranteed Swift.AnyObject) -> (@out CFComparisonResult)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(uint64_t *__return_ptr, uint64_t *, uint64_t *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t *))(v2 + 16);
  v6 = a2;
  v7 = a1;
  v3(&v5, &v7, &v6);
  return v5;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject, @guaranteed Swift.AnyObject) -> (@unowned CFComparisonResult)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD, _QWORD))(v3 + 16))(*a1, *a2);
  *a3 = result;
  return result;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Swift.AnyObject) -> (@out Bool)(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(unsigned __int8 *__return_ptr, uint64_t *);
  unsigned __int8 v4;
  uint64_t v5;

  v2 = *(void (**)(unsigned __int8 *__return_ptr, uint64_t *))(v1 + 16);
  v5 = a1;
  v2(&v4, &v5);
  return v4;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD))(v2 + 16))(*a1);
  *a2 = result & 1;
  return result;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Swift.AnyObject) -> (@out CMTime)(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t *__return_ptr, uint64_t *);
  uint64_t v4;
  uint64_t v5;

  v2 = *(void (**)(uint64_t *__return_ptr, uint64_t *))(v1 + 16);
  v5 = a1;
  v2(&v4, &v5);
  return v4;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned CMTime)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  int v5;
  int v6;
  uint64_t v7;

  result = (*(uint64_t (**)(_QWORD))(v2 + 16))(*a1);
  *(_QWORD *)a2 = result;
  *(_DWORD *)(a2 + 8) = v5;
  *(_DWORD *)(a2 + 12) = v6;
  *(_QWORD *)(a2 + 16) = v7;
  return result;
}

uint64_t specialized Collection.count.getter(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  v2 = specialized Dictionary.startIndex.getter(a1);
  v4 = v3;
  v6 = v5;
  if ((a1 & 0xC000000000000001) != 0)
  {
    v7 = __CocoaDictionary.endIndex.getter();
    v9 = v8;
  }
  else
  {
    v7 = 1 << *(_BYTE *)(a1 + 32);
    v9 = *(unsigned int *)(a1 + 36);
  }
  v10 = (a1 & 0xC000000000000001) != 0;
  v11 = v6 & 1;
  specialized Collection.distance(from:to:)(v2, v4, v11, v7, v9, v10, a1);
  v13 = v12;
  outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v7, v9, v10);
  outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v2, v4, v11);
  return v13;
}

uint64_t specialized Collection<>.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  __int128 v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;

  result = specialized Dictionary.startIndex.getter(a2);
  v9 = result;
  v10 = v7;
  v11 = v8;
  if ((a2 & 0xC000000000000001) != 0)
  {
    result = __CocoaDictionary.endIndex.getter();
    if ((v11 & 1) != 0)
    {
      v13 = result;
      v14 = v12;
      result = MEMORY[0x1BCCB9A40]();
      if ((result & 1) == 0)
      {
LABEL_4:
        *(_QWORD *)&v16 = v9;
        *((_QWORD *)&v16 + 1) = v10;
        v15 = v11 & 1;
        v17 = v15;
        v18 = v13;
        v19 = v14;
        v20 = (a2 & 0xC000000000000001) != 0;
        specialized Collection._failEarlyRangeCheck(_:bounds:)((__int128 *)a1, &v16);
        outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v9, v10, v15);
        outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v13, v14, (a2 & 0xC000000000000001) != 0);
        *(_QWORD *)(a3 + 48) = a2;
        *(_OWORD *)a3 = *(_OWORD *)a1;
        *(_BYTE *)(a3 + 16) = *(_BYTE *)(a1 + 16);
        *(_OWORD *)(a3 + 24) = *(_OWORD *)(a1 + 24);
        *(_BYTE *)(a3 + 40) = *(_BYTE *)(a1 + 40);
        swift_bridgeObjectRetain();
        return outlined retain of Range<CMFormatDescriptionRef.Extensions.Index>(a1);
      }
      goto LABEL_8;
    }
  }
  else if ((v8 & 1) == 0)
  {
    v14 = *(unsigned int *)(a2 + 36);
    if ((_DWORD)v14 != (_DWORD)v7)
    {
LABEL_9:
      __break(1u);
      goto LABEL_10;
    }
    v13 = 1 << *(_BYTE *)(a2 + 32);
    if (v13 >= result)
      goto LABEL_4;
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t specialized Collection<>.indices.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a2 = a1;
  *(_QWORD *)(a2 + 8) = specialized Dictionary.startIndex.getter(a1);
  *(_QWORD *)(a2 + 16) = v4;
  *(_BYTE *)(a2 + 24) = v5 & 1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    v6 = __CocoaDictionary.endIndex.getter();
  }
  else
  {
    v6 = 1 << *(_BYTE *)(a1 + 32);
    v7 = *(unsigned int *)(a1 + 36);
  }
  *(_QWORD *)(a2 + 32) = v6;
  *(_QWORD *)(a2 + 40) = v7;
  *(_BYTE *)(a2 + 48) = (a1 & 0xC000000000000001) != 0;
  return swift_bridgeObjectRetain();
}

uint64_t specialized Collection.isEmpty.getter(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  result = specialized Dictionary.startIndex.getter(a1);
  v5 = result;
  v6 = v3;
  v7 = v4;
  if ((a1 & 0xC000000000000001) != 0)
  {
    result = __CocoaDictionary.endIndex.getter();
    if ((v7 & 1) != 0)
    {
      v9 = result;
      v10 = v8;
      v11 = MEMORY[0x1BCCB9A4C](v5, v6, result, v8);
      outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v9, v10, 1);
      outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v5, v6, 1);
      return v11 & 1;
    }
  }
  else if ((v4 & 1) == 0)
  {
    if (*(_DWORD *)(a1 + 36) == (_DWORD)v3)
      return result == 1 << *(_BYTE *)(a1 + 32);
    __break(1u);
  }
  __break(1u);
  return result;
}

void specialized Collection.index(_:offsetBy:)(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v32;
  void *v33;

  if (a4 < 0)
    goto LABEL_37;
  v7 = a2;
  v8 = a1;
  v9 = a3 & 1;
  if (!a4)
  {
    outlined copy of [A : B].Index._Variant<A, B>(a1, a2, a3 & 1);
    v14 = v8;
LABEL_31:
    *(_QWORD *)a6 = v14;
    *(_QWORD *)(a6 + 8) = v7;
    *(_BYTE *)(a6 + 16) = v9;
    return;
  }
  v10 = a5;
  v11 = a5 & 0xC000000000000001;
  outlined copy of [A : B].Index._Variant<A, B>(a1, a2, a3 & 1);
  v12 = 0;
  v32 = v10 + 64;
  v13 = a4 - 1;
  v30 = v10 + 96;
  while (1)
  {
    if (v11)
    {
      if ((v9 & 1) == 0)
        goto LABEL_38;
      v14 = __CocoaDictionary.index(after:)();
      v17 = v16;
      v9 = 1;
      outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v8, v7, 1);
      v7 = v17;
      goto LABEL_6;
    }
    if ((v9 & 1) == 0)
    {
      if ((v8 & 0x8000000000000000) != 0)
        goto LABEL_34;
      v14 = 1 << *(_BYTE *)(v10 + 32);
      if ((uint64_t)v8 >= v14)
        goto LABEL_34;
      v24 = v8 >> 6;
      v25 = *(_QWORD *)(v32 + 8 * (v8 >> 6));
      if (((v25 >> v8) & 1) == 0)
        goto LABEL_35;
      if (*(_DWORD *)(v10 + 36) != (_DWORD)v7)
        goto LABEL_36;
      v26 = v25 & (-2 << (v8 & 0x3F));
      if (v26)
      {
        v14 = __clz(__rbit64(v26)) | v8 & 0xFFFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = v24 + 1;
        v28 = (unint64_t)(v14 + 63) >> 6;
        if (v24 + 1 < v28)
        {
          v29 = *(_QWORD *)(v32 + 8 * v27);
          if (!v29)
          {
            v27 = v24 + 2;
            if (v24 + 2 >= v28)
              goto LABEL_5;
            v29 = *(_QWORD *)(v32 + 8 * v27);
            if (!v29)
            {
              v27 = v24 + 3;
              if (v24 + 3 >= v28)
                goto LABEL_5;
              v29 = *(_QWORD *)(v32 + 8 * v27);
              if (!v29)
              {
                while (v28 - 4 != v24)
                {
                  v29 = *(_QWORD *)(v30 + 8 * v24++);
                  if (v29)
                  {
                    outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v8, v7, 0);
                    v27 = v24 + 3;
                    goto LABEL_21;
                  }
                }
                outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v8, v7, 0);
                goto LABEL_5;
              }
            }
          }
LABEL_21:
          v14 = __clz(__rbit64(v29)) + (v27 << 6);
        }
      }
LABEL_5:
      v9 = 0;
      v7 = v7;
      goto LABEL_6;
    }
    if (__CocoaDictionary.Index.age.getter() != *(_DWORD *)(v10 + 36))
      break;
    __CocoaDictionary.Index.key.getter();
    outlined copy of [A : B].Index._Variant<A, B>(v8, v7, 1);
    type metadata accessor for CFStringRef(0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    swift_unknownObjectRelease();
    v18 = v10;
    specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v33);
    v20 = v19;

    if ((v20 & 1) == 0)
      goto LABEL_33;
    __CocoaDictionary.Index.dictionary.getter();
    v14 = __CocoaDictionary.index(after:)();
    v21 = v13;
    v23 = v22;
    v9 = 1;
    outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v8, v7, 1);
    swift_unknownObjectRelease();
    outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v8, v7, 1);
    v7 = v23;
    v13 = v21;
    v10 = v18;
LABEL_6:
    v8 = v14;
    if (v12++ == v13)
      goto LABEL_31;
  }
  __break(1u);
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
LABEL_38:
  __break(1u);
}

void specialized Collection.index(_:offsetBy:limitedBy:)(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v32;
  uint64_t v33;
  unint64_t v34;
  void *v36;

  if (a4 < 0)
    goto LABEL_47;
  v13 = a2;
  v14 = a1;
  v15 = a3 & 1;
  outlined copy of [A : B].Index._Variant<A, B>(a1, a2, a3 & 1);
  if (!a4)
  {
    v17 = v14;
LABEL_38:
    *(_QWORD *)a9 = v17;
    *(_QWORD *)(a9 + 8) = v13;
    *(_BYTE *)(a9 + 16) = v15;
    return;
  }
  v16 = 0;
  v33 = a8 + 64;
  v34 = a8 & 0xC000000000000001;
  v32 = a7;
  while (1)
  {
    if (v15)
    {
      if ((a7 & 1) == 0)
        goto LABEL_48;
      if ((MEMORY[0x1BCCB9A4C](v14, v13, a5, a6) & 1) != 0)
      {
        a5 = v14;
LABEL_40:
        outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(a5, v13, v15);
        *(_QWORD *)a9 = 0;
        *(_QWORD *)(a9 + 8) = 0;
        *(_BYTE *)(a9 + 16) = -1;
        return;
      }
      if (v34)
      {
        v17 = __CocoaDictionary.index(after:)();
        v19 = v18;
        outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v14, v13, 1);
        v13 = v19;
      }
      else
      {
        if (__CocoaDictionary.Index.age.getter() != *(_DWORD *)(a8 + 36))
          goto LABEL_45;
        __CocoaDictionary.Index.key.getter();
        outlined copy of [A : B].Index._Variant<A, B>(v14, v13, 1);
        type metadata accessor for CFStringRef(0);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        swift_unknownObjectRelease();
        specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v36);
        v21 = v20;

        if ((v21 & 1) == 0)
          goto LABEL_46;
        __CocoaDictionary.Index.dictionary.getter();
        v17 = __CocoaDictionary.index(after:)();
        v23 = v22;
        outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v14, v13, 1);
        swift_unknownObjectRelease();
        outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v14, v13, 1);
        v13 = v23;
        a7 = v32;
      }
      goto LABEL_5;
    }
    if ((a7 & 1) != 0)
      goto LABEL_48;
    if ((_DWORD)v13 != (_DWORD)a6)
      break;
    if (v14 == a5)
      goto LABEL_40;
    if (v34)
      goto LABEL_49;
    if ((v14 & 0x8000000000000000) != 0)
      goto LABEL_42;
    v17 = 1 << *(_BYTE *)(a8 + 32);
    if ((uint64_t)v14 >= v17)
      goto LABEL_42;
    v24 = v14 >> 6;
    v25 = *(_QWORD *)(v33 + 8 * (v14 >> 6));
    if (((v25 >> v14) & 1) == 0)
      goto LABEL_43;
    if (*(_DWORD *)(a8 + 36) != (_DWORD)v13)
      goto LABEL_44;
    v26 = v25 & (-2 << (v14 & 0x3F));
    if (!v26)
    {
      v27 = v24 + 1;
      v28 = (unint64_t)(v17 + 63) >> 6;
      if (v24 + 1 >= v28)
      {
        outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v14, v13, 0);
        v13 = v13;
        goto LABEL_5;
      }
      v29 = *(_QWORD *)(v33 + 8 * v27);
      if (v29)
      {
LABEL_25:
        outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v14, v13, 0);
        v17 = __clz(__rbit64(v29)) | (v27 << 6);
      }
      else
      {
        v27 = v24 + 2;
        if (v24 + 2 < v28)
        {
          v29 = *(_QWORD *)(v33 + 8 * v27);
          if (v29)
            goto LABEL_25;
          v27 = v24 + 3;
          if (v24 + 3 < v28)
          {
            v29 = *(_QWORD *)(v33 + 8 * v27);
            if (v29)
              goto LABEL_25;
            v30 = v28 - 4;
            while (v30 != v24)
            {
              v29 = *(_QWORD *)(a8 + 96 + 8 * v24++);
              if (v29)
              {
                v27 = v24 + 3;
                goto LABEL_25;
              }
            }
          }
        }
        outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v14, v13, 0);
      }
      a7 = v32;
      v13 = v13;
      goto LABEL_5;
    }
    outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v14, v13, 0);
    v17 = __clz(__rbit64(v26)) | v14 & 0xFFFFFFFFFFFFFFC0;
    v13 = v13;
LABEL_5:
    ++v16;
    v14 = v17;
    if (v16 == a4)
      goto LABEL_38;
  }
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
}

void specialized Collection.distance(from:to:)(int64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  char v8;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  char v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  void *v33;

  v8 = a6;
  v12 = a2;
  v13 = a1;
  if ((a6 & 1) != 0)
  {
    if ((a3 & 1) == 0)
      goto LABEL_57;
    if ((MEMORY[0x1BCCB9A40](a4, a5, a1, a2) & 1) != 0)
      goto LABEL_53;
    v30 = MEMORY[0x1BCCB9A4C](v13, v12, a4, a5);
    outlined copy of [A : B].Index._Variant<A, B>(v13, v12, 1);
    if ((v30 & 1) == 0)
      goto LABEL_6;
LABEL_43:
    outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v13, v12, a3 & 1);
    return;
  }
  if ((a3 & 1) != 0)
    goto LABEL_57;
  if (a4 < a1)
    goto LABEL_52;
  if ((_DWORD)a5 != (_DWORD)a2)
    goto LABEL_54;
  if (a1 == a4)
    goto LABEL_43;
LABEL_6:
  v14 = a3 & 1;
  v32 = a7 + 64;
  v15 = 1;
  v31 = v8;
  do
  {
    if ((a7 & 0xC000000000000001) != 0)
    {
      if ((v14 & 1) == 0)
        goto LABEL_56;
      v17 = __CocoaDictionary.index(after:)();
      v19 = v18;
LABEL_15:
      outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v13, v12, 1);
      if ((v8 & 1) == 0)
        goto LABEL_55;
      v23 = MEMORY[0x1BCCB9A4C](v17, v19, a4, a5);
      v14 = 1;
      v12 = v19;
      if ((v23 & 1) != 0)
        goto LABEL_44;
      goto LABEL_7;
    }
    if ((v14 & 1) != 0)
    {
      if (__CocoaDictionary.Index.age.getter() != *(_DWORD *)(a7 + 36))
        goto LABEL_46;
      __CocoaDictionary.Index.key.getter();
      outlined copy of [A : B].Index._Variant<A, B>(v13, v12, 1);
      type metadata accessor for CFStringRef(0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v33);
      v21 = v20;

      if ((v21 & 1) == 0)
        goto LABEL_48;
      __CocoaDictionary.Index.dictionary.getter();
      v17 = __CocoaDictionary.index(after:)();
      v19 = v22;
      outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v13, v12, 1);
      v8 = v31;
      swift_unknownObjectRelease();
      goto LABEL_15;
    }
    if ((v13 & 0x8000000000000000) != 0)
      goto LABEL_47;
    v17 = 1 << *(_BYTE *)(a7 + 32);
    if ((uint64_t)v13 >= v17)
      goto LABEL_47;
    v24 = v13 >> 6;
    v25 = *(_QWORD *)(v32 + 8 * (v13 >> 6));
    if (((v25 >> v13) & 1) == 0)
      goto LABEL_49;
    if (*(_DWORD *)(a7 + 36) != (_DWORD)v12)
      goto LABEL_50;
    v26 = v25 & (-2 << (v13 & 0x3F));
    if (!v26)
    {
      v27 = v24 + 1;
      v28 = (unint64_t)(v17 + 63) >> 6;
      if (v24 + 1 >= v28)
        goto LABEL_28;
      v29 = *(_QWORD *)(v32 + 8 * v27);
      if (!v29)
      {
        v27 = v24 + 2;
        if (v24 + 2 >= v28)
          goto LABEL_27;
        v29 = *(_QWORD *)(v32 + 8 * v27);
        if (!v29)
        {
          v27 = v24 + 3;
          if (v24 + 3 >= v28)
            goto LABEL_27;
          v29 = *(_QWORD *)(v32 + 8 * v27);
          if (!v29)
          {
            while (v28 - 4 != v24)
            {
              v29 = *(_QWORD *)(a7 + 96 + 8 * v24++);
              if (v29)
              {
                outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v13, v12, 0);
                v27 = v24 + 3;
                goto LABEL_26;
              }
            }
            outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v13, v12, 0);
            goto LABEL_27;
          }
        }
      }
LABEL_26:
      v17 = __clz(__rbit64(v29)) + (v27 << 6);
LABEL_27:
      v8 = v31;
      goto LABEL_28;
    }
    v17 = __clz(__rbit64(v26)) | v13 & 0xFFFFFFFFFFFFFFC0;
LABEL_28:
    if ((v8 & 1) != 0)
      goto LABEL_55;
    if ((_DWORD)a5 != (_DWORD)v12)
      goto LABEL_51;
    v14 = 0;
    v12 = v12;
    if (v17 == a4)
    {
      v19 = v12;
      v17 = a4;
LABEL_44:
      outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v17, v19, v14);
      return;
    }
LABEL_7:
    v13 = v17;
  }
  while (!__OFADD__(v15++, 1));
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
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
}

uint64_t specialized _CMFormatDescriptionFourCCConvertible.description.getter(unsigned int a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  Swift::String v7;
  Swift::String v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = type metadata accessor for String.Encoding();
  MEMORY[0x1E0C80A78](v2);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1B8D311D0;
  *(_BYTE *)(v3 + 32) = HIBYTE(a1);
  *(_BYTE *)(v3 + 33) = BYTE2(a1);
  *(_BYTE *)(v3 + 34) = BYTE1(a1);
  *(_BYTE *)(v3 + 35) = a1;
  if (isprint(HIBYTE(a1)) && isprint(BYTE2(a1)) && isprint(BYTE1(a1)) && isprint(a1))
  {
    static String.Encoding.utf8.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
    lazy protocol witness table accessor for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type [UInt8] and conformance [A], &demangling cache variable for type metadata for [UInt8], MEMORY[0x1E0DEAF38]);
    v4 = String.init<A>(bytes:encoding:)();
    v6 = v5;
    swift_bridgeObjectRelease();
    if (v6)
    {
      v7._countAndFlagsBits = v4;
      v7._object = v6;
      String.append(_:)(v7);
      swift_bridgeObjectRelease();
      v8._countAndFlagsBits = 39;
      v8._object = (void *)0xE100000000000000;
      String.append(_:)(v8);
      return 39;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  v10 = swift_allocObject();
  v11 = MEMORY[0x1E0DEE0F8];
  *(_OWORD *)(v10 + 16) = xmmword_1B8D30590;
  v12 = MEMORY[0x1E0DEE168];
  *(_QWORD *)(v10 + 56) = v11;
  *(_QWORD *)(v10 + 64) = v12;
  *(_DWORD *)(v10 + 32) = a1;
  return String.init(format:_:)();
}

uint64_t _CMFormatDescriptionFourCCConvertible.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  unsigned int v2;
  unsigned __int8 v3;
  unsigned int v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  Swift::String v11;
  Swift::String v12;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];
  uint64_t v17;
  unint64_t v18;

  v0 = type metadata accessor for String.Encoding();
  MEMORY[0x1E0C80A78](v0);
  v16[1] = (char *)v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch thunk of RawRepresentable.rawValue.getter();
  v2 = BYTE3(v17);
  dispatch thunk of RawRepresentable.rawValue.getter();
  v3 = BYTE2(v17);
  v4 = WORD1(v17);
  dispatch thunk of RawRepresentable.rawValue.getter();
  v5 = BYTE1(v17);
  dispatch thunk of RawRepresentable.rawValue.getter();
  v6 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1B8D311D0;
  *(_BYTE *)(v7 + 32) = v2;
  *(_BYTE *)(v7 + 33) = v4;
  *(_BYTE *)(v7 + 34) = v5;
  *(_BYTE *)(v7 + 35) = v6;
  if (isprint(v2) && isprint(v3) && isprint(v5) && isprint(v6))
  {
    v17 = v7;
    static String.Encoding.utf8.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
    lazy protocol witness table accessor for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type [UInt8] and conformance [A], &demangling cache variable for type metadata for [UInt8], MEMORY[0x1E0DEAF38]);
    v8 = String.init<A>(bytes:encoding:)();
    v10 = v9;
    swift_bridgeObjectRelease();
    if (v10)
    {
      v17 = 39;
      v18 = 0xE100000000000000;
      v11._countAndFlagsBits = v8;
      v11._object = v10;
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      v12._countAndFlagsBits = 39;
      v12._object = (void *)0xE100000000000000;
      String.append(_:)(v12);
      return v17;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1B8D30590;
  v15 = MEMORY[0x1E0DEE168];
  *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEE0F8];
  *(_QWORD *)(v14 + 64) = v15;
  dispatch thunk of RawRepresentable.rawValue.getter();
  return String.init(format:_:)();
}

uint64_t CMFormatDescriptionRef.MediaType.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

id CMFormatDescriptionRef.Extensions.Key.rawValue.getter()
{
  id *v0;

  return *v0;
}

void CMFormatDescriptionRef.Extensions.Key.rawValue.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*CMFormatDescriptionRef.Extensions.Key.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

uint64_t CMFormatDescriptionRef.Extensions.Key.init(rawValue:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

id one-time initialization function for originalCompressionSettings()
{
  static CMFormatDescriptionRef.Extensions.Key.originalCompressionSettings = *MEMORY[0x1E0CA2228];
  return (id)static CMFormatDescriptionRef.Extensions.Key.originalCompressionSettings;
}

id static CMFormatDescriptionRef.Extensions.Key.originalCompressionSettings.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for originalCompressionSettings, (void **)&static CMFormatDescriptionRef.Extensions.Key.originalCompressionSettings, a1);
}

id one-time initialization function for sampleDescriptionExtensionAtoms()
{
  static CMFormatDescriptionRef.Extensions.Key.sampleDescriptionExtensionAtoms = *MEMORY[0x1E0CA2240];
  return (id)static CMFormatDescriptionRef.Extensions.Key.sampleDescriptionExtensionAtoms;
}

id static CMFormatDescriptionRef.Extensions.Key.sampleDescriptionExtensionAtoms.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for sampleDescriptionExtensionAtoms, (void **)&static CMFormatDescriptionRef.Extensions.Key.sampleDescriptionExtensionAtoms, a1);
}

id one-time initialization function for verbatimSampleDescription()
{
  static CMFormatDescriptionRef.Extensions.Key.verbatimSampleDescription = *MEMORY[0x1E0CA2278];
  return (id)static CMFormatDescriptionRef.Extensions.Key.verbatimSampleDescription;
}

id static CMFormatDescriptionRef.Extensions.Key.verbatimSampleDescription.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for verbatimSampleDescription, (void **)&static CMFormatDescriptionRef.Extensions.Key.verbatimSampleDescription, a1);
}

id one-time initialization function for verbatimISOSampleEntry()
{
  static CMFormatDescriptionRef.Extensions.Key.verbatimISOSampleEntry = *MEMORY[0x1E0CA2270];
  return (id)static CMFormatDescriptionRef.Extensions.Key.verbatimISOSampleEntry;
}

id static CMFormatDescriptionRef.Extensions.Key.verbatimISOSampleEntry.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for verbatimISOSampleEntry, (void **)&static CMFormatDescriptionRef.Extensions.Key.verbatimISOSampleEntry, a1);
}

id one-time initialization function for formatName()
{
  static CMFormatDescriptionRef.Extensions.Key.formatName = *MEMORY[0x1E0CA21C8];
  return (id)static CMFormatDescriptionRef.Extensions.Key.formatName;
}

id static CMFormatDescriptionRef.Extensions.Key.formatName.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for formatName, (void **)&static CMFormatDescriptionRef.Extensions.Key.formatName, a1);
}

id one-time initialization function for depth()
{
  static CMFormatDescriptionRef.Extensions.Key.depth = *MEMORY[0x1E0CA21B0];
  return (id)static CMFormatDescriptionRef.Extensions.Key.depth;
}

id static CMFormatDescriptionRef.Extensions.Key.depth.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for depth, (void **)&static CMFormatDescriptionRef.Extensions.Key.depth, a1);
}

id one-time initialization function for cleanAperture()
{
  static CMFormatDescriptionRef.Extensions.Key.cleanAperture = *MEMORY[0x1E0CA2180];
  return (id)static CMFormatDescriptionRef.Extensions.Key.cleanAperture;
}

id static CMFormatDescriptionRef.Extensions.Key.cleanAperture.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for cleanAperture, (void **)&static CMFormatDescriptionRef.Extensions.Key.cleanAperture, a1);
}

id one-time initialization function for fieldCount()
{
  static CMFormatDescriptionRef.Extensions.Key.fieldCount = *MEMORY[0x1E0CA21B8];
  return (id)static CMFormatDescriptionRef.Extensions.Key.fieldCount;
}

id static CMFormatDescriptionRef.Extensions.Key.fieldCount.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for fieldCount, (void **)&static CMFormatDescriptionRef.Extensions.Key.fieldCount, a1);
}

id one-time initialization function for fieldDetail()
{
  static CMFormatDescriptionRef.Extensions.Key.fieldDetail = *MEMORY[0x1E0CA21C0];
  return (id)static CMFormatDescriptionRef.Extensions.Key.fieldDetail;
}

id static CMFormatDescriptionRef.Extensions.Key.fieldDetail.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for fieldDetail, (void **)&static CMFormatDescriptionRef.Extensions.Key.fieldDetail, a1);
}

id one-time initialization function for pixelAspectRatio()
{
  static CMFormatDescriptionRef.Extensions.Key.pixelAspectRatio = *MEMORY[0x1E0CA2230];
  return (id)static CMFormatDescriptionRef.Extensions.Key.pixelAspectRatio;
}

id static CMFormatDescriptionRef.Extensions.Key.pixelAspectRatio.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for pixelAspectRatio, (void **)&static CMFormatDescriptionRef.Extensions.Key.pixelAspectRatio, a1);
}

id one-time initialization function for colorPrimaries()
{
  static CMFormatDescriptionRef.Extensions.Key.colorPrimaries = *MEMORY[0x1E0CA2188];
  return (id)static CMFormatDescriptionRef.Extensions.Key.colorPrimaries;
}

id static CMFormatDescriptionRef.Extensions.Key.colorPrimaries.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for colorPrimaries, (void **)&static CMFormatDescriptionRef.Extensions.Key.colorPrimaries, a1);
}

id one-time initialization function for transferFunction()
{
  static CMFormatDescriptionRef.Extensions.Key.transferFunction = *MEMORY[0x1E0CA2260];
  return (id)static CMFormatDescriptionRef.Extensions.Key.transferFunction;
}

id static CMFormatDescriptionRef.Extensions.Key.transferFunction.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for transferFunction, (void **)&static CMFormatDescriptionRef.Extensions.Key.transferFunction, a1);
}

id one-time initialization function for gammaLevel()
{
  static CMFormatDescriptionRef.Extensions.Key.gammaLevel = *MEMORY[0x1E0CA21D8];
  return (id)static CMFormatDescriptionRef.Extensions.Key.gammaLevel;
}

id static CMFormatDescriptionRef.Extensions.Key.gammaLevel.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for gammaLevel, (void **)&static CMFormatDescriptionRef.Extensions.Key.gammaLevel, a1);
}

id one-time initialization function for yCbCrMatrix()
{
  static CMFormatDescriptionRef.Extensions.Key.yCbCrMatrix = *MEMORY[0x1E0CA2288];
  return (id)static CMFormatDescriptionRef.Extensions.Key.yCbCrMatrix;
}

id static CMFormatDescriptionRef.Extensions.Key.yCbCrMatrix.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for yCbCrMatrix, (void **)&static CMFormatDescriptionRef.Extensions.Key.yCbCrMatrix, a1);
}

id one-time initialization function for fullRangeVideo()
{
  static CMFormatDescriptionRef.Extensions.Key.fullRangeVideo = *MEMORY[0x1E0CA21D0];
  return (id)static CMFormatDescriptionRef.Extensions.Key.fullRangeVideo;
}

id static CMFormatDescriptionRef.Extensions.Key.fullRangeVideo.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for fullRangeVideo, (void **)&static CMFormatDescriptionRef.Extensions.Key.fullRangeVideo, a1);
}

id one-time initialization function for iccProfile()
{
  static CMFormatDescriptionRef.Extensions.Key.iccProfile = *MEMORY[0x1E0CA2210];
  return (id)static CMFormatDescriptionRef.Extensions.Key.iccProfile;
}

id static CMFormatDescriptionRef.Extensions.Key.iccProfile.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for iccProfile, (void **)&static CMFormatDescriptionRef.Extensions.Key.iccProfile, a1);
}

id one-time initialization function for bytesPerRow()
{
  static CMFormatDescriptionRef.Extensions.Key.bytesPerRow = *MEMORY[0x1E0CA2168];
  return (id)static CMFormatDescriptionRef.Extensions.Key.bytesPerRow;
}

id static CMFormatDescriptionRef.Extensions.Key.bytesPerRow.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for bytesPerRow, (void **)&static CMFormatDescriptionRef.Extensions.Key.bytesPerRow, a1);
}

id one-time initialization function for chromaLocationTopField()
{
  static CMFormatDescriptionRef.Extensions.Key.chromaLocationTopField = *MEMORY[0x1E0CA2178];
  return (id)static CMFormatDescriptionRef.Extensions.Key.chromaLocationTopField;
}

id static CMFormatDescriptionRef.Extensions.Key.chromaLocationTopField.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for chromaLocationTopField, (void **)&static CMFormatDescriptionRef.Extensions.Key.chromaLocationTopField, a1);
}

id one-time initialization function for chromaLocationBottomField()
{
  static CMFormatDescriptionRef.Extensions.Key.chromaLocationBottomField = *MEMORY[0x1E0CA2170];
  return (id)static CMFormatDescriptionRef.Extensions.Key.chromaLocationBottomField;
}

id static CMFormatDescriptionRef.Extensions.Key.chromaLocationBottomField.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for chromaLocationBottomField, (void **)&static CMFormatDescriptionRef.Extensions.Key.chromaLocationBottomField, a1);
}

id one-time initialization function for conformsToMPEG2VideoProfile()
{
  static CMFormatDescriptionRef.Extensions.Key.conformsToMPEG2VideoProfile = *MEMORY[0x1E0CA2130];
  return (id)static CMFormatDescriptionRef.Extensions.Key.conformsToMPEG2VideoProfile;
}

id static CMFormatDescriptionRef.Extensions.Key.conformsToMPEG2VideoProfile.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for conformsToMPEG2VideoProfile, (void **)&static CMFormatDescriptionRef.Extensions.Key.conformsToMPEG2VideoProfile, a1);
}

id one-time initialization function for temporalQuality()
{
  static CMFormatDescriptionRef.Extensions.Key.temporalQuality = *MEMORY[0x1E0CA2258];
  return (id)static CMFormatDescriptionRef.Extensions.Key.temporalQuality;
}

id static CMFormatDescriptionRef.Extensions.Key.temporalQuality.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for temporalQuality, (void **)&static CMFormatDescriptionRef.Extensions.Key.temporalQuality, a1);
}

id one-time initialization function for spatialQuality()
{
  static CMFormatDescriptionRef.Extensions.Key.spatialQuality = *MEMORY[0x1E0CA2248];
  return (id)static CMFormatDescriptionRef.Extensions.Key.spatialQuality;
}

id static CMFormatDescriptionRef.Extensions.Key.spatialQuality.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for spatialQuality, (void **)&static CMFormatDescriptionRef.Extensions.Key.spatialQuality, a1);
}

id one-time initialization function for version()
{
  static CMFormatDescriptionRef.Extensions.Key.version = *MEMORY[0x1E0CA2280];
  return (id)static CMFormatDescriptionRef.Extensions.Key.version;
}

id static CMFormatDescriptionRef.Extensions.Key.version.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for version, (void **)&static CMFormatDescriptionRef.Extensions.Key.version, a1);
}

id one-time initialization function for revisionLevel()
{
  static CMFormatDescriptionRef.Extensions.Key.revisionLevel = *MEMORY[0x1E0CA2238];
  return (id)static CMFormatDescriptionRef.Extensions.Key.revisionLevel;
}

id static CMFormatDescriptionRef.Extensions.Key.revisionLevel.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for revisionLevel, (void **)&static CMFormatDescriptionRef.Extensions.Key.revisionLevel, a1);
}

id one-time initialization function for vendor()
{
  static CMFormatDescriptionRef.Extensions.Key.vendor = *MEMORY[0x1E0CA2268];
  return (id)static CMFormatDescriptionRef.Extensions.Key.vendor;
}

id static CMFormatDescriptionRef.Extensions.Key.vendor.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for vendor, (void **)&static CMFormatDescriptionRef.Extensions.Key.vendor, a1);
}

id one-time initialization function for masteringDisplayColorVolume()
{
  static CMFormatDescriptionRef.Extensions.Key.masteringDisplayColorVolume = *MEMORY[0x1E0CA2220];
  return (id)static CMFormatDescriptionRef.Extensions.Key.masteringDisplayColorVolume;
}

id static CMFormatDescriptionRef.Extensions.Key.masteringDisplayColorVolume.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for masteringDisplayColorVolume, (void **)&static CMFormatDescriptionRef.Extensions.Key.masteringDisplayColorVolume, a1);
}

id one-time initialization function for contentLightLevelInfo()
{
  static CMFormatDescriptionRef.Extensions.Key.contentLightLevelInfo = *MEMORY[0x1E0CA21A8];
  return (id)static CMFormatDescriptionRef.Extensions.Key.contentLightLevelInfo;
}

id static CMFormatDescriptionRef.Extensions.Key.contentLightLevelInfo.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for contentLightLevelInfo, (void **)&static CMFormatDescriptionRef.Extensions.Key.contentLightLevelInfo, a1);
}

id one-time initialization function for alternativeTransferCharacteristics()
{
  static CMFormatDescriptionRef.Extensions.Key.alternativeTransferCharacteristics = *MEMORY[0x1E0CA2148];
  return (id)static CMFormatDescriptionRef.Extensions.Key.alternativeTransferCharacteristics;
}

id static CMFormatDescriptionRef.Extensions.Key.alternativeTransferCharacteristics.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for alternativeTransferCharacteristics, (void **)&static CMFormatDescriptionRef.Extensions.Key.alternativeTransferCharacteristics, a1);
}

id one-time initialization function for auxiliaryTypeInfo()
{
  static CMFormatDescriptionRef.Extensions.Key.auxiliaryTypeInfo = *MEMORY[0x1E0CA2158];
  return (id)static CMFormatDescriptionRef.Extensions.Key.auxiliaryTypeInfo;
}

id static CMFormatDescriptionRef.Extensions.Key.auxiliaryTypeInfo.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for auxiliaryTypeInfo, (void **)&static CMFormatDescriptionRef.Extensions.Key.auxiliaryTypeInfo, a1);
}

id one-time initialization function for alphaChannelMode()
{
  static CMFormatDescriptionRef.Extensions.Key.alphaChannelMode = *MEMORY[0x1E0CA2140];
  return (id)static CMFormatDescriptionRef.Extensions.Key.alphaChannelMode;
}

id static CMFormatDescriptionRef.Extensions.Key.alphaChannelMode.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for alphaChannelMode, (void **)&static CMFormatDescriptionRef.Extensions.Key.alphaChannelMode, a1);
}

id one-time initialization function for containsAlphaChannel()
{
  static CMFormatDescriptionRef.Extensions.Key.containsAlphaChannel = *MEMORY[0x1E0CA2190];
  return (id)static CMFormatDescriptionRef.Extensions.Key.containsAlphaChannel;
}

id static CMFormatDescriptionRef.Extensions.Key.containsAlphaChannel.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for containsAlphaChannel, (void **)&static CMFormatDescriptionRef.Extensions.Key.containsAlphaChannel, a1);
}

id one-time initialization function for displayFlags()
{
  static CMFormatDescriptionRef.Extensions.Key.displayFlags = *MEMORY[0x1E0CA2890];
  return (id)static CMFormatDescriptionRef.Extensions.Key.displayFlags;
}

id static CMFormatDescriptionRef.Extensions.Key.displayFlags.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for displayFlags, (void **)&static CMFormatDescriptionRef.Extensions.Key.displayFlags, a1);
}

id one-time initialization function for backgroundColor()
{
  static CMFormatDescriptionRef.Extensions.Key.backgroundColor = *MEMORY[0x1E0CA2870];
  return (id)static CMFormatDescriptionRef.Extensions.Key.backgroundColor;
}

id static CMFormatDescriptionRef.Extensions.Key.backgroundColor.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for backgroundColor, (void **)&static CMFormatDescriptionRef.Extensions.Key.backgroundColor, a1);
}

id one-time initialization function for defaultTextBox()
{
  static CMFormatDescriptionRef.Extensions.Key.defaultTextBox = *MEMORY[0x1E0CA2888];
  return (id)static CMFormatDescriptionRef.Extensions.Key.defaultTextBox;
}

id static CMFormatDescriptionRef.Extensions.Key.defaultTextBox.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for defaultTextBox, (void **)&static CMFormatDescriptionRef.Extensions.Key.defaultTextBox, a1);
}

id one-time initialization function for defaultStyle()
{
  static CMFormatDescriptionRef.Extensions.Key.defaultStyle = *MEMORY[0x1E0CA2880];
  return (id)static CMFormatDescriptionRef.Extensions.Key.defaultStyle;
}

id static CMFormatDescriptionRef.Extensions.Key.defaultStyle.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for defaultStyle, (void **)&static CMFormatDescriptionRef.Extensions.Key.defaultStyle, a1);
}

id one-time initialization function for horizontalJustification()
{
  static CMFormatDescriptionRef.Extensions.Key.horizontalJustification = *MEMORY[0x1E0CA28A0];
  return (id)static CMFormatDescriptionRef.Extensions.Key.horizontalJustification;
}

id static CMFormatDescriptionRef.Extensions.Key.horizontalJustification.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for horizontalJustification, (void **)&static CMFormatDescriptionRef.Extensions.Key.horizontalJustification, a1);
}

id one-time initialization function for verticalJustification()
{
  static CMFormatDescriptionRef.Extensions.Key.verticalJustification = *MEMORY[0x1E0CA28B8];
  return (id)static CMFormatDescriptionRef.Extensions.Key.verticalJustification;
}

id static CMFormatDescriptionRef.Extensions.Key.verticalJustification.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for verticalJustification, (void **)&static CMFormatDescriptionRef.Extensions.Key.verticalJustification, a1);
}

id one-time initialization function for fontTable()
{
  static CMFormatDescriptionRef.Extensions.Key.fontTable = *MEMORY[0x1E0CA2898];
  return (id)static CMFormatDescriptionRef.Extensions.Key.fontTable;
}

id static CMFormatDescriptionRef.Extensions.Key.fontTable.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for fontTable, (void **)&static CMFormatDescriptionRef.Extensions.Key.fontTable, a1);
}

id one-time initialization function for textJustification()
{
  static CMFormatDescriptionRef.Extensions.Key.textJustification = *MEMORY[0x1E0CA28B0];
  return (id)static CMFormatDescriptionRef.Extensions.Key.textJustification;
}

id static CMFormatDescriptionRef.Extensions.Key.textJustification.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for textJustification, (void **)&static CMFormatDescriptionRef.Extensions.Key.textJustification, a1);
}

id one-time initialization function for defaultFontName()
{
  static CMFormatDescriptionRef.Extensions.Key.defaultFontName = *MEMORY[0x1E0CA2878];
  return (id)static CMFormatDescriptionRef.Extensions.Key.defaultFontName;
}

id static CMFormatDescriptionRef.Extensions.Key.defaultFontName.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for defaultFontName, (void **)&static CMFormatDescriptionRef.Extensions.Key.defaultFontName, a1);
}

id one-time initialization function for sourceReferenceName()
{
  static CMFormatDescriptionRef.Extensions.Key.sourceReferenceName = *MEMORY[0x1E0CA2DE8];
  return (id)static CMFormatDescriptionRef.Extensions.Key.sourceReferenceName;
}

id static CMFormatDescriptionRef.Extensions.Key.sourceReferenceName.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for sourceReferenceName, (void **)&static CMFormatDescriptionRef.Extensions.Key.sourceReferenceName, a1);
}

id one-time initialization function for metadataKeyTable()
{
  static CMFormatDescriptionRef.Extensions.Key.metadataKeyTable = *MEMORY[0x1E0CA2138];
  return (id)static CMFormatDescriptionRef.Extensions.Key.metadataKeyTable;
}

id static CMFormatDescriptionRef.Extensions.Key.metadataKeyTable.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for metadataKeyTable, (void **)&static CMFormatDescriptionRef.Extensions.Key.metadataKeyTable, a1);
}

id one-time initialization function for ambientViewingEnvironment()
{
  static CMFormatDescriptionRef.Extensions.Key.ambientViewingEnvironment = *MEMORY[0x1E0CA2150];
  return (id)static CMFormatDescriptionRef.Extensions.Key.ambientViewingEnvironment;
}

id static CMFormatDescriptionRef.Extensions.Key.ambientViewingEnvironment.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for ambientViewingEnvironment, (void **)&static CMFormatDescriptionRef.Extensions.Key.ambientViewingEnvironment, a1);
}

id one-time initialization function for bitsPerComponent()
{
  static CMFormatDescriptionRef.Extensions.Key.bitsPerComponent = *MEMORY[0x1E0CA2160];
  return (id)static CMFormatDescriptionRef.Extensions.Key.bitsPerComponent;
}

id static CMFormatDescriptionRef.Extensions.Key.bitsPerComponent.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for bitsPerComponent, (void **)&static CMFormatDescriptionRef.Extensions.Key.bitsPerComponent, a1);
}

uint64_t CMFormatDescriptionRef.Extensions.Value.propertyListRepresentation.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t CMFormatDescriptionRef.Extensions.Value.propertyListRepresentation.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_unknownObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.propertyListRepresentation.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

uint64_t CMFormatDescriptionRef.Extensions.Value.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.number<A>(_:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = _bridgeAnythingToObjectiveC<A>(_:)();
  *a1 = result;
  return result;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.string(_:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = MEMORY[0x1BCCB97B8]();
  *a1 = result;
  return result;
}

id static CMFormatDescriptionRef.Extensions.Value.data(_:)@<X0>(id a1@<X0>, id *a2@<X8>)
{
  *a2 = a1;
  return a1;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.cleanAperture<A, B, C, D>(width:height:horizontalOffet:verticalOffset:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, Class *a9@<X8>)
{
  uint64_t inited;
  void *v18;
  uint64_t *boxed_opaque_existential_0;
  void *v20;
  uint64_t *v21;
  void *v22;
  uint64_t *v23;
  void *v24;
  uint64_t *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  Class isa;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B8D311D0;
  v18 = (void *)*MEMORY[0x1E0CA22F0];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA22F0];
  *(_QWORD *)(inited + 64) = a5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 40));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 16))(boxed_opaque_existential_0, a1, a5);
  v20 = (void *)*MEMORY[0x1E0CA22C0];
  *(_QWORD *)(inited + 72) = *MEMORY[0x1E0CA22C0];
  *(_QWORD *)(inited + 104) = a6;
  v21 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 80));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 16))(v21, a2, a6);
  v22 = (void *)*MEMORY[0x1E0CA22D0];
  *(_QWORD *)(inited + 112) = *MEMORY[0x1E0CA22D0];
  *(_QWORD *)(inited + 144) = a7;
  v23 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 120));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a7 - 8) + 16))(v23, a3, a7);
  v24 = (void *)*MEMORY[0x1E0CA22E0];
  *(_QWORD *)(inited + 152) = *MEMORY[0x1E0CA22E0];
  *(_QWORD *)(inited + 184) = a8;
  v25 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 160));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a8 - 8) + 16))(v25, a4, a8);
  v26 = v18;
  v27 = v20;
  v28 = v22;
  v29 = v24;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  result = swift_bridgeObjectRelease();
  *a9 = isa;
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
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

uint64_t static CMFormatDescriptionRef.Extensions.Value.cleanAperture(width:height:horizontalOffet:verticalOffset:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, Class *a9@<X8>)
{
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t inited;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  Class isa;
  uint64_t result;
  void *v41;
  void *v42;

  v13 = (double)a1 / (double)a2;
  v14 = (double)a3 / (double)a4;
  v15 = (double)a5 / (double)a6;
  v16 = (double)a7 / (double)a8;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B8D311E0;
  v42 = (void *)*MEMORY[0x1E0CA22F0];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA22F0];
  v18 = MEMORY[0x1E0DEB070];
  *(double *)(inited + 40) = v13;
  v41 = (void *)*MEMORY[0x1E0CA22C0];
  v19 = *MEMORY[0x1E0CA22C0];
  *(_QWORD *)(inited + 64) = v18;
  *(_QWORD *)(inited + 72) = v19;
  *(double *)(inited + 80) = v14;
  v20 = (void *)*MEMORY[0x1E0CA22D0];
  *(_QWORD *)(inited + 104) = v18;
  *(_QWORD *)(inited + 112) = v20;
  *(double *)(inited + 120) = v15;
  v21 = (void *)*MEMORY[0x1E0CA22E0];
  *(_QWORD *)(inited + 144) = v18;
  *(_QWORD *)(inited + 152) = v21;
  *(double *)(inited + 160) = v16;
  v22 = (void *)*MEMORY[0x1E0CA22F8];
  *(_QWORD *)(inited + 184) = v18;
  *(_QWORD *)(inited + 192) = v22;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_1B8D311F0;
  *(_QWORD *)(v23 + 32) = a1;
  *(_QWORD *)(v23 + 40) = a2;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
  *(_QWORD *)(inited + 200) = v23;
  v25 = (void *)*MEMORY[0x1E0CA22C8];
  *(_QWORD *)(inited + 224) = v24;
  *(_QWORD *)(inited + 232) = v25;
  v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_1B8D311F0;
  *(_QWORD *)(v26 + 32) = a3;
  *(_QWORD *)(v26 + 40) = a4;
  *(_QWORD *)(inited + 240) = v26;
  v27 = (void *)*MEMORY[0x1E0CA22D8];
  *(_QWORD *)(inited + 264) = v24;
  *(_QWORD *)(inited + 272) = v27;
  v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_1B8D311F0;
  *(_QWORD *)(v28 + 32) = a5;
  *(_QWORD *)(v28 + 40) = a6;
  *(_QWORD *)(inited + 280) = v28;
  v29 = (void *)*MEMORY[0x1E0CA22E8];
  *(_QWORD *)(inited + 304) = v24;
  *(_QWORD *)(inited + 312) = v29;
  v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_1B8D311F0;
  *(_QWORD *)(v30 + 32) = a7;
  *(_QWORD *)(v30 + 40) = a8;
  *(_QWORD *)(inited + 344) = v24;
  *(_QWORD *)(inited + 320) = v30;
  v31 = v42;
  v32 = v41;
  v33 = v20;
  v34 = v21;
  v35 = v22;
  v36 = v25;
  v37 = v27;
  v38 = v29;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  result = swift_bridgeObjectRelease();
  *a9 = isa;
  return result;
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.FieldDetail.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

id one-time initialization function for temporalTopFirst()
{
  static CMFormatDescriptionRef.Extensions.Value.FieldDetail.temporalTopFirst = *MEMORY[0x1E0CA22A8];
  return (id)static CMFormatDescriptionRef.Extensions.Value.FieldDetail.temporalTopFirst;
}

id static CMFormatDescriptionRef.Extensions.Value.FieldDetail.temporalTopFirst.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for temporalTopFirst, (void **)&static CMFormatDescriptionRef.Extensions.Value.FieldDetail.temporalTopFirst, a1);
}

id one-time initialization function for temporalBottomFirst()
{
  static CMFormatDescriptionRef.Extensions.Value.FieldDetail.temporalBottomFirst = *MEMORY[0x1E0CA22A0];
  return (id)static CMFormatDescriptionRef.Extensions.Value.FieldDetail.temporalBottomFirst;
}

id static CMFormatDescriptionRef.Extensions.Value.FieldDetail.temporalBottomFirst.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for temporalBottomFirst, (void **)&static CMFormatDescriptionRef.Extensions.Value.FieldDetail.temporalBottomFirst, a1);
}

id one-time initialization function for spatialFirstLineEarly()
{
  static CMFormatDescriptionRef.Extensions.Value.FieldDetail.spatialFirstLineEarly = *MEMORY[0x1E0CA2290];
  return (id)static CMFormatDescriptionRef.Extensions.Value.FieldDetail.spatialFirstLineEarly;
}

id static CMFormatDescriptionRef.Extensions.Value.FieldDetail.spatialFirstLineEarly.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for spatialFirstLineEarly, (void **)&static CMFormatDescriptionRef.Extensions.Value.FieldDetail.spatialFirstLineEarly, a1);
}

id one-time initialization function for spatialFirstLineLate()
{
  static CMFormatDescriptionRef.Extensions.Value.FieldDetail.spatialFirstLineLate = *MEMORY[0x1E0CA2298];
  return (id)static CMFormatDescriptionRef.Extensions.Value.FieldDetail.spatialFirstLineLate;
}

id static CMFormatDescriptionRef.Extensions.Value.FieldDetail.spatialFirstLineLate.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for spatialFirstLineLate, (void **)&static CMFormatDescriptionRef.Extensions.Value.FieldDetail.spatialFirstLineLate, a1);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CMFormatDescriptionRef.Extensions.Key()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  Hasher.init(_seed:)();
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  v2 = v1;
  _CFObject.hash(into:)();

  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CMFormatDescriptionRef.Extensions.Key()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  v2 = v1;
  _CFObject.hash(into:)();

}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CMFormatDescriptionRef.Extensions.Key()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  Hasher.init(_seed:)();
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  v2 = v1;
  _CFObject.hash(into:)();

  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CMFormatDescriptionRef.Extensions.Key(void **a1, void **a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  char v6;

  v2 = *a1;
  v3 = *a2;
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  v4 = v2;
  v5 = v3;
  v6 = static _CFObject.== infix(_:_:)();

  return v6 & 1;
}

id static CMFormatDescriptionRef.Extensions.Value.fieldDetail(_:)@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = *a1;
  *a2 = v2;
  return v2;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.pixelAspectRatio<A, B>(horizontalSpacing:verticalSpacing:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, Class *a5@<X8>)
{
  uint64_t inited;
  void *v11;
  uint64_t *boxed_opaque_existential_0;
  void *v13;
  uint64_t *v14;
  id v15;
  id v16;
  Class isa;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B8D311F0;
  v11 = (void *)*MEMORY[0x1E0CA2300];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA2300];
  *(_QWORD *)(inited + 64) = a3;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 40));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))(boxed_opaque_existential_0, a1, a3);
  v13 = (void *)*MEMORY[0x1E0CA2308];
  *(_QWORD *)(inited + 72) = *MEMORY[0x1E0CA2308];
  *(_QWORD *)(inited + 104) = a4;
  v14 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 80));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 16))(v14, a2, a4);
  v15 = v11;
  v16 = v13;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  result = swift_bridgeObjectRelease();
  *a5 = isa;
  return result;
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

id one-time initialization function for itu_R_709_2()
{
  static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.itu_R_709_2 = *MEMORY[0x1E0CA2110];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.itu_R_709_2;
}

{
  static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_709_2 = *MEMORY[0x1E0CA2320];
  return (id)static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_709_2;
}

{
  static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_709_2 = *MEMORY[0x1E0CA2370];
  return (id)static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_709_2;
}

id static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.itu_R_709_2.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for itu_R_709_2, (void **)&static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.itu_R_709_2, a1);
}

id one-time initialization function for ebu_3213()
{
  static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.ebu_3213 = *MEMORY[0x1E0CA2100];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.ebu_3213;
}

id static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.ebu_3213.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for ebu_3213, (void **)&static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.ebu_3213, a1);
}

id one-time initialization function for smpte_C()
{
  static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.smpte_C = *MEMORY[0x1E0CA2128];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.smpte_C;
}

id static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.smpte_C.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for smpte_C, (void **)&static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.smpte_C, a1);
}

id one-time initialization function for dci_P3()
{
  static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.dci_P3 = *MEMORY[0x1E0CA20F8];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.dci_P3;
}

id static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.dci_P3.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for dci_P3, (void **)&static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.dci_P3, a1);
}

id one-time initialization function for p3_D65()
{
  static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.p3_D65 = *MEMORY[0x1E0CA2120];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.p3_D65;
}

id static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.p3_D65.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for p3_D65, (void **)&static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.p3_D65, a1);
}

id one-time initialization function for itu_R_2020()
{
  static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.itu_R_2020 = *MEMORY[0x1E0CA2108];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.itu_R_2020;
}

{
  static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_2020 = *MEMORY[0x1E0CA2310];
  return (id)static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_2020;
}

{
  static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_2020 = *MEMORY[0x1E0CA2360];
  return (id)static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_2020;
}

id static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.itu_R_2020.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for itu_R_2020, (void **)&static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.itu_R_2020, a1);
}

id one-time initialization function for p22()
{
  static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.p22 = *MEMORY[0x1E0CA2118];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.p22;
}

id static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.p22.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for p22, (void **)&static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.p22, a1);
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.TransferFunction.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

id static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_709_2.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for itu_R_709_2, (void **)&static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_709_2, a1);
}

id one-time initialization function for smpte_240M_1995()
{
  static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_240M_1995 = *MEMORY[0x1E0CA2330];
  return (id)static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_240M_1995;
}

id static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_240M_1995.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for smpte_240M_1995, (void **)&static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_240M_1995, a1);
}

id one-time initialization function for useGamma()
{
  static CMFormatDescriptionRef.Extensions.Value.TransferFunction.useGamma = *MEMORY[0x1E0CA2348];
  return (id)static CMFormatDescriptionRef.Extensions.Value.TransferFunction.useGamma;
}

id static CMFormatDescriptionRef.Extensions.Value.TransferFunction.useGamma.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for useGamma, (void **)&static CMFormatDescriptionRef.Extensions.Value.TransferFunction.useGamma, a1);
}

id static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_2020.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for itu_R_2020, (void **)&static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_2020, a1);
}

id one-time initialization function for smpte_ST_428_1()
{
  static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_ST_428_1 = *MEMORY[0x1E0CA2340];
  return (id)static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_ST_428_1;
}

id static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_ST_428_1.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for smpte_ST_428_1, (void **)&static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_ST_428_1, a1);
}

id one-time initialization function for smpte_ST_2084_PQ()
{
  static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_ST_2084_PQ = *MEMORY[0x1E0CA2338];
  return (id)static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_ST_2084_PQ;
}

id static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_ST_2084_PQ.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for smpte_ST_2084_PQ, (void **)&static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_ST_2084_PQ, a1);
}

id one-time initialization function for itu_R_2100_HLG()
{
  static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_2100_HLG = *MEMORY[0x1E0CA2318];
  return (id)static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_2100_HLG;
}

id static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_2100_HLG.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for itu_R_2100_HLG, (void **)&static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_2100_HLG, a1);
}

id one-time initialization function for linear()
{
  static CMFormatDescriptionRef.Extensions.Value.TransferFunction.linear = *MEMORY[0x1E0CA2328];
  return (id)static CMFormatDescriptionRef.Extensions.Value.TransferFunction.linear;
}

id static CMFormatDescriptionRef.Extensions.Value.TransferFunction.linear.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for linear, (void **)&static CMFormatDescriptionRef.Extensions.Value.TransferFunction.linear, a1);
}

id one-time initialization function for sRGB()
{
  static CMFormatDescriptionRef.Extensions.Value.TransferFunction.sRGB = *MEMORY[0x1E0CA2350];
  return (id)static CMFormatDescriptionRef.Extensions.Value.TransferFunction.sRGB;
}

id static CMFormatDescriptionRef.Extensions.Value.TransferFunction.sRGB.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for sRGB, (void **)&static CMFormatDescriptionRef.Extensions.Value.TransferFunction.sRGB, a1);
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

id static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_709_2.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for itu_R_709_2, (void **)&static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_709_2, a1);
}

id one-time initialization function for itu_R_601_4()
{
  static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_601_4 = *MEMORY[0x1E0CA2368];
  return (id)static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_601_4;
}

id static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_601_4.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for itu_R_601_4, (void **)&static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_601_4, a1);
}

id one-time initialization function for smpted_240M_1995()
{
  static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.smpted_240M_1995 = *MEMORY[0x1E0CA2378];
  return (id)static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.smpted_240M_1995;
}

id static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.smpted_240M_1995.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for smpted_240M_1995, (void **)&static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.smpted_240M_1995, a1);
}

id static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_2020.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for itu_R_2020, (void **)&static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_2020, a1);
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.ChromaLocation.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

id one-time initialization function for left()
{
  static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.left = *MEMORY[0x1E0CA20E0];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.left;
}

id static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.left.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for left, (void **)&static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.left, a1);
}

id one-time initialization function for center()
{
  static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.center = *MEMORY[0x1E0CA20D0];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.center;
}

id static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.center.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for center, (void **)&static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.center, a1);
}

id one-time initialization function for topLeft()
{
  static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.topLeft = *MEMORY[0x1E0CA20F0];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.topLeft;
}

id static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.topLeft.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for topLeft, (void **)&static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.topLeft, a1);
}

id one-time initialization function for top()
{
  static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.top = *MEMORY[0x1E0CA20E8];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.top;
}

id static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.top.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for top, (void **)&static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.top, a1);
}

id one-time initialization function for bottomLeft()
{
  static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.bottomLeft = *MEMORY[0x1E0CA20C8];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.bottomLeft;
}

id static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.bottomLeft.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for bottomLeft, (void **)&static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.bottomLeft, a1);
}

id one-time initialization function for bottom()
{
  static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.bottom = *MEMORY[0x1E0CA20C0];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.bottom;
}

id static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.bottom.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for bottom, (void **)&static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.bottom, a1);
}

id one-time initialization function for dv420()
{
  static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.dv420 = *MEMORY[0x1E0CA20D8];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.dv420;
}

id static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.dv420.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for dv420, (void **)&static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.dv420, a1);
}

uint64_t CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.hdv_720p30.getter(_DWORD *a1@<X8>)
{
  *a1 = 1751414321;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.hdv_1080i60.getter(_DWORD *a1@<X8>)
{
  *a1 = 1751414322;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.hdv_1080i50.getter(_DWORD *a1@<X8>)
{
  *a1 = 1751414323;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.hdv_720p24.getter(_DWORD *a1@<X8>)
{
  *a1 = 1751414324;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.hdv_720p25.getter(_DWORD *a1@<X8>)
{
  *a1 = 1751414325;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.hdv_1080p24.getter(_DWORD *a1@<X8>)
{
  *a1 = 1751414326;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.hdv_1080p25.getter(_DWORD *a1@<X8>)
{
  *a1 = 1751414327;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.hdv_1080p30.getter(_DWORD *a1@<X8>)
{
  *a1 = 1751414328;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.hdv_720p60.getter(_DWORD *a1@<X8>)
{
  *a1 = 1751414329;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.hdv_720p50.getter(_DWORD *a1@<X8>)
{
  *a1 = 1751414369;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD_1080i60_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849778;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD_1080i50_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849779;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD_1080p24_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849782;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD_1080p25_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849783;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD_1080p30_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849784;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_EX_720p24_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849780;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_EX_720p25_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849781;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_EX_720p30_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849777;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_EX_720p50_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849825;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_EX_720p60_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849785;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_EX_1080i60_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849826;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_EX_1080i50_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849827;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_EX_1080p24_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849828;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_EX_1080p25_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849829;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_EX_1080p30_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849830;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD422_720p50_CBR50.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019833185;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD422_720p60_CBR50.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019833145;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD422_1080i60_CBR50.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019833186;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD422_1080i50_CBR50.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019833187;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD422_1080p24_CBR50.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019833188;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD422_1080p25_CBR50.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019833189;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD422_1080p30_CBR50.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019833190;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD_540p.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019846244;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD422_540p.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019846194;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD422_720p24_CBR50.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019833140;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD422_720p25_CBR50.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019833141;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD422_720p30_CBR50.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019833137;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xf.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019981873;
}

NSNumber static CMFormatDescriptionRef.Extensions.Value.mpeg2VideoProfile(_:)@<X0>(NSNumber *a1@<X8>)
{
  NSNumber result;

  result.super.super.isa = UInt32._bridgeToObjectiveC()().super.super.isa;
  a1->super.super.isa = result.super.super.isa;
  return result;
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.Vendor.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

id one-time initialization function for apple()
{
  static CMFormatDescriptionRef.Extensions.Value.Vendor.apple = *MEMORY[0x1E0CA2358];
  return (id)static CMFormatDescriptionRef.Extensions.Value.Vendor.apple;
}

id static CMFormatDescriptionRef.Extensions.Value.Vendor.apple.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for apple, (void **)&static CMFormatDescriptionRef.Extensions.Value.Vendor.apple, a1);
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

id one-time initialization function for straightAlpha()
{
  static CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode.straightAlpha = *MEMORY[0x1E0CA20B8];
  return (id)static CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode.straightAlpha;
}

id static CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode.straightAlpha.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for straightAlpha, (void **)&static CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode.straightAlpha, a1);
}

id one-time initialization function for premultipliedAlpha()
{
  static CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode.premultipliedAlpha = *MEMORY[0x1E0CA20B0];
  return (id)static CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode.premultipliedAlpha;
}

id static CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode.premultipliedAlpha.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for premultipliedAlpha, (void **)&static CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode.premultipliedAlpha, a1);
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.qtTextColor(red:green:blue:alpha:)@<X0>(Class *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>)
{
  uint64_t inited;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  Class isa;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, CGFloat)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B8D31200;
  v9 = (void *)*MEMORY[0x1E0CA2868];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA2868];
  *(double *)(inited + 40) = a2 * 65535.0;
  v10 = (void *)*MEMORY[0x1E0CA2860];
  *(_QWORD *)(inited + 48) = *MEMORY[0x1E0CA2860];
  *(double *)(inited + 56) = a3 * 65535.0;
  v11 = (void *)*MEMORY[0x1E0CA2858];
  *(_QWORD *)(inited + 64) = *MEMORY[0x1E0CA2858];
  *(double *)(inited + 72) = a4 * 65535.0;
  v12 = v9;
  v13 = v10;
  v14 = v11;
  v15 = specialized Dictionary.init(dictionaryLiteral:)(inited);
  specialized _dictionaryUpCast<A, B, C, D>(_:)(v15);
  swift_bridgeObjectRelease();
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  result = swift_bridgeObjectRelease();
  *a1 = isa;
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
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  _OWORD v28[4];
  _OWORD v29[2];
  _OWORD v30[3];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, Any>);
    v2 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v2 = MEMORY[0x1E0DEE9E0];
  }
  v27 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v26 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v10 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v11 = v10 | (v8 << 6);
      goto LABEL_28;
    }
    v12 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v12 >= v26)
      goto LABEL_37;
    v13 = *(_QWORD *)(v27 + 8 * v12);
    v14 = v8 + 1;
    if (!v13)
    {
      v14 = v8 + 2;
      if (v8 + 2 >= v26)
        goto LABEL_37;
      v13 = *(_QWORD *)(v27 + 8 * v14);
      if (!v13)
      {
        v14 = v8 + 3;
        if (v8 + 3 >= v26)
          goto LABEL_37;
        v13 = *(_QWORD *)(v27 + 8 * v14);
        if (!v13)
        {
          v14 = v8 + 4;
          if (v8 + 4 >= v26)
            goto LABEL_37;
          v13 = *(_QWORD *)(v27 + 8 * v14);
          if (!v13)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v14 << 6);
    v8 = v14;
LABEL_28:
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v11);
    *(_QWORD *)&v30[0] = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v11);
    *(_QWORD *)&v29[0] = v16;
    v17 = *(id *)&v30[0];
    swift_dynamicCast();
    v18 = *(_QWORD *)&v30[0];
    outlined init with take of Any((_OWORD *)((char *)v30 + 8), v28);
    outlined init with take of Any(v28, v30);
    outlined init with take of Any(v30, v29);
    Hasher.init(_seed:)();
    type metadata accessor for CFStringRef(0);
    _sSo11CFStringRefaABSHSCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
    _CFObject.hash(into:)();
    result = Hasher._finalize()();
    v19 = -1 << *(_BYTE *)(v2 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
        v25 = *(_QWORD *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v9) = v18;
    result = (uint64_t)outlined init with take of Any(v29, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v15 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    outlined consume of [CMSampleBufferRef.PerSampleAttachmentsDictionary.Key : Any].Iterator._Variant();
    return v2;
  }
  v13 = *(_QWORD *)(v27 + 8 * v15);
  if (v13)
  {
    v14 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v14 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v14 >= v26)
      goto LABEL_37;
    v13 = *(_QWORD *)(v27 + 8 * v14);
    ++v15;
    if (v13)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.mobile3GPPTextColor(red:green:blue:alpha:)@<X0>(Class *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  uint64_t inited;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  Class isa;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, CGFloat)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B8D311D0;
  v11 = (void *)*MEMORY[0x1E0CA2868];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA2868];
  *(double *)(inited + 40) = a2 * 255.0;
  v12 = (void *)*MEMORY[0x1E0CA2860];
  *(_QWORD *)(inited + 48) = *MEMORY[0x1E0CA2860];
  *(double *)(inited + 56) = a3 * 255.0;
  v13 = (void *)*MEMORY[0x1E0CA2858];
  *(_QWORD *)(inited + 64) = *MEMORY[0x1E0CA2858];
  *(double *)(inited + 72) = a4 * 255.0;
  v14 = (void *)*MEMORY[0x1E0CA2850];
  *(_QWORD *)(inited + 80) = *MEMORY[0x1E0CA2850];
  *(double *)(inited + 88) = a5 * 255.0;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  v19 = specialized Dictionary.init(dictionaryLiteral:)(inited);
  specialized _dictionaryUpCast<A, B, C, D>(_:)(v19);
  swift_bridgeObjectRelease();
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  result = swift_bridgeObjectRelease();
  *a1 = isa;
  return result;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.fontTable(_:)@<X0>(uint64_t a1@<X0>, Class *a2@<X8>)
{
  Swift::Int v4;
  Class isa;
  uint64_t result;
  uint64_t v7;

  v7 = MEMORY[0x1E0DEE9E0];
  v4 = *(_QWORD *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : Any]);
  Dictionary.reserveCapacity(_:)(v4);
  specialized Sequence.forEach(_:)(a1, &v7);
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  swift_bridgeObjectRetain();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  result = swift_bridgeObjectRelease_n();
  *a2 = isa;
  return result;
}

uint64_t specialized Sequence.forEach(_:)(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  _OWORD *v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v22;
  char v23;
  unint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  char v28;
  unint64_t v29;
  char v30;
  _QWORD *v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  id v35;
  uint64_t result;
  uint64_t v37;
  int64_t v38;
  _OWORD v39[2];
  __int128 v40;
  uint64_t v41;
  _QWORD *v42;

  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v38 = (unint64_t)(v4 + 63) >> 6;
  swift_bridgeObjectRetain();
  v7 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v7 << 6);
    }
    else
    {
      v11 = v7 + 1;
      if (__OFADD__(v7, 1))
        goto LABEL_38;
      if (v11 >= v38)
        return swift_release();
      v12 = *(_QWORD *)(v37 + 8 * v11);
      ++v7;
      if (!v12)
      {
        v7 = v11 + 1;
        if (v11 + 1 >= v38)
          return swift_release();
        v12 = *(_QWORD *)(v37 + 8 * v7);
        if (!v12)
        {
          v7 = v11 + 2;
          if (v11 + 2 >= v38)
            return swift_release();
          v12 = *(_QWORD *)(v37 + 8 * v7);
          if (!v12)
          {
            v7 = v11 + 3;
            if (v11 + 3 >= v38)
              return swift_release();
            v12 = *(_QWORD *)(v37 + 8 * v7);
            if (!v12)
            {
              v13 = v11 + 4;
              if (v13 >= v38)
                return swift_release();
              v12 = *(_QWORD *)(v37 + 8 * v13);
              if (!v12)
              {
                while (1)
                {
                  v7 = v13 + 1;
                  if (__OFADD__(v13, 1))
                    goto LABEL_39;
                  if (v7 >= v38)
                    return swift_release();
                  v12 = *(_QWORD *)(v37 + 8 * v7);
                  ++v13;
                  if (v12)
                    goto LABEL_23;
                }
              }
              v7 = v13;
            }
          }
        }
      }
LABEL_23:
      v6 = (v12 - 1) & v12;
      v10 = __clz(__rbit64(v12)) + (v7 << 6);
    }
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v10);
    v15 = (uint64_t *)(*(_QWORD *)(a1 + 56) + 16 * v10);
    v17 = *v15;
    v16 = v15[1];
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_1B8D30590;
    *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEB418];
    *(_QWORD *)(v18 + 64) = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v18 + 32) = v14;
    swift_bridgeObjectRetain();
    v19 = String.init(format:_:)();
    v20 = (void *)MEMORY[0x1BCCB97B8](v19);
    swift_bridgeObjectRelease();
    v41 = MEMORY[0x1E0DEA968];
    *(_QWORD *)&v40 = v17;
    *((_QWORD *)&v40 + 1) = v16;
    outlined init with take of Any(&v40, v39);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v42 = (_QWORD *)*a2;
    v22 = v42;
    *a2 = 0x8000000000000000;
    v24 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v20);
    v25 = v22[2];
    v26 = (v23 & 1) == 0;
    v27 = v25 + v26;
    if (__OFADD__(v25, v26))
      break;
    v28 = v23;
    if (v22[3] >= v27)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v31 = v42;
        if ((v23 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        specialized _NativeDictionary.copy()();
        v31 = v42;
        if ((v28 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v27, isUniquelyReferenced_nonNull_native);
      v29 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v20);
      if ((v28 & 1) != (v30 & 1))
        goto LABEL_40;
      v24 = v29;
      v31 = v42;
      if ((v28 & 1) != 0)
      {
LABEL_4:
        v8 = (_OWORD *)(v31[7] + 32 * v24);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
        outlined init with take of Any(v39, v8);
        goto LABEL_5;
      }
    }
    v31[(v24 >> 6) + 8] |= 1 << v24;
    *(_QWORD *)(v31[6] + 8 * v24) = v20;
    outlined init with take of Any(v39, (_OWORD *)(v31[7] + 32 * v24));
    v32 = v31[2];
    v33 = __OFADD__(v32, 1);
    v34 = v32 + 1;
    if (v33)
      goto LABEL_37;
    v31[2] = v34;
    v35 = v20;
LABEL_5:
    *a2 = v31;

    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  type metadata accessor for CFStringRef(0);
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t CMFormatDescriptionRef.Extensions.Value.FontFace.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.FontFace.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

void static CMFormatDescriptionRef.Extensions.Value.FontFace.italic.getter(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

void static CMFormatDescriptionRef.Extensions.Value.FontFace.underline.getter(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

void one-time initialization function for all()
{
  static CMFormatDescriptionRef.Extensions.Value.FontFace.all = 7;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.FontFace.all.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  if (one-time initialization token for all != -1)
    result = swift_once();
  *a1 = static CMFormatDescriptionRef.Extensions.Value.FontFace.all;
  return result;
}

_BYTE *protocol witness for OptionSet.init(rawValue:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void protocol witness for SetAlgebra.init() in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

_BYTE *protocol witness for SetAlgebra.union(_:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v2;

  *a2 = *v2 | *result;
  return result;
}

_BYTE *protocol witness for SetAlgebra.intersection(_:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v2;

  *a2 = *v2 & *result;
  return result;
}

_BYTE *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(_BYTE *a1, unsigned __int8 *a2)
{
  _BYTE *v2;
  int v3;
  int v4;

  v3 = *a2;
  v4 = *v2;
  if ((v4 & v3) != v3)
    *v2 = v4 | v3;
  *a1 = v3;
  return (v4 & v3) != v3;
}

unsigned __int8 *protocol witness for SetAlgebra.remove(_:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace@<X0>(unsigned __int8 *result@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v2;
  int v3;
  int v4;
  int v5;

  v3 = *result;
  v4 = *v2;
  v5 = v4 & v3;
  if ((v4 & v3) != 0)
    *v2 = v4 & ~(_BYTE)v3;
  *a2 = v5;
  a2[1] = v5 == 0;
  return result;
}

unsigned __int8 *protocol witness for SetAlgebra.update(with:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace@<X0>(unsigned __int8 *result@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v2;
  int v3;
  int v4;
  int v5;

  v3 = *result;
  v4 = *v2;
  *v2 = v4 | v3;
  v5 = v4 & v3;
  *a2 = v5;
  a2[1] = v5 == 0;
  return result;
}

_BYTE *protocol witness for SetAlgebra.formUnion(_:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(_BYTE *result)
{
  _BYTE *v1;

  *v1 |= *result;
  return result;
}

_BYTE *protocol witness for SetAlgebra.formIntersection(_:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(_BYTE *result)
{
  _BYTE *v1;

  *v1 &= *result;
  return result;
}

_BYTE *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(_BYTE *result)
{
  _BYTE *v1;

  *v1 ^= *result;
  return result;
}

_BYTE *protocol witness for SetAlgebra.subtracting(_:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(unsigned __int8 *a1)
{
  unsigned __int8 *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(_BYTE *a1)
{
  _BYTE *v1;

  return (*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(unsigned __int8 *a1)
{
  unsigned __int8 *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance CMFormatDescriptionRef.Extensions.Value.FontFace()
{
  _BYTE *v0;

  return *v0 == 0;
}

_BYTE *protocol witness for SetAlgebra.subtract(_:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(_BYTE *result)
{
  _BYTE *v1;

  *v1 &= ~*result;
  return result;
}

NSNumber protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance CMFormatDescriptionRef.Extensions.Value.FontFace()
{
  return UInt8._bridgeToObjectiveC()();
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(a1, a2, a3, a4, MEMORY[0x1E0CB26C0]);
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(a1, a2, a3, a4, MEMORY[0x1E0CB26C8]);
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = static UInt8._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  return result;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.qtTextDefaultStyle(startChar:height:ascent:localFontID:fontFace:fontSize:foregroundColor:defaultFontName:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, uint64_t a8@<X7>, Class *a9@<X8>, uint64_t a10)
{
  char v15;
  uint64_t v16;
  uint64_t inited;
  void *v18;
  uint64_t v19;
  void **v20;
  void *v21;
  void **v22;
  void *v23;
  void **v24;
  void *v25;
  void **v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  char isUniquelyReferenced_nonNull_native;
  Class isa;
  uint64_t result;
  _OWORD v44[2];
  __int128 v45;
  uint64_t v46;

  v15 = *a5;
  v16 = *a7;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B8D31050;
  v18 = (void *)*MEMORY[0x1E0CA2920];
  v19 = MEMORY[0x1E0DEB418];
  v20 = (void **)MEMORY[0x1E0CA2918];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA2920];
  *(_QWORD *)(inited + 40) = a1;
  v21 = *v20;
  *(_QWORD *)(inited + 64) = v19;
  *(_QWORD *)(inited + 72) = v21;
  v22 = (void **)MEMORY[0x1E0CA28E8];
  *(_QWORD *)(inited + 80) = a2;
  v23 = *v22;
  *(_QWORD *)(inited + 104) = v19;
  *(_QWORD *)(inited + 112) = v23;
  v24 = (void **)MEMORY[0x1E0CA28F8];
  *(_QWORD *)(inited + 120) = a3;
  v25 = *v24;
  *(_QWORD *)(inited + 144) = v19;
  *(_QWORD *)(inited + 152) = v25;
  v26 = (void **)MEMORY[0x1E0CA2900];
  *(_QWORD *)(inited + 160) = a4;
  v27 = *v26;
  *(_QWORD *)(inited + 184) = v19;
  *(_QWORD *)(inited + 192) = v27;
  *(_BYTE *)(inited + 200) = v15;
  v28 = (void *)*MEMORY[0x1E0CA2908];
  *(_QWORD *)(inited + 224) = &type metadata for CMFormatDescriptionRef.Extensions.Value.FontFace;
  *(_QWORD *)(inited + 232) = v28;
  *(_QWORD *)(inited + 240) = a6;
  v29 = (void *)*MEMORY[0x1E0CA2910];
  *(_QWORD *)(inited + 264) = v19;
  *(_QWORD *)(inited + 272) = v29;
  *(_QWORD *)(inited + 304) = swift_getObjectType();
  *(_QWORD *)(inited + 280) = v16;
  v30 = v18;
  v31 = v21;
  v32 = v23;
  v33 = v25;
  v34 = v27;
  v35 = v28;
  v36 = v29;
  swift_unknownObjectRetain();
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  if (a10)
  {
    v37 = (void *)*MEMORY[0x1E0CA2878];
    v46 = MEMORY[0x1E0DEA968];
    *(_QWORD *)&v45 = a8;
    *((_QWORD *)&v45 + 1) = a10;
    outlined init with take of Any(&v45, v44);
    swift_bridgeObjectRetain();
    v38 = v37;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v44, v38, isUniquelyReferenced_nonNull_native);

    swift_bridgeObjectRelease();
  }
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  result = swift_bridgeObjectRelease();
  *a9 = isa;
  return result;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.mobile3GPPTextDefaultStyle(startChar:endChar:localFontID:fontFace:fontSize:foregroundColor:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X5>, Class *a7@<X8>)
{
  char v12;
  uint64_t v13;
  uint64_t inited;
  void *v15;
  uint64_t v16;
  void **v17;
  void *v18;
  void **v19;
  void *v20;
  void **v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  Class isa;
  uint64_t result;

  v12 = *a4;
  v13 = *a6;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B8D31210;
  v15 = (void *)*MEMORY[0x1E0CA2920];
  v16 = MEMORY[0x1E0DEB418];
  v17 = (void **)MEMORY[0x1E0CA28F0];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA2920];
  *(_QWORD *)(inited + 40) = a1;
  v18 = *v17;
  *(_QWORD *)(inited + 64) = v16;
  *(_QWORD *)(inited + 72) = v18;
  v19 = (void **)MEMORY[0x1E0CA28F8];
  *(_QWORD *)(inited + 80) = a2;
  v20 = *v19;
  *(_QWORD *)(inited + 104) = v16;
  *(_QWORD *)(inited + 112) = v20;
  v21 = (void **)MEMORY[0x1E0CA2900];
  *(_QWORD *)(inited + 120) = a3;
  v22 = *v21;
  *(_QWORD *)(inited + 144) = v16;
  *(_QWORD *)(inited + 152) = v22;
  *(_BYTE *)(inited + 160) = v12;
  v23 = (void *)*MEMORY[0x1E0CA2908];
  *(_QWORD *)(inited + 184) = &type metadata for CMFormatDescriptionRef.Extensions.Value.FontFace;
  *(_QWORD *)(inited + 192) = v23;
  *(_QWORD *)(inited + 200) = a5;
  v24 = (void *)*MEMORY[0x1E0CA2910];
  *(_QWORD *)(inited + 224) = v16;
  *(_QWORD *)(inited + 232) = v24;
  *(_QWORD *)(inited + 264) = swift_getObjectType();
  *(_QWORD *)(inited + 240) = v13;
  v25 = v15;
  v26 = v18;
  v27 = v20;
  v28 = v22;
  v29 = v23;
  v30 = v24;
  swift_unknownObjectRetain();
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  result = swift_bridgeObjectRelease();
  *a7 = isa;
  return result;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.textRect(top:left:bottom:right:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, Class *a5@<X8>)
{
  uint64_t inited;
  void *v11;
  uint64_t v12;
  void **v13;
  void *v14;
  void **v15;
  void *v16;
  void **v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  Class isa;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Any)>);
  inited = swift_initStackObject();
  v11 = (void *)*MEMORY[0x1E0CA28D8];
  v12 = MEMORY[0x1E0DEB418];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA28D8];
  *(_QWORD *)(inited + 40) = a1;
  v13 = (void **)MEMORY[0x1E0CA28C8];
  *(_OWORD *)(inited + 16) = xmmword_1B8D311D0;
  v14 = *v13;
  *(_QWORD *)(inited + 80) = a2;
  v15 = (void **)MEMORY[0x1E0CA28C0];
  *(_QWORD *)(inited + 64) = v12;
  *(_QWORD *)(inited + 72) = v14;
  v16 = *v15;
  *(_QWORD *)(inited + 120) = a3;
  v17 = (void **)MEMORY[0x1E0CA28D0];
  *(_QWORD *)(inited + 104) = v12;
  *(_QWORD *)(inited + 112) = v16;
  v18 = *v17;
  *(_QWORD *)(inited + 144) = v12;
  *(_QWORD *)(inited + 152) = v18;
  *(_QWORD *)(inited + 184) = v12;
  *(_QWORD *)(inited + 160) = a4;
  v19 = v11;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  result = swift_bridgeObjectRelease();
  *a5 = isa;
  return result;
}

uint64_t CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

void static CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.scrollOut.getter(_DWORD *a1@<X8>)
{
  *a1 = 64;
}

void static CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.scrollDirectionMask.getter(_DWORD *a1@<X8>)
{
  *a1 = 384;
}

void static CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.scrollDirection_bottomToTop.getter(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

void static CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.scrollDirection_rightToLeft.getter(_DWORD *a1@<X8>)
{
  *a1 = 128;
}

void static CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.scrollDirection_topToBottom.getter(_DWORD *a1@<X8>)
{
  *a1 = 256;
}

void static CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.continuousKaraoke.getter(_DWORD *a1@<X8>)
{
  *a1 = 2048;
}

void static CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.writeTextVertically.getter(_DWORD *a1@<X8>)
{
  *a1 = 0x20000;
}

void static CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.fillTextRegion.getter(_DWORD *a1@<X8>)
{
  *a1 = 0x40000;
}

void static CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.obeySubtitleFormatting.getter(_DWORD *a1@<X8>)
{
  *a1 = 0x20000000;
}

void static CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.forcedSubtitlesPresent.getter(_DWORD *a1@<X8>)
{
  *a1 = 0x40000000;
}

void static CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.allSubtitlesForced.getter(_DWORD *a1@<X8>)
{
  *a1 = 0x80000000;
}

void CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.scrollDirection.getter(int *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1 & 0x180;
}

Class static CMFormatDescriptionRef.Extensions.Value.textDisplayFlags(_:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  int64_t v4;
  Class result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;

  v4 = 0;
  result = 0;
  v6 = a1 + 56;
  v7 = 1 << *(_BYTE *)(a1 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a1 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v12 = v11 | (v4 << 6);
      goto LABEL_5;
    }
    v13 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v13 >= v10)
      goto LABEL_25;
    v14 = *(_QWORD *)(v6 + 8 * v13);
    ++v4;
    if (!v14)
    {
      v4 = v13 + 1;
      if (v13 + 1 >= v10)
        goto LABEL_25;
      v14 = *(_QWORD *)(v6 + 8 * v4);
      if (!v14)
      {
        v4 = v13 + 2;
        if (v13 + 2 >= v10)
          goto LABEL_25;
        v14 = *(_QWORD *)(v6 + 8 * v4);
        if (!v14)
        {
          v4 = v13 + 3;
          if (v13 + 3 >= v10)
            goto LABEL_25;
          v14 = *(_QWORD *)(v6 + 8 * v4);
          if (!v14)
          {
            v4 = v13 + 4;
            if (v13 + 4 >= v10)
              goto LABEL_25;
            v14 = *(_QWORD *)(v6 + 8 * v4);
            if (!v14)
              break;
          }
        }
      }
    }
LABEL_24:
    v9 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v4 << 6);
LABEL_5:
    result = (Class)(*(_DWORD *)(*(_QWORD *)(a1 + 48) + 4 * v12) | result);
  }
  v15 = v13 + 5;
  if (v15 >= v10)
  {
LABEL_25:
    result = UInt32._bridgeToObjectiveC()().super.super.isa;
    *a2 = result;
    return result;
  }
  v14 = *(_QWORD *)(v6 + 8 * v15);
  if (v14)
  {
    v4 = v15;
    goto LABEL_24;
  }
  while (1)
  {
    v4 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v4 >= v10)
      goto LABEL_25;
    v14 = *(_QWORD *)(v6 + 8 * v4);
    ++v15;
    if (v14)
      goto LABEL_24;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t CMFormatDescriptionRef.Extensions.Value.TextJustification.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t CMFormatDescriptionRef.Extensions.Value.TextJustification.rawValue.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.TextJustification.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

uint64_t CMFormatDescriptionRef.Extensions.Value.TextJustification.init(rawValue:)@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static CMFormatDescriptionRef.Extensions.Value.TextJustification.top.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void static CMFormatDescriptionRef.Extensions.Value.TextJustification.centered.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

void static CMFormatDescriptionRef.Extensions.Value.TextJustification.right.getter(_BYTE *a1@<X8>)
{
  *a1 = -1;
}

unsigned __int8 *protocol witness for RawRepresentable.init(rawValue:) in conformance CMFormatDescriptionRef.Extensions.Value.TextJustification@<X0>(unsigned __int8 *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CMFormatDescriptionRef.Extensions.Value.TextJustification(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

NSNumber protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance CMFormatDescriptionRef.Extensions.Value.TextJustification()
{
  return Int8._bridgeToObjectiveC()();
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance CMFormatDescriptionRef.Extensions.Value.TextJustification(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(a1, a2, a3, a4, MEMORY[0x1E0CB2600]);
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, __int16 *))
{
  uint64_t result;
  __int16 v7;

  v7 = 256;
  result = a5(a1, &v7);
  if ((v7 & 0x100) != 0)
  {
    __break(1u);
  }
  else
  {
    *a2 = v7;
    a2[1] = 0;
  }
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance CMFormatDescriptionRef.Extensions.Value.TextJustification(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(a1, a2, a3, a4, MEMORY[0x1E0CB2608]);
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, __int16 *))
{
  uint64_t result;
  __int16 v7;

  v7 = 256;
  result = a5(a1, &v7);
  if ((result & 1) == 0)
    return result & 1;
  if ((v7 & 0x100) == 0)
  {
    *a2 = v7;
    a2[1] = 0;
    return result & 1;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance CMFormatDescriptionRef.Extensions.Value.TextJustification@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = static Int8._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CMFormatDescriptionRef.Extensions.Value.FontFace()
{
  Swift::UInt8 *v0;
  Swift::UInt8 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CMFormatDescriptionRef.Extensions.Value.TextJustification()
{
  Swift::UInt8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace()
{
  Swift::UInt8 *v0;
  Swift::UInt8 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CMFormatDescriptionRef.Extensions.Value.TextJustification(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

NSNumber static CMFormatDescriptionRef.Extensions.Value.textJustification(_:)@<X0>(NSNumber *a1@<X8>)
{
  NSNumber result;

  result.super.super.isa = Int8._bridgeToObjectiveC()().super.super.isa;
  a1->super.super.isa = result.super.super.isa;
  return result;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.sourceReferenceName(value:langCode:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, Class *a4@<X8>)
{
  uint64_t inited;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  Class isa;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B8D311F0;
  v9 = (void *)*MEMORY[0x1E0CA2DF8];
  v10 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0CA2DF8];
  *(_QWORD *)(inited + 40) = a1;
  *(_QWORD *)(inited + 48) = a2;
  v11 = (void *)*MEMORY[0x1E0CA2DF0];
  *(_QWORD *)(inited + 64) = v10;
  *(_QWORD *)(inited + 72) = v11;
  *(_QWORD *)(inited + 104) = MEMORY[0x1E0DEB418];
  *(_QWORD *)(inited + 80) = a3;
  v12 = v9;
  swift_bridgeObjectRetain();
  v13 = v11;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  result = swift_bridgeObjectRelease();
  *a4 = isa;
  return result;
}

void CMFormatDescriptionRef.Extensions.init()(_QWORD *a1@<X8>)
{
  *a1 = MEMORY[0x1E0DEE9E0];
}

uint64_t CMFormatDescriptionRef.Extensions.init(base:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = MEMORY[0x1E0DEE9E0];
  if (result)
    v2 = result;
  *a2 = v2;
  return result;
}

void CMFormatDescriptionRef.Extensions.subscript.getter(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  char v10;

  v4 = *a1;
  v5 = *v2;
  if ((v5 & 0xC000000000000001) != 0)
  {
    v6 = v4;
    swift_bridgeObjectRetain();
    v7 = __CocoaDictionary.lookup(_:)();
  }
  else
  {
    if (!*(_QWORD *)(v5 + 16))
    {
      v7 = 0;
      goto LABEL_5;
    }
    v8 = v4;
    swift_bridgeObjectRetain();
    v9 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v8);
    if ((v10 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      v7 = 0;
      goto LABEL_4;
    }
    v7 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v9);
    swift_unknownObjectRetain();
  }
  swift_bridgeObjectRelease();
LABEL_4:

LABEL_5:
  *a2 = v7;
}

void key path getter for CMFormatDescriptionRef.Extensions.subscript(_:) : CMFormatDescriptionRef.Extensions(uint64_t *a1@<X0>, void **a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;

  v4 = *a1;
  v5 = *a2;
  swift_bridgeObjectRetain();
  v6 = v5;
  v7 = specialized Dictionary.subscript.getter(v6, v4);
  swift_bridgeObjectRelease();

  *a3 = v7;
}

void key path setter for CMFormatDescriptionRef.Extensions.subscript(_:) : CMFormatDescriptionRef.Extensions(uint64_t *a1, uint64_t a2, void **a3)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = *a3;
  v4 = *a1;
  if (*a1)
  {
    swift_unknownObjectRetain();
    v6 = v3;
    specialized Dictionary._Variant.setValue(_:forKey:)(v4, v6);

  }
  else
  {
    v5 = v3;
    specialized Dictionary._Variant.removeValue(forKey:)((unint64_t)v5);

    swift_unknownObjectRelease();
  }
}

void CMFormatDescriptionRef.Extensions.subscript.setter(_QWORD *a1, unint64_t *a2)
{
  unint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  v4 = (id)v2;
  if (*a1)
  {
    v3 = swift_unknownObjectRetain();
    specialized Dictionary._Variant.setValue(_:forKey:)(v3, v4);
    swift_unknownObjectRelease();

  }
  else
  {
    specialized Dictionary._Variant.removeValue(forKey:)(v2);

    swift_unknownObjectRelease();
  }
}

uint64_t CMFormatDescriptionRef.Extensions.subscript.getter(void *a1)
{
  uint64_t *v1;
  uint64_t v3;
  id v4;
  uint64_t v5;
  unint64_t v7;
  char v8;

  v3 = *v1;
  if ((v3 & 0xC000000000000001) != 0)
  {
    v4 = a1;
    v5 = __CocoaDictionary.lookup(_:)();
  }
  else
  {
    if (!*(_QWORD *)(v3 + 16))
      return 0;
    v7 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)a1);
    if ((v8 & 1) != 0)
    {
      v5 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v7);
      swift_unknownObjectRetain();
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

uint64_t CMFormatDescriptionRef.Extensions.subscript.setter(uint64_t a1, void *a2)
{
  uint64_t v3;

  if (a1)
  {
    v3 = swift_unknownObjectRetain();
    specialized Dictionary._Variant.setValue(_:forKey:)(v3, a2);

  }
  else
  {
    specialized Dictionary._Variant.removeValue(forKey:)((unint64_t)a2);

    swift_unknownObjectRelease();
  }
  return swift_unknownObjectRelease();
}

uint64_t (*CMFormatDescriptionRef.Extensions.subscript.modify(uint64_t *a1, void **a2))(uint64_t *a1, char a2)
{
  uint64_t *v2;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  char v12;

  v4 = *a2;
  a1[1] = (uint64_t)v2;
  a1[2] = (uint64_t)v4;
  v5 = *v2;
  if ((v5 & 0xC000000000000001) == 0)
  {
    v8 = *(_QWORD *)(v5 + 16);
    v9 = v4;
    if (v8)
    {
      v10 = (uint64_t)v9;
      swift_bridgeObjectRetain();
      v11 = specialized __RawDictionaryStorage.find<A>(_:)(v10);
      if ((v12 & 1) != 0)
      {
        v7 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v11);
        swift_unknownObjectRetain();
        goto LABEL_3;
      }
      swift_bridgeObjectRelease();
    }
    v7 = 0;
    goto LABEL_9;
  }
  v6 = v4;
  swift_bridgeObjectRetain();
  v7 = __CocoaDictionary.lookup(_:)();
LABEL_3:
  swift_bridgeObjectRelease();
LABEL_9:
  *a1 = v7;
  return CMFormatDescriptionRef.Extensions.subscript.modify;
}

uint64_t CMFormatDescriptionRef.Extensions.subscript.modify(uint64_t *a1, char a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)a1[2];
  v3 = *a1;
  if ((a2 & 1) != 0)
  {
    if (v3)
    {
      v4 = swift_unknownObjectRetain_n();
      specialized Dictionary._Variant.setValue(_:forKey:)(v4, v2);
    }
    else
    {
      specialized Dictionary._Variant.removeValue(forKey:)(a1[2]);
    }

    swift_unknownObjectRelease();
  }
  else
  {
    if (v3)
    {
      v5 = swift_unknownObjectRetain();
      specialized Dictionary._Variant.setValue(_:forKey:)(v5, v2);
    }
    else
    {
      specialized Dictionary._Variant.removeValue(forKey:)(a1[2]);
    }

  }
  return swift_unknownObjectRelease();
}

{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  v2 = (void *)a1[1];
  v3 = *a1;
  if ((a2 & 1) != 0)
  {
    if (v3)
    {
      swift_unknownObjectRetain_n();
      v4 = v2;
      specialized Dictionary._Variant.setValue(_:forKey:)(v3, v4);

      swift_unknownObjectRelease();
    }
    else
    {
      v7 = v2;
      specialized Dictionary._Variant.removeValue(forKey:)((unint64_t)v7);

      swift_unknownObjectRelease();
    }
  }
  else if (v3)
  {
    v5 = v2;
    v6 = swift_unknownObjectRetain();
    specialized Dictionary._Variant.setValue(_:forKey:)(v6, v5);

  }
  else
  {
    v8 = v2;
    specialized Dictionary._Variant.removeValue(forKey:)((unint64_t)v8);

  }
  return swift_unknownObjectRelease();
}

uint64_t specialized Dictionary.subscript.getter(void *a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  char v5;

  if ((a2 & 0xC000000000000001) != 0)
  {
    v2 = a1;
    v3 = __CocoaDictionary.lookup(_:)();

    return v3;
  }
  else if (*(_QWORD *)(a2 + 16) && (specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)a1), (v5 & 1) != 0))
  {
    return swift_unknownObjectRetain();
  }
  else
  {
    return 0;
  }
}

uint64_t (*CMFormatDescriptionRef.Extensions.subscript.modify(uint64_t *a1, void *a2))(uint64_t *a1, char a2)
{
  uint64_t *v2;
  uint64_t v5;
  id v6;
  uint64_t v7;
  unint64_t v9;
  char v10;

  a1[1] = (uint64_t)a2;
  a1[2] = (uint64_t)v2;
  v5 = *v2;
  if ((v5 & 0xC000000000000001) != 0)
  {
    v6 = a2;
    v7 = __CocoaDictionary.lookup(_:)();
  }
  else
  {
    if (!*(_QWORD *)(v5 + 16))
    {
      v7 = 0;
      goto LABEL_4;
    }
    v9 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)a2);
    if ((v10 & 1) != 0)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v9);
      swift_unknownObjectRetain();
    }
    else
    {
      v7 = 0;
    }
  }

LABEL_4:
  *a1 = v7;
  return CMFormatDescriptionRef.Extensions.subscript.modify;
}

BOOL static CMFormatDescriptionRef.Extensions.Value.== infix(_:_:)(CFTypeRef *a1, CFTypeRef *a2)
{
  return CFEqual(*a1, *a2) != 0;
}

void CMFormatDescriptionRef.Extensions.Value.hash(into:)()
{
  CFTypeRef *v0;
  Swift::UInt v1;

  v1 = CFHash(*v0);
  Hasher._combine(_:)(v1);
}

Swift::Int CMFormatDescriptionRef.Extensions.Value.hashValue.getter()
{
  const void **v0;
  const void *v1;
  Swift::UInt v2;

  v1 = *v0;
  Hasher.init(_seed:)();
  v2 = CFHash(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CMFormatDescriptionRef.Extensions.Value()
{
  const void **v0;
  const void *v1;
  Swift::UInt v2;

  v1 = *v0;
  Hasher.init(_seed:)();
  v2 = CFHash(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CMFormatDescriptionRef.Extensions.Value()
{
  CFTypeRef *v0;
  Swift::UInt v1;

  v1 = CFHash(*v0);
  Hasher._combine(_:)(v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CMFormatDescriptionRef.Extensions.Value()
{
  const void **v0;
  const void *v1;
  Swift::UInt v2;

  v1 = *v0;
  Hasher.init(_seed:)();
  v2 = CFHash(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CMFormatDescriptionRef.Extensions.Value(CFTypeRef *a1, CFTypeRef *a2)
{
  return CFEqual(*a1, *a2) != 0;
}

uint64_t CMFormatDescriptionRef.Extensions.startIndex.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t result;
  uint64_t v4;
  char v5;

  result = specialized Dictionary.startIndex.getter(*v1);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  return result;
}

uint64_t specialized Dictionary.startIndex.getter(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  if ((a1 & 0xC000000000000001) != 0)
    return __CocoaDictionary.startIndex.getter();
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
  {
    v3 = 0;
    return __clz(__rbit64(v2)) + v3;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v1 = 1 << v5;
  if (v6 < 7)
    return v1;
  v2 = *(_QWORD *)(a1 + 72);
  if (v2)
  {
    v3 = 64;
    return __clz(__rbit64(v2)) + v3;
  }
  if (v6 < 8)
    return v1;
  v2 = *(_QWORD *)(a1 + 80);
  if (v2)
  {
    v3 = 128;
    return __clz(__rbit64(v2)) + v3;
  }
  v7 = (unint64_t)(v1 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 88);
  v3 = 128;
  while (v8)
  {
    v10 = *v9++;
    v2 = v10;
    --v8;
    v3 += 64;
    if (v10)
      return __clz(__rbit64(v2)) + v3;
  }
  return v1;
}

uint64_t CMFormatDescriptionRef.Extensions.endIndex.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = *v1;
  v4 = *v1 & 0xC000000000000001;
  if (v4)
  {
    result = __CocoaDictionary.endIndex.getter();
  }
  else
  {
    result = 1 << *(_BYTE *)(v3 + 32);
    v6 = *(unsigned int *)(v3 + 36);
  }
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = v4 != 0;
  return result;
}

void CMFormatDescriptionRef.Extensions.subscript.getter(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  specialized Dictionary.subscript.getter(&v2, *(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16), *v1);
}

void specialized Dictionary.subscript.getter(_QWORD *a1, uint64_t a2, int a3, char a4, uint64_t a5)
{
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  void *v12;
  void *v13;

  v6 = a2;
  if ((a5 & 0xC000000000000001) != 0)
  {
    if ((a4 & 1) != 0)
    {
      __CocoaDictionary.lookup(_:)();
      v9 = v8;
      type metadata accessor for CFStringRef(0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      *a1 = v9;
      return;
    }
    goto LABEL_18;
  }
  if ((a4 & 1) != 0)
  {
LABEL_10:
    if (__CocoaDictionary.Index.age.getter() == *(_DWORD *)(a5 + 36))
    {
      __CocoaDictionary.Index.key.getter();
      type metadata accessor for CFStringRef(0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      v6 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v13);
      v11 = v10;

      if ((v11 & 1) != 0)
        goto LABEL_12;
LABEL_17:
      __break(1u);
LABEL_18:
      __break(1u);
      return;
    }
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (*(_DWORD *)(a5 + 36) != a3)
  {
    __break(1u);
    goto LABEL_10;
  }
LABEL_12:
  v12 = *(void **)(*(_QWORD *)(a5 + 48) + 8 * v6);
  *a1 = *(_QWORD *)(*(_QWORD *)(a5 + 56) + 8 * v6);
  v12;
  swift_unknownObjectRetain();
}

void CMFormatDescriptionRef.Extensions.index(after:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;

  v5 = *(_QWORD *)a1;
  if ((*v2 & 0xC000000000000001) == 0)
  {
    specialized _NativeDictionary.index(after:)(v5, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16), *v2);
    v8 = v9 & 1;
    goto LABEL_5;
  }
  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
  {
    v6 = __CocoaDictionary.index(after:)();
    v8 = 1;
LABEL_5:
    *(_QWORD *)a2 = v6;
    *(_QWORD *)(a2 + 8) = v7;
    *(_BYTE *)(a2 + 16) = v8;
    return;
  }
  __break(1u);
}

uint64_t protocol witness for Collection.startIndex.getter in conformance CMFormatDescriptionRef.Extensions@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t result;
  uint64_t v4;
  char v5;

  result = specialized Dictionary.startIndex.getter(*v1);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  return result;
}

void (*protocol witness for Collection.subscript.read in conformance CMFormatDescriptionRef.Extensions(_QWORD *a1, uint64_t a2))(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v8;

  specialized Dictionary.subscript.getter(&v8, *(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_BYTE *)(a2 + 16), *v2);
  v4 = v8;
  a1[2] = v5;
  a1[3] = v4;
  *a1 = v5;
  a1[1] = v4;
  v6 = v5;
  swift_unknownObjectRetain();
  return protocol witness for Collection.subscript.read in conformance CMFormatDescriptionRef.Extensions;
}

void protocol witness for Collection.subscript.read in conformance CMFormatDescriptionRef.Extensions(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 16);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

uint64_t protocol witness for Collection.subscript.getter in conformance CMFormatDescriptionRef.Extensions@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  __int128 v3;
  __int128 v5;
  _OWORD v6[2];

  v3 = a1[1];
  v5 = *a1;
  v6[0] = v3;
  *(_OWORD *)((char *)v6 + 9) = *(__int128 *)((char *)a1 + 25);
  return specialized Collection<>.subscript.getter((uint64_t)&v5, *v2, a2);
}

uint64_t protocol witness for Collection.indices.getter in conformance CMFormatDescriptionRef.Extensions@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return specialized Collection<>.indices.getter(*v1, a1);
}

uint64_t protocol witness for Collection.isEmpty.getter in conformance CMFormatDescriptionRef.Extensions()
{
  uint64_t *v0;

  return specialized Collection.isEmpty.getter(*v0);
}

void protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance CMFormatDescriptionRef.Extensions(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = -2;
}

void protocol witness for Collection.index(_:offsetBy:) in conformance CMFormatDescriptionRef.Extensions(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;

  specialized Collection.index(_:offsetBy:)(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16), a2, *v3, a3);
}

void protocol witness for Collection.index(_:offsetBy:limitedBy:) in conformance CMFormatDescriptionRef.Extensions(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;

  specialized Collection.index(_:offsetBy:limitedBy:)(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16), a2, *(_QWORD *)a3, *(_QWORD *)(a3 + 8), *(_BYTE *)(a3 + 16), *v4, a4);
}

void protocol witness for Collection.distance(from:to:) in conformance CMFormatDescriptionRef.Extensions(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  specialized Collection.distance(from:to:)(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16), *(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_BYTE *)(a2 + 16), *v2);
}

uint64_t protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance CMFormatDescriptionRef.Extensions(uint64_t *a1, __int128 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance CMFormatDescriptionRef.Extensions(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, __int128 *))specialized Collection._failEarlyRangeCheck(_:bounds:));
}

{
  return protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance CMFormatDescriptionRef.Extensions(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, __int128 *))specialized Collection._failEarlyRangeCheck(_:bounds:));
}

uint64_t protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance CMFormatDescriptionRef.Extensions(uint64_t *a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, __int128 *))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v10;
  _OWORD v11[2];

  v5 = *a1;
  v6 = a1[1];
  v7 = *((unsigned __int8 *)a1 + 16);
  v8 = a2[1];
  v10 = *a2;
  v11[0] = v8;
  *(_OWORD *)((char *)v11 + 9) = *(__int128 *)((char *)a2 + 25);
  return a5(v5, v6, v7, &v10);
}

uint64_t protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance CMFormatDescriptionRef.Extensions(__int128 *a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;
  _OWORD v8[2];

  v2 = a1[1];
  v5 = *a1;
  v6[0] = v2;
  *(_OWORD *)((char *)v6 + 9) = *(__int128 *)((char *)a1 + 25);
  v3 = a2[1];
  v7 = *a2;
  v8[0] = v3;
  *(_OWORD *)((char *)v8 + 9) = *(__int128 *)((char *)a2 + 25);
  return specialized Collection._failEarlyRangeCheck(_:bounds:)(&v5, &v7);
}

void protocol witness for Collection.index(after:) in conformance CMFormatDescriptionRef.Extensions(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;

  v5 = *(_QWORD *)a1;
  if ((*v2 & 0xC000000000000001) == 0)
  {
    specialized _NativeDictionary.index(after:)(v5, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16), *v2);
    v8 = v9 & 1;
    goto LABEL_5;
  }
  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
  {
    v6 = __CocoaDictionary.index(after:)();
    v8 = 1;
LABEL_5:
    *(_QWORD *)a2 = v6;
    *(_QWORD *)(a2 + 8) = v7;
    *(_BYTE *)(a2 + 16) = v8;
    return;
  }
  __break(1u);
}

uint64_t protocol witness for Collection.formIndex(after:) in conformance CMFormatDescriptionRef.Extensions(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v2 = result;
  v3 = *v1;
  v4 = *(_QWORD *)result;
  v5 = *(_QWORD *)(result + 8);
  v6 = *(_BYTE *)(result + 16);
  if ((v3 & 0xC000000000000001) == 0)
  {
    specialized _NativeDictionary.index(after:)(*(_QWORD *)result, v5, v6, v3);
    v7 = v14;
    v9 = v15;
    v10 = v16 & 1;
    v11 = v4;
    v12 = v5;
    v13 = v6;
    goto LABEL_5;
  }
  if ((*(_BYTE *)(result + 16) & 1) != 0)
  {
    v7 = __CocoaDictionary.index(after:)();
    v9 = v8;
    v10 = 1;
    v11 = v4;
    v12 = v5;
    v13 = 1;
LABEL_5:
    result = outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v11, v12, v13);
    *(_QWORD *)v2 = v7;
    *(_QWORD *)(v2 + 8) = v9;
    *(_BYTE *)(v2 + 16) = v10;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Sequence.makeIterator() in conformance CMFormatDescriptionRef.Extensions@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char v6;

  v3 = *v1;
  result = specialized Dictionary.startIndex.getter(v3);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = result;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6 & 1;
  return result;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance CMFormatDescriptionRef.Extensions()
{
  uint64_t *v0;

  return specialized Collection.count.getter(*v0);
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance CMFormatDescriptionRef.Extensions()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance CMFormatDescriptionRef.Extensions(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t *v3;

  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

BOOL static CMFormatDescriptionRef.Extensions.Index.== infix(_:_:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *a1;
  if ((a1[2] & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 16) & 1) != 0)
LABEL_9:
      JUMPOUT(0x1BCCB9A4CLL);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if ((*(_BYTE *)(a2 + 16) & 1) != 0)
    goto LABEL_8;
  if (a1[1] != *(_QWORD *)(a2 + 8))
  {
    __break(1u);
    goto LABEL_8;
  }
  return v3 == *(_QWORD *)a2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CMFormatDescriptionRef.Extensions.Index(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *a1;
  if ((a1[2] & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 16) & 1) != 0)
LABEL_9:
      JUMPOUT(0x1BCCB9A4CLL);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if ((*(_BYTE *)(a2 + 16) & 1) != 0)
    goto LABEL_8;
  if (a1[1] != *(_QWORD *)(a2 + 8))
  {
    __break(1u);
    goto LABEL_8;
  }
  return v3 == *(_QWORD *)a2;
}

BOOL static CMFormatDescriptionRef.Extensions.Index.< infix(_:_:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *a1;
  if ((a1[2] & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 16) & 1) != 0)
LABEL_9:
      JUMPOUT(0x1BCCB9A40);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if ((*(_BYTE *)(a2 + 16) & 1) != 0)
    goto LABEL_8;
  if (a1[1] != *(_QWORD *)(a2 + 8))
  {
    __break(1u);
    goto LABEL_8;
  }
  return v3 < *(_QWORD *)a2;
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance CMFormatDescriptionRef.Extensions.Index(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *a1;
  if ((a1[2] & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 16) & 1) != 0)
LABEL_9:
      JUMPOUT(0x1BCCB9A40);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if ((*(_BYTE *)(a2 + 16) & 1) != 0)
    goto LABEL_8;
  if (a1[1] != *(_QWORD *)(a2 + 8))
  {
    __break(1u);
    goto LABEL_8;
  }
  return v3 < *(_QWORD *)a2;
}

uint64_t protocol witness for static Comparable.<= infix(_:_:) in conformance CMFormatDescriptionRef.Extensions.Index(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t result;
  uint64_t v7;
  char v8;

  v3 = *a1;
  v4 = a1[1];
  v5 = *((_BYTE *)a1 + 16);
  result = *a2;
  v7 = a2[1];
  if ((a2[2] & 1) != 0)
  {
    if ((v5 & 1) != 0)
    {
      v8 = MEMORY[0x1BCCB9A40](result, v7, v3, v4);
      return (v8 & 1) == 0;
    }
  }
  else if ((v5 & 1) == 0)
  {
    if ((_DWORD)v7 == (_DWORD)v4)
    {
      v8 = result < v3;
      return (v8 & 1) == 0;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for static Comparable.>= infix(_:_:) in conformance CMFormatDescriptionRef.Extensions.Index(uint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;

  result = *a1;
  v5 = a1[1];
  v6 = *a2;
  v7 = a2[1];
  v8 = *((_BYTE *)a2 + 16);
  if ((a1[2] & 1) != 0)
  {
    if ((v8 & 1) != 0)
    {
      v9 = MEMORY[0x1BCCB9A40](result, v5, v6, v7);
      return (v9 & 1) == 0;
    }
  }
  else if ((v8 & 1) == 0)
  {
    if ((_DWORD)v5 == (_DWORD)v7)
    {
      v9 = result < v6;
      return (v9 & 1) == 0;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance CMFormatDescriptionRef.Extensions.Index(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *a1;
  v4 = a1[1];
  v5 = *((_BYTE *)a1 + 16);
  v6 = *a2;
  v7 = a2[1];
  if ((a2[2] & 1) != 0)
  {
    if ((v5 & 1) != 0)
LABEL_9:
      JUMPOUT(0x1BCCB9A40);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if ((v5 & 1) != 0)
    goto LABEL_8;
  if ((_DWORD)v7 != (_DWORD)v4)
  {
    __break(1u);
    goto LABEL_8;
  }
  return v6 < v3;
}

uint64_t CMFormatDescriptionRef.Extensions.Index.hash(into:)()
{
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  return Dictionary.Index.hash(into:)();
}

Swift::Int CMFormatDescriptionRef.Extensions.Index.hashValue.getter()
{
  Hasher.init(_seed:)();
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  Dictionary.Index.hash(into:)();
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CMFormatDescriptionRef.Extensions.Index()
{
  Hasher.init(_seed:)();
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  Dictionary.Index.hash(into:)();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance CMFormatDescriptionRef.Extensions.Index()
{
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  return Dictionary.Index.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CMFormatDescriptionRef.Extensions.Index()
{
  Hasher.init(_seed:)();
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  Dictionary.Index.hash(into:)();
  return Hasher._finalize()();
}

BOOL static CMFormatDescriptionRef.Extensions.== infix(_:_:)()
{
  Class isa;
  Class v1;
  int v2;

  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v1 = Dictionary._bridgeToObjectiveC()().super.isa;
  v2 = CFEqual(isa, v1);

  return v2 != 0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CMFormatDescriptionRef.Extensions()
{
  Class isa;
  Class v1;
  int v2;

  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v1 = Dictionary._bridgeToObjectiveC()().super.isa;
  v2 = CFEqual(isa, v1);

  return v2 != 0;
}

void CMFormatDescriptionRef.Extensions.hash(into:)()
{
  Class isa;
  Swift::UInt v1;

  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v1 = CFHash(isa);

  Hasher._combine(_:)(v1);
}

Swift::Int CMFormatDescriptionRef.Extensions.hashValue.getter()
{
  Class isa;
  Swift::UInt v1;

  Hasher.init(_seed:)();
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v1 = CFHash(isa);

  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CMFormatDescriptionRef.Extensions()
{
  Class isa;
  Swift::UInt v1;

  Hasher.init(_seed:)();
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v1 = CFHash(isa);

  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CMFormatDescriptionRef.Extensions()
{
  Class isa;
  Swift::UInt v1;

  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v1 = CFHash(isa);

  Hasher._combine(_:)(v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CMFormatDescriptionRef.Extensions()
{
  Class isa;
  Swift::UInt v1;

  Hasher.init(_seed:)();
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v1 = CFHash(isa);

  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t _CMFormatDescriptionInitTrampoline.init(mediaType:mediaSubType:extensions:)(CMMediaType *a1, FourCharCode *a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  CMMediaType v6;
  FourCharCode v7;
  uint64_t v8;
  const __CFAllocator *v9;
  NSDictionary v10;
  OSStatus v11;
  CMFormatDescriptionRef v12;
  uint64_t result;
  id v14;
  CMFormatDescriptionRef formatDescriptionOut[2];

  formatDescriptionOut[1] = *(CMFormatDescriptionRef *)MEMORY[0x1E0C80C00];
  v6 = *a1;
  v7 = *a2;
  v8 = *a3;
  formatDescriptionOut[0] = 0;
  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (v8)
  {
    type metadata accessor for CFStringRef(0);
    _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
    swift_bridgeObjectRetain();
    v10.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v10.super.isa = 0;
  }
  v11 = CMFormatDescriptionCreate(v9, v6, v7, v10.super.isa, formatDescriptionOut);

  v12 = formatDescriptionOut[0];
  if (v11 == noErr.getter())
  {
    result = swift_bridgeObjectRelease();
    if (v12)
      return (*(uint64_t (**)(CMFormatDescriptionRef, uint64_t, uint64_t))(a5 + 8))(v12, a4, a5);
    else
      __break(1u);
  }
  else
  {
    v14 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v14, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v11, 0);
    swift_willThrow();

    return swift_bridgeObjectRelease();
  }
  return result;
}

const __CFAllocator *specialized _CMFormatDescriptionInitTrampoline.init(audioStreamBasicDescription:layoutSize:layout:magicCookie:extensions:)(uint64_t a1, size_t a2, const AudioChannelLayout *a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  __int128 v10;
  const __CFAllocator *v11;
  NSDictionary v12;
  OSStatus v13;
  CMAudioFormatDescriptionRef v14;
  id v15;
  AudioStreamBasicDescription asbd;
  CMAudioFormatDescriptionRef formatDescriptionOut[2];

  formatDescriptionOut[1] = *(CMAudioFormatDescriptionRef *)MEMORY[0x1E0C80C00];
  v10 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&asbd.mSampleRate = *(_OWORD *)a1;
  *(_OWORD *)&asbd.mBytesPerPacket = v10;
  *(_QWORD *)&asbd.mBitsPerChannel = *(_QWORD *)(a1 + 32);
  formatDescriptionOut[0] = 0;
  if (a5 >> 60 != 15)
    __asm { BR              X10 }
  v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (a6)
  {
    type metadata accessor for CFStringRef(0);
    _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
    swift_bridgeObjectRetain();
    v12.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  else
  {
    v12.super.isa = 0;
  }
  swift_beginAccess();
  swift_beginAccess();
  v13 = CMAudioFormatDescriptionCreate(v11, &asbd, a2, a3, 0, 0, v12.super.isa, formatDescriptionOut);
  swift_endAccess();
  swift_endAccess();

  if (v13 == noErr.getter())
  {
    swift_beginAccess();
    v14 = formatDescriptionOut[0];
    if (!formatDescriptionOut[0])
    {
      swift_bridgeObjectRelease_n();
      __break(1u);
      JUMPOUT(0x1B8D217A8);
    }
    v11 = (const __CFAllocator *)CMTimebaseRetain(formatDescriptionOut[0]);
    outlined consume of Data?(a4, a5);

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v15 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v15, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v13, 0);
    swift_willThrow();
    outlined consume of Data?(a4, a5);
    swift_bridgeObjectRelease_n();

  }
  return v11;
}

void _CMFormatDescriptionInitTrampoline.init(audioStreamBasicDescription:layoutSize:layout:magicCookie:extensions:)(uint64_t a1, size_t a2, const AudioChannelLayout *a3, uint64_t a4, unint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  __int128 v10;
  const __CFAllocator *v13;
  NSDictionary v14;
  OSStatus v15;
  void (*v16)(void);
  const opaqueCMFormatDescription *v17;
  id v18;
  AudioStreamBasicDescription asbd;
  CMAudioFormatDescriptionRef formatDescriptionOut[3];

  formatDescriptionOut[1] = *(CMAudioFormatDescriptionRef *)MEMORY[0x1E0C80C00];
  v9 = *a6;
  v10 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&asbd.mSampleRate = *(_OWORD *)a1;
  *(_OWORD *)&asbd.mBytesPerPacket = v10;
  *(_QWORD *)&asbd.mBitsPerChannel = *(_QWORD *)(a1 + 32);
  formatDescriptionOut[0] = 0;
  if (a5 >> 60 != 15)
    __asm { BR              X10 }
  v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (v9)
  {
    type metadata accessor for CFStringRef(0);
    _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
    swift_bridgeObjectRetain();
    v14.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  else
  {
    v14.super.isa = 0;
  }
  swift_beginAccess();
  swift_beginAccess();
  v15 = CMAudioFormatDescriptionCreate(v13, &asbd, a2, a3, 0, 0, v14.super.isa, formatDescriptionOut);
  swift_endAccess();
  swift_endAccess();

  if (v15 == noErr.getter())
  {
    swift_beginAccess();
    if (!formatDescriptionOut[0])
    {
      swift_bridgeObjectRelease_n();
      __break(1u);
      JUMPOUT(0x1B8D21EF0);
    }
    v16 = *(void (**)(void))(a8 + 8);
    v17 = formatDescriptionOut[0];
    v16();
    outlined consume of Data?(a4, a5);

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v18 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v18, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v15, 0);
    swift_willThrow();
    outlined consume of Data?(a4, a5);
    swift_bridgeObjectRelease_n();

  }
}

uint64_t _CMFormatDescriptionInitTrampoline.init(audioStreamBasicDescription:layout:magicCookie:extensions:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v12;
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
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v33 = a4;
  v31 = a1;
  v34 = a3;
  v30 = a8;
  v29 = *(_QWORD *)(a6 - 8);
  MEMORY[0x1E0C80A78](a1);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedAudioChannelLayout?);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for ManagedAudioChannelLayout();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *a5;
  outlined init with copy of ManagedAudioChannelLayout?(a2, (uint64_t)v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
    outlined destroy of ManagedAudioChannelLayout?((uint64_t)v16);
    v35 = v21;
    v22 = v32;
    _CMFormatDescriptionInitTrampoline.init(audioStreamBasicDescription:layoutSize:layout:magicCookie:extensions:)(v31, 0, 0, v34, v33, &v35, a6, a7);
    result = outlined destroy of ManagedAudioChannelLayout?(a2);
    if (!v22)
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v29 + 32))(v30, v13, a6);
  }
  else
  {
    v28 = a7;
    v29 = a2;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v20, v16, v17);
    v24 = ManagedAudioChannelLayout.sizeInBytes.getter();
    v25 = MEMORY[0x1E0C80A78](v24);
    *(&v28 - 6) = v31;
    *(&v28 - 5) = v25;
    v26 = v33;
    *(&v28 - 4) = v34;
    *(&v28 - 3) = v26;
    *(&v28 - 2) = v21;
    type metadata accessor for CMFormatDescriptionRef(0);
    v27 = v32;
    ManagedAudioChannelLayout.withUnsafePointer<A>(_:)();
    if (v27)
    {
      outlined destroy of ManagedAudioChannelLayout?(v29);
      (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
      outlined consume of Data?(v34, v26);
      return swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v35, a6);
      outlined consume of Data?(v34, v26);
      outlined destroy of ManagedAudioChannelLayout?(v29);
      return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    }
  }
  return result;
}

const __CFAllocator *closure #1 in _CMFormatDescriptionInitTrampoline.init(audioStreamBasicDescription:layout:magicCookie:extensions:)@<X0>(const AudioChannelLayout *a1@<X0>, uint64_t a2@<X1>, size_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, const __CFAllocator **a7@<X8>)
{
  uint64_t v7;
  const __CFAllocator *result;

  outlined copy of Data?(a4, a5);
  swift_bridgeObjectRetain();
  result = specialized _CMFormatDescriptionInitTrampoline.init(audioStreamBasicDescription:layoutSize:layout:magicCookie:extensions:)(a2, a3, a1, a4, a5, a6);
  if (!v7)
    *a7 = result;
  return result;
}

uint64_t _CMFormatDescriptionInitTrampoline.init(audioFormatDescriptionArray:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const __CFAllocator *v5;
  const __CFArray *isa;
  OSStatus Summary;
  CMAudioFormatDescriptionRef v8;
  uint64_t result;
  id v10;
  CMAudioFormatDescriptionRef v11[2];

  v11[1] = *(CMAudioFormatDescriptionRef *)MEMORY[0x1E0C80C00];
  v11[0] = 0;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  type metadata accessor for CMFormatDescriptionRef(0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  Summary = CMAudioFormatDescriptionCreateSummary(v5, isa, 0, v11);

  v8 = v11[0];
  if (Summary == noErr.getter())
  {
    result = swift_bridgeObjectRelease();
    if (v8)
      return (*(uint64_t (**)(CMAudioFormatDescriptionRef, uint64_t, uint64_t))(a3 + 8))(v8, a2, a3);
    else
      __break(1u);
  }
  else
  {
    v10 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v10, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], Summary, 0);
    swift_willThrow();

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _CMFormatDescriptionInitTrampoline.init(videoCodecType:width:height:extensions:)(CMVideoCodecType *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  int32_t v6;
  uint64_t v7;
  int32_t v8;
  uint64_t result;
  CMVideoCodecType v12;
  const __CFAllocator *v13;
  NSDictionary v14;
  OSStatus v15;
  CMVideoFormatDescriptionRef v16;
  id v17;
  const __CFAllocator *v18;
  CMVideoCodecType v19;
  CMVideoFormatDescriptionRef formatDescriptionOut[2];

  v6 = a2;
  formatDescriptionOut[1] = *(CMVideoFormatDescriptionRef *)MEMORY[0x1E0C80C00];
  v7 = *a4;
  if (a2 == (int)a2 && (v8 = a3, a3 == (int)a3))
  {
    v12 = *a1;
    formatDescriptionOut[0] = 0;
    v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (v7)
    {
      v18 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v19 = v12;
      type metadata accessor for CFStringRef(0);
      _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
      swift_bridgeObjectRetain();
      v14.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      v13 = v18;
      v12 = v19;
    }
    else
    {
      v14.super.isa = 0;
    }
    v15 = CMVideoFormatDescriptionCreate(v13, v12, v6, v8, v14.super.isa, formatDescriptionOut);

    v16 = formatDescriptionOut[0];
    if (v15 == noErr.getter())
    {
      result = swift_bridgeObjectRelease();
      if (v16)
        return (*(uint64_t (**)(CMVideoFormatDescriptionRef, uint64_t, uint64_t))(a6 + 8))(v16, a5, a6);
      else
        __break(1u);
    }
    else
    {
      v17 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
      objc_msgSend(v17, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v15, 0);
      swift_willThrow();

      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    if (one-time initialization token for invalidParameter != -1)
      swift_once();
    (id)static CMFormatDescriptionRef.Error.invalidParameter;
    return swift_willThrow();
  }
  return result;
}

void _CMFormatDescriptionInitTrampoline.init(imageBuffer:)(CVImageBufferRef imageBuffer, uint64_t a2, uint64_t a3)
{
  OSStatus v5;
  CMVideoFormatDescriptionRef v6;
  void (*v7)(void);
  const opaqueCMFormatDescription *v8;
  id v9;
  CMVideoFormatDescriptionRef v10[2];

  v10[1] = *(CMVideoFormatDescriptionRef *)MEMORY[0x1E0C80C00];
  v10[0] = 0;
  v5 = CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], imageBuffer, v10);
  v6 = v10[0];
  if (v5 != noErr.getter())
  {
    v9 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v9, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v5, 0);
    swift_willThrow();

    goto LABEL_5;
  }
  if (v6)
  {
    v7 = *(void (**)(void))(a3 + 8);
    v8 = v6;
    v7();

LABEL_5:
    return;
  }
  __break(1u);
}

uint64_t _CMFormatDescriptionInitTrampoline.init(h264ParameterSets:nalUnitHeaderLength:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v6;
  unint64_t v8;
  int64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFData *v14;
  const __CFData *v15;
  const UInt8 *BytePtr;
  const UInt8 *v17;
  char *v18;
  unint64_t v19;
  unint64_t v20;
  CFIndex Length;
  unint64_t v22;
  uint64_t result;
  const __CFAllocator *v24;
  OSStatus v25;
  CMFormatDescriptionRef v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  size_t parameterSetCount;
  uint64_t v31;
  char *v32;
  CMFormatDescriptionRef formatDescriptionOut[2];

  v6 = a2;
  formatDescriptionOut[1] = *(CMFormatDescriptionRef *)MEMORY[0x1E0C80C00];
  if ((specialized Sequence<>.contains(_:)(a2, (uint64_t)&outlined read-only object #0 of _CMFormatDescriptionInitTrampoline.init(h264ParameterSets:nalUnitHeaderLength:)) & 1) != 0)
  {
    v28 = a3;
    v8 = specialized _arrayForceCast<A, B>(_:)(a1);
    v9 = *(_QWORD *)(a1 + 16);
    swift_bridgeObjectRelease();
    v10 = (char *)MEMORY[0x1E0DEE9D8];
    v32 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v9, 0, MEMORY[0x1E0DEE9D8]);
    parameterSetCount = v9;
    v11 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v9, 0, v10);
    if (v8 >> 62)
      goto LABEL_27;
    v12 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    while (1)
    {
      v31 = v6;
      v29 = a4;
      if (!v12)
        break;
      v13 = 4;
      while (1)
      {
        v14 = (v8 & 0xC000000000000001) != 0
            ? (const __CFData *)MEMORY[0x1BCCB998C](v13 - 4, v8)
            : (const __CFData *)*(id *)(v8 + 8 * v13);
        v15 = v14;
        a4 = v13 - 3;
        if (__OFADD__(v13 - 4, 1))
          break;
        BytePtr = CFDataGetBytePtr(v14);
        if (!BytePtr)
          goto LABEL_30;
        v17 = BytePtr;
        v18 = v32;
        v20 = *((_QWORD *)v32 + 2);
        v19 = *((_QWORD *)v32 + 3);
        if (v20 >= v19 >> 1)
          v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v19 > 1), v20 + 1, 1, v32);
        *((_QWORD *)v18 + 2) = v20 + 1;
        v32 = v18;
        *(_QWORD *)&v18[8 * v20 + 32] = v17;
        Length = CFDataGetLength(v15);
        v6 = *((_QWORD *)v11 + 2);
        v22 = *((_QWORD *)v11 + 3);
        if (v6 >= v22 >> 1)
          v11 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v22 > 1), v6 + 1, 1, v11);
        *((_QWORD *)v11 + 2) = v6 + 1;
        *(_QWORD *)&v11[8 * v6 + 32] = Length;

        ++v13;
        if (a4 == v12)
          goto LABEL_20;
      }
      __break(1u);
LABEL_27:
      swift_bridgeObjectRetain();
      v12 = _CocoaArrayWrapper.endIndex.getter();
    }
LABEL_20:
    swift_bridgeObjectRelease();
    formatDescriptionOut[0] = 0;
    if (v31 < (uint64_t)0xFFFFFFFF80000000)
    {
      __break(1u);
    }
    else if (v31 <= 0x7FFFFFFF)
    {
      v24 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v25 = CMVideoFormatDescriptionCreateFromH264ParameterSets(v24, parameterSetCount, (const uint8_t *const *)v32 + 4, (const size_t *)v11 + 4, v31, formatDescriptionOut);
      v26 = formatDescriptionOut[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = noErr.getter();
      if (v25 == (_DWORD)result)
      {
        if (v26)
        {
          (*(void (**)(CMFormatDescriptionRef, uint64_t))(v29 + 8))(v26, v28);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        else
        {
          __break(1u);
        }
      }
      else
      {
        v27 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
        objc_msgSend(v27, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v25, 0);
        swift_willThrow();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        return swift_bridgeObjectRelease();
      }
      return result;
    }
    __break(1u);
LABEL_30:
    __break(1u);
  }
  swift_bridgeObjectRelease();
  if (one-time initialization token for invalidParameter != -1)
    swift_once();
  (id)static CMFormatDescriptionRef.Error.invalidParameter;
  return swift_willThrow();
}

uint64_t specialized Sequence<>.contains(_:)(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  _BOOL8 v5;
  BOOL v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  if (*(_QWORD *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 5; ; ++i)
  {
    v4 = i - 3;
    if (__OFADD__(i - 4, 1))
      break;
    v6 = *(_QWORD *)(a2 + 8 * i) == result;
    v5 = v6;
    v6 = v6 || v4 == v2;
    if (v6)
      return v5;
  }
  __break(1u);
  return result;
}

uint64_t specialized _arrayForceCast<A, B>(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  unint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x1E0DEE9D8];
  if (v2)
  {
    v7 = MEMORY[0x1E0DEE9D8];
    specialized ContiguousArray.reserveCapacity(_:)();
    v4 = (unint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      outlined copy of Data._Representation(v5, *v4);
      Data._bridgeToObjectiveC()();
      outlined consume of Data._Representation(v5, v6);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t _CMFormatDescriptionInitTrampoline.init(hevcParameterSets:nalUnitHeaderLength:extensions:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  const __CFData *v16;
  uint64_t v17;
  const UInt8 *BytePtr;
  const UInt8 *v19;
  unint64_t v20;
  unint64_t v21;
  CFIndex Length;
  unint64_t v23;
  unint64_t v24;
  uint64_t result;
  const __CFAllocator *v26;
  NSDictionary v27;
  OSStatus v28;
  CMFormatDescriptionRef v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  size_t parameterSetCount;
  uint64_t v34;
  unint64_t v36;
  unint64_t v37;
  CMFormatDescriptionRef formatDescriptionOut[2];

  formatDescriptionOut[1] = *(CMFormatDescriptionRef *)MEMORY[0x1E0C80C00];
  v8 = *a3;
  if ((specialized Sequence<>.contains(_:)(a2, (uint64_t)&outlined read-only object #0 of _CMFormatDescriptionInitTrampoline.init(hevcParameterSets:nalUnitHeaderLength:extensions:)) & 1) != 0)
  {
    v31 = a4;
    v32 = a5;
    v9 = specialized _arrayForceCast<A, B>(_:)(a1);
    v10 = *(_QWORD *)(a1 + 16);
    swift_bridgeObjectRelease();
    v11 = (char *)MEMORY[0x1E0DEE9D8];
    v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v10, 0, MEMORY[0x1E0DEE9D8]);
    parameterSetCount = v10;
    v13 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v10, 0, v11);
    if (v9 >> 62)
      goto LABEL_30;
    v14 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    while (1)
    {
      v34 = v8;
      v37 = v9;
      if (!v14)
        break;
      v36 = v9 & 0xC000000000000001;
      v15 = 4;
      while (1)
      {
        v16 = v36
            ? (const __CFData *)MEMORY[0x1BCCB998C](v15 - 4, v9)
            : (const __CFData *)*(id *)(v9 + 8 * v15);
        v9 = (unint64_t)v16;
        v17 = v15 - 3;
        if (__OFADD__(v15 - 4, 1))
          break;
        v8 = v14;
        BytePtr = CFDataGetBytePtr(v16);
        if (!BytePtr)
          goto LABEL_33;
        v19 = BytePtr;
        v21 = *((_QWORD *)v12 + 2);
        v20 = *((_QWORD *)v12 + 3);
        if (v21 >= v20 >> 1)
          v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v20 > 1), v21 + 1, 1, v12);
        *((_QWORD *)v12 + 2) = v21 + 1;
        *(_QWORD *)&v12[8 * v21 + 32] = v19;
        Length = CFDataGetLength((CFDataRef)v9);
        v24 = *((_QWORD *)v13 + 2);
        v23 = *((_QWORD *)v13 + 3);
        if (v24 >= v23 >> 1)
          v13 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v23 > 1), v24 + 1, 1, v13);
        *((_QWORD *)v13 + 2) = v24 + 1;
        *(_QWORD *)&v13[8 * v24 + 32] = Length;

        ++v15;
        v9 = v37;
        if (v17 == v14)
          goto LABEL_20;
      }
      __break(1u);
LABEL_30:
      swift_bridgeObjectRetain();
      v14 = _CocoaArrayWrapper.endIndex.getter();
    }
LABEL_20:
    swift_bridgeObjectRelease();
    formatDescriptionOut[0] = 0;
    if (a2 < (uint64_t)0xFFFFFFFF80000000)
    {
      __break(1u);
    }
    else if (a2 <= 0x7FFFFFFF)
    {
      v26 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      if (v34)
      {
        type metadata accessor for CFStringRef(0);
        _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v27.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v27.super.isa = 0;
      }
      v28 = CMVideoFormatDescriptionCreateFromHEVCParameterSets(v26, parameterSetCount, (const uint8_t *const *)v12 + 4, (const size_t *)v13 + 4, a2, v27.super.isa, formatDescriptionOut);

      v29 = formatDescriptionOut[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v28 == noErr.getter())
      {
        result = swift_bridgeObjectRelease();
        if (v29)
        {
          (*(void (**)(CMFormatDescriptionRef, uint64_t))(v32 + 8))(v29, v31);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        else
        {
          __break(1u);
        }
      }
      else
      {
        v30 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
        objc_msgSend(v30, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v28, 0);
        swift_willThrow();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      return result;
    }
    __break(1u);
LABEL_33:
    __break(1u);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (one-time initialization token for invalidParameter != -1)
    swift_once();
  (id)static CMFormatDescriptionRef.Error.invalidParameter;
  return swift_willThrow();
}

void _CMFormatDescriptionInitTrampoline.init(taggedBuffers:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OpaqueCMTaggedBufferGroup *v4;
  void (*v5)(void);
  const opaqueCMFormatDescription *v6;
  CMTaggedBufferGroupFormatDescriptionRef v7[2];

  v7[1] = *(CMTaggedBufferGroupFormatDescriptionRef *)MEMORY[0x1E0C80C00];
  v7[0] = 0;
  v4 = (OpaqueCMTaggedBufferGroup *)Array<A>.taggedBufferGroup.getter(a1);
  swift_bridgeObjectRelease();
  CMTaggedBufferGroupFormatDescriptionCreateForTaggedBufferGroup((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, v7);
  if (!v7[0])
    __break(1u);
  v5 = *(void (**)(void))(a3 + 8);
  v6 = v7[0];
  v5();

}

uint64_t _CMFormatDescriptionInitTrampoline.init(muxedStreamType:extensions:)(CMMuxedStreamType *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  CMMuxedStreamType v6;
  uint64_t v7;
  const __CFAllocator *v8;
  NSDictionary v9;
  OSStatus v10;
  CMMuxedFormatDescriptionRef v11;
  uint64_t result;
  id v13;
  CMMuxedFormatDescriptionRef v14[2];

  v14[1] = *(CMMuxedFormatDescriptionRef *)MEMORY[0x1E0C80C00];
  v6 = *a1;
  v7 = *a2;
  v14[0] = 0;
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (v7)
  {
    type metadata accessor for CFStringRef(0);
    _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
    swift_bridgeObjectRetain();
    v9.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  v10 = CMMuxedFormatDescriptionCreate(v8, v6, v9.super.isa, v14);

  v11 = v14[0];
  if (v10 == noErr.getter())
  {
    result = swift_bridgeObjectRelease();
    if (v11)
      return (*(uint64_t (**)(CMMuxedFormatDescriptionRef, uint64_t, uint64_t))(a4 + 8))(v11, a3, a4);
    else
      __break(1u);
  }
  else
  {
    v13 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v13, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v10, 0);
    swift_willThrow();

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _CMFormatDescriptionInitTrampoline.init(timeCodeFormatType:frameDuration:frameQuanta:flags:extensions:)(CMTimeCodeFormatType *a1, CMTimeValue a2, unint64_t a3, CMTimeEpoch a4, unint64_t a5, uint32_t *a6, uint64_t *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t result;
  uint32_t v11;
  CMTimeScale v13;
  unint64_t v15;
  CMTimeCodeFormatType v16;
  uint32_t v17;
  const __CFAllocator *v18;
  NSDictionary v19;
  OSStatus v20;
  CMTimeCodeFormatDescriptionRef v21;
  id v22;
  uint32_t v23;
  CMTimeCodeFormatType v24;
  CMTime frameDuration;
  CMTimeCodeFormatDescriptionRef formatDescriptionOut[2];

  formatDescriptionOut[1] = *(CMTimeCodeFormatDescriptionRef *)MEMORY[0x1E0C80C00];
  v9 = *a7;
  if (HIDWORD(a5))
  {
    swift_bridgeObjectRelease();
    if (one-time initialization token for invalidParameter != -1)
      swift_once();
    (id)static CMFormatDescriptionRef.Error.invalidParameter;
    return swift_willThrow();
  }
  else
  {
    v11 = a5;
    v13 = a3;
    v15 = HIDWORD(a3);
    v16 = *a1;
    v17 = *a6;
    formatDescriptionOut[0] = 0;
    v18 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (v9)
    {
      v23 = v17;
      v24 = v16;
      type metadata accessor for CFStringRef(0);
      _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
      swift_bridgeObjectRetain();
      v19.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      v17 = v23;
      v16 = v24;
    }
    else
    {
      v19.super.isa = 0;
    }
    frameDuration.value = a2;
    frameDuration.timescale = v13;
    frameDuration.flags = v15;
    frameDuration.epoch = a4;
    v20 = CMTimeCodeFormatDescriptionCreate(v18, v16, &frameDuration, v11, v17, v19.super.isa, formatDescriptionOut);

    v21 = formatDescriptionOut[0];
    if (v20 == noErr.getter())
    {
      result = swift_bridgeObjectRelease();
      if (v21)
        return (*(uint64_t (**)(CMTimeCodeFormatDescriptionRef, uint64_t))(a9 + 8))(v21, a8);
      else
        __break(1u);
    }
    else
    {
      v22 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
      objc_msgSend(v22, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v20, 0);
      swift_willThrow();

      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

void _CMFormatDescriptionInitTrampoline.init(metadataFormatType:)(CMMetadataFormatType *a1, uint64_t a2, uint64_t a3)
{
  CMMetadataFormatType v5;
  OSStatus v6;
  CMMetadataFormatDescriptionRef v7;
  id v8;
  CMMetadataFormatDescriptionRef v9[2];

  v9[1] = *(CMMetadataFormatDescriptionRef *)MEMORY[0x1E0C80C00];
  v5 = *a1;
  v9[0] = 0;
  v6 = CMMetadataFormatDescriptionCreateWithKeys((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v5, 0, v9);
  v7 = v9[0];
  if (v6 == noErr.getter())
  {
    if (v7)
      (*(void (**)(CMMetadataFormatDescriptionRef, uint64_t, uint64_t))(a3 + 8))(v7, a2, a3);
    else
      __break(1u);
  }
  else
  {
    v8 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v8, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v6, 0);
    swift_willThrow();

  }
}

uint64_t _CMFormatDescriptionInitTrampoline.init(boxedMetadataKeys:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _CMFormatDescriptionInitTrampoline.init(boxedMetadataKeys:)(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, Class, _QWORD *))MEMORY[0x1E0C9EE80]);
}

uint64_t _CMFormatDescriptionInitTrampoline.init(boxedMetadataSpecifications:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _CMFormatDescriptionInitTrampoline.init(boxedMetadataKeys:)(a1, a2, a3, MEMORY[0x1E0C9EE90]);
}

uint64_t _CMFormatDescriptionInitTrampoline.init(boxedMetadataKeys:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, Class, _QWORD *))
{
  uint64_t v7;
  Class isa;
  int v9;
  void *v10;
  uint64_t result;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v13[0] = 0;
  v7 = *MEMORY[0x1E0C9AE00];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Swift.AnyObject]);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v9 = a4(v7, 1835360888, isa, v13);

  v10 = (void *)v13[0];
  if (v9 == noErr.getter())
  {
    result = swift_bridgeObjectRelease();
    if (v10)
      return (*(uint64_t (**)(void *, uint64_t, uint64_t))(a3 + 8))(v10, a2, a3);
    else
      __break(1u);
  }
  else
  {
    v12 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v12, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v9, 0);
    swift_willThrow();

    return swift_bridgeObjectRelease();
  }
  return result;
}

void _CMFormatDescriptionInitTrampoline.init(sourceMetadata:specifications:)(const opaqueCMFormatDescription *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  const __CFAllocator *v6;
  const __CFArray *isa;
  OSStatus v8;
  CMMetadataFormatDescriptionRef v9;
  void (*v10)(void);
  const opaqueCMFormatDescription *v11;
  id v12;
  CMMetadataFormatDescriptionRef v13[2];

  v13[1] = *(CMMetadataFormatDescriptionRef *)MEMORY[0x1E0C80C00];
  v13[0] = 0;
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Swift.AnyObject]);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v8 = CMMetadataFormatDescriptionCreateWithMetadataFormatDescriptionAndMetadataSpecifications(v6, a1, isa, v13);

  v9 = v13[0];
  if (v8 != noErr.getter())
  {
    v12 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v12, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v8, 0);
    swift_willThrow();

    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  if (v9)
  {
    v10 = *(void (**)(void))(a4 + 8);
    v11 = v9;
    v10();

LABEL_5:
    return;
  }
  __break(1u);
}

void _CMFormatDescriptionInitTrampoline.init(sourceMetadata:otherSourceDescription:)(CMMetadataFormatDescriptionRef sourceDescription, CMMetadataFormatDescriptionRef otherSourceDescription, uint64_t a3, uint64_t a4)
{
  OSStatus v7;
  CMMetadataFormatDescriptionRef v8;
  void (*v9)(void);
  const opaqueCMFormatDescription *v10;
  id v11;
  CMMetadataFormatDescriptionRef formatDescriptionOut[2];

  formatDescriptionOut[1] = *(CMMetadataFormatDescriptionRef *)MEMORY[0x1E0C80C00];
  formatDescriptionOut[0] = 0;
  v7 = CMMetadataFormatDescriptionCreateByMergingMetadataFormatDescriptions((CFAllocatorRef)*MEMORY[0x1E0C9AE00], sourceDescription, otherSourceDescription, formatDescriptionOut);
  v8 = formatDescriptionOut[0];
  if (v7 == noErr.getter())
  {
    if (v8)
    {
      v9 = *(void (**)(void))(a4 + 8);
      v10 = v8;
      v9();

    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    v11 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v11, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v7, 0);
    swift_willThrow();

  }
}

id static CMFormatDescriptionRef.Error.invalidParameter.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidParameter, (id *)&static CMFormatDescriptionRef.Error.invalidParameter);
}

id static CMFormatDescriptionRef.Error.allocationFailed.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for allocationFailed, (id *)&static CMFormatDescriptionRef.Error.allocationFailed);
}

id one-time initialization function for valueNotAvailable()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12718, 0);
  static CMFormatDescriptionRef.Error.valueNotAvailable = (uint64_t)result;
  return result;
}

id static CMFormatDescriptionRef.Error.valueNotAvailable.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for valueNotAvailable, (id *)&static CMFormatDescriptionRef.Error.valueNotAvailable);
}

uint64_t _CMFormatDescriptionFourCCConvertible.init(string:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t result;
  unint64_t v9;
  uint64_t v11;
  _DWORD v12[4];

  v4 = type metadata accessor for Optional();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)v12 - v5;
  v7 = String.utf8CString.getter();
  result = swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(v7 + 16);
  if (v9 < 2 || ((v9 - 1) & 0x7FFFFFFFFFFFFFFFLL) != 4)
    goto LABEL_18;
  if (*(char *)(v7 + 32) < 0 || *(char *)(v7 + 33) < 0 || *(char *)(v7 + 34) < 0 || *(char *)(v7 + 35) < 0)
  {
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(char *)(v7 + 32) < 0 || *(char *)(v7 + 33) < 0 || *(char *)(v7 + 34) < 0 || *(char *)(v7 + 35) < 0)
    goto LABEL_17;
  v12[3] = *(unsigned __int8 *)(v7 + 35) | (((*(unsigned __int8 *)(v7 + 33) << 8) | (*(unsigned __int8 *)(v7 + 32) << 16) | *(unsigned __int8 *)(v7 + 34)) << 8);
  dispatch thunk of RawRepresentable.init(rawValue:)();
  v11 = *(_QWORD *)(a1 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 1, a1);
  if ((_DWORD)result != 1)
  {
    swift_unknownObjectRelease();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a2, v6, a1);
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t CMFormatDescriptionRef.MediaType.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t CMFormatDescriptionRef.MediaType.rawValue.setter(uint64_t result)
{
  _DWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*CMFormatDescriptionRef.MediaType.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

void static CMFormatDescriptionRef.MediaType.video.getter(_DWORD *a1@<X8>)
{
  *a1 = 1986618469;
}

void static CMFormatDescriptionRef.MediaType.audio.getter(_DWORD *a1@<X8>)
{
  *a1 = 1936684398;
}

void static CMFormatDescriptionRef.MediaType.muxed.getter(_DWORD *a1@<X8>)
{
  *a1 = 1836415096;
}

void static CMFormatDescriptionRef.MediaType.text.getter(_DWORD *a1@<X8>)
{
  *a1 = 1952807028;
}

void static CMFormatDescriptionRef.MediaType.closedCaption.getter(_DWORD *a1@<X8>)
{
  *a1 = 1668047728;
}

void static CMFormatDescriptionRef.MediaType.subtitle.getter(_DWORD *a1@<X8>)
{
  *a1 = 1935832172;
}

void static CMFormatDescriptionRef.MediaType.timeCode.getter(_DWORD *a1@<X8>)
{
  *a1 = 1953325924;
}

void static CMFormatDescriptionRef.MediaType.metadata.getter(_DWORD *a1@<X8>)
{
  *a1 = 1835365473;
}

void static CMFormatDescriptionRef.MediaType.taggedBufferGroup.getter(_DWORD *a1@<X8>)
{
  *a1 = 1952606066;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CMFormatDescriptionRef.MediaType()
{
  unsigned int *v0;

  return specialized _CMFormatDescriptionFourCCConvertible.description.getter(*v0);
}

uint64_t CMFormatDescriptionRef.MediaSubType.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t (*CMFormatDescriptionRef.MediaSubType.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

void static CMFormatDescriptionRef.MediaSubType.linearPCM.getter(_DWORD *a1@<X8>)
{
  *a1 = 1819304813;
}

void static CMFormatDescriptionRef.MediaSubType.ac3.getter(_DWORD *a1@<X8>)
{
  *a1 = 1633889587;
}

void static CMFormatDescriptionRef.MediaSubType.iec60958AC3.getter(_DWORD *a1@<X8>)
{
  *a1 = 1667326771;
}

void static CMFormatDescriptionRef.MediaSubType.appleIMA4.getter(_DWORD *a1@<X8>)
{
  *a1 = 1768775988;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4AAC.getter(_DWORD *a1@<X8>)
{
  *a1 = 1633772320;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4CELP.getter(_DWORD *a1@<X8>)
{
  *a1 = 1667591280;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4HVXC.getter(_DWORD *a1@<X8>)
{
  *a1 = 1752594531;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4TwinVQ.getter(_DWORD *a1@<X8>)
{
  *a1 = 1953986161;
}

void static CMFormatDescriptionRef.MediaSubType.mace3.getter(_DWORD *a1@<X8>)
{
  *a1 = 1296122675;
}

void static CMFormatDescriptionRef.MediaSubType.mace6.getter(_DWORD *a1@<X8>)
{
  *a1 = 1296122678;
}

void static CMFormatDescriptionRef.MediaSubType.uLaw.getter(_DWORD *a1@<X8>)
{
  *a1 = 1970037111;
}

void static CMFormatDescriptionRef.MediaSubType.aLaw.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634492791;
}

void static CMFormatDescriptionRef.MediaSubType.qDesign.getter(_DWORD *a1@<X8>)
{
  *a1 = 1363430723;
}

void static CMFormatDescriptionRef.MediaSubType.qDesign2.getter(_DWORD *a1@<X8>)
{
  *a1 = 1363430706;
}

void static CMFormatDescriptionRef.MediaSubType.qualcomm.getter(_DWORD *a1@<X8>)
{
  *a1 = 1365470320;
}

void static CMFormatDescriptionRef.MediaSubType.mpegLayer1.getter(_DWORD *a1@<X8>)
{
  *a1 = 778924081;
}

void static CMFormatDescriptionRef.MediaSubType.mpegLayer2.getter(_DWORD *a1@<X8>)
{
  *a1 = 778924082;
}

void static CMFormatDescriptionRef.MediaSubType.mpegLayer3.getter(_DWORD *a1@<X8>)
{
  *a1 = 778924083;
}

void static CMFormatDescriptionRef.MediaSubType.timeCode.getter(_DWORD *a1@<X8>)
{
  *a1 = 1953066341;
}

void static CMFormatDescriptionRef.MediaSubType.midiStream.getter(_DWORD *a1@<X8>)
{
  *a1 = 1835623529;
}

void static CMFormatDescriptionRef.MediaSubType.parameterValueStream.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634760307;
}

void static CMFormatDescriptionRef.MediaSubType.appleLossless.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634492771;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4AAC_HE.getter(_DWORD *a1@<X8>)
{
  *a1 = 1633772392;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4AAC_LD.getter(_DWORD *a1@<X8>)
{
  *a1 = 1633772396;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4AAC_ELD.getter(_DWORD *a1@<X8>)
{
  *a1 = 1633772389;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4AAC_ELD_SBR.getter(_DWORD *a1@<X8>)
{
  *a1 = 1633772390;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4AAC_ELD_V2.getter(_DWORD *a1@<X8>)
{
  *a1 = 1633772391;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4AAC_HE_V2.getter(_DWORD *a1@<X8>)
{
  *a1 = 1633772400;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4AAC_Spatial.getter(_DWORD *a1@<X8>)
{
  *a1 = 1633772403;
}

void static CMFormatDescriptionRef.MediaSubType.mpegD_USAC.getter(_DWORD *a1@<X8>)
{
  *a1 = 1970495843;
}

void static CMFormatDescriptionRef.MediaSubType.amr.getter(_DWORD *a1@<X8>)
{
  *a1 = 1935764850;
}

void static CMFormatDescriptionRef.MediaSubType.amr_WB.getter(_DWORD *a1@<X8>)
{
  *a1 = 1935767394;
}

void static CMFormatDescriptionRef.MediaSubType.audible.getter(_DWORD *a1@<X8>)
{
  *a1 = 1096107074;
}

void static CMFormatDescriptionRef.MediaSubType.iLBC.getter(_DWORD *a1@<X8>)
{
  *a1 = 1768710755;
}

void static CMFormatDescriptionRef.MediaSubType.dviIntelIMA.getter(_DWORD *a1@<X8>)
{
  *a1 = 1836253201;
}

void static CMFormatDescriptionRef.MediaSubType.microsoftGSM.getter(_DWORD *a1@<X8>)
{
  *a1 = 1836253233;
}

void static CMFormatDescriptionRef.MediaSubType.aes3.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634038579;
}

void static CMFormatDescriptionRef.MediaSubType.enhancedAC3.getter(_DWORD *a1@<X8>)
{
  *a1 = 1700998451;
}

void static CMFormatDescriptionRef.MediaSubType.flac.getter(_DWORD *a1@<X8>)
{
  *a1 = 1718378851;
}

void static CMFormatDescriptionRef.MediaSubType.opus.getter(_DWORD *a1@<X8>)
{
  *a1 = 1869641075;
}

void static CMFormatDescriptionRef.MediaSubType.aacLCProtected.getter(_DWORD *a1@<X8>)
{
  *a1 = 1885430115;
}

void static CMFormatDescriptionRef.MediaSubType.aacAudibleProtected.getter(_DWORD *a1@<X8>)
{
  *a1 = 1633771875;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_32ARGB.getter(_DWORD *a1@<X8>)
{
  *a1 = 32;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_32BGRA.getter(_DWORD *a1@<X8>)
{
  *a1 = 1111970369;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_24RGB.getter(_DWORD *a1@<X8>)
{
  *a1 = 24;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_16BE555.getter(_DWORD *a1@<X8>)
{
  *a1 = 16;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_16BE565.getter(_DWORD *a1@<X8>)
{
  *a1 = 1110783541;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_16LE555.getter(_DWORD *a1@<X8>)
{
  *a1 = 1278555445;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_16LE565.getter(_DWORD *a1@<X8>)
{
  *a1 = 1278555701;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_16LE5551.getter(_DWORD *a1@<X8>)
{
  *a1 = 892679473;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_422YpCbCr8.getter(_DWORD *a1@<X8>)
{
  *a1 = 846624121;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_422YpCbCr8_yuvs.getter(_DWORD *a1@<X8>)
{
  *a1 = 2037741171;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_444YpCbCr8.getter(_DWORD *a1@<X8>)
{
  *a1 = 1983066168;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_4444YpCbCrA8.getter(_DWORD *a1@<X8>)
{
  *a1 = 1983131704;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_422YpCbCr16.getter(_DWORD *a1@<X8>)
{
  *a1 = 1983000886;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_422YpCbCr10.getter(_DWORD *a1@<X8>)
{
  *a1 = 1983000880;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_444YpCbCr10.getter(_DWORD *a1@<X8>)
{
  *a1 = 1983131952;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_8IndexedGray_WhiteIsZero.getter(_DWORD *a1@<X8>)
{
  *a1 = 40;
}

void static CMFormatDescriptionRef.MediaSubType.animation.getter(_DWORD *a1@<X8>)
{
  *a1 = 1919706400;
}

void static CMFormatDescriptionRef.MediaSubType.cinepak.getter(_DWORD *a1@<X8>)
{
  *a1 = 1668704612;
}

void static CMFormatDescriptionRef.MediaSubType.jpeg.getter(_DWORD *a1@<X8>)
{
  *a1 = 1785750887;
}

void static CMFormatDescriptionRef.MediaSubType.jpeg_OpenDML.getter(_DWORD *a1@<X8>)
{
  *a1 = 1684890161;
}

void static CMFormatDescriptionRef.MediaSubType.sorensonVideo.getter(_DWORD *a1@<X8>)
{
  *a1 = 1398165809;
}

void static CMFormatDescriptionRef.MediaSubType.sorensonVideo3.getter(_DWORD *a1@<X8>)
{
  *a1 = 1398165811;
}

void static CMFormatDescriptionRef.MediaSubType.h263.getter(_DWORD *a1@<X8>)
{
  *a1 = 1748121139;
}

void static CMFormatDescriptionRef.MediaSubType.h264.getter(_DWORD *a1@<X8>)
{
  *a1 = 1635148593;
}

void static CMFormatDescriptionRef.MediaSubType.hevc.getter(_DWORD *a1@<X8>)
{
  *a1 = 1752589105;
}

void static CMFormatDescriptionRef.MediaSubType.hevcWithAlpha.getter(_DWORD *a1@<X8>)
{
  *a1 = 1836415073;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4Video.getter(_DWORD *a1@<X8>)
{
  *a1 = 1836070006;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg2Video.getter(_DWORD *a1@<X8>)
{
  *a1 = 1836069494;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg1Video.getter(_DWORD *a1@<X8>)
{
  *a1 = 1836069238;
}

void static CMFormatDescriptionRef.MediaSubType.dvcNTSC.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685480224;
}

void static CMFormatDescriptionRef.MediaSubType.dvcPAL.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685480304;
}

void static CMFormatDescriptionRef.MediaSubType.dvcProPAL.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685483632;
}

void static CMFormatDescriptionRef.MediaSubType.dvcPro50NTSC.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685468526;
}

void static CMFormatDescriptionRef.MediaSubType.dvcPro50PAL.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685468528;
}

void static CMFormatDescriptionRef.MediaSubType.dvcPROHD720p60.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685481584;
}

void static CMFormatDescriptionRef.MediaSubType.dvcPROHD720p50.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685481585;
}

void static CMFormatDescriptionRef.MediaSubType.dvcPROHD1080i60.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685481526;
}

void static CMFormatDescriptionRef.MediaSubType.dvcPROHD1080i50.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685481525;
}

void static CMFormatDescriptionRef.MediaSubType.dvcPROHD1080p30.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685481523;
}

void static CMFormatDescriptionRef.MediaSubType.dvcPROHD1080p25.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685481522;
}

void static CMFormatDescriptionRef.MediaSubType.proRes4444XQ.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634743416;
}

void static CMFormatDescriptionRef.MediaSubType.proRes4444.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634743400;
}

void static CMFormatDescriptionRef.MediaSubType.proRes422HQ.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634755432;
}

void static CMFormatDescriptionRef.MediaSubType.proRes422.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634755438;
}

void static CMFormatDescriptionRef.MediaSubType.proRes422LT.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634755443;
}

void static CMFormatDescriptionRef.MediaSubType.proRes422Proxy.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634755439;
}

void static CMFormatDescriptionRef.MediaSubType.proResRAW.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634759278;
}

void static CMFormatDescriptionRef.MediaSubType.proResRAWHQ.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634759272;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg1System.getter(_DWORD *a1@<X8>)
{
  *a1 = 1836069235;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg2Transport.getter(_DWORD *a1@<X8>)
{
  *a1 = 1836069492;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg2Program.getter(_DWORD *a1@<X8>)
{
  *a1 = 1836069488;
}

void static CMFormatDescriptionRef.MediaSubType.dv.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685463072;
}

void static CMFormatDescriptionRef.MediaSubType.embeddedDeviceScreenRecording.getter(_DWORD *a1@<X8>)
{
  *a1 = 1769173536;
}

void static CMFormatDescriptionRef.MediaSubType.cea608.getter(_DWORD *a1@<X8>)
{
  *a1 = 1664495672;
}

void static CMFormatDescriptionRef.MediaSubType.cea708.getter(_DWORD *a1@<X8>)
{
  *a1 = 1664561208;
}

void static CMFormatDescriptionRef.MediaSubType.atsc.getter(_DWORD *a1@<X8>)
{
  *a1 = 1635017571;
}

void static CMFormatDescriptionRef.MediaSubType.mobile3GPP.getter(_DWORD *a1@<X8>)
{
  *a1 = 1954034535;
}

void static CMFormatDescriptionRef.MediaSubType.webVTT.getter(_DWORD *a1@<X8>)
{
  *a1 = 2004251764;
}

void static CMFormatDescriptionRef.MediaSubType.timeCode64.getter(_DWORD *a1@<X8>)
{
  *a1 = 1952658996;
}

void static CMFormatDescriptionRef.MediaSubType.counter32.getter(_DWORD *a1@<X8>)
{
  *a1 = 1668166450;
}

void static CMFormatDescriptionRef.MediaSubType.counter64.getter(_DWORD *a1@<X8>)
{
  *a1 = 1668167220;
}

void static CMFormatDescriptionRef.MediaSubType.icy.getter(_DWORD *a1@<X8>)
{
  *a1 = 1768126752;
}

void static CMFormatDescriptionRef.MediaSubType.id3.getter(_DWORD *a1@<X8>)
{
  *a1 = 1768174368;
}

void static CMFormatDescriptionRef.MediaSubType.boxed.getter(_DWORD *a1@<X8>)
{
  *a1 = 1835360888;
}

void static CMFormatDescriptionRef.MediaSubType.emsg.getter(_DWORD *a1@<X8>)
{
  *a1 = 1701671783;
}

Swift::Bool __swiftcall CMFormatDescriptionRef.equalTo(_:extensionKeysToIgnore:sampleDescriptionExtensionAtomKeysToIgnore:)(CMFormatDescriptionRef _, Swift::OpaquePointer extensionKeysToIgnore, Swift::OpaquePointer sampleDescriptionExtensionAtomKeysToIgnore)
{
  const opaqueCMFormatDescription *v3;
  Class isa;
  Class v6;
  int v7;

  isa = Array._bridgeToObjectiveC()().super.isa;
  v6 = Array._bridgeToObjectiveC()().super.isa;
  v7 = CMFormatDescriptionEqualIgnoringExtensionKeys(v3, _, isa, v6);

  return v7 != 0;
}

uint64_t CMFormatDescriptionRef.mediaType.getter@<X0>(_DWORD *a1@<X8>)
{
  const opaqueCMFormatDescription *v1;
  uint64_t result;

  result = CMFormatDescriptionGetMediaType(v1);
  *a1 = result;
  return result;
}

uint64_t CMFormatDescriptionRef.mediaSubType.getter@<X0>(_DWORD *a1@<X8>)
{
  const opaqueCMFormatDescription *v1;
  uint64_t result;

  result = CMFormatDescriptionGetMediaSubType(v1);
  *a1 = result;
  return result;
}

void CMFormatDescriptionRef.extensions.getter(_QWORD *a1@<X8>)
{
  const opaqueCMFormatDescription *v1;
  const __CFDictionary *v3;
  uint64_t v4;
  const __CFDictionary *v5;
  const __CFDictionary *v6;

  v3 = CMFormatDescriptionGetExtensions(v1);
  v4 = MEMORY[0x1E0DEE9E0];
  if (v3)
  {
    v5 = v3;
    type metadata accessor for CFStringRef(0);
    _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
    v6 = v5;
    static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();

  }
  *a1 = v4;
}

BOOL static CMFormatDescriptionRef.== infix(_:_:)(const opaqueCMFormatDescription *a1, const opaqueCMFormatDescription *a2)
{
  return CMFormatDescriptionEqual(a1, a2) != 0;
}

const AudioStreamBasicDescription *CMFormatDescriptionRef.audioStreamBasicDescription.getter@<X0>(uint64_t a1@<X8>)
{
  const opaqueCMFormatDescription *v1;
  const AudioStreamBasicDescription *result;
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  result = CMAudioFormatDescriptionGetStreamBasicDescription(v1);
  if (result)
  {
    v4 = *(_OWORD *)&result->mSampleRate;
    v5 = *(_OWORD *)&result->mBytesPerPacket;
    v6 = *(_QWORD *)&result->mBitsPerChannel;
  }
  else
  {
    v6 = 0;
    v4 = 0uLL;
    v5 = 0uLL;
  }
  *(_OWORD *)a1 = v4;
  *(_OWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_BYTE *)(a1 + 40) = result == 0;
  return result;
}

uint64_t CMFormatDescriptionRef.withMagicCookie<A>(_:)(uint64_t (*a1)(const void *, size_t, BOOL))
{
  const opaqueCMFormatDescription *v1;
  const void *MagicCookie;
  size_t v4;
  size_t v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  MagicCookie = CMAudioFormatDescriptionGetMagicCookie(v1, v6);
  if (MagicCookie)
    v4 = (size_t)MagicCookie + v6[0];
  else
    v4 = 0;
  return a1(MagicCookie, v4, MagicCookie == 0);
}

_BYTE *CMFormatDescriptionRef.magicCookie.getter()
{
  const opaqueCMFormatDescription *v0;
  _BYTE *result;
  size_t v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = 0;
  result = CMAudioFormatDescriptionGetMagicCookie(v0, v2);
  if (result)
    return (_BYTE *)specialized Data.init(bytes:count:)(result, v2[0]);
  return result;
}

uint64_t CMFormatDescriptionRef.audioChannelLayout.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v7;
  size_t sizeOut[2];

  sizeOut[1] = *MEMORY[0x1E0C80C00];
  v3 = type metadata accessor for AudioChannelLayout.UnsafePointer();
  MEMORY[0x1E0C80A78](v3);
  sizeOut[0] = 0;
  if (CMAudioFormatDescriptionGetChannelLayout((CMAudioFormatDescriptionRef)v1, sizeOut))
  {
    UnsafeMutableAudioBufferListPointer.init(_:)();
    *(_QWORD *)(swift_allocObject() + 16) = v1;
    v4 = v1;
    ManagedAudioChannelLayout.init(audioChannelLayoutPointer:deallocator:)();
    v5 = type metadata accessor for ManagedAudioChannelLayout();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(a1, 0, 1, v5);
  }
  else
  {
    v7 = type metadata accessor for ManagedAudioChannelLayout();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(a1, 1, 1, v7);
  }
}

_QWORD *CMFormatDescriptionRef.audioFormatList.getter()
{
  const opaqueCMFormatDescription *v0;
  const AudioFormatListItem *FormatList;
  size_t v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  FormatList = CMAudioFormatDescriptionGetFormatList(v0, v3);
  if (FormatList)
    return specialized _copyCollectionToContiguousArray<A>(_:)(FormatList, (int64_t)v3[0] / 48);
  else
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
}

uint64_t CMFormatDescriptionRef.richestDecodableFormat.getter@<X0>(uint64_t a1@<X8>)
{
  return CMFormatDescriptionRef.richestDecodableFormat.getter(MEMORY[0x1E0C9EAC8], a1);
}

uint64_t CMFormatDescriptionRef.mostCompatibleFormat.getter@<X0>(uint64_t a1@<X8>)
{
  return CMFormatDescriptionRef.richestDecodableFormat.getter(MEMORY[0x1E0C9EAB8], a1);
}

uint64_t CMFormatDescriptionRef.richestDecodableFormat.getter@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  result = a1(v2);
  if (result)
  {
    v5 = *(_OWORD *)result;
    v6 = *(_OWORD *)(result + 16);
    v7 = *(_QWORD *)(result + 32);
    v8 = *(unsigned int *)(result + 40);
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v5 = 0uLL;
    v6 = 0uLL;
  }
  *(_OWORD *)a2 = v5;
  *(_OWORD *)(a2 + 16) = v6;
  *(_QWORD *)(a2 + 32) = v7;
  *(_QWORD *)(a2 + 40) = v8;
  *(_BYTE *)(a2 + 48) = result == 0;
  return result;
}

uint64_t CMFormatDescriptionRef.EqualityMask.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

void static CMFormatDescriptionRef.EqualityMask.streamBasicDescription.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

void static CMFormatDescriptionRef.EqualityMask.magicCookie.getter(_DWORD *a1@<X8>)
{
  *a1 = 2;
}

void static CMFormatDescriptionRef.EqualityMask.channelLayout.getter(_DWORD *a1@<X8>)
{
  *a1 = 4;
}

void static CMFormatDescriptionRef.EqualityMask.extensions.getter(_DWORD *a1@<X8>)
{
  *a1 = 8;
}

void static CMFormatDescriptionRef.EqualityMask.all.getter(_DWORD *a1@<X8>)
{
  *a1 = 15;
}

BOOL CMFormatDescriptionRef.equalTo(_:equalityMask:)(CMAudioFormatDescriptionMask *a1, const opaqueCMFormatDescription *a2, CMAudioFormatDescriptionMask *a3)
{
  const opaqueCMFormatDescription *v3;
  CMAudioFormatDescriptionMask v5;
  _BOOL8 result;
  CMAudioFormatDescriptionMask equalityMaskOut;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = *a3;
  equalityMaskOut = 0;
  result = CMAudioFormatDescriptionEqual(v3, a2, v5, &equalityMaskOut) != 0;
  *a1 = equalityMaskOut;
  return result;
}

uint64_t CMFormatDescriptionRef.ParameterSetCollection.startIndex.getter()
{
  return 0;
}

uint64_t CMFormatDescriptionRef.ParameterSetCollection.endIndex.getter()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 16);
}

unint64_t CMFormatDescriptionRef.ParameterSetCollection.subscript.getter(unint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(*(_QWORD *)v1 + 16) > result)
  {
    v2 = *(_QWORD *)v1 + 16 * result;
    v3 = *(_QWORD *)(v2 + 32);
    outlined copy of Data._Representation(v3, *(_QWORD *)(v2 + 40));
    return v3;
  }
  __break(1u);
  return result;
}

unint64_t specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(unint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v6;
  BOOL v7;

  v4 = *(_QWORD *)(a4 + 16);
  if (v4 < result || v4 < a3)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = a3 - result;
  if (a2 >= 1)
  {
    if (v6 < 0 || v6 >= (unint64_t)a2)
      goto LABEL_13;
    return 0;
  }
  if (v6 <= 0 && v6 > a2)
    return 0;
LABEL_13:
  v7 = __OFADD__(result, a2);
  result += a2;
  if (v7)
    goto LABEL_16;
  if (result > v4)
LABEL_17:
    __break(1u);
  return result;
}

_QWORD *protocol witness for BidirectionalCollection.index(before:) in conformance CMFormatDescriptionRef.ParameterSetCollection@<X0>(_QWORD *result@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;
  unint64_t v3;

  v3 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else if (v3 < *(_QWORD *)(*(_QWORD *)v2 + 16))
  {
    *a2 = v3;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *protocol witness for BidirectionalCollection.formIndex(before:) in conformance CMFormatDescriptionRef.ParameterSetCollection(unint64_t *result)
{
  uint64_t v1;
  unint64_t v2;

  v2 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else if (v2 < *(_QWORD *)(*(_QWORD *)v1 + 16))
  {
    *result = v2;
    return result;
  }
  __break(1u);
  return result;
}

void protocol witness for Collection.startIndex.getter in conformance CMFormatDescriptionRef.ParameterSetCollection(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void protocol witness for Collection.endIndex.getter in conformance CMFormatDescriptionRef.ParameterSetCollection(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(*(_QWORD *)v1 + 16);
}

uint64_t (*protocol witness for Collection.subscript.read in conformance CMFormatDescriptionRef.ParameterSetCollection(uint64_t (*result)(), unint64_t *a2))()
{
  uint64_t v2;
  unint64_t v3;

  v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(_QWORD *)(*(_QWORD *)v2 + 16))
  {
    *(_OWORD *)result = *(_OWORD *)(*(_QWORD *)v2 + 16 * v3 + 32);
    return CMTimebaseRef.NotificationKey.rawValue.modify;
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection.subscript.getter in conformance CMFormatDescriptionRef.ParameterSetCollection@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t **v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *result;
  if (*result < 0 || (v4 = result[1], result = *v2, (*v2)[2] < v4))
  {
    __break(1u);
  }
  else
  {
    a2[1] = v4;
    a2[2] = result;
    *a2 = v3;
    return (uint64_t *)swift_bridgeObjectRetain();
  }
  return result;
}

void protocol witness for Collection.indices.getter in conformance CMFormatDescriptionRef.ParameterSetCollection(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  *a1 = 0;
  a1[1] = v2;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance CMFormatDescriptionRef.ParameterSetCollection()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 16) == 0;
}

_QWORD *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance CMFormatDescriptionRef.ParameterSetCollection@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v3;
  unint64_t v4;

  v4 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else if (v4 <= *(_QWORD *)(*(_QWORD *)v3 + 16))
  {
    *a3 = v4;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance CMFormatDescriptionRef.ParameterSetCollection@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  unint64_t result;
  char v7;

  result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3, *v4);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v7 & 1;
  return result;
}

unint64_t *protocol witness for RandomAccessCollection.distance(from:to:) in conformance CMFormatDescriptionRef.ParameterSetCollection(unint64_t *result, unint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (*result <= v4 && v3 <= v4)
    return (unint64_t *)(v3 - *result);
  __break(1u);
  return result;
}

_QWORD *protocol witness for Collection.index(after:) in conformance CMFormatDescriptionRef.ParameterSetCollection@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  if (*result >= *(_QWORD *)(*(_QWORD *)v2 + 16))
    __break(1u);
  else
    *a2 = *result + 1;
  return result;
}

_QWORD *protocol witness for Collection.formIndex(after:) in conformance CMFormatDescriptionRef.ParameterSetCollection(_QWORD *result)
{
  uint64_t v1;

  if (*result >= *(_QWORD *)(*(_QWORD *)v1 + 16))
    __break(1u);
  else
    ++*result;
  return result;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance CMFormatDescriptionRef.ParameterSetCollection()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 16);
}

uint64_t *protocol witness for Sequence._copyToContiguousArray() in conformance CMFormatDescriptionRef.ParameterSetCollection()
{
  _QWORD **v0;
  uint64_t *v1;

  v1 = specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
  swift_bridgeObjectRelease();
  return v1;
}

_QWORD *protocol witness for Sequence._copyContents(initializing:) in conformance CMFormatDescriptionRef.ParameterSetCollection(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  _QWORD **v3;

  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t CMFormatDescriptionRef.nalUnitHeaderLength.getter()
{
  const opaqueCMFormatDescription *v0;
  int v1;
  int v2;
  int NALUnitHeaderLengthOut;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  NALUnitHeaderLengthOut = 0;
  v1 = noErr.getter();
  if (v1 == CMVideoFormatDescriptionGetH264ParameterSetAtIndex(v0, 0, 0, 0, 0, &NALUnitHeaderLengthOut))
    return NALUnitHeaderLengthOut;
  v2 = noErr.getter();
  if (v2 == CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(v0, 0, 0, 0, 0, &NALUnitHeaderLengthOut))
    return NALUnitHeaderLengthOut;
  else
    return 0;
}

uint64_t CMFormatDescriptionRef.parameterSets.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t *v3;
  void *v4;
  uint64_t v5;
  uint64_t result;
  _QWORD v7[6];

  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = MEMORY[0x1E0DEE9D8];
  v3 = (uint64_t *)(v2 + 16);
  v7[4] = partial apply for closure #1 in CMFormatDescriptionRef.parameterSets.getter;
  v7[5] = v2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 1107296256;
  v7[2] = thunk for @escaping @callee_guaranteed (@unowned Int, @unowned UnsafePointer<UInt8>, @unowned Int) -> ();
  v7[3] = &block_descriptor_1;
  v4 = _Block_copy(v7);
  swift_retain();
  swift_release();
  FigVideoFormatDescriptionVisitAllParameterSets();
  _Block_release(v4);
  swift_beginAccess();
  v5 = *v3;
  swift_bridgeObjectRetain();
  result = swift_release();
  *a1 = v5;
  return result;
}

uint64_t closure #1 in CMFormatDescriptionRef.parameterSets.getter(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t *v8;
  _BYTE *v9;
  uint64_t result;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v4 = a4;
  v8 = (uint64_t *)(a4 + 16);
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v4 + 16) + 16) == a1)
  {
    a3 = specialized Data.init(bytes:count:)(a2, a3);
    a2 = v9;
    swift_beginAccess();
    v4 = *v8;
    result = swift_isUniquelyReferenced_nonNull_native();
    *v8 = v4;
    if ((result & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v4 + 16) + 1, 1, (char *)v4);
  v4 = result;
  *v8 = result;
LABEL_3:
  v12 = *(_QWORD *)(v4 + 16);
  v11 = *(_QWORD *)(v4 + 24);
  if (v12 >= v11 >> 1)
  {
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1, (char *)v4);
    v4 = result;
    *v8 = result;
  }
  *(_QWORD *)(v4 + 16) = v12 + 1;
  v13 = v4 + 16 * v12;
  *(_QWORD *)(v13 + 32) = a3;
  *(_QWORD *)(v13 + 40) = a2;
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Int, @unowned UnsafePointer<UInt8>, @unowned Int) -> ()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v7(a2, a3, a4);
  return swift_release();
}

CMVideoDimensions CMFormatDescriptionRef.dimensions.getter()
{
  const opaqueCMFormatDescription *v0;

  return CMVideoFormatDescriptionGetDimensions(v0);
}

CGSize __swiftcall CMFormatDescriptionRef.presentationDimensions(usePixelAspectRatio:useCleanAperture:)(Swift::Bool usePixelAspectRatio, Swift::Bool useCleanAperture)
{
  const opaqueCMFormatDescription *v2;
  double width;
  double height;
  CGSize PresentationDimensions;
  CGSize result;

  PresentationDimensions = CMVideoFormatDescriptionGetPresentationDimensions(v2, usePixelAspectRatio, useCleanAperture);
  height = PresentationDimensions.height;
  width = PresentationDimensions.width;
  result.height = height;
  result.width = width;
  return result;
}

CGRect __swiftcall CMFormatDescriptionRef.cleanAperture(originIsAtTopLeft:)(Swift::Bool originIsAtTopLeft)
{
  const opaqueCMFormatDescription *v1;

  return CMVideoFormatDescriptionGetCleanAperture(v1, originIsAtTopLeft);
}

uint64_t static CMFormatDescriptionRef.extensionKeysCommonWithImageBuffers.getter()
{
  uint64_t result;

  CMVideoFormatDescriptionGetExtensionKeysCommonWithImageBuffers();
  result = static Array._forceBridgeFromObjectiveC(_:result:)();
  __break(1u);
  return result;
}

Swift::Bool __swiftcall CMFormatDescriptionRef.matchesImageBuffer(_:)(CVBufferRef a1)
{
  const opaqueCMFormatDescription *v1;

  return CMVideoFormatDescriptionMatchesImageBuffer(v1, a1) != 0;
}

uint64_t CMFormatDescriptionRef.tagCollections.getter()
{
  const opaqueCMFormatDescription *v0;
  CFArrayRef v1;
  const __CFArray *v2;
  CFArrayRef tagCollectionsOut[2];

  tagCollectionsOut[1] = *(CFArrayRef *)MEMORY[0x1E0C80C00];
  tagCollectionsOut[0] = 0;
  CMVideoFormatDescriptionCopyTagCollectionArray(v0, tagCollectionsOut);
  v1 = tagCollectionsOut[0];
  if (tagCollectionsOut[0])
  {
    type metadata accessor for CMTagCollectionRef(0);
    v2 = v1;
    static Array._conditionallyBridgeFromObjectiveC(_:result:)();

  }
  return 0;
}

Swift::Bool __swiftcall CMFormatDescriptionRef.matchesTaggedBufferGroup(_:)(Swift::OpaquePointer a1)
{
  const opaqueCMFormatDescription *v1;
  OpaqueCMTaggedBufferGroup *v2;
  int v3;

  v2 = (OpaqueCMTaggedBufferGroup *)Array<A>.taggedBufferGroup.getter((uint64_t)a1._rawValue);
  v3 = CMTaggedBufferGroupFormatDescriptionMatchesTaggedBufferGroup(v1, v2);

  return v3 != 0;
}

uint64_t CMFormatDescriptionRef.displayFlags()@<X0>(CMTextDisplayFlags *a1@<X8>)
{
  const opaqueCMFormatDescription *v1;
  const opaqueCMFormatDescription *v2;
  OSStatus DisplayFlags;
  uint64_t result;
  id v6;
  CMTextDisplayFlags displayFlagsOut;
  uint64_t v8;

  v2 = v1;
  v8 = *MEMORY[0x1E0C80C00];
  displayFlagsOut = 0;
  DisplayFlags = CMTextFormatDescriptionGetDisplayFlags(v2, &displayFlagsOut);
  result = noErr.getter();
  if (DisplayFlags == (_DWORD)result)
  {
    *a1 = displayFlagsOut;
  }
  else
  {
    v6 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v6, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], DisplayFlags, 0);
    return swift_willThrow();
  }
  return result;
}

uint64_t CMFormatDescriptionRef.justification()(_BYTE *a1, _BYTE *a2)
{
  const opaqueCMFormatDescription *v2;
  const opaqueCMFormatDescription *v3;
  OSStatus Justification;
  uint64_t result;
  id v8;
  CMTextJustificationValue verticalJustificationOut[2];
  uint64_t v10;

  v3 = v2;
  v10 = *MEMORY[0x1E0C80C00];
  *(_WORD *)verticalJustificationOut = 0;
  Justification = CMTextFormatDescriptionGetJustification(v3, &verticalJustificationOut[1], verticalJustificationOut);
  result = noErr.getter();
  if (Justification == (_DWORD)result)
  {
    *a1 = verticalJustificationOut[1];
    *a2 = verticalJustificationOut[0];
  }
  else
  {
    v8 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v8, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], Justification, 0);
    return swift_willThrow();
  }
  return result;
}

uint64_t CMFormatDescriptionRef.defaultTextBox(originIsAtTopLeft:heightOfTextTrack:)(char a1, CGFloat a2)
{
  const opaqueCMFormatDescription *v2;
  OSStatus DefaultTextBox;
  uint64_t result;
  id v5;
  CGRect v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(&v6, 0, sizeof(v6));
  DefaultTextBox = CMTextFormatDescriptionGetDefaultTextBox(v2, a1 & 1, a2, &v6);
  result = noErr.getter();
  if (DefaultTextBox != (_DWORD)result)
  {
    v5 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v5, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], DefaultTextBox, 0);
    return swift_willThrow();
  }
  return result;
}

uint64_t CMFormatDescriptionRef.defaultStyle()()
{
  const opaqueCMFormatDescription *v0;
  const opaqueCMFormatDescription *v1;
  uint64_t v2;
  OSStatus DefaultStyle;
  id v5;
  CGFloat fontSizeOut;
  Boolean underlineOut;
  Boolean italicOut[2];
  uint16_t localFontIDOut;
  uint64_t v10;

  v1 = v0;
  v10 = *MEMORY[0x1E0C80C00];
  localFontIDOut = 0;
  *(_WORD *)italicOut = 0;
  underlineOut = 0;
  fontSizeOut = 0.0;
  v2 = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(_QWORD *)(v2 + 16) = 4;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  DefaultStyle = CMTextFormatDescriptionGetDefaultStyle(v1, &localFontIDOut, &italicOut[1], italicOut, &underlineOut, &fontSizeOut, (CGFloat *)(v2 + 32));
  if (DefaultStyle == noErr.getter())
    return localFontIDOut;
  v5 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  objc_msgSend(v5, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], DefaultStyle, 0);
  swift_willThrow();
  return swift_bridgeObjectRelease();
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMFormatDescriptionRef.fontName(localFontID:)(Swift::Int localFontID)
{
  const opaqueCMFormatDescription *v1;
  uint64_t FontName;
  CFStringRef v3;
  __CFString *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  id v8;
  Swift::String result;
  CFStringRef v10[2];

  v10[1] = *(CFStringRef *)MEMORY[0x1E0C80C00];
  if ((unint64_t)localFontID >> 16)
  {
    if (one-time initialization token for invalidParameter != -1)
      swift_once();
    (id)static CMFormatDescriptionRef.Error.invalidParameter;
    swift_willThrow();
  }
  else
  {
    v10[0] = 0;
    FontName = CMTextFormatDescriptionGetFontName(v1, localFontID, v10);
    v3 = v10[0];
    v4 = (id)v10[0];
    v5 = noErr.getter();
    if ((_DWORD)FontName == (_DWORD)v5)
    {
      if (!v4)
      {
        __break(1u);
        goto LABEL_11;
      }
      FontName = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v3 = v7;

    }
    else
    {
      v8 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
      objc_msgSend(v8, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], (int)FontName, 0);
      swift_willThrow();

    }
  }
  v5 = FontName;
  v6 = (__CFString *)v3;
LABEL_11:
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t CMFormatDescriptionRef.TimeCode.Flag.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

CMTimeValue CMFormatDescriptionRef.frameDuration.getter()
{
  const opaqueCMFormatDescription *v0;
  CMTime v2;

  CMTimeCodeFormatDescriptionGetFrameDuration(&v2, v0);
  return v2.value;
}

uint64_t CMFormatDescriptionRef.frameQuanta.getter()
{
  const opaqueCMFormatDescription *v0;

  return CMTimeCodeFormatDescriptionGetFrameQuanta(v0);
}

uint64_t CMFormatDescriptionRef.timeCodeFlags.getter@<X0>(_DWORD *a1@<X8>)
{
  const opaqueCMFormatDescription *v1;
  uint64_t result;

  result = CMTimeCodeFormatDescriptionGetTimeCodeFlags(v1);
  *a1 = result;
  return result;
}

Swift::OpaquePointer_optional __swiftcall CMFormatDescriptionRef.keyWithLocalID(_:)(Swift::UInt32 a1)
{
  const opaqueCMFormatDescription *v1;
  Swift::Bool v2;
  void *v3;
  Swift::OpaquePointer_optional result;

  if (CMMetadataFormatDescriptionGetKeyWithLocalID(v1, a1))
  {
    v3 = (void *)static Dictionary._forceBridgeFromObjectiveC(_:result:)();
    __break(1u);
  }
  else
  {
    v3 = 0;
  }
  result.value._rawValue = v3;
  result.is_nil = v2;
  return result;
}

uint64_t CMFormatDescriptionRef.identifiers.getter()
{
  const opaqueCMFormatDescription *v0;
  const __CFArray *v1;
  uint64_t result;

  v1 = CMMetadataFormatDescriptionGetIdentifiers(v0);
  if (!v1)
    return MEMORY[0x1E0DEE9D8];
  v1;
  result = static Array._forceBridgeFromObjectiveC(_:result:)();
  __break(1u);
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  Swift::Int v2;

  Hasher.init(_seed:)();
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
  _CFObject.hash(into:)();
  v2 = Hasher._finalize()();
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
  uint64_t v4;
  unint64_t i;
  void *v6;
  id v7;
  char v8;
  uint64_t v9;
  id v10;
  char v11;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    type metadata accessor for CFStringRef(0);
    v6 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * i);
    _sSo11CFStringRefaABSHSCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
    v7 = v6;
    v8 = static _CFObject.== infix(_:_:)();

    if ((v8 & 1) == 0)
    {
      v9 = ~v4;
      for (i = (i + 1) & v9; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v9)
      {
        v10 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v11 = static _CFObject.== infix(_:_:)();

        if ((v11 & 1) != 0)
          break;
      }
    }
  }
  return i;
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

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t result, uint64_t *a2, uint64_t a3, unint64_t a4)
{
  uint64_t *v4;
  unint64_t v5;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v7 = (_QWORD *)result;
  if (!a2)
    goto LABEL_26;
  v8 = a3;
  if (!a3)
  {
LABEL_27:
    *v7 = a4;
    v7[1] = v8;
    return v8;
  }
  if (a3 < 0)
    goto LABEL_24;
  v4 = a2;
  v5 = a4 >> 62;
  if (a4 >> 62)
    goto LABEL_25;
  if (!*(_QWORD *)((a4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_26:
    v8 = 0;
    goto LABEL_27;
  }
  while (1)
  {
    if ((a4 & 0xC000000000000001) != 0)
    {
      v9 = MEMORY[0x1BCCB998C](0, a4);
      goto LABEL_9;
    }
    if (!*(_QWORD *)((a4 & 0xFFFFFFFFFFFFF8) + 0x10))
      break;
    v9 = swift_unknownObjectRetain();
LABEL_9:
    *v4 = v9;
    v10 = v8 - 1;
    if (v8 == 1)
      goto LABEL_27;
    if (v5)
    {
      v5 = a4 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
      v11 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      v5 = a4 & 0xFFFFFFFFFFFFFF8;
      v11 = *(_QWORD *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    v12 = 0;
    ++v4;
    while (v10 != v12)
    {
      if (v11 - 1 == v12)
      {
        v8 = v11;
        goto LABEL_27;
      }
      v14 = v12 + 1;
      if ((a4 & 0xC000000000000001) != 0)
      {
        v13 = MEMORY[0x1BCCB998C](v14, a4);
      }
      else
      {
        if (v14 >= *(_QWORD *)(v5 + 16))
          goto LABEL_23;
        v13 = swift_unknownObjectRetain();
      }
      v4[v12++] = v13;
      if (v10 == v12)
        goto LABEL_27;
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v15 = _CocoaArrayWrapper.endIndex.getter();
    result = swift_bridgeObjectRelease();
    if (!v15)
      goto LABEL_26;
  }
  __break(1u);
  return result;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t result, _QWORD *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v4;
  unint64_t v5;
  _QWORD *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  uint64_t v15;

  v7 = (_QWORD *)result;
  if (!a2)
    goto LABEL_26;
  v8 = a3;
  if (!a3)
  {
LABEL_27:
    *v7 = a4;
    v7[1] = v8;
    return v8;
  }
  if (a3 < 0)
    goto LABEL_24;
  v4 = a2;
  v5 = a4 >> 62;
  if (a4 >> 62)
    goto LABEL_25;
  if (!*(_QWORD *)((a4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_26:
    v8 = 0;
    goto LABEL_27;
  }
  while (1)
  {
    if ((a4 & 0xC000000000000001) != 0)
    {
      v9 = (id)MEMORY[0x1BCCB998C](0, a4);
      goto LABEL_9;
    }
    if (!*(_QWORD *)((a4 & 0xFFFFFFFFFFFFF8) + 0x10))
      break;
    v9 = *(id *)(a4 + 32);
LABEL_9:
    *v4 = v9;
    v10 = v8 - 1;
    if (v8 == 1)
      goto LABEL_27;
    if (v5)
    {
      v5 = a4 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
      v11 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      v5 = a4 & 0xFFFFFFFFFFFFFF8;
      v11 = *(_QWORD *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    v12 = 0;
    ++v4;
    while (v10 != v12)
    {
      if (v11 - 1 == v12)
      {
        v8 = v11;
        goto LABEL_27;
      }
      v14 = v12 + 1;
      if ((a4 & 0xC000000000000001) != 0)
      {
        v13 = (id)MEMORY[0x1BCCB998C](v14, a4);
      }
      else
      {
        if (v14 >= *(_QWORD *)(v5 + 16))
          goto LABEL_23;
        v13 = *(id *)(a4 + 40 + 8 * v12);
      }
      v4[v12++] = v13;
      if (v10 == v12)
        goto LABEL_27;
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v15 = _CocoaArrayWrapper.endIndex.getter();
    result = swift_bridgeObjectRelease();
    if (!v15)
      goto LABEL_26;
  }
  __break(1u);
  return result;
}

_QWORD *specialized Sequence._copySequenceContents(initializing:)(_QWORD *result, _QWORD *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  BOOL v16;
  id v17;
  id v18;

  v10 = result;
  if (!a2)
  {
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v11 = a3;
  if (!a3)
  {
LABEL_6:
    v12 = a5;
LABEL_7:
    *v10 = a4;
    v10[1] = a5;
    v10[2] = a6;
    v10[3] = v12;
    return (_QWORD *)v11;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (a5 != a6)
    {
      v13 = a5 + 1;
      if (__OFADD__(a5, 1))
      {
LABEL_16:
        __break(1u);
LABEL_17:
        v12 = a6;
        v11 = v6;
      }
      else
      {
        v14 = a2;
        v6 = 1;
        v12 = a5;
        while (1)
        {
          *v14 = a4;
          v14[1] = v12;
          v12 = v13;
          if (v11 == v6)
            break;
          if (v13 == a6)
            goto LABEL_17;
          ++v6;
          v16 = __OFADD__(v13++, 1);
          v17 = a4;
          v14 += 2;
          if (v16)
            goto LABEL_16;
        }
      }
      v18 = a4;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

void specialized Sequence._copySequenceContents(initializing:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v9;
  __int128 v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  int64_t v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  id v25;
  int64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  int64_t v40;
  unint64_t v41;
  void *v42;
  uint64_t v43;

  v42 = a4;
  v43 = a5;
  CMSampleBufferRef.PerSampleAttachmentsDictionary.makeIterator()(&v38);

  if (!a2)
  {
    v10 = v38;
    v27 = v39;
    v12 = v40;
    goto LABEL_30;
  }
  if (!a3)
  {
    v10 = v38;
    v27 = v39;
    v12 = v40;
LABEL_30:
    v11 = v41;
LABEL_31:
    *(_OWORD *)a1 = v10;
    *(_QWORD *)(a1 + 16) = v27;
    *(_QWORD *)(a1 + 24) = v12;
    *(_QWORD *)(a1 + 32) = v11;
    return;
  }
  if (a3 < 0)
    goto LABEL_36;
  v9 = 0;
  v10 = v38;
  v12 = v40;
  v11 = v41;
  v13 = *((_QWORD *)&v38 + 1);
  v14 = v38;
  v29 = v39;
  v30 = a1;
  v15 = (unint64_t)(v39 + 64) >> 6;
  v31 = v38;
  if (!v41)
    goto LABEL_6;
LABEL_5:
  v16 = __clz(__rbit64(v11));
  v11 &= v11 - 1;
  v17 = v16 | (v12 << 6);
  while (1)
  {
    ++v9;
    v22 = *(void **)(*(_QWORD *)(v14 + 48) + 8 * v17);
    *(_QWORD *)&v32 = v22;
    outlined init with copy of Any(*(_QWORD *)(v14 + 56) + 32 * v17, (uint64_t)&v32 + 8);
    v23 = v34;
    v37 = v34;
    v24 = v33;
    v35 = v32;
    v36 = v33;
    *(_OWORD *)a2 = v32;
    *(_OWORD *)(a2 + 16) = v24;
    *(_QWORD *)(a2 + 32) = v23;
    if (v9 == a3)
    {
      v28 = v22;
      v27 = v29;
      a1 = v30;
      v10 = v31;
      goto LABEL_31;
    }
    a2 += 40;
    v25 = v22;
    v10 = v31;
    if (v11)
      goto LABEL_5;
LABEL_6:
    v18 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v18 >= v15)
    {
      v21 = v12;
LABEL_33:
      v11 = 0;
      v12 = v21;
      v27 = v29;
      a1 = v30;
      goto LABEL_31;
    }
    v19 = *(_QWORD *)(v13 + 8 * v18);
    if (!v19)
    {
      v20 = v12 + 2;
      v21 = v12 + 1;
      if (v12 + 2 >= v15)
        goto LABEL_33;
      v19 = *(_QWORD *)(v13 + 8 * v20);
      if (v19)
        goto LABEL_11;
      v21 = v12 + 2;
      if (v12 + 3 >= v15)
        goto LABEL_33;
      v19 = *(_QWORD *)(v13 + 8 * (v12 + 3));
      if (v19)
      {
        v18 = v12 + 3;
      }
      else
      {
        v20 = v12 + 4;
        v21 = v12 + 3;
        if (v12 + 4 >= v15)
          goto LABEL_33;
        v19 = *(_QWORD *)(v13 + 8 * v20);
        if (v19)
        {
LABEL_11:
          v18 = v20;
          goto LABEL_15;
        }
        v18 = v12 + 5;
        v21 = v12 + 4;
        if (v12 + 5 >= v15)
          goto LABEL_33;
        v19 = *(_QWORD *)(v13 + 8 * v18);
        if (!v19)
        {
          v26 = v12 + 6;
          while (v15 != v26)
          {
            v19 = *(_QWORD *)(v13 + 8 * v26++);
            if (v19)
            {
              v18 = v26 - 1;
              goto LABEL_15;
            }
          }
          v21 = v15 - 1;
          goto LABEL_33;
        }
      }
    }
LABEL_15:
    v11 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v18 << 6);
    v12 = v18;
  }
  __break(1u);
LABEL_36:
  __break(1u);
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  result = specialized Dictionary.startIndex.getter(a4);
  v9 = result;
  v11 = v10;
  v13 = v12 & 1;
  if (!a2)
  {
    v14 = 0;
LABEL_19:
    *(_QWORD *)a1 = a4;
    *(_QWORD *)(a1 + 8) = v9;
    *(_QWORD *)(a1 + 16) = v11;
    *(_BYTE *)(a1 + 24) = v13;
    return v14;
  }
  if (!a3)
  {
    v14 = 0;
    goto LABEL_19;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v32 = a1;
    v33 = a3;
    v14 = 0;
    while (1)
    {
      if ((a4 & 0xC000000000000001) != 0)
      {
        result = __CocoaDictionary.endIndex.getter();
        if ((v13 & 1) == 0)
          goto LABEL_22;
        v16 = result;
        v17 = v15;
        v18 = MEMORY[0x1BCCB9A4C](v9, v11, result, v15);
        v13 = 1;
        outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v16, v17, 1);
        if ((v18 & 1) != 0)
          goto LABEL_18;
        specialized Dictionary.subscript.getter(&v34, v9, v11, 1, a4);
        v20 = v19;
        v21 = v34;
        v22 = __CocoaDictionary.index(after:)();
        v24 = v23;
        swift_bridgeObjectRetain();
        v25 = v9;
        v26 = v11;
        v27 = 1;
      }
      else
      {
        if ((v13 & 1) != 0)
          goto LABEL_22;
        if (*(_DWORD *)(a4 + 36) != (_DWORD)v11)
        {
          __break(1u);
          break;
        }
        if (v9 == 1 << *(_BYTE *)(a4 + 32))
        {
          v13 = 0;
          goto LABEL_18;
        }
        specialized Dictionary.subscript.getter(&v34, v9, v11, 0, a4);
        v20 = v28;
        v21 = v34;
        swift_bridgeObjectRetain();
        specialized _NativeDictionary.index(after:)(v9, v11, 0, a4);
        v22 = v29;
        v24 = v30;
        v13 = v31 & 1;
        v25 = v9;
        v26 = v11;
        v27 = 0;
      }
      outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v25, v26, v27);
      result = swift_bridgeObjectRelease();
      v9 = v22;
      v11 = v24;
      ++v14;
      *a2 = v20;
      a2[1] = v21;
      a2 += 2;
      if (v33 == v14)
      {
        v14 = v33;
LABEL_18:
        a1 = v32;
        goto LABEL_19;
      }
    }
  }
  __break(1u);
LABEL_22:
  __break(1u);
  return result;
}

_QWORD *specialized Sequence._copySequenceContents(initializing:)(_QWORD *result, uint64_t *a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t *v13;

  v5 = result;
  if (!a2)
  {
    v7 = 0;
    v6 = 0;
LABEL_15:
    *v5 = a4;
    v5[1] = v7;
    return (_QWORD *)v6;
  }
  v6 = a3;
  if (!a3)
  {
    v7 = 0;
    goto LABEL_15;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v7 = a4[2];
    if (v7)
    {
      v9 = a4[4];
      v10 = a4[5];
      *a2 = v9;
      a2[1] = v10;
      if (a3 == 1)
      {
        v11 = 1;
LABEL_13:
        outlined copy of Data._Representation(v9, v10);
        v7 = v11;
      }
      else
      {
        v12 = a4 + 7;
        v13 = (unint64_t *)(a2 + 3);
        v11 = 1;
        while (v7 != v11)
        {
          outlined copy of Data._Representation(v9, v10);
          v9 = *(v12 - 1);
          v10 = *v12;
          ++v11;
          *(v13 - 1) = v9;
          *v13 = v10;
          v12 += 2;
          v13 += 2;
          if (v6 == v11)
            goto LABEL_13;
        }
        outlined copy of Data._Representation(v9, v10);
        v6 = v11;
      }
    }
    else
    {
      v6 = 0;
    }
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

void specialized _copyCollectionToContiguousArray<A>(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  int64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;
  void *v14;

  if (a3 < a2)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    return;
  }
  if (a3 == a2)
    return;
  if (a3 <= a2)
    goto LABEL_18;
  v6 = 0;
  v7 = 32;
  do
  {
    if ((unint64_t)(~a2 + a3) > 0x7FFFFFFFFFFFFFFELL)
    {
      __break(1u);
      goto LABEL_17;
    }
    ++v6;
    v7 += 16;
  }
  while (a3 - a2 != v6);
  if (v6)
  {
    if ((unint64_t)(v6 - 1) >= 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CMSampleBufferRef.PerSampleAttachmentsDictionary>);
      v8 = (_QWORD *)swift_allocObject();
      v9 = _swift_stdlib_malloc_size(v8);
      v10 = v9 - 32;
      if (v9 < 32)
        v10 = v9 - 17;
      v8[2] = v6;
      v8[3] = 2 * (v10 >> 4);
    }
    v11 = specialized Sequence._copySequenceContents(initializing:)(&v14, v8 + 4, v6, a1, a2, a3);
    v12 = v14;
    v13 = a1;

    if (v11 != (_QWORD *)v6)
      goto LABEL_19;
  }
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t result;
  _QWORD v12[3];
  char v13;

  v2 = specialized Collection.count.getter(a1);
  if (!v2)
    return MEMORY[0x1E0DEE9D8];
  v3 = v2;
  if (v2 <= 0)
  {
    v4 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(key: CFStringRef, value: Swift.AnyObject)>);
    v4 = (_QWORD *)swift_allocObject();
    v5 = _swift_stdlib_malloc_size(v4);
    v6 = v5 - 32;
    if (v5 < 32)
      v6 = v5 - 17;
    v4[2] = v3;
    v4[3] = 2 * (v6 >> 4);
  }
  swift_bridgeObjectRetain();
  v7 = specialized Sequence._copySequenceContents(initializing:)((uint64_t)v12, v4 + 4, v3, a1);
  v8 = v12[1];
  v9 = v12[2];
  v10 = v13;
  swift_bridgeObjectRelease();
  result = outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v8, v9, v10);
  if (v7 == v3)
    return (uint64_t)v4;
  __break(1u);
  return result;
}

uint64_t *specialized _copyCollectionToContiguousArray<A>(_:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t *v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;

  v1 = a1[2];
  if (!v1)
    return (uint64_t *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Data>);
  v3 = (uint64_t *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = specialized Sequence._copySequenceContents(initializing:)(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v6 != (_QWORD *)v1)
  {
    __break(1u);
    return (uint64_t *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(const void *a1, uint64_t a2)
{
  size_t v4;
  _QWORD *v5;
  size_t v6;

  if (!a2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  if (a2 <= 0)
  {
    v4 = 48 * a2;
    v5 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AudioFormatListItem>);
    v4 = 48 * a2;
    v5 = (_QWORD *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v5);
    v5[2] = a2;
    v5[3] = 2 * ((uint64_t)(v6 - 32) / 48);
  }
  memcpy(v5 + 4, a1, v4);
  return v5;
}

uint64_t specialized Dictionary._Variant.removeValue(forKey:)(unint64_t a1)
{
  Swift::Int *v1;
  Swift::Int *v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  Swift::Int v9;
  char v10;
  char v11;
  char v12;
  char v13;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  Swift::Int v17;

  v2 = v1;
  v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    a1 = specialized __RawDictionaryStorage.find<A>(_:)(a1);
    v13 = v12;
    swift_bridgeObjectRelease();
    if ((v13 & 1) != 0)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v9 = *v2;
      v17 = *v2;
      *v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        specialized _NativeDictionary.copy()();
        v9 = v17;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0)
    v5 = v4;
  else
    v5 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  v6 = (id)a1;
  v7 = __CocoaDictionary.lookup(_:)();

  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  v8 = MEMORY[0x1BCCB9A70](v5);
  v9 = specialized _NativeDictionary.init(_:capacity:)(v5, v8);
  swift_retain();
  a1 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v6);
  v11 = v10;
  swift_release();
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  v15 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * a1);
  specialized _NativeDictionary._delete(at:)(a1, v9);
  *v2 = v9;
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t specialized Dictionary._Variant.setValue(_:forKey:)(uint64_t a1, void *a2)
{
  Swift::Int *v2;
  Swift::Int *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  Swift::Int v10;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) == 0)
    goto LABEL_7;
  if (v6 < 0)
    v7 = *v2;
  else
    v7 = v6 & 0xFFFFFFFFFFFFFF8;
  result = MEMORY[0x1BCCB9A70](v7);
  if (!__OFADD__(result, 1))
  {
    *v3 = specialized _NativeDictionary.init(_:capacity:)(v7, result + 1);
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v10 = *v3;
    *v3 = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a1, a2, isUniquelyReferenced_nonNull_native);
    *v3 = v10;
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

Swift::Int specialized _NativeDictionary.init(_:capacity:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  Swift::Int result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, Swift.AnyObject>);
    v2 = static _DictionaryStorage.convert(_:capacity:)();
    v20 = v2;
    __CocoaDictionary.makeIterator()();
    if (__CocoaDictionary.Iterator.next()())
    {
      v4 = v3;
      type metadata accessor for CFStringRef(0);
      do
      {
        swift_dynamicCast();
        v2 = v20;
        v14 = *(_QWORD *)(v20 + 16);
        if (*(_QWORD *)(v20 + 24) <= v14)
        {
          specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v14 + 1, 1);
          v2 = v20;
        }
        Hasher.init(_seed:)();
        _sSo11CFStringRefaABSHSCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
        _CFObject.hash(into:)();
        result = Hasher._finalize()();
        v6 = v2 + 64;
        v7 = -1 << *(_BYTE *)(v2 + 32);
        v8 = result & ~v7;
        v9 = v8 >> 6;
        if (((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          v10 = __clz(__rbit64((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v15 = 0;
          v16 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v16 && (v15 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v17 = v9 == v16;
            if (v9 == v16)
              v9 = 0;
            v15 |= v17;
            v18 = *(_QWORD *)(v6 + 8 * v9);
          }
          while (v18 == -1);
          v10 = __clz(__rbit64(~v18)) + (v9 << 6);
        }
        *(_QWORD *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        v11 = 8 * v10;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + v11) = v19;
        *(_QWORD *)(*(_QWORD *)(v2 + 56) + v11) = v4;
        ++*(_QWORD *)(v2 + 16);
        v12 = __CocoaDictionary.Iterator.next()();
        v4 = v13;
      }
      while (v12);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E0DEE9E0];
  }
  return v2;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  unint64_t v20;
  int64_t v21;
  void *v22;
  _OWORD *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _OWORD v34[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, Any>);
  v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v33 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_22;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v11)
      break;
    v19 = (_QWORD *)(v5 + 64);
    v20 = *(_QWORD *)(v33 + 8 * v18);
    ++v14;
    if (!v20)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_34;
      v20 = *(_QWORD *)(v33 + 8 * v14);
      if (!v20)
      {
        v21 = v18 + 2;
        if (v21 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v20 = *(_QWORD *)(v33 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            v14 = v21 + 1;
            if (__OFADD__(v21, 1))
              goto LABEL_43;
            if (v14 >= v11)
              goto LABEL_34;
            v20 = *(_QWORD *)(v33 + 8 * v14);
            ++v21;
            if (v20)
              goto LABEL_21;
          }
        }
        v14 = v21;
      }
    }
LABEL_21:
    v10 = (v20 - 1) & v20;
    v17 = __clz(__rbit64(v20)) + (v14 << 6);
LABEL_22:
    v22 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v17);
    v23 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
    if ((a2 & 1) != 0)
    {
      outlined init with take of Any(v23, v34);
    }
    else
    {
      outlined init with copy of Any((uint64_t)v23, (uint64_t)v34);
      v24 = v22;
    }
    Hasher.init(_seed:)();
    type metadata accessor for CFStringRef(0);
    _sSo11CFStringRefaABSHSCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
    _CFObject.hash(into:)();
    result = Hasher._finalize()();
    v25 = -1 << *(_BYTE *)(v7 + 32);
    v26 = result & ~v25;
    v27 = v26 >> 6;
    if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v30 = v27 == v29;
        if (v27 == v29)
          v27 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v12 + 8 * v27);
      }
      while (v31 == -1);
      v15 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v15) = v22;
    result = (uint64_t)outlined init with take of Any(v34, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v15));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v19 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v32 = 1 << *(_BYTE *)(v5 + 32);
  if (v32 >= 64)
    bzero(v19, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v19 = -1 << v32;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
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
  uint64_t v18;
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
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, Swift.AnyObject>);
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
          if ((a2 & 1) == 0)
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
    v29 = 8 * v20;
    v30 = *(void **)(*(_QWORD *)(v5 + 48) + v29);
    v31 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v29);
    if ((a2 & 1) == 0)
    {
      v32 = v30;
      swift_unknownObjectRetain();
    }
    Hasher.init(_seed:)();
    type metadata accessor for CFStringRef(0);
    _sSo11CFStringRefaABSHSCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
    _CFObject.hash(into:)();
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
    v18 = 8 * v17;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v18) = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v31;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
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

void specialized _NativeDictionary._delete(at:)(unint64_t a1, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  Swift::Int v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v3 = a1;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    v8 = _HashTable.previousHole(before:)();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(void **)(*(_QWORD *)(a2 + 48) + 8 * v6);
        Hasher.init(_seed:)();
        type metadata accessor for CFStringRef(0);
        _sSo11CFStringRefaABSHSCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, (uint64_t)&protocol conformance descriptor for CFStringRef);
        v11 = v10;
        _CFObject.hash(into:)();
        v12 = Hasher._finalize()();

        v13 = v12 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v13 < v9)
            goto LABEL_5;
        }
        else if (v13 >= v9)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v13)
        {
LABEL_11:
          v14 = *(_QWORD *)(a2 + 48);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || v15 >= v16 + 1)
            *v15 = *v16;
          v17 = *(_QWORD *)(a2 + 56);
          v18 = (_QWORD *)(v17 + 8 * v3);
          v19 = (_QWORD *)(v17 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v18 >= v19 + 1))
          {
            *v18 = *v19;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    v22 = *v20;
    v21 = (-1 << a1) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
}

_OWORD *specialized _NativeDictionary.setValue(_:forKey:isUnique:)(_OWORD *a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  _OWORD *v16;
  _OWORD *result;
  unint64_t v18;
  char v19;

  v4 = (_QWORD **)v3;
  v7 = (_QWORD *)*v3;
  v9 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)a2);
  v10 = v7[2];
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
  }
  else
  {
    v13 = v8;
    v14 = v7[3];
    if (v14 >= v12 && (a3 & 1) != 0)
    {
LABEL_7:
      v15 = *v4;
      if ((v13 & 1) != 0)
      {
LABEL_8:
        v16 = (_OWORD *)(v15[7] + 32 * v9);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
        return outlined init with take of Any(a1, v16);
      }
      goto LABEL_11;
    }
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      specialized _NativeDictionary.copy()();
      goto LABEL_7;
    }
    specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v12, a3 & 1);
    v18 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)a2);
    if ((v13 & 1) == (v19 & 1))
    {
      v9 = v18;
      v15 = *v4;
      if ((v13 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      specialized _NativeDictionary._insert(at:key:value:)(v9, (uint64_t)a2, a1, v15);
      return a2;
    }
  }
  type metadata accessor for CFStringRef(0);
  result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

id specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  id result;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v4 = v3;
  v7 = *v3;
  v9 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    specialized _NativeDictionary.copy()();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];
      result = (id)swift_unknownObjectRelease();
      *(_QWORD *)(v16 + 8 * v9) = a1;
      return result;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v20 = 8 * v9;
    *(_QWORD *)(v15[6] + v20) = a2;
    *(_QWORD *)(v15[7] + v20) = a1;
    v21 = v15[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v15[2] = v23;
      return a2;
    }
    goto LABEL_14;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v12, a3 & 1);
  v18 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)a2);
  if ((v13 & 1) == (v19 & 1))
  {
    v9 = v18;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  type metadata accessor for CFStringRef(0);
  result = (id)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

_OWORD *specialized _NativeDictionary._insert(at:key:value:)(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  _OWORD *result;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  result = outlined init with take of Any(a3, (_OWORD *)(a4[7] + 32 * a1));
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

id specialized _NativeDictionary.copy()()
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
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  _OWORD v22[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, Any>);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v13)
        goto LABEL_26;
      v20 = *(_QWORD *)(v6 + 8 * v9);
      if (!v20)
        break;
    }
LABEL_25:
    v12 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 32 * v15;
    outlined init with copy of Any(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    outlined init with take of Any(v22, (_OWORD *)(*(_QWORD *)(v4 + 56) + v18));
    result = v17;
  }
  v21 = v19 + 2;
  if (v21 >= v13)
    goto LABEL_26;
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
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
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, Swift.AnyObject>);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = (void *)swift_unknownObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void specialized _NativeDictionary.index(after:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  char v6;
  char v7;
  void *v8;

  if ((a3 & 1) == 0)
  {
    if (a1 < 0 || -(-1 << *(_BYTE *)(a4 + 32)) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + 64 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8)) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
      {
        _HashTable.occupiedBucket(after:)();
        return;
      }
      goto LABEL_12;
    }
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (__CocoaDictionary.Index.age.getter() != *(_DWORD *)(a4 + 36))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  __CocoaDictionary.Index.key.getter();
  outlined copy of [A : B].Index._Variant<A, B>(a1, a2, 1);
  type metadata accessor for CFStringRef(0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
  specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v8);
  v7 = v6;

  if ((v7 & 1) != 0)
  {
    __CocoaDictionary.Index.dictionary.getter();
    __CocoaDictionary.index(after:)();
    outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(a1, a2, 1);
    swift_unknownObjectRelease();
    return;
  }
LABEL_14:
  __break(1u);
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

uint64_t outlined init with copy of ManagedAudioChannelLayout?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedAudioChannelLayout?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of ManagedAudioChannelLayout?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedAudioChannelLayout?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

const __CFAllocator *partial apply for closure #1 in _CMFormatDescriptionInitTrampoline.init(audioStreamBasicDescription:layout:magicCookie:extensions:)@<X0>(const AudioChannelLayout *a1@<X0>, const __CFAllocator **a2@<X8>)
{
  uint64_t v2;

  return closure #1 in _CMFormatDescriptionInitTrampoline.init(audioStreamBasicDescription:layout:magicCookie:extensions:)(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), a2);
}

uint64_t specialized Collection._failEarlyRangeCheck(_:bounds:)(uint64_t a1, uint64_t a2, char a3, __int128 *a4)
{
  uint64_t result;
  uint64_t *v9;
  __int128 v10;
  char v11;
  _BYTE v12[24];
  __int128 v13;
  char v14;
  _BYTE v15[24];
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v13 = *a4;
  v14 = *((_BYTE *)a4 + 16);
  outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)&v13, (uint64_t)v15);
  result = (uint64_t)v15;
  v9 = &v16;
  if ((a3 & 1) == 0)
  {
    result = outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)v15, (uint64_t)&v16);
    if ((v18 & 1) != 0)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    if ((_DWORD)v17 != (_DWORD)a2)
    {
      __break(1u);
      goto LABEL_15;
    }
    if (v16 > a1)
    {
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    v10 = *(__int128 *)((char *)a4 + 24);
    v11 = *((_BYTE *)a4 + 40);
    outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)&v10, (uint64_t)v12);
    result = outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)v12, (uint64_t)&v19);
    if ((v21 & 1) != 0)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    if ((_DWORD)v20 != (_DWORD)a2)
    {
LABEL_18:
      __break(1u);
      goto LABEL_19;
    }
    if (v19 > a1)
      return result;
    __break(1u);
  }
  result = outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant(result, (uint64_t)v9);
  if ((v18 & 1) == 0)
    goto LABEL_19;
  result = MEMORY[0x1BCCB9A40](a1, a2, v16, v17);
  if ((result & 1) != 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v10 = *(__int128 *)((char *)a4 + 24);
  v11 = *((_BYTE *)a4 + 40);
  outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)&v10, (uint64_t)v12);
  result = outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)v12, (uint64_t)&v19);
  if ((v21 & 1) == 0)
    goto LABEL_20;
  result = MEMORY[0x1BCCB9A40](a1, a2, v19, v20);
  if ((result & 1) == 0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  return result;
}

{
  uint64_t result;
  uint64_t *v9;
  __int128 v10;
  char v11;
  _BYTE v12[24];
  __int128 v13;
  char v14;
  _BYTE v15[24];
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v13 = *a4;
  v14 = *((_BYTE *)a4 + 16);
  outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)&v13, (uint64_t)v15);
  result = (uint64_t)v15;
  v9 = &v16;
  if ((a3 & 1) != 0)
    goto LABEL_6;
  result = outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)v15, (uint64_t)&v16);
  if ((v18 & 1) != 0)
    goto LABEL_18;
  if ((_DWORD)v17 != (_DWORD)a2)
    goto LABEL_16;
  if (v16 > a1)
  {
    do
    {
      __break(1u);
LABEL_6:
      result = outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant(result, (uint64_t)v9);
      if ((v18 & 1) == 0)
        goto LABEL_18;
      result = MEMORY[0x1BCCB9A40](a1, a2, v16, v17);
    }
    while ((result & 1) != 0);
  }
  v10 = *(__int128 *)((char *)a4 + 24);
  v11 = *((_BYTE *)a4 + 40);
  outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)&v10, (uint64_t)v12);
  result = outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)v12, (uint64_t)&v19);
  if ((v21 & 1) != 0)
  {
    if ((a3 & 1) != 0)
    {
      result = MEMORY[0x1BCCB9A40](v19, v20, a1, a2);
      if ((result & 1) == 0)
        return result;
LABEL_15:
      __break(1u);
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
LABEL_19:
    __break(1u);
    return result;
  }
  if ((a3 & 1) != 0)
    goto LABEL_19;
  if ((_DWORD)v20 != (_DWORD)a2)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v19 < a1)
    goto LABEL_15;
  return result;
}

uint64_t specialized Collection._failEarlyRangeCheck(_:bounds:)(__int128 *a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  __int128 v13;
  char v14;
  _BYTE v15[24];
  __int128 v16;
  char v17;
  _BYTE v18[24];
  __int128 v19;
  char v20;
  _BYTE v21[24];
  __int128 v22;
  char v23;
  _BYTE v24[24];
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  char v36;

  v19 = *a1;
  v20 = *((_BYTE *)a1 + 16);
  outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)&v19, (uint64_t)v21);
  v22 = *a2;
  v23 = *((_BYTE *)a2 + 16);
  outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)&v22, (uint64_t)v24);
  outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)v21, (uint64_t)&v28);
  if ((v30 & 1) != 0)
  {
    v4 = v28;
    v5 = v29;
    result = outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)v24, (uint64_t)&v25);
    if ((v27 & 1) != 0)
    {
      if ((MEMORY[0x1BCCB9A40](v4, v5, v25, v26) & 1) == 0)
        goto LABEL_4;
LABEL_11:
      __break(1u);
      goto LABEL_12;
    }
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v9 = v28;
  v10 = v29;
  result = outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)v24, (uint64_t)&v25);
  if ((v27 & 1) != 0)
    goto LABEL_18;
  if (v10 != (_DWORD)v26)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v9 < v25)
    goto LABEL_11;
LABEL_4:
  v13 = *(__int128 *)((char *)a2 + 24);
  v14 = *((_BYTE *)a2 + 40);
  outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)&v13, (uint64_t)v15);
  v16 = *(__int128 *)((char *)a1 + 24);
  v17 = *((_BYTE *)a1 + 40);
  outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)&v16, (uint64_t)v18);
  outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)v15, (uint64_t)&v34);
  if ((v36 & 1) != 0)
  {
    v7 = v34;
    v8 = v35;
    result = outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)v18, (uint64_t)&v31);
    if ((v33 & 1) != 0)
    {
      result = MEMORY[0x1BCCB9A40](v7, v8, v31, v32);
      if ((result & 1) == 0)
        return result;
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
LABEL_19:
    __break(1u);
    return result;
  }
LABEL_12:
  v11 = v34;
  v12 = v35;
  result = outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)v18, (uint64_t)&v31);
  if ((v33 & 1) != 0)
    goto LABEL_19;
  if (v12 != (_DWORD)v32)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v11 < v31)
    goto LABEL_15;
  return result;
}

uint64_t specialized Collection.index(_:offsetBy:limitedBy:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64x2_t v8;
  int64x2_t v9;
  int64x2_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2 < 0)
  {
LABEL_21:
    __break(1u);
    return result;
  }
  if (a2)
  {
    v3 = a3 - result;
    if (a3 - result >= (unint64_t)(a2 - 1))
      v3 = a2 - 1;
    if (v3 >= (result ^ 0x7FFFFFFFFFFFFFFFuLL))
      v3 = result ^ 0x7FFFFFFFFFFFFFFFLL;
    v4 = v3 + 1;
    if (v4 >= 5)
    {
      v7 = v4 & 3;
      if ((v4 & 3) == 0)
        v7 = 4;
      v5 = v4 - v7;
      v8 = 0uLL;
      v9 = (int64x2_t)(unint64_t)result;
      v10 = vdupq_n_s64(1uLL);
      v11 = v5;
      do
      {
        v9 = vaddq_s64(v9, v10);
        v8 = vaddq_s64(v8, v10);
        v11 -= 4;
      }
      while (v11);
      v6 = vaddvq_s64(vaddq_s64(v8, v9));
    }
    else
    {
      v5 = 0;
      v6 = result;
    }
    v12 = v5 + result - 0x7FFFFFFFFFFFFFFFLL;
    v13 = v5 + result - a3;
    v14 = a2 - v5;
    result = v6;
    while (1)
    {
      if (!v13)
        return 0;
      if (!v12)
        break;
      ++result;
      ++v12;
      ++v13;
      if (!--v14)
        return result;
    }
    __break(1u);
    goto LABEL_21;
  }
  return result;
}

uint64_t specialized Data.init(bytes:count:)(_BYTE *__src, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  if (a2 <= 14)
    return specialized Data.InlineData.init(_:)(__src, &__src[a2]);
  type metadata accessor for __DataStorage();
  swift_allocObject();
  __DataStorage.init(bytes:length:)();
  if ((unint64_t)a2 < 0x7FFFFFFF)
    return a2 << 32;
  type metadata accessor for Data.RangeReference();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t sub_1B8D28310()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1B8D28334()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in CMFormatDescriptionRef.parameterSets.getter(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in CMFormatDescriptionRef.parameterSets.getter(a1, a2, a3, v3);
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

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Key(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Key, &type metadata for CMFormatDescriptionRef.Extensions.Key);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Key, &type metadata for CMFormatDescriptionRef.Extensions.Key);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Key, &type metadata for CMFormatDescriptionRef.Extensions.Key);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Key, &type metadata for CMFormatDescriptionRef.Extensions.Key);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.FieldDetail(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.FieldDetail, &type metadata for CMFormatDescriptionRef.Extensions.Value.FieldDetail);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.FieldDetail, &type metadata for CMFormatDescriptionRef.Extensions.Value.FieldDetail);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.FieldDetail, &type metadata for CMFormatDescriptionRef.Extensions.Value.FieldDetail);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.FieldDetail, &type metadata for CMFormatDescriptionRef.Extensions.Value.FieldDetail);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.ColorPrimaries(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.ColorPrimaries, &type metadata for CMFormatDescriptionRef.Extensions.Value.ColorPrimaries);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.ColorPrimaries, &type metadata for CMFormatDescriptionRef.Extensions.Value.ColorPrimaries);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.ColorPrimaries, &type metadata for CMFormatDescriptionRef.Extensions.Value.ColorPrimaries);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.ColorPrimaries, &type metadata for CMFormatDescriptionRef.Extensions.Value.ColorPrimaries);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.TransferFunction(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.TransferFunction, &type metadata for CMFormatDescriptionRef.Extensions.Value.TransferFunction);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.TransferFunction, &type metadata for CMFormatDescriptionRef.Extensions.Value.TransferFunction);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.TransferFunction, &type metadata for CMFormatDescriptionRef.Extensions.Value.TransferFunction);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.TransferFunction, &type metadata for CMFormatDescriptionRef.Extensions.Value.TransferFunction);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix, &type metadata for CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix, &type metadata for CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix, &type metadata for CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix, &type metadata for CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.ChromaLocation(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.ChromaLocation, &type metadata for CMFormatDescriptionRef.Extensions.Value.ChromaLocation);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.ChromaLocation, &type metadata for CMFormatDescriptionRef.Extensions.Value.ChromaLocation);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.ChromaLocation, &type metadata for CMFormatDescriptionRef.Extensions.Value.ChromaLocation);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.ChromaLocation, &type metadata for CMFormatDescriptionRef.Extensions.Value.ChromaLocation);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile, &type metadata for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile, &type metadata for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile, &type metadata for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile, &type metadata for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile, &type metadata for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile, &type metadata for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile);
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.Vendor(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.Vendor, &type metadata for CMFormatDescriptionRef.Extensions.Value.Vendor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.Vendor, &type metadata for CMFormatDescriptionRef.Extensions.Value.Vendor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.Vendor, &type metadata for CMFormatDescriptionRef.Extensions.Value.Vendor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.Vendor, &type metadata for CMFormatDescriptionRef.Extensions.Value.Vendor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode, &type metadata for CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode, &type metadata for CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode, &type metadata for CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode, &type metadata for CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.FontFace, &type metadata for CMFormatDescriptionRef.Extensions.Value.FontFace);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.FontFace, &type metadata for CMFormatDescriptionRef.Extensions.Value.FontFace);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.FontFace, &type metadata for CMFormatDescriptionRef.Extensions.Value.FontFace);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.FontFace, &type metadata for CMFormatDescriptionRef.Extensions.Value.FontFace);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.FontFace, &type metadata for CMFormatDescriptionRef.Extensions.Value.FontFace);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.FontFace, &type metadata for CMFormatDescriptionRef.Extensions.Value.FontFace);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.FontFace(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace);
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags, &type metadata for CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags, &type metadata for CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags, &type metadata for CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags, &type metadata for CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.TextJustification(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.TextJustification, &type metadata for CMFormatDescriptionRef.Extensions.Value.TextJustification);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.TextJustification, &type metadata for CMFormatDescriptionRef.Extensions.Value.TextJustification);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.TextJustification, &type metadata for CMFormatDescriptionRef.Extensions.Value.TextJustification);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value.TextJustification, &type metadata for CMFormatDescriptionRef.Extensions.Value.TextJustification);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value and conformance CMFormatDescriptionRef.Extensions.Value()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value and conformance CMFormatDescriptionRef.Extensions.Value;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value and conformance CMFormatDescriptionRef.Extensions.Value)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Value, &type metadata for CMFormatDescriptionRef.Extensions.Value);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value and conformance CMFormatDescriptionRef.Extensions.Value);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions and conformance CMFormatDescriptionRef.Extensions()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions and conformance CMFormatDescriptionRef.Extensions;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions and conformance CMFormatDescriptionRef.Extensions)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions, &type metadata for CMFormatDescriptionRef.Extensions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions and conformance CMFormatDescriptionRef.Extensions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions and conformance CMFormatDescriptionRef.Extensions;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions and conformance CMFormatDescriptionRef.Extensions)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions, &type metadata for CMFormatDescriptionRef.Extensions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions and conformance CMFormatDescriptionRef.Extensions);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Index and conformance CMFormatDescriptionRef.Extensions.Index()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Index and conformance CMFormatDescriptionRef.Extensions.Index;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Index and conformance CMFormatDescriptionRef.Extensions.Index)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Index, &type metadata for CMFormatDescriptionRef.Extensions.Index);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Index and conformance CMFormatDescriptionRef.Extensions.Index);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Index and conformance CMFormatDescriptionRef.Extensions.Index;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Index and conformance CMFormatDescriptionRef.Extensions.Index)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.Extensions.Index, &type metadata for CMFormatDescriptionRef.Extensions.Index);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Index and conformance CMFormatDescriptionRef.Extensions.Index);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in CMFormatDescriptionRef.Extensions()
{
  return lazy protocol witness table accessor for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type DefaultIndices<CMFormatDescriptionRef.Extensions> and conformance DefaultIndices<A>, &demangling cache variable for type metadata for DefaultIndices<CMFormatDescriptionRef.Extensions>, MEMORY[0x1E0DEA228]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in CMFormatDescriptionRef.Extensions()
{
  return lazy protocol witness table accessor for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<CMFormatDescriptionRef.Extensions> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<CMFormatDescriptionRef.Extensions>, MEMORY[0x1E0DEDE48]);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in CMFormatDescriptionRef.Extensions()
{
  return lazy protocol witness table accessor for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type IndexingIterator<CMFormatDescriptionRef.Extensions> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<CMFormatDescriptionRef.Extensions>, MEMORY[0x1E0DEC908]);
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.MediaType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.MediaType, &type metadata for CMFormatDescriptionRef.MediaType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.MediaType, &type metadata for CMFormatDescriptionRef.MediaType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.MediaType, &type metadata for CMFormatDescriptionRef.MediaType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.MediaType, &type metadata for CMFormatDescriptionRef.MediaType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.MediaType, &type metadata for CMFormatDescriptionRef.MediaType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.MediaType, &type metadata for CMFormatDescriptionRef.MediaType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.MediaType(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType);
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.MediaSubType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType);
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = a4();
  result = a5();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.MediaSubType, &type metadata for CMFormatDescriptionRef.MediaSubType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.MediaSubType, &type metadata for CMFormatDescriptionRef.MediaSubType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.MediaSubType, &type metadata for CMFormatDescriptionRef.MediaSubType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.MediaSubType, &type metadata for CMFormatDescriptionRef.MediaSubType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.MediaSubType, &type metadata for CMFormatDescriptionRef.MediaSubType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.MediaSubType, &type metadata for CMFormatDescriptionRef.MediaSubType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.MediaSubType(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.EqualityMask, &type metadata for CMFormatDescriptionRef.EqualityMask);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.EqualityMask, &type metadata for CMFormatDescriptionRef.EqualityMask);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.EqualityMask, &type metadata for CMFormatDescriptionRef.EqualityMask);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.EqualityMask, &type metadata for CMFormatDescriptionRef.EqualityMask);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.ParameterSetCollection, &type metadata for CMFormatDescriptionRef.ParameterSetCollection);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.ParameterSetCollection, &type metadata for CMFormatDescriptionRef.ParameterSetCollection);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.ParameterSetCollection, &type metadata for CMFormatDescriptionRef.ParameterSetCollection);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.ParameterSetCollection, &type metadata for CMFormatDescriptionRef.ParameterSetCollection);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Indices : RandomAccessCollection in CMFormatDescriptionRef.ParameterSetCollection()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>, MEMORY[0x1E0DEB8B8]);
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    result = MEMORY[0x1BCCBA8B0](MEMORY[0x1E0DEB440], MEMORY[0x1E0DEB418]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in CMFormatDescriptionRef.ParameterSetCollection()
{
  return lazy protocol witness table accessor for type Slice<CMFormatDescriptionRef.ParameterSetCollection> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<CMFormatDescriptionRef.ParameterSetCollection> and conformance <> Slice<A>, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection, MEMORY[0x1E0DEDE40]);
}

uint64_t associated type witness table accessor for Collection.Indices : BidirectionalCollection in CMFormatDescriptionRef.ParameterSetCollection()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>, MEMORY[0x1E0DEB890]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in CMFormatDescriptionRef.ParameterSetCollection()
{
  return lazy protocol witness table accessor for type Slice<CMFormatDescriptionRef.ParameterSetCollection> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<CMFormatDescriptionRef.ParameterSetCollection> and conformance <> Slice<A>, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection, MEMORY[0x1E0DEDE28]);
}

uint64_t lazy protocol witness table accessor for type Slice<CMFormatDescriptionRef.ParameterSetCollection> and conformance <> Slice<A>(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Slice<CMFormatDescriptionRef.ParameterSetCollection>);
    v8 = a2();
    result = MEMORY[0x1BCCBA8B0](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in CMFormatDescriptionRef.ParameterSetCollection()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>, MEMORY[0x1E0DEB8C0]);
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
    v7[0] = MEMORY[0x1E0DEB458];
    v7[1] = v6;
    result = MEMORY[0x1BCCBA8B0](a2, v5, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in CMFormatDescriptionRef.ParameterSetCollection()
{
  return lazy protocol witness table accessor for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<CMFormatDescriptionRef.ParameterSetCollection> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<CMFormatDescriptionRef.ParameterSetCollection>, MEMORY[0x1E0DEDE48]);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in CMFormatDescriptionRef.ParameterSetCollection()
{
  return lazy protocol witness table accessor for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type IndexingIterator<CMFormatDescriptionRef.ParameterSetCollection> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<CMFormatDescriptionRef.ParameterSetCollection>, MEMORY[0x1E0DEC908]);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.TimeCode.Flag, &type metadata for CMFormatDescriptionRef.TimeCode.Flag);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.TimeCode.Flag, &type metadata for CMFormatDescriptionRef.TimeCode.Flag);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.TimeCode.Flag, &type metadata for CMFormatDescriptionRef.TimeCode.Flag);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMFormatDescriptionRef.TimeCode.Flag, &type metadata for CMFormatDescriptionRef.TimeCode.Flag);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag);
  }
  return result;
}

uint64_t sub_1B8D29E34()
{
  return 0;
}

uint64_t sub_1B8D29E4C()
{
  return 0;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions()
{
  return &type metadata for CMFormatDescriptionRef.Extensions;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Key()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Key;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value.FieldDetail()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value.FieldDetail;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value.ColorPrimaries()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value.ColorPrimaries;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value.TransferFunction()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value.TransferFunction;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value.ChromaLocation()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value.ChromaLocation;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value.Vendor()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value.Vendor;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value.FontFace()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value.FontFace;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value.TextJustification()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value.TextJustification;
}

uint64_t destroy for CMFormatDescriptionRef.Extensions.Index(uint64_t a1)
{
  return outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t initializeBufferWithCopyOfBuffer for CMFormatDescriptionRef.Extensions.Index(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  outlined copy of [A : B].Index._Variant<A, B>(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for CMFormatDescriptionRef.Extensions.Index(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  outlined copy of [A : B].Index._Variant<A, B>(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for CMFormatDescriptionRef.Extensions.Index(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for CMFormatDescriptionRef.Extensions.Index(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CMFormatDescriptionRef.Extensions.Index(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Index()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Index;
}

uint64_t dispatch thunk of _CMFormatDescriptionInitTrampoline.init(referencing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Error()
{
  return &type metadata for CMFormatDescriptionRef.Error;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.MediaType()
{
  return &type metadata for CMFormatDescriptionRef.MediaType;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.MediaSubType()
{
  return &type metadata for CMFormatDescriptionRef.MediaSubType;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.EqualityMask()
{
  return &type metadata for CMFormatDescriptionRef.EqualityMask;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.ParameterSetCollection()
{
  return &type metadata for CMFormatDescriptionRef.ParameterSetCollection;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.TimeCode()
{
  return &type metadata for CMFormatDescriptionRef.TimeCode;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.TimeCode.Flag()
{
  return &type metadata for CMFormatDescriptionRef.TimeCode.Flag;
}

uint64_t outlined retain of Range<CMFormatDescriptionRef.Extensions.Index>(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_BYTE *)(a1 + 40);
  outlined copy of [A : B].Index._Variant<A, B>(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  outlined copy of [A : B].Index._Variant<A, B>(v2, v3, v4);
  return a1;
}

uint64_t _sSo11CFStringRefaABSHSCWlTm_0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CFStringRef(255);
    result = MEMORY[0x1BCCBA8B0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t CMTime.isValid.getter(uint64_t a1, unint64_t a2)
{
  return HIDWORD(a2) & 1;
}

BOOL CMTime.isIndefinite.getter(uint64_t a1, uint64_t a2)
{
  return (~a2 & 0x1100000000) == 0;
}

CMTime __swiftcall CMTime.init(value:timescale:)(Swift::Int64 value, Swift::Int32 timescale)
{
  CMTimeValue v2;
  uint64_t v3;
  CMTimeEpoch epoch;
  CMTime v5;
  CMTime result;

  CMTimeMake(&v5, value, timescale);
  v2 = v5.value;
  v3 = *(_QWORD *)&v5.timescale;
  epoch = v5.epoch;
  result.epoch = epoch;
  result.timescale = v3;
  result.flags = HIDWORD(v3);
  result.value = v2;
  return result;
}

BOOL CMTime.isPositiveInfinity.getter(uint64_t a1, uint64_t a2)
{
  return (~a2 & 0x500000000) == 0;
}

BOOL CMTime.isNegativeInfinity.getter(uint64_t a1, uint64_t a2)
{
  return (~a2 & 0x900000000) == 0;
}

BOOL CMTime.isNumeric.getter(uint64_t a1, uint64_t a2)
{
  return (a2 & 0x1D00000000) == 0x100000000;
}

BOOL CMTime.hasBeenRounded.getter(uint64_t a1, uint64_t a2)
{
  return (a2 & 0x1F00000000) == 0x300000000;
}

Float64 CMTime.seconds.getter(CMTimeValue a1, uint64_t a2, CMTimeEpoch a3)
{
  CMTime time;

  time.value = a1;
  *(_QWORD *)&time.timescale = a2;
  time.epoch = a3;
  return CMTimeGetSeconds(&time);
}

CMTime __swiftcall CMTime.convertScale(_:method:)(Swift::Int32 _, CMTimeRoundingMethod method)
{
  CMTimeValue v2;
  uint64_t v3;
  CMTimeEpoch v4;
  CMTimeValue value;
  uint64_t v6;
  CMTimeEpoch epoch;
  CMTime v8;
  CMTime time;
  CMTime result;

  time.value = v2;
  *(_QWORD *)&time.timescale = v3;
  time.epoch = v4;
  CMTimeConvertScale(&v8, &time, _, method);
  value = v8.value;
  v6 = *(_QWORD *)&v8.timescale;
  epoch = v8.epoch;
  result.epoch = epoch;
  result.timescale = v6;
  result.flags = HIDWORD(v6);
  result.value = value;
  return result;
}

Swift::Bool __swiftcall CMTIME_IS_VALID(_:)(CMTime a1)
{
  return a1.flags & 1;
}

Swift::Bool __swiftcall CMTIME_IS_INVALID(_:)(CMTime a1)
{
  return (*(_QWORD *)&a1.timescale & 0x100000000) == 0;
}

Swift::Bool __swiftcall CMTIME_IS_POSITIVEINFINITY(_:)(CMTime a1)
{
  return (~*(_QWORD *)&a1.timescale & 0x500000000) == 0;
}

Swift::Bool __swiftcall CMTIME_IS_NEGATIVEINFINITY(_:)(CMTime a1)
{
  return (~*(_QWORD *)&a1.timescale & 0x900000000) == 0;
}

Swift::Bool __swiftcall CMTIME_IS_INDEFINITE(_:)(CMTime a1)
{
  return (~*(_QWORD *)&a1.timescale & 0x1100000000) == 0;
}

Swift::Bool __swiftcall CMTIME_IS_NUMERIC(_:)(CMTime a1)
{
  return (*(_QWORD *)&a1.timescale & 0x1D00000000) == 0x100000000;
}

Swift::Bool __swiftcall CMTIME_HAS_BEEN_ROUNDED(_:)(CMTime a1)
{
  return (*(_QWORD *)&a1.timescale & 0x1F00000000) == 0x300000000;
}

uint64_t static CMTime.+ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return static CMTime.+ infix(_:_:)(a1, a2, a3, a4, a5, a6, MEMORY[0x1E0C9F298]);
}

uint64_t static CMTime.- infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return static CMTime.+ infix(_:_:)(a1, a2, a3, a4, a5, a6, (void (*)(uint64_t *__return_ptr, _QWORD *, _QWORD *))MEMORY[0x1E0C9F400]);
}

uint64_t static CMTime.+ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t *__return_ptr, _QWORD *, _QWORD *))
{
  uint64_t v8;
  _QWORD v9[3];
  _QWORD v10[3];

  v10[0] = a1;
  v10[1] = a2;
  v10[2] = a3;
  v9[0] = a4;
  v9[1] = a5;
  v9[2] = a6;
  a7(&v8, v10, v9);
  return v8;
}

uint64_t static CMTime.< infix(_:_:)(CMTimeValue a1, uint64_t a2, CMTimeEpoch a3, CMTimeValue a4, uint64_t a5, CMTimeEpoch a6)
{
  CMTime v7;
  CMTime time1;

  v7.epoch = a6;
  time1.value = a1;
  *(_QWORD *)&time1.timescale = a2;
  time1.epoch = a3;
  v7.value = a4;
  *(_QWORD *)&v7.timescale = a5;
  return CMTimeCompare(&time1, &v7) >> 31;
}

BOOL static CMTime.<= infix(_:_:)(CMTimeValue a1, uint64_t a2, CMTimeEpoch a3, CMTimeValue a4, uint64_t a5, CMTimeEpoch a6)
{
  CMTime v7;
  CMTime time1;

  v7.epoch = a6;
  time1.value = a1;
  *(_QWORD *)&time1.timescale = a2;
  time1.epoch = a3;
  v7.value = a4;
  *(_QWORD *)&v7.timescale = a5;
  return CMTimeCompare(&time1, &v7) < 1;
}

BOOL static CMTime.> infix(_:_:)(CMTimeValue a1, uint64_t a2, CMTimeEpoch a3, CMTimeValue a4, uint64_t a5, CMTimeEpoch a6)
{
  CMTime v7;
  CMTime time1;

  v7.epoch = a6;
  time1.value = a1;
  *(_QWORD *)&time1.timescale = a2;
  time1.epoch = a3;
  v7.value = a4;
  *(_QWORD *)&v7.timescale = a5;
  return CMTimeCompare(&time1, &v7) > 0;
}

BOOL static CMTime.>= infix(_:_:)(CMTimeValue a1, uint64_t a2, CMTimeEpoch a3, CMTimeValue a4, uint64_t a5, CMTimeEpoch a6)
{
  CMTime v7;
  CMTime time1;

  v7.epoch = a6;
  time1.value = a1;
  *(_QWORD *)&time1.timescale = a2;
  time1.epoch = a3;
  v7.value = a4;
  *(_QWORD *)&v7.timescale = a5;
  return CMTimeCompare(&time1, &v7) >= 0;
}

BOOL static CMTime.!= infix(_:_:)(CMTimeValue a1, uint64_t a2, CMTimeEpoch a3, CMTimeValue a4, uint64_t a5, CMTimeEpoch a6)
{
  CMTime v7;
  CMTime time1;

  v7.epoch = a6;
  time1.value = a1;
  *(_QWORD *)&time1.timescale = a2;
  time1.epoch = a3;
  v7.value = a4;
  *(_QWORD *)&v7.timescale = a5;
  return CMTimeCompare(&time1, &v7) != 0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CMTime(CMTimeValue *a1, CMTimeValue *a2)
{
  CMTimeValue v2;
  CMTimeEpoch v3;
  CMTimeValue v4;
  CMTime v6;
  CMTime time1;

  v2 = *a1;
  v3 = a1[2];
  v4 = *a2;
  v6.epoch = a2[2];
  time1.value = v2;
  *(_QWORD *)&time1.timescale = a1[1];
  time1.epoch = v3;
  v6.value = v4;
  *(_QWORD *)&v6.timescale = a2[1];
  return CMTimeCompare(&time1, &v6) == 0;
}

uint64_t protocol witness for static Comparable.< infix(_:_:) in conformance CMTime(CMTimeValue *a1, CMTimeValue *a2)
{
  CMTimeValue v2;
  CMTimeEpoch v3;
  CMTimeValue v4;
  CMTime v6;
  CMTime time1;

  v2 = *a1;
  v3 = a1[2];
  v4 = *a2;
  v6.epoch = a2[2];
  time1.value = v2;
  *(_QWORD *)&time1.timescale = a1[1];
  time1.epoch = v3;
  v6.value = v4;
  *(_QWORD *)&v6.timescale = a2[1];
  return CMTimeCompare(&time1, &v6) >> 31;
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance CMTime(CMTimeValue *a1, CMTimeValue *a2)
{
  CMTimeValue v2;
  CMTimeEpoch v3;
  CMTimeValue v4;
  CMTime v6;
  CMTime time1;

  v2 = *a1;
  v3 = a1[2];
  v4 = *a2;
  v6.epoch = a2[2];
  time1.value = v2;
  *(_QWORD *)&time1.timescale = a1[1];
  time1.epoch = v3;
  v6.value = v4;
  *(_QWORD *)&v6.timescale = a2[1];
  return CMTimeCompare(&time1, &v6) < 1;
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance CMTime(CMTimeValue *a1, CMTimeValue *a2)
{
  CMTimeValue v2;
  CMTimeEpoch v3;
  CMTimeValue v4;
  CMTime v6;
  CMTime time1;

  v2 = *a1;
  v3 = a1[2];
  v4 = *a2;
  v6.epoch = a2[2];
  time1.value = v2;
  *(_QWORD *)&time1.timescale = a1[1];
  time1.epoch = v3;
  v6.value = v4;
  *(_QWORD *)&v6.timescale = a2[1];
  return CMTimeCompare(&time1, &v6) >= 0;
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance CMTime(CMTimeValue *a1, CMTimeValue *a2)
{
  CMTimeValue v2;
  CMTimeEpoch v3;
  CMTimeValue v4;
  CMTime v6;
  CMTime time1;

  v2 = *a1;
  v3 = a1[2];
  v4 = *a2;
  v6.epoch = a2[2];
  time1.value = v2;
  *(_QWORD *)&time1.timescale = a1[1];
  time1.epoch = v3;
  v6.value = v4;
  *(_QWORD *)&v6.timescale = a2[1];
  return CMTimeCompare(&time1, &v6) > 0;
}

void CMTime.hash(into:)(uint64_t a1, int64_t a2, Swift::UInt64 a3, Swift::UInt64 a4)
{
  Swift::UInt64 v5;
  Swift::UInt64 v7;
  Swift::UInt64 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a3;
  v7 = HIDWORD(a3);
  Hasher._combine(_:)(HIDWORD(a3) & 0xFFFFFFFD);
  if ((v7 & 0x1D) == 1)
  {
    v8 = v5 << 32;
    v5 = (int)v5;
    v9 = a2;
    if (v8)
    {
      v10 = (int)v5;
      v11 = a2;
      while (1)
      {
        v9 = v10;
        if (v10 == -1 && v11 == 0x8000000000000000)
          break;
        v10 = v11 % v10;
        v11 = v9;
        if (!v10)
          goto LABEL_8;
      }
      __break(1u);
    }
LABEL_8:
    if (v9)
    {
      if (a2 == 0x8000000000000000 && v9 == -1)
      {
        __break(1u);
        return;
      }
      a2 /= v9;
      v5 = (int)v5 / v9;
    }
    Hasher._combine(_:)(a2);
    Hasher._combine(_:)(v5);
    Hasher._combine(_:)(a4);
  }
}

void CMTime.hashValue.getter(int64_t a1, Swift::UInt64 a2, Swift::UInt64 a3)
{
  Swift::UInt64 v4;
  Swift::UInt64 v6;
  Swift::UInt64 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2;
  v6 = HIDWORD(a2);
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v6 & 0xFFFFFFFD);
  if ((v6 & 0x1D) != 1)
    goto LABEL_13;
  v7 = v4 << 32;
  v4 = (int)v4;
  v8 = a1;
  if (v7)
  {
    v9 = (int)v4;
    v10 = a1;
    while (1)
    {
      v8 = v9;
      if (v9 == -1 && v10 == 0x8000000000000000)
        break;
      v9 = v10 % v9;
      v10 = v8;
      if (!v9)
        goto LABEL_8;
    }
    __break(1u);
  }
LABEL_8:
  if (!v8)
  {
LABEL_12:
    Hasher._combine(_:)(a1);
    Hasher._combine(_:)(v4);
    Hasher._combine(_:)(a3);
LABEL_13:
    Hasher._finalize()();
    return;
  }
  if (a1 != 0x8000000000000000 || v8 != -1)
  {
    a1 /= v8;
    v4 = (int)v4 / v8;
    goto LABEL_12;
  }
  __break(1u);
}

void protocol witness for Hashable.hashValue.getter in conformance CMTime()
{
  uint64_t v0;

  CMTime.hashValue.getter(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_QWORD *)(v0 + 16));
}

void protocol witness for Hashable.hash(into:) in conformance CMTime(uint64_t a1)
{
  uint64_t v1;

  CMTime.hash(into:)(a1, *(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16));
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance CMTime()
{
  uint64_t v0;
  int64_t v1;
  int v2;
  int64_t v3;
  Swift::UInt64 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)v0;
  v2 = *(_DWORD *)(v0 + 12);
  v3 = *(int *)(v0 + 8);
  v4 = *(_QWORD *)(v0 + 16);
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v2 & 0xFFFFFFFD);
  if ((v2 & 0x1D) != 1)
    goto LABEL_13;
  v5 = v1;
  if ((_DWORD)v3)
  {
    v6 = v3;
    v7 = v1;
    while (1)
    {
      v5 = v6;
      if (v6 == -1 && v7 == 0x8000000000000000)
        break;
      v6 = v7 % v6;
      v7 = v5;
      if (!v6)
        goto LABEL_8;
    }
    __break(1u);
  }
LABEL_8:
  if (!v5)
  {
LABEL_12:
    Hasher._combine(_:)(v1);
    Hasher._combine(_:)(v3);
    Hasher._combine(_:)(v4);
LABEL_13:
    Hasher._finalize()();
    return;
  }
  if (v1 != 0x8000000000000000 || v5 != -1)
  {
    v1 /= v5;
    v3 /= v5;
    goto LABEL_12;
  }
  __break(1u);
}

Swift::Int __swiftcall CMTime.compareApproximately(to:)(CMTime to)
{
  CMTimeValue v1;
  uint64_t v2;
  CMTimeEpoch v3;
  CMTime v5;
  CMTime v6;

  v5 = to;
  v6.value = v1;
  *(_QWORD *)&v6.timescale = v2;
  v6.epoch = v3;
  return (int)CMTimeCompareApproximately(&v6, &v5);
}

CMTime __swiftcall CMTime.fromSourceTimeToTargetTime(speedRamp:)(Swift::OpaquePointer speedRamp)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  CMTimeValue v4;
  uint64_t v5;
  CMTimeEpoch v6;
  CMTime result;

  v4 = CMTime.fromSourceTimeToTargetTime(speedRamp:)((uint64_t)speedRamp._rawValue, v1, v2, v3, MEMORY[0x1E0C9F120]);
  result.epoch = v6;
  result.timescale = v5;
  result.flags = HIDWORD(v5);
  result.value = v4;
  return result;
}

CMTime __swiftcall CMTime.fromTargetTimeToSourceTime(speedRamp:)(Swift::OpaquePointer speedRamp)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  CMTimeValue v4;
  uint64_t v5;
  CMTimeEpoch v6;
  CMTime result;

  v4 = CMTime.fromSourceTimeToTargetTime(speedRamp:)((uint64_t)speedRamp._rawValue, v1, v2, v3, MEMORY[0x1E0C9F128]);
  result.epoch = v6;
  result.timescale = v5;
  result.flags = HIDWORD(v5);
  result.value = v4;
  return result;
}

uint64_t CMTime.fromSourceTimeToTargetTime(speedRamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t *__return_ptr, _QWORD *, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[3];

  v5 = *(_QWORD *)(a1 + 16);
  v8[0] = a2;
  v8[1] = a3;
  v8[2] = a4;
  a5(&v7, v8, a1 + 32, v5);
  return v7;
}

uint64_t CMTimeCompareApproximately(CMTime *a1, CMTime *a2)
{
  CMTime time2;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  CMTime time1;

  if ((a1->flags & 0x1F) == 3 || (a2->flags & 0x1F) == 3)
  {
    memset(&time1, 0, sizeof(time1));
    lhs = *a1;
    rhs = *a2;
    CMTimeSubtract(&time, &lhs, &rhs);
    CMTimeAbsoluteValue(&time1, &time);
    CMTimeMake(&time2, 1, 1000000000);
    lhs = time1;
    if (CMTimeCompare(&lhs, &time2) < 1)
      return 0;
  }
  time1 = *a1;
  lhs = *a2;
  return CMTimeCompare(&time1, &lhs);
}

unint64_t lazy protocol witness table accessor for type CMTime and conformance CMTime()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type CMTime and conformance CMTime;
  if (!lazy protocol witness table cache variable for type CMTime and conformance CMTime)
  {
    type metadata accessor for CMTime(255);
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMTime, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMTime and conformance CMTime);
  }
  return result;
}

CMTagCollectionRef Array<A>.tagCollection.getter(unint64_t a1)
{
  uint64_t v2;
  char *v3;
  CMTagCollectionRef result;
  CMTagCollectionRef newCollectionOut[2];

  newCollectionOut[1] = *(CMTagCollectionRef *)MEMORY[0x1E0C80C00];
  newCollectionOut[0] = 0;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v2)
  {
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2 & ~(v2 >> 63), 0);
    if ((v2 & 0x8000000000000000) == 0)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v3 = (char *)&loc_1B8D2ADD0 + dword_1B8D2AFAC[*(unsigned __int8 *)(MEMORY[0x1BCCB998C](0, a1) + 32)];
        __asm { BR              X9 }
      }
      __asm { BR              X9 }
    }
    __break(1u);
LABEL_12:
    __break(1u);
  }
  closure #2 in Array<A>.tagCollection.getter((CMTag *)(MEMORY[0x1E0DEE9D8] + 32), *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16), a1, newCollectionOut);
  swift_bridgeObjectRelease();
  result = newCollectionOut[0];
  if (!newCollectionOut[0])
    goto LABEL_12;
  return result;
}

uint64_t closure #2 in Array<A>.tagCollection.getter(CMTag *tags, int a2, unint64_t a3, CMTagCollectionRef *newCollectionOut)
{
  const __CFAllocator *v6;
  CMItemCount v7;
  OSStatus v8;
  uint64_t result;
  Swift::String v10;

  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v8 = CMTagCollectionCreate(v6, tags, v7, newCollectionOut);
  result = noErr.getter();
  if (v8 != (_DWORD)result || !*newCollectionOut)
  {
    _StringGuts.grow(_:)(43);
    swift_bridgeObjectRelease();
    v10._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
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

_QWORD *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CMTag>);
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
    memcpy(v13, v14, 16 * v8);
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafeMutableRawPointer?>);
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
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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

_QWORD *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<[CMTag]>);
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
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4])
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CMTag]);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t specialized Array<A>.init(tagCollection:)(const OpaqueCMTagCollection *a1)
{
  CMItemCount Count;
  CMItemCount v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  OSStatus Tags;
  uint64_t v12;
  CMTagValue *v13;
  uint64_t FlagsValue;
  uint64_t v15;
  char v16;
  CMTagValue v17;
  unint64_t v18;
  CMTagDataType ValueDataType;
  int v20;
  int64_t SInt64Value;
  uint64_t OSTypeValue;
  Float64 Float64Value;
  Swift::String v25;
  Swift::String v26;
  uint64_t v27;
  CMTag v28;
  CMTag v29;
  CMTag v30;
  CMTag v31;
  CMTag v32;

  Count = CMTagCollectionGetCount(a1);
  if (Count < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  v3 = Count;
  v4 = MEMORY[0x1E0DEE9D8];
  if (Count)
  {
    v5 = *MEMORY[0x1E0CA27F8];
    v6 = *(_QWORD *)(MEMORY[0x1E0CA27F8] + 8);
    type metadata accessor for CMTag(0);
    v7 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    v8 = v7;
    *(_QWORD *)(v7 + 16) = v3;
    v9 = 32;
    do
    {
      v10 = (_QWORD *)(v7 + v9);
      *v10 = v5;
      v10[1] = v6;
      v9 += 16;
      --v3;
    }
    while (v3);
  }
  else
  {
    v8 = MEMORY[0x1E0DEE9D8];
  }
  Tags = CMTagCollectionGetTags(a1, (CMTag *)(v8 + 32), *(_QWORD *)(v8 + 16), 0);
  if (Tags != noErr.getter())
  {
    while (1)
    {
      _StringGuts.grow(_:)(35);
      swift_bridgeObjectRelease();
      v25._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v25);
      swift_bridgeObjectRelease();
      v26._countAndFlagsBits = 0xD00000000000001BLL;
      v26._object = (void *)0x80000001B8D33230;
      String.append(_:)(v26);
LABEL_23:
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
  }
  v27 = v4;
  v12 = *(_QWORD *)(v8 + 16);
  swift_bridgeObjectRetain();
  if (v12)
  {
    v13 = (CMTagValue *)(v8 + 40);
    do
    {
      v18 = *(v13 - 1);
      v17 = *v13;
      if (CMTagIsValid(v18))
      {
        *(_QWORD *)&v29.category = v18;
        v29.value = v17;
        ValueDataType = CMTagGetValueDataType(v29);
        v20 = CMTimebaseRef.NotificationKey.rawValue.modify(v18, v17);
        switch(ValueDataType)
        {
          case kCMTagDataType_SInt64:
            *(_QWORD *)&v30.category = v18;
            v30.value = v17;
            SInt64Value = CMTagGetSInt64Value(v30);
            type metadata accessor for CMTag();
            v15 = swift_allocObject();
            v16 = 0;
            *(_DWORD *)(v15 + 16) = v20;
            *(_QWORD *)(v15 + 24) = SInt64Value;
            goto LABEL_11;
          case kCMTagDataType_Float64:
            *(_QWORD *)&v32.category = v18;
            v32.value = v17;
            Float64Value = CMTagGetFloat64Value(v32);
            type metadata accessor for CMTag();
            v15 = swift_allocObject();
            *(_DWORD *)(v15 + 16) = v20;
            *(Float64 *)(v15 + 24) = Float64Value;
            v16 = 1;
            goto LABEL_11;
          case kCMTagDataType_OSType:
            *(_QWORD *)&v31.category = v18;
            v31.value = v17;
            OSTypeValue = CMTagGetOSTypeValue(v31);
            type metadata accessor for CMTag();
            v15 = swift_allocObject();
            *(_DWORD *)(v15 + 16) = v20;
            *(_QWORD *)(v15 + 24) = OSTypeValue;
            v16 = 2;
            goto LABEL_11;
          case kCMTagDataType_Flags:
            *(_QWORD *)&v28.category = v18;
            v28.value = v17;
            FlagsValue = CMTagGetFlagsValue(v28);
            type metadata accessor for CMTag();
            v15 = swift_allocObject();
            *(_DWORD *)(v15 + 16) = v20;
            *(_QWORD *)(v15 + 24) = FlagsValue;
            v16 = 3;
LABEL_11:
            *(_BYTE *)(v15 + 32) = v16;
            MEMORY[0x1BCCB986C]();
            if (*(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
            specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
            specialized Array._endMutation()();
            break;
          default:
            goto LABEL_23;
        }
      }
      v13 += 2;
      --v12;
    }
    while (v12);
    v4 = v27;
  }
  swift_bridgeObjectRelease_n();

  return v4;
}

BOOL CMTagIsValid(unint64_t a1)
{
  return HIDWORD(a1) != 0;
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  int v4;
  unsigned __int8 *v5;
  int v6;
  int v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (unsigned __int8 *)(a1 + 32);
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
    LOBYTE(v4) = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  int *v5;
  int v6;
  int v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (int *)(a1 + 32);
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

size_t CMBlockBufferRef.endIndex.getter()
{
  OpaqueCMBlockBuffer *v0;

  return CMBlockBufferGetDataLength(v0);
}

id CMBlockBufferRef.Slice.owner.getter()
{
  id *v0;

  return *v0;
}

uint64_t CMBlockBufferRef.Slice.startIndex.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t CMBlockBufferRef.Slice.endIndex.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t protocol witness for CMBlockBufferProtocol.startIndex.getter in conformance CMBlockBufferRef.Slice()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t protocol witness for CMBlockBufferProtocol.endIndex.getter in conformance CMBlockBufferRef.Slice()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

id CMBlockBufferRef.owner.getter()
{
  void *v0;

  return v0;
}

uint64_t CMBlockBufferRef.startIndex.getter()
{
  return 0;
}

size_t protocol witness for CMBlockBufferProtocol.endIndex.getter in conformance CMBlockBufferRef()
{
  CMBlockBufferRef *v0;

  return CMBlockBufferGetDataLength(*v0);
}

OpaqueCMBlockBuffer *CMBlockBufferProtocol.subscript.getter@<X0>(OpaqueCMBlockBuffer *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, OpaqueCMBlockBuffer **a5@<X8>)
{
  OpaqueCMBlockBuffer *result;
  BOOL v9;
  uint64_t v10;
  OpaqueCMBlockBuffer *v11;

  result = (OpaqueCMBlockBuffer *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
  v9 = __OFADD__(a2, 1);
  v10 = a2 + 1;
  if (v9)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (((unint64_t)a1 & 0x8000000000000000) != 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v11 = result;
  result = (OpaqueCMBlockBuffer *)CMBlockBufferGetDataLength(result);
  if ((uint64_t)result >= v10)
  {
    *a5 = v11;
    a5[1] = a1;
    a5[2] = (OpaqueCMBlockBuffer *)v10;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

{
  OpaqueCMBlockBuffer *result;
  OpaqueCMBlockBuffer *v9;

  result = (OpaqueCMBlockBuffer *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
  if (((unint64_t)a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v9 = result;
    result = (OpaqueCMBlockBuffer *)CMBlockBufferGetDataLength(result);
    if ((uint64_t)result >= a2)
    {
      *a5 = v9;
      a5[1] = a1;
      a5[2] = (OpaqueCMBlockBuffer *)a2;
      return result;
    }
  }
  __break(1u);
  return result;
}

int64_t CMBlockBufferProtocol.subscript.getter@<X0>(int64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, OpaqueCMBlockBuffer **a4@<X8>)
{
  OpaqueCMBlockBuffer *v6;
  int64_t result;

  v6 = (OpaqueCMBlockBuffer *)(*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
  result = CMBlockBufferGetDataLength(v6);
  if (result < a1)
  {
    __break(1u);
  }
  else
  {
    *a4 = v6;
    a4[1] = 0;
    a4[2] = (OpaqueCMBlockBuffer *)a1;
  }
  return result;
}

OpaqueCMBlockBuffer *CMBlockBufferProtocol.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, OpaqueCMBlockBuffer **a4@<X8>)
{
  OpaqueCMBlockBuffer *result;
  BOOL v7;
  uint64_t v8;
  OpaqueCMBlockBuffer *v9;

  result = (OpaqueCMBlockBuffer *)(*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
  v7 = __OFADD__(a1, 1);
  v8 = a1 + 1;
  if (v7)
  {
    __break(1u);
  }
  else
  {
    v9 = result;
    result = (OpaqueCMBlockBuffer *)CMBlockBufferGetDataLength(result);
    if ((uint64_t)result >= v8)
    {
      *a4 = v9;
      a4[1] = 0;
      a4[2] = (OpaqueCMBlockBuffer *)v8;
      return result;
    }
  }
  __break(1u);
  return result;
}

void CMBlockBufferProtocol.subscript.getter(OpaqueCMBlockBuffer *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, OpaqueCMBlockBuffer **a4@<X8>)
{
  uint64_t (*v8)(uint64_t, uint64_t);
  OpaqueCMBlockBuffer *v9;
  OpaqueCMBlockBuffer *v10;
  int64_t DataLength;

  v8 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 8);
  v9 = (OpaqueCMBlockBuffer *)v8(a2, a3);
  v10 = (OpaqueCMBlockBuffer *)v8(a2, a3);
  DataLength = CMBlockBufferGetDataLength(v10);

  if (((unint64_t)a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if ((uint64_t)CMBlockBufferGetDataLength(v9) >= DataLength)
  {
    *a4 = v9;
    a4[1] = a1;
    a4[2] = (OpaqueCMBlockBuffer *)DataLength;
    return;
  }
  __break(1u);
}

int64_t CMBlockBufferProtocol.subscript.getter@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, OpaqueCMBlockBuffer **a3@<X8>)
{
  uint64_t (*v6)(uint64_t, uint64_t);
  OpaqueCMBlockBuffer *v7;
  OpaqueCMBlockBuffer *v8;
  int64_t DataLength;
  int64_t result;

  v6 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 8);
  v7 = (OpaqueCMBlockBuffer *)v6(a1, a2);
  v8 = (OpaqueCMBlockBuffer *)v6(a1, a2);
  DataLength = CMBlockBufferGetDataLength(v8);

  result = CMBlockBufferGetDataLength(v7);
  if (result < DataLength)
  {
    __break(1u);
  }
  else
  {
    *a3 = v7;
    a3[1] = 0;
    a3[2] = (OpaqueCMBlockBuffer *)DataLength;
  }
  return result;
}

uint64_t CustomAllocatorAllocateBlock(refcon:sizeInBytes:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;

  if (!a1)
    return 0;
  swift_unknownObjectRetain();
  swift_dynamicCast();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v6);
  if (!v5
    || (swift_retain(),
        v3 = v5(a2),
        outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?((uint64_t)v5),
        outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?((uint64_t)v5),
        !v3))
  {
    __break(1u);
    return 0;
  }
  return v3;
}

uint64_t CustomAllocatorFreeBlock(refcon:doomedMemoryBlock:sizeInBytes:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  if (result)
  {
    swift_unknownObjectRetain();
    swift_dynamicCast();
    swift_unknownObjectRelease();
    result = outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v5);
    if (v6)
    {
      swift_retain();
      v6(a2, a3);
      outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?((uint64_t)v6);
      return outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?((uint64_t)v6);
    }
  }
  return result;
}

void _CMBlockBufferInitTrampoline.init(capacity:flags:)(unint64_t subBlockCapacity, CMBlockBufferFlags *a2, uint64_t a3, uint64_t a4)
{
  CMBlockBufferFlags v6;
  OSStatus Empty;
  CMBlockBufferRef v8;
  id v9;
  CMBlockBufferRef v10[2];

  v10[1] = *(CMBlockBufferRef *)MEMORY[0x1E0C80C00];
  if (HIDWORD(subBlockCapacity))
    __break(1u);
  v6 = *a2;
  v10[0] = 0;
  Empty = CMBlockBufferCreateEmpty((CFAllocatorRef)*MEMORY[0x1E0C9AE00], subBlockCapacity, v6, v10);
  v8 = v10[0];
  if (Empty == noErr.getter())
  {
    if (v8)
      (*(void (**)(CMBlockBufferRef, uint64_t, uint64_t))(a4 + 8))(v8, a3, a4);
    else
      __break(1u);
  }
  else
  {
    v9 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v9, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], Empty, 0);
    swift_willThrow();

  }
}

void _CMBlockBufferInitTrampoline.init(buffer:allocator:flags:)(void *memoryBlock, uint64_t a2, CFAllocatorRef blockAllocator, CMBlockBufferFlags *a4, uint64_t a5, uint64_t a6)
{
  int64_t v7;
  CMBlockBufferFlags v8;

  if (memoryBlock)
    v7 = a2 - (_QWORD)memoryBlock;
  else
    v7 = 0;
  if (v7 < 0)
  {
    __break(1u);
  }
  else
  {
    v8 = *a4;
    _CMBlockBufferInitTrampoline.init(buffer:allocator:flags:)(0, v7, memoryBlock, a2, blockAllocator, &v8, a5, a6);
  }
}

void _CMBlockBufferInitTrampoline.init(buffer:allocator:flags:)(int64_t offsetToData, int64_t a2, void *memoryBlock, uint64_t a4, CFAllocatorRef blockAllocator, CMBlockBufferFlags *a6, uint64_t a7, uint64_t a8)
{
  int64_t v8;
  CMBlockBufferFlags v11;
  OSStatus v12;
  CMBlockBufferRef v13;
  void (*v14)(void);
  OpaqueCMBlockBuffer *v15;
  id v16;
  CMBlockBufferRef blockBufferOut[2];

  blockBufferOut[1] = *(CMBlockBufferRef *)MEMORY[0x1E0C80C00];
  v8 = a4 - (_QWORD)memoryBlock;
  if (!memoryBlock)
    v8 = 0;
  if (offsetToData < 0 || v8 < offsetToData)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (a2 < 0 || v8 < a2)
LABEL_13:
    __break(1u);
  v11 = *a6;
  blockBufferOut[0] = 0;
  v12 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], memoryBlock, v8, blockAllocator, 0, offsetToData, a2 - offsetToData, v11, blockBufferOut);
  v13 = blockBufferOut[0];
  if (v12 != noErr.getter())
  {
    v16 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v16, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v12, 0);
    swift_willThrow();

    goto LABEL_11;
  }
  if (v13)
  {
    v14 = *(void (**)(void))(a8 + 8);
    v15 = v13;
    v14();

LABEL_11:
    return;
  }
  __break(1u);
}

void _CMBlockBufferInitTrampoline.init(length:allocator:range:flags:)(size_t blockLength, CFAllocatorRef blockAllocator, size_t offsetToData, uint64_t a4, char a5, CMBlockBufferFlags *a6, uint64_t a7, uint64_t a8)
{
  size_t v9;
  CMBlockBufferFlags v11;
  size_t v12;
  OSStatus v13;
  CMBlockBufferRef v14;
  void (*v15)(void);
  OpaqueCMBlockBuffer *v16;
  id v17;
  CMBlockBufferRef blockBufferOut[2];

  v9 = offsetToData;
  blockBufferOut[1] = *(CMBlockBufferRef *)MEMORY[0x1E0C80C00];
  v11 = *a6;
  if ((a5 & 1) != 0)
    goto LABEL_5;
  v12 = a4 - offsetToData;
  if (__OFSUB__(a4, offsetToData))
  {
    __break(1u);
LABEL_5:
    v9 = 0;
    v12 = blockLength;
  }
  blockBufferOut[0] = 0;
  v13 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, blockLength, blockAllocator, 0, v9, v12, v11, blockBufferOut);
  v14 = blockBufferOut[0];
  if (v13 != noErr.getter())
  {
    v17 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v17, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v13, 0);
    swift_willThrow();

    goto LABEL_10;
  }
  if (v14)
  {
    v15 = *(void (**)(void))(a8 + 8);
    v16 = v14;
    v15();

LABEL_10:
    return;
  }
  __break(1u);
}

void *_CMBlockBufferInitTrampoline.init(buffer:deallocator:flags:)(void *result, uint64_t a2, uint64_t a3, uint64_t a4, CMBlockBufferFlags *a5, uint64_t a6, uint64_t a7)
{
  int64_t v10;
  CMBlockBufferFlags v11;

  if (result)
    v10 = a2 - (_QWORD)result;
  else
    v10 = 0;
  if (v10 < 0)
  {
    __break(1u);
  }
  else
  {
    v11 = *a5;
    return (void *)_CMBlockBufferInitTrampoline.init(buffer:deallocator:flags:)(0, v10, result, a2, a3, a4, &v11, a6, a7);
  }
  return result;
}

uint64_t _CMBlockBufferInitTrampoline.init(buffer:deallocator:flags:)(int64_t a1, int64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, CMBlockBufferFlags *a7, uint64_t a8, uint64_t a9)
{
  int64_t v9;
  CMBlockBufferFlags v12;
  size_t v13;
  OSStatus v14;
  CMBlockBufferRef v15;
  uint64_t result;
  void (*v17)(void);
  OpaqueCMBlockBuffer *v18;
  id v19;
  CMBlockBufferCustomBlockSource customBlockSource;
  CMBlockBufferRef blockBufferOut[2];

  blockBufferOut[1] = *(CMBlockBufferRef *)MEMORY[0x1E0C80C00];
  if (a3)
    v9 = a4 - (_QWORD)a3;
  else
    v9 = 0;
  if (a1 < 0 || v9 < a1)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a2 < 0 || v9 < a2)
LABEL_14:
    __break(1u);
  v12 = *a7;
  v13 = a2 - a1;
  blockBufferOut[0] = 0;
  swift_retain();
  customBlockSource.version = 0;
  customBlockSource.AllocateBlock = (void *(__cdecl *)(void *, size_t))@objc CustomAllocatorAllocateBlock(refcon:sizeInBytes:);
  customBlockSource.FreeBlock = (void (__cdecl *)(void *, void *, size_t))@objc CustomAllocatorFreeBlock(refcon:doomedMemoryBlock:sizeInBytes:);
  customBlockSource.refCon = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
  v14 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, v9, 0, &customBlockSource, a1, v13, v12, blockBufferOut);
  v15 = blockBufferOut[0];
  result = noErr.getter();
  if (v14 != (_DWORD)result)
  {
    v19 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v19, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v14, 0);
    swift_willThrow();

    return swift_release();
  }
  if (v15)
  {
    v17 = *(void (**)(void))(a9 + 8);
    v18 = v15;
    v17();

    return swift_release();
  }
  __break(1u);
  return result;
}

uint64_t _CMBlockBufferInitTrampoline.init(length:allocator:deallocator:range:flags:)(size_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, size_t a6, uint64_t a7, char a8, CMBlockBufferFlags *a9, uint64_t a10, uint64_t a11)
{
  CMBlockBufferFlags v12;
  size_t v13;
  size_t v14;
  OSStatus v15;
  CMBlockBufferRef v16;
  uint64_t result;
  void (*v18)(void);
  id v19;
  CMBlockBufferCustomBlockSource customBlockSource;
  CMBlockBufferRef blockBufferOut[2];

  blockBufferOut[1] = *(CMBlockBufferRef *)MEMORY[0x1E0C80C00];
  v12 = *a9;
  if ((a8 & 1) != 0)
    goto LABEL_5;
  v13 = a6;
  v14 = a7 - a6;
  if (__OFSUB__(a7, a6))
  {
    __break(1u);
LABEL_5:
    v13 = 0;
    v14 = a1;
  }
  blockBufferOut[0] = 0;
  swift_retain();
  swift_retain();
  customBlockSource.version = 0;
  customBlockSource.AllocateBlock = (void *(__cdecl *)(void *, size_t))@objc CustomAllocatorAllocateBlock(refcon:sizeInBytes:);
  customBlockSource.FreeBlock = (void (__cdecl *)(void *, void *, size_t))@objc CustomAllocatorFreeBlock(refcon:doomedMemoryBlock:sizeInBytes:);
  customBlockSource.refCon = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
  v15 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, a1, 0, &customBlockSource, v13, v14, v12, blockBufferOut);
  v16 = blockBufferOut[0];
  result = noErr.getter();
  if (v15 != (_DWORD)result)
  {
    v19 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v19, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v15, 0);
    swift_willThrow();
    goto LABEL_10;
  }
  if (v16)
  {
    v18 = *(void (**)(void))(a11 + 8);
    v16 = v16;
    v18();
LABEL_10:

    swift_release();
    return swift_release();
  }
  __break(1u);
  return result;
}

void _CMBlockBufferInitTrampoline.init<A>(bufferReference:flags:)(uint64_t a1, CMBlockBufferFlags *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (**a6)(uint64_t, uint64_t))
{
  CMBlockBufferFlags v9;
  int v10;
  void (*v11)(void);
  OpaqueCMBlockBuffer *v12;
  id v13;
  CMBlockBufferRef v14[2];

  v14[1] = *(CMBlockBufferRef *)MEMORY[0x1E0C80C00];
  v9 = *a2;
  v14[0] = 0;
  v10 = closure #1 in _CMBlockBufferInitTrampoline.init<A>(bufferReference:flags:)(a1, v9, v14, a3, a4, a5, a6);
  if (v10 == noErr.getter())
  {
    if (v14[0])
    {
      v11 = *(void (**)(void))(a5 + 8);
      v12 = v14[0];
      v11();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 8))(a1, a4);

    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    v13 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v13, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v10, 0);
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 8))(a1, a4);

  }
}

uint64_t closure #1 in _CMBlockBufferInitTrampoline.init<A>(bufferReference:flags:)(uint64_t a1, CMBlockBufferFlags a2, CMBlockBufferRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (**a7)(uint64_t, uint64_t))
{
  OpaqueCMBlockBuffer *v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  size_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;

  v11 = (OpaqueCMBlockBuffer *)a7[1](a5, (uint64_t)a7);
  v12 = a7[2];
  v13 = v12(a5, (uint64_t)a7);
  v14 = a7[3](a5, (uint64_t)a7);
  result = v12(a5, (uint64_t)a7);
  if (__OFSUB__(v14, result))
  {
    __break(1u);
  }
  else
  {
    v16 = CMBlockBufferCreateWithBufferReference((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v11, v13, v14 - result, a2, a3);

    return v16;
  }
  return result;
}

uint64_t CMBlockBufferProtocol.dataLength.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t result;

  v4 = (*(uint64_t (**)(void))(a2 + 24))();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  v6 = __OFSUB__(v4, v5);
  result = v4 - v5;
  if (v6)
    __break(1u);
  return result;
}

id one-time initialization function for structureAllocationFailed()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12700, 0);
  static CMBlockBufferRef.Error.structureAllocationFailed = (uint64_t)result;
  return result;
}

id static CMBlockBufferRef.Error.structureAllocationFailed.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for structureAllocationFailed, (id *)&static CMBlockBufferRef.Error.structureAllocationFailed);
}

id one-time initialization function for blockAllocationFailed()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12701, 0);
  static CMBlockBufferRef.Error.blockAllocationFailed = (uint64_t)result;
  return result;
}

id static CMBlockBufferRef.Error.blockAllocationFailed.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for blockAllocationFailed, (id *)&static CMBlockBufferRef.Error.blockAllocationFailed);
}

id one-time initialization function for badCustomBlockSource()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12702, 0);
  static CMBlockBufferRef.Error.badCustomBlockSource = (uint64_t)result;
  return result;
}

id static CMBlockBufferRef.Error.badCustomBlockSource.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for badCustomBlockSource, (id *)&static CMBlockBufferRef.Error.badCustomBlockSource);
}

id one-time initialization function for badOffsetParameter()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12703, 0);
  static CMBlockBufferRef.Error.badOffsetParameter = (uint64_t)result;
  return result;
}

id static CMBlockBufferRef.Error.badOffsetParameter.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for badOffsetParameter, (id *)&static CMBlockBufferRef.Error.badOffsetParameter);
}

id one-time initialization function for badLengthParameter()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12704, 0);
  static CMBlockBufferRef.Error.badLengthParameter = (uint64_t)result;
  return result;
}

id static CMBlockBufferRef.Error.badLengthParameter.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for badLengthParameter, (id *)&static CMBlockBufferRef.Error.badLengthParameter);
}

id one-time initialization function for badPointerParameter()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12705, 0);
  static CMBlockBufferRef.Error.badPointerParameter = (uint64_t)result;
  return result;
}

id static CMBlockBufferRef.Error.badPointerParameter.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for badPointerParameter, (id *)&static CMBlockBufferRef.Error.badPointerParameter);
}

id one-time initialization function for emptyBlockBuffer()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12706, 0);
  static CMBlockBufferRef.Error.emptyBlockBuffer = (uint64_t)result;
  return result;
}

id static CMBlockBufferRef.Error.emptyBlockBuffer.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for emptyBlockBuffer, (id *)&static CMBlockBufferRef.Error.emptyBlockBuffer);
}

id one-time initialization function for unallocatedBlock()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12707, 0);
  static CMBlockBufferRef.Error.unallocatedBlock = (uint64_t)result;
  return result;
}

id static CMBlockBufferRef.Error.unallocatedBlock.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for unallocatedBlock, (id *)&static CMBlockBufferRef.Error.unallocatedBlock);
}

id one-time initialization function for insufficientSpace()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  result = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], -12708, 0);
  static CMBlockBufferRef.Error.insufficientSpace = (uint64_t)result;
  return result;
}

id static CMBlockBufferRef.Error.insufficientSpace.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for insufficientSpace, (id *)&static CMBlockBufferRef.Error.insufficientSpace);
}

uint64_t CMBlockBufferRef.Flags.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t CMBlockBufferRef.Flags.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static CMBlockBufferRef.Flags.assureMemoryNow.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

void static CMBlockBufferRef.Flags.alwaysCopyData.getter(_DWORD *a1@<X8>)
{
  *a1 = 2;
}

void static CMBlockBufferRef.Flags.dontOptimizeDepth.getter(_DWORD *a1@<X8>)
{
  *a1 = 4;
}

void static CMBlockBufferRef.Flags.permitEmptyReference.getter(_DWORD *a1@<X8>)
{
  *a1 = 8;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance CMBlockBufferRef.Flags@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  return specialized SetAlgebra<>.init(arrayLiteral:)(a1, a2);
}

void CMBlockBufferProtocol.makeContiguous(allocator:flags:)(const __CFAllocator *a1, CMBlockBufferFlags *a2, uint64_t a3, uint64_t (**a4)(uint64_t, uint64_t))
{
  uint64_t v4;
  CMBlockBufferFlags v6;
  int v7;
  id v8;
  CMBlockBufferRef v9[2];

  v9[1] = *(CMBlockBufferRef *)MEMORY[0x1E0C80C00];
  v6 = *a2;
  v9[0] = 0;
  v7 = closure #1 in CMBlockBufferProtocol.makeContiguous(allocator:flags:)(v4, a1, v6, v9, a3, a4);
  if (v7 == noErr.getter())
  {
    if (v9[0])
      return;
    __break(1u);
  }
  v8 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  objc_msgSend(v8, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v7, 0);
  swift_willThrow();

}

uint64_t closure #1 in CMBlockBufferProtocol.makeContiguous(allocator:flags:)(uint64_t a1, const __CFAllocator *a2, CMBlockBufferFlags a3, CMBlockBufferRef *a4, uint64_t a5, uint64_t (**a6)(uint64_t, uint64_t))
{
  OpaqueCMBlockBuffer *v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  size_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t Contiguous;

  v11 = (OpaqueCMBlockBuffer *)a6[1](a5, (uint64_t)a6);
  v12 = a6[2];
  v13 = v12(a5, (uint64_t)a6);
  v14 = a6[3](a5, (uint64_t)a6);
  result = v12(a5, (uint64_t)a6);
  if (__OFSUB__(v14, result))
  {
    __break(1u);
  }
  else
  {
    Contiguous = CMBlockBufferCreateContiguous((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v11, a2, 0, v13, v14 - result, a3, a4);

    return Contiguous;
  }
  return result;
}

void CMBlockBufferProtocol.makeContiguous(allocator:deallocator:flags:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, CMBlockBufferFlags *a5, uint64_t a6, uint64_t (**a7)(uint64_t, uint64_t))
{
  uint64_t v7;
  CMBlockBufferFlags v10;
  int v11;
  id v12;
  CMBlockBufferCustomBlockSource v17;
  CMBlockBufferRef v18[2];

  v18[1] = *(CMBlockBufferRef *)MEMORY[0x1E0C80C00];
  v10 = *a5;
  v18[0] = 0;
  swift_retain();
  swift_retain();
  v17.version = 0;
  v17.AllocateBlock = (void *(__cdecl *)(void *, size_t))@objc CustomAllocatorAllocateBlock(refcon:sizeInBytes:);
  v17.FreeBlock = (void (__cdecl *)(void *, void *, size_t))@objc CustomAllocatorFreeBlock(refcon:doomedMemoryBlock:sizeInBytes:);
  v17.refCon = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
  v11 = closure #1 in CMBlockBufferProtocol.makeContiguous(allocator:deallocator:flags:)(v7, &v17, v10, v18, a6, a7);
  if (v11 == noErr.getter())
  {
    if (v18[0])
      return;
    __break(1u);
  }
  v12 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  objc_msgSend(v12, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v11, 0, a1, a2, a3, a4);
  swift_willThrow();

}

uint64_t closure #1 in CMBlockBufferProtocol.makeContiguous(allocator:deallocator:flags:)(uint64_t a1, const CMBlockBufferCustomBlockSource *a2, CMBlockBufferFlags a3, CMBlockBufferRef *a4, uint64_t a5, uint64_t (**a6)(uint64_t, uint64_t))
{
  OpaqueCMBlockBuffer *v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  size_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t Contiguous;

  v11 = (OpaqueCMBlockBuffer *)a6[1](a5, (uint64_t)a6);
  v12 = a6[2];
  v13 = v12(a5, (uint64_t)a6);
  v14 = a6[3](a5, (uint64_t)a6);
  result = v12(a5, (uint64_t)a6);
  if (__OFSUB__(v14, result))
  {
    __break(1u);
  }
  else
  {
    Contiguous = CMBlockBufferCreateContiguous((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v11, 0, a2, v13, v14 - result, a3, a4);

    return Contiguous;
  }
  return result;
}

uint64_t CMBlockBufferRef.append(length:allocator:range:flags:)(size_t blockLength, CFAllocatorRef blockAllocator, size_t offsetToData, uint64_t a4, char a5, CMBlockBufferFlags *a6)
{
  OpaqueCMBlockBuffer *v6;
  size_t v7;
  CMBlockBufferFlags v8;
  size_t v9;
  OSStatus appended;
  uint64_t result;
  id v12;

  v7 = offsetToData;
  v8 = *a6;
  if ((a5 & 1) != 0)
    goto LABEL_5;
  v9 = a4 - offsetToData;
  if (__OFSUB__(a4, offsetToData))
  {
    __break(1u);
LABEL_5:
    v7 = 0;
    v9 = blockLength;
  }
  appended = CMBlockBufferAppendMemoryBlock(v6, 0, blockLength, blockAllocator, 0, v7, v9, v8);
  result = noErr.getter();
  if (appended != (_DWORD)result)
  {
    v12 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v12, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], appended, 0);
    return swift_willThrow();
  }
  return result;
}

void *CMBlockBufferRef.append(buffer:allocator:flags:)(void *memoryBlock, uint64_t a2, CFAllocatorRef blockAllocator, CMBlockBufferFlags *a4)
{
  OpaqueCMBlockBuffer *v4;
  size_t v6;
  OSStatus appended;
  id v8;

  if (memoryBlock)
    v6 = a2 - (_QWORD)memoryBlock;
  else
    v6 = 0;
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    appended = CMBlockBufferAppendMemoryBlock(v4, memoryBlock, v6, blockAllocator, 0, 0, v6, *a4);
    memoryBlock = (void *)noErr.getter();
    if (appended != (_DWORD)memoryBlock)
    {
      v8 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
      objc_msgSend(v8, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], appended, 0);
      return (void *)swift_willThrow();
    }
  }
  return memoryBlock;
}

uint64_t CMBlockBufferRef.append(buffer:allocator:flags:)(uint64_t offsetToData, int64_t a2, void *memoryBlock, uint64_t a4, CFAllocatorRef blockAllocator, CMBlockBufferFlags *a6)
{
  OpaqueCMBlockBuffer *v6;
  int64_t v7;
  OSStatus appended;
  id v9;

  v7 = a4 - (_QWORD)memoryBlock;
  if (!memoryBlock)
    v7 = 0;
  if (offsetToData < 0 || v7 < offsetToData)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return offsetToData;
  }
  if (a2 < 0 || v7 < a2)
    goto LABEL_11;
  appended = CMBlockBufferAppendMemoryBlock(v6, memoryBlock, v7, blockAllocator, 0, offsetToData, a2 - offsetToData, *a6);
  offsetToData = noErr.getter();
  if (appended != (_DWORD)offsetToData)
  {
    v9 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v9, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], appended, 0);
    return swift_willThrow();
  }
  return offsetToData;
}

uint64_t CMBlockBufferRef.append(length:allocator:deallocator:range:flags:)(size_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, size_t a6, uint64_t a7, char a8, CMBlockBufferFlags *a9)
{
  OpaqueCMBlockBuffer *v9;
  CMBlockBufferFlags v11;
  size_t v12;
  size_t v13;
  OSStatus appended;
  uint64_t result;
  id v16;
  CMBlockBufferCustomBlockSource customBlockSource;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = *a9;
  if ((a8 & 1) != 0)
    goto LABEL_5;
  v12 = a6;
  v13 = a7 - a6;
  if (__OFSUB__(a7, a6))
  {
    __break(1u);
LABEL_5:
    v12 = 0;
    v13 = a1;
  }
  swift_retain();
  swift_retain();
  customBlockSource.version = 0;
  customBlockSource.AllocateBlock = (void *(__cdecl *)(void *, size_t))@objc CustomAllocatorAllocateBlock(refcon:sizeInBytes:);
  customBlockSource.FreeBlock = (void (__cdecl *)(void *, void *, size_t))@objc CustomAllocatorFreeBlock(refcon:doomedMemoryBlock:sizeInBytes:);
  customBlockSource.refCon = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
  appended = CMBlockBufferAppendMemoryBlock(v9, 0, a1, 0, &customBlockSource, v12, v13, v11);
  result = noErr.getter();
  if (appended != (_DWORD)result)
  {
    v16 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v16, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], appended, 0);
    return swift_willThrow();
  }
  return result;
}

void *CMBlockBufferRef.append(buffer:deallocator:flags:)(void *result, uint64_t a2, uint64_t a3, uint64_t a4, CMBlockBufferFlags *a5)
{
  int64_t v7;
  CMBlockBufferFlags v8;

  if (result)
    v7 = a2 - (_QWORD)result;
  else
    v7 = 0;
  if (v7 < 0)
  {
    __break(1u);
  }
  else
  {
    v8 = *a5;
    return (void *)CMBlockBufferRef.append(buffer:deallocator:flags:)(0, v7, result, a2, a3, a4, &v8);
  }
  return result;
}

uint64_t CMBlockBufferRef.append(buffer:deallocator:flags:)(int64_t a1, int64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, CMBlockBufferFlags *a7)
{
  OpaqueCMBlockBuffer *v7;
  int64_t v8;
  CMBlockBufferFlags v11;
  size_t v12;
  OSStatus appended;
  uint64_t result;
  id v15;
  CMBlockBufferCustomBlockSource customBlockSource;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
    v8 = a4 - (_QWORD)a3;
  else
    v8 = 0;
  if (a1 < 0 || v8 < a1)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (a2 < 0 || v8 < a2)
LABEL_12:
    __break(1u);
  v11 = *a7;
  v12 = a2 - a1;
  swift_retain();
  customBlockSource.version = 0;
  customBlockSource.AllocateBlock = (void *(__cdecl *)(void *, size_t))@objc CustomAllocatorAllocateBlock(refcon:sizeInBytes:);
  customBlockSource.FreeBlock = (void (__cdecl *)(void *, void *, size_t))@objc CustomAllocatorFreeBlock(refcon:doomedMemoryBlock:sizeInBytes:);
  customBlockSource.refCon = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
  appended = CMBlockBufferAppendMemoryBlock(v7, a3, v8, 0, &customBlockSource, a1, v12, v11);
  result = noErr.getter();
  if (appended != (_DWORD)result)
  {
    v15 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v15, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], appended, 0);
    return swift_willThrow();
  }
  return result;
}

uint64_t CMBlockBufferRef.append<A>(bufferReference:flags:)(uint64_t a1, CMBlockBufferFlags *a2, uint64_t a3, uint64_t (**a4)(uint64_t, uint64_t))
{
  OpaqueCMBlockBuffer *v4;
  int v5;
  uint64_t result;
  id v7;

  v5 = closure #1 in CMBlockBufferRef.append<A>(bufferReference:flags:)(v4, a1, *a2, a3, a4);
  result = noErr.getter();
  if (v5 != (_DWORD)result)
  {
    v7 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v7, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v5, 0);
    return swift_willThrow();
  }
  return result;
}

uint64_t closure #1 in CMBlockBufferRef.append<A>(bufferReference:flags:)(OpaqueCMBlockBuffer *a1, uint64_t a2, CMBlockBufferFlags a3, uint64_t a4, uint64_t (**a5)(uint64_t, uint64_t))
{
  OpaqueCMBlockBuffer *v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  size_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t appended;

  v9 = (OpaqueCMBlockBuffer *)a5[1](a4, (uint64_t)a5);
  v10 = a5[2];
  v11 = v10(a4, (uint64_t)a5);
  v12 = a5[3](a4, (uint64_t)a5);
  result = v10(a4, (uint64_t)a5);
  if (__OFSUB__(v12, result))
  {
    __break(1u);
  }
  else
  {
    appended = CMBlockBufferAppendBufferReference(a1, v9, v11, v12 - result, a3);

    return appended;
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMBlockBufferRef.assureBlockMemory()()
{
  OpaqueCMBlockBuffer *v0;
  OSStatus v1;
  id v2;

  v1 = CMBlockBufferAssureBlockMemory(v0);
  if (v1 != noErr.getter())
  {
    v2 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v2, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v1, 0);
    swift_willThrow();
  }
}

uint64_t CMBlockBufferProtocol.withContiguousStorage<A>(_:)(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (**a5)(uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void *v12;
  int v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  char *v21[2];

  v21[1] = *(char **)MEMORY[0x1E0C80C00];
  v9 = a5[3];
  v10 = v9(a3, (uint64_t)a5);
  v11 = a5[2];
  if (__OFSUB__(v10, v11(a3, (uint64_t)a5)))
  {
    __break(1u);
    goto LABEL_11;
  }
  v12 = (void *)swift_slowAlloc();
  v21[0] = 0;
  v13 = closure #1 in CMBlockBufferProtocol.withContiguousStorage<A>(_:)(v5, v12, v21, a3, a4, a5);
  if (v13 != noErr.getter())
  {
    v18 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v18, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v13, 0);
    swift_willThrow();
    return MEMORY[0x1BCCBA934](v12, -1, -1);
  }
  v14 = v21[0];
  v15 = v9(a3, (uint64_t)a5);
  v16 = v11(a3, (uint64_t)a5);
  if (__OFSUB__(v15, v16))
LABEL_11:
    __break(1u);
  if (v14)
    v17 = &v14[v15 - v16];
  else
    v17 = 0;
  a1(v14, v17);
  return MEMORY[0x1BCCBA934](v12, -1, -1);
}

uint64_t closure #1 in CMBlockBufferProtocol.withContiguousStorage<A>(_:)(uint64_t a1, void *a2, char **a3, uint64_t a4, uint64_t a5, uint64_t (**a6)(uint64_t, uint64_t))
{
  OpaqueCMBlockBuffer *v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  size_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;

  v10 = (OpaqueCMBlockBuffer *)a6[1](a4, (uint64_t)a6);
  v11 = a6[2];
  v12 = v11(a4, (uint64_t)a6);
  v13 = a6[3](a4, (uint64_t)a6);
  result = v11(a4, (uint64_t)a6);
  if (__OFSUB__(v13, result))
  {
    __break(1u);
  }
  else
  {
    v15 = CMBlockBufferAccessDataBytes(v10, v12, v13 - result, a2, a3);

    return v15;
  }
  return result;
}

uint64_t CMBlockBufferProtocol.dataBytes()(uint64_t a1, uint64_t (**a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  void (**v8)();
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  BOOL v13;
  uint64_t result;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void (*v22)(void *, _QWORD);
  _QWORD v23[2];
  uint64_t v24;

  v24 = type metadata accessor for Data.Deallocator();
  v6 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24);
  v8 = (void (**)())((char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = a2[3];
  v10 = v9(a1, (uint64_t)a2);
  v11 = a2[2];
  v12 = v11(a1, (uint64_t)a2);
  v13 = __OFSUB__(v10, v12);
  result = v10 - v12;
  if (v13)
  {
    __break(1u);
  }
  else
  {
    v23[1] = v3;
    v15 = (void *)swift_slowAlloc();
    v16 = closure #1 in CMBlockBufferProtocol.dataBytes()(v2, v15, a1, a2);
    if (v16 != noErr.getter())
    {
      v21 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
      objc_msgSend(v21, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v16, 0);
      swift_willThrow();
      return v2;
    }
    v17 = v9(a1, (uint64_t)a2);
    result = v11(a1, (uint64_t)a2);
    v18 = v17 - result;
    if (!__OFSUB__(v17, result))
    {
      *v8 = closure #2 in CMBlockBufferProtocol.dataBytes();
      v8[1] = 0;
      v19 = v24;
      (*(void (**)(void (**)(), _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E0CB00D8], v24);
      Data.Deallocator._deallocator.getter();
      if (v18)
      {
        type metadata accessor for __DataStorage();
        swift_allocObject();
        swift_retain();
        v20 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
        v2 = specialized Data._Representation.init(_:count:)(v20, v18);
        swift_release();
      }
      else
      {
        v22 = (void (*)(void *, _QWORD))Data.Deallocator._deallocator.getter();
        v22(v15, 0);
        swift_release();
        swift_release();
        v2 = 0;
      }
      (*(void (**)(void (**)(), uint64_t))(v6 + 8))(v8, v19);
      return v2;
    }
  }
  __break(1u);
  return result;
}

void closure #2 in CMBlockBufferProtocol.dataBytes()()
{
  JUMPOUT(0x1BCCBA934);
}

uint64_t CMBlockBufferProtocol.copyDataBytes(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t (**a4)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  int v18;
  uint64_t result;
  id v20;
  uint64_t v21;

  v5 = v4;
  v10 = *(_QWORD *)(a3 - 8);
  v11 = MEMORY[0x1E0C80A78](a1);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v11)
  {
    if (one-time initialization token for badPointerParameter == -1)
    {
LABEL_7:
      (id)static CMBlockBufferRef.Error.badPointerParameter;
      return swift_willThrow();
    }
LABEL_12:
    swift_once();
    goto LABEL_7;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v5, a3);
  v14 = a4[3](a3, (uint64_t)a4);
  v15 = a4[2](a3, (uint64_t)a4);
  v16 = __OFSUB__(v14, v15);
  v17 = v14 - v15;
  if (v16)
  {
    __break(1u);
    goto LABEL_11;
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, a3);
  if (a2 - (uint64_t)a1 < v17)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v18 = closure #1 in CMBlockBufferProtocol.dataBytes()(v5, a1, a3, a4);
  result = noErr.getter();
  if (v18 == (_DWORD)result)
    return result;
  v20 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  objc_msgSend(v20, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v18, 0);
  return swift_willThrow();
}

uint64_t closure #1 in CMBlockBufferProtocol.dataBytes()(uint64_t a1, void *a2, uint64_t a3, uint64_t (**a4)(uint64_t, uint64_t))
{
  OpaqueCMBlockBuffer *v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  size_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  v7 = (OpaqueCMBlockBuffer *)a4[1](a3, (uint64_t)a4);
  v8 = a4[2];
  v9 = v8(a3, (uint64_t)a4);
  v10 = a4[3](a3, (uint64_t)a4);
  result = v8(a3, (uint64_t)a4);
  if (__OFSUB__(v10, result))
  {
    __break(1u);
  }
  else
  {
    v12 = CMBlockBufferCopyDataBytes(v7, v9, v10 - result, a2);

    return v12;
  }
  return result;
}

uint64_t CMBlockBufferProtocol.replaceDataBytes(with:)(const void *a1, uint64_t a2, uint64_t a3, uint64_t (**a4)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  int v18;
  uint64_t result;
  id v20;
  uint64_t v21;

  v5 = v4;
  v10 = *(_QWORD *)(a3 - 8);
  v11 = MEMORY[0x1E0C80A78](a1);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v11)
  {
    if (one-time initialization token for badPointerParameter == -1)
    {
LABEL_7:
      (id)static CMBlockBufferRef.Error.badPointerParameter;
      return swift_willThrow();
    }
LABEL_12:
    swift_once();
    goto LABEL_7;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v5, a3);
  v14 = a4[3](a3, (uint64_t)a4);
  v15 = a4[2](a3, (uint64_t)a4);
  v16 = __OFSUB__(v14, v15);
  v17 = v14 - v15;
  if (v16)
  {
    __break(1u);
    goto LABEL_11;
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, a3);
  if (v17 < a2 - (uint64_t)a1)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v18 = closure #1 in CMBlockBufferProtocol.replaceDataBytes(with:)(a1, v5, a3, a4);
  result = noErr.getter();
  if (v18 == (_DWORD)result)
    return result;
  v20 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  objc_msgSend(v20, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v18, 0);
  return swift_willThrow();
}

uint64_t closure #1 in CMBlockBufferProtocol.replaceDataBytes(with:)(const void *a1, uint64_t a2, uint64_t a3, uint64_t (**a4)(uint64_t, uint64_t))
{
  OpaqueCMBlockBuffer *v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  size_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  v7 = (OpaqueCMBlockBuffer *)a4[1](a3, (uint64_t)a4);
  v8 = a4[2];
  v9 = v8(a3, (uint64_t)a4);
  v10 = a4[3](a3, (uint64_t)a4);
  result = v8(a3, (uint64_t)a4);
  if (__OFSUB__(v10, result))
  {
    __break(1u);
  }
  else
  {
    v12 = CMBlockBufferReplaceDataBytes(a1, v7, v9, v10 - result);

    return v12;
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMBlockBufferProtocol.fillDataBytes(with:)(Swift::UInt8 with)
{
  uint64_t v1;
  uint64_t (**v2)(uint64_t, uint64_t);
  uint64_t v3;
  int v4;
  id v5;

  v4 = closure #1 in CMBlockBufferProtocol.fillDataBytes(with:)(with, v3, v1, v2);
  if (v4 != noErr.getter())
  {
    v5 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v5, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], v4, 0);
    swift_willThrow();
  }
}

uint64_t closure #1 in CMBlockBufferProtocol.fillDataBytes(with:)(char a1, uint64_t a2, uint64_t a3, uint64_t (**a4)(uint64_t, uint64_t))
{
  OpaqueCMBlockBuffer *v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  size_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  v7 = (OpaqueCMBlockBuffer *)a4[1](a3, (uint64_t)a4);
  v8 = a4[2];
  v9 = v8(a3, (uint64_t)a4);
  v10 = a4[3](a3, (uint64_t)a4);
  result = v8(a3, (uint64_t)a4);
  if (__OFSUB__(v10, result))
  {
    __break(1u);
  }
  else
  {
    v12 = CMBlockBufferFillDataBytes(a1, v7, v9, v10 - result);

    return v12;
  }
  return result;
}

char *CMBlockBufferRef.withUnsafeMutableBytes<A>(atOffset:_:)(size_t offset, uint64_t (*a2)(char *, char *))
{
  OpaqueCMBlockBuffer *v2;
  OSStatus DataPointer;
  char *result;
  id v6;
  size_t lengthAtOffsetOut;
  char *dataPointerOut[2];

  dataPointerOut[1] = *(char **)MEMORY[0x1E0C80C00];
  lengthAtOffsetOut = 0;
  dataPointerOut[0] = 0;
  DataPointer = CMBlockBufferGetDataPointer(v2, offset, &lengthAtOffsetOut, 0, dataPointerOut);
  if (DataPointer == noErr.getter())
  {
    result = dataPointerOut[0];
    if (dataPointerOut[0])
      return (char *)a2(dataPointerOut[0], &dataPointerOut[0][lengthAtOffsetOut]);
    else
      __break(1u);
  }
  else
  {
    v6 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    objc_msgSend(v6, sel_initWithDomain_code_userInfo_, *MEMORY[0x1E0CB2F90], DataPointer, 0);
    return (char *)swift_willThrow();
  }
  return result;
}

uint64_t CMBlockBufferProtocol.isContiguous.getter(uint64_t a1, uint64_t a2)
{
  OpaqueCMBlockBuffer *v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  size_t v6;
  uint64_t v7;
  uint64_t result;
  int IsRangeContiguous;

  v4 = (OpaqueCMBlockBuffer *)(*(uint64_t (**)(void))(a2 + 8))();
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 16);
  v6 = v5(a1, a2);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2);
  result = v5(a1, a2);
  if (__OFSUB__(v7, result))
  {
    __break(1u);
  }
  else
  {
    IsRangeContiguous = CMBlockBufferIsRangeContiguous(v4, v6, v7 - result);

    return IsRangeContiguous != 0;
  }
  return result;
}

BOOL CMBlockBufferRef.isEmpty.getter()
{
  OpaqueCMBlockBuffer *v0;

  return CMBlockBufferIsEmpty(v0) != 0;
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

uint64_t specialized Data.InlineData.init(_:)(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t specialized Data._Representation.init(_:count:)(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;

  if (!a2)
  {
    swift_release();
    return 0;
  }
  if (a2 > 14)
  {
    if ((unint64_t)a2 < 0x7FFFFFFF)
      return a2 << 32;
    type metadata accessor for Data.RangeReference();
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = 0;
    *(_QWORD *)(v3 + 24) = a2;
    return v3;
  }
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    v4 = (_BYTE *)__DataStorage._bytes.getter();
    if (!v4)
    {
LABEL_10:
      v5 = __DataStorage._length.getter();
      if (v5 >= a2)
        v6 = a2;
      else
        v6 = v5;
      v7 = &v4[v6];
      if (v4)
        v8 = v7;
      else
        v8 = 0;
      v3 = specialized Data.InlineData.init(_:)(v4, v8);
      swift_release();
      return v3;
    }
    result = __DataStorage._offset.getter();
    if (!__OFSUB__(0, result))
    {
      v4 -= result;
      goto LABEL_10;
    }
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags;
  if (!lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMBlockBufferRef.Flags, &type metadata for CMBlockBufferRef.Flags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags;
  if (!lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMBlockBufferRef.Flags, &type metadata for CMBlockBufferRef.Flags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags;
  if (!lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMBlockBufferRef.Flags, &type metadata for CMBlockBufferRef.Flags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags;
  if (!lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags)
  {
    result = MEMORY[0x1BCCBA8B0](&protocol conformance descriptor for CMBlockBufferRef.Flags, &type metadata for CMBlockBufferRef.Flags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags);
  }
  return result;
}

uint64_t dispatch thunk of CMBlockBufferProtocol.owner.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of CMBlockBufferProtocol.startIndex.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of CMBlockBufferProtocol.endIndex.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

ValueMetadata *type metadata accessor for CMBlockBufferRef.Slice()
{
  return &type metadata for CMBlockBufferRef.Slice;
}

uint64_t dispatch thunk of _CMBlockBufferInitTrampoline.init(referencing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

ValueMetadata *type metadata accessor for CMBlockBufferRef.Error()
{
  return &type metadata for CMBlockBufferRef.Error;
}

ValueMetadata *type metadata accessor for CMBlockBufferRef.Flags()
{
  return &type metadata for CMBlockBufferRef.Flags;
}

_QWORD *destroy for CMBlockBufferRef.CustomAllocator(_QWORD *result)
{
  _QWORD *v1;

  v1 = result;
  if (*result)
    result = (_QWORD *)swift_release();
  if (v1[2])
    return (_QWORD *)swift_release();
  return result;
}

_QWORD *initializeWithCopy for CMBlockBufferRef.CustomAllocator(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (*a2)
  {
    v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  v5 = a2[2];
  if (v5)
  {
    v6 = a2[3];
    a1[2] = v5;
    a1[3] = v6;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  }
  return a1;
}

_QWORD *assignWithCopy for CMBlockBufferRef.CustomAllocator(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *a2;
  if (*a1)
  {
    if (v4)
    {
      v5 = a2[1];
      *a1 = v4;
      a1[1] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[1];
    *a1 = v4;
    a1[1] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  v7 = a2[2];
  if (!a1[2])
  {
    if (v7)
    {
      v9 = a2[3];
      a1[2] = v7;
      a1[3] = v9;
      swift_retain();
      return a1;
    }
LABEL_14:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    return a1;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  v8 = a2[3];
  a1[2] = v7;
  a1[3] = v8;
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

_QWORD *assignWithTake for CMBlockBufferRef.CustomAllocator(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *a2;
  if (*a1)
  {
    if (v4)
    {
      v5 = a2[1];
      *a1 = v4;
      a1[1] = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[1];
    *a1 = v4;
    a1[1] = v6;
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  v7 = a2[2];
  if (!a1[2])
  {
    if (v7)
    {
      v9 = a2[3];
      a1[2] = v7;
      a1[3] = v9;
      return a1;
    }
LABEL_14:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    return a1;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  v8 = a2[3];
  a1[2] = v7;
  a1[3] = v8;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CMBlockBufferRef.CustomAllocator(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CMBlockBufferRef.CustomAllocator(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

void *type metadata accessor for CMBlockBufferRef.CustomAllocator()
{
  return &unk_1E6F0FA30;
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return MEMORY[0x1E0CAE8A8]();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t Data.Deallocator._deallocator.getter()
{
  return MEMORY[0x1E0CB00B0]();
}

uint64_t type metadata accessor for Data.Deallocator()
{
  return MEMORY[0x1E0CB00E8]();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x1E0CB0140]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x1E0CB01F0]();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return MEMORY[0x1E0DEF0A0]();
}

uint64_t _CFObject.hash(into:)()
{
  return MEMORY[0x1E0DEF0A8]();
}

uint64_t _CFObject.hashValue.getter()
{
  return MEMORY[0x1E0DEF0B0]();
}

uint64_t noErr.getter()
{
  return MEMORY[0x1E0DEF3B8]();
}

uint64_t type metadata accessor for UnsafeMutableAudioBufferListPointer()
{
  return MEMORY[0x1E0DEEFD8]();
}

uint64_t UnsafeMutableAudioBufferListPointer.init(_:)()
{
  return MEMORY[0x1E0DEEFE0]();
}

uint64_t ManagedAudioChannelLayout.init(audioChannelLayoutPointer:deallocator:)()
{
  return MEMORY[0x1E0DEEFF0]();
}

uint64_t ManagedAudioChannelLayout.sizeInBytes.getter()
{
  return MEMORY[0x1E0DEEFF8]();
}

uint64_t ManagedAudioChannelLayout.withUnsafePointer<A>(_:)()
{
  return MEMORY[0x1E0DEF008]();
}

uint64_t type metadata accessor for ManagedAudioChannelLayout()
{
  return MEMORY[0x1E0DEF018]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x1E0CB17D8]();
}

uint64_t static Dictionary._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0CB17E8]();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0CB17F8]();
}

Swift::Void __swiftcall Dictionary.reserveCapacity(_:)(Swift::Int a1)
{
  MEMORY[0x1E0DE9E60](a1);
}

uint64_t Dictionary.Index.hash(into:)()
{
  return MEMORY[0x1E0DE9F00]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x1E0DEA1C0]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x1E0CB1940]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t String.init<A>(bytes:encoding:)()
{
  return MEMORY[0x1E0CB1998]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x1E0DEA758]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x1E0DEA800](a1._countAndFlagsBits, a1._object);
}

uint64_t Sequence.compactMap<A>(_:)()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t Sequence.lazy.getter()
{
  return MEMORY[0x1E0DEAAF8]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t dispatch thunk of RawRepresentable.init(rawValue:)()
{
  return MEMORY[0x1E0DEAC90]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1E0DEADA0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x1E0CB1AC0]();
}

uint64_t static Array._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0CB1AD0]();
}

uint64_t static Array._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0CB1AE0]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t Collection.first.getter()
{
  return MEMORY[0x1E0DEB620]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t type metadata accessor for AudioChannelLayout.UnsafePointer()
{
  return MEMORY[0x1E0DEF028]();
}

uint64_t AudioChannelLayout.UnsafePointer.init(_:)()
{
  return MEMORY[0x1E0DEF030]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t _HashTable.occupiedBucket(after:)()
{
  return MEMORY[0x1E0DEC070]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x1E0DEC2A8](a1);
}

uint64_t type metadata accessor for LazySequence()
{
  return MEMORY[0x1E0DEC310]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x1E0DEC670]();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
  MEMORY[0x1E0DEC680](a1);
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t ContiguousArray.append(_:)()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t ContiguousArray.init()()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t __CocoaDictionary.startIndex.getter()
{
  return MEMORY[0x1E0DECB38]();
}

uint64_t __CocoaDictionary.makeIterator()()
{
  return MEMORY[0x1E0DECB40]();
}

uint64_t __CocoaDictionary.Index.dictionary.getter()
{
  return MEMORY[0x1E0DECB50]();
}

uint64_t static __CocoaDictionary.Index.< infix(_:_:)()
{
  return MEMORY[0x1E0DECB60]();
}

uint64_t static __CocoaDictionary.Index.== infix(_:_:)()
{
  return MEMORY[0x1E0DECB68]();
}

uint64_t __CocoaDictionary.Index.age.getter()
{
  return MEMORY[0x1E0DECB70]();
}

uint64_t __CocoaDictionary.Index.key.getter()
{
  return MEMORY[0x1E0DECB78]();
}

uint64_t __CocoaDictionary.count.getter()
{
  return MEMORY[0x1E0DECB80]();
}

uint64_t __CocoaDictionary.index(after:)()
{
  return MEMORY[0x1E0DECB88]();
}

uint64_t __CocoaDictionary.lookup(_:)()
{
  return MEMORY[0x1E0DECBA0]();
}

{
  return MEMORY[0x1E0DECBA8]();
}

uint64_t __CocoaDictionary.Iterator.next()()
{
  return MEMORY[0x1E0DECBB8]();
}

uint64_t __CocoaDictionary.endIndex.getter()
{
  return MEMORY[0x1E0DECBD0]();
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

uint64_t static _DictionaryStorage.convert(_:capacity:)()
{
  return MEMORY[0x1E0DECD48]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t dispatch thunk of static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0DECEF0]();
}

uint64_t dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0DECEF8]();
}

uint64_t dispatch thunk of static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0DECF00]();
}

uint64_t dispatch thunk of _ObjectiveCBridgeable._bridgeToObjectiveC()()
{
  return MEMORY[0x1E0DECF08]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return MEMORY[0x1E0DED9F8]();
}

NSNumber __swiftcall Int8._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x1E0CB25F8]();
}

uint64_t static Int8._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB2610]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1E0DEDAE8]();
}

NSNumber __swiftcall UInt8._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x1E0CB26B8]();
}

uint64_t static UInt8._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB26D0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1E0DEDEF8]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x1E0DEDF10](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
  MEMORY[0x1E0DEDF18](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
  MEMORY[0x1E0DEDF28](*(_QWORD *)&a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
  MEMORY[0x1E0DEDF30](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1E0DEDF40]();
}

NSNumber __swiftcall UInt32._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x1E0CB26E8]();
}

uint64_t static UInt32._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0CB26F0]();
}

uint64_t static UInt32._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0CB26F8]();
}

uint64_t static UInt32._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB2700]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

OSStatus CMAudioFormatDescriptionCreate(CFAllocatorRef allocator, const AudioStreamBasicDescription *asbd, size_t layoutSize, const AudioChannelLayout *layout, size_t magicCookieSize, const void *magicCookie, CFDictionaryRef extensions, CMAudioFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9EA80](allocator, asbd, layoutSize, layout, magicCookieSize, magicCookie, extensions, formatDescriptionOut);
}

OSStatus CMAudioFormatDescriptionCreateSummary(CFAllocatorRef allocator, CFArrayRef formatDescriptionArray, uint32_t flags, CMAudioFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9EA88](allocator, formatDescriptionArray, *(_QWORD *)&flags, formatDescriptionOut);
}

Boolean CMAudioFormatDescriptionEqual(CMAudioFormatDescriptionRef formatDescription, CMAudioFormatDescriptionRef otherFormatDescription, CMAudioFormatDescriptionMask equalityMask, CMAudioFormatDescriptionMask *equalityMaskOut)
{
  return MEMORY[0x1E0C9EA90](formatDescription, otherFormatDescription, *(_QWORD *)&equalityMask, equalityMaskOut);
}

const AudioChannelLayout *__cdecl CMAudioFormatDescriptionGetChannelLayout(CMAudioFormatDescriptionRef desc, size_t *sizeOut)
{
  return (const AudioChannelLayout *)MEMORY[0x1E0C9EAA0](desc, sizeOut);
}

const AudioFormatListItem *__cdecl CMAudioFormatDescriptionGetFormatList(CMAudioFormatDescriptionRef desc, size_t *sizeOut)
{
  return (const AudioFormatListItem *)MEMORY[0x1E0C9EAA8](desc, sizeOut);
}

const void *__cdecl CMAudioFormatDescriptionGetMagicCookie(CMAudioFormatDescriptionRef desc, size_t *sizeOut)
{
  return (const void *)MEMORY[0x1E0C9EAB0](desc, sizeOut);
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return (const AudioStreamBasicDescription *)MEMORY[0x1E0C9EAD8](desc);
}

OSStatus CMAudioSampleBufferCreateWithPacketDescriptions(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMTime *presentationTimeStamp, const AudioStreamPacketDescription *packetDescriptions, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1E0C9EAE8](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, presentationTimeStamp);
}

OSStatus CMAudioSampleBufferCreateWithPacketDescriptionsAndMakeDataReadyHandler(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMTime *presentationTimeStamp, const AudioStreamPacketDescription *packetDescriptions, CMSampleBufferRef *sampleBufferOut, CMSampleBufferMakeDataReadyHandler makeDataReadyHandler)
{
  return MEMORY[0x1E0C9EAF0](allocator, dataBuffer, dataReady, formatDescription, numSamples, presentationTimeStamp, packetDescriptions, sampleBufferOut);
}

OSStatus CMBlockBufferAccessDataBytes(CMBlockBufferRef theBuffer, size_t offset, size_t length, void *temporaryBlock, char **returnedPointerOut)
{
  return MEMORY[0x1E0C9EB48](theBuffer, offset, length, temporaryBlock, returnedPointerOut);
}

OSStatus CMBlockBufferAppendBufferReference(CMBlockBufferRef theBuffer, CMBlockBufferRef targetBBuf, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags)
{
  return MEMORY[0x1E0C9EB50](theBuffer, targetBBuf, offsetToData, dataLength, *(_QWORD *)&flags);
}

OSStatus CMBlockBufferAppendMemoryBlock(CMBlockBufferRef theBuffer, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags)
{
  return MEMORY[0x1E0C9EB58](theBuffer, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags);
}

OSStatus CMBlockBufferAssureBlockMemory(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1E0C9EB60](theBuffer);
}

OSStatus CMBlockBufferCopyDataBytes(CMBlockBufferRef theSourceBuffer, size_t offsetToData, size_t dataLength, void *destination)
{
  return MEMORY[0x1E0C9EB68](theSourceBuffer, offsetToData, dataLength, destination);
}

OSStatus CMBlockBufferCreateContiguous(CFAllocatorRef structureAllocator, CMBlockBufferRef sourceBuffer, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EB70](structureAllocator, sourceBuffer, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateEmpty(CFAllocatorRef structureAllocator, uint32_t subBlockCapacity, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EB78](structureAllocator, *(_QWORD *)&subBlockCapacity, *(_QWORD *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithBufferReference(CFAllocatorRef structureAllocator, CMBlockBufferRef bufferReference, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EB80](structureAllocator, bufferReference, offsetToData, dataLength, *(_QWORD *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EB88](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags);
}

OSStatus CMBlockBufferFillDataBytes(char fillByte, CMBlockBufferRef destinationBuffer, size_t offsetIntoDestination, size_t dataLength)
{
  return MEMORY[0x1E0C9EB90](fillByte, destinationBuffer, offsetIntoDestination, dataLength);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1E0C9EB98](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x1E0C9EBA8](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

CFTypeID CMBlockBufferGetTypeID(void)
{
  return MEMORY[0x1E0C9EBB0]();
}

Boolean CMBlockBufferIsEmpty(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1E0C9EBB8](theBuffer);
}

Boolean CMBlockBufferIsRangeContiguous(CMBlockBufferRef theBuffer, size_t offset, size_t length)
{
  return MEMORY[0x1E0C9EBC0](theBuffer, offset, length);
}

OSStatus CMBlockBufferReplaceDataBytes(const void *sourceBytes, CMBlockBufferRef destinationBuffer, size_t offsetIntoDestination, size_t dataLength)
{
  return MEMORY[0x1E0C9EBC8](sourceBytes, destinationBuffer, offsetIntoDestination, dataLength);
}

OSStatus CMBufferQueueCallForEachBuffer(CMBufferQueueRef queue, OSStatus (__cdecl *callback)(CMBufferRef, void *), void *refcon)
{
  return MEMORY[0x1E0C9EBD0](queue, callback, refcon);
}

Boolean CMBufferQueueContainsEndOfData(CMBufferQueueRef queue)
{
  return MEMORY[0x1E0C9EBD8](queue);
}

CMBufferRef CMBufferQueueCopyHead(CMBufferQueueRef queue)
{
  return (CMBufferRef)MEMORY[0x1E0C9EBE0](queue);
}

OSStatus CMBufferQueueCreateWithHandlers(CFAllocatorRef allocator, CMItemCount capacity, const CMBufferHandlers *handlers, CMBufferQueueRef *queueOut)
{
  return MEMORY[0x1E0C9EBF0](allocator, capacity, handlers, queueOut);
}

CMBufferRef CMBufferQueueDequeueAndRetain(CMBufferQueueRef queue)
{
  return (CMBufferRef)MEMORY[0x1E0C9EBF8](queue);
}

CMBufferRef CMBufferQueueDequeueIfDataReadyAndRetain(CMBufferQueueRef queue)
{
  return (CMBufferRef)MEMORY[0x1E0C9EC00](queue);
}

OSStatus CMBufferQueueEnqueue(CMBufferQueueRef queue, CMBufferRef buf)
{
  return MEMORY[0x1E0C9EC08](queue, buf);
}

CMItemCount CMBufferQueueGetBufferCount(CMBufferQueueRef queue)
{
  return MEMORY[0x1E0C9EC10](queue);
}

size_t CMBufferQueueGetTotalSize(CMBufferQueueRef queue)
{
  return MEMORY[0x1E0C9EC68](queue);
}

CFTypeID CMBufferQueueGetTypeID(void)
{
  return MEMORY[0x1E0C9EC70]();
}

OSStatus CMBufferQueueInstallTriggerHandler(CMBufferQueueRef queue, CMBufferQueueTriggerCondition condition, CMTime *time, CMBufferQueueTriggerToken *triggerTokenOut, CMBufferQueueTriggerHandler handler)
{
  return MEMORY[0x1E0C9EC80](queue, *(_QWORD *)&condition, time, triggerTokenOut, handler);
}

OSStatus CMBufferQueueInstallTriggerHandlerWithIntegerThreshold(CMBufferQueueRef queue, CMBufferQueueTriggerCondition condition, CMItemCount threshold, CMBufferQueueTriggerToken *triggerTokenOut, CMBufferQueueTriggerHandler handler)
{
  return MEMORY[0x1E0C9EC88](queue, *(_QWORD *)&condition, threshold, triggerTokenOut, handler);
}

Boolean CMBufferQueueIsAtEndOfData(CMBufferQueueRef queue)
{
  return MEMORY[0x1E0C9EC98](queue);
}

Boolean CMBufferQueueIsEmpty(CMBufferQueueRef queue)
{
  return MEMORY[0x1E0C9ECA0](queue);
}

OSStatus CMBufferQueueRemoveTrigger(CMBufferQueueRef queue, CMBufferQueueTriggerToken triggerToken)
{
  return MEMORY[0x1E0C9ECB0](queue, triggerToken);
}

OSStatus CMBufferQueueResetWithCallback(CMBufferQueueRef queue, void (__cdecl *callback)(CMBufferRef, void *), void *refcon)
{
  return MEMORY[0x1E0C9ECC0](queue, callback, refcon);
}

OSStatus CMBufferQueueSetValidationHandler(CMBufferQueueRef queue, CMBufferValidationHandler handler)
{
  return MEMORY[0x1E0C9ECD0](queue, handler);
}

Boolean CMBufferQueueTestTrigger(CMBufferQueueRef queue, CMBufferQueueTriggerToken triggerToken)
{
  return MEMORY[0x1E0C9ECD8](queue, triggerToken);
}

uint64_t CMClockConvertHostTimeToSystemUnits(CMTime *hostTime)
{
  return MEMORY[0x1E0C9ED30](hostTime);
}

OSStatus CMClockGetAnchorTime(CMClockRef clock, CMTime *clockTimeOut, CMTime *referenceClockTimeOut)
{
  return MEMORY[0x1E0C9ED38](clock, clockTimeOut, referenceClockTimeOut);
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x1E0C9ED40]();
}

CFTypeID CMClockGetTypeID(void)
{
  return MEMORY[0x1E0C9ED50]();
}

void CMClockInvalidate(CMClockRef clock)
{
  MEMORY[0x1E0C9ED58](clock);
}

CMTime *__cdecl CMClockMakeHostTimeFromSystemUnits(CMTime *__return_ptr retstr, uint64_t hostTime)
{
  return (CMTime *)MEMORY[0x1E0C9ED60](retstr, hostTime);
}

Boolean CMClockMightDrift(CMClockRef clock, CMClockRef otherClock)
{
  return MEMORY[0x1E0C9ED68](clock, otherClock);
}

CFDictionaryRef CMCopyDictionaryOfAttachments(CFAllocatorRef allocator, CMAttachmentBearerRef target, CMAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9ED80](allocator, target, *(_QWORD *)&attachmentMode);
}

OSStatus CMFormatDescriptionCreate(CFAllocatorRef allocator, CMMediaType mediaType, FourCharCode mediaSubType, CFDictionaryRef extensions, CMFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9EDB0](allocator, *(_QWORD *)&mediaType, *(_QWORD *)&mediaSubType, extensions, formatDescriptionOut);
}

Boolean CMFormatDescriptionEqual(CMFormatDescriptionRef formatDescription, CMFormatDescriptionRef otherFormatDescription)
{
  return MEMORY[0x1E0C9EDB8](formatDescription, otherFormatDescription);
}

Boolean CMFormatDescriptionEqualIgnoringExtensionKeys(CMFormatDescriptionRef formatDescription, CMFormatDescriptionRef otherFormatDescription, CFTypeRef formatDescriptionExtensionKeysToIgnore, CFTypeRef sampleDescriptionExtensionAtomKeysToIgnore)
{
  return MEMORY[0x1E0C9EDC0](formatDescription, otherFormatDescription, formatDescriptionExtensionKeysToIgnore, sampleDescriptionExtensionAtomKeysToIgnore);
}

CFDictionaryRef CMFormatDescriptionGetExtensions(CMFormatDescriptionRef desc)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9EDD0](desc);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1E0C9EDD8](desc);
}

CMMediaType CMFormatDescriptionGetMediaType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1E0C9EDE0](desc);
}

CFTypeID CMFormatDescriptionGetTypeID(void)
{
  return MEMORY[0x1E0C9EDE8]();
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x1E0C9EE00](target, key, attachmentModeOut);
}

OSStatus CMMetadataFormatDescriptionCreateByMergingMetadataFormatDescriptions(CFAllocatorRef allocator, CMMetadataFormatDescriptionRef sourceDescription, CMMetadataFormatDescriptionRef otherSourceDescription, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9EE70](allocator, sourceDescription, otherSourceDescription, formatDescriptionOut);
}

OSStatus CMMetadataFormatDescriptionCreateWithKeys(CFAllocatorRef allocator, CMMetadataFormatType metadataType, CFArrayRef keys, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9EE80](allocator, *(_QWORD *)&metadataType, keys, formatDescriptionOut);
}

OSStatus CMMetadataFormatDescriptionCreateWithMetadataFormatDescriptionAndMetadataSpecifications(CFAllocatorRef allocator, CMMetadataFormatDescriptionRef sourceDescription, CFArrayRef metadataSpecifications, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9EE88](allocator, sourceDescription, metadataSpecifications, formatDescriptionOut);
}

CFArrayRef CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormatDescriptionRef desc)
{
  return (CFArrayRef)MEMORY[0x1E0C9EE98](desc);
}

CFDictionaryRef CMMetadataFormatDescriptionGetKeyWithLocalID(CMMetadataFormatDescriptionRef desc, OSType localKeyID)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9EEA0](desc, *(_QWORD *)&localKeyID);
}

OSStatus CMMuxedFormatDescriptionCreate(CFAllocatorRef allocator, CMMuxedStreamType muxType, CFDictionaryRef extensions, CMMuxedFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9EEA8](allocator, *(_QWORD *)&muxType, extensions, formatDescriptionOut);
}

void CMPropagateAttachments(CMAttachmentBearerRef source, CMAttachmentBearerRef destination)
{
  MEMORY[0x1E0C9EF08](source, destination);
}

void CMRemoveAllAttachments(CMAttachmentBearerRef target)
{
  MEMORY[0x1E0C9EF10](target);
}

void CMRemoveAttachment(CMAttachmentBearerRef target, CFStringRef key)
{
  MEMORY[0x1E0C9EF18](target, key);
}

OSStatus CMSampleBufferCallBlockForEachSample(CMSampleBufferRef sbuf, void *handler)
{
  return MEMORY[0x1E0C9EF20](sbuf, handler);
}

OSStatus CMSampleBufferCopyPCMDataIntoAudioBufferList(CMSampleBufferRef sbuf, int32_t frameOffset, int32_t numFrames, AudioBufferList *bufferList)
{
  return MEMORY[0x1E0C9EF30](sbuf, *(_QWORD *)&frameOffset, *(_QWORD *)&numFrames, bufferList);
}

OSStatus CMSampleBufferCopySampleBufferForRange(CFAllocatorRef allocator, CMSampleBufferRef sbuf, CFRange sampleRange, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1E0C9EF38](allocator, sbuf, sampleRange.location, sampleRange.length, sampleBufferOut);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1E0C9EF40](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

OSStatus CMSampleBufferCreateCopy(CFAllocatorRef allocator, CMSampleBufferRef sbuf, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1E0C9EF48](allocator, sbuf, sampleBufferOut);
}

OSStatus CMSampleBufferCreateCopyWithNewTiming(CFAllocatorRef allocator, CMSampleBufferRef originalSBuf, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1E0C9EF50](allocator, originalSBuf, numSampleTimingEntries, sampleTimingArray, sampleBufferOut);
}

OSStatus CMSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1E0C9EF58](allocator, imageBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, sampleTiming, sampleBufferOut);
}

OSStatus CMSampleBufferCreateForImageBufferWithMakeDataReadyHandler(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut, CMSampleBufferMakeDataReadyHandler makeDataReadyHandler)
{
  return MEMORY[0x1E0C9EF60](allocator, imageBuffer, dataReady, formatDescription, sampleTiming, sampleBufferOut, makeDataReadyHandler);
}

OSStatus CMSampleBufferCreateForTaggedBufferGroup(CFAllocatorRef allocator, CMTaggedBufferGroupRef taggedBufferGroup, CMTime *sbufPTS, CMTime *sbufDuration, CMTaggedBufferGroupFormatDescriptionRef formatDescription, CMSampleBufferRef *sBufOut)
{
  return MEMORY[0x1E0C9EF68](allocator, taggedBufferGroup, sbufPTS, sbufDuration, formatDescription, sBufOut);
}

OSStatus CMSampleBufferCreateWithMakeDataReadyHandler(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut, CMSampleBufferMakeDataReadyHandler makeDataReadyHandler)
{
  return MEMORY[0x1E0C9EF88](allocator, dataBuffer, dataReady, formatDescription, numSamples, numSampleTimingEntries, sampleTimingArray, numSampleSizeEntries);
}

Boolean CMSampleBufferDataIsReady(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1E0C9EF90](sbuf);
}

OSStatus CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(CMSampleBufferRef sbuf, size_t *bufferListSizeNeededOut, AudioBufferList *bufferListOut, size_t bufferListSize, CFAllocatorRef blockBufferStructureAllocator, CFAllocatorRef blockBufferBlockAllocator, uint32_t flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EF98](sbuf, bufferListSizeNeededOut, bufferListOut, bufferListSize, blockBufferStructureAllocator, blockBufferBlockAllocator, *(_QWORD *)&flags, blockBufferOut);
}

OSStatus CMSampleBufferGetAudioStreamPacketDescriptions(CMSampleBufferRef sbuf, size_t packetDescriptionsSize, AudioStreamPacketDescription *packetDescriptionsOut, size_t *packetDescriptionsSizeNeededOut)
{
  return MEMORY[0x1E0C9EFA0](sbuf, packetDescriptionsSize, packetDescriptionsOut, packetDescriptionsSizeNeededOut);
}

OSStatus CMSampleBufferGetAudioStreamPacketDescriptionsPtr(CMSampleBufferRef sbuf, const AudioStreamPacketDescription **packetDescriptionsPointerOut, size_t *packetDescriptionsSizeOut)
{
  return MEMORY[0x1E0C9EFA8](sbuf, packetDescriptionsPointerOut, packetDescriptionsSizeOut);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x1E0C9EFB0](sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x1E0C9EFD0](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1E0C9EFD8](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1E0C9EFE0](sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x1E0C9F010](sbuf, createIfNecessary);
}

size_t CMSampleBufferGetSampleSize(CMSampleBufferRef sbuf, CMItemIndex sampleIndex)
{
  return MEMORY[0x1E0C9F018](sbuf, sampleIndex);
}

OSStatus CMSampleBufferGetSampleSizeArray(CMSampleBufferRef sbuf, CMItemCount sizeArrayEntries, size_t *sizeArrayOut, CMItemCount *sizeArrayEntriesNeededOut)
{
  return MEMORY[0x1E0C9F020](sbuf, sizeArrayEntries, sizeArrayOut, sizeArrayEntriesNeededOut);
}

OSStatus CMSampleBufferGetSampleTimingInfo(CMSampleBufferRef sbuf, CMItemIndex sampleIndex, CMSampleTimingInfo *timingInfoOut)
{
  return MEMORY[0x1E0C9F028](sbuf, sampleIndex, timingInfoOut);
}

CMTaggedBufferGroupRef CMSampleBufferGetTaggedBufferGroup(CMSampleBufferRef sbuf)
{
  return (CMTaggedBufferGroupRef)MEMORY[0x1E0C9F038](sbuf);
}

size_t CMSampleBufferGetTotalSampleSize(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1E0C9F040](sbuf);
}

CFTypeID CMSampleBufferGetTypeID(void)
{
  return MEMORY[0x1E0C9F048]();
}

Boolean CMSampleBufferHasDataFailed(CMSampleBufferRef sbuf, OSStatus *statusOut)
{
  return MEMORY[0x1E0C9F050](sbuf, statusOut);
}

OSStatus CMSampleBufferInvalidate(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1E0C9F058](sbuf);
}

Boolean CMSampleBufferIsValid(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1E0C9F060](sbuf);
}

OSStatus CMSampleBufferMakeDataReady(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1E0C9F068](sbuf);
}

OSStatus CMSampleBufferSetDataBufferFromAudioBufferList(CMSampleBufferRef sbuf, CFAllocatorRef blockBufferStructureAllocator, CFAllocatorRef blockBufferBlockAllocator, uint32_t flags, const AudioBufferList *bufferList)
{
  return MEMORY[0x1E0C9F078](sbuf, blockBufferStructureAllocator, blockBufferBlockAllocator, *(_QWORD *)&flags, bufferList);
}

OSStatus CMSampleBufferSetDataFailed(CMSampleBufferRef sbuf, OSStatus status)
{
  return MEMORY[0x1E0C9F080](sbuf, *(_QWORD *)&status);
}

OSStatus CMSampleBufferSetDataReady(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1E0C9F088](sbuf);
}

OSStatus CMSampleBufferSetInvalidateHandler(CMSampleBufferRef sbuf, CMSampleBufferInvalidateHandler invalidateHandler)
{
  return MEMORY[0x1E0C9F0A0](sbuf, invalidateHandler);
}

OSStatus CMSampleBufferSetOutputPresentationTimeStamp(CMSampleBufferRef sbuf, CMTime *outputPresentationTimeStamp)
{
  return MEMORY[0x1E0C9F0A8](sbuf, outputPresentationTimeStamp);
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
  MEMORY[0x1E0C9F0C8](target, key, value, *(_QWORD *)&attachmentMode);
}

void CMSetAttachments(CMAttachmentBearerRef target, CFDictionaryRef theAttachments, CMAttachmentMode attachmentMode)
{
  MEMORY[0x1E0C9F0D0](target, theAttachments, *(_QWORD *)&attachmentMode);
}

OSStatus CMSimpleQueueCreate(CFAllocatorRef allocator, int32_t capacity, CMSimpleQueueRef *queueOut)
{
  return MEMORY[0x1E0C9F0E0](allocator, *(_QWORD *)&capacity, queueOut);
}

const void *__cdecl CMSimpleQueueDequeue(CMSimpleQueueRef queue)
{
  return (const void *)MEMORY[0x1E0C9F0E8](queue);
}

OSStatus CMSimpleQueueEnqueue(CMSimpleQueueRef queue, const void *element)
{
  return MEMORY[0x1E0C9F0F0](queue, element);
}

int32_t CMSimpleQueueGetCapacity(CMSimpleQueueRef queue)
{
  return MEMORY[0x1E0C9F0F8](queue);
}

int32_t CMSimpleQueueGetCount(CMSimpleQueueRef queue)
{
  return MEMORY[0x1E0C9F100](queue);
}

const void *__cdecl CMSimpleQueueGetHead(CMSimpleQueueRef queue)
{
  return (const void *)MEMORY[0x1E0C9F108](queue);
}

CFTypeID CMSimpleQueueGetTypeID(void)
{
  return MEMORY[0x1E0C9F110]();
}

OSStatus CMSimpleQueueReset(CMSimpleQueueRef queue)
{
  return MEMORY[0x1E0C9F118](queue);
}

CMTime *__cdecl CMSyncConvertTime(CMTime *__return_ptr retstr, CMTime *time, CMClockOrTimebaseRef fromClockOrTimebase, CMClockOrTimebaseRef toClockOrTimebase)
{
  return (CMTime *)MEMORY[0x1E0C9F130](retstr, time, fromClockOrTimebase, toClockOrTimebase);
}

Float64 CMSyncGetRelativeRate(CMClockOrTimebaseRef ofClockOrTimebase, CMClockOrTimebaseRef relativeToClockOrTimebase)
{
  Float64 result;

  MEMORY[0x1E0C9F138](ofClockOrTimebase, relativeToClockOrTimebase);
  return result;
}

OSStatus CMSyncGetRelativeRateAndAnchorTime(CMClockOrTimebaseRef ofClockOrTimebase, CMClockOrTimebaseRef relativeToClockOrTimebase, Float64 *outRelativeRate, CMTime *outOfClockOrTimebaseAnchorTime, CMTime *outRelativeToClockOrTimebaseAnchorTime)
{
  return MEMORY[0x1E0C9F140](ofClockOrTimebase, relativeToClockOrTimebase, outRelativeRate, outOfClockOrTimebaseAnchorTime, outRelativeToClockOrTimebaseAnchorTime);
}

Boolean CMSyncMightDrift(CMClockOrTimebaseRef clockOrTimebase1, CMClockOrTimebaseRef clockOrTimebase2)
{
  return MEMORY[0x1E0C9F150](clockOrTimebase1, clockOrTimebase2);
}

OSStatus CMTagCollectionCreate(CFAllocatorRef allocator, const CMTag *tags, CMItemCount tagCount, CMTagCollectionRef *newCollectionOut)
{
  return MEMORY[0x1E0C9F178](allocator, tags, tagCount, newCollectionOut);
}

CMItemCount CMTagCollectionGetCount(CMTagCollectionRef tagCollection)
{
  return MEMORY[0x1E0C9F190](tagCollection);
}

OSStatus CMTagCollectionGetTags(CMTagCollectionRef tagCollection, CMTag *tagBuffer, CMItemCount tagBufferCount, CMItemCount *numberOfTagsCopied)
{
  return MEMORY[0x1E0C9F198](tagCollection, tagBuffer, tagBufferCount, numberOfTagsCopied);
}

CFStringRef CMTagCopyDescription(CFAllocatorRef allocator, CMTag tag)
{
  return (CFStringRef)MEMORY[0x1E0C9F1C0](allocator, *(_QWORD *)&tag.category, tag.value);
}

Boolean CMTagEqualToTag(CMTag tag1, CMTag tag2)
{
  return MEMORY[0x1E0C9F1C8](*(_QWORD *)&tag1.category, tag1.value, *(_QWORD *)&tag2.category, tag2.value);
}

uint64_t CMTagGetFlagsValue(CMTag tag)
{
  return MEMORY[0x1E0C9F1D0](*(_QWORD *)&tag.category, tag.value);
}

Float64 CMTagGetFloat64Value(CMTag tag)
{
  Float64 result;

  MEMORY[0x1E0C9F1D8](*(_QWORD *)&tag.category, tag.value);
  return result;
}

OSType CMTagGetOSTypeValue(CMTag tag)
{
  return MEMORY[0x1E0C9F1E0](*(_QWORD *)&tag.category, tag.value);
}

int64_t CMTagGetSInt64Value(CMTag tag)
{
  return MEMORY[0x1E0C9F1E8](*(_QWORD *)&tag.category, tag.value);
}

CMTagDataType CMTagGetValueDataType(CMTag tag)
{
  return MEMORY[0x1E0C9F1F0](*(_QWORD *)&tag.category, tag.value);
}

CMTag CMTagMakeWithFlagsValue(CMTagCategory category, uint64_t flagsForTag)
{
  uint64_t v2;
  CMTagValue v3;
  CMTag result;

  v2 = MEMORY[0x1E0C9F1F8](*(_QWORD *)&category, flagsForTag);
  result.value = v3;
  result.category = v2;
  result.dataType = HIDWORD(v2);
  return result;
}

CMTag CMTagMakeWithFloat64Value(CMTagCategory category, Float64 value)
{
  uint64_t v2;
  CMTagValue v3;
  CMTag result;

  v2 = MEMORY[0x1E0C9F200](*(_QWORD *)&category, value);
  result.value = v3;
  result.category = v2;
  result.dataType = HIDWORD(v2);
  return result;
}

CMTag CMTagMakeWithOSTypeValue(CMTagCategory category, OSType value)
{
  uint64_t v2;
  CMTagValue v3;
  CMTag result;

  v2 = MEMORY[0x1E0C9F208](*(_QWORD *)&category, *(_QWORD *)&value);
  result.value = v3;
  result.category = v2;
  result.dataType = HIDWORD(v2);
  return result;
}

CMTag CMTagMakeWithSInt64Value(CMTagCategory category, int64_t value)
{
  uint64_t v2;
  CMTagValue v3;
  CMTag result;

  v2 = MEMORY[0x1E0C9F210](*(_QWORD *)&category, value);
  result.value = v3;
  result.category = v2;
  result.dataType = HIDWORD(v2);
  return result;
}

OSStatus CMTaggedBufferGroupCreate(CFAllocatorRef allocator, CFArrayRef tagCollections, CFArrayRef buffers, CMTaggedBufferGroupRef *groupOut)
{
  return MEMORY[0x1E0C9F218](allocator, tagCollections, buffers, groupOut);
}

OSStatus CMTaggedBufferGroupFormatDescriptionCreateForTaggedBufferGroup(CFAllocatorRef allocator, CMTaggedBufferGroupRef taggedBufferGroup, CMTaggedBufferGroupFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9F220](allocator, taggedBufferGroup, formatDescriptionOut);
}

Boolean CMTaggedBufferGroupFormatDescriptionMatchesTaggedBufferGroup(CMTaggedBufferGroupFormatDescriptionRef desc, CMTaggedBufferGroupRef taggedBufferGroup)
{
  return MEMORY[0x1E0C9F228](desc, taggedBufferGroup);
}

CMSampleBufferRef CMTaggedBufferGroupGetCMSampleBufferAtIndex(CMTaggedBufferGroupRef group, CFIndex index)
{
  return (CMSampleBufferRef)MEMORY[0x1E0C9F230](group, index);
}

CVPixelBufferRef CMTaggedBufferGroupGetCVPixelBufferAtIndex(CMTaggedBufferGroupRef group, CFIndex index)
{
  return (CVPixelBufferRef)MEMORY[0x1E0C9F238](group, index);
}

CMItemCount CMTaggedBufferGroupGetCount(CMTaggedBufferGroupRef group)
{
  return MEMORY[0x1E0C9F248](group);
}

CMTagCollectionRef CMTaggedBufferGroupGetTagCollectionAtIndex(CMTaggedBufferGroupRef group, CFIndex index)
{
  return (CMTagCollectionRef)MEMORY[0x1E0C9F250](group, index);
}

OSStatus CMTextFormatDescriptionGetDefaultStyle(CMFormatDescriptionRef desc, uint16_t *localFontIDOut, Boolean *boldOut, Boolean *italicOut, Boolean *underlineOut, CGFloat *fontSizeOut, CGFloat *colorComponentsOut)
{
  return MEMORY[0x1E0C9F268](desc, localFontIDOut, boldOut, italicOut, underlineOut, fontSizeOut, colorComponentsOut);
}

OSStatus CMTextFormatDescriptionGetDefaultTextBox(CMFormatDescriptionRef desc, Boolean originIsAtTopLeft, CGFloat heightOfTextTrack, CGRect *defaultTextBoxOut)
{
  return MEMORY[0x1E0C9F270](desc, originIsAtTopLeft, defaultTextBoxOut, heightOfTextTrack);
}

OSStatus CMTextFormatDescriptionGetDisplayFlags(CMFormatDescriptionRef desc, CMTextDisplayFlags *displayFlagsOut)
{
  return MEMORY[0x1E0C9F278](desc, displayFlagsOut);
}

OSStatus CMTextFormatDescriptionGetFontName(CMFormatDescriptionRef desc, uint16_t localFontID, CFStringRef *fontNameOut)
{
  return MEMORY[0x1E0C9F280](desc, localFontID, fontNameOut);
}

OSStatus CMTextFormatDescriptionGetJustification(CMFormatDescriptionRef desc, CMTextJustificationValue *horizontaJustificationlOut, CMTextJustificationValue *verticalJustificationOut)
{
  return MEMORY[0x1E0C9F288](desc, horizontaJustificationlOut, verticalJustificationOut);
}

CMTime *__cdecl CMTimeAbsoluteValue(CMTime *__return_ptr retstr, CMTime *time)
{
  return (CMTime *)MEMORY[0x1E0C9F290](retstr, time);
}

OSStatus CMTimeCodeFormatDescriptionCreate(CFAllocatorRef allocator, CMTimeCodeFormatType timeCodeFormatType, CMTime *frameDuration, uint32_t frameQuanta, uint32_t flags, CFDictionaryRef extensions, CMTimeCodeFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9F2B0](allocator, *(_QWORD *)&timeCodeFormatType, frameDuration, *(_QWORD *)&frameQuanta, *(_QWORD *)&flags, extensions, formatDescriptionOut);
}

CMTime *__cdecl CMTimeCodeFormatDescriptionGetFrameDuration(CMTime *__return_ptr retstr, CMTimeCodeFormatDescriptionRef timeCodeFormatDescription)
{
  return (CMTime *)MEMORY[0x1E0C9F2C0](retstr, timeCodeFormatDescription);
}

uint32_t CMTimeCodeFormatDescriptionGetFrameQuanta(CMTimeCodeFormatDescriptionRef timeCodeFormatDescription)
{
  return MEMORY[0x1E0C9F2C8](timeCodeFormatDescription);
}

uint32_t CMTimeCodeFormatDescriptionGetTimeCodeFlags(CMTimeCodeFormatDescriptionRef desc)
{
  return MEMORY[0x1E0C9F2D0](desc);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1E0C9F2D8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1E0C9F2E0](retstr, time, *(_QWORD *)&newTimescale, *(_QWORD *)&method);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1E0C9F3A0](range, time);
}

Boolean CMTimeRangeContainsTimeRange(CMTimeRange *range, CMTimeRange *otherRange)
{
  return MEMORY[0x1E0C9F3A8](range, otherRange);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x1E0C9F3C0](range1, range2);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3C8](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1E0C9F3D0](retstr, range);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F400](retstr, lhs, rhs);
}

OSStatus CMTimebaseAddTimer(CMTimebaseRef timebase, CFRunLoopTimerRef timer, CFRunLoopRef runloop)
{
  return MEMORY[0x1E0C9F410](timebase, timer, runloop);
}

CMClockOrTimebaseRef CMTimebaseCopySource(CMTimebaseRef timebase)
{
  return (CMClockOrTimebaseRef)MEMORY[0x1E0C9F420](timebase);
}

CMClockRef CMTimebaseCopySourceClock(CMTimebaseRef timebase)
{
  return (CMClockRef)MEMORY[0x1E0C9F428](timebase);
}

CMTimebaseRef CMTimebaseCopySourceTimebase(CMTimebaseRef timebase)
{
  return (CMTimebaseRef)MEMORY[0x1E0C9F430](timebase);
}

CMClockRef CMTimebaseCopyUltimateSourceClock(CMTimebaseRef timebase)
{
  return (CMClockRef)MEMORY[0x1E0C9F438](timebase);
}

Float64 CMTimebaseGetEffectiveRate(CMTimebaseRef timebase)
{
  Float64 result;

  MEMORY[0x1E0C9F460](timebase);
  return result;
}

Float64 CMTimebaseGetRate(CMTimebaseRef timebase)
{
  Float64 result;

  MEMORY[0x1E0C9F468](timebase);
  return result;
}

OSStatus CMTimebaseGetTimeAndRate(CMTimebaseRef timebase, CMTime *timeOut, Float64 *rateOut)
{
  return MEMORY[0x1E0C9F478](timebase, timeOut, rateOut);
}

CMTime *__cdecl CMTimebaseGetTimeWithTimeScale(CMTime *__return_ptr retstr, CMTimebaseRef timebase, CMTimeScale timescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1E0C9F490](retstr, timebase, *(_QWORD *)&timescale, *(_QWORD *)&method);
}

CFTypeID CMTimebaseGetTypeID(void)
{
  return MEMORY[0x1E0C9F498]();
}

OSStatus CMTimebaseNotificationBarrier(CMTimebaseRef timebase)
{
  return MEMORY[0x1E0C9F4A0](timebase);
}

OSStatus CMTimebaseSetAnchorTime(CMTimebaseRef timebase, CMTime *timebaseTime, CMTime *immediateSourceTime)
{
  return MEMORY[0x1E0C9F4B8](timebase, timebaseTime, immediateSourceTime);
}

OSStatus CMTimebaseSetRate(CMTimebaseRef timebase, Float64 rate)
{
  return MEMORY[0x1E0C9F4C0](timebase, rate);
}

OSStatus CMTimebaseSetRateAndAnchorTime(CMTimebaseRef timebase, Float64 rate, CMTime *timebaseTime, CMTime *immediateSourceTime)
{
  return MEMORY[0x1E0C9F4C8](timebase, timebaseTime, immediateSourceTime, rate);
}

OSStatus CMTimebaseSetSourceClock(CMTimebaseRef timebase, CMClockRef newSourceClock)
{
  return MEMORY[0x1E0C9F4D8](timebase, newSourceClock);
}

OSStatus CMTimebaseSetSourceTimebase(CMTimebaseRef timebase, CMTimebaseRef newSourceTimebase)
{
  return MEMORY[0x1E0C9F4E0](timebase, newSourceTimebase);
}

OSStatus CMTimebaseSetTime(CMTimebaseRef timebase, CMTime *time)
{
  return MEMORY[0x1E0C9F4E8](timebase, time);
}

OSStatus CMTimebaseSetTimerDispatchSourceNextFireTime(CMTimebaseRef timebase, dispatch_source_t timerSource, CMTime *fireTime, uint32_t flags)
{
  return MEMORY[0x1E0C9F4F0](timebase, timerSource, fireTime, *(_QWORD *)&flags);
}

OSStatus CMTimebaseSetTimerNextFireTime(CMTimebaseRef timebase, CFRunLoopTimerRef timer, CMTime *fireTime, uint32_t flags)
{
  return MEMORY[0x1E0C9F500](timebase, timer, fireTime, *(_QWORD *)&flags);
}

OSStatus CMVideoFormatDescriptionCopyTagCollectionArray(CMVideoFormatDescriptionRef formatDescription, CFArrayRef *tagCollectionsOut)
{
  return MEMORY[0x1E0C9F518](formatDescription, tagCollectionsOut);
}

OSStatus CMVideoFormatDescriptionCreate(CFAllocatorRef allocator, CMVideoCodecType codecType, int32_t width, int32_t height, CFDictionaryRef extensions, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9F520](allocator, *(_QWORD *)&codecType, *(_QWORD *)&width, *(_QWORD *)&height, extensions, formatDescriptionOut);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9F528](allocator, imageBuffer, formatDescriptionOut);
}

OSStatus CMVideoFormatDescriptionCreateFromH264ParameterSets(CFAllocatorRef allocator, size_t parameterSetCount, const uint8_t *const *parameterSetPointers, const size_t *parameterSetSizes, int NALUnitHeaderLength, CMFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9F540](allocator, parameterSetCount, parameterSetPointers, parameterSetSizes, *(_QWORD *)&NALUnitHeaderLength, formatDescriptionOut);
}

OSStatus CMVideoFormatDescriptionCreateFromHEVCParameterSets(CFAllocatorRef allocator, size_t parameterSetCount, const uint8_t *const *parameterSetPointers, const size_t *parameterSetSizes, int NALUnitHeaderLength, CFDictionaryRef extensions, CMFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9F548](allocator, parameterSetCount, parameterSetPointers, parameterSetSizes, *(_QWORD *)&NALUnitHeaderLength, extensions, formatDescriptionOut);
}

CGRect CMVideoFormatDescriptionGetCleanAperture(CMVideoFormatDescriptionRef videoDesc, Boolean originIsAtTopLeft)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9F550](videoDesc, originIsAtTopLeft);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1E0C9F558](videoDesc);
}

CFArrayRef CMVideoFormatDescriptionGetExtensionKeysCommonWithImageBuffers(void)
{
  return (CFArrayRef)MEMORY[0x1E0C9F560]();
}

OSStatus CMVideoFormatDescriptionGetH264ParameterSetAtIndex(CMFormatDescriptionRef videoDesc, size_t parameterSetIndex, const uint8_t **parameterSetPointerOut, size_t *parameterSetSizeOut, size_t *parameterSetCountOut, int *NALUnitHeaderLengthOut)
{
  return MEMORY[0x1E0C9F568](videoDesc, parameterSetIndex, parameterSetPointerOut, parameterSetSizeOut, parameterSetCountOut, NALUnitHeaderLengthOut);
}

OSStatus CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(CMFormatDescriptionRef videoDesc, size_t parameterSetIndex, const uint8_t **parameterSetPointerOut, size_t *parameterSetSizeOut, size_t *parameterSetCountOut, int *NALUnitHeaderLengthOut)
{
  return MEMORY[0x1E0C9F570](videoDesc, parameterSetIndex, parameterSetPointerOut, parameterSetSizeOut, parameterSetCountOut, NALUnitHeaderLengthOut);
}

CGSize CMVideoFormatDescriptionGetPresentationDimensions(CMVideoFormatDescriptionRef videoDesc, Boolean usePixelAspectRatio, Boolean useCleanAperture)
{
  double v3;
  double v4;
  CGSize result;

  MEMORY[0x1E0C9F580](videoDesc, usePixelAspectRatio, useCleanAperture);
  result.height = v4;
  result.width = v3;
  return result;
}

Boolean CMVideoFormatDescriptionMatchesImageBuffer(CMVideoFormatDescriptionRef desc, CVImageBufferRef imageBuffer)
{
  return MEMORY[0x1E0C9F590](desc, imageBuffer);
}

uint64_t FigVideoFormatDescriptionVisitAllParameterSets()
{
  return MEMORY[0x1E0CA1A70]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int isprint(int _c)
{
  return MEMORY[0x1E0C839B0](*(_QWORD *)&_c);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1E0DEEBB0]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x1E0DEEBD8]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
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

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

