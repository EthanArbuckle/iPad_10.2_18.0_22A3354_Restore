SetupKit::SKEnvironmentValues __swiftcall SKEnvironmentValues.init()()
{
  SetupKit::SKEnvironmentValues *v0;
  SetupKit::SKEnvironmentValues *v1;
  SetupKit::SKEnvironmentValues result;

  v1 = v0;
  result._values._rawValue = (void *)sub_2147F23FC(MEMORY[0x24BEE4AF8]);
  v1->_values._rawValue = result._values._rawValue;
  return result;
}

id sub_2147F01EC(uint64_t a1)
{
  unint64_t v2;
  char v3;
  uint64_t v5;
  _OWORD v6[2];

  if (*(_QWORD *)(a1 + 16)
    && (v2 = sub_2147F1BA0((uint64_t)&type metadata for DispatchQueueSKEnvironmentKey), (v3 & 1) != 0))
  {
    sub_2147F2530(*(_QWORD *)(a1 + 56) + 32 * v2, (uint64_t)v6);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88120);
  sub_2147F2628();
  if (swift_dynamicCast())
    return (id)v5;
  if (qword_254D8A510 != -1)
    swift_once();
  return (id)qword_254D8A518;
}

uint64_t sub_2147F02BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char *v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  _OWORD v14[2];

  __swift_instantiateConcreteTypeFromMangledName(&qword_254D881C8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a1 + 16) && (v6 = sub_2147F1BA0((uint64_t)&type metadata for ClockSKEnvironmentKey), (v7 & 1) != 0))
    sub_2147F2530(*(_QWORD *)(a1 + 56) + 32 * v6, (uint64_t)v14);
  else
    memset(v14, 0, sizeof(v14));
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88120);
  v8 = sub_214852428();
  v9 = swift_dynamicCast();
  v10 = *(_QWORD *)(v8 - 8);
  v11 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  if (v9)
  {
    v11(v5, 0, 1, v8);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a2, v5, v8);
  }
  else
  {
    v11(v5, 1, 1, v8);
    sub_2147F275C((uint64_t)v5, &qword_254D881C8);
    if (qword_254D8A4F0 != -1)
      swift_once();
    v13 = __swift_project_value_buffer(v8, (uint64_t)qword_254D8A4F8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(a2, v13, v8);
  }
}

uint64_t sub_2147F042C(uint64_t a1)
{
  unint64_t v2;
  char v3;
  uint64_t v5;
  _OWORD v6[2];

  if (*(_QWORD *)(a1 + 16)
    && (v2 = sub_2147F1BA0((uint64_t)&type metadata for BluetoothMockIDSKEnvironmentKey), (v3 & 1) != 0))
  {
    sub_2147F2530(*(_QWORD *)(a1 + 56) + 32 * v2, (uint64_t)v6);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88120);
  __swift_instantiateConcreteTypeFromMangledName(qword_254D88130);
  if (swift_dynamicCast())
    return v5;
  else
    return 0;
}

uint64_t sub_2147F04C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char *v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  _OWORD v14[2];

  __swift_instantiateConcreteTypeFromMangledName(&qword_254D881B8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a1 + 16)
    && (v6 = sub_2147F1BA0((uint64_t)&type metadata for NexusEnvironmentSKEnvironmentKey), (v7 & 1) != 0))
  {
    sub_2147F2530(*(_QWORD *)(a1 + 56) + 32 * v6, (uint64_t)v14);
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88120);
  v8 = sub_21485250C();
  v9 = swift_dynamicCast();
  v10 = *(_QWORD *)(v8 - 8);
  v11 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  if (v9)
  {
    v11(v5, 0, 1, v8);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a2, v5, v8);
  }
  else
  {
    v11(v5, 1, 1, v8);
    sub_2147F275C((uint64_t)v5, &qword_254D881B8);
    if (qword_254D8A520 != -1)
      swift_once();
    v13 = __swift_project_value_buffer(v8, (uint64_t)qword_254D8A528);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(a2, v13, v8);
  }
}

uint64_t sub_2147F0638@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char *v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  _OWORD v14[2];

  __swift_instantiateConcreteTypeFromMangledName(&qword_254D881B0);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a1 + 16)
    && (v6 = sub_2147F1BA0((uint64_t)&type metadata for NexusSessionConfigurationSKEnvironmentKey), (v7 & 1) != 0))
  {
    sub_2147F2530(*(_QWORD *)(a1 + 56) + 32 * v6, (uint64_t)v14);
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88120);
  v8 = sub_214852584();
  v9 = swift_dynamicCast();
  v10 = *(_QWORD *)(v8 - 8);
  v11 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  if (v9)
  {
    v11(v5, 0, 1, v8);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a2, v5, v8);
  }
  else
  {
    v11(v5, 1, 1, v8);
    sub_2147F275C((uint64_t)v5, &qword_254D881B0);
    if (qword_254D8A540 != -1)
      swift_once();
    v13 = __swift_project_value_buffer(v8, (uint64_t)qword_254D8A548);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(a2, v13, v8);
  }
}

uint64_t SKEnvironmentValues.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  _OWORD v21[2];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = sub_214852914();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)v21 - v12;
  v14 = *v4;
  if (*(_QWORD *)(v14 + 16) && (v15 = sub_2147F1BA0(a1), (v16 & 1) != 0))
    sub_2147F2530(*(_QWORD *)(v14 + 56) + 32 * v15, (uint64_t)v21);
  else
    memset(v21, 0, sizeof(v21));
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88120);
  v17 = swift_dynamicCast();
  v18 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  if ((v17 & 1) != 0)
  {
    v19(v13, 0, 1, AssociatedTypeWitness);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v18 + 32))(a4, v13, AssociatedTypeWitness);
  }
  else
  {
    v19(v13, 1, 1, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  }
}

uint64_t SKEnvironmentValues.subscript.setter(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;

  sub_2147F256C(a1, a2);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
}

uint64_t sub_2147F0978(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  char v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD v14[2];

  v3 = v2;
  if (*(_QWORD *)(a1 + 24))
  {
    sub_2147F272C((_OWORD *)a1, v14);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v12 = *v2;
    *v2 = 0x8000000000000000;
    sub_2147F20C0(v14, a2, isUniquelyReferenced_nonNull_native);
    *v2 = v12;
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_2147F275C(a1, &qword_254D88120);
    v7 = sub_2147F1BA0(a2);
    if ((v8 & 1) != 0)
    {
      v9 = v7;
      v10 = swift_isUniquelyReferenced_nonNull_native();
      v11 = *v2;
      v13 = *v3;
      *v3 = 0x8000000000000000;
      if ((v10 & 1) == 0)
      {
        sub_2147F223C();
        v11 = v13;
      }
      sub_2147F272C((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v9), v14);
      sub_2147F1F2C(v9, v11);
      *v3 = v11;
      swift_bridgeObjectRelease();
    }
    else
    {
      memset(v14, 0, sizeof(v14));
    }
    return sub_2147F275C((uint64_t)v14, &qword_254D88120);
  }
}

void (*SKEnvironmentValues.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t **a1, char a2)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  size_t v12;
  void *v13;

  v9 = malloc(0x40uLL);
  *a1 = v9;
  v9[2] = a4;
  v9[3] = v4;
  *v9 = a2;
  v9[1] = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9[4] = AssociatedTypeWitness;
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v9[5] = v11;
  v12 = *(_QWORD *)(v11 + 64);
  v9[6] = malloc(v12);
  v13 = malloc(v12);
  v9[7] = v13;
  SKEnvironmentValues.subscript.getter(a2, a3, a4, (uint64_t)v13);
  return sub_2147F0B54;
}

void sub_2147F0B54(uint64_t **a1, char a2)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, uint64_t);

  v2 = *a1;
  v3 = (void *)(*a1)[6];
  v4 = (void *)(*a1)[7];
  v5 = (*a1)[4];
  v6 = (*a1)[5];
  v7 = **a1;
  if ((a2 & 1) != 0)
  {
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[6], v4, v5);
    sub_2147F256C((uint64_t)v3, v7);
    v8 = *(void (**)(void *, uint64_t))(v6 + 8);
    v8(v3, v5);
  }
  else
  {
    sub_2147F256C((*a1)[7], v7);
    v8 = *(void (**)(void *, uint64_t))(v6 + 8);
  }
  v8(v4, v5);
  free(v4);
  free(v3);
  free(v2);
}

uint64_t SKEnvironmental<>.unownedExecutor.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v6;

  (*(void (**)(uint64_t *__return_ptr))(a2 + 8))(&v6);
  v2 = swift_bridgeObjectRetain();
  v3 = sub_2147F01EC(v2);
  swift_bridgeObjectRelease_n();
  v4 = sub_2148528FC();

  return v4;
}

id SKEnvironmentValues.dispatchQueue.getter()
{
  uint64_t v0;
  id v1;

  v0 = swift_bridgeObjectRetain();
  v1 = sub_2147F01EC(v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_2147F0CC4(uint64_t a1)
{
  return sub_2147F1784(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BE29D60], qword_254D8A4F8, MEMORY[0x24BE29CF0]);
}

uint64_t sub_2147F0CE0@<X0>(uint64_t a1@<X8>)
{
  return sub_2147F144C(&qword_254D8A4F0, (uint64_t (*)(_QWORD))MEMORY[0x24BE29D60], (uint64_t)qword_254D8A4F8, a1);
}

uint64_t SKEnvironmentValues.clock.getter()
{
  return sub_2147F1804((void (*)(uint64_t))sub_2147F02BC);
}

uint64_t sub_2147F0D10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2147F1850(a1, a2, a3, (void (*)(uint64_t))sub_2147F02BC);
}

uint64_t sub_2147F0D1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2147F18A4(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BE29D60], SKEnvironmentValues.clock.setter);
}

uint64_t SKEnvironmentValues.clock.setter(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *, char *, uint64_t);
  uint64_t *boxed_opaque_existential_0;
  void (*v8)(char *, uint64_t);
  uint64_t v10[4];

  v2 = sub_214852428();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v6(v5, a1, v2);
  v10[3] = v2;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v10);
  v6((char *)boxed_opaque_existential_0, v5, v2);
  sub_2147F0978((uint64_t)v10, (uint64_t)&type metadata for ClockSKEnvironmentKey);
  v8 = *(void (**)(char *, uint64_t))(v3 + 8);
  v8(v5, v2);
  return ((uint64_t (*)(char *, uint64_t))v8)(a1, v2);
}

void (*SKEnvironmentValues.clock.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[8] = v1;
  v4 = sub_214852428();
  v3[9] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[10] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[11] = malloc(v6);
  v3[12] = malloc(v6);
  v7 = malloc(v6);
  v3[13] = v7;
  v8 = swift_bridgeObjectRetain();
  sub_2147F02BC(v8, (uint64_t)v7);
  swift_bridgeObjectRelease();
  return sub_2147F0E94;
}

void sub_2147F0E94(uint64_t **a1, char a2)
{
  uint64_t *v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *boxed_opaque_existential_0;
  void (*v11)(void *, uint64_t);
  uint64_t v12;
  uint64_t *v13;

  v3 = *a1;
  v4 = *(void (**)(uint64_t, uint64_t, uint64_t))((*a1)[10] + 16);
  v4((*a1)[12], v3[13], v3[9]);
  v6 = (void *)v3[12];
  v5 = (void *)v3[13];
  if ((a2 & 1) != 0)
  {
    v8 = v3[10];
    v7 = (void *)v3[11];
    v9 = v3[9];
    v4((uint64_t)v7, v3[12], v9);
    v3[3] = v9;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v3);
    v4((uint64_t)boxed_opaque_existential_0, (uint64_t)v7, v9);
    sub_2147F0978((uint64_t)v3, (uint64_t)&type metadata for ClockSKEnvironmentKey);
    v11 = *(void (**)(void *, uint64_t))(v8 + 8);
    v11(v7, v9);
  }
  else
  {
    v12 = v3[10];
    v7 = (void *)v3[11];
    v9 = v3[9];
    v3[7] = v9;
    v13 = __swift_allocate_boxed_opaque_existential_0(v3 + 4);
    v4((uint64_t)v13, (uint64_t)v6, v9);
    sub_2147F0978((uint64_t)(v3 + 4), (uint64_t)&type metadata for ClockSKEnvironmentKey);
    v11 = *(void (**)(void *, uint64_t))(v12 + 8);
  }
  v11(v6, v9);
  v11(v5, v9);
  free(v5);
  free(v6);
  free(v7);
  free(v3);
}

uint64_t sub_2147F0FB0()
{
  uint64_t result;

  sub_2147F2628();
  result = sub_2148528F0();
  qword_254D8A518 = result;
  return result;
}

id sub_2147F0FE0@<X0>(_QWORD *a1@<X8>)
{
  void *v2;

  if (qword_254D8A510 != -1)
    swift_once();
  v2 = (void *)qword_254D8A518;
  *a1 = qword_254D8A518;
  return v2;
}

uint64_t sub_2147F1030@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  id v3;
  uint64_t result;

  v2 = swift_bridgeObjectRetain();
  v3 = sub_2147F01EC(v2);
  result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t sub_2147F1074(void **a1)
{
  void *v1;
  id v2;
  _QWORD v4[4];

  v1 = *a1;
  v4[3] = sub_2147F2628();
  v4[0] = v1;
  v2 = v1;
  return sub_2147F0978((uint64_t)v4, (uint64_t)&type metadata for DispatchQueueSKEnvironmentKey);
}

uint64_t SKEnvironmentValues.dispatchQueue.setter(uint64_t a1)
{
  _QWORD v3[4];

  v3[3] = sub_2147F2628();
  v3[0] = a1;
  return sub_2147F0978((uint64_t)v3, (uint64_t)&type metadata for DispatchQueueSKEnvironmentKey);
}

void (*SKEnvironmentValues.dispatchQueue.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  id v4;

  a1[1] = v1;
  v3 = swift_bridgeObjectRetain();
  v4 = sub_2147F01EC(v3);
  swift_bridgeObjectRelease();
  *a1 = v4;
  return sub_2147F1158;
}

void sub_2147F1158(void **a1, char a2)
{
  void *v2;
  id v3;
  _QWORD v4[3];
  unint64_t v5;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v5 = sub_2147F2628();
    v4[0] = v2;
    v3 = v2;
    sub_2147F0978((uint64_t)v4, (uint64_t)&type metadata for DispatchQueueSKEnvironmentKey);

  }
  else
  {
    v5 = sub_2147F2628();
    v4[0] = v2;
    sub_2147F0978((uint64_t)v4, (uint64_t)&type metadata for DispatchQueueSKEnvironmentKey);
  }
}

void sub_2147F11D8(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

uint64_t SKEnvironmentValues.bluetoothMockID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = swift_bridgeObjectRetain();
  v1 = sub_2147F042C(v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_2147F1228@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v2 = swift_bridgeObjectRetain();
  v3 = sub_2147F042C(v2);
  v5 = v4;
  result = swift_bridgeObjectRelease();
  *a1 = v3;
  a1[1] = v5;
  return result;
}

uint64_t sub_2147F1270(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[4];

  v2 = *a1;
  v1 = a1[1];
  v4[3] = __swift_instantiateConcreteTypeFromMangledName(qword_254D88130);
  v4[0] = v2;
  v4[1] = v1;
  swift_bridgeObjectRetain();
  return sub_2147F0978((uint64_t)v4, (uint64_t)&type metadata for BluetoothMockIDSKEnvironmentKey);
}

uint64_t SKEnvironmentValues.bluetoothMockID.setter(uint64_t a1, uint64_t a2)
{
  _QWORD v5[4];

  v5[3] = __swift_instantiateConcreteTypeFromMangledName(qword_254D88130);
  v5[0] = a1;
  v5[1] = a2;
  return sub_2147F0978((uint64_t)v5, (uint64_t)&type metadata for BluetoothMockIDSKEnvironmentKey);
}

uint64_t (*SKEnvironmentValues.bluetoothMockID.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  a1[2] = v1;
  v3 = swift_bridgeObjectRetain();
  v4 = sub_2147F042C(v3);
  v6 = v5;
  swift_bridgeObjectRelease();
  *a1 = v4;
  a1[1] = v6;
  return sub_2147F1378;
}

uint64_t sub_2147F1378(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *a1;
  v2 = a1[1];
  if ((a2 & 1) != 0)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_254D88130);
    v5 = v3;
    v6 = v2;
    swift_bridgeObjectRetain();
    sub_2147F0978((uint64_t)&v5, (uint64_t)&type metadata for BluetoothMockIDSKEnvironmentKey);
    return swift_bridgeObjectRelease();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_254D88130);
    v5 = v3;
    v6 = v2;
    return sub_2147F0978((uint64_t)&v5, (uint64_t)&type metadata for BluetoothMockIDSKEnvironmentKey);
  }
}

uint64_t sub_2147F140C(uint64_t a1)
{
  return sub_2147F1784(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BE6D7A8], qword_254D8A528, MEMORY[0x24BE6D7A0]);
}

uint64_t sub_2147F1428@<X0>(uint64_t a1@<X8>)
{
  return sub_2147F144C(&qword_254D8A520, (uint64_t (*)(_QWORD))MEMORY[0x24BE6D7A8], (uint64_t)qword_254D8A528, a1);
}

uint64_t sub_2147F144C@<X0>(_QWORD *a1@<X2>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;

  if (*a1 != -1)
    swift_once();
  v7 = a2(0);
  v8 = __swift_project_value_buffer(v7, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a4, v8, v7);
}

uint64_t SKEnvironmentValues.nexusEnvironment.getter()
{
  return sub_2147F1804((void (*)(uint64_t))sub_2147F04C8);
}

uint64_t sub_2147F14C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2147F1850(a1, a2, a3, (void (*)(uint64_t))sub_2147F04C8);
}

uint64_t sub_2147F14D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2147F18A4(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BE6D7A8], SKEnvironmentValues.nexusEnvironment.setter);
}

uint64_t SKEnvironmentValues.nexusEnvironment.setter(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *, char *, uint64_t);
  uint64_t *boxed_opaque_existential_0;
  void (*v8)(char *, uint64_t);
  uint64_t v10[4];

  v2 = sub_21485250C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v6(v5, a1, v2);
  v10[3] = v2;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v10);
  v6((char *)boxed_opaque_existential_0, v5, v2);
  sub_2147F0978((uint64_t)v10, (uint64_t)&type metadata for NexusEnvironmentSKEnvironmentKey);
  v8 = *(void (**)(char *, uint64_t))(v3 + 8);
  v8(v5, v2);
  return ((uint64_t (*)(char *, uint64_t))v8)(a1, v2);
}

void (*SKEnvironmentValues.nexusEnvironment.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[8] = v1;
  v4 = sub_21485250C();
  v3[9] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[10] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[11] = malloc(v6);
  v3[12] = malloc(v6);
  v7 = malloc(v6);
  v3[13] = v7;
  v8 = swift_bridgeObjectRetain();
  sub_2147F04C8(v8, (uint64_t)v7);
  swift_bridgeObjectRelease();
  return sub_2147F164C;
}

void sub_2147F164C(uint64_t **a1, char a2)
{
  uint64_t *v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *boxed_opaque_existential_0;
  void (*v11)(void *, uint64_t);
  uint64_t v12;
  uint64_t *v13;

  v3 = *a1;
  v4 = *(void (**)(uint64_t, uint64_t, uint64_t))((*a1)[10] + 16);
  v4((*a1)[12], v3[13], v3[9]);
  v6 = (void *)v3[12];
  v5 = (void *)v3[13];
  if ((a2 & 1) != 0)
  {
    v8 = v3[10];
    v7 = (void *)v3[11];
    v9 = v3[9];
    v4((uint64_t)v7, v3[12], v9);
    v3[3] = v9;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v3);
    v4((uint64_t)boxed_opaque_existential_0, (uint64_t)v7, v9);
    sub_2147F0978((uint64_t)v3, (uint64_t)&type metadata for NexusEnvironmentSKEnvironmentKey);
    v11 = *(void (**)(void *, uint64_t))(v8 + 8);
    v11(v7, v9);
  }
  else
  {
    v12 = v3[10];
    v7 = (void *)v3[11];
    v9 = v3[9];
    v3[7] = v9;
    v13 = __swift_allocate_boxed_opaque_existential_0(v3 + 4);
    v4((uint64_t)v13, (uint64_t)v6, v9);
    sub_2147F0978((uint64_t)(v3 + 4), (uint64_t)&type metadata for NexusEnvironmentSKEnvironmentKey);
    v11 = *(void (**)(void *, uint64_t))(v12 + 8);
  }
  v11(v6, v9);
  v11(v5, v9);
  free(v5);
  free(v6);
  free(v7);
  free(v3);
}

uint64_t sub_2147F1768(uint64_t a1)
{
  return sub_2147F1784(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BE6DB80], qword_254D8A548, MEMORY[0x24BE6DB78]);
}

uint64_t sub_2147F1784(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;

  v6 = a2(0);
  __swift_allocate_value_buffer(v6, a3);
  __swift_project_value_buffer(v6, (uint64_t)a3);
  return a4();
}

uint64_t sub_2147F17D4@<X0>(uint64_t a1@<X8>)
{
  return sub_2147F144C(&qword_254D8A540, (uint64_t (*)(_QWORD))MEMORY[0x24BE6DB80], (uint64_t)qword_254D8A548, a1);
}

uint64_t SKEnvironmentValues.nexusSessionConfiguration.getter()
{
  return sub_2147F1804((void (*)(uint64_t))sub_2147F0638);
}

uint64_t sub_2147F1804(void (*a1)(uint64_t))
{
  uint64_t v2;

  v2 = swift_bridgeObjectRetain();
  a1(v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2147F1844(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2147F1850(a1, a2, a3, (void (*)(uint64_t))sub_2147F0638);
}

uint64_t sub_2147F1850(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5;

  v5 = swift_bridgeObjectRetain();
  a4(v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2147F1890(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2147F18A4(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BE6DB80], SKEnvironmentValues.nexusSessionConfiguration.setter);
}

uint64_t sub_2147F18A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t (*a6)(char *))
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  a5(0);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t SKEnvironmentValues.nexusSessionConfiguration.setter(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *, char *, uint64_t);
  uint64_t *boxed_opaque_existential_0;
  void (*v8)(char *, uint64_t);
  uint64_t v10[4];

  v2 = sub_214852584();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v6(v5, a1, v2);
  v10[3] = v2;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v10);
  v6((char *)boxed_opaque_existential_0, v5, v2);
  sub_2147F0978((uint64_t)v10, (uint64_t)&type metadata for NexusSessionConfigurationSKEnvironmentKey);
  v8 = *(void (**)(char *, uint64_t))(v3 + 8);
  v8(v5, v2);
  return ((uint64_t (*)(char *, uint64_t))v8)(a1, v2);
}

void (*SKEnvironmentValues.nexusSessionConfiguration.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[8] = v1;
  v4 = sub_214852584();
  v3[9] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[10] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[11] = malloc(v6);
  v3[12] = malloc(v6);
  v7 = malloc(v6);
  v3[13] = v7;
  v8 = swift_bridgeObjectRetain();
  sub_2147F0638(v8, (uint64_t)v7);
  swift_bridgeObjectRelease();
  return sub_2147F1A84;
}

void sub_2147F1A84(uint64_t **a1, char a2)
{
  uint64_t *v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *boxed_opaque_existential_0;
  void (*v11)(void *, uint64_t);
  uint64_t v12;
  uint64_t *v13;

  v3 = *a1;
  v4 = *(void (**)(uint64_t, uint64_t, uint64_t))((*a1)[10] + 16);
  v4((*a1)[12], v3[13], v3[9]);
  v6 = (void *)v3[12];
  v5 = (void *)v3[13];
  if ((a2 & 1) != 0)
  {
    v8 = v3[10];
    v7 = (void *)v3[11];
    v9 = v3[9];
    v4((uint64_t)v7, v3[12], v9);
    v3[3] = v9;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v3);
    v4((uint64_t)boxed_opaque_existential_0, (uint64_t)v7, v9);
    sub_2147F0978((uint64_t)v3, (uint64_t)&type metadata for NexusSessionConfigurationSKEnvironmentKey);
    v11 = *(void (**)(void *, uint64_t))(v8 + 8);
    v11(v7, v9);
  }
  else
  {
    v12 = v3[10];
    v7 = (void *)v3[11];
    v9 = v3[9];
    v3[7] = v9;
    v13 = __swift_allocate_boxed_opaque_existential_0(v3 + 4);
    v4((uint64_t)v13, (uint64_t)v6, v9);
    sub_2147F0978((uint64_t)(v3 + 4), (uint64_t)&type metadata for NexusSessionConfigurationSKEnvironmentKey);
    v11 = *(void (**)(void *, uint64_t))(v12 + 8);
  }
  v11(v6, v9);
  v11(v5, v9);
  free(v5);
  free(v6);
  free(v7);
  free(v3);
}

unint64_t sub_2147F1BA0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_214852B78();
  return sub_2147F1BD0(a1, v2);
}

unint64_t sub_2147F1BD0(uint64_t a1, uint64_t a2)
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

uint64_t sub_2147F1C6C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  _OWORD *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  _OWORD v32[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D881C0);
  result = sub_214852A10();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v31 = v3;
    v8 = 0;
    v9 = (_QWORD *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v17 = v16 | (v8 << 6);
      }
      else
      {
        v18 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        if (v18 >= v13)
          goto LABEL_34;
        v19 = v9[v18];
        ++v8;
        if (!v19)
        {
          v8 = v18 + 1;
          if (v18 + 1 >= v13)
            goto LABEL_34;
          v19 = v9[v8];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v13)
            {
LABEL_34:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v31;
                goto LABEL_41;
              }
              v30 = 1 << *(_BYTE *)(v5 + 32);
              if (v30 >= 64)
                bzero((void *)(v5 + 64), ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v9 = -1 << v30;
              v3 = v31;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v19 = v9[v20];
            if (!v19)
            {
              while (1)
              {
                v8 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_43;
                if (v8 >= v13)
                  goto LABEL_34;
                v19 = v9[v8];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v8 = v20;
          }
        }
LABEL_21:
        v12 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v17);
      v22 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
        sub_2147F272C(v22, v32);
      else
        sub_2147F2530((uint64_t)v22, (uint64_t)v32);
      result = sub_214852B78();
      v23 = -1 << *(_BYTE *)(v7 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v14 + 8 * (v24 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          v28 = v25 == v27;
          if (v25 == v27)
            v25 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v14 + 8 * v25);
        }
        while (v29 == -1);
        v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(_QWORD *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v15) = v21;
      result = (uint64_t)sub_2147F272C(v32, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v15));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_41:
  *v3 = v7;
  return result;
}

unint64_t sub_2147F1F2C(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  _QWORD *v15;
  uint64_t v16;
  _OWORD *v17;
  _OWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_21485295C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v10 = *(_QWORD *)(a2 + 48);
        v11 = (_QWORD *)(v10 + 8 * v6);
        result = sub_214852B78();
        v12 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 >= v8 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            v15 = (_QWORD *)(v10 + 8 * v3);
            if (v3 != v6 || v15 >= v11 + 1)
              *v15 = *v11;
            v16 = *(_QWORD *)(a2 + 56);
            v17 = (_OWORD *)(v16 + 32 * v3);
            v18 = (_OWORD *)(v16 + 32 * v6);
            if (v3 != v6 || (v3 = v6, v17 >= v18 + 2))
            {
              v9 = v18[1];
              *v17 = *v18;
              v17[1] = v9;
              v3 = v6;
            }
          }
        }
        else if (v12 >= v8 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_2147F20C0(_OWORD *a1, uint64_t a2, char a3)
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
  _OWORD *v17;
  _OWORD *result;
  unint64_t v19;
  char v20;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_2147F1BA0(a2);
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
      {
LABEL_8:
        v17 = (_OWORD *)(v16[7] + 32 * v10);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
        return sub_2147F272C(a1, v17);
      }
      return sub_2147F21D8(v10, a2, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_2147F223C();
      goto LABEL_7;
    }
    sub_2147F1C6C(v13, a3 & 1);
    v19 = sub_2147F1BA0(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
      return sub_2147F21D8(v10, a2, a1, v16);
    }
  }
  result = (_OWORD *)sub_214852B48();
  __break(1u);
  return result;
}

_OWORD *sub_2147F21D8(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  _OWORD *result;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  result = sub_2147F272C(a3, (_OWORD *)(a4[7] + 32 * a1));
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

void *sub_2147F223C()
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
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  _OWORD v22[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D881C0);
  v2 = *v0;
  v3 = sub_214852A04();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
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
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v13)
        goto LABEL_26;
      v20 = *(_QWORD *)(v6 + 8 * v9);
      if (!v20)
        break;
    }
LABEL_25:
    v12 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 32 * v15;
    sub_2147F2530(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = sub_2147F272C(v22, (_OWORD *)(*(_QWORD *)(v4 + 56) + v18));
  }
  v21 = v19 + 2;
  if (v21 >= v13)
    goto LABEL_26;
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_2147F23FC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t i;
  uint64_t v5;
  unint64_t result;
  char v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D881C0);
    v3 = (_QWORD *)sub_214852A1C();
    for (i = a1 + 32; ; i += 40)
    {
      sub_2147F2798(i, (uint64_t)&v11);
      v5 = v11;
      result = sub_2147F1BA0(v11);
      if ((v7 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_QWORD *)(v3[6] + 8 * result) = v5;
      result = (unint64_t)sub_2147F272C(&v12, (_OWORD *)(v3[7] + 32 * result));
      v8 = v3[2];
      v9 = __OFADD__(v8, 1);
      v10 = v8 + 1;
      if (v9)
        goto LABEL_10;
      v3[2] = v10;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B00];
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199D7528]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2147F2530(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2147F256C(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v7[4];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7[3] = AssociatedTypeWitness;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v7);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(boxed_opaque_existential_0, a1, AssociatedTypeWitness);
  return sub_2147F0978((uint64_t)v7, a2);
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_2147F2628()
{
  unint64_t result;

  result = qword_254D88128;
  if (!qword_254D88128)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254D88128);
  }
  return result;
}

uint64_t dispatch thunk of static SKEnvironmentKey.defaultValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

ValueMetadata *type metadata accessor for SKEnvironmentValues()
{
  return &type metadata for SKEnvironmentValues;
}

uint64_t dispatch thunk of SKEnvironmental.environment.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

ValueMetadata *type metadata accessor for NexusSessionConfigurationSKEnvironmentKey()
{
  return &type metadata for NexusSessionConfigurationSKEnvironmentKey;
}

ValueMetadata *type metadata accessor for NexusEnvironmentSKEnvironmentKey()
{
  return &type metadata for NexusEnvironmentSKEnvironmentKey;
}

ValueMetadata *type metadata accessor for BluetoothMockIDSKEnvironmentKey()
{
  return &type metadata for BluetoothMockIDSKEnvironmentKey;
}

ValueMetadata *type metadata accessor for DispatchQueueSKEnvironmentKey()
{
  return &type metadata for DispatchQueueSKEnvironmentKey;
}

ValueMetadata *type metadata accessor for ClockSKEnvironmentKey()
{
  return &type metadata for ClockSKEnvironmentKey;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
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

_OWORD *sub_2147F272C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
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

uint64_t sub_2147F275C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2147F2798(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D881D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2147F27E0()
{
  uint64_t v0;

  v0 = sub_214852494();
  __swift_allocate_value_buffer(v0, qword_254D8A568);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D8A568);
  sub_214801FC0();
  swift_bridgeObjectRetain();
  return sub_214852488();
}

uint64_t SKStepAppleAccountSetupClient.environment.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t SKStepAppleAccountSetupClient.__allocating_init(client:environment:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = swift_allocObject();
  v4 = *a2;
  swift_weakInit();
  swift_weakAssign();
  swift_release();
  *(_QWORD *)(v3 + 24) = v4;
  return v3;
}

uint64_t SKStepAppleAccountSetupClient.init(client:environment:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *a2;
  swift_weakInit();
  swift_weakAssign();
  swift_release();
  *(_QWORD *)(v2 + 24) = v3;
  return v2;
}

uint64_t SKStepAppleAccountSetupClient.perform(configuration:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v3 + 352) = a1;
  *(_QWORD *)(v3 + 360) = v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D881E0);
  *(_QWORD *)(v3 + 368) = v5;
  *(_QWORD *)(v3 + 376) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v3 + 384) = swift_task_alloc();
  v6 = sub_214852524();
  *(_QWORD *)(v3 + 392) = v6;
  *(_QWORD *)(v3 + 400) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v3 + 408) = swift_task_alloc();
  v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 416) = *(_OWORD *)a2;
  *(_OWORD *)(v3 + 432) = v7;
  *(_QWORD *)(v3 + 448) = *(_QWORD *)(a2 + 32);
  sub_2147F4354(&qword_254D881E8, v8, (uint64_t (*)(uint64_t))type metadata accessor for SKStepAppleAccountSetupClient, (uint64_t)&protocol conformance descriptor for SKStepAppleAccountSetupClient);
  *(_QWORD *)(v3 + 456) = sub_2148527C4();
  *(_QWORD *)(v3 + 464) = v9;
  return swift_task_switch();
}

uint64_t sub_2147F29FC()
{
  uint64_t v0;
  uint64_t Strong;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31[6];

  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 472) = Strong;
  if (Strong)
  {
    if (qword_254D8A560 != -1)
      swift_once();
    v2 = *(_QWORD *)(v0 + 432);
    v3 = sub_214852494();
    *(_QWORD *)(v0 + 480) = __swift_project_value_buffer(v3, (uint64_t)qword_254D8A568);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2147F3B60(v2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2147F3B60(v2);
    v4 = sub_21485247C();
    v5 = sub_2148528D8();
    v6 = os_log_type_enabled(v4, v5);
    v8 = *(_QWORD *)(v0 + 440);
    v7 = *(_QWORD *)(v0 + 448);
    v10 = *(_QWORD *)(v0 + 424);
    v9 = *(_QWORD *)(v0 + 432);
    v11 = *(_QWORD *)(v0 + 416);
    if (v6)
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      v31[0] = v26;
      *(_DWORD *)v12 = 136315138;
      *(_QWORD *)(v0 + 184) = v11;
      *(_QWORD *)(v0 + 192) = v10;
      *(_QWORD *)(v0 + 200) = v9;
      *(_QWORD *)(v0 + 208) = v8;
      *(_QWORD *)(v0 + 216) = v7;
      sub_2147F4428();
      v13 = sub_214852B00();
      *(_QWORD *)(v0 + 344) = sub_2147F3D14(v13, v14, v31);
      sub_21485292C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2147F3B90(v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2147F3B90(v9);
      _os_log_impl(&dword_2147EE000, v4, v5, "AppleAccountSetup prepare start: configuration=%s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199D75E8](v26, -1, -1);
      MEMORY[0x2199D75E8](v12, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2147F3B90(v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2147F3B90(v9);
    }

    v16 = *(_QWORD *)(v0 + 440);
    v17 = *(_QWORD *)(v0 + 448);
    v19 = *(_QWORD *)(v0 + 424);
    v18 = *(_QWORD *)(v0 + 432);
    v31[0] = *(_QWORD *)(v0 + 416);
    v31[1] = v19;
    v31[2] = v18;
    v31[3] = v16;
    v31[4] = v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2147F3B60(v18);
    sub_2148246BC((uint64_t)v31, (uint64_t)v27);
    v20 = v27[0];
    v21 = v27[1];
    *(_QWORD *)(v0 + 488) = v27[0];
    *(_QWORD *)(v0 + 496) = v21;
    v22 = v28;
    v23 = v29;
    *(_QWORD *)(v0 + 504) = v28;
    *(_QWORD *)(v0 + 512) = v23;
    v24 = v30;
    *(_QWORD *)(v0 + 520) = v30;
    *(_QWORD *)(v0 + 144) = v20;
    *(_QWORD *)(v0 + 152) = v21;
    *(_QWORD *)(v0 + 160) = v22;
    *(_QWORD *)(v0 + 168) = v23;
    *(_QWORD *)(v0 + 176) = v24;
    v25 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 528) = v25;
    sub_2147F3BBC();
    *v25 = v0;
    v25[1] = sub_2147F2DCC;
    return sub_2148525C0();
  }
  else
  {
    LOBYTE(v31[0]) = 2;
    type metadata accessor for SKError();
    SKError.__allocating_init(_:_:_:)((uint64_t)v31, 0x696C434B53206F4ELL, 0xEB00000000746E65, 0);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2147F2DCC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 536) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v3 = v2[63];
    (*(void (**)(_QWORD, _QWORD))(v2[50] + 8))(v2[51], v2[49]);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2147F3B90(v3);
  }
  return swift_task_switch();
}

uint64_t sub_2147F2E7C()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  NSObject *v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];

  v1 = sub_21485247C();
  v2 = sub_2148528D8();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2147EE000, v1, v2, "AppleAccountSetup prepare success", v3, 2u);
    MEMORY[0x2199D75E8](v3, -1, -1);
  }
  v4 = *(_QWORD *)(v0 + 432);

  if (v4)
  {
    v5 = *(_QWORD *)(v0 + 432);
    sub_2147F3B60(v5);
    swift_release();
    v6 = *(_QWORD *)(v0 + 352);
    v7 = *(_OWORD *)(v0 + 440);
    *(_QWORD *)v6 = v5;
    *(_OWORD *)(v6 + 8) = v7;
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v9 = sub_21485247C();
    v10 = sub_2148528D8();
    if (os_log_type_enabled(v9, (os_log_type_t)v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_2147EE000, v9, (os_log_type_t)v10, "AppleAccountSetup perform start", v11, 2u);
      MEMORY[0x2199D75E8](v11, -1, -1);
    }
    v12 = *(_QWORD *)(v0 + 472);
    v14 = *(_QWORD *)(v0 + 440);
    v13 = *(_QWORD *)(v0 + 448);
    v16 = *(_QWORD *)(v0 + 416);
    v15 = *(_QWORD *)(v0 + 424);

    sub_2147F4394(0, &qword_254D881F8);
    v17[0] = v16;
    v17[1] = v15;
    v17[2] = 0;
    v17[3] = v14;
    v17[4] = v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2147F3B60(0);
    *(_QWORD *)(v0 + 544) = sub_214822174((uint64_t)v17);
    *(_QWORD *)(v0 + 552) = *(_QWORD *)(v12 + 56);
    sub_21485262C();
    sub_2147F4354(&qword_254D88200, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC80], MEMORY[0x24BE6DC90]);
    swift_retain();
    sub_2148527C4();
    return swift_task_switch();
  }
}

uint64_t sub_2147F30CC()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = v0[67];
  v0[70] = sub_2148525A8();
  v0[71] = v1;
  return swift_task_switch();
}

uint64_t sub_2147F3128()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v11;

  v1 = (void *)v0[70];
  v2 = (void *)v0[68];
  v4 = v0[47];
  v3 = v0[48];
  v6 = v0[45];
  v5 = v0[46];
  swift_release();
  objc_msgSend(v2, sel_setMessageSessionTemplate_, v1);

  objc_msgSend(v2, sel_setLocalRole_, 1);
  objc_msgSend(v2, sel_setRemoteRole_, 3);
  v11 = *(_QWORD *)(v6 + 24);
  v7 = SKEnvironmentValues.dispatchQueue.getter();
  v8 = objc_msgSend(objc_allocWithZone((Class)SKAISSetupController), sel_initWithQueue_, v7, v11);
  v0[72] = v8;

  v0[7] = v0 + 37;
  v0[2] = v0;
  v0[3] = sub_2147F32F4;
  swift_continuation_init();
  v0[17] = v5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v0 + 14);
  sub_2147F4394(0, (unint64_t *)&qword_254D88208);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88210);
  sub_2148527D0();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v4 + 32))(boxed_opaque_existential_0, v3, v5);
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 1107296256;
  v0[12] = sub_2147F3C00;
  v0[13] = &block_descriptor;
  objc_msgSend(v8, sel_setupWithContext_completionHandler_, v2, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_2147F32F4()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 584) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2147F3350()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint8_t *v11;
  void *v12;
  void *v13;
  uint64_t *v14;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19[3];

  v1 = *(id *)(v0 + 296);
  SKStepAppleAccountSetupReport.init(aisReport:)(v1, v19);
  v2 = v19[0];
  v3 = v19[1];
  v4 = v19[2];
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v5 = sub_21485247C();
  v6 = sub_2148528D8();
  if (os_log_type_enabled(v5, v6))
  {
    v16 = *(void **)(v0 + 576);
    v17 = *(void **)(v0 + 544);
    v18 = v3;
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    *(_DWORD *)v7 = 136315138;
    v19[0] = v8;
    *(_QWORD *)(v0 + 272) = v2;
    *(_QWORD *)(v0 + 280) = v18;
    *(_QWORD *)(v0 + 288) = v4;
    sub_2147F43E4();
    v9 = sub_214852B00();
    *(_QWORD *)(v0 + 328) = sub_2147F3D14(v9, v10, v19);
    sub_21485292C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2147EE000, v5, v6, "AppleAccountSetup perform success: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v8, -1, -1);
    v11 = v7;
    v3 = v18;
    MEMORY[0x2199D75E8](v11, -1, -1);

    swift_release();
  }
  else
  {
    v12 = *(void **)(v0 + 576);
    v13 = *(void **)(v0 + 544);
    swift_release();

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

  }
  v14 = *(uint64_t **)(v0 + 352);
  *v14 = v2;
  v14[1] = v3;
  v14[2] = v4;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2147F359C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v14;

  v1 = *(void **)(v0 + 536);
  v2 = *(_QWORD *)(v0 + 504);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2147F3B90(v2);
  v3 = v1;
  v4 = v1;
  v5 = sub_21485247C();
  v6 = sub_2148528CC();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(void **)(v0 + 536);
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v14 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_getErrorValue();
    v10 = sub_214852B6C();
    *(_QWORD *)(v0 + 320) = sub_2147F3D14(v10, v11, &v14);
    sub_21485292C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2147EE000, v5, v6, "### AppleAccountSetup prepare failed: error=%s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v9, -1, -1);
    MEMORY[0x2199D75E8](v8, -1, -1);
  }
  else
  {
    v12 = *(void **)(v0 + 536);

  }
  swift_willThrow();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2147F3790()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;

  v1 = *(void **)(v0 + 544);
  swift_release();

  v2 = *(void **)(v0 + 568);
  v3 = v2;
  v4 = v2;
  v5 = sub_21485247C();
  v6 = sub_2148528CC();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v12 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_getErrorValue();
    v9 = sub_214852B6C();
    *(_QWORD *)(v0 + 304) = sub_2147F3D14(v9, v10, &v12);
    sub_21485292C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2147EE000, v5, v6, "### AppleAccountSetup perform failed: error=%s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v8, -1, -1);
    MEMORY[0x2199D75E8](v7, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2147F3964()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;

  v1 = *(void **)(v0 + 576);
  v2 = *(void **)(v0 + 544);
  swift_willThrow();

  v3 = *(void **)(v0 + 584);
  v4 = v3;
  v5 = v3;
  v6 = sub_21485247C();
  v7 = sub_2148528CC();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v13 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_getErrorValue();
    v10 = sub_214852B6C();
    *(_QWORD *)(v0 + 304) = sub_2147F3D14(v10, v11, &v13);
    sub_21485292C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2147EE000, v6, v7, "### AppleAccountSetup perform failed: error=%s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v9, -1, -1);
    MEMORY[0x2199D75E8](v8, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for SKStepAppleAccountSetupClient()
{
  return objc_opt_self();
}

uint64_t sub_2147F3B60(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_2147F3B90(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_2147F3BBC()
{
  unint64_t result;

  result = qword_254D881F0;
  if (!qword_254D881F0)
  {
    result = MEMORY[0x2199D7540](&unk_214859648, &type metadata for SKStepAppleAccountSetupPrepareRequestMessage);
    atomic_store(result, (unint64_t *)&qword_254D881F0);
  }
  return result;
}

void sub_2147F3C00(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  __swift_project_boxed_opaque_existential_0((_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  if (a3)
  {
    v5 = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D881E0);
    sub_2148527DC();

  }
  else if (a2)
  {
    v6 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D881E0);
    sub_2148527E8();
  }
  else
  {
    __break(1u);
  }
}

uint64_t SKStepAppleAccountSetupClient.deinit()
{
  uint64_t v0;

  swift_weakDestroy();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SKStepAppleAccountSetupClient.__deallocating_deinit()
{
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_2147F3CF0()
{
  uint64_t *v0;

  return SKEnvironmental<>.unownedExecutor.getter(*v0, (uint64_t)&protocol witness table for SKStepAppleAccountSetupClient);
}

uint64_t sub_2147F3D04@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(*(_QWORD *)v1 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2147F3D14(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2147F3DE4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2147F2530((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_2147F2530((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2147F3DE4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_214852938();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2147F3F9C(a5, a6);
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
  v8 = sub_2148529B0();
  if (!v8)
  {
    sub_2148529E0();
    __break(1u);
LABEL_17:
    result = sub_214852A28();
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

uint64_t sub_2147F3F9C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2147F4030(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2147F4208(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2147F4208(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2147F4030(uint64_t a1, unint64_t a2)
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
      v3 = sub_2147F41A4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_214852998();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2148529E0();
      __break(1u);
LABEL_10:
      v2 = sub_21485271C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_214852A28();
    __break(1u);
LABEL_14:
    result = sub_2148529E0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2147F41A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D882D0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2147F4208(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D882D0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
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
  result = sub_214852A28();
  __break(1u);
  return result;
}

uint64_t sub_2147F4354(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x2199D7540](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2147F4394(uint64_t a1, unint64_t *a2)
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

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  return sub_2147F2530(a2 + 32, a1 + 32);
}

uint64_t block_destroy_helper(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_0(a1 + 32);
}

unint64_t sub_2147F43E4()
{
  unint64_t result;

  result = qword_254D88218;
  if (!qword_254D88218)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepAppleAccountSetupReport, &type metadata for SKStepAppleAccountSetupReport);
    atomic_store(result, (unint64_t *)&qword_254D88218);
  }
  return result;
}

unint64_t sub_2147F4428()
{
  unint64_t result;

  result = qword_254D88220;
  if (!qword_254D88220)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepAppleAccountSetupConfiguration, &type metadata for SKStepAppleAccountSetupConfiguration);
    atomic_store(result, (unint64_t *)&qword_254D88220);
  }
  return result;
}

uint64_t method lookup function for SKStepAppleAccountSetupClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SKStepAppleAccountSetupClient.__allocating_init(client:environment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t SKStepPhotoPickerStartConfiguration.configurationIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SKStepPhotoPickerStartConfiguration.configurationIdentifier.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*SKStepPhotoPickerStartConfiguration.configurationIdentifier.modify())()
{
  return nullsub_1;
}

SetupKit::SKStepPhotoPickerStartConfiguration __swiftcall SKStepPhotoPickerStartConfiguration.init()()
{
  _QWORD *v0;
  SetupKit::SKStepPhotoPickerStartConfiguration result;

  *v0 = 0;
  v0[1] = 0;
  return result;
}

uint64_t SKStepPhotoPickerStartConfiguration.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v0 = sub_2148523F8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = 0;
  v8 = 0xE000000000000000;
  sub_2148523EC();
  v5 = 0;
  v6 = 0xE000000000000000;
  sub_21485298C();
  swift_bridgeObjectRelease();
  v5 = 0xD000000000000018;
  v6 = 0x800000021485CEF0;
  swift_bridgeObjectRetain();
  sub_214852704();
  swift_bridgeObjectRelease();
  sub_2148526D4();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v7;
}

uint64_t static SKStepPhotoPickerStartConfiguration.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;

  v3 = a1[1];
  v4 = a2[1];
  if (v3)
  {
    if (v4)
    {
      v5 = *a1 == *a2 && v3 == v4;
      if (v5 || (sub_214852B18() & 1) != 0)
        return 1;
    }
  }
  else if (!v4)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_2147F4698()
{
  return 1;
}

uint64_t sub_2147F46A4()
{
  return sub_214852B90();
}

unint64_t sub_2147F46CC()
{
  return 0xD000000000000017;
}

uint64_t sub_2147F46E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result;

  result = sub_2147F750C(a1, a2);
  *a3 = result != 0;
  return result;
}

uint64_t sub_2147F4714()
{
  return 0;
}

void sub_2147F4720(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2147F472C()
{
  sub_2147F4868();
  return sub_214852BD8();
}

uint64_t sub_2147F4754()
{
  sub_2147F4868();
  return sub_214852BE4();
}

uint64_t SKStepPhotoPickerStartConfiguration.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D882D8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2147F4868();
  sub_214852BB4();
  sub_214852A94();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_2147F4868()
{
  unint64_t result;

  result = qword_254D8A600;
  if (!qword_254D8A600)
  {
    result = MEMORY[0x2199D7540](&unk_21485773C, &type metadata for SKStepPhotoPickerStartConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8A600);
  }
  return result;
}

uint64_t SKStepPhotoPickerStartConfiguration.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D882E0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2147F4868();
  sub_214852BA8();
  if (!v2)
  {
    v9 = sub_214852A40();
    v11 = v10;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_2147F49C8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return SKStepPhotoPickerStartConfiguration.init(from:)(a1, a2);
}

uint64_t sub_2147F49DC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D882D8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2147F4868();
  sub_214852BB4();
  sub_214852A94();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_2147F4ACC(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;

  v3 = a1[1];
  v4 = a2[1];
  if (v3)
  {
    if (v4)
    {
      v5 = *a1 == *a2 && v3 == v4;
      if (v5 || (sub_214852B18() & 1) != 0)
        return 1;
    }
  }
  else if (!v4)
  {
    return 1;
  }
  return 0;
}

void *sub_2147F4B24()
{
  return &unk_24D226F70;
}

uint64_t sub_2147F4B30()
{
  return 0x72756769666E6F63;
}

uint64_t sub_2147F4B58()
{
  sub_2147F4CA8();
  return sub_214852BD8();
}

uint64_t sub_2147F4B80()
{
  sub_2147F4CA8();
  return sub_214852BE4();
}

uint64_t sub_2147F4BA8(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D882E8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2147F4CA8();
  sub_214852BB4();
  v10[0] = v8;
  v10[1] = v7;
  sub_2147F4CEC();
  sub_214852AD0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_2147F4CA8()
{
  unint64_t result;

  result = qword_254D8A608;
  if (!qword_254D8A608)
  {
    result = MEMORY[0x2199D7540](&unk_2148576EC, &type metadata for SKStepPhotoPickerStartRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8A608);
  }
  return result;
}

unint64_t sub_2147F4CEC()
{
  unint64_t result;

  result = qword_254D882F0;
  if (!qword_254D882F0)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepPhotoPickerStartConfiguration, &type metadata for SKStepPhotoPickerStartConfiguration);
    atomic_store(result, (unint64_t *)&qword_254D882F0);
  }
  return result;
}

__n128 sub_2147F4D30@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_2147F4D3C@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v10;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D882F8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2147F4CA8();
  sub_214852BA8();
  if (!v2)
  {
    sub_2147F4E5C();
    sub_214852A7C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

unint64_t sub_2147F4E5C()
{
  unint64_t result;

  result = qword_254D88300;
  if (!qword_254D88300)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepPhotoPickerStartConfiguration, &type metadata for SKStepPhotoPickerStartConfiguration);
    atomic_store(result, (unint64_t *)&qword_254D88300);
  }
  return result;
}

unint64_t sub_2147F4EA0()
{
  return 0xD000000000000012;
}

uint64_t sub_2147F4EC4()
{
  return sub_2148524AC();
}

uint64_t sub_2147F4ED8()
{
  return sub_2148524B8();
}

uint64_t sub_2147F4EEC@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_2147F4D3C(a1, a2);
}

uint64_t sub_2147F4F00(_QWORD *a1)
{
  return sub_2147F4BA8(a1);
}

uint64_t sub_2147F4F14()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t sub_2147F4F44()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2147F4FF0;
  return sub_214852500();
}

uint64_t sub_2147F4FF0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t SKStepPhotoPickerFileInfo.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_214852368();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t SKStepPhotoPickerFileInfo.description.getter()
{
  sub_214852368();
  sub_2147F9F94(&qword_254D88308, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
  sub_214852B00();
  sub_214852704();
  swift_bridgeObjectRelease();
  return 1030517365;
}

uint64_t sub_2147F50F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_214852368();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
}

uint64_t sub_2147F512C()
{
  sub_214852704();
  sub_214852368();
  sub_2147F9F94(&qword_254D88308, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
  sub_214852B00();
  sub_214852704();
  swift_bridgeObjectRelease();
  sub_214852704();
  return 0;
}

void *sub_2147F51D8()
{
  return &unk_24D226F80;
}

uint64_t sub_2147F51E4(uint64_t a1, unint64_t a2)
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

uint64_t sub_2147F5230()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2147F5260 + 4 * byte_214856860[*v0]))(0x61746144656C6966, 0xE800000000000000);
}

uint64_t sub_2147F5260()
{
  return 0x656D616E656C6966;
}

uint64_t sub_2147F5274()
{
  return 0x7366664F656C6966;
}

uint64_t sub_2147F5290()
{
  return 0x657A6953656C6966;
}

uint64_t sub_2147F52A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2147F7590(a1, a2);
  *a3 = result;
  return result;
}

void sub_2147F52C8(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_2147F52D4()
{
  sub_2147F54A0();
  return sub_214852BD8();
}

uint64_t sub_2147F52FC()
{
  sub_2147F54A0();
  return sub_214852BE4();
}

uint64_t sub_2147F5324(_QWORD *a1)
{
  __int128 *v1;
  uint64_t v2;
  __int128 *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];
  __int128 v11;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88310);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2147F54A0();
  sub_214852BB4();
  v11 = *v3;
  v10[15] = 0;
  sub_2147F54E4();
  sub_214852AD0();
  if (!v2)
  {
    LOBYTE(v11) = 1;
    sub_214852AC4();
    LOBYTE(v11) = 2;
    sub_214852ADC();
    LOBYTE(v11) = 3;
    sub_214852ADC();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_2147F54A0()
{
  unint64_t result;

  result = qword_254D8A610;
  if (!qword_254D8A610)
  {
    result = MEMORY[0x2199D7540](&unk_21485769C, &type metadata for SKStepPhotoPickerTransferFileRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8A610);
  }
  return result;
}

unint64_t sub_2147F54E4()
{
  unint64_t result;

  result = qword_254D88318;
  if (!qword_254D88318)
  {
    result = MEMORY[0x2199D7540](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_254D88318);
  }
  return result;
}

uint64_t sub_2147F5528@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[5] = a6;
  return result;
}

unint64_t sub_2147F5538()
{
  return 0xD000000000000019;
}

double sub_2147F5554@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;

  sub_2147F7754(a1, (uint64_t *)v6);
  if (!v2)
  {
    v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_2147F5594(_QWORD *a1)
{
  return sub_2147F5324(a1);
}

void *sub_2147F55A8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v0;
  v1 = v0[1];
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  swift_retain();
  return &unk_254D884B8;
}

uint64_t sub_2147F5600(uint64_t a1, _OWORD *a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  __int128 v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v7 = a2[1];
  *(_OWORD *)(v4 + 16) = *a2;
  *(_OWORD *)(v4 + 32) = v7;
  *(_OWORD *)(v4 + 48) = a2[2];
  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a4 + *a4);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 64) = v8;
  *v8 = v4;
  v8[1] = sub_2147F568C;
  return v10(a1, v4 + 16, a3);
}

uint64_t sub_2147F568C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2147F56D4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2147FA024;
  return sub_214852500();
}

uint64_t SKStepPhotoPickerFinishConfiguration.mockConfigurationApplyTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t SKStepPhotoPickerFinishConfiguration.mockConfigurationApplyTime.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*SKStepPhotoPickerFinishConfiguration.mockConfigurationApplyTime.modify())()
{
  return nullsub_1;
}

uint64_t SKStepPhotoPickerFinishConfiguration.mockTransferPhotosTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t SKStepPhotoPickerFinishConfiguration.mockTransferPhotosTime.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = result;
  *(_BYTE *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t (*SKStepPhotoPickerFinishConfiguration.mockTransferPhotosTime.modify())()
{
  return nullsub_1;
}

uint64_t SKStepPhotoPickerFinishConfiguration.mockReport.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v1 + 32);
  v3 = *(_QWORD *)(v1 + 40);
  v4 = *(_QWORD *)(v1 + 48);
  v5 = *(_QWORD *)(v1 + 56);
  v6 = *(_QWORD *)(v1 + 64);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(v1 + 72);
  return sub_2147F7A0C(v2, v3, v4, v5);
}

__n128 SKStepPhotoPickerFinishConfiguration.mockReport.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  __n128 result;
  __n128 v5;
  __int128 v6;

  v5 = (__n128)a1[1];
  v6 = *a1;
  v2 = *((_QWORD *)a1 + 4);
  v3 = *((_BYTE *)a1 + 40);
  sub_2147F7A20(*(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
  result = v5;
  *(_OWORD *)(v1 + 32) = v6;
  *(__n128 *)(v1 + 48) = v5;
  *(_QWORD *)(v1 + 64) = v2;
  *(_BYTE *)(v1 + 72) = v3;
  return result;
}

uint64_t (*SKStepPhotoPickerFinishConfiguration.mockReport.modify())()
{
  return nullsub_1;
}

uint64_t SKStepPhotoPickerFinishConfiguration.photoTransferURLs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SKStepPhotoPickerFinishConfiguration.photoTransferURLs.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 80) = a1;
  return result;
}

uint64_t (*SKStepPhotoPickerFinishConfiguration.photoTransferURLs.modify())()
{
  return nullsub_1;
}

double SKStepPhotoPickerFinishConfiguration.init(photoTransferURLs:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result;

  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  *(_QWORD *)(a2 + 16) = 0;
  *(_BYTE *)(a2 + 24) = 1;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)&result = 1;
  *(_OWORD *)(a2 + 56) = xmmword_214857790;
  *(_BYTE *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 80) = a1;
  return result;
}

uint64_t SKStepPhotoPickerFinishConfiguration.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;

  v1 = sub_2148523F8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_BYTE *)(v0 + 8);
  v6 = *(_BYTE *)(v0 + 24);
  v8 = *(_QWORD *)(v0 + 32);
  v7 = *(_QWORD *)(v0 + 40);
  v9 = *(_QWORD *)(v0 + 48);
  v10 = *(_QWORD *)(v0 + 56);
  v15 = *(_QWORD *)(v0 + 64);
  v16 = v9;
  v14 = *(unsigned __int8 *)(v0 + 72);
  v11 = *(_QWORD *)(v0 + 80);
  v25 = 0;
  v26 = 0xE000000000000000;
  sub_2148523EC();
  if ((v5 & 1) != 0)
  {
    if ((v6 & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v17 = 0;
    v18 = 0xE000000000000000;
    sub_21485298C();
    sub_214852704();
    sub_214852878();
    sub_2148526D4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
    {
LABEL_3:
      if (v10 == 1)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  v17 = 0;
  v18 = 0xE000000000000000;
  sub_21485298C();
  sub_214852704();
  sub_214852878();
  sub_2148526D4();
  swift_bridgeObjectRelease();
  if (v10 != 1)
  {
LABEL_4:
    v23 = 0x6F7065526B636F6DLL;
    v24 = 0xEB000000003D7472;
    v17 = v8;
    LOBYTE(v18) = v7 & 1;
    v19 = v16;
    v20 = v10;
    v21 = v15;
    v22 = v14 & 1;
    SKStepPhotoPickerReport.description.getter();
    sub_214852704();
    swift_bridgeObjectRelease();
    sub_2148526D4();
    swift_bridgeObjectRelease();
  }
LABEL_5:
  v17 = 0;
  v18 = 0xE000000000000000;
  sub_21485298C();
  swift_bridgeObjectRelease();
  v17 = 0xD000000000000012;
  v18 = 0x800000021485CF10;
  if (v11)
  {
    v23 = *(_QWORD *)(v11 + 16);
    sub_2147F7A34();
    sub_214852944();
  }
  sub_214852704();
  swift_bridgeObjectRelease();
  sub_2148526D4();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v25;
}

uint64_t sub_2147F5BDC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2147F5C18 + 4 * byte_214856864[a1]))(0xD00000000000001ALL, 0x800000021485CFD0);
}

uint64_t sub_2147F5C18()
{
  uint64_t v0;

  return v0 + 5;
}

uint64_t sub_2147F5C30()
{
  return 0x6F7065526B636F6DLL;
}

unint64_t sub_2147F5C4C()
{
  return 0xD000000000000011;
}

uint64_t sub_2147F5C68()
{
  unsigned __int8 *v0;

  return sub_2147F5BDC(*v0);
}

uint64_t sub_2147F5C70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2147F9BF4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2147F5C94()
{
  sub_2147F7D38();
  return sub_214852BD8();
}

uint64_t sub_2147F5CBC()
{
  sub_2147F7D38();
  return sub_214852BE4();
}

uint64_t SKStepPhotoPickerFinishConfiguration.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  int v32;
  char v33;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88328);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v32 = *(unsigned __int8 *)(v1 + 24);
  v23 = *(_QWORD *)(v1 + 32);
  v24 = v7;
  v8 = *(_QWORD *)(v1 + 40);
  v21 = *(_QWORD *)(v1 + 48);
  v22 = v8;
  v9 = *(_QWORD *)(v1 + 56);
  v19 = *(_QWORD *)(v1 + 64);
  v20 = v9;
  v18 = *(unsigned __int8 *)(v1 + 72);
  v17 = *(_QWORD *)(v1 + 80);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2147F7D38();
  sub_214852BB4();
  LOBYTE(v26) = 0;
  v10 = v25;
  sub_214852AA0();
  if (!v10)
  {
    v11 = v20;
    v12 = v21;
    v14 = v22;
    v13 = v23;
    LOBYTE(v26) = 1;
    sub_214852AA0();
    v26 = v13;
    v27 = v14;
    v28 = v12;
    v29 = v11;
    v30 = v19;
    v31 = v18;
    v33 = 2;
    sub_2147F7D7C();
    sub_214852AB8();
    v26 = v17;
    v33 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D88338);
    sub_2147F7E48(&qword_254D88340, &qword_254D88348, MEMORY[0x24BDCDAE0], MEMORY[0x24BEE12A0]);
    sub_214852AB8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SKStepPhotoPickerFinishConfiguration.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  int v38;
  char v39;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88350);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2147F7D38();
  sub_214852BA8();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    sub_2147F7A20(0, 0, 0, 1);
  }
  else
  {
    LOBYTE(v32) = 0;
    v9 = sub_214852A4C();
    v11 = v10;
    LOBYTE(v32) = 1;
    v12 = sub_214852A4C();
    v38 = v13;
    v31 = v12;
    v39 = 2;
    sub_2147F7E04();
    sub_214852A64();
    HIDWORD(v24) = v11;
    v25 = v9;
    v26 = a2;
    v15 = v32;
    v16 = v35;
    v29 = v33;
    v30 = v34;
    v17 = v36;
    v18 = v37;
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88338);
    v28 = v17;
    v39 = 3;
    sub_2147F7A0C(v15, v29, v30, v16);
    sub_2147F7E48(&qword_254D88360, &qword_254D88368, MEMORY[0x24BDCDB10], MEMORY[0x24BEE12D0]);
    sub_214852A64();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v19 = v32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v21 = v29;
    v20 = v30;
    v22 = v28;
    sub_2147F7A0C(v15, v29, v30, v16);
    sub_2147F7A20(v15, v21, v20, v16);
    v23 = v26;
    *v26 = v25;
    *((_BYTE *)v23 + 8) = BYTE4(v24) & 1;
    v23[2] = v31;
    *((_BYTE *)v23 + 24) = v38 & 1;
    v23[4] = v15;
    v23[5] = v21;
    v23[6] = v20;
    v23[7] = v16;
    v23[8] = v22;
    *((_BYTE *)v23 + 72) = v18;
    v23[10] = v19;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    sub_2147F7A20(v15, v21, v20, v16);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_2147F6254@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return SKStepPhotoPickerFinishConfiguration.init(from:)(a1, a2);
}

uint64_t sub_2147F6268(_QWORD *a1)
{
  return SKStepPhotoPickerFinishConfiguration.encode(to:)(a1);
}

void *sub_2147F6284()
{
  return &unk_24D226F90;
}

uint64_t sub_2147F6290()
{
  return 0x74726F706572;
}

uint64_t sub_2147F62A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x74726F706572 && a2 == 0xE600000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_214852B18();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_2147F6330()
{
  sub_2147F7ECC();
  return sub_214852BD8();
}

uint64_t sub_2147F6358()
{
  sub_2147F7ECC();
  return sub_214852BE4();
}

uint64_t sub_2147F6380(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10;
  int v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  __int128 v16;
  uint64_t v17;
  char v18;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88370);
  v13 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v1;
  v7 = *((_BYTE *)v1 + 8);
  v12 = *((_OWORD *)v1 + 1);
  v8 = v1[4];
  v11 = *((unsigned __int8 *)v1 + 40);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2147F7ECC();
  sub_214852BB4();
  v14 = v6;
  v15 = v7;
  v16 = v12;
  v17 = v8;
  v18 = v11;
  sub_2147F7D7C();
  sub_214852AD0();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v5, v3);
}

uint64_t sub_2147F64B8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  uint64_t v14;
  char v15;
  __int128 v16;
  uint64_t v17;
  char v18;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88378);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2147F7ECC();
  sub_214852BA8();
  if (!v2)
  {
    sub_2147F7E04();
    sub_214852A7C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v9 = v15;
    v10 = v17;
    v11 = v18;
    v12 = v16;
    *(_QWORD *)a2 = v14;
    *(_BYTE *)(a2 + 8) = v9;
    *(_OWORD *)(a2 + 16) = v12;
    *(_QWORD *)(a2 + 32) = v10;
    *(_BYTE *)(a2 + 40) = v11;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

__n128 sub_2147F65F8@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  unsigned __int8 v2;
  unint64_t v3;
  unsigned __int8 v4;
  __n128 result;

  v2 = a1->n128_u8[8];
  v3 = a1[2].n128_u64[0];
  v4 = a1[2].n128_u8[8];
  a2->n128_u64[0] = a1->n128_u64[0];
  a2->n128_u8[8] = v2;
  result = a1[1];
  a2[1] = result;
  a2[2].n128_u64[0] = v3;
  a2[2].n128_u8[8] = v4;
  return result;
}

uint64_t sub_2147F6628()
{
  return sub_2148524D0();
}

uint64_t sub_2147F663C()
{
  return sub_2148524DC();
}

uint64_t sub_2147F6650@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2147F64B8(a1, a2);
}

uint64_t sub_2147F6664(_QWORD *a1)
{
  return sub_2147F6380(a1);
}

uint64_t sub_2147F6678()
{
  sub_214852B84();
  sub_214852B90();
  return sub_214852B9C();
}

uint64_t sub_2147F66B8()
{
  sub_214852B84();
  sub_214852B90();
  return sub_214852B9C();
}

uint64_t sub_2147F66F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x72756769666E6F63 && a2 == 0xED00006E6F697461)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_214852B18();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_2147F67AC()
{
  sub_2147F7F10();
  return sub_214852BD8();
}

uint64_t sub_2147F67D4()
{
  sub_2147F7F10();
  return sub_214852BE4();
}

uint64_t sub_2147F67FC(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  char v26;
  uint64_t v27;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88380);
  v18 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v1;
  v7 = *((_BYTE *)v1 + 8);
  v8 = v1[2];
  v17 = *((unsigned __int8 *)v1 + 24);
  v9 = *((_OWORD *)v1 + 2);
  v15 = *((_OWORD *)v1 + 3);
  v16 = v9;
  v14 = v1[8];
  v13 = *((unsigned __int8 *)v1 + 72);
  v12 = v1[10];
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2147F7F10();
  sub_214852BB4();
  v19 = v6;
  v20 = v7;
  v21 = v8;
  v22 = v17;
  v23 = v16;
  v24 = v15;
  v25 = v14;
  v26 = v13;
  v27 = v12;
  sub_2147F7F54();
  sub_214852AD0();
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v5, v3);
}

__n128 sub_2147F696C@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  __n128 result;
  __int128 v9;

  v2 = *(_BYTE *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_BYTE *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_BYTE *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 80);
  *(_QWORD *)a2 = *(_QWORD *)a1;
  *(_BYTE *)(a2 + 8) = v2;
  *(_QWORD *)(a2 + 16) = v3;
  *(_BYTE *)(a2 + 24) = v4;
  result = *(__n128 *)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 48);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v9;
  *(_QWORD *)(a2 + 64) = v5;
  *(_BYTE *)(a2 + 72) = v6;
  *(_QWORD *)(a2 + 80) = v7;
  return result;
}

uint64_t sub_2147F69B0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  _QWORD v18[2];
  char v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  char v25;
  uint64_t v26;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88390);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2147F7F10();
  sub_214852BA8();
  if (!v2)
  {
    sub_2147F7F98();
    sub_214852A7C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v9 = v19;
    v10 = v20;
    v11 = v21;
    v12 = v24;
    v13 = v25;
    v14 = v26;
    v15 = v22;
    v16 = v23;
    *(_QWORD *)a2 = v18[1];
    *(_BYTE *)(a2 + 8) = v9;
    *(_QWORD *)(a2 + 16) = v10;
    *(_BYTE *)(a2 + 24) = v11;
    *(_OWORD *)(a2 + 32) = v15;
    *(_OWORD *)(a2 + 48) = v16;
    *(_QWORD *)(a2 + 64) = v12;
    *(_BYTE *)(a2 + 72) = v13;
    *(_QWORD *)(a2 + 80) = v14;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

unint64_t sub_2147F6B0C()
{
  return 0xD000000000000013;
}

uint64_t sub_2147F6B28@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2147F69B0(a1, a2);
}

uint64_t sub_2147F6B3C(_QWORD *a1)
{
  return sub_2147F67FC(a1);
}

uint64_t SKStepPhotoPickerReport.configurationApplyTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t SKStepPhotoPickerReport.configurationApplyTime.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*SKStepPhotoPickerReport.configurationApplyTime.modify())()
{
  return nullsub_1;
}

uint64_t SKStepPhotoPickerReport.configurationIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SKStepPhotoPickerReport.configurationIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*SKStepPhotoPickerReport.configurationIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t SKStepPhotoPickerReport.transferPhotosTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t SKStepPhotoPickerReport.transferPhotosTime.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = result;
  *(_BYTE *)(v2 + 40) = a2 & 1;
  return result;
}

uint64_t (*SKStepPhotoPickerReport.transferPhotosTime.modify())()
{
  return nullsub_1;
}

void __swiftcall SKStepPhotoPickerReport.init()(SetupKit::SKStepPhotoPickerReport *__return_ptr retstr)
{
  retstr->configurationApplyTime.value = 0.0;
  retstr->configurationApplyTime.is_nil = 1;
  retstr->configurationIdentifier.value._object = 0;
  retstr->transferPhotosTime.value = 0.0;
  retstr->configurationIdentifier.value._countAndFlagsBits = 0;
  retstr->transferPhotosTime.is_nil = 1;
}

uint64_t SKStepPhotoPickerReport.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char v4;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v7 = sub_2148523F8();
  v1 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(_BYTE *)(v0 + 8);
  HIDWORD(v6) = *(unsigned __int8 *)(v0 + 40);
  v10 = 0;
  v11 = 0xE000000000000000;
  sub_2148523EC();
  v8 = 0;
  v9 = 0xE000000000000000;
  sub_21485298C();
  swift_bridgeObjectRelease();
  v8 = 0xD000000000000017;
  v9 = 0x800000021485CF70;
  if ((v4 & 1) == 0)
    sub_21485286C();
  sub_214852704();
  swift_bridgeObjectRelease();
  sub_2148526D4();
  swift_bridgeObjectRelease();
  v8 = 0;
  v9 = 0xE000000000000000;
  sub_21485298C();
  swift_bridgeObjectRelease();
  v8 = 0xD000000000000018;
  v9 = 0x800000021485CEF0;
  swift_bridgeObjectRetain();
  sub_214852704();
  swift_bridgeObjectRelease();
  sub_2148526D4();
  swift_bridgeObjectRelease();
  v8 = 0;
  v9 = 0xE000000000000000;
  sub_21485298C();
  swift_bridgeObjectRelease();
  v8 = 0xD000000000000013;
  v9 = 0x800000021485CF90;
  if ((v6 & 0x100000000) == 0)
    sub_21485286C();
  sub_214852704();
  swift_bridgeObjectRelease();
  sub_2148526D4();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v7);
  return v10;
}

unint64_t sub_2147F6E70(char a1)
{
  if (!a1)
    return 0xD000000000000016;
  if (a1 == 1)
    return 0xD000000000000017;
  return 0xD000000000000012;
}

BOOL sub_2147F6ECC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2147F6EE0()
{
  sub_214852B84();
  sub_214852B90();
  return sub_214852B9C();
}

uint64_t sub_2147F6F24()
{
  return sub_214852B90();
}

uint64_t sub_2147F6F4C()
{
  sub_214852B84();
  sub_214852B90();
  return sub_214852B9C();
}

unint64_t sub_2147F6F8C()
{
  char *v0;

  return sub_2147F6E70(*v0);
}

uint64_t sub_2147F6F94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2147F9DA8(a1, a2);
  *a3 = result;
  return result;
}

void sub_2147F6FB8(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_2147F6FC4()
{
  sub_2147F7FDC();
  return sub_214852BD8();
}

uint64_t sub_2147F6FEC()
{
  sub_2147F7FDC();
  return sub_214852BE4();
}

uint64_t SKStepPhotoPickerReport.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];
  int v11;
  char v12;
  char v13;
  char v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D883A0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v10[1] = *(_QWORD *)(v1 + 24);
  v10[2] = v7;
  v10[0] = *(_QWORD *)(v1 + 32);
  v11 = *(unsigned __int8 *)(v1 + 40);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2147F7FDC();
  sub_214852BB4();
  v14 = 0;
  v8 = v10[3];
  sub_214852AA0();
  if (!v8)
  {
    v13 = 1;
    sub_214852A94();
    v12 = 2;
    sub_214852AA0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SKStepPhotoPickerReport.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  char v22;
  char v23;
  char v24;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D883A8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2147F7FDC();
  sub_214852BA8();
  if (!v2)
  {
    v24 = 0;
    v9 = sub_214852A4C();
    v21 = v10;
    v23 = 1;
    v11 = sub_214852A40();
    v14 = v13;
    v20 = v11;
    v22 = 2;
    swift_bridgeObjectRetain();
    v15 = sub_214852A4C();
    v16 = v8;
    v18 = v17;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v16, v5);
    *(_QWORD *)a2 = v9;
    *(_BYTE *)(a2 + 8) = v21 & 1;
    *(_QWORD *)(a2 + 16) = v20;
    *(_QWORD *)(a2 + 24) = v14;
    *(_QWORD *)(a2 + 32) = v15;
    *(_BYTE *)(a2 + 40) = v18 & 1;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2147F7358@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SKStepPhotoPickerReport.init(from:)(a1, a2);
}

uint64_t sub_2147F736C(_QWORD *a1)
{
  return SKStepPhotoPickerReport.encode(to:)(a1);
}

uint64_t sub_2147F7388(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void (*v18)(char *, uint64_t);
  BOOL v20;
  uint64_t v22;
  uint64_t v23;

  v4 = sub_214852368();
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v22 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v17 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v22 = *(_QWORD *)(v8 + 72);
      v23 = v8;
      v13 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
      v14 = v11 - 1;
      do
      {
        v15 = a1;
        v13(v10, a1 + v12, v4);
        v16 = a2;
        v13(v7, a2 + v12, v4);
        sub_2147F9F94(&qword_254D884C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB00]);
        v17 = sub_214852698();
        v18 = *(void (**)(char *, uint64_t))(v23 + 8);
        v18(v7, v4);
        v18(v10, v4);
        v20 = v14-- != 0;
        if ((v17 & 1) == 0)
          break;
        v12 += v22;
        a2 = v16;
        a1 = v15;
      }
      while (v20);
    }
  }
  else
  {
    v17 = 0;
  }
  return v17 & 1;
}

uint64_t sub_2147F750C(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000017 && a2 == 0x800000021485CFB0)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_214852B18();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_2147F7590(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x61746144656C6966 && a2 == 0xE800000000000000;
  if (v2 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656D616E656C6966 && a2 == 0xE800000000000000 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7366664F656C6966 && a2 == 0xEA00000000007465 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x657A6953656C6966 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_214852B18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_2147F7754@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D884C8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2147F54A0();
  sub_214852BA8();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v26 = 0;
  sub_2147F9FD4();
  sub_214852A7C();
  v10 = v24;
  v9 = v25;
  LOBYTE(v24) = 1;
  sub_2147F51E4(v10, v25);
  v11 = sub_214852A70();
  v13 = v12;
  v21 = v11;
  v23 = v9;
  LOBYTE(v24) = 2;
  swift_bridgeObjectRetain();
  v22 = 0;
  v19 = sub_214852A88();
  v20 = v13;
  LOBYTE(v24) = 3;
  v14 = sub_214852A88();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v15 = v23;
  sub_2147F51E4(v10, v23);
  sub_2147F8898(v10, v15);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  sub_2147F8898(v10, v15);
  v16 = v20;
  result = swift_bridgeObjectRelease();
  *a2 = v10;
  a2[1] = v15;
  a2[2] = v21;
  a2[3] = v16;
  a2[4] = v19;
  a2[5] = v14;
  return result;
}

uint64_t sub_2147F7A0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (a4 != 1)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_2147F7A20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (a4 != 1)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_2147F7A34()
{
  unint64_t result;

  result = qword_254D88320;
  if (!qword_254D88320)
  {
    result = MEMORY[0x2199D7540](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_254D88320);
  }
  return result;
}

BOOL _s8SetupKit23SKStepPhotoPickerReportV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  char v8;
  uint64_t v9;
  double v10;
  char v11;
  char v12;
  char v13;
  _BOOL8 result;
  char v15;

  v4 = *(_BYTE *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  v7 = *(double *)(a1 + 32);
  v8 = *(_BYTE *)(a1 + 40);
  v9 = *(_QWORD *)(a2 + 24);
  v10 = *(double *)(a2 + 32);
  v11 = *(_BYTE *)(a2 + 40);
  if ((v4 & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 8))
      return 0;
  }
  else
  {
    if (*(double *)a1 == *(double *)a2)
      v12 = *(_BYTE *)(a2 + 8);
    else
      v12 = 1;
    if ((v12 & 1) != 0)
      return 0;
  }
  if (!v6)
  {
    if (v9)
      return 0;
    goto LABEL_15;
  }
  if (!v9)
    return 0;
  if (v5 == *(_QWORD *)(a2 + 16) && v6 == v9 || (v13 = sub_214852B18(), result = 0, (v13 & 1) != 0))
  {
LABEL_15:
    if ((v8 & 1) == 0)
    {
      if (v7 == v10)
        v15 = v11;
      else
        v15 = 1;
      return (v15 & 1) == 0;
    }
    return (v11 & 1) != 0;
  }
  return result;
}

BOOL _s8SetupKit36SKStepPhotoPickerFinishConfigurationV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  _QWORD v31[5];
  char v32;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_BYTE *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 80);
  v9 = *(_BYTE *)(a2 + 8);
  v11 = *(_QWORD *)(a2 + 32);
  v10 = *(_QWORD *)(a2 + 40);
  v13 = *(_QWORD *)(a2 + 48);
  v12 = *(_QWORD *)(a2 + 56);
  v14 = *(_QWORD *)(a2 + 64);
  v15 = *(_BYTE *)(a2 + 72);
  v16 = *(_QWORD *)(a2 + 80);
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 8))
      return 0;
  }
  else
  {
    if (*(double *)a1 != *(double *)a2)
      v9 = 1;
    if ((v9 & 1) != 0)
      return 0;
  }
  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 24))
      return 0;
  }
  else
  {
    if (*(double *)(a1 + 16) == *(double *)(a2 + 16))
      v17 = *(_BYTE *)(a2 + 24);
    else
      v17 = 1;
    if ((v17 & 1) != 0)
      return 0;
  }
  if (v5 == 1)
  {
    if (v12 == 1)
      goto LABEL_22;
LABEL_19:
    sub_2147F7A0C(v11, v10, v13, v12);
    sub_2147F7A20(v3, v2, v4, v5);
    sub_2147F7A20(v11, v10, v13, v12);
    return 0;
  }
  v31[0] = *(_QWORD *)(a1 + 32);
  v31[1] = v2;
  v31[2] = v4;
  v31[3] = v5;
  v31[4] = v6;
  v32 = v7;
  if (v12 == 1)
  {
    swift_bridgeObjectRetain();
    goto LABEL_19;
  }
  v25 = v11;
  v26 = v10 & 1;
  v27 = v13;
  v28 = v12;
  v29 = v14;
  v30 = v15 & 1;
  v19 = v8;
  v20 = v16;
  v21 = _s8SetupKit23SKStepPhotoPickerReportV2eeoiySbAC_ACtFZ_0((uint64_t)v31, (uint64_t)&v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16 = v20;
  v8 = v19;
  if (!v21)
    return 0;
LABEL_22:
  if (!v8)
    return !v16;
  if (!v16)
    return 0;
  v22 = v16;
  swift_bridgeObjectRetain();
  v23 = swift_bridgeObjectRetain();
  v24 = sub_2147F7388(v23, v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v24 & 1) != 0;
}

unint64_t sub_2147F7D38()
{
  unint64_t result;

  result = qword_254D8A618;
  if (!qword_254D8A618)
  {
    result = MEMORY[0x2199D7540](&unk_21485764C, &type metadata for SKStepPhotoPickerFinishConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8A618);
  }
  return result;
}

unint64_t sub_2147F7D7C()
{
  unint64_t result;

  result = qword_254D88330;
  if (!qword_254D88330)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepPhotoPickerReport, &type metadata for SKStepPhotoPickerReport);
    atomic_store(result, (unint64_t *)&qword_254D88330);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199D7534](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2147F7E04()
{
  unint64_t result;

  result = qword_254D88358;
  if (!qword_254D88358)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepPhotoPickerReport, &type metadata for SKStepPhotoPickerReport);
    atomic_store(result, (unint64_t *)&qword_254D88358);
  }
  return result;
}

uint64_t sub_2147F7E48(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D88338);
    v10 = sub_2147F9F94(a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], a3);
    result = MEMORY[0x2199D7540](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2147F7ECC()
{
  unint64_t result;

  result = qword_254D8A620;
  if (!qword_254D8A620)
  {
    result = MEMORY[0x2199D7540](&unk_2148575FC, &type metadata for SKStepPhotoPickerFinishRequestMessage.ResponseMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8A620);
  }
  return result;
}

unint64_t sub_2147F7F10()
{
  unint64_t result;

  result = qword_254D8A628;
  if (!qword_254D8A628)
  {
    result = MEMORY[0x2199D7540](&unk_2148575AC, &type metadata for SKStepPhotoPickerFinishRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8A628);
  }
  return result;
}

unint64_t sub_2147F7F54()
{
  unint64_t result;

  result = qword_254D88388;
  if (!qword_254D88388)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepPhotoPickerFinishConfiguration, &type metadata for SKStepPhotoPickerFinishConfiguration);
    atomic_store(result, (unint64_t *)&qword_254D88388);
  }
  return result;
}

unint64_t sub_2147F7F98()
{
  unint64_t result;

  result = qword_254D88398;
  if (!qword_254D88398)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepPhotoPickerFinishConfiguration, &type metadata for SKStepPhotoPickerFinishConfiguration);
    atomic_store(result, (unint64_t *)&qword_254D88398);
  }
  return result;
}

unint64_t sub_2147F7FDC()
{
  unint64_t result;

  result = qword_254D8A630[0];
  if (!qword_254D8A630[0])
  {
    result = MEMORY[0x2199D7540](&unk_21485755C, &type metadata for SKStepPhotoPickerReport.CodingKeys);
    atomic_store(result, qword_254D8A630);
  }
  return result;
}

unint64_t sub_2147F8024()
{
  unint64_t result;

  result = qword_254D883B0;
  if (!qword_254D883B0)
  {
    result = MEMORY[0x2199D7540](&unk_214856990, &type metadata for SKStepPhotoPickerStartRequestMessage);
    atomic_store(result, (unint64_t *)&qword_254D883B0);
  }
  return result;
}

unint64_t sub_2147F806C()
{
  unint64_t result;

  result = qword_254D883B8;
  if (!qword_254D883B8)
  {
    result = MEMORY[0x2199D7540](&unk_2148569B8, &type metadata for SKStepPhotoPickerStartRequestMessage);
    atomic_store(result, (unint64_t *)&qword_254D883B8);
  }
  return result;
}

uint64_t sub_2147F80B0()
{
  return sub_2147F9F94(&qword_254D883C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE6D7C8], MEMORY[0x24BE6D7B8]);
}

unint64_t sub_2147F80E0()
{
  unint64_t result;

  result = qword_254D883C8;
  if (!qword_254D883C8)
  {
    result = MEMORY[0x2199D7540](&unk_214856928, &type metadata for SKStepPhotoPickerStartRequestMessage);
    atomic_store(result, (unint64_t *)&qword_254D883C8);
  }
  return result;
}

unint64_t sub_2147F8128()
{
  unint64_t result;

  result = qword_254D883D8;
  if (!qword_254D883D8)
  {
    result = MEMORY[0x2199D7540](&unk_214856AE0, &type metadata for SKStepPhotoPickerTransferFileRequestMessage);
    atomic_store(result, (unint64_t *)&qword_254D883D8);
  }
  return result;
}

unint64_t sub_2147F8170()
{
  unint64_t result;

  result = qword_254D883E0;
  if (!qword_254D883E0)
  {
    result = MEMORY[0x2199D7540](&unk_214856B08, &type metadata for SKStepPhotoPickerTransferFileRequestMessage);
    atomic_store(result, (unint64_t *)&qword_254D883E0);
  }
  return result;
}

unint64_t sub_2147F81B8()
{
  unint64_t result;

  result = qword_254D883E8;
  if (!qword_254D883E8)
  {
    result = MEMORY[0x2199D7540](&unk_214856A78, &type metadata for SKStepPhotoPickerTransferFileRequestMessage);
    atomic_store(result, (unint64_t *)&qword_254D883E8);
  }
  return result;
}

unint64_t sub_2147F8200()
{
  unint64_t result;

  result = qword_254D883F8;
  if (!qword_254D883F8)
  {
    result = MEMORY[0x2199D7540](&unk_214856C60, &type metadata for SKStepPhotoPickerFinishRequestMessage.ResponseMessage);
    atomic_store(result, (unint64_t *)&qword_254D883F8);
  }
  return result;
}

unint64_t sub_2147F8248()
{
  unint64_t result;

  result = qword_254D88400;
  if (!qword_254D88400)
  {
    result = MEMORY[0x2199D7540](&unk_214856C88, &type metadata for SKStepPhotoPickerFinishRequestMessage.ResponseMessage);
    atomic_store(result, (unint64_t *)&qword_254D88400);
  }
  return result;
}

unint64_t sub_2147F8290()
{
  unint64_t result;

  result = qword_254D88408;
  if (!qword_254D88408)
  {
    result = MEMORY[0x2199D7540](&unk_214856D18, &type metadata for SKStepPhotoPickerFinishRequestMessage);
    atomic_store(result, (unint64_t *)&qword_254D88408);
  }
  return result;
}

unint64_t sub_2147F82D8()
{
  unint64_t result;

  result = qword_254D88410;
  if (!qword_254D88410)
  {
    result = MEMORY[0x2199D7540](&unk_214856D40, &type metadata for SKStepPhotoPickerFinishRequestMessage);
    atomic_store(result, (unint64_t *)&qword_254D88410);
  }
  return result;
}

unint64_t sub_2147F8320()
{
  unint64_t result;

  result = qword_254D88418;
  if (!qword_254D88418)
  {
    result = MEMORY[0x2199D7540](&unk_214856C18, &type metadata for SKStepPhotoPickerFinishRequestMessage.ResponseMessage);
    atomic_store(result, (unint64_t *)&qword_254D88418);
  }
  return result;
}

unint64_t sub_2147F8368()
{
  unint64_t result;

  result = qword_254D88420;
  if (!qword_254D88420)
  {
    result = MEMORY[0x2199D7540](&unk_214856CB0, &type metadata for SKStepPhotoPickerFinishRequestMessage);
    atomic_store(result, (unint64_t *)&qword_254D88420);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for SKStepPhotoPickerStartConfiguration(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SKStepPhotoPickerStartConfiguration()
{
  return swift_bridgeObjectRelease();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for SKStepPhotoPickerStartConfiguration(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for SKStepPhotoPickerStartConfiguration()
{
  return &type metadata for SKStepPhotoPickerStartConfiguration;
}

_QWORD *_s8SetupKit35SKStepPhotoPickerStartConfigurationVwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s8SetupKit35SKStepPhotoPickerStartConfigurationVwet_0(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t _s8SetupKit35SKStepPhotoPickerStartConfigurationVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SKStepPhotoPickerStartRequestMessage()
{
  return &type metadata for SKStepPhotoPickerStartRequestMessage;
}

_QWORD *initializeBufferWithCopyOfBuffer for SKStepPhotoPickerStartRequestHandler(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for SKStepPhotoPickerStartRequestHandler()
{
  return swift_release();
}

_OWORD *assignWithTake for SKStepPhotoPickerStartRequestHandler(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for SKStepPhotoPickerStartRequestHandler()
{
  return &type metadata for SKStepPhotoPickerStartRequestHandler;
}

uint64_t initializeBufferWithCopyOfBuffer for SKStepPhotoPickerFileInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_214852368();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for SKStepPhotoPickerFileInfo(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_214852368();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for SKStepPhotoPickerFileInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_214852368();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for SKStepPhotoPickerFileInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_214852368();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for SKStepPhotoPickerFileInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_214852368();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for SKStepPhotoPickerFileInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_214852368();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SKStepPhotoPickerFileInfo()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2147F8740(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_214852368();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SKStepPhotoPickerFileInfo()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2147F8788(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_214852368();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for SKStepPhotoPickerFileInfo()
{
  uint64_t result;

  result = qword_254D8B4C0;
  if (!qword_254D8B4C0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2147F8804()
{
  uint64_t result;
  unint64_t v1;

  result = sub_214852368();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for SKStepPhotoPickerTransferFileRequestMessage(uint64_t a1)
{
  sub_2147F8898(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return swift_bridgeObjectRelease();
}

uint64_t sub_2147F8898(uint64_t a1, unint64_t a2)
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

uint64_t initializeWithCopy for SKStepPhotoPickerTransferFileRequestMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  sub_2147F51E4(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for SKStepPhotoPickerTransferFileRequestMessage(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  sub_2147F51E4(*a2, v5);
  v6 = *a1;
  v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_2147F8898(v6, v7);
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SKStepPhotoPickerTransferFileRequestMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_2147F8898(v4, v5);
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SKStepPhotoPickerTransferFileRequestMessage(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SKStepPhotoPickerTransferFileRequestMessage(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SKStepPhotoPickerTransferFileRequestMessage()
{
  return &type metadata for SKStepPhotoPickerTransferFileRequestMessage;
}

ValueMetadata *type metadata accessor for SKStepPhotoPickerTransferFileRequestHandler()
{
  return &type metadata for SKStepPhotoPickerTransferFileRequestHandler;
}

uint64_t sub_2147F8ACC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

ValueMetadata *type metadata accessor for SKStepPhotoPickerFinishConfiguration()
{
  return &type metadata for SKStepPhotoPickerFinishConfiguration;
}

uint64_t _s8SetupKit36SKStepPhotoPickerFinishConfigurationVwxx_0(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 56) != 1)
    swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s8SetupKit36SKStepPhotoPickerFinishConfigurationVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  __int128 v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = a1 + 32;
  v5 = (_OWORD *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 56);
  if (v6 == 1)
  {
    v7 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)v4 = *v5;
    *(_OWORD *)(v4 + 16) = v7;
    *(_OWORD *)(v4 + 25) = *(_OWORD *)(a2 + 57);
  }
  else
  {
    *(_QWORD *)v4 = *(_QWORD *)v5;
    *(_BYTE *)(v4 + 8) = *(_BYTE *)(a2 + 40);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 56) = v6;
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
    swift_bridgeObjectRetain();
  }
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s8SetupKit36SKStepPhotoPickerFinishConfigurationVwca_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 *v6;
  __int128 *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v4;
  v5 = a2[2];
  *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  v6 = (__int128 *)(a1 + 32);
  v7 = (__int128 *)(a2 + 4);
  v8 = a2[7];
  if (*(_QWORD *)(a1 + 56) == 1)
  {
    if (v8 == 1)
    {
      v9 = *v7;
      v10 = *((_OWORD *)a2 + 3);
      *(_OWORD *)(a1 + 57) = *(_OWORD *)((char *)a2 + 57);
      *v6 = v9;
      *(_OWORD *)(a1 + 48) = v10;
    }
    else
    {
      v13 = *(_QWORD *)v7;
      *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
      *(_QWORD *)v6 = v13;
      *(_QWORD *)(a1 + 48) = a2[6];
      *(_QWORD *)(a1 + 56) = a2[7];
      v14 = a2[8];
      *(_BYTE *)(a1 + 72) = *((_BYTE *)a2 + 72);
      *(_QWORD *)(a1 + 64) = v14;
      swift_bridgeObjectRetain();
    }
  }
  else if (v8 == 1)
  {
    sub_2147F8ACC(a1 + 32);
    v11 = *(__int128 *)((char *)v7 + 25);
    v12 = v7[1];
    *v6 = *v7;
    v6[1] = v12;
    *(__int128 *)((char *)v6 + 25) = v11;
  }
  else
  {
    v15 = *(_QWORD *)v7;
    *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
    *(_QWORD *)v6 = v15;
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = a2[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v16 = a2[8];
    *(_BYTE *)(a1 + 72) = *((_BYTE *)a2 + 72);
    *(_QWORD *)(a1 + 64) = v16;
  }
  *(_QWORD *)(a1 + 80) = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s8SetupKit36SKStepPhotoPickerFinishConfigurationVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = a1 + 32;
  v5 = a2 + 32;
  if (*(_QWORD *)(a1 + 56) != 1)
  {
    v6 = *(_QWORD *)(a2 + 56);
    if (v6 != 1)
    {
      *(_QWORD *)v4 = *(_QWORD *)v5;
      *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      *(_QWORD *)(a1 + 56) = v6;
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
      goto LABEL_6;
    }
    sub_2147F8ACC(v4);
  }
  v7 = *(_OWORD *)(v5 + 16);
  *(_OWORD *)v4 = *(_OWORD *)v5;
  *(_OWORD *)(v4 + 16) = v7;
  *(_OWORD *)(v4 + 25) = *(_OWORD *)(v5 + 25);
LABEL_6:
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s8SetupKit36SKStepPhotoPickerFinishConfigurationVwet_0(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 88))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 80);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t _s8SetupKit36SKStepPhotoPickerFinishConfigurationVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 88) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 88) = 0;
    if (a2)
      *(_QWORD *)(result + 80) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SKStepPhotoPickerFinishRequestMessage()
{
  return &type metadata for SKStepPhotoPickerFinishRequestMessage;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
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

ValueMetadata *type metadata accessor for SKStepPhotoPickerFinishRequestMessage.ResponseMessage()
{
  return &type metadata for SKStepPhotoPickerFinishRequestMessage.ResponseMessage;
}

_QWORD *assignWithCopy for SKStepActivationStartRequestHandler(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SKStepActivationStartRequestHandler(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SKStepActivationStartRequestHandler(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
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
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SKStepPhotoPickerFinishRequestHandler()
{
  return &type metadata for SKStepPhotoPickerFinishRequestHandler;
}

uint64_t initializeBufferWithCopyOfBuffer for SKStepPhotoPickerReport(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SKStepPhotoPickerReport()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s8SetupKit23SKStepPhotoPickerReportVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s8SetupKit23SKStepPhotoPickerReportVwca_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = a2[4];
  *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
  *(_QWORD *)(a1 + 32) = v5;
  return a1;
}

uint64_t _s8SetupKit23SKStepPhotoPickerReportVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t _s8SetupKit23SKStepPhotoPickerReportVwet_0(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t _s8SetupKit23SKStepPhotoPickerReportVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SKStepPhotoPickerReport()
{
  return &type metadata for SKStepPhotoPickerReport;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SKStepPhotoPickerReport.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SKStepPhotoPickerReport.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2147F92D8 + 4 * byte_21485686D[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2147F930C + 4 * byte_214856868[v4]))();
}

uint64_t sub_2147F930C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2147F9314(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2147F931CLL);
  return result;
}

uint64_t sub_2147F9328(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2147F9330);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2147F9334(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2147F933C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2147F9348(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2147F9350(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SKStepPhotoPickerReport.CodingKeys()
{
  return &type metadata for SKStepPhotoPickerReport.CodingKeys;
}

uint64_t sub_2147F9374()
{
  return 0;
}

ValueMetadata *type metadata accessor for SKStepPhotoPickerFinishRequestMessage.CodingKeys()
{
  return &type metadata for SKStepPhotoPickerFinishRequestMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for SKStepPhotoPickerFinishRequestMessage.ResponseMessage.CodingKeys()
{
  return &type metadata for SKStepPhotoPickerFinishRequestMessage.ResponseMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for SKStepPhotoPickerFinishConfiguration.CodingKeys()
{
  return &type metadata for SKStepPhotoPickerFinishConfiguration.CodingKeys;
}

uint64_t _s8SetupKit36SKStepPhotoPickerFinishConfigurationV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s8SetupKit36SKStepPhotoPickerFinishConfigurationV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2147F9490 + 4 * byte_214856877[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2147F94C4 + 4 * byte_214856872[v4]))();
}

uint64_t sub_2147F94C4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2147F94CC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2147F94D4);
  return result;
}

uint64_t sub_2147F94E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2147F94E8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2147F94EC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2147F94F4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SKStepPhotoPickerTransferFileRequestMessage.CodingKeys()
{
  return &type metadata for SKStepPhotoPickerTransferFileRequestMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for SKStepPhotoPickerStartRequestMessage.CodingKeys()
{
  return &type metadata for SKStepPhotoPickerStartRequestMessage.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SKStepAppleAccountSetupPrepareRequestMessage.CodingKeys(unsigned int *a1, int a2)
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

uint64_t _s8SetupKit37SKStepPhotoPickerFinishRequestMessageV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2147F95B0 + 4 * byte_21485687C[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2147F95D0 + 4 * byte_214856881[v4]))();
}

_BYTE *sub_2147F95B0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2147F95D0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2147F95D8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2147F95E0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2147F95E8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2147F95F0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SKStepPhotoPickerStartConfiguration.CodingKeys()
{
  return &type metadata for SKStepPhotoPickerStartConfiguration.CodingKeys;
}

unint64_t sub_2147F9610()
{
  unint64_t result;

  result = qword_254D8B5D0[0];
  if (!qword_254D8B5D0[0])
  {
    result = MEMORY[0x2199D7540](&unk_2148570E4, &type metadata for SKStepPhotoPickerStartConfiguration.CodingKeys);
    atomic_store(result, qword_254D8B5D0);
  }
  return result;
}

unint64_t sub_2147F9658()
{
  unint64_t result;

  result = qword_254D8B7E0[0];
  if (!qword_254D8B7E0[0])
  {
    result = MEMORY[0x2199D7540](&unk_21485719C, &type metadata for SKStepPhotoPickerStartRequestMessage.CodingKeys);
    atomic_store(result, qword_254D8B7E0);
  }
  return result;
}

unint64_t sub_2147F96A0()
{
  unint64_t result;

  result = qword_254D8B9F0;
  if (!qword_254D8B9F0)
  {
    result = MEMORY[0x2199D7540](&unk_214857254, &type metadata for SKStepPhotoPickerTransferFileRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8B9F0);
  }
  return result;
}

unint64_t sub_2147F96E8()
{
  unint64_t result;

  result = qword_254D8BC00[0];
  if (!qword_254D8BC00[0])
  {
    result = MEMORY[0x2199D7540](&unk_21485730C, &type metadata for SKStepPhotoPickerFinishConfiguration.CodingKeys);
    atomic_store(result, qword_254D8BC00);
  }
  return result;
}

unint64_t sub_2147F9730()
{
  unint64_t result;

  result = qword_254D8BE10[0];
  if (!qword_254D8BE10[0])
  {
    result = MEMORY[0x2199D7540](&unk_2148573C4, &type metadata for SKStepPhotoPickerFinishRequestMessage.ResponseMessage.CodingKeys);
    atomic_store(result, qword_254D8BE10);
  }
  return result;
}

unint64_t sub_2147F9778()
{
  unint64_t result;

  result = qword_254D8C020[0];
  if (!qword_254D8C020[0])
  {
    result = MEMORY[0x2199D7540](&unk_21485747C, &type metadata for SKStepPhotoPickerFinishRequestMessage.CodingKeys);
    atomic_store(result, qword_254D8C020);
  }
  return result;
}

unint64_t sub_2147F97C0()
{
  unint64_t result;

  result = qword_254D8C230[0];
  if (!qword_254D8C230[0])
  {
    result = MEMORY[0x2199D7540](&unk_214857534, &type metadata for SKStepPhotoPickerReport.CodingKeys);
    atomic_store(result, qword_254D8C230);
  }
  return result;
}

unint64_t sub_2147F9808()
{
  unint64_t result;

  result = qword_254D8C340;
  if (!qword_254D8C340)
  {
    result = MEMORY[0x2199D7540](&unk_2148574A4, &type metadata for SKStepPhotoPickerReport.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8C340);
  }
  return result;
}

unint64_t sub_2147F9850()
{
  unint64_t result;

  result = qword_254D8C348[0];
  if (!qword_254D8C348[0])
  {
    result = MEMORY[0x2199D7540](&unk_2148574CC, &type metadata for SKStepPhotoPickerReport.CodingKeys);
    atomic_store(result, qword_254D8C348);
  }
  return result;
}

unint64_t sub_2147F9898()
{
  unint64_t result;

  result = qword_254D8C3D0;
  if (!qword_254D8C3D0)
  {
    result = MEMORY[0x2199D7540](&unk_2148573EC, &type metadata for SKStepPhotoPickerFinishRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8C3D0);
  }
  return result;
}

unint64_t sub_2147F98E0()
{
  unint64_t result;

  result = qword_254D8C3D8[0];
  if (!qword_254D8C3D8[0])
  {
    result = MEMORY[0x2199D7540](&unk_214857414, &type metadata for SKStepPhotoPickerFinishRequestMessage.CodingKeys);
    atomic_store(result, qword_254D8C3D8);
  }
  return result;
}

unint64_t sub_2147F9928()
{
  unint64_t result;

  result = qword_254D8C460;
  if (!qword_254D8C460)
  {
    result = MEMORY[0x2199D7540](&unk_214857334, &type metadata for SKStepPhotoPickerFinishRequestMessage.ResponseMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8C460);
  }
  return result;
}

unint64_t sub_2147F9970()
{
  unint64_t result;

  result = qword_254D8C468[0];
  if (!qword_254D8C468[0])
  {
    result = MEMORY[0x2199D7540](&unk_21485735C, &type metadata for SKStepPhotoPickerFinishRequestMessage.ResponseMessage.CodingKeys);
    atomic_store(result, qword_254D8C468);
  }
  return result;
}

unint64_t sub_2147F99B8()
{
  unint64_t result;

  result = qword_254D8C4F0;
  if (!qword_254D8C4F0)
  {
    result = MEMORY[0x2199D7540](&unk_21485727C, &type metadata for SKStepPhotoPickerFinishConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8C4F0);
  }
  return result;
}

unint64_t sub_2147F9A00()
{
  unint64_t result;

  result = qword_254D8C4F8[0];
  if (!qword_254D8C4F8[0])
  {
    result = MEMORY[0x2199D7540](&unk_2148572A4, &type metadata for SKStepPhotoPickerFinishConfiguration.CodingKeys);
    atomic_store(result, qword_254D8C4F8);
  }
  return result;
}

unint64_t sub_2147F9A48()
{
  unint64_t result;

  result = qword_254D8C580;
  if (!qword_254D8C580)
  {
    result = MEMORY[0x2199D7540](&unk_2148571C4, &type metadata for SKStepPhotoPickerTransferFileRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8C580);
  }
  return result;
}

unint64_t sub_2147F9A90()
{
  unint64_t result;

  result = qword_254D8C588[0];
  if (!qword_254D8C588[0])
  {
    result = MEMORY[0x2199D7540](&unk_2148571EC, &type metadata for SKStepPhotoPickerTransferFileRequestMessage.CodingKeys);
    atomic_store(result, qword_254D8C588);
  }
  return result;
}

unint64_t sub_2147F9AD8()
{
  unint64_t result;

  result = qword_254D8C610;
  if (!qword_254D8C610)
  {
    result = MEMORY[0x2199D7540](&unk_21485710C, &type metadata for SKStepPhotoPickerStartRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8C610);
  }
  return result;
}

unint64_t sub_2147F9B20()
{
  unint64_t result;

  result = qword_254D8C618[0];
  if (!qword_254D8C618[0])
  {
    result = MEMORY[0x2199D7540](&unk_214857134, &type metadata for SKStepPhotoPickerStartRequestMessage.CodingKeys);
    atomic_store(result, qword_254D8C618);
  }
  return result;
}

unint64_t sub_2147F9B68()
{
  unint64_t result;

  result = qword_254D8C6A0;
  if (!qword_254D8C6A0)
  {
    result = MEMORY[0x2199D7540](&unk_214857054, &type metadata for SKStepPhotoPickerStartConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8C6A0);
  }
  return result;
}

unint64_t sub_2147F9BB0()
{
  unint64_t result;

  result = qword_254D8C6A8[0];
  if (!qword_254D8C6A8[0])
  {
    result = MEMORY[0x2199D7540](&unk_21485707C, &type metadata for SKStepPhotoPickerStartConfiguration.CodingKeys);
    atomic_store(result, qword_254D8C6A8);
  }
  return result;
}

uint64_t sub_2147F9BF4(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD00000000000001ALL && a2 == 0x800000021485CFD0 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000021485CFF0 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F7065526B636F6DLL && a2 == 0xEA00000000007472 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000021485D010)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v5 = sub_214852B18();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_2147F9DA8(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000016 && a2 == 0x800000021485D030 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000021485CFB0 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000021485D050)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v5 = sub_214852B18();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_2147F9EE8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2147F9F0C(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int *v8;
  _QWORD *v9;

  v8 = *(int **)(v3 + 16);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_2147F4FF0;
  return ((uint64_t (*)(uint64_t, _OWORD *, uint64_t, int *))((char *)&dword_254D884B0 + dword_254D884B0))(a1, a2, a3, v8);
}

uint64_t sub_2147F9F94(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2199D7540](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2147F9FD4()
{
  unint64_t result;

  result = qword_254D884D0;
  if (!qword_254D884D0)
  {
    result = MEMORY[0x2199D7540](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_254D884D0);
  }
  return result;
}

uint64_t sub_2147FA058()
{
  uint64_t v0;

  v0 = sub_214852494();
  __swift_allocate_value_buffer(v0, qword_254D8C738);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D8C738);
  sub_214801FC0();
  swift_bridgeObjectRetain();
  return sub_214852488();
}

uint64_t SKStepPhotoPickerServer.environment.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 32);
  return swift_bridgeObjectRetain();
}

uint64_t SKStepPhotoPickerServer.__allocating_init(server:environment:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = swift_allocObject();
  v4 = *a2;
  *(_OWORD *)(v3 + 16) = xmmword_2148577A0;
  *(_QWORD *)(v3 + 48) = 0;
  *(_QWORD *)(v3 + 56) = 0;
  *(_QWORD *)(v3 + 40) = 0;
  *(_OWORD *)(v3 + 64) = xmmword_214857790;
  *(_BYTE *)(v3 + 80) = 0;
  swift_weakInit();
  *(_BYTE *)(v3 + 96) = 0;
  *(_QWORD *)(v3 + 104) = MEMORY[0x24BEE4AF8];
  v5 = v3 + OBJC_IVAR____TtC8SetupKit23SKStepPhotoPickerServer__transferredURLsParentURL;
  v6 = sub_214852368();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC8SetupKit23SKStepPhotoPickerServer__eventContinuations) = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v3 + 32) = v4;
  swift_weakAssign();
  swift_release();
  return v3;
}

uint64_t SKStepPhotoPickerServer.init(server:environment:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a2;
  *(_OWORD *)(v2 + 16) = xmmword_2148577A0;
  *(_QWORD *)(v2 + 48) = 0;
  *(_QWORD *)(v2 + 56) = 0;
  *(_QWORD *)(v2 + 40) = 0;
  *(_OWORD *)(v2 + 64) = xmmword_214857790;
  *(_BYTE *)(v2 + 80) = 0;
  swift_weakInit();
  *(_BYTE *)(v2 + 96) = 0;
  *(_QWORD *)(v2 + 104) = MEMORY[0x24BEE4AF8];
  v4 = v2 + OBJC_IVAR____TtC8SetupKit23SKStepPhotoPickerServer__transferredURLsParentURL;
  v5 = sub_214852368();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC8SetupKit23SKStepPhotoPickerServer__eventContinuations) = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v2 + 32) = v3;
  swift_weakAssign();
  swift_release();
  return v2;
}

uint64_t SKStepPhotoPickerServer.start()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[7] = v0;
  sub_2147F9F94(&qword_254D884E0, type metadata accessor for SKStepPhotoPickerServer, (uint64_t)&protocol conformance descriptor for SKStepPhotoPickerServer);
  v1[8] = sub_2148527C4();
  v1[9] = v2;
  return swift_task_switch();
}

uint64_t sub_2147FA314()
{
  _QWORD *v0;
  uint64_t (*v1)(void);
  uint64_t Strong;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9[9];

  if ((*(_BYTE *)(v0[7] + 96) & 1) != 0)
  {
    v1 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    Strong = swift_weakLoadStrong();
    v0[10] = Strong;
    if (Strong)
    {
      v0[11] = *(_QWORD *)(Strong + OBJC_IVAR____TtC8SetupKit8SKServer_nexusSession);
      v3 = swift_allocObject();
      swift_weakInit();
      swift_retain();
      v4 = nullsub_1(&unk_254D884F0, v3);
      v6 = v5;
      v0[5] = &type metadata for SKStepPhotoPickerStartRequestHandler;
      v0[6] = sub_2147FAAA4();
      v0[2] = v4;
      v0[3] = v6;
      sub_21485262C();
      sub_2147F9F94(&qword_254D88200, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC80], MEMORY[0x24BE6DC90]);
      v0[12] = sub_2148527C4();
      v0[13] = v7;
      return swift_task_switch();
    }
    v9[0] = 2;
    type metadata accessor for SKError();
    SKError.__allocating_init(_:_:_:)((uint64_t)v9, 0x7265534B53206F4ELL, 0xEB00000000726576, 0);
    swift_willThrow();
    v1 = (uint64_t (*)(void))v0[1];
  }
  return v1();
}

uint64_t sub_2147FA488()
{
  uint64_t v0;

  sub_21485259C();
  *(_QWORD *)(v0 + 112) = 0;
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return swift_task_switch();
}

uint64_t sub_2147FA4F4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = swift_allocObject();
  swift_weakInit();
  v2 = j_nullsub_1(&unk_254D88508, v1);
  v4 = v3;
  v0[5] = &type metadata for SKStepPhotoPickerTransferFileRequestHandler;
  v0[6] = sub_2147FB4CC();
  v0[2] = v2;
  v0[3] = v4;
  return swift_task_switch();
}

uint64_t sub_2147FA57C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  sub_21485259C();
  *(_QWORD *)(v0 + 120) = v1;
  if (!v1)
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return swift_task_switch();
}

uint64_t sub_2147FA5E8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = swift_allocObject();
  swift_weakInit();
  v2 = j_nullsub_1(&unk_254D88520, v1);
  v4 = v3;
  v0[5] = &type metadata for SKStepPhotoPickerFinishRequestHandler;
  v0[6] = sub_2147FC148();
  v0[2] = v2;
  v0[3] = v4;
  return swift_task_switch();
}

uint64_t sub_2147FA670()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 120);
  sub_21485259C();
  *(_QWORD *)(v0 + 128) = v1;
  if (!v1)
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return swift_task_switch();
}

uint64_t sub_2147FA6DC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_release();
  swift_release();
  *(_BYTE *)(v1 + 96) = 1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2147FA724()
{
  uint64_t v0;

  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2147FA76C()
{
  uint64_t v0;

  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2147FA7B4()
{
  uint64_t v0;

  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for SKStepPhotoPickerServer(uint64_t a1)
{
  return sub_2147FC1A0(a1, (uint64_t *)&unk_254D8C8E0);
}

uint64_t sub_2147FA810()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2147FA834(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 56) = a1;
  *(_QWORD *)(v4 + 64) = a4;
  *(_OWORD *)(v4 + 72) = *a2;
  return swift_task_switch();
}

uint64_t sub_2147FA854()
{
  uint64_t v0;
  uint64_t Strong;
  uint64_t v2;
  _QWORD *v3;
  char v5[9];

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 88) = Strong;
  if (Strong)
  {
    v2 = *(_QWORD *)(v0 + 80);
    *(_QWORD *)(v0 + 40) = *(_QWORD *)(v0 + 72);
    *(_QWORD *)(v0 + 48) = v2;
    swift_bridgeObjectRetain();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v3;
    *v3 = v0;
    v3[1] = sub_2147FA948;
    return SKStepPhotoPickerServer.handleStart(configuration:)((_OWORD *)(v0 + 40));
  }
  else
  {
    v5[0] = 1;
    type metadata accessor for SKError();
    SKError.__allocating_init(_:_:_:)((uint64_t)v5, 0x6720726576726553, 0xEB00000000656E6FLL, 0);
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2147FA948()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_2147FA9BC()
{
  uint64_t v0;

  sub_214852518();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2147FA9FC()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2147FAA30(uint64_t a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;

  v6 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *(_QWORD *)v6 = v3;
  *(_QWORD *)(v6 + 8) = sub_2147F4FF0;
  *(_QWORD *)(v6 + 56) = a1;
  *(_QWORD *)(v6 + 64) = v2;
  *(_OWORD *)(v6 + 72) = *a2;
  return swift_task_switch();
}

unint64_t sub_2147FAAA4()
{
  unint64_t result;

  result = qword_254D884F8;
  if (!qword_254D884F8)
  {
    result = MEMORY[0x2199D7540](&unk_2148569E0, &type metadata for SKStepPhotoPickerStartRequestHandler);
    atomic_store(result, &qword_254D884F8);
  }
  return result;
}

uint64_t SKStepPhotoPickerServer.handleStart(configuration:)(_OWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v2 + 136) = v1;
  *(_QWORD *)(v2 + 144) = type metadata accessor for SKStepPhotoPickerServer.Event(0);
  *(_QWORD *)(v2 + 152) = swift_task_alloc();
  v4 = sub_2148523E0();
  *(_QWORD *)(v2 + 160) = v4;
  *(_QWORD *)(v2 + 168) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 176) = swift_task_alloc();
  v5 = sub_214852368();
  *(_QWORD *)(v2 + 184) = v5;
  *(_QWORD *)(v2 + 192) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v2 + 200) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88538);
  *(_QWORD *)(v2 + 208) = swift_task_alloc();
  *(_OWORD *)(v2 + 216) = *a1;
  sub_2147F9F94(&qword_254D884E0, type metadata accessor for SKStepPhotoPickerServer, (uint64_t)&protocol conformance descriptor for SKStepPhotoPickerServer);
  sub_2148527C4();
  return swift_task_switch();
}

uint64_t sub_2147FAC00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v1 + 24);
  v42 = v1;
  if (v2 == 1)
  {
    if (qword_254D8C730 != -1)
      swift_once();
    v3 = sub_214852494();
    __swift_project_value_buffer(v3, (uint64_t)qword_254D8C738);
    swift_bridgeObjectRetain_n();
    v4 = sub_21485247C();
    v5 = sub_2148528D8();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = *(_QWORD *)(v0 + 216);
      v7 = *(_QWORD *)(v0 + 224);
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v43 = v9;
      *(_DWORD *)v8 = 136315138;
      *(_QWORD *)(v0 + 64) = v6;
      *(_QWORD *)(v0 + 72) = v7;
      sub_2147FE598();
      v10 = sub_214852B00();
      *(_QWORD *)(v0 + 112) = sub_2147F3D14(v10, v11, &v43);
      sub_21485292C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2147EE000, v4, v5, "handleStart: configuration=%s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199D75E8](v9, -1, -1);
      MEMORY[0x2199D75E8](v8, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

  }
  else
  {
    v12 = *(_QWORD *)(v1 + 16);
    v13 = qword_254D8C730;
    swift_bridgeObjectRetain();
    if (v13 != -1)
      swift_once();
    v14 = sub_214852494();
    __swift_project_value_buffer(v14, (uint64_t)qword_254D8C738);
    swift_bridgeObjectRetain();
    sub_2147FE5DC(v12, v2);
    swift_bridgeObjectRetain();
    v15 = sub_21485247C();
    v16 = sub_2148528D8();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = *(_QWORD *)(v0 + 216);
      v18 = *(_QWORD *)(v0 + 224);
      v19 = swift_slowAlloc();
      v40 = swift_slowAlloc();
      v43 = v40;
      *(_DWORD *)v19 = 136315394;
      *(_QWORD *)(v0 + 80) = v17;
      *(_QWORD *)(v0 + 88) = v18;
      sub_2147FE598();
      v20 = sub_214852B00();
      *(_QWORD *)(v0 + 120) = sub_2147F3D14(v20, v21, &v43);
      sub_21485292C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v19 + 12) = 2080;
      *(_QWORD *)(v0 + 96) = v12;
      *(_QWORD *)(v0 + 104) = v2;
      v22 = sub_214852B00();
      *(_QWORD *)(v0 + 128) = sub_2147F3D14(v22, v23, &v43);
      sub_21485292C();
      swift_bridgeObjectRelease();
      sub_2147FC1D4(v12, v2);
      sub_2147FC1D4(v12, v2);
      _os_log_impl(&dword_2147EE000, v15, v16, "handleStart: configuration=%s, oldConfiguration=%s", (uint8_t *)v19, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2199D75E8](v40, -1, -1);
      MEMORY[0x2199D75E8](v19, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      sub_2147FC1D4(v12, v2);
      sub_2147FC1D4(v12, v2);
    }

  }
  v41 = *(_QWORD *)(v0 + 224);
  v24 = *(_QWORD *)(v0 + 200);
  v25 = *(_QWORD *)(v0 + 208);
  v26 = *(_QWORD *)(v0 + 176);
  v38 = *(_QWORD *)(v0 + 184);
  v39 = *(_QWORD *)(v0 + 216);
  v27 = *(_QWORD *)(v0 + 160);
  v36 = *(_QWORD *)(v0 + 168);
  v37 = *(_QWORD *)(v0 + 192);
  v28 = *(_QWORD **)(v0 + 152);
  v29 = *(_QWORD *)(v0 + 136);
  v31 = *(_QWORD *)(v42 + 16);
  v30 = *(_QWORD *)(v42 + 24);
  *(_QWORD *)(v42 + 16) = v39;
  *(_QWORD *)(v42 + 24) = v41;
  swift_bridgeObjectRetain();
  sub_2147FC1D4(v31, v30);
  swift_beginAccess();
  *(_QWORD *)(v29 + 104) = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  v32 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v33 = objc_msgSend(v32, sel_temporaryDirectory);

  sub_21485235C();
  v43 = 0;
  v44 = 0xE000000000000000;
  sub_21485298C();
  swift_bridgeObjectRelease();
  v43 = 0xD000000000000012;
  v44 = 0x800000021485D070;
  sub_2148523D4();
  sub_2147F9F94(&qword_254D88540, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  sub_214852B00();
  sub_214852704();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v26, v27);
  sub_214852344();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v24, v38);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v37 + 56))(v25, 0, 1, v38);
  v34 = v29 + OBJC_IVAR____TtC8SetupKit23SKStepPhotoPickerServer__transferredURLsParentURL;
  swift_beginAccess();
  sub_2147FC1E8(v25, v34);
  swift_endAccess();
  *v28 = v39;
  v28[1] = v41;
  swift_storeEnumTagMultiPayload();
  swift_bridgeObjectRetain();
  SKStepPhotoPickerServer._report(event:)((uint64_t)v28);
  sub_2147FE778((uint64_t)v28, type metadata accessor for SKStepPhotoPickerServer.Event);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2147FB250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[6] = a2;
  v4[7] = a4;
  v4[5] = a1;
  return swift_task_switch();
}

uint64_t sub_2147FB26C()
{
  uint64_t v0;
  uint64_t Strong;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v11[9];

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 64) = Strong;
  if (Strong)
  {
    v2 = *(uint64_t **)(v0 + 48);
    v3 = v2[2];
    v4 = v2[3];
    v5 = v2[4];
    v6 = v2[5];
    v7 = *v2;
    v8 = v2[1];
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v9;
    *v9 = v0;
    v9[1] = sub_2147FB384;
    return SKStepPhotoPickerServer.handleTransferFile(filename:fileOffset:fileSize:fileData:)(v3, v4, v5, v6, v7, v8);
  }
  else
  {
    v11[0] = 1;
    type metadata accessor for SKError();
    SKError.__allocating_init(_:_:_:)((uint64_t)v11, 0x6720726576726553, 0xEB00000000656E6FLL, 0);
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2147FB384()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2147FB3E8()
{
  uint64_t v0;

  sub_214852518();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2147FB428()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2147FB45C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_2147FA024;
  v6[6] = a2;
  v6[7] = v2;
  v6[5] = a1;
  return swift_task_switch();
}

unint64_t sub_2147FB4CC()
{
  unint64_t result;

  result = qword_254D88510;
  if (!qword_254D88510)
  {
    result = MEMORY[0x2199D7540](&unk_214856B30, &type metadata for SKStepPhotoPickerTransferFileRequestHandler);
    atomic_store(result, &qword_254D88510);
  }
  return result;
}

uint64_t SKStepPhotoPickerServer.handleTransferFile(filename:fileOffset:fileSize:fileData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v7[18] = a6;
  v7[19] = v6;
  v7[16] = a4;
  v7[17] = a5;
  v7[14] = a2;
  v7[15] = a3;
  v7[13] = a1;
  v7[20] = type metadata accessor for SKStepPhotoPickerServer.Event(0);
  v7[21] = swift_task_alloc();
  v8 = sub_2148523E0();
  v7[22] = v8;
  v7[23] = *(_QWORD *)(v8 - 8);
  v7[24] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88538);
  v7[25] = swift_task_alloc();
  v9 = sub_214852368();
  v7[26] = v9;
  v7[27] = *(_QWORD *)(v9 - 8);
  v7[28] = swift_task_alloc();
  v7[29] = swift_task_alloc();
  v7[30] = swift_task_alloc();
  v7[31] = swift_task_alloc();
  sub_2147F9F94(&qword_254D884E0, type metadata accessor for SKStepPhotoPickerServer, (uint64_t)&protocol conformance descriptor for SKStepPhotoPickerServer);
  sub_2148527C4();
  return swift_task_switch();
}

uint64_t sub_2147FB67C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  unsigned int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t (*v28)(void);
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, uint64_t);
  unint64_t *v32;
  unint64_t v33;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void (*v47)(_QWORD);
  uint64_t v48[3];

  v48[2] = *MEMORY[0x24BDAC8D0];
  v1 = v0[26];
  v2 = v0[27];
  v3 = v0[25];
  v4 = v0[19] + OBJC_IVAR____TtC8SetupKit23SKStepPhotoPickerServer__transferredURLsParentURL;
  swift_beginAccess();
  sub_2147FE5F0(v4, v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_2147F275C(v0[25], &qword_254D88538);
    type metadata accessor for SKError();
    LOBYTE(v48[0]) = 1;
    SKError.__allocating_init(_:_:_:)((uint64_t)v48, 0xD00000000000001BLL, 0x800000021485D090, 0);
    swift_willThrow();
LABEL_10:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v28 = (uint64_t (*)(void))v0[1];
    return v28();
  }
  v47 = *(void (**)(_QWORD))(v0[27] + 32);
  ((void (*)(_QWORD, _QWORD, _QWORD))v47)(v0[31], v0[25], v0[26]);
  if (qword_254D8C730 != -1)
    swift_once();
  v5 = v0[17];
  v6 = v0[18];
  v7 = sub_214852494();
  __swift_project_value_buffer(v7, (uint64_t)qword_254D8C738);
  swift_bridgeObjectRetain();
  sub_2147F51E4(v5, v6);
  swift_bridgeObjectRetain();
  sub_2147F51E4(v5, v6);
  v8 = sub_21485247C();
  LOBYTE(v5) = sub_2148528D8();
  v9 = os_log_type_enabled(v8, (os_log_type_t)v5);
  v10 = v0[18];
  if (v9)
  {
    v11 = v0[13];
    v12 = v0[14];
    v44 = v0[15];
    v45 = v0[16];
    v46 = v10 >> 62;
    v13 = swift_slowAlloc();
    v48[0] = swift_slowAlloc();
    *(_DWORD *)v13 = 136315906;
    swift_bridgeObjectRetain();
    v0[9] = sub_2147F3D14(v11, v12, v48);
    sub_21485292C();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 12) = 2048;
    v0[10] = v44;
    sub_21485292C();
    *(_WORD *)(v13 + 22) = 2048;
    v0[11] = v45;
    sub_21485292C();
    *(_WORD *)(v13 + 32) = 2048;
    __asm { BR              X9 }
  }
  v14 = v0[17];
  sub_2147F8898(v14, v0[18]);
  swift_bridgeObjectRelease_n();
  sub_2147F8898(v14, v10);

  v15 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v16 = (void *)sub_214852338();
  v0[8] = 0;
  v17 = objc_msgSend(v15, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v16, 1, 0, v0 + 8);

  v18 = (void *)v0[8];
  v19 = v0[31];
  if (!v17)
  {
    v25 = v0[26];
    v26 = v0[27];
    v27 = v18;
    sub_214852320();

    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v19, v25);
    goto LABEL_10;
  }
  v20 = v0[23];
  v21 = v0[24];
  v22 = v0[22];
  v23 = v18;
  sub_2148523D4();
  sub_2147F9F94(&qword_254D88540, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  v48[0] = sub_214852B00();
  v48[1] = v24;
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v22);
  sub_214852704();
  sub_214852704();
  sub_214852344();
  swift_bridgeObjectRelease();
  sub_2148523BC();
  v30 = v0[19];
  v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[27] + 16);
  v31(v0[29], v0[30], v0[26]);
  v32 = (unint64_t *)(v30 + 104);
  swift_beginAccess();
  v33 = *(_QWORD *)(v30 + 104);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v30 + 104) = v33;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v33 = sub_2147FE390(0, *(_QWORD *)(v33 + 16) + 1, 1, v33);
    *v32 = v33;
  }
  v36 = *(_QWORD *)(v33 + 16);
  v35 = *(_QWORD *)(v33 + 24);
  if (v36 >= v35 >> 1)
  {
    v33 = sub_2147FE390(v35 > 1, v36 + 1, 1, v33);
    *v32 = v33;
  }
  v37 = v0[30];
  v38 = v0[28];
  v39 = v0[26];
  v40 = v0[27];
  v43 = v0[31];
  v41 = v0[21];
  *(_QWORD *)(v33 + 16) = v36 + 1;
  v47(v33+ ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80))+ *(_QWORD *)(v40 + 72) * v36);
  swift_endAccess();
  v31(v38, v37, v39);
  sub_2147F50F0(v38, v41);
  swift_storeEnumTagMultiPayload();
  SKStepPhotoPickerServer._report(event:)(v41);
  sub_2147FE778(v41, type metadata accessor for SKStepPhotoPickerServer.Event);
  v42 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
  v42(v37, v39);
  v42(v43, v39);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v28 = (uint64_t (*)(void))v0[1];
  return v28();
}

uint64_t sub_2147FBE10(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v4 + 176) = a1;
  *(_QWORD *)(v4 + 184) = a4;
  v5 = *a2;
  *(_BYTE *)(v4 + 145) = *((_BYTE *)a2 + 8);
  v6 = a2[2];
  *(_QWORD *)(v4 + 192) = v5;
  *(_QWORD *)(v4 + 200) = v6;
  *(_BYTE *)(v4 + 146) = *((_BYTE *)a2 + 24);
  v7 = *((_OWORD *)a2 + 3);
  *(_OWORD *)(v4 + 208) = *((_OWORD *)a2 + 2);
  *(_OWORD *)(v4 + 224) = v7;
  v8 = a2[8];
  *(_BYTE *)(v4 + 147) = *((_BYTE *)a2 + 72);
  v9 = a2[10];
  *(_QWORD *)(v4 + 240) = v8;
  *(_QWORD *)(v4 + 248) = v9;
  return swift_task_switch();
}

uint64_t sub_2147FBE60()
{
  uint64_t v0;
  uint64_t Strong;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  _QWORD *v10;
  char v12[9];

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 256) = Strong;
  if (Strong)
  {
    v2 = *(_QWORD *)(v0 + 240);
    v3 = *(_QWORD *)(v0 + 248);
    v4 = *(_QWORD *)(v0 + 224);
    v5 = *(_QWORD *)(v0 + 232);
    v6 = *(_QWORD *)(v0 + 208);
    v7 = *(_QWORD *)(v0 + 216);
    v8 = *(_BYTE *)(v0 + 146);
    v9 = *(_QWORD *)(v0 + 200);
    *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 192);
    *(_BYTE *)(v0 + 24) = *(_BYTE *)(v0 + 145);
    *(_QWORD *)(v0 + 32) = v9;
    *(_BYTE *)(v0 + 40) = v8;
    *(_QWORD *)(v0 + 48) = v6;
    *(_QWORD *)(v0 + 56) = v7;
    *(_QWORD *)(v0 + 64) = v4;
    *(_QWORD *)(v0 + 72) = v5;
    *(_QWORD *)(v0 + 80) = v2;
    *(_BYTE *)(v0 + 88) = *(_BYTE *)(v0 + 147);
    *(_QWORD *)(v0 + 96) = v3;
    sub_2147F7A0C(v6, v7, v4, v5);
    swift_bridgeObjectRetain();
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 264) = v10;
    *v10 = v0;
    v10[1] = sub_2147FBFA8;
    return SKStepPhotoPickerServer.handleFinish(configuration:)(v0 + 104, (uint64_t *)(v0 + 16));
  }
  else
  {
    v12[0] = 1;
    type metadata accessor for SKError();
    SKError.__allocating_init(_:_:_:)((uint64_t)v12, 0x6720726576726553, 0xEB00000000656E6FLL, 0);
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2147FBFA8()
{
  uint64_t v0;
  uint64_t **v1;
  uint64_t *v2;

  v2 = *v1;
  (*v1)[34] = v0;
  swift_task_dealloc();
  sub_2147F7A20(v2[26], v2[27], v2[28], v2[29]);
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_2147FC044()
{
  uint64_t v0;
  __n128 *v1;
  unsigned __int8 v2;
  uint64_t v3;
  char v4;
  __n128 v5;
  __n128 v7[2];
  uint64_t v8;
  char v9;

  v1 = *(__n128 **)(v0 + 176);
  v2 = *(_BYTE *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 136);
  v4 = *(_BYTE *)(v0 + 144);
  v5 = *(__n128 *)(v0 + 120);
  v7[0].n128_u64[0] = *(_QWORD *)(v0 + 104);
  v7[0].n128_u8[8] = v2;
  v7[1] = v5;
  v8 = v3;
  v9 = v4;
  sub_2147F65F8(v7, v1);
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2147FC0B0()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2147FC0E4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t v7;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_2147FA024;
  return sub_2147FBE10(a1, a2, v7, v2);
}

unint64_t sub_2147FC148()
{
  unint64_t result;

  result = qword_254D88528;
  if (!qword_254D88528)
  {
    result = MEMORY[0x2199D7540](&unk_214856D68, &type metadata for SKStepPhotoPickerFinishRequestHandler);
    atomic_store(result, (unint64_t *)&qword_254D88528);
  }
  return result;
}

uint64_t type metadata accessor for SKStepPhotoPickerServer.Event(uint64_t a1)
{
  return sub_2147FC1A0(a1, (uint64_t *)&unk_254D8C8F0);
}

uint64_t sub_2147FC1A0(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2147FC1D4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_2147FC1E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88538);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t SKStepPhotoPickerServer.handleFinish(configuration:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v3 + 160) = a1;
  *(_QWORD *)(v3 + 168) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88538);
  *(_QWORD *)(v3 + 176) = swift_task_alloc();
  *(_QWORD *)(v3 + 184) = type metadata accessor for SKStepPhotoPickerServer.Event(0);
  v5 = swift_task_alloc();
  v6 = *((_OWORD *)a2 + 3);
  *(_OWORD *)(v3 + 216) = *((_OWORD *)a2 + 2);
  v7 = *a2;
  *(_QWORD *)(v3 + 192) = v5;
  *(_QWORD *)(v3 + 200) = v7;
  *(_BYTE *)(v3 + 264) = *((_BYTE *)a2 + 8);
  *(_QWORD *)(v3 + 208) = a2[2];
  *(_BYTE *)(v3 + 265) = *((_BYTE *)a2 + 24);
  *(_OWORD *)(v3 + 232) = v6;
  *(_BYTE *)(v3 + 266) = *((_BYTE *)a2 + 72);
  v8 = a2[10];
  *(_QWORD *)(v3 + 248) = a2[8];
  *(_QWORD *)(v3 + 256) = v8;
  sub_2147F9F94(&qword_254D884E0, type metadata accessor for SKStepPhotoPickerServer, (uint64_t)&protocol conformance descriptor for SKStepPhotoPickerServer);
  sub_2148527C4();
  return swift_task_switch();
}

uint64_t sub_2147FC32C()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char value_low;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint8_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  NSObject *log;
  os_log_t loga;
  os_log_type_t type;
  uint64_t v49;
  SetupKit::SKStepPhotoPickerReport *v50;
  SetupKit::SKStepPhotoPickerReport *v51;
  uint64_t v52[2];

  if (*(_QWORD *)(*(_QWORD *)(v0 + 168) + 24) == 1)
  {
    type metadata accessor for SKError();
    LOBYTE(v52[0]) = 1;
    SKError.__allocating_init(_:_:_:)((uint64_t)v52, 0xD000000000000014, 0x800000021485D0B0, 0);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    v1 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    v49 = *(_QWORD *)(v0 + 168);
    if (qword_254D8C730 != -1)
      swift_once();
    v50 = (SetupKit::SKStepPhotoPickerReport *)(v0 + 264);
    v3 = *(_QWORD *)(v0 + 232);
    v2 = *(_QWORD *)(v0 + 240);
    v5 = *(_QWORD *)(v0 + 216);
    v4 = *(_QWORD *)(v0 + 224);
    v6 = sub_214852494();
    __swift_project_value_buffer(v6, (uint64_t)qword_254D8C738);
    sub_2147F7A0C(v5, v4, v3, v2);
    swift_bridgeObjectRetain();
    sub_2147F7A0C(v5, v4, v3, v2);
    swift_bridgeObjectRetain();
    v7 = sub_21485247C();
    v8 = sub_2148528D8();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = *(_QWORD *)(v0 + 240);
      v41 = *(_QWORD *)(v0 + 248);
      v43 = *(_QWORD *)(v0 + 256);
      v10 = *(_QWORD *)(v0 + 216);
      v36 = *(_QWORD *)(v0 + 224);
      v37 = *(_QWORD *)(v0 + 232);
      type = v8;
      v11 = *(_BYTE *)(v0 + 265);
      value_low = LOBYTE(v50->configurationApplyTime.value);
      log = v7;
      v14 = *(_QWORD *)(v0 + 200);
      v13 = *(_QWORD *)(v0 + 208);
      v15 = *(_BYTE *)(v0 + 266);
      v16 = (uint8_t *)swift_slowAlloc();
      v45 = swift_slowAlloc();
      v52[0] = v45;
      *(_DWORD *)v16 = 136315138;
      *(_QWORD *)(v0 + 16) = v14;
      *(_BYTE *)(v0 + 24) = value_low;
      *(_QWORD *)(v0 + 32) = v13;
      *(_BYTE *)(v0 + 40) = v11;
      *(_QWORD *)(v0 + 48) = v10;
      *(_QWORD *)(v0 + 56) = v36;
      *(_QWORD *)(v0 + 64) = v37;
      *(_QWORD *)(v0 + 72) = v9;
      *(_QWORD *)(v0 + 80) = v41;
      *(_BYTE *)(v0 + 88) = v15;
      *(_QWORD *)(v0 + 96) = v43;
      sub_2147FE638();
      v17 = sub_214852B00();
      *(_QWORD *)(v0 + 152) = sub_2147F3D14(v17, v18, v52);
      sub_21485292C();
      swift_bridgeObjectRelease();
      sub_2147F7A20(v10, v36, v37, v9);
      swift_bridgeObjectRelease();
      sub_2147F7A20(v10, v36, v37, v9);
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2147EE000, log, type, "handleFinish: configuration=%s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199D75E8](v45, -1, -1);
      MEMORY[0x2199D75E8](v16, -1, -1);

    }
    else
    {
      v19 = *(_QWORD *)(v0 + 240);
      v21 = *(_QWORD *)(v0 + 224);
      v20 = *(_QWORD *)(v0 + 232);
      v22 = *(_QWORD *)(v0 + 216);
      sub_2147F7A20(v22, v21, v20, v19);
      swift_bridgeObjectRelease();
      sub_2147F7A20(v22, v21, v20, v19);
      swift_bridgeObjectRelease();

    }
    v24 = *(_QWORD *)(v0 + 240);
    v23 = *(_QWORD *)(v0 + 248);
    v26 = *(_QWORD *)(v0 + 224);
    v25 = *(_QWORD *)(v0 + 232);
    v44 = *(_BYTE *)(v0 + 265);
    v27 = *(_QWORD *)(v0 + 216);
    v42 = *(_QWORD *)(v0 + 208);
    v40 = LOBYTE(v50->configurationApplyTime.value);
    v28 = *(_QWORD *)(v0 + 192);
    v39 = *(_QWORD *)(v0 + 200);
    v29 = *(_QWORD *)(v0 + 168);
    loga = *(os_log_t *)(v0 + 176);
    v51 = *(SetupKit::SKStepPhotoPickerReport **)(v0 + 160);
    v30 = *(_BYTE *)(v0 + 266);
    swift_beginAccess();
    v38 = *(_QWORD *)(v29 + 104);
    swift_bridgeObjectRetain();
    sub_2147F7A0C(v27, v26, v25, v24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2147F7A0C(v27, v26, v25, v24);
    swift_bridgeObjectRelease();
    sub_2147F7A0C(v27, v26, v25, v24);
    sub_2147F7A20(v27, v26, v25, v24);
    *(_QWORD *)v28 = v39;
    *(_BYTE *)(v28 + 8) = v40;
    *(_QWORD *)(v28 + 16) = v42;
    *(_BYTE *)(v28 + 24) = v44;
    *(_QWORD *)(v28 + 32) = v27;
    *(_QWORD *)(v28 + 40) = v26;
    *(_QWORD *)(v28 + 48) = v25;
    *(_QWORD *)(v28 + 56) = v24;
    *(_QWORD *)(v28 + 64) = v23;
    *(_BYTE *)(v28 + 72) = v30;
    *(_QWORD *)(v28 + 80) = v38;
    swift_storeEnumTagMultiPayload();
    SKStepPhotoPickerServer._report(event:)(v28);
    sub_2147FE778(v28, type metadata accessor for SKStepPhotoPickerServer.Event);
    v31 = *(_QWORD *)(v29 + 16);
    v32 = *(_QWORD *)(v49 + 24);
    *(_QWORD *)(v29 + 16) = 0;
    *(_QWORD *)(v49 + 24) = 1;
    sub_2147FC1D4(v31, v32);
    *(_QWORD *)(v29 + 104) = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRelease();
    v33 = sub_214852368();
    (*(void (**)(os_log_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(loga, 1, 1, v33);
    v34 = v29 + OBJC_IVAR____TtC8SetupKit23SKStepPhotoPickerServer__transferredURLsParentURL;
    swift_beginAccess();
    sub_2147FC1E8((uint64_t)loga, v34);
    swift_endAccess();
    SKStepPhotoPickerReport.init()(v51);
    sub_2147F7A20(v27, v26, v25, v24);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    v1 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v1();
}

uint64_t SKStepPhotoPickerServer.cancel()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[5] = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88570);
  v1[6] = v2;
  v1[7] = *(_QWORD *)(v2 - 8);
  v1[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88578);
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  sub_2147F9F94(&qword_254D884E0, type metadata accessor for SKStepPhotoPickerServer, (uint64_t)&protocol conformance descriptor for SKStepPhotoPickerServer);
  v1[11] = sub_2148527C4();
  v1[12] = v3;
  return swift_task_switch();
}

uint64_t sub_2147FC9E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t Strong;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  int64_t v29;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 40) + OBJC_IVAR____TtC8SetupKit23SKStepPhotoPickerServer__eventContinuations;
  swift_beginAccess();
  v3 = *(_QWORD *)v2;
  v27 = (_QWORD *)v2;
  v28 = *(_QWORD *)v2 + 64;
  v4 = -1;
  v5 = -1 << *(_BYTE *)(*(_QWORD *)v2 + 32);
  if (-v5 < 64)
    v4 = ~(-1 << -(char)v5);
  v6 = v4 & *(_QWORD *)(*(_QWORD *)v2 + 64);
  v29 = (unint64_t)(63 - v5) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  if (!v6)
    goto LABEL_8;
LABEL_6:
  v11 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  v12 = v11 | (v8 << 6);
  while (2)
  {
    v13 = *(char **)(v0 + 72);
    v14 = *(_QWORD *)(v0 + 48);
    *(_QWORD *)v13 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v12);
    v15 = *(_QWORD *)(v3 + 56) + *(_QWORD *)(v1 + 72) * v12;
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88580);
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(&v13[*(int *)(v16 + 48)], v15, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 0, 1, v16);
    while (1)
    {
      v22 = *(_QWORD *)(v0 + 80);
      sub_2147FE67C(*(_QWORD *)(v0 + 72), v22);
      v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88580);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 48))(v22, 1, v23) == 1)
      {
        swift_release();
        *v27 = MEMORY[0x24BEE4B00];
        swift_bridgeObjectRelease();
        Strong = swift_weakLoadStrong();
        if (Strong)
        {
          *(_QWORD *)(v0 + 104) = *(_QWORD *)(Strong + OBJC_IVAR____TtC8SetupKit8SKServer_nexusSession);
          swift_retain();
          swift_release();
          v25 = sub_2147F4B24();
          *(_QWORD *)(v0 + 112) = *v25;
          *(_QWORD *)(v0 + 120) = v25[1];
          sub_21485262C();
          sub_2147F9F94(&qword_254D88200, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC80], MEMORY[0x24BE6DC90]);
          swift_bridgeObjectRetain();
          *(_QWORD *)(v0 + 128) = sub_2148527C4();
          *(_QWORD *)(v0 + 136) = v26;
          return swift_task_switch();
        }
        else
        {
          *(_BYTE *)(*(_QWORD *)(v0 + 40) + 96) = 0;
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          return (*(uint64_t (**)(void))(v0 + 8))();
        }
      }
      v9 = *(_QWORD *)(v0 + 64);
      v10 = *(_QWORD *)(v0 + 48);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 32))(v9, *(_QWORD *)(v0 + 80) + *(int *)(v23 + 48), v10);
      sub_214852830();
      result = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v9, v10);
      if (v6)
        goto LABEL_6;
LABEL_8:
      v17 = v8 + 1;
      if (__OFADD__(v8, 1))
      {
        __break(1u);
        goto LABEL_31;
      }
      if (v17 < v29)
      {
        v18 = *(_QWORD *)(v28 + 8 * v17);
        if (v18)
          goto LABEL_11;
        v19 = v8 + 2;
        ++v8;
        if (v17 + 1 < v29)
        {
          v18 = *(_QWORD *)(v28 + 8 * v19);
          if (v18)
            goto LABEL_14;
          v8 = v17 + 1;
          if (v17 + 2 < v29)
          {
            v18 = *(_QWORD *)(v28 + 8 * (v17 + 2));
            if (v18)
            {
              v17 += 2;
              goto LABEL_11;
            }
            v19 = v17 + 3;
            v8 = v17 + 2;
            if (v17 + 3 < v29)
              break;
          }
        }
      }
LABEL_25:
      v20 = *(_QWORD *)(v0 + 72);
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88580);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v20, 1, 1, v21);
      v6 = 0;
    }
    v18 = *(_QWORD *)(v28 + 8 * v19);
    if (v18)
    {
LABEL_14:
      v17 = v19;
LABEL_11:
      v6 = (v18 - 1) & v18;
      v12 = __clz(__rbit64(v18)) + (v17 << 6);
      v8 = v17;
      continue;
    }
    break;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v29)
    {
      v8 = v29 - 1;
      goto LABEL_25;
    }
    v18 = *(_QWORD *)(v28 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_11;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_2147FCDC4()
{
  sub_2148525B4();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_2147FCE0C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = sub_2147F51D8();
  *(_QWORD *)(v0 + 144) = *v1;
  *(_QWORD *)(v0 + 152) = v1[1];
  swift_bridgeObjectRetain();
  return swift_task_switch();
}

uint64_t sub_2147FCE5C()
{
  sub_2148525B4();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_2147FCEA4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = sub_2147F6284();
  *(_QWORD *)(v0 + 160) = *v1;
  *(_QWORD *)(v0 + 168) = v1[1];
  swift_bridgeObjectRetain();
  return swift_task_switch();
}

uint64_t sub_2147FCEF4()
{
  sub_2148525B4();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_2147FCF3C()
{
  uint64_t v0;

  swift_release();
  *(_BYTE *)(*(_QWORD *)(v0 + 40) + 96) = 0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SKStepPhotoPickerServer._report(event:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t result;
  uint64_t *v24;
  __int128 v25;
  char *v26;
  char *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t);
  char *v35;
  int64_t v36;
  unint64_t v37;
  int64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  os_log_type_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  int64_t v52;
  uint64_t v53;
  int64_t v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  int64_t v64;
  char *v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;

  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88588);
  v62 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v59 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for SKStepPhotoPickerServer.Event(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v52 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88570);
  v67 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v65 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88578);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (int64_t *)((char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v13);
  v63 = (char *)&v52 - v16;
  v17 = (uint64_t *)(v1 + OBJC_IVAR____TtC8SetupKit23SKStepPhotoPickerServer__eventContinuations);
  swift_beginAccess();
  v18 = *v17;
  v19 = *(_QWORD *)(*v17 + 64);
  v53 = *v17 + 64;
  v20 = 1 << *(_BYTE *)(v18 + 32);
  v21 = -1;
  if (v20 < 64)
    v21 = ~(-1 << v20);
  v22 = v21 & v19;
  v54 = (unint64_t)(v20 + 63) >> 6;
  v52 = v54 - 1;
  v58 = v18;
  result = swift_bridgeObjectRetain();
  v64 = 0;
  v24 = (uint64_t *)&unk_254D88580;
  *(_QWORD *)&v25 = 134218242;
  v56 = v25;
  v55 = MEMORY[0x24BEE4AD8] + 8;
  v66 = v15;
  v57 = a1;
  v61 = v10;
  while (1)
  {
    if (v22)
    {
      v28 = __clz(__rbit64(v22));
      v22 &= v22 - 1;
      v29 = v28 | (v64 << 6);
LABEL_8:
      v30 = *(_QWORD *)(v58 + 56);
      *v15 = *(_QWORD *)(*(_QWORD *)(v58 + 48) + 8 * v29);
      v31 = v67;
      v32 = v30 + *(_QWORD *)(v67 + 72) * v29;
      v33 = __swift_instantiateConcreteTypeFromMangledName(v24);
      v34 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
      v15 = v66;
      v34((char *)v66 + *(int *)(v33 + 48), v32, v10);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v15, 0, 1, v33);
      v35 = v63;
      goto LABEL_27;
    }
    v36 = v64 + 1;
    if (__OFADD__(v64, 1))
    {
      __break(1u);
      goto LABEL_34;
    }
    v35 = v63;
    if (v36 < v54)
    {
      v37 = *(_QWORD *)(v53 + 8 * v36);
      if (v37)
        goto LABEL_12;
      v38 = v64 + 2;
      ++v64;
      if (v36 + 1 < v54)
      {
        v37 = *(_QWORD *)(v53 + 8 * v38);
        if (v37)
          goto LABEL_15;
        v64 = v36 + 1;
        if (v36 + 2 < v54)
        {
          v37 = *(_QWORD *)(v53 + 8 * (v36 + 2));
          if (v37)
          {
            v36 += 2;
            goto LABEL_12;
          }
          v38 = v36 + 3;
          v64 = v36 + 2;
          if (v36 + 3 < v54)
            break;
        }
      }
    }
LABEL_26:
    v39 = __swift_instantiateConcreteTypeFromMangledName(v24);
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v15, 1, 1, v39);
    v22 = 0;
LABEL_27:
    sub_2147FE67C((uint64_t)v15, (uint64_t)v35);
    v40 = v24;
    v41 = __swift_instantiateConcreteTypeFromMangledName(v24);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 48))(v35, 1, v41) == 1)
      return swift_release();
    v42 = *(_QWORD *)v35;
    (*(void (**)(char *, char *, uint64_t))(v67 + 32))(v65, &v35[*(int *)(v41 + 48)], v10);
    if (qword_254D8C730 != -1)
      swift_once();
    v43 = sub_214852494();
    __swift_project_value_buffer(v43, (uint64_t)qword_254D8C738);
    sub_2147FE6C4(a1, (uint64_t)v9);
    v44 = sub_21485247C();
    v45 = (uint64_t)v9;
    v46 = sub_2148528D8();
    if (os_log_type_enabled(v44, v46))
    {
      v47 = swift_slowAlloc();
      v48 = swift_slowAlloc();
      v68 = v48;
      *(_DWORD *)v47 = v56;
      *(_QWORD *)(v47 + 4) = v42;
      *(_WORD *)(v47 + 12) = 2080;
      v49 = SKStepPhotoPickerServer.Event.description.getter();
      *(_QWORD *)(v47 + 14) = sub_2147F3D14(v49, v50, &v68);
      swift_bridgeObjectRelease();
      sub_2147FE778(v45, type metadata accessor for SKStepPhotoPickerServer.Event);
      _os_log_impl(&dword_2147EE000, v44, v46, "event monitor report: id=%llu, event={%s}", (uint8_t *)v47, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2199D75E8](v48, -1, -1);
      v51 = v47;
      a1 = v57;
      MEMORY[0x2199D75E8](v51, -1, -1);
    }
    else
    {
      sub_2147FE778(v45, type metadata accessor for SKStepPhotoPickerServer.Event);
    }

    v9 = (char *)v45;
    v15 = v66;
    sub_2147FE6C4(a1, (uint64_t)v7);
    v26 = v59;
    v10 = v61;
    v27 = v65;
    sub_214852824();
    (*(void (**)(char *, uint64_t))(v62 + 8))(v26, v60);
    result = (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v27, v10);
    v24 = v40;
  }
  v37 = *(_QWORD *)(v53 + 8 * v38);
  if (v37)
  {
LABEL_15:
    v36 = v38;
LABEL_12:
    v22 = (v37 - 1) & v37;
    v29 = __clz(__rbit64(v37)) + (v36 << 6);
    v64 = v36;
    goto LABEL_8;
  }
  while (1)
  {
    v36 = v38 + 1;
    if (__OFADD__(v38, 1))
      break;
    if (v36 >= v54)
    {
      v64 = v52;
      goto LABEL_26;
    }
    v37 = *(_QWORD *)(v53 + 8 * v36);
    ++v38;
    if (v37)
      goto LABEL_12;
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t SKStepPhotoPickerServer.events.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
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
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;

  v2 = v1;
  v23[1] = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88590);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88598);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88570);
  v24 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = CUNextID64();
  if (qword_254D8C730 != -1)
    swift_once();
  v14 = sub_214852494();
  __swift_project_value_buffer(v14, (uint64_t)qword_254D8C738);
  v15 = sub_21485247C();
  v16 = sub_2148528B4();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v23[0] = v2;
    v18 = v17;
    *(_DWORD *)v17 = 134217984;
    v25 = v13;
    sub_21485292C();
    _os_log_impl(&dword_2147EE000, v15, v16, "event monitor start: id=%llu", v18, 0xCu);
    MEMORY[0x2199D75E8](v18, -1, -1);
  }

  type metadata accessor for SKStepPhotoPickerServer.Event(0);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BEE6A10], v6);
  sub_21485280C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v19 = v24;
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v5, v12, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v5, 0, 1, v10);
  swift_beginAccess();
  sub_2147FD844((uint64_t)v5, v13);
  swift_endAccess();
  v20 = swift_allocObject();
  swift_weakInit();
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v20;
  *(_QWORD *)(v21 + 24) = v13;
  sub_214852818();
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v12, v10);
}

uint64_t sub_2147FD844(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88590);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88570);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_2147F275C(a1, &qword_254D88590);
    v13 = sub_2147FE7B4(a2);
    if ((v14 & 1) != 0)
    {
      v15 = v13;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v17 = *v3;
      v22 = *v3;
      *v3 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_2147FEF38();
        v17 = v22;
      }
      (*(void (**)(char *, unint64_t, uint64_t))(v10 + 32))(v8, *(_QWORD *)(v17 + 56) + *(_QWORD *)(v10 + 72) * v15, v9);
      sub_2147FEB18(v15, v17);
      *v3 = v17;
      swift_bridgeObjectRelease();
      v18 = 0;
    }
    else
    {
      v18 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v18, 1, v9);
    return sub_2147F275C((uint64_t)v8, &qword_254D88590);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    v19 = swift_isUniquelyReferenced_nonNull_native();
    v22 = *v3;
    *v3 = 0x8000000000000000;
    sub_2147FECE4((uint64_t)v12, a2, v19);
    *v3 = v22;
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2147FDA20(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88728);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_214852800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v7;
  v8[5] = a2;
  sub_2147FDE8C((uint64_t)v5, (uint64_t)&unk_254D88738, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_2147FDB3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[6] = a4;
  v5[7] = a5;
  v5[5] = a1;
  return swift_task_switch();
}

uint64_t sub_2147FDB58()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 64) = Strong;
  if (Strong)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v2;
    *v2 = v0;
    v2[1] = sub_2147FDBF4;
    return sub_2147FDC6C(*(_QWORD *)(v0 + 56));
  }
  else
  {
    **(_BYTE **)(v0 + 40) = 1;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2147FDBF4()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2147FDC50()
{
  uint64_t v0;

  **(_BYTE **)(v0 + 40) = *(_QWORD *)(v0 + 64) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2147FDC6C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[6] = a1;
  v2[7] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88590);
  v2[8] = swift_task_alloc();
  sub_2147F9F94(&qword_254D884E0, type metadata accessor for SKStepPhotoPickerServer, (uint64_t)&protocol conformance descriptor for SKStepPhotoPickerServer);
  sub_2148527C4();
  return swift_task_switch();
}

uint64_t sub_2147FDCFC()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (qword_254D8C730 != -1)
    swift_once();
  v1 = sub_214852494();
  __swift_project_value_buffer(v1, (uint64_t)qword_254D8C738);
  v2 = sub_21485247C();
  v3 = sub_2148528B4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(_QWORD *)(v0 + 48);
    v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v5 = 134217984;
    *(_QWORD *)(v0 + 40) = v4;
    sub_21485292C();
    _os_log_impl(&dword_2147EE000, v2, v3, "event monitor cancel: id=%llu", v5, 0xCu);
    MEMORY[0x2199D75E8](v5, -1, -1);
  }

  v6 = *(_QWORD *)(v0 + 64);
  v7 = *(_QWORD *)(v0 + 48);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88570);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  swift_beginAccess();
  sub_2147FD844(v6, v7);
  swift_endAccess();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2147FDE8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_214852800();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2148527F4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2147F275C(a1, &qword_254D88728);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2148527C4();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88750);
  return swift_task_create();
}

unint64_t SKStepPhotoPickerServer.Event.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int EnumCaseMultiPayload;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;

  v1 = v0;
  v2 = type metadata accessor for SKStepPhotoPickerFileInfo();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for SKStepPhotoPickerServer.Event(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2147FE6C4(v1, (uint64_t)v7);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_2147FE734((uint64_t)v7, (uint64_t)v4);
      v25 = 0;
      v26 = 0xE000000000000000;
      sub_21485298C();
      swift_bridgeObjectRelease();
      v25 = 0xD000000000000011;
      v26 = 0x800000021485D0D0;
      sub_2147F9F94(&qword_254D885A0, (uint64_t (*)(uint64_t))type metadata accessor for SKStepPhotoPickerFileInfo, (uint64_t)&protocol conformance descriptor for SKStepPhotoPickerFileInfo);
      sub_214852B00();
      sub_214852704();
      swift_bridgeObjectRelease();
      v9 = v25;
      sub_2147FE778((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for SKStepPhotoPickerFileInfo);
    }
    else
    {
      v12 = *(_QWORD *)v7;
      v13 = v7[8];
      v14 = *((_QWORD *)v7 + 2);
      v15 = v7[24];
      v16 = *((_QWORD *)v7 + 4);
      v17 = *((_QWORD *)v7 + 5);
      v18 = *((_QWORD *)v7 + 6);
      v19 = *((_QWORD *)v7 + 7);
      v20 = *((_QWORD *)v7 + 8);
      v21 = *((_QWORD *)v7 + 10);
      v22 = v7[72];
      v36 = 0x64656873696E6966;
      v37 = 0xEA0000000000203ALL;
      v25 = v12;
      LOBYTE(v26) = v13;
      v27 = v14;
      v28 = v15;
      v29 = v16;
      v30 = v17;
      v31 = v18;
      v32 = v19;
      v33 = v20;
      v34 = v22;
      v35 = v21;
      sub_2147FE638();
      sub_214852B00();
      sub_214852704();
      swift_bridgeObjectRelease();
      sub_2147F7A20(v16, v17, v18, v19);
      swift_bridgeObjectRelease();
      return v36;
    }
  }
  else
  {
    v10 = *(_QWORD *)v7;
    v11 = *((_QWORD *)v7 + 1);
    v25 = 0x3A64657472617473;
    v26 = 0xE900000000000020;
    v36 = v10;
    v37 = v11;
    sub_2147FE598();
    sub_214852B00();
    sub_214852704();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v25;
  }
  return v9;
}

uint64_t *SKStepPhotoPickerServer.deinit()
{
  uint64_t *v0;

  sub_2147FC1D4(v0[2], v0[3]);
  swift_bridgeObjectRelease();
  sub_2147F7A20(v0[5], v0[6], v0[7], v0[8]);
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  sub_2147F275C((uint64_t)v0 + OBJC_IVAR____TtC8SetupKit23SKStepPhotoPickerServer__transferredURLsParentURL, &qword_254D88538);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SKStepPhotoPickerServer.__deallocating_deinit()
{
  uint64_t *v0;

  sub_2147FC1D4(v0[2], v0[3]);
  swift_bridgeObjectRelease();
  sub_2147F7A20(v0[5], v0[6], v0[7], v0[8]);
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  sub_2147F275C((uint64_t)v0 + OBJC_IVAR____TtC8SetupKit23SKStepPhotoPickerServer__transferredURLsParentURL, &qword_254D88538);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_2147FE36C()
{
  uint64_t *v0;

  return SKEnvironmental<>.unownedExecutor.getter(*v0, (uint64_t)&protocol witness table for SKStepPhotoPickerServer);
}

uint64_t sub_2147FE380@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(*(_QWORD *)v1 + 32);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2147FE390(char a1, int64_t a2, char a3, unint64_t a4)
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
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88768);
  v10 = *(_QWORD *)(sub_214852368() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_2148529E0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_214852368() - 8);
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
    sub_2147FF218(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

unint64_t sub_2147FE598()
{
  unint64_t result;

  result = qword_254D88548;
  if (!qword_254D88548)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepPhotoPickerStartConfiguration, &type metadata for SKStepPhotoPickerStartConfiguration);
    atomic_store(result, (unint64_t *)&qword_254D88548);
  }
  return result;
}

uint64_t sub_2147FE5DC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_2147FE5F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88538);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2147FE638()
{
  unint64_t result;

  result = qword_254D88560;
  if (!qword_254D88560)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepPhotoPickerFinishConfiguration, &type metadata for SKStepPhotoPickerFinishConfiguration);
    atomic_store(result, (unint64_t *)&qword_254D88560);
  }
  return result;
}

uint64_t sub_2147FE67C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88578);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2147FE6C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SKStepPhotoPickerServer.Event(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2147FE708()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2147FE72C()
{
  uint64_t v0;

  return sub_2147FDA20(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_2147FE734(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SKStepPhotoPickerFileInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2147FE778(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_2147FE7B4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_214852B78();
  return sub_2147FEE9C(a1, v2);
}

uint64_t sub_2147FE7E4(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  int v37;
  int64_t v38;
  _QWORD *v39;
  uint64_t v40;

  v3 = v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88570);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88760);
  result = sub_214852A10();
  v11 = result;
  if (*(_QWORD *)(v9 + 16))
  {
    v36 = v3;
    v12 = 0;
    v13 = *(_QWORD *)(v9 + 64);
    v39 = (_QWORD *)(v9 + 64);
    v14 = 1 << *(_BYTE *)(v9 + 32);
    if (v14 < 64)
      v15 = ~(-1 << v14);
    else
      v15 = -1;
    v16 = v15 & v13;
    v38 = (unint64_t)(v14 + 63) >> 6;
    v17 = result + 64;
    v37 = a2;
    v18 = 16;
    if ((a2 & 1) != 0)
      v18 = 32;
    v40 = v18;
    while (1)
    {
      if (v16)
      {
        v20 = __clz(__rbit64(v16));
        v16 &= v16 - 1;
        v21 = v20 | (v12 << 6);
      }
      else
      {
        v22 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = (uint64_t)v39;
        if (v22 >= v38)
          goto LABEL_33;
        v23 = v39[v22];
        ++v12;
        if (!v23)
        {
          v12 = v22 + 1;
          if (v22 + 1 >= v38)
            goto LABEL_33;
          v23 = v39[v12];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v38)
            {
LABEL_33:
              if ((v37 & 1) == 0)
              {
                result = swift_release();
                v3 = v36;
                goto LABEL_40;
              }
              v34 = 1 << *(_BYTE *)(v9 + 32);
              if (v34 >= 64)
                bzero(v39, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v39 = -1 << v34;
              v3 = v36;
              *(_QWORD *)(v9 + 16) = 0;
              break;
            }
            v23 = v39[v24];
            if (!v23)
            {
              while (1)
              {
                v12 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_42;
                if (v12 >= v38)
                  goto LABEL_33;
                v23 = v39[v12];
                ++v24;
                if (v23)
                  goto LABEL_23;
              }
            }
            v12 = v24;
          }
        }
LABEL_23:
        v16 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v12 << 6);
      }
      v25 = *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v21);
      v26 = *(_QWORD *)(v6 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + v40))(v8, *(_QWORD *)(v9 + 56) + v26 * v21, v5);
      result = sub_214852B78();
      v27 = -1 << *(_BYTE *)(v11 + 32);
      v28 = result & ~v27;
      v29 = v28 >> 6;
      if (((-1 << v28) & ~*(_QWORD *)(v17 + 8 * (v28 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v17 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v30 = 0;
        v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v32 = v29 == v31;
          if (v29 == v31)
            v29 = 0;
          v30 |= v32;
          v33 = *(_QWORD *)(v17 + 8 * v29);
        }
        while (v33 == -1);
        v19 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(_QWORD *)(v17 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      *(_QWORD *)(*(_QWORD *)(v11 + 48) + 8 * v19) = v25;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 56) + v26 * v19, v8, v5);
      ++*(_QWORD *)(v11 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v11;
  return result;
}

unint64_t sub_2147FEB18(unint64_t result, uint64_t a2)
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
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_21485295C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_QWORD *)(v9 + 8 * v6);
        result = sub_214852B78();
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
        v16 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254D88570) - 8) + 72);
        v17 = v16 * v3;
        result = v15 + v16 * v3;
        v18 = v16 * v6;
        v19 = v15 + v16 * v6 + v16;
        if (v17 < v18 || result >= v19)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v17 == v18)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    v23 = *v21;
    v22 = (-1 << result) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_2147FECE4(uint64_t a1, uint64_t a2, char a3)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  unint64_t v20;
  char v21;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_2147FE7B4(a2);
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
      {
LABEL_8:
        v17 = v16[7];
        v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88570);
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v10, a1, v18);
      }
      return sub_2147FEE0C(v10, a2, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_2147FEF38();
      goto LABEL_7;
    }
    sub_2147FE7E4(v13, a3 & 1);
    v20 = sub_2147FE7B4(a2);
    if ((v14 & 1) == (v21 & 1))
    {
      v10 = v20;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
      return sub_2147FEE0C(v10, a2, a1, v16);
    }
  }
  result = sub_214852B48();
  __break(1u);
  return result;
}

uint64_t sub_2147FEE0C(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  v7 = a4[7];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88570);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7 + *(_QWORD *)(*(_QWORD *)(v8 - 8) + 72) * a1, a3, v8);
  v10 = a4[2];
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
    __break(1u);
  else
    a4[2] = v12;
  return result;
}

unint64_t sub_2147FEE9C(uint64_t a1, uint64_t a2)
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

void *sub_2147FEF38()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int64_t v25;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88570);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88760);
  v23 = v0;
  v5 = *v0;
  v6 = sub_214852A04();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_23:
    result = (void *)swift_release();
    *v23 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v10 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v11 = 1 << *(_BYTE *)(v5 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v5 + 64);
  v24 = v5 + 64;
  v25 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25)
      goto LABEL_23;
    v20 = *(_QWORD *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v25)
        goto LABEL_23;
      v20 = *(_QWORD *)(v24 + 8 * v10);
      if (!v20)
        break;
    }
LABEL_22:
    v13 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v15);
    v18 = *(_QWORD *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 56) + v18, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v16) = v17;
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 56) + v18, v4, v1);
  }
  v21 = v19 + 2;
  if (v21 >= v25)
    goto LABEL_23;
  v20 = *(_QWORD *)(v24 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v25)
      goto LABEL_23;
    v20 = *(_QWORD *)(v24 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_2147FF160(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_2147FF1C8;
  return v5(v2 + 32);
}

uint64_t sub_2147FF1C8()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_BYTE **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc();
  *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_2147FF218(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(sub_214852368() - 8);
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
  result = sub_214852A28();
  __break(1u);
  return result;
}

uint64_t _s8SetupKit23SKStepPhotoPickerServerC5EventO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
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
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  int EnumCaseMultiPayload;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  uint64_t v78;

  v4 = type metadata accessor for SKStepPhotoPickerFileInfo();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for SKStepPhotoPickerServer.Event(0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v50 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (uint64_t *)((char *)&v50 - v14);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88720);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v50 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = (uint64_t)&v19[*(int *)(v17 + 48)];
  sub_2147FE6C4(a1, (uint64_t)v19);
  sub_2147FE6C4(a2, v20);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_2147FE6C4((uint64_t)v19, (uint64_t)v13);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        sub_2147FE734(v20, (uint64_t)v6);
        static SKStepPhotoPickerFileInfo.== infix(_:_:)(v13, v6);
      }
      sub_2147FE778((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for SKStepPhotoPickerFileInfo);
      goto LABEL_12;
    }
    sub_2147FE6C4((uint64_t)v19, (uint64_t)v10);
    v24 = *((_QWORD *)v10 + 4);
    v23 = *((_QWORD *)v10 + 5);
    v26 = *((_QWORD *)v10 + 6);
    v25 = *((_QWORD *)v10 + 7);
    v27 = *((_QWORD *)v10 + 8);
    v56 = v10[72];
    v28 = *((_QWORD *)v10 + 10);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v29 = v10[24];
      v30 = *((_QWORD *)v10 + 2);
      v31 = v10[8];
      v32 = *(_QWORD *)v10;
      v33 = *(_QWORD *)v20;
      v34 = *(_BYTE *)(v20 + 8);
      v35 = *(_QWORD *)(v20 + 16);
      v36 = *(_BYTE *)(v20 + 24);
      v37 = v28;
      v55 = v28;
      v39 = *(_QWORD *)(v20 + 32);
      v38 = *(_QWORD *)(v20 + 40);
      v40 = *(_QWORD *)(v20 + 48);
      v41 = *(_QWORD *)(v20 + 56);
      v42 = *(_QWORD *)(v20 + 64);
      v51 = *(_QWORD *)(v20 + 80);
      v43 = *(_BYTE *)(v20 + 72);
      v68 = v32;
      LOBYTE(v69) = v31;
      v70 = v30;
      v71 = v29;
      v54 = v24;
      v72 = v24;
      v73 = v23;
      v53 = v23;
      v74 = v26;
      v75 = v25;
      v52 = v27;
      v76 = v27;
      v77 = v56;
      v78 = v37;
      v57 = v33;
      LOBYTE(v58) = v34;
      v59 = v35;
      v60 = v36;
      v61 = v39;
      v62 = v38;
      v63 = v40;
      v64 = v41;
      v44 = v40;
      v45 = v41;
      v65 = v42;
      v66 = v43;
      v67 = v51;
      v46 = static SKStepPhotoPickerFinishConfiguration.== infix(_:_:)((uint64_t)&v68, (uint64_t)&v57);
      sub_2147F7A20(v39, v38, v44, v45);
      swift_bridgeObjectRelease();
      sub_2147F7A20(v54, v53, v26, v25);
LABEL_14:
      swift_bridgeObjectRelease();
      sub_2147FE778((uint64_t)v19, type metadata accessor for SKStepPhotoPickerServer.Event);
      return v46 & 1;
    }
    sub_2147F7A20(v24, v23, v26, v25);
  }
  else
  {
    sub_2147FE6C4((uint64_t)v19, (uint64_t)v15);
    v22 = v15[1];
    if (!swift_getEnumCaseMultiPayload())
    {
      v47 = *(_QWORD *)v20;
      v48 = *(_QWORD *)(v20 + 8);
      v68 = *v15;
      v69 = v22;
      v57 = v47;
      v58 = v48;
      v46 = static SKStepPhotoPickerStartConfiguration.== infix(_:_:)(&v68, &v57);
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
  }
  swift_bridgeObjectRelease();
LABEL_12:
  sub_2147F275C((uint64_t)v19, &qword_254D88720);
  v46 = 0;
  return v46 & 1;
}

uint64_t sub_2147FF720()
{
  return type metadata accessor for SKStepPhotoPickerServer(0);
}

void sub_2147FF728()
{
  unint64_t v0;

  sub_2147FF7E0();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for SKStepPhotoPickerServer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SKStepPhotoPickerServer.__allocating_init(server:environment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

void sub_2147FF7E0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254D885D0)
  {
    sub_214852368();
    v0 = sub_214852914();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254D885D0);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for SKStepPhotoPickerServer.Event(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v8 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *(_QWORD *)a1 = *a2;
      *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
      *(_QWORD *)(a1 + 16) = a2[2];
      *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
      v9 = (_OWORD *)(a1 + 32);
      v10 = a2 + 4;
      v11 = a2[7];
      if (v11 == 1)
      {
        v12 = *((_OWORD *)a2 + 3);
        *v9 = *v10;
        *(_OWORD *)(a1 + 48) = v12;
        *(_OWORD *)(a1 + 57) = *(_OWORD *)((char *)a2 + 57);
      }
      else
      {
        *(_QWORD *)v9 = *(_QWORD *)v10;
        *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
        *(_QWORD *)(a1 + 48) = a2[6];
        *(_QWORD *)(a1 + 56) = v11;
        *(_QWORD *)(a1 + 64) = a2[8];
        *(_BYTE *)(a1 + 72) = *((_BYTE *)a2 + 72);
        swift_bridgeObjectRetain();
      }
      *(_QWORD *)(a1 + 80) = a2[10];
      swift_bridgeObjectRetain();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v7 = sub_214852368();
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      v13 = a2[1];
      *(_QWORD *)a1 = *a2;
      *(_QWORD *)(a1 + 8) = v13;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for SKStepPhotoPickerServer.Event(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2)
  {
    if (*(_QWORD *)(a1 + 56) != 1)
      swift_bridgeObjectRelease();
  }
  else
  {
    if ((_DWORD)result == 1)
    {
      v3 = sub_214852368();
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
    }
    if ((_DWORD)result)
      return result;
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SKStepPhotoPickerServer.Event(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  _OWORD *v6;
  _OWORD *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
    v6 = (_OWORD *)(a1 + 32);
    v7 = (_OWORD *)(a2 + 32);
    v8 = *(_QWORD *)(a2 + 56);
    if (v8 == 1)
    {
      v9 = *(_OWORD *)(a2 + 48);
      *v6 = *v7;
      *(_OWORD *)(a1 + 48) = v9;
      *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
    }
    else
    {
      *(_QWORD *)v6 = *(_QWORD *)v7;
      *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      *(_QWORD *)(a1 + 56) = v8;
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
      swift_bridgeObjectRetain();
    }
    *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
    swift_bridgeObjectRetain();
  }
  else if (EnumCaseMultiPayload == 1)
  {
    v5 = sub_214852368();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
  }
  else
  {
    v10 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v10;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for SKStepPhotoPickerServer.Event(uint64_t a1, uint64_t *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  __int128 *v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  if ((uint64_t *)a1 != a2)
  {
    sub_2147FE778(a1, type metadata accessor for SKStepPhotoPickerServer.Event);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v6 = *a2;
      *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
      *(_QWORD *)a1 = v6;
      v7 = a2[2];
      *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
      *(_QWORD *)(a1 + 16) = v7;
      v8 = (_OWORD *)(a1 + 32);
      v9 = (__int128 *)(a2 + 4);
      if (a2[7] == 1)
      {
        v10 = *v9;
        v11 = *((_OWORD *)a2 + 3);
        *(_OWORD *)(a1 + 57) = *(_OWORD *)((char *)a2 + 57);
        *v8 = v10;
        *(_OWORD *)(a1 + 48) = v11;
      }
      else
      {
        v12 = *(_QWORD *)v9;
        *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
        *(_QWORD *)v8 = v12;
        *(_QWORD *)(a1 + 48) = a2[6];
        *(_QWORD *)(a1 + 56) = a2[7];
        v13 = a2[8];
        *(_BYTE *)(a1 + 72) = *((_BYTE *)a2 + 72);
        *(_QWORD *)(a1 + 64) = v13;
        swift_bridgeObjectRetain();
      }
      *(_QWORD *)(a1 + 80) = a2[10];
      swift_bridgeObjectRetain();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v5 = sub_214852368();
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
    }
    else
    {
      *(_QWORD *)a1 = *a2;
      *(_QWORD *)(a1 + 8) = a2[1];
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for SKStepPhotoPickerServer.Event(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_214852368();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for SKStepPhotoPickerServer.Event(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_2147FE778((uint64_t)a1, type metadata accessor for SKStepPhotoPickerServer.Event);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_214852368();
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

uint64_t getEnumTagSinglePayload for SKStepPhotoPickerServer.Event(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for SKStepPhotoPickerServer.Event(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_2147FFDCC()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2147FFDDC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_214852368();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_2147FFE54()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2147FFE80(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *(_QWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 40);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_2147F4FF0;
  v6[6] = v5;
  v6[7] = v4;
  v6[5] = a1;
  return swift_task_switch();
}

uint64_t sub_2147FFEF0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2147FFF14(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2147FA024;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_254D88740 + dword_254D88740))(a1, v4);
}

uint64_t SKBluetoothAdvertiserConfiguration.description.getter()
{
  _QWORD v1[2];

  sub_21485298C();
  swift_bridgeObjectRelease();
  strcpy((char *)v1, "nearbyAction={");
  SKBluetoothAdvertiserNearbyActionConfiguration.description.getter();
  sub_214852704();
  swift_bridgeObjectRelease();
  sub_214852704();
  return v1[0];
}

uint64_t sub_214800034()
{
  sub_21485298C();
  sub_214852704();
  SKBluetoothAdvertiserNearbyActionConfiguration.description.getter();
  sub_214852704();
  swift_bridgeObjectRelease();
  sub_214852704();
  return 0;
}

uint64_t SKBluetoothAdvertiserNearbyActionConfiguration.nearbyActionFlags.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t SKBluetoothAdvertiserNearbyActionConfiguration.nearbyActionType.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 4);
}

uint64_t SKBluetoothAdvertiserNearbyActionConfiguration.useCase.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 8);
}

uint64_t SKBluetoothAdvertiserNearbyActionConfiguration.init(nearbyActionFlags:nearbyActionType:useCase:)@<X0>(uint64_t result@<X0>, char a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  *(_DWORD *)a4 = result;
  *(_BYTE *)(a4 + 4) = a2;
  *(_DWORD *)(a4 + 8) = a3;
  return result;
}

uint64_t SKBluetoothAdvertiserNearbyActionConfiguration.description.getter()
{
  uint64_t v0;
  unsigned int v1;
  int v2;
  id v3;

  v1 = *(unsigned __int8 *)(v0 + 4);
  v2 = *(_DWORD *)(v0 + 8);
  sub_21485298C();
  swift_bridgeObjectRelease();
  CBNearbyActionTypeToString(v1);
  sub_214852710();
  sub_214852704();
  swift_bridgeObjectRelease();
  sub_214852704();
  v3 = (id)SKNearbyActionFlagsToString();
  sub_2148526C8();

  sub_214852704();
  swift_bridgeObjectRelease();
  sub_214852704();
  CBUseCaseToString(v2);
  sub_214852710();
  sub_214852704();
  swift_bridgeObjectRelease();
  return 0x3D65707974;
}

const char *CBNearbyActionTypeToString(unsigned int a1)
{
  if (a1 > 0x55)
    return "?";
  else
    return off_24D227EA0[(char)a1];
}

const char *CBUseCaseToString(int a1)
{
  const char *result;

  if (a1 >= 0x20000)
  {
    if (a1 >= 327680)
    {
      if (a1 >= 589824)
      {
        if (a1 <= 2147418111)
        {
          switch(a1)
          {
            case 589824:
              return "FindNearbyRemote";
            case 589825:
              return "FindNearbyPencil";
            case 655360:
              return "AccessDigitalHomeKey";
            default:
              return "?";
          }
        }
        else
        {
          switch(a1)
          {
            case 2147418112:
              result = "InternalTestNoLockScan";
              break;
            case 2147418113:
              result = "InternalTestNoScreenOffScan";
              break;
            case 2147418114:
              result = "InternalTestScanWithNoDups";
              break;
            case 2147418115:
              result = "InternalTestScanWithDups";
              break;
            case 2147418116:
              result = "InternalTestScanFor20Seconds";
              break;
            case 2147418117:
              result = "InternalTestActiveScan";
              break;
            case 2147418118:
              result = "InternalTestUUIDScan";
              break;
            case 2147418119:
              result = "InternalTestScanFor10ClockSeconds";
              break;
            case 2147418120:
              result = "InternalTestScanBoost";
              break;
            default:
              return "?";
          }
        }
      }
      else if (a1 > 458752)
      {
        switch(a1)
        {
          case 524288:
            result = "ADPD";
            break;
          case 524289:
            result = "ADPDBuffer";
            break;
          case 524290:
            result = "MicroLocation";
            break;
          case 524291:
            result = "MicroLocationLeech";
            break;
          default:
            if (a1 == 458753)
            {
              result = "PrecisionFindingFindee";
            }
            else
            {
              if (a1 != 458754)
                return "?";
              result = "PrecisionFindingFindeeHighPriority";
            }
            break;
        }
      }
      else
      {
        switch(a1)
        {
          case 393216:
            result = "CaptiveNetworkJoin";
            break;
          case 393217:
            result = "UseCaseSIMTransfer";
            break;
          case 393218:
            result = "MacSetup";
            break;
          case 393219:
            result = "AppleIDSignIn";
            break;
          case 393220:
            result = "AppleIDSignInSettings";
            break;
          default:
            if (a1 == 327680)
            {
              result = "RapportThirdParty";
            }
            else
            {
              if (a1 != 458752)
                return "?";
              result = "PrecisionFindingFinder";
            }
            break;
        }
      }
    }
    else
    {
      switch(a1)
      {
        case 131072:
          return "SharingDefault";
        case 131073:
          return "SharingPhoneAutoUnlock";
        case 131074:
          return "SharingSiriWatchAuth";
        case 131075:
          return "SharingMacAutoUnlock";
        case 131076:
          return "SharingEDTScreenOn";
        case 131077:
          return "SharingEDTWiFiDisabled";
        case 131078:
          return "SharingEDTWombatEligibleAsDefaultCamera";
        case 131079:
          return "SharingEDTWombatCameraPicker";
        case 131080:
          return "SharingWombatBackground";
        case 131081:
          return "SharingUniversalControl";
        case 131082:
          return "SharingPeopleProximity";
        case 131083:
          return "SharingEDTEnsembleOpenDisplayPrefs";
        case 131084:
          return "SharingEDTNearbydMotionStopped";
        case 131085:
          return "SharingDoubleBoostGenericScan";
        case 131086:
          return "SharingEDTIncomingAdvertisement ";
        case 131087:
          return "SharingEDTWombatStreamStart";
        case 131088:
          return "SharingOYAutoUnlock";
        case 131089:
          return "?";
        case 131090:
          return "SharingAirDrop";
        case 131091:
          return "SharingNearbyInvitationHost";
        case 131092:
          return "SharingNearbyInvitationParticipant";
        case 131093:
          return "SharingAirDropAskToAirDrop";
        case 131094:
          return "SharingAirDropTempIdentity";
        case 131095:
          return "SharingAirDropNeedsCLink";
        case 131096:
          return "SharingRemoteWidgetUpdate";
        case 131097:
          return "SharingCountryCodeUpdate";
        case 131098:
          return "SharingMacPhoneAutoUnlock";
        case 131099:
          return "SharingVisionProDiscovery";
        case 131100:
          return "SharingVisionProStateChange";
        case 131101:
          return "SharingContinuityScreen";
        case 131102:
          return "SharingEDTRemoteDisplay";
        default:
          if (a1 == 196608)
          {
            result = "DigitalIDTSA";
          }
          else
          {
            if (a1 != 0x40000)
              return "?";
            result = "DigitalCarKeyThirdParty";
          }
          break;
      }
    }
  }
  else
  {
    result = "Unspecified";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        result = "HealthKit";
        break;
      case 2:
        result = "HomeKit";
        break;
      case 3:
        result = "FindMyObjectConnection";
        break;
      case 4:
        result = "FindMyObjectConnectionTransient";
        break;
      case 5:
        result = "MIDI";
        break;
      case 6:
        result = "Continuity";
        break;
      case 7:
        result = "InstantHotSpot";
        break;
      case 8:
        result = "NearBy";
        break;
      case 9:
        result = "Sharing";
        break;
      case 10:
        result = "HearingSupport";
        break;
      case 11:
        result = "Magnet";
        break;
      case 12:
        result = "HID";
        break;
      case 13:
        result = "LEA";
        break;
      case 14:
        result = "External";
        break;
      case 15:
        result = "ExternalMedical";
        break;
      case 16:
        result = "ExternalLock";
        break;
      case 17:
        result = "ExternalWatch";
        break;
      case 18:
        result = "SmartRouting";
        break;
      case 19:
        result = "DigitalID";
        break;
      case 20:
        result = "DigitalKey";
        break;
      case 21:
        result = "DigitalCarKey";
        break;
      case 22:
        result = "HeySiri";
        break;
      case 23:
        result = "ThirdPartyApp";
        break;
      case 24:
        result = "CNJ";
        break;
      default:
        switch(a1)
        {
          case 256:
            result = "DevicePresenceDetection";
            break;
          case 257:
            result = "AudioBox";
            break;
          case 258:
            result = "SIMTransfer";
            break;
          case 259:
            result = "ProximityScreenOnLeechScan";
            break;
          case 260:
            result = "MacMigrate";
            break;
          case 263:
            result = "HIDUARTService";
            break;
          case 264:
            result = "AccessibilitySwitchControlPairing";
            break;
          case 265:
            result = "BaseBandFastConnect";
            break;
          case 266:
            result = "SafetyAlerts";
            break;
          case 267:
            result = "LECarPlay";
            break;
          case 268:
            result = "TCCBluetooth";
            break;
          case 269:
            result = "AOPBufferLeech";
            break;
          default:
            return "?";
        }
        break;
    }
  }
  return result;
}

uint64_t SKBluetoothAdvertiserDarwin.__allocating_init(configuration:environment:)(int *a1, uint64_t *a2)
{
  uint64_t result;
  int v5;
  char v6;
  int v7;
  uint64_t v8;

  result = swift_allocObject();
  v5 = *a1;
  v6 = *((_BYTE *)a1 + 4);
  v7 = a1[2];
  v8 = *a2;
  *(_QWORD *)(result + 16) = 0;
  *(_DWORD *)(result + 24) = v5;
  *(_BYTE *)(result + 28) = v6;
  *(_DWORD *)(result + 32) = v7;
  *(_QWORD *)(result + 40) = v8;
  return result;
}

uint64_t SKBluetoothAdvertiserDarwin.init(configuration:environment:)(int *a1, uint64_t *a2)
{
  uint64_t v2;
  int v3;
  char v4;
  int v5;
  uint64_t v6;

  v3 = *a1;
  v4 = *((_BYTE *)a1 + 4);
  v5 = a1[2];
  v6 = *a2;
  *(_QWORD *)(v2 + 16) = 0;
  *(_DWORD *)(v2 + 24) = v3;
  *(_BYTE *)(v2 + 28) = v4;
  *(_DWORD *)(v2 + 32) = v5;
  *(_QWORD *)(v2 + 40) = v6;
  return v2;
}

uint64_t SKBluetoothAdvertiserDarwin.start()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_214800A30()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_214800AAC;
  return sub_214852B24();
}

uint64_t sub_214800AAC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 32) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_214800B10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[6];

  v4 = sub_214852638();
  v22 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_214852650();
  v20 = *(_QWORD *)(v7 - 8);
  v21 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88958);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  aBlock[0] = *(_QWORD *)(a2 + 40);
  v19 = SKEnvironmentValues.dispatchQueue.getter();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
  v13 = (*(unsigned __int8 *)(v11 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v14 + v13, (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  aBlock[4] = sub_214801E74;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_214800FA4;
  aBlock[3] = &block_descriptor_14;
  v15 = _Block_copy(aBlock);
  swift_retain();
  sub_214852644();
  v23 = MEMORY[0x24BEE4AF8];
  sub_2148011CC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88780);
  sub_214801214();
  sub_214852950();
  v16 = v19;
  MEMORY[0x2199D6970](0, v9, v6, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v9, v21);
  return swift_release();
}

uint64_t sub_214800D58(uint64_t a1)
{
  uint64_t v1;

  return sub_214800B10(a1, v1);
}

void sub_214800D60(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD aBlock[6];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88958);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  if (*(_QWORD *)(a1 + 16))
  {
    sub_2148527E8();
  }
  else
  {
    v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBB218]), sel_init);
    v8 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v7;
    v9 = v7;

    v10 = *(unsigned int *)(a1 + 24);
    v11 = *(unsigned int *)(a1 + 32);
    objc_msgSend(v9, sel_setNearbyActionType_, *(unsigned __int8 *)(a1 + 28));
    objc_msgSend(v9, sel_setNearbyActionFlags_, v10);
    objc_msgSend(v9, sel_setUseCase_, v11);
    aBlock[0] = *(_QWORD *)(a1 + 40);
    v12 = SKEnvironmentValues.dispatchQueue.getter();
    objc_msgSend(v9, sel_setDispatchQueue_, v12, aBlock[0]);

    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
    v13 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v14 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v14 + v13, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
    aBlock[4] = sub_214801F0C;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_214800F50;
    aBlock[3] = &block_descriptor_20;
    v15 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v9, sel_activateWithCompletion_, v15);
    _Block_release(v15);

  }
}

void sub_214800F50(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_214800FA4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

Swift::Void __swiftcall SKBluetoothAdvertiserDarwin.cancel()()
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
  id v9;
  void *v10;
  _QWORD v11[2];
  _QWORD aBlock[5];
  uint64_t v13;

  v1 = sub_214852638();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_214852650();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = *(_QWORD *)(v0 + 40);
  v9 = SKEnvironmentValues.dispatchQueue.getter();
  aBlock[4] = sub_214801180;
  v13 = v0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_214800FA4;
  aBlock[3] = &block_descriptor_0;
  v10 = _Block_copy(aBlock);
  swift_retain();
  sub_214852644();
  v11[1] = MEMORY[0x24BEE4AF8];
  sub_2148011CC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88780);
  sub_214801214();
  sub_214852950();
  MEMORY[0x2199D6970](0, v8, v4, v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_release();
}

void sub_214801180()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    objc_msgSend(v1, sel_invalidate);
    v2 = *(void **)(v0 + 16);
    *(_QWORD *)(v0 + 16) = 0;

  }
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

unint64_t sub_2148011CC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D88778;
  if (!qword_254D88778)
  {
    v1 = sub_214852638();
    result = MEMORY[0x2199D7540](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_254D88778);
  }
  return result;
}

unint64_t sub_214801214()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D88788;
  if (!qword_254D88788)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D88780);
    result = MEMORY[0x2199D7540](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_254D88788);
  }
  return result;
}

uint64_t SKBluetoothAdvertiserDarwin.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SKBluetoothAdvertiserDarwin.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_2148012B0(int *a1, uint64_t *a2)
{
  int v3;
  char v4;
  int v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  v4 = *((_BYTE *)a1 + 4);
  v5 = a1[2];
  result = swift_allocObject();
  v7 = *a2;
  *(_QWORD *)(result + 16) = 0;
  *(_DWORD *)(result + 24) = v3;
  *(_BYTE *)(result + 28) = v4;
  *(_DWORD *)(result + 32) = v5;
  *(_QWORD *)(result + 40) = v7;
  return result;
}

uint64_t sub_214801310()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t SKBluetoothAdvertiserMock.__allocating_init(configuration:environment:)(uint64_t a1, uint64_t *a2)
{
  uint64_t result;
  char v5;
  int v6;
  uint64_t v7;

  result = swift_allocObject();
  v5 = *(_BYTE *)(a1 + 4);
  v6 = *(_DWORD *)(a1 + 8);
  v7 = *a2;
  *(_DWORD *)(result + 16) = *(_DWORD *)a1;
  *(_BYTE *)(result + 20) = v5;
  *(_DWORD *)(result + 24) = v6;
  *(_QWORD *)(result + 32) = v7;
  return result;
}

uint64_t SKBluetoothAdvertiserMock.init(configuration:environment:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  char v3;
  int v4;
  uint64_t v5;

  v3 = *(_BYTE *)(a1 + 4);
  v4 = *(_DWORD *)(a1 + 8);
  v5 = *a2;
  *(_DWORD *)(v2 + 16) = *(_DWORD *)a1;
  *(_BYTE *)(v2 + 20) = v3;
  *(_DWORD *)(v2 + 24) = v4;
  *(_QWORD *)(v2 + 32) = v5;
  return v2;
}

uint64_t SKBluetoothAdvertiserMock.start()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_2148013C4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_214801440;
  return sub_214852B24();
}

uint64_t sub_214801440()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 32) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2148014A4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2148014B0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2148014BC()
{
  uint64_t v1;

  SKEnvironmentValues.subscript.getter((uint64_t)&type metadata for BluetoothAdvertiserStartErrorSKEnvironmentKey, (uint64_t)&type metadata for BluetoothAdvertiserStartErrorSKEnvironmentKey, (uint64_t)&off_254D88940, (uint64_t)&v1);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D88958);
    return sub_2148527DC();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D88958);
    return sub_2148527E8();
  }
}

uint64_t sub_21480154C()
{
  return sub_2148014BC();
}

uint64_t SKEnvironmentValues.bluetoothAdvertiserStartError.getter()
{
  uint64_t v1;

  SKEnvironmentValues.subscript.getter((uint64_t)&type metadata for BluetoothAdvertiserStartErrorSKEnvironmentKey, (uint64_t)&type metadata for BluetoothAdvertiserStartErrorSKEnvironmentKey, (uint64_t)&off_254D88940, (uint64_t)&v1);
  return v1;
}

uint64_t SKBluetoothAdvertiserMock.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SKBluetoothAdvertiserMock.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_2148015E4(int *a1, uint64_t *a2)
{
  int v3;
  char v4;
  int v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  v4 = *((_BYTE *)a1 + 4);
  v5 = a1[2];
  result = swift_allocObject();
  v7 = *a2;
  *(_DWORD *)(result + 16) = v3;
  *(_BYTE *)(result + 20) = v4;
  *(_DWORD *)(result + 24) = v5;
  *(_QWORD *)(result + 32) = v7;
  return result;
}

uint64_t sub_214801640()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_214801658()
{
  uint64_t result;

  result = type metadata accessor for SKBluetoothAdvertiserDarwin();
  qword_254D8C908 = result;
  qword_254D8C910 = (uint64_t)&protocol witness table for SKBluetoothAdvertiserDarwin;
  return result;
}

uint64_t sub_214801684@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  if (qword_254D8C900 != -1)
    result = swift_once();
  v2 = qword_254D8C910;
  *a1 = qword_254D8C908;
  a1[1] = v2;
  return result;
}

uint64_t SKEnvironmentValues.bluetoothAdvertiser.getter()
{
  uint64_t v1;

  SKEnvironmentValues.subscript.getter((uint64_t)&type metadata for BluetoothAdvertiserSKEnvironmentKey, (uint64_t)&type metadata for BluetoothAdvertiserSKEnvironmentKey, (uint64_t)&off_254D88928, (uint64_t)&v1);
  return v1;
}

double sub_214801728@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  SKEnvironmentValues.subscript.getter((uint64_t)&type metadata for BluetoothAdvertiserSKEnvironmentKey, (uint64_t)&type metadata for BluetoothAdvertiserSKEnvironmentKey, (uint64_t)&off_254D88928, (uint64_t)&v3);
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_21480177C(__int128 *a1)
{
  __int128 v2;

  v2 = *a1;
  return SKEnvironmentValues.subscript.setter((uint64_t)&v2, (uint64_t)&type metadata for BluetoothAdvertiserSKEnvironmentKey);
}

uint64_t SKEnvironmentValues.bluetoothAdvertiser.setter(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a1;
  v3[1] = a2;
  return SKEnvironmentValues.subscript.setter((uint64_t)v3, (uint64_t)&type metadata for BluetoothAdvertiserSKEnvironmentKey);
}

void (*SKEnvironmentValues.bluetoothAdvertiser.modify(_QWORD *a1))(_OWORD **a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  SKEnvironmentValues.subscript.getter((uint64_t)&type metadata for BluetoothAdvertiserSKEnvironmentKey, (uint64_t)&type metadata for BluetoothAdvertiserSKEnvironmentKey, (uint64_t)&off_254D88928, (uint64_t)(v3 + 2));
  *(_OWORD *)v3 = *((_OWORD *)v3 + 1);
  return sub_214801878;
}

void sub_214801878(_OWORD **a1)
{
  _OWORD *v1;

  v1 = *a1;
  v1[1] = **a1;
  SKEnvironmentValues.subscript.setter((uint64_t)(v1 + 1), (uint64_t)&type metadata for BluetoothAdvertiserSKEnvironmentKey);
  free(v1);
}

void sub_2148018C0(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_2148018C8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = SKEnvironmentValues.subscript.getter((uint64_t)&type metadata for BluetoothAdvertiserStartErrorSKEnvironmentKey, (uint64_t)&type metadata for BluetoothAdvertiserStartErrorSKEnvironmentKey, (uint64_t)&off_254D88940, (uint64_t)&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_21480191C(id *a1)
{
  id v1;
  id v3;

  v3 = *a1;
  v1 = v3;
  return SKEnvironmentValues.subscript.setter((uint64_t)&v3, (uint64_t)&type metadata for BluetoothAdvertiserStartErrorSKEnvironmentKey);
}

uint64_t SKEnvironmentValues.bluetoothAdvertiserStartError.setter(uint64_t a1)
{
  uint64_t v2;

  v2 = a1;
  return SKEnvironmentValues.subscript.setter((uint64_t)&v2, (uint64_t)&type metadata for BluetoothAdvertiserStartErrorSKEnvironmentKey);
}

void (*SKEnvironmentValues.bluetoothAdvertiserStartError.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 16) = v1;
  SKEnvironmentValues.subscript.getter((uint64_t)&type metadata for BluetoothAdvertiserStartErrorSKEnvironmentKey, (uint64_t)&type metadata for BluetoothAdvertiserStartErrorSKEnvironmentKey, (uint64_t)&off_254D88940, a1);
  return sub_2148019FC;
}

void sub_2148019FC(uint64_t a1, char a2)
{
  id v3;
  id v4;

  v3 = *(id *)a1;
  *(_QWORD *)(a1 + 8) = v3;
  if ((a2 & 1) != 0)
  {
    v4 = v3;
    SKEnvironmentValues.subscript.setter(a1 + 8, (uint64_t)&type metadata for BluetoothAdvertiserStartErrorSKEnvironmentKey);

  }
  else
  {
    SKEnvironmentValues.subscript.setter(a1 + 8, (uint64_t)&type metadata for BluetoothAdvertiserStartErrorSKEnvironmentKey);
  }
}

uint64_t SKBluetoothScannerConfiguration.discoveryType.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t SKBluetoothScannerConfiguration.useCase.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 4);
}

uint64_t SKBluetoothScannerConfiguration.init(discoveryType:useCase:)@<X0>(uint64_t result@<X0>, int a2@<W1>, _DWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t SKBluetoothScannerConfiguration.description.getter()
{
  uint64_t v0;
  int v1;

  v1 = *(_DWORD *)(v0 + 4);
  sub_21485298C();
  sub_214852704();
  type metadata accessor for CBDiscoveryType(0);
  sub_2148529D4();
  sub_214852704();
  CBUseCaseToString(v1);
  sub_214852710();
  sub_214852704();
  swift_bridgeObjectRelease();
  return 0;
}

void type metadata accessor for CBDiscoveryType(uint64_t a1)
{
  sub_214801D98(a1, &qword_254D88920);
}

uint64_t __swift_memcpy12_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for SKBluetoothAdvertiserConfiguration(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 12))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SKBluetoothAdvertiserConfiguration(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_DWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 12) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SKBluetoothAdvertiserConfiguration()
{
  return &type metadata for SKBluetoothAdvertiserConfiguration;
}

ValueMetadata *type metadata accessor for SKBluetoothAdvertiserNearbyActionConfiguration()
{
  return &type metadata for SKBluetoothAdvertiserNearbyActionConfiguration;
}

uint64_t dispatch thunk of SKBluetoothAdvertiser.init(configuration:environment:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of SKBluetoothAdvertiser.start()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 16) + *(_QWORD *)(a2 + 16));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2147F4FF0;
  return v7(a1, a2);
}

uint64_t dispatch thunk of SKBluetoothAdvertiser.cancel()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t type metadata accessor for SKBluetoothAdvertiserDarwin()
{
  return objc_opt_self();
}

uint64_t method lookup function for SKBluetoothAdvertiserDarwin()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SKBluetoothAdvertiserDarwin.__allocating_init(configuration:environment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t type metadata accessor for SKBluetoothAdvertiserMock()
{
  return objc_opt_self();
}

uint64_t method lookup function for SKBluetoothAdvertiserMock()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SKBluetoothAdvertiserMock.__allocating_init(configuration:environment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

_QWORD *__swift_memcpy8_4(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SKBluetoothScannerConfiguration(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SKBluetoothScannerConfiguration(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SKBluetoothScannerConfiguration()
{
  return &type metadata for SKBluetoothScannerConfiguration;
}

void type metadata accessor for CBUseCase(uint64_t a1)
{
  sub_214801D98(a1, &qword_254D88908);
}

void type metadata accessor for CBNearbyActionType(uint64_t a1)
{
  sub_214801D98(a1, &qword_254D88910);
}

void type metadata accessor for CBNearbyActionFlags(uint64_t a1)
{
  sub_214801D98(a1, &qword_254D88918);
}

void sub_214801D98(uint64_t a1, unint64_t *a2)
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

ValueMetadata *type metadata accessor for BluetoothAdvertiserSKEnvironmentKey()
{
  return &type metadata for BluetoothAdvertiserSKEnvironmentKey;
}

ValueMetadata *type metadata accessor for BluetoothAdvertiserStartErrorSKEnvironmentKey()
{
  return &type metadata for BluetoothAdvertiserStartErrorSKEnvironmentKey;
}

uint64_t sub_214801DFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88958);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_214801E74()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254D88958) - 8) + 80);
  sub_214800D60(*(_QWORD *)(v0 + 16), v0 + ((v1 + 24) & ~v1));
}

uint64_t sub_214801EA8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88958);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_214801F0C(void *a1)
{
  id v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88958);
  if (!a1)
    return sub_2148527E8();
  v2 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88958);
  return sub_2148527DC();
}

unint64_t static SKConstants.entitlementMain.getter()
{
  return 0xD000000000000012;
}

void *sub_214801FC0()
{
  return &unk_24D228168;
}

unint64_t static SKConstants.logSubsystem.getter()
{
  return 0xD000000000000012;
}

double Duration.seconds.getter()
{
  double v0;
  uint64_t v1;

  v0 = (double)sub_214852BC0();
  sub_214852BC0();
  return (double)v1 / 1.0e18 + v0;
}

uint64_t Numeric<>.isApproximatelyEqual(to:absoluteTolerance:relativeTolerance:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t AssociatedTypeWitness;
  char v11;
  _BYTE v13[16];
  uint64_t v14;
  uint64_t v15;
  uint64_t KeyPath;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v17 = a4;
  v18 = a5;
  v19 = a6;
  v14 = a5;
  v15 = a6;
  KeyPath = swift_getKeyPath();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = AdditiveArithmetic.isApproximatelyEqual<A>(to:absoluteTolerance:relativeTolerance:norm:)(a1, a2, a3, (void (*)(uint64_t))sub_214802154, (uint64_t)v13, a4, AssociatedTypeWitness, *(_QWORD *)(v14 + 8), v15);
  swift_release();
  return v11 & 1;
}

uint64_t sub_214802108()
{
  return sub_21485289C();
}

uint64_t sub_214802134()
{
  return 24;
}

__n128 sub_214802140(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

uint64_t sub_214802154()
{
  return swift_getAtKeyPath();
}

uint64_t AdditiveArithmetic.isApproximatelyEqual<A>(to:absoluteTolerance:relativeTolerance:norm:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  void (*v37)(uint64_t);
  char *v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  char *v41;
  char v42;
  void (*v43)(char *, char *, uint64_t);
  char *v44;
  char *v45;
  _QWORD v47[2];
  char *v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t);
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;

  v50 = a5;
  v51 = a4;
  v52 = a3;
  v54 = a2;
  v49 = *(_QWORD *)(a6 - 8);
  v12 = MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = *(_QWORD *)(v15 - 8);
  v16 = MEMORY[0x24BDAC7A8](v12);
  v57 = (char *)v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v55 = (char *)v47 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v53 = (char *)v47 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)v47 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)v47 - v26;
  v28 = MEMORY[0x24BDAC7A8](v25);
  v30 = (char *)v47 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)v47 - v31;
  v48 = v33;
  v35 = v34;
  if ((sub_214852698() & 1) != 0)
  {
    v36 = 1;
  }
  else
  {
    v47[0] = v9;
    v47[1] = a9;
    sub_2148529EC();
    v37 = v51;
    v48 = v30;
    v51((uint64_t)v14);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v14, a6);
    v37(v47[0]);
    v37(v35);
    v38 = v48;
    sub_214852B30();
    v39 = v56;
    v40 = *(void (**)(char *, uint64_t))(v56 + 8);
    v40(v24, a7);
    v40(v27, a7);
    sub_214852890();
    v41 = v53;
    sub_214852B30();
    v40(v27, a7);
    v42 = sub_214852674();
    v43 = *(void (**)(char *, char *, uint64_t))(v39 + 16);
    v44 = v55;
    v43(v55, v32, a7);
    v45 = v57;
    v43(v57, v41, a7);
    if ((v42 & 1) != 0)
      v36 = sub_21485268C();
    else
      v36 = 0;
    v40(v45, a7);
    v40(v44, a7);
    v40(v41, a7);
    v40(v38, a7);
    v40(v32, a7);
  }
  return v36 & 1;
}

ValueMetadata *type metadata accessor for SKConstants()
{
  return &type metadata for SKConstants;
}

uint64_t sub_2148024B0()
{
  uint64_t v0;

  v0 = sub_214852494();
  __swift_allocate_value_buffer(v0, qword_254D8CAA8);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D8CAA8);
  sub_214801FC0();
  swift_bridgeObjectRetain();
  return sub_214852488();
}

uint64_t SKStepActivationClient.environment.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t SKStepActivationClient.__allocating_init(client:environment:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = swift_allocObject();
  v4 = *a2;
  swift_weakInit();
  swift_weakAssign();
  swift_release();
  *(_QWORD *)(v3 + 24) = v4;
  return v3;
}

uint64_t SKStepActivationClient.init(client:environment:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *a2;
  swift_weakInit();
  swift_weakAssign();
  swift_release();
  *(_QWORD *)(v2 + 24) = v3;
  return v2;
}

uint64_t SKStepActivationClient.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  v1 = v0;
  if (qword_254D8CAA0 != -1)
    swift_once();
  v2 = sub_214852494();
  __swift_project_value_buffer(v2, (uint64_t)qword_254D8CAA8);
  v3 = sub_21485247C();
  v4 = sub_2148528C0();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2147EE000, v3, v4, "deinit", v5, 2u);
    MEMORY[0x2199D75E8](v5, -1, -1);
  }

  swift_weakDestroy();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t SKStepActivationClient.__deallocating_deinit()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  if (qword_254D8CAA0 != -1)
    swift_once();
  v0 = sub_214852494();
  __swift_project_value_buffer(v0, (uint64_t)qword_254D8CAA8);
  v1 = sub_21485247C();
  v2 = sub_2148528C0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2147EE000, v1, v2, "deinit", v3, 2u);
    MEMORY[0x2199D75E8](v3, -1, -1);
  }

  swift_weakDestroy();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t SKStepActivationClient.perform(configuration:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  *(_QWORD *)(v3 + 296) = a1;
  *(_QWORD *)(v3 + 304) = v2;
  *(_QWORD *)(v3 + 312) = *(_QWORD *)a2;
  *(_BYTE *)(v3 + 74) = *(_BYTE *)(a2 + 8);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v3 + 320) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 336) = v4;
  *(_QWORD *)(v3 + 352) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(v3 + 75) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(v3 + 76) = *(_BYTE *)(a2 + 57);
  sub_2148030CC();
  *(_QWORD *)(v3 + 360) = sub_2148527C4();
  *(_QWORD *)(v3 + 368) = v5;
  return swift_task_switch();
}

uint64_t sub_214802844()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t Strong;
  char v12;
  char v13;
  uint64_t v14;
  char v15;
  __int128 v16;
  char v17;
  uint64_t v18;
  char v19;
  char v20;
  __int128 v21;
  __int128 v22;
  _QWORD *v23;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  __int128 v34;
  __int128 v35;
  char v36;
  char v37;
  uint64_t v38;
  char v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  char v43;
  char v44;
  uint64_t v45;
  char v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  char v50;
  char v51;

  if (qword_254D8CAA0 != -1)
    swift_once();
  v1 = sub_214852494();
  *(_QWORD *)(v0 + 376) = __swift_project_value_buffer(v1, (uint64_t)qword_254D8CAA8);
  v2 = sub_21485247C();
  v3 = sub_2148528D8();
  if (os_log_type_enabled(v2, v3))
  {
    v36 = *(_BYTE *)(v0 + 75);
    v37 = *(_BYTE *)(v0 + 76);
    v4 = *(_QWORD *)(v0 + 352);
    v34 = *(_OWORD *)(v0 + 320);
    v35 = *(_OWORD *)(v0 + 336);
    v5 = *(_BYTE *)(v0 + 74);
    v6 = *(_QWORD *)(v0 + 312);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v45 = v8;
    *(_DWORD *)v7 = 136315138;
    *(_QWORD *)(v0 + 80) = v6;
    *(_BYTE *)(v0 + 88) = v5;
    *(_OWORD *)(v0 + 96) = v34;
    *(_OWORD *)(v0 + 112) = v35;
    *(_QWORD *)(v0 + 128) = v4;
    *(_BYTE *)(v0 + 136) = v36;
    *(_BYTE *)(v0 + 137) = v37;
    sub_2148031B8();
    v9 = sub_214852B00();
    *(_QWORD *)(v0 + 288) = sub_2147F3D14(v9, v10, &v45);
    sub_21485292C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2147EE000, v2, v3, "activation start: configuration=%s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v8, -1, -1);
    MEMORY[0x2199D75E8](v7, -1, -1);
  }

  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 384) = Strong;
  if (Strong)
  {
    v12 = *(_BYTE *)(v0 + 76);
    v13 = *(_BYTE *)(v0 + 75);
    v14 = *(_QWORD *)(v0 + 352);
    v15 = *(_BYTE *)(v0 + 74);
    v45 = *(_QWORD *)(v0 + 312);
    v46 = v15;
    v16 = *(_OWORD *)(v0 + 336);
    v47 = *(_OWORD *)(v0 + 320);
    v48 = v16;
    v49 = v14;
    v50 = v13;
    v51 = v12;
    sub_21480934C((uint64_t)&v45, (uint64_t)&v38);
    v17 = v39;
    v18 = v42;
    v19 = v43;
    v20 = v44;
    v21 = v40;
    v22 = v41;
    *(_QWORD *)(v0 + 16) = v38;
    *(_BYTE *)(v0 + 24) = v17;
    *(_OWORD *)(v0 + 32) = v21;
    *(_OWORD *)(v0 + 48) = v22;
    *(_QWORD *)(v0 + 64) = v18;
    *(_BYTE *)(v0 + 72) = v19;
    *(_BYTE *)(v0 + 73) = v20;
    v23 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 392) = v23;
    sub_214803130();
    *v23 = v0;
    v23[1] = sub_214802CBC;
    return sub_2148525C0();
  }
  else
  {
    LOBYTE(v45) = 2;
    type metadata accessor for SKError();
    v25 = SKError.__allocating_init(_:_:_:)((uint64_t)&v45, 0x696C434B53206F4ELL, 0xEB00000000746E65, 0);
    swift_willThrow();
    v26 = v25;
    v27 = v25;
    v28 = sub_21485247C();
    v29 = sub_2148528CC();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      v45 = v31;
      *(_DWORD *)v30 = 136315138;
      swift_getErrorValue();
      v32 = sub_214852B6C();
      *(_QWORD *)(v0 + 280) = sub_2147F3D14(v32, v33, &v45);
      sub_21485292C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2147EE000, v28, v29, "### activation failed: error=%s", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199D75E8](v31, -1, -1);
      MEMORY[0x2199D75E8](v30, -1, -1);
    }
    else
    {

    }
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_214802CBC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 400) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_214802D20()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  char v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_BYTE *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 160);
  v4 = *(_BYTE *)(v0 + 168);
  v5 = *(_QWORD *)(v0 + 176);
  v6 = *(_BYTE *)(v0 + 184);
  v7 = sub_21485247C();
  v8 = sub_2148528D8();
  if (os_log_type_enabled(v7, v8))
  {
    v18 = v3;
    v9 = (uint8_t *)swift_slowAlloc();
    v17 = v4;
    v10 = swift_slowAlloc();
    *(_QWORD *)(v0 + 192) = v1;
    v19 = v10;
    *(_DWORD *)v9 = 136315138;
    *(_BYTE *)(v0 + 200) = v2;
    *(_QWORD *)(v0 + 208) = v18;
    *(_BYTE *)(v0 + 216) = v17;
    *(_QWORD *)(v0 + 224) = v5;
    *(_BYTE *)(v0 + 232) = v6;
    sub_214803174();
    v11 = sub_214852B00();
    *(_QWORD *)(v0 + 272) = sub_2147F3D14(v11, v12, &v19);
    sub_21485292C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2147EE000, v7, v8, "activation success: %s", v9, 0xCu);
    swift_arrayDestroy();
    v13 = v10;
    v4 = v17;
    MEMORY[0x2199D75E8](v13, -1, -1);
    v14 = v9;
    v3 = v18;
    MEMORY[0x2199D75E8](v14, -1, -1);

    swift_release();
  }
  else
  {
    swift_release();

  }
  v15 = *(_QWORD *)(v0 + 296);
  *(_QWORD *)v15 = v1;
  *(_BYTE *)(v15 + 8) = v2;
  *(_QWORD *)(v15 + 16) = v3;
  *(_BYTE *)(v15 + 24) = v4;
  *(_QWORD *)(v15 + 32) = v5;
  *(_BYTE *)(v15 + 40) = v6;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_214802F0C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;

  swift_release();
  v1 = *(void **)(v0 + 400);
  v2 = v1;
  v3 = v1;
  v4 = sub_21485247C();
  v5 = sub_2148528CC();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v11 = v7;
    *(_DWORD *)v6 = 136315138;
    swift_getErrorValue();
    v8 = sub_214852B6C();
    *(_QWORD *)(v0 + 280) = sub_2147F3D14(v8, v9, &v11);
    sub_21485292C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2147EE000, v4, v5, "### activation failed: error=%s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v7, -1, -1);
    MEMORY[0x2199D75E8](v6, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2148030B8()
{
  uint64_t *v0;

  return SKEnvironmental<>.unownedExecutor.getter(*v0, (uint64_t)&protocol witness table for SKStepActivationClient);
}

unint64_t sub_2148030CC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D88968;
  if (!qword_254D88968)
  {
    v1 = type metadata accessor for SKStepActivationClient();
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepActivationClient, v1);
    atomic_store(result, (unint64_t *)&qword_254D88968);
  }
  return result;
}

uint64_t type metadata accessor for SKStepActivationClient()
{
  return objc_opt_self();
}

unint64_t sub_214803130()
{
  unint64_t result;

  result = qword_254D88970;
  if (!qword_254D88970)
  {
    result = MEMORY[0x2199D7540](&unk_2148581C0, &type metadata for SKStepActivationStartRequestMessage);
    atomic_store(result, (unint64_t *)&qword_254D88970);
  }
  return result;
}

unint64_t sub_214803174()
{
  unint64_t result;

  result = qword_254D88978;
  if (!qword_254D88978)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepActivationReport, &type metadata for SKStepActivationReport);
    atomic_store(result, (unint64_t *)&qword_254D88978);
  }
  return result;
}

unint64_t sub_2148031B8()
{
  unint64_t result;

  result = qword_254D88980;
  if (!qword_254D88980)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepActivationConfiguration, &type metadata for SKStepActivationConfiguration);
    atomic_store(result, (unint64_t *)&qword_254D88980);
  }
  return result;
}

uint64_t method lookup function for SKStepActivationClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SKStepActivationClient.__allocating_init(client:environment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

SetupKit::SKErrorCode_optional __swiftcall SKErrorCode.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 7;
  if ((unint64_t)rawValue < 7)
    v2 = rawValue;
  *v1 = v2;
  return (SetupKit::SKErrorCode_optional)rawValue;
}

uint64_t SKErrorCode.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

SetupKit::SKErrorCode_optional sub_21480322C(Swift::Int *a1)
{
  return SKErrorCode.init(rawValue:)(*a1);
}

void sub_214803234(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_214803240()
{
  sub_2148041F8();
  return sub_214852788();
}

uint64_t sub_21480329C()
{
  sub_2148041F8();
  return sub_214852770();
}

uint64_t static SKError.domain.getter()
{
  return 0x74694B7075746553;
}

uint64_t static SKError.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t SKError.message.getter()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v8;
  __int128 v9;
  __int128 v10;

  v1 = objc_msgSend(v0, sel_userInfo);
  v2 = sub_214852668();

  sub_214852464();
  v3 = sub_214852434();
  if (!*(_QWORD *)(v2 + 16) || (v5 = sub_214803EE8(v3, v4), (v6 & 1) == 0))
  {
    v9 = 0u;
    v10 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_2147F2530(*(_QWORD *)(v2 + 56) + 32 * v5, (uint64_t)&v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v10 + 1))
  {
LABEL_9:
    sub_214803F4C((uint64_t)&v9);
    return 0;
  }
  if (swift_dynamicCast())
    return v8;
  else
    return 0;
}

id SKError.__allocating_init(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  objc_class *v4;
  objc_class *v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v5 = v4;
  v7 = objc_allocWithZone((Class)sub_214852464());
  v8 = a4;
  v9 = (void *)sub_21485244C();
  v10 = objc_allocWithZone(v5);
  v11 = SKError.init(_:)(v9);

  return v11;
}

id SKError.__allocating_init(_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  objc_class *v6;
  objc_class *v7;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v7 = v6;
  v9 = objc_allocWithZone((Class)sub_214852464());
  v10 = a6;
  v11 = (void *)sub_21485244C();
  v12 = objc_allocWithZone(v7);
  v13 = SKError.init(_:)(v11);

  return v13;
}

id SKError.__allocating_init(_:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return SKError.init(_:)(a1);
}

{
  objc_class *v1;
  objc_class *v2;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v13;
  objc_super v14;

  v2 = v1;
  v4 = objc_allocWithZone(v1);
  if (a1)
  {
    v13 = v4;
    v5 = a1;
    v6 = (void *)sub_214852314();
    v7 = objc_msgSend(v6, sel_domain);
    if (!v7)
    {
      sub_2148526C8();
      v7 = (id)sub_2148526A4();
      swift_bridgeObjectRelease();
    }
    v8 = objc_msgSend(v6, sel_code);
    v9 = objc_msgSend(v6, sel_userInfo);
    sub_214852668();

    v10 = (void *)sub_21485265C();
    swift_bridgeObjectRelease();
    v14.receiver = v13;
    v14.super_class = v2;
    v11 = objc_msgSendSuper2(&v14, sel_initWithDomain_code_userInfo_, v7, v8, v10);

  }
  else
  {
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v11;
}

id SKError.init(_:)(void *a1)
{
  void *v1;
  void *v2;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  objc_class *ObjectType;
  objc_super v12;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void *)sub_214852314();
  v5 = objc_msgSend(v4, sel_domain);
  if (!v5)
  {
    sub_2148526C8();
    v5 = (id)sub_2148526A4();
    swift_bridgeObjectRelease();
  }
  v6 = objc_msgSend(v4, sel_code);
  v7 = objc_msgSend(v4, sel_userInfo);
  sub_214852668();

  v8 = (void *)sub_21485265C();
  swift_bridgeObjectRelease();
  v12.receiver = v2;
  v12.super_class = ObjectType;
  v9 = objc_msgSendSuper2(&v12, sel_initWithDomain_code_userInfo_, v5, v6, v8);

  return v9;
}

{
  void *v1;
  void *v2;
  uint64_t ObjectType;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  objc_class *v13;
  objc_super v14;

  v2 = v1;
  ObjectType = swift_getObjectType();
  if (a1)
  {
    v13 = (objc_class *)ObjectType;
    v5 = a1;
    v6 = (void *)sub_214852314();
    v7 = objc_msgSend(v6, sel_domain);
    if (!v7)
    {
      sub_2148526C8();
      v7 = (id)sub_2148526A4();
      swift_bridgeObjectRelease();
    }
    v8 = objc_msgSend(v6, sel_code);
    v9 = objc_msgSend(v6, sel_userInfo);
    sub_214852668();

    v10 = (void *)sub_21485265C();
    swift_bridgeObjectRelease();
    v14.receiver = v2;
    v14.super_class = v13;
    v11 = objc_msgSendSuper2(&v14, sel_initWithDomain_code_userInfo_, v7, v8, v10);

  }
  else
  {
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v11;
}

uint64_t SKError.__allocating_init(from:)(uint64_t a1)
{
  objc_class *v1;
  uint64_t v2;
  objc_class *v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _BYTE v10[40];

  v3 = v1;
  v5 = sub_214852464();
  sub_214803F8C(a1, (uint64_t)v10);
  v6 = sub_214852440();
  if (!v2)
  {
    v7 = (void *)v6;
    v8 = objc_allocWithZone(v3);
    v5 = (uint64_t)SKError.init(_:)(v7);
  }
  __swift_destroy_boxed_opaque_existential_0(a1);
  return v5;
}

void SKError.encode(to:)()
{
  void *v0;
  id v1;
  id v2;
  void *v3;

  v1 = objc_allocWithZone((Class)sub_214852464());
  v2 = v0;
  v3 = (void *)sub_214852470();
  sub_214852458();

}

uint64_t SKError.errorDescription.getter()
{
  void *v0;
  id v1;
  uint64_t v2;

  v0 = (void *)sub_214852314();
  v1 = (id)CUPrintNSError();

  if (!v1)
    return 0;
  v2 = sub_2148526C8();

  return v2;
}

id SKError.__allocating_init(domain:code:userInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  objc_class *v5;
  void *v8;
  void *v9;
  id v10;

  v5 = v4;
  v8 = (void *)sub_2148526A4();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v9 = (void *)sub_21485265C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(objc_allocWithZone(v5), sel_initWithDomain_code_userInfo_, v8, a3, v9);

  return v10;
}

void SKError.init(domain:code:userInfo:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SKError.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_214803D08@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  objc_class *v2;
  uint64_t v3;
  objc_class *v4;
  uint64_t v7;
  uint64_t result;
  void *v9;
  id v10;
  id v11;
  _BYTE v12[40];

  v4 = v2;
  sub_214852464();
  sub_214803F8C(a1, (uint64_t)v12);
  v7 = sub_214852440();
  if (v3)
    return __swift_destroy_boxed_opaque_existential_0(a1);
  v9 = (void *)v7;
  v10 = objc_allocWithZone(v4);
  v11 = SKError.init(_:)(v9);
  result = __swift_destroy_boxed_opaque_existential_0(a1);
  *a2 = v11;
  return result;
}

void sub_214803DB0()
{
  void **v0;
  void *v1;
  id v2;
  id v3;
  void *v4;

  v1 = *v0;
  v2 = objc_allocWithZone((Class)sub_214852464());
  v3 = v1;
  v4 = (void *)sub_214852470();
  sub_214852458();

}

uint64_t sub_214803E10()
{
  void *v0;
  id v1;
  uint64_t v2;

  v0 = (void *)sub_214852314();
  v1 = (id)CUPrintNSError();

  if (!v1)
    return 0;
  v2 = sub_2148526C8();

  return v2;
}

uint64_t sub_214803E84()
{
  id *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*v0, sel_helpAnchor);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_2148526C8();

  return v3;
}

unint64_t sub_214803EE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_214852B84();
  sub_2148526EC();
  v4 = sub_214852B9C();
  return sub_21480423C(a1, a2, v4);
}

uint64_t sub_214803F4C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88A30);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_214803F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_214803FD4()
{
  unint64_t result;

  result = qword_254D88A38;
  if (!qword_254D88A38)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKErrorCode, &type metadata for SKErrorCode);
    atomic_store(result, (unint64_t *)&qword_254D88A38);
  }
  return result;
}

unint64_t sub_21480401C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D88A40;
  if (!qword_254D88A40)
  {
    v1 = type metadata accessor for SKError();
    result = MEMORY[0x2199D7540](MEMORY[0x24BDD01A8], v1);
    atomic_store(result, (unint64_t *)&qword_254D88A40);
  }
  return result;
}

uint64_t type metadata accessor for SKError()
{
  return objc_opt_self();
}

uint64_t getEnumTagSinglePayload for SKErrorCode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SKErrorCode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_21480415C + 4 * byte_214857D9D[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_214804190 + 4 * byte_214857D98[v4]))();
}

uint64_t sub_214804190(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_214804198(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2148041A0);
  return result;
}

uint64_t sub_2148041AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2148041B4);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_2148041B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2148041C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SKErrorCode()
{
  return &type metadata for SKErrorCode;
}

uint64_t method lookup function for SKError()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SKError.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t sub_2148041F8()
{
  unint64_t result;

  result = qword_254D88A70;
  if (!qword_254D88A70)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKErrorCode, &type metadata for SKErrorCode);
    atomic_store(result, (unint64_t *)&qword_254D88A70);
  }
  return result;
}

unint64_t sub_21480423C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_214852B18() & 1) == 0)
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
      while (!v14 && (sub_214852B18() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_21480431C()
{
  uint64_t v0;

  v0 = sub_214852494();
  __swift_allocate_value_buffer(v0, qword_254D8CF48);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D8CF48);
  sub_214801FC0();
  swift_bridgeObjectRetain();
  return sub_214852488();
}

uint64_t SKStepActivationServer.environment.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t SKStepActivationServer.__allocating_init(server:environment:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = swift_allocObject();
  v4 = *a2;
  *(_BYTE *)(v3 + 16) = 0;
  swift_weakInit();
  *(_BYTE *)(v3 + 40) = 0;
  *(_QWORD *)(v3 + 24) = v4;
  swift_weakAssign();
  swift_release();
  return v3;
}

uint64_t SKStepActivationServer.init(server:environment:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *a2;
  *(_BYTE *)(v2 + 16) = 0;
  swift_weakInit();
  *(_BYTE *)(v2 + 40) = 0;
  *(_QWORD *)(v2 + 24) = v3;
  swift_weakAssign();
  swift_release();
  return v2;
}

uint64_t SKStepActivationServer.start()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[7] = v2;
  sub_2147F4354(&qword_254D88A80, a2, (uint64_t (*)(uint64_t))type metadata accessor for SKStepActivationServer, (uint64_t)&protocol conformance descriptor for SKStepActivationServer);
  v3[8] = sub_2148527C4();
  v3[9] = v4;
  return swift_task_switch();
}

uint64_t sub_2148044D8()
{
  _QWORD *v0;
  uint64_t (*v1)(void);
  uint64_t Strong;
  uint64_t v3;
  char v5[9];

  if ((*(_BYTE *)(v0[7] + 40) & 1) != 0)
  {
    v1 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    Strong = swift_weakLoadStrong();
    v0[10] = Strong;
    if (Strong)
    {
      v0[11] = *(_QWORD *)(Strong + OBJC_IVAR____TtC8SetupKit8SKServer_nexusSession);
      v3 = swift_allocObject();
      swift_weakInit();
      v0[5] = &type metadata for SKStepActivationStartRequestHandler;
      v0[6] = sub_2148057F0();
      v0[2] = &unk_254D88A90;
      v0[3] = v3;
      sub_21485262C();
      sub_2147F4354(&qword_254D88200, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC80], MEMORY[0x24BE6DC90]);
      swift_retain();
      sub_2148527C4();
      return swift_task_switch();
    }
    v5[0] = 2;
    type metadata accessor for SKError();
    SKError.__allocating_init(_:_:_:)((uint64_t)v5, 0x7265534B53206F4ELL, 0xEB00000000726576, 0);
    swift_willThrow();
    v1 = (uint64_t (*)(void))v0[1];
  }
  return v1();
}

uint64_t sub_214804650()
{
  uint64_t v0;

  sub_21485259C();
  *(_QWORD *)(v0 + 96) = 0;
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return swift_task_switch();
}

uint64_t sub_2148046BC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_release();
  swift_release();
  *(_BYTE *)(v1 + 40) = 1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_214804704()
{
  uint64_t v0;

  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for SKStepActivationServer()
{
  return objc_opt_self();
}

uint64_t sub_21480476C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_214804790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  __int128 v5;

  v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v4 + 184) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(v4 + 160) = a1;
  *(_QWORD *)(v4 + 168) = a4;
  *(_QWORD *)(v4 + 176) = *(_QWORD *)a2;
  *(_BYTE *)(v4 + 74) = *(_BYTE *)(a2 + 8);
  *(_OWORD *)(v4 + 200) = v5;
  *(_QWORD *)(v4 + 216) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(v4 + 75) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(v4 + 76) = *(_BYTE *)(a2 + 57);
  return swift_task_switch();
}

uint64_t sub_2148047DC()
{
  uint64_t v0;
  uint64_t Strong;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  char v5;
  uint64_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  char v14;
  __int128 v15;
  _QWORD *v16;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  char v29;
  char v30;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 224) = Strong;
  if (Strong)
  {
    if (qword_254D8CF40 != -1)
      swift_once();
    v2 = sub_214852494();
    __swift_project_value_buffer(v2, (uint64_t)qword_254D8CF48);
    v3 = sub_21485247C();
    v4 = sub_2148528D8();
    if (os_log_type_enabled(v3, v4))
    {
      v21 = *(_BYTE *)(v0 + 75);
      v22 = *(_BYTE *)(v0 + 76);
      v20 = *(_QWORD *)(v0 + 216);
      v18 = *(_OWORD *)(v0 + 184);
      v19 = *(_OWORD *)(v0 + 200);
      v5 = *(_BYTE *)(v0 + 74);
      v6 = *(_QWORD *)(v0 + 176);
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = swift_slowAlloc();
      v23 = v8;
      v24 = v6;
      *(_DWORD *)v7 = 136315138;
      v25 = v5;
      v26 = v18;
      v27 = v19;
      v28 = v20;
      v29 = v21;
      v30 = v22;
      v9 = SKStepActivationConfiguration.description.getter();
      *(_QWORD *)(v0 + 152) = sub_2147F3D14(v9, v10, &v23);
      sub_21485292C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2147EE000, v3, v4, "activation start: configuration=%s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199D75E8](v8, -1, -1);
      MEMORY[0x2199D75E8](v7, -1, -1);
    }

    v11 = *(_BYTE *)(v0 + 76);
    v12 = *(_BYTE *)(v0 + 75);
    v13 = *(_QWORD *)(v0 + 216);
    v14 = *(_BYTE *)(v0 + 74);
    *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 176);
    *(_BYTE *)(v0 + 24) = v14;
    v15 = *(_OWORD *)(v0 + 200);
    *(_OWORD *)(v0 + 32) = *(_OWORD *)(v0 + 184);
    *(_OWORD *)(v0 + 48) = v15;
    *(_QWORD *)(v0 + 64) = v13;
    *(_BYTE *)(v0 + 72) = v12;
    *(_BYTE *)(v0 + 73) = v11;
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 232) = v16;
    *v16 = v0;
    v16[1] = sub_214804AAC;
    return SKStepActivationServer.perform(configuration:)(v0 + 80, (uint64_t *)(v0 + 16));
  }
  else
  {
    LOBYTE(v24) = 1;
    type metadata accessor for SKError();
    SKError.__allocating_init(_:_:_:)((uint64_t)&v24, 0x6720726576726553, 0xEB00000000656E6FLL, 0);
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_214804AAC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 240) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_214804B10()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;

  v1 = *(_QWORD *)(v0 + 160);
  swift_release();
  v2 = *(_BYTE *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 96);
  v4 = *(_BYTE *)(v0 + 104);
  v5 = *(_QWORD *)(v0 + 112);
  v6 = *(_BYTE *)(v0 + 120);
  *(_QWORD *)v1 = *(_QWORD *)(v0 + 80);
  *(_BYTE *)(v1 + 8) = v2;
  *(_QWORD *)(v1 + 16) = v3;
  *(_BYTE *)(v1 + 24) = v4;
  *(_QWORD *)(v1 + 32) = v5;
  *(_BYTE *)(v1 + 40) = v6;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_214804B78()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_214804BAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t v7;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_2147F4FF0;
  return sub_214804790(a1, a2, v7, v2);
}

uint64_t SKStepActivationServer.perform(configuration:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v3 + 224) = a1;
  *(_QWORD *)(v3 + 232) = v2;
  v5 = sub_214852428();
  *(_QWORD *)(v3 + 240) = v5;
  *(_QWORD *)(v3 + 248) = *(_QWORD *)(v5 - 8);
  v6 = swift_task_alloc();
  v7 = *a2;
  *(_QWORD *)(v3 + 256) = v6;
  *(_QWORD *)(v3 + 264) = v7;
  *(_BYTE *)(v3 + 121) = *((_BYTE *)a2 + 8);
  v8 = *((_OWORD *)a2 + 2);
  *(_OWORD *)(v3 + 272) = *((_OWORD *)a2 + 1);
  *(_OWORD *)(v3 + 288) = v8;
  *(_QWORD *)(v3 + 304) = a2[6];
  *(_BYTE *)(v3 + 122) = *((_BYTE *)a2 + 56);
  *(_BYTE *)(v3 + 123) = *((_BYTE *)a2 + 57);
  sub_2147F4354(&qword_254D88A80, v9, (uint64_t (*)(uint64_t))type metadata accessor for SKStepActivationServer, (uint64_t)&protocol conformance descriptor for SKStepActivationServer);
  *(_QWORD *)(v3 + 312) = sub_2148527C4();
  *(_QWORD *)(v3 + 320) = v10;
  return swift_task_switch();
}

uint64_t sub_214804CDC()
{
  uint64_t v0;
  double v1;
  int v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  char v33;
  uint64_t (*v34)(uint64_t, uint64_t, uint64_t, uint64_t, char);
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;

  v1 = *(double *)(v0 + 264);
  *(double *)(v0 + 16) = v1;
  v2 = *(unsigned __int8 *)(v0 + 123);
  v3 = *(_BYTE *)(v0 + 122);
  v5 = *(_QWORD *)(v0 + 296);
  v4 = *(_QWORD *)(v0 + 304);
  v7 = *(_QWORD *)(v0 + 280);
  v6 = *(_QWORD *)(v0 + 288);
  v8 = *(_QWORD *)(v0 + 272);
  v9 = *(_BYTE *)(v0 + 121);
  *(_BYTE *)(v0 + 24) = v9;
  *(_QWORD *)(v0 + 32) = v8;
  *(_QWORD *)(v0 + 40) = v7;
  *(_QWORD *)(v0 + 48) = v6;
  *(_QWORD *)(v0 + 56) = v5;
  *(_QWORD *)(v0 + 64) = v4;
  *(_BYTE *)(v0 + 72) = v3;
  *(_BYTE *)(v0 + 73) = v2;
  *(_QWORD *)(v0 + 80) = 0;
  *(_BYTE *)(v0 + 88) = 1;
  *(_QWORD *)(v0 + 96) = 0;
  *(_BYTE *)(v0 + 104) = 1;
  *(_QWORD *)(v0 + 112) = 0;
  *(_BYTE *)(v0 + 120) = 1;
  if ((v9 & 1) != 0)
  {
    if (v2)
    {
      v10 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 344) = v10;
      *v10 = v0;
      v10[1] = sub_21480534C;
      return sub_214805CB4(v0 + 16);
    }
LABEL_7:
    *(_QWORD *)(v0 + 80) = v8;
    *(_BYTE *)(v0 + 88) = v7 & 1;
    *(_QWORD *)(v0 + 96) = v6;
    *(_BYTE *)(v0 + 104) = v5 & 1;
    *(_QWORD *)(v0 + 112) = v4;
    *(_BYTE *)(v0 + 120) = v3 & 1;
    goto LABEL_8;
  }
  if (v1 > 0.0)
  {
    v36 = *(_QWORD *)(*(_QWORD *)(v0 + 232) + 24);
    SKEnvironmentValues.clock.getter();
    v12 = sub_214852BCC();
    v14 = v13;
    v34 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_254D88AB0 + dword_254D88AB0);
    v15 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 328) = v15;
    *v15 = v0;
    v15[1] = sub_214805078;
    return v34(v12, v14, 0, 0, 1);
  }
  if ((v2 & 1) == 0)
    goto LABEL_7;
LABEL_8:
  if (qword_254D8CF40 != -1)
    swift_once();
  v16 = sub_214852494();
  __swift_project_value_buffer(v16, (uint64_t)qword_254D8CF48);
  v17 = sub_21485247C();
  v18 = sub_2148528D8();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v35 = v20;
    *(_DWORD *)v19 = 136315138;
    swift_beginAccess();
    v21 = *(_BYTE *)(v0 + 88);
    v22 = *(_QWORD *)(v0 + 96);
    v23 = *(_BYTE *)(v0 + 104);
    v24 = *(_QWORD *)(v0 + 112);
    v25 = *(_BYTE *)(v0 + 120);
    v36 = *(_QWORD *)(v0 + 80);
    v37 = v21;
    v38 = v22;
    v39 = v23;
    v40 = v24;
    v41 = v25;
    v26 = SKStepActivationReport.description.getter();
    *(_QWORD *)(v0 + 216) = sub_2147F3D14(v26, v27, &v35);
    sub_21485292C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2147EE000, v17, v18, "activation success: %s", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v20, -1, -1);
    MEMORY[0x2199D75E8](v19, -1, -1);
  }

  v28 = *(_QWORD *)(v0 + 224);
  swift_beginAccess();
  v29 = *(_BYTE *)(v0 + 88);
  v30 = *(_QWORD *)(v0 + 96);
  v31 = *(_BYTE *)(v0 + 104);
  v32 = *(_QWORD *)(v0 + 112);
  v33 = *(_BYTE *)(v0 + 120);
  *(_QWORD *)v28 = *(_QWORD *)(v0 + 80);
  *(_BYTE *)(v28 + 8) = v29;
  *(_QWORD *)(v28 + 16) = v30;
  *(_BYTE *)(v28 + 24) = v31;
  *(_QWORD *)(v28 + 32) = v32;
  *(_BYTE *)(v28 + 40) = v33;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_214805078()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 336) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2[31] + 8))(v2[32], v2[30]);
  return swift_task_switch();
}

uint64_t sub_2148050E8()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v25[2];
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;

  if ((*(_BYTE *)(v0 + 123) & 1) == 0)
  {
    v1 = *(_BYTE *)(v0 + 122);
    v2 = *(_QWORD *)(v0 + 304);
    v3 = *(_DWORD *)(v0 + 296);
    v4 = *(_QWORD *)(v0 + 288);
    v5 = *(_DWORD *)(v0 + 280);
    *(_QWORD *)(v0 + 80) = *(_QWORD *)(v0 + 272);
    *(_BYTE *)(v0 + 88) = v5 & 1;
    *(_QWORD *)(v0 + 96) = v4;
    *(_BYTE *)(v0 + 104) = v3 & 1;
    *(_QWORD *)(v0 + 112) = v2;
    *(_BYTE *)(v0 + 120) = v1 & 1;
  }
  if (qword_254D8CF40 != -1)
    swift_once();
  v6 = sub_214852494();
  __swift_project_value_buffer(v6, (uint64_t)qword_254D8CF48);
  v7 = sub_21485247C();
  v8 = sub_2148528D8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v25[0] = v10;
    *(_DWORD *)v9 = 136315138;
    swift_beginAccess();
    v11 = *(_BYTE *)(v0 + 88);
    v12 = *(_QWORD *)(v0 + 96);
    v13 = *(_BYTE *)(v0 + 104);
    v14 = *(_QWORD *)(v0 + 112);
    v15 = *(_BYTE *)(v0 + 120);
    v25[1] = *(_QWORD *)(v0 + 80);
    v26 = v11;
    v27 = v12;
    v28 = v13;
    v29 = v14;
    v30 = v15;
    v16 = SKStepActivationReport.description.getter();
    *(_QWORD *)(v0 + 216) = sub_2147F3D14(v16, v17, v25);
    sub_21485292C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2147EE000, v7, v8, "activation success: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v10, -1, -1);
    MEMORY[0x2199D75E8](v9, -1, -1);
  }

  v18 = *(_QWORD *)(v0 + 224);
  swift_beginAccess();
  v19 = *(_BYTE *)(v0 + 88);
  v20 = *(_QWORD *)(v0 + 96);
  v21 = *(_BYTE *)(v0 + 104);
  v22 = *(_QWORD *)(v0 + 112);
  v23 = *(_BYTE *)(v0 + 120);
  *(_QWORD *)v18 = *(_QWORD *)(v0 + 80);
  *(_BYTE *)(v18 + 8) = v19;
  *(_QWORD *)(v18 + 16) = v20;
  *(_BYTE *)(v18 + 24) = v21;
  *(_QWORD *)(v18 + 32) = v22;
  *(_BYTE *)(v18 + 40) = v23;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21480534C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 352) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2148053AC()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v20[2];
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;

  if (qword_254D8CF40 != -1)
    swift_once();
  v1 = sub_214852494();
  __swift_project_value_buffer(v1, (uint64_t)qword_254D8CF48);
  v2 = sub_21485247C();
  v3 = sub_2148528D8();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v20[0] = v5;
    *(_DWORD *)v4 = 136315138;
    swift_beginAccess();
    v6 = *(_BYTE *)(v0 + 88);
    v7 = *(_QWORD *)(v0 + 96);
    v8 = *(_BYTE *)(v0 + 104);
    v9 = *(_QWORD *)(v0 + 112);
    v10 = *(_BYTE *)(v0 + 120);
    v20[1] = *(_QWORD *)(v0 + 80);
    v21 = v6;
    v22 = v7;
    v23 = v8;
    v24 = v9;
    v25 = v10;
    v11 = SKStepActivationReport.description.getter();
    *(_QWORD *)(v0 + 216) = sub_2147F3D14(v11, v12, v20);
    sub_21485292C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2147EE000, v2, v3, "activation success: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v5, -1, -1);
    MEMORY[0x2199D75E8](v4, -1, -1);
  }

  v13 = *(_QWORD *)(v0 + 224);
  swift_beginAccess();
  v14 = *(_BYTE *)(v0 + 88);
  v15 = *(_QWORD *)(v0 + 96);
  v16 = *(_BYTE *)(v0 + 104);
  v17 = *(_QWORD *)(v0 + 112);
  v18 = *(_BYTE *)(v0 + 120);
  *(_QWORD *)v13 = *(_QWORD *)(v0 + 80);
  *(_BYTE *)(v13 + 8) = v14;
  *(_QWORD *)(v13 + 16) = v15;
  *(_BYTE *)(v13 + 24) = v16;
  *(_QWORD *)(v13 + 32) = v17;
  *(_BYTE *)(v13 + 40) = v18;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2148055CC()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_214805600()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;

  if (qword_254D8CF40 != -1)
    swift_once();
  v1 = *(void **)(v0 + 352);
  v2 = sub_214852494();
  __swift_project_value_buffer(v2, (uint64_t)qword_254D8CF48);
  v3 = v1;
  v4 = v1;
  v5 = sub_21485247C();
  v6 = sub_2148528CC();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 352);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v14 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_getErrorValue();
    v11 = sub_214852B6C();
    *(_QWORD *)(v0 + 200) = sub_2147F3D14(v11, v12, &v14);
    sub_21485292C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2147EE000, v5, v6, "### activation failed: error=%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v10, -1, -1);
    MEMORY[0x2199D75E8](v9, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_2148057F0()
{
  unint64_t result;

  result = qword_254D88A98;
  if (!qword_254D88A98)
  {
    result = MEMORY[0x2199D7540](&unk_214858278, &type metadata for SKStepActivationStartRequestHandler);
    atomic_store(result, (unint64_t *)&qword_254D88A98);
  }
  return result;
}

uint64_t SKStepActivationServer.cancel()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[2] = v2;
  sub_2147F4354(&qword_254D88A80, a2, (uint64_t (*)(uint64_t))type metadata accessor for SKStepActivationServer, (uint64_t)&protocol conformance descriptor for SKStepActivationServer);
  v3[3] = sub_2148527C4();
  v3[4] = v4;
  return swift_task_switch();
}

uint64_t sub_2148058A0()
{
  uint64_t v0;
  uint64_t Strong;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 16) = 1;
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    *(_QWORD *)(v0 + 40) = *(_QWORD *)(Strong + OBJC_IVAR____TtC8SetupKit8SKServer_nexusSession);
    swift_retain();
    swift_release();
    sub_21485262C();
    sub_2147F4354(&qword_254D88200, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC80], MEMORY[0x24BE6DC90]);
    sub_2148527C4();
    return swift_task_switch();
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(v0 + 16) + 40) = 0;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_214805980()
{
  sub_2148525B4();
  return swift_task_switch();
}

uint64_t sub_2148059D0()
{
  uint64_t v0;

  swift_release();
  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 40) = 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_214805A08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;

  *(_QWORD *)(v6 + 56) = v5;
  v12 = sub_21485241C();
  *(_QWORD *)(v6 + 64) = v12;
  *(_QWORD *)(v6 + 72) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v6 + 80) = swift_task_alloc();
  *(_QWORD *)(v6 + 88) = swift_task_alloc();
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = a2;
  *(_QWORD *)(v6 + 16) = a3;
  *(_QWORD *)(v6 + 24) = a4;
  *(_BYTE *)(v6 + 32) = a5 & 1;
  return swift_task_switch();
}

uint64_t sub_214805AAC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  _QWORD *v5;

  v1 = v0[10];
  v2 = v0[8];
  v3 = v0[9];
  sub_214852428();
  sub_2147F4354(&qword_254D88C08, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE29D60], MEMORY[0x24BE29D88]);
  sub_214852B54();
  sub_2147F4354(&qword_254D88C10, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE29D38], MEMORY[0x24BE29D58]);
  sub_2148529C8();
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v4;
  v4(v1, v2);
  v5 = (_QWORD *)swift_task_alloc();
  v0[13] = v5;
  *v5 = v0;
  v5[1] = sub_214805BCC;
  return sub_214852B60();
}

uint64_t sub_214805BCC()
{
  uint64_t v0;
  uint64_t *v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  v3 = *(_QWORD *)(*v1 + 88);
  v4 = *(_QWORD *)(*v1 + 64);
  v5 = *v1;
  *(_QWORD *)(v5 + 112) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_214805C78()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_214805CB4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2[37] = a1;
  v2[38] = v1;
  v3 = sub_214852290();
  v2[39] = v3;
  v2[40] = *(_QWORD *)(v3 - 8);
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  v4 = sub_214852428();
  v2[43] = v4;
  v2[44] = *(_QWORD *)(v4 - 8);
  v2[45] = swift_task_alloc();
  v5 = sub_21485241C();
  v2[46] = v5;
  v2[47] = *(_QWORD *)(v5 - 8);
  v2[48] = swift_task_alloc();
  v2[49] = swift_task_alloc();
  v2[50] = swift_task_alloc();
  v2[51] = swift_task_alloc();
  v6 = sub_214852494();
  v2[52] = v6;
  v2[53] = *(_QWORD *)(v6 - 8);
  v2[54] = swift_task_alloc();
  sub_2147F4354(&qword_254D88A80, v7, (uint64_t (*)(uint64_t))type metadata accessor for SKStepActivationServer, (uint64_t)&protocol conformance descriptor for SKStepActivationServer);
  v2[55] = sub_2148527C4();
  v2[56] = v8;
  return swift_task_switch();
}

uint64_t sub_214805E2C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t (*v31)(void);
  char v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  _QWORD *v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  os_log_type_t v59;
  uint64_t v60;
  uint64_t v61[2];

  v61[1] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(v0 + 272) = 0;
  v1 = MAEGetActivationStateWithError();
  v2 = *(void **)(v0 + 272);
  *(_QWORD *)(v0 + 208) = v2;
  if (v1)
  {
    v3 = (void *)v1;
    v4 = sub_2148526C8();
    v6 = v5;
    v7 = v2;

  }
  else
  {
    v8 = v2;
    v4 = 0;
    v6 = 0;
  }
  if (qword_254D8CF40 != -1)
    swift_once();
  v10 = *(_QWORD *)(v0 + 424);
  v9 = *(_QWORD *)(v0 + 432);
  v11 = *(_QWORD *)(v0 + 416);
  v12 = __swift_project_value_buffer(v11, (uint64_t)qword_254D8CF48);
  *(_QWORD *)(v0 + 456) = v12;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v12, v11);
  swift_bridgeObjectRetain_n();
  v13 = sub_21485247C();
  v14 = sub_2148528D8();
  if (os_log_type_enabled(v13, v14))
  {
    v59 = v14;
    v56 = v13;
    v15 = swift_slowAlloc();
    v58 = swift_slowAlloc();
    v61[0] = v58;
    *(_DWORD *)v15 = 136315394;
    v60 = v4;
    if (v6)
      v16 = v4;
    else
      v16 = 7104878;
    v17 = 0xE300000000000000;
    v18 = (_QWORD *)(v0 + 208);
    if (v6)
      v19 = v6;
    else
      v19 = 0xE300000000000000;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 264) = sub_2147F3D14(v16, v19, v61);
    sub_21485292C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v15 + 12) = 2080;
    swift_beginAccess();
    if (*v18)
    {
      *(_QWORD *)(v0 + 280) = *v18;
      sub_21480A4BC();
      sub_2147F4354(&qword_254D88C28, 255, (uint64_t (*)(uint64_t))sub_21480A4BC, MEMORY[0x24BDD01A8]);
      v20 = sub_214852B6C();
      v17 = v21;
      v22 = v56;
    }
    else
    {
      v22 = v56;
      v20 = 7104878;
    }
    v26 = *(_QWORD *)(v0 + 424);
    v57 = *(_QWORD *)(v0 + 432);
    v27 = *(_QWORD *)(v0 + 416);
    *(_QWORD *)(v0 + 288) = sub_2147F3D14(v20, v17, v61);
    sub_21485292C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2147EE000, v22, v59, "activation state: %s, error=%s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v58, -1, -1);
    MEMORY[0x2199D75E8](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v57, v27);
    v4 = v60;
    if (!v6)
      goto LABEL_28;
  }
  else
  {
    v24 = *(_QWORD *)(v0 + 424);
    v23 = *(_QWORD *)(v0 + 432);
    v25 = *(_QWORD *)(v0 + 416);
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
    if (!v6)
      goto LABEL_28;
  }
  if (v4 == sub_2148526C8() && v6 == v28)
    goto LABEL_24;
  v29 = sub_214852B18();
  swift_bridgeObjectRelease();
  if ((v29 & 1) != 0)
  {
LABEL_25:
    swift_bridgeObjectRelease();
LABEL_26:

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v31 = *(uint64_t (**)(void))(v0 + 8);
    return v31();
  }
  if (v4 == sub_2148526C8() && v6 == v30)
  {
LABEL_24:
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  v32 = sub_214852B18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v32 & 1) != 0)
    goto LABEL_26;
LABEL_28:
  v33 = sub_21485247C();
  v34 = sub_2148528D8();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v35 = 0;
    _os_log_impl(&dword_2147EE000, v33, v34, "session request start", v35, 2u);
    MEMORY[0x2199D75E8](v35, -1, -1);
  }
  v37 = *(_QWORD *)(v0 + 352);
  v36 = *(_QWORD *)(v0 + 360);
  v38 = *(_QWORD *)(v0 + 344);
  v39 = *(_QWORD *)(v0 + 304);

  v40 = *(_QWORD *)(v39 + 24);
  *(_QWORD *)(v0 + 464) = v40;
  v61[0] = v40;
  SKEnvironmentValues.clock.getter();
  sub_214852404();
  v41 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
  *(_QWORD *)(v0 + 472) = v41;
  v41(v36, v38);
  *(_QWORD *)(v0 + 216) = 0;
  swift_beginAccess();
  v42 = *(void **)(v0 + 208);
  *(_QWORD *)(v0 + 184) = v42;
  LODWORD(v39) = MAECreateSessionRequestWithError();
  v43 = *(void **)(v0 + 184);
  *(_QWORD *)(v0 + 208) = v43;
  swift_endAccess();
  v44 = v43;

  v45 = *(void **)(v0 + 216);
  *(_QWORD *)(v0 + 480) = v45;
  if ((_DWORD)v39 && v45)
  {
    v46 = (void *)objc_opt_self();
    v47 = v45;
    v48 = objc_msgSend(v46, sel_defaultSessionConfiguration);
    *(_QWORD *)(v0 + 488) = v48;
    objc_msgSend(v47, sel_timeoutInterval);
    objc_msgSend(v48, sel_setTimeoutIntervalForResource_);
    objc_msgSend(v48, sel_setWaitsForConnectivity_, 1);
    *(_QWORD *)(v0 + 496) = objc_msgSend((id)objc_opt_self(), sel_sessionWithConfiguration_, v48);
    sub_214852284();
    v49 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 504) = v49;
    *v49 = v0;
    v49[1] = sub_2148065E8;
    return sub_2148528A8();
  }
  v51 = *(_QWORD *)(v0 + 408);
  v52 = *(_QWORD *)(v0 + 368);
  v53 = *(_QWORD *)(v0 + 376);
  LOBYTE(v61[0]) = 1;
  type metadata accessor for SKError();
  v54 = v45;
  v55 = v44;
  SKError.__allocating_init(_:_:_:)((uint64_t)v61, 0xD00000000000001ELL, 0x800000021485E0E0, v43);
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v51, v52);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v31 = *(uint64_t (**)(void))(v0 + 8);
  return v31();
}

uint64_t sub_2148065E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);

  v5 = (_QWORD *)*v4;
  v5[64] = a1;
  v5[65] = a2;
  v5[66] = a3;
  v5[67] = v3;
  swift_task_dealloc();
  v6 = v5[42];
  v7 = v5[39];
  v8 = *(void (**)(uint64_t, uint64_t))(v5[40] + 8);
  if (!v3)
    v5[68] = v8;
  v8(v6, v7);
  return swift_task_switch();
}

uint64_t sub_2148066C4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  double v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  _QWORD *v30;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  void (*v48)(uint64_t, uint64_t);
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  objc_opt_self();
  v1 = swift_dynamicCastObjCClass();
  v2 = *(void **)(v0 + 528);
  if (v1)
  {
    v3 = (void *)v1;
    v4 = v2;
    if (objc_msgSend(v3, sel_statusCode) == (id)200)
    {
      v5 = *(void (**)(uint64_t, uint64_t))(v0 + 472);
      v6 = *(_QWORD *)(v0 + 400);
      v8 = *(_QWORD *)(v0 + 368);
      v7 = *(_QWORD *)(v0 + 376);
      v9 = *(_QWORD *)(v0 + 360);
      v10 = *(_QWORD *)(v0 + 344);
      v11 = *(_QWORD *)(v0 + 296);
      v61 = *(_QWORD *)(v0 + 464);
      SKEnvironmentValues.clock.getter();
      sub_214852404();
      v5(v9, v10);
      sub_214852410();
      v12 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
      *(_QWORD *)(v0 + 552) = v12;
      v48 = v12;
      v12(v6, v8);
      v13 = Duration.seconds.getter();
      *(double *)(v11 + 96) = v13;
      *(_BYTE *)(v11 + 104) = 0;
      v14 = sub_21485247C();
      v15 = sub_2148528D8();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v16 = 134217984;
        *(double *)(v0 + 256) = v13;
        sub_21485292C();
        _os_log_impl(&dword_2147EE000, v14, v15, "session request success: time=%f", v16, 0xCu);
        MEMORY[0x2199D75E8](v16, -1, -1);
      }

      v17 = sub_21485247C();
      v18 = sub_2148528D8();
      if (os_log_type_enabled(v17, v18))
      {
        v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_2147EE000, v17, v18, "activation request start", v19, 2u);
        MEMORY[0x2199D75E8](v19, -1, -1);
      }
      v21 = *(_QWORD *)(v0 + 464);
      v20 = *(void (**)(uint64_t, uint64_t))(v0 + 472);
      v22 = *(_QWORD *)(v0 + 360);
      v23 = *(_QWORD *)(v0 + 344);

      v61 = v21;
      SKEnvironmentValues.clock.getter();
      sub_214852404();
      v20(v22, v23);
      v24 = (void *)sub_2148523B0();
      *(_QWORD *)(v0 + 176) = 0;
      swift_beginAccess();
      v25 = *(void **)(v0 + 208);
      *(_QWORD *)(v0 + 192) = v25;
      LODWORD(v21) = MAECreateActivationRequestWithError();
      v26 = *(void **)(v0 + 192);
      *(_QWORD *)(v0 + 208) = v26;
      swift_endAccess();
      v27 = v26;

      v28 = *(void **)(v0 + 176);
      *(_QWORD *)(v0 + 560) = v28;
      if ((_DWORD)v21 && v28)
      {
        sub_214852284();
        v29 = v28;
        v30 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 568) = v30;
        *v30 = v0;
        v30[1] = sub_214806D6C;
        return sub_2148528A8();
      }
      v42 = *(void **)(v0 + 528);
      v43 = *(_QWORD *)(v0 + 512);
      v44 = *(void **)(v0 + 496);
      v38 = *(void **)(v0 + 480);
      v56 = *(_QWORD *)(v0 + 408);
      v59 = *(void **)(v0 + 488);
      v51 = *(_QWORD *)(v0 + 520);
      v53 = *(_QWORD *)(v0 + 392);
      v45 = *(_QWORD *)(v0 + 368);
      LOBYTE(v61) = 1;
      type metadata accessor for SKError();
      v46 = v28;
      v47 = v27;
      SKError.__allocating_init(_:_:_:)((uint64_t)&v61, 0xD000000000000021, 0x800000021485E150, v26);
      swift_willThrow();
      sub_2147F8898(v43, v51);

      v48(v53, v45);
      objc_msgSend(v44, sel_invalidateAndCancel);

      v48(v56, v45);
    }
    else
    {
      v39 = *(void **)(v0 + 528);
      v40 = *(_QWORD *)(v0 + 512);
      v41 = *(void **)(v0 + 496);
      v38 = *(void **)(v0 + 480);
      v55 = *(void **)(v0 + 488);
      v58 = *(_QWORD *)(v0 + 408);
      v49 = *(_QWORD *)(v0 + 520);
      v50 = *(_QWORD *)(v0 + 376);
      v52 = *(_QWORD *)(v0 + 368);
      type metadata accessor for SKError();
      v60 = 1;
      sub_21485298C();
      swift_bridgeObjectRelease();
      v61 = 0xD000000000000024;
      v62 = 0x800000021485E120;
      *(_QWORD *)(v0 + 168) = objc_msgSend(v3, sel_statusCode);
      sub_214852B00();
      sub_214852704();
      swift_bridgeObjectRelease();
      SKError.__allocating_init(_:_:_:)((uint64_t)&v60, v61, v62, 0);
      swift_willThrow();

      sub_2147F8898(v40, v49);
      objc_msgSend(v41, sel_invalidateAndCancel);

      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v58, v52);
    }
  }
  else
  {
    v32 = *(_QWORD *)(v0 + 520);
    v33 = *(_QWORD *)(v0 + 512);
    v34 = *(void **)(v0 + 496);
    v54 = *(void **)(v0 + 488);
    v35 = *(void **)(v0 + 480);
    v57 = *(_QWORD *)(v0 + 408);
    v37 = *(_QWORD *)(v0 + 368);
    v36 = *(_QWORD *)(v0 + 376);
    type metadata accessor for SKError();
    LOBYTE(v61) = 1;
    SKError.__allocating_init(_:_:_:)((uint64_t)&v61, 0xD000000000000019, 0x800000021485E100, 0);
    swift_willThrow();

    v38 = v35;
    sub_2147F8898(v33, v32);
    objc_msgSend(v34, sel_invalidateAndCancel);

    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v57, v37);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_214806D6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  v5 = *v4;
  *(_QWORD *)(v5 + 576) = a1;
  *(_QWORD *)(v5 + 584) = a2;
  *(_QWORD *)(v5 + 592) = a3;
  *(_QWORD *)(v5 + 600) = v3;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v5 + 544))(*(_QWORD *)(v5 + 328), *(_QWORD *)(v5 + 312));
  return swift_task_switch();
}

uint64_t sub_214806E3C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  void (*v5)(uint64_t, uint64_t);
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  unint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void (*v29)(id, uint64_t);
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t (*v34)(void);
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t inited;
  uint64_t v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  void *v61;
  unint64_t v62;
  uint64_t v63;
  void *v64;
  void (*v65)(uint64_t, uint64_t);
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void (*v70)(uint64_t, uint64_t);
  void *v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void (*v90)(id, uint64_t);
  void (*v91)(id, uint64_t);
  uint64_t v92;
  uint64_t v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  objc_opt_self();
  v1 = swift_dynamicCastObjCClass();
  v2 = *(void **)(v0 + 592);
  if (!v1)
  {
    v83 = *(_QWORD *)(v0 + 584);
    v80 = *(_QWORD *)(v0 + 576);
    v23 = *(void **)(v0 + 560);
    v90 = *(void (**)(id, uint64_t))(v0 + 552);
    v24 = *(void **)(v0 + 528);
    v25 = *(_QWORD *)(v0 + 520);
    v26 = *(_QWORD *)(v0 + 512);
    v27 = *(void **)(v0 + 496);
    v98 = *(id *)(v0 + 488);
    v101 = *(void **)(v0 + 480);
    v94 = *(id *)(v0 + 408);
    v86 = *(void **)(v0 + 392);
    v28 = *(_QWORD *)(v0 + 368);
    type metadata accessor for SKError();
    LOBYTE(v106) = 1;
    SKError.__allocating_init(_:_:_:)((uint64_t)&v106, 0xD00000000000001CLL, 0x800000021485E180, 0);
    swift_willThrow();
    sub_2147F8898(v26, v25);

    sub_2147F8898(v80, v83);
    v29 = v90;
    v90(v86, v28);

    v30 = v101;
LABEL_9:
    objc_msgSend(v27, sel_invalidateAndCancel);

    v29(v94, v28);
LABEL_10:

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v34 = *(uint64_t (**)(void))(v0 + 8);
    return v34();
  }
  v3 = (void *)v1;
  v4 = v2;
  if (objc_msgSend(v3, sel_statusCode) != (id)200)
  {
    v31 = *(void **)(v0 + 592);
    v78 = *(_QWORD *)(v0 + 576);
    v81 = *(_QWORD *)(v0 + 584);
    v32 = *(void **)(v0 + 560);
    v33 = *(void **)(v0 + 528);
    v75 = *(_QWORD *)(v0 + 512);
    v76 = *(_QWORD *)(v0 + 520);
    v27 = *(void **)(v0 + 496);
    v98 = *(id *)(v0 + 488);
    v102 = *(void **)(v0 + 480);
    v91 = *(void (**)(id, uint64_t))(v0 + 552);
    v94 = *(id *)(v0 + 408);
    v84 = *(_QWORD *)(v0 + 368);
    v87 = *(void **)(v0 + 392);
    type metadata accessor for SKError();
    v105 = 1;
    sub_21485298C();
    swift_bridgeObjectRelease();
    v106 = 0xD000000000000027;
    v107 = 0x800000021485E1A0;
    *(_QWORD *)(v0 + 200) = objc_msgSend(v3, sel_statusCode);
    sub_214852B00();
    sub_214852704();
    swift_bridgeObjectRelease();
    SKError.__allocating_init(_:_:_:)((uint64_t)&v105, v106, v107, 0);
    swift_willThrow();
    sub_2147F8898(v75, v76);

    sub_2147F8898(v78, v81);
    v30 = v102;

    v28 = v84;
    v29 = v91;
    v91(v87, v84);

    goto LABEL_9;
  }
  v5 = *(void (**)(uint64_t, uint64_t))(v0 + 552);
  v97 = v3;
  v6 = *(void (**)(uint64_t, uint64_t))(v0 + 472);
  v7 = *(_QWORD *)(v0 + 400);
  v9 = *(_QWORD *)(v0 + 360);
  v8 = *(_QWORD *)(v0 + 368);
  v10 = *(_QWORD *)(v0 + 344);
  v11 = *(_QWORD *)(v0 + 296);
  v106 = *(_QWORD *)(v0 + 464);
  SKEnvironmentValues.clock.getter();
  sub_214852404();
  v6(v9, v10);
  sub_214852410();
  v5(v7, v8);
  v12 = Duration.seconds.getter();
  *(double *)(v11 + 80) = v12;
  *(_BYTE *)(v11 + 88) = 0;
  v13 = sub_21485247C();
  v14 = sub_2148528D8();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v15 = 134217984;
    *(double *)(v0 + 248) = v12;
    sub_21485292C();
    _os_log_impl(&dword_2147EE000, v13, v14, "activation request success: time=%f", v15, 0xCu);
    MEMORY[0x2199D75E8](v15, -1, -1);
  }
  v16 = *(_QWORD *)(v0 + 584);
  v17 = *(_QWORD *)(v0 + 576);

  sub_2147F51E4(v17, v16);
  v18 = sub_21485247C();
  v19 = sub_2148528D8();
  v20 = os_log_type_enabled(v18, v19);
  v21 = *(_QWORD *)(v0 + 584);
  if (v20)
  {
    v22 = v21 >> 62;
    *(_DWORD *)swift_slowAlloc() = 134217984;
    __asm { BR              X10 }
  }
  sub_2147F8898(*(_QWORD *)(v0 + 576), v21);
  v37 = *(_QWORD *)(v0 + 464);
  v36 = *(void (**)(uint64_t, uint64_t))(v0 + 472);
  v38 = *(_QWORD *)(v0 + 360);
  v39 = *(_QWORD *)(v0 + 344);

  v106 = v37;
  SKEnvironmentValues.clock.getter();
  sub_214852404();
  v36(v38, v39);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88C18);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_214857F80;
  *(_QWORD *)(inited + 32) = sub_2148526C8();
  *(_QWORD *)(inited + 40) = v41;
  v42 = objc_msgSend(v97, sel_allHeaderFields);
  v43 = sub_214852668();

  *(_QWORD *)(inited + 48) = v43;
  v44 = sub_214807B30(inited);
  v45 = (void *)sub_2148523B0();
  sub_214807C48(v44);
  swift_bridgeObjectRelease();
  v46 = (void *)sub_21485265C();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v47 = *(void **)(v0 + 208);
  *(_QWORD *)(v0 + 224) = v47;
  LODWORD(v39) = MAEActivateDeviceWithError();
  v48 = *(void **)(v0 + 224);
  *(_QWORD *)(v0 + 208) = v48;
  swift_endAccess();
  v49 = v48;

  if (!(_DWORD)v39)
  {
    v69 = *(void **)(v0 + 592);
    v79 = *(_QWORD *)(v0 + 576);
    v82 = *(_QWORD *)(v0 + 584);
    v70 = *(void (**)(uint64_t, uint64_t))(v0 + 552);
    v71 = *(void **)(v0 + 528);
    v77 = *(_QWORD *)(v0 + 520);
    v72 = *(_QWORD *)(v0 + 512);
    v30 = *(void **)(v0 + 480);
    v104 = *(void **)(v0 + 488);
    v96 = *(id *)(v0 + 496);
    v100 = *(id *)(v0 + 408);
    v89 = *(void **)(v0 + 560);
    v93 = *(_QWORD *)(v0 + 392);
    v85 = *(_QWORD *)(v0 + 384);
    v73 = *(_QWORD *)(v0 + 368);
    LOBYTE(v106) = 1;
    type metadata accessor for SKError();
    v74 = v49;
    SKError.__allocating_init(_:_:_:)((uint64_t)&v106, 0xD000000000000018, 0x800000021485E1D0, v48);
    swift_willThrow();
    sub_2147F8898(v72, v77);

    sub_2147F8898(v79, v82);
    v70(v85, v73);
    v70(v93, v73);

    objc_msgSend(v96, sel_invalidateAndCancel);
    v70((uint64_t)v100, v73);
    goto LABEL_10;
  }
  v50 = *(void (**)(uint64_t, uint64_t))(v0 + 552);
  v51 = *(void (**)(uint64_t, uint64_t))(v0 + 472);
  v52 = *(_QWORD *)(v0 + 400);
  v54 = *(_QWORD *)(v0 + 360);
  v53 = *(_QWORD *)(v0 + 368);
  v55 = *(_QWORD *)(v0 + 344);
  v56 = *(_QWORD *)(v0 + 296);
  v106 = *(_QWORD *)(v0 + 464);
  SKEnvironmentValues.clock.getter();
  sub_214852404();
  v51(v54, v55);
  sub_214852410();
  v50(v52, v53);
  v57 = Duration.seconds.getter();
  *(double *)(v56 + 64) = v57;
  *(_BYTE *)(v56 + 72) = 0;
  v58 = sub_21485247C();
  v59 = sub_2148528D8();
  if (os_log_type_enabled(v58, v59))
  {
    v60 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v60 = 134217984;
    *(double *)(v0 + 232) = v57;
    sub_21485292C();
    _os_log_impl(&dword_2147EE000, v58, v59, "active completed: time=%f", v60, 0xCu);
    MEMORY[0x2199D75E8](v60, -1, -1);
  }
  v61 = *(void **)(v0 + 592);
  v62 = *(_QWORD *)(v0 + 584);
  v63 = *(_QWORD *)(v0 + 576);
  v64 = *(void **)(v0 + 560);
  v65 = *(void (**)(uint64_t, uint64_t))(v0 + 552);
  v66 = *(void **)(v0 + 528);
  v67 = *(void **)(v0 + 496);
  v95 = *(id *)(v0 + 480);
  v99 = *(id *)(v0 + 488);
  v103 = *(_QWORD *)(v0 + 408);
  v88 = *(_QWORD *)(v0 + 384);
  v92 = *(_QWORD *)(v0 + 392);
  v68 = *(_QWORD *)(v0 + 368);
  sub_2147F8898(*(_QWORD *)(v0 + 512), *(_QWORD *)(v0 + 520));

  sub_2147F8898(v63, v62);
  v65(v88, v68);
  v65(v92, v68);

  objc_msgSend(v67, sel_invalidateAndCancel);
  v65(v103, v68);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v34 = *(uint64_t (**)(void))(v0 + 8);
  return v34();
}

uint64_t sub_2148078D4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(void **)(v0 + 488);
  v1 = *(void **)(v0 + 496);
  v3 = *(void **)(v0 + 480);
  v4 = *(_QWORD *)(v0 + 408);
  v5 = *(_QWORD *)(v0 + 368);
  v6 = *(_QWORD *)(v0 + 376);
  objc_msgSend(v1, sel_invalidateAndCancel);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2148079E8()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t);
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(void **)(v0 + 560);
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 552);
  v3 = *(void **)(v0 + 528);
  v5 = *(void **)(v0 + 488);
  v4 = *(void **)(v0 + 496);
  v6 = *(void **)(v0 + 480);
  v7 = *(_QWORD *)(v0 + 408);
  v8 = *(_QWORD *)(v0 + 392);
  v9 = *(_QWORD *)(v0 + 368);
  sub_2147F8898(*(_QWORD *)(v0 + 512), *(_QWORD *)(v0 + 520));

  v2(v8, v9);
  objc_msgSend(v4, sel_invalidateAndCancel);

  v2(v7, v9);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_214807B30(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88C40);
  v2 = (_QWORD *)sub_214852A1C();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_214803EE8(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_214807C48(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D88C30);
    v2 = sub_214852A1C();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v27 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v26 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v26)
        goto LABEL_37;
      v14 = *(_QWORD *)(v27 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v26)
          goto LABEL_37;
        v14 = *(_QWORD *)(v27 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v26)
            goto LABEL_37;
          v14 = *(_QWORD *)(v27 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v18 = v17[1];
    *(_QWORD *)&v36[0] = *v17;
    *((_QWORD *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D88C38);
    swift_dynamicCast();
    v32 = v28;
    v33 = v29;
    v34 = v30;
    sub_2147F272C(&v31, v35);
    v28 = v32;
    v29 = v33;
    v30 = v34;
    sub_2147F272C(v35, v36);
    sub_2147F272C(v36, &v32);
    result = sub_214852968();
    v19 = -1 << *(_BYTE *)(v2 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(_QWORD *)(v10 + 32) = v30;
    result = (uint64_t)sub_2147F272C(&v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_21480A4F8();
    return v2;
  }
  v14 = *(_QWORD *)(v27 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

void __swiftcall SKStepActivationReport.init()(SetupKit::SKStepActivationReport *__return_ptr retstr)
{
  retstr->activateTime.value = 0.0;
  retstr->activateTime.is_nil = 1;
  retstr->activationRequestTime.value = 0.0;
  retstr->activationRequestTime.is_nil = 1;
  retstr->sessionRequestTime.value = 0.0;
  retstr->sessionRequestTime.is_nil = 1;
}

uint64_t SKStepActivationServer.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_weakDestroy();
  return v0;
}

uint64_t SKStepActivationServer.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_21480806C()
{
  uint64_t *v0;

  return SKEnvironmental<>.unownedExecutor.getter(*v0, (uint64_t)&protocol witness table for SKStepActivationServer);
}

uint64_t SKStepActivationConfiguration.mockActivationTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t SKStepActivationConfiguration.mockActivationTime.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*SKStepActivationConfiguration.mockActivationTime.modify())()
{
  return nullsub_1;
}

__n128 SKStepActivationConfiguration.mockReport.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  __n128 result;
  __int128 v6;

  v2 = *(_QWORD *)(v1 + 48);
  v3 = *(_BYTE *)(v1 + 56);
  v4 = *(_BYTE *)(v1 + 57);
  result = *(__n128 *)(v1 + 16);
  v6 = *(_OWORD *)(v1 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = v2;
  *(_BYTE *)(a1 + 40) = v3;
  *(_BYTE *)(a1 + 41) = v4;
  return result;
}

__n128 SKStepActivationConfiguration.mockReport.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  __n128 result;
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 40);
  v4 = *(_BYTE *)(a1 + 41);
  result = *(__n128 *)a1;
  v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 32) = v6;
  *(_QWORD *)(v1 + 48) = v2;
  *(_BYTE *)(v1 + 56) = v3;
  *(_BYTE *)(v1 + 57) = v4;
  return result;
}

uint64_t (*SKStepActivationConfiguration.mockReport.modify())()
{
  return nullsub_1;
}

void __swiftcall SKStepActivationConfiguration.init()(SetupKit::SKStepActivationConfiguration *__return_ptr retstr)
{
  retstr->mockActivationTime.value = 0.0;
  retstr->mockActivationTime.is_nil = 1;
  *(_OWORD *)&retstr->mockReport.value.activateTime.value = 0u;
  *(_OWORD *)&retstr->mockReport.value.activationRequestTime.value = 0u;
  *(_OWORD *)retstr->mockReport.value.gap19 = 0u;
  retstr->mockReport.is_nil = 1;
}

uint64_t SKStepActivationConfiguration.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v1 = sub_2148523F8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_BYTE *)(v0 + 8);
  v6 = *(_QWORD *)(v0 + 16);
  v7 = *(_QWORD *)(v0 + 24);
  v9 = *(_QWORD *)(v0 + 32);
  v8 = *(_QWORD *)(v0 + 40);
  v15 = *(_QWORD *)(v0 + 48);
  HIDWORD(v14) = *(unsigned __int8 *)(v0 + 56);
  v10 = *(_BYTE *)(v0 + 57);
  v24 = 0;
  v25 = 0xE000000000000000;
  sub_2148523EC();
  if ((v5 & 1) == 0)
  {
    v16 = 0;
    v17 = 0xE000000000000000;
    sub_21485298C();
    sub_214852704();
    sub_214852878();
    sub_2148526D4();
    swift_bridgeObjectRelease();
  }
  if ((v10 & 1) == 0)
  {
    v22 = 0x6F7065526B636F6DLL;
    v23 = 0xEB000000003D7472;
    v16 = v6;
    LOBYTE(v17) = v7 & 1;
    v18 = v9;
    v19 = v8 & 1;
    v20 = v15;
    v21 = BYTE4(v14) & 1;
    SKStepActivationReport.description.getter();
    sub_214852704();
    swift_bridgeObjectRelease();
    sub_2148526D4();
    swift_bridgeObjectRelease();
  }
  v11 = v24;
  v12 = HIBYTE(v25) & 0xF;
  if ((v25 & 0x2000000000000000) == 0)
    v12 = v24 & 0xFFFFFFFFFFFFLL;
  if (!v12)
  {
    swift_bridgeObjectRelease();
    v11 = 0x746C7561666564;
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v11;
}

uint64_t sub_214808320(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6F7065526B636F6DLL;
  else
    return 0xD000000000000012;
}

BOOL sub_214808360(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_214808378()
{
  char *v0;

  return sub_214808320(*v0);
}

uint64_t sub_214808380@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21480A15C(a1, a2);
  *a3 = result;
  return result;
}

void sub_2148083A4(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2148083B0()
{
  sub_214809658();
  return sub_214852BD8();
}

uint64_t sub_2148083D8()
{
  sub_214809658();
  return sub_214852BE4();
}

uint64_t SKStepActivationConfiguration.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  int v11;
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
  uint64_t v22;
  char v23;
  char v24;
  int v25;
  char v26;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88AC0);
  v17 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v15 = *(_QWORD *)(v1 + 24);
  v16 = v7;
  v8 = *(_QWORD *)(v1 + 32);
  v13 = *(_QWORD *)(v1 + 40);
  v14 = v8;
  v12 = *(_QWORD *)(v1 + 48);
  v25 = *(unsigned __int8 *)(v1 + 56);
  v11 = *(unsigned __int8 *)(v1 + 57);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_214809658();
  sub_214852BB4();
  LOBYTE(v18) = 0;
  sub_214852AA0();
  if (!v2)
  {
    v18 = v16;
    v19 = v15;
    v20 = v14;
    v21 = v13;
    v22 = v12;
    v23 = v25;
    v24 = v11;
    v26 = 1;
    sub_21480969C();
    sub_214852AB8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v6, v4);
}

uint64_t SKStepActivationConfiguration.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  char v13;
  char v14;
  __int128 v15;
  __int128 v16;
  _OWORD v18[2];
  uint64_t v19;
  char v20;
  char v21;
  char v22;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88AD0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_214809658();
  sub_214852BA8();
  if (!v2)
  {
    LOBYTE(v18[0]) = 0;
    v9 = sub_214852A4C();
    v11 = v10;
    v22 = 1;
    sub_2148096E0();
    sub_214852A64();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v12 = v19;
    v13 = v20;
    v14 = v21;
    v15 = v18[0];
    v16 = v18[1];
    *(_QWORD *)a2 = v9;
    *(_BYTE *)(a2 + 8) = v11 & 1;
    *(_OWORD *)(a2 + 16) = v15;
    *(_OWORD *)(a2 + 32) = v16;
    *(_QWORD *)(a2 + 48) = v12;
    *(_BYTE *)(a2 + 56) = v13;
    *(_BYTE *)(a2 + 57) = v14;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_214808728@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SKStepActivationConfiguration.init(from:)(a1, a2);
}

uint64_t sub_21480873C(_QWORD *a1)
{
  return SKStepActivationConfiguration.encode(to:)(a1);
}

uint64_t SKStepActivationReport.activateTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t SKStepActivationReport.activateTime.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*SKStepActivationReport.activateTime.modify())()
{
  return nullsub_1;
}

uint64_t SKStepActivationReport.activationRequestTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t SKStepActivationReport.activationRequestTime.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = result;
  *(_BYTE *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t (*SKStepActivationReport.activationRequestTime.modify())()
{
  return nullsub_1;
}

uint64_t SKStepActivationReport.sessionRequestTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t SKStepActivationReport.sessionRequestTime.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = result;
  *(_BYTE *)(v2 + 40) = a2 & 1;
  return result;
}

uint64_t (*SKStepActivationReport.sessionRequestTime.modify())()
{
  return nullsub_1;
}

uint64_t SKStepActivationReport.description.getter()
{
  unsigned __int8 *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  _QWORD v9[2];
  uint64_t v10;
  unint64_t v11;

  v1 = sub_2148523F8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = v0[8];
  v6 = v0[24];
  v7 = v0[40];
  v10 = 0;
  v11 = 0xE000000000000000;
  sub_2148523EC();
  v9[0] = 0;
  v9[1] = 0xE000000000000000;
  sub_21485298C();
  swift_bridgeObjectRelease();
  v9[0] = 0xD000000000000013;
  v9[1] = 0x800000021485E000;
  if ((v7 & 1) == 0)
    sub_21485286C();
  sub_214852704();
  swift_bridgeObjectRelease();
  sub_2148526D4();
  swift_bridgeObjectRelease();
  v9[0] = 0;
  v9[1] = 0xE000000000000000;
  sub_21485298C();
  swift_bridgeObjectRelease();
  v9[0] = 0xD000000000000016;
  v9[1] = 0x800000021485E020;
  if ((v6 & 1) == 0)
    sub_21485286C();
  sub_214852704();
  swift_bridgeObjectRelease();
  sub_2148526D4();
  swift_bridgeObjectRelease();
  strcpy((char *)v9, "activateTime=");
  HIWORD(v9[1]) = -4864;
  if (!v5)
    sub_21485286C();
  sub_214852704();
  swift_bridgeObjectRelease();
  sub_2148526D4();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v10;
}

uint64_t sub_214808A1C(char a1)
{
  if (!a1)
    return 0x6574617669746361;
  if (a1 == 1)
    return 0xD000000000000015;
  return 0xD000000000000012;
}

uint64_t sub_214808A80()
{
  char *v0;

  return sub_214808A1C(*v0);
}

uint64_t sub_214808A88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21480A250(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_214808AAC()
{
  sub_214809724();
  return sub_214852BD8();
}

uint64_t sub_214808AD4()
{
  sub_214809724();
  return sub_214852BE4();
}

uint64_t SKStepActivationReport.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD v10[2];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  char v15;
  char v16;
  char v17;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88AE0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v14 = *(unsigned __int8 *)(v1 + 24);
  v11 = *(_QWORD *)(v1 + 32);
  v12 = v7;
  v10[1] = *(unsigned __int8 *)(v1 + 40);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_214809724();
  sub_214852BB4();
  v17 = 0;
  v8 = v13;
  sub_214852AA0();
  if (!v8)
  {
    v16 = 1;
    sub_214852AA0();
    v15 = 2;
    sub_214852AA0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SKStepActivationReport.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  int v13;
  uint64_t v15;
  char *v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  char v22;
  char v23;
  char v24;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88AE8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_214809724();
  sub_214852BA8();
  if (!v2)
  {
    v24 = 0;
    v9 = sub_214852A4C();
    v11 = v10;
    v23 = 1;
    v12 = sub_214852A4C();
    v21 = v13;
    v20 = v12;
    v22 = 2;
    v15 = sub_214852A4C();
    v16 = v8;
    v18 = v17;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v16, v5);
    *(_QWORD *)a2 = v9;
    *(_BYTE *)(a2 + 8) = v11 & 1;
    *(_QWORD *)(a2 + 16) = v20;
    *(_BYTE *)(a2 + 24) = v21 & 1;
    *(_QWORD *)(a2 + 32) = v15;
    *(_BYTE *)(a2 + 40) = v18 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_214808E18@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SKStepActivationReport.init(from:)(a1, a2);
}

uint64_t sub_214808E2C(_QWORD *a1)
{
  return SKStepActivationReport.encode(to:)(a1);
}

uint64_t sub_214808E4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result;

  result = sub_21480A3A4(a1, a2);
  *a3 = result != 0;
  return result;
}

uint64_t sub_214808E78()
{
  sub_214809768();
  return sub_214852BD8();
}

uint64_t sub_214808EA0()
{
  sub_214809768();
  return sub_214852BE4();
}

uint64_t sub_214808EC8(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88AF0);
  v13 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v1;
  v7 = *((_BYTE *)v1 + 8);
  v8 = v1[2];
  v12 = *((unsigned __int8 *)v1 + 24);
  v11 = v1[4];
  HIDWORD(v10) = *((unsigned __int8 *)v1 + 40);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_214809768();
  sub_214852BB4();
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v17 = v12;
  v18 = v11;
  v19 = BYTE4(v10);
  sub_21480969C();
  sub_214852AD0();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v5, v3);
}

uint64_t sub_214809010@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88AF8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_214809768();
  sub_214852BA8();
  if (!v2)
  {
    sub_2148096E0();
    sub_214852A7C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v9 = v16;
    v10 = v17;
    v11 = v18;
    v12 = v19;
    v13 = v20;
    *(_QWORD *)a2 = v15;
    *(_BYTE *)(a2 + 8) = v9;
    *(_QWORD *)(a2 + 16) = v10;
    *(_BYTE *)(a2 + 24) = v11;
    *(_QWORD *)(a2 + 32) = v12;
    *(_BYTE *)(a2 + 40) = v13;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_214809158@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_214809010(a1, a2);
}

uint64_t sub_21480916C(_QWORD *a1)
{
  return sub_214808EC8(a1);
}

uint64_t sub_214809184@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result;

  result = sub_21480A420(a1, a2);
  *a3 = result != 0;
  return result;
}

uint64_t sub_2148091B0()
{
  sub_2148097AC();
  return sub_214852BD8();
}

uint64_t sub_2148091D8()
{
  sub_2148097AC();
  return sub_214852BE4();
}

uint64_t sub_214809200(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char v7;
  __int128 v8;
  uint64_t v9;
  int v10;
  uint64_t v12;
  int v13;
  int v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  char v23;
  char v24;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88B00);
  v17 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v1;
  v7 = *((_BYTE *)v1 + 8);
  v8 = *((_OWORD *)v1 + 1);
  v15 = *((_OWORD *)v1 + 2);
  v16 = v8;
  v9 = v1[6];
  v10 = *((unsigned __int8 *)v1 + 56);
  v13 = *((unsigned __int8 *)v1 + 57);
  v14 = v10;
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2148097AC();
  sub_214852BB4();
  v18 = v6;
  v19 = v7;
  v20 = v16;
  v21 = v15;
  v22 = v9;
  v23 = v14;
  v24 = v13;
  sub_2148097F0();
  sub_214852AD0();
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v5, v3);
}

__n128 sub_21480934C@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2;
  uint64_t v3;
  char v4;
  char v5;
  __n128 result;
  __int128 v7;

  v2 = *(_BYTE *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_BYTE *)(a1 + 56);
  v5 = *(_BYTE *)(a1 + 57);
  *(_QWORD *)a2 = *(_QWORD *)a1;
  *(_BYTE *)(a2 + 8) = v2;
  result = *(__n128 *)(a1 + 16);
  v7 = *(_OWORD *)(a1 + 32);
  *(__n128 *)(a2 + 16) = result;
  *(_OWORD *)(a2 + 32) = v7;
  *(_QWORD *)(a2 + 48) = v3;
  *(_BYTE *)(a2 + 56) = v4;
  *(_BYTE *)(a2 + 57) = v5;
  return result;
}

uint64_t sub_214809380@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v10;
  char v11;
  char v12;
  __int128 v13;
  __int128 v14;
  uint64_t v16;
  char v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  char v21;
  char v22;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88B10);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2148097AC();
  sub_214852BA8();
  if (!v2)
  {
    sub_214809834();
    sub_214852A7C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v9 = v17;
    v10 = v20;
    v11 = v21;
    v12 = v22;
    v13 = v18;
    v14 = v19;
    *(_QWORD *)a2 = v16;
    *(_BYTE *)(a2 + 8) = v9;
    *(_OWORD *)(a2 + 16) = v13;
    *(_OWORD *)(a2 + 32) = v14;
    *(_QWORD *)(a2 + 48) = v10;
    *(_BYTE *)(a2 + 56) = v11;
    *(_BYTE *)(a2 + 57) = v12;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

unint64_t sub_2148094C8()
{
  return 0xD000000000000011;
}

uint64_t sub_2148094E4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_214809380(a1, a2);
}

uint64_t sub_2148094F8(_QWORD *a1)
{
  return sub_214809200(a1);
}

BOOL _s8SetupKit22SKStepActivationReportV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;
  char v4;

  v2 = *(_BYTE *)(a2 + 8);
  v3 = *(_BYTE *)(a2 + 24);
  v4 = *(_BYTE *)(a2 + 40);
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 8))
      return 0;
  }
  else
  {
    if (*(double *)a1 != *(double *)a2)
      v2 = 1;
    if ((v2 & 1) != 0)
      return 0;
  }
  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 24))
      return 0;
  }
  else
  {
    if (*(double *)(a1 + 16) != *(double *)(a2 + 16))
      v3 = 1;
    if ((v3 & 1) != 0)
      return 0;
  }
  if ((*(_BYTE *)(a1 + 40) & 1) == 0)
  {
    if (*(double *)(a1 + 32) != *(double *)(a2 + 32))
      v4 = 1;
    return (v4 & 1) == 0;
  }
  return (*(_BYTE *)(a2 + 40) & 1) != 0;
}

uint64_t _s8SetupKit29SKStepActivationConfigurationV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_BYTE *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 40);
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 8))
      return 0;
  }
  else
  {
    if (*(double *)a1 != *(double *)a2)
      v2 = 1;
    if ((v2 & 1) != 0)
      return 0;
  }
  if ((*(_BYTE *)(a1 + 57) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 57) & 1) != 0)
      return 1;
  }
  else if ((*(_BYTE *)(a2 + 57) & 1) == 0)
  {
    if ((*(_BYTE *)(a1 + 24) & 1) != 0)
    {
      if ((v3 & 1) == 0)
        return 0;
    }
    else if ((v3 & 1) != 0 || *(double *)(a1 + 16) != *(double *)(a2 + 16))
    {
      return 0;
    }
    if ((*(_BYTE *)(a1 + 40) & 1) != 0)
    {
      if ((v4 & 1) == 0)
        return 0;
    }
    else if ((v4 & 1) != 0 || *(double *)(a1 + 32) != *(double *)(a2 + 32))
    {
      return 0;
    }
    if ((*(_BYTE *)(a1 + 56) & 1) != 0)
    {
      if ((*(_BYTE *)(a2 + 56) & 1) == 0)
        return 0;
    }
    else if ((*(_BYTE *)(a2 + 56) & 1) != 0 || *(double *)(a1 + 48) != *(double *)(a2 + 48))
    {
      return 0;
    }
    return 1;
  }
  return 0;
}

unint64_t sub_214809658()
{
  unint64_t result;

  result = qword_254D8CF60;
  if (!qword_254D8CF60)
  {
    result = MEMORY[0x2199D7540](&unk_2148587B0, &type metadata for SKStepActivationConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8CF60);
  }
  return result;
}

unint64_t sub_21480969C()
{
  unint64_t result;

  result = qword_254D88AC8;
  if (!qword_254D88AC8)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepActivationReport, &type metadata for SKStepActivationReport);
    atomic_store(result, (unint64_t *)&qword_254D88AC8);
  }
  return result;
}

unint64_t sub_2148096E0()
{
  unint64_t result;

  result = qword_254D88AD8;
  if (!qword_254D88AD8)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepActivationReport, &type metadata for SKStepActivationReport);
    atomic_store(result, (unint64_t *)&qword_254D88AD8);
  }
  return result;
}

unint64_t sub_214809724()
{
  unint64_t result;

  result = qword_254D8CF68;
  if (!qword_254D8CF68)
  {
    result = MEMORY[0x2199D7540](&unk_214858760, &type metadata for SKStepActivationReport.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8CF68);
  }
  return result;
}

unint64_t sub_214809768()
{
  unint64_t result;

  result = qword_254D8CF70;
  if (!qword_254D8CF70)
  {
    result = MEMORY[0x2199D7540](&unk_214858710, &type metadata for SKStepActivationStartRequestMessage.ResponseMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8CF70);
  }
  return result;
}

unint64_t sub_2148097AC()
{
  unint64_t result;

  result = qword_254D8CF78[0];
  if (!qword_254D8CF78[0])
  {
    result = MEMORY[0x2199D7540](&unk_2148586C0, &type metadata for SKStepActivationStartRequestMessage.CodingKeys);
    atomic_store(result, qword_254D8CF78);
  }
  return result;
}

unint64_t sub_2148097F0()
{
  unint64_t result;

  result = qword_254D88B08;
  if (!qword_254D88B08)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepActivationConfiguration, &type metadata for SKStepActivationConfiguration);
    atomic_store(result, (unint64_t *)&qword_254D88B08);
  }
  return result;
}

unint64_t sub_214809834()
{
  unint64_t result;

  result = qword_254D88B18;
  if (!qword_254D88B18)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepActivationConfiguration, &type metadata for SKStepActivationConfiguration);
    atomic_store(result, (unint64_t *)&qword_254D88B18);
  }
  return result;
}

unint64_t sub_21480987C()
{
  unint64_t result;

  result = qword_254D88B20;
  if (!qword_254D88B20)
  {
    result = MEMORY[0x2199D7540](&unk_214858170, &type metadata for SKStepActivationStartRequestMessage.ResponseMessage);
    atomic_store(result, (unint64_t *)&qword_254D88B20);
  }
  return result;
}

unint64_t sub_2148098C4()
{
  unint64_t result;

  result = qword_254D88B28;
  if (!qword_254D88B28)
  {
    result = MEMORY[0x2199D7540](&unk_214858198, &type metadata for SKStepActivationStartRequestMessage.ResponseMessage);
    atomic_store(result, (unint64_t *)&qword_254D88B28);
  }
  return result;
}

unint64_t sub_21480990C()
{
  unint64_t result;

  result = qword_254D88B30;
  if (!qword_254D88B30)
  {
    result = MEMORY[0x2199D7540](&unk_214858228, &type metadata for SKStepActivationStartRequestMessage);
    atomic_store(result, (unint64_t *)&qword_254D88B30);
  }
  return result;
}

unint64_t sub_214809954()
{
  unint64_t result;

  result = qword_254D88B38;
  if (!qword_254D88B38)
  {
    result = MEMORY[0x2199D7540](&unk_214858250, &type metadata for SKStepActivationStartRequestMessage);
    atomic_store(result, (unint64_t *)&qword_254D88B38);
  }
  return result;
}

unint64_t sub_21480999C()
{
  unint64_t result;

  result = qword_254D88B40;
  if (!qword_254D88B40)
  {
    result = MEMORY[0x2199D7540](&unk_214858128, &type metadata for SKStepActivationStartRequestMessage.ResponseMessage);
    atomic_store(result, (unint64_t *)&qword_254D88B40);
  }
  return result;
}

uint64_t method lookup function for SKStepActivationServer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SKStepActivationServer.__allocating_init(server:environment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

__n128 __swift_memcpy58_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 42) = *(_OWORD *)(a2 + 42);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SKStepActivationConfiguration(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 58))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SKStepActivationConfiguration(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 56) = 0;
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
  *(_BYTE *)(result + 58) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SKStepActivationConfiguration()
{
  return &type metadata for SKStepActivationConfiguration;
}

uint64_t getEnumTagSinglePayload for SKStepActivationReport(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SKStepActivationReport(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
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
  *(_BYTE *)(result + 41) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SKStepActivationReport()
{
  return &type metadata for SKStepActivationReport;
}

ValueMetadata *type metadata accessor for SKStepActivationStartRequestMessage()
{
  return &type metadata for SKStepActivationStartRequestMessage;
}

ValueMetadata *type metadata accessor for SKStepActivationStartRequestMessage.ResponseMessage()
{
  return &type metadata for SKStepActivationStartRequestMessage.ResponseMessage;
}

ValueMetadata *type metadata accessor for SKStepActivationStartRequestHandler()
{
  return &type metadata for SKStepActivationStartRequestHandler;
}

ValueMetadata *type metadata accessor for SKStepActivationStartRequestMessage.CodingKeys()
{
  return &type metadata for SKStepActivationStartRequestMessage.CodingKeys;
}

uint64_t _s8SetupKit35SKStepActivationStartRequestMessageV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_214809B6C + 4 * byte_214857F90[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_214809B8C + 4 * byte_214857F95[v4]))();
}

_BYTE *sub_214809B6C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_214809B8C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_214809B94(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_214809B9C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_214809BA4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_214809BAC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SKStepActivationStartRequestMessage.ResponseMessage.CodingKeys()
{
  return &type metadata for SKStepActivationStartRequestMessage.ResponseMessage.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for SKStepActivationReport.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_214809C14 + 4 * byte_214857F9F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_214809C48 + 4 * byte_214857F9A[v4]))();
}

uint64_t sub_214809C48(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_214809C50(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x214809C58);
  return result;
}

uint64_t sub_214809C64(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x214809C6CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_214809C70(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_214809C78(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SKStepActivationReport.CodingKeys()
{
  return &type metadata for SKStepActivationReport.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SKStepActivationConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SKStepActivationConfiguration.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_214809D70 + 4 * byte_214857FA9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_214809DA4 + 4 * byte_214857FA4[v4]))();
}

uint64_t sub_214809DA4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_214809DAC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x214809DB4);
  return result;
}

uint64_t sub_214809DC0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x214809DC8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_214809DCC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_214809DD4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_214809DE0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SKStepActivationConfiguration.CodingKeys()
{
  return &type metadata for SKStepActivationConfiguration.CodingKeys;
}

unint64_t sub_214809E00()
{
  unint64_t result;

  result = qword_254D8D880[0];
  if (!qword_254D8D880[0])
  {
    result = MEMORY[0x2199D7540](&unk_214858470, &type metadata for SKStepActivationConfiguration.CodingKeys);
    atomic_store(result, qword_254D8D880);
  }
  return result;
}

unint64_t sub_214809E48()
{
  unint64_t result;

  result = qword_254D8DA90[0];
  if (!qword_254D8DA90[0])
  {
    result = MEMORY[0x2199D7540](&unk_214858528, &type metadata for SKStepActivationReport.CodingKeys);
    atomic_store(result, qword_254D8DA90);
  }
  return result;
}

unint64_t sub_214809E90()
{
  unint64_t result;

  result = qword_254D8DCA0[0];
  if (!qword_254D8DCA0[0])
  {
    result = MEMORY[0x2199D7540](&unk_2148585E0, &type metadata for SKStepActivationStartRequestMessage.ResponseMessage.CodingKeys);
    atomic_store(result, qword_254D8DCA0);
  }
  return result;
}

unint64_t sub_214809ED8()
{
  unint64_t result;

  result = qword_254D8DEB0[0];
  if (!qword_254D8DEB0[0])
  {
    result = MEMORY[0x2199D7540](&unk_214858698, &type metadata for SKStepActivationStartRequestMessage.CodingKeys);
    atomic_store(result, qword_254D8DEB0);
  }
  return result;
}

unint64_t sub_214809F20()
{
  unint64_t result;

  result = qword_254D8DFC0;
  if (!qword_254D8DFC0)
  {
    result = MEMORY[0x2199D7540](&unk_214858608, &type metadata for SKStepActivationStartRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8DFC0);
  }
  return result;
}

unint64_t sub_214809F68()
{
  unint64_t result;

  result = qword_254D8DFC8[0];
  if (!qword_254D8DFC8[0])
  {
    result = MEMORY[0x2199D7540](&unk_214858630, &type metadata for SKStepActivationStartRequestMessage.CodingKeys);
    atomic_store(result, qword_254D8DFC8);
  }
  return result;
}

unint64_t sub_214809FB0()
{
  unint64_t result;

  result = qword_254D8E050;
  if (!qword_254D8E050)
  {
    result = MEMORY[0x2199D7540](&unk_214858550, &type metadata for SKStepActivationStartRequestMessage.ResponseMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8E050);
  }
  return result;
}

unint64_t sub_214809FF8()
{
  unint64_t result;

  result = qword_254D8E058[0];
  if (!qword_254D8E058[0])
  {
    result = MEMORY[0x2199D7540](&unk_214858578, &type metadata for SKStepActivationStartRequestMessage.ResponseMessage.CodingKeys);
    atomic_store(result, qword_254D8E058);
  }
  return result;
}

unint64_t sub_21480A040()
{
  unint64_t result;

  result = qword_254D8E0E0;
  if (!qword_254D8E0E0)
  {
    result = MEMORY[0x2199D7540](&unk_214858498, &type metadata for SKStepActivationReport.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8E0E0);
  }
  return result;
}

unint64_t sub_21480A088()
{
  unint64_t result;

  result = qword_254D8E0E8[0];
  if (!qword_254D8E0E8[0])
  {
    result = MEMORY[0x2199D7540](&unk_2148584C0, &type metadata for SKStepActivationReport.CodingKeys);
    atomic_store(result, qword_254D8E0E8);
  }
  return result;
}

unint64_t sub_21480A0D0()
{
  unint64_t result;

  result = qword_254D8E170;
  if (!qword_254D8E170)
  {
    result = MEMORY[0x2199D7540](&unk_2148583E0, &type metadata for SKStepActivationConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8E170);
  }
  return result;
}

unint64_t sub_21480A118()
{
  unint64_t result;

  result = qword_254D8E178;
  if (!qword_254D8E178)
  {
    result = MEMORY[0x2199D7540](&unk_214858408, &type metadata for SKStepActivationConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8E178);
  }
  return result;
}

uint64_t sub_21480A15C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000012 && a2 == 0x800000021485E080 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F7065526B636F6DLL && a2 == 0xEA00000000007472)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_214852B18();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_21480A250(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6574617669746361 && a2 == 0xEC000000656D6954;
  if (v3 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000021485E0A0 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000021485E0C0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_214852B18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_21480A3A4(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x74726F706572 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_214852B18();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_21480A420(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x72756769666E6F63 && a2 == 0xED00006E6F697461)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_214852B18();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

unint64_t sub_21480A4BC()
{
  unint64_t result;

  result = qword_254D88C20;
  if (!qword_254D88C20)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254D88C20);
  }
  return result;
}

uint64_t sub_21480A4F8()
{
  return swift_release();
}

uint64_t sub_21480A510()
{
  uint64_t v0;

  v0 = sub_214852494();
  __swift_allocate_value_buffer(v0, qword_254D8E208);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D8E208);
  sub_214801FC0();
  swift_bridgeObjectRetain();
  return sub_214852488();
}

uint64_t SKStepWiFiSetupClient.environment.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 24);
  return swift_bridgeObjectRetain();
}

_QWORD *SKStepWiFiSetupClient.__allocating_init(client:environment:)(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)swift_allocObject();
  v4 = *a2;
  swift_weakInit();
  v3[4] = 0;
  v3[5] = 0;
  swift_weakAssign();
  swift_release();
  v3[3] = v4;
  return v3;
}

_QWORD *SKStepWiFiSetupClient.init(client:environment:)(uint64_t a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *a2;
  swift_weakInit();
  v2[4] = 0;
  v2[5] = 0;
  swift_weakAssign();
  swift_release();
  v2[3] = v3;
  return v2;
}

uint64_t SKStepWiFiSetupClient.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  v1 = v0;
  if (qword_254D8E200 != -1)
    swift_once();
  v2 = sub_214852494();
  __swift_project_value_buffer(v2, (uint64_t)qword_254D8E208);
  v3 = sub_21485247C();
  v4 = sub_2148528C0();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2147EE000, v3, v4, "deinit", v5, 2u);
    MEMORY[0x2199D75E8](v5, -1, -1);
  }

  objc_msgSend(*(id *)(v1 + 32), sel_invalidate);
  swift_weakDestroy();
  swift_bridgeObjectRelease();

  return v1;
}

uint64_t SKStepWiFiSetupClient.__deallocating_deinit()
{
  SKStepWiFiSetupClient.deinit();
  return swift_deallocClassInstance();
}

uint64_t SKStepWiFiSetupClient.perform(configuration:)(uint64_t a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  *(_QWORD *)(v3 + 2352) = v2;
  *(_QWORD *)(v3 + 2344) = a2;
  *(_QWORD *)(v3 + 2336) = a1;
  v4 = a2[9];
  *(_OWORD *)(v3 + 144) = a2[8];
  *(_OWORD *)(v3 + 160) = v4;
  *(_OWORD *)(v3 + 176) = a2[10];
  v5 = a2[5];
  *(_OWORD *)(v3 + 80) = a2[4];
  *(_OWORD *)(v3 + 96) = v5;
  v6 = a2[7];
  *(_OWORD *)(v3 + 112) = a2[6];
  *(_OWORD *)(v3 + 128) = v6;
  v7 = a2[1];
  *(_OWORD *)(v3 + 16) = *a2;
  *(_OWORD *)(v3 + 32) = v7;
  v8 = a2[3];
  *(_OWORD *)(v3 + 48) = a2[2];
  *(_OWORD *)(v3 + 64) = v8;
  sub_21480BA58();
  *(_QWORD *)(v3 + 2360) = sub_2148527C4();
  *(_QWORD *)(v3 + 2368) = v9;
  return swift_task_switch();
}

uint64_t sub_21480A840()
{
  uint64_t v0;
  uint64_t Strong;
  _OWORD *v2;
  _OWORD *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  id v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  unint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  char v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  uint64_t v90;
  char v91;
  uint64_t v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  _OWORD v96[11];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 2376) = Strong;
  if (!Strong)
  {
    LOBYTE(v96[0]) = 2;
    type metadata accessor for SKError();
    v19 = SKError.__allocating_init(_:_:_:)((uint64_t)v96, 0x696C434B53206F4ELL, 0xEB00000000746E65, 0);
    swift_willThrow();
    goto LABEL_20;
  }
  v2 = (_OWORD *)(v0 + 720);
  v3 = *(_OWORD **)(v0 + 2344);
  v5 = *(_QWORD *)(v0 + 176);
  v4 = *(_QWORD *)(v0 + 184);
  v7 = v3[1];
  v6 = v3[2];
  *(_OWORD *)(v0 + 720) = *v3;
  *(_OWORD *)(v0 + 736) = v7;
  *(_OWORD *)(v0 + 752) = v6;
  v8 = v3[6];
  v10 = v3[3];
  v9 = v3[4];
  *(_OWORD *)(v0 + 800) = v3[5];
  *(_OWORD *)(v0 + 816) = v8;
  *(_OWORD *)(v0 + 768) = v10;
  *(_OWORD *)(v0 + 784) = v9;
  v11 = v3[10];
  v13 = v3[7];
  v12 = v3[8];
  *(_OWORD *)(v0 + 864) = v3[9];
  *(_OWORD *)(v0 + 880) = v11;
  *(_OWORD *)(v0 + 832) = v13;
  *(_OWORD *)(v0 + 848) = v12;
  sub_21480BABC(v0 + 16);
  if (!v4)
  {
    v28 = sub_21480B924();
    v29 = objc_msgSend(v28, sel_networkName);

    if (v29)
    {
      v5 = sub_2148526C8();
      v4 = v30;

    }
    else
    {
      v5 = 0;
      v4 = 0;
    }
    *(_QWORD *)(v0 + 880) = v5;
    *(_QWORD *)(v0 + 888) = v4;
  }
  v92 = *(_QWORD *)(v0 + 160);
  v93 = *(_BYTE *)(v0 + 168);
  v90 = *(_QWORD *)(v0 + 128);
  v91 = *(_BYTE *)(v0 + 136);
  v89 = *(_BYTE *)(v0 + 120);
  v86 = *(_QWORD *)(v0 + 104);
  v87 = *(_QWORD *)(v0 + 112);
  v79 = *(_QWORD *)(v0 + 56);
  v80 = *(_QWORD *)(v0 + 64);
  v81 = *(_QWORD *)(v0 + 72);
  v82 = *(_QWORD *)(v0 + 80);
  v83 = *(_QWORD *)(v0 + 88);
  v84 = *(_BYTE *)(v0 + 96);
  v85 = *(_BYTE *)(v0 + 97);
  v78 = *(_BYTE *)(v0 + 48);
  v76 = *(_QWORD *)(v0 + 32);
  v77 = *(_QWORD *)(v0 + 40);
  v14 = *(_QWORD *)(v0 + 152);
  v88 = *(_QWORD *)(v0 + 144);
  v15 = *(id *)(v0 + 16);
  if (*(_BYTE *)(v0 + 24) == 1)
  {
    v94 = *(_QWORD *)(v0 + 152);
    v16 = *(_QWORD *)(v0 + 2352);
    v17 = *(void **)(v16 + 32);
    if (v17)
    {
      v18 = *(id *)(v16 + 32);
    }
    else
    {
      v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE29F18]), sel_init);
      v21 = *(void **)(v16 + 32);
      *(_QWORD *)(v16 + 32) = v20;
      v18 = v20;

      objc_msgSend(v18, sel_activate);
      v17 = 0;
    }
    v22 = v17;
    v23 = objc_msgSend(v18, sel_channel);

    if (!v23)
    {
      type metadata accessor for SKError();
      LOBYTE(v96[0]) = 1;
      v27 = v5;
      v19 = SKError.__allocating_init(_:_:_:)((uint64_t)v96, 0xD00000000000001ALL, 0x800000021485E1F0, 0);
      swift_willThrow();
      *(_QWORD *)(v0 + 896) = v15;
      *(_BYTE *)(v0 + 904) = 1;
      *(_QWORD *)(v0 + 912) = v76;
      *(_QWORD *)(v0 + 920) = v77;
      *(_BYTE *)(v0 + 928) = v78;
      *(_QWORD *)(v0 + 936) = v79;
      *(_QWORD *)(v0 + 944) = v80;
      *(_QWORD *)(v0 + 952) = v81;
      *(_QWORD *)(v0 + 960) = v82;
      *(_QWORD *)(v0 + 968) = v83;
      *(_BYTE *)(v0 + 976) = v84;
      *(_BYTE *)(v0 + 977) = v85;
      *(_QWORD *)(v0 + 984) = v86;
      *(_QWORD *)(v0 + 992) = v87;
      *(_BYTE *)(v0 + 1000) = v89;
      *(_QWORD *)(v0 + 1008) = v90;
      *(_BYTE *)(v0 + 1016) = v91;
      *(_QWORD *)(v0 + 1024) = v88;
      *(_QWORD *)(v0 + 1032) = v94;
      *(_QWORD *)(v0 + 1040) = v92;
      *(_BYTE *)(v0 + 1048) = v93;
      *(_QWORD *)(v0 + 1056) = v27;
      *(_QWORD *)(v0 + 1064) = v4;
      sub_21480BB4C(v0 + 896);
      swift_release();
      goto LABEL_20;
    }
    v15 = objc_msgSend(v23, sel_channel);

    *(_QWORD *)(v0 + 720) = v15;
    *(_BYTE *)(v0 + 728) = 0;
    v14 = v94;
    if (!v94)
      goto LABEL_13;
LABEL_28:
    if (qword_254D8E200 != -1)
      swift_once();
    v51 = sub_214852494();
    *(_QWORD *)(v0 + 2384) = __swift_project_value_buffer(v51, (uint64_t)qword_254D8E208);
    v52 = sub_21485247C();
    v53 = sub_2148528D8();
    if (os_log_type_enabled(v52, v53))
    {
      v54 = (uint8_t *)swift_slowAlloc();
      v55 = swift_slowAlloc();
      *(_QWORD *)&v96[0] = v55;
      *(_DWORD *)v54 = 136315138;
      swift_beginAccess();
      v56 = *(_OWORD *)(v0 + 864);
      *(_OWORD *)(v0 + 672) = *(_OWORD *)(v0 + 848);
      *(_OWORD *)(v0 + 688) = v56;
      *(_OWORD *)(v0 + 704) = *(_OWORD *)(v0 + 880);
      v57 = *(_OWORD *)(v0 + 800);
      *(_OWORD *)(v0 + 608) = *(_OWORD *)(v0 + 784);
      *(_OWORD *)(v0 + 624) = v57;
      v58 = *(_OWORD *)(v0 + 832);
      *(_OWORD *)(v0 + 640) = *(_OWORD *)(v0 + 816);
      *(_OWORD *)(v0 + 656) = v58;
      v59 = *(_OWORD *)(v0 + 736);
      *(_OWORD *)(v0 + 544) = *v2;
      *(_OWORD *)(v0 + 560) = v59;
      v60 = *(_OWORD *)(v0 + 768);
      *(_OWORD *)(v0 + 576) = *(_OWORD *)(v0 + 752);
      *(_OWORD *)(v0 + 592) = v60;
      sub_21480BBE0();
      v61 = sub_214852B00();
      *(_QWORD *)(v0 + 2304) = sub_2147F3D14(v61, v62, (uint64_t *)v96);
      sub_21485292C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2147EE000, v52, v53, "WiFiSetup start: configuration=%s", v54, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199D75E8](v55, -1, -1);
      MEMORY[0x2199D75E8](v54, -1, -1);
    }

    swift_beginAccess();
    v63 = *(_OWORD *)(v0 + 816);
    *(_OWORD *)(v0 + 1360) = *(_OWORD *)(v0 + 832);
    v64 = *(_OWORD *)(v0 + 832);
    *(_OWORD *)(v0 + 1376) = *(_OWORD *)(v0 + 848);
    v65 = *(_OWORD *)(v0 + 848);
    *(_OWORD *)(v0 + 1392) = *(_OWORD *)(v0 + 864);
    v66 = *(_OWORD *)(v0 + 864);
    *(_OWORD *)(v0 + 1408) = *(_OWORD *)(v0 + 880);
    v67 = *(_OWORD *)(v0 + 752);
    *(_OWORD *)(v0 + 1296) = *(_OWORD *)(v0 + 768);
    v68 = *(_OWORD *)(v0 + 768);
    *(_OWORD *)(v0 + 1312) = *(_OWORD *)(v0 + 784);
    v69 = *(_OWORD *)(v0 + 784);
    *(_OWORD *)(v0 + 1328) = *(_OWORD *)(v0 + 800);
    v70 = *(_OWORD *)(v0 + 800);
    *(_OWORD *)(v0 + 1344) = *(_OWORD *)(v0 + 816);
    v71 = *(_OWORD *)(v0 + 736);
    *(_OWORD *)(v0 + 1248) = *v2;
    v72 = *v2;
    *(_OWORD *)(v0 + 1264) = *(_OWORD *)(v0 + 736);
    *(_OWORD *)(v0 + 1280) = *(_OWORD *)(v0 + 752);
    v96[8] = v65;
    v96[9] = v66;
    v96[10] = *(_OWORD *)(v0 + 880);
    v96[4] = v69;
    v96[5] = v70;
    v96[6] = v63;
    v96[7] = v64;
    v96[0] = v72;
    v96[1] = v71;
    v96[2] = v67;
    v96[3] = v68;
    sub_21480BABC(v0 + 1248);
    sub_214813CE8((uint64_t)v96, v0 + 1072);
    *(_OWORD *)(v0 + 1888) = *(_OWORD *)(v0 + 1184);
    *(_OWORD *)(v0 + 1904) = *(_OWORD *)(v0 + 1200);
    *(_OWORD *)(v0 + 1920) = *(_OWORD *)(v0 + 1216);
    *(_OWORD *)(v0 + 1936) = *(_OWORD *)(v0 + 1232);
    *(_OWORD *)(v0 + 1824) = *(_OWORD *)(v0 + 1120);
    *(_OWORD *)(v0 + 1840) = *(_OWORD *)(v0 + 1136);
    *(_OWORD *)(v0 + 1856) = *(_OWORD *)(v0 + 1152);
    *(_OWORD *)(v0 + 1872) = *(_OWORD *)(v0 + 1168);
    *(_OWORD *)(v0 + 1776) = *(_OWORD *)(v0 + 1072);
    *(_OWORD *)(v0 + 1792) = *(_OWORD *)(v0 + 1088);
    *(_OWORD *)(v0 + 1808) = *(_OWORD *)(v0 + 1104);
    v73 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 2392) = v73;
    sub_21480BB08();
    *v73 = v0;
    v73[1] = sub_21480B300;
    return sub_2148525C0();
  }
  if (v14)
    goto LABEL_28;
LABEL_13:
  v95 = v14;
  v24 = *(_QWORD *)(v0 + 2352);
  v25 = *(void **)(v24 + 32);
  v75 = v5;
  if (v25)
  {
    v26 = *(id *)(v24 + 32);
  }
  else
  {
    v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE29F18]), sel_init);
    v32 = *(void **)(v24 + 32);
    *(_QWORD *)(v24 + 32) = v31;
    v26 = v31;

    objc_msgSend(v26, sel_activate);
    v25 = 0;
  }
  v33 = v25;
  v44 = sub_21480B924();
  *(_QWORD *)(v0 + 2320) = 0;
  v45 = objc_msgSend(v26, sel_passwordForKnownNetworkProfile_error_, v44, v0 + 2320);

  v46 = *(void **)(v0 + 2320);
  if (v45)
  {
    v47 = sub_2148526C8();
    v49 = v48;
    v50 = v46;

    *(_QWORD *)(v0 + 848) = v47;
    *(_QWORD *)(v0 + 856) = v49;
    goto LABEL_28;
  }
  v74 = v46;
  v19 = (void *)sub_214852320();

  swift_willThrow();
  swift_release();
  *(_QWORD *)(v0 + 192) = v15;
  *(_BYTE *)(v0 + 200) = 0;
  *(_QWORD *)(v0 + 208) = v76;
  *(_QWORD *)(v0 + 216) = v77;
  *(_BYTE *)(v0 + 224) = v78;
  *(_QWORD *)(v0 + 232) = v79;
  *(_QWORD *)(v0 + 240) = v80;
  *(_QWORD *)(v0 + 248) = v81;
  *(_QWORD *)(v0 + 256) = v82;
  *(_QWORD *)(v0 + 264) = v83;
  *(_BYTE *)(v0 + 272) = v84;
  *(_BYTE *)(v0 + 273) = v85;
  *(_QWORD *)(v0 + 280) = v86;
  *(_QWORD *)(v0 + 288) = v87;
  *(_BYTE *)(v0 + 296) = v89;
  *(_QWORD *)(v0 + 304) = v90;
  *(_BYTE *)(v0 + 312) = v91;
  *(_QWORD *)(v0 + 320) = v88;
  *(_QWORD *)(v0 + 328) = v95;
  *(_QWORD *)(v0 + 336) = v92;
  *(_BYTE *)(v0 + 344) = v93;
  *(_QWORD *)(v0 + 352) = v75;
  *(_QWORD *)(v0 + 360) = v4;
  sub_21480BB4C(v0 + 192);
LABEL_20:
  if (qword_254D8E200 != -1)
    swift_once();
  v34 = sub_214852494();
  __swift_project_value_buffer(v34, (uint64_t)qword_254D8E208);
  v35 = v19;
  v36 = v19;
  v37 = sub_21485247C();
  v38 = sub_2148528CC();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    v40 = swift_slowAlloc();
    *(_QWORD *)&v96[0] = v40;
    *(_DWORD *)v39 = 136315138;
    swift_getErrorValue();
    v41 = sub_214852B6C();
    *(_QWORD *)(v0 + 2296) = sub_2147F3D14(v41, v42, (uint64_t *)v96);
    sub_21485292C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2147EE000, v37, v38, "### WiFiSetup failed: error=%s", v39, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v40, -1, -1);
    MEMORY[0x2199D75E8](v39, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21480B300()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 2400) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21480B3B8()
{
  uint64_t v0;
  _OWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  unint64_t v10;
  uint8_t *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v1 = (_OWORD *)(v0 + 720);
  v26 = v0 + 1072;
  v2 = *(_QWORD *)(v0 + 2128);
  v3 = *(_QWORD *)(v0 + 2144);
  v4 = *(_BYTE *)(v0 + 2152);
  v5 = *(_QWORD *)(v0 + 2160);
  v27 = *(_BYTE *)(v0 + 2168);
  v28 = *(_BYTE *)(v0 + 2136);
  v6 = sub_21485247C();
  v7 = sub_2148528D8();
  if (os_log_type_enabled(v6, v7))
  {
    v25 = v2;
    v8 = (uint8_t *)swift_slowAlloc();
    v24 = swift_slowAlloc();
    v29[0] = v24;
    *(_DWORD *)v8 = 136315138;
    *(_QWORD *)(v0 + 2176) = v25;
    *(_BYTE *)(v0 + 2184) = v28;
    *(_QWORD *)(v0 + 2192) = v3;
    *(_BYTE *)(v0 + 2200) = v4;
    *(_QWORD *)(v0 + 2208) = v5;
    *(_BYTE *)(v0 + 2216) = v27;
    sub_21480BB9C();
    v9 = sub_214852B00();
    *(_QWORD *)(v0 + 2312) = sub_2147F3D14(v9, v10, v29);
    sub_21485292C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2147EE000, v6, v7, "WiFiSetup success: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v24, -1, -1);
    v11 = v8;
    v2 = v25;
    MEMORY[0x2199D75E8](v11, -1, -1);
    sub_21480BB4C(v26);

    swift_release();
    v12 = *(_OWORD *)(v0 + 816);
    *(_OWORD *)(v0 + 1536) = *(_OWORD *)(v0 + 832);
    v13 = *(_OWORD *)(v0 + 864);
    *(_OWORD *)(v0 + 1552) = *(_OWORD *)(v0 + 848);
    *(_OWORD *)(v0 + 1568) = v13;
    *(_OWORD *)(v0 + 1584) = *(_OWORD *)(v0 + 880);
    v14 = *(_OWORD *)(v0 + 752);
    *(_OWORD *)(v0 + 1472) = *(_OWORD *)(v0 + 768);
    v15 = *(_OWORD *)(v0 + 800);
    *(_OWORD *)(v0 + 1488) = *(_OWORD *)(v0 + 784);
    *(_OWORD *)(v0 + 1504) = v15;
    *(_OWORD *)(v0 + 1520) = v12;
    v16 = *(_OWORD *)(v0 + 736);
    *(_OWORD *)(v0 + 1424) = *v1;
    *(_OWORD *)(v0 + 1440) = v16;
    *(_OWORD *)(v0 + 1456) = v14;
    sub_21480BB4C(v0 + 1424);
  }
  else
  {
    swift_release();
    sub_21480BB4C(v26);

    v17 = *(_OWORD *)(v0 + 816);
    *(_OWORD *)(v0 + 1712) = *(_OWORD *)(v0 + 832);
    v18 = *(_OWORD *)(v0 + 864);
    *(_OWORD *)(v0 + 1728) = *(_OWORD *)(v0 + 848);
    *(_OWORD *)(v0 + 1744) = v18;
    *(_OWORD *)(v0 + 1760) = *(_OWORD *)(v0 + 880);
    v19 = *(_OWORD *)(v0 + 752);
    *(_OWORD *)(v0 + 1648) = *(_OWORD *)(v0 + 768);
    v20 = *(_OWORD *)(v0 + 800);
    *(_OWORD *)(v0 + 1664) = *(_OWORD *)(v0 + 784);
    *(_OWORD *)(v0 + 1680) = v20;
    *(_OWORD *)(v0 + 1696) = v17;
    v21 = *(_OWORD *)(v0 + 736);
    *(_OWORD *)(v0 + 1600) = *v1;
    *(_OWORD *)(v0 + 1616) = v21;
    *(_OWORD *)(v0 + 1632) = v19;
    sub_21480BB4C(v0 + 1600);
  }
  v22 = *(_QWORD *)(v0 + 2336);
  *(_QWORD *)v22 = v2;
  *(_BYTE *)(v22 + 8) = v28;
  *(_QWORD *)(v22 + 16) = v3;
  *(_BYTE *)(v22 + 24) = v4;
  *(_QWORD *)(v22 + 32) = v5;
  *(_BYTE *)(v22 + 40) = v27;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21480B6B0()
{
  uint64_t v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  swift_release();
  sub_21480BB4C(v0 + 1072);
  v1 = *(_OWORD *)(v0 + 816);
  *(_OWORD *)(v0 + 2064) = *(_OWORD *)(v0 + 832);
  v2 = *(_OWORD *)(v0 + 864);
  *(_OWORD *)(v0 + 2080) = *(_OWORD *)(v0 + 848);
  *(_OWORD *)(v0 + 2096) = v2;
  *(_OWORD *)(v0 + 2112) = *(_OWORD *)(v0 + 880);
  v3 = *(_OWORD *)(v0 + 752);
  *(_OWORD *)(v0 + 2000) = *(_OWORD *)(v0 + 768);
  v4 = *(_OWORD *)(v0 + 800);
  *(_OWORD *)(v0 + 2016) = *(_OWORD *)(v0 + 784);
  *(_OWORD *)(v0 + 2032) = v4;
  *(_OWORD *)(v0 + 2048) = v1;
  v5 = *(_OWORD *)(v0 + 736);
  *(_OWORD *)(v0 + 1952) = *(_OWORD *)(v0 + 720);
  *(_OWORD *)(v0 + 1968) = v5;
  *(_OWORD *)(v0 + 1984) = v3;
  sub_21480BB4C(v0 + 1952);
  v6 = *(void **)(v0 + 2400);
  if (qword_254D8E200 != -1)
    swift_once();
  v7 = sub_214852494();
  __swift_project_value_buffer(v7, (uint64_t)qword_254D8E208);
  v8 = v6;
  v9 = v6;
  v10 = sub_21485247C();
  v11 = sub_2148528CC();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v17[0] = v13;
    *(_DWORD *)v12 = 136315138;
    swift_getErrorValue();
    v14 = sub_214852B6C();
    *(_QWORD *)(v0 + 2296) = sub_2147F3D14(v14, v15, v17);
    sub_21485292C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2147EE000, v10, v11, "### WiFiSetup failed: error=%s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v13, -1, -1);
    MEMORY[0x2199D75E8](v12, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_21480B924()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  char v12;

  v1 = *(void **)(v0 + 40);
  if (v1)
  {
    v2 = *(id *)(v0 + 40);
  }
  else
  {
    v3 = *(void **)(v0 + 32);
    if (v3)
    {
      v4 = *(id *)(v0 + 32);
    }
    else
    {
      v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE29F18]), sel_init);
      v6 = *(void **)(v0 + 32);
      *(_QWORD *)(v0 + 32) = v5;
      v4 = v5;

      objc_msgSend(v4, sel_activate);
      v3 = 0;
    }
    v7 = v3;
    v8 = objc_msgSend(v4, sel_currentKnownNetworkProfile);

    if (!v8)
    {
      v2 = (id)type metadata accessor for SKError();
      v12 = 1;
      SKError.__allocating_init(_:_:_:)((uint64_t)&v12, 0xD000000000000012, 0x800000021485E260, 0);
      swift_willThrow();
      return v2;
    }
    v9 = *(void **)(v0 + 40);
    *(_QWORD *)(v0 + 40) = v8;
    v2 = v8;

    v1 = 0;
  }
  v10 = v1;
  return v2;
}

uint64_t sub_21480BA44()
{
  uint64_t *v0;

  return SKEnvironmental<>.unownedExecutor.getter(*v0, (uint64_t)&protocol witness table for SKStepWiFiSetupClient);
}

unint64_t sub_21480BA58()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D88C50;
  if (!qword_254D88C50)
  {
    v1 = type metadata accessor for SKStepWiFiSetupClient();
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepWiFiSetupClient, v1);
    atomic_store(result, (unint64_t *)&qword_254D88C50);
  }
  return result;
}

uint64_t type metadata accessor for SKStepWiFiSetupClient()
{
  return objc_opt_self();
}

uint64_t sub_21480BABC(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 16);
  v3 = *(void **)(a1 + 88);
  swift_bridgeObjectRetain();
  v4 = v2;
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_21480BB08()
{
  unint64_t result;

  result = qword_254D88C58;
  if (!qword_254D88C58)
  {
    result = MEMORY[0x2199D7540](&unk_214858B08, &type metadata for SKStepWiFiSetupStartRequestMessage);
    atomic_store(result, (unint64_t *)&qword_254D88C58);
  }
  return result;
}

uint64_t sub_21480BB4C(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 88);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_21480BB9C()
{
  unint64_t result;

  result = qword_254D88C60;
  if (!qword_254D88C60)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepWiFiSetupReport, &type metadata for SKStepWiFiSetupReport);
    atomic_store(result, (unint64_t *)&qword_254D88C60);
  }
  return result;
}

unint64_t sub_21480BBE0()
{
  unint64_t result;

  result = qword_254D88C68;
  if (!qword_254D88C68)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepWiFiSetupConfiguration, &type metadata for SKStepWiFiSetupConfiguration);
    atomic_store(result, (unint64_t *)&qword_254D88C68);
  }
  return result;
}

uint64_t method lookup function for SKStepWiFiSetupClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SKStepWiFiSetupClient.__allocating_init(client:environment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_21480BC38()
{
  uint64_t v0;

  v0 = sub_214852494();
  __swift_allocate_value_buffer(v0, qword_254D8E2A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D8E2A8);
  sub_214801FC0();
  swift_bridgeObjectRetain();
  return sub_214852488();
}

uint64_t SKStepWiFiSetupServer.environment.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t SKStepWiFiSetupServer.__allocating_init(server:environment:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = swift_allocObject();
  v4 = *a2;
  *(_BYTE *)(v3 + 16) = 0;
  swift_weakInit();
  *(_BYTE *)(v3 + 40) = 0;
  *(_QWORD *)(v3 + 48) = 0;
  *(_QWORD *)(v3 + 24) = v4;
  swift_weakAssign();
  swift_release();
  return v3;
}

uint64_t SKStepWiFiSetupServer.init(server:environment:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *a2;
  *(_BYTE *)(v2 + 16) = 0;
  swift_weakInit();
  *(_BYTE *)(v2 + 40) = 0;
  *(_QWORD *)(v2 + 48) = 0;
  *(_QWORD *)(v2 + 24) = v3;
  swift_weakAssign();
  swift_release();
  return v2;
}

uint64_t SKStepWiFiSetupServer.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  v1 = v0;
  if (qword_254D8E2A0 != -1)
    swift_once();
  v2 = sub_214852494();
  __swift_project_value_buffer(v2, (uint64_t)qword_254D8E2A8);
  v3 = sub_21485247C();
  v4 = sub_2148528C0();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2147EE000, v3, v4, "deinit", v5, 2u);
    MEMORY[0x2199D75E8](v5, -1, -1);
  }

  objc_msgSend(*(id *)(v1 + 48), sel_invalidate);
  swift_bridgeObjectRelease();
  swift_weakDestroy();

  return v1;
}

uint64_t SKStepWiFiSetupServer.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  v1 = v0;
  if (qword_254D8E2A0 != -1)
    swift_once();
  v2 = sub_214852494();
  __swift_project_value_buffer(v2, (uint64_t)qword_254D8E2A8);
  v3 = sub_21485247C();
  v4 = sub_2148528C0();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2147EE000, v3, v4, "deinit", v5, 2u);
    MEMORY[0x2199D75E8](v5, -1, -1);
  }

  objc_msgSend(*(id *)(v1 + 48), sel_invalidate);
  swift_bridgeObjectRelease();
  swift_weakDestroy();

  return swift_deallocClassInstance();
}

uint64_t SKStepWiFiSetupServer.start()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[7] = v2;
  sub_2147F4354(&qword_254D88D30, a2, (uint64_t (*)(uint64_t))type metadata accessor for SKStepWiFiSetupServer, (uint64_t)&protocol conformance descriptor for SKStepWiFiSetupServer);
  v3[8] = sub_2148527C4();
  v3[9] = v4;
  return swift_task_switch();
}

uint64_t sub_21480BFFC()
{
  _QWORD *v0;
  uint64_t (*v1)(void);
  uint64_t Strong;
  uint64_t v3;
  char v5[9];

  if ((*(_BYTE *)(v0[7] + 40) & 1) != 0)
  {
    v1 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    Strong = swift_weakLoadStrong();
    v0[10] = Strong;
    if (Strong)
    {
      v0[11] = *(_QWORD *)(Strong + OBJC_IVAR____TtC8SetupKit8SKServer_nexusSession);
      v3 = swift_allocObject();
      swift_weakInit();
      v0[5] = &type metadata for SKStepWiFiSetupStartRequestHandler;
      v0[6] = sub_214814280();
      v0[2] = &unk_254D88D40;
      v0[3] = v3;
      sub_21485262C();
      sub_2147F4354(&qword_254D88200, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC80], MEMORY[0x24BE6DC90]);
      swift_retain();
      sub_2148527C4();
      return swift_task_switch();
    }
    type metadata accessor for SKError();
    v5[0] = 2;
    SKError.__allocating_init(_:_:_:)((uint64_t)v5, 0x7265534B53206F4ELL, 0xEB00000000726576, 0);
    swift_willThrow();
    v1 = (uint64_t (*)(void))v0[1];
  }
  return v1();
}

uint64_t sub_21480C174(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  *(_QWORD *)(v4 + 448) = a1;
  *(_QWORD *)(v4 + 456) = a4;
  v5 = a2[9];
  *(_OWORD *)(v4 + 144) = a2[8];
  *(_OWORD *)(v4 + 160) = v5;
  *(_OWORD *)(v4 + 176) = a2[10];
  v6 = a2[5];
  *(_OWORD *)(v4 + 80) = a2[4];
  *(_OWORD *)(v4 + 96) = v6;
  v7 = a2[7];
  *(_OWORD *)(v4 + 112) = a2[6];
  *(_OWORD *)(v4 + 128) = v7;
  v8 = a2[1];
  *(_OWORD *)(v4 + 16) = *a2;
  *(_OWORD *)(v4 + 32) = v8;
  v9 = a2[3];
  *(_OWORD *)(v4 + 48) = a2[2];
  *(_OWORD *)(v4 + 64) = v9;
  return swift_task_switch();
}

uint64_t sub_21480C1BC()
{
  uint64_t v0;
  uint64_t Strong;
  _OWORD *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD *v21;
  uint64_t v22;
  _OWORD v23[12];

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 464) = Strong;
  if (Strong)
  {
    v2 = (_OWORD *)(v0 + 16);
    if (qword_254D8E2A0 != -1)
      swift_once();
    v3 = sub_214852494();
    __swift_project_value_buffer(v3, (uint64_t)qword_254D8E2A8);
    sub_21480BABC(v0 + 16);
    sub_21480BABC(v0 + 16);
    v4 = sub_21485247C();
    v5 = sub_2148528D8();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      *(_DWORD *)v6 = 136315138;
      v22 = v7;
      v8 = *(_OWORD *)(v0 + 160);
      v23[8] = *(_OWORD *)(v0 + 144);
      v23[9] = v8;
      v23[10] = *(_OWORD *)(v0 + 176);
      v9 = *(_OWORD *)(v0 + 96);
      v23[4] = *(_OWORD *)(v0 + 80);
      v23[5] = v9;
      v10 = *(_OWORD *)(v0 + 128);
      v23[6] = *(_OWORD *)(v0 + 112);
      v23[7] = v10;
      v11 = *(_OWORD *)(v0 + 32);
      v23[0] = *v2;
      v23[1] = v11;
      v12 = *(_OWORD *)(v0 + 64);
      v23[2] = *(_OWORD *)(v0 + 48);
      v23[3] = v12;
      v13 = SKStepWiFiSetupConfiguration.description.getter();
      *(_QWORD *)(v0 + 440) = sub_2147F3D14(v13, v14, &v22);
      sub_21485292C();
      swift_bridgeObjectRelease();
      sub_21480BB4C(v0 + 16);
      sub_21480BB4C(v0 + 16);
      _os_log_impl(&dword_2147EE000, v4, v5, "WiFiSetup start: configuration=%s", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199D75E8](v7, -1, -1);
      MEMORY[0x2199D75E8](v6, -1, -1);
    }
    else
    {
      sub_21480BB4C(v0 + 16);
      sub_21480BB4C(v0 + 16);
    }

    v16 = *(_OWORD *)(v0 + 160);
    *(_OWORD *)(v0 + 320) = *(_OWORD *)(v0 + 144);
    *(_OWORD *)(v0 + 336) = v16;
    *(_OWORD *)(v0 + 352) = *(_OWORD *)(v0 + 176);
    v17 = *(_OWORD *)(v0 + 96);
    *(_OWORD *)(v0 + 256) = *(_OWORD *)(v0 + 80);
    *(_OWORD *)(v0 + 272) = v17;
    v18 = *(_OWORD *)(v0 + 128);
    *(_OWORD *)(v0 + 288) = *(_OWORD *)(v0 + 112);
    *(_OWORD *)(v0 + 304) = v18;
    v19 = *(_OWORD *)(v0 + 32);
    *(_OWORD *)(v0 + 192) = *v2;
    *(_OWORD *)(v0 + 208) = v19;
    v20 = *(_OWORD *)(v0 + 64);
    *(_OWORD *)(v0 + 224) = *(_OWORD *)(v0 + 48);
    *(_OWORD *)(v0 + 240) = v20;
    sub_21480BABC(v0 + 16);
    v21 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 472) = v21;
    *v21 = v0;
    v21[1] = sub_21480C4AC;
    return SKStepWiFiSetupServer.perform(configuration:)(v0 + 368, (_OWORD *)(v0 + 192));
  }
  else
  {
    type metadata accessor for SKError();
    LOBYTE(v23[0]) = 1;
    SKError.__allocating_init(_:_:_:)((uint64_t)v23, 0x6720726576726553, 0xEB00000000656E6FLL, 0);
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_21480C4AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)v1 + 16;
  *(_QWORD *)(*(_QWORD *)v1 + 480) = v0;
  swift_task_dealloc();
  sub_21480BB4C(v2);
  return swift_task_switch();
}

uint64_t sub_21480C520()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;

  v1 = *(_QWORD *)(v0 + 448);
  swift_release();
  v2 = *(_BYTE *)(v0 + 376);
  v3 = *(_QWORD *)(v0 + 384);
  v4 = *(_BYTE *)(v0 + 392);
  v5 = *(_QWORD *)(v0 + 400);
  v6 = *(_BYTE *)(v0 + 408);
  *(_QWORD *)v1 = *(_QWORD *)(v0 + 368);
  *(_BYTE *)(v1 + 8) = v2;
  *(_QWORD *)(v1 + 16) = v3;
  *(_BYTE *)(v1 + 24) = v4;
  *(_QWORD *)(v1 + 32) = v5;
  *(_BYTE *)(v1 + 40) = v6;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21480C58C()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SKStepWiFiSetupServer.perform(configuration:)(uint64_t a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  *(_QWORD *)(v3 + 1112) = v2;
  *(_QWORD *)(v3 + 1104) = a2;
  *(_QWORD *)(v3 + 1096) = a1;
  v4 = a2[9];
  *(_OWORD *)(v3 + 816) = a2[8];
  *(_OWORD *)(v3 + 832) = v4;
  *(_OWORD *)(v3 + 848) = a2[10];
  v5 = a2[5];
  *(_OWORD *)(v3 + 752) = a2[4];
  *(_OWORD *)(v3 + 768) = v5;
  v6 = a2[7];
  *(_OWORD *)(v3 + 784) = a2[6];
  *(_OWORD *)(v3 + 800) = v6;
  v7 = a2[1];
  *(_OWORD *)(v3 + 688) = *a2;
  *(_OWORD *)(v3 + 704) = v7;
  v8 = a2[3];
  *(_OWORD *)(v3 + 720) = a2[2];
  *(_OWORD *)(v3 + 736) = v8;
  sub_2147F4354(&qword_254D88D30, (uint64_t)a2, (uint64_t (*)(uint64_t))type metadata accessor for SKStepWiFiSetupServer, (uint64_t)&protocol conformance descriptor for SKStepWiFiSetupServer);
  *(_QWORD *)(v3 + 1120) = sub_2148527C4();
  *(_QWORD *)(v3 + 1128) = v9;
  return swift_task_switch();
}

uint64_t sub_21480C668()
{
  uint64_t v0;
  __int128 *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _QWORD *v10;

  v1 = *(__int128 **)(v0 + 1104);
  v2 = *v1;
  v3 = v1[2];
  *(_OWORD *)(v0 + 256) = v1[1];
  *(_OWORD *)(v0 + 272) = v3;
  *(_OWORD *)(v0 + 240) = v2;
  v4 = v1[3];
  v5 = v1[4];
  v6 = v1[6];
  *(_OWORD *)(v0 + 320) = v1[5];
  *(_OWORD *)(v0 + 336) = v6;
  *(_OWORD *)(v0 + 288) = v4;
  *(_OWORD *)(v0 + 304) = v5;
  v7 = v1[7];
  v8 = v1[8];
  v9 = v1[10];
  *(_OWORD *)(v0 + 384) = v1[9];
  *(_OWORD *)(v0 + 400) = v9;
  *(_OWORD *)(v0 + 352) = v7;
  *(_OWORD *)(v0 + 368) = v8;
  *(_QWORD *)(v0 + 416) = 0;
  *(_BYTE *)(v0 + 424) = 1;
  *(_QWORD *)(v0 + 432) = 0;
  *(_BYTE *)(v0 + 440) = 1;
  *(_QWORD *)(v0 + 448) = 0;
  *(_BYTE *)(v0 + 456) = 1;
  sub_21480BABC(v0 + 688);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 1136) = v10;
  *v10 = v0;
  v10[1] = sub_21480C710;
  return sub_21480CD24(v0 + 240);
}

uint64_t sub_21480C710(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v4;
  _QWORD *v6;

  v4 = (_QWORD *)*v2;
  v4[143] = a1;
  v4[144] = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  v6 = (_QWORD *)swift_task_alloc();
  v4[145] = v6;
  *v6 = v4;
  v6[1] = sub_21480C7BC;
  return sub_21480D93C((uint64_t)(v4 + 30), a1);
}

uint64_t sub_21480C7BC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 1168) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21480C828()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  _BOOL4 v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v28;
  uint64_t v29[2];
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;

  if (qword_254D8E2A0 != -1)
    swift_once();
  v1 = (char *)(v0 + 424);
  v2 = sub_214852494();
  __swift_project_value_buffer(v2, (uint64_t)qword_254D8E2A8);
  v3 = sub_21485247C();
  v4 = sub_2148528D8();
  v5 = os_log_type_enabled(v3, v4);
  v6 = *(void **)(v0 + 1144);
  if (v5)
  {
    v28 = *(void **)(v0 + 1144);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v29[0] = v8;
    *(_DWORD *)v7 = 136315138;
    swift_beginAccess();
    v9 = *v1;
    v10 = *(_QWORD *)(v0 + 432);
    v11 = *(_BYTE *)(v0 + 440);
    v12 = *(_QWORD *)(v0 + 448);
    v13 = *(_BYTE *)(v0 + 456);
    v29[1] = *(_QWORD *)(v0 + 416);
    v30 = v9;
    v31 = v10;
    v32 = v11;
    v33 = v12;
    v34 = v13;
    v14 = SKStepWiFiSetupReport.description.getter();
    *(_QWORD *)(v0 + 1088) = sub_2147F3D14(v14, v15, v29);
    sub_21485292C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2147EE000, v3, v4, "WiFiSetup success: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v8, -1, -1);
    MEMORY[0x2199D75E8](v7, -1, -1);
    v6 = v28;
  }

  v16 = *(_QWORD *)(v0 + 1096);
  swift_beginAccess();
  v17 = *v1;
  v18 = *(_QWORD *)(v0 + 432);
  v19 = *(_BYTE *)(v0 + 440);
  v20 = *(_QWORD *)(v0 + 448);
  v21 = *(_BYTE *)(v0 + 456);
  *(_QWORD *)v16 = *(_QWORD *)(v0 + 416);
  *(_BYTE *)(v16 + 8) = v17;
  *(_QWORD *)(v16 + 16) = v18;
  *(_BYTE *)(v16 + 24) = v19;
  *(_QWORD *)(v16 + 32) = v20;
  *(_BYTE *)(v16 + 40) = v21;
  v22 = *(_OWORD *)(v0 + 384);
  *(_OWORD *)(v0 + 992) = *(_OWORD *)(v0 + 368);
  *(_OWORD *)(v0 + 1008) = v22;
  *(_OWORD *)(v0 + 1024) = *(_OWORD *)(v0 + 400);
  v23 = *(_OWORD *)(v0 + 320);
  *(_OWORD *)(v0 + 928) = *(_OWORD *)(v0 + 304);
  *(_OWORD *)(v0 + 944) = v23;
  v24 = *(_OWORD *)(v0 + 352);
  *(_OWORD *)(v0 + 960) = *(_OWORD *)(v0 + 336);
  *(_OWORD *)(v0 + 976) = v24;
  v25 = *(_OWORD *)(v0 + 256);
  *(_OWORD *)(v0 + 864) = *(_OWORD *)(v0 + 240);
  *(_OWORD *)(v0 + 880) = v25;
  v26 = *(_OWORD *)(v0 + 288);
  *(_OWORD *)(v0 + 896) = *(_OWORD *)(v0 + 272);
  *(_OWORD *)(v0 + 912) = v26;
  sub_21480BB4C(v0 + 864);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21480CA8C()
{
  uint64_t v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v1 = *(_OWORD *)(v0 + 416);
  *(_OWORD *)(v0 + 624) = *(_OWORD *)(v0 + 400);
  *(_OWORD *)(v0 + 640) = v1;
  *(_OWORD *)(v0 + 656) = *(_OWORD *)(v0 + 432);
  v2 = *(_OWORD *)(v0 + 352);
  *(_OWORD *)(v0 + 560) = *(_OWORD *)(v0 + 336);
  *(_OWORD *)(v0 + 576) = v2;
  v3 = *(_OWORD *)(v0 + 384);
  *(_OWORD *)(v0 + 592) = *(_OWORD *)(v0 + 368);
  *(_OWORD *)(v0 + 608) = v3;
  v4 = *(_OWORD *)(v0 + 288);
  *(_OWORD *)(v0 + 496) = *(_OWORD *)(v0 + 272);
  *(_OWORD *)(v0 + 512) = v4;
  v5 = *(_OWORD *)(v0 + 320);
  *(_OWORD *)(v0 + 528) = *(_OWORD *)(v0 + 304);
  *(_OWORD *)(v0 + 544) = v5;
  v6 = *(_OWORD *)(v0 + 256);
  *(_OWORD *)(v0 + 464) = *(_OWORD *)(v0 + 240);
  *(_OWORD *)(v0 + 480) = v6;
  *(_OWORD *)(v0 + 665) = *(_OWORD *)(v0 + 441);
  sub_21480BB4C(v0 + 464);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21480CB04()
{
  uint64_t v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v1 = *(_OWORD *)(v0 + 416);
  *(_OWORD *)(v0 + 176) = *(_OWORD *)(v0 + 400);
  *(_OWORD *)(v0 + 192) = v1;
  *(_OWORD *)(v0 + 208) = *(_OWORD *)(v0 + 432);
  *(_OWORD *)(v0 + 217) = *(_OWORD *)(v0 + 441);
  v2 = *(_OWORD *)(v0 + 352);
  *(_OWORD *)(v0 + 112) = *(_OWORD *)(v0 + 336);
  *(_OWORD *)(v0 + 128) = v2;
  v3 = *(_OWORD *)(v0 + 384);
  *(_OWORD *)(v0 + 144) = *(_OWORD *)(v0 + 368);
  *(_OWORD *)(v0 + 160) = v3;
  v4 = *(_OWORD *)(v0 + 288);
  *(_OWORD *)(v0 + 48) = *(_OWORD *)(v0 + 272);
  *(_OWORD *)(v0 + 64) = v4;
  v5 = *(_OWORD *)(v0 + 320);
  *(_OWORD *)(v0 + 80) = *(_OWORD *)(v0 + 304);
  *(_OWORD *)(v0 + 96) = v5;
  v6 = *(_OWORD *)(v0 + 256);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 240);
  *(_OWORD *)(v0 + 32) = v6;
  sub_21480BB4C(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SKStepWiFiSetupServer.cancel()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[2] = v2;
  sub_2147F4354(&qword_254D88D30, a2, (uint64_t (*)(uint64_t))type metadata accessor for SKStepWiFiSetupServer, (uint64_t)&protocol conformance descriptor for SKStepWiFiSetupServer);
  v3[3] = sub_2148527C4();
  v3[4] = v4;
  return swift_task_switch();
}

uint64_t sub_21480CBF4()
{
  uint64_t v0;
  uint64_t Strong;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 16) = 1;
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    *(_QWORD *)(v0 + 40) = *(_QWORD *)(Strong + OBJC_IVAR____TtC8SetupKit8SKServer_nexusSession);
    swift_retain();
    swift_release();
    sub_21485262C();
    sub_2147F4354(&qword_254D88200, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC80], MEMORY[0x24BE6DC90]);
    sub_2148527C4();
    return swift_task_switch();
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(v0 + 16) + 40) = 0;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_21480CCD4()
{
  sub_2148525B4();
  return swift_task_switch();
}

uint64_t sub_21480CD24(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[12] = a1;
  v2[13] = v1;
  v3 = sub_214852428();
  v2[14] = v3;
  v2[15] = *(_QWORD *)(v3 - 8);
  v2[16] = swift_task_alloc();
  v4 = sub_21485241C();
  v2[17] = v4;
  v2[18] = *(_QWORD *)(v4 - 8);
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  sub_2147F4354(&qword_254D88D30, v5, (uint64_t (*)(uint64_t))type metadata accessor for SKStepWiFiSetupServer, (uint64_t)&protocol conformance descriptor for SKStepWiFiSetupServer);
  v2[21] = sub_2148527C4();
  v2[22] = v6;
  return swift_task_switch();
}

uint64_t sub_21480CDF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  _QWORD v23[2];

  v1 = *(_QWORD *)(v0 + 96);
  *(_QWORD *)(v0 + 184) = *(_QWORD *)(v1 + 160);
  v2 = *(_QWORD *)(v1 + 168);
  *(_QWORD *)(v0 + 192) = v2;
  if (!v2)
  {
    type metadata accessor for SKError();
    LOBYTE(v23[0]) = 4;
    SKError.__allocating_init(_:_:_:)((uint64_t)v23, 0x44495353206F6ELL, 0xE700000000000000, 0);
    swift_willThrow();
LABEL_12:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v4 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 128);
  v5 = *(_QWORD *)(v0 + 112);
  v6 = *(_QWORD *)(*(_QWORD *)(v0 + 104) + 24);
  *(_QWORD *)(v0 + 200) = v6;
  v23[0] = v6;
  swift_bridgeObjectRetain();
  SKEnvironmentValues.clock.getter();
  sub_214852404();
  v7 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8);
  *(_QWORD *)(v0 + 208) = v7;
  result = v7(v3, v5);
  if (*(_BYTE *)(v1 + 152) == 1)
  {
    if ((swift_task_isCurrentExecutor() & 1) == 0)
      swift_task_reportUnexpectedExecutor();
    v23[0] = v6;
    result = SKEnvironmentValues.subscript.getter((uint64_t)&type metadata for WiFiScanRetriesSKEnvironmentKey, (uint64_t)&type metadata for WiFiScanRetriesSKEnvironmentKey, (uint64_t)&off_254D88EE8, v0 + 88);
    v9 = *(_QWORD *)(v0 + 88);
  }
  else
  {
    v9 = *(_QWORD *)(v1 + 144);
  }
  *(_QWORD *)(v0 + 216) = v9;
  if (v9 < 1)
  {
    __break(1u);
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 104);
    *(_OWORD *)(v0 + 224) = xmmword_2148577A0;
    if (*(_BYTE *)(v10 + 16) == 1)
    {
      type metadata accessor for SKError();
      LOBYTE(v23[0]) = 6;
      SKError.__allocating_init(_:_:_:)((uint64_t)v23, 0x64656C65636E6143, 0xE800000000000000, 0);
      swift_willThrow();
      v11 = *(_QWORD *)(v0 + 160);
      v12 = *(_QWORD *)(v0 + 136);
      v13 = *(_QWORD *)(v0 + 144);
      swift_bridgeObjectRelease();

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
      goto LABEL_12;
    }
    sub_214852860();
    v14 = *(_QWORD *)(v0 + 96);
    v15 = *(_QWORD *)v14;
    v16 = *(_BYTE *)(v14 + 8);
    v17 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v17;
    *v17 = v0;
    v18 = *(_QWORD *)(v0 + 192);
    if ((v16 & 1) != 0 || v15 < 1)
    {
      v17[1] = sub_21480D26C;
      v19 = *(_QWORD *)(v0 + 184);
      v20 = *(_QWORD *)(v0 + 96);
      v21 = 0;
      v22 = 1;
    }
    else
    {
      v17[1] = sub_21480D0A0;
      v19 = *(_QWORD *)(v0 + 184);
      v20 = *(_QWORD *)(v0 + 96);
      v21 = v15;
      v22 = 0;
    }
    return sub_21480E740(v20, v19, v18, v21, v22, 1);
  }
  return result;
}

uint64_t sub_21480D0A0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;

  v3 = (_QWORD *)*v2;
  v3[2] = v2;
  v3[3] = a1;
  v3[4] = v1;
  v4 = (_QWORD *)*v2;
  v3[31] = v1;
  swift_task_dealloc();
  v5 = v3[24];
  if (v1)
  {
    v6 = (_QWORD *)swift_task_alloc();
    v3[33] = v6;
    *v6 = v4;
    v6[1] = sub_21480D3EC;
    return sub_21480E740(v3[12], v3[23], v5, 0, 1, v3[29]);
  }
  else
  {
    swift_bridgeObjectRelease();
    return swift_task_switch();
  }
}

uint64_t sub_21480D160()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  double v10;
  id v12;
  uint64_t v13;

  v12 = *(id *)(v0 + 224);
  v13 = *(_QWORD *)(v0 + 24);
  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 208);
  v2 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 160);
  v5 = *(_QWORD *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 128);
  v7 = *(_QWORD *)(v0 + 112);
  v8 = *(_QWORD *)(v0 + 96);
  SKEnvironmentValues.clock.getter();
  sub_214852404();
  v1(v6, v7);
  sub_214852410();
  v9 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v9(v2, v5);
  v10 = Duration.seconds.getter();

  v9(v3, v5);
  *(double *)(v8 + 208) = v10;
  *(_BYTE *)(v8 + 216) = 0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v13);
}

uint64_t sub_21480D26C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[5] = v2;
  v3[6] = a1;
  v3[7] = v1;
  v3[32] = v1;
  swift_task_dealloc();
  if (!v1)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_21480D2E0()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  double v10;
  id v12;
  uint64_t v13;

  v12 = *(id *)(v0 + 224);
  v13 = *(_QWORD *)(v0 + 48);
  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 208);
  v2 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 160);
  v5 = *(_QWORD *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 128);
  v7 = *(_QWORD *)(v0 + 112);
  v8 = *(_QWORD *)(v0 + 96);
  SKEnvironmentValues.clock.getter();
  sub_214852404();
  v1(v6, v7);
  sub_214852410();
  v9 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v9(v2, v5);
  v10 = Duration.seconds.getter();

  v9(v3, v5);
  *(double *)(v8 + 208) = v10;
  *(_BYTE *)(v8 + 216) = 0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v13);
}

uint64_t sub_21480D3EC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[8] = v2;
  v3[9] = a1;
  v3[10] = v1;
  v3[34] = v1;
  swift_task_dealloc();
  if (!v1)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_21480D460()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  double v10;
  id v12;
  uint64_t v13;

  v12 = *(id *)(v0 + 224);
  v13 = *(_QWORD *)(v0 + 72);
  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 208);
  v2 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 160);
  v5 = *(_QWORD *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 128);
  v7 = *(_QWORD *)(v0 + 112);
  v8 = *(_QWORD *)(v0 + 96);
  SKEnvironmentValues.clock.getter();
  sub_214852404();
  v1(v6, v7);
  sub_214852410();
  v9 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v9(v2, v5);
  v10 = Duration.seconds.getter();

  v9(v3, v5);
  *(double *)(v8 + 208) = v10;
  *(_BYTE *)(v8 + 216) = 0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v13);
}

void sub_21480D574()
{
  uint64_t v0;
  void *v1;
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
  char v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19[9];

  v1 = *(void **)(v0 + 272);
  if (*(_QWORD *)(v0 + 224))
  {

    v1 = *(void **)(v0 + 224);
  }
  v2 = *(_QWORD *)(v0 + 232);
  if (v2 == *(_QWORD *)(v0 + 216))
  {
    v3 = *(_QWORD *)(v0 + 160);
    v4 = *(_QWORD *)(v0 + 136);
    v5 = *(_QWORD *)(v0 + 144);
    swift_bridgeObjectRelease();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
LABEL_9:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    (*(void (**)(void))(v0 + 8))();
    return;
  }
  v6 = v2 + 1;
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v0 + 224) = v1;
    *(_QWORD *)(v0 + 232) = v6;
    if (*(_BYTE *)(*(_QWORD *)(v0 + 104) + 16) == 1)
    {
      type metadata accessor for SKError();
      v19[0] = 6;
      SKError.__allocating_init(_:_:_:)((uint64_t)v19, 0x64656C65636E6143, 0xE800000000000000, 0);
      swift_willThrow();
      v7 = *(_QWORD *)(v0 + 160);
      v8 = *(_QWORD *)(v0 + 136);
      v9 = *(_QWORD *)(v0 + 144);
      swift_bridgeObjectRelease();

      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
      goto LABEL_9;
    }
    sub_214852860();
    v10 = *(_QWORD *)(v0 + 96);
    v11 = *(_QWORD *)v10;
    v12 = *(_BYTE *)(v10 + 8);
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v13;
    *v13 = v0;
    v14 = *(_QWORD *)(v0 + 192);
    if ((v12 & 1) != 0 || v11 < 1)
    {
      v13[1] = sub_21480D26C;
      v15 = *(_QWORD *)(v0 + 184);
      v16 = *(_QWORD *)(v0 + 96);
      v17 = 0;
      v18 = 1;
    }
    else
    {
      v13[1] = sub_21480D0A0;
      v15 = *(_QWORD *)(v0 + 184);
      v16 = *(_QWORD *)(v0 + 96);
      v17 = v11;
      v18 = 0;
    }
    sub_21480E740(v16, v15, v14, v17, v18, v6);
  }
}

void sub_21480D75C()
{
  uint64_t v0;
  void *v1;
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
  char v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19[9];

  v1 = *(void **)(v0 + 256);
  if (*(_QWORD *)(v0 + 224))
  {

    v1 = *(void **)(v0 + 224);
  }
  v2 = *(_QWORD *)(v0 + 232);
  if (v2 == *(_QWORD *)(v0 + 216))
  {
    v3 = *(_QWORD *)(v0 + 160);
    v4 = *(_QWORD *)(v0 + 136);
    v5 = *(_QWORD *)(v0 + 144);
    swift_bridgeObjectRelease();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
LABEL_9:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    (*(void (**)(void))(v0 + 8))();
    return;
  }
  v6 = v2 + 1;
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v0 + 224) = v1;
    *(_QWORD *)(v0 + 232) = v6;
    if (*(_BYTE *)(*(_QWORD *)(v0 + 104) + 16) == 1)
    {
      type metadata accessor for SKError();
      v19[0] = 6;
      SKError.__allocating_init(_:_:_:)((uint64_t)v19, 0x64656C65636E6143, 0xE800000000000000, 0);
      swift_willThrow();
      v7 = *(_QWORD *)(v0 + 160);
      v8 = *(_QWORD *)(v0 + 136);
      v9 = *(_QWORD *)(v0 + 144);
      swift_bridgeObjectRelease();

      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
      goto LABEL_9;
    }
    sub_214852860();
    v10 = *(_QWORD *)(v0 + 96);
    v11 = *(_QWORD *)v10;
    v12 = *(_BYTE *)(v10 + 8);
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v13;
    *v13 = v0;
    v14 = *(_QWORD *)(v0 + 192);
    if ((v12 & 1) != 0 || v11 < 1)
    {
      v13[1] = sub_21480D26C;
      v15 = *(_QWORD *)(v0 + 184);
      v16 = *(_QWORD *)(v0 + 96);
      v17 = 0;
      v18 = 1;
    }
    else
    {
      v13[1] = sub_21480D0A0;
      v15 = *(_QWORD *)(v0 + 184);
      v16 = *(_QWORD *)(v0 + 96);
      v17 = v11;
      v18 = 0;
    }
    sub_21480E740(v16, v15, v14, v17, v18, v6);
  }
}

uint64_t sub_21480D93C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[13] = a2;
  v3[14] = v2;
  v3[12] = a1;
  v4 = sub_214852428();
  v3[15] = v4;
  v3[16] = *(_QWORD *)(v4 - 8);
  v3[17] = swift_task_alloc();
  v5 = sub_21485241C();
  v3[18] = v5;
  v3[19] = *(_QWORD *)(v5 - 8);
  v3[20] = swift_task_alloc();
  v3[21] = swift_task_alloc();
  sub_2147F4354(&qword_254D88D30, v6, (uint64_t (*)(uint64_t))type metadata accessor for SKStepWiFiSetupServer, (uint64_t)&protocol conformance descriptor for SKStepWiFiSetupServer);
  v3[22] = sub_2148527C4();
  v3[23] = v7;
  return swift_task_switch();
}

uint64_t sub_21480DA14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  _QWORD *v33;
  uint64_t v34;

  v2 = *(_QWORD *)(v0 + 128);
  v1 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 120);
  v5 = *(_QWORD *)(v0 + 96);
  v4 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD *)(*(_QWORD *)(v0 + 112) + 24);
  *(_QWORD *)(v0 + 192) = v6;
  v34 = v6;
  SKEnvironmentValues.clock.getter();
  sub_214852404();
  v7 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  *(_QWORD *)(v0 + 200) = v7;
  v7(v1, v3);
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE29F00]), sel_init, v34);
  *(_QWORD *)(v0 + 208) = v8;
  objc_msgSend(v8, sel_setScanResult_, v4);
  if (*(_QWORD *)(v5 + 136))
  {
    swift_bridgeObjectRetain();
    v9 = (void *)sub_2148526A4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v10 = *(_QWORD *)(v0 + 96);
  objc_msgSend(v8, sel_setPassword_, v9);

  if (*(_BYTE *)(v10 + 152) == 1)
  {
    if ((swift_task_isCurrentExecutor() & 1) == 0)
      swift_task_reportUnexpectedExecutor();
    v34 = v6;
    SKEnvironmentValues.subscript.getter((uint64_t)&type metadata for WiFiScanRetriesSKEnvironmentKey, (uint64_t)&type metadata for WiFiScanRetriesSKEnvironmentKey, (uint64_t)&off_254D88EE8, v0 + 56);
    v11 = *(_QWORD *)(v0 + 56);
  }
  else
  {
    v11 = *(_QWORD *)(v10 + 144);
  }
  *(_QWORD *)(v0 + 216) = v11;
  if (v11 < 1)
  {
    __break(1u);
LABEL_21:
    swift_once();
    goto LABEL_13;
  }
  v12 = *(_QWORD *)(v0 + 112);
  *(_OWORD *)(v0 + 224) = xmmword_2148577A0;
  if (*(_BYTE *)(v12 + 16) == 1)
  {
    v13 = *(void **)(v0 + 208);
    type metadata accessor for SKError();
    LOBYTE(v34) = 6;
    SKError.__allocating_init(_:_:_:)((uint64_t)&v34, 0x64656C65636E6143, 0xE800000000000000, 0);
    swift_willThrow();

    v14 = *(_QWORD *)(v0 + 168);
    v15 = *(_QWORD *)(v0 + 144);
    v16 = *(_QWORD *)(v0 + 152);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  sub_214852860();
  if (qword_254D8E2A0 != -1)
    goto LABEL_21;
LABEL_13:
  v18 = *(void **)(v0 + 104);
  v19 = sub_214852494();
  *(_QWORD *)(v0 + 240) = __swift_project_value_buffer(v19, (uint64_t)qword_254D8E2A8);
  v20 = v18;
  v21 = sub_21485247C();
  v22 = sub_2148528D8();
  v23 = os_log_type_enabled(v21, v22);
  v24 = *(void **)(v0 + 104);
  if (v23)
  {
    v25 = swift_slowAlloc();
    v26 = swift_slowAlloc();
    *(_QWORD *)(v0 + 88) = v26;
    *(_DWORD *)v25 = 136315394;
    v27 = objc_msgSend(v24, sel_networkName);
    if (v27)
    {
      v28 = v27;
      v29 = sub_2148526C8();
      v31 = v30;

    }
    else
    {
      v31 = 0xE300000000000000;
      v29 = 7104878;
    }
    v32 = *(void **)(v0 + 104);
    *(_QWORD *)(v25 + 4) = sub_2147F3D14(v29, v31, (uint64_t *)(v0 + 88));
    swift_bridgeObjectRelease();

    *(_WORD *)(v25 + 12) = 2048;
    *(_QWORD *)(v25 + 14) = 1;
    _os_log_impl(&dword_2147EE000, v21, v22, "WiFiSetup join start: ssid=%s, try=%ld", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v26, -1, -1);
    MEMORY[0x2199D75E8](v25, -1, -1);
  }
  else
  {

  }
  v33 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 248) = v33;
  *v33 = v0;
  v33[1] = sub_21480DE34;
  return sub_2148113C4(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 208));
}

uint64_t sub_21480DE34()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 256) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21480DE94()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  void *v34;
  uint64_t v35;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 200);
  v2 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 144);
  v4 = *(_QWORD *)(v0 + 152);
  v5 = *(_QWORD *)(v0 + 136);
  v6 = *(_QWORD *)(v0 + 120);
  v7 = *(_QWORD *)(v0 + 96);
  v34 = *(void **)(v0 + 104);
  v35 = *(_QWORD *)(v0 + 192);
  SKEnvironmentValues.clock.getter();
  sub_214852404();
  v1(v5, v6);
  sub_214852410();
  v8 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v8(v2, v3);
  *(double *)(v7 + 176) = Duration.seconds.getter();
  *(_BYTE *)(v7 + 184) = 0;
  v9 = v34;
  v10 = sub_21485247C();
  v11 = sub_2148528D8();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = *(void **)(v0 + 104);
    v13 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    v35 = v14;
    *(_DWORD *)v13 = 136315650;
    v15 = objc_msgSend(v12, sel_networkName);
    v33 = v8;
    if (v15)
    {
      v16 = v15;
      v17 = sub_2148526C8();
      v19 = v18;

    }
    else
    {
      v19 = 0xE300000000000000;
      v17 = 7104878;
    }
    v24 = *(_QWORD *)(v0 + 232);
    v29 = *(void **)(v0 + 208);
    v30 = *(id *)(v0 + 224);
    v31 = *(_QWORD *)(v0 + 144);
    v32 = *(_QWORD *)(v0 + 168);
    v25 = *(void **)(v0 + 104);
    *(_QWORD *)(v0 + 64) = sub_2147F3D14(v17, v19, &v35);
    sub_21485292C();
    swift_bridgeObjectRelease();

    *(_WORD *)(v13 + 12) = 2080;
    v26 = sub_21485286C();
    *(_QWORD *)(v0 + 72) = sub_2147F3D14(v26, v27, &v35);
    sub_21485292C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 22) = 2048;
    *(_QWORD *)(v0 + 80) = v24;
    sub_21485292C();
    _os_log_impl(&dword_2147EE000, v10, v11, "WiFiSetup join success: ssid=%s, time=%s, try=%ld", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v14, -1, -1);
    MEMORY[0x2199D75E8](v13, -1, -1);

    v33(v32, v31);
  }
  else
  {
    v20 = *(void **)(v0 + 224);
    v21 = *(_QWORD *)(v0 + 168);
    v22 = *(_QWORD *)(v0 + 144);
    v23 = *(void **)(v0 + 104);

    v8(v21, v22);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21480E1BC()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v42;
  uint64_t v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  _BOOL4 v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  void *v56;
  _QWORD *v57;
  uint64_t *v58;
  uint64_t v59;
  os_log_type_t v60;
  char v61[9];

  v1 = *(void **)(v0 + 256);
  v2 = *(id *)(v0 + 104);
  v3 = v1;
  v4 = v2;
  v5 = v1;
  v6 = sub_21485247C();
  v7 = sub_2148528CC();
  if (os_log_type_enabled(v6, v7))
  {
    v60 = v7;
    v58 = (uint64_t *)(v0 + 40);
    v8 = *(void **)(v0 + 104);
    v9 = swift_slowAlloc();
    v59 = swift_slowAlloc();
    *(_QWORD *)(v0 + 40) = v59;
    *(_DWORD *)v9 = 136315650;
    v10 = objc_msgSend(v8, sel_networkName);
    if (v10)
    {
      v11 = v10;
      sub_2148526C8();

      v12 = sub_214816CE0(3);
      v14 = v13;
      v16 = v15;
      v18 = v17;
      swift_bridgeObjectRelease();
    }
    else
    {
      v12 = MEMORY[0x2199D69AC](7104878, 0xE300000000000000);
      v14 = v21;
      v16 = v22;
      v18 = v23;
    }
    v24 = *(void **)(v0 + 256);
    v25 = *(_QWORD *)(v0 + 232);
    v26 = *(void **)(v0 + 104);
    v27 = MEMORY[0x2199D676C](v12, v14, v16, v18);
    v29 = v28;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v9 + 4) = sub_2147F3D14(v27, v29, v58);
    swift_bridgeObjectRelease();

    *(_WORD *)(v9 + 12) = 2048;
    *(_QWORD *)(v9 + 14) = v25;
    *(_WORD *)(v9 + 22) = 2080;
    swift_getErrorValue();
    v30 = sub_214852B6C();
    *(_QWORD *)(v9 + 24) = sub_2147F3D14(v30, v31, v58);
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2147EE000, v6, v60, "### WiFiSetup join failed: ssid=%s..., try=%ld, error=%s", (uint8_t *)v9, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v59, -1, -1);
    MEMORY[0x2199D75E8](v9, -1, -1);
  }
  else
  {
    v19 = *(void **)(v0 + 256);
    v20 = *(void **)(v0 + 104);

  }
  v32 = *(void **)(v0 + 256);
  if (*(_QWORD *)(v0 + 224))
  {

    v32 = *(void **)(v0 + 224);
  }
  v33 = *(_QWORD *)(v0 + 232);
  if (v33 == *(_QWORD *)(v0 + 216))
  {
    v34 = *(void **)(v0 + 208);
    v35 = v32;
    swift_willThrow();

LABEL_15:
    v38 = *(_QWORD *)(v0 + 168);
    v39 = *(_QWORD *)(v0 + 144);
    v40 = *(_QWORD *)(v0 + 152);

    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v38, v39);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v36 = v33 + 1;
  if (__OFADD__(v33, 1))
  {
    __break(1u);
LABEL_25:
    swift_once();
    goto LABEL_17;
  }
  *(_QWORD *)(v0 + 224) = v32;
  *(_QWORD *)(v0 + 232) = v36;
  if (*(_BYTE *)(*(_QWORD *)(v0 + 112) + 16) == 1)
  {
    v37 = *(void **)(v0 + 208);
    type metadata accessor for SKError();
    v61[0] = 6;
    SKError.__allocating_init(_:_:_:)((uint64_t)v61, 0x64656C65636E6143, 0xE800000000000000, 0);
    swift_willThrow();

    goto LABEL_15;
  }
  sub_214852860();
  if (qword_254D8E2A0 != -1)
    goto LABEL_25;
LABEL_17:
  v42 = *(void **)(v0 + 104);
  v43 = sub_214852494();
  *(_QWORD *)(v0 + 240) = __swift_project_value_buffer(v43, (uint64_t)qword_254D8E2A8);
  v44 = v42;
  v45 = sub_21485247C();
  v46 = sub_2148528D8();
  v47 = os_log_type_enabled(v45, v46);
  v48 = *(void **)(v0 + 104);
  if (v47)
  {
    v49 = swift_slowAlloc();
    v50 = swift_slowAlloc();
    *(_QWORD *)(v0 + 88) = v50;
    *(_DWORD *)v49 = 136315394;
    v51 = objc_msgSend(v48, sel_networkName);
    if (v51)
    {
      v52 = v51;
      v53 = sub_2148526C8();
      v55 = v54;

    }
    else
    {
      v53 = 7104878;
      v55 = 0xE300000000000000;
    }
    v56 = *(void **)(v0 + 104);
    *(_QWORD *)(v49 + 4) = sub_2147F3D14(v53, v55, (uint64_t *)(v0 + 88));
    swift_bridgeObjectRelease();

    *(_WORD *)(v49 + 12) = 2048;
    *(_QWORD *)(v49 + 14) = v36;
    _os_log_impl(&dword_2147EE000, v45, v46, "WiFiSetup join start: ssid=%s, try=%ld", (uint8_t *)v49, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v50, -1, -1);
    MEMORY[0x2199D75E8](v49, -1, -1);
  }
  else
  {

  }
  v57 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 248) = v57;
  *v57 = v0;
  v57[1] = sub_21480DE34;
  return sub_2148113C4(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 208));
}

uint64_t SKEnvironmentValues.wifiScanRetries.getter()
{
  return sub_214813EE0((uint64_t)&type metadata for WiFiScanRetriesSKEnvironmentKey, (uint64_t)&off_254D88EE8);
}

uint64_t sub_21480E740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v7 + 200) = a6;
  *(_QWORD *)(v7 + 208) = v6;
  *(_BYTE *)(v7 + 344) = a5;
  *(_QWORD *)(v7 + 184) = a3;
  *(_QWORD *)(v7 + 192) = a4;
  *(_QWORD *)(v7 + 168) = a1;
  *(_QWORD *)(v7 + 176) = a2;
  v8 = sub_214852428();
  *(_QWORD *)(v7 + 216) = v8;
  *(_QWORD *)(v7 + 224) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 232) = swift_task_alloc();
  v9 = sub_21485241C();
  *(_QWORD *)(v7 + 240) = v9;
  *(_QWORD *)(v7 + 248) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v7 + 256) = swift_task_alloc();
  *(_QWORD *)(v7 + 264) = swift_task_alloc();
  sub_2147F4354(&qword_254D88D30, v10, (uint64_t (*)(uint64_t))type metadata accessor for SKStepWiFiSetupServer, (uint64_t)&protocol conformance descriptor for SKStepWiFiSetupServer);
  *(_QWORD *)(v7 + 272) = sub_2148527C4();
  *(_QWORD *)(v7 + 280) = v11;
  return swift_task_switch();
}

uint64_t sub_21480E84C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  _QWORD *v33;
  char v35;
  uint64_t v36;
  uint64_t v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  if (qword_254D8E2A0 != -1)
    swift_once();
  v1 = sub_214852494();
  *(_QWORD *)(v0 + 288) = __swift_project_value_buffer(v1, (uint64_t)qword_254D8E2A8);
  swift_bridgeObjectRetain_n();
  v2 = sub_21485247C();
  v3 = sub_2148528D8();
  if (os_log_type_enabled(v2, v3))
  {
    v35 = *(_BYTE *)(v0 + 344);
    v4 = swift_slowAlloc();
    v36 = swift_slowAlloc();
    v37[0] = v36;
    *(_DWORD *)v4 = 136315650;
    swift_bridgeObjectRetain();
    v5 = sub_214816CE0(3);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    swift_bridgeObjectRelease();
    v12 = MEMORY[0x2199D676C](v5, v7, v9, v11);
    v14 = v13;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 136) = sub_2147F3D14(v12, v14, v37);
    sub_21485292C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v4 + 12) = 2080;
    if ((v35 & 1) != 0)
    {
      v17 = 0xE300000000000000;
      v15 = 7104878;
    }
    else
    {
      *(_QWORD *)(v0 + 160) = *(_QWORD *)(v0 + 192);
      sub_2147F7A34();
      v15 = sub_214852944();
      v17 = v16;
    }
    v18 = *(_QWORD *)(v0 + 200);
    *(_QWORD *)(v0 + 144) = sub_2147F3D14(v15, v17, v37);
    sub_21485292C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 22) = 2048;
    *(_QWORD *)(v0 + 152) = v18;
    sub_21485292C();
    _os_log_impl(&dword_2147EE000, v2, v3, "WiFiSetup scan start: ssid=%s..., channel=%s, try=%ld", (uint8_t *)v4, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v36, -1, -1);
    MEMORY[0x2199D75E8](v4, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v19 = *(_BYTE *)(v0 + 344);
  v20 = *(_QWORD *)(v0 + 192);
  v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE29F28]), sel_init);
  *(_QWORD *)(v0 + 296) = v21;
  if ((v19 & 1) == 0 && v20 >= 1)
  {
    v22 = objc_msgSend((id)objc_opt_self(), sel_channelWithNumber_band_width_, *(_QWORD *)(v0 + 192), 2, 20);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F20);
    v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_2148588A0;
    *(_QWORD *)(v23 + 32) = v22;
    v37[0] = v23;
    sub_2148527AC();
    sub_2147F4394(0, &qword_254D88F28);
    v24 = v22;
    v25 = (void *)sub_214852794();
    swift_bridgeObjectRelease();
    objc_msgSend(v21, sel_setChannels_, v25);

  }
  v27 = *(_QWORD *)(v0 + 224);
  v26 = *(_QWORD *)(v0 + 232);
  v29 = *(_QWORD *)(v0 + 208);
  v28 = *(_QWORD *)(v0 + 216);
  v30 = (void *)sub_2148526A4();
  objc_msgSend(v21, sel_setSSID_, v30);

  v31 = *(_QWORD *)(v29 + 24);
  *(_QWORD *)(v0 + 304) = v31;
  v37[0] = v31;
  SKEnvironmentValues.clock.getter();
  sub_214852404();
  v32 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
  *(_QWORD *)(v0 + 312) = v32;
  v32(v26, v28);
  v33 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 320) = v33;
  *v33 = v0;
  v33[1] = sub_21480ECC4;
  return sub_21480F9FC(*(_QWORD *)(v0 + 168), (uint64_t)v21);
}

uint64_t sub_21480ECC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 328) = a1;
  *(_QWORD *)(v3 + 336) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21480ED78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  id v6;
  void *v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  os_log_type_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  os_log_type_t v66;
  void (*v67)(uint64_t, uint64_t);
  uint64_t v68[2];

  v68[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(v0 + 328);
  if (v1 < 0 || (v1 & 0x4000000000000000) != 0)
  {
    v33 = swift_bridgeObjectRetain();
    v2 = (uint64_t)sub_2148143B4(v33);
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  v3 = *(_QWORD *)(v0 + 336);
  v68[0] = v2;
  sub_21481433C(v68);
  if (v3)
    return swift_release();
  swift_bridgeObjectRelease();
  v5 = v68[0];
  if (v68[0] < 0 || (v68[0] & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v34 = sub_2148529F8();
    swift_release();
    if (v34)
      goto LABEL_9;
LABEL_24:
    swift_release();
    type metadata accessor for SKError();
    LOBYTE(v68[0]) = 2;
    v35 = SKError.__allocating_init(_:_:_:)((uint64_t)v68, 0xD000000000000011, 0x800000021485E320, 0);
    swift_willThrow();
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 248) + 8))(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 240));
    swift_bridgeObjectRetain();
    v36 = v35;
    swift_bridgeObjectRetain();
    v37 = v35;
    v38 = sub_21485247C();
    v39 = sub_2148528CC();
    if (os_log_type_enabled(v38, v39))
    {
      v66 = v39;
      v61 = *(_BYTE *)(v0 + 344);
      v40 = swift_slowAlloc();
      v64 = swift_slowAlloc();
      v68[0] = v64;
      *(_DWORD *)v40 = 136315906;
      swift_bridgeObjectRetain();
      v41 = sub_214816CE0(3);
      v43 = v42;
      v45 = v44;
      v47 = v46;
      swift_bridgeObjectRelease();
      v48 = MEMORY[0x2199D676C](v41, v43, v45, v47);
      v50 = v49;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 64) = sub_2147F3D14(v48, v50, v68);
      sub_21485292C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v40 + 12) = 2080;
      if ((v61 & 1) != 0)
      {
        v51 = 7104878;
        v53 = 0xE300000000000000;
      }
      else
      {
        *(_QWORD *)(v0 + 80) = *(_QWORD *)(v0 + 192);
        sub_2147F7A34();
        v51 = sub_214852944();
        v53 = v52;
      }
      v54 = *(_QWORD *)(v0 + 200);
      *(_QWORD *)(v0 + 40) = sub_2147F3D14(v51, v53, v68);
      sub_21485292C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v40 + 22) = 2048;
      *(_QWORD *)(v0 + 48) = v54;
      sub_21485292C();
      *(_WORD *)(v40 + 32) = 2080;
      swift_getErrorValue();
      v55 = sub_214852B6C();
      *(_QWORD *)(v0 + 72) = sub_2147F3D14(v55, v56, v68);
      sub_21485292C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2147EE000, v38, v66, "### WiFiSetup scan failed: ssid=%s..., channel=%s, try=%ld, error=%s", (uint8_t *)v40, 0x2Au);
      swift_arrayDestroy();
      MEMORY[0x2199D75E8](v64, -1, -1);
      MEMORY[0x2199D75E8](v40, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();

    }
    v57 = *(void **)(v0 + 296);
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  if (!*(_QWORD *)(v68[0] + 16))
    goto LABEL_24;
LABEL_9:
  if ((v5 & 0xC000000000000001) != 0)
  {
    v6 = (id)MEMORY[0x2199D6A30](0, v5);
  }
  else
  {
    if (!*(_QWORD *)(v5 + 16))
      __break(1u);
    v6 = *(id *)(v5 + 32);
  }
  v7 = v6;
  swift_release();
  v8 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
  v9 = *(_QWORD *)(v0 + 256);
  v11 = *(_QWORD *)(v0 + 240);
  v10 = *(_QWORD *)(v0 + 248);
  v12 = *(_QWORD *)(v0 + 232);
  v13 = *(_QWORD *)(v0 + 216);
  v68[0] = *(_QWORD *)(v0 + 304);
  SKEnvironmentValues.clock.getter();
  sub_214852404();
  v8(v12, v13);
  sub_214852410();
  v14 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  v14(v9, v11);
  Duration.seconds.getter();
  v15 = v7;
  v16 = sub_21485247C();
  v17 = sub_2148528D8();
  if (os_log_type_enabled(v16, v17))
  {
    v62 = v17;
    v67 = v14;
    v18 = swift_slowAlloc();
    v63 = (_QWORD *)swift_slowAlloc();
    v65 = swift_slowAlloc();
    v68[0] = v65;
    *(_DWORD *)v18 = 136316162;
    v19 = objc_msgSend(v15, sel_networkName);
    if (v19)
    {
      v20 = v19;
      v21 = sub_2148526C8();
      v23 = v22;

    }
    else
    {
      v21 = 7104878;
      v23 = 0xE300000000000000;
    }
    *(_QWORD *)(v0 + 88) = sub_2147F3D14(v21, v23, v68);
    sub_21485292C();
    swift_bridgeObjectRelease();

    *(_WORD *)(v18 + 12) = 2112;
    v27 = objc_msgSend(v15, sel_channel);
    v28 = v27;
    if (v27)
      *(_QWORD *)(v0 + 128) = v27;
    else
      *(_QWORD *)(v0 + 96) = 0;
    sub_21485292C();
    v60 = *(_QWORD *)(v0 + 264);
    v58 = *(void **)(v0 + 296);
    v59 = *(_QWORD *)(v0 + 240);
    v29 = *(_QWORD *)(v0 + 200);
    *v63 = v28;

    *(_WORD *)(v18 + 22) = 2048;
    v30 = objc_msgSend(v15, sel_RSSI);

    *(_QWORD *)(v0 + 104) = v30;
    sub_21485292C();

    *(_WORD *)(v18 + 32) = 2080;
    v31 = sub_21485286C();
    *(_QWORD *)(v0 + 112) = sub_2147F3D14(v31, v32, v68);
    sub_21485292C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 42) = 2048;
    *(_QWORD *)(v0 + 120) = v29;
    sub_21485292C();
    _os_log_impl(&dword_2147EE000, v16, v62, "WiFiSetup scan found: ssid=%s, channel=%@, rssi=%ld, time=%s, try=%ld", (uint8_t *)v18, 0x34u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F18);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v63, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v65, -1, -1);
    MEMORY[0x2199D75E8](v18, -1, -1);

    v67(v60, v59);
  }
  else
  {
    v24 = *(void **)(v0 + 296);
    v25 = *(_QWORD *)(v0 + 264);
    v26 = *(_QWORD *)(v0 + 240);

    v14(v25, v26);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v15);
}

uint64_t sub_21480F664()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  char v25;
  uint64_t v26;
  os_log_type_t v27;
  uint64_t v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(v0 + 336);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 248) + 8))(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 240));
  swift_bridgeObjectRetain();
  v2 = v1;
  swift_bridgeObjectRetain();
  v3 = v1;
  v4 = sub_21485247C();
  v5 = sub_2148528CC();
  if (os_log_type_enabled(v4, v5))
  {
    v27 = v5;
    v25 = *(_BYTE *)(v0 + 344);
    v6 = swift_slowAlloc();
    v26 = swift_slowAlloc();
    v28[0] = v26;
    *(_DWORD *)v6 = 136315906;
    swift_bridgeObjectRetain();
    v7 = sub_214816CE0(3);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    swift_bridgeObjectRelease();
    v14 = MEMORY[0x2199D676C](v7, v9, v11, v13);
    v16 = v15;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 64) = sub_2147F3D14(v14, v16, v28);
    sub_21485292C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v6 + 12) = 2080;
    if ((v25 & 1) != 0)
    {
      v19 = 0xE300000000000000;
      v17 = 7104878;
    }
    else
    {
      *(_QWORD *)(v0 + 80) = *(_QWORD *)(v0 + 192);
      sub_2147F7A34();
      v17 = sub_214852944();
      v19 = v18;
    }
    v20 = *(_QWORD *)(v0 + 200);
    *(_QWORD *)(v0 + 40) = sub_2147F3D14(v17, v19, v28);
    sub_21485292C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 22) = 2048;
    *(_QWORD *)(v0 + 48) = v20;
    sub_21485292C();
    *(_WORD *)(v6 + 32) = 2080;
    swift_getErrorValue();
    v21 = sub_214852B6C();
    *(_QWORD *)(v0 + 72) = sub_2147F3D14(v21, v22, v28);
    sub_21485292C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2147EE000, v4, v27, "### WiFiSetup scan failed: ssid=%s..., channel=%s, try=%ld, error=%s", (uint8_t *)v6, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v26, -1, -1);
    MEMORY[0x2199D75E8](v6, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();

  }
  v23 = *(void **)(v0 + 296);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21480F9FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3[33] = a2;
  v3[34] = v2;
  v3[32] = a1;
  v4 = sub_21485241C();
  v3[35] = v4;
  v3[36] = *(_QWORD *)(v4 - 8);
  v3[37] = swift_task_alloc();
  v3[38] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F50);
  v3[39] = v5;
  v3[40] = *(_QWORD *)(v5 - 8);
  v3[41] = swift_task_alloc();
  v6 = sub_214852428();
  v3[42] = v6;
  v3[43] = *(_QWORD *)(v6 - 8);
  v3[44] = swift_task_alloc();
  v3[45] = swift_task_alloc();
  sub_2147F4354(&qword_254D88D30, v7, (uint64_t (*)(uint64_t))type metadata accessor for SKStepWiFiSetupServer, (uint64_t)&protocol conformance descriptor for SKStepWiFiSetupServer);
  v3[46] = sub_2148527C4();
  v3[47] = v8;
  return swift_task_switch();
}

uint64_t sub_21480FB10()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t inited;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *boxed_opaque_existential_0;
  id v22;
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  uint64_t (*v30)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  v1 = *(_QWORD *)(v0 + 256);
  v2 = *(void **)(v1 + 88);
  if (v2)
  {
    v2;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else if ((*(_BYTE *)(v1 + 104) & 1) != 0)
  {
    v4 = *(_QWORD *)(v0 + 272);
    *(_OWORD *)(v0 + 400) = xmmword_2148577A0;
    v5 = *(void **)(v4 + 48);
    if (v5)
    {
      v6 = *(id *)(v4 + 48);
    }
    else
    {
      v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE29F18]), sel_init);
      v16 = *(void **)(v4 + 48);
      *(_QWORD *)(v4 + 48) = v15;
      v6 = v15;

      objc_msgSend(v6, sel_activate);
    }
    *(_QWORD *)(v0 + 416) = v6;
    v18 = *(_QWORD *)(v0 + 320);
    v17 = *(_QWORD *)(v0 + 328);
    v19 = *(_QWORD *)(v0 + 312);
    v20 = *(_QWORD *)(v0 + 264);
    *(_QWORD *)(v0 + 56) = v0 + 248;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_21481017C;
    swift_continuation_init();
    *(_QWORD *)(v0 + 136) = v19;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 112));
    v22 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F38);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D88210);
    sub_2148527D0();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v18 + 32))(boxed_opaque_existential_0, v17, v19);
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    v23 = (_QWORD *)(v0 + 80);
    v23[1] = 1107296256;
    v23[2] = sub_21481130C;
    v23[3] = &block_descriptor_22;
    objc_msgSend(v6, sel_performScanWithParameters_reply_, v20, v23);
    return swift_continuation_await();
  }
  else if (*(double *)(v1 + 96) <= 0.0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F58);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_214857F80;
    *(_QWORD *)(inited + 32) = 1145656147;
    *(_QWORD *)(inited + 40) = 0xE400000000000000;
    v12 = *(_QWORD *)(v1 + 168);
    if (v12)
    {
      v13 = *(_QWORD *)(*(_QWORD *)(v0 + 256) + 160);
      v14 = v12;
    }
    else
    {
      v14 = 0xE800000000000000;
      v13 = 0x444953536B636F4DLL;
    }
    swift_bridgeObjectRetain();
    *(_QWORD *)(inited + 48) = sub_214810930(v13, v14);
    *(_QWORD *)(inited + 56) = v24;
    v25 = sub_214810E2C(inited);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F20);
    v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_2148588A0;
    sub_214810F50(v25);
    swift_bridgeObjectRelease();
    v27 = objc_allocWithZone(MEMORY[0x24BE29F30]);
    v28 = (void *)sub_21485265C();
    swift_bridgeObjectRelease();
    v29 = objc_msgSend(v27, sel_initWithScanRecord_includeProperties_, v28, 0);

    *(_QWORD *)(v26 + 32) = v29;
    sub_2148527AC();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v26);
  }
  else
  {
    SKEnvironmentValues.clock.getter();
    v7 = sub_214852BCC();
    v9 = v8;
    v30 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_254D88AB0 + dword_254D88AB0);
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 384) = v10;
    *v10 = v0;
    v10[1] = sub_21480FF64;
    return v30(v7, v9, 0, 0, 1);
  }
}

uint64_t sub_21480FF64()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 392) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2[43] + 8))(v2[45], v2[42]);
  return swift_task_switch();
}

uint64_t sub_21480FFD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t inited;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  v1 = *(_QWORD *)(v0 + 256);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F58);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_214857F80;
  *(_QWORD *)(inited + 32) = 1145656147;
  *(_QWORD *)(inited + 40) = 0xE400000000000000;
  v3 = *(_QWORD *)(v1 + 168);
  if (v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(v0 + 256) + 160);
    v5 = v3;
  }
  else
  {
    v5 = 0xE800000000000000;
    v4 = 0x444953536B636F4DLL;
  }
  swift_bridgeObjectRetain();
  *(_QWORD *)(inited + 48) = sub_214810930(v4, v5);
  *(_QWORD *)(inited + 56) = v6;
  v7 = sub_214810E2C(inited);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F20);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_2148588A0;
  sub_214810F50(v7);
  swift_bridgeObjectRelease();
  v9 = objc_allocWithZone(MEMORY[0x24BE29F30]);
  v10 = (void *)sub_21485265C();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v9, sel_initWithScanRecord_includeProperties_, v10, 0);

  *(_QWORD *)(v8 + 32) = v11;
  sub_2148527AC();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v8);
}

uint64_t sub_21481017C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 424) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2148101D8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 416);

  v2 = *(_QWORD *)(v0 + 248);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_21481025C()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2148102C8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;

  v1 = *(void **)(v0 + 416);
  swift_willThrow();

  v2 = (void *)sub_214852314();
  v3 = objc_msgSend(v2, sel_code);

  if (v3 == (id)16)
  {
    if (qword_254D8E2A0 != -1)
      swift_once();
    v4 = sub_214852494();
    __swift_project_value_buffer(v4, (uint64_t)qword_254D8E2A8);
    v5 = sub_21485247C();
    v6 = sub_2148528CC();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = *(_QWORD *)(v0 + 408);
      v8 = swift_slowAlloc();
      *(_DWORD *)v8 = 134217984;
      *(_QWORD *)(v8 + 4) = v7;
      _os_log_impl(&dword_2147EE000, v5, v6, "### WiFiSetup scan failed: busy, try=%ld/10", (uint8_t *)v8, 0xCu);
      MEMORY[0x2199D75E8](v8, -1, -1);
    }

    SKEnvironmentValues.clock.getter();
    *(_OWORD *)(v0 + 232) = xmmword_2148588B0;
    *(_QWORD *)(v0 + 208) = 0;
    *(_QWORD *)(v0 + 216) = 0;
    *(_BYTE *)(v0 + 224) = 1;
    return swift_task_switch();
  }
  else
  {
    v10 = *(void **)(v0 + 400);
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_214810498()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  _QWORD *v5;

  v1 = v0[37];
  v2 = v0[35];
  v3 = v0[36];
  sub_2147F4354(&qword_254D88C08, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE29D60], MEMORY[0x24BE29D88]);
  sub_214852B54();
  sub_2147F4354(&qword_254D88C10, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE29D38], MEMORY[0x24BE29D58]);
  sub_2148529C8();
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[54] = v4;
  v4(v1, v2);
  v5 = (_QWORD *)swift_task_alloc();
  v0[55] = v5;
  *v5 = v0;
  v5[1] = sub_2148105B0;
  return sub_214852B60();
}

uint64_t sub_2148105B0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *v1;
  *(_QWORD *)(*v1 + 448) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 432))(*(_QWORD *)(v2 + 304), *(_QWORD *)(v2 + 280));
  }
  else
  {
    v4 = *(_QWORD *)(v2 + 344);
    v3 = *(_QWORD *)(v2 + 352);
    v5 = *(_QWORD *)(v2 + 336);
    (*(void (**)(_QWORD, _QWORD))(v2 + 432))(*(_QWORD *)(v2 + 304), *(_QWORD *)(v2 + 280));
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  return swift_task_switch();
}

uint64_t sub_214810658()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *boxed_opaque_existential_0;
  id v14;
  _QWORD *v15;

  v1 = *(void **)(v0 + 424);
  if (*(_QWORD *)(v0 + 400))
  {

    v1 = *(void **)(v0 + 400);
  }
  v2 = *(_QWORD *)(v0 + 408);
  if (v2 == 10)
  {
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_QWORD *)(v0 + 400) = v1;
    *(_QWORD *)(v0 + 408) = v2 + 1;
    v4 = *(_QWORD *)(v0 + 272);
    v5 = *(void **)(v4 + 48);
    if (v5)
    {
      v6 = *(id *)(v4 + 48);
    }
    else
    {
      v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE29F18]), sel_init);
      v8 = *(void **)(v4 + 48);
      *(_QWORD *)(v4 + 48) = v7;
      v6 = v7;

      objc_msgSend(v6, sel_activate);
    }
    *(_QWORD *)(v0 + 416) = v6;
    v10 = *(_QWORD *)(v0 + 320);
    v9 = *(_QWORD *)(v0 + 328);
    v11 = *(_QWORD *)(v0 + 312);
    v12 = *(_QWORD *)(v0 + 264);
    *(_QWORD *)(v0 + 56) = v0 + 248;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_21481017C;
    swift_continuation_init();
    *(_QWORD *)(v0 + 136) = v11;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 112));
    v14 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F38);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D88210);
    sub_2148527D0();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v10 + 32))(boxed_opaque_existential_0, v9, v11);
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    v15 = (_QWORD *)(v0 + 80);
    v15[1] = 1107296256;
    v15[2] = sub_21481130C;
    v15[3] = &block_descriptor_22;
    objc_msgSend(v6, sel_performScanWithParameters_reply_, v12, v15);
    return swift_continuation_await();
  }
}

uint64_t sub_214810870()
{
  _QWORD *v0;

  (*(void (**)(_QWORD, _QWORD))(v0[43] + 8))(v0[44], v0[42]);
  return swift_task_switch();
}

uint64_t sub_2148108B0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 424);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_214810930(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  _BYTE *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v14[2];
  uint64_t v15;
  __int128 v16;
  _QWORD v17[7];

  v17[5] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v16 = a1;
  *((_QWORD *)&v16 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F68);
  if (!swift_dynamicCast())
  {
    v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_214817684((uint64_t)v14);
    if ((a2 & 0x1000000000000000) != 0)
      goto LABEL_20;
    if ((a2 & 0x2000000000000000) != 0)
    {
      v17[0] = a1;
      v17[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      v4 = (char *)v17 + (HIBYTE(a2) & 0xF);
      v5 = v17;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        v2 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v3 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v2 = sub_2148529B0();
      }
      if (v2)
        v4 = (_BYTE *)(v2 + v3);
      else
        v4 = 0;
      v5 = (_BYTE *)v2;
    }
    v6 = sub_214816F20(v5, v4);
    v8 = v7;
    if (v7 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(_QWORD *)&v14[0] = v6;
      *((_QWORD *)&v14[0] + 1) = v8;
      return *(_QWORD *)&v14[0];
    }
    if ((a2 & 0x1000000000000000) != 0)
    {
LABEL_20:
      v9 = sub_21485271C();
    }
    else if ((a2 & 0x2000000000000000) != 0)
    {
      v9 = HIBYTE(a2) & 0xF;
    }
    else
    {
      v9 = a1 & 0xFFFFFFFFFFFFLL;
    }
    *(_QWORD *)&v14[0] = sub_214816F84(v9);
    *((_QWORD *)&v14[0] + 1) = v10;
    MEMORY[0x24BDAC7A8](*(_QWORD *)&v14[0]);
    sub_2148151D8();
    __asm { BR              X12 }
  }
  sub_214817734(v14, (uint64_t)v17);
  __swift_project_boxed_opaque_existential_0(v17, v17[3]);
  sub_214852308();
  swift_bridgeObjectRelease();
  v14[0] = v16;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
  return *(_QWORD *)&v14[0];
}

unint64_t sub_214810E2C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F60);
  v2 = (_QWORD *)sub_214852A1C();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (unint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v7 = *(v4 - 1);
    v8 = *v4;
    swift_bridgeObjectRetain();
    sub_2147F51E4(v7, v8);
    result = sub_214803EE8(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (uint64_t *)(v2[7] + 16 * result);
    *v12 = v7;
    v12[1] = v8;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_214810F50(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  _OWORD v39[2];
  _OWORD v40[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D88C30);
    v2 = sub_214852A1C();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v31 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v30 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v30)
      goto LABEL_37;
    v14 = *(_QWORD *)(v31 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v30)
        goto LABEL_37;
      v14 = *(_QWORD *)(v31 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v30)
          goto LABEL_37;
        v14 = *(_QWORD *)(v31 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v30)
            goto LABEL_37;
          v14 = *(_QWORD *)(v31 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = 16 * v12;
    v18 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v19 = v18[1];
    v20 = (uint64_t *)(*(_QWORD *)(a1 + 56) + v17);
    v21 = *v20;
    v22 = v20[1];
    *(_QWORD *)&v40[0] = *v18;
    *((_QWORD *)&v40[0] + 1) = v19;
    swift_bridgeObjectRetain();
    sub_2147F51E4(v21, v22);
    swift_dynamicCast();
    swift_dynamicCast();
    v36 = v32;
    v37 = v33;
    v38 = v34;
    sub_2147F272C(&v35, v39);
    v32 = v36;
    v33 = v37;
    v34 = v38;
    sub_2147F272C(v39, v40);
    sub_2147F272C(v40, &v36);
    result = sub_214852968();
    v23 = -1 << *(_BYTE *)(v2 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v6 + 8 * (v24 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v6 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v6 + 8 * v25);
      }
      while (v29 == -1);
      v9 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v32;
    *(_OWORD *)(v10 + 16) = v33;
    *(_QWORD *)(v10 + 32) = v34;
    result = (uint64_t)sub_2147F272C(&v36, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v30)
  {
LABEL_37:
    swift_release();
    sub_21480A4F8();
    return v2;
  }
  v14 = *(_QWORD *)(v31 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v30)
      goto LABEL_37;
    v14 = *(_QWORD *)(v31 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_21481130C(uint64_t a1, void *a2)
{
  id v3;

  __swift_project_boxed_opaque_existential_0((_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  if (a2)
  {
    v3 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F50);
    sub_2148527DC();

  }
  else
  {
    sub_2147F4394(0, &qword_254D88F30);
    sub_2148527A0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F50);
    sub_2148527E8();
  }
}

uint64_t sub_2148113C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[19] = a2;
  v3[20] = v2;
  v3[18] = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88958);
  v3[21] = v4;
  v3[22] = *(_QWORD *)(v4 - 8);
  v3[23] = swift_task_alloc();
  v5 = sub_214852428();
  v3[24] = v5;
  v3[25] = *(_QWORD *)(v5 - 8);
  v3[26] = swift_task_alloc();
  sub_2147F4354(&qword_254D88D30, v6, (uint64_t (*)(uint64_t))type metadata accessor for SKStepWiFiSetupServer, (uint64_t)&protocol conformance descriptor for SKStepWiFiSetupServer);
  v3[27] = sub_2148527C4();
  v3[28] = v7;
  return swift_task_switch();
}

uint64_t sub_214811488()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t (*v3)(void);
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *boxed_opaque_existential_0;
  id v19;
  _QWORD *v20;
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  v1 = v0[18];
  v2 = *(void **)(v1 + 16);
  if (v2)
  {
    v2;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    v3 = (uint64_t (*)(void))v0[1];
    return v3();
  }
  if ((*(_BYTE *)(v1 + 32) & 1) != 0)
  {
    v5 = v0[20];
    v6 = *(void **)(v5 + 48);
    if (v6)
    {
      v7 = *(id *)(v5 + 48);
    }
    else
    {
      v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE29F18]), sel_init);
      v13 = *(void **)(v5 + 48);
      *(_QWORD *)(v5 + 48) = v12;
      v7 = v12;

      objc_msgSend(v7, sel_activate);
    }
    v0[31] = v7;
    v15 = v0[22];
    v14 = v0[23];
    v16 = v0[21];
    v17 = v0[19];
    v0[2] = v0;
    v0[3] = sub_2148117BC;
    swift_continuation_init();
    v0[17] = v16;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v0 + 14);
    v19 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D88210);
    sub_2148527D0();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v15 + 32))(boxed_opaque_existential_0, v14, v16);
    v0[10] = MEMORY[0x24BDAC760];
    v20 = v0 + 10;
    v20[1] = 1107296256;
    v20[2] = sub_2148118F4;
    v20[3] = &block_descriptor_1;
    objc_msgSend(v7, sel_associateWithParameters_reply_, v17, v20);
    return swift_continuation_await();
  }
  else
  {
    if (*(double *)(v1 + 24) <= 0.0)
    {
      swift_task_dealloc();
      swift_task_dealloc();
      v3 = (uint64_t (*)(void))v0[1];
      return v3();
    }
    SKEnvironmentValues.clock.getter();
    v8 = sub_214852BCC();
    v10 = v9;
    v21 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_254D88AB0 + dword_254D88AB0);
    v11 = (_QWORD *)swift_task_alloc();
    v0[29] = v11;
    *v11 = v0;
    v11[1] = sub_21481172C;
    return v21(v8, v10, 0, 0, 1);
  }
}

uint64_t sub_21481172C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 240) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v2 + 200) + 8))(*(_QWORD *)(v2 + 208), *(_QWORD *)(v2 + 192));
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2148117BC()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 256) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_214811818()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_214811860()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2148118A0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 248);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_2148118F4(uint64_t a1, void *a2)
{
  id v3;

  __swift_project_boxed_opaque_existential_0((_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  if (a2)
  {
    v3 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D88958);
    sub_2148527DC();

  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D88958);
    sub_2148527E8();
  }
}

void __swiftcall SKStepWiFiSetupReport.init()(SetupKit::SKStepWiFiSetupReport *__return_ptr retstr)
{
  retstr->joinTime.value = 0.0;
  retstr->joinTime.is_nil = 1;
  retstr->rssi.value = 0;
  retstr->rssi.is_nil = 1;
  retstr->scanTime.value = 0.0;
  retstr->scanTime.is_nil = 1;
}

uint64_t sub_214811994()
{
  uint64_t *v0;

  return SKEnvironmental<>.unownedExecutor.getter(*v0, (uint64_t)&protocol witness table for SKStepWiFiSetupServer);
}

uint64_t SKStepWiFiSetupConfiguration.channel.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t SKStepWiFiSetupConfiguration.channel.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*SKStepWiFiSetupConfiguration.channel.modify())()
{
  return nullsub_1;
}

void *SKStepWiFiSetupConfiguration.mockJoinError.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  v2 = v1;
  return v1;
}

void SKStepWiFiSetupConfiguration.mockJoinError.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
}

uint64_t (*SKStepWiFiSetupConfiguration.mockJoinError.modify())()
{
  return nullsub_1;
}

uint64_t SKStepWiFiSetupConfiguration.mockJoinTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t SKStepWiFiSetupConfiguration.mockJoinTime.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = result;
  *(_BYTE *)(v2 + 32) = a2 & 1;
  return result;
}

uint64_t (*SKStepWiFiSetupConfiguration.mockJoinTime.modify())()
{
  return nullsub_1;
}

__n128 SKStepWiFiSetupConfiguration.mockReport.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  __n128 result;
  __int128 v6;

  v2 = *(_QWORD *)(v1 + 72);
  v3 = *(_BYTE *)(v1 + 80);
  v4 = *(_BYTE *)(v1 + 81);
  result = *(__n128 *)(v1 + 40);
  v6 = *(_OWORD *)(v1 + 56);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = v2;
  *(_BYTE *)(a1 + 40) = v3;
  *(_BYTE *)(a1 + 41) = v4;
  return result;
}

__n128 SKStepWiFiSetupConfiguration.mockReport.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  __n128 result;
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 40);
  v4 = *(_BYTE *)(a1 + 41);
  result = *(__n128 *)a1;
  v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 40) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 56) = v6;
  *(_QWORD *)(v1 + 72) = v2;
  *(_BYTE *)(v1 + 80) = v3;
  *(_BYTE *)(v1 + 81) = v4;
  return result;
}

uint64_t (*SKStepWiFiSetupConfiguration.mockReport.modify())()
{
  return nullsub_1;
}

void *SKStepWiFiSetupConfiguration.mockScanError.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 88);
  v2 = v1;
  return v1;
}

void SKStepWiFiSetupConfiguration.mockScanError.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 88) = a1;
}

uint64_t (*SKStepWiFiSetupConfiguration.mockScanError.modify())()
{
  return nullsub_1;
}

uint64_t SKStepWiFiSetupConfiguration.mockScanTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 96);
}

uint64_t SKStepWiFiSetupConfiguration.mockScanTime.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 96) = result;
  *(_BYTE *)(v2 + 104) = a2 & 1;
  return result;
}

uint64_t (*SKStepWiFiSetupConfiguration.mockScanTime.modify())()
{
  return nullsub_1;
}

uint64_t SKStepWiFiSetupConfiguration.joinRetries.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 112);
}

uint64_t SKStepWiFiSetupConfiguration.joinRetries.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 112) = result;
  *(_BYTE *)(v2 + 120) = a2 & 1;
  return result;
}

uint64_t (*SKStepWiFiSetupConfiguration.joinRetries.modify())()
{
  return nullsub_1;
}

uint64_t SKStepWiFiSetupConfiguration.passwordString.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 128);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SKStepWiFiSetupConfiguration.passwordString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 128) = a1;
  *(_QWORD *)(v2 + 136) = a2;
  return result;
}

uint64_t (*SKStepWiFiSetupConfiguration.passwordString.modify())()
{
  return nullsub_1;
}

uint64_t SKStepWiFiSetupConfiguration.scanRetries.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 144);
}

uint64_t SKStepWiFiSetupConfiguration.scanRetries.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 144) = result;
  *(_BYTE *)(v2 + 152) = a2 & 1;
  return result;
}

uint64_t (*SKStepWiFiSetupConfiguration.scanRetries.modify())()
{
  return nullsub_1;
}

uint64_t SKStepWiFiSetupConfiguration.ssidString.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 160);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SKStepWiFiSetupConfiguration.ssidString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 160) = a1;
  *(_QWORD *)(v2 + 168) = a2;
  return result;
}

uint64_t (*SKStepWiFiSetupConfiguration.ssidString.modify())()
{
  return nullsub_1;
}

double SKStepWiFiSetupConfiguration.init()@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
  result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 65) = 0u;
  *(_BYTE *)(a1 + 81) = 1;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_BYTE *)(a1 + 104) = 1;
  *(_QWORD *)(a1 + 112) = 0;
  *(_BYTE *)(a1 + 120) = 1;
  *(_QWORD *)(a1 + 136) = 0;
  *(_QWORD *)(a1 + 144) = 0;
  *(_QWORD *)(a1 + 128) = 0;
  *(_BYTE *)(a1 + 152) = 1;
  *(_QWORD *)(a1 + 160) = 0;
  *(_QWORD *)(a1 + 168) = 0;
  return result;
}

uint64_t SKStepWiFiSetupConfiguration.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  id v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[3];
  char v30;
  uint64_t v31;
  char v32;
  _QWORD v33[2];
  uint64_t v34;
  unint64_t v35;

  v1 = sub_2148523F8();
  v27 = *(_QWORD *)(v1 - 8);
  v28 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *v0;
  v5 = *((_BYTE *)v0 + 8);
  v24 = (id)v0[2];
  v25 = *((unsigned __int8 *)v0 + 32);
  v16 = v0[5];
  v17 = v0[6];
  v6 = v0[8];
  v18 = v0[7];
  v19 = v6;
  v21 = v0[9];
  v20 = *((unsigned __int8 *)v0 + 80);
  v26 = *((unsigned __int8 *)v0 + 81);
  v7 = (void *)v0[11];
  v23 = *((unsigned __int8 *)v0 + 104);
  v15 = v0[14];
  v22 = *((unsigned __int8 *)v0 + 120);
  v14 = v0[18];
  v8 = *((_BYTE *)v0 + 152);
  v9 = v0[20];
  v10 = v0[21];
  v34 = 0;
  v35 = 0xE000000000000000;
  sub_2148523EC();
  v29[0] = 0;
  v29[1] = 0xE000000000000000;
  sub_214852704();
  v33[0] = v9;
  v33[1] = v10;
  sub_214852B0C();
  sub_2148526D4();
  swift_bridgeObjectRelease();
  strcpy((char *)v29, "password=");
  WORD1(v29[1]) = 0;
  HIDWORD(v29[1]) = -385875968;
  sub_214852704();
  swift_bridgeObjectRelease();
  sub_2148526D4();
  swift_bridgeObjectRelease();
  strcpy((char *)v29, "channel=");
  BYTE1(v29[1]) = 0;
  WORD1(v29[1]) = 0;
  HIDWORD(v29[1]) = -402653184;
  if ((v5 & 1) == 0)
  {
    v33[0] = v4;
    sub_2147F7A34();
    sub_214852944();
  }
  sub_214852704();
  swift_bridgeObjectRelease();
  sub_2148526D4();
  swift_bridgeObjectRelease();
  if ((v8 & 1) == 0)
  {
    strcpy((char *)v29, "scanRetries=");
    BYTE5(v29[1]) = 0;
    HIWORD(v29[1]) = -5120;
    v33[0] = v14;
    sub_214852B00();
    sub_214852704();
    swift_bridgeObjectRelease();
    sub_2148526D4();
    swift_bridgeObjectRelease();
  }
  if ((v22 & 1) == 0)
  {
    strcpy((char *)v29, "joinRetries=");
    BYTE5(v29[1]) = 0;
    HIWORD(v29[1]) = -5120;
    v33[0] = v15;
    sub_214852B00();
    sub_214852704();
    swift_bridgeObjectRelease();
    sub_2148526D4();
    swift_bridgeObjectRelease();
  }
  if (v7)
  {
    v29[0] = 0;
    v29[1] = 0xE000000000000000;
    v11 = v7;
    sub_21485298C();
    swift_bridgeObjectRelease();
    strcpy((char *)v29, "mockScanError=");
    HIBYTE(v29[1]) = -18;
    v33[0] = v11;
    type metadata accessor for SKError();
    sub_2147F4354((unint64_t *)&qword_254D88A40, 255, (uint64_t (*)(uint64_t))type metadata accessor for SKError, MEMORY[0x24BDD01A8]);
    sub_214852B6C();
    sub_214852704();
    swift_bridgeObjectRelease();
    sub_2148526D4();

    swift_bridgeObjectRelease();
  }
  if ((v23 & 1) == 0)
  {
    strcpy((char *)v29, "mockScanTime=");
    HIWORD(v29[1]) = -4864;
    sub_21485286C();
    sub_214852704();
    swift_bridgeObjectRelease();
    sub_2148526D4();
    swift_bridgeObjectRelease();
  }
  if (v24)
  {
    v29[0] = 0;
    v29[1] = 0xE000000000000000;
    v12 = v24;
    sub_21485298C();
    swift_bridgeObjectRelease();
    strcpy((char *)v29, "mockJoinError=");
    HIBYTE(v29[1]) = -18;
    v33[0] = v12;
    type metadata accessor for SKError();
    sub_2147F4354((unint64_t *)&qword_254D88A40, 255, (uint64_t (*)(uint64_t))type metadata accessor for SKError, MEMORY[0x24BDD01A8]);
    sub_214852B6C();
    sub_214852704();
    swift_bridgeObjectRelease();
    sub_2148526D4();

    swift_bridgeObjectRelease();
  }
  if ((v25 & 1) == 0)
  {
    strcpy((char *)v29, "mockJoinTime=");
    HIWORD(v29[1]) = -4864;
    sub_21485286C();
    sub_214852704();
    swift_bridgeObjectRelease();
    sub_2148526D4();
    swift_bridgeObjectRelease();
  }
  if ((v26 & 1) == 0)
  {
    strcpy((char *)v33, "mockReport={");
    BYTE5(v33[1]) = 0;
    HIWORD(v33[1]) = -5120;
    v29[0] = v16;
    LOBYTE(v29[1]) = v17 & 1;
    v29[2] = v18;
    v30 = v19 & 1;
    v31 = v21;
    v32 = v20 & 1;
    SKStepWiFiSetupReport.description.getter();
    sub_214852704();
    swift_bridgeObjectRelease();
    sub_214852704();
    sub_2148526D4();
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v27 + 8))(v3, v28);
  return v34;
}

uint64_t sub_214812310(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_214812344 + 4 * byte_2148588D0[a1]))(0x6C656E6E616863, 0xE700000000000000);
}

uint64_t sub_214812344()
{
  return 0x6E696F4A6B636F6DLL;
}

uint64_t sub_2148123D0()
{
  return 0x727465526E696F6ALL;
}

uint64_t sub_214812420()
{
  return 0x6972745364697373;
}

uint64_t sub_21481243C()
{
  unsigned __int8 *v0;

  return sub_214812310(*v0);
}

uint64_t sub_214812444@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_214817020(a1, a2);
  *a3 = result;
  return result;
}

void sub_214812468(_BYTE *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_214812474()
{
  sub_214815EB8();
  return sub_214852BD8();
}

uint64_t sub_21481249C()
{
  sub_214815EB8();
  return sub_214852BE4();
}

uint64_t SKStepWiFiSetupConfiguration.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  int v38;
  char v39;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88D70);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v28 = *(_QWORD *)(v1 + 24);
  v29 = v7;
  v38 = *(unsigned __int8 *)(v1 + 32);
  v8 = *(_QWORD *)(v1 + 48);
  v21 = *(_QWORD *)(v1 + 40);
  v22 = v8;
  v9 = *(_QWORD *)(v1 + 56);
  v26 = *(_QWORD *)(v1 + 64);
  v27 = v9;
  v25 = *(_QWORD *)(v1 + 72);
  LODWORD(v9) = *(unsigned __int8 *)(v1 + 80);
  v23 = *(unsigned __int8 *)(v1 + 81);
  v24 = v9;
  v20 = *(_QWORD *)(v1 + 88);
  v18 = *(_QWORD *)(v1 + 96);
  v19 = *(unsigned __int8 *)(v1 + 104);
  v16 = *(_QWORD *)(v1 + 112);
  v17 = *(unsigned __int8 *)(v1 + 120);
  v14 = *(_QWORD *)(v1 + 128);
  v15 = *(_QWORD *)(v1 + 136);
  v12[3] = *(_QWORD *)(v1 + 144);
  v13 = *(unsigned __int8 *)(v1 + 152);
  v12[1] = *(_QWORD *)(v1 + 160);
  v12[2] = *(_QWORD *)(v1 + 168);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_214815EB8();
  sub_214852BB4();
  LOBYTE(v31) = 0;
  v10 = v30;
  sub_214852AAC();
  if (!v10)
  {
    v31 = v29;
    v39 = 1;
    type metadata accessor for SKError();
    sub_2147F4354(&qword_254D88D78, 255, (uint64_t (*)(uint64_t))type metadata accessor for SKError, (uint64_t)&protocol conformance descriptor for SKError);
    sub_214852AB8();
    LOBYTE(v31) = 2;
    sub_214852AA0();
    v31 = v21;
    v32 = v22;
    v33 = v27;
    v34 = v26;
    v35 = v25;
    v36 = v24;
    v37 = v23;
    v39 = 3;
    sub_214815EFC();
    sub_214852AB8();
    v31 = v20;
    v39 = 4;
    sub_214852AB8();
    LOBYTE(v31) = 5;
    sub_214852AA0();
    LOBYTE(v31) = 6;
    sub_214852AAC();
    LOBYTE(v31) = 7;
    sub_214852A94();
    LOBYTE(v31) = 8;
    sub_214852AAC();
    LOBYTE(v31) = 9;
    sub_214852A94();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SKStepWiFiSetupConfiguration.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  int v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  _OWORD *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  id v43;
  int v44;
  int v45;
  _OWORD *v46;
  __int128 v47;
  __int128 v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  int v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  char v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  void *v77;
  __int128 v78;
  __int128 v79;
  char v80;
  char v81;
  int v82;
  __int16 v83;
  void *v84;
  uint64_t v85;
  char v86;
  _BYTE v87[7];
  uint64_t v88;
  char v89;
  _BYTE v90[7];
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char v94;
  _BYTE v95[7];
  uint64_t v96;
  uint64_t v97;
  _BYTE v98[7];
  char v99;
  _BYTE v100[7];
  char v101;
  _BYTE v102[7];
  char v103;
  int v104;
  __int16 v105;
  char v106;
  _BYTE v107[7];
  char v108;
  _BYTE v109[7];
  char v110;
  uint64_t v111;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88D88);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = 1;
  v108 = 1;
  v106 = 1;
  v103 = 1;
  v101 = 1;
  v99 = 1;
  v9 = a1[3];
  v56 = a1;
  __swift_project_boxed_opaque_existential_0(a1, v9);
  sub_214815EB8();
  sub_214852BA8();
  if (v2)
  {
    v111 = v2;
    v57 = 0;
    v58 = 0;
    v54 = 0;
    v55 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v56);
    v74 = 0;
    LOBYTE(v75) = v110;
    *(_DWORD *)((char *)&v75 + 1) = *(_DWORD *)v109;
    DWORD1(v75) = *(_DWORD *)&v109[3];
    *((_QWORD *)&v75 + 1) = 0;
    *(_QWORD *)&v76 = 0;
    BYTE8(v76) = v108;
    *(_DWORD *)((char *)&v76 + 9) = *(_DWORD *)v107;
    HIDWORD(v76) = *(_DWORD *)&v107[3];
    v77 = 0;
    v78 = 0uLL;
    v79 = 0uLL;
    v80 = v61;
    v81 = v106;
    v82 = v104;
    v83 = v105;
    v84 = v60;
    v85 = v59;
    v86 = v103;
    *(_DWORD *)v87 = *(_DWORD *)v102;
    *(_DWORD *)&v87[3] = *(_DWORD *)&v102[3];
    v88 = v58;
    v89 = v101;
    *(_DWORD *)&v90[3] = *(_DWORD *)&v100[3];
    *(_DWORD *)v90 = *(_DWORD *)v100;
    v91 = v55;
    v92 = v54;
    v93 = v57;
    v94 = v99;
    *(_DWORD *)&v95[3] = *(_DWORD *)&v98[3];
    *(_DWORD *)v95 = *(_DWORD *)v98;
    v96 = 0;
    v97 = 0;
  }
  else
  {
    LOBYTE(v74) = 0;
    v53 = sub_214852A58();
    v110 = v11 & 1;
    LODWORD(v54) = v11;
    type metadata accessor for SKError();
    LOBYTE(v62) = 1;
    v12 = sub_2147F4354(&qword_254D88D90, 255, (uint64_t (*)(uint64_t))type metadata accessor for SKError, (uint64_t)&protocol conformance descriptor for SKError);
    sub_214852A64();
    v111 = v12;
    v13 = v74;
    LOBYTE(v74) = 2;
    v51 = v13;
    v52 = v13;
    v14 = sub_214852A4C();
    LODWORD(v12) = v15;
    v50 = v14;
    v108 = v15 & 1;
    LOBYTE(v62) = 3;
    sub_214815F40();
    sub_214852A64();
    v46 = a2;
    v47 = v75;
    v48 = v76;
    v49 = v74;
    v61 = v77;
    v16 = BYTE1(v77);
    v106 = BYTE1(v77);
    LOBYTE(v62) = 4;
    sub_214852A64();
    v44 = v16;
    v45 = v12;
    v17 = v74;
    LOBYTE(v74) = 5;
    v18 = v17;
    v19 = sub_214852A4C();
    v60 = v17;
    v20 = v19;
    v43 = v18;
    v103 = v21 & 1;
    LOBYTE(v74) = 6;
    LODWORD(v18) = v21;
    v22 = sub_214852A58();
    v59 = v20;
    v58 = v22;
    HIDWORD(v42) = (_DWORD)v18;
    LOBYTE(v18) = v23;
    v101 = v23 & 1;
    LOBYTE(v74) = 7;
    v55 = sub_214852A40();
    LOBYTE(v74) = 8;
    v25 = v24;
    swift_bridgeObjectRetain();
    v26 = sub_214852A58();
    v111 = 0;
    v57 = v26;
    LOBYTE(v16) = v27 & 1;
    v99 = v27 & 1;
    v73 = 9;
    v28 = sub_214852A40();
    v111 = 0;
    v29 = v28;
    v31 = v30;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v32 = v53;
    *(_QWORD *)&v62 = v53;
    BYTE8(v62) = v54 & 1;
    v34 = v50;
    v33 = v51;
    *(_QWORD *)&v63 = v51;
    *((_QWORD *)&v63 + 1) = v50;
    LOBYTE(v64) = v45 & 1;
    *((_QWORD *)&v64 + 1) = v49;
    v65 = v47;
    v66 = v48;
    LOBYTE(v67) = v61;
    BYTE1(v67) = v44;
    *((_QWORD *)&v67 + 1) = v60;
    *(_QWORD *)&v68 = v59;
    BYTE8(v68) = BYTE4(v42) & 1;
    *(_QWORD *)&v69 = v58;
    BYTE8(v69) = v18 & 1;
    v35 = v55;
    *(_QWORD *)&v70 = v55;
    *((_QWORD *)&v70 + 1) = v25;
    *(_QWORD *)&v71 = v57;
    BYTE8(v71) = v16;
    *(_QWORD *)&v72 = v29;
    *((_QWORD *)&v72 + 1) = v31;
    sub_21480BABC((uint64_t)&v62);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v36 = v71;
    v37 = v46;
    v46[8] = v70;
    v37[9] = v36;
    v37[10] = v72;
    v38 = v67;
    v37[4] = v66;
    v37[5] = v38;
    v39 = v69;
    v37[6] = v68;
    v37[7] = v39;
    v40 = v63;
    *v37 = v62;
    v37[1] = v40;
    v41 = v65;
    v37[2] = v64;
    v37[3] = v41;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v56);
    v74 = (void *)v32;
    LOBYTE(v75) = v110;
    *(_DWORD *)((char *)&v75 + 1) = *(_DWORD *)v109;
    DWORD1(v75) = *(_DWORD *)&v109[3];
    *((_QWORD *)&v75 + 1) = v33;
    *(_QWORD *)&v76 = v34;
    BYTE8(v76) = v108;
    *(_DWORD *)((char *)&v76 + 9) = *(_DWORD *)v107;
    HIDWORD(v76) = *(_DWORD *)&v107[3];
    v77 = v49;
    v78 = v47;
    v79 = v48;
    v80 = v61;
    v81 = v106;
    v82 = v104;
    v83 = v105;
    v84 = v60;
    v85 = v59;
    v86 = v103;
    *(_DWORD *)v87 = *(_DWORD *)v102;
    *(_DWORD *)&v87[3] = *(_DWORD *)&v102[3];
    v88 = v58;
    v89 = v101;
    *(_DWORD *)&v90[3] = *(_DWORD *)&v100[3];
    *(_DWORD *)v90 = *(_DWORD *)v100;
    v91 = v35;
    v92 = v25;
    v93 = v57;
    v94 = v99;
    *(_DWORD *)&v95[3] = *(_DWORD *)&v98[3];
    *(_DWORD *)v95 = *(_DWORD *)v98;
    v96 = v29;
    v97 = v31;
  }
  return sub_21480BB4C((uint64_t)&v74);
}

uint64_t sub_214813194@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return SKStepWiFiSetupConfiguration.init(from:)(a1, a2);
}

uint64_t sub_2148131A8(_QWORD *a1)
{
  return SKStepWiFiSetupConfiguration.encode(to:)(a1);
}

uint64_t SKStepWiFiSetupReport.joinTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t SKStepWiFiSetupReport.joinTime.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*SKStepWiFiSetupReport.joinTime.modify())()
{
  return nullsub_1;
}

uint64_t SKStepWiFiSetupReport.rssi.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t SKStepWiFiSetupReport.rssi.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = result;
  *(_BYTE *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t (*SKStepWiFiSetupReport.rssi.modify())()
{
  return nullsub_1;
}

uint64_t SKStepWiFiSetupReport.scanTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t SKStepWiFiSetupReport.scanTime.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = result;
  *(_BYTE *)(v2 + 40) = a2 & 1;
  return result;
}

uint64_t (*SKStepWiFiSetupReport.scanTime.modify())()
{
  return nullsub_1;
}

uint64_t SKStepWiFiSetupReport.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;

  v1 = sub_2148523F8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_BYTE *)(v0 + 8);
  v6 = *(_QWORD *)(v0 + 16);
  v7 = *(_BYTE *)(v0 + 24);
  v8 = *(_BYTE *)(v0 + 40);
  v20 = 0;
  v21 = 0xE000000000000000;
  sub_2148523EC();
  v18 = 0;
  v19 = 0xE000000000000000;
  sub_214852704();
  v9 = 0;
  v10 = 0;
  if ((v5 & 1) == 0)
  {
    v9 = sub_21485286C();
    v10 = v11;
  }
  v16 = v9;
  v17 = v10;
  sub_214852B0C();
  swift_bridgeObjectRelease();
  sub_2148526D4();
  swift_bridgeObjectRelease();
  v18 = 0;
  v19 = 0xE000000000000000;
  sub_214852704();
  v16 = v6;
  LOBYTE(v17) = v7;
  sub_214852B0C();
  sub_2148526D4();
  swift_bridgeObjectRelease();
  v18 = 0;
  v19 = 0xE000000000000000;
  sub_214852704();
  v12 = 0;
  v13 = 0;
  if ((v8 & 1) == 0)
  {
    v12 = sub_21485286C();
    v13 = v14;
  }
  v16 = v12;
  v17 = v13;
  sub_214852B0C();
  swift_bridgeObjectRelease();
  sub_2148526D4();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v20;
}

uint64_t sub_214813458()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 1769173874;
  if (*v0 != 1)
    v1 = 0x656D69546E616373;
  if (*v0)
    return v1;
  else
    return 0x656D69546E696F6ALL;
}

uint64_t sub_2148134AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2148174CC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2148134D0()
{
  sub_214815F84();
  return sub_214852BD8();
}

uint64_t sub_2148134F8()
{
  sub_214815F84();
  return sub_214852BE4();
}

uint64_t SKStepWiFiSetupReport.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD v10[2];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  char v15;
  char v16;
  char v17;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88DA0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v14 = *(unsigned __int8 *)(v1 + 24);
  v11 = *(_QWORD *)(v1 + 32);
  v12 = v7;
  v10[1] = *(unsigned __int8 *)(v1 + 40);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_214815F84();
  sub_214852BB4();
  v17 = 0;
  v8 = v13;
  sub_214852AA0();
  if (!v8)
  {
    v16 = 1;
    sub_214852AAC();
    v15 = 2;
    sub_214852AA0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SKStepWiFiSetupReport.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  int v13;
  uint64_t v15;
  char *v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  char v22;
  char v23;
  char v24;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88DA8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_214815F84();
  sub_214852BA8();
  if (!v2)
  {
    v24 = 0;
    v9 = sub_214852A4C();
    v11 = v10;
    v23 = 1;
    v12 = sub_214852A58();
    v21 = v13;
    v20 = v12;
    v22 = 2;
    v15 = sub_214852A4C();
    v16 = v8;
    v18 = v17;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v16, v5);
    *(_QWORD *)a2 = v9;
    *(_BYTE *)(a2 + 8) = v11 & 1;
    *(_QWORD *)(a2 + 16) = v20;
    *(_BYTE *)(a2 + 24) = v21 & 1;
    *(_QWORD *)(a2 + 32) = v15;
    *(_BYTE *)(a2 + 40) = v18 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_21481383C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SKStepWiFiSetupReport.init(from:)(a1, a2);
}

uint64_t sub_214813850(_QWORD *a1)
{
  return SKStepWiFiSetupReport.encode(to:)(a1);
}

uint64_t sub_21481386C()
{
  sub_214815FC8();
  return sub_214852BD8();
}

uint64_t sub_214813894()
{
  sub_214815FC8();
  return sub_214852BE4();
}

uint64_t sub_2148138BC(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88DB0);
  v13 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v1;
  v7 = *((_BYTE *)v1 + 8);
  v8 = v1[2];
  v12 = *((unsigned __int8 *)v1 + 24);
  v11 = v1[4];
  HIDWORD(v10) = *((unsigned __int8 *)v1 + 40);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_214815FC8();
  sub_214852BB4();
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v17 = v12;
  v18 = v11;
  v19 = BYTE4(v10);
  sub_214815EFC();
  sub_214852AD0();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v5, v3);
}

uint64_t sub_214813A04@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88DB8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_214815FC8();
  sub_214852BA8();
  if (!v2)
  {
    sub_214815F40();
    sub_214852A7C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v9 = v16;
    v10 = v17;
    v11 = v18;
    v12 = v19;
    v13 = v20;
    *(_QWORD *)a2 = v15;
    *(_BYTE *)(a2 + 8) = v9;
    *(_QWORD *)(a2 + 16) = v10;
    *(_BYTE *)(a2 + 24) = v11;
    *(_QWORD *)(a2 + 32) = v12;
    *(_BYTE *)(a2 + 40) = v13;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_214813B4C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_214813A04(a1, a2);
}

uint64_t sub_214813B60(_QWORD *a1)
{
  return sub_2148138BC(a1);
}

uint64_t sub_214813B74()
{
  sub_21481600C();
  return sub_214852BD8();
}

uint64_t sub_214813B9C()
{
  sub_21481600C();
  return sub_214852BE4();
}

uint64_t sub_214813BC4(_QWORD *a1)
{
  _OWORD *v1;
  _OWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v14[11];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88DC0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_21481600C();
  sub_214852BB4();
  v8 = v2[9];
  v14[8] = v2[8];
  v14[9] = v8;
  v14[10] = v2[10];
  v9 = v2[5];
  v14[4] = v2[4];
  v14[5] = v9;
  v10 = v2[7];
  v14[6] = v2[6];
  v14[7] = v10;
  v11 = v2[1];
  v14[0] = *v2;
  v14[1] = v11;
  v12 = v2[3];
  v14[2] = v2[2];
  v14[3] = v12;
  sub_214816050();
  sub_214852AD0();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

__n128 sub_214813CE8@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;

  v2 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(a2 + 128) = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(a2 + 144) = v2;
  *(_OWORD *)(a2 + 160) = *(_OWORD *)(a1 + 160);
  v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v3;
  v4 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 112) = v4;
  v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v5;
  result = *(__n128 *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(__n128 *)(a2 + 48) = result;
  return result;
}

uint64_t sub_214813D1C@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v15[40];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88DD0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v15[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_21481600C();
  sub_214852BA8();
  if (!v2)
  {
    sub_214816094();
    sub_214852A7C();
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    v9 = v23;
    a2[8] = v22;
    a2[9] = v9;
    a2[10] = v24;
    v10 = v19;
    a2[4] = v18;
    a2[5] = v10;
    v11 = v21;
    a2[6] = v20;
    a2[7] = v11;
    v12 = *(_OWORD *)&v15[24];
    *a2 = *(_OWORD *)&v15[8];
    a2[1] = v12;
    v13 = v17;
    a2[2] = v16;
    a2[3] = v13;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

unint64_t sub_214813E7C()
{
  return 0xD000000000000010;
}

uint64_t sub_214813E98@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_214813D1C(a1, a2);
}

uint64_t sub_214813EAC(_QWORD *a1)
{
  return sub_214813BC4(a1);
}

void sub_214813EC0(_QWORD *a1@<X8>)
{
  *a1 = 3;
}

uint64_t SKEnvironmentValues.wifiJoinRetries.getter()
{
  return sub_214813EE0((uint64_t)&type metadata for WiFiJoinRetriesSKEnvironmentKey, (uint64_t)&off_254D88ED0);
}

uint64_t sub_214813EE0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  SKEnvironmentValues.subscript.getter(a1, a1, a2, (uint64_t)&v3);
  return v3;
}

uint64_t sub_214813F20@<X0>(_QWORD *a1@<X8>)
{
  return sub_214814038((uint64_t)&type metadata for WiFiJoinRetriesSKEnvironmentKey, (uint64_t)&off_254D88ED0, a1);
}

uint64_t sub_214813F34(uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  return SKEnvironmentValues.subscript.setter((uint64_t)&v2, (uint64_t)&type metadata for WiFiJoinRetriesSKEnvironmentKey);
}

uint64_t SKEnvironmentValues.wifiJoinRetries.setter(uint64_t a1)
{
  uint64_t v2;

  v2 = a1;
  return SKEnvironmentValues.subscript.setter((uint64_t)&v2, (uint64_t)&type metadata for WiFiJoinRetriesSKEnvironmentKey);
}

uint64_t (*SKEnvironmentValues.wifiJoinRetries.modify(uint64_t a1))(_QWORD *a1, uint64_t a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 16) = v1;
  SKEnvironmentValues.subscript.getter((uint64_t)&type metadata for WiFiJoinRetriesSKEnvironmentKey, (uint64_t)&type metadata for WiFiJoinRetriesSKEnvironmentKey, (uint64_t)&off_254D88ED0, a1);
  return sub_214814010;
}

uint64_t sub_214814010(_QWORD *a1, uint64_t a2)
{
  return sub_214814174(a1, a2, (uint64_t)&type metadata for WiFiJoinRetriesSKEnvironmentKey);
}

uint64_t sub_214814024@<X0>(_QWORD *a1@<X8>)
{
  return sub_214814038((uint64_t)&type metadata for WiFiScanRetriesSKEnvironmentKey, (uint64_t)&off_254D88EE8, a1);
}

uint64_t sub_214814038@<X0>(uint64_t a1@<X3>, uint64_t a2@<X4>, _QWORD *a3@<X8>)
{
  uint64_t result;
  uint64_t v5;

  result = SKEnvironmentValues.subscript.getter(a1, a1, a2, (uint64_t)&v5);
  *a3 = v5;
  return result;
}

uint64_t sub_214814084(uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  return SKEnvironmentValues.subscript.setter((uint64_t)&v2, (uint64_t)&type metadata for WiFiScanRetriesSKEnvironmentKey);
}

uint64_t SKEnvironmentValues.wifiScanRetries.setter(uint64_t a1)
{
  uint64_t v2;

  v2 = a1;
  return SKEnvironmentValues.subscript.setter((uint64_t)&v2, (uint64_t)&type metadata for WiFiScanRetriesSKEnvironmentKey);
}

uint64_t (*SKEnvironmentValues.wifiScanRetries.modify(uint64_t a1))(_QWORD *a1, uint64_t a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 16) = v1;
  SKEnvironmentValues.subscript.getter((uint64_t)&type metadata for WiFiScanRetriesSKEnvironmentKey, (uint64_t)&type metadata for WiFiScanRetriesSKEnvironmentKey, (uint64_t)&off_254D88EE8, a1);
  return sub_214814160;
}

uint64_t sub_214814160(_QWORD *a1, uint64_t a2)
{
  return sub_214814174(a1, a2, (uint64_t)&type metadata for WiFiScanRetriesSKEnvironmentKey);
}

uint64_t sub_214814174(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  a1[1] = *a1;
  return SKEnvironmentValues.subscript.setter((uint64_t)(a1 + 1), a3);
}

uint64_t type metadata accessor for SKStepWiFiSetupServer()
{
  return objc_opt_self();
}

uint64_t sub_2148141C0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2148141E4(uint64_t a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v6 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *(_QWORD *)v6 = v3;
  *(_QWORD *)(v6 + 8) = sub_2147F4FF0;
  *(_QWORD *)(v6 + 448) = a1;
  *(_QWORD *)(v6 + 456) = v2;
  v7 = a2[1];
  *(_OWORD *)(v6 + 16) = *a2;
  *(_OWORD *)(v6 + 32) = v7;
  v8 = a2[5];
  *(_OWORD *)(v6 + 80) = a2[4];
  *(_OWORD *)(v6 + 96) = v8;
  v9 = a2[3];
  *(_OWORD *)(v6 + 48) = a2[2];
  *(_OWORD *)(v6 + 64) = v9;
  v10 = a2[10];
  v11 = a2[8];
  *(_OWORD *)(v6 + 160) = a2[9];
  *(_OWORD *)(v6 + 176) = v10;
  v12 = a2[7];
  *(_OWORD *)(v6 + 112) = a2[6];
  *(_OWORD *)(v6 + 128) = v12;
  *(_OWORD *)(v6 + 144) = v11;
  return swift_task_switch();
}

unint64_t sub_214814280()
{
  unint64_t result;

  result = qword_254D88D48;
  if (!qword_254D88D48)
  {
    result = MEMORY[0x2199D7540](&unk_214858BC0, &type metadata for SKStepWiFiSetupStartRequestHandler);
    atomic_store(result, (unint64_t *)&qword_254D88D48);
  }
  return result;
}

uint64_t sub_2148142C4(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_21485274C();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x2199D67C0](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_21481433C(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_2148159D0();
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_2148144A8(v6);
  return sub_2148529BC();
}

_QWORD *sub_2148143B4(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F20);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v5 = v4 - 32;
      if (v4 < 32)
        v5 = v4 - 25;
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_21481564C((unint64_t)(v3 + 4), v2, v1);
    v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v2 = sub_2148529F8();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

void sub_2148144A8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  char *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  unint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  char v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  BOOL v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  uint64_t v86;
  char *v87;
  unint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  unint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  char *v103;
  uint64_t v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void **v110;
  uint64_t v111;

  v3 = a1[1];
  v4 = sub_214852AF4();
  if (v4 >= v3)
  {
    if (v3 < 0)
      goto LABEL_132;
    if (v3)
      sub_214814C18(0, v3, 1, a1);
    return;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_140;
  v104 = v4;
  v99 = a1;
  if (v3 < 2)
  {
    v8 = (char *)MEMORY[0x24BEE4AF8];
    v111 = MEMORY[0x24BEE4AF8];
    v110 = (void **)((MEMORY[0x24BEE4AF8] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      v11 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_98:
      if (v11 >= 2)
      {
        v93 = *v99;
        do
        {
          v94 = v11 - 2;
          if (v11 < 2)
            goto LABEL_127;
          if (!v93)
            goto LABEL_139;
          v95 = *(_QWORD *)&v8[16 * v94 + 32];
          v96 = *(_QWORD *)&v8[16 * v11 + 24];
          sub_214814D08((id *)(v93 + 8 * v95), (id *)(v93 + 8 * *(_QWORD *)&v8[16 * v11 + 16]), v93 + 8 * v96, v110);
          if (v1)
            break;
          if (v96 < v95)
            goto LABEL_128;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v8 = sub_2148151C4((uint64_t)v8);
          if (v94 >= *((_QWORD *)v8 + 2))
            goto LABEL_129;
          v97 = &v8[16 * v94 + 32];
          *(_QWORD *)v97 = v95;
          *((_QWORD *)v97 + 1) = v96;
          v98 = *((_QWORD *)v8 + 2);
          if (v11 > v98)
            goto LABEL_130;
          memmove(&v8[16 * v11 + 16], &v8[16 * v11 + 32], 16 * (v98 - v11));
          *((_QWORD *)v8 + 2) = v98 - 1;
          v11 = v98 - 1;
        }
        while (v98 > 2);
      }
LABEL_109:
      swift_bridgeObjectRelease();
      *(_QWORD *)((v111 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_2148527AC();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    v6 = v5 >> 1;
    sub_2147F4394(0, &qword_254D88F30);
    v7 = sub_2148527B8();
    *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
    v110 = (void **)((v7 & 0xFFFFFFFFFFFFFF8) + 32);
    v111 = v7;
  }
  v9 = 0;
  v10 = *a1;
  v100 = *a1 - 8;
  v101 = *a1 + 16;
  v8 = (char *)MEMORY[0x24BEE4AF8];
  v107 = v3;
  while (1)
  {
    v12 = v9++;
    v108 = v12;
    if (v9 < v3)
    {
      v13 = *(void **)(v10 + 8 * v12);
      v14 = *(id *)(v10 + 8 * v9);
      v15 = v13;
      v105 = objc_msgSend(v14, sel_RSSI);
      v16 = objc_msgSend(v15, sel_RSSI);

      v3 = v107;
      v9 = v12 + 2;
      if (v12 + 2 < v107)
      {
        v102 = v8;
        v17 = (id *)(v101 + 8 * v12);
        while (1)
        {
          v18 = *(v17 - 1);
          v19 = *v17;
          v20 = v18;
          v21 = objc_msgSend(v19, sel_RSSI);
          v22 = objc_msgSend(v20, sel_RSSI);

          if ((uint64_t)v105 < (uint64_t)v16 == (uint64_t)v21 >= (uint64_t)v22)
            break;
          ++v9;
          ++v17;
          v3 = v107;
          if (v107 == v9)
          {
            v9 = v107;
            v8 = v102;
            goto LABEL_22;
          }
        }
        v8 = v102;
        v3 = v107;
LABEL_22:
        v12 = v108;
      }
      if ((uint64_t)v105 < (uint64_t)v16)
      {
        if (v9 < v12)
          goto LABEL_133;
        if (v12 < v9)
        {
          v23 = (uint64_t *)(v100 + 8 * v9);
          v24 = v9;
          v25 = v12;
          v26 = (uint64_t *)(v10 + 8 * v12);
          do
          {
            if (v25 != --v24)
            {
              if (!v10)
                goto LABEL_138;
              v27 = *v26;
              *v26 = *v23;
              *v23 = v27;
            }
            ++v25;
            --v23;
            ++v26;
          }
          while (v25 < v24);
        }
      }
    }
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v12))
        goto LABEL_131;
      if (v9 - v12 < v104)
        break;
    }
LABEL_48:
    if (v9 < v12)
      goto LABEL_126;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v8 = sub_214815024(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
    v40 = *((_QWORD *)v8 + 2);
    v39 = *((_QWORD *)v8 + 3);
    v11 = v40 + 1;
    if (v40 >= v39 >> 1)
      v8 = sub_214815024((char *)(v39 > 1), v40 + 1, 1, v8);
    *((_QWORD *)v8 + 2) = v11;
    v41 = v8 + 32;
    v42 = &v8[16 * v40 + 32];
    *(_QWORD *)v42 = v12;
    *((_QWORD *)v42 + 1) = v9;
    if (v40)
    {
      v109 = v9;
      while (1)
      {
        v43 = v11 - 1;
        if (v11 >= 4)
        {
          v48 = &v41[16 * v11];
          v49 = *((_QWORD *)v48 - 8);
          v50 = *((_QWORD *)v48 - 7);
          v54 = __OFSUB__(v50, v49);
          v51 = v50 - v49;
          if (v54)
            goto LABEL_115;
          v53 = *((_QWORD *)v48 - 6);
          v52 = *((_QWORD *)v48 - 5);
          v54 = __OFSUB__(v52, v53);
          v46 = v52 - v53;
          v47 = v54;
          if (v54)
            goto LABEL_116;
          v55 = v11 - 2;
          v56 = &v41[16 * v11 - 32];
          v58 = *(_QWORD *)v56;
          v57 = *((_QWORD *)v56 + 1);
          v54 = __OFSUB__(v57, v58);
          v59 = v57 - v58;
          if (v54)
            goto LABEL_118;
          v54 = __OFADD__(v46, v59);
          v60 = v46 + v59;
          if (v54)
            goto LABEL_121;
          if (v60 >= v51)
          {
            v78 = &v41[16 * v43];
            v80 = *(_QWORD *)v78;
            v79 = *((_QWORD *)v78 + 1);
            v54 = __OFSUB__(v79, v80);
            v81 = v79 - v80;
            if (v54)
              goto LABEL_125;
            v71 = v46 < v81;
            goto LABEL_86;
          }
        }
        else
        {
          if (v11 != 3)
          {
            v72 = *((_QWORD *)v8 + 4);
            v73 = *((_QWORD *)v8 + 5);
            v54 = __OFSUB__(v73, v72);
            v65 = v73 - v72;
            v66 = v54;
            goto LABEL_80;
          }
          v45 = *((_QWORD *)v8 + 4);
          v44 = *((_QWORD *)v8 + 5);
          v54 = __OFSUB__(v44, v45);
          v46 = v44 - v45;
          v47 = v54;
        }
        if ((v47 & 1) != 0)
          goto LABEL_117;
        v55 = v11 - 2;
        v61 = &v41[16 * v11 - 32];
        v63 = *(_QWORD *)v61;
        v62 = *((_QWORD *)v61 + 1);
        v64 = __OFSUB__(v62, v63);
        v65 = v62 - v63;
        v66 = v64;
        if (v64)
          goto LABEL_120;
        v67 = &v41[16 * v43];
        v69 = *(_QWORD *)v67;
        v68 = *((_QWORD *)v67 + 1);
        v54 = __OFSUB__(v68, v69);
        v70 = v68 - v69;
        if (v54)
          goto LABEL_123;
        if (__OFADD__(v65, v70))
          goto LABEL_124;
        if (v65 + v70 >= v46)
        {
          v71 = v46 < v70;
LABEL_86:
          if (v71)
            v43 = v55;
          goto LABEL_88;
        }
LABEL_80:
        if ((v66 & 1) != 0)
          goto LABEL_119;
        v74 = &v41[16 * v43];
        v76 = *(_QWORD *)v74;
        v75 = *((_QWORD *)v74 + 1);
        v54 = __OFSUB__(v75, v76);
        v77 = v75 - v76;
        if (v54)
          goto LABEL_122;
        if (v77 < v65)
          goto LABEL_14;
LABEL_88:
        v82 = v43 - 1;
        if (v43 - 1 >= v11)
        {
          __break(1u);
LABEL_112:
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
          goto LABEL_135;
        }
        v83 = v10;
        if (!v10)
          goto LABEL_137;
        v84 = v8;
        v85 = &v41[16 * v82];
        v86 = *(_QWORD *)v85;
        v87 = v41;
        v88 = v43;
        v89 = &v41[16 * v43];
        v90 = *((_QWORD *)v89 + 1);
        v91 = v83;
        sub_214814D08((id *)(v83 + 8 * *(_QWORD *)v85), (id *)(v83 + 8 * *(_QWORD *)v89), v83 + 8 * v90, v110);
        if (v1)
          goto LABEL_109;
        if (v90 < v86)
          goto LABEL_112;
        if (v88 > *((_QWORD *)v84 + 2))
          goto LABEL_113;
        *(_QWORD *)v85 = v86;
        *(_QWORD *)&v87[16 * v82 + 8] = v90;
        v92 = *((_QWORD *)v84 + 2);
        if (v88 >= v92)
          goto LABEL_114;
        v8 = v84;
        v11 = v92 - 1;
        memmove(v89, v89 + 16, 16 * (v92 - 1 - v88));
        v41 = v87;
        *((_QWORD *)v84 + 2) = v92 - 1;
        v10 = v91;
        v9 = v109;
        if (v92 <= 2)
          goto LABEL_14;
      }
    }
    v11 = 1;
LABEL_14:
    v3 = v107;
    if (v9 >= v107)
      goto LABEL_98;
  }
  if (__OFADD__(v12, v104))
    goto LABEL_134;
  if (v12 + v104 >= v3)
    v28 = v3;
  else
    v28 = v12 + v104;
  if (v28 >= v12)
  {
    if (v9 != v28)
    {
      v103 = v8;
      v29 = v100 + 8 * v9;
      v106 = v28;
      do
      {
        v30 = *(void **)(v10 + 8 * v9);
        v31 = v12;
        v32 = v29;
        do
        {
          v33 = *(void **)v32;
          v34 = v30;
          v35 = v33;
          v36 = objc_msgSend(v34, sel_RSSI);
          v37 = objc_msgSend(v35, sel_RSSI);

          if ((uint64_t)v36 >= (uint64_t)v37)
            break;
          if (!v10)
            goto LABEL_136;
          v38 = *(void **)v32;
          v30 = *(void **)(v32 + 8);
          *(_QWORD *)v32 = v30;
          *(_QWORD *)(v32 + 8) = v38;
          v32 -= 8;
          ++v31;
        }
        while (v9 != v31);
        ++v9;
        v29 += 8;
        v12 = v108;
      }
      while (v9 != v106);
      v9 = v106;
      v8 = v103;
    }
    goto LABEL_48;
  }
LABEL_135:
  __break(1u);
LABEL_136:
  __break(1u);
LABEL_137:
  __break(1u);
LABEL_138:
  __break(1u);
LABEL_139:
  __break(1u);
LABEL_140:
  sub_2148529E0();
  __break(1u);
}

void sub_214814C18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v17;

  if (a3 != a2)
  {
    v4 = a3;
    v5 = *a4;
    v6 = *a4 + 8 * a3 - 8;
LABEL_5:
    v7 = *(void **)(v5 + 8 * v4);
    v8 = a1;
    v17 = v6;
    while (1)
    {
      v9 = *(void **)v6;
      v10 = v7;
      v11 = v9;
      v12 = objc_msgSend(v10, sel_RSSI);
      v13 = objc_msgSend(v11, sel_RSSI);

      if ((uint64_t)v12 >= (uint64_t)v13)
      {
LABEL_4:
        ++v4;
        v6 = v17 + 8;
        if (v4 == a2)
          return;
        goto LABEL_5;
      }
      if (!v5)
        break;
      v14 = *(void **)v6;
      v7 = *(void **)(v6 + 8);
      *(_QWORD *)v6 = v7;
      *(_QWORD *)(v6 + 8) = v14;
      v6 -= 8;
      if (v4 == ++v8)
        goto LABEL_4;
    }
    __break(1u);
  }
}

uint64_t sub_214814D08(id *__src, id *a2, unint64_t a3, void **a4)
{
  id *v4;
  id *v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void **v12;
  void **v13;
  void **v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id *v20;
  void **v21;
  id *v22;
  id *v23;
  id *v24;
  id *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t result;
  id *v32;
  id *v35;
  char *v36;
  void **v37;
  id *v38;

  v4 = a2;
  v5 = __src;
  v6 = (char *)a2 - (char *)__src;
  v7 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0)
    v7 = (char *)a2 - (char *)__src;
  v8 = v7 >> 3;
  v9 = a3 - (_QWORD)a2;
  v10 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v10 = a3 - (_QWORD)a2;
  v11 = v10 >> 3;
  v38 = __src;
  v37 = a4;
  if (v8 >= v10 >> 3)
  {
    if (v9 >= -7)
    {
      if (a4 != a2 || &a2[v11] <= a4)
        memmove(a4, a2, 8 * v11);
      v22 = &a4[v11];
      v36 = (char *)v22;
      v38 = v4;
      if (v5 < v4 && v9 >= 8)
      {
        v23 = (id *)(a3 - 8);
        v24 = v4;
        v32 = v5;
        do
        {
          v35 = v4;
          v25 = v23 + 1;
          v26 = *--v24;
          v27 = *(v22 - 1);
          v28 = v26;
          v29 = objc_msgSend(v27, sel_RSSI);
          v30 = objc_msgSend(v28, sel_RSSI);

          if ((uint64_t)v29 >= (uint64_t)v30)
          {
            v36 = (char *)(v22 - 1);
            if (v25 < v22 || v23 >= v22 || v25 != v22)
              *v23 = *(v22 - 1);
            v24 = v35;
            --v22;
          }
          else
          {
            if (v25 != v35 || v23 >= v35)
              *v23 = *v24;
            v38 = v24;
          }
          if (v24 <= v32)
            break;
          --v23;
          v4 = v24;
        }
        while (v22 > a4);
      }
      goto LABEL_43;
    }
  }
  else if (v6 >= -7)
  {
    if (a4 != __src || &__src[v8] <= a4)
      memmove(a4, __src, 8 * v8);
    v12 = &a4[v8];
    v36 = (char *)v12;
    if ((unint64_t)v4 < a3 && v6 >= 8)
    {
      v13 = a4;
      do
      {
        v14 = v5;
        v15 = *v13;
        v16 = *v4;
        v17 = v15;
        v18 = objc_msgSend(v16, sel_RSSI);
        v19 = objc_msgSend(v17, sel_RSSI);

        if ((uint64_t)v18 >= (uint64_t)v19)
        {
          v21 = v14;
          if (v14 != v13)
            *v14 = *v13;
          v37 = ++v13;
          v20 = v4;
        }
        else
        {
          v20 = v4 + 1;
          v21 = v14;
          if (v14 < v4 || v14 >= v20 || v14 != v4)
            *v14 = *v4;
        }
        v5 = v21 + 1;
        if (v13 >= v12)
          break;
        v4 = v20;
      }
      while ((unint64_t)v20 < a3);
      v38 = v5;
    }
LABEL_43:
    sub_21481511C((void **)&v38, (const void **)&v37, &v36);
    return 1;
  }
  result = sub_214852A28();
  __break(1u);
  return result;
}

char *sub_214815024(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F48);
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
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_21481511C(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    result = (char *)sub_214852A28();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_2148151C4(uint64_t a1)
{
  return sub_214815024(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

void sub_2148151D8()
{
  __asm { BR              X11 }
}

_QWORD *sub_214815238@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(_QWORD **__return_ptr, uint64_t *, char *);
  uint64_t v4;
  _QWORD *result;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v8 = v4;
  LOWORD(v9) = a1;
  BYTE2(v9) = BYTE2(a1);
  HIBYTE(v9) = BYTE3(a1);
  v10 = BYTE4(a1);
  v11 = BYTE5(a1);
  v12 = BYTE6(a1);
  result = v3(&v7, &v8, (char *)&v8 + BYTE6(a1));
  if (!v2)
    result = v7;
  v6 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  *v1 = v8;
  v1[1] = v6;
  return result;
}

_BYTE *sub_2148154C8@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_214816D68(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_214816E28((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_214816EA0((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

_QWORD *sub_21481553C(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a3)
  {
    result = a1(&v6, a3, a4 - a3);
    if (v4)
      return result;
    return (_QWORD *)v6;
  }
  result = a1(&v6, 0, 0);
  if (!v4)
    return (_QWORD *)v6;
  return result;
}

char *sub_2148155A0(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v3;
  char *result;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = (char *)sub_2148522B4();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)sub_2148522D8();
  v9 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v12 = sub_2148522CC();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

uint64_t sub_21481564C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_2148529F8();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_2148529F8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_214817638();
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F38);
          v12 = sub_214815854(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_2147F4394(0, &qword_254D88F30);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_214852A28();
  __break(1u);
  return result;
}

void (*sub_214815854(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_2148158D4(v6, a2, a3);
  return sub_2148158A8;
}

void sub_2148158A8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_2148158D4(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x2199D6A30](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_214815940;
  }
  __break(1u);
  return result;
}

void sub_214815940(id *a1)
{

}

uint64_t sub_214815948@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  char v3;
  uint64_t v4;

  if (result)
  {
    swift_bridgeObjectRetain();
    result = sub_214852998();
    if ((v3 & 1) == 0)
    {
      v4 = result;
      result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_2148159D0()
{
  JUMPOUT(0x2199D6B74);
}

BOOL _s8SetupKit010SKStepWiFiA6ReportV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;
  char v4;

  v2 = *(_BYTE *)(a2 + 8);
  v3 = *(_BYTE *)(a2 + 40);
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 8))
      return 0;
  }
  else
  {
    if (*(double *)a1 != *(double *)a2)
      v2 = 1;
    if ((v2 & 1) != 0)
      return 0;
  }
  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 24))
      return 0;
  }
  else
  {
    if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16))
      v4 = *(_BYTE *)(a2 + 24);
    else
      v4 = 1;
    if ((v4 & 1) != 0)
      return 0;
  }
  if ((*(_BYTE *)(a1 + 40) & 1) == 0)
  {
    if (*(double *)(a1 + 32) != *(double *)(a2 + 32))
      v3 = 1;
    return (v3 & 1) == 0;
  }
  return (*(_BYTE *)(a2 + 40) & 1) != 0;
}

BOOL _s8SetupKit010SKStepWiFiA13ConfigurationV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  void *v2;
  double v3;
  char v4;
  double v5;
  double v6;
  char v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  void *v16;
  double v17;
  int v18;
  double v19;
  uint64_t v20;
  double v21;
  int v22;
  double v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  char v35;
  char v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  char v44;
  _BOOL8 result;
  uint64_t v46;
  char v47;
  char v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  int v56;
  char v57;
  char v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  char v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  char v84;
  int v85;
  uint64_t v86;
  char v87;
  char v88;
  void *v89;
  void *v90;

  v2 = *(void **)(a1 + 16);
  v3 = *(double *)(a1 + 24);
  v4 = *(_BYTE *)(a1 + 32);
  v5 = *(double *)(a1 + 40);
  v82 = *(_QWORD *)(a1 + 56);
  v87 = *(_BYTE *)(a1 + 64);
  v88 = *(_BYTE *)(a1 + 48);
  v6 = *(double *)(a1 + 72);
  v84 = *(_BYTE *)(a1 + 80);
  v7 = *(_BYTE *)(a1 + 81);
  v90 = *(void **)(a1 + 88);
  v8 = *(double *)(a1 + 96);
  v9 = *(_QWORD *)(a1 + 128);
  v10 = *(_QWORD *)(a1 + 136);
  v11 = *(_QWORD *)(a1 + 144);
  v12 = *(_BYTE *)(a1 + 152);
  v13 = *(_QWORD *)(a1 + 160);
  v14 = *(_QWORD *)(a1 + 168);
  v15 = *(_BYTE *)(a2 + 8);
  v16 = *(void **)(a2 + 16);
  v17 = *(double *)(a2 + 24);
  v18 = *(unsigned __int8 *)(a2 + 32);
  v19 = *(double *)(a2 + 40);
  v20 = *(_QWORD *)(a2 + 48);
  v81 = *(_QWORD *)(a2 + 56);
  v86 = *(_QWORD *)(a2 + 64);
  v21 = *(double *)(a2 + 72);
  v83 = *(_BYTE *)(a2 + 80);
  v22 = *(unsigned __int8 *)(a2 + 81);
  v89 = *(void **)(a2 + 88);
  v23 = *(double *)(a2 + 96);
  v24 = *(_QWORD *)(a2 + 112);
  v25 = *(unsigned __int8 *)(a2 + 120);
  v27 = *(_QWORD *)(a2 + 128);
  v26 = *(_QWORD *)(a2 + 136);
  v28 = *(_QWORD *)(a2 + 144);
  v29 = *(unsigned __int8 *)(a2 + 152);
  v30 = *(_QWORD *)(a2 + 160);
  v31 = *(_QWORD *)(a2 + 168);
  v85 = *(unsigned __int8 *)(a2 + 104);
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 8))
      return 0;
  }
  else
  {
    if (*(_QWORD *)a1 != *(_QWORD *)a2)
      v15 = 1;
    if ((v15 & 1) != 0)
      return 0;
  }
  if (v2)
  {
    if (!v16)
      return 0;
    v67 = *(_BYTE *)(a1 + 104);
    v65 = *(_BYTE *)(a1 + 120);
    v66 = *(_QWORD *)(a1 + 112);
    v77 = *(_QWORD *)(a1 + 168);
    v79 = *(_QWORD *)(a1 + 160);
    v63 = *(_QWORD *)(a1 + 136);
    v64 = *(_QWORD *)(a2 + 168);
    v73 = *(_QWORD *)(a1 + 144);
    v75 = *(_QWORD *)(a2 + 160);
    v71 = *(_BYTE *)(a1 + 152);
    v69 = *(_QWORD *)(a1 + 128);
    v62 = *(unsigned __int8 *)(a2 + 152);
    v60 = *(_QWORD *)(a2 + 136);
    v61 = *(_QWORD *)(a2 + 144);
    v32 = *(_QWORD *)(a2 + 128);
    type metadata accessor for SKError();
    v33 = v16;
    v34 = v2;
    v35 = sub_214852908();

    v27 = v32;
    v26 = v60;
    v28 = v61;
    v29 = v62;
    v10 = v63;
    v31 = v64;
    v9 = v69;
    v12 = v71;
    v11 = v73;
    v30 = v75;
    v14 = v77;
    v13 = v79;
    if ((v35 & 1) == 0)
      return 0;
  }
  else
  {
    v67 = *(_BYTE *)(a1 + 104);
    v65 = *(_BYTE *)(a1 + 120);
    v66 = *(_QWORD *)(a1 + 112);
    if (v16)
      return 0;
  }
  if ((v4 & 1) != 0)
  {
    if (!v18)
      return 0;
  }
  else
  {
    if (v3 == v17)
      v36 = v18;
    else
      v36 = 1;
    if ((v36 & 1) != 0)
      return 0;
  }
  if ((v7 & 1) != 0)
  {
    if (!v22)
      return 0;
  }
  else
  {
    if ((v22 & 1) != 0)
      return 0;
    if ((v88 & 1) != 0)
    {
      if ((v20 & 1) == 0)
        return 0;
    }
    else
    {
      result = 0;
      if ((v20 & 1) != 0 || v5 != v19)
        return result;
    }
    if ((v87 & 1) != 0)
    {
      if ((v86 & 1) == 0)
        return 0;
    }
    else
    {
      result = 0;
      if ((v86 & 1) != 0 || v82 != v81)
        return result;
    }
    if ((v84 & 1) != 0)
    {
      if ((v83 & 1) == 0)
        return 0;
    }
    else
    {
      result = 0;
      if ((v83 & 1) != 0 || v6 != v21)
        return result;
    }
  }
  if (v90)
  {
    if (!v89)
      return 0;
    v78 = v14;
    v80 = v13;
    v74 = v11;
    v76 = v30;
    v72 = v12;
    v70 = v9;
    v37 = v10;
    v68 = v25;
    v38 = v29;
    v39 = v28;
    v40 = v26;
    v41 = v27;
    type metadata accessor for SKError();
    v42 = v89;
    v43 = v90;
    v44 = sub_214852908();

    v27 = v41;
    v26 = v40;
    v28 = v39;
    v29 = v38;
    v25 = v68;
    v10 = v37;
    v9 = v70;
    v12 = v72;
    v11 = v74;
    v30 = v76;
    v14 = v78;
    v13 = v80;
    if ((v44 & 1) == 0)
      return 0;
  }
  else if (v89)
  {
    return 0;
  }
  if ((v67 & 1) != 0)
  {
    v46 = v66;
    v47 = v65;
    if (!v85)
      return 0;
  }
  else
  {
    v48 = v85;
    if (v8 != v23)
      v48 = 1;
    v46 = v66;
    v47 = v65;
    if ((v48 & 1) != 0)
      return 0;
  }
  if ((v47 & 1) != 0)
  {
    if (!v25)
      return 0;
  }
  else
  {
    if (v46 == v24)
      v49 = v25;
    else
      v49 = 1;
    if ((v49 & 1) != 0)
      return 0;
  }
  if (!v10)
  {
    if (v26)
      return 0;
LABEL_63:
    if ((v12 & 1) != 0)
    {
      if (!v29)
        return 0;
    }
    else
    {
      if (v11 == v28)
        v59 = v29;
      else
        v59 = 1;
      if ((v59 & 1) != 0)
        return 0;
    }
    if (v14)
      return v31 && (v13 == v30 && v14 == v31 || (sub_214852B18() & 1) != 0);
    return !v31;
  }
  if (!v26)
    return 0;
  if (v9 == v27 && v10 == v26)
    goto LABEL_63;
  v50 = v30;
  v51 = v28;
  v52 = v13;
  v53 = v14;
  v54 = v11;
  v55 = v12;
  v56 = v29;
  v57 = sub_214852B18();
  v28 = v51;
  v29 = v56;
  v12 = v55;
  v11 = v54;
  v30 = v50;
  v14 = v53;
  v13 = v52;
  v58 = v57;
  result = 0;
  if ((v58 & 1) != 0)
    goto LABEL_63;
  return result;
}

unint64_t sub_214815EB8()
{
  unint64_t result;

  result = qword_254D8E2C0;
  if (!qword_254D8E2C0)
  {
    result = MEMORY[0x2199D7540](&unk_214859180, &type metadata for SKStepWiFiSetupConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8E2C0);
  }
  return result;
}

unint64_t sub_214815EFC()
{
  unint64_t result;

  result = qword_254D88D80;
  if (!qword_254D88D80)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepWiFiSetupReport, &type metadata for SKStepWiFiSetupReport);
    atomic_store(result, (unint64_t *)&qword_254D88D80);
  }
  return result;
}

unint64_t sub_214815F40()
{
  unint64_t result;

  result = qword_254D88D98;
  if (!qword_254D88D98)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepWiFiSetupReport, &type metadata for SKStepWiFiSetupReport);
    atomic_store(result, (unint64_t *)&qword_254D88D98);
  }
  return result;
}

unint64_t sub_214815F84()
{
  unint64_t result;

  result = qword_254D8E2C8;
  if (!qword_254D8E2C8)
  {
    result = MEMORY[0x2199D7540](&unk_214859130, &type metadata for SKStepWiFiSetupReport.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8E2C8);
  }
  return result;
}

unint64_t sub_214815FC8()
{
  unint64_t result;

  result = qword_254D8E2D0;
  if (!qword_254D8E2D0)
  {
    result = MEMORY[0x2199D7540](&unk_2148590E0, &type metadata for SKStepWiFiSetupStartRequestMessage.ResponseMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8E2D0);
  }
  return result;
}

unint64_t sub_21481600C()
{
  unint64_t result;

  result = qword_254D8E2D8[0];
  if (!qword_254D8E2D8[0])
  {
    result = MEMORY[0x2199D7540](&unk_214859090, &type metadata for SKStepWiFiSetupStartRequestMessage.CodingKeys);
    atomic_store(result, qword_254D8E2D8);
  }
  return result;
}

unint64_t sub_214816050()
{
  unint64_t result;

  result = qword_254D88DC8;
  if (!qword_254D88DC8)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepWiFiSetupConfiguration, &type metadata for SKStepWiFiSetupConfiguration);
    atomic_store(result, (unint64_t *)&qword_254D88DC8);
  }
  return result;
}

unint64_t sub_214816094()
{
  unint64_t result;

  result = qword_254D88DD8;
  if (!qword_254D88DD8)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepWiFiSetupConfiguration, &type metadata for SKStepWiFiSetupConfiguration);
    atomic_store(result, (unint64_t *)&qword_254D88DD8);
  }
  return result;
}

unint64_t sub_2148160DC()
{
  unint64_t result;

  result = qword_254D88DE0;
  if (!qword_254D88DE0)
  {
    result = MEMORY[0x2199D7540](&unk_214858AB8, &type metadata for SKStepWiFiSetupStartRequestMessage.ResponseMessage);
    atomic_store(result, (unint64_t *)&qword_254D88DE0);
  }
  return result;
}

unint64_t sub_214816124()
{
  unint64_t result;

  result = qword_254D88DE8;
  if (!qword_254D88DE8)
  {
    result = MEMORY[0x2199D7540](&unk_214858AE0, &type metadata for SKStepWiFiSetupStartRequestMessage.ResponseMessage);
    atomic_store(result, (unint64_t *)&qword_254D88DE8);
  }
  return result;
}

unint64_t sub_21481616C()
{
  unint64_t result;

  result = qword_254D88DF0;
  if (!qword_254D88DF0)
  {
    result = MEMORY[0x2199D7540](&unk_214858B70, &type metadata for SKStepWiFiSetupStartRequestMessage);
    atomic_store(result, (unint64_t *)&qword_254D88DF0);
  }
  return result;
}

unint64_t sub_2148161B4()
{
  unint64_t result;

  result = qword_254D88DF8;
  if (!qword_254D88DF8)
  {
    result = MEMORY[0x2199D7540](&unk_214858B98, &type metadata for SKStepWiFiSetupStartRequestMessage);
    atomic_store(result, (unint64_t *)&qword_254D88DF8);
  }
  return result;
}

unint64_t sub_2148161FC()
{
  unint64_t result;

  result = qword_254D88E00;
  if (!qword_254D88E00)
  {
    result = MEMORY[0x2199D7540](&unk_214858A70, &type metadata for SKStepWiFiSetupStartRequestMessage.ResponseMessage);
    atomic_store(result, (unint64_t *)&qword_254D88E00);
  }
  return result;
}

uint64_t method lookup function for SKStepWiFiSetupServer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SKStepWiFiSetupServer.__allocating_init(server:environment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

__n128 __swift_memcpy176_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __n128 result;
  __int128 v8;
  __int128 v9;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  v4 = a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  result = (__n128)a2[7];
  v8 = a2[8];
  v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(__n128 *)(a1 + 112) = result;
  *(_OWORD *)(a1 + 128) = v8;
  return result;
}

ValueMetadata *type metadata accessor for SKStepWiFiSetupConfiguration()
{
  return &type metadata for SKStepWiFiSetupConfiguration;
}

ValueMetadata *type metadata accessor for SKStepWiFiSetupReport()
{
  return &type metadata for SKStepWiFiSetupReport;
}

uint64_t _s8SetupKit28SKStepWiFiSetupConfigurationVwxx_0(uint64_t a1)
{

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s8SetupKit28SKStepWiFiSetupConfigurationVwcp_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v3 = *(void **)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 66) = *(_OWORD *)(a2 + 66);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  v6 = *(void **)(a2 + 88);
  v5 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = v6;
  *(_QWORD *)(a1 + 96) = v5;
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  v7 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v7;
  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  v8 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v8;
  v9 = v3;
  v10 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s8SetupKit28SKStepWiFiSetupConfigurationVwca_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v4;
  v5 = *(void **)(a1 + 16);
  v6 = (void *)a2[2];
  *(_QWORD *)(a1 + 16) = v6;
  v7 = v6;

  v8 = a2[3];
  *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
  *(_QWORD *)(a1 + 24) = v8;
  v9 = *(_OWORD *)(a2 + 5);
  v10 = *(_OWORD *)(a2 + 7);
  *(_OWORD *)(a1 + 66) = *(_OWORD *)((char *)a2 + 66);
  *(_OWORD *)(a1 + 56) = v10;
  *(_OWORD *)(a1 + 40) = v9;
  v11 = *(void **)(a1 + 88);
  v12 = (void *)a2[11];
  *(_QWORD *)(a1 + 88) = v12;
  v13 = v12;

  v14 = a2[12];
  *(_BYTE *)(a1 + 104) = *((_BYTE *)a2 + 104);
  *(_QWORD *)(a1 + 96) = v14;
  v15 = a2[14];
  *(_BYTE *)(a1 + 120) = *((_BYTE *)a2 + 120);
  *(_QWORD *)(a1 + 112) = v15;
  *(_QWORD *)(a1 + 128) = a2[16];
  *(_QWORD *)(a1 + 136) = a2[17];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16 = a2[18];
  *(_BYTE *)(a1 + 152) = *((_BYTE *)a2 + 152);
  *(_QWORD *)(a1 + 144) = v16;
  *(_QWORD *)(a1 + 160) = a2[20];
  *(_QWORD *)(a1 + 168) = a2[21];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s8SetupKit28SKStepWiFiSetupConfigurationVwta_0(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 66) = *(_OWORD *)(a2 + 66);
  v5 = *(void **)(a1 + 88);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);

  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  v6 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152);
  v7 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s8SetupKit28SKStepWiFiSetupConfigurationVwet_0(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 176))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t _s8SetupKit28SKStepWiFiSetupConfigurationVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 168) = 0;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 176) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 176) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SKStepWiFiSetupStartRequestMessage()
{
  return &type metadata for SKStepWiFiSetupStartRequestMessage;
}

ValueMetadata *type metadata accessor for SKStepWiFiSetupStartRequestMessage.ResponseMessage()
{
  return &type metadata for SKStepWiFiSetupStartRequestMessage.ResponseMessage;
}

ValueMetadata *type metadata accessor for SKStepWiFiSetupStartRequestHandler()
{
  return &type metadata for SKStepWiFiSetupStartRequestHandler;
}

ValueMetadata *type metadata accessor for WiFiJoinRetriesSKEnvironmentKey()
{
  return &type metadata for WiFiJoinRetriesSKEnvironmentKey;
}

ValueMetadata *type metadata accessor for SKStepWiFiSetupStartRequestMessage.CodingKeys()
{
  return &type metadata for SKStepWiFiSetupStartRequestMessage.CodingKeys;
}

uint64_t _s8SetupKit34SKStepWiFiSetupStartRequestMessageV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2148166EC + 4 * byte_2148588DA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21481670C + 4 * byte_2148588DF[v4]))();
}

_BYTE *sub_2148166EC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21481670C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_214816714(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21481671C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_214816724(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21481672C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SKStepWiFiSetupStartRequestMessage.ResponseMessage.CodingKeys()
{
  return &type metadata for SKStepWiFiSetupStartRequestMessage.ResponseMessage.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for SKStepWiFiSetupReport.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_214816794 + 4 * byte_2148588E9[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2148167C8 + 4 * byte_2148588E4[v4]))();
}

uint64_t sub_2148167C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2148167D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2148167D8);
  return result;
}

uint64_t sub_2148167E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2148167ECLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2148167F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2148167F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SKStepWiFiSetupReport.CodingKeys()
{
  return &type metadata for SKStepWiFiSetupReport.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SKStepWiFiSetupConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
    goto LABEL_17;
  if (a2 + 9 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 9) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 9;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 9;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 9;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v8 = v6 - 10;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SKStepWiFiSetupConfiguration.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_2148168F0 + 4 * byte_2148588F3[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_214816924 + 4 * byte_2148588EE[v4]))();
}

uint64_t sub_214816924(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21481692C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x214816934);
  return result;
}

uint64_t sub_214816940(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x214816948);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_21481694C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_214816954(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SKStepWiFiSetupConfiguration.CodingKeys()
{
  return &type metadata for SKStepWiFiSetupConfiguration.CodingKeys;
}

ValueMetadata *type metadata accessor for WiFiScanRetriesSKEnvironmentKey()
{
  return &type metadata for WiFiScanRetriesSKEnvironmentKey;
}

unint64_t sub_214816984()
{
  unint64_t result;

  result = qword_254D8EBE0[0];
  if (!qword_254D8EBE0[0])
  {
    result = MEMORY[0x2199D7540](&unk_214858E30, &type metadata for SKStepWiFiSetupConfiguration.CodingKeys);
    atomic_store(result, qword_254D8EBE0);
  }
  return result;
}

unint64_t sub_2148169CC()
{
  unint64_t result;

  result = qword_254D8EDF0;
  if (!qword_254D8EDF0)
  {
    result = MEMORY[0x2199D7540](&unk_214858EE8, &type metadata for SKStepWiFiSetupReport.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8EDF0);
  }
  return result;
}

unint64_t sub_214816A14()
{
  unint64_t result;

  result = qword_254D8F000[0];
  if (!qword_254D8F000[0])
  {
    result = MEMORY[0x2199D7540](&unk_214858FA0, &type metadata for SKStepWiFiSetupStartRequestMessage.ResponseMessage.CodingKeys);
    atomic_store(result, qword_254D8F000);
  }
  return result;
}

unint64_t sub_214816A5C()
{
  unint64_t result;

  result = qword_254D8F210[0];
  if (!qword_254D8F210[0])
  {
    result = MEMORY[0x2199D7540](&unk_214859058, &type metadata for SKStepWiFiSetupStartRequestMessage.CodingKeys);
    atomic_store(result, qword_254D8F210);
  }
  return result;
}

unint64_t sub_214816AA4()
{
  unint64_t result;

  result = qword_254D8F320;
  if (!qword_254D8F320)
  {
    result = MEMORY[0x2199D7540](&unk_214858FC8, &type metadata for SKStepWiFiSetupStartRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8F320);
  }
  return result;
}

unint64_t sub_214816AEC()
{
  unint64_t result;

  result = qword_254D8F328[0];
  if (!qword_254D8F328[0])
  {
    result = MEMORY[0x2199D7540](&unk_214858FF0, &type metadata for SKStepWiFiSetupStartRequestMessage.CodingKeys);
    atomic_store(result, qword_254D8F328);
  }
  return result;
}

unint64_t sub_214816B34()
{
  unint64_t result;

  result = qword_254D8F3B0;
  if (!qword_254D8F3B0)
  {
    result = MEMORY[0x2199D7540](&unk_214858F10, &type metadata for SKStepWiFiSetupStartRequestMessage.ResponseMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8F3B0);
  }
  return result;
}

unint64_t sub_214816B7C()
{
  unint64_t result;

  result = qword_254D8F3B8[0];
  if (!qword_254D8F3B8[0])
  {
    result = MEMORY[0x2199D7540](&unk_214858F38, &type metadata for SKStepWiFiSetupStartRequestMessage.ResponseMessage.CodingKeys);
    atomic_store(result, qword_254D8F3B8);
  }
  return result;
}

unint64_t sub_214816BC4()
{
  unint64_t result;

  result = qword_254D8F440;
  if (!qword_254D8F440)
  {
    result = MEMORY[0x2199D7540](&unk_214858E58, &type metadata for SKStepWiFiSetupReport.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8F440);
  }
  return result;
}

unint64_t sub_214816C0C()
{
  unint64_t result;

  result = qword_254D8F448[0];
  if (!qword_254D8F448[0])
  {
    result = MEMORY[0x2199D7540](&unk_214858E80, &type metadata for SKStepWiFiSetupReport.CodingKeys);
    atomic_store(result, qword_254D8F448);
  }
  return result;
}

unint64_t sub_214816C54()
{
  unint64_t result;

  result = qword_254D8F4D0;
  if (!qword_254D8F4D0)
  {
    result = MEMORY[0x2199D7540](&unk_214858DA0, &type metadata for SKStepWiFiSetupConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8F4D0);
  }
  return result;
}

unint64_t sub_214816C9C()
{
  unint64_t result;

  result = qword_254D8F4D8[0];
  if (!qword_254D8F4D8[0])
  {
    result = MEMORY[0x2199D7540](&unk_214858DC8, &type metadata for SKStepWiFiSetupConfiguration.CodingKeys);
    atomic_store(result, qword_254D8F4D8);
  }
  return result;
}

uint64_t sub_214816CE0(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_2148526F8();
    return sub_214852758();
  }
  return result;
}

uint64_t sub_214816D68(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_214816E28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_2148522E4();
  swift_allocObject();
  result = sub_2148522A8();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_21485238C();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_214816EA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_2148522E4();
  swift_allocObject();
  result = sub_2148522A8();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

_BYTE *sub_214816F20(_BYTE *result, _BYTE *a2)
{
  uint64_t v2;

  if (result)
  {
    v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (_BYTE *)sub_214816D68(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (_BYTE *)sub_214816E28((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (_BYTE *)sub_214816EA0((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_214816F84(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      sub_2148522E4();
      swift_allocObject();
      sub_2148522C0();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_21485238C();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_214817020(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6C656E6E616863 && a2 == 0xE700000000000000;
  if (v2 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E696F4A6B636F6DLL && a2 == 0xED0000726F727245 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E696F4A6B636F6DLL && a2 == 0xEC000000656D6954 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6F7065526B636F6DLL && a2 == 0xEA00000000007472 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6E6163536B636F6DLL && a2 == 0xED0000726F727245 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6E6163536B636F6DLL && a2 == 0xEC000000656D6954 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x727465526E696F6ALL && a2 == 0xEB00000000736569 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x64726F7773736170 && a2 == 0xEE00676E69727453 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x727465526E616373 && a2 == 0xEB00000000736569 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x6972745364697373 && a2 == 0xEA0000000000676ELL)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    v6 = sub_214852B18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 9;
    else
      return 10;
  }
}

uint64_t sub_2148174CC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x656D69546E696F6ALL && a2 == 0xE800000000000000;
  if (v2 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1769173874 && a2 == 0xE400000000000000 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656D69546E616373 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_214852B18();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  return sub_2147F2530(a2 + 32, a1 + 32);
}

uint64_t block_destroy_helper_1(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_0(a1 + 32);
}

unint64_t sub_214817638()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D88F40;
  if (!qword_254D88F40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D88F38);
    result = MEMORY[0x2199D7540](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_254D88F40);
  }
  return result;
}

uint64_t sub_214817684(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F70);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *sub_2148176C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[2];

  v5 = *(uint64_t **)(v3 + 16);
  v7 = *v5;
  v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  result = sub_21481553C((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_21481774C, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_214817720(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2147F8898(a1, a2);
  return a1;
}

uint64_t sub_214817734(__int128 *a1, uint64_t a2)
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

uint64_t sub_21481774C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_214815948(a1, a2);
}

uint64_t sub_214817770()
{
  uint64_t v0;

  v0 = sub_214852494();
  __swift_allocate_value_buffer(v0, qword_254D8F568);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D8F568);
  sub_214801FC0();
  swift_bridgeObjectRetain();
  return sub_214852488();
}

uint64_t SKServer.environment.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8SetupKit8SKServer_environment);
  return swift_bridgeObjectRetain();
}

uint64_t SKServer.__allocating_init(configuration:environment:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  SKServer.init(configuration:environment:)(a1, a2);
  return v4;
}

uint64_t SKServer.init(configuration:environment:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v3 = v2;
  v6 = sub_21485250C();
  MEMORY[0x24BDAC7A8](v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D881B0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_214852584();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  MEMORY[0x24BDAC7A8](v15);
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = 0;
  *(_BYTE *)(v3 + 32) = 0;
  *(_BYTE *)(v3 + OBJC_IVAR____TtC8SetupKit8SKServer__updatePending) = 0;
  *(_BYTE *)(v3 + OBJC_IVAR____TtC8SetupKit8SKServer__updateRunning) = 0;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC8SetupKit8SKServer__eventContinuations) = MEMORY[0x24BEE4B00];
  v16 = *a2;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC8SetupKit8SKServer__nexusEventTask) = 0;
  *(_BYTE *)(v3 + OBJC_IVAR____TtC8SetupKit8SKServer__nexusStarted) = 0;
  sub_21481C744(a1, v3 + OBJC_IVAR____TtC8SetupKit8SKServer__configuration, type metadata accessor for SKServerConfiguration);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC8SetupKit8SKServer_environment) = v16;
  v17 = type metadata accessor for SKServerConfiguration(0);
  sub_21481D3AC(a1 + *(int *)(v17 + 20), (uint64_t)v9, &qword_254D881B0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    v21 = v16;
    swift_bridgeObjectRetain();
    SKEnvironmentValues.nexusSessionConfiguration.getter();
    sub_2147F275C((uint64_t)v9, &qword_254D881B0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v14, v9, v10);
    swift_bridgeObjectRetain();
  }
  sub_21485262C();
  sub_214852554();
  sub_214852560();
  v21 = v16;
  SKEnvironmentValues.nexusEnvironment.getter();
  swift_bridgeObjectRelease();
  v18 = sub_214852590();
  sub_2147FE778(a1, type metadata accessor for SKServerConfiguration);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC8SetupKit8SKServer_nexusSession) = v18;
  return v3;
}

uint64_t type metadata accessor for SKServerConfiguration(uint64_t a1)
{
  return sub_2147FC1A0(a1, (uint64_t *)&unk_254D8F8E0);
}

uint64_t SKServer.deinit()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  int64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  int64_t v35;
  _QWORD *v36;
  unint64_t v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F78);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F80);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v34 - v10;
  if (qword_254D8F560 == -1)
    goto LABEL_2;
  while (1)
  {
    swift_once();
LABEL_2:
    v12 = sub_214852494();
    __swift_project_value_buffer(v12, (uint64_t)qword_254D8F568);
    v13 = sub_21485247C();
    v14 = sub_2148528C0();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_2147EE000, v13, v14, "deinit", v15, 2u);
      MEMORY[0x2199D75E8](v15, -1, -1);
    }

    v37 = v1;
    v16 = (_QWORD *)(v1 + OBJC_IVAR____TtC8SetupKit8SKServer__eventContinuations);
    swift_beginAccess();
    v17 = *v16;
    v18 = *(_QWORD *)(*v16 + 64);
    v38 = *v16 + 64;
    v19 = 1 << *(_BYTE *)(v17 + 32);
    v20 = -1;
    if (v19 < 64)
      v20 = ~(-1 << v19);
    v1 = v20 & v18;
    v39 = (unint64_t)(v19 + 63) >> 6;
    v40 = v17;
    v35 = v39 - 1;
    v36 = v16;
    result = swift_bridgeObjectRetain();
    v22 = 0;
    if (v1)
    {
      while (1)
      {
        v23 = __clz(__rbit64(v1));
        v1 &= v1 - 1;
        v24 = v23 | (v22 << 6);
LABEL_10:
        v25 = *(_QWORD *)(v40 + 56);
        *(_QWORD *)v9 = *(_QWORD *)(*(_QWORD *)(v40 + 48) + 8 * v24);
        v26 = v25 + *(_QWORD *)(v3 + 72) * v24;
        v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F88);
        (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(&v9[*(int *)(v27 + 48)], v26, v2);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v9, 0, 1, v27);
LABEL_29:
        sub_21481E444((uint64_t)v9, (uint64_t)v11, &qword_254D88F80);
        v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F88);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 48))(v11, 1, v32) == 1)
          break;
        (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, &v11[*(int *)(v32 + 48)], v2);
        sub_214852830();
        result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
        if (!v1)
          goto LABEL_11;
      }
      swift_release();
      *v36 = MEMORY[0x24BEE4B00];
      swift_bridgeObjectRelease();
      v33 = v37;
      swift_unknownObjectRelease();
      sub_2147FE778(v33 + OBJC_IVAR____TtC8SetupKit8SKServer__configuration, type metadata accessor for SKServerConfiguration);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      return v33;
    }
LABEL_11:
    v28 = v22 + 1;
    if (!__OFADD__(v22, 1))
      break;
    __break(1u);
  }
  if (v28 >= v39)
    goto LABEL_28;
  v29 = *(_QWORD *)(v38 + 8 * v28);
  if (v29)
  {
LABEL_14:
    v1 = (v29 - 1) & v29;
    v24 = __clz(__rbit64(v29)) + (v28 << 6);
    v22 = v28;
    goto LABEL_10;
  }
  v30 = v22 + 2;
  ++v22;
  if (v28 + 1 >= v39)
    goto LABEL_28;
  v29 = *(_QWORD *)(v38 + 8 * v30);
  if (v29)
  {
LABEL_17:
    v28 = v30;
    goto LABEL_14;
  }
  v22 = v28 + 1;
  if (v28 + 2 >= v39)
    goto LABEL_28;
  v29 = *(_QWORD *)(v38 + 8 * (v28 + 2));
  if (v29)
  {
    v28 += 2;
    goto LABEL_14;
  }
  v30 = v28 + 3;
  v22 = v28 + 2;
  if (v28 + 3 >= v39)
  {
LABEL_28:
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F88);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v9, 1, 1, v31);
    v1 = 0;
    goto LABEL_29;
  }
  v29 = *(_QWORD *)(v38 + 8 * v30);
  if (v29)
    goto LABEL_17;
  while (1)
  {
    v28 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v28 >= v39)
    {
      v22 = v35;
      goto LABEL_28;
    }
    v29 = *(_QWORD *)(v38 + 8 * v28);
    ++v30;
    if (v29)
      goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t SKServer.__deallocating_deinit()
{
  SKServer.deinit();
  return swift_deallocClassInstance();
}

uint64_t SKServer.start()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[3] = v0;
  v1[4] = type metadata accessor for SKServer.Event(0);
  v1[5] = swift_task_alloc();
  sub_2147F9F94(&qword_254D88F98, type metadata accessor for SKServer, (uint64_t)&protocol conformance descriptor for SKServer);
  v1[6] = sub_2148527C4();
  v1[7] = v2;
  return swift_task_switch();
}

uint64_t sub_214818024()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t ObjectType;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;

  if (qword_254D8F560 != -1)
    swift_once();
  v1 = (uint64_t *)(v0 + 24);
  v2 = sub_214852494();
  *(_QWORD *)(v0 + 64) = __swift_project_value_buffer(v2, (uint64_t)qword_254D8F568);
  swift_retain_n();
  v3 = sub_21485247C();
  v4 = sub_2148528D8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v26 = v6;
    *(_DWORD *)v5 = 136315138;
    if ((swift_task_isCurrentExecutor() & 1) == 0)
      swift_task_reportUnexpectedExecutor();
    v7 = SKServerConfiguration.description.getter();
    *(_QWORD *)(v0 + 16) = sub_2147F3D14(v7, v8, &v26);
    sub_21485292C();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_2147EE000, v3, v4, "start: %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v6, -1, -1);
    MEMORY[0x2199D75E8](v5, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  v9 = *v1;
  if ((*(_BYTE *)(*v1 + 32) & 1) != 0)
    goto LABEL_14;
  v10 = OBJC_IVAR____TtC8SetupKit8SKServer__updateRunning;
  *(_QWORD *)(v0 + 72) = OBJC_IVAR____TtC8SetupKit8SKServer__updateRunning;
  v11 = (uint64_t *)(v0 + 72);
  v12 = 1;
  if (*(_BYTE *)(v9 + v10) == 1)
  {
    v11 = &OBJC_IVAR____TtC8SetupKit8SKServer__updatePending;
LABEL_13:
    *(_BYTE *)(v9 + *v11) = v12;
LABEL_14:
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  *(_BYTE *)(v9 + v10) = 1;
  v13 = OBJC_IVAR____TtC8SetupKit8SKServer__updatePending;
  v14 = OBJC_IVAR____TtC8SetupKit8SKServer__configuration;
  *(_QWORD *)(v0 + 80) = OBJC_IVAR____TtC8SetupKit8SKServer__updatePending;
  *(_QWORD *)(v0 + 88) = v14;
  v15 = *(_QWORD *)(v0 + 24);
  *(_BYTE *)(v15 + v13) = 0;
  v9 = *(_QWORD *)(v0 + 24);
  if ((*(_BYTE *)(v15 + 32) & 1) != 0)
  {
    v12 = 0;
    goto LABEL_13;
  }
  if ((*(_BYTE *)(v9 + *(_QWORD *)(v0 + 88) + 12) & 1) != 0)
  {
    if (*(_QWORD *)(v9 + 16))
    {
      v17 = *(_QWORD *)(v9 + 24);
      swift_unknownObjectRetain();
      v18 = sub_21485247C();
      v19 = sub_2148528D8();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_2147EE000, v18, v19, "bluetooth advertiser stop", v20, 2u);
        MEMORY[0x2199D75E8](v20, -1, -1);
      }
      v21 = *(_QWORD *)(v0 + 40);
      v22 = *(_QWORD *)(v0 + 24);

      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t))(v17 + 24))(ObjectType, v17);
      *(_QWORD *)(v22 + 16) = 0;
      *(_QWORD *)(v22 + 24) = 0;
      swift_unknownObjectRelease();
      swift_storeEnumTagMultiPayload();
      SKServer._report(event:)(v21);
      swift_unknownObjectRelease();
      sub_2147FE778(v21, type metadata accessor for SKServer.Event);
    }
    v24 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v24;
    *v24 = v0;
    v24[1] = sub_214818464;
    return sub_2148196D4();
  }
  else
  {
    v25 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v25;
    *v25 = v0;
    v25[1] = sub_214818400;
    return sub_214819008();
  }
}

uint64_t sub_214818400()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = *v0;
  v4 = *v0;
  swift_task_dealloc();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 104) = v2;
  *v2 = v4;
  v2[1] = sub_214818464;
  return sub_2148196D4();
}

uint64_t sub_214818464()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2148184B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  _QWORD *v12;
  _QWORD *v13;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 24);
  if ((*(_BYTE *)(v2 + v1) & 1) != 0
    && (*(_BYTE *)(v2 + v1) = 0, v3 = *(_BYTE *)(v2 + 32), v2 = *(_QWORD *)(v0 + 24), (v3 & 1) == 0))
  {
    if ((*(_BYTE *)(v2 + *(_QWORD *)(v0 + 88) + 12) & 1) != 0)
    {
      if (*(_QWORD *)(v2 + 16))
      {
        v5 = *(_QWORD *)(v2 + 24);
        swift_unknownObjectRetain();
        v6 = sub_21485247C();
        v7 = sub_2148528D8();
        if (os_log_type_enabled(v6, v7))
        {
          v8 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_2147EE000, v6, v7, "bluetooth advertiser stop", v8, 2u);
          MEMORY[0x2199D75E8](v8, -1, -1);
        }
        v9 = *(_QWORD *)(v0 + 40);
        v10 = *(_QWORD *)(v0 + 24);

        ObjectType = swift_getObjectType();
        (*(void (**)(uint64_t, uint64_t))(v5 + 24))(ObjectType, v5);
        *(_QWORD *)(v10 + 16) = 0;
        *(_QWORD *)(v10 + 24) = 0;
        swift_unknownObjectRelease();
        swift_storeEnumTagMultiPayload();
        SKServer._report(event:)(v9);
        swift_unknownObjectRelease();
        sub_2147FE778(v9, type metadata accessor for SKServer.Event);
      }
      v12 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 104) = v12;
      *v12 = v0;
      v12[1] = sub_214818464;
      return sub_2148196D4();
    }
    else
    {
      v13 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 96) = v13;
      *v13 = v0;
      v13[1] = sub_214818400;
      return sub_214819008();
    }
  }
  else
  {
    *(_BYTE *)(v2 + *(_QWORD *)(v0 + 72)) = 0;
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t SKServer.cancel()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[2] = v0;
  sub_2147F9F94(&qword_254D88F98, type metadata accessor for SKServer, (uint64_t)&protocol conformance descriptor for SKServer);
  v1[3] = sub_2148527C4();
  v1[4] = v2;
  return swift_task_switch();
}

uint64_t sub_2148186F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _QWORD *v7;

  v1 = *(_QWORD *)(v0 + 16);
  if ((*(_BYTE *)(v1 + 32) & 1) != 0)
    return (*(uint64_t (**)(void))(v0 + 8))();
  if (qword_254D8F560 != -1)
    swift_once();
  v3 = sub_214852494();
  __swift_project_value_buffer(v3, (uint64_t)qword_254D8F568);
  v4 = sub_21485247C();
  v5 = sub_2148528D8();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2147EE000, v4, v5, "cancel", v6, 2u);
    MEMORY[0x2199D75E8](v6, -1, -1);
  }

  *(_BYTE *)(v1 + 32) = 1;
  sub_2148188A8();
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v7;
  *v7 = v0;
  v7[1] = sub_21481882C;
  return sub_214818A3C();
}

uint64_t sub_21481882C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_214818878()
{
  uint64_t v0;

  sub_214818CA0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2148188A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  char *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t ObjectType;
  uint64_t v13;

  v1 = type metadata accessor for SKServer.Event(0);
  result = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (_QWORD *)(v0 + 16);
  if (*(_QWORD *)(v0 + 16))
  {
    v6 = *(_QWORD *)(v0 + 24);
    v7 = qword_254D8F560;
    swift_unknownObjectRetain();
    if (v7 != -1)
      swift_once();
    v8 = sub_214852494();
    __swift_project_value_buffer(v8, (uint64_t)qword_254D8F568);
    v9 = sub_21485247C();
    v10 = sub_2148528D8();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_2147EE000, v9, v10, "bluetooth advertiser stop", v11, 2u);
      MEMORY[0x2199D75E8](v11, -1, -1);
    }

    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v6 + 24))(ObjectType, v6);
    *v5 = 0;
    v5[1] = 0;
    swift_unknownObjectRelease();
    swift_storeEnumTagMultiPayload();
    SKServer._report(event:)((uint64_t)v4);
    swift_unknownObjectRelease();
    return sub_2147FE778((uint64_t)v4, type metadata accessor for SKServer.Event);
  }
  return result;
}

uint64_t sub_214818A3C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  sub_2147F9F94(&qword_254D88F98, type metadata accessor for SKServer, (uint64_t)&protocol conformance descriptor for SKServer);
  sub_2148527C4();
  return swift_task_switch();
}

uint64_t sub_214818AA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v10;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = OBJC_IVAR____TtC8SetupKit8SKServer__nexusStarted;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC8SetupKit8SKServer__nexusStarted) != 1)
    return (*(uint64_t (**)(void))(v0 + 8))();
  if (qword_254D8F560 != -1)
    swift_once();
  v3 = sub_214852494();
  __swift_project_value_buffer(v3, (uint64_t)qword_254D8F568);
  v4 = sub_21485247C();
  v5 = sub_2148528D8();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2147EE000, v4, v5, "nexus stop", v6, 2u);
    MEMORY[0x2199D75E8](v6, -1, -1);
  }
  v7 = *(_QWORD *)(v0 + 16);

  *(_BYTE *)(v1 + v2) = 0;
  v8 = OBJC_IVAR____TtC8SetupKit8SKServer__nexusEventTask;
  if (*(_QWORD *)(v7 + OBJC_IVAR____TtC8SetupKit8SKServer__nexusEventTask))
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D88210);
    sub_214852854();
    swift_release();
  }
  *(_QWORD *)(v7 + v8) = 0;
  swift_release();
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v10;
  *v10 = v0;
  v10[1] = sub_214818C58;
  return sub_2148525F0();
}

uint64_t sub_214818C58()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_214818CA0()
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
  uint64_t result;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  int64_t v33;
  uint64_t v34;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F78);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F80);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v30 - v10;
  if (*(_BYTE *)(v0 + 32) != 1)
    return result;
  v12 = (_QWORD *)(v0 + OBJC_IVAR____TtC8SetupKit8SKServer__eventContinuations);
  swift_beginAccess();
  v13 = *v12;
  v15 = (_QWORD *)(*v12 + 64);
  v14 = *v15;
  v31 = v12;
  v32 = v15;
  v16 = 1 << *(_BYTE *)(v13 + 32);
  v17 = -1;
  if (v16 < 64)
    v17 = ~(-1 << v16);
  v18 = v17 & v14;
  v33 = (unint64_t)(v16 + 63) >> 6;
  v34 = v13;
  v30 = v33 - 1;
  result = swift_bridgeObjectRetain();
  v19 = 0;
  if (!v18)
    goto LABEL_9;
LABEL_7:
  v20 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  v21 = v20 | (v19 << 6);
  while (2)
  {
    v22 = *(_QWORD *)(v34 + 56);
    *(_QWORD *)v8 = *(_QWORD *)(*(_QWORD *)(v34 + 48) + 8 * v21);
    v23 = v22 + *(_QWORD *)(v2 + 72) * v21;
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F88);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(&v8[*(int *)(v24 + 48)], v23, v1);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v8, 0, 1, v24);
    while (1)
    {
      sub_21481E444((uint64_t)v8, (uint64_t)v11, &qword_254D88F80);
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F88);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 48))(v11, 1, v29) == 1)
      {
        swift_release();
        *v31 = MEMORY[0x24BEE4B00];
        return swift_bridgeObjectRelease();
      }
      (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, &v11[*(int *)(v29 + 48)], v1);
      sub_214852830();
      result = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      if (v18)
        goto LABEL_7;
LABEL_9:
      v25 = v19 + 1;
      if (__OFADD__(v19, 1))
      {
        __break(1u);
        goto LABEL_31;
      }
      if (v25 < v33)
      {
        v26 = v32[v25];
        if (v26)
          goto LABEL_12;
        v27 = v19 + 2;
        ++v19;
        if (v25 + 1 < v33)
        {
          v26 = v32[v27];
          if (v26)
            goto LABEL_15;
          v19 = v25 + 1;
          if (v25 + 2 < v33)
          {
            v26 = v32[v25 + 2];
            if (v26)
            {
              v25 += 2;
              goto LABEL_12;
            }
            v27 = v25 + 3;
            v19 = v25 + 2;
            if (v25 + 3 < v33)
              break;
          }
        }
      }
LABEL_26:
      v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F88);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v8, 1, 1, v28);
      v18 = 0;
    }
    v26 = v32[v27];
    if (v26)
    {
LABEL_15:
      v25 = v27;
LABEL_12:
      v18 = (v26 - 1) & v26;
      v21 = __clz(__rbit64(v26)) + (v25 << 6);
      v19 = v25;
      continue;
    }
    break;
  }
  while (1)
  {
    v25 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v25 >= v33)
    {
      v19 = v30;
      goto LABEL_26;
    }
    v26 = v32[v25];
    ++v27;
    if (v26)
      goto LABEL_12;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_214819008()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[8] = v0;
  v1[9] = type metadata accessor for SKServer.Event(0);
  v1[10] = swift_task_alloc();
  sub_2147F9F94(&qword_254D88F98, type metadata accessor for SKServer, (uint64_t)&protocol conformance descriptor for SKServer);
  v1[11] = sub_2148527C4();
  v1[12] = v2;
  return swift_task_switch();
}

uint64_t sub_214819098()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  unint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(unint64_t *, uint64_t *, uint64_t, uint64_t);
  uint64_t v20;
  _QWORD *v21;
  int v22;
  int v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  unint64_t v25;
  int v26;
  uint64_t v27;

  v1 = *(_QWORD *)(v0 + 64);
  if (*(_QWORD *)(v1 + 16)
    || (v2 = v1 + OBJC_IVAR____TtC8SetupKit8SKServer__configuration,
        (*(_BYTE *)(v1 + OBJC_IVAR____TtC8SetupKit8SKServer__configuration + 12) & 1) != 0))
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v4 = *(_DWORD *)(v2 + 8);
    v5 = *(_QWORD *)v2;
    if (qword_254D8F560 != -1)
      swift_once();
    v6 = sub_214852494();
    *(_QWORD *)(v0 + 104) = __swift_project_value_buffer(v6, (uint64_t)qword_254D8F568);
    v7 = sub_21485247C();
    v8 = sub_2148528D8();
    v9 = HIDWORD(v5);
    if (os_log_type_enabled(v7, v8))
    {
      v23 = v4;
      v10 = (uint8_t *)swift_slowAlloc();
      v22 = v5;
      v5 = swift_slowAlloc();
      *(_DWORD *)v10 = 136315138;
      v25 = v5;
      *(_DWORD *)(v0 + 152) = v22;
      *(_BYTE *)(v0 + 156) = v9;
      *(_DWORD *)(v0 + 160) = v23;
      sub_21481D3F0();
      v11 = sub_214852B00();
      *(_QWORD *)(v0 + 56) = sub_2147F3D14(v11, v12, (uint64_t *)&v25);
      sub_21485292C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2147EE000, v7, v8, "bluetooth advertiser start: %s", v10, 0xCu);
      swift_arrayDestroy();
      v13 = v5;
      LODWORD(v5) = v22;
      MEMORY[0x2199D75E8](v13, -1, -1);
      v14 = v10;
      v4 = v23;
      MEMORY[0x2199D75E8](v14, -1, -1);
    }

    v25 = *(_QWORD *)(*(_QWORD *)(v0 + 64) + OBJC_IVAR____TtC8SetupKit8SKServer_environment);
    v15 = v25;
    v16 = SKEnvironmentValues.bluetoothAdvertiser.getter();
    v18 = v17;
    *(_QWORD *)(v0 + 112) = v16;
    *(_QWORD *)(v0 + 120) = v17;
    LODWORD(v25) = v5;
    BYTE4(v25) = v9;
    v26 = v4;
    v27 = v15;
    v19 = *(uint64_t (**)(unint64_t *, uint64_t *, uint64_t, uint64_t))(v17 + 8);
    swift_bridgeObjectRetain();
    v20 = v19(&v25, &v27, v16, v18);
    *(_QWORD *)(v0 + 128) = v20;
    *(_QWORD *)(v1 + 16) = v20;
    *(_QWORD *)(v1 + 24) = v18;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    v24 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v18 + 16) + *(_QWORD *)(v18 + 16));
    v21 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v21;
    *v21 = v0;
    v21[1] = sub_214819358;
    return v24(v16, v18);
  }
}

uint64_t sub_214819358()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2148193B8()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;

  v1 = sub_21485247C();
  v2 = sub_2148528D8();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2147EE000, v1, v2, "bluetooth advertiser started", v3, 2u);
    MEMORY[0x2199D75E8](v3, -1, -1);
  }
  v4 = *(_QWORD *)(v0 + 80);

  swift_storeEnumTagMultiPayload();
  SKServer._report(event:)(v4);
  swift_unknownObjectRelease();
  sub_2147FE778(v4, type metadata accessor for SKServer.Event);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2148194A4()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v18;

  v1 = *(void **)(v0 + 144);
  v2 = v1;
  v3 = v1;
  v4 = sub_21485247C();
  v5 = sub_2148528CC();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 144);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v18 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_getErrorValue();
    v9 = sub_214852B6C();
    *(_QWORD *)(v0 + 48) = sub_2147F3D14(v9, v10, &v18);
    sub_21485292C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2147EE000, v4, v5, "### bluetooth advertiser start failed: error=%s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v8, -1, -1);
    MEMORY[0x2199D75E8](v7, -1, -1);
  }
  else
  {
    v11 = *(void **)(v0 + 144);

  }
  v12 = *(void **)(v0 + 144);
  v13 = *(uint64_t **)(v0 + 80);
  v14 = *(_QWORD *)(v0 + 64);
  (*(void (**)(_QWORD))(*(_QWORD *)(v0 + 120) + 24))(*(_QWORD *)(v0 + 112));
  *(_QWORD *)(v14 + 16) = 0;
  *(_QWORD *)(v14 + 24) = 0;
  swift_unknownObjectRelease();
  v15 = objc_allocWithZone((Class)sub_214852464());
  v16 = v12;
  *v13 = sub_214852470();
  swift_storeEnumTagMultiPayload();
  SKServer._report(event:)((uint64_t)v13);

  swift_unknownObjectRelease();
  sub_2147FE778((uint64_t)v13, type metadata accessor for SKServer.Event);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2148196D4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1[3] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88728);
  v1[4] = swift_task_alloc();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D892C0);
  v1[5] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[6] = v3;
  v1[7] = *(_QWORD *)(v3 + 64);
  v1[8] = swift_task_alloc();
  v1[9] = swift_task_alloc();
  v1[10] = type metadata accessor for SKServerConfiguration(0);
  v1[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D881B0);
  v1[12] = swift_task_alloc();
  v4 = sub_214852494();
  v1[13] = v4;
  v1[14] = *(_QWORD *)(v4 - 8);
  v1[15] = swift_task_alloc();
  sub_2147F9F94(&qword_254D88F98, type metadata accessor for SKServer, (uint64_t)&protocol conformance descriptor for SKServer);
  v1[16] = sub_2148527C4();
  v1[17] = v5;
  return swift_task_switch();
}

uint64_t sub_21481981C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = OBJC_IVAR____TtC8SetupKit8SKServer__nexusStarted;
  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC8SetupKit8SKServer__nexusStarted) & 1) != 0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    if (qword_254D8F560 != -1)
      swift_once();
    v5 = *(_QWORD *)(v0 + 112);
    v4 = *(_QWORD *)(v0 + 120);
    v6 = *(_QWORD *)(v0 + 104);
    v7 = __swift_project_value_buffer(v6, (uint64_t)qword_254D8F568);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
    swift_retain_n();
    v8 = sub_21485247C();
    v9 = sub_2148528D8();
    if (os_log_type_enabled(v8, v9))
    {
      v29 = v9;
      v30 = v2;
      v10 = (uint8_t *)swift_slowAlloc();
      v28 = swift_slowAlloc();
      v31 = v28;
      *(_DWORD *)v10 = 136315138;
      if ((swift_task_isCurrentExecutor() & 1) == 0)
        swift_task_reportUnexpectedExecutor();
      v12 = *(_QWORD *)(v0 + 88);
      v11 = *(_QWORD *)(v0 + 96);
      v13 = *(_QWORD *)(v0 + 80);
      sub_21481C744(*(_QWORD *)(v0 + 24) + OBJC_IVAR____TtC8SetupKit8SKServer__configuration, v12, type metadata accessor for SKServerConfiguration);
      sub_21481E444(v12 + *(int *)(v13 + 20), v11, &qword_254D881B0);
      v14 = sub_214852584();
      v15 = *(_QWORD *)(v14 - 8);
      v16 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v11, 1, v14);
      v17 = *(_QWORD *)(v0 + 96);
      if (v16 == 1)
      {
        sub_2147F275C(*(_QWORD *)(v0 + 96), &qword_254D881B0);
        v18 = 0xE900000000000067;
        v19 = 0x69666E6F63206F6ELL;
      }
      else
      {
        v19 = sub_21485256C();
        v18 = v23;
        (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v14);
      }
      v24 = *(_QWORD *)(v0 + 112);
      v26 = *(_QWORD *)(v0 + 104);
      v27 = *(_QWORD *)(v0 + 120);
      *(_QWORD *)(v0 + 16) = sub_2147F3D14(v19, v18, &v31);
      sub_21485292C();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_2147EE000, v8, v29, "nexus start: %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199D75E8](v28, -1, -1);
      MEMORY[0x2199D75E8](v10, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v27, v26);
      v2 = v30;
    }
    else
    {
      v21 = *(_QWORD *)(v0 + 112);
      v20 = *(_QWORD *)(v0 + 120);
      v22 = *(_QWORD *)(v0 + 104);
      swift_release_n();

      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
    }
    v25 = *(_QWORD *)(v0 + 24);
    *(_BYTE *)(v1 + v2) = 1;
    *(_QWORD *)(v0 + 144) = *(_QWORD *)(v25 + OBJC_IVAR____TtC8SetupKit8SKServer_nexusSession);
    sub_21485262C();
    sub_2147F9F94(&qword_254D88200, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC80], MEMORY[0x24BE6DC90]);
    sub_2148527C4();
    return swift_task_switch();
  }
}

uint64_t sub_214819BE8()
{
  sub_2148525FC();
  return swift_task_switch();
}

uint64_t sub_214819C24()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v1 = v0[8];
  v2 = v0[9];
  v3 = v0[6];
  v4 = v0[7];
  v5 = v0[4];
  v6 = v0[5];
  v7 = v0[3];
  v8 = sub_214852800();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v6);
  v10 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = 0;
  *(_QWORD *)(v11 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v11 + v10, v1, v6);
  *(_QWORD *)(v11 + ((v4 + v10 + 7) & 0xFFFFFFFFFFFFFFF8)) = v9;
  *(_QWORD *)(v7 + OBJC_IVAR____TtC8SetupKit8SKServer__nexusEventTask) = sub_21481BEEC(v5, (uint64_t)&unk_254D892D0, v11);
  swift_release();
  v12 = (_QWORD *)swift_task_alloc();
  v0[19] = v12;
  *v12 = v0;
  v12[1] = sub_214819D74;
  return sub_2148525E4();
}

uint64_t sub_214819D74()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_214819DC0()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 48) + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 40));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SKServer.perform(command:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[3] = a1;
  v2[4] = v1;
  v3 = sub_214852614();
  v2[5] = v3;
  v2[6] = *(_QWORD *)(v3 - 8);
  v2[7] = swift_task_alloc();
  v2[8] = swift_task_alloc();
  type metadata accessor for SKServer.Command(0);
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  sub_2147F9F94(&qword_254D88F98, type metadata accessor for SKServer, (uint64_t)&protocol conformance descriptor for SKServer);
  v2[12] = sub_2148527C4();
  v2[13] = v4;
  return swift_task_switch();
}

uint64_t sub_214819F2C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  os_log_type_t type;
  uint64_t v25;

  if (qword_254D8F560 != -1)
    swift_once();
  v1 = v0[3];
  v2 = v0[11];
  v3 = sub_214852494();
  __swift_project_value_buffer(v3, (uint64_t)qword_254D8F568);
  sub_21481C744(v1, v2, type metadata accessor for SKServer.Command);
  v4 = sub_21485247C();
  v5 = sub_2148528D8();
  v6 = os_log_type_enabled(v4, v5);
  v7 = v0[11];
  if (v6)
  {
    v8 = v0[10];
    type = v5;
    v9 = v0[8];
    v11 = v0[5];
    v10 = v0[6];
    v12 = (uint8_t *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v25 = v23;
    *(_DWORD *)v12 = 136315138;
    sub_21481C744(v7, v8, type metadata accessor for SKServer.Command);
    v13 = v10;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v9, v8, v11);
    sub_2147F9F94(&qword_254D88FC8, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC58], MEMORY[0x24BE6DC68]);
    v14 = sub_214852B00();
    v16 = v15;
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v9, v11);
    v0[2] = sub_2147F3D14(v14, v16, &v25);
    sub_21485292C();
    swift_bridgeObjectRelease();
    sub_2147FE778(v7, type metadata accessor for SKServer.Command);
    _os_log_impl(&dword_2147EE000, v4, type, "perform command: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v23, -1, -1);
    MEMORY[0x2199D75E8](v12, -1, -1);
  }
  else
  {
    sub_2147FE778(v0[11], type metadata accessor for SKServer.Command);
  }

  v17 = v0[9];
  v19 = v0[6];
  v18 = v0[7];
  v20 = v0[5];
  sub_21481C744(v0[3], v17, type metadata accessor for SKServer.Command);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v18, v17, v20);
  v21 = (_QWORD *)swift_task_alloc();
  v0[14] = v21;
  *v21 = v0;
  v21[1] = sub_21481A1E8;
  return sub_214852620();
}

uint64_t sub_21481A1E8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21481A248()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 48) + 8))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 40));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21481A2C8()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 48) + 8))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 40));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SKServer.Command.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(_QWORD);
  uint64_t v10;
  uint64_t v12;

  v1 = sub_214852614();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC58];
  v3 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for SKServer.Command(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21481C744(v0, (uint64_t)v8, v9);
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v1);
  sub_2147F9F94(&qword_254D88FC8, v2, MEMORY[0x24BE6DC68]);
  v10 = sub_214852B00();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v1);
  return v10;
}

uint64_t static SKServer.Command.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v15;

  v4 = sub_214852614();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88FD0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t)&v11[*(int *)(v9 + 48)];
  sub_21481C744(a1, (uint64_t)v11, type metadata accessor for SKServer.Command);
  sub_21481C744(a2, v12, type metadata accessor for SKServer.Command);
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, v4);
  LOBYTE(a2) = sub_214852608();
  v13 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v13(v12, v4);
  v13((uint64_t)v7, v4);
  return a2 & 1;
}

uint64_t sub_21481A578()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v1 = sub_214852614();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC58];
  v3 = *(_QWORD *)(v1 - 8);
  v4 = MEMORY[0x24BDAC7A8](v1);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21481C744(v0, (uint64_t)v8, type metadata accessor for SKServer.Command);
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v8, v1);
  sub_2147F9F94(&qword_254D88FC8, v2, MEMORY[0x24BE6DC68]);
  v9 = sub_214852B00();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v1);
  return v9;
}

uint64_t sub_21481A684(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v15;

  v4 = sub_214852614();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88FD0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t)&v11[*(int *)(v9 + 48)];
  sub_21481C744(a1, (uint64_t)v11, type metadata accessor for SKServer.Command);
  sub_21481C744(a2, v12, type metadata accessor for SKServer.Command);
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, v4);
  LOBYTE(a2) = sub_214852608();
  v13 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v13(v12, v4);
  v13((uint64_t)v7, v4);
  return a2 & 1;
}

uint64_t SKServer.events.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
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
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;

  v2 = v1;
  v23[1] = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88FD8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88FE0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F78);
  v24 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = CUNextID64();
  if (qword_254D8F560 != -1)
    swift_once();
  v14 = sub_214852494();
  __swift_project_value_buffer(v14, (uint64_t)qword_254D8F568);
  v15 = sub_21485247C();
  v16 = sub_2148528B4();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v23[0] = v2;
    v18 = v17;
    *(_DWORD *)v17 = 134217984;
    v25 = v13;
    sub_21485292C();
    _os_log_impl(&dword_2147EE000, v15, v16, "event monitor start: id=%llu", v18, 0xCu);
    MEMORY[0x2199D75E8](v18, -1, -1);
  }

  type metadata accessor for SKServer.Event(0);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BEE6A10], v6);
  sub_21485280C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v19 = v24;
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v5, v12, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v5, 0, 1, v10);
  swift_beginAccess();
  sub_21481AA9C((uint64_t)v5, v13);
  swift_endAccess();
  v20 = swift_allocObject();
  swift_weakInit();
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v20;
  *(_QWORD *)(v21 + 24) = v13;
  sub_214852818();
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v12, v10);
}

uint64_t sub_21481AA9C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88FD8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F78);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_2147F275C(a1, &qword_254D88FD8);
    v13 = sub_2147FE7B4(a2);
    if ((v14 & 1) != 0)
    {
      v15 = v13;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v17 = *v3;
      v22 = *v3;
      *v3 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_21481CE90();
        v17 = v22;
      }
      (*(void (**)(char *, unint64_t, uint64_t))(v10 + 32))(v8, *(_QWORD *)(v17 + 56) + *(_QWORD *)(v10 + 72) * v15, v9);
      sub_21481CB0C(v15, v17);
      *v3 = v17;
      swift_bridgeObjectRelease();
      v18 = 0;
    }
    else
    {
      v18 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v18, 1, v9);
    return sub_2147F275C((uint64_t)v8, &qword_254D88FD8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    v19 = swift_isUniquelyReferenced_nonNull_native();
    v22 = *v3;
    *v3 = 0x8000000000000000;
    sub_21481CCD8((uint64_t)v12, a2, v19);
    *v3 = v22;
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_21481AC78(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88728);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_214852800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v7;
  v8[5] = a2;
  sub_2147FDE8C((uint64_t)v5, (uint64_t)&unk_254D892A8, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_21481AD94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[6] = a4;
  v5[7] = a5;
  v5[5] = a1;
  return swift_task_switch();
}

uint64_t sub_21481ADB0()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 64) = Strong;
  if (Strong)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v2;
    *v2 = v0;
    v2[1] = sub_2147FDBF4;
    return sub_21481AE4C(*(_QWORD *)(v0 + 56));
  }
  else
  {
    **(_BYTE **)(v0 + 40) = 1;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_21481AE4C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[6] = a1;
  v2[7] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88FD8);
  v2[8] = swift_task_alloc();
  sub_2147F9F94(&qword_254D88F98, type metadata accessor for SKServer, (uint64_t)&protocol conformance descriptor for SKServer);
  sub_2148527C4();
  return swift_task_switch();
}

uint64_t sub_21481AEDC()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (qword_254D8F560 != -1)
    swift_once();
  v1 = sub_214852494();
  __swift_project_value_buffer(v1, (uint64_t)qword_254D8F568);
  v2 = sub_21485247C();
  v3 = sub_2148528B4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(_QWORD *)(v0 + 48);
    v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v5 = 134217984;
    *(_QWORD *)(v0 + 40) = v4;
    sub_21485292C();
    _os_log_impl(&dword_2147EE000, v2, v3, "event monitor cancel: id=%llu", v5, 0xCu);
    MEMORY[0x2199D75E8](v5, -1, -1);
  }

  v6 = *(_QWORD *)(v0 + 64);
  v7 = *(_QWORD *)(v0 + 48);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F78);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  swift_beginAccess();
  sub_21481AA9C(v6, v7);
  swift_endAccess();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SKServer._report(event:)(uint64_t a1)
{
  uint64_t v1;
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
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  __int128 v25;
  char *v26;
  char *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t);
  char *v35;
  int64_t v36;
  unint64_t v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  char *v46;
  _QWORD v48[4];
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int64_t v52;
  uint64_t v53;
  const char *v54;
  __int128 v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  int64_t v67;
  char *v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88FE8);
  v64 = *(_QWORD *)(v3 - 8);
  v65 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v63 = (char *)v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = sub_2148525D8();
  v51 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v48[3] = (char *)v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = type metadata accessor for SKServer.Event(0);
  v6 = MEMORY[0x24BDAC7A8](v57);
  v62 = (uint64_t)v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v59 = (uint64_t)v48 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v48 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F78);
  v70 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v68 = (char *)v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F80);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (_QWORD *)((char *)v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v15);
  v66 = (char *)v48 - v18;
  v19 = (uint64_t *)(v1 + OBJC_IVAR____TtC8SetupKit8SKServer__eventContinuations);
  swift_beginAccess();
  v20 = *v19;
  v21 = *(_QWORD *)(*v19 + 64);
  v50 = *v19 + 64;
  v22 = 1 << *(_BYTE *)(v20 + 32);
  v23 = -1;
  if (v22 < 64)
    v23 = ~(-1 << v22);
  v24 = v23 & v21;
  v52 = (unint64_t)(v22 + 63) >> 6;
  v48[0] = v52 - 1;
  v60 = v20;
  swift_bridgeObjectRetain();
  v67 = 0;
  *(_QWORD *)&v25 = 134218242;
  v55 = v25;
  v54 = "bluetoothAdvertiserStopped";
  v48[2] = 0x800000021485E410;
  v53 = MEMORY[0x24BEE4AD8] + 8;
  v48[1] = "serFailed: error=";
  v69 = v17;
  v58 = a1;
  v56 = v11;
  v61 = v12;
  while (1)
  {
    if (v24)
    {
      v28 = __clz(__rbit64(v24));
      v24 &= v24 - 1;
      v29 = v28 | (v67 << 6);
LABEL_7:
      v30 = *(_QWORD *)(v60 + 56);
      *v17 = *(_QWORD *)(*(_QWORD *)(v60 + 48) + 8 * v29);
      v31 = v70;
      v32 = v30 + *(_QWORD *)(v70 + 72) * v29;
      v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F88);
      v34 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
      v17 = v69;
      v34((char *)v69 + *(int *)(v33 + 48), v32, v12);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v17, 0, 1, v33);
      v35 = v66;
      goto LABEL_26;
    }
    v36 = v67 + 1;
    if (__OFADD__(v67, 1))
    {
      __break(1u);
LABEL_33:
      __break(1u);
      JUMPOUT(0x21481B8BCLL);
    }
    v35 = v66;
    if (v36 < v52)
    {
      v37 = *(_QWORD *)(v50 + 8 * v36);
      if (v37)
        goto LABEL_11;
      v38 = v67 + 2;
      ++v67;
      if (v36 + 1 < v52)
      {
        v37 = *(_QWORD *)(v50 + 8 * v38);
        if (v37)
          goto LABEL_14;
        v67 = v36 + 1;
        if (v36 + 2 < v52)
        {
          v37 = *(_QWORD *)(v50 + 8 * (v36 + 2));
          if (v37)
          {
            v36 += 2;
            goto LABEL_11;
          }
          v38 = v36 + 3;
          v67 = v36 + 2;
          if (v36 + 3 < v52)
          {
            v37 = *(_QWORD *)(v50 + 8 * v38);
            if (v37)
            {
LABEL_14:
              v36 = v38;
LABEL_11:
              v24 = (v37 - 1) & v37;
              v29 = __clz(__rbit64(v37)) + (v36 << 6);
              v67 = v36;
              goto LABEL_7;
            }
            while (1)
            {
              v36 = v38 + 1;
              if (__OFADD__(v38, 1))
                goto LABEL_33;
              if (v36 >= v52)
                break;
              v37 = *(_QWORD *)(v50 + 8 * v36);
              ++v38;
              if (v37)
                goto LABEL_11;
            }
            v67 = v48[0];
          }
        }
      }
    }
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F88);
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v17, 1, 1, v39);
    v24 = 0;
LABEL_26:
    sub_21481E444((uint64_t)v17, (uint64_t)v35, &qword_254D88F80);
    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F88);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 48))(v35, 1, v40) == 1)
      return swift_release();
    v41 = *(_QWORD *)v35;
    (*(void (**)(char *, char *, uint64_t))(v70 + 32))(v68, &v35[*(int *)(v40 + 48)], v12);
    if (qword_254D8F560 != -1)
      swift_once();
    v42 = sub_214852494();
    __swift_project_value_buffer(v42, (uint64_t)qword_254D8F568);
    sub_21481C744(a1, (uint64_t)v11, type metadata accessor for SKServer.Event);
    v43 = sub_21485247C();
    v44 = sub_2148528D8();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = swift_slowAlloc();
      v71 = swift_slowAlloc();
      *(_DWORD *)v45 = v55;
      *(_QWORD *)(v45 + 4) = v41;
      *(_WORD *)(v45 + 12) = 2080;
      sub_21481C744((uint64_t)v11, v59, type metadata accessor for SKServer.Event);
      v46 = (char *)&loc_21481B69C + dword_21481B8BC[swift_getEnumCaseMultiPayload()];
      __asm { BR              X9 }
    }
    sub_2147FE778((uint64_t)v11, type metadata accessor for SKServer.Event);

    sub_21481C744(a1, v62, type metadata accessor for SKServer.Event);
    v26 = v63;
    v12 = v61;
    v27 = v68;
    sub_214852824();
    (*(void (**)(char *, uint64_t))(v64 + 8))(v26, v65);
    (*(void (**)(char *, uint64_t))(v70 + 8))(v27, v12);
    v17 = v69;
  }
}

void SKServer.Event.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  char *v5;
  uint64_t v6;

  v1 = sub_2148525D8();
  MEMORY[0x24BDAC7A8](v1);
  v2 = type metadata accessor for SKServer.Event(0);
  MEMORY[0x24BDAC7A8](v2);
  sub_21481C744(v0, (uint64_t)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  v5 = (char *)sub_21481B9B0 + 4 * byte_2148591E0[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_21481B9B0()
{
  uint64_t v0;
  void **v1;
  uint64_t v2;
  void *v3;

  v3 = *v1;
  *(_QWORD *)(v2 - 80) = 0;
  *(_QWORD *)(v2 - 72) = 0xE000000000000000;
  sub_21485298C();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 - 80) = v0 + 7;
  *(_QWORD *)(v2 - 72) = 0x800000021485E410;
  *(_QWORD *)(v2 - 88) = v3;
  sub_214852464();
  sub_2147F9F94(&qword_254D88FF8, (uint64_t (*)(uint64_t))MEMORY[0x24BE29DD8], MEMORY[0x24BDD01A8]);
  sub_214852B6C();
  sub_214852704();

  swift_bridgeObjectRelease();
  return *(_QWORD *)(v2 - 80);
}

uint64_t SKServer.nexusSession.getter()
{
  return swift_retain();
}

uint64_t sub_21481BAEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[5] = a4;
  v5[6] = a5;
  v5[7] = type metadata accessor for SKServer.Event(0);
  v5[8] = swift_task_alloc();
  v6 = sub_2148525D8();
  v5[9] = v6;
  v5[10] = *(_QWORD *)(v6 - 8);
  v5[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D892D8);
  v5[12] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D892E0);
  v5[13] = v7;
  v5[14] = *(_QWORD *)(v7 - 8);
  v5[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21481BBC0()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254D892C0);
  sub_21485283C();
  swift_beginAccess();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v1;
  *v1 = v0;
  v1[1] = sub_21481BC5C;
  return sub_214852848();
}

uint64_t sub_21481BC5C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21481BCB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t Strong;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) != 1)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(*(_QWORD *)(v0 + 88), v1, v2);
    Strong = swift_weakLoadStrong();
    *(_QWORD *)(v0 + 136) = Strong;
    if (Strong)
    {
      type metadata accessor for SKServer(0);
      sub_2147F9F94(&qword_254D88F98, type metadata accessor for SKServer, (uint64_t)&protocol conformance descriptor for SKServer);
      sub_2148527C4();
      return swift_task_switch();
    }
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 112) + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 104));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21481BDE8()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = v0[8];
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v0[10] + 16))(v1, v0[11], v0[9]);
  swift_storeEnumTagMultiPayload();
  SKServer._report(event:)(v1);
  sub_2147FE778(v1, type metadata accessor for SKServer.Event);
  return swift_task_switch();
}

uint64_t sub_21481BE68()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[10];
  v1 = v0[11];
  v3 = v0[9];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v4 = (_QWORD *)swift_task_alloc();
  v0[16] = v4;
  *v4 = v0;
  v4[1] = sub_21481BC5C;
  return sub_214852848();
}

uint64_t sub_21481BEEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_214852800();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_2148527F4();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_2147F275C(a1, &qword_254D88728);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2148527C4();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_21481C020()
{
  uint64_t *v0;

  return SKEnvironmental<>.unownedExecutor.getter(*v0, (uint64_t)&protocol witness table for SKServer);
}

uint64_t sub_21481C034@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *(_QWORD *)(*v1 + OBJC_IVAR____TtC8SetupKit8SKServer_environment);
  return swift_bridgeObjectRetain();
}

void SKServerConfiguration.bluetoothAdvertiserConfiguration.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  char v3;

  v2 = *(_DWORD *)(v1 + 8);
  v3 = *(_BYTE *)(v1 + 12);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_DWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 12) = v3;
}

uint64_t SKServerConfiguration.bluetoothAdvertiserConfiguration.setter(uint64_t result)
{
  uint64_t v1;
  int v2;
  char v3;

  v2 = *(_DWORD *)(result + 8);
  v3 = *(_BYTE *)(result + 12);
  *(_QWORD *)v1 = *(_QWORD *)result;
  *(_DWORD *)(v1 + 8) = v2;
  *(_BYTE *)(v1 + 12) = v3;
  return result;
}

uint64_t (*SKServerConfiguration.bluetoothAdvertiserConfiguration.modify())()
{
  return nullsub_1;
}

uint64_t SKServerConfiguration.nexusSessionConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for SKServerConfiguration(0);
  return sub_21481D3AC(v1 + *(int *)(v3 + 20), a1, &qword_254D881B0);
}

uint64_t SKServerConfiguration.nexusSessionConfiguration.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for SKServerConfiguration(0) + 20);
  return sub_21481D364(a1, v3);
}

uint64_t (*SKServerConfiguration.nexusSessionConfiguration.modify())(_QWORD, _QWORD)
{
  type metadata accessor for SKServerConfiguration(0);
  return nullsub_1;
}

uint64_t SKServerConfiguration.init(bluetoothAdvertiserConfiguration:nexusSessionConfiguration:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  int v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *a1;
  v6 = *((_DWORD *)a1 + 2);
  v7 = *((_BYTE *)a1 + 12);
  v8 = a3 + *(int *)(type metadata accessor for SKServerConfiguration(0) + 20);
  v9 = sub_214852584();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  *(_QWORD *)a3 = v5;
  *(_DWORD *)(a3 + 8) = v6;
  *(_BYTE *)(a3 + 12) = v7;
  return sub_21481D364(a2, v8);
}

{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  void (*v22)(void);
  uint64_t v23;
  uint64_t v25;
  uint64_t v26[3];
  char *v27;
  uint64_t v28;
  uint64_t v29;

  v29 = a2;
  v5 = sub_214852584();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v26[1] = (uint64_t)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v26[2] = (uint64_t)v26 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D881B0);
  MEMORY[0x24BDAC7A8](v10);
  v27 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D89000);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_214852548();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *a1;
  v20 = *((_DWORD *)a1 + 2);
  LOBYTE(a1) = *((_BYTE *)a1 + 12);
  v21 = type metadata accessor for SKServerConfiguration(0);
  v22 = *(void (**)(void))(v6 + 56);
  v26[0] = a3 + *(int *)(v21 + 20);
  v28 = v5;
  v23 = v29;
  v22();
  *(_QWORD *)a3 = v19;
  *(_DWORD *)(a3 + 8) = v20;
  *(_BYTE *)(a3 + 12) = (_BYTE)a1;
  sub_21481D3AC(v23, (uint64_t)v14, &qword_254D89000);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_2147F275C(v23, &qword_254D89000);
    return sub_2147F275C((uint64_t)v14, &qword_254D89000);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v14, v15);
    sub_214852578();
    sub_214852530();
    sub_214852554();
    sub_21485253C();
    v25 = (uint64_t)v27;
    sub_214852560();
    sub_2147F275C(v23, &qword_254D89000);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v22)(v25, 0, 1, v28);
    return sub_21481D364(v25, v26[0]);
  }
}

uint64_t SKServerConfiguration.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _DWORD v19[2];
  char v20;
  int v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D881B0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_214852584();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2148523F8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = 0;
  v25 = 0xE000000000000000;
  sub_2148523EC();
  if ((*((_BYTE *)v0 + 12) & 1) == 0)
  {
    v12 = *((_DWORD *)v0 + 2);
    v13 = *v0;
    v14 = HIDWORD(*v0);
    v22 = 0x746F6F7465756C62;
    v23 = 0xEB000000007B3D68;
    v19[1] = v13;
    v20 = v14;
    v21 = v12;
    sub_21481D3F0();
    sub_214852B00();
    sub_214852704();
    swift_bridgeObjectRelease();
    sub_214852704();
    sub_2148526D4();
    swift_bridgeObjectRelease();
  }
  v15 = type metadata accessor for SKServerConfiguration(0);
  sub_21481D3AC((uint64_t)v0 + *(int *)(v15 + 20), (uint64_t)v3, &qword_254D881B0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_2147F275C((uint64_t)v3, &qword_254D881B0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    v22 = 0x7B3D737578656ELL;
    v23 = 0xE700000000000000;
    sub_2147F9F94(&qword_254D89008, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DB80], MEMORY[0x24BE6DB90]);
    sub_214852B00();
    sub_214852704();
    swift_bridgeObjectRelease();
    sub_214852704();
    sub_2148526D4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  v16 = v24;
  v17 = HIBYTE(v25) & 0xF;
  if ((v25 & 0x2000000000000000) == 0)
    v17 = v24 & 0xFFFFFFFFFFFFLL;
  if (!v17)
  {
    swift_bridgeObjectRelease();
    v16 = 0x746C7561666564;
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v16;
}

uint64_t type metadata accessor for SKServer.Event(uint64_t a1)
{
  return sub_2147FC1A0(a1, (uint64_t *)&unk_254D8F8D0);
}

uint64_t type metadata accessor for SKServer(uint64_t a1)
{
  return sub_2147FC1A0(a1, (uint64_t *)&unk_254D8F8B0);
}

uint64_t type metadata accessor for SKServer.Command(uint64_t a1)
{
  return sub_2147FC1A0(a1, (uint64_t *)&unk_254D8F8C0);
}

uint64_t sub_21481C744(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21481C788()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21481C7AC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21481C7D0()
{
  uint64_t v0;

  return sub_21481AC78(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_21481C7D8(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  int v37;
  int64_t v38;
  _QWORD *v39;
  uint64_t v40;

  v3 = v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F78);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D892B8);
  result = sub_214852A10();
  v11 = result;
  if (*(_QWORD *)(v9 + 16))
  {
    v36 = v3;
    v12 = 0;
    v13 = *(_QWORD *)(v9 + 64);
    v39 = (_QWORD *)(v9 + 64);
    v14 = 1 << *(_BYTE *)(v9 + 32);
    if (v14 < 64)
      v15 = ~(-1 << v14);
    else
      v15 = -1;
    v16 = v15 & v13;
    v38 = (unint64_t)(v14 + 63) >> 6;
    v17 = result + 64;
    v37 = a2;
    v18 = 16;
    if ((a2 & 1) != 0)
      v18 = 32;
    v40 = v18;
    while (1)
    {
      if (v16)
      {
        v20 = __clz(__rbit64(v16));
        v16 &= v16 - 1;
        v21 = v20 | (v12 << 6);
      }
      else
      {
        v22 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = (uint64_t)v39;
        if (v22 >= v38)
          goto LABEL_33;
        v23 = v39[v22];
        ++v12;
        if (!v23)
        {
          v12 = v22 + 1;
          if (v22 + 1 >= v38)
            goto LABEL_33;
          v23 = v39[v12];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v38)
            {
LABEL_33:
              if ((v37 & 1) == 0)
              {
                result = swift_release();
                v3 = v36;
                goto LABEL_40;
              }
              v34 = 1 << *(_BYTE *)(v9 + 32);
              if (v34 >= 64)
                bzero(v39, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v39 = -1 << v34;
              v3 = v36;
              *(_QWORD *)(v9 + 16) = 0;
              break;
            }
            v23 = v39[v24];
            if (!v23)
            {
              while (1)
              {
                v12 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_42;
                if (v12 >= v38)
                  goto LABEL_33;
                v23 = v39[v12];
                ++v24;
                if (v23)
                  goto LABEL_23;
              }
            }
            v12 = v24;
          }
        }
LABEL_23:
        v16 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v12 << 6);
      }
      v25 = *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v21);
      v26 = *(_QWORD *)(v6 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + v40))(v8, *(_QWORD *)(v9 + 56) + v26 * v21, v5);
      result = sub_214852B78();
      v27 = -1 << *(_BYTE *)(v11 + 32);
      v28 = result & ~v27;
      v29 = v28 >> 6;
      if (((-1 << v28) & ~*(_QWORD *)(v17 + 8 * (v28 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v17 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v30 = 0;
        v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v32 = v29 == v31;
          if (v29 == v31)
            v29 = 0;
          v30 |= v32;
          v33 = *(_QWORD *)(v17 + 8 * v29);
        }
        while (v33 == -1);
        v19 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(_QWORD *)(v17 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      *(_QWORD *)(*(_QWORD *)(v11 + 48) + 8 * v19) = v25;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 56) + v26 * v19, v8, v5);
      ++*(_QWORD *)(v11 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v11;
  return result;
}

unint64_t sub_21481CB0C(unint64_t result, uint64_t a2)
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
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_21485295C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_QWORD *)(v9 + 8 * v6);
        result = sub_214852B78();
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
        v16 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254D88F78) - 8) + 72);
        v17 = v16 * v3;
        result = v15 + v16 * v3;
        v18 = v16 * v6;
        v19 = v15 + v16 * v6 + v16;
        if (v17 < v18 || result >= v19)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v17 == v18)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    v23 = *v21;
    v22 = (-1 << result) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_21481CCD8(uint64_t a1, uint64_t a2, char a3)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  unint64_t v20;
  char v21;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_2147FE7B4(a2);
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
      {
LABEL_8:
        v17 = v16[7];
        v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F78);
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v10, a1, v18);
      }
      return sub_21481CE00(v10, a2, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_21481CE90();
      goto LABEL_7;
    }
    sub_21481C7D8(v13, a3 & 1);
    v20 = sub_2147FE7B4(a2);
    if ((v14 & 1) == (v21 & 1))
    {
      v10 = v20;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
      return sub_21481CE00(v10, a2, a1, v16);
    }
  }
  result = sub_214852B48();
  __break(1u);
  return result;
}

uint64_t sub_21481CE00(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  v7 = a4[7];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F78);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7 + *(_QWORD *)(*(_QWORD *)(v8 - 8) + 72) * a1, a3, v8);
  v10 = a4[2];
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
    __break(1u);
  else
    a4[2] = v12;
  return result;
}

void *sub_21481CE90()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int64_t v25;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88F78);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D892B8);
  v23 = v0;
  v5 = *v0;
  v6 = sub_214852A04();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_23:
    result = (void *)swift_release();
    *v23 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v10 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v11 = 1 << *(_BYTE *)(v5 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v5 + 64);
  v24 = v5 + 64;
  v25 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25)
      goto LABEL_23;
    v20 = *(_QWORD *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v25)
        goto LABEL_23;
      v20 = *(_QWORD *)(v24 + 8 * v10);
      if (!v20)
        break;
    }
LABEL_22:
    v13 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v15);
    v18 = *(_QWORD *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 56) + v18, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v16) = v17;
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 56) + v18, v4, v1);
  }
  v21 = v19 + 2;
  if (v21 >= v25)
    goto LABEL_23;
  v20 = *(_QWORD *)(v24 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v25)
      goto LABEL_23;
    v20 = *(_QWORD *)(v24 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

void _s8SetupKit8SKServerC5EventO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v12 = sub_2148525D8();
  MEMORY[0x24BDAC7A8](v12);
  v4 = type metadata accessor for SKServer.Event(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  MEMORY[0x24BDAC7A8](v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D89290);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 + *(int *)(v7 + 48) - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21481C744(a1, (uint64_t)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SKServer.Event);
  sub_21481C744(a2, (uint64_t)v9, type metadata accessor for SKServer.Event);
  v10 = (char *)sub_21481D1FC + 4 * byte_2148591E4[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_21481D1FC()
{
  uint64_t v0;
  void **v1;
  void **v2;
  void *v3;
  char v4;
  void *v5;

  sub_21481C744(v0, (uint64_t)v2, type metadata accessor for SKServer.Event);
  v3 = *v2;
  if (swift_getEnumCaseMultiPayload())
  {

    sub_2147F275C(v0, &qword_254D89290);
    v4 = 0;
  }
  else
  {
    v5 = *v1;
    sub_21481E258();
    v4 = sub_214852908();

    sub_2147FE778(v0, type metadata accessor for SKServer.Event);
  }
  return v4 & 1;
}

uint64_t sub_21481D364(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D881B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21481D3AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_21481D3F0()
{
  unint64_t result;

  result = qword_254D89010;
  if (!qword_254D89010)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKBluetoothAdvertiserConfiguration, &type metadata for SKBluetoothAdvertiserConfiguration);
    atomic_store(result, (unint64_t *)&qword_254D89010);
  }
  return result;
}

uint64_t sub_21481D434()
{
  return type metadata accessor for SKServer(0);
}

uint64_t sub_21481D43C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for SKServerConfiguration(319);
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SKServer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SKServer.__allocating_init(configuration:environment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t *initializeBufferWithCopyOfBuffer for SKServer.Command(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = sub_214852614();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  return a1;
}

uint64_t destroy for SKServer.Command(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_214852614();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for SKServer.Command(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_214852614();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for SKServer.Command(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_214852614();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for SKServer.Command(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_214852614();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for SKServer.Command(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_214852614();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SKServer.Command(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_214852614();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SKServer.Command(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_214852614();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, a2, a3, v6);
}

uint64_t sub_21481D738(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = sub_214852614();
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8);
    swift_initEnumMetadataSingleCase();
    result = 0;
    *(_DWORD *)(*(_QWORD *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for SKServer.Event(char *a1, char **a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v10 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v10[(v6 + 16) & ~(unint64_t)v6];
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v11 = sub_2148525D8();
      (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v8 = *a2;
      *(_QWORD *)a1 = *a2;
      v9 = v8;
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void destroy for SKServer.Event(id *a1)
{
  int EnumCaseMultiPayload;
  uint64_t v3;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v3 = sub_2148525D8();
    (*(void (**)(id *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  else if (!EnumCaseMultiPayload)
  {

  }
}

void **initializeWithCopy for SKServer.Event(void **a1, void **a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  void *v7;
  id v8;
  uint64_t v9;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v9 = sub_2148525D8();
    (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = *a2;
    *a1 = *a2;
    v8 = v7;
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void **assignWithCopy for SKServer.Event(void **a1, void **a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  void *v7;
  id v8;
  uint64_t v9;

  if (a1 != a2)
  {
    sub_2147FE778((uint64_t)a1, type metadata accessor for SKServer.Event);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v9 = sub_2148525D8();
      (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = *a2;
      *a1 = *a2;
      v8 = v7;
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void *initializeWithTake for SKServer.Event(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_2148525D8();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for SKServer.Event(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_2147FE778((uint64_t)a1, type metadata accessor for SKServer.Event);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_2148525D8();
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

uint64_t sub_21481DB74()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2148525D8();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SKServerConfiguration(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    *(uint64_t *)((char *)a1 + 5) = *(uint64_t *)((char *)a2 + 5);
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_214852584();
    v9 = *(_QWORD *)(v8 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D881B0);
      memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
    }
  }
  return v3;
}

uint64_t destroy for SKServerConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_214852584();
  v4 = *(_QWORD *)(v3 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return result;
}

_QWORD *initializeWithCopy for SKServerConfiguration(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  *(_QWORD *)((char *)a1 + 5) = *(_QWORD *)((char *)a2 + 5);
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_214852584();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D881B0);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v5, v6, v7);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

_QWORD *assignWithCopy for SKServerConfiguration(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(char *, uint64_t, uint64_t);
  int v11;
  int v12;
  uint64_t v13;

  v4 = *a2;
  *(_QWORD *)((char *)a1 + 5) = *(uint64_t *)((char *)a2 + 5);
  *a1 = v4;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_214852584();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
  v11 = v10(v6, 1, v8);
  v12 = v10(v7, 1, v8);
  if (!v11)
  {
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 24))(v6, v7, v8);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D881B0);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  return a1;
}

_QWORD *initializeWithTake for SKServerConfiguration(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  *(_QWORD *)((char *)a1 + 5) = *(_QWORD *)((char *)a2 + 5);
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_214852584();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D881B0);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

_QWORD *assignWithTake for SKServerConfiguration(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(char *, uint64_t, uint64_t);
  int v10;
  int v11;
  uint64_t v12;

  *a1 = *a2;
  *(_QWORD *)((char *)a1 + 5) = *(_QWORD *)((char *)a2 + 5);
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_214852584();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48);
  v10 = v9(v5, 1, v7);
  v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 40))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D881B0);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v5, v6, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for SKServerConfiguration()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21481E0F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a3 + 20);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D881B0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, a2, v5);
}

uint64_t storeEnumTagSinglePayload for SKServerConfiguration()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21481E148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + *(int *)(a4 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D881B0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, a2, a2, v6);
}

void sub_21481E190()
{
  unint64_t v0;

  sub_21481E204();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_21481E204()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254D89260)
  {
    sub_214852584();
    v0 = sub_214852914();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254D89260);
  }
}

unint64_t sub_21481E258()
{
  unint64_t result;

  result = qword_254D89298;
  if (!qword_254D89298)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_254D89298);
  }
  return result;
}

uint64_t sub_21481E294()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21481E2C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *(_QWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 40);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_2147F4FF0;
  v6[6] = v5;
  v6[7] = v4;
  v6[5] = a1;
  return swift_task_switch();
}

uint64_t sub_21481E330()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D892C0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21481E3C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254D892C0) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v0 + v3;
  v5 = *(_QWORD *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFF8));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_2147F4FF0;
  return sub_21481BAEC((uint64_t)v6, v7, v8, v4, v5);
}

uint64_t sub_21481E444(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_21481E488()
{
  uint64_t v0;

  v0 = sub_214852494();
  __swift_allocate_value_buffer(v0, qword_254D8F8F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D8F8F8);
  sub_214801FC0();
  swift_bridgeObjectRetain();
  return sub_214852488();
}

uint64_t SKStepPhotoPickerClient.environment.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 40);
  return swift_bridgeObjectRetain();
}

_QWORD *SKStepPhotoPickerClient.__allocating_init(client:environment:)(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)swift_allocObject();
  v4 = *a2;
  swift_weakInit();
  v3[3] = 0;
  v3[4] = 0;
  swift_weakAssign();
  swift_release();
  v3[5] = v4;
  return v3;
}

_QWORD *SKStepPhotoPickerClient.init(client:environment:)(uint64_t a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *a2;
  swift_weakInit();
  v2[3] = 0;
  v2[4] = 0;
  swift_weakAssign();
  swift_release();
  v2[5] = v3;
  return v2;
}

uint64_t SKStepPhotoPickerClient.start(configuration:)(_OWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v2 + 96) = v1;
  v4 = sub_214852524();
  *(_QWORD *)(v2 + 104) = v4;
  *(_QWORD *)(v2 + 112) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 120) = swift_task_alloc();
  v5 = sub_2148523E0();
  *(_QWORD *)(v2 + 128) = v5;
  *(_QWORD *)(v2 + 136) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v2 + 144) = swift_task_alloc();
  *(_OWORD *)(v2 + 152) = *a1;
  sub_21481EEF0();
  *(_QWORD *)(v2 + 168) = sub_2148527C4();
  *(_QWORD *)(v2 + 176) = v6;
  return swift_task_switch();
}

uint64_t sub_21481E688()
{
  uint64_t v0;
  uint64_t Strong;
  unint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  __n128 v29;
  _QWORD *v30;
  uint64_t v32;
  __n128 v33;
  __n128 v34;

  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 184) = Strong;
  if (Strong)
  {
    if (qword_254D8F8F0 != -1)
      swift_once();
    v2 = *(_QWORD *)(v0 + 160);
    v3 = sub_214852494();
    *(_QWORD *)(v0 + 192) = __swift_project_value_buffer(v3, (uint64_t)qword_254D8F8F8);
    swift_bridgeObjectRetain_n();
    v4 = sub_21485247C();
    v5 = sub_2148528D8();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = *(_QWORD *)(v0 + 152);
      v32 = *(_QWORD *)(v0 + 160);
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = swift_slowAlloc();
      v34.n128_u64[0] = v8;
      *(_DWORD *)v7 = 136315138;
      *(_QWORD *)(v0 + 56) = v6;
      *(_QWORD *)(v0 + 64) = v32;
      sub_2147FE598();
      v9 = sub_214852B00();
      *(_QWORD *)(v0 + 88) = sub_2147F3D14(v9, v10, (uint64_t *)&v34);
      sub_21485292C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2147EE000, v4, v5, "PhotoPicker start: configuration=%s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199D75E8](v8, -1, -1);
      MEMORY[0x2199D75E8](v7, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v21 = *(_QWORD *)(v0 + 160);
    if (v21)
    {
      v22 = *(_QWORD *)(v0 + 152);
      v23 = v2;
    }
    else
    {
      v25 = *(_QWORD *)(v0 + 136);
      v24 = *(_QWORD *)(v0 + 144);
      v26 = *(_QWORD *)(v0 + 128);
      sub_2148523D4();
      v22 = sub_2148523C8();
      v23 = v27;
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
      swift_bridgeObjectRelease();
      v21 = v23;
    }
    *(_QWORD *)(v0 + 200) = v23;
    v28 = *(_QWORD *)(v0 + 96);
    *(_QWORD *)(v28 + 24) = v22;
    *(_QWORD *)(v28 + 32) = v21;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v34.n128_u64[0] = v22;
    v34.n128_u64[1] = v21;
    swift_bridgeObjectRetain();
    sub_2147F4D30(&v34, &v33);
    v29 = v33;
    *(_QWORD *)(v0 + 208) = v33.n128_u64[1];
    *(__n128 *)(v0 + 40) = v29;
    v30 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v30;
    sub_2147F80E0();
    *v30 = v0;
    v30[1] = sub_21481EB74;
    return sub_2148525C0();
  }
  else
  {
    v34.n128_u8[0] = 2;
    type metadata accessor for SKError();
    v11 = SKError.__allocating_init(_:_:_:)((uint64_t)&v34, 0x6E65696C63206F4ELL, 0xE900000000000074, 0);
    swift_willThrow();
    if (qword_254D8F8F0 != -1)
      swift_once();
    v12 = sub_214852494();
    __swift_project_value_buffer(v12, (uint64_t)qword_254D8F8F8);
    v13 = v11;
    v14 = v11;
    v15 = sub_21485247C();
    v16 = sub_2148528CC();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v34.n128_u64[0] = v18;
      *(_DWORD *)v17 = 136315138;
      swift_getErrorValue();
      v19 = sub_214852B6C();
      *(_QWORD *)(v0 + 80) = sub_2147F3D14(v19, v20, (uint64_t *)&v34);
      sub_21485292C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2147EE000, v15, v16, "### PhotoPicker start failed: error=%s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199D75E8](v18, -1, -1);
      MEMORY[0x2199D75E8](v17, -1, -1);
    }
    else
    {

    }
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_21481EB74()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 224) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2[14] + 8))(v2[15], v2[13]);
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_21481EBF4()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  v1 = sub_21485247C();
  v2 = sub_2148528D8();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2147EE000, v1, v2, "PhotoPicker started", v3, 2u);
    MEMORY[0x2199D75E8](v3, -1, -1);

    swift_release();
  }
  else
  {
    swift_release();

  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21481ECDC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = *(void **)(v0 + 224);
  if (qword_254D8F8F0 != -1)
    swift_once();
  v2 = sub_214852494();
  __swift_project_value_buffer(v2, (uint64_t)qword_254D8F8F8);
  v3 = v1;
  v4 = v1;
  v5 = sub_21485247C();
  v6 = sub_2148528CC();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v12 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_getErrorValue();
    v9 = sub_214852B6C();
    *(_QWORD *)(v0 + 80) = sub_2147F3D14(v9, v10, &v12);
    sub_21485292C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2147EE000, v5, v6, "### PhotoPicker start failed: error=%s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v8, -1, -1);
    MEMORY[0x2199D75E8](v7, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_21481EEF0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D892F0;
  if (!qword_254D892F0)
  {
    v1 = type metadata accessor for SKStepPhotoPickerClient();
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepPhotoPickerClient, v1);
    atomic_store(result, (unint64_t *)&qword_254D892F0);
  }
  return result;
}

uint64_t type metadata accessor for SKStepPhotoPickerClient()
{
  return objc_opt_self();
}

uint64_t SKStepPhotoPickerClient.finish(configuration:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  *(_QWORD *)(v3 + 440) = a1;
  *(_QWORD *)(v3 + 448) = v2;
  v5 = sub_214852368();
  *(_QWORD *)(v3 + 456) = v5;
  *(_QWORD *)(v3 + 464) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v3 + 472) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88538);
  *(_QWORD *)(v3 + 480) = swift_task_alloc();
  v6 = sub_214852428();
  *(_QWORD *)(v3 + 488) = v6;
  *(_QWORD *)(v3 + 496) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v3 + 504) = swift_task_alloc();
  v7 = sub_21485241C();
  *(_QWORD *)(v3 + 512) = v7;
  *(_QWORD *)(v3 + 520) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v3 + 528) = swift_task_alloc();
  *(_QWORD *)(v3 + 536) = swift_task_alloc();
  *(_QWORD *)(v3 + 544) = *(_QWORD *)a2;
  *(_BYTE *)(v3 + 233) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(v3 + 552) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(v3 + 234) = *(_BYTE *)(a2 + 24);
  v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v3 + 560) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v3 + 576) = v8;
  *(_QWORD *)(v3 + 592) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(v3 + 235) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(v3 + 600) = *(_QWORD *)(a2 + 80);
  sub_21481EEF0();
  *(_QWORD *)(v3 + 608) = sub_2148527C4();
  *(_QWORD *)(v3 + 616) = v9;
  return swift_task_switch();
}

uint64_t sub_21481F0A4()
{
  uint64_t v0;
  uint64_t Strong;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  unint64_t v44;
  void (*v45)(uint64_t, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, _QWORD, uint64_t, uint64_t);
  _QWORD *v51;
  void (*v53)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  void (*v64)(uint64_t, uint64_t);
  uint64_t v65;
  char v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  _QWORD *v76;
  char v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(uint64_t, uint64_t);
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *log;
  char loga;
  os_log_type_t type;
  uint64_t v94;
  char v95;
  uint64_t v96;
  char v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  char v106;
  uint64_t v107;
  char v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char v114;
  uint64_t v115;

  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 624) = Strong;
  if (Strong)
  {
    if (qword_254D8F8F0 != -1)
      swift_once();
    v2 = *(_QWORD *)(v0 + 600);
    v3 = *(_QWORD *)(v0 + 584);
    v4 = *(_QWORD *)(v0 + 576);
    v5 = *(_QWORD *)(v0 + 568);
    v6 = *(_QWORD *)(v0 + 560);
    v7 = sub_214852494();
    *(_QWORD *)(v0 + 632) = __swift_project_value_buffer(v7, (uint64_t)qword_254D8F8F8);
    sub_2147F7A0C(v6, v5, v4, v3);
    swift_bridgeObjectRetain();
    sub_2147F7A0C(v6, v5, v4, v3);
    swift_bridgeObjectRetain();
    v8 = sub_21485247C();
    v9 = sub_2148528D8();
    if (os_log_type_enabled(v8, v9))
    {
      v86 = *(_QWORD *)(v0 + 600);
      v10 = *(_QWORD *)(v0 + 584);
      v11 = *(_QWORD *)(v0 + 576);
      v12 = *(_QWORD *)(v0 + 568);
      v84 = *(_QWORD *)(v0 + 592);
      v80 = *(_QWORD *)(v0 + 560);
      type = v9;
      v77 = *(_BYTE *)(v0 + 234);
      v13 = *(_QWORD *)(v0 + 552);
      v14 = *(_BYTE *)(v0 + 233);
      v15 = *(_QWORD *)(v0 + 544);
      log = v8;
      v79 = *(_BYTE *)(v0 + 235);
      v16 = (uint8_t *)swift_slowAlloc();
      v89 = swift_slowAlloc();
      v105 = v89;
      *(_DWORD *)v16 = 136315138;
      *(_QWORD *)(v0 + 104) = v15;
      *(_BYTE *)(v0 + 112) = v14;
      *(_QWORD *)(v0 + 120) = v13;
      *(_BYTE *)(v0 + 128) = v77;
      *(_QWORD *)(v0 + 136) = v80;
      *(_QWORD *)(v0 + 144) = v12;
      *(_QWORD *)(v0 + 152) = v11;
      *(_QWORD *)(v0 + 160) = v10;
      *(_QWORD *)(v0 + 168) = v84;
      *(_BYTE *)(v0 + 176) = v79;
      *(_QWORD *)(v0 + 184) = v86;
      sub_2147FE638();
      v17 = sub_214852B00();
      *(_QWORD *)(v0 + 432) = sub_2147F3D14(v17, v18, &v105);
      sub_21485292C();
      swift_bridgeObjectRelease();
      sub_2147F7A20(v80, v12, v11, v10);
      swift_bridgeObjectRelease();
      sub_2147F7A20(v80, v12, v11, v10);
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2147EE000, log, type, "PhotoPicker finish: configuration=%s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199D75E8](v89, -1, -1);
      MEMORY[0x2199D75E8](v16, -1, -1);

    }
    else
    {
      v29 = *(_QWORD *)(v0 + 584);
      v30 = *(_QWORD *)(v0 + 576);
      v31 = *(_QWORD *)(v0 + 568);
      v32 = *(_QWORD *)(v0 + 560);
      sub_2147F7A20(v32, v31, v30, v29);
      swift_bridgeObjectRelease();
      sub_2147F7A20(v32, v31, v30, v29);
      swift_bridgeObjectRelease();

    }
    v33 = *(_QWORD *)(v0 + 600);
    v35 = *(_QWORD *)(v0 + 496);
    v34 = *(_QWORD *)(v0 + 504);
    v36 = *(_QWORD *)(v0 + 488);
    v37 = *(_QWORD *)(*(_QWORD *)(v0 + 448) + 40);
    *(_QWORD *)(v0 + 640) = v37;
    v105 = v37;
    SKEnvironmentValues.clock.getter();
    sub_214852404();
    v38 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
    *(_QWORD *)(v0 + 648) = v38;
    v38(v34, v36);
    v39 = MEMORY[0x24BEE4AF8];
    if (v33)
      v40 = v2;
    else
      v40 = MEMORY[0x24BEE4AF8];
    v41 = *(_QWORD *)(v40 + 16);
    *(_QWORD *)(v0 + 656) = v41;
    v42 = *(_QWORD *)(v0 + 464);
    if (v41)
    {
      v43 = *(_DWORD *)(v42 + 80);
      *(_DWORD *)(v0 + 236) = v43;
      v44 = (v43 + 32) & ~(unint64_t)v43;
      *(_QWORD *)(v0 + 664) = *(_QWORD *)(v42 + 72);
      v45 = *(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16);
      *(_QWORD *)(v0 + 672) = v45;
      *(_QWORD *)(v0 + 680) = 0;
      v46 = *(_QWORD *)(v0 + 600);
      v47 = *(_QWORD *)(v0 + 480);
      v48 = *(_QWORD *)(v0 + 456);
      if (!v46)
        v46 = v39;
      v49 = v46 + v44;
      swift_bridgeObjectRetain();
      v45(v47, v49, v48);
      v50 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v42 + 56);
      *(_QWORD *)(v0 + 688) = v50;
      v50(v47, 0, 1, v48);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v42 + 48))(v47, 1, v48) != 1)
      {
        (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 464) + 32))(*(_QWORD *)(v0 + 472), *(_QWORD *)(v0 + 480), *(_QWORD *)(v0 + 456));
        v51 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 696) = v51;
        *v51 = v0;
        v51[1] = sub_21481F9FC;
        return sub_2148206F4(*(_QWORD *)(v0 + 624), *(_QWORD *)(v0 + 472));
      }
    }
    else
    {
      v53 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 56);
      v54 = *(_QWORD *)(v0 + 480);
      v55 = *(_QWORD *)(v0 + 456);
      swift_bridgeObjectRetain();
      v53(v54, 1, 1, v55);
    }
    v56 = *(_QWORD *)(v0 + 640);
    v83 = *(void (**)(uint64_t, uint64_t))(v0 + 648);
    v85 = *(_QWORD *)(v0 + 592);
    v57 = *(_QWORD *)(v0 + 584);
    v58 = *(_QWORD *)(v0 + 576);
    v59 = *(_QWORD *)(v0 + 568);
    v60 = *(_QWORD *)(v0 + 560);
    loga = *(_BYTE *)(v0 + 234);
    v90 = *(_QWORD *)(v0 + 552);
    v88 = *(_BYTE *)(v0 + 233);
    v87 = *(_QWORD *)(v0 + 544);
    v61 = *(_QWORD *)(v0 + 528);
    v81 = *(_QWORD *)(v0 + 520);
    v62 = *(_QWORD *)(v0 + 504);
    v82 = *(_QWORD *)(v0 + 512);
    v78 = *(_QWORD *)(v0 + 488);
    v63 = *(_BYTE *)(v0 + 235);
    swift_bridgeObjectRelease();
    v105 = v56;
    SKEnvironmentValues.clock.getter();
    sub_214852404();
    v83(v62, v78);
    sub_214852410();
    v64 = *(void (**)(uint64_t, uint64_t))(v81 + 8);
    *(_QWORD *)(v0 + 712) = v64;
    v64(v61, v82);
    *(double *)(v0 + 720) = Duration.seconds.getter();
    sub_2147F7A0C(v60, v59, v58, v57);
    swift_bridgeObjectRetain();
    sub_2147F7A0C(v60, v59, v58, v57);
    swift_bridgeObjectRelease();
    sub_2147F7A0C(v60, v59, v58, v57);
    sub_2147F7A20(v60, v59, v58, v57);
    v105 = v87;
    v106 = v88;
    v107 = v90;
    v108 = loga;
    v109 = v60;
    v110 = v59;
    v111 = v58;
    v112 = v57;
    v113 = v85;
    v114 = v63;
    v115 = 0;
    sub_2147F696C((uint64_t)&v105, (uint64_t)&v94);
    v65 = v94;
    v66 = v95;
    v67 = v96;
    v68 = v97;
    v69 = v98;
    v70 = v99;
    *(_QWORD *)(v0 + 728) = v98;
    *(_QWORD *)(v0 + 736) = v70;
    v71 = v100;
    v72 = v101;
    *(_QWORD *)(v0 + 744) = v100;
    *(_QWORD *)(v0 + 752) = v72;
    v73 = v102;
    *(_QWORD *)(v0 + 760) = v102;
    v74 = v103;
    *(_BYTE *)(v0 + 281) = v103;
    v75 = v104;
    *(_QWORD *)(v0 + 768) = v104;
    *(_QWORD *)(v0 + 16) = v65;
    *(_BYTE *)(v0 + 24) = v66;
    *(_QWORD *)(v0 + 32) = v67;
    *(_BYTE *)(v0 + 40) = v68;
    *(_QWORD *)(v0 + 48) = v69;
    *(_QWORD *)(v0 + 56) = v70;
    *(_QWORD *)(v0 + 64) = v71;
    *(_QWORD *)(v0 + 72) = v72;
    *(_QWORD *)(v0 + 80) = v73;
    *(_BYTE *)(v0 + 88) = v74;
    *(_QWORD *)(v0 + 96) = v75;
    v76 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 776) = v76;
    sub_2147F8368();
    *v76 = v0;
    v76[1] = sub_21481FE44;
    return sub_2148525C0();
  }
  else
  {
    LOBYTE(v105) = 2;
    type metadata accessor for SKError();
    v19 = SKError.__allocating_init(_:_:_:)((uint64_t)&v105, 0x6E65696C63206F4ELL, 0xE900000000000074, 0);
    swift_willThrow();
    if (qword_254D8F8F0 != -1)
      swift_once();
    v20 = sub_214852494();
    __swift_project_value_buffer(v20, (uint64_t)qword_254D8F8F8);
    v21 = v19;
    v22 = v19;
    v23 = sub_21485247C();
    v24 = sub_2148528CC();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      v105 = v26;
      *(_DWORD *)v25 = 136315138;
      swift_getErrorValue();
      v27 = sub_214852B6C();
      *(_QWORD *)(v0 + 424) = sub_2147F3D14(v27, v28, &v105);
      sub_21485292C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2147EE000, v23, v24, "### PhotoPicker finish failed: error=%s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199D75E8](v26, -1, -1);
      MEMORY[0x2199D75E8](v25, -1, -1);
    }
    else
    {

    }
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_21481F9FC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 704) = v0;
  swift_task_dealloc();
  if (v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_21481FA80()
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
  void (*v9)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;

  v1 = *(_QWORD *)(v0 + 656);
  v2 = *(_QWORD *)(v0 + 680) + 1;
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 464) + 8))(*(_QWORD *)(v0 + 472), *(_QWORD *)(v0 + 456));
  v3 = MEMORY[0x24BEE4AF8];
  if (v2 == v1)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v0 + 688))(*(_QWORD *)(v0 + 480), 1, 1, *(_QWORD *)(v0 + 456));
LABEL_6:
    v10 = *(_QWORD *)(v0 + 640);
    v36 = *(void (**)(uint64_t, uint64_t))(v0 + 648);
    v37 = *(_QWORD *)(v0 + 592);
    v11 = *(_QWORD *)(v0 + 584);
    v12 = *(_QWORD *)(v0 + 576);
    v13 = *(_QWORD *)(v0 + 568);
    v14 = *(_QWORD *)(v0 + 560);
    v41 = *(_BYTE *)(v0 + 234);
    v40 = *(_QWORD *)(v0 + 552);
    v39 = *(_BYTE *)(v0 + 233);
    v38 = *(_QWORD *)(v0 + 544);
    v15 = *(_QWORD *)(v0 + 528);
    v34 = *(_QWORD *)(v0 + 520);
    v16 = *(_QWORD *)(v0 + 504);
    v35 = *(_QWORD *)(v0 + 512);
    v33 = *(_QWORD *)(v0 + 488);
    v17 = *(_BYTE *)(v0 + 235);
    swift_bridgeObjectRelease();
    v53 = v10;
    SKEnvironmentValues.clock.getter();
    sub_214852404();
    v36(v16, v33);
    sub_214852410();
    v18 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
    *(_QWORD *)(v0 + 712) = v18;
    v18(v15, v35);
    *(double *)(v0 + 720) = Duration.seconds.getter();
    sub_2147F7A0C(v14, v13, v12, v11);
    swift_bridgeObjectRetain();
    sub_2147F7A0C(v14, v13, v12, v11);
    swift_bridgeObjectRelease();
    sub_2147F7A0C(v14, v13, v12, v11);
    sub_2147F7A20(v14, v13, v12, v11);
    v53 = v38;
    v54 = v39;
    v55 = v40;
    v56 = v41;
    v57 = v14;
    v58 = v13;
    v59 = v12;
    v60 = v11;
    v61 = v37;
    v62 = v17;
    v63 = 0;
    sub_2147F696C((uint64_t)&v53, (uint64_t)&v42);
    v19 = v42;
    v20 = v43;
    v21 = v44;
    v22 = v45;
    v23 = v46;
    v24 = v47;
    *(_QWORD *)(v0 + 728) = v46;
    *(_QWORD *)(v0 + 736) = v24;
    v25 = v48;
    v26 = v49;
    *(_QWORD *)(v0 + 744) = v48;
    *(_QWORD *)(v0 + 752) = v26;
    v27 = v50;
    *(_QWORD *)(v0 + 760) = v50;
    v28 = v51;
    *(_BYTE *)(v0 + 281) = v51;
    v29 = v52;
    *(_QWORD *)(v0 + 768) = v52;
    *(_QWORD *)(v0 + 16) = v19;
    *(_BYTE *)(v0 + 24) = v20;
    *(_QWORD *)(v0 + 32) = v21;
    *(_BYTE *)(v0 + 40) = v22;
    *(_QWORD *)(v0 + 48) = v23;
    *(_QWORD *)(v0 + 56) = v24;
    *(_QWORD *)(v0 + 64) = v25;
    *(_QWORD *)(v0 + 72) = v26;
    *(_QWORD *)(v0 + 80) = v27;
    *(_BYTE *)(v0 + 88) = v28;
    *(_QWORD *)(v0 + 96) = v29;
    v30 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 776) = v30;
    sub_2147F8368();
    *v30 = v0;
    v30[1] = sub_21481FE44;
    return sub_2148525C0();
  }
  v4 = *(_QWORD *)(v0 + 680) + 1;
  *(_QWORD *)(v0 + 680) = v4;
  v5 = *(_QWORD *)(v0 + 600);
  v6 = *(_QWORD *)(v0 + 480);
  v7 = *(_QWORD *)(v0 + 456);
  v8 = *(_QWORD *)(v0 + 464);
  if (!v5)
    v5 = v3;
  (*(void (**)(_QWORD, unint64_t, _QWORD))(v0 + 672))(*(_QWORD *)(v0 + 480), v5+ ((*(unsigned __int8 *)(v0 + 236) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 236))+ *(_QWORD *)(v0 + 664) * v4, *(_QWORD *)(v0 + 456));
  v9 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v8 + 56);
  *(_QWORD *)(v0 + 688) = v9;
  v9(v6, 0, 1, v7);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    goto LABEL_6;
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 464) + 32))(*(_QWORD *)(v0 + 472), *(_QWORD *)(v0 + 480), *(_QWORD *)(v0 + 456));
  v32 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 696) = v32;
  *v32 = v0;
  v32[1] = sub_21481F9FC;
  return sub_2148206F4(*(_QWORD *)(v0 + 624), *(_QWORD *)(v0 + 472));
}

uint64_t sub_21481FE44()
{
  uint64_t v0;
  uint64_t **v1;
  uint64_t *v2;

  v2 = *v1;
  (*v1)[98] = v0;
  swift_task_dealloc();
  if (!v0)
  {
    sub_2147F7A20(v2[91], v2[92], v2[93], v2[94]);
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_21481FED8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  _BYTE *v29;
  uint64_t v30;

  v29 = (_BYTE *)(v0 + 296);
  v1 = *(_QWORD *)(v0 + 720);
  v2 = *(_QWORD *)(v0 + 448);
  v3 = *(_BYTE *)(v0 + 248);
  *(_QWORD *)(v0 + 288) = *(_QWORD *)(v0 + 240);
  *(_BYTE *)(v0 + 296) = v3;
  v4 = *(_QWORD *)(v2 + 32);
  *(_QWORD *)(v0 + 304) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(v0 + 312) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 320) = v1;
  *(_BYTE *)(v0 + 328) = 0;
  v5 = sub_21485247C();
  v6 = sub_2148528D8();
  if (os_log_type_enabled(v5, v6))
  {
    v27 = *(_QWORD *)(v0 + 536);
    v28 = *(void (**)(uint64_t, uint64_t))(v0 + 712);
    v26 = *(_QWORD *)(v0 + 512);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v30 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_beginAccess();
    *(_QWORD *)(v0 + 192) = *(_QWORD *)(v0 + 288);
    v9 = *(_QWORD *)(v0 + 320);
    v10 = *(_BYTE *)(v0 + 328);
    *(_BYTE *)(v0 + 200) = *v29;
    *(_OWORD *)(v0 + 208) = *(_OWORD *)(v0 + 304);
    *(_QWORD *)(v0 + 224) = v9;
    *(_BYTE *)(v0 + 232) = v10;
    sub_214820FFC();
    v11 = sub_214852B00();
    *(_QWORD *)(v0 + 416) = sub_2147F3D14(v11, v12, &v30);
    sub_21485292C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2147EE000, v5, v6, "PhotoPicker finished: report=%s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v8, -1, -1);
    MEMORY[0x2199D75E8](v7, -1, -1);

    swift_release();
    v28(v27, v26);
  }
  else
  {
    v13 = *(void (**)(uint64_t, uint64_t))(v0 + 712);
    v14 = *(_QWORD *)(v0 + 536);
    v15 = *(_QWORD *)(v0 + 512);

    swift_release();
    v13(v14, v15);
  }
  v16 = *(_QWORD *)(v0 + 584);
  v17 = *(_QWORD *)(v0 + 576);
  v18 = *(_QWORD *)(v0 + 568);
  v19 = *(_QWORD *)(v0 + 560);
  v20 = *(_QWORD *)(v0 + 440);
  swift_beginAccess();
  v21 = *v29;
  v22 = *(_QWORD *)(v0 + 320);
  v23 = *(_BYTE *)(v0 + 328);
  v24 = *(_OWORD *)(v0 + 304);
  *(_QWORD *)v20 = *(_QWORD *)(v0 + 288);
  *(_BYTE *)(v20 + 8) = v21;
  *(_OWORD *)(v20 + 16) = v24;
  *(_QWORD *)(v20 + 32) = v22;
  *(_BYTE *)(v20 + 40) = v23;
  sub_2147F7A20(v19, v18, v17, v16);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2148201DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;

  v1 = *(_QWORD *)(v0 + 536);
  v2 = *(_QWORD *)(v0 + 520);
  v3 = *(_QWORD *)(v0 + 512);
  v5 = *(_QWORD *)(v0 + 464);
  v4 = *(_QWORD *)(v0 + 472);
  v6 = *(_QWORD *)(v0 + 456);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v7 = *(void **)(v0 + 704);
  if (qword_254D8F8F0 != -1)
    swift_once();
  v8 = sub_214852494();
  __swift_project_value_buffer(v8, (uint64_t)qword_254D8F8F8);
  v9 = v7;
  v10 = v7;
  v11 = sub_21485247C();
  v12 = sub_2148528CC();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v18 = v14;
    *(_DWORD *)v13 = 136315138;
    swift_getErrorValue();
    v15 = sub_214852B6C();
    *(_QWORD *)(v0 + 424) = sub_2147F3D14(v15, v16, &v18);
    sub_21485292C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2147EE000, v11, v12, "### PhotoPicker finish failed: error=%s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v14, -1, -1);
    MEMORY[0x2199D75E8](v13, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_214820430()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v1 = *(_QWORD *)(v0 + 752);
  v2 = *(_QWORD *)(v0 + 744);
  v3 = *(_QWORD *)(v0 + 736);
  v4 = *(_QWORD *)(v0 + 728);
  v5 = *(void (**)(uint64_t, uint64_t))(v0 + 712);
  v22 = *(_QWORD *)(v0 + 584);
  v21 = *(_QWORD *)(v0 + 576);
  v20 = *(_QWORD *)(v0 + 568);
  v6 = *(_QWORD *)(v0 + 560);
  v7 = *(_QWORD *)(v0 + 536);
  v8 = *(_QWORD *)(v0 + 512);
  swift_release();
  v5(v7, v8);
  sub_2147F7A20(v4, v3, v2, v1);
  swift_bridgeObjectRelease();
  sub_2147F7A20(v6, v20, v21, v22);
  swift_bridgeObjectRelease();
  v9 = *(void **)(v0 + 784);
  if (qword_254D8F8F0 != -1)
    swift_once();
  v10 = sub_214852494();
  __swift_project_value_buffer(v10, (uint64_t)qword_254D8F8F8);
  v11 = v9;
  v12 = v9;
  v13 = sub_21485247C();
  v14 = sub_2148528CC();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v23 = v16;
    *(_DWORD *)v15 = 136315138;
    swift_getErrorValue();
    v17 = sub_214852B6C();
    *(_QWORD *)(v0 + 424) = sub_2147F3D14(v17, v18, &v23);
    sub_21485292C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2147EE000, v13, v14, "### PhotoPicker finish failed: error=%s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v16, -1, -1);
    MEMORY[0x2199D75E8](v15, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2148206F4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[21] = a1;
  v2[22] = a2;
  v3 = sub_214852524();
  v2[23] = v3;
  v2[24] = *(_QWORD *)(v3 - 8);
  v2[25] = swift_task_alloc();
  sub_21481EEF0();
  v2[26] = sub_2148527C4();
  v2[27] = v4;
  return swift_task_switch();
}

void sub_214820770()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = sub_21485232C();
  v3 = v2;
  v0[28] = v1;
  v0[29] = v2;
  if (qword_254D8F8F0 != -1)
    swift_once();
  v4 = sub_214852494();
  v0[30] = __swift_project_value_buffer(v4, (uint64_t)qword_254D8F8F8);
  swift_bridgeObjectRetain_n();
  v5 = sub_21485247C();
  v6 = sub_2148528D8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v10 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_bridgeObjectRetain();
    v0[20] = sub_2147F3D14(v1, v3, &v10);
    sub_21485292C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2147EE000, v5, v6, "PhotoPicker transfer file: filename=%s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v8, -1, -1);
    MEMORY[0x2199D75E8](v7, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v0[31] = sub_214852380();
  v0[32] = v9;
  __asm { BR              X10 }
}

uint64_t sub_214820C8C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 272) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2[24] + 8))(v2[25], v2[23]);
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_214820D0C()
{
  uint64_t v0;

  sub_2147F8898(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 256));
  sub_214821054(v0 + 16);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_214820D58()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13[2];

  sub_2147F8898(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 256));
  sub_214821054(v0 + 16);
  v1 = *(void **)(v0 + 272);
  v2 = v1;
  swift_bridgeObjectRetain();
  v3 = v1;
  v4 = sub_21485247C();
  v5 = sub_2148528CC();
  if (os_log_type_enabled(v4, v5))
  {
    v7 = *(_QWORD *)(v0 + 224);
    v6 = *(_QWORD *)(v0 + 232);
    v8 = swift_slowAlloc();
    v9 = swift_slowAlloc();
    v13[0] = v9;
    *(_DWORD *)v8 = 136315394;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 152) = sub_2147F3D14(v7, v6, v13);
    sub_21485292C();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v8 + 12) = 2080;
    swift_getErrorValue();
    v10 = sub_214852B6C();
    *(_QWORD *)(v0 + 144) = sub_2147F3D14(v10, v11, v13);
    sub_21485292C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2147EE000, v4, v5, "### PhotoPicker transfer file failed: filename=%s, error=%s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v9, -1, -1);
    MEMORY[0x2199D75E8](v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();

  }
  swift_willThrow();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SKStepPhotoPickerClient.deinit()
{
  uint64_t v0;

  swift_weakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SKStepPhotoPickerClient.__deallocating_deinit()
{
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_214820FD8()
{
  uint64_t *v0;

  return SKEnvironmental<>.unownedExecutor.getter(*v0, (uint64_t)&protocol witness table for SKStepPhotoPickerClient);
}

uint64_t sub_214820FEC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  return swift_bridgeObjectRetain();
}

unint64_t sub_214820FFC()
{
  unint64_t result;

  result = qword_254D89300;
  if (!qword_254D89300)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepPhotoPickerReport, &type metadata for SKStepPhotoPickerReport);
    atomic_store(result, &qword_254D89300);
  }
  return result;
}

uint64_t method lookup function for SKStepPhotoPickerClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SKStepPhotoPickerClient.__allocating_init(client:environment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_214821054(uint64_t a1)
{
  sub_2147F8898(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21482108C()
{
  uint64_t v0;

  v0 = sub_214852494();
  __swift_allocate_value_buffer(v0, qword_254D8F998);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D8F998);
  sub_214801FC0();
  swift_bridgeObjectRetain();
  return sub_214852488();
}

uint64_t SKStepAppleAccountSetupServer.environment.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t SKStepAppleAccountSetupServer.__allocating_init(server:environment:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = swift_allocObject();
  v4 = *a2;
  *(_BYTE *)(v3 + 16) = 0;
  swift_weakInit();
  *(_BYTE *)(v3 + 40) = 0;
  *(_QWORD *)(v3 + 24) = v4;
  swift_weakAssign();
  swift_release();
  return v3;
}

uint64_t SKStepAppleAccountSetupServer.init(server:environment:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *a2;
  *(_BYTE *)(v2 + 16) = 0;
  swift_weakInit();
  *(_BYTE *)(v2 + 40) = 0;
  *(_QWORD *)(v2 + 24) = v3;
  swift_weakAssign();
  swift_release();
  return v2;
}

uint64_t SKStepAppleAccountSetupServer.start()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[7] = v2;
  sub_2147F4354(&qword_254D893C8, a2, (uint64_t (*)(uint64_t))type metadata accessor for SKStepAppleAccountSetupServer, (uint64_t)&protocol conformance descriptor for SKStepAppleAccountSetupServer);
  v3[8] = sub_2148527C4();
  v3[9] = v4;
  return swift_task_switch();
}

uint64_t sub_214821248()
{
  _QWORD *v0;
  uint64_t (*v1)(void);
  uint64_t Strong;
  uint64_t v3;
  char v5[9];

  if ((*(_BYTE *)(v0[7] + 40) & 1) != 0)
  {
    v1 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    Strong = swift_weakLoadStrong();
    v0[10] = Strong;
    if (Strong)
    {
      v0[11] = *(_QWORD *)(Strong + OBJC_IVAR____TtC8SetupKit8SKServer_nexusSession);
      v3 = swift_allocObject();
      swift_weakInit();
      v0[5] = &type metadata for SKStepAppleAccountSetupPrepareRequestHandler;
      v0[6] = sub_214821F94();
      v0[2] = &unk_254D893D8;
      v0[3] = v3;
      sub_21485262C();
      sub_2147F4354(&qword_254D88200, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC80], MEMORY[0x24BE6DC90]);
      swift_retain();
      sub_2148527C4();
      return swift_task_switch();
    }
    v5[0] = 2;
    type metadata accessor for SKError();
    SKError.__allocating_init(_:_:_:)((uint64_t)v5, 0x7265534B53206F4ELL, 0xEB00000000726576, 0);
    swift_willThrow();
    v1 = (uint64_t (*)(void))v0[1];
  }
  return v1();
}

uint64_t type metadata accessor for SKStepAppleAccountSetupServer()
{
  return objc_opt_self();
}

uint64_t sub_2148213E0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_214821404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  __int128 v5;

  *(_QWORD *)(v4 + 80) = a1;
  *(_QWORD *)(v4 + 88) = a4;
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v4 + 96) = *(_OWORD *)a2;
  *(_OWORD *)(v4 + 112) = v5;
  *(_QWORD *)(v4 + 128) = *(_QWORD *)(a2 + 32);
  return swift_task_switch();
}

uint64_t sub_21482142C()
{
  uint64_t v0;
  uint64_t Strong;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  char v8[9];

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 136) = Strong;
  if (Strong)
  {
    v3 = *(_QWORD *)(v0 + 120);
    v2 = *(_QWORD *)(v0 + 128);
    v5 = *(_QWORD *)(v0 + 104);
    v4 = *(_QWORD *)(v0 + 112);
    *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 96);
    *(_QWORD *)(v0 + 24) = v5;
    *(_QWORD *)(v0 + 32) = v4;
    *(_QWORD *)(v0 + 40) = v3;
    *(_QWORD *)(v0 + 48) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2147F3B60(v4);
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v6;
    *v6 = v0;
    v6[1] = sub_214821558;
    return SKStepAppleAccountSetupServer._prepare(configuration:)(v0 + 16);
  }
  else
  {
    v8[0] = 1;
    type metadata accessor for SKError();
    SKError.__allocating_init(_:_:_:)((uint64_t)v8, 0x6720726576726553, 0xEB00000000656E6FLL, 0);
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_214821558()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 152) = v0;
  swift_task_dealloc();
  v3 = *(_QWORD *)(v2 + 112);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2147F3B90(v3);
  return swift_task_switch();
}

uint64_t sub_21482161C()
{
  uint64_t v0;

  sub_214852518();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21482165C()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_214821690(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  __int128 v7;

  v6 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *(_QWORD *)v6 = v3;
  *(_QWORD *)(v6 + 8) = sub_2147F4FF0;
  *(_QWORD *)(v6 + 80) = a1;
  *(_QWORD *)(v6 + 88) = v2;
  v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v6 + 96) = *(_OWORD *)a2;
  *(_OWORD *)(v6 + 112) = v7;
  *(_QWORD *)(v6 + 128) = *(_QWORD *)(a2 + 32);
  return swift_task_switch();
}

uint64_t SKStepAppleAccountSetupServer._prepare(configuration:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v2 + 32) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88728);
  *(_QWORD *)(v2 + 40) = swift_task_alloc();
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)a1;
  *(_OWORD *)(v2 + 64) = v4;
  *(_QWORD *)(v2 + 80) = *(_QWORD *)(a1 + 32);
  sub_2147F4354(&qword_254D893C8, v5, (uint64_t (*)(uint64_t))type metadata accessor for SKStepAppleAccountSetupServer, (uint64_t)&protocol conformance descriptor for SKStepAppleAccountSetupServer);
  *(_QWORD *)(v2 + 88) = sub_2148527C4();
  *(_QWORD *)(v2 + 96) = v6;
  return swift_task_switch();
}

uint64_t sub_2148217B8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t Strong;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t (*v32)(void);
  os_log_type_t type;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  if (qword_254D8F990 != -1)
    swift_once();
  v1 = v0[8];
  v2 = sub_214852494();
  __swift_project_value_buffer(v2, (uint64_t)qword_254D8F998);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2147F3B60(v1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2147F3B60(v1);
  v3 = sub_21485247C();
  v4 = sub_2148528D8();
  v5 = os_log_type_enabled(v3, v4);
  v7 = v0[9];
  v6 = v0[10];
  v8 = v0[7];
  v9 = v0[8];
  v10 = v0[6];
  if (v5)
  {
    type = v4;
    v11 = (uint8_t *)swift_slowAlloc();
    v34 = swift_slowAlloc();
    v36 = v34;
    v37 = v10;
    *(_DWORD *)v11 = 136315138;
    v38 = v8;
    v39 = v9;
    v40 = v7;
    v41 = v6;
    v12 = SKStepAppleAccountSetupConfiguration.description.getter();
    v0[3] = sub_2147F3D14(v12, v13, &v36);
    sub_21485292C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2147F3B90(v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2147F3B90(v9);
    _os_log_impl(&dword_2147EE000, v3, type, "AppleAccountSetup prepare start: configuration=%s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v34, -1, -1);
    MEMORY[0x2199D75E8](v11, -1, -1);

    v14 = v0[8];
    if (v14)
    {
LABEL_5:
      sub_2147F3B60(v14);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v15 = sub_21485247C();
      v16 = sub_2148528D8();
      v17 = os_log_type_enabled(v15, v16);
      v19 = v0[9];
      v18 = v0[10];
      v20 = v0[8];
      if (v17)
      {
        v21 = (uint8_t *)swift_slowAlloc();
        v35 = swift_slowAlloc();
        *(_DWORD *)v21 = 136315138;
        v36 = v35;
        v37 = v14;
        v38 = v19;
        v39 = v18;
        v22 = SKStepAppleAccountSetupReport.description.getter();
        v0[2] = sub_2147F3D14(v22, v23, &v36);
        sub_21485292C();
        swift_bridgeObjectRelease();
        sub_2147F3B90(v20);
        sub_2147F3B90(v20);
        _os_log_impl(&dword_2147EE000, v15, v16, "AppleAccountSetup prepare success: %s, mock", v21, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2199D75E8](v35, -1, -1);
        MEMORY[0x2199D75E8](v21, -1, -1);
      }
      else
      {
        sub_2147F3B90(v0[8]);
        sub_2147F3B90(v20);
      }

      swift_task_dealloc();
      v32 = (uint64_t (*)(void))v0[1];
      return v32();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2147F3B90(v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2147F3B90(v9);

    v14 = v0[8];
    if (v14)
      goto LABEL_5;
  }
  Strong = swift_weakLoadStrong();
  v0[13] = Strong;
  if (Strong)
  {
    v25 = Strong;
    v26 = objc_allocWithZone((Class)SKAISSetupContext);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2147F3B60(0);
    v27 = objc_msgSend(v26, sel_init);
    v0[14] = v27;
    type metadata accessor for SKAIDAServiceType();
    sub_2147F4354(&qword_254D893F0, 255, (uint64_t (*)(uint64_t))type metadata accessor for SKAIDAServiceType, (uint64_t)&unk_214859CC4);
    v28 = v27;
    v29 = (void *)sub_214852884();
    objc_msgSend(v28, sel_setDesiredServiceTypes_, v29);

    v30 = (void *)sub_214852884();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2147F3B90(0);
    objc_msgSend(v28, sel_setRequiredServiceTypes_, v30);

    v0[15] = *(_QWORD *)(v25 + OBJC_IVAR____TtC8SetupKit8SKServer_nexusSession);
    sub_21485262C();
    sub_2147F4354(&qword_254D88200, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC80], MEMORY[0x24BE6DC90]);
    swift_retain();
    sub_2148527C4();
    return swift_task_switch();
  }
  LOBYTE(v37) = 2;
  type metadata accessor for SKError();
  SKError.__allocating_init(_:_:_:)((uint64_t)&v37, 0x7265534B53206F4ELL, 0xEB00000000726576, 0);
  swift_willThrow();
  swift_task_dealloc();
  v32 = (uint64_t (*)(void))v0[1];
  return v32();
}

uint64_t sub_214821DC4()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 128) = sub_2148525A8();
  *(_QWORD *)(v0 + 136) = 0;
  return swift_task_switch();
}

uint64_t sub_214821E1C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;

  v1 = *(void **)(v0 + 128);
  v2 = *(void **)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  swift_release();
  objc_msgSend(v2, sel_setMessageSessionTemplate_, v1);

  objc_msgSend(v2, sel_setLocalRole_, 1);
  objc_msgSend(v2, sel_setRemoteRole_, 4);
  v10 = *(_QWORD *)(v4 + 24);
  v5 = SKEnvironmentValues.dispatchQueue.getter();
  v6 = objc_msgSend(objc_allocWithZone((Class)SKAISSetupController), sel_initWithQueue_, v5, v10);

  v7 = sub_214852800();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v3, 1, 1, v7);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v6;
  v8[5] = v2;
  sub_214822B78(v3, (uint64_t)&unk_254D89400, (uint64_t)v8);
  swift_release();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_214821F48()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 112);
  swift_release();

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_214821F94()
{
  unint64_t result;

  result = qword_254D893E0;
  if (!qword_254D893E0)
  {
    result = MEMORY[0x2199D7540](&unk_214859700, &type metadata for SKStepAppleAccountSetupPrepareRequestHandler);
    atomic_store(result, (unint64_t *)&qword_254D893E0);
  }
  return result;
}

uint64_t SKStepAppleAccountSetupServer.cancel()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[2] = v2;
  sub_2147F4354(&qword_254D893C8, a2, (uint64_t (*)(uint64_t))type metadata accessor for SKStepAppleAccountSetupServer, (uint64_t)&protocol conformance descriptor for SKStepAppleAccountSetupServer);
  v3[3] = sub_2148527C4();
  v3[4] = v4;
  return swift_task_switch();
}

uint64_t sub_214822044()
{
  uint64_t v0;
  uint64_t Strong;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 16) = 1;
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    *(_QWORD *)(v0 + 40) = *(_QWORD *)(Strong + OBJC_IVAR____TtC8SetupKit8SKServer_nexusSession);
    swift_retain();
    swift_release();
    sub_21485262C();
    sub_2147F4354(&qword_254D88200, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC80], MEMORY[0x24BE6DC90]);
    sub_2148527C4();
    return swift_task_switch();
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(v0 + 16) + 40) = 0;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_214822124()
{
  sub_2148525B4();
  return swift_task_switch();
}

id sub_214822174(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  void *v5;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  type metadata accessor for SKAIDAServiceType();
  sub_2147F4354(&qword_254D893F0, 255, (uint64_t (*)(uint64_t))type metadata accessor for SKAIDAServiceType, (uint64_t)&unk_214859CC4);
  v3 = v2;
  v4 = (void *)sub_214852884();
  objc_msgSend(v3, sel_setDesiredServiceTypes_, v4);

  v5 = (void *)sub_214852884();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2147F3B90(v1);
  objc_msgSend(v3, sel_setRequiredServiceTypes_, v5);

  return v3;
}

void type metadata accessor for SKAIDAServiceType()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_254D89568)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_254D89568);
  }
}

uint64_t sub_2148222E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[25] = a4;
  v5[26] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D881E0);
  v5[27] = v6;
  v5[28] = *(_QWORD *)(v6 - 8);
  v5[29] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_214822348()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t *boxed_opaque_existential_0;
  _QWORD *v7;

  v2 = v0[28];
  v1 = v0[29];
  v3 = v0[26];
  v4 = v0[27];
  v5 = (void *)v0[25];
  v0[7] = v0 + 22;
  v0[2] = v0;
  v0[3] = sub_214822478;
  swift_continuation_init();
  v0[17] = v4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v0 + 14);
  sub_214826F10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88210);
  sub_2148527D0();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v2 + 32))(boxed_opaque_existential_0, v1, v4);
  v0[10] = MEMORY[0x24BDAC760];
  v7 = v0 + 10;
  v7[1] = 1107296256;
  v7[2] = sub_2147F3C00;
  v7[3] = &block_descriptor_2;
  objc_msgSend(v5, sel_setupWithContext_completionHandler_, v3, v7);
  return swift_continuation_await();
}

uint64_t sub_214822478()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 240) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2148224D8()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = *(id *)(v0 + 176);
  SKStepAppleAccountSetupReport.init(aisReport:)(v1, &v14);
  v2 = v14;
  v3 = v15;
  v4 = v16;
  if (qword_254D8F990 != -1)
    swift_once();
  v5 = sub_214852494();
  __swift_project_value_buffer(v5, (uint64_t)qword_254D8F998);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = sub_21485247C();
  v7 = sub_2148528D8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    *(_DWORD *)v8 = 136315138;
    v13 = v9;
    v14 = v2;
    v15 = v3;
    v16 = v4;
    v10 = SKStepAppleAccountSetupReport.description.getter();
    *(_QWORD *)(v0 + 192) = sub_2147F3D14(v10, v11, &v13);
    sub_21485292C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2147EE000, v6, v7, "AppleAccountSetup prepare success: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v9, -1, -1);
    MEMORY[0x2199D75E8](v8, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2148226DC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  void *v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;

  swift_willThrow();
  if (qword_254D8F990 != -1)
    swift_once();
  v1 = *(void **)(v0 + 240);
  v2 = sub_214852494();
  __swift_project_value_buffer(v2, (uint64_t)qword_254D8F998);
  v3 = v1;
  v4 = v1;
  v5 = sub_21485247C();
  v6 = sub_2148528CC();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 240);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v14 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_getErrorValue();
    v11 = sub_214852B6C();
    *(_QWORD *)(v0 + 184) = sub_2147F3D14(v11, v12, &v14);
    sub_21485292C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2147EE000, v5, v6, "### AppleAccountSetup perform failed: error=%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v10, -1, -1);
    MEMORY[0x2199D75E8](v9, -1, -1);

  }
  else
  {

  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2148228DC()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_214822910()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_2147F4FF0;
  return sub_2148222E4((uint64_t)v4, v5, v6, v2, v3);
}

void SKStepAppleAccountSetupReport.init(aisReport:)(void *a1@<X0>, _QWORD *a2@<X8>)
{
  id v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;

  v23 = MEMORY[0x24BEE4B08];
  v4 = objc_msgSend(a1, sel_accountAltDSIDsByService);
  type metadata accessor for SKAIDAServiceType();
  sub_2147F4354(&qword_254D893F0, 255, (uint64_t (*)(uint64_t))type metadata accessor for SKAIDAServiceType, (uint64_t)&unk_214859CC4);
  v5 = sub_214852668();

  v6 = 0;
  v7 = v5 + 64;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v13 = v12 | (v6 << 6);
      goto LABEL_5;
    }
    v14 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
LABEL_26:
      __break(1u);
      return;
    }
    if (v14 >= v11)
      goto LABEL_21;
    v15 = *(_QWORD *)(v7 + 8 * v14);
    ++v6;
    if (!v15)
    {
      v6 = v14 + 1;
      if (v14 + 1 >= v11)
        goto LABEL_21;
      v15 = *(_QWORD *)(v7 + 8 * v6);
      if (!v15)
      {
        v6 = v14 + 2;
        if (v14 + 2 >= v11)
          goto LABEL_21;
        v15 = *(_QWORD *)(v7 + 8 * v6);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v10 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v6 << 6);
LABEL_5:
    sub_214824CA0(&v22, *(id *)(*(_QWORD *)(v5 + 48) + 8 * v13));

  }
  v16 = v14 + 3;
  if (v16 < v11)
  {
    v15 = *(_QWORD *)(v7 + 8 * v16);
    if (!v15)
    {
      while (1)
      {
        v6 = v16 + 1;
        if (__OFADD__(v16, 1))
          goto LABEL_26;
        if (v6 >= v11)
          goto LABEL_21;
        v15 = *(_QWORD *)(v7 + 8 * v6);
        ++v16;
        if (v15)
          goto LABEL_20;
      }
    }
    v6 = v16;
    goto LABEL_20;
  }
LABEL_21:
  swift_release();
  v17 = objc_msgSend(a1, sel_createdPersonaID);
  if (v17)
  {
    v18 = v17;
    v19 = sub_2148526C8();
    v21 = v20;

  }
  else
  {

    v19 = 0;
    v21 = 0;
  }
  *a2 = v23;
  a2[1] = v19;
  a2[2] = v21;
}

uint64_t sub_214822B78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_214852800();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2148527F4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_214826E3C(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2148527C4();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t SKStepAppleAccountSetupServer.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_weakDestroy();
  return v0;
}

uint64_t SKStepAppleAccountSetupServer.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_214822D0C()
{
  uint64_t *v0;

  return SKEnvironmental<>.unownedExecutor.getter(*v0, (uint64_t)&protocol witness table for SKStepAppleAccountSetupServer);
}

uint64_t sub_214822D20()
{
  sub_2147F4354(&qword_254D89570, 255, (uint64_t (*)(uint64_t))type metadata accessor for SKAIDAServiceType, (uint64_t)&unk_2148598C4);
  return sub_21485277C();
}

uint64_t sub_214822D98()
{
  sub_2147F4354(&qword_254D89570, 255, (uint64_t (*)(uint64_t))type metadata accessor for SKAIDAServiceType, (uint64_t)&unk_2148598C4);
  return sub_214852764();
}

uint64_t SKStepAppleAccountSetupConfiguration.desiredServiceTypes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SKStepAppleAccountSetupConfiguration.desiredServiceTypes.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*SKStepAppleAccountSetupConfiguration.desiredServiceTypes.modify())()
{
  return nullsub_1;
}

uint64_t SKStepAppleAccountSetupConfiguration.requiredServiceTypes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SKStepAppleAccountSetupConfiguration.requiredServiceTypes.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*SKStepAppleAccountSetupConfiguration.requiredServiceTypes.modify())()
{
  return nullsub_1;
}

uint64_t SKStepAppleAccountSetupConfiguration.mockReport.getter@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v1[2];
  v3 = v1[3];
  v4 = v1[4];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  return sub_2147F3B60(v2);
}

__n128 SKStepAppleAccountSetupConfiguration.mockReport.setter(__n128 *a1)
{
  uint64_t v1;
  unint64_t v2;
  __n128 result;
  __n128 v4;

  v4 = *a1;
  v2 = a1[1].n128_u64[0];
  sub_2147F3B90(*(_QWORD *)(v1 + 16));
  result = v4;
  *(__n128 *)(v1 + 16) = v4;
  *(_QWORD *)(v1 + 32) = v2;
  return result;
}

uint64_t (*SKStepAppleAccountSetupConfiguration.mockReport.modify())()
{
  return nullsub_1;
}

uint64_t SKStepAppleAccountSetupConfiguration.init(requiredServiceTypes:desiredServiceTypes:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = a2;
  a3[1] = result;
  a3[3] = 0;
  a3[4] = 0;
  a3[2] = 0;
  return result;
}

uint64_t SKStepAppleAccountSetupConfiguration.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  int v14;
  int v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  int v32;
  int v33;
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[2];
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  _QWORD v61[2];
  uint64_t v62;
  unint64_t v63;

  v1 = sub_2148523F8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  v56 = v0[1];
  v7 = v0[2];
  v6 = v0[3];
  v50 = v0[4];
  v51 = v6;
  v62 = 0;
  v63 = 0xE000000000000000;
  sub_2148523EC();
  v58 = 0;
  v59 = 0xE000000000000000;
  sub_21485298C();
  v8 = v5;
  swift_bridgeObjectRelease();
  v58 = 0xD000000000000015;
  v59 = 0x800000021485E5F0;
  v9 = *(_QWORD *)(v5 + 16);
  v10 = MEMORY[0x24BEE4AF8];
  v53 = v2;
  v54 = v1;
  v55 = v4;
  v52 = v7;
  if (v9)
  {
    v61[0] = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    v49 = v8;
    sub_214825888(0, v9, 0);
    v11 = v49;
    v10 = v61[0];
    result = sub_214825A0C(v49);
    v13 = result;
    v15 = v14;
    v17 = v16 & 1;
    v57 = v11 + 56;
    while ((v13 & 0x8000000000000000) == 0 && v13 < 1 << *(_BYTE *)(v11 + 32))
    {
      if (((*(_QWORD *)(v57 + (((unint64_t)v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
        goto LABEL_29;
      if (*(_DWORD *)(v11 + 36) != v15)
        goto LABEL_30;
      v18 = sub_2148526C8();
      v20 = v19;
      v61[0] = v10;
      v22 = *(_QWORD *)(v10 + 16);
      v21 = *(_QWORD *)(v10 + 24);
      if (v22 >= v21 >> 1)
      {
        sub_214825888(v21 > 1, v22 + 1, 1);
        v11 = v49;
        v10 = v61[0];
      }
      *(_QWORD *)(v10 + 16) = v22 + 1;
      v23 = v10 + 16 * v22;
      *(_QWORD *)(v23 + 32) = v18;
      *(_QWORD *)(v23 + 40) = v20;
      result = sub_214825AAC(v13, v15, v17 & 1, v11);
      v13 = result;
      v15 = v24;
      v17 = v25 & 1;
      if (!--v9)
      {
        sub_214825DD8(result, v24, v25 & 1);
        swift_bridgeObjectRelease();
        v4 = v55;
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
  }
  else
  {
LABEL_11:
    v61[0] = v10;
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D89410);
    v27 = sub_214825DE4();
    sub_214852680();
    swift_bridgeObjectRelease();
    sub_214852704();
    swift_bridgeObjectRelease();
    sub_214852704();
    sub_2148526D4();
    swift_bridgeObjectRelease();
    v58 = 0;
    v59 = 0xE000000000000000;
    sub_21485298C();
    swift_bridgeObjectRelease();
    v58 = 0xD000000000000016;
    v59 = 0x800000021485E610;
    v28 = *(_QWORD *)(v56 + 16);
    v29 = MEMORY[0x24BEE4AF8];
    if (!v28)
    {
LABEL_21:
      v61[0] = v29;
      sub_214852680();
      swift_bridgeObjectRelease();
      sub_214852704();
      swift_bridgeObjectRelease();
      sub_214852704();
      sub_2148526D4();
      swift_bridgeObjectRelease();
      v45 = v53;
      v44 = v54;
      if (v52)
      {
        strcpy((char *)v61, "mockReport={");
        BYTE5(v61[1]) = 0;
        HIWORD(v61[1]) = -5120;
        v58 = v52;
        v59 = v51;
        v60 = v50;
        SKStepAppleAccountSetupReport.description.getter();
        sub_214852704();
        swift_bridgeObjectRelease();
        sub_214852704();
        sub_2148526D4();
        swift_bridgeObjectRelease();
      }
      v46 = v62;
      v47 = HIBYTE(v63) & 0xF;
      if ((v63 & 0x2000000000000000) == 0)
        v47 = v62 & 0xFFFFFFFFFFFFLL;
      if (!v47)
      {
        swift_bridgeObjectRelease();
        v46 = 0x746C7561666564;
      }
      (*(void (**)(char *, uint64_t))(v45 + 8))(v4, v44);
      return v46;
    }
    v48[1] = v27;
    v49 = v26;
    v61[0] = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_214825888(0, v28, 0);
    v30 = v56;
    v29 = v61[0];
    result = sub_214825A0C(v56);
    v31 = result;
    v33 = v32;
    v35 = v34 & 1;
    v57 = v30 + 56;
    while ((v31 & 0x8000000000000000) == 0 && v31 < 1 << *(_BYTE *)(v30 + 32))
    {
      if (((*(_QWORD *)(v57 + (((unint64_t)v31 >> 3) & 0xFFFFFFFFFFFFF8)) >> v31) & 1) == 0)
        goto LABEL_32;
      if (*(_DWORD *)(v30 + 36) != v33)
        goto LABEL_33;
      v36 = sub_2148526C8();
      v38 = v37;
      v61[0] = v29;
      v40 = *(_QWORD *)(v29 + 16);
      v39 = *(_QWORD *)(v29 + 24);
      if (v40 >= v39 >> 1)
      {
        sub_214825888(v39 > 1, v40 + 1, 1);
        v30 = v56;
        v29 = v61[0];
      }
      *(_QWORD *)(v29 + 16) = v40 + 1;
      v41 = v29 + 16 * v40;
      *(_QWORD *)(v41 + 32) = v36;
      *(_QWORD *)(v41 + 40) = v38;
      result = sub_214825AAC(v31, v33, v35 & 1, v30);
      v31 = result;
      v33 = v42;
      v35 = v43 & 1;
      if (!--v28)
      {
        sub_214825DD8(result, v42, v43 & 1);
        swift_bridgeObjectRelease();
        v4 = v55;
        goto LABEL_21;
      }
    }
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_214823458(uint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v31;
  uint64_t v32;
  int64_t v33;
  int64_t v34;
  uint64_t v35;

  if (result == a2)
    return 1;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v32 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(result + 56);
  v33 = (unint64_t)(v4 + 63) >> 6;
  v35 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      v7 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v34 = v3;
      v8 = v7 | (v3 << 6);
      goto LABEL_25;
    }
    v9 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_44;
    }
    if (v9 >= v33)
      return 1;
    v10 = *(_QWORD *)(v32 + 8 * v9);
    v11 = v3 + 1;
    if (!v10)
    {
      v11 = v3 + 2;
      if (v3 + 2 >= v33)
        return 1;
      v10 = *(_QWORD *)(v32 + 8 * v11);
      if (!v10)
      {
        v11 = v3 + 3;
        if (v3 + 3 >= v33)
          return 1;
        v10 = *(_QWORD *)(v32 + 8 * v11);
        if (!v10)
          break;
      }
    }
LABEL_24:
    v6 = (v10 - 1) & v10;
    v34 = v11;
    v8 = __clz(__rbit64(v10)) + (v11 << 6);
LABEL_25:
    v13 = result;
    v14 = *(void **)(*(_QWORD *)(result + 48) + 8 * v8);
    sub_2148526C8();
    sub_214852B84();
    v15 = v14;
    sub_2148526EC();
    v16 = sub_214852B9C();
    swift_bridgeObjectRelease();
    v17 = -1 << *(_BYTE *)(a2 + 32);
    v18 = v16 & ~v17;
    if (((*(_QWORD *)(v35 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
      goto LABEL_40;
    v19 = sub_2148526C8();
    v21 = v20;
    if (v19 == sub_2148526C8() && v21 == v22)
    {
LABEL_7:
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v24 = sub_214852B18();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v24 & 1) == 0)
      {
        v25 = ~v17;
        while (1)
        {
          v18 = (v18 + 1) & v25;
          if (((*(_QWORD *)(v35 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
            break;
          v26 = sub_2148526C8();
          v28 = v27;
          if (v26 == sub_2148526C8() && v28 == v29)
            goto LABEL_7;
          v31 = sub_214852B18();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v31 & 1) != 0)
            goto LABEL_8;
        }
LABEL_40:

        return 0;
      }
    }
LABEL_8:

    result = v13;
    v3 = v34;
  }
  v12 = v3 + 4;
  if (v3 + 4 >= v33)
    return 1;
  v10 = *(_QWORD *)(v32 + 8 * v12);
  if (v10)
  {
    v11 = v3 + 4;
    goto LABEL_24;
  }
  while (1)
  {
    v11 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v11 >= v33)
      return 1;
    v10 = *(_QWORD *)(v32 + 8 * v11);
    ++v12;
    if (v10)
      goto LABEL_24;
  }
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_214823768(char a1)
{
  uint64_t result;

  result = 0xD000000000000013;
  if (a1)
  {
    if (a1 == 1)
      return 0xD000000000000014;
    else
      return 0x6F7065526B636F6DLL;
  }
  return result;
}

uint64_t sub_2148237C8()
{
  char *v0;

  return sub_214823768(*v0);
}

uint64_t sub_2148237D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_214826BFC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2148237F4()
{
  sub_214825E30();
  return sub_214852BD8();
}

uint64_t sub_21482381C()
{
  sub_214825E30();
  return sub_214852BE4();
}

uint64_t SKStepAppleAccountSetupConfiguration.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D89420);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v8 = v1[1];
  v17 = v1[2];
  v18 = v8;
  v10 = v1[3];
  v15 = v1[4];
  v16 = v10;
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_214825E30();
  sub_214852BB4();
  v19 = v9;
  v22 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D89428);
  sub_214825EB8(&qword_254D89430, &qword_254D89438, (uint64_t)&protocol conformance descriptor for SKAIDAServiceType, MEMORY[0x24BEE1700]);
  sub_214852AD0();
  if (!v2)
  {
    v12 = v16;
    v11 = v17;
    v19 = v18;
    v22 = 1;
    sub_214852AD0();
    v19 = v11;
    v20 = v12;
    v21 = v15;
    v22 = 2;
    sub_214825E74();
    sub_214852AB8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t SKStepAppleAccountSetupConfiguration.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D89448);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_214825E30();
  sub_214852BA8();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v16 = 0;
  }
  else
  {
    v17 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D89428);
    v21 = 0;
    sub_214825EB8(&qword_254D89450, &qword_254D89458, (uint64_t)&protocol conformance descriptor for SKAIDAServiceType, MEMORY[0x24BEE1720]);
    sub_214852A7C();
    v10 = v18;
    v21 = 1;
    swift_bridgeObjectRetain();
    sub_214852A7C();
    v11 = v18;
    v21 = 2;
    sub_214825F40();
    swift_bridgeObjectRetain();
    sub_214852A64();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v12 = v18;
    v13 = v19;
    v14 = v20;
    sub_2147F3B60(v18);
    sub_2147F3B90(0);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2147F3B60(v12);
    sub_2147F3B90(v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v15 = v17;
    *v17 = v10;
    v15[1] = v11;
    v15[2] = v12;
    v15[3] = v13;
    v15[4] = v14;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v16 = v12;
  }
  return sub_2147F3B90(v16);
}

uint64_t sub_214823D04@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return SKStepAppleAccountSetupConfiguration.init(from:)(a1, a2);
}

uint64_t sub_214823D18(_QWORD *a1)
{
  return SKStepAppleAccountSetupConfiguration.encode(to:)(a1);
}

uint64_t SKStepAppleAccountSetupReport.actualServiceTypes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SKStepAppleAccountSetupReport.actualServiceTypes.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*SKStepAppleAccountSetupReport.actualServiceTypes.modify())()
{
  return nullsub_1;
}

uint64_t SKStepAppleAccountSetupReport.personaIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SKStepAppleAccountSetupReport.personaIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t (*SKStepAppleAccountSetupReport.personaIdentifier.modify())()
{
  return nullsub_1;
}

void SKStepAppleAccountSetupReport.init()(_QWORD *a1@<X8>)
{
  uint64_t v1;

  v1 = MEMORY[0x24BEE4B08];
  a1[1] = 0;
  a1[2] = 0;
  *a1 = v1;
}

uint64_t SKStepAppleAccountSetupReport.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  int v12;
  int v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;

  v1 = sub_2148523F8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  v6 = v0[1];
  v30 = v0[2];
  v36 = 0;
  v37 = 0xE000000000000000;
  sub_2148523EC();
  v34 = 0;
  v35 = 0xE000000000000000;
  sub_21485298C();
  swift_bridgeObjectRelease();
  v34 = 0xD000000000000014;
  v35 = 0x800000021485E630;
  v7 = *(_QWORD *)(v5 + 16);
  v8 = MEMORY[0x24BEE4AF8];
  if (v7)
  {
    v25 = v6;
    v26 = v4;
    v27 = v2;
    v28 = v1;
    v32 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    v29 = v5;
    sub_214825888(0, v7, 0);
    v9 = v29;
    v8 = v32;
    result = sub_214825A0C(v29);
    v11 = result;
    v13 = v12;
    v15 = v14 & 1;
    v31 = v9 + 56;
    while ((v11 & 0x8000000000000000) == 0 && v11 < 1 << *(_BYTE *)(v9 + 32))
    {
      if (((*(_QWORD *)(v31 + (((unint64_t)v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
        goto LABEL_13;
      if (*(_DWORD *)(v9 + 36) != v13)
        goto LABEL_14;
      v16 = sub_2148526C8();
      v18 = v17;
      v32 = v8;
      v20 = *(_QWORD *)(v8 + 16);
      v19 = *(_QWORD *)(v8 + 24);
      if (v20 >= v19 >> 1)
      {
        sub_214825888(v19 > 1, v20 + 1, 1);
        v9 = v29;
        v8 = v32;
      }
      *(_QWORD *)(v8 + 16) = v20 + 1;
      v21 = v8 + 16 * v20;
      *(_QWORD *)(v21 + 32) = v16;
      *(_QWORD *)(v21 + 40) = v18;
      result = sub_214825AAC(v11, v13, v15 & 1, v9);
      v11 = result;
      v13 = v22;
      v15 = v23 & 1;
      if (!--v7)
      {
        sub_214825DD8(result, v22, v23 & 1);
        swift_bridgeObjectRelease();
        v2 = v27;
        v1 = v28;
        v6 = v25;
        v4 = v26;
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
  }
  else
  {
LABEL_11:
    v32 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D89410);
    sub_214825DE4();
    sub_214852680();
    swift_bridgeObjectRelease();
    sub_214852704();
    swift_bridgeObjectRelease();
    sub_214852704();
    sub_2148526D4();
    swift_bridgeObjectRelease();
    v34 = 0;
    v35 = 0xE000000000000000;
    sub_21485298C();
    sub_214852704();
    v32 = v6;
    v33 = v30;
    sub_214852B0C();
    sub_2148526D4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return v36;
  }
  return result;
}

unint64_t sub_214824120()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000011;
  else
    return 0xD000000000000012;
}

uint64_t sub_21482415C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_214826D50(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_214824180()
{
  sub_214825F84();
  return sub_214852BD8();
}

uint64_t sub_2148241A8()
{
  sub_214825F84();
  return sub_214852BE4();
}

uint64_t SKStepAppleAccountSetupReport.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  char v13;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D89468);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v8 = v1[1];
  v11[1] = v1[2];
  v11[2] = v8;
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_214825F84();
  sub_214852BB4();
  v14 = v9;
  v13 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D89428);
  sub_214825EB8(&qword_254D89430, &qword_254D89438, (uint64_t)&protocol conformance descriptor for SKAIDAServiceType, MEMORY[0x24BEE1700]);
  sub_214852AD0();
  if (!v2)
  {
    v12 = 1;
    sub_214852A94();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t SKStepAppleAccountSetupReport.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[16];
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D89470);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_214825F84();
  sub_214852BA8();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D89428);
    v14[15] = 0;
    sub_214825EB8(&qword_254D89450, &qword_254D89458, (uint64_t)&protocol conformance descriptor for SKAIDAServiceType, MEMORY[0x24BEE1720]);
    sub_214852A7C();
    v10 = v15;
    v14[14] = 1;
    swift_bridgeObjectRetain();
    v11 = sub_214852A40();
    v13 = v12;
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *a2 = v10;
    a2[1] = v11;
    a2[2] = v13;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_214824524@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return SKStepAppleAccountSetupReport.init(from:)(a1, a2);
}

uint64_t sub_214824538(_QWORD *a1)
{
  return SKStepAppleAccountSetupReport.encode(to:)(a1);
}

uint64_t sub_214824554()
{
  sub_214825FC8();
  return sub_214852BD8();
}

uint64_t sub_21482457C()
{
  sub_214825FC8();
  return sub_214852BE4();
}

uint64_t sub_2148245A4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _OWORD v10[3];
  uint64_t v11;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D89478);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[0] = *(_OWORD *)(v2 + 16);
  v8 = *(_QWORD *)(v2 + 32);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_214825FC8();
  sub_214852BB4();
  v10[1] = *(_OWORD *)v2;
  v10[2] = v10[0];
  v11 = v8;
  sub_21482600C();
  sub_214852AD0();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

__n128 sub_2148246BC@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v4;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(__n128 *)a1;
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v4;
  *(_QWORD *)(a2 + 32) = v2;
  return result;
}

uint64_t sub_2148246D0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __int128 v10;
  _OWORD v12[2];
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D89488);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_214825FC8();
  sub_214852BA8();
  if (!v2)
  {
    sub_214826050();
    sub_214852A7C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v9 = v13;
    v10 = v12[1];
    *(_OWORD *)a2 = v12[0];
    *(_OWORD *)(a2 + 16) = v10;
    *(_QWORD *)(a2 + 32) = v9;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

unint64_t sub_2148247F8()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_214824814@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2148246D0(a1, a2);
}

uint64_t sub_214824828(_QWORD *a1)
{
  return sub_2148245A4(a1);
}

uint64_t sub_21482483C(uint64_t a1, uint64_t a2)
{
  return sub_2148249F0(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_214824848(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_2148526B0();
  *a2 = 0;
  return result;
}

uint64_t sub_2148248BC(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_2148526BC();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_214824938@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_2148526C8();
  v2 = sub_2148526A4();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_214824978@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2148526A4();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2148249BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2148526C8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2148249E4(uint64_t a1, uint64_t a2)
{
  return sub_2148249F0(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_2148249F0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_2148526C8();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_214824A2C()
{
  sub_2148526C8();
  sub_2148526EC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_214824A6C()
{
  uint64_t v0;

  sub_2148526C8();
  sub_214852B84();
  sub_2148526EC();
  v0 = sub_214852B9C();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_214824ADC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_2148526C8();
  v2 = v1;
  if (v0 == sub_2148526C8() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_214852B18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_214824B64()
{
  sub_2147F4354(&qword_254D893F0, 255, (uint64_t (*)(uint64_t))type metadata accessor for SKAIDAServiceType, (uint64_t)&unk_214859CC4);
  sub_2147F4354(&qword_254D89588, 255, (uint64_t (*)(uint64_t))type metadata accessor for SKAIDAServiceType, (uint64_t)&unk_214859900);
  return sub_214852A34();
}

uint64_t sub_214824BF0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_214824C54;
  return v6(a1);
}

uint64_t sub_214824C54()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_214824CA0(_QWORD *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  char isUniquelyReferenced_nonNull_native;
  id v24;
  void *v26;
  id v27;
  uint64_t v28;

  v3 = v2;
  v6 = *v2;
  sub_2148526C8();
  sub_214852B84();
  swift_bridgeObjectRetain();
  sub_2148526EC();
  v7 = sub_214852B9C();
  swift_bridgeObjectRelease();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v3;
    *v3 = 0x8000000000000000;
    v24 = a2;
    sub_2148251D8((uint64_t)v24, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v28;
    swift_bridgeObjectRelease();
    *a1 = v24;
    return 1;
  }
  v10 = sub_2148526C8();
  v12 = v11;
  if (v10 == sub_2148526C8() && v12 == v13)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v15 = sub_214852B18();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      v16 = ~v8;
      do
      {
        v9 = (v9 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
          goto LABEL_15;
        v17 = sub_2148526C8();
        v19 = v18;
        if (v17 == sub_2148526C8() && v19 == v20)
          goto LABEL_16;
        v22 = sub_214852B18();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      while ((v22 & 1) == 0);
    }
  }

  swift_bridgeObjectRelease();
  v26 = *(void **)(*(_QWORD *)(*v3 + 48) + 8 * v9);
  *a1 = v26;
  v27 = v26;
  return 0;
}

uint64_t sub_214824EC8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  int64_t v28;
  _QWORD *v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D89598);
  v3 = sub_214852980();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v27 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v29 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v28 = (unint64_t)(v5 + 63) >> 6;
    v8 = v3 + 56;
    result = swift_retain();
    v10 = 0;
    while (1)
    {
      if (v7)
      {
        v12 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v13 = v12 | (v10 << 6);
      }
      else
      {
        v14 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v14 >= v28)
          goto LABEL_33;
        v15 = v29[v14];
        ++v10;
        if (!v15)
        {
          v10 = v14 + 1;
          if (v14 + 1 >= v28)
            goto LABEL_33;
          v15 = v29[v10];
          if (!v15)
          {
            v10 = v14 + 2;
            if (v14 + 2 >= v28)
              goto LABEL_33;
            v15 = v29[v10];
            if (!v15)
            {
              v16 = v14 + 3;
              if (v16 >= v28)
              {
LABEL_33:
                swift_release();
                v1 = v27;
                v26 = 1 << *(_BYTE *)(v2 + 32);
                if (v26 > 63)
                  bzero(v29, ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v29 = -1 << v26;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v15 = v29[v16];
              if (!v15)
              {
                while (1)
                {
                  v10 = v16 + 1;
                  if (__OFADD__(v16, 1))
                    goto LABEL_39;
                  if (v10 >= v28)
                    goto LABEL_33;
                  v15 = v29[v10];
                  ++v16;
                  if (v15)
                    goto LABEL_23;
                }
              }
              v10 = v16;
            }
          }
        }
LABEL_23:
        v7 = (v15 - 1) & v15;
        v13 = __clz(__rbit64(v15)) + (v10 << 6);
      }
      v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v13);
      sub_2148526C8();
      sub_214852B84();
      sub_2148526EC();
      v18 = sub_214852B9C();
      result = swift_bridgeObjectRelease();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = v18 & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v8 + 8 * (v20 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v8 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v8 + 8 * v21);
        }
        while (v25 == -1);
        v11 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v11) = v17;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_2148251D8(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;

  v4 = v3;
  v6 = result;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_22;
  if ((a3 & 1) != 0)
  {
    sub_214824EC8();
  }
  else
  {
    if (v8 > v7)
    {
      result = (uint64_t)sub_214825404();
LABEL_22:
      v25 = *v4;
      *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
      *(_QWORD *)(*(_QWORD *)(v25 + 48) + 8 * a2) = v6;
      v26 = *(_QWORD *)(v25 + 16);
      v27 = __OFADD__(v26, 1);
      v28 = v26 + 1;
      if (!v27)
      {
        *(_QWORD *)(v25 + 16) = v28;
        return result;
      }
      __break(1u);
      goto LABEL_25;
    }
    sub_2148255AC();
  }
  v9 = *v3;
  sub_2148526C8();
  sub_214852B84();
  sub_2148526EC();
  v10 = sub_214852B9C();
  result = swift_bridgeObjectRelease();
  v11 = -1 << *(_BYTE *)(v9 + 32);
  a2 = v10 & ~v11;
  if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
    goto LABEL_22;
  v12 = sub_2148526C8();
  v14 = v13;
  if (v12 == sub_2148526C8() && v14 == v15)
  {
LABEL_25:
    swift_bridgeObjectRelease_n();
    goto LABEL_26;
  }
  v17 = sub_214852B18();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v17 & 1) == 0)
  {
    v18 = ~v11;
    do
    {
      a2 = (a2 + 1) & v18;
      if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
        goto LABEL_22;
      v19 = sub_2148526C8();
      v21 = v20;
      if (v19 == sub_2148526C8() && v21 == v22)
        goto LABEL_25;
      v24 = sub_214852B18();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
    }
    while ((v24 & 1) == 0);
  }
LABEL_26:
  type metadata accessor for SKAIDAServiceType();
  result = sub_214852B3C();
  __break(1u);
  return result;
}

id sub_214825404()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D89598);
  v2 = *v0;
  v3 = sub_214852974();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2148255AC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D89598);
  v3 = sub_214852980();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v27 = v0;
  v28 = v2 + 56;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v8 = v3 + 56;
  result = swift_retain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v29)
      goto LABEL_33;
    v15 = *(_QWORD *)(v28 + 8 * v14);
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v29)
        goto LABEL_33;
      v15 = *(_QWORD *)(v28 + 8 * v10);
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v29)
          goto LABEL_33;
        v15 = *(_QWORD *)(v28 + 8 * v10);
        if (!v15)
          break;
      }
    }
LABEL_23:
    v7 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v13);
    sub_2148526C8();
    sub_214852B84();
    v18 = v17;
    sub_2148526EC();
    v19 = sub_214852B9C();
    result = swift_bridgeObjectRelease();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = v19 & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v8 + 8 * (v21 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v8 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v8 + 8 * v22);
      }
      while (v26 == -1);
      v11 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v11) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_35;
  }
  v15 = *(_QWORD *)(v28 + 8 * v16);
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v29)
      goto LABEL_33;
    v15 = *(_QWORD *)(v28 + 8 * v10);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_214825888(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2148258A4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2148258A4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D89590);
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
    v10 = (char *)MEMORY[0x24BEE4AF8];
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
  result = sub_214852A28();
  __break(1u);
  return result;
}

uint64_t sub_214825A0C(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 128;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

int64_t sub_214825AAC(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    v11 = *(_QWORD *)(v6 + 8 * v9);
    if (v11)
      return __clz(__rbit64(v11)) + (v9 << 6);
    v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      v11 = *(_QWORD *)(v6 + 8 * v9);
      if (v11)
        return __clz(__rbit64(v11)) + (v9 << 6);
      while (v10 - 3 != v5)
      {
        v11 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t _s8SetupKit018SKStepAppleAccountA13ConfigurationV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
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
  uint64_t v12;
  char v13;

  v2 = a1[1];
  v4 = a1[2];
  v3 = a1[3];
  v5 = a1[4];
  v6 = a2[1];
  v8 = a2[2];
  v7 = a2[3];
  v9 = a2[4];
  if ((sub_214823458(*a1, *a2) & 1) == 0 || (sub_214823458(v2, v6) & 1) == 0)
    return 0;
  if (!v4)
  {
    if (!v8)
      return 1;
    goto LABEL_14;
  }
  if (!v8)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_14:
    sub_2147F3B60(v8);
    sub_2147F3B90(v4);
    v12 = v8;
LABEL_18:
    sub_2147F3B90(v12);
    return 0;
  }
  sub_2147F3B60(v4);
  sub_2147F3B60(v4);
  sub_2147F3B60(v8);
  if ((sub_214823458(v4, v8) & 1) == 0)
    goto LABEL_16;
  if (!v5)
  {
    if (!v9)
    {
      v10 = v8;
      goto LABEL_23;
    }
    goto LABEL_16;
  }
  if (!v9)
  {
LABEL_16:
    sub_2147F3B90(v8);
LABEL_17:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v12 = v4;
    goto LABEL_18;
  }
  if (v3 != v7 || v5 != v9)
  {
    v13 = sub_214852B18();
    sub_2147F3B90(v8);
    if ((v13 & 1) != 0)
      goto LABEL_24;
    goto LABEL_17;
  }
  v10 = v8;
LABEL_23:
  sub_2147F3B90(v10);
LABEL_24:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2147F3B90(v4);
  return 1;
}

uint64_t _s8SetupKit018SKStepAppleAccountA6ReportV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a1[1];
  v3 = a1[2];
  v4 = a2[1];
  v5 = a2[2];
  if ((sub_214823458(*a1, *a2) & 1) != 0)
  {
    if (v3)
    {
      if (v5 && (v2 == v4 && v3 == v5 || (sub_214852B18() & 1) != 0))
        return 1;
    }
    else if (!v5)
    {
      return 1;
    }
  }
  return 0;
}

uint64_t sub_214825DD8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_214825DE4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D89418;
  if (!qword_254D89418)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D89410);
    result = MEMORY[0x2199D7540](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_254D89418);
  }
  return result;
}

unint64_t sub_214825E30()
{
  unint64_t result;

  result = qword_254D8F9B0;
  if (!qword_254D8F9B0)
  {
    result = MEMORY[0x2199D7540](&unk_214859C74, &type metadata for SKStepAppleAccountSetupConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8F9B0);
  }
  return result;
}

unint64_t sub_214825E74()
{
  unint64_t result;

  result = qword_254D89440;
  if (!qword_254D89440)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepAppleAccountSetupReport, &type metadata for SKStepAppleAccountSetupReport);
    atomic_store(result, (unint64_t *)&qword_254D89440);
  }
  return result;
}

uint64_t sub_214825EB8(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D89428);
    v10 = sub_2147F4354(a2, 255, (uint64_t (*)(uint64_t))type metadata accessor for SKAIDAServiceType, a3);
    result = MEMORY[0x2199D7540](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_214825F40()
{
  unint64_t result;

  result = qword_254D89460;
  if (!qword_254D89460)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepAppleAccountSetupReport, &type metadata for SKStepAppleAccountSetupReport);
    atomic_store(result, (unint64_t *)&qword_254D89460);
  }
  return result;
}

unint64_t sub_214825F84()
{
  unint64_t result;

  result = qword_254D8F9B8;
  if (!qword_254D8F9B8)
  {
    result = MEMORY[0x2199D7540](&unk_214859C24, &type metadata for SKStepAppleAccountSetupReport.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D8F9B8);
  }
  return result;
}

unint64_t sub_214825FC8()
{
  unint64_t result;

  result = qword_254D8F9C0[0];
  if (!qword_254D8F9C0[0])
  {
    result = MEMORY[0x2199D7540](&unk_214859BD4, &type metadata for SKStepAppleAccountSetupPrepareRequestMessage.CodingKeys);
    atomic_store(result, qword_254D8F9C0);
  }
  return result;
}

unint64_t sub_21482600C()
{
  unint64_t result;

  result = qword_254D89480;
  if (!qword_254D89480)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepAppleAccountSetupConfiguration, &type metadata for SKStepAppleAccountSetupConfiguration);
    atomic_store(result, (unint64_t *)&qword_254D89480);
  }
  return result;
}

unint64_t sub_214826050()
{
  unint64_t result;

  result = qword_254D89490;
  if (!qword_254D89490)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKStepAppleAccountSetupConfiguration, &type metadata for SKStepAppleAccountSetupConfiguration);
    atomic_store(result, (unint64_t *)&qword_254D89490);
  }
  return result;
}

unint64_t sub_214826098()
{
  unint64_t result;

  result = qword_254D89498;
  if (!qword_254D89498)
  {
    result = MEMORY[0x2199D7540](&unk_2148596B0, &type metadata for SKStepAppleAccountSetupPrepareRequestMessage);
    atomic_store(result, (unint64_t *)&qword_254D89498);
  }
  return result;
}

unint64_t sub_2148260E0()
{
  unint64_t result;

  result = qword_254D894A0;
  if (!qword_254D894A0)
  {
    result = MEMORY[0x2199D7540](&unk_2148596D8, &type metadata for SKStepAppleAccountSetupPrepareRequestMessage);
    atomic_store(result, (unint64_t *)&qword_254D894A0);
  }
  return result;
}

uint64_t sub_214826124()
{
  return sub_2147F4354(&qword_254D883C0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE6D7C8], MEMORY[0x24BE6D7B8]);
}

uint64_t method lookup function for SKStepAppleAccountSetupServer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SKStepAppleAccountSetupServer.__allocating_init(server:environment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_214826178(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SKStepAppleAccountSetupConfiguration()
{
  return &type metadata for SKStepAppleAccountSetupConfiguration;
}

uint64_t destroy for SKStepAppleAccountSetupReport()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s8SetupKit29SKStepAppleAccountSetupReportVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SKStepAppleAccountSetupReport(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

_QWORD *assignWithTake for SKStepAppleAccountSetupReport(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SKStepAppleAccountSetupReport(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SKStepAppleAccountSetupReport(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
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
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SKStepAppleAccountSetupReport()
{
  return &type metadata for SKStepAppleAccountSetupReport;
}

uint64_t _s8SetupKit36SKStepAppleAccountSetupConfigurationVwxx_0(uint64_t a1)
{
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = *(_QWORD *)(a1 + 16);
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

_QWORD *_s8SetupKit36SKStepAppleAccountSetupConfigurationVwcp_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v6 = a2 + 2;
  v5 = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v5)
  {
    v7 = a2[3];
    v8 = a2[4];
    a1[2] = v5;
    a1[3] = v7;
    a1[4] = v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *(_OWORD *)v6;
    a1[4] = v6[2];
  }
  return a1;
}

_QWORD *_s8SetupKit36SKStepAppleAccountSetupConfigurationVwca_0(_QWORD *a1, _QWORD *a2)
{
  _OWORD *v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  __int128 v8;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a1 + 2;
  v6 = a2 + 2;
  v5 = a2[2];
  if (a1[2])
  {
    if (v5)
    {
      a1[2] = v5;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      a1[3] = a2[3];
      a1[4] = a2[4];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_214826178((uint64_t)(a1 + 2));
      v7 = a2[4];
      *v4 = *v6;
      a1[4] = v7;
    }
  }
  else if (v5)
  {
    a1[2] = v5;
    a1[3] = a2[3];
    a1[4] = a2[4];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v8 = *v6;
    a1[4] = a2[4];
    *v4 = v8;
  }
  return a1;
}

_QWORD *_s8SetupKit36SKStepAppleAccountSetupConfigurationVwta_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  v4 = a2[2];
  if (!a1[2])
    goto LABEL_5;
  if (!v4)
  {
    sub_214826178((uint64_t)(a1 + 2));
LABEL_5:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    a1[4] = a2[4];
    return a1;
  }
  a1[2] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s8SetupKit36SKStepAppleAccountSetupConfigurationVwet_0(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_214826648(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SKStepAppleAccountSetupPrepareRequestMessage()
{
  return &type metadata for SKStepAppleAccountSetupPrepareRequestMessage;
}

ValueMetadata *type metadata accessor for SKStepAppleAccountSetupPrepareRequestHandler()
{
  return &type metadata for SKStepAppleAccountSetupPrepareRequestHandler;
}

uint64_t storeEnumTagSinglePayload for SKStepAppleAccountSetupPrepareRequestMessage.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2148266F0 + 4 * byte_214859460[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_214826710 + 4 * byte_214859465[v4]))();
}

_BYTE *sub_2148266F0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_214826710(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_214826718(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_214826720(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_214826728(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_214826730(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SKStepAppleAccountSetupPrepareRequestMessage.CodingKeys()
{
  return &type metadata for SKStepAppleAccountSetupPrepareRequestMessage.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for SKStepAppleAccountSetupReport.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_214826798 + 4 * byte_21485946F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2148267CC + 4 * byte_21485946A[v4]))();
}

uint64_t sub_2148267CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2148267D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2148267DCLL);
  return result;
}

uint64_t sub_2148267E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2148267F0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2148267F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2148267FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SKStepAppleAccountSetupReport.CodingKeys()
{
  return &type metadata for SKStepAppleAccountSetupReport.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for SKStepAppleAccountSetupConfiguration.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_214826864 + 4 * byte_214859479[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_214826898 + 4 * byte_214859474[v4]))();
}

uint64_t sub_214826898(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2148268A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2148268A8);
  return result;
}

uint64_t sub_2148268B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2148268BCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2148268C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2148268C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SKStepAppleAccountSetupConfiguration.CodingKeys()
{
  return &type metadata for SKStepAppleAccountSetupConfiguration.CodingKeys;
}

uint64_t sub_2148268E4()
{
  return sub_2147F4354(&qword_254D89570, 255, (uint64_t (*)(uint64_t))type metadata accessor for SKAIDAServiceType, (uint64_t)&unk_2148598C4);
}

uint64_t sub_214826914()
{
  return sub_2147F4354(&qword_254D89578, 255, (uint64_t (*)(uint64_t))type metadata accessor for SKAIDAServiceType, (uint64_t)&unk_214859898);
}

unint64_t sub_214826948()
{
  unint64_t result;

  result = qword_254D904D0[0];
  if (!qword_254D904D0[0])
  {
    result = MEMORY[0x2199D7540](&unk_214859A3C, &type metadata for SKStepAppleAccountSetupConfiguration.CodingKeys);
    atomic_store(result, qword_254D904D0);
  }
  return result;
}

unint64_t sub_214826990()
{
  unint64_t result;

  result = qword_254D906E0[0];
  if (!qword_254D906E0[0])
  {
    result = MEMORY[0x2199D7540](&unk_214859AF4, &type metadata for SKStepAppleAccountSetupReport.CodingKeys);
    atomic_store(result, qword_254D906E0);
  }
  return result;
}

unint64_t sub_2148269D8()
{
  unint64_t result;

  result = qword_254D908F0;
  if (!qword_254D908F0)
  {
    result = MEMORY[0x2199D7540](&unk_214859BAC, &type metadata for SKStepAppleAccountSetupPrepareRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D908F0);
  }
  return result;
}

unint64_t sub_214826A20()
{
  unint64_t result;

  result = qword_254D90A00;
  if (!qword_254D90A00)
  {
    result = MEMORY[0x2199D7540](&unk_214859B1C, &type metadata for SKStepAppleAccountSetupPrepareRequestMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D90A00);
  }
  return result;
}

unint64_t sub_214826A68()
{
  unint64_t result;

  result = qword_254D90A08[0];
  if (!qword_254D90A08[0])
  {
    result = MEMORY[0x2199D7540](&unk_214859B44, &type metadata for SKStepAppleAccountSetupPrepareRequestMessage.CodingKeys);
    atomic_store(result, qword_254D90A08);
  }
  return result;
}

unint64_t sub_214826AB0()
{
  unint64_t result;

  result = qword_254D90A90;
  if (!qword_254D90A90)
  {
    result = MEMORY[0x2199D7540](&unk_214859A64, &type metadata for SKStepAppleAccountSetupReport.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D90A90);
  }
  return result;
}

unint64_t sub_214826AF8()
{
  unint64_t result;

  result = qword_254D90A98[0];
  if (!qword_254D90A98[0])
  {
    result = MEMORY[0x2199D7540](&unk_214859A8C, &type metadata for SKStepAppleAccountSetupReport.CodingKeys);
    atomic_store(result, qword_254D90A98);
  }
  return result;
}

unint64_t sub_214826B40()
{
  unint64_t result;

  result = qword_254D90B20;
  if (!qword_254D90B20)
  {
    result = MEMORY[0x2199D7540](&unk_2148599AC, &type metadata for SKStepAppleAccountSetupConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D90B20);
  }
  return result;
}

unint64_t sub_214826B88()
{
  unint64_t result;

  result = qword_254D90B28[0];
  if (!qword_254D90B28[0])
  {
    result = MEMORY[0x2199D7540](&unk_2148599D4, &type metadata for SKStepAppleAccountSetupConfiguration.CodingKeys);
    atomic_store(result, qword_254D90B28);
  }
  return result;
}

uint64_t sub_214826BCC()
{
  return sub_2147F4354(&qword_254D89580, 255, (uint64_t (*)(uint64_t))type metadata accessor for SKAIDAServiceType, (uint64_t)&unk_214859934);
}

uint64_t sub_214826BFC(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000013 && a2 == 0x800000021485E6B0 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000021485E6D0 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F7065526B636F6DLL && a2 == 0xEA00000000007472)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v5 = sub_214852B18();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_214826D50(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000012 && a2 == 0x800000021485E6F0 || (sub_214852B18() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000021485E710)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_214852B18();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_214826E3C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88728);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_214826E7C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_214826EA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2147FA024;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_254D895A0 + dword_254D895A0))(a1, v4);
}

unint64_t sub_214826F10()
{
  unint64_t result;

  result = qword_254D88208;
  if (!qword_254D88208)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254D88208);
  }
  return result;
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  return sub_2147F2530(a2 + 32, a1 + 32);
}

uint64_t block_destroy_helper_2(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_0(a1 + 32);
}

uint64_t sub_214826F74()
{
  uint64_t v0;

  v0 = sub_214852494();
  __swift_allocate_value_buffer(v0, qword_254D90C38);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D90C38);
  sub_214801FC0();
  swift_bridgeObjectRetain();
  return sub_214852488();
}

uint64_t SKClient.environment.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 32);
  return swift_bridgeObjectRetain();
}

uint64_t SKClient.__allocating_init(configuration:environment:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  SKClient.init(configuration:environment:)(a1, a2);
  return v4;
}

uint64_t SKClient.init(configuration:environment:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v3 = v2;
  v6 = sub_21485250C();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_214852584();
  v8 = MEMORY[0x24BDAC7A8](v7);
  MEMORY[0x24BDAC7A8](v8);
  v9 = *a1;
  v10 = *((_BYTE *)a1 + 8);
  v11 = *a2;
  *(_BYTE *)(v3 + 16) = 0;
  *(_BYTE *)(v3 + 40) = 0;
  *(_QWORD *)(v3 + 48) = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v3 + 64) = 0;
  *(_BYTE *)(v3 + 72) = 0;
  *(_QWORD *)(v3 + 20) = v9;
  *(_BYTE *)(v3 + 28) = v10;
  *(_QWORD *)(v3 + 32) = v11;
  sub_21485262C();
  swift_bridgeObjectRetain();
  SKEnvironmentValues.nexusSessionConfiguration.getter();
  sub_214852560();
  SKEnvironmentValues.nexusEnvironment.getter();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v3 + 56) = sub_214852590();
  return v3;
}

uint64_t SKClient.deinit()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  unint64_t v15;
  uint8_t *v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  int64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  unint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  int64_t v35;
  unint64_t v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895B0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895B8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v35 - v10;
  if (qword_254D90C30 == -1)
    goto LABEL_2;
  while (1)
  {
    swift_once();
LABEL_2:
    v12 = sub_214852494();
    __swift_project_value_buffer(v12, (uint64_t)qword_254D90C38);
    v13 = sub_21485247C();
    v14 = sub_2148528C0();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = v1;
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_2147EE000, v13, v14, "deinit", v16, 2u);
      v17 = v16;
      v1 = v15;
      MEMORY[0x2199D75E8](v17, -1, -1);
    }

    swift_beginAccess();
    v18 = *(_QWORD *)(v1 + 48);
    v19 = *(_QWORD *)(v18 + 64);
    v36 = v1;
    v37 = v18 + 64;
    v20 = 1 << *(_BYTE *)(v18 + 32);
    v21 = -1;
    if (v20 < 64)
      v21 = ~(-1 << v20);
    v1 = v21 & v19;
    v38 = (unint64_t)(v20 + 63) >> 6;
    v39 = v18;
    v35 = v38 - 1;
    result = swift_bridgeObjectRetain();
    v23 = 0;
    if (v1)
    {
      while (1)
      {
        v24 = __clz(__rbit64(v1));
        v1 &= v1 - 1;
        v25 = v24 | (v23 << 6);
LABEL_10:
        v26 = *(_QWORD *)(v39 + 56);
        *(_QWORD *)v9 = *(_QWORD *)(*(_QWORD *)(v39 + 48) + 8 * v25);
        v27 = v26 + *(_QWORD *)(v3 + 72) * v25;
        v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895C0);
        (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(&v9[*(int *)(v28 + 48)], v27, v2);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v9, 0, 1, v28);
LABEL_29:
        sub_2148275D0((uint64_t)v9, (uint64_t)v11);
        v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895C0);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 48))(v11, 1, v33) == 1)
          break;
        (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, &v11[*(int *)(v33 + 48)], v2);
        sub_214852830();
        result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
        if (!v1)
          goto LABEL_11;
      }
      swift_release();
      v34 = v36;
      *(_QWORD *)(v36 + 48) = MEMORY[0x24BEE4B00];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      return v34;
    }
LABEL_11:
    v29 = v23 + 1;
    if (!__OFADD__(v23, 1))
      break;
    __break(1u);
  }
  if (v29 >= v38)
    goto LABEL_28;
  v30 = *(_QWORD *)(v37 + 8 * v29);
  if (v30)
  {
LABEL_14:
    v1 = (v30 - 1) & v30;
    v25 = __clz(__rbit64(v30)) + (v29 << 6);
    v23 = v29;
    goto LABEL_10;
  }
  v31 = v23 + 2;
  ++v23;
  if (v29 + 1 >= v38)
    goto LABEL_28;
  v30 = *(_QWORD *)(v37 + 8 * v31);
  if (v30)
  {
LABEL_17:
    v29 = v31;
    goto LABEL_14;
  }
  v23 = v29 + 1;
  if (v29 + 2 >= v38)
    goto LABEL_28;
  v30 = *(_QWORD *)(v37 + 8 * (v29 + 2));
  if (v30)
  {
    v29 += 2;
    goto LABEL_14;
  }
  v31 = v29 + 3;
  v23 = v29 + 2;
  if (v29 + 3 >= v38)
  {
LABEL_28:
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895C0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v9, 1, 1, v32);
    v1 = 0;
    goto LABEL_29;
  }
  v30 = *(_QWORD *)(v37 + 8 * v31);
  if (v30)
    goto LABEL_17;
  while (1)
  {
    v29 = v31 + 1;
    if (__OFADD__(v31, 1))
      break;
    if (v29 >= v38)
    {
      v23 = v35;
      goto LABEL_28;
    }
    v30 = *(_QWORD *)(v37 + 8 * v29);
    ++v31;
    if (v30)
      goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t sub_2148275D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t SKClient.__deallocating_deinit()
{
  SKClient.deinit();
  return swift_deallocClassInstance();
}

uint64_t SKClient.start()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = v2;
  sub_2147F4354(&qword_254D895D0, a2, (uint64_t (*)(uint64_t))type metadata accessor for SKClient, (uint64_t)&protocol conformance descriptor for SKClient);
  sub_2148527C4();
  return swift_task_switch();
}

uint64_t sub_2148276A4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 16);
  if ((*(_BYTE *)(v1 + 40) & 1) != 0)
    return (*(uint64_t (**)(void))(v0 + 8))();
  *(_BYTE *)(v1 + 40) = 1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v3;
  *v3 = v0;
  v3[1] = sub_214818C58;
  return sub_214827714();
}

uint64_t sub_214827714()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1[2] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D88728);
  v1[3] = swift_task_alloc();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D892C0);
  v1[4] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[5] = v3;
  v1[6] = *(_QWORD *)(v3 + 64);
  v1[7] = swift_task_alloc();
  v1[8] = swift_task_alloc();
  sub_2147F4354(&qword_254D895D0, v4, (uint64_t (*)(uint64_t))type metadata accessor for SKClient, (uint64_t)&protocol conformance descriptor for SKClient);
  v1[9] = sub_2148527C4();
  v1[10] = v5;
  return swift_task_switch();
}

uint64_t sub_2148277EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 16);
  if ((*(_BYTE *)(v1 + 72) & 1) != 0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    if (qword_254D90C30 != -1)
      swift_once();
    v3 = sub_214852494();
    __swift_project_value_buffer(v3, (uint64_t)qword_254D90C38);
    v4 = sub_21485247C();
    v5 = sub_2148528D8();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2147EE000, v4, v5, "nexus start", v6, 2u);
      MEMORY[0x2199D75E8](v6, -1, -1);
    }
    v7 = *(_QWORD *)(v0 + 16);

    *(_BYTE *)(v1 + 72) = 1;
    *(_QWORD *)(v0 + 88) = *(_QWORD *)(v7 + 56);
    sub_21485262C();
    sub_2147F4354(&qword_254D88200, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC80], MEMORY[0x24BE6DC90]);
    sub_2148527C4();
    return swift_task_switch();
  }
}

uint64_t sub_214827968()
{
  sub_2148525FC();
  return swift_task_switch();
}

uint64_t sub_2148279A4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v1 = v0[7];
  v2 = v0[8];
  v3 = v0[5];
  v4 = v0[6];
  v5 = v0[3];
  v6 = v0[4];
  v7 = v0[2];
  v8 = sub_214852800();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v6);
  v10 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = 0;
  *(_QWORD *)(v11 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v11 + v10, v1, v6);
  *(_QWORD *)(v11 + ((v4 + v10 + 7) & 0xFFFFFFFFFFFFFFF8)) = v9;
  *(_QWORD *)(v7 + 64) = sub_21481BEEC(v5, (uint64_t)&unk_254D89808, v11);
  swift_release();
  v12 = (_QWORD *)swift_task_alloc();
  v0[12] = v12;
  *v12 = v0;
  v12[1] = sub_214827AEC;
  return sub_2148525E4();
}

uint64_t sub_214827AEC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_214827B38()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 40) + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 32));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SKClient.cancel()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[2] = v2;
  sub_2147F4354(&qword_254D895D0, a2, (uint64_t (*)(uint64_t))type metadata accessor for SKClient, (uint64_t)&protocol conformance descriptor for SKClient);
  v3[3] = sub_2148527C4();
  v3[4] = v4;
  return swift_task_switch();
}

uint64_t sub_214827BF8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 16) = 1;
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_214827C4C;
  return sub_214827CC8((uint64_t)v1, v2);
}

uint64_t sub_214827C4C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_214827C98()
{
  uint64_t v0;

  sub_214827EC0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_214827CC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = v2;
  sub_2147F4354(&qword_254D895D0, a2, (uint64_t (*)(uint64_t))type metadata accessor for SKClient, (uint64_t)&protocol conformance descriptor for SKClient);
  sub_2148527C4();
  return swift_task_switch();
}

uint64_t sub_214827D34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  _QWORD *v8;

  v1 = *(_QWORD *)(v0 + 16);
  if (*(_BYTE *)(v1 + 72) != 1)
    return (*(uint64_t (**)(void))(v0 + 8))();
  if (qword_254D90C30 != -1)
    swift_once();
  v2 = sub_214852494();
  __swift_project_value_buffer(v2, (uint64_t)qword_254D90C38);
  v3 = sub_21485247C();
  v4 = sub_2148528D8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2147EE000, v3, v4, "nexus stop", v5, 2u);
    MEMORY[0x2199D75E8](v5, -1, -1);
  }
  v6 = *(_QWORD *)(v0 + 16);

  *(_BYTE *)(v1 + 72) = 0;
  if (*(_QWORD *)(v6 + 64))
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D88210);
    sub_214852854();
    swift_release();
  }
  *(_QWORD *)(v6 + 64) = 0;
  swift_release();
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v8;
  *v8 = v0;
  v8[1] = sub_214818C58;
  return sub_2148525F0();
}

uint64_t sub_214827EC0()
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
  uint64_t result;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  _QWORD *v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895B0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895B8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v28 - v10;
  if (*(_BYTE *)(v0 + 16) != 1)
    return result;
  v29 = (_QWORD *)(v0 + 48);
  swift_beginAccess();
  v12 = *(_QWORD *)(v0 + 48);
  v13 = *(_QWORD *)(v12 + 64);
  v30 = v12 + 64;
  v14 = 1 << *(_BYTE *)(v12 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & v13;
  v31 = (unint64_t)(v14 + 63) >> 6;
  v32 = v12;
  v28 = v31 - 1;
  result = swift_bridgeObjectRetain();
  v17 = 0;
  if (!v16)
    goto LABEL_9;
LABEL_7:
  v18 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  v19 = v18 | (v17 << 6);
  while (2)
  {
    v20 = *(_QWORD *)(v32 + 56);
    *(_QWORD *)v8 = *(_QWORD *)(*(_QWORD *)(v32 + 48) + 8 * v19);
    v21 = v20 + *(_QWORD *)(v2 + 72) * v19;
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895C0);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(&v8[*(int *)(v22 + 48)], v21, v1);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v8, 0, 1, v22);
    while (1)
    {
      sub_2148275D0((uint64_t)v8, (uint64_t)v11);
      v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895C0);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 48))(v11, 1, v27) == 1)
      {
        swift_release();
        *v29 = MEMORY[0x24BEE4B00];
        return swift_bridgeObjectRelease();
      }
      (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, &v11[*(int *)(v27 + 48)], v1);
      sub_214852830();
      result = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      if (v16)
        goto LABEL_7;
LABEL_9:
      v23 = v17 + 1;
      if (__OFADD__(v17, 1))
      {
        __break(1u);
        goto LABEL_31;
      }
      if (v23 < v31)
      {
        v24 = *(_QWORD *)(v30 + 8 * v23);
        if (v24)
          goto LABEL_12;
        v25 = v17 + 2;
        ++v17;
        if (v23 + 1 < v31)
        {
          v24 = *(_QWORD *)(v30 + 8 * v25);
          if (v24)
            goto LABEL_15;
          v17 = v23 + 1;
          if (v23 + 2 < v31)
          {
            v24 = *(_QWORD *)(v30 + 8 * (v23 + 2));
            if (v24)
            {
              v23 += 2;
              goto LABEL_12;
            }
            v25 = v23 + 3;
            v17 = v23 + 2;
            if (v23 + 3 < v31)
              break;
          }
        }
      }
LABEL_26:
      v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895C0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v8, 1, 1, v26);
      v16 = 0;
    }
    v24 = *(_QWORD *)(v30 + 8 * v25);
    if (v24)
    {
LABEL_15:
      v23 = v25;
LABEL_12:
      v16 = (v24 - 1) & v24;
      v19 = __clz(__rbit64(v24)) + (v23 << 6);
      v17 = v23;
      continue;
    }
    break;
  }
  while (1)
  {
    v23 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v23 >= v31)
    {
      v17 = v28;
      goto LABEL_26;
    }
    v24 = *(_QWORD *)(v30 + 8 * v23);
    ++v25;
    if (v24)
      goto LABEL_12;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t SKClient.perform(command:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[3] = a1;
  v2[4] = v1;
  v3 = sub_214852614();
  v2[5] = v3;
  v2[6] = *(_QWORD *)(v3 - 8);
  v2[7] = swift_task_alloc();
  v2[8] = swift_task_alloc();
  type metadata accessor for SKClient.Command(0);
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  sub_2147F4354(&qword_254D895D0, v4, (uint64_t (*)(uint64_t))type metadata accessor for SKClient, (uint64_t)&protocol conformance descriptor for SKClient);
  v2[12] = sub_2148527C4();
  v2[13] = v5;
  return swift_task_switch();
}

uint64_t sub_214828300()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  os_log_type_t type;
  uint64_t v25;

  if (qword_254D90C30 != -1)
    swift_once();
  v1 = v0[3];
  v2 = v0[11];
  v3 = sub_214852494();
  __swift_project_value_buffer(v3, (uint64_t)qword_254D90C38);
  sub_21481C744(v1, v2, type metadata accessor for SKClient.Command);
  v4 = sub_21485247C();
  v5 = sub_2148528D8();
  v6 = os_log_type_enabled(v4, v5);
  v7 = v0[11];
  if (v6)
  {
    v8 = v0[10];
    type = v5;
    v9 = v0[8];
    v11 = v0[5];
    v10 = v0[6];
    v12 = (uint8_t *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v25 = v23;
    *(_DWORD *)v12 = 136315138;
    sub_21481C744(v7, v8, type metadata accessor for SKClient.Command);
    v13 = v10;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v9, v8, v11);
    sub_2147F4354(&qword_254D88FC8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC58], MEMORY[0x24BE6DC68]);
    v14 = sub_214852B00();
    v16 = v15;
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v9, v11);
    v0[2] = sub_2147F3D14(v14, v16, &v25);
    sub_21485292C();
    swift_bridgeObjectRelease();
    sub_2147FE778(v7, type metadata accessor for SKClient.Command);
    _os_log_impl(&dword_2147EE000, v4, type, "perform command: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D75E8](v23, -1, -1);
    MEMORY[0x2199D75E8](v12, -1, -1);
  }
  else
  {
    sub_2147FE778(v0[11], type metadata accessor for SKClient.Command);
  }

  v17 = v0[9];
  v19 = v0[6];
  v18 = v0[7];
  v20 = v0[5];
  sub_21481C744(v0[3], v17, type metadata accessor for SKClient.Command);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v18, v17, v20);
  v21 = (_QWORD *)swift_task_alloc();
  v0[14] = v21;
  *v21 = v0;
  v21[1] = sub_21481A1E8;
  return sub_214852620();
}

uint64_t SKClient.Command.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(_QWORD);
  uint64_t v10;
  uint64_t v12;

  v1 = sub_214852614();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC58];
  v3 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for SKClient.Command(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21481C744(v0, (uint64_t)v8, v9);
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v1);
  sub_2147F4354(&qword_254D88FC8, 255, v2, MEMORY[0x24BE6DC68]);
  v10 = sub_214852B00();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v1);
  return v10;
}

uint64_t static SKClient.Command.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v15;

  v4 = sub_214852614();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895F8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t)&v11[*(int *)(v9 + 48)];
  sub_21481C744(a1, (uint64_t)v11, type metadata accessor for SKClient.Command);
  sub_21481C744(a2, v12, type metadata accessor for SKClient.Command);
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, v4);
  LOBYTE(a2) = sub_214852608();
  v13 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v13(v12, v4);
  v13((uint64_t)v7, v4);
  return a2 & 1;
}

uint64_t sub_2148287EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v1 = sub_214852614();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC58];
  v3 = *(_QWORD *)(v1 - 8);
  v4 = MEMORY[0x24BDAC7A8](v1);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21481C744(v0, (uint64_t)v8, type metadata accessor for SKClient.Command);
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v8, v1);
  sub_2147F4354(&qword_254D88FC8, 255, v2, MEMORY[0x24BE6DC68]);
  v9 = sub_214852B00();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v1);
  return v9;
}

uint64_t sub_2148288FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v15;

  v4 = sub_214852614();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895F8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t)&v11[*(int *)(v9 + 48)];
  sub_21481C744(a1, (uint64_t)v11, type metadata accessor for SKClient.Command);
  sub_21481C744(a2, v12, type metadata accessor for SKClient.Command);
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, v4);
  LOBYTE(a2) = sub_214852608();
  v13 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v13(v12, v4);
  v13((uint64_t)v7, v4);
  return a2 & 1;
}

uint64_t SKClient.events.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
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
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;

  v2 = v1;
  v23[1] = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D89600);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D89608);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895B0);
  v24 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = CUNextID64();
  if (qword_254D90C30 != -1)
    swift_once();
  v14 = sub_214852494();
  __swift_project_value_buffer(v14, (uint64_t)qword_254D90C38);
  v15 = sub_21485247C();
  v16 = sub_2148528B4();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v23[0] = v2;
    v18 = v17;
    *(_DWORD *)v17 = 134217984;
    v25 = v13;
    sub_21485292C();
    _os_log_impl(&dword_2147EE000, v15, v16, "event monitor start: id=%llu", v18, 0xCu);
    MEMORY[0x2199D75E8](v18, -1, -1);
  }

  type metadata accessor for SKClient.Event(0);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BEE6A10], v6);
  sub_21485280C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v19 = v24;
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v5, v12, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v5, 0, 1, v10);
  swift_beginAccess();
  sub_214828D0C((uint64_t)v5, v13);
  swift_endAccess();
  v20 = swift_allocObject();
  swift_weakInit();
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v20;
  *(_QWORD *)(v21 + 24) = v13;
  sub_214852818();
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v12, v10);
}

uint64_t sub_214828D0C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D89600);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895B0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_2147F275C(a1, &qword_254D89600);
    v13 = sub_2147FE7B4(a2);
    if ((v14 & 1) != 0)
    {
      v15 = v13;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v17 = *v3;
      v22 = *v3;
      *v3 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_21482A8EC();
        v17 = v22;
      }
      (*(void (**)(char *, unint64_t, uint64_t))(v10 + 32))(v8, *(_QWORD *)(v17 + 56) + *(_QWORD *)(v10 + 72) * v15, v9);
      sub_21482A568(v15, v17);
      *v3 = v17;
      swift_bridgeObjectRelease();
      v18 = 0;
    }
    else
    {
      v18 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v18, 1, v9);
    return sub_2147F275C((uint64_t)v8, &qword_254D89600);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    v19 = swift_isUniquelyReferenced_nonNull_native();
    v22 = *v3;
    *v3 = 0x8000000000000000;
    sub_21482A734((uint64_t)v12, a2, v19);
    *v3 = v22;
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_214828EE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D88728);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_214852800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v7;
  v8[5] = a2;
  sub_2147FDE8C((uint64_t)v5, (uint64_t)&unk_254D897E8, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_214829004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[6] = a4;
  v5[7] = a5;
  v5[5] = a1;
  return swift_task_switch();
}

uint64_t sub_214829020()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 64) = Strong;
  if (Strong)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v2;
    *v2 = v0;
    v2[1] = sub_2147FDBF4;
    return sub_2148290BC(*(_QWORD *)(v0 + 56));
  }
  else
  {
    **(_BYTE **)(v0 + 40) = 1;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2148290BC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[6] = a1;
  v2[7] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D89600);
  v2[8] = swift_task_alloc();
  sub_2147F4354(&qword_254D895D0, v3, (uint64_t (*)(uint64_t))type metadata accessor for SKClient, (uint64_t)&protocol conformance descriptor for SKClient);
  sub_2148527C4();
  return swift_task_switch();
}

uint64_t sub_21482914C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (qword_254D90C30 != -1)
    swift_once();
  v1 = sub_214852494();
  __swift_project_value_buffer(v1, (uint64_t)qword_254D90C38);
  v2 = sub_21485247C();
  v3 = sub_2148528B4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(_QWORD *)(v0 + 48);
    v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v5 = 134217984;
    *(_QWORD *)(v0 + 40) = v4;
    sub_21485292C();
    _os_log_impl(&dword_2147EE000, v2, v3, "event monitor cancel: id=%llu", v5, 0xCu);
    MEMORY[0x2199D75E8](v5, -1, -1);
  }

  v6 = *(_QWORD *)(v0 + 64);
  v7 = *(_QWORD *)(v0 + 48);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  swift_beginAccess();
  sub_214828D0C(v6, v7);
  swift_endAccess();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SKClient._report(event:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t result;
  __int128 v33;
  uint64_t v34;
  char *v35;
  char *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t, uint64_t);
  int64_t v43;
  unint64_t v44;
  int64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  os_log_type_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  os_log_type_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  os_log_type_t v71;
  uint64_t v72;
  int64_t v73;
  uint64_t v74;
  char *v75;
  int64_t v76;
  uint64_t v77;
  __int128 v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  int64_t v93;
  _QWORD *v94;
  uint64_t v95;
  char *v96;
  _QWORD *v97;
  uint64_t v98;
  uint64_t v99;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D89610);
  v91 = *(_QWORD *)(v3 - 8);
  v92 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v90 = (char *)&v72 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = sub_2148525D8();
  v85 = *(_QWORD *)(v82 - 8);
  MEMORY[0x24BDAC7A8](v82);
  v75 = (char *)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for SKClient.Event(0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v89 = (uint64_t)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v84 = (uint64_t)&v72 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v88 = (uint64_t)&v72 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v72 - v13;
  v15 = sub_214852494();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v72 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895B0);
  v98 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v96 = (char *)&v72 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895B8);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v24 = (uint64_t *)((char *)&v72 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v22);
  v26 = (uint64_t *)((char *)&v72 - v25);
  swift_beginAccess();
  v27 = *(_QWORD *)(v1 + 48);
  v28 = *(_QWORD *)(v27 + 64);
  v74 = v27 + 64;
  v29 = 1 << *(_BYTE *)(v27 + 32);
  v30 = -1;
  if (v29 < 64)
    v30 = ~(-1 << v29);
  v31 = v30 & v28;
  v76 = (unint64_t)(v29 + 63) >> 6;
  v73 = v76 - 1;
  v86 = v27;
  result = swift_bridgeObjectRetain();
  v93 = 0;
  *(_QWORD *)&v33 = 134218242;
  v78 = v33;
  v77 = MEMORY[0x24BEE4AD8] + 8;
  v97 = v24;
  v94 = v26;
  v83 = a1;
  v81 = v14;
  v80 = v15;
  v79 = v16;
  v87 = v19;
  while (1)
  {
    if (v31)
    {
      v95 = (v31 - 1) & v31;
      v37 = __clz(__rbit64(v31)) | (v93 << 6);
LABEL_8:
      v38 = *(_QWORD *)(v86 + 56);
      *v24 = *(_QWORD *)(*(_QWORD *)(v86 + 48) + 8 * v37);
      v39 = v98;
      v40 = v38 + *(_QWORD *)(v98 + 72) * v37;
      v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895C0);
      v42 = *(void (**)(char *, uint64_t, uint64_t))(v39 + 16);
      v24 = v97;
      v42((char *)v97 + *(int *)(v41 + 48), v40, v19);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v24, 0, 1, v41);
      v26 = v94;
      goto LABEL_27;
    }
    v43 = v93 + 1;
    if (__OFADD__(v93, 1))
    {
      __break(1u);
      goto LABEL_37;
    }
    if (v43 < v76)
    {
      v44 = *(_QWORD *)(v74 + 8 * v43);
      if (v44)
        goto LABEL_12;
      v45 = v93 + 2;
      ++v93;
      if (v43 + 1 < v76)
      {
        v44 = *(_QWORD *)(v74 + 8 * v45);
        if (v44)
          goto LABEL_15;
        v93 = v43 + 1;
        if (v43 + 2 < v76)
        {
          v44 = *(_QWORD *)(v74 + 8 * (v43 + 2));
          if (v44)
          {
            v43 += 2;
            goto LABEL_12;
          }
          v45 = v43 + 3;
          v93 = v43 + 2;
          if (v43 + 3 < v76)
            break;
        }
      }
    }
LABEL_26:
    v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895C0);
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v24, 1, 1, v46);
    v95 = 0;
LABEL_27:
    sub_2148275D0((uint64_t)v24, (uint64_t)v26);
    v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895C0);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 48))(v26, 1, v47) == 1)
      return swift_release();
    v48 = (char *)v26;
    v49 = *v26;
    (*(void (**)(char *, char *, uint64_t))(v98 + 32))(v96, &v48[*(int *)(v47 + 48)], v19);
    if (qword_254D90C30 != -1)
      swift_once();
    v50 = __swift_project_value_buffer(v15, (uint64_t)qword_254D90C38);
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v50, v15);
    sub_21481C744(a1, (uint64_t)v14, type metadata accessor for SKClient.Event);
    v51 = sub_21485247C();
    v52 = (uint64_t)v14;
    v53 = sub_2148528D8();
    if (os_log_type_enabled(v51, v53))
    {
      v54 = swift_slowAlloc();
      v55 = swift_slowAlloc();
      v99 = v55;
      *(_DWORD *)v54 = v78;
      *(_QWORD *)(v54 + 4) = v49;
      *(_WORD *)(v54 + 12) = 2080;
      v56 = v52;
      v57 = v88;
      sub_21481C744(v56, v88, type metadata accessor for SKClient.Event);
      v58 = v57;
      v59 = v84;
      sub_21481C744(v58, v84, type metadata accessor for SKClient.Event);
      v60 = v59;
      v61 = v82;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v85 + 48))(v60, 1, v82) == 1)
      {
        v62 = 0xE700000000000000;
        v63 = 0x64657472617473;
      }
      else
      {
        v64 = v85;
        v65 = v75;
        (*(void (**)(char *, uint64_t, uint64_t))(v85 + 32))(v75, v84, v61);
        sub_2147F4354(&qword_254D88FF0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC08], MEMORY[0x24BE6DC18]);
        v66 = v53;
        v67 = v61;
        v63 = sub_214852B00();
        v62 = v68;
        v69 = v67;
        v53 = v66;
        (*(void (**)(char *, uint64_t))(v64 + 8))(v65, v69);
      }
      sub_2147FE778(v88, type metadata accessor for SKClient.Event);
      *(_QWORD *)(v54 + 14) = sub_2147F3D14(v63, v62, &v99);
      swift_bridgeObjectRelease();
      v70 = (uint64_t)v81;
      sub_2147FE778((uint64_t)v81, type metadata accessor for SKClient.Event);
      v71 = v53;
      v14 = (char *)v70;
      _os_log_impl(&dword_2147EE000, v51, v71, "event monitor report: id=%llu, event={%s}", (uint8_t *)v54, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2199D75E8](v55, -1, -1);
      MEMORY[0x2199D75E8](v54, -1, -1);

      v16 = v79;
      v15 = v80;
      (*(void (**)(char *, uint64_t))(v79 + 8))(v18, v80);
      a1 = v83;
      v34 = v92;
      v24 = v97;
    }
    else
    {
      sub_2147FE778(v52, type metadata accessor for SKClient.Event);

      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      v14 = (char *)v52;
      v34 = v92;
    }
    sub_21481C744(a1, v89, type metadata accessor for SKClient.Event);
    v35 = v90;
    v19 = v87;
    v36 = v96;
    sub_214852824();
    (*(void (**)(char *, uint64_t))(v91 + 8))(v35, v34);
    result = (*(uint64_t (**)(char *, uint64_t))(v98 + 8))(v36, v19);
    v26 = v94;
    v31 = v95;
  }
  v44 = *(_QWORD *)(v74 + 8 * v45);
  if (v44)
  {
LABEL_15:
    v43 = v45;
LABEL_12:
    v95 = (v44 - 1) & v44;
    v37 = __clz(__rbit64(v44)) + (v43 << 6);
    v93 = v43;
    goto LABEL_8;
  }
  while (1)
  {
    v43 = v45 + 1;
    if (__OFADD__(v45, 1))
      break;
    if (v43 >= v76)
    {
      v93 = v73;
      goto LABEL_26;
    }
    v44 = *(_QWORD *)(v74 + 8 * v43);
    ++v45;
    if (v44)
      goto LABEL_12;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t SKClient.Event.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(_QWORD);
  uint64_t v10;
  uint64_t v12;

  v1 = v0;
  v2 = sub_2148525D8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for SKClient.Event(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21481C744(v1, (uint64_t)v8, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
    return 0x64657472617473;
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
  sub_2147F4354(&qword_254D88FF0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE6DC08], MEMORY[0x24BE6DC18]);
  v10 = sub_214852B00();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v10;
}

uint64_t SKClient.nexusSession.getter()
{
  return swift_retain();
}

uint64_t sub_214829C50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[5] = a4;
  v5[6] = a5;
  type metadata accessor for SKClient.Event(0);
  v5[7] = swift_task_alloc();
  v6 = sub_2148525D8();
  v5[8] = v6;
  v5[9] = *(_QWORD *)(v6 - 8);
  v5[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D892D8);
  v5[11] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D892E0);
  v5[12] = v7;
  v5[13] = *(_QWORD *)(v7 - 8);
  v5[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_214829D20()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254D892C0);
  sub_21485283C();
  swift_beginAccess();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v1;
  *v1 = v0;
  v1[1] = sub_214829DBC;
  return sub_214852848();
}

uint64_t sub_214829DBC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_214829E10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t Strong;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 72);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) != 1)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(*(_QWORD *)(v0 + 80), v1, v2);
    Strong = swift_weakLoadStrong();
    *(_QWORD *)(v0 + 128) = Strong;
    if (Strong)
    {
      type metadata accessor for SKClient();
      sub_2147F4354(&qword_254D895D0, v5, (uint64_t (*)(uint64_t))type metadata accessor for SKClient, (uint64_t)&protocol conformance descriptor for SKClient);
      sub_2148527C4();
      return swift_task_switch();
    }
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 8))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 64));
  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 96));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_214829F44()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0[9];
  v3 = v0[7];
  v2 = v0[8];
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 16))(v3, v0[10], v2);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v1 + 56))(v3, 0, 1, v2);
  SKClient._report(event:)(v3);
  sub_2147FE778(v3, type metadata accessor for SKClient.Event);
  return swift_task_switch();
}

uint64_t sub_214829FCC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[9];
  v1 = v0[10];
  v3 = v0[8];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v4 = (_QWORD *)swift_task_alloc();
  v0[15] = v4;
  *v4 = v0;
  v4[1] = sub_214829DBC;
  return sub_214852848();
}

uint64_t sub_21482A050()
{
  uint64_t *v0;

  return SKEnvironmental<>.unownedExecutor.getter(*v0, (uint64_t)&protocol witness table for SKClient);
}

void SKClientConfiguration.bluetoothScannerConfiguration.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_BYTE *)(a1 + 8) = v2;
}

uint64_t SKClientConfiguration.bluetoothScannerConfiguration.setter(uint64_t result)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(result + 8);
  *(_QWORD *)v1 = *(_QWORD *)result;
  *(_BYTE *)(v1 + 8) = v2;
  return result;
}

uint64_t (*SKClientConfiguration.bluetoothScannerConfiguration.modify())()
{
  return nullsub_1;
}

uint64_t SKClientConfiguration.init(bluetoothScannerConfiguration:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2;

  v2 = *(_BYTE *)(result + 8);
  *(_QWORD *)a2 = *(_QWORD *)result;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

uint64_t SKClientConfiguration.description.getter()
{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + 8) & 1) == 0)
  {
    sub_21482AD20();
    sub_214852B00();
    sub_214852704();
    swift_bridgeObjectRelease();
    sub_214852704();
    sub_214852704();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return 0x746C7561666564;
}

uint64_t type metadata accessor for SKClient()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for SKClient.Command(uint64_t a1)
{
  return sub_2147FC1A0(a1, (uint64_t *)&unk_254D90F50);
}

uint64_t type metadata accessor for SKClient.Event(uint64_t a1)
{
  return sub_2147FC1A0(a1, (uint64_t *)&unk_254D90F60);
}

uint64_t sub_21482A1E4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21482A208()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21482A22C()
{
  uint64_t v0;

  return sub_214828EE8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_21482A234(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  int v37;
  int64_t v38;
  _QWORD *v39;
  uint64_t v40;

  v3 = v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895B0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D897F8);
  result = sub_214852A10();
  v11 = result;
  if (*(_QWORD *)(v9 + 16))
  {
    v36 = v3;
    v12 = 0;
    v13 = *(_QWORD *)(v9 + 64);
    v39 = (_QWORD *)(v9 + 64);
    v14 = 1 << *(_BYTE *)(v9 + 32);
    if (v14 < 64)
      v15 = ~(-1 << v14);
    else
      v15 = -1;
    v16 = v15 & v13;
    v38 = (unint64_t)(v14 + 63) >> 6;
    v17 = result + 64;
    v37 = a2;
    v18 = 16;
    if ((a2 & 1) != 0)
      v18 = 32;
    v40 = v18;
    while (1)
    {
      if (v16)
      {
        v20 = __clz(__rbit64(v16));
        v16 &= v16 - 1;
        v21 = v20 | (v12 << 6);
      }
      else
      {
        v22 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = (uint64_t)v39;
        if (v22 >= v38)
          goto LABEL_33;
        v23 = v39[v22];
        ++v12;
        if (!v23)
        {
          v12 = v22 + 1;
          if (v22 + 1 >= v38)
            goto LABEL_33;
          v23 = v39[v12];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v38)
            {
LABEL_33:
              if ((v37 & 1) == 0)
              {
                result = swift_release();
                v3 = v36;
                goto LABEL_40;
              }
              v34 = 1 << *(_BYTE *)(v9 + 32);
              if (v34 >= 64)
                bzero(v39, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v39 = -1 << v34;
              v3 = v36;
              *(_QWORD *)(v9 + 16) = 0;
              break;
            }
            v23 = v39[v24];
            if (!v23)
            {
              while (1)
              {
                v12 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_42;
                if (v12 >= v38)
                  goto LABEL_33;
                v23 = v39[v12];
                ++v24;
                if (v23)
                  goto LABEL_23;
              }
            }
            v12 = v24;
          }
        }
LABEL_23:
        v16 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v12 << 6);
      }
      v25 = *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v21);
      v26 = *(_QWORD *)(v6 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + v40))(v8, *(_QWORD *)(v9 + 56) + v26 * v21, v5);
      result = sub_214852B78();
      v27 = -1 << *(_BYTE *)(v11 + 32);
      v28 = result & ~v27;
      v29 = v28 >> 6;
      if (((-1 << v28) & ~*(_QWORD *)(v17 + 8 * (v28 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v17 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v30 = 0;
        v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v32 = v29 == v31;
          if (v29 == v31)
            v29 = 0;
          v30 |= v32;
          v33 = *(_QWORD *)(v17 + 8 * v29);
        }
        while (v33 == -1);
        v19 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(_QWORD *)(v17 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      *(_QWORD *)(*(_QWORD *)(v11 + 48) + 8 * v19) = v25;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 56) + v26 * v19, v8, v5);
      ++*(_QWORD *)(v11 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v11;
  return result;
}

unint64_t sub_21482A568(unint64_t result, uint64_t a2)
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
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_21485295C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_QWORD *)(v9 + 8 * v6);
        result = sub_214852B78();
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
        v16 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254D895B0) - 8) + 72);
        v17 = v16 * v3;
        result = v15 + v16 * v3;
        v18 = v16 * v6;
        v19 = v15 + v16 * v6 + v16;
        if (v17 < v18 || result >= v19)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v17 == v18)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    v23 = *v21;
    v22 = (-1 << result) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_21482A734(uint64_t a1, uint64_t a2, char a3)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  unint64_t v20;
  char v21;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_2147FE7B4(a2);
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
      {
LABEL_8:
        v17 = v16[7];
        v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895B0);
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v10, a1, v18);
      }
      return sub_21482A85C(v10, a2, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_21482A8EC();
      goto LABEL_7;
    }
    sub_21482A234(v13, a3 & 1);
    v20 = sub_2147FE7B4(a2);
    if ((v14 & 1) == (v21 & 1))
    {
      v10 = v20;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
      return sub_21482A85C(v10, a2, a1, v16);
    }
  }
  result = sub_214852B48();
  __break(1u);
  return result;
}

uint64_t sub_21482A85C(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  v7 = a4[7];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895B0);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7 + *(_QWORD *)(*(_QWORD *)(v8 - 8) + 72) * a1, a3, v8);
  v10 = a4[2];
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
    __break(1u);
  else
    a4[2] = v12;
  return result;
}

void *sub_21482A8EC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int64_t v25;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D895B0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D897F8);
  v23 = v0;
  v5 = *v0;
  v6 = sub_214852A04();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_23:
    result = (void *)swift_release();
    *v23 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v10 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v11 = 1 << *(_BYTE *)(v5 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v5 + 64);
  v24 = v5 + 64;
  v25 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25)
      goto LABEL_23;
    v20 = *(_QWORD *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v25)
        goto LABEL_23;
      v20 = *(_QWORD *)(v24 + 8 * v10);
      if (!v20)
        break;
    }
LABEL_22:
    v13 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v15);
    v18 = *(_QWORD *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 56) + v18, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v16) = v17;
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 56) + v18, v4, v1);
  }
  v21 = v19 + 2;
  if (v21 >= v25)
    goto LABEL_23;
  v20 = *(_QWORD *)(v24 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v25)
      goto LABEL_23;
    v20 = *(_QWORD *)(v24 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t _s8SetupKit8SKClientC5EventO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unsigned int (*v16)(uint64_t, uint64_t, uint64_t);
  char v17;
  void (*v18)(char *, uint64_t);
  uint64_t v20;

  v4 = sub_2148525D8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SKClient.Event(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D897D8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (uint64_t)&v14[*(int *)(v12 + 48)];
  sub_21481C744(a1, (uint64_t)v14, type metadata accessor for SKClient.Event);
  sub_21481C744(a2, v15, type metadata accessor for SKClient.Event);
  v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v16((uint64_t)v14, 1, v4) != 1)
  {
    sub_21481C744((uint64_t)v14, (uint64_t)v10, type metadata accessor for SKClient.Event);
    if (v16(v15, 1, v4) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v15, v4);
      v17 = MEMORY[0x2199D6658](v10, v7);
      v18 = *(void (**)(char *, uint64_t))(v5 + 8);
      v18(v7, v4);
      v18(v10, v4);
      sub_2147FE778((uint64_t)v14, type metadata accessor for SKClient.Event);
      return v17 & 1;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    goto LABEL_6;
  }
  if (v16(v15, 1, v4) != 1)
  {
LABEL_6:
    sub_2147F275C((uint64_t)v14, &qword_254D897D8);
    v17 = 0;
    return v17 & 1;
  }
  sub_2147FE778((uint64_t)v14, type metadata accessor for SKClient.Event);
  v17 = 1;
  return v17 & 1;
}

unint64_t sub_21482AD20()
{
  unint64_t result;

  result = qword_254D89618;
  if (!qword_254D89618)
  {
    result = MEMORY[0x2199D7540](&protocol conformance descriptor for SKBluetoothScannerConfiguration, &type metadata for SKBluetoothScannerConfiguration);
    atomic_store(result, (unint64_t *)&qword_254D89618);
  }
  return result;
}

uint64_t method lookup function for SKClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SKClient.__allocating_init(configuration:environment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t *initializeBufferWithCopyOfBuffer for SKClient.Event(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = sub_2148525D8();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for SKClient.Event(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = sub_2148525D8();
  v3 = *(_QWORD *)(v2 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return result;
}

void *initializeWithCopy for SKClient.Event(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2148525D8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *assignWithCopy for SKClient.Event(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;

  v6 = sub_2148525D8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

void *initializeWithTake for SKClient.Event(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2148525D8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *assignWithTake for SKClient.Event(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;

  v6 = sub_2148525D8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SKClient.Event()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21482B1DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = sub_2148525D8();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2)
    return v5 - 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SKClient.Event()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21482B234(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 1);
  else
    v5 = 0;
  v6 = sub_2148525D8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_21482B284(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2148525D8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
}

uint64_t sub_21482B2BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2148525D8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 1, v4);
}

uint64_t sub_21482B2FC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2148525D8();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t __swift_memcpy9_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for SKClientConfiguration(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SKClientConfiguration(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 8) = 0;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SKClientConfiguration()
{
  return &type metadata for SKClientConfiguration;
}

uint64_t sub_21482B3C0()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21482B3EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *(_QWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 40);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_2147F4FF0;
  v6[6] = v5;
  v6[7] = v4;
  v6[5] = a1;
  return swift_task_switch();
}

uint64_t sub_21482B45C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D892C0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21482B4F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254D892C0) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v0 + v3;
  v5 = *(_QWORD *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFF8));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_2147F4FF0;
  return sub_214829C50((uint64_t)v6, v7, v8, v4, v5);
}

id AISSetupContextFunction()
{
  return (id)classAISSetupContext;
}

Class initAISSetupContext()
{
  Class result;

  if (AppleIDSetupLibrary_sOnce != -1)
    dispatch_once(&AppleIDSetupLibrary_sOnce, &__block_literal_global);
  result = objc_getClass("AISSetupContext");
  classAISSetupContext = (uint64_t)result;
  getAISSetupContextClass[0] = (uint64_t (*)())AISSetupContextFunction;
  return result;
}

id AISSetupControllerFunction()
{
  return (id)classAISSetupController;
}

Class initAISSetupController()
{
  Class result;

  if (AppleIDSetupLibrary_sOnce != -1)
    dispatch_once(&AppleIDSetupLibrary_sOnce, &__block_literal_global);
  result = objc_getClass("AISSetupController");
  classAISSetupController = (uint64_t)result;
  getAISSetupControllerClass = (uint64_t (*)())AISSetupControllerFunction;
  return result;
}

void sub_21482C090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_214830184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  va_list va;

  va_start(va, a10);
  (*(void (**)(uint64_t))(v10 + 16))(v10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21483058C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  va_list va;

  va_start(va, a10);
  (*(void (**)(uint64_t))(v10 + 16))(v10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214830FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  va_list va;

  va_start(va, a10);
  (*(void (**)(uint64_t))(v10 + 16))(v10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214831778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  (*(void (**)(void))(a12 + 16))();
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__119(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__120(uint64_t a1)
{

}

id FLFollowUpControllerFunction()
{
  return (id)classFLFollowUpController;
}

Class initFLFollowUpController()
{
  Class result;

  if (CoreFollowUpLibrary_sOnce != -1)
    dispatch_once(&CoreFollowUpLibrary_sOnce, &__block_literal_global_294);
  result = objc_getClass("FLFollowUpController");
  classFLFollowUpController = (uint64_t)result;
  getFLFollowUpControllerClass = (uint64_t (*)())FLFollowUpControllerFunction;
  return result;
}

id FLFollowUpItemFunction()
{
  return (id)classFLFollowUpItem;
}

Class initFLFollowUpItem()
{
  Class result;

  if (CoreFollowUpLibrary_sOnce != -1)
    dispatch_once(&CoreFollowUpLibrary_sOnce, &__block_literal_global_294);
  result = objc_getClass("FLFollowUpItem");
  classFLFollowUpItem = (uint64_t)result;
  getFLFollowUpItemClass[0] = (uint64_t (*)())FLFollowUpItemFunction;
  return result;
}

id FLGroupIdentifierDeviceFunction()
{
  return (id)constantValFLGroupIdentifierDevice;
}

id initValFLGroupIdentifierDevice()
{
  id *v0;

  if (CoreFollowUpLibrary_sOnce != -1)
    dispatch_once(&CoreFollowUpLibrary_sOnce, &__block_literal_global_294);
  v0 = (id *)dlsym((void *)CoreFollowUpLibrary_sLib, "FLGroupIdentifierDevice");
  if (v0)
    objc_storeStrong((id *)&constantValFLGroupIdentifierDevice, *v0);
  getFLGroupIdentifierDevice[0] = (uint64_t (*)())FLGroupIdentifierDeviceFunction;
  return (id)constantValFLGroupIdentifierDevice;
}

id FLFollowUpActionFunction()
{
  return (id)classFLFollowUpAction;
}

Class initFLFollowUpAction()
{
  Class result;

  if (CoreFollowUpLibrary_sOnce != -1)
    dispatch_once(&CoreFollowUpLibrary_sOnce, &__block_literal_global_294);
  result = objc_getClass("FLFollowUpAction");
  classFLFollowUpAction = (uint64_t)result;
  getFLFollowUpActionClass = (uint64_t (*)())FLFollowUpActionFunction;
  return result;
}

void _captiveNetworkProberCallback(void *a1, CFTypeRef cf, int a3)
{
  void *v5;
  NSObject *v6;
  _QWORD block[6];
  int v8;

  CFRelease(cf);
  objc_msgSend(a1, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dispatchQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___captiveNetworkProberCallback_block_invoke;
  block[3] = &unk_24D229E48;
  v8 = a3;
  block[4] = v5;
  block[5] = a1;
  dispatch_async(v6, block);

}

void ___captiveNetworkProberCallback_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(unsigned int *)(a1 + 48);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "responseHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_captiveNetworkProbeResult:responseHandler:", v1, v3);

}

uint64_t _captiveNetworkLoginCallback(void *a1, void *a2, int a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v9[7];
  int v10;

  v5 = a2;
  objc_msgSend(a1, "server");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___captiveNetworkLoginCallback_block_invoke;
  v9[3] = &unk_24D229D78;
  v9[4] = v6;
  v9[5] = v5;
  v10 = a3;
  v9[6] = a1;
  dispatch_async(v7, v9);

  return 1;
}

void ___captiveNetworkLoginCallback_block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(unsigned int *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "responseHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_captiveNetworkLoginInfo:cookie:responseHandler:", v2, v3, v4);

}

void sub_214833F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2148355F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214835E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214836948(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_214836F20(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_214837874(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_2148380E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;

  (*(void (**)(void))(a14 + 16))();
  _Block_object_dispose((const void *)(v14 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_2148385A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v17;

  (*(void (**)(void))(a17 + 16))();
  _Block_object_dispose((const void *)(v17 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_214839B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214839E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__290(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__291(uint64_t a1)
{

}

void sub_21483D24C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21483D8AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21483DCCC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__449(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__450(uint64_t a1)
{

}

void sub_21483FF40(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__626(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__627(uint64_t a1)
{

}

void sub_2148420E8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__950(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__951(uint64_t a1)
{

}

id logger()
{
  if (sCUOSLogCreateOnce_logger != -1)
    dispatch_once(&sCUOSLogCreateOnce_logger, &__block_literal_global_42);
  return (id)sCUOSLogHandle_logger;
}

void __logger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SetupKit", "SKSetupOSUpdateServer");
  v1 = (void *)sCUOSLogHandle_logger;
  sCUOSLogHandle_logger = (uint64_t)v0;

}

void sub_214848818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214848A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214848D0C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21484900C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1536(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1537(uint64_t a1)
{

}

id SKFrameworkBundle()
{
  if (SKFrameworkBundle_sOnce != -1)
    dispatch_once(&SKFrameworkBundle_sOnce, &__block_literal_global_1678);
  return (id)SKFrameworkBundle_sBundle;
}

id SKLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  v1 = a1;
  SKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v15 = v1;
    goto LABEL_21;
  }
  objc_msgSend(v2, "localizations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)CFPreferencesCopyValue(CFSTR("AppleLanguages"), (CFStringRef)*MEMORY[0x24BDBD568], CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  if (v4)
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "preferredLocalizationsFromArray:forPreferences:", v4, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v3, "pathForResource:ofType:inDirectory:forLocalization:", CFSTR("Localizable"), CFSTR("strings"), CFSTR("."), v10);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v11);
          if (!CUIsGreenTeaDevice()
            || (objc_msgSend(v1, "stringByAppendingString:", CFSTR("_GT")),
                v14 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v13, "objectForKeyedSubscript:", v14),
                v15 = (id)objc_claimAutoreleasedReturnValue(),
                v14,
                !v15))
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", v1);
            v15 = (id)objc_claimAutoreleasedReturnValue();
          }

          if (v15)
            goto LABEL_20;
        }
        else
        {

        }
      }
    }
  }
  if (!CUIsGreenTeaDevice())
    goto LABEL_19;
  objc_msgSend(v1, "stringByAppendingString:", CFSTR("_GT"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v16, CFSTR("_GT"), CFSTR("Localizable"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqual:", CFSTR("_GT")))
  {

LABEL_19:
    objc_msgSend(v3, "localizedStringForKey:value:table:", v1, &stru_24D22B2A0, CFSTR("Localizable"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }

  if (!v15)
    goto LABEL_19;
LABEL_20:

LABEL_21:
  return v15;
}

uint64_t SKNearbyActionFlagsToString()
{
  return CUPrintFlags32();
}

void sub_21484C298(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21484C8A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21484CDB4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1786(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1787(uint64_t a1)
{

}

void sub_21484EDF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  (*(void (**)(void))(a13 + 16))();
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2186(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2187(uint64_t a1)
{

}

void __logger_block_invoke_2359()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SetupKit", "SKSetupOSUpdateClient");
  v1 = (void *)sCUOSLogHandle_logger_2341;
  sCUOSLogHandle_logger_2341 = (uint64_t)v0;

}

void sub_21484FF2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id logger_2457()
{
  if (sCUOSLogCreateOnce_logger_2459 != -1)
    dispatch_once(&sCUOSLogCreateOnce_logger_2459, &__block_literal_global_2460);
  return (id)sCUOSLogHandle_logger_2461;
}

void __logger_block_invoke_2462()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SetupKit", "SKTRSession");
  v1 = (void *)sCUOSLogHandle_logger_2461;
  sCUOSLogHandle_logger_2461 = (uint64_t)v0;

}

id TRResponseMessageFunction()
{
  return (id)classTRResponseMessage;
}

Class initTRResponseMessage()
{
  Class result;

  if (TouchRemoteLibrary_sOnce != -1)
    dispatch_once(&TouchRemoteLibrary_sOnce, &__block_literal_global_73);
  result = objc_getClass("TRResponseMessage");
  classTRResponseMessage = (uint64_t)result;
  getTRResponseMessageClass = (uint64_t (*)())TRResponseMessageFunction;
  return result;
}

id TRRequestMessageFunction()
{
  return (id)classTRRequestMessage;
}

Class initTRRequestMessage()
{
  Class result;

  if (TouchRemoteLibrary_sOnce != -1)
    dispatch_once(&TouchRemoteLibrary_sOnce, &__block_literal_global_73);
  result = objc_getClass("TRRequestMessage");
  classTRRequestMessage = (uint64_t)result;
  getTRRequestMessageClass[0] = (uint64_t (*)())TRRequestMessageFunction;
  return result;
}

id TREventMessageFunction()
{
  return (id)classTREventMessage;
}

Class initTREventMessage()
{
  Class result;

  if (TouchRemoteLibrary_sOnce != -1)
    dispatch_once(&TouchRemoteLibrary_sOnce, &__block_literal_global_73);
  result = objc_getClass("TREventMessage");
  classTREventMessage = (uint64_t)result;
  getTREventMessageClass[0] = (uint64_t (*)())TREventMessageFunction;
  return result;
}

uint64_t sub_214852284()
{
  return MEMORY[0x24BDCB068]();
}

uint64_t sub_214852290()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_21485229C()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_2148522A8()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_2148522B4()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_2148522C0()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_2148522CC()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_2148522D8()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_2148522E4()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_2148522F0()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_2148522FC()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_214852308()
{
  return MEMORY[0x24BDCC1E0]();
}

uint64_t sub_214852314()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_214852320()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21485232C()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_214852338()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_214852344()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_214852350()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t sub_21485235C()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_214852368()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_214852374()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_214852380()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_21485238C()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_214852398()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_2148523A4()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t sub_2148523B0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2148523BC()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_2148523C8()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2148523D4()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2148523E0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2148523EC()
{
  return MEMORY[0x24BE29C70]();
}

uint64_t sub_2148523F8()
{
  return MEMORY[0x24BE29C88]();
}

uint64_t sub_214852404()
{
  return MEMORY[0x24BE29D00]();
}

uint64_t sub_214852410()
{
  return MEMORY[0x24BE29D28]();
}

uint64_t sub_21485241C()
{
  return MEMORY[0x24BE29D38]();
}

uint64_t sub_214852428()
{
  return MEMORY[0x24BE29D60]();
}

uint64_t sub_214852434()
{
  return MEMORY[0x24BE29D98]();
}

uint64_t sub_214852440()
{
  return MEMORY[0x24BE29DA0]();
}

uint64_t sub_21485244C()
{
  return MEMORY[0x24BE29DB0]();
}

uint64_t sub_214852458()
{
  return MEMORY[0x24BE29DC8]();
}

uint64_t sub_214852464()
{
  return MEMORY[0x24BE29DD8]();
}

uint64_t sub_214852470()
{
  return MEMORY[0x24BE29DF0]();
}

uint64_t sub_21485247C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_214852488()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_214852494()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2148524A0()
{
  return MEMORY[0x24BE6D728]();
}

uint64_t sub_2148524AC()
{
  return MEMORY[0x24BE6D730]();
}

uint64_t sub_2148524B8()
{
  return MEMORY[0x24BE6D738]();
}

uint64_t sub_2148524C4()
{
  return MEMORY[0x24BE6D740]();
}

uint64_t sub_2148524D0()
{
  return MEMORY[0x24BE6D768]();
}

uint64_t sub_2148524DC()
{
  return MEMORY[0x24BE6D770]();
}

uint64_t sub_2148524E8()
{
  return MEMORY[0x24BE6D778]();
}

uint64_t sub_2148524F4()
{
  return MEMORY[0x24BE6D788]();
}

uint64_t sub_214852500()
{
  return MEMORY[0x24BE6D790]();
}

uint64_t sub_21485250C()
{
  return MEMORY[0x24BE6D7A8]();
}

uint64_t sub_214852518()
{
  return MEMORY[0x24BE6D7C0]();
}

uint64_t sub_214852524()
{
  return MEMORY[0x24BE6D7C8]();
}

uint64_t sub_214852530()
{
  return MEMORY[0x24BE6D840]();
}

uint64_t sub_21485253C()
{
  return MEMORY[0x24BE6D848]();
}

uint64_t sub_214852548()
{
  return MEMORY[0x24BE6D850]();
}

uint64_t sub_214852554()
{
  return MEMORY[0x24BE6DB60]();
}

uint64_t sub_214852560()
{
  return MEMORY[0x24BE6DB68]();
}

uint64_t sub_21485256C()
{
  return MEMORY[0x24BE6DB70]();
}

uint64_t sub_214852578()
{
  return MEMORY[0x24BE6DB78]();
}

uint64_t sub_214852584()
{
  return MEMORY[0x24BE6DB80]();
}

uint64_t sub_214852590()
{
  return MEMORY[0x24BE6DB98]();
}

uint64_t sub_21485259C()
{
  return MEMORY[0x24BE6DBA0]();
}

uint64_t sub_2148525A8()
{
  return MEMORY[0x24BE6DBA8]();
}

uint64_t sub_2148525B4()
{
  return MEMORY[0x24BE6DBB0]();
}

uint64_t sub_2148525C0()
{
  return MEMORY[0x24BE6DBC8]();
}

uint64_t sub_2148525CC()
{
  return MEMORY[0x24BE6DBF8]();
}

uint64_t sub_2148525D8()
{
  return MEMORY[0x24BE6DC08]();
}

uint64_t sub_2148525E4()
{
  return MEMORY[0x24BE6DC20]();
}

uint64_t sub_2148525F0()
{
  return MEMORY[0x24BE6DC30]();
}

uint64_t sub_2148525FC()
{
  return MEMORY[0x24BE6DC40]();
}

uint64_t sub_214852608()
{
  return MEMORY[0x24BE6DC50]();
}

uint64_t sub_214852614()
{
  return MEMORY[0x24BE6DC58]();
}

uint64_t sub_214852620()
{
  return MEMORY[0x24BE6DC70]();
}

uint64_t sub_21485262C()
{
  return MEMORY[0x24BE6DC80]();
}

uint64_t sub_214852638()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_214852644()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_214852650()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21485265C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_214852668()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_214852674()
{
  return MEMORY[0x24BEE05C0]();
}

uint64_t sub_214852680()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_21485268C()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_214852698()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2148526A4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2148526B0()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_2148526BC()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2148526C8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2148526D4()
{
  return MEMORY[0x24BE29E30]();
}

uint64_t sub_2148526E0()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_2148526EC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2148526F8()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_214852704()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_214852710()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_21485271C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_214852728()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_214852734()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_214852740()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_21485274C()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_214852758()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_214852764()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_214852770()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_21485277C()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_214852788()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_214852794()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2148527A0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2148527AC()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2148527B8()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2148527C4()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2148527D0()
{
  return MEMORY[0x24BEE6818]();
}

uint64_t sub_2148527DC()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_2148527E8()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_2148527F4()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_214852800()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21485280C()
{
  return MEMORY[0x24BEE69A8]();
}

uint64_t sub_214852818()
{
  return MEMORY[0x24BEE69F8]();
}

uint64_t sub_214852824()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_214852830()
{
  return MEMORY[0x24BEE6A38]();
}

uint64_t sub_21485283C()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_214852848()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_214852854()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_214852860()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_21485286C()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_214852878()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_214852884()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_214852890()
{
  return MEMORY[0x24BEE17F8]();
}

uint64_t sub_21485289C()
{
  return MEMORY[0x24BEE1820]();
}

uint64_t sub_2148528A8()
{
  return MEMORY[0x24BDCFED8]();
}

uint64_t sub_2148528B4()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2148528C0()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2148528CC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2148528D8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2148528E4()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2148528F0()
{
  return MEMORY[0x24BE29E78]();
}

uint64_t sub_2148528FC()
{
  return MEMORY[0x24BEE59A0]();
}

uint64_t sub_214852908()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_214852914()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_214852920()
{
  return MEMORY[0x24BEE1E58]();
}

uint64_t sub_21485292C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_214852938()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_214852944()
{
  return MEMORY[0x24BEE2090]();
}

uint64_t sub_214852950()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21485295C()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_214852968()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_214852974()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_214852980()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_21485298C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_214852998()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2148529A4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2148529B0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2148529BC()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2148529C8()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_2148529D4()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2148529E0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2148529EC()
{
  return MEMORY[0x24BEE2F70]();
}

uint64_t sub_2148529F8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_214852A04()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_214852A10()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_214852A1C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_214852A28()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_214852A34()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_214852A40()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_214852A4C()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t sub_214852A58()
{
  return MEMORY[0x24BEE32F8]();
}

uint64_t sub_214852A64()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_214852A70()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_214852A7C()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_214852A88()
{
  return MEMORY[0x24BEE33C0]();
}

uint64_t sub_214852A94()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_214852AA0()
{
  return MEMORY[0x24BEE3438]();
}

uint64_t sub_214852AAC()
{
  return MEMORY[0x24BEE3448]();
}

uint64_t sub_214852AB8()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_214852AC4()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_214852AD0()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_214852ADC()
{
  return MEMORY[0x24BEE3510]();
}

uint64_t sub_214852AE8()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_214852AF4()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_214852B00()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_214852B0C()
{
  return MEMORY[0x24BE29EB0]();
}

uint64_t sub_214852B18()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_214852B24()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_214852B30()
{
  return MEMORY[0x24BEE3DF8]();
}

uint64_t sub_214852B3C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_214852B48()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_214852B54()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_214852B60()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_214852B6C()
{
  return MEMORY[0x24BE29EC0]();
}

uint64_t sub_214852B78()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_214852B84()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_214852B90()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_214852B9C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_214852BA8()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_214852BB4()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_214852BC0()
{
  return MEMORY[0x24BEE4828]();
}

uint64_t sub_214852BCC()
{
  return MEMORY[0x24BEE48A0]();
}

uint64_t sub_214852BD8()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_214852BE4()
{
  return MEMORY[0x24BEE4A10]();
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x24BE28F70]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x24BE28F88]();
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return MEMORY[0x24BE28F90]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x24BE28F98]();
}

uint64_t CFGetTypedObject()
{
  return MEMORY[0x24BE28FF0]();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

uint64_t CNIAmTheWebsheetApp2()
{
  return MEMORY[0x24BE14AB8]();
}

uint64_t CNProberCreate()
{
  return MEMORY[0x24BE14AE0]();
}

uint64_t CNWebsheetNotifyComplete()
{
  return MEMORY[0x24BE14AF8]();
}

uint64_t CUAppendF()
{
  return MEMORY[0x24BE29110]();
}

uint64_t CUDecodeNSErrorDictionary()
{
  return MEMORY[0x24BE29118]();
}

uint64_t CUDescriptionWithLevel()
{
  return MEMORY[0x24BE29120]();
}

uint64_t CUDispatchTimerSet()
{
  return MEMORY[0x24BE29128]();
}

uint64_t CUEncodeNSErrorDictionary()
{
  return MEMORY[0x24BE29130]();
}

uint64_t CUFatalErrorF()
{
  return MEMORY[0x24BE29138]();
}

uint64_t CUGetInterfaceAddresses()
{
  return MEMORY[0x24BE29148]();
}

uint64_t CUIsGreenTeaDevice()
{
  return MEMORY[0x24BE29150]();
}

uint64_t CUNextID32()
{
  return MEMORY[0x24BE29170]();
}

uint64_t CUNextID64()
{
  return MEMORY[0x24BE29178]();
}

uint64_t CUPrintErrorCode()
{
  return MEMORY[0x24BE291A0]();
}

uint64_t CUPrintFlags32()
{
  return MEMORY[0x24BE291B0]();
}

uint64_t CUPrintNSDataHex()
{
  return MEMORY[0x24BE291D0]();
}

uint64_t CUPrintNSError()
{
  return MEMORY[0x24BE291D8]();
}

uint64_t CUPrintNSObject()
{
  return MEMORY[0x24BE291E0]();
}

uint64_t CUPrintNSObjectOneLine()
{
  return MEMORY[0x24BE291F0]();
}

uint64_t CUPrintNSObjectOneLineEx()
{
  return MEMORY[0x24BE291F8]();
}

uint64_t CWFSecItemQueryPassword()
{
  return MEMORY[0x24BE29EF0]();
}

uint64_t CryptoHKDF()
{
  return MEMORY[0x24BE292D8]();
}

uint64_t GestaltGetDeviceClass()
{
  return MEMORY[0x24BE293A0]();
}

uint64_t LogCategoryReplaceF()
{
  return MEMORY[0x24BE295C8]();
}

uint64_t LogCategory_Remove()
{
  return MEMORY[0x24BE295D0]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x24BE295F0]();
}

uint64_t LogPrintF_safe()
{
  return MEMORY[0x24BE295F8]();
}

uint64_t MAEActivateDeviceWithError()
{
  return MEMORY[0x24BE66A20]();
}

uint64_t MAECreateActivationRequestWithError()
{
  return MEMORY[0x24BE66A30]();
}

uint64_t MAECreateSessionRequestWithError()
{
  return MEMORY[0x24BE66A38]();
}

uint64_t MAEGetActivationStateWithError()
{
  return MEMORY[0x24BE66A40]();
}

uint64_t NSDictionaryGetNSNumber()
{
  return MEMORY[0x24BE29680]();
}

uint64_t NSErrorF_safe()
{
  return MEMORY[0x24BE29690]();
}

uint64_t NSErrorNestedF()
{
  return MEMORY[0x24BE29698]();
}

uint64_t NSErrorToOSStatus()
{
  return MEMORY[0x24BE296A8]();
}

uint64_t NSErrorWithOSStatusF()
{
  return MEMORY[0x24BE296B8]();
}

uint64_t NSPrintF()
{
  return MEMORY[0x24BE296C0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t OPACKDecodeData()
{
  return MEMORY[0x24BE29870]();
}

uint64_t OPACKEncoderCreateData()
{
  return MEMORY[0x24BE29880]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x24BE29910]();
}

uint64_t RandomString()
{
  return MEMORY[0x24BE29918]();
}

uint64_t SecondsToUpTicks()
{
  return MEMORY[0x24BE29968]();
}

uint64_t SockAddrToString()
{
  return MEMORY[0x24BE299C8]();
}

uint64_t StringToSockAddr()
{
  return MEMORY[0x24BE29A28]();
}

uint64_t UpTicksToMilliseconds()
{
  return MEMORY[0x24BE29AF0]();
}

uint64_t UpTicksToSecondsF()
{
  return MEMORY[0x24BE29B08]();
}

uint64_t WiFiCopyCurrentNetworkInfoEx()
{
  return MEMORY[0x24BE29B18]();
}

uint64_t WiFiJoinNetwork_b()
{
  return MEMORY[0x24BE29B28]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x24BE679D0]();
}

uint64_t WiFiScan_b()
{
  return MEMORY[0x24BE29B30]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x24BE29B48]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t createStringFromNRLinkSubtype()
{
  return MEMORY[0x24BE6B6F0]();
}

uint64_t createStringFromNRLinkType()
{
  return MEMORY[0x24BE6B708]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
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

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x24BEE4E38]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x24BEE7250]();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return MEMORY[0x24BEE7270]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x24BEE5010]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

