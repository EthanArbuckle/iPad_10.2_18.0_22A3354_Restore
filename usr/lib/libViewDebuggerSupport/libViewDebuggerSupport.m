uint64_t __dbg_ScreenShape()
{
  uint64_t result;
  BOOL v1;

  result = _UIScreenTypePrivateForScreen();
  v1 = (unint64_t)(result - 10000) > 0xA || ((1 << (result - 16)) & 0x41F) == 0;
  if (v1 && ((unint64_t)(result - 20000) > 0xB || ((1 << (result - 32)) & 0xC03) == 0))
    return -1;
  return result;
}

char *resetDyldInsertLibraries()
{
  char *result;
  const char *v1;
  char *v2;
  size_t v3;
  int v4;
  char *v5;
  int v6;
  size_t i;
  const char *v8;
  size_t v9;
  BOOL v10;
  _BOOL8 v11;
  const char *v12;
  char *v13;
  const char *v14;
  uint64_t v15;

  result = getenv("DYLD_INSERT_LIBRARIES");
  if (result)
  {
    v1 = result;
    strlen(result);
    v2 = (char *)&v15 - ((__chkstk_darwin() + 16) & 0xFFFFFFFFFFFFFFF0);
    bzero(v2, v3);
    v4 = *(unsigned __int8 *)v1;
    if (!*v1)
      return (char *)unsetenv("DYLD_INSERT_LIBRARIES");
    v5 = v2;
    v6 = *(unsigned __int8 *)v1;
    do
    {
      for (i = 0; v6; v6 = v1[++i])
      {
        if (v6 == 58)
          break;
      }
      v8 = v1;
      if (i)
      {
        v9 = i;
        while (v1[v9] != 47)
        {
          if (!--v9)
          {
            v4 = *(unsigned __int8 *)v1;
            v8 = v1;
            goto LABEL_13;
          }
        }
        v8 = &v1[v9];
        v4 = 47;
      }
LABEL_13:
      v10 = v4 == 47;
      v11 = v4 == 47;
      if (v10)
        v12 = v8 + 1;
      else
        v12 = v8;
      if (&v1[i] == v12)
      {
        v1 += i;
      }
      else
      {
        if (strncmp(v12, "libViewDebuggerSupport.dylib", v1 - v8 - v11 + i))
        {
          v13 = v2;
          if (v5 != v2)
          {
            *v5 = 58;
            v13 = v5 + 1;
          }
          v5 = stpncpy(v13, v1, i);
          v6 = v1[i];
        }
        if (v6 == 58)
          v14 = v1 + 1;
        else
          v14 = v1;
        v1 = &v14[i];
        v6 = v14[i];
      }
      v4 = v6;
    }
    while (v6);
    if (v5 > v2)
    {
      *v5 = 0;
      return (char *)setenv("DYLD_INSERT_LIBRARIES", v2, 1);
    }
    else
    {
      return (char *)unsetenv("DYLD_INSERT_LIBRARIES");
    }
  }
  return result;
}

void sub_F8D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,NSString *a30,const __CFString *a31,NSArray *a32)
{
  if (a2 == 1)
  {
    objc_msgSend(objc_begin_catch(exception_object), "callStackSymbols");
    a30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Exception gathering view hierarchy information: %@ \n%@"));
    a31 = CFSTR("exceptions");
    a32 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &a30, 1);
    +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &a32, &a31, 1), 200, 0, 0);
    objc_end_catch();
    JUMPOUT(0xF894);
  }
  _Unwind_Resume(exception_object);
}

id arrayOfObjectPointers(void *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v1 = a1;
  v2 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v1, "count"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p"), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7)));
        objc_msgSend(v2, "addObject:", v8);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

id viewWantsAutoLayout(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if ((objc_opt_respondsToSelector(v1, "_wantsAutolayout") & 1) != 0)
    v2 = objc_msgSend(v1, "_wantsAutolayout");
  else
    v2 = 0;

  return v2;
}

_UNKNOWN **static ARView.fallback_debugHierarchyAdditionalGroupingIDs()()
{
  return &outlined read-only object #0 of static ARView.fallback_debugHierarchyAdditionalGroupingIDs();
}

id @objc static ARView.fallback_debugHierarchyAdditionalGroupingIDs()(id a1, SEL a2)
{
  return Array._bridgeToObjectiveC()().super.isa;
}

id @objc static ARView.fallback_debugHierarchyObjectsInGroup(withID:on:outOptions:)(id a1, SEL a2, id a3, id a4, id *a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  Class isa;
  _QWORD v13[4];

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v8 = v7;
  v9 = swift_unknownObjectRetain(a4);
  _bridgeAnyObjectToAny(_:)(v13, v9);
  swift_unknownObjectRelease(a4);
  v10 = specialized static ARView.fallback_debugHierarchyObjectsInGroup(withID:on:outOptions:)(v6, v8, (uint64_t)v13);
  swift_bridgeObjectRelease(v8);
  __swift_destroy_boxed_opaque_existential_0(v13);
  if (!v10)
    return 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for DebugHierarchyObject_Fallback);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v10);
  return isa;
}

UIImage_optional __swiftcall ARView.__dbg_snapshotImage()()
{
  void *v0;
  double v1;
  CGFloat v2;
  double v3;
  CGFloat v4;
  id v5;
  double v6;
  CGFloat v7;
  UIImage *v8;
  Swift::Bool v9;
  objc_class *v10;
  UIImage_optional result;
  CGSize v12;

  objc_msgSend(v0, "bounds");
  v2 = v1;
  v4 = v3;
  v5 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
  objc_msgSend(v5, "scale");
  v7 = v6;

  v12.width = v2;
  v12.height = v4;
  UIGraphicsBeginImageContextWithOptions(v12, 0, v7);
  objc_msgSend(v0, "bounds");
  objc_msgSend(v0, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
  v8 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v10 = (objc_class *)v8;
  result.value.super.isa = v10;
  result.is_nil = v9;
  return result;
}

id @objc ARView.__dbg_snapshotImage()(id a1, SEL a2)
{
  id v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  id v7;
  double v8;
  CGFloat v9;
  UIImage *v10;
  CGSize v12;

  v2 = a1;
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
  objc_msgSend(v7, "scale");
  v9 = v8;

  v12.width = v4;
  v12.height = v6;
  UIGraphicsBeginImageContextWithOptions(v12, 0, v9);
  objc_msgSend(v2, "bounds");
  objc_msgSend(v2, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
  v10 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v10;
}

void protocol witness for SetAlgebra.init() in conformance DebugHierarchyPropertyOptions(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *protocol witness for OptionSet.init(rawValue:) in conformance DebugHierarchyPropertyOptions@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v5);
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

id specialized static ARView.fallback_debugHierarchyObjectsInGroup(withID:on:outOptions:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char **v11;
  id result;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  objc_class *v27;
  char *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  objc_super v40;
  void *v41;
  _QWORD v42[4];

  outlined init with copy of Any(a3, (uint64_t)v42);
  v5 = type metadata accessor for ARView(0);
  if ((swift_dynamicCast(&v41, v42, (char *)&type metadata for Any + 8, v5, 6) & 1) == 0)
    return 0;
  v6 = v41;
  if ((a1 != 0xD000000000000021 || a2 != 0x8000000000030530)
    && (_stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, 0xD000000000000021, 0x8000000000030530, 0) & 1) == 0)
  {

    return 0;
  }
  v42[0] = v6;
  v7 = _Pointer.debugDescription.getter(&type metadata for UnsafeMutableRawPointer, &protocol witness table for UnsafeMutableRawPointer);
  v9 = v8;
  v10 = (void *)objc_opt_self(DebugHierarchyTargetHub);
  v11 = &selRef_windowContentViewForWindow_;
  result = objc_msgSend(v10, "sharedHub");
  if (!result)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v13 = result;
  specialized DebugHierarchyTargetHub.spatialSceneDebugRepresentationCache.getter();
  v15 = v14;

  if (*(_QWORD *)(v15 + 16))
  {
    swift_bridgeObjectRetain(v9);
    v16 = specialized __RawDictionaryStorage.find<A>(_:)(v7, v9);
    if ((v17 & 1) != 0)
    {
      v18 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v16);
      swift_bridgeObjectRetain(v18);
      swift_bridgeObjectRelease_n(v9, 2);
      swift_bridgeObjectRelease(v15);
      if (!((unint64_t)v18 >> 62))
      {
        v19 = swift_bridgeObjectRetain(v18);
        dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v19);

        swift_bridgeObjectRelease(v18);
        return (id)v18;
      }
      if (v18 < 0)
        v38 = v18;
      else
        v38 = v18 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v18);
      v39 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for DebugHierarchyObject_Fallback);
      v20 = _bridgeCocoaArray<A>(_:)(v38, v39);

      v37 = v18;
LABEL_40:
      swift_bridgeObjectRelease_n(v37, 2);
      return (id)v20;
    }
    swift_bridgeObjectRelease(v9);
  }
  swift_bridgeObjectRelease(v15);
  type metadata accessor for RealityKitHierarchyExporter(0);
  v21 = static RealityKitHierarchyExporter.exportDebugRepresentation(for:)(v6);
  if (!v21)
  {

    swift_bridgeObjectRelease(v9);
    return 0;
  }
  v22 = v21;
  if (!((unint64_t)v21 >> 62))
  {
    v23 = *(_QWORD *)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFFF8));
    if (v23)
      goto LABEL_15;
LABEL_28:
    swift_bridgeObjectRelease(v22);
    v32 = (uint64_t)&_swiftEmptyArrayStorage;
    goto LABEL_29;
  }
  if (v21 >= 0)
    v21 &= 0xFFFFFFFFFFFFFF8uLL;
  v23 = _CocoaArrayWrapper.endIndex.getter(v21);
  if (!v23)
    goto LABEL_28;
LABEL_15:
  v42[0] = &_swiftEmptyArrayStorage;
  result = (id)specialized ContiguousArray.reserveCapacity(_:)(v23);
  if (v23 < 0)
  {
    __break(1u);
    goto LABEL_42;
  }
  v24 = 0;
  do
  {
    if ((v22 & 0xC000000000000001) != 0)
      v25 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v24, v22);
    else
      v25 = *(id *)(v22 + 8 * v24 + 32);
    v26 = v25;
    ++v24;
    v27 = (objc_class *)type metadata accessor for SpatialSceneDebugRepresentationWrapper();
    v28 = (char *)objc_allocWithZone(v27);
    *(_QWORD *)&v28[OBJC_IVAR____TtC22libViewDebuggerSupport38SpatialSceneDebugRepresentationWrapper_sceneDebugRepresentation] = v26;
    v40.receiver = v28;
    v40.super_class = v27;
    v29 = objc_msgSendSuper2(&v40, "init");
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    v30 = *(_QWORD *)(v42[0] + 16);
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v30);
    v31 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v30, v29);
    specialized ContiguousArray._endMutation()(v31);
  }
  while (v23 != v24);
  v32 = v42[0];
  swift_bridgeObjectRelease(v22);
  v11 = &selRef_windowContentViewForWindow_;
LABEL_29:
  result = objc_msgSend(v10, v11[34]);
  if (result)
  {
    v33 = result;
    specialized DebugHierarchyTargetHub.cache(spatialSceneDebugRepresentation:for:)(v32, v7, v9);

    swift_bridgeObjectRelease(v9);
    if (!((unint64_t)v32 >> 62))
    {
      v34 = swift_bridgeObjectRetain(v32);
      dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v34);

      swift_bridgeObjectRelease(v32);
      return (id)v32;
    }
    if (v32 < 0)
      v35 = v32;
    else
      v35 = v32 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v32);
    v36 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for DebugHierarchyObject_Fallback);
    v20 = _bridgeCocoaArray<A>(_:)(v35, v36);

    v37 = v32;
    goto LABEL_40;
  }
LABEL_43:
  __break(1u);
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

Swift::Int specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  char v37;
  _QWORD v38[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, [SpatialSceneDebugRepresentationWrapper]>);
  v37 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v35 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v22 >= v35)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v35)
        goto LABEL_36;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_36:
          swift_release(v5);
          if ((v37 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_45;
            if (v14 >= v35)
              goto LABEL_36;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_33;
          }
        }
        v14 = v25;
      }
    }
LABEL_33:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      swift_bridgeObjectRetain(v33);
    }
    Hasher.init(_seed:)(v38, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v38, v32, v31);
    result = Hasher._finalize()();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v23 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    specialized _NativeDictionary.copy()();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_bridgeObjectRelease(*(_QWORD *)(v19 + 8 * v12));
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain(a3);
    }
    goto LABEL_14;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v15, a4 & 1);
  v21 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, [SpatialSceneDebugRepresentationWrapper]>);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    result = (void *)swift_bridgeObjectRetain(v20);
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void specialized DebugHierarchyTargetHub.spatialSceneDebugRepresentationCache.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  Class isa;
  uint64_t v11;
  uint64_t v12;
  _OWORD v13[2];
  _QWORD v14[4];

  v0 = (void *)objc_opt_self(DebugHierarchyTargetHub);
  v1 = objc_msgSend(v0, "sharedHub");
  if (!v1)
  {
    __break(1u);
    goto LABEL_14;
  }
  v2 = v1;
  v3 = objc_msgSend(v1, "additionalKnownObjects");

  if (!v3)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  *(_QWORD *)&v13[0] = 0xD000000000000018;
  *((_QWORD *)&v13[0] + 1) = 0x80000000000305A0;
  v4 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v13, &type metadata for String);
  v5 = objc_msgSend(v3, "__swift_objectForKeyedSubscript:", v4);
  swift_unknownObjectRelease(v4);

  if (v5)
  {
    _bridgeAnyObjectToAny(_:)(v13, v5);
    swift_unknownObjectRelease(v5);
  }
  else
  {
    memset(v13, 0, sizeof(v13));
  }
  outlined init with take of Any?((uint64_t)v13, (uint64_t)v14);
  if (!v14[3])
  {
    outlined destroy of Any?((uint64_t)v14);
LABEL_10:
    v7 = objc_msgSend(v0, "sharedHub");
    if (v7)
    {
      v8 = v7;
      v9 = objc_msgSend(v7, "additionalKnownObjects");

      if (v9)
      {
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SpatialSceneDebugRepresentationWrapper]);
        isa = Dictionary._bridgeToObjectiveC()().super.isa;
        v14[0] = 0xD000000000000018;
        v14[1] = 0x80000000000305A0;
        v11 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v14, &type metadata for String);
        objc_msgSend(v9, "__swift_setObject:forKeyedSubscript:", isa, v11);

        swift_unknownObjectRelease(v11);
        return;
      }
      goto LABEL_16;
    }
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return;
  }
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : [SpatialSceneDebugRepresentationWrapper]]);
  if ((swift_dynamicCast(&v12, v14, (char *)&type metadata for Any + 8, v6, 6) & 1) == 0)
    goto LABEL_10;
}

void specialized DebugHierarchyTargetHub.cache(spatialSceneDebugRepresentation:for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  Class isa;
  uint64_t v14;
  _QWORD v15[2];

  specialized DebugHierarchyTargetHub.spatialSceneDebugRepresentationCache.getter();
  v7 = v6;
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRetain(a1);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v7);
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  v9 = v7;
  swift_bridgeObjectRelease(a3);
  swift_bridgeObjectRelease(0x8000000000000000);
  v10 = objc_msgSend((id)objc_opt_self(DebugHierarchyTargetHub), "sharedHub");
  if (v10)
  {
    v11 = v10;
    v12 = objc_msgSend(v10, "additionalKnownObjects");

    if (v12)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SpatialSceneDebugRepresentationWrapper]);
      isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v9);
      v15[0] = 0xD000000000000018;
      v15[1] = 0x80000000000305A0;
      v14 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v15, &type metadata for String);
      objc_msgSend(v12, "__swift_setObject:forKeyedSubscript:", isa, v14);

      swift_unknownObjectRelease(v14);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t outlined init with take of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id SpatialSceneDebugRepresentationWrapper.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SpatialSceneDebugRepresentationWrapper();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SpatialSceneDebugRepresentationWrapper()
{
  return objc_opt_self(_TtC22libViewDebuggerSupport38SpatialSceneDebugRepresentationWrapper);
}

void static SpatialSceneDebugRepresentationWrapper.fallback_debugHierarchyValueForProperty(withName:on:outOptions:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  char *v20;

  if ((a1 != 0xD000000000000018 || a2 != 0x80000000000305A0)
    && (_stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, 0xD000000000000018, 0x80000000000305A0, 0) & 1) == 0)
  {
    goto LABEL_7;
  }
  outlined init with copy of Any(a3, (uint64_t)v19);
  v7 = type metadata accessor for SpatialSceneDebugRepresentationWrapper();
  if ((swift_dynamicCast(&v20, v19, (char *)&type metadata for Any + 8, v7, 6) & 1) == 0)
    goto LABEL_7;
  v8 = v20;
  v9 = type metadata accessor for PropertyListEncoder(0);
  swift_allocObject(v9, *(unsigned int *)(v9 + 48), *(unsigned __int16 *)(v9 + 52));
  v10 = PropertyListEncoder.init()();
  v19[0] = *(_QWORD *)&v8[OBJC_IVAR____TtC22libViewDebuggerSupport38SpatialSceneDebugRepresentationWrapper_sceneDebugRepresentation];
  v11 = (void *)v19[0];
  v12 = type metadata accessor for SpatialSceneDebugRepresentation(0);
  v13 = lazy protocol witness table accessor for type SpatialSceneDebugRepresentation and conformance SpatialSceneDebugRepresentation();
  v14 = v11;
  v15 = dispatch thunk of PropertyListEncoder.encode<A>(_:)(v19, v12, v13);
  if (v4)
  {

    swift_release(v10);
    swift_errorRelease(v4);

LABEL_7:
    a4[3] = (uint64_t)&type metadata for () + 8;
    return;
  }
  v17 = v15;
  v18 = v16;

  swift_release(v10);
  a4[3] = (uint64_t)&type metadata for Data;

  *a4 = v17;
  a4[1] = v18;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type SpatialSceneDebugRepresentation and conformance SpatialSceneDebugRepresentation()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type SpatialSceneDebugRepresentation and conformance SpatialSceneDebugRepresentation;
  if (!lazy protocol witness table cache variable for type SpatialSceneDebugRepresentation and conformance SpatialSceneDebugRepresentation)
  {
    v1 = type metadata accessor for SpatialSceneDebugRepresentation(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for SpatialSceneDebugRepresentation, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialSceneDebugRepresentation and conformance SpatialSceneDebugRepresentation);
  }
  return result;
}

uint64_t specialized static SpatialSceneDebugRepresentationWrapper.fallback_debugHierarchyPropertyDescriptions()()
{
  uint64_t v0;
  uint64_t v1;
  NSString v2;
  unint64_t v3;
  objc_class *ObjCClassFromMetadata;
  uint64_t v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  __CFString *v10;
  const __CFString *v11;
  id v12;
  NSString *v13;
  __CFString *v14;
  __CFDictionary *Mutable;
  __CFDictionary *v16;
  __CFDictionary *v17;
  __CFDictionary *v18;
  uint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<[String : Any]>);
  v1 = swift_allocObject(v0, 40, 7);
  *(_OWORD *)(v1 + 16) = xmmword_2CDC0;
  v2 = String._bridgeToObjectiveC()();
  v3 = type metadata accessor for NSData();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v3);
  v6 = NSStringFromClass(ObjCClassFromMetadata);
  if (!v6)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0, v5);
    v8 = v7;
    v6 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8);
  }
  v9 = (const __CFString *)String._bridgeToObjectiveC()();
  v10 = (__CFString *)v9;
  if (v9)
    v11 = v9;
  else
    v11 = CFSTR("DebugHierarchyLogicalPropertyTypeCustom");
  v12 = v2;
  v13 = v6;
  v14 = v10;
  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v16 = Mutable;
  if (v12)
    CFDictionaryAddValue(Mutable, CFSTR("propertyName"), v12);
  if (v13)
    CFDictionaryAddValue(v16, CFSTR("propertyRuntimeType"), v13);
  CFDictionaryAddValue(v16, CFSTR("propertyLogicalType"), v11);
  CFDictionaryAddValue(v16, CFSTR("propertyFormat"), CFSTR("public.data"));
  if (!v16)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "CFDictionaryRef  _Nonnull CreateDebugHierarchyPropertyDescriptionWithValue(CFTypeRef _Nullable, CFStringRef _Nonnull, CFStringRef _Nullable, CFDebugHierarchyLogicalPropertyType _Nullable, CFStringRef _Nullable, DebugHierarchyVisibility, DebugHierarchyPropertyOptions)"));
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("DebugHierarchyHelpers_CoreFoundation.h"), 568, &stru_38A98);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "CFDictionaryRef  _Nonnull CreateDebugHierarchyPropertyDescription(CFStringRef _Nonnull, CFStringRef _Nullable, CFDebugHierarchyLogicalPropertyType _Nullable, CFStringRef _Nullable, DebugHierarchyVisibility, DebugHierarchyPropertyOptions)"));
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("DebugHierarchyHelpers_CoreFoundation.h"), 575, &stru_38A98);

  }
  v17 = v16;
  if (!v17)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "DebugHierarchyPropertyDescriptionDictionary  _Nonnull DebugHierarchyPropertyDescriptionOfData(NSString * _Nonnull __strong, NSString * _Nullable __strong, DebugHierarchyLogicalPropertyType  _Nullable __strong, NSString * _Nullable __strong, DebugHierarchyVisibility, DebugHierarchyPropertyOptions)"));
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("DebugHierarchyHelpers_Foundation.h"), 666, &stru_38A98);

  }
  v18 = v17;

  v19 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v18, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  *(_QWORD *)(v1 + 32) = v19;
  return v1;
}

unint64_t type metadata accessor for NSData()
{
  unint64_t result;
  uint64_t v1;

  result = lazy cache variable for type metadata for NSData;
  if (!lazy cache variable for type metadata for NSData)
  {
    v1 = objc_opt_self(NSData);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSData);
  }
  return result;
}

id objc_msgSend_CATransform3DValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CATransform3DValue");
}

id objc_msgSend_CGAffineTransformValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGAffineTransformValue");
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGColor");
}

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGPointValue");
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGRectValue");
}

id objc_msgSend_CGSizeValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGSizeValue");
}

id objc_msgSend_CGVectorValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGVectorValue");
}

id objc_msgSend_UIEdgeInsetsValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UIEdgeInsetsValue");
}

id objc_msgSend_UIOffsetValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UIOffsetValue");
}

id objc_msgSend__CGPDFPage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_CGPDFPage");
}

id objc_msgSend__CGSVGDocument(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_CGSVGDocument");
}

id objc_msgSend___dbg_ambiguityStatusMask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_ambiguityStatusMask");
}

id objc_msgSend___dbg_constraintsAffectingLayoutForAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_constraintsAffectingLayoutForAxis:");
}

id objc_msgSend___dbg_contentOffsetForSelectedSegment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_contentOffsetForSelectedSegment");
}

id objc_msgSend___dbg_firstBaselineOffsetFromTop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_firstBaselineOffsetFromTop");
}

id objc_msgSend___dbg_formattedDisplayName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_formattedDisplayName");
}

id objc_msgSend___dbg_hasAmbiguousLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_hasAmbiguousLayout");
}

id objc_msgSend___dbg_hasValidSelectedSegmentIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_hasValidSelectedSegmentIndex");
}

id objc_msgSend___dbg_isEnabledForSelectedSegment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_isEnabledForSelectedSegment");
}

id objc_msgSend___dbg_lastBaselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_lastBaselineOffsetFromBottom");
}

id objc_msgSend___dbg_layer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_layer");
}

id objc_msgSend___dbg_pointOfViewIndexPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_pointOfViewIndexPath");
}

id objc_msgSend___dbg_renderingModeIsMultiLayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_renderingModeIsMultiLayer");
}

id objc_msgSend___dbg_scopeButtonTitles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_scopeButtonTitles");
}

id objc_msgSend___dbg_shouldIgnoreScrollableContentHeightAmbiguity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_shouldIgnoreScrollableContentHeightAmbiguity");
}

id objc_msgSend___dbg_shouldIgnoreScrollableContentWidthAmbiguity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_shouldIgnoreScrollableContentWidthAmbiguity");
}

id objc_msgSend___dbg_snapshotImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_snapshotImage");
}

id objc_msgSend___dbg_snapshotImageRenderedUsingDrawHierarchyInRect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_snapshotImageRenderedUsingDrawHierarchyInRect");
}

id objc_msgSend___dbg_titleForSelectedSegment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_titleForSelectedSegment");
}

id objc_msgSend___dbg_traitCollectionDisplayCornerRadius(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_traitCollectionDisplayCornerRadius");
}

id objc_msgSend___dbg_viewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_viewController");
}

id objc_msgSend___dbg_viewForFirstBaselineLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_viewForFirstBaselineLayout");
}

id objc_msgSend___dbg_viewForLastBaselineLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_viewForLastBaselineLayout");
}

id objc_msgSend___dbg_wantsAutoLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_wantsAutoLayout");
}

id objc_msgSend___dbg_widthForSelectedSegment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__dbg_widthForSelectedSegment");
}

id objc_msgSend__arrayEncodedIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_arrayEncodedIndexPath:");
}

id objc_msgSend__baselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_baselineOffsetFromBottom");
}

id objc_msgSend__boundsHeightVariable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_boundsHeightVariable");
}

id objc_msgSend__boundsWidthVariable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_boundsWidthVariable");
}

id objc_msgSend__collectSubviewInfoForView_encodeLayers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_collectSubviewInfoForView:encodeLayers:");
}

id objc_msgSend__contentHeightVariable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentHeightVariable");
}

id objc_msgSend__contentWidthVariable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentWidthVariable");
}

id objc_msgSend__debugCatalogBundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_debugCatalogBundleIdentifier");
}

id objc_msgSend__debugName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_debugName");
}

id objc_msgSend__firstBaselineOffsetFromTop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_firstBaselineOffsetFromTop");
}

id objc_msgSend__imageResizedForDisplayInInspector(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_imageResizedForDisplayInInspector");
}

id objc_msgSend__indexPathForNode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indexPathForNode:");
}

id objc_msgSend__isEffectView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isEffectView:");
}

id objc_msgSend__layerInfo_view_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layerInfo:view:");
}

id objc_msgSend__layerShouldSupersedeSnapshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layerShouldSupersedeSnapshot:");
}

id objc_msgSend__layoutVariablesWithAmbiguousValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutVariablesWithAmbiguousValue");
}

id objc_msgSend__messagesUIExtensionViews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_messagesUIExtensionViews");
}

id objc_msgSend__minXVariable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_minXVariable");
}

id objc_msgSend__minYVariable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_minYVariable");
}

id objc_msgSend__nativeDisplayBounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nativeDisplayBounds");
}

id objc_msgSend__outermostLayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_outermostLayer");
}

id objc_msgSend__pointsPerInch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pointsPerInch");
}

id objc_msgSend__populateConstraintInfosArray_forViewHierarchy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_populateConstraintInfosArray:forViewHierarchy:");
}

id objc_msgSend__renderEffectViewUsingDrawHierarchyInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_renderEffectViewUsingDrawHierarchyInRect:");
}

id objc_msgSend__shouldEncodeLayers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldEncodeLayers");
}

id objc_msgSend__snapshotView_andAddDataToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_snapshotView:andAddDataToDictionary:");
}

id objc_msgSend__uiib_hostsLayoutEngine(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_uiib_hostsLayoutEngine");
}

id objc_msgSend__uiib_layoutEngineCreatingIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_uiib_layoutEngineCreatingIfNecessary");
}

id objc_msgSend__viewDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_viewDelegate");
}

id objc_msgSend__viewHasAmbiguousLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_viewHasAmbiguousLayout:");
}

id objc_msgSend__wantsAutolayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_wantsAutolayout");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_accessibilityCustomActions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessibilityCustomActions");
}

id objc_msgSend_accessibilityElements(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessibilityElements");
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessibilityLabel");
}

id objc_msgSend_actionsForTarget_forControlEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionsForTarget:forControlEvent:");
}

id objc_msgSend_activeExtensionContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeExtensionContext");
}

id objc_msgSend_addFrameBasics_toDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFrameBasics:toDict:");
}

id objc_msgSend_addLayoutInfoForView_toDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLayoutInfoForView:toDict:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectBasics_toDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectBasics:toDict:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addPathForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPathForClass:");
}

id objc_msgSend_addViewBasics_toDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addViewBasics:toDict:");
}

id objc_msgSend_addViewLayerInfo_toDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addViewLayerInfo:toDict:");
}

id objc_msgSend_addViewSubclassSpecificInfoForView_toDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addViewSubclassSpecificInfoForView:toDict:");
}

id objc_msgSend_additionalRootLevelViewsToArchive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "additionalRootLevelViewsToArchive");
}

id objc_msgSend_alignmentRectForFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alignmentRectForFrame:");
}

id objc_msgSend_allTargets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allTargets");
}

id objc_msgSend_allWindowsIncludingInternalWindows_onlyVisibleWindows_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allWindowsIncludingInternalWindows:onlyVisibleWindows:");
}

id objc_msgSend_allowsNextDrawableTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowsNextDrawableTimeout");
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alpha");
}

id objc_msgSend_ambiguityStatusMaskForView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ambiguityStatusMaskForView:");
}

id objc_msgSend_anchorPoint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anchorPoint");
}

id objc_msgSend_anchorPointZ(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anchorPointZ");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anyObject");
}

id objc_msgSend_appWindows(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appWindows");
}

id objc_msgSend_archivedDataWithRootObject_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:options:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ascender");
}

id objc_msgSend_attributedText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedText");
}

id objc_msgSend_autocapitalizationType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autocapitalizationType");
}

id objc_msgSend_autocorrectionType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autocorrectionType");
}

id objc_msgSend_backBarButtonItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backBarButtonItem");
}

id objc_msgSend_baselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "baselineOffsetFromBottom");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundlePath");
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callStackSymbols");
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capHeight");
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "childViewControllers");
}

id objc_msgSend_classMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classMap");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearColor");
}

id objc_msgSend_clipsToBounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clipsToBounds");
}

id objc_msgSend_collectViewInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectViewInfo:");
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView");
}

id objc_msgSend_colorPixelFormat(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorPixelFormat");
}

id objc_msgSend_colorspace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorspace");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_compositingFilter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compositingFilter");
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constant");
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraints");
}

id objc_msgSend_constraintsAffectingLayoutForAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintsAffectingLayoutForAxis:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentCompressionResistancePriorityForAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentCompressionResistancePriorityForAxis:");
}

id objc_msgSend_contentHuggingPriorityForAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentHuggingPriorityForAxis:");
}

id objc_msgSend_contentInsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentInsets");
}

id objc_msgSend_contentOffsetForSegmentAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentOffsetForSegmentAtIndex:");
}

id objc_msgSend_contentScaleFactor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentScaleFactor");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentView");
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contents");
}

id objc_msgSend_convertRect_fromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:fromView:");
}

id objc_msgSend_convertRect_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:toView:");
}

id objc_msgSend_coordinateSpace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coordinateSpace");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentAttributedTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentAttributedTitle");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentTitle");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debugDescription");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_depthStencilPixelFormat(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "depthStencilPixelFormat");
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descender");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "device");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_directionalEdgeInsetsValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "directionalEdgeInsetsValue");
}

id objc_msgSend_displayCornerRadius(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayCornerRadius");
}

id objc_msgSend_displayNameForView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayNameForView:");
}

id objc_msgSend_documentStorageURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "documentStorageURL");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawInRect:");
}

id objc_msgSend_drawInRect_blendMode_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawInRect:blendMode:alpha:");
}

id objc_msgSend_drawViewHierarchyInRect_afterScreenUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawViewHierarchyInRect:afterScreenUpdates:");
}

id objc_msgSend_enablesReturnKeyAutomatically(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enablesReturnKeyAutomatically");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "familyName");
}

id objc_msgSend_fetchViewHierarchy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchViewHierarchy");
}

id objc_msgSend_firstAttribute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstAttribute");
}

id objc_msgSend_firstBaselineOffsetFromTopForView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstBaselineOffsetFromTopForView:");
}

id objc_msgSend_firstItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstItem");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_fontName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontName");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frame");
}

id objc_msgSend_getIndexes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getIndexes:range:");
}

id objc_msgSend_getRendererInfo_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getRendererInfo:size:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_hasBaseline(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasBaseline");
}

id objc_msgSend_hasContentInsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasContentInsets");
}

id objc_msgSend_hasMidline(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasMidline");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasValue_forVariable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasValue:forVariable:");
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalSizeClass");
}

id objc_msgSend_ibShouldIgnoreScrollableContentHeightAmbiguityForRepresentationOfItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ibShouldIgnoreScrollableContentHeightAmbiguityForRepresentationOfItem:");
}

id objc_msgSend_ibShouldIgnoreScrollableContentWidthAmbiguityForRepresentationOfItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ibShouldIgnoreScrollableContentWidthAmbiguityForRepresentationOfItem:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "image");
}

id objc_msgSend_imageForSegmentAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageForSegmentAtIndex:");
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageView");
}

id objc_msgSend_indexAtPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexAtPosition:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexPathWithIndexes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathWithIndexes:length:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_isDoubleSided(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDoubleSided");
}

id objc_msgSend_isEnabledForSegmentAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnabledForSegmentAtIndex:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHidden");
}

id objc_msgSend_isHiddenForWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHiddenForWindow:");
}

id objc_msgSend_isSecureTextEntry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSecureTextEntry");
}

id objc_msgSend_isViewSubclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isViewSubclass:");
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyEnumerator");
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyWindow");
}

id objc_msgSend_keyboardAppearance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyboardAppearance");
}

id objc_msgSend_keyboardType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyboardType");
}

id objc_msgSend_largeTitleTextAttributes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "largeTitleTextAttributes");
}

id objc_msgSend_lastBaselineOffsetFromBottomForView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastBaselineOffsetFromBottomForView:");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layer");
}

id objc_msgSend_layerClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layerClass");
}

id objc_msgSend_layerForView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layerForView:");
}

id objc_msgSend_layoutDirection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutDirection");
}

id objc_msgSend_layoutGuides(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutGuides");
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutMargins");
}

id objc_msgSend_leading(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leading");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lineHeight");
}

id objc_msgSend_locale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locale");
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeIdentifier");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_makeViewDebugData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeViewDebugData");
}

id objc_msgSend_mapTableWithKeyOptions_valueOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapTableWithKeyOptions:valueOptions:");
}

id objc_msgSend_masksToBounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "masksToBounds");
}

id objc_msgSend_maximumDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maximumDate");
}

id objc_msgSend_maximumDrawableCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maximumDrawableCount");
}

id objc_msgSend_midlineOffsetFromCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "midlineOffsetFromCenter");
}

id objc_msgSend_minimumDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minimumDate");
}

id objc_msgSend_multiplier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "multiplier");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_nibBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nibBundle");
}

id objc_msgSend_numberOfSegments(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfSegments");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objCType");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_opacity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "opacity");
}

id objc_msgSend_optimizationOpportunities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optimizationOpportunities:");
}

id objc_msgSend_originalURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "originalURL");
}

id objc_msgSend_pathForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForClass:");
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_pixelFormat(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pixelFormat");
}

id objc_msgSend_pointOfView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointOfView");
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointSize");
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "position");
}

id objc_msgSend_preferredDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredDevice");
}

id objc_msgSend_preferredSymbolConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredSymbolConfiguration");
}

id objc_msgSend_presentationLayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentationLayer");
}

id objc_msgSend_presentsWithTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentsWithTransaction");
}

id objc_msgSend_primaryWindowFromWindows_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "primaryWindowFromWindows:");
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "priority");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_readableContentGuide(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readableContentGuide");
}

id objc_msgSend_refreshControl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshControl");
}

id objc_msgSend_relation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relation");
}

id objc_msgSend_renderInContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderInContext:");
}

id objc_msgSend_returnKeyType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "returnKeyType");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scale");
}

id objc_msgSend_scene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scene");
}

id objc_msgSend_scopeButtonTitles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scopeButtonTitles");
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screen");
}

id objc_msgSend_screenBackingScaleForView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenBackingScaleForView:");
}

id objc_msgSend_screenBackingScaleForWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenBackingScaleForWindow:");
}

id objc_msgSend_secondAttribute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondAttribute");
}

id objc_msgSend_secondItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondItem");
}

id objc_msgSend_selectedSegmentIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedSegmentIndex");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpacity:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_shadowColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shadowColor");
}

id objc_msgSend_shadowOffset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shadowOffset");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "size");
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapshot");
}

id objc_msgSend_snapshotMethodForView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapshotMethodForView:");
}

id objc_msgSend_snapshotView_errorString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapshotView:errorString:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "style");
}

id objc_msgSend_sublayerTransform(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sublayerTransform");
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sublayers");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subviews");
}

id objc_msgSend_subviewsForView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subviewsForView:");
}

id objc_msgSend_superclass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "superclass");
}

id objc_msgSend_superlayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "superlayer");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "superview");
}

id objc_msgSend_swiftUI_displayListID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "swiftUI_displayListID");
}

id objc_msgSend_symbolConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "symbolConfiguration");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "text");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "title");
}

id objc_msgSend_titleForSegmentAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleForSegmentAtIndex:");
}

id objc_msgSend_titleForWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleForWindow:");
}

id objc_msgSend_titleTextAttributes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleTextAttributes");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transform");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceStyle");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueWithCGRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCGRect:");
}

id objc_msgSend_verticalSizeClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verticalSizeClass");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "view");
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewController");
}

id objc_msgSend_viewDebuggerEffectViewsToSnapshotAsImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewDebuggerEffectViewsToSnapshotAsImage");
}

id objc_msgSend_viewForFirstBaselineLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewForFirstBaselineLayout");
}

id objc_msgSend_viewForFirstBaselineLayoutPointerForView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewForFirstBaselineLayoutPointerForView:");
}

id objc_msgSend_viewForLastBaselineLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewForLastBaselineLayout");
}

id objc_msgSend_viewForLastBaselineLayoutPointerForView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewForLastBaselineLayoutPointerForView:");
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewIfLoaded");
}

id objc_msgSend_widthForSegmentAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widthForSegmentAtIndex:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "window");
}

id objc_msgSend_windowContentViewForWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowContentViewForWindow:");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowScene");
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windows");
}

id objc_msgSend_xHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xHeight");
}

id objc_msgSend_zPosition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "zPosition");
}
