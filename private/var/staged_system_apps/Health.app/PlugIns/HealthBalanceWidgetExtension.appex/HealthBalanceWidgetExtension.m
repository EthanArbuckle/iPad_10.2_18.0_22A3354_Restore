uint64_t sub_1000038F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  void (*v25)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = a1;
  sub_100003B70(0);
  v29 = v1;
  ((void (*)(void))__chkstk_darwin)();
  v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for BalanceSevenDaysWidget(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v27 - v9;
  v11 = type metadata accessor for BalanceOneDayWidget(0);
  v28 = *(_QWORD *)(v11 - 8);
  v12 = v28;
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v13);
  v18 = (char *)&v27 - v17;
  v19 = BalanceOneDayWidget.init()(v16);
  BalanceSevenDaysWidget.init()(v19);
  v20 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  v20(v15, v18, v11);
  v21 = v5;
  v22 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v22(v8, v10, v4);
  v20(v3, v15, v11);
  v23 = v29;
  v22(&v3[*(int *)(v29 + 48)], v8, v4);
  TupleWidget.init(_:)(v3, v23);
  v24 = *(void (**)(char *, uint64_t))(v21 + 8);
  v24(v10, v4);
  v25 = *(void (**)(char *, uint64_t))(v28 + 8);
  v25(v18, v11);
  v24(v8, v4);
  return ((uint64_t (*)(char *, uint64_t))v25)(v15, v11);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100003B0C();
  static WidgetBundle.main()();
  return 0;
}

unint64_t sub_100003B0C()
{
  unint64_t result;

  result = qword_100008090;
  if (!qword_100008090)
  {
    result = swift_getWitnessTable(&unk_100003D88, &type metadata for HealthBalanceWidgets);
    atomic_store(result, (unint64_t *)&qword_100008090);
  }
  return result;
}

ValueMetadata *type metadata accessor for HealthBalanceWidgets()
{
  return &type metadata for HealthBalanceWidgets;
}

uint64_t sub_100003B60(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100003E0C, 1);
}

void sub_100003B70(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t TupleTypeMetadata2;
  uint64_t v5;

  if (!qword_100008098)
  {
    v2 = type metadata accessor for BalanceOneDayWidget(255);
    v3 = type metadata accessor for BalanceSevenDaysWidget(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2(a1, v2, v3, 0, 0);
    if (!v5)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_100008098);
  }
}

unint64_t sub_100003BE0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000080A0;
  if (!qword_1000080A0)
  {
    sub_100003C28(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for TupleWidget<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000080A0);
  }
  return result;
}

void sub_100003C28(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000080A8)
  {
    sub_100003B70(255);
    v3 = type metadata accessor for TupleWidget(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000080A8);
  }
}

uint64_t sub_100003C7C()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC28HealthBalanceWidgetExtensionP33_296CCC2E648B09DD6A9437F7AFDAE8F019ResourceBundleClass);
}
