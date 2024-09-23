uint64_t sub_100003AF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  unint64_t v5;
  uint64_t v7;

  v0 = type metadata accessor for MedicationsWidget(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin();
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MedicationsWidget.init()(v2);
  v5 = sub_100003C1C();
  static WidgetBundleBuilder.buildBlock<A>(_:)(v4, v0, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100003BB8();
  static WidgetBundle.main()();
  return 0;
}

unint64_t sub_100003BB8()
{
  unint64_t result;

  result = qword_100008090;
  if (!qword_100008090)
  {
    result = swift_getWitnessTable(&unk_100003D9C, &type metadata for HealthMedicationsWidgets);
    atomic_store(result, (unint64_t *)&qword_100008090);
  }
  return result;
}

ValueMetadata *type metadata accessor for HealthMedicationsWidgets()
{
  return &type metadata for HealthMedicationsWidgets;
}

uint64_t sub_100003C0C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100003E1C, 1);
}

unint64_t sub_100003C1C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100008098;
  if (!qword_100008098)
  {
    v1 = type metadata accessor for MedicationsWidget(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for MedicationsWidget, v1);
    atomic_store(result, (unint64_t *)&qword_100008098);
  }
  return result;
}

uint64_t sub_100003C64()
{
  _QWORD v1[2];

  v1[0] = type metadata accessor for MedicationsWidget(255);
  v1[1] = sub_100003C1C();
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of static WidgetBundleBuilder.buildBlock<A>(_:)>>, 1);
}

uint64_t sub_100003CAC()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC32HealthMedicationsWidgetExtensionP33_60DC41D7AF85C04601494A44A5D0A48F19ResourceBundleClass);
}
