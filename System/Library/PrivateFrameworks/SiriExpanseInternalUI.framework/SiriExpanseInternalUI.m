uint64_t SiriExpanseInternalUIPlugin.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SiriExpanseInternalUIPlugin()
{
  return objc_opt_self();
}

uint64_t associated type witness table accessor for SnippetProviding.SnippetPluginModelType : SnippetPluginModel in SiriExpanseInternalUIPlugin()
{
  return lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel and conformance ExpanseUIModel, type metadata accessor for ExpanseUIModel, (uint64_t)&protocol conformance descriptor for ExpanseUIModel);
}

uint64_t protocol witness for SnippetProviding.init() in conformance SiriExpanseInternalUIPlugin@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t protocol witness for SnippetProviding.snippet(for:mode:idiom:) in conformance SiriExpanseInternalUIPlugin(uint64_t a1)
{
  return specialized SiriExpanseInternalUIPlugin.snippet(for:mode:idiom:)(a1);
}

uint64_t specialized SiriExpanseInternalUIPlugin.snippet(for:mode:idiom:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t (*v14)(_QWORD);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v21;

  v2 = type metadata accessor for BinaryButtonSnippetView();
  MEMORY[0x24BDAC7A8]();
  v4 = (uint64_t *)((char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for AppStorePunchoutButtonView();
  MEMORY[0x24BDAC7A8]();
  v9 = (uint64_t *)((char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ExpanseUIModel(0);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of ExpanseUIModel(a1, (uint64_t)v13, v14);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    outlined init with take of ExpanseUIModel.BinaryButtonSnippetModel((uint64_t)v13, (uint64_t)v6, type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
    outlined init with copy of ExpanseUIModel((uint64_t)v6, (uint64_t)v4 + *(int *)(v2 + 20), type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
    type metadata accessor for Context();
    lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel((unint64_t *)&lazy protocol witness table cache variable for type Context and conformance Context, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
    *v4 = EnvironmentObject.init()();
    v4[1] = v15;
    lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type BinaryButtonSnippetView and conformance BinaryButtonSnippetView, (uint64_t (*)(uint64_t))type metadata accessor for BinaryButtonSnippetView, (uint64_t)&protocol conformance descriptor for BinaryButtonSnippetView);
    v16 = View.eraseToAnyView()();
    outlined destroy of BinaryButtonSnippetView((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for BinaryButtonSnippetView);
    v17 = (uint64_t)v6;
    v18 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel;
  }
  else
  {
    outlined init with take of ExpanseUIModel.BinaryButtonSnippetModel((uint64_t)v13, (uint64_t)v11, type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel);
    outlined init with copy of ExpanseUIModel((uint64_t)v11, (uint64_t)v9 + *(int *)(v7 + 20), type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel);
    type metadata accessor for Context();
    lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel((unint64_t *)&lazy protocol witness table cache variable for type Context and conformance Context, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
    *v9 = EnvironmentObject.init()();
    v9[1] = v19;
    lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type AppStorePunchoutButtonView and conformance AppStorePunchoutButtonView, (uint64_t (*)(uint64_t))type metadata accessor for AppStorePunchoutButtonView, (uint64_t)&protocol conformance descriptor for AppStorePunchoutButtonView);
    v16 = View.eraseToAnyView()();
    outlined destroy of BinaryButtonSnippetView((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for AppStorePunchoutButtonView);
    v17 = (uint64_t)v11;
    v18 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel;
  }
  outlined destroy of BinaryButtonSnippetView(v17, v18);
  return v16;
}

uint64_t outlined init with take of ExpanseUIModel.BinaryButtonSnippetModel(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with copy of ExpanseUIModel(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x249557830](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined destroy of BinaryButtonSnippetView(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *initializeBufferWithCopyOfBuffer for BinaryButtonSnippetViewModel(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;

  v4 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = v4;
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(v6 + 20)), (uint64_t *)((char *)a2 + *(int *)(v6 + 20)), v7);
  }
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249557818]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t destroy for BinaryButtonSnippetViewModel(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v5)(uint64_t, uint64_t);

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v5(a1, v2);
  v3 = a1 + *(int *)(type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0) + 20);
  return ((uint64_t (*)(uint64_t, uint64_t))v5)(v3, v2);
}

uint64_t initializeWithCopy for BinaryButtonSnippetViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16);
  v5(a1, a2, v4);
  v6 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  return a1;
}

uint64_t assignWithCopy for BinaryButtonSnippetViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24);
  v5(a1, a2, v4);
  v6 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  return a1;
}

uint64_t initializeWithTake for BinaryButtonSnippetViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32);
  v5(a1, a2, v4);
  v6 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  return a1;
}

uint64_t assignWithTake for BinaryButtonSnippetViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40);
  v5(a1, a2, v4);
  v6 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for BinaryButtonSnippetViewModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246356CE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for BinaryButtonSnippetViewModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_246356D28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for BinaryButtonSnippetViewModel()
{
  uint64_t result;

  result = type metadata singleton initialization cache for BinaryButtonSnippetViewModel;
  if (!type metadata singleton initialization cache for BinaryButtonSnippetViewModel)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata completion function for BinaryButtonSnippetViewModel()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for AppStorePunchoutButtonView(char *a1, char **a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    *((_QWORD *)a1 + 1) = a2[1];
    v6 = *(int *)(a3 + 20);
    v7 = &a1[v6];
    v8 = (uint64_t)a2 + v6;
    v9 = v5;
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
    v11 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    v11(v7, v8, v10);
    v12 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
    v11(&v7[*(int *)(v12 + 20)], v8 + *(int *)(v12 + 20), v10);
  }
  return a1;
}

uint64_t destroy for AppStorePunchoutButtonView(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  char *v6;
  void (*v8)(char *, uint64_t);

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  v8 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v8(v4, v5);
  v6 = &v4[*(int *)(type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0) + 20)];
  return ((uint64_t (*)(char *, uint64_t))v8)(v6, v5);
}

_QWORD *initializeWithCopy for AppStorePunchoutButtonView(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;

  v4 = *(void **)a2;
  v5 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v5;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = a2 + v6;
  v9 = v4;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  v11 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  v11(v7, v8, v10);
  v12 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  v11(&v7[*(int *)(v12 + 20)], v8 + *(int *)(v12 + 20), v10);
  return a1;
}

uint64_t assignWithCopy for AppStorePunchoutButtonView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v9 = *(int *)(a3 + 20);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 24);
  v13(v10, v11, v12);
  v14 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  v13(v10 + *(int *)(v14 + 20), v11 + *(int *)(v14 + 20), v12);
  return a1;
}

_OWORD *initializeWithTake for AppStorePunchoutButtonView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  uint64_t v9;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32);
  v8(v5, v6, v7);
  v9 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  v8(&v5[*(int *)(v9 + 20)], &v6[*(int *)(v9 + 20)], v7);
  return a1;
}

uint64_t assignWithTake for AppStorePunchoutButtonView(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(uint64_t, char *, uint64_t);
  uint64_t v12;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  v11 = *(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v12 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  v11(v8 + *(int *)(v12 + 20), &v9[*(int *)(v12 + 20)], v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppStorePunchoutButtonView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2463571A4(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = type metadata accessor for AppStorePunchoutButtonViewModel();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for AppStorePunchoutButtonView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_246357238(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    v7 = type metadata accessor for AppStorePunchoutButtonViewModel();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for AppStorePunchoutButtonView()
{
  uint64_t result;

  result = type metadata singleton initialization cache for AppStorePunchoutButtonView;
  if (!type metadata singleton initialization cache for AppStorePunchoutButtonView)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata completion function for AppStorePunchoutButtonView()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in AppStorePunchoutButtonView()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t closure #1 in AppStorePunchoutButtonView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v15[6];

  v15[1] = a2;
  v3 = type metadata accessor for ButtonItemButtonStyle.Role();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(type metadata accessor for AppStorePunchoutButtonView() - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8]();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<Text>);
  v15[0] = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of ExpanseUIModel(a1, (uint64_t)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for AppStorePunchoutButtonView);
  v12 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v13 = swift_allocObject();
  outlined init with take of AppStorePunchoutButtonView((uint64_t)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12);
  v15[4] = a1;
  Button.init(action:label:)();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BEAD970], v3);
  lazy protocol witness table accessor for type Button<Text> and conformance Button<A>(&lazy protocol witness table cache variable for type Button<Text> and conformance Button<A>, &demangling cache variable for type metadata for Button<Text>, MEMORY[0x24BDF43B0]);
  View.buttonRole(_:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v15[0] + 8))(v11, v9);
}

void AppStorePunchoutButtonView.onButtonTapped()()
{
  void **v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  _QWORD v5[3];
  uint64_t v6;
  _UNKNOWN **v7;

  v1 = *v0;
  if (*v0)
  {
    type metadata accessor for AppStorePunchoutButtonView();
    v6 = type metadata accessor for Context();
    v7 = &protocol witness table for Context;
    v5[0] = v1;
    type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
    v2 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
    Loggable.wrappedValue.getter();
    v3 = AppStorePunchoutButtonViewModel.makeAppStorePunchout(appName:)();
    swift_bridgeObjectRelease();
    __swift_project_boxed_opaque_existential_1(v5, v6);
    v4 = v3;
    dispatch thunk of Context.perform(aceCommand:)();

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  }
  else
  {
    type metadata accessor for Context();
    lazy protocol witness table accessor for type Context and conformance Context();
    EnvironmentObject.error()();
    __break(1u);
  }
}

uint64_t closure #1 in closure #1 in AppStorePunchoutButtonView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  type metadata accessor for AppStorePunchoutButtonViewModel();
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for AppStorePunchoutButtonView();
  outlined init with copy of ExpanseUIModel(a1 + *(int *)(v6 + 20), (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for AppStorePunchoutButtonViewModel);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  Loggable.wrappedValue.getter();
  v7 = v13;
  v8 = v14;
  outlined destroy of ExpanseUIModel.AppStorePunchoutSnippetModel((uint64_t)v5);
  v13 = v7;
  v14 = v8;
  lazy protocol witness table accessor for type String and conformance String();
  result = Text.init<A>(_:)();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v10;
  *(_BYTE *)(a2 + 16) = v11 & 1;
  *(_QWORD *)(a2 + 24) = v12;
  return result;
}

uint64_t protocol witness for static View._viewListCount(inputs:) in conformance AppStorePunchoutButtonView()
{
  return static View._viewListCount(inputs:)();
}

uint64_t protocol witness for View.body.getter in conformance AppStorePunchoutButtonView(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t OpaqueTypeConformance2;
  _QWORD v11[2];

  v2 = *(_QWORD *)(a1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8]();
  outlined init with copy of ExpanseUIModel(v1, (uint64_t)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for AppStorePunchoutButtonView);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  outlined init with take of AppStorePunchoutButtonView((uint64_t)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.buttonRole(_:)>>.0);
  v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Button<Text>);
  v8 = lazy protocol witness table accessor for type Button<Text> and conformance Button<A>(&lazy protocol witness table cache variable for type Button<Text> and conformance Button<A>, &demangling cache variable for type metadata for Button<Text>, MEMORY[0x24BDF43B0]);
  v11[0] = v7;
  v11[1] = v8;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  return MEMORY[0x2495575CC](partial apply for closure #1 in AppStorePunchoutButtonView.body.getter, v5, v6, OpaqueTypeConformance2);
}

uint64_t outlined init with take of AppStorePunchoutButtonView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppStorePunchoutButtonView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in AppStorePunchoutButtonView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AppStorePunchoutButtonView() - 8) + 80);
  return closure #1 in AppStorePunchoutButtonView.body.getter(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249557824](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  char *v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t);
  uint64_t v7;

  v1 = type metadata accessor for AppStorePunchoutButtonView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  v4 = (char *)v3 + *(int *)(v1 + 20);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  v6 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v7 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  v6(&v4[*(int *)(v7 + 20)], v5);
  return swift_deallocObject();
}

void partial apply for implicit closure #2 in implicit closure #1 in closure #1 in AppStorePunchoutButtonView.body.getter()
{
  type metadata accessor for AppStorePunchoutButtonView();
  AppStorePunchoutButtonView.onButtonTapped()();
}

uint64_t partial apply for closure #1 in closure #1 in AppStorePunchoutButtonView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return closure #1 in closure #1 in AppStorePunchoutButtonView.body.getter(*(_QWORD *)(v1 + 16), a1);
}

uint64_t outlined destroy of ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x249557830](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Context and conformance Context()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type Context and conformance Context;
  if (!lazy protocol witness table cache variable for type Context and conformance Context)
  {
    v1 = type metadata accessor for Context();
    result = MEMORY[0x249557830](MEMORY[0x24BEAE520], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Context and conformance Context);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
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

uint64_t sub_246357B2C()
{
  return lazy protocol witness table accessor for type Button<Text> and conformance Button<A>(&lazy protocol witness table cache variable for type ComponentStack<<<opaque return type of View.buttonRole(_:)>>.0> and conformance ComponentStack<A>, &demangling cache variable for type metadata for ComponentStack<<<opaque return type of View.buttonRole(_:)>>.0>, MEMORY[0x24BEADC00]);
}

uint64_t lazy protocol witness table accessor for type Button<Text> and conformance Button<A>(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x249557830](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AppStorePunchoutButtonViewModel(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;

  v4 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = v4;
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(v6 + 20)), (uint64_t *)((char *)a2 + *(int *)(v6 + 20)), v7);
  }
  return a1;
}

uint64_t destroy for AppStorePunchoutButtonViewModel(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v5)(uint64_t, uint64_t);

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v5(a1, v2);
  v3 = a1 + *(int *)(type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0) + 20);
  return ((uint64_t (*)(uint64_t, uint64_t))v5)(v3, v2);
}

uint64_t initializeWithCopy for AppStorePunchoutButtonViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16);
  v5(a1, a2, v4);
  v6 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  return a1;
}

uint64_t assignWithCopy for AppStorePunchoutButtonViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24);
  v5(a1, a2, v4);
  v6 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  return a1;
}

uint64_t initializeWithTake for AppStorePunchoutButtonViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32);
  v5(a1, a2, v4);
  v6 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  return a1;
}

uint64_t assignWithTake for AppStorePunchoutButtonViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40);
  v5(a1, a2, v4);
  v6 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppStorePunchoutButtonViewModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246357E74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AppStorePunchoutButtonViewModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_246357EBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for AppStorePunchoutButtonViewModel()
{
  uint64_t result;

  result = type metadata singleton initialization cache for AppStorePunchoutButtonViewModel;
  if (!type metadata singleton initialization cache for AppStorePunchoutButtonViewModel)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata completion function for AppStorePunchoutButtonViewModel()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id AppStorePunchoutButtonViewModel.makeAppStorePunchout(appName:)()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSURL *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8]();
  v1 = (char *)&v13 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for URLComponents();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  URLComponents.init()();
  URLComponents.scheme.setter();
  URLComponents.host.setter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<URLQueryItem>);
  type metadata accessor for URLQueryItem();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_24635D450;
  URLQueryItem.init(name:value:)();
  URLQueryItem.init(name:value:)();
  URLQueryItem.init(name:value:)();
  URLComponents.queryItems.setter();
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81860]), sel_init);
  URLComponents.url.getter();
  v7 = type metadata accessor for URL();
  v8 = *(_QWORD *)(v7 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v1, 1, v7) != 1)
  {
    URL._bridgeToObjectiveC()(v9);
    v10 = v11;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v1, v7);
  }
  objc_msgSend(v6, sel_setPunchOutUri_, v10);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6;
}

uint64_t base witness table accessor for Decodable in ExpanseUIModel()
{
  return lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel and conformance ExpanseUIModel, type metadata accessor for ExpanseUIModel, (uint64_t)&protocol conformance descriptor for ExpanseUIModel);
}

uint64_t type metadata accessor for ExpanseUIModel(uint64_t a1)
{
  return type metadata accessor for ExpanseUIModel(a1, (uint64_t *)&type metadata singleton initialization cache for ExpanseUIModel);
}

uint64_t base witness table accessor for Encodable in ExpanseUIModel()
{
  return lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel and conformance ExpanseUIModel, type metadata accessor for ExpanseUIModel, (uint64_t)&protocol conformance descriptor for ExpanseUIModel);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys()
{
  _BYTE *v0;

  if (*v0)
    return 0x656D614E707061;
  else
    return 0x614C6E6F74747562;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys()
{
  lazy protocol witness table accessor for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys()
{
  lazy protocol witness table accessor for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t ExpanseUIModel.AppStorePunchoutSnippetModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v8[15] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  lazy protocol witness table accessor for type Loggable<String> and conformance <A> Loggable<A>(&lazy protocol witness table cache variable for type Loggable<String> and conformance <A> Loggable<A>, MEMORY[0x24BEAD370]);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v1)
  {
    type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
    v8[14] = 1;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ExpanseUIModel.AppStorePunchoutSnippetModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char v27;
  char v28;

  v21 = a2;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
  v24 = *(_QWORD *)(v26 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v22 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v25 = (char *)&v19 - v6;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys>);
  v7 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v19 = v10;
  v20 = a1;
  v13 = v7;
  v14 = v22;
  v15 = v24;
  v28 = 0;
  lazy protocol witness table accessor for type Loggable<String> and conformance <A> Loggable<A>(&lazy protocol witness table cache variable for type Loggable<String> and conformance <A> Loggable<A>, MEMORY[0x24BEAD380]);
  v16 = v23;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v17 = v25;
  v25 = *(char **)(v15 + 32);
  ((void (*)(char *, char *, uint64_t))v25)(v12, v17, v26);
  v27 = 1;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v9, v16);
  ((void (*)(char *, char *, uint64_t))v25)(&v12[*(int *)(v19 + 20)], v14, v26);
  outlined init with copy of ExpanseUIModel((uint64_t)v12, v21, type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  return outlined destroy of BinaryButtonSnippetView((uint64_t)v12, type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel);
}

uint64_t ExpanseUIModel.BinaryButtonSnippetModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v8[15] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  lazy protocol witness table accessor for type Loggable<ExpanseUIModel.ButtonModel> and conformance <A> Loggable<A>(&lazy protocol witness table cache variable for type Loggable<ExpanseUIModel.ButtonModel> and conformance <A> Loggable<A>, MEMORY[0x24BEAD370]);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v1)
  {
    type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
    v8[14] = 1;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ExpanseUIModel.BinaryButtonSnippetModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char v27;
  char v28;

  v21 = a2;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  v24 = *(_QWORD *)(v26 - 8);
  v4 = MEMORY[0x24BDAC7A8](v26);
  v22 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v25 = (char *)&v19 - v6;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys>);
  v7 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v19 = v10;
  v20 = a1;
  v13 = v7;
  v14 = v22;
  v15 = v24;
  v28 = 0;
  lazy protocol witness table accessor for type Loggable<ExpanseUIModel.ButtonModel> and conformance <A> Loggable<A>(&lazy protocol witness table cache variable for type Loggable<ExpanseUIModel.ButtonModel> and conformance <A> Loggable<A>, MEMORY[0x24BEAD380]);
  v16 = v23;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v17 = v25;
  v25 = *(char **)(v15 + 32);
  ((void (*)(char *, char *, uint64_t))v25)(v12, v17, v26);
  v27 = 1;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v9, v16);
  ((void (*)(char *, char *, uint64_t))v25)(&v12[*(int *)(v19 + 20)], v14, v26);
  outlined init with copy of ExpanseUIModel((uint64_t)v12, v21, type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  return outlined destroy of BinaryButtonSnippetView((uint64_t)v12, type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ExpanseUIModel.AppStorePunchoutSnippetModel()
{
  if ((static Loggable<A>.== infix(_:_:)() & 1) != 0)
    return static Loggable<A>.== infix(_:_:)();
  else
    return 0;
}

uint64_t protocol witness for Decodable.init(from:) in conformance ExpanseUIModel.AppStorePunchoutSnippetModel@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ExpanseUIModel.AppStorePunchoutSnippetModel.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance ExpanseUIModel.AppStorePunchoutSnippetModel(_QWORD *a1)
{
  return ExpanseUIModel.AppStorePunchoutSnippetModel.encode(to:)(a1);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys()
{
  _BYTE *v0;

  if (*v0)
    return 0x7261646E6F636573;
  else
    return 0x427972616D697270;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys()
{
  lazy protocol witness table accessor for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys()
{
  lazy protocol witness table accessor for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for Decodable.init(from:) in conformance ExpanseUIModel.BinaryButtonSnippetModel@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ExpanseUIModel.BinaryButtonSnippetModel.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance ExpanseUIModel.BinaryButtonSnippetModel(_QWORD *a1)
{
  return ExpanseUIModel.BinaryButtonSnippetModel.encode(to:)(a1);
}

uint64_t ExpanseUIModel.ButtonModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ExpanseUIModel.ButtonModel.CodingKeys>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v8[15] = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v1)
  {
    type metadata accessor for ExpanseUIModel.ButtonModel(0);
    v8[14] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
    lazy protocol witness table accessor for type CodableAceObject<SAIntentGroupRunSiriKitExecutor> and conformance CodableAceObject<A>(&lazy protocol witness table cache variable for type CodableAceObject<SAIntentGroupRunSiriKitExecutor> and conformance CodableAceObject<A>, MEMORY[0x24BEABA88]);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ExpanseUIModel.ButtonModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD v16[2];
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;

  v19 = a2;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
  v18 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v20 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ExpanseUIModel.ButtonModel.CodingKeys>);
  v5 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for ExpanseUIModel.ButtonModel(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (_QWORD *)((char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v17 = a1;
  v11 = v5;
  v13 = v20;
  v12 = v21;
  v24 = 0;
  *v10 = KeyedDecodingContainer.decode(_:forKey:)();
  v10[1] = v14;
  v16[1] = v14;
  v23 = 1;
  lazy protocol witness table accessor for type CodableAceObject<SAIntentGroupRunSiriKitExecutor> and conformance CodableAceObject<A>(&lazy protocol witness table cache variable for type CodableAceObject<SAIntentGroupRunSiriKitExecutor> and conformance CodableAceObject<A>, MEMORY[0x24BEABA90]);
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v22);
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))((char *)v10 + *(int *)(v8 + 20), v13, v12);
  outlined init with copy of ExpanseUIModel((uint64_t)v10, v19, type metadata accessor for ExpanseUIModel.ButtonModel);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return outlined destroy of BinaryButtonSnippetView((uint64_t)v10, type metadata accessor for ExpanseUIModel.ButtonModel);
}

uint64_t ExpanseUIModel.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ExpanseUIModel.BinaryButtonCodingKeys>);
  v30 = *(_QWORD *)(v2 - 8);
  v31 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v29 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  MEMORY[0x24BDAC7A8](v27);
  v28 = (uint64_t)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ExpanseUIModel.AppStorePunchoutCodingKeys>);
  v25 = *(_QWORD *)(v5 - 8);
  v26 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  MEMORY[0x24BDAC7A8](v24);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for ExpanseUIModel(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ExpanseUIModel.CodingKeys>);
  v32 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  outlined init with copy of ExpanseUIModel(v33, (uint64_t)v12, type metadata accessor for ExpanseUIModel);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v16 = v28;
    outlined init with take of ExpanseUIModel.BinaryButtonSnippetModel((uint64_t)v12, v28, type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
    v35 = 1;
    lazy protocol witness table accessor for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys();
    v17 = v29;
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel and conformance ExpanseUIModel.BinaryButtonSnippetModel, type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel, (uint64_t)&protocol conformance descriptor for ExpanseUIModel.BinaryButtonSnippetModel);
    v18 = v31;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v18);
    v19 = v16;
    v20 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel;
  }
  else
  {
    outlined init with take of ExpanseUIModel.BinaryButtonSnippetModel((uint64_t)v12, (uint64_t)v9, type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel);
    v34 = 0;
    lazy protocol witness table accessor for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel and conformance ExpanseUIModel.AppStorePunchoutSnippetModel, type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel, (uint64_t)&protocol conformance descriptor for ExpanseUIModel.AppStorePunchoutSnippetModel);
    v21 = v26;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v21);
    v19 = (uint64_t)v9;
    v20 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel;
  }
  outlined destroy of BinaryButtonSnippetView(v19, v20);
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v15, v13);
}

uint64_t ExpanseUIModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  char v46;

  v36 = a2;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ExpanseUIModel.BinaryButtonCodingKeys>);
  v40 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v43 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ExpanseUIModel.AppStorePunchoutCodingKeys>);
  v38 = *(_QWORD *)(v4 - 8);
  v39 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v42 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ExpanseUIModel.CodingKeys>);
  v41 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for ExpanseUIModel(0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v32 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v32 - v16;
  v18 = a1[3];
  v44 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  lazy protocol witness table accessor for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys();
  v19 = v45;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v19)
    goto LABEL_5;
  v34 = v12;
  v35 = v15;
  v20 = v43;
  v33 = v17;
  v45 = v9;
  v21 = v6;
  v22 = v8;
  if (*(_QWORD *)(KeyedDecodingContainer.allKeys.getter() + 16) != 1)
  {
    v27 = type metadata accessor for DecodingError();
    swift_allocError();
    v29 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *v29 = v45;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v27 - 8) + 104))(v29, *MEMORY[0x24BEE26D0], v27);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v8, v6);
LABEL_5:
    v26 = (uint64_t)v44;
    return __swift_destroy_boxed_opaque_existential_1(v26);
  }
  v46 = 1;
  lazy protocol witness table accessor for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys();
  v23 = v20;
  KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
  type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel and conformance ExpanseUIModel.BinaryButtonSnippetModel, type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel, (uint64_t)&protocol conformance descriptor for ExpanseUIModel.BinaryButtonSnippetModel);
  v24 = (uint64_t)v34;
  v25 = v37;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v23, v25);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v22, v21);
  v26 = (uint64_t)v44;
  swift_storeEnumTagMultiPayload();
  v31 = (uint64_t)v33;
  outlined init with take of ExpanseUIModel.BinaryButtonSnippetModel(v24, (uint64_t)v33, type metadata accessor for ExpanseUIModel);
  outlined init with take of ExpanseUIModel.BinaryButtonSnippetModel(v31, v36, type metadata accessor for ExpanseUIModel);
  return __swift_destroy_boxed_opaque_existential_1(v26);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ExpanseUIModel.ButtonModel.CodingKeys()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000010;
  else
    return 0x6C6562616CLL;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ExpanseUIModel.ButtonModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized ExpanseUIModel.ButtonModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ExpanseUIModel.ButtonModel.CodingKeys()
{
  lazy protocol witness table accessor for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ExpanseUIModel.ButtonModel.CodingKeys()
{
  lazy protocol witness table accessor for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for Decodable.init(from:) in conformance ExpanseUIModel.ButtonModel@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ExpanseUIModel.ButtonModel.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance ExpanseUIModel.ButtonModel(_QWORD *a1)
{
  return ExpanseUIModel.ButtonModel.encode(to:)(a1);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ExpanseUIModel.AppStorePunchoutCodingKeys()
{
  return 1;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ExpanseUIModel.AppStorePunchoutCodingKeys()
{
  return 12383;
}

void protocol witness for CodingKey.init(intValue:) in conformance ExpanseUIModel.AppStorePunchoutCodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ExpanseUIModel.AppStorePunchoutCodingKeys()
{
  lazy protocol witness table accessor for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ExpanseUIModel.AppStorePunchoutCodingKeys()
{
  lazy protocol witness table accessor for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys();
  return CodingKey.debugDescription.getter();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ExpanseUIModel.AppStorePunchoutCodingKeys()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance ExpanseUIModel.BinaryButtonCodingKeys()
{
  Hasher._combine(_:)(0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ExpanseUIModel.AppStorePunchoutCodingKeys()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ExpanseUIModel.AppStorePunchoutCodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ExpanseUIModel.BinaryButtonCodingKeys()
{
  lazy protocol witness table accessor for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ExpanseUIModel.BinaryButtonCodingKeys()
{
  lazy protocol witness table accessor for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys();
  return CodingKey.debugDescription.getter();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ExpanseUIModel.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance ExpanseUIModel.CodingKeys()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ExpanseUIModel.CodingKeys()
{
  _BYTE *v0;

  if (*v0)
    return 0x75427972616E6962;
  else
    return 0xD000000000000010;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ExpanseUIModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized ExpanseUIModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ExpanseUIModel.CodingKeys()
{
  lazy protocol witness table accessor for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ExpanseUIModel.CodingKeys()
{
  lazy protocol witness table accessor for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

unint64_t protocol witness for static SnippetPluginModel.bundleName.getter in conformance ExpanseUIModel()
{
  return 0xD00000000000001BLL;
}

uint64_t protocol witness for Decodable.init(from:) in conformance ExpanseUIModel@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ExpanseUIModel.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance ExpanseUIModel(_QWORD *a1)
{
  return ExpanseUIModel.encode(to:)(a1);
}

unint64_t lazy protocol witness table accessor for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.CodingKeys, &unk_25178F500);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.CodingKeys, &unk_25178F500);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.CodingKeys, &unk_25178F500);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.CodingKeys, &unk_25178F500);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.CodingKeys and conformance ExpanseUIModel.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.BinaryButtonCodingKeys, &unk_25178F620);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.BinaryButtonCodingKeys, &unk_25178F620);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.BinaryButtonCodingKeys, &unk_25178F620);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.BinaryButtonCodingKeys, &unk_25178F620);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonCodingKeys and conformance ExpanseUIModel.BinaryButtonCodingKeys);
  }
  return result;
}

uint64_t type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(uint64_t a1)
{
  return type metadata accessor for ExpanseUIModel(a1, (uint64_t *)&type metadata singleton initialization cache for ExpanseUIModel.BinaryButtonSnippetModel);
}

unint64_t lazy protocol witness table accessor for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.AppStorePunchoutCodingKeys, &unk_25178F590);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.AppStorePunchoutCodingKeys, &unk_25178F590);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.AppStorePunchoutCodingKeys, &unk_25178F590);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.AppStorePunchoutCodingKeys, &unk_25178F590);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutCodingKeys and conformance ExpanseUIModel.AppStorePunchoutCodingKeys);
  }
  return result;
}

uint64_t type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1)
{
  return type metadata accessor for ExpanseUIModel(a1, (uint64_t *)&type metadata singleton initialization cache for ExpanseUIModel.AppStorePunchoutSnippetModel);
}

uint64_t *initializeBufferWithCopyOfBuffer for ExpanseUIModel.ButtonModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    swift_bridgeObjectRetain();
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  }
  return a1;
}

uint64_t destroy for ExpanseUIModel.ButtonModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for ExpanseUIModel.ButtonModel(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  swift_bridgeObjectRetain();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  return a1;
}

_QWORD *assignWithCopy for ExpanseUIModel.ButtonModel(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for ExpanseUIModel.ButtonModel(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithTake for ExpanseUIModel.ButtonModel(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for ExpanseUIModel.ButtonModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24635A0D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ExpanseUIModel.ButtonModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24635A160(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for ExpanseUIModel.ButtonModel(uint64_t a1)
{
  return type metadata accessor for ExpanseUIModel(a1, (uint64_t *)&type metadata singleton initialization cache for ExpanseUIModel.ButtonModel);
}

uint64_t type metadata accessor for ExpanseUIModel(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void type metadata completion function for ExpanseUIModel.ButtonModel()
{
  unint64_t v0;

  type metadata accessor for CodableAceObject<SAIntentGroupRunSiriKitExecutor>(319, &lazy cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>, (uint64_t (*)(uint64_t))type metadata accessor for SAIntentGroupRunSiriKitExecutor, MEMORY[0x24BEABA78]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

unint64_t type metadata accessor for SAIntentGroupRunSiriKitExecutor()
{
  unint64_t result;

  result = lazy cache variable for type metadata for SAIntentGroupRunSiriKitExecutor;
  if (!lazy cache variable for type metadata for SAIntentGroupRunSiriKitExecutor)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for SAIntentGroupRunSiriKitExecutor);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return initializeBufferWithCopyOfBuffer for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, a3, &demangling cache variable for type metadata for Loggable<String>);
}

uint64_t destroy for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1, uint64_t a2)
{
  return destroy for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, &demangling cache variable for type metadata for Loggable<String>);
}

uint64_t initializeWithCopy for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return initializeWithCopy for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, a3, &demangling cache variable for type metadata for Loggable<String>);
}

uint64_t assignWithCopy for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return assignWithCopy for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, a3, &demangling cache variable for type metadata for Loggable<String>);
}

uint64_t initializeWithTake for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return initializeWithTake for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, a3, &demangling cache variable for type metadata for Loggable<String>);
}

uint64_t assignWithTake for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return assignWithTake for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, a3, &demangling cache variable for type metadata for Loggable<String>);
}

uint64_t getEnumTagSinglePayload for ExpanseUIModel.AppStorePunchoutSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24635A33C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_1Tm(a1, a2, a3, &demangling cache variable for type metadata for Loggable<String>);
}

uint64_t storeEnumTagSinglePayload for ExpanseUIModel.AppStorePunchoutSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24635A354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_2Tm(a1, a2, a3, a4, &demangling cache variable for type metadata for Loggable<String>);
}

void type metadata completion function for ExpanseUIModel.AppStorePunchoutSnippetModel()
{
  unint64_t v0;

  type metadata accessor for Loggable<String>();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void type metadata accessor for Loggable<String>()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Loggable<String>)
  {
    v0 = type metadata accessor for Loggable();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Loggable<String>);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for ExpanseUIModel.BinaryButtonSnippetModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return initializeBufferWithCopyOfBuffer for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, a3, &demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
}

uint64_t *initializeBufferWithCopyOfBuffer for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  int v6;
  uint64_t v8;
  void (*v9)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v10;

  v6 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v6 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(a4);
    v9 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
    v9(a1, a2, v8);
    v9((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v8);
  }
  return a1;
}

uint64_t destroy for ExpanseUIModel.BinaryButtonSnippetModel(uint64_t a1, uint64_t a2)
{
  return destroy for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, &demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
}

uint64_t destroy for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  void (*v7)(uint64_t, uint64_t);

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v7(a1, v5);
  return ((uint64_t (*)(uint64_t, uint64_t))v7)(a1 + *(int *)(a2 + 20), v5);
}

uint64_t initializeWithCopy for ExpanseUIModel.BinaryButtonSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return initializeWithCopy for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, a3, &demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
}

uint64_t initializeWithCopy for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);

  v7 = __swift_instantiateConcreteTypeFromMangledName(a4);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
  v8(a1, a2, v7);
  v8(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v7);
  return a1;
}

uint64_t assignWithCopy for ExpanseUIModel.BinaryButtonSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return assignWithCopy for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, a3, &demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
}

uint64_t assignWithCopy for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);

  v7 = __swift_instantiateConcreteTypeFromMangledName(a4);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 24);
  v8(a1, a2, v7);
  v8(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v7);
  return a1;
}

uint64_t initializeWithTake for ExpanseUIModel.BinaryButtonSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return initializeWithTake for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, a3, &demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
}

uint64_t initializeWithTake for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);

  v7 = __swift_instantiateConcreteTypeFromMangledName(a4);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32);
  v8(a1, a2, v7);
  v8(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v7);
  return a1;
}

uint64_t assignWithTake for ExpanseUIModel.BinaryButtonSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return assignWithTake for ExpanseUIModel.AppStorePunchoutSnippetModel(a1, a2, a3, &demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
}

uint64_t assignWithTake for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);

  v7 = __swift_instantiateConcreteTypeFromMangledName(a4);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 40);
  v8(a1, a2, v7);
  v8(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for ExpanseUIModel.BinaryButtonSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24635A734(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_1Tm(a1, a2, a3, &demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
}

uint64_t __swift_get_extra_inhabitant_index_1Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(a1, a2, v6);
}

uint64_t storeEnumTagSinglePayload for ExpanseUIModel.BinaryButtonSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24635A788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_2Tm(a1, a2, a3, a4, &demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
}

uint64_t __swift_store_extra_inhabitant_index_2Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v7;

  v7 = __swift_instantiateConcreteTypeFromMangledName(a5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(a1, a2, a2, v7);
}

void type metadata completion function for ExpanseUIModel.BinaryButtonSnippetModel()
{
  unint64_t v0;

  type metadata accessor for CodableAceObject<SAIntentGroupRunSiriKitExecutor>(319, &lazy cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>, type metadata accessor for ExpanseUIModel.ButtonModel, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEAD360]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void type metadata accessor for CodableAceObject<SAIntentGroupRunSiriKitExecutor>(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTag for ExpanseUIModel.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for ExpanseUIModel.CodingKeys(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void *type metadata accessor for ExpanseUIModel.CodingKeys()
{
  return &unk_25178F500;
}

uint64_t getEnumTag for ExpanseUIModel.AppStorePunchoutCodingKeys()
{
  return 0;
}

void *type metadata accessor for ExpanseUIModel.AppStorePunchoutCodingKeys()
{
  return &unk_25178F590;
}

uint64_t getEnumTagSinglePayload for ExpanseUIModel.AppStorePunchoutCodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ExpanseUIModel.AppStorePunchoutCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24635A9A0 + 4 * byte_24635D4B0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24635A9C0 + 4 * byte_24635D4B5[v4]))();
}

_BYTE *sub_24635A9A0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24635A9C0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24635A9C8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24635A9D0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24635A9D8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24635A9E0(_DWORD *result)
{
  *result = 0;
  return result;
}

void *type metadata accessor for ExpanseUIModel.BinaryButtonCodingKeys()
{
  return &unk_25178F620;
}

uint64_t *initializeBufferWithCopyOfBuffer for ExpanseUIModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  void (*v7)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v8;
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
      v7 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
      v7(a1, a2, v6);
      v8 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
    }
    else
    {
      v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
      v7 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
      v7(a1, a2, v6);
      v8 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
    }
    v7((uint64_t *)((char *)a1 + *(int *)(v8 + 20)), (uint64_t *)((char *)a2 + *(int *)(v8 + 20)), v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for ExpanseUIModel(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v5)(uint64_t, uint64_t);

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
    v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
    v5(a1, v2);
    v3 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  }
  else
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
    v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
    v5(a1, v2);
    v3 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  }
  return ((uint64_t (*)(uint64_t, uint64_t))v5)(a1 + *(int *)(v3 + 20), v2);
}

uint64_t initializeWithCopy for ExpanseUIModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
    v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16);
    v5(a1, a2, v4);
    v6 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  }
  else
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
    v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16);
    v5(a1, a2, v4);
    v6 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  }
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for ExpanseUIModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;

  if (a1 != a2)
  {
    outlined destroy of BinaryButtonSnippetView(a1, type metadata accessor for ExpanseUIModel);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
      v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16);
      v5(a1, a2, v4);
      v6 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
    }
    else
    {
      v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
      v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16);
      v5(a1, a2, v4);
      v6 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
    }
    v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for ExpanseUIModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
    v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32);
    v5(a1, a2, v4);
    v6 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  }
  else
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
    v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32);
    v5(a1, a2, v4);
    v6 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  }
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for ExpanseUIModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;

  if (a1 != a2)
  {
    outlined destroy of BinaryButtonSnippetView(a1, type metadata accessor for ExpanseUIModel);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
      v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32);
      v5(a1, a2, v4);
      v6 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
    }
    else
    {
      v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<String>);
      v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32);
      v5(a1, a2, v4);
      v6 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
    }
    v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ExpanseUIModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for ExpanseUIModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t destructiveInjectEnumTag for ExpanseUIModel()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t type metadata completion function for ExpanseUIModel()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(319);
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(319);
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t base witness table accessor for Decodable in ExpanseUIModel.BinaryButtonSnippetModel()
{
  return lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel and conformance ExpanseUIModel.BinaryButtonSnippetModel, type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel, (uint64_t)&protocol conformance descriptor for ExpanseUIModel.BinaryButtonSnippetModel);
}

uint64_t base witness table accessor for Encodable in ExpanseUIModel.BinaryButtonSnippetModel()
{
  return lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel and conformance ExpanseUIModel.BinaryButtonSnippetModel, type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel, (uint64_t)&protocol conformance descriptor for ExpanseUIModel.BinaryButtonSnippetModel);
}

uint64_t base witness table accessor for Decodable in ExpanseUIModel.AppStorePunchoutSnippetModel()
{
  return lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel and conformance ExpanseUIModel.AppStorePunchoutSnippetModel, type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel, (uint64_t)&protocol conformance descriptor for ExpanseUIModel.AppStorePunchoutSnippetModel);
}

uint64_t base witness table accessor for Encodable in ExpanseUIModel.AppStorePunchoutSnippetModel()
{
  return lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel and conformance ExpanseUIModel.AppStorePunchoutSnippetModel, type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel, (uint64_t)&protocol conformance descriptor for ExpanseUIModel.AppStorePunchoutSnippetModel);
}

uint64_t specialized ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x614C6E6F74747562 && a2 == 0xEB000000006C6562;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656D614E707061 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t specialized ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x427972616D697270 && a2 == 0xED00006E6F747475;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7261646E6F636573 && a2 == 0xEF6E6F7474754279)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t specialized ExpanseUIModel.ButtonModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024635DF50)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t specialized ExpanseUIModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000010 && a2 == 0x800000024635DF30
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x75427972616E6962 && a2 == 0xEC0000006E6F7474)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

unint64_t lazy protocol witness table accessor for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys, &unk_25178F7D0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys, &unk_25178F7D0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys, &unk_25178F7D0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys, &unk_25178F7D0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys and conformance ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys, &unk_25178F740);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys, &unk_25178F740);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys, &unk_25178F740);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys, &unk_25178F740);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys and conformance ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type Loggable<ExpanseUIModel.ButtonModel> and conformance <A> Loggable<A>(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  _QWORD v6[2];

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
    v6[0] = lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel and conformance ExpanseUIModel.ButtonModel, type metadata accessor for ExpanseUIModel.ButtonModel, (uint64_t)&protocol conformance descriptor for ExpanseUIModel.ButtonModel);
    v6[1] = lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel and conformance ExpanseUIModel.ButtonModel, type metadata accessor for ExpanseUIModel.ButtonModel, (uint64_t)&protocol conformance descriptor for ExpanseUIModel.ButtonModel);
    result = MEMORY[0x249557830](a2, v5, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type Loggable<String> and conformance <A> Loggable<A>(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  _QWORD v6[2];

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Loggable<String>);
    v6[0] = MEMORY[0x24BEE0D38];
    v6[1] = MEMORY[0x24BEE0D08];
    result = MEMORY[0x249557830](a2, v5, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.ButtonModel.CodingKeys, &unk_25178F6B0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.ButtonModel.CodingKeys, &unk_25178F6B0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.ButtonModel.CodingKeys, &unk_25178F6B0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys)
  {
    result = MEMORY[0x249557830](&protocol conformance descriptor for ExpanseUIModel.ButtonModel.CodingKeys, &unk_25178F6B0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExpanseUIModel.ButtonModel.CodingKeys and conformance ExpanseUIModel.ButtonModel.CodingKeys);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type CodableAceObject<SAIntentGroupRunSiriKitExecutor> and conformance CodableAceObject<A>(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
    result = MEMORY[0x249557830](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

void *type metadata accessor for ExpanseUIModel.ButtonModel.CodingKeys()
{
  return &unk_25178F6B0;
}

void *type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys()
{
  return &unk_25178F740;
}

uint64_t getEnumTagSinglePayload for ExpanseUIModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ExpanseUIModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24635BAC8 + 4 * byte_24635D4BF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24635BAFC + 4 * byte_24635D4BA[v4]))();
}

uint64_t sub_24635BAFC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24635BB04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24635BB0CLL);
  return result;
}

uint64_t sub_24635BB18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24635BB20);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24635BB24(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24635BB2C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys()
{
  return &unk_25178F7D0;
}

uint64_t dispatch thunk of ViewContext.perform(aceCommand:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ViewContext.perform(directInvocation:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

char *initializeBufferWithCopyOfBuffer for BinaryButtonSnippetView(char *a1, char **a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    *((_QWORD *)a1 + 1) = a2[1];
    v6 = *(int *)(a3 + 20);
    v7 = &a1[v6];
    v8 = (uint64_t)a2 + v6;
    v9 = v5;
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
    v11 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    v11(v7, v8, v10);
    v12 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
    v11(&v7[*(int *)(v12 + 20)], v8 + *(int *)(v12 + 20), v10);
  }
  return a1;
}

uint64_t destroy for BinaryButtonSnippetView(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  char *v6;
  void (*v8)(char *, uint64_t);

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  v8 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v8(v4, v5);
  v6 = &v4[*(int *)(type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0) + 20)];
  return ((uint64_t (*)(char *, uint64_t))v8)(v6, v5);
}

_QWORD *initializeWithCopy for BinaryButtonSnippetView(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;

  v4 = *(void **)a2;
  v5 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v5;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = a2 + v6;
  v9 = v4;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  v11 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  v11(v7, v8, v10);
  v12 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  v11(&v7[*(int *)(v12 + 20)], v8 + *(int *)(v12 + 20), v10);
  return a1;
}

uint64_t assignWithCopy for BinaryButtonSnippetView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v9 = *(int *)(a3 + 20);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 24);
  v13(v10, v11, v12);
  v14 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  v13(v10 + *(int *)(v14 + 20), v11 + *(int *)(v14 + 20), v12);
  return a1;
}

_OWORD *initializeWithTake for BinaryButtonSnippetView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  uint64_t v9;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32);
  v8(v5, v6, v7);
  v9 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  v8(&v5[*(int *)(v9 + 20)], &v6[*(int *)(v9 + 20)], v7);
  return a1;
}

uint64_t assignWithTake for BinaryButtonSnippetView(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(uint64_t, char *, uint64_t);
  uint64_t v12;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  v11 = *(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v12 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  v11(v8 + *(int *)(v12 + 20), &v9[*(int *)(v12 + 20)], v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for BinaryButtonSnippetView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24635C18C(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = type metadata accessor for BinaryButtonSnippetViewModel();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for BinaryButtonSnippetView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_24635C220(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    v7 = type metadata accessor for BinaryButtonSnippetViewModel();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for BinaryButtonSnippetView()
{
  uint64_t result;

  result = type metadata singleton initialization cache for BinaryButtonSnippetView;
  if (!type metadata singleton initialization cache for BinaryButtonSnippetView)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata completion function for BinaryButtonSnippetView()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in BinaryButtonSnippetView()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t closure #1 in BinaryButtonSnippetView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, _QWORD, uint64_t);
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
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

  v38 = a2;
  v36 = type metadata accessor for ButtonItemButtonStyle.Role();
  v3 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for BinaryButtonSnippetView();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<Text>);
  v32 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.buttonRole(_:)>>.0);
  v37 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = a1;
  outlined init with copy of ExpanseUIModel(a1, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for BinaryButtonSnippetView);
  v16 = *(unsigned __int8 *)(v7 + 80);
  v34 = ((v16 + 16) & ~v16) + v8;
  v17 = (v16 + 16) & ~v16;
  v35 = v17;
  v33 = v16 | 7;
  v18 = swift_allocObject();
  outlined init with take of BinaryButtonSnippetView((uint64_t)v9, v18 + v17);
  v40 = a1;
  Button.init(action:label:)();
  v19 = v3;
  v20 = *(void (**)(char *, _QWORD, uint64_t))(v3 + 104);
  v21 = v36;
  v20(v5, *MEMORY[0x24BEAD978], v36);
  v22 = lazy protocol witness table accessor for type Button<Text> and conformance Button<A>(&lazy protocol witness table cache variable for type Button<Text> and conformance Button<A>, &demangling cache variable for type metadata for Button<Text>, MEMORY[0x24BDF43B0]);
  View.buttonRole(_:)();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v21);
  v23 = *(void (**)(char *, uint64_t))(v32 + 8);
  v23(v12, v10);
  v44 = v10;
  v45 = v22;
  swift_getOpaqueTypeConformance2();
  v24 = View.eraseToAnyView()();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v15, v13);
  v25 = MEMORY[0x24BDF4780];
  v26 = MEMORY[0x24BEAD938];
  v46 = MEMORY[0x24BDF4780];
  v47 = MEMORY[0x24BEAD938];
  v44 = v24;
  v27 = v31;
  outlined init with copy of ExpanseUIModel(v31, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for BinaryButtonSnippetView);
  v28 = swift_allocObject();
  outlined init with take of BinaryButtonSnippetView((uint64_t)v9, v28 + v35);
  v39 = v27;
  Button.init(action:label:)();
  v29 = View.eraseToAnyView()();
  v23(v12, v10);
  v42 = v25;
  v43 = v26;
  v41 = v29;
  return BinaryButtonView.init(primaryButton:secondaryButton:)();
}

void BinaryButtonSnippetView.onPrimaryButtonTapped()()
{
  void **v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[3];
  uint64_t v9;
  _UNKNOWN **v10;

  v1 = type metadata accessor for ExpanseUIModel.ButtonModel(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v8[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *v0;
  if (*v0)
  {
    type metadata accessor for BinaryButtonSnippetView();
    v9 = type metadata accessor for Context();
    v10 = &protocol witness table for Context;
    v8[0] = v4;
    __swift_project_boxed_opaque_existential_1(v8, v9);
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
    Loggable.wrappedValue.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
    v6 = (void *)CodableAceObject.wrappedValue.getter();
    outlined destroy of BinaryButtonSnippetView((uint64_t)v3, type metadata accessor for ExpanseUIModel.ButtonModel);
    dispatch thunk of Context.perform(directInvocation:)();

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  }
  else
  {
    type metadata accessor for Context();
    lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel((unint64_t *)&lazy protocol witness table cache variable for type Context and conformance Context, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
    EnvironmentObject.error()();
    __break(1u);
  }
}

uint64_t closure #1 in BinaryButtonSnippetView.primaryButton.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  char v15;
  uint64_t v16;
  _QWORD v17[2];

  v4 = type metadata accessor for ExpanseUIModel.ButtonModel(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (_QWORD *)((char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = type metadata accessor for BinaryButtonSnippetViewModel();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for BinaryButtonSnippetView();
  outlined init with copy of ExpanseUIModel(a1 + *(int *)(v10 + 20), (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for BinaryButtonSnippetViewModel);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  Loggable.wrappedValue.getter();
  outlined destroy of BinaryButtonSnippetView((uint64_t)v9, type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
  v12 = *v6;
  v11 = v6[1];
  swift_bridgeObjectRetain();
  outlined destroy of BinaryButtonSnippetView((uint64_t)v6, type metadata accessor for ExpanseUIModel.ButtonModel);
  v17[0] = v12;
  v17[1] = v11;
  lazy protocol witness table accessor for type String and conformance String();
  result = Text.init<A>(_:)();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v14;
  *(_BYTE *)(a2 + 16) = v15 & 1;
  *(_QWORD *)(a2 + 24) = v16;
  return result;
}

void BinaryButtonSnippetView.onSecondaryButtonTapped()()
{
  void **v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[3];
  uint64_t v9;
  _UNKNOWN **v10;

  v1 = type metadata accessor for ExpanseUIModel.ButtonModel(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v8[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *v0;
  if (*v0)
  {
    type metadata accessor for BinaryButtonSnippetView();
    v9 = type metadata accessor for Context();
    v10 = &protocol witness table for Context;
    v8[0] = v4;
    __swift_project_boxed_opaque_existential_1(v8, v9);
    type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
    Loggable.wrappedValue.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableAceObject<SAIntentGroupRunSiriKitExecutor>);
    v6 = (void *)CodableAceObject.wrappedValue.getter();
    outlined destroy of BinaryButtonSnippetView((uint64_t)v3, type metadata accessor for ExpanseUIModel.ButtonModel);
    dispatch thunk of Context.perform(directInvocation:)();

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  }
  else
  {
    type metadata accessor for Context();
    lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel((unint64_t *)&lazy protocol witness table cache variable for type Context and conformance Context, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
    EnvironmentObject.error()();
    __break(1u);
  }
}

uint64_t closure #1 in BinaryButtonSnippetView.secondaryButton.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  char v15;
  uint64_t v16;
  _QWORD v17[2];

  v4 = type metadata accessor for ExpanseUIModel.ButtonModel(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (_QWORD *)((char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = type metadata accessor for BinaryButtonSnippetViewModel();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for BinaryButtonSnippetView();
  outlined init with copy of ExpanseUIModel(a1 + *(int *)(v10 + 20), (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for BinaryButtonSnippetViewModel);
  type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  Loggable.wrappedValue.getter();
  outlined destroy of BinaryButtonSnippetView((uint64_t)v9, type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
  v12 = *v6;
  v11 = v6[1];
  swift_bridgeObjectRetain();
  outlined destroy of BinaryButtonSnippetView((uint64_t)v6, type metadata accessor for ExpanseUIModel.ButtonModel);
  v17[0] = v12;
  v17[1] = v11;
  lazy protocol witness table accessor for type String and conformance String();
  result = Text.init<A>(_:)();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v14;
  *(_BYTE *)(a2 + 16) = v15 & 1;
  *(_QWORD *)(a2 + 24) = v16;
  return result;
}

uint64_t protocol witness for View.body.getter in conformance BinaryButtonSnippetView(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](a1);
  outlined init with copy of ExpanseUIModel(v1, (uint64_t)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for BinaryButtonSnippetView);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  outlined init with take of BinaryButtonSnippetView((uint64_t)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  v6 = type metadata accessor for BinaryButtonView();
  v7 = lazy protocol witness table accessor for type ExpanseUIModel and conformance ExpanseUIModel(&lazy protocol witness table cache variable for type BinaryButtonView and conformance BinaryButtonView, (uint64_t (*)(uint64_t))MEMORY[0x24BEADCE0], MEMORY[0x24BEADCC0]);
  return MEMORY[0x2495575CC](partial apply for closure #1 in BinaryButtonSnippetView.body.getter, v5, v6, v7);
}

uint64_t outlined init with take of BinaryButtonSnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for BinaryButtonSnippetView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in BinaryButtonSnippetView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for BinaryButtonSnippetView() - 8) + 80);
  return closure #1 in BinaryButtonSnippetView.body.getter(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in BinaryButtonSnippetView.primaryButton.getter()
{
  return partial apply for implicit closure #2 in implicit closure #1 in BinaryButtonSnippetView.primaryButton.getter((uint64_t (*)(void))BinaryButtonSnippetView.onPrimaryButtonTapped());
}

uint64_t partial apply for closure #1 in BinaryButtonSnippetView.primaryButton.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return closure #1 in BinaryButtonSnippetView.primaryButton.getter(*(_QWORD *)(v1 + 16), a1);
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  char *v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t);
  uint64_t v7;

  v1 = type metadata accessor for BinaryButtonSnippetView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  v4 = (char *)v3 + *(int *)(v1 + 20);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ExpanseUIModel.ButtonModel>);
  v6 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v7 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  v6(&v4[*(int *)(v7 + 20)], v5);
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in BinaryButtonSnippetView.secondaryButton.getter()
{
  return partial apply for implicit closure #2 in implicit closure #1 in BinaryButtonSnippetView.primaryButton.getter((uint64_t (*)(void))BinaryButtonSnippetView.onSecondaryButtonTapped());
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in BinaryButtonSnippetView.primaryButton.getter(uint64_t (*a1)(void))
{
  type metadata accessor for BinaryButtonSnippetView();
  return a1();
}

uint64_t partial apply for closure #1 in BinaryButtonSnippetView.secondaryButton.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return closure #1 in BinaryButtonSnippetView.secondaryButton.getter(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_24635CE74()
{
  return lazy protocol witness table accessor for type Button<Text> and conformance Button<A>(&lazy protocol witness table cache variable for type ComponentStack<BinaryButtonView> and conformance ComponentStack<A>, &demangling cache variable for type metadata for ComponentStack<BinaryButtonView>, MEMORY[0x24BEADC00]);
}

uint64_t URLQueryItem.init(name:value:)()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t URLComponents.queryItems.setter()
{
  return MEMORY[0x24BDCBA60]();
}

uint64_t URLComponents.url.getter()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t URLComponents.host.setter()
{
  return MEMORY[0x24BDCBAD0]();
}

uint64_t URLComponents.scheme.setter()
{
  return MEMORY[0x24BDCBB28]();
}

uint64_t URLComponents.init()()
{
  return MEMORY[0x24BDCBB68]();
}

uint64_t type metadata accessor for URLComponents()
{
  return MEMORY[0x24BDCBB78]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x24BDCD8D0](retstr);
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t SnippetPluginModel.snippetHidden(for:idiom:)()
{
  return MEMORY[0x24BEAA5D8]();
}

uint64_t CodableAceObject.wrappedValue.getter()
{
  return MEMORY[0x24BEABA68]();
}

uint64_t Loggable.wrappedValue.getter()
{
  return MEMORY[0x24BEAD348]();
}

uint64_t static Loggable<A>.== infix(_:_:)()
{
  return MEMORY[0x24BEAD358]();
}

uint64_t type metadata accessor for Loggable()
{
  return MEMORY[0x24BEAD360]();
}

uint64_t EnvironmentObject.error()()
{
  return MEMORY[0x24BDEDE50]();
}

uint64_t EnvironmentObject.init()()
{
  return MEMORY[0x24BDEDE60]();
}

uint64_t Text.init<A>(_:)()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t View.eraseToAnyView()()
{
  return MEMORY[0x24BEAD6D0]();
}

uint64_t View.buttonRole(_:)()
{
  return MEMORY[0x24BEAD708]();
}

uint64_t static View._makeView(view:inputs:)()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t static View._viewListCount(inputs:)()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t Button.init(action:label:)()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t type metadata accessor for ButtonItemButtonStyle.Role()
{
  return MEMORY[0x24BEAD990]();
}

uint64_t ComponentStack.init(content:)()
{
  return MEMORY[0x24BEADBD0]();
}

uint64_t BinaryButtonView.init(primaryButton:secondaryButton:)()
{
  return MEMORY[0x24BEADCD0]();
}

uint64_t type metadata accessor for BinaryButtonView()
{
  return MEMORY[0x24BEADCE0]();
}

uint64_t dispatch thunk of Context.perform(aceCommand:)()
{
  return MEMORY[0x24BEAE548]();
}

uint64_t dispatch thunk of Context.perform(directInvocation:)()
{
  return MEMORY[0x24BEAE570]();
}

uint64_t type metadata accessor for Context()
{
  return MEMORY[0x24BEAE580]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE34D0]();
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

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x24BEE4A10]();
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

