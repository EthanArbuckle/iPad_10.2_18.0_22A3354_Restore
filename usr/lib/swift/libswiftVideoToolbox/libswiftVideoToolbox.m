void type metadata accessor for VTHDRPerFrameMetadataGenerationSessionRef(uint64_t a1)
{
  type metadata accessor for VTHDRPerFrameMetadataGenerationSessionRef(a1, &lazy cache variable for type metadata for VTHDRPerFrameMetadataGenerationSessionRef);
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
  type metadata accessor for VTHDRPerFrameMetadataGenerationSessionRef(a1, &lazy cache variable for type metadata for CMTime);
}

void type metadata accessor for CVBufferRef(uint64_t a1)
{
  type metadata accessor for VTHDRPerFrameMetadataGenerationSessionRef(a1, &lazy cache variable for type metadata for CVBufferRef);
}

void type metadata accessor for VTDecodeInfoFlags(uint64_t a1)
{
  type metadata accessor for VTHDRPerFrameMetadataGenerationSessionRef(a1, &lazy cache variable for type metadata for VTDecodeInfoFlags);
}

void type metadata accessor for CFStringRef(uint64_t a1)
{
  type metadata accessor for VTHDRPerFrameMetadataGenerationSessionRef(a1, &lazy cache variable for type metadata for CFStringRef);
}

void type metadata accessor for CMTimeFlags(uint64_t a1)
{
  type metadata accessor for VTHDRPerFrameMetadataGenerationSessionRef(a1, &lazy cache variable for type metadata for CMTimeFlags);
}

void type metadata accessor for VTHDRPerFrameMetadataGenerationSessionRef(uint64_t a1, unint64_t *a2)
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

uint64_t VTHDRPerFrameMetadataGenerationSession.HDRFormat.init(rawValue:)@<X0>(uint64_t result@<X0>, BOOL *a2@<X8>)
{
  *a2 = result != 1;
  return result;
}

uint64_t VTHDRPerFrameMetadataGenerationSession.HDRFormat.rawValue.getter()
{
  return 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance VTHDRPerFrameMetadataGenerationSession.HDRFormat()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance VTHDRPerFrameMetadataGenerationSession.HDRFormat()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(1uLL);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance VTHDRPerFrameMetadataGenerationSession.HDRFormat()
{
  Hasher._combine(_:)(1uLL);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance VTHDRPerFrameMetadataGenerationSession.HDRFormat()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(1uLL);
  return Hasher._finalize()();
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance VTHDRPerFrameMetadataGenerationSession.HDRFormat@<X0>(_QWORD *result@<X0>, BOOL *a2@<X8>)
{
  *a2 = *result != 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance VTHDRPerFrameMetadataGenerationSession.HDRFormat(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

uint64_t VTHDRPerFrameMetadataGenerationSession.__allocating_init(framesPerSecond:hdrFormats:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  VTHDRPerFrameMetadataGenerationSession.init(framesPerSecond:hdrFormats:)(a1);
  return v2;
}

uint64_t VTHDRPerFrameMetadataGenerationSession.init(framesPerSecond:hdrFormats:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t inited;
  uint64_t v4;
  uint64_t v5;
  NSDictionary v6;
  int v7;
  uint64_t result;
  id v9;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_24BC588B0;
      *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
      *(_QWORD *)(inited + 40) = v4;
      v5 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay12VideoToolbox38VTHDRPerFrameMetadataGenerationSessionC9HDRFormatOG_So11CFStringRefas5NeverOTg504_s12d9Toolbox38fghij41C15framesPerSecond10hdrFormatsACSf_SayAC9k13OGSgtKcfcSo11L58RefaAGcfu_33_5961501e9edfb3cfd98a851c77177f48AgKTf3nnnpk_nTf1cn_n(a1);
      swift_bridgeObjectRelease();
      *(_QWORD *)(inited + 72) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef]);
      *(_QWORD *)(inited + 48) = v5;
      specialized Dictionary.init(dictionaryLiteral:)(inited);
      swift_bridgeObjectRetain();
      v6.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      v6.super.isa = 0;
    }
  }
  else
  {
    v6.super.isa = 0;
  }
  v7 = VTHDRPerFrameMetadataGenerationSessionCreate();

  result = noErr.getter();
  if (v7 == (_DWORD)result)
  {
    __break(1u);
  }
  else
  {
    v9 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    objc_msgSend(v9, sel_initWithDomain_code_userInfo_, *MEMORY[0x24BDD1100], v7, 0);
    swift_willThrow();

    swift_bridgeObjectRelease();
    type metadata accessor for VTHDRPerFrameMetadataGenerationSession();
    swift_deallocPartialClassInstance();
    return v1;
  }
  return result;
}

uint64_t type metadata accessor for VTHDRPerFrameMetadataGenerationSession()
{
  return objc_opt_self();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD2E914]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay12VideoToolbox38VTHDRPerFrameMetadataGenerationSessionC9HDRFormatOG_So11CFStringRefas5NeverOTg504_s12d9Toolbox38fghij41C15framesPerSecond10hdrFormatsACSf_SayAC9k13OGSgtKcfcSo11L58RefaAGcfu_33_5961501e9edfb3cfd98a851c77177f48AgKTf3nnnpk_nTf1cn_n(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v3 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray.reserveCapacity(_:)();
    do
    {
      MEMORY[0x24BD2E728](0x73695679626C6F44, 0xEB000000006E6F69);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      --v1;
    }
    while (v1);
    return v3;
  }
  return result;
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
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
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
    outlined init with copy of (String, Any)(v6, (uint64_t)&v15);
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

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> VTHDRPerFrameMetadataGenerationSession.attachMetadata(to:sceneChange:)(CVBufferRef to, Swift::Bool sceneChange)
{
  int v2;
  id v3;

  v2 = VTHDRPerFrameMetadataGenerationSessionAttachMetadata();
  if (v2 != noErr.getter())
  {
    v3 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    objc_msgSend(v3, sel_initWithDomain_code_userInfo_, *MEMORY[0x24BDD1100], v2, 0);
    swift_willThrow();
  }
}

uint64_t VTHDRPerFrameMetadataGenerationSession.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t VTHDRPerFrameMetadataGenerationSession.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

unint64_t lazy protocol witness table accessor for type VTHDRPerFrameMetadataGenerationSession.HDRFormat and conformance VTHDRPerFrameMetadataGenerationSession.HDRFormat()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VTHDRPerFrameMetadataGenerationSession.HDRFormat and conformance VTHDRPerFrameMetadataGenerationSession.HDRFormat;
  if (!lazy protocol witness table cache variable for type VTHDRPerFrameMetadataGenerationSession.HDRFormat and conformance VTHDRPerFrameMetadataGenerationSession.HDRFormat)
  {
    result = MEMORY[0x24BD2E920](&protocol conformance descriptor for VTHDRPerFrameMetadataGenerationSession.HDRFormat, &type metadata for VTHDRPerFrameMetadataGenerationSession.HDRFormat);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VTHDRPerFrameMetadataGenerationSession.HDRFormat and conformance VTHDRPerFrameMetadataGenerationSession.HDRFormat);
  }
  return result;
}

uint64_t method lookup function for VTHDRPerFrameMetadataGenerationSession()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of VTHDRPerFrameMetadataGenerationSession.__allocating_init(framesPerSecond:hdrFormats:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of VTHDRPerFrameMetadataGenerationSession.attachMetadata(to:sceneChange:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t getEnumTagSinglePayload for VTHDRPerFrameMetadataGenerationSession.HDRFormat(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for VTHDRPerFrameMetadataGenerationSession.HDRFormat(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24BC57EF0 + 4 * byte_24BC588C0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24BC57F10 + 4 * byte_24BC588C5[v4]))();
}

_BYTE *sub_24BC57EF0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24BC57F10(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24BC57F18(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24BC57F20(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24BC57F28(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24BC57F30(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t getEnumTag for VTHDRPerFrameMetadataGenerationSession.HDRFormat()
{
  return 0;
}

ValueMetadata *type metadata accessor for VTHDRPerFrameMetadataGenerationSession.HDRFormat()
{
  return &type metadata for VTHDRPerFrameMetadataGenerationSession.HDRFormat;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;

  Hasher.init(_seed:)();
  String.hash(into:)();
  v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

uint64_t outlined init with copy of (String, Any)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
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

uint64_t VTDecompressionSessionCreate(allocator:formatDescription:decoderSpecification:imageBufferAttributes:decompressionSessionOut:)(const __CFAllocator *a1, const opaqueCMFormatDescription *a2, const __CFDictionary *a3, const __CFDictionary *a4, VTDecompressionSessionRef *decompressionSessionOut)
{
  return VTDecompressionSessionCreate(a1, a2, a3, a4, 0, decompressionSessionOut);
}

uint64_t VTDecompressionSessionDecodeFrame(_:sampleBuffer:flags:infoFlagsOut:completionHandler:)(OpaqueVTDecompressionSession *a1, opaqueCMSampleBuffer *a2, VTDecodeFrameFlags a3, VTDecodeInfoFlags *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[6];

  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a5;
  *(_QWORD *)(v12 + 24) = a6;
  v16[4] = partial apply for intermediateOutputHandler2 #1 @Sendable (_:_:_:_:_:_:) in VTDecompressionSessionDecodeFrame(_:sampleBuffer:flags:infoFlagsOut:completionHandler:);
  v16[5] = v12;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 1107296256;
  v16[2] = thunk for @escaping @callee_guaranteed @Sendable (@unowned Int32, @unowned VTDecodeInfoFlags, @guaranteed CVBufferRef?, @guaranteed CMTaggedBufferGroupRef?, @unowned CMTime, @unowned CMTime) -> ();
  v16[3] = &block_descriptor;
  v13 = _Block_copy(v16);
  swift_retain();
  swift_release();
  v14 = VTDecompressionSessionDecodeFrameWithMultiImageCapableOutputHandler(a1, a2, a3, a4, v13);
  _Block_release(v13);
  return v14;
}

uint64_t intermediateOutputHandler2 #1 @Sendable (_:_:_:_:_:_:) in VTDecompressionSessionDecodeFrame(_:sampleBuffer:flags:infoFlagsOut:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void (*a11)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v16;
  id v17;

  v16 = 0;
  if (noErr.getter() == (_DWORD)a1 && a4)
  {
    v17 = a4;
    v16 = Array<A>.init(taggedBufferGroup:)();
  }
  a11(a1, a2, a3, v16, a5, a6, a7, a8, a9, a10);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24BC58294()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for intermediateOutputHandler2 #1 @Sendable (_:_:_:_:_:_:) in VTDecompressionSessionDecodeFrame(_:sampleBuffer:flags:infoFlagsOut:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;

  return intermediateOutputHandler2 #1 @Sendable (_:_:_:_:_:_:) in VTDecompressionSessionDecodeFrame(_:sampleBuffer:flags:infoFlagsOut:completionHandler:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 16));
}

void thunk for @escaping @callee_guaranteed @Sendable (@unowned Int32, @unowned VTDecodeInfoFlags, @guaranteed CVBufferRef?, @guaranteed CMTaggedBufferGroupRef?, @unowned CMTime, @unowned CMTime) -> ()(uint64_t a1, uint64_t a2, unsigned int a3, void *a4, void *a5, uint64_t *a6, uint64_t *a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, _QWORD, void *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v10 = a6[2];
  v16 = a6[1];
  v17 = *a6;
  v12 = *a7;
  v11 = a7[1];
  v13 = a7[2];
  v14 = *(void (**)(uint64_t, _QWORD, void *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v18 = a4;
  v15 = a5;
  v14(a2, a3, a4, a5, v17, v16, v10, v12, v11, v13);
  swift_release();

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

uint64_t VTCompressionSessionEncodeMultiImageFrame(_:taggedBuffers:presentationTimeStamp:duration:frameProperties:infoFlagsOut:outputHandler:)(OpaqueVTCompressionSession *a1, uint64_t a2, CMTimeValue a3, unint64_t a4, CMTimeEpoch a5, CMTimeValue a6, unint64_t a7, CMTimeEpoch a8, const __CFDictionary *a9, VTEncodeInfoFlags *a10, uint64_t a11, uint64_t a12)
{
  CMTimeScale v12;
  CMTimeScale v15;
  unint64_t v17;
  OpaqueCMTaggedBufferGroup *v18;
  void *v19;
  uint64_t v20;
  unint64_t v23;
  CMTime duration;
  CMTime aBlock;
  void *v27;
  uint64_t v28;
  uint64_t v29;

  if (!*(_QWORD *)(a2 + 16))
    return 4294954394;
  v12 = a7;
  v15 = a4;
  v23 = HIDWORD(a7);
  v17 = HIDWORD(a4);
  v18 = (OpaqueCMTaggedBufferGroup *)Array<A>.taggedBufferGroup.getter();
  v28 = a11;
  v29 = a12;
  aBlock.value = MEMORY[0x24BDAC760];
  *(_QWORD *)&aBlock.timescale = 1107296256;
  aBlock.epoch = (CMTimeEpoch)thunk for @escaping @callee_guaranteed @Sendable (@unowned Int32, @unowned VTEncodeInfoFlags, @guaranteed CMSampleBufferRef?) -> ();
  v27 = &block_descriptor_0;
  v19 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  aBlock.timescale = v15;
  aBlock.flags = v17;
  aBlock.epoch = a5;
  duration.value = a6;
  duration.timescale = v12;
  duration.flags = v23;
  duration.epoch = a8;
  aBlock.value = a3;
  v20 = VTCompressionSessionEncodeMultiImageFrameWithOutputHandler(a1, v18, &aBlock, &duration, a9, a10, v19);
  _Block_release(v19);

  return v20;
}

void thunk for @escaping @callee_guaranteed @Sendable (@unowned Int32, @unowned VTEncodeInfoFlags, @guaranteed CMSampleBufferRef?) -> ()(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void (*v7)(uint64_t, uint64_t, void *);
  id v8;

  v7 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  swift_retain();
  v8 = a4;
  v7(a2, a3, a4);
  swift_release();

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

uint64_t noErr.getter()
{
  return MEMORY[0x24BEE5370]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t Array<A>.init(taggedBufferGroup:)()
{
  return MEMORY[0x24BEE51D0]();
}

uint64_t Array<A>.taggedBufferGroup.getter()
{
  return MEMORY[0x24BEE51D8]();
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

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
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

OSStatus VTCompressionSessionEncodeMultiImageFrameWithOutputHandler(VTCompressionSessionRef session, CMTaggedBufferGroupRef taggedBufferGroup, CMTime *presentationTimeStamp, CMTime *duration, CFDictionaryRef frameProperties, VTEncodeInfoFlags *infoFlagsOut, VTCompressionOutputHandler outputHandler)
{
  return MEMORY[0x24BDF8FF8](session, taggedBufferGroup, presentationTimeStamp, duration, frameProperties, infoFlagsOut, outputHandler);
}

OSStatus VTDecompressionSessionCreate(CFAllocatorRef allocator, CMVideoFormatDescriptionRef videoFormatDescription, CFDictionaryRef videoDecoderSpecification, CFDictionaryRef destinationImageBufferAttributes, const VTDecompressionOutputCallbackRecord *outputCallback, VTDecompressionSessionRef *decompressionSessionOut)
{
  return MEMORY[0x24BDF9060](allocator, videoFormatDescription, videoDecoderSpecification, destinationImageBufferAttributes, outputCallback, decompressionSessionOut);
}

OSStatus VTDecompressionSessionDecodeFrameWithMultiImageCapableOutputHandler(VTDecompressionSessionRef session, CMSampleBufferRef sampleBuffer, VTDecodeFrameFlags decodeFlags, VTDecodeInfoFlags *infoFlagsOut, VTDecompressionMultiImageCapableOutputHandler multiImageCapableOutputHandler)
{
  return MEMORY[0x24BDF9070](session, sampleBuffer, *(_QWORD *)&decodeFlags, infoFlagsOut, multiImageCapableOutputHandler);
}

uint64_t VTHDRPerFrameMetadataGenerationSessionAttachMetadata()
{
  return MEMORY[0x24BDF90D0]();
}

uint64_t VTHDRPerFrameMetadataGenerationSessionCreate()
{
  return MEMORY[0x24BDF90D8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

