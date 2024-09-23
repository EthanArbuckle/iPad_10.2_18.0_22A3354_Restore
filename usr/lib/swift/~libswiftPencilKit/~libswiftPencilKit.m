uint64_t PKCanvasView.tool.getter@<X0>(uint64_t *a1@<X8>)
{
  void *v1;
  id v3;
  uint64_t result;
  _UNKNOWN **v5;
  ValueMetadata *v6;
  id v7;
  id v8;

  v3 = objc_msgSend(v1, sel_tool);
  objc_opt_self();
  result = swift_dynamicCastObjCClass();
  if (result)
  {
    v5 = &protocol witness table for PKInkingTool;
    v6 = &type metadata for PKInkingTool;
LABEL_7:
    a1[3] = (uint64_t)v6;
    a1[4] = (uint64_t)v5;
    *a1 = result;
    return result;
  }

  v7 = objc_msgSend(v1, sel_tool);
  objc_opt_self();
  result = swift_dynamicCastObjCClass();
  if (result)
  {
    v5 = &protocol witness table for PKEraserTool;
    v6 = &type metadata for PKEraserTool;
    goto LABEL_7;
  }

  v8 = objc_msgSend(v1, sel_tool);
  objc_opt_self();
  result = swift_dynamicCastObjCClass();
  if (result)
  {
    v5 = &protocol witness table for PKLassoTool;
    v6 = &type metadata for PKLassoTool;
    goto LABEL_7;
  }

  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t key path getter for PKCanvasView.tool : PKCanvasView@<X0>(uint64_t *a1@<X8>)
{
  return PKCanvasView.tool.getter(a1);
}

uint64_t key path setter for PKCanvasView.tool : PKCanvasView(uint64_t a1)
{
  _BYTE v2[40];

  outlined init with copy of PKTool(a1, (uint64_t)v2);
  return PKCanvasView.tool.setter((uint64_t)v2);
}

uint64_t PKCanvasView.tool.setter(uint64_t a1)
{
  void *v1;
  uint64_t result;
  void *v4;
  _BYTE v5[40];

  outlined init with copy of PKTool(a1, (uint64_t)v5);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PKTool);
  if (swift_dynamicCast()
    || (outlined init with copy of PKTool(a1, (uint64_t)v5), swift_dynamicCast())
    || (outlined init with copy of PKTool(a1, (uint64_t)v5), swift_dynamicCast()))
  {
    objc_msgSend(v1, sel_setTool_, v4);

    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t outlined init with copy of PKTool(uint64_t a1, uint64_t a2)
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
    result = MEMORY[0x2207A87D0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
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

void (*PKCanvasView.tool.modify(uint64_t **a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t *v3;

  v3 = (uint64_t *)malloc(0x58uLL);
  *a1 = v3;
  v3[10] = v1;
  PKCanvasView.tool.getter(v3);
  return PKCanvasView.tool.modify;
}

void PKCanvasView.tool.modify(uint64_t *a1, char a2)
{
  void *v2;

  v2 = (void *)*a1;
  if ((a2 & 1) != 0)
  {
    outlined init with copy of PKTool(*a1, (uint64_t)v2 + 40);
    PKCanvasView.tool.setter((uint64_t)v2 + 40);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    PKCanvasView.tool.setter(*a1);
  }
  free(v2);
}

PencilKit::PKStrokePath __swiftcall PKStrokePath.init()()
{
  PencilKit::PKStrokePath *v0;
  PencilKit::PKStrokePath *v1;
  PencilKit::PKStrokePath result;

  v1 = v0;
  result.strokeData.super.isa = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33E0]), sel_init);
  v1->strokeData.super.isa = result.strokeData.super.isa;
  return result;
}

uint64_t PKStrokePath.init<A>(controlPoints:creationDate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  Class isa;
  Class v12;
  id v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;

  v8 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t))(v8 + 16))((char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  Array.init<A>(_:)();
  v10 = objc_allocWithZone(MEMORY[0x24BDE33E0]);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v12 = Date._bridgeToObjectiveC()().super.isa;
  v13 = objc_msgSend(v10, sel_initWithControlPoints_creationDate_, isa, v12);

  v14 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(a2, v14);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a1, a3);
  *a4 = v13;
  return result;
}

void PKStrokePath.creationDate.getter()
{
  id *v0;
  id v1;

  v1 = objc_msgSend(*v0, sel_creationDate);
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

}

id PKStrokePath.interpolatedLocation(at:)()
{
  id *v0;

  return objc_msgSend(*v0, sel_interpolatedLocationAt_);
}

id PKStrokePath.interpolatedPoint(at:)@<X0>(_QWORD *a1@<X8>)
{
  id *v1;
  id result;

  result = objc_msgSend(*v1, sel_interpolatedPointAt_);
  if (result)
  {
    *a1 = result;
  }
  else
  {
    result = (id)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

void PKStrokePath.interpolatedPoints(in:by:)(uint64_t a1@<X0>, double a2@<X1>, char a3@<W2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  void **v5;
  uint64_t v7;
  char v8;
  void *v9;
  id v11;
  int64_t v12;
  id v13;
  id v14;
  void *v15;

  v7 = *a4;
  v8 = *((_BYTE *)a4 + 8);
  v9 = *v5;
  if ((a3 & 1) == 0)
    goto LABEL_8;
  v15 = *v5;
  v11 = v9;
  v12 = (int64_t)objc_msgSend(v11, sel_count);
  if (((unint64_t)objc_msgSend(v11, sel_count) & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v13 = objc_msgSend(v11, sel_count);

  if (v12 < 0 || (uint64_t)v13 < v12)
    goto LABEL_10;
  if (v12)
  {
    a1 = 0;
    a2 = (double)(v12 - 1);
    v9 = v15;
LABEL_8:
    *(_QWORD *)a5 = v9;
    *(_QWORD *)(a5 + 8) = v7;
    *(_BYTE *)(a5 + 16) = v8;
    *(_QWORD *)(a5 + 24) = a1;
    *(double *)(a5 + 32) = a2;
    *(_QWORD *)(a5 + 40) = a1;
    v14 = v9;
    return;
  }
LABEL_11:
  __break(1u);
}

void PKStrokePath.parametricValue(_:offsetBy:)(uint64_t a1, double a2)
{
  void **v2;
  double v3;
  int v4;
  void *v5;
  double v6;
  const char *v7;
  id v8;
  int64_t v9;
  id v10;

  v3 = *(double *)a1;
  v4 = *(unsigned __int8 *)(a1 + 8);
  v5 = *v2;
  if (!v4)
  {
    v6 = v3;
    v7 = sel_parametricValue_offsetByDistance_;
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    v6 = v3;
    v7 = sel_parametricValue_offsetByTime_;
LABEL_5:
    objc_msgSend(v5, v7, a2, v6);
    return;
  }
  v8 = v5;
  v9 = (int64_t)objc_msgSend(v8, sel_count);
  if (((unint64_t)objc_msgSend(v8, sel_count) & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  v10 = objc_msgSend(v8, sel_count);

  if (v9 < 0 || (uint64_t)v10 < v9)
    goto LABEL_11;
}

uint64_t PKStrokePath.startIndex.getter()
{
  return 0;
}

id PKStrokePath.endIndex.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_count);
}

id PKStrokePath.subscript.getter@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  id *v2;
  id result;

  result = objc_msgSend(*v2, sel_objectAtIndexedSubscript_, a1);
  if (result)
  {
    *a2 = result;
  }
  else
  {
    result = (id)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

id specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(int64_t a1, uint64_t a2, int64_t a3, id a4)
{
  id result;
  uint64_t v9;
  int64_t v10;
  BOOL v11;

  result = objc_msgSend(a4, sel_count);
  if (a1 < 0 || (uint64_t)result < a1)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = objc_msgSend(a4, sel_count);
  if (a3 < 0 || (uint64_t)result < a3)
    goto LABEL_17;
  v9 = a3 - a1;
  if (a2 >= 1)
  {
    if (v9 < 0 || v9 >= a2)
      goto LABEL_12;
    return 0;
  }
  if (v9 <= 0 && v9 > a2)
    return 0;
LABEL_12:
  v11 = __OFADD__(a1, a2);
  v10 = a1 + a2;
  if (v11)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  result = objc_msgSend(a4, sel_count);
  if ((v10 & 0x8000000000000000) == 0 && (uint64_t)result >= v10)
    return (id)v10;
LABEL_19:
  __break(1u);
  return result;
}

_QWORD *protocol witness for BidirectionalCollection.index(before:) in conformance PKStrokePath@<X0>(_QWORD *result@<X0>, uint64_t *a2@<X8>)
{
  id *v2;
  uint64_t v4;

  v4 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else
  {
    result = objc_msgSend(*v2, sel_count);
    if ((v4 & 0x8000000000000000) == 0 && v4 < (uint64_t)result)
    {
      *a2 = v4;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for BidirectionalCollection.formIndex(before:) in conformance PKStrokePath(uint64_t *result)
{
  id *v1;
  uint64_t v2;
  uint64_t *v3;

  v2 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else
  {
    v3 = result;
    result = (uint64_t *)objc_msgSend(*v1, sel_count);
    if ((v2 & 0x8000000000000000) == 0 && v2 < (uint64_t)result)
    {
      *v3 = v2;
      return result;
    }
  }
  __break(1u);
  return result;
}

void protocol witness for Collection.startIndex.getter in conformance PKStrokePath(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

id protocol witness for Collection.endIndex.getter in conformance PKStrokePath@<X0>(_QWORD *a1@<X8>)
{
  id *v1;
  id result;

  result = objc_msgSend(*v1, sel_count);
  *a1 = result;
  return result;
}

void (*protocol witness for Collection.subscript.read in conformance PKStrokePath(_QWORD *a1, _QWORD *a2))(id *a1)
{
  id *v2;
  id v4;
  void (*result)(id *);

  v4 = objc_msgSend(*v2, sel_objectAtIndexedSubscript_, *a2);
  if (v4)
  {
    *a1 = v4;
    return protocol witness for Collection.subscript.read in conformance PKStrokePath;
  }
  else
  {
    result = (void (*)(id *))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

void protocol witness for Collection.subscript.read in conformance PKStrokePath(id *a1)
{

}

uint64_t protocol witness for Collection.subscript.getter in conformance PKStrokePath@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  id *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  id v7;

  v5 = *a1;
  v4 = a1[1];
  v7 = *v2;
  result = (uint64_t)objc_msgSend(*v2, sel_count);
  if (result < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v5 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (result >= v4)
  {
    a2[1] = v4;
    a2[2] = v7;
    *a2 = v5;
    return (uint64_t)v7;
  }
LABEL_7:
  __break(1u);
  return result;
}

unint64_t protocol witness for Collection.indices.getter in conformance PKStrokePath@<X0>(_QWORD *a1@<X8>)
{
  id *v1;
  unint64_t result;

  result = (unint64_t)objc_msgSend(*v1, sel_count);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    *a1 = 0;
    a1[1] = result;
  }
  return result;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance PKStrokePath()
{
  id *v0;

  return objc_msgSend(*v0, sel_count) == 0;
}

void protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance PKStrokePath(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

_QWORD *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance PKStrokePath@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  id *v3;
  uint64_t v5;

  v5 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else
  {
    result = objc_msgSend(*v3, sel_count);
    if ((v5 & 0x8000000000000000) == 0 && (uint64_t)result >= v5)
    {
      *a3 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

id protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance PKStrokePath@<X0>(int64_t *a1@<X0>, uint64_t a2@<X1>, int64_t *a3@<X2>, uint64_t a4@<X8>)
{
  id *v4;
  id result;
  char v7;

  result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3, *v4);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v7 & 1;
  return result;
}

id protocol witness for RandomAccessCollection.distance(from:to:) in conformance PKStrokePath(uint64_t *a1, uint64_t *a2)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id result;

  v3 = *a1;
  v4 = *a2;
  v5 = *v2;
  result = objc_msgSend(*v2, sel_count);
  if (v3 < 0 || (uint64_t)result < v3)
  {
    __break(1u);
  }
  else
  {
    result = objc_msgSend(v5, sel_count);
    if ((v4 & 0x8000000000000000) == 0 && (uint64_t)result >= v4)
      return (id)(v4 - v3);
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance PKStrokePath(uint64_t *result, uint64_t *a2)
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

_QWORD *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance PKStrokePath(_QWORD *result, _QWORD *a2)
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

id protocol witness for Collection.index(after:) in conformance PKStrokePath@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  id *v2;
  uint64_t v4;
  id result;

  v4 = *a1;
  result = objc_msgSend(*v2, sel_count);
  if (v4 < 0 || v4 >= (uint64_t)result)
    __break(1u);
  else
    *a2 = v4 + 1;
  return result;
}

id protocol witness for Collection.formIndex(after:) in conformance PKStrokePath(uint64_t *a1)
{
  void **v1;
  void *v3;
  uint64_t v4;
  id result;

  v3 = *v1;
  v4 = *a1;
  result = objc_msgSend(v3, sel_count);
  if (v4 < 0 || v4 >= (uint64_t)result)
    __break(1u);
  else
    *a1 = v4 + 1;
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance PKStrokePath(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = 0;
}

int64_t protocol witness for Collection.count.getter in conformance PKStrokePath()
{
  void **v0;
  void *v1;
  int64_t v2;
  int64_t result;

  v1 = *v0;
  v2 = (int64_t)objc_msgSend(v1, sel_count);
  result = (int64_t)objc_msgSend(v1, sel_count);
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    result = (int64_t)objc_msgSend(v1, sel_count);
    if ((v2 & 0x8000000000000000) == 0 && result >= v2)
      return v2;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance PKStrokePath()
{
  return 2;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance PKStrokePath()
{
  void **v0;
  void *v1;
  uint64_t v2;

  v1 = *v0;
  v2 = specialized _copyCollectionToContiguousArray<A>(_:)(*v0);

  return v2;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance PKStrokePath(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  id *v3;

  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance PKStrokePath()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

PKStrokePath __swiftcall PKStrokePath._bridgeToObjectiveC()()
{
  id *v0;

  return (PKStrokePath)*v0;
}

id static PKStrokePath._forceBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{

  *a2 = a1;
  return a1;
}

uint64_t static PKStrokePath._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  id v4;

  *a2 = a1;
  v4 = a1;
  return 1;
}

id static PKStrokePath._unconditionallyBridgeFromObjectiveC(_:)@<X0>(id a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = a1;
  if (!a1)
  {
    a1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33E0]), sel_init);
    v2 = 0;
  }
  *a2 = a1;
  return v2;
}

unint64_t lazy protocol witness table accessor for type PKStrokePath and conformance PKStrokePath()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath;
  if (!lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath)
  {
    result = MEMORY[0x2207A87E8](&protocol conformance descriptor for PKStrokePath, &type metadata for PKStrokePath);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath;
  if (!lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath)
  {
    result = MEMORY[0x2207A87E8](&protocol conformance descriptor for PKStrokePath, &type metadata for PKStrokePath);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath;
  if (!lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath)
  {
    result = MEMORY[0x2207A87E8](&protocol conformance descriptor for PKStrokePath, &type metadata for PKStrokePath);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath;
  if (!lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath)
  {
    result = MEMORY[0x2207A87E8](&protocol conformance descriptor for PKStrokePath, &type metadata for PKStrokePath);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PKStrokePath and conformance PKStrokePath);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Indices : RandomAccessCollection in PKStrokePath()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>, MEMORY[0x24BEE1BD0]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207A87DC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    result = MEMORY[0x2207A87E8](MEMORY[0x24BEE1790], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in PKStrokePath()
{
  return lazy protocol witness table accessor for type Slice<PKStrokePath> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<PKStrokePath> and conformance <> Slice<A>, (uint64_t (*)(void))lazy protocol witness table accessor for type PKStrokePath and conformance PKStrokePath, MEMORY[0x24BEE4230]);
}

uint64_t associated type witness table accessor for Collection.Indices : BidirectionalCollection in PKStrokePath()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>, MEMORY[0x24BEE1BA8]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in PKStrokePath()
{
  return lazy protocol witness table accessor for type Slice<PKStrokePath> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<PKStrokePath> and conformance <> Slice<A>, (uint64_t (*)(void))lazy protocol witness table accessor for type PKStrokePath and conformance PKStrokePath, MEMORY[0x24BEE4218]);
}

uint64_t lazy protocol witness table accessor for type Slice<PKStrokePath> and conformance <> Slice<A>(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Slice<PKStrokePath>);
    v8 = a2();
    result = MEMORY[0x2207A87E8](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Index : Comparable in PKStrokePath()
{
  return MEMORY[0x24BEE1780];
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in PKStrokePath()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>, MEMORY[0x24BEE1BD8]);
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
    v7[0] = MEMORY[0x24BEE17A8];
    v7[1] = v6;
    result = MEMORY[0x2207A87E8](a2, v5, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in PKStrokePath()
{
  return lazy protocol witness table accessor for type Slice<PKStrokePath> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<PKStrokePath> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<PKStrokePath>, MEMORY[0x24BEE4238]);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in PKStrokePath()
{
  return lazy protocol witness table accessor for type Slice<PKStrokePath> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<PKStrokePath> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<PKStrokePath>, MEMORY[0x24BEE2C18]);
}

uint64_t lazy protocol witness table accessor for type Slice<PKStrokePath> and conformance Slice<A>(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2207A87E8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance PKStrokePath()
{
  id *v0;

  return *v0;
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance PKStrokePath(void *a1, id *a2)
{

  *a2 = a1;
  return a1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance PKStrokePath(void *a1, id *a2)
{
  id v4;

  *a2 = a1;
  v4 = a1;
  return 1;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance PKStrokePath@<X0>(id a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = a1;
  if (!a1)
  {
    a1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33E0]), sel_init);
    v2 = 0;
  }
  *a2 = a1;
  return v2;
}

ValueMetadata *type metadata accessor for PKStrokePath()
{
  return &type metadata for PKStrokePath;
}

uint64_t initializeBufferWithCopyOfBuffer for PKStrokePath.InterpolatedSlice(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for PKStrokePath.InterpolatedSlice(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v5 = v3;
  return a1;
}

uint64_t assignWithCopy for PKStrokePath.InterpolatedSlice(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
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

uint64_t assignWithTake for PKStrokePath.InterpolatedSlice(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for PKStrokePath.InterpolatedSlice(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PKStrokePath.InterpolatedSlice(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
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
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PKStrokePath.InterpolatedSlice()
{
  return &type metadata for PKStrokePath.InterpolatedSlice;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for PKStrokePath.InterpolatedSlice.Stride(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PKStrokePath.InterpolatedSlice.Stride(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t getEnumTag for PKStrokePath.InterpolatedSlice.Stride(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t destructiveInjectEnumTag for PKStrokePath.InterpolatedSlice.Stride(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for PKStrokePath.InterpolatedSlice.Stride()
{
  return &type metadata for PKStrokePath.InterpolatedSlice.Stride;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(void *a1)
{
  uint64_t v2;
  uint64_t result;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8[2];

  v2 = (uint64_t)objc_msgSend(a1, sel_count);
  result = (uint64_t)objc_msgSend(a1, sel_count);
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    result = (uint64_t)objc_msgSend(a1, sel_count);
    if ((v2 & 0x8000000000000000) == 0 && result >= v2)
    {
      if (v2)
      {
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<PKStrokePoint>);
        v4 = (_QWORD *)swift_allocObject();
        v5 = _swift_stdlib_malloc_size(v4);
        v6 = v5 - 32;
        if (v5 < 32)
          v6 = v5 - 25;
        v4[2] = v2;
        v4[3] = 2 * (v6 >> 3);
        v7 = specialized Sequence._copySequenceContents(initializing:)(v8, (uint64_t)(v4 + 4), v2, a1);

        if (v7 == v2)
          return (uint64_t)v4;
        __break(1u);
      }
      return MEMORY[0x24BEE4AF8];
    }
  }
  __break(1u);
  return result;
}

id static PKEraserTool._unconditionallyBridgeFromObjectiveC(_:)@<X0>(id result@<X0>, id *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

PKEraserTool __swiftcall PKEraserTool._bridgeToObjectiveC()()
{
  id *v0;

  return (PKEraserTool)*v0;
}

PencilKit::PKEraserTool __swiftcall PKEraserTool.init(_:)(PencilKit::PKEraserTool::EraserType a1)
{
  PencilKit::PKEraserTool *v1;
  PencilKit::PKEraserTool *v2;
  PencilKit::PKEraserTool result;

  v2 = v1;
  result.tool.super.super.isa = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE3390]), sel_initWithEraserType_, *(unsigned __int8 *)a1);
  v2->tool.super.super.isa = result.tool.super.super.isa;
  return result;
}

BOOL static PKEraserTool.EraserType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void PKEraserTool.EraserType.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int PKEraserTool.EraserType.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance PKEraserTool.EraserType(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance PKEraserTool.EraserType()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance PKEraserTool.EraserType()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance PKEraserTool.EraserType()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

id PKEraserTool.eraserType.getter@<X0>(char *a1@<X8>)
{
  id *v1;
  id result;
  char v4;

  result = objc_msgSend(*v1, sel_eraserType);
  if (!result)
  {
    v4 = 0;
LABEL_5:
    *a1 = v4;
    return result;
  }
  if (result == (id)1)
  {
    v4 = 1;
    goto LABEL_5;
  }
  result = (id)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id key path getter for PKEraserTool.eraserType : PKEraserTool@<X0>(id *a1@<X0>, char *a2@<X8>)
{
  id result;
  char v4;

  result = objc_msgSend(*a1, sel_eraserType);
  if (!result)
  {
    v4 = 0;
LABEL_5:
    *a2 = v4;
    return result;
  }
  if (result == (id)1)
  {
    v4 = 1;
    goto LABEL_5;
  }
  result = (id)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void PKEraserTool.eraserType.setter(unsigned __int8 *a1)
{
  id *v1;
  id v2;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE3390]), sel_initWithEraserType_, *a1);

  *v1 = v2;
}

void (*PKEraserTool.eraserType.modify(id **a1))(uint64_t a1)
{
  id *v1;
  char *v2;
  id v3;
  char v4;
  void (*result)(uint64_t);

  *a1 = v1;
  v2 = (char *)(a1 + 1);
  v3 = objc_msgSend(*v1, sel_eraserType);
  if (!v3)
  {
    v4 = 0;
LABEL_5:
    *v2 = v4;
    return PKEraserTool.eraserType.modify;
  }
  if (v3 == (id)1)
  {
    v4 = 1;
    goto LABEL_5;
  }
  result = (void (*)(uint64_t))_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void PKEraserTool.eraserType.modify(uint64_t a1)
{
  id *v1;
  id v2;

  v1 = *(id **)a1;
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE3390]), sel_initWithEraserType_, *(unsigned __int8 *)(a1 + 8));

  *v1 = v2;
}

uint64_t static PKEraserTool.== infix(_:_:)()
{
  type metadata accessor for NSObject();
  return static NSObject.== infix(_:_:)() & 1;
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

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance PKEraserTool()
{
  type metadata accessor for NSObject();
  return static NSObject.== infix(_:_:)() & 1;
}

id static PKEraserTool._forceBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{

  *a2 = a1;
  return a1;
}

uint64_t static PKEraserTool._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  id v4;

  *a2 = a1;
  v4 = a1;
  return 1;
}

unint64_t lazy protocol witness table accessor for type PKEraserTool.EraserType and conformance PKEraserTool.EraserType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type PKEraserTool.EraserType and conformance PKEraserTool.EraserType;
  if (!lazy protocol witness table cache variable for type PKEraserTool.EraserType and conformance PKEraserTool.EraserType)
  {
    result = MEMORY[0x2207A87E8](&protocol conformance descriptor for PKEraserTool.EraserType, &type metadata for PKEraserTool.EraserType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PKEraserTool.EraserType and conformance PKEraserTool.EraserType);
  }
  return result;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance PKEraserTool@<X0>(id result@<X0>, id *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_21DFE33BC(unsigned __int8 *a1, id *a2)
{
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE3390]), sel_initWithEraserType_, *a1);

  *a2 = v3;
}

ValueMetadata *type metadata accessor for PKEraserTool()
{
  return &type metadata for PKEraserTool;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PKEraserTool.EraserType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PKEraserTool.EraserType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21DFE3500 + 4 * byte_21DFE8E51[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21DFE3534 + 4 * byte_21DFE8E4C[v4]))();
}

uint64_t sub_21DFE3534(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DFE353C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21DFE3544);
  return result;
}

uint64_t sub_21DFE3550(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21DFE3558);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21DFE355C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DFE3564(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for PKEraserTool.EraserType(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for PKEraserTool.EraserType(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PKEraserTool.EraserType()
{
  return &type metadata for PKEraserTool.EraserType;
}

PencilKit::PKStroke __swiftcall PKStroke.init(ink:path:transform:mask:)(PencilKit::PKInk ink, PencilKit::PKStrokePath path, CGAffineTransform *transform, UIBezierPath_optional mask)
{
  _QWORD *v4;
  Class isa;
  _QWORD *v6;
  CGFloat tx;
  CGFloat ty;
  void *v9;
  void *v10;
  id v11;
  PencilKit::PKStroke result;
  __int128 v13;
  _OWORD v14[2];
  CGFloat v15;
  CGFloat v16;

  isa = mask.value.super.isa;
  v6 = v4;
  v13 = *(_OWORD *)&transform->c;
  tx = transform->tx;
  ty = transform->ty;
  v9 = *(void **)ink.ink.super.isa;
  v10 = *(void **)path.strokeData.super.isa;
  v14[0] = *(_OWORD *)&transform->a;
  v14[1] = v13;
  v15 = tx;
  v16 = ty;
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33D8]), sel_initWithInk_strokePath_transform_mask_, v9, v10, v14, mask.value.super.isa);

  *v6 = v11;
  return result;
}

void PKStroke.ink.getter(_QWORD *a1@<X8>)
{
  id *v1;
  id v3;
  id v4;
  void *v5;

  v3 = objc_msgSend(*v1, sel_ink);
  if (!v3)
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
    v5 = (void *)MEMORY[0x2207A8518](0xD000000000000011, 0x800000021DFE8530);
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33B0]), sel_initWithInkType_color_, v5, v4);

  }
  *a1 = v3;
}

void key path getter for PKStroke.ink : PKStroke(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  v3 = *a1;
  v4 = objc_msgSend(v3, sel_ink);
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v6 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
    v7 = (void *)MEMORY[0x2207A8518](0xD000000000000011, 0x800000021DFE8530);
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33B0]), sel_initWithInkType_color_, v7, v6);

    v3 = v6;
  }

  *a2 = v5;
}

void PKStroke.ink.setter(void **a1)
{
  id *v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *a1;
  v3 = *v1;
  v4 = objc_msgSend(*v1, sel_path);
  if (!v4)
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33E0]), sel_init);
  objc_msgSend(v3, sel_transform);
  v10 = v13;
  v11 = v12;
  v5 = v14;
  v6 = v15;
  v7 = objc_msgSend(v3, sel_mask);
  v8 = objc_allocWithZone(MEMORY[0x24BDE33D8]);
  v12 = v11;
  v13 = v10;
  v14 = v5;
  v15 = v6;
  v9 = objc_msgSend(v8, sel_initWithInk_strokePath_transform_mask_, v2, v4, &v12, v7);

  *v1 = v9;
}

double PKStroke.transform.getter@<D0>(_OWORD *a1@<X8>)
{
  id *v1;
  double result;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  objc_msgSend(*v1, sel_transform);
  result = *(double *)&v4;
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  return result;
}

id PKStroke.mask.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_mask);
}

void (*PKStroke.ink.modify(_QWORD *a1))(char **a1, char a2)
{
  id *v1;
  _QWORD *v3;
  _QWORD *v4;
  id v5;
  id v6;
  void *v7;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v4 = v3 + 6;
  v3[7] = v1;
  v5 = objc_msgSend(*v1, sel_ink);
  if (!v5)
  {
    v6 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
    v7 = (void *)MEMORY[0x2207A8518](0xD000000000000011, 0x800000021DFE8530);
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33B0]), sel_initWithInkType_color_, v7, v6);

  }
  *v4 = v5;
  return PKStroke.ink.modify;
}

void PKStroke.ink.modify(char **a1, char a2)
{
  char *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v2 = *a1;
  v3 = (void *)*((_QWORD *)*a1 + 6);
  v4 = (void *)**((_QWORD **)*a1 + 7);
  if ((a2 & 1) != 0)
  {
    v5 = v3;
    v6 = objc_msgSend(v4, sel_path);
    if (!v6)
      v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33E0]), sel_init);
    v7 = (_QWORD *)*((_QWORD *)v2 + 7);
    objc_msgSend(v4, sel_transform);
    v8 = objc_msgSend(v4, sel_mask);
    v9 = objc_allocWithZone(MEMORY[0x24BDE33D8]);
    *(_QWORD *)v2 = v16;
    *(_OWORD *)(v2 + 8) = v17;
    *(_OWORD *)(v2 + 24) = v18;
    *((_QWORD *)v2 + 5) = v19;
    v10 = objc_msgSend(v9, sel_initWithInk_strokePath_transform_mask_, v5, v6, v2, v8);

    *v7 = v10;
  }
  else
  {
    v11 = objc_msgSend(**((id **)*a1 + 7), sel_path);
    if (!v11)
      v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33E0]), sel_init);
    v12 = (_QWORD *)*((_QWORD *)v2 + 7);
    objc_msgSend(v4, sel_transform);
    v13 = objc_msgSend(v4, sel_mask);
    v14 = objc_allocWithZone(MEMORY[0x24BDE33D8]);
    *(_QWORD *)v2 = v16;
    *(_OWORD *)(v2 + 8) = v17;
    *(_OWORD *)(v2 + 24) = v18;
    *((_QWORD *)v2 + 5) = v19;
    v15 = objc_msgSend(v14, sel_initWithInk_strokePath_transform_mask_, v3, v11, v2, v13);

    *v12 = v15;
  }
  free(v2);
}

void PKStroke.transform.setter(uint64_t *a1)
{
  id *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[6];

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  v5 = a1[3];
  v6 = a1[4];
  v7 = a1[5];
  v8 = *v1;
  v9 = objc_msgSend(*v1, sel_ink);
  if (!v9)
  {
    v10 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
    v11 = (void *)MEMORY[0x2207A8518](0xD000000000000011, 0x800000021DFE8530);
    v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33B0]), sel_initWithInkType_color_, v11, v10);

  }
  v12 = objc_msgSend(v8, sel_path);
  if (!v12)
    v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33E0]), sel_init);
  v13 = objc_msgSend(v8, sel_mask);
  v15[0] = v2;
  v15[1] = v3;
  v15[2] = v4;
  v15[3] = v5;
  v15[4] = v6;
  v15[5] = v7;
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33D8]), sel_initWithInk_strokePath_transform_mask_, v9, v12, v15, v13);

  *v1 = v14;
}

void (*PKStroke.transform.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  id *v1;
  _QWORD *v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = malloc(0x98uLL);
  *a1 = v3;
  v3[18] = v1;
  objc_msgSend(*v1, sel_transform);
  *((_OWORD *)v3 + 6) = v5;
  *((_OWORD *)v3 + 7) = v6;
  *((_OWORD *)v3 + 8) = v7;
  return PKStroke.transform.modify;
}

void PKStroke.transform.modify(uint64_t *a1, char a2)
{
  _OWORD *v2;
  uint64_t v3;
  __int128 v4;

  v2 = (_OWORD *)*a1;
  if ((a2 & 1) != 0)
    v3 = *a1;
  else
    v3 = *a1 + 48;
  v4 = v2[7];
  *(_OWORD *)v3 = v2[6];
  *(_OWORD *)(v3 + 16) = v4;
  *(_OWORD *)(v3 + 32) = v2[8];
  PKStroke.transform.setter((uint64_t *)v3);
  free(v2);
}

id PKStroke.path.getter@<X0>(_QWORD *a1@<X8>)
{
  id *v1;
  id result;

  result = objc_msgSend(*v1, sel_path);
  if (!result)
    result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33E0]), sel_init);
  *a1 = result;
  return result;
}

void key path getter for PKStroke.path : PKStroke(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v3;
  id v4;

  v3 = *a1;
  v4 = objc_msgSend(v3, sel_path);
  if (!v4)
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33E0]), sel_init);

  *a2 = v4;
}

void PKStroke.path.setter(void **a1)
{
  id *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v2 = *a1;
  v3 = *v1;
  v4 = objc_msgSend(*v1, sel_ink);
  if (!v4)
  {
    v5 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
    v6 = (void *)MEMORY[0x2207A8518](0xD000000000000011, 0x800000021DFE8530);
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33B0]), sel_initWithInkType_color_, v6, v5);

  }
  objc_msgSend(v3, sel_transform);
  v12 = v15;
  v13 = v14;
  v7 = v16;
  v8 = v17;
  v9 = objc_msgSend(v3, sel_mask);
  v10 = objc_allocWithZone(MEMORY[0x24BDE33D8]);
  v14 = v13;
  v15 = v12;
  v16 = v7;
  v17 = v8;
  v11 = objc_msgSend(v10, sel_initWithInk_strokePath_transform_mask_, v4, v2, &v14, v9);

  *v1 = v11;
}

void (*PKStroke.path.modify(_QWORD *a1))(void **a1, char a2)
{
  id *v1;
  id v3;

  a1[1] = v1;
  v3 = objc_msgSend(*v1, sel_path);
  if (!v3)
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33E0]), sel_init);
  *a1 = v3;
  return PKStroke.path.modify;
}

void PKStroke.path.modify(void **a1, char a2)
{
  void *v2;
  id v3;
  void *v4;

  v2 = *a1;
  v4 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = v2;
    PKStroke.path.setter(&v4);

  }
  else
  {
    PKStroke.path.setter(&v4);
  }
}

void PKStroke.mask.setter(void *a1)
{
  id *v1;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v3 = *v1;
  v4 = objc_msgSend(*v1, sel_ink);
  if (!v4)
  {
    v5 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
    v6 = (void *)MEMORY[0x2207A8518](0xD000000000000011, 0x800000021DFE8530);
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33B0]), sel_initWithInkType_color_, v6, v5);

  }
  v7 = objc_msgSend(v3, sel_path);
  if (!v7)
    v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33E0]), sel_init);
  objc_msgSend(v3, sel_transform);
  v12 = v15;
  v13 = v14;
  v8 = v16;
  v9 = v17;
  v10 = objc_allocWithZone(MEMORY[0x24BDE33D8]);
  v14 = v13;
  v15 = v12;
  v16 = v8;
  v17 = v9;
  v11 = objc_msgSend(v10, sel_initWithInk_strokePath_transform_mask_, v4, v7, &v14, a1);

  *v1 = v11;
}

void (*PKStroke.mask.modify(_QWORD *a1))(void **a1, char a2)
{
  id *v1;

  a1[1] = v1;
  *a1 = objc_msgSend(*v1, sel_mask);
  return PKStroke.mask.modify;
}

void PKStroke.mask.modify(void **a1, char a2)
{
  void *v2;
  id v3;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = v2;
    PKStroke.mask.setter(v2);

  }
  else
  {
    PKStroke.mask.setter(*a1);
  }
}

id PKStroke.renderBounds.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_renderBounds);
}

char *PKStroke.maskedPathRanges.getter()
{
  id *v0;
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

  v1 = objc_msgSend(*v0, sel_maskedPathRanges);
  type metadata accessor for PKFloatRange();
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
        v7 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2207A8578](v5, v2) : *(id *)(v2 + 8 * v5 + 32);
        v8 = v7;
        objc_msgSend(v7, sel_lowerBound);
        v10 = v9;
        objc_msgSend(v8, sel_upperBound);
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

PKStroke __swiftcall PKStroke._bridgeToObjectiveC()()
{
  id *v0;

  return (PKStroke)*v0;
}

id static PKStroke._forceBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{

  *a2 = a1;
  return a1;
}

uint64_t static PKStroke._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  id v4;

  *a2 = a1;
  v4 = a1;
  return 1;
}

id static PKStroke._unconditionallyBridgeFromObjectiveC(_:)@<X0>(void *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  if (a1)
  {
    *a2 = a1;
    return a1;
  }
  else
  {
    result = (id)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance PKStroke@<X0>(void *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  if (a1)
  {
    *a2 = a1;
    return a1;
  }
  else
  {
    result = (id)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

unint64_t type metadata accessor for PKFloatRange()
{
  unint64_t result;

  result = lazy cache variable for type metadata for PKFloatRange;
  if (!lazy cache variable for type metadata for PKFloatRange)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for PKFloatRange);
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

void sub_21DFE46D0(void **a1)
{
  id v1;
  void *v2;

  v2 = *a1;
  v1 = v2;
  PKStroke.ink.setter(&v2);
}

double sub_21DFE4708@<D0>(id *a1@<X0>, _OWORD *a2@<X8>)
{
  double result;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  objc_msgSend(*a1, sel_transform);
  result = *(double *)&v4;
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  return result;
}

void sub_21DFE4750(uint64_t *a1)
{
  PKStroke.transform.setter(a1);
}

void sub_21DFE4774(void **a1)
{
  id v1;
  void *v2;

  v2 = *a1;
  v1 = v2;
  PKStroke.path.setter(&v2);
}

id sub_21DFE47AC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_mask);
  *a2 = result;
  return result;
}

void sub_21DFE47E4(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  PKStroke.mask.setter(v1);
}

ValueMetadata *type metadata accessor for PKStroke()
{
  return &type metadata for PKStroke;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ClosedRange<CGFloat>>);
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<PKStroke>);
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
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

id static PKStrokePoint._unconditionallyBridgeFromObjectiveC(_:)@<X0>(void *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  if (a1)
  {
    *a2 = a1;
    return a1;
  }
  else
  {
    result = (id)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

id PKStrokePoint.init(location:timeOffset:size:opacity:force:azimuth:altitude:)@<X0>(_QWORD *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>, double a8@<D6>, double a9@<D7>, uint64_t a10)
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33E8]), sel_initWithLocation_timeOffset_size_opacity_force_azimuth_altitude_, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  *a1 = result;
  return result;
}

id PKStrokePoint.location.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_location);
}

id PKStrokePoint.timeOffset.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_timeOffset);
}

id PKStrokePoint.size.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_size);
}

id PKStrokePoint.opacity.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_opacity);
}

id PKStrokePoint.azimuth.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_azimuth);
}

id PKStrokePoint.force.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_force);
}

id PKStrokePoint.altitude.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_altitude);
}

PKStrokePoint __swiftcall PKStrokePoint._bridgeToObjectiveC()()
{
  id *v0;

  return (PKStrokePoint)*v0;
}

id static PKStrokePoint._forceBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{

  *a2 = a1;
  return a1;
}

uint64_t static PKStrokePoint._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  id v4;

  *a2 = a1;
  v4 = a1;
  return 1;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance PKStrokePoint@<X0>(void *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  if (a1)
  {
    *a2 = a1;
    return a1;
  }
  else
  {
    result = (id)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

ValueMetadata *type metadata accessor for PKStrokePoint()
{
  return &type metadata for PKStrokePoint;
}

id static PKInkingTool._unconditionallyBridgeFromObjectiveC(_:)@<X0>(id result@<X0>, id *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

PKInkingTool __swiftcall PKInkingTool._bridgeToObjectiveC()()
{
  id *v0;

  return (PKInkingTool)*v0;
}

void PKInkingTool.init(_:color:width:)(_BYTE *a1@<X0>, void *a2@<X1>, double a3@<X2>, char a4@<W3>, _QWORD *a5@<X8>)
{
  int v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  double v18;
  id v19;

  v5 = *a1;
  v6 = 0x800000021DFE8550;
  if (v5 != 1)
    v6 = 0x800000021DFE8570;
  if (*a1)
    v7 = 0xD000000000000014;
  else
    v7 = 0xD000000000000011;
  if (v5)
    v8 = v6;
  else
    v8 = 0x800000021DFE8530;
  v11 = (void *)MEMORY[0x2207A8518](v7, v8);
  swift_bridgeObjectRelease();
  if ((a4 & 1) != 0)
  {
    v13 = 0x800000021DFE8550;
    if (v5 != 1)
      v13 = 0x800000021DFE8570;
    if (v5)
      v14 = 0xD000000000000014;
    else
      v14 = 0xD000000000000011;
    if (v5)
      v15 = v13;
    else
      v15 = 0x800000021DFE8530;
    v16 = (void *)objc_opt_self();
    v17 = (void *)MEMORY[0x2207A8518](v14, v15);
    swift_bridgeObjectRelease();
    objc_msgSend(v16, sel_defaultWidthForInkType_, v17);
    v12 = v18;

  }
  else
  {
    v12 = a3;
  }
  v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33B8]), sel_initWithInkType_color_width_, v11, a2, v12);

  *a5 = v19;
}

double PKInkingTool.InkType.defaultWidth.getter()
{
  _BYTE *v0;
  int v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v1 = *v0;
  v2 = 0x800000021DFE8550;
  if (v1 != 1)
    v2 = 0x800000021DFE8570;
  if (*v0)
    v3 = 0xD000000000000014;
  else
    v3 = 0xD000000000000011;
  if (v1)
    v4 = v2;
  else
    v4 = 0x800000021DFE8530;
  v5 = (void *)objc_opt_self();
  v6 = (void *)MEMORY[0x2207A8518](v3, v4);
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_defaultWidthForInkType_, v6);
  v8 = v7;

  return v8;
}

PencilKit::PKInkingTool::InkType_optional __swiftcall PKInkingTool.InkType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  void *object;
  Swift::String v3;
  char *v4;
  unint64_t v5;
  PencilKit::PKInkingTool::InkType_optional result;
  char v7;

  object = rawValue._object;
  v3._countAndFlagsBits = rawValue._countAndFlagsBits;
  v4 = v1;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of PKInkingTool.InkType.init(rawValue:), v3);
  result.value = swift_bridgeObjectRelease();
  v7 = 3;
  if (v5 < 3)
    v7 = v5;
  *v4 = v7;
  return result;
}

unint64_t PKInkingTool.InkType.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000014;
  else
    return 0xD000000000000011;
}

void PKInkingTool.InkType.validWidthRange.getter()
{
  _BYTE *v0;
  int v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  double v13;
  double v14;

  v1 = *v0;
  if (v1 == 1)
    v2 = 0x800000021DFE8550;
  else
    v2 = 0x800000021DFE8570;
  if (*v0)
    v3 = 0xD000000000000014;
  else
    v3 = 0xD000000000000011;
  if (*v0)
    v4 = v2;
  else
    v4 = 0x800000021DFE8530;
  v5 = (void *)objc_opt_self();
  v6 = (void *)MEMORY[0x2207A8518](v3, v4);
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_minimumWidthForInkType_, v6);
  v8 = v7;

  if (v1 == 1)
    v9 = 0x800000021DFE8550;
  else
    v9 = 0x800000021DFE8570;
  if (v1)
    v10 = 0xD000000000000014;
  else
    v10 = 0xD000000000000011;
  if (v1)
    v11 = v9;
  else
    v11 = 0x800000021DFE8530;
  v12 = (void *)MEMORY[0x2207A8518](v10, v11);
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_maximumWidthForInkType_, v12);
  v14 = v13;

  if (v8 > v14)
    __break(1u);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance PKInkingTool.InkType(char *a1, unsigned __int8 *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

uint64_t specialized == infix<A>(_:_:)(char a1, unsigned __int8 a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  int v5;
  char v6;

  v2 = 0x800000021DFE8530;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x800000021DFE8550;
    else
      v3 = 0x800000021DFE8570;
    v4 = 0xD000000000000014;
    v5 = a2;
    if (a2)
    {
LABEL_6:
      if (v5 == 1)
        v2 = 0x800000021DFE8550;
      else
        v2 = 0x800000021DFE8570;
      if (v4 != 0xD000000000000014)
        goto LABEL_15;
      goto LABEL_13;
    }
  }
  else
  {
    v4 = 0xD000000000000011;
    v3 = 0x800000021DFE8530;
    v5 = a2;
    if (a2)
      goto LABEL_6;
  }
  if (v4 != 0xD000000000000011)
  {
LABEL_15:
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    goto LABEL_16;
  }
LABEL_13:
  if (v3 != v2)
    goto LABEL_15;
  v6 = 1;
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance PKInkingTool.InkType()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

Swift::Int specialized RawRepresentable<>.hashValue.getter()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance PKInkingTool.InkType()
{
  return specialized RawRepresentable<>.hash(into:)();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance PKInkingTool.InkType()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

PencilKit::PKInkingTool::InkType_optional protocol witness for RawRepresentable.init(rawValue:) in conformance PKInkingTool.InkType(Swift::String *a1)
{
  return PKInkingTool.InkType.init(rawValue:)(*a1);
}

unint64_t protocol witness for RawRepresentable.rawValue.getter in conformance PKInkingTool.InkType@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;
  unint64_t v3;

  result = PKInkingTool.InkType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

id PKInkingTool.color.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_color);
}

void PKInkingTool.color.setter(void *a1)
{
  id *v1;
  id v3;
  id v4;
  Swift::String v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  double v10;
  id v11;
  char v12;

  v3 = *v1;
  v4 = objc_msgSend(*v1, sel_inkType);
  v5._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
  PKInkingTool.InkType.init(rawValue:)(v5);
  if (v12 == 3)
  {
    __break(1u);
  }
  else
  {

    v6 = 0x800000021DFE8550;
    if (v12 != 1)
      v6 = 0x800000021DFE8570;
    if (v12)
      v7 = 0xD000000000000014;
    else
      v7 = 0xD000000000000011;
    if (v12)
      v8 = v6;
    else
      v8 = 0x800000021DFE8530;
    v9 = (void *)MEMORY[0x2207A8518](v7, v8);
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_width);
    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33B8]), sel_initWithInkType_color_width_, v9, a1, v10);

    *v1 = v11;
  }
}

void PKInkingTool.inkType.getter(_BYTE *a1@<X8>)
{
  id *v1;
  id v3;
  Swift::String v4;
  char v5;

  v3 = objc_msgSend(*v1, sel_inkType);
  v4._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
  PKInkingTool.InkType.init(rawValue:)(v4);
  if (v5 == 3)
  {
    __break(1u);
  }
  else
  {

    *a1 = v5;
  }
}

id PKInkingTool.width.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_width);
}

void (*PKInkingTool.color.modify(_QWORD *a1))(void **a1, char a2)
{
  id *v1;

  a1[1] = v1;
  *a1 = objc_msgSend(*v1, sel_color);
  return PKInkingTool.color.modify;
}

void PKInkingTool.color.modify(void **a1, char a2)
{
  void *v2;
  id v3;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = v2;
    PKInkingTool.color.setter(v3);

  }
  else
  {
    PKInkingTool.color.setter(v2);
  }
}

id static PKInkingTool.convertColor(_:from:to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((id)objc_opt_self(), sel_convertColor_fromUserInterfaceStyle_to_, a1, a2, a3);
}

void PKInkingTool.width.setter(double a1)
{
  id *v1;
  id v3;
  id v4;
  Swift::String v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  id v11;
  char v12;

  v3 = *v1;
  v4 = objc_msgSend(*v1, sel_inkType);
  v5._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
  PKInkingTool.InkType.init(rawValue:)(v5);
  if (v12 == 3)
  {
    __break(1u);
  }
  else
  {

    v6 = 0x800000021DFE8550;
    if (v12 != 1)
      v6 = 0x800000021DFE8570;
    if (v12)
      v7 = 0xD000000000000014;
    else
      v7 = 0xD000000000000011;
    if (v12)
      v8 = v6;
    else
      v8 = 0x800000021DFE8530;
    v9 = (void *)MEMORY[0x2207A8518](v7, v8);
    swift_bridgeObjectRelease();
    v10 = objc_msgSend(v3, sel_color);
    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33B8]), sel_initWithInkType_color_width_, v9, v10, a1);

    *v1 = v11;
  }
}

void (*PKInkingTool.width.modify(_QWORD *a1))(double *a1)
{
  id *v1;
  uint64_t v3;

  a1[1] = v1;
  objc_msgSend(*v1, sel_width);
  *a1 = v3;
  return PKInkingTool.width.modify;
}

void PKInkingTool.width.modify(double *a1)
{
  PKInkingTool.width.setter(*a1);
}

void key path getter for PKInkingTool.inkType : PKInkingTool(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  Swift::String v5;
  char v6;

  v3 = *a1;
  v4 = objc_msgSend(v3, sel_inkType);
  v5._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
  PKInkingTool.InkType.init(rawValue:)(v5);
  if (v6 == 3)
  {
    __break(1u);
  }
  else
  {

    *a2 = v6;
  }
}

void PKInkingTool.inkType.setter(_BYTE *a1)
{
  id *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;
  id v8;
  double v9;
  id v10;

  v2 = *a1;
  v3 = 0x800000021DFE8550;
  if (v2 != 1)
    v3 = 0x800000021DFE8570;
  if (*a1)
    v4 = 0xD000000000000014;
  else
    v4 = 0xD000000000000011;
  if (v2)
    v5 = v3;
  else
    v5 = 0x800000021DFE8530;
  v6 = (void *)MEMORY[0x2207A8518](v4, v5);
  swift_bridgeObjectRelease();
  v7 = *v1;
  v8 = objc_msgSend(*v1, sel_color);
  objc_msgSend(v7, sel_width);
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33B8]), sel_initWithInkType_color_width_, v6, v8, v9);

  *v1 = v10;
}

char PKInkingTool.inkType.modify(id **a1)
{
  id *v1;
  _BYTE *v2;
  id v3;
  Swift::String v4;
  uint64_t v5;
  char v7;

  *a1 = v1;
  v2 = a1 + 1;
  v3 = objc_msgSend(*v1, sel_inkType);
  v4._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
  LOBYTE(v5) = PKInkingTool.InkType.init(rawValue:)(v4);
  if (v7 == 3)
  {
    __break(1u);
  }
  else
  {

    *v2 = v7;
    return (char)PKInkingTool.inkType.modify;
  }
  return v5;
}

void PKInkingTool.inkType.modify(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  id *v4;
  void *v5;
  id v6;
  id v7;
  double v8;
  id v9;

  v1 = 0xD000000000000014;
  v2 = 0x800000021DFE8550;
  if (*(_BYTE *)(a1 + 8) != 1)
    v2 = 0x800000021DFE8570;
  if (*(_BYTE *)(a1 + 8))
  {
    v3 = v2;
  }
  else
  {
    v1 = 0xD000000000000011;
    v3 = 0x800000021DFE8530;
  }
  v4 = *(id **)a1;
  v5 = (void *)MEMORY[0x2207A8518](v1, v3);
  swift_bridgeObjectRelease();
  v6 = *v4;
  v7 = objc_msgSend(*v4, sel_color);
  objc_msgSend(v6, sel_width);
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33B8]), sel_initWithInkType_color_width_, v5, v7, v8);

  *v4 = v9;
}

uint64_t static PKInkingTool.== infix(_:_:)()
{
  type metadata accessor for NSObject();
  return static NSObject.== infix(_:_:)() & 1;
}

void PKInkingTool.init(ink:width:)(_QWORD *a1@<X0>, _QWORD *a2@<X8>, double a3@<D0>)
{
  void *v4;
  id v5;

  v4 = (void *)*a1;
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33B8]), sel_initWithInk_width_, *a1, a3);

  *a2 = v5;
}

void PKInkingTool.ink.getter(_QWORD *a1@<X8>)
{
  id *v1;
  id v3;
  id v4;
  void *v5;

  v3 = objc_msgSend(*v1, sel_ink);
  if (!v3)
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
    v5 = (void *)MEMORY[0x2207A8518](0xD000000000000011, 0x800000021DFE8530);
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33B0]), sel_initWithInkType_color_, v5, v4);

  }
  *a1 = v3;
}

id static PKInkingTool._forceBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{

  *a2 = a1;
  return a1;
}

uint64_t static PKInkingTool._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  id v4;

  *a2 = a1;
  v4 = a1;
  return 1;
}

unint64_t lazy protocol witness table accessor for type PKInkingTool.InkType and conformance PKInkingTool.InkType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type PKInkingTool.InkType and conformance PKInkingTool.InkType;
  if (!lazy protocol witness table cache variable for type PKInkingTool.InkType and conformance PKInkingTool.InkType)
  {
    result = MEMORY[0x2207A87E8](&protocol conformance descriptor for PKInkingTool.InkType, &type metadata for PKInkingTool.InkType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PKInkingTool.InkType and conformance PKInkingTool.InkType);
  }
  return result;
}

id sub_21DFE5D54@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_color);
  *a2 = result;
  return result;
}

void sub_21DFE5D8C(id *a1)
{
  PKInkingTool.color.setter(*a1);
}

id sub_21DFE5DB4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_width);
  *a2 = v4;
  return result;
}

void sub_21DFE5DE4(double *a1)
{
  PKInkingTool.width.setter(*a1);
}

void sub_21DFE5E0C(char *a1)
{
  char v1;

  v1 = *a1;
  PKInkingTool.inkType.setter(&v1);
}

ValueMetadata *type metadata accessor for PKInkingTool()
{
  return &type metadata for PKInkingTool;
}

uint64_t getEnumTagSinglePayload for PKInkingTool.InkType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PKInkingTool.InkType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21DFE5F2C + 4 * byte_21DFE904D[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21DFE5F60 + 4 * asc_21DFE9048[v4]))();
}

uint64_t sub_21DFE5F60(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DFE5F68(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21DFE5F70);
  return result;
}

uint64_t sub_21DFE5F7C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21DFE5F84);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21DFE5F88(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DFE5F90(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *destructiveInjectEnumTag for PKInkingTool.InkType(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PKInkingTool.InkType()
{
  return &type metadata for PKInkingTool.InkType;
}

PencilKit::PKDrawing __swiftcall PKDrawing.init()()
{
  PencilKit::PKDrawing *v0;
  PencilKit::PKDrawing *v1;
  PencilKit::PKDrawing result;

  v1 = v0;
  result.drawing.super.isa = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE3380]), sel_init);
  v1->drawing.super.isa = result.drawing.super.isa;
  return result;
}

uint64_t PKDrawing.init(data:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  id v7;
  id v8;
  uint64_t result;

  v7 = objc_allocWithZone(MEMORY[0x24BDE3380]);
  v8 = specialized @nonobjc PKDrawing.init(data:)();
  result = outlined consume of Data._Representation(a1, a2);
  if (!v3)
    *a3 = v8;
  return result;
}

uint64_t PKDrawing.dataRepresentation()()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(*v0, sel_dataRepresentation);
  v2 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

id PKDrawing.bounds.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_bounds);
}

id PKDrawing.image(from:scale:)()
{
  id *v0;

  return objc_msgSend(*v0, sel_imageFromRect_scale_);
}

Swift::Void __swiftcall PKDrawing.transform(using:)(CGAffineTransform *using)
{
  void **v1;
  void *v2;
  __int128 v3;
  id v4;
  id v5;
  _OWORD v6[3];

  v2 = *v1;
  v3 = *(_OWORD *)&using->c;
  v6[0] = *(_OWORD *)&using->a;
  v6[1] = v3;
  v6[2] = *(_OWORD *)&using->tx;
  v4 = objc_msgSend(v2, sel_drawingByApplyingTransform_, v6);
  if (v4)
  {
    v5 = v4;

    *v1 = v5;
  }
  else
  {
    __break(1u);
  }
}

PencilKit::PKDrawing __swiftcall PKDrawing.transformed(using:)(CGAffineTransform *using)
{
  PencilKit::PKDrawing *v1;
  void **v2;
  PencilKit::PKDrawing *v3;
  void *v4;
  __int128 v5;
  PencilKit::PKDrawing result;
  _OWORD v7[3];

  v3 = v1;
  v4 = *v2;
  v5 = *(_OWORD *)&using->c;
  v7[0] = *(_OWORD *)&using->a;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&using->tx;
  result.drawing.super.isa = (Class)objc_msgSend(v4, sel_drawingByApplyingTransform_, v7);
  if (result.drawing.super.isa)
    v3->drawing.super.isa = result.drawing.super.isa;
  else
    __break(1u);
  return result;
}

Swift::Void __swiftcall PKDrawing.append(_:)(PencilKit::PKDrawing a1)
{
  id *v1;
  id v2;
  id v3;
  id v4;

  v2 = *v1;
  v3 = objc_msgSend(*v1, sel_drawingByAppendingDrawing_, *(_QWORD *)a1.drawing.super.isa);
  if (v3)
  {
    v4 = v3;

    *v1 = v4;
  }
  else
  {
    __break(1u);
  }
}

PKDrawing __swiftcall PKDrawing._bridgeToObjectiveC()()
{
  id *v0;

  return (PKDrawing)*v0;
}

PencilKit::PKDrawing __swiftcall PKDrawing.appending(_:)(PencilKit::PKDrawing a1)
{
  PencilKit::PKDrawing *v1;
  id *v2;
  PencilKit::PKDrawing *v3;
  PencilKit::PKDrawing result;

  v3 = v1;
  result.drawing.super.isa = (Class)objc_msgSend(*v2, sel_drawingByAppendingDrawing_, *(_QWORD *)a1.drawing.super.isa);
  if (!result.drawing.super.isa)
    result.drawing.super.isa = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE3380]), sel_init);
  v3->drawing.super.isa = result.drawing.super.isa;
  return result;
}

id static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)@<X0>(id a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = a1;
  if (!a1)
  {
    a1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE3380]), sel_init);
    v2 = 0;
  }
  *a2 = a1;
  return v2;
}

uint64_t PKDrawing.init<A>(strokes:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  Class isa;
  id v10;
  uint64_t result;
  uint64_t v12;

  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  Array.init<A>(_:)();
  v8 = objc_allocWithZone(MEMORY[0x24BDE3380]);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v8, sel_initWithStrokes_, isa);

  result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
  *a3 = v10;
  return result;
}

uint64_t PKDrawing.strokes.getter()
{
  id *v0;
  id v1;
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  uint64_t v10;

  v1 = objc_msgSend(*v0, sel_strokes);
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v10 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3, 0);
    v4 = 0;
    v5 = v10;
    do
    {
      v6 = *(_QWORD *)(v10 + 16);
      v7 = *(_QWORD *)(v10 + 24);
      v8 = *(id *)(v2 + 8 * v4 + 32);
      if (v6 >= v7 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v6 + 1, 1);
      ++v4;
      *(_QWORD *)(v10 + 16) = v6 + 1;
      *(_QWORD *)(v10 + 8 * v6 + 32) = v8;
    }
    while (v3 != v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  return v5;
}

void key path setter for PKDrawing.strokes : PKDrawing(uint64_t a1, id *a2)
{
  id v3;
  Class isa;
  id v5;

  v3 = objc_allocWithZone(MEMORY[0x24BDE3380]);
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v3, sel_initWithStrokes_, isa);

  *a2 = v5;
}

void PKDrawing.strokes.setter()
{
  id *v0;
  id v1;
  Class isa;
  id v3;

  v1 = objc_allocWithZone(MEMORY[0x24BDE3380]);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v1, sel_initWithStrokes_, isa);

  *v0 = v3;
}

void (*PKDrawing.strokes.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = PKDrawing.strokes.getter();
  return PKDrawing.strokes.modify;
}

void PKDrawing.strokes.modify(uint64_t a1, char a2)
{
  id v4;
  id *v5;
  Class isa;
  id v7;
  Class v8;
  id v9;

  v4 = objc_allocWithZone(MEMORY[0x24BDE3380]);
  v5 = *(id **)(a1 + 8);
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v7 = objc_msgSend(v4, sel_initWithStrokes_, isa);

    *v5 = v7;
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v9 = objc_msgSend(v4, sel_initWithStrokes_, v8);

    *v5 = v9;
  }
}

uint64_t static PKDrawing.== infix(_:_:)()
{
  type metadata accessor for NSObject();
  return static NSObject.== infix(_:_:)() & 1;
}

uint64_t PKDrawing.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  id v5;
  id v6;
  uint64_t v8;
  unint64_t v9;
  _QWORD v10[4];

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Decoder.singleValueContainer()();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v10, v10[3]);
    lazy protocol witness table accessor for type Data and conformance Data();
    dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)();
    v5 = objc_allocWithZone(MEMORY[0x24BDE3380]);
    v6 = specialized @nonobjc PKDrawing.init(data:)();
    outlined consume of Data._Representation(v8, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
    *a2 = v6;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t PKDrawing.encode(to:)(_QWORD *a1)
{
  void **v1;
  void *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _BYTE v8[24];
  uint64_t v9;

  v2 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  v3 = objc_msgSend(v2, sel_dataRepresentation);
  v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;

  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v8, v9);
  lazy protocol witness table accessor for type Data and conformance Data();
  dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)();
  outlined consume of Data._Representation(v4, v6);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t protocol witness for Decodable.init(from:) in conformance PKDrawing@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return PKDrawing.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance PKDrawing(_QWORD *a1)
{
  return PKDrawing.encode(to:)(a1);
}

id static PKDrawing._forceBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{

  *a2 = a1;
  return a1;
}

uint64_t static PKDrawing._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  id v4;

  *a2 = a1;
  v4 = a1;
  return 1;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance PKDrawing@<X0>(id a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = a1;
  if (!a1)
  {
    a1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE3380]), sel_init);
    v2 = 0;
  }
  *a2 = a1;
  return v2;
}

id specialized @nonobjc PKDrawing.init(data:)()
{
  void *v0;
  Class isa;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  isa = Data._bridgeToObjectiveC()().super.isa;
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_initWithData_error_, isa, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
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

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type Data and conformance Data()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    result = MEMORY[0x2207A87E8](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    result = MEMORY[0x2207A87E8](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
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

uint64_t sub_21DFE6BDC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = PKDrawing.strokes.getter();
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for PKDrawing()
{
  return &type metadata for PKDrawing;
}

id static PKLassoTool._unconditionallyBridgeFromObjectiveC(_:)@<X0>(id result@<X0>, id *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

PKLassoTool __swiftcall PKLassoTool._bridgeToObjectiveC()()
{
  id *v0;

  return (PKLassoTool)*v0;
}

PencilKit::PKLassoTool __swiftcall PKLassoTool.init()()
{
  PencilKit::PKLassoTool *v0;
  PencilKit::PKLassoTool *v1;
  PencilKit::PKLassoTool result;

  v1 = v0;
  result.tool.super.super.isa = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33C0]), sel_init);
  v1->tool.super.super.isa = result.tool.super.super.isa;
  return result;
}

uint64_t static PKLassoTool.== infix(_:_:)()
{
  type metadata accessor for NSObject();
  return static NSObject.== infix(_:_:)() & 1;
}

id static PKLassoTool._forceBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{

  *a2 = a1;
  return a1;
}

uint64_t static PKLassoTool._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  id v4;

  *a2 = a1;
  v4 = a1;
  return 1;
}

ValueMetadata *type metadata accessor for PKLassoTool()
{
  return &type metadata for PKLassoTool;
}

uint64_t PKToolPicker.selectedTool.getter@<X0>(uint64_t *a1@<X8>)
{
  void *v1;
  id v3;
  uint64_t result;
  _UNKNOWN **v5;
  ValueMetadata *v6;
  id v7;
  id v8;

  v3 = objc_msgSend(v1, sel_selectedTool);
  objc_opt_self();
  result = swift_dynamicCastObjCClass();
  if (result)
  {
    v5 = &protocol witness table for PKInkingTool;
    v6 = &type metadata for PKInkingTool;
LABEL_7:
    a1[3] = (uint64_t)v6;
    a1[4] = (uint64_t)v5;
    *a1 = result;
    return result;
  }

  v7 = objc_msgSend(v1, sel_selectedTool);
  objc_opt_self();
  result = swift_dynamicCastObjCClass();
  if (result)
  {
    v5 = &protocol witness table for PKEraserTool;
    v6 = &type metadata for PKEraserTool;
    goto LABEL_7;
  }

  v8 = objc_msgSend(v1, sel_selectedTool);
  objc_opt_self();
  result = swift_dynamicCastObjCClass();
  if (result)
  {
    v5 = &protocol witness table for PKLassoTool;
    v6 = &type metadata for PKLassoTool;
    goto LABEL_7;
  }

  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t PKToolPicker.selectedTool.setter(uint64_t a1)
{
  void *v1;
  uint64_t result;
  void *v4;
  _BYTE v5[40];

  outlined init with copy of PKTool(a1, (uint64_t)v5);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PKTool);
  if (swift_dynamicCast()
    || (outlined init with copy of PKTool(a1, (uint64_t)v5), swift_dynamicCast())
    || (outlined init with copy of PKTool(a1, (uint64_t)v5), swift_dynamicCast()))
  {
    objc_msgSend(v1, sel_setSelectedTool_, v4);

    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

void (*PKToolPicker.selectedTool.modify(uint64_t **a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t *v3;

  v3 = (uint64_t *)malloc(0x58uLL);
  *a1 = v3;
  v3[10] = v1;
  PKToolPicker.selectedTool.getter(v3);
  return PKToolPicker.selectedTool.modify;
}

void PKToolPicker.selectedTool.modify(uint64_t *a1, char a2)
{
  void *v2;

  v2 = (void *)*a1;
  if ((a2 & 1) != 0)
  {
    outlined init with copy of PKTool(*a1, (uint64_t)v2 + 40);
    PKToolPicker.selectedTool.setter((uint64_t)v2 + 40);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    PKToolPicker.selectedTool.setter(*a1);
  }
  free(v2);
}

uint64_t sub_21DFE7070@<X0>(uint64_t *a1@<X8>)
{
  return PKToolPicker.selectedTool.getter(a1);
}

uint64_t sub_21DFE7090(uint64_t a1)
{
  _BYTE v2[40];

  outlined init with copy of PKTool(a1, (uint64_t)v2);
  return PKToolPicker.selectedTool.setter((uint64_t)v2);
}

PencilKit::PKStrokePoint_optional __swiftcall PKStrokePath.InterpolatedSlice.next()()
{
  objc_class *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  double v5;
  double v6;
  id v7;
  id v8;
  id v9;
  char v10;
  Swift::Bool v11;
  double v12;
  uint64_t v13;
  char v14;
  id v15;
  PencilKit::PKStrokePoint_optional result;

  v3 = v2;
  v4 = v1;
  v6 = *(double *)(v3 + 32);
  v5 = *(double *)(v3 + 40);
  if (v6 >= v5)
  {
    v7 = *(id *)v3;
    v8 = objc_msgSend(v7, sel_interpolatedPointAt_, v5);
    v9 = v8;
    if (v6 <= v5 + 0.001)
    {
      if (v8)
      {

        *v4 = v9;
        v12 = v5 + 1.0;
        goto LABEL_8;
      }
    }
    else if (v8)
    {

      *v4 = v9;
      v15 = v7;
      v10 = *(_BYTE *)(v3 + 16);
      v13 = *(_QWORD *)(v3 + 8);
      v14 = v10;
      PKStrokePath.parametricValue(_:offsetBy:)((uint64_t)&v13, v5);
LABEL_8:
      *(double *)(v3 + 40) = v12;
      goto LABEL_10;
    }
    v0 = (objc_class *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    goto LABEL_10;
  }
  *v1 = 0;
LABEL_10:
  result.value.strokePoint.super.isa = v0;
  result.is_nil = v11;
  return result;
}

unint64_t lazy protocol witness table accessor for type PKStrokePath.InterpolatedSlice and conformance PKStrokePath.InterpolatedSlice()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type PKStrokePath.InterpolatedSlice and conformance PKStrokePath.InterpolatedSlice;
  if (!lazy protocol witness table cache variable for type PKStrokePath.InterpolatedSlice and conformance PKStrokePath.InterpolatedSlice)
  {
    result = MEMORY[0x2207A87E8](&protocol conformance descriptor for PKStrokePath.InterpolatedSlice, &type metadata for PKStrokePath.InterpolatedSlice);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PKStrokePath.InterpolatedSlice and conformance PKStrokePath.InterpolatedSlice);
  }
  return result;
}

double protocol witness for Sequence.makeIterator() in conformance PKStrokePath.InterpolatedSlice@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  double result;

  v2 = *(_QWORD *)(v1 + 8);
  v3 = *(_BYTE *)(v1 + 16);
  result = *(double *)(v1 + 40);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 24);
  *(double *)(a1 + 40) = result;
  return result;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance PKStrokePath.InterpolatedSlice()
{
  return 0;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance PKStrokePath.InterpolatedSlice()
{
  _OWORD *v0;
  __int128 v1;
  uint64_t v2;
  _OWORD v4[3];

  v1 = v0[1];
  v4[0] = *v0;
  v4[1] = v1;
  v4[2] = v0[2];
  v2 = specialized _copySequenceToContiguousArray<A>(_:)((uint64_t)v4);
  outlined release of PKStrokePath.InterpolatedSlice((id *)v4);
  return v2;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance PKStrokePath.InterpolatedSlice(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3);
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id *v4;
  double v5;
  double v6;
  uint64_t v7;
  int v8;
  double v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  double v14;
  _UNKNOWN **v15;
  id v16;
  id v17;
  id v18;
  double v19;
  double v20;
  id v21;
  int64_t v22;
  void *v23;
  id v24;
  uint64_t result;
  uint64_t v26;
  id *v28;
  uint64_t v29;
  double v30;
  int v31;
  uint64_t v32;

  v4 = (id *)v3;
  if (!a2)
  {
    a3 = 0;
    v12 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)a1 = *(_OWORD *)v3;
    *(_OWORD *)(a1 + 16) = v12;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(v3 + 32);
    return a3;
  }
  v6 = *(double *)(v3 + 32);
  v5 = *(double *)(v3 + 40);
  v7 = *(_QWORD *)(v3 + 24);
  v8 = *(unsigned __int8 *)(v3 + 16);
  v10 = *(id *)v3;
  v9 = *(double *)(v3 + 8);
  if (!a3)
  {
LABEL_29:
    *(_QWORD *)a1 = v10;
    *(double *)(a1 + 8) = v9;
    *(_BYTE *)(a1 + 16) = v8;
    *(_QWORD *)(a1 + 24) = v7;
    *(double *)(a1 + 32) = v6;
    *(double *)(a1 + 40) = v5;
    return a3;
  }
  if (a3 < 0)
    goto LABEL_33;
  v29 = a1;
  v30 = *(double *)(v3 + 8);
  if (v6 < v5)
  {
    v11 = 0;
LABEL_27:
    *(_QWORD *)v29 = v10;
    *(double *)(v29 + 8) = v30;
    *(_BYTE *)(v29 + 16) = v8;
    *(_QWORD *)(v29 + 24) = v7;
    *(double *)(v29 + 32) = v6;
    a3 = v11;
    *(double *)(v29 + 40) = v5;
    return a3;
  }
  v13 = a2;
  v11 = 0;
  v14 = v9;
  v26 = a3;
  v32 = a3 - 1;
  v15 = &off_24E203000;
  v31 = v8;
  v28 = v4;
  while (1)
  {
    v16 = v10;
    v17 = objc_msgSend(v16, (SEL)v15[397], v5);
    v18 = v17;
    if (v6 <= v5 + 0.001)
    {
      if (!v17)
        goto LABEL_34;
      outlined release of PKStrokePath.InterpolatedSlice(v4);
      v5 = v5 + 1.0;
      goto LABEL_25;
    }
    if (!v17)
      goto LABEL_34;

    if (!v31)
    {
      objc_msgSend(v16, sel_parametricValue_offsetByDistance_, v5, v14);
      v5 = v20;
      LOBYTE(v8) = 0;
      goto LABEL_25;
    }
    if (v31 == 1)
    {
      objc_msgSend(v16, sel_parametricValue_offsetByTime_, v5, v14);
      v5 = v19;
      LOBYTE(v8) = 1;
      goto LABEL_25;
    }
    v21 = v16;
    v22 = (int64_t)objc_msgSend(v21, sel_count);
    if (((unint64_t)objc_msgSend(v21, sel_count) & 0x8000000000000000) != 0)
      break;
    v23 = v10;
    v24 = objc_msgSend(v21, "4");

    if (v22 < 0 || (uint64_t)v24 < v22)
      goto LABEL_32;
    if (v5 + v14 >= (double)(v22 - 1))
      v5 = (double)(v22 - 1);
    else
      v5 = v5 + v14;
    LOBYTE(v8) = 2;
    if (v5 < 0.0)
      v5 = 0.0;
    v10 = v23;
    v15 = &off_24E203000;
    v13 = a2;
    v4 = v28;
LABEL_25:
    *(_QWORD *)(v13 + 8 * v11) = v18;
    if (v32 == v11)
    {
      a3 = v26;
      a1 = v29;
      v9 = v30;
      LOBYTE(v8) = v31;
      goto LABEL_29;
    }
    ++v11;
    if (v6 < v5)
      goto LABEL_27;
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id *outlined release of PKStrokePath.InterpolatedSlice(id *a1)
{

  return a1;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(_QWORD *a1, uint64_t a2, uint64_t a3, id a4)
{
  uint64_t v8;
  id v9;
  id v10;
  uint64_t result;

  if (!a2)
  {
    v8 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
LABEL_11:
    v8 = a3;
    goto LABEL_12;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v8 = 0;
    if (objc_msgSend(a4, sel_count))
    {
      do
      {
        v9 = objc_msgSend(a4, sel_objectAtIndexedSubscript_, v8);
        if (!v9)
          goto LABEL_15;
        v10 = v9;
        if (v8 >= (uint64_t)objc_msgSend(a4, sel_count))
        {
          __break(1u);
          goto LABEL_14;
        }
        *(_QWORD *)(a2 + 8 * v8) = v10;
        if (a3 - 1 == v8)
          goto LABEL_11;
      }
      while ((id)++v8 != objc_msgSend(a4, sel_count));
    }
LABEL_12:
    *a1 = a4;
    a1[1] = v8;
    return v8;
  }
LABEL_14:
  __break(1u);
LABEL_15:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _copySequenceToContiguousArray<A>(_:)(uint64_t a1)
{
  double v1;
  double v2;
  _QWORD *v3;
  uint64_t v4;
  id v6;
  _QWORD *v7;
  _UNKNOWN **v8;
  id v9;
  id v10;
  id v11;
  double v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  _QWORD *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  const void *v22;
  BOOL v23;
  double v24;
  id v25;
  int64_t v26;
  id v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32[2];
  double v33;
  char v34;

  v2 = *(double *)(a1 + 32);
  v1 = *(double *)(a1 + 40);
  v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v2 >= v1)
  {
    outlined init with take of PKStrokePath.InterpolatedSlice.Stride((uint64_t *)(a1 + 8), (uint64_t)v32);
    v6 = *(id *)a1;
    outlined retain of PKStrokePath.InterpolatedSlice((id *)a1);
    v4 = 0;
    v7 = v3 + 4;
    v8 = &off_24E203000;
    while (1)
    {
      v9 = v6;
      v10 = objc_msgSend(v9, sel_interpolatedPointAt_, v1);
      v11 = v10;
      if (v2 <= v1 + 0.001)
      {
        if (!v10)
          goto LABEL_46;
        outlined release of PKStrokePath.InterpolatedSlice((id *)a1);
        v1 = v1 + 1.0;
      }
      else
      {
        if (!v10)
          goto LABEL_46;

        outlined init with take of PKStrokePath.InterpolatedSlice.Stride(v32, (uint64_t)&v33);
        if (!v34)
        {
          objc_msgSend(v9, sel_parametricValue_offsetByDistance_, v1, v33);
          goto LABEL_12;
        }
        if (v34 == 1)
        {
          objc_msgSend(v9, sel_parametricValue_offsetByTime_, v1, v33);
LABEL_12:
          v1 = v12;
          goto LABEL_13;
        }
        v24 = v33;
        v25 = v9;
        v26 = (int64_t)objc_msgSend(v25, (SEL)v8[398]);
        if (((unint64_t)objc_msgSend(v25, (SEL)v8[398]) & 0x8000000000000000) != 0)
          goto LABEL_43;
        v27 = objc_msgSend(v25, (SEL)v8[398]);

        if (v26 < 0 || (uint64_t)v27 < v26)
          goto LABEL_44;
        if (v1 + v24 >= (double)(v26 - 1))
          v1 = (double)(v26 - 1);
        else
          v1 = v1 + v24;
        v8 = &off_24E203000;
        if (v1 < 0.0)
          v1 = 0.0;
      }
LABEL_13:
      if (!v4)
      {
        v13 = v3[3];
        if ((uint64_t)((v13 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_42;
        v14 = v13 & 0xFFFFFFFFFFFFFFFELL;
        if (v14 <= 1)
          v15 = 1;
        else
          v15 = v14;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<PKStrokePoint>);
        v16 = (_QWORD *)swift_allocObject();
        v17 = _swift_stdlib_malloc_size(v16);
        v18 = v17 - 32;
        if (v17 < 32)
          v18 = v17 - 25;
        v19 = v18 >> 3;
        v16[2] = v15;
        v16[3] = 2 * (v18 >> 3);
        v20 = (unint64_t)(v16 + 4);
        v21 = v3[3] >> 1;
        if (v3[2])
        {
          v22 = v3 + 4;
          if (v16 != v3 || v20 >= (unint64_t)v22 + 8 * v21)
            memmove(v16 + 4, v22, 8 * v21);
          v3[2] = 0;
        }
        v7 = (_QWORD *)(v20 + 8 * v21);
        v4 = (v19 & 0x7FFFFFFFFFFFFFFFLL) - v21;
        swift_release();
        v3 = v16;
        v8 = &off_24E203000;
      }
      v23 = __OFSUB__(v4--, 1);
      if (v23)
      {
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
        result = _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
        return result;
      }
      *v7++ = v11;
      if (v2 < v1)
      {

        goto LABEL_37;
      }
    }
  }
  v4 = 0;
LABEL_37:
  v28 = v3[3];
  if (v28 >= 2)
  {
    v29 = v28 >> 1;
    v23 = __OFSUB__(v29, v4);
    v30 = v29 - v4;
    if (v23)
      goto LABEL_45;
    v3[2] = v30;
  }
  return (uint64_t)v3;
}

uint64_t outlined init with take of PKStrokePath.InterpolatedSlice.Stride(uint64_t *a1, uint64_t a2)
{
  __swift_memcpy9_8(a2, a1);
  return a2;
}

id *outlined retain of PKStrokePath.InterpolatedSlice(id *a1)
{
  id v2;

  v2 = *a1;
  return a1;
}

id static PKInk._unconditionallyBridgeFromObjectiveC(_:)@<X0>(void *a1@<X0>, _QWORD *a2@<X8>)
{
  id v3;
  id v4;
  void *v5;

  if (a1)
  {
    v3 = a1;
  }
  else
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
    v5 = (void *)MEMORY[0x2207A8518](0xD000000000000011, 0x800000021DFE8530);
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33B0]), sel_initWithInkType_color_, v5, v4);

    a1 = 0;
  }
  *a2 = v3;
  return a1;
}

PencilKit::PKInk __swiftcall PKInk.init(_:color:)(PencilKit::PKInkingTool::InkType _, UIColor color)
{
  _QWORD *v2;
  _QWORD *v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v9;
  id v10;
  PencilKit::PKInk result;

  v3 = v2;
  v4 = *(unsigned __int8 *)_;
  v5 = 0x800000021DFE8550;
  if (v4 != 1)
    v5 = 0x800000021DFE8570;
  if (*(_BYTE *)_)
    v6 = 0xD000000000000014;
  else
    v6 = 0xD000000000000011;
  if (v4)
    v7 = v5;
  else
    v7 = 0x800000021DFE8530;
  v9 = (void *)MEMORY[0x2207A8518](v6, v7);
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33B0]), sel_initWithInkType_color_, v9, color.super.isa);

  *v3 = v10;
  return result;
}

void PKInk.inkType.getter(_BYTE *a1@<X8>)
{
  id *v1;
  id v3;
  Swift::String v4;
  char v5;

  v3 = objc_msgSend(*v1, sel_inkType);
  v4._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
  PKInkingTool.InkType.init(rawValue:)(v4);
  if (v5 == 3)
  {
    __break(1u);
  }
  else
  {

    *a1 = v5;
  }
}

void PKInk.inkType.setter(_BYTE *a1)
{
  id *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v2 = *a1;
  v3 = 0x800000021DFE8550;
  if (v2 != 1)
    v3 = 0x800000021DFE8570;
  if (*a1)
    v4 = 0xD000000000000014;
  else
    v4 = 0xD000000000000011;
  if (v2)
    v5 = v3;
  else
    v5 = 0x800000021DFE8530;
  v6 = (void *)MEMORY[0x2207A8518](v4, v5);
  swift_bridgeObjectRelease();
  v7 = *v1;
  v8 = objc_msgSend(*v1, sel_color);
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33B0]), sel_initWithInkType_color_, v6, v8);

  *v1 = v9;
}

id PKInk.color.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_color);
}

char PKInk.inkType.modify(id **a1)
{
  id *v1;
  _BYTE *v2;
  id v3;
  Swift::String v4;
  uint64_t v5;
  char v7;

  *a1 = v1;
  v2 = a1 + 1;
  v3 = objc_msgSend(*v1, sel_inkType);
  v4._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
  LOBYTE(v5) = PKInkingTool.InkType.init(rawValue:)(v4);
  if (v7 == 3)
  {
    __break(1u);
  }
  else
  {

    *v2 = v7;
    return (char)PKInk.inkType.modify;
  }
  return v5;
}

void PKInk.inkType.modify(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  id *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v1 = 0xD000000000000014;
  v2 = 0x800000021DFE8550;
  if (*(_BYTE *)(a1 + 8) != 1)
    v2 = 0x800000021DFE8570;
  if (*(_BYTE *)(a1 + 8))
  {
    v3 = v2;
  }
  else
  {
    v1 = 0xD000000000000011;
    v3 = 0x800000021DFE8530;
  }
  v4 = *(id **)a1;
  v5 = (void *)MEMORY[0x2207A8518](v1, v3);
  swift_bridgeObjectRelease();
  v6 = *v4;
  v7 = objc_msgSend(*v4, sel_color);
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33B0]), sel_initWithInkType_color_, v5, v7);

  *v4 = v8;
}

void key path setter for PKInk.color : PKInk(id *a1, void **a2)
{
  void *v3;
  id v4;
  id v5;
  id v6;

  v3 = *a2;
  v4 = *a1;
  v5 = objc_msgSend(v3, sel_inkType);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33B0]), sel_initWithInkType_color_, v5, v4);

  *a2 = v6;
}

void PKInk.color.setter(void *a1)
{
  id *v1;
  id v3;
  id v4;
  id v5;

  v3 = *v1;
  v4 = objc_msgSend(*v1, sel_inkType);
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33B0]), sel_initWithInkType_color_, v4, a1);

  *v1 = v5;
}

void (*PKInk.color.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  id *v1;

  a1[1] = v1;
  *a1 = objc_msgSend(*v1, sel_color);
  return PKInk.color.modify;
}

void PKInk.color.modify(uint64_t a1, char a2)
{
  void *v2;
  id *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v2 = *(void **)a1;
  v3 = *(id **)(a1 + 8);
  v4 = *v3;
  if ((a2 & 1) != 0)
  {
    v9 = v2;
    v5 = objc_msgSend(v4, sel_inkType);
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33B0]), sel_initWithInkType_color_, v5, v9);

    *v3 = v6;
  }
  else
  {
    v7 = objc_msgSend(*v3, sel_inkType);
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE33B0]), sel_initWithInkType_color_, v7, v2);

    *v3 = v8;
  }
}

PKInk __swiftcall PKInk._bridgeToObjectiveC()()
{
  id *v0;

  return (PKInk)*v0;
}

id static PKInk._forceBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{

  *a2 = a1;
  return a1;
}

uint64_t static PKInk._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  id v4;

  *a2 = a1;
  v4 = a1;
  return 1;
}

void sub_21DFE817C(char *a1)
{
  char v1;

  v1 = *a1;
  PKInk.inkType.setter(&v1);
}

id sub_21DFE81B0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_color);
  *a2 = result;
  return result;
}

ValueMetadata *type metadata accessor for PKInk()
{
  return &type metadata for PKInk;
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
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

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x24BEE0E70]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t Array.init<A>(_:)()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x24BEE3068]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x24BEE3290](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)()
{
  return MEMORY[0x24BEE3A88]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)()
{
  return MEMORY[0x24BEE3B20]();
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

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x24BEE4628]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

