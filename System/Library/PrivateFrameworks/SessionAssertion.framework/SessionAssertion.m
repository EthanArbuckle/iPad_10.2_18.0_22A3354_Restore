uint64_t FakeForegroundInvalidationState.activityIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

SessionAssertion::FakeForegroundInvalidationState __swiftcall FakeForegroundInvalidationState.init(activityIdentifiers:)(SessionAssertion::FakeForegroundInvalidationState activityIdentifiers)
{
  SessionAssertion::FakeForegroundInvalidationState *v1;

  v1->activityIdentifiers._rawValue = activityIdentifiers.activityIdentifiers._rawValue;
  return activityIdentifiers;
}

uint64_t sub_1B40A2530()
{
  return 1;
}

uint64_t sub_1B40A2538()
{
  sub_1B40BCDE0();
  sub_1B40BCDEC();
  return sub_1B40BCE10();
}

uint64_t sub_1B40A2578()
{
  return sub_1B40BCDEC();
}

uint64_t sub_1B40A259C()
{
  sub_1B40BCDE0();
  sub_1B40BCDEC();
  return sub_1B40BCE10();
}

unint64_t sub_1B40A25D8()
{
  return 0xD000000000000013;
}

uint64_t sub_1B40A25F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B40A2CB4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1B40A261C()
{
  return 0;
}

void sub_1B40A2628(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1B40A2634()
{
  sub_1B40A2808();
  return sub_1B40BCE34();
}

uint64_t sub_1B40A265C()
{
  sub_1B40A2808();
  return sub_1B40BCE40();
}

uint64_t FakeForegroundInvalidationState.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BB60);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B40A2808();
  sub_1B40BCE28();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BB70);
  sub_1B40A29F0(&qword_1EF08BB78, MEMORY[0x1E0DEA970], MEMORY[0x1E0DEAF10]);
  sub_1B40BCD50();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1B5E363D4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
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

unint64_t sub_1B40A2808()
{
  unint64_t result;

  result = qword_1EF08BB68;
  if (!qword_1EF08BB68)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BD924, &type metadata for FakeForegroundInvalidationState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BB68);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1B5E363E0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t FakeForegroundInvalidationState.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[2];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BB80);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B40A2808();
  sub_1B40BCE1C();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BB70);
    sub_1B40A29F0(&qword_1EF08BB88, MEMORY[0x1E0DEA9A0], MEMORY[0x1E0DEAF40]);
    sub_1B40BCCE4();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
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

uint64_t sub_1B40A29F0(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF08BB70);
    v8 = a2;
    result = MEMORY[0x1B5E363EC](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B40A2A50@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return FakeForegroundInvalidationState.init(from:)(a1, a2);
}

uint64_t sub_1B40A2A64(_QWORD *a1)
{
  return FakeForegroundInvalidationState.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for FakeForegroundInvalidationState()
{
  return &type metadata for FakeForegroundInvalidationState;
}

void type metadata accessor for os_unfair_lock_s()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1ED502698)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1ED502698);
  }
}

uint64_t getEnumTagSinglePayload for FakeForegroundInvalidationState.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FakeForegroundInvalidationState.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1B40A2B74 + 4 * byte_1B40BD7A0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1B40A2B94 + 4 * byte_1B40BD7A5[v4]))();
}

_BYTE *sub_1B40A2B74(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1B40A2B94(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B40A2B9C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B40A2BA4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B40A2BAC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B40A2BB4(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1B40A2BC0()
{
  return 0;
}

ValueMetadata *type metadata accessor for FakeForegroundInvalidationState.CodingKeys()
{
  return &type metadata for FakeForegroundInvalidationState.CodingKeys;
}

unint64_t sub_1B40A2BE0()
{
  unint64_t result;

  result = qword_1EF08BC50;
  if (!qword_1EF08BC50)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BD8FC, &type metadata for FakeForegroundInvalidationState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BC50);
  }
  return result;
}

unint64_t sub_1B40A2C28()
{
  unint64_t result;

  result = qword_1EF08BC58;
  if (!qword_1EF08BC58)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BD86C, &type metadata for FakeForegroundInvalidationState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BC58);
  }
  return result;
}

unint64_t sub_1B40A2C70()
{
  unint64_t result;

  result = qword_1EF08BC60;
  if (!qword_1EF08BC60)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BD894, &type metadata for FakeForegroundInvalidationState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BC60);
  }
  return result;
}

uint64_t sub_1B40A2CB4(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000013 && a2 == 0x80000001B40BFCB0)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_1B40BCD80();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

double AssertionReconnectProperties.identifier.getter@<D0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(v1 + 8);
  result = *(double *)v1;
  *a1 = *(_QWORD *)v1;
  a1[1] = v2;
  return result;
}

uint64_t AssertionReconnectProperties.request.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for AssertionReconnectProperties() + 20);
  return sub_1B40A2DB8(v3, a1);
}

uint64_t type metadata accessor for AssertionReconnectProperties()
{
  uint64_t result;

  result = qword_1ED502778;
  if (!qword_1ED502778)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B40A2DB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AssertionAcquisitionRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t AssertionReconnectProperties.init(identifier:request:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1[1];
  *a3 = *a1;
  a3[1] = v5;
  v6 = type metadata accessor for AssertionReconnectProperties();
  return sub_1B40A345C(a2, (uint64_t)a3 + *(int *)(v6 + 20), (uint64_t (*)(_QWORD))type metadata accessor for AssertionAcquisitionRequest);
}

BOOL sub_1B40A2E4C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1B40A2E64()
{
  sub_1B40BCDE0();
  sub_1B40BCDEC();
  return sub_1B40BCE10();
}

uint64_t sub_1B40A2EA8()
{
  return sub_1B40BCDEC();
}

uint64_t sub_1B40A2ED0()
{
  sub_1B40BCDE0();
  sub_1B40BCDEC();
  return sub_1B40BCE10();
}

uint64_t sub_1B40A2F10()
{
  _BYTE *v0;

  if (*v0)
    return 0x74736575716572;
  else
    return 0x696669746E656469;
}

uint64_t sub_1B40A2F50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B40A3D40(a1, a2);
  *a3 = result;
  return result;
}

void sub_1B40A2F74(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1B40A2F80()
{
  sub_1B40A3144();
  return sub_1B40BCE34();
}

uint64_t sub_1B40A2FA8()
{
  sub_1B40A3144();
  return sub_1B40BCE40();
}

uint64_t AssertionReconnectProperties.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE v11[16];
  uint64_t v12;
  uint64_t v13;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BC68);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B40A3144();
  sub_1B40BCE28();
  v9 = v3[1];
  v12 = *v3;
  v13 = v9;
  v11[15] = 0;
  sub_1B40A3188();
  sub_1B40BCD50();
  if (!v2)
  {
    type metadata accessor for AssertionReconnectProperties();
    LOBYTE(v12) = 1;
    type metadata accessor for AssertionAcquisitionRequest();
    sub_1B40A391C(&qword_1ED502428, (uint64_t (*)(uint64_t))type metadata accessor for AssertionAcquisitionRequest, (uint64_t)"!1k2|$");
    sub_1B40BCD50();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_1B40A3144()
{
  unint64_t result;

  result = qword_1EF08BC70;
  if (!qword_1EF08BC70)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BDCD8, &type metadata for AssertionReconnectProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BC70);
  }
  return result;
}

unint64_t sub_1B40A3188()
{
  unint64_t result;

  result = qword_1ED5026D8;
  if (!qword_1ED5026D8)
  {
    result = MEMORY[0x1B5E363EC]("e5k2$*", &type metadata for AssertionIdentifier);
    atomic_store(result, (unint64_t *)&qword_1ED5026D8);
  }
  return result;
}

uint64_t AssertionReconnectProperties.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  v19 = a2;
  v21 = type metadata accessor for AssertionAcquisitionRequest();
  MEMORY[0x1E0C80A78]();
  v20 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BC78);
  v5 = *(_QWORD *)(v22 - 8);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for AssertionReconnectProperties();
  MEMORY[0x1E0C80A78]();
  v10 = (uint64_t *)((char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B40A3144();
  sub_1B40BCE1C();
  if (!v2)
  {
    v18 = v8;
    v11 = v5;
    v12 = (uint64_t)v20;
    v25 = 0;
    sub_1B40A3418();
    v13 = v22;
    sub_1B40BCCE4();
    v14 = v24;
    *v10 = v23;
    v10[1] = v14;
    LOBYTE(v23) = 1;
    sub_1B40A391C(&qword_1ED502520, (uint64_t (*)(uint64_t))type metadata accessor for AssertionAcquisitionRequest, (uint64_t)&protocol conformance descriptor for AssertionAcquisitionRequest);
    sub_1B40BCCE4();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v13);
    v15 = v19;
    sub_1B40A345C(v12, (uint64_t)v10 + *(int *)(v18 + 20), (uint64_t (*)(_QWORD))type metadata accessor for AssertionAcquisitionRequest);
    sub_1B40A345C((uint64_t)v10, v15, (uint64_t (*)(_QWORD))type metadata accessor for AssertionReconnectProperties);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_1B40A3418()
{
  unint64_t result;

  result = qword_1ED5026E8;
  if (!qword_1ED5026E8)
  {
    result = MEMORY[0x1B5E363EC]("}5k2L*", &type metadata for AssertionIdentifier);
    atomic_store(result, (unint64_t *)&qword_1ED5026E8);
  }
  return result;
}

uint64_t sub_1B40A345C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1B40A34A0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return AssertionReconnectProperties.init(from:)(a1, a2);
}

uint64_t sub_1B40A34B4(_QWORD *a1)
{
  return AssertionReconnectProperties.encode(to:)(a1);
}

uint64_t AssertionReconnectRequest.assertions.getter()
{
  return swift_bridgeObjectRetain();
}

SessionAssertion::AssertionReconnectRequest __swiftcall AssertionReconnectRequest.init(assertions:)(SessionAssertion::AssertionReconnectRequest assertions)
{
  SessionAssertion::AssertionReconnectRequest *v1;

  v1->assertions._rawValue = assertions.assertions._rawValue;
  return assertions;
}

uint64_t sub_1B40A34D8()
{
  return 0x6F69747265737361;
}

uint64_t sub_1B40A34F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6F69747265737361 && a2 == 0xEA0000000000736ELL)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_1B40BCD80();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1B40A3594()
{
  sub_1B40A370C();
  return sub_1B40BCE34();
}

uint64_t sub_1B40A35BC()
{
  sub_1B40A370C();
  return sub_1B40BCE40();
}

uint64_t AssertionReconnectRequest.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5024D8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B40A370C();
  sub_1B40BCE28();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502828);
  sub_1B40A3898(&qword_1ED502480, &qword_1ED502430, (uint64_t)&protocol conformance descriptor for AssertionReconnectProperties, MEMORY[0x1E0DEAF10]);
  sub_1B40BCD50();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1B40A370C()
{
  unint64_t result;

  result = qword_1ED5026F0;
  if (!qword_1ED5026F0)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BDC88, &type metadata for AssertionReconnectRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5026F0);
  }
  return result;
}

uint64_t AssertionReconnectRequest.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[2];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502550);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B40A370C();
  sub_1B40BCE1C();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502828);
    sub_1B40A3898(&qword_1ED502548, &qword_1ED502528, (uint64_t)&protocol conformance descriptor for AssertionReconnectProperties, MEMORY[0x1E0DEAF40]);
    sub_1B40BCCE4();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1B40A3898(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED502828);
    v10 = sub_1B40A391C(a2, (uint64_t (*)(uint64_t))type metadata accessor for AssertionReconnectProperties, a3);
    result = MEMORY[0x1B5E363EC](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B40A391C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1B5E363EC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B40A395C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return AssertionReconnectRequest.init(from:)(a1, a2);
}

uint64_t sub_1B40A3970(_QWORD *a1)
{
  return AssertionReconnectRequest.encode(to:)(a1);
}

NSData __swiftcall AssertionReconnectRequest._bridgeToObjectiveC()()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;

  sub_1B40BC864();
  swift_allocObject();
  sub_1B40BC858();
  sub_1B40A3A3C();
  v0 = sub_1B40BC84C();
  v2 = v1;
  v3 = sub_1B40BC8D0();
  sub_1B40A3A80(v0, v2);
  swift_release();
  return (NSData)v3;
}

unint64_t sub_1B40A3A3C()
{
  unint64_t result;

  result = qword_1ED502410;
  if (!qword_1ED502410)
  {
    result = MEMORY[0x1B5E363EC]("5Gk2t:", &type metadata for AssertionReconnectRequest);
    atomic_store(result, (unint64_t *)&qword_1ED502410);
  }
  return result;
}

uint64_t sub_1B40A3A80(uint64_t a1, unint64_t a2)
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

uint64_t static AssertionReconnectRequest._unconditionallyBridgeFromObjectiveC(_:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;

  if (a1)
  {
    sub_1B40BC840();
    swift_allocObject();
    sub_1B40BC834();
    v3 = sub_1B40BC8DC();
    v5 = v4;
    sub_1B40A4004();
    sub_1B40BC828();
    sub_1B40A3A80(v3, v5);
    result = swift_release();
    *a2 = v7;
  }
  else
  {
    __break(1u);
    result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

uint64_t sub_1B40A3BA4()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;

  sub_1B40BC864();
  swift_allocObject();
  sub_1B40BC858();
  sub_1B40A3A3C();
  v0 = sub_1B40BC84C();
  v2 = v1;
  v3 = sub_1B40BC8D0();
  sub_1B40A3A80(v0, v2);
  swift_release();
  return v3;
}

uint64_t sub_1B40A3C64@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;

  if (a1)
  {
    sub_1B40BC840();
    swift_allocObject();
    sub_1B40BC834();
    v3 = sub_1B40BC8DC();
    v5 = v4;
    sub_1B40A4004();
    sub_1B40BC828();
    sub_1B40A3A80(v3, v5);
    result = swift_release();
    *a2 = v7;
  }
  else
  {
    __break(1u);
    result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

uint64_t sub_1B40A3D40(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_1B40BCD80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74736575716572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1B40BCD80();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t _s16SessionAssertion0B16ReconnectRequestV26_forceBridgeFromObjectiveC_6resultySo6NSDataC_ACSgztFZ_0(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;

  sub_1B40BC840();
  swift_allocObject();
  sub_1B40BC834();
  v3 = sub_1B40BC8DC();
  v5 = v4;
  sub_1B40A4004();
  sub_1B40BC828();
  swift_bridgeObjectRelease();
  sub_1B40A3A80(v3, v5);
  result = swift_release();
  *a2 = v7;
  return result;
}

uint64_t _s16SessionAssertion0B16ReconnectRequestV34_conditionallyBridgeFromObjectiveC_6resultSbSo6NSDataC_ACSgztFZ_0(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;

  swift_bridgeObjectRelease();
  sub_1B40BC840();
  swift_allocObject();
  sub_1B40BC834();
  v3 = sub_1B40BC8DC();
  v5 = v4;
  sub_1B40A4004();
  sub_1B40BC828();
  swift_release();
  sub_1B40A3A80(v3, v5);
  result = 1;
  *a2 = v7;
  return result;
}

unint64_t sub_1B40A4004()
{
  unint64_t result;

  result = qword_1ED502510;
  if (!qword_1ED502510)
  {
    result = MEMORY[0x1B5E363EC](&protocol conformance descriptor for AssertionReconnectRequest, &type metadata for AssertionReconnectRequest);
    atomic_store(result, (unint64_t *)&qword_1ED502510);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AssertionReconnectProperties(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char *v27;
  char *v28;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v15 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v15 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_1B40BC8F4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
    v9 = (int *)type metadata accessor for AssertionAcquisitionRequest();
    v10 = v9[5];
    v11 = &v6[v10];
    v12 = &v7[v10];
    v13 = type metadata accessor for AssertionAttribute();
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v14 = sub_1B40BC918();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    v16 = v9[6];
    v17 = &v6[v16];
    v18 = &v7[v16];
    v19 = *((_QWORD *)v18 + 1);
    *(_QWORD *)v17 = *(_QWORD *)v18;
    *((_QWORD *)v17 + 1) = v19;
    v20 = v9[7];
    v21 = &v6[v20];
    v22 = &v7[v20];
    v23 = *(_QWORD *)v22;
    v24 = *((_QWORD *)v22 + 1);
    v25 = v22[16];
    swift_bridgeObjectRetain();
    sub_1B40A41C0();
    *(_QWORD *)v21 = v23;
    *((_QWORD *)v21 + 1) = v24;
    v21[16] = v25;
    v26 = v9[8];
    v27 = &v6[v26];
    v28 = &v7[v26];
    *(_QWORD *)v27 = *(_QWORD *)v28;
    v27[8] = v28[8];
  }
  return v3;
}

uint64_t sub_1B40A41C0()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for AssertionReconnectProperties(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_1B40BC8F4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  v4 = v2 + *(int *)(type metadata accessor for AssertionAcquisitionRequest() + 20);
  type metadata accessor for AssertionAttribute();
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v5 = sub_1B40BC918();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  return sub_1B40A4278();
}

uint64_t sub_1B40A4278()
{
  return swift_bridgeObjectRelease();
}

_OWORD *initializeWithCopy for AssertionReconnectProperties(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char *v25;
  char *v26;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1B40BC8F4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  v8 = (int *)type metadata accessor for AssertionAcquisitionRequest();
  v9 = v8[5];
  v10 = &v5[v9];
  v11 = &v6[v9];
  v12 = type metadata accessor for AssertionAttribute();
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v13 = sub_1B40BC918();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v10, v11, v13);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  v14 = v8[6];
  v15 = &v5[v14];
  v16 = &v6[v14];
  v17 = *((_QWORD *)v16 + 1);
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *((_QWORD *)v15 + 1) = v17;
  v18 = v8[7];
  v19 = &v5[v18];
  v20 = &v6[v18];
  v21 = *(_QWORD *)v20;
  v22 = *((_QWORD *)v20 + 1);
  v23 = v20[16];
  swift_bridgeObjectRetain();
  sub_1B40A41C0();
  *(_QWORD *)v19 = v21;
  *((_QWORD *)v19 + 1) = v22;
  v19[16] = v23;
  v24 = v8[8];
  v25 = &v5[v24];
  v26 = &v6[v24];
  *(_QWORD *)v25 = *(_QWORD *)v26;
  v25[8] = v26[8];
  return a1;
}

uint64_t assignWithCopy for AssertionReconnectProperties(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v5 = *(int *)(a3 + 20);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = sub_1B40BC8F4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 24))(v6, v7, v8);
  v9 = type metadata accessor for AssertionAcquisitionRequest();
  v10 = (int *)v9;
  if (a1 != a2)
  {
    v11 = *(int *)(v9 + 20);
    v12 = (void *)(v6 + v11);
    v13 = (const void *)(v7 + v11);
    sub_1B40A455C(v6 + v11);
    v14 = type metadata accessor for AssertionAttribute();
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v15 = sub_1B40BC918();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v12, v13, v15);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
  }
  v16 = v10[6];
  v17 = (_QWORD *)(v6 + v16);
  v18 = (_QWORD *)(v7 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = v10[7];
  v20 = v6 + v19;
  v21 = (uint64_t *)(v7 + v19);
  v22 = *v21;
  v23 = v21[1];
  v24 = *((_BYTE *)v21 + 16);
  sub_1B40A41C0();
  *(_QWORD *)v20 = v22;
  *(_QWORD *)(v20 + 8) = v23;
  *(_BYTE *)(v20 + 16) = v24;
  sub_1B40A4278();
  v25 = v10[8];
  v26 = v6 + v25;
  v27 = (uint64_t *)(v7 + v25);
  v28 = *v27;
  *(_BYTE *)(v26 + 8) = *((_BYTE *)v27 + 8);
  *(_QWORD *)v26 = v28;
  return a1;
}

uint64_t sub_1B40A455C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AssertionAttribute();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *initializeWithTake for AssertionReconnectProperties(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1B40BC8F4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  v8 = (int *)type metadata accessor for AssertionAcquisitionRequest();
  v9 = v8[5];
  v10 = &v5[v9];
  v11 = &v6[v9];
  v12 = type metadata accessor for AssertionAttribute();
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v13 = sub_1B40BC918();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v10, v11, v13);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  *(_OWORD *)&v5[v8[6]] = *(_OWORD *)&v6[v8[6]];
  v14 = v8[7];
  v15 = &v5[v14];
  v16 = &v6[v14];
  v15[16] = v16[16];
  *(_OWORD *)v15 = *(_OWORD *)v16;
  v17 = v8[8];
  v18 = &v5[v17];
  v19 = &v6[v17];
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v18[8] = v19[8];
  return a1;
}

_QWORD *assignWithTake for AssertionReconnectProperties(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  char v24;
  uint64_t v25;
  char *v26;
  char *v27;

  *a1 = *a2;
  a1[1] = a2[1];
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_1B40BC8F4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 40))(v6, v7, v8);
  v9 = type metadata accessor for AssertionAcquisitionRequest();
  v10 = (int *)v9;
  if (a1 != a2)
  {
    v11 = *(int *)(v9 + 20);
    v12 = &v6[v11];
    v13 = &v7[v11];
    sub_1B40A455C((uint64_t)&v6[v11]);
    v14 = type metadata accessor for AssertionAttribute();
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v15 = sub_1B40BC918();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v12, v13, v15);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
  }
  v16 = v10[6];
  v17 = &v6[v16];
  v18 = &v7[v16];
  v20 = *(_QWORD *)v18;
  v19 = *((_QWORD *)v18 + 1);
  *(_QWORD *)v17 = v20;
  *((_QWORD *)v17 + 1) = v19;
  swift_bridgeObjectRelease();
  v21 = v10[7];
  v22 = &v6[v21];
  v23 = &v7[v21];
  v24 = v23[16];
  *(_OWORD *)v22 = *(_OWORD *)v23;
  v22[16] = v24;
  sub_1B40A4278();
  v25 = v10[8];
  v26 = &v6[v25];
  v27 = &v7[v25];
  *(_QWORD *)v26 = *(_QWORD *)v27;
  v26[8] = v27[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for AssertionReconnectProperties()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B40A483C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a3 + 20);
  v5 = type metadata accessor for AssertionAcquisitionRequest();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, a2, v5);
}

uint64_t storeEnumTagSinglePayload for AssertionReconnectProperties()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B40A4888(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + *(int *)(a4 + 20);
  v6 = type metadata accessor for AssertionAcquisitionRequest();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, a2, a2, v6);
}

uint64_t sub_1B40A48CC()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for AssertionAcquisitionRequest();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AssertionReconnectRequest()
{
  return &type metadata for AssertionReconnectRequest;
}

uint64_t storeEnumTagSinglePayload for AssertionReconnectRequest.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1B40A4990 + 4 * byte_1B40BD980[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1B40A49B0 + 4 * byte_1B40BD985[v4]))();
}

_BYTE *sub_1B40A4990(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1B40A49B0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B40A49B8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B40A49C0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B40A49C8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B40A49D0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AssertionReconnectRequest.CodingKeys()
{
  return &type metadata for AssertionReconnectRequest.CodingKeys;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AssertionReconnectProperties.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AssertionReconnectProperties.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B40A4AD4 + 4 * byte_1B40BD98F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B40A4B08 + 4 * byte_1B40BD98A[v4]))();
}

uint64_t sub_1B40A4B08(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B40A4B10(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B40A4B18);
  return result;
}

uint64_t sub_1B40A4B24(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B40A4B2CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B40A4B30(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B40A4B38(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B40A4B44(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1B40A4B4C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AssertionReconnectProperties.CodingKeys()
{
  return &type metadata for AssertionReconnectProperties.CodingKeys;
}

unint64_t sub_1B40A4B6C()
{
  unint64_t result;

  result = qword_1EF08BC80;
  if (!qword_1EF08BC80)
  {
    result = MEMORY[0x1B5E363EC]("!Fk2 9", &type metadata for AssertionReconnectProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BC80);
  }
  return result;
}

unint64_t sub_1B40A4BB4()
{
  unint64_t result;

  result = qword_1EF08BC88;
  if (!qword_1EF08BC88)
  {
    result = MEMORY[0x1B5E363EC]("iEk2D8", &type metadata for AssertionReconnectRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BC88);
  }
  return result;
}

unint64_t sub_1B40A4BFC()
{
  unint64_t result;

  result = qword_1ED502700;
  if (!qword_1ED502700)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BDBD0, &type metadata for AssertionReconnectRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED502700);
  }
  return result;
}

unint64_t sub_1B40A4C44()
{
  unint64_t result;

  result = qword_1ED5026F8;
  if (!qword_1ED5026F8)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BDBF8, &type metadata for AssertionReconnectRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5026F8);
  }
  return result;
}

unint64_t sub_1B40A4C8C()
{
  unint64_t result;

  result = qword_1EF08BC90;
  if (!qword_1EF08BC90)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BDB18, &type metadata for AssertionReconnectProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BC90);
  }
  return result;
}

unint64_t sub_1B40A4CD4()
{
  unint64_t result;

  result = qword_1EF08BC98;
  if (!qword_1EF08BC98)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BDB40, &type metadata for AssertionReconnectProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BC98);
  }
  return result;
}

uint64_t sub_1B40A4D18()
{
  uint64_t v0;

  v0 = sub_1B40BC954();
  __swift_allocate_value_buffer(v0, qword_1ED502720);
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED502720);
  return sub_1B40BC948();
}

uint64_t static AssertionServiceDefinition.domain.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1ED502738 != -1)
    swift_once();
  v2 = sub_1B40BC954();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED502720);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t static AssertionServiceDefinition.serviceName.getter()
{
  return 0xD00000000000001FLL;
}

uint64_t sub_1B40A4E04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1ED502738 != -1)
    swift_once();
  v2 = sub_1B40BC954();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED502720);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

unint64_t sub_1B40A4E74()
{
  return 0xD00000000000001FLL;
}

ValueMetadata *type metadata accessor for AssertionServiceDefinition()
{
  return &type metadata for AssertionServiceDefinition;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1B40A4F34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;

  sub_1B40BCBE8();
  sub_1B40BCA14();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B40BCA14();
  swift_bridgeObjectRelease();
  sub_1B40BCA14();
  v1 = OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_attributeAssertion;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BCB0);
  sub_1B40BC9F0();
  sub_1B40BCA14();
  swift_bridgeObjectRelease();
  sub_1B40BCA14();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B40BCA14();
  swift_bridgeObjectRelease();
  sub_1B40BCA14();
  v2 = *(_QWORD *)(v0 + v1);
  if (v2)
  {
    v3 = *(os_unfair_lock_s **)(*(_QWORD *)(v2 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
    swift_retain();
    os_unfair_lock_lock(v3);
    os_unfair_lock_unlock(v3);
    swift_release();
  }
  sub_1B40BC9F0();
  sub_1B40BCA14();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1B40A51A0()
{
  return sub_1B40A5284(&OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_activityIdentifier);
}

uint64_t sub_1B40A51B8(uint64_t a1, uint64_t a2)
{
  return sub_1B40A5354(a1, a2, &OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_activityIdentifier);
}

uint64_t (*sub_1B40A51C4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_1B40A5214()
{
  void *v0;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v0 = (void *)sub_1B40BC9D8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B40A5278()
{
  return sub_1B40A5284(&OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_explanation);
}

uint64_t sub_1B40A5284(_QWORD *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_1B40A52E0(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;

  v6 = sub_1B40BC9E4();
  v8 = v7;
  v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  *v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B40A5348(uint64_t a1, uint64_t a2)
{
  return sub_1B40A5354(a1, a2, &OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_explanation);
}

uint64_t sub_1B40A5354(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)(v3 + *a3);
  swift_beginAccess();
  *v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B40A53AC(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v6 = *a1;
  v5 = a1[1];
  v7 = (_QWORD *)(*a2 + *a5);
  swift_beginAccess();
  *v7 = v6;
  v7[1] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B40A5410())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1B40A5458@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_attributeAssertion);
  if (v3)
  {
    v4 = *(os_unfair_lock_s **)(*(_QWORD *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
    swift_retain();
    os_unfair_lock_lock(v4);
    v5 = *(_QWORD *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
    v6 = *(_BYTE *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
    os_unfair_lock_unlock(v4);
    result = swift_release();
  }
  else
  {
    v5 = 0;
    v6 = 1;
  }
  *(_QWORD *)a1 = v5;
  *(_BYTE *)(a1 + 8) = v6;
  return result;
}

char *DisableAPIThrottlingAssertion.__allocating_init(explanation:activityIdentifier:invalidationHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  id v13;

  v13 = objc_allocWithZone(v6);
  return DisableAPIThrottlingAssertion.init(explanation:activityIdentifier:invalidationHandler:)(a1, a2, a3, a4, a5, a6);
}

char *DisableAPIThrottlingAssertion.init(explanation:activityIdentifier:invalidationHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char *v6;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t *v20;
  uint64_t *v21;
  objc_class *v22;
  id v23;
  _QWORD *v24;
  char *v25;
  uint64_t v26;
  uint64_t v29[2];
  char v30;
  objc_super v31;

  v13 = type metadata accessor for AssertionAttribute();
  v14 = MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v29[-1] - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v29[-1] - v17;
  *(_QWORD *)&v6[OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_attributeAssertion] = 0;
  v19 = &v6[OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_invalidationHandler];
  *(_QWORD *)v19 = 0;
  *((_QWORD *)v19 + 1) = 0;
  v20 = (uint64_t *)&v6[OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_activityIdentifier];
  *v20 = a3;
  v20[1] = a4;
  v21 = (uint64_t *)&v6[OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_explanation];
  *v21 = a1;
  v21[1] = a2;
  v22 = (objc_class *)type metadata accessor for DisableAPIThrottlingAssertion();
  v31.receiver = v6;
  v31.super_class = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v23 = objc_msgSendSuper2(&v31, sel_init);
  swift_storeEnumTagMultiPayload();
  v29[0] = a3;
  v29[1] = a4;
  v30 = 1;
  sub_1B40A5C78((uint64_t)v18, (uint64_t)v16);
  v24 = (_QWORD *)swift_allocObject();
  v24[2] = a5;
  v24[3] = a6;
  v24[4] = v23;
  type metadata accessor for AttributeAssertion();
  swift_allocObject();
  v25 = (char *)v23;
  v26 = sub_1B40B685C(a1, a2, v29, (uint64_t)v16, 0x403E000000000000, 0, (uint64_t)sub_1B40A5CF0, (uint64_t)v24);
  swift_release();
  sub_1B40A455C((uint64_t)v18);
  *(_QWORD *)&v25[OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_attributeAssertion] = v26;
  swift_release();
  return v25;
}

uint64_t sub_1B40A573C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t), uint64_t a4, uint64_t a5)
{
  uint64_t result;

  if (a3)
  {
    swift_retain();
    a3(a5, a2);
    return sub_1B40A5F54((uint64_t)a3);
  }
  return result;
}

uint64_t sub_1B40A5838()
{
  uint64_t v0;
  uint64_t result;

  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_attributeAssertion))
  {
    swift_retain();
    sub_1B40B6554();
    return swift_release();
  }
  return result;
}

uint64_t sub_1B40A58FC()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  unint64_t v3;
  char v4;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_attributeAssertion);
  if (!v1)
    return 0;
  v2 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
  v4 = *(_BYTE *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
  os_unfair_lock_unlock(v2);
  swift_release();
  if ((v4 & 1) != 0)
    return 0;
  if (v3 < 8)
    return qword_1B40BDE28[v3];
  result = sub_1B40BCD8C();
  __break(1u);
  return result;
}

uint64_t sub_1B40A59F4()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  int v4;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_attributeAssertion);
  if (!v1)
    return 0;
  v2 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
  v4 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
  os_unfair_lock_unlock(v2);
  swift_release();
  if (v4 == 1)
    return v3 != 0;
  else
    return 2;
}

uint64_t sub_1B40A5AF8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_activityIdentifier);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

id DisableAPIThrottlingAssertion.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void DisableAPIThrottlingAssertion.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id DisableAPIThrottlingAssertion.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DisableAPIThrottlingAssertion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DisableAPIThrottlingAssertion()
{
  return objc_opt_self();
}

uint64_t sub_1B40A5C78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AssertionAttribute();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B40A5CBC()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();

  return swift_deallocObject();
}

uint64_t sub_1B40A5CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1B40A573C(a1, a2, *(void (**)(uint64_t, uint64_t))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_1B40A5CFC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_activityIdentifier, a2);
}

uint64_t sub_1B40A5D08(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1B40A53AC(a1, a2, a3, a4, &OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_activityIdentifier);
}

uint64_t sub_1B40A5D24@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_explanation, a2);
}

uint64_t keypath_getTm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)(*a1 + *a2);
  swift_beginAccess();
  v5 = v4[1];
  *a3 = *v4;
  a3[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B40A5D80(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1B40A53AC(a1, a2, a3, a4, &OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_explanation);
}

uint64_t method lookup function for DisableAPIThrottlingAssertion()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.activityIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.activityIdentifier.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.activityIdentifier.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.explanation.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.explanation.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.explanation.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.state.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.__allocating_init(explanation:activityIdentifier:invalidationHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.invalidate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.snaInvalidationReason.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.snaState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.snaSessionIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t sub_1B40A5EE4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1B40A5F08(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = (id)sub_1B40BC8B8();
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a1, v4);

}

uint64_t sub_1B40A5F54(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_1B40A5F68()
{
  uint64_t v0;

  MEMORY[0x1B5E3647C](*(_QWORD *)(v0 + 16), -1, -1);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UnfairLock()
{
  return objc_opt_self();
}

BOOL static AssertionError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AssertionError.hash(into:)()
{
  return sub_1B40BCDEC();
}

uint64_t AssertionError.hashValue.getter()
{
  sub_1B40BCDE0();
  sub_1B40BCDEC();
  return sub_1B40BCE10();
}

BOOL sub_1B40A6034(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_1B40A604C()
{
  unint64_t result;

  result = qword_1EF08BCF0;
  if (!qword_1EF08BCF0)
  {
    result = MEMORY[0x1B5E363EC](&protocol conformance descriptor for AssertionError, &type metadata for AssertionError);
    atomic_store(result, (unint64_t *)&qword_1EF08BCF0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AssertionError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AssertionError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_1B40A617C + 4 * byte_1B40BDEA5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1B40A61B0 + 4 * asc_1B40BDEA0[v4]))();
}

uint64_t sub_1B40A61B0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B40A61B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B40A61C0);
  return result;
}

uint64_t sub_1B40A61CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B40A61D4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1B40A61D8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B40A61E0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1B40A61EC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AssertionError()
{
  return &type metadata for AssertionError;
}

uint64_t OpaqueObjectiveCBridgable<>._bridgeToObjectiveC()()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;

  sub_1B40BC8AC();
  swift_allocObject();
  sub_1B40BC8A0();
  v0 = sub_1B40BC894();
  v2 = v1;
  v3 = sub_1B40BC8D0();
  sub_1B40A3A80(v0, v2);
  swift_release();
  return v3;
}

uint64_t static OpaqueObjectiveCBridgable<>._forceBridgeFromObjectiveC(_:result:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;

  v5 = sub_1B40BCB70();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v13 - v7;
  sub_1B40BC888();
  swift_allocObject();
  sub_1B40BC87C();
  v9 = sub_1B40BC8DC();
  v11 = v10;
  sub_1B40BC870();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v5);
  sub_1B40A3A80(v9, v11);
  swift_release();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(v8, 0, 1, a3);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a2, v8, v5);
}

BOOL static OpaqueObjectiveCBridgable<>._conditionallyBridgeFromObjectiveC(_:result:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  _QWORD v18[2];

  v5 = sub_1B40BCB70();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)v18 - v10;
  v18[0] = *(_QWORD *)(v6 + 8);
  ((void (*)(uint64_t, uint64_t))v18[0])(a2, v5);
  sub_1B40BC888();
  swift_allocObject();
  sub_1B40BC87C();
  v12 = sub_1B40BC8DC();
  v14 = v13;
  sub_1B40BC870();
  swift_release();
  sub_1B40A3A80(v12, v14);
  v15 = *(_QWORD *)(a3 - 8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v11, 0, 1, a3);
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(a2, v11, v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, a2, v5);
  v16 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v9, 1, a3) != 1;
  ((void (*)(char *, uint64_t))v18[0])(v9, v5);
  return v16;
}

uint64_t static OpaqueObjectiveCBridgable<>._unconditionallyBridgeFromObjectiveC(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;

  v6 = sub_1B40BCB70();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v15 - v11;
  v13 = *(_QWORD *)(a2 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))((char *)&v15 - v11, 1, 1, a2);
  if (a1)
  {
    sub_1B40BCC90();
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, a2);
    if ((_DWORD)result != 1)
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a3, v10, a2);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t AssertionReconnectResponse.map.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AssertionReconnectResponse.init(map:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_1B40A66F8()
{
  return 7364973;
}

uint64_t sub_1B40A6708@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 7364973 && a2 == 0xE300000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_1B40BCD80();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1B40A678C()
{
  sub_1B40A68FC();
  return sub_1B40BCE34();
}

uint64_t sub_1B40A67B4()
{
  sub_1B40A68FC();
  return sub_1B40BCE40();
}

uint64_t AssertionReconnectResponse.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5025A0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B40A68FC();
  sub_1B40BCE28();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502820);
  sub_1B40A6A80(&qword_1ED502540, (uint64_t (*)(void))sub_1B40A3188, MEMORY[0x1E0DEA0B8]);
  sub_1B40BCD50();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1B40A68FC()
{
  unint64_t result;

  result = qword_1ED502708;
  if (!qword_1ED502708)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE180, &type metadata for AssertionReconnectResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED502708);
  }
  return result;
}

uint64_t AssertionReconnectResponse.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[2];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5024D0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B40A68FC();
  sub_1B40BCE1C();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502820);
    sub_1B40A6A80(&qword_1ED502478, (uint64_t (*)(void))sub_1B40A3418, MEMORY[0x1E0DEA0D8]);
    sub_1B40BCCE4();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1B40A6A80(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  _QWORD v8[2];

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED502820);
    v8[0] = a2();
    v8[1] = v8[0];
    result = MEMORY[0x1B5E363EC](a3, v7, v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B40A6AE8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return AssertionReconnectResponse.init(from:)(a1, a2);
}

uint64_t sub_1B40A6AFC(_QWORD *a1)
{
  return AssertionReconnectResponse.encode(to:)(a1);
}

NSData __swiftcall AssertionReconnectResponse._bridgeToObjectiveC()()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;

  sub_1B40BC864();
  swift_allocObject();
  sub_1B40BC858();
  sub_1B40A6BC8();
  v0 = sub_1B40BC84C();
  v2 = v1;
  v3 = sub_1B40BC8D0();
  sub_1B40A3A80(v0, v2);
  swift_release();
  return (NSData)v3;
}

unint64_t sub_1B40A6BC8()
{
  unint64_t result;

  result = qword_1ED502518;
  if (!qword_1ED502518)
  {
    result = MEMORY[0x1B5E363EC]("-Ck2l6", &type metadata for AssertionReconnectResponse);
    atomic_store(result, (unint64_t *)&qword_1ED502518);
  }
  return result;
}

uint64_t static AssertionReconnectResponse._unconditionallyBridgeFromObjectiveC(_:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;

  if (a1)
  {
    sub_1B40BC840();
    swift_allocObject();
    sub_1B40BC834();
    v3 = sub_1B40BC8DC();
    v5 = v4;
    sub_1B40A7050();
    sub_1B40BC828();
    sub_1B40A3A80(v3, v5);
    result = swift_release();
    *a2 = v7;
  }
  else
  {
    __break(1u);
    result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

uint64_t sub_1B40A6CEC()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;

  sub_1B40BC864();
  swift_allocObject();
  sub_1B40BC858();
  sub_1B40A6BC8();
  v0 = sub_1B40BC84C();
  v2 = v1;
  v3 = sub_1B40BC8D0();
  sub_1B40A3A80(v0, v2);
  swift_release();
  return v3;
}

uint64_t sub_1B40A6DAC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;

  if (a1)
  {
    sub_1B40BC840();
    swift_allocObject();
    sub_1B40BC834();
    v3 = sub_1B40BC8DC();
    v5 = v4;
    sub_1B40A7050();
    sub_1B40BC828();
    sub_1B40A3A80(v3, v5);
    result = swift_release();
    *a2 = v7;
  }
  else
  {
    __break(1u);
    result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

uint64_t _s16SessionAssertion0B17ReconnectResponseV26_forceBridgeFromObjectiveC_6resultySo6NSDataC_ACSgztFZ_0(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;

  sub_1B40BC840();
  swift_allocObject();
  sub_1B40BC834();
  v3 = sub_1B40BC8DC();
  v5 = v4;
  sub_1B40A7050();
  sub_1B40BC828();
  swift_bridgeObjectRelease();
  sub_1B40A3A80(v3, v5);
  result = swift_release();
  *a2 = v7;
  return result;
}

uint64_t _s16SessionAssertion0B17ReconnectResponseV34_conditionallyBridgeFromObjectiveC_6resultSbSo6NSDataC_ACSgztFZ_0(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;

  swift_bridgeObjectRelease();
  sub_1B40BC840();
  swift_allocObject();
  sub_1B40BC834();
  v3 = sub_1B40BC8DC();
  v5 = v4;
  sub_1B40A7050();
  sub_1B40BC828();
  swift_release();
  sub_1B40A3A80(v3, v5);
  result = 1;
  *a2 = v7;
  return result;
}

unint64_t sub_1B40A7050()
{
  unint64_t result;

  result = qword_1ED502418;
  if (!qword_1ED502418)
  {
    result = MEMORY[0x1B5E363EC](&protocol conformance descriptor for AssertionReconnectResponse, &type metadata for AssertionReconnectResponse);
    atomic_store(result, (unint64_t *)&qword_1ED502418);
  }
  return result;
}

ValueMetadata *type metadata accessor for AssertionReconnectResponse()
{
  return &type metadata for AssertionReconnectResponse;
}

uint64_t storeEnumTagSinglePayload for AssertionReconnectResponse.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1B40A70E4 + 4 * asc_1B40BDFD0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1B40A7104 + 4 * byte_1B40BDFD5[v4]))();
}

_BYTE *sub_1B40A70E4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1B40A7104(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B40A710C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B40A7114(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B40A711C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B40A7124(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AssertionReconnectResponse.CodingKeys()
{
  return &type metadata for AssertionReconnectResponse.CodingKeys;
}

unint64_t sub_1B40A7144()
{
  unint64_t result;

  result = qword_1EF08BCF8;
  if (!qword_1EF08BCF8)
  {
    result = MEMORY[0x1B5E363EC]("aBk2<5", &type metadata for AssertionReconnectResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BCF8);
  }
  return result;
}

unint64_t sub_1B40A718C()
{
  unint64_t result;

  result = qword_1ED502718;
  if (!qword_1ED502718)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE0C8, &type metadata for AssertionReconnectResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED502718);
  }
  return result;
}

unint64_t sub_1B40A71D4()
{
  unint64_t result;

  result = qword_1ED502710;
  if (!qword_1ED502710)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE0F0, &type metadata for AssertionReconnectResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED502710);
  }
  return result;
}

uint64_t sub_1B40A7218()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_delegate;
  swift_beginAccess();
  return MEMORY[0x1B5E364F4](v1);
}

uint64_t sub_1B40A7264(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_delegate;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_1B40A72CC(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC16SessionAssertion15AssertionClient_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x1B5E364F4](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_1B40A7340;
}

void sub_1B40A7340(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + *(_QWORD *)(*(_QWORD *)a1 + 48) + 8) = *(_QWORD *)(*(_QWORD *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

id AssertionClient.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t AssertionClient.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  void *v15;
  objc_class *v16;
  char *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char *v22;
  uint64_t result;
  _QWORD v24[3];
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  _QWORD aBlock[6];
  objc_super v31;

  v25 = sub_1B40BCB34();
  v1 = *(_QWORD *)(v25 - 8);
  MEMORY[0x1E0C80A78](v25);
  v3 = (char *)v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1B40BCB28();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v4);
  v6 = sub_1B40BC9A8();
  MEMORY[0x1E0C80A78](v6);
  v29 = OBJC_IVAR____TtC16SessionAssertion15AssertionClient_connection;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16SessionAssertion15AssertionClient_connection] = 0;
  *(_DWORD *)&v0[OBJC_IVAR____TtC16SessionAssertion15AssertionClient_serverStartupToken] = -1;
  v26 = v0;
  v27 = OBJC_IVAR____TtC16SessionAssertion15AssertionClient_queue;
  v24[0] = sub_1B40AA6D8(0, &qword_1ED5024B0);
  v28 = v0;
  sub_1B40BC99C();
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  v24[2] = sub_1B40A391C(&qword_1ED5024A8, v5, MEMORY[0x1E0DEF828]);
  v24[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502498);
  sub_1B40A9D9C(&qword_1ED5024A0, &qword_1ED502498);
  sub_1B40BCBAC();
  v7 = *MEMORY[0x1E0DEF8D8];
  v8 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v9 = v25;
  v8(v3, v7, v25);
  v10 = sub_1B40BCB58();
  v11 = v26;
  *(_QWORD *)&v26[v27] = v10;
  v27 = OBJC_IVAR____TtC16SessionAssertion15AssertionClient_calloutQueue;
  sub_1B40BC99C();
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  sub_1B40BCBAC();
  v8(v3, v7, v9);
  v12 = sub_1B40BCB58();
  v13 = v28;
  *(_QWORD *)&v28[v27] = v12;
  v14 = v13;
  *(_QWORD *)&v13[OBJC_IVAR____TtC16SessionAssertion15AssertionClient_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v15 = *(void **)&v11[v29];
  *(_QWORD *)&v11[v29] = 0;

  v16 = (objc_class *)type metadata accessor for AssertionClient();
  v31.receiver = v14;
  v31.super_class = v16;
  v17 = (char *)objc_msgSendSuper2(&v31, sel_init);
  v18 = *(NSObject **)&v17[OBJC_IVAR____TtC16SessionAssertion15AssertionClient_queue];
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v17;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = sub_1B40A7810;
  *(_QWORD *)(v20 + 24) = v19;
  aBlock[4] = sub_1B40A7840;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B40A7860;
  aBlock[3] = &block_descriptor;
  v21 = _Block_copy(aBlock);
  v22 = v17;
  swift_retain();
  swift_release();
  dispatch_sync(v18, v21);

  _Block_release(v21);
  LOBYTE(v18) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v18 & 1) == 0)
    return (uint64_t)v22;
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AssertionClient()
{
  return objc_opt_self();
}

uint64_t sub_1B40A77EC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1B40A7810()
{
  sub_1B40A8148();
}

uint64_t sub_1B40A7830()
{
  return swift_deallocObject();
}

uint64_t sub_1B40A7840()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1B40A7860(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
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

void sub_1B40A78B8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_1B40BC9B4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = (_QWORD *)((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(void **)&v1[OBJC_IVAR____TtC16SessionAssertion15AssertionClient_queue];
  *v5 = v6;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0DEF740], v2);
  v7 = v6;
  LOBYTE(v6) = sub_1B40BC9C0();
  (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  v8 = OBJC_IVAR____TtC16SessionAssertion15AssertionClient_connection;
  if (!*(_QWORD *)&v1[OBJC_IVAR____TtC16SessionAssertion15AssertionClient_connection])
  {
    sub_1B40AA6D8(0, &qword_1ED5024B8);
    sub_1B40AA710();
    v9 = (void *)sub_1B40BCB64();
    if (v9)
    {
      v10 = *(void **)&v1[v8];
      *(_QWORD *)&v1[v8] = v9;
      v11 = v9;

      v12 = swift_allocObject();
      *(_QWORD *)(v12 + 16) = v1;
      v13 = swift_allocObject();
      *(_QWORD *)(v13 + 16) = sub_1B40AA754;
      *(_QWORD *)(v13 + 24) = v12;
      aBlock[4] = sub_1B40A7840;
      aBlock[5] = v13;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1B40A7EAC;
      aBlock[3] = &block_descriptor_30;
      v14 = _Block_copy(aBlock);
      v1;
      swift_retain();
      swift_release();
      objc_msgSend(v11, sel_configureConnection_, v14);
      _Block_release(v14);
      LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      if ((v14 & 1) == 0)
      {
        sub_1B40A7EE8();
        swift_release();

        return;
      }
LABEL_8:
      __break(1u);
    }
  }
}

void sub_1B40A7AE0(void *a1, uint64_t a2)
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  void (*v18)(uint64_t);
  uint64_t v19;

  v4 = (void *)sub_1B40BC9D8();
  v5 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithIdentifier_, v4);

  v6 = (void *)objc_opt_self();
  v7 = objc_msgSend(v6, sel_protocolForProtocol_, &unk_1EF08F580);
  objc_msgSend(v5, sel_setClient_, v7);

  v8 = objc_msgSend(v6, sel_protocolForProtocol_, &unk_1EF08F8B8);
  objc_msgSend(v5, sel_setServer_, v8);

  v9 = objc_msgSend((id)objc_opt_self(), sel_userInitiated);
  objc_msgSend(a1, sel_setServiceQuality_, v9);

  objc_msgSend(a1, sel_setInterface_, v5);
  objc_msgSend(a1, sel_setInterfaceTarget_, a2);
  objc_msgSend(a1, sel_setTargetQueue_, *(_QWORD *)(a2 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_queue));
  v18 = sub_1B40A7D64;
  v19 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v14 = MEMORY[0x1E0C809B0];
  v15 = 1107296256;
  v16 = sub_1B40A7D70;
  v17 = &block_descriptor_33;
  v11 = _Block_copy(&v14);
  objc_msgSend(a1, sel_setActivationHandler_, v11);
  _Block_release(v11);
  v18 = sub_1B40A7DC0;
  v19 = 0;
  v14 = v10;
  v15 = 1107296256;
  v16 = sub_1B40A7D70;
  v17 = &block_descriptor_36;
  v12 = _Block_copy(&v14);
  objc_msgSend(a1, sel_setInterruptionHandler_, v12);
  _Block_release(v12);
  v18 = sub_1B40A7DCC;
  v19 = 0;
  v14 = v10;
  v15 = 1107296256;
  v16 = sub_1B40A7D70;
  v17 = &block_descriptor_39;
  v13 = _Block_copy(&v14);
  objc_msgSend(a1, sel_setInvalidationHandler_, v13);
  _Block_release(v13);

}

void sub_1B40A7D64(uint64_t a1)
{
  sub_1B40A7DD8(a1, "Assertion Service: Activated");
}

void sub_1B40A7D70(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_1B40A7DC0(uint64_t a1)
{
  sub_1B40A7DD8(a1, "Assertion Service: Interrupted");
}

void sub_1B40A7DCC(uint64_t a1)
{
  sub_1B40A7DD8(a1, "Assertion Service: Invalidated");
}

void sub_1B40A7DD8(uint64_t a1, const char *a2)
{
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  NSObject *oslog;

  if (qword_1ED502398 != -1)
    swift_once();
  v3 = sub_1B40BC978();
  __swift_project_value_buffer(v3, (uint64_t)qword_1ED502460);
  oslog = sub_1B40BC96C();
  v4 = sub_1B40BCAF8();
  if (os_log_type_enabled(oslog, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B40A0000, oslog, v4, a2, v5, 2u);
    MEMORY[0x1B5E3647C](v5, -1, -1);
  }

}

uint64_t sub_1B40A7EAC(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

void sub_1B40A7EE8()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD v10[6];

  sub_1B40BC93C();
  v1 = *(NSObject **)(v0 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_queue);
  v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v10[4] = sub_1B40AA6D0;
  v10[5] = v2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1107296256;
  v10[2] = sub_1B40A810C;
  v10[3] = &block_descriptor_21;
  v3 = _Block_copy(v10);
  swift_release();
  v4 = sub_1B40BC9FC();
  swift_bridgeObjectRelease();
  v5 = (int *)(v0 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_serverStartupToken);
  swift_beginAccess();
  LODWORD(v1) = notify_register_dispatch((const char *)(v4 + 32), v5, v1, v3);
  swift_endAccess();
  _Block_release(v3);
  swift_release();
  if ((_DWORD)v1)
  {
    if (qword_1ED502398 != -1)
      swift_once();
    v6 = sub_1B40BC978();
    __swift_project_value_buffer(v6, (uint64_t)qword_1ED502460);
    v7 = sub_1B40BC96C();
    v8 = sub_1B40BCB04();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1B40A0000, v7, v8, "Could not register for daemon startup notifications", v9, 2u);
      MEMORY[0x1B5E3647C](v9, -1, -1);
    }

  }
}

void sub_1B40A80BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x1B5E364F4](v2);
  if (v3)
  {
    v4 = (void *)v3;
    sub_1B40A8148();

  }
}

uint64_t sub_1B40A810C(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void sub_1B40A8148()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _OWORD v9[2];

  v1 = sub_1B40BC9B4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78]();
  v4 = (_QWORD *)((char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = *(void **)&v0[OBJC_IVAR____TtC16SessionAssertion15AssertionClient_queue];
  *v4 = v5;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E0DEF740], v1);
  v6 = v5;
  LOBYTE(v5) = sub_1B40BC9C0();
  (*(void (**)(_QWORD *, uint64_t))(v2 + 8))(v4, v1);
  if ((v5 & 1) != 0)
  {
    sub_1B40A78B8();
    v7 = *(void **)&v0[OBJC_IVAR____TtC16SessionAssertion15AssertionClient_connection];
    if (v7)
    {
      v8 = v7;
      if (objc_msgSend(v8, sel_remoteTarget))
      {
        sub_1B40BCBA0();

        swift_unknownObjectRelease();
        sub_1B40AA66C((uint64_t)v9);
      }
      else
      {
        memset(v9, 0, sizeof(v9));
        sub_1B40AA66C((uint64_t)v9);
        objc_msgSend(v8, sel_activate);
        objc_msgSend(v0, sel_didConnect);

      }
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1B40A8290()
{
  uint64_t v0;
  NSObject *v1;
  Class isa;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  _QWORD v16[2];
  _OWORD v17[2];
  _BYTE v18[24];
  uint64_t v19;

  v1 = sub_1B40BC9B4();
  isa = v1[-1].isa;
  MEMORY[0x1E0C80A78]();
  v4 = (_QWORD *)((char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = *(void **)(v0 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_queue);
  *v4 = v5;
  (*((void (**)(_QWORD *, _QWORD, NSObject *))isa + 13))(v4, *MEMORY[0x1E0DEF740], v1);
  v6 = v5;
  LOBYTE(v5) = sub_1B40BC9C0();
  (*((void (**)(_QWORD *, NSObject *))isa + 1))(v4, v1);
  if ((v5 & 1) == 0)
  {
    __break(1u);
LABEL_20:
    swift_once();
    goto LABEL_15;
  }
  sub_1B40A8148();
  v7 = *(void **)(v0 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_connection);
  if (!v7)
  {
    if (qword_1ED502398 != -1)
      swift_once();
    v8 = sub_1B40BC978();
    __swift_project_value_buffer(v8, (uint64_t)qword_1ED502460);
    v1 = sub_1B40BC96C();
    v9 = sub_1B40BCB10();
    if (os_log_type_enabled(v1, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1B40A0000, v1, v9, "AssertionClient: Failed to establish a connection", v10, 2u);
      MEMORY[0x1B5E3647C](v10, -1, -1);
    }
    goto LABEL_18;
  }
  v1 = v7;
  if (-[NSObject remoteTarget](v1, sel_remoteTarget))
  {
    sub_1B40BCBA0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v17, 0, sizeof(v17));
  }
  sub_1B40AA624((uint64_t)v17, (uint64_t)v18);
  if (v19)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5024C0);
    if ((swift_dynamicCast() & 1) != 0)
    {

      return v16[1];
    }
  }
  else
  {
    sub_1B40AA66C((uint64_t)v18);
  }
  if (qword_1ED502398 != -1)
    goto LABEL_20;
LABEL_15:
  v12 = sub_1B40BC978();
  __swift_project_value_buffer(v12, (uint64_t)qword_1ED502460);
  v13 = sub_1B40BC96C();
  v14 = sub_1B40BCB10();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1B40A0000, v13, v14, "AssertionClient: Failed to cast connection to server interface protocol", v15, 2u);
    MEMORY[0x1B5E3647C](v15, -1, -1);
  }

LABEL_18:
  return 0;
}

id AssertionClient.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AssertionClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t AssertionClient.acquire(request:)()
{
  return sub_1B40BCB40();
}

void sub_1B40A862C(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  id v30;
  id v31;
  _QWORD *v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  _BYTE *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  id v48[4];

  v48[3] = *(id *)MEMORY[0x1E0C80C00];
  type metadata accessor for AssertionAcquisitionRequest();
  v5 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v44 - v8;
  v10 = sub_1B40A8290();
  if (v10)
  {
    v11 = (void *)v10;
    sub_1B40BC864();
    swift_allocObject();
    sub_1B40BC858();
    sub_1B40A391C(&qword_1ED502428, (uint64_t (*)(uint64_t))type metadata accessor for AssertionAcquisitionRequest, (uint64_t)"!1k2|$");
    v12 = sub_1B40BC84C();
    if (v2)
    {
      v42 = swift_unexpectedError();
      __break(1u);
      sub_1B40A3A80(v42, v43);
      swift_unexpectedError();
      __break(1u);
    }
    else
    {
      v14 = v12;
      v15 = v13;
      v16 = (void *)sub_1B40BC8D0();
      sub_1B40A3A80(v14, v15);
      swift_release();
      v17 = sub_1B40BC8DC();
      v19 = v18;

      v20 = (void *)sub_1B40BC8D0();
      v48[0] = 0;
      v21 = objc_msgSend(v11, sel_acquire_error_, v20, v48);

      v22 = v48[0];
      if (v21)
      {
        v46 = a2;
        v23 = sub_1B40BC8DC();
        v25 = v24;

        v44 = v25;
        v45 = v23;
        v26 = (void *)sub_1B40BC8D0();
        sub_1B40BC888();
        swift_allocObject();
        sub_1B40BC87C();
        v27 = sub_1B40BC8DC();
        v29 = v28;
        sub_1B40A3418();
        sub_1B40BC870();
        sub_1B40A3A80(v27, v29);
        swift_release();
        v30 = v48[0];
        v31 = v48[1];
        sub_1B40A3A80(v17, v19);
        sub_1B40A3A80(v45, v44);
        swift_unknownObjectRelease();

        v32 = v46;
        *v46 = v30;
        v32[1] = v31;
      }
      else
      {
        v40 = v22;
        sub_1B40BC8C4();

        swift_willThrow();
        sub_1B40A3A80(v17, v19);
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    if (qword_1ED502398 != -1)
      swift_once();
    v33 = sub_1B40BC978();
    __swift_project_value_buffer(v33, (uint64_t)qword_1ED502460);
    sub_1B40A2DB8(a1, (uint64_t)v9);
    v34 = sub_1B40BC96C();
    v35 = sub_1B40BCB10();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      v37 = (void *)swift_slowAlloc();
      v48[0] = v37;
      *(_DWORD *)v36 = 136446210;
      sub_1B40A2DB8((uint64_t)v9, (uint64_t)v7);
      v38 = sub_1B40BC9F0();
      v47 = sub_1B40A9EB0(v38, v39, (uint64_t *)v48);
      sub_1B40BCB7C();
      swift_bridgeObjectRelease();
      sub_1B40AA814((uint64_t)v9);
      _os_log_impl(&dword_1B40A0000, v34, v35, "AssertionClient: Could not acquire assertion because remote target is bad: %{public}s", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E3647C](v37, -1, -1);
      MEMORY[0x1B5E3647C](v36, -1, -1);
    }
    else
    {
      sub_1B40AA814((uint64_t)v9);
    }

    sub_1B40AA7D0();
    swift_allocError();
    *v41 = 3;
    swift_willThrow();
  }
}

void sub_1B40A8AC8(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_1B40A862C(*(_QWORD *)(v1 + 24), a1);
}

uint64_t AssertionClient.invalidate(identifier:)()
{
  return sub_1B40BCB40();
}

uint64_t sub_1B40A8B3C(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  unint64_t v22;
  _BYTE *v23;
  uint64_t result;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v27 = a1;
  v28 = a2;
  sub_1B40BC8AC();
  swift_allocObject();
  sub_1B40BC8A0();
  sub_1B40A3188();
  v4 = sub_1B40BC894();
  if (v2)
  {
    result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    v6 = v4;
    v7 = v5;
    v8 = (void *)sub_1B40BC8D0();
    sub_1B40A3A80(v6, v7);
    swift_release();
    v9 = sub_1B40BC8DC();
    v11 = v10;

    v12 = sub_1B40A8290();
    if (v12)
    {
      v13 = (void *)v12;
      v14 = (void *)sub_1B40BC8D0();
      v27 = 0;
      v15 = objc_msgSend(v13, sel_invalidate_error_, v14, &v27);

      if ((v15 & 1) != 0)
      {
        v16 = v27;
      }
      else
      {
        v25 = v27;
        sub_1B40BC8C4();

        swift_willThrow();
      }
      sub_1B40A3A80(v9, v11);
      return swift_unknownObjectRelease();
    }
    else
    {
      if (qword_1ED502398 != -1)
        swift_once();
      v17 = sub_1B40BC978();
      __swift_project_value_buffer(v17, (uint64_t)qword_1ED502460);
      v18 = sub_1B40BC96C();
      v19 = sub_1B40BCB04();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = (uint8_t *)swift_slowAlloc();
        v26 = swift_slowAlloc();
        *(_DWORD *)v20 = 136446210;
        v28 = a2;
        v29[0] = v26;
        v21 = AssertionIdentifier.description.getter();
        v27 = (id)sub_1B40A9EB0(v21, v22, v29);
        sub_1B40BCB7C();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1B40A0000, v18, v19, "Could not invalidate assertion because remote target is bad: %{public}s", v20, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1B5E3647C](v26, -1, -1);
        MEMORY[0x1B5E3647C](v20, -1, -1);
      }

      sub_1B40AA7D0();
      swift_allocError();
      *v23 = 3;
      swift_willThrow();
      return sub_1B40A3A80(v9, v11);
    }
  }
  return result;
}

uint64_t sub_1B40A8E74()
{
  uint64_t v0;

  return sub_1B40A8B3C(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t AssertionClient.reconnect(request:)()
{
  return sub_1B40BCB40();
}

void sub_1B40A8EE0(void *a1@<X1>, id *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  _BYTE *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  id *v37;
  id v38[2];

  v38[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = sub_1B40A8290();
  if (v5)
  {
    v6 = (void *)v5;
    sub_1B40BC864();
    swift_allocObject();
    sub_1B40BC858();
    v38[0] = a1;
    sub_1B40A3A3C();
    v7 = sub_1B40BC84C();
    if (v2)
    {
      v34 = swift_unexpectedError();
      __break(1u);
      sub_1B40A3A80(v34, v35);
      swift_unexpectedError();
      __break(1u);
    }
    else
    {
      v9 = v7;
      v10 = v8;
      v11 = (void *)sub_1B40BC8D0();
      sub_1B40A3A80(v9, v10);
      swift_release();
      v12 = sub_1B40BC8DC();
      v14 = v13;

      v15 = (void *)sub_1B40BC8D0();
      v38[0] = 0;
      v16 = objc_msgSend(v6, sel_reconnect_error_, v15, v38);

      v17 = v38[0];
      if (v16)
      {
        v36 = v14;
        v37 = a2;
        v18 = sub_1B40BC8DC();
        v20 = v19;

        v21 = (void *)sub_1B40BC8D0();
        sub_1B40BC840();
        swift_allocObject();
        sub_1B40BC834();
        v22 = sub_1B40BC8DC();
        v24 = v23;
        sub_1B40A7050();
        sub_1B40BC828();
        sub_1B40A3A80(v22, v24);
        swift_release();
        sub_1B40A3A80(v12, v36);
        sub_1B40A3A80(v18, v20);
        swift_unknownObjectRelease();

        *v37 = v38[0];
      }
      else
      {
        v32 = v17;
        sub_1B40BC8C4();

        swift_willThrow();
        sub_1B40A3A80(v12, v14);
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    if (qword_1ED502398 != -1)
      swift_once();
    v25 = sub_1B40BC978();
    __swift_project_value_buffer(v25, (uint64_t)qword_1ED502460);
    swift_bridgeObjectRetain_n();
    v26 = sub_1B40BC96C();
    v27 = sub_1B40BCB04();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = (void *)swift_slowAlloc();
      v38[0] = v29;
      *(_DWORD *)v28 = 136446210;
      swift_bridgeObjectRetain();
      v30 = sub_1B40BC9F0();
      sub_1B40A9EB0(v30, v31, (uint64_t *)v38);
      sub_1B40BCB7C();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B40A0000, v26, v27, "Could not reconnect assertion because remote target is bad: %{public}s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E3647C](v29, -1, -1);
      MEMORY[0x1B5E3647C](v28, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_1B40AA7D0();
    swift_allocError();
    *v33 = 3;
    swift_willThrow();
  }
}

void sub_1B40A9320(id *a1@<X8>)
{
  uint64_t v1;

  sub_1B40A8EE0(*(void **)(v1 + 24), a1);
}

uint64_t AssertionClient.didInvalidate(_:)()
{
  void *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v5;

  v0 = (void *)sub_1B40BC8D0();
  sub_1B40BC840();
  swift_allocObject();
  sub_1B40BC834();
  v1 = sub_1B40BC8DC();
  v3 = v2;
  sub_1B40A9CC0();
  sub_1B40BC828();
  sub_1B40A3A80(v1, v3);

  swift_release();
  AssertionClient.didInvalidate(invalidationMessage:)((uint64_t)&v5);
  return swift_bridgeObjectRelease();
}

uint64_t AssertionClient.didInvalidate(invalidationMessage:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  unsigned int v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char *v29;
  char *v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t aBlock;
  uint64_t v46;
  uint64_t (*v47)(uint64_t);
  void *v48;
  uint64_t (*v49)();
  uint64_t v50;

  v3 = sub_1B40BC984();
  v43 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1B40BC9A8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_DWORD *)(a1 + 4);
  LODWORD(v42) = *(_DWORD *)a1;
  v11 = *(_QWORD *)(a1 + 8);
  v12 = *(_QWORD *)(a1 + 24);
  v40 = *(_QWORD *)(a1 + 16);
  v41 = v11;
  v13 = v1 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_delegate;
  swift_beginAccess();
  result = MEMORY[0x1B5E364F4](v13);
  if (result)
  {
    v34 = result;
    v35 = v1;
    v37 = v7;
    v33 = *(_QWORD *)(v13 + 8);
    if (qword_1ED502398 != -1)
      swift_once();
    v15 = v10;
    v36 = v9;
    v38 = v6;
    v39 = v5;
    v16 = sub_1B40BC978();
    __swift_project_value_buffer(v16, (uint64_t)qword_1ED502460);
    swift_bridgeObjectRetain_n();
    v17 = sub_1B40BC96C();
    v18 = sub_1B40BCB1C();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      v32 = v3;
      *(_DWORD *)v19 = 136446210;
      v44 = v20;
      v31 = v19 + 4;
      v21 = v42;
      aBlock = __PAIR64__(v15, v42);
      v22 = v41;
      v46 = v41;
      v23 = AssertionIdentifier.description.getter();
      aBlock = sub_1B40A9EB0(v23, v24, &v44);
      v3 = v32;
      sub_1B40BCB7C();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B40A0000, v17, v18, "Server invalidated assertion: %{public}s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E3647C](v20, -1, -1);
      MEMORY[0x1B5E3647C](v19, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      v21 = v42;
      v22 = v41;
    }
    v42 = *(_QWORD *)(v35 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_calloutQueue);
    v25 = swift_allocObject();
    v26 = v33;
    *(_QWORD *)(v25 + 16) = v34;
    *(_QWORD *)(v25 + 24) = v26;
    *(_DWORD *)(v25 + 32) = v21;
    *(_DWORD *)(v25 + 36) = v15;
    v27 = v40;
    *(_QWORD *)(v25 + 40) = v22;
    *(_QWORD *)(v25 + 48) = v27;
    *(_QWORD *)(v25 + 56) = v12;
    v49 = sub_1B40A9D30;
    v50 = v25;
    aBlock = MEMORY[0x1E0C809B0];
    v46 = 1107296256;
    v47 = sub_1B40A9988;
    v48 = &block_descriptor_9;
    v28 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    v29 = v36;
    sub_1B40BC990();
    v44 = MEMORY[0x1E0DEE9D8];
    sub_1B40A391C(&qword_1ED5023A0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502488);
    sub_1B40A9D9C(&qword_1ED502490, &qword_1ED502488);
    v30 = v39;
    sub_1B40BCBAC();
    MEMORY[0x1B5E35DA4](0, v29, v30, v28);
    _Block_release(v28);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v30, v3);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v29, v38);
    return swift_release();
  }
  return result;
}

uint64_t sub_1B40A9988(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

Swift::Void __swiftcall AssertionClient.didConnect()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD aBlock[6];

  v1 = sub_1B40BC984();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1B40BC9A8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v0 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_delegate;
  swift_beginAccess();
  v10 = MEMORY[0x1B5E364F4](v9);
  if (v10)
  {
    v11 = v10;
    v20 = v2;
    v12 = *(_QWORD *)(v9 + 8);
    if (qword_1ED502398 != -1)
      swift_once();
    v19 = v5;
    v13 = sub_1B40BC978();
    __swift_project_value_buffer(v13, (uint64_t)qword_1ED502460);
    v14 = sub_1B40BC96C();
    v15 = sub_1B40BCB1C();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1B40A0000, v14, v15, "Server connected", v16, 2u);
      MEMORY[0x1B5E3647C](v16, -1, -1);
    }

    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = v11;
    *(_QWORD *)(v17 + 24) = v12;
    aBlock[4] = sub_1B40AA4C0;
    aBlock[5] = v17;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B40A9988;
    aBlock[3] = &block_descriptor_15;
    v18 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    sub_1B40BC990();
    v21 = MEMORY[0x1E0DEE9D8];
    sub_1B40A391C(&qword_1ED5023A0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502488);
    sub_1B40A9D9C(&qword_1ED502490, &qword_1ED502488);
    sub_1B40BCBAC();
    MEMORY[0x1B5E35DA4](0, v8, v4, v18);
    _Block_release(v18);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v1);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v19);
    swift_release();
  }
}

unint64_t sub_1B40A9CC0()
{
  unint64_t result;

  result = qword_1ED502630;
  if (!qword_1ED502630)
  {
    result = MEMORY[0x1B5E363EC](&protocol conformance descriptor for AssertionInvalidationMessage, &type metadata for AssertionInvalidationMessage);
    atomic_store(result, (unint64_t *)&qword_1ED502630);
  }
  return result;
}

uint64_t sub_1B40A9D04()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1B40A9D30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t ObjectType;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v1 = *(_QWORD *)(v0 + 24);
  v5 = *(_OWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 56);
  ObjectType = swift_getObjectType();
  v6 = *(_QWORD *)(v0 + 32);
  v7 = v5;
  v8 = v2;
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v1 + 8))(&v6, ObjectType, v1);
}

uint64_t sub_1B40A9D9C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1B5E363EC](MEMORY[0x1E0DEAF38], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B40A9DDC(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1B40A9DEC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1B40A9E20(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1B40A9E40(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_1B40A9EB0(v6, v7, a3);
  v8 = *a1 + 8;
  sub_1B40BCB7C();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1B40A9EB0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1B40A9F80(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1B40AA790((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1B40AA790((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_1B40A9F80(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1B40BCB88();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1B40AA138(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_1B40BCC24();
  if (!v8)
  {
    sub_1B40BCC3C();
    __break(1u);
LABEL_17:
    result = sub_1B40BCC84();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_1B40AA138(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1B40AA1CC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1B40AA340(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1B40AA340(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1B40AA1CC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_1B40B851C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1B40BCBF4();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1B40BCC3C();
      __break(1u);
LABEL_10:
      v2 = sub_1B40BCA20();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1B40BCC84();
    __break(1u);
LABEL_14:
    result = sub_1B40BCC3C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

uint64_t sub_1B40AA340(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5024E8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1B40BCC84();
  __break(1u);
  return result;
}

_BYTE **sub_1B40AA48C(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_1B40AA49C()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1B40AA4C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;

  v1 = *(_QWORD *)(v0 + 24);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(ObjectType, v1);
}

uint64_t sub_1B40AA4FC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *a1 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_delegate;
  swift_beginAccess();
  result = MEMORY[0x1B5E364F4](v3);
  v5 = *(_QWORD *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1B40AA554(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_delegate;
  swift_beginAccess();
  *(_QWORD *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t dispatch thunk of AssertionClientDelegate.didInvalidate(invalidationMessage:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of AssertionClientDelegate.didConnect()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t method lookup function for AssertionClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AssertionClient.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AssertionClient.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of AssertionClient.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t sub_1B40AA624(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5024F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B40AA66C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5024F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B40AA6AC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1B40AA6D0(uint64_t a1)
{
  uint64_t v1;

  sub_1B40A80BC(a1, v1);
}

uint64_t sub_1B40AA6D8(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_1B40AA710()
{
  unint64_t result;

  result = qword_1ED502420;
  if (!qword_1ED502420)
  {
    result = MEMORY[0x1B5E363EC](&protocol conformance descriptor for AssertionServiceDefinition, &type metadata for AssertionServiceDefinition);
    atomic_store(result, (unint64_t *)&qword_1ED502420);
  }
  return result;
}

void sub_1B40AA754(void *a1)
{
  uint64_t v1;

  sub_1B40A7AE0(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1B40AA75C()
{
  return swift_deallocObject();
}

uint64_t sub_1B40AA76C(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_1B40AA790(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1B40AA7D0()
{
  unint64_t result;

  result = qword_1ED502440;
  if (!qword_1ED502440)
  {
    result = MEMORY[0x1B5E363EC](&protocol conformance descriptor for AssertionError, &type metadata for AssertionError);
    atomic_store(result, (unint64_t *)&qword_1ED502440);
  }
  return result;
}

uint64_t sub_1B40AA814(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AssertionAcquisitionRequest();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B40AA88C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B40AA8B8 + 4 * byte_1B40BE250[a1]))(7565169, 0xE300000000000000);
}

unint64_t sub_1B40AA8B8()
{
  return 0xD000000000000015;
}

uint64_t sub_1B40AA8D8()
{
  return 0x65726F46656B6166;
}

uint64_t sub_1B40AA8FC()
{
  return 0x61746E6573657270;
}

unint64_t sub_1B40AA91C()
{
  return 0xD000000000000014;
}

uint64_t sub_1B40AA938()
{
  unsigned __int8 *v0;

  return sub_1B40AA88C(*v0);
}

uint64_t sub_1B40AA940@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B40AD148(a1, a2);
  *a3 = result;
  return result;
}

void sub_1B40AA964(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_1B40AA970()
{
  sub_1B40AB124();
  return sub_1B40BCE34();
}

uint64_t sub_1B40AA998()
{
  sub_1B40AB124();
  return sub_1B40BCE40();
}

uint64_t sub_1B40AA9C0()
{
  return 0;
}

uint64_t sub_1B40AA9CC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_1B40AA9F8()
{
  sub_1B40AB168();
  return sub_1B40BCE34();
}

uint64_t sub_1B40AAA20()
{
  sub_1B40AB168();
  return sub_1B40BCE40();
}

unint64_t sub_1B40AAA50()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_1B40AAA6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B40AD384(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1B40AAA94()
{
  sub_1B40AB1F0();
  return sub_1B40BCE34();
}

uint64_t sub_1B40AAABC()
{
  sub_1B40AB1F0();
  return sub_1B40BCE40();
}

uint64_t sub_1B40AAAE4()
{
  return 12383;
}

uint64_t sub_1B40AAAF4()
{
  sub_1B40AB1AC();
  return sub_1B40BCE34();
}

uint64_t sub_1B40AAB1C()
{
  sub_1B40AB1AC();
  return sub_1B40BCE40();
}

uint64_t sub_1B40AAB44()
{
  sub_1B40AB234();
  return sub_1B40BCE34();
}

uint64_t sub_1B40AAB6C()
{
  sub_1B40AB234();
  return sub_1B40BCE40();
}

uint64_t sub_1B40AAB94()
{
  sub_1B40AB278();
  return sub_1B40BCE34();
}

uint64_t sub_1B40AABBC()
{
  sub_1B40AB278();
  return sub_1B40BCE40();
}

void AssertionAttribute.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  _QWORD v14[3];
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BD88);
  v21 = *(_QWORD *)(v23 - 8);
  MEMORY[0x1E0C80A78](v23);
  v19 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502850);
  v26 = *(_QWORD *)(v3 - 8);
  v27 = v3;
  MEMORY[0x1E0C80A78](v3);
  v24 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_1B40BC918();
  v22 = *(_QWORD *)(v25 - 8);
  MEMORY[0x1E0C80A78](v25);
  v20 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502858);
  v17 = *(_QWORD *)(v6 - 8);
  v18 = v6;
  MEMORY[0x1E0C80A78](v6);
  v16 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502860);
  v14[1] = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502848);
  v14[2] = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v9 = type metadata accessor for AssertionAttribute();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502840);
  v28 = *(_QWORD *)(v12 - 8);
  v29 = v12;
  MEMORY[0x1E0C80A78](v12);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B40AB124();
  sub_1B40BCE28();
  sub_1B40A5C78(v30, (uint64_t)v11);
  v13 = (char *)sub_1B40AAE70 + 4 * byte_1B40BE255[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_1B40AAE70()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = *v1;
  *(_BYTE *)(v4 - 69) = 0;
  sub_1B40AB278();
  v6 = *(_QWORD *)(v4 - 120);
  sub_1B40BCD14();
  *(_QWORD *)(v4 - 96) = v5;
  sub_1B40AB2BC();
  sub_1B40BCD50();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 240) + 8))(v3, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 128) + 8))(v0, v6);
}

uint64_t type metadata accessor for AssertionAttribute()
{
  uint64_t result;

  result = qword_1ED5026A0;
  if (!qword_1ED5026A0)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_1B40AB124()
{
  unint64_t result;

  result = qword_1ED502788;
  if (!qword_1ED502788)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BEB70, &type metadata for AssertionAttribute.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED502788);
  }
  return result;
}

unint64_t sub_1B40AB168()
{
  unint64_t result;

  result = qword_1EF08BD90;
  if (!qword_1EF08BD90)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BEB20, &type metadata for AssertionAttribute.DisableAPIThrottlingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BD90);
  }
  return result;
}

unint64_t sub_1B40AB1AC()
{
  unint64_t result;

  result = qword_1ED502670;
  if (!qword_1ED502670)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BEAD0, &type metadata for AssertionAttribute.PresentationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED502670);
  }
  return result;
}

unint64_t sub_1B40AB1F0()
{
  unint64_t result;

  result = qword_1EF08BD98;
  if (!qword_1EF08BD98)
  {
    result = MEMORY[0x1B5E363EC]("\t<k2", &type metadata for AssertionAttribute.FakeForegroundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BD98);
  }
  return result;
}

unint64_t sub_1B40AB234()
{
  unint64_t result;

  result = qword_1ED502448;
  if (!qword_1ED502448)
  {
    result = MEMORY[0x1B5E363EC]("Y<k2,.", &type metadata for AssertionAttribute.ProminentPresentationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED502448);
  }
  return result;
}

unint64_t sub_1B40AB278()
{
  unint64_t result;

  result = qword_1EF08BDA0;
  if (!qword_1EF08BDA0)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE9E0, &type metadata for AssertionAttribute.QosCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BDA0);
  }
  return result;
}

unint64_t sub_1B40AB2BC()
{
  unint64_t result;

  result = qword_1EF08BDA8;
  if (!qword_1EF08BDA8)
  {
    result = MEMORY[0x1B5E363EC](MEMORY[0x1E0C8FC20], MEMORY[0x1E0C8FC18]);
    atomic_store(result, (unint64_t *)&qword_1EF08BDA8);
  }
  return result;
}

uint64_t AssertionAttribute.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t *v29;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;

  v47 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BDB0);
  v35 = *(_QWORD *)(v3 - 8);
  v36 = v3;
  MEMORY[0x1E0C80A78](v3);
  v41 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502570);
  v44 = *(_QWORD *)(v5 - 8);
  v45 = v5;
  MEMORY[0x1E0C80A78](v5);
  v42 = (char *)v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502578);
  v37 = *(_QWORD *)(v34 - 8);
  MEMORY[0x1E0C80A78](v34);
  v40 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502580);
  v31[3] = *(_QWORD *)(v32 - 8);
  MEMORY[0x1E0C80A78](v32);
  v38 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502568);
  v31[4] = *(_QWORD *)(v33 - 8);
  MEMORY[0x1E0C80A78](v33);
  v39 = (char *)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502560);
  v43 = *(_QWORD *)(v48 - 8);
  MEMORY[0x1E0C80A78](v48);
  v11 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for AssertionAttribute();
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x1E0C80A78](v13);
  v17 = MEMORY[0x1E0C80A78](v16);
  v19 = (char *)v31 - v18;
  MEMORY[0x1E0C80A78](v17);
  v21 = (char *)v31 - v20;
  v22 = a1[3];
  v49 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v22);
  sub_1B40AB124();
  v46 = v11;
  v23 = v50;
  sub_1B40BCE1C();
  if (!v23)
  {
    v31[0] = v19;
    v31[1] = v15;
    v31[2] = v21;
    v50 = 0;
    v24 = v48;
    v25 = v46;
    v26 = sub_1B40BCD08();
    if (*(_QWORD *)(v26 + 16) == 1)
      __asm { BR              X10 }
    v27 = sub_1B40BCC18();
    swift_allocError();
    v29 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BDB8);
    *v29 = v12;
    sub_1B40BCCA8();
    sub_1B40BCC0C();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v27 - 8) + 104))(v29, *MEMORY[0x1E0DEC450], v27);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v25, v24);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v49);
}

uint64_t sub_1B40ABB24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AssertionAttribute();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B40ABB68(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_1B40BC918();
    result = MEMORY[0x1B5E363EC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1B40ABBA8()
{
  unint64_t result;

  result = qword_1EF08BDC0;
  if (!qword_1EF08BDC0)
  {
    result = MEMORY[0x1B5E363EC](MEMORY[0x1E0C8FC28], MEMORY[0x1E0C8FC18]);
    atomic_store(result, (unint64_t *)&qword_1EF08BDC0);
  }
  return result;
}

uint64_t sub_1B40ABBEC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return AssertionAttribute.init(from:)(a1, a2);
}

void sub_1B40ABC00(_QWORD *a1)
{
  AssertionAttribute.encode(to:)(a1);
}

uint64_t sub_1B40ABC14()
{
  return 0x65726F46656B6166;
}

uint64_t sub_1B40ABC38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x65726F46656B6166 && a2 == 0xEE00646E756F7267)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_1B40BCD80();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1B40ABCF0()
{
  sub_1B40ABF8C();
  return sub_1B40BCE34();
}

uint64_t sub_1B40ABD18()
{
  sub_1B40ABF8C();
  return sub_1B40BCE40();
}

uint64_t sub_1B40ABD40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
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
    v5 = sub_1B40BCD80();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1B40ABDBC()
{
  sub_1B40ABFD0();
  return sub_1B40BCE34();
}

uint64_t sub_1B40ABDE4()
{
  sub_1B40ABFD0();
  return sub_1B40BCE40();
}

uint64_t AssertionInvalidationState.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BDC8);
  v13 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BDD0);
  v12 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B40ABF8C();
  sub_1B40BCE28();
  sub_1B40ABFD0();
  sub_1B40BCD14();
  v14 = v9;
  sub_1B40AC014();
  sub_1B40BCD50();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v5, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v8, v6);
}

unint64_t sub_1B40ABF8C()
{
  unint64_t result;

  result = qword_1EF08BDD8;
  if (!qword_1EF08BDD8)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE990, &type metadata for AssertionInvalidationState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BDD8);
  }
  return result;
}

unint64_t sub_1B40ABFD0()
{
  unint64_t result;

  result = qword_1EF08BDE0;
  if (!qword_1EF08BDE0)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE940, &type metadata for AssertionInvalidationState.FakeForegroundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BDE0);
  }
  return result;
}

unint64_t sub_1B40AC014()
{
  unint64_t result;

  result = qword_1EF08BDE8;
  if (!qword_1EF08BDE8)
  {
    result = MEMORY[0x1B5E363EC](&protocol conformance descriptor for FakeForegroundInvalidationState, &type metadata for FakeForegroundInvalidationState);
    atomic_store(result, (unint64_t *)&qword_1EF08BDE8);
  }
  return result;
}

uint64_t AssertionInvalidationState.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v21 = a2;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BDF0);
  v3 = *(_QWORD *)(v22 - 8);
  MEMORY[0x1E0C80A78](v22);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BDF8);
  v6 = *(_QWORD *)(v23 - 8);
  MEMORY[0x1E0C80A78](v23);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B40ABF8C();
  v9 = v24;
  sub_1B40BCE1C();
  if (v9)
    goto LABEL_5;
  v19 = v3;
  v20 = a1;
  v11 = v22;
  v10 = v23;
  v24 = v6;
  if (*(_QWORD *)(sub_1B40BCD08() + 16) != 1)
  {
    v13 = v10;
    v14 = sub_1B40BCC18();
    swift_allocError();
    v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BDB8);
    *v16 = &type metadata for AssertionInvalidationState;
    sub_1B40BCCA8();
    sub_1B40BCC0C();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v16, *MEMORY[0x1E0DEC450], v14);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v13);
    a1 = v20;
LABEL_5:
    v18 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v18);
  }
  sub_1B40ABFD0();
  sub_1B40BCC9C();
  v12 = v24;
  sub_1B40AC318();
  sub_1B40BCCE4();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v11);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v10);
  v18 = (uint64_t)v20;
  *v21 = v25;
  return __swift_destroy_boxed_opaque_existential_1(v18);
}

unint64_t sub_1B40AC318()
{
  unint64_t result;

  result = qword_1EF08BE00;
  if (!qword_1EF08BE00)
  {
    result = MEMORY[0x1B5E363EC](&protocol conformance descriptor for FakeForegroundInvalidationState, &type metadata for FakeForegroundInvalidationState);
    atomic_store(result, (unint64_t *)&qword_1EF08BE00);
  }
  return result;
}

uint64_t sub_1B40AC35C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return AssertionInvalidationState.init(from:)(a1, a2);
}

uint64_t sub_1B40AC370(_QWORD *a1)
{
  return AssertionInvalidationState.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for AssertionAttribute(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else if (swift_getEnumCaseMultiPayload() == 2)
  {
    v7 = sub_1B40BC918();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  return a1;
}

uint64_t destroy for AssertionAttribute(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2)
  {
    v3 = sub_1B40BC918();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  return result;
}

void *initializeWithCopy for AssertionAttribute(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v6 = sub_1B40BC918();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithCopy for AssertionAttribute(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_1B40A455C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v6 = sub_1B40BC918();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

void *initializeWithTake for AssertionAttribute(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v6 = sub_1B40BC918();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for AssertionAttribute(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_1B40A455C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v6 = sub_1B40BC918();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for AssertionAttribute(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for AssertionAttribute(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_1B40AC6F0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1B40AC700()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B40BC918();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for AssertionInvalidationState(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AssertionInvalidationState()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for AssertionInvalidationState(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *assignWithTake for AssertionInvalidationState(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AssertionInvalidationState(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 8))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AssertionInvalidationState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 8) = 1;
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
    *(_BYTE *)(result + 8) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AssertionInvalidationState()
{
  return &type metadata for AssertionInvalidationState;
}

ValueMetadata *type metadata accessor for AssertionInvalidationState.CodingKeys()
{
  return &type metadata for AssertionInvalidationState.CodingKeys;
}

ValueMetadata *type metadata accessor for AssertionInvalidationState.FakeForegroundCodingKeys()
{
  return &type metadata for AssertionInvalidationState.FakeForegroundCodingKeys;
}

uint64_t getEnumTagSinglePayload for AssertionAttribute.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AssertionAttribute.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_1B40AC9BC + 4 * byte_1B40BE264[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1B40AC9F0 + 4 * byte_1B40BE25F[v4]))();
}

uint64_t sub_1B40AC9F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B40AC9F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B40ACA00);
  return result;
}

uint64_t sub_1B40ACA0C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B40ACA14);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1B40ACA18(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B40ACA20(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AssertionAttribute.CodingKeys()
{
  return &type metadata for AssertionAttribute.CodingKeys;
}

ValueMetadata *type metadata accessor for AssertionAttribute.QosCodingKeys()
{
  return &type metadata for AssertionAttribute.QosCodingKeys;
}

ValueMetadata *type metadata accessor for AssertionAttribute.ProminentPresentationCodingKeys()
{
  return &type metadata for AssertionAttribute.ProminentPresentationCodingKeys;
}

ValueMetadata *type metadata accessor for AssertionAttribute.FakeForegroundCodingKeys()
{
  return &type metadata for AssertionAttribute.FakeForegroundCodingKeys;
}

uint64_t _s16SessionAssertion26AssertionInvalidationStateO10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1B40ACAAC + 4 * byte_1B40BE269[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1B40ACACC + 4 * byte_1B40BE26E[v4]))();
}

_BYTE *sub_1B40ACAAC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1B40ACACC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B40ACAD4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B40ACADC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B40ACAE4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B40ACAEC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AssertionAttribute.PresentationCodingKeys()
{
  return &type metadata for AssertionAttribute.PresentationCodingKeys;
}

ValueMetadata *type metadata accessor for AssertionAttribute.DisableAPIThrottlingCodingKeys()
{
  return &type metadata for AssertionAttribute.DisableAPIThrottlingCodingKeys;
}

unint64_t sub_1B40ACB1C()
{
  unint64_t result;

  result = qword_1EF08BE08;
  if (!qword_1EF08BE08)
  {
    result = MEMORY[0x1B5E363EC]("IAk2t3", &type metadata for AssertionAttribute.PresentationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BE08);
  }
  return result;
}

unint64_t sub_1B40ACB64()
{
  unint64_t result;

  result = qword_1EF08BE10;
  if (!qword_1EF08BE10)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE5E8, &type metadata for AssertionAttribute.FakeForegroundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BE10);
  }
  return result;
}

unint64_t sub_1B40ACBAC()
{
  unint64_t result;

  result = qword_1EF08BE18;
  if (!qword_1EF08BE18)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE6F0, &type metadata for AssertionAttribute.QosCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BE18);
  }
  return result;
}

unint64_t sub_1B40ACBF4()
{
  unint64_t result;

  result = qword_1EF08BE20;
  if (!qword_1EF08BE20)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE7A8, &type metadata for AssertionAttribute.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BE20);
  }
  return result;
}

unint64_t sub_1B40ACC3C()
{
  unint64_t result;

  result = qword_1EF08BE28;
  if (!qword_1EF08BE28)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE860, &type metadata for AssertionInvalidationState.FakeForegroundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BE28);
  }
  return result;
}

unint64_t sub_1B40ACC84()
{
  unint64_t result;

  result = qword_1EF08BE30;
  if (!qword_1EF08BE30)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE918, &type metadata for AssertionInvalidationState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BE30);
  }
  return result;
}

unint64_t sub_1B40ACCCC()
{
  unint64_t result;

  result = qword_1EF08BE38;
  if (!qword_1EF08BE38)
  {
    result = MEMORY[0x1B5E363EC]("a>k2 0", &type metadata for AssertionInvalidationState.FakeForegroundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BE38);
  }
  return result;
}

unint64_t sub_1B40ACD14()
{
  unint64_t result;

  result = qword_1EF08BE40;
  if (!qword_1EF08BE40)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE7F8, &type metadata for AssertionInvalidationState.FakeForegroundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BE40);
  }
  return result;
}

unint64_t sub_1B40ACD5C()
{
  unint64_t result;

  result = qword_1EF08BE48;
  if (!qword_1EF08BE48)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE888, &type metadata for AssertionInvalidationState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BE48);
  }
  return result;
}

unint64_t sub_1B40ACDA4()
{
  unint64_t result;

  result = qword_1EF08BE50;
  if (!qword_1EF08BE50)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE8B0, &type metadata for AssertionInvalidationState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BE50);
  }
  return result;
}

unint64_t sub_1B40ACDEC()
{
  unint64_t result;

  result = qword_1ED5027A8;
  if (!qword_1ED5027A8)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE660, &type metadata for AssertionAttribute.QosCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5027A8);
  }
  return result;
}

unint64_t sub_1B40ACE34()
{
  unint64_t result;

  result = qword_1ED5027A0;
  if (!qword_1ED5027A0)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE688, &type metadata for AssertionAttribute.QosCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5027A0);
  }
  return result;
}

unint64_t sub_1B40ACE7C()
{
  unint64_t result;

  result = qword_1ED5027D8;
  if (!qword_1ED5027D8)
  {
    result = MEMORY[0x1B5E363EC]("!@k2L2", &type metadata for AssertionAttribute.ProminentPresentationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5027D8);
  }
  return result;
}

unint64_t sub_1B40ACEC4()
{
  unint64_t result;

  result = qword_1ED5027D0;
  if (!qword_1ED5027D0)
  {
    result = MEMORY[0x1B5E363EC]("\t@k2$2", &type metadata for AssertionAttribute.ProminentPresentationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5027D0);
  }
  return result;
}

unint64_t sub_1B40ACF0C()
{
  unint64_t result;

  result = qword_1ED5027C8;
  if (!qword_1ED5027C8)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE558, &type metadata for AssertionAttribute.FakeForegroundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5027C8);
  }
  return result;
}

unint64_t sub_1B40ACF54()
{
  unint64_t result;

  result = qword_1ED5027C0;
  if (!qword_1ED5027C0)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE580, &type metadata for AssertionAttribute.FakeForegroundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5027C0);
  }
  return result;
}

unint64_t sub_1B40ACF9C()
{
  unint64_t result;

  result = qword_1ED5027B8;
  if (!qword_1ED5027B8)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE4A0, &type metadata for AssertionAttribute.PresentationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5027B8);
  }
  return result;
}

unint64_t sub_1B40ACFE4()
{
  unint64_t result;

  result = qword_1ED5027B0;
  if (!qword_1ED5027B0)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE4C8, &type metadata for AssertionAttribute.PresentationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5027B0);
  }
  return result;
}

unint64_t sub_1B40AD02C()
{
  unint64_t result;

  result = qword_1EF08BE58;
  if (!qword_1EF08BE58)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE450, &type metadata for AssertionAttribute.DisableAPIThrottlingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BE58);
  }
  return result;
}

unint64_t sub_1B40AD074()
{
  unint64_t result;

  result = qword_1EF08BE60;
  if (!qword_1EF08BE60)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE478, &type metadata for AssertionAttribute.DisableAPIThrottlingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BE60);
  }
  return result;
}

unint64_t sub_1B40AD0BC()
{
  unint64_t result;

  result = qword_1ED502798;
  if (!qword_1ED502798)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE718, &type metadata for AssertionAttribute.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED502798);
  }
  return result;
}

unint64_t sub_1B40AD104()
{
  unint64_t result;

  result = qword_1ED502790;
  if (!qword_1ED502790)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BE740, &type metadata for AssertionAttribute.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED502790);
  }
  return result;
}

uint64_t sub_1B40AD148(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 7565169 && a2 == 0xE300000000000000;
  if (v2 || (sub_1B40BCD80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000001B40C0430 || (sub_1B40BCD80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65726F46656B6166 && a2 == 0xEE00646E756F7267 || (sub_1B40BCD80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x61746E6573657270 && a2 == 0xEC0000006E6F6974 || (sub_1B40BCD80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000001B40C0450)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_1B40BCD80();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_1B40AD384(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD00000000000001BLL && a2 == 0x80000001B40C0470)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_1B40BCD80();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_1B40AD414()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_1B40BC930();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1B40BC978();
  __swift_allocate_value_buffer(v4, qword_1ED502460);
  __swift_project_value_buffer(v4, (uint64_t)qword_1ED502460);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0C8FF20], v0);
  return sub_1B40BC960();
}

uint64_t static Logger.assertion.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1ED502398 != -1)
    swift_once();
  v2 = sub_1B40BC978();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED502460);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1B40AD590()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;

  sub_1B40BCBE8();
  sub_1B40BCA14();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B40BCA14();
  swift_bridgeObjectRelease();
  sub_1B40BCA14();
  v1 = OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_attributeAssertion;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BCB0);
  sub_1B40BC9F0();
  sub_1B40BCA14();
  swift_bridgeObjectRelease();
  sub_1B40BCA14();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B40BCA14();
  swift_bridgeObjectRelease();
  sub_1B40BCA14();
  v2 = *(_QWORD *)(v0 + v1);
  if (v2)
  {
    v3 = *(os_unfair_lock_s **)(*(_QWORD *)(v2 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
    swift_retain();
    os_unfair_lock_lock(v3);
    os_unfair_lock_unlock(v3);
    swift_release();
  }
  sub_1B40BC9F0();
  sub_1B40BCA14();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1B40AD7FC()
{
  return sub_1B40A5284(&OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_activityIdentifier);
}

uint64_t sub_1B40AD814(uint64_t a1, uint64_t a2)
{
  return sub_1B40A5354(a1, a2, &OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_activityIdentifier);
}

uint64_t (*sub_1B40AD820())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1B40AD870()
{
  return sub_1B40A5284(&OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_explanation);
}

uint64_t sub_1B40AD888(uint64_t a1, uint64_t a2)
{
  return sub_1B40A5354(a1, a2, &OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_explanation);
}

uint64_t (*sub_1B40AD894())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1B40AD8D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_attributeAssertion);
  if (v3)
  {
    v4 = *(os_unfair_lock_s **)(*(_QWORD *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
    swift_retain();
    os_unfair_lock_lock(v4);
    v5 = *(_QWORD *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
    v6 = *(_BYTE *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
    os_unfair_lock_unlock(v4);
    result = swift_release();
  }
  else
  {
    v5 = 0;
    v6 = 1;
  }
  *(_QWORD *)a1 = v5;
  *(_BYTE *)(a1 + 8) = v6;
  return result;
}

uint64_t PresentationAssertion.__allocating_init(explanation:activityIdentifier:presentationState:invalidationHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  objc_class *v7;
  id v15;

  v15 = objc_allocWithZone(v7);
  return PresentationAssertion.init(explanation:activityIdentifier:presentationState:invalidationHandler:)(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t PresentationAssertion.init(explanation:activityIdentifier:presentationState:invalidationHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char *v7;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t *v22;
  uint64_t *v23;
  objc_class *v24;
  id v25;
  unsigned int *v26;
  unsigned int *v27;
  unsigned int *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t result;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48[2];
  char v49;
  objc_super v50;

  v44 = a6;
  v45 = a7;
  v41 = type metadata accessor for AssertionAttribute();
  v13 = MEMORY[0x1E0C80A78](v41);
  v42 = (uint64_t)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v41 - v15;
  v17 = sub_1B40BC918();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v7[OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_attributeAssertion] = 0;
  v21 = &v7[OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_invalidationHandler];
  *(_QWORD *)v21 = 0;
  *((_QWORD *)v21 + 1) = 0;
  v22 = (uint64_t *)&v7[OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_activityIdentifier];
  v43 = a3;
  *v22 = a3;
  v22[1] = a4;
  v23 = (uint64_t *)&v7[OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_explanation];
  v46 = a1;
  *v23 = a1;
  v23[1] = a2;
  v24 = (objc_class *)type metadata accessor for PresentationAssertion();
  v50.receiver = v7;
  v50.super_class = v24;
  swift_bridgeObjectRetain();
  v47 = a2;
  swift_bridgeObjectRetain();
  v25 = objc_msgSendSuper2(&v50, sel_init, v41);
  v26 = (unsigned int *)MEMORY[0x1E0C8F918];
  switch(a5)
  {
    case 1:
      goto LABEL_10;
    case 2:
      v27 = (unsigned int *)MEMORY[0x1E0C8F930];
      goto LABEL_5;
    case 3:
      v27 = (unsigned int *)MEMORY[0x1E0C8F928];
LABEL_5:
      v29 = *v27;
      v30 = sub_1B40BC900();
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 104))(v20, v29, v30);
      v26 = (unsigned int *)MEMORY[0x1E0C8F958];
      goto LABEL_10;
    case 4:
      v28 = (unsigned int *)MEMORY[0x1E0C8F940];
      goto LABEL_7;
    case 5:
      v34 = sub_1B40BC90C();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v20, 1, 1, v34);
      goto LABEL_9;
    case 6:
      v28 = (unsigned int *)MEMORY[0x1E0C8F948];
LABEL_7:
      v31 = *v28;
      v32 = sub_1B40BC90C();
      v33 = *(_QWORD *)(v32 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v33 + 104))(v20, v31, v32);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v20, 0, 1, v32);
LABEL_9:
      v26 = (unsigned int *)MEMORY[0x1E0C8F920];
LABEL_10:
      (*(void (**)(char *, _QWORD, uint64_t))(v18 + 104))(v20, *v26, v17);
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v16, v20, v17);
      swift_storeEnumTagMultiPayload();
      v35 = v42;
      v48[0] = v43;
      v48[1] = a4;
      v49 = 1;
      sub_1B40A5C78((uint64_t)v16, v42);
      v36 = (_QWORD *)swift_allocObject();
      v37 = v45;
      v36[2] = v44;
      v36[3] = v37;
      v36[4] = v25;
      type metadata accessor for AttributeAssertion();
      swift_allocObject();
      v38 = (char *)v25;
      v39 = sub_1B40B685C(v46, v47, v48, v35, 0, 1, (uint64_t)sub_1B40A5CF0, (uint64_t)v36);
      swift_release();
      sub_1B40A455C((uint64_t)v16);
      (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
      *(_QWORD *)&v38[OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_attributeAssertion] = v39;
      swift_release();
      result = (uint64_t)v38;
      break;
    default:
      result = sub_1B40BCC48();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_1B40ADE5C()
{
  uint64_t v0;
  uint64_t result;

  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_attributeAssertion))
  {
    swift_retain();
    sub_1B40B6554();
    return swift_release();
  }
  return result;
}

uint64_t sub_1B40ADF20()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  unint64_t v3;
  char v4;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_attributeAssertion);
  if (!v1)
    return 0;
  v2 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
  v4 = *(_BYTE *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
  os_unfair_lock_unlock(v2);
  swift_release();
  if ((v4 & 1) != 0)
    return 0;
  if (v3 < 8)
    return qword_1B40BEC20[v3];
  result = sub_1B40BCD8C();
  __break(1u);
  return result;
}

uint64_t sub_1B40AE018()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  int v4;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_attributeAssertion);
  if (!v1)
    return 0;
  v2 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
  v4 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
  os_unfair_lock_unlock(v2);
  swift_release();
  if (v4 == 1)
    return v3 != 0;
  else
    return 2;
}

uint64_t sub_1B40AE11C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_activityIdentifier);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

id PresentationAssertion.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PresentationAssertion.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PresentationAssertion.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PresentationAssertion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PresentationAssertion()
{
  return objc_opt_self();
}

uint64_t sub_1B40AE29C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();

  return swift_deallocObject();
}

uint64_t sub_1B40AE2D0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_activityIdentifier, a2);
}

uint64_t sub_1B40AE2DC(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1B40A53AC(a1, a2, a3, a4, &OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_activityIdentifier);
}

uint64_t sub_1B40AE2F8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_explanation, a2);
}

uint64_t sub_1B40AE304(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1B40A53AC(a1, a2, a3, a4, &OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_explanation);
}

uint64_t method lookup function for PresentationAssertion()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PresentationAssertion.activityIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of PresentationAssertion.activityIdentifier.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of PresentationAssertion.activityIdentifier.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of PresentationAssertion.explanation.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of PresentationAssertion.explanation.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of PresentationAssertion.explanation.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of PresentationAssertion.state.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of PresentationAssertion.__allocating_init(explanation:activityIdentifier:presentationState:invalidationHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of PresentationAssertion.invalidate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of PresentationAssertion.snaInvalidationReason.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of PresentationAssertion.snaState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of PresentationAssertion.snaSessionIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t sub_1B40AE468()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1B40AE4E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;

  sub_1B40BCBE8();
  sub_1B40BCA14();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B40BCA14();
  swift_bridgeObjectRelease();
  sub_1B40BCA14();
  v1 = OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_attributeAssertion;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BCB0);
  sub_1B40BC9F0();
  sub_1B40BCA14();
  swift_bridgeObjectRelease();
  sub_1B40BCA14();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B40BCA14();
  swift_bridgeObjectRelease();
  sub_1B40BCA14();
  v2 = *(_QWORD *)(v0 + v1);
  if (v2)
  {
    v3 = *(os_unfair_lock_s **)(*(_QWORD *)(v2 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
    swift_retain();
    os_unfair_lock_lock(v3);
    os_unfair_lock_unlock(v3);
    swift_release();
  }
  sub_1B40BC9F0();
  sub_1B40BCA14();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1B40AE74C()
{
  return sub_1B40A5284(&OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_activityIdentifier);
}

uint64_t sub_1B40AE764(uint64_t a1, uint64_t a2)
{
  return sub_1B40A5354(a1, a2, &OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_activityIdentifier);
}

uint64_t (*sub_1B40AE770())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1B40AE7C0()
{
  return sub_1B40A5284(&OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_explanation);
}

uint64_t sub_1B40AE7D8(uint64_t a1, uint64_t a2)
{
  return sub_1B40A5354(a1, a2, &OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_explanation);
}

uint64_t (*sub_1B40AE7E4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1B40AE828@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_attributeAssertion);
  if (v3)
  {
    v4 = *(os_unfair_lock_s **)(*(_QWORD *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
    swift_retain();
    os_unfair_lock_lock(v4);
    v5 = *(_QWORD *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
    v6 = *(_BYTE *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
    os_unfair_lock_unlock(v4);
    result = swift_release();
  }
  else
  {
    v5 = 0;
    v6 = 1;
  }
  *(_QWORD *)a1 = v5;
  *(_BYTE *)(a1 + 8) = v6;
  return result;
}

char *ProminentPresentationAssertion.__allocating_init(explanation:activityIdentifier:duration:invalidationHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  objc_class *v7;
  id v15;

  v15 = objc_allocWithZone(v7);
  return ProminentPresentationAssertion.init(explanation:activityIdentifier:duration:invalidationHandler:)(a1, a2, a3, a4, a5, a6, a7);
}

char *ProminentPresentationAssertion.init(explanation:activityIdentifier:duration:invalidationHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  char *v7;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t *v20;
  uint64_t *v21;
  objc_class *v22;
  id v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33[2];
  char v34;
  objc_super v35;

  v31 = a5;
  v32 = a6;
  v30 = a1;
  v13 = type metadata accessor for AssertionAttribute();
  v14 = MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v30 - v17;
  *(_QWORD *)&v7[OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_attributeAssertion] = 0;
  v19 = &v7[OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_invalidationHandler];
  *(_QWORD *)v19 = 0;
  *((_QWORD *)v19 + 1) = 0;
  v20 = (uint64_t *)&v7[OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_activityIdentifier];
  *v20 = a3;
  v20[1] = a4;
  v21 = (uint64_t *)&v7[OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_explanation];
  *v21 = a1;
  v21[1] = a2;
  v22 = (objc_class *)type metadata accessor for ProminentPresentationAssertion();
  v35.receiver = v7;
  v35.super_class = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v23 = objc_msgSendSuper2(&v35, sel_init);
  if (a7 > 0.0)
    v24 = *(_QWORD *)&a7;
  else
    v24 = 0;
  swift_storeEnumTagMultiPayload();
  v33[0] = a3;
  v33[1] = a4;
  v34 = 1;
  sub_1B40A5C78((uint64_t)v18, (uint64_t)v16);
  v25 = (_QWORD *)swift_allocObject();
  v26 = v32;
  v25[2] = v31;
  v25[3] = v26;
  v25[4] = v23;
  type metadata accessor for AttributeAssertion();
  swift_allocObject();
  v27 = (char *)v23;
  v28 = sub_1B40B685C(v30, a2, v33, (uint64_t)v16, v24, a7 <= 0.0, (uint64_t)sub_1B40A5CF0, (uint64_t)v25);
  swift_release();
  sub_1B40A455C((uint64_t)v18);
  *(_QWORD *)&v27[OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_attributeAssertion] = v28;
  swift_release();
  return v27;
}

uint64_t sub_1B40AEBF4()
{
  uint64_t v0;
  uint64_t result;

  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_attributeAssertion))
  {
    swift_retain();
    sub_1B40B6554();
    return swift_release();
  }
  return result;
}

uint64_t sub_1B40AECB8()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  unint64_t v3;
  char v4;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_attributeAssertion);
  if (!v1)
    return 0;
  v2 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
  v4 = *(_BYTE *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
  os_unfair_lock_unlock(v2);
  swift_release();
  if ((v4 & 1) != 0)
    return 0;
  if (v3 < 8)
    return qword_1B40BECC8[v3];
  result = sub_1B40BCD8C();
  __break(1u);
  return result;
}

uint64_t sub_1B40AEDB0()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  int v4;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_attributeAssertion);
  if (!v1)
    return 0;
  v2 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
  v4 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
  os_unfair_lock_unlock(v2);
  swift_release();
  if (v4 == 1)
    return v3 != 0;
  else
    return 2;
}

uint64_t sub_1B40AEEB4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_activityIdentifier);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

id ProminentPresentationAssertion.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ProminentPresentationAssertion.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ProminentPresentationAssertion.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProminentPresentationAssertion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ProminentPresentationAssertion()
{
  return objc_opt_self();
}

uint64_t sub_1B40AF034()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();

  return swift_deallocObject();
}

uint64_t sub_1B40AF068@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_activityIdentifier, a2);
}

uint64_t sub_1B40AF074(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1B40A53AC(a1, a2, a3, a4, &OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_activityIdentifier);
}

uint64_t sub_1B40AF090@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_explanation, a2);
}

uint64_t sub_1B40AF09C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1B40A53AC(a1, a2, a3, a4, &OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_explanation);
}

uint64_t method lookup function for ProminentPresentationAssertion()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.activityIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.activityIdentifier.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.activityIdentifier.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.explanation.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.explanation.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.explanation.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.state.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.__allocating_init(explanation:activityIdentifier:duration:invalidationHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.invalidate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.snaInvalidationReason.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.snaState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.snaSessionIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t sub_1B40AF200()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1B40AF224()
{
  _QWORD *v0;
  uint64_t v1;
  _DWORD *v2;
  char *v3;
  char *v4;
  uint64_t result;

  type metadata accessor for AttributeAssertionManager();
  v0 = (_QWORD *)swift_allocObject();
  type metadata accessor for UnfairLock();
  v1 = swift_allocObject();
  v2 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = 0;
  v0[2] = v1;
  v0[4] = MEMORY[0x1E0DEE9E0];
  v3 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AssertionClient()), sel_init);
  v0[3] = v3;
  v4 = &v3[OBJC_IVAR____TtC16SessionAssertion15AssertionClient_delegate];
  swift_beginAccess();
  *((_QWORD *)v4 + 1) = &protocol witness table for AttributeAssertionManager;
  result = swift_unknownObjectWeakAssign();
  qword_1ED502400 = (uint64_t)v0;
  return result;
}

uint64_t static AttributeAssertionManager.shared.getter()
{
  if (qword_1ED502368 != -1)
    swift_once();
  swift_beginAccess();
  return swift_retain();
}

uint64_t static AttributeAssertionManager.shared.setter(uint64_t a1)
{
  if (qword_1ED502368 != -1)
    swift_once();
  swift_beginAccess();
  qword_1ED502400 = a1;
  return swift_release();
}

uint64_t (*static AttributeAssertionManager.shared.modify())()
{
  if (qword_1ED502368 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1B40AF440()
{
  swift_weakDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_1B40AF464(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  int *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  _QWORD *v18;
  _BYTE *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  os_unfair_lock_s *v24;
  uint64_t v25;
  char isUniquelyReferenced_nonNull_native;
  _BYTE v28[16];
  uint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v3 = v2;
  v4 = v1;
  v6 = (int *)type metadata accessor for AssertionAcquisitionRequest();
  MEMORY[0x1E0C80A78](v6);
  v8 = &v28[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1B40B3C64(a1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_attribute, (uint64_t)&v8[v6[5]], (uint64_t (*)(_QWORD))type metadata accessor for AssertionAttribute);
  v10 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v11 = a1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_acquisitionDate;
  v12 = sub_1B40BC8F4();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v8, v11, v12);
  v13 = *(_QWORD *)(a1 + 16);
  v14 = *(_QWORD *)(a1 + 24);
  v15 = *(_BYTE *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 56);
  v17 = *(_BYTE *)(a1 + 64);
  v18 = &v8[v6[6]];
  *v18 = v10;
  v18[1] = v9;
  v19 = &v8[v6[8]];
  *(_QWORD *)v19 = v16;
  v19[8] = v17;
  v20 = &v8[v6[7]];
  *(_QWORD *)v20 = v13;
  *((_QWORD *)v20 + 1) = v14;
  v20[16] = v15;
  v29 = v4[3];
  v30 = v8;
  swift_bridgeObjectRetain();
  sub_1B40A41C0();
  sub_1B40BCB40();
  if (!v3)
  {
    v22 = v31;
    v21 = v32;
    v23 = a1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier;
    *(_QWORD *)v23 = v31;
    *(_QWORD *)(v23 + 8) = v21;
    *(_BYTE *)(v23 + 16) = 0;
    v24 = *(os_unfair_lock_s **)(v4[2] + 16);
    os_unfair_lock_lock(v24);
    type metadata accessor for AttributeAssertionManager.WeakAttributeAssertion();
    v25 = swift_allocObject();
    swift_weakInit();
    swift_weakAssign();
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v33 = v4[4];
    v4[4] = 0x8000000000000000;
    sub_1B40B1CBC(v25, v22, v21, isUniquelyReferenced_nonNull_native);
    v4[4] = v33;
    swift_bridgeObjectRelease();
    swift_endAccess();
    os_unfair_lock_unlock(v24);
  }
  return sub_1B40AA814((uint64_t)v8);
}

uint64_t type metadata accessor for AttributeAssertionManager.WeakAttributeAssertion()
{
  return objc_opt_self();
}

void sub_1B40AF6B4(unsigned int *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  v5 = *((_QWORD *)a1 + 1);
  v6 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + 16) + 16);
  os_unfair_lock_lock(v6);
  sub_1B40AF7B0(v1, v3 | (v4 << 32), v5, &v8);
  if (v2)
  {
    os_unfair_lock_unlock(v6);
    __break(1u);
  }
  else
  {
    os_unfair_lock_unlock(v6);
    if (v8)
    {
      MEMORY[0x1E0C80A78](v7);
      sub_1B40BCB40();
      swift_release();
    }
  }
}

uint64_t sub_1B40AF7B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t result;
  uint64_t Strong;
  uint64_t v20;

  v8 = (uint64_t *)(a1 + 32);
  swift_beginAccess();
  v9 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v9 + 16) && (v10 = sub_1B40B175C(a2, a3), (v11 & 1) != 0))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v10);
    swift_retain();
  }
  else
  {
    v12 = 0;
  }
  swift_beginAccess();
  v13 = sub_1B40B175C(a2, a3);
  if ((v14 & 1) != 0)
  {
    v15 = v13;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v17 = *v8;
    v20 = *v8;
    *v8 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_1B40B1EB4();
      v17 = v20;
    }
    sub_1B40B1ADC(v15, v17);
    *v8 = v17;
    swift_release();
    swift_bridgeObjectRelease();
  }
  result = swift_endAccess();
  if (v12)
  {
    Strong = swift_weakLoadStrong();
    result = swift_release();
  }
  else
  {
    Strong = 0;
  }
  *a4 = Strong;
  return result;
}

uint64_t AttributeAssertionManager.deinit()
{
  uint64_t v0;

  swift_release();

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AttributeAssertionManager.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

Swift::Void __swiftcall AttributeAssertionManager.didConnect()()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  char *Strong;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t *v7;
  void (**v8)(uint64_t, uint64_t, uint64_t, uint64_t *);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  os_unfair_lock_s *v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void (**v38)(uint64_t, uint64_t, uint64_t, uint64_t *);
  uint64_t v39;
  int *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  char v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  char *v63;
  id v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  id v69;
  id v70;
  uint64_t v71;
  NSObject *v72;
  os_log_type_t v73;
  uint8_t *v74;
  NSObject *v75;
  os_log_type_t v76;
  _QWORD *v77;
  uint8_t *v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  os_unfair_lock_s *v82;
  uint64_t v83;
  void (**v84)(uint64_t, uint64_t, uint64_t, uint64_t *);
  NSObject *v85;
  os_log_type_t v86;
  void *v87;
  uint64_t v88;
  char *v89;
  uint64_t *v90;
  int64_t v91;
  void (*v92)(uint64_t, uint64_t, uint64_t, uint64_t *);
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v99;
  int64_t v100;
  uint64_t v101;
  os_unfair_lock_s *v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  char v106;
  unint64_t v107;
  char v108;
  unint64_t v109;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v111;
  os_unfair_lock_s *v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  os_unfair_lock_s *v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  char v122;
  uint64_t v123;
  unint64_t v124;
  char v125;
  unint64_t v126;
  char v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  int v132;
  int v133;
  uint64_t v134;
  uint8_t *v135;
  char *v136;
  unint64_t v137;
  uint64_t v138;
  _BYTE *v139;
  void *v140;
  void *v141;
  NSObject *v142;
  os_log_type_t v143;
  uint8_t *v144;
  uint64_t v145;
  uint64_t v146;
  _QWORD *v147;
  void *v148;
  char *v149;
  char *v150;
  uint64_t *v151;
  uint64_t *v152;
  void (**v153)(uint64_t, uint64_t, uint64_t, uint64_t *);
  uint64_t v154;
  char *v155;
  uint64_t v156;
  uint64_t v157;
  uint8_t *v158;
  unint64_t v159;
  void (**v160)(uint64_t, uint64_t, uint64_t, uint64_t *);
  unint64_t v161;
  os_unfair_lock_t v162;
  unint64_t v163;
  uint64_t v164;
  int64_t v165;
  unint64_t v166;
  uint64_t v167;
  uint64_t v168;
  id v169[4];

  v1 = v0;
  v145 = sub_1B40BC924();
  v146 = *(_QWORD *)(v145 - 8);
  MEMORY[0x1E0C80A78](v145);
  Strong = (char *)&v145 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v156 = type metadata accessor for AssertionAcquisitionRequest();
  MEMORY[0x1E0C80A78](v156);
  v155 = (char *)&v145 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502438);
  MEMORY[0x1E0C80A78](v5);
  v7 = (uint8_t *)&v145 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v157 = type metadata accessor for AssertionReconnectProperties();
  v8 = *(void (***)(uint64_t, uint64_t, uint64_t, uint64_t *))(v157 - 8);
  v9 = MEMORY[0x1E0C80A78](v157);
  v162 = (os_unfair_lock_t)((char *)&v145 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v9);
  v154 = (uint64_t)&v145 - v11;
  if (qword_1ED502398 != -1)
    goto LABEL_123;
  while (1)
  {
    v158 = v7;
    v12 = sub_1B40BC978();
    v13 = __swift_project_value_buffer(v12, (uint64_t)qword_1ED502460);
    v14 = sub_1B40BC96C();
    v15 = sub_1B40BCB04();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1B40A0000, v14, v15, "Reconnecting assertions", v16, 2u);
      MEMORY[0x1B5E3647C](v16, -1, -1);
    }

    v164 = v1[2];
    v17 = *(os_unfair_lock_s **)(v164 + 16);
    os_unfair_lock_lock(v17);
    v18 = v1 + 4;
    swift_beginAccess();
    v19 = swift_bridgeObjectRetain();
    v20 = sub_1B40B0BE0(v19);
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v17);
    v151 = v1;
    v150 = (char *)v13;
    v149 = Strong;
    if (v20 >> 62)
    {
      swift_bridgeObjectRetain();
      v21 = sub_1B40BCC54();
    }
    else
    {
      v21 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    v163 = v20;
    v165 = v21;
    v148 = 0;
    if (v21)
      break;
    v23 = (_QWORD *)MEMORY[0x1E0DEE9D8];
LABEL_20:
    swift_bridgeObjectRelease();
    v31 = (_QWORD *)sub_1B40B3814((uint64_t)v23);
    swift_bridgeObjectRelease();
    v152 = v18;
    v147 = v31;
    if (v21)
    {
      if (v21 < 1)
        goto LABEL_126;
      v161 = v20 & 0xC000000000000001;
      swift_bridgeObjectRetain();
      v32 = 0;
      v33 = MEMORY[0x1E0DEE9D8];
      v1 = (uint64_t *)v157;
      v34 = (uint64_t)v158;
      v153 = v8;
      do
      {
        v166 = v33;
        if (v161)
        {
          v35 = MEMORY[0x1B5E35E58](v32, v20);
        }
        else
        {
          v35 = *(_QWORD *)(v20 + 8 * v32 + 32);
          swift_retain();
        }
        v36 = (uint64_t *)(v35 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier);
        if ((*(_BYTE *)(v35 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier + 16) & 1) != 0)
        {
          v37 = 1;
        }
        else
        {
          v39 = *v36;
          v38 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))v36[1];
          v159 = HIDWORD(*v36);
          v160 = v38;
          v40 = (int *)v156;
          v41 = (uint64_t)v155;
          sub_1B40B3C64(v35 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_attribute, (uint64_t)&v155[*(int *)(v156 + 20)], (uint64_t (*)(_QWORD))type metadata accessor for AssertionAttribute);
          v43 = *(_QWORD *)(v35 + 40);
          v42 = *(_QWORD *)(v35 + 48);
          v44 = v35 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_acquisitionDate;
          v45 = sub_1B40BC8F4();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 16))(v41, v44, v45);
          v47 = *(_QWORD *)(v35 + 16);
          v46 = *(_QWORD *)(v35 + 24);
          v48 = *(_BYTE *)(v35 + 32);
          v49 = *(_QWORD *)(v35 + 56);
          v50 = *(_BYTE *)(v35 + 64);
          v51 = (_QWORD *)(v41 + v40[6]);
          *v51 = v43;
          v51[1] = v42;
          v52 = v41 + v40[8];
          *(_QWORD *)v52 = v49;
          *(_BYTE *)(v52 + 8) = v50;
          v53 = v40[7];
          v1 = (uint64_t *)v157;
          v34 = (uint64_t)v158;
          v54 = v41 + v53;
          *(_QWORD *)v54 = v47;
          *(_QWORD *)(v54 + 8) = v46;
          *(_BYTE *)(v54 + 16) = v48;
          sub_1B40B3C64(v41, v34 + *((int *)v1 + 5), (uint64_t (*)(_QWORD))type metadata accessor for AssertionAcquisitionRequest);
          *(_DWORD *)v34 = v39;
          v8 = v153;
          *(_DWORD *)(v34 + 4) = v159;
          *(_QWORD *)(v34 + 8) = v160;
          swift_bridgeObjectRetain();
          v21 = v165;
          sub_1B40A41C0();
          v55 = v41;
          v20 = v163;
          sub_1B40AA814(v55);
          v37 = 0;
        }
        v8[7](v34, v37, 1, v1);
        swift_release();
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t *))v8[6])(v34, 1, v1) == 1)
        {
          sub_1B40B3888(v34);
          v33 = v166;
        }
        else
        {
          v56 = v154;
          sub_1B40B3C20(v34, v154);
          sub_1B40B3C20(v56, (uint64_t)v162);
          v33 = v166;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v33 = sub_1B40B1448(0, *(_QWORD *)(v33 + 16) + 1, 1, v33);
          v58 = *(_QWORD *)(v33 + 16);
          v57 = *(_QWORD *)(v33 + 24);
          if (v58 >= v57 >> 1)
            v33 = sub_1B40B1448(v57 > 1, v58 + 1, 1, v33);
          *(_QWORD *)(v33 + 16) = v58 + 1;
          sub_1B40B3C20((uint64_t)v162, v33+ ((*((unsigned __int8 *)v8 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v8 + 80))+ (_QWORD)v8[9] * v58);
        }
        ++v32;
      }
      while (v21 != v32);
      swift_bridgeObjectRelease();
    }
    else
    {
      v33 = MEMORY[0x1E0DEE9D8];
    }
    v59 = swift_bridgeObjectRelease();
    v60 = (uint64_t)v151;
    MEMORY[0x1E0C80A78](v59);
    *(&v145 - 2) = v61;
    *(&v145 - 1) = v33;
    v62 = v148;
    sub_1B40BCB40();
    Strong = v150;
    v63 = v149;
    if (v62)
    {
      swift_bridgeObjectRelease();
      v169[0] = v62;
      v64 = v62;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BEA8);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v65 = v146;
        if (v168 == 3)
        {

          swift_bridgeObjectRelease();
          v66 = sub_1B40BC96C();
          v67 = sub_1B40BCB04();
          if (os_log_type_enabled(v66, v67))
          {
            v68 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v68 = 0;
            _os_log_impl(&dword_1B40A0000, v66, v67, "Could not reconnect assertions because server is missing", v68, 2u);
            MEMORY[0x1B5E3647C](v68, -1, -1);
          }

          return;
        }
      }
      else
      {
        v65 = v146;
      }

      v169[0] = v62;
      v70 = v62;
      v71 = v145;
      if (!swift_dynamicCast())
      {
        v141 = v62;
        swift_bridgeObjectRelease();
LABEL_118:

        v142 = sub_1B40BC96C();
        v143 = sub_1B40BCB04();
        if (os_log_type_enabled(v142, v143))
        {
          v144 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v144 = 0;
          _os_log_impl(&dword_1B40A0000, v142, v143, "Could not reconnect assertions for unexpected error", v144, 2u);
          MEMORY[0x1B5E3647C](v144, -1, -1);
        }

        return;
      }
      if ((*(unsigned int (**)(char *, uint64_t))(v65 + 88))(v63, v71) != *MEMORY[0x1E0C8FC68])
      {
        v141 = v62;
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v65 + 8))(v63, v71);
        goto LABEL_118;
      }

      v72 = sub_1B40BC96C();
      v73 = sub_1B40BCB04();
      if (os_log_type_enabled(v72, v73))
      {
        v74 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v74 = 0;
        _os_log_impl(&dword_1B40A0000, v72, v73, "Could not reconnect assertions because client is not entitled", v74, 2u);
        MEMORY[0x1B5E3647C](v74, -1, -1);
      }

      v69 = (id)sub_1B40B3AC8(MEMORY[0x1E0DEE9D8]);
      v158 = 0;
    }
    else
    {
      v158 = 0;
      swift_bridgeObjectRelease();
      v69 = v169[0];
    }
    swift_bridgeObjectRetain_n();
    v75 = sub_1B40BC96C();
    v76 = sub_1B40BCB04();
    v77 = &unk_1B40BE000;
    if (os_log_type_enabled(v75, v76))
    {
      v78 = (uint8_t *)swift_slowAlloc();
      v1 = (uint64_t *)swift_slowAlloc();
      v169[0] = v1;
      *(_DWORD *)v78 = 136446210;
      sub_1B40B3BDC();
      swift_bridgeObjectRetain();
      v79 = sub_1B40BC9CC();
      v81 = v80;
      swift_bridgeObjectRelease();
      v168 = sub_1B40A9EB0(v79, v81, (uint64_t *)v169);
      v77 = (_QWORD *)&unk_1B40BE000;
      sub_1B40BCB7C();
      swift_bridgeObjectRelease_n();
      Strong = v150;
      v60 = (uint64_t)v151;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B40A0000, v75, v76, "Map: %{public}s", v78, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E3647C](v1, -1, -1);
      MEMORY[0x1B5E3647C](v78, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v82 = *(os_unfair_lock_s **)(v164 + 16);
    os_unfair_lock_lock(v82);
    sub_1B40B0F20((uint64_t)v69, v60);
    os_unfair_lock_unlock(v82);
    v83 = sub_1B40B0DA8((uint64_t)v69);
    v7 = (uint8_t *)v83;
    if (*(_QWORD *)(v83 + 16) <= v147[2] >> 3)
    {
      v169[0] = v147;
      sub_1B40B21A8(v83);
      swift_bridgeObjectRelease();
      v84 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))v169[0];
    }
    else
    {
      v84 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))sub_1B40B231C(v83, (uint64_t)v147);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRetain_n();
    v85 = sub_1B40BC96C();
    v86 = sub_1B40BCB04();
    if (os_log_type_enabled(v85, v86))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v87 = (void *)swift_slowAlloc();
      v169[0] = v87;
      *(_DWORD *)v7 = v77[59];
      v1 = (uint64_t *)(v7 + 4);
      sub_1B40B3BDC();
      swift_bridgeObjectRetain();
      v88 = sub_1B40BCAE0();
      Strong = v89;
      swift_bridgeObjectRelease();
      v168 = sub_1B40A9EB0(v88, (unint64_t)Strong, (uint64_t *)v169);
      sub_1B40BCB7C();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B40A0000, v85, v86, "Failed identifiers: %{public}s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E3647C](v87, -1, -1);
      MEMORY[0x1B5E3647C](v7, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v90 = v152;
    v8 = v84;
    v91 = 0;
    v92 = v8[7];
    v163 = (unint64_t)(v8 + 7);
    v93 = 1 << *((_BYTE *)v8 + 32);
    v94 = -1;
    if (v93 < 64)
      v94 = ~(-1 << v93);
    v95 = v94 & (unint64_t)v92;
    v165 = (unint64_t)(v93 + 63) >> 6;
    v157 = MEMORY[0x1E0DEE9C0] + 8;
    v160 = v8;
    while (1)
    {
      if (v95)
      {
        v96 = __clz(__rbit64(v95));
        v95 &= v95 - 1;
        v97 = v96 | (v91 << 6);
        goto LABEL_79;
      }
      if (__OFADD__(v91++, 1))
      {
        __break(1u);
        goto LABEL_122;
      }
      if (v91 >= v165)
        goto LABEL_115;
      v99 = *(_QWORD *)(v163 + 8 * v91);
      if (!v99)
        break;
LABEL_78:
      v95 = (v99 - 1) & v99;
      v97 = __clz(__rbit64(v99)) + (v91 << 6);
LABEL_79:
      v101 = (uint64_t)v8[6] + 16 * v97;
      v102 = *(os_unfair_lock_s **)(v164 + 16);
      v1 = *(uint64_t **)v101;
      v103 = *(_QWORD *)(v101 + 8);
      os_unfair_lock_lock(v102);
      v104 = *v90;
      if (*(_QWORD *)(*v90 + 16) && (v105 = sub_1B40B175C((uint64_t)v1, v103), (v106 & 1) != 0))
      {
        v7 = *(uint8_t **)(*(_QWORD *)(v104 + 56) + 8 * v105);
        swift_retain();
      }
      else
      {
        v7 = 0;
      }
      swift_beginAccess();
      v107 = sub_1B40B175C((uint64_t)v1, v103);
      if ((v108 & 1) != 0)
      {
        v109 = v107;
        v1 = (uint64_t *)v95;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v111 = *v90;
        v167 = *v90;
        *v90 = 0x8000000000000000;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_1B40B1EB4();
          v111 = v167;
        }
        sub_1B40B1ADC(v109, v111);
        *v90 = v111;
        swift_release();
        swift_bridgeObjectRelease();
      }
      swift_endAccess();
      if (v7)
      {
        Strong = (char *)swift_weakLoadStrong();
        swift_release();
      }
      else
      {
        Strong = 0;
      }
      os_unfair_lock_unlock(v102);
      if (Strong)
      {
        v112 = *(os_unfair_lock_s **)(*(_QWORD *)&Strong[OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock]
                                    + 16);
        swift_retain();
        os_unfair_lock_lock(v112);
        v113 = &Strong[OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state];
        if ((Strong[OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8] & 1) == 0)
        {
          os_unfair_lock_unlock(v112);
          goto LABEL_65;
        }
        *(_QWORD *)v113 = 7;
        v113[8] = 0;
        *(_QWORD *)&Strong[OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_invalidationState] = 0;
        swift_bridgeObjectRelease();
        v1 = (uint64_t *)&Strong[OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier];
        if ((Strong[OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier + 16] & 1) != 0)
          goto LABEL_127;
        v114 = *(_QWORD *)&Strong[OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_manager];
        v115 = *v1;
        v116 = v1[1];
        v117 = *(os_unfair_lock_s **)(*(_QWORD *)(v114 + 16) + 16);
        swift_retain();
        v162 = v117;
        os_unfair_lock_lock(v117);
        v118 = (uint64_t *)(v114 + 32);
        swift_beginAccess();
        v119 = *(_QWORD *)(v114 + 32);
        v120 = *(_QWORD *)(v119 + 16);
        v166 = v115;
        if (v120 && (v121 = sub_1B40B175C(v115, v116), (v122 & 1) != 0))
        {
          v123 = *(_QWORD *)(*(_QWORD *)(v119 + 56) + 8 * v121);
          swift_retain();
        }
        else
        {
          v123 = 0;
        }
        swift_beginAccess();
        v161 = v116;
        v124 = sub_1B40B175C(v166, v116);
        if ((v125 & 1) != 0)
        {
          v126 = v124;
          v159 = v95;
          v127 = swift_isUniquelyReferenced_nonNull_native();
          v128 = *v118;
          v167 = *v118;
          *v118 = 0x8000000000000000;
          if ((v127 & 1) == 0)
          {
            sub_1B40B1EB4();
            v128 = v167;
          }
          sub_1B40B1ADC(v126, v128);
          *v118 = v128;
          swift_release();
          swift_bridgeObjectRelease();
          v95 = v159;
        }
        swift_endAccess();
        if (!v123)
        {
          os_unfair_lock_unlock(v162);
LABEL_106:
          swift_release();
          goto LABEL_113;
        }
        v129 = swift_weakLoadStrong();
        swift_release();
        os_unfair_lock_unlock(v162);
        if (!v129)
          goto LABEL_106;
        v131 = v95;
        MEMORY[0x1E0C80A78](v130);
        *((_DWORD *)&v145 - 8) = v133;
        *((_DWORD *)&v145 - 7) = v132;
        *(&v145 - 3) = v161;
        *(&v145 - 2) = v134;
        v135 = v158;
        sub_1B40BCB40();
        if (v135)
        {
          swift_release();

          swift_release();
          v158 = 0;
        }
        else
        {
          v158 = 0;
          swift_release();
          swift_release();
        }
        v95 = v131;
LABEL_113:
        v136 = &Strong[OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_invalidationHandler];
        v7 = *(uint8_t **)&Strong[OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_invalidationHandler];
        *(_QWORD *)v136 = 0;
        *((_QWORD *)v136 + 1) = 0;
        sub_1B40B3BCC((uint64_t)v7);
        sub_1B40A5F54((uint64_t)v7);
        *v1 = 0;
        v1[1] = 0;
        *((_BYTE *)v1 + 16) = 1;
        os_unfair_lock_unlock(v112);
        v90 = v152;
        v8 = v160;
        if (v7)
        {
          sub_1B40AA7D0();
          v137 = v95;
          v138 = swift_allocError();
          *v139 = 0;
          swift_retain();
          ((void (*)(char *, uint64_t))v7)(Strong, v138);
          v140 = (void *)v138;
          v95 = v137;

          sub_1B40A5F54((uint64_t)v7);
          sub_1B40A5F54((uint64_t)v7);
        }
LABEL_65:
        swift_release_n();
      }
    }
    v100 = v91 + 1;
    if (v91 + 1 >= v165)
      goto LABEL_115;
    v99 = *(_QWORD *)(v163 + 8 * v100);
    if (v99)
      goto LABEL_77;
    v100 = v91 + 2;
    if (v91 + 2 >= v165)
      goto LABEL_115;
    v99 = *(_QWORD *)(v163 + 8 * v100);
    if (v99)
      goto LABEL_77;
    v100 = v91 + 3;
    if (v91 + 3 >= v165)
    {
LABEL_115:
      swift_release();
      return;
    }
    v99 = *(_QWORD *)(v163 + 8 * v100);
    if (v99)
    {
LABEL_77:
      v91 = v100;
      goto LABEL_78;
    }
    while (1)
    {
      v91 = v100 + 1;
      if (__OFADD__(v100, 1))
        break;
      if (v91 >= v165)
        goto LABEL_115;
      v99 = *(_QWORD *)(v163 + 8 * v91);
      ++v100;
      if (v99)
        goto LABEL_78;
    }
LABEL_122:
    __break(1u);
LABEL_123:
    swift_once();
  }
  if (v21 >= 1)
  {
    v1 = 0;
    v22 = v20 & 0xC000000000000001;
    v23 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    do
    {
      if (v22)
        v25 = MEMORY[0x1B5E35E58](v1, v20);
      else
        v25 = swift_retain();
      v27 = *(_QWORD *)(v25 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier);
      v26 = *(_QWORD *)(v25 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier + 8);
      v28 = *(_BYTE *)(v25 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier + 16);
      swift_release();
      if ((v28 & 1) == 0)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v23 = sub_1B40B1650(0, v23[2] + 1, 1, v23);
        v30 = v23[2];
        v29 = v23[3];
        if (v30 >= v29 >> 1)
          v23 = sub_1B40B1650((_QWORD *)(v29 > 1), v30 + 1, 1, v23);
        v23[2] = v30 + 1;
        v24 = &v23[2 * v30];
        v24[4] = v27;
        v24[5] = v26;
        v20 = v163;
      }
      v1 = (uint64_t *)((char *)v1 + 1);
      v21 = v165;
    }
    while ((uint64_t *)v165 != v1);
    goto LABEL_20;
  }
  __break(1u);
LABEL_126:
  __break(1u);
LABEL_127:
  __break(1u);
}

uint64_t sub_1B40B0BE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t result;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;

  v11 = MEMORY[0x1E0DEE9D8];
  v1 = a1 + 64;
  v2 = 1 << *(_BYTE *)(a1 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a1 + 64);
  v5 = (unint64_t)(v2 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  while (v4)
  {
    v4 &= v4 - 1;
LABEL_22:
    result = swift_weakLoadStrong();
    if (result)
    {
      MEMORY[0x1B5E35CF0]();
      if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1B40BCAC8();
      sub_1B40BCAD4();
      result = sub_1B40BCABC();
    }
  }
  v8 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
    goto LABEL_28;
  }
  if (v8 >= v5)
    goto LABEL_26;
  v9 = *(_QWORD *)(v1 + 8 * v8);
  ++v7;
  if (v9)
    goto LABEL_21;
  v7 = v8 + 1;
  if (v8 + 1 >= v5)
    goto LABEL_26;
  v9 = *(_QWORD *)(v1 + 8 * v7);
  if (v9)
    goto LABEL_21;
  v7 = v8 + 2;
  if (v8 + 2 >= v5)
    goto LABEL_26;
  v9 = *(_QWORD *)(v1 + 8 * v7);
  if (v9)
    goto LABEL_21;
  v7 = v8 + 3;
  if (v8 + 3 >= v5)
    goto LABEL_26;
  v9 = *(_QWORD *)(v1 + 8 * v7);
  if (v9)
  {
LABEL_21:
    v4 = (v9 - 1) & v9;
    goto LABEL_22;
  }
  v10 = v8 + 4;
  if (v10 >= v5)
  {
LABEL_26:
    swift_release();
    return v11;
  }
  v9 = *(_QWORD *)(v1 + 8 * v10);
  if (v9)
  {
    v7 = v10;
    goto LABEL_21;
  }
  while (1)
  {
    v7 = v10 + 1;
    if (__OFADD__(v10, 1))
      break;
    if (v7 >= v5)
      goto LABEL_26;
    v9 = *(_QWORD *)(v1 + 8 * v7);
    ++v10;
    if (v9)
      goto LABEL_21;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1B40B0DA8(uint64_t a1)
{
  uint64_t result;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  _BYTE v14[16];
  uint64_t v15;

  sub_1B40B3BDC();
  result = sub_1B40BCAEC();
  v3 = 0;
  v15 = result;
  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8)
      goto LABEL_23;
    v12 = *(_QWORD *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      v3 = v11 + 1;
      if (v11 + 1 >= v8)
        goto LABEL_23;
      v12 = *(_QWORD *)(v4 + 8 * v3);
      if (!v12)
      {
        v3 = v11 + 2;
        if (v11 + 2 >= v8)
          goto LABEL_23;
        v12 = *(_QWORD *)(v4 + 8 * v3);
        if (!v12)
        {
          v3 = v11 + 3;
          if (v11 + 3 >= v8)
            goto LABEL_23;
          v12 = *(_QWORD *)(v4 + 8 * v3);
          if (!v12)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_5:
    result = sub_1B40B2050((uint64_t)v14, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v10), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v10 + 8));
  }
  v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    return v15;
  }
  v12 = *(_QWORD *)(v4 + 8 * v13);
  if (v12)
  {
    v3 = v13;
    goto LABEL_22;
  }
  while (1)
  {
    v3 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v3 >= v8)
      goto LABEL_23;
    v12 = *(_QWORD *)(v4 + 8 * v3);
    ++v13;
    if (v12)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1B40B0F20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  int64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t Strong;
  unint64_t v26;
  uint64_t v27;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v29;
  char v30;
  unint64_t v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  char v35;
  unint64_t v36;
  char v37;
  _QWORD *v38;
  uint64_t v39;
  BOOL v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t result;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;

  v2 = a1;
  v3 = a1 + 64;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v7 = (uint64_t *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_beginAccess();
  v8 = 0;
  v9 = (unint64_t)(v4 + 63) >> 6;
  v49 = v3;
  v50 = v2;
  v48 = v9;
  while (1)
  {
    if (v6)
    {
      v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v11 = v10 | (v8 << 6);
      goto LABEL_22;
    }
    v12 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    if (v12 >= v9)
      return swift_release();
    v13 = *(_QWORD *)(v3 + 8 * v12);
    ++v8;
    if (!v13)
    {
      v8 = v12 + 1;
      if (v12 + 1 >= v9)
        return swift_release();
      v13 = *(_QWORD *)(v3 + 8 * v8);
      if (!v13)
      {
        v8 = v12 + 2;
        if (v12 + 2 >= v9)
          return swift_release();
        v13 = *(_QWORD *)(v3 + 8 * v8);
        if (!v13)
          break;
      }
    }
LABEL_21:
    v6 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v8 << 6);
LABEL_22:
    v15 = (_QWORD *)*v7;
    if (*(_QWORD *)(*v7 + 16))
    {
      v16 = 16 * v11;
      v17 = *(_QWORD *)(v2 + 48);
      v18 = *(_QWORD *)(v17 + v16 + 8);
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
      v53 = *v19;
      v20 = v19[1];
      v21 = *(_QWORD *)(v17 + v16);
      v22 = sub_1B40B175C(v21, v18);
      if ((v23 & 1) != 0)
      {
        v24 = *(_QWORD *)(v15[7] + 8 * v22);
        Strong = swift_weakLoadStrong();
        if (Strong)
        {
          v51 = v18;
          v26 = v53 | ((unint64_t)HIDWORD(v53) << 32);
          v27 = Strong + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier;
          *(_QWORD *)v27 = v26;
          *(_QWORD *)(v27 + 8) = v20;
          *(_BYTE *)(v27 + 16) = 0;
          swift_beginAccess();
          v52 = v24;
          swift_retain_n();
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v29 = *v7;
          v54 = (_QWORD *)*v7;
          *v7 = 0x8000000000000000;
          v31 = sub_1B40B175C(v26, v20);
          v32 = *(_QWORD *)(v29 + 16);
          v33 = (v30 & 1) == 0;
          v34 = v32 + v33;
          if (__OFADD__(v32, v33))
            goto LABEL_40;
          v35 = v30;
          if (*(_QWORD *)(v29 + 24) >= v34)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              sub_1B40B1EB4();
          }
          else
          {
            sub_1B40B17E0(v34, isUniquelyReferenced_nonNull_native);
            v36 = sub_1B40B175C(v26, v20);
            if ((v35 & 1) != (v37 & 1))
              goto LABEL_43;
            v31 = v36;
          }
          if ((v35 & 1) != 0)
          {
            *(_QWORD *)(v54[7] + 8 * v31) = v52;
            swift_release();
          }
          else
          {
            v54[(v31 >> 6) + 8] |= 1 << v31;
            v38 = (_QWORD *)(v54[6] + 16 * v31);
            *v38 = v53;
            v38[1] = v20;
            *(_QWORD *)(v54[7] + 8 * v31) = v52;
            v39 = v54[2];
            v40 = __OFADD__(v39, 1);
            v41 = v39 + 1;
            if (v40)
              goto LABEL_42;
            v54[2] = v41;
          }
          *v7 = (uint64_t)v54;
          swift_bridgeObjectRelease();
          swift_endAccess();
          swift_beginAccess();
          v42 = sub_1B40B175C(v21, v51);
          v3 = v49;
          v2 = v50;
          if ((v43 & 1) != 0)
          {
            v44 = v42;
            v45 = swift_isUniquelyReferenced_nonNull_native();
            v46 = *v7;
            v55 = *v7;
            *v7 = 0x8000000000000000;
            if ((v45 & 1) == 0)
            {
              sub_1B40B1EB4();
              v46 = v55;
            }
            sub_1B40B1ADC(v44, v46);
            *v7 = v46;
            swift_release();
            swift_bridgeObjectRelease();
          }
          swift_endAccess();
          swift_release();
          swift_release();
          v9 = v48;
        }
      }
    }
  }
  v14 = v12 + 3;
  if (v14 >= v9)
    return swift_release();
  v13 = *(_QWORD *)(v3 + 8 * v14);
  if (v13)
  {
    v8 = v14;
    goto LABEL_21;
  }
  while (1)
  {
    v8 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v8 >= v9)
      return swift_release();
    v13 = *(_QWORD *)(v3 + 8 * v8);
    ++v14;
    if (v13)
      goto LABEL_21;
  }
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  result = sub_1B40BCDA4();
  __break(1u);
  return result;
}

void AttributeAssertionManager.didInvalidate(invalidationMessage:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  uint64_t v8;
  os_unfair_lock_s *v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14[3];

  v2 = v1;
  v3 = *a1;
  v4 = a1[1];
  v6 = a1[2];
  v5 = a1[3];
  v7 = *(os_unfair_lock_s **)(*(_QWORD *)(v2 + 16) + 16);
  os_unfair_lock_lock(v7);
  sub_1B40AF7B0(v2, v3, v4, v14);
  os_unfair_lock_unlock(v7);
  v8 = v14[0];
  if (v14[0])
  {
    v14[0] = 0;
    v14[1] = 0;
    v9 = *(os_unfair_lock_s **)(*(_QWORD *)(v8 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
    swift_bridgeObjectRetain();
    swift_retain();
    os_unfair_lock_lock(v9);
    sub_1B40B6748(v8, v6, v5, v14);
    os_unfair_lock_unlock(v9);
    v10 = (void (*)(uint64_t, void *))v14[0];
    if (v14[0])
    {
      sub_1B40AA7D0();
      v11 = (void *)swift_allocError();
      *v12 = 0;
      swift_retain();
      v10(v8, v11);

      sub_1B40A5F54((uint64_t)v10);
      v13 = v14[0];
    }
    else
    {
      v13 = 0;
    }
    sub_1B40A5F54(v13);
    swift_bridgeObjectRelease();
    swift_release_n();
  }
}

uint64_t sub_1B40B1448(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BEB8);
  v10 = *(_QWORD *)(type metadata accessor for AssertionReconnectProperties() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_1B40BCC3C();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for AssertionReconnectProperties() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1B40B39B0(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

_QWORD *sub_1B40B1650(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BEB0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1B40B38C8(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_1B40B175C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1B40BCDE0();
  sub_1B40BCDF8();
  sub_1B40BCDF8();
  sub_1B40BCE04();
  v4 = sub_1B40BCE10();
  return sub_1B40B1E2C(a1, a2, v4);
}

uint64_t sub_1B40B17E0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  __int128 v7;
  uint64_t v8;
  int64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v24;
  int64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  __int128 v35;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5024C8);
  v34 = a2;
  result = sub_1B40BCC6C();
  v8 = result;
  if (*(_QWORD *)(v5 + 16))
  {
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
        v21 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v22 = v21 | (v9 << 6);
      }
      else
      {
        if (__OFADD__(v9++, 1))
          goto LABEL_40;
        if (v9 >= v14)
        {
LABEL_31:
          if ((v34 & 1) == 0)
          {
            result = swift_release();
            v3 = v2;
            goto LABEL_38;
          }
          v33 = 1 << *(_BYTE *)(v5 + 32);
          if (v33 >= 64)
            bzero((void *)(v5 + 64), ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
          else
            *v10 = -1 << v33;
          v3 = v2;
          *(_QWORD *)(v5 + 16) = 0;
          break;
        }
        v24 = v10[v9];
        if (!v24)
        {
          v25 = v9 + 1;
          if (v9 + 1 >= v14)
            goto LABEL_31;
          v24 = v10[v25];
          if (!v24)
          {
            while (1)
            {
              v9 = v25 + 1;
              if (__OFADD__(v25, 1))
                break;
              if (v9 >= v14)
                goto LABEL_31;
              v24 = v10[v9];
              ++v25;
              if (v24)
                goto LABEL_20;
            }
LABEL_39:
            __break(1u);
LABEL_40:
            __break(1u);
            return result;
          }
          ++v9;
        }
LABEL_20:
        v13 = (v24 - 1) & v24;
        v22 = __clz(__rbit64(v24)) + (v9 << 6);
      }
      v26 = (_QWORD *)(*(_QWORD *)(v5 + 48) + 16 * v22);
      *(_QWORD *)&v7 = *v26;
      v35 = v7;
      v27 = v26[1];
      v28 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v22);
      if ((v34 & 1) == 0)
        swift_retain();
      sub_1B40BCDE0();
      sub_1B40BCDF8();
      sub_1B40BCDF8();
      sub_1B40BCE04();
      result = sub_1B40BCE10();
      v16 = -1 << *(_BYTE *)(v8 + 32);
      v17 = result & ~v16;
      v18 = v17 >> 6;
      if (((-1 << v17) & ~*(_QWORD *)(v15 + 8 * (v17 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v15 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
        v7 = v35;
      }
      else
      {
        v29 = 0;
        v30 = (unint64_t)(63 - v16) >> 6;
        v7 = v35;
        do
        {
          if (++v18 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v31 = v18 == v30;
          if (v18 == v30)
            v18 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v15 + 8 * v18);
        }
        while (v32 == -1);
        v19 = __clz(__rbit64(~v32)) + (v18 << 6);
      }
      *(_QWORD *)(v15 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      v20 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v19);
      *v20 = v7;
      v20[1] = v27;
      *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v19) = v28;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v8;
  return result;
}

unint64_t sub_1B40B1ADC(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  _OWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1B40BCBB8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1B40BCDE0();
        sub_1B40BCDF8();
        sub_1B40BCDF8();
        sub_1B40BCE04();
        result = sub_1B40BCE10();
        v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8)
            goto LABEL_5;
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          v10 = *(_QWORD *)(a2 + 48);
          v11 = (_OWORD *)(v10 + 16 * v3);
          v12 = (_OWORD *)(v10 + 16 * v6);
          if (v3 != v6 || v11 >= v12 + 1)
            *v11 = *v12;
          v13 = *(_QWORD *)(a2 + 56);
          v14 = (_QWORD *)(v13 + 8 * v3);
          v15 = (_QWORD *)(v13 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v14 >= v15 + 1))
          {
            *v14 = *v15;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v17 = *v16;
    v18 = (-1 << v3) - 1;
  }
  else
  {
    v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    v18 = *v16;
    v17 = (-1 << result) - 1;
  }
  *v16 = v18 & v17;
  v19 = *(_QWORD *)(a2 + 16);
  v20 = __OFSUB__(v19, 1);
  v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1B40B1CBC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t result;
  unint64_t v20;
  char v21;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_1B40B175C(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        *(_QWORD *)(v18[7] + 8 * v12) = a1;
        return swift_release();
      }
      return sub_1B40B1DDC(v12, a2, a3, a1, v18);
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1B40B1EB4();
      goto LABEL_7;
    }
    sub_1B40B17E0(v15, a4 & 1);
    v20 = sub_1B40B175C(a2, a3);
    if ((v16 & 1) == (v21 & 1))
    {
      v12 = v20;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
      return sub_1B40B1DDC(v12, a2, a3, a1, v18);
    }
  }
  result = sub_1B40BCDA4();
  __break(1u);
  return result;
}

unint64_t sub_1B40B1DDC(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)(a5[7] + 8 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

unint64_t sub_1B40B1E2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;

  v5 = -1 << *(_BYTE *)(v3 + 32);
  result = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = ~v5;
    do
    {
      v8 = *(_QWORD *)(v3 + 48) + 16 * result;
      v9 = *(_DWORD *)v8;
      v10 = *(_DWORD *)(v8 + 4);
      v11 = *(_QWORD *)(v8 + 8);
      if (v9 == (_DWORD)a1 && v10 == HIDWORD(a1) && v11 == a2)
        break;
      result = (result + 1) & v7;
    }
    while (((*(_QWORD *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

void *sub_1B40B1EB4()
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
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5024C8);
  v2 = *v0;
  v3 = sub_1B40BCC60();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
    result = (void *)swift_release();
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
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    if (!v23)
      break;
LABEL_23:
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
    result = (void *)swift_retain();
  }
  v24 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1B40B2050(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  unint64_t v5;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  BOOL v17;
  char isUniquelyReferenced_nonNull_native;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;

  v5 = a2;
  v7 = HIDWORD(a2);
  v8 = *v3;
  sub_1B40BCDE0();
  sub_1B40BCDF8();
  sub_1B40BCDF8();
  sub_1B40BCE04();
  v9 = sub_1B40BCE10();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  v11 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0)
  {
    v12 = ~v10;
    while (1)
    {
      v13 = *(_QWORD *)(v8 + 48) + 16 * v11;
      v14 = *(_DWORD *)v13;
      v15 = *(_DWORD *)(v13 + 4);
      v16 = *(_QWORD *)(v13 + 8);
      v17 = v14 == (_DWORD)v5 && v15 == (_DWORD)v7;
      if (v17 && v16 == a3)
        break;
      v11 = (v11 + 1) & v12;
      if (((*(_QWORD *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
        goto LABEL_11;
    }
    result = 0;
    v21 = *(_QWORD *)(*v3 + 48) + 16 * v11;
    LODWORD(v5) = *(_DWORD *)v21;
    LODWORD(v7) = *(_DWORD *)(v21 + 4);
    a3 = *(_QWORD *)(v21 + 8);
  }
  else
  {
LABEL_11:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v22 = *v3;
    *v3 = 0x8000000000000000;
    sub_1B40B3694(v5, a3, v11, isUniquelyReferenced_nonNull_native);
    *v3 = v22;
    swift_bridgeObjectRelease();
    result = 1;
  }
  *(_DWORD *)a1 = v5;
  *(_DWORD *)(a1 + 4) = v7;
  *(_QWORD *)(a1 + 8) = a3;
  return result;
}

uint64_t sub_1B40B21A8(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  _BYTE v14[24];

  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return result;
  v2 = result;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v11 >= v7)
      return swift_release();
    v12 = *(_QWORD *)(v3 + 8 * v11);
    ++v8;
    if (!v12)
    {
      v8 = v11 + 1;
      if (v11 + 1 >= v7)
        return swift_release();
      v12 = *(_QWORD *)(v3 + 8 * v8);
      if (!v12)
      {
        v8 = v11 + 2;
        if (v11 + 2 >= v7)
          return swift_release();
        v12 = *(_QWORD *)(v3 + 8 * v8);
        if (!v12)
        {
          v8 = v11 + 3;
          if (v11 + 3 >= v7)
            return swift_release();
          v12 = *(_QWORD *)(v3 + 8 * v8);
          if (!v12)
            break;
        }
      }
    }
LABEL_23:
    v6 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v8 << 6);
LABEL_6:
    result = sub_1B40B2708(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v10), *(_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v10 + 8), (uint64_t)v14);
  }
  v13 = v11 + 4;
  if (v13 >= v7)
    return swift_release();
  v12 = *(_QWORD *)(v3 + 8 * v13);
  if (v12)
  {
    v8 = v13;
    goto LABEL_23;
  }
  while (1)
  {
    v8 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v8 >= v7)
      return swift_release();
    v12 = *(_QWORD *)(v3 + 8 * v8);
    ++v13;
    if (v12)
      goto LABEL_23;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1B40B231C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  BOOL v28;
  unint64_t v30;
  size_t v31;
  uint64_t isStackAllocationSafe;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v39;
  int64_t v40;
  _QWORD v41[6];

  v2 = a2;
  v41[5] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a2 + 16))
  {
    v4 = 0;
    v6 = a1 + 56;
    v5 = *(_QWORD *)(a1 + 56);
    v7 = -1 << *(_BYTE *)(a1 + 32);
    v39 = ~v7;
    if (-v7 < 64)
      v8 = ~(-1 << -(char)v7);
    else
      v8 = -1;
    v9 = v8 & v5;
    v40 = (unint64_t)(63 - v7) >> 6;
    v10 = a2 + 56;
    do
    {
LABEL_6:
      if (v9)
      {
        v11 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v12 = v11 | (v4 << 6);
      }
      else
      {
        v13 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          goto LABEL_42;
        }
        if (v13 >= v40)
          goto LABEL_39;
        v14 = *(_QWORD *)(v6 + 8 * v13);
        v15 = v4 + 1;
        if (!v14)
        {
          v15 = v4 + 2;
          if (v4 + 2 >= v40)
            goto LABEL_39;
          v14 = *(_QWORD *)(v6 + 8 * v15);
          if (!v14)
          {
            v15 = v4 + 3;
            if (v4 + 3 >= v40)
              goto LABEL_39;
            v14 = *(_QWORD *)(v6 + 8 * v15);
            if (!v14)
            {
              v15 = v4 + 4;
              if (v4 + 4 >= v40)
                goto LABEL_39;
              v14 = *(_QWORD *)(v6 + 8 * v15);
              if (!v14)
              {
                v16 = v4 + 5;
                if (v4 + 5 >= v40)
                {
LABEL_39:
                  swift_bridgeObjectRetain();
                  sub_1B40B3D0C();
                  return v2;
                }
                v14 = *(_QWORD *)(v6 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    v15 = v16 + 1;
                    if (__OFADD__(v16, 1))
                      break;
                    if (v15 >= v40)
                      goto LABEL_39;
                    v14 = *(_QWORD *)(v6 + 8 * v15);
                    ++v16;
                    if (v14)
                      goto LABEL_23;
                  }
LABEL_42:
                  __break(1u);
                }
                v15 = v4 + 5;
              }
            }
          }
        }
LABEL_23:
        v9 = (v14 - 1) & v14;
        v12 = __clz(__rbit64(v14)) + (v15 << 6);
        v4 = v15;
      }
      v17 = *(_QWORD *)(a1 + 48) + 16 * v12;
      v18 = *(_DWORD *)v17;
      v19 = *(_DWORD *)(v17 + 4);
      v20 = *(_QWORD *)(v17 + 8);
      sub_1B40BCDE0();
      sub_1B40BCDF8();
      sub_1B40BCDF8();
      sub_1B40BCE04();
      v21 = sub_1B40BCE10();
      v22 = -1 << *(_BYTE *)(v2 + 32);
      v23 = v21 & ~v22;
    }
    while (((*(_QWORD *)(v10 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0);
    while (1)
    {
      v24 = *(_QWORD *)(v2 + 48) + 16 * v23;
      v25 = *(_DWORD *)v24;
      v26 = *(_DWORD *)(v24 + 4);
      v27 = *(_QWORD *)(v24 + 8);
      v28 = v25 == v18 && v26 == v19;
      if (v28 && v27 == v20)
        break;
      v23 = (v23 + 1) & ~v22;
      if (((*(_QWORD *)(v10 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
        goto LABEL_6;
    }
    v41[0] = a1;
    v41[1] = v6;
    v41[2] = v39;
    v41[3] = v4;
    v41[4] = v9;
    v30 = (unint64_t)(63 - v22) >> 6;
    v31 = 8 * v30;
    isStackAllocationSafe = swift_bridgeObjectRetain();
    if (v30 <= 0x80 || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
    {
      MEMORY[0x1E0C80A78](isStackAllocationSafe);
      v34 = (char *)&v39 - v33;
      memcpy((char *)&v39 - v33, (const void *)(v2 + 56), v31);
      v35 = sub_1B40B2B4C((uint64_t)v34, v30, v2, v23, v41);
      swift_release();
      sub_1B40B3D0C();
      return v35;
    }
    else
    {
      v36 = (void *)swift_slowAlloc();
      memcpy(v36, (const void *)(v2 + 56), v31);
      v37 = sub_1B40B2B4C((uint64_t)v36, v30, v2, v23, v41);
      swift_release();
      sub_1B40B3D0C();
      MEMORY[0x1B5E3647C](v36, -1, -1);
      return v37;
    }
  }
  else
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
}

uint64_t sub_1B40B2708@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  int v5;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  BOOL v17;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;

  v5 = a1;
  v7 = HIDWORD(a1);
  v8 = *v3;
  sub_1B40BCDE0();
  sub_1B40BCDF8();
  sub_1B40BCDF8();
  sub_1B40BCE04();
  result = sub_1B40BCE10();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  v11 = result & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0)
  {
    v12 = ~v10;
    while (1)
    {
      v13 = *(_QWORD *)(v8 + 48) + 16 * v11;
      v14 = *(_DWORD *)v13;
      v15 = *(_DWORD *)(v13 + 4);
      v16 = *(_QWORD *)(v13 + 8);
      v17 = v14 == v5 && v15 == (_DWORD)v7;
      if (v17 && v16 == a2)
        break;
      v11 = (v11 + 1) & v12;
      if (((*(_QWORD *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
        goto LABEL_11;
    }
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v20 = *v3;
    v23 = *v3;
    *v3 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_1B40B3070();
      v20 = v23;
    }
    v21 = (_QWORD *)(*(_QWORD *)(v20 + 48) + 16 * v11);
    v22 = v21[1];
    *(_QWORD *)a3 = *v21;
    *(_QWORD *)(a3 + 8) = v22;
    sub_1B40B34C4(v11);
    *v3 = v23;
    result = swift_bridgeObjectRelease();
    *(_BYTE *)(a3 + 16) = 0;
  }
  else
  {
LABEL_11:
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_BYTE *)(a3 + 16) = 1;
  }
  return result;
}

uint64_t sub_1B40B286C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  __int128 v4;
  uint64_t v5;
  int64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BEC0);
  result = sub_1B40BCBD0();
  v5 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v6 = 0;
    v7 = (_QWORD *)(v2 + 56);
    v8 = 1 << *(_BYTE *)(v2 + 32);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v2 + 56);
    v11 = (unint64_t)(v8 + 63) >> 6;
    v12 = result + 56;
    while (1)
    {
      if (v10)
      {
        v15 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v16 = v15 | (v6 << 6);
      }
      else
      {
        v17 = v6 + 1;
        if (__OFADD__(v6, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v17 >= v11)
          goto LABEL_33;
        v18 = v7[v17];
        ++v6;
        if (!v18)
        {
          v6 = v17 + 1;
          if (v17 + 1 >= v11)
            goto LABEL_33;
          v18 = v7[v6];
          if (!v18)
          {
            v6 = v17 + 2;
            if (v17 + 2 >= v11)
              goto LABEL_33;
            v18 = v7[v6];
            if (!v18)
            {
              v19 = v17 + 3;
              if (v19 >= v11)
              {
LABEL_33:
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v7 = -1 << v29;
                v1 = v0;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v18 = v7[v19];
              if (!v18)
              {
                while (1)
                {
                  v6 = v19 + 1;
                  if (__OFADD__(v19, 1))
                    goto LABEL_39;
                  if (v6 >= v11)
                    goto LABEL_33;
                  v18 = v7[v6];
                  ++v19;
                  if (v18)
                    goto LABEL_23;
                }
              }
              v6 = v19;
            }
          }
        }
LABEL_23:
        v10 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v6 << 6);
      }
      v20 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v16);
      *(_QWORD *)&v4 = *v20;
      v30 = v4;
      v21 = v20[1];
      sub_1B40BCDE0();
      sub_1B40BCDF8();
      sub_1B40BCDF8();
      sub_1B40BCE04();
      result = sub_1B40BCE10();
      v22 = -1 << *(_BYTE *)(v5 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        v13 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      v14 = (_QWORD *)(*(_QWORD *)(v5 + 48) + 16 * v13);
      *((_QWORD *)&v4 + 1) = *((_QWORD *)&v30 + 1);
      *v14 = v30;
      v14[1] = v21;
      ++*(_QWORD *)(v5 + 16);
    }
  }
  result = swift_release();
  *v1 = v5;
  return result;
}

uint64_t sub_1B40B2B4C(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  unint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  int64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v37;

  v7 = (unint64_t *)result;
  v8 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v9 = v8 - 1;
  v10 = a3 + 56;
  while (2)
  {
    v37 = v9;
    while (1)
    {
LABEL_4:
      v15 = a5[3];
      v14 = a5[4];
      if (v14)
      {
        v16 = (v14 - 1) & v14;
        v17 = __clz(__rbit64(v14)) | (v15 << 6);
      }
      else
      {
        v18 = v15 + 1;
        if (__OFADD__(v15, 1))
        {
          __break(1u);
          goto LABEL_41;
        }
        v19 = (unint64_t)(a5[2] + 64) >> 6;
        if (v18 >= v19)
        {
          v18 = a5[3];
LABEL_37:
          a5[3] = v18;
          a5[4] = 0;
          swift_retain();
          return sub_1B40B2DD0(v7, a2, v37, a3);
        }
        v20 = a5[1];
        v21 = *(_QWORD *)(v20 + 8 * v18);
        if (!v21)
        {
          if (v15 + 2 >= v19)
            goto LABEL_37;
          v21 = *(_QWORD *)(v20 + 8 * (v15 + 2));
          if (v21)
          {
            v18 = v15 + 2;
          }
          else
          {
            if (v15 + 3 >= v19)
            {
              v18 = v15 + 2;
              goto LABEL_37;
            }
            v21 = *(_QWORD *)(v20 + 8 * (v15 + 3));
            if (v21)
            {
              v18 = v15 + 3;
            }
            else
            {
              v18 = v15 + 4;
              if (v15 + 4 >= v19)
              {
                v18 = v15 + 3;
                goto LABEL_37;
              }
              v21 = *(_QWORD *)(v20 + 8 * v18);
              if (!v21)
              {
                v18 = v19 - 1;
                v22 = v15 + 5;
                while (v19 != v22)
                {
                  v21 = *(_QWORD *)(v20 + 8 * v22++);
                  if (v21)
                  {
                    v18 = v22 - 1;
                    goto LABEL_21;
                  }
                }
                goto LABEL_37;
              }
            }
          }
        }
LABEL_21:
        v16 = (v21 - 1) & v21;
        v17 = __clz(__rbit64(v21)) + (v18 << 6);
        v15 = v18;
      }
      v23 = *(_QWORD *)(*a5 + 48) + 16 * v17;
      v24 = *(_DWORD *)v23;
      v25 = *(_DWORD *)(v23 + 4);
      v26 = *(_QWORD *)(v23 + 8);
      a5[3] = v15;
      a5[4] = v16;
      sub_1B40BCDE0();
      sub_1B40BCDF8();
      sub_1B40BCDF8();
      sub_1B40BCE04();
      result = sub_1B40BCE10();
      v27 = -1 << *(_BYTE *)(a3 + 32);
      v28 = result & ~v27;
      if (((*(_QWORD *)(v10 + ((v28 >> 3) & 0xFFFFFFFFFFFFF8)) >> v28) & 1) != 0)
      {
        v29 = ~v27;
        while (1)
        {
          v30 = *(_QWORD *)(a3 + 48) + 16 * v28;
          v31 = *(_DWORD *)v30;
          v32 = *(_DWORD *)(v30 + 4);
          v33 = *(_QWORD *)(v30 + 8);
          v34 = v31 == v24 && v32 == v25;
          if (v34 && v33 == v26)
            break;
          v28 = (v28 + 1) & v29;
          if (((*(_QWORD *)(v10 + ((v28 >> 3) & 0xFFFFFFFFFFFFF8)) >> v28) & 1) == 0)
            goto LABEL_4;
        }
        v11 = (v28 >> 3) & 0x1FFFFFFFFFFFFFF8;
        v12 = 1 << v28;
        v13 = *(unint64_t *)((char *)v7 + v11);
        *(unint64_t *)((char *)v7 + v11) = v13 & ~v12;
        if ((v13 & v12) != 0)
          break;
      }
    }
    v9 = v37 - 1;
    if (__OFSUB__(v37, 1))
    {
LABEL_41:
      __break(1u);
      return result;
    }
    if (v37 != 1)
      continue;
    return MEMORY[0x1E0DEE9E8];
  }
}

uint64_t sub_1B40B2DD0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t *v31;
  __int128 v32;

  v4 = a4;
  if (!a3)
  {
    v10 = MEMORY[0x1E0DEE9E8];
LABEL_36:
    swift_release();
    return v10;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BEC0);
  result = sub_1B40BCBDC();
  v10 = result;
  v31 = a1;
  if (a2 < 1)
    v11 = 0;
  else
    v11 = *a1;
  v12 = 0;
  v13 = result + 56;
  while (1)
  {
    if (v11)
    {
      v14 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
      goto LABEL_39;
    if (v16 >= a2)
      goto LABEL_36;
    v17 = v31[v16];
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= a2)
        goto LABEL_36;
      v17 = v31[v12];
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= a2)
          goto LABEL_36;
        v17 = v31[v12];
        if (!v17)
          break;
      }
    }
LABEL_23:
    v11 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v15);
    *(_QWORD *)&v9 = *v19;
    v32 = v9;
    v20 = v19[1];
    sub_1B40BCDE0();
    sub_1B40BCDF8();
    sub_1B40BCDF8();
    sub_1B40BCE04();
    result = sub_1B40BCE10();
    v21 = -1 << *(_BYTE *)(v10 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v13 + 8 * (v22 >> 6))) != 0)
    {
      v24 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v13 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v27 = v23 == v26;
        if (v23 == v26)
          v23 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v13 + 8 * v23);
      }
      while (v28 == -1);
      v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(_QWORD *)(v13 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    v29 = (_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v24);
    *((_QWORD *)&v9 + 1) = *((_QWORD *)&v32 + 1);
    *v29 = v32;
    v29[1] = v20;
    ++*(_QWORD *)(v10 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v18 = v16 + 3;
  if (v18 >= a2)
    goto LABEL_36;
  v17 = v31[v18];
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= a2)
      goto LABEL_36;
    v17 = v31[v12];
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

void *sub_1B40B3070()
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
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BEC0);
  v2 = *v0;
  v3 = sub_1B40BCBC4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1B40B3214()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  __int128 v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  __int128 v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BEC0);
  result = sub_1B40BCBD0();
  v5 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v5;
    return result;
  }
  v6 = 0;
  v7 = v2 + 56;
  v8 = 1 << *(_BYTE *)(v2 + 32);
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v2 + 56);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v16 = v15 | (v6 << 6);
      goto LABEL_24;
    }
    v17 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v17 >= v11)
      goto LABEL_33;
    v18 = *(_QWORD *)(v7 + 8 * v17);
    ++v6;
    if (!v18)
    {
      v6 = v17 + 1;
      if (v17 + 1 >= v11)
        goto LABEL_33;
      v18 = *(_QWORD *)(v7 + 8 * v6);
      if (!v18)
      {
        v6 = v17 + 2;
        if (v17 + 2 >= v11)
          goto LABEL_33;
        v18 = *(_QWORD *)(v7 + 8 * v6);
        if (!v18)
          break;
      }
    }
LABEL_23:
    v10 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v6 << 6);
LABEL_24:
    v20 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v16);
    *(_QWORD *)&v4 = *v20;
    v29 = v4;
    v21 = v20[1];
    sub_1B40BCDE0();
    sub_1B40BCDF8();
    sub_1B40BCDF8();
    sub_1B40BCE04();
    result = sub_1B40BCE10();
    v22 = -1 << *(_BYTE *)(v5 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      v13 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    v14 = (_QWORD *)(*(_QWORD *)(v5 + 48) + 16 * v13);
    *((_QWORD *)&v4 + 1) = *((_QWORD *)&v29 + 1);
    *v14 = v29;
    v14[1] = v21;
    ++*(_QWORD *)(v5 + 16);
  }
  v19 = v17 + 3;
  if (v19 >= v11)
  {
LABEL_33:
    result = swift_release();
    v1 = v0;
    goto LABEL_35;
  }
  v18 = *(_QWORD *)(v7 + 8 * v19);
  if (v18)
  {
    v6 = v19;
    goto LABEL_23;
  }
  while (1)
  {
    v6 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v6 >= v11)
      goto LABEL_33;
    v18 = *(_QWORD *)(v7 + 8 * v6);
    ++v19;
    if (v18)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_1B40B34C4(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_1B40BCBB8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_1B40BCDE0();
        sub_1B40BCDF8();
        sub_1B40BCDF8();
        sub_1B40BCE04();
        v10 = sub_1B40BCE10() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v10 < v9)
            goto LABEL_5;
        }
        else if (v10 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(v3 + 48);
          v12 = (_OWORD *)(v11 + 16 * v2);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v2 != v6 || (v2 = v6, v12 >= v13 + 1))
          {
            *v12 = *v13;
            v2 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v14 = *(_QWORD *)(v3 + 16);
  v15 = __OFSUB__(v14, 1);
  v16 = v14 - 1;
  if (v15)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v16;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

unint64_t sub_1B40B3694(unint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v7 = result;
  v8 = HIDWORD(result);
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_18;
  if ((a4 & 1) != 0)
  {
    sub_1B40B286C();
  }
  else
  {
    if (v10 > v9)
    {
      result = (unint64_t)sub_1B40B3070();
      goto LABEL_18;
    }
    sub_1B40B3214();
  }
  v11 = *v4;
  sub_1B40BCDE0();
  sub_1B40BCDF8();
  sub_1B40BCDF8();
  sub_1B40BCE04();
  result = sub_1B40BCE10();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v13 = ~v12;
    do
    {
      v14 = *(_QWORD *)(v11 + 48) + 16 * a3;
      v15 = *(_DWORD *)v14;
      v16 = *(_DWORD *)(v14 + 4);
      v17 = *(_QWORD *)(v14 + 8);
      v18 = v15 == v7 && v16 == (_DWORD)v8;
      if (v18 && v17 == a2)
        goto LABEL_21;
      a3 = (a3 + 1) & v13;
    }
    while (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0);
  }
LABEL_18:
  v20 = *v4;
  *(_QWORD *)(*v4 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = *(_QWORD *)(v20 + 48) + 16 * a3;
  *(_DWORD *)v21 = v7;
  *(_DWORD *)(v21 + 4) = v8;
  *(_QWORD *)(v21 + 8) = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_21:
  result = sub_1B40BCD98();
  __break(1u);
  return result;
}

uint64_t sub_1B40B3814(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  _BYTE v5[16];
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 16);
  sub_1B40B3BDC();
  result = sub_1B40BCAEC();
  v6 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      sub_1B40B2050((uint64_t)v5, *(v4 - 1), *v4);
      v4 += 2;
      --v2;
    }
    while (v2);
    return v6;
  }
  return result;
}

uint64_t sub_1B40B3888(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502438);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_1B40B38C8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 16 * a1 + 32);
    v6 = 16 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_1B40BCC84();
  __break(1u);
  return result;
}

uint64_t sub_1B40B39B0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(type metadata accessor for AssertionReconnectProperties() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_1B40BCC84();
  __break(1u);
  return result;
}

unint64_t sub_1B40B3AC8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t *i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BEC8);
    v3 = (_QWORD *)sub_1B40BCC78();
    for (i = (uint64_t *)(a1 + 56); ; i += 4)
    {
      v5 = *((unsigned int *)i - 6);
      v6 = *((unsigned int *)i - 5);
      v7 = *(i - 2);
      v8 = *(i - 1);
      v9 = *i;
      result = sub_1B40B175C(v5 | (v6 << 32), v7);
      if ((v11 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      v12 = v3[6] + 16 * result;
      *(_DWORD *)v12 = v5;
      *(_DWORD *)(v12 + 4) = v6;
      *(_QWORD *)(v12 + 8) = v7;
      v13 = (_QWORD *)(v3[7] + 16 * result);
      *v13 = v8;
      v13[1] = v9;
      v14 = v3[2];
      v15 = __OFADD__(v14, 1);
      v16 = v14 + 1;
      if (v15)
        goto LABEL_10;
      v3[2] = v16;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9E0];
  }
  return result;
}

uint64_t sub_1B40B3BCC(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

unint64_t sub_1B40B3BDC()
{
  unint64_t result;

  result = qword_1ED502408;
  if (!qword_1ED502408)
  {
    result = MEMORY[0x1B5E363EC](&protocol conformance descriptor for AssertionIdentifier, &type metadata for AssertionIdentifier);
    atomic_store(result, (unint64_t *)&qword_1ED502408);
  }
  return result;
}

uint64_t sub_1B40B3C20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AssertionReconnectProperties();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B40B3C64(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for AttributeAssertionManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for AttributeAssertionManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AttributeAssertionManager.acquire(assertion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of AttributeAssertionManager.invalidate(identifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t sub_1B40B3D0C()
{
  return swift_release();
}

uint64_t sub_1B40B3D14()
{
  return sub_1B40A8E74();
}

uint64_t AssertionOptions.invalidateOnSessionRequest.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16SessionAssertion16AssertionOptions_invalidateOnSessionRequest);
}

id AssertionOptions.__allocating_init(invalidateOnSessionRequest:)(char a1)
{
  objc_class *v1;
  _BYTE *v3;
  objc_super v5;

  v3 = objc_allocWithZone(v1);
  v3[OBJC_IVAR____TtC16SessionAssertion16AssertionOptions_invalidateOnSessionRequest] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id AssertionOptions.init(invalidateOnSessionRequest:)(char a1)
{
  _BYTE *v1;
  objc_super v3;

  v1[OBJC_IVAR____TtC16SessionAssertion16AssertionOptions_invalidateOnSessionRequest] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for AssertionOptions();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for AssertionOptions()
{
  return objc_opt_self();
}

id AssertionOptions.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AssertionOptions.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AssertionOptions.__deallocating_deinit()
{
  return sub_1B40B523C(type metadata accessor for AssertionOptions);
}

uint64_t sub_1B40B3F00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1B40BCBE8();
  sub_1B40BCA14();
  swift_beginAccess();
  sub_1B40BCC30();
  sub_1B40BCA14();
  v1 = OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_attributeAssertion;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BCB0);
  sub_1B40BC9F0();
  sub_1B40BCA14();
  swift_bridgeObjectRelease();
  sub_1B40BCA14();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B40BCA14();
  swift_bridgeObjectRelease();
  sub_1B40BCA14();
  v2 = *(_QWORD *)(v0 + v1);
  if (v2)
  {
    v3 = *(os_unfair_lock_s **)(*(_QWORD *)(v2 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
    swift_retain();
    os_unfair_lock_lock(v3);
    os_unfair_lock_unlock(v3);
    swift_release();
  }
  sub_1B40BC9F0();
  sub_1B40BCA14();
  swift_bridgeObjectRelease();
  sub_1B40BCA14();
  v4 = sub_1B40B46CC();
  MEMORY[0x1B5E35D08](v4, MEMORY[0x1E0DEA968], v5, v6, v7);
  sub_1B40BCA14();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1B40B41C0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a1 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_target;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 8);
  v5 = *(_BYTE *)(v3 + 16);
  *(_QWORD *)a2 = *(_QWORD *)v3;
  *(_QWORD *)(a2 + 8) = v4;
  *(_BYTE *)(a2 + 16) = v5;
  return sub_1B40A41C0();
}

uint64_t sub_1B40B421C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  v5 = *a2 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_target;
  swift_beginAccess();
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = v3;
  *(_BYTE *)(v5 + 16) = v4;
  sub_1B40A41C0();
  return sub_1B40A4278();
}

uint64_t sub_1B40B42B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = v1 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_target;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 8);
  v5 = *(_BYTE *)(v3 + 16);
  *(_QWORD *)a1 = *(_QWORD *)v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return sub_1B40A41C0();
}

uint64_t sub_1B40B4308(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  v5 = v1 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_target;
  swift_beginAccess();
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = v3;
  *(_BYTE *)(v5 + 16) = v4;
  return sub_1B40A4278();
}

uint64_t (*sub_1B40B4374())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1B40B4420()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_explanation);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1B40B44DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_explanation);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B40B4538(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_explanation);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B40B45A0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1B40B45E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_attributeAssertion);
  if (v3)
  {
    v4 = *(os_unfair_lock_s **)(*(_QWORD *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
    swift_retain();
    os_unfair_lock_lock(v4);
    v5 = *(_QWORD *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
    v6 = *(_BYTE *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
    os_unfair_lock_unlock(v4);
    result = swift_release();
  }
  else
  {
    v5 = 0;
    v6 = 1;
  }
  *(_QWORD *)a1 = v5;
  *(_BYTE *)(a1 + 8) = v6;
  return result;
}

uint64_t sub_1B40B46CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  uint64_t v4;
  int64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_attributeAssertion);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v3 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
    swift_retain();
    os_unfair_lock_lock(v3);
    v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_invalidationState);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v3);
    if (v4)
    {
      v5 = *(_QWORD *)(v4 + 16);
      if (v5)
      {
        swift_bridgeObjectRetain();
        sub_1B40B52D4(0, v5, 0);
        v6 = (uint64_t *)(v4 + 40);
        do
        {
          v8 = *(v6 - 1);
          v7 = *v6;
          v9 = *(_QWORD *)(v2 + 16);
          v10 = *(_QWORD *)(v2 + 24);
          swift_bridgeObjectRetain();
          if (v9 >= v10 >> 1)
            sub_1B40B52D4(v10 > 1, v9 + 1, 1);
          v6 += 2;
          *(_QWORD *)(v2 + 16) = v9 + 1;
          v11 = v2 + 16 * v9;
          *(_QWORD *)(v11 + 32) = v8;
          *(_QWORD *)(v11 + 40) = v7;
          --v5;
        }
        while (v5);
        swift_bridgeObjectRelease_n();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    swift_release();
  }
  return v2;
}

char *SessionRequestAssertion.__allocating_init(explanation:target:invalidateOnSessionRequest:invalidationHandler:)(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  id v13;

  v13 = objc_allocWithZone(v6);
  return SessionRequestAssertion.init(explanation:target:invalidateOnSessionRequest:invalidationHandler:)(a1, a2, a3, a4, a5, a6);
}

char *SessionRequestAssertion.init(explanation:target:invalidateOnSessionRequest:invalidationHandler:)(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, uint64_t a6)
{
  char *v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _BYTE *v16;
  char *v17;
  char *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t *v24;
  objc_class *v25;
  id v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[2];
  char v36;
  objc_super v37;

  v33 = a5;
  v34 = a6;
  v32 = a3;
  v11 = type metadata accessor for AssertionAttribute();
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v32 - v15;
  *(_QWORD *)&v6[OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_attributeAssertion] = 0;
  v17 = &v6[OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_invalidationHandler];
  *(_QWORD *)v17 = 0;
  *((_QWORD *)v17 + 1) = 0;
  v18 = v6;
  v19 = objc_msgSend(a3, sel_bundleIdentifier);
  v20 = sub_1B40BC9E4();
  v22 = v21;

  v23 = &v18[OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_target];
  *(_QWORD *)v23 = v20;
  *((_QWORD *)v23 + 1) = v22;
  v23[16] = 0;
  v24 = (uint64_t *)&v18[OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_explanation];
  *v24 = a1;
  v24[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  v25 = (objc_class *)type metadata accessor for SessionRequestAssertion();
  v37.receiver = v18;
  v37.super_class = v25;
  v26 = objc_msgSendSuper2(&v37, sel_init);
  *v16 = a4;
  swift_storeEnumTagMultiPayload();
  v35[0] = v20;
  v35[1] = v22;
  v36 = 0;
  sub_1B40A5C78((uint64_t)v16, (uint64_t)v14);
  v27 = (_QWORD *)swift_allocObject();
  v28 = v34;
  v27[2] = v33;
  v27[3] = v28;
  v27[4] = v26;
  type metadata accessor for AttributeAssertion();
  swift_allocObject();
  v29 = (char *)v26;
  v30 = sub_1B40B685C(a1, a2, v35, (uint64_t)v14, 0x403E000000000000, 0, (uint64_t)sub_1B40A5CF0, (uint64_t)v27);

  swift_release();
  sub_1B40A455C((uint64_t)v16);
  *(_QWORD *)&v29[OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_attributeAssertion] = v30;
  swift_release();
  return v29;
}

id SessionRequestAssertion.__allocating_init(explanation:target:options:invalidationHandler:)(uint64_t a1, uint64_t a2, void *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  id v13;

  v13 = objc_allocWithZone(v6);
  return SessionRequestAssertion.init(explanation:target:options:invalidationHandler:)(a1, a2, a3, a4, a5, a6);
}

id SessionRequestAssertion.init(explanation:target:options:invalidationHandler:)(uint64_t a1, uint64_t a2, void *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  void *v7;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[6];

  v7 = v6;
  v12 = (void *)sub_1B40BC9D8();
  swift_bridgeObjectRelease();
  v13 = a4[OBJC_IVAR____TtC16SessionAssertion16AssertionOptions_invalidateOnSessionRequest];
  if (a5)
  {
    v17[4] = a5;
    v17[5] = a6;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 1107296256;
    v17[2] = sub_1B40B4CE0;
    v17[3] = &block_descriptor_0;
    v14 = _Block_copy(v17);
    swift_retain();
    swift_release();
  }
  else
  {
    v14 = 0;
  }
  v15 = objc_msgSend(v7, sel_initWithExplanation_target_invalidateOnSessionRequest_invalidationHandler_, v12, a3, v13, v14);
  sub_1B40A5F54(a5);

  _Block_release(v14);
  return v15;
}

void sub_1B40B4CE0(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(id, id);
  id v6;
  id v7;

  v5 = *(void (**)(id, id))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(v7, v6);
  swift_release();

}

uint64_t sub_1B40B4E00()
{
  uint64_t v0;
  uint64_t result;

  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_attributeAssertion))
  {
    swift_retain();
    sub_1B40B6554();
    return swift_release();
  }
  return result;
}

uint64_t sub_1B40B4EC4()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  unint64_t v3;
  char v4;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_attributeAssertion);
  if (!v1)
    return 0;
  v2 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
  v4 = *(_BYTE *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
  os_unfair_lock_unlock(v2);
  swift_release();
  if ((v4 & 1) != 0)
    return 0;
  if (v3 < 8)
    return qword_1B40BEE50[v3];
  result = sub_1B40BCD8C();
  __break(1u);
  return result;
}

uint64_t sub_1B40B4FBC()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  int v4;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_attributeAssertion);
  if (!v1)
    return 0;
  v2 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
  v4 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
  os_unfair_lock_unlock(v2);
  swift_release();
  if (v4 == 1)
    return v3 != 0;
  else
    return 2;
}

id sub_1B40B5120()
{
  id v0;
  void *v1;
  id v2;

  swift_beginAccess();
  v0 = objc_allocWithZone((Class)SNAAssertionTarget);
  sub_1B40A41C0();
  v1 = (void *)sub_1B40BC9D8();
  sub_1B40A4278();
  v2 = objc_msgSend(v0, sel_initWithBundleIdentifier_, v1);

  return v2;
}

void SessionRequestAssertion.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SessionRequestAssertion.__deallocating_deinit()
{
  return sub_1B40B523C(type metadata accessor for SessionRequestAssertion);
}

id sub_1B40B523C(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_1B40B52D4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1B40B5344(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t type metadata accessor for SessionRequestAssertion()
{
  return objc_opt_self();
}

uint64_t sub_1B40B5310()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();

  return swift_deallocObject();
}

uint64_t sub_1B40B5344(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BEF8);
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
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1B40BCC84();
  __break(1u);
  return result;
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_1B40B54CC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_explanation);
  swift_beginAccess();
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t method lookup function for AssertionOptions()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AssertionOptions.__allocating_init(invalidateOnSessionRequest:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t method lookup function for SessionRequestAssertion()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SessionRequestAssertion.target.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of SessionRequestAssertion.target.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of SessionRequestAssertion.target.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of SessionRequestAssertion.explanation.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of SessionRequestAssertion.explanation.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of SessionRequestAssertion.explanation.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of SessionRequestAssertion.state.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of SessionRequestAssertion.sessionIdentifiers.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of SessionRequestAssertion.__allocating_init(explanation:target:invalidateOnSessionRequest:invalidationHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of SessionRequestAssertion.invalidate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of SessionRequestAssertion.snaInvalidationReason.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of SessionRequestAssertion.snaState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of SessionRequestAssertion.snaTarget.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t sub_1B40B569C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t AttributeAssertion.__allocating_init(explanation:target:attribute:duration:invalidationHandler:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  char v15;
  uint64_t v16;

  v15 = a6 & 1;
  swift_allocObject();
  v16 = sub_1B40B685C(a1, a2, a3, a4, a5, v15, a7, a8);
  sub_1B40A5F54(a7);
  return v16;
}

uint64_t Target.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1B40A41C0();
  return v1;
}

uint64_t sub_1B40B57AC()
{
  sub_1B40B6A64();
  return sub_1B40BCE34();
}

uint64_t sub_1B40B57D4()
{
  sub_1B40B6A64();
  return sub_1B40BCE40();
}

uint64_t sub_1B40B57FC()
{
  sub_1B40B6AA8();
  return sub_1B40BCE34();
}

uint64_t sub_1B40B5824()
{
  sub_1B40B6AA8();
  return sub_1B40BCE40();
}

uint64_t sub_1B40B584C()
{
  _BYTE *v0;

  if (*v0)
    return 0x7974697669746361;
  else
    return 7368801;
}

uint64_t sub_1B40B5880@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B40B72B8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1B40B58A4()
{
  sub_1B40B6A20();
  return sub_1B40BCE34();
}

uint64_t sub_1B40B58CC()
{
  sub_1B40B6A20();
  return sub_1B40BCE40();
}

uint64_t Target.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502878);
  v19 = *(_QWORD *)(v3 - 8);
  v20 = v3;
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502870);
  v17 = *(_QWORD *)(v6 - 8);
  v18 = v6;
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502868);
  v23 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  v21 = v1[1];
  v22 = v12;
  v13 = *((_BYTE *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B40B6A20();
  sub_1B40BCE28();
  if ((v13 & 1) != 0)
  {
    v25 = 1;
    sub_1B40B6A64();
    sub_1B40BCD14();
    v14 = v20;
    sub_1B40BCD38();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v14);
  }
  else
  {
    v24 = 0;
    sub_1B40B6AA8();
    sub_1B40BCD14();
    v15 = v18;
    sub_1B40BCD38();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v11, v9);
}

uint64_t Target.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  int v38;
  char v39;
  char v40;

  v32 = a2;
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502598);
  v33 = *(_QWORD *)(v35 - 8);
  MEMORY[0x1E0C80A78](v35);
  v34 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502590);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502588);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v36 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_1B40B6A20();
  v13 = v37;
  sub_1B40BCE1C();
  if (v13)
    goto LABEL_6;
  v31 = v5;
  v14 = v4;
  v16 = v34;
  v15 = v35;
  v37 = v9;
  v17 = sub_1B40BCD08();
  if (*(_QWORD *)(v17 + 16) != 1)
  {
    v18 = sub_1B40BCC18();
    swift_allocError();
    v19 = v11;
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BDB8);
    *v21 = &type metadata for Target;
    sub_1B40BCCA8();
    sub_1B40BCC0C();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v21, *MEMORY[0x1E0DEC450], v18);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v19, v8);
LABEL_6:
    v22 = (uint64_t)v36;
    return __swift_destroy_boxed_opaque_existential_1(v22);
  }
  v38 = *(unsigned __int8 *)(v17 + 32);
  if ((v38 & 1) != 0)
  {
    v31 = v17;
    v40 = 1;
    sub_1B40B6A64();
    sub_1B40BCC9C();
    v25 = sub_1B40BCCCC();
    v27 = v26;
    (*(void (**)(char *, uint64_t))(v33 + 8))(v16, v15);
  }
  else
  {
    v39 = 0;
    sub_1B40B6AA8();
    v24 = v7;
    sub_1B40BCC9C();
    v25 = sub_1B40BCCCC();
    v27 = v28;
    (*(void (**)(char *, uint64_t))(v31 + 8))(v24, v14);
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v8);
  v22 = (uint64_t)v36;
  v29 = v32;
  *v32 = v25;
  v29[1] = v27;
  *((_BYTE *)v29 + 16) = v38;
  return __swift_destroy_boxed_opaque_existential_1(v22);
}

uint64_t sub_1B40B5ED0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return Target.init(from:)(a1, a2);
}

uint64_t sub_1B40B5EE4(_QWORD *a1)
{
  return Target.encode(to:)(a1);
}

uint64_t sub_1B40B5EF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char v5;
  os_unfair_lock_s *v6;
  uint64_t v7;
  char v8;
  __int128 v10;
  char v11;
  __int128 v12;

  v1 = v0;
  v2 = type metadata accessor for AssertionAttribute();
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v10 = 0;
  *((_QWORD *)&v10 + 1) = 0xE000000000000000;
  sub_1B40BCBE8();
  v12 = v10;
  sub_1B40BCA14();
  v5 = *(_BYTE *)(v0 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier + 16);
  v10 = *(_OWORD *)(v0 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier);
  v11 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF08BCB0);
  sub_1B40BC9F0();
  sub_1B40BCA14();
  swift_bridgeObjectRelease();
  sub_1B40BCA14();
  swift_bridgeObjectRetain();
  sub_1B40BCA14();
  swift_bridgeObjectRelease();
  sub_1B40BCA14();
  v6 = *(os_unfair_lock_s **)(*(_QWORD *)(v0 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  os_unfair_lock_lock(v6);
  v7 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
  v8 = *(_BYTE *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
  os_unfair_lock_unlock(v6);
  *(_QWORD *)&v10 = v7;
  BYTE8(v10) = v8;
  sub_1B40BC9F0();
  sub_1B40BCA14();
  swift_bridgeObjectRelease();
  sub_1B40BCA14();
  sub_1B40A5C78(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_attribute, (uint64_t)v4);
  sub_1B40BC9F0();
  sub_1B40BCA14();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t AttributeAssertion.target.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(v1 + 24);
  v3 = *(_BYTE *)(v1 + 32);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = v3;
  return sub_1B40A41C0();
}

uint64_t AttributeAssertion.explanation.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AttributeAssertion.duration.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 56);
}

void sub_1B40B614C(uint64_t a1@<X8>)
{
  uint64_t v1;
  os_unfair_lock_s *v3;
  char v4;

  v3 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  os_unfair_lock_lock(v3);
  v4 = *(_BYTE *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
  *(_BYTE *)(a1 + 8) = v4;
  os_unfair_lock_unlock(v3);
}

void sub_1B40B61A8(_QWORD *a1@<X8>)
{
  uint64_t v1;
  os_unfair_lock_s *v3;

  v3 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  os_unfair_lock_lock(v3);
  *a1 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_invalidationState);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v3);
}

uint64_t AttributeAssertion.init(explanation:target:attribute:duration:invalidationHandler:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;

  v9 = sub_1B40B685C(a1, a2, a3, a4, a5, a6 & 1, a7, a8);
  sub_1B40A5F54(a7);
  return v9;
}

uint64_t AttributeAssertion.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  int v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  v1 = type metadata accessor for AssertionAttribute();
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = v0 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_attribute;
  sub_1B40A5C78(v0 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_attribute, (uint64_t)v3);
  if (swift_getEnumCaseMultiPayload() == 1
    || ((sub_1B40A455C((uint64_t)v3),
         v5 = *(os_unfair_lock_s **)(*(_QWORD *)(v0 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16),
         os_unfair_lock_lock(v5),
         v6 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state),
         v7 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8),
         os_unfair_lock_unlock(v5),
         v7 == 1)
      ? (v8 = v6 == 0)
      : (v8 = 1),
        v8))
  {
    sub_1B40A4278();
    swift_bridgeObjectRelease();
    v9 = v0 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_acquisitionDate;
    v10 = sub_1B40BC8F4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
    sub_1B40A455C(v4);
    sub_1B40A5F54(*(_QWORD *)(v0 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_invalidationHandler));
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    return v0;
  }
  else
  {
    result = sub_1B40BCC48();
    __break(1u);
  }
  return result;
}

uint64_t AttributeAssertion.__deallocating_deinit()
{
  AttributeAssertion.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1B40B6418()
{
  return sub_1B40B6560((void (*)(uint64_t, uint64_t *))sub_1B40B6424);
}

uint64_t sub_1B40B6424(uint64_t result, uint64_t *a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _BYTE *v11;

  v3 = result;
  v4 = (_QWORD *)(result + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
  if (*(_BYTE *)(result + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8) == 1)
  {
    if (*v4)
      return result;
    swift_retain();
    sub_1B40AF464(v3);
    result = swift_release();
    v11 = v4 + 1;
    *v4 = 1;
  }
  else
  {
    v5 = (uint64_t *)(result + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_invalidationHandler);
    v6 = *(_QWORD *)(result + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_invalidationHandler);
    v7 = *(_QWORD *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_invalidationHandler + 8);
    v8 = *a2;
    *a2 = v6;
    a2[1] = v7;
    sub_1B40B3BCC(v6);
    sub_1B40A5F54(v8);
    v9 = *v5;
    *v5 = 0;
    v5[1] = 0;
    result = sub_1B40A5F54(v9);
    v10 = (_QWORD *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier);
    v11 = (_BYTE *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier + 16);
    *v10 = 0;
    v10[1] = 0;
  }
  *v11 = 1;
  return result;
}

uint64_t sub_1B40B6554()
{
  return sub_1B40B6560((void (*)(uint64_t, uint64_t *))sub_1B40B6628);
}

uint64_t sub_1B40B6560(void (*a1)(uint64_t, uint64_t *))
{
  uint64_t v1;
  os_unfair_lock_s *v3;
  void (*v4)(uint64_t, void *);
  void *v5;
  _BYTE *v6;
  uint64_t v8[2];

  v8[0] = 0;
  v8[1] = 0;
  v3 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  os_unfair_lock_lock(v3);
  a1(v1, v8);
  os_unfair_lock_unlock(v3);
  v4 = (void (*)(uint64_t, void *))v8[0];
  if (!v8[0])
    return sub_1B40A5F54(0);
  sub_1B40AA7D0();
  v5 = (void *)swift_allocError();
  *v6 = 0;
  swift_retain();
  v4(v1, v5);

  sub_1B40A5F54((uint64_t)v4);
  return sub_1B40A5F54(v8[0]);
}

uint64_t sub_1B40B6628(uint64_t result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13[2];
  uint64_t v14;

  v2 = result + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state;
  if (*(_BYTE *)(result + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8) == 1)
  {
    v3 = result;
    *(_QWORD *)v2 = 4;
    *(_BYTE *)(v2 + 8) = 0;
    v4 = result + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier;
    if ((*(_BYTE *)(result + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier + 16) & 1) != 0)
    {
      __break(1u);
    }
    else
    {
      v6 = *(_QWORD *)(v4 + 8);
      v7 = HIDWORD(*(_QWORD *)v4);
      v13[0] = *(_QWORD *)v4;
      v13[1] = v7;
      v14 = v6;
      swift_retain();
      sub_1B40AF6B4(v13);
      swift_release();
      v8 = (uint64_t *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_invalidationHandler);
      v9 = *v8;
      v10 = v8[1];
      v11 = *a2;
      *a2 = *v8;
      a2[1] = v10;
      sub_1B40B3BCC(v9);
      sub_1B40A5F54(v11);
      v12 = *v8;
      *v8 = 0;
      v8[1] = 0;
      result = sub_1B40A5F54(v12);
      *(_QWORD *)v4 = 0;
      *(_QWORD *)(v4 + 8) = 0;
      *(_BYTE *)(v4 + 16) = 1;
    }
  }
  return result;
}

uint64_t sub_1B40B6748(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15[2];
  uint64_t v16;

  v4 = result + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state;
  if (*(_BYTE *)(result + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8) == 1)
  {
    v6 = result;
    *(_QWORD *)v4 = a2;
    *(_BYTE *)(v4 + 8) = 0;
    *(_QWORD *)(result + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_invalidationState) = a3;
    swift_bridgeObjectRetain();
    result = swift_bridgeObjectRelease();
    v7 = v6 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier;
    if ((*(_BYTE *)(v6 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier + 16) & 1) != 0)
    {
      __break(1u);
    }
    else
    {
      v8 = *(_QWORD *)(v7 + 8);
      v9 = HIDWORD(*(_QWORD *)v7);
      v15[0] = *(_QWORD *)v7;
      v15[1] = v9;
      v16 = v8;
      swift_retain();
      sub_1B40AF6B4(v15);
      swift_release();
      v10 = (uint64_t *)(v6 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_invalidationHandler);
      v11 = *v10;
      v12 = v10[1];
      v13 = *a4;
      *a4 = *v10;
      a4[1] = v12;
      sub_1B40B3BCC(v11);
      sub_1B40A5F54(v13);
      v14 = *v10;
      *v10 = 0;
      v10[1] = 0;
      result = sub_1B40A5F54(v14);
      *(_QWORD *)v7 = 0;
      *(_QWORD *)(v7 + 8) = 0;
      *(_BYTE *)(v7 + 16) = 1;
    }
  }
  return result;
}

uint64_t sub_1B40B685C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _DWORD *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v14 = *a3;
  v13 = a3[1];
  v15 = *((_BYTE *)a3 + 16);
  sub_1B40BC8E8();
  v16 = v8 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier;
  *(_QWORD *)v16 = 0;
  *(_QWORD *)(v16 + 8) = 0;
  *(_BYTE *)(v16 + 16) = 1;
  v17 = (_QWORD *)(v8 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_invalidationHandler);
  *v17 = 0;
  v17[1] = 0;
  v18 = OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock;
  type metadata accessor for UnfairLock();
  v19 = swift_allocObject();
  v20 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v19 + 16) = v20;
  *(_QWORD *)(v8 + v18) = v19;
  *v20 = 0;
  v21 = OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_manager;
  if (qword_1ED502368 != -1)
    swift_once();
  swift_beginAccess();
  *(_QWORD *)(v8 + v21) = qword_1ED502400;
  *(_QWORD *)(v8 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_invalidationState) = 0;
  *(_QWORD *)(v8 + 16) = v14;
  *(_QWORD *)(v8 + 24) = v13;
  *(_BYTE *)(v8 + 32) = v15;
  sub_1B40A5C78(a4, v8 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_attribute);
  *(_QWORD *)(v8 + 40) = a1;
  *(_QWORD *)(v8 + 48) = a2;
  *(_QWORD *)(v8 + 56) = a5;
  *(_BYTE *)(v8 + 64) = a6 & 1;
  v22 = (uint64_t *)(v8 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_invalidationHandler);
  v23 = *(_QWORD *)(v8 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_invalidationHandler);
  *v22 = a7;
  v22[1] = a8;
  swift_retain();
  sub_1B40B3BCC(a7);
  sub_1B40A5F54(v23);
  v24 = v8 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state;
  *(_QWORD *)v24 = 0;
  *(_BYTE *)(v24 + 8) = 1;
  sub_1B40B6418();
  sub_1B40A455C(a4);
  return v8;
}

unint64_t sub_1B40B6A20()
{
  unint64_t result;

  result = qword_1ED5027E0;
  if (!qword_1ED5027E0)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BF31C, &type metadata for Target.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5027E0);
  }
  return result;
}

unint64_t sub_1B40B6A64()
{
  unint64_t result;

  result = qword_1ED502808;
  if (!qword_1ED502808)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BF2CC, &type metadata for Target.ActivityCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED502808);
  }
  return result;
}

unint64_t sub_1B40B6AA8()
{
  unint64_t result;

  result = qword_1EF08BF00;
  if (!qword_1EF08BF00)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BF27C, &type metadata for Target.AppCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BF00);
  }
  return result;
}

uint64_t destroy for Target()
{
  return sub_1B40A4278();
}

uint64_t _s16SessionAssertion6TargetOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_1B40A41C0();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for Target(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_1B40A41C0();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_1B40A4278();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Target(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_1B40A4278();
  return a1;
}

uint64_t getEnumTagSinglePayload for Target(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Target(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_1B40B6C80(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1B40B6C88(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Target()
{
  return &type metadata for Target;
}

uint64_t sub_1B40B6CA4()
{
  return type metadata accessor for AttributeAssertion();
}

uint64_t type metadata accessor for AttributeAssertion()
{
  uint64_t result;

  result = qword_1ED5023F0;
  if (!qword_1ED5023F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B40B6CE8()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_1B40BC8F4();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for AssertionAttribute();
    if (v2 <= 0x3F)
      return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t method lookup function for AttributeAssertion()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AttributeAssertion.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of AttributeAssertion.state.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of AttributeAssertion.invalidationState.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of AttributeAssertion.__allocating_init(explanation:target:attribute:duration:invalidationHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v6 + 312))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of AttributeAssertion.invalidate()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for AttributeAssertion.State(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AttributeAssertion.State(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_1B40B6E68(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1B40B6E84(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AttributeAssertion.State()
{
  return &type metadata for AttributeAssertion.State;
}

uint64_t storeEnumTagSinglePayload for Target.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B40B6F00 + 4 * byte_1B40BEE95[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B40B6F34 + 4 * byte_1B40BEE90[v4]))();
}

uint64_t sub_1B40B6F34(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B40B6F3C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B40B6F44);
  return result;
}

uint64_t sub_1B40B6F50(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B40B6F58);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B40B6F5C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B40B6F64(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Target.CodingKeys()
{
  return &type metadata for Target.CodingKeys;
}

ValueMetadata *type metadata accessor for Target.AppCodingKeys()
{
  return &type metadata for Target.AppCodingKeys;
}

uint64_t _s16SessionAssertion6TargetO13AppCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1B40B6FD4 + 4 * byte_1B40BEE9A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1B40B6FF4 + 4 * byte_1B40BEE9F[v4]))();
}

_BYTE *sub_1B40B6FD4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1B40B6FF4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B40B6FFC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B40B7004(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B40B700C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B40B7014(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for Target.ActivityCodingKeys()
{
  return &type metadata for Target.ActivityCodingKeys;
}

unint64_t sub_1B40B7034()
{
  unint64_t result;

  result = qword_1EF08BF08;
  if (!qword_1EF08BF08)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BF0E4, &type metadata for Target.ActivityCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BF08);
  }
  return result;
}

unint64_t sub_1B40B707C()
{
  unint64_t result;

  result = qword_1EF08BF10;
  if (!qword_1EF08BF10)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BF19C, &type metadata for Target.AppCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BF10);
  }
  return result;
}

unint64_t sub_1B40B70C4()
{
  unint64_t result;

  result = qword_1EF08BF18;
  if (!qword_1EF08BF18)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BF254, &type metadata for Target.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BF18);
  }
  return result;
}

unint64_t sub_1B40B710C()
{
  unint64_t result;

  result = qword_1ED502800;
  if (!qword_1ED502800)
  {
    result = MEMORY[0x1B5E363EC]("]7k2|,", &type metadata for Target.AppCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED502800);
  }
  return result;
}

unint64_t sub_1B40B7154()
{
  unint64_t result;

  result = qword_1ED5027F8;
  if (!qword_1ED5027F8)
  {
    result = MEMORY[0x1B5E363EC]("E7k2T,", &type metadata for Target.AppCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5027F8);
  }
  return result;
}

unint64_t sub_1B40B719C()
{
  unint64_t result;

  result = qword_1ED502818;
  if (!qword_1ED502818)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BF054, &type metadata for Target.ActivityCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED502818);
  }
  return result;
}

unint64_t sub_1B40B71E4()
{
  unint64_t result;

  result = qword_1ED502810;
  if (!qword_1ED502810)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BF07C, &type metadata for Target.ActivityCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED502810);
  }
  return result;
}

unint64_t sub_1B40B722C()
{
  unint64_t result;

  result = qword_1ED5027F0;
  if (!qword_1ED5027F0)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BF1C4, &type metadata for Target.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5027F0);
  }
  return result;
}

unint64_t sub_1B40B7274()
{
  unint64_t result;

  result = qword_1ED5027E8;
  if (!qword_1ED5027E8)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BF1EC, &type metadata for Target.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5027E8);
  }
  return result;
}

uint64_t sub_1B40B72B8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 7368801 && a2 == 0xE300000000000000;
  if (v2 || (sub_1B40BCD80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7974697669746361 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1B40BCD80();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1B40B7398(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  __int128 v7;

  sub_1B40BC888();
  swift_allocObject();
  sub_1B40BC87C();
  v3 = sub_1B40BC8DC();
  v5 = v4;
  sub_1B40A3418();
  sub_1B40BC870();
  swift_release();
  sub_1B40A3A80(v3, v5);
  result = 1;
  *(_OWORD *)a2 = v7;
  *(_BYTE *)(a2 + 16) = 0;
  return result;
}

uint64_t sub_1B40B747C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  int v7;
  int v8;
  uint64_t v9;

  if (a1)
  {
    sub_1B40BC888();
    swift_allocObject();
    sub_1B40BC87C();
    v3 = sub_1B40BC8DC();
    v5 = v4;
    sub_1B40A3418();
    sub_1B40BC870();
    sub_1B40A3A80(v3, v5);
    result = swift_release();
    *(_DWORD *)a2 = v7;
    *(_DWORD *)(a2 + 4) = v8;
    *(_QWORD *)(a2 + 8) = v9;
  }
  else
  {
    __break(1u);
    result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

_DWORD *sub_1B40B7560()
{
  uint64_t v0;
  _DWORD *result;

  type metadata accessor for UnfairLock();
  v0 = swift_allocObject();
  result = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v0 + 16) = result;
  *result = 0;
  off_1ED502508 = (_UNKNOWN *)v0;
  return result;
}

void static AssertionIdentifier.nextCount.getter()
{
  os_unfair_lock_s *v0;

  if (qword_1ED5023D0 != -1)
    swift_once();
  v0 = (os_unfair_lock_s *)*((_QWORD *)off_1ED502508 + 2);
  os_unfair_lock_lock(v0);
  if (__OFADD__(qword_1ED5023D8, 1))
  {
    __break(1u);
  }
  else
  {
    ++qword_1ED5023D8;
    os_unfair_lock_unlock(v0);
  }
}

uint64_t AssertionIdentifier.serverPid.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t AssertionIdentifier.clientPid.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 4);
}

uint64_t AssertionIdentifier.count.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t AssertionIdentifier.init(serverPid:clientPid:count:)@<X0>(uint64_t result@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_DWORD *)a4 = result;
  *(_DWORD *)(a4 + 4) = a2;
  *(_QWORD *)(a4 + 8) = a3;
  return result;
}

uint64_t AssertionIdentifier.hash(into:)()
{
  sub_1B40BCDF8();
  sub_1B40BCDF8();
  return sub_1B40BCE04();
}

BOOL static AssertionIdentifier.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)a1 == *(_DWORD *)a2
      && *(_DWORD *)(a1 + 4) == *(_DWORD *)(a2 + 4)
      && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
}

uint64_t sub_1B40B76BC()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6950746E65696C63;
  if (*v0 != 1)
    v1 = 0x746E756F63;
  if (*v0)
    return v1;
  else
    return 0x6950726576726573;
}

uint64_t sub_1B40B7714@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B40B91F8(a1, a2);
  *a3 = result;
  return result;
}

void sub_1B40B7738(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1B40B7744()
{
  sub_1B40B78E8();
  return sub_1B40BCE34();
}

uint64_t sub_1B40B776C()
{
  sub_1B40B78E8();
  return sub_1B40BCE40();
}

uint64_t AssertionIdentifier.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD v9[2];
  int v10;
  char v11;
  char v12;
  char v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502838);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_DWORD *)(v1 + 4);
  v9[1] = *(_QWORD *)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B40B78E8();
  sub_1B40BCE28();
  v13 = 0;
  sub_1B40BCD5C();
  if (!v2)
  {
    v12 = 1;
    sub_1B40BCD5C();
    v11 = 2;
    sub_1B40BCD68();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_1B40B78E8()
{
  unint64_t result;

  result = qword_1ED5026C0;
  if (!qword_1ED5026C0)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BF5F8, &type metadata for AssertionIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5026C0);
  }
  return result;
}

uint64_t AssertionIdentifier.hashValue.getter()
{
  sub_1B40BCDE0();
  sub_1B40BCDF8();
  sub_1B40BCDF8();
  sub_1B40BCE04();
  return sub_1B40BCE10();
}

uint64_t AssertionIdentifier.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int v9;
  int v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  char v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502830);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B40B78E8();
  sub_1B40BCE1C();
  if (!v2)
  {
    v16 = 0;
    v9 = sub_1B40BCCF0();
    v15 = 1;
    v11 = sub_1B40BCCF0();
    v14 = 2;
    v12 = sub_1B40BCCFC();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_DWORD *)a2 = v9;
    *(_DWORD *)(a2 + 4) = v11;
    *(_QWORD *)(a2 + 8) = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1B40B7B08@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return AssertionIdentifier.init(from:)(a1, a2);
}

uint64_t sub_1B40B7B1C(_QWORD *a1)
{
  return AssertionIdentifier.encode(to:)(a1);
}

uint64_t sub_1B40B7B30()
{
  sub_1B40BCDE0();
  sub_1B40BCDF8();
  sub_1B40BCDF8();
  sub_1B40BCE04();
  return sub_1B40BCE10();
}

uint64_t sub_1B40B7B98()
{
  sub_1B40BCDF8();
  sub_1B40BCDF8();
  return sub_1B40BCE04();
}

uint64_t sub_1B40B7BDC()
{
  sub_1B40BCDE0();
  sub_1B40BCDF8();
  sub_1B40BCDF8();
  sub_1B40BCE04();
  return sub_1B40BCE10();
}

BOOL sub_1B40B7C40(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)a1 == *(_DWORD *)a2
      && *(_DWORD *)(a1 + 4) == *(_DWORD *)(a2 + 4)
      && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
}

uint64_t AssertionIdentifier.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v4;
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  unsigned __int8 *v30;
  unsigned int v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;

  v34 = a1;
  v35 = a2;
  sub_1B40B85F8();
  v4 = (_QWORD *)sub_1B40BCB94();
  result = swift_bridgeObjectRelease();
  if (v4[2] != 3)
    goto LABEL_55;
  v6 = v4[4];
  v7 = v4[5];
  v8 = HIBYTE(v7) & 0xF;
  v9 = v6 & 0xFFFFFFFFFFFFLL;
  if (!((v7 & 0x2000000000000000) != 0 ? HIBYTE(v7) & 0xF : v6 & 0xFFFFFFFFFFFFLL))
    goto LABEL_55;
  if ((v7 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v12 = (uint64_t)sub_1B40B863C(v6, v7, 10);
    LOBYTE(v6) = v33;
    result = swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  if ((v7 & 0x2000000000000000) == 0)
  {
    if ((v6 & 0x1000000000000000) != 0)
      v11 = (unsigned __int8 *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v11 = (unsigned __int8 *)sub_1B40BCC24();
    result = (uint64_t)sub_1B40B8AC0(v11, v9, 10);
    v12 = result;
    LOBYTE(v6) = v13 & 1;
    goto LABEL_45;
  }
  v34 = v4[4];
  v35 = v7 & 0xFFFFFFFFFFFFFFLL;
  if (v6 == 43)
  {
    if (!v8)
    {
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if (v8 == 1 || (BYTE1(v6) - 48) > 9u)
      goto LABEL_32;
    v12 = (BYTE1(v6) - 48);
    if (v8 != 2)
    {
      if ((BYTE2(v6) - 48) > 9u)
        goto LABEL_32;
      v12 = 10 * (BYTE1(v6) - 48) + (BYTE2(v6) - 48);
      v14 = v8 - 3;
      if (v8 != 3)
      {
        v15 = (unsigned __int8 *)&v34 + 3;
        while (1)
        {
          v16 = *v15 - 48;
          if (v16 > 9)
            goto LABEL_32;
          v17 = 10 * v12;
          if ((unsigned __int128)(v12 * (__int128)10) >> 64 != (10 * v12) >> 63)
            goto LABEL_32;
          v12 = v17 + v16;
          if (__OFADD__(v17, v16))
            goto LABEL_32;
          LOBYTE(v6) = 0;
          ++v15;
          if (!--v14)
            goto LABEL_45;
        }
      }
    }
LABEL_44:
    LOBYTE(v6) = 0;
    goto LABEL_45;
  }
  if (v6 != 45)
  {
    if (!v8 || (v6 - 48) > 9u)
      goto LABEL_32;
    v12 = (v6 - 48);
    if (v8 != 1)
    {
      if ((BYTE1(v6) - 48) > 9u)
        goto LABEL_32;
      v12 = 10 * (v6 - 48) + (BYTE1(v6) - 48);
      v18 = v8 - 2;
      if (v8 != 2)
      {
        v19 = (unsigned __int8 *)&v34 + 2;
        while (1)
        {
          v20 = *v19 - 48;
          if (v20 > 9)
            goto LABEL_32;
          v21 = 10 * v12;
          if ((unsigned __int128)(v12 * (__int128)10) >> 64 != (10 * v12) >> 63)
            goto LABEL_32;
          v12 = v21 + v20;
          if (__OFADD__(v21, v20))
            goto LABEL_32;
          LOBYTE(v6) = 0;
          ++v19;
          if (!--v18)
            goto LABEL_45;
        }
      }
    }
    goto LABEL_44;
  }
  if (!v8)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  if (v8 == 1 || (BYTE1(v6) - 48) > 9u)
    goto LABEL_32;
  if (v8 != 2)
  {
    if ((BYTE2(v6) - 48) <= 9u)
    {
      v12 = -10 * (BYTE1(v6) - 48) - (BYTE2(v6) - 48);
      v22 = v8 - 3;
      if (v8 == 3)
        goto LABEL_44;
      v30 = (unsigned __int8 *)&v34 + 3;
      while (1)
      {
        v31 = *v30 - 48;
        if (v31 > 9)
          break;
        v32 = 10 * v12;
        if ((unsigned __int128)(v12 * (__int128)10) >> 64 != (10 * v12) >> 63)
          break;
        v12 = v32 - v31;
        if (__OFSUB__(v32, v31))
          break;
        LOBYTE(v6) = 0;
        ++v30;
        if (!--v22)
          goto LABEL_45;
      }
    }
LABEL_32:
    v12 = 0;
    LOBYTE(v6) = 1;
    goto LABEL_45;
  }
  LOBYTE(v6) = 0;
  v12 = -(uint64_t)(BYTE1(v6) - 48);
LABEL_45:
  if ((v6 & 1) != 0)
    goto LABEL_55;
  if (v4[2] < 2uLL)
  {
    __break(1u);
    goto LABEL_66;
  }
  v23 = v4[6];
  v24 = v4[7];
  swift_bridgeObjectRetain();
  result = sub_1B40B804C(v23, v24);
  if ((v25 & 1) != 0)
  {
LABEL_55:
    result = swift_bridgeObjectRelease();
    goto LABEL_56;
  }
  if (v4[2] < 3uLL)
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  v26 = result;
  v27 = v4[8];
  v28 = v4[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  result = sub_1B40B804C(v27, v28);
  if ((v29 & 1) != 0)
  {
LABEL_56:
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_BYTE *)(a3 + 16) = 1;
    return result;
  }
  if (v12 > 0x7FFFFFFF)
  {
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  if (v12 >= (uint64_t)0xFFFFFFFF80000000 && v26 >= (uint64_t)0xFFFFFFFF80000000)
  {
    if (v26 <= 0x7FFFFFFF)
    {
      *(_QWORD *)a3 = v12 | ((unint64_t)v26 << 32);
      *(_QWORD *)(a3 + 8) = result;
      *(_BYTE *)(a3 + 16) = 0;
      return result;
    }
    goto LABEL_71;
  }
LABEL_70:
  __break(1u);
LABEL_71:
  __break(1u);
  return result;
}

uint64_t sub_1B40B804C(uint64_t result, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];

  v3 = HIBYTE(a2) & 0xF;
  v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v5 = v3;
  else
    v5 = result & 0xFFFFFFFFFFFFLL;
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0)
        v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v6 = (unsigned __int8 *)sub_1B40BCC24();
      v7 = (uint64_t)sub_1B40B8AC0(v6, v4, 10);
      v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3)
        goto LABEL_50;
      if (v3 == 1 || (BYTE1(result) - 48) > 9u)
        goto LABEL_34;
      v7 = (BYTE1(result) - 48);
      v14 = v3 - 2;
      if (v14)
      {
        v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          v16 = *v15 - 48;
          if (v16 > 9)
            goto LABEL_34;
          v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v17 + v16;
          if (__OFADD__(v17, v16))
            goto LABEL_34;
          v9 = 0;
          ++v15;
          if (!--v14)
            goto LABEL_37;
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            v7 = -(uint64_t)(BYTE1(result) - 48);
            v10 = v3 - 2;
            if (v10)
            {
              v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                v12 = *v11 - 48;
                if (v12 > 9)
                  goto LABEL_34;
                v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
                  goto LABEL_34;
                v7 = v13 - v12;
                if (__OFSUB__(v13, v12))
                  goto LABEL_34;
                v9 = 0;
                ++v11;
                if (!--v10)
                  goto LABEL_37;
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          v7 = 0;
          v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u)
        goto LABEL_34;
      v7 = (result - 48);
      v18 = v3 - 1;
      if (v18)
      {
        v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          v20 = *v19 - 48;
          if (v20 > 9)
            goto LABEL_34;
          v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v21 + v20;
          if (__OFADD__(v21, v20))
            goto LABEL_34;
          v9 = 0;
          ++v19;
          if (!--v18)
            goto LABEL_37;
        }
      }
    }
LABEL_36:
    v9 = 0;
    goto LABEL_37;
  }
  v7 = (uint64_t)sub_1B40B863C(result, a2, 10);
  v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
    return 0;
  else
    return v7;
}

uint64_t AssertionIdentifier.description.getter()
{
  uint64_t v1;

  v1 = sub_1B40BCD74();
  sub_1B40BCA14();
  sub_1B40BCD74();
  sub_1B40BCA14();
  swift_bridgeObjectRelease();
  sub_1B40BCA14();
  sub_1B40BCD74();
  sub_1B40BCA14();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1B40B837C()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;

  sub_1B40BC8AC();
  swift_allocObject();
  sub_1B40BC8A0();
  sub_1B40A3188();
  v0 = sub_1B40BC894();
  v2 = v1;
  v3 = sub_1B40BC8D0();
  sub_1B40A3A80(v0, v2);
  swift_release();
  return v3;
}

double sub_1B40B843C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  double result;
  __int128 v7;

  sub_1B40BC888();
  swift_allocObject();
  sub_1B40BC87C();
  v3 = sub_1B40BC8DC();
  v5 = v4;
  sub_1B40A3418();
  sub_1B40BC870();
  sub_1B40A3A80(v3, v5);
  swift_release();
  result = *(double *)&v7;
  *(_OWORD *)a2 = v7;
  *(_BYTE *)(a2 + 16) = 0;
  return result;
}

_QWORD *sub_1B40B851C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5024E8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1B40B8580(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_1B40BCA5C();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x1B5E35C90](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

unint64_t sub_1B40B85F8()
{
  unint64_t result;

  result = qword_1EF08BF20;
  if (!qword_1EF08BF20)
  {
    result = MEMORY[0x1B5E363EC](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EF08BF20);
  }
  return result;
}

unsigned __int8 *sub_1B40B863C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_1B40BCA68();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_1B40B8D3C();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_1B40BCC24();
  }
LABEL_7:
  v11 = sub_1B40B8AC0(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_1B40B8724()
{
  unint64_t result;

  result = qword_1ED5026E0;
  if (!qword_1ED5026E0)
  {
    result = MEMORY[0x1B5E363EC](&protocol conformance descriptor for AssertionIdentifier, &type metadata for AssertionIdentifier);
    atomic_store(result, (unint64_t *)&qword_1ED5026E0);
  }
  return result;
}

unint64_t sub_1B40B876C()
{
  unint64_t result;

  result = qword_1EF08BF28;
  if (!qword_1EF08BF28)
  {
    result = MEMORY[0x1B5E363EC](&protocol conformance descriptor for AssertionIdentifier, &type metadata for AssertionIdentifier);
    atomic_store(result, (unint64_t *)&qword_1EF08BF28);
  }
  return result;
}

unint64_t sub_1B40B87B0(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_1B40A3418();
  a1[2] = sub_1B40A3188();
  result = sub_1B40B87E4();
  a1[3] = result;
  return result;
}

unint64_t sub_1B40B87E4()
{
  unint64_t result;

  result = qword_1ED501F58;
  if (!qword_1ED501F58)
  {
    result = MEMORY[0x1B5E363EC](&protocol conformance descriptor for AssertionIdentifier, &type metadata for AssertionIdentifier);
    atomic_store(result, (unint64_t *)&qword_1ED501F58);
  }
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AssertionIdentifier(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AssertionIdentifier(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AssertionIdentifier()
{
  return &type metadata for AssertionIdentifier;
}

uint64_t getEnumTagSinglePayload for AssertionIdentifier.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AssertionIdentifier.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B40B8968 + 4 * byte_1B40BF375[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1B40B899C + 4 * byte_1B40BF370[v4]))();
}

uint64_t sub_1B40B899C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B40B89A4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B40B89ACLL);
  return result;
}

uint64_t sub_1B40B89B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B40B89C0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1B40B89C4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B40B89CC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AssertionIdentifier.CodingKeys()
{
  return &type metadata for AssertionIdentifier.CodingKeys;
}

unint64_t sub_1B40B89EC()
{
  unint64_t result;

  result = qword_1EF08BF30;
  if (!qword_1EF08BF30)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BF5D0, &type metadata for AssertionIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BF30);
  }
  return result;
}

unint64_t sub_1B40B8A34()
{
  unint64_t result;

  result = qword_1ED5026D0;
  if (!qword_1ED5026D0)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BF540, &type metadata for AssertionIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5026D0);
  }
  return result;
}

unint64_t sub_1B40B8A7C()
{
  unint64_t result;

  result = qword_1ED5026C8;
  if (!qword_1ED5026C8)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BF568, &type metadata for AssertionIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5026C8);
  }
  return result;
}

unsigned __int8 *sub_1B40B8AC0(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_1B40B8D3C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_1B40BCA74();
  v4 = sub_1B40B8DB8(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1B40B8DB8(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_1B40B8EFC(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_1B40B851C(v9, 0);
      v12 = sub_1B40B8FE8((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    }
    v13 = MEMORY[0x1B5E35C60](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x1B5E35C60);
LABEL_9:
      sub_1B40BCC24();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x1B5E35C60]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_1B40B8EFC(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_1B40B8580(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_1B40B8580(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_1B40BCA44();
  }
  __break(1u);
  return result;
}

unint64_t sub_1B40B8FE8(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_1B40B8580(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_1B40BCA50();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_1B40BCC24();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_1B40B8580(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_1B40BCA2C();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_1B40B91F8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6950726576726573 && a2 == 0xE900000000000064;
  if (v2 || (sub_1B40BCD80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6950746E65696C63 && a2 == 0xE900000000000064 || (sub_1B40BCD80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746E756F63 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_1B40BCD80();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t static AssertionInvalidationMessage._unconditionallyBridgeFromObjectiveC(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  if (a1)
  {
    sub_1B40BC840();
    swift_allocObject();
    sub_1B40BC834();
    v3 = sub_1B40BC8DC();
    v5 = v4;
    sub_1B40A9CC0();
    sub_1B40BC828();
    sub_1B40A3A80(v3, v5);
    result = swift_release();
    *(_QWORD *)a2 = v7;
    *(_OWORD *)(a2 + 8) = v8;
    *(_QWORD *)(a2 + 24) = v9;
  }
  else
  {
    __break(1u);
    result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

double AssertionInvalidationMessage.init(identifier:reason:invalidationState:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  double result;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *a3;
  result = *(double *)a1;
  *a4 = *(_QWORD *)a1;
  a4[1] = v4;
  a4[2] = a2;
  a4[3] = v5;
  return result;
}

uint64_t AssertionInvalidationReason.description.getter(uint64_t a1)
{
  uint64_t result;

  result = 0x7974697669746361;
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
      return result;
    case 3:
      result = 0x64657269707865;
      break;
    case 4:
    case 5:
      result = 0xD000000000000012;
      break;
    case 6:
      result = 0x6765726F46707061;
      break;
    case 7:
      result = 0x6F69747265737361;
      break;
    default:
      result = sub_1B40BCD8C();
      __break(1u);
      break;
  }
  return result;
}

unint64_t AssertionInvalidationReason.init(rawValue:)(unint64_t a1)
{
  return sub_1B40B9F64(a1);
}

BOOL sub_1B40B95A0(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1B40B95B4()
{
  sub_1B40BCDE0();
  sub_1B40BCDEC();
  return sub_1B40BCE10();
}

uint64_t sub_1B40B95F8()
{
  return sub_1B40BCDEC();
}

uint64_t sub_1B40B9620()
{
  sub_1B40BCDE0();
  sub_1B40BCDEC();
  return sub_1B40BCE10();
}

unint64_t sub_1B40B9660@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_1B40B9F64(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_1B40B9690(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1B40B969C()
{
  sub_1B40BA71C();
  return sub_1B40BCA8C();
}

uint64_t sub_1B40B96F8()
{
  sub_1B40BA71C();
  return sub_1B40BCA80();
}

uint64_t sub_1B40B9744()
{
  uint64_t *v0;

  return AssertionInvalidationReason.description.getter(*v0);
}

double AssertionInvalidationMessage.identifier.getter@<D0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(v1 + 8);
  result = *(double *)v1;
  *a1 = *(_QWORD *)v1;
  a1[1] = v2;
  return result;
}

uint64_t AssertionInvalidationMessage.reason.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t AssertionInvalidationMessage.invalidationState.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B40B9774()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0x6E6F73616572;
  if (*v0 != 1)
    v1 = 0xD000000000000011;
  if (*v0)
    return v1;
  else
    return 0x696669746E656469;
}

uint64_t sub_1B40B97D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B40BA10C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1B40B97F8()
{
  sub_1B40B9F74();
  return sub_1B40BCE34();
}

uint64_t sub_1B40B9820()
{
  sub_1B40B9F74();
  return sub_1B40BCE40();
}

uint64_t AssertionInvalidationMessage.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502690);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = v3[1];
  v9 = v3[2];
  v13 = v3[3];
  v14 = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B40B9F74();
  sub_1B40BCE28();
  v15 = *v3;
  v16 = v10;
  v17 = 0;
  sub_1B40A3188();
  sub_1B40BCD50();
  if (!v2)
  {
    v11 = v13;
    v15 = v14;
    v17 = 1;
    sub_1B40B9FB8();
    sub_1B40BCD50();
    v15 = v11;
    v17 = 2;
    sub_1B40B9FFC();
    sub_1B40BCD2C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t AssertionInvalidationMessage.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502638);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B40B9F74();
  sub_1B40BCE1C();
  if (!v2)
  {
    v15 = 0;
    sub_1B40A3418();
    sub_1B40BCCE4();
    v9 = v16;
    v10 = v17;
    v15 = 1;
    sub_1B40BA040();
    sub_1B40BCCE4();
    v12 = v16;
    v15 = 2;
    sub_1B40BA084();
    sub_1B40BCCC0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v13 = v16;
    *a2 = v9;
    a2[1] = v10;
    a2[2] = v12;
    a2[3] = v13;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1B40B9BB0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return AssertionInvalidationMessage.init(from:)(a1, a2);
}

uint64_t sub_1B40B9BC4(_QWORD *a1)
{
  return AssertionInvalidationMessage.encode(to:)(a1);
}

NSData __swiftcall AssertionInvalidationMessage._bridgeToObjectiveC()()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;

  sub_1B40BC864();
  swift_allocObject();
  sub_1B40BC858();
  sub_1B40BA0C8();
  v0 = sub_1B40BC84C();
  v2 = v1;
  v3 = sub_1B40BC8D0();
  sub_1B40A3A80(v0, v2);
  swift_release();
  return (NSData)v3;
}

uint64_t sub_1B40B9CB4()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;

  sub_1B40BC864();
  swift_allocObject();
  sub_1B40BC858();
  sub_1B40BA0C8();
  v0 = sub_1B40BC84C();
  v2 = v1;
  v3 = sub_1B40BC8D0();
  sub_1B40A3A80(v0, v2);
  swift_release();
  return v3;
}

uint64_t sub_1B40B9D90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  if (a1)
  {
    sub_1B40BC840();
    swift_allocObject();
    sub_1B40BC834();
    v3 = sub_1B40BC8DC();
    v5 = v4;
    sub_1B40A9CC0();
    sub_1B40BC828();
    sub_1B40A3A80(v3, v5);
    result = swift_release();
    *(_QWORD *)a2 = v7;
    *(_OWORD *)(a2 + 8) = v8;
    *(_QWORD *)(a2 + 24) = v9;
  }
  else
  {
    __break(1u);
    result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

double _s16SessionAssertion0B19InvalidationMessageV26_forceBridgeFromObjectiveC_6resultySo6NSDataC_ACSgztFZ_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  double result;
  __int128 v7;
  __int128 v8;

  sub_1B40BC840();
  swift_allocObject();
  sub_1B40BC834();
  v3 = sub_1B40BC8DC();
  v5 = v4;
  sub_1B40A9CC0();
  sub_1B40BC828();
  sub_1B40BA760(*a2, a2[1], a2[2], a2[3]);
  sub_1B40A3A80(v3, v5);
  swift_release();
  result = *(double *)&v7;
  *(_OWORD *)a2 = v7;
  *((_OWORD *)a2 + 1) = v8;
  return result;
}

unint64_t sub_1B40B9F64(unint64_t result)
{
  if (result > 7)
    return 0;
  return result;
}

unint64_t sub_1B40B9F74()
{
  unint64_t result;

  result = qword_1ED502760;
  if (!qword_1ED502760)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BF950, &type metadata for AssertionInvalidationMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED502760);
  }
  return result;
}

unint64_t sub_1B40B9FB8()
{
  unint64_t result;

  result = qword_1ED502680;
  if (!qword_1ED502680)
  {
    result = MEMORY[0x1B5E363EC](&protocol conformance descriptor for AssertionInvalidationReason, &type metadata for AssertionInvalidationReason);
    atomic_store(result, (unint64_t *)&qword_1ED502680);
  }
  return result;
}

unint64_t sub_1B40B9FFC()
{
  unint64_t result;

  result = qword_1ED502678;
  if (!qword_1ED502678)
  {
    result = MEMORY[0x1B5E363EC](&protocol conformance descriptor for AssertionInvalidationState, &type metadata for AssertionInvalidationState);
    atomic_store(result, (unint64_t *)&qword_1ED502678);
  }
  return result;
}

unint64_t sub_1B40BA040()
{
  unint64_t result;

  result = qword_1ED502628;
  if (!qword_1ED502628)
  {
    result = MEMORY[0x1B5E363EC](&protocol conformance descriptor for AssertionInvalidationReason, &type metadata for AssertionInvalidationReason);
    atomic_store(result, (unint64_t *)&qword_1ED502628);
  }
  return result;
}

unint64_t sub_1B40BA084()
{
  unint64_t result;

  result = qword_1ED502620;
  if (!qword_1ED502620)
  {
    result = MEMORY[0x1B5E363EC](&protocol conformance descriptor for AssertionInvalidationState, &type metadata for AssertionInvalidationState);
    atomic_store(result, (unint64_t *)&qword_1ED502620);
  }
  return result;
}

unint64_t sub_1B40BA0C8()
{
  unint64_t result;

  result = qword_1ED502688;
  if (!qword_1ED502688)
  {
    result = MEMORY[0x1B5E363EC](&protocol conformance descriptor for AssertionInvalidationMessage, &type metadata for AssertionInvalidationMessage);
    atomic_store(result, (unint64_t *)&qword_1ED502688);
  }
  return result;
}

uint64_t sub_1B40BA10C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_1B40BCD80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F73616572 && a2 == 0xE600000000000000 || (sub_1B40BCD80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001B40C0B00)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_1B40BCD80();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t _s16SessionAssertion0B19InvalidationMessageV34_conditionallyBridgeFromObjectiveC_6resultSbSo6NSDataC_ACSgztFZ_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  __int128 v7;
  __int128 v8;

  sub_1B40BA760(*a2, a2[1], a2[2], a2[3]);
  sub_1B40BC840();
  swift_allocObject();
  sub_1B40BC834();
  v3 = sub_1B40BC8DC();
  v5 = v4;
  sub_1B40A9CC0();
  sub_1B40BC828();
  swift_release();
  sub_1B40A3A80(v3, v5);
  result = 1;
  *(_OWORD *)a2 = v7;
  *((_OWORD *)a2 + 1) = v8;
  return result;
}

unint64_t sub_1B40BA354()
{
  unint64_t result;

  result = qword_1EF08BF38;
  if (!qword_1EF08BF38)
  {
    result = MEMORY[0x1B5E363EC](&protocol conformance descriptor for AssertionInvalidationReason, &type metadata for AssertionInvalidationReason);
    atomic_store(result, (unint64_t *)&qword_1EF08BF38);
  }
  return result;
}

ValueMetadata *type metadata accessor for AssertionInvalidationReason()
{
  return &type metadata for AssertionInvalidationReason;
}

uint64_t initializeBufferWithCopyOfBuffer for AssertionInvalidationMessage(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AssertionInvalidationMessage()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AssertionInvalidationMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AssertionInvalidationMessage(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

uint64_t assignWithTake for AssertionInvalidationMessage(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AssertionInvalidationMessage(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AssertionInvalidationMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AssertionInvalidationMessage()
{
  return &type metadata for AssertionInvalidationMessage;
}

uint64_t storeEnumTagSinglePayload for AssertionInvalidationMessage.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B40BA5C4 + 4 * byte_1B40BF65D[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1B40BA5F8 + 4 * byte_1B40BF658[v4]))();
}

uint64_t sub_1B40BA5F8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B40BA600(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B40BA608);
  return result;
}

uint64_t sub_1B40BA614(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B40BA61CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1B40BA620(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B40BA628(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AssertionInvalidationMessage.CodingKeys()
{
  return &type metadata for AssertionInvalidationMessage.CodingKeys;
}

unint64_t sub_1B40BA648()
{
  unint64_t result;

  result = qword_1EF08BF40;
  if (!qword_1EF08BF40)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BF928, &type metadata for AssertionInvalidationMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BF40);
  }
  return result;
}

unint64_t sub_1B40BA690()
{
  unint64_t result;

  result = qword_1ED502770;
  if (!qword_1ED502770)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BF898, &type metadata for AssertionInvalidationMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED502770);
  }
  return result;
}

unint64_t sub_1B40BA6D8()
{
  unint64_t result;

  result = qword_1ED502768;
  if (!qword_1ED502768)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BF8C0, &type metadata for AssertionInvalidationMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED502768);
  }
  return result;
}

unint64_t sub_1B40BA71C()
{
  unint64_t result;

  result = qword_1ED502758;
  if (!qword_1ED502758)
  {
    result = MEMORY[0x1B5E363EC]("e3k2<'", &type metadata for AssertionInvalidationReason);
    atomic_store(result, (unint64_t *)&qword_1ED502758);
  }
  return result;
}

uint64_t sub_1B40BA760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (a4 != 1)
    return swift_bridgeObjectRelease();
  return result;
}

NSData __swiftcall AssertionAcquisitionRequest._bridgeToObjectiveC()()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;

  sub_1B40BC864();
  swift_allocObject();
  sub_1B40BC858();
  type metadata accessor for AssertionAcquisitionRequest();
  sub_1B40A391C(&qword_1ED502428, (uint64_t (*)(uint64_t))type metadata accessor for AssertionAcquisitionRequest, (uint64_t)"!1k2|$");
  v0 = sub_1B40BC84C();
  v2 = v1;
  v3 = sub_1B40BC8D0();
  sub_1B40A3A80(v0, v2);
  swift_release();
  return (NSData)v3;
}

uint64_t type metadata accessor for AssertionAcquisitionRequest()
{
  uint64_t result;

  result = qword_1ED5026B0;
  if (!qword_1ED5026B0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t AssertionAcquisitionRequest.init(attribute:explanation:acquisitionDate:target:duration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X8>)
{
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  int *v19;
  uint64_t result;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;

  v15 = *a5;
  v16 = a5[1];
  v17 = *((_BYTE *)a5 + 16);
  v18 = sub_1B40BC8F4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(a8, a4, v18);
  v19 = (int *)type metadata accessor for AssertionAcquisitionRequest();
  result = sub_1B40A345C(a1, a8 + v19[5], (uint64_t (*)(_QWORD))type metadata accessor for AssertionAttribute);
  v21 = (_QWORD *)(a8 + v19[6]);
  *v21 = a2;
  v21[1] = a3;
  v22 = a8 + v19[8];
  *(_QWORD *)v22 = a6;
  *(_BYTE *)(v22 + 8) = a7 & 1;
  v23 = a8 + v19[7];
  *(_QWORD *)v23 = v15;
  *(_QWORD *)(v23 + 8) = v16;
  *(_BYTE *)(v23 + 16) = v17;
  return result;
}

uint64_t AssertionAcquisitionRequest.acquisitionDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1B40BC8F4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t AssertionAcquisitionRequest.attribute.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for AssertionAcquisitionRequest();
  return sub_1B40B3C64(v1 + *(int *)(v3 + 20), a1, (uint64_t (*)(_QWORD))type metadata accessor for AssertionAttribute);
}

uint64_t AssertionAcquisitionRequest.explanation.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for AssertionAcquisitionRequest() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AssertionAcquisitionRequest.target.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = v1 + *(int *)(type metadata accessor for AssertionAcquisitionRequest() + 28);
  v4 = *(_QWORD *)(v3 + 8);
  v5 = *(_BYTE *)(v3 + 16);
  *(_QWORD *)a1 = *(_QWORD *)v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return sub_1B40A41C0();
}

uint64_t AssertionAcquisitionRequest.duration.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for AssertionAcquisitionRequest() + 32));
}

uint64_t sub_1B40BAA68()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B40BAAA4 + 4 * byte_1B40BF9B0[*v0]))(0x7469736975716361, 0xEF657461446E6F69);
}

uint64_t sub_1B40BAAA4()
{
  return 0x7475626972747461;
}

uint64_t sub_1B40BAAC0()
{
  return 0x74616E616C707865;
}

uint64_t sub_1B40BAAE0()
{
  return 0x746567726174;
}

uint64_t sub_1B40BAAF4()
{
  return 0x6E6F697461727564;
}

uint64_t sub_1B40BAB0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B40BB948(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1B40BAB30()
{
  sub_1B40BADBC();
  return sub_1B40BCE34();
}

uint64_t sub_1B40BAB58()
{
  sub_1B40BADBC();
  return sub_1B40BCE40();
}

uint64_t AssertionAcquisitionRequest.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  __int128 *v10;
  char v11;
  _BYTE v13[16];
  __int128 v14;
  char v15;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5024E0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B40BADBC();
  sub_1B40BCE28();
  LOBYTE(v14) = 0;
  sub_1B40BC8F4();
  sub_1B40A391C(&qword_1ED5023E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB0890]);
  sub_1B40BCD50();
  if (!v2)
  {
    v9 = type metadata accessor for AssertionAcquisitionRequest();
    LOBYTE(v14) = 1;
    type metadata accessor for AssertionAttribute();
    sub_1B40A391C(&qword_1ED502450, (uint64_t (*)(uint64_t))type metadata accessor for AssertionAttribute, (uint64_t)&protocol conformance descriptor for AssertionAttribute);
    sub_1B40BCD50();
    LOBYTE(v14) = 2;
    sub_1B40BCD38();
    v10 = (__int128 *)(v3 + *(int *)(v9 + 28));
    v11 = *((_BYTE *)v10 + 16);
    v14 = *v10;
    v15 = v11;
    v13[15] = 3;
    sub_1B40BAE00();
    sub_1B40BCD50();
    LOBYTE(v14) = 4;
    sub_1B40BCD20();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_1B40BADBC()
{
  unint64_t result;

  result = qword_1ED502740;
  if (!qword_1ED502740)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BFBCC, &type metadata for AssertionAcquisitionRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED502740);
  }
  return result;
}

unint64_t sub_1B40BAE00()
{
  unint64_t result;

  result = qword_1ED502458;
  if (!qword_1ED502458)
  {
    result = MEMORY[0x1B5E363EC](&protocol conformance descriptor for Target, &type metadata for Target);
    atomic_store(result, (unint64_t *)&qword_1ED502458);
  }
  return result;
}

uint64_t AssertionAcquisitionRequest.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  char v36;
  char v37;

  v27 = a2;
  v28 = type metadata accessor for AssertionAttribute();
  MEMORY[0x1E0C80A78](v28);
  v29 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_1B40BC8F4();
  v4 = *(_QWORD *)(v30 - 8);
  MEMORY[0x1E0C80A78](v30);
  v31 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED502558);
  v6 = *(_QWORD *)(v33 - 8);
  MEMORY[0x1E0C80A78](v33);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (int *)type metadata accessor for AssertionAcquisitionRequest();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B40BADBC();
  v32 = v8;
  v12 = v34;
  sub_1B40BCE1C();
  if (v12)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v13 = (uint64_t)v29;
  v14 = (uint64_t)v11;
  LOBYTE(v35) = 0;
  sub_1B40A391C(&qword_1ED5024F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08C0]);
  v15 = v30;
  sub_1B40BCCE4();
  v34 = v4;
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v14, v31, v15);
  LOBYTE(v35) = 1;
  sub_1B40A391C(&qword_1ED502530, (uint64_t (*)(uint64_t))type metadata accessor for AssertionAttribute, (uint64_t)&protocol conformance descriptor for AssertionAttribute);
  sub_1B40BCCE4();
  sub_1B40A345C(v13, v14 + v9[5], (uint64_t (*)(_QWORD))type metadata accessor for AssertionAttribute);
  LOBYTE(v35) = 2;
  v16 = sub_1B40BCCCC();
  v17 = (uint64_t *)(v14 + v9[6]);
  *v17 = v16;
  v17[1] = v18;
  v37 = 3;
  sub_1B40BB270();
  sub_1B40BCCE4();
  v19 = v36;
  v20 = v14 + v9[7];
  *(_OWORD *)v20 = v35;
  *(_BYTE *)(v20 + 16) = v19;
  LOBYTE(v35) = 4;
  v21 = sub_1B40BCCB4();
  v22 = *(void (**)(char *, uint64_t))(v6 + 8);
  v24 = v23;
  v22(v32, v33);
  v25 = v14 + v9[8];
  *(_QWORD *)v25 = v21;
  *(_BYTE *)(v25 + 8) = v24 & 1;
  sub_1B40B3C64(v14, v27, (uint64_t (*)(_QWORD))type metadata accessor for AssertionAcquisitionRequest);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_1B40BB2B4(v14, (uint64_t (*)(_QWORD))type metadata accessor for AssertionAcquisitionRequest);
}

unint64_t sub_1B40BB270()
{
  unint64_t result;

  result = qword_1ED502538;
  if (!qword_1ED502538)
  {
    result = MEMORY[0x1B5E363EC](&protocol conformance descriptor for Target, &type metadata for Target);
    atomic_store(result, (unint64_t *)&qword_1ED502538);
  }
  return result;
}

uint64_t sub_1B40BB2B4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1B40BB2F0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return AssertionAcquisitionRequest.init(from:)(a1, a2);
}

uint64_t sub_1B40BB304(_QWORD *a1)
{
  return AssertionAcquisitionRequest.encode(to:)(a1);
}

uint64_t static AssertionAcquisitionRequest._forceBridgeFromObjectiveC(_:result:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5023E0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B40BC840();
  swift_allocObject();
  sub_1B40BC834();
  v6 = type metadata accessor for AssertionAcquisitionRequest();
  v7 = sub_1B40BC8DC();
  v9 = v8;
  sub_1B40A391C(&qword_1ED502520, (uint64_t (*)(uint64_t))type metadata accessor for AssertionAcquisitionRequest, (uint64_t)&protocol conformance descriptor for AssertionAcquisitionRequest);
  sub_1B40BC828();
  sub_1B40BB480(a2);
  sub_1B40A3A80(v7, v9);
  swift_release();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 0, 1, v6);
  return sub_1B40BB4C0((uint64_t)v5, a2);
}

uint64_t sub_1B40BB480(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5023E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B40BB4C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5023E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static AssertionAcquisitionRequest._unconditionallyBridgeFromObjectiveC(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v17;
  uint64_t result;
  uint64_t v19[2];

  v19[0] = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5023E0);
  v6 = MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v6);
  v11 = (char *)v19 - v10;
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)v19 - v12;
  v14 = type metadata accessor for AssertionAcquisitionRequest();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v16(v13, 1, 1, v14);
  if (a1)
  {
    sub_1B40BC840();
    swift_allocObject();
    sub_1B40BC834();
    v3 = sub_1B40BC8DC();
    v2 = v17;
    sub_1B40A391C(&qword_1ED502520, (uint64_t (*)(uint64_t))type metadata accessor for AssertionAcquisitionRequest, (uint64_t)&protocol conformance descriptor for AssertionAcquisitionRequest);
    sub_1B40BC828();
    sub_1B40BB480((uint64_t)v13);
    sub_1B40A3A80(v3, v2);
    swift_release();
    v16(v11, 0, 1, v14);
    sub_1B40BB4C0((uint64_t)v11, (uint64_t)v13);
    sub_1B40BBD44((uint64_t)v13, (uint64_t)v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14) != 1)
    {
      sub_1B40BB480((uint64_t)v13);
      return sub_1B40A345C((uint64_t)v8, v19[0], (uint64_t (*)(_QWORD))type metadata accessor for AssertionAcquisitionRequest);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  sub_1B40A3A80(v3, v2);
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_1B40BB714()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;

  sub_1B40BC864();
  swift_allocObject();
  sub_1B40BC858();
  sub_1B40A391C(&qword_1ED502428, (uint64_t (*)(uint64_t))type metadata accessor for AssertionAcquisitionRequest, (uint64_t)"!1k2|$");
  v0 = sub_1B40BC84C();
  v2 = v1;
  v3 = sub_1B40BC8D0();
  sub_1B40A3A80(v0, v2);
  swift_release();
  return v3;
}

uint64_t sub_1B40BB7E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5023E0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B40BC840();
  swift_allocObject();
  sub_1B40BC834();
  v8 = sub_1B40BC8DC();
  v10 = v9;
  sub_1B40A391C(&qword_1ED502520, (uint64_t (*)(uint64_t))type metadata accessor for AssertionAcquisitionRequest, (uint64_t)&protocol conformance descriptor for AssertionAcquisitionRequest);
  sub_1B40BC828();
  sub_1B40BB480(a2);
  sub_1B40A3A80(v8, v10);
  swift_release();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(v7, 0, 1, a3);
  return sub_1B40BB4C0((uint64_t)v7, a2);
}

uint64_t sub_1B40BB948(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x7469736975716361 && a2 == 0xEF657461446E6F69;
  if (v2 || (sub_1B40BCD80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7475626972747461 && a2 == 0xE900000000000065 || (sub_1B40BCD80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74616E616C707865 && a2 == 0xEB000000006E6F69 || (sub_1B40BCD80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746567726174 && a2 == 0xE600000000000000 || (sub_1B40BCD80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_1B40BCD80();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

BOOL _s16SessionAssertion0B18AcquisitionRequestV34_conditionallyBridgeFromObjectiveC_6resultSbSo6NSDataC_ACSgztFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  _BYTE v16[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5023E0);
  v4 = MEMORY[0x1E0C80A78](v3);
  v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v4);
  v8 = &v16[-v7];
  sub_1B40BB480(a2);
  sub_1B40BC840();
  swift_allocObject();
  sub_1B40BC834();
  v9 = type metadata accessor for AssertionAcquisitionRequest();
  v10 = sub_1B40BC8DC();
  v12 = v11;
  sub_1B40A391C(&qword_1ED502520, (uint64_t (*)(uint64_t))type metadata accessor for AssertionAcquisitionRequest, (uint64_t)&protocol conformance descriptor for AssertionAcquisitionRequest);
  sub_1B40BC828();
  swift_release();
  sub_1B40A3A80(v10, v12);
  v13 = *(_QWORD *)(v9 - 8);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v9);
  sub_1B40BB4C0((uint64_t)v8, a2);
  sub_1B40BBD44(a2, (uint64_t)v6);
  v14 = (*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v13 + 48))(v6, 1, v9) != 1;
  sub_1B40BB480((uint64_t)v6);
  return v14;
}

uint64_t sub_1B40BBD44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED5023E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_QWORD *initializeBufferWithCopyOfBuffer for AssertionAcquisitionRequest(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char *v24;
  char *v25;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1B40BC8F4();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for AssertionAttribute();
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v12 = sub_1B40BC918();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    v14 = a3[6];
    v15 = a3[7];
    v16 = (_QWORD *)((char *)a1 + v14);
    v17 = (_QWORD *)((char *)a2 + v14);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v19 = (char *)a1 + v15;
    v20 = *(_QWORD *)((char *)a2 + v15);
    v21 = *(_QWORD *)((char *)a2 + v15 + 8);
    v22 = *((_BYTE *)a2 + v15 + 16);
    swift_bridgeObjectRetain();
    sub_1B40A41C0();
    *(_QWORD *)v19 = v20;
    *((_QWORD *)v19 + 1) = v21;
    v19[16] = v22;
    v23 = a3[8];
    v24 = (char *)a1 + v23;
    v25 = (char *)a2 + v23;
    *(_QWORD *)v24 = *(_QWORD *)v25;
    v24[8] = v25[8];
  }
  return a1;
}

uint64_t destroy for AssertionAcquisitionRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_1B40BC8F4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  type metadata accessor for AssertionAttribute();
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v6 = sub_1B40BC918();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  swift_bridgeObjectRelease();
  return sub_1B40A4278();
}

uint64_t initializeWithCopy for AssertionAcquisitionRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = sub_1B40BC8F4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for AssertionAttribute();
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v11 = sub_1B40BC918();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  v12 = a3[6];
  v13 = a3[7];
  v14 = (_QWORD *)(a1 + v12);
  v15 = (_QWORD *)(a2 + v12);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = a1 + v13;
  v18 = *(_QWORD *)(a2 + v13);
  v19 = *(_QWORD *)(a2 + v13 + 8);
  v20 = *(_BYTE *)(a2 + v13 + 16);
  swift_bridgeObjectRetain();
  sub_1B40A41C0();
  *(_QWORD *)v17 = v18;
  *(_QWORD *)(v17 + 8) = v19;
  *(_BYTE *)(v17 + 16) = v20;
  v21 = a3[8];
  v22 = a1 + v21;
  v23 = a2 + v21;
  *(_QWORD *)v22 = *(_QWORD *)v23;
  *(_BYTE *)(v22 + 8) = *(_BYTE *)(v23 + 8);
  return a1;
}

uint64_t assignWithCopy for AssertionAcquisitionRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;

  v6 = sub_1B40BC8F4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  if (a1 != a2)
  {
    v7 = a3[5];
    v8 = (void *)(a1 + v7);
    v9 = (const void *)(a2 + v7);
    sub_1B40BB2B4(a1 + v7, (uint64_t (*)(_QWORD))type metadata accessor for AssertionAttribute);
    v10 = type metadata accessor for AssertionAttribute();
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v11 = sub_1B40BC918();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
  }
  v12 = a3[6];
  v13 = (_QWORD *)(a1 + v12);
  v14 = (_QWORD *)(a2 + v12);
  *v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = (uint64_t *)(a2 + v15);
  v18 = *v17;
  v19 = v17[1];
  v20 = *((_BYTE *)v17 + 16);
  sub_1B40A41C0();
  *(_QWORD *)v16 = v18;
  *(_QWORD *)(v16 + 8) = v19;
  *(_BYTE *)(v16 + 16) = v20;
  sub_1B40A4278();
  v21 = a3[8];
  v22 = a1 + v21;
  v23 = (uint64_t *)(a2 + v21);
  v24 = *v23;
  *(_BYTE *)(v22 + 8) = *((_BYTE *)v23 + 8);
  *(_QWORD *)v22 = v24;
  return a1;
}

uint64_t initializeWithTake for AssertionAcquisitionRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = sub_1B40BC8F4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for AssertionAttribute();
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v11 = sub_1B40BC918();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  v12 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_OWORD *)v13 = *(_OWORD *)v14;
  *(_BYTE *)(v13 + 16) = *(_BYTE *)(v14 + 16);
  v15 = a3[8];
  v16 = a1 + v15;
  v17 = a2 + v15;
  *(_QWORD *)v16 = *(_QWORD *)v17;
  *(_BYTE *)(v16 + 8) = *(_BYTE *)(v17 + 8);
  return a1;
}

uint64_t assignWithTake for AssertionAcquisitionRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = sub_1B40BC8F4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  if (a1 != a2)
  {
    v7 = a3[5];
    v8 = (void *)(a1 + v7);
    v9 = (const void *)(a2 + v7);
    sub_1B40BB2B4(a1 + v7, (uint64_t (*)(_QWORD))type metadata accessor for AssertionAttribute);
    v10 = type metadata accessor for AssertionAttribute();
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v11 = sub_1B40BC918();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
  }
  v12 = a3[6];
  v13 = (_QWORD *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v16 = *v14;
  v15 = v14[1];
  *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  v17 = a3[7];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = *(_BYTE *)(v19 + 16);
  *(_OWORD *)v18 = *(_OWORD *)v19;
  *(_BYTE *)(v18 + 16) = v20;
  sub_1B40A4278();
  v21 = a3[8];
  v22 = a1 + v21;
  v23 = a2 + v21;
  *(_QWORD *)v22 = *(_QWORD *)v23;
  *(_BYTE *)(v22 + 8) = *(_BYTE *)(v23 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for AssertionAcquisitionRequest()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B40BC484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v6 = sub_1B40BC8F4();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = type metadata accessor for AssertionAttribute();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t storeEnumTagSinglePayload for AssertionAcquisitionRequest()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B40BC53C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_1B40BC8F4();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = type metadata accessor for AssertionAttribute();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_1B40BC5E4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_1B40BC8F4();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for AssertionAttribute();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for AssertionAcquisitionRequest.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_1B40BC6D0 + 4 * byte_1B40BF9BA[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1B40BC704 + 4 * byte_1B40BF9B5[v4]))();
}

uint64_t sub_1B40BC704(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B40BC70C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B40BC714);
  return result;
}

uint64_t sub_1B40BC720(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B40BC728);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1B40BC72C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B40BC734(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AssertionAcquisitionRequest.CodingKeys()
{
  return &type metadata for AssertionAcquisitionRequest.CodingKeys;
}

unint64_t sub_1B40BC754()
{
  unint64_t result;

  result = qword_1EF08BF48;
  if (!qword_1EF08BF48)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BFBA4, &type metadata for AssertionAcquisitionRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF08BF48);
  }
  return result;
}

unint64_t sub_1B40BC79C()
{
  unint64_t result;

  result = qword_1ED502750;
  if (!qword_1ED502750)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BFB14, &type metadata for AssertionAcquisitionRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED502750);
  }
  return result;
}

unint64_t sub_1B40BC7E4()
{
  unint64_t result;

  result = qword_1ED502748;
  if (!qword_1ED502748)
  {
    result = MEMORY[0x1B5E363EC](&unk_1B40BFB3C, &type metadata for AssertionAcquisitionRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED502748);
  }
  return result;
}

uint64_t sub_1B40BC828()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1B40BC834()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1B40BC840()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1B40BC84C()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1B40BC858()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1B40BC864()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1B40BC870()
{
  return MEMORY[0x1E0CAF5C8]();
}

uint64_t sub_1B40BC87C()
{
  return MEMORY[0x1E0CAF5F8]();
}

uint64_t sub_1B40BC888()
{
  return MEMORY[0x1E0CAF608]();
}

uint64_t sub_1B40BC894()
{
  return MEMORY[0x1E0CAF638]();
}

uint64_t sub_1B40BC8A0()
{
  return MEMORY[0x1E0CAF668]();
}

uint64_t sub_1B40BC8AC()
{
  return MEMORY[0x1E0CAF670]();
}

uint64_t sub_1B40BC8B8()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1B40BC8C4()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1B40BC8D0()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1B40BC8DC()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1B40BC8E8()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1B40BC8F4()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1B40BC900()
{
  return MEMORY[0x1E0C8F938]();
}

uint64_t sub_1B40BC90C()
{
  return MEMORY[0x1E0C8F950]();
}

uint64_t sub_1B40BC918()
{
  return MEMORY[0x1E0C8F968]();
}

uint64_t sub_1B40BC924()
{
  return MEMORY[0x1E0C8FC80]();
}

uint64_t sub_1B40BC930()
{
  return MEMORY[0x1E0C8FF30]();
}

uint64_t sub_1B40BC93C()
{
  return MEMORY[0x1E0D8CD88]();
}

uint64_t sub_1B40BC948()
{
  return MEMORY[0x1E0D8CD90]();
}

uint64_t sub_1B40BC954()
{
  return MEMORY[0x1E0D8CDA0]();
}

uint64_t sub_1B40BC960()
{
  return MEMORY[0x1E0C90220]();
}

uint64_t sub_1B40BC96C()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1B40BC978()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1B40BC984()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1B40BC990()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1B40BC99C()
{
  return MEMORY[0x1E0DEF580]();
}

uint64_t sub_1B40BC9A8()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1B40BC9B4()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1B40BC9C0()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1B40BC9CC()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1B40BC9D8()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1B40BC9E4()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1B40BC9F0()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1B40BC9FC()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1B40BCA08()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1B40BCA14()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1B40BCA20()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1B40BCA2C()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1B40BCA38()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1B40BCA44()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1B40BCA50()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1B40BCA5C()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1B40BCA68()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1B40BCA74()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1B40BCA80()
{
  return MEMORY[0x1E0DEACB8]();
}

uint64_t sub_1B40BCA8C()
{
  return MEMORY[0x1E0DEAD30]();
}

uint64_t sub_1B40BCA98()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1B40BCAA4()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1B40BCAB0()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1B40BCABC()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1B40BCAC8()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1B40BCAD4()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1B40BCAE0()
{
  return MEMORY[0x1E0DEB220]();
}

uint64_t sub_1B40BCAEC()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1B40BCAF8()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1B40BCB04()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1B40BCB10()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1B40BCB1C()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1B40BCB28()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1B40BCB34()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1B40BCB40()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_1B40BCB4C()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1B40BCB58()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1B40BCB64()
{
  return MEMORY[0x1E0D8CDF0]();
}

uint64_t sub_1B40BCB70()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1B40BCB7C()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1B40BCB88()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1B40BCB94()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t sub_1B40BCBA0()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1B40BCBAC()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1B40BCBB8()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1B40BCBC4()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1B40BCBD0()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1B40BCBDC()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1B40BCBE8()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1B40BCBF4()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1B40BCC00()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1B40BCC0C()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t sub_1B40BCC18()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_1B40BCC24()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1B40BCC30()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1B40BCC3C()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1B40BCC48()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1B40BCC54()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1B40BCC60()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1B40BCC6C()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1B40BCC78()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1B40BCC84()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1B40BCC90()
{
  return MEMORY[0x1E0DECEF0]();
}

uint64_t sub_1B40BCC9C()
{
  return MEMORY[0x1E0DECF38]();
}

uint64_t sub_1B40BCCA8()
{
  return MEMORY[0x1E0DECF40]();
}

uint64_t sub_1B40BCCB4()
{
  return MEMORY[0x1E0DECF68]();
}

uint64_t sub_1B40BCCC0()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1B40BCCCC()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1B40BCCD8()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1B40BCCE4()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1B40BCCF0()
{
  return MEMORY[0x1E0DED008]();
}

uint64_t sub_1B40BCCFC()
{
  return MEMORY[0x1E0DED010]();
}

uint64_t sub_1B40BCD08()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t sub_1B40BCD14()
{
  return MEMORY[0x1E0DED070]();
}

uint64_t sub_1B40BCD20()
{
  return MEMORY[0x1E0DED0A0]();
}

uint64_t sub_1B40BCD2C()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1B40BCD38()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1B40BCD44()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1B40BCD50()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1B40BCD5C()
{
  return MEMORY[0x1E0DED138]();
}

uint64_t sub_1B40BCD68()
{
  return MEMORY[0x1E0DED140]();
}

uint64_t sub_1B40BCD74()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1B40BCD80()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1B40BCD8C()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1B40BCD98()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1B40BCDA4()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1B40BCDB0()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1B40BCDBC()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1B40BCDC8()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1B40BCDD4()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1B40BCDE0()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1B40BCDEC()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1B40BCDF8()
{
  return MEMORY[0x1E0DEDF28]();
}

uint64_t sub_1B40BCE04()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_1B40BCE10()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1B40BCE1C()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1B40BCE28()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1B40BCE34()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1B40BCE40()
{
  return MEMORY[0x1E0DEE8E8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1E0DEEF80]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

