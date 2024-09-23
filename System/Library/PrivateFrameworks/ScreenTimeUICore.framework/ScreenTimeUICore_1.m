_QWORD *assignWithCopy for MostUsedListSectionAppsAndCategories.Model(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  __swift_assign_boxed_opaque_existential_1(a1 + 7, a2 + 7);
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
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
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for MostUsedListSectionAppsAndCategories.Model(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  return a1;
}

uint64_t getEnumTagSinglePayload for MostUsedListSectionAppsAndCategories.Model(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 96))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MostUsedListSectionAppsAndCategories.Model(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 96) = 1;
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
    *(_BYTE *)(result + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MostUsedListSectionAppsAndCategories.Model()
{
  return &type metadata for MostUsedListSectionAppsAndCategories.Model;
}

uint64_t sub_20DE07D74(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t *v8;
  __int128 v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t *, uint64_t);
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
  }
  else
  {
    *(_QWORD *)(a1 + 8) = a2[1];
    v8 = a2 + 2;
    v9 = *(_OWORD *)(a2 + 5);
    *(_OWORD *)(a1 + 40) = v9;
    v10 = v9;
    v11 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v9 - 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(a1 + 16, v8, v10);
    v12 = *((_OWORD *)a2 + 5);
    *(_OWORD *)(a1 + 80) = v12;
    (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 56, (uint64_t)(a2 + 7));
    v13 = *(int *)(a3 + 20);
    v14 = a1 + v13;
    v15 = (uint64_t)a2 + v13;
    v16 = sub_20DE1FC48();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    v17 = *(int *)(a3 + 24);
    v18 = a1 + v17;
    v19 = (uint64_t)a2 + v17;
    *(_BYTE *)v18 = *(_BYTE *)v19;
    *(_QWORD *)(v18 + 8) = *(_QWORD *)(v19 + 8);
  }
  swift_retain();
  return a1;
}

uint64_t sub_20DE07E88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_release();
}

uint64_t sub_20DE07F00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = a2 + 16;
  v8 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v8;
  v9 = v8;
  v10 = **(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(a1 + 16, v7, v9);
  v11 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 56, a2 + 56);
  v12 = *(int *)(a3 + 20);
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  v16 = *(int *)(a3 + 24);
  v17 = a1 + v16;
  v18 = a2 + v16;
  *(_BYTE *)v17 = *(_BYTE *)v18;
  *(_QWORD *)(v17 + 8) = *(_QWORD *)(v18 + 8);
  swift_retain();
  return a1;
}

_QWORD *sub_20DE07FEC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  __swift_assign_boxed_opaque_existential_1(a1 + 7, a2 + 7);
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_20DE1FC48();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  *v11 = *v12;
  *((_QWORD *)v11 + 1) = *((_QWORD *)v12 + 1);
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_20DE080C4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  v8 = a2[1];
  v9 = *(int *)(a3 + 20);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  *a1 = *a2;
  a1[1] = v8;
  v12 = sub_20DE1FC48();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_20DE0814C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  *(_BYTE *)v12 = *(_BYTE *)v13;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v13 + 8);
  swift_release();
  return a1;
}

uint64_t sub_20DE0822C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE08238(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_20DE1FC48();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_20DE082B4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_20DE082C0(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_20DE1FC48();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for MostUsedListSectionAppsAndCategories()
{
  uint64_t result;

  result = qword_2549EB658;
  if (!qword_2549EB658)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20DE08370()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20DE1FC48();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_20DE083EC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20DE083FC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t result;
  int64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void (*v19)(char *, unint64_t, uint64_t);
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  uint64_t v42;

  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB6C0);
  MEMORY[0x24BDAC7A8](v38);
  v37 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v36 = (uint64_t)&v32 - v4;
  MEMORY[0x24BDAC7A8](v5);
  v35 = (char *)&v32 - v6;
  v42 = MEMORY[0x24BEE4AF8];
  v7 = *(_QWORD *)(a1 + 64);
  v33 = a1 + 64;
  v8 = 1 << *(_BYTE *)(a1 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & v7;
  v34 = (unint64_t)(v8 + 63) >> 6;
  v39 = a1;
  result = swift_bridgeObjectRetain();
  v12 = 0;
  v13 = v37;
  while (1)
  {
    if (v10)
    {
      v40 = (v10 - 1) & v10;
      v41 = v12;
      v14 = __clz(__rbit64(v10)) | (v12 << 6);
      goto LABEL_5;
    }
    v28 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v28 >= v34)
      goto LABEL_23;
    v29 = *(_QWORD *)(v33 + 8 * v28);
    v30 = v12 + 1;
    if (!v29)
    {
      v30 = v12 + 2;
      if (v12 + 2 >= v34)
        goto LABEL_23;
      v29 = *(_QWORD *)(v33 + 8 * v30);
      if (!v29)
      {
        v30 = v12 + 3;
        if (v12 + 3 >= v34)
          goto LABEL_23;
        v29 = *(_QWORD *)(v33 + 8 * v30);
        if (!v29)
        {
          v30 = v12 + 4;
          if (v12 + 4 >= v34)
            goto LABEL_23;
          v29 = *(_QWORD *)(v33 + 8 * v30);
          if (!v29)
            break;
        }
      }
    }
LABEL_22:
    v40 = (v29 - 1) & v29;
    v41 = v30;
    v14 = __clz(__rbit64(v29)) + (v30 << 6);
LABEL_5:
    v15 = v39;
    v16 = *(_QWORD *)(v39 + 48);
    v17 = sub_20DE1FC48();
    v18 = *(_QWORD **)(v17 - 8);
    v19 = (void (*)(char *, unint64_t, uint64_t))v18[2];
    v20 = v35;
    v19(v35, v16 + v18[9] * v14, v17);
    v21 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v14);
    v22 = v38;
    *(_QWORD *)&v20[*(int *)(v38 + 48)] = v21;
    v23 = (uint64_t)v20;
    v24 = v36;
    sub_20DD93408(v23, v36, &qword_2549EB6C0);
    v25 = *(int *)(v22 + 48);
    v19(v13, v24, v17);
    v26 = *(_QWORD *)(v24 + v25);
    *(_QWORD *)&v13[v25] = v26;
    v27 = (void (*)(char *, uint64_t))v18[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v27(v13, v17);
    sub_20DD851D0(v24, &qword_2549EB6C0);
    result = sub_20DE0992C(v26);
    v10 = v40;
    v12 = v41;
  }
  v31 = v12 + 5;
  if (v12 + 5 >= v34)
  {
LABEL_23:
    swift_release();
    return v42;
  }
  v29 = *(_QWORD *)(v33 + 8 * v31);
  if (v29)
  {
    v30 = v12 + 5;
    goto LABEL_22;
  }
  while (1)
  {
    v30 = v31 + 1;
    if (__OFADD__(v31, 1))
      break;
    if (v30 >= v34)
      goto LABEL_23;
    v29 = *(_QWORD *)(v33 + 8 * v30);
    ++v31;
    if (v29)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_20DE086EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB698);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for MostUsedListSectionAppsAndCategories();
  v7 = (char *)v1 + *(int *)(v6 + 24);
  v8 = *v7;
  v9 = *((_QWORD *)v7 + 1);
  v20 = *v7;
  v21 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB6A0);
  sub_20DE20A34();
  if ((v22 & 1) != 0)
    v10 = *v1;
  else
    v10 = v1[1];
  v11 = sub_20DE09484(v10, (uint64_t)v1 + *(int *)(v6 + 20));
  v20 = v8;
  v21 = v9;
  sub_20DE20A34();
  v12 = (uint64_t)v1 + *(int *)(v6 + 20);
  if ((v22 & 1) != 0)
  {
    sub_20DE089F8(v12);
    if (*(_QWORD *)(v11 + 16))
    {
LABEL_6:
      v14 = MEMORY[0x24BDAC7A8](v13).n128_u64[0];
      *(&v19 - 2) = v11;
      *(&v19 - 1) = v14;
      *(_QWORD *)v5 = sub_20DE20614();
      *((_QWORD *)v5 + 1) = 0;
      v5[16] = 1;
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB6A8);
      sub_20DE08B50((uint64_t)v1, (uint64_t)&v5[*(int *)(v15 + 44)]);
      sub_20DE0985C();
      sub_20DD9D714();
      sub_20DE20B48();
      swift_bridgeObjectRelease();
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB6B8);
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a1, 0, 1, v16);
    }
  }
  else
  {
    sub_20DE08900(v12);
    if (*(_QWORD *)(v11 + 16))
      goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB6B8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(a1, 1, 1, v18);
}

double sub_20DE08900(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double *v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  double *v13;
  double v14;
  _QWORD v16[4];

  v2 = *(_QWORD *)(v1 + 8);
  v16[2] = a1;
  swift_bridgeObjectRetain();
  v3 = sub_20DDA2048((uint64_t)sub_20DE098A8, (uint64_t)v16, v2);
  swift_bridgeObjectRelease();
  v4 = sub_20DE083FC(v3);
  swift_release();
  v5 = *(_QWORD *)(v4 + 16);
  if (!v5)
  {
    v7 = 0.0;
    goto LABEL_10;
  }
  if (v5 == 1)
  {
    v6 = 0;
    v7 = 0.0;
LABEL_8:
    v12 = v5 - v6;
    v13 = (double *)(v4 + 56 * v6 + 48);
    do
    {
      v14 = *v13;
      v13 += 7;
      v7 = v7 + v14;
      --v12;
    }
    while (v12);
    goto LABEL_10;
  }
  v6 = v5 & 0x7FFFFFFFFFFFFFFELL;
  v8 = (double *)(v4 + 104);
  v7 = 0.0;
  v9 = v5 & 0x7FFFFFFFFFFFFFFELL;
  do
  {
    v10 = *(v8 - 7);
    v11 = *v8;
    v8 += 14;
    v7 = v7 + v10 + v11;
    v9 -= 2;
  }
  while (v9);
  if (v5 != v6)
    goto LABEL_8;
LABEL_10:
  swift_bridgeObjectRelease();
  return v7;
}

double sub_20DE089F8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double *v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  double *v13;
  double v14;
  _QWORD v16[4];

  v2 = *v1;
  v16[2] = a1;
  swift_bridgeObjectRetain();
  v3 = sub_20DDA2048((uint64_t)sub_20DE0BF1C, (uint64_t)v16, v2);
  swift_bridgeObjectRelease();
  v4 = sub_20DE083FC(v3);
  swift_release();
  v5 = *(_QWORD *)(v4 + 16);
  if (!v5)
  {
    v7 = 0.0;
    goto LABEL_10;
  }
  if (v5 == 1)
  {
    v6 = 0;
    v7 = 0.0;
LABEL_8:
    v12 = v5 - v6;
    v13 = (double *)(v4 + 56 * v6 + 48);
    do
    {
      v14 = *v13;
      v13 += 7;
      v7 = v7 + v14;
      --v12;
    }
    while (v12);
    goto LABEL_10;
  }
  v6 = v5 & 0x7FFFFFFFFFFFFFFELL;
  v8 = (double *)(v4 + 104);
  v7 = 0.0;
  v9 = v5 & 0x7FFFFFFFFFFFFFFELL;
  do
  {
    v10 = *(v8 - 7);
    v11 = *v8;
    v8 += 14;
    v7 = v7 + v10 + v11;
    v9 -= 2;
  }
  while (v9);
  if (v5 != v6)
    goto LABEL_8;
LABEL_10:
  swift_bridgeObjectRelease();
  return v7;
}

double sub_20DE08AF0@<D0>(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v4;
  double result;
  __int128 v6;
  _OWORD v7[2];
  char v8;

  v4 = swift_bridgeObjectRetain();
  sub_20DDFD58C(v4, (uint64_t)v7, a2);
  swift_bridgeObjectRelease();
  result = *(double *)v7;
  v6 = v7[1];
  *(_OWORD *)a1 = v7[0];
  *(_OWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 32) = v8;
  return result;
}

uint64_t sub_20DE08B50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t KeyPath;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
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
  char v48;
  uint64_t v49;

  v38 = a1;
  v44 = a2;
  v2 = type metadata accessor for MostUsedListSectionAppsAndCategories();
  v37 = *(_QWORD *)(v2 - 8);
  v3 = *(_QWORD *)(v37 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB6C8);
  v42 = *(_QWORD *)(v4 - 8);
  v43 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB6D0);
  MEMORY[0x24BDAC7A8](v41);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v40 = (uint64_t)&v37 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E85E8);
  MEMORY[0x24BDAC7A8](v11);
  v39 = (uint64_t)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v37 - v14;
  sub_20DE2065C();
  v16 = objc_msgSend((id)objc_opt_self(), sel_bundle);
  v17 = sub_20DE20854();
  v19 = v18;
  v46 = v17;
  v47 = v18;
  v21 = v20 & 1;
  v48 = v20 & 1;
  v49 = v22;
  sub_20DE20920();
  sub_20DD851C0(v17, v19, v21);
  swift_bridgeObjectRelease();
  v23 = v38;
  sub_20DE09A84(v38, (uint64_t)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v24 = (*(unsigned __int8 *)(v37 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
  v25 = swift_allocObject();
  sub_20DE09B7C((uint64_t)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v25 + v24);
  v45 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB6D8);
  sub_20DE09BF4();
  sub_20DE20A64();
  v26 = sub_20DE2080C();
  KeyPath = swift_getKeyPath();
  v29 = v42;
  v28 = v43;
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v8, v6, v43);
  v30 = (uint64_t *)&v8[*(int *)(v41 + 36)];
  *v30 = KeyPath;
  v30[1] = v26;
  (*(void (**)(char *, uint64_t))(v29 + 8))(v6, v28);
  v31 = v40;
  sub_20DD93408((uint64_t)v8, v40, &qword_2549EB6D0);
  v32 = v39;
  sub_20DD8516C((uint64_t)v15, v39, &qword_2549E85E8);
  sub_20DD8516C(v31, (uint64_t)v8, &qword_2549EB6D0);
  v33 = v44;
  sub_20DD8516C(v32, v44, &qword_2549E85E8);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB6E8);
  v35 = v33 + *(int *)(v34 + 48);
  *(_QWORD *)v35 = 0;
  *(_BYTE *)(v35 + 8) = 1;
  sub_20DD8516C((uint64_t)v8, v33 + *(int *)(v34 + 64), &qword_2549EB6D0);
  sub_20DD851D0(v31, &qword_2549EB6D0);
  sub_20DD851D0((uint64_t)v15, &qword_2549E85E8);
  sub_20DD851D0((uint64_t)v8, &qword_2549EB6D0);
  return sub_20DD851D0(v32, &qword_2549E85E8);
}

uint64_t sub_20DE08F54()
{
  type metadata accessor for MostUsedListSectionAppsAndCategories();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB6A0);
  sub_20DE20A34();
  return sub_20DE20A40();
}

uint64_t sub_20DE08FF4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  char v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E85E8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v29 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB6F0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (char *)(a1 + *(int *)(type metadata accessor for MostUsedListSectionAppsAndCategories() + 24));
  v12 = *v11;
  v13 = *((_QWORD *)v11 + 1);
  LOBYTE(v30) = v12;
  v31 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB6A0);
  sub_20DE20A34();
  if ((v34 & 1) != 0)
  {
    sub_20DE2065C();
    v14 = objc_msgSend((id)objc_opt_self(), sel_bundle);
    v15 = sub_20DE20854();
    v17 = v16;
    v30 = v15;
    v31 = v16;
    v19 = v18 & 1;
    v32 = v18 & 1;
    v33 = v20;
    sub_20DE20920();
    sub_20DD851C0(v15, v17, v19);
    swift_bridgeObjectRelease();
    sub_20DD8516C((uint64_t)v4, (uint64_t)v10, &qword_2549E85E8);
    swift_storeEnumTagMultiPayload();
    sub_20DD9D690();
    sub_20DE206B0();
    v7 = v4;
  }
  else
  {
    sub_20DE2065C();
    v21 = objc_msgSend((id)objc_opt_self(), sel_bundle);
    v22 = sub_20DE20854();
    v24 = v23;
    v30 = v22;
    v31 = v23;
    v26 = v25 & 1;
    v32 = v25 & 1;
    v33 = v27;
    sub_20DE20920();
    sub_20DD851C0(v22, v24, v26);
    swift_bridgeObjectRelease();
    sub_20DD8516C((uint64_t)v7, (uint64_t)v10, &qword_2549E85E8);
    swift_storeEnumTagMultiPayload();
    sub_20DD9D690();
    sub_20DE206B0();
  }
  return sub_20DD851D0((uint64_t)v7, &qword_2549E85E8);
}

uint64_t sub_20DE093AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB6C0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *a2;
  v8 = sub_20DE1FC48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, a1, v8);
  *(_QWORD *)&v6[*(int *)(v4 + 48)] = v7;
  swift_bridgeObjectRetain();
  v9 = sub_20DDC117C((uint64_t)v6);
  sub_20DD851D0((uint64_t)v6, &qword_2549EB6C0);
  return v9 & 1;
}

uint64_t sub_20DE09484(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)@<X0>(uint64_t@<X8>);
  double (*v7)@<D0>(uint64_t@<X8>);
  _QWORD *v8;
  char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t (*v13)@<X0>(uint64_t@<X8>);
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char isUniquelyReferenced_nonNull_native;
  char v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  char v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  char v36;
  char v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t result;
  double (*v46)@<D0>(uint64_t@<X8>);
  uint64_t v47;
  _BYTE v48[16];
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[19];
  uint64_t v53[3];
  __int128 v54;
  uint64_t v55;
  char v56;
  char v57;
  char v58;

  v49 = a2;
  swift_bridgeObjectRetain();
  v3 = sub_20DDA2048((uint64_t)sub_20DE0BF1C, (uint64_t)v48, a1);
  swift_bridgeObjectRelease();
  v4 = sub_20DE083FC(v3);
  swift_release();
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    v6 = 0;
    v7 = 0;
    v8 = (_QWORD *)MEMORY[0x24BEE4B00];
    v9 = (char *)(v4 + 32);
    v46 = sub_20DE09CAC;
    while (1)
    {
      v47 = v5;
      v15 = *((_OWORD *)v9 + 1);
      v14 = *((_OWORD *)v9 + 2);
      v16 = *(_OWORD *)v9;
      *(_DWORD *)&v52[15] = *(_DWORD *)(v9 + 47);
      v51 = v15;
      *(_OWORD *)v52 = v14;
      v50 = v16;
      v17 = v16;
      v18 = swift_allocObject();
      memmove((void *)(v18 + 16), v9, 0x33uLL);
      sub_20DDA5B3C((uint64_t)&v50);
      sub_20DDA5B3C((uint64_t)&v50);
      swift_bridgeObjectRetain();
      sub_20DD938EC((uint64_t)v6);
      v19 = swift_allocObject();
      *(_QWORD *)(v19 + 16) = sub_20DE09C94;
      *(_QWORD *)(v19 + 24) = v18;
      v20 = v19;
      sub_20DD938EC((uint64_t)v7);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v53[0] = (uint64_t)v8;
      v23 = sub_20DD9DDF0(v17, *((uint64_t *)&v17 + 1));
      v24 = v8[2];
      v25 = (v22 & 1) == 0;
      v26 = v24 + v25;
      if (__OFADD__(v24, v25))
        break;
      v27 = v22;
      if (v8[3] >= v26)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_20DDA1A00();
          v8 = (_QWORD *)v53[0];
        }
      }
      else
      {
        sub_20DD9FE74(v26, isUniquelyReferenced_nonNull_native);
        v8 = (_QWORD *)v53[0];
        v28 = sub_20DD9DDF0(v17, *((uint64_t *)&v17 + 1));
        if ((v27 & 1) != (v29 & 1))
          goto LABEL_18;
        v23 = v28;
      }
      swift_bridgeObjectRelease();
      if ((v27 & 1) != 0)
      {
        v10 = 56 * v23;
      }
      else
      {
        v30 = swift_bridgeObjectRetain();
        (*(void (**)(uint64_t *__return_ptr, uint64_t))(v20 + 16))(v53, v30);
        v31 = v53[0];
        v32 = v53[1];
        v33 = v53[2];
        v34 = v54;
        v35 = v55;
        v36 = v56 & 1;
        v37 = v57 & 1;
        v38 = v58 & 1;
        v8[(v23 >> 6) + 8] |= 1 << v23;
        *(_OWORD *)(v8[6] + 16 * v23) = v17;
        v10 = 56 * v23;
        v39 = v8[7] + 56 * v23;
        *(_QWORD *)v39 = v31;
        *(_QWORD *)(v39 + 8) = v32;
        *(_QWORD *)(v39 + 16) = v33;
        *(_OWORD *)(v39 + 24) = v34;
        *(_QWORD *)(v39 + 40) = v35;
        *(_BYTE *)(v39 + 48) = v36;
        *(_BYTE *)(v39 + 49) = v37;
        *(_BYTE *)(v39 + 50) = v38;
        v40 = v8[2];
        v41 = __OFADD__(v40, 1);
        v42 = v40 + 1;
        if (v41)
          goto LABEL_17;
        v8[2] = v42;
      }
      swift_bridgeObjectRetain();
      v11 = *(double *)&v51;
      v12 = v8[7];
      swift_bridgeObjectRelease();
      *(double *)(v12 + v10 + 16) = v11 + *(double *)(v12 + v10 + 16);
      sub_20DDA5BDC((uint64_t)&v50);
      swift_bridgeObjectRelease();
      v9 += 56;
      v13 = sub_20DE09C94;
      v6 = sub_20DE09C94;
      v7 = sub_20DE09CAC;
      v5 = v47 - 1;
      if (v47 == 1)
        goto LABEL_15;
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    sub_20DE20F14();
    __break(1u);
    result = swift_release();
    __break(1u);
  }
  else
  {
    v13 = 0;
    v46 = 0;
    v8 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_15:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain_n();
    v43 = sub_20DD8D9F8((uint64_t)v8);
    swift_bridgeObjectRelease();
    v53[0] = (uint64_t)v43;
    sub_20DE0BC10(v53, (uint64_t)&unk_24C880540);
    swift_bridgeObjectRelease();
    v44 = v53[0];
    swift_bridgeObjectRelease();
    sub_20DD938EC((uint64_t)v13);
    sub_20DD938EC((uint64_t)v46);
    return v44;
  }
  return result;
}

double sub_20DE09850@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_20DE08AF0(a1, *(double *)(v1 + 24));
}

unint64_t sub_20DE0985C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2549EB6B0;
  if (!qword_2549EB6B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549EB698);
    result = MEMORY[0x212BB5FE0](MEMORY[0x24BDF4498], v1);
    atomic_store(result, (unint64_t *)&qword_2549EB6B0);
  }
  return result;
}

uint64_t sub_20DE098A8(uint64_t a1, uint64_t *a2)
{
  return sub_20DE093AC(a1, a2) & 1;
}

uint64_t sub_20DE098C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_BYTE *)(a1 + 48);
  *(_QWORD *)a2 = *(_QWORD *)a1;
  *(_QWORD *)(a2 + 8) = v2;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = v4;
  *(_QWORD *)(a2 + 40) = v5;
  *(_BYTE *)(a2 + 48) = v6;
  *(_WORD *)(a2 + 49) = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t sub_20DE09914@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  *a3 = *(double *)(a2 + 16) < *(double *)(result + 16);
  return result;
}

uint64_t sub_20DE0992C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_20DDB7EC8(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[7 * v8 + 4];
  if (a1 + 32 < v9 + 56 * v2 && v9 < a1 + 32 + 56 * v2)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_20DE20ECC();
  __break(1u);
  return result;
}

uint64_t sub_20DE09A84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MostUsedListSectionAppsAndCategories();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20DE09AC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for MostUsedListSectionAppsAndCategories();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v3 + 16);
  __swift_destroy_boxed_opaque_existential_1(v3 + 56);
  v4 = v3 + *(int *)(v1 + 20);
  v5 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20DE09B7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MostUsedListSectionAppsAndCategories();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20DE09BC0()
{
  type metadata accessor for MostUsedListSectionAppsAndCategories();
  return sub_20DE08F54();
}

uint64_t sub_20DE09BEC()
{
  uint64_t v0;

  return sub_20DE08FF4(*(_QWORD *)(v0 + 16));
}

unint64_t sub_20DE09BF4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549EB6E0;
  if (!qword_2549EB6E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549EB6D8);
    v2[0] = sub_20DD9D690();
    v2[1] = v2[0];
    result = MEMORY[0x212BB5FE0](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549EB6E0);
  }
  return result;
}

uint64_t sub_20DE09C60()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20DE09C94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_20DE098C4(v1 + 16, a1);
}

uint64_t sub_20DE09C9C()
{
  return swift_deallocObject();
}

double sub_20DE09CAC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v3;
  double result;
  _OWORD v5[2];
  double v6[3];

  (*(void (**)(_OWORD *__return_ptr))(v1 + 16))(v5);
  v3 = v5[1];
  *(_OWORD *)a1 = v5[0];
  *(_OWORD *)(a1 + 16) = v3;
  result = v6[0];
  *(_OWORD *)(a1 + 32) = *(_OWORD *)v6;
  *(_DWORD *)(a1 + 47) = *(_DWORD *)((char *)&v6[1] + 7);
  return result;
}

uint64_t sub_20DE09CF8(char *a1, char *__src, unint64_t a3, char *__dst, uint64_t a5)
{
  char *v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD *__return_ptr, _QWORD, _QWORD);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  char v25;
  void (*v26)(char *__return_ptr, uint64_t *, uint64_t *);
  void (*v27)(_QWORD *__return_ptr, _QWORD, _QWORD);
  void (*v28)(char *__return_ptr, uint64_t *, uint64_t *);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *__return_ptr, uint64_t *, uint64_t *);
  void (*v34)(char *__return_ptr, uint64_t *, uint64_t *);
  char *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(_QWORD *__return_ptr, _QWORD, _QWORD);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(_QWORD *__return_ptr, _QWORD, _QWORD);
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;
  void (*v61)(_QWORD *__return_ptr, _QWORD, _QWORD);
  void (*v62)(char *__return_ptr, uint64_t *, uint64_t *);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(_QWORD *__return_ptr, _QWORD, _QWORD);
  void (*v69)(char *__return_ptr, uint64_t *, uint64_t *);
  char *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t result;
  char *v78;
  char *v79;
  char *v80;
  unint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  char *v87;
  char *__srcb;
  unint64_t v90;
  char *v91;
  char *v92;
  char *v93;
  char v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char v100;
  char v101;
  uint64_t v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  char v106;
  char v107;
  char v108;
  uint64_t v109;
  char v110;
  uint64_t v111;
  uint64_t v112;
  char v113;
  uint64_t v114;
  char v115;
  char v116;
  char v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void (*v122)(char *__return_ptr, uint64_t *, uint64_t *);
  uint64_t v123;
  char v124;
  char v125;
  char v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void (*v131)(char *__return_ptr, uint64_t *, uint64_t *);
  uint64_t v132;
  char v133;
  char v134;
  char v135;
  char *v136;
  char *v137;
  char *v138;
  void (*v139)(char *__return_ptr, uint64_t *, uint64_t *);

  v5 = __dst;
  v6 = a3;
  v7 = __src;
  v8 = __src - a1;
  v9 = (__src - a1) / 56;
  v10 = a3 - (_QWORD)__src;
  v11 = (uint64_t)(a3 - (_QWORD)__src) / 56;
  v138 = a1;
  v137 = __dst;
  if (v9 >= v11)
  {
    if (v10 >= -55)
    {
      v42 = 56 * v11;
      if (__dst != __src || &__src[v42] <= __dst)
        memmove(__dst, __src, 56 * v11);
      v43 = &v5[v42];
      v136 = &v5[v42];
      v138 = v7;
      v44 = a1;
      if (v10 >= 56 && a1 < v7)
      {
        v45 = *(_QWORD *)(a5 + 16);
        v85 = v45;
        v87 = v5;
        while (1)
        {
          v46 = v6 - 56;
          v47 = (unint64_t)(v43 - 56);
          if (!v45)
            goto LABEL_45;
          v112 = *((_QWORD *)v43 - 7);
          v79 = v43 - 56;
          v81 = v6 - 56;
          v91 = (char *)v6;
          v93 = v7;
          v48 = *((_QWORD *)v43 - 6);
          v49 = *((_QWORD *)v43 - 5);
          v51 = *((_QWORD *)v43 - 4);
          v50 = (void (*)(_QWORD *__return_ptr, _QWORD, _QWORD))*((_QWORD *)v43 - 3);
          v52 = *((_QWORD *)v7 - 6);
          v114 = *((_QWORD *)v7 - 7);
          v53 = *((_QWORD *)v43 - 2);
          v54 = *((_QWORD *)v7 - 5);
          v55 = *((_QWORD *)v7 - 4);
          v56 = (void (*)(_QWORD *__return_ptr, _QWORD, _QWORD))*((_QWORD *)v7 - 3);
          v78 = v7 - 56;
          v57 = *((_QWORD *)v7 - 2);
          v116 = *(v7 - 6);
          v108 = *(v7 - 8);
          v110 = *(v7 - 7);
          v58 = *(v43 - 6);
          v59 = *(v43 - 7);
          v83 = v43;
          v106 = *(v43 - 8);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_retain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_retain();
          v60 = v116;
          v61 = v50;
          v62 = v56;
          v63 = v53;
          v64 = a5 + 40;
          v65 = v85;
          v102 = v51;
          v104 = v55;
          v100 = v59;
          v96 = v48;
          while (1)
          {
            v98 = v65;
            v139 = *(void (**)(char *__return_ptr, uint64_t *, uint64_t *))(v64 - 8);
            v127 = v112;
            v128 = v48;
            v129 = v49;
            v130 = v51;
            v131 = v61;
            v132 = v63;
            v133 = v106;
            v134 = v59;
            v135 = v58;
            v66 = v58;
            v118 = v114;
            v119 = v52;
            v120 = v54;
            v121 = v55;
            v122 = (void (*)(char *__return_ptr, uint64_t *, uint64_t *))v62;
            v123 = v57;
            v124 = v108;
            v125 = v110;
            v126 = v60;
            v67 = v63;
            v68 = v62;
            v69 = v61;
            swift_retain();
            v48 = v96;
            v139(&v117, &v127, &v118);
            if ((v117 & 1) != 0)
              break;
            v127 = v114;
            v128 = v52;
            v129 = v54;
            v130 = v104;
            v131 = v68;
            v132 = v57;
            v133 = v108;
            v134 = v110;
            v135 = v116;
            v118 = v112;
            v119 = v96;
            v120 = v49;
            v121 = v102;
            v122 = (void (*)(char *__return_ptr, uint64_t *, uint64_t *))v69;
            v123 = v67;
            v124 = v106;
            v125 = v100;
            v126 = v66;
            v139(&v117, &v127, &v118);
            if (v117 == 1)
              break;
            swift_release();
            v64 += 16;
            v65 = v98 - 1;
            v62 = v68;
            v61 = v69;
            v63 = v67;
            v60 = v116;
            v51 = v102;
            v55 = v104;
            v58 = v66;
            v59 = v100;
            if (v98 == 1)
            {
              swift_release();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_release();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v5 = v87;
              v44 = a1;
              v6 = (unint64_t)v91;
              v7 = v93;
              v43 = v83;
              v45 = v85;
              v47 = (unint64_t)v79;
              v46 = v81;
              goto LABEL_45;
            }
          }
          swift_bridgeObjectRelease();
          v127 = v112;
          v128 = v96;
          v129 = v49;
          v130 = v102;
          v131 = v69;
          v132 = v67;
          v133 = v106;
          v134 = v100;
          v135 = v66;
          v118 = v114;
          v119 = v52;
          v120 = v54;
          v121 = v104;
          v122 = (void (*)(char *__return_ptr, uint64_t *, uint64_t *))v68;
          v123 = v57;
          v124 = v108;
          v125 = v110;
          v126 = v116;
          v139(&v117, &v127, &v118);
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          v5 = v87;
          v44 = a1;
          v6 = (unint64_t)v91;
          v7 = v93;
          v43 = v83;
          v45 = v85;
          v47 = (unint64_t)v79;
          v46 = v81;
          if ((v117 & 1) != 0)
          {
            v70 = v78;
            if (v91 != v93 || v81 >= (unint64_t)v93)
            {
              v71 = *(_OWORD *)v78;
              v72 = *((_OWORD *)v78 + 1);
              v73 = *((_OWORD *)v78 + 2);
              *(_QWORD *)(v81 + 48) = *((_QWORD *)v78 + 6);
              *(_OWORD *)(v81 + 16) = v72;
              *(_OWORD *)(v81 + 32) = v73;
              *(_OWORD *)v81 = v71;
            }
            v138 = v78;
            if (v83 <= v87)
              goto LABEL_51;
          }
          else
          {
LABEL_45:
            v136 = (char *)v47;
            if (v6 < (unint64_t)v43 || v46 >= (unint64_t)v43 || (char *)v6 != v43)
            {
              v74 = *(_OWORD *)v47;
              v75 = *(_OWORD *)(v47 + 16);
              v76 = *(_OWORD *)(v47 + 32);
              *(_QWORD *)(v46 + 48) = *(_QWORD *)(v47 + 48);
              *(_OWORD *)(v46 + 16) = v75;
              *(_OWORD *)(v46 + 32) = v76;
              *(_OWORD *)v46 = v74;
            }
            v70 = v7;
            v43 = (char *)v47;
            if (v47 <= (unint64_t)v5)
              goto LABEL_51;
          }
          v7 = v70;
          v6 = v46;
          if (v70 <= v44)
            goto LABEL_51;
        }
      }
      goto LABEL_51;
    }
  }
  else if (v8 >= -55)
  {
    v12 = 56 * v9;
    v13 = a1;
    if (__dst != a1 || &a1[v12] <= __dst)
      memmove(__dst, a1, v12);
    v80 = &v5[v12];
    v136 = &v5[v12];
    if (v8 >= 56 && (unint64_t)v7 < v6)
    {
      v14 = *(_QWORD *)(a5 + 16);
      v90 = v6;
      v84 = v14;
      do
      {
        if (!v14)
          goto LABEL_20;
        __srcb = v13;
        v15 = *(_QWORD *)v7;
        v16 = *((_QWORD *)v7 + 1);
        v17 = *((_QWORD *)v7 + 2);
        v18 = (void (*)(_QWORD *__return_ptr, _QWORD, _QWORD))*((_QWORD *)v7 + 4);
        v19 = *((_QWORD *)v7 + 5);
        v20 = *(_QWORD *)v5;
        v82 = *((_QWORD *)v5 + 1);
        v21 = *((_QWORD *)v5 + 2);
        v109 = *((_QWORD *)v7 + 3);
        v111 = *((_QWORD *)v5 + 3);
        v22 = *((_QWORD *)v5 + 5);
        v139 = (void (*)(char *__return_ptr, uint64_t *, uint64_t *))*((_QWORD *)v5 + 4);
        v115 = v5[50];
        v113 = v5[49];
        v86 = v5;
        v95 = v5[48];
        v23 = v7[50];
        v24 = v7[49];
        v92 = v7;
        v25 = v7[48];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        swift_bridgeObjectRetain();
        v26 = v139;
        swift_bridgeObjectRetain();
        swift_retain();
        swift_bridgeObjectRetain();
        v27 = v18;
        v28 = v26;
        v29 = v22;
        v30 = a5 + 40;
        v31 = v84;
        v107 = v25;
        v105 = v20;
        v103 = v24;
        v101 = v23;
        v99 = v15;
        while (1)
        {
          v97 = v31;
          v139 = *(void (**)(char *__return_ptr, uint64_t *, uint64_t *))(v30 - 8);
          v127 = v15;
          v128 = v16;
          v129 = v17;
          v130 = v109;
          v131 = v27;
          v132 = v19;
          v133 = v25;
          v134 = v24;
          v135 = v23;
          v118 = v20;
          v119 = v82;
          v120 = v21;
          v121 = v111;
          v122 = v28;
          v123 = v29;
          v124 = v95;
          v125 = v113;
          v126 = v115;
          v32 = v29;
          v33 = v27;
          v34 = v28;
          swift_retain();
          v139(&v117, &v127, &v118);
          if ((v117 & 1) != 0)
            break;
          v127 = v105;
          v128 = v82;
          v129 = v21;
          v130 = v111;
          v131 = (void (*)(_QWORD *__return_ptr, _QWORD, _QWORD))v34;
          v132 = v32;
          v133 = v95;
          v134 = v113;
          v135 = v115;
          v118 = v99;
          v119 = v16;
          v120 = v17;
          v121 = v109;
          v122 = (void (*)(char *__return_ptr, uint64_t *, uint64_t *))v33;
          v123 = v19;
          v124 = v107;
          v125 = v103;
          v126 = v101;
          v139(&v117, &v127, &v118);
          if (v117 == 1)
            break;
          swift_release();
          v30 += 16;
          v31 = v97 - 1;
          v28 = v34;
          v29 = v32;
          v27 = v33;
          v20 = v105;
          v15 = v99;
          v23 = v101;
          v24 = v103;
          v25 = v107;
          if (v97 == 1)
          {
            swift_release();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_release();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v5 = v86;
            v13 = __srcb;
            v6 = v90;
            v7 = v92;
            v14 = v84;
            goto LABEL_20;
          }
        }
        swift_bridgeObjectRelease();
        v127 = v99;
        v128 = v16;
        v129 = v17;
        v130 = v109;
        v131 = v33;
        v132 = v19;
        v133 = v107;
        v134 = v103;
        v135 = v101;
        v118 = v105;
        v119 = v82;
        v120 = v21;
        v121 = v111;
        v122 = v34;
        v123 = v32;
        v124 = v95;
        v125 = v113;
        v126 = v115;
        v139(&v117, &v127, &v118);
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        v5 = v86;
        v13 = __srcb;
        v6 = v90;
        v7 = v92;
        v14 = v84;
        if ((v117 & 1) != 0)
        {
          v35 = v92 + 56;
          if (__srcb < v92 || __srcb >= v35 || __srcb != v92)
          {
            v36 = *(_OWORD *)v92;
            v37 = *((_OWORD *)v92 + 1);
            v38 = *((_OWORD *)v92 + 2);
            *((_QWORD *)__srcb + 6) = *((_QWORD *)v92 + 6);
            *((_OWORD *)__srcb + 1) = v37;
            *((_OWORD *)__srcb + 2) = v38;
            *(_OWORD *)__srcb = v36;
          }
        }
        else
        {
LABEL_20:
          if (v13 != v5)
          {
            v39 = *(_OWORD *)v5;
            v40 = *((_OWORD *)v5 + 1);
            v41 = *((_OWORD *)v5 + 2);
            *((_QWORD *)v13 + 6) = *((_QWORD *)v5 + 6);
            *((_OWORD *)v13 + 1) = v40;
            *((_OWORD *)v13 + 2) = v41;
            *(_OWORD *)v13 = v39;
          }
          v5 += 56;
          v137 = v5;
          v35 = v7;
        }
        v13 += 56;
        if (v5 >= v80)
          break;
        v7 = v35;
      }
      while ((unint64_t)v35 < v6);
      v138 = v13;
    }
LABEL_51:
    sub_20DD9E348((void **)&v138, (const void **)&v137, &v136);
    return 1;
  }
  swift_bridgeObjectRelease();
  result = sub_20DE20ECC();
  __break(1u);
  return result;
}

uint64_t sub_20DE0A660(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t *v6;
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
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  char v26;
  char v27;
  char v28;
  __int128 v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t *__return_ptr, uint64_t *, uint64_t *);
  uint64_t v42;
  char v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  char v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  char v67;
  char v68;
  int v69;
  uint64_t v70;

  v31 = result;
  v33 = a3;
  if (a3 != a2)
  {
    v37 = *a4;
    v34 = *(_QWORD *)(a5 + 16);
    v32 = a5 + 40;
    do
    {
      if (v34)
      {
        v5 = v33;
        do
        {
          v6 = (uint64_t *)(v37 + 56 * v5);
          v8 = *v6;
          v7 = v6[1];
          v38 = v5 - 1;
          v9 = v6[2];
          v10 = v6[4];
          v50 = v6[3];
          v11 = v6[5];
          v69 = *((unsigned __int8 *)v6 + 48);
          v48 = *((_BYTE *)v6 + 50);
          v49 = *((_BYTE *)v6 + 49);
          v35 = v6 - 7;
          v36 = v6;
          v12 = *(v6 - 6);
          v13 = *(v6 - 5);
          v14 = *(v6 - 3);
          v46 = *(v6 - 4);
          v47 = *(v6 - 7);
          v15 = *(v6 - 2);
          v44 = *((_BYTE *)v6 - 7);
          v45 = *((_BYTE *)v6 - 8);
          v43 = *((_BYTE *)v6 - 6);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_retain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_retain();
          swift_bridgeObjectRetain();
          v16 = v14;
          v17 = v32;
          v18 = v34;
          v42 = v15;
          v39 = v7;
          while (1)
          {
            v40 = v18;
            v41 = *(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t *))(v17 - 8);
            v60 = v8;
            v61 = v7;
            v62 = v9;
            v63 = v50;
            v64 = v10;
            v65 = v11;
            v66 = v69;
            v67 = v49;
            v68 = v48;
            v51 = v47;
            v52 = v12;
            v53 = v13;
            v54 = v46;
            v55 = v16;
            v56 = v15;
            v57 = v45;
            v58 = v44;
            v59 = v43;
            v19 = v16;
            swift_retain();
            v20 = v19;
            v7 = v39;
            v41(&v70, &v60, &v51);
            if ((v70 & 1) != 0)
              break;
            v60 = v47;
            v61 = v12;
            v62 = v13;
            v63 = v46;
            v64 = v20;
            v65 = v42;
            v66 = v45;
            v67 = v44;
            v68 = v43;
            v51 = v8;
            v52 = v39;
            v53 = v9;
            v54 = v50;
            v55 = v10;
            v56 = v11;
            v57 = v69;
            v58 = v49;
            v59 = v48;
            v41(&v70, &v60, &v51);
            if (v70 == 1)
              break;
            swift_release();
            v17 += 16;
            v18 = v40 - 1;
            v16 = v20;
            v15 = v42;
            if (v40 == 1)
            {
              swift_release();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_release();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              result = swift_bridgeObjectRelease();
              goto LABEL_4;
            }
          }
          swift_bridgeObjectRelease();
          v60 = v8;
          v61 = v39;
          v62 = v9;
          v63 = v50;
          v64 = v10;
          v65 = v11;
          v66 = v69;
          v67 = v49;
          v68 = v48;
          v51 = v47;
          v52 = v12;
          v53 = v13;
          v54 = v46;
          v55 = v20;
          v56 = v42;
          v57 = v45;
          v58 = v44;
          v59 = v43;
          v41(&v70, &v60, &v51);
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          result = swift_release();
          v5 = v38;
          if ((v70 & 1) == 0)
            break;
          if (!v37)
          {
            __break(1u);
            return result;
          }
          v21 = *v36;
          v22 = v36[1];
          v23 = v36[2];
          v24 = *(_OWORD *)(v36 + 3);
          v25 = v36[5];
          v26 = *((_BYTE *)v36 + 48);
          v27 = *((_BYTE *)v36 + 49);
          v28 = *((_BYTE *)v36 + 50);
          v29 = *((_OWORD *)v35 + 1);
          *(_OWORD *)v36 = *(_OWORD *)v35;
          *((_OWORD *)v36 + 1) = v29;
          *((_OWORD *)v36 + 2) = *((_OWORD *)v35 + 2);
          v36[6] = v35[6];
          *v35 = v21;
          v35[1] = v22;
          v35[2] = v23;
          *(_OWORD *)(v35 + 3) = v24;
          v35[5] = v25;
          *((_BYTE *)v35 + 48) = v26;
          *((_BYTE *)v35 + 49) = v27;
          *((_BYTE *)v35 + 50) = v28;
        }
        while (v38 != v31);
      }
LABEL_4:
      ++v33;
    }
    while (v33 != a2);
  }
  return result;
}

uint64_t sub_20DE0AA80(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
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
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t *__return_ptr, uint64_t *, uint64_t *);
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
  int v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t *__return_ptr, uint64_t *, uint64_t *);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  char v61;
  char v62;
  char v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
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
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  uint64_t v86;
  char v87;
  char v88;
  char v89;
  __int128 v90;
  unint64_t v91;
  unint64_t v92;
  char *v93;
  char *v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  BOOL v106;
  unint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  BOOL v116;
  uint64_t v117;
  char v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  BOOL v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  char *v135;
  char *v136;
  uint64_t v137;
  unint64_t v138;
  char *v139;
  uint64_t v140;
  char *v141;
  char *v142;
  unint64_t v143;
  unint64_t v144;
  char *v145;
  uint64_t result;
  uint64_t v147;
  unint64_t v148;
  uint64_t v149;
  uint64_t v150;
  char *v151;
  char *v152;
  unint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  int v159;
  uint64_t v160;
  char *__dst;
  uint64_t v162;
  char v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  char *v168;
  char *v169;
  char v170;
  char v171;
  uint64_t v172;
  char v173;
  char v174;
  uint64_t v175;
  uint64_t v176;
  char v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  char v187;
  char v188;
  uint64_t v189;
  char v190;
  char v191;
  char v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  char v199;
  uint64_t v200;
  uint64_t v201;
  char v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  char v208;
  uint64_t v209;
  uint64_t v210;
  char v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  void (*v218)(uint64_t *__return_ptr, uint64_t *, uint64_t *);
  char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  char v226;
  char v227;
  char v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  char v235;
  char v236;
  char v237;
  int v238;
  uint64_t v239;

  v4 = a1[1];
  swift_bridgeObjectRetain_n();
  v5 = sub_20DE20ED8();
  if (v5 >= v4)
  {
    if (v4 < 0)
      goto LABEL_161;
    if (!v4)
      return swift_bridgeObjectRelease_n();
    swift_bridgeObjectRetain();
    sub_20DE0A660(0, v4, 1, a1, a2);
    if (!v2)
      return swift_bridgeObjectRelease_n();
LABEL_138:
    swift_bridgeObjectRelease_n();
    return swift_bridgeObjectRelease();
  }
  v156 = v5;
  if (v4 >= 0)
    v6 = v4;
  else
    v6 = v4 + 1;
  if (v4 < -1)
    goto LABEL_169;
  v165 = v2;
  v154 = a1;
  if (v4 < 2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v4 != 1)
    {
      v13 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v12 = (char *)MEMORY[0x24BEE4AF8];
LABEL_125:
      v169 = v12;
      v155 = v9;
      if (v13 >= 2)
      {
        v147 = *v154;
        do
        {
          v148 = v13 - 2;
          if (v13 < 2)
            goto LABEL_156;
          if (!v147)
            goto LABEL_168;
          v149 = *(_QWORD *)&v169[16 * v148 + 32];
          v150 = *(_QWORD *)&v169[16 * v13 + 24];
          v151 = (char *)(v147 + 56 * *(_QWORD *)&v169[16 * v13 + 16]);
          swift_bridgeObjectRetain();
          sub_20DE09CF8((char *)(v147 + 56 * v149), v151, v147 + 56 * v150, __dst, a2);
          if (v165)
            goto LABEL_137;
          swift_bridgeObjectRelease();
          if (v150 < v149)
            goto LABEL_157;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v169 = sub_20DD9E518((uint64_t)v169);
          if (v148 >= *((_QWORD *)v169 + 2))
            goto LABEL_158;
          v152 = &v169[16 * v148 + 32];
          *(_QWORD *)v152 = v149;
          *((_QWORD *)v152 + 1) = v150;
          v153 = *((_QWORD *)v169 + 2);
          if (v13 > v153)
            goto LABEL_159;
          memmove(&v169[16 * v13 + 16], &v169[16 * v13 + 32], 16 * (v153 - v13));
          *((_QWORD *)v169 + 2) = v153 - 1;
          v13 = v153 - 1;
        }
        while (v153 > 2);
      }
      swift_bridgeObjectRelease();
      *(_QWORD *)(v155 + 16) = 0;
      swift_bridgeObjectRelease_n();
      return swift_bridgeObjectRelease();
    }
    v155 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v7 = v6 >> 1;
    v8 = sub_20DE20D4C();
    *(_QWORD *)(v8 + 16) = v7;
    v155 = v8;
    __dst = (char *)(v8 + 32);
  }
  v10 = 0;
  v11 = *a1;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v158 = v4;
  v166 = v11;
  while (1)
  {
    v162 = v10;
    v14 = v10 + 1;
    v167 = v12;
    if (v10 + 1 >= v4)
      goto LABEL_51;
    v15 = *(_QWORD *)(a2 + 16);
    v157 = v15;
    if (!v15)
    {
      v32 = v10 + 2;
      if (v10 + 2 < v4)
      {
        v159 = 0;
        goto LABEL_29;
      }
LABEL_50:
      v14 = v32;
      goto LABEL_51;
    }
    v16 = v11 + 56 * v14;
    v17 = *(_QWORD *)(v16 + 8);
    v176 = *(_QWORD *)v16;
    v18 = *(_QWORD *)(v16 + 16);
    v19 = *(_QWORD *)(v16 + 32);
    v179 = *(_QWORD *)(v16 + 24);
    v182 = v10 + 1;
    v20 = *(_QWORD *)(v16 + 40);
    v21 = v11 + 56 * v10;
    v23 = *(_QWORD *)v21;
    v22 = *(_QWORD *)(v21 + 8);
    v24 = *(_QWORD *)(v21 + 16);
    v25 = *(_QWORD *)(v21 + 24);
    v26 = *(_QWORD *)(v21 + 32);
    v27 = *(_QWORD *)(v21 + 40);
    v190 = *(_BYTE *)(v21 + 50);
    v187 = *(_BYTE *)(v21 + 49);
    v173 = *(_BYTE *)(v21 + 48);
    v170 = *(_BYTE *)(v16 + 50);
    v163 = *(_BYTE *)(v16 + 49);
    v28 = *(unsigned __int8 *)(v16 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    v215 = v26;
    swift_bridgeObjectRetain();
    v212 = v27;
    v29 = v17;
    swift_retain();
    v30 = a2 + 40;
    v206 = v19;
    v209 = v29;
    v203 = v20;
    v238 = v28;
    v197 = v23;
    v200 = v25;
    do
    {
      v193 = v15;
      v31 = *(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t *))(v30 - 8);
      v229 = v176;
      v230 = v29;
      v231 = v18;
      v232 = v179;
      v233 = v19;
      v234 = v20;
      v235 = v28;
      v236 = v163;
      v237 = v170;
      v220 = v23;
      v221 = v22;
      v222 = v24;
      v223 = v25;
      v224 = v215;
      v225 = v212;
      v226 = v173;
      v227 = v187;
      v228 = v190;
      swift_retain();
      v31(&v239, &v229, &v220);
      if ((v239 & 1) != 0)
        goto LABEL_25;
      v229 = v197;
      v230 = v22;
      v231 = v24;
      v232 = v200;
      v233 = v215;
      v234 = v212;
      v235 = v173;
      v236 = v187;
      v237 = v190;
      v220 = v176;
      v221 = v209;
      v222 = v18;
      v223 = v179;
      v224 = v206;
      v225 = v203;
      v226 = v238;
      v227 = v163;
      v228 = v170;
      v31(&v239, &v229, &v220);
      if (v239 == 1)
      {
LABEL_25:
        swift_bridgeObjectRelease();
        v229 = v176;
        v230 = v209;
        v231 = v18;
        v232 = v179;
        v233 = v206;
        v234 = v203;
        v235 = v238;
        v236 = v163;
        v237 = v170;
        v220 = v197;
        v221 = v22;
        v222 = v24;
        v223 = v200;
        v224 = v215;
        v225 = v212;
        v226 = v173;
        v227 = v187;
        v228 = v190;
        v31(&v239, &v229, &v220);
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        v159 = v239;
        v32 = v162 + 2;
        v15 = v157;
        v4 = v158;
        v11 = v166;
        v12 = v167;
        v14 = v182;
        if (v162 + 2 < v158)
          goto LABEL_29;
        goto LABEL_41;
      }
      swift_release();
      v30 += 16;
      --v15;
      v19 = v206;
      v29 = v209;
      v25 = v200;
      v20 = v203;
      v23 = v197;
      LOBYTE(v28) = v238;
    }
    while (v193 != 1);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v32 = v162 + 2;
    v4 = v158;
    if (v162 + 2 < v158)
      break;
    v14 = v162 + 2;
    v12 = v167;
LABEL_74:
    if (v14 < v162)
      goto LABEL_155;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_20DD9E194(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v92 = *((_QWORD *)v12 + 2);
    v91 = *((_QWORD *)v12 + 3);
    v13 = v92 + 1;
    v11 = v166;
    if (v92 >= v91 >> 1)
    {
      v145 = sub_20DD9E194((char *)(v91 > 1), v92 + 1, 1, v12);
      v11 = v166;
      v12 = v145;
    }
    *((_QWORD *)v12 + 2) = v13;
    v93 = v12 + 32;
    v94 = &v12[16 * v92 + 32];
    *(_QWORD *)v94 = v162;
    *((_QWORD *)v94 + 1) = v14;
    v185 = v14;
    if (v92)
    {
      v168 = v12;
      v219 = v12 + 32;
      while (1)
      {
        v95 = v13 - 1;
        if (v13 >= 4)
        {
          v100 = &v93[16 * v13];
          v101 = *((_QWORD *)v100 - 8);
          v102 = *((_QWORD *)v100 - 7);
          v106 = __OFSUB__(v102, v101);
          v103 = v102 - v101;
          if (v106)
            goto LABEL_144;
          v105 = *((_QWORD *)v100 - 6);
          v104 = *((_QWORD *)v100 - 5);
          v106 = __OFSUB__(v104, v105);
          v98 = v104 - v105;
          v99 = v106;
          if (v106)
            goto LABEL_145;
          v107 = v13 - 2;
          v108 = &v93[16 * v13 - 32];
          v110 = *(_QWORD *)v108;
          v109 = *((_QWORD *)v108 + 1);
          v106 = __OFSUB__(v109, v110);
          v111 = v109 - v110;
          if (v106)
            goto LABEL_147;
          v106 = __OFADD__(v98, v111);
          v112 = v98 + v111;
          if (v106)
            goto LABEL_150;
          if (v112 >= v103)
          {
            v130 = &v93[16 * v95];
            v132 = *(_QWORD *)v130;
            v131 = *((_QWORD *)v130 + 1);
            v106 = __OFSUB__(v131, v132);
            v133 = v131 - v132;
            if (v106)
              goto LABEL_154;
            v123 = v98 < v133;
            goto LABEL_112;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v124 = *((_QWORD *)v12 + 4);
            v125 = *((_QWORD *)v12 + 5);
            v106 = __OFSUB__(v125, v124);
            v117 = v125 - v124;
            v118 = v106;
            goto LABEL_106;
          }
          v97 = *((_QWORD *)v12 + 4);
          v96 = *((_QWORD *)v12 + 5);
          v106 = __OFSUB__(v96, v97);
          v98 = v96 - v97;
          v99 = v106;
        }
        if ((v99 & 1) != 0)
          goto LABEL_146;
        v107 = v13 - 2;
        v113 = &v93[16 * v13 - 32];
        v115 = *(_QWORD *)v113;
        v114 = *((_QWORD *)v113 + 1);
        v116 = __OFSUB__(v114, v115);
        v117 = v114 - v115;
        v118 = v116;
        if (v116)
          goto LABEL_149;
        v119 = &v93[16 * v95];
        v121 = *(_QWORD *)v119;
        v120 = *((_QWORD *)v119 + 1);
        v106 = __OFSUB__(v120, v121);
        v122 = v120 - v121;
        if (v106)
          goto LABEL_152;
        if (__OFADD__(v117, v122))
          goto LABEL_153;
        if (v117 + v122 >= v98)
        {
          v123 = v98 < v122;
LABEL_112:
          if (v123)
            v95 = v107;
          goto LABEL_114;
        }
LABEL_106:
        if ((v118 & 1) != 0)
          goto LABEL_148;
        v126 = &v93[16 * v95];
        v128 = *(_QWORD *)v126;
        v127 = *((_QWORD *)v126 + 1);
        v106 = __OFSUB__(v127, v128);
        v129 = v127 - v128;
        if (v106)
          goto LABEL_151;
        if (v129 < v117)
          goto LABEL_16;
LABEL_114:
        v134 = v95 - 1;
        if (v95 - 1 >= v13)
        {
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
LABEL_155:
          __break(1u);
LABEL_156:
          __break(1u);
LABEL_157:
          __break(1u);
LABEL_158:
          __break(1u);
LABEL_159:
          __break(1u);
LABEL_160:
          __break(1u);
LABEL_161:
          __break(1u);
LABEL_162:
          __break(1u);
          goto LABEL_163;
        }
        if (!v11)
          goto LABEL_165;
        v135 = &v93[16 * v134];
        v136 = v93;
        v137 = *(_QWORD *)v135;
        v138 = v95;
        v139 = &v136[16 * v95];
        v140 = *((_QWORD *)v139 + 1);
        v141 = (char *)(v11 + 56 * *(_QWORD *)v135);
        v142 = (char *)(v11 + 56 * *(_QWORD *)v139);
        v143 = v11 + 56 * v140;
        swift_bridgeObjectRetain();
        sub_20DE09CF8(v141, v142, v143, __dst, a2);
        if (v165)
        {
LABEL_137:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          *(_QWORD *)(v155 + 16) = 0;
          goto LABEL_138;
        }
        swift_bridgeObjectRelease();
        if (v140 < v137)
          goto LABEL_141;
        v12 = v168;
        if (v138 > *((_QWORD *)v168 + 2))
          goto LABEL_142;
        *(_QWORD *)v135 = v137;
        v93 = v219;
        *(_QWORD *)&v219[16 * v134 + 8] = v140;
        v144 = *((_QWORD *)v168 + 2);
        if (v138 >= v144)
          goto LABEL_143;
        v165 = 0;
        v13 = v144 - 1;
        memmove(v139, v139 + 16, 16 * (v144 - 1 - v138));
        *((_QWORD *)v168 + 2) = v144 - 1;
        v11 = v166;
        if (v144 <= 2)
          goto LABEL_16;
      }
    }
    v13 = 1;
LABEL_16:
    v4 = v158;
    v10 = v185;
    if (v185 >= v158)
    {
      v9 = v155;
      goto LABEL_125;
    }
  }
  v159 = 0;
  v11 = v166;
  v12 = v167;
  v14 = v182;
  v15 = v157;
LABEL_29:
  v33 = v32;
LABEL_32:
  v32 = v33;
  if (!v15)
    goto LABEL_30;
  v164 = v33;
  v34 = v11 + 56 * v33;
  v35 = *(_QWORD *)(v34 + 8);
  v36 = *(_QWORD *)(v34 + 16);
  v37 = *(_QWORD *)(v34 + 32);
  v180 = *(_QWORD *)(v34 + 24);
  v183 = *(_QWORD *)v34;
  v38 = *(_QWORD *)(v34 + 40);
  v39 = v11 + 56 * v14;
  v41 = *(_QWORD *)v39;
  v40 = *(_QWORD *)(v39 + 8);
  v42 = *(_QWORD *)(v39 + 16);
  v43 = *(_QWORD *)(v39 + 24);
  v44 = *(_QWORD *)(v39 + 32);
  v45 = *(_QWORD *)(v39 + 40);
  v191 = *(_BYTE *)(v39 + 50);
  v188 = *(_BYTE *)(v39 + 49);
  v177 = *(_BYTE *)(v39 + 48);
  v174 = *(_BYTE *)(v34 + 50);
  v171 = *(_BYTE *)(v34 + 49);
  v46 = *(unsigned __int8 *)(v34 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  v216 = v44;
  v47 = v35;
  swift_bridgeObjectRetain();
  v213 = v45;
  swift_retain();
  v48 = a2 + 40;
  v207 = v37;
  v210 = v47;
  v204 = v38;
  v238 = v46;
  v198 = v41;
  v201 = v43;
  while (1)
  {
    v194 = v15;
    v49 = *(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t *))(v48 - 8);
    v229 = v183;
    v230 = v47;
    v231 = v36;
    v232 = v180;
    v233 = v37;
    v234 = v38;
    v235 = v46;
    v236 = v171;
    v237 = v174;
    v220 = v41;
    v221 = v40;
    v222 = v42;
    v223 = v43;
    v224 = v216;
    v225 = v213;
    v226 = v177;
    v227 = v188;
    v228 = v191;
    swift_retain();
    v49(&v239, &v229, &v220);
    if ((v239 & 1) != 0)
      break;
    v229 = v198;
    v230 = v40;
    v231 = v42;
    v232 = v201;
    v233 = v216;
    v234 = v213;
    v235 = v177;
    v236 = v188;
    v237 = v191;
    v220 = v183;
    v221 = v210;
    v222 = v36;
    v223 = v180;
    v224 = v207;
    v225 = v204;
    v226 = v238;
    v227 = v171;
    v228 = v174;
    v49(&v239, &v229, &v220);
    if (v239 == 1)
      break;
    swift_release();
    v48 += 16;
    --v15;
    v37 = v207;
    v47 = v210;
    v43 = v201;
    v38 = v204;
    v41 = v198;
    LOBYTE(v46) = v238;
    if (v194 == 1)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v11 = v166;
      v12 = v167;
      v15 = v157;
      v4 = v158;
      v32 = v164;
LABEL_30:
      if ((v159 & 1) != 0)
        goto LABEL_42;
LABEL_31:
      v33 = v32 + 1;
      v14 = v32;
      if (v32 + 1 >= v4)
      {
        ++v32;
        goto LABEL_41;
      }
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRelease();
  v229 = v183;
  v230 = v210;
  v231 = v36;
  v232 = v180;
  v233 = v207;
  v234 = v204;
  v235 = v238;
  v236 = v171;
  v237 = v174;
  v220 = v198;
  v221 = v40;
  v222 = v42;
  v223 = v201;
  v224 = v216;
  v225 = v213;
  v226 = v177;
  v227 = v188;
  v228 = v191;
  v49(&v239, &v229, &v220);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v11 = v166;
  v12 = v167;
  v15 = v157;
  v4 = v158;
  v32 = v164;
  if (v159 == v239)
    goto LABEL_31;
LABEL_41:
  v14 = v32;
  if (v159)
  {
LABEL_42:
    if (v32 < v162)
      goto LABEL_164;
    if (v162 < v32)
    {
      v50 = 56 * v32;
      v51 = v32;
      v52 = v162;
      v53 = 56 * v162;
      while (1)
      {
        if (v52 != --v51)
        {
          if (!v11)
            goto LABEL_167;
          v54 = v11 + v53;
          v55 = v11 + v50;
          v56 = *(_QWORD *)(v11 + v53);
          v57 = *(_QWORD *)(v11 + v53 + 8);
          v58 = *(_QWORD *)(v11 + v53 + 16);
          v59 = *(_OWORD *)(v11 + v53 + 24);
          v60 = *(_QWORD *)(v11 + v53 + 40);
          v61 = *(_BYTE *)(v11 + v53 + 48);
          v62 = *(_BYTE *)(v11 + v53 + 49);
          v63 = *(_BYTE *)(v11 + v53 + 50);
          v64 = *(_OWORD *)(v11 + v50 - 40);
          v65 = *(_OWORD *)(v11 + v50 - 24);
          v66 = *(_OWORD *)(v11 + v50 - 56);
          *(_QWORD *)(v54 + 48) = *(_QWORD *)(v11 + v50 - 8);
          *(_OWORD *)(v54 + 16) = v64;
          *(_OWORD *)(v54 + 32) = v65;
          *(_OWORD *)v54 = v66;
          *(_QWORD *)(v55 - 56) = v56;
          *(_QWORD *)(v55 - 48) = v57;
          *(_QWORD *)(v55 - 40) = v58;
          *(_OWORD *)(v55 - 32) = v59;
          *(_QWORD *)(v55 - 16) = v60;
          *(_BYTE *)(v55 - 8) = v61;
          *(_BYTE *)(v55 - 7) = v62;
          *(_BYTE *)(v55 - 6) = v63;
        }
        ++v52;
        v50 -= 56;
        v53 += 56;
        if (v52 >= v51)
          goto LABEL_50;
      }
    }
    goto LABEL_50;
  }
LABEL_51:
  if (v14 >= v4)
    goto LABEL_74;
  if (__OFSUB__(v14, v162))
    goto LABEL_160;
  if (v14 - v162 >= v156)
    goto LABEL_74;
  v67 = v162 + v156;
  if (__OFADD__(v162, v156))
    goto LABEL_162;
  if (v67 >= v4)
    v67 = v4;
  if (v67 >= v162)
  {
    if (v14 != v67)
    {
      v172 = *(_QWORD *)(a2 + 16);
      v160 = v67;
      do
      {
        if (v172)
        {
          v68 = v14;
          v184 = v14;
          while (1)
          {
            v69 = v11 + 56 * v68;
            v70 = *(_QWORD *)(v69 + 8);
            v217 = *(_QWORD *)v69;
            v181 = v68 - 1;
            v71 = *(_QWORD *)(v69 + 16);
            v72 = *(_QWORD *)(v69 + 32);
            v214 = *(_QWORD *)(v69 + 24);
            v73 = *(_QWORD *)(v69 + 40);
            v211 = *(_BYTE *)(v69 + 48);
            v192 = *(_BYTE *)(v69 + 49);
            v208 = *(_BYTE *)(v69 + 50);
            v205 = *(_QWORD *)(v69 - 56);
            v175 = v69 - 56;
            v178 = v69;
            v74 = *(_QWORD *)(v69 - 48);
            v75 = *(_QWORD *)(v69 - 40);
            v76 = *(_QWORD *)(v69 - 24);
            v189 = *(_QWORD *)(v69 - 32);
            v77 = *(_QWORD *)(v69 - 16);
            v202 = *(_BYTE *)(v69 - 8);
            v199 = *(_BYTE *)(v69 - 7);
            v238 = *(unsigned __int8 *)(v69 - 6);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_retain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_retain();
            v78 = v76;
            v79 = a2 + 40;
            v80 = v172;
            v196 = v77;
            while (1)
            {
              v195 = v80;
              v218 = *(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t *))(v79 - 8);
              v229 = v217;
              v230 = v70;
              v231 = v71;
              v232 = v214;
              v233 = v72;
              v234 = v73;
              v235 = v211;
              v236 = v192;
              v237 = v208;
              v220 = v205;
              v221 = v74;
              v222 = v75;
              v223 = v189;
              v224 = v78;
              v225 = v77;
              v226 = v202;
              v227 = v199;
              v228 = v238;
              v81 = v78;
              swift_retain();
              v218(&v239, &v229, &v220);
              if ((v239 & 1) != 0)
                break;
              v229 = v205;
              v230 = v74;
              v231 = v75;
              v232 = v189;
              v233 = v81;
              v234 = v196;
              v235 = v202;
              v236 = v199;
              v237 = v238;
              v220 = v217;
              v221 = v70;
              v222 = v71;
              v223 = v214;
              v224 = v72;
              v225 = v73;
              v226 = v211;
              v227 = v192;
              v228 = v208;
              v218(&v239, &v229, &v220);
              if (v239 == 1)
                break;
              swift_release();
              v79 += 16;
              v80 = v195 - 1;
              v78 = v81;
              v77 = v196;
              if (v195 == 1)
              {
                swift_release();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_release();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                goto LABEL_60;
              }
            }
            swift_bridgeObjectRelease();
            v229 = v217;
            v230 = v70;
            v231 = v71;
            v232 = v214;
            v233 = v72;
            v234 = v73;
            v235 = v211;
            v236 = v192;
            v237 = v208;
            v220 = v205;
            v221 = v74;
            v222 = v75;
            v223 = v189;
            v224 = v81;
            v225 = v196;
            v226 = v202;
            v227 = v199;
            v228 = v238;
            v218(&v239, &v229, &v220);
            swift_release();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_release();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_release();
            if ((v239 & 1) == 0)
              break;
            v11 = v166;
            v12 = v167;
            v14 = v184;
            if (!v166)
              goto LABEL_166;
            v82 = *(_QWORD *)v178;
            v83 = *(_QWORD *)(v178 + 8);
            v84 = *(_QWORD *)(v178 + 16);
            v85 = *(_OWORD *)(v178 + 24);
            v86 = *(_QWORD *)(v178 + 40);
            v87 = *(_BYTE *)(v178 + 48);
            v88 = *(_BYTE *)(v178 + 49);
            v89 = *(_BYTE *)(v178 + 50);
            v90 = *(_OWORD *)(v175 + 16);
            *(_OWORD *)v178 = *(_OWORD *)v175;
            *(_OWORD *)(v178 + 16) = v90;
            *(_OWORD *)(v178 + 32) = *(_OWORD *)(v175 + 32);
            *(_QWORD *)(v178 + 48) = *(_QWORD *)(v175 + 48);
            *(_QWORD *)v175 = v82;
            *(_QWORD *)(v175 + 8) = v83;
            *(_QWORD *)(v175 + 16) = v84;
            *(_OWORD *)(v175 + 24) = v85;
            *(_QWORD *)(v175 + 40) = v86;
            *(_BYTE *)(v175 + 48) = v87;
            *(_BYTE *)(v175 + 49) = v88;
            *(_BYTE *)(v175 + 50) = v89;
            v68 = v181;
            if (v181 == v162)
              goto LABEL_61;
          }
LABEL_60:
          v11 = v166;
          v12 = v167;
          v14 = v184;
        }
LABEL_61:
        ++v14;
      }
      while (v14 != v160);
      v14 = v160;
    }
    goto LABEL_74;
  }
LABEL_163:
  __break(1u);
LABEL_164:
  __break(1u);
LABEL_165:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_166:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_167:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_168:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_169:
  swift_bridgeObjectRelease_n();
  result = sub_20DE20E90();
  __break(1u);
  return result;
}

uint64_t sub_20DE0BC10(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7[2];

  v4 = *a1;
  swift_bridgeObjectRetain_n();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v4 = sub_20DDA3E40(v4);
  v5 = *(_QWORD *)(v4 + 16);
  v7[0] = v4 + 32;
  v7[1] = v5;
  swift_bridgeObjectRetain();
  sub_20DE0AA80(v7, a2);
  swift_bridgeObjectRelease();
  *a1 = v4;
  return swift_bridgeObjectRelease_n();
}

uint64_t initializeWithCopy for MostUsedListSectionAppsAndCategories.Item(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_WORD *)(a1 + 49) = *(_WORD *)(a2 + 49);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for MostUsedListSectionAppsAndCategories.Item(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_BYTE *)(a1 + 50) = *(_BYTE *)(a2 + 50);
  return a1;
}

uint64_t assignWithTake for MostUsedListSectionAppsAndCategories.Item(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_BYTE *)(a1 + 50) = *(_BYTE *)(a2 + 50);
  return a1;
}

ValueMetadata *type metadata accessor for MostUsedListSectionAppsAndCategories.Item()
{
  return &type metadata for MostUsedListSectionAppsAndCategories.Item;
}

unint64_t sub_20DE0BE40()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2549EB6F8;
  if (!qword_2549EB6F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549EB700);
    v2 = sub_20DE0BEA4();
    result = MEMORY[0x212BB5FE0](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2549EB6F8);
  }
  return result;
}

unint64_t sub_20DE0BEA4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = qword_2549EB708;
  if (!qword_2549EB708)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549EB6B8);
    v2[0] = sub_20DE0985C();
    v2[1] = sub_20DD9D714();
    v2[2] = MEMORY[0x24BDF5138];
    result = MEMORY[0x212BB5FE0](MEMORY[0x24BDF4AF8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549EB708);
  }
  return result;
}

uint64_t sub_20DE0BF1C(uint64_t a1, uint64_t *a2)
{
  return sub_20DE098A8(a1, a2) & 1;
}

uint64_t PickupsHeaderView.Model.init(calendar:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;

  v42 = a2;
  v39 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  MEMORY[0x24BDAC7A8](v39);
  v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
  MEMORY[0x24BDAC7A8](v5);
  v35 = (uint64_t)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v41 = (char *)&v32 - v8;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v32 - v10;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v32 - v13;
  v15 = sub_20DE1FE94();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v32 - v20;
  v33 = sub_20DDD5DC4(MEMORY[0x24BEE4AF8]);
  v37 = v16;
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v43 = a1;
  v22(v21, a1, v15);
  v23 = sub_20DE1FD68();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56);
  v25(v14, 1, 1, v23);
  v38 = v21;
  v22(v18, (uint64_t)v21, v15);
  v40 = v14;
  sub_20DD95E44((uint64_t)v14, (uint64_t)v11);
  v22(v4, (uint64_t)v18, v15);
  v26 = (uint64_t)v39;
  v27 = *((int *)v39 + 9);
  sub_20DDD5DC4(MEMORY[0x24BEE4AF8]);
  v34 = &v4[*(int *)(v26 + 44)];
  v36 = v25;
  ((void (*)(void))v25)();
  swift_bridgeObjectRelease();
  v4[*(int *)(v26 + 40)] = 1;
  v39 = v4;
  *(_QWORD *)&v4[v27] = v33;
  v28 = v35;
  sub_20DD95E44((uint64_t)v11, v35);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v28, 1, v23) == 1)
  {
    v29 = (uint64_t)v41;
    sub_20DE1FD5C();
    sub_20DD851D0((uint64_t)v11, &qword_2549E7C40);
    v30 = *(void (**)(char *, uint64_t))(v37 + 8);
    v30(v18, v15);
    sub_20DD851D0(v28, &qword_2549E7C40);
  }
  else
  {
    sub_20DD851D0((uint64_t)v11, &qword_2549E7C40);
    v30 = *(void (**)(char *, uint64_t))(v37 + 8);
    v30(v18, v15);
    v29 = (uint64_t)v41;
    (*(void (**)(char *, uint64_t, uint64_t))(v24 + 32))(v41, v28, v23);
  }
  v36((char *)v29, 0, 1, v23);
  sub_20DDD6F68(v29, (uint64_t)v34);
  sub_20DD851D0((uint64_t)v40, &qword_2549E7C40);
  v30(v38, v15);
  sub_20DE0C288((uint64_t)v39, v42);
  return ((uint64_t (*)(uint64_t, uint64_t))v30)(v43, v15);
}

uint64_t sub_20DE0C288(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t PickupsHeaderView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int *v5;
  uint64_t v6;
  char *v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v17;

  v1 = v0;
  v2 = type metadata accessor for PickupsHeaderView.Model(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549EB710);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20DE0C474(v1, (uint64_t)v4);
  sub_20DE0C288((uint64_t)v4, (uint64_t)v7);
  v8 = (int *)type metadata accessor for PickupsHeaderView(0);
  v9 = *(_QWORD *)(v1 + v8[5]);
  v10 = v1 + v8[6];
  v11 = &v7[v5[10]];
  v12 = sub_20DE1FC48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v11, v10, v12);
  v13 = *(_QWORD *)(v1 + v8[7]);
  *(_QWORD *)&v7[v5[9]] = v9;
  v14 = &v7[v5[11]];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  *(_QWORD *)&v7[v5[12]] = v13;
  v15 = &v7[v5[13]];
  *(_QWORD *)v15 = sub_20DDF1D38;
  *((_QWORD *)v15 + 1) = 0;
  sub_20DE0C4CC();
  swift_bridgeObjectRetain();
  sub_20DE20920();
  return sub_20DD851D0((uint64_t)v7, &qword_2549EB710);
}

uint64_t type metadata accessor for PickupsHeaderView.Model(uint64_t a1)
{
  return sub_20DD87B48(a1, qword_2549EB810);
}

uint64_t sub_20DE0C474(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PickupsHeaderView.Model(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for PickupsHeaderView(uint64_t a1)
{
  return sub_20DD87B48(a1, qword_2549EB778);
}

unint64_t sub_20DE0C4CC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2549EB718;
  if (!qword_2549EB718)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549EB710);
    result = MEMORY[0x212BB5FE0](&protocol conformance descriptor for ChartHeaderView<A>, v1);
    atomic_store(result, (unint64_t *)&qword_2549EB718);
  }
  return result;
}

uint64_t sub_20DE0C518()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *initializeBufferWithCopyOfBuffer for PickupsHeaderView(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_20DE1FE94();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
    *(_QWORD *)((char *)a1 + v8[9]) = *(_QWORD *)((char *)a2 + v8[9]);
    *((_BYTE *)a1 + v8[10]) = *((_BYTE *)a2 + v8[10]);
    v9 = v8[11];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_20DE1FD68();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain();
    if (v14(v11, 1, v12))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    v17 = a3[6];
    *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    v20 = sub_20DE1FC48();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
    *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for PickupsHeaderView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = sub_20DE1FE94();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  swift_bridgeObjectRelease();
  v6 = a1 + *(int *)(v5 + 44);
  v7 = sub_20DE1FD68();
  v8 = *(_QWORD *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  v9 = a1 + *(int *)(a2 + 24);
  v10 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PickupsHeaderView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(const void *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = sub_20DE1FE94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  *(_QWORD *)(a1 + v7[9]) = *(_QWORD *)(a2 + v7[9]);
  *(_BYTE *)(a1 + v7[10]) = *(_BYTE *)(a2 + v7[10]);
  v8 = v7[11];
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  v11 = sub_20DE1FD68();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain();
  if (v13(v10, 1, v11))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v15 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PickupsHeaderView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = sub_20DE1FE94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  *(_QWORD *)(a1 + v7[9]) = *(_QWORD *)(a2 + v7[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + v7[10]) = *(_BYTE *)(a2 + v7[10]);
  v8 = v7[11];
  v9 = (void *)(a1 + v8);
  v10 = (void *)(a2 + v8);
  v11 = sub_20DE1FD68();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 24))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 16))(v9, v10, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v17 = a3[6];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 24))(v18, v19, v20);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for PickupsHeaderView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = sub_20DE1FE94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  *(_QWORD *)(a1 + v7[9]) = *(_QWORD *)(a2 + v7[9]);
  *(_BYTE *)(a1 + v7[10]) = *(_BYTE *)(a2 + v7[10]);
  v8 = v7[11];
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  v11 = sub_20DE1FD68();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v14 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for PickupsHeaderView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = sub_20DE1FE94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  *(_QWORD *)(a1 + v7[9]) = *(_QWORD *)(a2 + v7[9]);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + v7[10]) = *(_BYTE *)(a2 + v7[10]);
  v8 = v7[11];
  v9 = (void *)(a1 + v8);
  v10 = (void *)(a2 + v8);
  v11 = sub_20DE1FD68();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  v17 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v18, v19, v20);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PickupsHeaderView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE0CD9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  int v15;

  v6 = type metadata accessor for PickupsHeaderView.Model(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_20DE1FC48();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 28));
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  v15 = v14 - 1;
  if (v15 < 0)
    v15 = -1;
  return (v15 + 1);
}

uint64_t storeEnumTagSinglePayload for PickupsHeaderView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE0CE5C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = type metadata accessor for PickupsHeaderView.Model(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_20DE1FC48();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 28)) = a2;
  return result;
}

void sub_20DE0CF00()
{
  unint64_t v0;
  unint64_t v1;

  sub_20DE0CF98(319);
  if (v0 <= 0x3F)
  {
    sub_20DE1FC48();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_20DE0CF98(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_2549E9AA8)
  {
    v2 = sub_20DDE5B8C();
    v4 = type metadata accessor for ChartHeaderView.Model(a1, (uint64_t)&type metadata for AverageView, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_2549E9AA8);
  }
}

_QWORD *initializeBufferWithCopyOfBuffer for PickupsHeaderView.Model(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  int v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = (int *)v4;
    v7 = sub_20DE1FE94();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(_QWORD *)((char *)a1 + v6[9]) = *(_QWORD *)((char *)a2 + v6[9]);
    *((_BYTE *)a1 + v6[10]) = *((_BYTE *)a2 + v6[10]);
    v8 = v6[11];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_20DE1FD68();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t destroy for PickupsHeaderView.Model(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v2 = sub_20DE1FE94();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(v3 + 44);
  v5 = sub_20DE1FD68();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

uint64_t initializeWithCopy for PickupsHeaderView.Model(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(const void *, uint64_t, uint64_t);
  uint64_t v12;

  v4 = sub_20DE1FE94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  v5 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  *(_QWORD *)(a1 + v5[9]) = *(_QWORD *)(a2 + v5[9]);
  *(_BYTE *)(a1 + v5[10]) = *(_BYTE *)(a2 + v5[10]);
  v6 = v5[11];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_20DE1FD68();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  return a1;
}

uint64_t assignWithCopy for PickupsHeaderView.Model(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;

  v4 = sub_20DE1FE94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  v5 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  *(_QWORD *)(a1 + v5[9]) = *(_QWORD *)(a2 + v5[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + v5[10]) = *(_BYTE *)(a2 + v5[10]);
  v6 = v5[11];
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = sub_20DE1FD68();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t initializeWithTake for PickupsHeaderView.Model(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = sub_20DE1FE94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  v5 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  *(_QWORD *)(a1 + v5[9]) = *(_QWORD *)(a2 + v5[9]);
  *(_BYTE *)(a1 + v5[10]) = *(_BYTE *)(a2 + v5[10]);
  v6 = v5[11];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_20DE1FD68();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  return a1;
}

uint64_t assignWithTake for PickupsHeaderView.Model(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;

  v4 = sub_20DE1FE94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  v5 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  *(_QWORD *)(a1 + v5[9]) = *(_QWORD *)(a2 + v5[9]);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + v5[10]) = *(_BYTE *)(a2 + v5[10]);
  v6 = v5[11];
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = sub_20DE1FD68();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for PickupsHeaderView.Model()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE0D698(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for PickupsHeaderView.Model()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE0D6E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void sub_20DE0D728()
{
  unint64_t v0;

  sub_20DE0CF98(319);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

unint64_t sub_20DE0D794()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549EB848;
  if (!qword_2549EB848)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549EB850);
    v2[0] = sub_20DE0C4CC();
    v2[1] = sub_20DDA8D7C();
    result = MEMORY[0x212BB5FE0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549EB848);
  }
  return result;
}

uint64_t sub_20DE0D800(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  return sub_20DE0D900(a1, a2, a3, a4);
}

uint64_t sub_20DE0D80C(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;
  _QWORD *v8;

  if (a2 < 0)
  {
    result = sub_20DE20E90();
    __break(1u);
  }
  else
  {
    if (a2)
    {
      v4 = (_QWORD *)sub_20DE20D4C();
      v4[2] = a2;
      v8 = v4;
      v4[4] = a1;
      if (a2 != 1)
      {
        v4[5] = a1;
        v5 = a2 - 2;
        if (v5)
        {
          v6 = v4 + 6;
          do
          {
            *v6++ = a1;
            swift_retain();
            --v5;
          }
          while (v5);
        }
        swift_retain();
      }
    }
    else
    {
      v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
      swift_release();
    }
    sub_20DE20D40();
    return (uint64_t)v8;
  }
  return result;
}

uint64_t sub_20DE0D900(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double *v11;
  uint64_t result;

  if (a3 < 0)
  {
    result = sub_20DE20E90();
    __break(1u);
  }
  else
  {
    if (a3)
    {
      v8 = sub_20DE20D4C();
      v9 = v8;
      *(_QWORD *)(v8 + 16) = a3;
      *(double *)(v8 + 32) = a4;
      *(_QWORD *)(v8 + 40) = a1;
      *(_QWORD *)(v8 + 48) = a2;
      if (a3 != 1)
      {
        *(double *)(v8 + 56) = a4;
        *(_QWORD *)(v8 + 64) = a1;
        *(_QWORD *)(v8 + 72) = a2;
        v10 = a3 - 2;
        if (v10)
        {
          v11 = (double *)(v8 + 96);
          do
          {
            *(v11 - 2) = a4;
            *((_QWORD *)v11 - 1) = a1;
            *(_QWORD *)v11 = a2;
            swift_bridgeObjectRetain();
            v11 += 3;
            --v10;
          }
          while (v10);
        }
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x24BEE4AF8];
    }
    return v9;
  }
  return result;
}

uint64_t UsageDetailChart.Model.contains(date:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char v4;
  uint64_t v6;

  v0 = sub_20DE1FD68();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for UsageDetailChart.Model(0);
  sub_20DE1FDA4();
  v4 = sub_20DE1FD44();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4 & 1;
}

uint64_t type metadata accessor for UsageDetailChart.Model(uint64_t a1)
{
  return sub_20DD87B48(a1, qword_2549EBA38);
}

uint64_t UsageDetailChart.Model.init(startOfDay:usage:calendar:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = (int *)type metadata accessor for UsageDetailChart.Model(0);
  *(_QWORD *)(a4 + v8[7]) = 0x40BC200000000000;
  *(_QWORD *)(a4 + v8[8]) = 3;
  v9 = sub_20DE1FD68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a4, a1, v9);
  *(_QWORD *)(a4 + v8[5]) = a2;
  v10 = a4 + v8[6];
  v11 = sub_20DE1FE94();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10, a3, v11);
}

uint64_t UsageDetailChart.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 + *(int *)(type metadata accessor for UsageDetailChart(0) + 20)) = 0;
  return sub_20DD8BB14(a1, a2, type metadata accessor for UsageDetailChart.Model);
}

uint64_t type metadata accessor for UsageDetailChart(uint64_t a1)
{
  return sub_20DD87B48(a1, qword_2549EB910);
}

int *UsageDetailChart.HourlyUsage.init(hour:totalUsage:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int *result;
  uint64_t v15;

  v6 = sub_20DE1FC48();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v7 + 16))(v10, a1, v6, v8);
  v11 = MEMORY[0x24BEE4AF8];
  v12 = sub_20DDD5B14(MEMORY[0x24BEE4AF8]);
  v13 = sub_20DDD5B14(v11);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a2, v10, v6);
  result = (int *)type metadata accessor for UsageDetailChart.HourlyUsage(0);
  *(double *)(a2 + result[5]) = a3;
  *(_QWORD *)(a2 + result[6]) = v12;
  *(_QWORD *)(a2 + result[7]) = v13;
  return result;
}

uint64_t type metadata accessor for UsageDetailChart.HourlyUsage(uint64_t a1)
{
  return sub_20DD87B48(a1, qword_2549EB9A0);
}

unint64_t sub_20DE0DCE0(uint64_t a1, uint64_t a2)
{
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
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
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  void (*v52)(char *, uint64_t);
  void (*v53)(char *, uint64_t, uint64_t);
  char *v54;
  unint64_t v55;
  unint64_t v56;
  char v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(char *);
  unsigned int v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  void (*v89)(char *, uint64_t);
  char *v90;

  v83 = a2;
  v3 = sub_20DE1FE04();
  v71 = *(_QWORD *)(v3 - 8);
  v72 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v70 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_20DE1FE1C();
  v79 = *(_QWORD *)(v5 - 8);
  v80 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v69 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20DE1FDD4();
  v77 = *(_QWORD *)(v7 - 8);
  v78 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v76 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E8348);
  MEMORY[0x24BDAC7A8](v9);
  v64 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E81B0);
  MEMORY[0x24BDAC7A8](v11);
  v63 = (char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = sub_20DE1FC78();
  v66 = *(_QWORD *)(v68 - 8);
  MEMORY[0x24BDAC7A8](v68);
  v81 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
  MEMORY[0x24BDAC7A8](v14);
  v82 = (uint64_t)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = sub_20DE1FE7C();
  v16 = *(_QWORD *)(v84 - 8);
  MEMORY[0x24BDAC7A8](v84);
  v18 = (char *)&v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_20DE1FD68();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v90 = (char *)&v62 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v62 - v23;
  MEMORY[0x24BDAC7A8](v25);
  v65 = (char *)&v62 - v26;
  MEMORY[0x24BDAC7A8](v27);
  v67 = (char *)&v62 - v28;
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v62 - v30;
  MEMORY[0x24BDAC7A8](v32);
  v34 = (char *)&v62 - v33;
  _s16ScreenTimeUICore11DetailChartV4HourV2id10Foundation4DateVvg_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7D48);
  v85 = v20;
  v35 = *(_QWORD *)(v20 + 72);
  v36 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  v88 = v35;
  v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_20DE217B0;
  v86 = a1;
  v87 = v36;
  _s16ScreenTimeUICore11DetailChartV4HourV2id10Foundation4DateVvg_0();
  v74 = *MEMORY[0x24BDCF230];
  v73 = *(void (**)(char *))(v16 + 104);
  v38 = v84;
  v73(v18);
  _s16ScreenTimeUICore11DetailChartV4HourV2id10Foundation4DateVvg_0();
  v75 = sub_20DE1FE88();
  v39 = *(void (**)(char *, uint64_t))(v85 + 8);
  v39(v31, v19);
  v40 = *(void (**)(char *, uint64_t))(v16 + 8);
  v40(v18, v38);
  ((void (*)(char *, _QWORD, uint64_t))v73)(v18, v74, v38);
  sub_20DE1FC00();
  v41 = v75 | sub_20DE1FE88();
  v39(v31, v19);
  v40(v18, v84);
  v89 = v39;
  if (v41)
  {
    v42 = v85;
    v43 = v86;
LABEL_5:
    v52 = v89;
    goto LABEL_9;
  }
  _s16ScreenTimeUICore11DetailChartV4HourV2id10Foundation4DateVvg_0();
  v44 = sub_20DE1FE94();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v63, 1, 1, v44);
  v45 = sub_20DE1FEA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v64, 1, 1, v45);
  sub_20DE1FC6C();
  (*(void (**)(char *, _QWORD, uint64_t))(v77 + 104))(v76, *MEMORY[0x24BDCF020], v78);
  v46 = v69;
  (*(void (**)(char *, _QWORD, uint64_t))(v79 + 104))(v69, *MEMORY[0x24BDCF0B0], v80);
  v47 = v70;
  v48 = v71;
  v49 = v72;
  (*(void (**)(char *, _QWORD, uint64_t))(v71 + 104))(v70, *MEMORY[0x24BDCF068], v72);
  sub_20DE1FE70();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v47, v49);
  (*(void (**)(char *, uint64_t))(v79 + 8))(v46, v80);
  (*(void (**)(char *, uint64_t))(v77 + 8))(v76, v78);
  (*(void (**)(char *, uint64_t))(v66 + 8))(v81, v68);
  v89(v31, v19);
  v50 = v85;
  v51 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v85 + 48))(v82, 1, v19);
  v43 = v86;
  if (v51 == 1)
  {
    v42 = v50;
    sub_20DD851D0(v82, &qword_2549E7C40);
    goto LABEL_5;
  }
  v53 = *(void (**)(char *, uint64_t, uint64_t))(v50 + 32);
  v54 = v67;
  v53(v67, v82, v19);
  v42 = v50;
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v65, v54, v19);
  v56 = *(_QWORD *)(v37 + 16);
  v55 = *(_QWORD *)(v37 + 24);
  if (v56 >= v55 >> 1)
    v37 = sub_20DDB8234(v55 > 1, v56 + 1, 1, v37);
  *(_QWORD *)(v37 + 16) = v56 + 1;
  v53((char *)(v37 + v87 + v56 * v88), (uint64_t)v65, v19);
  v52 = v89;
  v89(v34, v19);
  v53(v34, (uint64_t)v67, v19);
LABEL_9:
  while (1)
  {
    sub_20DE1FD38();
    sub_20DE1FC00();
    sub_20DD8512C((unint64_t *)&qword_2549E8148, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
    v57 = sub_20DE20C20();
    v52(v24, v19);
    v52(v31, v19);
    if ((v57 & 1) != 0)
      break;
    v58 = v43;
    sub_20DE1FD50();
    (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v90, v34, v19);
    v60 = *(_QWORD *)(v37 + 16);
    v59 = *(_QWORD *)(v37 + 24);
    if (v60 >= v59 >> 1)
      v37 = sub_20DDB8234(v59 > 1, v60 + 1, 1, v37);
    *(_QWORD *)(v37 + 16) = v60 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v42 + 32))(v37 + v87 + v60 * v88, v90, v19);
    v43 = v58;
    v52 = v89;
  }
  v52(v34, v19);
  return v37;
}

uint64_t UsageDetailChart.HourlyUsage.id.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20DE0E508((uint64_t (*)(_QWORD))MEMORY[0x24BDCB878], a1);
}

uint64_t sub_20DE0E4F0@<X0>(uint64_t a1@<X8>)
{
  return sub_20DE0F5C4((uint64_t (*)(_QWORD))MEMORY[0x24BDCB878], a1);
}

uint64_t UsageDetailChart.Model.id.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20DE0E508((uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], a1);
}

uint64_t sub_20DE0E508@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = a1(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v2, v4);
}

uint64_t sub_20DE0E544()
{
  uint64_t v0;
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
  char v11;
  void (*v12)(char *, uint64_t);
  uint64_t v14;

  v0 = sub_20DE1FD68();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14 - v5;
  v7 = sub_20DE1FC48();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20DE1FBDC();
  _s16ScreenTimeUICore11DetailChartV4HourV2id10Foundation4DateVvg_0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  type metadata accessor for UsageDetailChart.Model(0);
  sub_20DE1FDA4();
  v11 = sub_20DE1FD44();
  v12 = *(void (**)(char *, uint64_t))(v1 + 8);
  v12(v3, v0);
  v12(v6, v0);
  return v11 & 1;
}

uint64_t sub_20DE0E68C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t (*v11)(uint64_t);
  unint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[16];
  uint64_t v24;
  uint64_t v25;

  v22 = type metadata accessor for UsageDetailChart.HourlyUsage(0);
  v20 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v2 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v19 - v4;
  v6 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for UsageDetailChart.Model(0) + 20));
  v24 = v0;
  swift_bridgeObjectRetain();
  result = sub_20DD85DA0((uint64_t (*)(char *))sub_20DE12DD4, (uint64_t)v23, v6);
  v8 = result;
  v9 = MEMORY[0x24BEE4AF8];
  v25 = MEMORY[0x24BEE4AF8];
  v21 = *(_QWORD *)(result + 16);
  if (v21)
  {
    v10 = 0;
    v11 = type metadata accessor for UsageDetailChart.HourlyUsage;
    while (v10 < *(_QWORD *)(v8 + 16))
    {
      v12 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
      v13 = *(_QWORD *)(v20 + 72);
      sub_20DD8BACC(v8 + v12 + v13 * v10, (uint64_t)v5, v11);
      if (*(_QWORD *)(*(_QWORD *)&v5[*(int *)(v22 + 24)] + 16))
      {
        v14 = v11;
        sub_20DD8BB14((uint64_t)v5, (uint64_t)v2, v11);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_20DD8EADC(0, *(_QWORD *)(v9 + 16) + 1, 1);
        v9 = v25;
        v16 = *(_QWORD *)(v25 + 16);
        v15 = *(_QWORD *)(v25 + 24);
        if (v16 >= v15 >> 1)
        {
          sub_20DD8EADC(v15 > 1, v16 + 1, 1);
          v9 = v25;
        }
        *(_QWORD *)(v9 + 16) = v16 + 1;
        v17 = v9 + v12 + v16 * v13;
        v11 = v14;
        result = sub_20DD8BB14((uint64_t)v2, v17, v14);
      }
      else
      {
        result = sub_20DD909C0((uint64_t)v5, v11);
      }
      if (v21 == ++v10)
      {
        v9 = v25;
        goto LABEL_13;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_13:
    swift_bridgeObjectRelease();
    v18 = *(_QWORD *)(v9 + 16);
    swift_release();
    return v18 == 0;
  }
  return result;
}

uint64_t sub_20DE0E8A0()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t *v24;
  double v25;
  _QWORD *v26;
  uint64_t v27;
  _BOOL8 v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  _QWORD *v48;
  uint64_t result;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  unint64_t v60;
  int64_t v61;
  char v62[16];
  uint64_t v63;
  _QWORD *v64;

  v58 = type metadata accessor for UsageDetailChart.HourlyUsage(0);
  isUniquelyReferenced_nonNull_native = *(_QWORD *)(v58 - 8);
  MEMORY[0x24BDAC7A8](v58);
  v57 = (uint64_t)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (_QWORD *)sub_20DDD5B14(MEMORY[0x24BEE4AF8]);
  v8 = sub_20DE0E68C();
  v9 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for UsageDetailChart.Model(0) + 20));
  v63 = v0;
  swift_bridgeObjectRetain();
  v10 = sub_20DD85DA0((uint64_t (*)(char *))sub_20DE12DD4, (uint64_t)v62, v9);
  v51 = 0;
  v56 = *(_QWORD **)(v10 + 16);
  if (!v56)
  {
    swift_bridgeObjectRelease();
    v11 = 0;
    goto LABEL_43;
  }
  v11 = 0;
  v12 = 0;
  v55 = v10
      + ((*(unsigned __int8 *)(isUniquelyReferenced_nonNull_native + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(isUniquelyReferenced_nonNull_native + 80));
  v13 = 6;
  if ((_BYTE)v8)
    v13 = 7;
  v53 = isUniquelyReferenced_nonNull_native;
  v54 = v13;
  v52 = v10;
  while (2)
  {
    if (v12 >= *(_QWORD *)(v10 + 16))
    {
LABEL_63:
      __break(1u);
LABEL_64:
      sub_20DD8E85C(v4 > 1, v1, 1);
      v37 = v64;
LABEL_49:
      v37[2] = v1;
      v38 = &v37[2 * v3];
      v38[4] = v2;
      v38[5] = isUniquelyReferenced_nonNull_native;
      if (v8 != 1)
      {
        v40 = *(_QWORD *)(v12 + 56);
        v39 = *(_QWORD *)(v12 + 64);
        v64 = v37;
        v41 = v37[2];
        v42 = v37[3];
        swift_bridgeObjectRetain();
        if (v41 >= v42 >> 1)
        {
          sub_20DD8E85C(v42 > 1, v41 + 1, 1);
          v37 = v64;
        }
        v37[2] = v41 + 1;
        v43 = &v37[2 * v41];
        v43[4] = v40;
        v43[5] = v39;
        if (v8 != 2)
        {
          v45 = *(_QWORD *)(v12 + 80);
          v44 = *(_QWORD *)(v12 + 88);
          v64 = v37;
          v46 = v37[2];
          v47 = v37[3];
          swift_bridgeObjectRetain();
          if (v46 >= v47 >> 1)
          {
            sub_20DD8E85C(v47 > 1, v46 + 1, 1);
            v37 = v64;
          }
          v37[2] = v46 + 1;
          v48 = &v37[2 * v46];
          v48[4] = v45;
          v48[5] = v44;
        }
      }
      swift_release();
      goto LABEL_58;
    }
    v14 = v57;
    v8 = (uint64_t)type metadata accessor for UsageDetailChart.HourlyUsage;
    sub_20DD8BACC(v55 + *(_QWORD *)(isUniquelyReferenced_nonNull_native + 72) * v12++, v57, type metadata accessor for UsageDetailChart.HourlyUsage);
    v59 = (_QWORD *)v12;
    v4 = *(_QWORD *)(v14 + *(int *)(v58 + 4 * v54));
    swift_bridgeObjectRetain();
    sub_20DD909C0(v14, type metadata accessor for UsageDetailChart.HourlyUsage);
    v2 = 0;
    v15 = *(_QWORD *)(v4 + 64);
    v60 = v4 + 64;
    v16 = 1 << *(_BYTE *)(v4 + 32);
    if (v16 < 64)
      v17 = ~(-1 << v16);
    else
      v17 = -1;
    v1 = v17 & v15;
    v61 = (unint64_t)(v16 + 63) >> 6;
    while (1)
    {
      if (v1)
      {
        v19 = __clz(__rbit64(v1));
        v1 &= v1 - 1;
        v20 = v19 | (v2 << 6);
        goto LABEL_29;
      }
      v21 = v2 + 1;
      if (__OFADD__(v2, 1))
        goto LABEL_61;
      if (v21 >= v61)
        break;
      v22 = *(_QWORD *)(v60 + 8 * v21);
      ++v2;
      if (!v22)
      {
        v2 = v21 + 1;
        if (v21 + 1 >= v61)
          break;
        v22 = *(_QWORD *)(v60 + 8 * v2);
        if (!v22)
        {
          v2 = v21 + 2;
          if (v21 + 2 >= v61)
            break;
          v22 = *(_QWORD *)(v60 + 8 * v2);
          if (!v22)
          {
            v23 = v21 + 3;
            if (v23 >= v61)
              break;
            v22 = *(_QWORD *)(v60 + 8 * v23);
            if (!v22)
            {
              while (1)
              {
                v2 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_62;
                if (v2 >= v61)
                  goto LABEL_5;
                v22 = *(_QWORD *)(v60 + 8 * v2);
                ++v23;
                if (v22)
                  goto LABEL_28;
              }
            }
            v2 = v23;
          }
        }
      }
LABEL_28:
      v1 = (v22 - 1) & v22;
      v20 = __clz(__rbit64(v22)) + (v2 << 6);
LABEL_29:
      v24 = (unint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v20);
      v3 = *v24;
      v8 = v24[1];
      v25 = *(double *)(*(_QWORD *)(v4 + 56) + 8 * v20);
      swift_bridgeObjectRetain();
      sub_20DD938EC(v11);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v64 = v7;
      v11 = sub_20DD9DDF0(v3, v8);
      v27 = v7[2];
      v28 = (v26 & 1) == 0;
      v29 = v27 + v28;
      if (__OFADD__(v27, v28))
      {
        __break(1u);
LABEL_60:
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        __break(1u);
        goto LABEL_63;
      }
      v12 = (unint64_t)v26;
      if (v7[3] >= v29)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_20DDA0AB8();
      }
      else
      {
        sub_20DD9E52C(v29, isUniquelyReferenced_nonNull_native);
        v30 = sub_20DD9DDF0(v3, v8);
        if ((v12 & 1) != (v31 & 1))
        {
          sub_20DE20F14();
          __break(1u);
          goto LABEL_66;
        }
        v11 = v30;
      }
      v7 = v64;
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        v7[(v11 >> 6) + 8] |= 1 << v11;
        v32 = (unint64_t *)(v7[6] + 16 * v11);
        *v32 = v3;
        v32[1] = v8;
        *(_QWORD *)(v7[7] + 8 * v11) = 0;
        v33 = v7[2];
        v34 = v33 + 1;
        v12 = __OFADD__(v33, 1);
        swift_bridgeObjectRetain();
        if ((v12 & 1) != 0)
          goto LABEL_60;
        v7[2] = v34;
      }
      swift_bridgeObjectRetain();
      v18 = v7[7];
      swift_bridgeObjectRelease();
      *(double *)(v18 + 8 * v11) = v25 + *(double *)(v18 + 8 * v11);
      swift_bridgeObjectRelease();
      v11 = (unint64_t)sub_20DD84580;
    }
LABEL_5:
    swift_release();
    v12 = (unint64_t)v59;
    v10 = v52;
    isUniquelyReferenced_nonNull_native = v53;
    if (v59 != v56)
      continue;
    break;
  }
  swift_bridgeObjectRelease();
LABEL_43:
  swift_bridgeObjectRetain_n();
  v35 = sub_20DD8D5DC((uint64_t)v7);
  swift_bridgeObjectRelease();
  v64 = v35;
  v36 = v51;
  sub_20DD8D574(&v64);
  if (v36)
  {
LABEL_66:
    result = swift_release();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v12 = (unint64_t)v64;
    if (v64[2] >= 3uLL)
      v8 = 3;
    else
      v8 = v64[2];
    if (v8)
    {
      v64 = (_QWORD *)MEMORY[0x24BEE4AF8];
      sub_20DD8E85C(0, v8, 0);
      v37 = v64;
      v2 = *(_QWORD *)(v12 + 32);
      isUniquelyReferenced_nonNull_native = *(_QWORD *)(v12 + 40);
      v3 = v64[2];
      v4 = v64[3];
      v1 = v3 + 1;
      swift_bridgeObjectRetain();
      if (v3 < v4 >> 1)
        goto LABEL_49;
      goto LABEL_64;
    }
    swift_release();
    v37 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_58:
    swift_bridgeObjectRelease();
    sub_20DD938EC(v11);
    return (uint64_t)v37;
  }
  return result;
}

uint64_t sub_20DE0EE64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double v3;
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
  char *v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  double v43;
  uint64_t v44;
  double v45;
  unint64_t v46;
  unint64_t *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  double v53;
  char *v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t result;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  void (*v65)(uint64_t, char *, uint64_t);
  uint64_t v66;
  uint64_t v67;
  double v68;
  uint64_t v69;
  double *v70;
  uint64_t v71;
  double v72;
  double v73;
  uint64_t v74;
  double *v75;
  double v76;
  double v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  unint64_t v83;
  char *v84;
  uint64_t v85;

  v6 = sub_20DE1FC48();
  v78 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v82 = (char *)&v78 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBAA0);
  MEMORY[0x24BDAC7A8](v8);
  v80 = (uint64_t)&v78 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = type metadata accessor for UsageDetailChart.HourlyUsage(0);
  v10 = *(_QWORD *)(v85 - 8);
  MEMORY[0x24BDAC7A8](v85);
  v12 = (uint64_t)&v78 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v81 = (uint64_t)&v78 - v14;
  MEMORY[0x24BDAC7A8](v15);
  v79 = (uint64_t)&v78 - v16;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v78 - v18;
  v20 = *(_QWORD *)(v2 + *(int *)(type metadata accessor for UsageDetailChart.Model(0) + 32));
  v21 = sub_20DE0E68C();
  v84 = v19;
  if (!a2 || (v22 = *(_QWORD *)(a2 + 16)) == 0)
  {
    v26 = (_QWORD *)sub_20DE0E8A0();
    sub_20DD8BACC(a1, (uint64_t)v19, type metadata accessor for UsageDetailChart.HourlyUsage);
    if (v21)
      v30 = 7;
    else
      v30 = 6;
    v31 = (int *)v85;
    v32 = v20 + 1;
    if (!__OFADD__(v20, 1))
      goto LABEL_11;
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  v23 = (_QWORD *)v6;
  v24 = a2 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
  v25 = swift_bridgeObjectRetain();
  v26 = sub_20DD8D6D0(v25);
  swift_bridgeObjectRelease();
  v83 = v26[2];
  v27 = *(_QWORD *)(v10 + 72);
  swift_retain();
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_20DD8BACC(v24, v12, type metadata accessor for UsageDetailChart.HourlyUsage);
    if ((sub_20DE1FBF4() & 1) != 0)
      break;
    sub_20DD909C0(v12, type metadata accessor for UsageDetailChart.HourlyUsage);
    v24 += v27;
    if (!--v22)
    {
      swift_bridgeObjectRelease();
      v28 = 1;
      v29 = v80;
      goto LABEL_38;
    }
  }
  swift_bridgeObjectRelease();
  v29 = v80;
  sub_20DD8BB14(v12, v80, type metadata accessor for UsageDetailChart.HourlyUsage);
  v28 = 0;
LABEL_38:
  v31 = (int *)v85;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(v29, v28, 1, v85);
  v55 = v81;
  sub_20DD8BACC(a1, v81, type metadata accessor for UsageDetailChart.HourlyUsage);
  v56 = (*(uint64_t (**)(uint64_t, uint64_t, int *))(v10 + 48))(v29, 1, v31);
  v19 = v84;
  if (v56 == 1)
  {
    v57 = v78;
    v12 = (uint64_t)v23;
    (*(void (**)(char *, uint64_t, _QWORD *))(v78 + 16))(v82, v55, v23);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549E80E0);
    result = swift_initStackObject();
    *(_OWORD *)(result + 16) = xmmword_20DE217B0;
    if (!v26[2])
    {
LABEL_68:
      __break(1u);
      return result;
    }
    v59 = (_QWORD *)result;
    v60 = v55;
    v62 = v26[4];
    v61 = v26[5];
    swift_bridgeObjectRetain();
    swift_release();
    v59[4] = v62;
    v59[5] = v61;
    v59[6] = 0;
    v63 = sub_20DDD5B14((uint64_t)v59);
    v64 = sub_20DDD5B14(MEMORY[0x24BEE4AF8]);
    sub_20DD909C0(v60, type metadata accessor for UsageDetailChart.HourlyUsage);
    v65 = *(void (**)(uint64_t, char *, uint64_t))(v57 + 32);
    v66 = v79;
    v65(v79, v82, v12);
    *(_QWORD *)(v66 + v31[5]) = 0;
    *(_QWORD *)(v66 + v31[6]) = v63;
    *(_QWORD *)(v66 + v31[7]) = v64;
    sub_20DD851D0(v29, &qword_2549EBAA0);
    v19 = v84;
  }
  else
  {
    sub_20DD909C0(v55, type metadata accessor for UsageDetailChart.HourlyUsage);
    swift_release();
    v66 = v79;
    sub_20DD8BB14(v29, v79, type metadata accessor for UsageDetailChart.HourlyUsage);
  }
  sub_20DD8BB14(v66, (uint64_t)v19, type metadata accessor for UsageDetailChart.HourlyUsage);
  v30 = 6;
  v20 = v83;
  v32 = v83 + 1;
  if (__OFADD__(v83, 1))
    goto LABEL_44;
LABEL_11:
  v12 = sub_20DE0D900(0x65646E69616D6572, 0xE900000000000072, v32, 0.0);
  v33 = *(_QWORD *)&v19[v31[v30]];
  v34 = v26[2];
  if (!v34)
  {
    v3 = *(double *)(a1 + v31[5]);
    if (v3 < 0.0)
    {
      swift_bridgeObjectRetain();
      goto LABEL_50;
    }
LABEL_45:
    v83 = v20;
    swift_bridgeObjectRetain();
    if (v3 <= 0.0)
      goto LABEL_50;
    swift_bridgeObjectRelease();
LABEL_47:
    v67 = *(_QWORD *)(v12 + 16);
    v68 = 0.0;
    v48 = v83;
    if (v67)
    {
      if (v67 == 1)
      {
        v69 = 0;
      }
      else
      {
        v69 = v67 & 0x7FFFFFFFFFFFFFFELL;
        v70 = (double *)(v12 + 56);
        v71 = v67 & 0x7FFFFFFFFFFFFFFELL;
        do
        {
          v72 = *(v70 - 3);
          v73 = *v70;
          v70 += 6;
          v68 = v68 + v72 + v73;
          v71 -= 2;
        }
        while (v71);
        if (v67 == v69)
          goto LABEL_56;
      }
      v74 = v67 - v69;
      v75 = (double *)(v12 + 24 * v69 + 32);
      do
      {
        v76 = *v75;
        v75 += 3;
        v68 = v68 + v76;
        --v74;
      }
      while (v74);
    }
LABEL_56:
    v77 = round((1.0 - v68) * 100.0) / 100.0;
    if (v77 > 0.0)
      v45 = v77;
    else
      v45 = 0.0;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) != 0)
    {
      if ((v48 & 0x8000000000000000) == 0)
        goto LABEL_61;
    }
    else
    {
LABEL_65:
      result = (uint64_t)sub_20DE114EC((_QWORD *)v12);
      v12 = result;
      if ((v48 & 0x8000000000000000) == 0)
      {
LABEL_61:
        if (v48 < *(_QWORD *)(v12 + 16))
        {
          *(double *)(v12 + 24 * v48 + 32) = v45;
          swift_bridgeObjectRelease();
          sub_20DD909C0((uint64_t)v19, type metadata accessor for UsageDetailChart.HourlyUsage);
          return v12;
        }
        goto LABEL_67;
      }
    }
    __break(1u);
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  v83 = v20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v35 = 0;
  v36 = v26 + 5;
  v37 = v34 - 1;
  v38 = 0.0;
  do
  {
    if (*(_QWORD *)(v33 + 16))
    {
      v40 = *(v36 - 1);
      v39 = *v36;
      swift_bridgeObjectRetain();
      v41 = sub_20DD9DDF0(v40, v39);
      if ((v42 & 1) != 0)
      {
        v43 = *(double *)(*(_QWORD *)(v33 + 56) + 8 * v41);
        swift_bridgeObjectRelease();
        v38 = v38 + v43;
        if (v37 == v35)
          goto LABEL_21;
        goto LABEL_19;
      }
      swift_bridgeObjectRelease();
    }
    v38 = v38 + 0.0;
    if (v37 == v35)
      goto LABEL_21;
LABEL_19:
    ++v35;
    v36 += 2;
  }
  while (v35 < v26[2]);
  __break(1u);
LABEL_21:
  swift_bridgeObjectRelease();
  v19 = v84;
  v44 = *(int *)(v85 + 20);
  if (v38 > *(double *)(a1 + v44))
    v45 = v38;
  else
    v45 = *(double *)(a1 + v44);
  if (v45 > 0.0)
  {
    swift_bridgeObjectRetain();
    v19 = 0;
    v46 = 0;
    v47 = v26 + 5;
    while (1)
    {
      v49 = *(v47 - 1);
      v48 = *v47;
      v50 = *(_QWORD *)(v33 + 16);
      swift_bridgeObjectRetain();
      if (v50)
      {
        swift_bridgeObjectRetain();
        v51 = sub_20DD9DDF0(v49, v48);
        if ((v52 & 1) != 0)
        {
          v53 = *(double *)(*(_QWORD *)(v33 + 56) + 8 * v51);
          swift_bridgeObjectRelease();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
            goto LABEL_32;
LABEL_29:
          v12 = (uint64_t)sub_20DE114EC((_QWORD *)v12);
          goto LABEL_32;
        }
        swift_bridgeObjectRelease();
      }
      v53 = 0.0;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        goto LABEL_29;
LABEL_32:
      if (v46 >= *(_QWORD *)(v12 + 16))
      {
        __break(1u);
        goto LABEL_65;
      }
      v54 = &v19[v12];
      *((double *)v54 + 4) = round(v53 * 100.0 / v45) / 100.0;
      ++v46;
      v47 += 2;
      *((_QWORD *)v54 + 5) = v49;
      *((_QWORD *)v54 + 6) = v48;
      swift_bridgeObjectRelease();
      v19 += 24;
      if (v34 == v46)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v19 = v84;
        goto LABEL_47;
      }
    }
  }
LABEL_50:
  sub_20DD909C0((uint64_t)v19, type metadata accessor for UsageDetailChart.HourlyUsage);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_20DE0F5B8@<X0>(uint64_t a1@<X8>)
{
  return sub_20DE0F5C4((uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], a1);
}

uint64_t sub_20DE0F5C4@<X0>(uint64_t (*a1)(_QWORD)@<X2>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = a1(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v2, v4);
}

uint64_t UsageDetailChart.body.getter@<X0>(uint64_t a1@<X8>)
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t OpaqueTypeConformance2;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t KeyPath;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  char *v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  char *v129;
  uint64_t v130;
  char v131[8];
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;

  v2 = v1;
  v125 = a1;
  v3 = sub_20DE204E8();
  v123 = *(_QWORD *)(v3 - 8);
  v124 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v122 = (char *)&v95 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v98 = sub_20DE1FD68();
  v97 = *(_QWORD *)(v98 - 8);
  MEMORY[0x24BDAC7A8](v98);
  v96 = (char *)&v95 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C60);
  MEMORY[0x24BDAC7A8](v6);
  v120 = (char *)&v95 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v121 = sub_20DE1FC48();
  v130 = *(_QWORD *)(v121 - 8);
  MEMORY[0x24BDAC7A8](v121);
  v99 = (char *)&v95 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v129 = (char *)&v95 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C58);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v95 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for UsageDetailChart(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 64);
  MEMORY[0x24BDAC7A8](v14);
  v109 = (char *)&v95 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v95 - v18;
  v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB858);
  v102 = *(_QWORD *)(v101 - 8);
  MEMORY[0x24BDAC7A8](v101);
  v21 = (char *)&v95 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB860);
  v105 = *(uint64_t **)(v107 - 8);
  MEMORY[0x24BDAC7A8](v107);
  v103 = (char *)&v95 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7FE8);
  v108 = *(_QWORD *)(v126 - 8);
  MEMORY[0x24BDAC7A8](v126);
  v104 = (char *)&v95 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB868);
  v111 = *(_QWORD *)(v113 - 8);
  MEMORY[0x24BDAC7A8](v113);
  v128 = (char *)&v95 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB870);
  v114 = *(_QWORD *)(v115 - 8);
  MEMORY[0x24BDAC7A8](v115);
  v112 = (char *)&v95 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB878);
  v118 = *(_QWORD *)(v119 - 8);
  MEMORY[0x24BDAC7A8](v119);
  v117 = (char *)&v95 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB880);
  MEMORY[0x24BDAC7A8](v110);
  v116 = (char *)&v95 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v127 = type metadata accessor for UsageDetailChart.Model(0);
  v106 = *(int *)(v127 + 20);
  v28 = *(_QWORD *)(v2 + v106);
  v132 = v2;
  swift_bridgeObjectRetain();
  v133 = sub_20DD85DA0((uint64_t (*)(char *))sub_20DE11618, (uint64_t)v131, v28);
  sub_20DD8BACC(v2, (uint64_t)v19, type metadata accessor for UsageDetailChart);
  v29 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v30 = swift_allocObject();
  sub_20DD8BB14((uint64_t)v19, v30 + v29, type metadata accessor for UsageDetailChart);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB888);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB890);
  sub_20DD8561C(&qword_2549EB898, &qword_2549EB888, MEMORY[0x24BEE12D8]);
  sub_20DE11744();
  sub_20DD8512C(&qword_2549EB8A8, type metadata accessor for UsageDetailChart.HourlyUsage, (uint64_t)&protocol conformance descriptor for UsageDetailChart.HourlyUsage);
  v100 = v21;
  sub_20DE20248();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7D68);
  v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_20DE217C0;
  *(_QWORD *)(v31 + 32) = 0;
  UsageDetailChart.Model.maxUsage.getter();
  v32 = 3600.0;
  if (v33 > 3600.0)
    v32 = *(double *)(v2 + *(int *)(v127 + 28));
  UsageDetailChart.Model.maxUsage.getter();
  v35 = v32 * ceil(v34 / v32);
  if (v35 <= v32)
    v35 = v32;
  *(double *)(v31 + 40) = v35;
  v133 = v31;
  v36 = sub_20DE20308();
  v37 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56);
  v37(v13, 1, 1, v36);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7D70);
  v39 = sub_20DD8561C(&qword_2549EB8B0, &qword_2549EB858, MEMORY[0x24BDB8148]);
  v40 = sub_20DD8BB84(&qword_2549E7D78, &qword_2549E7D70, MEMORY[0x24BDB84C8]);
  v41 = v103;
  v42 = v101;
  v43 = v100;
  sub_20DE2089C();
  sub_20DD851D0((uint64_t)v13, &qword_2549E7C58);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v102 + 8))(v43, v42);
  v137 = UsageDetailChart.Model.xAxisScale.getter();
  v37(v13, 1, 1, v36);
  v44 = (uint64_t)v13;
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7D50);
  v133 = v42;
  v134 = v38;
  v135 = v39;
  v136 = v40;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v47 = sub_20DD8BB84(&qword_2549E7D58, &qword_2549E7D50, MEMORY[0x24BDB7A98]);
  v48 = v104;
  v49 = v107;
  v102 = v45;
  sub_20DE20890();
  sub_20DD851D0(v44, &qword_2549E7C58);
  swift_bridgeObjectRelease();
  ((void (*)(char *, uint64_t))v105[1])(v41, v49);
  v50 = UsageDetailChart.Model.yStride.getter();
  UsageDetailChart.Model.maxUsage.getter();
  v51 = v2;
  v52 = UsageDetailChart.Model.maxUsage.getter();
  v105 = &v95;
  v53 = MEMORY[0x24BDAC7A8](v52).n128_u64[0];
  *(&v95 - 6) = v50;
  *(&v95 - 5) = 0;
  *((_BYTE *)&v95 - 32) = 1;
  *(&v95 - 3) = v53;
  *((_BYTE *)&v95 - 16) = 0;
  *(&v95 - 1) = (uint64_t)v48;
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7D90);
  v133 = v49;
  v134 = v102;
  v135 = OpaqueTypeConformance2;
  v136 = v47;
  v55 = swift_getOpaqueTypeConformance2();
  v56 = sub_20DD8561C(&qword_2549E7D98, &qword_2549E7D90, MEMORY[0x24BDB82F0]);
  v57 = v126;
  v103 = (char *)v54;
  sub_20DE20878();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v108 + 8))(v48, v57);
  v58 = *(_QWORD *)(v51 + v106);
  if (*(_QWORD *)(v58 + 16))
  {
    v59 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for UsageDetailChart.HourlyUsage(0) - 8) + 80);
    v60 = v58 + ((v59 + 32) & ~v59);
    v61 = v130;
    v62 = v99;
    v63 = v121;
    (*(void (**)(char *, uint64_t, uint64_t))(v130 + 16))(v99, v60, v121);
    v64 = (uint64_t)v120;
    sub_20DE1FBDC();
    (*(void (**)(char *, uint64_t))(v61 + 8))(v62, v63);
    v65 = 0;
    v66 = (uint64_t)v129;
    v67 = (uint64_t)v109;
  }
  else
  {
    v63 = v121;
    v66 = (uint64_t)v129;
    v61 = v130;
    v64 = (uint64_t)v120;
    v67 = (uint64_t)v109;
    v65 = 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v61 + 56))(v64, v65, 1, v63);
  sub_20DD8BACC(v51, v67, type metadata accessor for UsageDetailChart);
  v68 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v61 + 48))(v64, 1, v63);
  v107 = v56;
  v69 = v55;
  if (v68 == 1)
  {
    v70 = v127;
    v71 = (uint64_t)v96;
    sub_20DE1FD5C();
    Calendar.fullDay(for:)(v71, v66);
    v72 = v71;
    v57 = v126;
    (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v72, v98);
    sub_20DD909C0(v67, type metadata accessor for UsageDetailChart);
    sub_20DD851D0(v64, &qword_2549E7C60);
    v73 = v70;
  }
  else
  {
    sub_20DD909C0(v67, type metadata accessor for UsageDetailChart);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 32))(v66, v64, v63);
    v73 = v127;
  }
  v74 = v103;
  v75 = v128;
  v76 = sub_20DE0DCE0(v66, v51 + *(int *)(v73 + 24));
  MEMORY[0x24BDAC7A8](v76);
  *(&v95 - 2) = v77;
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7D80);
  v133 = v57;
  v134 = (uint64_t)v74;
  v135 = v69;
  v136 = v107;
  v79 = swift_getOpaqueTypeConformance2();
  v80 = sub_20DD8561C(&qword_2549E7D88, &qword_2549E7D80, MEMORY[0x24BDB82F0]);
  v81 = v112;
  v82 = v113;
  sub_20DE2086C();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v130 + 8))(v129, v63);
  (*(void (**)(char *, uint64_t))(v111 + 8))(v75, v82);
  v133 = v82;
  v134 = v78;
  v135 = v79;
  v136 = v80;
  swift_getOpaqueTypeConformance2();
  v83 = v117;
  v84 = v115;
  sub_20DE20884();
  (*(void (**)(char *, uint64_t))(v114 + 8))(v81, v84);
  v85 = v122;
  sub_20DE204DC();
  KeyPath = swift_getKeyPath();
  v87 = (uint64_t)v116;
  v88 = (uint64_t *)&v116[*(int *)(v110 + 36)];
  v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E9558);
  v91 = v123;
  v90 = v124;
  (*(void (**)(char *, char *, uint64_t))(v123 + 16))((char *)v88 + *(int *)(v89 + 28), v85, v124);
  *v88 = KeyPath;
  v92 = v118;
  v93 = v119;
  (*(void (**)(uint64_t, char *, uint64_t))(v118 + 16))(v87, v83, v119);
  (*(void (**)(char *, uint64_t))(v91 + 8))(v85, v90);
  (*(void (**)(char *, uint64_t))(v92 + 8))(v83, v93);
  return sub_20DE11860(v87, v125);
}

uint64_t sub_20DE10260@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t OpaqueTypeConformance2;
  unint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;

  v21 = a3;
  v5 = type metadata accessor for UsageDetailChart(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = type metadata accessor for UsageDetailChart.HourlyUsage(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = sub_20DE0EE64(a1, *(_QWORD *)(a2 + *(int *)(v5 + 20)));
  v12 = sub_20DDF9DF0(v11);
  swift_bridgeObjectRelease();
  v26 = v12;
  swift_getKeyPath();
  sub_20DD8BACC(a1, (uint64_t)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for UsageDetailChart.HourlyUsage);
  sub_20DD8BACC(a2, (uint64_t)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for UsageDetailChart);
  v13 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v14 = (v10 + *(unsigned __int8 *)(v6 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v15 = swift_allocObject();
  sub_20DD8BB14((uint64_t)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v13, type metadata accessor for UsageDetailChart.HourlyUsage);
  sub_20DD8BB14((uint64_t)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14, type metadata accessor for UsageDetailChart);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_20DE12D10;
  *(_QWORD *)(v16 + 24) = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBA90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549E9568);
  sub_20DD8561C(&qword_2549EBA98, &qword_2549EBA90, MEMORY[0x24BEE12D8]);
  v17 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549E9530);
  v22 = sub_20DE20260();
  v23 = MEMORY[0x24BDF3E48];
  v24 = MEMORY[0x24BDB8168];
  v25 = MEMORY[0x24BDF3E18];
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v19 = sub_20DD8BA88();
  v22 = v17;
  v23 = MEMORY[0x24BEE0D00];
  v24 = OpaqueTypeConformance2;
  v25 = v19;
  swift_getOpaqueTypeConformance2();
  return sub_20DE20B18();
}

uint64_t sub_20DE104F0@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>, double a7@<D0>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  double v36;
  char *v37;
  uint64_t v38;
  _QWORD v40[2];
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v54 = a5;
  v55 = a2;
  v56 = a3;
  v57 = a6;
  v53 = a1;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E81A8);
  MEMORY[0x24BDAC7A8](v9);
  v43 = (char *)v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E81B0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_20DE1FE7C();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_20DE1FD68();
  v41 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v19 = (char *)v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E81B8);
  MEMORY[0x24BDAC7A8](v20);
  v40[1] = (char *)v40 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_20DE20260();
  v23 = *(_QWORD *)(v22 - 8);
  v47 = v22;
  v48 = v23;
  MEMORY[0x24BDAC7A8](v22);
  v44 = (char *)v40 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E9530);
  v52 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v45 = (char *)v40 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E9568);
  v49 = *(_QWORD *)(v51 - 8);
  MEMORY[0x24BDAC7A8](v51);
  v46 = (char *)v40 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20DE2065C();
  _s16ScreenTimeUICore11DetailChartV4HourV2id10Foundation4DateVvg_0();
  (*(void (**)(char *, _QWORD, uint64_t))(v15 + 104))(v17, *MEMORY[0x24BDCF230], v14);
  v27 = sub_20DE1FE94();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v13, 1, 1, v27);
  sub_20DE20194();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_20DD851D0((uint64_t)v13, &qword_2549E81B0);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v19, v42);
  sub_20DE2065C();
  v58 = *(double *)(a4 + *(int *)(type metadata accessor for UsageDetailChart.HourlyUsage(0) + 20)) * a7;
  sub_20DE201A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v28 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v29 = objc_msgSend(v28, sel_model);

  sub_20DE20CB0();
  sub_20DE20D10();
  swift_bridgeObjectRelease();
  v30 = v44;
  sub_20DE20254();
  v31 = type metadata accessor for UsageDetailChart(0);
  v58 = COERCE_DOUBLE(UsageDetailChart.Model.orderedStackedBarColors(index:selectedItem:)(v53, *(_QWORD *)(v54 + *(int *)(v31 + 20))));
  v32 = MEMORY[0x24BDF3E48];
  v33 = MEMORY[0x24BDB8168];
  v34 = MEMORY[0x24BDF3E18];
  v35 = v45;
  v36 = *(double *)&v47;
  sub_20DE20110();
  swift_release();
  (*(void (**)(char *, double))(v48 + 8))(v30, COERCE_DOUBLE(*(_QWORD *)&v36));
  v62 = v55;
  v63 = v56;
  v58 = v36;
  v59 = v32;
  v60 = v33;
  v61 = v34;
  swift_getOpaqueTypeConformance2();
  sub_20DD8BA88();
  v37 = v46;
  v38 = v50;
  sub_20DE2011C();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v35, v38);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v49 + 32))(v57, v37, v51);
}

_QWORD *UsageDetailChart.Model.orderedStackedBarColors(index:selectedItem:)(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *result;
  uint64_t v9;

  v5 = *(_QWORD *)(v2 + *(int *)(type metadata accessor for UsageDetailChart.Model(0) + 32));
  if (a2)
  {
    if (*(_QWORD *)(a2 + 16))
    {
      type metadata accessor for UsageDetailChart.HourlyUsage(0);
      v6 = swift_bridgeObjectRetain();
      v7 = sub_20DD8D6D0(v6);
      swift_bridgeObjectRelease();
      v5 = v7[2];
      swift_release();
    }
  }
  result = (_QWORD *)(v5 + 1);
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    goto LABEL_9;
  }
  result = sub_20DE12DEC((uint64_t)result, 1);
  if ((a1 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (result[2] > a1)
  {
    v9 = result[a1 + 4];
    swift_retain();
    swift_bridgeObjectRelease();
    return (_QWORD *)v9;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t UsageDetailChart.Model.yAxisScale.getter()
{
  uint64_t v0;
  uint64_t v1;
  double v2;
  double v3;
  double v4;
  double v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7D68);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_20DE217C0;
  *(_QWORD *)(v1 + 32) = 0;
  UsageDetailChart.Model.maxUsage.getter();
  v2 = 3600.0;
  if (v3 > 3600.0)
    v2 = *(double *)(v0 + *(int *)(type metadata accessor for UsageDetailChart.Model(0) + 28));
  UsageDetailChart.Model.maxUsage.getter();
  v5 = v2 * ceil(v4 / v2);
  if (v5 <= v2)
    v5 = v2;
  *(double *)(v1 + 40) = v5;
  return v1;
}

uint64_t UsageDetailChart.Model.xAxisScale.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;

  v1 = sub_20DE1FD68();
  v2 = *(_QWORD *)(v1 - 8);
  v25 = v1;
  v26 = v2;
  MEMORY[0x24BDAC7A8](v1);
  v24 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for UsageDetailChart.Model(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C60);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_20DE1FC48();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v23 - v15;
  v17 = *(_QWORD *)(v0 + *(int *)(v4 + 20));
  if (*(_QWORD *)(v17 + 16))
  {
    v18 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for UsageDetailChart.HourlyUsage(0) - 8) + 80);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v17 + ((v18 + 32) & ~v18), v10);
    sub_20DE1FBDC();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    v19 = 0;
  }
  else
  {
    v19 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, v19, 1, v10);
  sub_20DD8BACC(v0, (uint64_t)v6, type metadata accessor for UsageDetailChart.Model);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    v20 = (uint64_t)v24;
    sub_20DE1FD5C();
    Calendar.fullDay(for:)(v20, (uint64_t)v16);
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v20, v25);
    sub_20DD909C0((uint64_t)v6, type metadata accessor for UsageDetailChart.Model);
    sub_20DD851D0((uint64_t)v9, &qword_2549E7C60);
  }
  else
  {
    sub_20DD909C0((uint64_t)v6, type metadata accessor for UsageDetailChart.Model);
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v9, v10);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7D48);
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_20DE217C0;
  _s16ScreenTimeUICore11DetailChartV4HourV2id10Foundation4DateVvg_0();
  sub_20DE1FC00();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
  return v21;
}

uint64_t UsageDetailChart.Model.yStride.getter()
{
  uint64_t v0;
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t result;
  double v7;
  double v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  BOOL v13;
  uint64_t v14;
  double v15;
  BOOL v16;
  unint64_t v17;
  unint64_t v18;
  double v19;
  BOOL v20;
  unint64_t v21;
  unint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  UsageDetailChart.Model.maxUsage.getter();
  v1 = 3600.0;
  if (v2 > 3600.0)
    v1 = *(double *)(v0 + *(int *)(type metadata accessor for UsageDetailChart.Model(0) + 28));
  UsageDetailChart.Model.maxUsage.getter();
  v4 = v1 * ceil(v3 / v1);
  if (v4 > v1)
    v5 = v4;
  else
    v5 = v1;
  result = type metadata accessor for UsageDetailChart.Model(0);
  v7 = v5 * 0.25;
  if (v5 * 0.25 == 0.0)
    goto LABEL_39;
  v8 = *(double *)(v0 + *(int *)(result + 28)) * 0.25 + v5;
  v9 = v8 >= 0.0;
  if (v7 > 0.0)
    v9 = v8 <= 0.0;
  if (!v9)
  {
    v11 = 0;
    while (1)
    {
      v10 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_37;
      v12 = (double)v10 * v7 + 0.0;
      v13 = v12 <= v8;
      if (v7 > 0.0)
        v13 = v8 <= v12;
      ++v11;
      if (v13)
        goto LABEL_16;
    }
  }
  v10 = 0;
LABEL_16:
  v24 = MEMORY[0x24BEE4AF8];
  sub_20DD8E878(0, v10 & ~(v10 >> 63), 0);
  result = v24;
  if (v10)
  {
    v14 = 0;
    v15 = 0.0;
    while (1)
    {
      v16 = v15 <= v8;
      if (v7 > 0.0)
        v16 = v8 <= v15;
      if (v16)
        break;
      v25 = result;
      v18 = *(_QWORD *)(result + 16);
      v17 = *(_QWORD *)(result + 24);
      if (v18 >= v17 >> 1)
      {
        sub_20DD8E878(v17 > 1, v18 + 1, 1);
        result = v25;
      }
      v19 = (double)++v14 * v7 + 0.0;
      *(_QWORD *)(result + 16) = v18 + 1;
      *(double *)(result + 8 * v18 + 32) = v15;
      v15 = v19;
      if (v10 == v14)
        goto LABEL_26;
    }
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
    return result;
  }
  v19 = 0.0;
LABEL_26:
  v20 = v19 <= v8;
  if (v7 > 0.0)
    v20 = v8 <= v19;
  if (!v20)
  {
    while (!__OFADD__(v10, 1))
    {
      v26 = result;
      v22 = *(_QWORD *)(result + 16);
      v21 = *(_QWORD *)(result + 24);
      if (v22 >= v21 >> 1)
      {
        sub_20DD8E878(v21 > 1, v22 + 1, 1);
        result = v26;
      }
      *(double *)(result + 8 * v22 + 32) = v19;
      v19 = (double)(v10 + 1) * v7 + 0.0;
      *(_QWORD *)(result + 16) = v22 + 1;
      v23 = v19 <= v8;
      if (v7 > 0.0)
        v23 = v8 <= v19;
      ++v10;
      if (v23)
        return result;
    }
    goto LABEL_38;
  }
  return result;
}

uint64_t UsageDetailChart.Model.lastY.getter()
{
  double v0;

  UsageDetailChart.Model.maxUsage.getter();
  if (v0 > 3600.0)
    type metadata accessor for UsageDetailChart.Model(0);
  return UsageDetailChart.Model.maxUsage.getter();
}

uint64_t UsageDetailChart.Model.maxUsage.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _BYTE v15[16];
  uint64_t v16;
  uint64_t v17;

  v1 = type metadata accessor for UsageDetailChart.HourlyUsage(0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v15[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for UsageDetailChart.Model(0) + 20));
  v16 = v0;
  swift_bridgeObjectRetain();
  v6 = sub_20DD85DA0((uint64_t (*)(char *))sub_20DE12DD4, (uint64_t)v15, v5);
  v7 = *(_QWORD *)(v6 + 16);
  if (v7)
  {
    v17 = MEMORY[0x24BEE4AF8];
    sub_20DD8E878(0, v7, 0);
    v8 = v6 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    v9 = *(_QWORD *)(v2 + 72);
    v10 = v17;
    do
    {
      sub_20DD8BACC(v8, (uint64_t)v4, type metadata accessor for UsageDetailChart.HourlyUsage);
      v11 = *(_QWORD *)&v4[*(int *)(v1 + 20)];
      sub_20DD909C0((uint64_t)v4, type metadata accessor for UsageDetailChart.HourlyUsage);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_20DD8E878(0, *(_QWORD *)(v10 + 16) + 1, 1);
        v10 = v17;
      }
      v13 = *(_QWORD *)(v10 + 16);
      v12 = *(_QWORD *)(v10 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_20DD8E878(v12 > 1, v13 + 1, 1);
        v10 = v17;
      }
      *(_QWORD *)(v10 + 16) = v13 + 1;
      *(_QWORD *)(v10 + 8 * v13 + 32) = v11;
      v8 += v9;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v10 = MEMORY[0x24BEE4AF8];
  }
  sub_20DD8B63C(v10);
  return swift_bridgeObjectRelease();
}

uint64_t sub_20DE11360()
{
  return sub_20DE2056C();
}

uint64_t sub_20DE11380(uint64_t a1)
{
  uint64_t v2;
  __n128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_20DE204E8();
  v3 = MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, __n128))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return sub_20DE20578();
}

_QWORD *sub_20DE113FC(_QWORD *a1)
{
  return sub_20DDB7B28(0, a1[2], 0, a1);
}

void sub_20DE11410()
{
  JUMPOUT(0x212BB5B84);
}

uint64_t sub_20DE11424(unint64_t a1)
{
  return sub_20DDB7C94(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_20DE11438(unint64_t a1)
{
  return sub_20DDB7CA8(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_20DE1144C(unint64_t a1)
{
  return sub_20DDB7EDC(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_20DE11460(unint64_t a1)
{
  return sub_20DDB7EF0(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_20DE11474(unint64_t a1)
{
  return sub_20DDB7F04(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_20DE11488(unint64_t a1)
{
  return sub_20DDB7F18(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_20DE1149C(unint64_t a1)
{
  return sub_20DDB7F2C(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_20DE114B0(unint64_t a1)
{
  return sub_20DDB7F40(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_20DE114C4(unint64_t a1)
{
  return sub_20DDB7F54(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_20DE114D8(unint64_t a1)
{
  return sub_20DDB7F68(0, *(_QWORD *)(a1 + 16), 0, a1);
}

_QWORD *sub_20DE114EC(_QWORD *a1)
{
  return sub_20DDB85D0(0, a1[2], 0, a1);
}

uint64_t _s16ScreenTimeUICore16UsageDetailChartV06HourlyD0V2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  if ((sub_20DE1FBF4() & 1) != 0
    && (v4 = type metadata accessor for UsageDetailChart.HourlyUsage(0),
        *(double *)(a1 + *(int *)(v4 + 20)) == *(double *)(a2 + *(int *)(v4 + 20)))
    && (v5 = v4, (sub_20DD856F8(*(_QWORD *)(a1 + *(int *)(v4 + 24)), *(_QWORD *)(a2 + *(int *)(v4 + 24))) & 1) != 0))
  {
    return sub_20DD856F8(*(_QWORD *)(a1 + *(int *)(v5 + 28)), *(_QWORD *)(a2 + *(int *)(v5 + 28)));
  }
  else
  {
    return 0;
  }
}

BOOL _s16ScreenTimeUICore16UsageDetailChartV5ModelV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  int *v4;

  if ((sub_20DE1FD44() & 1) != 0
    && (v4 = (int *)type metadata accessor for UsageDetailChart.Model(0),
        (sub_20DD87750(*(_QWORD *)(a1 + v4[5]), *(_QWORD *)(a2 + v4[5])) & 1) != 0)
    && (MEMORY[0x212BB4B40](a1 + v4[6], a2 + v4[6]) & 1) != 0
    && *(double *)(a1 + v4[7]) == *(double *)(a2 + v4[7]))
  {
    return *(_QWORD *)(a1 + v4[8]) == *(_QWORD *)(a2 + v4[8]);
  }
  else
  {
    return 0;
  }
}

uint64_t sub_20DE11618()
{
  return sub_20DE0E544() & 1;
}

uint64_t sub_20DE11634()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for UsageDetailChart(0) - 8) + 80);
  v2 = v0 + ((v1 + 16) & ~v1);
  v3 = sub_20DE1FD68();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  v4 = type metadata accessor for UsageDetailChart.Model(0);
  swift_bridgeObjectRelease();
  v5 = v2 + *(int *)(v4 + 24);
  v6 = sub_20DE1FE94();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20DE116F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for UsageDetailChart(0) - 8) + 80);
  return sub_20DE10260(a1, v2 + ((v5 + 16) & ~v5), a2);
}

unint64_t sub_20DE11744()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  unint64_t v4;
  _QWORD v5[5];

  result = qword_2549EB8A0;
  if (!qword_2549EB8A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549EB890);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549E9530);
    sub_20DE20260();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v4 = sub_20DD8BA88();
    v5[1] = v2;
    v5[2] = MEMORY[0x24BEE0D00];
    v5[3] = OpaqueTypeConformance2;
    v5[4] = v4;
    v5[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x212BB5FE0](MEMORY[0x24BDB8490], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2549EB8A0);
  }
  return result;
}

uint64_t sub_20DE11824@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_20DD8BDEC(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(_BYTE *)(v1 + 48), *(_QWORD *)(v1 + 56), a1, *(double *)(v1 + 40));
}

uint64_t sub_20DE1183C()
{
  return sub_20DE2056C();
}

uint64_t sub_20DE11860(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20DE118A8()
{
  return sub_20DD8512C(&qword_2549E8628, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], MEMORY[0x24BDCB890]);
}

uint64_t sub_20DE118D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for UsageDetailChart(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_20DE1FD68();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = (int *)type metadata accessor for UsageDetailChart.Model(0);
    *(uint64_t *)((char *)a1 + v8[5]) = *(uint64_t *)((char *)a2 + v8[5]);
    v9 = v8[6];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_20DE1FE94();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    *(uint64_t *)((char *)a1 + v8[7]) = *(uint64_t *)((char *)a2 + v8[7]);
    *(uint64_t *)((char *)a1 + v8[8]) = *(uint64_t *)((char *)a2 + v8[8]);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for UsageDetailChart(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = sub_20DE1FD68();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  v3 = type metadata accessor for UsageDetailChart.Model(0);
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(v3 + 24);
  v5 = sub_20DE1FE94();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UsageDetailChart(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);

  v6 = sub_20DE1FD68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = (int *)type metadata accessor for UsageDetailChart.Model(0);
  *(_QWORD *)(a1 + v7[5]) = *(_QWORD *)(a2 + v7[5]);
  v8 = v7[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_20DE1FE94();
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  *(_QWORD *)(a1 + v7[7]) = *(_QWORD *)(a2 + v7[7]);
  *(_QWORD *)(a1 + v7[8]) = *(_QWORD *)(a2 + v7[8]);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UsageDetailChart(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_20DE1FD68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = (int *)type metadata accessor for UsageDetailChart.Model(0);
  *(_QWORD *)(a1 + v7[5]) = *(_QWORD *)(a2 + v7[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = v7[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_20DE1FE94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  *(_QWORD *)(a1 + v7[7]) = *(_QWORD *)(a2 + v7[7]);
  *(_QWORD *)(a1 + v7[8]) = *(_QWORD *)(a2 + v7[8]);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for UsageDetailChart(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_20DE1FD68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = (int *)type metadata accessor for UsageDetailChart.Model(0);
  *(_QWORD *)(a1 + v7[5]) = *(_QWORD *)(a2 + v7[5]);
  v8 = v7[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_20DE1FE94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  *(_QWORD *)(a1 + v7[7]) = *(_QWORD *)(a2 + v7[7]);
  *(_QWORD *)(a1 + v7[8]) = *(_QWORD *)(a2 + v7[8]);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for UsageDetailChart(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_20DE1FD68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = (int *)type metadata accessor for UsageDetailChart.Model(0);
  *(_QWORD *)(a1 + v7[5]) = *(_QWORD *)(a2 + v7[5]);
  swift_bridgeObjectRelease();
  v8 = v7[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_20DE1FE94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  *(_QWORD *)(a1 + v7[7]) = *(_QWORD *)(a2 + v7[7]);
  *(_QWORD *)(a1 + v7[8]) = *(_QWORD *)(a2 + v7[8]);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UsageDetailChart()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE11DD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = type metadata accessor for UsageDetailChart.Model(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for UsageDetailChart()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE11E68(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for UsageDetailChart.Model(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = a2;
  return result;
}

uint64_t sub_20DE11EE0()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UsageDetailChart.Model(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for UsageDetailChart.HourlyUsage(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_20DE1FC48();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for UsageDetailChart.HourlyUsage(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UsageDetailChart.HourlyUsage(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UsageDetailChart.HourlyUsage(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;

  v6 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for UsageDetailChart.HourlyUsage(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for UsageDetailChart.HourlyUsage(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UsageDetailChart.HourlyUsage()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE12254(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_20DE1FC48();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for UsageDetailChart.HourlyUsage()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE122DC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_20DE1FC48();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t sub_20DE12354()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20DE1FC48();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for UsageDetailChart.Model(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_20DE1FD68();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_20DE1FE94();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)a1 + v13) = *(uint64_t *)((char *)a2 + v13);
  }
  return a1;
}

uint64_t initializeWithCopy for UsageDetailChart.Model(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v6 = sub_20DE1FD68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_20DE1FE94();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v12) = *(_QWORD *)(a2 + v12);
  return a1;
}

uint64_t assignWithCopy for UsageDetailChart.Model(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_20DE1FD68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = a3[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_20DE1FE94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  return a1;
}

uint64_t initializeWithTake for UsageDetailChart.Model(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_20DE1FD68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_20DE1FE94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v11) = *(_QWORD *)(a2 + v11);
  return a1;
}

uint64_t assignWithTake for UsageDetailChart.Model(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_20DE1FD68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  swift_bridgeObjectRelease();
  v7 = a3[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_20DE1FE94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v11) = *(_QWORD *)(a2 + v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for UsageDetailChart.Model()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE1277C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = sub_20DE1FD68();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = sub_20DE1FE94();
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for UsageDetailChart.Model()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE12830(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = sub_20DE1FD68();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
      return result;
    }
    v10 = sub_20DE1FE94();
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_20DE128D4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_20DE1FD68();
  if (v1 <= 0x3F)
  {
    result = sub_20DE1FE94();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unint64_t sub_20DE12978()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[6];

  result = qword_2549EBA80;
  if (!qword_2549EBA80)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549EB880);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549EB870);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549EB868);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549E7D80);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549E7FE8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549E7D90);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549EB860);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549E7D50);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549EB858);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549E7D70);
    sub_20DD8561C(&qword_2549EB8B0, &qword_2549EB858, MEMORY[0x24BDB8148]);
    sub_20DD8BB84(&qword_2549E7D78, &qword_2549E7D70, MEMORY[0x24BDB84C8]);
    swift_getOpaqueTypeConformance2();
    sub_20DD8BB84(&qword_2549E7D58, &qword_2549E7D50, MEMORY[0x24BDB7A98]);
    swift_getOpaqueTypeConformance2();
    v1 = MEMORY[0x24BDB82F0];
    sub_20DD8561C(&qword_2549E7D98, &qword_2549E7D90, MEMORY[0x24BDB82F0]);
    v4[4] = swift_getOpaqueTypeConformance2();
    v4[5] = sub_20DD8561C(&qword_2549E7D88, &qword_2549E7D80, v1);
    v4[2] = v2;
    v4[3] = swift_getOpaqueTypeConformance2();
    v4[0] = swift_getOpaqueTypeConformance2();
    v4[1] = sub_20DD8561C(&qword_2549EBA88, &qword_2549E9558, MEMORY[0x24BDF1028]);
    result = MEMORY[0x212BB5FE0](MEMORY[0x24BDED308], v3, v4);
    atomic_store(result, (unint64_t *)&qword_2549EBA80);
  }
  return result;
}

ValueMetadata *type metadata accessor for UsageDetailChart.Model.TopCategoryRatio()
{
  return &type metadata for UsageDetailChart.Model.TopCategoryRatio;
}

uint64_t sub_20DE12BE4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(type metadata accessor for UsageDetailChart.HourlyUsage(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for UsageDetailChart(0) - 8) + 80);
  v5 = (v2 + v3 + v4) & ~v4;
  v6 = sub_20DE1FC48();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v0 + v2, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = sub_20DE1FD68();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v0 + v5, v7);
  v8 = type metadata accessor for UsageDetailChart.Model(0);
  swift_bridgeObjectRelease();
  v9 = v0 + v5 + *(int *)(v8 + 24);
  v10 = sub_20DE1FE94();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20DE12D10@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  uint64_t v5;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v11 = *(_QWORD *)(type metadata accessor for UsageDetailChart.HourlyUsage(0) - 8);
  v12 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v13 = *(_QWORD *)(v11 + 64);
  v14 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for UsageDetailChart(0) - 8) + 80);
  return sub_20DE104F0(a1, a2, a3, v5 + v12, v5 + ((v12 + v13 + v14) & ~v14), a4, a5);
}

uint64_t sub_20DE12DB0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20DE12DD4()
{
  return sub_20DE11618() & 1;
}

_QWORD *sub_20DE12DEC(uint64_t a1, char a2)
{
  uint64_t inited;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549E9060);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20DE24590;
  v5 = (void *)objc_opt_self();
  *(_QWORD *)(inited + 32) = MEMORY[0x212BB56D4](objc_msgSend(v5, sel_systemBlueColor));
  *(_QWORD *)(inited + 40) = MEMORY[0x212BB56D4](objc_msgSend(v5, sel_systemTealColor));
  *(_QWORD *)(inited + 48) = MEMORY[0x212BB56D4](objc_msgSend(v5, sel_systemOrangeColor));
  if (qword_2549E7A08 != -1)
    swift_once();
  *(_QWORD *)(inited + 56) = qword_2549EF588;
  sub_20DE20D40();
  v6 = swift_retain_n();
  v7 = sub_20DE0D80C(v6, a1);
  v15 = (_QWORD *)v7;
  if ((a2 & 1) != 0 && __OFSUB__(a1--, 1))
    goto LABEL_30;
  if (a1 >= 4)
    v9 = 4;
  else
    v9 = a1;
  if (v9 < 0)
  {
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    sub_20DE11410();
  }
  if (!v9)
  {
    swift_bridgeObjectRelease();
    return (_QWORD *)v7;
  }
  if ((unint64_t)(v9 - 1) >= *(_QWORD *)(inited + 16))
    goto LABEL_27;
  v10 = *(_QWORD *)(inited + 32);
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_28;
  if (!v15[2])
    goto LABEL_29;
  v15[4] = v10;
  swift_release();
  sub_20DE20D40();
  if (v9 == 1)
    goto LABEL_23;
  v11 = *(_QWORD *)(inited + 40);
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_31;
  if (v15[2] < 2uLL)
    goto LABEL_29;
  v15[5] = v11;
  swift_release();
  sub_20DE20D40();
  if (v9 == 2)
    goto LABEL_23;
  v12 = *(_QWORD *)(inited + 48);
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    sub_20DE11410();
  if (v15[2] < 3uLL)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    sub_20DE11410();
  }
  v15[6] = v12;
  swift_release();
  sub_20DE20D40();
  if (v9 != 3)
  {
    v13 = *(_QWORD *)(inited + 56);
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      sub_20DE11410();
    if (v15[2] >= 4uLL)
    {
      v15[7] = v13;
      swift_release();
      sub_20DE20D40();
      goto LABEL_23;
    }
    goto LABEL_29;
  }
LABEL_23:
  swift_bridgeObjectRelease();
  return v15;
}

void sub_20DE130BC()
{
  JUMPOUT(0x20DE12FF8);
}

BOOL static ChartFormats.DataType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ChartFormats.DataType.hash(into:)()
{
  return sub_20DE20F2C();
}

uint64_t ChartFormats.DataType.hashValue.getter()
{
  sub_20DE20F20();
  sub_20DE20F2C();
  return sub_20DE20F38();
}

BOOL sub_20DE1314C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ChartFormats.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ChartFormats.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

unint64_t sub_20DE13180()
{
  unint64_t result;

  result = qword_2549EBAA8;
  if (!qword_2549EBAA8)
  {
    result = MEMORY[0x212BB5FE0](&protocol conformance descriptor for ChartFormats.DataType, &type metadata for ChartFormats.DataType);
    atomic_store(result, (unint64_t *)&qword_2549EBAA8);
  }
  return result;
}

uint64_t type metadata accessor for ChartFormats()
{
  return objc_opt_self();
}

uint64_t method lookup function for ChartFormats()
{
  return swift_lookUpClassMethod();
}

uint64_t getEnumTagSinglePayload for ChartFormats.DataType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ChartFormats.DataType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20DE132CC + 4 * byte_20DE245A5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_20DE13300 + 4 * byte_20DE245A0[v4]))();
}

uint64_t sub_20DE13300(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20DE13308(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20DE13310);
  return result;
}

uint64_t sub_20DE1331C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20DE13324);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_20DE13328(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20DE13330(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_20DE1333C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ChartFormats.DataType()
{
  return &type metadata for ChartFormats.DataType;
}

uint64_t sub_20DE13358()
{
  id v0;
  uint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_bundle);
  result = sub_20DE209BC();
  qword_2549EF588 = result;
  return result;
}

uint64_t sub_20DE133B0(uint64_t a1)
{
  return sub_20DE133EC(a1, (SEL *)&selRef_labelColor, &qword_2549EF590);
}

uint64_t sub_20DE133C4(uint64_t a1)
{
  return sub_20DE133EC(a1, (SEL *)&selRef_quaternaryLabelColor, &qword_2549EF5A0);
}

uint64_t sub_20DE133D8(uint64_t a1)
{
  return sub_20DE133EC(a1, (SEL *)&selRef_secondaryLabelColor, &qword_2549EF5A8);
}

uint64_t sub_20DE133EC(uint64_t a1, SEL *a2, uint64_t *a3)
{
  id v4;
  uint64_t result;

  v4 = objc_msgSend((id)objc_opt_self(), *a2);
  result = MEMORY[0x212BB56D4](v4);
  *a3 = result;
  return result;
}

uint64_t sub_20DE13430()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7BA0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_20DE207B8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  v4 = sub_20DE207DC();
  result = sub_20DDF39BC((uint64_t)v2);
  qword_2549EF5B0 = v4;
  return result;
}

uint64_t sub_20DE134D0(uint64_t result, double a2, double a3)
{
  int v4;
  uint64_t v5;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;

  if (a3 == 3600.0)
    v4 = *(unsigned __int8 *)result;
  else
    v4 = 1;
  if (v4)
    v5 = 96;
  else
    v5 = 64;
  if (a2 != a3 && a3 * 0.5 != a2)
    goto LABEL_20;
  if ((*(_BYTE *)result & 1) != 0)
  {
    if ((~*(_QWORD *)&a2 & 0x7FF0000000000000) != 0)
    {
      if (a2 > -9.22337204e18)
      {
        if (a2 < 9.22337204e18)
        {
          sub_20DDD3EC8();
          v7 = sub_20DE20E3C();
          goto LABEL_21;
        }
LABEL_26:
        __break(1u);
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_26;
  }
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD14F8]), sel_init);
  objc_msgSend(v8, sel_setAllowedUnits_, v5);
  objc_msgSend(v8, sel_setUnitsStyle_, 1);
  objc_msgSend(v8, sel_setZeroFormattingBehavior_, 14);
  v9 = objc_msgSend(v8, sel_stringFromTimeInterval_, a2);
  if (!v9)
  {

LABEL_20:
    v7 = 0;
    goto LABEL_21;
  }
  v10 = v9;
  v7 = sub_20DE20CB0();

LABEL_21:
  if (a2 == 0.0)
  {
    swift_bridgeObjectRelease();
    return 48;
  }
  return v7;
}

uint64_t ScreenTimeNotificationsAppIntentView.Model.App.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ScreenTimeNotificationsAppIntentView.Model.App.localizedName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ScreenTimeNotificationsAppIntentView.Model.App.notificationCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t sub_20DE136CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v1 = type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0);
  v2 = sub_20DD9CF3C(v0 + *(int *)(v1 + 24));
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v4 = v2 + 40;
    v5 = MEMORY[0x24BEE4AF8];
    do
    {
      v9 = *(_QWORD *)(v4 - 8);
      v10 = *(_QWORD *)v4;
      v11 = *(_QWORD *)(v4 + 16);
      v12 = *(_QWORD *)(v4 + 24);
      if (v9 != v11 || v10 != v12)
      {
        v14 = *(_QWORD *)(v4 + 8);
        v15 = *(_QWORD *)(v4 + 32);
        v16 = *(_BYTE *)(v4 + 40);
        if ((sub_20DE20EF0() & 1) == 0)
        {
          swift_retain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v22 = v14;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            sub_20DD8EB08(0, *(_QWORD *)(v5 + 16) + 1, 1);
          v7 = *(_QWORD *)(v5 + 16);
          v6 = *(_QWORD *)(v5 + 24);
          if (v7 >= v6 >> 1)
            sub_20DD8EB08(v6 > 1, v7 + 1, 1);
          *(_QWORD *)(v5 + 16) = v7 + 1;
          v8 = v5 + 56 * v7;
          *(_QWORD *)(v8 + 32) = v9;
          *(_QWORD *)(v8 + 40) = v10;
          *(_QWORD *)(v8 + 48) = v22;
          *(_QWORD *)(v8 + 56) = v11;
          *(_QWORD *)(v8 + 64) = v12;
          *(_QWORD *)(v8 + 72) = v15;
          *(_BYTE *)(v8 + 80) = v16;
        }
      }
      v4 += 56;
      --v3;
    }
    while (v3);
  }
  else
  {
    v5 = MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v5 + 16) >= 3uLL)
    v17 = 3;
  else
    v17 = *(_QWORD *)(v5 + 16);
  sub_20DE20EFC();
  swift_unknownObjectRetain_n();
  v18 = swift_dynamicCastClass();
  if (!v18)
  {
    swift_release();
    v18 = MEMORY[0x24BEE4AF8];
  }
  v19 = *(_QWORD *)(v18 + 16);
  swift_release();
  if (v19 == v17)
  {
    v20 = swift_dynamicCastClass();
    if (!v20)
    {
      swift_release();
      v20 = MEMORY[0x24BEE4AF8];
    }
  }
  else
  {
    swift_release();
    v20 = sub_20DD8DAF0(v5, v5 + 32, 0, (2 * v17) | 1);
  }
  swift_release();
  return v20;
}

uint64_t sub_20DE138E8()
{
  uint64_t v0;
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;

  v0 = sub_20DE136CC();
  v1 = *(_QWORD *)(v0 + 16);
  if (v1)
  {
    v16 = MEMORY[0x24BEE4AF8];
    sub_20DD8E894(0, v1, 0);
    v2 = 0;
    v3 = v16;
    v12 = v0;
    do
    {
      v4 = *(_QWORD *)(v0 + v2 + 40);
      v15 = *(_QWORD *)(v0 + v2 + 32);
      v5 = *(_QWORD *)(v0 + v2 + 48);
      v13 = *(_QWORD *)(v0 + v2 + 56);
      v6 = *(_QWORD *)(v0 + v2 + 64);
      v7 = *(_QWORD *)(v0 + v2 + 72);
      v14 = *(_BYTE *)(v0 + v2 + 80);
      v9 = *(_QWORD *)(v16 + 16);
      v8 = *(_QWORD *)(v16 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      if (v9 >= v8 >> 1)
        sub_20DD8E894(v8 > 1, v9 + 1, 1);
      *(_QWORD *)(v16 + 16) = v9 + 1;
      v10 = v16 + 56 * v9;
      *(_QWORD *)(v10 + 32) = v15;
      *(_QWORD *)(v10 + 40) = v4;
      v0 = v12;
      *(_QWORD *)(v10 + 48) = v13;
      *(_QWORD *)(v10 + 56) = v6;
      *(_QWORD *)(v10 + 64) = v7;
      *(double *)(v10 + 72) = (double)v5;
      *(_BYTE *)(v10 + 80) = v14;
      *(_WORD *)(v10 + 81) = 0;
      v2 += 56;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t ScreenTimeNotificationsAppIntentView.Model.appsEmittingMostNotifications.getter()
{
  uint64_t v0;
  int64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;

  v0 = sub_20DE136CC();
  v1 = *(_QWORD *)(v0 + 16);
  if (v1)
  {
    v13 = MEMORY[0x24BEE4AF8];
    sub_20DD8EB34(0, v1, 0);
    v2 = v13;
    v3 = (uint64_t *)(v0 + 64);
    do
    {
      v5 = *(v3 - 4);
      v4 = *(v3 - 3);
      v6 = *(v3 - 1);
      v12 = *(v3 - 2);
      v7 = *v3;
      v8 = *(_QWORD *)(v13 + 16);
      v9 = *(_QWORD *)(v13 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v8 >= v9 >> 1)
        sub_20DD8EB34(v9 > 1, v8 + 1, 1);
      *(_QWORD *)(v13 + 16) = v8 + 1;
      v10 = (_QWORD *)(v13 + 40 * v8);
      v10[4] = v5;
      v10[5] = v4;
      v10[6] = v6;
      v10[7] = v7;
      v10[8] = v12;
      v3 += 7;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  return v2;
}

uint64_t ScreenTimeNotificationsAppIntentView.Model.init(allActivityModel:mode:interval:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD v15[5];
  uint64_t v16;
  _QWORD v17[11];

  if (a2 == 1)
  {
    v7 = *(int *)(type metadata accessor for AllActivityView.Model(0) + 96);
  }
  else
  {
    if (a2)
    {
      v17[4] = type metadata accessor for ScreenTimeAppInfoCache();
      v17[5] = &off_24C881120;
      v17[1] = swift_allocObject();
      v17[9] = type metadata accessor for ScreenTimeAppIconCache();
      v17[10] = &off_24C8810F8;
      v17[6] = swift_allocObject();
      v17[0] = sub_20DDD5C24(MEMORY[0x24BEE4AF8]);
      goto LABEL_7;
    }
    v7 = *(int *)(type metadata accessor for AllActivityView.Model(0) + 100);
  }
  sub_20DDE6C6C(a1 + v7, (uint64_t)v17);
LABEL_7:
  v8 = type metadata accessor for AllActivityView.Model(0);
  sub_20DDE6C6C(a1 + *(int *)(v8 + 100), (uint64_t)v15);
  v9 = sub_20DD9D430(a3);
  sub_20DD909C0(a1, type metadata accessor for AllActivityView.Model);
  sub_20DE14610((uint64_t)v17);
  v10 = v15[3];
  *(_OWORD *)(a4 + 32) = v15[2];
  *(_OWORD *)(a4 + 48) = v10;
  *(_OWORD *)(a4 + 64) = v15[4];
  *(_QWORD *)(a4 + 80) = v16;
  v11 = v15[1];
  *(_OWORD *)a4 = v15[0];
  *(_OWORD *)(a4 + 16) = v11;
  *(double *)(a4 + 88) = (double)v9;
  v12 = a4 + *(int *)(type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0) + 24);
  v13 = sub_20DE1FC48();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v12, a3, v13);
}

uint64_t ScreenTimeNotificationsAppIntentView.init(model:mode:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  _QWORD v16[4];

  v6 = type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v16 - v10;
  sub_20DD8BACC(a1, (uint64_t)v16 - v10, type metadata accessor for ScreenTimeNotificationsAppIntentView.Model);
  sub_20DD8BACC((uint64_t)v11, (uint64_t)v8, type metadata accessor for ScreenTimeNotificationsAppIntentView.Model);
  sub_20DE20A28();
  sub_20DD909C0((uint64_t)v11, type metadata accessor for ScreenTimeNotificationsAppIntentView.Model);
  v12 = (_QWORD *)(a3 + *(int *)(type metadata accessor for ScreenTimeNotificationsAppIntentView(0) + 20));
  v16[1] = a2;
  type metadata accessor for STActivityMode(0);
  sub_20DE20A28();
  v13 = v16[2];
  v14 = v16[3];
  result = sub_20DD909C0(a1, type metadata accessor for ScreenTimeNotificationsAppIntentView.Model);
  *v12 = v13;
  v12[1] = v14;
  return result;
}

uint64_t ScreenTimeNotificationsAppIntentView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD v14[2];

  v2 = v1;
  v4 = type metadata accessor for ScreenTimeNotificationsAppIntentView(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)a1 = sub_20DE20698();
  *(_QWORD *)(a1 + 8) = 0x4024000000000000;
  *(_BYTE *)(a1 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBB48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBB50);
  sub_20DE20A34();
  v10 = sub_20DE138E8();
  sub_20DD909C0((uint64_t)v9, type metadata accessor for ScreenTimeNotificationsAppIntentView.Model);
  v14[1] = v10;
  sub_20DD8BACC(v2, (uint64_t)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ScreenTimeNotificationsAppIntentView);
  v11 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v12 = swift_allocObject();
  sub_20DE14670((uint64_t)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v12 + v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBB58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBB60);
  sub_20DD8561C(&qword_2549EBB68, &qword_2549EBB58, MEMORY[0x24BEE12D8]);
  sub_20DD8561C(&qword_2549EBB70, &qword_2549EBB60, MEMORY[0x24BDF5428]);
  sub_20DDFD1B0();
  return sub_20DE20B30();
}

uint64_t sub_20DE13FC0@<X0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v31;
  uint64_t v32;
  uint64_t v33;
  unsigned __int8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _OWORD *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _OWORD *v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  int v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  char v82;
  char v83;
  int v84;
  char v85;
  uint64_t v86;
  char v87;
  char v88;
  int v89;
  __int16 v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  __int16 v99;
  unsigned __int8 v100;
  int v101;
  char v102;

  v58 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBCB8);
  MEMORY[0x24BDAC7A8](v3);
  v63 = (uint64_t)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v51 - v6;
  v8 = type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v51 - v12;
  v14 = *a1;
  v15 = a1[1];
  v16 = a1[2];
  v17 = a1[3];
  v18 = a1[4];
  v19 = a1[5];
  v20 = *((unsigned __int8 *)a1 + 48);
  v60 = *((unsigned __int8 *)a1 + 49);
  v64 = *((unsigned __int8 *)a1 + 50);
  v65 = v20;
  v61 = v18;
  v62 = v16;
  swift_retain();
  swift_bridgeObjectRetain();
  v66 = v17;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBB50);
  sub_20DE20A34();
  v59 = *((_QWORD *)v13 + 11);
  sub_20DD909C0((uint64_t)v13, type metadata accessor for ScreenTimeNotificationsAppIntentView.Model);
  type metadata accessor for CGSize(0);
  v67 = 0uLL;
  sub_20DE20A28();
  v21 = v75;
  v22 = v76;
  v57 = v77;
  v67 = 0uLL;
  sub_20DE20A28();
  v23 = v75;
  v24 = v76;
  v56 = v77;
  v100 = 0;
  swift_bridgeObjectRetain();
  sub_20DE20A34();
  v25 = sub_20DE138E8();
  sub_20DD909C0((uint64_t)v10, type metadata accessor for ScreenTimeNotificationsAppIntentView.Model);
  v26 = *(_QWORD *)(v25 + 16);
  if (v26)
  {
    v27 = v25 + 56 * v26;
    v29 = *(_QWORD *)(v27 - 24);
    v28 = *(_QWORD *)(v27 - 16);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_release();
    swift_bridgeObjectRelease();
    if (v14 == v29 && v15 == v28)
    {
      swift_bridgeObjectRelease_n();
LABEL_11:
      v33 = sub_20DE20B00();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v7, 1, 1, v33);
      goto LABEL_12;
    }
    v31 = sub_20DE20EF0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v31 & 1) != 0)
      goto LABEL_11;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_20DE20AF4();
  v32 = sub_20DE20B00();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v7, 0, 1, v32);
LABEL_12:
  v52 = v14;
  v34 = v100;
  v54 = v100;
  v35 = v63;
  sub_20DE1567C((uint64_t)v7, v63);
  *(_QWORD *)&v67 = v14;
  *((_QWORD *)&v67 + 1) = v15;
  v55 = v15;
  v53 = v7;
  v37 = v61;
  v36 = v62;
  *(_QWORD *)&v68 = v62;
  *((_QWORD *)&v68 + 1) = v66;
  *(_QWORD *)&v69 = v61;
  *((_QWORD *)&v69 + 1) = v19;
  LOBYTE(v70) = v65;
  v38 = v60;
  BYTE1(v70) = v60;
  BYTE2(v70) = v64;
  *(_DWORD *)((char *)&v70 + 3) = v101;
  BYTE7(v70) = v102;
  v39 = v59;
  *((_QWORD *)&v70 + 1) = v59;
  LOBYTE(v71) = v34;
  BYTE1(v71) = 2;
  WORD3(v71) = v99;
  *(_DWORD *)((char *)&v71 + 2) = v98;
  *((_QWORD *)&v71 + 1) = 0x4010000000000000;
  *(_QWORD *)&v72 = v21;
  *((_QWORD *)&v72 + 1) = v22;
  v41 = v56;
  v40 = v57;
  *(_QWORD *)&v73 = v57;
  *((_QWORD *)&v73 + 1) = v23;
  *(_QWORD *)&v74 = v24;
  *((_QWORD *)&v74 + 1) = v56;
  v42 = v67;
  v43 = v68;
  v44 = v70;
  v45 = v58;
  v58[2] = v69;
  v45[3] = v44;
  *v45 = v42;
  v45[1] = v43;
  v46 = v71;
  v47 = v72;
  v48 = v74;
  v45[6] = v73;
  v45[7] = v48;
  v45[4] = v46;
  v45[5] = v47;
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBCC0);
  sub_20DE1567C(v35, (uint64_t)v45 + *(int *)(v49 + 48));
  sub_20DE156C4((uint64_t)&v67);
  sub_20DE15728((uint64_t)v53);
  sub_20DE15728(v35);
  v75 = v52;
  v76 = v55;
  v77 = v36;
  v78 = v66;
  v79 = v37;
  v80 = v19;
  v81 = v65;
  v82 = v38;
  v83 = v64;
  v84 = v101;
  v85 = v102;
  v86 = v39;
  v87 = v54;
  v88 = 2;
  v90 = v99;
  v89 = v98;
  v91 = 0x4010000000000000;
  v92 = v21;
  v93 = v22;
  v94 = v40;
  v95 = v23;
  v96 = v24;
  v97 = v41;
  return sub_20DE15768((uint64_t)&v75);
}

uint64_t sub_20DE14434@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD v14[2];

  v3 = v2;
  v5 = *(_QWORD *)(a1 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v7 = type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)a2 = sub_20DE20698();
  *(_QWORD *)(a2 + 8) = 0x4024000000000000;
  *(_BYTE *)(a2 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBB48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBB50);
  sub_20DE20A34();
  v10 = sub_20DE138E8();
  sub_20DD909C0((uint64_t)v9, type metadata accessor for ScreenTimeNotificationsAppIntentView.Model);
  v14[1] = v10;
  sub_20DD8BACC(v3, (uint64_t)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ScreenTimeNotificationsAppIntentView);
  v11 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v12 = swift_allocObject();
  sub_20DE14670((uint64_t)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v12 + v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBB58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBB60);
  sub_20DD8561C(&qword_2549EBB68, &qword_2549EBB58, MEMORY[0x24BEE12D8]);
  sub_20DD8561C(&qword_2549EBB70, &qword_2549EBB60, MEMORY[0x24BDF5428]);
  sub_20DDFD1B0();
  return sub_20DE20B30();
}

uint64_t sub_20DE14610(uint64_t a1)
{
  destroy for MostUsedListSectionNotifications.Model(a1);
  return a1;
}

uint64_t type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(uint64_t a1)
{
  return sub_20DD87B48(a1, qword_2549EBC68);
}

uint64_t type metadata accessor for ScreenTimeNotificationsAppIntentView(uint64_t a1)
{
  return sub_20DD87B48(a1, (uint64_t *)&unk_2549EBBD0);
}

uint64_t sub_20DE14670(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ScreenTimeNotificationsAppIntentView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20DE146B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for ScreenTimeNotificationsAppIntentView(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  __int128 v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t *, uint64_t);
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = v4 + ((v3 + 16) & ~(unint64_t)v3);
  }
  else
  {
    v7 = a1;
    v8 = a1 + 8;
    v9 = a2 + 1;
    v10 = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 32) = v10;
    v11 = v10;
    v12 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v10 - 8);
    swift_bridgeObjectRetain();
    v12(v8, v9, v11);
    v13 = *(_OWORD *)(a2 + 9);
    *(_OWORD *)(v7 + 72) = v13;
    (**(void (***)(uint64_t, uint64_t))(v13 - 8))(v7 + 48, (uint64_t)(a2 + 6));
    *(_QWORD *)(v7 + 88) = a2[11];
    v14 = *(int *)(type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0) + 24);
    v15 = v7 + v14;
    v16 = (uint64_t)a2 + v14;
    v17 = sub_20DE1FC48();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBB50);
    *(_QWORD *)(v7 + *(int *)(v18 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v18 + 28));
    v19 = *(int *)(a3 + 20);
    v20 = (_QWORD *)(v7 + v19);
    v21 = (uint64_t *)((char *)a2 + v19);
    v22 = v21[1];
    *v20 = *v21;
    v20[1] = v22;
    swift_retain();
  }
  swift_retain();
  return v7;
}

uint64_t destroy for ScreenTimeNotificationsAppIntentView(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  v2 = a1 + *(int *)(type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0) + 24);
  v3 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBB50);
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for ScreenTimeNotificationsAppIntentView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = a2 + 8;
  v7 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v7;
  v8 = v7;
  v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  swift_bridgeObjectRetain();
  v9(a1 + 8, v6, v8);
  v10 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 72) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 48, a2 + 48);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  v11 = *(int *)(type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0) + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBB50);
  *(_QWORD *)(a1 + *(int *)(v15 + 28)) = *(_QWORD *)(a2 + *(int *)(v15 + 28));
  v16 = *(int *)(a3 + 20);
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for ScreenTimeNotificationsAppIntentView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 1, a2 + 1);
  __swift_assign_boxed_opaque_existential_1(a1 + 6, a2 + 6);
  a1[11] = a2[11];
  v6 = *(int *)(type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0) + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_20DE1FC48();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBB50);
  *(_QWORD *)((char *)a1 + *(int *)(v10 + 28)) = *(_QWORD *)((char *)a2 + *(int *)(v10 + 28));
  swift_retain();
  swift_release();
  v11 = *(int *)(a3 + 20);
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for ScreenTimeNotificationsAppIntentView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v7;
  v8 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v8;
  v9 = *(int *)(type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0) + 24);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBB50);
  *(_QWORD *)(a1 + *(int *)(v13 + 28)) = *(_QWORD *)(a2 + *(int *)(v13 + 28));
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for ScreenTimeNotificationsAppIntentView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  v6 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v6;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  v7 = *(int *)(type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0) + 24);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBB50);
  *(_QWORD *)(a1 + *(int *)(v11 + 28)) = *(_QWORD *)(a2 + *(int *)(v11 + 28));
  swift_release();
  v12 = *(int *)(a3 + 20);
  v13 = (_QWORD *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v16 = *v14;
  v15 = v14[1];
  *v13 = v16;
  v13[1] = v15;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ScreenTimeNotificationsAppIntentView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE14C40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBB50);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for ScreenTimeNotificationsAppIntentView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE14CDC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBB50);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  return result;
}

void sub_20DE14D5C()
{
  unint64_t v0;

  sub_20DE14DCC();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_20DE14DCC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2549EBBE0)
  {
    type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(255);
    v0 = sub_20DE20A58();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2549EBBE0);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for ScreenTimeNotificationsAppIntentView.Model(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t *v8;
  __int128 v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t *, uint64_t);
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    v8 = a2 + 1;
    v9 = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 32) = v9;
    v10 = v9;
    v11 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v9 - 8);
    swift_bridgeObjectRetain();
    v11(a1 + 8, v8, v10);
    v12 = *(_OWORD *)(a2 + 9);
    *(_OWORD *)(a1 + 72) = v12;
    (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 48, (uint64_t)(a2 + 6));
    *(_QWORD *)(a1 + 88) = a2[11];
    v13 = *(int *)(a3 + 24);
    v14 = a1 + v13;
    v15 = (uint64_t)a2 + v13;
    v16 = sub_20DE1FC48();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t destroy for ScreenTimeNotificationsAppIntentView.Model(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a1 + 48;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  __swift_destroy_boxed_opaque_existential_1(v4);
  v5 = a1 + *(int *)(a2 + 24);
  v6 = sub_20DE1FC48();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t initializeWithCopy for ScreenTimeNotificationsAppIntentView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = a2 + 8;
  v7 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v7;
  v8 = v7;
  v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  swift_bridgeObjectRetain();
  v9(a1 + 8, v6, v8);
  v10 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 72) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 48, a2 + 48);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

_QWORD *assignWithCopy for ScreenTimeNotificationsAppIntentView.Model(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 1, a2 + 1);
  __swift_assign_boxed_opaque_existential_1(a1 + 6, a2 + 6);
  a1[11] = a2[11];
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_20DE1FC48();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for ScreenTimeNotificationsAppIntentView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  v6 = *(_QWORD *)(a2 + 88);
  v7 = *(int *)(a3 + 24);
  v8 = a2 + v7;
  v9 = a1 + v7;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v6;
  v10 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9, v8, v10);
  return a1;
}

uint64_t assignWithTake for ScreenTimeNotificationsAppIntentView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  v6 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v6;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for ScreenTimeNotificationsAppIntentView.Model()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE15200(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_20DE1FC48();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 24)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ScreenTimeNotificationsAppIntentView.Model()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_20DE15288(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_20DE1FC48();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_20DE152FC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20DE1FC48();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *initializeWithCopy for ScreenTimeNotificationsAppIntentView.Model.App(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ScreenTimeNotificationsAppIntentView.Model.App(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
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

_QWORD *assignWithTake for ScreenTimeNotificationsAppIntentView.Model.App(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  return a1;
}

uint64_t getEnumTagSinglePayload for ScreenTimeNotificationsAppIntentView.Model.App(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ScreenTimeNotificationsAppIntentView.Model.App(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ScreenTimeNotificationsAppIntentView.Model.App()
{
  return &type metadata for ScreenTimeNotificationsAppIntentView.Model.App;
}

uint64_t sub_20DE15534()
{
  return sub_20DD8561C(&qword_2549EBCA8, &qword_2549EBCB0, MEMORY[0x24BDF4700]);
}

uint64_t objectdestroyTm_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ScreenTimeNotificationsAppIntentView(0) - 8) + 80);
  v2 = v0 + ((v1 + 16) & ~v1);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v2 + 8);
  __swift_destroy_boxed_opaque_existential_1(v2 + 48);
  v3 = v2 + *(int *)(type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0) + 24);
  v4 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBB50);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20DE15630@<X0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  type metadata accessor for ScreenTimeNotificationsAppIntentView(0);
  return sub_20DE13FC0(a1, a2);
}

uint64_t sub_20DE1567C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBCB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20DE156C4(uint64_t a1)
{
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_20DE15728(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBCB8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20DE15768(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t UsageHeaderView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  char *v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v14;

  v1 = v0;
  v2 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549EB710);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20DE15918(v1, (uint64_t)v4);
  v5 = (int *)type metadata accessor for UsageHeaderView(0);
  v6 = *(_QWORD *)(v1 + v5[5]);
  v7 = v1 + v5[6];
  v8 = &v4[v2[10]];
  v9 = sub_20DE1FC48();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, v7, v9);
  v10 = *(_QWORD *)(v1 + v5[7]);
  *(_QWORD *)&v4[v2[9]] = v6;
  v11 = &v4[v2[11]];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  *(_QWORD *)&v4[v2[12]] = v10;
  v12 = &v4[v2[13]];
  *(_QWORD *)v12 = sub_20DDF1D38;
  *((_QWORD *)v12 + 1) = 0;
  sub_20DE0C4CC();
  swift_bridgeObjectRetain();
  sub_20DE20920();
  return sub_20DE15974((uint64_t)v4);
}

uint64_t sub_20DE15918(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for UsageHeaderView(uint64_t a1)
{
  return sub_20DD87B48(a1, qword_2549EBD20);
}

uint64_t sub_20DE15974(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EB710);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20DE159B4()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *initializeBufferWithCopyOfBuffer for UsageHeaderView(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  void (*v23)(_QWORD *, _QWORD *, uint64_t);

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_20DE1FE94();
    v23 = *(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v23(a1, a2, v7);
    v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
    *(_QWORD *)((char *)a1 + v8[9]) = *(_QWORD *)((char *)a2 + v8[9]);
    *((_BYTE *)a1 + v8[10]) = *((_BYTE *)a2 + v8[10]);
    v9 = v8[11];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_20DE1FD68();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain();
    if (v14(v11, 1, v12))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    v17 = type metadata accessor for UsageHeaderView.Model(0);
    v23((_QWORD *)((char *)a1 + *(int *)(v17 + 20)), (_QWORD *)((char *)a2 + *(int *)(v17 + 20)), v7);
    v18 = a3[6];
    *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
    v19 = (char *)a1 + v18;
    v20 = (char *)a2 + v18;
    v21 = sub_20DE1FC48();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
    *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t type metadata accessor for UsageHeaderView.Model(uint64_t a1)
{
  return sub_20DD87B48(a1, qword_2549EBDB8);
}

uint64_t destroy for UsageHeaderView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = sub_20DE1FE94();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  swift_bridgeObjectRelease();
  v7 = a1 + *(int *)(v6 + 44);
  v8 = sub_20DE1FD68();
  v9 = *(_QWORD *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  v10 = type metadata accessor for UsageHeaderView.Model(0);
  v5(a1 + *(int *)(v10 + 20), v4);
  v11 = a1 + *(int *)(a2 + 24);
  v12 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UsageHeaderView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(const void *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v21)(uint64_t, uint64_t, uint64_t);

  v6 = sub_20DE1FE94();
  v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v21(a1, a2, v6);
  v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  *(_QWORD *)(a1 + v7[9]) = *(_QWORD *)(a2 + v7[9]);
  *(_BYTE *)(a1 + v7[10]) = *(_BYTE *)(a2 + v7[10]);
  v8 = v7[11];
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  v11 = sub_20DE1FD68();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain();
  if (v13(v10, 1, v11))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v15 = type metadata accessor for UsageHeaderView.Model(0);
  v21(a1 + *(int *)(v15 + 20), a2 + *(int *)(v15 + 20), v6);
  v16 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UsageHeaderView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v23)(uint64_t, uint64_t, uint64_t);

  v6 = sub_20DE1FE94();
  v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v23(a1, a2, v6);
  v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  *(_QWORD *)(a1 + v7[9]) = *(_QWORD *)(a2 + v7[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + v7[10]) = *(_BYTE *)(a2 + v7[10]);
  v8 = v7[11];
  v9 = (void *)(a1 + v8);
  v10 = (void *)(a2 + v8);
  v11 = sub_20DE1FD68();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 24))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 16))(v9, v10, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  v17 = type metadata accessor for UsageHeaderView.Model(0);
  v23(a1 + *(int *)(v17 + 20), a2 + *(int *)(v17 + 20), v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v18 = a3[6];
  v19 = a1 + v18;
  v20 = a2 + v18;
  v21 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 24))(v19, v20, v21);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for UsageHeaderView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  int *v8;
  uint64_t v9;
  void *v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_20DE1FE94();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  *(_QWORD *)(a1 + v8[9]) = *(_QWORD *)(a2 + v8[9]);
  *(_BYTE *)(a1 + v8[10]) = *(_BYTE *)(a2 + v8[10]);
  v9 = v8[11];
  v10 = (void *)(a1 + v9);
  v11 = (const void *)(a2 + v9);
  v12 = sub_20DE1FD68();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  v15 = type metadata accessor for UsageHeaderView.Model(0);
  v7(a1 + *(int *)(v15 + 20), a2 + *(int *)(v15 + 20), v6);
  v16 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for UsageHeaderView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v23)(uint64_t, uint64_t, uint64_t);

  v6 = sub_20DE1FE94();
  v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v23(a1, a2, v6);
  v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  *(_QWORD *)(a1 + v7[9]) = *(_QWORD *)(a2 + v7[9]);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + v7[10]) = *(_BYTE *)(a2 + v7[10]);
  v8 = v7[11];
  v9 = (void *)(a1 + v8);
  v10 = (void *)(a2 + v8);
  v11 = sub_20DE1FD68();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  v17 = type metadata accessor for UsageHeaderView.Model(0);
  v23(a1 + *(int *)(v17 + 20), a2 + *(int *)(v17 + 20), v6);
  v18 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v19 = a1 + v18;
  v20 = a2 + v18;
  v21 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 40))(v19, v20, v21);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UsageHeaderView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE16358(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  int v15;

  v6 = type metadata accessor for UsageHeaderView.Model(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_20DE1FC48();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 28));
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  v15 = v14 - 1;
  if (v15 < 0)
    v15 = -1;
  return (v15 + 1);
}

uint64_t storeEnumTagSinglePayload for UsageHeaderView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE16418(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = type metadata accessor for UsageHeaderView.Model(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_20DE1FC48();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 28)) = a2;
  return result;
}

uint64_t sub_20DE164BC()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for UsageHeaderView.Model(319);
  if (v1 <= 0x3F)
  {
    result = sub_20DE1FC48();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for UsageHeaderView.Model(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  void (*v18)(_QWORD *, _QWORD *, uint64_t);

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_20DE1FE94();
    v18 = *(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v18(a1, a2, v7);
    v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
    *(_QWORD *)((char *)a1 + v8[9]) = *(_QWORD *)((char *)a2 + v8[9]);
    *((_BYTE *)a1 + v8[10]) = *((_BYTE *)a2 + v8[10]);
    v9 = v8[11];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_20DE1FD68();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain();
    if (v14(v11, 1, v12))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    v18((_QWORD *)((char *)a1 + *(int *)(a3 + 20)), (_QWORD *)((char *)a2 + *(int *)(a3 + 20)), v7);
  }
  return a1;
}

uint64_t destroy for UsageHeaderView.Model(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v10)(uint64_t, uint64_t);

  v4 = sub_20DE1FE94();
  v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v10(a1, v4);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  swift_bridgeObjectRelease();
  v6 = a1 + *(int *)(v5 + 44);
  v7 = sub_20DE1FD68();
  v8 = *(_QWORD *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  return ((uint64_t (*)(uint64_t, uint64_t))v10)(a1 + *(int *)(a2 + 20), v4);
}

uint64_t initializeWithCopy for UsageHeaderView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  int *v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(const void *, uint64_t, uint64_t);
  uint64_t v14;

  v5 = sub_20DE1FE94();
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16);
  v6(a1, a2, v5);
  v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  *(_QWORD *)(a1 + v7[9]) = *(_QWORD *)(a2 + v7[9]);
  *(_BYTE *)(a1 + v7[10]) = *(_BYTE *)(a2 + v7[10]);
  v8 = v7[11];
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  v11 = sub_20DE1FD68();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain();
  if (v13(v10, 1, v11))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v6(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v5);
  return a1;
}

uint64_t assignWithCopy for UsageHeaderView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  int *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;

  v5 = sub_20DE1FE94();
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 24);
  v6(a1, a2, v5);
  v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  *(_QWORD *)(a1 + v7[9]) = *(_QWORD *)(a2 + v7[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + v7[10]) = *(_BYTE *)(a2 + v7[10]);
  v8 = v7[11];
  v9 = (void *)(a1 + v8);
  v10 = (void *)(a2 + v8);
  v11 = sub_20DE1FD68();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 24))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 16))(v9, v10, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  v6(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v5);
  return a1;
}

uint64_t initializeWithTake for UsageHeaderView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  int *v8;
  uint64_t v9;
  void *v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_20DE1FE94();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  *(_QWORD *)(a1 + v8[9]) = *(_QWORD *)(a2 + v8[9]);
  *(_BYTE *)(a1 + v8[10]) = *(_BYTE *)(a2 + v8[10]);
  v9 = v8[11];
  v10 = (void *)(a1 + v9);
  v11 = (const void *)(a2 + v9);
  v12 = sub_20DE1FD68();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t assignWithTake for UsageHeaderView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  int *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;

  v5 = sub_20DE1FE94();
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40);
  v6(a1, a2, v5);
  v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  *(_QWORD *)(a1 + v7[9]) = *(_QWORD *)(a2 + v7[9]);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + v7[10]) = *(_BYTE *)(a2 + v7[10]);
  v8 = v7[11];
  v9 = (void *)(a1 + v8);
  v10 = (void *)(a2 + v8);
  v11 = sub_20DE1FD68();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  v6(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for UsageHeaderView.Model()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE16D08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = sub_20DE1FE94();
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for UsageHeaderView.Model()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE16D8C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = sub_20DE1FE94();
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_20DE16E0C()
{
  unint64_t v0;
  unint64_t v1;

  sub_20DE0CF98(319);
  if (v0 <= 0x3F)
  {
    sub_20DE1FE94();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t getEnumTagSinglePayload for AccessibilityLabelIfNotNil(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AccessibilityLabelIfNotNil(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for AccessibilityLabelIfNotNil()
{
  return &type metadata for AccessibilityLabelIfNotNil;
}

uint64_t sub_20DE16F50()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20DE16F60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v4[2];

  v4[0] = a1;
  v4[1] = a2;
  return MEMORY[0x212BB5638](v4, a3, &type metadata for AccessibilityLabelIfNotNil);
}

uint64_t sub_20DE16F94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  __n128 v15;
  uint64_t v16;
  char *v17;
  void (*v19)(char *, uint64_t, uint64_t, __n128);
  _QWORD v20[4];

  v20[1] = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBDF0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBDF8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBE00);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v20[2] = a2;
    v20[3] = a3;
    sub_20DE171F4();
    sub_20DD8BA88();
    sub_20DE20908();
    sub_20DE17240((uint64_t)v17, (uint64_t)v13);
    swift_storeEnumTagMultiPayload();
    sub_20DE17188();
    sub_20DE206B0();
    return sub_20DE17288((uint64_t)v17);
  }
  else
  {
    v19 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v8 + 16);
    v19(v10, a1, v7, v15);
    ((void (*)(char *, char *, uint64_t))v19)(v13, v10, v7);
    swift_storeEnumTagMultiPayload();
    sub_20DE17188();
    sub_20DE171F4();
    sub_20DE206B0();
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

uint64_t sub_20DE17180@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return sub_20DE16F94(a1, *v2, v2[1], a2);
}

unint64_t sub_20DE17188()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549EBE08;
  if (!qword_2549EBE08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549EBE00);
    v2[0] = sub_20DE171F4();
    v2[1] = sub_20DDA8D7C();
    result = MEMORY[0x212BB5FE0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549EBE08);
  }
  return result;
}

unint64_t sub_20DE171F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2549EBE10;
  if (!qword_2549EBE10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549EBDF0);
    result = MEMORY[0x212BB5FE0](MEMORY[0x24BDEFB78], v1);
    atomic_store(result, (unint64_t *)&qword_2549EBE10);
  }
  return result;
}

uint64_t sub_20DE17240(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBE00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20DE17288(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBE00);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_20DE172CC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549EBE18;
  if (!qword_2549EBE18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549EBE20);
    v2[0] = sub_20DE17188();
    v2[1] = sub_20DE171F4();
    result = MEMORY[0x212BB5FE0](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549EBE18);
  }
  return result;
}

uint64_t sub_20DE17338@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  int *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  char *v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;

  v41 = a3;
  v37 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
  MEMORY[0x24BDAC7A8](v6);
  v40 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_20DE1FE94();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_20DE1FD68();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (int *)type metadata accessor for OverviewChart.Model(0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v34 = (uint64_t)&v34 - v20;
  v21 = *(int *)(type metadata accessor for PickupsOverviewChart.Model(0) + 20);
  v39 = a4;
  v22 = a4 + v21;
  v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
  v23(v22, (uint64_t)a1, v12);
  v38 = a1;
  v24 = a1;
  v25 = v41;
  v23((uint64_t)v15, (uint64_t)v24, v12);
  v35 = v9;
  v36 = v8;
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v27 = (uint64_t)v40;
  v26(v11, v25, v8);
  v28 = sub_20DE20974();
  Calendar.startOfWeek(containing:)((uint64_t)v15, v27);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v27, 1, v12);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v30 = *(void (**)(char *, uint64_t))(v13 + 8);
    v30(v15, v12);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 32))(v18, v27, v12);
    v31 = v36;
    *(_QWORD *)&v18[v16[5]] = v37;
    v32 = v35;
    (*(void (**)(char *, char *, uint64_t))(v35 + 32))(&v18[v16[6]], v11, v31);
    *(_QWORD *)&v18[v16[7]] = v28;
    v18[v16[8]] = 1;
    v33 = v34;
    sub_20DDEB074((uint64_t)v18, v34);
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v25, v31);
    v30(v38, v12);
    return sub_20DDEB074(v33, v39);
  }
  return result;
}

uint64_t PickupsOverviewChart.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v27 = a1;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
  MEMORY[0x24BDAC7A8](v26);
  v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v25 - v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C50);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for OverviewChart.Model(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (int *)type metadata accessor for OverviewChart(0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20DDEAFDC(v1, (uint64_t)v12);
  v16 = type metadata accessor for PickupsOverviewChart(0);
  sub_20DE20AD0();
  v17 = *(_QWORD *)(v1 + *(int *)(v16 + 24));
  v18 = sub_20DE1FD68();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v6, 1, 1, v18);
  sub_20DD95E44((uint64_t)v6, (uint64_t)v3);
  swift_bridgeObjectRetain();
  sub_20DE20A28();
  sub_20DDEB034((uint64_t)v6);
  v19 = v13[7];
  v20 = &v15[v13[8]];
  v28 = 0x4024000000000000;
  sub_20DE20A28();
  v21 = v30;
  *(_QWORD *)v20 = v29;
  *((_QWORD *)v20 + 1) = v21;
  v22 = &v15[v13[9]];
  v28 = 0;
  sub_20DE20A28();
  v23 = v30;
  *(_QWORD *)v22 = v29;
  *((_QWORD *)v22 + 1) = v23;
  sub_20DDEB074((uint64_t)v12, (uint64_t)v15);
  sub_20DDEB0B8((uint64_t)v9, (uint64_t)&v15[v13[6]]);
  v15[v13[10]] = 1;
  *(_QWORD *)&v15[v19] = v17;
  sub_20DD8512C(&qword_2549EA300, type metadata accessor for OverviewChart, (uint64_t)&protocol conformance descriptor for OverviewChart);
  sub_20DE20920();
  return sub_20DDEB100((uint64_t)v15);
}

uint64_t type metadata accessor for PickupsOverviewChart(uint64_t a1)
{
  return sub_20DD87B48(a1, qword_2549EBE80);
}

uint64_t sub_20DE1787C()
{
  return swift_getOpaqueTypeConformance2();
}

char *initializeBufferWithCopyOfBuffer for PickupsOverviewChart(char *a1, char *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v36;
  int *v37;
  uint64_t v38;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v28 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_20DE1FD68();
    v36 = *(_QWORD *)(v7 - 8);
    v37 = a3;
    v8 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
    v8(a1, a2, v7);
    v9 = (int *)type metadata accessor for OverviewChart.Model(0);
    *(_QWORD *)&a1[v9[5]] = *(_QWORD *)&a2[v9[5]];
    v10 = v9[6];
    v11 = &a1[v10];
    v12 = &a2[v10];
    v13 = sub_20DE1FE94();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    v38 = v13;
    v15 = v13;
    v16 = v8;
    v14(v11, v12, v15);
    *(_QWORD *)&a1[v9[7]] = *(_QWORD *)&a2[v9[7]];
    a1[v9[8]] = a2[v9[8]];
    v17 = *(int *)(type metadata accessor for PickupsOverviewChart.Model(0) + 20);
    v18 = &a1[v17];
    v19 = &a2[v17];
    swift_retain();
    v8(v18, v19, v7);
    v20 = v37[5];
    v21 = &a1[v20];
    v22 = &a2[v20];
    v23 = *(_QWORD *)&a2[v20 + 8];
    *(_QWORD *)v21 = *(_QWORD *)&a2[v20];
    *((_QWORD *)v21 + 1) = v23;
    swift_retain();
    swift_retain();
    v24 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C50) + 32);
    v25 = &v21[v24];
    v26 = &v22[v24];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(&v22[v24], 1, v7))
    {
      v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    }
    else
    {
      v8(v25, v26, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v36 + 56))(v25, 0, 1, v7);
    }
    v29 = v37[7];
    *(_QWORD *)&a1[v37[6]] = *(_QWORD *)&a2[v37[6]];
    v30 = &a1[v29];
    v31 = &a2[v29];
    swift_bridgeObjectRetain();
    v16(v30, v31, v7);
    *(_QWORD *)&v30[v9[5]] = *(_QWORD *)&v31[v9[5]];
    v32 = v9[6];
    v33 = &v30[v32];
    v34 = &v31[v32];
    swift_bridgeObjectRetain();
    v14(v33, v34, v38);
    *(_QWORD *)&v30[v9[7]] = *(_QWORD *)&v31[v9[7]];
    v30[v9[8]] = v31[v9[8]];
  }
  swift_retain();
  return a1;
}

uint64_t type metadata accessor for PickupsOverviewChart.Model(uint64_t a1)
{
  return sub_20DD87B48(a1, qword_2549EBF18);
}

uint64_t destroy for PickupsOverviewChart(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = sub_20DE1FD68();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  v7 = type metadata accessor for OverviewChart.Model(0);
  swift_bridgeObjectRelease();
  v8 = a1 + *(int *)(v7 + 24);
  v9 = sub_20DE1FE94();
  v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8);
  v10(v8, v9);
  swift_release();
  v11 = type metadata accessor for PickupsOverviewChart.Model(0);
  v6(a1 + *(int *)(v11 + 20), v4);
  v12 = a1 + *(int *)(a2 + 20);
  swift_release();
  swift_release();
  v13 = v12 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C50) + 32);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4))
    v6(v13, v4);
  swift_bridgeObjectRelease();
  v14 = a1 + *(int *)(a2 + 28);
  v6(v14, v4);
  swift_bridgeObjectRelease();
  v10(v14 + *(int *)(v7 + 24), v9);
  return swift_release();
}

uint64_t initializeWithCopy for PickupsOverviewChart(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  const void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;

  v5 = sub_20DE1FD68();
  v33 = *(_QWORD *)(v5 - 8);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16);
  v6(a1, a2, v5);
  v7 = (int *)type metadata accessor for OverviewChart.Model(0);
  *(_QWORD *)(a1 + v7[5]) = *(_QWORD *)(a2 + v7[5]);
  v8 = v7[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_20DE1FE94();
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  v34 = v11;
  v13 = v11;
  v14 = v6;
  v12(v9, v10, v13);
  *(_QWORD *)(a1 + v7[7]) = *(_QWORD *)(a2 + v7[7]);
  *(_BYTE *)(a1 + v7[8]) = *(_BYTE *)(a2 + v7[8]);
  v15 = *(int *)(type metadata accessor for PickupsOverviewChart.Model(0) + 20);
  v16 = a1 + v15;
  v17 = a2 + v15;
  swift_retain();
  v6(v16, v17, v5);
  v18 = a3[5];
  v19 = (_QWORD *)(a1 + v18);
  v20 = a2 + v18;
  v21 = *(_QWORD *)(a2 + v18 + 8);
  *v19 = *(_QWORD *)(a2 + v18);
  v19[1] = v21;
  swift_retain();
  swift_retain();
  v22 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C50) + 32);
  v23 = (char *)v19 + v22;
  v24 = (const void *)(v20 + v22);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v20 + v22, 1, v5))
  {
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    v6((uint64_t)v23, (uint64_t)v24, v5);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v23, 0, 1, v5);
  }
  v26 = a3[7];
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  v27 = a1 + v26;
  v28 = a2 + v26;
  swift_bridgeObjectRetain();
  v14(v27, v28, v5);
  *(_QWORD *)(v27 + v7[5]) = *(_QWORD *)(v28 + v7[5]);
  v29 = v7[6];
  v30 = v27 + v29;
  v31 = v28 + v29;
  swift_bridgeObjectRetain();
  v12(v30, v31, v34);
  *(_QWORD *)(v27 + v7[7]) = *(_QWORD *)(v28 + v7[7]);
  *(_BYTE *)(v27 + v7[8]) = *(_BYTE *)(v28 + v7[8]);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for PickupsOverviewChart(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t (*v21)(void *, uint64_t, uint64_t);
  int v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, uint64_t);
  void (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;

  v6 = sub_20DE1FD68();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v9 = (int *)type metadata accessor for OverviewChart.Model(0);
  *(_QWORD *)(a1 + v9[5]) = *(_QWORD *)(a2 + v9[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = v9[6];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_20DE1FE94();
  v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 24);
  v30(v11, v12, v13);
  *(_QWORD *)(a1 + v9[7]) = *(_QWORD *)(a2 + v9[7]);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + v9[8]) = *(_BYTE *)(a2 + v9[8]);
  v14 = type metadata accessor for PickupsOverviewChart.Model(0);
  v31 = v8;
  v8(a1 + *(int *)(v14 + 20), a2 + *(int *)(v14 + 20), v6);
  v32 = a3;
  v15 = *(int *)(a3 + 20);
  v16 = a1 + v15;
  v17 = a2 + v15;
  *(_QWORD *)(a1 + v15) = *(_QWORD *)(a2 + v15);
  swift_retain();
  swift_release();
  *(_QWORD *)(v16 + 8) = *(_QWORD *)(v17 + 8);
  swift_retain();
  swift_release();
  v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C50) + 32);
  v19 = (void *)(v16 + v18);
  v20 = (void *)(v17 + v18);
  v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  LODWORD(v17) = v21(v19, 1, v6);
  v22 = v21(v20, 1, v6);
  if (!(_DWORD)v17)
  {
    if (!v22)
    {
      v29 = (uint64_t)v20;
      v24 = v31;
      v31((uint64_t)v19, v29, v6);
      goto LABEL_8;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(v19, v6);
    goto LABEL_6;
  }
  if (v22)
  {
LABEL_6:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(v19, v20, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v19, 0, 1, v6);
LABEL_7:
  v24 = v31;
LABEL_8:
  *(_QWORD *)(a1 + *(int *)(v32 + 24)) = *(_QWORD *)(a2 + *(int *)(v32 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v25 = *(int *)(v32 + 28);
  v26 = a1 + v25;
  v27 = a2 + v25;
  v24(a1 + v25, v27, v6);
  *(_QWORD *)(v26 + v9[5]) = *(_QWORD *)(v27 + v9[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v30(v26 + v9[6], v27 + v9[6], v13);
  *(_QWORD *)(v26 + v9[7]) = *(_QWORD *)(v27 + v9[7]);
  swift_retain();
  swift_release();
  *(_BYTE *)(v26 + v9[8]) = *(_BYTE *)(v27 + v9[8]);
  return a1;
}

uint64_t initializeWithTake for PickupsOverviewChart(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v27)(uint64_t, uint64_t, uint64_t);

  v6 = sub_20DE1FD68();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  v9 = (int *)type metadata accessor for OverviewChart.Model(0);
  *(_QWORD *)(a1 + v9[5]) = *(_QWORD *)(a2 + v9[5]);
  v10 = v9[6];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_20DE1FE94();
  v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32);
  v27(v11, v12, v13);
  *(_QWORD *)(a1 + v9[7]) = *(_QWORD *)(a2 + v9[7]);
  *(_BYTE *)(a1 + v9[8]) = *(_BYTE *)(a2 + v9[8]);
  v14 = type metadata accessor for PickupsOverviewChart.Model(0);
  v8(a1 + *(int *)(v14 + 20), a2 + *(int *)(v14 + 20), v6);
  v15 = a3[5];
  v16 = (_QWORD *)(a1 + v15);
  v17 = a2 + v15;
  v18 = *(_QWORD *)(a2 + v15 + 8);
  *v16 = *(_QWORD *)(a2 + v15);
  v16[1] = v18;
  v19 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C50) + 32);
  v20 = (char *)v16 + v19;
  v21 = (const void *)(v17 + v19);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(v21, 1, v6))
  {
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    v8((uint64_t)v20, (uint64_t)v21, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v20, 0, 1, v6);
  }
  v23 = a3[7];
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  v24 = a1 + v23;
  v25 = a2 + v23;
  v8(a1 + v23, v25, v6);
  *(_QWORD *)(v24 + v9[5]) = *(_QWORD *)(v25 + v9[5]);
  v27(v24 + v9[6], v25 + v9[6], v13);
  *(_QWORD *)(v24 + v9[7]) = *(_QWORD *)(v25 + v9[7]);
  *(_BYTE *)(v24 + v9[8]) = *(_BYTE *)(v25 + v9[8]);
  return a1;
}

uint64_t assignWithTake for PickupsOverviewChart(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t (*v21)(void *, uint64_t, uint64_t);
  int v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, uint64_t);
  void (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;

  v6 = sub_20DE1FD68();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v9 = (int *)type metadata accessor for OverviewChart.Model(0);
  *(_QWORD *)(a1 + v9[5]) = *(_QWORD *)(a2 + v9[5]);
  swift_bridgeObjectRelease();
  v10 = v9[6];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_20DE1FE94();
  v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 40);
  v30(v11, v12, v13);
  *(_QWORD *)(a1 + v9[7]) = *(_QWORD *)(a2 + v9[7]);
  swift_release();
  *(_BYTE *)(a1 + v9[8]) = *(_BYTE *)(a2 + v9[8]);
  v14 = type metadata accessor for PickupsOverviewChart.Model(0);
  v31 = v8;
  v8(a1 + *(int *)(v14 + 20), a2 + *(int *)(v14 + 20), v6);
  v32 = a3;
  v15 = *(int *)(a3 + 20);
  v16 = a1 + v15;
  v17 = a2 + v15;
  *(_QWORD *)(a1 + v15) = *(_QWORD *)(a2 + v15);
  swift_release();
  *(_QWORD *)(v16 + 8) = *(_QWORD *)(v17 + 8);
  swift_release();
  v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C50) + 32);
  v19 = (void *)(v16 + v18);
  v20 = (void *)(v17 + v18);
  v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  LODWORD(a3) = v21(v19, 1, v6);
  v22 = v21(v20, 1, v6);
  if (!(_DWORD)a3)
  {
    if (!v22)
    {
      v29 = (uint64_t)v19;
      v24 = v31;
      v31(v29, (uint64_t)v20, v6);
      goto LABEL_8;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(v19, v6);
    goto LABEL_6;
  }
  if (v22)
  {
LABEL_6:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(v19, v20, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v19, 0, 1, v6);
LABEL_7:
  v24 = v31;
LABEL_8:
  *(_QWORD *)(a1 + *(int *)(v32 + 24)) = *(_QWORD *)(a2 + *(int *)(v32 + 24));
  swift_bridgeObjectRelease();
  v25 = *(int *)(v32 + 28);
  v26 = a1 + v25;
  v27 = a2 + v25;
  v24(a1 + v25, v27, v6);
  *(_QWORD *)(v26 + v9[5]) = *(_QWORD *)(v27 + v9[5]);
  swift_bridgeObjectRelease();
  v30(v26 + v9[6], v27 + v9[6], v13);
  *(_QWORD *)(v26 + v9[7]) = *(_QWORD *)(v27 + v9[7]);
  swift_release();
  *(_BYTE *)(v26 + v9[8]) = *(_BYTE *)(v27 + v9[8]);
  return a1;
}

uint64_t getEnumTagSinglePayload for PickupsOverviewChart()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE185A0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;

  v6 = type metadata accessor for PickupsOverviewChart.Model(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C50);
  v10 = *(_QWORD *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
  {
    v11 = v9;
    v12 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  if ((_DWORD)a2 != 2147483646)
  {
    v11 = type metadata accessor for OverviewChart.Model(0);
    v10 = *(_QWORD *)(v11 - 8);
    v12 = a3[7];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  v13 = *(_QWORD *)(a1 + a3[6]);
  if (v13 >= 0xFFFFFFFF)
    LODWORD(v13) = -1;
  v14 = v13 - 1;
  if (v14 < 0)
    v14 = -1;
  return (v14 + 1);
}

uint64_t storeEnumTagSinglePayload for PickupsOverviewChart()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE18688(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;

  v8 = type metadata accessor for PickupsOverviewChart.Model(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    result = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C50);
    v14 = *(_QWORD *)(result - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = result;
      v15 = a4[5];
    }
    else
    {
      if (a3 == 2147483646)
      {
        *(_QWORD *)(a1 + a4[6]) = a2;
        return result;
      }
      v10 = type metadata accessor for OverviewChart.Model(0);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[7];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_20DE18754()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  type metadata accessor for PickupsOverviewChart.Model(319);
  if (v0 <= 0x3F)
  {
    sub_20DD9A1E0();
    if (v1 <= 0x3F)
    {
      type metadata accessor for OverviewChart.Model(319);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t sub_20DE18800()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE1880C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = type metadata accessor for OverviewChart.Model(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = sub_20DE1FD68();
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_20DE18880()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE1888C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = type metadata accessor for OverviewChart.Model(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = sub_20DE1FD68();
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_20DE18908(uint64_t a1, uint64_t a2)
{
  int *v4;

  if ((sub_20DE1FD44() & 1) == 0)
    return 0;
  v4 = (int *)type metadata accessor for OverviewChart.Model(0);
  if (!sub_20DD86EBC(*(_QWORD *)(a1 + v4[5]), *(_QWORD *)(a2 + v4[5]))
    || (MEMORY[0x212BB4B40](a1 + v4[6], a2 + v4[6]) & 1) == 0
    || (sub_20DE20950() & 1) == 0
    || *(unsigned __int8 *)(a1 + v4[8]) != *(unsigned __int8 *)(a2 + v4[8]))
  {
    return 0;
  }
  type metadata accessor for PickupsOverviewChart.Model(0);
  return sub_20DE1FD44();
}

void sub_20DE189BC()
{
  qword_2549EF5B8 = 0x7070416C6C415F5FLL;
  unk_2549EF5C0 = 0xEB000000005F5F73;
}

uint64_t storeEnumTagSinglePayload for MostUsedListType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20DE18A34 + 4 * byte_20DE249C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_20DE18A68 + 4 * byte_20DE249C0[v4]))();
}

uint64_t sub_20DE18A68(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20DE18A70(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20DE18A78);
  return result;
}

uint64_t sub_20DE18A84(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20DE18A8CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_20DE18A90(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20DE18A98(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MostUsedListType()
{
  return &type metadata for MostUsedListType;
}

unint64_t sub_20DE18AB8()
{
  unint64_t result;

  result = qword_2549EBF50;
  if (!qword_2549EBF50)
  {
    result = MEMORY[0x212BB5FE0](&unk_20DE24A44, &type metadata for MostUsedListType);
    atomic_store(result, (unint64_t *)&qword_2549EBF50);
  }
  return result;
}

uint64_t SummaryView.Model.init(dateState:calendar:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
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
  char *v31;
  uint64_t v32;
  __n128 v33;
  uint64_t v34;
  char *v35;
  void (*v36)(void);
  uint64_t v37;
  uint64_t v38;
  char *v39;
  void (*v40)(char *, char *, uint64_t);
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int (*v47)(uint64_t, uint64_t, uint64_t);
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t);
  uint64_t result;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t, uint64_t);
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  int *v63;
  void (*v64)(uint64_t, char *, uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  unint64_t v74;
  char *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  char *v82;
  char *v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;

  v89 = a2;
  v71 = a1;
  v87 = a3;
  v3 = sub_20DE1FD68();
  v76 = *(_QWORD *)(v3 - 8);
  v4 = v76;
  MEMORY[0x24BDAC7A8](v3);
  v86 = (char *)&v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = type metadata accessor for OverviewChart.Model(0);
  MEMORY[0x24BDAC7A8](v70);
  v69 = (char *)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v68 = (uint64_t)&v67 - v8;
  v85 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  MEMORY[0x24BDAC7A8](v85);
  v10 = (char *)&v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = type metadata accessor for UsageHeaderView.Model(0);
  MEMORY[0x24BDAC7A8](v88);
  v12 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = sub_20DE1FE94();
  v13 = *(_QWORD *)(v78 - 8);
  MEMORY[0x24BDAC7A8](v78);
  v73 = (char *)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v67 - v16;
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v67 - v19;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
  MEMORY[0x24BDAC7A8](v21);
  v72 = (uint64_t)&v67 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v84 = (uint64_t)&v67 - v24;
  MEMORY[0x24BDAC7A8](v25);
  v75 = (char *)&v67 - v26;
  MEMORY[0x24BDAC7A8](v27);
  v80 = (char *)&v67 - v28;
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v67 - v30;
  v33 = MEMORY[0x24BDAC7A8](v32);
  v35 = (char *)&v67 - v34;
  v36 = *(void (**)(void))(v4 + 56);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t, __n128))v36)((char *)&v67 - v34, 1, 1, v3, v33);
  v37 = MEMORY[0x24BEE4AF8];
  v74 = sub_20DDD5DC4(MEMORY[0x24BEE4AF8]);
  sub_20DE1FE64();
  v38 = *(int *)(v88 + 20);
  v83 = v12;
  v39 = &v12[v38];
  v88 = v13;
  v40 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v41 = v78;
  v40(v39, v20, v78);
  v82 = v20;
  v40(v17, v20, v41);
  v79 = v35;
  sub_20DD8516C((uint64_t)v35, (uint64_t)v31, &qword_2549E7C40);
  v81 = (uint64_t)v17;
  v42 = v17;
  v43 = (uint64_t)v75;
  v40(v10, v42, v41);
  v44 = (uint64_t)v85;
  v45 = *((int *)v85 + 9);
  sub_20DDD5DC4(v37);
  v77 = &v10[*(int *)(v44 + 44)];
  v36();
  swift_bridgeObjectRelease();
  v10[*(int *)(v44 + 40)] = 0;
  v85 = v10;
  *(_QWORD *)&v10[v45] = v74;
  v46 = v76;
  sub_20DD8516C((uint64_t)v31, v43, &qword_2549E7C40);
  v47 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48);
  if (v47(v43, 1, v3) == 1)
  {
    v48 = (uint64_t)v80;
    sub_20DE1FD5C();
    sub_20DD851D0((uint64_t)v31, &qword_2549E7C40);
    v49 = *(void (**)(uint64_t, uint64_t))(v88 + 8);
    v49(v81, v41);
    sub_20DD851D0(v43, &qword_2549E7C40);
  }
  else
  {
    sub_20DD851D0((uint64_t)v31, &qword_2549E7C40);
    v49 = *(void (**)(uint64_t, uint64_t))(v88 + 8);
    v49(v81, v41);
    v48 = (uint64_t)v80;
    (*(void (**)(char *, uint64_t, uint64_t))(v46 + 32))(v80, v43, v3);
  }
  v81 = type metadata accessor for SummaryView.Model(0);
  v50 = v87;
  v51 = v87 + *(int *)(v81 + 20);
  ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v36)(v48, 0, 1, v3);
  sub_20DDD6F68(v48, (uint64_t)v77);
  sub_20DD851D0((uint64_t)v79, &qword_2549E7C40);
  v49((uint64_t)v82, v41);
  v52 = (uint64_t)v83;
  sub_20DD93408((uint64_t)v85, (uint64_t)v83, &qword_2549E8360);
  sub_20DD8BB14(v52, v51, type metadata accessor for UsageHeaderView.Model);
  v53 = (uint64_t)v86;
  sub_20DE1FD5C();
  v54 = v84;
  Calendar.startOfWeek(containing:)(v53, v84);
  v55 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
  v55(v53, v3);
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v47)(v54, 1, v3);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v57 = v46;
    v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v47;
    v59 = sub_20DE20974();
    v60 = v73;
    sub_20DE1FE64();
    v61 = v72;
    Calendar.startOfWeek(containing:)(v54, v72);
    result = v58(v61, 1, v3);
    if ((_DWORD)result != 1)
    {
      v55(v54, v3);
      v62 = (uint64_t)v69;
      (*(void (**)(char *, uint64_t, uint64_t))(v57 + 32))(v69, v61, v3);
      v63 = (int *)v70;
      *(_QWORD *)(v62 + *(int *)(v70 + 20)) = MEMORY[0x24BEE4AF8];
      v64 = *(void (**)(uint64_t, char *, uint64_t))(v88 + 32);
      v64(v62 + v63[6], v60, v41);
      *(_QWORD *)(v62 + v63[7]) = v59;
      *(_BYTE *)(v62 + v63[8]) = 0;
      v65 = v68;
      sub_20DD8BB14(v62, v68, type metadata accessor for OverviewChart.Model);
      sub_20DD8BB14(v65, v50, type metadata accessor for OverviewChart.Model);
      v66 = v81;
      sub_20DD8BB14(v71, v50 + *(int *)(v81 + 24), type metadata accessor for ActivityNavigationState);
      return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v64)(v50 + *(int *)(v66 + 28), v89, v41);
    }
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for SummaryView.Model(uint64_t a1)
{
  return sub_20DD87B48(a1, qword_2549EC0B8);
}

uint64_t SummaryView.Model.init(usageThisWeek:headerModel:totalUsageLastWeek:dateState:calendar:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  char *v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  int *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t, uint64_t, uint64_t);
  char *v54;
  char *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v62 = a5;
  v63 = a4;
  v60 = a2;
  v61 = a3;
  v59 = a1;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  MEMORY[0x24BDAC7A8](v52);
  v51 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = type metadata accessor for UsageHeaderView.Model(0);
  MEMORY[0x24BDAC7A8](v58);
  v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_20DE1FE94();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v46 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
  MEMORY[0x24BDAC7A8](v15);
  v49 = (uint64_t)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v55 = (char *)&v46 - v18;
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v46 - v20;
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v46 - v23;
  v25 = sub_20DE1FD68();
  v26 = *(_QWORD *)(v25 - 8);
  v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56);
  v27(v24, 1, 1, v25);
  v47 = sub_20DDD5DC4(MEMORY[0x24BEE4AF8]);
  sub_20DE1FE64();
  v28 = *(int *)(v58 + 20);
  v57 = v7;
  v58 = v9;
  v29 = &v7[v28];
  v30 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v30(v29, v14, v8);
  v56 = v14;
  v30(v11, v14, v8);
  v54 = v24;
  v31 = (uint64_t)v24;
  v32 = v8;
  sub_20DD8516C(v31, (uint64_t)v21, &qword_2549E7C40);
  v33 = v51;
  v50 = v11;
  v30(v51, v11, v32);
  v34 = v52;
  v35 = *(int *)(v52 + 36);
  sub_20DDD5DC4(MEMORY[0x24BEE4AF8]);
  v48 = &v33[*(int *)(v34 + 44)];
  v53 = v27;
  ((void (*)(void))v27)();
  v36 = (uint64_t)v33;
  swift_bridgeObjectRelease();
  v33[*(int *)(v34 + 40)] = 0;
  *(_QWORD *)&v33[v35] = v47;
  v37 = v49;
  sub_20DD8516C((uint64_t)v21, v49, &qword_2549E7C40);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v37, 1, v25) == 1)
  {
    v38 = (uint64_t)v55;
    sub_20DE1FD5C();
    sub_20DD851D0((uint64_t)v21, &qword_2549E7C40);
    v39 = v58;
    v40 = *(void (**)(char *, uint64_t))(v58 + 8);
    v40(v50, v32);
    sub_20DD851D0(v37, &qword_2549E7C40);
  }
  else
  {
    sub_20DD851D0((uint64_t)v21, &qword_2549E7C40);
    v39 = v58;
    v40 = *(void (**)(char *, uint64_t))(v58 + 8);
    v40(v50, v32);
    v38 = (uint64_t)v55;
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 32))(v55, v37, v25);
  }
  v41 = (int *)type metadata accessor for SummaryView.Model(0);
  v42 = v62;
  v43 = v62 + v41[5];
  v53((char *)v38, 0, 1, v25);
  sub_20DDD6F68(v38, (uint64_t)v48);
  sub_20DD851D0((uint64_t)v54, &qword_2549E7C40);
  v40(v56, v32);
  v44 = (uint64_t)v57;
  sub_20DD93408(v36, (uint64_t)v57, &qword_2549E8360);
  sub_20DD8BB14(v44, v43, type metadata accessor for UsageHeaderView.Model);
  sub_20DD8BB14(v59, v42, type metadata accessor for OverviewChart.Model);
  sub_20DE19564(v60, v43);
  sub_20DD8BB14(v61, v42 + v41[6], type metadata accessor for ActivityNavigationState);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 32))(v42 + v41[7], v63, v32);
}

uint64_t sub_20DE19564(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UsageHeaderView.Model(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t SummaryView.init(bridge:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
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
  uint64_t v13;
  char *v14;
  int *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;

  v22 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v22 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF58);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v22 - v13;
  *a2 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF60);
  swift_storeEnumTagMultiPayload();
  v15 = (int *)type metadata accessor for SummaryView(0);
  v16 = (char *)a2 + v15[5];
  v23 = 0;
  sub_20DE20A28();
  v17 = v25;
  *v16 = v24;
  *((_QWORD *)v16 + 1) = v17;
  v18 = type metadata accessor for SummaryView.Model(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v14, 1, 1, v18);
  sub_20DD8516C((uint64_t)v14, (uint64_t)v11, &qword_2549EBF58);
  sub_20DE20A28();
  sub_20DD851D0((uint64_t)v14, &qword_2549EBF58);
  v19 = sub_20DE1FD68();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v8, 1, 1, v19);
  sub_20DD8516C((uint64_t)v8, (uint64_t)v5, &qword_2549E7C40);
  sub_20DE20A28();
  sub_20DD851D0((uint64_t)v8, &qword_2549E7C40);
  *(uint64_t *)((char *)a2 + v15[6]) = v22;
  v20 = (uint64_t *)((char *)a2 + v15[7]);
  v20[3] = type metadata accessor for ModelProvider();
  v20[4] = (uint64_t)&protocol witness table for ModelProvider;
  __swift_allocate_boxed_opaque_existential_1(v20);
  return _s16ScreenTimeUICore13ModelProviderVACycfC_0();
}

uint64_t SummaryView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (**v16)(uint64_t *);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = a1;
  v2 = type metadata accessor for SummaryView(0);
  v18 = *(_QWORD *)(v2 - 8);
  v3 = *(_QWORD *)(v18 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF68);
  v4 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF70);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF78);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20DE19A8C((uint64_t)v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF88);
  sub_20DE2032C();
  swift_endAccess();
  sub_20DD8BACC(v1, (uint64_t)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SummaryView);
  v13 = (*(unsigned __int8 *)(v18 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v14 = swift_allocObject();
  sub_20DD8BB14((uint64_t)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13, type metadata accessor for SummaryView);
  sub_20DD8516C((uint64_t)v9, (uint64_t)v12, &qword_2549EBF70);
  v15 = v19;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(&v12[*(int *)(v10 + 52)], v6, v19);
  v16 = (uint64_t (**)(uint64_t *))&v12[*(int *)(v10 + 56)];
  *v16 = sub_20DE1B7A4;
  v16[1] = (uint64_t (*)(uint64_t *))v14;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v15);
  sub_20DD851D0((uint64_t)v9, &qword_2549EBF70);
  sub_20DD8561C(&qword_2549EBF98, &qword_2549EBF78, MEMORY[0x24BDEDA68]);
  sub_20DE20920();
  return sub_20DD851D0((uint64_t)v12, &qword_2549EBF78);
}

uint64_t sub_20DE19A8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
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
  uint64_t v14;
  char *v15;
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
  id v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(_QWORD);
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char v51;
  void (*v52)(char *, uint64_t);
  void *v53;
  char **v54;
  uint64_t v55;
  char v56;
  char *v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  char v81;
  uint64_t v82;

  v78 = a1;
  v79 = type metadata accessor for NoActivityView();
  MEMORY[0x24BDAC7A8](v79);
  v3 = (uint64_t *)((char *)&v64 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EC1F0);
  MEMORY[0x24BDAC7A8](v76);
  v77 = (uint64_t)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_20DE203BC();
  v71 = *(_QWORD *)(v5 - 8);
  v72 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v69 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v66 = (uint64_t)&v64 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EC1F8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EC200);
  MEMORY[0x24BDAC7A8](v65);
  v13 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EC208);
  MEMORY[0x24BDAC7A8](v68);
  v15 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EC210);
  MEMORY[0x24BDAC7A8](v67);
  v73 = (uint64_t)&v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EC218);
  MEMORY[0x24BDAC7A8](v75);
  v70 = (uint64_t)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v74 = (uint64_t)&v64 - v19;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF58);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = type metadata accessor for SummaryView.Model(0);
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v64 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SummaryView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF90);
  sub_20DE20A34();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23) == 1)
  {
    sub_20DD851D0((uint64_t)v22, &qword_2549EBF58);
    v27 = sub_20DE207A0();
    v28 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
    v29 = v79;
    v30 = (char *)v3 + *(int *)(v79 + 24);
    v31 = sub_20DE2005C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v30, 1, 1, v31);
    v32 = (char *)v3 + *(int *)(v29 + 28);
    v80 = 1;
    sub_20DE20A28();
    v33 = v82;
    *v32 = v81;
    *((_QWORD *)v32 + 1) = v33;
    *(uint64_t *)((char *)v3 + *(int *)(v29 + 32)) = 0x4000000000000000;
    *v3 = v27;
    v3[1] = (uint64_t)v28;
    sub_20DD8BACC((uint64_t)v3, v77, (uint64_t (*)(_QWORD))type metadata accessor for NoActivityView);
    swift_storeEnumTagMultiPayload();
    sub_20DE1F008(&qword_2549EC220, &qword_2549EC218, sub_20DE1EFEC);
    sub_20DD8512C(&qword_2549EC258, (uint64_t (*)(uint64_t))type metadata accessor for NoActivityView, (uint64_t)&protocol conformance descriptor for NoActivityView);
    sub_20DE206B0();
    v34 = (uint64_t)v3;
    v35 = (uint64_t (*)(_QWORD))type metadata accessor for NoActivityView;
  }
  else
  {
    sub_20DD8BB14((uint64_t)v22, (uint64_t)v26, type metadata accessor for SummaryView.Model);
    *(_QWORD *)v11 = sub_20DE20698();
    *((_QWORD *)v11 + 1) = 0x4024000000000000;
    v11[16] = 0;
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EC260);
    sub_20DE1A770((uint64_t)v26, v1, (uint64_t)&v11[*(int *)(v36 + 44)]);
    v37 = sub_20DE20764();
    sub_20DE203A4();
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v45 = v44;
    sub_20DD8516C((uint64_t)v11, (uint64_t)v13, &qword_2549EC1F8);
    v46 = &v13[*(int *)(v65 + 36)];
    *v46 = v37;
    *((_QWORD *)v46 + 1) = v39;
    *((_QWORD *)v46 + 2) = v41;
    *((_QWORD *)v46 + 3) = v43;
    *((_QWORD *)v46 + 4) = v45;
    v46[40] = 0;
    sub_20DD851D0((uint64_t)v11, &qword_2549EC1F8);
    v47 = v66;
    sub_20DE1EDAC(v66);
    v48 = v71;
    v49 = v72;
    v50 = v69;
    (*(void (**)(char *, _QWORD, uint64_t))(v71 + 104))(v69, *MEMORY[0x24BDEB3F0], v72);
    v51 = sub_20DE203B0();
    v52 = *(void (**)(char *, uint64_t))(v48 + 8);
    v52(v50, v49);
    v52((char *)v47, v49);
    v53 = (void *)objc_opt_self();
    v54 = &selRef_secondarySystemBackgroundColor;
    if ((v51 & 1) == 0)
      v54 = &selRef_clearColor;
    v55 = MEMORY[0x212BB5650](objc_msgSend(v53, *v54));
    v56 = sub_20DE20770();
    sub_20DD8516C((uint64_t)v13, (uint64_t)v15, &qword_2549EC200);
    v57 = &v15[*(int *)(v68 + 36)];
    *(_QWORD *)v57 = v55;
    v57[8] = v56;
    sub_20DD851D0((uint64_t)v13, &qword_2549EC200);
    v58 = v73;
    sub_20DD8516C((uint64_t)v15, v73, &qword_2549EC208);
    v59 = (_QWORD *)(v58 + *(int *)(v67 + 36));
    *v59 = nullsub_1;
    v59[1] = 0;
    v59[2] = 0;
    v59[3] = 0;
    sub_20DD851D0((uint64_t)v15, &qword_2549EC208);
    v60 = v70;
    sub_20DD8516C(v58, v70, &qword_2549EC210);
    v61 = (_QWORD *)(v60 + *(int *)(v75 + 36));
    *v61 = 0;
    v61[1] = 0;
    v61[2] = nullsub_1;
    v61[3] = 0;
    sub_20DD851D0(v58, &qword_2549EC210);
    v62 = v74;
    sub_20DD93408(v60, v74, &qword_2549EC218);
    sub_20DD8516C(v62, v77, &qword_2549EC218);
    swift_storeEnumTagMultiPayload();
    sub_20DE1F008(&qword_2549EC220, &qword_2549EC218, sub_20DE1EFEC);
    sub_20DD8512C(&qword_2549EC258, (uint64_t (*)(uint64_t))type metadata accessor for NoActivityView, (uint64_t)&protocol conformance descriptor for NoActivityView);
    sub_20DE206B0();
    sub_20DD851D0(v62, &qword_2549EC218);
    v34 = (uint64_t)v26;
    v35 = type metadata accessor for SummaryView.Model;
  }
  return sub_20DD909C0(v34, v35);
}

uint64_t sub_20DE1A1B8(uint64_t *a1, uint64_t a2)
{
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void (*v21)(_QWORD);
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  void (*v45)(_QWORD);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v47 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF58);
  MEMORY[0x24BDAC7A8](v3);
  v42 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v37 - v6;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v37 - v9;
  v11 = sub_20DE200BC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v37 - v16;
  v18 = *a1;
  v19 = a1[1];
  if (qword_2549E79E8 != -1)
    swift_once();
  v46 = v18;
  v20 = __swift_project_value_buffer(v11, (uint64_t)qword_2549EF530);
  v21 = *(void (**)(_QWORD))(v12 + 16);
  v44 = v20;
  v45 = v21;
  v21(v17);
  swift_bridgeObjectRetain_n();
  v22 = sub_20DE200A4();
  v23 = sub_20DE20DB8();
  if (os_log_type_enabled(v22, v23))
  {
    v39 = v12;
    v24 = swift_slowAlloc();
    v41 = v11;
    v25 = (uint8_t *)v24;
    v37 = swift_slowAlloc();
    v49 = v37;
    v43 = v7;
    *(_DWORD *)v25 = 136315138;
    if (v19)
      v26 = v46;
    else
      v26 = 7104878;
    v40 = v14;
    if (v19)
      v27 = v19;
    else
      v27 = 0xE300000000000000;
    v38 = v10;
    swift_bridgeObjectRetain();
    v48 = sub_20DDE0F94(v26, v27, &v49);
    v10 = v38;
    v7 = v43;
    sub_20DE20E24();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_20DD80000, v22, v23, "SummaryView received userAltDSID %s; fetching model", v25, 0xCu);
    v28 = v37;
    swift_arrayDestroy();
    MEMORY[0x212BB6064](v28, -1, -1);
    v29 = v25;
    v30 = v41;
    MEMORY[0x212BB6064](v29, -1, -1);

    v31 = v46;
    v39 = *(_QWORD *)(v39 + 8);
    ((void (*)(char *, uint64_t))v39)(v17, v30);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v39 = *(_QWORD *)(v12 + 8);
    ((void (*)(char *, uint64_t))v39)(v17, v11);
    v31 = v46;
  }
  v32 = (_QWORD *)(v47 + *(int *)(type metadata accessor for SummaryView(0) + 28));
  v33 = v32[3];
  v34 = v32[4];
  __swift_project_boxed_opaque_existential_1(v32, v33);
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v34 + 24))(v31, v19, v33, v34);
  v35 = type metadata accessor for SummaryView.Model(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v10, 0, 1, v35);
  sub_20DD8516C((uint64_t)v10, (uint64_t)v7, &qword_2549EBF58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF90);
  sub_20DE20A40();
  return sub_20DD851D0((uint64_t)v10, &qword_2549EBF58);
}

uint64_t sub_20DE1A770@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v39 = a2;
  v43 = a3;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
  MEMORY[0x24BDAC7A8](v42);
  v40 = (uint64_t)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v37 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C50);
  MEMORY[0x24BDAC7A8](v8);
  v38 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for OverviewChart.Model(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (int *)type metadata accessor for OverviewChart(0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v41 = (uint64_t)&v37 - v17;
  v18 = (int *)type metadata accessor for UsageHeaderView(0);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v37 - v22;
  v24 = type metadata accessor for SummaryView.Model(0);
  sub_20DD8BACC(a1 + *(int *)(v24 + 20), (uint64_t)v23, type metadata accessor for UsageHeaderView.Model);
  v25 = *(_QWORD *)(a1 + *(int *)(v24 + 24));
  sub_20DD943E8((uint64_t)&v23[v18[6]]);
  *(_QWORD *)&v23[v18[5]] = v25;
  *(_QWORD *)&v23[v18[7]] = 0;
  sub_20DD8BACC(a1, (uint64_t)v12, type metadata accessor for OverviewChart.Model);
  type metadata accessor for SummaryView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7D30);
  v26 = (uint64_t)v38;
  sub_20DE20A4C();
  v27 = sub_20DE1FD68();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v7, 1, 1, v27);
  sub_20DD8516C((uint64_t)v7, v40, &qword_2549E7C40);
  sub_20DE20A28();
  sub_20DD851D0((uint64_t)v7, &qword_2549E7C40);
  v28 = v13[7];
  v29 = &v15[v13[8]];
  v44 = 0x4024000000000000;
  sub_20DE20A28();
  v30 = v46;
  *(_QWORD *)v29 = v45;
  *((_QWORD *)v29 + 1) = v30;
  v31 = &v15[v13[9]];
  v44 = 0;
  sub_20DE20A28();
  v32 = v46;
  *(_QWORD *)v31 = v45;
  *((_QWORD *)v31 + 1) = v32;
  sub_20DD8BB14((uint64_t)v12, (uint64_t)v15, type metadata accessor for OverviewChart.Model);
  sub_20DD93408(v26, (uint64_t)&v15[v13[6]], &qword_2549E7C50);
  v15[v13[10]] = 0;
  *(_QWORD *)&v15[v28] = 0;
  v33 = v41;
  sub_20DD8BB14((uint64_t)v15, v41, type metadata accessor for OverviewChart);
  sub_20DD8BACC((uint64_t)v23, (uint64_t)v20, type metadata accessor for UsageHeaderView);
  sub_20DD8BACC(v33, (uint64_t)v15, type metadata accessor for OverviewChart);
  v34 = v43;
  sub_20DD8BACC((uint64_t)v20, v43, type metadata accessor for UsageHeaderView);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EC268);
  sub_20DD8BACC((uint64_t)v15, v34 + *(int *)(v35 + 48), type metadata accessor for OverviewChart);
  sub_20DD909C0(v33, type metadata accessor for OverviewChart);
  sub_20DD909C0((uint64_t)v23, type metadata accessor for UsageHeaderView);
  sub_20DD909C0((uint64_t)v15, type metadata accessor for OverviewChart);
  return sub_20DD909C0((uint64_t)v20, type metadata accessor for UsageHeaderView);
}

double sub_20DE1AB70@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20DE20350();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_20DE1ABEC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_20DE2035C();
}

uint64_t sub_20DE1AC6C()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20DE20350();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_20DE1ACDC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_20DE2035C();
}

void (*sub_20DE1AD54(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_20DE20344();
  return sub_20DDDD278;
}

uint64_t sub_20DE1ADCC()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF88);
  sub_20DE2032C();
  return swift_endAccess();
}

uint64_t sub_20DE1AE30(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  void (*v10)(char *, uint64_t, uint64_t, __n128);
  uint64_t v12;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF68);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - v8;
  v10 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v3 + 16);
  v10((char *)&v12 - v8, a1, v2, v7);
  ((void (*)(char *, char *, uint64_t))v10)(v5, v9, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF88);
  sub_20DE20338();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
}

uint64_t sub_20DE1AF40()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF88);
  sub_20DE2032C();
  return swift_endAccess();
}

uint64_t sub_20DE1AFA0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __n128 v4;
  uint64_t v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF68);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v3 + 16))((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2, v4);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF88);
  sub_20DE20338();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_20DE1B074(_QWORD *a1))(uint64_t a1, char a2)
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF68);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtCV16ScreenTimeUICore11SummaryView6Bridge__userAltDSID;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF88);
  sub_20DE2032C();
  swift_endAccess();
  return sub_20DDDD634;
}

uint64_t SummaryView.Bridge.__allocating_init(userAltDSID:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF88);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = swift_allocObject();
  v9 = v8 + OBJC_IVAR____TtCV16ScreenTimeUICore11SummaryView6Bridge__userAltDSID;
  v11 = 0;
  v12 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBFA0);
  sub_20DE20320();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v9, v7, v4);
  swift_getKeyPath();
  swift_getKeyPath();
  v11 = a1;
  v12 = a2;
  swift_retain();
  sub_20DE2035C();
  return v8;
}

uint64_t SummaryView.Bridge.init(userAltDSID:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF88);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v2 + OBJC_IVAR____TtCV16ScreenTimeUICore11SummaryView6Bridge__userAltDSID;
  v11 = 0;
  v12 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBFA0);
  sub_20DE20320();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v9, v8, v5);
  swift_getKeyPath();
  swift_getKeyPath();
  v11 = a1;
  v12 = a2;
  swift_retain();
  sub_20DE2035C();
  return v2;
}

uint64_t SummaryView.Bridge.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtCV16ScreenTimeUICore11SummaryView6Bridge__userAltDSID;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF88);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SummaryView.Bridge.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtCV16ScreenTimeUICore11SummaryView6Bridge__userAltDSID;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF88);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_20DE1B3F0()
{
  return sub_20DE2050C();
}

uint64_t sub_20DE1B410(uint64_t a1)
{
  uint64_t v2;
  __n128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_20DE203BC();
  v3 = MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, __n128))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return sub_20DE20518();
}

uint64_t type metadata accessor for SummaryView(uint64_t a1)
{
  return sub_20DD87B48(a1, (uint64_t *)&unk_2549EC008);
}

uint64_t sub_20DE1B4A4()
{
  uint64_t v0;
  int *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
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
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);

  v1 = (int *)type metadata accessor for SummaryView(0);
  v2 = (*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = v0 + v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_20DE203BC();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v0 + v2, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v3 + v1[7]);
  v5 = v3 + v1[8];
  v6 = (int *)type metadata accessor for SummaryView.Model(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, int *))(*((_QWORD *)v6 - 1) + 48))(v5, 1, v6))
  {
    v7 = sub_20DE1FD68();
    v26 = *(_QWORD *)(v7 - 8);
    v8 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v8(v5, v7);
    v9 = type metadata accessor for OverviewChart.Model(0);
    swift_bridgeObjectRelease();
    v10 = v5 + *(int *)(v9 + 24);
    v11 = sub_20DE1FE94();
    v12 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8);
    v12(v10, v11);
    swift_release();
    v13 = v5 + v6[5];
    v12(v13, v11);
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
    swift_bridgeObjectRelease();
    v15 = v13 + *(int *)(v14 + 44);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v15, 1, v7))
      v8(v15, v7);
    v16 = type metadata accessor for UsageHeaderView.Model(0);
    v12(v13 + *(int *)(v16 + 20), v11);
    v27 = v12;
    v17 = v5 + v6[6];
    v18 = type metadata accessor for ActivityNavigationState(0);
    v19 = v17 + *(int *)(v18 + 20);
    v8(v19, v7);
    v20 = v19 + *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
    v21 = sub_20DE1FC48();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(v20, v21);
    v27(v17 + *(int *)(v18 + 24), v11);
    v27(v5 + v6[7], v11);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF90);
  swift_release();
  v22 = v3 + v1[9];
  v23 = sub_20DE1FD68();
  v24 = *(_QWORD *)(v23 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7D30);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20DE1B7A4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SummaryView(0) - 8) + 80);
  return sub_20DE1A1B8(a1, v1 + ((v3 + 16) & ~v3));
}

uint64_t sub_20DE1B7E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for SummaryView(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  __int128 v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  uint64_t v29;
  char *v30;
  char *v31;
  int *v32;
  uint64_t v33;
  char *v34;
  unsigned int (*v35)(char *, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  unsigned int (*v55)(char *, uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  char *__dst;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(char *, char *, uint64_t);
  uint64_t v65;
  char *v66;
  void (*v67)(char *, char *, uint64_t);
  char *v68;
  uint64_t v69;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF60);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20DE203BC();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = a3[5];
    v10 = a3[6];
    v11 = (char *)a1 + v9;
    v12 = (char *)a2 + v9;
    *v11 = *v12;
    *((_QWORD *)v11 + 1) = *((_QWORD *)v12 + 1);
    *(uint64_t *)((char *)a1 + v10) = *(uint64_t *)((char *)a2 + v10);
    v13 = a3[7];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = *(_OWORD *)((char *)a2 + v13 + 24);
    *(_OWORD *)((char *)a1 + v13 + 24) = v16;
    v17 = v16;
    v18 = **(void (***)(char *, char *, uint64_t))(v16 - 8);
    swift_retain();
    swift_retain();
    v18(v14, v15, v17);
    v19 = a3[8];
    v20 = (char *)a1 + v19;
    v21 = (char *)a2 + v19;
    v22 = type metadata accessor for SummaryView.Model(0);
    v23 = *(_QWORD *)(v22 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
    {
      v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF58);
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    }
    else
    {
      v61 = v23;
      v65 = sub_20DE1FD68();
      v62 = *(_QWORD *)(v65 - 8);
      v64 = *(void (**)(char *, char *, uint64_t))(v62 + 16);
      v64(v20, v21, v65);
      v25 = (int *)type metadata accessor for OverviewChart.Model(0);
      *(_QWORD *)&v20[v25[5]] = *(_QWORD *)&v21[v25[5]];
      v26 = v25[6];
      v66 = &v21[v26];
      v68 = &v20[v26];
      v27 = sub_20DE1FE94();
      v28 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16);
      swift_bridgeObjectRetain();
      v28(v68, v66, v27);
      *(_QWORD *)&v20[v25[7]] = *(_QWORD *)&v21[v25[7]];
      v20[v25[8]] = v21[v25[8]];
      v29 = *(int *)(v22 + 20);
      v30 = &v20[v29];
      v31 = &v21[v29];
      swift_retain();
      v67 = v28;
      v69 = v27;
      v28(v30, v31, v27);
      v32 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
      *(_QWORD *)&v30[v32[9]] = *(_QWORD *)&v31[v32[9]];
      v30[v32[10]] = v31[v32[10]];
      v33 = v32[11];
      __dst = &v30[v33];
      v60 = v31;
      v34 = &v31[v33];
      v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v62 + 48);
      swift_bridgeObjectRetain();
      if (v35(v34, 1, v65))
      {
        v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
        memcpy(__dst, v34, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
      }
      else
      {
        v64(__dst, v34, v65);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v62 + 56))(__dst, 0, 1, v65);
      }
      v37 = type metadata accessor for UsageHeaderView.Model(0);
      v28(&v30[*(int *)(v37 + 20)], &v60[*(int *)(v37 + 20)], v69);
      v38 = *(int *)(v22 + 24);
      v39 = &v20[v38];
      v63 = v22;
      v40 = &v21[v38];
      *(_QWORD *)&v20[v38] = *(_QWORD *)&v21[v38];
      v41 = type metadata accessor for ActivityNavigationState(0);
      v42 = *(int *)(v41 + 20);
      v43 = &v39[v42];
      v44 = &v40[v42];
      v64(&v39[v42], &v40[v42], v65);
      v45 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
      v46 = &v43[v45];
      v47 = &v44[v45];
      v48 = sub_20DE1FC48();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v48 - 8) + 16))(v46, v47, v48);
      v67(&v39[*(int *)(v41 + 24)], &v40[*(int *)(v41 + 24)], v69);
      v67(&v20[*(int *)(v63 + 28)], &v21[*(int *)(v63 + 28)], v69);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v61 + 56))(v20, 0, 1, v63);
    }
    v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF90);
    *(_QWORD *)&v20[*(int *)(v49 + 28)] = *(_QWORD *)&v21[*(int *)(v49 + 28)];
    v50 = a3[9];
    v51 = (char *)a1 + v50;
    v52 = (char *)a2 + v50;
    v53 = sub_20DE1FD68();
    v54 = *(_QWORD *)(v53 - 8);
    v55 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v54 + 48);
    swift_retain();
    if (v55(v52, 1, v53))
    {
      v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
      memcpy(v51, v52, *(_QWORD *)(*(_QWORD *)(v56 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v51, v52, v53);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v54 + 56))(v51, 0, 1, v53);
    }
    v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7D30);
    *(_QWORD *)&v51[*(int *)(v57 + 28)] = *(_QWORD *)&v52[*(int *)(v57 + 28)];
  }
  swift_retain();
  return a1;
}

uint64_t destroy for SummaryView(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
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
  void (*v26)(uint64_t, uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_20DE203BC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + a2[7]);
  v5 = a1 + a2[8];
  v6 = (int *)type metadata accessor for SummaryView.Model(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, int *))(*((_QWORD *)v6 - 1) + 48))(v5, 1, v6))
  {
    v7 = sub_20DE1FD68();
    v8 = *(_QWORD *)(v7 - 8);
    v26 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v26(v5, v7);
    v9 = type metadata accessor for OverviewChart.Model(0);
    swift_bridgeObjectRelease();
    v10 = v5 + *(int *)(v9 + 24);
    v11 = sub_20DE1FE94();
    v12 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8);
    v12(v10, v11);
    swift_release();
    v13 = v5 + v6[5];
    v12(v13, v11);
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
    swift_bridgeObjectRelease();
    v15 = v13 + *(int *)(v14 + 44);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v15, 1, v7))
      v26(v15, v7);
    v16 = type metadata accessor for UsageHeaderView.Model(0);
    v12(v13 + *(int *)(v16 + 20), v11);
    v17 = v5 + v6[6];
    v18 = type metadata accessor for ActivityNavigationState(0);
    v19 = v17 + *(int *)(v18 + 20);
    v26(v19, v7);
    v20 = v19 + *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
    v21 = sub_20DE1FC48();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(v20, v21);
    v12(v17 + *(int *)(v18 + 24), v11);
    v12(v5 + v6[7], v11);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF90);
  swift_release();
  v22 = a1 + a2[9];
  v23 = sub_20DE1FD68();
  v24 = *(_QWORD *)(v23 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7D30);
  return swift_release();
}

_QWORD *initializeWithCopy for SummaryView(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  __int128 v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  uint64_t v28;
  char *v29;
  char *v30;
  int *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  unsigned int (*v35)(char *, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  unsigned int (*v55)(char *, uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  int *v62;
  uint64_t v63;
  void (*v64)(char *, char *, uint64_t);
  uint64_t v65;
  char *v66;
  uint64_t v67;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_20DE203BC();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = a3[5];
  v8 = a3[6];
  v9 = (char *)a1 + v7;
  v10 = (char *)a2 + v7;
  *v9 = *v10;
  *((_QWORD *)v9 + 1) = *((_QWORD *)v10 + 1);
  *(_QWORD *)((char *)a1 + v8) = *(_QWORD *)((char *)a2 + v8);
  v11 = a3[7];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = *(_OWORD *)((char *)a2 + v11 + 24);
  *(_OWORD *)((char *)a1 + v11 + 24) = v14;
  v15 = v14;
  v16 = **(void (***)(char *, char *, uint64_t))(v14 - 8);
  swift_retain();
  swift_retain();
  v16(v12, v13, v15);
  v17 = a3[8];
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  v20 = type metadata accessor for SummaryView.Model(0);
  v21 = *(_QWORD *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
  {
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF58);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    v59 = a1;
    v61 = v21;
    v65 = sub_20DE1FD68();
    v63 = *(_QWORD *)(v65 - 8);
    v64 = *(void (**)(char *, char *, uint64_t))(v63 + 16);
    v64(v18, v19, v65);
    v23 = (int *)type metadata accessor for OverviewChart.Model(0);
    *(_QWORD *)&v18[v23[5]] = *(_QWORD *)&v19[v23[5]];
    v24 = v23[6];
    v66 = &v18[v24];
    v25 = &v19[v24];
    v26 = sub_20DE1FE94();
    v27 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16);
    swift_bridgeObjectRetain();
    v27(v66, v25, v26);
    *(_QWORD *)&v18[v23[7]] = *(_QWORD *)&v19[v23[7]];
    v18[v23[8]] = v19[v23[8]];
    v67 = v20;
    v28 = *(int *)(v20 + 20);
    v29 = &v18[v28];
    v30 = &v19[v28];
    swift_retain();
    v60 = v26;
    v27(v29, v30, v26);
    v31 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
    *(_QWORD *)&v29[v31[9]] = *(_QWORD *)&v30[v31[9]];
    v29[v31[10]] = v30[v31[10]];
    v32 = v31[11];
    v33 = &v29[v32];
    v34 = &v30[v32];
    v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v63 + 48);
    swift_bridgeObjectRetain();
    v62 = a3;
    if (v35(v34, 1, v65))
    {
      v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
      memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    }
    else
    {
      v64(v33, v34, v65);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v63 + 56))(v33, 0, 1, v65);
    }
    v37 = type metadata accessor for UsageHeaderView.Model(0);
    v27(&v29[*(int *)(v37 + 20)], &v30[*(int *)(v37 + 20)], v60);
    v38 = *(int *)(v67 + 24);
    v39 = &v18[v38];
    v40 = &v19[v38];
    *(_QWORD *)&v18[v38] = *(_QWORD *)&v19[v38];
    v41 = type metadata accessor for ActivityNavigationState(0);
    v42 = *(int *)(v41 + 20);
    v43 = &v39[v42];
    v44 = &v40[v42];
    v64(&v39[v42], &v40[v42], v65);
    v45 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
    v46 = &v43[v45];
    v47 = &v44[v45];
    v48 = sub_20DE1FC48();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v48 - 8) + 16))(v46, v47, v48);
    v27(&v39[*(int *)(v41 + 24)], &v40[*(int *)(v41 + 24)], v60);
    v27(&v18[*(int *)(v67 + 28)], &v19[*(int *)(v67 + 28)], v60);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v61 + 56))(v18, 0, 1, v67);
    a3 = v62;
    a1 = v59;
  }
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF90);
  *(_QWORD *)&v18[*(int *)(v49 + 28)] = *(_QWORD *)&v19[*(int *)(v49 + 28)];
  v50 = a3[9];
  v51 = (char *)a1 + v50;
  v52 = (char *)a2 + v50;
  v53 = sub_20DE1FD68();
  v54 = *(_QWORD *)(v53 - 8);
  v55 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v54 + 48);
  swift_retain();
  if (v55(v52, 1, v53))
  {
    v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v51, v52, *(_QWORD *)(*(_QWORD *)(v56 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v51, v52, v53);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v54 + 56))(v51, 0, 1, v53);
  }
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7D30);
  *(_QWORD *)&v51[*(int *)(v57 + 28)] = *(_QWORD *)&v52[*(int *)(v57 + 28)];
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for SummaryView(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  int *v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, int *);
  int v16;
  int v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  char *v21;
  int *v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  char *v26;
  char *v27;
  int *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  unsigned int (*v32)(char *, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  int *v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  void (*v40)(char *, char *, uint64_t);
  uint64_t v41;
  char *v42;
  char *v43;
  int *v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t (*v48)(void);
  int v49;
  size_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t (*v82)(char *, uint64_t, uint64_t);
  int v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  char *v88;
  _QWORD *__src;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  void (*v94)(char *, char *, uint64_t);
  void (*v95)(char *, char *, uint64_t);
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void (*v99)(char *, char *, uint64_t);
  char *v100;
  int *v101;
  uint64_t v102;
  int *v103;
  int *v104;

  v4 = a2;
  if (a1 != a2)
  {
    sub_20DD851D0((uint64_t)a1, &qword_2549EBF60);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF60);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_20DE203BC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, v4, v6);
    }
    else
    {
      *a1 = *v4;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)v4 + v7;
  *v8 = *v9;
  *((_QWORD *)v8 + 1) = *((_QWORD *)v9 + 1);
  swift_retain();
  swift_release();
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)v4 + a3[6]);
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1((_QWORD *)((char *)a1 + a3[7]), (_QWORD *)((char *)v4 + a3[7]));
  v10 = a3[8];
  v11 = (char *)a1 + v10;
  v12 = (char *)v4 + v10;
  v13 = (int *)type metadata accessor for SummaryView.Model(0);
  v14 = *((_QWORD *)v13 - 1);
  v15 = *(uint64_t (**)(char *, uint64_t, int *))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (v17)
    {
      sub_20DD909C0((uint64_t)v11, type metadata accessor for SummaryView.Model);
      goto LABEL_12;
    }
    v104 = a3;
    v97 = sub_20DE1FD68();
    v90 = *(_QWORD *)(v97 - 8);
    v95 = *(void (**)(char *, char *, uint64_t))(v90 + 24);
    v95(v11, v12, v97);
    v35 = (int *)type metadata accessor for OverviewChart.Model(0);
    *(_QWORD *)&v11[v35[5]] = *(_QWORD *)&v12[v35[5]];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v36 = v35[6];
    v37 = &v11[v36];
    v38 = &v12[v36];
    v39 = sub_20DE1FE94();
    v40 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 24);
    v40(v37, v38, v39);
    *(_QWORD *)&v11[v35[7]] = *(_QWORD *)&v12[v35[7]];
    swift_retain();
    swift_release();
    v11[v35[8]] = v12[v35[8]];
    v41 = v13[5];
    v42 = &v11[v41];
    v43 = &v12[v41];
    v99 = v40;
    v102 = v39;
    v40(&v11[v41], &v12[v41], v39);
    v44 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
    *(_QWORD *)&v42[v44[9]] = *(_QWORD *)&v43[v44[9]];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v42[v44[10]] = v43[v44[10]];
    v45 = v44[11];
    v92 = v42;
    v46 = &v42[v45];
    v47 = &v43[v45];
    v48 = *(uint64_t (**)(void))(v90 + 48);
    v88 = v46;
    LODWORD(v44) = v48();
    v49 = ((uint64_t (*)(char *, uint64_t, uint64_t))v48)(v47, 1, v97);
    if ((_DWORD)v44)
    {
      if (!v49)
      {
        (*(void (**)(char *, char *, uint64_t))(v90 + 16))(v88, v47, v97);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v90 + 56))(v88, 0, 1, v97);
        goto LABEL_23;
      }
      v50 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40) - 8) + 64);
      v51 = v88;
    }
    else
    {
      if (!v49)
      {
        v95(v88, v47, v97);
        goto LABEL_23;
      }
      (*(void (**)(char *, uint64_t))(v90 + 8))(v88, v97);
      v50 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40) - 8) + 64);
      v51 = v88;
    }
    memcpy(v51, v47, v50);
LABEL_23:
    v64 = type metadata accessor for UsageHeaderView.Model(0);
    v40(&v92[*(int *)(v64 + 20)], &v43[*(int *)(v64 + 20)], v102);
    v65 = v13[6];
    v66 = &v11[v65];
    v67 = &v12[v65];
    *(_QWORD *)&v11[v65] = *(_QWORD *)&v12[v65];
    v68 = type metadata accessor for ActivityNavigationState(0);
    v69 = *(int *)(v68 + 20);
    v70 = &v66[v69];
    v71 = &v67[v69];
    v95(&v66[v69], &v67[v69], v97);
    v72 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
    v73 = &v70[v72];
    v74 = &v71[v72];
    v75 = sub_20DE1FC48();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v75 - 8) + 24))(v73, v74, v75);
    v99(&v66[*(int *)(v68 + 24)], &v67[*(int *)(v68 + 24)], v102);
    v99(&v11[v13[7]], &v12[v13[7]], v102);
    a3 = v104;
    goto LABEL_24;
  }
  if (v17)
  {
LABEL_12:
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF58);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    goto LABEL_24;
  }
  __src = v4;
  v93 = v14;
  v18 = sub_20DE1FD68();
  v96 = *(_QWORD *)(v18 - 8);
  v98 = v18;
  v94 = *(void (**)(char *, char *, uint64_t))(v96 + 16);
  v94(v11, v12, v18);
  v19 = (int *)type metadata accessor for OverviewChart.Model(0);
  *(_QWORD *)&v11[v19[5]] = *(_QWORD *)&v12[v19[5]];
  v20 = v19[6];
  v100 = &v11[v20];
  v21 = &v12[v20];
  v22 = v13;
  v23 = sub_20DE1FE94();
  v24 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16);
  swift_bridgeObjectRetain();
  v24(v100, v21, v23);
  *(_QWORD *)&v11[v19[7]] = *(_QWORD *)&v12[v19[7]];
  v11[v19[8]] = v12[v19[8]];
  v101 = v22;
  v25 = v22[5];
  v26 = &v11[v25];
  v27 = &v12[v25];
  swift_retain();
  v91 = v23;
  v24(v26, v27, v23);
  v28 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  *(_QWORD *)&v26[v28[9]] = *(_QWORD *)&v27[v28[9]];
  v26[v28[10]] = v27[v28[10]];
  v29 = v28[11];
  v30 = &v26[v29];
  v31 = &v27[v29];
  v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v96 + 48);
  swift_bridgeObjectRetain();
  v103 = a3;
  if (v32(v31, 1, v98))
  {
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
  }
  else
  {
    v94(v30, v31, v98);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v96 + 56))(v30, 0, 1, v98);
  }
  v52 = type metadata accessor for UsageHeaderView.Model(0);
  v24(&v26[*(int *)(v52 + 20)], &v27[*(int *)(v52 + 20)], v91);
  v53 = v101[6];
  v54 = &v11[v53];
  v55 = &v12[v53];
  *(_QWORD *)&v11[v53] = *(_QWORD *)&v12[v53];
  v56 = type metadata accessor for ActivityNavigationState(0);
  v57 = *(int *)(v56 + 20);
  v58 = &v54[v57];
  v59 = &v55[v57];
  v94(&v54[v57], &v55[v57], v98);
  v60 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  v61 = &v58[v60];
  v62 = &v59[v60];
  v63 = sub_20DE1FC48();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v63 - 8) + 16))(v61, v62, v63);
  v24(&v54[*(int *)(v56 + 24)], &v55[*(int *)(v56 + 24)], v91);
  v24(&v11[v101[7]], &v12[v101[7]], v91);
  (*(void (**)(char *, _QWORD, uint64_t, int *))(v93 + 56))(v11, 0, 1, v101);
  a3 = v103;
  v4 = __src;
LABEL_24:
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF90);
  *(_QWORD *)&v11[*(int *)(v76 + 28)] = *(_QWORD *)&v12[*(int *)(v76 + 28)];
  swift_retain();
  swift_release();
  v77 = a3[9];
  v78 = (char *)a1 + v77;
  v79 = (char *)v4 + v77;
  v80 = sub_20DE1FD68();
  v81 = *(_QWORD *)(v80 - 8);
  v82 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v81 + 48);
  v83 = v82(v78, 1, v80);
  v84 = v82(v79, 1, v80);
  if (!v83)
  {
    if (!v84)
    {
      (*(void (**)(char *, char *, uint64_t))(v81 + 24))(v78, v79, v80);
      goto LABEL_30;
    }
    (*(void (**)(char *, uint64_t))(v81 + 8))(v78, v80);
    goto LABEL_29;
  }
  if (v84)
  {
LABEL_29:
    v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v78, v79, *(_QWORD *)(*(_QWORD *)(v85 - 8) + 64));
    goto LABEL_30;
  }
  (*(void (**)(char *, char *, uint64_t))(v81 + 16))(v78, v79, v80);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v81 + 56))(v78, 0, 1, v80);
LABEL_30:
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7D30);
  *(_QWORD *)&v78[*(int *)(v86 + 28)] = *(_QWORD *)&v79[*(int *)(v86 + 28)];
  swift_retain();
  swift_release();
  return a1;
}

char *initializeWithTake for SummaryView(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  char *v26;
  char *v27;
  int *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  int *v55;
  uint64_t v56;
  void (*v57)(char *, char *, uint64_t);
  uint64_t v58;
  void (*v59)(char *, char *, uint64_t);
  char *v60;
  uint64_t v61;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_20DE203BC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];
  v9 = a3[7];
  v10 = a3[8];
  v11 = &a1[v9];
  v12 = &a2[v9];
  v13 = *(_OWORD *)v12;
  v14 = *((_OWORD *)v12 + 1);
  *((_QWORD *)v11 + 4) = *((_QWORD *)v12 + 4);
  *(_OWORD *)v11 = v13;
  *((_OWORD *)v11 + 1) = v14;
  v15 = &a1[v10];
  v16 = &a2[v10];
  v17 = type metadata accessor for SummaryView.Model(0);
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF58);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    v54 = v18;
    v58 = sub_20DE1FD68();
    v56 = *(_QWORD *)(v58 - 8);
    v57 = *(void (**)(char *, char *, uint64_t))(v56 + 32);
    v57(v15, v16, v58);
    v20 = (int *)type metadata accessor for OverviewChart.Model(0);
    *(_QWORD *)&v15[v20[5]] = *(_QWORD *)&v16[v20[5]];
    v21 = v20[6];
    v60 = &v15[v21];
    v22 = &v16[v21];
    v23 = sub_20DE1FE94();
    v24 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32);
    v24(v60, v22, v23);
    *(_QWORD *)&v15[v20[7]] = *(_QWORD *)&v16[v20[7]];
    v15[v20[8]] = v16[v20[8]];
    v59 = v24;
    v61 = v17;
    v25 = *(int *)(v17 + 20);
    v26 = &v15[v25];
    v27 = &v16[v25];
    v24(&v15[v25], &v16[v25], v23);
    v28 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
    *(_QWORD *)&v26[v28[9]] = *(_QWORD *)&v27[v28[9]];
    v26[v28[10]] = v27[v28[10]];
    v29 = v28[11];
    v30 = &v26[v29];
    v31 = &v27[v29];
    v55 = a3;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v56 + 48))(&v27[v29], 1, v58))
    {
      v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
      memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    }
    else
    {
      v57(v30, v31, v58);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v56 + 56))(v30, 0, 1, v58);
    }
    v33 = type metadata accessor for UsageHeaderView.Model(0);
    v59(&v26[*(int *)(v33 + 20)], &v27[*(int *)(v33 + 20)], v23);
    v34 = *(int *)(v61 + 24);
    v35 = &v15[v34];
    v36 = &v16[v34];
    *(_QWORD *)&v15[v34] = *(_QWORD *)&v16[v34];
    v37 = type metadata accessor for ActivityNavigationState(0);
    v38 = *(int *)(v37 + 20);
    v39 = &v35[v38];
    v40 = &v36[v38];
    v57(&v35[v38], &v36[v38], v58);
    v41 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
    v42 = &v39[v41];
    v43 = &v40[v41];
    v44 = sub_20DE1FC48();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v44 - 8) + 32))(v42, v43, v44);
    v59(&v35[*(int *)(v37 + 24)], &v36[*(int *)(v37 + 24)], v23);
    v59(&v15[*(int *)(v61 + 28)], &v16[*(int *)(v61 + 28)], v23);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v54 + 56))(v15, 0, 1, v61);
    a3 = v55;
  }
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF90);
  *(_QWORD *)&v15[*(int *)(v45 + 28)] = *(_QWORD *)&v16[*(int *)(v45 + 28)];
  v46 = a3[9];
  v47 = &a1[v46];
  v48 = &a2[v46];
  v49 = sub_20DE1FD68();
  v50 = *(_QWORD *)(v49 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48))(v48, 1, v49))
  {
    v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v47, v48, *(_QWORD *)(*(_QWORD *)(v51 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v47, v48, v49);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v50 + 56))(v47, 0, 1, v49);
  }
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7D30);
  *(_QWORD *)&v47[*(int *)(v52 + 28)] = *(_QWORD *)&v48[*(int *)(v52 + 28)];
  return a1;
}

char *assignWithTake for SummaryView(char *a1, char *a2, int *a3)
{
  char *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  __int128 v14;
  uint64_t v15;
  char *v16;
  char *v17;
  int *v18;
  uint64_t v19;
  uint64_t (*v20)(char *, uint64_t, int *);
  int v21;
  int v22;
  int *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  int *v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  char *v31;
  char *v32;
  int *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  void (*v45)(char *, char *, uint64_t);
  uint64_t v46;
  char *v47;
  char *v48;
  int *v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t (*v53)(char *, uint64_t, uint64_t);
  int v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t (*v86)(char *, uint64_t, uint64_t);
  int v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v92;
  char *__src;
  char *v94;
  void (*v95)(char *, char *, uint64_t);
  uint64_t v96;
  uint64_t v97;
  void (*v98)(char *, char *, uint64_t);
  uint64_t v99;
  uint64_t v100;
  void (*v101)(char *, char *, uint64_t);
  int *v102;
  uint64_t v103;
  int *v104;
  int *v105;

  v4 = a2;
  if (a1 != a2)
  {
    sub_20DD851D0((uint64_t)a1, &qword_2549EBF60);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF60);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20DE203BC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, v4, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, v4, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &v4[v8];
  *v9 = *v10;
  *((_QWORD *)v9 + 1) = *((_QWORD *)v10 + 1);
  swift_release();
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&v4[a3[6]];
  swift_release();
  v11 = a3[7];
  v12 = &a1[v11];
  v13 = &v4[v11];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a1[v11]);
  v14 = *((_OWORD *)v13 + 1);
  *(_OWORD *)v12 = *(_OWORD *)v13;
  *((_OWORD *)v12 + 1) = v14;
  *((_QWORD *)v12 + 4) = *((_QWORD *)v13 + 4);
  v15 = a3[8];
  v16 = &a1[v15];
  v17 = &v4[v15];
  v18 = (int *)type metadata accessor for SummaryView.Model(0);
  v19 = *((_QWORD *)v18 - 1);
  v20 = *(uint64_t (**)(char *, uint64_t, int *))(v19 + 48);
  v21 = v20(v16, 1, v18);
  v22 = v20(v17, 1, v18);
  if (!v21)
  {
    if (v22)
    {
      sub_20DD909C0((uint64_t)v16, type metadata accessor for SummaryView.Model);
      goto LABEL_11;
    }
    v105 = a3;
    v39 = sub_20DE1FD68();
    v97 = *(_QWORD *)(v39 - 8);
    v99 = v39;
    v95 = *(void (**)(char *, char *, uint64_t))(v97 + 40);
    v95(v16, v17, v39);
    v40 = (int *)type metadata accessor for OverviewChart.Model(0);
    *(_QWORD *)&v16[v40[5]] = *(_QWORD *)&v17[v40[5]];
    swift_bridgeObjectRelease();
    v41 = v40[6];
    v42 = &v16[v41];
    v43 = &v17[v41];
    v44 = sub_20DE1FE94();
    v45 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v44 - 8) + 40);
    v45(v42, v43, v44);
    *(_QWORD *)&v16[v40[7]] = *(_QWORD *)&v17[v40[7]];
    swift_release();
    v16[v40[8]] = v17[v40[8]];
    v46 = v18[5];
    v47 = &v16[v46];
    v48 = &v17[v46];
    v101 = v45;
    v103 = v44;
    v45(&v16[v46], &v17[v46], v44);
    v49 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
    *(_QWORD *)&v47[v49[9]] = *(_QWORD *)&v48[v49[9]];
    swift_bridgeObjectRelease();
    v47[v49[10]] = v48[v49[10]];
    v50 = v49[11];
    v94 = v48;
    v51 = &v47[v50];
    v52 = &v48[v50];
    v53 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v97 + 48);
    LODWORD(v48) = v53(&v47[v50], 1, v99);
    v54 = v53(v52, 1, v99);
    if ((_DWORD)v48)
    {
      if (!v54)
      {
        (*(void (**)(char *, char *, uint64_t))(v97 + 32))(v51, v52, v99);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v97 + 56))(v51, 0, 1, v99);
LABEL_20:
        v68 = type metadata accessor for UsageHeaderView.Model(0);
        v101(&v47[*(int *)(v68 + 20)], &v94[*(int *)(v68 + 20)], v103);
        v69 = v18[6];
        v70 = &v16[v69];
        v71 = &v17[v69];
        *(_QWORD *)&v16[v69] = *(_QWORD *)&v17[v69];
        v72 = type metadata accessor for ActivityNavigationState(0);
        v73 = *(int *)(v72 + 20);
        v74 = &v70[v73];
        v75 = &v71[v73];
        v95(&v70[v73], &v71[v73], v99);
        v76 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
        v77 = &v74[v76];
        v78 = &v75[v76];
        v79 = sub_20DE1FC48();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v79 - 8) + 40))(v77, v78, v79);
        v101(&v70[*(int *)(v72 + 24)], &v71[*(int *)(v72 + 24)], v103);
        v101(&v16[v18[7]], &v17[v18[7]], v103);
        a3 = v105;
        goto LABEL_21;
      }
    }
    else
    {
      if (!v54)
      {
        v95(v51, v52, v99);
        goto LABEL_20;
      }
      (*(void (**)(char *, uint64_t))(v97 + 8))(v51, v99);
    }
    v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v51, v52, *(_QWORD *)(*(_QWORD *)(v67 - 8) + 64));
    goto LABEL_20;
  }
  if (v22)
  {
LABEL_11:
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF58);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    goto LABEL_21;
  }
  __src = v4;
  v104 = a3;
  v100 = sub_20DE1FD68();
  v92 = *(_QWORD *)(v100 - 8);
  v98 = *(void (**)(char *, char *, uint64_t))(v92 + 32);
  v98(v16, v17, v100);
  v23 = (int *)type metadata accessor for OverviewChart.Model(0);
  *(_QWORD *)&v16[v23[5]] = *(_QWORD *)&v17[v23[5]];
  v24 = v23[6];
  v25 = &v16[v24];
  v26 = &v17[v24];
  v27 = v18;
  v28 = sub_20DE1FE94();
  v29 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 32);
  v29(v25, v26, v28);
  *(_QWORD *)&v16[v23[7]] = *(_QWORD *)&v17[v23[7]];
  v16[v23[8]] = v17[v23[8]];
  v102 = v27;
  v30 = v27[5];
  v31 = &v16[v30];
  v32 = &v17[v30];
  v29(&v16[v30], &v17[v30], v28);
  v33 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  *(_QWORD *)&v31[v33[9]] = *(_QWORD *)&v32[v33[9]];
  v31[v33[10]] = v32[v33[10]];
  v34 = v33[11];
  v35 = &v31[v34];
  v36 = &v32[v34];
  v96 = v19;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v92 + 48))(&v32[v34], 1, v100))
  {
    v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
  }
  else
  {
    v98(v35, v36, v100);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v92 + 56))(v35, 0, 1, v100);
  }
  v55 = type metadata accessor for UsageHeaderView.Model(0);
  v29(&v31[*(int *)(v55 + 20)], &v32[*(int *)(v55 + 20)], v28);
  v56 = v102[6];
  v57 = &v16[v56];
  v58 = &v17[v56];
  *(_QWORD *)&v16[v56] = *(_QWORD *)&v17[v56];
  v59 = type metadata accessor for ActivityNavigationState(0);
  v60 = *(int *)(v59 + 20);
  v61 = &v57[v60];
  v62 = &v58[v60];
  v98(&v57[v60], &v58[v60], v100);
  v63 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  v64 = &v61[v63];
  v65 = &v62[v63];
  v66 = sub_20DE1FC48();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v66 - 8) + 32))(v64, v65, v66);
  v29(&v57[*(int *)(v59 + 24)], &v58[*(int *)(v59 + 24)], v28);
  v29(&v16[v102[7]], &v17[v102[7]], v28);
  (*(void (**)(char *, _QWORD, uint64_t, int *))(v96 + 56))(v16, 0, 1, v102);
  a3 = v104;
  v4 = __src;
LABEL_21:
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF90);
  *(_QWORD *)&v16[*(int *)(v80 + 28)] = *(_QWORD *)&v17[*(int *)(v80 + 28)];
  swift_release();
  v81 = a3[9];
  v82 = &a1[v81];
  v83 = &v4[v81];
  v84 = sub_20DE1FD68();
  v85 = *(_QWORD *)(v84 - 8);
  v86 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v85 + 48);
  v87 = v86(v82, 1, v84);
  v88 = v86(v83, 1, v84);
  if (!v87)
  {
    if (!v88)
    {
      (*(void (**)(char *, char *, uint64_t))(v85 + 40))(v82, v83, v84);
      goto LABEL_27;
    }
    (*(void (**)(char *, uint64_t))(v85 + 8))(v82, v84);
    goto LABEL_26;
  }
  if (v88)
  {
LABEL_26:
    v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v82, v83, *(_QWORD *)(*(_QWORD *)(v89 - 8) + 64));
    goto LABEL_27;
  }
  (*(void (**)(char *, char *, uint64_t))(v85 + 32))(v82, v83, v84);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v85 + 56))(v82, 0, 1, v84);
LABEL_27:
  v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7D30);
  *(_QWORD *)&v82[*(int *)(v90 + 28)] = *(_QWORD *)&v83[*(int *)(v90 + 28)];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SummaryView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE1D7B0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBFA8);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF90);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == (_DWORD)a2)
    {
      v8 = v13;
      v15 = a3[8];
    }
    else
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7D30);
      v14 = *(_QWORD *)(v8 - 8);
      v15 = a3[9];
    }
    v10 = a1 + v15;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + a3[6]);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for SummaryView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE1D894(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBFA8);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + a4[6]) = (a2 - 1);
      return result;
    }
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF90);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = a4[8];
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7D30);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[9];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_20DE1D968()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_20DE1DA58();
  if (v0 <= 0x3F)
  {
    sub_20DE1ECB4(319, qword_2549EC020, &qword_2549EBF58, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDF42C0]);
    if (v1 <= 0x3F)
    {
      sub_20DE1ECB4(319, &qword_2549E7E20, &qword_2549E7C40, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDF42C0]);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_20DE1DA58()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2549EC018)
  {
    sub_20DE203BC();
    v0 = sub_20DE203EC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2549EC018);
  }
}

char *initializeBufferWithCopyOfBuffer for SummaryView.Model(char *a1, char *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  int *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  unsigned int (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v23 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v37 = sub_20DE1FD68();
    v7 = *(_QWORD *)(v37 - 8);
    v39 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v39(a1, a2, v37);
    v8 = (int *)type metadata accessor for OverviewChart.Model(0);
    *(_QWORD *)&a1[v8[5]] = *(_QWORD *)&a2[v8[5]];
    v9 = v8[6];
    v10 = &a1[v9];
    v11 = &a2[v9];
    v12 = sub_20DE1FE94();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    *(_QWORD *)&a1[v8[7]] = *(_QWORD *)&a2[v8[7]];
    a1[v8[8]] = a2[v8[8]];
    v38 = a3;
    v14 = *(int *)(a3 + 20);
    v15 = &a1[v14];
    v16 = &a2[v14];
    swift_retain();
    v13(v15, v16, v12);
    v17 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
    *(_QWORD *)&v15[v17[9]] = *(_QWORD *)&v16[v17[9]];
    v15[v17[10]] = v16[v17[10]];
    v18 = v17[11];
    v19 = &v15[v18];
    v20 = &v16[v18];
    v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
    swift_bridgeObjectRetain();
    if (v21(v20, 1, v37))
    {
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      v39(v19, v20, v37);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v19, 0, 1, v37);
    }
    v24 = type metadata accessor for UsageHeaderView.Model(0);
    v13(&v15[*(int *)(v24 + 20)], &v16[*(int *)(v24 + 20)], v12);
    v25 = *(int *)(v38 + 24);
    v26 = &a1[v25];
    v27 = &a2[v25];
    *(_QWORD *)&a1[v25] = *(_QWORD *)&a2[v25];
    v28 = type metadata accessor for ActivityNavigationState(0);
    v29 = *(int *)(v28 + 20);
    v30 = &v26[v29];
    v31 = &v27[v29];
    v39(&v26[v29], &v27[v29], v37);
    v32 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
    v33 = &v30[v32];
    v34 = &v31[v32];
    v35 = sub_20DE1FC48();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 16))(v33, v34, v35);
    v13(&v26[*(int *)(v28 + 24)], &v27[*(int *)(v28 + 24)], v12);
    v13(&a1[*(int *)(v38 + 28)], &a2[*(int *)(v38 + 28)], v12);
  }
  return a1;
}

uint64_t destroy for SummaryView.Model(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
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
  void (*v20)(uint64_t, uint64_t);

  v4 = sub_20DE1FD68();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  v7 = type metadata accessor for OverviewChart.Model(0);
  swift_bridgeObjectRelease();
  v8 = a1 + *(int *)(v7 + 24);
  v9 = sub_20DE1FE94();
  v20 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8);
  v20(v8, v9);
  swift_release();
  v10 = a1 + a2[5];
  v20(v10, v9);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  swift_bridgeObjectRelease();
  v12 = v10 + *(int *)(v11 + 44);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v12, 1, v4))
    v6(v12, v4);
  v13 = type metadata accessor for UsageHeaderView.Model(0);
  v20(v10 + *(int *)(v13 + 20), v9);
  v14 = a1 + a2[6];
  v15 = type metadata accessor for ActivityNavigationState(0);
  v16 = v14 + *(int *)(v15 + 20);
  v6(v16, v4);
  v17 = v16 + *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  v18 = sub_20DE1FC48();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v17, v18);
  v20(v14 + *(int *)(v15 + 24), v9);
  return ((uint64_t (*)(uint64_t, uint64_t))v20)(a1 + a2[7], v9);
}

char *initializeWithCopy for SummaryView.Model(char *a1, char *a2, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  int *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  unsigned int (*v20)(const void *, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  void (*v35)(void *, const void *, uint64_t);
  void (*v36)(char *, char *, uint64_t);

  v5 = sub_20DE1FD68();
  v6 = *(_QWORD *)(v5 - 8);
  v35 = *(void (**)(void *, const void *, uint64_t))(v6 + 16);
  v35(a1, a2, v5);
  v7 = (int *)type metadata accessor for OverviewChart.Model(0);
  *(_QWORD *)&a1[v7[5]] = *(_QWORD *)&a2[v7[5]];
  v8 = v7[6];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_20DE1FE94();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  *(_QWORD *)&a1[v7[7]] = *(_QWORD *)&a2[v7[7]];
  a1[v7[8]] = a2[v7[8]];
  v13 = a3[5];
  v14 = &a1[v13];
  v15 = &a2[v13];
  swift_retain();
  v36 = v12;
  v12(v14, v15, v11);
  v16 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  *(_QWORD *)&v14[v16[9]] = *(_QWORD *)&v15[v16[9]];
  v14[v16[10]] = v15[v16[10]];
  v17 = v16[11];
  v18 = &v14[v17];
  v19 = &v15[v17];
  v20 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48);
  swift_bridgeObjectRetain();
  if (v20(v19, 1, v5))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    v35(v18, v19, v5);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v18, 0, 1, v5);
  }
  v22 = type metadata accessor for UsageHeaderView.Model(0);
  v36(&v14[*(int *)(v22 + 20)], &v15[*(int *)(v22 + 20)], v11);
  v23 = a3[6];
  v24 = &a1[v23];
  v25 = &a2[v23];
  *(_QWORD *)&a1[v23] = *(_QWORD *)&a2[v23];
  v26 = type metadata accessor for ActivityNavigationState(0);
  v27 = *(int *)(v26 + 20);
  v28 = &v24[v27];
  v29 = &v25[v27];
  v35(&v24[v27], &v25[v27], v5);
  v30 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  v31 = &v28[v30];
  v32 = &v29[v30];
  v33 = sub_20DE1FC48();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(v31, v32, v33);
  v36(&v24[*(int *)(v26 + 24)], &v25[*(int *)(v26 + 24)], v11);
  v36(&a1[a3[7]], &a2[a3[7]], v11);
  return a1;
}

char *assignWithCopy for SummaryView.Model(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t (*v22)(const void *, uint64_t, uint64_t);
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v38;
  void (*v39)(char *, char *, uint64_t);
  uint64_t v40;
  void (*v41)(void *, const void *, uint64_t);

  v6 = sub_20DE1FD68();
  v7 = *(_QWORD *)(v6 - 8);
  v41 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v41(a1, a2, v6);
  v8 = (int *)type metadata accessor for OverviewChart.Model(0);
  *(_QWORD *)&a1[v8[5]] = *(_QWORD *)&a2[v8[5]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = v8[6];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_20DE1FE94();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24);
  v13(v10, v11, v12);
  *(_QWORD *)&a1[v8[7]] = *(_QWORD *)&a2[v8[7]];
  swift_retain();
  swift_release();
  a1[v8[8]] = a2[v8[8]];
  v39 = v13;
  v40 = a3;
  v14 = *(int *)(a3 + 20);
  v15 = &a1[v14];
  v38 = a2;
  v16 = &a2[v14];
  v17 = v7;
  v13(&a1[v14], v16, v12);
  v18 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  *(_QWORD *)&v15[v18[9]] = *(_QWORD *)&v16[v18[9]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15[v18[10]] = v16[v18[10]];
  v19 = v18[11];
  v20 = &v15[v19];
  v21 = &v16[v19];
  v22 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  LODWORD(v7) = v22(&v15[v19], 1, v6);
  v23 = v22(v21, 1, v6);
  if (!(_DWORD)v7)
  {
    if (!v23)
    {
      v41(v20, v21, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v6);
    goto LABEL_6;
  }
  if (v23)
  {
LABEL_6:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v20, v21, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v20, 0, 1, v6);
LABEL_7:
  v25 = type metadata accessor for UsageHeaderView.Model(0);
  v39(&v15[*(int *)(v25 + 20)], &v16[*(int *)(v25 + 20)], v12);
  v26 = *(int *)(v40 + 24);
  v27 = &a1[v26];
  v28 = &v38[v26];
  *(_QWORD *)&a1[v26] = *(_QWORD *)&v38[v26];
  v29 = type metadata accessor for ActivityNavigationState(0);
  v30 = *(int *)(v29 + 20);
  v31 = &v27[v30];
  v32 = &v28[v30];
  v41(&v27[v30], &v28[v30], v6);
  v33 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  v34 = &v31[v33];
  v35 = &v32[v33];
  v36 = sub_20DE1FC48();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 24))(v34, v35, v36);
  v39(&v27[*(int *)(v29 + 24)], &v28[*(int *)(v29 + 24)], v12);
  v39(&a1[*(int *)(v40 + 28)], &v38[*(int *)(v40 + 28)], v12);
  return a1;
}

char *initializeWithTake for SummaryView.Model(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  int *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v35;
  void (*v36)(void *, const void *, uint64_t);

  v6 = sub_20DE1FD68();
  v7 = *(_QWORD *)(v6 - 8);
  v36 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v36(a1, a2, v6);
  v8 = (int *)type metadata accessor for OverviewChart.Model(0);
  *(_QWORD *)&a1[v8[5]] = *(_QWORD *)&a2[v8[5]];
  v9 = v8[6];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_20DE1FE94();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32);
  v13(v10, v11, v12);
  *(_QWORD *)&a1[v8[7]] = *(_QWORD *)&a2[v8[7]];
  a1[v8[8]] = a2[v8[8]];
  v35 = a3;
  v14 = *(int *)(a3 + 20);
  v15 = &a1[v14];
  v16 = &a2[v14];
  v13(&a1[v14], &a2[v14], v12);
  v17 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  *(_QWORD *)&v15[v17[9]] = *(_QWORD *)&v16[v17[9]];
  v15[v17[10]] = v16[v17[10]];
  v18 = v17[11];
  v19 = &v15[v18];
  v20 = &v16[v18];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&v16[v18], 1, v6))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    v36(v19, v20, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v19, 0, 1, v6);
  }
  v22 = type metadata accessor for UsageHeaderView.Model(0);
  v13(&v15[*(int *)(v22 + 20)], &v16[*(int *)(v22 + 20)], v12);
  v23 = *(int *)(v35 + 24);
  v24 = &a1[v23];
  v25 = &a2[v23];
  *(_QWORD *)&a1[v23] = *(_QWORD *)&a2[v23];
  v26 = type metadata accessor for ActivityNavigationState(0);
  v27 = *(int *)(v26 + 20);
  v28 = &v24[v27];
  v29 = &v25[v27];
  v36(&v24[v27], &v25[v27], v6);
  v30 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  v31 = &v28[v30];
  v32 = &v29[v30];
  v33 = sub_20DE1FC48();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 32))(v31, v32, v33);
  v13(&v24[*(int *)(v26 + 24)], &v25[*(int *)(v26 + 24)], v12);
  v13(&a1[*(int *)(v35 + 28)], &a2[*(int *)(v35 + 28)], v12);
  return a1;
}

char *assignWithTake for SummaryView.Model(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t (*v22)(const void *, uint64_t, uint64_t);
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v38;
  void (*v39)(char *, char *, uint64_t);
  uint64_t v40;
  void (*v41)(void *, const void *, uint64_t);

  v6 = sub_20DE1FD68();
  v7 = *(_QWORD *)(v6 - 8);
  v41 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v41(a1, a2, v6);
  v8 = (int *)type metadata accessor for OverviewChart.Model(0);
  *(_QWORD *)&a1[v8[5]] = *(_QWORD *)&a2[v8[5]];
  swift_bridgeObjectRelease();
  v9 = v8[6];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_20DE1FE94();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40);
  v13(v10, v11, v12);
  *(_QWORD *)&a1[v8[7]] = *(_QWORD *)&a2[v8[7]];
  swift_release();
  a1[v8[8]] = a2[v8[8]];
  v39 = v13;
  v40 = a3;
  v14 = *(int *)(a3 + 20);
  v15 = &a1[v14];
  v38 = a2;
  v16 = &a2[v14];
  v17 = v7;
  v13(&a1[v14], v16, v12);
  v18 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549E8360);
  *(_QWORD *)&v15[v18[9]] = *(_QWORD *)&v16[v18[9]];
  swift_bridgeObjectRelease();
  v15[v18[10]] = v16[v18[10]];
  v19 = v18[11];
  v20 = &v15[v19];
  v21 = &v16[v19];
  v22 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  LODWORD(v7) = v22(&v15[v19], 1, v6);
  v23 = v22(v21, 1, v6);
  if (!(_DWORD)v7)
  {
    if (!v23)
    {
      v41(v20, v21, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v6);
    goto LABEL_6;
  }
  if (v23)
  {
LABEL_6:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v20, v21, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v20, 0, 1, v6);
LABEL_7:
  v25 = type metadata accessor for UsageHeaderView.Model(0);
  v39(&v15[*(int *)(v25 + 20)], &v16[*(int *)(v25 + 20)], v12);
  v26 = *(int *)(v40 + 24);
  v27 = &a1[v26];
  v28 = &v38[v26];
  *(_QWORD *)&a1[v26] = *(_QWORD *)&v38[v26];
  v29 = type metadata accessor for ActivityNavigationState(0);
  v30 = *(int *)(v29 + 20);
  v31 = &v27[v30];
  v32 = &v28[v30];
  v41(&v27[v30], &v28[v30], v6);
  v33 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  v34 = &v31[v33];
  v35 = &v32[v33];
  v36 = sub_20DE1FC48();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 40))(v34, v35, v36);
  v39(&v27[*(int *)(v29 + 24)], &v28[*(int *)(v29 + 24)], v12);
  v39(&a1[*(int *)(v40 + 28)], &v38[*(int *)(v40 + 28)], v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for SummaryView.Model()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE1E970(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = type metadata accessor for OverviewChart.Model(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v11 = type metadata accessor for UsageHeaderView.Model(0);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = a3[5];
    }
    else
    {
      v14 = type metadata accessor for ActivityNavigationState(0);
      v12 = *(_QWORD *)(v14 - 8);
      if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
      {
        v8 = v14;
        v13 = a3[6];
      }
      else
      {
        v8 = sub_20DE1FE94();
        v12 = *(_QWORD *)(v8 - 8);
        v13 = a3[7];
      }
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for SummaryView.Model()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE1EA38(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v8 = type metadata accessor for OverviewChart.Model(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = type metadata accessor for UsageHeaderView.Model(0);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = a4[5];
    }
    else
    {
      v16 = type metadata accessor for ActivityNavigationState(0);
      v14 = *(_QWORD *)(v16 - 8);
      if (*(_DWORD *)(v14 + 84) == a3)
      {
        v10 = v16;
        v15 = a4[6];
      }
      else
      {
        v10 = sub_20DE1FE94();
        v14 = *(_QWORD *)(v10 - 8);
        v15 = a4[7];
      }
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_20DE1EAFC()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  result = type metadata accessor for OverviewChart.Model(319);
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for UsageHeaderView.Model(319);
    if (v2 <= 0x3F)
    {
      result = type metadata accessor for ActivityNavigationState(319);
      if (v3 <= 0x3F)
      {
        result = sub_20DE1FE94();
        if (v4 <= 0x3F)
        {
          swift_initStructMetadata();
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t sub_20DE1EBB8()
{
  return type metadata accessor for SummaryView.Bridge(0);
}

uint64_t type metadata accessor for SummaryView.Bridge(uint64_t a1)
{
  return sub_20DD87B48(a1, (uint64_t *)&unk_2549EC120);
}

void sub_20DE1EBD4()
{
  unint64_t v0;

  sub_20DE1ECB4(319, qword_2549EC130, &qword_2549EBFA0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDB9EF0]);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for SummaryView.Bridge()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SummaryView.Bridge.userAltDSID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t dispatch thunk of SummaryView.Bridge.userAltDSID.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of SummaryView.Bridge.userAltDSID.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of SummaryView.Bridge.$userAltDSID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of SummaryView.Bridge.$userAltDSID.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of SummaryView.Bridge.$userAltDSID.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of SummaryView.Bridge.__allocating_init(userAltDSID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

void sub_20DE1ECB4(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

unint64_t sub_20DE1ED10()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549EC1E0;
  if (!qword_2549EC1E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549EC1E8);
    v2[0] = sub_20DD8561C(&qword_2549EBF98, &qword_2549EBF78, MEMORY[0x24BDEDA68]);
    v2[1] = sub_20DD8512C((unint64_t *)&qword_2549E8070, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x212BB5FE0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549EC1E0);
  }
  return result;
}

uint64_t sub_20DE1EDAC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  os_log_type_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  uint64_t v20;

  v2 = v1;
  v4 = sub_20DE205F0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EBF60);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20DD8516C(v2, (uint64_t)v10, &qword_2549EBF60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_20DE203BC();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_20DE20DD0();
    v14 = sub_20DE20758();
    v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v19[1] = a1;
      v18 = v17;
      v20 = v17;
      *(_DWORD *)v16 = 136315138;
      v19[2] = sub_20DDE0F94(0x686353726F6C6F43, 0xEB00000000656D65, &v20);
      sub_20DE20E24();
      _os_log_impl(&dword_20DD80000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BB6064](v18, -1, -1);
      MEMORY[0x212BB6064](v16, -1, -1);
    }

    sub_20DE205E4();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_20DE1EFEC()
{
  return sub_20DE1F008(&qword_2549EC228, &qword_2549EC210, (uint64_t (*)(void))sub_20DE1F074);
}

uint64_t sub_20DE1F008(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x212BB5FE0](MEMORY[0x24BDED308], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_20DE1F074()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549EC230;
  if (!qword_2549EC230)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549EC208);
    v2[0] = sub_20DE1F0F8();
    v2[1] = sub_20DD8561C(&qword_2549EC248, &qword_2549EC250, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x212BB5FE0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549EC230);
  }
  return result;
}

unint64_t sub_20DE1F0F8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549EC238;
  if (!qword_2549EC238)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549EC200);
    v2[0] = sub_20DD8561C(&qword_2549EC240, &qword_2549EC1F8, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x212BB5FE0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549EC238);
  }
  return result;
}

uint64_t LastUpdatedView.init(date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_20DE1F184(a1, a2);
}

uint64_t sub_20DE1F184(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t LastUpdatedView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_20DE1F220();
  sub_20DD8BA88();
  result = sub_20DE20860();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_20DE1F220()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[2];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549EC300);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_20DE1FD68();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20DD95E44(v1, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_20DD851D0((uint64_t)v7, &qword_2549E7C40);
    v12 = objc_msgSend((id)objc_opt_self(), sel_bundle);
    v13 = sub_20DE1FC84();

  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
    objc_msgSend(v14, sel_setTimeStyle_, 1);
    objc_msgSend(v14, sel_setDateStyle_, 2);
    objc_msgSend(v14, sel_setDoesRelativeDateFormatting_, 1);
    objc_msgSend(v14, sel_setFormattingContext_, 5);
    v15 = objc_msgSend((id)objc_opt_self(), sel_bundle);
    v26[1] = sub_20DE1FC84();

    v16 = objc_msgSend((id)objc_opt_self(), sel_currentLocale);
    sub_20DE1FD74();

    v17 = sub_20DE1FD8C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v4, 0, 1, v17);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549E96C8);
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_20DE217B0;
    v19 = (uint64_t)v4;
    v20 = (void *)sub_20DE1FD14();
    v21 = objc_msgSend(v14, sel_stringFromDate_, v20);

    v22 = sub_20DE20CB0();
    v24 = v23;

    *(_QWORD *)(v18 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v18 + 64) = sub_20DDD3F0C();
    *(_QWORD *)(v18 + 32) = v22;
    *(_QWORD *)(v18 + 40) = v24;
    v13 = sub_20DE20CBC();
    swift_bridgeObjectRelease();

    sub_20DD851D0(v19, &qword_2549EC300);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return v13;
}

uint64_t sub_20DE1F5F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20DE1F608@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_20DE1F220();
  sub_20DD8BA88();
  result = sub_20DE20860();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for LastUpdatedView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = sub_20DE1FD68();
    v7 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      memcpy(a1, a2, *(_QWORD *)(v4 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
  }
  return a1;
}

void *initializeWithCopy for LastUpdatedView(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_20DE1FD68();
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *assignWithCopy for LastUpdatedView(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;

  v4 = sub_20DE1FD68();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

void *initializeWithTake for LastUpdatedView(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_20DE1FD68();
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *assignWithTake for LastUpdatedView(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;

  v4 = sub_20DE1FD68();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 32))(a1, a2, v4);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for LastUpdatedView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE1FA64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for LastUpdatedView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20DE1FAB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E7C40);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for LastUpdatedView()
{
  uint64_t result;

  result = qword_2549EC2C8;
  if (!qword_2549EC2C8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_20DE1FB30()
{
  unint64_t v0;

  sub_20DDD3B0C();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_20DE1FB98()
{
  return MEMORY[0x24BDF1F80];
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_20DE1FBC4()
{
  return MEMORY[0x24BDCB148]();
}

uint64_t sub_20DE1FBD0()
{
  return MEMORY[0x24BDC6FB0]();
}

uint64_t sub_20DE1FBDC()
{
  return MEMORY[0x24BDC6FB8]();
}

uint64_t sub_20DE1FBE8()
{
  return MEMORY[0x24BDCB810]();
}

uint64_t sub_20DE1FBF4()
{
  return MEMORY[0x24BDCB820]();
}

uint64_t sub_20DE1FC00()
{
  return MEMORY[0x24BDCB830]();
}

uint64_t sub_20DE1FC0C()
{
  return MEMORY[0x24BDCB838]();
}

uint64_t sub_20DE1FC18()
{
  return MEMORY[0x24BDCB840]();
}

uint64_t _s16ScreenTimeUICore11DetailChartV4HourV2id10Foundation4DateVvg_0()
{
  return MEMORY[0x24BDCB848]();
}

uint64_t sub_20DE1FC30()
{
  return MEMORY[0x24BDCB858]();
}

uint64_t sub_20DE1FC3C()
{
  return MEMORY[0x24BDCB868]();
}

uint64_t sub_20DE1FC48()
{
  return MEMORY[0x24BDCB878]();
}

uint64_t sub_20DE1FC54()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t sub_20DE1FC60()
{
  return MEMORY[0x24BDCBD08]();
}

uint64_t sub_20DE1FC6C()
{
  return MEMORY[0x24BDCBDA8]();
}

uint64_t sub_20DE1FC78()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_20DE1FC84()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_20DE1FC90()
{
  return MEMORY[0x24BDCE028]();
}

uint64_t sub_20DE1FC9C()
{
  return MEMORY[0x24BDCE098]();
}

uint64_t sub_20DE1FCA8()
{
  return MEMORY[0x24BDCE0B0]();
}

uint64_t sub_20DE1FCB4()
{
  return MEMORY[0x24BDCE0D0]();
}

uint64_t sub_20DE1FCC0()
{
  return MEMORY[0x24BDCE0E0]();
}

uint64_t sub_20DE1FCCC()
{
  return MEMORY[0x24BDCE1C8]();
}

uint64_t sub_20DE1FCD8()
{
  return MEMORY[0x24BDCE1E0]();
}

uint64_t sub_20DE1FCE4()
{
  return MEMORY[0x24BDCE250]();
}

uint64_t sub_20DE1FCF0()
{
  return MEMORY[0x24BDCE2A0]();
}

uint64_t sub_20DE1FCFC()
{
  return MEMORY[0x24BDCE320]();
}

uint64_t sub_20DE1FD08()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_20DE1FD14()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_20DE1FD20()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_20DE1FD2C()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_20DE1FD38()
{
  return MEMORY[0x24BDCE600]();
}

uint64_t sub_20DE1FD44()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_20DE1FD50()
{
  return MEMORY[0x24BDCE860]();
}

uint64_t sub_20DE1FD5C()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_20DE1FD68()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_20DE1FD74()
{
  return MEMORY[0x24BDCECE0]();
}

uint64_t sub_20DE1FD80()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_20DE1FD8C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_20DE1FD98()
{
  return MEMORY[0x24BDCEFB8]();
}

uint64_t sub_20DE1FDA4()
{
  return MEMORY[0x24BDCEFC8]();
}

uint64_t sub_20DE1FDB0()
{
  return MEMORY[0x24BDCEFD8]();
}

uint64_t sub_20DE1FDBC()
{
  return MEMORY[0x24BDCEFE8]();
}

uint64_t sub_20DE1FDC8()
{
  return MEMORY[0x24BDCF008]();
}

uint64_t sub_20DE1FDD4()
{
  return MEMORY[0x24BDCF028]();
}

uint64_t sub_20DE1FDE0()
{
  return MEMORY[0x24BDCF040]();
}

uint64_t sub_20DE1FDEC()
{
  return MEMORY[0x24BDCF058]();
}

uint64_t sub_20DE1FDF8()
{
  return MEMORY[0x24BDCF060]();
}

uint64_t sub_20DE1FE04()
{
  return MEMORY[0x24BDCF078]();
}

uint64_t sub_20DE1FE10()
{
  return MEMORY[0x24BDCF0A0]();
}

uint64_t sub_20DE1FE1C()
{
  return MEMORY[0x24BDCF0B8]();
}

uint64_t sub_20DE1FE28()
{
  return MEMORY[0x24BDCF0C0]();
}

uint64_t sub_20DE1FE34()
{
  return MEMORY[0x24BDCF118]();
}

uint64_t sub_20DE1FE40()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_20DE1FE4C()
{
  return MEMORY[0x24BDCF180]();
}

uint64_t sub_20DE1FE58()
{
  return MEMORY[0x24BDCF190]();
}

uint64_t sub_20DE1FE64()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_20DE1FE70()
{
  return MEMORY[0x24BDCF1C0]();
}

uint64_t sub_20DE1FE7C()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_20DE1FE88()
{
  return MEMORY[0x24BDCF2D0]();
}

uint64_t sub_20DE1FE94()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_20DE1FEA0()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_20DE1FEAC()
{
  return MEMORY[0x24BDCF760]();
}

uint64_t sub_20DE1FEB8()
{
  return MEMORY[0x24BDC6FC0]();
}

uint64_t sub_20DE1FEC4()
{
  return MEMORY[0x24BDC6FC8]();
}

uint64_t sub_20DE1FED0()
{
  return MEMORY[0x24BDC6FD0]();
}

uint64_t sub_20DE1FEDC()
{
  return MEMORY[0x24BDC6FD8]();
}

uint64_t sub_20DE1FEE8()
{
  return MEMORY[0x24BDC6FE0]();
}

uint64_t sub_20DE1FEF4()
{
  return MEMORY[0x24BDC6FE8]();
}

uint64_t sub_20DE1FF00()
{
  return MEMORY[0x24BDC6FF0]();
}

uint64_t sub_20DE1FF0C()
{
  return MEMORY[0x24BDC6FF8]();
}

uint64_t sub_20DE1FF18()
{
  return MEMORY[0x24BDC7000]();
}

uint64_t sub_20DE1FF24()
{
  return MEMORY[0x24BDC7008]();
}

uint64_t sub_20DE1FF30()
{
  return MEMORY[0x24BDC7010]();
}

uint64_t sub_20DE1FF3C()
{
  return MEMORY[0x24BDC7018]();
}

uint64_t sub_20DE1FF48()
{
  return MEMORY[0x24BDC7020]();
}

uint64_t sub_20DE1FF54()
{
  return MEMORY[0x24BDC7028]();
}

uint64_t sub_20DE1FF60()
{
  return MEMORY[0x24BDC7030]();
}

uint64_t sub_20DE1FF6C()
{
  return MEMORY[0x24BDC7038]();
}

uint64_t sub_20DE1FF78()
{
  return MEMORY[0x24BDC7068]();
}

uint64_t sub_20DE1FF84()
{
  return MEMORY[0x24BDC7070]();
}

uint64_t sub_20DE1FF90()
{
  return MEMORY[0x24BDC7078]();
}

uint64_t sub_20DE1FF9C()
{
  return MEMORY[0x24BDC7080]();
}

uint64_t sub_20DE1FFA8()
{
  return MEMORY[0x24BDC7088]();
}

uint64_t sub_20DE1FFB4()
{
  return MEMORY[0x24BDC7090]();
}

uint64_t sub_20DE1FFC0()
{
  return MEMORY[0x24BDC70A8]();
}

uint64_t sub_20DE1FFCC()
{
  return MEMORY[0x24BDC70C8]();
}

uint64_t sub_20DE1FFD8()
{
  return MEMORY[0x24BDC70D8]();
}

uint64_t sub_20DE1FFE4()
{
  return MEMORY[0x24BDC70E0]();
}

uint64_t sub_20DE1FFF0()
{
  return MEMORY[0x24BDC70F8]();
}

uint64_t sub_20DE1FFFC()
{
  return MEMORY[0x24BDC7110]();
}

uint64_t sub_20DE20008()
{
  return MEMORY[0x24BDC7118]();
}

uint64_t sub_20DE20014()
{
  return MEMORY[0x24BDC7128]();
}

uint64_t sub_20DE20020()
{
  return MEMORY[0x24BDC7140]();
}

uint64_t sub_20DE2002C()
{
  return MEMORY[0x24BDC7148]();
}

uint64_t sub_20DE20038()
{
  return MEMORY[0x24BDC7158]();
}

uint64_t _s16ScreenTimeUICore13ModelProviderVACycfC_0()
{
  return MEMORY[0x24BDC7160]();
}

uint64_t sub_20DE20050()
{
  return MEMORY[0x24BDC7168]();
}

uint64_t sub_20DE2005C()
{
  return MEMORY[0x24BDC71E8]();
}

uint64_t sub_20DE20068()
{
  return MEMORY[0x24BDC72D8]();
}

uint64_t sub_20DE20074()
{
  return MEMORY[0x24BDC7358]();
}

uint64_t sub_20DE20080()
{
  return MEMORY[0x24BDC7370]();
}

uint64_t sub_20DE2008C()
{
  return MEMORY[0x24BDC73B8]();
}

uint64_t sub_20DE20098()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_20DE200A4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_20DE200B0()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_20DE200BC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_20DE200C8()
{
  return MEMORY[0x24BDB7AA8]();
}

uint64_t sub_20DE200D4()
{
  return MEMORY[0x24BDB7AE0]();
}

uint64_t sub_20DE200E0()
{
  return MEMORY[0x24BDB7B28]();
}

uint64_t sub_20DE200EC()
{
  return MEMORY[0x24BDB7B38]();
}

uint64_t sub_20DE200F8()
{
  return MEMORY[0x24BDB7BB0]();
}

uint64_t sub_20DE20104()
{
  return MEMORY[0x24BDB7BD0]();
}

uint64_t sub_20DE20110()
{
  return MEMORY[0x24BDB7C20]();
}

uint64_t sub_20DE2011C()
{
  return MEMORY[0x24BDB7C50]();
}

uint64_t sub_20DE20128()
{
  return MEMORY[0x24BDB7C80]();
}

uint64_t sub_20DE20134()
{
  return MEMORY[0x24BDB7CB0]();
}

uint64_t sub_20DE20140()
{
  return MEMORY[0x24BDB7D60]();
}

uint64_t sub_20DE2014C()
{
  return MEMORY[0x24BDB7DD8]();
}

uint64_t sub_20DE20158()
{
  return MEMORY[0x24BDB7DE0]();
}

uint64_t sub_20DE20164()
{
  return MEMORY[0x24BDB7DF0]();
}

uint64_t sub_20DE20170()
{
  return MEMORY[0x24BDB7E08]();
}

uint64_t sub_20DE2017C()
{
  return MEMORY[0x24BDB7E10]();
}

uint64_t sub_20DE20188()
{
  return MEMORY[0x24BDB7E18]();
}

uint64_t sub_20DE20194()
{
  return MEMORY[0x24BDB7E60]();
}

uint64_t sub_20DE201A0()
{
  return MEMORY[0x24BDB7E78]();
}

uint64_t sub_20DE201AC()
{
  return MEMORY[0x24BDB7F00]();
}

uint64_t sub_20DE201B8()
{
  return MEMORY[0x24BDB7F08]();
}

uint64_t sub_20DE201C4()
{
  return MEMORY[0x24BDB7F48]();
}

uint64_t sub_20DE201D0()
{
  return MEMORY[0x24BDB7F60]();
}

uint64_t sub_20DE201DC()
{
  return MEMORY[0x24BDB7F70]();
}

uint64_t sub_20DE201E8()
{
  return MEMORY[0x24BDB8058]();
}

uint64_t sub_20DE201F4()
{
  return MEMORY[0x24BDB8060]();
}

uint64_t sub_20DE20200()
{
  return MEMORY[0x24BDB80B0]();
}

uint64_t sub_20DE2020C()
{
  return MEMORY[0x24BDB80B8]();
}

uint64_t sub_20DE20218()
{
  return MEMORY[0x24BDB80E0]();
}

uint64_t sub_20DE20224()
{
  return MEMORY[0x24BDB80F0]();
}

uint64_t sub_20DE20230()
{
  return MEMORY[0x24BDB80F8]();
}

uint64_t sub_20DE2023C()
{
  return MEMORY[0x24BDB8120]();
}

uint64_t sub_20DE20248()
{
  return MEMORY[0x24BDB8140]();
}

uint64_t sub_20DE20254()
{
  return MEMORY[0x24BDB8150]();
}

uint64_t sub_20DE20260()
{
  return MEMORY[0x24BDB8170]();
}

uint64_t sub_20DE2026C()
{
  return MEMORY[0x24BDB81B0]();
}

uint64_t sub_20DE20278()
{
  return MEMORY[0x24BDB81C0]();
}

uint64_t sub_20DE20284()
{
  return MEMORY[0x24BDB81E8]();
}

uint64_t sub_20DE20290()
{
  return MEMORY[0x24BDB81F0]();
}

uint64_t sub_20DE2029C()
{
  return MEMORY[0x24BDB81F8]();
}

uint64_t sub_20DE202A8()
{
  return MEMORY[0x24BDB8200]();
}

uint64_t sub_20DE202B4()
{
  return MEMORY[0x24BDB8210]();
}

uint64_t sub_20DE202C0()
{
  return MEMORY[0x24BDB8270]();
}

uint64_t sub_20DE202CC()
{
  return MEMORY[0x24BDB8288]();
}

uint64_t sub_20DE202D8()
{
  return MEMORY[0x24BDB82C8]();
}

uint64_t sub_20DE202E4()
{
  return MEMORY[0x24BDB82D0]();
}

uint64_t sub_20DE202F0()
{
  return MEMORY[0x24BDB82D8]();
}

uint64_t sub_20DE202FC()
{
  return MEMORY[0x24BDB82F8]();
}

uint64_t sub_20DE20308()
{
  return MEMORY[0x24BDB8338]();
}

uint64_t sub_20DE20314()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_20DE20320()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_20DE2032C()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_20DE20338()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_20DE20344()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_20DE20350()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_20DE2035C()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_20DE20368()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_20DE20374()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_20DE20380()
{
  return MEMORY[0x24BDBA0C0]();
}

uint64_t sub_20DE2038C()
{
  return MEMORY[0x24BDBA0E8]();
}

uint64_t sub_20DE20398()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_20DE203A4()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_20DE203B0()
{
  return MEMORY[0x24BDEB3E0]();
}

uint64_t sub_20DE203BC()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_20DE203C8()
{
  return MEMORY[0x24BDEB4C0]();
}

uint64_t sub_20DE203D4()
{
  return MEMORY[0x24BDEB4F8]();
}

uint64_t sub_20DE203E0()
{
  return MEMORY[0x24BDEB540]();
}

uint64_t sub_20DE203EC()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_20DE203F8()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_20DE20404()
{
  return MEMORY[0x24BDEB798]();
}

uint64_t sub_20DE20410()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_20DE2041C()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_20DE20428()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_20DE20434()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_20DE20440()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_20DE2044C()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_20DE20458()
{
  return MEMORY[0x24BDEC148]();
}

uint64_t sub_20DE20464()
{
  return MEMORY[0x24BDEC5A0]();
}

uint64_t sub_20DE20470()
{
  return MEMORY[0x24BDEC9B0]();
}

uint64_t sub_20DE2047C()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_20DE20488()
{
  return MEMORY[0x24BDED3B0]();
}

uint64_t sub_20DE20494()
{
  return MEMORY[0x24BDED808]();
}

uint64_t sub_20DE204A0()
{
  return MEMORY[0x24BDED810]();
}

uint64_t sub_20DE204AC()
{
  return MEMORY[0x24BDED818]();
}

uint64_t sub_20DE204B8()
{
  return MEMORY[0x24BDED828]();
}

uint64_t sub_20DE204C4()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_20DE204D0()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_20DE204DC()
{
  return MEMORY[0x24BDEDD50]();
}

uint64_t sub_20DE204E8()
{
  return MEMORY[0x24BDEDDD8]();
}

uint64_t sub_20DE204F4()
{
  return MEMORY[0x24BDEDE90]();
}

uint64_t sub_20DE20500()
{
  return MEMORY[0x24BDEDE98]();
}

uint64_t sub_20DE2050C()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_20DE20518()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_20DE20524()
{
  return MEMORY[0x24BDEDF90]();
}

uint64_t sub_20DE20530()
{
  return MEMORY[0x24BDEDF98]();
}

uint64_t sub_20DE2053C()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_20DE20548()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_20DE20554()
{
  return MEMORY[0x24BDEE0A0]();
}

uint64_t sub_20DE20560()
{
  return MEMORY[0x24BDEE0A8]();
}

uint64_t sub_20DE2056C()
{
  return MEMORY[0x24BDEE100]();
}

uint64_t sub_20DE20578()
{
  return MEMORY[0x24BDEE108]();
}

uint64_t sub_20DE20584()
{
  return MEMORY[0x24BDEE190]();
}

uint64_t sub_20DE20590()
{
  return MEMORY[0x24BDEE198]();
}

uint64_t sub_20DE2059C()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_20DE205A8()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_20DE205B4()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_20DE205C0()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_20DE205CC()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_20DE205D8()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_20DE205E4()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_20DE205F0()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_20DE205FC()
{
  return MEMORY[0x24BDEE700]();
}

uint64_t sub_20DE20608()
{
  return MEMORY[0x24BDEE718]();
}

uint64_t sub_20DE20614()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_20DE20620()
{
  return MEMORY[0x24BDEE9E8]();
}

uint64_t sub_20DE2062C()
{
  return MEMORY[0x24BDEEA18]();
}

uint64_t sub_20DE20638()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_20DE20644()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_20DE20650()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_20DE2065C()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_20DE20668()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_20DE20674()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_20DE20680()
{
  return MEMORY[0x24BDEEEA0]();
}

uint64_t sub_20DE2068C()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_20DE20698()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_20DE206A4()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_20DE206B0()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_20DE206BC()
{
  return MEMORY[0x24BDEF540]();
}

uint64_t sub_20DE206C8()
{
  return MEMORY[0x24BDEF6A8]();
}

uint64_t sub_20DE206D4()
{
  return MEMORY[0x24BDEF6B0]();
}

uint64_t sub_20DE206E0()
{
  return MEMORY[0x24BDEF8C0]();
}

uint64_t sub_20DE206EC()
{
  return MEMORY[0x24BDEF8D0]();
}

uint64_t sub_20DE206F8()
{
  return MEMORY[0x24BDEFC98]();
}

uint64_t sub_20DE20704()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_20DE20710()
{
  return MEMORY[0x24BDF0138]();
}

uint64_t sub_20DE2071C()
{
  return MEMORY[0x24BDF0200]();
}

uint64_t sub_20DE20728()
{
  return MEMORY[0x24BDF0210]();
}

uint64_t sub_20DE20734()
{
  return MEMORY[0x24BDF0220]();
}

uint64_t sub_20DE20740()
{
  return MEMORY[0x24BDF0230]();
}

uint64_t sub_20DE2074C()
{
  return MEMORY[0x24BDF1088]();
}

uint64_t sub_20DE20758()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_20DE20764()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_20DE20770()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_20DE2077C()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_20DE20788()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_20DE20794()
{
  return MEMORY[0x24BDF1560]();
}

uint64_t sub_20DE207A0()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_20DE207AC()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_20DE207B8()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_20DE207C4()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_20DE207D0()
{
  return MEMORY[0x24BDF16E8]();
}

uint64_t sub_20DE207DC()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_20DE207E8()
{
  return MEMORY[0x24BDF1768]();
}

uint64_t sub_20DE207F4()
{
  return MEMORY[0x24BDF1798]();
}

uint64_t sub_20DE20800()
{
  return MEMORY[0x24BDF17F8]();
}

uint64_t sub_20DE2080C()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_20DE20818()
{
  return MEMORY[0x24BDF1900]();
}

uint64_t sub_20DE20824()
{
  return MEMORY[0x24BDF1A00]();
}

uint64_t sub_20DE20830()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_20DE2083C()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_20DE20848()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_20DE20854()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_20DE20860()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_20DE2086C()
{
  return MEMORY[0x24BDB8358]();
}

uint64_t sub_20DE20878()
{
  return MEMORY[0x24BDB8378]();
}

uint64_t sub_20DE20884()
{
  return MEMORY[0x24BDB8398]();
}

uint64_t sub_20DE20890()
{
  return MEMORY[0x24BDB83A8]();
}

uint64_t sub_20DE2089C()
{
  return MEMORY[0x24BDB83D8]();
}

uint64_t sub_20DE208A8()
{
  return MEMORY[0x24BDB83F8]();
}

uint64_t sub_20DE208B4()
{
  return MEMORY[0x24BDF2078]();
}

uint64_t sub_20DE208C0()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_20DE208CC()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_20DE208D8()
{
  return MEMORY[0x24BDF2170]();
}

uint64_t sub_20DE208E4()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_20DE208F0()
{
  return MEMORY[0x24BDF23E0]();
}

uint64_t sub_20DE208FC()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_20DE20908()
{
  return MEMORY[0x24BDF2B50]();
}

uint64_t sub_20DE20914()
{
  return MEMORY[0x24BDF2B70]();
}

uint64_t sub_20DE20920()
{
  return MEMORY[0x24BDF3178]();
}

uint64_t sub_20DE2092C()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_20DE20938()
{
  return MEMORY[0x24BDF3900]();
}

uint64_t sub_20DE20944()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_20DE20950()
{
  return MEMORY[0x24BDF3C50]();
}

uint64_t sub_20DE2095C()
{
  return MEMORY[0x24BDF3C78]();
}

uint64_t sub_20DE20968()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_20DE20974()
{
  return MEMORY[0x24BDF3CE0]();
}

uint64_t sub_20DE20980()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_20DE2098C()
{
  return MEMORY[0x24BDF3D18]();
}

uint64_t sub_20DE20998()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_20DE209A4()
{
  return MEMORY[0x24BDF3D60]();
}

uint64_t sub_20DE209B0()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_20DE209BC()
{
  return MEMORY[0x24BDF3E88]();
}

uint64_t sub_20DE209C8()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_20DE209D4()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_20DE209E0()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_20DE209EC()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_20DE209F8()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_20DE20A04()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_20DE20A10()
{
  return MEMORY[0x24BDF4150]();
}

uint64_t sub_20DE20A1C()
{
  return MEMORY[0x24BDF4170]();
}

uint64_t sub_20DE20A28()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_20DE20A34()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_20DE20A40()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_20DE20A4C()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_20DE20A58()
{
  return MEMORY[0x24BDF42C0]();
}

uint64_t sub_20DE20A64()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_20DE20A70()
{
  return MEMORY[0x24BDF4470]();
}

uint64_t sub_20DE20A7C()
{
  return MEMORY[0x24BDF4480]();
}

uint64_t sub_20DE20A88()
{
  return MEMORY[0x24BDF4518]();
}

uint64_t sub_20DE20A94()
{
  return MEMORY[0x24BDF46D8]();
}

uint64_t sub_20DE20AA0()
{
  return MEMORY[0x24BDF46E0]();
}

uint64_t sub_20DE20AAC()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_20DE20AB8()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_20DE20AC4()
{
  return MEMORY[0x24BDF47C8]();
}

uint64_t sub_20DE20AD0()
{
  return MEMORY[0x24BDF47E0]();
}

uint64_t sub_20DE20ADC()
{
  return MEMORY[0x24BDF4808]();
}

uint64_t sub_20DE20AE8()
{
  return MEMORY[0x24BDF4870]();
}

uint64_t sub_20DE20AF4()
{
  return MEMORY[0x24BDF4908]();
}

uint64_t sub_20DE20B00()
{
  return MEMORY[0x24BDF4918]();
}

uint64_t sub_20DE20B0C()
{
  return MEMORY[0x24BDB8480]();
}

uint64_t sub_20DE20B18()
{
  return MEMORY[0x24BDB8488]();
}

uint64_t sub_20DE20B24()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_20DE20B30()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_20DE20B3C()
{
  return MEMORY[0x24BDF4A28]();
}

uint64_t sub_20DE20B48()
{
  return MEMORY[0x24BDF4AA0]();
}

uint64_t sub_20DE20B54()
{
  return MEMORY[0x24BDF4AB8]();
}

uint64_t sub_20DE20B60()
{
  return MEMORY[0x24BDF4AC8]();
}

uint64_t sub_20DE20B6C()
{
  return MEMORY[0x24BDF4B70]();
}

uint64_t sub_20DE20B78()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_20DE20B84()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_20DE20B90()
{
  return MEMORY[0x24BDF4F38]();
}

uint64_t sub_20DE20B9C()
{
  return MEMORY[0x24BDF4F98]();
}

uint64_t sub_20DE20BA8()
{
  return MEMORY[0x24BDF5010]();
}

uint64_t sub_20DE20BB4()
{
  return MEMORY[0x24BDF53F0]();
}

uint64_t sub_20DE20BC0()
{
  return MEMORY[0x24BDF5418]();
}

uint64_t sub_20DE20BCC()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_20DE20BD8()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_20DE20BE4()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_20DE20BF0()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_20DE20BFC()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_20DE20C08()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_20DE20C14()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_20DE20C20()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_20DE20C2C()
{
  return MEMORY[0x24BEE07E8]();
}

uint64_t sub_20DE20C38()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_20DE20C44()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_20DE20C50()
{
  return MEMORY[0x24BDCF910]();
}

uint64_t sub_20DE20C5C()
{
  return MEMORY[0x24BDCF930]();
}

uint64_t sub_20DE20C68()
{
  return MEMORY[0x24BDCF938]();
}

uint64_t sub_20DE20C74()
{
  return MEMORY[0x24BDCF948]();
}

uint64_t sub_20DE20C80()
{
  return MEMORY[0x24BDCF968]();
}

uint64_t sub_20DE20C8C()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_20DE20C98()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_20DE20CA4()
{
  return MEMORY[0x24BDCF9F0]();
}

uint64_t sub_20DE20CB0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_20DE20CBC()
{
  return MEMORY[0x24BDCFA60]();
}

uint64_t sub_20DE20CC8()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_20DE20CD4()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_20DE20CE0()
{
  return MEMORY[0x24BEE0A20]();
}

uint64_t sub_20DE20CEC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_20DE20CF8()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_20DE20D04()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_20DE20D10()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_20DE20D1C()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_20DE20D28()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_20DE20D34()
{
  return MEMORY[0x24BEE0F40]();
}

uint64_t sub_20DE20D40()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_20DE20D4C()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_20DE20D58()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_20DE20D64()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_20DE20D70()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_20DE20D7C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_20DE20D88()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_20DE20D94()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_20DE20DA0()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_20DE20DAC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_20DE20DB8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_20DE20DC4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_20DE20DD0()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_20DE20DDC()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_20DE20DE8()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_20DE20DF4()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_20DE20E00()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_20DE20E0C()
{
  return MEMORY[0x24BEE1DB8]();
}

uint64_t sub_20DE20E18()
{
  return MEMORY[0x24BEE1E60]();
}

uint64_t sub_20DE20E24()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_20DE20E30()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_20DE20E3C()
{
  return MEMORY[0x24BEE2090]();
}

uint64_t sub_20DE20E48()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_20DE20E54()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_20DE20E60()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_20DE20E6C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_20DE20E78()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_20DE20E84()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_20DE20E90()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_20DE20E9C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_20DE20EA8()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_20DE20EB4()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_20DE20EC0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_20DE20ECC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_20DE20ED8()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_20DE20EE4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_20DE20EF0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_20DE20EFC()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_20DE20F08()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_20DE20F14()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_20DE20F20()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_20DE20F2C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_20DE20F38()
{
  return MEMORY[0x24BEE4328]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x24BEE4E00]();
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

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
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

