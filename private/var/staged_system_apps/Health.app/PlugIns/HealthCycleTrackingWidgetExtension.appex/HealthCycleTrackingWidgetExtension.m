uint64_t sub_100003C0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  unint64_t v5;
  uint64_t v7;

  v0 = type metadata accessor for MenstrualCyclesWidget(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin();
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MenstrualCyclesWidget.init()(v2);
  v5 = sub_100003D34();
  static WidgetBundleBuilder.buildBlock<A>(_:)(v4, v0, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100003CD0();
  static WidgetBundle.main()();
  return 0;
}

unint64_t sub_100003CD0()
{
  unint64_t result;

  result = qword_100008000;
  if (!qword_100008000)
  {
    result = swift_getWitnessTable(&unk_100003E6C, &type metadata for HealthCycleTrackingWidgets);
    atomic_store(result, (unint64_t *)&qword_100008000);
  }
  return result;
}

ValueMetadata *type metadata accessor for HealthCycleTrackingWidgets()
{
  return &type metadata for HealthCycleTrackingWidgets;
}

uint64_t sub_100003D24(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100003ED8, 1);
}

unint64_t sub_100003D34()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100008008;
  if (!qword_100008008)
  {
    v1 = type metadata accessor for MenstrualCyclesWidget(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for MenstrualCyclesWidget, v1);
    atomic_store(result, (unint64_t *)&qword_100008008);
  }
  return result;
}

uint64_t sub_100003D7C()
{
  _QWORD v1[2];

  v1[0] = type metadata accessor for MenstrualCyclesWidget(255);
  v1[1] = sub_100003D34();
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of static WidgetBundleBuilder.buildBlock<A>(_:)>>, 1);
}
