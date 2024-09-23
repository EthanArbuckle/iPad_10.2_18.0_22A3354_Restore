void MLCEmbeddingDescriptor.embeddingCount.getter()
{
  MLCEmbeddingDescriptor.embeddingCount.getter((SEL *)&selRef_embeddingCount);
}

void MLCEmbeddingDescriptor.embeddingDimension.getter()
{
  MLCEmbeddingDescriptor.embeddingCount.getter((SEL *)&selRef_embeddingDimension);
}

void MLCEmbeddingDescriptor.embeddingCount.getter(SEL *a1)
{
  void *v1;
  id v2;
  char v3;
  char v4;

  v2 = objc_msgSend(v1, *a1);
  Int.init(exactly:)();
  v4 = v3;

  if ((v4 & 1) != 0)
    __break(1u);
}

uint64_t MLCEmbeddingDescriptor.paddingIndex.getter()
{
  void *v0;
  id v1;
  uint64_t result;
  char v3;
  uint64_t v4;

  v1 = objc_msgSend(v0, sel_paddingIndex);
  if (!v1)
    return 0;
  result = Int.init(exactly:)();
  if ((v3 & 1) == 0)
  {
    v4 = result;

    return v4;
  }
  __break(1u);
  return result;
}

uint64_t MLCEmbeddingDescriptor.maximumNorm.getter()
{
  return MLCEmbeddingDescriptor.maximumNorm.getter((SEL *)&selRef_maximumNorm);
}

uint64_t MLCEmbeddingDescriptor.pNorm.getter()
{
  return MLCEmbeddingDescriptor.maximumNorm.getter((SEL *)&selRef_pNorm);
}

uint64_t MLCEmbeddingDescriptor.maximumNorm.getter(SEL *a1)
{
  void *v1;
  id v2;
  uint64_t result;
  unsigned int v4;
  uint64_t v5;

  v2 = objc_msgSend(v1, *a1);
  if (!v2)
  {
    v5 = 0;
    return v5 | ((unint64_t)(v2 == 0) << 32);
  }
  result = Float.init(exactly:)();
  if ((result & 0x100000000) == 0)
  {
    v4 = result;

    v5 = v4;
    return v5 | ((unint64_t)(v2 == 0) << 32);
  }
  __break(1u);
  return result;
}

MLCEmbeddingDescriptor_optional __swiftcall MLCEmbeddingDescriptor.init(embeddingCount:embeddingDimension:)(Swift::Int embeddingCount, Swift::Int embeddingDimension)
{
  void *ObjCClassFromMetadata;
  Class isa;
  Class v4;
  objc_class *v5;
  Swift::Bool v6;
  objc_class *v7;
  MLCEmbeddingDescriptor_optional result;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  isa = Int._bridgeToObjectiveC()().super.super.isa;
  v4 = Int._bridgeToObjectiveC()().super.super.isa;
  v5 = (objc_class *)objc_msgSend(ObjCClassFromMetadata, sel_descriptorWithEmbeddingCount_embeddingDimension_, isa, v4);

  v7 = v5;
  result.value.super.isa = v7;
  result.is_nil = v6;
  return result;
}

MLCEmbeddingDescriptor_optional __swiftcall MLCEmbeddingDescriptor.init(embeddingCount:embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:)(Swift::Int embeddingCount, Swift::Int embeddingDimension, Swift::Int_optional paddingIndex, Swift::Float_optional *maximumNorm, Swift::Float_optional *pNorm, Swift::Bool scalesGradientByFrequency)
{
  Swift::Bool is_nil;
  NSNumber v10;
  NSNumber v11;
  NSNumber v12;
  Class isa;
  Class v14;
  objc_class *v15;
  Swift::Bool v16;
  objc_class *v17;
  MLCEmbeddingDescriptor_optional result;

  is_nil = paddingIndex.is_nil;
  v10.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
  v11.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
  if (!is_nil)
  {
    v12.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
    if (((unint64_t)maximumNorm & 0x100000000) != 0)
      goto LABEL_3;
LABEL_6:
    isa = Float._bridgeToObjectiveC()().super.super.isa;
    if (((unint64_t)pNorm & 0x100000000) != 0)
      goto LABEL_4;
LABEL_7:
    v14 = Float._bridgeToObjectiveC()().super.super.isa;
    goto LABEL_8;
  }
  v12.super.super.isa = 0;
  if (((unint64_t)maximumNorm & 0x100000000) == 0)
    goto LABEL_6;
LABEL_3:
  isa = 0;
  if (((unint64_t)pNorm & 0x100000000) == 0)
    goto LABEL_7;
LABEL_4:
  v14 = 0;
LABEL_8:
  v15 = (objc_class *)objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_descriptorWithEmbeddingCount_embeddingDimension_paddingIndex_maximumNorm_pNorm_scalesGradientByFrequency_, v10.super.super.isa, v11.super.super.isa, v12.super.super.isa, isa, v14, scalesGradientByFrequency);

  v17 = v15;
  result.value.super.isa = v17;
  result.is_nil = v16;
  return result;
}

MLCPaddingLayer __swiftcall MLCPaddingLayer.init(reflectionPadding:)(Swift::OpaquePointer reflectionPadding)
{
  return (MLCPaddingLayer)MLCPaddingLayer.init(reflectionPadding:)((uint64_t)reflectionPadding._rawValue, (SEL *)&selRef_layerWithReflectionPadding_);
}

uint64_t specialized _arrayForceCast<A, B>(_:)(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSNumber v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
    v2 = v9;
    v4 = a1 + 32;
    do
    {
      v4 += 8;
      v5.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
      v7 = *(_QWORD *)(v9 + 16);
      v6 = *(_QWORD *)(v9 + 24);
      if (v7 >= v6 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v6 > 1), v7 + 1, 1);
      *(_QWORD *)(v9 + 16) = v7 + 1;
      *(NSNumber *)(v9 + 8 * v7 + 32) = v5;
      --v1;
    }
    while (v1);
  }
  return v2;
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

MLCPaddingLayer __swiftcall MLCPaddingLayer.init(symmetricPadding:)(Swift::OpaquePointer symmetricPadding)
{
  return (MLCPaddingLayer)MLCPaddingLayer.init(reflectionPadding:)((uint64_t)symmetricPadding._rawValue, (SEL *)&selRef_layerWithSymmetricPadding_);
}

MLCPaddingLayer __swiftcall MLCPaddingLayer.init(zeroPadding:)(Swift::OpaquePointer zeroPadding)
{
  return (MLCPaddingLayer)MLCPaddingLayer.init(reflectionPadding:)((uint64_t)zeroPadding._rawValue, (SEL *)&selRef_layerWithZeroPadding_);
}

id MLCPaddingLayer.init(reflectionPadding:)(uint64_t a1, SEL *a2)
{
  void *ObjCClassFromMetadata;
  Class isa;
  id v6;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)(a1);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(ObjCClassFromMetadata, *a2, isa);

  return v6;
}

MLCPaddingLayer __swiftcall MLCPaddingLayer.init(constantPadding:constantValue:)(Swift::OpaquePointer constantPadding, Swift::Float constantValue)
{
  void *ObjCClassFromMetadata;
  Class isa;
  double v6;
  id v7;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)constantPadding._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  *(Swift::Float *)&v6 = constantValue;
  v7 = objc_msgSend(ObjCClassFromMetadata, sel_layerWithConstantPadding_constantValue_, isa, v6);

  return (MLCPaddingLayer)v7;
}

uint64_t MLCLayerNormalizationLayer.normalizedShape.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v1 = objc_msgSend(v0, sel_normalizedShape);
  type metadata accessor for NSNumber();
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62)
    goto LABEL_15;
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      v13 = MEMORY[0x24BEE4AF8];
      result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
      if (v3 < 0)
        break;
      v5 = 0;
      v6 = v13;
      while (v3 != v5)
      {
        if ((v2 & 0xC000000000000001) != 0)
          v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v2);
        else
          v7 = *(id *)(v2 + 8 * v5 + 32);
        v8 = v7;
        result = Int.init(exactly:)();
        if ((v9 & 1) != 0)
          goto LABEL_19;
        v10 = result;

        v12 = *(_QWORD *)(v13 + 16);
        v11 = *(_QWORD *)(v13 + 24);
        if (v12 >= v11 >> 1)
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
        ++v5;
        *(_QWORD *)(v13 + 16) = v12 + 1;
        *(_QWORD *)(v13 + 8 * v12 + 32) = v10;
        if (v3 == v5)
        {
          swift_bridgeObjectRelease();
          return v6;
        }
      }
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
      v3 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v3)
        goto LABEL_16;
    }
    __break(1u);
LABEL_19:
    __break(1u);
  }
  else
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

MLCLayerNormalizationLayer_optional __swiftcall MLCLayerNormalizationLayer.init(normalizedShape:beta:gamma:varianceEpsilon:)(Swift::OpaquePointer normalizedShape, MLCTensor beta, MLCTensor gamma, Swift::Float varianceEpsilon)
{
  void *ObjCClassFromMetadata;
  Class isa;
  double v10;
  objc_class *v11;
  Swift::Bool v12;
  objc_class *v13;
  MLCLayerNormalizationLayer_optional result;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)normalizedShape._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  *(Swift::Float *)&v10 = varianceEpsilon;
  v11 = (objc_class *)objc_msgSend(ObjCClassFromMetadata, sel_layerWithNormalizedShape_beta_gamma_varianceEpsilon_, isa, beta.super.isa, gamma.super.isa, v10);

  v13 = v11;
  result.value.super.super.isa = v13;
  result.is_nil = v12;
  return result;
}

MLCLayerNormalizationLayer_optional __swiftcall MLCLayerNormalizationLayer.init(normalizedShape:beta:gamma:varianceEpsilon:)(Swift::OpaquePointer normalizedShape, MLCTensor_optional beta, MLCTensor_optional gamma, Swift::Float varianceEpsilon)
{
  void *v5;
  Class isa;
  void *ObjCClassFromMetadata;
  Class v9;
  double v10;
  objc_class *v11;
  Swift::Bool v12;
  objc_class *v13;
  MLCLayerNormalizationLayer_optional result;

  v5 = *(void **)&beta.is_nil;
  isa = beta.value.super.isa;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)normalizedShape._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  v9 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  *(Swift::Float *)&v10 = varianceEpsilon;
  v11 = (objc_class *)objc_msgSend(ObjCClassFromMetadata, sel_layerWithNormalizedShape_beta_gamma_varianceEpsilon_, v9, isa, v5, v10);

  v13 = v11;
  result.value.super.super.isa = v13;
  result.is_nil = v12;
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

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = result;
  return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = (2 * (v12 >> 3)) | 1;
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4])
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    type metadata accessor for NSNumber();
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
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

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)(unint64_t a1, unint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;
  Swift::String v8;
  Swift::String v9;
  Swift::String v10;

  type metadata accessor for NSNumber();
  if (a2 >> 62)
  {
    v4 = _CocoaArrayWrapper.subscript.getter();
    objc_opt_self();
    if (swift_dynamicCastObjCClass())
      return v4;
LABEL_10:
    _StringGuts.grow(_:)(85);
    v6 = 0xD000000000000046;
    v5 = 0x80000002199781B0;
    goto LABEL_11;
  }
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (*(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a1)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v4 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 8 * a1 + 0x20);
  swift_unknownObjectRetain();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return v4;
  _StringGuts.grow(_:)(82);
  v5 = 0x8000000219978160;
  v6 = 0xD000000000000043;
LABEL_11:
  String.append(_:)(*(Swift::String *)&v6);
  v8._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 0x756F662074756220;
  v9._object = (void *)0xEB0000000020646ELL;
  String.append(_:)(v9);
  swift_getObjectType();
  swift_unknownObjectRelease();
  v10._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v10);
  swift_bridgeObjectRelease();
  result = _assertionFailure(_:_:flags:)();
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x219A35184]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t MLCInferenceGraph.execute(inputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;

  v7[17] = a6;
  v7[18] = v6;
  v7[15] = a4;
  v7[16] = a5;
  v7[13] = a2;
  v7[14] = a3;
  v7[12] = a1;
  return swift_task_switch();
}

uint64_t MLCInferenceGraph.execute(inputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:)()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  objc_class *v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = v0[17];
  v1 = (void *)v0[18];
  v4 = (objc_class *)v0[15];
  v3 = v0[16];
  v6 = (objc_class *)v0[13];
  v5 = (objc_class *)v0[14];
  v7 = v0[12];
  v0[7] = v0 + 10;
  v0[2] = v0;
  v0[3] = MLCInferenceGraph.execute(inputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:);
  v8 = swift_continuation_init();
  closure #1 in MLCInferenceGraph.execute(inputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:)(v8, v1, v7, v6, v5, v4, v3, v2);
  return swift_continuation_await();
}

{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  if (!*(_QWORD *)(v1 + 48))
    return (*(uint64_t (**)(_QWORD, double))(v1 + 8))(*(_QWORD *)(v1 + 80), *(double *)(v1 + 88));
  swift_willThrow();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

void closure #1 in MLCInferenceGraph.execute(inputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:)(uint64_t a1, void *a2, uint64_t a3, Class isa, Class a5, Class a6, uint64_t a7, uint64_t a8)
{
  NSDictionary v15;
  uint64_t v16;
  void *v17;
  _QWORD aBlock[6];

  type metadata accessor for MLCTensorData();
  v15.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  if (isa)
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
  if (a5)
    a5 = Dictionary._bridgeToObjectiveC()().super.isa;
  if (a6)
    a6 = Dictionary._bridgeToObjectiveC()().super.isa;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a1;
  aBlock[4] = partial apply for closure #1 in closure #1 in MLCInferenceGraph.execute(inputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:);
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed MLCTensor?, @guaranteed Error?, @unowned Double) -> ();
  aBlock[3] = &block_descriptor;
  v17 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_executeWithInputsData_lossLabelsData_lossLabelWeightsData_outputsData_batchSize_options_completionHandler_, v15.super.isa, isa, a5, a6, a7, a8, v17);
  _Block_release(v17);

}

unint64_t type metadata accessor for MLCTensorData()
{
  unint64_t result;

  result = lazy cache variable for type metadata for MLCTensorData;
  if (!lazy cache variable for type metadata for MLCTensorData)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for MLCTensorData);
  }
  return result;
}

uint64_t closure #1 in closure #1 in MLCInferenceGraph.execute(inputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:)(void *a1, void *a2, uint64_t a3, double a4)
{
  _QWORD *v5;
  id v6;
  uint64_t v8;
  id v9;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    swift_allocError();
    *v5 = a2;
    v6 = a2;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a3 + 64) + 40);
    *(_QWORD *)v8 = a1;
    *(double *)(v8 + 8) = a4;
    v9 = a1;
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_219974F7C()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in MLCInferenceGraph.execute(inputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:)(void *a1, void *a2, double a3)
{
  uint64_t v3;

  return closure #1 in closure #1 in MLCInferenceGraph.execute(inputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:)(a1, a2, *(_QWORD *)(v3 + 16), a3);
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

void thunk for @escaping @callee_guaranteed (@guaranteed MLCTensor?, @guaranteed Error?, @unowned Double) -> ()(uint64_t a1, void *a2, void *a3, double a4)
{
  void (*v7)(void *, void *, double);
  id v8;
  id v9;

  v7 = *(void (**)(void *, void *, double))(a1 + 32);
  swift_retain();
  v9 = a2;
  v8 = a3;
  v7(a2, a3, a4);
  swift_release();

}

uint64_t MLCTrainingGraph.executeForward(batchSize:options:outputsData:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[20] = a3;
  v4[21] = v3;
  v4[18] = a1;
  v4[19] = a2;
  return swift_task_switch();
}

uint64_t MLCTrainingGraph.executeForward(batchSize:options:outputsData:)()
{
  _QWORD *v0;
  Class isa;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;

  isa = (Class)v0[20];
  v0[7] = v0 + 16;
  v0[2] = v0;
  v0[3] = MLCTrainingGraph.executeForward(batchSize:options:outputsData:);
  v2 = swift_continuation_init();
  if (isa)
  {
    type metadata accessor for MLCTensorData();
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  v3 = (void *)v0[21];
  v5 = v0[18];
  v4 = v0[19];
  v6 = swift_allocObject();
  v0[10] = MEMORY[0x24BDAC760];
  v7 = v0 + 10;
  *(_QWORD *)(v6 + 16) = v2;
  v7[4] = partial apply for closure #1 in closure #1 in MLCInferenceGraph.execute(inputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:);
  v7[5] = v6;
  v7[1] = 1107296256;
  v7[2] = thunk for @escaping @callee_guaranteed (@guaranteed MLCTensor?, @guaranteed Error?, @unowned Double) -> ();
  v7[3] = &block_descriptor_0;
  v8 = _Block_copy(v7);
  swift_release();
  objc_msgSend(v3, sel_executeForwardWithBatchSize_options_outputsData_completionHandler_, v5, v4, isa, v8);
  _Block_release(v8);

  return swift_continuation_await();
}

{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  if (!*(_QWORD *)(v1 + 48))
    return (*(uint64_t (**)(_QWORD, double))(v1 + 8))(*(_QWORD *)(v1 + 128), *(double *)(v1 + 136));
  swift_willThrow();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2199751EC()
{
  return swift_deallocObject();
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

uint64_t MLCTrainingGraph.executeGradient(batchSize:options:outputsData:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[19] = a3;
  v4[20] = v3;
  v4[17] = a1;
  v4[18] = a2;
  return swift_task_switch();
}

uint64_t MLCTrainingGraph.executeGradient(batchSize:options:outputsData:)()
{
  _QWORD *v0;
  Class isa;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;

  isa = (Class)v0[19];
  v0[7] = v0 + 16;
  v0[2] = v0;
  v0[3] = MLCTrainingGraph.executeGradient(batchSize:options:outputsData:);
  v2 = swift_continuation_init();
  if (isa)
  {
    type metadata accessor for MLCTensorData();
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  v3 = (void *)v0[20];
  v5 = v0[17];
  v4 = v0[18];
  v6 = swift_allocObject();
  v0[10] = MEMORY[0x24BDAC760];
  v7 = v0 + 10;
  *(_QWORD *)(v6 + 16) = v2;
  v7[4] = partial apply for closure #1 in closure #1 in MLCTrainingGraph.executeGradient(batchSize:options:outputsData:);
  v7[5] = v6;
  v7[1] = 1107296256;
  v7[2] = thunk for @escaping @callee_guaranteed (@guaranteed MLCTensor?, @guaranteed Error?, @unowned Double) -> ();
  v7[3] = &block_descriptor_7;
  v8 = _Block_copy(v7);
  swift_release();
  objc_msgSend(v3, sel_executeGradientWithBatchSize_options_outputsData_completionHandler_, v5, v4, isa, v8);
  _Block_release(v8);

  return swift_continuation_await();
}

uint64_t MLCTrainingGraph.executeGradient(batchSize:options:outputsData:)(__n128 a1)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  if (*(_QWORD *)(v2 + 48))
    swift_willThrow();
  else
    a1.n128_u64[0] = *(_QWORD *)(v2 + 128);
  return (*(uint64_t (**)(__n128))(v2 + 8))(a1);
}

uint64_t sub_2199753B8()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in MLCTrainingGraph.executeGradient(batchSize:options:outputsData:)(uint64_t a1, void *a2, double a3)
{
  uint64_t v3;

  return closure #1 in closure #1 in MLCTrainingGraph.executeGradient(batchSize:options:outputsData:)(a3, a1, a2, *(_QWORD *)(v3 + 16));
}

uint64_t MLCTrainingGraph.executeOptimizerUpdate(options:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 136) = a1;
  *(_QWORD *)(v2 + 144) = v1;
  return swift_task_switch();
}

uint64_t MLCTrainingGraph.executeOptimizerUpdate(options:)()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;

  v2 = v0[17];
  v1 = (void *)v0[18];
  v0[7] = v0 + 16;
  v0[2] = v0;
  v0[3] = MLCTrainingGraph.executeGradient(batchSize:options:outputsData:);
  v3 = swift_continuation_init();
  v4 = swift_allocObject();
  v0[10] = MEMORY[0x24BDAC760];
  v5 = v0 + 10;
  *(_QWORD *)(v4 + 16) = v3;
  v5[4] = partial apply for closure #1 in closure #1 in MLCTrainingGraph.executeOptimizerUpdate(options:);
  v5[5] = v4;
  v5[1] = 1107296256;
  v5[2] = thunk for @escaping @callee_guaranteed (@guaranteed MLCTensor?, @guaranteed Error?, @unowned Double) -> ();
  v5[3] = &block_descriptor_14;
  v6 = _Block_copy(v5);
  swift_release();
  objc_msgSend(v1, sel_executeOptimizerUpdateWithOptions_completionHandler_, v2, v6);
  _Block_release(v6);
  return swift_continuation_await();
}

uint64_t closure #1 in closure #1 in MLCTrainingGraph.executeGradient(batchSize:options:outputsData:)(double a1, uint64_t a2, void *a3, uint64_t a4)
{
  _QWORD *v5;
  id v6;

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
    **(double **)(*(_QWORD *)(a4 + 64) + 40) = a1;
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_21997555C()
{
  return swift_deallocObject();
}

uint64_t MLCSplitLayer.splitSectionLengths.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;

  v1 = objc_msgSend(v0, sel_splitSectionLengths);
  if (!v1)
    return (uint64_t)v1;
  type metadata accessor for NSNumber();
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62)
    goto LABEL_16;
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v3)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  while (1)
  {
    v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
    result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
    if (v3 < 0)
      break;
    v5 = 0;
    v1 = v12;
    while (v3 != v5)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v2);
      else
        v6 = *(id *)(v2 + 8 * v5 + 32);
      v7 = v6;
      result = Int.init(exactly:)();
      if ((v8 & 1) != 0)
        goto LABEL_20;
      v9 = result;

      v11 = v12[2];
      v10 = v12[3];
      if (v11 >= v10 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1);
      ++v5;
      v12[2] = v11 + 1;
      v12[v11 + 4] = v9;
      if (v3 == v5)
      {
        swift_bridgeObjectRelease();
        return (uint64_t)v1;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v3)
      goto LABEL_17;
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

MLCSplitLayer __swiftcall MLCSplitLayer.init(splitSectionLengths:dimension:)(Swift::OpaquePointer splitSectionLengths, Swift::Int dimension)
{
  void *ObjCClassFromMetadata;
  Class isa;
  id v6;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)splitSectionLengths._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(ObjCClassFromMetadata, sel_layerWithSplitSectionLengths_dimension_, isa, dimension);

  return (MLCSplitLayer)v6;
}

uint64_t MLCUpsampleLayer.shape.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v1 = objc_msgSend(v0, sel_shape);
  type metadata accessor for NSNumber();
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62)
    goto LABEL_15;
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      v13 = MEMORY[0x24BEE4AF8];
      result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
      if (v3 < 0)
        break;
      v5 = 0;
      v6 = v13;
      while (v3 != v5)
      {
        if ((v2 & 0xC000000000000001) != 0)
          v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v2);
        else
          v7 = *(id *)(v2 + 8 * v5 + 32);
        v8 = v7;
        result = Int.init(exactly:)();
        if ((v9 & 1) != 0)
          goto LABEL_19;
        v10 = result;

        v12 = *(_QWORD *)(v13 + 16);
        v11 = *(_QWORD *)(v13 + 24);
        if (v12 >= v11 >> 1)
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
        ++v5;
        *(_QWORD *)(v13 + 16) = v12 + 1;
        *(_QWORD *)(v13 + 8 * v12 + 32) = v10;
        if (v3 == v5)
        {
          swift_bridgeObjectRelease();
          return v6;
        }
      }
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
      v3 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v3)
        goto LABEL_16;
    }
    __break(1u);
LABEL_19:
    __break(1u);
  }
  else
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

MLCUpsampleLayer_optional __swiftcall MLCUpsampleLayer.init(shape:)(Swift::OpaquePointer shape)
{
  void *ObjCClassFromMetadata;
  Class isa;
  objc_class *v4;
  Swift::Bool v5;
  objc_class *v6;
  MLCUpsampleLayer_optional result;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)shape._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v4 = (objc_class *)objc_msgSend(ObjCClassFromMetadata, sel_layerWithShape_, isa);

  v6 = v4;
  result.value.super.super.isa = v6;
  result.is_nil = v5;
  return result;
}

MLCUpsampleLayer_optional __swiftcall MLCUpsampleLayer.init(shape:sampleMode:alignsCorners:)(Swift::OpaquePointer shape, MLCSampleMode sampleMode, Swift::Bool alignsCorners)
{
  uint64_t v4;
  void *ObjCClassFromMetadata;
  Class isa;
  objc_class *v8;
  Swift::Bool v9;
  objc_class *v10;
  MLCUpsampleLayer_optional result;

  v4 = *(_QWORD *)&sampleMode;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)shape._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v8 = (objc_class *)objc_msgSend(ObjCClassFromMetadata, sel_layerWithShape_sampleMode_alignsCorners_, isa, v4, alignsCorners);

  v10 = v8;
  result.value.super.super.isa = v10;
  result.is_nil = v9;
  return result;
}

uint64_t MLCSliceLayer.start.getter()
{
  return MLCSliceLayer.start.getter((SEL *)&selRef_start);
}

uint64_t MLCSliceLayer.end.getter()
{
  return MLCSliceLayer.start.getter((SEL *)&selRef_end);
}

uint64_t MLCSliceLayer.start.getter(SEL *a1)
{
  void *v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  unint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v2 = objc_msgSend(v1, *a1);
  type metadata accessor for NSNumber();
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v3 >> 62)
    goto LABEL_15;
  v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      v14 = MEMORY[0x24BEE4AF8];
      result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4 & ~(v4 >> 63), 0);
      if (v4 < 0)
        break;
      v6 = 0;
      v7 = v14;
      while (v4 != v6)
      {
        if ((v3 & 0xC000000000000001) != 0)
          v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v3);
        else
          v8 = *(id *)(v3 + 8 * v6 + 32);
        v9 = v8;
        result = Int.init(exactly:)();
        if ((v10 & 1) != 0)
          goto LABEL_19;
        v11 = result;

        v13 = *(_QWORD *)(v14 + 16);
        v12 = *(_QWORD *)(v14 + 24);
        if (v13 >= v12 >> 1)
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v12 > 1), v13 + 1, 1);
        ++v6;
        *(_QWORD *)(v14 + 16) = v13 + 1;
        *(_QWORD *)(v14 + 8 * v13 + 32) = v11;
        if (v4 == v6)
        {
          swift_bridgeObjectRelease();
          return v7;
        }
      }
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
      v4 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v4)
        goto LABEL_16;
    }
    __break(1u);
LABEL_19:
    __break(1u);
  }
  else
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t MLCSliceLayer.stride.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;

  v1 = objc_msgSend(v0, sel_stride);
  if (!v1)
    return (uint64_t)v1;
  type metadata accessor for NSNumber();
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62)
    goto LABEL_16;
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v3)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  while (1)
  {
    v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
    result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
    if (v3 < 0)
      break;
    v5 = 0;
    v1 = v12;
    while (v3 != v5)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v2);
      else
        v6 = *(id *)(v2 + 8 * v5 + 32);
      v7 = v6;
      result = Int.init(exactly:)();
      if ((v8 & 1) != 0)
        goto LABEL_20;
      v9 = result;

      v11 = v12[2];
      v10 = v12[3];
      if (v11 >= v10 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1);
      ++v5;
      v12[2] = v11 + 1;
      v12[v11 + 4] = v9;
      if (v3 == v5)
      {
        swift_bridgeObjectRelease();
        return (uint64_t)v1;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v3)
      goto LABEL_17;
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

MLCSliceLayer_optional __swiftcall MLCSliceLayer.init(start:end:stride:)(Swift::OpaquePointer start, Swift::OpaquePointer end, Swift::OpaquePointer_optional stride)
{
  void *rawValue;
  NSArray v5;
  NSArray v6;
  objc_class *v7;
  Swift::Bool v8;
  objc_class *v9;
  MLCSliceLayer_optional result;

  rawValue = stride.value._rawValue;
  specialized _arrayForceCast<A, B>(_:)((uint64_t)start._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)end._rawValue);
  swift_bridgeObjectRelease();
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  if (rawValue)
  {
    specialized _arrayForceCast<A, B>(_:)((uint64_t)rawValue);
    swift_bridgeObjectRelease();
    rawValue = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  v7 = (objc_class *)objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sliceLayerWithStart_end_stride_, v5.super.isa, v6.super.isa, rawValue);

  v9 = v7;
  result.value.super.super.isa = v9;
  result.is_nil = v8;
  return result;
}

id MLCConvolutionDescriptor.kernelSizes.getter()
{
  return MLCConvolutionDescriptor.kernelSizes.getter((SEL *)&selRef_kernelHeight, (SEL *)&selRef_kernelWidth);
}

id MLCConvolutionDescriptor.strides.getter()
{
  return MLCConvolutionDescriptor.kernelSizes.getter((SEL *)&selRef_strideInY, (SEL *)&selRef_strideInX);
}

id MLCConvolutionDescriptor.dilationRates.getter()
{
  return MLCConvolutionDescriptor.kernelSizes.getter((SEL *)&selRef_dilationRateInY, (SEL *)&selRef_dilationRateInX);
}

id MLCConvolutionDescriptor.kernelSizes.getter(SEL *a1, SEL *a2)
{
  void *v2;
  id v4;

  v4 = objc_msgSend(v2, *a1);
  objc_msgSend(v2, *a2);
  return v4;
}

id MLCConvolutionDescriptor.paddingPolicy.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id result;
  id v4;

  result = objc_msgSend(v1, sel_paddingPolicy);
  switch((_DWORD)result)
  {
    case 2:
      v4 = objc_msgSend(v1, sel_paddingSizeInY);
      result = objc_msgSend(v1, sel_paddingSizeInX);
      *(_QWORD *)a1 = v4;
      *(_QWORD *)(a1 + 8) = result;
      *(_BYTE *)(a1 + 16) = 0;
      return result;
    case 1:
      *(_OWORD *)a1 = xmmword_2199780C0;
LABEL_7:
      *(_BYTE *)(a1 + 16) = 1;
      return result;
    case 0:
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
      goto LABEL_7;
  }
  result = (id)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id MLCConvolutionDescriptor.init(type:kernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strides:dilationRates:paddingPolicy:)(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v12;
  NSArray v13;
  uint64_t v14;
  NSArray v15;
  uint64_t v16;
  NSArray v17;
  int v18;
  NSArray v19;
  id v20;
  uint64_t v22;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_2199780D0;
  *(NSNumber *)(v12 + 32) = Int._bridgeToObjectiveC()();
  *(NSNumber *)(v12 + 40) = Int._bridgeToObjectiveC()();
  type metadata accessor for NSNumber();
  v13.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_2199780D0;
  *(NSNumber *)(v14 + 32) = Int._bridgeToObjectiveC()();
  *(NSNumber *)(v14 + 40) = Int._bridgeToObjectiveC()();
  v15.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_2199780D0;
  *(NSNumber *)(v16 + 32) = Int._bridgeToObjectiveC()();
  *(NSNumber *)(v16 + 40) = Int._bridgeToObjectiveC()();
  v17.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  if (*(_BYTE *)(a11 + 16) == 1)
    v18 = *(_OWORD *)a11 != 0;
  else
    v18 = 2;
  if (MLCPaddingPolicy.objcSizes.getter())
  {
    v19.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v19.super.isa = 0;
  }
  LODWORD(v22) = v18;
  v20 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_descriptorWithType_kernelSizes_inputFeatureChannelCount_outputFeatureChannelCount_groupCount_strides_dilationRates_paddingPolicy_paddingSizes_, a1, v13.super.isa, a4, a5, a6, v15.super.isa, v17.super.isa, v22, v19.super.isa);

  return v20;
}

uint64_t MLCReductionLayer.dimensions.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v1 = objc_msgSend(v0, sel_dimensions);
  type metadata accessor for NSNumber();
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62)
    goto LABEL_15;
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      v13 = MEMORY[0x24BEE4AF8];
      result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
      if (v3 < 0)
        break;
      v5 = 0;
      v6 = v13;
      while (v3 != v5)
      {
        if ((v2 & 0xC000000000000001) != 0)
          v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v2);
        else
          v7 = *(id *)(v2 + 8 * v5 + 32);
        v8 = v7;
        result = Int.init(exactly:)();
        if ((v9 & 1) != 0)
          goto LABEL_19;
        v10 = result;

        v12 = *(_QWORD *)(v13 + 16);
        v11 = *(_QWORD *)(v13 + 24);
        if (v12 >= v11 >> 1)
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
        ++v5;
        *(_QWORD *)(v13 + 16) = v12 + 1;
        *(_QWORD *)(v13 + 8 * v12 + 32) = v10;
        if (v3 == v5)
        {
          swift_bridgeObjectRelease();
          return v6;
        }
      }
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
      v3 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v3)
        goto LABEL_16;
    }
    __break(1u);
LABEL_19:
    __break(1u);
  }
  else
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

MLCReductionLayer_optional __swiftcall MLCReductionLayer.init(reductionType:dimensions:)(MLCReductionType reductionType, Swift::OpaquePointer dimensions)
{
  uint64_t v3;
  void *ObjCClassFromMetadata;
  Class isa;
  objc_class *v6;
  Swift::Bool v7;
  objc_class *v8;
  MLCReductionLayer_optional result;

  v3 = *(_QWORD *)&reductionType;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)dimensions._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v6 = (objc_class *)objc_msgSend(ObjCClassFromMetadata, sel_layerWithReductionType_dimensions_, v3, isa);

  v8 = v6;
  result.value.super.super.isa = v8;
  result.is_nil = v7;
  return result;
}

uint64_t MLCTransposeLayer.dimensions.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v1 = objc_msgSend(v0, sel_dimensions);
  type metadata accessor for NSNumber();
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62)
    goto LABEL_15;
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      v13 = MEMORY[0x24BEE4AF8];
      result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
      if (v3 < 0)
        break;
      v5 = 0;
      v6 = v13;
      while (v3 != v5)
      {
        if ((v2 & 0xC000000000000001) != 0)
          v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v2);
        else
          v7 = *(id *)(v2 + 8 * v5 + 32);
        v8 = v7;
        result = Int.init(exactly:)();
        if ((v9 & 1) != 0)
          goto LABEL_19;
        v10 = result;

        v12 = *(_QWORD *)(v13 + 16);
        v11 = *(_QWORD *)(v13 + 24);
        if (v12 >= v11 >> 1)
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
        ++v5;
        *(_QWORD *)(v13 + 16) = v12 + 1;
        *(_QWORD *)(v13 + 8 * v12 + 32) = v10;
        if (v3 == v5)
        {
          swift_bridgeObjectRelease();
          return v6;
        }
      }
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
      v3 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v3)
        goto LABEL_16;
    }
    __break(1u);
LABEL_19:
    __break(1u);
  }
  else
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

MLCTransposeLayer_optional __swiftcall MLCTransposeLayer.init(dimensions:)(Swift::OpaquePointer dimensions)
{
  void *ObjCClassFromMetadata;
  Class isa;
  objc_class *v4;
  Swift::Bool v5;
  objc_class *v6;
  MLCTransposeLayer_optional result;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)dimensions._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v4 = (objc_class *)objc_msgSend(ObjCClassFromMetadata, sel_layerWithDimensions_, isa);

  v6 = v4;
  result.value.super.super.isa = v6;
  result.is_nil = v5;
  return result;
}

uint64_t MLCPaddingPolicy.objcPolicy.getter()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 16) == 1)
    return *(_OWORD *)v0 != 0;
  else
    return 2;
}

uint64_t MLCPaddingPolicy.objcSizes.getter()
{
  uint64_t v0;
  uint64_t v1;

  if ((*(_BYTE *)(v0 + 16) & 1) != 0)
    return 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_2199780D0;
  *(NSNumber *)(v1 + 32) = Int._bridgeToObjectiveC()();
  *(NSNumber *)(v1 + 40) = Int._bridgeToObjectiveC()();
  return v1;
}

uint64_t MLCPaddingPolicy.debugDescription.getter()
{
  uint64_t v0;
  int v1;
  MLCPaddingPolicy v2;
  NSString *v3;
  uint64_t v4;
  Swift::String v5;
  Swift::String v6;
  Swift::String v7;
  Swift::String v8;
  Swift::String v9;

  v1 = *(unsigned __int8 *)(v0 + 16);
  if (v1 == 1)
    v2 = *(_OWORD *)v0 != 0;
  else
    v2 = MLCPaddingPolicyUsePaddingSize;
  v3 = MLCPaddingPolicyDebugDescription(v2);
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  if ((v1 & 1) == 0)
  {
    v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v5);
    swift_bridgeObjectRelease();
    v6._countAndFlagsBits = 0x203A78202CLL;
    v6._object = (void *)0xE500000000000000;
    String.append(_:)(v6);
    v7._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v7);
    swift_bridgeObjectRelease();
    v8._countAndFlagsBits = 41;
    v8._object = (void *)0xE100000000000000;
    String.append(_:)(v8);
    swift_bridgeObjectRetain();
    v9._countAndFlagsBits = 0x203A792820;
    v9._object = (void *)0xE500000000000000;
    String.append(_:)(v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for MLCPaddingPolicy(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for MLCPaddingPolicy(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 16) = 0;
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
  *(_BYTE *)(result + 17) = v3;
  return result;
}

uint64_t getEnumTag for MLCPaddingPolicy(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t destructiveInjectEnumTag for MLCPaddingPolicy(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    *(_BYTE *)(result + 16) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for MLCPaddingPolicy()
{
  return &type metadata for MLCPaddingPolicy;
}

MLCTensor __swiftcall MLCTensor.init(shape:)(Swift::OpaquePointer shape)
{
  void *ObjCClassFromMetadata;
  Class isa;
  id v4;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)shape._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(ObjCClassFromMetadata, sel_tensorWithShape_, isa);

  return (MLCTensor)v4;
}

MLCTensor __swiftcall MLCTensor.init(shape:randomInitializerType:)(Swift::OpaquePointer shape, MLCRandomInitializerType randomInitializerType)
{
  return (MLCTensor)MLCTensor.init(shape:randomInitializerType:)((uint64_t)shape._rawValue, *(uint64_t *)&randomInitializerType, (SEL *)&selRef_tensorWithShape_randomInitializerType_);
}

MLCTensor __swiftcall MLCTensor.init(shape:dataType:)(Swift::OpaquePointer shape, MLCDataType dataType)
{
  return (MLCTensor)MLCTensor.init(shape:randomInitializerType:)((uint64_t)shape._rawValue, *(uint64_t *)&dataType, (SEL *)&selRef_tensorWithShape_dataType_);
}

id MLCTensor.init(shape:randomInitializerType:)(uint64_t a1, uint64_t a2, SEL *a3)
{
  void *ObjCClassFromMetadata;
  Class isa;
  id v8;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)(a1);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(ObjCClassFromMetadata, *a3, isa, a2);

  return v8;
}

MLCTensor __swiftcall MLCTensor.init(shape:data:dataType:)(Swift::OpaquePointer shape, MLCTensorData data, MLCDataType dataType)
{
  return (MLCTensor)MLCTensor.init(shape:data:dataType:)((uint64_t)shape._rawValue, data.super.isa, *(uint64_t *)&dataType, (SEL *)&selRef_tensorWithShape_data_dataType_);
}

MLCTensor __swiftcall MLCTensor.init(shape:fillWithData:dataType:)(Swift::OpaquePointer shape, NSNumber fillWithData, MLCDataType dataType)
{
  return (MLCTensor)MLCTensor.init(shape:data:dataType:)((uint64_t)shape._rawValue, fillWithData.super.super.isa, *(uint64_t *)&dataType, (SEL *)&selRef_tensorWithShape_fillWithData_dataType_);
}

id MLCTensor.init(shape:data:dataType:)(uint64_t a1, void *a2, uint64_t a3, SEL *a4)
{
  void *ObjCClassFromMetadata;
  Class isa;
  id v10;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)(a1);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(ObjCClassFromMetadata, *a4, isa, a2, a3);

  return v10;
}

MLCTensor_optional __swiftcall MLCTensor.init(sequenceLengths:sortedSequences:featureChannelCount:batchSize:randomInitializerType:)(Swift::OpaquePointer sequenceLengths, Swift::Bool sortedSequences, Swift::Int featureChannelCount, Swift::Int batchSize, MLCRandomInitializerType randomInitializerType)
{
  uint64_t v5;
  void *ObjCClassFromMetadata;
  Class isa;
  objc_class *v12;
  Swift::Bool v13;
  objc_class *v14;
  MLCTensor_optional result;

  v5 = *(_QWORD *)&randomInitializerType;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)sequenceLengths._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v12 = (objc_class *)objc_msgSend(ObjCClassFromMetadata, sel_tensorWithSequenceLengths_sortedSequences_featureChannelCount_batchSize_randomInitializerType_, isa, sortedSequences, featureChannelCount, batchSize, v5);

  v14 = v12;
  result.value.super.isa = v14;
  result.is_nil = v13;
  return result;
}

MLCTensor_optional __swiftcall MLCTensor.init(sequenceLengths:sortedSequences:featureChannelCount:batchSize:data:)(Swift::OpaquePointer sequenceLengths, Swift::Bool sortedSequences, Swift::Int featureChannelCount, Swift::Int batchSize, MLCTensorData_optional data)
{
  Class isa;
  void *ObjCClassFromMetadata;
  Class v11;
  objc_class *v12;
  Swift::Bool v13;
  objc_class *v14;
  MLCTensor_optional result;

  isa = data.value.super.isa;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)sequenceLengths._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  v11 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v12 = (objc_class *)objc_msgSend(ObjCClassFromMetadata, sel_tensorWithSequenceLengths_sortedSequences_featureChannelCount_batchSize_data_, v11, sortedSequences, featureChannelCount, batchSize, isa);

  v14 = v12;
  result.value.super.isa = v14;
  result.is_nil = v13;
  return result;
}

Swift::OpaquePointer_optional __swiftcall MLCGraph.split(source:splitSectionLengths:dimension:)(MLCTensor source, Swift::OpaquePointer splitSectionLengths, Swift::Int dimension)
{
  void *v3;
  Class isa;
  id v7;
  Swift::Bool v8;
  uint64_t v9;
  void *v10;
  Swift::OpaquePointer_optional result;

  specialized _arrayForceCast<A, B>(_:)((uint64_t)splitSectionLengths._rawValue);
  type metadata accessor for NSNumber(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v3, sel_splitWithSource_splitSectionLengths_dimension_, source.super.isa, isa, dimension);

  if (v7)
  {
    type metadata accessor for NSNumber(0, &lazy cache variable for type metadata for MLCTensor);
    v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)v9;
  result.value._rawValue = v10;
  result.is_nil = v8;
  return result;
}

uint64_t type metadata accessor for NSNumber(uint64_t a1, unint64_t *a2)
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

MLCTensor_optional __swiftcall MLCGraph.reshape(shape:source:)(Swift::OpaquePointer shape, MLCTensor source)
{
  objc_class *v2;
  Swift::Bool v3;
  MLCTensor_optional result;

  v2 = (objc_class *)MLCGraph.reshape(shape:source:)((uint64_t)shape._rawValue, (uint64_t)source.super.isa, (SEL *)&selRef_reshapeWithShape_source_);
  result.value.super.isa = v2;
  result.is_nil = v3;
  return result;
}

MLCTensor_optional __swiftcall MLCGraph.transpose(dimensions:source:)(Swift::OpaquePointer dimensions, MLCTensor source)
{
  objc_class *v2;
  Swift::Bool v3;
  MLCTensor_optional result;

  v2 = (objc_class *)MLCGraph.reshape(shape:source:)((uint64_t)dimensions._rawValue, (uint64_t)source.super.isa, (SEL *)&selRef_transposeWithDimensions_source_);
  result.value.super.isa = v2;
  result.is_nil = v3;
  return result;
}

id MLCGraph.reshape(shape:source:)(uint64_t a1, uint64_t a2, SEL *a3)
{
  void *v3;
  Class isa;
  id v7;

  specialized _arrayForceCast<A, B>(_:)(a1);
  type metadata accessor for NSNumber(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v3, *a3, isa, a2);

  return v7;
}

MLCReshapeLayer_optional __swiftcall MLCReshapeLayer.init(shape:)(Swift::OpaquePointer shape)
{
  void *ObjCClassFromMetadata;
  Class isa;
  objc_class *v4;
  Swift::Bool v5;
  objc_class *v6;
  MLCReshapeLayer_optional result;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)shape._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v4 = (objc_class *)objc_msgSend(ObjCClassFromMetadata, sel_layerWithShape_, isa);

  v6 = v4;
  result.value.super.super.isa = v6;
  result.is_nil = v5;
  return result;
}

uint64_t MLCReshapeLayer.shape.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v1 = objc_msgSend(v0, sel_shape);
  type metadata accessor for NSNumber();
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62)
    goto LABEL_15;
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      v13 = MEMORY[0x24BEE4AF8];
      result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
      if (v3 < 0)
        break;
      v5 = 0;
      v6 = v13;
      while (v3 != v5)
      {
        if ((v2 & 0xC000000000000001) != 0)
          v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v2);
        else
          v7 = *(id *)(v2 + 8 * v5 + 32);
        v8 = v7;
        result = Int.init(exactly:)();
        if ((v9 & 1) != 0)
          goto LABEL_19;
        v10 = result;

        v12 = *(_QWORD *)(v13 + 16);
        v11 = *(_QWORD *)(v13 + 24);
        if (v12 >= v11 >> 1)
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
        ++v5;
        *(_QWORD *)(v13 + 16) = v12 + 1;
        *(_QWORD *)(v13 + 8 * v12 + 32) = v10;
        if (v3 == v5)
        {
          swift_bridgeObjectRelease();
          return v6;
        }
      }
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
      v3 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v3)
        goto LABEL_16;
    }
    __break(1u);
LABEL_19:
    __break(1u);
  }
  else
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t MLCTensorDescriptor.shape.getter()
{
  return MLCSliceLayer.start.getter((SEL *)&selRef_shape);
}

uint64_t MLCTensorDescriptor.stride.getter()
{
  return MLCSliceLayer.start.getter((SEL *)&selRef_stride);
}

uint64_t MLCTensorDescriptor.sequenceLengths.getter()
{
  return MLCTensorDescriptor.sequenceLengths.getter((SEL *)&selRef_sequenceLengths);
}

uint64_t MLCTensorDescriptor.batchSizePerSequenceStep.getter()
{
  return MLCTensorDescriptor.sequenceLengths.getter((SEL *)&selRef_batchSizePerSequenceStep);
}

uint64_t MLCTensorDescriptor.sequenceLengths.getter(SEL *a1)
{
  void *v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  unint64_t v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;

  v2 = objc_msgSend(v1, *a1);
  if (!v2)
    return (uint64_t)v2;
  type metadata accessor for NSNumber();
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v3 >> 62)
    goto LABEL_16;
  v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  while (1)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4 & ~(v4 >> 63), 0);
    if (v4 < 0)
      break;
    v6 = 0;
    v2 = v13;
    while (v4 != v6)
    {
      if ((v3 & 0xC000000000000001) != 0)
        v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v3);
      else
        v7 = *(id *)(v3 + 8 * v6 + 32);
      v8 = v7;
      result = Int.init(exactly:)();
      if ((v9 & 1) != 0)
        goto LABEL_20;
      v10 = result;

      v12 = v13[2];
      v11 = v13[3];
      if (v12 >= v11 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
      ++v6;
      v13[2] = v12 + 1;
      v13[v12 + 4] = v10;
      if (v4 == v6)
      {
        swift_bridgeObjectRelease();
        return (uint64_t)v2;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    v4 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v4)
      goto LABEL_17;
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

MLCTensorDescriptor_optional __swiftcall MLCTensorDescriptor.init(shape:dataType:)(Swift::OpaquePointer shape, MLCDataType dataType)
{
  uint64_t v2;
  void *ObjCClassFromMetadata;
  Class isa;
  objc_class *v6;
  Swift::Bool v7;
  objc_class *v8;
  MLCTensorDescriptor_optional result;

  v2 = *(_QWORD *)&dataType;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)shape._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v6 = (objc_class *)objc_msgSend(ObjCClassFromMetadata, sel_descriptorWithShape_dataType_, isa, v2);

  v8 = v6;
  result.value.super.isa = v8;
  result.is_nil = v7;
  return result;
}

MLCTensorDescriptor_optional __swiftcall MLCTensorDescriptor.init(shape:sequenceLengths:sortedSequences:dataType:)(Swift::OpaquePointer shape, Swift::OpaquePointer sequenceLengths, Swift::Bool sortedSequences, MLCDataType dataType)
{
  uint64_t v4;
  void *ObjCClassFromMetadata;
  Class isa;
  Class v10;
  objc_class *v11;
  Swift::Bool v12;
  objc_class *v13;
  MLCTensorDescriptor_optional result;

  v4 = *(_QWORD *)&dataType;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)shape._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)sequenceLengths._rawValue);
  swift_bridgeObjectRelease();
  v10 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v11 = (objc_class *)objc_msgSend(ObjCClassFromMetadata, sel_descriptorWithShape_sequenceLengths_sortedSequences_dataType_, isa, v10, sortedSequences, v4);

  v13 = v11;
  result.value.super.isa = v13;
  result.is_nil = v12;
  return result;
}

uint64_t MLCPoolingType.objcPoolingType.getter()
{
  unsigned __int8 *v0;
  int v1;
  unsigned int v2;

  v1 = *v0;
  if (v1 == 3)
    v2 = 3;
  else
    v2 = 2;
  if (v1 == 2)
    return 1;
  else
    return v2;
}

uint64_t MLCPoolingType.debugDescription.getter()
{
  unsigned __int8 *v0;
  int v1;
  int v2;
  MLCPoolingType v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  Swift::String v9;
  Swift::String v10;

  v1 = *v0;
  if (v1 == 3)
    v2 = 3;
  else
    v2 = 2;
  if (v1 == 2)
    v3 = MLCPoolingTypeMax;
  else
    v3 = v2;
  v4 = MLCPoolingTypeDebugDescription(v3);
  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  if ((v1 & 0xFE) != 2)
  {
    _StringGuts.grow(_:)(28);
    swift_bridgeObjectRelease();
    if ((v1 & 1) != 0)
      v6 = 1702195828;
    else
      v6 = 0x65736C6166;
    if ((v1 & 1) != 0)
      v7 = 0xE400000000000000;
    else
      v7 = 0xE500000000000000;
    v8 = v7;
    String.append(_:)(*(Swift::String *)&v6);
    swift_bridgeObjectRelease();
    v9._countAndFlagsBits = 41;
    v9._object = (void *)0xE100000000000000;
    String.append(_:)(v9);
    swift_bridgeObjectRetain();
    v10._countAndFlagsBits = 0xD000000000000019;
    v10._object = (void *)0x80000002199782C0;
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t MLCPoolingDescriptor.poolingType.getter@<X0>(_BYTE *a1@<X8>)
{
  void *v1;
  uint64_t result;

  result = (uint64_t)objc_msgSend(v1, sel_poolingType);
  switch((_DWORD)result)
  {
    case 1:
      result = 2;
      goto LABEL_6;
    case 3:
LABEL_6:
      *a1 = result;
      return result;
    case 2:
      result = (uint64_t)objc_msgSend(v1, sel_countIncludesPadding);
      goto LABEL_6;
  }
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id MLCPoolingDescriptor.kernelSizes.getter()
{
  return MLCConvolutionDescriptor.kernelSizes.getter((SEL *)&selRef_kernelHeight, (SEL *)&selRef_kernelWidth);
}

id MLCPoolingDescriptor.strides.getter()
{
  return MLCConvolutionDescriptor.kernelSizes.getter((SEL *)&selRef_strideInY, (SEL *)&selRef_strideInX);
}

id MLCPoolingDescriptor.dilationRates.getter()
{
  return MLCConvolutionDescriptor.kernelSizes.getter((SEL *)&selRef_dilationRateInY, (SEL *)&selRef_dilationRateInX);
}

id MLCPoolingDescriptor.paddingPolicy.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id result;
  id v4;

  result = objc_msgSend(v1, sel_paddingPolicy);
  switch((_DWORD)result)
  {
    case 2:
      v4 = objc_msgSend(v1, sel_paddingSizeInY);
      result = objc_msgSend(v1, sel_paddingSizeInX);
      *(_QWORD *)a1 = v4;
      *(_QWORD *)(a1 + 8) = result;
      *(_BYTE *)(a1 + 16) = 0;
      return result;
    case 1:
      *(_OWORD *)a1 = xmmword_2199780C0;
LABEL_7:
      *(_BYTE *)(a1 + 16) = 1;
      return result;
    case 0:
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
      goto LABEL_7;
  }
  result = (id)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id MLCPoolingDescriptor.init(type:kernelSizes:strides:dilationRates:paddingPolicy:)(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  uint64_t v10;
  NSArray v11;
  uint64_t v12;
  NSArray v13;
  uint64_t v14;
  NSArray v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSArray v25;
  id v26;
  id v27;
  uint64_t v29;
  uint64_t v30;

  v9 = *a1;
  if (v9 == 3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_2199780D0;
    *(NSNumber *)(v17 + 32) = Int._bridgeToObjectiveC()();
    *(NSNumber *)(v17 + 40) = Int._bridgeToObjectiveC()();
    type metadata accessor for NSNumber();
    v11.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_2199780D0;
    *(NSNumber *)(v18 + 32) = Int._bridgeToObjectiveC()();
    *(NSNumber *)(v18 + 40) = Int._bridgeToObjectiveC()();
    v13.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_2199780D0;
    *(NSNumber *)(v19 + 32) = Int._bridgeToObjectiveC()();
    *(NSNumber *)(v19 + 40) = Int._bridgeToObjectiveC()();
    v15.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    if (*(_BYTE *)(a8 + 16) == 1)
      v20 = *(_OWORD *)a8 != 0;
    else
      v20 = 2;
    if (MLCPaddingPolicy.objcSizes.getter())
    {
      v25.super.isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
    }
    else
    {
      v25.super.isa = 0;
    }
    v26 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_l2NormPoolingDescriptorWithKernelSizes_strides_dilationRates_paddingPolicy_paddingSizes_, v11.super.isa, v13.super.isa, v15.super.isa, v20, v25.super.isa, v29, v30);
  }
  else if (v9 == 2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_2199780D0;
    *(NSNumber *)(v10 + 32) = Int._bridgeToObjectiveC()();
    *(NSNumber *)(v10 + 40) = Int._bridgeToObjectiveC()();
    type metadata accessor for NSNumber();
    v11.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_2199780D0;
    *(NSNumber *)(v12 + 32) = Int._bridgeToObjectiveC()();
    *(NSNumber *)(v12 + 40) = Int._bridgeToObjectiveC()();
    v13.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_2199780D0;
    *(NSNumber *)(v14 + 32) = Int._bridgeToObjectiveC()();
    *(NSNumber *)(v14 + 40) = Int._bridgeToObjectiveC()();
    v15.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    if (*(_BYTE *)(a8 + 16) == 1)
      v16 = *(_OWORD *)a8 != 0;
    else
      v16 = 2;
    if (MLCPaddingPolicy.objcSizes.getter())
    {
      v25.super.isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
    }
    else
    {
      v25.super.isa = 0;
    }
    v26 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_maxPoolingDescriptorWithKernelSizes_strides_dilationRates_paddingPolicy_paddingSizes_, v11.super.isa, v13.super.isa, v15.super.isa, v16, v25.super.isa, 2, 5);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_2199780D0;
    *(NSNumber *)(v21 + 32) = Int._bridgeToObjectiveC()();
    *(NSNumber *)(v21 + 40) = Int._bridgeToObjectiveC()();
    type metadata accessor for NSNumber();
    v11.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_2199780D0;
    *(NSNumber *)(v22 + 32) = Int._bridgeToObjectiveC()();
    *(NSNumber *)(v22 + 40) = Int._bridgeToObjectiveC()();
    v13.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_2199780D0;
    *(NSNumber *)(v23 + 32) = Int._bridgeToObjectiveC()();
    *(NSNumber *)(v23 + 40) = Int._bridgeToObjectiveC()();
    v15.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    if (*(_BYTE *)(a8 + 16) == 1)
      v24 = *(_OWORD *)a8 != 0;
    else
      v24 = 2;
    if (MLCPaddingPolicy.objcSizes.getter())
    {
      v25.super.isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
    }
    else
    {
      v25.super.isa = 0;
    }
    v26 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_averagePoolingDescriptorWithKernelSizes_strides_dilationRates_paddingPolicy_paddingSizes_countIncludesPadding_, v11.super.isa, v13.super.isa, v15.super.isa, v24, v25.super.isa, v9 & 1);
  }
  v27 = v26;

  return v27;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MLCPoolingType(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t result;
  unsigned int v6;
  unsigned int v7;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
  {
    v6 = *a1;
    if (v6 >= 2)
    {
      v7 = (v6 + 2147483646) & 0x7FFFFFFF;
      result = v7 - 1;
      if (v7 > 1)
        return result;
    }
    return 0;
  }
  v2 = a2 + 3;
  if (a2 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if (v2 >> 8 < 0xFF)
    v3 = 1;
  if (v2 >= 0x100)
    v4 = v3;
  else
    v4 = 0;
  return ((uint64_t (*)(void))((char *)&loc_219977C58 + 4 * byte_21997812C[v4]))();
}

uint64_t storeEnumTagSinglePayload for MLCPoolingType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 3;
  if (a3 + 3 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xFD)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_219977D04 + 4 * byte_219978136[v5]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_219977D38 + 4 * byte_219978131[v5]))();
}

uint64_t sub_219977D38(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_219977D40(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x219977D48);
  return result;
}

uint64_t sub_219977D54(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x219977D5CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_219977D60(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_219977D68(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for MLCPoolingType(unsigned __int8 *a1)
{
  unsigned int v1;
  BOOL v2;
  int v3;

  v1 = *a1;
  v2 = v1 >= 2;
  v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2)
    return (v3 + 1);
  else
    return 0;
}

_BYTE *destructiveInjectEnumTag for MLCPoolingType(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 1;
  return result;
}

ValueMetadata *type metadata accessor for MLCPoolingType()
{
  return &type metadata for MLCPoolingType;
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

NSNumber __swiftcall Float._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x24BDCFC80]();
}

uint64_t Float.init(exactly:)()
{
  return MEMORY[0x24BDCFCA8]();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x24BDCFD28]();
}

uint64_t Int.init(exactly:)()
{
  return MEMORY[0x24BDCFD48]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t _assertionFailure(_:_:flags:)()
{
  return MEMORY[0x24BEE2F50]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t _CocoaArrayWrapper.subscript.getter()
{
  return MEMORY[0x24BEE3078]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x24BEE4A98]();
}

NSString *__cdecl MLCPaddingPolicyDebugDescription(MLCPaddingPolicy paddingPolicy)
{
  return (NSString *)MEMORY[0x24BDDAA80](*(_QWORD *)&paddingPolicy);
}

NSString *__cdecl MLCPoolingTypeDebugDescription(MLCPoolingType poolingType)
{
  return (NSString *)MEMORY[0x24BDDAA88](*(_QWORD *)&poolingType);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
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

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
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

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
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

