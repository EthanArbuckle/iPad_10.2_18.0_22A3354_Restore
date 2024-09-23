uint64_t sub_100002E50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t KeyPath;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v25;
  uint64_t v26;

  v26 = a2;
  v3 = type metadata accessor for ColorScheme(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000032C4(&qword_100008040);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000032C4(&qword_100008030);
  __chkstk_darwin();
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1000032C4(&qword_100008068);
  v15 = sub_1000034A8();
  NavigationStack.init<>(root:)(sub_100003468, a1, v14, v15);
  KeyPath = swift_getKeyPath(&unk_100003A68);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for ColorScheme.dark(_:), v3);
  v17 = (uint64_t *)&v13[*(int *)(v11 + 36)];
  v18 = sub_1000032C4(&qword_100008050);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)v17 + *(int *)(v18 + 28), v6, v3);
  *v17 = KeyPath;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v10, v7);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v19 = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v20 = static Color.black.getter(v19);
  v21 = swift_getKeyPath(&unk_100003A98);
  v22 = v26;
  sub_1000035A8((uint64_t)v13, v26);
  v23 = (uint64_t *)(v22 + *(int *)(sub_1000032C4(&qword_100008018) + 36));
  *v23 = v21;
  v23[1] = v20;
  return sub_1000035F0((uint64_t)v13);
}

uint64_t sub_100003050()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100003070(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for ColorScheme(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.colorScheme.setter(v3);
}

uint64_t sub_1000030EC()
{
  uint64_t v0;
  unint64_t v1;

  v0 = sub_1000032C4(&qword_100008018);
  v1 = sub_100003304();
  return LockedCameraCaptureUIScene.init(content:)(sub_100002E50, 0, v0, v1);
}

uint64_t sub_100003138(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100003280();
  return LockedCameraCaptureExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_1000031CC();
  static AppExtension<>.main()();
  return 0;
}

unint64_t sub_1000031CC()
{
  unint64_t result;

  result = qword_100008000;
  if (!qword_100008000)
  {
    result = swift_getWitnessTable(&unk_100003A24, &type metadata for MagnifierExtension);
    atomic_store(result, (unint64_t *)&qword_100008000);
  }
  return result;
}

ValueMetadata *type metadata accessor for MagnifierExtension()
{
  return &type metadata for MagnifierExtension;
}

uint64_t sub_100003224(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100003BE4, 1);
}

unint64_t sub_100003238()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100008008;
  if (!qword_100008008)
  {
    v1 = type metadata accessor for AppExtensionSceneConfiguration(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for AppExtensionSceneConfiguration, v1);
    atomic_store(result, (unint64_t *)&qword_100008008);
  }
  return result;
}

unint64_t sub_100003280()
{
  unint64_t result;

  result = qword_100008010;
  if (!qword_100008010)
  {
    result = swift_getWitnessTable("E\t", &type metadata for MagnifierExtension);
    atomic_store(result, (unint64_t *)&qword_100008010);
  }
  return result;
}

uint64_t sub_1000032C4(uint64_t *a1)
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

unint64_t sub_100003304()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100008020;
  if (!qword_100008020)
  {
    v1 = sub_100003388(&qword_100008018);
    sub_1000033CC();
    sub_10000365C(&qword_100008058, &qword_100008060, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100008020);
  }
  return result;
}

uint64_t sub_100003388(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000033CC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100008028;
  if (!qword_100008028)
  {
    v1 = sub_100003388(&qword_100008030);
    sub_10000365C(&qword_100008038, &qword_100008040, (uint64_t)&protocol conformance descriptor for NavigationStack<A, B>);
    sub_10000365C(&qword_100008048, &qword_100008050, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100008028);
  }
  return result;
}

uint64_t sub_100003468@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = swift_retain(v1);
  v4 = static SafeAreaRegions.all.getter(v3);
  result = static Edge.Set.all.getter();
  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1000034A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100008070;
  if (!qword_100008070)
  {
    v1 = sub_100003388(&qword_100008068);
    sub_100003514();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100008070);
  }
  return result;
}

unint64_t sub_100003514()
{
  unint64_t result;

  result = qword_100008078;
  if (!qword_100008078)
  {
    result = swift_getWitnessTable(&unk_100003B6C, &type metadata for MagnifierExtensionViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_100008078);
  }
  return result;
}

uint64_t sub_100003558@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.tintColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100003580(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.tintColor.setter(v1);
}

uint64_t sub_1000035A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000032C4(&qword_100008030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000035F0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000032C4(&qword_100008030);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100003630()
{
  return sub_10000365C(&qword_100008080, &qword_100008088, (uint64_t)&protocol conformance descriptor for LockedCameraCaptureUIScene<A>);
}

uint64_t sub_10000365C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100003388(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for MagnifierExtensionViewRepresentable()
{
  return &type metadata for MagnifierExtensionViewRepresentable;
}

uint64_t sub_1000036B0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t locked;

  v1 = swift_retain(*v0);
  locked = static CompositionRoot.magnifierLockedCameraCaptureSession.setter(v1);
  return static CompositionRoot.magnifierExtensionViewController.getter(locked);
}

uint64_t sub_1000036D8(uint64_t a1, char a2)
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)(a1, a2 & 1);
}

void *sub_100003710()
{
  return &protocol witness table for Never;
}

uint64_t sub_10000371C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_1000037F8();
  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10000376C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_1000037F8();
  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000037BC()
{
  return static View._viewListCount(inputs:)();
}

void sub_1000037D4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000037F8();
  UIViewControllerRepresentable.body.getter(a1, v2);
  __break(1u);
}

unint64_t sub_1000037F8()
{
  unint64_t result;

  result = qword_100008090;
  if (!qword_100008090)
  {
    result = swift_getWitnessTable(&unk_100003AF4, &type metadata for MagnifierExtensionViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_100008090);
  }
  return result;
}
