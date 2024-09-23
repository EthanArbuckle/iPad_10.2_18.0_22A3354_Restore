uint64_t initializeBufferWithCopyOfBuffer for CGRect(uint64_t *a1, uint64_t *a2)
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

uint64_t getEnumTagSinglePayload for CGRect(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CGRect(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGRect(uint64_t a1)
{
  type metadata accessor for CGRect(a1, &lazy cache variable for type metadata for CGRect);
}

uint64_t closure #1 in static ObjCBlockConversion.boxingNilAsAnyForCompatibility(_:)(uint64_t a1, uint64_t a2, void (*a3)(__int128 *))
{
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  char v8;
  _OWORD v9[2];

  if (a2)
  {
    *(_QWORD *)&v6 = a2;
    v8 = 1;
    MEMORY[0x20BD192B8](a2);
LABEL_3:
    a3(&v6);
    return outlined destroy of Any?((uint64_t)&v6, &demangling cache variable for type metadata for Result<Any, Error>);
  }
  outlined init with copy of Any?(a1, (uint64_t)&v6);
  if (!v7)
  {
    outlined destroy of Any?((uint64_t)&v6, &demangling cache variable for type metadata for Any?);
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
    v5 = swift_allocObject();
    *(_QWORD *)&v6 = v5;
    *(_OWORD *)(v5 + 16) = 0u;
    *(_OWORD *)(v5 + 32) = 0u;
    v8 = 0;
    goto LABEL_3;
  }
  outlined init with take of Any(&v6, v9);
  outlined init with copy of Any((uint64_t)v9, (uint64_t)&v6);
  v8 = 0;
  a3(&v6);
  outlined destroy of Any?((uint64_t)&v6, &demangling cache variable for type metadata for Result<Any, Error>);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
}

uint64_t outlined init with copy of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD192DC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_209D0D09C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 40))
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return swift_deallocObject();
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

uint64_t outlined destroy of Any?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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
  type metadata accessor for CGRect(a1, &lazy cache variable for type metadata for CGSize);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  type metadata accessor for CGRect(a1, (unint64_t *)&lazy cache variable for type metadata for CGPoint);
}

void type metadata accessor for CGRect(uint64_t a1, unint64_t *a2)
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

void specialized closure #1 in static ObjCBlockConversion.exclusive<A>(_:)(uint64_t a1, unint64_t a2, void *a3, void (*a4)(uint64_t *))
{
  uint64_t v8;
  unint64_t v9;
  char v10;

  if (a2 >> 60 == 15)
  {
    if (a3)
    {
      v8 = (uint64_t)a3;
      v9 = 0;
      v10 = 1;
      MEMORY[0x20BD192B8](a3);
      a4(&v8);

    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    v8 = a1;
    v9 = a2;
    v10 = 0;
    outlined copy of Data._Representation(a1, a2);
    a4(&v8);
    outlined consume of Data?(a1, a2);
  }
}

id WKPDFConfiguration.rect.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id result;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGRect v9;

  objc_msgSend(v1, sel_rect);
  result = (id)CGRectEqualToRect(v9, *MEMORY[0x24BDBF070]);
  v4 = (char)result;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  if ((result & 1) == 0)
    result = objc_msgSend(v1, sel_rect, 0.0, 0.0, 0.0, 0.0);
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = v8;
  *(_BYTE *)(a1 + 32) = v4;
  return result;
}

id key path getter for WKPDFConfiguration.rect : WKPDFConfiguration@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  id result;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGRect v10;

  v3 = *a1;
  objc_msgSend(*a1, sel_rect);
  result = (id)CGRectEqualToRect(v10, *MEMORY[0x24BDBF070]);
  v5 = (char)result;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  if ((result & 1) == 0)
    result = objc_msgSend(v3, sel_rect, 0.0, 0.0, 0.0, 0.0);
  *(_QWORD *)a2 = v6;
  *(_QWORD *)(a2 + 8) = v7;
  *(_QWORD *)(a2 + 16) = v8;
  *(_QWORD *)(a2 + 24) = v9;
  *(_BYTE *)(a2 + 32) = v5;
  return result;
}

id WKPDFConfiguration.rect.setter(uint64_t a1)
{
  void *v1;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v8[5];
  _BYTE v9[40];

  outlined init with take of CGRect?(a1, (uint64_t)v8, &demangling cache variable for type metadata for CGRect?);
  v3 = *(double *)v8;
  v4 = *(double *)&v8[1];
  v5 = *(double *)&v8[2];
  v6 = *(double *)&v8[3];
  outlined init with take of CGRect?(a1, (uint64_t)v9, &demangling cache variable for type metadata for CGRect?);
  if (v9[32] == 1)
  {
    v3 = *MEMORY[0x24BDBF070];
    v4 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v5 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v6 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }
  return objc_msgSend(v1, sel_setRect_, v3, v4, v5, v6);
}

void (*WKPDFConfiguration.rect.modify(_QWORD *a1))(id **a1, char a2)
{
  void *v1;
  _QWORD *v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGRect v10;
  CGRect v11;

  v3 = malloc(0x50uLL);
  *a1 = v3;
  v3[9] = v1;
  objc_msgSend(v1, sel_rect);
  v11 = *(CGRect *)*(_QWORD *)&MEMORY[0x24BDBF070];
  v3[5] = *MEMORY[0x24BDBF070];
  v3[6] = *(_QWORD *)&v11.origin.y;
  v3[7] = *(_QWORD *)&v11.size.width;
  v3[8] = *(_QWORD *)&v11.size.height;
  v4 = CGRectEqualToRect(v10, v11);
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  if (!v4)
    objc_msgSend(v1, sel_rect, 0.0, 0.0, 0.0, 0.0);
  *v3 = v5;
  v3[1] = v6;
  v3[2] = v7;
  v3[3] = v8;
  *((_BYTE *)v3 + 32) = v4;
  return WKPDFConfiguration.rect.modify;
}

void WKPDFConfiguration.rect.modify(id **a1, char a2)
{
  id *v2;
  int v3;
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
  double *v14;
  BOOL v15;
  double *v16;
  double *v17;
  double *v18;
  double *v19;

  v2 = *a1;
  v3 = *((unsigned __int8 *)*a1 + 32);
  v4 = (uint64_t)(*a1 + 3);
  v5 = (uint64_t)(*a1 + 2);
  v6 = (uint64_t)(*a1 + 1);
  v7 = (uint64_t)(*a1 + 5);
  v8 = (uint64_t)(*a1 + 6);
  v9 = (uint64_t)(*a1 + 7);
  v10 = (uint64_t)(*a1 + 8);
  if (*((_BYTE *)*a1 + 32))
    v11 = (uint64_t)(*a1 + 8);
  else
    v11 = (uint64_t)(*a1 + 3);
  if (*((_BYTE *)*a1 + 32))
    v12 = (uint64_t)(*a1 + 7);
  else
    v12 = (uint64_t)(*a1 + 2);
  if (*((_BYTE *)*a1 + 32))
    v13 = (uint64_t)(*a1 + 6);
  else
    v13 = (uint64_t)(*a1 + 1);
  if (v3)
    v14 = (double *)v7;
  else
    v14 = (double *)v2;
  v15 = v3 == 0;
  if (v3)
    v16 = (double *)v10;
  else
    v16 = (double *)v4;
  if (v15)
    v17 = (double *)v5;
  else
    v17 = (double *)v9;
  if (v15)
    v18 = (double *)v6;
  else
    v18 = (double *)v8;
  if (v15)
    v19 = (double *)v2;
  else
    v19 = (double *)v7;
  if ((a2 & 1) != 0)
  {
    v16 = (double *)v11;
    v17 = (double *)v12;
    v18 = (double *)v13;
    v19 = v14;
  }
  objc_msgSend(v2[9], sel_setRect_, *v19, *v18, *v17, *v16);
  free(v2);
}

void WKWebView.callAsyncJavaScript(_:arguments:in:in:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7)
{
  void *v7;
  void *v8;
  void *v13;
  NSDictionary v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[6];

  v8 = v7;
  v13 = (void *)MEMORY[0x20BD1909C]();
  v14.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  if (a6)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = a6;
    *(_QWORD *)(v15 + 24) = a7;
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = partial apply for closure #1 in static ObjCBlockConversion.boxingNilAsAnyForCompatibility(_:);
    *(_QWORD *)(v16 + 24) = v15;
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Any?, @guaranteed Error?) -> ();
    *(_QWORD *)(v17 + 24) = v16;
    v18[4] = partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Any?, @in_guaranteed Error?) -> (@out ());
    v18[5] = v17;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 1107296256;
    v18[2] = thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Any?, @guaranteed Error?) -> ();
    v18[3] = &block_descriptor;
    a6 = _Block_copy(v18);
    swift_retain();
    swift_release();
  }
  objc_msgSend(v8, sel_callAsyncJavaScript_arguments_inFrame_inContentWorld_completionHandler_, v13, v14.super.isa, a4, a5, a6);
  _Block_release(a6);

}

uint64_t sub_209D0D71C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static ObjCBlockConversion.boxingNilAsAnyForCompatibility(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return closure #1 in static ObjCBlockConversion.boxingNilAsAnyForCompatibility(_:)(a1, a2, *(void (**)(__int128 *))(v2 + 16));
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Any?, @guaranteed Error?) -> ()(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(a1, *a2);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Any?, @in_guaranteed Error?) -> (@out ())(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t *);
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, uint64_t *))(v2 + 16);
  v5 = a2;
  return v3(a1, &v5);
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Any?, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(__int128 *, void *);
  id v6;
  __int128 v8;
  __int128 v9;

  v5 = *(void (**)(__int128 *, void *))(a1 + 32);
  if (a2)
  {
    *((_QWORD *)&v9 + 1) = swift_getObjectType();
    *(_QWORD *)&v8 = a2;
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }
  swift_retain();
  swift_unknownObjectRetain();
  v6 = a3;
  v5(&v8, a3);
  swift_release();

  return outlined destroy of Any?((uint64_t)&v8);
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

void WKWebView.createPDF(configuration:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Result<Data, Error>) -> ();
  *(_QWORD *)(v8 + 24) = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = partial apply for specialized closure #1 in static ObjCBlockConversion.exclusive<A>(_:);
  *(_QWORD *)(v9 + 24) = v8;
  v11[4] = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Data?, @guaranteed Error?) -> ();
  v11[5] = v9;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ();
  v11[3] = &block_descriptor_18;
  v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_createPDFWithConfiguration_completionHandler_, a1, v10);
  _Block_release(v10);
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ()(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void (*v5)(void *, unint64_t, void *);
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v4 = a2;
  v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    v6 = v4;
    v4 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;

  }
  else
  {
    swift_retain();
    v8 = 0xF000000000000000;
  }
  v9 = a3;
  v5(v4, v8, a3);

  outlined consume of Data?((uint64_t)v4, v8);
  return swift_release();
}

void WKWebView.createWebArchiveData(completionHandler:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = thunk for @escaping @callee_guaranteed (@guaranteed Result<Data, Error>) -> ()partial apply;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = closure #1 in static ObjCBlockConversion.exclusive<A>(_:)specialized partial apply;
  *(_QWORD *)(v7 + 24) = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = thunk for @escaping @callee_guaranteed (@in_guaranteed Data?, @guaranteed Error?) -> ()partial apply;
  *(_QWORD *)(v8 + 24) = v7;
  v10[4] = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Data?, @guaranteed Error?) -> ();
  v10[5] = v8;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data, @guaranteed Error) -> ();
  v10[3] = &block_descriptor_36;
  v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(v2, sel_createWebArchiveDataWithCompletionHandler_, v9);
  _Block_release(v9);
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data, @guaranteed Error) -> ()(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(uint64_t, unint64_t, id);
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;

  v5 = *(void (**)(uint64_t, unint64_t, id))(a1 + 32);
  swift_retain();
  v6 = a2;
  v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;

  v10 = a3;
  v5(v7, v9, v10);

  outlined consume of Data._Representation(v7, v9);
  return swift_release();
}

void WKWebView.evaluateJavaScript(_:in:in:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  void *v6;
  void *v7;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[6];

  v7 = v6;
  v12 = (void *)MEMORY[0x20BD1909C]();
  if (a5)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = a5;
    *(_QWORD *)(v13 + 24) = a6;
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = closure #1 in static ObjCBlockConversion.boxingNilAsAnyForCompatibility(_:)partial apply;
    *(_QWORD *)(v14 + 24) = v13;
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = thunk for @escaping @callee_guaranteed (@in_guaranteed Any?, @guaranteed Error?) -> ()partial apply;
    *(_QWORD *)(v15 + 24) = v14;
    v16[4] = thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Any?, @in_guaranteed Error?) -> (@out ())partial apply;
    v16[5] = v15;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 1107296256;
    v16[2] = thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Any?, @guaranteed Error?) -> ();
    v16[3] = &block_descriptor_51;
    a5 = _Block_copy(v16);
    swift_retain();
    swift_release();
  }
  objc_msgSend(v7, sel_evaluateJavaScript_inFrame_inContentWorld_completionHandler_, v12, a3, a4, a5);
  _Block_release(a5);

}

void WKWebView.find(_:configuration:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v9;
  void *v10;
  _QWORD v11[6];

  v9 = (void *)MEMORY[0x20BD1909C]();
  v11[4] = a4;
  v11[5] = a5;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed WKFindResult) -> ();
  v11[3] = &block_descriptor_54;
  v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_findString_withConfiguration_completionHandler_, v9, a3, v10);
  _Block_release(v10);

}

void thunk for @escaping @callee_guaranteed @Sendable (@guaranteed WKFindResult) -> ()(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t WKWebView.callAsyncJavaScript(_:arguments:in:contentWorld:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v7[24] = a6;
  v7[25] = v6;
  v7[22] = a4;
  v7[23] = a5;
  v7[20] = a2;
  v7[21] = a3;
  v7[19] = a1;
  type metadata accessor for MainActor();
  v7[26] = static MainActor.shared.getter();
  v7[27] = dispatch thunk of Actor.unownedExecutor.getter();
  v7[28] = v8;
  return swift_task_switch();
}

uint64_t WKWebView.callAsyncJavaScript(_:arguments:in:contentWorld:)()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  Class isa;
  uint64_t v6;
  _QWORD *v7;

  v2 = v0[24];
  v1 = (void *)v0[25];
  v3 = v0[23];
  v4 = MEMORY[0x20BD1909C](v0[20], v0[21]);
  v0[29] = v4;
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v0[30] = isa;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = WKWebView.callAsyncJavaScript(_:arguments:in:contentWorld:);
  v6 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v7 = v0 + 10;
  v7[1] = 0x40000000;
  v7[2] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned Swift.AnyObject?, @unowned NSError?) -> () with result type Any?;
  v7[3] = &block_descriptor_55;
  v7[4] = v6;
  objc_msgSend(v1, sel_callAsyncJavaScript_arguments_inFrame_inContentWorld_completionHandler_, v4, isa, v3, v2, v7);
  return swift_continuation_await();
}

{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 248) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;

  v2 = *(void **)(v0 + 232);
  v1 = *(void **)(v0 + 240);
  v3 = *(_QWORD *)(v0 + 152);
  swift_release();
  outlined init with take of CGRect?(v0 + 120, v3, &demangling cache variable for type metadata for Any?);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 240);
  v2 = *(void **)(v0 + 232);
  swift_release();
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned Swift.AnyObject?, @unowned NSError?) -> () with result type Any?(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[32];

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
    if (a2)
    {
      *((_QWORD *)&v11 + 1) = swift_getObjectType();
      *(_QWORD *)&v10 = a2;
    }
    else
    {
      v10 = 0u;
      v11 = 0u;
    }
    outlined init with take of CGRect?((uint64_t)&v10, (uint64_t)v12, &demangling cache variable for type metadata for Any?);
    v9 = *(_QWORD *)(*(_QWORD *)(v3 + 64) + 40);
    swift_unknownObjectRetain();
    outlined init with take of CGRect?((uint64_t)v12, v9, &demangling cache variable for type metadata for Any?);
    return swift_continuation_throwingResume();
  }
}

uint64_t WKWebView.pdf(configuration:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[17] = a1;
  v2[18] = v1;
  type metadata accessor for MainActor();
  v2[19] = static MainActor.shared.getter();
  v2[20] = dispatch thunk of Actor.unownedExecutor.getter();
  v2[21] = v3;
  return swift_task_switch();
}

uint64_t WKWebView.pdf(configuration:)()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[17];
  v1 = (void *)v0[18];
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = WKWebView.pdf(configuration:);
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSData?, @unowned NSError?) -> () with result type Data;
  v4[3] = &block_descriptor_57;
  v4[4] = v3;
  objc_msgSend(v1, sel_createPDFWithConfiguration_completionHandler_, v2, v4);
  return swift_continuation_await();
}

{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 176) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 128));
}

{
  uint64_t v0;

  swift_release();
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSData?, @unowned NSError?) -> () with result type Data(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;

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
    v8 = a2;
    v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v11 = v10;

    v12 = *(uint64_t **)(*(_QWORD *)(v3 + 64) + 40);
    *v12 = v9;
    v12[1] = v11;
    return swift_continuation_throwingResume();
  }
}

uint64_t WKWebView.evaluateJavaScript(_:in:contentWorld:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  v6[23] = a5;
  v6[24] = v5;
  v6[21] = a3;
  v6[22] = a4;
  v6[19] = a1;
  v6[20] = a2;
  type metadata accessor for MainActor();
  v6[25] = static MainActor.shared.getter();
  v6[26] = dispatch thunk of Actor.unownedExecutor.getter();
  v6[27] = v7;
  return swift_task_switch();
}

uint64_t WKWebView.evaluateJavaScript(_:in:contentWorld:)()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v0[23];
  v1 = (void *)v0[24];
  v3 = v0[22];
  v4 = MEMORY[0x20BD1909C](v0[20], v0[21]);
  v0[28] = v4;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = WKWebView.evaluateJavaScript(_:in:contentWorld:);
  v5 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v6 = v0 + 10;
  v6[1] = 0x40000000;
  v6[2] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned Swift.AnyObject?, @unowned NSError?) -> () with result type Any;
  v6[3] = &block_descriptor_59;
  v6[4] = v5;
  objc_msgSend(v1, sel_evaluateJavaScript_inFrame_inContentWorld_completionHandler_, v4, v3, v2, v6);
  return swift_continuation_await();
}

{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 232) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

{
  uint64_t v0;
  void *v1;
  _OWORD *v2;

  v1 = *(void **)(v0 + 224);
  v2 = *(_OWORD **)(v0 + 152);
  swift_release();
  outlined init with take of Any((_OWORD *)(v0 + 120), v2);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 224);
  swift_release();
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned Swift.AnyObject?, @unowned NSError?) -> () with result type Any(uint64_t result, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  _OWORD *v8;
  __int128 v9;
  uint64_t ObjectType;

  v3 = *(_QWORD *)(result + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else if (a2)
  {
    ObjectType = swift_getObjectType();
    *(_QWORD *)&v9 = a2;
    v8 = *(_OWORD **)(*(_QWORD *)(v3 + 64) + 40);
    swift_unknownObjectRetain();
    outlined init with take of Any(&v9, v8);
    return swift_continuation_throwingResume();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t WKWebView.find(_:configuration:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[18] = a3;
  v4[19] = v3;
  v4[16] = a1;
  v4[17] = a2;
  type metadata accessor for MainActor();
  v4[20] = static MainActor.shared.getter();
  v4[21] = dispatch thunk of Actor.unownedExecutor.getter();
  v4[22] = v5;
  return swift_task_switch();
}

uint64_t WKWebView.find(_:configuration:)()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[18];
  v1 = (void *)v0[19];
  v3 = MEMORY[0x20BD1909C](v0[16], v0[17]);
  v0[23] = v3;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = WKWebView.find(_:configuration:);
  v4 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v5 = v0 + 10;
  v5[1] = 0x40000000;
  v5[2] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned WKFindResult) -> () with result type WKFindResult;
  v5[3] = &block_descriptor_61;
  v5[4] = v4;
  objc_msgSend(v1, sel_findString_withConfiguration_completionHandler_, v3, v2, v5);
  return swift_continuation_await();
}

{
  return swift_task_switch();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 184);
  swift_release();
  v2 = *(_QWORD *)(v0 + 120);

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned WKFindResult) -> () with result type WKFindResult(uint64_t a1, void *a2)
{
  id v2;

  **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
  v2 = a2;
  return swift_continuation_resume();
}

void partial apply for specialized closure #1 in static ObjCBlockConversion.exclusive<A>(_:)(uint64_t a1, void *a2)
{
  uint64_t v2;

  specialized closure #1 in static ObjCBlockConversion.exclusive<A>(_:)(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), a2, *(void (**)(uint64_t *))(v2 + 16));
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Result<Data, Error>) -> ()(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v1 + 16))(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Data?, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t (*v4)(_QWORD *, uint64_t);
  _QWORD v6[2];

  v4 = *(uint64_t (**)(_QWORD *, uint64_t))(v3 + 16);
  v6[0] = a1;
  v6[1] = a2;
  return v4(v6, a3);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Data?, @guaranteed Error?) -> ()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t outlined init with take of CGRect?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id sub_209D0E990(uint64_t a1, id *a2)
{
  double *v2;

  if ((*(_BYTE *)(a1 + 32) & 1) != 0)
    v2 = (double *)MEMORY[0x24BDBF070];
  else
    v2 = (double *)a1;
  return objc_msgSend(*a2, sel_setRect_, *v2, v2[1], v2[2], v2[3]);
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

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined consume of Data._Representation(a1, a2);
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

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

size_t WKWebsiteDataStore.proxyConfigurations.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  size_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = type metadata accessor for ProxyConfiguration();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend(v0, sel_proxyConfigurations);
  v6 = MEMORY[0x24BEE4AF8];
  if (!v5)
    return v6;
  v7 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OS_nw_proxy_config);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v8 >> 62))
  {
    v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v9)
      goto LABEL_4;
LABEL_14:
    swift_bridgeObjectRelease();
    return v6;
  }
  swift_bridgeObjectRetain();
  v9 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v9)
    goto LABEL_14;
LABEL_4:
  v16 = v6;
  result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v9 & ~(v9 >> 63), 0);
  if ((v9 & 0x8000000000000000) == 0)
  {
    v11 = 0;
    v6 = v16;
    do
    {
      if ((v8 & 0xC000000000000001) != 0)
        v12 = MEMORY[0x20BD190E4](v11, v8);
      else
        v12 = swift_unknownObjectRetain();
      MEMORY[0x20BD19084](v12);
      v16 = v6;
      v14 = *(_QWORD *)(v6 + 16);
      v13 = *(_QWORD *)(v6 + 24);
      if (v14 >= v13 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v13 > 1, v14 + 1, 1);
        v6 = v16;
      }
      ++v11;
      *(_QWORD *)(v6 + 16) = v14 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v6+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(_QWORD *)(v2 + 72) * v14, v4, v1);
    }
    while (v9 != v11);
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

void key path setter for WKWebsiteDataStore.proxyConfigurations : WKWebsiteDataStore(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  Class isa;

  v2 = *a2;
  v3 = swift_bridgeObjectRetain();
  _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay7Network18ProxyConfigurationVG_So18OS_nw_proxy_config_ps5NeverOTg5067_sSo18WKWebsiteDataStoreC6WebKitE19proxyConfigurationsSay7Network18ef8VGvsSo06g1_h4_F7_J60_pAGcfu_32c1c5f069c8648e3381a339080d8c0633AGSoAI_pTf3nnnpk_nTf1cn_n(v3);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OS_nw_proxy_config);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setProxyConfigurations_, isa);

}

void WKWebsiteDataStore.proxyConfigurations.setter(uint64_t a1)
{
  void *v1;
  Class isa;

  _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay7Network18ProxyConfigurationVG_So18OS_nw_proxy_config_ps5NeverOTg5067_sSo18WKWebsiteDataStoreC6WebKitE19proxyConfigurationsSay7Network18ef8VGvsSo06g1_h4_F7_J60_pAGcfu_32c1c5f069c8648e3381a339080d8c0633AGSoAI_pTf3nnnpk_nTf1cn_n(a1);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OS_nw_proxy_config);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setProxyConfigurations_, isa);

}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay7Network18ProxyConfigurationVG_So18OS_nw_proxy_config_ps5NeverOTg5067_sSo18WKWebsiteDataStoreC6WebKitE19proxyConfigurationsSay7Network18ef8VGvsSo06g1_h4_F7_J60_pAGcfu_32c1c5f069c8648e3381a339080d8c0633AGSoAI_pTf3nnnpk_nTf1cn_n(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v7 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray.reserveCapacity(_:)();
    v4 = *(_QWORD *)(type metadata accessor for ProxyConfiguration() - 8);
    v5 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v6 = *(_QWORD *)(v4 + 72);
    do
    {
      ProxyConfiguration.nw.getter();
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v5 += v6;
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

void (*WKWebsiteDataStore.proxyConfigurations.modify(size_t *a1))(uint64_t *a1, char a2)
{
  size_t v1;

  a1[3] = v1;
  *a1 = WKWebsiteDataStore.proxyConfigurations.getter();
  return WKWebsiteDataStore.proxyConfigurations.modify;
}

void WKWebsiteDataStore.proxyConfigurations.modify(uint64_t *a1, char a2)
{
  void *v2;
  uint64_t v3;
  Class isa;
  Class v5;

  v2 = (void *)a1[3];
  if ((a2 & 1) != 0)
  {
    v3 = swift_bridgeObjectRetain();
    _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay7Network18ProxyConfigurationVG_So18OS_nw_proxy_config_ps5NeverOTg5067_sSo18WKWebsiteDataStoreC6WebKitE19proxyConfigurationsSay7Network18ef8VGvsSo06g1_h4_F7_J60_pAGcfu_32c1c5f069c8648e3381a339080d8c0633AGSoAI_pTf3nnnpk_nTf1cn_n(v3);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OS_nw_proxy_config);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_setProxyConfigurations_, isa);

    swift_bridgeObjectRelease();
  }
  else
  {
    _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay7Network18ProxyConfigurationVG_So18OS_nw_proxy_config_ps5NeverOTg5067_sSo18WKWebsiteDataStoreC6WebKitE19proxyConfigurationsSay7Network18ef8VGvsSo06g1_h4_F7_J60_pAGcfu_32c1c5f069c8648e3381a339080d8c0633AGSoAI_pTf3nnnpk_nTf1cn_n(*a1);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OS_nw_proxy_config);
    v5 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_setProxyConfigurations_, v5);

  }
}

size_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

size_t sub_209D0F008@<X0>(size_t *a1@<X8>)
{
  size_t result;

  result = WKWebsiteDataStore.proxyConfigurations.getter();
  *a1 = result;
  return result;
}

size_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ProxyConfiguration>);
  v10 = *(_QWORD *)(type metadata accessor for ProxyConfiguration() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(type metadata accessor for ProxyConfiguration() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t ProxyConfiguration.nw.getter()
{
  return MEMORY[0x24BDE05A8]();
}

uint64_t type metadata accessor for ProxyConfiguration()
{
  return MEMORY[0x24BDE05B0]();
}

uint64_t ProxyConfiguration.init(_:)()
{
  return MEMORY[0x24BDE05C0]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t static MainActor.shared.getter()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t type metadata accessor for MainActor()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x24BEE2658]();
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

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x24BEE3068]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

