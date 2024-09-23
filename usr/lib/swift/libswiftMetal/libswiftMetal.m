id MTLTexture.makeTextureView(pixelFormat:textureType:levels:slices:)(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;

  if (__OFSUB__(a4, a3))
  {
    __break(1u);
  }
  else if (!__OFSUB__(a6, a5))
  {
    return objc_msgSend(v6, sel_newTextureViewWithPixelFormat_textureType_levels_slices_, result, a2, a3, a4 - a3);
  }
  __break(1u);
  return result;
}

id MTLBlitCommandEncoder.fill(buffer:range:value:)(id result, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  void *v4;

  if (!__OFSUB__(a3, a2))
    return objc_msgSend(v4, sel_fillBuffer_range_value_, result, a2, a3 - a2, a4);
  __break(1u);
  return result;
}

id MTLBlitCommandEncoder.resetCommandsInBuffer(_:range:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLBlitCommandEncoder.resetCommandsInBuffer(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_resetCommandsInBuffer_withRange_);
}

id MTLBlitCommandEncoder.copyIndirectCommandBuffer(_:sourceRange:destination:destinationIndex:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MTLBlitCommandEncoder.copyIndirectCommandBuffer(_:sourceRange:destination:destinationIndex:)(a1, a2, a3, a4, a5, a6, (SEL *)&selRef_copyIndirectCommandBuffer_sourceRange_destination_destinationIndex_);
}

id MTLBlitCommandEncoder.optimizeIndirectCommandBuffer(_:range:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLBlitCommandEncoder.resetCommandsInBuffer(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_optimizeIndirectCommandBuffer_withRange_);
}

id MTLBlitCommandEncoder.resolveCounters(_:range:destinationBuffer:destinationOffset:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MTLBlitCommandEncoder.copyIndirectCommandBuffer(_:sourceRange:destination:destinationIndex:)(a1, a2, a3, a4, a5, a6, (SEL *)&selRef_resolveCounters_inRange_destinationBuffer_destinationOffset_);
}

id MTLBlitCommandEncoder.copyIndirectCommandBuffer(_:sourceRange:destination:destinationIndex:)(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, SEL *a7)
{
  void *v7;

  if (!__OFSUB__(a3, a2))
    return objc_msgSend(v7, *a7, result, a2, a3 - a2, a4, a5);
  __break(1u);
  return result;
}

id MTLBuffer.didModifyRange(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  return MTLBuffer.didModifyRange(_:)(a1, a2, a3, (SEL *)&selRef_didModifyRange_);
}

void MTLBuffer.addDebugMarker(_:range:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v7;
  id v8;

  v7 = MEMORY[0x20BD0413C]();
  if (__OFSUB__(a4, a3))
  {
    __break(1u);
  }
  else
  {
    v8 = (id)v7;
    objc_msgSend(v4, sel_addDebugMarker_range_);

  }
}

uint64_t MTLLogContainer.Iterator.next()()
{
  uint64_t v1;
  __int128 v2;
  uint64_t v3;
  __int128 v4;

  NSFastEnumerationIterator.next()();
  if (v3)
  {
    outlined init with take of Any(&v2, &v4);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MTLFunctionLog);
    swift_dynamicCast();
    return v1;
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v2);
    return 0;
  }
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD042D4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t protocol witness for IteratorProtocol.next() in conformance MTLLogContainer.Iterator@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;

  NSFastEnumerationIterator.next()();
  if (v6)
  {
    outlined init with take of Any(&v5, &v7);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MTLFunctionLog);
    result = swift_dynamicCast();
    v3 = v4;
  }
  else
  {
    result = outlined destroy of Any?((uint64_t)&v5);
    v3 = 0;
  }
  *a1 = v3;
  return result;
}

uint64_t MTLLogContainer.makeIterator()()
{
  swift_unknownObjectRetain();
  return NSFastEnumerationIterator.init(_:)();
}

uint64_t protocol witness for Sequence.makeIterator() in conformance MTLLogContainer()
{
  return NSFastEnumerationIterator.init(_:)();
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance MTLLogContainer()
{
  return 0;
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance MTLLogContainer()
{
  return 2;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance MTLLogContainer()
{
  uint64_t v0;

  v0 = specialized _copySequenceToContiguousArray<A>(_:)();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance MTLLogContainer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3);
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance MTLLogContainer()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

id MTLCommandBuffer.logs.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;
  id result;

  result = objc_msgSend(v1, sel_logs);
  *a1 = result;
  return result;
}

Swift::Void __swiftcall MTLCommandBuffer.useResidencySets(_:)(Swift::OpaquePointer a1)
{
  uint64_t v1;

  MTLCommandBuffer.useResidencySets(_:)((unint64_t)a1._rawValue, v1, (SEL *)&selRef_useResidencySets_count_);
}

Swift::Void __swiftcall MTLAccelerationStructureCommandEncoder.useHeaps(_:)(Swift::OpaquePointer a1)
{
  uint64_t v1;

  MTLCommandBuffer.useResidencySets(_:)((unint64_t)a1._rawValue, v1, (SEL *)&selRef_useHeaps_count_);
}

uint64_t MTLCommandBuffer.useResidencySets(_:)(unint64_t a1, uint64_t a2, SEL *a3)
{
  void *v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v9;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if (_CocoaArrayWrapper.endIndex.getter())
    {
      v9 = specialized _copyCollectionToContiguousArray<A>(_:)(a1);
      swift_bridgeObjectRelease();
      v7 = (uint64_t)(v9 + 4);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      v7 = -8;
    }
  }
  else
  {
    v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v7 = (a1 & 0xFFFFFFFFFFFFFF8) + 32;
    swift_bridgeObjectRetain();
  }
  objc_msgSend(v3, *a3, v7, v6);
  return swift_unknownObjectRelease();
}

char *MTLVisibleFunctionTable.setFunctions(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setFunctions_withRange_);
}

char *MTLIntersectionFunctionTable.setBuffers(_:offsets:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MTLIntersectionFunctionTable.setBuffers(_:offsets:range:)(a1, a2, a3, a4, a5, (SEL *)&selRef_setBuffers_offsets_withRange_);
}

char *MTLIntersectionFunctionTable.setFunctions(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setFunctions_withRange_);
}

char *MTLIntersectionFunctionTable.setVisibleFunctionTables(_:bufferRange:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setVisibleFunctionTables_withBufferRange_);
}

uint64_t MTLAccelerationStructureCommandEncoder.useResources(_:usage:)(unint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v8;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if (_CocoaArrayWrapper.endIndex.getter())
    {
      v8 = specialized _copyCollectionToContiguousArray<A>(_:)(a1);
      swift_bridgeObjectRelease();
      v6 = (uint64_t)(v8 + 4);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      v6 = -8;
    }
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v6 = (a1 & 0xFFFFFFFFFFFFFF8) + 32;
    swift_bridgeObjectRetain();
  }
  objc_msgSend(v2, sel_useResources_count_usage_, v6, v5, a2);
  return swift_unknownObjectRelease();
}

Swift::Void __swiftcall MTLComputeCommandEncoder.useHeaps(_:)(Swift::OpaquePointer a1)
{
  uint64_t v1;

  MTLCommandBuffer.useResidencySets(_:)((unint64_t)a1._rawValue, v1, (SEL *)&selRef_useHeaps_count_);
}

char *MTLComputeCommandEncoder.setBuffers(_:offsets:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MTLIntersectionFunctionTable.setBuffers(_:offsets:range:)(a1, a2, a3, a4, a5, (SEL *)&selRef_setBuffers_offsets_withRange_);
}

char *MTLComputeCommandEncoder.setBuffers(_:offsets:attributeStrides:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MTLComputeCommandEncoder.setBuffers(_:offsets:attributeStrides:range:)(a1, a2, a3, a4, a5, a6, (SEL *)&selRef_setBuffers_offsets_attributeStrides_withRange_);
}

char *MTLComputeCommandEncoder.setTextures(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setTextures_withRange_);
}

char *MTLComputeCommandEncoder.setSamplerStates(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setSamplerStates_withRange_);
}

char *MTLComputeCommandEncoder.setSamplerStates(_:lodMinClamps:lodMaxClamps:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MTLComputeCommandEncoder.setBuffers(_:offsets:attributeStrides:range:)(a1, a2, a3, a4, a5, a6, (SEL *)&selRef_setSamplerStates_lodMinClamps_lodMaxClamps_withRange_);
}

Swift::Void __swiftcall MTLComputeCommandEncoder.memoryBarrier(resources:)(Swift::OpaquePointer resources)
{
  uint64_t v1;

  MTLCommandBuffer.useResidencySets(_:)((unint64_t)resources._rawValue, v1, (SEL *)&selRef_memoryBarrierWithResources_count_);
}

char *MTLComputeCommandEncoder.setVisibleFunctionTables(_:bufferRange:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setVisibleFunctionTables_withBufferRange_);
}

char *MTLComputeCommandEncoder.setIntersectionFunctionTables(_:bufferRange:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setIntersectionFunctionTables_withBufferRange_);
}

uint64_t MTLDevice.getDefaultSamplePositions(sampleCount:)(uint64_t result)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = result;
    if (result)
    {
      type metadata accessor for MTLSamplePosition();
      v3 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(_QWORD *)(v3 + 16) = v2;
      bzero((void *)(v3 + 32), 8 * v2);
    }
    else
    {
      v3 = MEMORY[0x24BEE4AF8];
    }
    objc_msgSend(v1, sel_getDefaultSamplePositions_count_, v3 + 32, v2);
    return v3;
  }
  return result;
}

Swift::tuple_cpu_UInt64_gpu_UInt64 __swiftcall MTLDevice.sampleTimestamps()()
{
  void *v0;
  Swift::UInt64 v1;
  Swift::UInt64 v2;
  Swift::tuple_cpu_UInt64_gpu_UInt64 result;
  Swift::UInt64 v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  v5[0] = 0;
  objc_msgSend(v0, sel_sampleTimestamps_gpuTimestamp_, v5, &v4);
  v2 = v4;
  v1 = v5[0];
  result.gpu = v2;
  result.cpu = v1;
  return result;
}

id MTLDevice.makeRenderPipelineState(descriptor:options:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11[0] = 0;
  v3 = objc_msgSend(v2, sel_newRenderPipelineStateWithMeshDescriptor_options_reflection_error_, a1, a2, v11, &v10);
  v4 = (void *)v11[0];
  if (v3)
  {
    v5 = v3;
    v6 = v10;
    v7 = v4;
  }
  else
  {
    v5 = v10;
    v8 = v4;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v5;
}

uint64_t MTLCounterSampleBuffer.resolveCounterRange(_:)(uint64_t result, uint64_t a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  if (__OFSUB__(a2, result))
  {
    __break(1u);
  }
  else
  {
    v3 = objc_msgSend(v2, sel_resolveCounterRange_, result, a2 - result);
    if (!v3)
      return 0;
    v4 = v3;
    v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

    return v5;
  }
  return result;
}

MTLIOCompressionContext MTLIOCreateCompressionContext(_:_:_:)(uint64_t a1, uint64_t a2, MTLIOCompressionMethod type, size_t chunkSize)
{
  const char *v4;
  char path[8];
  uint64_t v7;

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnsafeMutableRawPointer?);
    _StringGuts._slowWithCString<A>(_:)();
    return *(MTLIOCompressionContext *)path;
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    *(_QWORD *)path = a1;
    v7 = a2 & 0xFFFFFFFFFFFFFFLL;
    return MTLIOCreateCompressionContext(path, type, chunkSize);
  }
  else
  {
    if ((a1 & 0x1000000000000000) != 0)
      v4 = (const char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v4 = (const char *)_StringObject.sharedUTF8.getter();
    partial apply for closure #1 in MTLIOCreateCompressionContext(_:_:_:)(v4, path);
    return *(MTLIOCompressionContext *)path;
  }
}

id MTLFunctionConstantValues.setConstantValues(_:type:range:)(id result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;

  if (!__OFSUB__(a4, a3))
    return objc_msgSend(v4, sel_setConstantValues_type_withRange_, result, a2, a3, a4 - a3);
  __break(1u);
  return result;
}

Swift::Void __swiftcall MTLResidencySet.addAllocations(_:)(Swift::OpaquePointer a1)
{
  uint64_t v1;

  MTLCommandBuffer.useResidencySets(_:)((unint64_t)a1._rawValue, v1, (SEL *)&selRef_addAllocations_count_);
}

Swift::Void __swiftcall MTLResidencySet.removeAllocations(_:)(Swift::OpaquePointer a1)
{
  uint64_t v1;

  MTLCommandBuffer.useResidencySets(_:)((unint64_t)a1._rawValue, v1, (SEL *)&selRef_removeAllocations_count_);
}

Swift::Void __swiftcall MTLCommandQueue.addResidencySets(_:)(Swift::OpaquePointer a1)
{
  uint64_t v1;

  MTLCommandBuffer.useResidencySets(_:)((unint64_t)a1._rawValue, v1, (SEL *)&selRef_addResidencySets_count_);
}

Swift::Void __swiftcall MTLCommandQueue.removeResidencySets(_:)(Swift::OpaquePointer a1)
{
  uint64_t v1;

  MTLCommandBuffer.useResidencySets(_:)((unint64_t)a1._rawValue, v1, (SEL *)&selRef_removeResidencySets_count_);
}

char *MTLArgumentEncoder.setBuffers(_:offsets:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MTLIntersectionFunctionTable.setBuffers(_:offsets:range:)(a1, a2, a3, a4, a5, (SEL *)&selRef_setBuffers_offsets_withRange_);
}

char *MTLArgumentEncoder.setTextures(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setTextures_withRange_);
}

char *MTLArgumentEncoder.setSamplerStates(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setSamplerStates_withRange_);
}

char *MTLArgumentEncoder.setRenderPipelineStates(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setRenderPipelineStates_withRange_);
}

char *MTLArgumentEncoder.setIndirectCommandBuffers(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setIndirectCommandBuffers_withRange_);
}

char *MTLArgumentEncoder.setVisibleFunctionTables(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setVisibleFunctionTables_withRange_);
}

char *MTLArgumentEncoder.setIntersectionFunctionTables(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setIntersectionFunctionTables_withRange_);
}

Swift::Void __swiftcall MTLRenderCommandEncoder.useHeaps(_:)(Swift::OpaquePointer a1)
{
  uint64_t v1;

  MTLCommandBuffer.useResidencySets(_:)((unint64_t)a1._rawValue, v1, (SEL *)&selRef_useHeaps_count_);
}

Swift::Void __swiftcall MTLRenderCommandEncoder.setViewports(_:)(Swift::OpaquePointer a1)
{
  void *v1;

  objc_msgSend(v1, sel_setViewports_count_, (char *)a1._rawValue + 32, *((_QWORD *)a1._rawValue + 2));
}

Swift::Void __swiftcall MTLRenderCommandEncoder.setScissorRects(_:)(Swift::OpaquePointer a1)
{
  void *v1;

  objc_msgSend(v1, sel_setScissorRects_count_, (char *)a1._rawValue + 32, *((_QWORD *)a1._rawValue + 2));
}

char *MTLRenderCommandEncoder.setVertexBuffers(_:offsets:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MTLIntersectionFunctionTable.setBuffers(_:offsets:range:)(a1, a2, a3, a4, a5, (SEL *)&selRef_setVertexBuffers_offsets_withRange_);
}

char *MTLRenderCommandEncoder.setVertexBuffers(_:offsets:attributeStrides:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MTLComputeCommandEncoder.setBuffers(_:offsets:attributeStrides:range:)(a1, a2, a3, a4, a5, a6, (SEL *)&selRef_setVertexBuffers_offsets_attributeStrides_withRange_);
}

char *MTLRenderCommandEncoder.setVertexTextures(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setVertexTextures_withRange_);
}

char *MTLRenderCommandEncoder.setVertexSamplerStates(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setVertexSamplerStates_withRange_);
}

char *MTLRenderCommandEncoder.setVertexSamplerStates(_:lodMinClamps:lodMaxClamps:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MTLComputeCommandEncoder.setBuffers(_:offsets:attributeStrides:range:)(a1, a2, a3, a4, a5, a6, (SEL *)&selRef_setVertexSamplerStates_lodMinClamps_lodMaxClamps_withRange_);
}

char *MTLRenderCommandEncoder.setFragmentBuffers(_:offsets:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MTLIntersectionFunctionTable.setBuffers(_:offsets:range:)(a1, a2, a3, a4, a5, (SEL *)&selRef_setFragmentBuffers_offsets_withRange_);
}

char *MTLRenderCommandEncoder.setFragmentTextures(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setFragmentTextures_withRange_);
}

char *MTLRenderCommandEncoder.setFragmentSamplerStates(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setFragmentSamplerStates_withRange_);
}

char *MTLRenderCommandEncoder.setFragmentSamplerStates(_:lodMinClamps:lodMaxClamps:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MTLComputeCommandEncoder.setBuffers(_:offsets:attributeStrides:range:)(a1, a2, a3, a4, a5, a6, (SEL *)&selRef_setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange_);
}

char *MTLRenderCommandEncoder.setTileBuffers(_:offsets:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MTLIntersectionFunctionTable.setBuffers(_:offsets:range:)(a1, a2, a3, a4, a5, (SEL *)&selRef_setTileBuffers_offsets_withRange_);
}

char *MTLRenderCommandEncoder.setTileTextures(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setTileTextures_withRange_);
}

char *MTLRenderCommandEncoder.setTileSamplerStates(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setTileSamplerStates_withRange_);
}

char *MTLRenderCommandEncoder.setTileSamplerStates(_:lodMinClamps:lodMaxClamps:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MTLComputeCommandEncoder.setBuffers(_:offsets:attributeStrides:range:)(a1, a2, a3, a4, a5, a6, (SEL *)&selRef_setTileSamplerStates_lodMinClamps_lodMaxClamps_withRange_);
}

char *MTLRenderCommandEncoder.setObjectBuffers(_:offsets:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MTLIntersectionFunctionTable.setBuffers(_:offsets:range:)(a1, a2, a3, a4, a5, (SEL *)&selRef_setObjectBuffers_offsets_withRange_);
}

char *MTLRenderCommandEncoder.setObjectTextures(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setObjectTextures_withRange_);
}

char *MTLRenderCommandEncoder.setObjectSamplerStates(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setObjectSamplerStates_withRange_);
}

char *MTLRenderCommandEncoder.setObjectSamplerStates(_:lodMinClamps:lodMaxClamps:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MTLComputeCommandEncoder.setBuffers(_:offsets:attributeStrides:range:)(a1, a2, a3, a4, a5, a6, (SEL *)&selRef_setObjectSamplerStates_lodMinClamps_lodMaxClamps_withRange_);
}

char *MTLRenderCommandEncoder.setMeshBuffers(_:offsets:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MTLIntersectionFunctionTable.setBuffers(_:offsets:range:)(a1, a2, a3, a4, a5, (SEL *)&selRef_setMeshBuffers_offsets_withRange_);
}

char *MTLIntersectionFunctionTable.setBuffers(_:offsets:range:)(char *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, SEL *a6)
{
  void *v6;

  if (!__OFSUB__(a4, a3))
    return (char *)objc_msgSend(v6, *a6, result + 32, a2 + 32, a3, a4 - a3);
  __break(1u);
  return result;
}

char *MTLRenderCommandEncoder.setMeshTextures(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setMeshTextures_withRange_);
}

char *MTLRenderCommandEncoder.setMeshSamplerStates(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setMeshSamplerStates_withRange_);
}

char *MTLRenderCommandEncoder.setMeshSamplerStates(_:lodMinClamps:lodMaxClamps:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MTLComputeCommandEncoder.setBuffers(_:offsets:attributeStrides:range:)(a1, a2, a3, a4, a5, a6, (SEL *)&selRef_setMeshSamplerStates_lodMinClamps_lodMaxClamps_withRange_);
}

char *MTLComputeCommandEncoder.setBuffers(_:offsets:attributeStrides:range:)(char *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, SEL *a7)
{
  void *v7;

  if (!__OFSUB__(a5, a4))
    return (char *)objc_msgSend(v7, *a7, result + 32, a2 + 32, a3 + 32, a4, a5 - a4);
  __break(1u);
  return result;
}

Swift::Void __swiftcall MTLRenderCommandEncoder.memoryBarrier(resources:after:before:)(Swift::OpaquePointer resources, MTLRenderStages after, MTLRenderStages before)
{
  void *v3;
  void *v4;
  uint64_t v8;
  unint64_t v9;
  _QWORD *v10;

  v4 = v3;
  if ((unint64_t)resources._rawValue >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if (_CocoaArrayWrapper.endIndex.getter())
    {
      v10 = specialized _copyCollectionToContiguousArray<A>(_:)((unint64_t)resources._rawValue);
      swift_bridgeObjectRelease();
      v9 = (unint64_t)(v10 + 4);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      v9 = -8;
    }
  }
  else
  {
    v8 = *(_QWORD *)(((unint64_t)resources._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
    v9 = ((unint64_t)resources._rawValue & 0xFFFFFFFFFFFFFF8) + 32;
    swift_bridgeObjectRetain();
  }
  objc_msgSend(v4, sel_memoryBarrierWithResources_count_afterStages_beforeStages_, v9, v8, after, before);
  swift_unknownObjectRelease();
}

id MTLRenderCommandEncoder.executeCommandsInBuffer(_:range:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLBlitCommandEncoder.resetCommandsInBuffer(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_executeCommandsInBuffer_withRange_);
}

id MTLBlitCommandEncoder.resetCommandsInBuffer(_:range:)(id result, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  void *v5;

  if (!__OFSUB__(a3, a2))
    return objc_msgSend(v5, *a5, result, a2, a3 - a2);
  __break(1u);
  return result;
}

char *MTLRenderCommandEncoder.setVertexVisibleFunctionTables(_:bufferRange:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setVertexVisibleFunctionTables_withBufferRange_);
}

char *MTLRenderCommandEncoder.setFragmentVisibleFunctionTables(_:bufferRange:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setFragmentVisibleFunctionTables_withBufferRange_);
}

char *MTLRenderCommandEncoder.setTileVisibleFunctionTables(_:bufferRange:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setTileVisibleFunctionTables_withBufferRange_);
}

char *MTLRenderCommandEncoder.setVertexIntersectionFunctionTables(_:bufferRange:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setVertexIntersectionFunctionTables_withBufferRange_);
}

char *MTLRenderCommandEncoder.setFragmentIntersectionFunctionTables(_:bufferRange:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setFragmentIntersectionFunctionTables_withBufferRange_);
}

char *MTLRenderCommandEncoder.setTileIntersectionFunctionTables(_:bufferRange:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setTileIntersectionFunctionTables_withBufferRange_);
}

char *MTLVisibleFunctionTable.setFunctions(_:range:)(char *result, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  void *v5;

  if (!__OFSUB__(a3, a2))
    return (char *)objc_msgSend(v5, *a5, result + 32, a2, a3 - a2);
  __break(1u);
  return result;
}

id MTLIndirectCommandBuffer.reset(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  return MTLBuffer.didModifyRange(_:)(a1, a2, a3, (SEL *)&selRef_resetWithRange_);
}

id MTLBuffer.didModifyRange(_:)(id result, uint64_t a2, uint64_t a3, SEL *a4)
{
  void *v4;

  if (!__OFSUB__(a2, result))
    return objc_msgSend(v4, *a4, result, a2 - (_QWORD)result);
  __break(1u);
  return result;
}

Swift::Void __swiftcall MTLRenderPassDescriptor.setSamplePositions(_:)(Swift::OpaquePointer a1)
{
  void *v1;

  objc_msgSend(v1, sel_setSamplePositions_count_, (char *)a1._rawValue + 32, *((_QWORD *)a1._rawValue + 2));
}

uint64_t MTLRenderPassDescriptor.getSamplePositions()()
{
  void *v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;

  result = (uint64_t)objc_msgSend(v0, sel_getSamplePositions_count_, 0, 0);
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = result;
    if (result)
    {
      type metadata accessor for MTLSamplePosition();
      v3 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(_QWORD *)(v3 + 16) = v2;
      bzero((void *)(v3 + 32), 8 * v2);
    }
    else
    {
      v3 = MEMORY[0x24BEE4AF8];
    }
    objc_msgSend(v0, sel_getSamplePositions_count_, v3 + 32, v2);
    return v3;
  }
  return result;
}

id MTLTexture.makeTextureView(pixelFormat:textureType:levels:slices:swizzle:)(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  void *v7;

  if (__OFSUB__(a4, a3))
  {
    __break(1u);
  }
  else if (!__OFSUB__(a6, a5))
  {
    return objc_msgSend(v7, sel_newTextureViewWithPixelFormat_textureType_levels_slices_swizzle_, result, a2, a3, a4 - a3, a5, a6 - a5, a7);
  }
  __break(1u);
  return result;
}

float MTLRasterizationRateSampleArray.subscript.getter(uint64_t a1)
{
  void *v1;
  float *v3;
  float result;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v5[0] = 0;
  v3 = (float *)objc_msgSend(v1, sel___getRawArray_, v5);
  result = 0.0;
  if ((a1 & 0x8000000000000000) == 0 && v5[0] > a1)
    return v3[a1];
  return result;
}

_DWORD *key path getter for MTLRasterizationRateSampleArray.subscript(_:) : MTLRasterizationRateSampleArray@<X0>(void **a1@<X0>, uint64_t *a2@<X1>, _DWORD *a3@<X8>)
{
  void *v4;
  uint64_t v5;
  _DWORD *result;
  int v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  v5 = *a2;
  v8[0] = 0;
  result = objc_msgSend(v4, sel___getRawArray_, v8);
  v7 = 0;
  if ((v5 & 0x8000000000000000) == 0 && v5 < v8[0])
    v7 = result[v5];
  *a3 = v7;
  return result;
}

_DWORD *key path setter for MTLRasterizationRateSampleArray.subscript(_:) : MTLRasterizationRateSampleArray(int *a1, void **a2, uint64_t *a3)
{
  uint64_t v3;
  int v4;
  void *v5;
  _DWORD *result;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v3 = *a3;
  v4 = *a1;
  v5 = *a2;
  v7[0] = 0;
  result = objc_msgSend(v5, sel___getRawArray_, v7);
  if ((v3 & 0x8000000000000000) == 0 && v3 < v7[0])
    result[v3] = v4;
  return result;
}

float *MTLRasterizationRateSampleArray.subscript.setter(uint64_t a1, float a2)
{
  void *v2;
  float *result;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v6[0] = 0;
  result = (float *)objc_msgSend(v2, sel___getRawArray_, v6);
  if ((a1 & 0x8000000000000000) == 0 && v6[0] > a1)
    result[a1] = a2;
  return result;
}

_DWORD *(*MTLRasterizationRateSampleArray.subscript.modify(_QWORD *a1, uint64_t a2))(uint64_t a1)
{
  void *v2;
  void *v3;
  _DWORD *v6;
  _DWORD *v7;
  int v8;

  v3 = v2;
  v6 = a1 + 3;
  a1[1] = a2;
  a1[2] = v3;
  *a1 = 0;
  v7 = objc_msgSend(v3, sel___getRawArray_, a1);
  v8 = 0;
  if ((a2 & 0x8000000000000000) == 0 && *a1 > a2)
    v8 = v7[a2];
  *v6 = v8;
  return MTLRasterizationRateSampleArray.subscript.modify;
}

_DWORD *MTLRasterizationRateSampleArray.subscript.modify(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  _DWORD *result;

  v2 = *(_DWORD *)(a1 + 24);
  v3 = *(void **)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = 0;
  result = objc_msgSend(v3, sel___getRawArray_, a1);
  if ((v4 & 0x8000000000000000) == 0 && *(_QWORD *)a1 > v4)
    result[*(_QWORD *)(a1 + 8)] = v2;
  return result;
}

MTLRasterizationRateLayerDescriptor __swiftcall MTLRasterizationRateLayerDescriptor.init(horizontal:vertical:)(Swift::OpaquePointer horizontal, Swift::OpaquePointer vertical)
{
  id v4;
  id v5;
  __int128 v7;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  MTLSizeMake(*((_QWORD *)horizontal._rawValue + 2), *((_QWORD *)vertical._rawValue + 2), &v7);
  v5 = objc_msgSend(v4, sel_initWithSampleCount_horizontal_vertical_, &v7, (char *)horizontal._rawValue + 32, (char *)vertical._rawValue + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (MTLRasterizationRateLayerDescriptor)v5;
}

MTLRasterizationRateMapDescriptor __swiftcall MTLRasterizationRateMapDescriptor.init(screenSize:label:)(MTLSize screenSize, Swift::String_optional label)
{
  void *object;
  uint64_t countAndFlagsBits;
  id v4;
  id v5;
  void *v6;
  MTLSize v8;

  object = label.value._object;
  countAndFlagsBits = label.value._countAndFlagsBits;
  v8 = screenSize;
  v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_rasterizationRateMapDescriptorWithScreenSize_, &v8);
  v5 = v4;
  if (object)
  {
    v6 = (void *)MEMORY[0x20BD0413C](countAndFlagsBits, object);
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v4, sel_setLabel_, v6);

  return (MTLRasterizationRateMapDescriptor)v4;
}

MTLRasterizationRateMapDescriptor __swiftcall MTLRasterizationRateMapDescriptor.init(screenSize:layer:label:)(MTLSize screenSize, MTLRasterizationRateLayerDescriptor layer, Swift::String_optional label)
{
  void *object;
  uint64_t countAndFlagsBits;
  id v6;
  id v7;
  void *v8;
  MTLSize v10;

  object = label.value._object;
  countAndFlagsBits = label.value._countAndFlagsBits;
  v10 = screenSize;
  v6 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_rasterizationRateMapDescriptorWithScreenSize_layer_, &v10, layer.super.isa);
  v7 = v6;
  if (object)
  {
    v8 = (void *)MEMORY[0x20BD0413C](countAndFlagsBits, object);
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, sel_setLabel_, v8);

  return (MTLRasterizationRateMapDescriptor)v6;
}

MTLRasterizationRateMapDescriptor __swiftcall MTLRasterizationRateMapDescriptor.init(screenSize:layers:label:)(MTLSize screenSize, Swift::OpaquePointer layers, Swift::String_optional label)
{
  void *object;
  uint64_t countAndFlagsBits;
  NSUInteger depth;
  NSUInteger height;
  NSUInteger width;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[3];

  object = label.value._object;
  countAndFlagsBits = label.value._countAndFlagsBits;
  depth = screenSize.depth;
  height = screenSize.height;
  width = screenSize.width;
  if (!((unint64_t)layers._rawValue >> 62))
  {
    v9 = (unint64_t)layers._rawValue & 0xFFFFFFFFFFFFFF8;
    v10 = *(_QWORD *)(((unint64_t)layers._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
    v11 = v9 + 32;
    goto LABEL_4;
  }
  v10 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRetain();
  if (_CocoaArrayWrapper.endIndex.getter())
  {
    v9 = (unint64_t)specialized _copyCollectionToContiguousArray<A>(_:)((unint64_t)layers._rawValue);
    swift_bridgeObjectRelease_n();
    goto LABEL_3;
  }
  swift_bridgeObjectRelease();
  v11 = -8;
LABEL_4:
  v16[0] = width;
  v16[1] = height;
  v16[2] = depth;
  v12 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_rasterizationRateMapDescriptorWithScreenSize_layerCount_layers_, v16, v10, v11);
  swift_unknownObjectRelease();
  v13 = v12;
  if (object)
  {
    v14 = (void *)MEMORY[0x20BD0413C](countAndFlagsBits, object);
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v12, sel_setLabel_, v14);

  return (MTLRasterizationRateMapDescriptor)v12;
}

uint64_t specialized _copySequenceToContiguousArray<A>(_:)()
{
  uint64_t v0;
  char *v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  const void *v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  __int128 v22;
  uint64_t v23;
  __int128 v24;

  type metadata accessor for MTLLogContainer.Iterator();
  MEMORY[0x24BDAC7A8]();
  v1 = (char *)v21 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectRetain();
  NSFastEnumerationIterator.init(_:)();
  NSFastEnumerationIterator.next()();
  v2 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = 0;
  if (v23)
  {
    v4 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
    while (1)
    {
      outlined init with take of Any(&v22, &v24);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MTLFunctionLog);
      result = swift_dynamicCast();
      v6 = v21[1];
      if (!v3)
      {
        v7 = v2[3];
        if ((uint64_t)((v7 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_23;
        v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
        if (v8 <= 1)
          v9 = 1;
        else
          v9 = v8;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
        v10 = (_QWORD *)swift_allocObject();
        v11 = _swift_stdlib_malloc_size(v10);
        v12 = v11 - 32;
        if (v11 < 32)
          v12 = v11 - 25;
        v13 = v12 >> 3;
        v10[2] = v9;
        v10[3] = (2 * (v12 >> 3)) | 1;
        v14 = (unint64_t)(v10 + 4);
        v15 = v2[3] >> 1;
        if (v2[2])
        {
          v16 = v2 + 4;
          if (v10 != v2 || v14 >= (unint64_t)v16 + 8 * v15)
            memmove(v10 + 4, v16, 8 * v15);
          v2[2] = 0;
        }
        v4 = (_QWORD *)(v14 + 8 * v15);
        v3 = (v13 & 0x7FFFFFFFFFFFFFFFLL) - v15;
        result = swift_release();
        v2 = v10;
      }
      v17 = __OFSUB__(v3--, 1);
      if (v17)
        break;
      *v4++ = v6;
      NSFastEnumerationIterator.next()();
      if (!v23)
        goto LABEL_18;
    }
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
LABEL_18:
  outlined destroy of Any?((uint64_t)&v22);
  result = outlined destroy of MTLLogContainer.Iterator((uint64_t)v1);
  v18 = v2[3];
  if (v18 < 2)
    return (uint64_t)v2;
  v19 = v18 >> 1;
  v17 = __OFSUB__(v19, v3);
  v20 = v19 - v3;
  if (!v17)
  {
    v2[2] = v20;
    return (uint64_t)v2;
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];
  __int128 v11;
  uint64_t v12;
  __int128 v13;

  type metadata accessor for MTLLogContainer.Iterator();
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = NSFastEnumerationIterator.init(_:)();
  if (!a2)
  {
    a3 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
LABEL_12:
    outlined init with take of MTLLogContainer.Iterator((uint64_t)v7, a1);
    return a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    NSFastEnumerationIterator.next()();
    if (v12)
    {
      v9 = 0;
      while (1)
      {
        outlined init with take of Any(&v11, &v13);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MTLFunctionLog);
        swift_dynamicCast();
        *(_QWORD *)(a2 + 8 * v9) = v10[1];
        if (a3 - 1 == v9)
          break;
        NSFastEnumerationIterator.next()();
        ++v9;
        if (!v12)
          goto LABEL_11;
      }
    }
    else
    {
      v9 = 0;
LABEL_11:
      outlined destroy of Any?((uint64_t)&v11);
      a3 = v9;
    }
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

void type metadata accessor for MTLSamplePosition()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!lazy cache variable for type metadata for MTLSamplePosition)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for MTLSamplePosition);
  }
}

MTLIOCompressionContext partial apply for closure #1 in MTLIOCreateCompressionContext(_:_:_:)@<X0>(const char *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  MTLIOCompressionContext result;

  result = MTLIOCreateCompressionContext(a1, *(MTLIOCompressionMethod *)(v2 + 16), *(_QWORD *)(v2 + 24));
  *a2 = result;
  return result;
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v5 = v4 - 32;
      if (v4 < 32)
        v5 = v4 - 25;
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    MEMORY[0x20BD0416C](v3 + 4, v2, v1);
    v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t MTLSizeMake@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  a3[2] = 0;
  return result;
}

unint64_t lazy protocol witness table accessor for type MTLLogContainer.Iterator and conformance MTLLogContainer.Iterator()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type MTLLogContainer.Iterator and conformance MTLLogContainer.Iterator;
  if (!lazy protocol witness table cache variable for type MTLLogContainer.Iterator and conformance MTLLogContainer.Iterator)
  {
    v1 = type metadata accessor for MTLLogContainer.Iterator();
    result = MEMORY[0x20BD042E0](&protocol conformance descriptor for MTLLogContainer.Iterator, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MTLLogContainer.Iterator and conformance MTLLogContainer.Iterator);
  }
  return result;
}

uint64_t type metadata accessor for MTLLogContainer.Iterator()
{
  uint64_t result;

  result = type metadata singleton initialization cache for MTLLogContainer.Iterator;
  if (!type metadata singleton initialization cache for MTLLogContainer.Iterator)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20831173C()
{
  return 0;
}

ValueMetadata *type metadata accessor for MTLLogContainer()
{
  return &type metadata for MTLLogContainer;
}

uint64_t initializeBufferWithCopyOfBuffer for MTLLogContainer.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NSFastEnumerationIterator();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for MTLLogContainer.Iterator(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for NSFastEnumerationIterator();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for MTLLogContainer.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NSFastEnumerationIterator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for MTLLogContainer.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NSFastEnumerationIterator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for MTLLogContainer.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NSFastEnumerationIterator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for MTLLogContainer.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NSFastEnumerationIterator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for MTLLogContainer.Iterator()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2083118E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NSFastEnumerationIterator();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for MTLLogContainer.Iterator()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_208311930(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NSFastEnumerationIterator();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata completion function for MTLLogContainer.Iterator()
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

_QWORD *__swift_memcpy8_4(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MTLSamplePosition(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for MTLSamplePosition(uint64_t result, int a2, int a3)
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

uint64_t outlined init with take of MTLLogContainer.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MTLLogContainer.Iterator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of MTLLogContainer.Iterator(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MTLLogContainer.Iterator();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCDCE0]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t specialized _ArrayBuffer._copyContents(initializing:)()
{
  return MEMORY[0x24BEE2640]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x24BEE3068]();
}

MTLIOCompressionContext MTLIOCreateCompressionContext(const char *path, MTLIOCompressionMethod type, size_t chunkSize)
{
  return (MTLIOCompressionContext)MEMORY[0x24BDDD278](path, type, chunkSize);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
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

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

