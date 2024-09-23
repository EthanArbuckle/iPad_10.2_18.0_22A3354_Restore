unint64_t PropertyType.init(rawValue:)(unint64_t result)
{
  if (result > 2)
    return 0;
  return result;
}

BOOL sub_3F28(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_3F3C()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_3F80()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_3FA8(uint64_t a1)
{
  Swift::UInt *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t *sub_3FE8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;

  v2 = *result;
  v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

void sub_4004(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t BasePropertyConfiguration.eventName.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + OBJC_IVAR___BMBasePropertyConfiguration_eventName);
  swift_bridgeObjectRetain(*(_QWORD *)(v2 + OBJC_IVAR___BMBasePropertyConfiguration_eventName + 8), a2);
  return v3;
}

uint64_t BasePropertyConfiguration.recordType.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___BMBasePropertyConfiguration_recordType);
}

uint64_t BasePropertyConfiguration.ageToExpire.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire);
}

uint64_t BasePropertyConfiguration.countLimit.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___BMBasePropertyConfiguration_countLimit);
}

uint64_t BasePropertyConfiguration.identifier.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + OBJC_IVAR___BMBasePropertyConfiguration_identifier);
  swift_bridgeObjectRetain(*(_QWORD *)(v2 + OBJC_IVAR___BMBasePropertyConfiguration_identifier + 8), a2);
  return v3;
}

uint64_t BasePropertyConfiguration.shouldBeCached.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached);
}

uint64_t BasePropertyConfiguration.shouldBeSynced.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced);
}

id BasePropertyConfiguration.__allocating_init(eventName:recordType:identifier:ageToExpire:countLimit:shouldBeCached:shouldBeSynced:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, char a9)
{
  objc_class *v9;
  _BYTE *v18;
  _QWORD *v19;
  _QWORD *v20;
  objc_super v22;

  v18 = objc_allocWithZone(v9);
  v19 = &v18[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
  *v19 = a1;
  v19[1] = a2;
  *(_QWORD *)&v18[OBJC_IVAR___BMBasePropertyConfiguration_recordType] = a3;
  v20 = &v18[OBJC_IVAR___BMBasePropertyConfiguration_identifier];
  *v20 = a4;
  v20[1] = a5;
  *(_QWORD *)&v18[OBJC_IVAR___BMBasePropertyConfiguration_countLimit] = a7;
  *(_QWORD *)&v18[OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire] = a6;
  v18[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached] = a8;
  v18[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced] = a9;
  v22.receiver = v18;
  v22.super_class = v9;
  return objc_msgSendSuper2(&v22, "init");
}

id BasePropertyConfiguration.init(eventName:recordType:identifier:ageToExpire:countLimit:shouldBeCached:shouldBeSynced:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, char a9)
{
  _BYTE *v9;
  _QWORD *v10;
  _QWORD *v11;
  objc_super v13;

  v10 = &v9[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
  *v10 = a1;
  v10[1] = a2;
  *(_QWORD *)&v9[OBJC_IVAR___BMBasePropertyConfiguration_recordType] = a3;
  v11 = &v9[OBJC_IVAR___BMBasePropertyConfiguration_identifier];
  *v11 = a4;
  v11[1] = a5;
  *(_QWORD *)&v9[OBJC_IVAR___BMBasePropertyConfiguration_countLimit] = a7;
  *(_QWORD *)&v9[OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire] = a6;
  v9[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached] = a8;
  v9[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced] = a9;
  v13.receiver = v9;
  v13.super_class = (Class)type metadata accessor for BasePropertyConfiguration();
  return objc_msgSendSuper2(&v13, "init");
}

uint64_t type metadata accessor for BasePropertyConfiguration()
{
  return objc_opt_self(BMBasePropertyConfiguration);
}

uint64_t sub_4344(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  _QWORD *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char v13;
  char v14;
  char v15;
  char *v17;
  _BYTE v18[24];
  uint64_t v19;

  sub_44A8(a1, (uint64_t)v18);
  if (!v19)
  {
    sub_4530((uint64_t)v18);
    goto LABEL_20;
  }
  v2 = type metadata accessor for BasePropertyConfiguration();
  if ((swift_dynamicCast(&v17, v18, (char *)&type metadata for Any + 8, v2, 6) & 1) == 0)
  {
LABEL_20:
    v15 = 0;
    return v15 & 1;
  }
  v3 = v17;
  v4 = *(_QWORD *)(v1 + OBJC_IVAR___BMBasePropertyConfiguration_eventName);
  v5 = *(_QWORD *)(v1 + OBJC_IVAR___BMBasePropertyConfiguration_eventName + 8);
  v6 = *(_QWORD *)&v17[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
  v7 = *(_QWORD *)&v17[OBJC_IVAR___BMBasePropertyConfiguration_eventName + 8];
  v8 = v4 == v6 && v5 == v7;
  if (!v8 && (_stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, v6, v7, 0) & 1) == 0
    || *(_QWORD *)(v1 + OBJC_IVAR___BMBasePropertyConfiguration_recordType) != *(_QWORD *)&v3[OBJC_IVAR___BMBasePropertyConfiguration_recordType]
    || *(_QWORD *)(v1 + OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire) != *(_QWORD *)&v3[OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire]
    || *(_QWORD *)(v1 + OBJC_IVAR___BMBasePropertyConfiguration_countLimit) != *(_QWORD *)&v3[OBJC_IVAR___BMBasePropertyConfiguration_countLimit])
  {
    goto LABEL_19;
  }
  v9 = (_QWORD *)(v1 + OBJC_IVAR___BMBasePropertyConfiguration_identifier);
  v10 = *(_QWORD *)(v1 + OBJC_IVAR___BMBasePropertyConfiguration_identifier + 8);
  v11 = &v3[OBJC_IVAR___BMBasePropertyConfiguration_identifier];
  v12 = *(_QWORD *)&v3[OBJC_IVAR___BMBasePropertyConfiguration_identifier + 8];
  if (v10)
  {
    if (v12
      && (*v9 == *(_QWORD *)v11 && v10 == v12
       || (_stringCompareWithSmolCheck(_:_:expecting:)(*v9, v10, *(_QWORD *)v11, v12, 0) & 1) != 0))
    {
      goto LABEL_16;
    }
    goto LABEL_19;
  }
  if (v12)
  {
LABEL_19:

    goto LABEL_20;
  }
LABEL_16:
  v13 = *(_BYTE *)(v1 + OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced);
  v14 = v3[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced];

  v15 = v13 ^ v14 ^ 1;
  return v15 & 1;
}

uint64_t sub_44A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_44F0(&qword_3E6E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_44F0(uint64_t *a1)
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

uint64_t sub_4530(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_44F0(&qword_3E6E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_45E4()
{
  void *v0;

  return v0;
}

id BaseDonor.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

void BasePropertyConfiguration.init()()
{
  _swift_stdlib_reportUnimplementedInitializer("EngagementCollector.BasePropertyConfiguration", 45, "init()", 6, 0);
  __break(1u);
}

id BasePropertyConfiguration.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BasePropertyConfiguration();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id CounterPropertyConfiguration.__allocating_init(eventName:ageToExpire:shouldBeCached:shouldBeSynced:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  objc_class *v5;
  _BYTE *v11;
  _QWORD *v12;
  _QWORD *v13;
  objc_super v15;

  v11 = objc_allocWithZone(v5);
  v12 = &v11[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
  *v12 = a1;
  v12[1] = a2;
  *(_QWORD *)&v11[OBJC_IVAR___BMBasePropertyConfiguration_recordType] = 0;
  v13 = &v11[OBJC_IVAR___BMBasePropertyConfiguration_identifier];
  *v13 = 0;
  v13[1] = 0;
  *(_QWORD *)&v11[OBJC_IVAR___BMBasePropertyConfiguration_countLimit] = 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)&v11[OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire] = a3;
  v11[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached] = a4;
  v11[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced] = a5;
  v15.receiver = v11;
  v15.super_class = (Class)type metadata accessor for BasePropertyConfiguration();
  return objc_msgSendSuper2(&v15, "init");
}

id CounterPropertyConfiguration.init(eventName:ageToExpire:shouldBeCached:shouldBeSynced:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  _BYTE *v5;
  _QWORD *v6;
  _QWORD *v7;
  objc_super v9;

  v6 = &v5[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
  *v6 = a1;
  v6[1] = a2;
  *(_QWORD *)&v5[OBJC_IVAR___BMBasePropertyConfiguration_recordType] = 0;
  v7 = &v5[OBJC_IVAR___BMBasePropertyConfiguration_identifier];
  *v7 = 0;
  v7[1] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___BMBasePropertyConfiguration_countLimit] = 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)&v5[OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire] = a3;
  v5[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached] = a4;
  v5[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced] = a5;
  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for BasePropertyConfiguration();
  return objc_msgSendSuper2(&v9, "init");
}

void CounterPropertyConfiguration.init(eventName:recordType:identifier:ageToExpire:countLimit:shouldBeCached:shouldBeSynced:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;

  LOBYTE(v9) = a9;
  sub_4B8C(a1, a2, a3, a4, a5, a6, a7, a8, v9, (uint64_t)"EngagementCollector.CounterPropertyConfiguration", 0x30u);
}

id StatePropertyConfiguration.__allocating_init(eventName:ageToExpire:shouldBeCached:shouldBeSynced:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  objc_class *v5;
  _BYTE *v11;
  _QWORD *v12;
  _QWORD *v13;
  objc_super v15;

  v11 = objc_allocWithZone(v5);
  v12 = &v11[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
  *v12 = a1;
  v12[1] = a2;
  *(_QWORD *)&v11[OBJC_IVAR___BMBasePropertyConfiguration_recordType] = 1;
  v13 = &v11[OBJC_IVAR___BMBasePropertyConfiguration_identifier];
  *v13 = 0;
  v13[1] = 0;
  *(_QWORD *)&v11[OBJC_IVAR___BMBasePropertyConfiguration_countLimit] = 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)&v11[OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire] = a3;
  v11[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached] = a4;
  v11[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced] = a5;
  v15.receiver = v11;
  v15.super_class = (Class)type metadata accessor for BasePropertyConfiguration();
  return objc_msgSendSuper2(&v15, "init");
}

id StatePropertyConfiguration.init(eventName:ageToExpire:shouldBeCached:shouldBeSynced:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  _BYTE *v5;
  _QWORD *v6;
  _QWORD *v7;
  objc_super v9;

  v6 = &v5[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
  *v6 = a1;
  v6[1] = a2;
  *(_QWORD *)&v5[OBJC_IVAR___BMBasePropertyConfiguration_recordType] = 1;
  v7 = &v5[OBJC_IVAR___BMBasePropertyConfiguration_identifier];
  *v7 = 0;
  v7[1] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___BMBasePropertyConfiguration_countLimit] = 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)&v5[OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire] = a3;
  v5[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached] = a4;
  v5[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced] = a5;
  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for BasePropertyConfiguration();
  return objc_msgSendSuper2(&v9, "init");
}

void StatePropertyConfiguration.init(eventName:recordType:identifier:ageToExpire:countLimit:shouldBeCached:shouldBeSynced:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;

  LOBYTE(v9) = a9;
  sub_4B8C(a1, a2, a3, a4, a5, a6, a7, a8, v9, (uint64_t)"EngagementCollector.StatePropertyConfiguration", 0x2Eu);
}

id CollectionPropertyConfiguration.__allocating_init(eventName:identifier:ageToExpire:countLimit:shouldBeCached:shouldBeSynced:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, char a8)
{
  objc_class *v8;
  _BYTE *v17;
  _QWORD *v18;
  _QWORD *v19;
  objc_super v21;

  v17 = objc_allocWithZone(v8);
  v18 = &v17[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
  *v18 = a1;
  v18[1] = a2;
  *(_QWORD *)&v17[OBJC_IVAR___BMBasePropertyConfiguration_recordType] = 2;
  v19 = &v17[OBJC_IVAR___BMBasePropertyConfiguration_identifier];
  *v19 = a3;
  v19[1] = a4;
  *(_QWORD *)&v17[OBJC_IVAR___BMBasePropertyConfiguration_countLimit] = a6;
  *(_QWORD *)&v17[OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire] = a5;
  v17[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached] = a7;
  v17[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced] = a8;
  v21.receiver = v17;
  v21.super_class = (Class)type metadata accessor for BasePropertyConfiguration();
  return objc_msgSendSuper2(&v21, "init");
}

id CollectionPropertyConfiguration.init(eventName:identifier:ageToExpire:countLimit:shouldBeCached:shouldBeSynced:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, char a8)
{
  _BYTE *v8;
  _QWORD *v9;
  _QWORD *v10;
  objc_super v12;

  v9 = &v8[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
  *v9 = a1;
  v9[1] = a2;
  *(_QWORD *)&v8[OBJC_IVAR___BMBasePropertyConfiguration_recordType] = 2;
  v10 = &v8[OBJC_IVAR___BMBasePropertyConfiguration_identifier];
  *v10 = a3;
  v10[1] = a4;
  *(_QWORD *)&v8[OBJC_IVAR___BMBasePropertyConfiguration_countLimit] = a6;
  *(_QWORD *)&v8[OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire] = a5;
  v8[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached] = a7;
  v8[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced] = a8;
  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for BasePropertyConfiguration();
  return objc_msgSendSuper2(&v12, "init");
}

void CollectionPropertyConfiguration.init(eventName:recordType:identifier:ageToExpire:countLimit:shouldBeCached:shouldBeSynced:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;

  LOBYTE(v9) = a9;
  sub_4B8C(a1, a2, a3, a4, a5, a6, a7, a8, v9, (uint64_t)"EngagementCollector.CollectionPropertyConfiguration", 0x33u);
}

void sub_4B8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned int a11)
{
  _swift_stdlib_reportUnimplementedInitializer(a10, a11, "init(eventName:recordType:identifier:ageToExpire:countLimit:shouldBeCached:shouldBeSynced:)", 91, 0);
  __break(1u);
}

id _s19EngagementCollector31CollectionPropertyConfigurationCfD_0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

unint64_t sub_4BEC()
{
  unint64_t result;

  result = qword_3E6E8;
  if (!qword_3E6E8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for PropertyType, &type metadata for PropertyType);
    atomic_store(result, (unint64_t *)&qword_3E6E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for PropertyType()
{
  return &type metadata for PropertyType;
}

uint64_t method lookup function for BasePropertyConfiguration(uint64_t a1, uint64_t a2)
{
  return swift_lookUpClassMethod(a1, a2, &nominal type descriptor for BasePropertyConfiguration);
}

uint64_t dispatch thunk of BasePropertyConfiguration.__allocating_init(eventName:recordType:identifier:ageToExpire:countLimit:shouldBeCached:shouldBeSynced:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of BasePropertyConfiguration.toBaseConfiguration()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((char *)&stru_68.size + (swift_isaMask & *v0)))();
}

uint64_t type metadata accessor for CounterPropertyConfiguration()
{
  return objc_opt_self(BMCounterPropertyConfiguration);
}

uint64_t method lookup function for CounterPropertyConfiguration(uint64_t a1, uint64_t a2)
{
  return swift_lookUpClassMethod(a1, a2, &nominal type descriptor for CounterPropertyConfiguration);
}

uint64_t type metadata accessor for StatePropertyConfiguration()
{
  return objc_opt_self(BMStatePropertyConfiguration);
}

uint64_t method lookup function for StatePropertyConfiguration(uint64_t a1, uint64_t a2)
{
  return swift_lookUpClassMethod(a1, a2, &nominal type descriptor for StatePropertyConfiguration);
}

uint64_t dispatch thunk of StatePropertyConfiguration.__allocating_init(eventName:ageToExpire:shouldBeCached:shouldBeSynced:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t type metadata accessor for CollectionPropertyConfiguration()
{
  return objc_opt_self(BMCollectionPropertyConfiguration);
}

uint64_t method lookup function for CollectionPropertyConfiguration(uint64_t a1, uint64_t a2)
{
  return swift_lookUpClassMethod(a1, a2, &nominal type descriptor for CollectionPropertyConfiguration);
}

uint64_t dispatch thunk of CollectionPropertyConfiguration.__allocating_init(eventName:identifier:ageToExpire:countLimit:shouldBeCached:shouldBeSynced:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

void type metadata accessor for os_unfair_lock_s()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_3E850)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_38D50);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_3E850);
  }
}

BOOL static PropertyError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void PropertyError.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int PropertyError.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int sub_4DE8(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_4E38@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(*a1, "createdAt");
  if (v3)
  {
    v4 = v3;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    v5 = type metadata accessor for Date(0);
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 0;
  }
  else
  {
    v5 = ((uint64_t (*)(void))type metadata accessor for Date)();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

void sub_4EBC(uint64_t a1, void **a2)
{
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  Class isa;
  uint64_t v10;

  sub_44F0(&qword_3EAD0);
  __chkstk_darwin();
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_D9B4(a1, (uint64_t)v5, &qword_3EAD0);
  v6 = *a2;
  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  objc_msgSend(v6, "setCreatedAt:", isa);

}

void sub_4FA0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_msgSend(*a1, "data");
  if (v3)
  {
    v4 = v3;
    v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0xF000000000000000;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_5004(uint64_t a1, void **a2)
{
  void *v2;
  Class isa;
  Class v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8) >> 60 == 15)
    isa = 0;
  else
    isa = Data._bridgeToObjectiveC()().super.isa;
  v4 = isa;
  objc_msgSend(v2, "setData:");

}

void sub_5068(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = objc_msgSend(*a1, *a2);
  if (v4)
  {
    v5 = v4;
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  *a3 = v6;
  a3[1] = v8;
}

void sub_50C8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  void *v6;
  NSString v7;
  id v8;

  v6 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v7 = String._bridgeToObjectiveC()();
  else
    v7 = 0;
  v8 = v7;
  objc_msgSend(v6, *a5);

}

id CDCloudSyncVersions.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

id CDProperty.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for CDProperty();
  v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for CDProperty()
{
  return objc_opt_self(BMCDProperty);
}

id CDProperty.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CDProperty();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_527C@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for CDProperty();
  result = Identifiable<>.id.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t CDProperty.SpecialPlistKeys.init(rawValue:)@<X0>(Swift::String string@<0:X0, 8:X1>, BOOL *a2@<X8>)
{
  void *object;
  Swift::String v3;
  Swift::Int v5;
  uint64_t result;

  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_38BA0, v3);
  result = swift_bridgeObjectRelease(object);
  *a2 = v5 != 0;
  return result;
}

uint64_t CDProperty.SpecialPlistKeys.rawValue.getter()
{
  return 0x44497465737361;
}

uint64_t static CDMutableCloudSyncVersions.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Int sub_532C()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  String.hash(into:)(v1, 0x44497465737361, 0xE700000000000000);
  return Hasher._finalize()();
}

uint64_t sub_537C(uint64_t a1)
{
  return String.hash(into:)(a1, 0x44497465737361, 0xE700000000000000);
}

Swift::Int sub_5394(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  String.hash(into:)(v2, 0x44497465737361, 0xE700000000000000);
  return Hasher._finalize()();
}

uint64_t sub_53E0@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_38BD8, v3);
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

void sub_5430(_QWORD *a1@<X8>)
{
  *a1 = 0x44497465737361;
  a1[1] = 0xE700000000000000;
}

uint64_t static CDProperty.fetchState(_:context:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_626C(a1, a2, a3, a4, a5, (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))sub_5458);
}

void sub_5458(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *))
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int16 v27;

  if ((a2 & 1) != 0)
  {
    v24 = a1;
    v25 = 0u;
    v26 = 0u;
    v27 = 256;
    swift_errorRetain(a1);
    a3(&v24);
    sub_DA68(a1, 1);
    return;
  }
  if (!((unint64_t)a1 >> 62))
  {
    v5 = *(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain(a1, a2);
    if (v5)
      goto LABEL_4;
LABEL_18:
    sub_DA68(a1, 0);
    v20 = sub_AD90();
    v21 = swift_allocError(&type metadata for PropertyError, v20, 0, 0);
    *v22 = 1;
    v24 = v21;
    v25 = 0u;
    v26 = 0u;
    v27 = 256;
    a3(&v24);
    swift_errorRelease(v21);
    return;
  }
  if (a1 >= 0)
    v19 = a1 & 0xFFFFFFFFFFFFFF8;
  else
    v19 = a1;
  swift_bridgeObjectRetain(a1, a2);
  if (!_CocoaArrayWrapper.endIndex.getter(v19))
    goto LABEL_18;
LABEL_4:
  if ((a1 & 0xC000000000000001) != 0)
  {
    v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a1);
  }
  else
  {
    if (!*(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
      return;
    }
    v6 = *(id *)(a1 + 32);
  }
  v23 = v6;
  sub_DA68(a1, 0);
  v7 = sub_74CC();
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v23, "identifier");
    if (v9)
    {
      v11 = v9;
      v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);
      v14 = v13;

    }
    else
    {
      v12 = 0;
      v14 = 0;
    }
    v18 = sub_77B0(v8, v10);
    swift_bridgeObjectRelease(v8);
    v24 = v12;
    *(_QWORD *)&v25 = v14;
    v26 = 0uLL;
    *((_QWORD *)&v25 + 1) = v18;
    v27 = 1;
    a3(&v24);

    swift_bridgeObjectRelease(v18);
    swift_bridgeObjectRelease(v14);
  }
  else
  {
    v15 = sub_AD90();
    v16 = swift_allocError(&type metadata for PropertyError, v15, 0, 0);
    *v17 = 0;
    v24 = v16;
    v25 = 0u;
    v26 = 0u;
    v27 = 256;
    a3(&v24);
    swift_errorRelease(v16);

  }
}

uint64_t static CDProperty.fetchCollectionValues(_:assetIDs:sortByCreatedAt:limit:context:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t), uint64_t a8)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSString v19;
  Class isa;
  id v21;

  v16 = sub_44F0(&qword_3E8C0);
  v17 = swift_allocObject(v16, 96, 7);
  *(_OWORD *)(v17 + 16) = xmmword_31630;
  *(_QWORD *)(v17 + 32) = 7955819;
  *(_QWORD *)(v17 + 40) = 0xE300000000000000;
  *(_QWORD *)(v17 + 88) = &type metadata for String;
  *(_QWORD *)(v17 + 56) = &type metadata for String;
  *(_QWORD *)(v17 + 64) = a1;
  *(_QWORD *)(v17 + 72) = a2;
  swift_retain_n(a8, 2);
  swift_bridgeObjectRetain(a2, v18);
  v19 = String._bridgeToObjectiveC()();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v17);
  v21 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v19, isa);

  sub_8428(v21, 0, 0, a3, a4, a5, a6, a7, a8);
  return swift_release_n(a8, 2);
}

uint64_t sub_5838(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  Class isa;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  id v56[4];

  if ((a2 & 1) != 0)
  {
    swift_errorRetain(a1);
    a3(a1, 1);
    return sub_DA68(a1, 1);
  }
  if ((unint64_t)a1 >> 62)
  {
    if (a1 >= 0)
      v51 = a1 & 0xFFFFFFFFFFFFFF8;
    else
      v51 = a1;
    swift_bridgeObjectRetain(a1, a2);
    v7 = _CocoaArrayWrapper.endIndex.getter(v51);
    if (v7)
      goto LABEL_4;
  }
  else
  {
    v7 = *(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain(a1, a2);
    if (v7)
    {
LABEL_4:
      if (v7 < 1)
        __break(1u);
      v52 = a4;
      v53 = a3;
      v8 = 0;
      v9 = (char *)&_swiftEmptyArrayStorage;
      v54 = v7;
      do
      {
        if ((a1 & 0xC000000000000001) != 0)
          v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8, a1);
        else
          v10 = *(id *)(a1 + 8 * v8 + 32);
        v11 = v10;
        v12 = objc_msgSend(v10, "data", v52, v53);
        if (v12)
        {
          v13 = v12;
          v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v16 = v15;

          v17 = (void *)objc_opt_self(NSJSONSerialization);
          isa = Data._bridgeToObjectiveC()().super.isa;
          v56[0] = 0;
          v19 = objc_msgSend(v17, "JSONObjectWithData:options:error:", isa, 0, v56);

          v20 = v56[0];
          if (v19)
          {
            v21 = v56[0];
            _bridgeAnyObjectToAny(_:)(v56, v19);
            swift_unknownObjectRelease(v19);
            v22 = sub_44F0(&qword_3E980);
            if ((swift_dynamicCast(&v55, v56, (char *)&type metadata for Any + 8, v22, 6) & 1) != 0)
            {
              sub_DA88(v14, v16);
              v23 = v55;
              v24 = objc_msgSend(v11, "identifier");
              if (v24)
              {
                v26 = v24;
                v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24, v25);
                v29 = v28;

              }
              else
              {
                v27 = 0;
                v29 = 0;
              }
              v40 = objc_msgSend(v11, "assetID");
              if (v40)
              {
                v42 = v40;
                v43 = static String._unconditionallyBridgeFromObjectiveC(_:)(v40, v41);
                v45 = v44;

              }
              else
              {
                v43 = 0;
                v45 = 0;
              }
              v46 = sub_77B0(v23, v41);

              swift_bridgeObjectRelease(v23);
              if ((swift_isUniquelyReferenced_nonNull_native(v9) & 1) == 0)
                v9 = sub_23898(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
              v48 = *((_QWORD *)v9 + 2);
              v47 = *((_QWORD *)v9 + 3);
              if (v48 >= v47 >> 1)
                v9 = sub_23898((char *)(v47 > 1), v48 + 1, 1, v9);
              *((_QWORD *)v9 + 2) = v48 + 1;
              v49 = &v9[48 * v48];
              *((_QWORD *)v49 + 4) = v27;
              *((_QWORD *)v49 + 5) = v29;
              *((_QWORD *)v49 + 6) = v43;
              *((_QWORD *)v49 + 7) = v45;
              *((_QWORD *)v49 + 8) = v46;
              v49[72] = 2;
              v7 = v54;
            }
            else
            {
              if (qword_3E6A0 != -1)
                swift_once(&qword_3E6A0, sub_10B64);
              v36 = type metadata accessor for Logger(0);
              sub_AD78(v36, (uint64_t)qword_3FA80);
              v37 = Logger.logObject.getter();
              v38 = static os_log_type_t.error.getter();
              if (os_log_type_enabled(v37, v38))
              {
                v39 = (uint8_t *)swift_slowAlloc(2, -1);
                *(_WORD *)v39 = 0;
                _os_log_impl(&dword_0, v37, v38, "Tried to convert a Property to a StatePropertyValue but data can't be deserialized to a valid state value", v39, 2u);
                swift_slowDealloc(v39, -1, -1);
              }
              sub_DA88(v14, v16);

            }
          }
          else
          {
            v34 = v56[0];
            v35 = _convertNSErrorToError(_:)(v20);

            swift_willThrow();
            sub_DA88(v14, v16);
            swift_errorRelease(v35);

          }
        }
        else
        {
          if (qword_3E6A0 != -1)
            swift_once(&qword_3E6A0, sub_10B64);
          v30 = type metadata accessor for Logger(0);
          sub_AD78(v30, (uint64_t)qword_3FA80);
          v31 = Logger.logObject.getter();
          v32 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v31, v32))
          {
            v33 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v33 = 0;
            _os_log_impl(&dword_0, v31, v32, "Tried to convert a Property to a StatePropertyValue without data", v33, 2u);
            swift_slowDealloc(v33, -1, -1);
          }

        }
        ++v8;
      }
      while (v7 != v8);
      sub_DA68(a1, 0);
      v53((uint64_t)v9, 0);
      return swift_bridgeObjectRelease(v9);
    }
  }
  sub_DA68(a1, 0);
  v9 = (char *)&_swiftEmptyArrayStorage;
  a3((uint64_t)&_swiftEmptyArrayStorage, 0);
  return swift_bridgeObjectRelease(v9);
}

uint64_t sub_5D84@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t result;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  result = sub_74CC();
  if (result)
  {
    v4 = result;
    v5 = objc_msgSend(v1, "identifier");
    if (v5)
    {
      v7 = v5;
      v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);
      v10 = v9;

    }
    else
    {
      v8 = 0;
      v10 = 0;
    }
    v15 = objc_msgSend(v1, "assetID");
    if (v15)
    {
      v17 = v15;
      v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15, v16);
      v12 = v18;

    }
    else
    {
      v11 = 0;
      v12 = 0;
    }
    v13 = sub_77B0(v4, v16);
    result = swift_bridgeObjectRelease(v4);
    v14 = 2;
  }
  else
  {
    v8 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = -1;
  }
  *(_QWORD *)a1 = v8;
  *(_QWORD *)(a1 + 8) = v10;
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(a1 + 24) = v12;
  *(_QWORD *)(a1 + 32) = v13;
  *(_BYTE *)(a1 + 40) = v14;
  return result;
}

uint64_t static CDProperty.fetchCollectionValue(_:identifier:assetIDs:context:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSString v19;
  Class isa;
  id v21;

  v16 = sub_44F0(&qword_3E8C0);
  v17 = swift_allocObject(v16, 96, 7);
  *(_OWORD *)(v17 + 16) = xmmword_31630;
  *(_QWORD *)(v17 + 32) = 7955819;
  *(_QWORD *)(v17 + 40) = 0xE300000000000000;
  *(_QWORD *)(v17 + 88) = &type metadata for String;
  *(_QWORD *)(v17 + 56) = &type metadata for String;
  *(_QWORD *)(v17 + 64) = a1;
  *(_QWORD *)(v17 + 72) = a2;
  swift_retain_n(a8, 2);
  swift_bridgeObjectRetain(a2, v18);
  v19 = String._bridgeToObjectiveC()();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v17);
  v21 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v19, isa);

  sub_8C1C(v21, a3, a4, a5, 0, 1, a6, a7, a8, (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))sub_5FF4);
  return swift_release_n(a8, 2);
}

uint64_t sub_5FF4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *))
{
  uint64_t v5;
  uint64_t result;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int16 v28;

  if ((a2 & 1) != 0)
  {
    v25 = a1;
    v26 = 0u;
    v27 = 0u;
    v28 = 256;
    swift_errorRetain(a1);
    a3(&v25);
    return sub_DA68(a1, 1);
  }
  if ((unint64_t)a1 >> 62)
  {
    if (a1 >= 0)
      v21 = a1 & 0xFFFFFFFFFFFFFF8;
    else
      v21 = a1;
    swift_bridgeObjectRetain(a1, a2);
    result = _CocoaArrayWrapper.endIndex.getter(v21);
    if (result)
      goto LABEL_4;
LABEL_18:
    sub_DA68(a1, 0);
    v22 = sub_AD90();
    v23 = swift_allocError(&type metadata for PropertyError, v22, 0, 0);
    *v24 = 1;
    v25 = v23;
    v26 = 0u;
    v27 = 0u;
    v28 = 256;
    a3(&v25);
    return swift_errorRelease(v23);
  }
  v5 = *(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  result = swift_bridgeObjectRetain(a1, a2);
  if (!v5)
    goto LABEL_18;
LABEL_4:
  if ((a1 & 0xC000000000000001) != 0)
  {
    v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a1);
  }
  else
  {
    if (!*(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
      return result;
    }
    v7 = *(id *)(a1 + 32);
  }
  v8 = v7;
  sub_DA68(a1, 0);
  v9 = sub_74CC();
  if (v9)
  {
    v10 = v9;
    v11 = objc_msgSend(v8, "identifier");
    if (v11)
    {
      v13 = v11;
      v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11, v12);
      v16 = v15;

    }
    else
    {
      v14 = 0;
      v16 = 0;
    }
    v20 = sub_77B0(v10, v12);
    swift_bridgeObjectRelease(v10);
    v25 = v14;
    *(_QWORD *)&v26 = v16;
    v27 = 0uLL;
    *((_QWORD *)&v26 + 1) = v20;
    v28 = 1;
    a3(&v25);
    swift_bridgeObjectRelease(v20);

    return swift_bridgeObjectRelease(v16);
  }
  else
  {
    v17 = sub_AD90();
    v18 = swift_allocError(&type metadata for PropertyError, v17, 0, 0);
    *v19 = 0;
    v25 = v18;
    v26 = 0u;
    v27 = 0u;
    v28 = 256;
    a3(&v25);

    return swift_errorRelease(v18);
  }
}

uint64_t static CDProperty.fetchCounter(_:context:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_626C(a1, a2, a3, a4, a5, (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))sub_63C4);
}

uint64_t sub_626C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, _QWORD, uint64_t, uint64_t))
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString v15;
  Class isa;
  id v17;

  v12 = sub_44F0(&qword_3E8C0);
  v13 = swift_allocObject(v12, 96, 7);
  *(_OWORD *)(v13 + 16) = xmmword_31630;
  *(_QWORD *)(v13 + 32) = 7955819;
  *(_QWORD *)(v13 + 40) = 0xE300000000000000;
  *(_QWORD *)(v13 + 88) = &type metadata for String;
  *(_QWORD *)(v13 + 56) = &type metadata for String;
  *(_QWORD *)(v13 + 64) = a1;
  *(_QWORD *)(v13 + 72) = a2;
  swift_retain_n(a5, 2);
  swift_bridgeObjectRetain(a2, v14);
  v15 = String._bridgeToObjectiveC()();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13);
  v17 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v15, isa);

  sub_8C1C(v17, 0, 0, 0, 0, 1, a3, a4, a5, a6);
  return swift_release_n(a5, 2);
}

void sub_63C4(uint64_t a1, uint64_t a2, void (*a3)(id *))
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int16 v15;

  if ((a2 & 1) != 0)
  {
    v12 = (id)a1;
    v13 = 0u;
    v14 = 0u;
    v15 = 256;
    swift_errorRetain(a1);
    a3(&v12);
    sub_DA68(a1, 1);
    return;
  }
  if ((unint64_t)a1 >> 62)
  {
    if (a1 >= 0)
      v7 = a1 & 0xFFFFFFFFFFFFFF8;
    else
      v7 = a1;
    swift_bridgeObjectRetain(a1, a2);
    if (_CocoaArrayWrapper.endIndex.getter(v7))
      goto LABEL_4;
LABEL_13:
    sub_DA68(a1, 0);
    v8 = sub_AD90();
    v9 = swift_allocError(&type metadata for PropertyError, v8, 0, 0);
    *v10 = 1;
    v12 = (id)v9;
    v13 = 0u;
    v14 = 0u;
    v15 = 256;
    a3(&v12);
    swift_errorRelease(v9);
    return;
  }
  v5 = *(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain(a1, a2);
  if (!v5)
    goto LABEL_13;
LABEL_4:
  if ((a1 & 0xC000000000000001) != 0)
  {
    v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a1);
    goto LABEL_7;
  }
  if (*(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)))
  {
    v6 = *(id *)(a1 + 32);
LABEL_7:
    v11 = v6;
    sub_DA68(a1, 0);
    v12 = objc_msgSend(v11, "count");
    v13 = 0u;
    v14 = 0u;
    v15 = 0;
    a3(&v12);

    return;
  }
  __break(1u);
}

uint64_t CDProperty.toValue(recordType:completion:)(char *a1, void (*a2)(uint64_t *))
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t result;
  _BYTE v30[48];
  _QWORD v31[5];
  unsigned __int8 v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int16 v36;

  if (a1 != (_BYTE *)&dword_0 + 2)
  {
    if (a1 == (_BYTE *)&dword_0 + 1)
    {
      v4 = sub_74CC();
      if (v4)
      {
        v5 = v4;
        v6 = objc_msgSend(v2, "identifier");
        if (v6)
        {
          v8 = v6;
          v9 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(v6, v7);
          v11 = v10;

        }
        else
        {
          v9 = 0;
          v11 = 0;
        }
        v13 = sub_77B0(v5, v7);
        swift_bridgeObjectRelease(v5);
        v14 = 0;
        v15 = 0;
        v12 = 1;
        goto LABEL_17;
      }
      goto LABEL_10;
    }
    if (a1)
    {
      v33 = (uint64_t)a1;
      result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(&type metadata for PropertyType, &v33, &type metadata for PropertyType, &type metadata for Int);
      __break(1u);
      return result;
    }
    v9 = objc_msgSend(v2, "count");
    v11 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v12 = 0;
LABEL_17:
    v33 = (uint64_t)v9;
    *(_QWORD *)&v34 = v11;
    *((_QWORD *)&v34 + 1) = v13;
    *(_QWORD *)&v35 = v14;
    *((_QWORD *)&v35 + 1) = v15;
    v36 = v12;
    a2(&v33);
    return sub_ADD4((uint64_t)v9, v11, v13, v14, v15, v12);
  }
  sub_5D84((uint64_t)v30);
  sub_AD30((uint64_t)v30, (uint64_t)v31);
  v12 = v32;
  if (v32 != 255)
  {
    v9 = (id)v31[0];
    v11 = v31[1];
    v13 = v31[2];
    v14 = v31[3];
    v15 = v31[4];
    goto LABEL_17;
  }
LABEL_10:
  if (qword_3E6A0 != -1)
    swift_once(&qword_3E6A0, sub_10B64);
  v16 = type metadata accessor for Logger(0);
  sub_AD78(v16, (uint64_t)qword_3FA80);
  v17 = Logger.logObject.getter();
  v18 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc(12, -1);
    v20 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v19 = 138412290;
    v21 = sub_AD90();
    v22 = swift_allocError(&type metadata for PropertyError, v21, 0, 0);
    *v23 = 1;
    v24 = _swift_stdlib_bridgeErrorToNSError(v22);
    v33 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v19 + 4, v19 + 12);
    *v20 = v24;
    _os_log_impl(&dword_0, v17, v18, "Could not fetch. %@", v19, 0xCu);
    v25 = sub_44F0(&qword_3ECE0);
    swift_arrayDestroy(v20, 1, v25);
    swift_slowDealloc(v20, -1, -1);
    swift_slowDealloc(v19, -1, -1);
  }

  v26 = sub_AD90();
  v27 = swift_allocError(&type metadata for PropertyError, v26, 0, 0);
  *v28 = 1;
  v33 = v27;
  v34 = 0u;
  v35 = 0u;
  v36 = 256;
  a2(&v33);
  return swift_errorRelease(v27);
}

id sub_6888(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v8;
  void *v10;
  NSString v11;
  id v12;
  id v13;
  Class isa;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  NSString v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSString v28;
  uint64_t v29;
  unint64_t v30;
  Class v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  Class v40;
  uint64_t v41;
  unint64_t v42;
  id v43;
  uint64_t v44;
  NSString v45;
  uint64_t v46;
  _BYTE v48[32];
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;

  if (a1)
  {
    v8 = a1;
  }
  else
  {
    v10 = (void *)objc_opt_self(NSEntityDescription);
    v11 = String._bridgeToObjectiveC()();
    v12 = objc_msgSend(v10, "entityForName:inManagedObjectContext:", v11, a5);

    if (!v12)
      return 0;
    v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CDProperty()), "initWithEntity:insertIntoManagedObjectContext:", v12, a5);

  }
  v13 = a1;
  isa = Date._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v8, "setCreatedAt:", isa);

  v15 = objc_msgSend(a2, "eventName");
  objc_msgSend(v8, "setKey:", v15);

  sub_D9F8(a4, (uint64_t)&v51);
  if (v56)
  {
    if (v56 == 1)
    {
      v17 = v52;
      v18 = v53;
      v19 = *(_QWORD *)(v53 + 16);
      swift_bridgeObjectRetain(v52, v16);
      if (v19
        && (v20 = sub_17024(0x44497465737361, 0xE700000000000000), (v21 & 1) != 0)
        && (sub_DACC(*(_QWORD *)(v18 + 56) + 32 * v20, (uint64_t)v48),
            v22 = sub_44F0(&qword_3E970),
            (swift_dynamicCast(&v49, v48, v22, &type metadata for String, 6) & 1) != 0))
      {
        v23 = v50;
        v24 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v23);
      }
      else
      {
        v24 = 0;
      }
      objc_msgSend(v8, "setAssetID:", v24);

      v29 = sub_CB14(a4);
      if (v30 >> 60 == 15)
      {
        v31 = 0;
      }
      else
      {
        v32 = v29;
        v33 = v30;
        v31 = Data._bridgeToObjectiveC()().super.isa;
        sub_DA74(v32, v33);
      }
      objc_msgSend(v8, "setData:", v31);

      if (v17)
        goto LABEL_33;
LABEL_31:
      v43 = objc_msgSend(a2, "identifier");
      v45 = v43;
      if (!v43)
      {
LABEL_34:
        objc_msgSend(v8, "setIdentifier:", v45);

        return v8;
      }
      static String._unconditionallyBridgeFromObjectiveC(_:)(v43, v44);
      v17 = v46;

LABEL_33:
      v45 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v17);
      goto LABEL_34;
    }
    v17 = v52;
    v25 = v54;
    if (v54)
    {
      v49 = v53;
      v50 = v54;
      swift_bridgeObjectRetain(v52, v16);
      v27 = v25;
    }
    else
    {
      v34 = v55;
      v35 = *(_QWORD *)(v55 + 16);
      swift_bridgeObjectRetain(v52, v16);
      if (!v35
        || (v36 = sub_17024(0x44497465737361, 0xE700000000000000), (v26 & 1) == 0)
        || (sub_DACC(*(_QWORD *)(v34 + 56) + 32 * v36, (uint64_t)v48),
            v37 = sub_44F0(&qword_3E970),
            (swift_dynamicCast(&v49, v48, v37, &type metadata for String, 6) & 1) == 0)
        || (v27 = v50) == 0)
      {
        swift_bridgeObjectRetain(0, v26);
        v28 = 0;
LABEL_27:
        objc_msgSend(v8, "setAssetID:", v28);

        v38 = sub_CB14(a4);
        if (v39 >> 60 == 15)
        {
          v40 = 0;
        }
        else
        {
          v41 = v38;
          v42 = v39;
          v40 = Data._bridgeToObjectiveC()().super.isa;
          sub_DA74(v41, v42);
        }
        objc_msgSend(v8, "setData:", v40);

        if (v17)
          goto LABEL_33;
        goto LABEL_31;
      }
    }
    swift_bridgeObjectRetain(v25, v26);
    v28 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v27);
    goto LABEL_27;
  }
  objc_msgSend(v8, "setCount:", v51);
  return v8;
}

uint64_t sub_6CA4(uint64_t a1, char a2, uint64_t a3, void *a4, uint64_t (*a5)(void *, void *, char *, _BYTE *), uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t), uint64_t a8)
{
  uint64_t v11;
  void (**v12)(char *, uint64_t);
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t isUniquelyReferenced_nonNull_native;
  unint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  unint64_t v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  _BOOL8 v42;
  uint64_t v43;
  unint64_t v44;
  char **v45;
  uint64_t v46;
  BOOL v47;
  char **v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  char *v64;
  void (**v65)(char *, uint64_t, uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char v78;
  void *v79;
  id v80;
  id v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char v93;
  id v94;
  uint64_t v95;
  void *v96;
  unint64_t v97;
  uint64_t v98;
  _BYTE *v99;
  uint64_t v100;
  uint64_t result;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t (*v105)(uint64_t, uint64_t);
  uint64_t v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t (*v111)(void *, void *, char *, _BYTE *);
  uint64_t v112;
  uint64_t v113;
  void (**v114)(char *, uint64_t);
  uint64_t v115;
  char *v116;
  _BYTE v117[48];
  _QWORD v118[5];
  char v119;

  v104 = a8;
  v105 = a7;
  v111 = a5;
  v112 = a6;
  v106 = a3;
  v11 = type metadata accessor for Date(0);
  v12 = *(void (***)(char *, uint64_t))(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v102 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_44F0(&qword_3E950);
  v16 = __chkstk_darwin(v15);
  v113 = (uint64_t)&v102 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = a4;
  v114 = v12;
  v115 = v11;
  v116 = v14;
  v103 = v19;
  v102 = v16;
  if ((a2 & 1) != 0)
  {
    if (qword_3E6A0 != -1)
      swift_once(&qword_3E6A0, sub_10B64);
    v50 = type metadata accessor for Logger(0);
    v51 = sub_AD78(v50, (uint64_t)qword_3FA80);
    v52 = Logger.logObject.getter(v51);
    v53 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v52, v53))
    {
      v54 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v54 = 0;
      _os_log_impl(&dword_0, v52, v53, "No existing record, creating new one", v54, 2u);
      v55 = v54;
      v14 = v116;
      swift_slowDealloc(v55, -1, -1);
    }

  }
  else
  {
    v20 = a1 & 0xFFFFFFFFFFFFFF8;
    if ((unint64_t)a1 >> 62)
      goto LABEL_45;
    v21 = *(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain(a1, v17);
    while (v21)
    {
      v110 = a1 & 0xC000000000000001;
      v22 = &_swiftEmptyDictionarySingleton;
      v23 = 4;
      v108 = a1;
      v109 = v21;
      while (1)
      {
        v14 = (char *)(v23 - 4);
        v26 = v110
            ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v23 - 4, a1)
            : *(id *)(a1 + 8 * v23);
        v27 = v26;
        a4 = (void *)(v23 - 3);
        if (__OFADD__(v14, 1))
          break;
        v28 = objc_msgSend(v26, "identifier");
        if (v28)
        {
          v30 = v28;
          v14 = (char *)static String._unconditionallyBridgeFromObjectiveC(_:)(v28, v29);
          a1 = v31;

          v12 = v27;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v22);
          v118[0] = v22;
          v33 = sub_17024((uint64_t)v14, a1);
          v20 = v22[2];
          v34 = (v17 & 1) == 0;
          v35 = v20 + v34;
          if (__OFADD__(v20, v34))
            goto LABEL_41;
          v11 = v17;
          if (v22[3] >= v35)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              sub_18B0C();
          }
          else
          {
            sub_17750(v35, isUniquelyReferenced_nonNull_native);
            v36 = sub_17024((uint64_t)v14, a1);
            if ((v11 & 1) != (v17 & 1))
              goto LABEL_80;
            v33 = v36;
          }
          v21 = v109;
          v22 = (_QWORD *)v118[0];
          if ((v11 & 1) == 0)
          {
            *(_QWORD *)(v118[0] + 8 * (v33 >> 6) + 64) |= 1 << v33;
            v45 = (char **)(v22[6] + 16 * v33);
            *v45 = v14;
            v45[1] = (char *)a1;
            *(_QWORD *)(v22[7] + 8 * v33) = v12;
            v46 = v22[2];
            v47 = __OFADD__(v46, 1);
            v20 = v46 + 1;
            if (v47)
              goto LABEL_42;
            goto LABEL_33;
          }
        }
        else
        {
          v37 = objc_msgSend(v27, "key");
          if (!v37)
          {

            v14 = v116;
            goto LABEL_7;
          }
          v39 = v37;
          v14 = (char *)static String._unconditionallyBridgeFromObjectiveC(_:)(v37, v38);
          a1 = v40;

          v12 = v27;
          v41 = swift_isUniquelyReferenced_nonNull_native(v22);
          v118[0] = v22;
          v33 = sub_17024((uint64_t)v14, a1);
          v20 = v22[2];
          v42 = (v17 & 1) == 0;
          v43 = v20 + v42;
          if (__OFADD__(v20, v42))
            goto LABEL_43;
          v11 = v17;
          if (v22[3] >= v43)
          {
            if ((v41 & 1) == 0)
              sub_18B0C();
          }
          else
          {
            sub_17750(v43, v41);
            v44 = sub_17024((uint64_t)v14, a1);
            if ((v11 & 1) != (v17 & 1))
            {
LABEL_80:
              result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
              __break(1u);
              return result;
            }
            v33 = v44;
          }
          v21 = v109;
          v22 = (_QWORD *)v118[0];
          if ((v11 & 1) == 0)
          {
            *(_QWORD *)(v118[0] + 8 * (v33 >> 6) + 64) |= 1 << v33;
            v48 = (char **)(v22[6] + 16 * v33);
            *v48 = v14;
            v48[1] = (char *)a1;
            *(_QWORD *)(v22[7] + 8 * v33) = v12;
            v49 = v22[2];
            v47 = __OFADD__(v49, 1);
            v20 = v49 + 1;
            if (v47)
              goto LABEL_44;
LABEL_33:
            v22[2] = v20;
            swift_bridgeObjectRetain(a1, v17);
            goto LABEL_6;
          }
        }
        v24 = v22[7];

        *(_QWORD *)(v24 + 8 * v33) = v12;
LABEL_6:

        swift_bridgeObjectRelease(a1);
        swift_bridgeObjectRelease(0x8000000000000000);
        v12 = v114;
        v11 = v115;
        v14 = v116;
        a1 = v108;
LABEL_7:
        ++v23;
        v25 = a4 == (void *)v21;
        a4 = v107;
        if (v25)
        {
          sub_DA68(a1, 0);
          goto LABEL_51;
        }
      }
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      if (a1 >= 0)
        v57 = v20;
      else
        v57 = a1;
      swift_bridgeObjectRetain(a1, v17);
      v21 = _CocoaArrayWrapper.endIndex.getter(v57);
    }
    sub_DA68(a1, 0);
  }
  v22 = &_swiftEmptyDictionarySingleton;
LABEL_51:
  v58 = *(_QWORD *)(v106 + 16);
  if (!v58)
  {
    swift_bridgeObjectRelease(v22);
    return v105(0, 0);
  }
  v110 = v113 + *(int *)(v102 + 48);
  v59 = v106 + ((*(unsigned __int8 *)(v103 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v103 + 80));
  v109 = *(_QWORD *)(v103 + 72);
  swift_bridgeObjectRetain(v106, v56);
  v108 = 0;
  do
  {
    v60 = v22;
    v61 = v113;
    sub_D9B4(v59, v113, &qword_3E950);
    v62 = (_QWORD *)v110;
    sub_D9F8(v110, (uint64_t)v117);
    v63 = v62[1];
    v64 = v14;
    v65 = (void (**)(char *, uint64_t, uint64_t))v12;
    v66 = v62[3];
    v67 = v62[4];
    v65[4](v64, v61, v11);
    if (objc_msgSend(a4, "recordType") != (char *)&dword_0 + 2)
      goto LABEL_62;
    sub_D9F8((uint64_t)v117, (uint64_t)v118);
    if (v119 != 2)
      goto LABEL_62;
    v69 = v118[0];
    v70 = v118[1];
    v72 = v118[3];
    v71 = v118[4];
    swift_bridgeObjectRetain(v66, v68);
    swift_bridgeObjectRetain(v67, v73);
    swift_bridgeObjectRetain(v63, v74);
    swift_bridgeObjectRelease(v71);
    v75 = v72;
    a4 = v107;
    swift_bridgeObjectRelease(v75);
    if (!v70)
    {
LABEL_62:
      v81 = objc_msgSend(a4, "identifier", v102, v103, v104);
      if (v81)
      {
        v83 = v81;
        v84 = static String._unconditionallyBridgeFromObjectiveC(_:)(v81, v82);
        v86 = v85;

        v22 = v60;
        if (v60[2])
        {
          v87 = v84;
          goto LABEL_67;
        }
      }
      else
      {
        v88 = objc_msgSend(a4, "eventName");
        v90 = static String._unconditionallyBridgeFromObjectiveC(_:)(v88, v89);
        v86 = v91;

        v22 = v60;
        if (v60[2])
        {
          v87 = v90;
LABEL_67:
          v92 = sub_17024(v87, v86);
          if ((v93 & 1) != 0)
          {
            v79 = *(void **)(v22[7] + 8 * v92);
            v94 = v79;
            swift_bridgeObjectRelease(v86);
LABEL_71:
            v11 = v115;
            v14 = v116;
            goto LABEL_72;
          }
        }
      }
      v95 = v86;
LABEL_70:
      swift_bridgeObjectRelease(v95);
      v79 = 0;
      goto LABEL_71;
    }
    v76 = v69;
    v22 = v60;
    if (!v60[2])
    {
      v95 = v70;
      goto LABEL_70;
    }
    v77 = sub_17024(v76, v70);
    v14 = v116;
    if ((v78 & 1) != 0)
    {
      v79 = *(void **)(v60[7] + 8 * v77);
      v80 = v79;
      swift_bridgeObjectRelease(v70);
    }
    else
    {
      swift_bridgeObjectRelease(v70);
      v79 = 0;
    }
    v11 = v115;
LABEL_72:
    v96 = (void *)v111(v79, a4, v14, v117);
    sub_DA34((uint64_t)v117);

    if (v96)
    {

    }
    else
    {
      v97 = sub_AD90();
      v98 = swift_allocError(&type metadata for PropertyError, v97, 0, 0);
      *v99 = 0;
      swift_errorRelease(v108);

      v108 = v98;
    }
    v12 = v114;
    v114[1](v14, v11);
    v59 += v109;
    --v58;
  }
  while (v58);
  swift_bridgeObjectRelease(v106);
  swift_bridgeObjectRelease(v22);
  v100 = v108;
  if (v108)
  {
    swift_errorRetain(v108);
    v105(v100, 1);
    swift_errorRelease(v100);
    return swift_errorRelease(v100);
  }
  return v105(0, 0);
}

uint64_t sub_74CC()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  Class isa;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  id v24[4];

  v1 = objc_msgSend(v0, "data");
  if (v1)
  {
    v2 = v1;
    v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v4;

    v6 = (void *)objc_opt_self(NSJSONSerialization);
    isa = Data._bridgeToObjectiveC()().super.isa;
    v24[0] = 0;
    v8 = objc_msgSend(v6, "JSONObjectWithData:options:error:", isa, 0, v24);

    v9 = v24[0];
    if (v8)
    {
      v10 = v24[0];
      _bridgeAnyObjectToAny(_:)(v24, v8);
      swift_unknownObjectRelease(v8);
      v11 = sub_44F0(&qword_3E980);
      if (swift_dynamicCast(&v23, v24, (char *)&type metadata for Any + 8, v11, 6))
      {
        sub_DA88(v3, v5);
        return v23;
      }
      if (qword_3E6A0 != -1)
        swift_once(&qword_3E6A0, sub_10B64);
      v19 = type metadata accessor for Logger(0);
      sub_AD78(v19, (uint64_t)qword_3FA80);
      v20 = Logger.logObject.getter();
      v21 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v20, v21))
      {
        v22 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_0, v20, v21, "Tried to convert a Property to a StatePropertyValue but data can't be deserialized to a valid state value", v22, 2u);
        swift_slowDealloc(v22, -1, -1);
      }
      sub_DA88(v3, v5);

    }
    else
    {
      v17 = v24[0];
      v18 = _convertNSErrorToError(_:)(v9);

      swift_willThrow();
      sub_DA88(v3, v5);
      swift_errorRelease(v18);
    }
  }
  else
  {
    if (qword_3E6A0 != -1)
      swift_once(&qword_3E6A0, sub_10B64);
    v13 = type metadata accessor for Logger(0);
    sub_AD78(v13, (uint64_t)qword_3FA80);
    v14 = Logger.logObject.getter();
    v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_0, v14, v15, "Tried to convert a Property to a StatePropertyValue without data", v16, 2u);
      swift_slowDealloc(v16, -1, -1);
    }

  }
  return 0;
}

unint64_t sub_77B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  uint64_t *v10;
  uint64_t *v11;
  unint64_t result;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t *v18;
  _QWORD *v19;
  unint64_t i;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  int64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t *v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  int64_t v40;
  uint64_t v41;
  _OWORD v42[2];
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  _OWORD v48[3];
  _OWORD v49[2];
  __int128 v50;
  _OWORD v51[2];

  v2 = a1;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    sub_44F0(&qword_3EC90);
    v4 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v3);
  }
  else
  {
    v4 = &_swiftEmptyDictionarySingleton;
  }
  v39 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  if (-v5 < 64)
    v6 = ~(-1 << -(char)v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 64);
  v38 = (unint64_t)(63 - v5) >> 6;
  v8 = v51;
  v9 = v49;
  v10 = &v45;
  v11 = &v47;
  result = swift_bridgeObjectRetain(v2, a2);
  v40 = 0;
  if (v7)
    goto LABEL_10;
LABEL_11:
  v21 = v40 + 1;
  if (__OFADD__(v40, 1))
    goto LABEL_35;
  if (v21 >= v38)
    goto LABEL_32;
  v22 = *(_QWORD *)(v39 + 8 * v21);
  v23 = v40 + 1;
  if (!v22)
  {
    v23 = v40 + 2;
    if (v40 + 2 >= v38)
      goto LABEL_32;
    v22 = *(_QWORD *)(v39 + 8 * v23);
    if (!v22)
    {
      v23 = v40 + 3;
      if (v40 + 3 >= v38)
        goto LABEL_32;
      v22 = *(_QWORD *)(v39 + 8 * v23);
      if (!v22)
      {
        v23 = v40 + 4;
        if (v40 + 4 >= v38)
          goto LABEL_32;
        v22 = *(_QWORD *)(v39 + 8 * v23);
        if (!v22)
        {
          v24 = v40 + 5;
          if (v40 + 5 < v38)
          {
            v22 = *(_QWORD *)(v39 + 8 * v24);
            if (v22)
            {
              v23 = v40 + 5;
              goto LABEL_26;
            }
            while (1)
            {
              v23 = v24 + 1;
              if (__OFADD__(v24, 1))
                goto LABEL_36;
              if (v23 >= v38)
                break;
              v22 = *(_QWORD *)(v39 + 8 * v23);
              ++v24;
              if (v22)
                goto LABEL_26;
            }
          }
LABEL_32:
          sub_B28C(v2);
          return (unint64_t)v4;
        }
      }
    }
  }
LABEL_26:
  v40 = v23;
  v41 = (v22 - 1) & v22;
  for (i = __clz(__rbit64(v22)) + (v23 << 6); ; i = __clz(__rbit64(v7)) | (v40 << 6))
  {
    v25 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v27 = *v25;
    v26 = v25[1];
    sub_DACC(*(_QWORD *)(v2 + 56) + 32 * i, (uint64_t)v8);
    *(_QWORD *)&v50 = v27;
    *((_QWORD *)&v50 + 1) = v26;
    v48[2] = v50;
    v49[0] = v51[0];
    v49[1] = v51[1];
    v43 = v27;
    v44 = v26;
    sub_DB44(v9, v42);
    swift_bridgeObjectRetain(v26, v28);
    v29 = sub_44F0(&qword_3E970);
    swift_dynamicCast(v10, v42, (char *)&type metadata for Any + 8, v29, 7);
    v31 = v43;
    v30 = v44;
    sub_DB44(v10, v11);
    sub_DB44(v11, v48);
    sub_DB44(v48, &v46);
    result = sub_17024(v31, v30);
    v32 = result;
    if ((v33 & 1) != 0)
    {
      v13 = v11;
      v14 = v10;
      v15 = v2;
      v16 = v9;
      v17 = v8;
      v18 = (uint64_t *)(v4[6] + 16 * result);
      swift_bridgeObjectRelease(v18[1]);
      *v18 = v31;
      v18[1] = v30;
      v8 = v17;
      v9 = v16;
      v2 = v15;
      v10 = v14;
      v11 = v13;
      v19 = (_QWORD *)(v4[7] + 32 * v32);
      sub_DB54(v19);
      result = (unint64_t)sub_DB44(&v46, v19);
      v7 = v41;
      if (!v41)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v4[2] >= v4[3])
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v34 = (uint64_t *)(v4[6] + 16 * result);
    *v34 = v31;
    v34[1] = v30;
    result = (unint64_t)sub_DB44(&v46, (_OWORD *)(v4[7] + 32 * result));
    v35 = v4[2];
    v36 = __OFADD__(v35, 1);
    v37 = v35 + 1;
    if (v36)
      goto LABEL_34;
    v4[2] = v37;
    v7 = v41;
    if (!v41)
      goto LABEL_11;
LABEL_10:
    v41 = (v7 - 1) & v7;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_7B58(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  _QWORD v33[2];
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  _OWORD v41[2];
  _OWORD v42[3];
  _OWORD v43[2];
  __int128 v44;
  _OWORD v45[2];

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    sub_44F0(&qword_3E910);
    v4 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v3);
  }
  else
  {
    v4 = &_swiftEmptyDictionarySingleton;
  }
  v32 = a1 + 64;
  v5 = -1 << *(_BYTE *)(a1 + 32);
  if (-v5 < 64)
    v6 = ~(-1 << -(char)v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v31 = (unint64_t)(63 - v5) >> 6;
  v8 = (char *)(v4 + 8);
  swift_bridgeObjectRetain(a1, a2);
  result = swift_retain(v4);
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v13 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v14 = v13 | (v10 << 6);
      goto LABEL_28;
    }
    v15 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v15 >= v31)
      goto LABEL_37;
    v16 = *(_QWORD *)(v32 + 8 * v15);
    v17 = v10 + 1;
    if (!v16)
    {
      v17 = v10 + 2;
      if (v10 + 2 >= v31)
        goto LABEL_37;
      v16 = *(_QWORD *)(v32 + 8 * v17);
      if (!v16)
      {
        v17 = v10 + 3;
        if (v10 + 3 >= v31)
          goto LABEL_37;
        v16 = *(_QWORD *)(v32 + 8 * v17);
        if (!v16)
        {
          v17 = v10 + 4;
          if (v10 + 4 >= v31)
            goto LABEL_37;
          v16 = *(_QWORD *)(v32 + 8 * v17);
          if (!v16)
            break;
        }
      }
    }
LABEL_27:
    v7 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v17 << 6);
    v10 = v17;
LABEL_28:
    v19 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v14);
    v21 = *v19;
    v20 = v19[1];
    sub_DACC(*(_QWORD *)(a1 + 56) + 32 * v14, (uint64_t)v45);
    *(_QWORD *)&v44 = v21;
    *((_QWORD *)&v44 + 1) = v20;
    v42[2] = v44;
    v43[0] = v45[0];
    v43[1] = v45[1];
    v33[0] = v21;
    v33[1] = v20;
    swift_bridgeObjectRetain(v20, v22);
    swift_dynamicCast(&v34, v33, &type metadata for String, &type metadata for AnyHashable, 7);
    sub_DB44(v43, v42);
    v23 = sub_44F0(&qword_3E970);
    swift_dynamicCast(v37, v42, v23, (char *)&type metadata for Any + 8, 7);
    v38 = v34;
    v39 = v35;
    v40 = v36;
    sub_DB44(v37, v41);
    v34 = v38;
    v35 = v39;
    v36 = v40;
    sub_DB44(v41, v42);
    sub_DB44(v42, &v38);
    result = AnyHashable._rawHashValue(seed:)(v4[5]);
    v24 = -1 << *((_BYTE *)v4 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)&v8[8 * (v25 >> 6)]) != 0)
    {
      v11 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)&v8[8 * (v25 >> 6)])) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v29 = v26 == v28;
        if (v26 == v28)
          v26 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)&v8[8 * v26];
      }
      while (v30 == -1);
      v11 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)&v8[(v11 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v11;
    v12 = v4[6] + 40 * v11;
    *(_OWORD *)v12 = v34;
    *(_OWORD *)(v12 + 16) = v35;
    *(_QWORD *)(v12 + 32) = v36;
    result = (uint64_t)sub_DB44(&v38, (_OWORD *)(v4[7] + 32 * v11));
    ++v4[2];
  }
  v18 = v10 + 5;
  if (v10 + 5 >= v31)
  {
LABEL_37:
    swift_release(v4);
    sub_B28C(a1);
    return (uint64_t)v4;
  }
  v16 = *(_QWORD *)(v32 + 8 * v18);
  if (v16)
  {
    v17 = v10 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v17 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v17 >= v31)
      goto LABEL_37;
    v16 = *(_QWORD *)(v32 + 8 * v17);
    ++v18;
    if (v16)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_7F4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  int64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  _OWORD v38[2];
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  _OWORD v42[2];
  _OWORD v43[2];

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    sub_44F0(&qword_3E910);
    v4 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v3);
  }
  else
  {
    v4 = &_swiftEmptyDictionarySingleton;
  }
  v33 = a1 + 64;
  v5 = -1 << *(_BYTE *)(a1 + 32);
  if (-v5 < 64)
    v6 = ~(-1 << -(char)v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v32 = (unint64_t)(63 - v5) >> 6;
  v8 = (char *)(v4 + 8);
  swift_bridgeObjectRetain(a1, a2);
  result = swift_retain(v4);
  v11 = 0;
  while (1)
  {
    if (v7)
    {
      v14 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_28;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v16 >= v32)
      goto LABEL_37;
    v17 = *(_QWORD *)(v33 + 8 * v16);
    v18 = v11 + 1;
    if (!v17)
    {
      v18 = v11 + 2;
      if (v11 + 2 >= v32)
        goto LABEL_37;
      v17 = *(_QWORD *)(v33 + 8 * v18);
      if (!v17)
      {
        v18 = v11 + 3;
        if (v11 + 3 >= v32)
          goto LABEL_37;
        v17 = *(_QWORD *)(v33 + 8 * v18);
        if (!v17)
        {
          v18 = v11 + 4;
          if (v11 + 4 >= v32)
            goto LABEL_37;
          v17 = *(_QWORD *)(v33 + 8 * v18);
          if (!v17)
            break;
        }
      }
    }
LABEL_27:
    v7 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v18 << 6);
    v11 = v18;
LABEL_28:
    v20 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v15);
    v21 = v20[1];
    v22 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * v15);
    *(_QWORD *)&v43[0] = *v20;
    *((_QWORD *)&v43[0] + 1) = v21;
    swift_bridgeObjectRetain(v21, v10);
    v23 = v22;
    swift_dynamicCast(&v35, v43, &type metadata for String, &type metadata for AnyHashable, 7);
    v34 = v23;
    v24 = sub_D854(0, &qword_3E918, NSObject_ptr);
    swift_dynamicCast(v38, &v34, v24, (char *)&type metadata for Any + 8, 7);
    v39 = v35;
    v40 = v36;
    v41 = v37;
    sub_DB44(v38, v42);
    v35 = v39;
    v36 = v40;
    v37 = v41;
    sub_DB44(v42, v43);
    sub_DB44(v43, &v39);
    result = AnyHashable._rawHashValue(seed:)(v4[5]);
    v25 = -1 << *((_BYTE *)v4 + 32);
    v26 = result & ~v25;
    v27 = v26 >> 6;
    if (((-1 << v26) & ~*(_QWORD *)&v8[8 * (v26 >> 6)]) != 0)
    {
      v12 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)&v8[8 * (v26 >> 6)])) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v30 = v27 == v29;
        if (v27 == v29)
          v27 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)&v8[8 * v27];
      }
      while (v31 == -1);
      v12 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(_QWORD *)&v8[(v12 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v12;
    v13 = v4[6] + 40 * v12;
    *(_OWORD *)v13 = v35;
    *(_OWORD *)(v13 + 16) = v36;
    *(_QWORD *)(v13 + 32) = v37;
    result = (uint64_t)sub_DB44(&v39, (_OWORD *)(v4[7] + 32 * v12));
    ++v4[2];
  }
  v19 = v11 + 5;
  if (v11 + 5 >= v32)
  {
LABEL_37:
    swift_release(v4);
    sub_B28C(a1);
    return (uint64_t)v4;
  }
  v17 = *(_QWORD *)(v33 + 8 * v19);
  if (v17)
  {
    v18 = v11 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v18 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v18 >= v32)
      goto LABEL_37;
    v17 = *(_QWORD *)(v33 + 8 * v18);
    ++v19;
    if (v17)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

double sub_830C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v8;
  unint64_t v9;
  char v10;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;
  double result;
  uint64_t v15;

  v4 = v3;
  v5 = a2;
  v8 = *v4;
  swift_bridgeObjectRetain(*v4, a2);
  v9 = sub_17024(a1, v5);
  LOBYTE(v5) = v10;
  swift_bridgeObjectRelease(v8);
  if ((v5 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    v12 = *v4;
    v15 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_18AF0();
      v12 = v15;
    }
    swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)(v12 + 48) + 16 * v9 + 8));
    sub_DB44((_OWORD *)(*(_QWORD *)(v12 + 56) + 32 * v9), a3);
    sub_2E41C(v9, v12);
    v13 = *v4;
    *v4 = v12;
    swift_bridgeObjectRelease(v13);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

void sub_83FC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_8C1C(a1, a2, a3, a4, a5, a6, a7, a8, a9, (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))sub_5458);
}

void sub_8428(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, void (*a8)(uint64_t, uint64_t), uint64_t a9)
{
  id v15;
  NSString v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSString v21;
  Class isa;
  id v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSString v32;
  Class v33;
  id v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  Class v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  NSString v44;
  id v45;
  uint64_t v46;
  Class v47;
  uint64_t v48;
  uint64_t v49;

  v15 = objc_allocWithZone((Class)NSFetchRequest);
  v16 = String._bridgeToObjectiveC()();
  v17 = objc_msgSend(v15, "initWithEntityName:", v16);

  objc_msgSend(v17, "setPredicate:", a1);
  if (a3)
  {
    v18 = sub_44F0(&qword_3E8C0);
    v19 = swift_allocObject(v18, 96, 7);
    *(_OWORD *)(v19 + 16) = xmmword_31630;
    *(_QWORD *)(v19 + 32) = 0x696669746E656469;
    *(_QWORD *)(v19 + 40) = 0xEA00000000007265;
    *(_QWORD *)(v19 + 88) = &type metadata for String;
    *(_QWORD *)(v19 + 56) = &type metadata for String;
    *(_QWORD *)(v19 + 64) = a2;
    *(_QWORD *)(v19 + 72) = a3;
    swift_bridgeObjectRetain(a3, v20);
    v21 = String._bridgeToObjectiveC()();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v19);
    v23 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v21, isa);

  }
  else
  {
    v23 = a1;
  }
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  v25 = *(_QWORD *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8));
  v24 = *(_QWORD *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8));
  if (v25 >= v24 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v24 > 1, v25 + 1, 1);
  v26 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v25, v23);
  specialized Array._endMutation()(v26);
  if (a4)
  {
    swift_bridgeObjectRetain(a4, v27);
    v28 = sub_44F0(&qword_3E960);
    v29 = sub_D974(&qword_3E968, &qword_3E960, (uint64_t)&protocol conformance descriptor for Set<A>);
    if ((Collection.isNotEmpty.getter(v28, v29) & 1) != 0)
    {
      v30 = sub_44F0(&qword_3E8C0);
      v31 = swift_allocObject(v30, 96, 7);
      *(_OWORD *)(v31 + 16) = xmmword_31630;
      *(_QWORD *)(v31 + 32) = 0x44497465737361;
      *(_QWORD *)(v31 + 40) = 0xE700000000000000;
      *(_QWORD *)(v31 + 88) = v28;
      *(_QWORD *)(v31 + 56) = &type metadata for String;
      *(_QWORD *)(v31 + 64) = a4;
      v32 = String._bridgeToObjectiveC()();
      v33 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v31);
      v34 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v32, v33);

      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v36 = *(_QWORD *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8));
      v35 = *(_QWORD *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8));
      if (v36 >= v35 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v35 > 1, v36 + 1, 1);
      v37 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v36, v34);
      specialized Array._endMutation()(v37);
    }
    else
    {
      swift_bridgeObjectRelease(a4);
    }
  }
  sub_D854(0, &qword_3E938, NSPredicate_ptr);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage, v38);
  v39 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  v40 = objc_msgSend((id)objc_opt_self(NSCompoundPredicate), "andPredicateWithSubpredicates:", v39);

  objc_msgSend(v17, "setPredicate:", v40);
  if ((a5 & 1) != 0)
  {
    v41 = sub_44F0(&qword_3E920);
    v42 = swift_allocObject(v41, 40, 7);
    *(_OWORD *)(v42 + 16) = xmmword_31640;
    v43 = objc_allocWithZone((Class)NSSortDescriptor);
    v44 = String._bridgeToObjectiveC()();
    v45 = objc_msgSend(v43, "initWithKey:ascending:", v44, 1);

    *(_QWORD *)(v42 + 32) = v45;
    specialized Array._endMutation()(v46);
    sub_D854(0, &qword_3E928, NSSortDescriptor_ptr);
    v47 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v42);
    objc_msgSend(v17, "setSortDescriptors:", v47);

  }
  if (a6 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v17, "setFetchLimit:", a6);
  v48 = type metadata accessor for CDProperty();
  v49 = NSManagedObjectContext.fetch<A>(_:)(v17, v48);
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  sub_5838(v49, 0, a8, a9);
  swift_bridgeObjectRelease(v49);

}

void sub_8C1C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void (*a10)(uint64_t, _QWORD, uint64_t, uint64_t))
{
  id v16;
  NSString v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString v22;
  Class isa;
  id v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSString v33;
  Class v34;
  id v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  Class v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  NSString v45;
  id v46;
  uint64_t v47;
  Class v48;
  uint64_t v49;
  uint64_t v50;

  v16 = objc_allocWithZone((Class)NSFetchRequest);
  v17 = String._bridgeToObjectiveC()();
  v18 = objc_msgSend(v16, "initWithEntityName:", v17);

  objc_msgSend(v18, "setPredicate:", a1);
  if (a3)
  {
    v19 = sub_44F0(&qword_3E8C0);
    v20 = swift_allocObject(v19, 96, 7);
    *(_OWORD *)(v20 + 16) = xmmword_31630;
    *(_QWORD *)(v20 + 32) = 0x696669746E656469;
    *(_QWORD *)(v20 + 40) = 0xEA00000000007265;
    *(_QWORD *)(v20 + 88) = &type metadata for String;
    *(_QWORD *)(v20 + 56) = &type metadata for String;
    *(_QWORD *)(v20 + 64) = a2;
    *(_QWORD *)(v20 + 72) = a3;
    swift_bridgeObjectRetain(a3, v21);
    v22 = String._bridgeToObjectiveC()();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v20);
    v24 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v22, isa);

  }
  else
  {
    v24 = a1;
  }
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  v26 = *(_QWORD *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8));
  v25 = *(_QWORD *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8));
  if (v26 >= v25 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v25 > 1, v26 + 1, 1);
  v27 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v26, v24);
  specialized Array._endMutation()(v27);
  if (a4)
  {
    swift_bridgeObjectRetain(a4, v28);
    v29 = sub_44F0(&qword_3E960);
    v30 = sub_D974(&qword_3E968, &qword_3E960, (uint64_t)&protocol conformance descriptor for Set<A>);
    if ((Collection.isNotEmpty.getter(v29, v30) & 1) != 0)
    {
      v31 = sub_44F0(&qword_3E8C0);
      v32 = swift_allocObject(v31, 96, 7);
      *(_OWORD *)(v32 + 16) = xmmword_31630;
      *(_QWORD *)(v32 + 32) = 0x44497465737361;
      *(_QWORD *)(v32 + 40) = 0xE700000000000000;
      *(_QWORD *)(v32 + 88) = v29;
      *(_QWORD *)(v32 + 56) = &type metadata for String;
      *(_QWORD *)(v32 + 64) = a4;
      v33 = String._bridgeToObjectiveC()();
      v34 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v32);
      v35 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v33, v34);

      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v37 = *(_QWORD *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8));
      v36 = *(_QWORD *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8));
      if (v37 >= v36 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v36 > 1, v37 + 1, 1);
      v38 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v37, v35);
      specialized Array._endMutation()(v38);
    }
    else
    {
      swift_bridgeObjectRelease(a4);
    }
  }
  sub_D854(0, &qword_3E938, NSPredicate_ptr);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage, v39);
  v40 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  v41 = objc_msgSend((id)objc_opt_self(NSCompoundPredicate), "andPredicateWithSubpredicates:", v40);

  objc_msgSend(v18, "setPredicate:", v41);
  if ((a5 & 1) != 0)
  {
    v42 = sub_44F0(&qword_3E920);
    v43 = swift_allocObject(v42, 40, 7);
    *(_OWORD *)(v43 + 16) = xmmword_31640;
    v44 = objc_allocWithZone((Class)NSSortDescriptor);
    v45 = String._bridgeToObjectiveC()();
    v46 = objc_msgSend(v44, "initWithKey:ascending:", v45, 1);

    *(_QWORD *)(v43 + 32) = v46;
    specialized Array._endMutation()(v47);
    sub_D854(0, &qword_3E928, NSSortDescriptor_ptr);
    v48 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v43);
    objc_msgSend(v18, "setSortDescriptors:", v48);

  }
  if (a6 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v18, "setFetchLimit:", a6);
  v49 = type metadata accessor for CDProperty();
  v50 = NSManagedObjectContext.fetch<A>(_:)(v18, v49);
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  a10(v50, 0, a8, a9);
  swift_bridgeObjectRelease(v50);

}

void sub_9444(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_8C1C(a1, a2, a3, a4, a5, a6, a7, a8, a9, (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))sub_63C4);
}

char *sub_9470(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  if ((unint64_t)a2 >> 62)
    goto LABEL_28;
  v5 = *(_QWORD *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain(a2, a2);
  for (; v5; v5 = _CocoaArrayWrapper.endIndex.getter(v35))
  {
    v6 = 4;
    v37 = v5;
    while (1)
    {
      v7 = (a2 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6 - 4, a2)
         : *(id *)(a2 + 8 * v6);
      v8 = v7;
      v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1))
        break;
      v10 = objc_msgSend(v7, "key");
      if (v10)
      {
        v12 = v10;
        v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10, v11);
        v15 = v14;

        if (*(_QWORD *)(a3 + 16) && (v16 = sub_17024(v13, v15), (v17 & 1) != 0))
        {
          v18 = *(_QWORD *)(*(_QWORD *)(a3 + 56) + 8 * v16);
          swift_unknownObjectRetain(v18);
          swift_bridgeObjectRelease(v15);
          v19 = sub_74CC();
          if (v19)
          {
            v20 = v19;
            v21 = objc_msgSend(v8, "identifier");
            if (v21)
            {
              v23 = v21;
              v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21, v22);
              v40 = v25;
              v41 = v24;

            }
            else
            {
              v40 = 0;
              v41 = 0;
            }
            v26 = objc_msgSend(v8, "assetID");
            if (v26)
            {
              v28 = v26;
              v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26, v27);
              v38 = v30;
              v39 = v29;

            }
            else
            {
              v38 = 0;
              v39 = 0;
            }
            v31 = sub_77B0(v20, v27);
            swift_bridgeObjectRelease(v20);
            swift_unknownObjectRetain(v18);
            if ((swift_isUniquelyReferenced_nonNull_native(a1) & 1) == 0)
              a1 = sub_239B8(0, *((_QWORD *)a1 + 2) + 1, 1, a1);
            v33 = *((_QWORD *)a1 + 2);
            v32 = *((_QWORD *)a1 + 3);
            if (v33 >= v32 >> 1)
              a1 = sub_239B8((char *)(v32 > 1), v33 + 1, 1, a1);
            *((_QWORD *)a1 + 2) = v33 + 1;
            v34 = &a1[56 * v33];
            *((_QWORD *)v34 + 4) = v18;
            *((_QWORD *)v34 + 5) = v41;
            *((_QWORD *)v34 + 6) = v40;
            *((_QWORD *)v34 + 7) = v39;
            *((_QWORD *)v34 + 8) = v38;
            *((_QWORD *)v34 + 9) = v31;
            v34[80] = 2;
          }

          swift_unknownObjectRelease(v18);
          v5 = v37;
        }
        else
        {

          swift_bridgeObjectRelease(v15);
        }
      }
      else
      {

      }
      ++v6;
      if (v9 == v5)
        goto LABEL_32;
    }
    __break(1u);
LABEL_28:
    if (a2 < 0)
      v35 = a2;
    else
      v35 = a2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a2, a2);
  }
LABEL_32:
  swift_bridgeObjectRelease(a2);
  return a1;
}

uint64_t sub_9710(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, void (*a8)(char *, _QWORD), uint64_t a9, uint64_t a10)
{
  id v16;
  NSString v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString v22;
  Class isa;
  id v24;
  id v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSString v34;
  Class v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  Class v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  NSString v47;
  id v48;
  uint64_t v49;
  Class v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  id v57;

  v16 = objc_allocWithZone((Class)NSFetchRequest);
  v17 = String._bridgeToObjectiveC()();
  v18 = objc_msgSend(v16, "initWithEntityName:", v17);

  v57 = v18;
  objc_msgSend(v18, "setPredicate:", a1);
  if (a3)
  {
    v19 = sub_44F0(&qword_3E8C0);
    v20 = swift_allocObject(v19, 96, 7);
    *(_OWORD *)(v20 + 16) = xmmword_31630;
    *(_QWORD *)(v20 + 32) = 0x696669746E656469;
    *(_QWORD *)(v20 + 40) = 0xEA00000000007265;
    *(_QWORD *)(v20 + 88) = &type metadata for String;
    *(_QWORD *)(v20 + 56) = &type metadata for String;
    *(_QWORD *)(v20 + 64) = a2;
    *(_QWORD *)(v20 + 72) = a3;
    swift_bridgeObjectRetain(a3, v21);
    v22 = String._bridgeToObjectiveC()();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v20);
    v24 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v22, isa);

  }
  else
  {
    v25 = a1;
    v24 = v25;
  }
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v25);
  v27 = *(_QWORD *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8));
  v26 = *(_QWORD *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8));
  if (v27 >= v26 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v26 > 1, v27 + 1, 1);
  v28 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v27, v24);
  specialized Array._endMutation()(v28);
  if (a4)
  {
    swift_bridgeObjectRetain(a4, v29);
    v30 = sub_44F0(&qword_3E960);
    v31 = sub_D974(&qword_3E968, &qword_3E960, (uint64_t)&protocol conformance descriptor for Set<A>);
    if ((Collection.isNotEmpty.getter(v30, v31) & 1) != 0)
    {
      v32 = sub_44F0(&qword_3E8C0);
      v33 = swift_allocObject(v32, 96, 7);
      *(_OWORD *)(v33 + 16) = xmmword_31630;
      *(_QWORD *)(v33 + 32) = 0x44497465737361;
      *(_QWORD *)(v33 + 40) = 0xE700000000000000;
      *(_QWORD *)(v33 + 88) = v30;
      *(_QWORD *)(v33 + 56) = &type metadata for String;
      *(_QWORD *)(v33 + 64) = a4;
      v34 = String._bridgeToObjectiveC()();
      v35 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v33);
      v36 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v34, v35);

      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v37);
      v39 = *(_QWORD *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8));
      v38 = *(_QWORD *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8));
      if (v39 >= v38 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v38 > 1, v39 + 1, 1);
      v40 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v39, v36);
      specialized Array._endMutation()(v40);
    }
    else
    {
      swift_bridgeObjectRelease(a4);
    }
  }
  sub_D854(0, &qword_3E938, NSPredicate_ptr);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage, v41);
  v42 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  v43 = objc_msgSend((id)objc_opt_self(NSCompoundPredicate), "andPredicateWithSubpredicates:", v42);

  objc_msgSend(v18, "setPredicate:", v43);
  if ((a5 & 1) != 0)
  {
    v44 = sub_44F0(&qword_3E920);
    v45 = swift_allocObject(v44, 40, 7);
    *(_OWORD *)(v45 + 16) = xmmword_31640;
    v46 = objc_allocWithZone((Class)NSSortDescriptor);
    v47 = String._bridgeToObjectiveC()();
    v48 = objc_msgSend(v46, "initWithKey:ascending:", v47, 1);

    *(_QWORD *)(v45 + 32) = v48;
    specialized Array._endMutation()(v49);
    sub_D854(0, &qword_3E928, NSSortDescriptor_ptr);
    v50 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v45);
    objc_msgSend(v18, "setSortDescriptors:", v50);

  }
  if (a6 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v18, "setFetchLimit:", a6);
  v51 = type metadata accessor for CDProperty();
  v52 = NSManagedObjectContext.fetch<A>(_:)(v18, v51);
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  swift_bridgeObjectRetain(a10, v53);
  v54 = sub_9470((char *)&_swiftEmptyArrayStorage, v52, a10);
  swift_bridgeObjectRelease(a10);
  a8(v54, 0);
  swift_bridgeObjectRelease(v52);

  return swift_bridgeObjectRelease(v54);
}

uint64_t _s19EngagementCollector10CDPropertyC21fetchCollectionValues22propertyConfigurations8assetIDs15sortByCreatedAt5limit7context10completionySayAA21PropertyConfiguration_pG_ShySSGSgSbSiSo22NSManagedObjectContextCys6ResultOySayAaK_p_AA0R5ValueOtGs5Error_pGctFZ_0(unint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, void (*a6)(char *, _QWORD), uint64_t a7)
{
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  char v25;
  unint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  NSString v37;
  Class isa;
  id v39;
  uint64_t result;
  int64_t v47;
  unint64_t v48;

  v7 = a1;
  if (a1 >> 62)
  {
LABEL_25:
    if (v7 < 0)
      v31 = v7;
    else
      v31 = v7 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v7, a2);
    v8 = _CocoaArrayWrapper.endIndex.getter(v31);
    if (v8)
      goto LABEL_3;
LABEL_29:
    swift_bridgeObjectRelease(v7);
    v33 = swift_bridgeObjectRetain(_swiftEmptyDictionarySingleton, v32);
    v34 = sub_1978C(v33);
    swift_bridgeObjectRelease(_swiftEmptyDictionarySingleton);
    v35 = sub_44F0(&qword_3E8C0);
    v36 = swift_allocObject(v35, 96, 7);
    *(_OWORD *)(v36 + 16) = xmmword_31630;
    *(_QWORD *)(v36 + 56) = &type metadata for String;
    *(_QWORD *)(v36 + 32) = 7955819;
    *(_QWORD *)(v36 + 40) = 0xE300000000000000;
    *(_QWORD *)(v36 + 88) = sub_44F0(&qword_3E948);
    *(_QWORD *)(v36 + 64) = v34;
    swift_bridgeObjectRetain_n(_swiftEmptyDictionarySingleton, 2);
    swift_retain_n(a7, 2);
    swift_retain();
    v37 = String._bridgeToObjectiveC()();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v36);
    v39 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v37, isa);

    sub_9710(v39, 0, 0, a2, a3 & 1, a4, a5, a6, a7, (uint64_t)_swiftEmptyDictionarySingleton);
    swift_release(v34);

    swift_release_n(a7, 2);
    return swift_bridgeObjectRelease_n(_swiftEmptyDictionarySingleton, 3);
  }
  v8 = *(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain(a1, a2);
  if (!v8)
    goto LABEL_29;
LABEL_3:
  v48 = v7 & 0xC000000000000001;
  v9 = 4;
  v47 = v7;
  while (1)
  {
    v12 = v9 - 4;
    if (v48)
    {
      v13 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(v9 - 4, v7);
      v14 = v9 - 3;
      if (__OFADD__(v12, 1))
        goto LABEL_22;
    }
    else
    {
      v13 = (void *)swift_unknownObjectRetain(*(_QWORD *)(v7 + 8 * v9));
      v14 = v9 - 3;
      if (__OFADD__(v12, 1))
      {
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
    }
    v15 = v13;
    v16 = objc_msgSend(v13, "eventName");
    v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16, v17);
    v20 = v19;

    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(_swiftEmptyDictionarySingleton);
    v7 = sub_17024(v18, v20);
    v22 = _swiftEmptyDictionarySingleton[2];
    v23 = (a2 & 1) == 0;
    v24 = v22 + v23;
    if (__OFADD__(v22, v23))
      goto LABEL_23;
    v25 = a2;
    if (_swiftEmptyDictionarySingleton[3] < v24)
      break;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      if ((a2 & 1) != 0)
        goto LABEL_4;
    }
    else
    {
      sub_18954();
      if ((v25 & 1) != 0)
      {
LABEL_4:
        v10 = _swiftEmptyDictionarySingleton[7];
        v11 = *(_QWORD *)(v10 + 8 * v7);
        *(_QWORD *)(v10 + 8 * v7) = v15;
        swift_unknownObjectRelease(v11);
        goto LABEL_5;
      }
    }
LABEL_18:
    _swiftEmptyDictionarySingleton[((unint64_t)v7 >> 6) + 8] |= 1 << v7;
    v27 = (uint64_t *)(_swiftEmptyDictionarySingleton[6] + 16 * v7);
    *v27 = v18;
    v27[1] = v20;
    *(_QWORD *)(_swiftEmptyDictionarySingleton[7] + 8 * v7) = v15;
    v28 = _swiftEmptyDictionarySingleton[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
      goto LABEL_24;
    _swiftEmptyDictionarySingleton[2] = v30;
    swift_bridgeObjectRetain(v20, a2);
LABEL_5:
    swift_bridgeObjectRelease(v20);
    swift_bridgeObjectRelease(0x8000000000000000);
    ++v9;
    v7 = v47;
    if (v14 == v8)
      goto LABEL_29;
  }
  sub_17460(v24, isUniquelyReferenced_nonNull_native);
  v26 = sub_17024(v18, v20);
  if ((v25 & 1) == (a2 & 1))
  {
    v7 = v26;
    if ((v25 & 1) != 0)
      goto LABEL_4;
    goto LABEL_18;
  }
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

void _s19EngagementCollector10CDPropertyC14fetchObjectIDs9startDate03endH010eventNames7context10completiony10Foundation0H0VSg_AMSaySSGSgSo09NSManagedE7ContextCys6ResultOySaySo0oE2IDCGs5Error_pGctFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, _QWORD), uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  NSString v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  NSString v24;
  Class isa;
  id v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id (*v32)(void *, const char *, ...);
  char *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  NSString v37;
  Class v38;
  id v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSString v46;
  Class v47;
  id v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  Class v54;
  id v55;
  id v56;
  NSString v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  Class v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(uint64_t, _QWORD);
  id v73;
  uint64_t v74;
  unint64_t v75;

  v71 = a6;
  v72 = a5;
  v69 = a3;
  v70 = a4;
  v68 = a2;
  sub_44F0(&qword_3EAD0);
  v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v9 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v66 - v10;
  v12 = type metadata accessor for Date(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v67 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v17 = (char *)&v66 - v16;
  v18 = objc_allocWithZone((Class)NSFetchRequest);
  v19 = String._bridgeToObjectiveC()();
  v73 = objc_msgSend(v18, "initWithEntityName:", v19);

  v75 = (unint64_t)&_swiftEmptyArrayStorage;
  sub_D9B4(a1, (uint64_t)v11, &qword_3EAD0);
  v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v20(v11, 1, v12) == 1)
  {
    sub_DB08((uint64_t)v11, &qword_3EAD0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v17, v11, v12);
    v21 = sub_44F0(&qword_3E8C0);
    v22 = swift_allocObject(v21, 96, 7);
    *(_OWORD *)(v22 + 16) = xmmword_31630;
    *(_QWORD *)(v22 + 56) = &type metadata for String;
    *(_QWORD *)(v22 + 32) = 0x4164657461657263;
    *(_QWORD *)(v22 + 40) = 0xE900000000000074;
    *(_QWORD *)(v22 + 88) = v12;
    v23 = sub_D88C((_QWORD *)(v22 + 64));
    (*(void (**)(_QWORD *, char *, uint64_t))(v13 + 16))(v23, v17, v12);
    v24 = String._bridgeToObjectiveC()();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v22);
    v26 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v24, isa);

    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    v28 = *(_QWORD *)((char *)&dword_10 + (v75 & 0xFFFFFFFFFFFFFF8));
    v27 = *(_QWORD *)((char *)&dword_18 + (v75 & 0xFFFFFFFFFFFFFF8));
    if (v28 >= v27 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v27 > 1, v28 + 1, 1);
    v29 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v28, v26);
    specialized Array._endMutation()(v29);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v17, v12);
  }
  sub_D9B4(v68, (uint64_t)v9, &qword_3EAD0);
  if (v20(v9, 1, v12) == 1)
  {
    sub_DB08((uint64_t)v9, &qword_3EAD0);
    v30 = v73;
    v31 = v69;
    v32 = objc_msgSend_setManagerConfiguration_;
    if (!v69)
      goto LABEL_15;
    goto LABEL_12;
  }
  v33 = v67;
  (*(void (**)(void))(v13 + 32))();
  v34 = sub_44F0(&qword_3E8C0);
  v35 = swift_allocObject(v34, 96, 7);
  *(_OWORD *)(v35 + 16) = xmmword_31630;
  *(_QWORD *)(v35 + 56) = &type metadata for String;
  *(_QWORD *)(v35 + 32) = 0x4164657461657263;
  *(_QWORD *)(v35 + 40) = 0xE900000000000074;
  *(_QWORD *)(v35 + 88) = v12;
  v36 = sub_D88C((_QWORD *)(v35 + 64));
  (*(void (**)(_QWORD *, char *, uint64_t))(v13 + 16))(v36, v33, v12);
  v37 = String._bridgeToObjectiveC()();
  v38 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v35);
  v39 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v37, v38);

  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  v41 = *(_QWORD *)((char *)&dword_10 + (v75 & 0xFFFFFFFFFFFFFF8));
  v40 = *(_QWORD *)((char *)&dword_18 + (v75 & 0xFFFFFFFFFFFFFF8));
  v30 = v73;
  if (v41 >= v40 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v40 > 1, v41 + 1, 1);
  v42 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v41, v39);
  specialized Array._endMutation()(v42);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v33, v12);
  v31 = v69;
  v32 = objc_msgSend_setManagerConfiguration_;
  if (v69)
  {
LABEL_12:
    v43 = sub_44F0(&qword_3E8C0);
    v44 = swift_allocObject(v43, 96, 7);
    *(_OWORD *)(v44 + 16) = *((_OWORD *)v32 + 99);
    *(_QWORD *)(v44 + 56) = &type metadata for String;
    *(_QWORD *)(v44 + 32) = 7955819;
    *(_QWORD *)(v44 + 40) = 0xE300000000000000;
    *(_QWORD *)(v44 + 88) = sub_44F0(&qword_3E948);
    *(_QWORD *)(v44 + 64) = v31;
    swift_bridgeObjectRetain(v31, v45);
    v46 = String._bridgeToObjectiveC()();
    v47 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v44);
    v48 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v46, v47);

    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    v50 = *(_QWORD *)((char *)&dword_10 + (v75 & 0xFFFFFFFFFFFFFF8));
    v49 = *(_QWORD *)((char *)&dword_18 + (v75 & 0xFFFFFFFFFFFFFF8));
    if (v50 >= v49 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v49 > 1, v50 + 1, 1);
    v51 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v50, v48);
    specialized Array._endMutation()(v51);
  }
LABEL_15:
  v52 = v75;
  sub_D854(0, &qword_3E938, NSPredicate_ptr);
  swift_bridgeObjectRetain(v52, v53);
  v54 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v52);
  v55 = objc_msgSend((id)objc_opt_self(NSCompoundPredicate), "andPredicateWithSubpredicates:", v54);

  objc_msgSend(v30, "setPredicate:", v55);
  v56 = objc_allocWithZone((Class)NSSortDescriptor);
  v57 = String._bridgeToObjectiveC()();
  v58 = objc_msgSend(v56, "initWithKey:ascending:", v57, 1);

  v59 = sub_44F0(&qword_3E920);
  v60 = swift_allocObject(v59, 40, 7);
  *(_OWORD *)(v60 + 16) = xmmword_31640;
  *(_QWORD *)(v60 + 32) = v58;
  v74 = v60;
  specialized Array._endMutation()(v60);
  v61 = v74;
  sub_D854(0, &qword_3E928, NSSortDescriptor_ptr);
  v62 = v58;
  v63 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v61);
  objc_msgSend(v30, "setSortDescriptors:", v63);

  objc_msgSend(v30, "setResultType:", 1);
  v64 = sub_D854(0, &qword_3E940, NSManagedObjectID_ptr);
  v65 = NSManagedObjectContext.fetch<A>(_:)(v30, v64);
  swift_bridgeObjectRelease(v75);
  v72(v65, 0);
  swift_bridgeObjectRelease(v65);

}

uint64_t sub_AD30(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_44F0(&qword_3E8C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_AD78(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_AD90()
{
  unint64_t result;

  result = qword_3E8D0;
  if (!qword_3E8D0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for PropertyError, &type metadata for PropertyError);
    atomic_store(result, (unint64_t *)&qword_3E8D0);
  }
  return result;
}

uint64_t sub_ADD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t result;

  if (a6 == 1)
  {
    a4 = a2;
  }
  else
  {
    if (a6 != 2)
      return result;
    swift_bridgeObjectRelease(a5);
    a3 = a2;
  }
  swift_bridgeObjectRelease(a3);
  return swift_bridgeObjectRelease(a4);
}

unint64_t sub_AE38()
{
  unint64_t result;

  result = qword_3E8D8;
  if (!qword_3E8D8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for PropertyError, &type metadata for PropertyError);
    atomic_store(result, (unint64_t *)&qword_3E8D8);
  }
  return result;
}

void *sub_AE7C()
{
  return &protocol witness table for ObjectIdentifier;
}

unint64_t sub_AE8C()
{
  unint64_t result;

  result = qword_3E8E0;
  if (!qword_3E8E0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CDProperty.SpecialPlistKeys, &type metadata for CDProperty.SpecialPlistKeys);
    atomic_store(result, (unint64_t *)&qword_3E8E0);
  }
  return result;
}

const char *sub_AED0()
{
  return "count";
}

id sub_AEDC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, "count");
  *a2 = result;
  return result;
}

id sub_AF0C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, "setCount:", *a1);
}

const char *sub_AF20()
{
  return "createdAt";
}

const char *sub_AF34()
{
  return "data";
}

const char *sub_AF48()
{
  return "identifier";
}

void sub_AF54(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_5068(a1, (SEL *)&selRef_identifier, a2);
}

void sub_AF70(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_50C8(a1, a2, a3, a4, (SEL *)&selRef_setIdentifier_);
}

const char *sub_AF8C()
{
  return "key";
}

void sub_AF98(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_5068(a1, (SEL *)&selRef_key, a2);
}

void sub_AFB4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_50C8(a1, a2, a3, a4, (SEL *)&selRef_setKey_);
}

const char *sub_AFD0()
{
  return "assetID";
}

void sub_AFDC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_5068(a1, (SEL *)&selRef_assetID, a2);
}

void sub_AFF8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_50C8(a1, a2, a3, a4, (SEL *)&selRef_setAssetID_);
}

_BYTE *initializeBufferWithCopyOfBuffer for PropertyError(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PropertyError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PropertyError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_B100 + 4 * byte_31685[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_B134 + 4 * byte_31680[v4]))();
}

uint64_t sub_B134(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_B13C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0xB144);
  return result;
}

uint64_t sub_B150(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0xB158);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_B15C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_B164(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_B170(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_B178(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PropertyError()
{
  return &type metadata for PropertyError;
}

uint64_t getEnumTagSinglePayload for CDProperty.SpecialPlistKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CDProperty.SpecialPlistKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_B228 + 4 * byte_3168A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_B248 + 4 * byte_3168F[v4]))();
}

_BYTE *sub_B228(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_B248(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_B250(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_B258(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_B260(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_B268(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_B274()
{
  return 0;
}

ValueMetadata *type metadata accessor for CDProperty.SpecialPlistKeys()
{
  return &type metadata for CDProperty.SpecialPlistKeys;
}

uint64_t sub_B28C(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

void sub_B294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void (*a7)(uint64_t, uint64_t *, uint64_t), uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  id v23;
  NSString v24;
  unsigned int (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  NSString v29;
  Class isa;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unsigned int v36;
  void *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  NSString v43;
  Class v44;
  id v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSString v53;
  Class v54;
  id v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  Class v62;
  id v63;
  id v64;
  NSString v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  Class v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void (*v81)(uint64_t, uint64_t *, uint64_t);
  uint64_t v82;
  id v83;
  uint64_t v84;
  unint64_t v85;

  v81 = a7;
  v82 = a8;
  v79 = a5;
  v80 = a6;
  v77 = a3;
  v78 = a4;
  v76 = a2;
  v11 = sub_44F0(&qword_3EAD0);
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v74 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v74 - v15;
  v17 = type metadata accessor for Date(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = __chkstk_darwin(v17);
  v75 = (char *)&v74 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v22 = (char *)&v74 - v21;
  v23 = objc_allocWithZone((Class)NSFetchRequest);
  v24 = String._bridgeToObjectiveC()();
  v83 = objc_msgSend(v23, "initWithEntityName:", v24);

  v85 = (unint64_t)_swiftEmptyArrayStorage;
  sub_D9B4(a1, (uint64_t)v16, &qword_3EAD0);
  v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  if (v25(v16, 1, v17) == 1)
  {
    sub_DB08((uint64_t)v16, &qword_3EAD0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v22, v16, v17);
    v26 = sub_44F0(&qword_3E8C0);
    v27 = swift_allocObject(v26, 96, 7);
    *(_OWORD *)(v27 + 16) = xmmword_31630;
    *(_QWORD *)(v27 + 56) = &type metadata for String;
    *(_QWORD *)(v27 + 32) = 0x4164657461657263;
    *(_QWORD *)(v27 + 40) = 0xE900000000000074;
    *(_QWORD *)(v27 + 88) = v17;
    v28 = sub_D88C((_QWORD *)(v27 + 64));
    (*(void (**)(_QWORD *, char *, uint64_t))(v18 + 16))(v28, v22, v17);
    v29 = String._bridgeToObjectiveC()();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v27);
    v31 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v29, isa);

    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v32);
    v34 = *(_QWORD *)((char *)&dword_10 + (v85 & 0xFFFFFFFFFFFFFF8));
    v33 = *(_QWORD *)((char *)&dword_18 + (v85 & 0xFFFFFFFFFFFFFF8));
    if (v34 >= v33 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v33 > 1, v34 + 1, 1);
    v35 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v34, v31);
    specialized Array._endMutation()(v35);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v22, v17);
  }
  sub_D9B4(v76, (uint64_t)v14, &qword_3EAD0);
  v36 = v25(v14, 1, v17);
  v37 = v83;
  if (v36 == 1)
  {
    sub_DB08((uint64_t)v14, &qword_3EAD0);
    v38 = v77;
  }
  else
  {
    v39 = v75;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v75, v14, v17);
    v40 = sub_44F0(&qword_3E8C0);
    v41 = swift_allocObject(v40, 96, 7);
    *(_OWORD *)(v41 + 16) = xmmword_31630;
    *(_QWORD *)(v41 + 56) = &type metadata for String;
    *(_QWORD *)(v41 + 32) = 0x4164657461657263;
    *(_QWORD *)(v41 + 40) = 0xE900000000000074;
    *(_QWORD *)(v41 + 88) = v17;
    v42 = sub_D88C((_QWORD *)(v41 + 64));
    (*(void (**)(_QWORD *, char *, uint64_t))(v18 + 16))(v42, v39, v17);
    v43 = String._bridgeToObjectiveC()();
    v44 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v41);
    v45 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v43, v44);

    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v46);
    v48 = *(_QWORD *)((char *)&dword_10 + (v85 & 0xFFFFFFFFFFFFFF8));
    v47 = *(_QWORD *)((char *)&dword_18 + (v85 & 0xFFFFFFFFFFFFFF8));
    if (v48 >= v47 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v47 > 1, v48 + 1, 1);
    v49 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v48, v45);
    specialized Array._endMutation()(v49);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v39, v17);
    v38 = v77;
  }
  if (v38)
  {
    v50 = sub_44F0(&qword_3E8C0);
    v51 = swift_allocObject(v50, 96, 7);
    *(_OWORD *)(v51 + 16) = xmmword_31630;
    *(_QWORD *)(v51 + 56) = &type metadata for String;
    *(_QWORD *)(v51 + 32) = 7955819;
    *(_QWORD *)(v51 + 40) = 0xE300000000000000;
    *(_QWORD *)(v51 + 88) = sub_44F0(&qword_3E948);
    *(_QWORD *)(v51 + 64) = v38;
    swift_bridgeObjectRetain(v38, v52);
    v53 = String._bridgeToObjectiveC()();
    v54 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v51);
    v55 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v53, v54);

    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v56);
    v58 = *(_QWORD *)((char *)&dword_10 + (v85 & 0xFFFFFFFFFFFFFF8));
    v57 = *(_QWORD *)((char *)&dword_18 + (v85 & 0xFFFFFFFFFFFFFF8));
    if (v58 >= v57 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v57 > 1, v58 + 1, 1);
    v59 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v58, v55);
    specialized Array._endMutation()(v59);
  }
  v60 = v85;
  sub_D854(0, &qword_3E938, NSPredicate_ptr);
  swift_bridgeObjectRetain(v60, v61);
  v62 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v60);
  v63 = objc_msgSend((id)objc_opt_self(NSCompoundPredicate), "andPredicateWithSubpredicates:", v62);

  objc_msgSend(v37, "setPredicate:", v63);
  v64 = objc_allocWithZone((Class)NSSortDescriptor);
  v65 = String._bridgeToObjectiveC()();
  v66 = objc_msgSend(v64, "initWithKey:ascending:", v65, 1);

  v67 = sub_44F0(&qword_3E920);
  v68 = swift_allocObject(v67, 40, 7);
  *(_OWORD *)(v68 + 16) = xmmword_31640;
  *(_QWORD *)(v68 + 32) = v66;
  v84 = v68;
  specialized Array._endMutation()(v68);
  v69 = v84;
  sub_D854(0, &qword_3E928, NSSortDescriptor_ptr);
  v70 = v66;
  v71 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v69);
  objc_msgSend(v37, "setSortDescriptors:", v71);

  objc_msgSend(v37, "setResultType:", 1);
  v72 = sub_D854(0, &qword_3E940, NSManagedObjectID_ptr);
  v73 = NSManagedObjectContext.fetch<A>(_:)(v37, v72);
  swift_bridgeObjectRelease(v85);
  sub_2294C(v73, 0, v79, v80, v81, v82, a9, a10);
  swift_bridgeObjectRelease(v73);

}

void sub_BCFC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t (*a10)(void *, void *, char *, _BYTE *), uint64_t a11, uint64_t (*a12)(uint64_t, uint64_t), uint64_t a13)
{
  id v19;
  NSString v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSString v25;
  Class isa;
  id v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSString v36;
  Class v37;
  id v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  Class v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  NSString v48;
  id v49;
  uint64_t v50;
  Class v51;
  uint64_t v52;
  uint64_t v53;

  v19 = objc_allocWithZone((Class)NSFetchRequest);
  v20 = String._bridgeToObjectiveC()();
  v21 = objc_msgSend(v19, "initWithEntityName:", v20);

  objc_msgSend(v21, "setPredicate:", a1);
  if (a3)
  {
    v22 = sub_44F0(&qword_3E8C0);
    v23 = swift_allocObject(v22, 96, 7);
    *(_OWORD *)(v23 + 16) = xmmword_31630;
    *(_QWORD *)(v23 + 32) = 0x696669746E656469;
    *(_QWORD *)(v23 + 40) = 0xEA00000000007265;
    *(_QWORD *)(v23 + 88) = &type metadata for String;
    *(_QWORD *)(v23 + 56) = &type metadata for String;
    *(_QWORD *)(v23 + 64) = a2;
    *(_QWORD *)(v23 + 72) = a3;
    swift_bridgeObjectRetain(a3, v24);
    v25 = String._bridgeToObjectiveC()();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v23);
    v27 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v25, isa);

  }
  else
  {
    v27 = a1;
  }
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  v29 = *(_QWORD *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8));
  v28 = *(_QWORD *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8));
  if (v29 >= v28 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v28 > 1, v29 + 1, 1);
  v30 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v29, v27);
  specialized Array._endMutation()(v30);
  if (a4)
  {
    swift_bridgeObjectRetain(a4, v31);
    v32 = sub_44F0(&qword_3E960);
    v33 = sub_D974(&qword_3E968, &qword_3E960, (uint64_t)&protocol conformance descriptor for Set<A>);
    if ((Collection.isNotEmpty.getter(v32, v33) & 1) != 0)
    {
      v34 = sub_44F0(&qword_3E8C0);
      v35 = swift_allocObject(v34, 96, 7);
      *(_OWORD *)(v35 + 16) = xmmword_31630;
      *(_QWORD *)(v35 + 32) = 0x44497465737361;
      *(_QWORD *)(v35 + 40) = 0xE700000000000000;
      *(_QWORD *)(v35 + 88) = v32;
      *(_QWORD *)(v35 + 56) = &type metadata for String;
      *(_QWORD *)(v35 + 64) = a4;
      v36 = String._bridgeToObjectiveC()();
      v37 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v35);
      v38 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v36, v37);

      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v40 = *(_QWORD *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8));
      v39 = *(_QWORD *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8));
      if (v40 >= v39 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v39 > 1, v40 + 1, 1);
      v41 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v40, v38);
      specialized Array._endMutation()(v41);
    }
    else
    {
      swift_bridgeObjectRelease(a4);
    }
  }
  sub_D854(0, &qword_3E938, NSPredicate_ptr);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage, v42);
  v43 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  v44 = objc_msgSend((id)objc_opt_self(NSCompoundPredicate), "andPredicateWithSubpredicates:", v43);

  objc_msgSend(v21, "setPredicate:", v44);
  if ((a5 & 1) != 0)
  {
    v45 = sub_44F0(&qword_3E920);
    v46 = swift_allocObject(v45, 40, 7);
    *(_OWORD *)(v46 + 16) = xmmword_31640;
    v47 = objc_allocWithZone((Class)NSSortDescriptor);
    v48 = String._bridgeToObjectiveC()();
    v49 = objc_msgSend(v47, "initWithKey:ascending:", v48, 1);

    *(_QWORD *)(v46 + 32) = v49;
    specialized Array._endMutation()(v50);
    sub_D854(0, &qword_3E928, NSSortDescriptor_ptr);
    v51 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v46);
    objc_msgSend(v21, "setSortDescriptors:", v51);

  }
  if (a6 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v21, "setFetchLimit:", a6);
  v52 = type metadata accessor for CDProperty();
  v53 = NSManagedObjectContext.fetch<A>(_:)(v21, v52);
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  sub_6CA4(v53, 0, a8, a9, a10, a11, a12, a13);
  swift_bridgeObjectRelease(v53);

}

uint64_t sub_C540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t (*a9)(void *, void *, char *, _BYTE *), uint64_t a10, uint64_t (*a11)(uint64_t, uint64_t), uint64_t a12)
{
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSString v25;
  NSArray v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v33;

  swift_bridgeObjectRetain(a7, a2);
  swift_unknownObjectRetain(a8);
  swift_retain(a10);
  swift_retain(a12);
  v18 = sub_44F0(&qword_3E948);
  v19 = sub_D974(&qword_3E958, &qword_3E948, (uint64_t)&protocol conformance descriptor for [A]);
  v20 = Collection.isNotEmpty.getter(v18, v19);
  v21 = sub_44F0(&qword_3E8C0);
  if ((v20 & 1) != 0)
  {
    v33 = a6;
    v22 = swift_allocObject(v21, 160, 7);
    *(_OWORD *)(v22 + 16) = xmmword_31650;
    *(_QWORD *)(v22 + 32) = 7955819;
    *(_QWORD *)(v22 + 40) = 0xE300000000000000;
    *(_QWORD *)(v22 + 56) = &type metadata for String;
    *(_QWORD *)(v22 + 64) = a1;
    *(_QWORD *)(v22 + 72) = a2;
    *(_QWORD *)(v22 + 88) = &type metadata for String;
    *(_QWORD *)(v22 + 96) = 0x696669746E656469;
    *(_QWORD *)(v22 + 104) = 0xEA00000000007265;
    *(_QWORD *)(v22 + 152) = v18;
    *(_QWORD *)(v22 + 120) = &type metadata for String;
    *(_QWORD *)(v22 + 128) = a3;
    swift_bridgeObjectRetain(a2, v23);
    swift_bridgeObjectRetain(a3, v24);
    v25 = String._bridgeToObjectiveC()();
    v26.super.isa = Array._bridgeToObjectiveC()().super.isa;
    v27 = v22;
    a6 = v33;
  }
  else
  {
    v28 = swift_allocObject(v21, 96, 7);
    *(_OWORD *)(v28 + 16) = xmmword_31630;
    *(_QWORD *)(v28 + 32) = 7955819;
    *(_QWORD *)(v28 + 40) = 0xE300000000000000;
    *(_QWORD *)(v28 + 88) = &type metadata for String;
    *(_QWORD *)(v28 + 56) = &type metadata for String;
    *(_QWORD *)(v28 + 64) = a1;
    *(_QWORD *)(v28 + 72) = a2;
    swift_bridgeObjectRetain(a2, v29);
    v25 = String._bridgeToObjectiveC()();
    v26.super.isa = Array._bridgeToObjectiveC()().super.isa;
    v27 = v28;
  }
  swift_bridgeObjectRelease(v27);
  v30 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v25, v26.super.isa);

  swift_bridgeObjectRetain(a7, v31);
  swift_unknownObjectRetain(a8);
  swift_retain(a10);
  swift_retain(a12);
  sub_BCFC(v30, 0, 0, a4, 0, a5, a6, a7, a8, a9, a10, a11, a12);

  swift_bridgeObjectRelease_n(a7, 2);
  swift_unknownObjectRelease_n(a8, 2);
  swift_release_n(a10, 2);
  return swift_release_n(a12, 2);
}

uint64_t sub_C818(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;

  v12 = (_QWORD *)swift_allocObject(&unk_38F50, 40, 7);
  v12[2] = a4;
  v12[3] = a5;
  v12[4] = a6;
  v13 = swift_allocObject(&unk_38F78, 24, 7);
  v14 = v13;
  *(_QWORD *)(v13 + 16) = a3;
  v15 = *(_QWORD *)(a1 + 16);
  if (!v15)
  {
    swift_unknownObjectRetain(a2);
    v38 = a3;
    v23 = (char *)&_swiftEmptyArrayStorage;
    v37 = (uint64_t)a3;
    goto LABEL_19;
  }
  v46 = v13;
  v49 = v12;
  v16 = sub_44F0(&qword_3E950);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = a1 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
  v19 = a1;
  v20 = *(_QWORD *)(v17 + 72);
  swift_unknownObjectRetain_n(a2, 2);
  v47 = (uint64_t)a3;
  v21 = a3;
  v48 = v19;
  swift_bridgeObjectRetain(v19, v22);
  v23 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    v24 = v18 + *(int *)(v16 + 48);
    v25 = *(_QWORD *)v24;
    v26 = *(_QWORD *)(v24 + 8);
    v27 = *(unsigned __int8 *)(v24 + 40);
    if (objc_msgSend((id)swift_unknownObjectRetain(a2), "recordType") == (char *)&dword_0 + 2 && v27 == 2)
    {
      swift_bridgeObjectRetain(v26, v28);
      swift_unknownObjectRelease(a2);
      if (!v26)
        goto LABEL_4;
    }
    else
    {
      v30 = objc_msgSend(a2, "identifier");
      if (!v30)
      {
        swift_unknownObjectRelease(a2);
        goto LABEL_4;
      }
      v32 = v30;
      v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30, v31);
      v26 = v33;
      swift_unknownObjectRelease(a2);

    }
    if ((swift_isUniquelyReferenced_nonNull_native(v23) & 1) == 0)
      v23 = sub_239CC(0, *((_QWORD *)v23 + 2) + 1, 1, v23);
    v35 = *((_QWORD *)v23 + 2);
    v34 = *((_QWORD *)v23 + 3);
    if (v35 >= v34 >> 1)
      v23 = sub_239CC((char *)(v34 > 1), v35 + 1, 1, v23);
    *((_QWORD *)v23 + 2) = v35 + 1;
    v36 = &v23[16 * v35];
    *((_QWORD *)v36 + 4) = v25;
    *((_QWORD *)v36 + 5) = v26;
LABEL_4:
    v18 += v20;
    --v15;
  }
  while (v15);
  swift_unknownObjectRelease(a2);
  a1 = v48;
  swift_bridgeObjectRelease(v48);
  v12 = v49;
  v14 = v46;
  v37 = v47;
LABEL_19:
  swift_unknownObjectRelease(a2);
  v39 = objc_msgSend(a2, "eventName");
  v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(v39, v40);
  v43 = v42;

  swift_unknownObjectRetain(a2);
  swift_bridgeObjectRetain(a1, v44);
  swift_retain(v14);
  swift_retain(v12);
  sub_C540(v41, v43, (uint64_t)v23, 0, 0, v37, a1, a2, (uint64_t (*)(void *, void *, char *, _BYTE *))sub_D928, v14, (uint64_t (*)(uint64_t, uint64_t))sub_D8F4, (uint64_t)v12);
  swift_bridgeObjectRelease(v23);
  swift_bridgeObjectRelease(v43);
  swift_bridgeObjectRelease(a1);
  swift_unknownObjectRelease(a2);
  swift_release_n(v14, 2);
  return swift_release_n(v12, 2);
}

uint64_t sub_CB14(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  Class isa;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD v24[3];
  _BYTE v25[16];
  uint64_t v26;
  _OWORD v27[2];
  _BYTE v28[16];
  uint64_t v29;
  uint64_t v30;
  unsigned __int8 v31;

  sub_D9F8(a1, (uint64_t)v28);
  v2 = v31;
  if (v31)
  {
    v3 = &v29;
    if (v31 != 1)
      v3 = &v30;
    v26 = swift_bridgeObjectRetain(*v3, v1);
    sub_830C(0x44497465737361, 0xE700000000000000, v27);
    sub_DB08((uint64_t)v27, &qword_3E978);
    v5 = sub_7B58(v26, v4);
    swift_bridgeObjectRelease(v26);
    v6 = objc_allocWithZone((Class)NSDictionary);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v5);
    v8 = objc_msgSend(v6, "initWithDictionary:", isa);

    v9 = (void *)objc_opt_self(NSJSONSerialization);
    *(_QWORD *)&v27[0] = 0;
    v10 = objc_msgSend(v9, "dataWithJSONObject:options:error:", v8, 1, v27);
    v11 = *(id *)&v27[0];
    if (v10)
    {
      v2 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v10);

    }
    else
    {
      v12 = v11;
      v13 = _convertNSErrorToError(_:)(v11);

      swift_willThrow();
      if (qword_3E6A0 != -1)
        swift_once(&qword_3E6A0, sub_10B64);
      v14 = type metadata accessor for Logger(0);
      sub_AD78(v14, (uint64_t)qword_3FA80);
      swift_errorRetain(v13);
      v15 = swift_errorRetain(v13);
      v16 = Logger.logObject.getter(v15);
      v17 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = (uint8_t *)swift_slowAlloc(12, -1);
        v19 = swift_slowAlloc(32, -1);
        *(_QWORD *)&v27[0] = v19;
        *(_DWORD *)v18 = 136315138;
        swift_getErrorValue(v13, v25, v24);
        v20 = Error.localizedDescription.getter(v24[1], v24[2]);
        v22 = v21;
        v26 = sub_282C4(v20, v21, (uint64_t *)v27);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, v27, v18 + 4, v18 + 12);
        swift_bridgeObjectRelease(v22);
        swift_errorRelease(v13);
        swift_errorRelease(v13);
        _os_log_impl(&dword_0, v16, v17, "Could not convert StatePropertyValue to a valid JSON data object: %s", v18, 0xCu);
        swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v19, -1, -1);
        swift_slowDealloc(v18, -1, -1);

        swift_errorRelease(v13);
      }
      else
      {
        swift_errorRelease(v13);
        swift_errorRelease(v13);
        swift_errorRelease(v13);

      }
      return 0;
    }
  }
  return v2;
}

uint64_t sub_CE64(uint64_t a1, uint64_t a2)
{
  id v4;
  NSString v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;
  Class isa;
  id v12;
  id v13;
  NSString v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  Class v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v4 = objc_allocWithZone((Class)NSFetchRequest);
  v5 = String._bridgeToObjectiveC()();
  v6 = objc_msgSend(v4, "initWithEntityName:", v5);

  v7 = sub_44F0(&qword_3E8C0);
  v8 = swift_allocObject(v7, 96, 7);
  *(_OWORD *)(v8 + 16) = xmmword_31630;
  *(_QWORD *)(v8 + 32) = 7955819;
  *(_QWORD *)(v8 + 40) = 0xE300000000000000;
  *(_QWORD *)(v8 + 88) = &type metadata for String;
  *(_QWORD *)(v8 + 56) = &type metadata for String;
  *(_QWORD *)(v8 + 64) = a1;
  *(_QWORD *)(v8 + 72) = a2;
  swift_bridgeObjectRetain(a2, v9);
  v10 = String._bridgeToObjectiveC()();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  v12 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v10, isa);

  objc_msgSend(v6, "setPredicate:", v12);
  v13 = objc_allocWithZone((Class)NSSortDescriptor);
  v14 = String._bridgeToObjectiveC()();
  v15 = objc_msgSend(v13, "initWithKey:ascending:", v14, 1);

  v16 = sub_44F0(&qword_3E920);
  v17 = swift_allocObject(v16, 40, 7);
  *(_OWORD *)(v17 + 16) = xmmword_31640;
  *(_QWORD *)(v17 + 32) = v15;
  v23 = v17;
  specialized Array._endMutation()(v17);
  sub_D854(0, &qword_3E928, NSSortDescriptor_ptr);
  v18 = v15;
  v19 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v23);
  objc_msgSend(v6, "setSortDescriptors:", v19);

  v20 = type metadata accessor for CDProperty();
  v21 = NSManagedObjectContext.fetch<A>(_:)(v6, v20);

  return v21;
}

uint64_t sub_D3A4(uint64_t a1, uint64_t a2)
{
  id v4;
  NSString v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;
  Class isa;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v4 = objc_allocWithZone((Class)NSFetchRequest);
  v5 = String._bridgeToObjectiveC()();
  v6 = objc_msgSend(v4, "initWithEntityName:", v5);

  v7 = sub_44F0(&qword_3E8C0);
  v8 = swift_allocObject(v7, 96, 7);
  *(_OWORD *)(v8 + 16) = xmmword_31630;
  *(_QWORD *)(v8 + 32) = 7955819;
  *(_QWORD *)(v8 + 40) = 0xE300000000000000;
  *(_QWORD *)(v8 + 88) = &type metadata for String;
  *(_QWORD *)(v8 + 56) = &type metadata for String;
  *(_QWORD *)(v8 + 64) = a1;
  *(_QWORD *)(v8 + 72) = a2;
  swift_bridgeObjectRetain(a2, v9);
  v10 = String._bridgeToObjectiveC()();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  v12 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v10, isa);

  objc_msgSend(v6, "setPredicate:", v12);
  v13 = type metadata accessor for CDProperty();
  v14 = NSManagedObjectContext.count<A>(for:)(v6, v13);

  return v14;
}

uint64_t sub_D854(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

_QWORD *sub_D88C(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

uint64_t sub_D8C8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_D8F4(uint64_t a1, char a2)
{
  uint64_t v2;

  return sub_21B98(a1, a2 & 1, *(_QWORD *)(v2 + 16), *(void (**)(uint64_t, uint64_t))(v2 + 24));
}

uint64_t sub_D904()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

id sub_D928(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_6888(a1, a2, a3, a4, *(_QWORD *)(v4 + 16));
}

uint64_t sub_D930(uint64_t *a1)
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

uint64_t sub_D974(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_D930(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_D9B4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_44F0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_D9F8(uint64_t a1, uint64_t a2)
{
  initializeWithTake for PropertyValue(a2, a1);
  return a2;
}

uint64_t sub_DA34(uint64_t a1)
{
  sub_ADD4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  return a1;
}

uint64_t sub_DA68(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return swift_errorRelease();
  else
    return swift_bridgeObjectRelease(a1);
}

uint64_t sub_DA74(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_DA88(result, a2);
  return result;
}

uint64_t sub_DA88(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_DACC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_DB08(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_44F0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *sub_DB44(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_DB54(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

id BMPropertyValue.__allocating_init(with:)(uint64_t a1)
{
  objc_class *v1;
  id v3;
  objc_super v5;
  _BYTE v6[48];
  _BYTE v7[48];

  v3 = objc_allocWithZone(v1);
  sub_AD30(a1, (uint64_t)v6);
  if (v6[40] == 255)
  {
    swift_deallocPartialClassInstance(v3, v1, 49, 7);
    return 0;
  }
  else
  {
    sub_D9F8((uint64_t)v6, (uint64_t)v7);
    sub_D9F8((uint64_t)v7, (uint64_t)v3 + OBJC_IVAR____TtC19EngagementCollector15BMPropertyValue_propertyValue);
    v5.receiver = v3;
    v5.super_class = v1;
    return objc_msgSendSuper2(&v5, "init");
  }
}

id BMPropertyValue.init(with:)(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  objc_super v4;
  _BYTE v5[48];
  _BYTE v6[48];

  sub_AD30(a1, (uint64_t)v5);
  if (v5[40] == 255)
  {
    v3 = type metadata accessor for BMPropertyValue();
    swift_deallocPartialClassInstance(v1, v3, 49, 7);
    return 0;
  }
  else
  {
    sub_D9F8((uint64_t)v5, (uint64_t)v6);
    sub_D9F8((uint64_t)v6, (uint64_t)v1 + OBJC_IVAR____TtC19EngagementCollector15BMPropertyValue_propertyValue);
    v4.receiver = v1;
    v4.super_class = (Class)type metadata accessor for BMPropertyValue();
    return objc_msgSendSuper2(&v4, "init");
  }
}

uint64_t type metadata accessor for BMPropertyValue()
{
  return objc_opt_self(_TtC19EngagementCollector15BMPropertyValue);
}

void BMPropertyValue.init()()
{
  _swift_stdlib_reportUnimplementedInitializer("EngagementCollector.BMPropertyValue", 35, "init()", 6, 0);
  __break(1u);
}

id BMPropertyValue.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BMPropertyValue();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t PropertyValue.description.getter()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  Swift::String v6;
  Swift::String v7;
  Swift::String v8;
  Swift::String v9;
  Swift::String v10;
  uint64_t v11;
  Swift::String v12;
  Swift::String v13;
  Swift::String v14;
  uint64_t v15;
  _QWORD v17[3];
  void *v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD v21[6];
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  _BYTE v27[40];
  char v28;

  sub_D9F8(v0, (uint64_t)v21);
  v2 = v21[0];
  v1 = (void *)v21[1];
  sub_D9F8(v0, (uint64_t)v27);
  if (!v28)
  {
    v5 = (void *)0xE700000000000000;
    v4 = 0x7265746E756F63;
    goto LABEL_13;
  }
  if (v28 == 1)
    v4 = 0x6574617473;
  else
    v4 = 0x697463656C6C6F63;
  if (v28 == 1)
    v5 = (void *)0xE500000000000000;
  else
    v5 = (void *)0xEA00000000006E6FLL;
  if (!v1)
  {
LABEL_13:
    v22 = 0;
    v23 = 0xE000000000000000;
    _StringGuts.grow(_:)(37);
    v19 = v22;
    v20 = v23;
    v12._object = (void *)0x8000000000033010;
    v12._countAndFlagsBits = 0xD000000000000015;
    String.append(_:)(v12);
    v13._countAndFlagsBits = v4;
    v13._object = v5;
    String.append(_:)(v13);
    swift_bridgeObjectRelease(v5);
    v14._countAndFlagsBits = 0x6C6156776172202CLL;
    v14._object = (void *)0xEC000000203A6575;
    String.append(_:)(v14);
    sub_D9F8(v0, (uint64_t)&v22);
    if (v26)
    {
      if (v26 != 1)
        goto LABEL_11;
LABEL_15:
      v11 = v24;
      goto LABEL_16;
    }
LABEL_17:
    v18 = &type metadata for Int;
    v17[0] = v22;
    goto LABEL_18;
  }
  v22 = 0;
  v23 = 0xE000000000000000;
  swift_bridgeObjectRetain(v1, v3);
  _StringGuts.grow(_:)(53);
  v19 = v22;
  v20 = v23;
  v6._object = (void *)0x8000000000033010;
  v6._countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v6);
  v7._countAndFlagsBits = v4;
  v7._object = v5;
  String.append(_:)(v7);
  swift_bridgeObjectRelease(v5);
  v8._countAndFlagsBits = 0x69746E656469202CLL;
  v8._object = (void *)0xEE00203A72656966;
  String.append(_:)(v8);
  v9._countAndFlagsBits = v2;
  v9._object = v1;
  String.append(_:)(v9);
  swift_bridgeObjectRelease(v1);
  v10._countAndFlagsBits = 0x6C6156776172202CLL;
  v10._object = (void *)0xEC000000203A6575;
  String.append(_:)(v10);
  sub_D9F8(v0, (uint64_t)&v22);
  if (!v26)
    goto LABEL_17;
  if (v26 == 1)
    goto LABEL_15;
LABEL_11:
  v11 = v25;
LABEL_16:
  v18 = (void *)sub_44F0(&qword_3E990);
  v17[0] = v11;
  swift_bridgeObjectRetain(v11, v15);
LABEL_18:
  _print_unlocked<A, B>(_:_:)(v17, &v19, (char *)&type metadata for Any + 8, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  sub_DB54(v17);
  return v19;
}

uint64_t PropertyValue.rawValue.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  char v8;

  result = sub_D9F8(v1, (uint64_t)v7);
  if (v8)
  {
    if (v8 == 1)
      v4 = v7[2];
    else
      v4 = v7[4];
    a1[3] = sub_44F0(&qword_3E990);
    *a1 = v4;
    return swift_bridgeObjectRetain(v4, v6);
  }
  else
  {
    v5 = v7[0];
    a1[3] = &type metadata for Int;
    *a1 = v5;
  }
  return result;
}

uint64_t PropertyValue.assetID.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[5];
  unsigned __int8 v5;

  sub_D9F8(v0, (uint64_t)v4);
  if (v5 < 2u)
    return 0;
  v2 = v4[2];
  swift_bridgeObjectRetain(v4[3], v1);
  return v2;
}

uint64_t sub_E0C8()
{
  uint64_t v0;
  uint64_t v2;

  sub_D9F8(v0, (uint64_t)&v2);
  return PropertyValue.description.getter();
}

uint64_t method lookup function for BMPropertyValue(uint64_t a1, uint64_t a2)
{
  return swift_lookUpClassMethod(a1, a2, &nominal type descriptor for BMPropertyValue);
}

uint64_t dispatch thunk of BMPropertyValue.__allocating_init(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t (*v4)(_OWORD *);
  __int128 v5;
  _OWORD v7[2];
  uint64_t v8;
  char v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 40);
  v4 = *(uint64_t (**)(_OWORD *))(v1 + 88);
  v5 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v5;
  v8 = v2;
  v9 = v3;
  return v4(v7);
}

uint64_t initializeBufferWithCopyOfBuffer for PropertyValue(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t sub_E174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t result;

  v6 = a2;
  if (a6 == 1)
  {
    a5 = a2;
    v6 = a3;
  }
  else
  {
    if (a6 != 2)
      return result;
    swift_bridgeObjectRetain(a4, a2);
  }
  swift_bridgeObjectRetain(a5, a2);
  return swift_bridgeObjectRetain(v6, v8);
}

uint64_t destroy for PropertyValue(uint64_t a1)
{
  return sub_ADD4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
}

uint64_t initializeWithCopy for PropertyValue(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_E174(*(_QWORD *)a2, v4, v5, v6, v7, v8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  return a1;
}

uint64_t assignWithCopy for PropertyValue(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_E174(*(_QWORD *)a2, v4, v5, v6, v7, v8);
  v9 = *(_QWORD *)a1;
  v10 = *(_QWORD *)(a1 + 8);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  v14 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v8;
  sub_ADD4(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 initializeWithTake for PropertyValue(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for PropertyValue(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char v11;

  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_BYTE *)(a2 + 40);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_QWORD *)(a1 + 32) = v3;
  v11 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v4;
  sub_ADD4(v5, v7, v6, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for PropertyValue(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PropertyValue(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t sub_E3E4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_E3EC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for PropertyValue()
{
  return &type metadata for PropertyValue;
}

id sub_E458()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CDConfiguration();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CDConfiguration()
{
  return objc_opt_self(BMCDConfiguration);
}

uint64_t sub_E4A8@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for CDConfiguration();
  result = Identifiable<>.id.getter(v4, a1);
  *a2 = result;
  return result;
}

unint64_t sub_E4E4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_44F0(&qword_3E9F0);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_FE74(v7, (uint64_t)&v16);
    v8 = v16;
    v9 = v17;
    result = sub_17024(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_DB44(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 48;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void sub_E60C(void *a1, char a2, uint64_t a3, void *a4, void (*a5)(id, _QWORD))
{
  id v7;
  void *v9;
  NSString v10;
  id v11;
  id v12;
  id v13;

  if ((a2 & 1) == 0)
  {
    v7 = a1;
LABEL_5:
    v12 = objc_msgSend(a4, "eventName");
    objc_msgSend(v7, "setPropertyName:", v12);

    objc_msgSend(v7, "setAgeToExpire:", objc_msgSend(a4, "ageToExpire"));
    objc_msgSend(v7, "setCountLimit:", objc_msgSend(a4, "countLimit"));
    objc_msgSend(v7, "setRecordType:", objc_msgSend(a4, "recordType"));
    objc_msgSend(v7, "setShouldBeSynced:", objc_msgSend(a4, "shouldBeSynced"));
    v13 = v7;
    a5(v7, 0);

    return;
  }
  v9 = (void *)objc_opt_self(NSEntityDescription);
  v10 = String._bridgeToObjectiveC()();
  v11 = objc_msgSend(v9, "entityForName:inManagedObjectContext:", v10, a3);

  if (v11)
  {
    v7 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CDConfiguration()), "initWithEntity:insertIntoManagedObjectContext:", v11, a3);

    goto LABEL_5;
  }
  __break(1u);
}

id sub_E7CC()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  objc_class *v13;
  _BYTE *v14;
  uint64_t *v15;
  _QWORD *v16;
  objc_super v18;

  v1 = v0;
  v2 = objc_msgSend(v0, "propertyName");
  if (v2)
  {
    v4 = v2;
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = objc_msgSend(v1, "ageToExpire");
  v9 = objc_msgSend(v1, "countLimit");
  v10 = objc_msgSend(v1, "recordType");
  v11 = objc_msgSend(v1, "shouldBeSynced");
  if (v7)
  {
    if ((unint64_t)v10 < 3)
    {
      v12 = v11;
      v13 = (objc_class *)type metadata accessor for BasePropertyConfiguration();
      v14 = objc_allocWithZone(v13);
      v15 = (uint64_t *)&v14[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
      *v15 = v5;
      v15[1] = v7;
      *(_QWORD *)&v14[OBJC_IVAR___BMBasePropertyConfiguration_recordType] = v10;
      v16 = &v14[OBJC_IVAR___BMBasePropertyConfiguration_identifier];
      *v16 = 0;
      v16[1] = 0;
      *(_QWORD *)&v14[OBJC_IVAR___BMBasePropertyConfiguration_countLimit] = v9;
      *(_QWORD *)&v14[OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire] = v8;
      v14[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached] = 0;
      v14[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced] = v12;
      v18.receiver = v14;
      v18.super_class = v13;
      return objc_msgSendSuper2(&v18, "init");
    }
    swift_bridgeObjectRelease(v7);
  }
  return 0;
}

uint64_t sub_E94C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v5 = a1;
    else
      v5 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1, a2);
    v3 = _CocoaArrayWrapper.endIndex.getter(v5);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3 = *(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8));
  }
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3, 0, a1);
}

void sub_E9B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void (*a6)(id, _QWORD))
{
  id v10;
  NSString v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString v15;
  Class isa;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t inited;
  unint64_t v29;
  id v30;
  NSString v31;
  Class v32;
  id v33;
  id v34;
  id v36;
  _BYTE v37[80];

  v10 = objc_allocWithZone((Class)NSFetchRequest);
  v11 = String._bridgeToObjectiveC()();
  v36 = objc_msgSend(v10, "initWithEntityName:", v11);

  v12 = sub_44F0(&qword_3E8C0);
  v13 = swift_allocObject(v12, 96, 7);
  *(_OWORD *)(v13 + 16) = xmmword_31630;
  strcpy((char *)(v13 + 32), "propertyName");
  *(_BYTE *)(v13 + 45) = 0;
  *(_WORD *)(v13 + 46) = -5120;
  *(_QWORD *)(v13 + 88) = &type metadata for String;
  *(_QWORD *)(v13 + 56) = &type metadata for String;
  *(_QWORD *)(v13 + 64) = a1;
  *(_QWORD *)(v13 + 72) = a2;
  swift_bridgeObjectRetain(a2, v14);
  v15 = String._bridgeToObjectiveC()();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13);
  v17 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v15, isa);

  objc_msgSend(v36, "setPredicate:", v17);
  objc_msgSend(v36, "setFetchLimit:", 1);
  v18 = type metadata accessor for CDConfiguration();
  v19 = NSManagedObjectContext.fetch<A>(_:)(v36, v18);
  v21 = v19;
  if ((unint64_t)v19 >> 62)
  {
    if (v19 < 0)
      v25 = v19;
    else
      v25 = v19 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v19, v20);
    v26 = _CocoaArrayWrapper.endIndex.getter(v25);
    swift_bridgeObjectRelease(v21);
    if (v26)
      goto LABEL_3;
LABEL_11:
    swift_bridgeObjectRelease(v21);
    v27 = sub_44F0(&qword_3E9E8);
    inited = swift_initStackObject(v27, v37);
    *(_OWORD *)(inited + 16) = xmmword_318F0;
    *(_QWORD *)(inited + 32) = 0xD000000000000014;
    *(_QWORD *)(inited + 40) = 0x80000000000330F0;
    *(_QWORD *)(inited + 72) = &type metadata for String;
    *(_QWORD *)(inited + 48) = 0xD000000000000017;
    *(_QWORD *)(inited + 56) = 0x8000000000033110;
    v29 = sub_E4E4(inited);
    v30 = objc_allocWithZone((Class)NSError);
    v31 = String._bridgeToObjectiveC()();
    v32 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v29);
    v33 = objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 1002, v32);

    v34 = v33;
    sub_E60C(v33, 1, a4, a5, a6);

    return;
  }
  if (!*(_QWORD *)((char *)&dword_10 + (v19 & 0xFFFFFFFFFFFFF8)))
    goto LABEL_11;
LABEL_3:
  if ((v21 & 0xC000000000000001) != 0)
  {
    v22 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v21);
    goto LABEL_6;
  }
  if (*(_QWORD *)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFF8)))
  {
    v22 = *(id *)(v21 + 32);
LABEL_6:
    v23 = v22;
    swift_bridgeObjectRelease(v21);
    v24 = v23;
    sub_E60C(v23, 0, a4, a5, a6);

    return;
  }
  __break(1u);
}

void sub_F048(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(id, uint64_t))
{
  id v7;
  NSString v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSString v13;
  Class isa;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t inited;
  unint64_t v27;
  id v28;
  NSString v29;
  Class v30;
  id v31;
  id v32;
  id v33;
  _BYTE v34[80];

  v7 = objc_allocWithZone((Class)NSFetchRequest);
  v8 = String._bridgeToObjectiveC()();
  v9 = objc_msgSend(v7, "initWithEntityName:", v8);

  v10 = sub_44F0(&qword_3E8C0);
  v11 = swift_allocObject(v10, 96, 7);
  *(_OWORD *)(v11 + 16) = xmmword_31630;
  strcpy((char *)(v11 + 32), "propertyName");
  *(_BYTE *)(v11 + 45) = 0;
  *(_WORD *)(v11 + 46) = -5120;
  *(_QWORD *)(v11 + 88) = &type metadata for String;
  *(_QWORD *)(v11 + 56) = &type metadata for String;
  *(_QWORD *)(v11 + 64) = a1;
  *(_QWORD *)(v11 + 72) = a2;
  swift_bridgeObjectRetain(a2, v12);
  v13 = String._bridgeToObjectiveC()();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v11);
  v15 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v13, isa);

  objc_msgSend(v9, "setPredicate:", v15);
  objc_msgSend(v9, "setFetchLimit:", 1);
  v16 = type metadata accessor for CDConfiguration();
  v17 = NSManagedObjectContext.fetch<A>(_:)(v9, v16);
  v19 = v17;
  if ((unint64_t)v17 >> 62)
  {
    if (v17 < 0)
      v23 = v17;
    else
      v23 = v17 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v17, v18);
    v24 = _CocoaArrayWrapper.endIndex.getter(v23);
    swift_bridgeObjectRelease(v19);
    if (v24)
      goto LABEL_3;
LABEL_11:
    swift_bridgeObjectRelease(v19);
    v25 = sub_44F0(&qword_3E9E8);
    inited = swift_initStackObject(v25, v34);
    *(_OWORD *)(inited + 16) = xmmword_318F0;
    *(_QWORD *)(inited + 32) = 0xD000000000000014;
    *(_QWORD *)(inited + 40) = 0x80000000000330F0;
    *(_QWORD *)(inited + 72) = &type metadata for String;
    *(_QWORD *)(inited + 48) = 0xD000000000000017;
    *(_QWORD *)(inited + 56) = 0x8000000000033110;
    v27 = sub_E4E4(inited);
    v28 = objc_allocWithZone((Class)NSError);
    v29 = String._bridgeToObjectiveC()();
    v30 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v27);
    v31 = objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 1002, v30);

    v32 = v31;
    a4(v31, 1);

    return;
  }
  if (!*(_QWORD *)((char *)&dword_10 + (v17 & 0xFFFFFFFFFFFFF8)))
    goto LABEL_11;
LABEL_3:
  if ((v19 & 0xC000000000000001) != 0)
  {
    v20 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v19);
    goto LABEL_6;
  }
  if (*(_QWORD *)((char *)&dword_10 + (v19 & 0xFFFFFFFFFFFFF8)))
  {
    v20 = *(id *)(v19 + 32);
LABEL_6:
    v21 = v20;
    swift_bridgeObjectRelease(v19);
    v22 = v21;
    v33 = sub_E7CC();
    a4(v33, 0);

    return;
  }
  __break(1u);
}

void sub_F6B8(uint64_t a1, void (*a2)(uint64_t, uint64_t))
{
  id v3;
  NSString v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = objc_allocWithZone((Class)NSFetchRequest);
  v4 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend(v3, "initWithEntityName:", v4);

  v5 = type metadata accessor for CDConfiguration();
  v6 = NSManagedObjectContext.fetch<A>(_:)(v7, v5);
  sub_2676C(v6, 0, a2);
  swift_bridgeObjectRelease(v6);

}

void sub_FA7C(uint64_t a1, void (*a2)(uint64_t, _QWORD))
{
  id v3;
  NSString v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = objc_allocWithZone((Class)NSFetchRequest);
  v4 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend(v3, "initWithEntityName:", v4);

  v5 = type metadata accessor for CDConfiguration();
  v6 = NSManagedObjectContext.fetch<A>(_:)(v7, v5);
  a2(v6, 0);
  swift_bridgeObjectRelease(v6);

}

unint64_t sub_FE38()
{
  unint64_t result;
  uint64_t v1;

  result = qword_3E930;
  if (!qword_3E930)
  {
    v1 = objc_opt_self(NSError);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_3E930);
  }
  return result;
}

uint64_t sub_FE74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_44F0(&qword_3E9F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_FEBC(uint64_t a1, void *a2)
{
  id v4;
  NSString v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_class *v23;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  id v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _BOOL8 v48;
  uint64_t v49;
  char v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  BOOL v56;
  uint64_t v57;
  uint64_t result;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  unint64_t v64;
  unint64_t v65;
  __objc2_prot_list **p_base_prots;
  char **p_attr;
  void *v68;
  unint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  NSString v81;
  id v82;
  id v83;
  id v84;
  id v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  char *v90;
  id v91;
  id v92;
  unsigned int v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  uint64_t v106;
  id v107;
  NSObject *v108;
  os_log_type_t v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  id v126;
  _QWORD *v127;
  uint64_t v128;
  id v129;
  objc_class *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  _QWORD *v136;
  uint64_t v137;

  v4 = objc_allocWithZone((Class)NSFetchRequest);
  v5 = String._bridgeToObjectiveC()();
  v6 = objc_msgSend(v4, "initWithEntityName:", v5);

  v7 = type metadata accessor for CDConfiguration();
  v8 = NSManagedObjectContext.fetch<A>(_:)(v6, v7);
  v21 = v8;
  v130 = (objc_class *)v7;
  v126 = v6;
  v128 = a1;
  if ((unint64_t)v8 >> 62)
  {
    if (v8 < 0)
      v122 = v8;
    else
      v122 = v8 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v8, v9);
    v22 = _CocoaArrayWrapper.endIndex.getter(v122);
    swift_bridgeObjectRelease(v21);
  }
  else
  {
    v22 = *(_QWORD *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFF8));
  }
  v23 = (objc_class *)v7;
  v133 = a2;
  if (v22)
  {
    if (v22 < 1)
    {
LABEL_123:
      __break(1u);
LABEL_124:
      __break(1u);
LABEL_125:
      __break(1u);
LABEL_126:
      __break(1u);
LABEL_127:
      _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
      __break(1u);
LABEL_128:
      result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
      return result;
    }
    v24 = 0;
    v25 = &_swiftEmptyDictionarySingleton;
    v131 = v22;
    while (1)
    {
      v26 = (v21 & 0xC000000000000001) != 0
          ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v24, v21)
          : *(id *)(v21 + 8 * v24 + 32);
      v27 = v26;
      v28 = objc_msgSend(v26, "propertyName");
      if (v28)
        break;

LABEL_10:
      if (v22 == ++v24)
        goto LABEL_38;
    }
    v30 = v28;
    v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28, v29);
    v33 = v32;

    if (v25[2])
    {
      swift_bridgeObjectRetain(v33, v34);
      v35 = sub_17024(v31, (uint64_t)v33);
      v37 = (unint64_t)&_swiftEmptyArrayStorage;
      if ((v36 & 1) != 0)
      {
        v37 = *(_QWORD *)(v25[7] + 8 * v35);
        swift_bridgeObjectRetain(v37, v36);
      }
      swift_bridgeObjectRelease(v33);
    }
    else
    {
      v37 = (unint64_t)&_swiftEmptyArrayStorage;
    }
    v137 = v37;
    v38 = v27;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v38);
    v40 = *(_QWORD *)((char *)&dword_10 + (v37 & 0xFFFFFFFFFFFFFF8));
    v39 = *(_QWORD *)((char *)&dword_18 + (v37 & 0xFFFFFFFFFFFFFF8));
    if (v40 >= v39 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v39 > 1, v40 + 1, 1);
    v41 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v40, v38);
    specialized Array._endMutation()(v41);
    v42 = v137;
    v43 = (uint64_t)v25;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v25);
    v136 = (_QWORD *)v43;
    v46 = sub_17024(v31, (uint64_t)v33);
    v47 = *(_QWORD *)(v43 + 16);
    v48 = (v45 & 1) == 0;
    v49 = v47 + v48;
    if (__OFADD__(v47, v48))
      goto LABEL_111;
    v50 = v45;
    if (*(_QWORD *)(v43 + 24) < v49)
    {
      sub_17A5C(v49, isUniquelyReferenced_nonNull_native);
      v51 = sub_17024(v31, (uint64_t)v33);
      if ((v50 & 1) != (v45 & 1))
        goto LABEL_128;
      v46 = v51;
      v25 = v136;
      if ((v50 & 1) == 0)
        goto LABEL_31;
LABEL_29:
      v52 = v25[7];
      v53 = 8 * v46;
      swift_bridgeObjectRelease(*(_QWORD *)(v52 + v53));
      *(_QWORD *)(v52 + v53) = v137;
LABEL_33:

      swift_bridgeObjectRelease(v33);
      swift_bridgeObjectRelease(0x8000000000000000);
      v23 = v130;
      v22 = v131;
      goto LABEL_10;
    }
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      v25 = v136;
      if ((v45 & 1) != 0)
        goto LABEL_29;
    }
    else
    {
      sub_18CBC();
      v25 = v136;
      if ((v50 & 1) != 0)
        goto LABEL_29;
    }
LABEL_31:
    v25[(v46 >> 6) + 8] |= 1 << v46;
    v54 = (uint64_t *)(v25[6] + 16 * v46);
    *v54 = v31;
    v54[1] = (uint64_t)v33;
    *(_QWORD *)(v25[7] + 8 * v46) = v42;
    v55 = v25[2];
    v56 = __OFADD__(v55, 1);
    v57 = v55 + 1;
    if (v56)
      goto LABEL_112;
    v25[2] = v57;
    swift_bridgeObjectRetain(v33, v45);
    goto LABEL_33;
  }
  v25 = &_swiftEmptyDictionarySingleton;
LABEL_38:
  v127 = v25;
  swift_bridgeObjectRelease(v21);
  if ((unint64_t)v128 >> 62)
  {
    if (v128 < 0)
      v123 = v128;
    else
      v123 = v128 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v128, v59);
    v60 = _CocoaArrayWrapper.endIndex.getter(v123);
  }
  else
  {
    v60 = *(_QWORD *)((char *)&dword_10 + (v128 & 0xFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain(v128, v59);
  }
  v61 = v133;
  v62 = v128;
  v63 = v126;
  if (!v60)
  {
LABEL_108:
    v121 = v62;

    swift_bridgeObjectRelease(v121);
    swift_bridgeObjectRelease(v127);
    return 0;
  }
  v64 = 0;
  v65 = v128 & 0xC000000000000001;
  p_base_prots = (__objc2_prot_list **)(&BMInternalManagerConfiguration__classData + 40);
  p_attr = (char **)(&stru_3CFF8 + 8);
  v124 = v60;
  while (1)
  {
    if (v65)
    {
      v68 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(v64, v62);
      v56 = __OFADD__(v64, 1);
      v69 = v64 + 1;
      if (v56)
        goto LABEL_121;
    }
    else
    {
      if (v64 >= *(_QWORD *)((char *)&dword_10 + (v128 & 0xFFFFFFFFFFFFFF8)))
        goto LABEL_125;
      v68 = (void *)swift_unknownObjectRetain(*(_QWORD *)(v128 + 32 + 8 * v64));
      v56 = __OFADD__(v64, 1);
      v69 = v64 + 1;
      if (v56)
      {
LABEL_121:
        __break(1u);
LABEL_122:
        __break(1u);
        goto LABEL_123;
      }
    }
    v125 = v69;
    v129 = v68;
    v70 = objc_msgSend(v68, "eventName");
    v72 = static String._unconditionallyBridgeFromObjectiveC(_:)(v70, v71);
    v74 = v73;

    if (v127[2])
    {
      v75 = sub_17024(v72, v74);
      v77 = (uint64_t)&_swiftEmptyArrayStorage;
      if ((v76 & 1) != 0)
      {
        v77 = *(_QWORD *)(v127[7] + 8 * v75);
        swift_bridgeObjectRetain(v77, v76);
      }
    }
    else
    {
      v77 = (uint64_t)&_swiftEmptyArrayStorage;
    }
    swift_bridgeObjectRelease(v74);
    v137 = v77;
    v79 = v129;
    if ((unint64_t)v77 >> 62)
    {
      if (v77 < 0)
        v118 = v77;
      else
        v118 = v77 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v77, v78);
      v119 = _CocoaArrayWrapper.endIndex.getter(v118);
      swift_bridgeObjectRelease(v77);
      if (v119)
        goto LABEL_58;
    }
    else if (*(_QWORD *)((char *)&dword_10 + (v77 & 0xFFFFFFFFFFFFF8)))
    {
      goto LABEL_58;
    }
    v80 = (void *)objc_opt_self(NSEntityDescription);
    v81 = String._bridgeToObjectiveC()();
    v82 = objc_msgSend(v80, "entityForName:inManagedObjectContext:", v81, v61);

    if (!v82)
      goto LABEL_126;
    v83 = objc_msgSend(objc_allocWithZone(v23), "initWithEntity:insertIntoManagedObjectContext:", v82, v61);
    v84 = objc_msgSend(v129, "eventName");
    objc_msgSend(v83, "setPropertyName:", v84);

    objc_msgSend(v83, "setRecordType:", objc_msgSend(v129, "recordType"));
    v85 = v83;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v85);
    v87 = *(_QWORD *)((char *)&dword_10 + (v137 & 0xFFFFFFFFFFFFFF8));
    v86 = *(_QWORD *)((char *)&dword_18 + (v137 & 0xFFFFFFFFFFFFFF8));
    if (v87 >= v86 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v86 > 1, v87 + 1, 1);
    v88 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v87, v85);
    specialized Array._endMutation()(v88);

    v77 = v137;
    v79 = v129;
LABEL_58:
    v89 = (unint64_t)v77 >> 62;
    if ((unint64_t)v77 >> 62)
    {
      if (v77 < 0)
        v120 = v77;
      else
        v120 = v77 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v77, v78);
      v33 = (char *)_CocoaArrayWrapper.endIndex.getter(v120);
      if (!v33)
      {
LABEL_102:
        swift_bridgeObjectRelease(v77);
        if (!v89)
          goto LABEL_70;
        goto LABEL_103;
      }
    }
    else
    {
      v33 = *(char **)((char *)&dword_10 + (v77 & 0xFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain(v77, v78);
      if (!v33)
        goto LABEL_102;
    }
    if ((v77 & 0xC000000000000001) != 0)
    {
      v90 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v77);
    }
    else
    {
      if (!*(_QWORD *)((char *)&dword_10 + (v77 & 0xFFFFFFFFFFFFF8)))
        goto LABEL_124;
      v90 = (char *)*(id *)(v77 + 32);
    }
    v33 = v90;
    swift_bridgeObjectRelease(v77);
    v91 = objc_msgSend(v79, "ageToExpire");
    if (v91 != objc_msgSend(v33, "ageToExpire"))
      objc_msgSend(v33, "setAgeToExpire:", objc_msgSend(v129, "ageToExpire"));
    v92 = objc_msgSend(v129, "countLimit");
    if (v92 != objc_msgSend(v33, "countLimit"))
      objc_msgSend(v33, "setCountLimit:", objc_msgSend(v129, "countLimit"));
    v93 = objc_msgSend(v129, "shouldBeSynced");
    if (v93 != objc_msgSend(v33, "shouldBeSynced"))
      objc_msgSend(v33, "setShouldBeSynced:", objc_msgSend(v129, "shouldBeSynced"));

    v79 = v129;
    if (!v89)
    {
LABEL_70:
      v95 = *(_QWORD *)((char *)&dword_10 + (v77 & 0xFFFFFFFFFFFFF8));
      goto LABEL_71;
    }
LABEL_103:
    v33 = (char *)(v77 < 0 ? v77 : v77 & 0xFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain(v77, v94);
    v95 = _CocoaArrayWrapper.endIndex.getter(v33);
    swift_bridgeObjectRelease(v77);
LABEL_71:
    v23 = v130;
    if (v95 < 1)
      goto LABEL_122;
    if (v95 != 1)
      break;
LABEL_91:
    swift_unknownObjectRelease(v79);
    swift_bridgeObjectRelease(v77);
    v65 = v128 & 0xC000000000000001;
    v64 = v125;
    v63 = v126;
    v62 = v128;
    if (v125 == v124)
      goto LABEL_108;
  }
  v96 = -v95;
  v97 = v95;
  v132 = v95;
  while (v95 >= v97)
  {
    v98 = v137;
    if (!swift_isUniquelyReferenced_nonNull_bridgeObject(v137)
      || v98 < 0
      || (v98 & 0x4000000000000000) != 0)
    {
      v98 = sub_E94C(v98, v99);
      v137 = v98;
    }
    v33 = (char *)(v97 - 1);
    v100 = v98 & 0xFFFFFFFFFFFFFF8;
    v101 = *(_QWORD *)(v100 + 16);
    if (v97 - 1 >= v101)
      goto LABEL_110;
    if (v96 + v101 < 0)
      goto LABEL_127;
    v102 = v101 - 1;
    v103 = v100 + 8 * v97;
    v104 = *(void **)(v103 + 24);
    v105 = memmove((void *)(v103 + 24), (const void *)(v103 + 32), 8 * (v96 + v101));
    *(_QWORD *)(v100 + 16) = v102;
    specialized Array._endMutation()(v105);
    if (p_base_prots[212] != (__objc2_prot_list *)-1)
      swift_once(&qword_3E6A0, sub_10B64);
    v106 = type metadata accessor for Logger(0);
    sub_AD78(v106, (uint64_t)qword_3FA80);
    v107 = v104;
    v108 = Logger.logObject.getter(v107);
    v109 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v108, v109))
    {
      v110 = swift_slowAlloc(12, -1);
      v111 = swift_slowAlloc(32, -1);
      v136 = (_QWORD *)v111;
      *(_DWORD *)v110 = 136315138;
      v112 = objc_msgSend(v107, "propertyName");
      if (v112)
      {
        v114 = v112;
        v115 = static String._unconditionallyBridgeFromObjectiveC(_:)(v112, v113);
        v117 = v116;

      }
      else
      {
        v117 = 0xE300000000000000;
        v115 = 7104878;
      }
      *(_QWORD *)(v110 + 4) = sub_282C4(v115, v117, (uint64_t *)&v136);

      swift_bridgeObjectRelease(v117);
      _os_log_impl(&dword_0, v108, v109, "Found erroneous duplicated stored configuration %s.  Deleting", (uint8_t *)v110, 0xCu);
      swift_arrayDestroy(v111, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v111, -1, -1);
      swift_slowDealloc(v110, -1, -1);

      v95 = v132;
      v61 = v133;
      p_base_prots = &BMInternalManagerConfiguration__classData.base_prots;
      p_attr = &stru_3CFF8.attr;
    }
    else
    {

    }
    objc_msgSend(v61, p_attr[205], v107);

    ++v96;
    v97 = (uint64_t)v33;
    if (v33 == (_BYTE *)&dword_0 + 1)
    {
      v77 = v137;
      v79 = v129;
      v23 = v130;
      goto LABEL_91;
    }
  }
  __break(1u);
LABEL_110:
  __break(1u);
LABEL_111:
  __break(1u);
LABEL_112:
  __break(1u);
  swift_once(&qword_3E6A0, sub_10B64);
  v10 = type metadata accessor for Logger(0);
  sub_AD78(v10, (uint64_t)qword_3FA80);
  v11 = v33;
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(12, -1);
    v15 = swift_slowAlloc(32, -1);
    v135 = v15;
    *(_DWORD *)v14 = 136315138;
    v16 = objc_msgSend(v11, "localizedDescription");
    v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16, v17);
    v20 = v19;

    v134 = sub_282C4(v18, v20, &v135);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v134, &v135, v14 + 4, v14 + 12);

    swift_bridgeObjectRelease(v20);
    _os_log_impl(&dword_0, v12, v13, "Could not fetch. %s", v14, 0xCu);
    swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1, -1);
    swift_slowDealloc(v14, -1, -1);

  }
  else
  {

  }
  swift_errorRelease(v137);
  return (uint64_t)v11;
}

uint64_t sub_10B64()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10BE4(v0, qword_3FA80);
  sub_AD78(v0, (uint64_t)qword_3FA80);
  return Logger.init(subsystem:category:)(0xD000000000000010, 0x8000000000033190, 0x73654D7070416E49, 0xED00007365676173);
}

uint64_t *sub_10BE4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t static Context.submitEvent.getter()
{
  return 0x764574696D627573;
}

unint64_t static Context.updateLocalStorage.getter()
{
  return 0xD000000000000012;
}

uint64_t static Context.syncViaCloudKit.getter()
{
  return 0x43616956636E7973;
}

uint64_t ManagerConfiguration.localStorageDirectory.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR___BMInternalManagerConfiguration_localStorageDirectory;
  v4 = type metadata accessor for URL(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t ManagerConfiguration.shouldRunUpdatesOnSchedule.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___BMInternalManagerConfiguration_shouldRunUpdatesOnSchedule);
}

uint64_t ManagerConfiguration.shouldPurgeOutdatedData.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___BMInternalManagerConfiguration_shouldPurgeOutdatedData);
}

id ManagerConfiguration.__allocating_init(localStorageDirectory:shouldRunUpdatesOnSchedule:shouldPurgeOutdatedData:)(uint64_t a1, char a2, char a3)
{
  objc_class *v3;
  _BYTE *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  objc_super v13;

  v7 = objc_allocWithZone(v3);
  v8 = &v7[OBJC_IVAR___BMInternalManagerConfiguration_localStorageDirectory];
  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, a1, v9);
  v7[OBJC_IVAR___BMInternalManagerConfiguration_shouldRunUpdatesOnSchedule] = a2;
  v7[OBJC_IVAR___BMInternalManagerConfiguration_shouldPurgeOutdatedData] = a3;
  v13.receiver = v7;
  v13.super_class = v3;
  v11 = objc_msgSendSuper2(&v13, "init");
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  return v11;
}

id ManagerConfiguration.init(localStorageDirectory:shouldRunUpdatesOnSchedule:shouldPurgeOutdatedData:)(uint64_t a1, char a2, char a3)
{
  _BYTE *v3;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  objc_super v12;

  v7 = &v3[OBJC_IVAR___BMInternalManagerConfiguration_localStorageDirectory];
  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v7, a1, v8);
  v3[OBJC_IVAR___BMInternalManagerConfiguration_shouldRunUpdatesOnSchedule] = a2;
  v3[OBJC_IVAR___BMInternalManagerConfiguration_shouldPurgeOutdatedData] = a3;
  v12.receiver = v3;
  v12.super_class = (Class)type metadata accessor for ManagerConfiguration(0);
  v10 = objc_msgSendSuper2(&v12, "init");
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  return v10;
}

uint64_t type metadata accessor for ManagerConfiguration(uint64_t a1)
{
  uint64_t result;

  result = qword_3EB10;
  if (!qword_3EB10)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ManagerConfiguration);
  return result;
}

uint64_t sub_10FF0()
{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t v3;
  Swift::String v4;
  void *object;
  Swift::String v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  Swift::String v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  _StringGuts.grow(_:)(110);
  v1._countAndFlagsBits = 0xD00000000000002FLL;
  v1._object = (void *)0x80000000000331D0;
  String.append(_:)(v1);
  v2 = type metadata accessor for URL(0);
  v3 = sub_1BAE0(&qword_3EA00, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
  v4._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v2, v3);
  object = v4._object;
  String.append(_:)(v4);
  swift_bridgeObjectRelease(object);
  v6._countAndFlagsBits = 0xD00000000000001ELL;
  v6._object = (void *)0x8000000000033200;
  String.append(_:)(v6);
  if (*(_BYTE *)(v0 + OBJC_IVAR___BMInternalManagerConfiguration_shouldRunUpdatesOnSchedule))
    v7 = 1702195828;
  else
    v7 = 0x65736C6166;
  if (*(_BYTE *)(v0 + OBJC_IVAR___BMInternalManagerConfiguration_shouldRunUpdatesOnSchedule))
    v8 = 0xE400000000000000;
  else
    v8 = 0xE500000000000000;
  v9 = v8;
  String.append(_:)(*(Swift::String *)&v7);
  swift_bridgeObjectRelease(v8);
  v10._object = (void *)0x8000000000033220;
  v10._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v10);
  if (*(_BYTE *)(v0 + OBJC_IVAR___BMInternalManagerConfiguration_shouldPurgeOutdatedData))
    v11 = 1702195828;
  else
    v11 = 0x65736C6166;
  if (*(_BYTE *)(v0 + OBJC_IVAR___BMInternalManagerConfiguration_shouldPurgeOutdatedData))
    v12 = 0xE400000000000000;
  else
    v12 = 0xE500000000000000;
  v13 = v12;
  String.append(_:)(*(Swift::String *)&v11);
  swift_bridgeObjectRelease(v12);
  return 0;
}

void ManagerConfiguration.init()()
{
  _swift_stdlib_reportUnimplementedInitializer("EngagementCollector.ManagerConfiguration", 40, "init()", 6, 0);
  __break(1u);
}

id ManagerConfiguration.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ManagerConfiguration(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t Manager.collector.getter()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(v0 + OBJC_IVAR___BMInternalManager_collector));
}

void *Manager.configuration.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR___BMInternalManager_configuration);
  v2 = v1;
  return v1;
}

_BYTE *Manager.__allocating_init(configuration:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return Manager.init(configuration:)(a1);
}

_BYTE *Manager.init(configuration:)(void *a1)
{
  _BYTE *v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  objc_class *v27;
  id v28;
  void *v29;
  _BYTE *v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  _QWORD *v37;
  NSObject *v38;
  uint64_t v39;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  objc_super v48;
  NSObject *v49;
  uint64_t v50;

  v2 = v1;
  v47 = a1;
  v3 = type metadata accessor for URL(0);
  v45 = *(_QWORD *)(v3 - 8);
  v46 = v3;
  __chkstk_darwin(v3);
  v44 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v5 = *(_QWORD *)(v43 - 8);
  __chkstk_darwin(v43);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2[OBJC_IVAR___BMInternalManager_shouldScheduleUpdates] = 0;
  v42 = OBJC_IVAR___BMInternalManager_managerQueue;
  v41 = sub_11790();
  v14 = v2;
  static DispatchQoS.unspecified.getter();
  v49 = &_swiftEmptyArrayStorage;
  v15 = sub_1BAE0((unint64_t *)&qword_3EA30, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v16 = sub_44F0(&qword_3EE90);
  v17 = sub_D974(&qword_3EA40, &qword_3EE90, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v49, v16, v17, v8, v15);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v43);
  v18 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000001BLL, 0x8000000000033270, v13, v10, v7, 0);
  *(_QWORD *)&v2[v42] = v18;
  *(_QWORD *)&v14[OBJC_IVAR___BMInternalManager_scheduledUpdateWorkItem] = 0;
  v19 = type metadata accessor for Collector();
  v20 = (_QWORD *)swift_allocObject(v19, 40, 7);
  v20[2] = 0xD000000000000010;
  v20[3] = 0x8000000000033290;
  v20[4] = &_swiftEmptyArrayStorage;
  *(_QWORD *)&v14[OBJC_IVAR___BMInternalManager_collector] = v20;
  v21 = v46;
  v22 = v47;
  *(_QWORD *)&v14[OBJC_IVAR___BMInternalManager_configuration] = v47;
  v23 = v22;
  v24 = (uint64_t)v44;
  (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v44, (uint64_t)v22 + OBJC_IVAR___BMInternalManagerConfiguration_localStorageDirectory, v21);
  v25 = type metadata accessor for LocalStorage(0);
  swift_allocObject(v25, *(unsigned int *)(v25 + 48), *(unsigned __int16 *)(v25 + 52));
  v26 = v23;
  *(_QWORD *)&v14[OBJC_IVAR___BMInternalManager_localStorage] = sub_2AB64(v24);

  v27 = (objc_class *)type metadata accessor for Manager();
  v48.receiver = v14;
  v48.super_class = v27;
  v28 = objc_msgSendSuper2(&v48, "init");
  v29 = (void *)objc_opt_self(NSNotificationCenter);
  v30 = v28;
  v31 = objc_msgSend(v29, "defaultCenter");
  objc_msgSend(v31, "addObserver:selector:name:object:", v30, "onDidReceiveAppDidBackground:", UIApplicationWillResignActiveNotification, 0);

  if (qword_3E6A0 != -1)
    swift_once(&qword_3E6A0, sub_10B64);
  v32 = type metadata accessor for Logger(0);
  sub_AD78(v32, (uint64_t)qword_3FA80);
  v33 = v26;
  v34 = Logger.logObject.getter(v33);
  v35 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = (uint8_t *)swift_slowAlloc(12, -1);
    v37 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v36 = 138412290;
    v49 = v33;
    v38 = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, &v50, v36 + 4, v36 + 12);
    *v37 = v47;

    _os_log_impl(&dword_0, v34, v35, "Manager initiated with configuration %@", v36, 0xCu);
    v39 = sub_44F0(&qword_3ECE0);
    swift_arrayDestroy(v37, 1, v39);
    swift_slowDealloc(v37, -1, -1);
    swift_slowDealloc(v36, -1, -1);
  }
  else
  {

    v34 = v33;
  }

  if (*((_BYTE *)&v33->isa + OBJC_IVAR___BMInternalManagerConfiguration_shouldRunUpdatesOnSchedule) == 1)
  {
    v30[OBJC_IVAR___BMInternalManager_shouldScheduleUpdates] = 1;
    sub_13B94();
  }

  return v30;
}

unint64_t sub_11790()
{
  unint64_t result;
  uint64_t v1;

  result = qword_3EE80;
  if (!qword_3EE80)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_3EE80);
  }
  return result;
}

id Manager.__deallocating_deinit()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  v1 = v0;
  v2 = *(_QWORD *)&v0[OBJC_IVAR___BMInternalManager_scheduledUpdateWorkItem];
  if (v2)
  {
    v3 = swift_retain(v2);
    dispatch thunk of DispatchWorkItem.cancel()(v3);
    swift_release(v2);
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for Manager();
  return objc_msgSendSuper2(&v5, "dealloc");
}

uint64_t sub_11928()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD aBlock[5];
  uint64_t v23;

  v1 = type metadata accessor for DispatchWorkItemFlags(0);
  v20 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for DispatchQoS(0);
  v4 = *(_QWORD *)(v19 - 8);
  __chkstk_darwin(v19);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS.QoSClass(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_11790();
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for DispatchQoS.QoSClass.background(_:), v7);
  v11 = (void *)static OS_dispatch_queue.global(qos:)(v10);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v12 = swift_allocObject(&unk_393A0, 24, 7);
  *(_QWORD *)(v12 + 16) = v0;
  aBlock[4] = sub_1BAB4;
  v23 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_241B8;
  aBlock[3] = &unk_393B8;
  v13 = _Block_copy(aBlock);
  static DispatchQoS.unspecified.getter(v0);
  v21 = &_swiftEmptyArrayStorage;
  v14 = sub_1BAE0(&qword_3EB50, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v15 = sub_44F0(&qword_3EB58);
  v16 = sub_D974(&qword_3EB60, &qword_3EB58, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v21, v15, v16, v1, v14);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v6, v3, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v19);
  return swift_release(v23);
}

void sub_11B90(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  NSObject *oslog;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if ((a1[1] & 1) != 0)
  {
    if (qword_3E6A0 != -1)
      swift_once(&qword_3E6A0, sub_10B64);
    v2 = type metadata accessor for Logger(0);
    v3 = sub_AD78(v2, (uint64_t)qword_3FA80);
    oslog = Logger.logObject.getter(v3);
    v4 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc(12, -1);
      v6 = swift_slowAlloc(32, -1);
      v22 = v6;
      *(_DWORD *)v5 = 136315138;
      v7 = sub_1C450();
      v8 = Error.localizedDescription.getter(&type metadata for CollectorError, v7);
      v10 = v9;
      v21 = sub_282C4(v8, v9, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v5 + 4, v5 + 12);
      swift_bridgeObjectRelease(v10);
      _os_log_impl(&dword_0, oslog, v4, "Error from completion: %s", v5, 0xCu);
      swift_arrayDestroy(v6, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v6, -1, -1);
      v11 = v5;
LABEL_10:
      swift_slowDealloc(v11, -1, -1);

      return;
    }
  }
  else
  {
    v12 = *a1;
    v13 = qword_3E6A0;
    swift_bridgeObjectRetain(*a1, a2);
    if (v13 != -1)
      swift_once(&qword_3E6A0, sub_10B64);
    v14 = type metadata accessor for Logger(0);
    sub_AD78(v14, (uint64_t)qword_3FA80);
    v16 = swift_bridgeObjectRetain(v12, v15);
    oslog = Logger.logObject.getter(v16);
    v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v18 = 134217984;
      v19 = *(_QWORD *)(v12 + 16);
      sub_1C444(v12, 0);
      v22 = v19;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v18 + 4, v18 + 12);
      sub_1C444(v12, 0);
      _os_log_impl(&dword_0, oslog, v17, "received properties for submit: %ld", v18, 0xCu);
      v11 = v18;
      goto LABEL_10;
    }
    sub_1C444(v12, 0);
    sub_1C444(v12, 0);
  }

}

uint64_t sub_11F3C()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(v0 + OBJC_IVAR___BMInternalManager_localStorage));
}

uint64_t sub_11F4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2BEA0(a1, a2, a3, a4);
}

uint64_t sub_11F74(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13[2];

  v6 = a1[3];
  v7 = a1[4];
  sub_1AD8C(a1, v6);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7);
  v10 = v9;
  sub_1ADB0((uint64_t)a1, (uint64_t)v13);
  v11 = swift_allocObject(&unk_39100, 72, 7);
  *(_QWORD *)(v11 + 16) = a2;
  *(_QWORD *)(v11 + 24) = a3;
  sub_1AE20(v13, v11 + 32);
  swift_retain();
  sub_2BEA0(v8, v10, (uint64_t)sub_1AE38, v11);
  swift_release(v11);
  return swift_bridgeObjectRelease(v10);
}

uint64_t sub_12054(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;

  v4 = swift_allocObject(&unk_39128, 24, 7);
  swift_weakInit(v4 + 16);
  v5 = (_QWORD *)swift_allocObject(&unk_39150, 40, 7);
  v5[2] = v4;
  v5[3] = a1;
  v5[4] = a2;
  swift_retain();
  swift_retain();
  sub_2BA88((uint64_t)sub_1AE70, (uint64_t)v5);
  swift_release(v4);
  return swift_release(v5);
}

uint64_t sub_12100(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  __chkstk_darwin(v6);
  v9 = swift_allocObject(&unk_39128, 24, 7);
  swift_weakInit(v9 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v10 = *(unsigned __int8 *)(v7 + 80);
  v11 = (v10 + 40) & ~v10;
  v12 = (char *)swift_allocObject(&unk_39178, v11 + v8, v10 | 7);
  *((_QWORD *)v12 + 2) = v9;
  *((_QWORD *)v12 + 3) = a2;
  *((_QWORD *)v12 + 4) = a3;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v12[v11], (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  swift_retain();
  swift_retain();
  sub_2BA88((uint64_t)sub_1AEF8, (uint64_t)v12);
  swift_release(v9);
  return swift_release(v12);
}

uint64_t sub_12234(void *a1, uint64_t a2)
{
  uint64_t v2;

  swift_getObjectType(a1);
  return sub_1A2C0(a1, a2, v2);
}

void Manager.init()()
{
  _swift_stdlib_reportUnimplementedInitializer("EngagementCollector.Manager", 27, "init()", 6, 0);
  __break(1u);
}

void Manager.register(donor:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  sub_26F68(a1);
  if (!v2)
  {
    objc_msgSend(a1, "addDonorObserver:", v1);
    sub_1232C(a1);
  }
}

void sub_1232C(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v2 = v1;
  v4 = sub_44F0(&qword_3EA60);
  __chkstk_darwin(v4);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(a1, "eventConfigurations");
  v8 = type metadata accessor for BasePropertyConfiguration();
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, v8);

  v30 = &_swiftEmptyArrayStorage;
  if ((unint64_t)v9 >> 62)
  {
    if (v9 < 0)
      v18 = v9;
    else
      v18 = v9 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v9, v10);
    v11 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(v9);
    if (v11)
      goto LABEL_3;
LABEL_17:
    swift_bridgeObjectRelease(v9);
    v17 = &_swiftEmptyArrayStorage;
    goto LABEL_18;
  }
  v11 = *(_QWORD *)((char *)&dword_10 + (v9 & 0xFFFFFFFFFFFFF8));
  if (!v11)
    goto LABEL_17;
LABEL_3:
  if (v11 < 1)
  {
    __break(1u);
    return;
  }
  for (i = 0; i != v11; ++i)
  {
    if ((v9 & 0xC000000000000001) != 0)
      v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v9);
    else
      v15 = *(id *)(v9 + 8 * i + 32);
    v16 = v15;
    if (*((_BYTE *)v15 + OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached) == 1)
    {
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v15);
      v13 = v30[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v13);
      v14 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v13, v16);
      specialized ContiguousArray._endMutation()(v14);
    }
    else
    {

    }
  }
  swift_bridgeObjectRelease(v9);
  v17 = v30;
LABEL_18:
  if (qword_3E6A0 != -1)
    swift_once(&qword_3E6A0, sub_10B64);
  v19 = type metadata accessor for Logger(0);
  v20 = sub_AD78(v19, (uint64_t)qword_3FA80);
  v21 = Logger.logObject.getter(v20);
  v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc(12, -1);
    v24 = (_QWORD *)swift_slowAlloc(32, -1);
    v30 = v24;
    *(_DWORD *)v23 = 136315138;
    v29 = sub_282C4(0xD000000000000021, 0x8000000000033510, (uint64_t *)&v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, &v30, v23 + 4, v23 + 12);
    _os_log_impl(&dword_0, v21, v22, "Manager - %s", v23, 0xCu);
    swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v24, -1, -1);
    swift_slowDealloc(v23, -1, -1);
  }

  v25 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v6, 1, 1, v25);
  v26 = (_QWORD *)swift_allocObject(&unk_39968, 48, 7);
  v26[2] = 0;
  v26[3] = 0;
  v26[4] = v2;
  v26[5] = v17;
  v27 = v2;
  v28 = sub_12C68((uint64_t)v6, (uint64_t)&unk_3ECA0, (uint64_t)v26);
  swift_release(v28);
}

void *Manager.donor(type:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  _BYTE v12[24];

  v5 = *(_QWORD *)(v2 + OBJC_IVAR___BMInternalManager_collector);
  swift_beginAccess(v5 + 32, v12, 0, 0);
  v6 = *(_QWORD *)(v5 + 32);
  swift_bridgeObjectRetain(a2, v7);
  v9 = swift_bridgeObjectRetain(v6, v8);
  v10 = sub_1AFB4(v9, a1, a2);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(a2);
  return v10;
}

uint64_t sub_12704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 56) = a4;
  *(_QWORD *)(v5 + 64) = a5;
  return swift_task_switch(sub_1271C, 0, 0);
}

uint64_t sub_1271C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;

  v3 = v2[8];
  if ((unint64_t)v3 >> 62)
  {
    if (v3 < 0)
      v8 = v2[8];
    else
      v8 = v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v2[8], a2);
    v9 = sub_44F0(&qword_3EC28);
    v5 = _bridgeCocoaArray<A>(_:)(v8, v9);
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4 = swift_bridgeObjectRetain(v2[8], a2);
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v4);
    v5 = v2[8];
  }
  v2[9] = v5;
  v6 = (_QWORD *)swift_task_alloc(dword_3EED4);
  v2[10] = v6;
  *v6 = v2;
  v6[1] = sub_127DC;
  return sub_25D60(v5);
}

uint64_t sub_127DC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *v2;
  v5 = *(_QWORD *)(*v2 + 72);
  v4 = *(_QWORD *)(*v2 + 80);
  *(_QWORD *)(v3 + 88) = a1;
  *(_BYTE *)(v3 + 96) = a2;
  swift_task_dealloc(v4);
  swift_bridgeObjectRelease(v5);
  return swift_task_switch(sub_12844, 0, 0);
}

uint64_t sub_12844()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;

  if ((*(_BYTE *)(v0 + 96) & 1) != 0)
  {
    v1 = *(_QWORD *)(v0 + 88);
    swift_errorRetain(v1);
    if (qword_3E6A0 != -1)
      swift_once(&qword_3E6A0, sub_10B64);
    v2 = type metadata accessor for Logger(0);
    sub_AD78(v2, (uint64_t)qword_3FA80);
    swift_errorRetain(v1);
    v3 = swift_errorRetain(v1);
    v4 = Logger.logObject.getter(v3);
    v5 = static os_log_type_t.error.getter();
    v6 = os_log_type_enabled(v4, v5);
    v7 = *(_QWORD *)(v0 + 88);
    if (v6)
    {
      v8 = (uint8_t *)swift_slowAlloc(12, -1);
      v9 = swift_slowAlloc(32, -1);
      v14 = v9;
      *(_DWORD *)v8 = 136315138;
      swift_getErrorValue(v1, v0 + 40, v0 + 16);
      v10 = Error.localizedDescription.getter(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
      v12 = v11;
      *(_QWORD *)(v0 + 48) = sub_282C4(v10, v11, &v14);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v0 + 56, v8 + 4, v8 + 12);
      swift_bridgeObjectRelease(v12);
      sub_1C4E0(v7, 1);
      sub_1C4E0(v7, 1);
      _os_log_impl(&dword_0, v4, v5, "Error storing cached updated configurations %s", v8, 0xCu);
      swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v9, -1, -1);
      swift_slowDealloc(v8, -1, -1);

      sub_1C4E0(v7, 1);
      sub_1C4E0(v7, 1);
    }
    else
    {
      sub_1C4E0(*(_QWORD *)(v0 + 88), 1);
      sub_1C4E0(v7, 1);
      swift_errorRelease(v1);
      swift_errorRelease(v1);

    }
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

_QWORD *sub_12A68(uint64_t a1)
{
  int64_t v1;
  _QWORD *v2;
  char *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  id v27[6];
  char v28;
  _QWORD v29[6];
  char v30;
  _QWORD *v31;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    v31 = _swiftEmptyArrayStorage;
    sub_19964(0, v1, 0);
    v2 = _swiftEmptyArrayStorage;
    v4 = (char *)(a1 + 80);
    do
    {
      v5 = (void *)*((_QWORD *)v4 - 5);
      v6 = (void *)*((_QWORD *)v4 - 4);
      v7 = (void *)*((_QWORD *)v4 - 3);
      v8 = (void *)*((_QWORD *)v4 - 2);
      v9 = (void *)*((_QWORD *)v4 - 1);
      v10 = *v4;
      v26 = v1;
      v27[0] = *((id *)v4 - 6);
      v27[1] = v5;
      v27[2] = v6;
      v27[3] = v7;
      v27[4] = v8;
      v27[5] = v9;
      v28 = v10;
      v11 = v27[0];
      sub_E174((uint64_t)v5, (uint64_t)v6, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, v10);
      v12 = v11;
      sub_E174((uint64_t)v5, (uint64_t)v6, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, v10);
      v13 = sub_44F0(&qword_3EC00);
      v14 = sub_44F0(&qword_3EC08);
      swift_dynamicCast(v29, v27, v13, v14, 7);
      v15 = v29[0];
      v24 = v29[2];
      v25 = v29[1];
      v22 = v29[4];
      v23 = v29[3];
      v21 = v29[5];
      v20 = v30;

      sub_ADD4((uint64_t)v5, (uint64_t)v6, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, v10);
      if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
      {
        sub_19964(0, v2[2] + 1, 1);
        v2 = v31;
      }
      v17 = v2[2];
      v16 = v2[3];
      if (v17 >= v16 >> 1)
      {
        sub_19964(v16 > 1, v17 + 1, 1);
        v2 = v31;
      }
      v4 += 56;
      v2[2] = v17 + 1;
      v18 = &v2[7 * v17];
      v18[4] = v15;
      v18[5] = v25;
      v18[6] = v24;
      v18[7] = v23;
      v18[8] = v22;
      v18[9] = v21;
      *((_BYTE *)v18 + 80) = v20;
      v1 = v26 - 1;
    }
    while (v26 != 1);
  }
  return v2;
}

uint64_t sub_12C68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_DB08(a1, &qword_3EA60);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_398F0, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  else
  {
    v17 = 0;
  }
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_3EC60, v16);
}

void Manager.propertyDidChange(_:propertyConfiguration:)(void *a1, void *a2)
{
  uint64_t v2;
  NSString v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  uint64_t v12;

  if (*((_BYTE *)a2 + OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached) == 1)
  {
    v5 = String._bridgeToObjectiveC()();
    v6 = swift_allocObject(&unk_391A0, 24, 7);
    swift_unknownObjectWeakInit(v6 + 16, v2);
    v7 = swift_allocObject(&unk_391C8, 32, 7);
    *(_QWORD *)(v7 + 16) = v6;
    *(_QWORD *)(v7 + 24) = a2;
    v11[4] = sub_1B1AC;
    v12 = v7;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 1107296256;
    v11[2] = sub_13030;
    v11[3] = &unk_391E0;
    v8 = _Block_copy(v11);
    v9 = v12;
    v10 = a2;
    swift_release(v9);
    objc_msgSend(a1, "donateWithConfiguration:context:donationCompleteBlock:", v10, v5, v8);
    _Block_release(v8);

  }
}

void sub_12EE0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *Strong;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _BYTE v25[24];

  v5 = a2 + 16;
  swift_beginAccess(a2 + 16, v25, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v5);
  if (Strong)
  {
    v7 = Strong;
    if (a1)
    {
      v8 = a1 + OBJC_IVAR____TtC19EngagementCollector15BMPropertyValue_propertyValue;
      v9 = *(_QWORD *)(a1 + OBJC_IVAR____TtC19EngagementCollector15BMPropertyValue_propertyValue);
      v10 = *(_QWORD *)(v8 + 8);
      v11 = *(_QWORD *)(v8 + 16);
      v12 = *(_QWORD *)(v8 + 24);
      v13 = *(_QWORD *)(v8 + 32);
      v14 = *(_BYTE *)(v8 + 40);
      v15 = sub_44F0((uint64_t *)&unk_3EC70);
      v16 = sub_44F0(&qword_3E950);
      v17 = *(_QWORD *)(v16 - 8);
      v18 = *(_QWORD *)(v17 + 72);
      v19 = *(unsigned __int8 *)(v17 + 80);
      v24 = a3;
      v20 = (v19 + 32) & ~v19;
      v21 = swift_allocObject(v15, v20 + v18, v19 | 7);
      *(_OWORD *)(v21 + 16) = xmmword_318F0;
      v22 = v21 + v20 + *(int *)(v16 + 48);
      v23 = sub_E174(v9, v10, v11, v12, v13, v14);
      Date.init()(v23);
      *(_QWORD *)v22 = v9;
      *(_QWORD *)(v22 + 8) = v10;
      *(_QWORD *)(v22 + 16) = v11;
      *(_QWORD *)(v22 + 24) = v12;
      *(_QWORD *)(v22 + 32) = v13;
      *(_BYTE *)(v22 + 40) = v14;
      sub_19F68(v24, v21, (uint64_t)v7);

      swift_bridgeObjectRelease(v21);
    }
    else
    {

    }
  }
}

void sub_13030(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void *);
  id v5;

  v4 = *(void (**)(void *))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4(a2);
  swift_release(v3);

}

uint64_t Manager.updateLocalStorage(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _BYTE v23[24];

  v3 = v2;
  v6 = sub_44F0(&qword_3EA60);
  __chkstk_darwin(v6);
  v8 = &v23[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = *(_QWORD *)(v2 + OBJC_IVAR___BMInternalManager_collector);
  v10 = swift_allocObject(&unk_391A0, 24, 7);
  swift_unknownObjectWeakInit(v10 + 16, v3);
  v11 = (_QWORD *)swift_allocObject(&unk_39218, 40, 7);
  v11[2] = a1;
  v11[3] = a2;
  v11[4] = v10;
  swift_beginAccess(v9 + 32, v23, 0, 0);
  v12 = *(_QWORD *)(v9 + 32);
  if (v12 < 0 || (v12 & 0x4000000000000000) != 0)
  {
    swift_retain(a2);
    swift_retain(v10);
    v20 = swift_bridgeObjectRetain(v12, v19);
    v13 = (uint64_t)sub_19870(v20, v21);
    swift_bridgeObjectRelease(v12);
  }
  else
  {
    v13 = v12 & 0xFFFFFFFFFFFFFF8;
    swift_retain(a2);
    swift_retain(v10);
    swift_bridgeObjectRetain(v12, v14);
  }
  v15 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v8, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject(&unk_39240, 72, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = v13;
  v16[5] = 0xD000000000000012;
  v16[6] = 0x80000000000331B0;
  v16[7] = sub_1B1F8;
  v16[8] = v11;
  swift_retain(v11);
  v17 = sub_12C68((uint64_t)v8, (uint64_t)&unk_3EA68, (uint64_t)v16);
  swift_release(v10);
  swift_release(v11);
  return swift_release(v17);
}

uint64_t sub_132C4(uint64_t *a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int64_t v27;
  int64_t v28;
  unint64_t v29;
  unint64_t v30;
  int64_t v31;
  unint64_t v32;
  int64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t Strong;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  int64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  if ((a1[1] & 1) != 0)
  {
    if (qword_3E6A0 != -1)
      goto LABEL_36;
    goto LABEL_3;
  }
  v54 = a4 + 16;
  v17 = qword_3E6A0;
  v60 = *a1;
  swift_bridgeObjectRetain(*a1, a2);
  if (v17 != -1)
    swift_once(&qword_3E6A0, sub_10B64);
  v18 = type metadata accessor for Logger(0);
  sub_AD78(v18, (uint64_t)qword_3FA80);
  v20 = swift_bridgeObjectRetain(v60, v19);
  v21 = Logger.logObject.getter(v20);
  v22 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v23 = 134217984;
    v62 = *(_QWORD *)(v60 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63, v23 + 4, v23 + 12);
    sub_1C444(v60, 0);
    _os_log_impl(&dword_0, v21, v22, "Received properties for local storage: %ld", v23, 0xCu);
    swift_slowDealloc(v23, -1, -1);
  }
  else
  {
    sub_1C444(v60, 0);
  }

  v57 = v60 + 64;
  v24 = 1 << *(_BYTE *)(v60 + 32);
  v25 = -1;
  if (v24 < 64)
    v25 = ~(-1 << v24);
  v26 = v25 & *(_QWORD *)(v60 + 64);
  swift_beginAccess(v54, &v62, 0, 0);
  v27 = 0;
  v28 = (unint64_t)(v24 + 63) >> 6;
  v53 = v28;
  while (1)
  {
    if (v26)
    {
      v29 = __clz(__rbit64(v26));
      v26 &= v26 - 1;
      v30 = v29 | (v27 << 6);
      goto LABEL_30;
    }
    v31 = v27 + 1;
    if (__OFADD__(v27, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v31 >= v28)
      goto LABEL_33;
    v32 = *(_QWORD *)(v57 + 8 * v31);
    ++v27;
    if (!v32)
    {
      v27 = v31 + 1;
      if (v31 + 1 >= v28)
        goto LABEL_33;
      v32 = *(_QWORD *)(v57 + 8 * v27);
      if (!v32)
      {
        v27 = v31 + 2;
        if (v31 + 2 >= v28)
          goto LABEL_33;
        v32 = *(_QWORD *)(v57 + 8 * v27);
        if (!v32)
          break;
      }
    }
LABEL_29:
    v26 = (v32 - 1) & v32;
    v30 = __clz(__rbit64(v32)) + (v27 << 6);
LABEL_30:
    v34 = *(void **)(*(_QWORD *)(v60 + 48) + 8 * v30);
    if ((*((_BYTE *)v34 + OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached) & 1) != 0)
    {
      v35 = *(_QWORD *)(v60 + 56) + 48 * v30;
      v36 = *(_QWORD *)v35;
      v37 = *(_QWORD *)(v35 + 8);
      v38 = *(_QWORD *)(v35 + 16);
      v39 = *(_QWORD *)(v35 + 24);
      v58 = *(_QWORD *)(v35 + 32);
      v59 = v27;
      v40 = *(_BYTE *)(v35 + 40);
      Strong = swift_unknownObjectWeakLoadStrong(v54);
      v27 = v59;
      if (Strong)
      {
        v56 = (void *)Strong;
        v42 = sub_44F0((uint64_t *)&unk_3EC70);
        v43 = sub_44F0(&qword_3E950);
        v44 = *(_QWORD *)(v43 - 8);
        v45 = *(_QWORD *)(v44 + 72);
        v46 = *(unsigned __int8 *)(v44 + 80);
        v47 = (v46 + 32) & ~v46;
        v48 = swift_allocObject(v42, v47 + v45, v46 | 7);
        *(_OWORD *)(v48 + 16) = xmmword_318F0;
        v49 = v48 + v47 + *(int *)(v43 + 48);
        v55 = v34;
        v50 = sub_E174(v36, v37, v38, v39, v58, v40);
        Date.init()(v50);
        *(_QWORD *)v49 = v36;
        *(_QWORD *)(v49 + 8) = v37;
        *(_QWORD *)(v49 + 16) = v38;
        *(_QWORD *)(v49 + 24) = v39;
        *(_QWORD *)(v49 + 32) = v58;
        *(_BYTE *)(v49 + 40) = v40;
        sub_E174(v36, v37, v38, v39, v58, v40);
        sub_19F68(v55, v48, (uint64_t)v56);
        sub_ADD4(v36, v37, v38, v39, v58, v40);

        v51 = v48;
        v28 = v53;
        swift_bridgeObjectRelease(v51);
        v27 = v59;
      }
    }
  }
  v33 = v31 + 3;
  if (v33 >= v28)
  {
LABEL_33:
    swift_release(v60);
    return a2(0, 0);
  }
  v32 = *(_QWORD *)(v57 + 8 * v33);
  if (v32)
  {
    v27 = v33;
    goto LABEL_29;
  }
  while (1)
  {
    v27 = v33 + 1;
    if (__OFADD__(v33, 1))
      break;
    if (v27 >= v28)
      goto LABEL_33;
    v32 = *(_QWORD *)(v57 + 8 * v27);
    ++v33;
    if (v32)
      goto LABEL_29;
  }
LABEL_35:
  __break(1u);
LABEL_36:
  swift_once(&qword_3E6A0, sub_10B64);
LABEL_3:
  v4 = type metadata accessor for Logger(0);
  v5 = sub_AD78(v4, (uint64_t)qword_3FA80);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v62 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = sub_1C450();
    v11 = Error.localizedDescription.getter(&type metadata for CollectorError, v10);
    v13 = v12;
    v61 = sub_282C4(v11, v12, &v62);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, &v62, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease(v13);
    _os_log_impl(&dword_0, v6, v7, "Error from completion: %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }

  v14 = sub_1C450();
  v15 = swift_allocError(&type metadata for CollectorError, v14, 0, 0);
  a2(v15, 1);
  return swift_errorRelease(v15);
}

void sub_13834(uint64_t a1, char a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  NSObject *oslog;
  _QWORD v19[3];
  _BYTE v20[8];
  uint64_t v21;
  uint64_t v22;

  if ((a2 & 1) != 0)
  {
    swift_errorRetain(a1);
    if (qword_3E6A0 != -1)
      swift_once(&qword_3E6A0, sub_10B64);
    v5 = type metadata accessor for Logger(0);
    sub_AD78(v5, (uint64_t)qword_3FA80);
    sub_1C4D4(a1, 1);
    swift_unknownObjectRetain(a3);
    sub_1C4D4(a1, 1);
    v6 = swift_unknownObjectRetain(a3);
    oslog = Logger.logObject.getter(v6);
    v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v7))
    {
      v8 = swift_slowAlloc(22, -1);
      v9 = swift_slowAlloc(64, -1);
      v22 = v9;
      *(_DWORD *)v8 = 136315394;
      v10 = objc_msgSend(a3, "eventName");
      v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10, v11);
      v14 = v13;

      v21 = sub_282C4(v12, v14, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v8 + 4, v8 + 12);
      swift_unknownObjectRelease_n(a3, 2);
      swift_bridgeObjectRelease(v14);
      *(_WORD *)(v8 + 12) = 2080;
      swift_getErrorValue(a1, v20, v19);
      v15 = Error.localizedDescription.getter(v19[1], v19[2]);
      v17 = v16;
      v21 = sub_282C4(v15, v16, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v8 + 14, v8 + 22);
      swift_bridgeObjectRelease(v17);
      sub_1C4E0(a1, 1);
      sub_1C4E0(a1, 1);
      _os_log_impl(&dword_0, oslog, v7, "Property values for %s could not get saved: %s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy(v9, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v9, -1, -1);
      swift_slowDealloc(v8, -1, -1);

      sub_1C4E0(a1, 1);
    }
    else
    {
      sub_1C4E0(a1, 1);
      swift_unknownObjectRelease_n(a3, 2);
      sub_1C4E0(a1, 1);
      sub_1C4E0(a1, 1);

    }
  }
}

Swift::Void __swiftcall Manager.forcePurgeLocalStorage()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___BMInternalManager_localStorage);
  v2 = swift_allocObject(&unk_39128, 24, 7);
  swift_weakInit(v2 + 16);
  v3 = (_QWORD *)swift_allocObject(&unk_39268, 40, 7);
  v3[2] = v1;
  v3[3] = sub_1B29C;
  v3[4] = v2;
  swift_retain_n(v2, 2);
  swift_retain();
  sub_2BA88((uint64_t)sub_1B2AC, (uint64_t)v3);
  swift_release_n(v2, 2);
  swift_release(v3);
  sub_2C6C0();
}

uint64_t sub_13B94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD aBlock[5];
  uint64_t v33;

  v1 = v0;
  v2 = type metadata accessor for DispatchTime(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v28 - v7;
  v9 = type metadata accessor for DispatchWorkItemFlags(0);
  result = __chkstk_darwin(v9);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_BYTE *)(v1 + OBJC_IVAR___BMInternalManager_shouldScheduleUpdates) == 1)
  {
    v13 = swift_allocObject(&unk_391A0, 24, 7);
    v30 = v3;
    v14 = v13;
    swift_unknownObjectWeakInit(v13 + 16, v1);
    aBlock[4] = sub_1C6A8;
    v33 = v14;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_241B8;
    aBlock[3] = &unk_399F8;
    v29 = _Block_copy(aBlock);
    v31 = &_swiftEmptyArrayStorage;
    v15 = sub_1BAE0(&qword_3EB50, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    swift_retain(v14);
    v16 = sub_44F0(&qword_3EB58);
    v17 = sub_D974(&qword_3EB60, &qword_3EB58, (uint64_t)&protocol conformance descriptor for [A]);
    dispatch thunk of SetAlgebra.init<A>(_:)(&v31, v16, v17, v9, v15);
    v18 = type metadata accessor for DispatchWorkItem(0);
    swift_allocObject(v18, *(unsigned int *)(v18 + 48), *(unsigned __int16 *)(v18 + 52));
    v19 = DispatchWorkItem.init(flags:block:)(v12, v29);
    v20 = v33;
    v21 = v14;
    v22 = v30;
    swift_release(v21);
    swift_release(v20);
    v23 = OBJC_IVAR___BMInternalManager_scheduledUpdateWorkItem;
    v24 = *(_QWORD *)(v1 + OBJC_IVAR___BMInternalManager_scheduledUpdateWorkItem);
    *(_QWORD *)(v1 + OBJC_IVAR___BMInternalManager_scheduledUpdateWorkItem) = v19;
    result = swift_release(v24);
    v25 = *(_QWORD *)(v1 + v23);
    if (v25)
    {
      v26 = swift_retain(v25);
      static DispatchTime.now()(v26);
      + infix(_:_:)(v6, 5.0);
      v27 = *(void (**)(char *, uint64_t))(v22 + 8);
      v27(v6, v2);
      OS_dispatch_queue.asyncAfter(deadline:execute:)(v8, v25);
      swift_release(v25);
      return ((uint64_t (*)(char *, uint64_t))v27)(v8, v2);
    }
  }
  return result;
}

uint64_t sub_13E18(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  void *v3;
  uint64_t v4;
  _BYTE v5[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v5, 0, 0);
  result = swift_unknownObjectWeakLoadStrong(v1);
  if (result)
  {
    v3 = (void *)result;
    v4 = swift_allocObject(&unk_391A0, 24, 7);
    swift_unknownObjectWeakInit(v4 + 16, v3);
    swift_retain(v4);
    Manager.updateLocalStorage(completion:)((uint64_t)sub_1C6B0, v4);

    return swift_release_n(v4, 2);
  }
  return result;
}

void sub_13EAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  _BYTE v6[24];

  v3 = a3 + 16;
  swift_beginAccess(a3 + 16, v6, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    sub_13B94();

  }
}

uint64_t Manager.getAllConfigurations(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v5 = *(_QWORD *)(v2 + OBJC_IVAR___BMInternalManager_localStorage);
  v6 = swift_allocObject(&unk_39290, 32, 7);
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v7 = (_QWORD *)swift_allocObject(&unk_392B8, 40, 7);
  v7[2] = v5;
  v7[3] = sub_1B2B8;
  v7[4] = v6;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2BA88((uint64_t)sub_1C718, (uint64_t)v7);
  swift_release(v6);
  return swift_release(v7);
}

uint64_t Manager.getAllConfigurations()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch(sub_13FC0, 0, 0);
}

uint64_t sub_13FC0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v1 = v0[3];
  v2 = swift_task_alloc(32);
  v0[4] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  v0[5] = v3;
  v4 = sub_44F0(&qword_3EA78);
  *v3 = v0;
  v3[1] = sub_14070;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 2, 0, 0, 0xD000000000000016, 0x80000000000332F0, sub_1B2C0, v2, v4);
}

uint64_t sub_14070()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 32);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 40));
  swift_task_dealloc(v1);
  return swift_task_switch(sub_140CC, 0, 0);
}

uint64_t sub_140CC()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_140D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v14;

  v4 = sub_44F0((uint64_t *)&unk_3EC30);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  __chkstk_darwin(v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v7 = *(unsigned __int8 *)(v5 + 80);
  v8 = (v7 + 16) & ~v7;
  v9 = swift_allocObject(&unk_39878, v8 + v6, v7 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  v10 = *(_QWORD *)(a2 + OBJC_IVAR___BMInternalManager_localStorage);
  v11 = swift_allocObject(&unk_398A0, 32, 7);
  *(_QWORD *)(v11 + 16) = sub_1C36C;
  *(_QWORD *)(v11 + 24) = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_398C8, 40, 7);
  v12[2] = v10;
  v12[3] = sub_1B2B8;
  v12[4] = v11;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2BA88((uint64_t)sub_1C718, (uint64_t)v12);
  swift_release(v9);
  swift_release(v11);
  return swift_release(v12);
}

char *Manager.getProperties(config:assetIDs:completion:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  swift_getObjectType(a1);
  return sub_1A99C(a1, a2, a3, a4, v4);
}

uint64_t sub_14284(uint64_t a1, uint64_t (*a2)(_QWORD *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  char v14;
  _BYTE v15[48];
  _BYTE v16[48];

  sub_1BCA8(a1, (uint64_t)v13, &qword_3EB90);
  v4 = v13[0];
  v5 = v13[1];
  v6 = v13[2];
  v7 = v13[3];
  v8 = v13[4];
  v9 = v14;
  sub_1BCA8(a1, (uint64_t)v15, &qword_3EB90);
  if ((v15[41] & 1) != 0)
    return a2(_swiftEmptyArrayStorage);
  sub_D9F8((uint64_t)v15, (uint64_t)v16);
  v11 = sub_44F0(&qword_3EB98);
  v12 = swift_allocObject(v11, 80, 7);
  *(_OWORD *)(v12 + 16) = xmmword_318F0;
  sub_D9F8((uint64_t)v16, v12 + 32);
  sub_E174(v4, v5, v6, v7, v8, v9);
  a2((_QWORD *)v12);
  return swift_bridgeObjectRelease(v12);
}

uint64_t Manager.getProperties(config:assetIDs:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return swift_task_switch(sub_143A4, 0, 0);
}

uint64_t sub_143A4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;

  v2 = v0[4];
  v1 = v0[5];
  v3 = v0[3];
  v4 = (_QWORD *)swift_task_alloc(48);
  v0[6] = v4;
  v4[2] = v1;
  v4[3] = v3;
  v4[4] = v2;
  v5 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  v0[7] = v5;
  v6 = sub_44F0(&qword_3EA88);
  *v5 = v0;
  v5[1] = sub_14464;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 2, 0, 0, 0xD00000000000001FLL, 0x8000000000033310, sub_1B2C8, v4, v6);
}

uint64_t sub_14464()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 56));
  swift_task_dealloc(v1);
  return swift_task_switch(sub_140CC, 0, 0);
}

uint64_t sub_144C0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v8 = sub_44F0((uint64_t *)&unk_3EB80);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  __chkstk_darwin(v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  v11 = *(unsigned __int8 *)(v9 + 80);
  v12 = (v11 + 16) & ~v11;
  v13 = swift_allocObject(&unk_39760, v12 + v10, v11 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v13 + v12, (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  swift_getObjectType(a3);
  sub_1A99C(a3, a4, (uint64_t)sub_1C214, v13, a2);
  return swift_release(v13);
}

uint64_t sub_145C4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v6;

  v6 = a1;
  swift_bridgeObjectRetain(a1, a2);
  v4 = sub_44F0(a3);
  return CheckedContinuation.resume(returning:)(&v6, v4);
}

uint64_t Manager.getProperties(configs:assetIDs:sortByCreatedAt:limit:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 40) = a4;
  *(_QWORD *)(v5 + 48) = v4;
  *(_BYTE *)(v5 + 80) = a3;
  *(_QWORD *)(v5 + 24) = a1;
  *(_QWORD *)(v5 + 32) = a2;
  return swift_task_switch(sub_14628, 0, 0);
}

uint64_t sub_14628(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t isUniquelyReferenced_nonNull_native;
  unint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  char v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  _QWORD *v43;

  v3 = *(_QWORD *)(v2 + 24);
  if ((unint64_t)v3 >> 62)
    goto LABEL_30;
  v4 = *(_QWORD *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFF8));
  result = swift_bridgeObjectRetain(v3, a2);
  if (v4)
  {
    do
    {
      if (v4 < 1)
      {
        __break(1u);
        return result;
      }
      v6 = 0;
      v41 = v3 & 0xC000000000000001;
      v7 = &_swiftEmptyDictionarySingleton;
      v39 = *(_QWORD *)(v40 + 24) + 32;
      while (1)
      {
        if (v41)
        {
          v9 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, *(_QWORD *)(v40 + 24));
        }
        else
        {
          v9 = *(void **)(v39 + 8 * v6);
          swift_unknownObjectRetain(v9);
        }
        v10 = objc_msgSend(v9, "recordType", v39);
        if (v7[2] && (v11 = sub_17088((Swift::UInt)v10), (v12 & 1) != 0))
        {
          v42 = *(_QWORD *)(v7[7] + 8 * v11);
          swift_bridgeObjectRetain(v42, v12);
        }
        else
        {
          v42 = (unint64_t)&_swiftEmptyArrayStorage;
        }
        v13 = objc_msgSend(v9, "toBaseConfiguration");
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v13);
        v15 = *(_QWORD *)((char *)&dword_10 + (v42 & 0xFFFFFFFFFFFFFF8));
        v14 = *(_QWORD *)((char *)&dword_18 + (v42 & 0xFFFFFFFFFFFFFF8));
        if (v15 >= v14 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v14 > 1, v15 + 1, 1);
        v16 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v15, v13);
        specialized Array._endMutation()(v16);
        v17 = objc_msgSend(v9, "recordType");
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v7);
        v43 = v7;
        v3 = (uint64_t)v7;
        v19 = sub_17088((Swift::UInt)v17);
        v20 = v7[2];
        v21 = (a2 & 1) == 0;
        v22 = v20 + v21;
        if (__OFADD__(v20, v21))
          break;
        v23 = a2;
        if (v7[3] >= v22)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          {
            if ((a2 & 1) != 0)
              goto LABEL_5;
          }
          else
          {
            v3 = (uint64_t)&v43;
            sub_18E70();
            v7 = v43;
            if ((v23 & 1) != 0)
              goto LABEL_5;
          }
        }
        else
        {
          sub_17D70(v22, isUniquelyReferenced_nonNull_native);
          v7 = v43;
          v3 = (uint64_t)v43;
          v24 = sub_17088((Swift::UInt)v17);
          if ((v23 & 1) != (a2 & 1))
            return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for PropertyType);
          v19 = v24;
          if ((v23 & 1) != 0)
          {
LABEL_5:
            v8 = v7[7];
            swift_bridgeObjectRelease(*(_QWORD *)(v8 + 8 * v19));
            *(_QWORD *)(v8 + 8 * v19) = v42;
            goto LABEL_6;
          }
        }
        v7[(v19 >> 6) + 8] |= 1 << v19;
        v25 = 8 * v19;
        *(_QWORD *)(v7[6] + v25) = v17;
        *(_QWORD *)(v7[7] + v25) = v42;
        v26 = v7[2];
        v27 = __OFADD__(v26, 1);
        v28 = v26 + 1;
        if (v27)
          goto LABEL_29;
        v7[2] = v28;
LABEL_6:
        swift_bridgeObjectRelease(0x8000000000000000);
        swift_unknownObjectRelease(v9);
        if (v4 == ++v6)
          goto LABEL_35;
      }
      __break(1u);
LABEL_29:
      __break(1u);
LABEL_30:
      if (v3 < 0)
        v29 = v3;
      else
        v29 = v3 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v3, a2);
      result = _CocoaArrayWrapper.endIndex.getter(v29);
      v4 = result;
    }
    while (result);
  }
  v7 = &_swiftEmptyDictionarySingleton;
LABEL_35:
  *(_QWORD *)(v40 + 56) = v7;
  v31 = *(_QWORD *)(v40 + 40);
  v30 = *(_QWORD *)(v40 + 48);
  v32 = *(_BYTE *)(v40 + 80);
  v33 = *(_QWORD *)(v40 + 32);
  swift_bridgeObjectRelease(*(_QWORD *)(v40 + 24));
  v34 = *(_QWORD *)(v30 + OBJC_IVAR___BMInternalManager_localStorage);
  v35 = sub_44F0(&qword_3EA98);
  v36 = swift_task_alloc(64);
  *(_QWORD *)(v40 + 64) = v36;
  *(_QWORD *)(v36 + 16) = v7;
  *(_QWORD *)(v36 + 24) = v34;
  *(_QWORD *)(v36 + 32) = v33;
  *(_BYTE *)(v36 + 40) = v32;
  *(_QWORD *)(v36 + 48) = v31;
  v37 = sub_44F0(&qword_3EAB0);
  v38 = (_QWORD *)swift_task_alloc(async function pointer to withTaskGroup<A, B>(of:returning:isolation:body:)[1]);
  *(_QWORD *)(v40 + 72) = v38;
  *v38 = v40;
  v38[1] = sub_149E8;
  return withTaskGroup<A, B>(of:returning:isolation:body:)(v40 + 16, v35, v37, 0, 0, &unk_3EAA8, v36, v35);
}

uint64_t sub_149E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 64);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 56);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 72));
  swift_bridgeObjectRelease(v2);
  swift_task_dealloc(v1);
  return swift_task_switch(sub_140CC, 0, 0);
}

uint64_t sub_14A50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_BYTE *)(v7 + 328) = a6;
  *(_QWORD *)(v7 + 232) = a5;
  *(_QWORD *)(v7 + 240) = a7;
  *(_QWORD *)(v7 + 216) = a3;
  *(_QWORD *)(v7 + 224) = a4;
  *(_QWORD *)(v7 + 200) = a1;
  *(_QWORD *)(v7 + 208) = a2;
  v8 = (*(_QWORD *)(*(_QWORD *)(sub_44F0(&qword_3EA60) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v7 + 248) = swift_task_alloc(v8);
  *(_QWORD *)(v7 + 256) = swift_task_alloc(v8);
  *(_QWORD *)(v7 + 264) = swift_task_alloc(v8);
  *(_QWORD *)(v7 + 272) = swift_task_alloc(v8);
  *(_QWORD *)(v7 + 280) = swift_task_alloc(v8);
  *(_QWORD *)(v7 + 288) = swift_task_alloc(v8);
  v9 = sub_44F0(&qword_3EBA8);
  *(_QWORD *)(v7 + 296) = v9;
  v10 = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v7 + 304) = v10;
  *(_QWORD *)(v7 + 312) = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_14B24, 0, 0);
}

uint64_t sub_14B24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
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
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  _QWORD *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  unsigned __int8 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t ObjectType;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  _QWORD *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  unsigned __int8 v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  _QWORD *v92;
  unsigned __int8 v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD *v97;
  uint64_t v98;
  uint64_t v99;
  int64_t v100;
  uint64_t v101;
  uint64_t v102;
  int64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  _QWORD *v109;
  _QWORD *v110;
  uint64_t v111;
  char v112;
  uint64_t v113;
  uint64_t v114;
  int64_t v115;
  uint64_t v116;
  int64_t v117;
  unint64_t v118;
  _QWORD *v119;
  _QWORD *v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;

  v119 = (_QWORD *)(v2 + 80);
  v120 = (_QWORD *)(v2 + 48);
  v121 = v2 + 160;
  v122 = v2 + 112;
  v112 = *(_BYTE *)(v2 + 328);
  v3 = *(_QWORD *)(v2 + 216);
  v113 = v2 + 136;
  v114 = v3 + 64;
  v110 = (_QWORD *)(v2 + 16);
  v111 = *(_QWORD *)(v2 + 232);
  v4 = -1;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  if (-v5 < 64)
    v4 = ~(-1 << -(char)v5);
  v6 = v4 & *(_QWORD *)(v3 + 64);
  v115 = (unint64_t)(63 - v5) >> 6;
  v116 = *(_QWORD *)(v2 + 216);
  result = swift_bridgeObjectRetain(v3, a2);
  v9 = v6;
  v10 = 0;
  v129 = v2;
  while (1)
  {
    if (v9)
    {
      v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v12 = v11 | (v10 << 6);
      goto LABEL_22;
    }
    v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
      goto LABEL_79;
    }
    if (v13 >= v115)
      goto LABEL_75;
    v14 = *(_QWORD *)(v114 + 8 * v13);
    ++v10;
    if (!v14)
    {
      v10 = v13 + 1;
      if (v13 + 1 >= v115)
        goto LABEL_75;
      v14 = *(_QWORD *)(v114 + 8 * v10);
      if (!v14)
      {
        v10 = v13 + 2;
        if (v13 + 2 >= v115)
          goto LABEL_75;
        v14 = *(_QWORD *)(v114 + 8 * v10);
        if (!v14)
          break;
      }
    }
LABEL_21:
    v9 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v10 << 6);
LABEL_22:
    v16 = 8 * v12;
    v17 = *(_QWORD *)(*(_QWORD *)(v116 + 48) + 8 * v12);
    v18 = *(_QWORD *)(*(_QWORD *)(v116 + 56) + v16);
    v130 = v18;
    switch(v17)
    {
      case 0:
        v118 = v9;
        if (!((unint64_t)v18 >> 62))
        {
          v39 = *(_QWORD *)((char *)&dword_10 + (v18 & 0xFFFFFFFFFFFFF8));
          result = swift_bridgeObjectRetain(v18, v8);
          if (v39)
            goto LABEL_30;
          goto LABEL_74;
        }
        v100 = v10;
        if (v18 < 0)
          v101 = *(_QWORD *)(*(_QWORD *)(v116 + 56) + v16);
        else
          v101 = v18 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v18, v8);
        v102 = v101;
        v10 = v100;
        result = _CocoaArrayWrapper.endIndex.getter(v102);
        v39 = result;
        if (!result)
          goto LABEL_74;
LABEL_30:
        if (v39 < 1)
          goto LABEL_77;
        v117 = v10;
        v40 = 0;
        v123 = v18 & 0xC000000000000001;
        v125 = v39;
        do
        {
          v127 = v40;
          if (v123)
            v43 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v40, v18);
          else
            v43 = *(id *)(v18 + 8 * v40 + 32);
          v44 = v43;
          v46 = *(_QWORD *)(v2 + 280);
          v45 = *(_QWORD *)(v2 + 288);
          v47 = *(_QWORD *)(v2 + 224);
          v48 = type metadata accessor for TaskPriority(0);
          v49 = *(_QWORD *)(v48 - 8);
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 56))(v45, 1, 1, v48);
          v50 = (_QWORD *)swift_allocObject(&unk_39620, 48, 7);
          v50[2] = 0;
          v51 = v50 + 2;
          v50[3] = 0;
          v50[4] = v47;
          v50[5] = v44;
          sub_D9B4(v45, v46, &qword_3EA60);
          LODWORD(v45) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v49 + 48))(v46, 1, v48);
          swift_retain();
          v52 = v44;
          v53 = *(_QWORD *)(v2 + 280);
          if ((_DWORD)v45 == 1)
          {
            sub_DB08(*(_QWORD *)(v2 + 280), &qword_3EA60);
            v54 = 0;
          }
          else
          {
            v55 = ((uint64_t (*)(void))TaskPriority.rawValue.getter)();
            (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v53, v48);
            v54 = v55;
          }
          v56 = *v51;
          v2 = v129;
          if (*v51)
          {
            v57 = v50[3];
            ObjectType = swift_getObjectType(*v51);
            swift_unknownObjectRetain(v56);
            v59 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v57);
            v61 = v60;
            swift_unknownObjectRelease(v56);
          }
          else
          {
            v59 = 0;
            v61 = 0;
          }
          v62 = **(_QWORD **)(v129 + 208);
          v63 = swift_allocObject(&unk_39648, 32, 7);
          *(_QWORD *)(v63 + 16) = &unk_3EBF0;
          *(_QWORD *)(v63 + 24) = v50;
          v64 = sub_44F0(&qword_3EA98);
          v65 = (_QWORD *)(v61 | v59);
          if (v61 | v59)
          {
            v65 = v120;
            *v120 = 0;
            v120[1] = 0;
            *(_QWORD *)(v129 + 64) = v59;
            *(_QWORD *)(v129 + 72) = v61;
          }
          v18 = v130;
          ++v40;
          v41 = *(_QWORD *)(v129 + 288);
          *(_QWORD *)(v129 + 160) = 1;
          *(_QWORD *)(v129 + 168) = v65;
          *(_QWORD *)(v129 + 176) = v62;
          v42 = swift_task_create(v54 | 0x3100, v121, v64, &unk_3EBF8, v63);

          swift_release(v42);
          sub_DB08(v41, &qword_3EA60);
        }
        while (v125 != v127 + 1);
LABEL_4:
        result = swift_bridgeObjectRelease(v18);
        goto LABEL_5;
      case 1:
        v118 = v9;
        if ((unint64_t)v18 >> 62)
        {
          v103 = v10;
          if (v18 < 0)
            v104 = *(_QWORD *)(*(_QWORD *)(v116 + 56) + v16);
          else
            v104 = v18 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain(v18, v8);
          v105 = v104;
          v10 = v103;
          result = _CocoaArrayWrapper.endIndex.getter(v105);
          v66 = result;
          if (!result)
            goto LABEL_74;
LABEL_46:
          if (v66 < 1)
            goto LABEL_78;
          v117 = v10;
          v67 = 0;
          v124 = v18 & 0xC000000000000001;
          v126 = v66;
          do
          {
            v128 = v67;
            if (v124)
              v70 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v67, v18);
            else
              v70 = *(id *)(v18 + 8 * v67 + 32);
            v71 = v70;
            v73 = *(_QWORD *)(v2 + 264);
            v72 = *(_QWORD *)(v2 + 272);
            v74 = *(_QWORD *)(v2 + 224);
            v75 = type metadata accessor for TaskPriority(0);
            v76 = *(_QWORD *)(v75 - 8);
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v76 + 56))(v72, 1, 1, v75);
            v77 = (_QWORD *)swift_allocObject(&unk_395D0, 48, 7);
            v77[2] = 0;
            v78 = v77 + 2;
            v77[3] = 0;
            v77[4] = v74;
            v77[5] = v71;
            sub_D9B4(v72, v73, &qword_3EA60);
            LODWORD(v72) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v76 + 48))(v73, 1, v75);
            swift_retain();
            v79 = v71;
            v80 = *(_QWORD *)(v2 + 264);
            if ((_DWORD)v72 == 1)
            {
              sub_DB08(*(_QWORD *)(v2 + 264), &qword_3EA60);
              v81 = 0;
            }
            else
            {
              v82 = ((uint64_t (*)(void))TaskPriority.rawValue.getter)();
              (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v80, v75);
              v81 = v82;
            }
            v83 = *v78;
            v2 = v129;
            if (*v78)
            {
              v84 = v77[3];
              v85 = swift_getObjectType(*v78);
              swift_unknownObjectRetain(v83);
              v86 = dispatch thunk of Actor.unownedExecutor.getter(v85, v84);
              v88 = v87;
              swift_unknownObjectRelease(v83);
            }
            else
            {
              v86 = 0;
              v88 = 0;
            }
            v89 = **(_QWORD **)(v129 + 208);
            v90 = swift_allocObject(&unk_395F8, 32, 7);
            *(_QWORD *)(v90 + 16) = &unk_3EBD8;
            *(_QWORD *)(v90 + 24) = v77;
            v91 = sub_44F0(&qword_3EA98);
            v92 = (_QWORD *)(v88 | v86);
            if (v88 | v86)
            {
              v92 = v119;
              *v119 = 0;
              v119[1] = 0;
              *(_QWORD *)(v129 + 96) = v86;
              *(_QWORD *)(v129 + 104) = v88;
            }
            v18 = v130;
            ++v67;
            v68 = *(_QWORD *)(v129 + 272);
            *(_QWORD *)(v129 + 112) = 1;
            *(_QWORD *)(v129 + 120) = v92;
            *(_QWORD *)(v129 + 128) = v89;
            v69 = swift_task_create(v81 | 0x3100, v122, v91, &unk_3EBE0, v90);

            swift_release(v69);
            sub_DB08(v68, &qword_3EA60);
          }
          while (v126 != v128 + 1);
          goto LABEL_4;
        }
        v66 = *(_QWORD *)((char *)&dword_10 + (v18 & 0xFFFFFFFFFFFFF8));
        result = swift_bridgeObjectRetain(v18, v8);
        if (v66)
          goto LABEL_46;
LABEL_74:
        result = swift_bridgeObjectRelease(v18);
        v9 = v118;
        break;
      case 2:
        v117 = v10;
        v118 = v9;
        v19 = *(_QWORD *)(*(_QWORD *)(v116 + 56) + v16);
        v21 = *(_QWORD *)(v2 + 248);
        v20 = *(_QWORD *)(v2 + 256);
        v22 = *(_QWORD *)(v2 + 232);
        v131 = *(_QWORD *)(v2 + 240);
        v23 = *(_QWORD *)(v2 + 224);
        v24 = type metadata accessor for TaskPriority(0);
        v25 = *(_QWORD *)(v24 - 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 56))(v20, 1, 1, v24);
        v26 = swift_allocObject(&unk_39580, 72, 7);
        *(_QWORD *)(v26 + 16) = 0;
        v27 = (uint64_t *)(v26 + 16);
        *(_QWORD *)(v26 + 24) = 0;
        *(_QWORD *)(v26 + 32) = v23;
        *(_QWORD *)(v26 + 40) = v19;
        *(_QWORD *)(v26 + 48) = v22;
        *(_BYTE *)(v26 + 56) = v112;
        *(_QWORD *)(v26 + 64) = v131;
        sub_D9B4(v20, v21, &qword_3EA60);
        LODWORD(v21) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v21, 1, v24);
        swift_bridgeObjectRetain(v19, v28);
        swift_retain();
        v30 = swift_bridgeObjectRetain(v111, v29);
        v31 = *(_QWORD *)(v2 + 248);
        if ((_DWORD)v21 == 1)
        {
          sub_DB08(*(_QWORD *)(v2 + 248), &qword_3EA60);
          v32 = 0;
          v33 = *v27;
          if (!*v27)
            goto LABEL_61;
        }
        else
        {
          v93 = TaskPriority.rawValue.getter(v30);
          (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v31, v24);
          v32 = v93;
          v33 = *v27;
          if (!*v27)
          {
LABEL_61:
            v36 = 0;
            v38 = 0;
            goto LABEL_62;
          }
        }
        v34 = *(_QWORD *)(v26 + 24);
        v35 = swift_getObjectType(v33);
        swift_unknownObjectRetain(v33);
        v36 = dispatch thunk of Actor.unownedExecutor.getter(v35, v34);
        v38 = v37;
        swift_unknownObjectRelease(v33);
LABEL_62:
        v94 = **(_QWORD **)(v2 + 208);
        v95 = swift_allocObject(&unk_395A8, 32, 7);
        *(_QWORD *)(v95 + 16) = &unk_3EBB8;
        *(_QWORD *)(v95 + 24) = v26;
        v96 = sub_44F0(&qword_3EA98);
        v97 = (_QWORD *)(v38 | v36);
        if (v38 | v36)
        {
          v97 = v110;
          *v110 = 0;
          v110[1] = 0;
          *(_QWORD *)(v2 + 32) = v36;
          *(_QWORD *)(v2 + 40) = v38;
        }
        v98 = *(_QWORD *)(v2 + 256);
        *(_QWORD *)(v2 + 136) = 1;
        *(_QWORD *)(v2 + 144) = v97;
        *(_QWORD *)(v2 + 152) = v94;
        v99 = swift_task_create(v32 | 0x3100, v113, v96, &unk_3EBC8, v95);
        swift_release(v99);
        result = sub_DB08(v98, &qword_3EA60);
LABEL_5:
        v10 = v117;
        v9 = v118;
        break;
    }
  }
  v15 = v13 + 3;
  if (v15 >= v115)
  {
LABEL_75:
    swift_release(*(_QWORD *)(v2 + 216));
    v106 = *(uint64_t **)(v2 + 208);
    *(_QWORD *)(v2 + 184) = _swiftEmptyArrayStorage;
    v107 = *v106;
    v108 = sub_44F0(&qword_3EA98);
    TaskGroup.makeAsyncIterator()(v107, v108);
    v109 = (_QWORD *)swift_task_alloc(async function pointer to TaskGroup.Iterator.next(isolation:)[1]);
    *(_QWORD *)(v2 + 320) = v109;
    *v109 = v2;
    v109[1] = sub_1545C;
    return TaskGroup.Iterator.next(isolation:)(v2 + 192, 0, 0, *(_QWORD *)(v2 + 296));
  }
  v14 = *(_QWORD *)(v114 + 8 * v15);
  if (v14)
  {
    v10 = v15;
    goto LABEL_21;
  }
  while (1)
  {
    v10 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v10 >= v115)
      goto LABEL_75;
    v14 = *(_QWORD *)(v114 + 8 * v10);
    ++v15;
    if (v14)
      goto LABEL_21;
  }
LABEL_79:
  __break(1u);
  return result;
}

uint64_t sub_1545C()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 320));
  return swift_task_switch(sub_154B0, 0, 0);
}

uint64_t sub_154B0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;

  v1 = *(_QWORD *)(v0 + 192);
  if (v1)
  {
    sub_1EC8C(v1);
    v2 = (_QWORD *)swift_task_alloc(async function pointer to TaskGroup.Iterator.next(isolation:)[1]);
    *(_QWORD *)(v0 + 320) = v2;
    *v2 = v0;
    v2[1] = sub_1545C;
    return TaskGroup.Iterator.next(isolation:)(v0 + 192, 0, 0, *(_QWORD *)(v0 + 296));
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 312);
    v5 = *(_QWORD *)(v0 + 288);
    v7 = *(_QWORD *)(v0 + 272);
    v6 = *(_QWORD *)(v0 + 280);
    v9 = *(_QWORD *)(v0 + 256);
    v8 = *(_QWORD *)(v0 + 264);
    v13 = *(_QWORD *)(v0 + 248);
    v10 = *(_QWORD **)(v0 + 200);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 304) + 8))(v4, *(_QWORD *)(v0 + 296));
    v11 = *(_QWORD *)(v0 + 184);
    v12 = sub_12A68(v11);
    swift_bridgeObjectRelease(v11);
    *v10 = v12;
    swift_task_dealloc(v4);
    swift_task_dealloc(v5);
    swift_task_dealloc(v6);
    swift_task_dealloc(v7);
    swift_task_dealloc(v8);
    swift_task_dealloc(v9);
    swift_task_dealloc(v13);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_155E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  return swift_task_switch(sub_15600, 0, 0);
}

uint64_t sub_15600()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = swift_task_alloc(32);
  *(_QWORD *)(v0 + 40) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  v2 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(_QWORD *)(v0 + 48) = v2;
  v3 = sub_44F0(&qword_3EA98);
  *v2 = v0;
  v2[1] = sub_1C6CC;
  return withCheckedContinuation<A>(isolation:function:_:)(*(_QWORD *)(v0 + 16), 0, 0, 0xD000000000000036, 0x80000000000334D0, sub_1C010, v1, v3);
}

uint64_t sub_156A4(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  char *v17;
  uint64_t v18;
  uint64_t v20;

  v6 = sub_44F0(&qword_3EC18);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  __chkstk_darwin(v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)&a3[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
  v10 = *(_QWORD *)&a3[OBJC_IVAR___BMBasePropertyConfiguration_eventName + 8];
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v12 = *(unsigned __int8 *)(v7 + 80);
  v13 = (v12 + 16) & ~v12;
  v14 = (v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  v15 = swift_allocObject(&unk_39670, v14 + 8, v12 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v15 + v13, v9, v6);
  *(_QWORD *)(v15 + v14) = a3;
  v16 = (_QWORD *)swift_allocObject(&unk_39698, 56, 7);
  v16[2] = v11;
  v16[3] = v10;
  v16[4] = a2;
  v16[5] = sub_1C01C;
  v16[6] = v15;
  v17 = a3;
  swift_bridgeObjectRetain(v10, v18);
  swift_retain();
  swift_retain();
  sub_2BA88((uint64_t)sub_1BC8C, (uint64_t)v16);
  swift_release(v15);
  return swift_release(v16);
}

uint64_t sub_15800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  return swift_task_switch(sub_1581C, 0, 0);
}

uint64_t sub_1581C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = swift_task_alloc(32);
  *(_QWORD *)(v0 + 40) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  v2 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(_QWORD *)(v0 + 48) = v2;
  v3 = sub_44F0(&qword_3EA98);
  *v2 = v0;
  v2[1] = sub_158C0;
  return withCheckedContinuation<A>(isolation:function:_:)(*(_QWORD *)(v0 + 16), 0, 0, 0xD000000000000036, 0x80000000000334D0, sub_1C068, v1, v3);
}

uint64_t sub_158C0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v5 = *v0;
  v2 = *(_QWORD *)(v5 + 40);
  v1 = *(_QWORD *)(v5 + 48);
  v3 = *v0;
  v5 = v3;
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_15910(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  char *v17;
  uint64_t v18;
  uint64_t v20;

  v6 = sub_44F0(&qword_3EC18);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  __chkstk_darwin(v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)&a3[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
  v10 = *(_QWORD *)&a3[OBJC_IVAR___BMBasePropertyConfiguration_eventName + 8];
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v12 = *(unsigned __int8 *)(v7 + 80);
  v13 = (v12 + 16) & ~v12;
  v14 = (v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  v15 = swift_allocObject(&unk_396C0, v14 + 8, v12 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v15 + v13, v9, v6);
  *(_QWORD *)(v15 + v14) = a3;
  v16 = (_QWORD *)swift_allocObject(&unk_396E8, 56, 7);
  v16[2] = v11;
  v16[3] = v10;
  v16[4] = a2;
  v16[5] = sub_1C01C;
  v16[6] = v15;
  v17 = a3;
  swift_bridgeObjectRetain(v10, v18);
  swift_retain();
  swift_retain();
  sub_2BA88((uint64_t)sub_1BC9C, (uint64_t)v16);
  swift_release(v15);
  return swift_release(v16);
}

uint64_t sub_15A6C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v11;
  _BYTE v12[48];
  _QWORD v13[6];

  sub_1BCA8(a1, (uint64_t)v12, &qword_3EB90);
  if ((v12[41] & 1) != 0)
  {
    v13[0] = _swiftEmptyArrayStorage;
    v5 = sub_44F0(&qword_3EC18);
    v6 = v13;
  }
  else
  {
    sub_D9F8((uint64_t)v12, (uint64_t)v13);
    v7 = sub_44F0(&qword_3EC20);
    v8 = swift_allocObject(v7, 88, 7);
    *(_OWORD *)(v8 + 16) = xmmword_318F0;
    *(_QWORD *)(v8 + 32) = a3;
    sub_D9F8((uint64_t)v13, v8 + 40);
    v11 = v8;
    sub_1C024(a1);
    v9 = a3;
    v5 = sub_44F0(&qword_3EC18);
    v6 = &v11;
  }
  return CheckedContinuation.resume(returning:)(v6, v5);
}

uint64_t sub_15B48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  uint64_t v8;

  *(_QWORD *)(v8 + 40) = a6;
  *(_QWORD *)(v8 + 48) = a8;
  *(_BYTE *)(v8 + 72) = a7;
  *(_QWORD *)(v8 + 24) = a4;
  *(_QWORD *)(v8 + 32) = a5;
  *(_QWORD *)(v8 + 16) = a1;
  return swift_task_switch(sub_15B6C, 0, 0);
}

uint64_t sub_15B6C()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v1 = *(_BYTE *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 48);
  v4 = swift_task_alloc(64);
  *(_QWORD *)(v0 + 56) = v4;
  *(_OWORD *)(v4 + 16) = *(_OWORD *)(v0 + 24);
  *(_QWORD *)(v4 + 32) = v3;
  *(_BYTE *)(v4 + 40) = v1;
  *(_QWORD *)(v4 + 48) = v2;
  v5 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(_QWORD *)(v0 + 64) = v5;
  v6 = sub_44F0(&qword_3EA98);
  *v5 = v0;
  v5[1] = sub_15C2C;
  return withCheckedContinuation<A>(isolation:function:_:)(*(_QWORD *)(v0 + 16), 0, 0, 0xD000000000000036, 0x80000000000334D0, sub_1C148, v4, v6);
}

uint64_t sub_15C2C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v1 = *(_QWORD *)(*v0 + 56);
  v3 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 64));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_15C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = a6;
  v11 = sub_44F0(&qword_3EC18);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  __chkstk_darwin(v11);
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v23 = a3;
    else
      v23 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3, v14);
    v24 = sub_44F0(&qword_3EC28);
    v25 = _bridgeCocoaArray<A>(_:)(v23, v24);
    swift_bridgeObjectRelease(a3);
    a3 = v25;
  }
  else
  {
    v15 = swift_bridgeObjectRetain(a3, v14);
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v15);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v11);
  v16 = *(unsigned __int8 *)(v12 + 80);
  v17 = (v16 + 16) & ~v16;
  v18 = swift_allocObject(&unk_39710, v17 + v13, v16 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v18 + v17, (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
  v19 = swift_allocObject(&unk_39738, 72, 7);
  *(_QWORD *)(v19 + 16) = a3;
  *(_QWORD *)(v19 + 24) = a4;
  *(_BYTE *)(v19 + 32) = a5 & 1;
  *(_QWORD *)(v19 + 40) = v27;
  *(_QWORD *)(v19 + 48) = a2;
  *(_QWORD *)(v19 + 56) = sub_1C168;
  *(_QWORD *)(v19 + 64) = v18;
  swift_bridgeObjectRetain(a4, v20);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain(a3, v21);
  sub_2BA88((uint64_t)sub_1C1F4, v19);
  swift_release(v18);
  swift_bridgeObjectRelease(a3);
  return swift_release(v19);
}

uint64_t sub_15E38(uint64_t a1, char a2)
{
  int64_t v3;
  unint64_t *v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t *v15;
  uint64_t v16;
  id v18;
  uint64_t v19;
  unint64_t *v20;

  if ((a2 & 1) != 0)
  {
    v20 = (unint64_t *)&_swiftEmptyArrayStorage;
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 16);
    v4 = (unint64_t *)&_swiftEmptyArrayStorage;
    if (v3)
    {
      v20 = (unint64_t *)&_swiftEmptyArrayStorage;
      sub_19990(0, v3, 0);
      v4 = (unint64_t *)&_swiftEmptyArrayStorage;
      v5 = (char *)(a1 + 80);
      do
      {
        v6 = (void *)*((_QWORD *)v5 - 6);
        v7 = *((_QWORD *)v5 - 4);
        v8 = *((_QWORD *)v5 - 3);
        v9 = *((_QWORD *)v5 - 2);
        v10 = *((_QWORD *)v5 - 1);
        v11 = *v5;
        v19 = *((_QWORD *)v5 - 5);
        sub_E174(v19, v7, v8, v9, v10, *v5);
        v12 = objc_msgSend(v6, "toBaseConfiguration");
        v20 = v4;
        v14 = v4[2];
        v13 = v4[3];
        if (v14 >= v13 >> 1)
        {
          v18 = v12;
          sub_19990(v13 > 1, v14 + 1, 1);
          v12 = v18;
          v4 = v20;
        }
        v5 += 56;
        v4[2] = v14 + 1;
        v15 = &v4[7 * v14];
        v15[4] = (unint64_t)v12;
        v15[5] = v19;
        v15[6] = v7;
        v15[7] = v8;
        v15[8] = v9;
        v15[9] = v10;
        *((_BYTE *)v15 + 80) = v11;
        --v3;
      }
      while (v3);
    }
    v20 = v4;
  }
  v16 = sub_44F0(&qword_3EC18);
  return CheckedContinuation.resume(returning:)(&v20, v16);
}

uint64_t Manager.getProperties(propertyName:assetIDs:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = v5;
  v12 = *(_QWORD *)(v5 + OBJC_IVAR___BMInternalManager_localStorage);
  v13 = swift_allocObject(&unk_391A0, 24, 7);
  swift_unknownObjectWeakInit(v13 + 16, v6);
  v14 = (_QWORD *)swift_allocObject(&unk_392E0, 48, 7);
  v14[2] = v13;
  v14[3] = a4;
  v14[4] = a5;
  v14[5] = a3;
  v15 = (_QWORD *)swift_allocObject(&unk_39308, 56, 7);
  v15[2] = a1;
  v15[3] = a2;
  v15[4] = v12;
  v15[5] = sub_1B36C;
  v15[6] = v14;
  swift_bridgeObjectRetain(a3, v16);
  swift_bridgeObjectRetain(a2, v17);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2BA88((uint64_t)sub_1B374, (uint64_t)v15);
  swift_release(v13);
  swift_release(v14);
  return swift_release(v15);
}

void sub_160B4(void *a1, char a2, uint64_t a3, void (*a4)(void), uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t Strong;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BYTE v17[24];

  v11 = a3 + 16;
  swift_beginAccess(a3 + 16, v17, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v11);
  if (Strong)
  {
    v13 = (void *)Strong;
    if ((a2 & 1) != 0)
    {
      v16 = a1;
      v15 = sub_44F0((uint64_t *)&unk_3ECD0);
      swift_willThrowTypedImpl(&v16, v15, &protocol self-conformance witness table for Error);
    }
    else if (a1)
    {
      v14 = swift_allocObject(&unk_39468, 32, 7);
      *(_QWORD *)(v14 + 16) = a4;
      *(_QWORD *)(v14 + 24) = a5;
      sub_1BC50(a1, 0);
      sub_1BC50(a1, 0);
      swift_retain();
      sub_1A6D0(a1, a6, (uint64_t)sub_1BC30, v14, (uint64_t)v13);
      swift_release(v14);

      sub_1BC5C(a1, 0);
      sub_1BC5C(a1, 0);
      return;
    }
    ((void (*)(_QWORD))a4)(0);

  }
  else
  {
    a4();
  }
}

uint64_t Manager.getProperties(propertyName:assetIDs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return swift_task_switch(sub_161FC, 0, 0);
}

uint64_t sub_161FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  __int128 v7;

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  v7 = *(_OWORD *)(v0 + 24);
  v3 = swift_task_alloc(48);
  *(_QWORD *)(v0 + 56) = v3;
  *(_QWORD *)(v3 + 16) = v1;
  *(_OWORD *)(v3 + 24) = v7;
  *(_QWORD *)(v3 + 40) = v2;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(_QWORD *)(v0 + 64) = v4;
  v5 = sub_44F0(&qword_3EA88);
  *v4 = v0;
  v4[1] = sub_162C8;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 16, 0, 0, 0xD000000000000025, 0x8000000000033330, sub_1B380, v3, v5);
}

uint64_t sub_162C8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 56);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 64));
  swift_task_dealloc(v1);
  return swift_task_switch(sub_140CC, 0, 0);
}

uint64_t sub_16324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v10 = sub_44F0((uint64_t *)&unk_3EB80);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  __chkstk_darwin(v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 16) & ~v13;
  v15 = swift_allocObject(&unk_393F0, v14 + v12, v13 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v15 + v14, (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  v16 = *(_QWORD *)(a2 + OBJC_IVAR___BMInternalManager_localStorage);
  v17 = swift_allocObject(&unk_391A0, 24, 7);
  swift_unknownObjectWeakInit(v17 + 16, a2);
  v18 = (_QWORD *)swift_allocObject(&unk_39418, 48, 7);
  v18[2] = v17;
  v18[3] = sub_1BBA4;
  v18[4] = v15;
  v18[5] = a5;
  v19 = (_QWORD *)swift_allocObject(&unk_39440, 56, 7);
  v19[2] = a3;
  v19[3] = a4;
  v19[4] = v16;
  v19[5] = sub_1B36C;
  v19[6] = v18;
  swift_bridgeObjectRetain(a5, v20);
  swift_bridgeObjectRetain(a4, v21);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2BA88((uint64_t)sub_1B374, (uint64_t)v19);
  swift_release(v15);
  swift_release(v17);
  swift_release(v18);
  return swift_release(v19);
}

uint64_t sub_164E4(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v5;

  v2 = &_swiftEmptyArrayStorage;
  if (a1)
    v2 = a1;
  v5 = v2;
  swift_bridgeObjectRetain(a1, a2);
  v3 = sub_44F0((uint64_t *)&unk_3EB80);
  return CheckedContinuation.resume(returning:)(&v5, v3);
}

uint64_t Manager.getProperties(propertyNames:assetIDs:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return swift_task_switch(sub_16554, 0, 0);
}

uint64_t sub_16554()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v1 = v0[5];
  v2 = swift_task_alloc(32);
  v0[6] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  v0[7] = v3;
  v4 = sub_44F0(&qword_3EA78);
  *v3 = v0;
  v3[1] = sub_16604;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 2, 0, 0, 0xD000000000000016, 0x80000000000332F0, sub_1C6C0, v2, v4);
}

uint64_t sub_16604()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 56));
  swift_task_dealloc(v1);
  return swift_task_switch(sub_16660, 0, 0);
}

uint64_t sub_16660(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = v2[2];
  v4 = (_QWORD *)v2[3];
  swift_bridgeObjectRetain(v4, a2);
  v5 = sub_1B38C(v3, v4);
  v2[8] = v5;
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  v6 = swift_task_alloc(dword_3EA94);
  v2[9] = v6;
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = sub_16704;
  v8 = v2[4];
  v7 = v2[5];
  *(_QWORD *)(v6 + 40) = 0;
  *(_QWORD *)(v6 + 48) = v7;
  *(_BYTE *)(v6 + 80) = 0;
  *(_QWORD *)(v6 + 24) = v5;
  *(_QWORD *)(v6 + 32) = v8;
  return swift_task_switch(sub_14628, 0, 0);
}

uint64_t sub_16704(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v5;

  v3 = *(_QWORD *)(*v1 + 64);
  v5 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 72));
  swift_bridgeObjectRelease(v3);
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(a1);
}

uint64_t Manager.getEarliestTimestamp(propertyNames:assetIDs:earliestTimestampComparator:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  v6[13] = a5;
  v6[14] = v5;
  v6[11] = a3;
  v6[12] = a4;
  v6[9] = a1;
  v6[10] = a2;
  v7 = sub_44F0(&qword_3EAD0);
  v6[15] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_167C0, 0, 0);
}

uint64_t sub_167C0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v1 = v0[14];
  v2 = swift_task_alloc(32);
  v0[16] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  v0[17] = v3;
  v4 = sub_44F0(&qword_3EA78);
  *v3 = v0;
  v3[1] = sub_16870;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 8, 0, 0, 0xD000000000000016, 0x80000000000332F0, sub_1C6C0, v2, v4);
}

uint64_t sub_16870()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 128);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 136));
  swift_task_dealloc(v1);
  return swift_task_switch(sub_168CC, 0, 0);
}

uint64_t sub_168CC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = v2[10];
  v4 = v2[8];
  swift_bridgeObjectRetain(v3, a2);
  v5 = sub_1B5C0(v4, v3);
  v2[18] = v5;
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v4);
  v6 = swift_task_alloc(dword_3EA94);
  v2[19] = v6;
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = sub_16980;
  v7 = v2[14];
  v8 = v2[11];
  *(_QWORD *)(v6 + 40) = 20;
  *(_QWORD *)(v6 + 48) = v7;
  *(_BYTE *)(v6 + 80) = 1;
  *(_QWORD *)(v6 + 24) = v5;
  *(_QWORD *)(v6 + 32) = v8;
  return swift_task_switch(sub_14628, 0, 0);
}

uint64_t sub_16980(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 144);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 152);
  *(_QWORD *)(*(_QWORD *)v1 + 160) = a1;
  swift_task_dealloc(v2);
  swift_bridgeObjectRelease(v3);
  return swift_task_switch(sub_169E4, 0, 0);
}

uint64_t sub_169E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  v4 = *(_QWORD *)(v1 + 16);
  if (v4)
  {
    v5 = *(_QWORD *)(v0 + 160) + 40;
    do
    {
      v6 = *(_QWORD *)(v0 + 120);
      v7 = *(void (**)(uint64_t, uint64_t))(v0 + 96);
      v8 = *(_QWORD *)(v0 + 72);
      v9 = *(_QWORD *)(v5 - 8);
      sub_D9F8(v5, v0 + 16);
      swift_unknownObjectRetain(v9);
      sub_1B758(v0 + 16, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_E174);
      v7(v0 + 16, v8);
      swift_unknownObjectRelease(v9);
      sub_1B758(v0 + 16, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_ADD4);
      sub_DB08(v8, &qword_3EAD0);
      sub_1BCA8(v6, v8, &qword_3EAD0);
      v5 += 56;
      --v4;
    }
    while (v4);
  }
  v10 = *(_QWORD *)(v0 + 120);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 160));
  swift_task_dealloc(v10);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_16B0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Swift::Int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;
  _QWORD v18[9];

  if (*(_QWORD *)(a3 + 16))
  {
    Hasher.init(_seed:)(v18, *(_QWORD *)(a3 + 40));
    String.hash(into:)(v18, a1, a2);
    v6 = Hasher._finalize()();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t Manager.enumerate(startDate:endDate:closure:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v30 = a5;
  v31 = a6;
  v29 = a3;
  v10 = sub_44F0(&qword_3EAD0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = __chkstk_darwin(v10);
  v14 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v28 - v15;
  v17 = *(_QWORD *)(v6 + OBJC_IVAR___BMInternalManager_localStorage);
  sub_D9B4(a1, (uint64_t)&v28 - v15, &qword_3EAD0);
  sub_D9B4(a2, (uint64_t)v14, &qword_3EAD0);
  v18 = *(unsigned __int8 *)(v11 + 80);
  v19 = (v18 + 24) & ~v18;
  v20 = (v12 + v18 + v19) & ~v18;
  v21 = (v12 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  v22 = (v21 + 23) & 0xFFFFFFFFFFFFFFF8;
  v23 = swift_allocObject(&unk_39330, v22 + 16, v18 | 7);
  *(_QWORD *)(v23 + 16) = v17;
  sub_1BCA8((uint64_t)v16, v23 + v19, &qword_3EAD0);
  sub_1BCA8((uint64_t)v14, v23 + v20, &qword_3EAD0);
  v24 = (_QWORD *)(v23 + v21);
  *v24 = v29;
  v24[1] = a4;
  v25 = (_QWORD *)(v23 + v22);
  v26 = v31;
  *v25 = v30;
  v25[1] = v26;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2BA88((uint64_t)sub_1B898, v23);
  return swift_release(v23);
}

uint64_t Manager.fetchCounts(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return swift_task_switch(sub_16DE4, 0, 0);
}

uint64_t sub_16DE4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v1 = v0[3];
  v2 = *(_QWORD *)(v0[4] + OBJC_IVAR___BMInternalManager_localStorage);
  v3 = swift_task_alloc(32);
  v0[5] = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
  v0[6] = v4;
  v5 = sub_44F0(&qword_3EAE0);
  *v4 = v0;
  v4[1] = sub_16EA8;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 2, 0, 0, 0x756F436863746566, 0xEF293A5F2873746ELL, sub_1B904, v3, v5);
}

uint64_t sub_16EA8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 48);
  *(_QWORD *)(*v1 + 56) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = sub_16F20;
  }
  else
  {
    swift_task_dealloc(*(_QWORD *)(v2 + 40));
    v4 = sub_16F14;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_16F14()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_16F20()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(v0 + 40));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for Manager()
{
  return objc_opt_self(BMInternalManager);
}

uint64_t sub_16F74(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_16FD8;
  return v6(a1);
}

uint64_t sub_16FD8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_17024(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_17140(a1, a2, v5);
}

unint64_t sub_17088(Swift::UInt a1)
{
  uint64_t v1;
  Swift::Int v3;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, *(_QWORD *)(v1 + 40));
  Hasher._combine(_:)(a1);
  v3 = Hasher._finalize()();
  return sub_17220(a1, v3);
}

unint64_t sub_170E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = static Hasher._hash(seed:_:)(*(_QWORD *)(v1 + 40), a1);
  return sub_172BC(a1, v3);
}

unint64_t sub_17110(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_17358(a1, v4);
}

unint64_t sub_17140(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_17220(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_172BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_17358(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    type metadata accessor for BasePropertyConfiguration();
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = static NSObject.== infix(_:_:)();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = static NSObject.== infix(_:_:)();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

uint64_t sub_17460(uint64_t a1, uint64_t a2)
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
  int64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  _QWORD v40[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_44F0(&qword_3EB78);
  v39 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v3;
  v38 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 64;
  result = swift_retain();
  v16 = 0;
  while (1)
  {
    if (v11)
    {
      v22 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v23 = v22 | (v16 << 6);
      goto LABEL_24;
    }
    if (__OFADD__(v16++, 1))
      goto LABEL_43;
    if (v16 >= v12)
      break;
    v25 = (_QWORD *)(v5 + 64);
    v26 = *(_QWORD *)(v38 + 8 * v16);
    if (!v26)
    {
      v27 = v16 + 1;
      if (v16 + 1 >= v12)
      {
LABEL_34:
        swift_release(v5);
        v3 = v37;
        if ((v39 & 1) == 0)
          goto LABEL_41;
        goto LABEL_37;
      }
      v26 = *(_QWORD *)(v38 + 8 * v27);
      if (!v26)
      {
        while (1)
        {
          v16 = v27 + 1;
          if (__OFADD__(v27, 1))
            break;
          if (v16 >= v12)
            goto LABEL_34;
          v26 = *(_QWORD *)(v38 + 8 * v16);
          ++v27;
          if (v26)
            goto LABEL_23;
        }
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
        return result;
      }
      ++v16;
    }
LABEL_23:
    v11 = (v26 - 1) & v26;
    v23 = __clz(__rbit64(v26)) + (v16 << 6);
LABEL_24:
    v28 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v23);
    v30 = *v28;
    v29 = v28[1];
    v31 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v23);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain(v28[1], v15);
      swift_unknownObjectRetain(v31);
    }
    Hasher.init(_seed:)(v40, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v40, v30, v29);
    result = Hasher._finalize()();
    v17 = -1 << *(_BYTE *)(v8 + 32);
    v18 = result & ~v17;
    v19 = v18 >> 6;
    if (((-1 << v18) & ~*(_QWORD *)(v13 + 8 * (v18 >> 6))) != 0)
    {
      v20 = __clz(__rbit64((-1 << v18) & ~*(_QWORD *)(v13 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v17) >> 6;
      do
      {
        if (++v19 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v34 = v19 == v33;
        if (v19 == v33)
          v19 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v13 + 8 * v19);
      }
      while (v35 == -1);
      v20 = __clz(__rbit64(~v35)) + (v19 << 6);
    }
    *(_QWORD *)(v13 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    v21 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v20);
    *v21 = v30;
    v21[1] = v29;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v20) = v31;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v37;
  v25 = (_QWORD *)(v5 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v36 = 1 << *(_BYTE *)(v5 + 32);
  if (v36 >= 64)
    bzero(v25, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v25 = -1 << v36;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_17750(uint64_t a1, uint64_t a2)
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
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  int64_t v38;
  uint64_t v39;
  char v40;
  _QWORD v41[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_44F0(&qword_3EC88);
  v40 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v39 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v37 = v3;
  v38 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v15 = 0;
  while (1)
  {
    if (v11)
    {
      v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v22 = v21 | (v15 << 6);
      goto LABEL_34;
    }
    v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v23 >= v38)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v39 + 8 * v23);
    ++v15;
    if (!v25)
    {
      v15 = v23 + 1;
      if (v23 + 1 >= v38)
        goto LABEL_36;
      v25 = *(_QWORD *)(v39 + 8 * v15);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v38)
        {
LABEL_36:
          swift_release(v5);
          v3 = v37;
          if ((v40 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v25 = *(_QWORD *)(v39 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v15 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_45;
            if (v15 >= v38)
              goto LABEL_36;
            v25 = *(_QWORD *)(v39 + 8 * v15);
            ++v26;
            if (v25)
              goto LABEL_33;
          }
        }
        v15 = v26;
      }
    }
LABEL_33:
    v11 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_34:
    v31 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v22);
    v33 = *v31;
    v32 = v31[1];
    v34 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v22);
    if ((v40 & 1) == 0)
    {
      swift_bridgeObjectRetain(v31[1], v14);
      v35 = v34;
    }
    Hasher.init(_seed:)(v41, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v41, v33, v32);
    result = Hasher._finalize()();
    v16 = -1 << *(_BYTE *)(v8 + 32);
    v17 = result & ~v16;
    v18 = v17 >> 6;
    if (((-1 << v17) & ~*(_QWORD *)(v12 + 8 * (v17 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v12 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v29 = v18 == v28;
        if (v18 == v28)
          v18 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v12 + 8 * v18);
      }
      while (v30 == -1);
      v19 = __clz(__rbit64(~v30)) + (v18 << 6);
    }
    *(_QWORD *)(v12 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    v20 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v19);
    *v20 = v33;
    v20[1] = v32;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v19) = v34;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v37;
  v24 = (_QWORD *)(v5 + 64);
  if ((v40 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v36 = 1 << *(_BYTE *)(v5 + 32);
  if (v36 >= 64)
    bzero(v24, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v36;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

uint64_t sub_17A5C(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  char v39;
  _QWORD v40[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_44F0(&qword_3ECA8);
  v39 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v38 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v37 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v15 = 0;
  while (1)
  {
    if (v11)
    {
      v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v22 = v21 | (v15 << 6);
      goto LABEL_34;
    }
    v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v23 >= v37)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v38 + 8 * v23);
    ++v15;
    if (!v25)
    {
      v15 = v23 + 1;
      if (v23 + 1 >= v37)
        goto LABEL_36;
      v25 = *(_QWORD *)(v38 + 8 * v15);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v37)
        {
LABEL_36:
          swift_release(v5);
          if ((v39 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v25 = *(_QWORD *)(v38 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v15 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_45;
            if (v15 >= v37)
              goto LABEL_36;
            v25 = *(_QWORD *)(v38 + 8 * v15);
            ++v26;
            if (v25)
              goto LABEL_33;
          }
        }
        v15 = v26;
      }
    }
LABEL_33:
    v11 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_34:
    v31 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v22);
    v33 = *v31;
    v32 = v31[1];
    v34 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v22);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain(v31[1], v14);
      swift_bridgeObjectRetain(v34, v35);
    }
    Hasher.init(_seed:)(v40, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v40, v33, v32);
    result = Hasher._finalize()();
    v16 = -1 << *(_BYTE *)(v8 + 32);
    v17 = result & ~v16;
    v18 = v17 >> 6;
    if (((-1 << v17) & ~*(_QWORD *)(v12 + 8 * (v17 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v12 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v29 = v18 == v28;
        if (v18 == v28)
          v18 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v12 + 8 * v18);
      }
      while (v30 == -1);
      v19 = __clz(__rbit64(~v30)) + (v18 << 6);
    }
    *(_QWORD *)(v12 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    v20 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v19);
    *v20 = v33;
    v20[1] = v32;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v19) = v34;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v24 = (_QWORD *)(v5 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v36 = 1 << *(_BYTE *)(v5 + 32);
  if (v36 >= 64)
    bzero(v24, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v36;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_17D70(uint64_t a1, uint64_t a2)
{
  Swift::Int *v2;
  Swift::Int *v3;
  Swift::Int v5;
  uint64_t v6;
  Swift::Int result;
  uint64_t v8;
  Swift::Int v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  Swift::Int v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  Swift::UInt v31;
  uint64_t v32;
  uint64_t v33;
  Swift::Int *v34;
  int64_t v35;
  _QWORD *v36;
  uint64_t v37[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_44F0(&qword_3EBA0);
  result = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v9 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v34 = v3;
    v10 = 0;
    v36 = (_QWORD *)(v5 + 64);
    v11 = 1 << *(_BYTE *)(v5 + 32);
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v13 = v12 & *(_QWORD *)(v5 + 64);
    v35 = (unint64_t)(v11 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v13)
      {
        v20 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v21 = v20 | (v10 << 6);
      }
      else
      {
        v22 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v22 >= v35)
          goto LABEL_36;
        v23 = v36[v22];
        ++v10;
        if (!v23)
        {
          v10 = v22 + 1;
          if (v22 + 1 >= v35)
            goto LABEL_36;
          v23 = v36[v10];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v35)
            {
LABEL_36:
              if ((a2 & 1) == 0)
              {
                result = swift_release(v5);
                v3 = v34;
                goto LABEL_43;
              }
              v33 = 1 << *(_BYTE *)(v5 + 32);
              if (v33 >= 64)
                bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v36 = -1 << v33;
              v3 = v34;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v23 = v36[v24];
            if (!v23)
            {
              while (1)
              {
                v10 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_45;
                if (v10 >= v35)
                  goto LABEL_36;
                v23 = v36[v10];
                ++v24;
                if (v23)
                  goto LABEL_33;
              }
            }
            v10 = v24;
          }
        }
LABEL_33:
        v13 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v10 << 6);
      }
      v29 = 8 * v21;
      v30 = *(_QWORD *)(v5 + 56);
      v31 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v29);
      v32 = *(_QWORD *)(v30 + v29);
      if ((a2 & 1) == 0)
        swift_bridgeObjectRetain(*(_QWORD *)(v30 + v29), v8);
      Hasher.init(_seed:)(v37, *(_QWORD *)(v9 + 40));
      Hasher._combine(_:)(v31);
      result = Hasher._finalize()();
      v15 = -1 << *(_BYTE *)(v9 + 32);
      v16 = result & ~v15;
      v17 = v16 >> 6;
      if (((-1 << v16) & ~*(_QWORD *)(v14 + 8 * (v16 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v14 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_44;
          }
          v27 = v17 == v26;
          if (v17 == v26)
            v17 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v14 + 8 * v17);
        }
        while (v28 == -1);
        v18 = __clz(__rbit64(~v28)) + (v17 << 6);
      }
      *(_QWORD *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      v19 = 8 * v18;
      *(_QWORD *)(*(_QWORD *)(v9 + 48) + v19) = v31;
      *(_QWORD *)(*(_QWORD *)(v9 + 56) + v19) = v32;
      ++*(_QWORD *)(v9 + 16);
    }
  }
  result = swift_release(v5);
LABEL_43:
  *v3 = v9;
  return result;
}

uint64_t sub_18048(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;
  _QWORD v40[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_44F0(&qword_3EB70);
  v39 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v38 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v36 = v3;
  v37 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v15 = 0;
  while (1)
  {
    if (v11)
    {
      v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v22 = v21 | (v15 << 6);
      goto LABEL_34;
    }
    v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v23 >= v37)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v38 + 8 * v23);
    ++v15;
    if (!v25)
    {
      v15 = v23 + 1;
      if (v23 + 1 >= v37)
        goto LABEL_36;
      v25 = *(_QWORD *)(v38 + 8 * v15);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v37)
        {
LABEL_36:
          swift_release(v5);
          v3 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v25 = *(_QWORD *)(v38 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v15 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_45;
            if (v15 >= v37)
              goto LABEL_36;
            v25 = *(_QWORD *)(v38 + 8 * v15);
            ++v26;
            if (v25)
              goto LABEL_33;
          }
        }
        v15 = v26;
      }
    }
LABEL_33:
    v11 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_34:
    v31 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v22);
    v33 = *v31;
    v32 = v31[1];
    v34 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v22);
    if ((v39 & 1) == 0)
      swift_bridgeObjectRetain(v31[1], v14);
    Hasher.init(_seed:)(v40, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v40, v33, v32);
    result = Hasher._finalize()();
    v16 = -1 << *(_BYTE *)(v8 + 32);
    v17 = result & ~v16;
    v18 = v17 >> 6;
    if (((-1 << v17) & ~*(_QWORD *)(v12 + 8 * (v17 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v12 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v29 = v18 == v28;
        if (v18 == v28)
          v18 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v12 + 8 * v18);
      }
      while (v30 == -1);
      v19 = __clz(__rbit64(~v30)) + (v18 << 6);
    }
    *(_QWORD *)(v12 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    v20 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v19);
    *v20 = v33;
    v20[1] = v32;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v19) = v34;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v36;
  v24 = (_QWORD *)(v5 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v24, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

uint64_t sub_18350(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  int64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  char v35[8];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_44F0(&qword_3EB68);
  result = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v34 = v3;
    v9 = 0;
    v10 = (_QWORD *)(v5 + 64);
    v11 = 1 << *(_BYTE *)(v5 + 32);
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v13 = v12 & *(_QWORD *)(v5 + 64);
    v14 = (unint64_t)(v11 + 63) >> 6;
    v15 = result + 64;
    while (1)
    {
      if (v13)
      {
        v18 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v19 = v18 | (v9 << 6);
      }
      else
      {
        v20 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
          return result;
        }
        if (v20 >= v14)
          goto LABEL_37;
        v21 = v10[v20];
        ++v9;
        if (!v21)
        {
          v9 = v20 + 1;
          if (v20 + 1 >= v14)
            goto LABEL_37;
          v21 = v10[v9];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v14)
            {
LABEL_37:
              if ((a2 & 1) == 0)
              {
                result = swift_release(v5);
                v3 = v34;
                goto LABEL_44;
              }
              v33 = 1 << *(_BYTE *)(v5 + 32);
              if (v33 >= 64)
                bzero((void *)(v5 + 64), ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v10 = -1 << v33;
              v3 = v34;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v10[v22];
            if (!v21)
            {
              while (1)
              {
                v9 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_46;
                if (v9 >= v14)
                  goto LABEL_37;
                v21 = v10[v9];
                ++v22;
                if (v21)
                  goto LABEL_24;
              }
            }
            v9 = v22;
          }
        }
LABEL_24:
        v13 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v9 << 6);
      }
      v23 = 8 * v19;
      v24 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v23);
      v25 = *(_QWORD *)(v5 + 56) + v23;
      if ((a2 & 1) != 0)
        sub_1BB5C(v25, (uint64_t)v35);
      else
        sub_1BB20(v25, (uint64_t)v35);
      result = static Hasher._hash(seed:_:)(*(_QWORD *)(v8 + 40), v24);
      v26 = -1 << *(_BYTE *)(v8 + 32);
      v27 = result & ~v26;
      v28 = v27 >> 6;
      if (((-1 << v27) & ~*(_QWORD *)(v15 + 8 * (v27 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v15 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v29 = 0;
        v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_45;
          }
          v31 = v28 == v30;
          if (v28 == v30)
            v28 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v15 + 8 * v28);
        }
        while (v32 == -1);
        v16 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(_QWORD *)(v15 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      v17 = 8 * v16;
      *(_QWORD *)(*(_QWORD *)(v8 + 48) + v17) = v24;
      result = sub_1BB5C((uint64_t)v35, *(_QWORD *)(v8 + 56) + v17);
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release(v5);
LABEL_44:
  *v3 = v8;
  return result;
}

uint64_t sub_18618(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
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
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  id v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  uint64_t i;
  char v44;
  uint64_t v45;

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_44F0(&qword_3EC68);
  v44 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v45 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v42 = (_QWORD *)(v5 + 64);
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v40 = v2;
  v41 = (unint64_t)(v8 + 63) >> 6;
  v11 = v7 + 64;
  result = swift_retain();
  v13 = v45;
  v14 = 0;
  for (i = v5; ; v5 = i)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
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
    if (v22 >= v41)
      break;
    v23 = v42;
    v24 = v42[v22];
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v41)
        goto LABEL_36;
      v24 = v42[v14];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v41)
        {
LABEL_36:
          swift_release(v5);
          v3 = v40;
          if ((v44 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v24 = v42[v25];
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_45;
            if (v14 >= v41)
              goto LABEL_36;
            v24 = v42[v14];
            ++v25;
            if (v24)
              goto LABEL_33;
          }
        }
        v14 = v25;
      }
    }
LABEL_33:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    v30 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v21);
    v31 = *(_QWORD *)(v5 + 56) + 48 * v21;
    v32 = *(_QWORD *)v31;
    v33 = *(_QWORD *)(v31 + 8);
    v34 = *(_QWORD *)(v31 + 16);
    v35 = *(_QWORD *)(v31 + 24);
    v36 = *(_QWORD *)(v31 + 32);
    v37 = *(_BYTE *)(v31 + 40);
    if ((v44 & 1) == 0)
    {
      v38 = v30;
      sub_E174(v32, v33, v34, v35, v36, v37);
      v13 = v45;
    }
    result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v13 + 40));
    v13 = v45;
    v15 = -1 << *(_BYTE *)(v45 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v11 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v11 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
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
        v29 = *(_QWORD *)(v11 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v11 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(_QWORD *)(*(_QWORD *)(v45 + 48) + 8 * v18) = v30;
    v19 = *(_QWORD *)(v45 + 56) + 48 * v18;
    *(_QWORD *)v19 = v32;
    *(_QWORD *)(v19 + 8) = v33;
    *(_QWORD *)(v19 + 16) = v34;
    *(_QWORD *)(v19 + 24) = v35;
    *(_QWORD *)(v19 + 32) = v36;
    *(_BYTE *)(v19 + 40) = v37;
    ++*(_QWORD *)(v45 + 16);
  }
  swift_release(v5);
  v3 = v40;
  v23 = v42;
  if ((v44 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v39 = 1 << *(_BYTE *)(v5 + 32);
  if (v39 >= 64)
    bzero(v23, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v39;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v45;
  return result;
}

void *sub_18954()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  sub_44F0(&qword_3EB78);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v5 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
    result = (void *)swift_release(v2);
    *v1 = v5;
    return result;
  }
  result = (void *)(v3 + 64);
  v7 = v2 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v2 || (unint64_t)result >= v2 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v2 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v2 + 16);
  v11 = 1 << *(_BYTE *)(v2 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v2 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v10++, 1))
      goto LABEL_26;
    if (v10 >= v14)
      goto LABEL_24;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    if (!v24)
      break;
LABEL_23:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain(v19, v4);
    result = (void *)swift_unknownObjectRetain(v21);
  }
  v25 = v10 + 1;
  if (v10 + 1 >= v14)
    goto LABEL_24;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    ++v10;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_24;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void *sub_18AF0()
{
  return sub_1959C(&qword_3EC90, (void (*)(unint64_t, _BYTE *))sub_DACC, (void (*)(_BYTE *, uint64_t))sub_DB44);
}

id sub_18B0C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  sub_44F0(&qword_3EC88);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v5 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release(v2);
    *v1 = v5;
    return result;
  }
  result = (id)(v3 + 64);
  v7 = v2 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v2 || (unint64_t)result >= v2 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v2 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v2 + 16);
  v11 = 1 << *(_BYTE *)(v2 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v2 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      v10 = v23 + 1;
      if (v23 + 1 >= v14)
        goto LABEL_26;
      v24 = *(_QWORD *)(v7 + 8 * v10);
      if (!v24)
        break;
    }
LABEL_25:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(void **)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain(v19, v4);
    result = v21;
  }
  v25 = v23 + 2;
  if (v25 >= v14)
    goto LABEL_26;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_18CBC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;

  v1 = v0;
  sub_44F0(&qword_3ECA8);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v5 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
    *v1 = v5;
    return result;
  }
  result = (void *)(v3 + 64);
  v7 = v2 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v2 || (unint64_t)result >= v2 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v2 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v2 + 16);
  v11 = 1 << *(_BYTE *)(v2 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v2 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v14)
      goto LABEL_26;
    v25 = *(_QWORD *)(v7 + 8 * v24);
    ++v10;
    if (!v25)
    {
      v10 = v24 + 1;
      if (v24 + 1 >= v14)
        goto LABEL_26;
      v25 = *(_QWORD *)(v7 + 8 * v10);
      if (!v25)
        break;
    }
LABEL_25:
    v13 = (v25 - 1) & v25;
    v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain(v19, v4);
    result = (void *)swift_bridgeObjectRetain(v21, v23);
  }
  v26 = v24 + 2;
  if (v26 >= v14)
    goto LABEL_26;
  v25 = *(_QWORD *)(v7 + 8 * v26);
  if (v25)
  {
    v10 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v25 = *(_QWORD *)(v7 + 8 * v10);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_18E70()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v1 = v0;
  sub_44F0(&qword_3EBA0);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v5 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
    *v1 = v5;
    return result;
  }
  result = (void *)(v3 + 64);
  v7 = v2 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v2 || (unint64_t)result >= v2 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v2 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v2 + 16);
  v11 = 1 << *(_BYTE *)(v2 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v2 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v14)
      goto LABEL_26;
    v20 = *(_QWORD *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v14)
        goto LABEL_26;
      v20 = *(_QWORD *)(v7 + 8 * v10);
      if (!v20)
        break;
    }
LABEL_25:
    v13 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v17) = v18;
    result = (void *)swift_bridgeObjectRetain(v18, v4);
  }
  v21 = v19 + 2;
  if (v21 >= v14)
    goto LABEL_26;
  v20 = *(_QWORD *)(v7 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v20 = *(_QWORD *)(v7 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_19010()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;

  v1 = v0;
  sub_44F0(&qword_3EB70);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v5 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
    *v1 = v5;
    return result;
  }
  result = (void *)(v3 + 64);
  v7 = v2 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v2 || (unint64_t)result >= v2 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v2 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v2 + 16);
  v11 = 1 << *(_BYTE *)(v2 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v2 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v14)
      goto LABEL_26;
    v25 = *(_QWORD *)(v7 + 8 * v24);
    ++v10;
    if (!v25)
    {
      v10 = v24 + 1;
      if (v24 + 1 >= v14)
        goto LABEL_26;
      v25 = *(_QWORD *)(v7 + 8 * v10);
      if (!v25)
        break;
    }
LABEL_25:
    v13 = (v25 - 1) & v25;
    v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v16);
    v20 = *v18;
    v19 = v18[1];
    v21 = 8 * v16;
    v22 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v21);
    v23 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v23 = v20;
    v23[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v21) = v22;
    result = (void *)swift_bridgeObjectRetain(v19, v4);
  }
  v26 = v24 + 2;
  if (v26 >= v14)
    goto LABEL_26;
  v25 = *(_QWORD *)(v7 + 8 * v26);
  if (v25)
  {
    v10 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v25 = *(_QWORD *)(v7 + 8 * v10);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_191BC()
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
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  char v21[8];

  v1 = v0;
  sub_44F0(&qword_3EB68);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    sub_1BB20(*(_QWORD *)(v2 + 56) + 8 * v15, (uint64_t)v21);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = (void *)sub_1BB5C((uint64_t)v21, *(_QWORD *)(v4 + 56) + v16);
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_19378()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *result;
  unint64_t v5;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  id v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  int64_t v29;
  uint64_t v30;

  sub_44F0(&qword_3EC68);
  v28 = v0;
  v1 = *v0;
  v2 = static _DictionaryStorage.copy(original:)(*v0);
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v1);
    *v28 = v3;
    return result;
  }
  result = (void *)(v2 + 64);
  v5 = (unint64_t)((1 << *(_BYTE *)(v3 + 32)) + 63) >> 6;
  if (v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v5)
    result = memmove(result, (const void *)(v1 + 64), 8 * v5);
  v30 = v1 + 64;
  v7 = 0;
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(v1 + 16);
  v8 = 1 << *(_BYTE *)(v1 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(v1 + 64);
  v29 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      v11 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v12 = v11 | (v7 << 6);
      goto LABEL_12;
    }
    v25 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v29)
      goto LABEL_26;
    v26 = *(_QWORD *)(v30 + 8 * v25);
    ++v7;
    if (!v26)
    {
      v7 = v25 + 1;
      if (v25 + 1 >= v29)
        goto LABEL_26;
      v26 = *(_QWORD *)(v30 + 8 * v7);
      if (!v26)
        break;
    }
LABEL_25:
    v10 = (v26 - 1) & v26;
    v12 = __clz(__rbit64(v26)) + (v7 << 6);
LABEL_12:
    v13 = 8 * v12;
    v14 = *(void **)(*(_QWORD *)(v1 + 48) + 8 * v12);
    v15 = 48 * v12;
    v16 = *(_QWORD *)(v1 + 56) + v15;
    v17 = *(_QWORD *)v16;
    v18 = *(_QWORD *)(v16 + 8);
    v19 = *(_QWORD *)(v16 + 16);
    v20 = *(_QWORD *)(v16 + 24);
    v21 = *(_QWORD *)(v16 + 32);
    v22 = *(_BYTE *)(v16 + 40);
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + v13) = v14;
    v23 = *(_QWORD *)(v3 + 56) + v15;
    *(_QWORD *)v23 = v17;
    *(_QWORD *)(v23 + 8) = v18;
    *(_QWORD *)(v23 + 16) = v19;
    *(_QWORD *)(v23 + 24) = v20;
    *(_QWORD *)(v23 + 32) = v21;
    *(_BYTE *)(v23 + 40) = v22;
    v24 = v14;
    result = (void *)sub_E174(v17, v18, v19, v20, v21, v22);
  }
  v27 = v25 + 2;
  if (v27 >= v29)
    goto LABEL_26;
  v26 = *(_QWORD *)(v30 + 8 * v27);
  if (v26)
  {
    v7 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v7 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v7 >= v29)
      goto LABEL_26;
    v26 = *(_QWORD *)(v30 + 8 * v7);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_19580()
{
  return sub_1959C(&qword_3E9F0, (void (*)(unint64_t, _BYTE *))sub_1C6BC, (void (*)(_BYTE *, uint64_t))sub_DB44);
}

void *sub_1959C(uint64_t *a1, void (*a2)(unint64_t, _BYTE *), void (*a3)(_BYTE *, uint64_t))
{
  uint64_t *v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  unint64_t v10;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t *v29;
  uint64_t v30;
  _BYTE v32[32];

  v5 = v3;
  sub_44F0(a1);
  v6 = *v3;
  v7 = static _DictionaryStorage.copy(original:)(*v3);
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release(v6);
LABEL_28:
    *v5 = v8;
    return result;
  }
  v29 = v5;
  result = (void *)(v7 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  v30 = v6 + 64;
  v12 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v13 = 1 << *(_BYTE *)(v6 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v6 + 64);
  v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v18 = v17 | (v12 << 6);
      goto LABEL_12;
    }
    v26 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v26 >= v16)
      goto LABEL_26;
    v27 = *(_QWORD *)(v30 + 8 * v26);
    ++v12;
    if (!v27)
    {
      v12 = v26 + 1;
      if (v26 + 1 >= v16)
        goto LABEL_26;
      v27 = *(_QWORD *)(v30 + 8 * v12);
      if (!v27)
        break;
    }
LABEL_25:
    v15 = (v27 - 1) & v27;
    v18 = __clz(__rbit64(v27)) + (v12 << 6);
LABEL_12:
    v19 = 16 * v18;
    v20 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v18);
    v21 = *v20;
    v22 = v20[1];
    v23 = 32 * v18;
    a2(*(_QWORD *)(v6 + 56) + 32 * v18, v32);
    v24 = (_QWORD *)(*(_QWORD *)(v8 + 48) + v19);
    *v24 = v21;
    v24[1] = v22;
    a3(v32, *(_QWORD *)(v8 + 56) + v23);
    result = (void *)swift_bridgeObjectRetain(v22, v25);
  }
  v28 = v26 + 2;
  if (v28 >= v16)
  {
LABEL_26:
    result = (void *)swift_release(v6);
    v5 = v29;
    goto LABEL_28;
  }
  v27 = *(_QWORD *)(v30 + 8 * v28);
  if (v27)
  {
    v12 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v12 >= v16)
      goto LABEL_26;
    v27 = *(_QWORD *)(v30 + 8 * v12);
    ++v28;
    if (v27)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

_QWORD *sub_1978C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return &_swiftEmptyArrayStorage;
  v3 = sub_44F0(&qword_3ECB8);
  v4 = (_QWORD *)swift_allocObject(v3, 16 * v1 + 32, 7);
  v5 = j__malloc_size(v4);
  v6 = v5 - 32;
  if (v5 < 32)
    v6 = v5 - 17;
  v4[2] = v1;
  v4[3] = 2 * (v6 >> 4);
  v7 = sub_19D6C((uint64_t)&v11, v4 + 4, v1, a1);
  v8 = v11;
  swift_bridgeObjectRetain(a1, v9);
  sub_B28C(v8);
  if (v7 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v4;
}

_QWORD *sub_19870(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v3 = *(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8));
  if (!v3)
    return &_swiftEmptyArrayStorage;
  while (1)
  {
    if (v3 <= 0)
    {
      v5 = &_swiftEmptyArrayStorage;
    }
    else
    {
      v4 = sub_44F0(&qword_3E920);
      v5 = (_QWORD *)swift_allocObject(v4, 8 * v3 + 32, 7);
      v6 = j__malloc_size(v5);
      v7 = v6 - 32;
      if (v6 < 32)
        v7 = v6 - 25;
      v5[2] = v3;
      v5[3] = (2 * (v7 >> 3)) | 1;
    }
    swift_bridgeObjectRetain(v2, a2);
    v8 = sub_19B5C((unint64_t)(v5 + 4), v3, v2);
    v2 = v9;
    swift_bridgeObjectRelease(v8);
    if (v2 == v3)
      break;
    __break(1u);
LABEL_10:
    if (v2 < 0)
      v10 = v2;
    else
      v10 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v2, a2);
    v3 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(v2);
    if (!v3)
      return &_swiftEmptyArrayStorage;
  }
  return v5;
}

uint64_t sub_19964(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_199BC(a1, a2, a3, (_QWORD *)*v3, &qword_3EC10, &qword_3EC08);
  *v3 = result;
  return result;
}

uint64_t sub_19990(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_199BC(a1, a2, a3, (_QWORD *)*v3, &qword_3EC20, &qword_3EC00);
  *v3 = result;
  return result;
}

uint64_t sub_199BC(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  _QWORD *v16;
  _QWORD *v17;
  size_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (v12)
  {
    v13 = sub_44F0(a5);
    v14 = (_QWORD *)swift_allocObject(v13, 56 * v12 + 32, 7);
    v15 = j__malloc_size(v14);
    v14[2] = v11;
    v14[3] = 2 * ((uint64_t)(v15 - 32) / 56);
  }
  else
  {
    v14 = &_swiftEmptyArrayStorage;
  }
  v16 = v14 + 4;
  v17 = a4 + 4;
  v18 = 7 * v11;
  if ((a1 & 1) != 0)
  {
    if (v14 != a4 || v16 >= &v17[v18])
      memmove(v14 + 4, a4 + 4, v18 * 8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v17 >= &v16[v18] || v16 >= &v17[v18])
  {
    sub_44F0(a6);
    swift_arrayInitWithCopy(v14 + 4);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v14;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_19B5C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t i;
  void (*v14)(_QWORD *);
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t *v19[4];

  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v17 = a3;
    else
      v17 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3, a2);
    v7 = _CocoaArrayWrapper.endIndex.getter(v17);
    swift_bridgeObjectRelease(a3);
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8));
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_25;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    if (a3 < 0)
      v10 = a3;
    else
      v10 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3, a2);
    v11 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a3);
    if (v11 <= a2)
    {
      if (v7 >= 1)
      {
        sub_D974(&qword_3EC50, &qword_3EC48, (uint64_t)&protocol conformance descriptor for [A]);
        swift_bridgeObjectRetain(a3, v12);
        for (i = 0; i != v7; ++i)
        {
          sub_44F0(&qword_3EC48);
          v14 = sub_28904(v19, i, a3);
          v16 = *v15;
          swift_unknownObjectRetain(*v15);
          ((void (*)(uint64_t **, _QWORD))v14)(v19, 0);
          *(_QWORD *)(a1 + 8 * i) = v16;
        }
        swift_bridgeObjectRelease(a3);
        return a3;
      }
      goto LABEL_24;
    }
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = *(_QWORD *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_44F0(&qword_3EC40);
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_19D6C(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain(v21, a2);
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain(v21, a2);
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_19F68(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  id v36;
  uint64_t v37;
  uint64_t v39;
  os_log_type_t type;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  if (qword_3E6A0 != -1)
    swift_once(&qword_3E6A0, sub_10B64);
  v6 = type metadata accessor for Logger(0);
  sub_AD78(v6, (uint64_t)qword_3FA80);
  v7 = a1;
  swift_bridgeObjectRetain_n(a2, 2);
  v8 = v7;
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    type = v10;
    v11 = swift_slowAlloc(22, -1);
    v39 = swift_slowAlloc(64, -1);
    v43 = v39;
    *(_DWORD *)v11 = 136315394;
    v12 = objc_msgSend(v8, "eventName");
    v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12, v13);
    v41 = a3;
    v16 = v15;

    v42 = sub_282C4(v14, v16, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, &v43, v11 + 4, v11 + 12);

    swift_bridgeObjectRelease(v16);
    *(_WORD *)(v11 + 12) = 2080;
    swift_bridgeObjectRetain(a2, v17);
    v18 = sub_44F0(&qword_3E950);
    v19 = Array.description.getter(a2, v18);
    v21 = v20;
    swift_bridgeObjectRelease(a2);
    v22 = sub_1AF2C(500, v19, v21);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    swift_bridgeObjectRelease(v21);
    v29 = static String._fromSubstring(_:)(v22, v24, v26, v28);
    v31 = v30;
    swift_bridgeObjectRelease(v28);
    v32 = v29;
    a3 = v41;
    v42 = sub_282C4(v32, v31, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, &v43, v11 + 14, v11 + 22);
    swift_bridgeObjectRelease_n(a2, 2);
    swift_bridgeObjectRelease(v31);
    _os_log_impl(&dword_0, v9, type, "-- Storing Values for %s: %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy(v39, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v39, -1, -1);
    swift_slowDealloc(v11, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
  }
  v33 = *(_QWORD *)(a3 + OBJC_IVAR___BMInternalManager_localStorage);
  v34 = swift_allocObject(&unk_39918, 24, 7);
  *(_QWORD *)(v34 + 16) = v8;
  v35 = (_QWORD *)swift_allocObject(&unk_39940, 56, 7);
  v35[2] = v33;
  v35[3] = v8;
  v35[4] = sub_1C4B8;
  v35[5] = v34;
  v35[6] = a2;
  swift_unknownObjectRetain(v8);
  v36 = v8;
  swift_bridgeObjectRetain(a2, v37);
  swift_retain(v33);
  swift_retain(v34);
  sub_2BA88((uint64_t)sub_1C4C8, (uint64_t)v35);
  swift_release(v34);
  return swift_release(v35);
}

uint64_t sub_1A2C0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v37;
  os_log_type_t type;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  if (qword_3E6A0 != -1)
    swift_once(&qword_3E6A0, sub_10B64);
  v6 = type metadata accessor for Logger(0);
  sub_AD78(v6, (uint64_t)qword_3FA80);
  swift_unknownObjectRetain_n(a1, 2);
  v7 = swift_bridgeObjectRetain_n(a2, 2);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    type = v9;
    v10 = swift_slowAlloc(22, -1);
    v37 = swift_slowAlloc(64, -1);
    v41 = v37;
    *(_DWORD *)v10 = 136315394;
    v11 = objc_msgSend(a1, "eventName");
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11, v12);
    v39 = a3;
    v15 = v14;

    v40 = sub_282C4(v13, v15, &v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41, v10 + 4, v10 + 12);
    swift_unknownObjectRelease_n(a1, 2);
    swift_bridgeObjectRelease(v15);
    *(_WORD *)(v10 + 12) = 2080;
    swift_bridgeObjectRetain(a2, v16);
    v17 = sub_44F0(&qword_3E950);
    v18 = Array.description.getter(a2, v17);
    v20 = v19;
    swift_bridgeObjectRelease(a2);
    v21 = sub_1AF2C(500, v18, v20);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    swift_bridgeObjectRelease(v20);
    v28 = static String._fromSubstring(_:)(v21, v23, v25, v27);
    v30 = v29;
    swift_bridgeObjectRelease(v27);
    v31 = v28;
    a3 = v39;
    v40 = sub_282C4(v31, v30, &v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41, v10 + 14, v10 + 22);
    swift_bridgeObjectRelease_n(a2, 2);
    swift_bridgeObjectRelease(v30);
    _os_log_impl(&dword_0, v8, type, "-- Storing Values for %s: %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy(v37, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v37, -1, -1);
    swift_slowDealloc(v10, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
    swift_unknownObjectRelease_n(a1, 2);
  }
  v32 = *(_QWORD *)(a3 + OBJC_IVAR___BMInternalManager_localStorage);
  v33 = swift_allocObject(&unk_39990, 24, 7);
  *(_QWORD *)(v33 + 16) = a1;
  v34 = (_QWORD *)swift_allocObject(&unk_399B8, 56, 7);
  v34[2] = v32;
  v34[3] = a1;
  v34[4] = sub_1C6C4;
  v34[5] = v33;
  v34[6] = a2;
  swift_unknownObjectRetain_n(a1, 2);
  swift_bridgeObjectRetain(a2, v35);
  swift_retain();
  swift_retain();
  sub_2BA88((uint64_t)sub_1C4C8, (uint64_t)v34);
  swift_release(v33);
  return swift_release(v34);
}

uint64_t sub_1A618(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 24) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 32) = v3;
  *v3 = v2;
  v3[1] = sub_1A680;
  return v5(v2 + 16);
}

uint64_t sub_1A680()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_QWORD **)(*v0 + 24);
  v4 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 32));
  *v2 = *(_QWORD *)(v1 + 16);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

char *sub_1A6D0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t (*v19)();
  char *result;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  if (objc_msgSend(a1, "recordType") == (char *)&dword_0 + 1)
  {
    v10 = *(_QWORD *)(a5 + OBJC_IVAR___BMInternalManager_localStorage);
    v11 = objc_msgSend(a1, "eventName");
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11, v12);
    v15 = v14;

    v16 = swift_allocObject(&unk_39530, 32, 7);
    *(_QWORD *)(v16 + 16) = a3;
    *(_QWORD *)(v16 + 24) = a4;
    v17 = (_QWORD *)swift_allocObject(&unk_39558, 56, 7);
    v17[2] = v13;
    v17[3] = v15;
    v17[4] = v10;
    v17[5] = sub_1C71C;
    v17[6] = v16;
    swift_retain();
    swift_bridgeObjectRetain(v15, v18);
    swift_retain();
    swift_retain();
    v19 = sub_1BC9C;
LABEL_7:
    v28 = (uint64_t)v17;
    goto LABEL_8;
  }
  if (!objc_msgSend(a1, "recordType"))
  {
    v29 = *(_QWORD *)(a5 + OBJC_IVAR___BMInternalManager_localStorage);
    v30 = objc_msgSend(a1, "eventName");
    v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30, v31);
    v15 = v33;

    v16 = swift_allocObject(&unk_394E0, 32, 7);
    *(_QWORD *)(v16 + 16) = a3;
    *(_QWORD *)(v16 + 24) = a4;
    v17 = (_QWORD *)swift_allocObject(&unk_39508, 56, 7);
    v17[2] = v32;
    v17[3] = v15;
    v17[4] = v29;
    v17[5] = sub_1BC70;
    v17[6] = v16;
    swift_retain();
    swift_bridgeObjectRetain(v15, v34);
    swift_retain();
    swift_retain();
    v19 = sub_1BC8C;
    goto LABEL_7;
  }
  result = (char *)objc_msgSend(a1, "recordType");
  if (result != (_BYTE *)&dword_0 + 2)
    return result;
  v21 = *(_QWORD *)(a5 + OBJC_IVAR___BMInternalManager_localStorage);
  v22 = objc_msgSend(a1, "eventName");
  v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22, v23);
  v15 = v25;

  v16 = swift_allocObject(&unk_39490, 32, 7);
  *(_QWORD *)(v16 + 16) = a3;
  *(_QWORD *)(v16 + 24) = a4;
  v17 = (_QWORD *)swift_allocObject(&unk_394B8, 80, 7);
  v17[2] = v24;
  v17[3] = v15;
  v17[4] = a2;
  *((_BYTE *)v17 + 40) = 0;
  v17[6] = 0;
  v17[7] = v21;
  v17[8] = sub_1B2B8;
  v17[9] = v16;
  swift_bridgeObjectRetain(a2, v26);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain(v15, v27);
  v19 = sub_1BC6C;
  v28 = (uint64_t)v17;
LABEL_8:
  sub_2BA88((uint64_t)v19, v28);
  swift_bridgeObjectRelease(v15);
  swift_release(v16);
  return (char *)swift_release(v17);
}

char *sub_1A99C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t (*v19)();
  char *result;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  if (objc_msgSend(a1, "recordType") == (char *)&dword_0 + 1)
  {
    v10 = *(_QWORD *)(a5 + OBJC_IVAR___BMInternalManager_localStorage);
    v11 = objc_msgSend(a1, "eventName");
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11, v12);
    v15 = v14;

    v16 = swift_allocObject(&unk_39828, 32, 7);
    *(_QWORD *)(v16 + 16) = a3;
    *(_QWORD *)(v16 + 24) = a4;
    v17 = (_QWORD *)swift_allocObject(&unk_39850, 56, 7);
    v17[2] = v13;
    v17[3] = v15;
    v17[4] = v10;
    v17[5] = sub_1C71C;
    v17[6] = v16;
    swift_retain();
    swift_bridgeObjectRetain(v15, v18);
    swift_retain();
    swift_retain();
    v19 = sub_1BC9C;
LABEL_7:
    v28 = (uint64_t)v17;
    goto LABEL_8;
  }
  if (!objc_msgSend(a1, "recordType"))
  {
    v29 = *(_QWORD *)(a5 + OBJC_IVAR___BMInternalManager_localStorage);
    v30 = objc_msgSend(a1, "eventName");
    v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30, v31);
    v15 = v33;

    v16 = swift_allocObject(&unk_397D8, 32, 7);
    *(_QWORD *)(v16 + 16) = a3;
    *(_QWORD *)(v16 + 24) = a4;
    v17 = (_QWORD *)swift_allocObject(&unk_39800, 56, 7);
    v17[2] = v32;
    v17[3] = v15;
    v17[4] = v29;
    v17[5] = sub_1C71C;
    v17[6] = v16;
    swift_retain();
    swift_bridgeObjectRetain(v15, v34);
    swift_retain();
    swift_retain();
    v19 = sub_1BC8C;
    goto LABEL_7;
  }
  result = (char *)objc_msgSend(a1, "recordType");
  if (result != (_BYTE *)&dword_0 + 2)
    return result;
  v21 = *(_QWORD *)(a5 + OBJC_IVAR___BMInternalManager_localStorage);
  v22 = objc_msgSend(a1, "eventName");
  v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22, v23);
  v15 = v25;

  v16 = swift_allocObject(&unk_39788, 32, 7);
  *(_QWORD *)(v16 + 16) = a3;
  *(_QWORD *)(v16 + 24) = a4;
  v17 = (_QWORD *)swift_allocObject(&unk_397B0, 80, 7);
  v17[2] = v24;
  v17[3] = v15;
  v17[4] = a2;
  *((_BYTE *)v17 + 40) = 0;
  v17[6] = 0;
  v17[7] = v21;
  v17[8] = sub_1B2B8;
  v17[9] = v16;
  swift_bridgeObjectRetain(a2, v26);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain(v15, v27);
  v19 = sub_1BC6C;
  v28 = (uint64_t)v17;
LABEL_8:
  sub_2BA88((uint64_t)v19, v28);
  swift_bridgeObjectRelease(v15);
  swift_release(v16);
  return (char *)swift_release(v17);
}

uint64_t sub_1AC68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;
  uint64_t v13;
  _BYTE v15[24];

  v1 = sub_44F0(&qword_3EA60);
  __chkstk_darwin(v1);
  v3 = &v15[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v4 = *(_QWORD *)(v0 + OBJC_IVAR___BMInternalManager_collector);
  swift_beginAccess(v4 + 32, v15, 0, 0);
  v6 = *(_QWORD *)(v4 + 32);
  if (v6 < 0 || (v6 & 0x4000000000000000) != 0)
  {
    v12 = swift_bridgeObjectRetain(*(_QWORD *)(v4 + 32), v5);
    v7 = (uint64_t)sub_19870(v12, v13);
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v6, v5);
  }
  v8 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v3, 1, 1, v8);
  v9 = swift_allocObject(&unk_399E0, 72, 7);
  *(_QWORD *)(v9 + 16) = 0;
  *(_QWORD *)(v9 + 24) = 0;
  *(_QWORD *)(v9 + 32) = v7;
  *(_OWORD *)(v9 + 40) = xmmword_31970;
  *(_QWORD *)(v9 + 56) = sub_11B90;
  *(_QWORD *)(v9 + 64) = 0;
  v10 = sub_12C68((uint64_t)v3, (uint64_t)&unk_3ECB0, v9);
  return swift_release(v10);
}

_QWORD *sub_1AD8C(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1ADB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1ADF4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  sub_DB54((_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 72, 7);
}

uint64_t sub_1AE20(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void sub_1AE38(void *a1, char a2)
{
  uint64_t v2;

  sub_2CCB8(a1, a2 & 1, *(void (**)(void *, uint64_t))(v2 + 16), *(_QWORD *)(v2 + 24), (_QWORD *)(v2 + 32));
}

uint64_t sub_1AE48()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_1AE70()
{
  uint64_t v0;

  sub_2D31C(*(_QWORD *)(v0 + 16), *(void (**)(uint64_t *))(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_1AE7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for Date(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_1AEF8()
{
  uint64_t v0;

  type metadata accessor for Date(0);
  sub_2DAC0(*(_QWORD *)(v0 + 16), *(void (**)(uint64_t, uint64_t))(v0 + 24));
}

uint64_t sub_1AF2C(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v5 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0)
      v5 = a2;
    v6 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v6 = 11;
    v7 = v6 | (v5 << 16);
    v8 = String.index(_:offsetBy:limitedBy:)(15, result, v7, a2, a3);
    if ((v9 & 1) != 0)
      v10 = v7;
    else
      v10 = v8;
    return String.subscript.getter(15, v10, a2, a3);
  }
  return result;
}

void *sub_1AFB4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  char v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v4 = v3;
  v7 = a1;
  if (a1 >> 62)
    goto LABEL_21;
  v8 = *(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain(a1, a2);
  while (v8)
  {
    v23 = v4;
    v24 = v7;
    v25 = v7 & 0xC000000000000001;
    v4 = 4;
    while (1)
    {
      v9 = v4 - 4;
      if (!v25)
        break;
      v10 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(v4 - 4, v7);
      v11 = v4 - 3;
      if (__OFADD__(v9, 1))
        goto LABEL_20;
LABEL_9:
      v12 = v8;
      v13 = v10;
      v14 = a3;
      v15 = objc_msgSend(v10, "type", v23);
      v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v18 = v17;

      a3 = v14;
      v19 = v16 == a2 && v18 == v14;
      if (v19)
      {
        swift_bridgeObjectRelease(v24);
LABEL_19:
        swift_bridgeObjectRelease(a3);
        return v13;
      }
      v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v18, a2, v14, 0);
      swift_bridgeObjectRelease(v18);
      if ((v20 & 1) != 0)
      {
        a3 = v24;
        goto LABEL_19;
      }
      swift_unknownObjectRelease(v13);
      ++v4;
      v8 = v12;
      v19 = v11 == v12;
      v7 = v24;
      if (v19)
      {
        swift_bridgeObjectRelease(v24);
        return 0;
      }
    }
    v10 = (void *)swift_unknownObjectRetain(*(_QWORD *)(v7 + 8 * v4));
    v11 = v4 - 3;
    if (!__OFADD__(v9, 1))
      goto LABEL_9;
LABEL_20:
    __break(1u);
LABEL_21:
    if (v7 < 0)
      v21 = v7;
    else
      v21 = v7 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v7, a2);
    v8 = _CocoaArrayWrapper.endIndex.getter(v21);
  }
  swift_bridgeObjectRelease(v7);
  return 0;
}

uint64_t sub_1B15C()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1B180()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

void sub_1B1AC(uint64_t a1)
{
  uint64_t v1;

  sub_12EE0(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_1B1B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1B1C4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1B1CC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1B1F8(uint64_t *a1)
{
  uint64_t v1;

  return sub_132C4(a1, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_1B208(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc(dword_3EF04);
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1C6C8;
  return sub_27370(a1, v4, v5, v6, v7, v8, v9, v10);
}

void sub_1B29C(uint64_t a1, char a2)
{
  uint64_t v2;

  sub_1F3B0(a1, a2 & 1, v2);
}

uint64_t sub_1B2AC()
{
  uint64_t v0;

  return sub_266B0(*(_QWORD *)(v0 + 16), *(void (**)(uint64_t, uint64_t))(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_1B2C0(uint64_t a1)
{
  uint64_t v1;

  return sub_140D4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1B2C8(uint64_t a1)
{
  uint64_t v1;

  return sub_144C0(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_1B2D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;

  v6 = *(_QWORD *)(v2 + 16);
  v7 = *(_QWORD *)(v2 + 24);
  v8 = *(_QWORD *)(v2 + 32);
  v9 = *(_BYTE *)(v2 + 40);
  v10 = *(_QWORD *)(v2 + 48);
  v11 = (_QWORD *)swift_task_alloc(dword_3EAA4);
  *(_QWORD *)(v3 + 16) = v11;
  *v11 = v3;
  v11[1] = sub_1C6C8;
  return sub_14A50(a1, a2, v6, v7, v8, v9, v10);
}

uint64_t sub_1B374()
{
  return sub_1C5C0((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_26BA4);
}

uint64_t sub_1B380(uint64_t a1)
{
  uint64_t *v1;

  return sub_16324(a1, v1[2], v1[3], v1[4], v1[5]);
}

_QWORD *sub_1B38C(unint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  BOOL v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  _QWORD *v32;

  v3 = a1;
  v32 = &_swiftEmptyArrayStorage;
  if (a1 >> 62)
    goto LABEL_33;
  v4 = *(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8));
  if (v4)
  {
    while (1)
    {
      v26 = v3;
      v5 = 0;
      v30 = v3 & 0xFFFFFFFFFFFFFF8;
      v31 = v3 & 0xC000000000000001;
      v28 = v4;
      v29 = v3 + 32;
      v27 = a2 + 7;
      while (1)
      {
        if (v31)
        {
          v6 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v26);
          v7 = __OFADD__(v5++, 1);
          if (v7)
          {
LABEL_29:
            __break(1u);
            return v32;
          }
        }
        else
        {
          if (v5 >= *(_QWORD *)(v30 + 16))
          {
            __break(1u);
            goto LABEL_32;
          }
          v6 = *(void **)(v29 + 8 * v5);
          swift_unknownObjectRetain(v6);
          v7 = __OFADD__(v5++, 1);
          if (v7)
            goto LABEL_29;
        }
        v8 = objc_msgSend(v6, "eventName");
        v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v3 = v10;

        v11 = (_QWORD *)a2[2];
        if (v11)
          break;
        swift_unknownObjectRelease(v6);
        swift_bridgeObjectRelease(v3);
LABEL_5:
        if (v5 == v4)
          return v32;
      }
      v12 = a2[4];
      v13 = a2[5];
      v14 = a2;
      v15 = v12 == v9 && v13 == v3;
      if (v15 || (_stringCompareWithSmolCheck(_:_:expecting:)(v12, v13, v9, v3, 0) & 1) != 0)
        break;
      if (v11 == (_QWORD *)((char *)&dword_0 + 1))
      {
LABEL_26:
        swift_unknownObjectRelease(v6);
        swift_bridgeObjectRelease(v3);
        goto LABEL_16;
      }
      v19 = v27;
      v20 = 1;
      while (1)
      {
        a2 = (_QWORD *)(v20 + 1);
        if (__OFADD__(v20, 1))
          break;
        v21 = *(v19 - 1);
        v22 = *v19;
        v23 = v21 == v9 && v22 == v3;
        if (v23 || (_stringCompareWithSmolCheck(_:_:expecting:)(v21, v22, v9, v3, 0) & 1) != 0)
          goto LABEL_15;
        v19 += 2;
        ++v20;
        if (a2 == v11)
          goto LABEL_26;
      }
LABEL_32:
      __break(1u);
LABEL_33:
      if (v3 < 0)
        v25 = v3;
      else
        v25 = v3 & 0xFFFFFFFFFFFFFF8;
      v4 = _CocoaArrayWrapper.endIndex.getter(v25);
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
LABEL_15:
    v16 = swift_bridgeObjectRelease(v3);
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v16);
    v17 = v32[2];
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v17);
    v18 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v17, v6);
    v3 = (uint64_t)&v32;
    specialized ContiguousArray._endMutation()(v18);
LABEL_16:
    v4 = v28;
    a2 = v14;
    goto LABEL_5;
  }
  return &_swiftEmptyArrayStorage;
}

_QWORD *sub_1B5C0(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  unint64_t v19;

  v2 = a1;
  if (a1 >> 62)
    goto LABEL_16;
  v3 = *(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8));
  if (v3)
  {
    while (1)
    {
      v4 = 0;
      v19 = v2 & 0xC000000000000001;
      v5 = v2 & 0xFFFFFFFFFFFFFF8;
      while (v19)
      {
        v6 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v2);
        v7 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
LABEL_13:
          __break(1u);
          return _swiftEmptyArrayStorage;
        }
LABEL_9:
        v8 = v2;
        v9 = objc_msgSend(v6, "eventName");
        v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);
        v13 = v12;

        LOBYTE(v9) = sub_16B0C(v11, v13, a2);
        v14 = swift_bridgeObjectRelease(v13);
        if ((v9 & 1) != 0)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v14);
          v15 = _swiftEmptyArrayStorage[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v15);
          v16 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v15, v6);
          specialized ContiguousArray._endMutation()(v16);
        }
        else
        {
          swift_unknownObjectRelease(v6);
        }
        v2 = v8;
        ++v4;
        if (v7 == v3)
          return _swiftEmptyArrayStorage;
      }
      if (v4 < *(_QWORD *)(v5 + 16))
        break;
      __break(1u);
LABEL_16:
      if (v2 < 0)
        v18 = v2;
      else
        v18 = v2 & 0xFFFFFFFFFFFFFF8;
      v3 = _CocoaArrayWrapper.endIndex.getter(v18);
      if (!v3)
        return _swiftEmptyArrayStorage;
    }
    v6 = *(void **)(v2 + 8 * v4 + 32);
    swift_unknownObjectRetain(v6);
    v7 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_13;
    goto LABEL_9;
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_1B758(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  return a1;
}

uint64_t sub_1B790()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int (*v9)(uint64_t, uint64_t, uint64_t);
  unint64_t v10;
  unint64_t v11;

  v1 = *(_QWORD *)(sub_44F0(&qword_3EAD0) - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (v2 + 24) & ~v2;
  v4 = *(_QWORD *)(v1 + 64);
  v5 = (v4 + v2 + v3) & ~v2;
  swift_release(*(_QWORD *)(v0 + 16));
  v6 = v0 + v3;
  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (!v9(v6, 1, v7))
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  if (!v9(v0 + v5, 1, v7))
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0 + v5, v7);
  v10 = (v4 + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v11 = (v10 + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_release(*(_QWORD *)(v0 + v10 + 8));
  swift_release(*(_QWORD *)(v0 + v11 + 8));
  return swift_deallocObject(v0, v11 + 16, v2 | 7);
}

void sub_1B898()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(sub_44F0(&qword_3EAD0) - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (v2 + 24) & ~v2;
  v4 = *(_QWORD *)(v1 + 64);
  v5 = (v4 + v2 + v3) & ~v2;
  sub_2CF64(*(_QWORD *)(v0 + 16), v0 + v3, v0 + v5, *(_QWORD *)(v0 + ((v4 + v5 + 7) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((v4 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 8), *(_QWORD *)(v0 + ((((v4 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((((v4 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_1B904(uint64_t a1)
{
  uint64_t v1;

  return sub_22204(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

ValueMetadata *type metadata accessor for Context()
{
  return &type metadata for Context;
}

uint64_t sub_1B91C()
{
  return type metadata accessor for ManagerConfiguration(0);
}

uint64_t sub_1B924(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = &unk_319E8;
    v4[2] = &unk_319E8;
    result = swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ManagerConfiguration(uint64_t a1, uint64_t a2)
{
  return swift_lookUpClassMethod(a1, a2, &nominal type descriptor for ManagerConfiguration);
}

uint64_t dispatch thunk of ManagerConfiguration.__allocating_init(localStorageDirectory:shouldRunUpdatesOnSchedule:shouldPurgeOutdatedData:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t method lookup function for Manager(uint64_t a1, uint64_t a2)
{
  return swift_lookUpClassMethod(a1, a2, &nominal type descriptor for Manager);
}

uint64_t dispatch thunk of Manager.__allocating_init(configuration:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of static Manager.destroyPersistentStore(directory:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of BaseDonor.propertyDidChange(_:propertyConfiguration:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))&stru_B8.segname[swift_isaMask & *v0])();
}

uint64_t dispatch thunk of Manager.unitTestOnlyLocalStorage.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))&stru_B8.segname[(swift_isaMask & *v0) + 16])();
}

uint64_t dispatch thunk of Manager.cloudSyncVersions(dataType:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((char *)&stru_B8.size + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of Manager.updateCloudVersion(cloudSyncVersions:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((char *)&stru_B8.offset + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of Manager.getLastCloudSyncTimestamp(completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((char *)&stru_B8.reloff + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of Manager.setLastCloudSyncTimestamp(_:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((char *)&stru_B8.flags + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of Manager.restoreFromSync(configuration:properties:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((char *)&stru_B8.reserved2 + (swift_isaMask & *v0)))();
}

uint64_t sub_1BA90()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_1BAB4()
{
  LocalStorage.purgeAllIfNeeded()();
}

uint64_t sub_1BAE0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BB20(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for BaseDonor.Observation(a2, a1);
  return a2;
}

uint64_t sub_1BB5C(uint64_t a1, uint64_t a2)
{
  initializeWithTake for BaseDonor.Observation(a2, a1);
  return a2;
}

uint64_t sub_1BB98()
{
  return sub_1C310((uint64_t *)&unk_3EB80);
}

uint64_t sub_1BBA4(void *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_44F0((uint64_t *)&unk_3EB80) - 8) + 80);
  return sub_164E4(a1, v1 + ((v3 + 16) & ~v3));
}

uint64_t sub_1BBE8()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_release(v0[4]);
  swift_bridgeObjectRelease(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

void sub_1BC1C(void *a1, char a2)
{
  uint64_t v2;

  sub_160B4(a1, a2 & 1, *(_QWORD *)(v2 + 16), *(void (**)(void))(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40));
}

uint64_t sub_1BC30()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

id sub_1BC50(void *a1, char a2)
{
  if ((a2 & 1) != 0)
    return (id)swift_errorRetain();
  else
    return a1;
}

void sub_1BC5C(void *a1, char a2)
{
  if ((a2 & 1) != 0)
    swift_errorRelease();
  else

}

uint64_t sub_1BC70(uint64_t a1)
{
  uint64_t v1;

  return sub_14284(a1, *(uint64_t (**)(_QWORD *))(v1 + 16));
}

uint64_t sub_1BC8C()
{
  return sub_1C5C0(sub_21DE8);
}

uint64_t sub_1BC9C()
{
  return sub_1C5C0(sub_21DFC);
}

uint64_t sub_1BCA8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_44F0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BCEC()
{
  _QWORD *v0;

  swift_unknownObjectRelease(v0[2]);
  swift_release(v0[4]);
  swift_bridgeObjectRelease(v0[5]);
  swift_bridgeObjectRelease(v0[6]);
  return swift_deallocObject(v0, 72, 7);
}

uint64_t sub_1BD28(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v4 = *(_QWORD *)(v1 + 48);
  v5 = *(_BYTE *)(v1 + 56);
  v6 = *(_QWORD *)(v1 + 64);
  v7 = swift_task_alloc(dword_3EBB4);
  v8 = *(_OWORD *)(v1 + 32);
  *(_QWORD *)(v2 + 16) = v7;
  *(_QWORD *)v7 = v2;
  *(_QWORD *)(v7 + 8) = sub_1C6C8;
  *(_BYTE *)(v7 + 72) = v5;
  *(_QWORD *)(v7 + 40) = v4;
  *(_QWORD *)(v7 + 48) = v6;
  *(_OWORD *)(v7 + 24) = v8;
  *(_QWORD *)(v7 + 16) = a1;
  return swift_task_switch(sub_15B6C, 0, 0);
}

uint64_t sub_1BDB4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1BDD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_3EBC4);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1C6C8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_3EBC0 + dword_3EBC0))(a1, v4);
}

uint64_t sub_1BE4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc(dword_3EBD4);
  v5 = *(_OWORD *)(v1 + 32);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_1C6C8;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch(sub_1581C, 0, 0);
}

uint64_t sub_1BEB4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_3EBC4);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1BF24;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_3EBC0 + dword_3EBC0))(a1, v4);
}

uint64_t sub_1BF24()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1BF70()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1BFA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc(dword_3EBEC);
  v5 = *(_OWORD *)(v1 + 32);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_1C6C8;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch(sub_15600, 0, 0);
}

uint64_t sub_1C010(uint64_t a1)
{
  uint64_t v1;

  return sub_156A4(a1, *(_QWORD *)(v1 + 16), *(char **)(v1 + 24));
}

uint64_t sub_1C024(uint64_t a1)
{
  sub_1C05C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40), *(_BYTE *)(a1 + 41));
  return a1;
}

uint64_t sub_1C05C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  if ((a7 & 1) != 0)
    return swift_errorRetain(a1);
  else
    return sub_E174(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_1C068(uint64_t a1)
{
  uint64_t v1;

  return sub_15910(a1, *(_QWORD *)(v1 + 16), *(char **)(v1 + 24));
}

uint64_t sub_1C074()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = sub_44F0(&qword_3EC18);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_1C0EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(sub_44F0(&qword_3EC18) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_15A6C(a1, v1 + v4, *(void **)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_1C148(uint64_t a1)
{
  uint64_t v1;

  return sub_15C7C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_BYTE *)(v1 + 40), *(_QWORD *)(v1 + 48));
}

uint64_t sub_1C15C()
{
  return sub_1C310(&qword_3EC18);
}

uint64_t sub_1C168(uint64_t a1, char a2)
{
  char v3;

  v3 = a2 & 1;
  sub_44F0(&qword_3EC18);
  return sub_15E38(a1, v3);
}

uint64_t sub_1C1B8()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[2]);
  swift_bridgeObjectRelease(v0[3]);
  swift_release(v0[6]);
  swift_release(v0[8]);
  return swift_deallocObject(v0, 72, 7);
}

void sub_1C1F4()
{
  uint64_t v0;

  sub_22150(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(void (**)(char *, _QWORD))(v0 + 56), *(_QWORD *)(v0 + 64));
}

uint64_t sub_1C208()
{
  return sub_1C310((uint64_t *)&unk_3EB80);
}

uint64_t sub_1C214(uint64_t a1)
{
  return sub_1C220(a1, (uint64_t *)&unk_3EB80);
}

uint64_t sub_1C220(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(sub_44F0(a2) - 8) + 80);
  return sub_145C4(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_1C274()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[3]);
  swift_bridgeObjectRelease(v0[4]);
  swift_release(v0[7]);
  swift_release(v0[9]);
  return swift_deallocObject(v0, 80, 7);
}

uint64_t sub_1C2B0()
{
  uint64_t v0;

  return sub_21FA8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_BYTE *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(void (**)(uint64_t, uint64_t))(v0 + 64), *(_QWORD *)(v0 + 72));
}

uint64_t sub_1C2D0()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[3]);
  swift_release(v0[4]);
  swift_release(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1C304()
{
  return sub_1C310((uint64_t *)&unk_3EC30);
}

uint64_t sub_1C310(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = sub_44F0(a1);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(unsigned __int8 *)(v3 + 80);
  v5 = (v4 + 16) & ~v4;
  v6 = v5 + *(_QWORD *)(v3 + 64);
  v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  return swift_deallocObject(v1, v6, v7);
}

uint64_t sub_1C36C(uint64_t a1)
{
  return sub_1C220(a1, (uint64_t *)&unk_3EC30);
}

uint64_t sub_1C378()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1C3A8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1C3D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_3EC5C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1C6C8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_3EC58 + dword_3EC58))(a1, v4);
}

uint64_t sub_1C444(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return swift_bridgeObjectRelease(result);
  return result;
}

unint64_t sub_1C450()
{
  unint64_t result;

  result = qword_3EC80;
  if (!qword_3EC80)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CollectorError, &type metadata for CollectorError);
    atomic_store(result, (unint64_t *)&qword_3EC80);
  }
  return result;
}

uint64_t sub_1C494()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_1C4B8(uint64_t a1, char a2)
{
  uint64_t v2;

  sub_13834(a1, a2 & 1, *(void **)(v2 + 16));
}

uint64_t sub_1C4C8()
{
  return sub_1C5C0((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21900);
}

uint64_t sub_1C4D4(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) != 0)
    return swift_errorRetain();
  return result;
}

uint64_t sub_1C4E0(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) != 0)
    return swift_errorRelease();
  return result;
}

uint64_t sub_1C4EC()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1C520()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v2 = swift_task_alloc(dword_3EC9C);
  v3 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_1C6C8;
  *(_OWORD *)(v2 + 56) = v3;
  return swift_task_switch(sub_1271C, 0, 0);
}

uint64_t sub_1C584()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_unknownObjectRelease(v0[3]);
  swift_release(v0[5]);
  swift_bridgeObjectRelease(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1C5C0(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  return a1(v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_1C5D8()
{
  _QWORD *v0;

  swift_unknownObjectRelease(v0[2]);
  swift_bridgeObjectRelease(v0[4]);
  swift_bridgeObjectRelease(v0[6]);
  swift_release(v0[8]);
  return swift_deallocObject(v0, 72, 7);
}

uint64_t sub_1C614(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc(dword_3EF04);
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1BF24;
  return sub_27370(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1C6A8()
{
  uint64_t v0;

  return sub_13E18(v0);
}

void sub_1C6B0(uint64_t a1, char a2)
{
  uint64_t v2;

  sub_13EAC(a1, a2 & 1, v2);
}

void sub_1C720(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_msgSend(*a1, "dataType");
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;

  *a2 = v4;
  a2[1] = v6;
}

void sub_1C774(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_msgSend(*a1, "rawHistoryToken");
  if (v3)
  {
    v4 = v3;
    v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0xF000000000000000;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_1C7D8(uint64_t a1, void **a2)
{
  void *v2;
  Class isa;
  Class v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8) >> 60 == 15)
    isa = 0;
  else
    isa = Data._bridgeToObjectiveC()().super.isa;
  v4 = isa;
  objc_msgSend(v2, "setRawHistoryToken:");

}

uint64_t type metadata accessor for CDMutableCloudSyncVersions()
{
  return objc_opt_self(_TtC19EngagementCollector26CDMutableCloudSyncVersions);
}

uint64_t sub_1C8D0()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;

  v1 = objc_msgSend(v0, "rawHistoryToken");
  v2 = v1;
  if (!v1)
    return (uint64_t)v2;
  v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v1);
  v5 = v4;

  sub_D854(0, &qword_3ECC0, NSKeyedUnarchiver_ptr);
  v6 = sub_D854(0, &qword_3ECC8, NSPersistentHistoryToken_ptr);
  result = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)(v6, v3, v5, v6);
  v2 = (void *)result;
  if (result)
  {
    sub_DA88(v3, v5);
    return (uint64_t)v2;
  }
  __break(1u);
  return result;
}

void sub_1CBB8(void *a1)
{
  void *v1;
  void *v2;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSData v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject **v24;
  NSObject *v25;
  _QWORD v26[2];
  id v27;

  v2 = v1;
  if (!a1)
  {
LABEL_10:
    v11.super.isa = 0;
    v8 = 0;
    v10 = 0xF000000000000000;
    goto LABEL_11;
  }
  v4 = (void *)objc_opt_self(NSKeyedArchiver);
  v27 = 0;
  v5 = a1;
  v6 = objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v27);
  v7 = v27;
  if (!v6)
  {
    v12 = v7;
    v13 = (void *)_convertNSErrorToError(_:)(v7);

    swift_willThrow();
    v27 = v13;
    v14 = sub_44F0((uint64_t *)&unk_3ECD0);
    v15 = sub_D854(0, (unint64_t *)&qword_3E930, NSError_ptr);
    swift_dynamicCast(v26, &v27, v14, v15, 0);
    v16 = (void *)v26[0];
    if (qword_3E6A0 != -1)
      swift_once(&qword_3E6A0, sub_10B64);
    v17 = type metadata accessor for Logger(0);
    sub_AD78(v17, (uint64_t)qword_3FA80);
    v18 = v16;
    v19 = Logger.logObject.getter(v18);
    v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc(12, -1);
      v24 = (NSObject **)swift_slowAlloc(8, -1);
      *(_DWORD *)v21 = 138412290;
      v25 = v18;
      v22 = v18;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, v26, v21 + 4, v21 + 12);
      *v24 = v18;

      _os_log_impl(&dword_0, v19, v20, "Failed to create rawHistoryToken from data error: %@", v21, 0xCu);
      v23 = sub_44F0(&qword_3ECE0);
      swift_arrayDestroy(v24, 1, v23);
      swift_slowDealloc(v24, -1, -1);
      swift_slowDealloc(v21, -1, -1);
      v18 = v5;
    }
    else
    {

      v22 = v18;
      v19 = v5;
    }

    swift_errorRelease(v27);
    goto LABEL_10;
  }
  v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v6);
  v10 = v9;

  sub_1E3D4(v8, v10);
  v11.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_DA88(v8, v10);
LABEL_11:
  objc_msgSend(v2, "setRawHistoryToken:", v11.super.isa);

  sub_DA74(v8, v10);
}

void (*sub_1CECC(uint64_t *a1))(void **a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_1C8D0();
  return sub_1CF00;
}

void sub_1CF00(void **a1, char a2)
{
  void *v2;
  id v3;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = v2;
    sub_1CBB8(v2);

  }
  else
  {
    sub_1CBB8(*a1);
  }
}

id CDCloudSyncVersions.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for CDCloudSyncVersions();
  v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

id CDCloudSyncVersions.__deallocating_deinit()
{
  return sub_1E064(type metadata accessor for CDCloudSyncVersions);
}

uint64_t sub_1D014()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(*v0, "dataType");
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

uint64_t sub_1D068()
{
  return sub_1C8D0();
}

id sub_1D088()
{
  id *v0;

  return objc_msgSend(*v0, "historyTokenOffset");
}

id sub_1D098()
{
  id *v0;

  return objc_msgSend(*v0, "cloudVersion");
}

id sub_1D0A8()
{
  id *v0;

  return objc_msgSend(*v0, "localVersion");
}

id sub_1D0B8()
{
  id *v0;

  return objc_msgSend(*v0, "syncVersion");
}

uint64_t sub_1D0C8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v8[24];

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_dataType);
  swift_beginAccess(v4, v8, 1, 0);
  v5 = v4[1];
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain(v2, v6);
  return swift_bridgeObjectRelease(v5);
}

uint64_t sub_1D130()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_dataType);
  swift_beginAccess(v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_dataType, v5, 0, 0);
  v2 = *v1;
  swift_bridgeObjectRetain(v1[1], v3);
  return v2;
}

uint64_t sub_1D184(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  _BYTE v8[24];

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_dataType);
  swift_beginAccess(v5, v8, 1, 0);
  v6 = v5[1];
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease(v6);
}

void *sub_1D1E0(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_dataType, a1, 33, 0);
  return &j_j__swift_endAccess;
}

void sub_1D224(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;
  _BYTE v6[24];

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken);
  swift_beginAccess(v3, v6, 1, 0);
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

void *sub_1D284()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;
  _BYTE v5[24];

  v1 = (void **)(v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken);
  swift_beginAccess(v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken, v5, 0, 0);
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1D2D0(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  _BYTE v5[24];

  v3 = (void **)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken);
  swift_beginAccess(v3, v5, 1, 0);
  v4 = *v3;
  *v3 = a1;

}

void *sub_1D320(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_1D364()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyTokenOffset;
  swift_beginAccess(v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyTokenOffset, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_1D3A8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyTokenOffset);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

void *sub_1D3F0(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyTokenOffset, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_1D434()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_cloudVersion;
  swift_beginAccess(v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_cloudVersion, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_1D478(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_cloudVersion);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

void *sub_1D4C0(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_cloudVersion, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_1D504()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_localVersion;
  swift_beginAccess(v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_localVersion, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_1D548(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_localVersion);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

void *sub_1D590(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_localVersion, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_1D5D4()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_syncVersion;
  swift_beginAccess(v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_syncVersion, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_1D618(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_syncVersion);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

void *sub_1D660(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_syncVersion, a1, 33, 0);
  return &j__swift_endAccess;
}

uint64_t sub_1D6FC()
{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  Swift::String v7;
  Swift::String v8;
  _QWORD *v9;
  Swift::String v10;
  void *object;
  Swift::String v12;
  _QWORD *v13;
  Swift::String v14;
  void *v15;
  Swift::String v16;
  _QWORD *v17;
  Swift::String v18;
  void *v19;
  Swift::String v20;
  id *v21;
  id v22;
  uint64_t v23;
  Swift::String v24;
  void *v25;
  Swift::String v26;
  Swift::String v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  id v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _BYTE v36[24];
  _QWORD v37[3];
  uint64_t v38;
  unint64_t v39;

  v1 = v0;
  v37[0] = 0;
  v37[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(103);
  v38 = 0;
  v39 = 0xE000000000000000;
  v2._countAndFlagsBits = 0x6570795461746164;
  v2._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v2);
  v3 = (uint64_t *)(v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_dataType);
  swift_beginAccess(v3, v37, 0, 0);
  v4 = *v3;
  v5 = (void *)v3[1];
  swift_bridgeObjectRetain(v5, v6);
  v7._countAndFlagsBits = v4;
  v7._object = v5;
  String.append(_:)(v7);
  swift_bridgeObjectRelease(v5);
  v8._object = (void *)0x8000000000033560;
  v8._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v8);
  v9 = (_QWORD *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_cloudVersion);
  swift_beginAccess(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_cloudVersion, v36, 0, 0);
  v35[0] = *v9;
  v10._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int64, &protocol witness table for Int64);
  object = v10._object;
  String.append(_:)(v10);
  swift_bridgeObjectRelease(object);
  v12._object = (void *)0x8000000000033580;
  v12._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v12);
  v13 = (_QWORD *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_localVersion);
  swift_beginAccess(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_localVersion, v35, 0, 0);
  v34[0] = *v13;
  v14._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int64, &protocol witness table for Int64);
  v15 = v14._object;
  String.append(_:)(v14);
  swift_bridgeObjectRelease(v15);
  v16._countAndFlagsBits = 0x6556636E7973202CLL;
  v16._object = (void *)0xEF203A6E6F697372;
  String.append(_:)(v16);
  v17 = (_QWORD *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_syncVersion);
  swift_beginAccess(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_syncVersion, v34, 0, 0);
  v33[0] = *v17;
  v18._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int64, &protocol witness table for Int64);
  v19 = v18._object;
  String.append(_:)(v18);
  swift_bridgeObjectRelease(v19);
  v20._countAndFlagsBits = 0x79726F7473696820;
  v20._object = (void *)0xEE003A6E656B6F54;
  String.append(_:)(v20);
  v21 = (id *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken);
  swift_beginAccess(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken, v33, 0, 0);
  v32[0] = *v21;
  v22 = v32[0];
  v23 = sub_44F0(&qword_3ED18);
  v24._countAndFlagsBits = String.init<A>(describing:)(v32, v23);
  v25 = v24._object;
  String.append(_:)(v24);
  swift_bridgeObjectRelease(v25);
  v26._countAndFlagsBits = 0xD000000000000014;
  v26._object = (void *)0x80000000000335A0;
  String.append(_:)(v26);
  swift_beginAccess(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyTokenOffset, v32, 0, 0);
  v27._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int64, &protocol witness table for Int64);
  v28 = v27._object;
  String.append(_:)(v27);
  swift_bridgeObjectRelease(v28);
  v29 = v39;
  v30 = String.init(format:_:)(v38, v39, _swiftEmptyArrayStorage);
  swift_bridgeObjectRelease(v29);
  return v30;
}

void sub_1DA1C(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;
  NSString v7;
  uint64_t *v8;
  uint64_t v9;
  NSString v10;
  uint64_t *v11;
  uint64_t v12;
  NSString v13;
  uint64_t *v14;
  uint64_t v15;
  NSString v16;
  id *v17;
  id v18;
  NSString v19;
  uint64_t *v20;
  uint64_t v21;
  NSString v22;
  uint64_t v23;
  _BYTE v24[24];
  _BYTE v25[24];
  _BYTE v26[24];
  _BYTE v27[24];
  _BYTE v28[24];

  v3 = v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_dataType;
  swift_beginAccess(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_dataType, v28, 0, 0);
  v4 = *(_QWORD *)(v3 + 8);
  swift_bridgeObjectRetain(v4, v5);
  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  v7 = String._bridgeToObjectiveC()();
  objc_msgSend(a1, "encodeObject:forKey:", v6, v7);

  v8 = (uint64_t *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_cloudVersion);
  swift_beginAccess(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_cloudVersion, v27, 0, 0);
  v9 = *v8;
  v10 = String._bridgeToObjectiveC()();
  objc_msgSend(a1, "encodeInt64:forKey:", v9, v10);

  v11 = (uint64_t *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_localVersion);
  swift_beginAccess(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_localVersion, v26, 0, 0);
  v12 = *v11;
  v13 = String._bridgeToObjectiveC()();
  objc_msgSend(a1, "encodeInt64:forKey:", v12, v13);

  v14 = (uint64_t *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_syncVersion);
  swift_beginAccess(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_syncVersion, v25, 0, 0);
  v15 = *v14;
  v16 = String._bridgeToObjectiveC()();
  objc_msgSend(a1, "encodeInt64:forKey:", v15, v16);

  v17 = (id *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken);
  swift_beginAccess(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken, v24, 0, 0);
  v18 = *v17;
  v19 = String._bridgeToObjectiveC()();
  objc_msgSend(a1, "encodeObject:forKey:", v18, v19);

  v20 = (uint64_t *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyTokenOffset);
  swift_beginAccess(v20, &v23, 0, 0);
  v21 = *v20;
  v22 = String._bridgeToObjectiveC()();
  objc_msgSend(a1, "encodeInt64:forKey:", v21, v22);

}

id CDMutableCloudSyncVersions.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return CDMutableCloudSyncVersions.init(coder:)(a1);
}

id CDMutableCloudSyncVersions.init(coder:)(void *a1)
{
  char *v1;
  void **v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char *v9;
  NSString v10;
  id v11;
  NSString v12;
  id v13;
  NSString v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSString v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  objc_super v25;
  uint64_t v26;
  uint64_t v27;

  v3 = (void **)&v1[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken];
  *(_QWORD *)&v1[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken] = 0;
  v4 = sub_D854(0, &qword_3ED20, NSString_ptr);
  v5 = v1;
  v6 = NSCoder.decodeObject<A>(of:forKey:)(v4, 0x6570795461746164, 0xE800000000000000, v4);
  if (v6
    && (v7 = (void *)v6,
        v26 = 0,
        v27 = 0,
        static String._conditionallyBridgeFromObjectiveC(_:result:)(v6, &v26),
        v7,
        (v8 = v27) != 0))
  {
    v9 = &v5[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_dataType];
    *(_QWORD *)v9 = v26;
    *((_QWORD *)v9 + 1) = v8;
    v10 = String._bridgeToObjectiveC()();
    v11 = objc_msgSend(a1, "decodeInt64ForKey:", v10);

    *(_QWORD *)&v5[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_cloudVersion] = v11;
    v12 = String._bridgeToObjectiveC()();
    v13 = objc_msgSend(a1, "decodeInt64ForKey:", v12);

    *(_QWORD *)&v5[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_localVersion] = v13;
    v14 = String._bridgeToObjectiveC()();
    v15 = objc_msgSend(a1, "decodeInt64ForKey:", v14);

    *(_QWORD *)&v5[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_syncVersion] = v15;
    v16 = sub_D854(0, &qword_3ECC8, NSPersistentHistoryToken_ptr);
    v17 = NSCoder.decodeObject<A>(of:forKey:)(v16, 0x5479726F74736968, 0xEC0000006E656B6FLL, v16);
    swift_beginAccess(v3, &v26, 1, 0);
    v18 = *v3;
    *v3 = (void *)v17;

    v19 = String._bridgeToObjectiveC()();
    v20 = objc_msgSend(a1, "decodeInt64ForKey:", v19);

    *(_QWORD *)&v5[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyTokenOffset] = v20;
    v25.receiver = v5;
    v25.super_class = (Class)type metadata accessor for CDMutableCloudSyncVersions();
    v21 = objc_msgSendSuper2(&v25, "init");

  }
  else
  {

    v22 = *v3;
    v23 = type metadata accessor for CDMutableCloudSyncVersions();
    swift_deallocPartialClassInstance(v5, v23, 64, 7);
    return 0;
  }
  return v21;
}

void CDMutableCloudSyncVersions.init()()
{
  _swift_stdlib_reportUnimplementedInitializer("EngagementCollector.CDMutableCloudSyncVersions", 46, "init()", 6, 0);
  __break(1u);
}

id CDMutableCloudSyncVersions.__deallocating_deinit()
{
  return sub_1E064(type metadata accessor for CDMutableCloudSyncVersions);
}

id sub_1E064(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t sub_1E0D0()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  v1 = (uint64_t *)(*v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_dataType);
  swift_beginAccess(v1, v5, 0, 0);
  v2 = *v1;
  swift_bridgeObjectRetain(v1[1], v3);
  return v2;
}

void *sub_1E128()
{
  _QWORD *v0;
  void **v1;
  void *v2;
  id v3;
  _BYTE v5[24];

  v1 = (void **)(*v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken);
  swift_beginAccess(v1, v5, 0, 0);
  v2 = *v1;
  v3 = v2;
  return v2;
}

uint64_t sub_1E178()
{
  _QWORD *v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = *v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyTokenOffset;
  swift_beginAccess(v1, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_1E1C0()
{
  _QWORD *v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = *v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_cloudVersion;
  swift_beginAccess(v1, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_1E208()
{
  _QWORD *v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = *v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_localVersion;
  swift_beginAccess(v1, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_1E250()
{
  _QWORD *v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = *v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_syncVersion;
  swift_beginAccess(v1, v3, 0, 0);
  return *(_QWORD *)v1;
}

id sub_1E298(void *a1, char *a2)
{
  void **v3;
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  objc_super v18;
  char v19[24];

  v3 = (void **)&a2[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken];
  *(_QWORD *)&a2[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken] = 0;
  v4 = a2;
  v5 = objc_msgSend(a1, "dataType");
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);
  v9 = v8;

  v10 = (uint64_t *)&v4[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_dataType];
  *v10 = v7;
  v10[1] = v9;
  v11 = objc_msgSend(a1, "cloudVersion");
  *(_QWORD *)&v4[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_cloudVersion] = v11;
  v12 = objc_msgSend(a1, "localVersion");
  *(_QWORD *)&v4[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_localVersion] = v12;
  v13 = objc_msgSend(a1, "syncVersion");
  *(_QWORD *)&v4[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_syncVersion] = v13;
  v14 = sub_1C8D0();
  swift_beginAccess(v3, v19, 1, 0);
  v15 = *v3;
  *v3 = (void *)v14;

  v16 = objc_msgSend(a1, "historyTokenOffset");
  *(_QWORD *)&v4[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyTokenOffset] = v16;

  v18.receiver = v4;
  v18.super_class = (Class)type metadata accessor for CDMutableCloudSyncVersions();
  return objc_msgSendSuper2(&v18, "init");
}

uint64_t sub_1E3D4(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t type metadata accessor for CDCloudSyncVersions()
{
  return objc_opt_self(CDCloudSyncVersions);
}

const char *sub_1E438()
{
  return "dataType";
}

void sub_1E448(uint64_t a1, void **a2)
{
  void *v2;
  NSString v3;

  v2 = *a2;
  v3 = String._bridgeToObjectiveC()();
  objc_msgSend(v2, "setDataType:", v3);

}

const char *sub_1E498()
{
  return "rawHistoryToken";
}

const char *sub_1E4AC()
{
  return "historyTokenOffset";
}

id sub_1E4B8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, "historyTokenOffset");
  *a2 = result;
  return result;
}

id sub_1E4E8(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, "setHistoryTokenOffset:", *a1);
}

const char *sub_1E4FC()
{
  return "cloudVersion";
}

id sub_1E508@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, "cloudVersion");
  *a2 = result;
  return result;
}

id sub_1E538(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, "setCloudVersion:", *a1);
}

const char *sub_1E54C()
{
  return "localVersion";
}

id sub_1E558@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, "localVersion");
  *a2 = result;
  return result;
}

id sub_1E588(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, "setLocalVersion:", *a1);
}

const char *sub_1E59C()
{
  return "syncVersion";
}

id sub_1E5A8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, "syncVersion");
  *a2 = result;
  return result;
}

id sub_1E5D8(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, "setSyncVersion:", *a1);
}

uint64_t sub_1E5EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1C8D0();
  *a1 = result;
  return result;
}

void sub_1E614(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_1CBB8(v1);
}

uint64_t sub_1E640@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v7[24];

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_dataType);
  swift_beginAccess(v3, v7, 0, 0);
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain(v4, v5);
}

id sub_1E698@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;
  _BYTE v6[24];

  v3 = (void **)(*a1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken);
  swift_beginAccess(v3, v6, 0, 0);
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_1E6EC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_1E740(a1, &OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyTokenOffset, a2);
}

uint64_t sub_1E6F8(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1E798(a1, a2, a3, a4, &OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyTokenOffset);
}

uint64_t sub_1E704@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_1E740(a1, &OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_cloudVersion, a2);
}

uint64_t sub_1E710(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1E798(a1, a2, a3, a4, &OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_cloudVersion);
}

uint64_t sub_1E71C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_1E740(a1, &OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_localVersion, a2);
}

uint64_t sub_1E728(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1E798(a1, a2, a3, a4, &OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_localVersion);
}

uint64_t sub_1E734@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_1E740(a1, &OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_syncVersion, a2);
}

uint64_t sub_1E740@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  _QWORD *v4;
  uint64_t result;
  _BYTE v6[24];

  v4 = (_QWORD *)(*a1 + *a2);
  result = swift_beginAccess(v4, v6, 0, 0);
  *a3 = *v4;
  return result;
}

uint64_t sub_1E78C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1E798(a1, a2, a3, a4, &OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_syncVersion);
}

uint64_t sub_1E798(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;
  _BYTE v8[24];

  v5 = *a1;
  v6 = (_QWORD *)(*a2 + *a5);
  result = swift_beginAccess(v6, v8, 1, 0);
  *v6 = v5;
  return result;
}

uint64_t dispatch thunk of CDCloudSyncVersionsProtocol.dataType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of CDCloudSyncVersionsProtocol.historyToken.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of CDCloudSyncVersionsProtocol.historyTokenOffset.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of CDCloudSyncVersionsProtocol.cloudVersion.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of CDCloudSyncVersionsProtocol.localVersion.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of CDCloudSyncVersionsProtocol.syncVersion.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t method lookup function for CDCloudSyncVersions(uint64_t a1, uint64_t a2)
{
  return swift_lookUpClassMethod(a1, a2, &nominal type descriptor for CDCloudSyncVersions);
}

uint64_t dispatch thunk of CDCloudSyncVersions.historyToken.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((char *)&stru_20.maxprot + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDCloudSyncVersions.historyToken.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((char *)&stru_20.nsects + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDCloudSyncVersions.historyToken.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))&stru_68.sectname[swift_isaMask & *v0])();
}

uint64_t method lookup function for CDMutableCloudSyncVersions(uint64_t a1, uint64_t a2)
{
  return swift_lookUpClassMethod(a1, a2, &nominal type descriptor for CDMutableCloudSyncVersions);
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.dataType.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))&stru_68.segname[(swift_isaMask & *v0) + 8])();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.dataType.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))&stru_68.segname[(swift_isaMask & *v0) + 16])();
}

uint64_t dispatch thunk of BaseDonor.eventConfigurations.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((char *)&stru_68.size + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.historyToken.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((char *)&stru_68.offset + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.historyToken.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((char *)&stru_68.reloff + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.historyToken.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((char *)&stru_68.flags + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.historyTokenOffset.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((char *)&stru_68.reserved2 + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.historyTokenOffset.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))&stru_B8.sectname[swift_isaMask & *v0])();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.historyTokenOffset.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))&stru_B8.segname[(swift_isaMask & *v0) - 8])();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.cloudVersion.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))&stru_B8.segname[swift_isaMask & *v0])();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.cloudVersion.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))&stru_B8.segname[(swift_isaMask & *v0) + 8])();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.cloudVersion.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))&stru_B8.segname[(swift_isaMask & *v0) + 16])();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.localVersion.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((char *)&stru_B8.size + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.localVersion.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((char *)&stru_B8.offset + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.localVersion.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((char *)&stru_B8.reloff + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.syncVersion.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((char *)&stru_B8.flags + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.syncVersion.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((char *)&stru_B8.reserved2 + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.syncVersion.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))&stru_108.sectname[swift_isaMask & *v0])();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))&stru_108.segname[swift_isaMask & *v0])();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 288))();
}

Swift::Void __swiftcall LocalStorage.purgeAllIfNeeded()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char v9;
  void (*v10)(char *, uint64_t);
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;

  v1 = type metadata accessor for Date(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v13 - v6;
  v8 = sub_201D0((uint64_t)&v13 - v6);
  Date.init(timeIntervalSinceNow:)(v8, -86400.0);
  v9 = static Date.< infix(_:_:)(v7, v5);
  v10 = *(void (**)(char *, uint64_t))(v2 + 8);
  v10(v5, v1);
  v10(v7, v1);
  if ((v9 & 1) != 0)
  {
    v11 = swift_allocObject(&unk_39B70, 24, 7);
    swift_weakInit(v11 + 16);
    v12 = (_QWORD *)swift_allocObject(&unk_39B98, 40, 7);
    v12[2] = v0;
    v12[3] = sub_203D0;
    v12[4] = v11;
    swift_retain_n(v11, 2);
    swift_retain();
    sub_2BA88((uint64_t)sub_1B2AC, (uint64_t)v12);
    swift_release_n(v11, 2);
    swift_release(v12);
  }
}

Swift::Void __swiftcall LocalStorage.forcePurgeAll()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_allocObject(&unk_39B70, 24, 7);
  swift_weakInit(v1 + 16);
  v2 = (_QWORD *)swift_allocObject(&unk_39BC0, 40, 7);
  v2[2] = v0;
  v2[3] = sub_1B29C;
  v2[4] = v1;
  swift_retain_n(v1, 2);
  swift_retain();
  sub_2BA88((uint64_t)sub_1C718, (uint64_t)v2);
  swift_release_n(v1, 2);
  swift_release(v2);
}

uint64_t sub_1EC8C(uint64_t a1)
{
  char **v1;
  unint64_t v2;
  char *v3;
  int64_t v4;
  int64_t v5;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  int64_t v16;
  uint64_t result;
  char v18;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *((_QWORD *)*v1 + 2);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((_DWORD)isUniquelyReferenced_nonNull_native)
  {
    v8 = *((_QWORD *)v3 + 3) >> 1;
    if (v8 >= v5)
    {
      v9 = *(_QWORD *)(a1 + 16);
      if (v9)
        goto LABEL_5;
LABEL_18:
      if (!v2)
        goto LABEL_19;
      goto LABEL_21;
    }
  }
  if (v4 <= v5)
    v16 = v4 + v2;
  else
    v16 = v4;
  v3 = sub_23AD8(isUniquelyReferenced_nonNull_native, v16, 1, v3);
  v8 = *((_QWORD *)v3 + 3) >> 1;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    goto LABEL_18;
LABEL_5:
  v10 = *((_QWORD *)v3 + 2);
  if (v8 - v10 < (uint64_t)v9)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v11 = (unint64_t)&v3[56 * v10 + 32];
  if (a1 + 32 < v11 + 56 * v9 && v11 < a1 + 32 + 56 * v9)
    goto LABEL_24;
  sub_44F0(&qword_3EC00);
  swift_arrayInitWithCopy(v11);
  if (v9 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v13 = *((_QWORD *)v3 + 2);
  v14 = __OFADD__(v13, v9);
  v15 = v13 + v9;
  if (!v14)
  {
    *((_QWORD *)v3 + 2) = v15;
LABEL_19:
    result = swift_bridgeObjectRelease(a1);
    *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  v18 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, v18, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_1EE08(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;

  v9 = a4 >> 1;
  v10 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
    goto LABEL_11;
  v6 = a3;
  v7 = a2;
  v4 = a1;
  v8 = *v5;
  if ((unint64_t)*v5 >> 62)
    goto LABEL_12;
  v11 = *(_QWORD *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFF8));
  v12 = v11 + v10;
  if (!__OFADD__(v11, v10))
    goto LABEL_4;
LABEL_17:
  __break(1u);
LABEL_18:
  v14 = 1;
LABEL_19:
  if ((unint64_t)v8 >> 62)
  {
    if (v8 < 0)
      v27 = v8;
    else
      v27 = v8 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v8, a2);
    v18 = _CocoaArrayWrapper.endIndex.getter(v27);
    swift_bridgeObjectRelease(v8);
  }
  else
  {
    v18 = *(_QWORD *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFF8));
  }
  if (v18 <= v12)
    v18 = v12;
  swift_bridgeObjectRetain(v8, a2);
  v8 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v14, v18, 1, v8);
  swift_bridgeObjectRelease(*v5);
  *v5 = v8;
  v15 = v8 & 0xFFFFFFFFFFFFFF8;
  if (v9 == v6)
  {
    while (v10 > 0)
    {
      __break(1u);
LABEL_11:
      __break(1u);
LABEL_12:
      if (v8 < 0)
        v16 = v8;
      else
        v16 = v8 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v8, a2);
      v17 = _CocoaArrayWrapper.endIndex.getter(v16);
      swift_bridgeObjectRelease(v8);
      v12 = v17 + v10;
      if (__OFADD__(v17, v10))
        goto LABEL_17;
LABEL_4:
      v8 = *v5;
      isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v5);
      *v5 = v8;
      v14 = 0;
      if (!isUniquelyReferenced_nonNull_bridgeObject || v8 < 0 || (v8 & 0x4000000000000000) != 0)
        goto LABEL_19;
      v15 = v8 & 0xFFFFFFFFFFFFFF8;
      if (v12 > *(_QWORD *)((char *)&dword_18 + (v8 & 0xFFFFFFFFFFFFFF8)) >> 1)
        goto LABEL_18;
      if (v9 != v6)
        goto LABEL_24;
    }
    goto LABEL_31;
  }
LABEL_24:
  v19 = *(_QWORD *)(v15 + 16);
  if ((*(_QWORD *)(v15 + 24) >> 1) - v19 < v10)
  {
    __break(1u);
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  if ((v10 & 0x8000000000000000) == 0)
  {
    v20 = v15 + 8 * v19 + 32;
    v21 = v7 + 8 * v6;
    if (v21 < v20 + 8 * v10 && v20 < v21 + 8 * v10)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
      goto LABEL_40;
    }
    type metadata accessor for CDProperty();
    swift_arrayInitWithCopy(v20);
    if (!v10)
    {
LABEL_31:
      v25 = swift_unknownObjectRelease(v4);
      return specialized Array._endMutation()(v25);
    }
    v22 = *(_QWORD *)((char *)&dword_10 + (*v5 & 0xFFFFFFFFFFFFFF8));
    v23 = __OFADD__(v22, v10);
    v24 = v22 + v10;
    if (!v23)
    {
      *(_QWORD *)((char *)&dword_10 + (*v5 & 0xFFFFFFFFFFFFFF8)) = v24;
      goto LABEL_31;
    }
    goto LABEL_37;
  }
LABEL_38:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
LABEL_40:
  __break(1u);
  return result;
}

void sub_1F084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t *v7;
  uint64_t Strong;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *oslog;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24[3];
  _QWORD v25[3];
  _BYTE v26[8];

  if ((a2 & 1) == 0)
  {
    v4 = a3 + 16;
    if ((unint64_t)a1 >> 62)
    {
      if (a1 >= 0)
        v18 = a1 & 0xFFFFFFFFFFFFFF8;
      else
        v18 = a1;
      swift_bridgeObjectRetain(a1, a2);
      v5 = _CocoaArrayWrapper.endIndex.getter(v18);
      if (v5)
        goto LABEL_4;
    }
    else
    {
      v5 = *(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain(a1, a2);
      if (v5)
      {
LABEL_4:
        if (v5 < 1)
        {
          __break(1u);
          return;
        }
        swift_beginAccess(v4, v24, 0, 0);
        for (i = 0; i != v5; ++i)
        {
          if ((a1 & 0xC000000000000001) != 0)
          {
            v7 = (uint64_t *)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
          }
          else
          {
            v7 = *(uint64_t **)(a1 + 8 * i + 32);
            swift_unknownObjectRetain(v7);
          }
          Strong = swift_weakLoadStrong(v4);
          if (Strong)
          {
            v9 = Strong;
            swift_getObjectType(v7);
            sub_20D18(v7, v9);
            swift_unknownObjectRelease(v7);
            swift_release(v9);
          }
          else
          {
            swift_unknownObjectRelease(v7);
          }
        }
      }
    }
    sub_DA68(a1, 0);
    swift_beginAccess(v4, &v22, 0, 0);
    v19 = swift_weakLoadStrong(v4);
    if (v19)
    {
      v20 = v19;
      sub_215EC();
      swift_release(v20);
    }
    return;
  }
  swift_errorRetain(a1);
  if (qword_3E6A0 != -1)
    swift_once(&qword_3E6A0, sub_10B64);
  v10 = type metadata accessor for Logger(0);
  sub_AD78(v10, (uint64_t)qword_3FA80);
  swift_errorRetain(a1);
  v11 = swift_errorRetain(a1);
  oslog = Logger.logObject.getter(v11);
  v12 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(12, -1);
    v14 = swift_slowAlloc(32, -1);
    v24[0] = v14;
    *(_DWORD *)v13 = 136315138;
    swift_getErrorValue(a1, v26, v25);
    v15 = Error.localizedDescription.getter(v25[1], v25[2]);
    v17 = v16;
    v22 = sub_282C4(v15, v16, v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v13 + 4, v13 + 12);
    swift_bridgeObjectRelease(v17);
    sub_DA68(a1, 1);
    sub_DA68(a1, 1);
    _os_log_impl(&dword_0, oslog, v12, "Something wrong happened while fetching all configuration: %s", v13, 0xCu);
    swift_arrayDestroy(v14, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v13, -1, -1);

    sub_DA68(a1, 1);
  }
  else
  {
    sub_DA68(a1, 1);
    sub_DA68(a1, 1);
    swift_errorRelease(a1);

  }
}

void sub_1F3B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t Strong;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  NSObject *oslog;
  uint64_t v23[3];
  uint64_t v24;
  _QWORD v25[3];
  _BYTE v26[8];

  if ((a2 & 1) == 0)
  {
    if ((unint64_t)a1 >> 62)
    {
      if (a1 >= 0)
        v21 = a1 & 0xFFFFFFFFFFFFFF8;
      else
        v21 = a1;
      swift_bridgeObjectRetain(a1, a2);
      v5 = _CocoaArrayWrapper.endIndex.getter(v21);
      if (v5)
        goto LABEL_4;
    }
    else
    {
      v5 = *(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain(a1, a2);
      if (v5)
      {
LABEL_4:
        if (v5 >= 1)
        {
          v6 = a3 + 16;
          swift_beginAccess(a3 + 16, v23, 0, 0);
          for (i = 0; i != v5; ++i)
          {
            if ((a1 & 0xC000000000000001) != 0)
            {
              v8 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
            }
            else
            {
              v8 = *(void **)(a1 + 8 * i + 32);
              swift_unknownObjectRetain(v8);
            }
            Strong = swift_weakLoadStrong(v6);
            if (Strong)
            {
              v10 = Strong;
              sub_1F6C0(v8);
              swift_unknownObjectRelease(v8);
              swift_release(v10);
            }
            else
            {
              swift_unknownObjectRelease(v8);
            }
          }
          v19 = a1;
          v20 = 0;
          goto LABEL_18;
        }
        __break(1u);
        return;
      }
    }
    sub_DA68(a1, 0);
    return;
  }
  swift_errorRetain(a1);
  if (qword_3E6A0 != -1)
    swift_once(&qword_3E6A0, sub_10B64);
  v11 = type metadata accessor for Logger(0);
  sub_AD78(v11, (uint64_t)qword_3FA80);
  swift_errorRetain(a1);
  v12 = swift_errorRetain(a1);
  oslog = Logger.logObject.getter(v12);
  v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(12, -1);
    v15 = swift_slowAlloc(32, -1);
    v23[0] = v15;
    *(_DWORD *)v14 = 136315138;
    swift_getErrorValue(a1, v26, v25);
    v16 = Error.localizedDescription.getter(v25[1], v25[2]);
    v18 = v17;
    v24 = sub_282C4(v16, v17, v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, v25, v14 + 4, v14 + 12);
    swift_bridgeObjectRelease(v18);
    sub_DA68(a1, 1);
    sub_DA68(a1, 1);
    _os_log_impl(&dword_0, oslog, v13, "Something wrong happened while fetching all configuration: %s", v14, 0xCu);
    swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1, -1);
    swift_slowDealloc(v14, -1, -1);

    v19 = a1;
    v20 = 1;
LABEL_18:
    sub_DA68(v19, v20);
    return;
  }
  sub_DA68(a1, 1);
  sub_DA68(a1, 1);
  swift_errorRelease(a1);

}

void sub_1F6C0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  unsigned __int8 v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  void *i;
  _QWORD v39[3];
  _BYTE v40[8];
  uint64_t v41;
  uint64_t v42;
  id v43;

  v2 = (uint64_t)a1;
  v3 = objc_msgSend(a1, "eventName");
  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);
  v7 = v6;

  v8 = (os_unfair_lock_s *)(*(_QWORD *)(v1 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v8);
  sub_2E7B0((_QWORD *(*)(uint64_t *__return_ptr))sub_20D00, &v43);
  os_unfair_lock_unlock(v8);
  v9 = v43;
  v10 = sub_CE64(v5, v7);
  swift_bridgeObjectRelease(v7);

  if (v10)
  {
    v12 = v10 & 0xFFFFFFFFFFFFFF8;
    if ((unint64_t)v10 >> 62)
      goto LABEL_18;
    v13 = *(_QWORD *)((char *)&dword_10 + (v10 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain(v10, v11);
    for (i = (void *)v2; v13; i = (void *)v2)
    {
      v2 = 4;
      while (1)
      {
        v14 = (v10 & 0xC000000000000001) != 0
            ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v2 - 4, v10)
            : *(id *)(v10 + 8 * v2);
        v15 = v14;
        v16 = v2 - 3;
        if (__OFADD__(v2 - 4, 1))
          break;
        os_unfair_lock_lock(v8);
        sub_2E7B0((_QWORD *(*)(uint64_t *__return_ptr))sub_20D00, &v43);
        os_unfair_lock_unlock(v8);
        v17 = v43;
        objc_msgSend(v43, "deleteObject:", v15);

        ++v2;
        if (v16 == v13)
          goto LABEL_10;
      }
      __break(1u);
LABEL_18:
      if (v10 >= 0)
        v37 = v12;
      else
        v37 = v10;
      swift_bridgeObjectRetain_n(v10, 2);
      v13 = _CocoaArrayWrapper.endIndex.getter(v37);
      swift_bridgeObjectRelease(v10);
    }
LABEL_10:
    swift_bridgeObjectRelease_n(v10, 2);
    os_unfair_lock_lock(v8);
    sub_2E7B0((_QWORD *(*)(uint64_t *__return_ptr))sub_20D00, &v43);
    os_unfair_lock_unlock(v8);
    v18 = v43;
    v43 = 0;
    v19 = objc_msgSend(v18, "save:", &v43);

    v20 = v43;
    if ((v19 & 1) == 0)
    {
      v21 = v20;
      v22 = _convertNSErrorToError(_:)(v20);

      swift_willThrow();
      if (qword_3E6A0 != -1)
        swift_once(&qword_3E6A0, sub_10B64);
      v23 = type metadata accessor for Logger(0);
      sub_AD78(v23, (uint64_t)qword_3FA80);
      swift_unknownObjectRetain(i);
      swift_errorRetain(v22);
      swift_unknownObjectRetain(i);
      v24 = swift_errorRetain(v22);
      v25 = Logger.logObject.getter(v24);
      v26 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v25, v26))
      {
        v27 = swift_slowAlloc(22, -1);
        v28 = (void *)swift_slowAlloc(64, -1);
        v43 = v28;
        *(_DWORD *)v27 = 136315394;
        v29 = objc_msgSend(i, "eventName");
        v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29, v30);
        v33 = v32;

        v41 = sub_282C4(v31, v33, (uint64_t *)&v43);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v27 + 4, v27 + 12);
        swift_unknownObjectRelease_n(i, 2);
        swift_bridgeObjectRelease(v33);
        *(_WORD *)(v27 + 12) = 2080;
        swift_getErrorValue(v22, v40, v39);
        v34 = Error.localizedDescription.getter(v39[1], v39[2]);
        v36 = v35;
        v41 = sub_282C4(v34, v35, (uint64_t *)&v43);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v27 + 14, v27 + 22);
        swift_bridgeObjectRelease(v36);
        swift_errorRelease(v22);
        swift_errorRelease(v22);
        _os_log_impl(&dword_0, v25, v26, "Something wrong happened while deleting properties from the local storage %s: %s", (uint8_t *)v27, 0x16u);
        swift_arrayDestroy(v28, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v28, -1, -1);
        swift_slowDealloc(v27, -1, -1);

        swift_errorRelease(v22);
      }
      else
      {
        swift_errorRelease(v22);
        swift_unknownObjectRelease_n(i, 2);
        swift_errorRelease(v22);
        swift_errorRelease(v22);

      }
    }
  }
}

Swift::Void __swiftcall LocalStorage.purge(propertyName:)(Swift::String propertyName)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  object = propertyName._object;
  countAndFlagsBits = propertyName._countAndFlagsBits;
  v4 = swift_allocObject(&unk_39B70, 24, 7);
  swift_weakInit(v4 + 16);
  v5 = (_QWORD *)swift_allocObject(&unk_39BE8, 40, 7);
  v5[2] = v4;
  v5[3] = countAndFlagsBits;
  v5[4] = object;
  v6 = (_QWORD *)swift_allocObject(&unk_39C10, 56, 7);
  v6[2] = countAndFlagsBits;
  v6[3] = object;
  v6[4] = v1;
  v6[5] = sub_20438;
  v6[6] = v5;
  swift_bridgeObjectRetain_n(object, 2);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2BA88((uint64_t)sub_2047C, (uint64_t)v6);
  swift_release(v4);
  swift_release(v5);
  swift_release(v6);
}

void sub_1FC38(void *a1, char a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v6;
  uint64_t Strong;
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  NSObject *oslog;
  uint64_t v23[3];
  _QWORD v24[3];
  _BYTE v25[8];
  uint64_t v26;
  uint64_t v27;

  if ((a2 & 1) != 0)
  {
    swift_errorRetain(a1);
    if (qword_3E6A0 != -1)
      swift_once(&qword_3E6A0, sub_10B64);
    v11 = type metadata accessor for Logger(0);
    sub_AD78(v11, (uint64_t)qword_3FA80);
    sub_1BC50(a1, 1);
    swift_bridgeObjectRetain(a5, v12);
    sub_1BC50(a1, 1);
    v14 = swift_bridgeObjectRetain(a5, v13);
    oslog = Logger.logObject.getter(v14);
    v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v15))
    {
      v16 = swift_slowAlloc(22, -1);
      v17 = swift_slowAlloc(64, -1);
      v23[0] = v17;
      *(_DWORD *)v16 = 136315394;
      swift_bridgeObjectRetain(a5, v18);
      v26 = sub_282C4(a4, a5, v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v16 + 4, v16 + 12);
      swift_bridgeObjectRelease_n(a5, 3);
      *(_WORD *)(v16 + 12) = 2080;
      swift_getErrorValue(a1, v25, v24);
      v19 = Error.localizedDescription.getter(v24[1], v24[2]);
      v21 = v20;
      v26 = sub_282C4(v19, v20, v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v16 + 14, v16 + 22);
      swift_bridgeObjectRelease(v21);
      sub_1BC5C(a1, 1);
      sub_1BC5C(a1, 1);
      _os_log_impl(&dword_0, oslog, v15, "No configuration found to purge %s: %s", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy(v17, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v17, -1, -1);
      swift_slowDealloc(v16, -1, -1);

      sub_1BC5C(a1, 1);
    }
    else
    {
      sub_1BC5C(a1, 1);
      swift_bridgeObjectRelease_n(a5, 2);
      sub_1BC5C(a1, 1);
      sub_1BC5C(a1, 1);

    }
  }
  else if (a1)
  {
    v6 = a3 + 16;
    swift_beginAccess(a3 + 16, v23, 0, 0);
    Strong = swift_weakLoadStrong(v6);
    if (Strong)
    {
      v8 = Strong;
      sub_2048C((os_unfair_lock_s *)a1, Strong);
      sub_1BC5C(a1, 0);
      swift_release(v8);
    }
  }
}

uint64_t sub_1FF04(id *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  void (*v16)(char *, char *, uint64_t);
  unint64_t v17;
  char v18;
  uint64_t v20;

  v4 = sub_44F0(&qword_3EAD0);
  __chkstk_darwin(v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v20 - v12;
  v14 = objc_msgSend(*a1, "createdAt");
  if (!v14)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_5;
  }
  v15 = v14;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  v16 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v16(v6, v11, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_5:
    sub_DB08((uint64_t)v6, &qword_3EAD0);
    v18 = 0;
    return v18 & 1;
  }
  v16(v13, v6, v7);
  v17 = sub_215A4();
  v18 = dispatch thunk of static Comparable.< infix(_:_:)(v13, a2, v7, v17) ^ 1;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  return v18 & 1;
}

uint64_t sub_200BC(uint64_t (*a1)(id *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  v4 = v3;
  if ((unint64_t)a3 >> 62)
    goto LABEL_14;
  v7 = *(_QWORD *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8));
  v8 = 0;
  if (v7)
  {
    while (1)
    {
      v9 = (a3 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8, a3)
         : *(id *)(a3 + 8 * v8 + 32);
      v10 = v9;
      v15 = v9;
      v11 = a1(&v15);

      if (v4 || (v11 & 1) != 0)
        break;
      v12 = v8 + 1;
      if (__OFADD__(v8, 1))
      {
        __break(1u);
LABEL_14:
        if (a3 < 0)
          v13 = a3;
        else
          v13 = a3 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(a3, a2);
        v7 = _CocoaArrayWrapper.endIndex.getter(v13);
        swift_bridgeObjectRelease(a3);
        v8 = 0;
        if (!v7)
          return v8;
      }
      else
      {
        ++v8;
        if (v12 == v7)
          return 0;
      }
    }
  }
  return v8;
}

uint64_t sub_201D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  NSString v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  _OWORD v14[2];
  _BYTE v15[24];
  uint64_t v16;

  v2 = sub_44F0(&qword_3EAD0);
  __chkstk_darwin(v2);
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
  v6 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend(v5, "objectForKey:", v6);

  if (v7)
  {
    _bridgeAnyObjectToAny(_:)(v14, v7);
    swift_unknownObjectRelease(v7);
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  sub_2170C((uint64_t)v14, (uint64_t)v15);
  if (v16)
  {
    v8 = type metadata accessor for Date(0);
    v9 = swift_dynamicCast(v4, v15, (char *)&type metadata for Any + 8, v8, 6);
    v10 = *(_QWORD *)(v8 - 8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v4, v9 ^ 1u, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v4, 1, v8) != 1)
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a1, v4, v8);
  }
  else
  {
    sub_DB08((uint64_t)v15, &qword_3E6E0);
    v12 = type metadata accessor for Date(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v4, 1, 1, v12);
  }
  v13 = sub_DB08((uint64_t)v4, &qword_3EAD0);
  return Date.init(timeIntervalSince1970:)(v13, 0.0);
}

uint64_t sub_203AC()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_203D0(uint64_t a1, char a2)
{
  uint64_t v2;

  sub_1F084(a1, a2 & 1, v2);
}

uint64_t sub_203DC()
{
  return sub_20400((void (*)(_QWORD))&_swift_release);
}

uint64_t sub_203E8()
{
  return sub_20400((void (*)(_QWORD))&_swift_release);
}

uint64_t sub_203F4()
{
  return sub_20400((void (*)(_QWORD))&_swift_bridgeObjectRelease);
}

uint64_t sub_20400(void (*a1)(_QWORD))
{
  uint64_t v1;

  swift_release(*(_QWORD *)(v1 + 16));
  a1(*(_QWORD *)(v1 + 32));
  return swift_deallocObject(v1, 40, 7);
}

void sub_20438(void *a1, char a2)
{
  uint64_t v2;

  sub_1FC38(a1, a2 & 1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_20448()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[3]);
  swift_release(v0[4]);
  swift_release(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_2047C()
{
  uint64_t v0;

  return sub_26BA4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void (**)(id, uint64_t))(v0 + 40), *(_QWORD *)(v0 + 48));
}

void sub_2048C(os_unfair_lock_s *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_unfair_lock_s *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id (*v19)@<X0>(_QWORD *@<X8>);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  Swift::Int v26;
  Swift::Int v27;
  uint64_t v28;
  id (*v29)@<X0>(_QWORD *@<X8>);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id (*v47)@<X0>(_QWORD *@<X8>);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  Swift::Int v51;
  Swift::Int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  id v66;
  unsigned int v67;
  id v68;
  void *v69;
  uint64_t v70;
  os_unfair_lock_s *v71;
  os_unfair_lock_s *v72;
  uint64_t v73;
  NSObject *v74;
  os_log_type_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  os_unfair_lock_s *v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  _QWORD v94[3];
  char v95[8];
  id v96;
  uint64_t v97;
  unint64_t v98;

  v93 = a2;
  v3 = type metadata accessor for Date(0);
  v90 = *(_QWORD *)(v3 - 8);
  v91 = v3;
  __chkstk_darwin(v3);
  v92 = (char *)&v88 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (uint64_t)-[os_unfair_lock_s ageToExpire](a1, "ageToExpire");
  v6 = -[os_unfair_lock_s countLimit](a1, "countLimit");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL || v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (uint64_t)v6;
    v9 = -[os_unfair_lock_s eventName](a1, "eventName");
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);
    v13 = v12;

    v14 = (os_unfair_lock_s *)(*(_QWORD *)(v93 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
    os_unfair_lock_lock(v14);
    sub_2E7B0((_QWORD *(*)(uint64_t *__return_ptr))sub_20D00, &v98);
    os_unfair_lock_unlock(v14);
    v15 = (void *)v98;
    v16 = sub_CE64(v11, v13);
    swift_bridgeObjectRelease(v13);

    if (v16)
    {
      v98 = (unint64_t)_swiftEmptyArrayStorage;
      v19 = (id (*)@<X0>(_QWORD *@<X8>))((unint64_t)v16 >> 62);
      if ((unint64_t)v16 >> 62)
        goto LABEL_71;
      v20 = *(_QWORD *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFF8));
      if (v8 < v20)
      {
LABEL_8:
        v21 = v8 - 1;
        if (__OFSUB__(v8, 1))
        {
          __break(1u);
        }
        else
        {
          v88 = v20;
          if ((v21 & 0x8000000000000000) == 0)
          {
            v22 = v8;
            if (!__OFADD__(v21, 1))
            {
              if (v19)
              {
                if (v16 < 0)
                  v24 = v16;
                else
                  v24 = v16 & 0xFFFFFFFFFFFFFF8;
                swift_bridgeObjectRetain(v16, v18);
                if (_CocoaArrayWrapper.endIndex.getter(v24) < 0)
                {
                  __break(1u);
LABEL_88:
                  __break(1u);
LABEL_89:
                  __break(1u);
                }
                swift_bridgeObjectRetain(v16, v25);
                v23 = _CocoaArrayWrapper.endIndex.getter(v24);
                swift_bridgeObjectRelease(v16);
              }
              else
              {
                v23 = *(_QWORD *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFF8));
                swift_bridgeObjectRetain(v16, v18);
              }
              if (v23 >= v8)
              {
                if ((v8 & 0x8000000000000000) == 0)
                {
                  if ((v16 & 0xC000000000000001) == 0)
                    goto LABEL_24;
                  type metadata accessor for CDProperty();
                  v26 = 0;
                  do
                  {
                    v27 = v26 + 1;
                    _ArrayBuffer._typeCheckSlowPath(_:)(v26);
                    v26 = v27;
                  }
                  while (v8 != v27);
                  if (v19)
                  {
                    v29 = v19;
                    if (v16 < 0)
                      v34 = v16;
                    else
                      v34 = v16 & 0xFFFFFFFFFFFFFF8;
                    swift_bridgeObjectRetain(v16, v28);
                    v31 = _CocoaArrayWrapper.subscript.getter(0, v22, v34);
                    v32 = v35;
                    v37 = v36;
                    v33 = v38;
                    swift_bridgeObjectRelease_n(v16, 2);
                    v30 = v37;
                  }
                  else
                  {
LABEL_24:
                    v29 = v19;
                    v30 = 0;
                    v31 = v16 & 0xFFFFFFFFFFFFFF8;
                    v32 = (v16 & 0xFFFFFFFFFFFFFF8) + 32;
                    v33 = (2 * v8) | 1;
                  }
                  v17 = sub_1EE08(v31, v32, v30, v33);
                  v19 = v29;
                  v20 = v88;
                  goto LABEL_30;
                }
                goto LABEL_85;
              }
LABEL_84:
              __break(1u);
LABEL_85:
              __break(1u);
LABEL_86:
              swift_once(&qword_3E6A0, sub_10B64);
LABEL_66:
              v70 = type metadata accessor for Logger(0);
              sub_AD78(v70, (uint64_t)qword_3FA80);
              v71 = v89;
              swift_errorRetain(a1);
              v72 = v71;
              v73 = swift_errorRetain(a1);
              v74 = Logger.logObject.getter(v73);
              v75 = static os_log_type_t.error.getter();
              if (os_log_type_enabled(v74, v75))
              {
                v76 = swift_slowAlloc(22, -1);
                v77 = swift_slowAlloc(64, -1);
                v98 = v77;
                *(_DWORD *)v76 = 136315394;
                v78 = -[os_unfair_lock_s eventName](v72, "eventName");
                v80 = static String._unconditionallyBridgeFromObjectiveC(_:)(v78, v79);
                v82 = v81;

                v96 = (id)sub_282C4(v80, v82, (uint64_t *)&v98);
                UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, &v97, v76 + 4, v76 + 12);

                swift_bridgeObjectRelease(v82);
                *(_WORD *)(v76 + 12) = 2080;
                swift_getErrorValue(a1, v95, v94);
                v83 = Error.localizedDescription.getter(v94[1], v94[2]);
                v85 = v84;
                v96 = (id)sub_282C4(v83, v84, (uint64_t *)&v98);
                UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, &v97, v76 + 14, v76 + 22);
                swift_bridgeObjectRelease(v85);
                swift_errorRelease(a1);
                swift_errorRelease(a1);
                _os_log_impl(&dword_0, v74, v75, "Something wrong happened while deleting properties from the local storage %s: %s", (uint8_t *)v76, 0x16u);
                swift_arrayDestroy(v77, 2, (char *)&type metadata for Any + 8);
                swift_slowDealloc(v77, -1, -1);
                swift_slowDealloc(v76, -1, -1);

                swift_errorRelease(a1);
              }
              else
              {
                swift_errorRelease(a1);

                swift_errorRelease(a1);
                swift_errorRelease(a1);

              }
              return;
            }
LABEL_82:
            __break(1u);
LABEL_83:
            __break(1u);
            goto LABEL_84;
          }
        }
        __break(1u);
        goto LABEL_82;
      }
      while (1)
      {
LABEL_30:
        if (v5 == 0x7FFFFFFFFFFFFFFFLL)
        {
          swift_bridgeObjectRelease(v16);
        }
        else
        {
          if (__OFSUB__(0, v5))
            goto LABEL_83;
          v39 = v92;
          v40 = Date.init(timeIntervalSinceNow:)(v17, (double)-v5);
          __chkstk_darwin(v40);
          *(&v88 - 2) = (uint64_t)v39;
          v41 = sub_200BC(sub_21588, (uint64_t)(&v88 - 4), v16);
          v43 = (v42 & 1) != 0 ? v20 : v41;
          if (v43 > 0 && v20 >= v43)
          {
            if (v19)
            {
              v47 = v19;
              if (v16 < 0)
                v48 = v16;
              else
                v48 = v16 & 0xFFFFFFFFFFFFFF8;
              swift_bridgeObjectRetain(v16, v42);
              v49 = _CocoaArrayWrapper.endIndex.getter(v48);
              swift_bridgeObjectRelease(v16);
              if (v49 < 0)
                goto LABEL_89;
              swift_bridgeObjectRetain(v16, v50);
              v46 = _CocoaArrayWrapper.endIndex.getter(v48);
              swift_bridgeObjectRelease(v16);
              v19 = v47;
            }
            else
            {
              v46 = *(_QWORD *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFF8));
            }
            if (v46 < v43)
              goto LABEL_88;
            if ((v16 & 0xC000000000000001) == 0)
              goto LABEL_51;
            type metadata accessor for CDProperty();
            v51 = 0;
            do
            {
              v52 = v51 + 1;
              _ArrayBuffer._typeCheckSlowPath(_:)(v51);
              v51 = v52;
            }
            while (v43 != v52);
            if (v19)
            {
              v57 = v16 < 0 ? v16 : v16 & 0xFFFFFFFFFFFFFF8;
              swift_bridgeObjectRetain(v16, v53);
              v54 = _CocoaArrayWrapper.subscript.getter(0, v43, v57);
              v55 = v58;
              v5 = v59;
              v56 = v60;
              swift_bridgeObjectRelease_n(v16, 2);
            }
            else
            {
LABEL_51:
              v5 = 0;
              v54 = v16 & 0xFFFFFFFFFFFFFF8;
              v55 = (v16 & 0xFFFFFFFFFFFFFF8) + 32;
              v56 = (2 * v43) | 1;
            }
            sub_1EE08(v54, v55, v5, v56);
            v45 = v90;
            v44 = v91;
            v39 = v92;
          }
          else
          {
            swift_bridgeObjectRelease(v16);
            v45 = v90;
            v44 = v91;
          }
          (*(void (**)(char *, uint64_t))(v45 + 8))(v39, v44);
        }
        v61 = v98;
        v89 = a1;
        if (v98 >> 62)
        {
          v87 = (v98 & 0x8000000000000000) != 0 ? v98 : v98 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain_n(v98, 3);
          v62 = _CocoaArrayWrapper.endIndex.getter(v87);
          swift_bridgeObjectRelease(v61);
        }
        else
        {
          v62 = *(_QWORD *)((char *)&dword_10 + (v98 & 0xFFFFFFFFFFFFF8));
          swift_bridgeObjectRetain_n(v98, 2);
        }
        a1 = v14;
        v92 = (char *)v61;
        if (!v62)
          break;
        v63 = 0;
        v64 = v61 + 32;
        v19 = sub_20D00;
        while (1)
        {
          v8 = v63 + 1;
          if (__OFADD__(v63, 1))
            break;
          v14 = (os_unfair_lock_s *)&v88;
          v16 = (uint64_t)*(id *)(v64 + 8 * v63);
          os_unfair_lock_lock(a1);
          sub_2E7B0((_QWORD *(*)(uint64_t *__return_ptr))sub_20D00, &v96);
          os_unfair_lock_unlock(a1);
          v5 = (uint64_t)v96;
          objc_msgSend(v96, "deleteObject:", v16);

          ++v63;
          if (v8 == v62)
            goto LABEL_64;
        }
        __break(1u);
LABEL_71:
        if (v16 < 0)
          v86 = v16;
        else
          v86 = v16 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v16, v18);
        v20 = _CocoaArrayWrapper.endIndex.getter(v86);
        v17 = swift_bridgeObjectRelease(v16);
        if (v8 < v20)
          goto LABEL_8;
      }
LABEL_64:
      v65 = v92;
      swift_bridgeObjectRelease_n(v92, 2);
      swift_bridgeObjectRelease(v65);
      os_unfair_lock_lock(a1);
      sub_2E7B0((_QWORD *(*)(uint64_t *__return_ptr))sub_20D00, &v96);
      os_unfair_lock_unlock(a1);
      v66 = v96;
      v96 = 0;
      v67 = objc_msgSend(v66, "save:", &v96);

      v68 = v96;
      if (!v67)
      {
        v69 = v68;
        a1 = (os_unfair_lock_s *)_convertNSErrorToError(_:)(v68);

        swift_willThrow();
        if (qword_3E6A0 == -1)
          goto LABEL_66;
        goto LABEL_86;
      }
    }
  }
}

id sub_20D00@<X0>(_QWORD *a1@<X8>)
{
  return sub_29218(a1);
}

void sub_20D18(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  id (*v5)@<X0>(_QWORD *@<X8>);
  uint64_t v6;
  id v7;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_unfair_lock_s *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char **p_attr;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char **v26;
  Swift::Int v27;
  Swift::Int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char **v47;
  Swift::Int v48;
  Swift::Int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  id v62;
  os_unfair_lock_s *v63;
  unint64_t v64;
  os_unfair_lock_s *v65;
  id v66;
  unsigned int v67;
  id v68;
  void *v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  NSObject *v73;
  os_log_type_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  unint64_t v90;
  os_unfair_lock_t v91;
  uint64_t v92;
  _QWORD v93[3];
  char v94[8];
  id v95;
  uint64_t v96;
  unint64_t v97;

  v92 = a2;
  v3 = type metadata accessor for Date(0);
  v89 = *(_QWORD *)(v3 - 8);
  v90 = v3;
  __chkstk_darwin(v3);
  v5 = (id (*)@<X0>(_QWORD *@<X8>))((char *)&v87 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = (uint64_t)objc_msgSend(a1, "ageToExpire");
  v7 = objc_msgSend(a1, "countLimit");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL || v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = (uint64_t)v7;
    v10 = objc_msgSend(a1, "eventName");
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10, v11);
    v14 = v13;

    v15 = (os_unfair_lock_s *)(*(_QWORD *)(v92 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
    os_unfair_lock_lock(v15);
    sub_2E7B0((_QWORD *(*)(uint64_t *__return_ptr))sub_20D00, &v97);
    v91 = v15;
    os_unfair_lock_unlock(v15);
    v16 = (void *)v97;
    v17 = sub_CE64(v12, v14);
    swift_bridgeObjectRelease(v14);

    if (v17)
    {
      v97 = (unint64_t)&_swiftEmptyArrayStorage;
      p_attr = (char **)((unint64_t)v17 >> 62);
      if ((unint64_t)v17 >> 62)
        goto LABEL_70;
      v21 = *(_QWORD *)((char *)&dword_10 + (v17 & 0xFFFFFFFFFFFFF8));
      while (v9 >= v21)
      {
LABEL_30:
        if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        {
          swift_bridgeObjectRelease(v17);
        }
        else
        {
          if (__OFSUB__(0, v6))
            goto LABEL_83;
          v39 = Date.init(timeIntervalSinceNow:)(v18, (double)-v6);
          __chkstk_darwin(v39);
          *(&v87 - 2) = (uint64_t)v5;
          v40 = sub_200BC(sub_21754, (uint64_t)(&v87 - 4), v17);
          if ((v41 & 1) != 0)
            v42 = v21;
          else
            v42 = v40;
          if (v42 > 0 && v21 >= v42)
          {
            if (p_attr)
            {
              if (v17 < 0)
                v44 = v17;
              else
                v44 = v17 & 0xFFFFFFFFFFFFFF8;
              swift_bridgeObjectRetain(v17, v41);
              v45 = _CocoaArrayWrapper.endIndex.getter(v44);
              swift_bridgeObjectRelease(v17);
              if (v45 < 0)
                goto LABEL_89;
              swift_bridgeObjectRetain(v17, v46);
              v43 = _CocoaArrayWrapper.endIndex.getter(v44);
              swift_bridgeObjectRelease(v17);
            }
            else
            {
              v43 = *(_QWORD *)((char *)&dword_10 + (v17 & 0xFFFFFFFFFFFFF8));
            }
            if (v43 < v42)
              goto LABEL_88;
            if ((v17 & 0xC000000000000001) == 0)
              goto LABEL_51;
            v47 = p_attr;
            type metadata accessor for CDProperty();
            v48 = 0;
            do
            {
              v49 = v48 + 1;
              _ArrayBuffer._typeCheckSlowPath(_:)(v48);
              v48 = v49;
            }
            while (v42 != v49);
            if (v47)
            {
              if (v17 < 0)
                v55 = v17;
              else
                v55 = v17 & 0xFFFFFFFFFFFFFF8;
              swift_bridgeObjectRetain(v17, v50);
              v52 = _CocoaArrayWrapper.subscript.getter(0, v42, v55);
              v53 = v56;
              v51 = v57;
              v54 = v58;
              swift_bridgeObjectRelease_n(v17, 2);
            }
            else
            {
LABEL_51:
              v51 = 0;
              v52 = v17 & 0xFFFFFFFFFFFFFF8;
              v53 = (v17 & 0xFFFFFFFFFFFFFF8) + 32;
              v54 = (2 * v42) | 1;
            }
            sub_1EE08(v52, v53, v51, v54);
          }
          else
          {
            swift_bridgeObjectRelease(v17);
          }
          (*(void (**)(id (*)@<X0>(_QWORD *@<X8>), unint64_t))(v89 + 8))(v5, v90);
        }
        v59 = v97;
        v88 = a1;
        if (v97 >> 62)
        {
          if ((v97 & 0x8000000000000000) != 0)
            v86 = v97;
          else
            v86 = v97 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain_n(v97, 3);
          v60 = _CocoaArrayWrapper.endIndex.getter(v86);
          swift_bridgeObjectRelease(v59);
          v90 = v59;
          if (!v60)
          {
LABEL_63:
            v64 = v90;
            swift_bridgeObjectRelease_n(v90, 2);
            swift_bridgeObjectRelease(v64);
            v65 = v91;
            os_unfair_lock_lock(v91);
            sub_2E7B0((_QWORD *(*)(uint64_t *__return_ptr))sub_20D00, &v95);
            os_unfair_lock_unlock(v65);
            v66 = v95;
            v95 = 0;
            v67 = objc_msgSend(v66, "save:", &v95);

            v68 = v95;
            if (v67)
              return;
            v69 = v68;
            p_attr = (char **)_convertNSErrorToError(_:)(v68);

            swift_willThrow();
            if (qword_3E6A0 == -1)
            {
LABEL_65:
              v70 = type metadata accessor for Logger(0);
              sub_AD78(v70, (uint64_t)qword_3FA80);
              v71 = v88;
              swift_unknownObjectRetain(v88);
              swift_errorRetain(p_attr);
              swift_unknownObjectRetain(v71);
              v72 = swift_errorRetain(p_attr);
              v73 = Logger.logObject.getter(v72);
              v74 = static os_log_type_t.error.getter();
              if (os_log_type_enabled(v73, v74))
              {
                v75 = swift_slowAlloc(22, -1);
                v76 = swift_slowAlloc(64, -1);
                v97 = v76;
                *(_DWORD *)v75 = 136315394;
                v77 = objc_msgSend(v71, "eventName");
                v79 = static String._unconditionallyBridgeFromObjectiveC(_:)(v77, v78);
                v81 = v80;

                v95 = (id)sub_282C4(v79, v81, (uint64_t *)&v97);
                UnsafeMutableRawBufferPointer.copyMemory(from:)(&v95, &v96, v75 + 4, v75 + 12);
                swift_unknownObjectRelease_n(v71, 2);
                swift_bridgeObjectRelease(v81);
                *(_WORD *)(v75 + 12) = 2080;
                swift_getErrorValue(p_attr, v94, v93);
                v82 = Error.localizedDescription.getter(v93[1], v93[2]);
                v84 = v83;
                v95 = (id)sub_282C4(v82, v83, (uint64_t *)&v97);
                UnsafeMutableRawBufferPointer.copyMemory(from:)(&v95, &v96, v75 + 14, v75 + 22);
                swift_bridgeObjectRelease(v84);
                swift_errorRelease(p_attr);
                swift_errorRelease(p_attr);
                _os_log_impl(&dword_0, v73, v74, "Something wrong happened while deleting properties from the local storage %s: %s", (uint8_t *)v75, 0x16u);
                swift_arrayDestroy(v76, 2, (char *)&type metadata for Any + 8);
                swift_slowDealloc(v76, -1, -1);
                swift_slowDealloc(v75, -1, -1);

                swift_errorRelease(p_attr);
              }
              else
              {
                swift_errorRelease(p_attr);
                swift_unknownObjectRelease_n(v71, 2);
                swift_errorRelease(p_attr);
                swift_errorRelease(p_attr);

              }
              return;
            }
LABEL_86:
            swift_once(&qword_3E6A0, sub_10B64);
            goto LABEL_65;
          }
        }
        else
        {
          v60 = *(_QWORD *)((char *)&dword_10 + (v97 & 0xFFFFFFFFFFFFF8));
          swift_bridgeObjectRetain_n(v97, 2);
          v90 = v59;
          if (!v60)
            goto LABEL_63;
        }
        v6 = 0;
        v61 = v59 + 32;
        p_attr = &stru_3CFF8.attr;
        v5 = sub_20D00;
        while (1)
        {
          v9 = v6 + 1;
          if (__OFADD__(v6, 1))
            break;
          a1 = &v87;
          v62 = *(id *)(v61 + 8 * v6);
          v63 = v91;
          os_unfair_lock_lock(v91);
          sub_2E7B0((_QWORD *(*)(uint64_t *__return_ptr))sub_20D00, &v95);
          os_unfair_lock_unlock(v63);
          v17 = (uint64_t)v95;
          objc_msgSend(v95, "deleteObject:", v62);

          ++v6;
          if (v9 == v60)
            goto LABEL_63;
        }
        __break(1u);
LABEL_70:
        if (v17 < 0)
          v85 = v17;
        else
          v85 = v17 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v17, v19);
        v21 = _CocoaArrayWrapper.endIndex.getter(v85);
        v18 = swift_bridgeObjectRelease(v17);
      }
      v22 = v9 - 1;
      if (__OFSUB__(v9, 1))
      {
        __break(1u);
      }
      else if ((v22 & 0x8000000000000000) == 0)
      {
        if (!__OFADD__(v22, 1))
        {
          if (p_attr)
          {
            if (v17 < 0)
              v24 = v17;
            else
              v24 = v17 & 0xFFFFFFFFFFFFFF8;
            swift_bridgeObjectRetain(v17, v19);
            if (_CocoaArrayWrapper.endIndex.getter(v24) < 0)
            {
              __break(1u);
LABEL_88:
              __break(1u);
LABEL_89:
              __break(1u);
            }
            swift_bridgeObjectRetain(v17, v25);
            v23 = _CocoaArrayWrapper.endIndex.getter(v24);
            swift_bridgeObjectRelease(v17);
          }
          else
          {
            v23 = *(_QWORD *)((char *)&dword_10 + (v17 & 0xFFFFFFFFFFFFF8));
            swift_bridgeObjectRetain(v17, v19);
          }
          if (v23 >= v9)
          {
            v87 = v21;
            if ((v9 & 0x8000000000000000) == 0)
            {
              if ((v17 & 0xC000000000000001) == 0)
                goto LABEL_24;
              v26 = p_attr;
              type metadata accessor for CDProperty();
              v27 = 0;
              do
              {
                v28 = v27 + 1;
                _ArrayBuffer._typeCheckSlowPath(_:)(v27);
                v27 = v28;
              }
              while (v9 != v28);
              p_attr = v26;
              if (v26)
              {
                if (v17 < 0)
                  v34 = v17;
                else
                  v34 = v17 & 0xFFFFFFFFFFFFFF8;
                swift_bridgeObjectRetain(v17, v29);
                v31 = _CocoaArrayWrapper.subscript.getter(0, v9, v34);
                v32 = v35;
                v37 = v36;
                v33 = v38;
                swift_bridgeObjectRelease_n(v17, 2);
                v30 = v37;
              }
              else
              {
LABEL_24:
                v30 = 0;
                v31 = v17 & 0xFFFFFFFFFFFFFF8;
                v32 = (v17 & 0xFFFFFFFFFFFFFF8) + 32;
                v33 = (2 * v9) | 1;
              }
              v18 = sub_1EE08(v31, v32, v30, v33);
              v21 = v87;
              goto LABEL_30;
            }
            goto LABEL_85;
          }
LABEL_84:
          __break(1u);
LABEL_85:
          __break(1u);
          goto LABEL_86;
        }
LABEL_82:
        __break(1u);
LABEL_83:
        __break(1u);
        goto LABEL_84;
      }
      __break(1u);
      goto LABEL_82;
    }
  }
}

uint64_t sub_21588(id *a1)
{
  uint64_t v1;

  return sub_1FF04(a1, *(_QWORD *)(v1 + 16)) & 1;
}

unint64_t sub_215A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_3EE40;
  if (!qword_3EE40)
  {
    v1 = type metadata accessor for Date(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for Date, v1);
    atomic_store(result, (unint64_t *)&qword_3EE40);
  }
  return result;
}

void sub_215EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  id v5;
  Class isa;
  NSString v7;
  id v8;
  uint64_t v9;

  v0 = type metadata accessor for Date(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (void *)objc_opt_self(NSUserDefaults);
  v5 = objc_msgSend(v4, "standardUserDefaults");
  Date.init()();
  isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v7 = String._bridgeToObjectiveC()();
  objc_msgSend(v5, "setObject:forKey:", isa, v7);

  v8 = objc_msgSend(v4, "standardUserDefaults");
  objc_msgSend(v8, "synchronize");

}

uint64_t sub_2170C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_44F0(&qword_3E6E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21754(id *a1)
{
  return sub_21588(a1) & 1;
}

char *sub_2176C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;

  if ((unint64_t)a1 >> 62)
    goto LABEL_17;
  v3 = *(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain(a1, a2);
  for (; v3; v3 = _CocoaArrayWrapper.endIndex.getter(v18))
  {
    v4 = (char *)_swiftEmptyArrayStorage;
    v5 = 4;
    while (1)
    {
      v6 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5 - 4, a1)
         : *(id *)(a1 + 8 * v5);
      v7 = v6;
      v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      v9 = objc_msgSend(v6, "propertyName");
      if (v9)
      {
        v11 = v9;
        v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);
        v14 = v13;

        if ((swift_isUniquelyReferenced_nonNull_native(v4) & 1) == 0)
          v4 = sub_239CC(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
        v16 = *((_QWORD *)v4 + 2);
        v15 = *((_QWORD *)v4 + 3);
        if (v16 >= v15 >> 1)
          v4 = sub_239CC((char *)(v15 > 1), v16 + 1, 1, v4);
        *((_QWORD *)v4 + 2) = v16 + 1;
        v17 = &v4[16 * v16];
        *((_QWORD *)v17 + 4) = v12;
        *((_QWORD *)v17 + 5) = v14;
      }
      else
      {

      }
      ++v5;
      if (v8 == v3)
        goto LABEL_22;
    }
    __break(1u);
LABEL_17:
    if (a1 < 0)
      v18 = a1;
    else
      v18 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1, a2);
  }
  v4 = (char *)_swiftEmptyArrayStorage;
LABEL_22:
  swift_bridgeObjectRelease(a1);
  return v4;
}

uint64_t sub_21900(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v10;
  os_unfair_lock_s *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v22;

  v10 = (_QWORD *)swift_allocObject(&unk_39C60, 56, 7);
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = a5;
  v10[5] = a2;
  v10[6] = a1;
  v11 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  swift_retain(a4);
  swift_bridgeObjectRetain(a5, v12);
  swift_unknownObjectRetain(a2);
  swift_retain(a1);
  os_unfair_lock_lock(v11);
  sub_2E7B0((_QWORD *(*)(uint64_t *__return_ptr))sub_20D00, &v22);
  os_unfair_lock_unlock(v11);
  v13 = v22;
  v14 = (_QWORD *)swift_allocObject(&unk_39C88, 40, 7);
  v14[2] = a1;
  v14[3] = sub_24010;
  v14[4] = v10;
  swift_retain(a1);
  swift_retain(v10);
  v15 = objc_msgSend(a2, "eventName");
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15, v16);
  v19 = v18;

  swift_unknownObjectRetain(a2);
  v20 = v13;
  swift_retain(v14);
  sub_E9B4(v17, v19, (uint64_t)v20, (uint64_t)v20, a2, (void (*)(id, _QWORD))sub_24050);
  swift_release(v10);
  swift_bridgeObjectRelease(v19);

  swift_unknownObjectRelease(a2);
  return swift_release_n(v14, 2);
}

void sub_21A98(uint64_t a1, char a2, void (*a3)(uint64_t, uint64_t), uint64_t a4, uint64_t a5, void *a6, uint64_t a7)
{
  os_unfair_lock_s *v12;
  id v14;
  void *v15;

  if ((a2 & 1) != 0)
  {
    swift_errorRetain(a1);
    a3(a1, 1);
    sub_1C4E0(a1, 1);
  }
  else
  {
    v12 = (os_unfair_lock_s *)(*(_QWORD *)(a7 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
    os_unfair_lock_lock(v12);
    sub_2E7B0((_QWORD *(*)(uint64_t *__return_ptr))sub_20D00, &v15);
    os_unfair_lock_unlock(v12);
    v14 = v15;
    swift_retain(a7);
    swift_retain(a4);
    sub_C818(a5, a6, v14, a7, (uint64_t)a3, a4);

  }
}

uint64_t sub_21B98(uint64_t a1, char a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  _BYTE v20[8];
  uint64_t v21;

  if ((a2 & 1) != 0)
  {
    swift_errorRetain(a1);
    if (qword_3E6A0 != -1)
      swift_once(&qword_3E6A0, sub_10B64);
    v9 = type metadata accessor for Logger(0);
    sub_AD78(v9, (uint64_t)qword_3FA80);
    swift_errorRetain(a1);
    v10 = swift_errorRetain(a1);
    v11 = Logger.logObject.getter(v10);
    v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc(12, -1);
      v14 = swift_slowAlloc(32, -1);
      v21 = v14;
      *(_DWORD *)v13 = 136315138;
      swift_getErrorValue(a1, v20, v19);
      v15 = Error.localizedDescription.getter(v19[1], v19[2]);
      v17 = v16;
      v18 = sub_282C4(v15, v16, &v21);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, v19, v13 + 4, v13 + 12);
      swift_bridgeObjectRelease(v17);
      sub_1C4E0(a1, 1);
      sub_1C4E0(a1, 1);
      _os_log_impl(&dword_0, v11, v12, "Error while inserting property objects to Core Data: %s", v13, 0xCu);
      swift_arrayDestroy(v14, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v14, -1, -1);
      swift_slowDealloc(v13, -1, -1);
    }
    else
    {
      sub_1C4E0(a1, 1);
      sub_1C4E0(a1, 1);
    }

    swift_errorRetain(a1);
    a4(a1, 1);
    sub_1C4E0(a1, 1);
    return sub_1C4E0(a1, 1);
  }
  else
  {
    v5 = sub_44F0(&qword_3EE50);
    v6 = sub_24060();
    Subject<>.send()(v5, v6);
    return ((uint64_t (*)(_QWORD, _QWORD))a4)(0, 0);
  }
}

uint64_t sub_21DE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_21E10(a1, a2, a3, a4, a5, (_QWORD *(*)(uint64_t *__return_ptr))sub_20D00, (void (*)(id, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, void *, uint64_t, uint64_t))sub_9444);
}

uint64_t sub_21DFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_21E10(a1, a2, a3, a4, a5, (_QWORD *(*)(uint64_t *__return_ptr))sub_20D00, (void (*)(id, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, void *, uint64_t, uint64_t))sub_83FC);
}

uint64_t sub_21E10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *(*a6)(uint64_t *__return_ptr), void (*a7)(id, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, void *, uint64_t, uint64_t))
{
  os_unfair_lock_s *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString v18;
  Class isa;
  id v20;
  void *v22;

  v13 = (os_unfair_lock_s *)(*(_QWORD *)(a3 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v13);
  sub_2E7B0(a6, &v22);
  os_unfair_lock_unlock(v13);
  v14 = v22;
  v15 = sub_44F0(&qword_3E8C0);
  v16 = swift_allocObject(v15, 96, 7);
  *(_OWORD *)(v16 + 16) = xmmword_31630;
  *(_QWORD *)(v16 + 32) = 7955819;
  *(_QWORD *)(v16 + 40) = 0xE300000000000000;
  *(_QWORD *)(v16 + 88) = &type metadata for String;
  *(_QWORD *)(v16 + 56) = &type metadata for String;
  *(_QWORD *)(v16 + 64) = a1;
  *(_QWORD *)(v16 + 72) = a2;
  swift_retain_n(a5, 2);
  swift_bridgeObjectRetain(a2, v17);
  v18 = String._bridgeToObjectiveC()();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v16);
  v20 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v18, isa);

  a7(v20, 0, 0, 0, 0, 1, v14, a4, a5);
  return swift_release_n(a5, 2);
}

uint64_t sub_21FA8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t), uint64_t a8)
{
  os_unfair_lock_s *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSString v20;
  Class isa;
  id v22;
  void *v24;

  v15 = (os_unfair_lock_s *)(*(_QWORD *)(a6 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v15);
  sub_2E7B0((_QWORD *(*)(uint64_t *__return_ptr))sub_20D00, &v24);
  os_unfair_lock_unlock(v15);
  v16 = v24;
  v17 = sub_44F0(&qword_3E8C0);
  v18 = swift_allocObject(v17, 96, 7);
  *(_OWORD *)(v18 + 16) = xmmword_31630;
  *(_QWORD *)(v18 + 32) = 7955819;
  *(_QWORD *)(v18 + 40) = 0xE300000000000000;
  *(_QWORD *)(v18 + 88) = &type metadata for String;
  *(_QWORD *)(v18 + 56) = &type metadata for String;
  *(_QWORD *)(v18 + 64) = a1;
  *(_QWORD *)(v18 + 72) = a2;
  swift_retain_n(a8, 2);
  swift_bridgeObjectRetain(a2, v19);
  v20 = String._bridgeToObjectiveC()();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v18);
  v22 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v20, isa);

  sub_8428(v22, 0, 0, a3, a4, a5, (uint64_t)v16, a7, a8);
  return swift_release_n(a8, 2);
}

void sub_22150(unint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, void (*a6)(char *, _QWORD), uint64_t a7)
{
  os_unfair_lock_s *v13;
  id v14;
  void *v15;

  v13 = (os_unfair_lock_s *)(*(_QWORD *)(a5 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v13);
  sub_2E7B0((_QWORD *(*)(uint64_t *__return_ptr))sub_20D00, &v15);
  os_unfair_lock_unlock(v13);
  v14 = v15;
  _s19EngagementCollector10CDPropertyC21fetchCollectionValues22propertyConfigurations8assetIDs15sortByCreatedAt5limit7context10completionySayAA21PropertyConfiguration_pG_ShySSGSgSbSiSo22NSManagedObjectContextCys6ResultOySayAaK_p_AA0R5ValueOtGs5Error_pGctFZ_0(a1, a2, a3, a4, (uint64_t)v15, a6, a7);

}

uint64_t sub_22204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v6 = sub_44F0(&qword_3EE48);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  __chkstk_darwin(v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v9 = *(unsigned __int8 *)(v7 + 80);
  v10 = (v9 + 32) & ~v9;
  v11 = swift_allocObject(&unk_39C38, v10 + v8, v9 | 7);
  *(_QWORD *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = a2;
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  swift_bridgeObjectRetain(a3, v12);
  swift_retain();
  sub_2BA88((uint64_t)sub_225BC, v11);
  return swift_release(v11);
}

uint64_t sub_222F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  os_unfair_lock_s *lock;
  _QWORD *v26;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v5 = _swiftEmptyDictionarySingleton;
LABEL_18:
    v26 = v5;
    v22 = sub_44F0(&qword_3EE48);
    return CheckedContinuation.resume(returning:)(&v26, v22);
  }
  lock = (os_unfair_lock_s *)(*(_QWORD *)(a2 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  v24 = swift_bridgeObjectRetain(a1, a2);
  v4 = (uint64_t *)(v24 + 40);
  v5 = _swiftEmptyDictionarySingleton;
  while (1)
  {
    v7 = *(v4 - 1);
    v6 = *v4;
    swift_bridgeObjectRetain(*v4, v3);
    os_unfair_lock_lock(lock);
    sub_2E7B0((_QWORD *(*)(uint64_t *__return_ptr))sub_20D00, &v26);
    os_unfair_lock_unlock(lock);
    v8 = v26;
    v9 = sub_D3A4(v7, v6);

    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v5);
    v26 = v5;
    v12 = sub_17024(v7, v6);
    v13 = v5[2];
    v14 = (v11 & 1) == 0;
    v15 = v13 + v14;
    if (__OFADD__(v13, v14))
      break;
    v16 = v11;
    if (v5[3] >= v15)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v5 = v26;
        if ((v11 & 1) != 0)
          goto LABEL_3;
      }
      else
      {
        sub_19010();
        v5 = v26;
        if ((v16 & 1) != 0)
          goto LABEL_3;
      }
    }
    else
    {
      sub_18048(v15, isUniquelyReferenced_nonNull_native);
      v17 = sub_17024(v7, v6);
      if ((v16 & 1) != (v11 & 1))
        goto LABEL_21;
      v12 = v17;
      v5 = v26;
      if ((v16 & 1) != 0)
      {
LABEL_3:
        *(_QWORD *)(v5[7] + 8 * v12) = v9;
        goto LABEL_4;
      }
    }
    v5[(v12 >> 6) + 8] |= 1 << v12;
    v18 = (uint64_t *)(v5[6] + 16 * v12);
    *v18 = v7;
    v18[1] = v6;
    *(_QWORD *)(v5[7] + 8 * v12) = v9;
    v19 = v5[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_20;
    v5[2] = v21;
    swift_bridgeObjectRetain(v6, v11);
LABEL_4:
    v4 += 2;
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(0x8000000000000000);
    if (!--v2)
    {
      swift_bridgeObjectRelease(v24);
      goto LABEL_18;
    }
  }
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_2253C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_44F0(&qword_3EE48);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_225BC()
{
  uint64_t v0;

  sub_44F0(&qword_3EE48);
  return sub_222F8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_225F0(uint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(uint64_t, uint64_t *, uint64_t), _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  os_unfair_lock_s *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v26;
  _BOOL8 v27;
  uint64_t v28;
  char v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  id v40;
  uint64_t v41;
  uint64_t result;
  void *v43;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  _QWORD *v53;

  v11 = (os_unfair_lock_s *)(*(_QWORD *)(v7 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v11);
  sub_2E7B0((_QWORD *(*)(uint64_t *__return_ptr))sub_20D00, &v53);
  os_unfair_lock_unlock(v11);
  v43 = v53;
  if (a3 >> 62)
    goto LABEL_27;
  v13 = *(_QWORD *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain(a3, v12);
  v48 = (uint64_t)a5;
  v49 = a7;
  if (!v13)
  {
LABEL_31:
    a5 = _swiftEmptyDictionarySingleton;
LABEL_32:
    swift_bridgeObjectRelease(a3);
    v39 = sub_2176C(a3, v38);
    v40 = v43;
    swift_bridgeObjectRetain(a5, v41);
    swift_retain();
    swift_retain();
    sub_B294(a1, a2, (uint64_t)v39, (uint64_t)v40, v40, (uint64_t)a5, a4, v48, a6, v49);
    swift_bridgeObjectRelease(v39);

    swift_bridgeObjectRelease_n(a5, 2);
    swift_release(v48);
    return swift_release(v49);
  }
LABEL_3:
  if (v13 >= 1)
  {
    v14 = 0;
    v15 = a3 & 0xC000000000000001;
    a5 = _swiftEmptyDictionarySingleton;
    v51 = v13;
    v52 = a3;
    v50 = a3 & 0xC000000000000001;
    while (1)
    {
      if (v15)
        v16 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v14, a3);
      else
        v16 = *(id *)(a3 + 8 * v14 + 32);
      v17 = v16;
      v18 = objc_msgSend(v16, "propertyName");
      if (v18)
      {
        v20 = v18;
        a7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18, v19);
        v22 = v21;

        v23 = sub_E7CC();
        if (v23)
        {
          v24 = v23;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(a5);
          v53 = a5;
          a3 = sub_17024(a7, v22);
          v26 = a5[2];
          v27 = (v12 & 1) == 0;
          v28 = v26 + v27;
          if (__OFADD__(v26, v27))
          {
            __break(1u);
LABEL_26:
            __break(1u);
LABEL_27:
            if ((a3 & 0x8000000000000000) != 0)
              v37 = a3;
            else
              v37 = a3 & 0xFFFFFFFFFFFFFF8;
            swift_bridgeObjectRetain(a3, v12);
            v13 = _CocoaArrayWrapper.endIndex.getter(v37);
            v48 = (uint64_t)a5;
            v49 = a7;
            if (!v13)
              goto LABEL_31;
            goto LABEL_3;
          }
          v29 = v12;
          if (a5[3] >= v28)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) != 0)
            {
              a5 = v53;
              if ((v12 & 1) == 0)
                goto LABEL_22;
            }
            else
            {
              sub_18954();
              a5 = v53;
              if ((v29 & 1) == 0)
                goto LABEL_22;
            }
          }
          else
          {
            sub_17460(v28, isUniquelyReferenced_nonNull_native);
            v30 = sub_17024(a7, v22);
            if ((v29 & 1) != (v12 & 1))
              goto LABEL_34;
            a3 = v30;
            a5 = v53;
            if ((v29 & 1) == 0)
            {
LABEL_22:
              a5[(a3 >> 6) + 8] |= 1 << a3;
              v33 = (uint64_t *)(a5[6] + 16 * a3);
              *v33 = a7;
              v33[1] = v22;
              *(_QWORD *)(a5[7] + 8 * a3) = v24;
              v34 = a5[2];
              v35 = __OFADD__(v34, 1);
              v36 = v34 + 1;
              if (v35)
                goto LABEL_26;
              a5[2] = v36;
              swift_bridgeObjectRetain(v22, v12);
              goto LABEL_24;
            }
          }
          v31 = a5[7];
          v32 = *(_QWORD *)(v31 + 8 * a3);
          *(_QWORD *)(v31 + 8 * a3) = v24;
          swift_unknownObjectRelease(v32);
LABEL_24:

          swift_bridgeObjectRelease(v22);
          swift_bridgeObjectRelease(0x8000000000000000);
          v13 = v51;
          a3 = v52;
          v15 = v50;
          goto LABEL_7;
        }
        swift_bridgeObjectRelease(v22);
      }

LABEL_7:
      if (v13 == ++v14)
        goto LABEL_32;
    }
  }
  __break(1u);
LABEL_34:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_2294C(uint64_t a1, char a2, void *a3, uint64_t a4, void (*a5)(uint64_t, uint64_t *, uint64_t), uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  id v39;
  void *v40;
  char *v41;
  uint64_t v42;
  void (*v43)(char *, char *, uint64_t);
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  id v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  NSObject *v62;
  os_log_type_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  os_log_type_t v84;
  uint64_t v85;
  uint64_t *v86;
  unint64_t v87;
  uint64_t v88;
  _BYTE *v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  _BYTE *v94;
  _OWORD *v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  void (*v104)(uint64_t, uint64_t);
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  NSObject *v110;
  os_log_type_t v111;
  uint8_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  uint64_t v118;
  char v119;
  uint64_t v120;
  uint64_t v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  NSObject *v126;
  os_log_type_t v127;
  BOOL v128;
  uint8_t *v129;
  uint64_t v130;
  uint64_t result;
  uint64_t v132;
  _OWORD *v133;
  void *v134;
  uint64_t v135;
  uint64_t (*v136)(uint64_t);
  char *v137;
  void (*v138)(uint64_t, uint64_t *, uint64_t);
  uint64_t v139;
  char *v140;
  char *v141;
  char *v142;
  uint64_t v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  __int128 v147;
  uint64_t v148;
  uint64_t v149;
  unint64_t v150;
  id v151;
  unint64_t v152;
  id v153;
  _QWORD v154[3];
  char v155[8];
  uint64_t v156;
  _QWORD v157[4];
  char v158;
  uint64_t v159;
  _BYTE v160[40];

  v143 = a8;
  v139 = a6;
  v138 = a5;
  v149 = a4;
  v151 = a3;
  v152 = a1;
  v10 = sub_44F0(&qword_3EAD0);
  __chkstk_darwin(v10);
  v12 = (char *)&v133 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v146 = type metadata accessor for Date(0);
  v145 = *(_QWORD *)(v146 - 8);
  v13 = __chkstk_darwin(v146);
  v142 = (char *)&v133 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v13);
  v141 = (char *)&v133 - v16;
  __chkstk_darwin(v15);
  v140 = (char *)&v133 - v18;
  if ((a2 & 1) == 0)
  {
    v19 = v152 & 0xFFFFFFFFFFFFFF8;
    if (v152 >> 62)
    {
LABEL_64:
      if ((v152 & 0x8000000000000000) == 0)
        v132 = v19;
      else
        v132 = v152;
      swift_bridgeObjectRetain(v152, v17);
      v20 = _CocoaArrayWrapper.endIndex.getter(v132);
      if (v20)
        goto LABEL_4;
    }
    else
    {
      v20 = *(_QWORD *)((char *)&dword_10 + (v152 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain(v152, v17);
      if (v20)
      {
LABEL_4:
        v136 = (uint64_t (*)(uint64_t))a7;
        v150 = v152 & 0xC000000000000001;
        v133 = v160;
        a7 = 4;
        *(_QWORD *)&v21 = 138412290;
        v147 = v21;
        v148 = v20;
        v137 = v12;
        while (1)
        {
          if (v150)
            v22 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a7 - 4, v152);
          else
            v22 = *(id *)(v152 + 8 * a7);
          v23 = v22;
          v24 = a7 - 3;
          if (__OFADD__(a7 - 4, 1))
          {
            __break(1u);
            goto LABEL_64;
          }
          v153 = 0;
          v25 = objc_msgSend(v151, "existingObjectWithID:error:", v22, &v153);
          v26 = v153;
          if (!v25)
          {
            v122 = v153;
            sub_DA68(v152, 0);
            v123 = _convertNSErrorToError(_:)(v26);

            swift_willThrow();
            if (qword_3E6A0 != -1)
              swift_once(&qword_3E6A0, sub_10B64);
            v124 = type metadata accessor for Logger(0);
            v125 = sub_AD78(v124, (uint64_t)qword_3FA80);
            v126 = Logger.logObject.getter(v125);
            v127 = static os_log_type_t.error.getter();
            v128 = os_log_type_enabled(v126, v127);
            a7 = (uint64_t)v136;
            if (v128)
            {
              v129 = (uint8_t *)swift_slowAlloc(2, -1);
              *(_WORD *)v129 = 0;
              _os_log_impl(&dword_0, v126, v127, "Error while querying properties from Core Data", v129, 2u);
              swift_slowDealloc(v129, -1, -1);
            }
            swift_errorRelease(v123);

            return ((uint64_t (*)(uint64_t))a7)(v121);
          }
          v27 = v25;
          v28 = type metadata accessor for CDProperty();
          v29 = (void *)swift_dynamicCastClass(v27, v28);
          v30 = v26;
          if (!v29)
          {

            goto LABEL_29;
          }
          v31 = objc_msgSend(v29, "key");
          if (v31)
          {
            v33 = v31;
            v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v31, v32);
            v12 = v35;

          }
          else
          {
            v34 = 0;
            v12 = (char *)0xE000000000000000;
          }
          v36 = v149;
          if (!*(_QWORD *)(v149 + 16) || (v37 = sub_17024(v34, (uint64_t)v12), (v38 & 1) == 0))
          {

            swift_bridgeObjectRelease(v12);
            goto LABEL_29;
          }
          v144 = *(char **)(*(_QWORD *)(v36 + 56) + 8 * v37);
          swift_unknownObjectRetain(v144);
          swift_bridgeObjectRelease(v12);
          v39 = objc_msgSend(v29, "createdAt");
          if (!v39)
          {
            v12 = v137;
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v145 + 56))(v137, 1, 1, v146);
LABEL_28:
            swift_unknownObjectRelease(v144);

            sub_23E00((uint64_t)v12);
            v20 = v148;
LABEL_29:
            if (qword_3E6A0 != -1)
              swift_once(&qword_3E6A0, sub_10B64);
            v60 = type metadata accessor for Logger(0);
            sub_AD78(v60, (uint64_t)qword_3FA80);
            v61 = v23;
            v62 = Logger.logObject.getter(v61);
            v63 = static os_log_type_t.error.getter();
            if (os_log_type_enabled(v62, v63))
            {
              v64 = swift_slowAlloc(12, -1);
              v65 = (_QWORD *)swift_slowAlloc(8, -1);
              *(_DWORD *)v64 = v147;
              *(_QWORD *)(v64 + 4) = v61;
              *v65 = v61;
              _os_log_impl(&dword_0, v62, v63, "Cast failed or bad data querying property with objectID %@", (uint8_t *)v64, 0xCu);
              v66 = sub_44F0(&qword_3ECE0);
              swift_arrayDestroy(v65, 1, v66);
              swift_slowDealloc(v65, -1, -1);
              v20 = v148;
              swift_slowDealloc(v64, -1, -1);

            }
            else
            {

            }
            goto LABEL_6;
          }
          v40 = v39;
          v41 = v141;
          static Date._unconditionallyBridgeFromObjectiveC(_:)(v39);

          v42 = v145;
          v43 = *(void (**)(char *, char *, uint64_t))(v145 + 32);
          v12 = v137;
          v44 = v41;
          v45 = v146;
          v43(v137, v44, v146);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v42 + 56))(v12, 0, 1, v45);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v12, 1, v45) == 1)
            goto LABEL_28;
          v46 = v140;
          v47 = v146;
          v43(v140, v12, v146);
          v48 = v144;
          v49 = (char *)objc_msgSend(v144, "recordType");
          (*(void (**)(char *, char *, uint64_t))(v145 + 16))(v142, v46, v47);
          if (v49 == (_BYTE *)&dword_0 + 2)
          {
            swift_unknownObjectRetain(v48);
            swift_retain();
            v67 = sub_74CC();
            v52 = (uint64_t)v142;
            v20 = v148;
            if (!v67)
            {
LABEL_38:
              if (qword_3E6A0 != -1)
                swift_once(&qword_3E6A0, sub_10B64);
              v81 = type metadata accessor for Logger(0);
              v82 = sub_AD78(v81, (uint64_t)qword_3FA80);
              v83 = Logger.logObject.getter(v82);
              v84 = static os_log_type_t.error.getter();
              if (os_log_type_enabled(v83, v84))
              {
                v85 = swift_slowAlloc(12, -1);
                v86 = (uint64_t *)swift_slowAlloc(8, -1);
                *(_DWORD *)v85 = v147;
                v87 = sub_AD90();
                v88 = swift_allocError(&type metadata for PropertyError, v87, 0, 0);
                *v89 = 1;
                v90 = _swift_stdlib_bridgeErrorToNSError(v88);
                *(_QWORD *)(v85 + 4) = v90;
                *v86 = v90;
                _os_log_impl(&dword_0, v83, v84, "Could not fetch. %@", (uint8_t *)v85, 0xCu);
                v91 = sub_44F0(&qword_3ECE0);
                swift_arrayDestroy(v86, 1, v91);
                swift_slowDealloc(v86, -1, -1);
                swift_slowDealloc(v85, -1, -1);
              }

              v92 = sub_AD90();
              v93 = swift_allocError(&type metadata for PropertyError, v92, 0, 0);
              *v94 = 1;
              v159 = v93;
              v95 = v133;
              *v133 = 0u;
              v95[1] = 0u;
              *((_BYTE *)v95 + 32) = 0;
              v160[33] = 1;
              v96 = v139;
              v12 = v144;
              sub_23664((uint64_t)&v159, v138, v139, (uint64_t)v144, v52);
              swift_errorRelease(v93);
              goto LABEL_51;
            }
            v68 = v67;
            v69 = objc_msgSend(v29, "identifier");
            if (v69)
            {
              v71 = v69;
              v134 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(v69, v70);
              v135 = v72;

            }
            else
            {
              v134 = 0;
              v135 = 0;
            }
            v97 = objc_msgSend(v29, "assetID", v133);
            v76 = v97;
            if (v97)
            {
              v99 = static String._unconditionallyBridgeFromObjectiveC(_:)(v97, v98);
              v77 = v100;

              v76 = (void *)v99;
            }
            else
            {
              v77 = 0;
            }
            v59 = v135;
            v78 = sub_77B0(v68, v98);
            swift_bridgeObjectRelease(v68);
            v80 = 2;
            v79 = v139;
            v75 = (uint64_t)v144;
            v74 = v134;
          }
          else
          {
            v20 = v148;
            v50 = v139;
            if (v49 == (_BYTE *)&dword_0 + 1)
            {
              swift_unknownObjectRetain(v144);
              swift_retain();
              v51 = sub_74CC();
              v52 = (uint64_t)v142;
              if (!v51)
                goto LABEL_38;
              v53 = v51;
              v54 = objc_msgSend(v29, "identifier");
              if (v54)
              {
                v56 = v54;
                v57 = static String._unconditionallyBridgeFromObjectiveC(_:)(v54, v55);
                v59 = v58;

              }
              else
              {
                v57 = 0;
                v59 = 0;
              }
              v76 = (void *)sub_77B0(v53, v55);
              swift_bridgeObjectRelease(v53);
              v77 = 0;
              v78 = 0;
              v80 = 1;
              v79 = v139;
              v75 = (uint64_t)v144;
              v74 = (id)v57;
            }
            else
            {
              if (v49)
              {
                (*(void (**)(char *, uint64_t))(v145 + 8))(v142, v146);
                v153 = v49;
                result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(&type metadata for PropertyType, &v153, &type metadata for PropertyType, &type metadata for Int);
                __break(1u);
                return result;
              }
              v73 = (uint64_t)v144;
              swift_unknownObjectRetain(v144);
              swift_retain();
              v74 = objc_msgSend(v29, "count");
              v75 = v73;
              v59 = 0;
              v76 = 0;
              v77 = 0;
              v78 = 0;
              v79 = v50;
              v80 = 0;
            }
          }
          v134 = (void *)v77;
          v135 = v78;
          v156 = (uint64_t)v74;
          v157[0] = v59;
          v157[1] = v76;
          v157[2] = v77;
          v157[3] = v78;
          v158 = v80;
          v101 = (uint64_t)v76;
          v102 = (uint64_t)v74;
          v52 = (uint64_t)v142;
          v103 = v80;
          v138(v75, &v156, (uint64_t)v142);
          sub_ADD4(v102, v59, v101, (uint64_t)v134, v135, v103);
          v96 = v79;
          v12 = v144;
          v20 = v148;
LABEL_51:
          swift_unknownObjectRelease(v12);
          swift_release(v96);

          v104 = *(void (**)(uint64_t, uint64_t))(v145 + 8);
          v105 = v52;
          v106 = v146;
          v104(v105, v146);

          swift_unknownObjectRelease(v12);
          v104((uint64_t)v140, v106);
LABEL_6:
          ++a7;
          if (v24 == v20)
          {
            v130 = sub_DA68(v152, 0);
            return v136(v130);
          }
        }
      }
    }
    v118 = v152;
    v119 = 0;
    goto LABEL_69;
  }
  swift_errorRetain(v152);
  if (qword_3E6A0 != -1)
    swift_once(&qword_3E6A0, sub_10B64);
  v107 = type metadata accessor for Logger(0);
  sub_AD78(v107, (uint64_t)qword_3FA80);
  v108 = v152;
  swift_errorRetain(v152);
  v109 = swift_errorRetain(v108);
  v110 = Logger.logObject.getter(v109);
  v111 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v110, v111))
  {
    v112 = (uint8_t *)swift_slowAlloc(12, -1);
    v113 = swift_slowAlloc(32, -1);
    v159 = v113;
    *(_DWORD *)v112 = 136315138;
    v114 = v152;
    swift_getErrorValue(v152, v155, v154);
    v115 = Error.localizedDescription.getter(v154[1], v154[2]);
    v117 = v116;
    v156 = sub_282C4(v115, v116, &v159);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v156, v157, v112 + 4, v112 + 12);
    swift_bridgeObjectRelease(v117);
    sub_DA68(v114, 1);
    sub_DA68(v114, 1);
    _os_log_impl(&dword_0, v110, v111, "Error while querying properties from Core Data: %s", v112, 0xCu);
    swift_arrayDestroy(v113, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v113, -1, -1);
    swift_slowDealloc(v112, -1, -1);

    v118 = v114;
    v119 = 1;
LABEL_69:
    v121 = sub_DA68(v118, v119);
    return ((uint64_t (*)(uint64_t))a7)(v121);
  }
  v120 = v152;
  sub_DA68(v152, 1);
  sub_DA68(v120, 1);
  swift_errorRelease(v120);

  return ((uint64_t (*)(_QWORD))a7)(v121);
}

void sub_23664(uint64_t a1, void (*a2)(uint64_t, uint64_t *, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD v21[3];
  _BYTE v22[8];
  _QWORD v23[6];
  _QWORD v24[5];
  char v25;
  uint64_t v26[6];

  sub_23E40(a1, (uint64_t)v23);
  v9 = v23[0];
  sub_23E40(a1, (uint64_t)v24);
  if ((v25 & 1) != 0)
  {
    v10 = v24[0];
    swift_errorRetain(v9);
    if (qword_3E6A0 != -1)
      swift_once(&qword_3E6A0, sub_10B64);
    v11 = type metadata accessor for Logger(0);
    sub_AD78(v11, (uint64_t)qword_3FA80);
    swift_errorRetain(v9);
    v12 = swift_errorRetain(v9);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(12, -1);
      v16 = swift_slowAlloc(32, -1);
      v26[0] = v16;
      *(_DWORD *)v15 = 136315138;
      swift_getErrorValue(v10, v22, v21);
      v17 = Error.localizedDescription.getter(v21[1], v21[2]);
      v19 = v18;
      v20 = sub_282C4(v17, v18, v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, v21, v15 + 4, v15 + 12);
      swift_bridgeObjectRelease(v19);
      sub_23E88(a1);
      sub_23E88(a1);
      _os_log_impl(&dword_0, v13, v14, "Error while querying properties from Core Data: %s", v15, 0xCu);
      swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v16, -1, -1);
      swift_slowDealloc(v15, -1, -1);

      sub_23E88(a1);
    }
    else
    {
      sub_23E88(a1);
      sub_23E88(a1);
      swift_errorRelease(v9);

    }
  }
  else
  {
    sub_D9F8((uint64_t)v24, (uint64_t)v26);
    a2(a4, v26, a5);
  }
}

char *sub_23898(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_44F0(&qword_3EB98);
      v11 = (char *)swift_allocObject(v10, 48 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 48);
      v13 = v11 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[48 * v8 + 32])
          memmove(v13, a4 + 32, 48 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_23C1C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

char *sub_239B8(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_23AEC(a1, a2, a3, a4, &qword_3EC10, &qword_3EC08);
}

char *sub_239CC(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_44F0(&qword_3ECB8);
      v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
      v14 = v11 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32])
          memmove(v14, a4 + 32, 16 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_23D10(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

char *sub_23AD8(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_23AEC(a1, a2, a3, a4, &qword_3EC20, &qword_3EC00);
}

char *sub_23AEC(char *result, int64_t a2, char a3, char *a4, uint64_t *a5, uint64_t *a6)
{
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  size_t v15;
  char *v16;

  v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    v10 = a2;
    goto LABEL_8;
  }
  v9 = *((_QWORD *)a4 + 3);
  v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2)
    goto LABEL_8;
  if (v10 + 0x4000000000000000 >= 0)
  {
    v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v10 = a2;
LABEL_8:
    v11 = *((_QWORD *)a4 + 2);
    if (v10 <= v11)
      v12 = *((_QWORD *)a4 + 2);
    else
      v12 = v10;
    if (v12)
    {
      v13 = sub_44F0(a5);
      v14 = (char *)swift_allocObject(v13, 56 * v12 + 32, 7);
      v15 = j__malloc_size(v14);
      *((_QWORD *)v14 + 2) = v11;
      *((_QWORD *)v14 + 3) = 2 * ((uint64_t)(v15 - 32) / 56);
      v16 = v14 + 32;
      if ((v8 & 1) != 0)
      {
LABEL_13:
        if (v14 != a4 || v16 >= &a4[56 * v11 + 32])
          memmove(v16, a4 + 32, 56 * v11);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v14 = (char *)&_swiftEmptyArrayStorage;
      v16 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_23ECC(0, v11, (unint64_t)v16, (uint64_t)a4, a6);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v14;
  }
  __break(1u);
  return result;
}

uint64_t sub_23C1C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v5 = a4 + 48 * a1 + 32;
  v6 = a3 + 48 * v4;
  if (v5 >= v6 || v5 + 48 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v6;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_23D10(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_23E00(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_44F0(&qword_3EAD0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23E40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_44F0(&qword_3EB90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23E88(uint64_t a1)
{
  sub_23EC0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40), *(_BYTE *)(a1 + 41));
  return a1;
}

uint64_t sub_23EC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  if ((a7 & 1) != 0)
    return swift_errorRelease(a1);
  else
    return sub_ADD4(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_23ECC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  unint64_t v7;
  unint64_t v8;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v5 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v7 = a4 + 56 * a1 + 32;
  v8 = a3 + 56 * v5;
  if (v7 >= v8 || v7 + 56 * v5 <= a3)
  {
    sub_44F0(a5);
    swift_arrayInitWithCopy(a3);
    return v8;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_23FD4()
{
  _QWORD *v0;

  swift_release(v0[3]);
  swift_bridgeObjectRelease(v0[4]);
  swift_unknownObjectRelease(v0[5]);
  swift_release(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

void sub_24010(uint64_t a1, char a2)
{
  uint64_t v2;

  sub_21A98(a1, a2 & 1, *(void (**)(uint64_t, uint64_t))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(void **)(v2 + 40), *(_QWORD *)(v2 + 48));
}

uint64_t sub_24024()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_24050(void *a1, char a2)
{
  uint64_t v2;

  sub_26460(a1, a2 & 1, *(_QWORD *)(v2 + 16), *(void (**)(void *, uint64_t))(v2 + 24));
}

unint64_t sub_24060()
{
  unint64_t result;
  uint64_t v1;

  result = qword_3EE58;
  if (!qword_3EE58)
  {
    v1 = sub_D930(&qword_3EE50);
    result = swift_getWitnessTable(&protocol conformance descriptor for PassthroughSubject<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_3EE58);
  }
  return result;
}

uint64_t sub_240AC(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v5;
  char v6;
  char v7;
  unint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;

  v3 = v2;
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    sub_25B20(a1);
    v5 = sub_170E0(a2);
    v7 = v6;
    if ((v6 & 1) != 0)
    {
      v8 = v5;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
      v10 = *v2;
      v15 = *v3;
      *v3 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_191BC();
        v10 = v15;
      }
      sub_1BB5C(*(_QWORD *)(v10 + 56) + 8 * v8, (uint64_t)&v17);
      sub_2E420(v8, v10);
      v11 = *v3;
      *v3 = v10;
      swift_bridgeObjectRelease(v11);
    }
    else
    {
      v17 = 0;
    }
    v18 = (v7 & 1) == 0;
    return sub_25B20((uint64_t)&v17);
  }
  else
  {
    sub_1BB5C(a1, (uint64_t)&v17);
    v12 = swift_isUniquelyReferenced_nonNull_native(*v2);
    v16 = *v2;
    *v2 = 0x8000000000000000;
    sub_25B60((uint64_t)&v17, a2, v12);
    v13 = *v2;
    *v2 = v16;
    return swift_bridgeObjectRelease(v13);
  }
}

uint64_t sub_241B8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_2424C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_type);
  swift_beginAccess(v0 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_type, v5, 0, 0);
  v2 = *v1;
  swift_bridgeObjectRetain(v1[1], v3);
  return v2;
}

uint64_t sub_24308(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  _BYTE v8[24];

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_type);
  swift_beginAccess(v5, v8, 1, 0);
  v6 = v5[1];
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease(v6);
}

uint64_t sub_24364(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v8[24];

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_type);
  swift_beginAccess(v4, v8, 1, 0);
  v5 = v4[1];
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain(v2, v6);
  return swift_bridgeObjectRelease(v5);
}

void *sub_243CC(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_type, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_24480()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _BYTE v4[24];

  v1 = (_QWORD *)(v0 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_eventConfigurations);
  swift_beginAccess(v0 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_eventConfigurations, v4, 0, 0);
  return swift_bridgeObjectRetain(*v1, v2);
}

uint64_t sub_24534(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  _BYTE v6[24];

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_eventConfigurations);
  swift_beginAccess(v3, v6, 1, 0);
  v4 = *v3;
  *v3 = a1;
  return swift_bridgeObjectRelease(v4);
}

uint64_t sub_24584(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v7[24];

  v2 = *a1;
  v3 = (uint64_t *)(*a2 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_eventConfigurations);
  swift_beginAccess(v3, v7, 1, 0);
  v4 = *v3;
  *v3 = v2;
  swift_bridgeObjectRetain(v2, v5);
  return swift_bridgeObjectRelease(v4);
}

void *sub_245EC(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_eventConfigurations, a1, 33, 0);
  return &j__swift_endAccess;
}

id BaseDonor.__allocating_init(type:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return BaseDonor.init(type:)(a1, a2);
}

id BaseDonor.init(type:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  objc_class *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v27;
  _QWORD *v28;

  v3 = v2;
  v25 = a1;
  v26 = a2;
  v4 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v3[OBJC_IVAR____TtC19EngagementCollector9BaseDonor_observations] = _swiftEmptyDictionarySingleton;
  v24 = OBJC_IVAR____TtC19EngagementCollector9BaseDonor_accessQueue;
  sub_11790();
  v14 = v3;
  static DispatchQoS.background.getter();
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v7);
  v28 = _swiftEmptyArrayStorage;
  v15 = sub_1BAE0((unint64_t *)&qword_3EA30, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v16 = sub_44F0(&qword_3EE90);
  v17 = sub_24EDC(&qword_3EA40, &qword_3EE90);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v28, v16, v17, v4, v15);
  v18 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000001DLL, 0x80000000000337D0, v13, v6, v10, 0);
  v19 = v25;
  *(_QWORD *)&v3[v24] = v18;
  v20 = &v14[OBJC_IVAR____TtC19EngagementCollector9BaseDonor_type];
  v21 = v26;
  *(_QWORD *)v20 = v19;
  *((_QWORD *)v20 + 1) = v21;
  *(_QWORD *)&v14[OBJC_IVAR____TtC19EngagementCollector9BaseDonor_eventConfigurations] = _swiftEmptyArrayStorage;

  v22 = (objc_class *)type metadata accessor for BaseDonor();
  v27.receiver = v14;
  v27.super_class = v22;
  return objc_msgSendSuper2(&v27, "init");
}

uint64_t type metadata accessor for BaseDonor()
{
  return objc_opt_self(_TtC19EngagementCollector9BaseDonor);
}

void sub_248E8()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000002CLL, 0x8000000000033820, "EngagementCollector/Donor.swift", 31, 2, 26, 0);
  __break(1u);
}

uint64_t sub_249C4(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];
  uint64_t v20;
  _QWORD *v21;
  _QWORD aBlock[5];
  _QWORD *v23;

  v5 = type metadata accessor for DispatchWorkItemFlags(0);
  v20 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = *(_QWORD *)(v2 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_accessQueue);
  v12 = swift_allocObject(&unk_39CB0, 24, 7);
  swift_unknownObjectWeakInit(v12 + 16, v2);
  v13 = (_QWORD *)swift_allocObject(&unk_39CD8, 40, 7);
  v13[2] = v12;
  v13[3] = a1;
  v13[4] = a2;
  aBlock[4] = sub_24EB8;
  v23 = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_241B8;
  aBlock[3] = &unk_39CF0;
  v14 = _Block_copy(aBlock);
  swift_retain();
  swift_unknownObjectRetain(a1);
  static DispatchQoS.unspecified.getter(a2);
  v21 = _swiftEmptyArrayStorage;
  v15 = sub_1BAE0(&qword_3EB50, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v16 = sub_44F0(&qword_3EB58);
  v17 = sub_24EDC(&qword_3EB60, &qword_3EB58);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v21, v16, v17, v5, v15);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v11, v7, v14);
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_release(v23);
  return swift_release(v12);
}

uint64_t sub_24BFC()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_24C20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t Strong;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29[24];
  char v30[24];

  v5 = a1 + 16;
  swift_beginAccess(a1 + 16, v30, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  if (!Strong)
    return;
  v23 = (void *)Strong;
  v7 = (uint64_t *)(Strong + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_observations);
  swift_beginAccess(Strong + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_observations, v29, 0, 0);
  v9 = *v7;
  v24 = v9 + 64;
  v10 = 1 << *(_BYTE *)(v9 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v9 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  swift_bridgeObjectRetain(v9, v8);
  v14 = 0;
  while (1)
  {
    if (v12)
    {
      v15 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v16 = v15 | (v14 << 6);
LABEL_8:
      v17 = *(_QWORD *)(v9 + 56);
      v25 = *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v16);
      sub_1BB20(v17 + 8 * v16, (uint64_t)&v26);
      goto LABEL_27;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    if (v18 < v13)
    {
      v19 = *(_QWORD *)(v24 + 8 * v18);
      if (v19)
        goto LABEL_12;
      v20 = v14 + 2;
      ++v14;
      if (v18 + 1 < v13)
      {
        v19 = *(_QWORD *)(v24 + 8 * v20);
        if (v19)
          goto LABEL_15;
        v14 = v18 + 1;
        if (v18 + 2 < v13)
        {
          v19 = *(_QWORD *)(v24 + 8 * (v18 + 2));
          if (v19)
          {
            v18 += 2;
            goto LABEL_12;
          }
          v20 = v18 + 3;
          v14 = v18 + 2;
          if (v18 + 3 < v13)
            break;
        }
      }
    }
LABEL_26:
    v12 = 0;
    v25 = 0;
    v26 = 0;
LABEL_27:
    sub_25CE4((uint64_t)&v25, (uint64_t)&v27);
    if (!v27)
    {
      swift_release(v9);

      return;
    }
    sub_1BB5C((uint64_t)&v28, (uint64_t)&v25);
    v21 = (void *)swift_unknownObjectWeakLoadStrong(&v25);
    if (v21)
    {
      v22 = v21;
      objc_msgSend(v21, "propertyDidChange:propertyConfiguration:", a2, a3);
      swift_unknownObjectRelease(v22);
    }
    sub_25D2C((uint64_t)&v25);
  }
  v19 = *(_QWORD *)(v24 + 8 * v20);
  if (v19)
  {
LABEL_15:
    v18 = v20;
LABEL_12:
    v12 = (v19 - 1) & v19;
    v16 = __clz(__rbit64(v19)) + (v18 << 6);
    v14 = v18;
    goto LABEL_8;
  }
  while (1)
  {
    v18 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v18 >= v13)
    {
      v14 = v13 - 1;
      goto LABEL_26;
    }
    v19 = *(_QWORD *)(v24 + 8 * v18);
    ++v20;
    if (v19)
      goto LABEL_12;
  }
LABEL_33:
  __break(1u);
}

uint64_t sub_24E84()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 40, 7);
}

void sub_24EB8()
{
  uint64_t *v0;

  sub_24C20(v0[2], v0[3], v0[4]);
}

uint64_t sub_24EC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_24ED4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_24EDC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_D930(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

void BaseDonor.init()()
{
  _swift_stdlib_reportUnimplementedInitializer("EngagementCollector.BaseDonor", 29, "init()", 6, 0);
  __break(1u);
}

id BaseDonor.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BaseDonor();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t BaseDonor.add(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[2];
  uint64_t v20;
  _QWORD *v21;
  _QWORD aBlock[5];
  _QWORD *v23;

  v3 = type metadata accessor for DispatchWorkItemFlags(0);
  v20 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = *(_QWORD *)(v1 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_accessQueue);
  v10 = swift_allocObject(&unk_39CB0, 24, 7);
  swift_unknownObjectWeakInit(v10 + 16, v1);
  v11 = (_QWORD *)swift_allocObject(&unk_39D28, 40, 7);
  v11[2] = v10;
  v11[3] = a1;
  v11[4] = a1;
  aBlock[4] = sub_2535C;
  v23 = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_241B8;
  aBlock[3] = &unk_39D40;
  v12 = _Block_copy(aBlock);
  swift_retain();
  v13 = swift_unknownObjectRetain(a1);
  static DispatchQoS.unspecified.getter(v13);
  v21 = _swiftEmptyArrayStorage;
  v14 = sub_1BAE0(&qword_3EB50, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v15 = sub_44F0(&qword_3EB58);
  v16 = sub_24EDC(&qword_3EB60, &qword_3EB58);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v21, v15, v16, v3, v14);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v9, v5, v12);
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v17 = v23;
  swift_release(v10);
  return swift_release(v17);
}

void sub_25290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t Strong;
  char *v7;
  _BYTE v8[24];
  _BYTE v9[16];
  _BYTE v10[24];

  v5 = a1 + 16;
  swift_beginAccess(a1 + 16, v10, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  if (Strong)
  {
    v7 = (char *)Strong;
    swift_unknownObjectWeakInit(v9, a3);
    v9[8] = 0;
    swift_beginAccess(&v7[OBJC_IVAR____TtC19EngagementCollector9BaseDonor_observations], v8, 33, 0);
    sub_240AC((uint64_t)v9, a2);
    swift_endAccess(v8);

  }
}

uint64_t sub_25330()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_2535C()
{
  uint64_t *v0;

  sub_25290(v0[2], v0[3], v0[4]);
}

uint64_t BaseDonor.remove(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];
  uint64_t v20;
  _QWORD *v21;
  _QWORD aBlock[5];
  uint64_t v23;

  v3 = type metadata accessor for DispatchWorkItemFlags(0);
  v20 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = *(_QWORD *)(v1 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_accessQueue);
  v10 = swift_allocObject(&unk_39CB0, 24, 7);
  swift_unknownObjectWeakInit(v10 + 16, v1);
  v11 = swift_allocObject(&unk_39D78, 32, 7);
  *(_QWORD *)(v11 + 16) = v10;
  *(_QWORD *)(v11 + 24) = a1;
  aBlock[4] = sub_25654;
  v23 = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_241B8;
  aBlock[3] = &unk_39D90;
  v12 = _Block_copy(aBlock);
  v13 = swift_retain();
  static DispatchQoS.unspecified.getter(v13);
  v21 = _swiftEmptyArrayStorage;
  v14 = sub_1BAE0(&qword_3EB50, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v15 = sub_44F0(&qword_3EB58);
  v16 = sub_24EDC(&qword_3EB60, &qword_3EB58);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v21, v15, v16, v3, v14);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v9, v5, v12);
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v17 = v23;
  swift_release(v10);
  return swift_release(v17);
}

void sub_2559C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  _BYTE v6[24];
  _BYTE v7[16];
  _BYTE v8[24];

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v8, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    swift_beginAccess(Strong + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_observations, v6, 33, 0);
    sub_2565C(a2, (uint64_t)v7);
    sub_25B20((uint64_t)v7);
    swift_endAccess(v6);

  }
}

uint64_t sub_25630()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 32, 7);
}

void sub_25654()
{
  uint64_t v0;

  sub_2559C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

unint64_t sub_2565C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t result;
  char v6;
  char v7;
  unint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = v2;
  result = sub_170E0(a1);
  v7 = v6;
  if ((v6 & 1) != 0)
  {
    v8 = result;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
    v10 = *v2;
    v12 = *v3;
    *v3 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_191BC();
      v10 = v12;
    }
    sub_1BB5C(*(_QWORD *)(v10 + 56) + 8 * v8, a2);
    sub_2E420(v8, v10);
    v11 = *v3;
    *v3 = v10;
    result = swift_bridgeObjectRelease(v11);
  }
  else
  {
    *(_QWORD *)a2 = 0;
  }
  *(_BYTE *)(a2 + 8) = (v7 & 1) == 0;
  return result;
}

void sub_2571C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  id v7;

  swift_unknownObjectRetain(a3);
  v7 = a1;
  a4(a3);
  swift_unknownObjectRelease(a3);

}

uint64_t BaseDonor.isObserved(by:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  _BYTE v16[24];

  v3 = v1 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_observations;
  result = swift_beginAccess(v3, v16, 0, 0);
  v5 = 0;
  v6 = *(_QWORD *)v3 + 64;
  v7 = 1 << *(_BYTE *)(*(_QWORD *)v3 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(*(_QWORD *)v3 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  while (v9)
  {
    v11 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    v12 = v11 | (v5 << 6);
LABEL_5:
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v3 + 48) + 8 * v12) == a1)
      return 1;
  }
  v13 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v13 >= v10)
    return 0;
  v14 = *(_QWORD *)(v6 + 8 * v13);
  ++v5;
  if (v14)
    goto LABEL_24;
  v5 = v13 + 1;
  if (v13 + 1 >= v10)
    return 0;
  v14 = *(_QWORD *)(v6 + 8 * v5);
  if (v14)
    goto LABEL_24;
  v5 = v13 + 2;
  if (v13 + 2 >= v10)
    return 0;
  v14 = *(_QWORD *)(v6 + 8 * v5);
  if (v14)
    goto LABEL_24;
  v5 = v13 + 3;
  if (v13 + 3 >= v10)
    return 0;
  v14 = *(_QWORD *)(v6 + 8 * v5);
  if (v14)
    goto LABEL_24;
  v5 = v13 + 4;
  if (v13 + 4 >= v10)
    return 0;
  v14 = *(_QWORD *)(v6 + 8 * v5);
  if (v14)
  {
LABEL_24:
    v9 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v5 << 6);
    goto LABEL_5;
  }
  v15 = v13 + 5;
  if (v15 >= v10)
    return 0;
  v14 = *(_QWORD *)(v6 + 8 * v15);
  if (v14)
  {
    v5 = v15;
    goto LABEL_24;
  }
  while (1)
  {
    v5 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v5 >= v10)
      return 0;
    v14 = *(_QWORD *)(v6 + 8 * v5);
    ++v15;
    if (v14)
      goto LABEL_24;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_258F4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v7[24];

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_type);
  swift_beginAccess(v3, v7, 0, 0);
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain(v4, v5);
}

uint64_t sub_2594C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v7[24];

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_eventConfigurations);
  swift_beginAccess(v3, v7, 0, 0);
  v4 = *v3;
  *a2 = *v3;
  return swift_bridgeObjectRetain(v4, v5);
}

uint64_t method lookup function for BaseDonor(uint64_t a1, uint64_t a2)
{
  return swift_lookUpClassMethod(a1, a2, &nominal type descriptor for BaseDonor);
}

uint64_t dispatch thunk of BaseDonor.type.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))&stru_68.segname[(swift_isaMask & *v0) - 8])();
}

uint64_t dispatch thunk of BaseDonor.type.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))&stru_68.segname[swift_isaMask & *v0])();
}

uint64_t dispatch thunk of BaseDonor.type.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))&stru_68.segname[(swift_isaMask & *v0) + 8])();
}

uint64_t dispatch thunk of BaseDonor.eventConfigurations.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))&stru_68.segname[(swift_isaMask & *v0) + 16])();
}

uint64_t dispatch thunk of BaseDonor.eventConfigurations.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((char *)&stru_68.offset + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of BaseDonor.__allocating_init(type:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of BaseDonor.donate(with:context:donationComplete:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))&stru_B8.segname[(swift_isaMask & *v0) - 8])();
}

uint64_t getEnumTagSinglePayload for BaseDonor.Observation(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for BaseDonor.Observation(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for BaseDonor.Observation()
{
  return &type metadata for BaseDonor.Observation;
}

uint64_t sub_25B20(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_44F0(&qword_3EEC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25B60(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t result;
  unint64_t v18;
  char v19;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_170E0(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
        return sub_25CD4(a1, v16[7] + 8 * v10);
      return sub_25C6C(v10, a2, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_191BC();
      goto LABEL_7;
    }
    sub_18350(v13, a3 & 1);
    v18 = sub_170E0(a2);
    if ((v14 & 1) == (v19 & 1))
    {
      v10 = v18;
      v16 = *v4;
      if ((v14 & 1) != 0)
        return sub_25CD4(a1, v16[7] + 8 * v10);
      return sub_25C6C(v10, a2, a1, v16);
    }
  }
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for ObjectIdentifier);
  __break(1u);
  return result;
}

uint64_t sub_25C6C(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  result = sub_1BB5C(a3, a4[7] + 8 * a1);
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

uint64_t sub_25CD4(uint64_t a1, uint64_t a2)
{
  return swift_unknownObjectWeakTakeAssign(a2, a1);
}

uint64_t sub_25CE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_44F0(&qword_3EEC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D2C(uint64_t a1)
{
  swift_unknownObjectWeakDestroy(a1);
  return a1;
}

uint64_t sub_25D60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch(sub_25D78, 0, 0);
}

uint64_t sub_25D78()
{
  int8x16_t *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  int8x16_t *v6;
  int8x16_t **v7;
  int8x16_t v9;

  if (qword_3E6A0 != -1)
    swift_once(&qword_3E6A0, sub_10B64);
  v1 = type metadata accessor for Logger(0);
  v2 = sub_AD78(v1, (uint64_t)qword_3FA80);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    swift_slowDealloc(v5, -1, -1);
  }
  v9 = v0[1];

  v6 = (int8x16_t *)swift_task_alloc(32);
  v0[2].i64[0] = (uint64_t)v6;
  v6[1] = vextq_s8(v9, v9, 8uLL);
  v7 = (int8x16_t **)swift_task_alloc(*((unsigned int *)&async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)
                                      + 1));
  v0[2].i64[1] = (uint64_t)v7;
  *v7 = v0;
  v7[1] = (int8x16_t *)sub_25ED0;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)();
}

uint64_t sub_25ED0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 40);
  *(_QWORD *)(*v1 + 48) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = sub_25F54;
  }
  else
  {
    swift_task_dealloc(*(_QWORD *)(v2 + 32));
    v4 = sub_25F3C;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_25F3C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, BOOL))(v0 + 8))(0, *(_QWORD *)(v0 + 48) != 0);
}

uint64_t sub_25F54()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_task_dealloc(*(_QWORD *)(v0 + 32));
  return (*(uint64_t (**)(uint64_t, BOOL))(v0 + 8))(v1, *(_QWORD *)(v0 + 48) != 0);
}

uint64_t LocalStorage.fetchAllConfigurations(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_allocObject(&unk_39E68, 40, 7);
  v5[2] = v2;
  v5[3] = a1;
  v5[4] = a2;
  swift_retain();
  swift_retain();
  sub_2BA88((uint64_t)sub_1B2AC, (uint64_t)v5);
  return swift_release(v5);
}

uint64_t LocalStorage.fetchConfiguration(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t v10;

  v9 = (_QWORD *)swift_allocObject(&unk_39E90, 56, 7);
  v9[2] = a1;
  v9[3] = a2;
  v9[4] = v4;
  v9[5] = a3;
  v9[6] = a4;
  swift_bridgeObjectRetain(a2, v10);
  swift_retain();
  swift_retain();
  sub_2BA88((uint64_t)sub_2047C, (uint64_t)v9);
  return swift_release(v9);
}

uint64_t sub_2608C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v6 = sub_44F0(&qword_3EED8);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  __chkstk_darwin(v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v9 = *(unsigned __int8 *)(v7 + 80);
  v10 = (v9 + 32) & ~v9;
  v11 = swift_allocObject(&unk_39EB8, v10 + v8, v9 | 7);
  *(_QWORD *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = a2;
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  swift_bridgeObjectRetain(a3, v12);
  swift_retain();
  sub_2BA88((uint64_t)sub_26D08, v11);
  return swift_release(v11);
}

uint64_t sub_26180(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  unsigned __int8 v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[3];
  _BYTE v24[16];
  id v25;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a2 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v3);
  sub_2E7B0((_QWORD *(*)(uint64_t *__return_ptr))sub_20D00, &v25);
  os_unfair_lock_unlock(v3);
  v4 = v25;
  v5 = (void *)sub_FEBC(a1, v25);

  if (v5)
  {
    swift_errorRetain(v5);
    if (qword_3E6A0 != -1)
      swift_once(&qword_3E6A0, sub_10B64);
    v6 = type metadata accessor for Logger(0);
    sub_AD78(v6, (uint64_t)qword_3FA80);
    swift_errorRetain(v5);
    v7 = swift_errorRetain(v5);
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(12, -1);
      v11 = (void *)swift_slowAlloc(32, -1);
      v25 = v11;
      *(_DWORD *)v10 = 136315138;
      swift_getErrorValue(v5, v24, v23);
      v12 = Error.localizedDescription.getter(v23[1], v23[2]);
      v14 = v13;
      v22 = sub_282C4(v12, v13, (uint64_t *)&v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, v23, v10 + 4, v10 + 12);
      swift_bridgeObjectRelease(v14);
      swift_errorRelease(v5);
      swift_errorRelease(v5);
      _os_log_impl(&dword_0, v8, v9, "Error while batch-updating configurations in Core data: %s", v10, 0xCu);
      swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v11, -1, -1);
      swift_slowDealloc(v10, -1, -1);
    }
    else
    {
      swift_errorRelease(v5);
      swift_errorRelease(v5);
    }

    v25 = v5;
    v21 = sub_44F0(&qword_3EED8);
    CheckedContinuation.resume(throwing:)(&v25, v21);
    return swift_errorRelease(v5);
  }
  else
  {
    os_unfair_lock_lock(v3);
    sub_2E7B0((_QWORD *(*)(uint64_t *__return_ptr))sub_20D00, &v25);
    os_unfair_lock_unlock(v3);
    v15 = v25;
    v16 = objc_msgSend(v25, "hasChanges");

    if ((v16 & 1) != 0)
    {
      v17 = sub_44F0(&qword_3EE50);
      v18 = sub_24060();
      Subject<>.send()(v17, v18);
    }
    v19 = sub_44F0(&qword_3EED8);
    return CheckedContinuation.resume(returning:)(v19, v19);
  }
}

void sub_26460(void *a1, char a2, uint64_t a3, void (*a4)(void *, uint64_t))
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD v18[3];
  _BYTE v19[8];
  uint64_t v20;

  if ((a2 & 1) != 0)
  {
    swift_errorRetain(a1);
    if (qword_3E6A0 != -1)
      swift_once(&qword_3E6A0, sub_10B64);
    v8 = type metadata accessor for Logger(0);
    sub_AD78(v8, (uint64_t)qword_3FA80);
    swift_errorRetain(a1);
    v9 = swift_errorRetain(a1);
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(12, -1);
      v13 = swift_slowAlloc(32, -1);
      v20 = v13;
      *(_DWORD *)v12 = 136315138;
      swift_getErrorValue(a1, v19, v18);
      v14 = Error.localizedDescription.getter(v18[1], v18[2]);
      v16 = v15;
      v17 = sub_282C4(v14, v15, &v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, v18, v12 + 4, v12 + 12);
      swift_bridgeObjectRelease(v16);
      sub_1BC5C(a1, 1);
      sub_1BC5C(a1, 1);
      _os_log_impl(&dword_0, v10, v11, "Error while inserting configuration object to Core Data: %s", v12, 0xCu);
      swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v13, -1, -1);
      swift_slowDealloc(v12, -1, -1);
    }
    else
    {
      sub_1BC5C(a1, 1);
      sub_1BC5C(a1, 1);
    }

    swift_errorRetain(a1);
    a4(a1, 1);
    sub_1BC5C(a1, 1);
    sub_1BC5C(a1, 1);
  }
  else
  {
    v5 = sub_44F0(&qword_3EE50);
    v6 = sub_24060();
    Subject<>.send()(v5, v6);
    a4(0, 0);
  }
}

uint64_t sub_266B0(uint64_t a1, void (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  os_unfair_lock_s *v5;
  void *v6;
  void *v8;

  v5 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v5);
  sub_2E7B0((_QWORD *(*)(uint64_t *__return_ptr))sub_20D00, &v8);
  os_unfair_lock_unlock(v5);
  v6 = v8;
  swift_retain(a3);
  sub_F6B8((uint64_t)v6, a2);

  return swift_release(a3);
}

uint64_t sub_26740()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_2676C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[3];
  char v40[8];
  uint64_t v41;

  if ((a2 & 1) != 0)
  {
    swift_errorRetain(a1);
    if (qword_3E6A0 != -1)
      swift_once(&qword_3E6A0, sub_10B64);
    v15 = type metadata accessor for Logger(0);
    sub_AD78(v15, (uint64_t)qword_3FA80);
    swift_errorRetain(a1);
    v16 = swift_errorRetain(a1);
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc(12, -1);
      v20 = swift_slowAlloc(32, -1);
      v41 = v20;
      *(_DWORD *)v19 = 136315138;
      swift_getErrorValue(a1, v40, v39);
      v21 = Error.localizedDescription.getter(v39[1], v39[2]);
      v23 = v22;
      v38 = sub_282C4(v21, v22, &v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, v39, v19 + 4, v19 + 12);
      swift_bridgeObjectRelease(v23);
      sub_DA68(a1, 1);
      sub_DA68(a1, 1);
      _os_log_impl(&dword_0, v17, v18, "Error while fetching all configurations from Core data: %s", v19, 0xCu);
      swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v20, -1, -1);
      swift_slowDealloc(v19, -1, -1);
    }
    else
    {
      sub_DA68(a1, 1);
      sub_DA68(a1, 1);
    }

    swift_errorRetain(a1);
    a3(a1, 1);
    sub_DA68(a1, 1);
    return sub_DA68(a1, 1);
  }
  else
  {
    if ((unint64_t)a1 >> 62)
    {
      if (a1 >= 0)
        v35 = a1 & 0xFFFFFFFFFFFFFF8;
      else
        v35 = a1;
      swift_bridgeObjectRetain(a1, a2);
      v5 = _CocoaArrayWrapper.endIndex.getter(v35);
      sub_DA68(a1, 0);
    }
    else
    {
      v5 = *(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    }
    v6 = (uint64_t)&_swiftEmptyArrayStorage;
    if (v5)
    {
      v41 = (uint64_t)&_swiftEmptyArrayStorage;
      result = specialized ContiguousArray.reserveCapacity(_:)(v5);
      if (v5 < 0)
      {
        __break(1u);
        return result;
      }
      v8 = 0;
      do
      {
        if ((a1 & 0xC000000000000001) != 0)
          v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8, a1);
        else
          v9 = *(id *)(a1 + 8 * v8 + 32);
        v10 = v9;
        ++v8;
        v11 = sub_E7CC();

        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v12);
        v13 = *(_QWORD *)(v41 + 16);
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v13);
        v14 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v13, v11);
        specialized ContiguousArray._endMutation()(v14);
      }
      while (v5 != v8);
      v24 = (_QWORD *)v41;
    }
    else
    {
      v24 = &_swiftEmptyArrayStorage;
    }
    v41 = (uint64_t)&_swiftEmptyArrayStorage;
    v25 = v24[2];
    if (v25)
    {
      swift_bridgeObjectRetain(v24, a2);
      for (i = 0; i != v25; ++i)
      {
        v28 = (void *)v24[i + 4];
        if (v28)
        {
          v29 = v28;
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          v31 = *(_QWORD *)((char *)&dword_10 + (v41 & 0xFFFFFFFFFFFFFF8));
          v30 = *(_QWORD *)((char *)&dword_18 + (v41 & 0xFFFFFFFFFFFFFF8));
          if (v31 >= v30 >> 1)
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v30 > 1, v31 + 1, 1);
          v27 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v31, v29);
          specialized Array._endMutation()(v27);
        }
      }
      swift_bridgeObjectRelease(v24);
      v6 = v41;
    }
    swift_bridgeObjectRelease(v24);
    if ((unint64_t)v6 >> 62)
    {
      if (v6 < 0)
        v36 = v6;
      else
        v36 = v6 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v6, v32);
      v37 = sub_44F0(&qword_3EC28);
      v34 = _bridgeCocoaArray<A>(_:)(v36, v37);
      swift_bridgeObjectRelease_n(v6, 2);
      v6 = v34;
    }
    else
    {
      v33 = swift_bridgeObjectRetain(v6, v32);
      dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v33);
      swift_bridgeObjectRelease(v6);
      v34 = v6;
    }
    a3(v34, 0);
    return swift_bridgeObjectRelease(v6);
  }
}

uint64_t sub_26BA4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(id, uint64_t), uint64_t a5)
{
  os_unfair_lock_s *v9;
  void *v10;
  void *v12;

  v9 = (os_unfair_lock_s *)(*(_QWORD *)(a3 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v9);
  sub_2E7B0((_QWORD *(*)(uint64_t *__return_ptr))sub_20D00, &v12);
  os_unfair_lock_unlock(v9);
  v10 = v12;
  swift_retain();
  sub_F048(a1, a2, (uint64_t)v10, a4);

  return swift_release(a5);
}

uint64_t sub_26C4C()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[3]);
  swift_release(v0[4]);
  swift_release(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_26C80(uint64_t a1)
{
  uint64_t v1;

  return sub_2608C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_26C88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_44F0(&qword_3EED8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_26D08()
{
  uint64_t v0;

  sub_44F0(&qword_3EED8);
  return sub_26180(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void CollectorError.hash(into:)()
{
  Hasher._combine(_:)(0);
}

Swift::Int CollectorError.hashValue.getter()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

Swift::Int sub_26DA0(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t sub_26DDC()
{
  uint64_t v0;
  uint64_t (*FunctionReplacement)(void);
  uint64_t v3;
  uint64_t v4;
  _BYTE v5[24];

  FunctionReplacement = (uint64_t (*)(void))swift_getFunctionReplacement(&off_3EEE0, sub_26DDC);
  if (FunctionReplacement)
    return FunctionReplacement();
  swift_beginAccess(v0 + 16, v5, 0, 0);
  v3 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 24), v4);
  return v3;
}

uint64_t sub_26E4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*FunctionReplacement)(uint64_t, uint64_t);
  uint64_t v7;
  _BYTE v8[24];

  FunctionReplacement = (uint64_t (*)(uint64_t, uint64_t))swift_getFunctionReplacement(&off_3EEF0, sub_26E4C);
  if (FunctionReplacement)
    return FunctionReplacement(a1, a2);
  swift_beginAccess(v2 + 16, v8, 1, 0);
  v7 = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease(v7);
}

uint64_t (*sub_26ED4(uint64_t *a1))(uint64_t *a1, uint64_t a2)
{
  uint64_t v1;
  uint64_t v3;

  a1[2] = v1;
  *a1 = sub_26DDC();
  a1[1] = v3;
  return sub_26F08;
}

uint64_t sub_26F08(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *a1;
  v2 = a1[1];
  if ((a2 & 1) == 0)
    return sub_26E4C(*a1, v2);
  swift_bridgeObjectRetain(a1[1], a2);
  sub_26E4C(v3, v2);
  return swift_bridgeObjectRelease(v2);
}

uint64_t sub_26F68(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  unint64_t v20;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29[5];

  v3 = v1;
  if (qword_3E6A0 != -1)
    swift_once(&qword_3E6A0, sub_10B64);
  v5 = type metadata accessor for Logger(0);
  sub_AD78(v5, (uint64_t)qword_3FA80);
  v6 = swift_unknownObjectRetain_n(a1, 2);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v29[4] = v2;
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    v26 = swift_slowAlloc(32, -1);
    v29[0] = v26;
    *(_DWORD *)v9 = 136315138;
    v10 = objc_msgSend(a1, "type");
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10, v11);
    v14 = v13;

    v27 = sub_282C4(v12, v14, v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v9 + 4, v9 + 12);
    swift_unknownObjectRelease_n(a1, 2);
    swift_bridgeObjectRelease(v14);
    _os_log_impl(&dword_0, v7, v8, "Collector registering new donor: %s", v9, 0xCu);
    swift_arrayDestroy(v26, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1, -1);
    swift_slowDealloc(v9, -1, -1);

  }
  else
  {

    swift_unknownObjectRelease_n(a1, 2);
  }
  v15 = (_QWORD *)(v3 + 32);
  swift_beginAccess(v3 + 32, v29, 0, 0);
  v16 = *(_QWORD *)(v3 + 32);
  swift_unknownObjectRetain(a1);
  v18 = swift_bridgeObjectRetain(v16, v17);
  v19 = sub_28AD0(v18, a1);
  swift_bridgeObjectRelease(v16);
  swift_unknownObjectRelease(a1);
  if ((v19 & 1) != 0)
  {
    v20 = sub_1C450();
    swift_allocError(&type metadata for CollectorError, v20, 0, 0);
    return swift_willThrow();
  }
  else
  {
    swift_beginAccess(v3 + 32, &v27, 33, 0);
    v22 = swift_unknownObjectRetain(a1);
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v22);
    v24 = *(_QWORD *)((char *)&dword_10 + (*v15 & 0xFFFFFFFFFFFFFF8));
    v23 = *(_QWORD *)((char *)&dword_18 + (*v15 & 0xFFFFFFFFFFFFFF8));
    if (v24 >= v23 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v23 > 1, v24 + 1, 1);
    v25 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v24, a1);
    specialized Array._endMutation()(v25);
    return swift_endAccess(&v27);
  }
}

uint64_t sub_27234(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v20;
  uint64_t v21;
  _BYTE v23[24];

  v9 = sub_44F0(&qword_3EA60);
  __chkstk_darwin(v9);
  v11 = &v23[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  swift_beginAccess(v4 + 32, v23, 0, 0);
  v13 = *(_QWORD *)(v4 + 32);
  if (v13 < 0 || (v13 & 0x4000000000000000) != 0)
  {
    v20 = swift_bridgeObjectRetain(*(_QWORD *)(v4 + 32), v12);
    v14 = (uint64_t)sub_19870(v20, v21);
    swift_bridgeObjectRelease(v13);
  }
  else
  {
    v14 = v13 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*(_QWORD *)(v4 + 32), v12);
  }
  v15 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v11, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject(&unk_39EE0, 72, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = v14;
  v16[5] = a1;
  v16[6] = a2;
  v16[7] = a3;
  v16[8] = a4;
  swift_bridgeObjectRetain(a2, v17);
  swift_retain();
  v18 = sub_12C68((uint64_t)v11, (uint64_t)&unk_3EA68, (uint64_t)v16);
  return swift_release(v18);
}

uint64_t sub_27370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  v8[4] = a6;
  v8[2] = a4;
  return swift_task_switch(sub_27390, 0, 0);
}

uint64_t sub_27390()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  __int128 v11;
  __int128 v12;

  if (qword_3E6A0 != -1)
    swift_once(&qword_3E6A0, sub_10B64);
  v1 = type metadata accessor for Logger(0);
  v2 = sub_AD78(v1, (uint64_t)qword_3FA80);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v3, v4, "Start collecting data", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }
  v6 = *(_QWORD *)(v0 + 32);
  v11 = *(_OWORD *)(v0 + 16);
  v12 = *(_OWORD *)(v0 + 40);

  v7 = sub_44F0(&qword_3F008);
  v8 = swift_task_alloc(64);
  *(_QWORD *)(v0 + 56) = v8;
  *(_OWORD *)(v8 + 16) = v11;
  *(_QWORD *)(v8 + 32) = v6;
  *(_OWORD *)(v8 + 40) = v12;
  v9 = (_QWORD *)swift_task_alloc(async function pointer to withTaskGroup<A, B>(of:returning:isolation:body:)[1]);
  *(_QWORD *)(v0 + 64) = v9;
  *v9 = v0;
  v9[1] = sub_274FC;
  return withTaskGroup<A, B>(of:returning:isolation:body:)(v9, v7, (char *)&type metadata for () + 8, 0, 0, &unk_3F018, v8, v7);
}

uint64_t sub_274FC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 56);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 64));
  swift_task_dealloc(v1);
  return swift_task_switch(sub_27558, 0, 0);
}

uint64_t sub_27558()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_27560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7[21] = a6;
  v7[22] = a7;
  v7[19] = a4;
  v7[20] = a5;
  v7[17] = a2;
  v7[18] = a3;
  v8 = (*(_QWORD *)(*(_QWORD *)(sub_44F0(&qword_3EA60) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7[23] = swift_task_alloc(v8);
  v7[24] = swift_task_alloc(v8);
  v9 = sub_44F0(&qword_3F020);
  v7[25] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v7[26] = v10;
  v7[27] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_27600, 0, 0);
}

uint64_t sub_27600(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  BOOL v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int8 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t ObjectType;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  unint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v3 = *(_QWORD *)(v2 + 144);
  if ((unint64_t)v3 >> 62)
    goto LABEL_40;
  v4 = *(_QWORD *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain(*(_QWORD *)(v2 + 144), a2);
  while (v4)
  {
    v5 = 0;
    v60 = *(_QWORD *)(v2 + 160);
    v58 = v3 & 0xC000000000000001;
    v55 = *(_QWORD *)(v2 + 144) + 32;
    v56 = v3 & 0xFFFFFFFFFFFFFF8;
    v57 = v4;
    while (v58)
    {
      v6 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, *(_QWORD *)(v2 + 144));
      v7 = __OFADD__(v5, 1);
      v8 = v5 + 1;
      if (v7)
        goto LABEL_37;
LABEL_11:
      v9 = objc_msgSend(v6, "eventConfigurations", v55);
      v10 = type metadata accessor for BasePropertyConfiguration();
      v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);

      v59 = v8;
      if ((unint64_t)v11 >> 62)
      {
        if (v11 < 0)
          v49 = v11;
        else
          v49 = v11 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v11, a2);
        v3 = _CocoaArrayWrapper.endIndex.getter(v49);
        swift_bridgeObjectRelease(v11);
        if (!v3)
          goto LABEL_4;
      }
      else
      {
        v3 = *(_QWORD *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFF8));
        if (!v3)
          goto LABEL_4;
      }
      if (v3 < 1)
        goto LABEL_38;
      v12 = 0;
      v63 = v6;
      v64 = v11 & 0xC000000000000001;
      v61 = v3;
      v62 = v11;
      do
      {
        if (v64)
          v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v12, v11);
        else
          v14 = *(id *)(v11 + 8 * v12 + 32);
        v65 = v14;
        if (qword_3E6A0 != -1)
          swift_once(&qword_3E6A0, sub_10B64);
        v15 = type metadata accessor for Logger(0);
        sub_AD78(v15, (uint64_t)qword_3FA80);
        v16 = swift_unknownObjectRetain_n(v6, 2);
        v17 = Logger.logObject.getter(v16);
        v18 = static os_log_type_t.debug.getter();
        v67 = v12;
        if (os_log_type_enabled(v17, v18))
        {
          v19 = swift_slowAlloc(12, -1);
          v20 = swift_slowAlloc(32, -1);
          v68 = v20;
          *(_DWORD *)v19 = 136315138;
          v21 = objc_msgSend(v6, "type");
          v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21, v22);
          v25 = v24;

          *(_QWORD *)(v19 + 4) = sub_282C4(v23, v25, &v68);
          swift_bridgeObjectRelease(v25);
          swift_unknownObjectRelease_n(v6, 2);
          _os_log_impl(&dword_0, v17, v18, "Getting data from donor: %s", (uint8_t *)v19, 0xCu);
          swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v20, -1, -1);
          swift_slowDealloc(v19, -1, -1);
        }
        else
        {
          swift_unknownObjectRelease_n(v6, 2);
        }

        v26 = *(_QWORD *)(v2 + 184);
        v27 = *(_QWORD *)(v2 + 192);
        v28 = *(_QWORD *)(v2 + 152);
        v66 = *(_QWORD *)(v2 + 160);
        v29 = type metadata accessor for TaskPriority(0);
        v30 = *(_QWORD *)(v29 - 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56))(v27, 1, 1, v29);
        v31 = (_QWORD *)swift_allocObject(&unk_39FA8, 64, 7);
        v31[2] = 0;
        v32 = v31 + 2;
        v31[3] = 0;
        v31[4] = v6;
        v31[5] = v65;
        v31[6] = v28;
        v31[7] = v66;
        sub_28FE4(v27, v26);
        LODWORD(v26) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v26, 1, v29);
        swift_unknownObjectRetain(v6);
        v33 = v65;
        v35 = swift_bridgeObjectRetain(v60, v34);
        v36 = *(_QWORD *)(v2 + 184);
        if ((_DWORD)v26 == 1)
        {
          sub_2902C(*(_QWORD *)(v2 + 184));
          v37 = 0;
        }
        else
        {
          v38 = TaskPriority.rawValue.getter(v35);
          (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v36, v29);
          v37 = v38;
        }
        v39 = *v32;
        if (*v32)
        {
          v40 = v31[3];
          ObjectType = swift_getObjectType(*v32);
          swift_unknownObjectRetain(v39);
          v42 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v40);
          v44 = v43;
          swift_unknownObjectRelease(v39);
        }
        else
        {
          v42 = 0;
          v44 = 0;
        }
        v45 = **(_QWORD **)(v2 + 136);
        v46 = swift_allocObject(&unk_39FD0, 32, 7);
        *(_QWORD *)(v46 + 16) = &unk_3F038;
        *(_QWORD *)(v46 + 24) = v31;
        v47 = sub_44F0(&qword_3F008);
        v48 = v44 | v42;
        if (v44 | v42)
        {
          v48 = v2 + 72;
          *(_QWORD *)(v2 + 72) = 0;
          *(_QWORD *)(v2 + 80) = 0;
          *(_QWORD *)(v2 + 88) = v42;
          *(_QWORD *)(v2 + 96) = v44;
        }
        v11 = v62;
        v12 = v67 + 1;
        v3 = *(_QWORD *)(v2 + 192);
        *(_QWORD *)(v2 + 104) = 1;
        *(_QWORD *)(v2 + 112) = v48;
        *(_QWORD *)(v2 + 120) = v45;
        v13 = swift_task_create(v37 | 0x3100, v2 + 104, v47, &unk_3F040, v46);

        swift_release(v13);
        sub_2902C(v3);
        v6 = v63;
      }
      while (v61 != v67 + 1);
LABEL_4:
      swift_bridgeObjectRelease(v11);
      swift_unknownObjectRelease(v6);
      v5 = v59;
      if (v59 == v57)
        goto LABEL_44;
    }
    if (v5 >= *(_QWORD *)(v56 + 16))
      goto LABEL_39;
    v6 = *(void **)(v55 + 8 * v5);
    swift_unknownObjectRetain(v6);
    v7 = __OFADD__(v5, 1);
    v8 = v5 + 1;
    if (!v7)
      goto LABEL_11;
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    if (v3 < 0)
      v50 = v3;
    else
      v50 = v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v3, a2);
    v4 = _CocoaArrayWrapper.endIndex.getter(v50);
  }
LABEL_44:
  swift_bridgeObjectRelease(*(_QWORD *)(v2 + 144));
  v51 = **(_QWORD **)(v2 + 136);
  v52 = sub_44F0(&qword_3F008);
  TaskGroup.makeAsyncIterator()(v51, v52);
  *(_QWORD *)(v2 + 232) = _swiftEmptyDictionarySingleton;
  v53 = (_QWORD *)swift_task_alloc(async function pointer to TaskGroup.Iterator.next(isolation:)[1]);
  *(_QWORD *)(v2 + 224) = v53;
  *v53 = v2;
  v53[1] = sub_27BC0;
  return TaskGroup.Iterator.next(isolation:)(v2 + 16, 0, 0, *(_QWORD *)(v2 + 200));
}

uint64_t sub_27BC0()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 224));
  return swift_task_switch(sub_27C14, 0, 0);
}

unint64_t sub_27C14()
{
  uint64_t v0;
  char v1;
  void *v2;
  int v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t isUniquelyReferenced_nonNull_native;
  unint64_t result;
  char v11;
  uint64_t v12;
  _BOOL8 v13;
  BOOL v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t *);
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;

  v2 = *(void **)(v0 + 16);
  if (!v2)
  {
    v18 = *(_QWORD *)(v0 + 232);
    v19 = *(_QWORD *)(v0 + 216);
    v20 = *(_QWORD *)(v0 + 192);
    v21 = *(_QWORD *)(v0 + 184);
    v22 = *(void (**)(uint64_t *))(v0 + 168);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 208) + 8))(v19, *(_QWORD *)(v0 + 200));
    v34 = v18;
    v35 = 0;
    v22(&v34);
    swift_bridgeObjectRelease(v18);
    swift_task_dealloc(v19);
    swift_task_dealloc(v20);
    swift_task_dealloc(v21);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v3 = *(unsigned __int8 *)(v0 + 64);
  if (v3 == 255)
  {

LABEL_17:
    v30 = (_QWORD *)swift_task_alloc(async function pointer to TaskGroup.Iterator.next(isolation:)[1]);
    *(_QWORD *)(v0 + 224) = v30;
    *v30 = v0;
    v30[1] = sub_27BC0;
    return TaskGroup.Iterator.next(isolation:)(v0 + 16, 0, 0, *(_QWORD *)(v0 + 200));
  }
  v4 = *(_QWORD **)(v0 + 40);
  v32 = *(_QWORD *)(v0 + 24);
  v33 = *(_QWORD *)(v0 + 32);
  v5 = *(_QWORD *)(v0 + 48);
  v6 = *(_QWORD *)(v0 + 56);
  v7 = *(_QWORD *)(v0 + 232);
  v8 = v2;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v7);
  *(_QWORD *)(v0 + 128) = v7;
  result = sub_17110((uint64_t)v8);
  v12 = *(_QWORD *)(v7 + 16);
  v13 = (v11 & 1) == 0;
  v14 = __OFADD__(v12, v13);
  v15 = v12 + v13;
  if (v14)
  {
    __break(1u);
    goto LABEL_13;
  }
  v1 = v11;
  v31 = v4;
  v4 = (_QWORD *)(v0 + 128);
  if (*(_QWORD *)(*(_QWORD *)(v0 + 232) + 24) >= v15)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      goto LABEL_10;
LABEL_13:
    v25 = result;
    sub_19378();
    result = v25;
    v23 = (_QWORD *)*v4;
    if ((v1 & 1) != 0)
      goto LABEL_11;
    goto LABEL_14;
  }
  sub_18618(v15, isUniquelyReferenced_nonNull_native);
  result = sub_17110((uint64_t)v8);
  if ((v1 & 1) != (v16 & 1))
  {
    v17 = type metadata accessor for BasePropertyConfiguration();
    return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v17);
  }
LABEL_10:
  v23 = (_QWORD *)*v4;
  if ((v1 & 1) != 0)
  {
LABEL_11:
    v24 = v23[7] + 48 * result;
    sub_ADD4(*(_QWORD *)v24, *(_QWORD *)(v24 + 8), *(_QWORD *)(v24 + 16), *(_QWORD *)(v24 + 24), *(_QWORD *)(v24 + 32), *(_BYTE *)(v24 + 40));
    *(_QWORD *)v24 = v32;
    *(_QWORD *)(v24 + 8) = v33;
    *(_QWORD *)(v24 + 16) = v31;
    *(_QWORD *)(v24 + 24) = v5;
    *(_QWORD *)(v24 + 32) = v6;
    *(_BYTE *)(v24 + 40) = v3;
LABEL_16:
    swift_bridgeObjectRelease(0x8000000000000000);

    *(_QWORD *)(v0 + 232) = v23;
    goto LABEL_17;
  }
LABEL_14:
  v23[(result >> 6) + 8] |= 1 << result;
  *(_QWORD *)(v23[6] + 8 * result) = v8;
  v26 = v23[7] + 48 * result;
  *(_QWORD *)v26 = v32;
  *(_QWORD *)(v26 + 8) = v33;
  *(_QWORD *)(v26 + 16) = v31;
  *(_QWORD *)(v26 + 24) = v5;
  *(_QWORD *)(v26 + 32) = v6;
  *(_BYTE *)(v26 + 40) = v3;
  v27 = v23[2];
  v14 = __OFADD__(v27, 1);
  v28 = v27 + 1;
  if (!v14)
  {
    v23[2] = v28;
    v29 = v8;
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t sub_27EC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[11] = a6;
  v7[12] = a7;
  v7[9] = a4;
  v7[10] = a5;
  v7[8] = a1;
  return swift_task_switch(sub_27EE0, 0, 0);
}

uint64_t sub_27EE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 96);
  v3 = swift_task_alloc(48);
  *(_QWORD *)(v0 + 104) = v3;
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 72);
  *(_QWORD *)(v3 + 32) = v2;
  *(_QWORD *)(v3 + 40) = v1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(_QWORD *)(v0 + 112) = v4;
  v5 = sub_44F0(&qword_3E8C8);
  *v4 = v0;
  v4[1] = sub_27F98;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 16, 0, 0, 0xD000000000000016, 0x8000000000033B70, sub_29100, v3, v5);
}

uint64_t sub_27F98()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 104);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 112));
  swift_task_dealloc(v1);
  return swift_task_switch(sub_27FF4, 0, 0);
}

uint64_t sub_27FF4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  __int128 v5;
  __int128 v6;
  id v7;
  uint64_t (*v9)(void);

  v1 = *(void **)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = *(_BYTE *)(v0 + 56);
  v5 = *(_OWORD *)(v0 + 16);
  v6 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)v2 = v1;
  *(_OWORD *)(v2 + 8) = v5;
  *(_OWORD *)(v2 + 24) = v6;
  *(_QWORD *)(v2 + 40) = v3;
  *(_BYTE *)(v2 + 48) = v4;
  v9 = *(uint64_t (**)(void))(v0 + 8);
  v7 = v1;
  return v9();
}

void sub_28050(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, NSString a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD aBlock[5];
  uint64_t v17;

  v9 = sub_44F0((uint64_t *)&unk_3F050);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  __chkstk_darwin(v9);
  if (a5)
    a5 = String._bridgeToObjectiveC()();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)aBlock - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v12 = *(unsigned __int8 *)(v10 + 80);
  v13 = (v12 + 16) & ~v12;
  v14 = swift_allocObject(&unk_39FF8, v13 + v11, v12 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v14 + v13, (char *)aBlock - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  aBlock[4] = sub_29170;
  v17 = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_13030;
  aBlock[3] = &unk_3A010;
  v15 = _Block_copy(aBlock);
  swift_release(v17);
  objc_msgSend(a2, "donateWithConfiguration:context:donationCompleteBlock:", a3, a5, v15);
  _Block_release(v15);

}

uint64_t sub_281B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  _QWORD v9[5];
  char v10;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + OBJC_IVAR____TtC19EngagementCollector15BMPropertyValue_propertyValue);
    v2 = *(_QWORD *)(a1 + OBJC_IVAR____TtC19EngagementCollector15BMPropertyValue_propertyValue + 8);
    v3 = *(_QWORD *)(a1 + OBJC_IVAR____TtC19EngagementCollector15BMPropertyValue_propertyValue + 16);
    v4 = *(_QWORD *)(a1 + OBJC_IVAR____TtC19EngagementCollector15BMPropertyValue_propertyValue + 24);
    v5 = *(_QWORD *)(a1 + OBJC_IVAR____TtC19EngagementCollector15BMPropertyValue_propertyValue + 32);
    v6 = *(_BYTE *)(a1 + OBJC_IVAR____TtC19EngagementCollector15BMPropertyValue_propertyValue + 40);
    sub_E174(v1, v2, v3, v4, v5, v6);
  }
  else
  {
    v1 = 0;
    v2 = 0;
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = -1;
  }
  v9[0] = v1;
  v9[1] = v2;
  v9[2] = v3;
  v9[3] = v4;
  v9[4] = v5;
  v10 = v6;
  v7 = sub_44F0((uint64_t *)&unk_3F050);
  return CheckedContinuation.resume(returning:)(v9, v7);
}

uint64_t Collector.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return v0;
}

uint64_t Collector.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocClassInstance(v0, 40, 7);
}

uint64_t sub_282C4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13[3];
  void *ObjectType;

  v6 = sub_28394(v13, 0, 0, 1, a1, a2);
  v8 = v13[0];
  if (v6)
  {
    v9 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v13[0] = v9;
    v10 = *a3;
    if (*a3)
    {
      sub_1C6BC((uint64_t)v13, *a3);
      *a3 = v10 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    v11 = *a3;
    if (*a3)
    {
      sub_1C6BC((uint64_t)v13, *a3);
      *a3 = v11 + 32;
    }
    swift_bridgeObjectRetain(a2, v7);
  }
  sub_DB54(v13);
  return v8;
}

uint64_t sub_28394(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2854C(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t sub_2854C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_285E0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_287B8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_287B8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_285E0(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_28754(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_28754(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_44F0(&qword_3F000);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_287B8(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    v10 = sub_44F0(&qword_3F000);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

void (*sub_28904(uint64_t **a1, unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  uint64_t *v6;

  v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  v6[4] = (uint64_t)sub_28984(v6, a2, a3);
  return sub_28958;
}

void sub_28958(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t *sub_28984(uint64_t *result, unint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8)) > a2)
  {
    v4 = swift_unknownObjectRetain(*(_QWORD *)(a3 + 8 * a2 + 32));
LABEL_5:
    *v3 = v4;
    return (uint64_t *)sub_289F0;
  }
  __break(1u);
  return result;
}

uint64_t sub_289F0(_QWORD *a1)
{
  return swift_unknownObjectRelease(*a1);
}

uint64_t sub_289F8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 72) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 80) = v3;
  *v3 = v2;
  v3[1] = sub_28A60;
  return v5(v2 + 16);
}

uint64_t sub_28A60()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  __int128 v5;
  __int128 v6;
  uint64_t v8;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 72);
  v8 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 80));
  v3 = *(_QWORD *)(v1 + 56);
  v4 = *(_BYTE *)(v1 + 64);
  v5 = *(_OWORD *)(v1 + 24);
  v6 = *(_OWORD *)(v1 + 40);
  *(_QWORD *)v2 = *(_QWORD *)(v1 + 16);
  *(_OWORD *)(v2 + 8) = v5;
  *(_OWORD *)(v2 + 24) = v6;
  *(_QWORD *)(v2 + 40) = v3;
  *(_BYTE *)(v2 + 48) = v4;
  return (*(uint64_t (**)(void))(v8 + 8))();
}

uint64_t sub_28AD0(unint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  uint64_t v21;
  uint64_t v23;
  unint64_t v24;

  v2 = a1;
  if (a1 >> 62)
    goto LABEL_19;
  v3 = *(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain(a1, a2);
  while (v3)
  {
    v23 = v2;
    v24 = v2 & 0xC000000000000001;
    v4 = 4;
    while (1)
    {
      v5 = v4 - 4;
      if (!v24)
        break;
      v6 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(v4 - 4, v2);
      v7 = v4 - 3;
      if (__OFADD__(v5, 1))
        goto LABEL_18;
LABEL_9:
      v8 = v6;
      v9 = objc_msgSend(v6, "type");
      v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);
      v13 = v12;

      v14 = objc_msgSend(a2, "type");
      v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14, v15);
      v18 = v17;

      if (v11 == v16 && v13 == v18)
      {
        swift_bridgeObjectRelease(v23);
        swift_unknownObjectRelease(v8);
        swift_bridgeObjectRelease(v13);
        v20 = 1;
        v2 = v13;
        goto LABEL_24;
      }
      v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v11, v13, v16, v18, 0);
      swift_unknownObjectRelease(v8);
      swift_bridgeObjectRelease(v13);
      swift_bridgeObjectRelease(v18);
      if ((v20 & 1) != 0)
      {
        v2 = v23;
        goto LABEL_24;
      }
      ++v4;
      v2 = v23;
      if (v7 == v3)
        goto LABEL_24;
    }
    v6 = (void *)swift_unknownObjectRetain(*(_QWORD *)(v2 + 8 * v4));
    v7 = v4 - 3;
    if (!__OFADD__(v5, 1))
      goto LABEL_9;
LABEL_18:
    __break(1u);
LABEL_19:
    if (v2 < 0)
      v21 = v2;
    else
      v21 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v2, a2);
    v3 = _CocoaArrayWrapper.endIndex.getter(v21);
  }
  v20 = 0;
LABEL_24:
  swift_bridgeObjectRelease(v2);
  return v20 & 1;
}

uint64_t sub_28C94()
{
  _QWORD *v0;

  swift_unknownObjectRelease(v0[2]);
  swift_bridgeObjectRelease(v0[4]);
  swift_bridgeObjectRelease(v0[6]);
  swift_release(v0[8]);
  return swift_deallocObject(v0, 72, 7);
}

unint64_t sub_28CD4()
{
  unint64_t result;

  result = qword_3EF10;
  if (!qword_3EF10)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CollectorError, &type metadata for CollectorError);
    atomic_store(result, (unint64_t *)&qword_3EF10);
  }
  return result;
}

uint64_t sub_28D18@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 96))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_28D48(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 104);
  swift_bridgeObjectRetain(v3, a2);
  return v4(v2, v3);
}

uint64_t storeEnumTagSinglePayload for CollectorError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_28DCC + 4 * asc_31B10[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_28DEC + 4 * byte_31B15[v4]))();
}

_BYTE *sub_28DCC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_28DEC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_28DF4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_28DFC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_28E04(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_28E0C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for CollectorError()
{
  return &type metadata for CollectorError;
}

uint64_t type metadata accessor for Collector()
{
  return objc_opt_self(_TtC19EngagementCollector9Collector);
}

uint64_t method lookup function for Collector(uint64_t a1, uint64_t a2)
{
  return swift_lookUpClassMethod(a1, a2, &nominal type descriptor for Collector);
}

uint64_t dispatch thunk of Collector.name.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of Collector.name.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of Collector.name.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of Collector.register(donor:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of Collector.collect(_:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t sub_28EA0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = v2[5];
  v10 = v2[6];
  v11 = (_QWORD *)swift_task_alloc(dword_3F014);
  *(_QWORD *)(v3 + 16) = v11;
  *v11 = v3;
  v11[1] = sub_1C6C8;
  return sub_27560(a1, a2, v6, v7, v8, v9, v10);
}

uint64_t sub_28F30()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 32));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 56));
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_28F6C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;

  v4 = *(_QWORD *)(v1 + 48);
  v5 = *(_QWORD *)(v1 + 56);
  v6 = swift_task_alloc(dword_3F02C);
  v7 = *(_OWORD *)(v1 + 32);
  *(_QWORD *)(v2 + 16) = v6;
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = sub_1C6C8;
  *(_QWORD *)(v6 + 88) = v4;
  *(_QWORD *)(v6 + 96) = v5;
  *(_OWORD *)(v6 + 72) = v7;
  *(_QWORD *)(v6 + 64) = a1;
  return swift_task_switch(sub_27EE0, 0, 0);
}

uint64_t sub_28FE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_44F0(&qword_3EA60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2902C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_44F0(&qword_3EA60);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2906C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_29090(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_3F034);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1BF24;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_3F030 + dword_3F030))(a1, v4);
}

void sub_29100(uint64_t a1)
{
  uint64_t v1;

  sub_28050(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(NSString *)(v1 + 40));
}

uint64_t sub_2910C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_44F0((uint64_t *)&unk_3F050);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_29170(uint64_t a1)
{
  sub_44F0((uint64_t *)&unk_3F050);
  return sub_281B4(a1);
}

uint64_t sub_291B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_291C0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_291C8()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;
  uint64_t v4;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v1);
  sub_29250(&v4);
  v2 = v4;
  os_unfair_lock_unlock(v1);
  return v2;
}

id sub_29218@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_29274();
  *a1 = result;
  return result;
}

id sub_29250@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_29274();
  *a1 = result;
  return result;
}

id sub_29274()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  NSString v7;
  void *v8;
  id v9;

  v1 = OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_context;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_context);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_context);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
    v5 = sub_293F4();
    v6 = objc_msgSend(v5, "persistentStoreCoordinator");

    objc_msgSend(v4, "setPersistentStoreCoordinator:", v6);
    objc_msgSend(v4, "setMergePolicy:", NSErrorMergePolicy);
    objc_msgSend(v4, "setAutomaticallyMergesChangesFromParent:", 1);
    v7 = String._bridgeToObjectiveC()();
    objc_msgSend(v4, "setName:", v7);

    v8 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v9 = v2;
  return v3;
}

id sub_29398()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_model;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_model);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_model);
  }
  else
  {
    v4 = (void *)sub_2F0D8();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_293F4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_persistentContainer;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_persistentContainer);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_persistentContainer);
  }
  else
  {
    v4 = sub_2F3BC();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

void sub_29454(void *a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(a1, "container");
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, "newBackgroundContext");
    __chkstk_darwin(v3);
    NSManagedObjectContext.performAndWait<A>(_:)(sub_2FE3C);

  }
}

void sub_29534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v12;
  id v13;
  NSString v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  NSString v40;
  id v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  Class isa;
  id v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  uint64_t v53;
  NSString v54;
  NSString v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  char isUniquelyReferenced_nonNull_native;
  Class v60;
  id v61;
  id v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  Class v66;
  NSString v67;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unsigned int v81;
  uint64_t v82;
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  _QWORD v87[2];
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  unint64_t v103;
  _QWORD v104[3];
  char v105[8];
  _QWORD v106[2];
  _OWORD v107[2];
  __int128 v108;
  __int128 v109;

  v7 = v6;
  v92 = a6;
  v100 = a5;
  v97 = type metadata accessor for URL(0);
  v94 = *(_QWORD *)(v97 - 8);
  __chkstk_darwin(v97);
  v93 = (char *)v87 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_allocWithZone((Class)NSFetchRequest);
  v14 = String._bridgeToObjectiveC()();
  v15 = objc_msgSend(v13, "initWithEntityName:", v14);

  sub_D854(0, &qword_3E938, NSPredicate_ptr);
  v16 = (void *)NSPredicate.init(format:_:)(0x203D212061746164, 0xEB000000006C696ELL, &_swiftEmptyArrayStorage);
  objc_msgSend(v15, "setPredicate:", v16);

  v17 = sub_D854(0, &qword_3F270, NSManagedObject_ptr);
  v95 = v15;
  v18 = a1;
  v19 = NSManagedObjectContext.fetch<A>(_:)(v15, v17);
  if (v6)
  {
    a3 = 0;
LABEL_3:
    v21 = v97;
    v22 = v94;
    v23 = v93;
    if (qword_3E6A0 == -1)
      goto LABEL_4;
    goto LABEL_61;
  }
  v36 = v19;
  v37 = v100;
  v87[1] = a4;
  v99 = a2;
  v91 = 0;
  v88 = (unint64_t)v19 >> 62;
  if ((unint64_t)v19 >> 62)
  {
    if (v19 < 0)
      v86 = v19;
    else
      v86 = v19 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v19, v20);
    v38 = _CocoaArrayWrapper.endIndex.getter(v86);
  }
  else
  {
    v38 = *(_QWORD *)((char *)&dword_10 + (v19 & 0xFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain(v19, v20);
  }
  v21 = v99;
  v22 = v37;
  if (v38)
  {
    v90 = v18;
    v89 = 0;
    v103 = v36 & 0xC000000000000001;
    v18 = 4;
    v101 = (char *)&type metadata for Any + 8;
    v96 = v36;
    v98 = a3;
    v102 = v38;
    while (1)
    {
      v39 = v103
          ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v18 - 4, v36)
          : *(id *)(v36 + 8 * v18);
      v23 = v39;
      v7 = v18 - 3;
      if (__OFADD__(v18 - 4, 1))
        break;
      v40 = String._bridgeToObjectiveC()();
      v41 = objc_msgSend(v23, "valueForKey:", v40);

      if (v41)
      {
        _bridgeAnyObjectToAny(_:)(v107, v41);
        swift_unknownObjectRelease(v41);
      }
      else
      {
        memset(v107, 0, sizeof(v107));
      }
      sub_1BCA8((uint64_t)v107, (uint64_t)&v108, &qword_3E6E0);
      if (*((_QWORD *)&v109 + 1))
      {
        if ((swift_dynamicCast(v106, &v108, v101, &type metadata for Data, 6) & 1) != 0)
        {
          v43 = v106[0];
          v42 = v106[1];
          v44 = (void *)objc_opt_self(NSJSONSerialization);
          isa = Data._bridgeToObjectiveC()().super.isa;
          *(_QWORD *)&v108 = 0;
          v46 = objc_msgSend(v44, "JSONObjectWithData:options:error:", isa, 0, &v108);

          v47 = v108;
          if (!v46)
          {
            v85 = (id)v108;
            swift_bridgeObjectRelease_n(v96, 2);
            v7 = _convertNSErrorToError(_:)(v47);

            swift_willThrow();
            sub_DA88(v43, v42);

            a3 = 0;
            v18 = v90;
            goto LABEL_3;
          }
          v48 = (id)v108;
          _bridgeAnyObjectToAny(_:)(&v108, v46);
          swift_unknownObjectRelease(v46);
          v49 = sub_44F0(&qword_3E980);
          if ((swift_dynamicCast(v107, &v108, (char *)&type metadata for Any + 8, v49, 6) & 1) != 0)
          {
            v50 = *(_QWORD *)&v107[0];
            if (*(_QWORD *)(*(_QWORD *)&v107[0] + 16)
              && (v51 = sub_17024(0x44497465737361, 0xE700000000000000), (v52 & 1) != 0)
              && (sub_1C6BC(*(_QWORD *)(v50 + 56) + 32 * v51, (uint64_t)&v108),
                  (swift_dynamicCast(v107, &v108, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0))
            {
              v53 = *((_QWORD *)&v107[0] + 1);
              v54 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease(v53);
              v55 = String._bridgeToObjectiveC()();
              objc_msgSend(v23, "setValue:forKey:", v54, v55);

              swift_bridgeObjectRetain(v50, v56);
              v57 = sub_17024(0x44497465737361, 0xE700000000000000);
              LOBYTE(v55) = v58;
              swift_bridgeObjectRelease(v50);
              if ((v55 & 1) != 0)
              {
                isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v50);
                *(_QWORD *)&v107[0] = v50;
                if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                {
                  sub_19580();
                  v50 = *(_QWORD *)&v107[0];
                }
                swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)(v50 + 48) + 16 * v57 + 8));
                sub_DB44((_OWORD *)(*(_QWORD *)(v50 + 56) + 32 * v57), &v108);
                sub_2E5DC(v57, v50);
                swift_bridgeObjectRelease(0x8000000000000000);
              }
              else
              {
                v108 = 0u;
                v109 = 0u;
              }
              sub_DB08((uint64_t)&v108, &qword_3E6E0);
              v60 = Dictionary._bridgeToObjectiveC()().super.isa;
              swift_bridgeObjectRelease(v50);
              *(_QWORD *)&v108 = 0;
              v61 = objc_msgSend(v44, "dataWithJSONObject:options:error:", v60, 1, &v108);

              v62 = (id)v108;
              if (v61)
              {
                v63 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v61);
                v65 = v64;

                v66 = Data._bridgeToObjectiveC()().super.isa;
                v67 = String._bridgeToObjectiveC()();
                objc_msgSend(v23, "setValue:forKey:", v66, v67);
                sub_DA88(v43, v42);
                sub_DA88(v63, v65);

                if (__OFADD__(v89++, 1))
                  __break(1u);
              }
              else
              {
                v69 = v62;
                v70 = _convertNSErrorToError(_:)(v62);

                swift_willThrow();
                sub_DA88(v43, v42);
                swift_errorRelease(v70);
                v91 = 0;
              }
            }
            else
            {

              sub_DA88(v43, v42);
              swift_bridgeObjectRelease(v50);
            }
          }
          else
          {
            sub_DA88(v43, v42);

          }
          v21 = v99;
          v22 = v100;
          v36 = v96;
          a3 = v98;
        }
        else
        {

        }
      }
      else
      {

        sub_DB08((uint64_t)&v108, &qword_3E6E0);
      }
      ++v18;
      if (v7 == v102)
      {
        swift_bridgeObjectRelease(v36);
        v18 = v90;
        v71 = v89;
        goto LABEL_43;
      }
    }
    __break(1u);
LABEL_61:
    swift_once(&qword_3E6A0, sub_10B64);
LABEL_4:
    v24 = type metadata accessor for Logger(0);
    sub_AD78(v24, (uint64_t)qword_3FA80);
    (*(void (**)(void *, uint64_t, uint64_t))(v22 + 16))(v23, v92, v21);
    swift_errorRetain(v7);
    v25 = swift_errorRetain(v7);
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = swift_slowAlloc(22, -1);
      v103 = swift_slowAlloc(64, -1);
      *(_QWORD *)&v108 = v103;
      *(_DWORD *)v28 = 136446466;
      v90 = v18;
      v29 = URL.path.getter();
      v31 = v30;
      *(_QWORD *)&v107[0] = sub_282C4(v29, v30, (uint64_t *)&v108);
      v91 = a3;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v107, (char *)v107 + 8, v28 + 4, v28 + 12);
      swift_bridgeObjectRelease(v31);
      (*(void (**)(void *, uint64_t))(v22 + 8))(v23, v97);
      *(_WORD *)(v28 + 12) = 2080;
      swift_getErrorValue(v7, v105, v104);
      v32 = Error.localizedDescription.getter(v104[1], v104[2]);
      v34 = v33;
      *(_QWORD *)&v107[0] = sub_282C4(v32, v33, (uint64_t *)&v108);
      v18 = v90;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v107, (char *)v107 + 8, v28 + 14, v28 + 22);
      swift_bridgeObjectRelease(v34);
      swift_errorRelease(v7);
      swift_errorRelease(v7);
      _os_log_impl(&dword_0, v26, v27, "Error migrating %{public}s: %s", (uint8_t *)v28, 0x16u);
      v35 = v103;
      swift_arrayDestroy(v103, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v35, -1, -1);
      swift_slowDealloc(v28, -1, -1);

      swift_errorRelease(v7);
    }
    else
    {
      swift_errorRelease(v7);
      (*(void (**)(void *, uint64_t))(v22 + 8))(v23, v21);
      swift_errorRelease(v7);
      swift_errorRelease(v7);

    }
    goto LABEL_54;
  }
  swift_bridgeObjectRelease(v36);
  v71 = 0;
LABEL_43:
  if (qword_3E6A0 != -1)
    swift_once(&qword_3E6A0, sub_10B64);
  v72 = type metadata accessor for Logger(0);
  sub_AD78(v72, (uint64_t)qword_3FA80);
  v74 = swift_bridgeObjectRetain(v36, v73);
  v75 = Logger.logObject.getter(v74);
  v76 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v75, v76))
  {
    v77 = swift_slowAlloc(22, -1);
    *(_DWORD *)v77 = 134218240;
    *(_QWORD *)&v108 = v71;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v108, (char *)&v108 + 8, v77 + 4, v77 + 12);
    *(_WORD *)(v77 + 12) = 2048;
    if (v88)
    {
      if (v36 < 0)
        v80 = v36;
      else
        v80 = v36 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v36, v78);
      v79 = _CocoaArrayWrapper.endIndex.getter(v80);
      swift_bridgeObjectRelease(v36);
    }
    else
    {
      v79 = *(_QWORD *)((char *)&dword_10 + (v36 & 0xFFFFFFFFFFFFF8));
    }
    swift_bridgeObjectRelease(v36);
    *(_QWORD *)&v108 = v79;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v108, (char *)&v108 + 8, v77 + 14, v77 + 22);
    swift_bridgeObjectRelease(v36);
    _os_log_impl(&dword_0, v75, v76, "Completed migrating assetID of %ld of %ld records", (uint8_t *)v77, 0x16u);
    swift_slowDealloc(v77, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v36, 2);
  }
LABEL_54:
  if (objc_msgSend((id)v18, "hasChanges"))
  {
    *(_QWORD *)&v108 = 0;
    v81 = objc_msgSend((id)v18, "save:", &v108);
    v82 = v108;
    if (v81)
    {
      v83 = (id)v108;
    }
    else
    {
      v84 = (id)v108;
      _convertNSErrorToError(_:)(v82);

      swift_willThrow();
    }
  }

}

Swift::Int sub_2A098(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(char *, uint64_t);
  void *v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  void (*v76)(char *, uint64_t, uint64_t);
  uint64_t v77;
  id v78;
  _QWORD v79[3];
  char v80[8];
  uint64_t v81;
  uint64_t aBlock[5];
  uint64_t v83;

  v78 = a4;
  v10 = type metadata accessor for NSPersistentStore.StoreType(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for URL(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = __chkstk_darwin(v14);
  v75 = (char *)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __chkstk_darwin(v16);
  __chkstk_darwin(v18);
  v22 = (char *)&v64 - v21;
  if (!a2)
    return OS_dispatch_semaphore.signal()();
  v69 = a5;
  v70 = v11;
  v71 = v10;
  v72 = v20;
  v73 = v19;
  swift_errorRetain(a2);
  if (qword_3E6A0 != -1)
    swift_once(&qword_3E6A0, sub_10B64);
  v23 = type metadata accessor for Logger(0);
  v24 = sub_AD78(v23, (uint64_t)qword_3FA80);
  v76 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v77 = a3;
  v76(v22, a3, v14);
  swift_errorRetain(a2);
  v25 = swift_errorRetain(a2);
  v68 = v24;
  v26 = Logger.logObject.getter(v25);
  v27 = static os_log_type_t.error.getter();
  v28 = os_log_type_enabled(v26, v27);
  v74 = v15;
  if (v28)
  {
    v29 = swift_slowAlloc(22, -1);
    v65 = v14;
    v30 = a2;
    v31 = v29;
    v64 = swift_slowAlloc(64, -1);
    aBlock[0] = v64;
    *(_DWORD *)v31 = 136446466;
    v67 = a6;
    v32 = URL.path.getter();
    v34 = v33;
    v81 = sub_282C4(v32, v33, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, aBlock, v31 + 4, v31 + 12);
    swift_bridgeObjectRelease(v34);
    v66 = *(void (**)(char *, uint64_t))(v15 + 8);
    v66(v22, v65);
    *(_WORD *)(v31 + 12) = 2080;
    swift_getErrorValue(v30, v80, v79);
    v35 = Error.localizedDescription.getter(v79[1], v79[2]);
    v37 = v36;
    v81 = sub_282C4(v35, v36, aBlock);
    a6 = v67;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, aBlock, v31 + 14, v31 + 22);
    swift_bridgeObjectRelease(v37);
    swift_errorRelease(v30);
    swift_errorRelease(v30);
    _os_log_impl(&dword_0, v26, v27, "Error adding LocalStorage persistent store at %{public}s: %s", (uint8_t *)v31, 0x16u);
    v38 = v64;
    swift_arrayDestroy(v64, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v38, -1, -1);
    v39 = v31;
    a2 = v30;
    v14 = v65;
    swift_slowDealloc(v39, -1, -1);
  }
  else
  {
    v66 = *(void (**)(char *, uint64_t))(v15 + 8);
    v66(v22, v14);
    swift_errorRelease(a2);
    swift_errorRelease(a2);
  }

  v41 = objc_msgSend(v78, "persistentStoreCoordinator");
  v42 = v69;
  v43 = objc_msgSend(v69, "type");
  v45 = static String._unconditionallyBridgeFromObjectiveC(_:)(v43, v44);
  v47 = v46;

  NSPersistentStore.StoreType.init(rawValue:)(v45, v47);
  v48 = objc_msgSend(v42, "options");
  v49 = sub_D854(0, &qword_3E918, NSObject_ptr);
  v50 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v48, &type metadata for String, v49, &protocol witness table for String);

  v52 = sub_7F4C(v50, v51);
  swift_bridgeObjectRelease(v50);
  v53 = v77;
  NSPersistentStoreCoordinator.destroyPersistentStore(at:type:options:)(v77, v13, v52);
  v54 = (void (*)(uint64_t, uint64_t, uint64_t))v76;
  (*(void (**)(char *, uint64_t))(v70 + 8))(v13, v71);
  swift_bridgeObjectRelease(v52);
  v55 = v73;
  v54(v73, v53, v14);
  v56 = v74;
  v57 = *(unsigned __int8 *)(v74 + 80);
  v58 = (v57 + 16) & ~v57;
  v59 = (v72 + v58 + 7) & 0xFFFFFFFFFFFFFFF8;
  v60 = swift_allocObject(&unk_3A210, v59 + 8, v57 | 7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 32))(v60 + v58, v55, v14);
  *(_QWORD *)(v60 + v59) = a6;
  aBlock[4] = (uint64_t)sub_2FDDC;
  v83 = v60;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2AAF0;
  aBlock[3] = (uint64_t)&unk_3A228;
  v61 = _Block_copy(aBlock);
  v62 = v83;
  v63 = a6;
  swift_release(v62);
  objc_msgSend(v78, "loadPersistentStoresWithCompletionHandler:", v61);
  _Block_release(v61);

  return swift_errorRelease(a2);
}

Swift::Int sub_2A848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD v24[2];
  _QWORD v25[3];
  _BYTE v26[8];
  uint64_t v27;
  uint64_t v28;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_errorRetain(a2);
    if (qword_3E6A0 != -1)
      swift_once(&qword_3E6A0, sub_10B64);
    v11 = type metadata accessor for Logger(0);
    sub_AD78(v11, (uint64_t)qword_3FA80);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a3, v7);
    swift_errorRetain(a2);
    v12 = swift_errorRetain(a2);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = swift_slowAlloc(22, -1);
      v24[0] = swift_slowAlloc(64, -1);
      v28 = v24[0];
      *(_DWORD *)v15 = 136446466;
      v16 = URL.path.getter();
      v18 = v17;
      v27 = sub_282C4(v16, v17, &v28);
      v24[1] = a4;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v15 + 4, v15 + 12);
      swift_bridgeObjectRelease(v18);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      *(_WORD *)(v15 + 12) = 2080;
      swift_getErrorValue(a2, v26, v25);
      v19 = Error.localizedDescription.getter(v25[1], v25[2]);
      v21 = v20;
      v27 = sub_282C4(v19, v20, &v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v15 + 14, v15 + 22);
      swift_bridgeObjectRelease(v21);
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      _os_log_impl(&dword_0, v13, v14, "Still unable to load LocalStorage persistent store at %{public}s: %s", (uint8_t *)v15, 0x16u);
      v22 = v24[0];
      swift_arrayDestroy(v24[0], 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v22, -1, -1);
      swift_slowDealloc(v15, -1, -1);

      swift_errorRelease(a2);
    }
    else
    {
      swift_errorRelease(a2);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      swift_errorRelease(a2);
      swift_errorRelease(a2);

    }
  }
  return OS_dispatch_semaphore.signal()();
}

void sub_2AAF0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(id, void *);
  id v7;
  id v8;

  v6 = *(void (**)(id, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v8 = a2;
  v7 = a3;
  v6(v8, a3);
  swift_release(v5);

}

uint64_t sub_2AB64(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  id v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  void *v58;

  v2 = v1;
  v50 = a1;
  v3 = sub_44F0(&qword_3F298);
  __chkstk_darwin(v3);
  v51 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for OS_dispatch_queue.SchedulerTimeType.Stride(0);
  v53 = *(_QWORD *)(v5 - 8);
  v54 = v5;
  __chkstk_darwin(v5);
  v49 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_44F0(&qword_3F2A0);
  v8 = *(_QWORD *)(v7 - 8);
  v55 = v7;
  v56 = v8;
  __chkstk_darwin(v7);
  v52 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v47 = *(_QWORD *)(v10 - 8);
  v48 = v10;
  __chkstk_darwin(v10);
  v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v16);
  v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock;
  v20 = sub_44F0(&qword_3F2A8);
  v21 = swift_allocObject(v20, 20, 7);
  *(_DWORD *)(v21 + 16) = 0;
  *(_QWORD *)(v2 + v19) = v21;
  v22 = OBJC_IVAR____TtC19EngagementCollector12LocalStorage_saveSignalPublisher;
  v23 = sub_44F0(&qword_3EE50);
  swift_allocObject(v23, *(unsigned int *)(v23 + 48), *(unsigned __int16 *)(v23 + 52));
  *(_QWORD *)(v2 + v22) = PassthroughSubject.init()();
  *(_QWORD *)(v2 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_saveSubscription) = 0;
  v45 = OBJC_IVAR____TtC19EngagementCollector12LocalStorage_saveQueue;
  v46 = sub_D854(0, (unint64_t *)&qword_3EE80, OS_dispatch_queue_ptr);
  static DispatchQoS.unspecified.getter();
  v58 = &_swiftEmptyArrayStorage;
  v24 = sub_30084();
  v25 = sub_44F0(&qword_3EE90);
  v26 = sub_D974(&qword_3EA40, &qword_3EE90, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v58, v25, v26, v13, v24);
  (*(void (**)(char *, _QWORD, uint64_t))(v47 + 104))(v12, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v48);
  v27 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000016, 0x8000000000033E90, v18, v15, v12, 0);
  *(_QWORD *)(v2 + v45) = v27;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_context) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_model) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_persistentContainer) = 0;
  v28 = v2 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_persistentDirectoryURL;
  v29 = type metadata accessor for URL(0);
  v48 = *(_QWORD *)(v29 - 8);
  v30 = v50;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 16))(v28, v50, v29);
  sub_2B7E4();
  v58 = *(void **)(v2 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_saveSignalPublisher);
  swift_retain(v58);
  v31 = v49;
  static OS_dispatch_queue.SchedulerTimeType.Stride.milliseconds(_:)(500);
  v57 = *(id *)(v2 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_saveQueue);
  v32 = v57;
  v33 = type metadata accessor for OS_dispatch_queue.SchedulerOptions(0);
  v34 = (uint64_t)v51;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v51, 1, 1, v33);
  v35 = sub_D974(&qword_3F2B0, &qword_3EE50, (uint64_t)&protocol conformance descriptor for PassthroughSubject<A, B>);
  v36 = sub_300CC();
  v37 = v32;
  v38 = v52;
  Publisher.debounce<A>(for:scheduler:options:)(v31, &v57, v34, v23, v46, v35, v36);
  sub_DB08(v34, &qword_3F298);

  (*(void (**)(char *, uint64_t))(v53 + 8))(v31, v54);
  swift_release(v58);
  v39 = swift_allocObject(&unk_3A288, 24, 7);
  swift_weakInit(v39 + 16, v2);
  v40 = sub_D974(&qword_3F2C0, &qword_3F2A0, (uint64_t)&protocol conformance descriptor for Publishers.Debounce<A, B>);
  v41 = v55;
  v42 = Publisher<>.sink(receiveValue:)(sub_30124, v39, v55, v40);
  swift_release(v39);
  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v30, v29);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v38, v41);
  v43 = *(_QWORD *)(v2 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_saveSubscription);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_saveSubscription) = v42;
  swift_release(v43);
  return v2;
}

void sub_2B048(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t Strong;
  uint64_t v4;
  os_unfair_lock_s *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  _QWORD aBlock[5];
  uint64_t v18;
  char v19[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v19, 0, 0);
  Strong = swift_weakLoadStrong(v2);
  if (Strong)
  {
    v4 = Strong;
    v5 = (os_unfair_lock_s *)(*(_QWORD *)(Strong + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
    os_unfair_lock_lock(v5);
    sub_29250(aBlock);
    v6 = (void *)aBlock[0];
    os_unfair_lock_unlock(v5);
    swift_release(v4);
    v7 = swift_allocObject(&unk_3A350, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v8 = swift_allocObject(&unk_3A378, 32, 7);
    *(_QWORD *)(v8 + 16) = sub_30150;
    *(_QWORD *)(v8 + 24) = v7;
    aBlock[4] = sub_30168;
    v18 = v8;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2B7C4;
    aBlock[3] = &unk_3A390;
    v9 = _Block_copy(aBlock);
    v10 = v18;
    v11 = v6;
    swift_retain(v8);
    swift_release(v10);
    objc_msgSend(v11, "performBlockAndWait:", v9);

    _Block_release(v9);
    LOBYTE(v9) = swift_isEscapingClosureAtFileLocation(v8, "", 126, 164, 47, 1);
    swift_release(v7);
    swift_release(v8);
    if ((v9 & 1) == 0)
      return;
    __break(1u);
  }
  if (qword_3E6A0 != -1)
    swift_once(&qword_3E6A0, sub_10B64);
  v12 = type metadata accessor for Logger(0);
  v13 = sub_AD78(v12, (uint64_t)qword_3FA80);
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_0, v14, v15, "No context available", v16, 2u);
    swift_slowDealloc(v16, -1, -1);
  }

}

void sub_2B284(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[3];
  _BYTE v33[8];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;

  v37 = 0;
  if (objc_msgSend(a1, "save:", &v37))
  {
    v1 = v37;
  }
  else
  {
    v29 = v37;
    v2 = v37;
    v3 = (void *)_convertNSErrorToError(_:)(v29);

    swift_willThrow();
    v37 = v3;
    swift_errorRetain(v3);
    v4 = sub_44F0((uint64_t *)&unk_3ECD0);
    v5 = sub_D854(0, (unint64_t *)&qword_3E930, NSError_ptr);
    if ((swift_dynamicCast(&v34, &v37, v4, v5, 0) & 1) != 0)
    {
      swift_errorRelease(v3);
      v6 = (void *)v34;
      if (qword_3E6A0 != -1)
        swift_once(&qword_3E6A0, sub_10B64);
      v7 = type metadata accessor for Logger(0);
      sub_AD78(v7, (uint64_t)qword_3FA80);
      v8 = v6;
      v9 = Logger.logObject.getter(v8);
      v10 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v9, v10))
      {
        v11 = swift_slowAlloc(22, -1);
        v28 = (_QWORD *)swift_slowAlloc(8, -1);
        v30 = swift_slowAlloc(32, -1);
        v31 = (uint64_t)v8;
        v36 = v30;
        *(_DWORD *)v11 = 138412546;
        v12 = v8;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, v32, v11 + 4, v11 + 12);
        *v28 = v8;

        *(_WORD *)(v11 + 12) = 2080;
        v13 = objc_msgSend(v12, "userInfo");
        v14 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v13, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);

        v15 = Dictionary.description.getter(v14, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
        v17 = v16;
        swift_bridgeObjectRelease(v14);
        v31 = sub_282C4(v15, v17, &v36);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, v32, v11 + 14, v11 + 22);

        swift_bridgeObjectRelease(v17);
        _os_log_impl(&dword_0, v9, v10, "Could not save. %@, %s", (uint8_t *)v11, 0x16u);
        v18 = sub_44F0(&qword_3ECE0);
        swift_arrayDestroy(v28, 1, v18);
        swift_slowDealloc(v28, -1, -1);
        swift_arrayDestroy(v30, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v30, -1, -1);
        swift_slowDealloc(v11, -1, -1);

      }
      else
      {

      }
      swift_errorRelease(v37);
    }
    else
    {
      swift_errorRelease(v37);
      if (qword_3E6A0 != -1)
        swift_once(&qword_3E6A0, sub_10B64);
      v19 = type metadata accessor for Logger(0);
      sub_AD78(v19, (uint64_t)qword_3FA80);
      swift_errorRetain(v3);
      v20 = swift_errorRetain(v3);
      v21 = Logger.logObject.getter(v20);
      v22 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc(12, -1);
        v24 = (void *)swift_slowAlloc(32, -1);
        v37 = v24;
        *(_DWORD *)v23 = 136315138;
        swift_getErrorValue(v3, v33, v32);
        v25 = Error.localizedDescription.getter(v32[1], v32[2]);
        v27 = v26;
        v34 = sub_282C4(v25, v26, (uint64_t *)&v37);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v23 + 4, v23 + 12);
        swift_bridgeObjectRelease(v27);
        swift_errorRelease(v3);
        swift_errorRelease(v3);
        _os_log_impl(&dword_0, v21, v22, "Could not save. %s", v23, 0xCu);
        swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v24, -1, -1);
        swift_slowDealloc(v23, -1, -1);

        swift_errorRelease(v3);
      }
      else
      {
        swift_errorRelease(v3);
        swift_errorRelease(v3);
        swift_errorRelease(v3);

      }
    }
  }
}

uint64_t sub_2B7C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_2B7E4()
{
  id v0;
  void *v1;
  void *v2;
  unsigned int v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;

  v0 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  URL._bridgeToObjectiveC()((NSURL *)OBJC_IVAR____TtC19EngagementCollector12LocalStorage_persistentDirectoryURL);
  v2 = v1;
  v16 = 0;
  v3 = objc_msgSend(v0, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v1, 1, 0, &v16);

  if (v3)
  {
    v4 = v16;
  }
  else
  {
    v15 = v16;
    v5 = v16;
    v6 = _convertNSErrorToError(_:)(v15);

    swift_willThrow();
    if (qword_3E6A0 != -1)
      swift_once(&qword_3E6A0, sub_10B64);
    v7 = type metadata accessor for Logger(0);
    sub_AD78(v7, (uint64_t)qword_3FA80);
    swift_errorRetain(v6);
    v8 = swift_errorRetain(v6);
    v9 = Logger.logObject.getter(v8);
    v10 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc(12, -1);
      v12 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v11 = 138412290;
      swift_errorRetain(v6);
      v13 = (void *)_swift_stdlib_bridgeErrorToNSError(v6);
      v16 = v13;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, &v17, v11 + 4, v11 + 12);
      *v12 = v13;
      swift_errorRelease(v6);
      swift_errorRelease(v6);
      _os_log_impl(&dword_0, v9, v10, "Failed to create directory error: %@", v11, 0xCu);
      v14 = sub_44F0(&qword_3ECE0);
      swift_arrayDestroy(v12, 1, v14);
      swift_slowDealloc(v12, -1, -1);
      swift_slowDealloc(v11, -1, -1);

      swift_errorRelease(v6);
    }
    else
    {
      swift_errorRelease(v6);
      swift_errorRelease(v6);
      swift_errorRelease(v6);

    }
  }
}

uint64_t sub_2BA88(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSString v8;
  void *v9;
  uint64_t v10;
  id v11;
  os_unfair_lock_s *v12;
  void **v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  char v20[24];
  void **aBlock;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  uint64_t (*v25)();
  uint64_t v26;

  v5 = swift_allocObject(&unk_3A0A8, 32, 7);
  *(_QWORD *)(v5 + 16) = 0;
  v6 = v5 + 16;
  *(_BYTE *)(v5 + 24) = 1;
  v7 = objc_msgSend((id)objc_opt_self(BMManagerConfiguration), "backgroundTaskDelegate");
  if (v7)
  {
    v8 = String._bridgeToObjectiveC()();
    v25 = sub_2E7FC;
    v26 = v5;
    aBlock = _NSConcreteStackBlock;
    v22 = 1107296256;
    v23 = sub_241B8;
    v24 = &unk_3A0C0;
    v9 = _Block_copy(&aBlock);
    v10 = v26;
    swift_retain(v5);
    swift_release(v10);
    v11 = objc_msgSend(v7, "ec_beginBackgroundTaskWithName:expirationHandler:", v8, v9);
    _Block_release(v9);
    swift_unknownObjectRelease(v7);

  }
  else
  {
    v11 = 0;
  }
  swift_beginAccess(v6, v20, 1, 0);
  *(_QWORD *)(v5 + 16) = v11;
  *(_BYTE *)(v5 + 24) = v7 == 0;
  v12 = (os_unfair_lock_s *)(*(_QWORD *)(v2 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v12);
  sub_29250(&aBlock);
  v13 = aBlock;
  os_unfair_lock_unlock(v12);
  v14 = (_QWORD *)swift_allocObject(&unk_3A0F8, 40, 7);
  v14[2] = a1;
  v14[3] = a2;
  v14[4] = v6;
  v15 = swift_allocObject(&unk_3A120, 32, 7);
  *(_QWORD *)(v15 + 16) = sub_2E840;
  *(_QWORD *)(v15 + 24) = v14;
  v25 = sub_1BC30;
  v26 = v15;
  aBlock = _NSConcreteStackBlock;
  v22 = 1107296256;
  v23 = sub_2B7C4;
  v24 = &unk_3A138;
  v16 = _Block_copy(&aBlock);
  v17 = v26;
  swift_retain(a2);
  swift_retain(v15);
  swift_release(v17);
  objc_msgSend(v13, "performBlockAndWait:", v16);

  _Block_release(v16);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v15, "", 126, 214, 32, 1);
  swift_release(v14);
  swift_release(v5);
  result = swift_release(v15);
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_2BD3C(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  _BYTE v8[24];

  v2 = a1 + 16;
  result = swift_beginAccess(a1 + 16, v8, 0, 0);
  if ((*(_BYTE *)(a1 + 24) & 1) == 0)
  {
    v4 = *(_QWORD *)(a1 + 16);
    v5 = objc_msgSend((id)objc_opt_self(BMManagerConfiguration), "backgroundTaskDelegate");
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "ec_endBackgroundTask:", v4);
      swift_unknownObjectRelease(v6);
    }
    result = swift_beginAccess(v2, &v7, 1, 0);
    *(_QWORD *)(a1 + 16) = 0;
    *(_BYTE *)(a1 + 24) = 1;
  }
  return result;
}

uint64_t sub_2BDEC(void (*a1)(void), uint64_t a2, uint64_t *a3)
{
  uint64_t result;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _BYTE v9[24];

  a1();
  result = swift_beginAccess(a3, v9, 0, 0);
  if ((a3[1] & 1) == 0)
  {
    v5 = *a3;
    v6 = objc_msgSend((id)objc_opt_self(BMManagerConfiguration), "backgroundTaskDelegate");
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "ec_endBackgroundTask:", v5);
      swift_unknownObjectRelease(v7);
    }
    result = swift_beginAccess(a3, &v8, 1, 0);
    *a3 = 0;
    *((_BYTE *)a3 + 8) = 1;
  }
  return result;
}

uint64_t sub_2BEA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  os_unfair_lock_s *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _QWORD v18[5];
  uint64_t v19;

  v9 = (os_unfair_lock_s *)(*(_QWORD *)(v4 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v9);
  sub_29250(v18);
  v10 = (void *)v18[0];
  os_unfair_lock_unlock(v9);
  v11 = swift_allocObject(&unk_3A288, 24, 7);
  swift_weakInit(v11 + 16);
  v12 = (_QWORD *)swift_allocObject(&unk_3A2D8, 56, 7);
  v12[2] = v11;
  v12[3] = a3;
  v12[4] = a4;
  v12[5] = a1;
  v12[6] = a2;
  v13 = swift_allocObject(&unk_3A300, 32, 7);
  *(_QWORD *)(v13 + 16) = sub_30064;
  *(_QWORD *)(v13 + 24) = v12;
  v18[4] = sub_30168;
  v19 = v13;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  v18[2] = sub_2B7C4;
  v18[3] = &unk_3A318;
  v14 = _Block_copy(v18);
  v15 = v19;
  swift_retain();
  swift_bridgeObjectRetain(a2, v16);
  swift_retain();
  swift_release(v15);
  objc_msgSend(v10, "performBlockAndWait:", v14);

  _Block_release(v14);
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation(v13, "", 126, 224, 32, 1);
  swift_release(v12);
  result = swift_release(v13);
  if ((v10 & 1) != 0)
    __break(1u);
  return result;
}

void sub_2C044(uint64_t a1, void (*a2)(uint64_t, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t Strong;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSString v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSString v21;
  Class isa;
  id v23;
  os_unfair_lock_s *v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  NSString v34;
  os_unfair_lock_s *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  NSString v41;
  id v42;
  unint64_t v43;
  _BYTE *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  _BYTE v51[24];
  void *v52;

  v7 = a1 + 16;
  swift_beginAccess(a1 + 16, v51, 0, 0);
  Strong = swift_weakLoadStrong(v7);
  if (!Strong)
  {
    v26 = sub_AD90();
    v27 = swift_allocError(&type metadata for PropertyError, v26, 0, 0);
    *v28 = 1;
    a2(v27, 1);
LABEL_14:
    swift_errorRelease(v27);
    return;
  }
  v9 = Strong;
  v10 = type metadata accessor for CDCloudSyncVersions();
  v52 = (void *)v10;
  v11 = sub_44F0(&qword_3F280);
  String.init<A>(describing:)(&v52, v11);
  v13 = v12;
  v14 = objc_allocWithZone((Class)NSFetchRequest);
  swift_bridgeObjectRetain(v13, v15);
  v16 = String._bridgeToObjectiveC()();
  v48 = v13;
  swift_bridgeObjectRelease(v13);
  v17 = objc_msgSend(v14, "initWithEntityName:", v16);

  objc_msgSend(v17, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v17, "setFetchLimit:", 1);
  v18 = sub_44F0(&qword_3E8C0);
  v19 = swift_allocObject(v18, 64, 7);
  *(_OWORD *)(v19 + 16) = xmmword_318F0;
  *(_QWORD *)(v19 + 56) = &type metadata for String;
  *(_QWORD *)(v19 + 32) = a4;
  *(_QWORD *)(v19 + 40) = a5;
  swift_bridgeObjectRetain(a5, v20);
  v21 = String._bridgeToObjectiveC()();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v19);
  v23 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v21, isa);

  v49 = v17;
  objc_msgSend(v17, "setPredicate:", v23);

  v47 = OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock;
  v24 = (os_unfair_lock_s *)(*(_QWORD *)(v9 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v24);
  sub_29250(&v52);
  v25 = v52;
  os_unfair_lock_unlock(v24);
  v29 = NSManagedObjectContext.fetch<A>(_:)(v17, v10);

  if ((unint64_t)v29 >> 62)
  {
    if (v29 < 0)
      v45 = v29;
    else
      v45 = v29 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v29, v30);
    v46 = _CocoaArrayWrapper.endIndex.getter(v45);
    swift_bridgeObjectRelease(v29);
    if (v46)
      goto LABEL_6;
    goto LABEL_20;
  }
  if (!*(_QWORD *)((char *)&dword_10 + (v29 & 0xFFFFFFFFFFFFF8)))
  {
LABEL_20:
    swift_bridgeObjectRelease(v29);
    v34 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v48);
    v35 = (os_unfair_lock_s *)(*(_QWORD *)(v9 + v47) + 16);
    os_unfair_lock_lock(v35);
    sub_29250(&v52);
    v36 = v52;
    v37 = (void *)objc_opt_self(NSEntityDescription);
    os_unfair_lock_unlock(v35);
    v38 = objc_msgSend(v37, "insertNewObjectForEntityForName:inManagedObjectContext:", v34, v36);

    v39 = swift_dynamicCastClass(v38, v10);
    if (v39)
    {
      v33 = (id)v39;
      v40 = v38;
      v41 = String._bridgeToObjectiveC()();
      objc_msgSend(v33, "setDataType:", v41);

      goto LABEL_12;
    }

    v43 = sub_AD90();
    v27 = swift_allocError(&type metadata for PropertyError, v43, 0, 0);
    *v44 = 1;
    a2(v27, 1);
    swift_release(v9);

    goto LABEL_14;
  }
LABEL_6:
  if ((v29 & 0xC000000000000001) != 0)
  {
    v31 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v29);
    goto LABEL_9;
  }
  if (*(_QWORD *)((char *)&dword_10 + (v29 & 0xFFFFFFFFFFFFF8)))
  {
    v31 = *(id *)(v29 + 32);
LABEL_9:
    v32 = v31;
    swift_bridgeObjectRelease(v48);
    swift_bridgeObjectRelease(v29);
    v33 = v32;
LABEL_12:
    v42 = v33;
    a2((uint64_t)v33, 0);

    swift_release(v9);
    return;
  }
  __break(1u);
  os_unfair_lock_unlock(0);
  __break(1u);
  os_unfair_lock_unlock((os_unfair_lock_t)v29);
  __break(1u);
}

void sub_2C6C0()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v1);
  sub_29250(v5);
  v2 = (void *)v5[0];
  os_unfair_lock_unlock(v1);
  v3 = swift_allocObject(&unk_3A288, 24, 7);
  swift_weakInit(v3 + 16);
  v5[4] = sub_30028;
  v6 = v3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_241B8;
  v5[3] = &unk_3A2A0;
  v4 = _Block_copy(v5);
  swift_release(v6);
  objc_msgSend(v2, "performBlock:", v4);
  _Block_release(v4);

}

void sub_2C7A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id *v10;
  uint64_t v11;
  os_unfair_lock_s *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  NSObject **v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  os_unfair_lock_s *v31;
  id v32;
  uint64_t v33;
  os_unfair_lock_s *v34;
  id v35;
  os_unfair_lock_s *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id *v42;
  uint64_t v43;
  NSObject *v44;
  _QWORD v45[2];
  id v46;
  char v47[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v47, 0, 0);
  Strong = swift_weakLoadStrong(v1);
  if (!Strong)
    return;
  v3 = Strong;
  v4 = (void *)type metadata accessor for CDCloudSyncVersions();
  v46 = v4;
  v5 = sub_44F0(&qword_3F280);
  String.init<A>(describing:)(&v46, v5);
  v7 = v6;
  v8 = objc_allocWithZone((Class)NSFetchRequest);
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  v10 = (id *)objc_msgSend(v8, "initWithEntityName:", v9);

  v11 = OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock;
  v12 = (os_unfair_lock_s *)(*(_QWORD *)(v3 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v12);
  sub_29250(&v46);
  v13 = v46;
  os_unfair_lock_unlock(v12);
  v25 = NSManagedObjectContext.fetch<A>(_:)(v10, v4);

  v42 = v10;
  v43 = v11;
  if (!((unint64_t)v25 >> 62))
  {
    v16 = *(void **)((char *)&dword_10 + (v25 & 0xFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain(v25, v26);
    if (v16)
      goto LABEL_8;
LABEL_14:
    swift_bridgeObjectRelease_n(v25, 2);
    v33 = v43;
    v34 = (os_unfair_lock_s *)(*(_QWORD *)(v3 + v43) + 16);
    os_unfair_lock_lock(v34);
    sub_29250(&v46);
    v35 = v46;
    os_unfair_lock_unlock(v34);
    LODWORD(v34) = objc_msgSend(v35, "hasChanges");

    if (!(_DWORD)v34)
    {
      swift_release(v3);

      return;
    }
    v36 = (os_unfair_lock_s *)(*(_QWORD *)(v3 + v33) + 16);
    os_unfair_lock_lock(v36);
    sub_29250(&v46);
    v37 = v46;
    os_unfair_lock_unlock(v36);
    v46 = 0;
    LODWORD(v36) = objc_msgSend(v37, "save:", &v46);

    v38 = v46;
    v10 = v42;
    if ((_DWORD)v36)
    {
      swift_release(v3);

      return;
    }
    v39 = v38;
    v40 = (void *)_convertNSErrorToError(_:)(v38);

    swift_willThrow();
    v46 = v40;
    v14 = sub_44F0((uint64_t *)&unk_3ECD0);
    v15 = sub_D854(0, (unint64_t *)&qword_3E930, NSError_ptr);
    swift_dynamicCast(v45, &v46, v14, v15, 0);
    v16 = (void *)v45[0];
    if (qword_3E6A0 == -1)
      goto LABEL_4;
    goto LABEL_23;
  }
  if (v25 < 0)
    v41 = v25;
  else
    v41 = v25 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain_n(v25, 2);
  v16 = (void *)_CocoaArrayWrapper.endIndex.getter(v41);
  swift_bridgeObjectRelease(v25);
  if (!v16)
    goto LABEL_14;
LABEL_8:
  v27 = 4;
  while (1)
  {
    v28 = (v25 & 0xC000000000000001) != 0
        ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v27 - 4, v25)
        : *(id *)(v25 + 8 * v27);
    v29 = v28;
    v30 = (void *)(v27 - 3);
    if (__OFADD__(v27 - 4, 1))
      break;
    v10 = (id *)&v42;
    v31 = (os_unfair_lock_s *)(*(_QWORD *)(v3 + v43) + 16);
    os_unfair_lock_lock(v31);
    sub_29250(&v46);
    v32 = v46;
    os_unfair_lock_unlock(v31);
    objc_msgSend(v32, "deleteObject:", v29);

    ++v27;
    if (v30 == v16)
      goto LABEL_14;
  }
  __break(1u);
LABEL_23:
  swift_once(&qword_3E6A0, sub_10B64);
LABEL_4:
  v17 = type metadata accessor for Logger(0);
  sub_AD78(v17, (uint64_t)qword_3FA80);
  v18 = v16;
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v42 = v10;
    v21 = (uint8_t *)swift_slowAlloc(12, -1);
    v22 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v21 = 138412290;
    v44 = v18;
    v23 = v18;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, v45, v21 + 4, v21 + 12);
    *v22 = v18;

    v10 = v42;
    _os_log_impl(&dword_0, v19, v20, "Failed to delete cloudSyncVersions error: %@", v21, 0xCu);
    v24 = sub_44F0(&qword_3ECE0);
    swift_arrayDestroy(v22, 1, v24);
    swift_slowDealloc(v22, -1, -1);
    swift_slowDealloc(v21, -1, -1);
  }
  else
  {

    v19 = v18;
  }

  swift_release(v3);
  swift_errorRelease(v46);
}

void sub_2CCB8(void *a1, char a2, void (*a3)(void *, uint64_t), uint64_t a4, _QWORD *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  if ((a2 & 1) != 0)
  {
    a3(a1, 1);
  }
  else
  {
    v8 = a5[3];
    v9 = a5[4];
    sub_1AD8C(a5, v8);
    v10 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 32);
    v11 = a1;
    objc_msgSend(v11, "setCloudVersion:", v10(v8, v9));
    v12 = a5[3];
    v13 = a5[4];
    sub_1AD8C(a5, v12);
    v14 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v13 + 16))(v12, v13);
    sub_1CBB8(v14);
    v15 = a5[3];
    v16 = a5[4];
    sub_1AD8C(a5, v15);
    objc_msgSend(v11, "setHistoryTokenOffset:", (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 24))(v15, v16));
    a3(a1, 0);
    sub_1BC5C(a1, 0);
  }
}

uint64_t sub_2CDEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v27;
  uint64_t v28;

  v27 = a3;
  v28 = a5;
  v11 = sub_44F0(&qword_3EAD0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  v14 = __chkstk_darwin(v11);
  v15 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v17 = (char *)&v27 - v16;
  sub_2E85C(a1, (uint64_t)&v27 - v16);
  sub_2E85C(a2, (uint64_t)v15);
  v18 = *(unsigned __int8 *)(v12 + 80);
  v19 = (v18 + 24) & ~v18;
  v20 = (v13 + v18 + v19) & ~v18;
  v21 = (v13 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  v22 = (v21 + 23) & 0xFFFFFFFFFFFFFFF8;
  v23 = swift_allocObject(&unk_3A170, v22 + 16, v18 | 7);
  *(_QWORD *)(v23 + 16) = v6;
  sub_1BCA8((uint64_t)v17, v23 + v19, &qword_3EAD0);
  sub_1BCA8((uint64_t)v15, v23 + v20, &qword_3EAD0);
  v24 = (_QWORD *)(v23 + v21);
  *v24 = v27;
  v24[1] = a4;
  v25 = (_QWORD *)(v23 + v22);
  *v25 = v28;
  v25[1] = a6;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2BA88((uint64_t)sub_1B898, v23);
  return swift_release(v23);
}

void sub_2CF64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  os_unfair_lock_s *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;

  v30 = a6;
  v31 = a7;
  v29 = a4;
  v11 = sub_44F0(&qword_3EAD0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  v14 = __chkstk_darwin(v11);
  v15 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v17 = (char *)&v29 - v16;
  v18 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v18);
  sub_29250(&v32);
  v19 = v32;
  os_unfair_lock_unlock(v18);
  sub_2E85C(a2, (uint64_t)v17);
  sub_2E85C(a3, (uint64_t)v15);
  v20 = *(unsigned __int8 *)(v12 + 80);
  v21 = (v20 + 24) & ~v20;
  v22 = (v13 + v20 + v21) & ~v20;
  v23 = (v13 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  v24 = (v23 + 23) & 0xFFFFFFFFFFFFFFF8;
  v25 = swift_allocObject(&unk_3A260, v24 + 16, v20 | 7);
  *(_QWORD *)(v25 + 16) = a1;
  sub_1BCA8((uint64_t)v17, v25 + v21, &qword_3EAD0);
  sub_1BCA8((uint64_t)v15, v25 + v22, &qword_3EAD0);
  v26 = (_QWORD *)(v25 + v23);
  *v26 = v29;
  v26[1] = a5;
  v27 = (_QWORD *)(v25 + v24);
  v28 = v31;
  *v27 = v30;
  v27[1] = v28;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_FA7C((uint64_t)v19, (void (*)(uint64_t, _QWORD))sub_2FF68);
  swift_release(v25);

}

uint64_t sub_2D114(unint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t *, uint64_t), _QWORD *a7, void (*a8)(void), uint64_t a9)
{
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if ((a2 & 1) == 0)
    return sub_225F0(a4, a5, a1, a6, a7, (uint64_t)a8, a9);
  swift_errorRetain(a1);
  if (qword_3E6A0 != -1)
    swift_once(&qword_3E6A0, sub_10B64);
  v12 = type metadata accessor for Logger(0);
  sub_AD78(v12, (uint64_t)qword_3FA80);
  swift_errorRetain(a1);
  v13 = swift_errorRetain(a1);
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc(12, -1);
    v17 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v16 = 138412290;
    swift_errorRetain(a1);
    v18 = _swift_stdlib_bridgeErrorToNSError(a1);
    v20 = v18;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v16 + 4, v16 + 12);
    *v17 = v18;
    sub_DA68(a1, 1);
    sub_DA68(a1, 1);
    _os_log_impl(&dword_0, v14, v15, "Failed to fetch configurations error: %@", v16, 0xCu);
    v19 = sub_44F0(&qword_3ECE0);
    swift_arrayDestroy(v17, 1, v19);
    swift_slowDealloc(v17, -1, -1);
    swift_slowDealloc(v16, -1, -1);
  }
  else
  {
    sub_DA68(a1, 1);
    sub_DA68(a1, 1);
  }

  a8();
  return sub_DA68(a1, 1);
}

void sub_2D31C(uint64_t a1, void (*a2)(uint64_t *), uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t Strong;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  NSString v33;
  void *v34;
  uint64_t v35;
  id v36;
  void (*v37)(char *, uint64_t, uint64_t, uint64_t);
  os_unfair_lock_s *v38;
  void *v39;
  unint64_t v40;
  uint64_t v41;
  _BYTE *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  unint64_t v60;
  _BYTE *v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t *v72;
  char *v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(uint64_t *);
  uint64_t v78;
  char v79[24];
  _QWORD v80[2];

  v76 = a3;
  v77 = a2;
  v4 = type metadata accessor for Date(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v73 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_44F0(&qword_3EAD0);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v8);
  v13 = (char *)&v65 - v12;
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v65 - v15;
  __chkstk_darwin(v14);
  v18 = (char *)&v65 - v17;
  v19 = sub_44F0(&qword_3F290);
  v20 = __chkstk_darwin(v19);
  v72 = (uint64_t *)((char *)&v65 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v20);
  v23 = (uint64_t *)((char *)&v65 - v22);
  a1 += 16;
  swift_beginAccess(a1, v79, 0, 0);
  Strong = swift_weakLoadStrong(a1);
  if (!Strong)
  {
    v40 = sub_AD90();
    v41 = swift_allocError(&type metadata for PropertyError, v40, 0, 0);
    *v42 = 1;
    *v23 = v41;
    swift_storeEnumTagMultiPayload(v23, v19, 1);
    v77(v23);
    v43 = &qword_3F290;
    v44 = (uint64_t)v23;
LABEL_25:
    sub_DB08(v44, v43);
    return;
  }
  v70 = v10;
  v74 = v23;
  v68 = v19;
  v25 = Strong;
  v26 = type metadata accessor for CDCloudSyncHistory();
  v80[0] = v26;
  v27 = sub_44F0(&qword_3F288);
  String.init<A>(describing:)(v80, v27);
  v28 = v5;
  v30 = v29;
  v31 = objc_allocWithZone((Class)NSFetchRequest);
  v75 = v4;
  v32 = v31;
  v33 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v30);
  v34 = v32;
  v35 = v75;
  v36 = objc_msgSend(v34, "initWithEntityName:", v33);

  objc_msgSend(v36, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v36, "setFetchLimit:", 1);
  v69 = v28;
  v37 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56);
  v71 = v18;
  v37(v18, 1, 1, v35);
  v38 = (os_unfair_lock_s *)(*(_QWORD *)(v25 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v38);
  v67 = v25;
  sub_29250(v80);
  v39 = (void *)v80[0];
  os_unfair_lock_unlock(v38);
  v66 = v36;
  v45 = NSManagedObjectContext.fetch<A>(_:)(v36, v26);

  v48 = (uint64_t)v70;
  v47 = (uint64_t)v71;
  if (!((unint64_t)v45 >> 62))
  {
    v49 = (uint64_t)v74;
    if (*(_QWORD *)((char *)&dword_10 + (v45 & 0xFFFFFFFFFFFFF8)))
      goto LABEL_6;
LABEL_17:
    swift_bridgeObjectRelease(v45);
    sub_DB08(v47, &qword_3EAD0);
    v37(v16, 1, 1, v35);
    v54 = v69;
    goto LABEL_18;
  }
  if (v45 < 0)
    v55 = v45;
  else
    v55 = v45 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v45, v46);
  v56 = _CocoaArrayWrapper.endIndex.getter(v55);
  swift_bridgeObjectRelease(v45);
  v49 = (uint64_t)v74;
  if (!v56)
    goto LABEL_17;
LABEL_6:
  if ((v45 & 0xC000000000000001) != 0)
  {
    v50 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v45);
    goto LABEL_9;
  }
  if (*(_QWORD *)((char *)&dword_10 + (v45 & 0xFFFFFFFFFFFFF8)))
  {
    v50 = *(id *)(v45 + 32);
LABEL_9:
    v51 = v50;
    swift_bridgeObjectRelease(v45);
    v52 = objc_msgSend(v51, "lastSyncTimestamp");

    if (v52)
    {
      static Date._unconditionallyBridgeFromObjectiveC(_:)(v52);

      v53 = 0;
    }
    else
    {
      v53 = 1;
    }
    v54 = v69;
    sub_DB08(v47, &qword_3EAD0);
    v37(v13, v53, 1, v35);
    sub_1BCA8((uint64_t)v13, (uint64_t)v16, &qword_3EAD0);
    v49 = (uint64_t)v74;
LABEL_18:
    sub_1BCA8((uint64_t)v16, v47, &qword_3EAD0);
    v78 = 0;
    v57 = v68;
    sub_2E85C(v47, v48);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v54 + 48))(v48, 1, v35) == 1)
    {
      sub_DB08(v48, &qword_3EAD0);
      if (v78)
      {
        v58 = v78;
      }
      else
      {
        v60 = sub_AD90();
        v58 = swift_allocError(&type metadata for PropertyError, v60, 0, 0);
        v78 = 0;
        *v61 = 1;
      }
      v62 = (uint64_t)v72;
      v63 = v66;
      *v72 = v58;
      swift_storeEnumTagMultiPayload(v62, v57, 1);
      v64 = v78;
      swift_errorRetain(v78);
      v77((uint64_t *)v62);
      swift_release(v67);

      swift_errorRelease(v64);
      sub_DB08(v62, &qword_3F290);
    }
    else
    {
      v59 = v73;
      (*(void (**)(char *, uint64_t, uint64_t))(v54 + 32))(v73, v48, v35);
      (*(void (**)(uint64_t, char *, uint64_t))(v54 + 16))(v49, v59, v35);
      swift_storeEnumTagMultiPayload(v49, v57, 0);
      v77((uint64_t *)v49);
      swift_release(v67);

      swift_errorRelease(v78);
      sub_DB08(v49, &qword_3F290);
      (*(void (**)(char *, uint64_t))(v54 + 8))(v59, v35);
    }
    v43 = &qword_3EAD0;
    v44 = v47;
    goto LABEL_25;
  }
  __break(1u);
  os_unfair_lock_unlock((os_unfair_lock_t)v45);
  __break(1u);
}

void sub_2DAC0(uint64_t a1, void (*a2)(uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t Strong;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  NSString v12;
  id v13;
  uint64_t v14;
  os_unfair_lock_s *v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  NSString v24;
  uint64_t v25;
  os_unfair_lock_s *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  Class isa;
  os_unfair_lock_s *v32;
  id v33;
  os_unfair_lock_s *v34;
  id v35;
  unsigned int v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  NSObject *v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  NSObject *v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSObject **v55;
  NSObject *v56;
  id v57[2];
  id v58;
  char v59[24];

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v59, 0, 0);
  Strong = swift_weakLoadStrong(v3);
  if (!Strong)
  {
    v17 = sub_AD90();
    v18 = swift_allocError(&type metadata for PropertyError, v17, 0, 0);
    *v19 = 1;
    a2(v18, 1);
    swift_errorRelease(v18);
    return;
  }
  v5 = Strong;
  v6 = (void *)type metadata accessor for CDCloudSyncHistory();
  v58 = v6;
  v7 = sub_44F0(&qword_3F288);
  String.init<A>(describing:)(&v58, v7);
  v9 = v8;
  v10 = objc_allocWithZone((Class)NSFetchRequest);
  swift_bridgeObjectRetain(v9, v11);
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  v13 = objc_msgSend(v10, "initWithEntityName:", v12);

  objc_msgSend(v13, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v13, "setFetchLimit:", 1);
  v14 = OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock;
  v15 = (os_unfair_lock_s *)(*(_QWORD *)(v5 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v15);
  sub_29250(&v58);
  v16 = v58;
  os_unfair_lock_unlock(v15);
  v20 = NSManagedObjectContext.fetch<A>(_:)(v13, v6);

  if ((unint64_t)v20 >> 62)
  {
    if (v20 < 0)
      v52 = v20;
    else
      v52 = v20 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v20, v21);
    v53 = _CocoaArrayWrapper.endIndex.getter(v52);
    swift_bridgeObjectRelease(v20);
    if (v53)
      goto LABEL_6;
  }
  else if (*(_QWORD *)((char *)&dword_10 + (v20 & 0xFFFFFFFFFFFFF8)))
  {
LABEL_6:
    if ((v20 & 0xC000000000000001) != 0)
    {
      v22 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v20);
    }
    else
    {
      if (!*(_QWORD *)((char *)&dword_10 + (v20 & 0xFFFFFFFFFFFFF8)))
        __break(1u);
      v22 = *(id *)(v20 + 32);
    }
    v23 = v22;
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v20);
    goto LABEL_11;
  }
  v54 = v6;
  swift_bridgeObjectRelease(v20);
  v24 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  v25 = v14;
  v26 = (os_unfair_lock_s *)(*(_QWORD *)(v5 + v14) + 16);
  os_unfair_lock_lock(v26);
  sub_29250(&v58);
  v27 = v58;
  v28 = (void *)objc_opt_self(NSEntityDescription);
  os_unfair_lock_unlock(v26);
  v29 = objc_msgSend(v28, "insertNewObjectForEntityForName:inManagedObjectContext:", v24, v27);

  v23 = (void *)swift_dynamicCastClass(v29, v54);
  v14 = v25;
  if (!v23)
  {

    v30 = 0;
    goto LABEL_13;
  }
LABEL_11:
  v30 = v23;
  isa = Date._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v30, "setLastSyncTimestamp:", isa);

LABEL_13:
  v32 = (os_unfair_lock_s *)(*(_QWORD *)(v5 + v14) + 16);
  os_unfair_lock_lock(v32);
  sub_29250(&v58);
  v33 = v58;
  os_unfair_lock_unlock(v32);
  LOBYTE(v32) = objc_msgSend(v33, "hasChanges");

  if ((v32 & 1) == 0)
    goto LABEL_15;
  v34 = (os_unfair_lock_s *)(*(_QWORD *)(v5 + v14) + 16);
  os_unfair_lock_lock(v34);
  sub_29250(&v58);
  v35 = v58;
  os_unfair_lock_unlock(v34);
  v58 = 0;
  v36 = objc_msgSend(v35, "save:", &v58);

  v37 = v58;
  if (!v36)
  {
    v38 = v37;
    v39 = (void *)_convertNSErrorToError(_:)(v37);

    swift_willThrow();
    v58 = v39;
    v40 = sub_44F0((uint64_t *)&unk_3ECD0);
    v41 = sub_D854(0, (unint64_t *)&qword_3E930, NSError_ptr);
    swift_dynamicCast(v57, &v58, v40, v41, 0);
    v42 = qword_3E6A0;
    v43 = v57[0];
    if (v42 != -1)
      swift_once(&qword_3E6A0, sub_10B64);
    v44 = type metadata accessor for Logger(0);
    sub_AD78(v44, (uint64_t)qword_3FA80);
    v45 = v43;
    v46 = Logger.logObject.getter(v45);
    v47 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc(12, -1);
      v55 = (NSObject **)swift_slowAlloc(8, -1);
      v56 = v45;
      *(_DWORD *)v48 = 138412290;
      v49 = v45;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v56, v57, v48 + 4, v48 + 12);
      *v55 = v45;

      _os_log_impl(&dword_0, v46, v47, "Failed to save cloudSyncHistory error: %@", v48, 0xCu);
      v50 = sub_44F0(&qword_3ECE0);
      swift_arrayDestroy(v55, 1, v50);
      swift_slowDealloc(v55, -1, -1);
      swift_slowDealloc(v48, -1, -1);
    }
    else
    {

      v49 = v45;
      v46 = v45;
    }

    swift_errorRelease(v58);
    v51 = v45;
    a2((uint64_t)v45, 1);

    swift_release(v5);
  }
  else
  {
LABEL_15:
    a2(0, 0);

    swift_release(v5);
  }
}

void sub_2E310(void *a1)
{
  uint64_t v1;
  id v2;
  id v3;

  v3 = *(id *)(v1 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_persistentContainer);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_persistentContainer) = a1;
  v2 = a1;

}

uint64_t LocalStorage.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_persistentDirectoryURL;
  v2 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock));
  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_saveSignalPublisher));
  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_saveSubscription));

  return v0;
}

uint64_t LocalStorage.__deallocating_deinit()
{
  uint64_t v0;

  LocalStorage.deinit();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

unint64_t sub_2E420(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_QWORD *)(v9 + 8 * v6);
        result = static Hasher._hash(seed:_:)(*(_QWORD *)(a2 + 40), *v10);
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8 || v3 < (uint64_t)v11)
            goto LABEL_6;
        }
        else if (v11 < v8 && v3 < (uint64_t)v11)
        {
          goto LABEL_6;
        }
        v14 = (_QWORD *)(v9 + 8 * v3);
        if (v3 != v6 || v14 >= v10 + 1)
          *v14 = *v10;
        v15 = *(_QWORD *)(a2 + 56);
        result = v15 + 8 * v3;
        if (v3 < (uint64_t)v6 || result >= v15 + 8 * v6 + 8)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v16 = v3 == v6;
          v3 = v6;
          if (v16)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_2E5DC(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Swift::Int v14;
  unint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  _OWORD *v18;
  uint64_t v19;
  _OWORD *v20;
  _OWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD v28[9];

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v10 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v6);
        v11 = *v10;
        v12 = v10[1];
        Hasher.init(_seed:)(v28, *(_QWORD *)(a2 + 40));
        swift_bridgeObjectRetain(v12, v13);
        String.hash(into:)(v28, v11, v12);
        v14 = Hasher._finalize()();
        result = swift_bridgeObjectRelease(v12);
        v15 = v14 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v15 < v8)
            goto LABEL_5;
        }
        else if (v15 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v15)
        {
LABEL_11:
          v16 = *(_QWORD *)(a2 + 48);
          v17 = (_OWORD *)(v16 + 16 * v3);
          v18 = (_OWORD *)(v16 + 16 * v6);
          if (v3 != v6 || v17 >= v18 + 1)
            *v17 = *v18;
          v19 = *(_QWORD *)(a2 + 56);
          v20 = (_OWORD *)(v19 + 32 * v3);
          v21 = (_OWORD *)(v19 + 32 * v6);
          if (v3 != v6 || (v3 = v6, v20 >= v21 + 2))
          {
            v9 = v21[1];
            *v20 = *v21;
            v20[1] = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v23 = *v22;
    v24 = (-1 << v3) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    v24 = *v22;
    v23 = (-1 << result) - 1;
  }
  *v22 = v24 & v23;
  v25 = *(_QWORD *)(a2 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_QWORD *sub_2E7B0@<X0>(_QWORD *(*a1)(uint64_t *__return_ptr)@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v5;

  result = a1(&v5);
  if (!v2)
    *a2 = v5;
  return result;
}

uint64_t sub_2E7EC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_2E7FC()
{
  uint64_t v0;

  return sub_2BD3C(v0);
}

uint64_t sub_2E804(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_2E814(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_2E81C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_2E840()
{
  uint64_t v0;

  return sub_2BDEC(*(void (**)(void))(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t **)(v0 + 32));
}

uint64_t sub_2E84C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_2E85C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_44F0(&qword_3EAD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2E8A8()
{
  return type metadata accessor for LocalStorage(0);
}

uint64_t type metadata accessor for LocalStorage(uint64_t a1)
{
  uint64_t result;

  result = qword_3F0C8;
  if (!qword_3F0C8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for LocalStorage);
  return result;
}

uint64_t sub_2E8EC(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[8];

  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[2] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[3] = &unk_31C88;
    v4[4] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[5] = &unk_31C88;
    v4[6] = &unk_31C88;
    v4[7] = &unk_31C88;
    result = swift_updateClassMetadata2(a1, 256, 8, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for LocalStorage(uint64_t a1, uint64_t a2)
{
  return swift_lookUpClassMethod(a1, a2, &nominal type descriptor for LocalStorage);
}

uint64_t dispatch thunk of LocalStorage.context.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of LocalStorage.performOnContext(completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of LocalStorage.enumerate(startDate:endDate:closure:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of LocalStorage.unitTestOnlyReplacePersistentContainer(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

void sub_2E9C0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
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
  id v14;
  void *object;
  NSString v16;
  NSString v17;
  id v18;
  NSString v19;
  NSString v20;
  id v21;
  void (*v22)(char *, char *, uint64_t);
  char *v23;
  uint64_t v24;
  char *v25;
  id v26;
  NSURL *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  NSString v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  void (*v42)(char *, uint64_t);
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char v50;

  v0 = type metadata accessor for NSPersistentStore.StoreType(0);
  v47 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v2 = (char *)&v44 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_44F0(&qword_3F278);
  __chkstk_darwin(v3);
  v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v49 - 8);
  v7 = __chkstk_darwin(v49);
  v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v7);
  v12 = (char *)&v44 - v11;
  __chkstk_darwin(v10);
  v48 = (char *)&v44 - v13;
  v50 = 0;
  v14 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  object = URL.path(percentEncoded:)(0)._object;
  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  LODWORD(object) = objc_msgSend(v14, "fileExistsAtPath:isDirectory:", v16, &v50);

  if (!(_DWORD)object)
    return;
  v46 = v0;
  v17 = String._bridgeToObjectiveC()();
  v18 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleWithIdentifier:", v17);

  if (v18)
  {
    v19 = String._bridgeToObjectiveC()();
    v20 = String._bridgeToObjectiveC()();
    v21 = objc_msgSend(v18, "URLForResource:withExtension:", v19, v20);

    if (v21)
    {
      static URL._unconditionallyBridgeFromObjectiveC(_:)(v21);

      v22 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v23 = v12;
      v24 = v49;
      v22(v5, v23, v49);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v5, 0, 1, v24);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v5, 1, v24) != 1)
      {
        v45 = v18;
        v25 = v48;
        v22(v48, v5, v24);
        v26 = objc_allocWithZone((Class)NSManagedObjectModel);
        URL._bridgeToObjectiveC()(v27);
        v29 = v28;
        v30 = objc_msgSend(v26, "initWithContentsOfURL:", v28);

        if (v30)
        {
          v31 = objc_allocWithZone((Class)NSPersistentContainer);
          v32 = v30;
          v33 = String._bridgeToObjectiveC()();
          v34 = objc_msgSend(v31, "initWithName:managedObjectModel:", v33, v32);

          v35 = objc_msgSend(v34, "persistentStoreCoordinator");
          v36 = URL.appendingPathComponent(_:)(0xD000000000000014, 0x8000000000033CB0);
          static NSPersistentStore.StoreType.sqlite.getter(v36);
          NSPersistentStoreCoordinator.destroyPersistentStore(at:type:options:)(v9, v2, 0);

          (*(void (**)(char *, uint64_t))(v47 + 8))(v2, v46);
          v42 = *(void (**)(char *, uint64_t))(v6 + 8);
          v43 = v49;
          v42(v9, v49);
          v42(v48, v43);
          return;
        }
        (*(void (**)(char *, uint64_t))(v6 + 8))(v25, v24);

        goto LABEL_9;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v5, 1, 1, v49);
    }

    sub_DB08((uint64_t)v5, &qword_3F278);
  }
LABEL_9:
  if (qword_3E6A0 != -1)
    swift_once(&qword_3E6A0, sub_10B64);
  v37 = type metadata accessor for Logger(0);
  v38 = sub_AD78(v37, (uint64_t)qword_3FA80);
  v39 = Logger.logObject.getter(v38);
  v40 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v39, v40))
  {
    v41 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v41 = 0;
    _os_log_impl(&dword_0, v39, v40, "Failed to destroy persistent store", v41, 2u);
    swift_slowDealloc(v41, -1, -1);
  }

}

uint64_t sub_2F0D8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  NSString v10;
  id v11;
  NSString v12;
  NSString v13;
  id v14;
  void (*v15)(char *, char *, uint64_t);
  id v16;
  NSURL *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t result;
  uint64_t v22;

  v0 = sub_44F0(&qword_3F278);
  __chkstk_darwin(v0);
  v2 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for URL(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v22 - v8;
  v10 = String._bridgeToObjectiveC()();
  v11 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleWithIdentifier:", v10);

  if (!v11)
    goto LABEL_8;
  v12 = String._bridgeToObjectiveC()();
  v13 = String._bridgeToObjectiveC()();
  v14 = objc_msgSend(v11, "URLForResource:withExtension:", v12, v13);

  if (!v14)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
    goto LABEL_7;
  }
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v14);

  v15 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
  v15(v2, v7, v3);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
LABEL_7:

    sub_DB08((uint64_t)v2, &qword_3F278);
LABEL_8:
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000021, 0x8000000000033DF0, "EngagementCollector/LocalStorage.swift", 38, 2, 48, 0);
    goto LABEL_10;
  }
  v15(v9, v2, v3);
  v16 = objc_allocWithZone((Class)NSManagedObjectModel);
  URL._bridgeToObjectiveC()(v17);
  v19 = v18;
  v20 = objc_msgSend(v16, "initWithContentsOfURL:", v18);

  if (v20)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);

    return (uint64_t)v20;
  }
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000030, 0x8000000000033E20, "EngagementCollector/LocalStorage.swift", 38, 2, 51, 0);
LABEL_10:
  __break(1u);
  return result;
}

id sub_2F3BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  id v9;
  NSString v10;
  id v11;
  id v12;
  NSURL *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  Class isa;
  NSString v20;
  id v21;
  id v22;
  id v23;
  NSString v24;
  NSString v25;
  id v26;
  id v27;
  id v28;
  NSString v29;
  NSString v30;
  id v31;
  id v32;
  objc_class *v33;
  NSString v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  void *v45;
  objc_class *v46;
  uint64_t v47;
  uint64_t v48;
  Swift::OpaquePointer v49;
  id v50;
  dispatch_semaphore_t v51;
  char *v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  NSObject *v63;
  char *v64;
  uint64_t v66;
  uint64_t v67;
  objc_class *v68;
  uint64_t v69;
  void (*v70)(char *, char *, uint64_t);
  uint64_t v71;
  __int128 v72;
  id v73;
  NSManagedObjectModelReference v74;
  id v75;
  id v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  id v81;
  id v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  _QWORD aBlock[5];
  uint64_t v89;

  v0 = type metadata accessor for DispatchTime(0);
  v85 = *(_QWORD *)(v0 - 8);
  v86 = v0;
  __chkstk_darwin(v0);
  v84 = (char *)&v70 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = type metadata accessor for URL(0);
  v2 = *(_QWORD *)(v78 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  v4 = __chkstk_darwin(v78);
  v77 = (char *)&v70 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v6 = (char *)&v70 - v5;
  v7 = sub_29398();
  URL.appendingPathComponent(_:)(0xD000000000000014, 0x8000000000033CB0);
  v8 = objc_allocWithZone((Class)NSPersistentContainer);
  v9 = v7;
  v10 = String._bridgeToObjectiveC()();
  v11 = objc_msgSend(v8, "initWithName:managedObjectModel:", v10, v9);

  v82 = v9;
  v12 = objc_allocWithZone((Class)NSPersistentStoreDescription);
  URL._bridgeToObjectiveC()(v13);
  v15 = v14;
  v16 = objc_msgSend(v12, "initWithURL:", v14);

  objc_msgSend(v16, "setShouldMigrateStoreAutomatically:", 1);
  objc_msgSend(v16, "setShouldInferMappingModelAutomatically:", 1);
  objc_msgSend(v16, "setReadOnly:", 0);
  v73 = (id)sub_44F0(&qword_3E920);
  v17 = swift_allocObject(v73, 40, 7);
  v72 = xmmword_31640;
  *(_OWORD *)(v17 + 16) = xmmword_31640;
  *(_QWORD *)(v17 + 32) = v16;
  aBlock[0] = v17;
  specialized Array._endMutation()(v17);
  v18 = aBlock[0];
  sub_D854(0, &qword_3F250, NSPersistentStoreDescription_ptr);
  v80 = v16;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v18);
  v81 = v11;
  objc_msgSend(v11, "setPersistentStoreDescriptions:", isa);

  v20 = String._bridgeToObjectiveC()();
  v21 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleWithIdentifier:", v20);

  v22 = objc_allocWithZone((Class)NSManagedObjectModelReference);
  v23 = v21;
  v24 = String._bridgeToObjectiveC()();
  v25 = String._bridgeToObjectiveC()();
  v26 = objc_msgSend(v22, "initWithName:inBundle:versionChecksum:", v24, v23, v25);

  v27 = objc_allocWithZone((Class)NSManagedObjectModelReference);
  v28 = v23;
  v29 = String._bridgeToObjectiveC()();
  v30 = String._bridgeToObjectiveC()();
  v31 = objc_msgSend(v27, "initWithName:inBundle:versionChecksum:", v29, v28, v30);

  v76 = v28;
  sub_D854(0, &qword_3F258, NSCustomMigrationStage_ptr);
  v32 = v26;
  v74.super.isa = (Class)v31;
  v75 = v32;
  v33 = NSCustomMigrationStage.init(migratingFrom:to:)((NSManagedObjectModelReference)v32, v74).super.super.isa;
  v34 = String._bridgeToObjectiveC()();
  -[objc_class setLabel:](v33, "setLabel:", v34);

  v35 = v2;
  v36 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  v38 = v77;
  v37 = v78;
  v87 = v6;
  v36(v77, v6, v78);
  v39 = *(unsigned __int8 *)(v35 + 80);
  v40 = v35;
  v71 = ~v39;
  v41 = (v39 + 48) & ~v39;
  v79 = v3;
  v42 = v39 | 7;
  v43 = (char *)swift_allocObject(&unk_3A198, v41 + v3, v39 | 7);
  *((_QWORD *)v43 + 2) = 1635017060;
  *((_QWORD *)v43 + 3) = 0xE400000000000000;
  *((_QWORD *)v43 + 4) = 0x44497465737361;
  *((_QWORD *)v43 + 5) = 0xE700000000000000;
  v83 = v40;
  v70 = *(void (**)(char *, char *, uint64_t))(v40 + 32);
  v70(&v43[v41], v38, v37);
  NSCustomMigrationStage.didMigrateHandler.setter(sub_2FBF4, v43);
  v44 = swift_allocObject(v73, 40, 7);
  *(_OWORD *)(v44 + 16) = v72;
  *(_QWORD *)(v44 + 32) = v33;
  aBlock[0] = v44;
  specialized Array._endMutation()(v44);
  v45 = (void *)aBlock[0];
  if (aBlock[0] >> 62)
  {
    if (aBlock[0] < 0)
      v66 = aBlock[0];
    else
      v66 = aBlock[0] & 0xFFFFFFFFFFFFFF8;
    v67 = sub_D854(0, &qword_3F260, NSMigrationStage_ptr);
    v68 = v33;
    swift_bridgeObjectRetain(v45, v69);
    v49._rawValue = (void *)_bridgeCocoaArray<A>(_:)(v66, v67);
    swift_bridgeObjectRelease(v45);
  }
  else
  {
    v46 = v33;
    v48 = swift_bridgeObjectRetain(v45, v47);
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v48);
    sub_D854(0, &qword_3F260, NSMigrationStage_ptr);
    v49._rawValue = v45;
  }
  swift_bridgeObjectRelease(v45);
  sub_D854(0, &qword_3F268, NSStagedMigrationManager_ptr);
  v73 = NSStagedMigrationManager.init(_:)(v49).super.isa;
  v50 = v80;
  objc_msgSend(v80, "setOption:forKey:", v73, NSPersistentStoreStagedMigrationManagerOptionKey);
  v51 = dispatch_semaphore_create(0);
  v52 = v38;
  v36(v38, v87, v37);
  v53 = (v39 + 16) & v71;
  v54 = (v79 + v53 + 7) & 0xFFFFFFFFFFFFFFF8;
  v55 = (v54 + 15) & 0xFFFFFFFFFFFFFFF8;
  v56 = (v55 + 15) & 0xFFFFFFFFFFFFFFF8;
  v57 = swift_allocObject(&unk_3A1C0, v56 + 8, v42);
  v70((char *)(v57 + v53), v52, v37);
  v58 = v81;
  *(_QWORD *)(v57 + v54) = v81;
  *(_QWORD *)(v57 + v55) = v50;
  *(_QWORD *)(v57 + v56) = v51;
  aBlock[4] = sub_2FCF0;
  v89 = v57;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2AAF0;
  aBlock[3] = &unk_3A1D8;
  v59 = _Block_copy(aBlock);
  v60 = v89;
  v61 = v50;
  v62 = v58;
  v63 = v51;
  swift_release(v60);
  objc_msgSend(v62, "loadPersistentStoresWithCompletionHandler:", v59);
  _Block_release(v59);
  v64 = v84;
  static DispatchTime.distantFuture.getter();
  OS_dispatch_semaphore.wait(timeout:)(v64);

  (*(void (**)(char *, uint64_t))(v85 + 8))(v64, v86);
  (*(void (**)(char *, uint64_t))(v83 + 8))(v87, v37);
  return v62;
}

uint64_t sub_2FB78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for URL(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 48) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_2FBF4(void *a1)
{
  type metadata accessor for URL(0);
  sub_29454(a1);
}

uint64_t sub_2FC54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v1 = type metadata accessor for URL(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return swift_deallocObject(v0, v8 + 8, v5);
}

Swift::Int sub_2FCF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v5 = *(_QWORD *)(type metadata accessor for URL(0) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_2A098(a1, a2, v2 + v6, *(void **)(v2 + v7), *(void **)(v2 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void **)(v2 + ((((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_2FD68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = type metadata accessor for URL(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return swift_deallocObject(v0, v6 + 8, v5);
}

Swift::Int sub_2FDDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(type metadata accessor for URL(0) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return sub_2A848(a1, a2, v2 + v6, *(_QWORD *)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)));
}

void sub_2FE3C()
{
  uint64_t *v0;

  sub_29534(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7]);
}

uint64_t sub_2FE60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int (*v9)(uint64_t, uint64_t, uint64_t);
  unint64_t v10;
  unint64_t v11;

  v1 = *(_QWORD *)(sub_44F0(&qword_3EAD0) - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (v2 + 24) & ~v2;
  v4 = *(_QWORD *)(v1 + 64);
  v5 = (v4 + v2 + v3) & ~v2;
  swift_release(*(_QWORD *)(v0 + 16));
  v6 = v0 + v3;
  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (!v9(v6, 1, v7))
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  if (!v9(v0 + v5, 1, v7))
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0 + v5, v7);
  v10 = (v4 + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v11 = (v10 + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_release(*(_QWORD *)(v0 + v10 + 8));
  swift_release(*(_QWORD *)(v0 + v11 + 8));
  return swift_deallocObject(v0, v11 + 16, v2 | 7);
}

uint64_t sub_2FF68(unint64_t a1, char a2)
{
  uint64_t v2;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a2 & 1;
  v5 = *(_QWORD *)(sub_44F0(&qword_3EAD0) - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (v6 + 24) & ~v6;
  v8 = *(_QWORD *)(v5 + 64);
  v9 = (v8 + v6 + v7) & ~v6;
  return sub_2D114(a1, v4, *(_QWORD *)(v2 + 16), v2 + v7, v2 + v9, *(void (**)(uint64_t, uint64_t *, uint64_t))(v2 + ((v8 + v9 + 7) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD **)(v2 + ((v8 + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8), *(void (**)(void))(v2 + ((((v8 + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v2 + ((((v8 + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_30004()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_30028()
{
  uint64_t v0;

  sub_2C7A4(v0);
}

uint64_t sub_30030()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_release(v0[4]);
  swift_bridgeObjectRelease(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

void sub_30064()
{
  uint64_t v0;

  sub_2C044(*(_QWORD *)(v0 + 16), *(void (**)(uint64_t, uint64_t))(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

uint64_t sub_30074()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

unint64_t sub_30084()
{
  unint64_t result;
  uint64_t v1;

  result = qword_3EA30;
  if (!qword_3EA30)
  {
    v1 = type metadata accessor for OS_dispatch_queue.Attributes(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue.Attributes, v1);
    atomic_store(result, (unint64_t *)&qword_3EA30);
  }
  return result;
}

unint64_t sub_300CC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_3F2B8;
  if (!qword_3F2B8)
  {
    v1 = sub_D854(255, (unint64_t *)&qword_3EE80, OS_dispatch_queue_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue, v1);
    atomic_store(result, (unint64_t *)&qword_3F2B8);
  }
  return result;
}

void sub_30124(uint64_t a1)
{
  uint64_t v1;

  sub_2B048(a1, v1);
}

uint64_t sub_3012C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_30150()
{
  uint64_t v0;

  sub_2B284(*(void **)(v0 + 16));
}

uint64_t sub_30158()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

id sub_301F0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CDCloudSyncHistory();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CDCloudSyncHistory()
{
  return objc_opt_self(BMCDCloudSyncHistory);
}

id objc_msgSend_addDonorObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDonorObserver:");
}

id objc_msgSend_donateWithConfiguration_context_donationCompleteBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateWithConfiguration:context:donationCompleteBlock:");
}

id objc_msgSend_donor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donor");
}

id objc_msgSend_eventConfigurations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventConfigurations");
}

id objc_msgSend_initWithDirectory_shouldRunUpdatesOnSchedule_shouldPurgeOutdatedData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDirectory:shouldRunUpdatesOnSchedule:shouldPurgeOutdatedData:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_isObservedBy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isObservedBy:");
}

id objc_msgSend_propertyDidChange_propertyConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyDidChange:propertyConfiguration:");
}

id objc_msgSend_removeDonorObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDonorObserver:");
}

id objc_msgSend_setDonor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDonor:");
}

id objc_msgSend_setEventConfigurations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventConfigurations:");
}

id objc_msgSend_setManagerConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManagerConfiguration:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}
