void sub_209F58734(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;

  v34 = a1;
  v1 = sub_209F66F04();
  MEMORY[0x24BDAC7A8](v1, v2);
  v30 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC610);
  MEMORY[0x24BDAC7A8](v31, v4);
  v33 = (uint64_t *)((char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC618);
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (unint64_t *)((char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC620);
  MEMORY[0x24BDAC7A8](v32, v10);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC628);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13, v15);
  v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SwiftUIContentView.ContentLoader();
  sub_209F586EC();
  v18 = sub_209F66D3C();
  v19 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v18 + 88))(v18);
  swift_release();
  if (v19 >> 62)
  {
    if (v19 >> 62 == 1)
    {
      if ((objc_msgSend((id)objc_opt_self(), sel_isInternalBuild) & 1) != 0)
      {
        sub_209F66EF8();
        sub_209F66EEC();
        v38 = v19 & 0x3FFFFFFFFFFFFFFFLL;
        v20 = (id)(v19 & 0x3FFFFFFFFFFFFFFFLL);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2545BB4A8);
        sub_209F67324();
        sub_209F66EE0();
        swift_bridgeObjectRelease();
        sub_209F66EEC();
        sub_209F66F10();
        *(_QWORD *)&v35 = sub_209F670D8();
        *((_QWORD *)&v35 + 1) = v21;
        *(_QWORD *)&v36 = v22 & 1;
        *((_QWORD *)&v36 + 1) = v23;
        v37 = 0;
      }
      else
      {
        v35 = 0u;
        v36 = 0u;
        v37 = 1;
      }
      sub_209F66F64();
      v24 = v38;
      v25 = v39;
      v26 = v40;
      v27 = v41;
      v28 = v42;
      v29 = v33;
      *v33 = v38;
      v29[1] = v25;
      v29[2] = v26;
      v29[3] = v27;
      *((_BYTE *)v29 + 32) = v28;
      swift_storeEnumTagMultiPayload();
      sub_209F58C8C(v24, v25, v26, v27, v28);
      sub_209F58C8C(v24, v25, v26, v27, v28);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC630);
      sub_209F58CBC();
      sub_209F58D40();
      sub_209F66F64();
      sub_209F58DA4(v19);
      sub_209F58DC4(v24, v25, v26, v27, v28);
      sub_209F58DC4(v24, v25, v26, v27, v28);
    }
    else
    {
      sub_209F66D54();
      (*(void (**)(unint64_t *, char *, uint64_t))(v14 + 16))(v9, v17, v13);
      swift_storeEnumTagMultiPayload();
      sub_209EE83E8(&qword_2545BC640, &qword_2545BC628, MEMORY[0x24BDEBBF8]);
      sub_209F66F64();
      sub_209F58DF4((uint64_t)v12, (uint64_t)v33);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC630);
      sub_209F58CBC();
      sub_209F58D40();
      sub_209F66F64();
      sub_209F58E3C((uint64_t)v12);
      (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    }
  }
  else
  {
    *v9 = v19;
    swift_storeEnumTagMultiPayload();
    sub_209EE83E8(&qword_2545BC640, &qword_2545BC628, MEMORY[0x24BDEBBF8]);
    swift_retain();
    sub_209F66F64();
    sub_209F58DF4((uint64_t)v12, (uint64_t)v33);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC630);
    sub_209F58CBC();
    sub_209F58D40();
    sub_209F66F64();
    sub_209F58E3C((uint64_t)v12);
    sub_209F58DA4(v19);
  }
}

uint64_t sub_209F58C8C(uint64_t result, uint64_t a2, char a3, uint64_t a4, char a5)
{
  if ((a5 & 1) == 0)
  {
    sub_209EF1DEC(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_209F58CBC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2545BC638;
  if (!qword_2545BC638)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2545BC620);
    v2[0] = sub_209EE83E8(&qword_2545BC640, &qword_2545BC628, MEMORY[0x24BDEBBF8]);
    v2[1] = MEMORY[0x24BDF4768];
    result = MEMORY[0x20BD1DB1C](MEMORY[0x24BDEF3D8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2545BC638);
  }
  return result;
}

unint64_t sub_209F58D40()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2545BC648;
  if (!qword_2545BC648)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2545BC630);
    v2[0] = MEMORY[0x24BDF1F78];
    v2[1] = MEMORY[0x24BDF5130];
    result = MEMORY[0x20BD1DB1C](MEMORY[0x24BDEF3D8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2545BC648);
  }
  return result;
}

void sub_209F58DA4(unint64_t a1)
{
  if (a1 >> 62 == 1)
  {

  }
  else if (!(a1 >> 62))
  {
    swift_release();
  }
}

uint64_t sub_209F58DC4(uint64_t result, uint64_t a2, char a3, uint64_t a4, char a5)
{
  if ((a5 & 1) == 0)
  {
    sub_209EF1DFC(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_209F58DF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC620);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_209F58E3C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC620);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_209F58E84(uint64_t a1@<X8>)
{
  sub_209F58734(a1);
}

uint64_t sub_209F58E90()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_209F66CDC();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_209F58F00@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 88))();
  *a2 = result;
  return result;
}

uint64_t sub_209F58F30(unint64_t *a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t (*v3)(unint64_t);

  v2 = *a1;
  v3 = *(uint64_t (**)(unint64_t))(**(_QWORD **)a2 + 96);
  sub_209F59DBC(*a1);
  return v3(v2);
}

uint64_t sub_209F58F70()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_209F66CE8();
}

void (*sub_209F58FDC(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_209F66CD0();
  return sub_209F43BF0;
}

uint64_t sub_209F59054()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC650);
  sub_209F66CB8();
  return swift_endAccess();
}

uint64_t sub_209F590B4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC658);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC650);
  sub_209F66CC4();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_209F59188(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC658);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtCV8RemoteUI18SwiftUIContentView13ContentLoader__state;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC650);
  sub_209F66CB8();
  swift_endAccess();
  return sub_209F43E70;
}

uint64_t sub_209F59250()
{
  uint64_t v0;
  uint64_t v1;

  sub_209F59320();
  sub_209F66C58();
  sub_209F59364();
  v1 = sub_209F671C8();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 96))(v1);
}

unint64_t sub_209F59320()
{
  unint64_t result;

  result = qword_2545BC660;
  if (!qword_2545BC660)
  {
    result = MEMORY[0x20BD1DB1C](&unk_209F7BB70, &type metadata for SwiftUIContentView.ContentView);
    atomic_store(result, (unint64_t *)&qword_2545BC660);
  }
  return result;
}

unint64_t sub_209F59364()
{
  unint64_t result;

  result = qword_2545BC668;
  if (!qword_2545BC668)
  {
    result = MEMORY[0x20BD1DB1C](&unk_209F7BB20, &type metadata for SwiftUIContentView.ContentView);
    atomic_store(result, (unint64_t *)&qword_2545BC668);
  }
  return result;
}

uint64_t sub_209F593A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtCV8RemoteUI18SwiftUIContentView13ContentLoader__state;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC650);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_209F593FC()
{
  uint64_t v0;

  v0 = swift_allocObject();
  sub_209F66CAC();
  return v0;
}

uint64_t sub_209F59458@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for SwiftUIContentView.ContentLoader();
  result = sub_209F66C70();
  *a1 = result;
  return result;
}

uint64_t sub_209F59494@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_209F0B104(a1, a2);
}

uint64_t sub_209F5949C()
{
  sub_209F67B10();
  sub_209F6733C();
  return sub_209F67B28();
}

uint64_t sub_209F594E4()
{
  return sub_209F6733C();
}

uint64_t sub_209F594F4()
{
  sub_209F67B10();
  sub_209F6733C();
  return sub_209F67B28();
}

uint64_t sub_209F59538@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_209F67840();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_209F59588(_QWORD *a1@<X8>)
{
  *a1 = 2003134838;
  a1[1] = 0xE400000000000000;
}

uint64_t sub_209F5959C()
{
  return 2003134838;
}

uint64_t sub_209F595AC@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_209F67840();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_209F59600()
{
  sub_209F5A0F0();
  return sub_209F67B88();
}

uint64_t sub_209F59628()
{
  sub_209F5A0F0();
  return sub_209F67B94();
}

uint64_t sub_209F59650()
{
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545BBAA8);
  sub_209EE83E8(&qword_2545BC670, &qword_2545BBAA8, MEMORY[0x24BEE12D8]);
  sub_209F0B248();
  sub_209F0B204();
  return sub_209F67204();
}

char *sub_209F596FC@<X0>(_QWORD *a1@<X0>, char **a2@<X8>)
{
  uint64_t v2;
  char *result;

  result = sub_209F59838(a1);
  if (!v2)
    *a2 = result;
  return result;
}

char *sub_209F59724(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC6C8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 120);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[120 * v8])
      memmove(v12, v13, 120 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_209F59838(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  char *v8;
  char v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[24];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;
  _QWORD v28[3];
  uint64_t v29;
  uint64_t v30;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC6C0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = (char *)a1[3];
  __swift_project_boxed_opaque_existential_1(a1, (uint64_t)v8);
  sub_209F5A0F0();
  sub_209F67B58();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    sub_209F67858();
    v30 = v4;
    __swift_project_boxed_opaque_existential_1(v28, v29);
    v10 = sub_209F6790C();
    v8 = (char *)MEMORY[0x24BEE4AF8];
    if ((v10 & 1) == 0)
    {
      do
      {
        __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v28, v29);
        sub_209F082D4();
        sub_209F67900();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v8 = sub_209F59724(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
        v12 = *((_QWORD *)v8 + 2);
        v11 = *((_QWORD *)v8 + 3);
        if (v12 >= v11 >> 1)
          v8 = sub_209F59724((char *)(v11 > 1), v12 + 1, 1, v8);
        *((_QWORD *)v8 + 2) = v12 + 1;
        v13 = &v8[120 * v12];
        v14 = *(_OWORD *)&v20[8];
        v15 = v21;
        v16 = v23;
        *((_OWORD *)v13 + 4) = v22;
        *((_OWORD *)v13 + 5) = v16;
        *((_OWORD *)v13 + 2) = v14;
        *((_OWORD *)v13 + 3) = v15;
        v17 = v24;
        v18 = v25;
        v19 = v26;
        v13[144] = v27;
        *((_OWORD *)v13 + 7) = v18;
        *((_OWORD *)v13 + 8) = v19;
        *((_OWORD *)v13 + 6) = v17;
        __swift_project_boxed_opaque_existential_1(v28, v29);
      }
      while ((sub_209F6790C() & 1) == 0);
    }
    (*(void (**)(_BYTE *, uint64_t))(v30 + 8))(v7, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v8;
}

uint64_t sub_209F59AC8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_209F59ADC()
{
  unint64_t result;

  result = qword_2545BC678;
  if (!qword_2545BC678)
  {
    result = MEMORY[0x20BD1DB1C](&unk_209F7B9E0, &type metadata for SwiftUIContentView.ContentView.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2545BC678);
  }
  return result;
}

unint64_t sub_209F59B24()
{
  unint64_t result;

  result = qword_2545BC680;
  if (!qword_2545BC680)
  {
    result = MEMORY[0x20BD1DB1C](&unk_209F7BAF8, &type metadata for SwiftUIContentView.ContentView.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2545BC680);
  }
  return result;
}

unint64_t sub_209F59B6C()
{
  unint64_t result;

  result = qword_2545BC688;
  if (!qword_2545BC688)
  {
    result = MEMORY[0x20BD1DB1C](&unk_209F7BAD0, &type metadata for SwiftUIContentView.ContentView.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2545BC688);
  }
  return result;
}

uint64_t sub_209F59BB0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for SwiftUIContentView()
{
  return sub_209F3BB60();
}

uint64_t _s8RemoteUI18SwiftUIContentViewVwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_209F3BB58();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SwiftUIContentView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_209F3BB58();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_209F3BB60();
  return a1;
}

uint64_t assignWithTake for SwiftUIContentView(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_209F3BB60();
  return a1;
}

ValueMetadata *type metadata accessor for SwiftUIContentView()
{
  return &type metadata for SwiftUIContentView;
}

uint64_t sub_209F59CC4()
{
  return type metadata accessor for SwiftUIContentView.ContentLoader();
}

void sub_209F59CCC()
{
  unint64_t v0;

  sub_209F59D38();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_209F59D38()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2545BC690)
  {
    v0 = sub_209F66CF4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2545BC690);
  }
}

unint64_t *initializeBufferWithCopyOfBuffer for SwiftUIContentView.ContentLoader.State(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  sub_209F59DBC(*a2);
  *a1 = v3;
  return a1;
}

unint64_t sub_209F59DBC(unint64_t result)
{
  if (result >> 62 == 1)
    return (unint64_t)(id)(result & 0x3FFFFFFFFFFFFFFFLL);
  if (!(result >> 62))
    return swift_retain();
  return result;
}

void destroy for SwiftUIContentView.ContentLoader.State(unint64_t *a1)
{
  sub_209F58DA4(*a1);
}

unint64_t *assignWithCopy for SwiftUIContentView.ContentLoader.State(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  sub_209F59DBC(*a2);
  v4 = *a1;
  *a1 = v3;
  sub_209F58DA4(v4);
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

unint64_t *assignWithTake for SwiftUIContentView.ContentLoader.State(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a1;
  *a1 = *a2;
  sub_209F58DA4(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for SwiftUIContentView.ContentLoader.State(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7E && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 126);
  v3 = (((*(_QWORD *)a1 >> 57) >> 5) | (4 * ((*(_QWORD *)a1 >> 57) & 0x18 | *(_QWORD *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7D)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for SwiftUIContentView.ContentLoader.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7D)
  {
    *(_QWORD *)result = a2 - 126;
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_209F59F04(_QWORD *a1)
{
  uint64_t v1;

  v1 = *a1 >> 62;
  if (v1 <= 1)
    return v1;
  else
    return (*a1 >> 3) + 2;
}

_QWORD *sub_209F59F20(_QWORD *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_209F59F30(unint64_t *result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  if (a2 < 2)
  {
    v2 = *result & 0xFFFFFFFFFFFFFF8;
    v3 = a2 << 62;
  }
  else
  {
    v2 = 8 * (a2 - 2);
    v3 = 0x8000000000000000;
  }
  *result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for SwiftUIContentView.ContentLoader.State()
{
  return &type metadata for SwiftUIContentView.ContentLoader.State;
}

ValueMetadata *type metadata accessor for SwiftUIContentView.ContentView()
{
  return &type metadata for SwiftUIContentView.ContentView;
}

uint64_t storeEnumTagSinglePayload for SwiftUIContentView.ContentView.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_209F59FBC + 4 * byte_209F7B900[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_209F59FDC + 4 * byte_209F7B905[v4]))();
}

_BYTE *sub_209F59FBC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_209F59FDC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_209F59FE4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_209F59FEC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_209F59FF4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_209F59FFC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SwiftUIContentView.ContentView.CodingKeys()
{
  return &type metadata for SwiftUIContentView.ContentView.CodingKeys;
}

unint64_t sub_209F5A01C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2545BC698;
  if (!qword_2545BC698)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2545BC6A0);
    v2[0] = sub_209F58CBC();
    v2[1] = sub_209F58D40();
    result = MEMORY[0x20BD1DB1C](MEMORY[0x24BDEF3D8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2545BC698);
  }
  return result;
}

unint64_t sub_209F5A08C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2545BC6A8;
  if (!qword_2545BC6A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2545BC6B0);
    v2 = sub_209F0B248();
    result = MEMORY[0x20BD1DB1C](MEMORY[0x24BDF4A00], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2545BC6A8);
  }
  return result;
}

unint64_t sub_209F5A0F0()
{
  unint64_t result;

  result = qword_2545BC6B8;
  if (!qword_2545BC6B8)
  {
    result = MEMORY[0x20BD1DB1C](&unk_209F7BA80, &type metadata for SwiftUIContentView.ContentView.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2545BC6B8);
  }
  return result;
}

unint64_t sub_209F5A138(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t result;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  _QWORD v23[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC718);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v8 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545BBA50);
  v7 = sub_209F67810();
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  v10 = &v6[*(int *)(v2 + 48)];
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_209F62FA8(v13, (uint64_t)v6);
    result = sub_209EE628C((uint64_t)v6);
    if ((v16 & 1) != 0)
      break;
    v17 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v18 = v8[6];
    v19 = sub_209F677B0();
    (*(void (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * v17, v6, v19);
    result = (unint64_t)sub_209EE3510(v10, (_OWORD *)(v8[7] + 32 * v17));
    v20 = v8[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (v21)
      goto LABEL_11;
    v8[2] = v22;
    v13 += v14;
    if (!--v9)
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

uint64_t RUI.LiftUI.XMLDecoder.userInfo.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t RUI.LiftUI.XMLDecoder.userInfo.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*RUI.LiftUI.XMLDecoder.userInfo.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t RUI.LiftUI.XMLDecoder.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = sub_209F5A138(MEMORY[0x24BEE4AF8]);
  return v0;
}

uint64_t RUI.LiftUI.XMLDecoder.init()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = sub_209F5A138(MEMORY[0x24BEE4AF8]);
  return v0;
}

uint64_t RUI.LiftUI.XMLDecoder.decode<A>(_:from:)(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;

  _s6LiftUIO8_DecoderCMa();
  v4 = (_QWORD *)swift_allocObject();
  v5 = MEMORY[0x24BEE4AF8];
  v4[2] = MEMORY[0x24BEE4AF8];
  v6 = a2;
  v4[3] = sub_209F5A138(v5);
  v4[4] = v6;
  swift_beginAccess();
  v7 = *(_QWORD *)(v2 + 16);
  swift_beginAccess();
  v4[3] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_209F5A508();
  return sub_209F674EC();
}

uint64_t _s6LiftUIO8_DecoderCMa()
{
  return objc_opt_self();
}

unint64_t sub_209F5A508()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2545C60C0[0];
  if (!qword_2545C60C0[0])
  {
    v1 = _s6LiftUIO8_DecoderCMa();
    result = MEMORY[0x20BD1DB1C](&unk_209F7BE70, v1);
    atomic_store(result, qword_2545C60C0);
  }
  return result;
}

uint64_t RUI.LiftUI.XMLDecoder.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t RUI.LiftUI.XMLDecoder.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_209F5A58C()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_209F5A5CC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  swift_beginAccess();
  *(_QWORD *)(v3 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_209F5A614())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_209F5A654(uint64_t a1, void **a2)
{
  return RUI.LiftUI.XMLDecoder.decode<A>(_:from:)(a1, *a2);
}

uint64_t sub_209F5A678(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t result;
  unsigned __int8 v7;
  _BYTE v8[32];

  if (qword_2545C60A0 != -1)
    swift_once();
  v2 = sub_209F677B0();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2545C60A8);
  if (!*(_QWORD *)(a1 + 16))
    return 0;
  v4 = sub_209EE628C(v3);
  if ((v5 & 1) == 0)
    return 0;
  sub_209EE3288(*(_QWORD *)(a1 + 56) + 32 * v4, (uint64_t)v8);
  result = swift_dynamicCast();
  if ((_DWORD)result)
    return v7;
  return result;
}

uint64_t sub_209F5A72C()
{
  uint64_t v0;

  if (qword_2545C60A0 != -1)
    swift_once();
  v0 = sub_209F677B0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2545C60A8);
}

uint64_t sub_209F5A774(uint64_t a1)
{
  return sub_209F5A7BC(a1, qword_2545C6088);
}

uint64_t sub_209F5A798(uint64_t a1)
{
  return sub_209F5A7BC(a1, qword_2545C60A8);
}

uint64_t sub_209F5A7BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BB098);
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_209F677B0();
  __swift_allocate_value_buffer(v7, a2);
  v8 = __swift_project_value_buffer(v7, (uint64_t)a2);
  sub_209F677A4();
  v9 = *(_QWORD *)(v7 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v7);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v8, v6, v7);
  __break(1u);
  return result;
}

uint64_t static CodingUserInfoKey.ruiEnableLiftUITweaks.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2545C60A0 != -1)
    swift_once();
  v2 = sub_209F677B0();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2545C60A8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

void sub_209F5A908(char *a1)
{
  sub_209F5A914(*a1);
}

void sub_209F5A914(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_209F5A954(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_209F5A9A8 + 4 * byte_209F7BBE4[a2]))(1819242338);
}

uint64_t sub_209F5A9A8(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 1819242338 && v1 == 0xE400000000000000)
    v2 = 1;
  else
    v2 = sub_209F679A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_209F5AA40()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_209F67B10();
  __asm { BR              X9 }
}

uint64_t sub_209F5AA84()
{
  sub_209F6733C();
  swift_bridgeObjectRelease();
  return sub_209F67B28();
}

void sub_209F5AAE4()
{
  __asm { BR              X10 }
}

uint64_t sub_209F5AB18()
{
  sub_209F6733C();
  return swift_bridgeObjectRelease();
}

void sub_209F5AB64()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_209F67B10();
  __asm { BR              X9 }
}

uint64_t sub_209F5ABA4()
{
  sub_209F6733C();
  swift_bridgeObjectRelease();
  return sub_209F67B28();
}

uint64_t sub_209F5AC04@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_209F60FB4();
  *a1 = result;
  return result;
}

uint64_t sub_209F5AC30()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_209F5AC58 + 4 * byte_209F7BBF4[*v0]))();
}

void sub_209F5AC58(_QWORD *a1@<X8>)
{
  *a1 = 1819242338;
  a1[1] = 0xE400000000000000;
}

void sub_209F5AC6C(_QWORD *a1@<X8>)
{
  *a1 = 0x656C62756F64;
  a1[1] = 0xE600000000000000;
}

void sub_209F5AC84(_QWORD *a1@<X8>)
{
  *a1 = 0x676E69727473;
  a1[1] = 0xE600000000000000;
}

uint64_t sub_209F5AC9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t result;
  _BYTE v11[8];
  __int128 v12;
  __int128 v13;

  v1 = sub_209F677B0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v3);
  v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_2545C6080 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v1, (uint64_t)qword_2545C6088);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v5, v6, v1);
  swift_beginAccess();
  v7 = *(_QWORD *)(v0 + 24);
  if (*(_QWORD *)(v7 + 16))
  {
    swift_bridgeObjectRetain();
    v8 = sub_209EE628C((uint64_t)v5);
    if ((v9 & 1) != 0)
    {
      sub_209EE3288(*(_QWORD *)(v7 + 56) + 32 * v8, (uint64_t)&v12);
    }
    else
    {
      v12 = 0u;
      v13 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
  }
  (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v5, v1);
  if (*((_QWORD *)&v13 + 1))
  {
    result = swift_dynamicCast();
    if ((_DWORD)result)
      return v11[7];
  }
  else
  {
    sub_209EE58AC((uint64_t)&v12);
    return 0;
  }
  return result;
}

uint64_t sub_209F5AE00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  swift_beginAccess();
  v6 = *(void **)(v3 + 32);
  v8 = _s6LiftUIO14KeyedContainerVMa(0, a2, a3, v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9 = v6;
  MEMORY[0x20BD1DB1C](&unk_209F7BFC4, v8);
  return sub_209F678DC();
}

void sub_209F5AEC0(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v4 = v2;
  v7 = sub_209F677B0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _s6LiftUIO8_DecoderCMa();
  v20 = v18;
  v17 = sub_209F5A508();
  v21 = v17;
  v19[0] = v4;
  swift_retain();
  v22 = a2;
  sub_209F674EC();
  if (v3)
  {
    v16 = a1;
    swift_beginAccess();
    v12 = swift_bridgeObjectRetain();
    v13 = sub_209F5A678(v12);
    swift_bridgeObjectRelease();
    if ((v13 & 1) != 0)
    {
      v14 = sub_209F5AC9C() ^ 1;
      if (qword_2545C6080 != -1)
        swift_once();
      v15 = __swift_project_value_buffer(v7, (uint64_t)qword_2545C6088);
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v15, v7);
      v20 = MEMORY[0x24BEE1328];
      LOBYTE(v19[0]) = v14 & 1;
      swift_beginAccess();
      sub_209F0EEA0((uint64_t)v19, (uint64_t)v11);
      swift_endAccess();
      v20 = v18;
      v21 = v17;
      v19[0] = v4;
      swift_retain();
      sub_209F674EC();

    }
    else
    {
      swift_willThrow();
    }
  }
}

uint64_t sub_209F5B0C0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_209F5B0F4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_209F5B100()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_209F5B140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209F5AE00(a1, a2, a3);
}

id sub_209F5B160@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  swift_beginAccess();
  v5 = *(_QWORD *)(v3 + 24);
  v6 = *(void **)(v3 + 32);
  a1[3] = &_s6LiftUIO16UnkeyedContainerVN;
  a1[4] = sub_209F60238();
  v7 = (_QWORD *)swift_allocObject();
  *a1 = v7;
  v7[2] = v4;
  v7[3] = v5;
  v7[4] = v6;
  v7[5] = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v6;
}

id sub_209F5B204@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  swift_beginAccess();
  v5 = *(_QWORD *)(v3 + 24);
  v6 = *(void **)(v3 + 32);
  a1[3] = &_s6LiftUIO20SingleValueContainerVN;
  a1[4] = sub_209F601F4();
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t sub_209F5B290(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  unsigned __int8 v18;
  __int128 v19;
  __int128 v20;

  v4 = sub_209F677B0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (swift_conformsToProtocol2())
    v9 = a2;
  else
    v9 = 0;
  if (v9)
    return 1;
  if (qword_2545C60A0 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v4, (uint64_t)qword_2545C60A8);
  if (!*(_QWORD *)(a1 + 16))
    return 0;
  v12 = sub_209EE628C(v11);
  if ((v13 & 1) == 0)
    return 0;
  sub_209EE3288(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)&v19);
  if (!swift_dynamicCast() || (v18 & 1) == 0)
    return 0;
  if (qword_2545C6080 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v4, (uint64_t)qword_2545C6088);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v14, v4);
  if (*(_QWORD *)(a1 + 16) && (v15 = sub_209EE628C((uint64_t)v8), (v16 & 1) != 0))
  {
    sub_209EE3288(*(_QWORD *)(a1 + 56) + 32 * v15, (uint64_t)&v19);
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  if (!*((_QWORD *)&v20 + 1))
  {
    sub_209EE58AC((uint64_t)&v19);
    return 0;
  }
  result = swift_dynamicCast();
  if ((_DWORD)result)
    return v18;
  return result;
}

char *sub_209F5B474(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a1 >> 62)
    goto LABEL_15;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v3 = MEMORY[0x24BEE4AF8];
    if (!v2)
      return (char *)v3;
    v15 = MEMORY[0x24BEE4AF8];
    result = sub_209F06D20(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0)
      break;
    v5 = 0;
    v3 = v15;
    while (v2 != v5)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x20BD1CAB4](v5, a1);
      else
        v6 = *(id *)(a1 + 8 * v5 + 32);
      v7 = v6;
      v8 = objc_msgSend(v6, sel_name);
      v9 = sub_209F672C4();
      v11 = v10;

      v13 = *(_QWORD *)(v15 + 16);
      v12 = *(_QWORD *)(v15 + 24);
      if (v13 >= v12 >> 1)
        sub_209F06D20((char *)(v12 > 1), v13 + 1, 1);
      ++v5;
      *(_QWORD *)(v15 + 16) = v13 + 1;
      v14 = v15 + 16 * v13;
      *(_QWORD *)(v14 + 32) = v9;
      *(_QWORD *)(v14 + 40) = v11;
      if (v2 == v5)
        return (char *)v3;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    v2 = sub_209F677EC();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_209F5B5EC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  id v26;
  unint64_t v27;
  char *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  char *v33;
  unint64_t v34;

  if (swift_conformsToProtocol2())
    v6 = a3;
  else
    v6 = 0;
  if (v6)
  {
    v7 = objc_msgSend(a2, sel_attributtes);
    v8 = sub_209F67258();

    sub_209F60CD4(v8);
    v9 = swift_bridgeObjectRelease();
  }
  else
  {
    if (swift_conformsToProtocol2())
      v11 = a3;
    else
      v11 = 0;
    if (v11)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2545BB780);
      v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_209F7A4E0;
      v13 = objc_msgSend(a2, sel_name);
      v14 = sub_209F672C4();
      v16 = v15;

      *(_QWORD *)(v12 + 32) = v14;
      *(_QWORD *)(v12 + 40) = v16;
    }
    else
    {
      if ((sub_209F5B290(a1, a3) & 1) != 0)
      {
        v17 = objc_msgSend(a2, sel_name);
        v18 = sub_209F672C4();
        v20 = v19;

        v21 = sub_209F4314C(0, 1, 1, MEMORY[0x24BEE4AF8]);
        v23 = *((_QWORD *)v21 + 2);
        v22 = *((_QWORD *)v21 + 3);
        v24 = v23 + 1;
        if (v23 >= v22 >> 1)
        {
          v34 = v23 + 1;
          v33 = sub_209F4314C((char *)(v22 > 1), v23 + 1, 1, v21);
          v24 = v23 + 1;
          v21 = v33;
        }
        *((_QWORD *)v21 + 2) = v24;
        v25 = &v21[16 * v23];
        *((_QWORD *)v25 + 4) = v18;
        *((_QWORD *)v25 + 5) = v20;
      }
      v26 = objc_msgSend(a2, sel_children, v34);
      type metadata accessor for RUIXMLElement(0);
      v27 = sub_209F67408();

      v28 = sub_209F5B474(v27);
      swift_bridgeObjectRelease();
      v29 = objc_msgSend(a2, sel_attributtes);
      v30 = sub_209F67258();

      sub_209F606DC(v30);
      v9 = sub_209F43064((uint64_t)v28);
    }
  }
  MEMORY[0x24BDAC7A8](v9, v10);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2545BC560);
  sub_209F640D8();
  v31 = sub_209F6739C();
  swift_bridgeObjectRelease();
  return v31;
}

uint64_t sub_209F5B8DC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4;
  char v5;

  sub_209F5B5EC(a2, a3, a4);
  v4 = sub_209F67468();
  MEMORY[0x20BD1DB1C](MEMORY[0x24BEE12C8], v4);
  v5 = sub_209F673B4();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

BOOL sub_209F5B980(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  return (sub_209F5B8DC(a1, a2, a3, a4) & 1) == 0;
}

uint64_t sub_209F5B99C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  unsigned __int8 v7;
  void *v8;

  sub_209F5B9FC(a1, a2, a3, a4, a5, a6);
  if (!v6)
  {
    v8 = (void *)sub_209F672A0();
    swift_bridgeObjectRelease();
    v7 = objc_msgSend(v8, sel_BOOLValue);

  }
  return v7 & 1;
}

void *sub_209F5B9FC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  id v24;
  void *v25;
  uint64_t v28;

  v11 = sub_209F67B64();
  v13 = v12;
  v14 = objc_msgSend(a4, sel_attributtes);
  v15 = sub_209F67258();

  if (*(_QWORD *)(v15 + 16) && (v16 = sub_209EE31C0(v11, v13), (v17 & 1) != 0))
  {
    a4 = *(void **)(*(_QWORD *)(v15 + 56) + 16 * v16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v18 = sub_209F5BC00(a1, a2, a3, a4, a5, a6);
    if (!v28)
    {
      v19 = v18;
      v20 = objc_msgSend(v18, sel_attributtes);
      v21 = sub_209F67258();

      if (*(_QWORD *)(v21 + 16) && (v22 = sub_209EE31C0(0x65756C6176, 0xE500000000000000), (v23 & 1) != 0))
      {
        a4 = *(void **)(*(_QWORD *)(v21 + 56) + 16 * v22);
        swift_bridgeObjectRetain();

        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        v24 = objc_msgSend(v19, sel_stringValue);
        if (v24)
        {
          v25 = v24;
          a4 = (void *)sub_209F672C4();

        }
        else
        {

          return 0;
        }
      }
    }
  }
  return a4;
}

id sub_209F5BC00(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  char v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  char isUniquelyReferenced_nonNull_native;
  void *v46;
  char v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *boxed_opaque_existential_0;
  id v53;
  _QWORD v54[9];
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;

  v54[8] = a2;
  v11 = sub_209F67B64();
  v13 = v12;
  v14 = objc_msgSend(a4, sel_attributtes);
  v15 = sub_209F67258();

  if (*(_QWORD *)(v15 + 16))
  {
    sub_209EE31C0(v11, v13);
    if ((v16 & 1) != 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_209F67B64();
      v17 = objc_allocWithZone((Class)RUIXMLElement);
      v18 = (void *)sub_209F672A0();
      swift_bridgeObjectRelease();
      v19 = objc_msgSend(v17, sel_initWithName_, v18);

      v20 = (void *)sub_209F672A0();
      swift_bridgeObjectRelease();
      objc_msgSend(v19, sel_setStringValue_, v20);

      v21 = objc_msgSend(a4, sel_attributtes);
      v22 = sub_209F67258();

      if (*(_QWORD *)(v22 + 16) && (v23 = sub_209EE31C0(1701869940, 0xE400000000000000), (v24 & 1) != 0))
      {
        v25 = (uint64_t *)(*(_QWORD *)(v22 + 56) + 16 * v23);
        v26 = *v25;
        v27 = v25[1];
        swift_bridgeObjectRetain();
      }
      else
      {
        v26 = 0;
        v27 = 0;
      }
      swift_bridgeObjectRelease();
      v43 = objc_msgSend(v19, sel_attributtes);
      v44 = sub_209F67258();

      v56 = v44;
      if (v27)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v58 = v44;
        sub_209F60568(v26, v27, 1701869940, 0xE400000000000000, isUniquelyReferenced_nonNull_native);
      }
      else
      {
        sub_209F602B0(1701869940, 0xE400000000000000);
      }
      swift_bridgeObjectRelease();
      v46 = (void *)sub_209F6724C();
      swift_bridgeObjectRelease();
      objc_msgSend(v19, sel_setAttributtes_, v46);

      return v19;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v28 = sub_209F5C610(a1, a4, a5);
  if (v28)
    return v28;
  v29 = objc_msgSend(a4, sel_children);
  type metadata accessor for RUIXMLElement(0);
  v30 = sub_209F67408();

  MEMORY[0x24BDAC7A8](v31, v32);
  v54[2] = a5;
  v54[3] = a6;
  v54[4] = a1;
  v33 = v55;
  v19 = sub_209F5C8F4(sub_209F63B90, (uint64_t)v54, v30);
  swift_bridgeObjectRelease();
  if (v19)
    return v19;
  v34 = sub_209F5B290(a3, a5);
  v35 = (uint64_t)&selRef_loadSystemImage;
  if ((v34 & 1) == 0)
    goto LABEL_21;
  v55 = v33;
  v36 = sub_209F67B64();
  v38 = v37;
  v39 = objc_msgSend(a4, sel_name);
  v40 = sub_209F672C4();
  v42 = v41;

  if (v36 != v40 || v38 != v42)
  {
    v48 = sub_209F679A8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v35 = 0x1F30B0000;
    if ((v48 & 1) != 0)
      return a4;
LABEL_21:
    v19 = (id)sub_209F67720();
    v55 = swift_allocError();
    v49 = v35;
    v51 = v50;
    v54[7] = (char *)v50 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2545BC730) + 48);
    v51[3] = a5;
    v51[4] = a6;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v51);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 16))(boxed_opaque_existential_0, a1, a5);
    v56 = 0;
    v57 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_209F676CC();
    swift_bridgeObjectRelease();
    v56 = 0xD00000000000001ALL;
    v57 = 0x8000000209F73AD0;
    v53 = objc_msgSend(a4, (SEL)(v49 + 1736));
    sub_209F672C4();

    sub_209F67354();
    swift_bridgeObjectRelease();
    sub_209F67714();
    (*(void (**)(uint64_t *, _QWORD, id))(*((_QWORD *)v19 - 1) + 104))(v51, *MEMORY[0x24BEE26C8], v19);
    swift_willThrow();
    return v19;
  }
  swift_bridgeObjectRelease_n();
  return a4;
}

void sub_209F5C184(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  void *v7;

  sub_209F5B9FC(a1, a2, a3, a4, a5, a6);
  if (!v6)
  {
    v7 = (void *)sub_209F672A0();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_doubleValue);

  }
}

void sub_209F5C1EC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  void *v7;

  sub_209F5B9FC(a1, a2, a3, a4, a5, a6);
  if (!v6)
  {
    v7 = (void *)sub_209F672A0();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_floatValue);

  }
}

id sub_209F5C254(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  id result;
  void *v8;
  id v9;

  result = sub_209F5B9FC(a1, a2, a3, a4, a5, a6);
  if (!v6)
  {
    v8 = (void *)sub_209F672A0();
    swift_bridgeObjectRelease();
    v9 = objc_msgSend(v8, sel_integerValue);

    return v9;
  }
  return result;
}

uint64_t sub_209F5C2B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X5>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v9;

  result = sub_209F679FC();
  if (!v4)
  {
    v9 = sub_209F679F0();
    sub_209F5E534(a1, v9, a2, a3, a4);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_209F5C370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t), uint64_t a8)
{
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  unsigned __int8 v17;

  v11 = _s6LiftUIO14KeyedContainerVMa(0, a5, a6, a4);
  v12 = MEMORY[0x20BD1DB1C](&unk_209F7BFC4, v11);
  v15 = a7(v12, v13, v14);
  result = sub_209F5C2B4(a8, a8, v15, (uint64_t)&v17);
  if (!v8)
    return v17;
  return result;
}

uint64_t sub_209F5C418(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t), uint64_t a8)
{
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  unsigned __int16 v17;

  v11 = _s6LiftUIO14KeyedContainerVMa(0, a5, a6, a4);
  v12 = MEMORY[0x20BD1DB1C](&unk_209F7BFC4, v11);
  v15 = a7(v12, v13, v14);
  result = sub_209F5C2B4(a8, a8, v15, (uint64_t)&v17);
  if (!v8)
    return v17;
  return result;
}

uint64_t sub_209F5C4C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t), uint64_t a8)
{
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  unsigned int v17;

  v11 = _s6LiftUIO14KeyedContainerVMa(0, a5, a6, a4);
  v12 = MEMORY[0x20BD1DB1C](&unk_209F7BFC4, v11);
  v15 = a7(v12, v13, v14);
  result = sub_209F5C2B4(a8, a8, v15, (uint64_t)&v17);
  if (!v8)
    return v17;
  return result;
}

uint64_t sub_209F5C568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t), uint64_t a8)
{
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;

  v11 = _s6LiftUIO14KeyedContainerVMa(0, a5, a6, a4);
  v12 = MEMORY[0x20BD1DB1C](&unk_209F7BFC4, v11);
  v15 = a7(v12, v13, v14);
  result = sub_209F5C2B4(a8, a8, v15, (uint64_t)&v17);
  if (!v8)
    return v17;
  return result;
}

void *sub_209F5C610(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v13;
  id v14;
  _QWORD v16[2];

  v4 = a2;
  v6 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[1] = v9;
  swift_getMetatypeMetadata();
  sub_209F67324();
  v10 = sub_209F5C790();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a3);
  if ((v10 & 1) != 0)
  {
    if (sub_209F67B64() == 0x746E65746E6F63 && v11 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, a3);
LABEL_11:
      v14 = v4;
      return v4;
    }
    v13 = sub_209F679A8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, a3);
    if ((v13 & 1) != 0)
      goto LABEL_11;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, a3);
  }
  return 0;
}

uint64_t sub_209F5C790()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v0 = sub_209F67360();
  if (v1)
  {
    v2 = v0;
    v3 = v1;
    do
    {
      v6 = sub_209F67360();
      if (!v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v2 == v6 && v3 == v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v4 = sub_209F679A8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      v2 = sub_209F67360();
      v3 = v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  sub_209F67360();
  v9 = v8;
  swift_bridgeObjectRelease();
  v10 = v9 == 0;
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_209F5C8F4(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v13;

  if (a3 >> 62)
    goto LABEL_16;
  v6 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; v6 = sub_209F677EC())
  {
    v7 = 4;
    while (1)
    {
      v8 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x20BD1CAB4](v7 - 4, a3) : *(id *)(a3 + 8 * v7);
      v9 = v8;
      v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      v13 = v8;
      v11 = a1(&v13);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return v9;
      }
      if ((v11 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return v9;
      }

      ++v7;
      if (v10 == v6)
        goto LABEL_11;
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  return 0;
}

void sub_209F5CA14(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v10;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  id v25;
  void *v26;
  id v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  _QWORD *v33;
  uint64_t v34;
  id v35;
  uint64_t inited;
  uint64_t *boxed_opaque_existential_0;
  _QWORD v38[9];
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v43 = a7;
  v45 = a3;
  v42 = a9;
  if (swift_conformsToProtocol2())
    v17 = a1;
  else
    v17 = 0;
  if (v17 && (sub_209F5A678(a4) & 1) == 0)
  {
    v25 = objc_allocWithZone((Class)RUIXMLElement);
    v41 = a4;
    v26 = (void *)sub_209F672A0();
    v39 = objc_msgSend(v25, sel_initWithName_, v26);

    v27 = objc_msgSend(a5, sel_children);
    type metadata accessor for RUIXMLElement(0);
    v28 = sub_209F67408();

    MEMORY[0x24BDAC7A8](v29, v30);
    v38[2] = a6;
    v38[3] = v43;
    v38[4] = a8;
    v38[5] = a10;
    v38[6] = a2;
    sub_209F5CE18(sub_209F63C54, (uint64_t)v38, v28);
    v40 = v10;
    v31 = (void *)sub_209F673FC();
    swift_bridgeObjectRelease();
    v32 = v39;
    objc_msgSend(v39, sel_appendChildren_, v31);

    _s6LiftUIO8_DecoderCMa();
    v33 = (_QWORD *)swift_allocObject();
    v34 = MEMORY[0x24BEE4AF8];
    v33[2] = MEMORY[0x24BEE4AF8];
    v35 = v32;
    v33[3] = sub_209F5A138(v34);
    v33[4] = v35;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC720);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_209F7A4E0;
    *(_QWORD *)(inited + 56) = a6;
    *(_QWORD *)(inited + 64) = a8;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 32));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 16))(boxed_opaque_existential_0, a2, a6);
    v44 = v45;
    swift_bridgeObjectRetain();
    sub_209F60AA4((_QWORD *)inited);
    v33[2] = v44;
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v33[3] = v41;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_209F5AEC0(a10, v42);
    swift_release();

  }
  else
  {
    v18 = v45;
    v19 = sub_209F5BC00(a2, v45, a4, a5, a6, a8);
    if (!v10)
    {
      v20 = v19;
      _s6LiftUIO8_DecoderCMa();
      v21 = (_QWORD *)swift_allocObject();
      v22 = MEMORY[0x24BEE4AF8];
      v21[2] = MEMORY[0x24BEE4AF8];
      v41 = a10;
      v21[3] = sub_209F5A138(v22);
      v21[4] = v20;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC720);
      v23 = swift_initStackObject();
      *(_OWORD *)(v23 + 16) = xmmword_209F7A4E0;
      *(_QWORD *)(v23 + 56) = a6;
      *(_QWORD *)(v23 + 64) = a8;
      v24 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v23 + 32));
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 16))(v24, a2, a6);
      swift_bridgeObjectRetain();
      sub_209F60AA4((_QWORD *)v23);
      v21[2] = v18;
      swift_bridgeObjectRelease();
      swift_beginAccess();
      v21[3] = a4;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_209F5AEC0(v41, v42);
      swift_release();
    }
  }
}

uint64_t sub_209F5CE18(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;

  v4 = a3;
  v19 = MEMORY[0x24BEE4AF8];
  if (a3 >> 62)
    goto LABEL_18;
  v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
    while (1)
    {
      v8 = 0;
      v16 = v4 & 0xFFFFFFFFFFFFFF8;
      v17 = v4 & 0xC000000000000001;
      v15 = v4;
      while (v17)
      {
        v9 = (id)MEMORY[0x20BD1CAB4](v8, v4);
LABEL_9:
        v10 = v9;
        v11 = v8 + 1;
        if (__OFADD__(v8, 1))
          goto LABEL_17;
        v18 = v9;
        v12 = a2;
        v13 = a1(&v18);
        if (v3)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return v12;
        }
        if ((v13 & 1) != 0)
        {
          sub_209F67738();
          sub_209F6775C();
          v4 = v15;
          sub_209F67768();
          sub_209F67744();
        }
        else
        {

        }
        ++v8;
        if (v11 == v7)
        {
          v12 = v19;
          goto LABEL_20;
        }
      }
      if (v8 < *(_QWORD *)(v16 + 16))
        break;
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      v7 = sub_209F677EC();
      if (!v7)
        goto LABEL_19;
    }
    v9 = *(id *)(v4 + 8 * v8 + 32);
    goto LABEL_9;
  }
LABEL_19:
  v12 = MEMORY[0x24BEE4AF8];
LABEL_20:
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_209F5CFBC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t inited;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v17;
  uint64_t v19;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC720);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_209F7A4E0;
  *(_QWORD *)(inited + 56) = a5;
  *(_QWORD *)(inited + 64) = a7;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 32));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 16))(boxed_opaque_existential_0, a1, a5);
  swift_bridgeObjectRetain();
  sub_209F60AA4((_QWORD *)inited);
  swift_bridgeObjectRetain();
  sub_209F5BC00(a1, a2, a3, a4, a5, a7);
  if (v8)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    v19 = _s6LiftUIO14KeyedContainerVMa(0, a6, a8, v17);
    MEMORY[0x20BD1DB1C](&unk_209F7BFC4, v19);
    return sub_209F678DC();
  }
}

_QWORD *sub_209F5D114@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  uint64_t v7;
  id v15;
  _QWORD *result;
  id v17;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v15 = sub_209F5BC00(a1, a2, a3, a4, a5, a6);
  if (v7)
  {
    swift_bridgeObjectRelease();
    return (_QWORD *)swift_bridgeObjectRelease();
  }
  else
  {
    v17 = v15;
    a7[3] = &_s6LiftUIO16UnkeyedContainerVN;
    a7[4] = sub_209F60238();
    result = (_QWORD *)swift_allocObject();
    *a7 = result;
    result[2] = a2;
    result[3] = a3;
    result[4] = v17;
    result[5] = 0;
  }
  return result;
}

uint64_t sub_209F5D1E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;

  v12 = sub_209F675DC();
  MEMORY[0x24BDAC7A8](v12, v13);
  v15 = (char *)&v18 - v14;
  sub_209F67B70();
  v16 = *(_QWORD *)(a4 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v15, 1, a4);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_209F5D2F0((uint64_t)v15, a1, a2, a3, a4, a5, a6);
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v15, a4);
  }
  return result;
}

unint64_t sub_209F5D2F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  uint64_t v7;
  unint64_t result;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t inited;
  uint64_t *boxed_opaque_existential_0;
  _QWORD *v20;
  uint64_t v21;

  result = (unint64_t)sub_209F5BC00(a1, a2, a3, a4, a5, a6);
  if (!v7)
  {
    v15 = result;
    v21 = _s6LiftUIO8_DecoderCMa();
    v20 = a7;
    v16 = (_QWORD *)swift_allocObject();
    v17 = MEMORY[0x24BEE4AF8];
    v16[2] = MEMORY[0x24BEE4AF8];
    v16[3] = sub_209F5A138(v17);
    v16[4] = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC720);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_209F7A4E0;
    *(_QWORD *)(inited + 56) = a5;
    *(_QWORD *)(inited + 64) = a6;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 32));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 16))(boxed_opaque_existential_0, a1, a5);
    swift_bridgeObjectRetain();
    sub_209F60AA4((_QWORD *)inited);
    v16[2] = a2;
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v16[3] = a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v20[3] = v21;
    result = sub_209F5A508();
    v20[4] = result;
    *v20 = v16;
  }
  return result;
}

uint64_t sub_209F5D448()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_209F5D450(uint64_t a1)
{
  uint64_t v1;

  return sub_209F5B5EC(*(_QWORD *)(v1 + 8), *(void **)(v1 + 16), *(_QWORD *)(a1 + 16));
}

uint64_t sub_209F5D460(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_209F5B8DC(a1, *(_QWORD *)(v2 + 8), *(void **)(v2 + 16), *(_QWORD *)(a2 + 16));
}

BOOL sub_209F5D470(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_209F5B980(a1, *(_QWORD *)(v2 + 8), *(void **)(v2 + 16), *(_QWORD *)(a2 + 16));
}

uint64_t sub_209F5D4A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_209F5B99C(a1, *(_QWORD *)v2, *(_QWORD *)(v2 + 8), *(void **)(v2 + 16), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24)) & 1;
}

void *sub_209F5D4CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_209F5B9FC(a1, *(_QWORD *)v2, *(_QWORD *)(v2 + 8), *(void **)(v2 + 16), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

void sub_209F5D4F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_209F5C184(a1, *(_QWORD *)v2, *(_QWORD *)(v2 + 8), *(void **)(v2 + 16), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

void sub_209F5D514(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_209F5C1EC(a1, *(_QWORD *)v2, *(_QWORD *)(v2 + 8), *(void **)(v2 + 16), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

id sub_209F5D538(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_209F5C254(a1, *(_QWORD *)v2, *(_QWORD *)(v2 + 8), *(void **)(v2 + 16), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

uint64_t sub_209F5D55C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209F5D674(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_209F63F80, MEMORY[0x24BEE3E50]);
}

uint64_t sub_209F5D580(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209F5D6C4(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_209F63F3C, MEMORY[0x24BEE3F30]);
}

uint64_t sub_209F5D5A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209F5D714(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_209F63EF8, MEMORY[0x24BEE3F88]);
}

uint64_t sub_209F5D5C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209F5D5EC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_209F63EB4, MEMORY[0x24BEE4008]);
}

uint64_t sub_209F5D5EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t), uint64_t a5)
{
  uint64_t *v5;

  return sub_209F5C568(a1, *v5, v5[1], v5[2], *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a4, a5);
}

uint64_t sub_209F5D618()
{
  return sub_209F67A68();
}

uint64_t sub_209F5D62C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209F5D5EC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_209F63E70, MEMORY[0x24BEE1E88]);
}

uint64_t sub_209F5D650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209F5D674(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_209F63E2C, MEMORY[0x24BEE4260]);
}

uint64_t sub_209F5D674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t), uint64_t a5)
{
  uint64_t *v5;

  return sub_209F5C370(a1, *v5, v5[1], v5[2], *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a4, a5);
}

uint64_t sub_209F5D6A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209F5D6C4(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_209F63DE8, MEMORY[0x24BEE4478]);
}

uint64_t sub_209F5D6C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t), uint64_t a5)
{
  uint64_t *v5;

  return sub_209F5C418(a1, *v5, v5[1], v5[2], *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a4, a5);
}

uint64_t sub_209F5D6F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209F5D714(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_209F63DA4, MEMORY[0x24BEE44F0]);
}

uint64_t sub_209F5D714(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t), uint64_t a5)
{
  uint64_t *v5;

  return sub_209F5C4C0(a1, *v5, v5[1], v5[2], *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a4, a5);
}

uint64_t sub_209F5D740(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209F5D5EC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_209F63D1C, MEMORY[0x24BEE4568]);
}

uint64_t sub_209F5D764()
{
  return sub_209F67A74();
}

void sub_209F5D778(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;

  sub_209F5CA14(a1, a2, *(_QWORD *)v6, *(_QWORD *)(v6 + 8), *(void **)(v6 + 16), *(_QWORD *)(a5 + 16), a3, *(_QWORD *)(a5 + 24), a6, a4);
}

uint64_t sub_209F5D7B0()
{
  return sub_209F67A14();
}

uint64_t sub_209F5D7C4()
{
  return sub_209F67A08();
}

uint64_t sub_209F5D7D8()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_209F67A20();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_209F5D7F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209F5D988(a1, a2, a3, MEMORY[0x24BEE3C00]);
}

uint64_t sub_209F5D814()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_209F67A2C();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_209F5D834(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209F5D900(a1, a2, a3, MEMORY[0x24BEE3C20]);
}

uint64_t sub_209F5D850(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209F5D944(a1, a2, a3, MEMORY[0x24BEE3C28]);
}

uint64_t sub_209F5D86C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209F5D988(a1, a2, a3, MEMORY[0x24BEE3C30]);
}

uint64_t sub_209F5D888()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_209F67A50();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_209F5D8A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209F5D9F4(a1, a2, a3, MEMORY[0x24BEE3C48]);
}

uint64_t sub_209F5D8C4()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_209F67A38();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_209F5D8E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209F5D900(a1, a2, a3, MEMORY[0x24BEE3C40]);
}

uint64_t sub_209F5D900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FF;
}

uint64_t sub_209F5D928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209F5D944(a1, a2, a3, MEMORY[0x24BEE3C50]);
}

uint64_t sub_209F5D944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FFFF;
}

uint64_t sub_209F5D96C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209F5D988(a1, a2, a3, MEMORY[0x24BEE3C58]);
}

uint64_t sub_209F5D988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v4;

  v4 = a4();
  return v4 | ((HIDWORD(v4) & 1) << 32);
}

uint64_t sub_209F5D9B8()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_209F67A5C();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_209F5D9D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209F5D9F4(a1, a2, a3, MEMORY[0x24BEE3C68]);
}

uint64_t sub_209F5D9F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  result = a4();
  if (v4)
    return v6;
  return result;
}

uint64_t sub_209F5DA18()
{
  return sub_209F67A44();
}

uint64_t sub_209F5DA40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  return sub_209F5CFBC(a2, *(_QWORD *)v5, *(_QWORD *)(v5 + 8), *(void **)(v5 + 16), *(_QWORD *)(a5 + 16), a3, *(_QWORD *)(a5 + 24), a4);
}

uint64_t sub_209F5DA70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209F5DACC(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_209F5D114);
}

uint64_t sub_209F5DA8C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_209F5D1E4(*(_QWORD *)v2, *(_QWORD *)(v2 + 8), *(void **)(v2 + 16), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a2);
}

uint64_t sub_209F5DAB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209F5DACC(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_209F5D2F0);
}

uint64_t sub_209F5DACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v4;

  return a4(a1, *v4, v4[1], v4[2], *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

id sub_209F5DAF4()
{
  void *v0;
  id v1;

  v0 = (void *)sub_209F672A0();
  v1 = objc_msgSend(v0, sel_integerValue);

  return v1;
}

_QWORD *sub_209F5DB2C()
{
  void *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  v0 = (void *)sub_209F672A0();
  v1 = objc_msgSend(v0, sel_integerValue);

  if (v1 != (_QWORD *)(char)v1)
  {
    v2 = sub_209F67720();
    swift_allocError();
    v4 = v3;
    swift_bridgeObjectRetain();
    sub_209F676CC();
    swift_bridgeObjectRelease();
    v6[0] = 0xD000000000000018;
    v6[1] = 0x8000000209F73830;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC710);
    sub_209F6730C();
    v1 = v6;
    sub_209F67354();
    swift_bridgeObjectRelease();
    sub_209F67714();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v4, *MEMORY[0x24BEE26D8], v2);
    swift_willThrow();
  }
  return v1;
}

_QWORD *sub_209F5DC6C()
{
  void *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  v0 = (void *)sub_209F672A0();
  v1 = objc_msgSend(v0, sel_integerValue);

  if (v1 != (_QWORD *)(__int16)v1)
  {
    v2 = sub_209F67720();
    swift_allocError();
    v4 = v3;
    swift_bridgeObjectRetain();
    sub_209F676CC();
    swift_bridgeObjectRelease();
    v6[0] = 0xD000000000000018;
    v6[1] = 0x8000000209F73830;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC708);
    sub_209F6730C();
    v1 = v6;
    sub_209F67354();
    swift_bridgeObjectRelease();
    sub_209F67714();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v4, *MEMORY[0x24BEE26D8], v2);
    swift_willThrow();
  }
  return v1;
}

_QWORD *sub_209F5DDAC()
{
  void *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  v0 = (void *)sub_209F672A0();
  v1 = objc_msgSend(v0, sel_integerValue);

  if (v1 != (_QWORD *)(int)v1)
  {
    v2 = sub_209F67720();
    swift_allocError();
    v4 = v3;
    swift_bridgeObjectRetain();
    sub_209F676CC();
    swift_bridgeObjectRelease();
    v6[0] = 0xD000000000000018;
    v6[1] = 0x8000000209F73830;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC700);
    sub_209F6730C();
    v1 = v6;
    sub_209F67354();
    swift_bridgeObjectRelease();
    sub_209F67714();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v4, *MEMORY[0x24BEE26D8], v2);
    swift_willThrow();
  }
  return v1;
}

unint64_t sub_209F5DEEC()
{
  void *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = (void *)sub_209F672A0();
  v1 = (unint64_t)objc_msgSend(v0, sel_integerValue);

  if ((v1 & 0x8000000000000000) != 0)
  {
    v2 = sub_209F67720();
    swift_allocError();
    v4 = v3;
    swift_bridgeObjectRetain();
    sub_209F676CC();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC6F8);
    sub_209F6730C();
    sub_209F67354();
    swift_bridgeObjectRelease();
    sub_209F67714();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v4, *MEMORY[0x24BEE26D8], v2);
    swift_willThrow();
  }
  return v1;
}

_QWORD *sub_209F5E030()
{
  void *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  v0 = (void *)sub_209F672A0();
  v1 = objc_msgSend(v0, sel_integerValue);

  if ((unint64_t)v1 > 0xFF)
  {
    v2 = sub_209F67720();
    swift_allocError();
    v4 = v3;
    swift_bridgeObjectRetain();
    sub_209F676CC();
    swift_bridgeObjectRelease();
    v6[0] = 0xD000000000000018;
    v6[1] = 0x8000000209F73830;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC6F0);
    sub_209F6730C();
    v1 = v6;
    sub_209F67354();
    swift_bridgeObjectRelease();
    sub_209F67714();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v4, *MEMORY[0x24BEE26D8], v2);
    swift_willThrow();
  }
  return v1;
}

unint64_t sub_209F5E170()
{
  void *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  v0 = (void *)sub_209F672A0();
  v1 = (unint64_t)objc_msgSend(v0, sel_integerValue);

  if (v1 >> 16)
  {
    v2 = sub_209F67720();
    swift_allocError();
    v4 = v3;
    swift_bridgeObjectRetain();
    sub_209F676CC();
    swift_bridgeObjectRelease();
    v6[0] = 0xD000000000000018;
    v6[1] = 0x8000000209F73830;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC6E8);
    sub_209F6730C();
    v1 = (unint64_t)v6;
    sub_209F67354();
    swift_bridgeObjectRelease();
    sub_209F67714();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v4, *MEMORY[0x24BEE26D8], v2);
    swift_willThrow();
  }
  return v1;
}

unint64_t sub_209F5E2B0()
{
  void *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  v0 = (void *)sub_209F672A0();
  v1 = (unint64_t)objc_msgSend(v0, sel_integerValue);

  if (HIDWORD(v1))
  {
    v2 = sub_209F67720();
    swift_allocError();
    v4 = v3;
    swift_bridgeObjectRetain();
    sub_209F676CC();
    swift_bridgeObjectRelease();
    v6[0] = 0xD000000000000018;
    v6[1] = 0x8000000209F73830;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC6E0);
    sub_209F6730C();
    v1 = (unint64_t)v6;
    sub_209F67354();
    swift_bridgeObjectRelease();
    sub_209F67714();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v4, *MEMORY[0x24BEE26D8], v2);
    swift_willThrow();
  }
  return v1;
}

unint64_t sub_209F5E3F0()
{
  void *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = (void *)sub_209F672A0();
  v1 = (unint64_t)objc_msgSend(v0, sel_integerValue);

  if ((v1 & 0x8000000000000000) != 0)
  {
    v2 = sub_209F67720();
    swift_allocError();
    v4 = v3;
    swift_bridgeObjectRetain();
    sub_209F676CC();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC6D8);
    sub_209F6730C();
    sub_209F67354();
    swift_bridgeObjectRelease();
    sub_209F67714();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v4, *MEMORY[0x24BEE26D8], v2);
    swift_willThrow();
  }
  return v1;
}

uint64_t sub_209F5E534@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  void *v30;
  char v31;
  uint64_t v32;
  char v33;
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  char *v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t v42;
  void (*v44)(char *, uint64_t);
  char v45;
  char *v46;
  char *v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[2];
  uint64_t AssociatedTypeWitness;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  id v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;

  v58 = a1;
  v59 = a2;
  v57 = a5;
  v56 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 8) + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v6);
  v52[1] = (char *)v52 - v8;
  v9 = *(_QWORD *)(a3 - 8);
  v11 = MEMORY[0x24BDAC7A8](v7, v10);
  v54 = (char *)v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11, v13);
  v55 = (char *)v52 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14, v16);
  v60 = (char *)v52 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17, v19);
  v22 = (char *)v52 - v21;
  v24 = MEMORY[0x24BDAC7A8](v20, v23);
  v26 = (char *)v52 - v25;
  MEMORY[0x24BDAC7A8](v24, v27);
  v29 = (char *)v52 - v28;
  v30 = (void *)sub_209F672A0();
  v61 = objc_msgSend(v30, sel_integerValue);

  sub_209F677C8();
  v31 = sub_209F6763C();
  v32 = sub_209F67630();
  if ((v31 & 1) != 0)
  {
    if (v32 > 64)
    {
      v62 = (unint64_t)v61;
      sub_209F63D60();
      sub_209F67618();
      v33 = sub_209F67288();
      v34 = *(void (**)(char *, uint64_t))(v9 + 8);
      v34(v26, a3);
      goto LABEL_9;
    }
LABEL_5:
    v35 = sub_209F67624();
    v34 = *(void (**)(char *, uint64_t))(v9 + 8);
    v34(v29, a3);
    v36 = v60;
    if ((uint64_t)v61 < v35)
      goto LABEL_27;
    goto LABEL_10;
  }
  if (v32 <= 63)
    goto LABEL_5;
  v37 = (unint64_t)v61;
  v62 = (unint64_t)v61;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v22, v29, a3);
  if ((v37 & 0x8000000000000000) != 0)
  {
    v44 = *(void (**)(char *, uint64_t))(v9 + 8);
    v44(v22, a3);
    v44(v29, a3);
    goto LABEL_27;
  }
  sub_209F63D60();
  sub_209F67618();
  v33 = sub_209F67288();
  v34 = *(void (**)(char *, uint64_t))(v9 + 8);
  v34(v26, a3);
  v34(v22, a3);
LABEL_9:
  v34(v29, a3);
  v36 = v60;
  if ((v33 & 1) != 0)
    goto LABEL_27;
LABEL_10:
  sub_209F677BC();
  if ((sub_209F6763C() & 1) != 0)
  {
    if (sub_209F67630() < 64)
      goto LABEL_19;
    goto LABEL_15;
  }
  v38 = sub_209F6763C();
  v39 = sub_209F67630();
  if ((v38 & 1) != 0)
  {
    if (v39 <= 64)
    {
      swift_getAssociatedConformanceWitness();
      sub_209F67A80();
      sub_209F67990();
      v45 = sub_209F67288();
      v34(v26, a3);
      v46 = v55;
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v55, v36, a3);
      if ((v45 & 1) != 0)
      {
        v34(v46, a3);
        v34(v36, a3);
        goto LABEL_27;
      }
      v42 = sub_209F67624();
      v34(v46, a3);
      goto LABEL_20;
    }
LABEL_15:
    v40 = (unint64_t)v61;
    v62 = (unint64_t)v61;
    sub_209F63D60();
    sub_209F67618();
    v41 = sub_209F67288();
    v34(v26, a3);
    v34(v36, a3);
    if ((v41 & 1) != 0)
      goto LABEL_27;
    goto LABEL_21;
  }
  if (v39 >= 64)
  {
    v47 = v54;
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v54, v36, a3);
    v62 = (unint64_t)v61;
    if ((uint64_t)v61 <= 0)
    {
      v34(v47, a3);
      v34(v36, a3);
      v40 = (unint64_t)v61;
      goto LABEL_21;
    }
    sub_209F63D60();
    sub_209F67618();
    v48 = sub_209F67288();
    v34(v26, a3);
    v34(v47, a3);
    v34(v36, a3);
    v40 = (unint64_t)v61;
    if ((v48 & 1) != 0)
      goto LABEL_27;
LABEL_21:
    v62 = v40;
    sub_209F63D60();
    return sub_209F67648();
  }
LABEL_19:
  v42 = sub_209F67624();
LABEL_20:
  v34(v36, a3);
  v40 = (unint64_t)v61;
  if (v42 >= (uint64_t)v61)
    goto LABEL_21;
LABEL_27:
  v49 = sub_209F67720();
  swift_allocError();
  v51 = v50;
  v62 = 0;
  v63 = 0xE000000000000000;
  swift_bridgeObjectRetain();
  sub_209F676CC();
  swift_bridgeObjectRelease();
  v62 = 0xD000000000000018;
  v63 = 0x8000000209F73830;
  v64 = v58;
  swift_getMetatypeMetadata();
  sub_209F6730C();
  sub_209F67354();
  swift_bridgeObjectRelease();
  sub_209F67714();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v49 - 8) + 104))(v51, *MEMORY[0x24BEE26D8], v49);
  return swift_willThrow();
}

uint64_t sub_209F5EC0C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, void *a3@<X3>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t result;
  _QWORD *v12;
  uint64_t v13;
  id v14;

  if (swift_dynamicCastMetatype())
  {
    result = sub_209F61610(a1, a3);
    if (!v5)
      return swift_dynamicCast();
  }
  else
  {
    _s6LiftUIO8_DecoderCMa();
    v12 = (_QWORD *)swift_allocObject();
    v13 = MEMORY[0x24BEE4AF8];
    v12[2] = MEMORY[0x24BEE4AF8];
    v14 = a3;
    v12[3] = sub_209F5A138(v13);
    v12[4] = v14;
    v12[2] = a1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v12[3] = a2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_209F5AEC0(a4, a5);
    return swift_release();
  }
  return result;
}

uint64_t sub_209F5ED58()
{
  uint64_t v0;

  return sub_209F60FFC(*(void **)(v0 + 16));
}

uint64_t sub_209F5ED60()
{
  uint64_t v0;

  return sub_209F613EC(*(_QWORD *)v0, *(void **)(v0 + 16)) & 1;
}

uint64_t sub_209F5ED80()
{
  uint64_t v0;

  return sub_209F61610(*(_QWORD *)v0, *(void **)(v0 + 16));
}

uint64_t sub_209F5ED9C()
{
  uint64_t v0;

  return sub_209F61804(*(_QWORD *)v0, *(void **)(v0 + 16));
}

void sub_209F5EDB8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  sub_209F61610(*(_QWORD *)v0, *(void **)(v0 + 16));
  if (!v1)
  {
    v2 = (void *)sub_209F672A0();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_floatValue);

  }
}

uint64_t sub_209F5EE28()
{
  uint64_t v0;

  return sub_209F61A2C(*(_QWORD *)v0, *(void **)(v0 + 16));
}

uint64_t sub_209F5EE44()
{
  uint64_t v0;

  return sub_209F61C54(*(_QWORD *)v0, *(void **)(v0 + 16));
}

uint64_t sub_209F5EE60()
{
  uint64_t v0;

  return sub_209F61E78(*(_QWORD *)v0, *(void **)(v0 + 16));
}

uint64_t sub_209F5EE7C()
{
  uint64_t v0;

  return sub_209F6209C(*(_QWORD *)v0, *(void **)(v0 + 16));
}

uint64_t sub_209F5EE98()
{
  uint64_t v0;

  return sub_209F622C0(*(_QWORD *)v0, *(void **)(v0 + 16));
}

uint64_t sub_209F5EEB4()
{
  return sub_209F679D8();
}

uint64_t sub_209F5EEC8()
{
  uint64_t v0;

  return sub_209F624E8(*(_QWORD *)v0, *(void **)(v0 + 16));
}

uint64_t sub_209F5EEE4()
{
  uint64_t v0;

  return sub_209F6270C(*(_QWORD *)v0, *(void **)(v0 + 16));
}

uint64_t sub_209F5EF00()
{
  uint64_t v0;

  return sub_209F62930(*(_QWORD *)v0, *(void **)(v0 + 16));
}

uint64_t sub_209F5EF1C()
{
  uint64_t v0;

  return sub_209F62B54(*(_QWORD *)v0, *(void **)(v0 + 16));
}

uint64_t sub_209F5EF38()
{
  uint64_t v0;

  return sub_209F62D78(*(_QWORD *)v0, *(void **)(v0 + 16));
}

uint64_t sub_209F5EF54()
{
  return sub_209F679E4();
}

uint64_t sub_209F5EF68@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_209F5EC0C(*(_QWORD *)v2, *(_QWORD *)(v2 + 8), *(void **)(v2 + 16), a1, a2);
}

uint64_t sub_209F5EF8C()
{
  sub_209F638D8();
  return sub_209F67B88();
}

uint64_t sub_209F5EFB4()
{
  sub_209F638D8();
  return sub_209F67B94();
}

uint64_t sub_209F5EFDC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char v3;
  void *v4;
  id v5;
  uint64_t v6;
  char v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  id v11;

  sub_209F63710(*(_QWORD *)v0, *(id *)(v0 + 16), *(_QWORD *)(v0 + 24));
  if (!v1)
  {
    v4 = v2;
    v5 = objc_msgSend(v2, sel_attributtes);
    v6 = sub_209F67258();

    if (*(_QWORD *)(v6 + 16) && (sub_209EE31C0(0x65756C6176, 0xE500000000000000), (v7 & 1) != 0))
    {

      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      v8 = objc_msgSend(v4, sel_children);
      type metadata accessor for RUIXMLElement(0);
      v9 = sub_209F67408();

      if (v9 >> 62)
      {
        swift_bridgeObjectRetain();
        v10 = sub_209F677EC();
        swift_bridgeObjectRelease();
      }
      else
      {
        v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (!v10)
      {
        v11 = objc_msgSend(v4, sel_stringValue);
        if (!v11)
        {

          v3 = 1;
          return v3 & 1;
        }

      }
    }
    v3 = 0;
  }
  return v3 & 1;
}

uint64_t sub_209F5F140(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t inited;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v4 = v2;
  sub_209F678D0();
  v7 = *(_QWORD *)(v2 + 24);
  sub_209F63710(*(_QWORD *)v4, *(id *)(v4 + 16), *(_QWORD *)(v4 + 24));
  if (v3)
    return swift_willThrow();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC720);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_209F7A4E0;
  v9 = sub_209F678F4();
  v11 = v10;
  *(_QWORD *)(inited + 56) = &_s6LiftUIO16UnkeyedContainerV3KeyVN;
  *(_QWORD *)(inited + 64) = sub_209F638D8();
  v12 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v12;
  *(_QWORD *)(v12 + 16) = v9;
  *(_QWORD *)(v12 + 24) = v11;
  *(_QWORD *)(v12 + 32) = v7;
  *(_BYTE *)(v12 + 40) = 0;
  swift_bridgeObjectRetain();
  sub_209F60AA4((_QWORD *)inited);
  v14 = _s6LiftUIO14KeyedContainerVMa(0, a1, a2, v13);
  swift_bridgeObjectRetain();
  MEMORY[0x20BD1DB1C](&unk_209F7BFC4, v14);
  result = sub_209F678DC();
  v16 = *(_QWORD *)(v4 + 24);
  v17 = __OFADD__(v16, 1);
  v18 = v16 + 1;
  if (v17)
    __break(1u);
  else
    *(_QWORD *)(v4 + 24) = v18;
  return result;
}

_QWORD *sub_209F5F2EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *result;
  uint64_t v10;
  uint64_t inited;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  ValueMetadata *v18;
  unint64_t v19;
  uint64_t v20;

  v3 = v1;
  v6 = *v3;
  v5 = v3[1];
  v7 = v3[3];
  sub_209F63710(*v3, (id)v3[2], v7);
  if (v2)
    return (_QWORD *)swift_willThrow();
  v10 = v8;
  v16 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC720);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_209F7A4E0;
  v12 = sub_209F678F4();
  v14 = v13;
  *(_QWORD *)(inited + 56) = &_s6LiftUIO16UnkeyedContainerV3KeyVN;
  *(_QWORD *)(inited + 64) = sub_209F638D8();
  v15 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v15;
  *(_QWORD *)(v15 + 16) = v12;
  *(_QWORD *)(v15 + 24) = v14;
  *(_QWORD *)(v15 + 32) = v7;
  *(_BYTE *)(v15 + 40) = 0;
  v20 = v6;
  swift_bridgeObjectRetain();
  sub_209F60AA4((_QWORD *)inited);
  v18 = &_s6LiftUIO16UnkeyedContainerVN;
  v19 = sub_209F60238();
  result = (_QWORD *)swift_allocObject();
  *(_QWORD *)&v17 = result;
  result[2] = v6;
  result[3] = v5;
  result[4] = v10;
  result[5] = 0;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
  }
  else
  {
    v3[3] = v7 + 1;
    sub_209F63940(&v17, v16);
    return (_QWORD *)swift_bridgeObjectRetain();
  }
  return result;
}

void sub_209F5F45C(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t inited;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;

  v5 = *a1;
  v4 = a1[1];
  v6 = a1[3];
  sub_209F63710(*a1, (id)a1[2], v6);
  if (!v2)
  {
    v8 = v7;
    v19 = _s6LiftUIO8_DecoderCMa();
    v9 = (_QWORD *)swift_allocObject();
    v10 = MEMORY[0x24BEE4AF8];
    v9[2] = MEMORY[0x24BEE4AF8];
    v18 = v8;
    v9[3] = sub_209F5A138(v10);
    v9[4] = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC720);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_209F7A4E0;
    v12 = sub_209F678F4();
    v17 = v4;
    v13 = a2;
    v15 = v14;
    *(_QWORD *)(inited + 56) = &_s6LiftUIO16UnkeyedContainerV3KeyVN;
    *(_QWORD *)(inited + 64) = sub_209F638D8();
    v16 = swift_allocObject();
    *(_QWORD *)(inited + 32) = v16;
    *(_QWORD *)(v16 + 16) = v12;
    *(_QWORD *)(v16 + 24) = v15;
    *(_QWORD *)(v16 + 32) = v6;
    *(_BYTE *)(v16 + 40) = 0;
    swift_bridgeObjectRetain();
    sub_209F60AA4((_QWORD *)inited);
    v9[2] = v5;
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v9[3] = v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v13[3] = v19;
    v13[4] = sub_209F5A508();

    *v13 = v9;
  }
}

void sub_209F5F604(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  id v13;
  uint64_t inited;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;

  v4 = v2;
  v7 = *v2;
  v24 = v2[1];
  v8 = v2[3];
  sub_209F63710(*v2, (id)v2[2], v8);
  if (!v3)
  {
    v10 = v9;
    _s6LiftUIO8_DecoderCMa();
    v22 = a1;
    v11 = (_QWORD *)swift_allocObject();
    v12 = MEMORY[0x24BEE4AF8];
    v11[2] = MEMORY[0x24BEE4AF8];
    v13 = v10;
    v11[3] = sub_209F5A138(v12);
    v23 = v13;
    v11[4] = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC720);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_209F7A4E0;
    v15 = sub_209F678F4();
    v17 = v16;
    *(_QWORD *)(inited + 56) = &_s6LiftUIO16UnkeyedContainerV3KeyVN;
    *(_QWORD *)(inited + 64) = sub_209F638D8();
    v18 = swift_allocObject();
    *(_QWORD *)(inited + 32) = v18;
    *(_QWORD *)(v18 + 16) = v15;
    *(_QWORD *)(v18 + 24) = v17;
    *(_QWORD *)(v18 + 32) = v8;
    *(_BYTE *)(v18 + 40) = 0;
    swift_bridgeObjectRetain();
    sub_209F60AA4((_QWORD *)inited);
    v11[2] = v7;
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v11[3] = v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_209F5AEC0(v22, a2);
    v19 = v4[3];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
    {
      __break(1u);
    }
    else
    {
      v4[3] = v21;

      swift_release();
    }
  }
}

uint64_t sub_209F5F7FC()
{
  uint64_t v0;

  return sub_209F635D8(*(void **)(v0 + 16));
}

BOOL sub_209F5F818()
{
  uint64_t v0;

  return sub_209F6366C(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_209F5F820()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t sub_209F5F828()
{
  return sub_209F5EFDC() & 1;
}

void sub_209F5F840()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(v0 + 24);
  sub_209F63958(*(_QWORD *)v0, *(void **)(v0 + 16), v2);
  if (v1)
  {
    swift_willThrow();
  }
  else
  {
    v3 = (void *)sub_209F672A0();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_BOOLValue);

    if (__OFADD__(v2, 1))
      __break(1u);
    else
      *(_QWORD *)(v0 + 24) = v2 + 1;
  }
}

_QWORD *sub_209F5F8CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *result;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 24);
  result = sub_209F63958(*(_QWORD *)v0, *(void **)(v0 + 16), v2);
  v4 = result;
  if (v1)
  {
    swift_willThrow();
    return v4;
  }
  if (!__OFADD__(v2, 1))
  {
    *(_QWORD *)(v0 + 24) = v2 + 1;
    return v4;
  }
  __break(1u);
  return result;
}

void sub_209F5F928()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(v0 + 24);
  sub_209F63958(*(_QWORD *)v0, *(void **)(v0 + 16), v2);
  if (v1)
  {
    swift_willThrow();
  }
  else
  {
    v3 = (void *)sub_209F672A0();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_doubleValue);

    if (__OFADD__(v2, 1))
      __break(1u);
    else
      *(_QWORD *)(v0 + 24) = v2 + 1;
  }
}

void sub_209F5F9BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(v0 + 24);
  sub_209F63958(*(_QWORD *)v0, *(void **)(v0 + 16), v2);
  if (v1)
  {
    swift_willThrow();
  }
  else
  {
    v3 = (void *)sub_209F672A0();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_floatValue);

    if (__OFADD__(v2, 1))
      __break(1u);
    else
      *(_QWORD *)(v0 + 24) = v2 + 1;
  }
}

uint64_t sub_209F5FA50(uint64_t a1, uint64_t a2)
{
  return sub_209F5FAC0(a1, a2, (uint64_t (*)(_QWORD *))sub_209F5DAF4);
}

uint64_t sub_209F5FA6C(uint64_t a1, uint64_t a2)
{
  return sub_209F5FB8C(a1, a2, (uint64_t (*)(_QWORD *))sub_209F5DB2C);
}

uint64_t sub_209F5FA88(uint64_t a1, uint64_t a2)
{
  return sub_209F5FB8C(a1, a2, (uint64_t (*)(_QWORD *))sub_209F5DC6C);
}

uint64_t sub_209F5FAA4(uint64_t a1, uint64_t a2)
{
  return sub_209F5FB8C(a1, a2, (uint64_t (*)(_QWORD *))sub_209F5DDAC);
}

uint64_t sub_209F5FAC0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD *))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  _QWORD *v7;
  uint64_t result;

  v6 = *(_QWORD *)(v3 + 24);
  v7 = sub_209F63958(*(_QWORD *)v3, *(void **)(v3 + 16), v6);
  if (v4)
  {
    swift_willThrow();
    return (uint64_t)a3;
  }
  a3 = (uint64_t (*)(_QWORD *))a3(v7);
  result = swift_bridgeObjectRelease();
  if (!__OFADD__(v6, 1))
  {
    *(_QWORD *)(v3 + 24) = v6 + 1;
    return (uint64_t)a3;
  }
  __break(1u);
  return result;
}

uint64_t sub_209F5FB40()
{
  return sub_209F67978();
}

uint64_t sub_209F5FB54(uint64_t a1, uint64_t a2)
{
  return sub_209F5FB8C(a1, a2, (uint64_t (*)(_QWORD *))sub_209F5DEEC);
}

uint64_t sub_209F5FB70(uint64_t a1, uint64_t a2)
{
  return sub_209F5FB8C(a1, a2, (uint64_t (*)(_QWORD *))sub_209F5E030);
}

uint64_t sub_209F5FB8C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD *))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  _QWORD *v7;
  uint64_t result;

  v6 = *(_QWORD *)(v3 + 24);
  v7 = sub_209F63958(*(_QWORD *)v3, *(void **)(v3 + 16), v6);
  if (v4)
  {
    swift_willThrow();
    return (uint64_t)a3;
  }
  a3 = (uint64_t (*)(_QWORD *))a3(v7);
  result = swift_bridgeObjectRelease();
  if (!__OFADD__(v6, 1))
  {
    *(_QWORD *)(v3 + 24) = v6 + 1;
    return (uint64_t)a3;
  }
  __break(1u);
  return result;
}

uint64_t sub_209F5FC24(uint64_t a1, uint64_t a2)
{
  return sub_209F5FB8C(a1, a2, (uint64_t (*)(_QWORD *))sub_209F5E170);
}

uint64_t sub_209F5FC40(uint64_t a1, uint64_t a2)
{
  return sub_209F5FB8C(a1, a2, (uint64_t (*)(_QWORD *))sub_209F5E2B0);
}

uint64_t sub_209F5FC5C(uint64_t a1, uint64_t a2)
{
  return sub_209F5FB8C(a1, a2, (uint64_t (*)(_QWORD *))sub_209F5E3F0);
}

uint64_t sub_209F5FC78()
{
  return sub_209F67984();
}

void sub_209F5FC8C(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  sub_209F5F604(a1, a2);
}

uint64_t sub_209F5FCA0()
{
  return sub_209F67924();
}

uint64_t sub_209F5FCB4()
{
  return sub_209F67918();
}

uint64_t sub_209F5FCC8()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_209F67930();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_209F5FCE8(uint64_t a1, uint64_t a2)
{
  return sub_209F5FE78(a1, a2, MEMORY[0x24BEE3690]);
}

uint64_t sub_209F5FD04()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_209F6793C();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_209F5FD24(uint64_t a1, uint64_t a2)
{
  return sub_209F5FDF0(a1, a2, MEMORY[0x24BEE36B0]);
}

uint64_t sub_209F5FD40(uint64_t a1, uint64_t a2)
{
  return sub_209F5FE34(a1, a2, MEMORY[0x24BEE36B8]);
}

uint64_t sub_209F5FD5C(uint64_t a1, uint64_t a2)
{
  return sub_209F5FE78(a1, a2, MEMORY[0x24BEE36C0]);
}

uint64_t sub_209F5FD78()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_209F67960();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_209F5FD98(uint64_t a1, uint64_t a2)
{
  return sub_209F5FEE4(a1, a2, MEMORY[0x24BEE36D8]);
}

uint64_t sub_209F5FDB4()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_209F67948();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_209F5FDD4(uint64_t a1, uint64_t a2)
{
  return sub_209F5FDF0(a1, a2, MEMORY[0x24BEE36D0]);
}

uint64_t sub_209F5FDF0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 0x1FF;
}

uint64_t sub_209F5FE18(uint64_t a1, uint64_t a2)
{
  return sub_209F5FE34(a1, a2, MEMORY[0x24BEE36E0]);
}

uint64_t sub_209F5FE34(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 0x1FFFF;
}

uint64_t sub_209F5FE5C(uint64_t a1, uint64_t a2)
{
  return sub_209F5FE78(a1, a2, MEMORY[0x24BEE36E8]);
}

uint64_t sub_209F5FE78(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  unint64_t v3;

  v3 = a3();
  return v3 | ((HIDWORD(v3) & 1) << 32);
}

uint64_t sub_209F5FEA8()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_209F6796C();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_209F5FEC8(uint64_t a1, uint64_t a2)
{
  return sub_209F5FEE4(a1, a2, MEMORY[0x24BEE36F8]);
}

uint64_t sub_209F5FEE4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  result = a3();
  if (v3)
    return v5;
  return result;
}

uint64_t sub_209F5FF08()
{
  return sub_209F67954();
}

uint64_t sub_209F5FF30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_209F5F140(a2, a3);
}

_QWORD *sub_209F5FF4C@<X0>(uint64_t a1@<X8>)
{
  return sub_209F5F2EC(a1);
}

void sub_209F5FF60(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;

  sub_209F5F45C(v1, a1);
  if (v2)
  {
    swift_willThrow();
  }
  else
  {
    v3 = v1[3];
    v4 = __OFADD__(v3, 1);
    v5 = v3 + 1;
    if (v4)
      __break(1u);
    else
      v1[3] = v5;
  }
}

uint64_t SingleValueDecodingContainer.ruiXMLElement.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  _QWORD v10[4];

  MEMORY[0x24BDAC7A8](a1, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v2 = v10[3];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = sub_209F67720();
    swift_allocError();
    v8 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC328);
    *v8 = type metadata accessor for RUIXMLElement(0);
    sub_209F679B4();
    sub_209F67714();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *MEMORY[0x24BEE26E0], v6);
    swift_willThrow();
  }
  return v2;
}

unint64_t sub_209F60104()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2545BBA40;
  if (!qword_2545BBA40)
  {
    v1 = type metadata accessor for RUI.LiftUI.XMLDecoder();
    result = MEMORY[0x20BD1DB1C](&protocol conformance descriptor for RUI.LiftUI.XMLDecoder, v1);
    atomic_store(result, (unint64_t *)&qword_2545BBA40);
  }
  return result;
}

uint64_t type metadata accessor for RUI.LiftUI.XMLDecoder()
{
  return objc_opt_self();
}

uint64_t sub_209F60168(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x20BD1DB1C](MEMORY[0x24BEE12C8]);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

ValueMetadata *type metadata accessor for RUI.LiftUI()
{
  return &type metadata for RUI.LiftUI;
}

uint64_t method lookup function for RUI.LiftUI.XMLDecoder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RUI.LiftUI.XMLDecoder.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

ValueMetadata *_s6LiftUIO20SingleValueContainerVMa()
{
  return &_s6LiftUIO20SingleValueContainerVN;
}

unint64_t sub_209F601F4()
{
  unint64_t result;

  result = qword_2545C6350;
  if (!qword_2545C6350)
  {
    result = MEMORY[0x20BD1DB1C](&unk_209F7BDB8, &_s6LiftUIO20SingleValueContainerVN);
    atomic_store(result, (unint64_t *)&qword_2545C6350);
  }
  return result;
}

unint64_t sub_209F60238()
{
  unint64_t result;

  result = qword_2545C6358[0];
  if (!qword_2545C6358[0])
  {
    result = MEMORY[0x20BD1DB1C](&unk_209F7C144, &_s6LiftUIO16UnkeyedContainerVN);
    atomic_store(result, qword_2545C6358);
  }
  return result;
}

uint64_t sub_209F6027C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_209F602B0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_209EE31C0(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_209F42EAC();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 16 * v6);
  sub_209F60394(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_209F60394(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
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
    result = sub_209F67678();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_209F67B10();
        swift_bridgeObjectRetain();
        sub_209F6733C();
        v9 = sub_209F67B28();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_OWORD *)(v14 + 16 * v3);
          v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
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

uint64_t sub_209F60568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_209EE31C0(a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_209F42EAC();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (_QWORD *)(v20[7] + 16 * v14);
      result = swift_bridgeObjectRelease();
      *v21 = a1;
      v21[1] = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (_QWORD *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_209F42B88(v17, a5 & 1);
  v23 = sub_209EE31C0(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_209F67AA4();
  __break(1u);
  return result;
}

uint64_t sub_209F606DC(uint64_t result)
{
  char **v1;
  int64_t v2;
  uint64_t v3;
  char *v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int64_t v23;
  char *v24;
  unint64_t v25;
  unint64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  int64_t v30;
  uint64_t *v31;
  int64_t v32;
  unint64_t v33;
  int64_t v34;
  int64_t v35;
  int64_t v36;
  uint64_t v37;
  _QWORD v38[2];
  uint64_t v39;
  int64_t v40;
  unint64_t v41;

  v3 = *(_QWORD *)(result + 16);
  v4 = *v1;
  v5 = *((_QWORD *)*v1 + 2);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v7 = result;
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v9 = *((_QWORD *)v4 + 3) >> 1, v9 < v6))
  {
    if (v5 <= v6)
      v10 = v5 + v3;
    else
      v10 = v5;
    v4 = sub_209F4314C(isUniquelyReferenced_nonNull_native, v10, 1, v4);
    v9 = *((_QWORD *)v4 + 3) >> 1;
  }
  v11 = *((_QWORD *)v4 + 2);
  v12 = v9 - v11;
  result = sub_209F60DB8((uint64_t)v38, &v4[16 * v11 + 32], v9 - v11, v7);
  if (result < v3)
    goto LABEL_15;
  if (result)
  {
    v14 = *((_QWORD *)v4 + 2);
    v15 = __OFADD__(v14, result);
    v16 = v14 + result;
    if (v15)
    {
      __break(1u);
      goto LABEL_48;
    }
    *((_QWORD *)v4 + 2) = v16;
  }
  if (result != v12)
  {
LABEL_13:
    result = sub_209EE3520();
    *v1 = v4;
    return result;
  }
LABEL_16:
  v2 = *((_QWORD *)v4 + 2);
  v3 = v38[0];
  v37 = v38[1];
  v13 = v39;
  v6 = v40;
  if (v41)
  {
    v17 = (v41 - 1) & v41;
    v18 = __clz(__rbit64(v41)) | (v40 << 6);
    v36 = (unint64_t)(v39 + 64) >> 6;
    goto LABEL_18;
  }
LABEL_48:
  v32 = v6 + 1;
  if (__OFADD__(v6, 1))
    goto LABEL_66;
  v36 = (unint64_t)(v13 + 64) >> 6;
  if (v32 >= v36)
    goto LABEL_13;
  v33 = *(_QWORD *)(v37 + 8 * v32);
  v34 = v6 + 1;
  if (!v33)
  {
    v34 = v6 + 2;
    if (v6 + 2 >= v36)
      goto LABEL_13;
    v33 = *(_QWORD *)(v37 + 8 * v34);
    if (!v33)
    {
      v34 = v6 + 3;
      if (v6 + 3 >= v36)
        goto LABEL_13;
      v33 = *(_QWORD *)(v37 + 8 * v34);
      if (!v33)
      {
        v34 = v6 + 4;
        if (v6 + 4 >= v36)
          goto LABEL_13;
        v33 = *(_QWORD *)(v37 + 8 * v34);
        if (!v33)
        {
          v34 = v6 + 5;
          if (v6 + 5 >= v36)
            goto LABEL_13;
          v33 = *(_QWORD *)(v37 + 8 * v34);
          if (!v33)
          {
            v35 = v6 + 6;
            do
            {
              if (v36 == v35)
                goto LABEL_13;
              v33 = *(_QWORD *)(v37 + 8 * v35++);
            }
            while (!v33);
            v34 = v35 - 1;
          }
        }
      }
    }
  }
  v17 = (v33 - 1) & v33;
  v18 = __clz(__rbit64(v33)) + (v34 << 6);
  v6 = v34;
LABEL_18:
  v19 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v18);
  v21 = *v19;
  v20 = v19[1];
  result = swift_bridgeObjectRetain();
  while (1)
  {
    v22 = *((_QWORD *)v4 + 3);
    v23 = v22 >> 1;
    if ((uint64_t)(v22 >> 1) < v2 + 1)
      break;
    if (v2 < v23)
      goto LABEL_23;
LABEL_20:
    *((_QWORD *)v4 + 2) = v2;
  }
  result = (uint64_t)sub_209F4314C((char *)(v22 > 1), v2 + 1, 1, v4);
  v4 = (char *)result;
  v23 = *(_QWORD *)(result + 24) >> 1;
  if (v2 >= v23)
    goto LABEL_20;
  while (1)
  {
LABEL_23:
    v24 = &v4[16 * v2 + 32];
    *(_QWORD *)v24 = v21;
    *((_QWORD *)v24 + 1) = v20;
    ++v2;
    if (v17)
    {
      v25 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v26 = v25 | (v6 << 6);
      goto LABEL_41;
    }
    v27 = v6 + 1;
    if (__OFADD__(v6, 1))
      break;
    if (v27 >= v36)
      goto LABEL_45;
    v28 = *(_QWORD *)(v37 + 8 * v27);
    v29 = v6 + 1;
    if (!v28)
    {
      v29 = v6 + 2;
      if (v6 + 2 >= v36)
        goto LABEL_45;
      v28 = *(_QWORD *)(v37 + 8 * v29);
      if (!v28)
      {
        v29 = v6 + 3;
        if (v6 + 3 >= v36)
          goto LABEL_45;
        v28 = *(_QWORD *)(v37 + 8 * v29);
        if (!v28)
        {
          v29 = v6 + 4;
          if (v6 + 4 >= v36)
            goto LABEL_45;
          v28 = *(_QWORD *)(v37 + 8 * v29);
          if (!v28)
          {
            v29 = v6 + 5;
            if (v6 + 5 >= v36)
              goto LABEL_45;
            v28 = *(_QWORD *)(v37 + 8 * v29);
            if (!v28)
            {
              v30 = v6 + 6;
              while (v36 != v30)
              {
                v28 = *(_QWORD *)(v37 + 8 * v30++);
                if (v28)
                {
                  v29 = v30 - 1;
                  goto LABEL_40;
                }
              }
LABEL_45:
              *((_QWORD *)v4 + 2) = v2;
              goto LABEL_13;
            }
          }
        }
      }
    }
LABEL_40:
    v17 = (v28 - 1) & v28;
    v26 = __clz(__rbit64(v28)) + (v29 << 6);
    v6 = v29;
LABEL_41:
    v31 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v26);
    v21 = *v31;
    v20 = v31[1];
    if (v2 >= v23)
    {
      result = swift_bridgeObjectRetain();
      goto LABEL_20;
    }
    result = swift_bridgeObjectRetain();
  }
  __break(1u);
LABEL_66:
  __break(1u);
  return result;
}

_QWORD *sub_209F60AA4(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int64_t v10;

  v2 = result[2];
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= v3[3] >> 1)
  {
    if (v6[2])
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v10 = v4 + v2;
  else
    v10 = v4;
  result = sub_209F60BA0(result, v10, 1, v3);
  v3 = result;
  if (!v6[2])
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  if ((v3[3] >> 1) - v3[2] < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC728);
  result = (_QWORD *)swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    result = (_QWORD *)swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v7 = v3[2];
  v8 = __OFADD__(v7, v2);
  v9 = v7 + v2;
  if (!v8)
  {
    v3[2] = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

_QWORD *sub_209F60BA0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC720);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC728);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *sub_209F60CD4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545BB780);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_209F60DB8((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_209EE3520();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_209F60DB8(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
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

uint64_t sub_209F60FB4()
{
  unint64_t v0;

  v0 = sub_209F67840();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t sub_209F60FFC(void *a1)
{
  id v2;
  uint64_t v3;
  char v4;
  char v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  id v9;

  v2 = objc_msgSend(a1, sel_attributtes);
  v3 = sub_209F67258();

  if (*(_QWORD *)(v3 + 16))
  {
    sub_209EE31C0(0x65756C6176, 0xE500000000000000);
    v5 = v4;
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v6 = objc_msgSend(a1, sel_children);
  type metadata accessor for RUIXMLElement(0);
  v7 = sub_209F67408();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = sub_209F677EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v8)
    return 0;
  v9 = objc_msgSend(a1, sel_stringValue);
  if (v9)
  {

    return 0;
  }
  return 1;
}

uint64_t sub_209F6113C(int a1, id a2)
{
  id v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  id v15;
  id v16;

  v3 = objc_msgSend(a2, sel_attributtes);
  v4 = sub_209F67258();

  if (*(_QWORD *)(v4 + 16) && (sub_209EE31C0(1701869940, 0xE400000000000000), (v5 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v6 = sub_209F60FB4();
  }
  else
  {
    swift_bridgeObjectRelease();
    v6 = 4;
  }
  v7 = objc_msgSend(a2, sel_attributtes);
  v8 = MEMORY[0x24BEE0D00];
  v9 = sub_209F67258();

  if (*(_QWORD *)(v9 + 16) && (sub_209EE31C0(0x65756C6176, 0xE500000000000000), (v10 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v11 = objc_msgSend(a2, sel_stringValue);
    if (v11)
    {
      v12 = v11;
      sub_209F672C4();

    }
    else
    {
      v6 = sub_209F67720();
      swift_allocError();
      v14 = v13;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC328);
      *v14 = v8;
      swift_bridgeObjectRetain();
      sub_209F676CC();
      swift_bridgeObjectRelease();
      v15 = a2;
      v16 = objc_msgSend(v15, sel_description, 0xD00000000000001DLL, 0x8000000209F737E0);
      sub_209F672C4();

      sub_209F67354();
      swift_bridgeObjectRelease();
      sub_209F67714();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v14, *MEMORY[0x24BEE26E0], v6);
      swift_willThrow();
    }
  }
  return v6;
}

uint64_t sub_209F613EC(int a1, void *a2)
{
  char v2;
  uint64_t v3;
  char v4;

  v4 = sub_209F6113C(a1, a2);
  if (!v3)
    __asm { BR              X10 }
  return v2 & 1;
}

uint64_t sub_209F61610(int a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v4 = sub_209F6113C(a1, a2);
  if (!v3)
    __asm { BR              X10 }
  return v2;
}

void sub_209F616A0()
{
  char v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v0 = sub_209F679A8();
  swift_bridgeObjectRelease();
  if ((v0 & 1) == 0)
  {
    v1 = sub_209F67720();
    swift_allocError();
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC328);
    *v3 = MEMORY[0x24BEE0D00];
    swift_bridgeObjectRetain();
    sub_209F676CC();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC6D0);
    sub_209F6730C();
    swift_bridgeObjectRelease();
    sub_209F67354();
    swift_bridgeObjectRelease();
    sub_209F67714();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v1 - 8) + 104))(v3, *MEMORY[0x24BEE26D0], v1);
    swift_willThrow();
  }
  JUMPOUT(0x209F61640);
}

void sub_209F617F8()
{
  swift_bridgeObjectRelease();
  JUMPOUT(0x209F61640);
}

uint64_t sub_209F61804(int a1, void *a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_209F6113C(a1, a2);
  if (!v2)
    __asm { BR              X10 }
  return result;
}

uint64_t sub_209F61A2C(int a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v4 = sub_209F6113C(a1, a2);
  if (!v3)
    __asm { BR              X10 }
  return v2;
}

uint64_t sub_209F61C54(int a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v4 = sub_209F6113C(a1, a2);
  if (!v3)
    __asm { BR              X10 }
  return v2;
}

uint64_t sub_209F61E78(int a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v4 = sub_209F6113C(a1, a2);
  if (!v3)
    __asm { BR              X10 }
  return v2;
}

uint64_t sub_209F6209C(int a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v4 = sub_209F6113C(a1, a2);
  if (!v3)
    __asm { BR              X10 }
  return v2;
}

uint64_t sub_209F622C0(int a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v4 = sub_209F6113C(a1, a2);
  if (!v3)
    __asm { BR              X10 }
  return v2;
}

uint64_t sub_209F624E8(int a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v4 = sub_209F6113C(a1, a2);
  if (!v3)
    __asm { BR              X10 }
  return v2;
}

uint64_t sub_209F6270C(int a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v4 = sub_209F6113C(a1, a2);
  if (!v3)
    __asm { BR              X10 }
  return v2;
}

uint64_t sub_209F62930(int a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v4 = sub_209F6113C(a1, a2);
  if (!v3)
    __asm { BR              X10 }
  return v2;
}

uint64_t sub_209F62B54(int a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v4 = sub_209F6113C(a1, a2);
  if (!v3)
    __asm { BR              X10 }
  return v2;
}

uint64_t sub_209F62D78(int a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v4 = sub_209F6113C(a1, a2);
  if (!v3)
    __asm { BR              X10 }
  return v2;
}

uint64_t _s6LiftUIO14KeyedContainerVMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&_s6LiftUIO14KeyedContainerVMn);
}

uint64_t sub_209F62FA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC718);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_209F62FF0()
{
  return swift_allocateGenericValueMetadata();
}

_QWORD *_s6LiftUIO20SingleValueContainerVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v5 = v4;
  return a1;
}

_QWORD *_s6LiftUIO20SingleValueContainerVwca_0(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a2[2];
  v5 = (void *)a1[2];
  a1[2] = v4;
  v6 = v4;

  return a1;
}

uint64_t _s6LiftUIO20SingleValueContainerVwta_0(uint64_t a1, uint64_t a2)
{
  void *v4;

  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  return a1;
}

uint64_t _s6LiftUIO20SingleValueContainerVwet_0(uint64_t *a1, int a2)
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

uint64_t sub_209F63144(uint64_t result, int a2, int a3)
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

uint64_t sub_209F63188(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s6LiftUIO11TypedStringVwca(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6LiftUIO11TypedStringVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6LiftUIO11TypedStringVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s6LiftUIO11TypedStringVwst(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s6LiftUIO11TypedStringVMa()
{
  return &_s6LiftUIO11TypedStringVN;
}

uint64_t _s6LiftUIO11TypedStringV9ValueTypeOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_209F63320 + 4 * byte_209F7BC3E[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_209F63354 + 4 * byte_209F7BC39[v4]))();
}

uint64_t sub_209F63354(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_209F6335C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x209F63364);
  return result;
}

uint64_t sub_209F63370(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x209F63378);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_209F6337C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_209F63384(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s6LiftUIO11TypedStringV9ValueTypeOMa()
{
  return &_s6LiftUIO11TypedStringV9ValueTypeON;
}

void _s6LiftUIO20SingleValueContainerVwxx_0(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

_QWORD *_s6LiftUIO16UnkeyedContainerVwcp(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v5 = (void *)a2[2];
  v4 = a2[3];
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = v5;
  return a1;
}

_QWORD *_s6LiftUIO16UnkeyedContainerVwca(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a2[2];
  v5 = (void *)a1[2];
  a1[2] = v4;
  v6 = v4;

  a1[3] = a2[3];
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

uint64_t _s6LiftUIO16UnkeyedContainerVwta(uint64_t a1, uint64_t a2)
{
  void *v4;

  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t _s6LiftUIO16UnkeyedContainerVwet(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s6LiftUIO16UnkeyedContainerVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s6LiftUIO16UnkeyedContainerVMa()
{
  return &_s6LiftUIO16UnkeyedContainerVN;
}

unint64_t sub_209F6358C()
{
  unint64_t result;

  result = qword_2545C6460[0];
  if (!qword_2545C6460[0])
  {
    result = MEMORY[0x20BD1DB1C](&unk_209F7BF9C, &_s6LiftUIO11TypedStringV9ValueTypeON);
    atomic_store(result, qword_2545C6460);
  }
  return result;
}

uint64_t sub_209F635D0(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 24);
}

uint64_t sub_209F635D8(void *a1)
{
  id v1;
  unint64_t v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_children);
  type metadata accessor for RUIXMLElement(0);
  v2 = sub_209F67408();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_209F677EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v3;
}

BOOL sub_209F6366C(void *a1, uint64_t a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;

  v3 = objc_msgSend(a1, sel_children);
  type metadata accessor for RUIXMLElement(0);
  v4 = sub_209F67408();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_209F677EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v5 <= a2;
}

void sub_209F63710(int a1, id a2, uint64_t a3)
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = objc_msgSend(a2, sel_children);
  type metadata accessor for RUIXMLElement(0);
  v6 = sub_209F67408();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_209F677EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v7 <= a3)
  {
    v11 = sub_209F67720();
    swift_allocError();
    v13 = v12;
    swift_bridgeObjectRetain();
    sub_209F67714();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v13, *MEMORY[0x24BEE26D8], v11);
    swift_willThrow();
  }
  else
  {
    v8 = objc_msgSend(a2, sel_children);
    v9 = sub_209F67408();

    if ((v9 & 0xC000000000000001) != 0)
    {
      MEMORY[0x20BD1CAB4](a3, v9);
      goto LABEL_8;
    }
    if (a3 < 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a3)
    {
      v10 = *(id *)(v9 + 8 * a3 + 32);
LABEL_8:
      swift_bridgeObjectRelease();
      return;
    }
    __break(1u);
  }
}

unint64_t sub_209F638D8()
{
  unint64_t result;

  result = qword_2545C6670[0];
  if (!qword_2545C6670[0])
  {
    result = MEMORY[0x20BD1DB1C](&unk_209F7C308, &_s6LiftUIO16UnkeyedContainerV3KeyVN);
    atomic_store(result, qword_2545C6670);
  }
  return result;
}

uint64_t sub_209F6391C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_209F63940(__int128 *a1, uint64_t a2)
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

_QWORD *sub_209F63958(int a1, void *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  void *v6;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  id v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  id v19;
  id v20;
  _QWORD v21[4];

  sub_209F63710(a1, a2, a3);
  if (!v4)
  {
    v8 = v6;
    v9 = objc_msgSend(v6, sel_attributtes);
    v10 = MEMORY[0x24BEE0D00];
    v11 = sub_209F67258();

    if (*(_QWORD *)(v11 + 16) && (v12 = sub_209EE31C0(0x65756C6176, 0xE500000000000000), (v13 & 1) != 0))
    {
      v3 = *(_QWORD **)(*(_QWORD *)(v11 + 56) + 16 * v12);
      swift_bridgeObjectRetain();

      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      v14 = objc_msgSend(v8, sel_stringValue);
      if (v14)
      {
        v15 = v14;
        v3 = (_QWORD *)sub_209F672C4();

      }
      else
      {
        v16 = sub_209F67720();
        swift_allocError();
        v18 = v17;
        v21[3] = (char *)v17 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2545BC328) + 48);
        *v18 = v10;
        swift_bridgeObjectRetain();
        sub_209F676CC();
        swift_bridgeObjectRelease();
        v19 = a2;
        v20 = objc_msgSend(v19, sel_description, 0xD00000000000001DLL, 0x8000000209F737E0);
        sub_209F672C4();

        v3 = v21;
        sub_209F67354();

        swift_bridgeObjectRelease();
        sub_209F67714();
        (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v18, *MEMORY[0x24BEE26E0], v16);
        swift_willThrow();

      }
    }
  }
  return v3;
}

uint64_t sub_209F63B90(id *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;

  v1 = objc_msgSend(*a1, sel_name);
  v2 = sub_209F672C4();
  v4 = v3;

  if (v2 == sub_209F67B64() && v4 == v5)
    v7 = 1;
  else
    v7 = sub_209F679A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_209F63C54(id *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;

  v1 = objc_msgSend(*a1, sel_name);
  v2 = sub_209F672C4();
  v4 = v3;

  if (v2 == sub_209F67B64() && v4 == v5)
    v7 = 1;
  else
    v7 = sub_209F679A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

unint64_t sub_209F63D1C()
{
  unint64_t result;

  result = qword_2545BC738;
  if (!qword_2545BC738)
  {
    result = MEMORY[0x20BD1DB1C](MEMORY[0x24BEE45A8], MEMORY[0x24BEE4568]);
    atomic_store(result, (unint64_t *)&qword_2545BC738);
  }
  return result;
}

unint64_t sub_209F63D60()
{
  unint64_t result;

  result = qword_2545BC740;
  if (!qword_2545BC740)
  {
    result = MEMORY[0x20BD1DB1C](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_2545BC740);
  }
  return result;
}

unint64_t sub_209F63DA4()
{
  unint64_t result;

  result = qword_2545BC748;
  if (!qword_2545BC748)
  {
    result = MEMORY[0x20BD1DB1C](MEMORY[0x24BEE4540], MEMORY[0x24BEE44F0]);
    atomic_store(result, (unint64_t *)&qword_2545BC748);
  }
  return result;
}

unint64_t sub_209F63DE8()
{
  unint64_t result;

  result = qword_2545BC750;
  if (!qword_2545BC750)
  {
    result = MEMORY[0x20BD1DB1C](MEMORY[0x24BEE44C0], MEMORY[0x24BEE4478]);
    atomic_store(result, (unint64_t *)&qword_2545BC750);
  }
  return result;
}

unint64_t sub_209F63E2C()
{
  unint64_t result;

  result = qword_2545BC758;
  if (!qword_2545BC758)
  {
    result = MEMORY[0x20BD1DB1C](MEMORY[0x24BEE42A0], MEMORY[0x24BEE4260]);
    atomic_store(result, (unint64_t *)&qword_2545BC758);
  }
  return result;
}

unint64_t sub_209F63E70()
{
  unint64_t result;

  result = qword_2545BC760;
  if (!qword_2545BC760)
  {
    result = MEMORY[0x20BD1DB1C](MEMORY[0x24BEE1EC8], MEMORY[0x24BEE1E88]);
    atomic_store(result, (unint64_t *)&qword_2545BC760);
  }
  return result;
}

unint64_t sub_209F63EB4()
{
  unint64_t result;

  result = qword_2545BC768;
  if (!qword_2545BC768)
  {
    result = MEMORY[0x20BD1DB1C](MEMORY[0x24BEE4048], MEMORY[0x24BEE4008]);
    atomic_store(result, (unint64_t *)&qword_2545BC768);
  }
  return result;
}

unint64_t sub_209F63EF8()
{
  unint64_t result;

  result = qword_2545BC770;
  if (!qword_2545BC770)
  {
    result = MEMORY[0x20BD1DB1C](MEMORY[0x24BEE3FD8], MEMORY[0x24BEE3F88]);
    atomic_store(result, (unint64_t *)&qword_2545BC770);
  }
  return result;
}

unint64_t sub_209F63F3C()
{
  unint64_t result;

  result = qword_2545BC778;
  if (!qword_2545BC778)
  {
    result = MEMORY[0x20BD1DB1C](MEMORY[0x24BEE3F60], MEMORY[0x24BEE3F30]);
    atomic_store(result, (unint64_t *)&qword_2545BC778);
  }
  return result;
}

unint64_t sub_209F63F80()
{
  unint64_t result;

  result = qword_2545BC780;
  if (!qword_2545BC780)
  {
    result = MEMORY[0x20BD1DB1C](MEMORY[0x24BEE3E80], MEMORY[0x24BEE3E50]);
    atomic_store(result, (unint64_t *)&qword_2545BC780);
  }
  return result;
}

uint64_t sub_209F63FC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_209F67B64();
  v2 = v1;
  if (v0 == sub_209F67B64() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_209F679A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_209F64078()
{
  swift_bridgeObjectRetain();
  return sub_209F67B70();
}

unint64_t sub_209F640D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2545BC788;
  if (!qword_2545BC788)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2545BC560);
    result = MEMORY[0x20BD1DB1C](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2545BC788);
  }
  return result;
}

ValueMetadata *_s6LiftUIO16UnkeyedContainerV3KeyVMa()
{
  return &_s6LiftUIO16UnkeyedContainerV3KeyVN;
}

unint64_t sub_209F64138()
{
  unint64_t result;

  result = qword_2545C6780;
  if (!qword_2545C6780)
  {
    result = MEMORY[0x20BD1DB1C](&unk_209F7C2B8, &_s6LiftUIO16UnkeyedContainerV3KeyVN);
    atomic_store(result, (unint64_t *)&qword_2545C6780);
  }
  return result;
}

unint64_t sub_209F64180()
{
  unint64_t result;

  result = qword_2545C6788[0];
  if (!qword_2545C6788[0])
  {
    result = MEMORY[0x20BD1DB1C](&unk_209F7C2E0, &_s6LiftUIO16UnkeyedContainerV3KeyVN);
    atomic_store(result, qword_2545C6788);
  }
  return result;
}

uint64_t sub_209F641C8@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char v24;
  uint64_t v25;
  _QWORD v27[2];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC790);
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (double *)((char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC798);
  MEMORY[0x24BDAC7A8](v10, v11);
  v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v9 = sub_209F66EBC();
  v9[1] = a3;
  *((_BYTE *)v9 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC7A0);
  v27[1] = a1;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC7A8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC7B0);
  sub_209EE83E8(&qword_2545BC7B8, &qword_2545BC7A8, MEMORY[0x24BEE12D8]);
  sub_209EE83E8(&qword_2545BC7C0, &qword_2545BC7B0, MEMORY[0x24BDF46F8]);
  sub_209F64474();
  sub_209F67204();
  v14 = sub_209F6703C();
  sub_209F66D18();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  sub_209EE3528((uint64_t)v9, (uint64_t)v13, &qword_2545BC790);
  v23 = &v13[*(int *)(v10 + 36)];
  *v23 = v14;
  *((_QWORD *)v23 + 1) = v16;
  *((_QWORD *)v23 + 2) = v18;
  *((_QWORD *)v23 + 3) = v20;
  *((_QWORD *)v23 + 4) = v22;
  v23[40] = 0;
  sub_209EE017C((uint64_t)v9, &qword_2545BC790);
  v24 = sub_209F67090();
  sub_209EE3528((uint64_t)v13, a2, &qword_2545BC798);
  v25 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2545BC7D0) + 36);
  *(_BYTE *)v25 = v24;
  *(_OWORD *)(v25 + 8) = 0u;
  *(_OWORD *)(v25 + 24) = 0u;
  *(_BYTE *)(v25 + 40) = 1;
  return sub_209EE017C((uint64_t)v13, &qword_2545BC798);
}

uint64_t sub_209F64418@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = *a1;
  v3 = a1[1];
  v5 = a1[2];
  *(_QWORD *)a2 = sub_209F66F28();
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  *(_QWORD *)(a2 + 24) = 0;
  *(_BYTE *)(a2 + 32) = 1;
  *(_QWORD *)(a2 + 40) = v4;
  *(_QWORD *)(a2 + 48) = v3;
  *(_QWORD *)(a2 + 56) = v5;
  *(_QWORD *)(a2 + 64) = 0;
  *(_BYTE *)(a2 + 72) = 1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

unint64_t sub_209F64474()
{
  unint64_t result;

  result = qword_2545BC7C8;
  if (!qword_2545BC7C8)
  {
    result = MEMORY[0x20BD1DB1C](&unk_209F7C5C8, &type metadata for HSplitViewElement.Panel);
    atomic_store(result, (unint64_t *)&qword_2545BC7C8);
  }
  return result;
}

uint64_t sub_209F644B8()
{
  sub_209F67B10();
  sub_209F6733C();
  return sub_209F67B28();
}

uint64_t sub_209F64504()
{
  return sub_209F6733C();
}

uint64_t sub_209F64518()
{
  sub_209F67B10();
  sub_209F6733C();
  return sub_209F67B28();
}

uint64_t sub_209F64560@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_209F67840();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_209F645B0(_QWORD *a1@<X8>)
{
  *a1 = 0x6C656E6170;
  a1[1] = 0xE500000000000000;
}

uint64_t sub_209F645C8()
{
  return 0x6C656E6170;
}

uint64_t sub_209F645DC@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_209F67840();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_209F64630()
{
  sub_209F65250();
  return sub_209F67B88();
}

uint64_t sub_209F64658()
{
  sub_209F65250();
  return sub_209F67B94();
}

uint64_t sub_209F64680@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_209F641C8(*(_QWORD *)(v1 + 16), a1, *(double *)(v1 + 24));
}

uint64_t sub_209F6468C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = sub_209F647B8(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_209F646BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = RUIViewContent.anyView.getter();
  *a1 = result;
  return result;
}

uint64_t sub_209F646E4()
{
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545BBAA8);
  sub_209EE83E8(&qword_2545BC670, &qword_2545BBAA8, MEMORY[0x24BEE12D8]);
  sub_209F0B204();
  return sub_209F67204();
}

uint64_t sub_209F6478C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = sub_209F6499C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_209F647B8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t countAndFlagsBits;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC838);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  countAndFlagsBits = Decoder.decodeRUIID()()._countAndFlagsBits;
  if (v8)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v11 = countAndFlagsBits;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_209F65250();
  swift_bridgeObjectRetain();
  sub_209F67B58();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC7A8);
  sub_209F65294(&qword_2545BC840, &qword_2545BC7A8, (uint64_t (*)(void))sub_209F652F8);
  sub_209F678AC();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_209F6499C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t countAndFlagsBits;
  uint64_t v4;
  _QWORD v6[4];

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  countAndFlagsBits = Decoder.decodeRUIID()()._countAndFlagsBits;
  if (v4)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v1 = countAndFlagsBits;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    swift_bridgeObjectRetain();
    sub_209F67B40();
    __swift_project_boxed_opaque_existential_1(v6, v6[3]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2545BBAA8);
    sub_209F65294((unint64_t *)&qword_2545BBAB0, &qword_2545BBAA8, (uint64_t (*)(void))sub_209F082D4);
    sub_209F679CC();
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v1;
}

unint64_t sub_209F64B34()
{
  unint64_t result;

  result = qword_2545BC7D8;
  if (!qword_2545BC7D8)
  {
    result = MEMORY[0x20BD1DB1C](&unk_209F7C36C, &type metadata for HSplitViewElement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2545BC7D8);
  }
  return result;
}

unint64_t sub_209F64B7C()
{
  unint64_t result;

  result = qword_2545BC7E0;
  if (!qword_2545BC7E0)
  {
    result = MEMORY[0x20BD1DB1C](&unk_209F7C484, &type metadata for HSplitViewElement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2545BC7E0);
  }
  return result;
}

unint64_t sub_209F64BC4()
{
  unint64_t result;

  result = qword_2545BC7E8;
  if (!qword_2545BC7E8)
  {
    result = MEMORY[0x20BD1DB1C](&unk_209F7C45C, &type metadata for HSplitViewElement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2545BC7E8);
  }
  return result;
}

unint64_t sub_209F64C08(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_209F64C3C();
  a1[2] = sub_209F64C80();
  result = sub_209F64CC4();
  a1[3] = result;
  return result;
}

unint64_t sub_209F64C3C()
{
  unint64_t result;

  result = qword_2545BC7F0;
  if (!qword_2545BC7F0)
  {
    result = MEMORY[0x20BD1DB1C](&unk_209F7C518, &type metadata for HSplitViewElement);
    atomic_store(result, (unint64_t *)&qword_2545BC7F0);
  }
  return result;
}

unint64_t sub_209F64C80()
{
  unint64_t result;

  result = qword_2545BC7F8;
  if (!qword_2545BC7F8)
  {
    result = MEMORY[0x20BD1DB1C](&unk_209F7C540, &type metadata for HSplitViewElement);
    atomic_store(result, (unint64_t *)&qword_2545BC7F8);
  }
  return result;
}

unint64_t sub_209F64CC4()
{
  unint64_t result;

  result = qword_2545BC800;
  if (!qword_2545BC800)
  {
    result = MEMORY[0x20BD1DB1C](&unk_209F7C4C8, &type metadata for HSplitViewElement);
    atomic_store(result, (unint64_t *)&qword_2545BC800);
  }
  return result;
}

uint64_t sub_209F64D08()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_209F64D18()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *initializeWithCopy for HSplitViewElement(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for HSplitViewElement(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  return a1;
}

uint64_t assignWithTake for HSplitViewElement(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for HSplitViewElement(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HSplitViewElement(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HSplitViewElement()
{
  return &type metadata for HSplitViewElement;
}

uint64_t storeEnumTagSinglePayload for HSplitViewElement.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_209F64EF8 + 4 * byte_209F7C360[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_209F64F18 + 4 * byte_209F7C365[v4]))();
}

_BYTE *sub_209F64EF8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_209F64F18(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_209F64F20(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_209F64F28(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_209F64F30(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_209F64F38(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for HSplitViewElement.CodingKeys()
{
  return &type metadata for HSplitViewElement.CodingKeys;
}

uint64_t _s8RemoteUI17HSplitViewElementV5PanelVwxx_0()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s8RemoteUI17HSplitViewElementV5PanelVwCP_0(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for HSplitViewElement.Panel(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for HSplitViewElement.Panel(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HSplitViewElement.Panel(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HSplitViewElement.Panel(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HSplitViewElement.Panel()
{
  return &type metadata for HSplitViewElement.Panel;
}

unint64_t sub_209F65100()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2545BC808;
  if (!qword_2545BC808)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2545BC7D0);
    v2[0] = sub_209F6516C();
    v2[1] = MEMORY[0x24BDECC58];
    result = MEMORY[0x20BD1DB1C](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2545BC808);
  }
  return result;
}

unint64_t sub_209F6516C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2545BC810;
  if (!qword_2545BC810)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2545BC798);
    v2[0] = sub_209EE83E8(&qword_2545BC818, &qword_2545BC790, MEMORY[0x24BDF44A0]);
    v2[1] = MEMORY[0x24BDECC58];
    result = MEMORY[0x20BD1DB1C](MEMORY[0x24BDED300], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2545BC810);
  }
  return result;
}

unint64_t sub_209F651F4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2545BC820;
  if (!qword_2545BC820)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2545BC828);
    v2 = MEMORY[0x24BDF4768];
    result = MEMORY[0x20BD1DB1C](MEMORY[0x24BDF4A00], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2545BC820);
  }
  return result;
}

unint64_t sub_209F65250()
{
  unint64_t result;

  result = qword_2545BC830;
  if (!qword_2545BC830)
  {
    result = MEMORY[0x20BD1DB1C](&unk_209F7C40C, &type metadata for HSplitViewElement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2545BC830);
  }
  return result;
}

uint64_t sub_209F65294(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = a3();
    result = MEMORY[0x20BD1DB1C](MEMORY[0x24BEE12D0], v6, &v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_209F652F8()
{
  unint64_t result;

  result = qword_2545BC848;
  if (!qword_2545BC848)
  {
    result = MEMORY[0x20BD1DB1C](&unk_209F7C600, &type metadata for HSplitViewElement.Panel);
    atomic_store(result, (unint64_t *)&qword_2545BC848);
  }
  return result;
}

uint64_t sub_209F6533C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  BOOL v8;

  if (qword_2545C6EA8 == -1)
  {
    if (qword_2545C6EB0)
      return _availability_version_check();
  }
  else
  {
    dispatch_once_f(&qword_2545C6EA8, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_2545C6EB0)
      return _availability_version_check();
  }
  if (qword_2545C6EA0 == -1)
  {
    v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_2545C6EA0, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2)
      return 1;
  }
  if (v8)
    return 0;
  if (dword_2545C6E94 > a3)
    return 1;
  return dword_2545C6E94 >= a3 && dword_2545C6E98 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t (*v1)(void);
  BOOL v2;
  unsigned __int8 *v4;
  uint64_t (*v5)(_QWORD);
  unint64_t v6;
  uint64_t (*v7)(_QWORD, uint64_t, _QWORD, _QWORD);
  uint64_t (*v8)(_QWORD, const char *, uint64_t, unsigned __int8 *);
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t (*v10)(uint64_t);
  uint64_t (*v11)(void);
  FILE *v12;
  FILE *v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  FILE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  FILE *v27;
  unsigned int (*v28)(uint64_t, char *, uint64_t, uint64_t);
  char v29[32];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v1 = (uint64_t (*)(void))qword_2545C6EB0;
  if (qword_2545C6EB0)
    v2 = (_DWORD)result == 0;
  else
    v2 = 0;
  if (!v2)
  {
    if (MEMORY[0x24BDAC970])
    {
      qword_2545C6EB0 = (uint64_t)MEMORY[0x24BDAC970];
      v1 = MEMORY[0x24BDAC970];
    }
    if (!v1 || (_DWORD)result != 0)
    {
      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        v4 = *(unsigned __int8 **)result;
        result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          v5 = (uint64_t (*)(_QWORD))result;
          v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            v7 = (uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD))result;
            result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              v8 = (uint64_t (*)(_QWORD, const char *, uint64_t, unsigned __int8 *))result;
              result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  v10 = (uint64_t (*)(uint64_t))result;
                  result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    v11 = (uint64_t (*)(void))result;
                    result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        v12 = (FILE *)result;
                        result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          v13 = (FILE *)result;
                          v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          v14 = MEMORY[0x20BD1D4B0](v13);
                          if (v14 < 0)
                          {
                            v16 = 0;
                          }
                          else
                          {
                            v15 = v14;
                            rewind(v13);
                            v16 = malloc(v15);
                            if (v16)
                            {
                              v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                v17 = v5(0);
                                if (v17)
                                {
                                  v18 = v17;
                                  v19 = v13;
                                  if (v6)
                                    v20 = ((uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))v6)(0, v17, 0, 0, 0);
                                  else
                                    v20 = v7(0, v17, 0, 0);
                                  v21 = v20;
                                  if (v20)
                                  {
                                    v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      v23 = v22;
                                      v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984))
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_2545C6E94, &dword_2545C6E98);
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  v19 = v13;
                                }
                                v16 = v26;
                              }
                              else
                              {
                                v16 = v26;
                                v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void __getBFFStyleClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SetupAssistantUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("RUIStyle.m"), 48, CFSTR("%s"), *a1);

  __break(1u);
}

void __getBFFStyleClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getBFFStyleClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("RUIStyle.m"), 49, CFSTR("Unable to find class %s"), "BFFStyle");

  __break(1u);
}

void RUIJSSection_removeRow_cold_1(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = a2;
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_209E87000, log, OS_LOG_TYPE_ERROR, "section.removeRow: Attempt to remove row %i of section %i, out of bounds.", (uint8_t *)v3, 0xEu);
}

void RUIJSSection_updateHTMLFooterContent_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209E87000, a1, a3, "Number of arguments or type mismatch.", a5, a6, a7, a8, 0);
}

void getAKAppleIDAuthenticationErrorDomain_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAKAppleIDAuthenticationErrorDomain(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("RUIObjectModel.m"), 61, CFSTR("%s"), OUTLINED_FUNCTION_0_0());

  __break(1u);
}

void getAKAuthenticationPasswordKey_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAKAuthenticationPasswordKey(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("RUIObjectModel.m"), 58, CFSTR("%s"), OUTLINED_FUNCTION_0_0());

  __break(1u);
}

void __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AuthKitUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("RUIObjectModel.m"), 64, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAKAppleIDAuthenticationInAppContextClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("RUIObjectModel.m"), 65, CFSTR("Unable to find class %s"), "AKAppleIDAuthenticationInAppContext");

  __break(1u);
}

void __getACAccountStoreClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AppleAccountLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("RUIObjectModel.m"), 69, CFSTR("%s"), *a1);

  __break(1u);
}

void __getACAccountStoreClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getACAccountStoreClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("RUIObjectModel.m"), 70, CFSTR("Unable to find class %s"), "ACAccountStore");

  __break(1u);
}

void __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAKAppleIDAuthenticationControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("RUIObjectModel.m"), 52, CFSTR("Unable to find class %s"), "AKAppleIDAuthenticationController");

  __break(1u);
}

void AuthKitLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AuthKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("RUIObjectModel.m"), 51, CFSTR("%s"), *a1);

  __break(1u);
}

void HSAAuthenticationLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *HSAAuthenticationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("RemoteUIController.m"), 42, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPSListControllerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPSListControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("RUIPasscodeView.m"), 61, CFSTR("Unable to find class %s"), "PSListController");

  __break(1u);
}

void PreferencesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PreferencesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("RUIPasscodeView.m"), 57, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMCProfileConnectionClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ManagedConfigurationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("RUIPasscodeView.m"), 66, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMCProfileConnectionClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMCProfileConnectionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("RUIPasscodeView.m"), 67, CFSTR("Unable to find class %s"), "MCProfileConnection");

  __break(1u);
}

void __getPSPasscodeFieldClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPSPasscodeFieldClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("RUIPasscodeView.m"), 58, CFSTR("Unable to find class %s"), "PSPasscodeField");

  __break(1u);
}

void __getOBPrivacyLinkControllerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *OnBoardingKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("RUIPrivacyLinkContainerView.m"), 17, CFSTR("%s"), *a1);

  __break(1u);
}

void __getOBPrivacyLinkControllerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getOBPrivacyLinkControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("RUIPrivacyLinkContainerView.m"), 18, CFSTR("Unable to find class %s"), "OBPrivacyLinkController");

  __break(1u);
}

void __getCTSettingCopyMyPhoneNumberSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreTelephonyLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("RUITableViewRow.m"), 48, CFSTR("%s"), *a1);

  __break(1u);
}

uint64_t sub_209F668F8()
{
  return MEMORY[0x24BDCB070]();
}

uint64_t sub_209F66904()
{
  return MEMORY[0x24BDCB088]();
}

uint64_t sub_209F66910()
{
  return MEMORY[0x24BDCB098]();
}

uint64_t sub_209F6691C()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_209F66928()
{
  return MEMORY[0x24BDCB648]();
}

uint64_t sub_209F66934()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_209F66940()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_209F6694C()
{
  return MEMORY[0x24BDCBAB0]();
}

uint64_t sub_209F66958()
{
  return MEMORY[0x24BDCBAC8]();
}

uint64_t sub_209F66964()
{
  return MEMORY[0x24BDCBAE0]();
}

uint64_t sub_209F66970()
{
  return MEMORY[0x24BDCBAF0]();
}

uint64_t sub_209F6697C()
{
  return MEMORY[0x24BDCBAF8]();
}

uint64_t sub_209F66988()
{
  return MEMORY[0x24BDCBB08]();
}

uint64_t sub_209F66994()
{
  return MEMORY[0x24BDCBB20]();
}

uint64_t sub_209F669A0()
{
  return MEMORY[0x24BDCBB48]();
}

uint64_t sub_209F669AC()
{
  return MEMORY[0x24BDCBB58]();
}

uint64_t sub_209F669B8()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_209F669C4()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_209F669D0()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_209F669DC()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_209F669E8()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_209F669F4()
{
  return MEMORY[0x24BDCC618]();
}

uint64_t sub_209F66A00()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_209F66A0C()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_209F66A18()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_209F66A24()
{
  return MEMORY[0x24BDCD748]();
}

uint64_t sub_209F66A30()
{
  return MEMORY[0x24BDCD750]();
}

uint64_t sub_209F66A3C()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_209F66A48()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_209F66A54()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t sub_209F66A60()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_209F66A6C()
{
  return MEMORY[0x24BDCDA48]();
}

uint64_t sub_209F66A78()
{
  return MEMORY[0x24BDCDA50]();
}

uint64_t sub_209F66A84()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_209F66A90()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_209F66A9C()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_209F66AA8()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_209F66AB4()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_209F66AC0()
{
  return MEMORY[0x24BDCDCF8]();
}

uint64_t sub_209F66ACC()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_209F66AD8()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_209F66AE4()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_209F66AF0()
{
  return MEMORY[0x24BDCF3B0]();
}

uint64_t sub_209F66AFC()
{
  return MEMORY[0x24BDCF420]();
}

uint64_t sub_209F66B08()
{
  return MEMORY[0x24BDCF428]();
}

uint64_t sub_209F66B14()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_209F66B20()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_209F66B2C()
{
  return MEMORY[0x24BEE5C48]();
}

uint64_t sub_209F66B38()
{
  return MEMORY[0x24BEE5C50]();
}

uint64_t sub_209F66B44()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_209F66B50()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_209F66B5C()
{
  return MEMORY[0x24BEE73C0]();
}

uint64_t sub_209F66B68()
{
  return MEMORY[0x24BDFC610]();
}

uint64_t sub_209F66B74()
{
  return MEMORY[0x24BDFC620]();
}

uint64_t sub_209F66B80()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_209F66B8C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_209F66B98()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_209F66BA4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_209F66BB0()
{
  return MEMORY[0x24BE5F250]();
}

uint64_t sub_209F66BBC()
{
  return MEMORY[0x24BE5F258]();
}

uint64_t sub_209F66BC8()
{
  return MEMORY[0x24BE5F270]();
}

uint64_t sub_209F66BD4()
{
  return MEMORY[0x24BE5F278]();
}

uint64_t sub_209F66BE0()
{
  return MEMORY[0x24BE5F280]();
}

uint64_t sub_209F66BEC()
{
  return MEMORY[0x24BE5F298]();
}

uint64_t sub_209F66BF8()
{
  return MEMORY[0x24BE5F3A0]();
}

uint64_t sub_209F66C04()
{
  return MEMORY[0x24BE5F418]();
}

uint64_t sub_209F66C10()
{
  return MEMORY[0x24BE5F430]();
}

uint64_t sub_209F66C1C()
{
  return MEMORY[0x24BE5F4D0]();
}

uint64_t sub_209F66C28()
{
  return MEMORY[0x24BE5F4E0]();
}

uint64_t sub_209F66C34()
{
  return MEMORY[0x24BE5F508]();
}

uint64_t sub_209F66C40()
{
  return MEMORY[0x24BE5F560]();
}

uint64_t sub_209F66C4C()
{
  return MEMORY[0x24BDB9B50]();
}

uint64_t sub_209F66C58()
{
  return MEMORY[0x24BDB9BF0]();
}

uint64_t sub_209F66C64()
{
  return MEMORY[0x24BDEAE10]();
}

uint64_t sub_209F66C70()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_209F66C7C()
{
  return MEMORY[0x24BDB9C90]();
}

uint64_t sub_209F66C88()
{
  return MEMORY[0x24BDB9D68]();
}

uint64_t sub_209F66C94()
{
  return MEMORY[0x24BDB9D80]();
}

uint64_t sub_209F66CA0()
{
  return MEMORY[0x24BDB9E70]();
}

uint64_t sub_209F66CAC()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_209F66CB8()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_209F66CC4()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_209F66CD0()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_209F66CDC()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_209F66CE8()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_209F66CF4()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_209F66D00()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_209F66D0C()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_209F66D18()
{
  return MEMORY[0x24BDEB038]();
}

uint64_t sub_209F66D24()
{
  return MEMORY[0x24BDEB568]();
}

uint64_t sub_209F66D30()
{
  return MEMORY[0x24BDEB5A8]();
}

uint64_t sub_209F66D3C()
{
  return MEMORY[0x24BDEB788]();
}

uint64_t sub_209F66D48()
{
  return MEMORY[0x24BDEB7C0]();
}

uint64_t sub_209F66D54()
{
  return MEMORY[0x24BDEBBC0]();
}

uint64_t sub_209F66D60()
{
  return MEMORY[0x24BDEBDE8]();
}

uint64_t sub_209F66D6C()
{
  return MEMORY[0x24BDEBDF8]();
}

uint64_t sub_209F66D78()
{
  return MEMORY[0x24BDEBE08]();
}

uint64_t sub_209F66D84()
{
  return MEMORY[0x24BDEBEC8]();
}

uint64_t sub_209F66D90()
{
  return MEMORY[0x24BDEC2B0]();
}

uint64_t sub_209F66D9C()
{
  return MEMORY[0x24BDEC2C0]();
}

uint64_t sub_209F66DA8()
{
  return MEMORY[0x24BDEC2D8]();
}

uint64_t sub_209F66DB4()
{
  return MEMORY[0x24BDEC4D8]();
}

uint64_t sub_209F66DC0()
{
  return MEMORY[0x24BDEC630]();
}

uint64_t sub_209F66DCC()
{
  return MEMORY[0x24BDEC640]();
}

uint64_t sub_209F66DD8()
{
  return MEMORY[0x24BDEC990]();
}

uint64_t sub_209F66DE4()
{
  return MEMORY[0x24BDECE60]();
}

uint64_t sub_209F66DF0()
{
  return MEMORY[0x24BDECE70]();
}

uint64_t sub_209F66DFC()
{
  return MEMORY[0x24BDECE80]();
}

uint64_t sub_209F66E08()
{
  return MEMORY[0x24BDED2D8]();
}

uint64_t sub_209F66E14()
{
  return MEMORY[0x24BDED3B8]();
}

uint64_t sub_209F66E20()
{
  return MEMORY[0x24BDEDBB0]();
}

uint64_t sub_209F66E2C()
{
  return MEMORY[0x24BDEDE48]();
}

uint64_t sub_209F66E38()
{
  return MEMORY[0x24BDEDE68]();
}

uint64_t sub_209F66E44()
{
  return MEMORY[0x24BDEE280]();
}

uint64_t sub_209F66E50()
{
  return MEMORY[0x24BDEE298]();
}

uint64_t sub_209F66E5C()
{
  return MEMORY[0x24BDEE388]();
}

uint64_t sub_209F66E68()
{
  return MEMORY[0x24BDEE398]();
}

uint64_t sub_209F66E74()
{
  return MEMORY[0x24BDEE3F8]();
}

uint64_t sub_209F66E80()
{
  return MEMORY[0x24BDEE408]();
}

uint64_t sub_209F66E8C()
{
  return MEMORY[0x24BDEE4E8]();
}

uint64_t sub_209F66E98()
{
  return MEMORY[0x24BDEE4F0]();
}

uint64_t sub_209F66EA4()
{
  return MEMORY[0x24BDEE528]();
}

uint64_t sub_209F66EB0()
{
  return MEMORY[0x24BDEE540]();
}

uint64_t sub_209F66EBC()
{
  return MEMORY[0x24BDEE738]();
}

uint64_t sub_209F66EC8()
{
  return MEMORY[0x24BDEE908]();
}

uint64_t sub_209F66ED4()
{
  return MEMORY[0x24BDEE920]();
}

uint64_t sub_209F66EE0()
{
  return MEMORY[0x24BDEEA10]();
}

uint64_t sub_209F66EEC()
{
  return MEMORY[0x24BDEEA20]();
}

uint64_t sub_209F66EF8()
{
  return MEMORY[0x24BDEEA38]();
}

uint64_t sub_209F66F04()
{
  return MEMORY[0x24BDEEA48]();
}

uint64_t sub_209F66F10()
{
  return MEMORY[0x24BDEEA68]();
}

uint64_t sub_209F66F1C()
{
  return MEMORY[0x24BDEEA98]();
}

uint64_t sub_209F66F28()
{
  return MEMORY[0x24BDEEF68]();
}

uint64_t sub_209F66F34()
{
  return MEMORY[0x24BDEEF70]();
}

uint64_t sub_209F66F40()
{
  return MEMORY[0x24BDEF180]();
}

uint64_t sub_209F66F4C()
{
  return MEMORY[0x24BDEF1C8]();
}

uint64_t sub_209F66F58()
{
  return MEMORY[0x24BDEF1F0]();
}

uint64_t sub_209F66F64()
{
  return MEMORY[0x24BDEF3A8]();
}

uint64_t sub_209F66F70()
{
  return MEMORY[0x24BDEFE60]();
}

uint64_t sub_209F66F7C()
{
  return MEMORY[0x24BDEFE70]();
}

uint64_t sub_209F66F88()
{
  return MEMORY[0x24BDEFE78]();
}

uint64_t sub_209F66F94()
{
  return MEMORY[0x24BDF0B18]();
}

uint64_t sub_209F66FA0()
{
  return MEMORY[0x24BDF0B20]();
}

uint64_t sub_209F66FAC()
{
  return MEMORY[0x24BDF0EB8]();
}

uint64_t sub_209F66FB8()
{
  return MEMORY[0x24BDF0EC8]();
}

uint64_t sub_209F66FC4()
{
  return MEMORY[0x24BDF0ED8]();
}

uint64_t sub_209F66FD0()
{
  return MEMORY[0x24BDF0EE8]();
}

uint64_t sub_209F66FDC()
{
  return MEMORY[0x24BDF0EF8]();
}

uint64_t sub_209F66FE8()
{
  return MEMORY[0x24BDF0F08]();
}

uint64_t sub_209F66FF4()
{
  return MEMORY[0x24BDF0F20]();
}

uint64_t sub_209F67000()
{
  return MEMORY[0x24BDF0F30]();
}

uint64_t sub_209F6700C()
{
  return MEMORY[0x24BDF11E8]();
}

uint64_t sub_209F67018()
{
  return MEMORY[0x24BDF11F8]();
}

uint64_t sub_209F67024()
{
  return MEMORY[0x24BDF1398]();
}

uint64_t sub_209F67030()
{
  return MEMORY[0x24BDF1428]();
}

uint64_t sub_209F6703C()
{
  return MEMORY[0x24BDF1498]();
}

uint64_t sub_209F67048()
{
  return MEMORY[0x24BDF14B0]();
}

uint64_t sub_209F67054()
{
  return MEMORY[0x24BDF14B8]();
}

uint64_t sub_209F67060()
{
  return MEMORY[0x24BDF14D0]();
}

uint64_t sub_209F6706C()
{
  return MEMORY[0x24BDF14D8]();
}

uint64_t sub_209F67078()
{
  return MEMORY[0x24BDF14F0]();
}

uint64_t sub_209F67084()
{
  return MEMORY[0x24BDF1500]();
}

uint64_t sub_209F67090()
{
  return MEMORY[0x24BDF1508]();
}

uint64_t sub_209F6709C()
{
  return MEMORY[0x24BDF1578]();
}

uint64_t sub_209F670A8()
{
  return MEMORY[0x24BDF16A0]();
}

uint64_t sub_209F670B4()
{
  return MEMORY[0x24BDF1780]();
}

uint64_t sub_209F670C0()
{
  return MEMORY[0x24BDF17E0]();
}

uint64_t sub_209F670CC()
{
  return MEMORY[0x24BDF1810]();
}

uint64_t sub_209F670D8()
{
  return MEMORY[0x24BDF1FC8]();
}

uint64_t sub_209F670E4()
{
  return MEMORY[0x24BDF1FD0]();
}

uint64_t sub_209F670F0()
{
  return MEMORY[0x24BDF2090]();
}

uint64_t sub_209F670FC()
{
  return MEMORY[0x24BDF2098]();
}

uint64_t sub_209F67108()
{
  return MEMORY[0x24BDF2140]();
}

uint64_t sub_209F67114()
{
  return MEMORY[0x24BDF2350]();
}

uint64_t sub_209F67120()
{
  return MEMORY[0x24BDF2458]();
}

uint64_t sub_209F6712C()
{
  return MEMORY[0x24BDF26A0]();
}

uint64_t sub_209F67138()
{
  return MEMORY[0x24BDF38B8]();
}

uint64_t sub_209F67144()
{
  return MEMORY[0x24BDF3BF0]();
}

uint64_t sub_209F67150()
{
  return MEMORY[0x24BDF3C00]();
}

uint64_t sub_209F6715C()
{
  return MEMORY[0x24BDF3F60]();
}

uint64_t sub_209F67168()
{
  return MEMORY[0x24BDF3F88]();
}

uint64_t sub_209F67174()
{
  return MEMORY[0x24BDF3FE0]();
}

uint64_t sub_209F67180()
{
  return MEMORY[0x24BDF40E0]();
}

uint64_t sub_209F6718C()
{
  return MEMORY[0x24BDF4148]();
}

uint64_t sub_209F67198()
{
  return MEMORY[0x24BDF4288]();
}

uint64_t sub_209F671A4()
{
  return MEMORY[0x24BDF4298]();
}

uint64_t sub_209F671B0()
{
  return MEMORY[0x24BDF42B8]();
}

uint64_t sub_209F671BC()
{
  return MEMORY[0x24BDF4670]();
}

uint64_t sub_209F671C8()
{
  return MEMORY[0x24BDF4798]();
}

uint64_t sub_209F671D4()
{
  return MEMORY[0x24BDF47A8]();
}

uint64_t sub_209F671E0()
{
  return MEMORY[0x24BDF47C0]();
}

uint64_t sub_209F671EC()
{
  return MEMORY[0x24BDF47F0]();
}

uint64_t sub_209F671F8()
{
  return MEMORY[0x24BDF4868]();
}

uint64_t sub_209F67204()
{
  return MEMORY[0x24BDF49B0]();
}

uint64_t sub_209F67210()
{
  return MEMORY[0x24BDF4BC8]();
}

uint64_t sub_209F6721C()
{
  return MEMORY[0x24BDF4EE0]();
}

uint64_t sub_209F67228()
{
  return MEMORY[0x24BDF4F10]();
}

uint64_t sub_209F67234()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_209F67240()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_209F6724C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_209F67258()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_209F67264()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_209F67270()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_209F6727C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_209F67288()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_209F67294()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_209F672A0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_209F672AC()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_209F672B8()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_209F672C4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_209F672D0()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_209F672DC()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_209F672E8()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_209F672F4()
{
  return MEMORY[0x24BDCFAE8]();
}

uint64_t sub_209F67300()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_209F6730C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_209F67318()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_209F67324()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_209F67330()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_209F6733C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_209F67348()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_209F67354()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_209F67360()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_209F6736C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_209F67378()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_209F67384()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_209F67390()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_209F6739C()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_209F673A8()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_209F673B4()
{
  return MEMORY[0x24BEE0EE8]();
}

uint64_t sub_209F673C0()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_209F673CC()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_209F673D8()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_209F673E4()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_209F673F0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_209F673FC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_209F67408()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_209F67414()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_209F67420()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_209F6742C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_209F67438()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_209F67444()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_209F67450()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_209F6745C()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_209F67468()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_209F67474()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_209F67480()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_209F6748C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_209F67498()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_209F674A4()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_209F674B0()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_209F674BC()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_209F674C8()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_209F674D4()
{
  return MEMORY[0x24BEE6BA0]();
}

uint64_t sub_209F674E0()
{
  return MEMORY[0x24BEE6BB0]();
}

uint64_t sub_209F674EC()
{
  return MEMORY[0x24BEE1478]();
}

uint64_t sub_209F674F8()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_209F67504()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_209F67510()
{
  return MEMORY[0x24BEE7668]();
}

uint64_t sub_209F6751C()
{
  return MEMORY[0x24BDF5510]();
}

uint64_t sub_209F67528()
{
  return MEMORY[0x24BDCFED8]();
}

uint64_t sub_209F67534()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_209F67540()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_209F6754C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_209F67558()
{
  return MEMORY[0x24BEBCBF0]();
}

uint64_t sub_209F67564()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_209F67570()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_209F6757C()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_209F67588()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_209F67594()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_209F675A0()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_209F675AC()
{
  return MEMORY[0x24BDD0410]();
}

uint64_t sub_209F675B8()
{
  return MEMORY[0x24BDD0448]();
}

uint64_t sub_209F675C4()
{
  return MEMORY[0x24BDD0460]();
}

uint64_t sub_209F675D0()
{
  return MEMORY[0x24BDD0468]();
}

uint64_t sub_209F675DC()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_209F675E8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_209F675F4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_209F67600()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_209F6760C()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_209F67618()
{
  return MEMORY[0x24BEE1FD0]();
}

uint64_t sub_209F67624()
{
  return MEMORY[0x24BEE2068]();
}

uint64_t sub_209F67630()
{
  return MEMORY[0x24BEE2070]();
}

uint64_t sub_209F6763C()
{
  return MEMORY[0x24BEE2078]();
}

uint64_t sub_209F67648()
{
  return MEMORY[0x24BEE20A0]();
}

uint64_t sub_209F67654()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_209F67660()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_209F6766C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_209F67678()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_209F67684()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_209F67690()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_209F6769C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_209F676A8()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_209F676B4()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_209F676C0()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_209F676CC()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_209F676D8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_209F676E4()
{
  return MEMORY[0x24BEE2568]();
}

uint64_t sub_209F676F0()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_209F676FC()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_209F67708()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_209F67714()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_209F67720()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_209F6772C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_209F67738()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_209F67744()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_209F67750()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_209F6775C()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_209F67768()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_209F67774()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_209F67780()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_209F6778C()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_209F67798()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_209F677A4()
{
  return MEMORY[0x24BEE2CB8]();
}

uint64_t sub_209F677B0()
{
  return MEMORY[0x24BEE2CC8]();
}

uint64_t sub_209F677BC()
{
  return MEMORY[0x24BEE2D80]();
}

uint64_t sub_209F677C8()
{
  return MEMORY[0x24BEE2D88]();
}

uint64_t sub_209F677D4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_209F677E0()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_209F677EC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_209F677F8()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_209F67804()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_209F67810()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_209F6781C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_209F67828()
{
  return MEMORY[0x24BEE30D0]();
}

uint64_t sub_209F67834()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_209F67840()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_209F6784C()
{
  return MEMORY[0x24BEE6FA8]();
}

uint64_t sub_209F67858()
{
  return MEMORY[0x24BEE32B0]();
}

uint64_t sub_209F67864()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_209F67870()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_209F6787C()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_209F67888()
{
  return MEMORY[0x24BEE32E0]();
}

uint64_t sub_209F67894()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_209F678A0()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_209F678AC()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_209F678B8()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_209F678C4()
{
  return MEMORY[0x24BEE33D0]();
}

uint64_t sub_209F678D0()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_209F678DC()
{
  return MEMORY[0x24BEE33F0]();
}

uint64_t sub_209F678E8()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_209F678F4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_209F67900()
{
  return MEMORY[0x24BEE3638]();
}

uint64_t sub_209F6790C()
{
  return MEMORY[0x24BEE3668]();
}

uint64_t sub_209F67918()
{
  return MEMORY[0x24BEE3678]();
}

uint64_t sub_209F67924()
{
  return MEMORY[0x24BEE3680]();
}

uint64_t sub_209F67930()
{
  return MEMORY[0x24BEE3688]();
}

uint64_t sub_209F6793C()
{
  return MEMORY[0x24BEE3698]();
}

uint64_t sub_209F67948()
{
  return MEMORY[0x24BEE36A0]();
}

uint64_t sub_209F67954()
{
  return MEMORY[0x24BEE36A8]();
}

uint64_t sub_209F67960()
{
  return MEMORY[0x24BEE36C8]();
}

uint64_t sub_209F6796C()
{
  return MEMORY[0x24BEE36F0]();
}

uint64_t sub_209F67978()
{
  return MEMORY[0x24BEE3700]();
}

uint64_t sub_209F67984()
{
  return MEMORY[0x24BEE3708]();
}

uint64_t sub_209F67990()
{
  return MEMORY[0x24BEE39E0]();
}

uint64_t sub_209F6799C()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_209F679A8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_209F679B4()
{
  return MEMORY[0x24BEE3A50]();
}

uint64_t sub_209F679C0()
{
  return MEMORY[0x24BEE3A58]();
}

uint64_t sub_209F679CC()
{
  return MEMORY[0x24BEE3A88]();
}

uint64_t sub_209F679D8()
{
  return MEMORY[0x24BEE3AD0]();
}

uint64_t sub_209F679E4()
{
  return MEMORY[0x24BEE3AD8]();
}

uint64_t sub_209F679F0()
{
  return MEMORY[0x24BEE3BD8]();
}

uint64_t sub_209F679FC()
{
  return MEMORY[0x24BEE3BE0]();
}

uint64_t sub_209F67A08()
{
  return MEMORY[0x24BEE3BE8]();
}

uint64_t sub_209F67A14()
{
  return MEMORY[0x24BEE3BF0]();
}

uint64_t sub_209F67A20()
{
  return MEMORY[0x24BEE3BF8]();
}

uint64_t sub_209F67A2C()
{
  return MEMORY[0x24BEE3C08]();
}

uint64_t sub_209F67A38()
{
  return MEMORY[0x24BEE3C10]();
}

uint64_t sub_209F67A44()
{
  return MEMORY[0x24BEE3C18]();
}

uint64_t sub_209F67A50()
{
  return MEMORY[0x24BEE3C38]();
}

uint64_t sub_209F67A5C()
{
  return MEMORY[0x24BEE3C60]();
}

uint64_t sub_209F67A68()
{
  return MEMORY[0x24BEE3C70]();
}

uint64_t sub_209F67A74()
{
  return MEMORY[0x24BEE3C78]();
}

uint64_t sub_209F67A80()
{
  return MEMORY[0x24BEE3DD8]();
}

uint64_t sub_209F67A8C()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_209F67A98()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_209F67AA4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_209F67AB0()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_209F67ABC()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_209F67AC8()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_209F67AD4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_209F67AE0()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_209F67AEC()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_209F67AF8()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_209F67B04()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_209F67B10()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_209F67B1C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_209F67B28()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_209F67B34()
{
  return MEMORY[0x24BEE45E8]();
}

uint64_t sub_209F67B40()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t sub_209F67B4C()
{
  return MEMORY[0x24BEE4600]();
}

uint64_t sub_209F67B58()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_209F67B64()
{
  return MEMORY[0x24BEE49E8]();
}

uint64_t sub_209F67B70()
{
  return MEMORY[0x24BEE49F0]();
}

uint64_t sub_209F67B7C()
{
  return MEMORY[0x24BEE49F8]();
}

uint64_t sub_209F67B88()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_209F67B94()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_209F67BA0()
{
  return MEMORY[0x24BEE4A98]();
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x24BDBB7A8]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x24BDBC360](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC370](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC380](source);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

CFStringRef CFStringTokenizerCopyBestStringLanguage(CFStringRef string, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC700](string, range.location, range.length);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x24BDBDAC0](color1, color2);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x24BDBDAF8](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x24BDBDB08](color);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9170](data, options);
}

CGImageSourceStatus CGImageSourceGetStatus(CGImageSourceRef isrc)
{
  return MEMORY[0x24BDD9198](isrc);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

JSClassRef JSClassCreate(const JSClassDefinition *definition)
{
  return (JSClassRef)MEMORY[0x24BDDA530](definition);
}

JSGlobalContextRef JSContextGetGlobalContext(JSContextRef ctx)
{
  return (JSGlobalContextRef)MEMORY[0x24BDDA540](ctx);
}

JSObjectRef JSContextGetGlobalObject(JSContextRef ctx)
{
  return (JSObjectRef)MEMORY[0x24BDDA548](ctx);
}

JSValueRef JSEvaluateScript(JSContextRef ctx, JSStringRef script, JSObjectRef thisObject, JSStringRef sourceURL, int startingLineNumber, JSValueRef *exception)
{
  return (JSValueRef)MEMORY[0x24BDDA550](ctx, script, thisObject, sourceURL, *(_QWORD *)&startingLineNumber, exception);
}

JSGlobalContextRef JSGlobalContextCreate(JSClassRef globalObjectClass)
{
  return (JSGlobalContextRef)MEMORY[0x24BDDA560](globalObjectClass);
}

void JSGlobalContextRelease(JSGlobalContextRef ctx)
{
  MEMORY[0x24BDDA570](ctx);
}

JSGlobalContextRef JSGlobalContextRetain(JSGlobalContextRef ctx)
{
  return (JSGlobalContextRef)MEMORY[0x24BDDA578](ctx);
}

JSValueRef JSObjectCallAsFunction(JSContextRef ctx, JSObjectRef object, JSObjectRef thisObject, size_t argumentCount, const JSValueRef arguments[], JSValueRef *exception)
{
  return (JSValueRef)MEMORY[0x24BDDA580](ctx, object, thisObject, argumentCount, arguments, exception);
}

void *__cdecl JSObjectGetPrivate(JSObjectRef object)
{
  return (void *)MEMORY[0x24BDDA5A0](object);
}

JSValueRef JSObjectGetProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef *exception)
{
  return (JSValueRef)MEMORY[0x24BDDA5A8](ctx, object, propertyName, exception);
}

JSValueRef JSObjectGetPropertyAtIndex(JSContextRef ctx, JSObjectRef object, unsigned int propertyIndex, JSValueRef *exception)
{
  return (JSValueRef)MEMORY[0x24BDDA5B0](ctx, object, *(_QWORD *)&propertyIndex, exception);
}

JSObjectRef JSObjectMake(JSContextRef ctx, JSClassRef jsClass, void *data)
{
  return (JSObjectRef)MEMORY[0x24BDDA5B8](ctx, jsClass, data);
}

JSObjectRef JSObjectMakeArray(JSContextRef ctx, size_t argumentCount, const JSValueRef arguments[], JSValueRef *exception)
{
  return (JSObjectRef)MEMORY[0x24BDDA5C0](ctx, argumentCount, arguments, exception);
}

JSObjectRef JSObjectMakeDate(JSContextRef ctx, size_t argumentCount, const JSValueRef arguments[], JSValueRef *exception)
{
  return (JSObjectRef)MEMORY[0x24BDDA5C8](ctx, argumentCount, arguments, exception);
}

void JSObjectSetProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef value, JSPropertyAttributes attributes, JSValueRef *exception)
{
  MEMORY[0x24BDDA5D0](ctx, object, propertyName, value, *(_QWORD *)&attributes, exception);
}

CFStringRef JSStringCopyCFString(CFAllocatorRef alloc, JSStringRef string)
{
  return (CFStringRef)MEMORY[0x24BDDA638](alloc, string);
}

JSStringRef JSStringCreateWithCFString(CFStringRef string)
{
  return (JSStringRef)MEMORY[0x24BDDA640](string);
}

JSStringRef JSStringCreateWithUTF8CString(const char *string)
{
  return (JSStringRef)MEMORY[0x24BDDA648](string);
}

BOOL JSStringIsEqualToUTF8CString(JSStringRef a, const char *b)
{
  return MEMORY[0x24BDDA668](a, b);
}

void JSStringRelease(JSStringRef string)
{
  MEMORY[0x24BDDA670](string);
}

JSType JSValueGetType(JSContextRef ctx, JSValueRef value)
{
  return MEMORY[0x24BDDA688](ctx, value);
}

BOOL JSValueIsBoolean(JSContextRef ctx, JSValueRef value)
{
  return MEMORY[0x24BDDA698](ctx, value);
}

BOOL JSValueIsInstanceOfConstructor(JSContextRef ctx, JSValueRef value, JSObjectRef constructor, JSValueRef *exception)
{
  return MEMORY[0x24BDDA6A0](ctx, value, constructor, exception);
}

BOOL JSValueIsNumber(JSContextRef ctx, JSValueRef value)
{
  return MEMORY[0x24BDDA6A8](ctx, value);
}

BOOL JSValueIsObject(JSContextRef ctx, JSValueRef value)
{
  return MEMORY[0x24BDDA6B0](ctx, value);
}

BOOL JSValueIsString(JSContextRef ctx, JSValueRef value)
{
  return MEMORY[0x24BDDA6B8](ctx, value);
}

BOOL JSValueIsUndefined(JSContextRef ctx, JSValueRef value)
{
  return MEMORY[0x24BDDA6C0](ctx, value);
}

JSValueRef JSValueMakeBoolean(JSContextRef ctx, BOOL BOOLean)
{
  return (JSValueRef)MEMORY[0x24BDDA6C8](ctx, BOOLean);
}

JSValueRef JSValueMakeNumber(JSContextRef ctx, double number)
{
  return (JSValueRef)MEMORY[0x24BDDA6E0](ctx, number);
}

JSValueRef JSValueMakeString(JSContextRef ctx, JSStringRef string)
{
  return (JSValueRef)MEMORY[0x24BDDA6E8](ctx, string);
}

JSValueRef JSValueMakeUndefined(JSContextRef ctx)
{
  return (JSValueRef)MEMORY[0x24BDDA6F0](ctx);
}

BOOL JSValueToBoolean(JSContextRef ctx, JSValueRef value)
{
  return MEMORY[0x24BDDA6F8](ctx, value);
}

double JSValueToNumber(JSContextRef ctx, JSValueRef value, JSValueRef *exception)
{
  double result;

  MEMORY[0x24BDDA700](ctx, value, exception);
  return result;
}

JSObjectRef JSValueToObject(JSContextRef ctx, JSValueRef value, JSValueRef *exception)
{
  return (JSObjectRef)MEMORY[0x24BDDA708](ctx, value, exception);
}

JSStringRef JSValueToStringCopy(JSContextRef ctx, JSValueRef value, JSValueRef *exception)
{
  return (JSStringRef)MEMORY[0x24BDDA710](ctx, value, exception);
}

uint64_t LICreateDefaultIcon()
{
  return MEMORY[0x24BE670F0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BEBE0B0](category);
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x24BEBE278]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BEBE280](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BEBE2A8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

uint64_t UIKeyboardAutomaticIsOnScreen()
{
  return MEMORY[0x24BEBE410]();
}

uint64_t UIKeyboardOrderOutAutomatic()
{
  return MEMORY[0x24BEBE530]();
}

uint64_t UIKeyboardOrderOutAutomaticSkippingAnimation()
{
  return MEMORY[0x24BEBE538]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x24BEBE698]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UISystemFontForSize()
{
  return MEMORY[0x24BEBB640]();
}

uint64_t WebThreadLock()
{
  return MEMORY[0x24BEC27C0]();
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

uint64_t _UIContentSizeCategoryIsAccessibilityContentSizeCategory()
{
  return MEMORY[0x24BEBEA68]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _availability_version_check()
{
  return MEMORY[0x24BDAC970]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
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

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
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

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x24BDAF7D8](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7E0](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8E8](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8F0](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x24BDAF908](a1, *(_QWORD *)&a2);
}

void rewind(FILE *a1)
{
  MEMORY[0x24BDAFB98](a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
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

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x24BEE4C50]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x24BEE4F20]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
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

uint64_t swift_taskGroup_wait_next_throwing()
{
  return MEMORY[0x24BEE7218]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

