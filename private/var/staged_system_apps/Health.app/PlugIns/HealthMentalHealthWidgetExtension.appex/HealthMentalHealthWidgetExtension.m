uint64_t sub_100003AE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  unint64_t v5;
  uint64_t v7;

  v0 = type metadata accessor for MentalHealthLauncherComplication(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin();
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MentalHealthLauncherComplication.init()(v2);
  v5 = sub_100003C0C();
  static WidgetBundleBuilder.buildBlock<A>(_:)(v4, v0, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100003BA8();
  static WidgetBundle.main()();
  return 0;
}

unint64_t sub_100003BA8()
{
  unint64_t result;

  result = qword_100008090;
  if (!qword_100008090)
  {
    result = swift_getWitnessTable(&unk_100003D8C, &type metadata for HealthMentalHealthWidget);
    atomic_store(result, (unint64_t *)&qword_100008090);
  }
  return result;
}

ValueMetadata *type metadata accessor for HealthMentalHealthWidget()
{
  return &type metadata for HealthMentalHealthWidget;
}

uint64_t sub_100003BFC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100003E0C, 1);
}

unint64_t sub_100003C0C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100008098;
  if (!qword_100008098)
  {
    v1 = type metadata accessor for MentalHealthLauncherComplication(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for MentalHealthLauncherComplication, v1);
    atomic_store(result, (unint64_t *)&qword_100008098);
  }
  return result;
}

uint64_t sub_100003C54()
{
  _QWORD v1[2];

  v1[0] = type metadata accessor for MentalHealthLauncherComplication(255);
  v1[1] = sub_100003C0C();
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of static WidgetBundleBuilder.buildBlock<A>(_:)>>, 1);
}

uint64_t sub_100003C9C()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC33HealthMentalHealthWidgetExtensionP33_430CBA5CFED394E6E8A18F68B9D3036519ResourceBundleClass);
}
